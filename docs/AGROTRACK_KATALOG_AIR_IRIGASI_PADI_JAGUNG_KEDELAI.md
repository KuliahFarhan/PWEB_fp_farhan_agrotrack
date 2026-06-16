# AgroTrack — Katalog Air & Irigasi untuk Padi, Jagung, dan Kedelai

**Versi:** 1.0  
**Tanggal penyusunan:** 16 Juni 2026  
**Kategori:** Air & Irigasi  
**Target komoditas:** Padi, Jagung, Kedelai  
**Fungsi dokumen:** Referensi seed database, UI katalog saprodi/operasional, dan card asset AgroTrack.

---

## 1. Catatan Utama: Kategori Ini Berbeda dari Benih/Pupuk/Pestisida

Item **Air & Irigasi** tidak selalu habis sekali pakai. Ada beberapa pola biaya:

1. **Beli baru / aset tetap**  
   Contoh: pompa air, pipa, selang. Biaya besar di awal, lalu dipakai beberapa musim. Untuk aplikasi, lebih realistis jika bisa dicatat sebagai:
   - biaya penuh saat beli, atau
   - biaya penyusutan per musim.

2. **Sewa / jasa pakai**  
   Contoh: sewa pompa air per hari, jasa pompa + operator. Biaya hanya muncul saat dipakai.

3. **Sudah punya / milik sendiri**  
   Contoh: petani sudah punya pompa atau selang. Biaya musim itu bukan harga beli, tetapi:
   - BBM/listrik,
   - oli/perawatan,
   - servis,
   - penyusutan opsional.

4. **Iuran / biaya kolektif**  
   Contoh: iuran irigasi desa/kelompok tani, iuran perawatan saluran, gotong royong saluran.

5. **Biaya manual / lokal**  
   Contoh: perbaikan parit, normalisasi drainase, pengerukan saluran. Harga sangat bergantung lokasi dan sistem kerja, jadi sebaiknya input manual.

Sumber konsep irigasi: BBWS Mesuji Sekampung menjelaskan jaringan irigasi sebagai sistem saluran, bangunan, dan pelengkap untuk menyediakan, membagikan, serta mengalirkan air dari sumber ke lahan pertanian.  
https://sda.pu.go.id/balai/bbwsmesujisekampung/pages/posts/mengenal-jaringan-irigasi-menuju-swasembada-pangan-1761553763

---

## 2. Asset yang Sudah Disiapkan

| No | Nama File Asset | Nama Item UI | Status |
|---:|---|---|---|
| 1 | `irigasi-pompa-air.jpg` | Pompa Air Pertanian / Alkon | Siap pakai |
| 2 | `irigasi-selang.jpg` | Selang Irigasi / Selang Buang Pompa | Siap pakai |
| 3 | `irigasi-pipa.jpg` | Pipa Irigasi PVC/HDPE | Siap pakai |
| 4 | `irigasi-saluran-sawah.jpg` | Saluran Irigasi Sawah | Siap pakai |
| 5 | `irigasi-drainase-parit.jpg` | Drainase / Parit Lahan | Siap pakai |
| 6 | `irigasi-bahan-bakar-pompa.jpg` | Bahan Bakar Pompa Air | Siap pakai |

Rekomendasi folder:

```text
assets/img/saprodi/air-irigasi/
```

---

## 3. Model Biaya yang Disarankan untuk UI AgroTrack

### 3.1 Opsi Mode Biaya

Setiap item Air & Irigasi sebaiknya punya field `mode_biaya`:

```text
beli_baru
sewa
milik_sendiri
pinjam_kelompok
iuran
jasa
bahan_habis_pakai
input_manual
```

### 3.2 Rumus Biaya

| Mode | Rumus biaya yang masuk musim tanam | Cocok untuk |
|---|---|---|
| Beli baru, dicatat penuh | `biaya = harga_beli` | Jika user ingin semua cash-out dicatat langsung |
| Beli baru, disusutkan | `biaya_per_musim = harga_beli / umur_pakai_musim` | Pompa, pipa, selang |
| Sewa | `biaya = tarif_sewa_per_hari × jumlah_hari` | Pompa, jasa irigasi |
| Milik sendiri | `biaya = BBM/listrik + oli + servis + penyusutan opsional` | Pompa milik petani |
| Pinjam kelompok | `biaya = iuran/pengganti BBM/biaya operator` | Pompa kelompok tani |
| Iuran | `biaya = iuran_irigasi_per_musim` | Saluran sawah/jaringan air |
| Bahan habis pakai | `biaya = jumlah_liter × harga_per_liter` | BBM pompa |
| Input manual | `biaya = input petani/admin` | Drainase/parit/perbaikan saluran |

### 3.3 Kenapa Perlu Model Ini?

Kalau semua item dipaksa jadi “harga item”, data akan salah. Contoh:

