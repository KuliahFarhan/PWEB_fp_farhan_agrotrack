# AgroTrack — Katalog Persiapan Lahan untuk Padi, Jagung, dan Kedelai

**Versi:** 1.0  
**Tanggal penyusunan:** 16 Juni 2026  
**Kategori:** Persiapan Lahan  
**Target komoditas:** Padi, Jagung, Kedelai  
**Fungsi dokumen:** Referensi seed database, UI katalog operasional, dan card asset AgroTrack.

---

## 1. Catatan Utama: Persiapan Lahan Bukan Sekadar Barang

Kategori **Persiapan Lahan** lebih kompleks daripada benih, pupuk, atau pestisida. Pada kategori ini, biaya bisa berbentuk:

1. **Aset alat**  
   Contoh: cangkul, garu manual, bajak, rotavator, traktor. Bisa dibeli sekali dan dipakai beberapa musim.

2. **Sewa alat / jasa olah tanah**  
   Contoh: jasa bajak sawah, sewa traktor, jasa rotavator, jasa pembuatan bedengan.

3. **Tenaga kerja manual**  
   Contoh: pembersihan lahan, mencangkul, memperbaiki pematang, membuat bedengan manual.

4. **Aktivitas tanpa biaya tunai langsung**  
   Contoh: petani mengerjakan sendiri atau gotong royong. Tetap penting dicatat sebagai aktivitas walaupun nominal bisa Rp0.

5. **Biaya lokal/input manual**  
   Contoh: pematang sawah, bedengan, pembersihan lahan. Harga sangat bergantung luas, kondisi tanah, jumlah pekerja, dan daerah.

Sumber konsep:
- Pengolahan lahan adalah upaya mempersiapkan media tanam yang baik dan berpengaruh pada keberhasilan budidaya.  
  https://ejournal.uniks.ac.id/index.php/bhakti_nagori/article/download/4376/3255
- BPS memiliki tabel nilai produksi dan biaya produksi per musim tanam per hektar untuk padi sawah, padi ladang, jagung, dan kedelai. Ini menunjukkan bahwa biaya budidaya tanaman pangan memang perlu dicatat per musim/per hektar.  
  https://www.bps.go.id/id/statistics-table/1/MjA1NSMx/nilai-produksi-dan-biaya-produksi-per-musim-tanam-per-hektar-budidaya-tanaman-padi-sawah--padi-ladang--jagung--dan-kedelai--2017.html
- Biaya tenaga kerja/jasa pertanian dan sewa lahan disebut sebagai komponen dominan dalam biaya produksi padi pada salah satu pembahasan usahatani.  
  https://journal.iaisambas.ac.id/index.php/Cross-Border/article/download/2098/1577

---

## 2. Asset yang Sudah Disiapkan

| No | Nama File Asset | Nama Item UI | Status |
|---:|---|---|---|
| 1 | `persiapan-traktor-roda-dua.jpg` | Traktor Roda Dua / Hand Tractor | Siap pakai |
| 2 | `persiapan-bajak-singkal.jpg` | Bajak Singkal | Siap pakai |
| 3 | `persiapan-rotavator.jpg` | Rotavator / Bajak Rotary | Siap pakai |
| 4 | `persiapan-garu-tanah.jpg` | Garu Tanah | Siap pakai |
| 5 | `persiapan-cangkul.jpg` | Cangkul / Pacul | Siap pakai |
| 6 | `persiapan-pembersihan-lahan.jpg` | Pembersihan Lahan | Siap pakai |
| 7 | `persiapan-bedengan.jpg` | Pembuatan Bedengan | Siap pakai |
| 8 | `persiapan-pematang-sawah.jpg` | Perbaikan Pematang Sawah | Siap pakai |

Rekomendasi folder:

```text
assets/img/saprodi/persiapan-lahan/
```

---

## 3. Model Biaya yang Disarankan

### 3.1 Mode Biaya

Untuk kategori ini, field `mode_biaya` sebaiknya mendukung:

```text
beli_baru
sewa_alat
jasa_per_ha
jasa_per_meter
jasa_per_hari
milik_sendiri
pinjam_kelompok
tenaga_kerja
gotong_royong
input_manual
aktivitas_tanpa_biaya
```

### 3.2 Rumus Biaya

| Mode | Rumus | Contoh |
|---|---|---|
| Beli baru penuh | `biaya = harga_beli` | Beli cangkul |
| Beli baru disusutkan | `biaya_musim = harga_beli / umur_pakai_musim` | Beli traktor/rotavator |
| Sewa alat | `tarif_sewa × durasi` | Sewa traktor harian |
| Jasa per hektar | `tarif_per_ha × luas_ha` | Jasa bajak 0,8 ha |
| Jasa per meter | `tarif_per_meter × panjang_meter` | Jasa bedengan |
| Tenaga kerja | `upah_harian × jumlah_orang × jumlah_hari` | Bersih lahan manual |
| Milik sendiri | `BBM + operator + servis + penyusutan opsional` | Traktor milik sendiri |
| Gotong royong | `konsumsi + iuran + biaya kecil lain` | Bersih saluran/pematang |
| Aktivitas tanpa biaya | `biaya = 0`, tetap dicatat sebagai aktivitas | Petani mencangkul sendiri |

### 3.3 Kenapa Model Ini Penting?

Jika semua item dipaksa menjadi “harga produk”, data akan menyesatkan.

Contoh:
- Traktor roda dua bisa dibeli puluhan juta, tetapi petani lebih sering membayar **jasa olah tanah per hektar**.
- Bajak singkal dan rotavator sering menjadi attachment/alat tambahan, bukan biaya yang selalu dibeli setiap musim.
- Pembersihan lahan dan pematang bukan barang, melainkan pekerjaan.
- Bedengan bisa dihitung per meter, per hari kerja, atau per luasan.

