USE agrotrack;

INSERT INTO katalog_items
(kode, kategori, subkategori, nama, slug, image_path, komoditas, fase, jenis_biaya, mode_biaya, satuan_default, harga_min, harga_max, harga_status, sumber_referensi, sumber_dokumen, tanggal_cek_harga, fungsi, keterangan, risiko, admin_note, detail_json, is_active)
VALUES
('BEN-PADI-MEKONGGA','Benih & Bibit','Padi','Benih Padi Mekongga','benih-padi-mekongga','assets/image/bibit/padi-mekongga.jpg','padi','Pra-tanam / Tanam','saprodi','jumlah_x_harga','kg',17000,23800,'TERVERIFIKASI_MARKETPLACE','Lazada Mekongga 5kg; Shopee Mekongga 5kg; Purotani Mekongga Kingkong 5kg.','AGROTRACK_KATALOG_BENIH_BIBIT_REVISI_BERBASIS_SUMBER.md','2026-06-16','Benih padi inbrida untuk sawah.','Harga referensi marketplace.','Kondisi lahan dan musim memengaruhi hasil nyata.','Gunakan label varietas jelas.',JSON_OBJECT('varietas','Mekongga','kebutuhan_benih_kg_per_ha','25-40','umur_panen_hari','116-125','rata_rata_hasil','6 ton/ha GKG','potensi_hasil','8 ton/ha GKG','tinggi_tanaman','±106 cm','kadar_amilosa','23%','berat_1000_butir','27-28 g','keunggulan','Tahan WBC biotipe 2; tahan HDB patotipe IV dan VIII.','catatan','Varietas populer sebagai pembanding benih padi modern.'),1),
('BEN-PADI-INPARI30','Benih & Bibit','Padi','Benih Padi Inpari 30 Ciherang Sub 1','benih-padi-inpari-30','assets/image/bibit/padi-inpari-30.jpg','padi','Pra-tanam / Tanam','saprodi','jumlah_x_harga','kg',19800,34000,'TERVERIFIKASI_MARKETPLACE','Shopee Inpari 30 5kg; Lazada Inpari 30 5kg.','AGROTRACK_KATALOG_BENIH_BIBIT_REVISI_BERBASIS_SUMBER.md','2026-06-16','Benih padi sawah genjah.','Harga pasar sangat bervariasi.','Klaim tahan rendaman perlu dibaca sebagai referensi, bukan jaminan.','',JSON_OBJECT('varietas','Inpari 30 Ciherang Sub 1','kebutuhan_benih_kg_per_ha','25-40','umur_panen_hari','111','potensi_hasil','9-9.6 ton/ha','keunggulan','Cocok untuk sawah irigasi dan area rawan rendaman.','catatan','Tampilkan sebagai opsi padi genjah dengan status harga terverifikasi marketplace.'),1),
('BEN-PADI-IR64','Benih & Bibit','Padi','Benih Padi IR64','benih-padi-ir64','assets/image/bibit/padi-ir64.jpg','padi','Pra-tanam / Tanam','saprodi','jumlah_x_harga','kg',18000,25000,'TERVERIFIKASI_MARKETPLACE','Purotani IR64 5kg; Shopee IR64 5kg.','AGROTRACK_KATALOG_BENIH_BIBIT_REVISI_BERBASIS_SUMBER.md','2026-06-16','Benih padi populer dan mudah dikenali petani.','Harga acuan marketplace.','Produktivitas tergantung lahan dan musim.','',JSON_OBJECT('varietas','IR64','kebutuhan_benih_kg_per_ha','25-40','umur_panen_hari','110-125','potensi_hasil','7-8 ton/ha','tinggi_tanaman','maks 85 cm','keunggulan','Tahan wereng coklat biotipe 1 dan 2; hemat air.','catatan','Cocok sebagai varietas pembanding klasik.'),1),
('BEN-PADI-SITU-BAGENDIT','Benih & Bibit','Padi','Benih Padi Situ Bagendit','benih-padi-situ-bagendit','assets/image/bibit/padi-situ-bagendit.png','padi','Pra-tanam / Tanam','saprodi','jumlah_x_harga','kg',19000,22705,'TERVERIFIKASI_MARKETPLACE','Lazada Situ Bagendit 5kg; Shopee Situ Bagendit 5kg.','AGROTRACK_KATALOG_BENIH_BIBIT_REVISI_BERBASIS_SUMBER.md','2026-06-16','Opsi benih padi untuk lahan yang sesuai.','Harga referensi 5 kg marketplace.','Potensi hasil berbeda antar lokasi.','',JSON_OBJECT('varietas','Situ Bagendit','kebutuhan_benih_kg_per_ha','25-40','umur_panen_hari','110-120','tinggi_tanaman','99-105 cm','rata_rata_hasil','3-5 ton/ha GKG','potensi_hasil','73.21 kuintal/ha/MT pada studi lokasi tertentu','keunggulan','Tekstur nasi pulen menurut deskripsi varietas.','catatan','Ada variasi hasil besar antar sumber sehingga wajib diberi catatan lokasi.'),1),
('BEN-JAGUNG-BIMA19','Benih & Bibit','Jagung','Benih Jagung Hibrida Bima 19 URI','benih-jagung-bima-19-uri','assets/image/bibit/jagung-bima-19.jpg','jagung','Pra-tanam / Tanam','saprodi','jumlah_x_harga','kg',31250,31250,'TERVERIFIKASI_KAJIAN','Kajian paket teknologi VUB jagung hibrida.','AGROTRACK_KATALOG_BENIH_BIBIT_REVISI_BERBASIS_SUMBER.md','2026-06-16','Jagung hibrida dengan data kajian produksi jelas.','Harga kajian, bukan marketplace terbaru.','Pastikan label Bima 19 URI, bukan Bima URI umum.','',JSON_OBJECT('varietas','Bima 19 URI','kebutuhan_benih_kg_per_ha','13.75-20','umur_panen_hari','102','potensi_hasil','12.5 ton/ha pipilan kering','rata_rata_hasil','±9.3 ton/ha KA 15%','keunggulan','Tahan bulai, toleran karat dan bercak daun, tahan rebah.','catatan','Gunakan sebagai referensi utama jagung Bima 19 URI.'),1),
('BEN-JAGUNG-JH21','Benih & Bibit','Jagung','Benih Jagung HJ 21 Agritan','benih-jagung-hj-21-agritan','assets/image/bibit/jagung-jh-21.jpg','jagung','Pra-tanam / Tanam','saprodi','jumlah_x_harga','kg',35150,70000,'TERVERIFIKASI_BERBEDA_SUMBER','Dokumen harga HJ21; Sikumis HJ21.','AGROTRACK_KATALOG_BENIH_BIBIT_REVISI_BERBASIS_SUMBER.md','2026-06-16','Benih jagung hibrida genjah.','Harga sangat bervariasi antar sumber.','Nama asset perlu dibaca sebagai HJ 21 Agritan.','',JSON_OBJECT('varietas','HJ 21 Agritan','kebutuhan_benih_kg_per_ha','13.75-20','umur_panen_hari','82','potensi_hasil','12.2 ton/ha','rata_rata_hasil','±11.4 ton/ha','tinggi_tanaman','223 cm','keunggulan','Tahan bulai, hawar daun, dan karat daun; stay green; adaptif 5-650 m dpl.','catatan','Gunakan range harga karena sumber berbeda jauh.'),1),
('BEN-JAGUNG-BIMAURI','Benih & Bibit','Jagung','Benih Jagung Bima URI / Bima 20 URI','benih-jagung-bima-uri','assets/image/bibit/jagung-bima-uri.jpg','jagung','Pra-tanam / Tanam','saprodi','jumlah_x_harga','kg',35000,35000,'TERVERIFIKASI_SEBAGIAN','Ralali Bima 20 URI 5kg.','AGROTRACK_KATALOG_BENIH_BIBIT_REVISI_BERBASIS_SUMBER.md','2026-06-16','Opsi jagung URI yang perlu verifikasi gambar.','Harga hanya valid bila label gambar sesuai.','Jangan disamakan dengan Bima 19 tanpa cek visual.','',JSON_OBJECT('varietas','Bima 20 URI / Bima URI umum','kebutuhan_benih_kg_per_ha','13.75-20','sumber_harga','Ralali Bima 20 URI 5kg','catatan','Pakai hanya jika identitas varietas pada aset sudah dipastikan.'),1),
('BEN-JAGUNG-SUKMARAGA','Benih & Bibit','Jagung','Benih Jagung Sukmaraga','benih-jagung-sukmaraga','assets/image/bibit/jagung-sukamarga.jpg','jagung','Pra-tanam / Tanam','saprodi','input_manual','kg',NULL,NULL,'BELUM_TERVERIFIKASI','Shopee listing Sukmaraga; DPKP DIY Sukmaraga.','AGROTRACK_KATALOG_BENIH_BIBIT_REVISI_BERBASIS_SUMBER.md','2026-06-16','Varietas jagung yang nama assetnya perlu koreksi.','Harga retail belum aman dihitung otomatis.','Ejaan varietas sebaiknya Sukmaraga.','',JSON_OBJECT('varietas','Sukmaraga','kebutuhan_benih_kg_per_ha','13.75-20','catatan','Harga belum cukup jelas untuk seed otomatis.','keunggulan','Dalam satu studi lapangan, hasil bisa tinggi, tetapi tergantung lokasi.'),1),
('BEN-KEDELAI-WILIS','Benih & Bibit','Kedelai','Benih Kedelai Wilis','benih-kedelai-wilis','assets/image/bibit/kedelai-wilis.jpg','kedelai','Pra-tanam / Tanam','saprodi','jumlah_x_harga','kg',45000,51364,'TERVERIFIKASI_MARKETPLACE','Lazada Wilis; Blibli bibit kedelai varietas Wilis.','AGROTRACK_KATALOG_BENIH_BIBIT_REVISI_BERBASIS_SUMBER.md','2026-06-16','Opsi kedelai klasik yang umum dikenal petani.','Harga online bervariasi tergantung penjual.','Gunakan sebagai pembanding varietas kedelai lain.','',JSON_OBJECT('varietas','Wilis','kebutuhan_benih_kg_per_ha','40-50','umur_panen_hari','85-90','produktivitas','1.6 ton/ha','keunggulan','Disebut tahan karat daun dan virus pada sumber jurnal.','catatan','Cocok untuk katalog pembanding kedelai lama.'),1),
('BEN-KEDELAI-GROBOGAN','Benih & Bibit','Kedelai','Benih Kedelai Grobogan','benih-kedelai-grobogan','assets/image/bibit/kedelai-grobogan.jpg','kedelai','Pra-tanam / Tanam','saprodi','jumlah_x_harga','kg',28995,50880,'TERVERIFIKASI_MARKETPLACE','Lazada Grobogan; Shopee Grobogan; BigGo Grobogan.','AGROTRACK_KATALOG_BENIH_BIBIT_REVISI_BERBASIS_SUMBER.md','2026-06-16','Kedelai berbiji besar untuk pangan olahan.','Harga tergantung kemasan dan marketplace.','Sesuaikan varietas dengan kebutuhan pasar.','',JSON_OBJECT('varietas','Grobogan','kebutuhan_benih_kg_per_ha','40-50','spesifikasi','Berbiji besar','keunggulan','Sering dipilih untuk tahu/tempe karena ukuran biji.','catatan','Harga marketplace cukup beragam sehingga pakai range.'),1),
('BEN-KEDELAI-DETAP1','Benih & Bibit','Kedelai','Benih Kedelai Detap 1','benih-kedelai-detap-1','assets/image/bibit/kedelai-detap-1.jpg','kedelai','Pra-tanam / Tanam','saprodi','input_manual','kg',NULL,NULL,'BELUM_TERVERIFIKASI','DPKP DIY Detap 1; sumber penelitian Detap 1.','AGROTRACK_KATALOG_BENIH_BIBIT_REVISI_BERBASIS_SUMBER.md','2026-06-16','Varietas kedelai unggul modern.','Harga retail belum cukup jelas.','Admin perlu isi harga manual sebelum dipakai biaya.','',JSON_OBJECT('varietas','Detap 1','kebutuhan_benih_kg_per_ha','40-50','catatan','Harga belum ditemukan jelas sehingga status tetap belum terverifikasi.','keunggulan','Beberapa sumber menekankan performa hasil dan ketahanan pecah polong.'),1);