- **Pompa air** bisa dibeli Rp1,3 juta–Rp7 juta lebih, tetapi jika sudah punya, biaya musim ini mungkin hanya bensin dan servis.
- **Selang** bisa dibeli sekali dan dipakai berulang.
- **Saluran sawah** bukan barang yang dibeli, melainkan infrastruktur dan biasanya terkait iuran/perawatan.
- **Drainase/parit** sering berupa pekerjaan fisik lokal, bukan produk dengan harga tetap.

---

## 4. Ringkasan Katalog Air & Irigasi

| No | Item | File Asset | Jenis Biaya | Fase | Relevan untuk | Harga Referensi | Status Harga |
|---:|---|---|---|---|---|---:|---|
| 1 | Pompa Air Pertanian / Alkon | `irigasi-pompa-air.jpg` | Aset / sewa / milik sendiri | Pra-tanam, vegetatif, generatif | Padi, Jagung, Kedelai | Beli ±Rp1.300.000–Rp7.347.750; sewa ±Rp100.000–Rp400.000/hari pada jasa umum | TERVERIFIKASI_MARKETPLACE_DAN_JASA |
| 2 | Selang Irigasi / Selang Buang Pompa | `irigasi-selang.jpg` | Aset ringan / perlengkapan | Saat irigasi | Padi, Jagung, Kedelai | ±Rp65.000–Rp765.000/50 m tergantung bahan/tebal/merek | TERVERIFIKASI_MARKETPLACE |
| 3 | Pipa Irigasi PVC/HDPE | `irigasi-pipa.jpg` | Aset/infrastruktur kecil | Pra-tanam / instalasi | Padi, Jagung, Kedelai | HDPE roll 100 m ±Rp497.250–Rp701.219; pipa 2 inch referensi ±Rp62.600/m | TERVERIFIKASI_MARKETPLACE_DAN_DISTRIBUTOR |
| 4 | Saluran Irigasi Sawah | `irigasi-saluran-sawah.jpg` | Iuran / perawatan / infrastruktur | Sepanjang musim | Padi terutama, juga jagung/kedelai di lahan irigasi | Input manual | INPUT_MANUAL_LOKAL |
| 5 | Drainase / Parit Lahan | `irigasi-drainase-parit.jpg` | Jasa / tenaga kerja / perawatan | Pra-tanam dan saat hujan berlebih | Padi, Jagung, Kedelai | Input manual | INPUT_MANUAL_LOKAL |
| 6 | Bahan Bakar Pompa Air | `irigasi-bahan-bakar-pompa.jpg` | Bahan habis pakai | Setiap penggunaan pompa | Padi, Jagung, Kedelai | Solar subsidi ±Rp6.800/L; Pertalite ±Rp10.000/L; Pertamax menyesuaikan wilayah/periode | HARGA_BBM_DINAMIS |

---

## 5. Detail Item Katalog

### 5.1 Pompa Air Pertanian / Alkon

| Field | Isi |
|---|---|
| Nama UI | Pompa Air Pertanian / Alkon |
| Nama file | `irigasi-pompa-air.jpg` |
| Kategori | Air & Irigasi |
| Tipe item | Aset alat / sewa / jasa |
| Fase penggunaan | Pra-tanam, awal pertumbuhan, vegetatif, generatif, kondisi kering |
| Relevan untuk | Padi, Jagung, Kedelai |
| Mode biaya | `beli_baru`, `sewa`, `milik_sendiri`, `pinjam_kelompok`, `jasa` |
| Harga beli referensi | ±Rp1.300.000–Rp7.347.750 untuk pompa 2 inch, tergantung merek dan spesifikasi |
| Harga sewa referensi | ±Rp100.000–Rp400.000/hari untuk jasa sewa umum; data lama Antara 2012 menyebut Rp20.000/hari + BBM Rp60.000–80.000/hari untuk konteks pedesaan saat itu |
| Status harga | TERVERIFIKASI_MARKETPLACE_DAN_JASA |
| Fungsi utama | Mengangkat/memindahkan air dari sungai, sumur, embung, parit, atau sumber lain ke lahan |
| Keunggulan | Sangat penting saat kemarau atau saat jaringan irigasi tidak cukup |
| Risiko/keterbatasan | Perlu BBM/listrik, operator, selang/pipa, perawatan, dan akses sumber air |
| Catatan UI | Jangan hanya tampilkan “harga pompa”; tampilkan opsi “beli/sewa/sudah punya” |

#### Opsi Biaya UI

```text
Mode 1 — Beli baru:
Harga beli pompa = Rp x
Umur pakai estimasi = y musim
Biaya musim ini = Rp x / y

Mode 2 — Sewa:
Tarif sewa per hari = Rp x
Jumlah hari pakai = y
Biaya musim ini = Rp x * y

Mode 3 — Milik sendiri:
BBM = liter * harga/liter
Servis/oli = input manual
Penyusutan = opsional
```