---

## 4. Ringkasan Katalog Persiapan Lahan

| No | Item | File Asset | Tipe Item | Fase | Relevan Untuk | Harga Referensi | Status Harga |
|---:|---|---|---|---|---|---:|---|
| 1 | Traktor Roda Dua / Hand Tractor | `persiapan-traktor-roda-dua.jpg` | Aset / jasa olah tanah | Pra-tanam | Padi, Jagung, Kedelai | Beli ±Rp15.072.000–Rp60.528.000; jasa olah tanah ±Rp900.000–Rp2.000.000/ha dalam beberapa sumber | TERVERIFIKASI_CAMPURAN |
| 2 | Bajak Singkal | `persiapan-bajak-singkal.jpg` | Attachment / alat olah tanah | Pra-tanam | Padi, Jagung, Kedelai | Harga attachment bervariasi; traktor tipe singkal Yanmar di Inaproc Rp28.194.000 | TERVERIFIKASI_PRODUK_SPESIFIK |
| 3 | Rotavator / Bajak Rotary | `persiapan-rotavator.jpg` | Attachment / alat olah tanah | Pra-tanam | Padi, Jagung, Kedelai | Traktor rotary Quick ±Rp45.672.000–Rp47.928.000; mini tiller/rotary marketplace ±Rp1.215.000+ | TERVERIFIKASI_MARKETPLACE |
| 4 | Garu Tanah | `persiapan-garu-tanah.jpg` | Alat manual / finishing olah tanah | Pra-tanam | Padi, Jagung, Kedelai | Garu manual kecil ±Rp9.700–Rp63.999; alat besar input manual | TERVERIFIKASI_MARKETPLACE_TERBATAS |
| 5 | Cangkul / Pacul | `persiapan-cangkul.jpg` | Alat manual | Pra-tanam, perawatan lahan | Padi, Jagung, Kedelai | ±Rp21.999–Rp163.000 di Blibli; sumber lain Rp43.000–Rp85.500+ | TERVERIFIKASI_MARKETPLACE |
| 6 | Pembersihan Lahan | `persiapan-pembersihan-lahan.jpg` | Tenaga kerja / jasa | Pra-tanam | Padi, Jagung, Kedelai | Input manual; dapat dihitung dari upah harian × jumlah pekerja × hari | INPUT_MANUAL_LOKAL |
| 7 | Pembuatan Bedengan | `persiapan-bedengan.jpg` | Jasa / tenaga kerja | Pra-tanam | Jagung, Kedelai, opsional padi lahan kering | Contoh jasa Rp50.000/meter di SipLah; analisa hortikultura Rp3.000.000 untuk 60 HOK | TERVERIFIKASI_SEBAGIAN |
| 8 | Perbaikan Pematang Sawah | `persiapan-pematang-sawah.jpg` | Tenaga kerja / perawatan infrastruktur kecil | Pra-tanam dan selama musim | Padi terutama | Input manual | INPUT_MANUAL_LOKAL |

---

## 5. Detail Item Katalog

### 5.1 Traktor Roda Dua / Hand Tractor

| Field | Isi |
|---|---|
| Nama UI | Traktor Roda Dua / Hand Tractor |
| Nama file | `persiapan-traktor-roda-dua.jpg` |
| Kategori | Persiapan Lahan |
| Tipe item | Aset alat / sewa / jasa olah tanah |
| Fase penggunaan | Pra-tanam |
| Relevan untuk | Padi, Jagung, Kedelai |
| Mode biaya | `beli_baru`, `jasa_per_ha`, `sewa_alat`, `milik_sendiri`, `pinjam_kelompok` |
| Harga beli referensi | Quick traktor roda dua ±Rp15.072.000–Rp60.528.000; Blibli traktor sawah Quick ±Rp18.950.000–Rp42.228.000; Indotrading hand tractor ±Rp30.200.000–Rp36.000.000 |
| Harga jasa referensi | Antara Foto 2020: jasa bajak naik dari Rp1,4 juta menjadi Rp2 juta/ha; studi traktor roda empat Merauke menyebut kisaran Rp900.000/ha; IPB mencatat biaya/sewa traktor pada konteks studi sekitar Rp1,1 juta–Rp1,18 juta/ha |
| Status harga | TERVERIFIKASI_CAMPURAN |
| Fungsi utama | Mengolah tanah sebelum tanam, mempercepat pembajakan/penggemburan dibanding manual |
| Keunggulan | Menghemat waktu, kuat untuk padi sawah dan lahan tanaman pangan |
| Keterbatasan | Modal beli tinggi, perlu operator, BBM, perawatan, dan kondisi lahan yang sesuai |
| Catatan UI | Default petani sebaiknya memilih mode `jasa_per_ha`, bukan beli alat |

#### Opsi Biaya UI

```text
Mode 1 — Jasa olah tanah:
Luas lahan (ha) × tarif jasa per ha

Mode 2 — Milik sendiri:
BBM + operator + servis + penyusutan alat

Mode 3 — Beli baru:
Harga beli / umur pakai musim
```

#### Deskripsi Card UI

> Traktor roda dua digunakan untuk mengolah tanah sebelum tanam. Dalam praktik petani, biaya yang paling sering dicatat adalah jasa olah tanah per hektar atau biaya operasional jika alat milik sendiri.

