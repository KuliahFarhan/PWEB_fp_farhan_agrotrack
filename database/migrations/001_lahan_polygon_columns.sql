CREATE TABLE IF NOT EXISTS users (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(120) NOT NULL,
  email VARCHAR(190) NOT NULL UNIQUE,
  profile_photo VARCHAR(255) NULL,
  role ENUM('petani', 'admin') NOT NULL DEFAULT 'petani',
  password_hash VARCHAR(255) NOT NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS lahan (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  nama_lahan VARCHAR(120) NOT NULL,
  luas DECIMAL(12,2) NULL,
  komoditas VARCHAR(120) NULL,
  lokasi VARCHAR(190) NULL,
  latitude DECIMAL(10,8) NULL,
  longitude DECIMAL(11,8) NULL,
  polygon_area JSON NULL,
  luas_lahan DECIMAL(14,2) NULL COMMENT 'Luas hasil hitung polygon dalam meter persegi',
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX idx_lahan_user_id (user_id),
  CONSTRAINT fk_lahan_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SET @db_name = DATABASE();

SET @sql = (
  SELECT IF(COUNT(*) = 0,
    'ALTER TABLE users ADD COLUMN profile_photo VARCHAR(255) NULL',
    'SELECT 1'
  )
  FROM information_schema.columns
  WHERE table_schema = @db_name AND table_name = 'users' AND column_name = 'profile_photo'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @sql = (
  SELECT IF(COUNT(*) = 0,
    'ALTER TABLE lahan ADD COLUMN user_id INT UNSIGNED NULL',
    'SELECT 1'
  )
  FROM information_schema.columns
  WHERE table_schema = @db_name AND table_name = 'lahan' AND column_name = 'user_id'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @sql = (
  SELECT IF(COUNT(*) = 0,
    'ALTER TABLE lahan ADD COLUMN latitude DECIMAL(10,8) NULL',
    'SELECT 1'
  )
  FROM information_schema.columns
  WHERE table_schema = @db_name AND table_name = 'lahan' AND column_name = 'latitude'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @sql = (
  SELECT IF(COUNT(*) = 0,
    'ALTER TABLE lahan ADD COLUMN longitude DECIMAL(11,8) NULL',
    'SELECT 1'
  )
  FROM information_schema.columns
  WHERE table_schema = @db_name AND table_name = 'lahan' AND column_name = 'longitude'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @sql = (
  SELECT IF(COUNT(*) = 0,
    'ALTER TABLE lahan ADD COLUMN polygon_area JSON NULL',
    'SELECT 1'
  )
  FROM information_schema.columns
  WHERE table_schema = @db_name AND table_name = 'lahan' AND column_name = 'polygon_area'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @sql = (
  SELECT IF(COUNT(*) = 0,
    'ALTER TABLE lahan ADD COLUMN luas_lahan DECIMAL(14,2) NULL COMMENT ''Luas hasil hitung polygon dalam meter persegi''',
    'SELECT 1'
  )
  FROM information_schema.columns
  WHERE table_schema = @db_name AND table_name = 'lahan' AND column_name = 'luas_lahan'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

INSERT INTO users (name, email, role, password_hash)
VALUES
  ('Budi Santoso', 'petani@agrotrack.test', 'petani', '$2y$10$Qm2H4jokCF.H6PrZAdI8Y.6XZdXwKSbU3o/VJKbxI/Gjzmi6H5o3K'),
  ('Admin Root', 'admin@agrotrack.test', 'admin', '$2y$10$Qm2H4jokCF.H6PrZAdI8Y.6XZdXwKSbU3o/VJKbxI/Gjzmi6H5o3K')
ON DUPLICATE KEY UPDATE
  name = VALUES(name),
  role = VALUES(role),
  updated_at = CURRENT_TIMESTAMP;

SET @petani_demo_id = (SELECT id FROM users WHERE email = 'petani@agrotrack.test' LIMIT 1);

UPDATE lahan
SET user_id = @petani_demo_id
WHERE user_id IS NULL;

INSERT INTO lahan (user_id, nama_lahan, luas, komoditas, lokasi)
SELECT @petani_demo_id, 'Sawah B-12', 4.20, 'Padi Ciherang', 'Desa Sumber Rejo'
WHERE NOT EXISTS (SELECT 1 FROM lahan WHERE user_id = @petani_demo_id AND nama_lahan = 'Sawah B-12');

INSERT INTO lahan (user_id, nama_lahan, luas, komoditas, lokasi)
SELECT @petani_demo_id, 'Blok A-03', 3.10, 'Jagung Hibrida', 'Desa Karang Asem'
WHERE NOT EXISTS (SELECT 1 FROM lahan WHERE user_id = @petani_demo_id AND nama_lahan = 'Blok A-03');

INSERT INTO lahan (user_id, nama_lahan, luas, komoditas, lokasi)
SELECT @petani_demo_id, 'Kebun C-01', 1.80, 'Cabai Merah', 'Desa Wonosari'
WHERE NOT EXISTS (SELECT 1 FROM lahan WHERE user_id = @petani_demo_id AND nama_lahan = 'Kebun C-01');

INSERT INTO lahan (user_id, nama_lahan, luas, komoditas, lokasi)
SELECT @petani_demo_id, 'Sawah D-04', 3.70, 'Padi Inpari', 'Desa Puger'
WHERE NOT EXISTS (SELECT 1 FROM lahan WHERE user_id = @petani_demo_id AND nama_lahan = 'Sawah D-04');
