# AGROTRACK - Katalog Benih/Bibit Padi, Jagung, dan Kedelai

Dokumen ini adalah revisi berbasis sumber internet untuk katalog benih/bibit AgroTrack. Prinsip yang dipakai: **tidak ada harga, umur panen, potensi hasil, atau klaim keunggulan yang diisi tanpa sumber**. Jika sumber harga spesifik varietas tidak ditemukan secara cukup jelas, kolom harga diberi status **BELUM TERVERIFIKASI** dan tidak boleh dipakai sebagai nilai seed final.

Tanggal kompilasi: 16 Juni 2026.

## 1. Aturan penggunaan data di aplikasi

1. Harga benih di dokumen ini adalah **referensi katalog**, bukan harga final toko. Harga marketplace berubah karena stok, wilayah, ongkir, diskon, dan kelas benih.
2. Untuk database, sebaiknya simpan `harga_min`, `harga_max`, `satuan_harga`, `sumber_harga`, dan `tanggal_cek_harga`, bukan satu angka tetap.
3. Jika harga varietas-spesifik belum ditemukan, jangan mengisi angka karangan. Tampilkan di UI sebagai `Harga belum diverifikasi` atau minta admin mengisi manual.
4. Umur panen, potensi hasil, ketahanan hama/penyakit, dan deskripsi varietas harus ditampilkan sebagai informasi referensi, bukan janji hasil panen.
5. Potensi hasil sangat dipengaruhi lahan, musim, kualitas benih, pemupukan, pengairan, jarak tanam, dan pengendalian OPT.

## 2. File asset yang digunakan

Direktori rekomendasi:

```text
assets/img/saprodi/benih/
```

Daftar file dari folder user:

| No | File | Komoditas | Varietas / Nama katalog |
|---:|---|---|---|
| 1 | `padi-ciherang.jpg` | Padi | Benih Padi Ciherang |
| 2 | `padi-mekongga.jpg` | Padi | Benih Padi Mekongga |
| 3 | `padi-inpari-32.jpg` | Padi | Benih Padi Inpari 32 HDB |
| 4 | `padi-inpari-30.jpg` | Padi | Benih Padi Inpari 30 Ciherang Sub 1 |
| 5 | `padi-ir64.jpg` | Padi | Benih Padi IR64 |
| 6 | `padi-situ-bagendit.png` | Padi | Benih Padi Situ Bagendit |
| 7 | `jagung-nasa-29.jpg` | Jagung | Benih Jagung Hibrida NASA 29 |
| 8 | `jagung-bima-19.jpg` | Jagung | Benih Jagung Hibrida Bima 19 URI |
| 9 | `jagung-jh-21.jpg` | Jagung | Benih Jagung HJ 21 Agritan / JH-21 sesuai nama asset |
| 10 | `jagung-jh-45.jpg` | Jagung | Benih Jagung Hibrida JH 45 |
| 11 | `jagung-bima-uri.jpg` | Jagung | Benih Jagung Bima URI / Bima 20 URI jika asset mewakili Bima URI umum |
| 12 | `jagung-sukamarga.jpg` | Jagung | Benih Jagung Sukmaraga *(catatan: ejaan varietas yang umum adalah Sukmaraga, bukan Sukamarga)* |
| 13 | `kedelai-anjasmoro.jpg` | Kedelai | Benih Kedelai Anjasmoro |
| 14 | `kedelai-wilis.jpg` | Kedelai | Benih Kedelai Wilis |
| 15 | `kedelai-grobogan.jpg` | Kedelai | Benih Kedelai Grobogan |
| 16 | `kedelai-dega-1.jpg` | Kedelai | Benih Kedelai Dega 1 |
| 17 | `kedelai-detap-1.jpg` | Kedelai | Benih Kedelai Detap 1 |

Catatan koreksi asset:
- `jagung-sukamarga.jpg` sebaiknya diganti nama menjadi `jagung-sukmaraga.jpg` agar sesuai nama varietas yang lebih umum ditemukan di sumber.
- `jagung-jh-21.jpg` perlu dicek lagi apakah maksudnya **HJ 21 Agritan**. Sumber resmi/teknis lebih sering menulis `HJ 21 Agritan`, bukan `JH 21`.
- `jagung-bima-uri.jpg` terlalu umum. Jika isi gambar menunjukkan Bima 20 URI, gunakan nama file `jagung-bima-20-uri.jpg`. Jika Bima 19, gabungkan dengan `jagung-bima-19.jpg`.

---

# 3. Ringkasan harga berbasis sumber

## 3.1 Padi

| File | Item | Kemasan sumber | Harga sumber | Harga per kg hitungan | Status harga | Sumber harga |
|---|---|---:|---:|---:|---|---|
| `padi-ciherang.jpg` | Ciherang | 5 kg | Rp108.000 - Rp119.200 | Rp21.600 - Rp23.840/kg | Terverifikasi marketplace | Shopee list Padi Ciherang; Lazada tag Ciherang 5kg juga menampilkan Rp85.000 sebagai salah satu listing |
| `padi-mekongga.jpg` | Mekongga | 5 kg | Rp85.000 - Rp119.000 | Rp17.000 - Rp23.800/kg | Terverifikasi marketplace | Lazada Mekongga 5kg; Shopee Mekongga 5kg; Purotani Mekongga Kingkong 5kg |
| `padi-inpari-32.jpg` | Inpari 32 HDB | 5 kg | Rp85.000 - Rp140.000 | Rp17.000 - Rp28.000/kg | Terverifikasi marketplace | Purotani Inpari 32; Shopee list Inpari 32 |
| `padi-inpari-30.jpg` | Inpari 30 | 5 kg | Rp99.000 - Rp170.000 | Rp19.800 - Rp34.000/kg | Terverifikasi marketplace | Shopee Inpari 30 5kg; Lazada Inpari 30 5kg |
| `padi-ir64.jpg` | IR64 | 5 kg | Rp90.000 - Rp125.000 | Rp18.000 - Rp25.000/kg | Terverifikasi marketplace | Purotani IR64 5kg; Shopee IR64 5kg |
| `padi-situ-bagendit.png` | Situ Bagendit | 5 kg | Rp95.000 - Rp113.525 | Rp19.000 - Rp22.705/kg | Terverifikasi marketplace | Lazada Situ Bagendit 5kg; Shopee Situ Bagendit 5kg |

