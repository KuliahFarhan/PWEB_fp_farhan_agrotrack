USE agrotrack;

UPDATE katalog_items
SET detail_json = JSON_OBJECT(
  'kode', kode,
  'nama', nama,
  'kategori', kategori,
  'subkategori', subkategori,
  'komoditas', komoditas,
  'fase', fase,
  'jenis_biaya', jenis_biaya,
  'mode_biaya', mode_biaya,
  'satuan_default', satuan_default,
  'harga_min', harga_min,
  'harga_max', harga_max,
  'harga_status', harga_status,
  'sumber_dokumen', sumber_dokumen,
  'sumber_referensi', sumber_referensi,
  'tanggal_cek_harga', tanggal_cek_harga,
  'fungsi', fungsi,
  'keterangan', keterangan,
  'risiko', risiko,
  'admin_note', admin_note
)
WHERE detail_json IS NULL;

UPDATE katalog_items
SET detail_json = JSON_SET(
  COALESCE(detail_json, JSON_OBJECT()),
  '$.catatan_detail',
  CASE kategori
    WHEN 'Benih & Bibit' THEN 'Simpan harga per kemasan, kebutuhan benih per ha, umur panen, potensi hasil, dan catatan ketahanan varietas.'
    WHEN 'Pupuk & Nutrisi' THEN 'Simpan HET/non-subsidi, kandungan, fungsi hara, dan status harga.'
    WHEN 'Pembenah Tanah' THEN 'Simpan fungsi perbaikan tanah, status lokal, dan satuan harga.'
    WHEN 'Perlindungan Tanaman' THEN 'Simpan target hama/penyakit, fase penggunaan, risiko, dan catatan PHT.'
    WHEN 'Air & Irigasi' THEN 'Simpan mode beli/sewa/milik sendiri, biaya BBM, dan catatan penyusutan.'
    WHEN 'Persiapan Lahan' THEN 'Simpan mode jasa/alutsista manual, luas kerja, dan catatan lokal.'
    WHEN 'Tenaga Kerja' THEN 'Simpan HOK, borongan, per satuan hasil, serta opsi tenaga keluarga.'
    WHEN 'Alat & Mesin' THEN 'Simpan mode aset atau jasa, tarif sewa, dan biaya operasional per musim.'
    WHEN 'Bahan Pendukung' THEN 'Simpan kemasan, peran dalam panen/pascapanen, dan catatan pakai ulang.'
    WHEN 'Panen' THEN 'Simpan mode panen manual atau mekanis, satuan kerja, dan overlap dengan pascapanen.'
    WHEN 'Pascapanen' THEN 'Simpan proses pengeringan, perontokan, sortasi, pemipilan, dan susut.'
    WHEN 'Transportasi & Logistik' THEN 'Simpan mode rit, trip, HOK, dan ongkos angkut.'
    WHEN 'Modal & Administrasi' THEN 'Simpan arus kas, kewajiban, bunga, iuran, dan pemisahan dari biaya produksi.'
    WHEN 'Risiko / Kerugian' THEN 'Simpan risk register, dampak estimasi, dan kerugian aktual/mitigasi.'
    ELSE 'Item katalog AgroTrack.'
  END
)
WHERE detail_json IS NOT NULL;

