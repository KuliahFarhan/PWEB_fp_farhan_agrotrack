USE agrotrack;

SET @add_deleted_at := IF (
  EXISTS (
    SELECT 1
    FROM information_schema.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = 'lahan'
      AND COLUMN_NAME = 'deleted_at'
  ),
  'SELECT 1',
  'ALTER TABLE lahan ADD COLUMN deleted_at DATETIME NULL AFTER luas_lahan'
);
PREPARE stmt_add_deleted_at FROM @add_deleted_at;
EXECUTE stmt_add_deleted_at;
DEALLOCATE PREPARE stmt_add_deleted_at;

SET @add_deleted_index := IF (
  EXISTS (
    SELECT 1
    FROM information_schema.STATISTICS
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = 'lahan'
      AND INDEX_NAME = 'idx_lahan_deleted_at'
  ),
  'SELECT 1',
  'CREATE INDEX idx_lahan_deleted_at ON lahan (deleted_at)'
);
PREPARE stmt_add_deleted_index FROM @add_deleted_index;
EXECUTE stmt_add_deleted_index;
DEALLOCATE PREPARE stmt_add_deleted_index;