## 3.2 Jagung

| File | Item | Kemasan sumber | Harga sumber | Harga per kg hitungan | Status harga | Sumber harga |
|---|---|---:|---:|---:|---|---|
| `jagung-nasa-29.jpg` | NASA 29 | 5 kg / per kg kajian | Rp100.000 - Rp175.000 per 5 kg; kajian menyebut Rp32.250/kg | Rp20.000 - Rp35.000/kg dari marketplace; Rp32.250/kg dari kajian | Terverifikasi, tetapi rentang sumber berbeda | Shopee NASA 29 5kg; BigGo NASA 29; kajian VUB jagung hibrida |
| `jagung-bima-19.jpg` | Bima 19 URI | Per kg kajian | Rp31.250/kg | Rp31.250/kg | Terverifikasi dari kajian, bukan marketplace terbaru | Kajian paket teknologi VUB jagung hibrida menyebut Bima 19 URI Rp31.250/kg |
| `jagung-jh-21.jpg` | HJ 21 Agritan | Per kg | Rp35.150/kg - Rp70.000/kg | Rp35.150 - Rp70.000/kg | Terverifikasi, tetapi nama asset perlu dikoreksi ke HJ 21 | Dokumen harga HJ 21; Sikumis HJ21 |
| `jagung-jh-45.jpg` | JH 45 | - | BELUM TERVERIFIKASI | - | Harga varietas-spesifik belum ditemukan; jangan isi angka | Sumber spesifikasi JH 45 ada, tetapi sumber harga retail spesifik JH 45 belum cukup jelas |
| `jagung-bima-uri.jpg` | Bima URI umum / Bima 20 URI jika sesuai gambar | 5 kg | Rp175.000 untuk Bima 20 URI 5kg | Rp35.000/kg | Terverifikasi hanya untuk Bima 20 URI, bukan semua Bima URI | Ralali Bima 20 URI 5kg |
| `jagung-sukamarga.jpg` | Sukmaraga | 1 unit/listing tidak jelas kemasan | Rp43.000 pada listing Sukmaraga; kemasan tidak jelas | Tidak dihitung karena kemasan tidak jelas | Terverifikasi nama listing, tetapi satuan belum aman | Shopee Sukmaraga listing; spesifikasi dari DPKP DIY / studi |

Catatan: Untuk jagung, harga hibrida komersial bisa jauh berbeda antar merek. Karena itu, untuk database lebih aman simpan harga sebagai range atau admin-editable.

## 3.3 Kedelai

| File | Item | Kemasan sumber | Harga sumber | Harga per kg hitungan | Status harga | Sumber harga |
|---|---|---:|---:|---:|---|---|
| `kedelai-anjasmoro.jpg` | Anjasmoro | 1 kg / 5 kg | Rp30.000/kg; Rp100.000/5kg; listing lain Rp21.850 - Rp38.000 untuk 500g/1kg | Rp20.000 - Rp38.000/kg tergantung listing | Terverifikasi marketplace/katalog | Inaproc Anjasmoro; Lazada Anjasmoro 5kg; Shopee Anjasmoro |
| `kedelai-wilis.jpg` | Wilis | Listing umum | Rp45.000/kg; Blibli Wilis Rp51.364 | Rp45.000 - Rp51.364/kg | Terverifikasi marketplace, tetapi perlu cek stok | Lazada Wilis; Blibli Wilis |
| `kedelai-grobogan.jpg` | Grobogan | 1 kg / 500 g | Rp28.995 - Rp50.880/kg; listing lain Rp33.000/kg | Rp28.995 - Rp50.880/kg | Terverifikasi marketplace | Lazada Grobogan; Shopee Grobogan; BigGo Grobogan |
| `kedelai-dega-1.jpg` | Dega 1 | - | BELUM TERVERIFIKASI | - | Harga retail spesifik Dega 1 belum ditemukan jelas; jangan isi angka | Sumber spesifikasi tersedia dari Tjap Bukit Mas / DPKP DIY, bukan harga |
| `kedelai-detap-1.jpg` | Detap 1 | - | BELUM TERVERIFIKASI | - | Harga retail spesifik Detap 1 belum ditemukan jelas; jangan isi angka | Sumber spesifikasi tersedia, sumber harga belum cukup jelas |

---

# 4. Data detail katalog per item

## 4.1 PADI

### 4.1.1 Benih Padi Ciherang

| Field | Isi |
|---|---|
| File gambar | `padi-ciherang.jpg` |
| Path rekomendasi | `assets/img/saprodi/benih/padi-ciherang.jpg` |
| Komoditas | Padi |
| Varietas | Ciherang |
| Kategori | Benih & Bibit |
| Fase penggunaan | Pra-tanam / Tanam |
| Satuan UI | kg; kemasan 5 kg |
| Harga referensi | Rp108.000 - Rp119.200 per 5 kg dari Shopee list; Lazada juga menampilkan listing Ciherang 5 kg sekitar Rp85.000 pada hasil pencarian |
| Kebutuhan benih | Referensi umum padi: 25-40 kg/ha di tingkat petani; ada juga anjuran sekitar 25 kg/ha pada beberapa sumber perbenihan |
| Fungsi | Benih utama untuk budidaya padi sawah |
| Keunggulan terverifikasi | Ciherang dikenal sebagai varietas padi sawah populer; sumber Scribd deskripsi Ciherang mencatat potensi hasil 8,5 t/ha dan ketahanan terhadap WBC biotipe 2 dan 3 serta HDB strain III/IV. Karena sumber ini bukan sumber resmi primer, tampilkan sebagai referensi terbatas. |
| Catatan risiko | Jangan klaim tahan semua hama. Ketahanan varietas dapat berbeda menurut biotipe/strain dan kondisi lapangan. |
| Deskripsi card UI | Varietas padi sawah populer untuk katalog benih padi. Harga mengikuti sumber marketplace dan perlu diperbarui oleh admin. |