#### Deskripsi Card UI

> Pompa air digunakan untuk mengalirkan air dari sumber air ke lahan saat kebutuhan irigasi tidak tercukupi. Biaya dapat dicatat sebagai beli baru, sewa, milik sendiri, atau pinjam dari kelompok tani.

#### Sumber
- Harga pompa 2 inch Blibli: https://www.blibli.com/jual/pompa-air-bensin-2-inch  
- Harga pompa 2 inch Blibli/Alkon: https://www.blibli.com/jual/pompa-air-alkon-2-inch  
- Harga pompa 2 inch Lazada: https://www.lazada.co.id/catalog/?q=mesin+pompa+air+2+inc  
- Harga pompa 2 inch Shopee: https://shopee.co.id/search?keyword=pompa+alkon+2+inch  
- Harga PaDi UMKM Honda GX 160 2 inch: https://padiumkm.id/product/mesin-pompa-air-sawah-irigasi-alkon-water-pump-honda-gx-160-2-inch-2/65fac2f6aeba559677c858b7  
- Harga sewa umum: https://floristjogja.co.id/sewa-pompa-air-jogja/  
- Data sewa pedesaan lama/arsip Antara: https://www.antarafoto.com/id/view/244798/sewa-mesin-pompa-air

---

### 5.2 Selang Irigasi / Selang Buang Pompa

| Field | Isi |
|---|---|
| Nama UI | Selang Irigasi / Selang Buang Pompa |
| Nama file | `irigasi-selang.jpg` |
| Kategori | Air & Irigasi |
| Tipe item | Aset ringan / perlengkapan pompa |
| Fase penggunaan | Saat irigasi/pompa digunakan |
| Relevan untuk | Padi, Jagung, Kedelai |
| Mode biaya | `beli_baru`, `milik_sendiri`, `pinjam_kelompok` |
| Harga referensi | ±Rp65.000–Rp765.000 per 50 m, tergantung jenis PE, terpal, sunny hose, tebal, dan merek |
| Status harga | TERVERIFIKASI_MARKETPLACE |
| Fungsi utama | Menyalurkan air dari pompa ke petakan/lahan |
| Keunggulan | Lebih fleksibel daripada pipa permanen; mudah dipindah |
| Risiko/keterbatasan | Bisa bocor, robek, terlipat, atau aus karena panas/matahari |
| Catatan UI | Satuan terbaik: roll 50 m atau meter; beri field panjang selang |

#### Opsi Biaya UI

```text
Beli baru:
Biaya = harga roll / meter

Milik sendiri:
Biaya musim ini = 0 atau biaya perbaikan/penambalan

Pinjam:
Biaya = iuran/pengganti kerusakan jika ada
```

#### Deskripsi Card UI

> Selang irigasi digunakan sebagai saluran fleksibel dari pompa menuju lahan. Cocok untuk petani yang sering memindahkan titik pengairan antarpetakan.

#### Sumber
- Selang irigasi 2 inch 50 m Purotani, spesifikasi PE murni, waterproof, sunproof, panjang 50 m: https://purotani.id/product/selang-drip-selang-irigasi-selang-irigasi-2-inch-2-dim-50-meter/  
- Shopee selang 2 inch 50 m Rp429.900: https://shopee.co.id/50-Meter-1-Roll-2-Selang-Karet-Irigasi-Pompa-Sawah-2-50M-KATO-1-ROLL-Selang-Karet-2Inch-KATO-2-Inch-50-Meter-Sunny-Hose-Selang-Buang-3x50M-%28TERMURAH%29-i.59266652.15694471276  
- Lazada selang irigasi 2 inch 50 m mulai Rp65.000: https://www.lazada.co.id/tag/selang-irigasi-2-inch-50-meter/  
- Blibli selang drip 2 inch 50 m Rp115.000: https://www.blibli.com/p/selang-drip-selang-irigasi-putih-2-inch-panjang-50-meter-tebal-200-mikron/ps--WOI-60027-01958  
- Blibli selang buang irigasi 2 inch, contoh 50 m Rp425.000–765.000: https://www.blibli.com/jual/selang-buang-irigasi-2

---

### 5.3 Pipa Irigasi PVC/HDPE

