USE agrotrack;

INSERT INTO users (name, email, phone, profile_photo, role, status, password_hash)
VALUES
  ('Budi Santoso', 'petani@agrotrack.test', '081234567890', 'assets/image/profil/farmer-profile.jpg', 'petani', 'aktif', '$2y$10$Qm2H4jokCF.H6PrZAdI8Y.6XZdXwKSbU3o/VJKbxI/Gjzmi6H5o3K'),
  ('Admin Root', 'admin@agrotrack.test', '080000000001', 'assets/image/profil/foto_profil_6.jpg', 'admin', 'aktif', '$2y$10$Qm2H4jokCF.H6PrZAdI8Y.6XZdXwKSbU3o/VJKbxI/Gjzmi6H5o3K'),
  ('Siti Aminah', 'siti@agrotrack.test', '081234567891', 'assets/image/profil/foto_profiil_2.jpg', 'petani', 'validasi', '$2y$10$Qm2H4jokCF.H6PrZAdI8Y.6XZdXwKSbU3o/VJKbxI/Gjzmi6H5o3K'),
  ('Raka Wijaya', 'raka@agrotrack.test', '081234567892', 'assets/image/profil/foto_profil_3.jpg', 'petani', 'nonaktif', '$2y$10$Qm2H4jokCF.H6PrZAdI8Y.6XZdXwKSbU3o/VJKbxI/Gjzmi6H5o3K')
ON DUPLICATE KEY UPDATE
  name = VALUES(name),
  phone = VALUES(phone),
  profile_photo = VALUES(profile_photo),
  role = VALUES(role),
  status = VALUES(status),
  updated_at = CURRENT_TIMESTAMP;

SET @budi_id = (SELECT id FROM users WHERE email = 'petani@agrotrack.test' LIMIT 1);
SET @admin_id = (SELECT id FROM users WHERE email = 'admin@agrotrack.test' LIMIT 1);
SET @siti_id = (SELECT id FROM users WHERE email = 'siti@agrotrack.test' LIMIT 1);
SET @raka_id = (SELECT id FROM users WHERE email = 'raka@agrotrack.test' LIMIT 1);

INSERT INTO lahan (user_id, nama_lahan, kode_lahan, luas, komoditas, lokasi, status, latitude, longitude, polygon_area, luas_lahan, catatan)
SELECT @budi_id, 'Sawah B-12', 'B-12', 4.20, 'Padi Ciherang', 'Desa Sumber Rejo', 'menjelang_panen',
  -7.25750000, 112.75210000,
  JSON_OBJECT('type', 'Polygon', 'coordinates', JSON_ARRAY(JSON_ARRAY(
    JSON_ARRAY(112.74620, -7.25580),
    JSON_ARRAY(112.75830, -7.25620),
    JSON_ARRAY(112.75800, -7.26440),
    JSON_ARRAY(112.74560, -7.26390),
    JSON_ARRAY(112.74620, -7.25580)
  ))),
  1009487.25,
  'Fase generatif akhir'
WHERE NOT EXISTS (SELECT 1 FROM lahan WHERE user_id = @budi_id AND nama_lahan = 'Sawah B-12');

INSERT INTO lahan (user_id, nama_lahan, kode_lahan, luas, komoditas, lokasi, status, catatan)
SELECT @budi_id, 'Blok A-03', 'A-03', 3.10, 'Jagung Hibrida', 'Desa Karang Asem', 'aktif', 'Fase vegetatif'
WHERE NOT EXISTS (SELECT 1 FROM lahan WHERE user_id = @budi_id AND nama_lahan = 'Blok A-03');

INSERT INTO lahan (user_id, nama_lahan, kode_lahan, luas, komoditas, lokasi, status, catatan)
SELECT @budi_id, 'Kebun C-01', 'C-01', 1.80, 'Cabai Merah', 'Desa Wonosari', 'inspeksi', 'Risiko hama sedang'
WHERE NOT EXISTS (SELECT 1 FROM lahan WHERE user_id = @budi_id AND nama_lahan = 'Kebun C-01');