### 4.1.2 Benih Padi Mekongga

| Field | Isi |
|---|---|
| File gambar | `padi-mekongga.jpg` |
| Path rekomendasi | `assets/img/saprodi/benih/padi-mekongga.jpg` |
| Komoditas | Padi |
| Varietas | Mekongga |
| Kategori | Benih & Bibit |
| Fase penggunaan | Pra-tanam / Tanam |
| Satuan UI | kg; kemasan 5 kg |
| Harga referensi | Rp85.000 - Rp119.000 per 5 kg dari Lazada, Shopee, dan Purotani |
| Kebutuhan benih | Referensi umum padi: 25-40 kg/ha; beberapa sumber memakai asumsi 25 kg/ha |
| Umur tanaman | 116-125 hari berdasarkan Benih Citra Asia |
| Rata-rata hasil | 6 ton/ha GKG berdasarkan Benih Citra Asia |
| Potensi hasil | 8 ton/ha GKG berdasarkan Benih Citra Asia |
| Spesifikasi lain | Tinggi ±106 cm, kadar amilosa 23%, berat 1000 butir 27-28 g berdasarkan Benih Citra Asia |
| Keunggulan terverifikasi | Tahan wereng batang coklat biotipe 2; tahan hawar daun bakteri patotipe IV dan VIII menurut Benih Citra Asia |
| Deskripsi card UI | Varietas padi inbrida dengan umur 116-125 hari dan potensi hasil 8 ton/ha GKG. Cocok sebagai salah satu opsi benih utama padi. |

### 4.1.3 Benih Padi Inpari 32 HDB

| Field | Isi |
|---|---|
| File gambar | `padi-inpari-32.jpg` |
| Path rekomendasi | `assets/img/saprodi/benih/padi-inpari-32.jpg` |
| Komoditas | Padi |
| Varietas | Inpari 32 HDB |
| Kategori | Benih & Bibit |
| Fase penggunaan | Pra-tanam / Tanam |
| Satuan UI | kg; kemasan 5 kg |
| Harga referensi | Rp85.000 dari Purotani; Shopee list menampilkan kisaran sekitar Rp92.067 - Rp140.000 per 5 kg |
| Kebutuhan benih | Referensi umum padi: 25-40 kg/ha; beberapa sumber memakai asumsi 25 kg/ha |
| Umur tanaman | 120 hari berdasarkan Benih Citra Asia |
| Tinggi tanaman | 97 cm berdasarkan Benih Citra Asia |
| Rata-rata hasil | 6,30 ton/ha GKG berdasarkan Benih Citra Asia |
| Potensi hasil | 8,42 ton/ha GKG berdasarkan Benih Citra Asia |
| Spesifikasi lain | Kadar amilosa ±23,46%; berat 1000 butir 27 g |
| Keunggulan terverifikasi | Tahan WBC biotipe 1, 2, dan 3; tahan HDB patotipe III, IV, VIII menurut Benih Citra Asia |
| Deskripsi card UI | Benih padi inbrida turunan Ciherang dengan umur 120 hari dan potensi hasil 8,42 ton/ha GKG. |

### 4.1.4 Benih Padi Inpari 30 Ciherang Sub 1

| Field | Isi |
|---|---|
| File gambar | `padi-inpari-30.jpg` |
| Path rekomendasi | `assets/img/saprodi/benih/padi-inpari-30.jpg` |
| Komoditas | Padi |
| Varietas | Inpari 30 Ciherang Sub 1 |
| Kategori | Benih & Bibit |
| Fase penggunaan | Pra-tanam / Tanam |
| Satuan UI | kg; kemasan 5 kg |
| Harga referensi | Shopee menampilkan Rp111.520/Rp115.600, Rp114.000, Rp118.360, Rp125.600, Rp132.000, Rp154.000, sampai Rp170.000 per 5 kg; Lazada menampilkan Rp99.000 - Rp165.000 per 5 kg |
| Kebutuhan benih | Referensi umum padi: 25-40 kg/ha; beberapa sumber memakai asumsi 25 kg/ha |
| Umur tanaman | 111 hari setelah semai menurut Pilar Pertanian / MMC Kotawaringin Barat |
| Potensi hasil | 9 - 9,6 ton/ha menurut sumber berita pertanian terkait Inpari 30 |
| Keunggulan terverifikasi | Disebut cocok untuk sawah irigasi dataran rendah dan area rawan rendaman/banjir; klaim tahan rendaman vegetatif 15 hari muncul di Pilar Pertanian |
| Catatan risiko | Klaim tahan rendaman bukan berarti aman untuk semua jenis banjir. Tetap tergantung durasi, kedalaman, fase tanaman, dan kualitas lahan. |
| Deskripsi card UI | Varietas padi sawah berumur relatif genjah, populer sebagai opsi padi irigasi/rawan rendaman. Harga sangat bervariasi antar marketplace. |

### 4.1.5 Benih Padi IR64

| Field | Isi |
|---|---|
| File gambar | `padi-ir64.jpg` |
| Path rekomendasi | `assets/img/saprodi/benih/padi-ir64.jpg` |
| Komoditas | Padi |
| Varietas | IR64 |
| Kategori | Benih & Bibit |
| Fase penggunaan | Pra-tanam / Tanam |
| Satuan UI | kg; kemasan 5 kg |
| Harga referensi | Rp90.000 per 5 kg dari Purotani; Shopee list menampilkan sekitar Rp95.000 - Rp125.000 per 5 kg |
| Kebutuhan benih | Referensi umum padi: 25-40 kg/ha; beberapa sumber memakai asumsi 25 kg/ha |
| Umur tanaman | 110-125 hari menurut PIAT UGM |
| Potensi hasil | 7-8 ton/ha menurut PIAT UGM |
| Tinggi tanaman | Maksimal 85 cm menurut PIAT UGM |
| Keunggulan terverifikasi | PIAT UGM menyebut IR64 tahan terhadap wereng coklat biotipe 1 dan 2 serta hemat air; tampilkan dengan catatan lokasi dan kondisi lapangan memengaruhi hasil. |
| Deskripsi card UI | Varietas padi lama/populer sebagai opsi pembanding dalam katalog. |