UPDATE katalog_items
SET
  harga_min = 21600, harga_max = 23840, harga_status = 'TERVERIFIKASI_MARKETPLACE',
  sumber_referensi = 'Shopee/Lazada 5 kg, harga per kg dihitung dari dokumen katalog.',
  sumber_dokumen = 'AGROTRACK_KATALOG_BENIH_BIBIT_REVISI_BERBASIS_SUMBER.md',
  fungsi = 'Benih utama untuk budidaya padi sawah.',
  keterangan = 'Harga referensi katalog, admin tetap bisa edit sesuai toko lokal.',
  risiko = 'Harga berubah karena stok, wilayah, ongkir, diskon, dan kelas benih.',
  admin_note = 'Gunakan untuk opsi awal biaya benih padi.',
  detail_json = JSON_OBJECT(
    'varietas','Ciherang',
    'kebutuhan_benih_kg_per_ha','25-40',
    'umur_panen_hari','100-115',
    'potensi_hasil','6-8 ton/ha GKG',
    'keunggulan','Padi sawah populer dengan referensi ketahanan terbatas.',
    'catatan','Gunakan sebagai referensi, bukan janji hasil.'
  )
WHERE kode = 'BEN-PADI-CIHERANG';

UPDATE katalog_items
SET
  harga_min = 17000, harga_max = 28000, harga_status = 'TERVERIFIKASI_MARKETPLACE',
  sumber_referensi = 'Purotani dan Shopee list Inpari 32.',
  fungsi = 'Opsi benih padi inbrida untuk sawah.',
  keterangan = 'Simpan sebagai referensi, bukan janji hasil.',
  risiko = 'Ketahanan dan hasil dipengaruhi kondisi lahan dan musim.',
  detail_json = JSON_OBJECT(
    'varietas','Inpari 32 HDB',
    'kebutuhan_benih_kg_per_ha','25-40',
    'umur_panen_hari','120',
    'tinggi_tanaman','97 cm',
    'rata_rata_hasil','6.30 ton/ha GKG',
    'potensi_hasil','8.42 ton/ha GKG',
    'keunggulan','Tahan WBC biotipe 1, 2, 3; tahan HDB patotipe III, IV, VIII.',
    'catatan','Varietas inbrida turunan Ciherang.'
  )