INSERT INTO lahan (user_id, nama_lahan, kode_lahan, luas, komoditas, lokasi, status, catatan)
SELECT @budi_id, 'Sawah D-04', 'D-04', 3.70, 'Padi Inpari', 'Desa Puger', 'persiapan', 'Persiapan musim berikutnya'
WHERE NOT EXISTS (SELECT 1 FROM lahan WHERE user_id = @budi_id AND nama_lahan = 'Sawah D-04');

INSERT INTO lahan (user_id, nama_lahan, kode_lahan, luas, komoditas, lokasi, status, catatan)
SELECT @siti_id, 'Sawah T-08', 'T-08', 2.60, 'Padi IR64', 'Desa Tegal Rejo', 'aktif', 'Input musim terlambat'
WHERE NOT EXISTS (SELECT 1 FROM lahan WHERE user_id = @siti_id AND nama_lahan = 'Sawah T-08');

INSERT INTO lahan (user_id, nama_lahan, kode_lahan, luas, komoditas, lokasi, status, catatan)
SELECT @raka_id, 'Blok K-11', 'K-11', 2.20, 'Kedelai', 'Desa Kaliwungu', 'inspeksi', 'Data musim belum lengkap'
WHERE NOT EXISTS (SELECT 1 FROM lahan WHERE user_id = @raka_id AND nama_lahan = 'Blok K-11');

SET @sawah_b12 = (SELECT id FROM lahan WHERE user_id = @budi_id AND nama_lahan = 'Sawah B-12' LIMIT 1);
SET @blok_a03 = (SELECT id FROM lahan WHERE user_id = @budi_id AND nama_lahan = 'Blok A-03' LIMIT 1);
SET @kebun_c01 = (SELECT id FROM lahan WHERE user_id = @budi_id AND nama_lahan = 'Kebun C-01' LIMIT 1);
SET @sawah_d04 = (SELECT id FROM lahan WHERE user_id = @budi_id AND nama_lahan = 'Sawah D-04' LIMIT 1);
SET @sawah_t08 = (SELECT id FROM lahan WHERE user_id = @siti_id AND nama_lahan = 'Sawah T-08' LIMIT 1);
SET @blok_k11 = (SELECT id FROM lahan WHERE user_id = @raka_id AND nama_lahan = 'Blok K-11' LIMIT 1);

INSERT INTO musim_tanam (user_id, lahan_id, kode_musim, nama_musim, tanggal_tanam, estimasi_panen, tanggal_panen, fase, progress, status, catatan)
SELECT @budi_id, @sawah_b12, '2026-Q2', 'Musim Tanam 2026-Q2', '2026-03-10', '2026-06-27', NULL, 'generatif_akhir', 82, 'aktif', 'Target panen 12 hari lagi'
WHERE NOT EXISTS (SELECT 1 FROM musim_tanam WHERE lahan_id = @sawah_b12 AND kode_musim = '2026-Q2');

INSERT INTO musim_tanam (user_id, lahan_id, kode_musim, nama_musim, tanggal_tanam, estimasi_panen, fase, progress, status, catatan)
SELECT @budi_id, @blok_a03, '2026-Q2', 'Musim Tanam 2026-Q2', '2026-04-22', '2026-08-10', 'vegetatif', 48, 'aktif', 'Tanaman sehat'
WHERE NOT EXISTS (SELECT 1 FROM musim_tanam WHERE lahan_id = @blok_a03 AND kode_musim = '2026-Q2');

INSERT INTO musim_tanam (user_id, lahan_id, kode_musim, nama_musim, tanggal_tanam, estimasi_panen, tanggal_panen, fase, progress, status, catatan)
SELECT @budi_id, @sawah_d04, '2026-Q1', 'Musim Tanam 2026-Q1', '2026-01-05', '2026-06-03', '2026-06-03', 'selesai', 100, 'selesai', 'Selesai panen'
WHERE NOT EXISTS (SELECT 1 FROM musim_tanam WHERE lahan_id = @sawah_d04 AND kode_musim = '2026-Q1');

