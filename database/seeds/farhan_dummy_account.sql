USE agrotrack;

SET @user_id := (SELECT id FROM users WHERE email = 'muhammadfarhanmonggot@gmail.com' LIMIT 1);
SET @lahan_id := (SELECT id FROM lahan WHERE user_id = @user_id ORDER BY id DESC LIMIT 1);
SET @musim_id := (SELECT id FROM musim_tanam WHERE user_id = @user_id ORDER BY id DESC LIMIT 1);
SET @tanaman_id := (SELECT id FROM tanaman WHERE slug = 'jagung-bima-uri-bima-20-uri' LIMIT 1);

UPDATE users
SET name = 'Muhammad Farhan',
    phone = '081357889087',
    address = 'Gedangan, Sidoarjo, Jawa Timur',
    main_crop = 'Jagung',
    total_area = 3.36,
    bio = 'Petani jagung skala menengah dengan lahan irigasi pompa dan fokus pada pencatatan biaya operasional lengkap.',
    password_hash = '$2y$10$wlcIddcu2Jb6CzfzvO1cb.PcP1D7Cjrh9HOq7DMStRLz2e6Zn0adq',
    updated_at = CURRENT_TIMESTAMP
WHERE id = @user_id;

UPDATE lahan
SET nama_lahan = 'Lahan Jagung Farhan Blok A',
    kode_lahan = 'FAR-JG-33615',
    luas = 3.3615,
    tanaman_id = @tanaman_id,
    komoditas = 'Jagung Bima URI / Bima 20 URI',
    lokasi = 'Sekitar Gedangan, Sidoarjo, Jawa Timur',
    status = 'selesai',
    latitude = -7.28658000,
    longitude = 112.79065000,
    polygon_area = JSON_OBJECT('type','Polygon','coordinates',JSON_ARRAY(JSON_ARRAY(JSON_ARRAY(112.789862,-7.285714),JSON_ARRAY(112.789765,-7.287384),JSON_ARRAY(112.791411,-7.287400),JSON_ARRAY(112.791562,-7.285809),JSON_ARRAY(112.789862,-7.285714)))),
    luas_lahan = 33614.91,
    catatan = 'Data dummy lengkap untuk simulasi satu akun petani. Polygon diambil dari koordinat yang diberikan user dengan luas sekitar 33.614,91 m2 atau 3,3615 ha.'
WHERE id = @lahan_id;

UPDATE musim_tanam
SET lahan_id = @lahan_id,
    tanaman_id = @tanaman_id,
    kode_musim = 'MT-2026-JAGUNG-FARHAN',
    nama_musim = 'Musim Jagung Farhan 2026',
    tanggal_tanam = '2026-02-14',
    estimasi_panen = '2026-05-25',
    tanggal_panen = '2026-05-31',
    fase = 'selesai',
    progress = 100,
    status = 'selesai',
    catatan = 'Budidaya jagung pada lahan 3,3615 ha dengan irigasi pompa, pemupukan bertahap, pengendalian gulma, dan pascapanen pemipilan mekanis.'
WHERE id = @musim_id;

DELETE FROM biaya_operasional WHERE user_id = @user_id;
DELETE FROM hasil_panen WHERE user_id = @user_id;

