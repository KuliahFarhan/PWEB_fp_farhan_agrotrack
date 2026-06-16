USE agrotrack;

INSERT INTO katalog_items
(kode, kategori, subkategori, nama, slug, image_path, komoditas, fase, jenis_biaya, mode_biaya, satuan_default, harga_min, harga_max, harga_status, sumber_referensi, sumber_dokumen, tanggal_cek_harga, fungsi, keterangan, risiko, admin_note, detail_json, is_active)
VALUES
('PUP-ZA','Pupuk & Nutrisi','Pupuk Nitrogen + Sulfur','Pupuk ZA','pupuk-za','assets/image/pupuk/pupuk-za.jpg','padi,jagung,kedelai','Vegetatif / susulan','saprodi','jumlah_x_harga','kg',1360,39875,'HET_SUBSIDI + REFERENSI','Petrokimia Gresik ZA; Pupuk Indonesia HET 2025; Sikumis/Petrokimia Gresik.','AGROTRACK_KATALOG_PUPUK_NUTRISI_PADI_JAGUNG_KEDELAI.md','2026-06-16','Pupuk sumber nitrogen dan sulfur.','Harga subsidi dan non-subsidi dipisah.','Jangan disamakan dengan urea.','Gunakan untuk fase vegetatif atau kebutuhan sulfur.',JSON_OBJECT('kandungan_n','20.8%','kandungan_s','23.8%','bentuk','kristal','warna','putih untuk non-subsidi, orange untuk subsidi','satuan_harga','kg / sak 50 kg','fungsi','Mendukung pertumbuhan vegetatif dan kualitas hasil.','catatan','Harga non-subsidi sekitar Rp198.750/50 kg dari referensi tonase.'),1),
('PUP-ZK','Pupuk & Nutrisi','Pupuk Kalium Sulfat','Pupuk ZK / Kalium Sulfat','pupuk-zk-kalium-sulfat','assets/image/pupuk/pupuk-zk.png','padi,jagung,kedelai','Generatif / kualitas hasil','saprodi','jumlah_x_harga','kg',7770,23000,'REFERENSI_TOKO_RESMI','Petromart, Sikumis, Petrokimia Gresik.','AGROTRACK_KATALOG_PUPUK_NUTRISI_PADI_JAGUNG_KEDELAI.md','2026-06-16','Pupuk kalium-sulfur untuk kualitas hasil.','Harga eceran dan bulk berbeda jauh.','Simpan harga sebagai rentang agar tidak menyesatkan.','Dipakai saat tanaman butuh K dan S, terutama bila sensitif klorida.',JSON_OBJECT('kandungan_k2o','50%','kandungan_s','17%','bentuk','serbuk putih','fungsi','Meningkatkan kualitas hasil, kekokohan tanaman, dan pengisian biji.','catatan','Harga eceran 1 kg dan bulk per ton berbeda signifikan.'),1),
('PUP-ORGANIK-GRANUL','Pupuk & Nutrisi','Pupuk Organik Padat','Pupuk Organik Granul / Petroganik','pupuk-organik-granul','assets/image/pupuk/pupuk-organik-granul.jpg','padi,jagung,kedelai','Pra-tanam / pupuk dasar','saprodi','jumlah_x_harga','kg',640,640,'HET_SUBSIDI','Pupuk Indonesia Petroganik; HET 2025.','AGROTRACK_KATALOG_PUPUK_NUTRISI_PADI_JAGUNG_KEDELAI.md','2026-06-16','Pupuk organik padat untuk perbaikan tanah.','Cocok sebagai fase dasar sebelum tanam.','Efek hara tidak secepat pupuk anorganik.','Gunakan sebagai penambah bahan organik, bukan pengganti total pupuk utama.',JSON_OBJECT('c_organik','±15%','ph','4-9','kadar_air','8-20%','c_n','15-25','bentuk','granul/butiran','fungsi','Memperbaiki sifat fisik, kimia, dan biologi tanah.','catatan','Kemasan subsidi 40 kg.'),1),
('PUP-KANDANG','Pupuk & Nutrisi','Pupuk Organik / Pembenah Tanah','Pupuk Kandang','pupuk-kandang-pupuk-nutrisi','assets/image/pupuk/pupuk-kandang.jpg','padi,jagung,kedelai','Pra-tanam / dasar','saprodi','jumlah_x_harga','kg',18000,172500,'PERLU_VERIFIKASI_LOKAL','Dinas Pertanian Pontianak; Blibli; Floria.','AGROTRACK_KATALOG_PUPUK_NUTRISI_PADI_JAGUNG_KEDELAI.md','2026-06-16','Pupuk organik dari kotoran ternak matang.','Harga sangat lokal dan kualitas bervariasi.','Harus matang agar aman untuk tanaman.','Isi harga dari pemasok lokal jika dipakai sebagai biaya musim ini.',JSON_OBJECT('bahan_umum','kotoran sapi/kambing/ayam','satuan_harga','kemasan/rit lokal','fungsi','Menambah bahan organik dan memperbaiki struktur tanah.','catatan','Kandungan hara sangat tergantung jenis ternak dan pengolahan.'),1),
('PUP-KOMPOS','Pupuk & Nutrisi','Pupuk Organik / Pembenah Tanah','Pupuk Kompos','pupuk-kompos-pupuk-nutrisi','assets/image/pupuk/pupuk-kompos.jpg','padi,jagung,kedelai','Pra-tanam / dasar','saprodi','jumlah_x_harga','kg',66600,66600,'REFERENSI_MARKETPLACE','MBizMarket, Shopee, Blibli.','AGROTRACK_KATALOG_PUPUK_NUTRISI_PADI_JAGUNG_KEDELAI.md','2026-06-16','Pupuk organik dari dekomposisi bahan organik.','Harga tergantung bahan baku dan ongkir.','Kompos yang belum matang bisa mengganggu tanaman.','Gunakan untuk memperbaiki tanah dan meningkatkan bahan organik.',JSON_OBJECT('bahan_umum','sisa tanaman dan limbah organik','satuan_harga','50 kg','fungsi','Memperbaiki tanah dan mendukung efisiensi pupuk kimia.','catatan','Harga kompos per kg/pack sangat bervariasi antar produk.'),1),
('PUP-POC','Pupuk & Nutrisi','Pupuk Organik Cair / Nutrisi Tambahan','Pupuk Organik Cair / POC','pupuk-organik-cair-poc','assets/image/pupuk/pupuk-organik-cair.jpg','padi,jagung,kedelai','Vegetatif / generatif','saprodi','jumlah_x_harga','liter',114000,120000,'REFERENSI_TOKO_RESMI','Petromart Official Store; Lazada Phonska OCA Plus.','AGROTRACK_KATALOG_PUPUK_NUTRISI_PADI_JAGUNG_KEDELAI.md','2026-06-16','Nutrisi tambahan dalam bentuk cair.','Jangan disamakan dengan pupuk utama.','Formulasi produk POC bisa berbeda-beda.','Gunakan sebagai nutrisi tambahan sesuai label.',JSON_OBJECT('bentuk','cair','satuan_harga','botol 1 liter','c_organik','minimal 10%','n_organik','minimal 0.5%','fungsi','Menambah nutrisi tambahan pada fase vegetatif atau generatif.','catatan','Phonska OCA Plus adalah contoh produk referensi.'),1);

