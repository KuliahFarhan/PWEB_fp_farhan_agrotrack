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