WHERE kode = 'BEN-PADI-INPARI32';

UPDATE katalog_items
SET
  harga_min = 20000, harga_max = 35000, harga_status = 'TERVERIFIKASI_BERBEDA_SUMBER',
  sumber_referensi = 'Shopee/BigGo dan kajian VUB jagung hibrida.',
  fungsi = 'Benih jagung hibrida untuk musim tanam jagung.',
  keterangan = 'Rentang sumber berbeda, tampilkan sebagai referensi.',
  risiko = 'Harga hibrida sangat tergantung merek dan kemasan.',
  detail_json = JSON_OBJECT(
    'varietas','NASA 29',
    'kebutuhan_benih_kg_per_ha','13.75-20',
    'potensi_hasil','13.7 ton/ha',
    'keunggulan','Hibrida dengan potensi hasil tinggi.',
    'catatan','Harga dan hasil bervariasi antar sumber.'
  )
WHERE kode = 'BEN-JAGUNG-NASA29';

UPDATE katalog_items
SET
  harga_min = NULL, harga_max = NULL, harga_status = 'BELUM_TERVERIFIKASI',
  fungsi = 'Opsi katalog benih jagung, perlu harga dari admin.',
  keterangan = 'Harga wajib diisi manual sebelum dipakai sebagai biaya.',
  risiko = 'Jangan mengisi angka karangan.',
  detail_json = JSON_OBJECT(
    'varietas','JH 45',
    'kebutuhan_benih_kg_per_ha','13.75-20',
    'umur_tanaman','82 hari setelah tanam',
    'potensi_hasil','12.6 ton/ha',
    'keunggulan','Tahan rebah dan adaptif pada beberapa kondisi.',
    'catatan','Harga retail spesifik belum ditemukan jelas.'
  )
