# AgroTrack — Katalog Pupuk & Nutrisi Padi, Jagung, dan Kedelai

Tanggal penyusunan: 16 Juni 2026  
Status dokumen: revisi berbasis sumber internet, bukan asumsi bebas.

Dokumen ini dibuat untuk mengisi katalog **Pupuk & Nutrisi** pada AgroTrack. Fokusnya adalah item yang asset gambarnya sudah disiapkan:

```text
pupuk-organik-cair.jpg
pupuk-hayati-rhizobium.jpg
dolomit-kapur-pertanian.jpg
pupuk-kompos.jpg
pupuk-kandang.jpg
pupuk-organik-granul.jpg
pupuk-zk.png
pupuk-kcl-mop.jpg
pupuk-za.jpg
pupuk-sp36.jpg
pupuk-npk-phonska.jpg
pupuk-urea.jpg
```

## 1. Catatan penting untuk data harga

Harga pupuk **tidak boleh dianggap tetap**. Ada minimal empat tipe harga yang bisa berbeda jauh:

1. **HET pupuk subsidi**: harga resmi untuk petani yang berhak dan menebus melalui jalur subsidi.
2. **Harga non-subsidi resmi/ritel**: harga pasar produk pabrikan atau distributor.
3. **Harga marketplace**: sering berubah, dipengaruhi ongkir, repack, lokasi toko, ukuran kemasan, dan promo.
4. **Harga lokal kios tani**: bisa berbeda antar daerah.

Karena itu, struktur database AgroTrack sebaiknya tidak hanya memakai satu kolom `harga_estimasi`, tetapi minimal:

```sql
harga_min
harga_max
satuan_harga
sumber_harga
tanggal_cek_harga
harga_status
```

Contoh status harga:

```text
HET_SUBSIDI
REFERENSI_MARKETPLACE
REFERENSI_TOKO_RESMI
BELUM_STABIL
PERLU_VERIFIKASI_LOKAL
```

## 2. Ringkasan katalog pupuk

| No | Nama item katalog | Nama file asset | Kategori UI | Relevan untuk | Fase penggunaan | Harga berbasis sumber | Status harga |
|---:|---|---|---|---|---|---|---|
| 1 | Pupuk Urea | `pupuk-urea.jpg` | Pupuk Makro Tunggal | Padi, Jagung, Kedelai terbatas | Vegetatif / susulan | HET subsidi Rp1.800/kg atau Rp90.000/50 kg | HET_SUBSIDI |
| 2 | Pupuk NPK Phonska | `pupuk-npk-phonska.jpg` | Pupuk Majemuk NPK | Padi, Jagung, Kedelai | Dasar / susulan | HET subsidi Rp1.840/kg atau Rp92.000/50 kg | HET_SUBSIDI |
| 3 | Pupuk SP-36 | `pupuk-sp36.jpg` | Pupuk Fosfat | Padi, Jagung, Kedelai | Pupuk dasar | Referensi online non-subsidi ± Rp299.750–Rp1.162.000/50 kg | REFERENSI_MARKETPLACE |
| 4 | Pupuk ZA | `pupuk-za.jpg` | Pupuk Nitrogen + Sulfur | Padi, Jagung, Kedelai tertentu | Vegetatif / susulan | HET subsidi Rp1.360/kg atau Rp68.000/50 kg; referensi non-subsidi ± Rp198.750/50 kg | HET_SUBSIDI + REFERENSI |
| 5 | Pupuk KCl / MOP | `pupuk-kcl-mop.jpg` | Pupuk Kalium | Padi, Jagung, Kedelai | Generatif / pengisian hasil | Referensi marketplace ± Rp485.000–Rp845.000/50 kg; beberapa listing lebih tinggi | REFERENSI_MARKETPLACE |
| 6 | Pupuk ZK / Kalium Sulfat | `pupuk-zk.png` | Pupuk Kalium + Sulfur | Padi, Jagung, Kedelai | Generatif / kualitas hasil | Referensi Petromart Rp16.000–Rp23.000/kg; referensi B2B ± Rp7.770.000/ton | REFERENSI_TOKO_RESMI |
| 7 | Pupuk Organik Granul / Petroganik | `pupuk-organik-granul.jpg` | Pupuk Organik Padat | Padi, Jagung, Kedelai | Pra-tanam / dasar | HET pupuk organik subsidi Rp640/kg atau Rp25.600/40 kg | HET_SUBSIDI |
| 8 | Pupuk Kandang | `pupuk-kandang.jpg` | Pupuk Organik / Pembenah Tanah | Padi, Jagung, Kedelai | Pra-tanam / dasar | Harga sangat lokal; referensi online bervariasi, contoh Rp172.500/50 kg | PERLU_VERIFIKASI_LOKAL |
| 9 | Pupuk Kompos | `pupuk-kompos.jpg` | Pupuk Organik / Pembenah Tanah | Padi, Jagung, Kedelai | Pra-tanam / dasar | Referensi online: Rp66.600/50 kg; listing lain bervariasi | REFERENSI_MARKETPLACE |
| 10 | Dolomit / Kapur Pertanian | `dolomit-kapur-pertanian.jpg` | Pembenah Tanah | Padi, Jagung, Kedelai terutama lahan masam | Pra-tanam | Referensi online ± Rp33.300–Rp82.500/50 kg | REFERENSI_MARKETPLACE |
| 11 | Pupuk Hayati Rhizobium | `pupuk-hayati-rhizobium.jpg` | Pupuk Hayati / Inokulan | Kedelai utama; legum lain | Perlakuan benih / pra-tanam | Referensi online: Rp15.000/40 g | REFERENSI_MARKETPLACE |
| 12 | Pupuk Organik Cair / POC | `pupuk-organik-cair.jpg` | Pupuk Organik Cair | Padi, Jagung, Kedelai | Vegetatif / generatif | Referensi Petromart Phonska OCA Plus Rp114.000–Rp120.000/1 L | REFERENSI_TOKO_RESMI |

## 3. Detail per item katalog

### 3.1 Pupuk Urea

**Nama katalog:** Pupuk Urea  
**File asset:** `pupuk-urea.jpg`  
**Kategori:** Pupuk Makro Tunggal  
**Unsur utama:** Nitrogen (N)  
**Bentuk umum:** Butiran/prill/granul putih  
**Satuan UI:** kg, sak 50 kg  
**Relevan untuk:** Padi, jagung, kedelai dalam jumlah terbatas atau sesuai rekomendasi setempat  
**Fase penggunaan:** Vegetatif, pemupukan susulan

