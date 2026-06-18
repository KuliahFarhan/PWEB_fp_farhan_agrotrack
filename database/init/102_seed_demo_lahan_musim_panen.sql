SET @petani_id := (SELECT id FROM users WHERE email='petani@agrotrack.test');
SET @padi_id := (SELECT id FROM tanaman WHERE slug='padi-ciherang');
SET @jagung_id := (SELECT id FROM tanaman WHERE slug='jagung-hibrida');

INSERT INTO lahan (user_id, nama_lahan, kode_lahan, luas, tanaman_id, komoditas, lokasi, status, latitude, longitude, polygon_area, luas_lahan)
VALUES
(@petani_id, 'Sawah B-12', 'B-12', 4.20, @padi_id, 'Padi Ciherang', 'Sidoarjo, Jawa Timur', 'aktif', -7.44700000, 112.71800000, JSON_OBJECT('type','Polygon','coordinates',JSON_ARRAY(JSON_ARRAY(JSON_ARRAY(112.716,-7.446),JSON_ARRAY(112.720,-7.446),JSON_ARRAY(112.720,-7.449),JSON_ARRAY(112.716,-7.449),JSON_ARRAY(112.716,-7.446)))), 147000.00),
(@petani_id, 'Blok A-03', 'A-03', 2.80, @jagung_id, 'Jagung Hibrida', 'Mojokerto, Jawa Timur', 'persiapan', NULL, NULL, NULL, NULL)
ON DUPLICATE KEY UPDATE luas=VALUES(luas), tanaman_id=VALUES(tanaman_id), komoditas=VALUES(komoditas);

SET @lahan_padi := (SELECT id FROM lahan WHERE user_id=@petani_id AND nama_lahan='Sawah B-12');
SET @lahan_jagung := (SELECT id FROM lahan WHERE user_id=@petani_id AND nama_lahan='Blok A-03');

INSERT INTO musim_tanam (user_id, lahan_id, tanaman_id, kode_musim, nama_musim, tanggal_tanam, estimasi_panen, fase, progress, status)
VALUES
(@petani_id, @lahan_padi, @padi_id, 'MT-2026-PADI', 'Musim Padi 2026', '2026-03-10', DATE_ADD('2026-03-10', INTERVAL 110 DAY), 'generatif', 70, 'aktif'),
(@petani_id, @lahan_jagung, @jagung_id, 'MT-2026-JAGUNG', 'Musim Jagung 2026', '2026-04-22', DATE_ADD('2026-04-22', INTERVAL 100 DAY), 'vegetatif', 45, 'aktif')
ON DUPLICATE KEY UPDATE estimasi_panen=VALUES(estimasi_panen), tanaman_id=VALUES(tanaman_id);

SET @musim_padi := (SELECT id FROM musim_tanam WHERE kode_musim='MT-2026-PADI');
INSERT INTO biaya_produksi (user_id, lahan_id, musim_tanam_id, tanggal, kategori, deskripsi, jumlah, satuan, harga_satuan, total_biaya)
VALUES
(@petani_id, @lahan_padi, @musim_padi, '2026-03-12', 'benih', 'Bibit Padi Ciherang', 4, 'karung', 125000, 500000),
(@petani_id, @lahan_padi, @musim_padi, '2026-04-01', 'pupuk', 'Pupuk Phonska', 6, 'sak', 175000, 1050000),
(@petani_id, @lahan_padi, @musim_padi, '2026-04-15', 'tenaga_kerja', 'Tenaga pemupukan', 1, 'paket', 1500000, 1500000);

INSERT INTO hasil_panen (user_id, lahan_id, musim_tanam_id, tanggal_panen, komoditas, berat_kg, harga_per_kg, total_pendapatan, kualitas, status, pembeli)
VALUES (@petani_id, @lahan_padi, @musim_padi, '2026-06-28', 'Padi Ciherang', 7200, 6200, 44640000, 'baik', 'terverifikasi', 'Koperasi Tani')
ON DUPLICATE KEY UPDATE total_pendapatan=VALUES(total_pendapatan);