WHERE kode = 'BEN-JAGUNG-JH45';

UPDATE katalog_items
SET
  harga_min = 20000, harga_max = 38000, harga_status = 'TERVERIFIKASI_MARKETPLACE',
  sumber_referensi = 'Inaproc, Lazada, dan Shopee Anjasmoro.',
  fungsi = 'Benih kedelai populer untuk musim tanam kedelai.',
  detail_json = JSON_OBJECT(
    'varietas','Anjasmoro',
    'kebutuhan_benih_kg_per_ha','40-50',
    'umur_panen_hari','82-92',
    'protein','41.8%',
    'potensi_hasil','2.03-2.25 ton/ha',
    'keunggulan','Toleran tanah jenuh air, tidak mudah rebah, polong tidak mudah pecah.',
    'catatan','Cocok bahan baku tempe.'
  )
WHERE kode = 'BEN-KEDELAI-ANJASMORO';

UPDATE katalog_items
SET
  detail_json = JSON_OBJECT(
    'varietas','Dega 1',
    'kebutuhan_benih_kg_per_ha','40-50',
    'umur_panen_hari','69-73',
    'potensi_hasil','3.82 ton/ha',
    'protein','37.78%',
    'keunggulan','Umur genjah, tahan rebah, agak tahan karat daun dan pecah polong.',
    'catatan','Harga retail spesifik belum jelas.'
  )
