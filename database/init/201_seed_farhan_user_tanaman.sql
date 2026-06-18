INSERT INTO users (name, email, phone, profile_photo, address, division, main_crop, total_area, bio, role, status, password_hash)
VALUES (
  'Muhammad Farhan',
  'muhammadfarhanmonggot@gmail.com',
  '081357889087',
  'assets/image/profil/farmer-profile.jpg',
  'Gedangan, Sidoarjo, Jawa Timur',
  'Usaha Tani Jagung',
  'Jagung',
  3.36,
  'Akun dummy deploy untuk uji dashboard petani, biaya operasional, panen, dan profit.',
  'petani',
  'aktif',
  '$2y$10$CrF7Q9zPPMC0ZETq2LnBEukujmJcpCrDV.wiBrktaqOACtzlnQVa2'
)
ON DUPLICATE KEY UPDATE
  name = VALUES(name),
  phone = VALUES(phone),
  profile_photo = VALUES(profile_photo),
  address = VALUES(address),
  division = VALUES(division),
  main_crop = VALUES(main_crop),
  total_area = VALUES(total_area),
  bio = VALUES(bio),
  role = VALUES(role),
  status = VALUES(status),
  password_hash = VALUES(password_hash);

INSERT INTO tanaman (nama, slug, kategori, masa_panen_hari, deskripsi, gambar_url, status)
VALUES
  ('Padi Ciherang', 'padi-ciherang', 'Padi', 110, 'Padi sawah produktif untuk musim hujan.', 'assets/image/gambar_tanaman/gambar_padi_1.jpg', 'aktif'),
  ('Jagung Bima URI / Bima 20 URI', 'jagung-bima-uri-bima-20-uri', 'Jagung', 100, 'Jagung hibrida untuk lahan irigasi pompa dan musim kering.', 'assets/image/gambar_tanaman/gambar_jagung_1.jpg', 'aktif'),
  ('Kedelai Anjasmoro', 'kedelai-anjasmoro', 'Kedelai', 85, 'Kedelai rotasi dengan masa panen cepat.', 'assets/image/gambar_tanaman/gambar_kedelai_1.jpg', 'aktif')
ON DUPLICATE KEY UPDATE
  kategori = VALUES(kategori),
  masa_panen_hari = VALUES(masa_panen_hari),
  deskripsi = VALUES(deskripsi),
  gambar_url = VALUES(gambar_url),
  status = VALUES(status);

