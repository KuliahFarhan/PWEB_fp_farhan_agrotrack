USE agrotrack;

INSERT IGNORE INTO katalog_items
(kode, kategori, subkategori, nama, slug, image_path, komoditas, fase, jenis_biaya, mode_biaya, satuan_default, harga_min, harga_max, harga_status, sumber_referensi, sumber_dokumen, tanggal_cek_harga, fungsi, keterangan, risiko, admin_note, detail_json, is_active)
VALUES
('TK-OLAH-TANAH-MANUAL','Tenaga Kerja','Pra-tanam','Tenaga Olah Tanah Manual','tenaga-olah-tanah-manual','assets/image/tenaga_kerja/tenaga-olah-tanah-manual.jpg','padi,jagung,kedelai','Pra-tanam','tenaga_kerja','hok','HOK',NULL,NULL,'INPUT_MANUAL_LOKAL','BPS, Cross-Border, Kementan, UNIKS.','AGROTRACK_KATALOG_TENAGA_KERJA_PADI_JAGUNG_KEDELAI.md','2026-06-16','Mengerjakan olah tanah manual, merapikan lahan, dan pekerjaan detail pra-tanam.','Bisa dikerjakan sendiri, keluarga, buruh harian, atau borongan.','Lambat untuk lahan luas.','Cocok sebagai biaya tambahan walaupun pakai traktor.',JSON_OBJECT('mode_biaya_opsional',JSON_ARRAY('upah_harian','hok','borongan','tenaga_keluarga','gotong_royong','input_manual'),'satuan_opsional',JSON_ARRAY('HOK','orang-hari','paket','petak','hektar'),'fungsi','Menyiapkan lahan secara manual ketika alat mesin tidak dipakai atau hanya untuk pekerjaan detail.','risiko','Biaya tenaga bisa besar pada lahan luas.','catatan','Cocok untuk mencangkul, merapikan tanah, dan perbaikan detail lahan.'),1),
('TK-TANAM-JAGUNG','Tenaga Kerja','Tanam','Tenaga Tanam Jagung','tenaga-tanam-jagung','assets/image/tenaga_kerja/tenaga-tanam-jagung.jpg','jagung','Tanam','tenaga_kerja','hok','HOK',NULL,NULL,'INPUT_MANUAL_LOKAL','BPS, SNI IndoGAP, kajian usahatani jagung.','AGROTRACK_KATALOG_TENAGA_KERJA_PADI_JAGUNG_KEDELAI.md','2026-06-16','Menanam benih jagung sesuai baris dan jarak tanam.','Keseragaman jarak dan kedalaman tanam memengaruhi pertumbuhan.','Pekerjaan kurang seragam memengaruhi populasi tanaman.','Tambahkan opsi penjarangan pada fase awal pertumbuhan.',JSON_OBJECT('mode_biaya_opsional',JSON_ARRAY('hok','upah_harian','borongan','tenaga_keluarga'),'satuan_opsional',JSON_ARRAY('orang-hari','HOK','hektar','petak'),'fungsi','Mencakup pembuatan lubang tanam, penempatan benih, dan penutupan lubang.','catatan','Bisa dihitung per HOK atau borongan per lahan.'),1),
('TK-TANAM-KEDELAI','Tenaga Kerja','Tanam','Tenaga Tanam Kedelai','tenaga-tanam-kedelai','assets/image/tenaga_kerja/tenaga-tanam-kedelai.jpg','kedelai','Tanam','tenaga_kerja','hok','HOK',NULL,NULL,'INPUT_MANUAL_LOKAL','BPS, SNI IndoGAP, kajian usahatani kedelai.','AGROTRACK_KATALOG_TENAGA_KERJA_PADI_JAGUNG_KEDELAI.md','2026-06-16','Menanam benih kedelai pada lahan kering atau bekas padi.','Benih perlu tertanam seragam; genangan mengganggu pertumbuhan.','Penyulaman mungkin dibutuhkan jika benih tidak tumbuh.','Tambahkan opsi penyulaman bila perlu.',JSON_OBJECT('mode_biaya_opsional',JSON_ARRAY('hok','upah_harian','borongan','tenaga_keluarga'),'satuan_opsional',JSON_ARRAY('orang-hari','HOK','hektar','petak'),'fungsi','Mencakup pembuatan lubang/baris tanam dan menanam benih secara seragam.','catatan','Cocok untuk lahan kering atau bekas padi.'),1),
('TK-PEMUPUKAN','Tenaga Kerja','Perawatan','Tenaga Pemupukan','tenaga-pemupukan','assets/image/tenaga_kerja/tenaga-pemupukan.jpg','padi,jagung,kedelai','Pra-tanam / vegetatif / generatif','tenaga_kerja','hok','HOK',NULL,NULL,'INPUT_MANUAL_LOKAL','BPS, SNI IndoGAP, kajian usahatani.','AGROTRACK_KATALOG_TENAGA_KERJA_PADI_JAGUNG_KEDELAI.md','2026-06-16','Mengaplikasikan pupuk sesuai fase tanaman.','Pisahkan dari biaya pupuk agar analisis lebih jelas.','Salah waktu/cara aplikasi menurunkan efisiensi pupuk.','Hubungkan dengan item pupuk yang dipakai.',JSON_OBJECT('mode_biaya_opsional',JSON_ARRAY('hok','upah_harian','borongan','tenaga_keluarga'),'satuan_opsional',JSON_ARRAY('orang-hari','HOK','aplikasi','hektar'),'fungsi','Mengaplikasikan pupuk dasar, susulan, organik, atau nutrisi tambahan.','catatan','Biaya tenaga sebaiknya dipisah dari harga pupuk.'),1),
('TK-PENYEMPROTAN','Tenaga Kerja','Perawatan','Tenaga Penyemprotan','tenaga-penyemprotan','assets/image/tenaga_kerja/tenaga-penyemprotan.jpg','padi,jagung,kedelai','Vegetatif / generatif','tenaga_kerja','hok','HOK',NULL,NULL,'INPUT_MANUAL_LOKAL','SNI IndoGAP, PHT, kajian usahatani.','AGROTRACK_KATALOG_TENAGA_KERJA_PADI_JAGUNG_KEDELAI.md','2026-06-16','Menyemprot pestisida, pupuk daun, POC, atau agens hayati.','Wajib memakai APD dan memperhatikan cuaca.','Membutuhkan K3 dan pengetahuan bahan yang disemprot.','Tampilkan badge K3.',JSON_OBJECT('mode_biaya_opsional',JSON_ARRAY('hok','upah_harian','borongan','jasa_semprot','tenaga_keluarga'),'satuan_opsional',JSON_ARRAY('orang-hari','aplikasi','tangki','hektar'),'fungsi','Mengaplikasikan perlindungan tanaman atau nutrisi cair.','catatan','Wajib tampilkan catatan keselamatan kerja.'),1),
('TK-PENYIANGAN','Tenaga Kerja','Perawatan','Tenaga Penyiangan','tenaga-penyiangan','assets/image/tenaga_kerja/tenaga-penyiangan.jpg','padi,jagung,kedelai','Awal pertumbuhan / vegetatif','tenaga_kerja','hok','HOK',NULL,NULL,'INPUT_MANUAL_LOKAL','BPS, kajian usahatani, SNI IndoGAP.','AGROTRACK_KATALOG_TENAGA_KERJA_PADI_JAGUNG_KEDELAI.md','2026-06-16','Membersihkan gulma secara manual.','Bisa dibandingkan dengan biaya herbisida.','Bisa memakan banyak tenaga jika gulma tinggi.','Alternatif/pendamping herbisida.',JSON_OBJECT('mode_biaya_opsional',JSON_ARRAY('hok','upah_harian','borongan','tenaga_keluarga','gotong_royong'),'satuan_opsional',JSON_ARRAY('orang-hari','HOK','hektar','petak'),'fungsi','Membersihkan gulma dan merapikan barisan tanaman.','catatan','Biaya penting untuk dicatat sebagai alternatif atau pendamping herbisida.'),1),
('TK-PENGAIRAN','Tenaga Kerja','Perawatan Air','Tenaga Pengairan','tenaga-pengairan','assets/image/tenaga_kerja/tenaga-pengairan.jpg','padi,jagung,kedelai','Selama musim tanam','tenaga_kerja','upah_harian','hari',NULL,NULL,'INPUT_MANUAL_LOKAL','BBWS, kebutuhan air tanaman, ketenagakerjaan pertanian.','AGROTRACK_KATALOG_TENAGA_KERJA_PADI_JAGUNG_KEDELAI.md','2026-06-16','Mengatur air, saluran, pompa, dan drainase.','Biaya naik saat kemarau karena pompa/BBM.','Hubungkan dengan kategori Air & Irigasi.','Catat operator jika ada.',JSON_OBJECT('mode_biaya_opsional',JSON_ARRAY('upah_harian','operator','iuran','tenaga_keluarga','input_manual'),'satuan_opsional',JSON_ARRAY('hari','jam','aplikasi','musim'),'fungsi','Mengatur ketersediaan air sesuai kebutuhan tanaman.','catatan','Sering muncul saat irigasi tidak otomatis.'),1),
('TK-PANEN-JAGUNG','Tenaga Kerja','Panen','Tenaga Panen Jagung','tenaga-panen-jagung','assets/image/tenaga_kerja/tenaga-panen-jagung.jpg','jagung','Panen','tenaga_kerja','borongan','petak',NULL,NULL,'INPUT_MANUAL_LOKAL','BPS, kajian usahatani jagung, SNI IndoGAP.','AGROTRACK_KATALOG_TENAGA_KERJA_PADI_JAGUNG_KEDELAI.md','2026-06-16','Memetik dan mengumpulkan jagung.','Sering perlu lanjut ke pemipilan dan pengeringan.','Hasil sering masih perlu dipipil.','Tambahkan opsi pemipilan jagung di pascapanen.',JSON_OBJECT('mode_biaya_opsional',JSON_ARRAY('borongan','per_ha','per_hasil','hok','tenaga_keluarga'),'satuan_opsional',JSON_ARRAY('hektar','petak','karung','kg','kuintal','HOK'),'fungsi','Mengambil tongkol jagung dari lahan.','catatan','Biasanya berlanjut ke pengeringan atau pemipilan.'),1),
('TK-PANEN-KEDELAI','Tenaga Kerja','Panen','Tenaga Panen Kedelai','tenaga-panen-kedelai','assets/image/tenaga_kerja/tenaga-panen-kedelai.jpg','kedelai','Panen','tenaga_kerja','borongan','petak',NULL,NULL,'INPUT_MANUAL_LOKAL','BPS, kajian usahatani kedelai, SNI IndoGAP.','AGROTRACK_KATALOG_TENAGA_KERJA_PADI_JAGUNG_KEDELAI.md','2026-06-16','Memanen atau mencabut/memotong tanaman kedelai.','Kehilangan hasil bisa tinggi jika telat panen.','Kedelai perlu penanganan tepat agar kehilangan hasil tidak tinggi.','Tambahkan opsi perontokan dan sortasi jika perlu.',JSON_OBJECT('mode_biaya_opsional',JSON_ARRAY('borongan','per_ha','per_hasil','hok','tenaga_keluarga'),'satuan_opsional',JSON_ARRAY('hektar','petak','karung','kg','HOK'),'fungsi','Mengambil tanaman kedelai saat polong siap panen.','catatan','Sering dilanjutkan perontokan/sortasi biji.'),1),
('TK-ANGKUT-HASIL','Tenaga Kerja','Panen/Pascapanen','Tenaga Angkut Hasil','tenaga-angkut-hasil','assets/image/tenaga_kerja/tenaga-angkut-hasil.jpg','padi,jagung,kedelai','Panen / Pascapanen','tenaga_kerja','per_hasil','karung',NULL,NULL,'INPUT_MANUAL_LOKAL','BPS, Cross-Border, kajian usahatani.','AGROTRACK_KATALOG_TENAGA_KERJA_PADI_JAGUNG_KEDELAI.md','2026-06-16','Mengangkut hasil dari lahan ke rumah, gudang, jemuran, atau pembeli.','Tarif sangat dipengaruhi jarak lahan dan akses jalan.','Bedakan dari biaya kendaraan jika memungkinkan.','Bisa per karung, per trip, atau borongan.',JSON_OBJECT('mode_biaya_opsional',JSON_ARRAY('per_karung','per_trip','borongan','upah_harian','input_manual'),'satuan_opsional',JSON_ARRAY('karung','trip','kg','kuintal','hari'),'fungsi','Memindahkan hasil panen dari lahan ke rumah/gudang/pembeli.','catatan','Bedakan biaya tenaga angkut dari biaya kendaraan.'),1),
('TK-JEMUR-PENGERINGAN','Tenaga Kerja','Pascapanen','Tenaga Jemur / Pengeringan','tenaga-jemur-pengeringan','assets/image/tenaga_kerja/tenaga-jemur-pengeringan.jpg','padi,jagung,kedelai','Pascapanen','tenaga_kerja','hok','HOK',NULL,NULL,'INPUT_MANUAL_LOKAL','SNI IndoGAP, kajian pascapanen.','AGROTRACK_KATALOG_TENAGA_KERJA_PADI_JAGUNG_KEDELAI.md','2026-06-16','Menjemur, membalik, menjaga, dan mengangkat hasil panen.','Sangat tergantung cuaca dan tempat jemur.','Penting untuk kualitas jual dan kadar air.','Hubungkan dengan terpal jemur dan moisture meter.',JSON_OBJECT('mode_biaya_opsional',JSON_ARRAY('hok','upah_harian','borongan','tenaga_keluarga','input_manual'),'satuan_opsional',JSON_ARRAY('orang-hari','karung','kuintal','hari jemur'),'fungsi','Menurunkan kadar air hasil panen agar aman disimpan/dijual.','catatan','Biaya penting untuk padi, jagung, dan kedelai.'),1);