| Field | Isi |
|---|---|
| Nama UI | Pipa Irigasi PVC/HDPE |
| Nama file | `irigasi-pipa.jpg` |
| Kategori | Air & Irigasi |
| Tipe item | Aset/infrastruktur kecil |
| Fase penggunaan | Instalasi pra-tanam atau perbaikan sistem air |
| Relevan untuk | Padi, Jagung, Kedelai |
| Mode biaya | `beli_baru`, `milik_sendiri`, `iuran`, `jasa_instalasi` |
| Harga referensi | Roll 100 m: ±Rp497.250 untuk 3/4 inch dan ±Rp701.219 untuk 1 inch pada contoh Lazada; referensi distributor HDPE 2 inch ±Rp62.600/m |
| Status harga | TERVERIFIKASI_MARKETPLACE_DAN_DISTRIBUTOR |
| Fungsi utama | Menyalurkan air lebih permanen/stabil dibanding selang fleksibel |
| Keunggulan | Lebih tahan lama, cocok untuk jalur air semi permanen |
| Risiko/keterbatasan | Biaya awal lebih tinggi; perlu sambungan/fitting; kurang fleksibel dibanding selang |
| Catatan UI | Field penting: diameter, panjang, jenis pipa, dan biaya fitting |

#### Opsi Biaya UI

```text
Beli pipa:
Biaya = harga_per_meter * panjang_meter + fitting + jasa pasang

Milik sendiri:
Biaya musim ini = perbaikan/sambungan bocor

Iuran:
Biaya = bagian biaya kolektif instalasi pipa kelompok tani
```

#### Deskripsi Card UI

> Pipa irigasi digunakan untuk membuat jalur air yang lebih rapi dan semi permanen. Cocok untuk lahan yang rutin membutuhkan pengairan dari titik sumber air yang sama.

#### Sumber
- Lazada pipa plastik/HDPE pertanian: https://www.lazada.co.id/tag/pipa-plastik-pertanian/  
- Daftar harga pipa HDPE per meter Alia Jaya: https://aliajaya.co.id/pipa-hdpe/  
- Marketplace pipa HDPE Facebook Surabaya, indikasi harga sangat lokal: https://www.facebook.com/marketplace/item/1279217417714788/

---

### 5.4 Saluran Irigasi Sawah

| Field | Isi |
|---|---|
| Nama UI | Saluran Irigasi Sawah |
| Nama file | `irigasi-saluran-sawah.jpg` |
| Kategori | Air & Irigasi |
| Tipe item | Infrastruktur / iuran / perawatan |
| Fase penggunaan | Sepanjang musim, terutama pra-tanam dan fase butuh air |
| Relevan untuk | Padi paling kuat; jagung/kedelai jika lahan memakai irigasi |
| Mode biaya | `iuran`, `gotong_royong`, `jasa`, `input_manual` |
| Harga referensi | Tidak ada harga nasional yang stabil; input manual sesuai iuran desa/kelompok/daerah |
| Status harga | INPUT_MANUAL_LOKAL |
| Fungsi utama | Mengalirkan air dari sumber/jaringan ke petakan lahan |
| Keunggulan | Menjamin pasokan air lebih stabil tanpa selalu memakai pompa |
| Risiko/keterbatasan | Tergantung jadwal air, kondisi saluran, pembagian antarpetani, dan musim |
| Catatan UI | Jangan minta “harga barang”; minta “iuran/perawatan/jasa normalisasi” |

#### Opsi Biaya UI

```text
Iuran air:
Biaya = iuran per musim / per bulan / per periode

Gotong royong:
Biaya = konsumsi + upah tambahan jika ada

Perbaikan saluran:
Biaya = bahan + upah + transportasi
```

#### Deskripsi Card UI

> Saluran irigasi sawah adalah jalur air yang mengalirkan air dari sumber atau jaringan irigasi ke lahan. Di AgroTrack, item ini lebih cocok dicatat sebagai iuran, perawatan, atau biaya normalisasi saluran, bukan sebagai barang beli.

#### Sumber
- Konsep jaringan irigasi dari BBWS Mesuji Sekampung: https://sda.pu.go.id/balai/bbwsmesujisekampung/pages/posts/mengenal-jaringan-irigasi-menuju-swasembada-pangan-1761553763  
- Pengelolaan air penting untuk padi, jagung, dan kedelai; kebutuhan air padi tertinggi dan kedelai terendah dalam studi rotasi tanaman: https://jurnal.unmuhjember.ac.id/index.php/PENELITIAN_IPTEKS/article/view/5110  
- Irigasi suplementer lahan kering, contoh kebutuhan padi, jagung, kedelai: https://repository.ut.ac.id/2619/1/fmipa2013_d6_nanihsawiyonpujilestari_1.pdf

---

### 5.5 Drainase / Parit Lahan

