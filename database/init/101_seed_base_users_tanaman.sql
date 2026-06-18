INSERT INTO users (name, email, phone, profile_photo, address, division, main_crop, total_area, role, status, password_hash)
VALUES
('Admin Root', 'admin@agrotrack.com', '081298765432', 'assets/image/profil/foto_profil_6.jpg', 'Surabaya, Jawa Timur', 'Operasional Platform', NULL, NULL, 'admin', 'aktif', '$2y$10$uK9.ecR/LaItdL1tducqQuShNJISZ4zpIOBnoUQYOrUpXWtsNZdiu'),
('Petani Demo', 'petani@agrotrack.test', '081234567890', 'assets/image/profil/farmer-profile.jpg', 'Sidoarjo, Jawa Timur', 'Kelompok Tani Digital', 'Padi', 12.80, 'petani', 'aktif', '$2y$10$CrF7Q9zPPMC0ZETq2LnBEukujmJcpCrDV.wiBrktaqOACtzlnQVa2')
ON DUPLICATE KEY UPDATE name=VALUES(name), password_hash=VALUES(password_hash), status='aktif';

INSERT INTO tanaman (nama, slug, kategori, masa_panen_hari, deskripsi, gambar_url, status) VALUES
('Padi Ciherang', 'padi-ciherang', 'Padi', 110, 'Padi sawah produktif untuk musim hujan.', 'assets/image/gambar_tanaman/gambar_padi_1.jpg', 'aktif'),
('Jagung Hibrida', 'jagung-hibrida', 'Jagung', 100, 'Jagung hibrida untuk lahan kering.', 'assets/image/gambar_tanaman/gambar_jagung_1.jpg', 'aktif'),
('Kedelai Anjasmoro', 'kedelai-anjasmoro', 'Kedelai', 85, 'Kedelai rotasi dengan masa panen cepat.', 'assets/image/gambar_tanaman/gambar_kedelai_1.jpg', 'aktif')
ON DUPLICATE KEY UPDATE masa_panen_hari=VALUES(masa_panen_hari), status='aktif';