**Spesifikasi berbasis sumber:**

- Pupuk Indonesia/Petrokimia mencantumkan Urea Subsidi dengan kandungan **N 46%** dan **kadar biuret 1%**.
- Urea berfungsi sebagai sumber nitrogen untuk mempercepat pertumbuhan vegetatif, membuat tanaman lebih hijau, dan mendukung pembentukan protein tanaman.

**Harga berbasis sumber:**

- HET subsidi 2025: **Rp1.800/kg**.
- Kemasan 50 kg: **Rp90.000/sak 50 kg**.

**Fungsi di AgroTrack:**

Urea dapat tampil sebagai pupuk nitrogen utama. Untuk UI petani, tampilkan dengan label:

```text
Sumber nitrogen utama untuk fase pertumbuhan daun dan batang. Gunakan sesuai rekomendasi pemupukan setempat agar tidak berlebihan.
```

**Kelebihan:**

- Kandungan N tinggi.
- Umum dipakai pada padi dan jagung.
- Harga subsidi relatif mudah dipahami oleh petani jika mereka berhak menerima pupuk subsidi.

**Catatan risiko:**

- Pemakaian berlebihan dapat membuat tanaman terlalu vegetatif, rentan rebah, dan tidak efisien.
- Untuk kedelai, nitrogen perlu hati-hati karena kedelai dapat bersimbiosis dengan Rhizobium untuk menambat nitrogen.

**Sumber:**

- Pupuk Indonesia / Distribution Branding — Urea Subsidi: https://distribution-branding.pupuk-indonesia.com/api/produk/5
- Pupuk Indonesia — HET Pupuk Subsidi 2025: https://www.pupuk-indonesia.com/media-info/article-detail/48/penerapan-het-2025-untuk-urea-npk-za-dan-pupuk-organik


### 3.2 Pupuk NPK Phonska

**Nama katalog:** Pupuk NPK Phonska  
**File asset:** `pupuk-npk-phonska.jpg`  
**Kategori:** Pupuk Majemuk NPK  
**Unsur utama:** Nitrogen, fosfat, kalium  
**Bentuk umum:** Granul  
**Satuan UI:** kg, sak 50 kg  
**Relevan untuk:** Padi, jagung, kedelai  
**Fase penggunaan:** Pupuk dasar dan/atau susulan

**Spesifikasi berbasis sumber:**

- Pupuk Indonesia/Petrokimia mencantumkan NPK Phonska dengan kandungan:
  - **N 15%**
  - **P2O5 10%**
  - **K2O 12%**

**Harga berbasis sumber:**

- HET subsidi 2025: **Rp1.840/kg**.
- Kemasan 50 kg: **Rp92.000/sak 50 kg**.

**Fungsi di AgroTrack:**

NPK Phonska dapat menjadi pupuk majemuk default untuk katalog padi, jagung, dan kedelai karena mengandung tiga hara utama. Untuk UI, tampilkan:

```text
Pupuk majemuk NPK untuk mendukung pertumbuhan vegetatif, akar, dan pembentukan hasil. Cocok sebagai pupuk dasar atau susulan sesuai rekomendasi setempat.
```

**Kelebihan:**

- Lebih praktis daripada mencampur pupuk tunggal.
- Cocok sebagai item katalog utama karena umum dikenal petani.
- Harga subsidi punya acuan resmi.

**Catatan risiko:**

- Formula NPK tunggal tidak selalu cocok untuk semua kondisi tanah.
- Rekomendasi pemupukan idealnya mengikuti status hara tanah dan rekomendasi lokasi.

**Sumber:**

- Pupuk Indonesia / Distribution Branding — NPK Phonska: https://distribution-branding.pupuk-indonesia.com/api/produk/6
- Pupuk Indonesia — HET Pupuk Subsidi 2025: https://www.pupuk-indonesia.com/media-info/article-detail/48/penerapan-het-2025-untuk-urea-npk-za-dan-pupuk-organik


### 3.3 Pupuk SP-36

**Nama katalog:** Pupuk SP-36  
**File asset:** `pupuk-sp36.jpg`  
**Kategori:** Pupuk Fosfat  
**Unsur utama:** Fosfor/fosfat  
**Bentuk umum:** Butiran abu-abu  
**Satuan UI:** kg, sak 50 kg  
**Relevan untuk:** Padi, jagung, kedelai  
**Fase penggunaan:** Pupuk dasar, awal musim tanam

**Spesifikasi berbasis sumber:**

Petrokimia Gresik mencantumkan SP-36 dengan spesifikasi:

- **P2O5 total minimal 36%**
- **P2O5 larut asam sitrat minimal 34%**
- **P2O5 larut air minimal 30%**
- **Kadar air maksimal 5%**
- **Asam bebas sebagai H3PO4 maksimal 6%**
- Bentuk butiran, warna abu-abu, kemasan 50 kg.

**Harga berbasis sumber:**

SP-36 tidak muncul dalam daftar HET subsidi 2025 yang memuat Urea, NPK, ZA, Organik, dan NPK Kakao. Karena itu harga SP-36 di AgroTrack sebaiknya memakai status **REFERENSI_MARKETPLACE** atau **NON_SUBSIDI**.

Referensi harga yang ditemukan:

- Sikumis/Petrokimia Gresik: **Rp5.995.000/ton**, setara ± **Rp5.995/kg** atau ± **Rp299.750/50 kg**.
- Marketplace Shopee menampilkan listing SP-36 50 kg pada kisaran yang jauh lebih tinggi, misalnya **Rp829.999–Rp1.162.000/50 kg** tergantung toko/lokasi/pengiriman.
- Ada listing lain yang menampilkan harga ± **Rp500.000/50 kg**.

**Rekomendasi default AgroTrack:**

Jangan masukkan satu harga mutlak. Pakai:

```text
harga_min: 299750
harga_max: 1162000
satuan_harga: sak 50 kg
harga_status: REFERENSI_MARKETPLACE
```

**Fungsi di AgroTrack:**

SP-36 adalah pupuk fosfat untuk membantu pertumbuhan akar, pembungaan, pembentukan buah/biji, dan percepatan pemasakan hasil.

**Kelebihan:**

- Penting sebagai pupuk dasar.
- Relevan untuk padi, jagung, dan kedelai.
- Khusus kedelai, fosfor penting untuk pembentukan akar dan nodul.