UPDATE katalog_items
SET
  kategori = 'Tenaga Kerja',
  subkategori = 'Tanam',
  nama = 'Tenaga Tanam Padi',
  slug = 'tenaga-tanam-padi',
  image_path = 'assets/image/tenaga_kerja/tenaga-tanam-padi.jpg',
  komoditas = 'padi',
  fase = 'Tanam',
  jenis_biaya = 'tenaga_kerja',
  mode_biaya = 'borongan',
  satuan_default = 'petak',
  harga_min = NULL, harga_max = NULL, harga_status = 'INPUT_MANUAL_LOKAL',
  sumber_referensi = 'BPS, SNI IndoGAP, kajian usahatani padi.',
  sumber_dokumen = 'AGROTRACK_KATALOG_TENAGA_KERJA_PADI_JAGUNG_KEDELAI.md',
  fungsi = 'Memindahkan bibit padi dari persemaian ke sawah.',
  keterangan = 'Tambahkan opsi cabut bibit/persemaian jika diperlukan.',
  risiko = 'Waktu tanam perlu serempak agar pertumbuhan lebih merata.',
  admin_note = 'Bisa dibayar borongan per petak atau per luasan.',
  detail_json = JSON_OBJECT('mode_biaya_opsional',JSON_ARRAY('hok','upah_harian','borongan','tenaga_keluarga','gotong_royong'),'satuan_opsional',JSON_ARRAY('orang-hari','HOK','petak','hektar'),'fungsi','Mencakup cabut bibit, angkut bibit, tandur/pindah tanam, dan merapikan jarak tanam.','catatan','Tambahkan opsi tenaga persemaian dan cabut bibit jika dibutuhkan.')
