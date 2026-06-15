USE agrotrack;

SET @db_name := DATABASE();

SET @sql := IF(
  NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_schema = @db_name AND table_name = 'users' AND column_name = 'address'
  ),
  'ALTER TABLE users ADD COLUMN address VARCHAR(190) NULL AFTER profile_photo',
  'SELECT "users.address already exists"'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql := IF(
  NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_schema = @db_name AND table_name = 'users' AND column_name = 'division'
  ),
  'ALTER TABLE users ADD COLUMN division VARCHAR(120) NULL AFTER address',
  'SELECT "users.division already exists"'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql := IF(
  NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_schema = @db_name AND table_name = 'users' AND column_name = 'main_crop'
  ),
  'ALTER TABLE users ADD COLUMN main_crop VARCHAR(80) NULL AFTER division',
  'SELECT "users.main_crop already exists"'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql := IF(
  NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_schema = @db_name AND table_name = 'users' AND column_name = 'total_area'
  ),
  'ALTER TABLE users ADD COLUMN total_area DECIMAL(12,2) NULL AFTER main_crop',
  'SELECT "users.total_area already exists"'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql := IF(
  NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_schema = @db_name AND table_name = 'users' AND column_name = 'bio'
  ),
  'ALTER TABLE users ADD COLUMN bio TEXT NULL AFTER total_area',
  'SELECT "users.bio already exists"'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

UPDATE users
SET
  address = COALESCE(address, CASE WHEN role = 'petani' THEN 'Sidoarjo, Jawa Timur' ELSE 'Surabaya, Jawa Timur' END),
  division = COALESCE(division, CASE WHEN role = 'admin' THEN 'Operasional Platform' ELSE 'Kelompok Tani Digital' END),
  main_crop = COALESCE(main_crop, CASE WHEN role = 'petani' THEN 'Padi' ELSE NULL END),
  total_area = COALESCE(total_area, CASE WHEN role = 'petani' THEN 12.80 ELSE NULL END)
WHERE role IN ('petani', 'admin');