WHERE kode = 'BEN-KEDELAI-DEGA1';

UPDATE katalog_items
SET
  detail_json = JSON_OBJECT(
    'varietas','Mekongga',
    'kebutuhan_benih_kg_per_ha','25-40',
    'umur_panen_hari','116-125',
    'rata_rata_hasil','6 ton/ha GKG',
    'potensi_hasil','8 ton/ha GKG',
    'keunggulan','Tahan WBC biotipe 2; tahan HDB patotipe IV dan VIII.',
    'catatan','Varietas populer sebagai pembanding benih padi modern.'
  )
WHERE kode = 'BEN-PADI-MEKONGGA';

UPDATE katalog_items
SET
  detail_json = JSON_OBJECT(
    'varietas','Inpari 30 Ciherang Sub 1',
    'kebutuhan_benih_kg_per_ha','25-40',
    'umur_panen_hari','111',
    'potensi_hasil','9-9.6 ton/ha',
    'keunggulan','Cocok untuk sawah irigasi dan area rawan rendaman.',
    'catatan','Tampilkan sebagai opsi padi genjah.'
  )
WHERE kode = 'BEN-PADI-INPARI30';

UPDATE katalog_items
SET
  detail_json = JSON_OBJECT(
    'varietas','IR64',
    'kebutuhan_benih_kg_per_ha','25-40',
    'umur_panen_hari','110-125',
    'potensi_hasil','7-8 ton/ha',
    'tinggi_tanaman','maks 85 cm',
    'keunggulan','Tahan wereng coklat biotipe 1 dan 2; hemat air.',
    'catatan','Cocok sebagai varietas pembanding klasik.'
  )
WHERE kode = 'BEN-PADI-IR64';