**Catatan risiko:**

- Harga sangat bervariasi di marketplace.
- Pemberian fosfat sebaiknya mengikuti status P tanah.

**Sumber:**

- Petrokimia Gresik — SP-36: https://petrokimia-gresik.com/product/pupuk-sp-36
- Pupuk Indonesia / Distribution Branding — SP-36: https://distribution-branding.pupuk-indonesia.com/api/produk/7
- Sikumis Brands Petrokimia Gresik: https://www.sikumis.com/brands/petrokimia-gresik
- Shopee listing SP-36 50 kg: https://shopee.co.id/PUPUK-PETRO-SP36-ISI-50-KG-SP-36-KEMASAN-PABRIK-VIA-CARGO-i.16443162.10924730328
- Happy Tani SP-36 50 kg: https://www.happyshopingbatam.com/product/jual-pupuk-sp-36-non-subsidi-50-kg-harga-terbaik-happy-tani/


### 3.4 Pupuk ZA

**Nama katalog:** Pupuk ZA  
**File asset:** `pupuk-za.jpg`  
**Kategori:** Pupuk Nitrogen + Sulfur  
**Unsur utama:** Nitrogen dan sulfur  
**Bentuk umum:** Kristal  
**Satuan UI:** kg, sak 50 kg  
**Relevan untuk:** Padi, jagung, kedelai tertentu, dan komoditas yang membutuhkan sulfur  
**Fase penggunaan:** Vegetatif / susulan

**Spesifikasi berbasis sumber:**

Petrokimia Gresik mencantumkan ZA dengan spesifikasi:

- **Nitrogen minimal 20,8%**
- **Belerang minimal 23,8%**
- **Kadar air maksimal 1%**
- **Asam bebas sebagai H2SO4 maksimal 0,1%**
- Bentuk kristal.
- Warna putih untuk non-subsidi dan orange untuk ZA bersubsidi.
- Kemasan 50 kg.

**Harga berbasis sumber:**

- HET subsidi 2025: **Rp1.360/kg** atau **Rp68.000/50 kg**.
- Referensi non-subsidi Sikumis/Petrokimia Gresik: **Rp3.975.000/ton**, setara ± **Rp3.975/kg** atau ± **Rp198.750/50 kg**.

**Fungsi di AgroTrack:**

ZA dapat ditampilkan sebagai pupuk tambahan nitrogen dan sulfur. Untuk UI:

```text
Pupuk sumber nitrogen dan sulfur. Berguna untuk mendukung pertumbuhan vegetatif dan kualitas hasil, tetapi pemakaian harus disesuaikan dengan kebutuhan tanaman dan kondisi tanah.
```

**Kelebihan:**

- Menyediakan sulfur selain nitrogen.
- Bermanfaat pada lahan/komoditas yang membutuhkan tambahan S.

**Catatan risiko:**

- Jangan disamakan dengan urea; kandungan nitrogen lebih rendah tetapi mengandung sulfur.
- Dosis perlu disesuaikan agar tidak terjadi pemupukan N berlebihan.

**Sumber:**

- Petrokimia Gresik — ZA: https://petrokimia-gresik.com/product/pupuk-za
- Pupuk Indonesia — HET Pupuk Subsidi 2025: https://www.pupuk-indonesia.com/media-info/article-detail/48/penerapan-het-2025-untuk-urea-npk-za-dan-pupuk-organik
- Sikumis Brands Petrokimia Gresik: https://www.sikumis.com/brands/petrokimia-gresik


### 3.5 Pupuk KCl / MOP

**Nama katalog:** Pupuk KCl / MOP  
**File asset:** `pupuk-kcl-mop.jpg`  
**Kategori:** Pupuk Kalium  
**Unsur utama:** Kalium sebagai K2O  
**Bentuk umum:** Kristal/granul merah-putih  
**Satuan UI:** kg, sak 50 kg  
**Relevan untuk:** Padi, jagung, kedelai  
**Fase penggunaan:** Generatif, pembentukan/pengisian gabah, tongkol, polong, dan biji

**Spesifikasi berbasis sumber:**

Pupuk Mahkota menjelaskan KCl/MOP sebagai pupuk kalium dengan kandungan **K2O minimal 60%**. Produk KCl/MOP Mahkota disebut berbentuk kristal homogen dengan warna dominan merah dan putih.

**Harga berbasis sumber:**

KCl/MOP tidak termasuk HET subsidi pupuk utama pada sumber HET 2025 yang ditemukan. Harga yang ditemukan adalah harga marketplace/ritel:

- Shopee listing KCl 50 kg menampilkan beberapa harga seperti **Rp495.000–Rp1.092.115/50 kg**, tergantung merek dan toko.
- Blibli listing KCl 50 kg menampilkan contoh harga **Rp485.000** dan harga lain yang berbeda.
- JRice menampilkan KCl Mahkota MOP 50 kg sekitar **Rp490.000**.

**Rekomendasi default AgroTrack:**

Gunakan range konservatif:

```text
harga_min: 485000
harga_max: 845000
satuan_harga: sak 50 kg
harga_status: REFERENSI_MARKETPLACE
```

Outlier sampai ±Rp1.092.115 dapat dicatat, tetapi jangan dijadikan default karena bisa dipengaruhi lokasi, ongkir, atau model pengiriman.

**Fungsi di AgroTrack:**

KCl/MOP menjadi item kalium utama untuk meningkatkan kualitas hasil panen, pengisian biji, daya tahan tanaman terhadap stres, dan kualitas hasil simpan.

**Kelebihan:**

- Kandungan K tinggi.
- Relevan untuk pengisian hasil pada padi, jagung, dan kedelai.

**Catatan risiko:**

- Mengandung klorida; untuk beberapa komoditas sensitif klorida bisa perlu alternatif seperti ZK/kalium sulfat.
- Harga marketplace sangat bervariasi.

**Sumber:**

- Pupuk Mahkota — KCl Kanada: https://pupukmahkota.co.id/produk/pupuk-tunggal-makro/kcl-kanada-id
- Pupuk Mahkota — Bunga Merah KCl: https://pupukmahkota.co.id/produk/pupuk-tunggal-makro/bunga-merah-kcl
- Shopee listing KCl 50 kg: https://shopee.co.id/list/Kcl/50%20Kg
- Blibli listing KCl 50 kg: https://www.blibli.com/jual/pupuk-kcl-50-kilo
- JRice KCl Mahkota MOP 50 kg: https://www.jrice.id/pupuk-kcl-mahkota-mop-50-kg.html


