USE agrotrack;

INSERT INTO katalog_items
(kode, kategori, subkategori, nama, slug, image_path, komoditas, fase, jenis_biaya, mode_biaya, satuan_default, harga_min, harga_max, harga_status, sumber_referensi, sumber_dokumen, tanggal_cek_harga, fungsi, keterangan, risiko, admin_note, detail_json, is_active)
VALUES
('LIN-MOLUSKISIDA','Perlindungan Tanaman','Pestisida Kimia','Moluskisida Keong/Siput','perlintan-moluskisida','assets/image/perlintan/perlintan-moluskisida.jpg','padi','Awal tanam','saprodi','jumlah_x_harga','g/ml',13250,85000,'TERVERIFIKASI_MARKETPLACE','Lazada, Blibli, BigGo.','AGROTRACK_KATALOG_PERLINDUNGAN_TANAMAN_PADI_JAGUNG_KEDELAI.md','2026-06-16','Mengendalikan keong dan siput terutama pada padi sawah.','Tidak relevan untuk semua lahan.','Hati-hati di area perairan.','Tandai sebagai padi sawah dan kondisi khusus.',JSON_OBJECT('jenis_perlindungan','kimia','target_opt','keong mas, siput, bekicot','satuan_opsional',JSON_ARRAY('15 g','50 g','100 g','450 ml'),'fungsi','Mengendalikan hama keong/siput yang merusak tanaman muda.','keterangan_penggunaan','Cocok untuk fase tanaman muda di sawah.','peringatan_penggunaan','Gunakan sesuai label produk dan lindungi area perairan.'),1),
('LIN-RODENTISIDA','Perlindungan Tanaman','Pestisida Kimia','Rodentisida Tikus','perlintan-rodentisida','assets/image/perlintan/perlintan-rodentisida.jpg','padi,jagung','Pra-tanam / vegetatif / generatif','saprodi','jumlah_x_harga','g/kg',7500,90000,'TERVERIFIKASI_MARKETPLACE','Lazada, Shopee, Blibli.','AGROTRACK_KATALOG_PERLINDUNGAN_TANAMAN_PADI_JAGUNG_KEDELAI.md','2026-06-16','Mengendalikan hama tikus melalui umpan/racun.','Berisiko bagi hewan non-target dan manusia.','Sertakan alternatif perangkap/TBS.','Gunakan aman dan jauhkan dari anak/hewan non-target.',JSON_OBJECT('jenis_perlindungan','kimia','target_opt','tikus sawah, pengerat','satuan_opsional',JSON_ARRAY('100 g','1 kg'),'fungsi','Mengendalikan tikus melalui umpan rodentisida.','keterangan_penggunaan','Lebih aman jika dipadukan dengan pengendalian terpadu.','peringatan_penggunaan','Gunakan dengan kehati-hatian dan ikuti label.'),1),
('LIN-NEMATISIDA','Perlindungan Tanaman','Pestisida Kimia','Nematisida Nematoda/Hama Tanah','perlintan-nematisida','assets/image/perlintan/perlintan-nematisida.jpg','padi,jagung,kedelai','Pra-tanam / tanam / awal pertumbuhan','saprodi','jumlah_x_harga','g/ml',4730,142000,'TERVERIFIKASI_MARKETPLACE','Lazada, Shopee, Blibli, PertanianIndonesia.','AGROTRACK_KATALOG_PERLINDUNGAN_TANAMAN_PADI_JAGUNG_KEDELAI.md','2026-06-16','Mengendalikan nematoda atau hama tanah tertentu.','Tidak boleh jadi biaya default.','Hanya kondisi khusus.','Tampilkan sebagai item kondisi khusus.',JSON_OBJECT('jenis_perlindungan','kimia','target_opt','nematoda, hama tanah tertentu','satuan_opsional',JSON_ARRAY('100 g','1 kg','100 ml'),'fungsi','Mengendalikan nematoda/hama tanah sesuai label produk.','keterangan_penggunaan','Perlindungan khusus pada kondisi tertentu.','peringatan_penggunaan','Gunakan hanya bila ada masalah lapang.'),1),
('LIN-AKARISIDA','Perlindungan Tanaman','Pestisida Kimia','Akarisida Tungau','perlintan-akarisida','assets/image/perlintan/perlintan-akarisida.jpg','kedelai','Vegetatif / generatif','saprodi','jumlah_x_harga','ml',40000,110000,'TERVERIFIKASI_MARKETPLACE','Purotani, Shopee, Lazada, Blibli, PertanianIndonesia.','AGROTRACK_KATALOG_PERLINDUNGAN_TANAMAN_PADI_JAGUNG_KEDELAI.md','2026-06-16','Mengendalikan hama tungau.','Lebih spesifik daripada insektisida umum.','Tidak semua komoditas perlu akarisida.','Lebih relevan untuk kedelai bila ada tungau.',JSON_OBJECT('jenis_perlindungan','kimia','target_opt','tungau/mites','satuan_opsional',JSON_ARRAY('250 ml'),'fungsi','Mengendalikan hama tungau pada daun/tanaman.','keterangan_penggunaan','Perlindungan opsional bila ada serangan tungau.','peringatan_penggunaan','Ikuti label produk dan perhatikan resistensi.'),1),
('LIN-PEREKAT','Perlindungan Tanaman','Adjuvant / bahan bantu aplikasi','Perekat, Perata, Penembus Semprot','perlintan-perekat-perata','assets/image/perlintan/perlintan-perekat-perata.jpg','padi,jagung,kedelai','Saat aplikasi semprot','saprodi','jumlah_x_harga','ml/liter',16000,90000,'TERVERIFIKASI_MARKETPLACE','Shopee, Lazada, Blibli, KampoengTani.','AGROTRACK_KATALOG_PERLINDUNGAN_TANAMAN_PADI_JAGUNG_KEDELAI.md','2026-06-16','Membantu larutan semprot lebih merata dan menempel.','Bukan pestisida utama.','Tidak semua campuran aman.','Catat sebagai biaya pendukung aplikasi semprot.',JSON_OBJECT('jenis_perlindungan','adjuvant','target_opt','bahan bantu semprot','satuan_opsional',JSON_ARRAY('250 ml','500 ml','1 liter'),'fungsi','Membantu penyebaran, perlekatan, dan penembusan larutan semprot.','keterangan_penggunaan','Dipakai bersama pestisida atau pupuk daun tertentu.','peringatan_penggunaan','Ikuti label pestisida dan adjuvant.'),1),
('LIN-BEAUVERIA','Perlindungan Tanaman','Agens hayati / bioinsektisida','Agens Hayati Beauveria bassiana','perlintan-beauveria','assets/image/perlintan/perlintan-beauveria.jpg','padi,jagung,kedelai','Vegetatif / saat monitoring hama','saprodi','jumlah_x_harga','g',12900,49900,'TERVERIFIKASI_MARKETPLACE','Lazada, Shopee, Blibli, literatur Beauveria.','AGROTRACK_KATALOG_PERLINDUNGAN_TANAMAN_PADI_JAGUNG_KEDELAI.md','2026-06-16','Mengendalikan hama serangga tertentu secara hayati.','Kerja lebih lambat dari kimia.','Tergantung kelembapan dan kondisi aplikasi.','Masukkan sebagai perlindungan hayati.',JSON_OBJECT('jenis_perlindungan','hayati','target_opt','hama serangga tertentu','satuan_opsional',JSON_ARRAY('50 g','100 g','1 kg'),'fungsi','Cendawan entomopatogen untuk membantu mengendalikan hama serangga.','keterangan_penggunaan','Cocok untuk sistem PHT.','peringatan_penggunaan','Gunakan sesuai label dan kondisi lingkungan.'),1),
('LIN-METARHIZIUM','Perlindungan Tanaman','Agens hayati / bioinsektisida','Agens Hayati Metarhizium anisopliae','perlintan-metarhizium','assets/image/perlintan/perlintan-metarhizium.jpg','padi,jagung,kedelai','Vegetatif / monitoring hama tanah/serangga','saprodi','jumlah_x_harga','g',30000,98000,'TERVERIFIKASI_MARKETPLACE','Blibli, Shopee, Lazada, literatur Metarhizium.','AGROTRACK_KATALOG_PERLINDUNGAN_TANAMAN_PADI_JAGUNG_KEDELAI.md','2026-06-16','Menekan hama serangga tertentu secara hayati.','Efektivitas tergantung strain dan lingkungan.','Jangan klaim membasmi semua hama.','Tampilkan sebagai perlindungan hayati.',JSON_OBJECT('jenis_perlindungan','hayati','target_opt','serangga hama tertentu, termasuk sebagian hama tanah','satuan_opsional',JSON_ARRAY('50 g','100 g','produk'),'fungsi','Cendawan entomopatogen untuk menekan hama serangga tertentu.','keterangan_penggunaan','Masuk kategori perlindungan hayati.','peringatan_penggunaan','Simpan dan aplikasikan sesuai label.'),1),
('LIN-PERANGKAP-FEROMON','Perlindungan Tanaman','Monitoring / perangkap massal','Perangkap Feromon','perlintan-perangkap-feromon','assets/image/perlintan/perlintan-perangkap-feromon.jpg','jagung','Monitoring vegetatif-generatif','saprodi','jumlah_x_harga','unit',55500,55500,'TERVERIFIKASI_PRODUK_SPESIFIK','Indotrading/Rumah Bio Indonesia; literatur feromon FAW.','AGROTRACK_KATALOG_PERLINDUNGAN_TANAMAN_PADI_JAGUNG_KEDELAI.md','2026-06-16','Monitoring atau perangkap massal hama spesifik.','Harus sesuai target hama.','Satu feromon tidak efektif untuk semua hama.','Sangat relevan untuk jagung bila target hama cocok.',JSON_OBJECT('jenis_perlindungan','monitoring','target_opt','hama spesifik/ulat grayak jagung','satuan_opsional',JSON_ARRAY('unit','lure','set'),'fungsi','Menarik hama tertentu untuk monitoring/perangkap massal.','keterangan_penggunaan','Lebih spesifik dan ramah lingkungan.','peringatan_penggunaan','Gunakan sesuai target hama.'),1),
('LIN-YELLOW-STICKY-TRAP','Perlindungan Tanaman','Monitoring / perangkap visual','Yellow Sticky Trap','perlintan-yellow-sticky-trap','assets/image/perlintan/perlintan-yellow-sticky-trap.jpg','padi,jagung,kedelai','Awal pertumbuhan / vegetatif','saprodi','jumlah_x_harga','lembar',NULL,NULL,'PERLU_VERIFIKASI_HARGA','Belum dipilih produk/kemasan stabil.','AGROTRACK_KATALOG_PERLINDUNGAN_TANAMAN_PADI_JAGUNG_KEDELAI.md','2026-06-16','Monitoring serangga terbang kecil.','Tidak spesifik dan bisa menangkap non-target.','Lebih cocok monitoring daripada pengendalian utama.','Alat monitoring, bukan obat.',JSON_OBJECT('jenis_perlindungan','monitoring','target_opt','serangga terbang kecil','satuan_opsional',JSON_ARRAY('lembar','pack 10 lembar','pack 20 lembar'),'fungsi','Perangkap visual berperekat warna kuning.','keterangan_penggunaan','Cocok sebagai alat monitoring non-kimia.','peringatan_penggunaan','Pasang sesuai kebutuhan monitoring.'),1),
('LIN-PERANGKAP-TIKUS','Perlindungan Tanaman','Mekanis / trap barrier','Perangkap Tikus Sawah','perlintan-perangkap-tikus','assets/image/perlintan/perlintan-perangkap-tikus.jpg','padi,jagung','Pra-tanam sampai generatif','saprodi','jumlah_x_harga','unit',NULL,NULL,'PERLU_VERIFIKASI_LAPANGAN','Harga tergantung model bubu/TBS/lokal.','AGROTRACK_KATALOG_PERLINDUNGAN_TANAMAN_PADI_JAGUNG_KEDELAI.md','2026-06-16','Menangkap tikus secara mekanis.','Efektif bila dipasang dan dikelola tepat.','Bergantung model dan pengelolaan hamparan.','Alternatif PHTT/TBS untuk padi.',JSON_OBJECT('jenis_perlindungan','mekanis','target_opt','tikus sawah','satuan_opsional',JSON_ARRAY('unit','set'),'fungsi','Perangkap mekanis untuk pengendalian tikus.','keterangan_penggunaan','Cocok untuk padi dan lebih aman sebagai alternatif rodentisida.','peringatan_penggunaan','Periksa perangkap rutin dan kelola bersama hamparan.'),1);