WHERE kode = 'TK-TANAM-PADI';

UPDATE katalog_items
SET
  harga_min = NULL, harga_max = NULL, harga_status = 'INPUT_MANUAL_LOKAL',
  sumber_referensi = 'BPS, SNI IndoGAP, kajian usahatani.',
  sumber_dokumen = 'AGROTRACK_KATALOG_TENAGA_KERJA_PADI_JAGUNG_KEDELAI.md',
  fungsi = 'Mengaplikasikan pestisida, pupuk daun, POC, atau agens hayati.',
  keterangan = 'Wajib memakai APD dan memperhatikan cuaca.',
  risiko = 'Membutuhkan K3 dan pengetahuan bahan yang disemprot.',
  admin_note = 'Tampilkan badge K3.',
  detail_json = JSON_OBJECT('mode_biaya_opsional',JSON_ARRAY('hok','upah_harian','borongan','jasa_semprot','tenaga_keluarga'),'satuan_opsional',JSON_ARRAY('orang-hari','aplikasi','tangki','hektar'),'fungsi','Mengaplikasikan perlindungan tanaman atau nutrisi cair.','catatan','Wajib tampilkan catatan keselamatan kerja.')
WHERE kode = 'TK-PENYEMPROTAN';

UPDATE katalog_items
SET
  harga_min = NULL, harga_max = NULL, harga_status = 'INPUT_MANUAL_LOKAL',
  sumber_referensi = 'BPS, kajian usahatani, SNI IndoGAP.',
  sumber_dokumen = 'AGROTRACK_KATALOG_TENAGA_KERJA_PADI_JAGUNG_KEDELAI.md',
  fungsi = 'Membersihkan gulma secara manual.',
  keterangan = 'Bisa dibandingkan dengan biaya herbisida.',
  risiko = 'Bisa memakan banyak tenaga jika gulma tinggi.',
  admin_note = 'Alternatif/pendamping herbisida.',
  detail_json = JSON_OBJECT('mode_biaya_opsional',JSON_ARRAY('hok','upah_harian','borongan','tenaga_keluarga','gotong_royong'),'satuan_opsional',JSON_ARRAY('orang-hari','HOK','hektar','petak'),'fungsi','Membersihkan gulma dan merapikan barisan tanaman.','catatan','Biaya penting dicatat sebagai alternatif atau pendamping herbisida.')
