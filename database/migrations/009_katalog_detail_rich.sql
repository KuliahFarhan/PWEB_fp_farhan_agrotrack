USE agrotrack;

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'varietas','Padi sawah',
    'kebutuhan_benih_kg_per_ha','25-40',
    'umur_panen_hari','100-115',
    'potensi_hasil','6-8 ton/ha GKG',
    'catatan','Varietas populer untuk sawah irigasi. Cocok dicatat per kg atau per kemasan.'
  )
) WHERE kode = 'BEN-PADI-CIHERANG';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'varietas','Padi inbrida',
    'umur_hari','120',
    'tinggi_tanaman','97 cm',
    'potensi_hasil','8.42 ton/ha GKG',
    'catatan','Perlu dicocokkan dengan musim, kondisi lahan, dan harga aktual.'
  )
) WHERE kode = 'BEN-PADI-INPARI32';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'varietas','Jagung hibrida',
    'kebutuhan_benih_kg_per_ha','13.75-20',
    'potensi_hasil','13.7 ton/ha',
    'catatan','Harga dan hasil sangat bergantung pada merek, kemasan, dan wilayah.'
  )
) WHERE kode = 'BEN-JAGUNG-NASA29';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'varietas','Jagung hibrida',
    'umur_tanaman','82 hari setelah tanam',
    'potensi_hasil','12.6 ton/ha',
    'catatan','Masukkan harga manual jika stok lokal berbeda dari referensi.'
  )
) WHERE kode = 'BEN-JAGUNG-JH45';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'varietas','Kedelai',
    'umur_panen_hari','82-92',
    'protein','41.8%',
    'potensi_hasil','2.0-2.5 ton/ha',
    'catatan','Cocok untuk bahan baku pangan olahan dan rotasi lahan.'
  )
) WHERE kode = 'BEN-KEDELAI-ANJASMORO';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'varietas','Kedelai',
    'umur_panen_hari','69-73',
    'potensi_hasil','3.82 ton/ha',
    'catatan','Harga retail perlu diverifikasi karena sangat bergantung toko dan wilayah.'
  )
) WHERE kode = 'BEN-KEDELAI-DEGA1';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'kandungan_n','46%',
    'fungsi','Sumber nitrogen utama untuk fase vegetatif.',
    'het','Rp1.800/kg',
    'catatan','Pakai sesuai anjuran agar tidak boros dan tidak memicu rebah.'
  )
) WHERE kode = 'PUP-UREA';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'kandungan_n','15%',
    'kandungan_p2o5','10%',
    'kandungan_k2o','12%',
    'het','Rp1.840/kg',
    'fungsi','Pupuk majemuk untuk hara utama tanaman.'
  )
) WHERE kode = 'PUP-NPK-PHONSKA';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'fungsi','Sumber fosfat untuk akar dan pembentukan hasil.',
    'catatan','Cocok sebagai pupuk dasar pada banyak komoditas.'
  )
) WHERE kode = 'PUP-SP36';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'fungsi','Sumber kalium untuk pembentukan kualitas hasil.',
    'catatan','Harga non-subsidi bervariasi dan sebaiknya diisi per distributor.'
  )
) WHERE kode = 'PUP-KCL-MOP';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'fungsi','Inokulan hayati untuk kedelai.',
    'catatan','Mendukung penambatan nitrogen, baik dicatat saat perlakuan benih.'
  )
) WHERE kode = 'PUP-RHIZOBIUM';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'fungsi','Menambah bahan organik dan memperbaiki struktur tanah.',
    'catatan','Gunakan kompos matang agar aman bagi akar muda.'
  )
) WHERE kode = 'PEM-KOMPOS';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'fungsi','Menaikkan pH tanah masam dan menambah kalsium/magnesium.',
    'catatan','Sangat bergantung pada hasil uji pH lahan.'
  )
) WHERE kode = 'PEM-DOLOMIT';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'fungsi','Mengendalikan gulma pada fase awal pertumbuhan.',
    'peringatan','Ikuti label produk, jarak semprot, dan kondisi cuaca.',
    'catatan','Salah aplikasi dapat merusak tanaman utama.'
  )
) WHERE kode = 'LIN-HERBISIDA';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'fungsi','Mengendalikan hama serangga berdasarkan monitoring OPT.',
    'peringatan','Rotasi bahan aktif untuk mencegah resistensi.',
    'catatan','Jangan dicatat dobel jika biaya jasa semprot sudah termasuk bahan.'
  )
) WHERE kode = 'LIN-INSEKTISIDA';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'fungsi','Mengendalikan penyakit jamur.',
    'peringatan','Dosis dan interval harus mengikuti label.',
    'catatan','Efektivitas tergantung diagnosis yang tepat.'
  )
) WHERE kode = 'LIN-FUNGISIDA';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'fungsi','Agens hayati untuk penyakit tanah dan dukungan PHT.',
    'catatan','Efektivitas dipengaruhi kualitas produk dan cara aplikasi.'
  )
) WHERE kode = 'LIN-TRICHODERMA';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'mode_biaya_opsional', JSON_ARRAY('beli_baru','sewa','milik_sendiri'),
    'fungsi','Menyuplai air untuk pengairan lahan.',
    'catatan','Jika milik sendiri, biaya musim sebaiknya memakai sewa/depresiasi, bukan harga penuh.'
  )
) WHERE kode = 'AIR-POMPA';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'satuan_opsional', JSON_ARRAY('roll','meter'),
    'fungsi','Menyalurkan air dari pompa ke lahan atau membuang air.',
    'catatan','Pastikan satuan roll dan meter tidak tertukar.'
  )
) WHERE kode = 'AIR-SELANG';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'satuan_opsional', JSON_ARRAY('liter'),
    'fungsi','Biaya operasional pompa air berbahan bakar bensin atau solar.',
    'catatan','Harga BBM dinamis, jadi lebih aman dicatat per liter.'
  )
) WHERE kode = 'AIR-BBM-POMPA';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'mode_biaya_opsional', JSON_ARRAY('jasa_per_ha','milik_sendiri','sewa_alat'),
    'fungsi','Membalik tanah sebelum tanam.',
    'catatan','Pisahkan jika paket traktor sudah mencakup operator dan BBM.'
  )
) WHERE kode = 'PRS-BAJAK';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'mode_biaya_opsional', JSON_ARRAY('jasa_per_ha','milik_sendiri','sewa_alat'),
    'fungsi','Menghaluskan tanah setelah olah awal.',
    'catatan','Umumnya dicatat per hektar atau paket kerja.'
  )
) WHERE kode = 'PRS-ROTAVATOR';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'fungsi','Membentuk bedengan untuk drainase dan jarak tanam.',
    'catatan','Relevan terutama pada jagung dan kedelai di lahan tertentu.'
  )
) WHERE kode = 'PRS-BEDENGAN';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'satuan_opsional', JSON_ARRAY('HOK','paket','borongan'),
    'fungsi','Mencatat tenaga kerja saat tanam padi.',
    'catatan','Hindari dobel jika biaya borongan tanam sudah termasuk upah.'
  )
) WHERE kode = 'TK-TANAM-PADI';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'satuan_opsional', JSON_ARRAY('HOK','paket'),
    'fungsi','Mencatat pekerjaan penyiangan gulma manual.',
    'catatan','Bisa dibandingkan dengan biaya herbisida agar keputusan lebih efisien.'
  )
) WHERE kode = 'TK-PENYIANGAN';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'fungsi','Biaya pekerjaan panen padi manual.',
    'catatan','Pisahkan dari combine harvester agar tidak dobel.'
  )
) WHERE kode = 'TK-PANEN-PADI';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'satuan_opsional', JSON_ARRAY('hari','paket','sewa'),
    'fungsi','Alat utama olah tanah.',
    'catatan','Jika alat milik sendiri, gunakan biaya servis/depresiasi per musim.'
  )
) WHERE kode = 'ALT-TRAKTOR';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'satuan_opsional', JSON_ARRAY('unit','paket'),
    'fungsi','Alat bantu semprot pupuk cair atau pestisida.',
    'catatan','Jangan digabung dengan biaya jasa penyemprotan jika sudah tercatat terpisah.'
  )
) WHERE kode = 'ALT-SPRAYER';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'satuan_opsional', JSON_ARRAY('ha','paket'),
    'fungsi','Memanen padi secara mekanis.',
    'catatan','Umumnya dicatat per hektar atau paket panen termasuk operator.'
  )
) WHERE kode = 'ALT-COMBINE';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'fungsi','Wadah pengemasan hasil panen.',
    'catatan','Bisa dibeli per lembar atau per pack sesuai lokal.'
  )
) WHERE kode = 'BHN-KARUNG';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'fungsi','Alas penjemuran hasil panen dan bahan bantu kerja.',
    'catatan','Umumnya bisa dipakai ulang beberapa musim.'
  )
) WHERE kode = 'BHN-TERPAL';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'fungsi','Biaya pekerjaan panen padi.',
    'catatan','Pisahkan dari pengangkutan dan proses pascapanen.'
  )
) WHERE kode = 'PAN-PADI';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'fungsi','Biaya pekerjaan panen jagung.',
    'catatan','Dapat dicatat borongan atau HOK tergantung praktik lokal.'
  )
) WHERE kode = 'PAN-JAGUNG';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'fungsi','Mengurangi kadar air hasil panen.',
    'catatan','Bisa memakai tenaga manual, terpal, atau dryer.'
  )
) WHERE kode = 'PAS-JEMUR';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'fungsi','Memisahkan biji jagung dari tongkol.',
    'catatan','Pisahkan dari panen bila tidak satu paket.'
  )
) WHERE kode = 'PAS-PIPIL-JAGUNG';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'fungsi','Mengangkut hasil panen dari lahan ke gudang atau pembeli.',
    'catatan','Catat per rit, per km, atau paket sesuai kebiasaan lokal.'
  )
) WHERE kode = 'TRN-PICKUP';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'fungsi','Tenaga bongkar muat hasil atau saprodi.',
    'catatan','Bisa dicatat terpisah dari ongkos kendaraan.'
  )
) WHERE kode = 'TRN-BONGKAR';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'fungsi','Mencatat dana pribadi yang dipakai memulai musim.',
    'catatan','Bukan biaya produksi langsung dan tidak boleh menambah profit secara salah.'
  )
) WHERE kode = 'MOD-KAS-AWAL';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'fungsi','Mencatat pinjaman KUR atau bank sebagai sumber modal.',
    'catatan','Pokok pinjaman adalah kewajiban, bunga dan admin bisa jadi biaya terpisah.'
  )
) WHERE kode = 'MOD-KUR';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'fungsi','Mencatat iuran kelompok tani atau administrasi sosial.',
    'catatan','Masukkan hanya jika benar dibayar untuk musim ini.'
  )
) WHERE kode = 'MOD-IURAN';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'fungsi','Risk register untuk gagal panen atau kerugian produksi.',
    'catatan','Bukan biaya otomatis, tetapi berguna untuk analisis risiko.'
  )
) WHERE kode = 'RSK-GAGAL-PANEN';

UPDATE katalog_items SET detail_json = JSON_SET(COALESCE(detail_json, JSON_OBJECT()),
  '$.detail_khusus', JSON_OBJECT(
    'fungsi','Mencatat susut hasil pada pengeringan, sortasi, atau penyimpanan.',
    'catatan','Bisa dihitung sebagai pengurang hasil atau kerugian aktual.'
  )
) WHERE kode = 'RSK-SUSUT-PASCAPANEN';