### 4.1.6 Benih Padi Situ Bagendit

| Field | Isi |
|---|---|
| File gambar | `padi-situ-bagendit.png` |
| Path rekomendasi | `assets/img/saprodi/benih/padi-situ-bagendit.png` |
| Komoditas | Padi |
| Varietas | Situ Bagendit |
| Kategori | Benih & Bibit |
| Fase penggunaan | Pra-tanam / Tanam |
| Satuan UI | kg; kemasan 5 kg |
| Harga referensi | Lazada menampilkan Rp95.000 dan Rp113.525 per 5 kg; Shopee menampilkan Rp95.000 per 5 kg |
| Kebutuhan benih | Referensi umum padi: 25-40 kg/ha; beberapa sumber memakai asumsi 25 kg/ha |
| Umur tanaman | 110-120 hari menurut Tani Makmur Nusantara / deskripsi varietas |
| Tinggi tanaman | 99-105 cm menurut Tani Makmur Nusantara |
| Rata-rata hasil | 3-5 ton/ha GKG menurut Tani Makmur Nusantara; studi UNS menunjukkan produktivitas lapangan 73,21 kuintal/ha/MT pada lokasi studi tertentu |
| Keunggulan terverifikasi | Disebut dapat dipakai pada padi gogo/sawah dalam beberapa sumber; tekstur nasi pulen dalam deskripsi varietas. |
| Catatan risiko | Karena hasil sumber berbeda antara deskripsi varietas dan studi lokasi, UI sebaiknya menulis `potensi hasil bergantung lokasi`. |
| Deskripsi card UI | Varietas padi yang bisa diposisikan sebagai opsi padi sawah/lahan kering sesuai ketersediaan benih dan lokasi. |

---

## 4.2 JAGUNG

### 4.2.1 Benih Jagung Hibrida NASA 29

| Field | Isi |
|---|---|
| File gambar | `jagung-nasa-29.jpg` |
| Path rekomendasi | `assets/img/saprodi/benih/jagung-nasa-29.jpg` |
| Komoditas | Jagung |
| Varietas | NASA 29 |
| Kategori | Benih & Bibit |
| Fase penggunaan | Pra-tanam / Tanam |
| Satuan UI | kg; kemasan 5 kg jika mengikuti listing |
| Harga referensi | Shopee menampilkan Rp175.000 per 5 kg; BigGo menampilkan Rp100.000 dan Rp175.000; kajian VUB jagung hibrida menyebut NASA 29 Rp32.250/kg |
| Kebutuhan benih | Jagung hibrida bisa sekitar 13,75 kg/ha pada contoh hitungan jarak tanam 80 x 40 cm; sumber lain menyebut penggunaan 15-20 kg/ha |
| Potensi hasil | Sumber penelitian menyebut NASA 29 sekitar 13,7 t/ha; sumber repository jagung menyebut potensi hasil 13,7 ton/ha pada KA 15% dan rata-rata hasil 11,9 ton/ha untuk data varietas terkait NASA 29 |
| Keunggulan terverifikasi | Hibrida dengan potensi hasil tinggi; digunakan dalam kajian paket teknologi jagung hibrida. |
| Deskripsi card UI | Benih jagung hibrida berpotensi hasil tinggi. Cocok untuk katalog jagung modern, dengan harga cukup bervariasi. |

### 4.2.2 Benih Jagung Hibrida Bima 19 URI

| Field | Isi |
|---|---|
| File gambar | `jagung-bima-19.jpg` |
| Path rekomendasi | `assets/img/saprodi/benih/jagung-bima-19.jpg` |
| Komoditas | Jagung |
| Varietas | Bima 19 URI |
| Kategori | Benih & Bibit |
| Fase penggunaan | Pra-tanam / Tanam |
| Satuan UI | kg |
| Harga referensi | Kajian paket teknologi VUB jagung hibrida menyebut harga benih Bima 19 URI Rp31.250/kg. Ini adalah harga studi, bukan marketplace terkini. |
| Kebutuhan benih | 15-20 kg/ha sering dipakai dalam kajian usahatani jagung hibrida; contoh hitungan teknis memberi 13,75 kg/ha termasuk sulaman 10% |
| Umur panen | 102 HST menurut sumber varietas jagung hibrida/Scribd dan ringkasan agribisnis budidaya jagung |
| Potensi hasil | 12,5 ton/ha pipilan kering menurut dokumen Bima 19 URI dan Antara |
| Rata-rata hasil | ±9,3 ton/ha pada KA 15% menurut dokumen Bima 19 URI |
| Keunggulan terverifikasi | Tahan penyakit bulai, toleran karat dan bercak daun, tahan rebah akar/batang menurut Antara dan sumber varietas. |
| Deskripsi card UI | Jagung hibrida Bima 19 URI dengan potensi hasil tinggi dan ketahanan penyakit yang baik menurut sumber pertanian. |

### 4.2.3 Benih Jagung HJ 21 Agritan