### 3.6 Pupuk ZK / Kalium Sulfat

**Nama katalog:** Pupuk ZK / Kalium Sulfat  
**File asset:** `pupuk-zk.png`  
**Kategori:** Pupuk Kalium + Sulfur  
**Unsur utama:** Kalium dan sulfur  
**Bentuk umum:** Serbuk putih  
**Satuan UI:** kg, sak/kemasan besar jika tersedia  
**Relevan untuk:** Padi, jagung, kedelai; lebih umum untuk komoditas yang memerlukan K dan S serta sensitif terhadap klorida  
**Fase penggunaan:** Generatif / kualitas hasil

**Spesifikasi berbasis sumber:**

Petrokimia Gresik mencantumkan ZK sebagai pupuk kalium sulfat dengan spesifikasi:

- **K2O 50%**
- **Sulfur 17%**
- Bentuk/warna: serbuk putih
- Kelarutan dalam air: 9,205 g/100 ml H2O

**Harga berbasis sumber:**

- Petromart menampilkan Pupuk ZK kemasan 1 kg sekitar **Rp16.000–Rp23.000/kg**.
- Sikumis/Petrokimia Gresik menampilkan Pupuk ZK Petro **Rp7.770.000/ton**, setara ± **Rp7.770/kg** atau ± **Rp388.500/50 kg**.
- BigGo/marketplace menampilkan harga ZK 1 kg dan 50 kg yang bervariasi; harga marketplace dapat jauh berbeda dari harga B2B/ton.

**Rekomendasi default AgroTrack:**

```text
harga_min: 16000
harga_max: 23000
satuan_harga: kg
harga_status: REFERENSI_TOKO_RESMI
```

Jika memakai acuan tonase:

```text
harga_min_bulk_per_kg: 7770
harga_status_bulk: REFERENSI_B2B
```

**Fungsi di AgroTrack:**

ZK dapat ditampilkan sebagai pupuk kalium-sulfur untuk kualitas hasil, kekokohan tanaman, pengisian biji, dan toleransi terhadap stres.

**Kelebihan:**

- Sumber K tanpa klorida tinggi seperti KCl.
- Menyediakan sulfur.
- Larut air.

**Catatan risiko:**

- Harga eceran per kg dapat jauh lebih mahal daripada pembelian bulk.
- Untuk tanaman pangan luas, petani biasanya mempertimbangkan biaya per hektar.

**Sumber:**

- Petrokimia Gresik — ZK: https://petrokimia-gresik.com/product/pupuk-zk
- Petromart Official Store: https://petromart.petrokimia-gresik.com/
- Sikumis Brands Petrokimia Gresik: https://www.sikumis.com/brands/petrokimia-gresik


### 3.7 Pupuk Organik Granul / Petroganik

**Nama katalog:** Pupuk Organik Granul / Petroganik  
**File asset:** `pupuk-organik-granul.jpg`  
**Kategori:** Pupuk Organik Padat  
**Unsur/fungsi utama:** Bahan organik, pembenah tanah, peningkatan sifat fisik-kimia-biologi tanah  
**Bentuk umum:** Granul/butiran  
**Satuan UI:** kg, sak 40 kg  
**Relevan untuk:** Padi, jagung, kedelai  
**Fase penggunaan:** Pra-tanam / pupuk dasar

**Spesifikasi berbasis sumber:**

Pupuk Indonesia/Petrokimia mencantumkan Petroganik dengan spesifikasi:

- pH 4–9
- C-organik sekitar 15%
- Kadar air 8–20%
- C/N 15–25

**Harga berbasis sumber:**

- HET pupuk organik subsidi 2025: **Rp640/kg**.
- Kemasan 40 kg: **Rp25.600/sak 40 kg**.

**Fungsi di AgroTrack:**

Pupuk organik granul sebaiknya tidak ditampilkan sebagai pengganti penuh pupuk NPK, tetapi sebagai pendukung kesuburan tanah.

**Kelebihan:**

- Memperbaiki kondisi tanah.
- Cocok sebagai item dasar dalam fase pra-tanam.
- Bisa menjadi opsi untuk semua tanaman.

**Catatan risiko:**

- Kandungan hara makro biasanya lebih rendah daripada pupuk anorganik.
- Efeknya lebih ke kesehatan tanah dan efisiensi jangka menengah.

**Sumber:**

- Pupuk Indonesia / Distribution Branding — Petroganik: https://distribution-branding.pupuk-indonesia.com/api/produk/15
- Pupuk Indonesia — HET Pupuk Subsidi 2025: https://www.pupuk-indonesia.com/media-info/article-detail/48/penerapan-het-2025-untuk-urea-npk-za-dan-pupuk-organik


### 3.8 Pupuk Kandang

**Nama katalog:** Pupuk Kandang  
**File asset:** `pupuk-kandang.jpg`  
**Kategori:** Pupuk Organik / Pembenah Tanah  
**Bahan umum:** Kotoran sapi, kambing, ayam, atau campuran yang sudah matang/terfermentasi  
**Satuan UI:** kg, karung, rit/angkutan lokal  
**Relevan untuk:** Padi, jagung, kedelai  
**Fase penggunaan:** Pra-tanam / olah tanah

**Spesifikasi berbasis sumber:**

Pupuk kandang termasuk pupuk organik yang berasal dari bahan alami/hewan. Dinas Pertanian Pontianak memasukkan pupuk kandang sebagai contoh pupuk organik/pupuk alam.

**Harga berbasis sumber:**

Harga pupuk kandang sangat lokal dan tidak punya HET nasional seperti pupuk subsidi. Referensi online:

- Blibli menampilkan beberapa produk pupuk kandang dengan harga sekitar **Rp18.399–Rp25.500** untuk item/kemasan yang bervariasi.
- Floria menampilkan contoh Pupuk Kandang Kambing 50 kg sekitar **Rp172.500**.

**Rekomendasi default AgroTrack:**

Jangan pakai satu harga nasional. Gunakan:

```text
harga_status: PERLU_VERIFIKASI_LOKAL
harga_min: 18000
harga_max: 172500
satuan_harga: kemasan bervariasi / 50 kg
```

Untuk UI, lebih aman tampilkan “harga input manual” atau “harga estimasi lokal”.

**Fungsi di AgroTrack:**

Pupuk kandang membantu menambah bahan organik, memperbaiki struktur tanah, dan meningkatkan aktivitas mikroba tanah.