SET @musim_b12 = (SELECT id FROM musim_tanam WHERE lahan_id = @sawah_b12 AND kode_musim = '2026-Q2' LIMIT 1);
SET @musim_a03 = (SELECT id FROM musim_tanam WHERE lahan_id = @blok_a03 AND kode_musim = '2026-Q2' LIMIT 1);
SET @musim_d04 = (SELECT id FROM musim_tanam WHERE lahan_id = @sawah_d04 AND kode_musim = '2026-Q1' LIMIT 1);

INSERT INTO biaya_produksi (user_id, lahan_id, musim_tanam_id, tanggal, kategori, deskripsi, jumlah, satuan, harga_satuan, total_biaya, catatan)
SELECT @budi_id, @sawah_b12, @musim_b12, '2026-06-02', 'tenaga_kerja', 'Olah lahan dan pemupukan', 1, 'paket', 4500000, 4500000, 'Olah lahan dan pemupukan'
WHERE NOT EXISTS (SELECT 1 FROM biaya_produksi WHERE user_id = @budi_id AND tanggal = '2026-06-02' AND deskripsi = 'Olah lahan dan pemupukan');

INSERT INTO biaya_produksi (user_id, lahan_id, musim_tanam_id, tanggal, kategori, deskripsi, jumlah, satuan, harga_satuan, total_biaya, catatan)
SELECT @budi_id, @sawah_b12, @musim_b12, '2026-05-28', 'pupuk', 'NPK 50 kg', 50, 'kg', 42000, 2100000, 'Pembelian pupuk NPK'
WHERE NOT EXISTS (SELECT 1 FROM biaya_produksi WHERE user_id = @budi_id AND tanggal = '2026-05-28' AND deskripsi = 'NPK 50 kg');

INSERT INTO biaya_produksi (user_id, lahan_id, musim_tanam_id, tanggal, kategori, deskripsi, jumlah, satuan, harga_satuan, total_biaya, catatan)
SELECT @budi_id, @sawah_b12, @musim_b12, '2026-05-18', 'benih', 'Benih Ciherang 50 kg', 50, 'kg', 25000, 1250000, 'Benih unggul'
WHERE NOT EXISTS (SELECT 1 FROM biaya_produksi WHERE user_id = @budi_id AND tanggal = '2026-05-18' AND deskripsi = 'Benih Ciherang 50 kg');

INSERT INTO biaya_produksi (user_id, lahan_id, musim_tanam_id, tanggal, kategori, deskripsi, jumlah, satuan, harga_satuan, total_biaya, catatan)
SELECT @budi_id, @sawah_b12, @musim_b12, '2026-05-09', 'irigasi', 'Pompa dan solar', 1, 'paket', 3800000, 3800000, 'Irigasi tambahan'
WHERE NOT EXISTS (SELECT 1 FROM biaya_produksi WHERE user_id = @budi_id AND tanggal = '2026-05-09' AND deskripsi = 'Pompa dan solar');

INSERT INTO hasil_panen (user_id, lahan_id, musim_tanam_id, tanggal_panen, komoditas, berat_kg, harga_per_kg, total_pendapatan, kualitas, status, pembeli, catatan)
SELECT @budi_id, @sawah_d04, @musim_d04, '2026-06-03', 'Padi Inpari', 7100, 7014.08, 49800000, 'baik', 'terverifikasi', 'Koperasi Tani Makmur', 'Harga jual baik'
WHERE NOT EXISTS (SELECT 1 FROM hasil_panen WHERE user_id = @budi_id AND lahan_id = @sawah_d04 AND tanggal_panen = '2026-06-03');

INSERT INTO hasil_panen (user_id, lahan_id, musim_tanam_id, tanggal_panen, komoditas, berat_kg, harga_per_kg, total_pendapatan, kualitas, status, pembeli, catatan)
SELECT @budi_id, @kebun_c01, NULL, '2026-05-22', 'Cabai Merah', 1300, 24000, 31200000, 'baik', 'menunggu_cek', 'Pasar Induk', 'Menunggu cek kualitas'
WHERE NOT EXISTS (SELECT 1 FROM hasil_panen WHERE user_id = @budi_id AND lahan_id = @kebun_c01 AND tanggal_panen = '2026-05-22');