UPDATE katalog_items
SET
  detail_json = JSON_OBJECT(
    'varietas','Situ Bagendit',
    'kebutuhan_benih_kg_per_ha','25-40',
    'umur_panen_hari','110-120',
    'tinggi_tanaman','99-105 cm',
    'rata_rata_hasil','3-5 ton/ha GKG',
    'potensi_hasil','73.21 kuintal/ha/MT pada studi lokasi tertentu',
    'keunggulan','Tekstur nasi pulen.',
    'catatan','Hasil antar sumber bisa sangat berbeda.'
  )
WHERE kode = 'BEN-PADI-SITU-BAGENDIT';

UPDATE katalog_items
SET
  detail_json = JSON_OBJECT(
    'varietas','Bima 19 URI',
    'kebutuhan_benih_kg_per_ha','13.75-20',
    'umur_panen_hari','102',
    'potensi_hasil','12.5 ton/ha pipilan kering',
    'rata_rata_hasil','±9.3 ton/ha KA 15%',
    'keunggulan','Tahan bulai, toleran karat dan bercak daun, tahan rebah.',
    'catatan','Harga kajian Rp31.250/kg.'
  )
WHERE kode = 'BEN-JAGUNG-BIMA19';

UPDATE katalog_items
SET
  detail_json = JSON_OBJECT(
    'varietas','HJ 21 Agritan',
    'kebutuhan_benih_kg_per_ha','13.75-20',
    'umur_panen_hari','82',
    'potensi_hasil','12.2 ton/ha',
    'rata_rata_hasil','±11.4 ton/ha',
    'keunggulan','Tahan bulai, hawar daun, dan karat daun; stay green.',
    'catatan','Nama asset perlu disesuaikan dengan label HJ 21 Agritan.'
  )
WHERE kode = 'BEN-JAGUNG-JH21';

UPDATE katalog_items
SET
  detail_json = JSON_OBJECT(
    'varietas','Bima 20 URI / Bima URI umum',
    'kebutuhan_benih_kg_per_ha','13.75-20',
    'sumber_harga','Ralali Bima 20 URI 5kg',
    'catatan','Pakai hanya jika label gambar sesuai.'
  )
WHERE kode = 'BEN-JAGUNG-BIMAURI';

UPDATE katalog_items
SET
  detail_json = JSON_OBJECT(
    'varietas','Sukmaraga',
    'kebutuhan_benih_kg_per_ha','13.75-20',
    'catatan','Harga belum aman untuk seed otomatis.',
    'keunggulan','Dalam beberapa sumber uji lapangan, hasil bisa tinggi.'
  )
WHERE kode = 'BEN-JAGUNG-SUKMARAGA';

UPDATE katalog_items
SET
  detail_json = JSON_OBJECT(
    'varietas','Wilis',
    'kebutuhan_benih_kg_per_ha','40-50',
    'umur_panen_hari','85-90',
    'produktivitas','1.6 ton/ha',
    'keunggulan','Disebut tahan terhadap karat daun dan virus pada sumber jurnal.',
    'catatan','Cocok sebagai varietas kedelai lama pembanding.'
  )
WHERE kode = 'BEN-KEDELAI-WILIS';

UPDATE katalog_items
SET
  detail_json = JSON_OBJECT(
    'varietas','Grobogan',
    'kebutuhan_benih_kg_per_ha','40-50',
    'spesifikasi','Berbiji besar',
    'keunggulan','Sering dipilih untuk tahu/tempe karena ukuran biji.',
    'catatan','Harga marketplace cukup beragam.'
  )
WHERE kode = 'BEN-KEDELAI-GROBOGAN';

UPDATE katalog_items
SET
  detail_json = JSON_OBJECT(
    'varietas','Detap 1',
    'kebutuhan_benih_kg_per_ha','40-50',
    'keunggulan','Beberapa sumber menekankan performa hasil dan ketahanan pecah polong.',
    'catatan','Harga retail belum cukup jelas.'
  )
WHERE kode = 'BEN-KEDELAI-DETAP1';