**Kelebihan:**

- Sangat realistis untuk petani.
- Sering tersedia lokal.
- Cocok sebagai biaya pra-tanam.

**Catatan risiko:**

- Harus matang/terfermentasi agar tidak membawa patogen, biji gulma, atau panas fermentasi.
- Kandungan hara sangat bervariasi tergantung jenis ternak dan proses pengolahan.

**Sumber:**

- Dinas Pertanian Pontianak — Mengenal Pupuk Tanaman: https://dppp.pontianak.go.id/artikel/51-mengenal-pupuk-tanaman.html
- Blibli — Pupuk Kandang: https://www.blibli.com/jual/pupuk-kandang
- Floria — Pupuk Kandang: https://floria.id/jual/pupuk


### 3.9 Pupuk Kompos

**Nama katalog:** Pupuk Kompos  
**File asset:** `pupuk-kompos.jpg`  
**Kategori:** Pupuk Organik / Pembenah Tanah  
**Bahan umum:** Sisa tanaman, jerami, dedaunan, limbah organik yang telah terdekomposisi  
**Satuan UI:** kg, karung, sak 50 kg  
**Relevan untuk:** Padi, jagung, kedelai  
**Fase penggunaan:** Pra-tanam / olah tanah

**Spesifikasi berbasis sumber:**

Kompos termasuk pupuk organik/pupuk alam. Dinas Pertanian Pontianak memasukkan kompos sebagai contoh pupuk organik.

**Harga berbasis sumber:**

- MBizMarket menampilkan produk Pupuk Kompos 50 kg dengan harga **Rp66.600/50 kg**.
- Shopee menampilkan contoh kompos organik 5 kg sekitar **Rp17.840**.
- Blibli menampilkan contoh kompos 1 kg sekitar **Rp5.000**, tetapi kemasan dan brand berbeda.

**Rekomendasi default AgroTrack:**

```text
harga_min: 66600
harga_max: 66600
satuan_harga: 50 kg
harga_status: REFERENSI_MARKETPLACE
```

Tambahkan catatan bahwa harga kompos sangat bergantung pada lokasi, bahan baku, dan ongkir.

**Fungsi di AgroTrack:**

Kompos cocok menjadi item pra-tanam untuk memperbaiki tanah, meningkatkan bahan organik, dan mendukung efisiensi pupuk kimia.

**Kelebihan:**

- Relevan untuk semua tanaman.
- Bagus untuk narasi pertanian berkelanjutan.
- Cocok digabung dengan fase “Persiapan Lahan”.

**Catatan risiko:**

- Kompos yang belum matang bisa mengganggu tanaman.
- Efek hara tidak secepat pupuk anorganik.

**Sumber:**

- Dinas Pertanian Pontianak — Mengenal Pupuk Tanaman: https://dppp.pontianak.go.id/artikel/51-mengenal-pupuk-tanaman.html
- MBizMarket — Pupuk Kompos 50 kg: https://www.mbizmarket.co.id/catalog/detail/pupuk-kompos-50-kg-2550710-5453242.html
- Shopee — Pupuk Kompos: https://shopee.co.id/list/Pupuk/Kompos
- Blibli — Pupuk Kompos: https://www.blibli.com/jual/pupuk-kompos


### 3.10 Dolomit / Kapur Pertanian

**Nama katalog:** Dolomit / Kapur Pertanian  
**File asset:** `dolomit-kapur-pertanian.jpg`  
**Kategori:** Pembenah Tanah  
**Bahan umum:** Kapur dolomit/kaptan/kalsit tergantung produk  
**Satuan UI:** kg, sak 50 kg  
**Relevan untuk:** Padi, jagung, kedelai terutama pada tanah masam  
**Fase penggunaan:** Pra-tanam sebelum olah tanah atau sebelum tanam

**Spesifikasi dan fungsi berbasis sumber:**

Dolomit/kapur pertanian berfungsi sebagai bahan amelioran atau pembenah tanah, terutama pada tanah masam. Pada teknologi PTT kedelai di Papua, bahan amelioran berupa kapur dolomit disebut dapat digunakan pada tanah masam, dengan contoh dosis **2,0 t/ha**, dan pupuk organik seperti kompos jerami/pupuk kandang **2,5 t/ha**.

**Harga berbasis sumber:**

- Blibli Siplah menampilkan Kapur Pertanian Dolomit 50 kg: **Rp33.300**.
- BibitBunga menampilkan Dolomit 50 kg: **Rp66.000**.
- Shopee listing Dolomit 50 kg: **Rp82.500**.
- Lazada menampilkan beberapa listing Dolomit 50 kg sekitar **Rp60.300–Rp75.000**.

**Rekomendasi default AgroTrack:**

```text
harga_min: 33300
harga_max: 82500
satuan_harga: sak 50 kg
harga_status: REFERENSI_MARKETPLACE
```

**Fungsi di AgroTrack:**

Dolomit masuk kategori **Pembenah Tanah**, bukan pupuk hara utama. Untuk UI:

```text
Pembenah tanah untuk membantu menaikkan pH tanah masam dan memperbaiki kondisi lahan sebelum tanam.
```

**Kelebihan:**

- Sangat relevan untuk kedelai di lahan masam.
- Bisa dimasukkan di fase pra-tanam.
- Membantu menjelaskan bahwa operasional petani bukan hanya bibit dan pupuk kimia.

**Catatan risiko:**

- Tidak semua lahan perlu dolomit.
- Pemberian idealnya berdasarkan pH tanah atau rekomendasi penyuluh.

**Sumber:**

- Pustaka BPPSDMP Kementan — PTT Kedelai di Papua: https://pustaka.bppsdmp.pertanian.go.id/info-literasi/info-teknologi-komponen-pilihan-pengelolaan-tanaman-terpadu-ptt-kedelai-di-papua
- Blibli Siplah — Kapur Pertanian Dolomit 50 kg: https://siplah.blibli.com/product/kapur-pertanian-dolomit-50-kg/SBTS-0027-00016
- BibitBunga — Dolomit 50 kg: https://bibitbunga.com/product/pupuk-kapur-pertanian-dolomit-dolomite-1-zak-50kg-50-kg-kaptan-murah/
- Shopee — Dolomit 50 kg: https://shopee.co.id/Pupuk-Kapur-Pertanian-Dolomit-Dolomite-1-Zak-50kg-50-kg-Kaptan-Murah-i.6678187.5941015395
- Lazada — Harga Dolomit 50 kg: https://www.lazada.co.id/tag/harga-dolomit-50-kg/