| Field | Isi |
|---|---|
| Nama UI | Drainase / Parit Lahan |
| Nama file | `irigasi-drainase-parit.jpg` |
| Kategori | Air & Irigasi |
| Tipe item | Infrastruktur kecil / jasa / tenaga kerja |
| Fase penggunaan | Pra-tanam, musim hujan, fase rawan genangan |
| Relevan untuk | Padi, Jagung, Kedelai; jagung/kedelai lebih sensitif terhadap genangan |
| Mode biaya | `jasa`, `tenaga_kerja`, `input_manual`, `gotong_royong` |
| Harga referensi | Input manual; tidak ada harga nasional yang stabil |
| Status harga | INPUT_MANUAL_LOKAL |
| Fungsi utama | Mengalirkan kelebihan air agar lahan tidak tergenang berlebihan |
| Keunggulan | Penting untuk mengurangi risiko busuk akar, genangan, dan gangguan pertumbuhan |
| Risiko/keterbatasan | Biaya tergantung panjang parit, kedalaman, alat, tenaga, dan kondisi tanah |
| Catatan UI | Cocok sebagai aktivitas operasional, bukan produk |

#### Opsi Biaya UI

```text
Buat/perbaiki parit:
Biaya = upah tenaga kerja + sewa alat jika ada + bahan pendukung

Gotong royong:
Biaya = konsumsi/iuran kelompok jika ada

Milik sendiri/manual:
Biaya = 0 atau catatan aktivitas saja
```

#### Deskripsi Card UI

> Drainase atau parit lahan digunakan untuk membuang kelebihan air. Item ini penting terutama pada jagung dan kedelai yang tidak tahan genangan lama, serta padi pada fase tertentu saat perlu pengaturan air.

#### Sumber
- Konsep irigasi dan drainase sebagai bagian pengelolaan air: https://repositori.kemendikdasmen.go.id/10226/1/Irigasi%20dan%20drainase%204.pdf  
- Kedelai membutuhkan air cukup tetapi kondisi lahan harus dijaga agar tidak kekeringan dan tidak tergenang pada fase berbunga/pembentukan polong/biji: https://ppid.kemendagri.go.id/storage/dokumen/N5QaYQ0v0jyKYdmt0XrbXHzd7GrsnqQdLVU7oj3j.pdf  
- Jagung membutuhkan air cukup terutama pada fase pembungaan dan pengisian biji: https://www.corteva.com/id/berita/Cara-Menanam-Jagung-Agar-Hasil-Mencapai-8-10-Ton-Ha.html

---

### 5.6 Bahan Bakar Pompa Air

| Field | Isi |
|---|---|
| Nama UI | Bahan Bakar Pompa Air |
| Nama file | `irigasi-bahan-bakar-pompa.jpg` |
| Kategori | Air & Irigasi |
| Tipe item | Bahan habis pakai / operasional |
| Fase penggunaan | Setiap kali pompa digunakan |
| Relevan untuk | Padi, Jagung, Kedelai |
| Mode biaya | `bahan_habis_pakai` |
| Harga referensi | Solar subsidi sekitar Rp6.800/L; Pertalite sekitar Rp10.000/L; Pertamax berubah mengikuti wilayah/periode |
| Status harga | HARGA_BBM_DINAMIS |
| Fungsi utama | Biaya operasional pompa berbahan bakar bensin/solar |
| Keunggulan | Komponen biaya nyata yang sering muncul saat musim kering |
| Risiko/keterbatasan | Harga berubah, jenis BBM tergantung mesin, dan konsumsi BBM tergantung kapasitas pompa/durasi |
| Catatan UI | Jangan hardcode; admin/user harus bisa update harga BBM |

#### Opsi Biaya UI

```text
Biaya BBM = liter_pakai × harga_per_liter
Total biaya pompa = biaya BBM + sewa pompa + operator + servis/oli
```

#### Deskripsi Card UI

> Bahan bakar pompa adalah biaya operasional yang muncul setiap kali pompa digunakan. Biaya ini sebaiknya dihitung dari jumlah liter BBM dikalikan harga per liter, bukan harga tetap per musim.

#### Sumber
- Pertamina Patra Niaga — halaman harga BBM terbaru: https://pertaminapatraniaga.com/page/harga-terbaru-bbm  
- Reuters, 10 Juni 2026: Pertamax naik dari Rp12.300 menjadi Rp16.250/L; Pertamax Green dari Rp12.900 menjadi Rp17.000/L; Pertalite subsidi tetap tidak berubah. https://www.reuters.com/business/energy/indonesia-raises-price-widely-used-fuel-by-32-adds-cost-of-living-concerns-2026-06-10/  
- CNN Indonesia, 1 Juni 2026: Pertalite Rp10.000/L dan Solar subsidi Rp6.800/L pada awal Juni 2026. https://www.cnnindonesia.com/ekonomi/20260531225743-85-1364005/daftar-harga-bbm-pertamina-per-1-juni-2026-pertamax-turbo-naik

---

## 6. Relevansi per Tanaman dan Fase