UPDATE katalog_items
SET
  harga_min = 50000, harga_max = 114400, harga_status = 'TERVERIFIKASI_MARKETPLACE',
  sumber_referensi = 'Shopee dan Lazada herbisida 1 liter.',
  fungsi = 'Mengendalikan gulma yang bersaing dengan tanaman utama.',
  keterangan = 'Gunakan sesuai label produk dan kondisi lapangan.',
  risiko = 'Salah aplikasi dapat merusak tanaman utama, mencemari lingkungan, dan memicu resistensi gulma.',
  detail_json = JSON_OBJECT(
    'jenis_perlindungan','kimia',
    'target_opt','gulma/rumput liar',
    'satuan_opsional',JSON_ARRAY('200 ml','500 ml','1 liter'),
    'fungsi','Mengendalikan gulma pada fase pra-tanam atau awal pertumbuhan.',
    'keterangan_penggunaan','Dipakai berdasarkan kondisi gulma dan label produk.',
    'peringatan_penggunaan','Jangan tampilkan dosis default.'
  )
WHERE kode = 'LIN-HERBISIDA';

UPDATE katalog_items
SET
  harga_min = 24225, harga_max = 195000, harga_status = 'TERVERIFIKASI_MARKETPLACE',
  sumber_referensi = 'Shopee, Lazada, Blibli, PertanianIndonesia.',
  fungsi = 'Mengendalikan hama serangga sesuai target label.',
  keterangan = 'Pilih setelah monitoring OPT.',
  risiko = 'Dapat membunuh musuh alami dan memicu resistensi.',
  detail_json = JSON_OBJECT(
    'jenis_perlindungan','kimia',
    'target_opt','ulat, wereng, penggerek, kutu, dan serangga pengisap',
    'satuan_opsional',JSON_ARRAY('100 ml','250 ml','500 ml','100 g'),
    'fungsi','Mengendalikan populasi hama serangga ketika serangan mencapai ambang kendali.',
    'keterangan_penggunaan','Dipakai bila diperlukan berdasarkan monitoring OPT.',
    'peringatan_penggunaan','Gunakan sesuai label produk dan APD.'
  )
