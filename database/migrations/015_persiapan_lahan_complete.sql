USE agrotrack;

INSERT INTO katalog_items
(kode, kategori, subkategori, nama, slug, image_path, komoditas, fase, jenis_biaya, mode_biaya, satuan_default, harga_min, harga_max, harga_status, sumber_referensi, sumber_dokumen, tanggal_cek_harga, fungsi, keterangan, risiko, admin_note, detail_json, is_active)
VALUES
('PRS-TRAKTOR','Persiapan Lahan','Alat Olah Tanah','Traktor Roda Dua / Hand Tractor','persiapan-traktor-roda-dua','assets/image/persiapan/persiapan-traktor-roda-dua.jpg','padi,jagung,kedelai','Pra-tanam','aset','jasa_per_ha','unit',15072000,60528000,'TERVERIFIKASI_CAMPURAN','Quick, Blibli, Indotrading, Inaproc, Antara Foto, IPB, UM-Palembang.','AGROTRACK_KATALOG_PERSIAPAN_LAHAN_PADI_JAGUNG_KEDELAI.md','2026-06-16','Mengolah tanah sebelum tanam.','Default biaya petani lebih cocok jasa per ha.', 'Modal beli tinggi, butuh operator dan perawatan.','Pilih mode jasa per hektar atau milik sendiri.',JSON_OBJECT('tipe_item','aset / sewa / jasa olah tanah','mode_biaya_opsional',JSON_ARRAY('beli_baru','jasa_per_ha','sewa_alat','milik_sendiri','pinjam_kelompok'),'satuan_opsional',JSON_ARRAY('unit','ha jasa'),'fungsi','Mempercepat pembajakan dan pengolahan tanah dibanding manual.','keunggulan','Menghemat waktu dan kuat untuk lahan pangan.','keterbatasan','Perlu BBM, operator, dan kondisi lahan sesuai.','catatan','Jasa per hektar paling realistis untuk petani.'),1),
('PRS-GARU','Persiapan Lahan','Alat Manual','Garu Tanah','persiapan-garu-tanah','assets/image/persiapan/persiapan-garu-tanah.jpg','padi,jagung,kedelai','Pra-tanam','aset','beli_baru','unit',9700,63999,'TERVERIFIKASI_MARKETPLACE_TERBATAS','Shopee, Lazada.','AGROTRACK_KATALOG_PERSIAPAN_LAHAN_PADI_JAGUNG_KEDELAI.md','2026-06-16','Meratakan tanah setelah pengolahan awal.','Banyak produk marketplace hanya alat taman kecil.','Pisahkan garu manual dan attachment jika katalog diperluas.','Untuk lahan kecil atau finishing.',JSON_OBJECT('tipe_item','alat manual / finishing olah tanah','mode_biaya_opsional',JSON_ARRAY('beli_baru','milik_sendiri','tenaga_kerja','aktivitas_tanpa_biaya'),'satuan_opsional',JSON_ARRAY('unit'),'fungsi','Meratakan dan merapikan tanah setelah pembajakan atau penggemburan.','keunggulan','Murah dan mudah dipakai di lahan kecil.','keterbatasan','Tidak semua produk cocok untuk sawah skala besar.','catatan','Pisahkan garu manual dan attachment.'),1),
('PRS-CANGKUL','Persiapan Lahan','Alat Manual','Cangkul / Pacul','persiapan-cangkul','assets/image/persiapan/persiapan-cangkul.jpg','padi,jagung,kedelai','Pra-tanam / perawatan lahan','aset','beli_baru','unit',21999,163000,'TERVERIFIKASI_MARKETPLACE','Blibli, Shopee, Lazada, BigGo.','AGROTRACK_KATALOG_PERSIAPAN_LAHAN_PADI_JAGUNG_KEDELAI.md','2026-06-16','Mengolah tanah manual dan perbaikan kecil.','Murah, fleksibel, hampir selalu relevan.','Lambat untuk lahan luas.','Bisa biaya alat atau tenaga kerja manual.',JSON_OBJECT('tipe_item','alat manual','mode_biaya_opsional',JSON_ARRAY('beli_baru','milik_sendiri','tenaga_kerja','aktivitas_tanpa_biaya'),'satuan_opsional',JSON_ARRAY('unit'),'fungsi','Mengolah tanah manual, memperbaiki pematang, membuat saluran kecil.','keunggulan','Fleksibel dan murah.','keterbatasan','Lambat untuk lahan luas.','catatan','Harga alat kecil, tetapi tenaga kerja manual bisa besar.'),1),
('PRS-BERSIH-LAHAN','Persiapan Lahan','Tenaga Kerja','Pembersihan Lahan','persiapan-pembersihan-lahan','assets/image/persiapan/persiapan-pembersihan-lahan.jpg','padi,jagung,kedelai','Pra-tanam','aktivitas','tenaga_kerja','input manual',NULL,NULL,'INPUT_MANUAL_LOKAL','BPS, Cross-Border, Kementan, UNIKS.','AGROTRACK_KATALOG_PERSIAPAN_LAHAN_PADI_JAGUNG_KEDELAI.md','2026-06-16','Membersihkan sisa tanaman/gulma/material sebelum tanam.','Tidak ada harga nasional stabil.','Hitung dari upah harian x jumlah pekerja x hari.', 'Dicatat sebagai aktivitas dan tenaga kerja.',JSON_OBJECT('tipe_item','aktivitas / jasa / tenaga kerja','mode_biaya_opsional',JSON_ARRAY('tenaga_kerja','jasa_per_hari','gotong_royong','aktivitas_tanpa_biaya','input_manual'),'fungsi','Membersihkan sisa tanaman, gulma, sampah lahan sebelum tanam.','keunggulan','Fase awal nyata yang sering berbiaya tenaga kerja.','keterbatasan','Tergantung kondisi awal lahan.','catatan','Lebih baik dicatat sebagai aktivitas.'),1),
('PRS-BEDENGAN-LAHAN','Persiapan Lahan','Bedengan','Pembuatan Bedengan','persiapan-bedengan','assets/image/persiapan/persiapan-bedengan.jpg','jagung,kedelai,padi','Pra-tanam','jasa','jasa_per_meter','meter',50000,3000000,'TERVERIFIKASI_SEBAGIAN','SipLah Blibli, DKPPP Temanggung, UNIKS, Jurnal PNL.','AGROTRACK_KATALOG_PERSIAPAN_LAHAN_PADI_JAGUNG_KEDELAI.md','2026-06-16','Membentuk guludan/bedengan untuk drainase dan jalur tanam.','Tarif sangat lokal; satuan bervariasi.','Biarkan user memilih meter, HOK, ha, atau input manual.', 'Cocok untuk lahan kering dan pengaturan air.',JSON_OBJECT('tipe_item','aktivitas / jasa / tenaga kerja','mode_biaya_opsional',JSON_ARRAY('jasa_per_meter','jasa_per_ha','tenaga_kerja','milik_sendiri','input_manual'),'satuan_opsional',JSON_ARRAY('meter','HOK','ha'),'fungsi','Membentuk bedengan untuk drainase, aerasi, dan jalur tanam.','keunggulan','Sangat relevan untuk jagung dan kedelai.','keterbatasan','Satuan biaya bisa meter/HOK/hari/ha.','catatan','UI harus membiarkan user memilih satuan.'),1),
('PRS-PEMATANG-SAWAH','Persiapan Lahan','Pematang Sawah','Perbaikan Pematang Sawah','persiapan-pematang-sawah','assets/image/persiapan/persiapan-pematang-sawah.jpg','padi','Pra-tanam / selama musim','aktivitas','tenaga_kerja','input manual',NULL,NULL,'INPUT_MANUAL_LOKAL','BBWS, studi kebutuhan air tanaman, Cross-Border.','AGROTRACK_KATALOG_PERSIAPAN_LAHAN_PADI_JAGUNG_KEDELAI.md','2026-06-16','Menahan air dan membatasi petakan sawah.','Biaya bergantung panjang dan tingkat kerusakan.','Sangat penting untuk padi sawah.','Catat sebagai tenaga kerja/gotong royong/input manual.',JSON_OBJECT('tipe_item','aktivitas / perawatan lahan / tenaga kerja','mode_biaya_opsional',JSON_ARRAY('tenaga_kerja','gotong_royong','aktivitas_tanpa_biaya','input_manual'),'fungsi','Menahan air di petakan sawah dan membatasi area tanam.','keunggulan','Sangat penting untuk padi sawah.','keterbatasan','Tidak ada harga nasional.','catatan','Masuk fase pra-tanam dan perawatan air/lahan.'),1);