#### Sumber
- Quick traktor roda dua: https://tokoquick.id/category/unit/unit-traktor-roda-2-quick
- Blibli traktor sawah Quick: https://www.blibli.com/jual/traktor-sawah-quik
- Blibli mesin hand tractor: https://www.blibli.com/jual/mesin-hand-tractor
- Indotrading traktor roda dua: https://www.indotrading.com/jual-traktor-sawah
- Inaproc Yanmar traktor tangan roda dua: https://katalog.inaproc.id/solusi-klik/yanmar-traktor-tangan-roda-2-roda-dua-tipe-singkal-model-ymsx
- Antara Foto tarif jasa bajak sawah 2020: https://www.antarafoto.com/id/view/1132310/kenaikan-tarif-jasa-bajak-sawah
- Analisis biaya mekanisasi lahan kering IPB: https://repository.ipb.ac.id/handle/123456789/15797
- Analisis jasa traktor roda empat Merauke: https://ojs.um-palembang.ac.id/index.php/JGSA/article/download/329/138/2601

---

### 5.2 Bajak Singkal

| Field | Isi |
|---|---|
| Nama UI | Bajak Singkal |
| Nama file | `persiapan-bajak-singkal.jpg` |
| Kategori | Persiapan Lahan |
| Tipe item | Attachment / alat olah tanah |
| Fase penggunaan | Pra-tanam |
| Relevan untuk | Padi, Jagung, Kedelai |
| Mode biaya | `beli_baru`, `milik_sendiri`, `jasa_per_ha`, `pinjam_kelompok` |
| Harga referensi | Produk traktor tangan tipe singkal Yanmar di Inaproc Rp28.194.000; attachment bajak singkal spesifik perlu verifikasi toko/daerah |
| Status harga | TERVERIFIKASI_PRODUK_SPESIFIK |
| Fungsi utama | Membalik tanah, menutup sisa tanaman/gulma, dan membuka lapisan tanah sebelum pengolahan lanjutan |
| Keunggulan | Cocok untuk pembajakan awal dan pengolahan tanah berat |
| Keterbatasan | Biasanya dipakai bersama traktor; harga attachment berbeda antar model |
| Catatan UI | Dalam biaya petani, sering melekat pada “jasa bajak”, bukan dibeli terpisah |

#### Opsi Biaya UI

```text
Jika alat milik sendiri:
BBM + operator + perawatan + penyusutan attachment

Jika jasa:
tarif jasa olah tanah per ha

Jika beli attachment:
harga beli attachment / umur pakai musim
```

#### Deskripsi Card UI

> Bajak singkal digunakan untuk membalik tanah pada tahap awal persiapan lahan. Item ini biasanya bagian dari paket jasa olah tanah menggunakan traktor.

#### Sumber
- Inaproc Yanmar traktor tangan roda dua tipe singkal Rp28.194.000: https://katalog.inaproc.id/solusi-klik/yanmar-traktor-tangan-roda-2-roda-dua-tipe-singkal-model-ymsx
- Konsep pengolahan lahan: https://ejournal.uniks.ac.id/index.php/bhakti_nagori/article/download/4376/3255
- Analisis biaya pengolahan tanah IPB: https://repository.ipb.ac.id/handle/123456789/15797

---

### 5.3 Rotavator / Bajak Rotary

| Field | Isi |
|---|---|
| Nama UI | Rotavator / Bajak Rotary |
| Nama file | `persiapan-rotavator.jpg` |
| Kategori | Persiapan Lahan |
| Tipe item | Attachment / alat olah tanah |
| Fase penggunaan | Pra-tanam |
| Relevan untuk | Padi, Jagung, Kedelai |
| Mode biaya | `beli_baru`, `milik_sendiri`, `jasa_per_ha`, `sewa_alat` |
| Harga referensi | Quick traktor rotary ±Rp45.672.000–Rp47.928.000; Lazada menampilkan variasi alat rotary/mini tiller mulai sekitar Rp1.215.000 untuk mini tiller/produk lebih kecil |
| Status harga | TERVERIFIKASI_MARKETPLACE |
| Fungsi utama | Menghancurkan bongkahan tanah, menggemburkan, dan meratakan lahan |
| Keunggulan | Hasil olah tanah lebih halus; cocok setelah pembajakan awal |
| Keterbatasan | Tidak selalu diperlukan jika cukup bajak/garu; biaya tergantung alat dan operator |
| Catatan UI | Cocok untuk padi sawah setelah bajak dan lahan jagung/kedelai sebelum bedengan |

#### Opsi Biaya UI

```text
Jasa rotary:
Luas lahan × tarif per ha

Milik sendiri:
BBM + operator + servis + penyusutan

Beli baru:
harga beli / umur pakai musim
```

#### Deskripsi Card UI

> Rotavator atau bajak rotary digunakan untuk menggemburkan dan meratakan tanah agar lebih siap ditanami. Item ini bisa dicatat sebagai jasa olah tanah atau biaya operasional alat milik sendiri.

#### Sumber
- Quick traktor roda dua/rotary: https://tokoquick.id/category/unit/unit-traktor-roda-2-quick
- Lazada traktor rotary/mini tiller: https://www.lazada.co.id/tag/traktor-rotary/
- Shopee mesin traktor/cultivator: https://shopee.co.id/list/Mesin%20Traktor/Sawah
- Kementan, alsintan menekan biaya olah tanah cabai hingga 90%: https://www.pertanian.go.id/?act=view&id=3320&show=news

---

### 5.4 Garu Tanah

