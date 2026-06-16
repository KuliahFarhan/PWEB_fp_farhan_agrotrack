USE agrotrack;

INSERT INTO katalog_items
(kode, kategori, subkategori, nama, slug, image_path, komoditas, fase, jenis_biaya, mode_biaya, satuan_default, harga_min, harga_max, harga_status, sumber_referensi, sumber_dokumen, tanggal_cek_harga, fungsi, keterangan, risiko, admin_note, detail_json, is_active)
VALUES
('PEM-KAPUR-KALSIT','Pembenah Tanah','Pengapuran','Kapur Pertanian / Kaptan / Kalsit','pembenah-kapur-pertanian-kalsit','assets/image/pembenah_tanaman/pembenah-kapur-pertanian.jpg','padi,jagung,kedelai','Pra-tanam','saprodi','jumlah_x_harga','kg',66000,150000,'TERVERIFIKASI_SEBAGIAN','Harga pasar kapur/dolomit; kalsit spesifik perlu verifikasi.','AGROTRACK_KATALOG_PEMBENAH_TANAH_PADI_JAGUNG_KEDELAI.md','2026-06-16','Koreksi pH tanah asam dan sumber kalsium.','Harga kalsit spesifik belum kuat.','Perlu pH tanah sebelum aplikasi.','Pisahkan dari dolomit karena komposisi berbeda.',JSON_OBJECT('subkategori','Pengapuran','fase_penggunaan','Pra-tanam','relevan_untuk','Padi, Jagung, Kedelai pada tanah masam','fungsi','Menaikkan pH tanah asam dan memasok kalsium.','keunggulan','Cocok untuk koreksi pH.','keterbatasan','Tidak identik dengan dolomit; dominan Ca, bukan Ca+Mg.','catatan','Pakai bila pH tanah memang terlalu rendah.'),1),
('PEM-ZEOLIT','Pembenah Tanah','Mineral pembenah','Zeolit Pertanian','pembenah-zeolit-pertanian','assets/image/pembenah_tanaman/pembenah-zeolit.jpg','padi,jagung,kedelai','Pra-tanam / dasar','saprodi','jumlah_x_harga','kg',15000,270000,'TERVERIFIKASI_MARKETPLACE','Blibli, Lazada, Shopee, Indonetwork.','AGROTRACK_KATALOG_PEMBENAH_TANAH_PADI_JAGUNG_KEDELAI.md','2026-06-16','Pembenah mineral untuk daya simpan air dan hara.','Manfaat tergantung tipe zeolit dan dosis.','Jangan disamakan dengan pupuk utama.','Tampilkan sebagai pembenah mineral.',JSON_OBJECT('subkategori','Mineral pembenah / adsorben','fase_penggunaan','Pra-tanam / dasar','satuan_opsional',JSON_ARRAY('1 kg','2 kg','50 kg'),'fungsi','Mendukung perbaikan sifat tanah, retensi air, dan efisiensi hara.','keunggulan','Mineral berpori dan stabil.','keterbatasan','Efek dipengaruhi ukuran partikel dan kondisi tanah.','catatan','Cocok untuk lahan dengan masalah retensi hara/air.'),1),
('PEM-BIOCHAR','Pembenah Tanah','Karbon organik','Biochar / Arang Hayati','pembenah-biochar-arang-hayati','assets/image/pembenah_tanaman/pembenah-biochar.jpg','padi,jagung,kedelai','Pra-tanam / dasar','saprodi','jumlah_x_harga','kg',1000,1500000,'TERVERIFIKASI_SEBAGIAN','UWKS, Shopee, Lazada, WasteX.','AGROTRACK_KATALOG_PEMBENAH_TANAH_PADI_JAGUNG_KEDELAI.md','2026-06-16','Meningkatkan karbon stabil dan daya simpan air/hara.','Kualitas sangat tergantung bahan baku dan proses.','Tidak semua biochar sama.','Cocok untuk narasi pertanian berkelanjutan.',JSON_OBJECT('subkategori','Karbon stabil / organik','fase_penggunaan','Pra-tanam / dasar','satuan_opsional',JSON_ARRAY('1 kg','5 kg','ton'),'fungsi','Meningkatkan karbon stabil, daya simpan air, dan kualitas fisik tanah.','keunggulan','Memanfaatkan limbah biomassa.','keterbatasan','Tergantung bahan baku dan pirolisis.','catatan','Harga besar skala bulk jauh lebih murah per kg.'),1),
('PEM-ARANG-SEKAM','Pembenah Tanah','Bahan organik','Arang Sekam','pembenah-arang-sekam','assets/image/pembenah_tanaman/pembenah-arang-sekam.jpg','padi,jagung,kedelai','Pra-tanam / media','saprodi','jumlah_x_harga','kg',8900,22900,'PERLU_VERIFIKASI_LAPANGAN','Media tanam kecil dan referensi online.','AGROTRACK_KATALOG_PEMBENAH_TANAH_PADI_JAGUNG_KEDELAI.md','2026-06-16','Membantu aerasi dan campuran media tanam.','Data skala sawah belum kuat.','Harga online sering untuk hobi/media tanam.','Biarkan admin mengisi harga lokal bila dipakai.',JSON_OBJECT('subkategori','Bahan organik / media tanam','fase_penggunaan','Pra-tanam / media','satuan_opsional',JSON_ARRAY('kg','liter','karung'),'fungsi','Memperbaiki aerasi, porositas, dan campuran media.','keunggulan','Ringan dan mudah dicari dari limbah sekam.','keterbatasan','Harga publik sering bukan skala pertanian sawah.','catatan','Cocok sebagai bahan pendukung pembenah/media.'),1),
('PEM-ASAM-HUMAT','Pembenah Tanah','Bahan organik aktif','Asam Humat / Humic Acid','pembenah-asam-humat','assets/image/pembenah_tanaman/pembenah-asam-humat.jpg','padi,jagung,kedelai','Pra-tanam / awal pertumbuhan / susulan tertentu','saprodi','jumlah_x_harga','kg',28999,90900,'TERVERIFIKASI_MARKETPLACE','IJAS, Shopee, Lazada, Blibli.','AGROTRACK_KATALOG_PEMBENAH_TANAH_PADI_JAGUNG_KEDELAI.md','2026-06-16','Mendukung perbaikan tanah dan ketersediaan hara.','Konsentrasi produk berbeda-beda.','Wajib tampilkan konsentrasi bila produk spesifik.','Tampilkan merek/konsentrasi jika admin memilih produk tertentu.',JSON_OBJECT('subkategori','Bahan organik aktif / humic acid','fase_penggunaan','Pra-tanam / awal pertumbuhan / susulan tertentu','satuan_opsional',JSON_ARRAY('1 kg','500 g','1 liter'),'fungsi','Membantu perbaikan sifat tanah dan penyerapan hara.','keunggulan','Bisa bentuk serbuk atau cair.','keterbatasan','Efektivitas tergantung merek dan konsentrasi.','catatan','Jangan samakan semua asam humat.'),1),
('PEM-GYPSUM','Pembenah Tanah','Kalsium-sulfur / kondisi khusus','Gypsum Pertanian / Kalsium Sulfat','pembenah-gypsum-pertanian','assets/image/pembenah_tanaman/pembenah-gypsum.jpg','padi,jagung,kedelai','Pra-tanam / kondisi khusus','saprodi','jumlah_x_harga','kg',150000,185000,'TERVERIFIKASI_PRODUK_SPESIFIK','Gypblend, Prima Tani, Happy Tani, Sadewa Agri Jaya.','AGROTRACK_KATALOG_PEMBENAH_TANAH_PADI_JAGUNG_KEDELAI.md','2026-06-16','Sumber kalsium dan sulfur untuk tanah tertentu.','Tidak wajib untuk semua lahan.','Perlu diagnosis tanah.','Tampilkan sebagai item opsional/kondisi khusus.',JSON_OBJECT('subkategori','Kalsium-sulfur / koreksi tanah tertentu','fase_penggunaan','Pra-tanam / pembenahan tanah spesifik','satuan_opsional',JSON_ARRAY('5 kg','25 kg'),'fungsi','Menyediakan kalsium dan sulfur; membantu perbaikan struktur pada tanah bermasalah tertentu.','keunggulan','Berguna pada tanah salin/sodik atau butuh Ca/S.','keterbatasan','Tidak cocok untuk semua lahan.','catatan','Gunakan sesuai kondisi tanah.'),1),
('PEM-DEKOMPOSER','Pembenah Tanah','Bioaktivator','Dekomposer Bahan Organik','pembenah-dekomposer-bahan-organik','assets/image/pembenah_tanaman/pembenah-dekomposer.jpg','padi,jagung,kedelai','Pra-tanam / pengomposan sisa tanaman','saprodi','jumlah_x_harga','kg',21200,85000,'TERVERIFIKASI_MARKETPLACE','Stardec, EM4, Beka, Indotrading.','AGROTRACK_KATALOG_PEMBENAH_TANAH_PADI_JAGUNG_KEDELAI.md','2026-06-16','Membantu penguraian bahan organik dan pembuatan kompos.','Efektivitas tergantung kelembapan, bahan, dan cara aplikasi.','Cocok untuk olah jerami dan sisa tanaman.','Hubungkan sisa panen ke pembenahan tanah.',JSON_OBJECT('subkategori','Bioaktivator / pengurai bahan organik','fase_penggunaan','Pra-tanam / pengolahan sisa tanaman / pembuatan kompos','satuan_opsional',JSON_ARRAY('1 kg','1 liter'),'fungsi','Mempercepat penguraian jerami, sisa tanaman, dan bahan kompos.','keunggulan','Menghubungkan sisa panen ke pembenahan tanah.','keterbatasan','Tergantung bahan organik, suhu, dan aplikasi.','catatan','Cocok untuk integrasi pascapanen-pra-tanam.'),1);

