USE agrotrack;

UPDATE katalog_items
SET
  kategori = 'Air & Irigasi',
  subkategori = 'Pipa Irigasi',
  nama = 'Pipa Irigasi PVC/HDPE',
  slug = 'irigasi-pipa',
  image_path = 'assets/image/irigasi/irigasi-pipa.jpg',
  komoditas = 'padi,jagung,kedelai',
  fase = 'Pra-tanam / instalasi',
  jenis_biaya = 'aset',
  mode_biaya = 'beli_baru',
  satuan_default = 'meter',
  harga_min = 62600, harga_max = 701219, harga_status = 'TERVERIFIKASI_MARKETPLACE_DAN_DISTRIBUTOR',
  sumber_referensi = 'Lazada dan Alia Jaya.',
  sumber_dokumen = 'AGROTRACK_KATALOG_AIR_IRIGASI_PADI_JAGUNG_KEDELAI.md',
  fungsi = 'Jalur air semi permanen yang lebih stabil dari selang.',
  keterangan = 'Harga bergantung diameter, panjang, dan fitting.',
  risiko = 'Butuh instalasi dan kurang fleksibel dari selang.',
  admin_note = 'Hitung per meter dan biaya fitting.',
  detail_json = JSON_OBJECT('tipe_item','aset/infrastruktur kecil','mode_biaya_opsional',JSON_ARRAY('beli_baru','milik_sendiri','iuran','jasa_instalasi'),'satuan_opsional',JSON_ARRAY('meter','roll'),'fungsi','Menyalurkan air lebih permanen dan rapi dibanding selang fleksibel.','keunggulan','Lebih tahan lama.','keterbatasan','Biaya awal lebih tinggi dan butuh sambungan/fitting.','catatan','Cocok untuk jalur air semi permanen.')
WHERE kode = 'AIR-PIPA';

UPDATE katalog_items
SET
  kategori = 'Air & Irigasi',
  subkategori = 'Jaringan Air',
  nama = 'Saluran Irigasi Sawah',
  slug = 'irigasi-saluran-sawah',
  image_path = 'assets/image/irigasi/irigasi-saluran-sawah.jpg',
  komoditas = 'padi,jagung,kedelai',
  fase = 'Sepanjang musim',
  jenis_biaya = 'infrastruktur',
  mode_biaya = 'iuran',
  satuan_default = 'input manual',
  harga_min = NULL, harga_max = NULL, harga_status = 'INPUT_MANUAL_LOKAL',
  sumber_referensi = 'BBWS Mesuji Sekampung; studi kebutuhan air tanaman.',
  sumber_dokumen = 'AGROTRACK_KATALOG_AIR_IRIGASI_PADI_JAGUNG_KEDELAI.md',
  fungsi = 'Mengalirkan air dari jaringan/sumber ke petakan lahan.',
  keterangan = 'Lebih cocok dicatat sebagai iuran/perawatan.',
  risiko = 'Tergantung jadwal air dan kondisi saluran.',
  admin_note = 'Jangan minta harga barang tetap.',
  detail_json = JSON_OBJECT('tipe_item','infrastruktur / iuran / perawatan','mode_biaya_opsional',JSON_ARRAY('iuran','gotong_royong','jasa','input_manual'),'fungsi','Menyalurkan air dari sumber/jaringan ke lahan pertanian.','keunggulan','Mengurangi ketergantungan pada pompa.','keterbatasan','Tergantung pembagian air dan musim.','catatan','Catat sebagai biaya operasional kolektif.')
WHERE kode = 'AIR-SALURAN-SAWAH';

UPDATE katalog_items
SET
  kategori = 'Air & Irigasi',
  subkategori = 'Drainase',
  nama = 'Drainase / Parit Lahan',
  slug = 'irigasi-drainase-parit',
  image_path = 'assets/image/irigasi/irigasi-drainase-parit.jpg',
  komoditas = 'padi,jagung,kedelai',
  fase = 'Pra-tanam / musim hujan',
  jenis_biaya = 'jasa',
  mode_biaya = 'input_manual',
  satuan_default = 'input manual',
  harga_min = NULL, harga_max = NULL, harga_status = 'INPUT_MANUAL_LOKAL',
  sumber_referensi = 'Referensi irigasi-drainase dan pedoman kebutuhan air kedelai/jagung.',
  sumber_dokumen = 'AGROTRACK_KATALOG_AIR_IRIGASI_PADI_JAGUNG_KEDELAI.md',
  fungsi = 'Membuang kelebihan air agar lahan tidak tergenang.',
  keterangan = 'Biaya sangat lokal tergantung panjang/dalaman/tenaga.',
  risiko = 'Penting untuk jagung/kedelai dan pengaturan air padi.',
  admin_note = 'Catat sebagai pekerjaan operasional.',
  detail_json = JSON_OBJECT('tipe_item','infrastruktur kecil / jasa / tenaga kerja','mode_biaya_opsional',JSON_ARRAY('jasa','tenaga_kerja','input_manual','gotong_royong'),'fungsi','Mengalirkan kelebihan air agar lahan tidak tergenang.','keunggulan','Mengurangi risiko busuk akar dan gangguan pertumbuhan.','keterbatasan','Biaya tergantung kondisi lahan dan tenaga kerja.','catatan','Masuk kategori pekerjaan operasional, bukan produk.')