UPDATE katalog_items
SET
  harga_min = 1800, harga_max = 1800, harga_status = 'HET_SUBSIDI',
  sumber_referensi = 'Pupuk Indonesia / Distribution Branding Urea Subsidi; HET Pupuk Subsidi 2025.',
  sumber_dokumen = 'AGROTRACK_KATALOG_PUPUK_NUTRISI_PADI_JAGUNG_KEDELAI.md',
  fungsi = 'Sumber nitrogen utama untuk fase pertumbuhan daun dan batang.',
  keterangan = 'Gunakan sesuai rekomendasi pemupukan setempat agar tidak berlebihan.',
  risiko = 'Pemakaian berlebihan dapat membuat tanaman terlalu vegetatif, rentan rebah, dan tidak efisien.',
  admin_note = 'Untuk kedelai, nitrogen perlu hati-hati karena bisa bersimbiosis dengan Rhizobium.',
  detail_json = JSON_OBJECT(
    'kandungan_n','46%',
    'kadar_biuret','1%',
    'bentuk','butiran/prill/granul putih',
    'satuan_harga','kg / sak 50 kg',
    'fungsi','Mempercepat pertumbuhan vegetatif dan mendukung pembentukan protein tanaman.',
    'catatan','HET subsidi 2025 Rp1.800/kg atau Rp90.000/50 kg.'
  )