| Item | Padi | Jagung | Kedelai | Fase paling relevan |
|---|---|---|---|---|
| Pompa Air | Sangat relevan saat air irigasi kurang | Relevan pada kemarau/fase kritis | Relevan saat kekeringan | Pra-tanam, awal, vegetatif, generatif |
| Selang Irigasi | Relevan untuk pengairan sawah dari pompa | Relevan untuk pengairan barisan/bedengan | Relevan untuk pengairan ringan | Saat pompa/penyiraman |
| Pipa Irigasi | Relevan untuk lahan berulang | Relevan untuk jalur semi permanen | Relevan untuk jalur semi permanen | Pra-tanam/instalasi |
| Saluran Sawah | Sangat relevan | Relevan jika lahan irigasi | Relevan jika lahan irigasi | Sepanjang musim |
| Drainase Parit | Relevan untuk pengaturan air | Sangat relevan agar tidak tergenang | Sangat relevan agar tidak tergenang | Pra-tanam/musim hujan |
| BBM Pompa | Relevan jika pakai pompa | Relevan jika pakai pompa | Relevan jika pakai pompa | Setiap penggunaan pompa |

Catatan:
- Padi membutuhkan pengelolaan air paling kuat dan sering terkait saluran sawah/pompa.
- Jagung membutuhkan air cukup terutama fase pembungaan dan pengisian biji.
- Kedelai membutuhkan air cukup terutama awal pertumbuhan, berbunga, pembentukan polong, dan pengisian biji, tetapi juga perlu menghindari genangan.

---

## 7. Rekomendasi UI AgroTrack

### 7.1 Card dengan Mode Biaya

Card Air & Irigasi sebaiknya punya tombol:

```text
[Tambahkan sebagai Beli Baru]
[Tambahkan sebagai Sewa]
[Saya Sudah Punya]
[Catat Biaya Operasional]
```

Contoh untuk pompa:

```text
Pompa Air Pertanian / Alkon
Jenis: Alat irigasi
Fase: Pra-tanam / Vegetatif / Generatif
Harga beli acuan: Rp1,3 juta – Rp7,3 juta
Opsi biaya:
- Beli baru
- Sewa harian
- Milik sendiri
- Pinjam kelompok tani
Tambahkan ke rencana operasional
```

### 7.2 Input Form yang Lebih Realistis

Untuk item seperti pompa, form jangan hanya `nominal`. Gunakan:

```text
mode_biaya
harga_beli
umur_pakai_musim
tarif_sewa_per_hari
jumlah_hari_pakai
liter_bbm
harga_bbm_per_liter
biaya_operator
biaya_servis
catatan
```

Untuk item saluran/parit:

```text
jenis_pekerjaan
panjang_meter
jumlah_tenaga_kerja
upah_total
biaya_bahan
iuran_kelompok
catatan
```

### 7.3 Badge UI

| Badge | Makna |
|---|---|
| `Aset` | Barang tahan lama |
| `Sewa` | Bisa dicatat sebagai biaya sewa |
| `Milik sendiri` | Biaya utama adalah operasional/perawatan |
| `Habis pakai` | Bahan yang habis digunakan, contoh BBM |
| `Input lokal` | Harga sangat bergantung daerah |
| `Fase kritis air` | Relevan pada fase tanaman tertentu |

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
  tipe_item ENUM('barang_habis','aset','jasa','infrastruktur','iuran','operasional') NOT NULL DEFAULT 'barang_habis',
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

### 8.2 Tabel Catatan Biaya Operasional

```sql
CREATE TABLE IF NOT EXISTS biaya_operasional_irigasi (
  id INT AUTO_INCREMENT PRIMARY KEY,
  musim_tanam_id INT NOT NULL,
  saprodi_item_id INT NOT NULL,
  mode_biaya ENUM(
    'beli_baru',
    'sewa',
    'milik_sendiri',
    'pinjam_kelompok',
    'iuran',
    'jasa',
    'bahan_habis_pakai',
    'input_manual'
  ) NOT NULL,
  harga_beli DECIMAL(14,2) NULL,
  umur_pakai_musim INT NULL,
  biaya_penyusutan_musim DECIMAL(14,2) NULL,
  tarif_sewa_per_hari DECIMAL(14,2) NULL,
  jumlah_hari_pakai DECIMAL(8,2) NULL,
  liter_bbm DECIMAL(10,2) NULL,
  harga_bbm_per_liter DECIMAL(14,2) NULL,
  biaya_bbm DECIMAL(14,2) NULL,
  biaya_operator DECIMAL(14,2) NULL,
  biaya_servis DECIMAL(14,2) NULL,
  biaya_bahan DECIMAL(14,2) NULL,
  iuran DECIMAL(14,2) NULL,
  biaya_total DECIMAL(14,2) NOT NULL DEFAULT 0,
  tanggal_biaya DATE NULL,
  catatan TEXT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

### 8.3 Logika Hitung `biaya_total`

```text
beli_baru:
biaya_total = harga_beli
atau
biaya_total = harga_beli / umur_pakai_musim

