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