| Field | Isi |
|---|---|
| File gambar | `jagung-jh-21.jpg` |
| Path rekomendasi | `assets/img/saprodi/benih/jagung-jh-21.jpg` |
| Catatan nama | Sumber lebih sering memakai nama `HJ 21 Agritan`; asset user menulis `jh-21`. Disarankan label UI: `Benih Jagung HJ 21 Agritan`. |
| Komoditas | Jagung |
| Varietas | HJ 21 Agritan |
| Kategori | Benih & Bibit |
| Fase penggunaan | Pra-tanam / Tanam |
| Satuan UI | kg |
| Harga referensi | Dokumen harga HJ 21 menyebut Rp35.150/kg; Sikumis menampilkan HJ21 Rp70.000/kg. Karena sumber berbeda jauh, simpan range, bukan satu angka. |
| Kebutuhan benih | Jagung hibrida sekitar 13,75-20 kg/ha tergantung jarak tanam dan jumlah benih per lubang |
| Umur tanaman | ±82 hari setelah tanam menurut Technology Indonesia |
| Potensi hasil | 12,2 ton/ha menurut Technology Indonesia |
| Rata-rata hasil | ±11,4 ton/ha menurut Technology Indonesia |
| Keunggulan terverifikasi | Tahan bulai, hawar daun, dan karat daun; stay green; adaptif di 5-650 m dpl menurut Technology Indonesia. |
| Deskripsi card UI | Varietas jagung hibrida genjah dengan potensi hasil tinggi. Nama asset perlu diperbaiki agar tidak rancu. |

### 4.2.4 Benih Jagung Hibrida JH 45

| Field | Isi |
|---|---|
| File gambar | `jagung-jh-45.jpg` |
| Path rekomendasi | `assets/img/saprodi/benih/jagung-jh-45.jpg` |
| Komoditas | Jagung |
| Varietas | JH 45 |
| Kategori | Benih & Bibit |
| Fase penggunaan | Pra-tanam / Tanam |
| Satuan UI | kg |
| Harga referensi | BELUM TERVERIFIKASI. Sumber harga retail spesifik `JH 45` belum ditemukan secara jelas. Jangan isi angka default tanpa admin. |
| Kebutuhan benih | Jagung hibrida sekitar 13,75-20 kg/ha tergantung jarak tanam dan jumlah benih per lubang |
| Tinggi tanaman | 227 cm menurut dokumen BRIDA Buleleng JH 45 |
| Bobot 1000 biji | 311 g menurut dokumen BRIDA Buleleng JH 45 |
| Rata-rata produktivitas | 11,6 ton/ha menurut dokumen BRIDA Buleleng JH 45 |
| Potensi hasil | Sumber Neurafarm menyebut potensi hasil 12,6 t/ha; repository jagung juga menampilkan potensi hasil sekitar 12,6 t/ha pada KA 15% untuk JH 45. |
| Keunggulan terverifikasi | Tahan rebah akar dan batang; adaptasi luas di dataran rendah; tahan/toleran terhadap beberapa penyakit utama menurut sumber varietas. |
| Deskripsi card UI | Varietas jagung hibrida dengan data performa kuat, tetapi harga retail harus diinput admin karena sumber harga spesifik belum jelas. |

### 4.2.5 Benih Jagung Bima URI / Bima 20 URI

| Field | Isi |
|---|---|
| File gambar | `jagung-bima-uri.jpg` |
| Path rekomendasi | `assets/img/saprodi/benih/jagung-bima-uri.jpg` |
| Catatan nama | Asset terlalu umum. Jika gambar adalah Bima 20 URI, ubah label ke `Benih Jagung Bima 20 URI`. Jika Bima 19, gabungkan dengan `jagung-bima-19.jpg`. |
| Komoditas | Jagung |
| Varietas | Bima URI umum / Bima 20 URI jika sesuai gambar |
| Kategori | Benih & Bibit |
| Fase penggunaan | Pra-tanam / Tanam |
| Satuan UI | kg; kemasan 5 kg jika memakai harga Ralali Bima 20 URI |
| Harga referensi | Ralali menampilkan Bima 20 URI 5 kg Rp175.000. Jangan gunakan harga ini untuk Bima URI lain tanpa cek label gambar. |
| Kebutuhan benih | Jagung hibrida sekitar 13,75-20 kg/ha tergantung jarak tanam dan jumlah benih per lubang |
| Keunggulan | Untuk Bima 19/20 URI, beberapa sumber menyebut daya adaptasi dan potensi hasil tinggi. Namun asset perlu dipastikan dulu. |
| Deskripsi card UI | Gunakan hanya setelah label pada gambar jelas. Untuk sekarang status item: perlu verifikasi varietas. |

### 4.2.6 Benih Jagung Sukmaraga

| Field | Isi |
|---|---|
| File gambar | `jagung-sukamarga.jpg` |
| Path rekomendasi | `assets/img/saprodi/benih/jagung-sukamarga.jpg` |
| Nama benar | Sukmaraga |
| Rekomendasi rename | `jagung-sukmaraga.jpg` |
| Komoditas | Jagung |
| Varietas | Sukmaraga |
| Kategori | Benih & Bibit |
| Fase penggunaan | Pra-tanam / Tanam |
| Satuan UI | kg jika tersedia; harga listing saat ini belum jelas kemasan |
| Harga referensi | Shopee menampilkan listing Sukmaraga Rp43.000, tetapi kemasan tidak cukup jelas dari hasil pencarian. Jangan hitung harga/kg sampai kemasan jelas. |
| Kebutuhan benih | Untuk jagung umum/hibrida/komposit, kebutuhan mengikuti jarak tanam; pakai input manual atau range 13,75-20 kg/ha jika sesuai sistem tanam. |
| Spesifikasi | DPKP DIY menyediakan halaman deskripsi varietas Sukmaraga. Studi Unpatti melaporkan varietas Sukmaraga menghasilkan berat pipilan kering tertinggi 12,02 t/ha dalam uji 10 varietas/galur pada lokasi studi. |
| Keunggulan terverifikasi | Sumber Instagram menyebut umur 105-110 hari dan potensi 8,5 t/ha, tetapi karena sumbernya media sosial, gunakan sebagai referensi pendukung, bukan data utama. |
| Deskripsi card UI | Varietas jagung yang perlu koreksi ejaan. Harga belum aman untuk seed otomatis. |

---

## 4.3 KEDELAI

### 4.3.1 Benih Kedelai Anjasmoro