UPDATE katalog_items
SET
  kategori = 'Persiapan Lahan',
  subkategori = 'Attachment Olah Tanah',
  nama = 'Bajak Singkal',
  slug = 'persiapan-bajak-singkal',
  image_path = 'assets/image/persiapan/persiapan-bajak-singkal.jpg',
  komoditas = 'padi,jagung,kedelai',
  fase = 'Pra-tanam',
  jenis_biaya = 'aset',
  mode_biaya = 'jasa_per_ha',
  satuan_default = 'unit',
  harga_min = 28194000, harga_max = 28194000, harga_status = 'TERVERIFIKASI_PRODUK_SPESIFIK',
  sumber_referensi = 'Inaproc Yanmar traktor tangan tipe singkal.',
  sumber_dokumen = 'AGROTRACK_KATALOG_PERSIAPAN_LAHAN_PADI_JAGUNG_KEDELAI.md',
  fungsi = 'Membalik tanah dan membuka lapisan tanah.',
  keterangan = 'Biasanya melekat pada traktor/jasa bajak.',
  risiko = 'Harga attachment spesifik perlu verifikasi lokal.',
  admin_note = 'Dalam biaya petani sering melekat pada jasa bajak.',
  detail_json = JSON_OBJECT('tipe_item','attachment / alat olah tanah','mode_biaya_opsional',JSON_ARRAY('beli_baru','milik_sendiri','jasa_per_ha','pinjam_kelompok'),'satuan_opsional',JSON_ARRAY('unit','paket jasa'),'fungsi','Membalik tanah, menutup sisa tanaman/gulma, dan membuka lapisan tanah.','keunggulan','Cocok untuk pembajakan awal dan tanah berat.','keterbatasan','Biasanya dipakai bersama traktor.','catatan','Sering melekat pada jasa bajak, bukan dibeli terpisah.')