| Field | Isi |
|---|---|
| Nama UI | Garu Tanah |
| Nama file | `persiapan-garu-tanah.jpg` |
| Kategori | Persiapan Lahan |
| Tipe item | Alat manual / finishing olah tanah |
| Fase penggunaan | Pra-tanam, setelah bajak/olah tanah |
| Relevan untuk | Padi, Jagung, Kedelai |
| Mode biaya | `beli_baru`, `milik_sendiri`, `tenaga_kerja`, `aktivitas_tanpa_biaya` |
| Harga referensi | Shopee garu manual kecil ±Rp9.700–Rp63.999; harga garu pertanian besar/attachment perlu verifikasi |
| Status harga | TERVERIFIKASI_MARKETPLACE_TERBATAS |
| Fungsi utama | Meratakan dan merapikan tanah setelah pembajakan/pengolahan awal |
| Keunggulan | Murah untuk alat manual; mudah dipahami; cocok untuk lahan kecil |
| Keterbatasan | Tidak semua “garu” di marketplace cocok untuk sawah skala besar; sebagian hanya alat taman |
| Catatan UI | Untuk UI, pisahkan garu manual dan garu attachment jika nanti data diperluas |

#### Opsi Biaya UI

```text
Beli alat manual:
biaya = harga alat

Milik sendiri:
biaya = 0 atau perawatan

Jasa/tenaga:
upah tenaga kerja × hari kerja
```

#### Deskripsi Card UI

> Garu tanah digunakan untuk meratakan permukaan tanah setelah pembajakan atau penggemburan. Untuk lahan kecil, garu manual bisa dipakai bersama cangkul; untuk skala besar biasanya menjadi bagian dari jasa olah tanah.

#### Sumber
- Shopee garu tanah: https://shopee.co.id/search?keyword=garu%20tanah
- Lazada garu pertanian: https://www.lazada.co.id/tag/garu-pertanian/
- Analisis biaya pengolahan tanah IPB: https://repository.ipb.ac.id/handle/123456789/15797

---

### 5.5 Cangkul / Pacul

| Field | Isi |
|---|---|
| Nama UI | Cangkul / Pacul |
| Nama file | `persiapan-cangkul.jpg` |
| Kategori | Persiapan Lahan |
| Tipe item | Alat manual |
| Fase penggunaan | Pra-tanam, perbaikan lahan, pematang, penyiangan ringan |
| Relevan untuk | Padi, Jagung, Kedelai |
| Mode biaya | `beli_baru`, `milik_sendiri`, `tenaga_kerja`, `aktivitas_tanpa_biaya` |
| Harga referensi | Blibli cangkul pertanian ±Rp21.999–Rp163.000; Shopee contoh Rp43.000–Rp85.500+; Lazada cangkul pertanian mulai ±Rp19.999 |
| Status harga | TERVERIFIKASI_MARKETPLACE |
| Fungsi utama | Mengolah tanah manual, memperbaiki pematang, membuat saluran kecil, membersihkan gulma, dan perbaikan detail lahan |
| Keunggulan | Murah, fleksibel, hampir selalu relevan |
| Keterbatasan | Lambat untuk lahan luas dan sangat bergantung tenaga kerja |
| Catatan UI | Harga alat kecil, tetapi biaya tenaga kerja manual bisa jauh lebih besar |

#### Opsi Biaya UI

```text
Beli cangkul:
biaya = harga cangkul

Milik sendiri:
biaya = 0

Tenaga kerja manual:
upah harian × jumlah orang × jumlah hari
```

#### Deskripsi Card UI

> Cangkul adalah alat manual dasar untuk persiapan dan perawatan lahan. Dalam AgroTrack, cangkul bisa dicatat sebagai aset kecil atau aktivitas kerja manual jika petani membayar tenaga kerja.

#### Sumber
- Blibli cangkul pertanian: https://www.blibli.com/jual/cangkul-pertanian
- Shopee cangkul petani: https://shopee.co.id/search?keyword=cangkul%20petani
- Lazada cangkul pertanian: https://www.lazada.co.id/tag/cangkul-pertanian/
- BigGo cangkul sawah murah: https://biggo.id/s/cangkul%2Bsawah%2Bmurah/

---

### 5.6 Pembersihan Lahan

| Field | Isi |
|---|---|
| Nama UI | Pembersihan Lahan |
| Nama file | `persiapan-pembersihan-lahan.jpg` |
| Kategori | Persiapan Lahan |
| Tipe item | Aktivitas / jasa / tenaga kerja |
| Fase penggunaan | Pra-tanam |
| Relevan untuk | Padi, Jagung, Kedelai |
| Mode biaya | `tenaga_kerja`, `jasa_per_hari`, `gotong_royong`, `aktivitas_tanpa_biaya`, `input_manual` |
| Harga referensi | Input manual lokal; dapat dihitung dari upah harian × jumlah pekerja × hari |
| Status harga | INPUT_MANUAL_LOKAL |
| Fungsi utama | Membersihkan sisa tanaman, gulma, sampah lahan, dan material pengganggu sebelum tanam |
| Keunggulan | Fase awal yang nyata dan sering menimbulkan biaya tenaga kerja |
| Keterbatasan | Tidak punya harga nasional stabil; tergantung kondisi awal lahan |
| Catatan UI | Lebih baik dicatat sebagai aktivitas + tenaga kerja, bukan sebagai produk |

#### Opsi Biaya UI

```text
Manual:
upah_harian × jumlah_orang × jumlah_hari

Gotong royong:
biaya konsumsi + iuran kecil

Dikerjakan sendiri:
biaya = 0, aktivitas tetap tercatat
```

#### Deskripsi Card UI

> Pembersihan lahan adalah aktivitas pra-tanam untuk menghilangkan gulma, sisa panen, dan material pengganggu. Biaya paling realistis dihitung dari tenaga kerja atau jasa lokal.