UPDATE katalog_items
SET
  harga_min = 33300, harga_max = 82500, harga_status = 'REFERENSI_MARKETPLACE',
  sumber_referensi = 'BibitBunga, Shopee, Lazada.',
  sumber_dokumen = 'AGROTRACK_KATALOG_PEMBENAH_TANAH_PADI_JAGUNG_KEDELAI.md',
  fungsi = 'Membantu menaikkan pH tanah masam dan memasok Ca/Mg.',
  keterangan = 'Umumnya diaplikasikan sebelum tanam agar bereaksi lebih dulu di tanah.',
  risiko = 'Tidak semua lahan butuh dolomit; dosis berlebih dapat mengganggu keseimbangan hara.',
  admin_note = 'Tampilkan sebagai item pra-tanam dan beri label gunakan berdasarkan pH tanah.',
  detail_json = JSON_OBJECT(
    'subkategori','Pengapuran / pH correction',
    'fase_penggunaan','Pra-tanam',
    'relevan_untuk','Padi, Jagung, Kedelai terutama pada tanah masam',
    'satuan_umum','kg, zak 25 kg, zak 50 kg',
    'fungsi','Menaikkan pH tanah masam dan menambah kalsium serta magnesium.',
    'keunggulan','Cocok untuk lahan masam dan murah per kg.',
    'keterbatasan','Perlu pH tanah dan dosis yang tepat.',
    'catatan','Gunakan berdasarkan hasil pH tanah.'
  )