WHERE kode = 'PRS-BAJAK';

UPDATE katalog_items
SET
  kategori = 'Persiapan Lahan',
  subkategori = 'Attachment Olah Tanah',
  nama = 'Rotavator / Bajak Rotary',
  slug = 'persiapan-rotavator',
  image_path = 'assets/image/persiapan/persiapan-rotavator.jpg',
  komoditas = 'padi,jagung,kedelai',
  fase = 'Pra-tanam',
  jenis_biaya = 'aset',
  mode_biaya = 'jasa_per_ha',
  satuan_default = 'unit',
  harga_min = 1215000, harga_max = 47928000, harga_status = 'TERVERIFIKASI_MARKETPLACE',
  sumber_referensi = 'Quick, Lazada, Shopee.',
  sumber_dokumen = 'AGROTRACK_KATALOG_PERSIAPAN_LAHAN_PADI_JAGUNG_KEDELAI.md',
  fungsi = 'Menggemburkan dan meratakan tanah.',
  keterangan = 'Cocok setelah pembajakan awal.',
  risiko = 'Biaya tergantung alat, operator, dan kondisi tanah.',
  admin_note = 'Bisa dicatat sebagai jasa olah tanah atau biaya alat sendiri.',
  detail_json = JSON_OBJECT('tipe_item','attachment / alat olah tanah','mode_biaya_opsional',JSON_ARRAY('beli_baru','milik_sendiri','jasa_per_ha','sewa_alat'),'fungsi','Menghancurkan bongkahan tanah, menggemburkan, dan meratakan lahan.','keunggulan','Hasil olah tanah lebih halus.','keterbatasan','Tidak selalu diperlukan jika cukup bajak/garu.','catatan','Cocok untuk padi sawah setelah bajak dan lahan jagung/kedelai sebelum bedengan.')
WHERE kode = 'PRS-ROTAVATOR';