WHERE kode = 'AIR-DRAINASE-PARIT';

UPDATE katalog_items
SET
  kategori = 'Air & Irigasi',
  subkategori = 'Bahan Habis Pakai',
  nama = 'Bahan Bakar Pompa Air',
  slug = 'irigasi-bahan-bakar-pompa',
  image_path = 'assets/image/irigasi/irigasi-bahan-bakar-pompa.jpg',
  komoditas = 'padi,jagung,kedelai',
  fase = 'Setiap penggunaan pompa',
  jenis_biaya = 'operasional',
  mode_biaya = 'bahan_habis_pakai',
  satuan_default = 'liter',
  harga_min = 6800, harga_max = 16250, harga_status = 'HARGA_BBM_DINAMIS',
  sumber_referensi = 'Pertamina Patra Niaga; Reuters; CNN Indonesia.',
  sumber_dokumen = 'AGROTRACK_KATALOG_AIR_IRIGASI_PADI_JAGUNG_KEDELAI.md',
  fungsi = 'Biaya operasional pompa berbahan bakar bensin/solar.',
  keterangan = 'Harga berubah dan tergantung jenis BBM/mesin.',
  risiko = 'Jangan hardcode.',
  admin_note = 'Hitung liter x harga per liter.',
  detail_json = JSON_OBJECT(
    'mode_biaya_opsional',JSON_ARRAY('bahan_habis_pakai'),
    'fungsi','Biaya operasional pompa berbahan bakar bensin atau solar.',
    'keunggulan','Membuat biaya pompa lebih realistis.',
    'keterbatasan','Tergantung jenis BBM dan durasi pemakaian.',
    'catatan','Harga BBM dinamis.'
  )
WHERE kode = 'AIR-BBM-POMPA';

UPDATE katalog_items
SET
  detail_json = JSON_OBJECT(
    'tipe_item','operasional',
    'mode_biaya_opsional',JSON_ARRAY('bahan_habis_pakai'),
    'fungsi','Biaya operasional pompa berbahan bakar bensin atau solar.',
    'keunggulan','Komponen biaya nyata yang sering muncul saat musim kering.',
    'keterbatasan','Harga berubah, jenis BBM tergantung mesin, dan konsumsi BBM tergantung durasi.',
    'catatan','Hitung liter x harga per liter.'
  )
WHERE kode = 'AIR-BBM-POMPA';

UPDATE katalog_items
SET
  detail_json = JSON_OBJECT(
    'tipe_item','aset alat / sewa / jasa',
    'mode_biaya_opsional',JSON_ARRAY('beli_baru','sewa','milik_sendiri','pinjam_kelompok','jasa'),
    'satuan_opsional',JSON_ARRAY('unit','hari sewa'),
    'fungsi','Mengalirkan air dari sungai, sumur, embung, atau parit ke lahan.',
    'keunggulan','Penting saat kemarau atau irigasi tidak cukup.',
    'keterbatasan','Perlu BBM/listrik, operator, selang/pipa, dan perawatan.',
    'catatan','Untuk milik sendiri, biaya musim sebaiknya memakai BBM + servis + penyusutan opsional.'
  )
WHERE kode = 'AIR-POMPA';

UPDATE katalog_items
SET
  kategori = 'Air & Irigasi',
  subkategori = 'Perlengkapan Irigasi',
  nama = 'Selang Irigasi / Selang Buang Pompa',
  slug = 'irigasi-selang',
  image_path = 'assets/image/irigasi/irigasi-selang.jpg',
  komoditas = 'padi,jagung,kedelai',
  fase = 'Saat irigasi',
  jenis_biaya = 'aset ringan',
  mode_biaya = 'beli_baru',
  satuan_default = 'roll',
  harga_min = 65000, harga_max = 765000, harga_status = 'TERVERIFIKASI_MARKETPLACE',
  sumber_referensi = 'Purotani, Shopee, Lazada, Blibli.',
  fungsi = 'Menyalurkan air dari pompa ke lahan.',
  keterangan = 'Satuan terbaik roll 50 m atau meter.',
  risiko = 'Bisa bocor, robek, terlipat, atau aus.',
  detail_json = JSON_OBJECT(
    'tipe_item','aset ringan / perlengkapan pompa',
    'mode_biaya_opsional',JSON_ARRAY('beli_baru','milik_sendiri','pinjam_kelompok'),
    'satuan_opsional',JSON_ARRAY('roll 50 m','meter'),
    'fungsi','Selang fleksibel dari pompa menuju lahan.',
    'keunggulan','Fleksibel dan mudah dipindah.',
    'keterbatasan','Bisa bocor/robek/aus karena matahari dan pemakaian.',
    'catatan','Catat panjang selang agar harga lebih akurat.'
  )
