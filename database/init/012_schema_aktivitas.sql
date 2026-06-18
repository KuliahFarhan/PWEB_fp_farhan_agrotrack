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