WHERE kode = 'PUP-UREA';

UPDATE katalog_items
SET
  harga_min = 1840, harga_max = 1840, harga_status = 'HET_SUBSIDI',
  sumber_referensi = 'Pupuk Indonesia / Distribution Branding NPK Phonska; HET Pupuk Subsidi 2025.',
  fungsi = 'Pupuk majemuk NPK untuk mendukung pertumbuhan vegetatif, akar, dan pembentukan hasil.',
  keterangan = 'Cocok sebagai pupuk dasar atau susulan sesuai rekomendasi setempat.',
  risiko = 'Formula NPK tunggal tidak selalu cocok untuk semua kondisi tanah.',
  detail_json = JSON_OBJECT(
    'kandungan_n','15%',
    'kandungan_p2o5','10%',
    'kandungan_k2o','12%',
    'bentuk','granul',
    'satuan_harga','kg / sak 50 kg',
    'fungsi','Menyediakan tiga hara utama untuk tanaman.',
    'catatan','HET subsidi 2025 Rp1.840/kg atau Rp92.000/50 kg.'
  )
WHERE kode = 'PUP-NPK-PHONSKA';

UPDATE katalog_items
SET
  harga_min = 5995, harga_max = 1162000, harga_status = 'REFERENSI_MARKETPLACE',
  sumber_referensi = 'Petrokimia Gresik SP-36; Sikumis; Shopee listing SP-36 50 kg; Happy Tani.',
  fungsi = 'Sumber fosfat untuk akar, pembungaan, dan pembentukan hasil.',
  keterangan = 'Jangan pakai satu harga mutlak karena listing marketplace sangat bervariasi.',
  risiko = 'Harga sangat bervariasi dan pemberian sebaiknya mengikuti status hara tanah.',
  detail_json = JSON_OBJECT(
    'kandungan_p2o5_total_min','36%',
    'kandungan_p2o5_larut_asam_sitrat_min','34%',
    'kandungan_p2o5_larut_air_min','30%',
    'kadar_air_maks','5%',
    'bentuk','butiran abu-abu',
    'satuan_harga','sak 50 kg',
    'fungsi','Pupuk dasar yang penting untuk akar dan pembentukan hasil.',
    'catatan','Harga referensi dapat bergerak sangat lebar antar toko.'
  )
WHERE kode = 'PUP-SP36';

UPDATE katalog_items
SET
  harga_min = 198750, harga_max = 198750, harga_status = 'HET_SUBSIDI + REFERENSI',
  sumber_referensi = 'Petrokimia Gresik ZA; Pupuk Indonesia HET 2025; Sikumis/Petrokimia Gresik.',
  fungsi = 'Pupuk sumber nitrogen dan sulfur.',
  keterangan = 'Harga subsidi dan non-subsidi dipisah.',
  risiko = 'Jangan disamakan dengan urea.',
  detail_json = JSON_OBJECT(
    'kandungan_n','20.8%',
    'kandungan_s','23.8%',
    'bentuk','kristal',
    'warna','putih atau orange',
    'satuan_harga','kg / sak 50 kg',
    'fungsi','Mendukung pertumbuhan vegetatif dan kualitas hasil.',
    'catatan','Referensi non-subsidi sekitar Rp198.750/50 kg.'
  )
WHERE kode = 'PUP-ZA';

UPDATE katalog_items
SET
  harga_min = 485000, harga_max = 845000, harga_status = 'REFERENSI_MARKETPLACE',
  sumber_referensi = 'Pupuk Mahkota, Shopee, Blibli, JRice.',
  fungsi = 'Pupuk kalium utama untuk pengisian hasil dan kualitas panen.',
  keterangan = 'Harga marketplace sangat bervariasi.',
  risiko = 'Mengandung klorida sehingga tidak selalu cocok untuk semua tanaman.',
  detail_json = JSON_OBJECT(
    'kandungan_k2o','60% minimal',
    'bentuk','kristal/granul merah-putih',
    'satuan_harga','sak 50 kg',
    'fungsi','Meningkatkan kualitas hasil, pengisian biji, dan ketahanan stres.',
    'catatan','Untuk komoditas sensitif klorida, pertimbangkan ZK.'
  )
WHERE kode = 'PUP-KCL-MOP';