### 3.11 Pupuk Hayati Rhizobium

**Nama katalog:** Pupuk Hayati Rhizobium  
**File asset:** `pupuk-hayati-rhizobium.jpg`  
**Kategori:** Pupuk Hayati / Inokulan  
**Bahan aktif umum:** Bakteri Rhizobium atau formula mikroba penambat nitrogen  
**Satuan UI:** gram, sachet, pcs  
**Relevan untuk:** Kedelai utama; juga legum/kacang-kacangan  
**Fase penggunaan:** Perlakuan benih / pra-tanam

**Spesifikasi dan fungsi berbasis sumber:**

Rhizobium bersimbiosis dengan akar tanaman polong-polongan dan mengikat nitrogen bebas dari udara agar tersedia bagi tanaman kedelai. Studi/kajian menyebut penggunaan Rhizobium sebagai teknologi budidaya ramah lingkungan untuk mendukung produktivitas kedelai.

Salah satu penelitian pada kedelai menggunakan faktor dosis inokulasi Rhizobium **0 g/kg benih, 5 g/kg benih, 7 g/kg benih, dan 9 g/kg benih**. Penelitian lain menyebut inokulan Rhizobium **10 g/kg benih** dapat meningkatkan beberapa parameter pertumbuhan/hasil dibanding tanpa inokulasi.

**Harga berbasis sumber:**

- Sikumis menampilkan produk **Rhizobium (Kacang dan Kedelai) 40 g** dengan harga **Rp15.000/pcs**.

**Rekomendasi default AgroTrack:**

```text
harga_min: 15000
harga_max: 15000
satuan_harga: pcs 40 g
harga_status: REFERENSI_MARKETPLACE
```

**Fungsi di AgroTrack:**

Rhizobium sebaiknya tampil sebagai item khusus kedelai, bukan pupuk umum untuk semua tanaman.

**Kelebihan:**

- Sangat khas untuk kedelai.
- Membuat katalog AgroTrack terlihat lebih agronomis, bukan hanya daftar pupuk kimia.
- Cocok dimasukkan ke fase pra-tanam atau perlakuan benih.

**Catatan risiko:**

- Efektivitas tergantung kualitas inokulan, kondisi tanah, pH, kelembapan, dan cara aplikasi.
- Jangan klaim otomatis menggantikan seluruh pupuk nitrogen.

**Sumber:**

- Jurnal Agrotekmas — Inokulasi Rhizobium dan POC pada kedelai: https://jurnal.fp.umi.ac.id/index.php/agrotekmas/article/download/208/182
- Jurnal UB — Pengaruh Inokulasi Rhizobium dan NPK pada kedelai: https://protan.studentjournal.ub.ac.id/index.php/protan/article/view/1736
- Agriprima — Aplikasi Inokulasi Rhizobium dan SP-36: https://agriprima.polije.ac.id/index.php/journal/article/view/v1i1-j
- Sikumis — Rhizobium Kacang dan Kedelai 40 g: https://www.sikumis.com/produk/rhizobium-kacang-dan-kedelai-40-g


### 3.12 Pupuk Organik Cair / POC

**Nama katalog:** Pupuk Organik Cair / POC  
**File asset:** `pupuk-organik-cair.jpg`  
**Kategori:** Pupuk Organik Cair / Nutrisi Tambahan  
**Bentuk umum:** Cair  
**Satuan UI:** liter, botol  
**Relevan untuk:** Padi, jagung, kedelai  
**Fase penggunaan:** Vegetatif, generatif, atau sesuai label produk

**Spesifikasi berbasis sumber:**

Petromart/Petrokimia menampilkan produk **Phonska OCA Plus** sebagai Pupuk Organik Cair kemasan 1 liter. Deskripsi yang muncul pada sumber Petromart mencantumkan:

- C-Organik minimal 10%
- N-Organik minimal 0,5%
- N total + P2O5 total + K2O total = 2–6

Sumber berita juga menyebut Phonska OCA sebagai pupuk organik cair yang mengandung C-organik, unsur hara makro NPK, mikro, dan mikroba.

**Harga berbasis sumber:**

- Petromart Official Store: **Rp114.000–Rp120.000/1 liter**.
- Lazada juga menampilkan Phonska OCA Plus 1 liter sekitar **Rp116.000**.

**Rekomendasi default AgroTrack:**

```text
harga_min: 114000
harga_max: 120000
satuan_harga: botol 1 liter
harga_status: REFERENSI_TOKO_RESMI
```

**Fungsi di AgroTrack:**

POC dapat dimasukkan sebagai nutrisi tambahan, bukan pengganti utama Urea/NPK/SP-36/KCl.

**Kelebihan:**

- Mudah divisualkan dengan gambar botol.
- Cocok untuk UI kartu produk.
- Bisa dikaitkan dengan fase vegetatif/generatif.

**Catatan risiko:**

- Banyak produk POC memiliki formulasi berbeda; jangan pukul rata spesifikasi.
- Dosis dan cara aplikasi harus mengikuti label produk.

**Sumber:**

- Petromart Official Store: https://petromart.petrokimia-gresik.com/
- Lazada — Phonska OCA Plus: https://www.lazada.co.id/tag/pupuk-organik-cair-phonska-oca/
- 1Minute — Phonska OCA Petrokimia Gresik: https://www.1minute.id/2021/01/05/phonska-oca-pupuk-organik-cair-produk-inovasi-petrokimia-gresik-solusi-praktis-bagi-petani/


## 4. Relevansi pupuk per tanaman

### 4.1 Padi

Pupuk/nutrisi yang paling relevan untuk padi:

| Fase | Item relevan |
|---|---|
| Pra-tanam | Pupuk organik granul, pupuk kandang, kompos, dolomit jika tanah masam |
| Tanam / awal | SP-36, NPK Phonska |
| Vegetatif | Urea, NPK Phonska, ZA bila diperlukan |
| Generatif | KCl/MOP, ZK, NPK sesuai rekomendasi |
| Pascapanen / perbaikan tanah | Kompos, pupuk kandang, dekomposisi jerami jika dikembangkan |

Catatan: Pemupukan padi sebaiknya mengacu pada rekomendasi lokasi. Salah satu dokumen teknis menyebut pemupukan padi dilakukan bertahap, misalnya pada 7–10 HST, 21–25 HST, dan 30–35 HST jika diperlukan, dengan komposisi berdasarkan rekomendasi setempat.

