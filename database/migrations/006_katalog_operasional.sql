USE agrotrack;

CREATE TABLE IF NOT EXISTS katalog_items (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  kode VARCHAR(80) NOT NULL UNIQUE,
  kategori VARCHAR(80) NOT NULL,
  subkategori VARCHAR(120) NULL,
  nama VARCHAR(160) NOT NULL,
  slug VARCHAR(180) NOT NULL UNIQUE,
  image_path VARCHAR(255) NULL,
  komoditas VARCHAR(120) NOT NULL DEFAULT 'padi,jagung,kedelai',
  fase VARCHAR(120) NOT NULL,
  jenis_biaya VARCHAR(80) NOT NULL,
  mode_biaya VARCHAR(80) NOT NULL DEFAULT 'input_manual',
  satuan_default VARCHAR(40) NULL,
  harga_min DECIMAL(14,2) NULL,
  harga_max DECIMAL(14,2) NULL,
  harga_status VARCHAR(80) NOT NULL DEFAULT 'INPUT_MANUAL',
  sumber_referensi TEXT NULL,
  sumber_dokumen VARCHAR(190) NULL,
  tanggal_cek_harga DATE NULL,
  fungsi TEXT NULL,
  keterangan TEXT NULL,
  risiko TEXT NULL,
  admin_note TEXT NULL,
  detail_json JSON NULL,
  is_active TINYINT(1) NOT NULL DEFAULT 1,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX idx_katalog_filter (kategori, fase, is_active),
  INDEX idx_katalog_komoditas (komoditas)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS biaya_operasional (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  lahan_id INT UNSIGNED NOT NULL,
  musim_tanam_id INT UNSIGNED NOT NULL,
  katalog_item_id INT UNSIGNED NULL,
  tanggal DATE NOT NULL,
  kategori VARCHAR(80) NOT NULL,
  subkategori VARCHAR(120) NULL,
  nama_item VARCHAR(160) NOT NULL,
  mode_biaya VARCHAR(80) NOT NULL DEFAULT 'input_manual',
  jumlah DECIMAL(14,2) NOT NULL DEFAULT 1,
  satuan VARCHAR(40) NOT NULL DEFAULT 'unit',
  harga_satuan DECIMAL(14,2) NOT NULL DEFAULT 0,
  total_biaya DECIMAL(14,2) NOT NULL DEFAULT 0,
  catatan TEXT NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_biaya_ops_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  CONSTRAINT fk_biaya_ops_lahan FOREIGN KEY (lahan_id) REFERENCES lahan(id) ON DELETE CASCADE,
  CONSTRAINT fk_biaya_ops_musim FOREIGN KEY (musim_tanam_id) REFERENCES musim_tanam(id) ON DELETE CASCADE,
  CONSTRAINT fk_biaya_ops_katalog FOREIGN KEY (katalog_item_id) REFERENCES katalog_items(id) ON DELETE SET NULL,
  INDEX idx_biaya_ops_user_tanggal (user_id, tanggal),
  INDEX idx_biaya_ops_musim (musim_tanam_id),
  INDEX idx_biaya_ops_kategori (kategori)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS modal_sumber (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  musim_tanam_id INT UNSIGNED NULL,
  katalog_item_id INT UNSIGNED NULL,
  tanggal DATE NOT NULL,
  nama_sumber VARCHAR(160) NOT NULL,
  jenis_modal ENUM('modal_sendiri','pinjaman','talangan','hibah','lainnya') NOT NULL DEFAULT 'modal_sendiri',
  nominal DECIMAL(14,2) NOT NULL DEFAULT 0,
  bunga_persen DECIMAL(6,2) NULL,
  tenor_bulan INT NULL,
  jatuh_tempo DATE NULL,
  catatan TEXT NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_modal_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  CONSTRAINT fk_modal_musim FOREIGN KEY (musim_tanam_id) REFERENCES musim_tanam(id) ON DELETE SET NULL,
  CONSTRAINT fk_modal_katalog FOREIGN KEY (katalog_item_id) REFERENCES katalog_items(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS risk_register (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  lahan_id INT UNSIGNED NULL,
  musim_tanam_id INT UNSIGNED NULL,
  katalog_item_id INT UNSIGNED NULL,
  tanggal DATE NOT NULL,
  risiko VARCHAR(160) NOT NULL,
  dampak_estimasi DECIMAL(14,2) NULL,
  status ENUM('terbuka','dipantau','selesai') NOT NULL DEFAULT 'terbuka',
  mitigasi TEXT NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_risk_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  CONSTRAINT fk_risk_lahan FOREIGN KEY (lahan_id) REFERENCES lahan(id) ON DELETE SET NULL,
  CONSTRAINT fk_risk_musim FOREIGN KEY (musim_tanam_id) REFERENCES musim_tanam(id) ON DELETE SET NULL,
  CONSTRAINT fk_risk_katalog FOREIGN KEY (katalog_item_id) REFERENCES katalog_items(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE OR REPLACE VIEW v_ringkasan_petani AS
SELECT
  u.id AS user_id,
  u.name AS nama_petani,
  COALESCE(l.total_lahan, 0) AS total_lahan,
  COALESCE(l.total_luas_manual_ha, 0) AS total_luas_manual_ha,
  COALESCE(l.total_luas_polygon_m2, 0) AS total_luas_polygon_m2,
  COALESCE(b.total_biaya, 0) AS total_biaya,
  COALESCE(h.total_pendapatan, 0) AS total_pendapatan,
  COALESCE(h.total_pendapatan, 0) - COALESCE(b.total_biaya, 0) AS total_profit
FROM users u
LEFT JOIN (
  SELECT user_id, COUNT(*) AS total_lahan, SUM(luas) AS total_luas_manual_ha, SUM(luas_lahan) AS total_luas_polygon_m2
  FROM lahan GROUP BY user_id
) l ON l.user_id = u.id
LEFT JOIN (
  SELECT user_id, SUM(total_biaya) AS total_biaya
  FROM (
    SELECT user_id, total_biaya FROM biaya_produksi
    UNION ALL
    SELECT user_id, total_biaya FROM biaya_operasional
  ) biaya_all
  GROUP BY user_id
) b ON b.user_id = u.id
LEFT JOIN (
  SELECT user_id, SUM(total_pendapatan) AS total_pendapatan FROM hasil_panen GROUP BY user_id
) h ON h.user_id = u.id
WHERE u.role = 'petani';