INSERT INTO biaya_operasional (user_id, lahan_id, musim_tanam_id, katalog_item_id, tanggal, kategori, subkategori, nama_item, mode_biaya, jumlah, satuan, harga_satuan, total_biaya, catatan) VALUES
(@user_id, @lahan_id, @musim_id, NULL, '2026-02-05', 'Modal & Administrasi', 'Perencanaan Musim', 'Pencatatan modal awal, fotokopi dokumen, dan administrasi kelompok tani', 'input_manual', 1.00, 'paket', 250000.00, 250000.00, 'Biaya persiapan administrasi sebelum kegiatan lapangan dimulai.'),
(@user_id, @lahan_id, @musim_id, NULL, '2026-02-06', 'Persiapan Lahan', 'Olah Tanah Awal', 'Jasa traktor roda dua dan rotavator untuk pengolahan awal lahan 3,3615 ha', 'jasa_per_ha', 3.36, 'ha', 1250000.00, 4201875.00, 'Termasuk pembajakan dan penghancuran bongkah tanah.'),
(@user_id, @lahan_id, @musim_id, NULL, '2026-02-07', 'Air & Irigasi', 'Drainase', 'Perbaikan parit keliling dan pembuatan alur drainase lahan', 'input_manual', 1.00, 'paket', 1150000.00, 1150000.00, 'Dikerjakan sebelum tanam agar air hujan tidak menggenang.'),
(@user_id, @lahan_id, @musim_id, NULL, '2026-02-08', 'Pembenah Tanah', 'Bahan Organik', 'Aplikasi kompos matang untuk pembenah struktur tanah', 'jumlah_x_harga', 5000.00, 'kg', 700.00, 3500000.00, 'Kompos ditebar merata pada area tanam utama.'),
(@user_id, @lahan_id, @musim_id, NULL, '2026-02-10', 'Benih & Bibit', 'Benih Jagung', 'Benih Jagung Bima URI / Bima 20 URI', 'jumlah_x_harga', 56.00, 'kg', 35000.00, 1960000.00, 'Kebutuhan benih disesuaikan dengan luas efektif tanam dan cadangan sulam.'),
(@user_id, @lahan_id, @musim_id, NULL, '2026-02-11', 'Tenaga Kerja', 'Olah Tanah Manual', 'Tenaga perapian bedengan, pembersihan sisa gulma, dan perbaikan pematang', 'hok', 18.00, 'HOK', 120000.00, 2160000.00, 'Tambahan tenaga manual setelah olah tanah mekanis.'),
(@user_id, @lahan_id, @musim_id, NULL, '2026-02-14', 'Tenaga Kerja', 'Tanam Jagung', 'Upah tanam jagung dan pengaturan jarak tanam', 'hok', 22.00, 'HOK', 110000.00, 2420000.00, 'Meliputi tanam awal dan penyulaman ringan.'),
(@user_id, @lahan_id, @musim_id, NULL, '2026-02-16', 'Air & Irigasi', 'Instalasi Pompa', 'Selang, sambungan, dan biaya setup pompa air awal musim', 'input_manual', 1.00, 'paket', 650000.00, 650000.00, 'Perlengkapan irigasi awal sebelum fase vegetatif.'),
(@user_id, @lahan_id, @musim_id, NULL, '2026-03-01', 'Pupuk & Nutrisi', 'Pemupukan Dasar', 'Pupuk NPK Phonska untuk pemupukan dasar dan susulan pertama', 'jumlah_x_harga', 900.00, 'kg', 5200.00, 4680000.00, 'Diberikan bertahap sesuai umur tanaman.'),
(@user_id, @lahan_id, @musim_id, NULL, '2026-03-02', 'Pupuk & Nutrisi', 'Pemupukan Nitrogen', 'Pupuk Urea untuk vegetatif jagung', 'jumlah_x_harga', 800.00, 'kg', 5100.00, 4080000.00, 'Mendorong pertumbuhan vegetatif dan warna daun tetap hijau.'),
(@user_id, @lahan_id, @musim_id, NULL, '2026-03-03', 'Pupuk & Nutrisi', 'Pemupukan Kalium', 'Pupuk KCL untuk pengisian tongkol dan ketahanan tanaman', 'jumlah_x_harga', 200.00, 'kg', 8500.00, 1700000.00, 'Diberikan pada fase vegetatif akhir.'),
(@user_id, @lahan_id, @musim_id, NULL, '2026-03-05', 'Perlindungan Tanaman', 'Pengendalian Gulma', 'Herbisida pra dan awal tumbuh untuk pengendalian gulma', 'jumlah_x_harga', 10.00, 'liter', 95000.00, 950000.00, 'Digunakan selektif pada lorong tanam dan tepi lahan.'),
(@user_id, @lahan_id, @musim_id, NULL, '2026-03-12', 'Perlindungan Tanaman', 'Pengendalian Hama', 'Insektisida untuk ulat dan hama daun', 'jumlah_x_harga', 8.00, 'liter', 165000.00, 1320000.00, 'Penyemprotan dilakukan bertahap mengikuti pengamatan lapangan.'),
(@user_id, @lahan_id, @musim_id, NULL, '2026-03-14', 'Air & Irigasi', 'Operasional Pompa', 'Bahan bakar pompa air selama fase vegetatif', 'jumlah_x_harga', 180.00, 'liter', 11000.00, 1980000.00, 'Irigasi dilakukan saat hujan tidak merata.'),
(@user_id, @lahan_id, @musim_id, NULL, '2026-03-20', 'Air & Irigasi', 'Iuran Saluran', 'Iuran pemeliharaan saluran air dan distribusi air musiman', 'input_manual', 1.00, 'paket', 450000.00, 450000.00, 'Biaya koordinasi irigasi dengan lingkungan sekitar.'),
(@user_id, @lahan_id, @musim_id, NULL, '2026-03-22', 'Tenaga Kerja', 'Penyiangan', 'Upah penyiangan gulma manual tahap utama', 'hok', 18.00, 'HOK', 110000.00, 1980000.00, 'Dilakukan saat gulma mulai menutup lorong tanaman.'),
(@user_id, @lahan_id, @musim_id, NULL, '2026-03-28', 'Tenaga Kerja', 'Pemupukan', 'Upah aplikasi pupuk dasar dan susulan', 'hok', 14.00, 'HOK', 115000.00, 1610000.00, 'Tenaga kerja khusus pemupukan agar dosis merata.'),
(@user_id, @lahan_id, @musim_id, NULL, '2026-04-03', 'Tenaga Kerja', 'Penyemprotan', 'Upah penyemprotan pestisida dan nutrisi cair', 'hok', 10.00, 'HOK', 120000.00, 1200000.00, 'Dilakukan pagi dan sore sesuai kondisi lapangan.'),
(@user_id, @lahan_id, @musim_id, NULL, '2026-04-18', 'Pupuk & Nutrisi', 'Pemupukan Generatif', 'Tambahan NPK pada fase pembentukan tongkol', 'jumlah_x_harga', 300.00, 'kg', 5200.00, 1560000.00, 'Menjaga pengisian tongkol lebih seragam.'),
(@user_id, @lahan_id, @musim_id, NULL, '2026-04-21', 'Perlindungan Tanaman', 'Pengendalian Hama Lanjutan', 'Insektisida lanjutan saat fase generatif awal', 'jumlah_x_harga', 5.00, 'liter', 165000.00, 825000.00, 'Untuk menekan serangan hama tongkol dan daun.'),
(@user_id, @lahan_id, @musim_id, NULL, '2026-04-15', 'Risiko / Kerugian', 'Cadangan Hama', 'Cadangan biaya tak terduga untuk serangan hama', 'input_manual', 1.00, 'paket', 1200000.00, 1200000.00, 'Disiapkan sebagai buffer saat intensitas hama meningkat.'),
(@user_id, @lahan_id, @musim_id, NULL, '2026-04-16', 'Risiko / Kerugian', 'Cadangan Cuaca', 'Cadangan biaya tak terduga untuk hujan ekstrem dan perbaikan drainase', 'input_manual', 1.00, 'paket', 1500000.00, 1500000.00, 'Disiapkan untuk mitigasi cuaca buruk pertengahan musim.'),
(@user_id, @lahan_id, @musim_id, NULL, '2026-05-24', 'Panen', 'Tenaga Panen', 'Borongan panen jagung di lahan 3,3615 ha', 'jasa_per_ha', 3.36, 'ha', 1400000.00, 4706100.00, 'Panen dilakukan saat kadar air lapang sudah sesuai target panen tongkol.'),
(@user_id, @lahan_id, @musim_id, NULL, '2026-05-25', 'Panen', 'Angkut Hasil', 'Angkut hasil dari petakan ke titik kumpul', 'input_manual', 1.00, 'paket', 1250000.00, 1250000.00, 'Meliputi tenaga angkut dalam area lahan.'),
(@user_id, @lahan_id, @musim_id, NULL, '2026-05-26', 'Bahan Pendukung', 'Karung', 'Karung hasil panen jagung untuk pengumpulan awal', 'jumlah_x_harga', 170.00, 'karung', 4500.00, 765000.00, 'Dipakai untuk pengumpulan tongkol dan pipilan.'),
(@user_id, @lahan_id, @musim_id, NULL, '2026-05-26', 'Bahan Pendukung', 'Terpal Jemur', 'Terpal tambahan untuk alas jemur dan sortasi', 'jumlah_x_harga', 6.00, 'lembar', 120000.00, 720000.00, 'Mencegah hasil kontak langsung dengan tanah.'),
(@user_id, @lahan_id, @musim_id, NULL, '2026-05-28', 'Pascapanen', 'Pemipilan', 'Jasa corn sheller untuk pemipilan hasil jagung', 'jasa_per_hasil', 27220.00, 'kg', 250.00, 6805000.00, 'Pemipilan mekanis mempercepat persiapan penjualan.'),
(@user_id, @lahan_id, @musim_id, NULL, '2026-05-29', 'Pascapanen', 'Sortasi dan Pengeringan', 'Biaya sortasi, pembalikan, dan pengeringan awal', 'input_manual', 1.00, 'paket', 2400000.00, 2400000.00, 'Untuk menjaga mutu jagung pipilan sebelum dijual.'),
(@user_id, @lahan_id, @musim_id, NULL, '2026-05-30', 'Pascapanen', 'Penyimpanan Sementara', 'Sewa gudang sementara dan pengamanan hasil', 'input_manual', 1.00, 'paket', 1100000.00, 1100000.00, 'Dipakai sambil menunggu pengiriman ke pembeli.'),
(@user_id, @lahan_id, @musim_id, NULL, '2026-05-31', 'Transportasi & Logistik', 'Pickup Pengiriman', 'Sewa pickup untuk pengiriman hasil ke gudang pembeli', 'input_manual', 6.00, 'rit', 550000.00, 3300000.00, 'Ritase disesuaikan dengan volume hasil pipilan.'),
(@user_id, @lahan_id, @musim_id, NULL, '2026-05-31', 'Transportasi & Logistik', 'Bongkar Muat', 'Upah bongkar muat di gudang pembeli', 'input_manual', 1.00, 'paket', 900000.00, 900000.00, 'Biaya tenaga saat serah terima hasil.');

INSERT INTO hasil_panen (user_id, lahan_id, musim_tanam_id, tanggal_panen, komoditas, berat_kg, harga_per_kg, total_pendapatan, kualitas, status, pembeli, catatan)
VALUES (@user_id, @lahan_id, @musim_id, '2026-05-31', 'Jagung Bima URI / Bima 20 URI', 27220.00, 4900.00, 133378000.00, 'baik', 'terverifikasi', 'Gudang Pakan dan Mitra Ternak Sidoarjo', 'Simulasi hasil panen jagung pada lahan 3,3615 ha dengan hasil sekitar 8,1 ton per ha jagung pipilan kering.')
ON DUPLICATE KEY UPDATE
  tanggal_panen = VALUES(tanggal_panen),
  komoditas = VALUES(komoditas),
  berat_kg = VALUES(berat_kg),
  harga_per_kg = VALUES(harga_per_kg),
  total_pendapatan = VALUES(total_pendapatan),
  kualitas = VALUES(kualitas),
  status = VALUES(status),
  pembeli = VALUES(pembeli),
  catatan = VALUES(catatan);