#### Sumber
- Konsep persiapan/pengolahan lahan: https://ejournal.uniks.ac.id/index.php/bhakti_nagori/article/download/4376/3255
- Kementan, mekanisasi dapat menekan biaya olah tanah dibanding mencangkul manual: https://www.pertanian.go.id/?act=view&id=3320&show=news
- BPS biaya produksi tanaman pangan per musim/ha: https://www.bps.go.id/id/statistics-table/1/MjA1NSMx/nilai-produksi-dan-biaya-produksi-per-musim-tanam-per-hektar-budidaya-tanaman-padi-sawah--padi-ladang--jagung--dan-kedelai--2017.html

---

### 5.7 Pembuatan Bedengan

| Field | Isi |
|---|---|
| Nama UI | Pembuatan Bedengan |
| Nama file | `persiapan-bedengan.jpg` |
| Kategori | Persiapan Lahan |
| Tipe item | Aktivitas / jasa / tenaga kerja |
| Fase penggunaan | Pra-tanam |
| Relevan untuk | Jagung, Kedelai, padi lahan kering tertentu |
| Mode biaya | `jasa_per_meter`, `jasa_per_ha`, `tenaga_kerja`, `milik_sendiri`, `input_manual` |
| Harga referensi | SipLah Blibli mencantumkan jasa pembuatan bedengan Rp50.000/meter; analisa hortikultura Temanggung mencantumkan pembuatan bedengan 60 HOK = Rp3.000.000 |
| Status harga | TERVERIFIKASI_SEBAGIAN |
| Fungsi utama | Membentuk guludan/bedengan untuk drainase, aerasi, jalur tanam, dan pengaturan air |
| Keunggulan | Sangat relevan untuk lahan kering, jagung, kedelai, dan tanaman yang tidak tahan genangan |
| Keterbatasan | Tarif sangat lokal; satuan bisa meter, HOK, hari kerja, atau hektar |
| Catatan UI | UI harus membiarkan user memilih satuan: meter, hektar, HOK, atau manual |

#### Opsi Biaya UI

```text
Per meter:
panjang_bedengan × tarif_per_meter

Per HOK:
jumlah_HOK × upah_per_HOK

Manual:
biaya_total = input user
```

#### Deskripsi Card UI

> Pembuatan bedengan membantu mengatur drainase dan jalur tanam, terutama pada jagung dan kedelai. Biaya dapat dihitung per meter, per hektar, atau berdasarkan jumlah hari orang kerja.

#### Sumber
- SipLah Blibli jasa pembuatan bedengan Rp50.000/meter: https://siplah.blibli.com/product/jasa-pembuatan-bedengan/STBS-0075-00069
- Analisa ekonomi hortikultura Temanggung: https://dkppp.temanggungkab.go.id/assets/dok_file/92_23-analisa-ekonomi-usaha-tani-hortikultura.pdf
- Pendampingan pembuatan bedengan dan pengolahan lahan: https://ejournal.uniks.ac.id/index.php/bhakti_nagori/article/download/4376/3255
- Rancang bangun alat pembuat alur bedengan: https://e-jurnal.pnl.ac.id/mesinsainsterapan/article/download/637/1326

---

### 5.8 Perbaikan Pematang Sawah

| Field | Isi |
|---|---|
| Nama UI | Perbaikan Pematang Sawah |
| Nama file | `persiapan-pematang-sawah.jpg` |
| Kategori | Persiapan Lahan |
| Tipe item | Aktivitas / perawatan lahan / tenaga kerja |
| Fase penggunaan | Pra-tanam dan selama musim jika bocor/rusak |
| Relevan untuk | Padi terutama; opsional lahan lain yang butuh batas petakan |
| Mode biaya | `tenaga_kerja`, `gotong_royong`, `aktivitas_tanpa_biaya`, `input_manual` |
| Harga referensi | Input manual lokal |
| Status harga | INPUT_MANUAL_LOKAL |
| Fungsi utama | Menahan air di petakan sawah, membatasi petak, dan membantu kontrol air |
| Keunggulan | Sangat penting untuk padi sawah karena pengelolaan air bergantung pada pematang yang baik |
| Keterbatasan | Tidak ada harga nasional; biaya bergantung panjang pematang, kerusakan, dan tenaga |
| Catatan UI | Cocok masuk fase pra-tanam dan “perawatan air/lahan” |

#### Opsi Biaya UI

```text
Tenaga kerja:
upah_harian × jumlah_orang × jumlah_hari

Gotong royong:
biaya konsumsi/iuran

Dikerjakan sendiri:
biaya = 0, aktivitas tetap dicatat
```

#### Deskripsi Card UI

> Pematang sawah berfungsi menjaga air di petakan sawah dan membatasi area tanam. Perbaikannya sering dilakukan sebelum tanam atau ketika terjadi kebocoran/kerusakan selama musim.

#### Sumber
- Konsep jaringan irigasi dan pengaturan air sawah: https://sda.pu.go.id/balai/bbwsmesujisekampung/pages/posts/mengenal-jaringan-irigasi-menuju-swasembada-pangan-1761553763
- Pengelolaan air dan kebutuhan padi: https://jurnal.unmuhjember.ac.id/index.php/PENELITIAN_IPTEKS/article/view/5110
- Biaya tenaga kerja/jasa pertanian sebagai komponen besar usahatani: https://journal.iaisambas.ac.id/index.php/Cross-Border/article/download/2098/1577

---

## 6. Relevansi per Tanaman