WHERE kode = 'LIN-INSEKTISIDA';

UPDATE katalog_items
SET
  harga_min = 25740, harga_max = 178100, harga_status = 'TERVERIFIKASI_MARKETPLACE',
  sumber_referensi = 'Lazada, Tanitoon, Toco, BASF, Syngenta.',
  fungsi = 'Mengendalikan penyakit tanaman akibat jamur/cendawan.',
  keterangan = 'Catat bahan aktif jika memakai produk spesifik.',
  risiko = 'Penggunaan berulang mode kerja sama dapat memicu resistensi.',
  detail_json = JSON_OBJECT(
    'jenis_perlindungan','kimia',
    'target_opt','penyakit jamur/cendawan',
    'satuan_opsional',JSON_ARRAY('250 g','500 g','1 kg','250 ml'),
    'fungsi','Mengendalikan penyakit yang disebabkan jamur/cendawan.',
    'keterangan_penggunaan','Cocok saat kelembapan tinggi atau gejala penyakit muncul.',
    'peringatan_penggunaan','Simpan bahan aktif dan formulasi jika produk spesifik.'
  )
WHERE kode = 'LIN-FUNGISIDA';

UPDATE katalog_items
SET
  harga_min = 23750, harga_max = 102500, harga_status = 'TERVERIFIKASI_MARKETPLACE',
  sumber_referensi = 'Shopee dan referensi agens hayati.',
  fungsi = 'Mendukung pengendalian hayati penyakit tanaman dan kesehatan rizosfer.',
  detail_json = JSON_OBJECT(
    'jenis_perlindungan','hayati',
    'target_opt','patogen tanah/jamur tertentu',
    'satuan_opsional',JSON_ARRAY('100 g','500 g','1 kg'),
    'fungsi','Agens hayati untuk pengendalian penyakit dan kesehatan tanah.',
    'keterangan_penggunaan','Simpan sebagai agens hayati, bukan obat instan.',
    'peringatan_penggunaan','Efektivitas tergantung strain, viabilitas, dan penyimpanan.'
  )
WHERE kode = 'LIN-TRICHODERMA';

