-- AgroTrack Demo Seed Data
-- Import after database/schema.sql.
--
-- Password note:
-- Demo password for admin and petani is: password
-- The hash below was generated with password_hash('password', PASSWORD_DEFAULT).

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE hasil_panen;
TRUNCATE TABLE biaya_produksi;
TRUNCATE TABLE musim_tanam;
TRUNCATE TABLE lahan;
TRUNCATE TABLE tanaman;
TRUNCATE TABLE users;

SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO users
    (id, nama, email, password, nomor_hp, role, status, foto_profil, created_at, updated_at)
VALUES
    (1, 'Admin AgroTrack', 'admin@agrotrack.test', '$2y$10$Bh6.HdO5VGg6MfJXrcx56ea5/HtmbkHrjrSgCEot2sw7Deg7GyAUy', '0812-2501-8708', 'admin', 'aktif', NULL, NOW(), NOW()),
    (2, 'Petani Demo', 'petani@agrotrack.test', '$2y$10$Bh6.HdO5VGg6MfJXrcx56ea5/HtmbkHrjrSgCEot2sw7Deg7GyAUy', '0812-0000-0001', 'petani', 'aktif', 'farmer-profile.jpg', NOW(), NOW());

INSERT INTO tanaman
    (id, nama_tanaman, masa_panen, deskripsi, status, created_at, updated_at)
VALUES
    (1, 'Padi', 110, 'Tanaman pangan utama dengan masa panen sekitar 110 hari.', 'aktif', NOW(), NOW()),
    (2, 'Jagung', 90, 'Komoditas pertanian utama untuk contoh monitoring AgroTrack.', 'aktif', NOW(), NOW()),
    (3, 'Cabai', 75, 'Komoditas hortikultura dengan masa panen relatif singkat.', 'aktif', NOW(), NOW());

INSERT INTO lahan
    (id, user_id, nama_lahan, lokasi, luas_lahan, status_lahan, latitude, longitude, polygon_area, created_at, updated_at)
VALUES
    (
        1,
        2,
        'Kebun Utara',
        'Mojokerto, Jawa Timur',
        1.80,
        'aktif',
        -7.52004540,
        112.46927227,
        '[[-7.519800,112.468900],[-7.519900,112.469700],[-7.520400,112.469600],[-7.520300,112.468800]]',
        NOW(),
        NOW()
    ),
    (
        2,
        2,
        'Lahan Barat',
        'Jombang, Jawa Timur',
        2.10,
        'aktif',
        -7.54683920,
        112.23311210,
        '[[-7.546500,112.232800],[-7.546600,112.233500],[-7.547100,112.233400],[-7.547000,112.232700]]',
        NOW(),
        NOW()
    );

INSERT INTO musim_tanam
    (id, lahan_id, tanaman_id, tanggal_tanam, estimasi_panen, status, catatan, created_at, updated_at)
VALUES
    (1, 1, 2, '2026-06-01', DATE_ADD('2026-06-01', INTERVAL 90 DAY), 'pertumbuhan', 'Musim tanam jagung pertama di Kebun Utara.', NOW(), NOW()),
    (2, 2, 1, '2026-06-10', DATE_ADD('2026-06-10', INTERVAL 110 DAY), 'persemaian', 'Musim tanam padi di Lahan Barat.', NOW(), NOW());

INSERT INTO biaya_produksi
    (id, musim_tanam_id, kategori, nominal, tanggal_biaya, keterangan, created_at, updated_at)
VALUES
    (1, 1, 'bibit', 1200000.00, '2026-06-01', 'Benih jagung unggul.', NOW(), NOW()),
    (2, 1, 'pupuk', 2100000.00, '2026-06-12', 'Pupuk NPK dan kompos.', NOW(), NOW()),
    (3, 1, 'tenaga_kerja', 1500000.00, '2026-06-15', 'Olah lahan dan penanaman.', NOW(), NOW()),
    (4, 2, 'bibit', 900000.00, '2026-06-10', 'Bibit padi.', NOW(), NOW()),
    (5, 2, 'pupuk', 1800000.00, '2026-06-20', 'Pupuk awal musim.', NOW(), NOW()),
    (6, 2, 'transportasi', 350000.00, '2026-06-22', 'Distribusi pupuk dan bibit.', NOW(), NOW());

-- Business calculation example for musim_tanam_id = 1:
-- Total biaya produksi = 1,200,000 + 2,100,000 + 1,500,000 = 4,800,000
-- Total pendapatan = 2,400 kg * 5,000 = 12,000,000
-- Total keuntungan = 12,000,000 - 4,800,000 = 7,200,000
INSERT INTO hasil_panen
    (id, musim_tanam_id, total_hasil, satuan, harga_jual, total_pendapatan, total_keuntungan, catatan, created_at, updated_at)
VALUES
    (1, 1, 2400.00, 'kg', 5000.00, 12000000.00, 7200000.00, 'Contoh hasil panen jagung untuk demo laporan dan analisis.', NOW(), NOW());