| Item | Padi | Jagung | Kedelai | Catatan |
|---|---|---|---|---|
| Traktor Roda Dua | Sangat relevan | Relevan | Relevan | Default sebagai jasa olah tanah |
| Bajak Singkal | Sangat relevan | Relevan | Relevan | Membalik tanah/pembajakan awal |
| Rotavator | Sangat relevan | Relevan | Relevan | Menggemburkan dan meratakan tanah |
| Garu Tanah | Relevan | Relevan | Relevan | Finishing/perataan |
| Cangkul | Relevan | Relevan | Relevan | Alat manual/perbaikan kecil |
| Pembersihan Lahan | Sangat relevan | Sangat relevan | Sangat relevan | Aktivitas pra-tanam umum |
| Pembuatan Bedengan | Opsional | Sangat relevan | Sangat relevan | Lebih kuat untuk lahan kering/drainase |
| Perbaikan Pematang Sawah | Sangat relevan | Rendah | Rendah | Khas padi sawah |

---

## 7. Rekomendasi Tampilan UI AgroTrack

### 7.1 Pecah UI Menjadi 3 Jenis

1. **Alat/Aset**
   - Traktor roda dua
   - Bajak singkal
   - Rotavator
   - Garu tanah
   - Cangkul

2. **Jasa/Tenaga Kerja**
   - Pembersihan lahan
   - Pembuatan bedengan
   - Perbaikan pematang
   - Jasa bajak/traktor

3. **Aktivitas Tanpa Nominal Wajib**
   - Gotong royong
   - Dikerjakan sendiri
   - Monitoring kondisi lahan
   - Perbaikan kecil manual

### 7.2 Contoh Card UI

```text
[Foto Traktor]
Traktor Roda Dua / Hand Tractor
Kategori: Persiapan Lahan
Jenis: Aset / Jasa
Fase: Pra-tanam
Harga acuan beli: Rp15 juta – Rp60 juta
Tarif jasa acuan: Rp900 ribu – Rp2 juta/ha
Opsi biaya:
- Jasa per hektar
- Sewa alat
- Milik sendiri
- Pinjam kelompok
Tombol: Tambahkan ke Rencana Operasional
```

### 7.3 Badge UI

| Badge | Makna |
|---|---|
| `Aset` | Alat tahan lama |
| `Jasa` | Bisa dibayar sebagai layanan |
| `Tenaga kerja` | Perlu input jumlah pekerja/HOK |
| `Input lokal` | Harga sangat tergantung daerah |
| `Pra-tanam` | Dipakai sebelum tanam |
| `Bisa Rp0` | Dikerjakan sendiri/gotong royong tanpa biaya tunai |

---

## 8. Rekomendasi Database

### 8.1 Tabel Master Item