UPDATE katalog_items
SET
  harga_min = 16000, harga_max = 23000, harga_status = 'REFERENSI_TOKO_RESMI',
  sumber_referensi = 'Petromart, Sikumis, Petrokimia Gresik.',
  fungsi = 'Pupuk kalium-sulfur untuk kualitas hasil.',
  keterangan = 'Pakai rentang eceran per kg.',
  risiko = 'Harga eceran dan bulk berbeda jauh.',
  detail_json = JSON_OBJECT(
    'kandungan_k2o','50%',
    'kandungan_s','17%',
    'bentuk','serbuk putih',
    'satuan_harga','kg',
    'fungsi','Meningkatkan kualitas hasil, kekokohan tanaman, dan pengisian biji.',
    'catatan','Harga bulk per ton lebih rendah dibanding eceran.'
  )
WHERE kode = 'PUP-ZK';

UPDATE katalog_items
SET
  harga_min = 640, harga_max = 640, harga_status = 'HET_SUBSIDI',
  sumber_referensi = 'Pupuk Indonesia Petroganik; HET 2025.',
  fungsi = 'Pupuk organik padat untuk perbaikan tanah.',
  keterangan = 'Cocok sebagai fase dasar sebelum tanam.',
  risiko = 'Efek hara tidak secepat pupuk anorganik.',
  detail_json = JSON_OBJECT(
    'ph','4-9',
    'c_organik','15%',
    'kadar_air','8-20%',
    'c_n','15-25',
    'bentuk','granul/butiran',
    'fungsi','Memperbaiki sifat fisik, kimia, dan biologi tanah.',
    'catatan','Kemasan subsidi 40 kg.'
  )
WHERE kode = 'PUP-ORGANIK-GRANUL';

UPDATE katalog_items
SET
  harga_min = 18000, harga_max = 172500, harga_status = 'PERLU_VERIFIKASI_LOKAL',
  sumber_referensi = 'Dinas Pertanian Pontianak, Blibli, Floria.',
  fungsi = 'Pupuk organik dari kotoran ternak matang.',
  keterangan = 'Harga sangat lokal dan kualitas bervariasi.',
  risiko = 'Harus matang agar aman untuk tanaman.',
  detail_json = JSON_OBJECT(
    'bahan_umum','kotoran sapi/kambing/ayam',
    'satuan_harga','kemasan/rit lokal',
    'fungsi','Menambah bahan organik dan memperbaiki struktur tanah.',
    'catatan','Kandungan hara sangat tergantung jenis ternak dan pengolahan.'
  )
WHERE kode = 'PUP-KANDANG';

UPDATE katalog_items
SET
  harga_min = 66600, harga_max = 66600, harga_status = 'REFERENSI_MARKETPLACE',
  sumber_referensi = 'MBizMarket, Shopee, Blibli.',
  fungsi = 'Pupuk organik dari dekomposisi bahan organik.',
  keterangan = 'Harga tergantung bahan baku dan ongkir.',
  risiko = 'Kompos yang belum matang bisa mengganggu tanaman.',
  detail_json = JSON_OBJECT(
    'bahan_umum','sisa tanaman dan limbah organik',
    'satuan_harga','50 kg',
    'fungsi','Memperbaiki tanah dan meningkatkan bahan organik.',
    'catatan','Harga sangat bervariasi antar produk.'
  )
WHERE kode = 'PUP-KOMPOS';

UPDATE katalog_items
SET
  harga_min = 114000, harga_max = 120000, harga_status = 'REFERENSI_TOKO_RESMI',
  sumber_referensi = 'Petromart Official Store; Lazada Phonska OCA Plus.',
  fungsi = 'Nutrisi tambahan dalam bentuk cair.',
  keterangan = 'Jangan disamakan dengan pupuk utama.',
  risiko = 'Formulasi POC bisa berbeda-beda.',
  detail_json = JSON_OBJECT(
    'bentuk','cair',
    'satuan_harga','botol 1 liter',
    'c_organik','minimal 10%',
    'n_organik','minimal 0.5%',
    'fungsi','Menambah nutrisi tambahan pada fase vegetatif atau generatif.',
    'catatan','Phonska OCA Plus adalah contoh produk referensi.'
  )
WHERE kode = 'PUP-POC';

UPDATE katalog_items
SET
  detail_json = JSON_OBJECT(
    'fungsi','Inokulan hayati untuk kedelai.',
    'catatan','Mendukung penambatan nitrogen pada kedelai.'
  )
WHERE kode = 'PUP-RHIZOBIUM';
