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

SET @farhan_user_id := (SELECT id FROM users WHERE email = 'muhammadfarhanmonggot@gmail.com' LIMIT 1);
SET @jagung_farhan_id := (SELECT id FROM tanaman WHERE slug = 'jagung-bima-uri-bima-20-uri' LIMIT 1);
SET @modal_item_id := (SELECT id FROM katalog_items WHERE kode = 'MOD-KAS-AWAL' LIMIT 1);
SET @risk_item_id := (SELECT id FROM katalog_items WHERE kode = 'RSK-GAGAL-PANEN' LIMIT 1);

INSERT INTO lahan (user_id, nama_lahan, kode_lahan, luas, tanaman_id, komoditas, lokasi, status, latitude, longitude, polygon_area, luas_lahan, deleted_at, catatan)
VALUES (
  @farhan_user_id,
  'Lahan Jagung Farhan Blok A',
  'FAR-JG-33615',
  3.3615,
  @jagung_farhan_id,
  'Jagung Bima URI / Bima 20 URI',
  'Gedangan, Sidoarjo, Jawa Timur',
  'selesai',
  -7.28658000,
  112.79065000,
  JSON_OBJECT(
    'type', 'Polygon',
    'coordinates', JSON_ARRAY(
      JSON_ARRAY(
        JSON_ARRAY(112.789862, -7.285714),
        JSON_ARRAY(112.789765, -7.287384),
        JSON_ARRAY(112.791411, -7.287400),
        JSON_ARRAY(112.791562, -7.285809),
        JSON_ARRAY(112.789862, -7.285714)
      )
    )
  ),
  33614.91,
  NULL,
  'Lahan dummy deploy dengan polygon aktif seluas sekitar 33.614,91 m2.'
)
ON DUPLICATE KEY UPDATE
  kode_lahan = VALUES(kode_lahan),
  luas = VALUES(luas),
  tanaman_id = VALUES(tanaman_id),
  komoditas = VALUES(komoditas),
  lokasi = VALUES(lokasi),
  status = VALUES(status),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  polygon_area = VALUES(polygon_area),
  luas_lahan = VALUES(luas_lahan),
  deleted_at = NULL,
  catatan = VALUES(catatan);

SET @farhan_lahan_id := (
  SELECT id
  FROM lahan
  WHERE user_id = @farhan_user_id
    AND nama_lahan = 'Lahan Jagung Farhan Blok A'
  LIMIT 1
);

INSERT INTO musim_tanam (user_id, lahan_id, tanaman_id, kode_musim, nama_musim, tanggal_tanam, estimasi_panen, tanggal_panen, fase, progress, status, catatan)
VALUES (
  @farhan_user_id,
  @farhan_lahan_id,
  @jagung_farhan_id,
  'MT-2026-JAGUNG-FARHAN',
  'Musim Jagung Farhan 2026',
  '2026-02-14',
  '2026-05-25',
  '2026-05-31',
  'selesai',
  100,
  'selesai',
  'Musim dummy lengkap untuk validasi alur biaya, modal, risiko, dan panen.'
)
ON DUPLICATE KEY UPDATE
  tanaman_id = VALUES(tanaman_id),
  nama_musim = VALUES(nama_musim),
  tanggal_tanam = VALUES(tanggal_tanam),
  estimasi_panen = VALUES(estimasi_panen),
  tanggal_panen = VALUES(tanggal_panen),
  fase = VALUES(fase),
  progress = VALUES(progress),
  status = VALUES(status),
  catatan = VALUES(catatan);

SET @farhan_musim_id := (
  SELECT id
  FROM musim_tanam
  WHERE lahan_id = @farhan_lahan_id
    AND kode_musim = 'MT-2026-JAGUNG-FARHAN'
  LIMIT 1
);

DELETE FROM biaya_operasional
WHERE user_id = @farhan_user_id
  AND musim_tanam_id = @farhan_musim_id;

DELETE FROM biaya_produksi
WHERE user_id = @farhan_user_id
  AND musim_tanam_id = @farhan_musim_id;

DELETE FROM modal_sumber
WHERE user_id = @farhan_user_id
  AND musim_tanam_id = @farhan_musim_id;

DELETE FROM risk_register
WHERE user_id = @farhan_user_id
  AND musim_tanam_id = @farhan_musim_id;

DELETE FROM hasil_panen
WHERE user_id = @farhan_user_id
  AND musim_tanam_id = @farhan_musim_id;