### 4.2 Jagung

Pupuk/nutrisi yang paling relevan untuk jagung:

| Fase | Item relevan |
|---|---|
| Pra-tanam | Pupuk kandang, kompos, dolomit jika tanah masam |
| Tanam / awal | NPK Phonska, SP-36 |
| Vegetatif | Urea, ZA bila diperlukan |
| Pembentukan tongkol | KCl/MOP, ZK, NPK |
| Pengisian biji | KCl/MOP, ZK, POC sesuai label |

Referensi budidaya jagung menyebut pupuk tunggal yang biasa diberikan pada jagung antara lain Urea, SP-36, KCl, dan ZA; pupuk majemuk bisa berupa NPK termasuk NPK Phonska. Beberapa kajian jagung juga memakai kombinasi Urea, SP-36, KCl, NPK Phonska, dan pupuk kandang.

### 4.3 Kedelai

Pupuk/nutrisi yang paling relevan untuk kedelai:

| Fase | Item relevan |
|---|---|
| Pra-tanam | Dolomit pada tanah masam, pupuk kandang, kompos |
| Perlakuan benih | Rhizobium |
| Tanam / awal | SP-36, NPK rendah-sedang sesuai kebutuhan |
| Vegetatif | POC atau pupuk hayati sesuai label; Urea terbatas jika direkomendasikan |
| Pembentukan polong/biji | KCl/MOP, ZK |
| Pascapanen | Kompos/pupuk organik untuk perbaikan tanah |

Untuk kedelai, item yang membedakan dari padi/jagung adalah **Rhizobium** dan **dolomit pada tanah masam**. Sumber PTT kedelai di Papua menyebut dolomit 2,0 t/ha dan pupuk organik seperti kompos jerami/pupuk kandang 2,5 t/ha pada tanah masam; angka ini tidak boleh dijadikan dosis universal, tetapi bisa menjadi referensi contoh praktik berbasis kondisi lahan.

## 5. Saran UI AgroTrack

### 5.1 Tampilan card katalog

Contoh card:

```text
[Pupuk NPK Phonska]
Kategori: Pupuk Majemuk NPK
Kandungan: N 15%, P2O5 10%, K2O 12%
Fase: Dasar / Susulan
Tanaman: Padi, Jagung, Kedelai
Harga acuan: Rp1.840/kg atau Rp92.000/50 kg
Status harga: HET_SUBSIDI
Tombol: Tambahkan ke Biaya Musim Ini
```

### 5.2 Filter yang disarankan

```text
- Tanaman: Padi / Jagung / Kedelai
- Fase: Pra-tanam / Tanam / Vegetatif / Generatif / Pascapanen
- Kategori: Makro Tunggal / NPK / Organik / Hayati / Pembenah Tanah / Nutrisi Cair
- Status harga: HET_SUBSIDI / MARKETPLACE / TOKO_RESMI / PERLU_VERIFIKASI
```

### 5.3 Warning yang sebaiknya muncul di UI

```text
Harga bersifat estimasi dan dapat berbeda antar daerah, toko, status subsidi, ukuran kemasan, serta ongkos kirim. Dosis dan cara aplikasi harus mengikuti rekomendasi pemupukan setempat atau label produk.
```

## 6. Rekomendasi struktur database

```sql
CREATE TABLE saprodi_items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  tanaman_id INT NULL,
  kategori VARCHAR(100) NOT NULL,
  nama_item VARCHAR(150) NOT NULL,
  nama_dagang VARCHAR(150) NULL,
  jenis_item VARCHAR(100) NOT NULL,
  fase_penggunaan VARCHAR(100) NOT NULL,
  satuan VARCHAR(50) NOT NULL,
  harga_min BIGINT NULL,
  harga_max BIGINT NULL,
  satuan_harga VARCHAR(100) NULL,
  harga_status VARCHAR(50) NOT NULL,
  sumber_harga TEXT NULL,
  tanggal_cek_harga DATE NULL,
  kandungan TEXT NULL,
  fungsi TEXT NULL,
  keunggulan TEXT NULL,
  catatan_penggunaan TEXT NULL,
  image_path VARCHAR(255) NULL,
  status ENUM('aktif','nonaktif') DEFAULT 'aktif',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL
);
```

## 7. Contoh seed SQL awal

