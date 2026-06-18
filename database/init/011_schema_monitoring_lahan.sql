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
