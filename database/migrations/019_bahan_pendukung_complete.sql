USE agrotrack;

INSERT IGNORE INTO katalog_items
(kode, kategori, subkategori, nama, slug, image_path, komoditas, fase, jenis_biaya, mode_biaya, satuan_default, harga_min, harga_max, harga_status, sumber_referensi, sumber_dokumen, tanggal_cek_harga, fungsi, keterangan, risiko, admin_note, detail_json, is_active)
VALUES
('BHN-KARUNG','Bahan Pendukung','Kemasan Hasil','Karung Pascapanen','bahan-karung-panen','assets/image/bahan_pendukung/bahan-karung-panen.jpg','padi,jagung,kedelai','Pascapanen','bahan','beli_ulang','karung',3500,8500,'TERVERIFIKASI_MARKETPLACE','Shopee, Tokopedia, Indotrading, marketplace karung beras/jagung.','AGROTRACK_KATALOG_PASCAPANEN_PADI_JAGUNG_KEDELAI.md','2026-06-16','Mengemas gabah, jagung pipil, atau kedelai agar mudah disimpan, diangkut, dan dijual.','Biaya dihitung per karung atau per ikat.','Karung buruk dapat robek, kotor, atau tidak sesuai kapasitas.','Pisahkan biaya karung dari upah tenaga pengemasan kecuali borongan sudah termasuk bahan.','{"nama_ui":"Karung Pascapanen","nama_file":"bahan-karung-panen.jpg","kategori":"Bahan Pendukung","subkategori":"Kemasan hasil","fase_penggunaan":["Pascapanen","Penyimpanan"],"relevan_untuk":["Padi","Jagung","Kedelai"],"overlap_dengan":["Pascapanen","Transportasi & Logistik"],"mode_biaya":["beli_ulang","habis_pakai","per_karung","borongan","input_manual"],"harga_referensi":"Karung pp/beras/jagung di marketplace bervariasi, umumnya sekitar Rp3.500-Rp8.500 per lembar tergantung ukuran dan bahan.","status_harga":"TERVERIFIKASI_MARKETPLACE","fungsi":"Mengemas hasil agar siap disimpan atau diangkut.","keunggulan":"Membantu hasil lebih rapi, aman, dan mudah ditata.","keterbatasan":"Karung yang tipis atau rusak mudah sobek.","catatan_ui":"Biaya karung dan tenaga pengemasan dapat dipisah.","sumber":["https://shopee.co.id/","https://www.tokopedia.com/","https://www.indotrading.com/"]}',1),
('BHN-TERPAL','Bahan Pendukung','Alas Jemur','Terpal Jemur','bahan-terpal-jemur','assets/image/bahan_pendukung/bahan-terpal-jemur.jpg','padi,jagung,kedelai','Pascapanen','bahan','beli_ulang','lembar',45000,350000,'TERVERIFIKASI_MARKETPLACE','Shopee, Tokopedia, Lazada, marketplace terpal plastik/terpal jemur.','AGROTRACK_KATALOG_PASCAPANEN_PADI_JAGUNG_KEDELAI.md','2026-06-16','Sebagai alas atau penutup saat penjemuran hasil panen.','Biaya bisa dicatat per lembar atau per m2.','Terpal licin atau rusak dapat menurunkan efisiensi jemur dan kebersihan hasil.','Pisahkan terpal dari biaya tenaga jemur dan dari sewa tempat jemur.','{"nama_ui":"Terpal Jemur","nama_file":"bahan-terpal-jemur.jpg","kategori":"Bahan Pendukung","subkategori":"Alas jemur","fase_penggunaan":["Pascapanen","Pengeringan"],"relevan_untuk":["Padi","Jagung","Kedelai"],"overlap_dengan":["Pascapanen","Transportasi & Logistik"],"mode_biaya":["beli_ulang","habis_pakai","milik_sendiri","input_manual"],"harga_referensi":"Terpal jemur di marketplace sangat bervariasi tergantung ukuran dan bahan, umumnya puluhan ribu hingga ratusan ribu rupiah per lembar.","status_harga":"TERVERIFIKASI_MARKETPLACE","fungsi":"Alas atau penutup penjemuran hasil panen.","keunggulan":"Membantu jemur lebih bersih dan mudah dipindahkan.","keterbatasan":"Bisa sobek, licin, atau rusak jika sering terkena panas dan hujan.","catatan_ui":"Biaya terpal dipisah dari tenaga jemur.","sumber":["https://shopee.co.id/","https://www.tokopedia.com/","https://www.lazada.co.id/"]}',1),
('BHN-TALI','Bahan Pendukung','Pengikat','Tali Rafia','bahan-tali-rafia','assets/image/bahan_pendukung/bahan-tali-rafia.jpg','padi,jagung,kedelai','Pascapanen / Pengemasan','bahan','habis_pakai','roll',5000,25000,'INPUT_MANUAL_LOKAL','Marketplace bahan bangunan/kemasan lokal.','AGROTRACK_KATALOG_PASCAPANEN_PADI_JAGUNG_KEDELAI.md','2026-06-16','Mengikat karung, ikatan hasil, atau bundel bahan pendukung.','Dicatat per roll atau per unit kecil.','Bila tipis mudah putus dan perlu pembelian ulang sering.','Lebih aman jika biaya tali dan karung dipisahkan dari ongkos angkut.','{"nama_ui":"Tali Rafia","nama_file":"bahan-tali-rafia.jpg","kategori":"Bahan Pendukung","subkategori":"Pengikat","fase_penggunaan":["Pascapanen","Pengemasan"],"relevan_untuk":["Padi","Jagung","Kedelai"],"overlap_dengan":["Pascapanen","Transportasi & Logistik"],"mode_biaya":["habis_pakai","beli_ulang","per_roll","input_manual"],"harga_referensi":"Tali rafia umumnya dibeli per roll dalam nominal kecil dan sangat lokal.","status_harga":"INPUT_MANUAL_LOKAL","fungsi":"Mengikat karung dan bundel hasil/bahan.","keunggulan":"Murah, praktis, dan mudah didapat.","keterbatasan":"Cepat habis jika dipakai intensif.","catatan_ui":"Biaya tali sebaiknya tidak digabung dengan ongkos angkut.","sumber":["https://www.tokopedia.com/","https://shopee.co.id/","https://www.lazada.co.id/"]}',1);

