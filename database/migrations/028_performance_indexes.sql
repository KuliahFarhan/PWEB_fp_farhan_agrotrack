SET @idx := (
  SELECT COUNT(*) FROM information_schema.statistics
  WHERE table_schema = DATABASE() AND table_name = 'users' AND index_name = 'idx_users_created_at'
);
SET @sql := IF(@idx = 0, 'CREATE INDEX idx_users_created_at ON users (created_at)', 'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @idx := (
  SELECT COUNT(*) FROM information_schema.statistics
  WHERE table_schema = DATABASE() AND table_name = 'lahan' AND index_name = 'idx_lahan_deleted_updated'
);
SET @sql := IF(@idx = 0, 'CREATE INDEX idx_lahan_deleted_updated ON lahan (deleted_at, updated_at)', 'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @idx := (
  SELECT COUNT(*) FROM information_schema.statistics
  WHERE table_schema = DATABASE() AND table_name = 'musim_tanam' AND index_name = 'idx_musim_user_tanggal'
);
SET @sql := IF(@idx = 0, 'CREATE INDEX idx_musim_user_tanggal ON musim_tanam (user_id, tanggal_tanam)', 'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @idx := (
  SELECT COUNT(*) FROM information_schema.statistics
  WHERE table_schema = DATABASE() AND table_name = 'musim_tanam' AND index_name = 'idx_musim_tanggal'
);
SET @sql := IF(@idx = 0, 'CREATE INDEX idx_musim_tanggal ON musim_tanam (tanggal_tanam)', 'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @idx := (
  SELECT COUNT(*) FROM information_schema.statistics
  WHERE table_schema = DATABASE() AND table_name = 'biaya_produksi' AND index_name = 'idx_biaya_user_kategori'
);
SET @sql := IF(@idx = 0, 'CREATE INDEX idx_biaya_user_kategori ON biaya_produksi (user_id, kategori)', 'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @idx := (
  SELECT COUNT(*) FROM information_schema.statistics
  WHERE table_schema = DATABASE() AND table_name = 'katalog_items' AND index_name = 'idx_katalog_active_nama'
);
SET @sql := IF(@idx = 0, 'CREATE INDEX idx_katalog_active_nama ON katalog_items (is_active, nama)', 'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @idx := (
  SELECT COUNT(*) FROM information_schema.statistics
  WHERE table_schema = DATABASE() AND table_name = 'biaya_operasional' AND index_name = 'idx_biaya_ops_user_kategori'
);
SET @sql := IF(@idx = 0, 'CREATE INDEX idx_biaya_ops_user_kategori ON biaya_operasional (user_id, kategori)', 'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @idx := (
  SELECT COUNT(*) FROM information_schema.statistics
  WHERE table_schema = DATABASE() AND table_name = 'biaya_operasional' AND index_name = 'idx_biaya_ops_tanggal'
);
SET @sql := IF(@idx = 0, 'CREATE INDEX idx_biaya_ops_tanggal ON biaya_operasional (tanggal)', 'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