WHERE kode = 'TK-PENYIANGAN';

UPDATE katalog_items
SET
  harga_min = NULL, harga_max = NULL, harga_status = 'INPUT_MANUAL_LOKAL',
  sumber_referensi = 'BBWS, kebutuhan air tanaman, ketenagakerjaan pertanian.',
  sumber_dokumen = 'AGROTRACK_KATALOG_TENAGA_KERJA_PADI_JAGUNG_KEDELAI.md',
  fungsi = 'Mengatur air, saluran, pompa, dan drainase.',
  keterangan = 'Biaya naik saat kemarau karena pompa/BBM.',
  risiko = 'Hubungkan dengan kategori Air & Irigasi.',
  admin_note = 'Catat operator jika ada.',
  detail_json = JSON_OBJECT('mode_biaya_opsional',JSON_ARRAY('upah_harian','operator','iuran','tenaga_keluarga','input_manual'),'satuan_opsional',JSON_ARRAY('hari','jam','aplikasi','musim'),'fungsi','Mengatur ketersediaan air sesuai kebutuhan tanaman.','catatan','Sering muncul saat irigasi tidak otomatis.')
WHERE kode = 'TK-PENGAIRAN';

UPDATE katalog_items
SET
  harga_min = NULL, harga_max = NULL, harga_status = 'INPUT_MANUAL_LOKAL',
  sumber_referensi = 'BPS, kajian usahatani jagung, SNI IndoGAP.',
  sumber_dokumen = 'AGROTRACK_KATALOG_TENAGA_KERJA_PADI_JAGUNG_KEDELAI.md',
  fungsi = 'Memetik dan mengumpulkan jagung.',
  keterangan = 'Sering perlu lanjut ke pemipilan dan pengeringan.',
  risiko = 'Hasil sering masih perlu dipipil.',
  admin_note = 'Tambahkan opsi pemipilan jagung di pascapanen.',
  detail_json = JSON_OBJECT('mode_biaya_opsional',JSON_ARRAY('borongan','per_ha','per_hasil','hok','tenaga_keluarga'),'satuan_opsional',JSON_ARRAY('hektar','petak','karung','kg','kuintal','HOK'),'fungsi','Mengambil tongkol jagung dari lahan.','catatan','Biasanya berlanjut ke pengeringan atau pemipilan.')