sewa:
biaya_total = tarif_sewa_per_hari * jumlah_hari_pakai + biaya_operator + biaya_bbm

milik_sendiri:
biaya_total = biaya_bbm + biaya_servis + biaya_operator + biaya_penyusutan_musim

iuran:
biaya_total = iuran

bahan_habis_pakai:
biaya_total = liter_bbm * harga_bbm_per_liter

input_manual:
biaya_total = input user
```

---

## 9. Contoh SQL Seed

```sql
INSERT INTO saprodi_items
(kategori, subkategori, nama_item, nama_file_asset, tipe_item, fase_penggunaan, relevan_padi, relevan_jagung, relevan_kedelai, satuan_harga, harga_min, harga_max, harga_status, sumber_harga, tanggal_cek_harga, fungsi, keunggulan, keterbatasan, catatan_penggunaan)
VALUES
('Air & Irigasi','Alat Irigasi','Pompa Air Pertanian / Alkon','irigasi-pompa-air.jpg','aset','Pra-tanam / Vegetatif / Generatif',1,1,1,'unit / hari sewa',1300000,7347750,'TERVERIFIKASI_MARKETPLACE_DAN_JASA','Blibli, Lazada, Shopee, PaDi UMKM, FloristJogja, Antara Foto','2026-06-16','Mengalirkan air dari sumber ke lahan.','Penting saat kemarau atau irigasi tidak cukup.','Perlu BBM/listrik, operator, selang/pipa, dan perawatan.','Tampilkan mode beli/sewa/milik sendiri.'),

('Air & Irigasi','Perlengkapan Irigasi','Selang Irigasi / Selang Buang Pompa','irigasi-selang.jpg','aset','Saat irigasi',1,1,1,'roll 50 m',65000,765000,'TERVERIFIKASI_MARKETPLACE','Purotani, Shopee, Lazada, Blibli','2026-06-16','Menyalurkan air dari pompa ke lahan.','Fleksibel dan mudah dipindah.','Bisa bocor/robek/aus.','Field penting: panjang, diameter, bahan.'),

('Air & Irigasi','Pipa Irigasi','Pipa Irigasi PVC/HDPE','irigasi-pipa.jpg','infrastruktur','Pra-tanam / instalasi',1,1,1,'meter / roll',16200,62600,'TERVERIFIKASI_MARKETPLACE_DAN_DISTRIBUTOR','Lazada dan Alia Jaya','2026-06-16','Membuat jalur air semi permanen.','Lebih tahan lama daripada selang.','Butuh fitting dan instalasi.','Hitung berdasarkan panjang pipa dan diameter.'),

('Air & Irigasi','Jaringan Air','Saluran Irigasi Sawah','irigasi-saluran-sawah.jpg','iuran','Sepanjang musim',1,1,1,'input manual',NULL,NULL,'INPUT_MANUAL_LOKAL','BBWS Mesuji Sekampung, studi kebutuhan air tanaman','2026-06-16','Mengalirkan air dari jaringan/sumber ke petakan lahan.','Mengurangi ketergantungan pada pompa.','Tergantung jadwal air dan kondisi saluran.','Catat sebagai iuran/perawatan/normalisasi.'),

('Air & Irigasi','Drainase','Drainase / Parit Lahan','irigasi-drainase-parit.jpg','jasa','Pra-tanam / musim hujan',1,1,1,'input manual',NULL,NULL,'INPUT_MANUAL_LOKAL','Referensi irigasi-drainase dan pedoman kebutuhan air kedelai/jagung','2026-06-16','Membuang kelebihan air agar lahan tidak tergenang.','Penting untuk jagung/kedelai dan pengaturan air padi.','Biaya sangat lokal tergantung panjang/kedalaman/tenaga.','Catat sebagai pekerjaan operasional.'),