WHERE kode = 'PEM-DOLOMIT';

UPDATE katalog_items
SET
  harga_min = 33300, harga_max = 150000, harga_status = 'TERVERIFIKASI_SEBAGIAN',
  sumber_referensi = 'Harga pasar kapur/dolomit; kalsit spesifik perlu verifikasi.',
  fungsi = 'Koreksi pH tanah asam dan sumber kalsium.',
  keterangan = 'Harga kalsit spesifik belum kuat.',
  risiko = 'Perlu pH tanah sebelum aplikasi.',
  admin_note = 'Pisahkan dari dolomit karena komposisi berbeda.',
  detail_json = JSON_OBJECT(
    'subkategori','Pengapuran',
    'fase_penggunaan','Pra-tanam',
    'relevan_untuk','Padi, Jagung, Kedelai pada tanah masam',
    'satuan_umum','kg, zak 25 kg, zak 50 kg',
    'fungsi','Menaikkan pH tanah asam dan memasok kalsium.',
    'keunggulan','Cocok untuk correction pH.',
    'keterbatasan','Tidak identik dengan dolomit; dominan Ca.',
    'catatan','Pakai bila pH tanah memang terlalu rendah.'
  )
WHERE kode = 'PEM-KAPUR-KALSIT';

UPDATE katalog_items
SET
  harga_min = 15000, harga_max = 270000, harga_status = 'TERVERIFIKASI_MARKETPLACE',
  sumber_referensi = 'Blibli, Lazada, Shopee, Indonetwork.',
  fungsi = 'Pembenah mineral untuk daya simpan air dan hara.',
  detail_json = JSON_OBJECT(
    'subkategori','Mineral pembenah / adsorben',
    'fase_penggunaan','Pra-tanam / dasar',
    'satuan_opsional',JSON_ARRAY('1 kg','2 kg','50 kg'),
    'fungsi','Mendukung perbaikan sifat tanah, retensi air, dan efisiensi hara.',
    'keunggulan','Mineral berpori dan stabil.',
    'keterbatasan','Efek dipengaruhi ukuran partikel dan kondisi tanah.',
    'catatan','Tampilkan sebagai pembenah mineral.'
  )
WHERE kode = 'PEM-ZEOLIT';

