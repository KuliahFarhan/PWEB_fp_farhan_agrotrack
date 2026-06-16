USE agrotrack;

INSERT INTO users (name, email, phone, profile_photo, address, division, role, status, password_hash)
VALUES (
  'Admin Root',
  'admin@agrotrack.com',
  '081298765432',
  'assets/image/profil/foto_profil_6.jpg',
  'Surabaya, Jawa Timur',
  'Operasional Platform',
  'admin',
  'aktif',
  '$2y$10$uK9.ecR/LaItdL1tducqQuShNJISZ4zpIOBnoUQYOrUpXWtsNZdiu'
)
ON DUPLICATE KEY UPDATE
  name = VALUES(name),
  phone = VALUES(phone),
  profile_photo = VALUES(profile_photo),
  address = VALUES(address),
  division = VALUES(division),
  role = 'admin',
  status = 'aktif',
  password_hash = VALUES(password_hash),
  updated_at = CURRENT_TIMESTAMP;

UPDATE users
SET status = 'nonaktif', updated_at = CURRENT_TIMESTAMP
WHERE email = 'admin@agrotrack.test' AND role = 'admin';