INSERT INTO modal_sumber (user_id, musim_tanam_id, katalog_item_id, tanggal, nama_sumber, jenis_modal, nominal, bunga_persen, tenor_bulan, jatuh_tempo, catatan)
VALUES
  (@farhan_user_id, @farhan_musim_id, @modal_item_id, '2026-02-05', 'Modal Sendiri Musim Jagung Farhan', 'modal_sendiri', 75000000.00, NULL, NULL, NULL, 'Dana awal musim disiapkan dari kas pribadi untuk operasional lahan 3,3615 ha.'),
  (@farhan_user_id, @farhan_musim_id, NULL, '2026-02-06', 'Cadangan Kas Operasional', 'lainnya', 5000000.00, NULL, NULL, NULL, 'Dana cadangan untuk kebutuhan mendadak selama musim berjalan.');

INSERT INTO risk_register (user_id, lahan_id, musim_tanam_id, katalog_item_id, tanggal, risiko, dampak_estimasi, status, mitigasi)
VALUES
  (@farhan_user_id, @farhan_lahan_id, @farhan_musim_id, @risk_item_id, '2026-03-20', 'Serangan hama daun dan ulat pada fase vegetatif', 1200000.00, 'dipantau', 'Monitoring mingguan, semprot selektif, dan pengamatan blok serangan.'),
  (@farhan_user_id, @farhan_lahan_id, @farhan_musim_id, NULL, '2026-04-16', 'Hujan ekstrem dan genangan sementara di tepi lahan', 1500000.00, 'dipantau', 'Perbaikan drainase dan buka tutup aliran air agar genangan cepat surut.');

INSERT INTO biaya_operasional
  (user_id, lahan_id, musim_tanam_id, katalog_item_id, tanggal, kategori, subkategori, nama_item, mode_biaya, jumlah, satuan, harga_satuan, total_biaya, catatan)
