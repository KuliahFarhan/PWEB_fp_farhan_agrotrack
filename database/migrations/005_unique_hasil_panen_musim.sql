USE agrotrack;

SET @db_name := DATABASE();
SET @sql := IF(
  NOT EXISTS (
    SELECT 1 FROM information_schema.statistics
    WHERE table_schema = @db_name
      AND table_name = 'hasil_panen'
      AND index_name = 'uq_hasil_panen_musim'
  ),
  'ALTER TABLE hasil_panen ADD UNIQUE KEY uq_hasil_panen_musim (musim_tanam_id)',
  'SELECT "uq_hasil_panen_musim already exists"'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