UPDATE katalog_items
SET detail_json = JSON_SET(detail_json, '$.detail_khusus',
  CASE kode
    WHEN 'BEN-PADI-CIHERANG' THEN JSON_OBJECT('kebutuhan_benih_kg_per_ha','25-40','catatan','Varietas padi sawah populer. Harga mengikuti marketplace dan perlu review admin.')
    WHEN 'BEN-PADI-INPARI32' THEN JSON_OBJECT('umur_hari','120','tinggi_tanaman','97 cm','potensi_hasil','8.42 ton/ha GKG')
    WHEN 'BEN-JAGUNG-NASA29' THEN JSON_OBJECT('potensi_hasil','13.7 ton/ha','kebutuhan_benih_kg_per_ha','13.75-20','catatan','Harga dari marketplace dan kajian berbeda, simpan range.')
    WHEN 'BEN-JAGUNG-JH45' THEN JSON_OBJECT('umur_tanaman','82 hari setelah tanam','potensi_hasil','12.6 ton/ha','catatan','Harga belum diverifikasi.')
    WHEN 'BEN-KEDELAI-ANJASMORO' THEN JSON_OBJECT('umur_panen_hari','82-92','protein','41.8%','catatan','Cocok bahan baku tempe.')
    WHEN 'BEN-KEDELAI-DEGA1' THEN JSON_OBJECT('umur_panen_hari','69-73','potensi_hasil','3.82 ton/ha','catatan','Harga retail spesifik belum jelas.')
    WHEN 'PUP-UREA' THEN JSON_OBJECT('kandungan_n','46%','het','Rp1.800/kg','catatan','Sumber nitrogen utama.')
    WHEN 'PUP-NPK-PHONSKA' THEN JSON_OBJECT('kandungan_n','15%','kandungan_p2o5','10%','kandungan_k2o','12%','het','Rp1.840/kg')
    WHEN 'PUP-SP36' THEN JSON_OBJECT('fungsi','Sumber fosfat untuk akar dan pembentukan hasil.')
    WHEN 'PUP-RHIZOBIUM' THEN JSON_OBJECT('fungsi','Inokulan hayati untuk kedelai','catatan','Mendukung penambatan nitrogen.')
    WHEN 'PEM-DOLOMIT' THEN JSON_OBJECT('fungsi','Memperbaiki tanah masam','catatan','Gunakan jika pH tanah memang perlu.')
    WHEN 'LIN-HERBISIDA' THEN JSON_OBJECT('fungsi','Mengendalikan gulma','catatan','Ikuti label produk dan kondisi lapangan.')
    WHEN 'LIN-INSEKTISIDA' THEN JSON_OBJECT('fungsi','Mengendalikan hama serangga','catatan','Berdasarkan monitoring OPT.')
    WHEN 'LIN-FUNGISIDA' THEN JSON_OBJECT('fungsi','Mengendalikan penyakit jamur','catatan','Dosis mengikuti label.')
    WHEN 'LIN-TRICHODERMA' THEN JSON_OBJECT('fungsi','Agens hayati untuk penyakit tanah','catatan','Bagian dari PHT.')
    WHEN 'AIR-POMPA' THEN JSON_OBJECT('mode_biaya_opsional',JSON_ARRAY('beli_baru','sewa','milik_sendiri'),'catatan','Bisa dicatat sebagai aset atau biaya operasional.')
    WHEN 'AIR-SELANG' THEN JSON_OBJECT('panjang', 'roll 50 m','catatan','Bisa pakai satuan meter atau roll.')
    WHEN 'AIR-BBM-POMPA' THEN JSON_OBJECT('catatan','Harga BBM dinamis, pilih jenis BBM dan liter.')
    WHEN 'PRS-BAJAK' THEN JSON_OBJECT('mode_biaya_opsional',JSON_ARRAY('jasa_per_ha','milik_sendiri','sewa_alat'),'catatan','Umumnya satu paket olah tanah.')
    WHEN 'PRS-ROTAVATOR' THEN JSON_OBJECT('mode_biaya_opsional',JSON_ARRAY('jasa_per_ha','milik_sendiri','sewa_alat'))
    WHEN 'PRS-BEDENGAN' THEN JSON_OBJECT('catatan','Relevan untuk jagung/kedelai pada lahan tertentu.')
    WHEN 'TK-TANAM-PADI' THEN JSON_OBJECT('satuan_opsional',JSON_ARRAY('HOK','paket','borongan'),'catatan','Hindari dobel dengan paket tanam.')
    WHEN 'TK-PENYIANGAN' THEN JSON_OBJECT('satuan_opsional',JSON_ARRAY('HOK','paket'),'catatan','Bisa dibandingkan dengan biaya herbisida.')
    WHEN 'TK-PANEN-PADI' THEN JSON_OBJECT('catatan','Pisahkan dari combine jika panen mekanis.')
    WHEN 'ALT-TRAKTOR' THEN JSON_OBJECT('catatan','Catat sewa, jasa, atau depresiasi alat milik sendiri.')
    WHEN 'ALT-SPRAYER' THEN JSON_OBJECT('catatan','Jangan gandakan dengan biaya jasa semprot.')
    WHEN 'ALT-COMBINE' THEN JSON_OBJECT('catatan','Umumnya per hektar atau paket panen.')
    WHEN 'BHN-KARUNG' THEN JSON_OBJECT('catatan','Wadah pengemasan hasil panen.')
    WHEN 'BHN-TERPAL' THEN JSON_OBJECT('catatan','Bisa dipakai ulang beberapa musim.')
    WHEN 'PAN-PADI' THEN JSON_OBJECT('catatan','Biaya pekerjaan panen padi manual.')
    WHEN 'PAN-JAGUNG' THEN JSON_OBJECT('catatan','Pisahkan dari pemipilan jika tidak satu paket.')
    WHEN 'PAS-JEMUR' THEN JSON_OBJECT('catatan','Menurunkan kadar air hasil panen.')
    WHEN 'PAS-PIPIL-JAGUNG' THEN JSON_OBJECT('catatan','Jagung terlalu basah meningkatkan kerusakan biji.')
    WHEN 'TRN-PICKUP' THEN JSON_OBJECT('catatan','Catat per rit, km, atau paket sesuai lokal.')
    WHEN 'TRN-BONGKAR' THEN JSON_OBJECT('catatan','Bisa dicatat terpisah dari kendaraan.')
    WHEN 'MOD-KAS-AWAL' THEN JSON_OBJECT('catatan','Tidak masuk biaya produksi langsung.')
    WHEN 'MOD-KUR' THEN JSON_OBJECT('catatan','Pokok pinjaman bukan biaya produksi; bunga/admin bisa jadi biaya terpisah.')
    WHEN 'MOD-IURAN' THEN JSON_OBJECT('catatan','Masukkan hanya bila benar dibayar untuk musim ini.')
    WHEN 'RSK-GAGAL-PANEN' THEN JSON_OBJECT('catatan','Masuk risk register, bukan biaya otomatis.')
    WHEN 'RSK-SUSUT-PASCAPANEN' THEN JSON_OBJECT('catatan','Bisa dicatat sebagai risiko atau pengurang hasil.')
    ELSE JSON_OBJECT('catatan','Detail tambahan dari katalog MD.')
  END
);