VALUES
  (@farhan_user_id, @farhan_lahan_id, @farhan_musim_id, NULL, '2026-02-06', 'Persiapan Lahan', 'Olah Tanah Awal', 'Jasa traktor roda dua dan rotavator', 'input_manual', 3.36, 'ha', 1250000.00, 4201875.00, 'Pembajakan dan penghalusan lahan awal musim.'),
  (@farhan_user_id, @farhan_lahan_id, @farhan_musim_id, NULL, '2026-02-07', 'Air & Irigasi', 'Drainase', 'Perbaikan parit keliling dan alur drainase', 'input_manual', 1.00, 'paket', 1150000.00, 1150000.00, 'Supaya lahan tidak mudah tergenang saat hujan.'),
  (@farhan_user_id, @farhan_lahan_id, @farhan_musim_id, NULL, '2026-02-08', 'Pembenah Tanah', 'Bahan Organik', 'Aplikasi kompos matang', 'input_manual', 5000.00, 'kg', 700.00, 3500000.00, 'Pembenah struktur tanah dan tambahan bahan organik.'),
  (@farhan_user_id, @farhan_lahan_id, @farhan_musim_id, (SELECT id FROM katalog_items WHERE kode = 'BEN-JAGUNG-NASA29' LIMIT 1), '2026-02-10', 'Benih & Bibit', 'Benih Jagung', 'Benih jagung untuk tanam utama dan sulam', 'jumlah_x_harga', 56.00, 'kg', 35000.00, 1960000.00, 'Kebutuhan benih untuk luas 3,3615 ha.'),
  (@farhan_user_id, @farhan_lahan_id, @farhan_musim_id, NULL, '2026-02-11', 'Tenaga Kerja', 'Olah Tanah Manual', 'Perapian bedengan dan pematang', 'hok', 18.00, 'HOK', 120000.00, 2160000.00, 'Tambahan tenaga setelah olah mekanis.'),
  (@farhan_user_id, @farhan_lahan_id, @farhan_musim_id, NULL, '2026-02-14', 'Tenaga Kerja', 'Tanam Jagung', 'Upah tanam jagung dan penyulaman awal', 'hok', 22.00, 'HOK', 110000.00, 2420000.00, 'Pelaksanaan tanam awal.'),
  (@farhan_user_id, @farhan_lahan_id, @farhan_musim_id, NULL, '2026-02-16', 'Air & Irigasi', 'Instalasi Pompa', 'Selang, sambungan, dan setup pompa air', 'input_manual', 1.00, 'paket', 650000.00, 650000.00, 'Persiapan irigasi menjelang fase vegetatif.'),
  (@farhan_user_id, @farhan_lahan_id, @farhan_musim_id, (SELECT id FROM katalog_items WHERE kode = 'PUP-NPK-PHONSKA' LIMIT 1), '2026-03-01', 'Pupuk & Nutrisi', 'Pemupukan Dasar', 'Pupuk NPK Phonska', 'jumlah_x_harga', 900.00, 'kg', 5200.00, 4680000.00, 'Pemupukan dasar dan susulan pertama.'),
  (@farhan_user_id, @farhan_lahan_id, @farhan_musim_id, (SELECT id FROM katalog_items WHERE kode = 'PUP-UREA' LIMIT 1), '2026-03-02', 'Pupuk & Nutrisi', 'Pemupukan Nitrogen', 'Pupuk Urea', 'jumlah_x_harga', 800.00, 'kg', 5100.00, 4080000.00, 'Menjaga pertumbuhan vegetatif tanaman.'),
  (@farhan_user_id, @farhan_lahan_id, @farhan_musim_id, NULL, '2026-03-03', 'Pupuk & Nutrisi', 'Pemupukan Kalium', 'Pupuk KCL untuk pengisian tongkol', 'jumlah_x_harga', 200.00, 'kg', 8500.00, 1700000.00, 'Tambahan kalium fase vegetatif akhir.'),
  (@farhan_user_id, @farhan_lahan_id, @farhan_musim_id, (SELECT id FROM katalog_items WHERE kode = 'LIN-HERBISIDA' LIMIT 1), '2026-03-05', 'Perlindungan Tanaman', 'Pengendalian Gulma', 'Herbisida pra dan awal tumbuh', 'jumlah_x_harga', 10.00, 'liter', 95000.00, 950000.00, 'Pengendalian gulma selektif.'),
  (@farhan_user_id, @farhan_lahan_id, @farhan_musim_id, (SELECT id FROM katalog_items WHERE kode = 'LIN-INSEKTISIDA' LIMIT 1), '2026-03-12', 'Perlindungan Tanaman', 'Pengendalian Hama', 'Insektisida untuk ulat dan hama daun', 'jumlah_x_harga', 8.00, 'liter', 165000.00, 1320000.00, 'Sesuai pengamatan OPT lapangan.'),
  (@farhan_user_id, @farhan_lahan_id, @farhan_musim_id, (SELECT id FROM katalog_items WHERE kode = 'AIR-BBM-POMPA' LIMIT 1), '2026-03-14', 'Air & Irigasi', 'Operasional Pompa', 'Bahan bakar pompa air', 'jumlah_x_harga', 180.00, 'liter', 11000.00, 1980000.00, 'Operasional pompa saat curah hujan tidak merata.'),
  (@farhan_user_id, @farhan_lahan_id, @farhan_musim_id, NULL, '2026-03-20', 'Air & Irigasi', 'Iuran Saluran', 'Iuran pemeliharaan saluran air', 'input_manual', 1.00, 'paket', 450000.00, 450000.00, 'Koordinasi distribusi air lingkungan sekitar.'),
  (@farhan_user_id, @farhan_lahan_id, @farhan_musim_id, NULL, '2026-03-22', 'Tenaga Kerja', 'Penyiangan', 'Upah penyiangan gulma manual', 'hok', 18.00, 'HOK', 110000.00, 1980000.00, 'Penyiangan utama saat gulma mulai menutup lorong tanam.'),
  (@farhan_user_id, @farhan_lahan_id, @farhan_musim_id, NULL, '2026-03-28', 'Tenaga Kerja', 'Pemupukan', 'Upah aplikasi pupuk dasar dan susulan', 'hok', 14.00, 'HOK', 115000.00, 1610000.00, 'Tenaga aplikasi pupuk agar dosis merata.'),
  (@farhan_user_id, @farhan_lahan_id, @farhan_musim_id, NULL, '2026-04-03', 'Tenaga Kerja', 'Penyemprotan', 'Upah penyemprotan pestisida dan nutrisi cair', 'hok', 10.00, 'HOK', 120000.00, 1200000.00, 'Penyemprotan pagi dan sore sesuai kondisi lapangan.'),
  (@farhan_user_id, @farhan_lahan_id, @farhan_musim_id, (SELECT id FROM katalog_items WHERE kode = 'PUP-NPK-PHONSKA' LIMIT 1), '2026-04-18', 'Pupuk & Nutrisi', 'Pemupukan Generatif', 'Tambahan NPK fase pembentukan tongkol', 'jumlah_x_harga', 300.00, 'kg', 5200.00, 1560000.00, 'Menjaga pengisian tongkol lebih seragam.'),
  (@farhan_user_id, @farhan_lahan_id, @farhan_musim_id, (SELECT id FROM katalog_items WHERE kode = 'LIN-INSEKTISIDA' LIMIT 1), '2026-04-21', 'Perlindungan Tanaman', 'Pengendalian Hama Lanjutan', 'Insektisida lanjutan fase generatif awal', 'jumlah_x_harga', 5.00, 'liter', 165000.00, 825000.00, 'Menekan serangan hama tongkol dan daun.'),
  (@farhan_user_id, @farhan_lahan_id, @farhan_musim_id, NULL, '2026-05-24', 'Panen', 'Tenaga Panen', 'Borongan panen jagung', 'input_manual', 3.36, 'ha', 1400000.00, 4706100.00, 'Panen pada kadar air lapang sesuai target.'),
  (@farhan_user_id, @farhan_lahan_id, @farhan_musim_id, NULL, '2026-05-25', 'Panen', 'Angkut Hasil', 'Angkut hasil dari petakan ke titik kumpul', 'input_manual', 1.00, 'paket', 1250000.00, 1250000.00, 'Pengumpulan hasil di dalam area lahan.'),
  (@farhan_user_id, @farhan_lahan_id, @farhan_musim_id, (SELECT id FROM katalog_items WHERE kode = 'BHN-KARUNG' LIMIT 1), '2026-05-26', 'Bahan Pendukung', 'Karung', 'Karung hasil panen jagung', 'jumlah_x_harga', 170.00, 'karung', 4500.00, 765000.00, 'Pengumpulan tongkol dan pipilan.'),
  (@farhan_user_id, @farhan_lahan_id, @farhan_musim_id, (SELECT id FROM katalog_items WHERE kode = 'BHN-TERPAL' LIMIT 1), '2026-05-26', 'Bahan Pendukung', 'Terpal Jemur', 'Terpal tambahan untuk jemur dan sortasi', 'jumlah_x_harga', 6.00, 'lembar', 120000.00, 720000.00, 'Mencegah hasil kontak langsung dengan tanah.'),
  (@farhan_user_id, @farhan_lahan_id, @farhan_musim_id, (SELECT id FROM katalog_items WHERE kode = 'PAS-PIPIL-JAGUNG' LIMIT 1), '2026-05-28', 'Pascapanen', 'Pemipilan', 'Jasa corn sheller untuk pemipilan jagung', 'input_manual', 27220.00, 'kg', 250.00, 6805000.00, 'Pemipilan mekanis mempercepat penjualan.'),
  (@farhan_user_id, @farhan_lahan_id, @farhan_musim_id, NULL, '2026-05-29', 'Pascapanen', 'Sortasi dan Pengeringan', 'Biaya sortasi, pembalikan, dan pengeringan awal', 'input_manual', 1.00, 'paket', 2400000.00, 2400000.00, 'Menjaga mutu jagung pipilan sebelum dijual.'),
  (@farhan_user_id, @farhan_lahan_id, @farhan_musim_id, NULL, '2026-05-30', 'Pascapanen', 'Penyimpanan Sementara', 'Sewa gudang sementara dan pengamanan hasil', 'input_manual', 1.00, 'paket', 1100000.00, 1100000.00, 'Dipakai sambil menunggu pengiriman ke pembeli.'),
  (@farhan_user_id, @farhan_lahan_id, @farhan_musim_id, (SELECT id FROM katalog_items WHERE kode = 'TRN-PICKUP' LIMIT 1), '2026-05-31', 'Transportasi & Logistik', 'Pickup Pengiriman', 'Sewa pickup untuk pengiriman hasil', 'input_manual', 6.00, 'rit', 550000.00, 3300000.00, 'Ritase disesuaikan dengan volume hasil pipilan.'),
  (@farhan_user_id, @farhan_lahan_id, @farhan_musim_id, (SELECT id FROM katalog_items WHERE kode = 'TRN-BONGKAR' LIMIT 1), '2026-05-31', 'Transportasi & Logistik', 'Bongkar Muat', 'Upah bongkar muat di gudang pembeli', 'input_manual', 1.00, 'paket', 900000.00, 900000.00, 'Biaya tenaga saat serah terima hasil.');

INSERT INTO hasil_panen (user_id, lahan_id, musim_tanam_id, tanggal_panen, komoditas, berat_kg, harga_per_kg, total_pendapatan, kualitas, status, pembeli, catatan)
VALUES (
  @farhan_user_id,
  @farhan_lahan_id,
  @farhan_musim_id,
  '2026-05-31',
  'Jagung Bima URI / Bima 20 URI',
  27220.00,
  4900.00,
  133378000.00,
  'baik',
  'terverifikasi',
  'Gudang Pakan dan Mitra Ternak Sidoarjo',
  'Data dummy deploy untuk verifikasi dashboard, laporan biaya, dan profit petani.'
)
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