INSERT INTO hasil_panen (user_id, lahan_id, musim_tanam_id, tanggal_panen, komoditas, berat_kg, harga_per_kg, total_pendapatan, kualitas, status, pembeli, catatan)
SELECT @budi_id, @blok_a03, @musim_a03, '2026-05-14', 'Jagung', 10000, 4720, 47200000, 'baik', 'terverifikasi', 'Gudang Jagung Nusantara', 'Panen awal'
WHERE NOT EXISTS (SELECT 1 FROM hasil_panen WHERE user_id = @budi_id AND lahan_id = @blok_a03 AND tanggal_panen = '2026-05-14');

INSERT INTO monitoring_lahan (lahan_id, reporter_user_id, kategori, severity, status, deskripsi, rekomendasi, tanggal_temuan)
SELECT @kebun_c01, @admin_id, 'hama', 'tinggi', 'terbuka', 'Indikasi serangan hama di Kebun C-01.', 'Audit lapangan dan penyemprotan terarah.', '2026-06-12'
WHERE NOT EXISTS (SELECT 1 FROM monitoring_lahan WHERE lahan_id = @kebun_c01 AND kategori = 'hama' AND status = 'terbuka');

INSERT INTO monitoring_lahan (lahan_id, reporter_user_id, kategori, severity, status, deskripsi, rekomendasi, tanggal_temuan)
SELECT @sawah_t08, @admin_id, 'input_telat', 'sedang', 'terbuka', 'Input musim tanam terlambat.', 'Kirim pengingat ke petani.', '2026-06-13'
WHERE NOT EXISTS (SELECT 1 FROM monitoring_lahan WHERE lahan_id = @sawah_t08 AND kategori = 'input_telat' AND status = 'terbuka');

INSERT INTO monitoring_lahan (lahan_id, reporter_user_id, kategori, severity, status, deskripsi, rekomendasi, tanggal_temuan)
SELECT @blok_k11, @admin_id, 'data_kosong', 'tinggi', 'terbuka', 'Data musim belum lengkap.', 'Minta update data lahan.', '2026-06-14'
WHERE NOT EXISTS (SELECT 1 FROM monitoring_lahan WHERE lahan_id = @blok_k11 AND kategori = 'data_kosong' AND status = 'terbuka');

INSERT INTO aktivitas (user_id, lahan_id, musim_tanam_id, tipe, judul, deskripsi, nominal, terjadi_pada)
SELECT @budi_id, @sawah_b12, @musim_b12, 'irigasi', 'Irigasi selesai', 'Sawah B-12, 09.20 WIB', NULL, '2026-06-15 09:20:00'
WHERE NOT EXISTS (SELECT 1 FROM aktivitas WHERE user_id = @budi_id AND judul = 'Irigasi selesai' AND terjadi_pada = '2026-06-15 09:20:00');

INSERT INTO aktivitas (user_id, lahan_id, musim_tanam_id, tipe, judul, deskripsi, nominal, terjadi_pada)
SELECT @budi_id, @sawah_b12, @musim_b12, 'input_biaya', 'Input biaya pupuk NPK', 'Rp2.100.000 masuk kategori pupuk', -2100000, '2026-06-15 10:35:00'
WHERE NOT EXISTS (SELECT 1 FROM aktivitas WHERE user_id = @budi_id AND judul = 'Input biaya pupuk NPK' AND terjadi_pada = '2026-06-15 10:35:00');

INSERT INTO aktivitas (user_id, lahan_id, musim_tanam_id, tipe, judul, deskripsi, nominal, terjadi_pada)
SELECT @budi_id, @kebun_c01, NULL, 'peringatan', 'Peringatan hama', 'Kebun C-01 perlu pemeriksaan lanjutan', NULL, '2026-06-15 11:10:00'
WHERE NOT EXISTS (SELECT 1 FROM aktivitas WHERE user_id = @budi_id AND judul = 'Peringatan hama' AND terjadi_pada = '2026-06-15 11:10:00');

INSERT INTO notifikasi (user_id, judul, pesan, tipe)
SELECT @budi_id, 'Sawah B-12 siap panen', 'Siapkan pencatatan hasil dan harga jual.', 'peringatan'
WHERE NOT EXISTS (SELECT 1 FROM notifikasi WHERE user_id = @budi_id AND judul = 'Sawah B-12 siap panen');