| Field | Isi |
|---|---|
| File gambar | `kedelai-anjasmoro.jpg` |
| Path rekomendasi | `assets/img/saprodi/benih/kedelai-anjasmoro.jpg` |
| Komoditas | Kedelai |
| Varietas | Anjasmoro |
| Kategori | Benih & Bibit |
| Fase penggunaan | Pra-tanam / Tanam |
| Satuan UI | kg; 5 kg jika mengikuti listing grosir |
| Harga referensi | Inaproc menampilkan Rp30.000 per 1.000 g; Lazada menampilkan 5 kg Rp100.000 dan 1 kg Rp35.000; Shopee menampilkan range Rp21.850 - Rp38.000 untuk varian 500g/1kg |
| Kebutuhan benih | 40-50 kg/ha menurut sumber produksi benih kedelai; Disperta Jombang menyebut 40 kg/ha dengan daya tumbuh 90% |
| Umur panen | 82-92 HST menurut Tjap Bukit Mas |
| Bobot 100 biji | 14,8-15,3 g/100 biji menurut Tjap Bukit Mas |
| Potensi hasil | 2,03-2,25 ton/ha menurut Tjap Bukit Mas |
| Protein | 41,8% menurut Tjap Bukit Mas |
| Keunggulan terverifikasi | Toleran tanah jenuh air, tidak mudah rebah, polong tidak mudah pecah, cocok bahan baku tempe menurut Tjap Bukit Mas |
| Deskripsi card UI | Varietas kedelai populer untuk bahan baku tempe, dengan kebutuhan benih relatif besar per hektar. |

### 4.3.2 Benih Kedelai Wilis

| Field | Isi |
|---|---|
| File gambar | `kedelai-wilis.jpg` |
| Path rekomendasi | `assets/img/saprodi/benih/kedelai-wilis.jpg` |
| Komoditas | Kedelai |
| Varietas | Wilis |
| Kategori | Benih & Bibit |
| Fase penggunaan | Pra-tanam / Tanam |
| Satuan UI | kg |
| Harga referensi | Lazada menampilkan Wilis 1 kg Rp45.000; Blibli menampilkan bibit kedelai varietas Wilis Rp51.364 |
| Kebutuhan benih | 40-50 kg/ha; beberapa sumber memakai 40 kg/ha |
| Umur panen | 85-90 hari menurut artikel/jurnal pertanian yang membahas varietas Wilis |
| Produktivitas | 1,6 ton/ha menurut sumber jurnal pertanian |
| Keunggulan terverifikasi | Disebut tahan terhadap karat daun dan virus pada sumber jurnal/Scribd; gunakan dengan catatan sumber perlu diverifikasi lagi jika untuk klaim resmi. |
| Deskripsi card UI | Varietas kedelai lama yang dikenal petani; cocok sebagai opsi pembanding dalam katalog. |

### 4.3.3 Benih Kedelai Grobogan

| Field | Isi |
|---|---|
| File gambar | `kedelai-grobogan.jpg` |
| Path rekomendasi | `assets/img/saprodi/benih/kedelai-grobogan.jpg` |
| Komoditas | Kedelai |
| Varietas | Grobogan |
| Kategori | Benih & Bibit |
| Fase penggunaan | Pra-tanam / Tanam |
| Satuan UI | kg |
| Harga referensi | Lazada menampilkan 1 kg Rp28.995 - Rp30.000; Shopee menampilkan Grobogan Premium Rp50.880 - Rp95.400 untuk varian 1 kg/500 g; BigGo menampilkan beberapa listing 1 kg sekitar Rp32.760 - Rp47.000 |
| Kebutuhan benih | 40-50 kg/ha; beberapa sumber memakai 40 kg/ha |
| Spesifikasi | Sumber adopsi varietas menyebut Grobogan termasuk varietas dominan/diadopsi petani dan berbiji besar dalam preferensi pasar. |
| Keunggulan terverifikasi | Berbiji besar, umum dikaitkan dengan kebutuhan pasar tahu/tempe; detail resmi perlu dilengkapi jika ada sumber varietas primer. |
| Deskripsi card UI | Kedelai berbiji besar dengan harga online bervariasi. Cocok sebagai item katalog kedelai utama. |

### 4.3.4 Benih Kedelai Dega 1

| Field | Isi |
|---|---|
| File gambar | `kedelai-dega-1.jpg` |
| Path rekomendasi | `assets/img/saprodi/benih/kedelai-dega-1.jpg` |
| Komoditas | Kedelai |
| Varietas | Dega 1 |
| Kategori | Benih & Bibit |
| Fase penggunaan | Pra-tanam / Tanam |
| Satuan UI | kg |
| Harga referensi | BELUM TERVERIFIKASI. Hasil pencarian belum menemukan harga retail spesifik Dega 1 yang cukup jelas. Jangan isi angka default tanpa input admin. |
| Kebutuhan benih | 40-50 kg/ha; beberapa sumber memakai 40 kg/ha |
| Umur panen | 70-73 HST menurut Tjap Bukit Mas; sumber BRIDA Buleleng menyebut 69-73 hari |
| Bobot 100 biji | 22,98 g/100 biji menurut Tjap Bukit Mas |
| Protein | 37,78% menurut Tjap Bukit Mas |
| Potensi hasil | 3,82 ton/ha menurut Tjap Bukit Mas |
| Keunggulan terverifikasi | Umur genjah, tahan rebah, agak tahan karat daun, agak tahan pecah polong menurut Tjap Bukit Mas |
| Deskripsi card UI | Varietas kedelai umur genjah dengan biji besar. Harga harus diisi admin karena belum ada sumber harga retail spesifik yang kuat. |

### 4.3.5 Benih Kedelai Detap 1