WHERE kode = 'TK-PANEN-JAGUNG';

UPDATE katalog_items
SET
  harga_min = NULL, harga_max = NULL, harga_status = 'INPUT_MANUAL_LOKAL',
  sumber_referensi = 'BPS, kajian usahatani kedelai, SNI IndoGAP.',
  sumber_dokumen = 'AGROTRACK_KATALOG_TENAGA_KERJA_PADI_JAGUNG_KEDELAI.md',
  fungsi = 'Memanen atau mencabut/memotong tanaman kedelai.',
  keterangan = 'Kedelai perlu penanganan tepat agar kehilangan hasil tidak tinggi.',
  risiko = 'Kehilangan hasil bisa tinggi jika telat panen.',
  admin_note = 'Tambahkan opsi perontokan dan sortasi jika perlu.',
  detail_json = JSON_OBJECT('mode_biaya_opsional',JSON_ARRAY('borongan','per_ha','per_hasil','hok','tenaga_keluarga'),'satuan_opsional',JSON_ARRAY('hektar','petak','karung','kg','HOK'),'fungsi','Mengambil tanaman kedelai saat polong siap panen.','catatan','Sering dilanjutkan perontokan/sortasi biji.')
WHERE kode = 'TK-PANEN-KEDELAI';

UPDATE katalog_items
SET
  harga_min = NULL, harga_max = NULL, harga_status = 'INPUT_MANUAL_LOKAL',
  sumber_referensi = 'BPS, Cross-Border, kajian usahatani.',
  sumber_dokumen = 'AGROTRACK_KATALOG_TENAGA_KERJA_PADI_JAGUNG_KEDELAI.md',
  fungsi = 'Mengangkut hasil dari lahan ke rumah, gudang, jemuran, atau pembeli.',
  keterangan = 'Tarif sangat dipengaruhi jarak lahan dan akses jalan.',
  risiko = 'Bedakan dari biaya kendaraan jika memungkinkan.',
  admin_note = 'Bisa per karung, per trip, atau borongan.',
  detail_json = JSON_OBJECT('mode_biaya_opsional',JSON_ARRAY('per_karung','per_trip','borongan','upah_harian','input_manual'),'satuan_opsional',JSON_ARRAY('karung','trip','kg','kuintal','hari'),'fungsi','Memindahkan hasil panen dari lahan ke rumah/gudang/pembeli.','catatan','Bedakan biaya tenaga angkut dari biaya kendaraan.')
WHERE kode = 'TK-ANGKUT-HASIL';

UPDATE katalog_items
SET
  harga_min = NULL, harga_max = NULL, harga_status = 'INPUT_MANUAL_LOKAL',
  sumber_referensi = 'SNI IndoGAP, kajian pascapanen.',
  sumber_dokumen = 'AGROTRACK_KATALOG_TENAGA_KERJA_PADI_JAGUNG_KEDELAI.md',
  fungsi = 'Menurunkan kadar air hasil panen agar aman disimpan/dijual.',
  keterangan = 'Sangat tergantung cuaca dan tempat jemur.',
  risiko = 'Penting untuk kualitas jual dan kadar air.',
  admin_note = 'Hubungkan dengan terpal jemur dan moisture meter.',
  detail_json = JSON_OBJECT('mode_biaya_opsional',JSON_ARRAY('hok','upah_harian','borongan','tenaga_keluarga','input_manual'),'satuan_opsional',JSON_ARRAY('orang-hari','karung','kuintal','hari jemur'),'fungsi','Menjemur, membalik, menjaga, dan mengangkat hasil panen.','catatan','Biaya penting untuk padi, jagung, dan kedelai.')
WHERE kode = 'TK-JEMUR-PENGERINGAN';
