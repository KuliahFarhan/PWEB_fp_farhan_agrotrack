USE agrotrack;

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

UPDATE users
SET profile_photo = CASE
  WHEN email = 'petani@agrotrack.test' THEN 'assets/image/profil/farmer-profile.jpg'
  WHEN email = 'admin@agrotrack.test' THEN 'assets/image/profil/foto_profil_6.jpg'
  WHEN email = 'siti@agrotrack.test' THEN 'assets/image/profil/foto_profiil_2.jpg'
  WHEN email = 'raka@agrotrack.test' THEN 'assets/image/profil/foto_profil_3.jpg'
  ELSE profile_photo
END
WHERE email IN ('petani@agrotrack.test', 'admin@agrotrack.test', 'siti@agrotrack.test', 'raka@agrotrack.test');