| Field | Isi |
|---|---|
| File gambar | `kedelai-detap-1.jpg` |
| Path rekomendasi | `assets/img/saprodi/benih/kedelai-detap-1.jpg` |
| Komoditas | Kedelai |
| Varietas | Detap 1 |
| Kategori | Benih & Bibit |
| Fase penggunaan | Pra-tanam / Tanam |
| Satuan UI | kg |
| Harga referensi | BELUM TERVERIFIKASI. Ada sumber yang membahas Detap 1, tetapi harga retail spesifik benih Detap 1 belum cukup jelas. Jangan isi angka default tanpa input admin. |
| Kebutuhan benih | 40-50 kg/ha; beberapa sumber memakai 40 kg/ha |
| Spesifikasi | Sumber DPKP DIY memiliki halaman deskripsi Detap 1; beberapa sumber penelitian menyebut Detap 1 memiliki performa baik pada parameter produksi di lahan kering masam, tetapi angka detail harus dicek dari dokumen deskripsi varietas jika akan diisi ke database. |
| Keunggulan terverifikasi | Beberapa sumber menyebut Detap 1 diminati karena tahan pecah polong dan produksi tinggi, tetapi untuk UI sebaiknya ditulis sebagai `referensi varietas unggul, harga belum diverifikasi`. |
| Deskripsi card UI | Varietas kedelai unggul modern. Untuk katalog, tampilkan dengan badge `Harga perlu input admin`. |

---

# 5. Rekomendasi schema data katalog benih