```sql
INSERT INTO saprodi_items
(kategori, nama_item, nama_dagang, jenis_item, fase_penggunaan, satuan, harga_min, harga_max, satuan_harga, harga_status, sumber_harga, tanggal_cek_harga, kandungan, fungsi, image_path)
VALUES
('Pupuk & Nutrisi', 'Pupuk Urea', 'Urea Subsidi', 'Pupuk Makro Tunggal', 'Vegetatif / Susulan', 'kg', 1800, 1800, 'kg', 'HET_SUBSIDI', 'https://www.pupuk-indonesia.com/media-info/article-detail/48/penerapan-het-2025-untuk-urea-npk-za-dan-pupuk-organik', '2026-06-16', 'N 46%; biuret 1%', 'Sumber nitrogen untuk pertumbuhan vegetatif tanaman', 'assets/img/saprodi/pupuk/pupuk-urea.jpg'),

('Pupuk & Nutrisi', 'Pupuk NPK Phonska', 'NPK Phonska', 'Pupuk Majemuk NPK', 'Dasar / Susulan', 'kg', 1840, 1840, 'kg', 'HET_SUBSIDI', 'https://distribution-branding.pupuk-indonesia.com/api/produk/6', '2026-06-16', 'N 15%; P2O5 10%; K2O 12%', 'Pupuk majemuk untuk hara N, P, dan K', 'assets/img/saprodi/pupuk/pupuk-npk-phonska.jpg'),

('Pupuk & Nutrisi', 'Pupuk SP-36', 'SP-36', 'Pupuk Fosfat', 'Pupuk Dasar', 'sak', 299750, 1162000, 'sak 50 kg', 'REFERENSI_MARKETPLACE', 'https://petrokimia-gresik.com/product/pupuk-sp-36; https://www.sikumis.com/brands/petrokimia-gresik', '2026-06-16', 'P2O5 total minimal 36%', 'Sumber fosfat untuk akar, pembungaan, dan pembentukan biji', 'assets/img/saprodi/pupuk/pupuk-sp36.jpg'),

('Pupuk & Nutrisi', 'Pupuk ZA', 'ZA', 'Pupuk Nitrogen + Sulfur', 'Vegetatif / Susulan', 'kg', 1360, 1360, 'kg', 'HET_SUBSIDI', 'https://petrokimia-gresik.com/product/pupuk-za', '2026-06-16', 'N minimal 20,8%; S minimal 23,8%', 'Sumber nitrogen dan sulfur', 'assets/img/saprodi/pupuk/pupuk-za.jpg'),

('Pupuk & Nutrisi', 'Pupuk KCl / MOP', 'KCl/MOP', 'Pupuk Kalium', 'Generatif / Pengisian Hasil', 'sak', 485000, 845000, 'sak 50 kg', 'REFERENSI_MARKETPLACE', 'https://pupukmahkota.co.id/produk/pupuk-tunggal-makro/kcl-kanada-id', '2026-06-16', 'K2O minimal 60%', 'Sumber kalium untuk pengisian hasil dan kualitas panen', 'assets/img/saprodi/pupuk/pupuk-kcl-mop.jpg'),

('Pupuk & Nutrisi', 'Pupuk ZK / Kalium Sulfat', 'ZK Petro', 'Pupuk Kalium + Sulfur', 'Generatif / Kualitas Hasil', 'kg', 16000, 23000, 'kg', 'REFERENSI_TOKO_RESMI', 'https://petrokimia-gresik.com/product/pupuk-zk; https://petromart.petrokimia-gresik.com/', '2026-06-16', 'K2O 50%; S 17%', 'Sumber kalium dan sulfur', 'assets/img/saprodi/pupuk/pupuk-zk.png'),

('Pupuk & Nutrisi', 'Pupuk Organik Granul', 'Petroganik', 'Pupuk Organik Padat', 'Pra-tanam / Dasar', 'kg', 640, 640, 'kg', 'HET_SUBSIDI', 'https://distribution-branding.pupuk-indonesia.com/api/produk/15', '2026-06-16', 'pH 4-9; C-organik 15%; kadar air 8-20%; C/N 15-25', 'Membantu memperbaiki kondisi tanah', 'assets/img/saprodi/pupuk/pupuk-organik-granul.jpg'),

('Pupuk & Nutrisi', 'Pupuk Kandang', 'Pupuk Kandang Matang', 'Pupuk Organik', 'Pra-tanam / Dasar', 'kemasan', 18000, 172500, 'kemasan bervariasi / 50 kg', 'PERLU_VERIFIKASI_LOKAL', 'https://www.blibli.com/jual/pupuk-kandang; https://floria.id/jual/pupuk', '2026-06-16', 'Bahan organik dari kotoran ternak matang/terfermentasi', 'Menambah bahan organik dan memperbaiki struktur tanah', 'assets/img/saprodi/pupuk/pupuk-kandang.jpg'),

('Pupuk & Nutrisi', 'Pupuk Kompos', 'Kompos', 'Pupuk Organik', 'Pra-tanam / Dasar', 'sak', 66600, 66600, 'sak 50 kg', 'REFERENSI_MARKETPLACE', 'https://www.mbizmarket.co.id/catalog/detail/pupuk-kompos-50-kg-2550710-5453242.html', '2026-06-16', 'Bahan organik terdekomposisi', 'Pembenah tanah dan sumber bahan organik', 'assets/img/saprodi/pupuk/pupuk-kompos.jpg'),

('Pembenah Tanah', 'Dolomit / Kapur Pertanian', 'Dolomit', 'Pembenah Tanah', 'Pra-tanam', 'sak', 33300, 82500, 'sak 50 kg', 'REFERENSI_MARKETPLACE', 'https://siplah.blibli.com/product/kapur-pertanian-dolomit-50-kg/SBTS-0027-00016', '2026-06-16', 'Kapur/dolomit untuk tanah masam', 'Membantu menaikkan pH tanah masam', 'assets/img/saprodi/pupuk/dolomit-kapur-pertanian.jpg'),

('Pupuk & Nutrisi', 'Pupuk Hayati Rhizobium', 'Rhizobium Kacang dan Kedelai', 'Pupuk Hayati', 'Perlakuan Benih / Pra-tanam', 'pcs', 15000, 15000, 'pcs 40 g', 'REFERENSI_MARKETPLACE', 'https://www.sikumis.com/produk/rhizobium-kacang-dan-kedelai-40-g', '2026-06-16', 'Inokulan Rhizobium untuk legum', 'Membantu fiksasi nitrogen pada kedelai', 'assets/img/saprodi/pupuk/pupuk-hayati-rhizobium.jpg'),

('Pupuk & Nutrisi', 'Pupuk Organik Cair', 'Phonska OCA Plus', 'Pupuk Organik Cair', 'Vegetatif / Generatif', 'botol', 114000, 120000, 'botol 1 liter', 'REFERENSI_TOKO_RESMI', 'https://petromart.petrokimia-gresik.com/', '2026-06-16', 'C-organik, hara makro NPK, mikro, dan mikroba tergantung produk', 'Nutrisi cair tambahan; gunakan sesuai label produk', 'assets/img/saprodi/pupuk/pupuk-organik-cair.jpg');
```

## 8. Kesimpulan implementasi untuk AgroTrack

Untuk MVP AgroTrack, item yang paling aman dan kuat secara data adalah:

1. Urea — harga HET dan spesifikasi jelas.
2. NPK Phonska — harga HET dan spesifikasi jelas.
3. ZA — harga HET dan spesifikasi jelas.
4. Petroganik/Organik Granul — harga HET dan spesifikasi jelas.
5. SP-36 — spesifikasi jelas, harga harus status marketplace/non-subsidi.
6. KCl/MOP — spesifikasi jelas, harga marketplace bervariasi.
7. ZK — spesifikasi jelas, harga eceran/tonase tersedia tapi bervariasi.
8. Dolomit — sangat relevan sebagai pembenah tanah, harga marketplace bervariasi.
9. Rhizobium — sangat relevan untuk kedelai, harga 40 g tersedia.
10. POC — harga resmi Petromart tersedia, spesifikasi perlu mengikuti label produk.
11. Kompos dan pupuk kandang — realistis, tetapi harga paling lokal dan harus editable.

Standar UI yang paling jujur:

```text
Harga acuan, bukan harga final. Harga dapat berubah tergantung status subsidi, lokasi, ukuran kemasan, ongkir, dan toko. Gunakan rekomendasi pemupukan setempat untuk dosis.
```