UPDATE katalog_items
SET
  harga_min = 1000, harga_max = 1500000, harga_status = 'TERVERIFIKASI_SEBAGIAN',
  sumber_referensi = 'UWKS, Shopee, Lazada, WasteX.',
  fungsi = 'Meningkatkan karbon stabil dan daya simpan air/hara.',
  detail_json = JSON_OBJECT(
    'subkategori','Karbon stabil / organik',
    'fase_penggunaan','Pra-tanam / dasar',
    'satuan_opsional',JSON_ARRAY('1 kg','5 kg','ton'),
    'fungsi','Meningkatkan karbon stabil, daya simpan air, dan kualitas fisik tanah.',
    'keunggulan','Memanfaatkan limbah biomassa.',
    'keterbatasan','Tergantung bahan baku dan pirolisis.',
    'catatan','Harga bulk jauh lebih murah per kg.'
  )
WHERE kode = 'PEM-BIOCHAR';

UPDATE katalog_items
SET
  harga_min = 8900, harga_max = 22900, harga_status = 'PERLU_VERIFIKASI_LAPANGAN',
  sumber_referensi = 'Media tanam kecil dan referensi online.',
  fungsi = 'Membantu aerasi dan campuran media tanam.',
  detail_json = JSON_OBJECT(
    'subkategori','Bahan organik / media tanam',
    'fase_penggunaan','Pra-tanam / media',
    'satuan_opsional',JSON_ARRAY('kg','liter','karung'),
    'fungsi','Memperbaiki aerasi, porositas, dan campuran media.',
    'keunggulan','Ringan dan mudah dicari dari limbah sekam.',
    'keterbatasan','Data harga sawah skala besar belum kuat.',
    'catatan','Cocok sebagai bahan pendukung pembenah/media.'
  )
WHERE kode = 'PEM-ARANG-SEKAM';

UPDATE katalog_items
SET
  harga_min = 52000, harga_max = 75000, harga_status = 'TERVERIFIKASI_MARKETPLACE',
  sumber_referensi = 'Tisera, Shopee, Lazada, Blibli.',
  fungsi = 'Menambah bahan organik dan memperbaiki struktur tanah.',
  detail_json = JSON_OBJECT(
    'subkategori','Organik',
    'fase_penggunaan','Pra-tanam / pupuk dasar',
    'satuan_umum','25 kg / sak',
    'fungsi','Menambah bahan organik dan membantu memperbaiki struktur tanah.',
    'keunggulan','Relevan untuk semua tanaman.',
    'keterbatasan','Kualitas tergantung kematangan dan bahan baku.',
    'catatan','Gunakan kompos matang, bukan bahan organik mentah.'
  )
WHERE kode = 'PEM-KOMPOS';

UPDATE katalog_items
SET
  harga_min = 85000, harga_max = 125000, harga_status = 'TERVERIFIKASI_MARKETPLACE',
  sumber_referensi = 'Floria, Lazada, Shopee, Blibli.',
  fungsi = 'Menambah bahan organik dan mendukung aktivitas mikroba.',
  detail_json = JSON_OBJECT(
    'subkategori','Organik',
    'fase_penggunaan','Pra-tanam / dasar',
    'satuan_umum','25 kg / sak',
    'fungsi','Menambah bahan organik dan memperbaiki struktur tanah.',
    'keunggulan','Familiar bagi petani.',
    'keterbatasan','Harus matang/terfermentasi.',
    'catatan','Tampilkan istilah matang/fermentasi.'
  )
WHERE kode = 'PEM-KANDANG';

UPDATE katalog_items
SET
  harga_min = 21200, harga_max = 85000, harga_status = 'TERVERIFIKASI_MARKETPLACE',
  sumber_referensi = 'Stardec, EM4, Beka, Inaproc, Indotrading.',
  fungsi = 'Membantu penguraian bahan organik dan pembuatan kompos.',
  detail_json = JSON_OBJECT(
    'subkategori','Bioaktivator / pengurai bahan organik',
    'fase_penggunaan','Pra-tanam / pengolahan sisa tanaman / pembuatan kompos',
    'satuan_opsional',JSON_ARRAY('1 kg','1 liter'),
    'fungsi','Mempercepat penguraian jerami, sisa tanaman, dan bahan kompos.',
    'keunggulan','Menghubungkan sisa panen ke pembenahan tanah.',
    'keterbatasan','Tergantung kelembapan, bahan, dan cara aplikasi.',
    'catatan','Cocok untuk olah jerami/sisa tanaman.'
  )
WHERE kode = 'PEM-DEKOMPOSER';