```sql
CREATE TABLE saprodi_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tanaman_id INT NOT NULL,
    kategori VARCHAR(100) NOT NULL,
    nama_item VARCHAR(150) NOT NULL,
    varietas VARCHAR(100),
    satuan VARCHAR(50) NOT NULL,
    harga_min BIGINT NULL,
    harga_max BIGINT NULL,
    satuan_harga VARCHAR(50) NULL,
    harga_status ENUM('terverifikasi', 'belum_terverifikasi', 'admin_input') DEFAULT 'belum_terverifikasi',
    sumber_harga TEXT NULL,
    kebutuhan_per_ha_min DECIMAL(10,2) NULL,
    kebutuhan_per_ha_max DECIMAL(10,2) NULL,
    umur_panen_min INT NULL,
    umur_panen_max INT NULL,
    potensi_hasil TEXT NULL,
    fungsi TEXT,
    keunggulan TEXT,
    risiko_catatan TEXT,
    fase_penggunaan VARCHAR(100),
    image_path VARCHAR(255),
    status ENUM('aktif','nonaktif') DEFAULT 'aktif',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

## Contoh prinsip seed harga

Jangan seed harga seperti ini:

```sql
-- SALAH: harga dipukul rata tanpa sumber
harga_min = 100000, harga_max = 100000
```

Seed yang lebih aman:

```sql
-- BENAR: harga range + status + sumber
harga_min = 85000,
harga_max = 140000,
satuan_harga = 'kemasan 5 kg',
harga_status = 'terverifikasi',
sumber_harga = 'Purotani + Shopee list Inpari 32, diakses 2026-06-16'
```

Untuk item tanpa harga spesifik:

```sql
harga_min = NULL,
harga_max = NULL,
satuan_harga = 'kg',
harga_status = 'belum_terverifikasi',
sumber_harga = 'Spesifikasi varietas tersedia; harga retail spesifik belum ditemukan pada 2026-06-16'
```

---

# 6. Sumber rujukan utama

## Harga marketplace / katalog

1. Shopee - Padi Ciherang: https://shopee.co.id/list/Padi/Ciherang
2. Lazada - Benih Padi Ciherang Jumbo 5kg: https://www.lazada.co.id/tag/benih-padi-ciherang-jumbo-5kg/
3. Shopee - Benih Padi Mekongga 5kg: https://shopee.co.id/Benih-Padi-Mekongga-Kemasan-5-kg-Bersertifikat-Label-Ungu-i.294131523.7880527123
4. Lazada - Benih Padi Mekongga 5kg: https://www.lazada.co.id/tag/benih-padi-mekongga-5kg/
5. Purotani - Benih Padi Mekongga Kingkong 5kg: https://purotani.id/product/benih-padi-mekongga-kingkong-5kg/
6. Purotani - Benih Padi Inpari 32 5kg: https://purotani.id/product/benih-padi-inpari-32-jumbo-pak-tani-5kg/
7. Shopee - Padi Inpari 32: https://shopee.co.id/list/Padi/Inpari%2032
8. Shopee - Benih Padi Inpari 30 5kg: https://shopee.co.id/Benih-Padi-Inpari-30-Kemasan-5kg-i.1660103243.27843657793
9. Lazada - Benih Padi Inpari 30 5kg: https://www.lazada.co.id/tag/benih-padi-inpari-30-5kg/
10. Purotani - Benih Padi IR64 5kg: https://purotani.id/product/benih-padi-ir64-premium-pp-kerja-5kg-ir-64-ppkerja/
11. Shopee - Padi IR64 jumbo: https://shopee.co.id/search?keyword=padi+ir+64+jumbo
12. Lazada - Situ Bagendit 5kg: https://www.lazada.co.id/tag/bibit-padi-situ-bagendit-5-kg/
13. Shopee - Situ Bagendit 5kg: https://shopee.co.id/Benih-Padi-Situbagendit-5kg-Pak-Tani-Bibit-Padi-Situ-Bagendit-Jumbo-Unggul-5-Kilogram-Saprotan-Utama-i.15001736.27230773756
14. Shopee - NASA 29 5kg: https://shopee.co.id/Benih-Jagung-Hibrida-NASA-29-tahan-bulai-5kg-i.402271756.20690910414
15. BigGo - NASA 29: https://biggo.id/s/benih%20jagung%20hibrida%20nasa%2029
16. Kajian VUB Jagung Hibrida: https://www.jurnalpangan.com/index.php/pangan/article/download/445/380
17. Sikumis - HJ21: https://www.sikumis.com/produk/jagung-super-205-varietas-hj21
18. Ralali - Bima 20 URI 5kg: https://www.ralali.com/No-Brand-HIBRIDA-Benih-Jagung-Bima-20-Uri-5kg-100000167241001
19. Shopee - Sukmaraga listing: https://shopee.co.id/Bibit-Jagung-Berlian-415-Murah-Bersertifikat-Resmi-SUKMARAGA-i.1222343031.26018394971
20. Inaproc - Anjasmoro: https://katalog.inaproc.id/lang-buana/benih-kedelai-varietas-anjasmoro
21. Lazada - Anjasmoro: https://www.lazada.co.id/tag/benih-kedelai-anjasmoro-5kg/
22. Shopee - Anjasmoro: https://shopee.co.id/1-Kg-Benih-unggul-varietas-kedelai-anjasmoro-polong-besar-dan-bersih-i.134429344.23913803438
23. Lazada - Wilis: https://www.lazada.co.id/tag/bibit-kedelai-super-jumbo/
24. Blibli - Bibit Kedelai: https://www.blibli.com/jual/bibit-kedelai
25. Lazada - Grobogan: https://www.lazada.co.id/tag/benih-kedelai-varietas-grobogan/
26. Shopee - Grobogan: https://shopee.co.id/Benih-Kedelai-Grobogan-Premium-1-kg-Unggul-Produksi-Tinggi-non-GMO-i.134429344.19080665893
27. BigGo - Grobogan: https://biggo.id/s/grobogan%20kedelai

## Spesifikasi varietas / kebutuhan benih

1. DPKP DIY - Ciherang: https://dpkp.jogjaprov.go.id/detail-benih/Padi%2BVarietas%2BCiherang/180523/a38f34adcea90f4d815ad20b1cbddf89458156e65ab892c92d9125c30a6aa1d1671
2. DPKP DIY - Mekongga: https://dpkp.jogjaprov.go.id/detail-benih/Padi%2BVarietas%2BMekongga/180523/fdffed38e3c886db9cbfe5eea2a32eaebbfc8934b5468a5117e04a75563dc937627
3. Benih Citra Asia - Padi: https://benihcitraasia.co.id/product-category/padi
4. Benih Citra Asia - Inpari 32 HDB: https://benihcitraasia.co.id/product-details/inpari-32-hdb.html
5. Pilar Pertanian - Inpari 30: https://pilarpertanian.com/jangan-panik-saat-banjir-inpari-30-ciherang-sub-1-tahan-rendaman
6. PIAT UGM - IR64: https://piat.ugm.ac.id/2022/07/26/piat-ugm-panen-padi-varietas-ir-64-dukungan-terhadap-produktivitas-petani-penangkar-benih-dan-ketahanan-pangan/
7. Tani Makmur Nusantara - Situ Bagendit: https://www.tanimakmurnusantara.com/2020/06/benih-padi-situ-bagendit.html
8. Distankan Buleleng - kebutuhan benih padi: https://distankan.bulelengkab.go.id/informasi/detail/berita/29-efisiensi-penggunaan-benih-padi
9. Kajian kebutuhan benih padi 25 kg/ha: https://jurnal.uss.ac.id/index.php/kaliagri/article/download/192/94
10. Bima 19 URI BRIDA Buleleng: https://brida.bulelengkab.go.id/informasi/download/100-hasil-penelitian-jagung-hibrida-varietas-bima-19-uri-balitbang-pertanian-kementan.pdf
11. Antara - Bima 19 URI: https://www.antaranews.com/berita/742148/%40AntaraKalbar
12. Technology Indonesia - HJ 21 Agritan: https://technologyindonesia.id/pertanian-dan-pangan/inovasi-pertanian/varietas-unggul-jagung-hj-21-dan-jh-31-rakitan-balitbangtan-dilisensi-mitra-industri/
13. BRIDA Buleleng - JH45: https://brida.bulelengkab.go.id/informasi/download/62-hasil-penelitian-jagung-hibrida-varietas-jh-45-balitbang-pertanian-kementan.pdf
14. Repository Pertanian - Jagung, Sorgum, Gandum: https://repository.pertanian.go.id/server/api/core/bitstreams/51414147-4ff2-462d-8e5f-253b7842fe6e/content
15. DPKP DIY - Sukmaraga: https://dpkp.jogjaprov.go.id/detail-benih/Jagung%2BVarietas%2BSukmaraga/280523/f772cfcd5120b42341f04cffc98047adb43b7edcc2283b7b9a691b4eab6b704f760
16. Kebutuhan benih jagung contoh hitungan: https://agroswamp.com/wp-content/uploads/14.-Menghitung-Keperluan-Benih-Pupuk.pdf
17. Benih Pertiwi - rumus kebutuhan benih: https://benihpertiwi.co.id/rumus-menghitung-kebutuhan-benih-secara-umum/
18. Tjap Bukit Mas - Anjasmoro: https://www.tjapbukitmas.co.id/product-details/7
19. Tjap Bukit Mas - Dega 1: https://www.tjapbukitmas.co.id/product-details/8
20. BRIDA Buleleng - Dega 1: https://brida.bulelengkab.go.id/informasi/download/89-hasil-penelitian-kedelai-varietas-dega-1-balitbang-pertanian-kementan.pdf
21. DPKP DIY - Anjasmoro: https://dpkp.jogjaprov.go.id/detail-benih/Kedelai%2BVarietas%2BAnjasmoro/190523/392810c469907f9875306e2933334e6bd98f31c1efb4b08ae654ff07344f1413690
22. DPKP DIY - Dega 1: https://dpkp.jogjaprov.go.id/detail-benih/Kedelai%2Bvarietas%2BDega%2B-1/190523/aba48e27f360f3a7f878731f9ada237a838b4163d15097c49df7548f8198169b695
23. DPKP DIY - Detap 1: https://dpkp.jogjaprov.go.id/detail-benih/Kedelai%2BVarietas%2BDetap%2B-1/190523/8e06606439d20c257ac123016a261f0b02cc11024458a76d503a276f28417acf696
24. Kebutuhan benih kedelai 40-50 kg/ha: https://repository.pertanian.go.id/bitstreams/b31a5511-6921-4e26-9a81-446eb245630d/download
25. Disperta Jombang - budidaya kedelai: https://disperta.jombangkab.go.id/berita/budidaya-tanaman-kedelai-5490
26. Penyebaran varietas kedelai: https://www.researchgate.net/publication/323940389_Penyebaran_Varietas_Unggul_Kedelai_dan_Dampaknya_terhadap_Ekonomi_Perdesaan