('Air & Irigasi','Bahan Habis Pakai','Bahan Bakar Pompa Air','irigasi-bahan-bakar-pompa.jpg','operasional','Setiap penggunaan pompa',1,1,1,'liter',6800,16250,'HARGA_BBM_DINAMIS','Pertamina Patra Niaga, Reuters, CNN Indonesia','2026-06-16','Biaya operasional pompa berbahan bakar bensin/solar.','Membuat biaya pompa lebih realistis.','Harga berubah dan tergantung jenis BBM/mesin.','Hitung liter x harga per liter.');
```

---

## 10. Rekomendasi MVP AgroTrack

Untuk MVP, urutan implementasi paling masuk akal:

1. **Pompa Air**  
   Wajib karena mudah dipahami dan kuat untuk narasi musim kering.

2. **Bahan Bakar Pompa**  
   Wajib karena membuat biaya pompa realistis.

3. **Selang Irigasi**  
   Wajib sebagai perlengkapan pompa.

4. **Saluran Irigasi Sawah**  
   Wajib untuk padi dan biaya iuran/perawatan.

5. **Drainase Parit**  
   Penting untuk jagung/kedelai dan pengaturan air.

6. **Pipa Irigasi**  
   Tambahan kuat, tapi bisa setelah UI mode biaya siap.

---

## 11. Referensi Utama

1. BBWS Mesuji Sekampung — Mengenal Jaringan Irigasi.  
   https://sda.pu.go.id/balai/bbwsmesujisekampung/pages/posts/mengenal-jaringan-irigasi-menuju-swasembada-pangan-1761553763

2. Jalil, A. — Pendugaan kebutuhan air padi, jagung, kedelai.  
   https://jurnal.unmuhjember.ac.id/index.php/PENELITIAN_IPTEKS/article/view/5110

3. Repository UT — Irigasi suplementer lahan kering.  
   https://repository.ut.ac.id/2619/1/fmipa2013_d6_nanihsawiyonpujilestari_1.pdf

4. Jogja Benih — Pengelolaan Air dalam Budidaya Jagung.  
   https://jogjabenih.jogjaprov.go.id/read/6cc002ebbec5bdcc21c3b549d01e736da911b3244809dd183b33ee81a79efcdc3288

5. Corteva — Fase pembungaan dan pengisian biji jagung perlu air cukup.  
   https://www.corteva.com/id/berita/Cara-Menanam-Jagung-Agar-Hasil-Mencapai-8-10-Ton-Ha.html

6. Pedoman PHT Kedelai — Fase berbunga dan pembentukan polong/biji membutuhkan air cukup.  
   https://ppid.kemendagri.go.id/storage/dokumen/N5QaYQ0v0jyKYdmt0XrbXHzd7GrsnqQdLVU7oj3j.pdf

7. Pompa air 2 inch Blibli.  
   https://www.blibli.com/jual/pompa-air-bensin-2-inch

8. Pompa air alkon 2 inch Blibli.  
   https://www.blibli.com/jual/pompa-air-alkon-2-inch

9. Pompa air 2 inch Lazada.  
   https://www.lazada.co.id/catalog/?q=mesin+pompa+air+2+inc

10. Pompa alkon 2 inch Shopee.  
    https://shopee.co.id/search?keyword=pompa+alkon+2+inch

11. PaDi UMKM — Honda GX 160 2 inch.  
    https://padiumkm.id/product/mesin-pompa-air-sawah-irigasi-alkon-water-pump-honda-gx-160-2-inch-2/65fac2f6aeba559677c858b7

12. Harga sewa pompa air Jogja.  
    https://floristjogja.co.id/sewa-pompa-air-jogja/

13. Antara Foto — Sewa mesin pompa air, arsip 2012.  
    https://www.antarafoto.com/id/view/244798/sewa-mesin-pompa-air

14. Purotani — Selang irigasi 2 inch 50 meter.  
    https://purotani.id/product/selang-drip-selang-irigasi-selang-irigasi-2-inch-2-dim-50-meter/

15. Shopee — Selang karet irigasi 2 inch 50 meter.  
    https://shopee.co.id/50-Meter-1-Roll-2-Selang-Karet-Irigasi-Pompa-Sawah-2-50M-KATO-1-ROLL-Selang-Karet-2Inch-KATO-2-Inch-50-Meter-Sunny-Hose-Selang-Buang-3x50M-%28TERMURAH%29-i.59266652.15694471276

16. Lazada — Selang irigasi 2 inch 50 meter.  
    https://www.lazada.co.id/tag/selang-irigasi-2-inch-50-meter/

17. Blibli — Selang irigasi 2 inch 50 meter.  
    https://www.blibli.com/p/selang-drip-selang-irigasi-putih-2-inch-panjang-50-meter-tebal-200-mikron/ps--WOI-60027-01958

18. Lazada — Pipa plastik/HDPE pertanian.  
    https://www.lazada.co.id/tag/pipa-plastik-pertanian/

19. Alia Jaya — Daftar harga pipa HDPE per meter.  
    https://aliajaya.co.id/pipa-hdpe/

20. Pertamina Patra Niaga — Harga BBM terbaru.  
    https://pertaminapatraniaga.com/page/harga-terbaru-bbm

21. Reuters — Harga Pertamax naik 10 Juni 2026.  
    https://www.reuters.com/business/energy/indonesia-raises-price-widely-used-fuel-by-32-adds-cost-of-living-concerns-2026-06-10/

22. CNN Indonesia — Harga BBM 1 Juni 2026.  
    https://www.cnnindonesia.com/ekonomi/20260531225743-85-1364005/daftar-harga-bbm-pertamina-per-1-juni-2026-pertamax-turbo-naik
