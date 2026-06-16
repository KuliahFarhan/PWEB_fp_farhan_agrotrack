USE agrotrack;

INSERT INTO tanaman (nama, slug, kategori, masa_panen_hari, deskripsi, gambar_url, status) VALUES
('Padi Ciherang', 'padi-ciherang', 'Padi', 110, 'Benih padi sawah populer untuk musim tanam padi.', 'assets/image/bibit/padi-ciherang.jpg', 'aktif'),
('Padi Mekongga', 'padi-mekongga', 'Padi', 116, 'Benih padi inbrida untuk sawah dengan umur panen menengah.', 'assets/image/bibit/padi-mekongga.jpg', 'aktif'),
('Padi Inpari 32 HDB', 'padi-inpari-32-hdb', 'Padi', 120, 'Opsi benih padi inbrida untuk sawah dengan ketahanan penyakit hawar daun bakteri.', 'assets/image/bibit/padi-inpari-32.jpg', 'aktif'),
('Padi Inpari 30 Ciherang Sub 1', 'padi-inpari-30-ciherang-sub-1', 'Padi', 111, 'Benih padi sawah genjah untuk musim tanam padi.', 'assets/image/bibit/padi-inpari-30.jpg', 'aktif'),
('Padi IR64', 'padi-ir64', 'Padi', 115, 'Benih padi populer dan mudah dikenali petani.', 'assets/image/bibit/padi-ir64.jpg', 'aktif'),
('Padi Situ Bagendit', 'padi-situ-bagendit', 'Padi', 110, 'Opsi benih padi untuk lahan yang sesuai.', 'assets/image/bibit/padi-situ-bagendit.png', 'aktif'),
('Jagung Hibrida NASA 29', 'jagung-hibrida-nasa-29', 'Jagung', 105, 'Benih jagung hibrida untuk musim tanam jagung.', 'assets/image/bibit/jagung-nasa-29.jpg', 'aktif'),
('Jagung Hibrida Bima 19 URI', 'jagung-hibrida-bima-19-uri', 'Jagung', 100, 'Jagung hibrida dengan data kajian produksi jelas.', 'assets/image/bibit/jagung-bima-19.jpg', 'aktif'),
('Jagung HJ 21 Agritan', 'jagung-hj-21-agritan', 'Jagung', 100, 'Benih jagung hibrida genjah.', 'assets/image/bibit/jagung-jh-21.jpg', 'aktif'),
('Jagung Hibrida JH 45', 'jagung-hibrida-jh-45', 'Jagung', 82, 'Opsi katalog benih jagung yang dapat dipakai pada musim tanam jagung.', 'assets/image/bibit/jagung-jh-45.jpg', 'aktif'),
('Jagung Bima URI / Bima 20 URI', 'jagung-bima-uri-bima-20-uri', 'Jagung', 100, 'Opsi jagung URI dari katalog benih.', 'assets/image/bibit/jagung-bima-uri.jpg', 'aktif'),
('Jagung Sukmaraga', 'jagung-sukmaraga', 'Jagung', 105, 'Varietas jagung untuk pilihan musim tanam jagung.', 'assets/image/bibit/jagung-sukamarga.jpg', 'aktif'),
('Kedelai Anjasmoro', 'kedelai-anjasmoro', 'Kedelai', 87, 'Benih kedelai populer untuk musim tanam kedelai.', 'assets/image/bibit/kedelai-anjasmoro.jpg', 'aktif'),
('Kedelai Wilis', 'kedelai-wilis', 'Kedelai', 85, 'Opsi kedelai klasik yang umum dikenal petani.', 'assets/image/bibit/kedelai-wilis.jpg', 'aktif'),
('Kedelai Grobogan', 'kedelai-grobogan', 'Kedelai', 80, 'Kedelai berbiji besar untuk pangan olahan.', 'assets/image/bibit/kedelai-grobogan.jpg', 'aktif'),
('Kedelai Dega 1', 'kedelai-dega-1', 'Kedelai', 72, 'Opsi varietas kedelai genjah untuk musim tanam kedelai.', 'assets/image/bibit/kedelai-dega-1.jpg', 'aktif'),
('Kedelai Detap 1', 'kedelai-detap-1', 'Kedelai', 78, 'Varietas kedelai unggul modern.', 'assets/image/bibit/kedelai-detap-1.jpg', 'aktif')
ON DUPLICATE KEY UPDATE
  kategori = VALUES(kategori),
  masa_panen_hari = VALUES(masa_panen_hari),
  deskripsi = VALUES(deskripsi),
  gambar_url = VALUES(gambar_url),
  status = VALUES(status),
  updated_at = CURRENT_TIMESTAMP;