```sql
CREATE TABLE IF NOT EXISTS saprodi_items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  kategori VARCHAR(100) NOT NULL,
  subkategori VARCHAR(100) NULL,
  nama_item VARCHAR(150) NOT NULL,
  nama_file_asset VARCHAR(255) NULL,
  tipe_item ENUM('barang_habis','aset','jasa','aktivitas','tenaga_kerja','infrastruktur') NOT NULL DEFAULT 'aktivitas',
  fase_penggunaan VARCHAR(100) NULL,
  relevan_padi TINYINT(1) DEFAULT 0,
  relevan_jagung TINYINT(1) DEFAULT 0,
  relevan_kedelai TINYINT(1) DEFAULT 0,
  satuan_harga VARCHAR(50) NULL,
  harga_min DECIMAL(14,2) NULL,
  harga_max DECIMAL(14,2) NULL,
  harga_status VARCHAR(50) NOT NULL DEFAULT 'PERLU_VERIFIKASI',
  sumber_harga TEXT NULL,
  tanggal_cek_harga DATE NULL,
  fungsi TEXT NULL,
  keunggulan TEXT NULL,
  keterbatasan TEXT NULL,
  catatan_penggunaan TEXT NULL,
  status ENUM('aktif','nonaktif') DEFAULT 'aktif',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

### 8.2 Tabel Biaya Operasional Persiapan Lahan

```sql
CREATE TABLE IF NOT EXISTS biaya_operasional_persiapan_lahan (
  id INT AUTO_INCREMENT PRIMARY KEY,
  musim_tanam_id INT NOT NULL,
  saprodi_item_id INT NOT NULL,
  mode_biaya ENUM(
    'beli_baru',
    'sewa_alat',
    'jasa_per_ha',
    'jasa_per_meter',
    'jasa_per_hari',
    'milik_sendiri',
    'pinjam_kelompok',
    'tenaga_kerja',
    'gotong_royong',
    'input_manual',
    'aktivitas_tanpa_biaya'
  ) NOT NULL,
  luas_ha DECIMAL(10,4) NULL,
  panjang_meter DECIMAL(10,2) NULL,
  tarif_per_ha DECIMAL(14,2) NULL,
  tarif_per_meter DECIMAL(14,2) NULL,
  tarif_per_hari DECIMAL(14,2) NULL,
  jumlah_hari DECIMAL(8,2) NULL,
  jumlah_orang INT NULL,
  upah_per_orang_per_hari DECIMAL(14,2) NULL,
  harga_beli DECIMAL(14,2) NULL,
  umur_pakai_musim INT NULL,
  biaya_penyusutan_musim DECIMAL(14,2) NULL,
  biaya_bbm DECIMAL(14,2) NULL,
  biaya_operator DECIMAL(14,2) NULL,
  biaya_servis DECIMAL(14,2) NULL,
  biaya_konsumsi_gotong_royong DECIMAL(14,2) NULL,
  biaya_total DECIMAL(14,2) NOT NULL DEFAULT 0,
  tanggal_biaya DATE NULL,
  catatan TEXT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

### 8.3 Logika Hitung Biaya

```text
jasa_per_ha:
biaya_total = luas_ha × tarif_per_ha

jasa_per_meter:
biaya_total = panjang_meter × tarif_per_meter

tenaga_kerja:
biaya_total = jumlah_orang × jumlah_hari × upah_per_orang_per_hari

beli_baru penuh:
biaya_total = harga_beli

beli_baru disusutkan:
biaya_total = harga_beli / umur_pakai_musim

milik_sendiri:
biaya_total = biaya_bbm + biaya_operator + biaya_servis + biaya_penyusutan_musim

gotong_royong:
biaya_total = biaya_konsumsi_gotong_royong

aktivitas_tanpa_biaya:
biaya_total = 0

input_manual:
biaya_total = input user
```

---

## 9. Contoh SQL Seed

```sql
INSERT INTO saprodi_items
(kategori, subkategori, nama_item, nama_file_asset, tipe_item, fase_penggunaan, relevan_padi, relevan_jagung, relevan_kedelai, satuan_harga, harga_min, harga_max, harga_status, sumber_harga, tanggal_cek_harga, fungsi, keunggulan, keterbatasan, catatan_penggunaan)
VALUES
('Persiapan Lahan','Alat Olah Tanah','Traktor Roda Dua / Hand Tractor','persiapan-traktor-roda-dua.jpg','aset','Pra-tanam',1,1,1,'unit / ha jasa',15072000,60528000,'TERVERIFIKASI_CAMPURAN','Quick, Blibli, Indotrading, Inaproc, Antara Foto, IPB','2026-06-16','Mengolah tanah sebelum tanam.','Cepat dan efisien dibanding manual.','Modal beli tinggi, butuh operator dan perawatan.','Default biaya petani lebih cocok jasa per ha.'),

('Persiapan Lahan','Attachment Olah Tanah','Bajak Singkal','persiapan-bajak-singkal.jpg','aset','Pra-tanam',1,1,1,'unit / paket jasa',28194000,28194000,'TERVERIFIKASI_PRODUK_SPESIFIK','Inaproc Yanmar traktor tangan tipe singkal','2026-06-16','Membalik tanah dan membuka lapisan tanah.','Cocok untuk pembajakan awal.','Biasanya melekat pada traktor/jasa bajak.','Harga attachment spesifik perlu verifikasi lokal.'),

('Persiapan Lahan','Attachment Olah Tanah','Rotavator / Bajak Rotary','persiapan-rotavator.jpg','aset','Pra-tanam',1,1,1,'unit / paket jasa',1215000,47928000,'TERVERIFIKASI_MARKETPLACE','Quick, Lazada, Shopee','2026-06-16','Menggemburkan dan meratakan tanah.','Hasil tanah lebih halus.','Biaya tergantung alat, operator, dan kondisi tanah.','Cocok setelah bajak awal.'),

('Persiapan Lahan','Alat Manual','Garu Tanah','persiapan-garu-tanah.jpg','aset','Pra-tanam',1,1,1,'unit',9700,63999,'TERVERIFIKASI_MARKETPLACE_TERBATAS','Shopee, Lazada','2026-06-16','Meratakan tanah setelah pengolahan awal.','Murah dan mudah dipakai di lahan kecil.','Banyak produk marketplace hanya alat taman kecil.','Pisahkan garu manual dan attachment jika katalog diperluas.'),

('Persiapan Lahan','Alat Manual','Cangkul / Pacul','persiapan-cangkul.jpg','aset','Pra-tanam / perawatan lahan',1,1,1,'unit',21999,163000,'TERVERIFIKASI_MARKETPLACE','Blibli, Shopee, Lazada, BigGo','2026-06-16','Mengolah tanah manual dan perbaikan kecil.','Murah, fleksibel, hampir selalu relevan.','Lambat untuk lahan luas.','Bisa biaya alat atau tenaga kerja manual.'),

('Persiapan Lahan','Tenaga Kerja','Pembersihan Lahan','persiapan-pembersihan-lahan.jpg','aktivitas','Pra-tanam',1,1,1,'input manual',NULL,NULL,'INPUT_MANUAL_LOKAL','BPS, Cross-Border, Kementan, UNIKS','2026-06-16','Membersihkan sisa tanaman/gulma/material sebelum tanam.','Fase awal nyata dan sering berbiaya tenaga kerja.','Tidak ada harga nasional stabil.','Hitung dari upah harian × jumlah pekerja × hari.'),

('Persiapan Lahan','Bedengan','Pembuatan Bedengan','persiapan-bedengan.jpg','jasa','Pra-tanam',0,1,1,'meter / HOK / ha',50000,3000000,'TERVERIFIKASI_SEBAGIAN','SipLah Blibli, DKPPP Temanggung, UNIKS, Jurnal PNL','2026-06-16','Membentuk guludan/bedengan untuk drainase dan jalur tanam.','Sangat relevan untuk jagung/kedelai dan lahan kering.','Tarif sangat lokal; satuan bervariasi.','Biarkan user memilih meter, HOK, ha, atau input manual.'),

('Persiapan Lahan','Pematang Sawah','Perbaikan Pematang Sawah','persiapan-pematang-sawah.jpg','aktivitas','Pra-tanam / selama musim',1,0,0,'input manual',NULL,NULL,'INPUT_MANUAL_LOKAL','BBWS, studi kebutuhan air tanaman, Cross-Border','2026-06-16','Menahan air dan membatasi petakan sawah.','Sangat penting untuk padi sawah.','Biaya tergantung panjang dan tingkat kerusakan.','Catat sebagai tenaga kerja/gotong royong/input manual.');
```

---

## 10. Rekomendasi Prioritas MVP AgroTrack

Prioritas masuk MVP:

1. Traktor Roda Dua / Hand Tractor
2. Pembersihan Lahan
3. Cangkul
4. Pembuatan Bedengan
5. Perbaikan Pematang Sawah
6. Rotavator

Prioritas tambahan:

7. Bajak Singkal
8. Garu Tanah

Alasan:
- Enam item pertama sudah cukup mewakili biaya nyata petani.
- Bajak dan rotavator sering melekat pada jasa olah tanah/traktor, sehingga bisa digabung dulu jika waktu sempit.
- Garu tanah berguna, tetapi dampak biaya biasanya kecil dibanding jasa olah tanah/tenaga kerja.

---

## 11. Copy UI Singkat per Item

| Item | Copy pendek untuk card |
|---|---|
| Traktor Roda Dua | Alat/jasa olah tanah untuk mempercepat pembajakan sebelum tanam. |
| Bajak Singkal | Attachment untuk membalik tanah pada pembajakan awal. |
| Rotavator | Alat rotary untuk menggemburkan dan meratakan tanah. |
| Garu Tanah | Alat perata tanah setelah pengolahan awal. |
| Cangkul | Alat manual untuk olah tanah dan perbaikan kecil. |
| Pembersihan Lahan | Aktivitas membersihkan gulma dan sisa tanaman sebelum tanam. |
| Pembuatan Bedengan | Membentuk guludan untuk drainase dan jalur tanam. |
| Perbaikan Pematang | Memperbaiki batas petakan sawah agar air tidak bocor. |

---

## 12. Referensi Utama

1. BPS — Nilai Produksi dan Biaya Produksi per Musim Tanam per Hektar Budidaya Padi, Jagung, dan Kedelai, 2017.  
   https://www.bps.go.id/id/statistics-table/1/MjA1NSMx/nilai-produksi-dan-biaya-produksi-per-musim-tanam-per-hektar-budidaya-tanaman-padi-sawah--padi-ladang--jagung--dan-kedelai--2017.html

2. Cross-Border Journal — Perhitungan biaya produksi usahatani padi.  
   https://journal.iaisambas.ac.id/index.php/Cross-Border/article/download/2098/1577

3. UNIKS — Pendampingan pembuatan bedengan dan pengolahan lahan.  
   https://ejournal.uniks.ac.id/index.php/bhakti_nagori/article/download/4376/3255

4. Quick — Unit Traktor Roda 2.  
   https://tokoquick.id/category/unit/unit-traktor-roda-2-quick

5. Blibli — Traktor Sawah Quick.  
   https://www.blibli.com/jual/traktor-sawah-quik

6. Blibli — Mesin Hand Tractor.  
   https://www.blibli.com/jual/mesin-hand-tractor

7. Indotrading — Traktor Roda Dua.  
   https://www.indotrading.com/jual-traktor-sawah

8. Inaproc — Yanmar Traktor Tangan Roda 2 Tipe Singkal.  
   https://katalog.inaproc.id/solusi-klik/yanmar-traktor-tangan-roda-2-roda-dua-tipe-singkal-model-ymsx

9. Antara Foto — Kenaikan tarif jasa bajak sawah.  
   https://www.antarafoto.com/id/view/1132310/kenaikan-tarif-jasa-bajak-sawah

10. IPB Repository — Analisis biaya mekanisasi pertanian lahan kering.  
    https://repository.ipb.ac.id/handle/123456789/15797

11. JGSA — Analisis kelayakan usaha jasa traktor roda empat.  
    https://ojs.um-palembang.ac.id/index.php/JGSA/article/download/329/138/2601

12. Lazada — Traktor rotary.  
    https://www.lazada.co.id/tag/traktor-rotary/

13. Shopee — Mesin Traktor Sawah.  
    https://shopee.co.id/list/Mesin%20Traktor/Sawah

14. Kementan — Alsintan tekan biaya olah tanah cabai hingga 90%.  
    https://www.pertanian.go.id/?act=view&id=3320&show=news

15. Shopee — Garu tanah.  
    https://shopee.co.id/search?keyword=garu%20tanah

16. Lazada — Garu pertanian.  
    https://www.lazada.co.id/tag/garu-pertanian/

17. Blibli — Cangkul pertanian.  
    https://www.blibli.com/jual/cangkul-pertanian

18. Shopee — Cangkul petani.  
    https://shopee.co.id/search?keyword=cangkul%20petani

19. Lazada — Cangkul pertanian.  
    https://www.lazada.co.id/tag/cangkul-pertanian/

20. BigGo — Cangkul sawah murah.  
    https://biggo.id/s/cangkul%2Bsawah%2Bmurah/

21. SipLah Blibli — Jasa pembuatan bedengan.  
    https://siplah.blibli.com/product/jasa-pembuatan-bedengan/STBS-0075-00069

22. DKPPP Temanggung — Analisa ekonomi usahatani hortikultura.  
    https://dkppp.temanggungkab.go.id/assets/dok_file/92_23-analisa-ekonomi-usaha-tani-hortikultura.pdf

23. PNL — Rancang bangun alat pembuat alur bedengan.  
    https://e-jurnal.pnl.ac.id/mesinsainsterapan/article/download/637/1326

24. BBWS Mesuji Sekampung — Mengenal jaringan irigasi.  
    https://sda.pu.go.id/balai/bbwsmesujisekampung/pages/posts/mengenal-jaringan-irigasi-menuju-swasembada-pangan-1761553763

25. Studi kebutuhan air padi, jagung, kedelai.  
    https://jurnal.unmuhjember.ac.id/index.php/PENELITIAN_IPTEKS/article/view/5110
