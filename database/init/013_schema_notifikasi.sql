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
