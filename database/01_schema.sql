CREATE TABLE IF NOT EXISTS users (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(120) NOT NULL,
  email VARCHAR(190) NOT NULL UNIQUE,
  phone VARCHAR(30) NULL,
  profile_photo VARCHAR(255) NULL,
  address VARCHAR(190) NULL,
  division VARCHAR(120) NULL,
  main_crop VARCHAR(80) NULL,
  total_area DECIMAL(12,2) NULL,
  bio TEXT NULL,
  role ENUM('petani', 'admin') NOT NULL DEFAULT 'petani',
  status ENUM('aktif', 'validasi', 'nonaktif') NOT NULL DEFAULT 'aktif',
  password_hash VARCHAR(255) NOT NULL,
  last_login_at DATETIME NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX idx_users_role_status (role, status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS tanaman (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nama VARCHAR(120) NOT NULL,
  slug VARCHAR(140) NOT NULL UNIQUE,
  kategori VARCHAR(80) NULL,
  masa_panen_hari INT UNSIGNED NOT NULL,
  deskripsi TEXT NULL,
  gambar_url VARCHAR(255) NULL,
  status ENUM('aktif', 'nonaktif') NOT NULL DEFAULT 'aktif',
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY uq_tanaman_nama (nama),
  INDEX idx_tanaman_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS lahan (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  nama_lahan VARCHAR(120) NOT NULL,
  kode_lahan VARCHAR(50) NULL,
  luas DECIMAL(12,2) NULL COMMENT 'Luas input manual dalam hektar',
  tanaman_id INT UNSIGNED NULL,
  komoditas VARCHAR(120) NULL,
  lokasi VARCHAR(190) NULL,
  status ENUM('persiapan', 'aktif', 'menjelang_panen', 'inspeksi', 'selesai') NOT NULL DEFAULT 'aktif',
  latitude DECIMAL(10,8) NULL,
  longitude DECIMAL(11,8) NULL,
  polygon_area JSON NULL,
  luas_lahan DECIMAL(14,2) NULL COMMENT 'Luas hasil hitung polygon dalam meter persegi',
  deleted_at DATETIME NULL,
  catatan TEXT NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_lahan_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  CONSTRAINT fk_lahan_tanaman FOREIGN KEY (tanaman_id) REFERENCES tanaman(id) ON DELETE SET NULL,
  UNIQUE KEY uq_lahan_user_nama (user_id, nama_lahan),
  INDEX idx_lahan_user_status (user_id, status),
  INDEX idx_lahan_deleted_at (deleted_at),
  INDEX idx_lahan_komoditas (komoditas)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS musim_tanam (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  lahan_id INT UNSIGNED NOT NULL,
  tanaman_id INT UNSIGNED NULL,
  kode_musim VARCHAR(30) NOT NULL,
  nama_musim VARCHAR(120) NULL,
  tanggal_tanam DATE NOT NULL,
  estimasi_panen DATE NULL,
  tanggal_panen DATE NULL,
  fase ENUM('persiapan', 'vegetatif', 'generatif', 'generatif_akhir', 'panen', 'selesai', 'gagal') NOT NULL DEFAULT 'persiapan',
  progress TINYINT UNSIGNED NOT NULL DEFAULT 0,
  status ENUM('aktif', 'selesai', 'dibatalkan') NOT NULL DEFAULT 'aktif',
  catatan TEXT NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_musim_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  CONSTRAINT fk_musim_lahan FOREIGN KEY (lahan_id) REFERENCES lahan(id) ON DELETE CASCADE,
  CONSTRAINT fk_musim_tanaman FOREIGN KEY (tanaman_id) REFERENCES tanaman(id) ON DELETE SET NULL,
  UNIQUE KEY uq_musim_lahan_kode (lahan_id, kode_musim),
  INDEX idx_musim_user_status (user_id, status),
  INDEX idx_musim_lahan (lahan_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS biaya_produksi (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  lahan_id INT UNSIGNED NOT NULL,
  musim_tanam_id INT UNSIGNED NULL,
  tanggal DATE NOT NULL,
  kategori ENUM('benih', 'pupuk', 'pestisida', 'tenaga_kerja', 'irigasi', 'alat', 'transportasi', 'lainnya') NOT NULL,
  deskripsi VARCHAR(190) NOT NULL,
  jumlah DECIMAL(14,2) NOT NULL DEFAULT 0,
  satuan VARCHAR(30) NULL,
  harga_satuan DECIMAL(14,2) NULL,
  total_biaya DECIMAL(14,2) NOT NULL,
  bukti_url VARCHAR(255) NULL,
  catatan TEXT NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_biaya_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  CONSTRAINT fk_biaya_lahan FOREIGN KEY (lahan_id) REFERENCES lahan(id) ON DELETE CASCADE,
  CONSTRAINT fk_biaya_musim FOREIGN KEY (musim_tanam_id) REFERENCES musim_tanam(id) ON DELETE SET NULL,
  INDEX idx_biaya_user_tanggal (user_id, tanggal),
  INDEX idx_biaya_musim_kategori (musim_tanam_id, kategori)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE IF NOT EXISTS hasil_panen (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  lahan_id INT UNSIGNED NOT NULL,
  musim_tanam_id INT UNSIGNED NULL,
  tanggal_panen DATE NOT NULL,
  komoditas VARCHAR(120) NOT NULL,
  berat_kg DECIMAL(14,2) NOT NULL,
  harga_per_kg DECIMAL(14,2) NOT NULL,
  total_pendapatan DECIMAL(14,2) NOT NULL,
  kualitas ENUM('premium', 'baik', 'sedang', 'rendah') NOT NULL DEFAULT 'baik',
  status ENUM('draft', 'menunggu_cek', 'terverifikasi') NOT NULL DEFAULT 'draft',
  pembeli VARCHAR(120) NULL,
  catatan TEXT NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_panen_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  CONSTRAINT fk_panen_lahan FOREIGN KEY (lahan_id) REFERENCES lahan(id) ON DELETE CASCADE,
  CONSTRAINT fk_panen_musim FOREIGN KEY (musim_tanam_id) REFERENCES musim_tanam(id) ON DELETE SET NULL,
  UNIQUE KEY uq_hasil_panen_musim (musim_tanam_id),
  INDEX idx_panen_user_tanggal (user_id, tanggal_panen),
  INDEX idx_panen_musim (musim_tanam_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS monitoring_lahan (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  lahan_id INT UNSIGNED NOT NULL,
  reporter_user_id INT UNSIGNED NULL,
  kategori ENUM('hama', 'penyakit', 'cuaca', 'irigasi', 'input_telat', 'data_kosong', 'lainnya') NOT NULL,
  severity ENUM('rendah', 'sedang', 'tinggi') NOT NULL DEFAULT 'sedang',
  status ENUM('terbuka', 'diproses', 'selesai') NOT NULL DEFAULT 'terbuka',
  deskripsi TEXT NOT NULL,
  rekomendasi TEXT NULL,
  tanggal_temuan DATE NOT NULL,
  resolved_at DATETIME NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_monitoring_lahan FOREIGN KEY (lahan_id) REFERENCES lahan(id) ON DELETE CASCADE,
  CONSTRAINT fk_monitoring_reporter FOREIGN KEY (reporter_user_id) REFERENCES users(id) ON DELETE SET NULL,
  INDEX idx_monitoring_status_severity (status, severity),
  INDEX idx_monitoring_lahan (lahan_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS aktivitas (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  lahan_id INT UNSIGNED NULL,
  musim_tanam_id INT UNSIGNED NULL,
  tipe ENUM('irigasi', 'input_biaya', 'panen', 'peringatan', 'analisis', 'login', 'lainnya') NOT NULL DEFAULT 'lainnya',
  judul VARCHAR(160) NOT NULL,
  deskripsi TEXT NULL,
  nominal DECIMAL(14,2) NULL,
  terjadi_pada DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_aktivitas_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  CONSTRAINT fk_aktivitas_lahan FOREIGN KEY (lahan_id) REFERENCES lahan(id) ON DELETE SET NULL,
  CONSTRAINT fk_aktivitas_musim FOREIGN KEY (musim_tanam_id) REFERENCES musim_tanam(id) ON DELETE SET NULL,
  INDEX idx_aktivitas_user_waktu (user_id, terjadi_pada),
  INDEX idx_aktivitas_tipe (tipe)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS notifikasi (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  judul VARCHAR(160) NOT NULL,
  pesan TEXT NOT NULL,
  tipe ENUM('info', 'sukses', 'peringatan', 'bahaya') NOT NULL DEFAULT 'info',
  dibaca_at DATETIME NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_notifikasi_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  INDEX idx_notifikasi_user_read (user_id, dibaca_at)
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

CREATE OR REPLACE VIEW v_lahan_monitoring_admin AS
SELECT
  l.id AS lahan_id,
  l.nama_lahan,
  l.komoditas,
  l.lokasi,
  l.status AS status_lahan,
  u.id AS user_id,
  u.name AS nama_petani,
  m.kategori AS kategori_monitoring,
  m.severity,
  m.status AS status_monitoring,
  m.tanggal_temuan
FROM lahan l
JOIN users u ON u.id = l.user_id
LEFT JOIN monitoring_lahan m ON m.lahan_id = l.id AND m.status <> 'selesai';