WHERE kode = 'AIR-SELANG';

UPDATE katalog_items
SET
  harga_min = 62600, harga_max = 701219, harga_status = 'TERVERIFIKASI_MARKETPLACE_DAN_DISTRIBUTOR',
  sumber_referensi = 'Lazada dan Alia Jaya.',
  sumber_dokumen = 'AGROTRACK_KATALOG_AIR_IRIGASI_PADI_JAGUNG_KEDELAI.md',
  fungsi = 'Jalur air semi permanen yang lebih stabil dari selang.',
  keterangan = 'Harga bergantung diameter, panjang, dan fitting.',
  risiko = 'Butuh instalasi dan kurang fleksibel dari selang.',
  admin_note = 'Hitung per meter dan biaya fitting.',
  detail_json = JSON_OBJECT(
    'tipe_item','aset/infrastruktur kecil',
    'mode_biaya_opsional',JSON_ARRAY('beli_baru','milik_sendiri','iuran','jasa_instalasi'),
    'satuan_opsional',JSON_ARRAY('meter','roll'),
    'fungsi','Menyalurkan air lebih permanen dan rapi dibanding selang fleksibel.',
    'keunggulan','Lebih tahan lama.',
    'keterbatasan','Biaya awal lebih tinggi dan butuh sambungan/fitting.',
    'catatan','Cocok untuk jalur air semi permanen.'
  )
WHERE kode = 'AIR-PIPA';

UPDATE katalog_items
SET
  harga_min = NULL, harga_max = NULL, harga_status = 'INPUT_MANUAL_LOKAL',
  sumber_referensi = 'BBWS Mesuji Sekampung; studi kebutuhan air tanaman.',
  sumber_dokumen = 'AGROTRACK_KATALOG_AIR_IRIGASI_PADI_JAGUNG_KEDELAI.md',
  fungsi = 'Mengalirkan air dari jaringan/sumber ke petakan lahan.',
  keterangan = 'Lebih cocok dicatat sebagai iuran/perawatan.',
  risiko = 'Tergantung jadwal air dan kondisi saluran.',
  admin_note = 'Jangan minta harga barang tetap.',
  detail_json = JSON_OBJECT(
    'tipe_item','infrastruktur / iuran / perawatan',
    'mode_biaya_opsional',JSON_ARRAY('iuran','gotong_royong','jasa','input_manual'),
    'fungsi','Menyalurkan air dari sumber/jaringan ke lahan pertanian.',
    'keunggulan','Mengurangi ketergantungan pada pompa.',
    'keterbatasan','Tergantung pembagian air dan musim.',
    'catatan','Catat sebagai biaya operasional kolektif.'
  )
WHERE kode = 'AIR-SALURAN-SAWAH';

UPDATE katalog_items
SET
  harga_min = NULL, harga_max = NULL, harga_status = 'INPUT_MANUAL_LOKAL',
  sumber_referensi = 'Referensi irigasi-drainase dan pedoman kebutuhan air kedelai/jagung.',
  sumber_dokumen = 'AGROTRACK_KATALOG_AIR_IRIGASI_PADI_JAGUNG_KEDELAI.md',
  fungsi = 'Membuang kelebihan air agar lahan tidak tergenang.',
  keterangan = 'Biaya sangat lokal tergantung panjang/dalaman/tenaga.',
  risiko = 'Penting untuk jagung/kedelai dan pengaturan air padi.',
  admin_note = 'Catat sebagai pekerjaan operasional.',
  detail_json = JSON_OBJECT(
    'tipe_item','infrastruktur kecil / jasa / tenaga kerja',
    'mode_biaya_opsional',JSON_ARRAY('jasa','tenaga_kerja','input_manual','gotong_royong'),
    'fungsi','Mengalirkan kelebihan air agar lahan tidak tergenang.',
    'keunggulan','Mengurangi risiko busuk akar dan gangguan pertumbuhan.',
    'keterbatasan','Biaya tergantung kondisi lahan dan tenaga kerja.',
    'catatan','Masuk kategori pekerjaan operasional, bukan produk.'
  )
WHERE kode = 'AIR-DRAINASE-PARIT';
