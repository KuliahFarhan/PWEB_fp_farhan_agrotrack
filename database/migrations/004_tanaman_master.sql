USE agrotrack;

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

SET @db_name := DATABASE();
SET @sql := IF(
  NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema = @db_name AND table_name = 'lahan' AND column_name = 'tanaman_id'),
  'ALTER TABLE lahan ADD COLUMN tanaman_id INT UNSIGNED NULL AFTER luas',
  'SELECT "lahan.tanaman_id already exists"'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @sql := IF(
  NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema = @db_name AND table_name = 'musim_tanam' AND column_name = 'tanaman_id'),
  'ALTER TABLE musim_tanam ADD COLUMN tanaman_id INT UNSIGNED NULL AFTER lahan_id',
  'SELECT "musim_tanam.tanaman_id already exists"'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

INSERT INTO tanaman (nama, slug, kategori, masa_panen_hari, deskripsi, gambar_url, status) VALUES
('Padi Ciherang', 'padi-ciherang', 'Padi', 110, 'Padi sawah produktif untuk musim hujan.', 'assets/image/gambar_tanaman/gambar_padi_1.jpg', 'aktif'),
('Jagung Hibrida', 'jagung-hibrida', 'Jagung', 100, 'Jagung hibrida untuk lahan kering.', 'assets/image/gambar_tanaman/gambar_jagung_1.jpg', 'aktif'),
('Kedelai Anjasmoro', 'kedelai-anjasmoro', 'Kedelai', 85, 'Kedelai rotasi dengan masa panen cepat.', 'assets/image/gambar_tanaman/gambar_kedelai_1.jpg', 'aktif')
ON DUPLICATE KEY UPDATE masa_panen_hari = VALUES(masa_panen_hari), status = VALUES(status);

UPDATE lahan l
JOIN tanaman t ON LOWER(l.komoditas) LIKE CONCAT('%', LOWER(SUBSTRING_INDEX(t.kategori, ' ', 1)), '%')
SET l.tanaman_id = t.id
WHERE l.tanaman_id IS NULL;