UPDATE katalog_items
SET kategori = 'Bahan Pendukung',
    subkategori = 'Kemasan Hasil',
    nama = 'Karung Pascapanen',
    slug = 'bahan-karung-panen',
    image_path = 'assets/image/bahan_pendukung/bahan-karung-panen.jpg',
    komoditas = 'padi,jagung,kedelai',
    fase = 'Pascapanen',
    jenis_biaya = 'bahan',
    mode_biaya = 'beli_ulang',
    satuan_default = 'karung',
    harga_min = 3500,
    harga_max = 8500,
    harga_status = 'TERVERIFIKASI_MARKETPLACE',
    sumber_referensi = 'Shopee, Tokopedia, Indotrading, marketplace karung beras/jagung.',
    sumber_dokumen = 'AGROTRACK_KATALOG_PASCAPANEN_PADI_JAGUNG_KEDELAI.md',
    tanggal_cek_harga = '2026-06-16',
    fungsi = 'Mengemas gabah, jagung pipil, atau kedelai agar mudah disimpan, diangkut, dan dijual.',
    keterangan = 'Biaya dihitung per karung atau per ikat.',
    risiko = 'Karung buruk dapat robek, kotor, atau tidak sesuai kapasitas.',
    admin_note = 'Pisahkan biaya karung dari upah tenaga pengemasan kecuali borongan sudah termasuk bahan.',
    detail_json = JSON_OBJECT('nama_ui','Karung Pascapanen','nama_file','bahan-karung-panen.jpg','kategori','Bahan Pendukung','subkategori','Kemasan hasil','fase_penggunaan',JSON_ARRAY('Pascapanen','Penyimpanan'),'relevan_untuk',JSON_ARRAY('Padi','Jagung','Kedelai'),'overlap_dengan',JSON_ARRAY('Pascapanen','Transportasi & Logistik'),'mode_biaya',JSON_ARRAY('beli_ulang','habis_pakai','per_karung','borongan','input_manual'),'harga_referensi','Karung pp/beras/jagung di marketplace bervariasi, umumnya sekitar Rp3.500-Rp8.500 per lembar tergantung ukuran dan bahan.','status_harga','TERVERIFIKASI_MARKETPLACE','fungsi','Mengemas hasil agar siap disimpan atau diangkut.','keunggulan','Membantu hasil lebih rapi, aman, dan mudah ditata.','keterbatasan','Karung yang tipis atau rusak mudah sobek.','catatan_ui','Biaya karung dan tenaga pengemasan dapat dipisah.','sumber',JSON_ARRAY('https://shopee.co.id/','https://www.tokopedia.com/','https://www.indotrading.com/')),
    is_active = 1
WHERE kode = 'BHN-KARUNG';

UPDATE katalog_items
SET kategori = 'Bahan Pendukung',
    subkategori = 'Alas Jemur',
    nama = 'Terpal Jemur',
    slug = 'bahan-terpal-jemur',
    image_path = 'assets/image/bahan_pendukung/bahan-terpal-jemur.jpg',
    komoditas = 'padi,jagung,kedelai',
    fase = 'Pascapanen',
    jenis_biaya = 'bahan',
    mode_biaya = 'beli_ulang',
    satuan_default = 'lembar',
    harga_min = 45000,
    harga_max = 350000,
    harga_status = 'TERVERIFIKASI_MARKETPLACE',
    sumber_referensi = 'Shopee, Tokopedia, Lazada, marketplace terpal plastik/terpal jemur.',
    sumber_dokumen = 'AGROTRACK_KATALOG_PASCAPANEN_PADI_JAGUNG_KEDELAI.md',
    tanggal_cek_harga = '2026-06-16',
    fungsi = 'Sebagai alas atau penutup saat penjemuran hasil panen.',
    keterangan = 'Biaya bisa dicatat per lembar atau per m2.',
    risiko = 'Terpal licin atau rusak dapat menurunkan efisiensi jemur dan kebersihan hasil.',
    admin_note = 'Pisahkan terpal dari biaya tenaga jemur dan dari sewa tempat jemur.',
    detail_json = JSON_OBJECT('nama_ui','Terpal Jemur','nama_file','bahan-terpal-jemur.jpg','kategori','Bahan Pendukung','subkategori','Alas jemur','fase_penggunaan',JSON_ARRAY('Pascapanen','Pengeringan'),'relevan_untuk',JSON_ARRAY('Padi','Jagung','Kedelai'),'overlap_dengan',JSON_ARRAY('Pascapanen','Transportasi & Logistik'),'mode_biaya',JSON_ARRAY('beli_ulang','habis_pakai','milik_sendiri','input_manual'),'harga_referensi','Terpal jemur di marketplace sangat bervariasi tergantung ukuran dan bahan, umumnya puluhan ribu hingga ratusan ribu rupiah per lembar.','status_harga','TERVERIFIKASI_MARKETPLACE','fungsi','Alas atau penutup penjemuran hasil panen.','keunggulan','Membantu jemur lebih bersih dan mudah dipindahkan.','keterbatasan','Bisa sobek, licin, atau rusak jika sering terkena panas dan hujan.','catatan_ui','Biaya terpal dipisah dari tenaga jemur.','sumber',JSON_ARRAY('https://shopee.co.id/','https://www.tokopedia.com/','https://www.lazada.co.id/')),
    is_active = 1
WHERE kode = 'BHN-TERPAL';

