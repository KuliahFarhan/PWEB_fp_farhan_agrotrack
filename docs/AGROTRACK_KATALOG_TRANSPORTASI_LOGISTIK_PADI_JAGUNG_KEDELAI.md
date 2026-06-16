# AgroTrack — Katalog Transportasi & Logistik untuk Padi, Jagung, dan Kedelai

**Versi:** 1.0  
**Tanggal penyusunan:** 16 Juni 2026  
**Kategori:** Transportasi & Logistik  
**Target komoditas:** Padi, Jagung, Kedelai  
**Fungsi dokumen:** Referensi seed database, UI katalog operasional, input biaya logistik, dan card asset AgroTrack.

---

## 1. Catatan Utama

Kategori **Transportasi & Logistik** mencatat biaya dan aktivitas setelah hasil dikumpulkan, yaitu memindahkan hasil dari lahan ke rumah, tempat jemur, gudang, penggilingan, pengepul, pasar, atau pembeli.

Kategori ini **harus dipisahkan** dari:

1. **Panen**  
   Panen = mengambil hasil dari tanaman/lahan.  
   Transportasi = memindahkan hasil dari lahan/titik kumpul ke lokasi lain.

2. **Pascapanen**  
   Pascapanen = jemur, perontokan, pemipilan, sortasi, pengemasan, simpan.  
   Logistik = kendaraan, bongkar muat, gudang, palet, jarak, rute, ongkir.

3. **Bahan Pendukung**  
   Karung, tali, terpal adalah bahan. Transportasi mencatat proses pengiriman dan biaya kendaraan/angkut.

4. **Tenaga Kerja**  
   Tenaga angkut bisa dicatat sebagai tenaga, tetapi di Transportasi konteksnya adalah bongkar muat, loading, unloading, dan pengiriman.

Transportasi sangat lokal. Harga tergantung:
- jarak,
- akses jalan lahan,
- jenis kendaraan,
- berat/volume hasil,
- jumlah trip,
- biaya BBM,
- tarif sopir,
- sistem borongan,
- kondisi panen/musim hujan,
- apakah kendaraan milik sendiri/sewa/pinjam/ojek tani.

Sumber:
- BPS menyediakan data biaya produksi per musim tanam per hektar untuk padi, jagung, dan kedelai, sehingga biaya logistik layak dicatat sebagai bagian operasional.  
  https://www.bps.go.id/id/statistics-table/1/MjA1NSMx/nilai-produksi-dan-biaya-produksi-per-musim-tanam-per-hektar-budidaya-tanaman-padi-sawah--padi-ladang--jagung--dan-kedelai--2017.html
- Harga sewa kendaraan logistik bersifat dinamis. Deliveree menyebut opsi sewa seharian dan point-to-point, sedangkan tarif truk engkel dapat bervariasi menurut jenis kendaraan, rute, dan lokasi.  
  https://www.deliveree.com/id/cek-ongkir/harga-sewa-pickup-harian-termurah/  
  https://www.deliveree.com/id/cek-ongkir/daftar-harga-sewa-truk-fuso-tronton-engkel/

---

## 2. Asset yang Sudah Disiapkan

| No | Nama File Asset | Nama Item UI | Status |
|---:|---|---|---|
| 1 | `transport-pickup-hasil-panen.jpg` | Pickup Hasil Panen | Siap pakai |
| 2 | `transport-motor-roda-tiga.jpg` | Motor Roda Tiga / Tosa | Siap pakai |
| 3 | `transport-gerobak-dorong.jpg` | Gerobak Dorong / Arco | Siap pakai |
| 4 | `transport-gudang-penyimpanan.jpg` | Gudang Penyimpanan Hasil | Siap pakai |
| 5 | `transport-bongkar-muat.jpg` | Bongkar Muat Hasil Panen | Siap pakai |

Asset tambahan dari folder lain yang juga relevan:

| Nama File Asset | Asal Folder | Fungsi |
|---|---|---|
| `tenaga-angkut-hasil.jpg` | `tenaga-kerja/` | Tenaga angkut manual |
| `bahan-karung-panen.jpg` | `bahan-pendukung/` | Kemasan hasil |
| `alat-timbangan-digital.jpg` | `alat-mesin/` | Validasi bobot |
| `bahan-terpal-jemur.jpg` | `bahan-pendukung/` | Penutup/alas sementara |
| `bahan-tali-rafia.jpg` | `bahan-pendukung/` | Pengikat karung/muatan |
| `bahan-jerigen.jpg` | `bahan-pendukung/` | BBM cadangan/kebutuhan cairan |

Rekomendasi folder:

```text
assets/img/saprodi/transportasi-logistik/
```

---

## 3. Ringkasan Item Transportasi & Logistik

| No | Item | File Asset | Fungsi | Komoditas | Mode Biaya Utama | Status Harga/Biaya |
|---:|---|---|---|---|---|---|
| 1 | Pickup Hasil Panen | `transport-pickup-hasil-panen.jpg` | Mengangkut hasil dari lahan/titik kumpul ke rumah/gudang/pembeli | Padi, Jagung, Kedelai | sewa, milik sendiri, per trip, per km, borongan | REFERENSI_JASA_DINAMIS |
| 2 | Motor Roda Tiga / Tosa | `transport-motor-roda-tiga.jpg` | Angkut hasil di akses sempit/jarak dekat | Padi, Jagung, Kedelai | per trip, sewa harian, milik sendiri, BBM | INPUT_MANUAL_LOKAL |
| 3 | Gerobak Dorong / Arco | `transport-gerobak-dorong.jpg` | Angkut pendek di lahan/gudang | Padi, Jagung, Kedelai | beli, milik sendiri, tenaga kerja | TERVERIFIKASI_MARKETPLACE |
| 4 | Gudang Penyimpanan Hasil | `transport-gudang-penyimpanan.jpg` | Simpan hasil sebelum jual/proses | Padi, Jagung, Kedelai | sewa, iuran, milik sendiri, input manual | INPUT_MANUAL_LOKAL |
| 5 | Bongkar Muat Hasil Panen | `transport-bongkar-muat.jpg` | Loading/unloading karung/hasil | Padi, Jagung, Kedelai | per karung, per trip, HOK, borongan | INPUT_MANUAL_LOKAL |
| 6 | Tenaga Angkut Hasil | `tenaga-angkut-hasil.jpg` | Angkut manual antartitik | Padi, Jagung, Kedelai | HOK, per karung, per trip | INPUT_MANUAL_LOKAL |
| 7 | Timbang & Serah Terima | `alat-timbangan-digital.jpg` | Validasi bobot saat transaksi/logistik | Padi, Jagung, Kedelai | jasa timbang, milik sendiri, pinjam | TERVERIFIKASI_MARKETPLACE |
| 8 | Biaya BBM/Operasional Kendaraan | `bahan-jerigen.jpg` | Biaya bahan bakar kendaraan/pompa logistik | Padi, Jagung, Kedelai | liter × harga BBM, input manual | HARGA_BBM_DINAMIS |

---

## 4. Detail Item Katalog

### 4.1 Pickup Hasil Panen

| Field | Isi |
|---|---|
| Nama UI | Pickup Hasil Panen |
| Nama file | `transport-pickup-hasil-panen.jpg` |
| Kategori | Transportasi & Logistik |
| Tipe item | Kendaraan/jasa angkut |
| Komoditas | Padi, Jagung, Kedelai |
| Mode biaya | `sewa_harian`, `per_trip`, `per_km`, `borongan`, `milik_sendiri`, `pinjam`, `input_manual` |
| Satuan | trip, km, hari, karung, ton |
| Fungsi | Mengangkut hasil panen dari lahan/titik kumpul ke rumah, gudang, penggilingan, pengepul, atau pembeli |
| Biaya yang mungkin masuk | Sewa kendaraan, sopir, BBM, bongkar muat, parkir, tol, iuran, biaya tunggu |
| Risiko/keterbatasan | Akses jalan sempit, jalan becek, kapasitas terbatas, biaya naik saat musim panen |
| Catatan UI | Harus bisa pilih “kendaraan sendiri” atau “sewa/jasa” |

Deskripsi card:

> Pickup digunakan untuk mengangkut hasil panen dari titik kumpul ke rumah, gudang, penggilingan, atau pembeli. Biaya dapat dihitung per trip, per km, sewa harian, atau borongan.

Sumber:
- Deliveree menjelaskan sewa pickup bisa seharian atau point-to-point, dengan durasi 10 jam di Jabodetabek dan 8 jam di daerah lain pada paket tertentu.  
  https://www.deliveree.com/id/cek-ongkir/harga-sewa-pickup-harian-termurah/
- TheLorry menyediakan paket sewa kendaraan seharian 10 jam dengan radius awal tertentu.  
  https://thelorry.com/id/sewa-harian/

---

### 4.2 Motor Roda Tiga / Tosa

| Field | Isi |
|---|---|
| Nama UI | Motor Roda Tiga / Tosa |
| Nama file | `transport-motor-roda-tiga.jpg` |
| Kategori | Transportasi & Logistik |
| Tipe item | Kendaraan kecil/jasa angkut |
| Komoditas | Padi, Jagung, Kedelai |
| Mode biaya | `per_trip`, `sewa_harian`, `milik_sendiri`, `pinjam_kelompok`, `bbm`, `input_manual` |
| Satuan | trip, hari, karung, km |
| Fungsi | Mengangkut hasil dari lahan kecil/akses sempit menuju jalan utama atau rumah |
| Biaya yang mungkin masuk | BBM, sopir/operator, sewa, perbaikan, bongkar muat |
| Risiko/keterbatasan | Kapasitas lebih kecil daripada pickup; tidak cocok untuk volume besar/jarak jauh |
| Catatan UI | Cocok untuk lahan dengan akses jalan kecil |

Deskripsi card:

> Motor roda tiga cocok untuk mengangkut hasil panen pada jalan sempit atau jarak pendek. Biaya sebaiknya dicatat per trip, sewa harian, atau BBM jika kendaraan milik sendiri.

Sumber:
- Harga logistik kendaraan kecil bersifat lokal; gunakan input manual di AgroTrack.
- Untuk pembanding layanan kendaraan seharian, lihat model layanan logistik harian dari Deliveree/TheLorry:  
  https://www.deliveree.com/id/cek-ongkir/harga-sewa-pickup-harian-termurah/  
  https://thelorry.com/id/sewa-harian/

---

### 4.3 Gerobak Dorong / Arco

| Field | Isi |
|---|---|
| Nama UI | Gerobak Dorong / Arco |
| Nama file | `transport-gerobak-dorong.jpg` |
| Kategori | Transportasi & Logistik |
| Tipe item | Alat angkut manual |
| Komoditas | Padi, Jagung, Kedelai |
| Mode biaya | `beli_baru`, `milik_sendiri`, `dipakai_ulang`, `tenaga_kerja`, `input_manual` |
| Satuan | unit, trip manual, karung |
| Fungsi | Mengangkut hasil jarak pendek di lahan, area jemur, atau gudang |
| Harga referensi | Gerobak sorong di marketplace bervariasi luas, tergantung merek/material/kapasitas |
| Risiko/keterbatasan | Bergantung tenaga manusia; kapasitas kecil; tidak cocok jarak jauh |
| Catatan UI | Bedakan biaya alat gerobak dengan upah tenaga yang mendorong/mengangkut |

Deskripsi card:

> Gerobak dorong digunakan untuk perpindahan hasil jarak pendek, misalnya dari petak ke titik kumpul, dari jemuran ke gudang, atau saat bongkar muat.

Sumber:
- Indotrading menampilkan kategori jual gerobak sorong dengan variasi tipe dan harga.  
  https://www.indotrading.com/jual-gerobak-sorong

---

### 4.4 Gudang Penyimpanan Hasil

| Field | Isi |
|---|---|
| Nama UI | Gudang Penyimpanan Hasil |
| Nama file | `transport-gudang-penyimpanan.jpg` |
| Kategori | Transportasi & Logistik |
| Tipe item | Penyimpanan/logistik |
| Komoditas | Padi, Jagung, Kedelai |
| Mode biaya | `sewa_gudang`, `iuran`, `milik_sendiri`, `pinjam_kelompok`, `input_manual` |
| Satuan | hari, minggu, bulan, karung, m², ton |
| Fungsi | Menyimpan hasil sementara sebelum dijual, digiling, dipipil, atau dikirim |
| Biaya yang mungkin masuk | Sewa gudang, iuran kelompok, palet/alas, tenaga susun, fumigasi/pengendalian hama jika ada |
| Risiko/keterbatasan | Kadar air tinggi menyebabkan jamur, hama gudang, mutu turun, dan susut |
| Catatan UI | Hubungkan dengan `kadar_air_akhir` dari Pascapanen |

Deskripsi card:

> Gudang penyimpanan digunakan untuk menahan hasil sementara sebelum dijual atau diproses. Penyimpanan harus mempertimbangkan kadar air, ventilasi, kebersihan, dan risiko hama.

Sumber:
- Penanganan gabah yang hati-hati diperlukan agar tidak kotor, berjamur, atau membusuk.  
  https://www.jurnalpangan.com/index.php/pangan/article/download/369/323/880
- Jagung aman disimpan pada kadar air sekitar 12–14% menurut beberapa rujukan pascapanen.  
  https://jurnal.polinela.ac.id/index.php/JFA/article/download/1110/760/2356

---

### 4.5 Bongkar Muat Hasil Panen

| Field | Isi |
|---|---|
| Nama UI | Bongkar Muat Hasil Panen |
| Nama file | `transport-bongkar-muat.jpg` |
| Kategori | Transportasi & Logistik |
| Tipe item | Tenaga kerja logistik |
| Komoditas | Padi, Jagung, Kedelai |
| Mode biaya | `per_karung`, `per_trip`, `hok`, `borongan`, `upah_harian`, `input_manual` |
| Satuan | karung, trip, kg, kuintal, ton, HOK |
| Fungsi | Memuat hasil ke kendaraan dan menurunkan hasil di rumah/gudang/pembeli |
| Biaya yang mungkin masuk | Upah bongkar, upah muat, konsumsi pekerja, biaya tambahan saat akses sulit |
| Risiko/keterbatasan | Karung rusak, hasil tercecer, tenaga terbatas, biaya naik saat panen raya |
| Catatan UI | Jangan digabung otomatis dengan biaya kendaraan; bisa satu paket atau terpisah |

Deskripsi card:

> Bongkar muat adalah tenaga kerja logistik untuk menaikkan dan menurunkan hasil panen. Tarif bisa per karung, per trip, harian, atau borongan.

---

### 4.6 Tenaga Angkut Hasil

| Field | Isi |
|---|---|
| Nama UI | Tenaga Angkut Hasil |
| Nama file | `tenaga-angkut-hasil.jpg` |
| Kategori | Transportasi & Logistik |
| Tipe item | Tenaga kerja angkut |
| Komoditas | Padi, Jagung, Kedelai |
| Mode biaya | `per_karung`, `per_trip`, `hok`, `borongan`, `tenaga_keluarga`, `input_manual` |
| Satuan | karung, trip, HOK, kg, kuintal |
| Fungsi | Mengangkut hasil secara manual antar titik saat kendaraan tidak bisa masuk langsung |
| Risiko/keterbatasan | Biaya sangat dipengaruhi jarak, berat, kondisi jalan, dan jumlah karung |
| Catatan UI | Jika sudah masuk biaya panen atau bongkar muat, jangan input dobel |

Deskripsi card:

> Tenaga angkut hasil digunakan untuk memindahkan hasil ketika kendaraan tidak bisa masuk langsung ke petak atau gudang. Cocok dihitung per karung, per trip, atau HOK.

---

### 4.7 Timbang & Serah Terima

| Field | Isi |
|---|---|
| Nama UI | Timbang & Serah Terima |
| Nama file | `alat-timbangan-digital.jpg` |
| Kategori | Transportasi & Logistik |
| Tipe item | Validasi bobot/transaksi |
| Komoditas | Padi, Jagung, Kedelai |
| Mode biaya | `jasa_timbang`, `milik_sendiri`, `pinjam`, `input_manual` |
| Satuan | kg, karung, kuintal, ton |
| Fungsi | Memastikan bobot saat keluar gudang atau masuk pembeli |
| Risiko/keterbatasan | Selisih bobot antara timbang lahan dan timbang pembeli dapat memengaruhi pendapatan |
| Catatan UI | Simpan `berat_keluar`, `berat_diterima`, dan `selisih_kg` jika memungkinkan |

Deskripsi card:

> Timbang dan serah terima membantu mencatat bobot hasil saat dikirim atau diterima pembeli. Ini penting untuk menghindari selisih data produksi dan penjualan.

---

### 4.8 Biaya BBM/Operasional Kendaraan

| Field | Isi |
|---|---|
| Nama UI | Biaya BBM/Operasional Kendaraan |
| Nama file | `bahan-jerigen.jpg` |
| Kategori | Transportasi & Logistik |
| Tipe item | Operasional kendaraan |
| Komoditas | Padi, Jagung, Kedelai |
| Mode biaya | `liter_x_harga`, `per_trip`, `input_manual` |
| Satuan | liter, trip, rupiah |
| Fungsi | Mencatat biaya bahan bakar kendaraan/logistik |
| Risiko/keterbatasan | Harga BBM berubah; konsumsi tergantung jarak, medan, muatan, dan kendaraan |
| Catatan UI | Jangan hardcode harga; user/admin harus bisa edit harga per liter |

Deskripsi card:

> Biaya BBM kendaraan mencatat pengeluaran bahan bakar untuk mengirim hasil panen. Harga dan konsumsi sebaiknya dapat diedit karena sangat tergantung lokasi dan kendaraan.

Sumber:
- Pertamina Patra Niaga menyediakan halaman harga BBM terbaru.  
  https://pertaminapatraniaga.com/page/harga-terbaru-bbm
- CNN Indonesia, 1 Juni 2026, mencatat Pertalite Rp10.000/L dan Solar subsidi Rp6.800/L pada periode tersebut.  
  https://www.cnnindonesia.com/ekonomi/20260531225743-85-1364005/daftar-harga-bbm-pertamina-per-1-juni-2026-pertamax-turbo-naik

---

## 5. Model Biaya Transportasi & Logistik

| Mode | Rumus |
|---|---|
| Per trip | `jumlah_trip × tarif_per_trip` |
| Per km | `jarak_km × tarif_per_km` |
| Sewa harian | `jumlah_hari × tarif_harian` |
| Sewa jam | `jumlah_jam × tarif_per_jam` |
| Per karung | `jumlah_karung × tarif_per_karung` |
| Per ton | `jumlah_ton × tarif_per_ton` |
| BBM kendaraan sendiri | `liter_BBM × harga_per_liter` |
| Milik sendiri | `BBM + sopir + servis + penyusutan opsional` |
| Pinjam kelompok | `iuran + BBM + sopir/operator` |
| Gudang | `tarif_sewa × durasi` |
| Input manual | `nominal user` |

---

## 6. Field Input UI yang Disarankan

```text
komoditas
musim_tanam_id
item_transport_id
tanggal_pengiriman
asal
tujuan
jarak_km
jenis_kendaraan
mode_biaya
jumlah_trip
jumlah_karung
berat_total_kg
tarif_per_trip
tarif_per_km
tarif_per_karung
tarif_per_ton
tarif_sewa_harian
jumlah_hari
liter_bbm
harga_bbm_per_liter
biaya_sopir
biaya_bongkar
biaya_muat
biaya_gudang
biaya_total_logistik
catatan_akses_jalan
catatan_cuaca
```

Field tambahan untuk audit hasil:

```text
berat_keluar_kg
berat_diterima_kg
selisih_kg
alasan_selisih
```

---

## 7. Relevansi per Komoditas

| Item | Padi | Jagung | Kedelai | Catatan |
|---|---|---|---|---|
| Pickup hasil panen | Sangat relevan | Sangat relevan | Sangat relevan | Transport utama jarak menengah |
| Motor roda tiga | Relevan | Relevan | Relevan | Cocok akses sempit dan volume sedang |
| Gerobak dorong | Relevan | Relevan | Relevan | Jarak pendek di lahan/gudang |
| Gudang penyimpanan | Sangat relevan | Sangat relevan | Sangat relevan | Perlu kontrol kadar air |
| Bongkar muat | Sangat relevan | Sangat relevan | Sangat relevan | Biaya realistis per karung/trip |
| Timbang & serah terima | Sangat relevan | Sangat relevan | Sangat relevan | Penting untuk penjualan |
| BBM kendaraan | Relevan | Relevan | Relevan | Jika kendaraan sendiri/pinjam |

---

## 8. Anti Double Counting

| Kasus | Aturan |
|---|---|
| Angkut dari petak ke titik kumpul | Bisa masuk Panen. Jangan input lagi sebagai transportasi jika sudah termasuk. |
| Pickup ke gudang/pembeli | Masuk Transportasi & Logistik. |
| Bongkar muat | Jika tarif pickup sudah termasuk bongkar muat, jangan input terpisah. |
| Karung | Masuk Bahan Pendukung, bukan transportasi, kecuali biaya karung sudah satu paket dengan jasa angkut. |
| Gudang | Jika hanya tempat jemur sementara, bisa masuk Pascapanen; jika penyimpanan setelah siap jual, masuk Logistik. |
| Timbangan | Biaya alat hanya jika beli/sewa/jasa timbang; jangan input sebagai biaya logistik rutin jika milik sendiri dan tanpa biaya. |
| BBM | Jika tarif sewa kendaraan sudah all-in, jangan catat BBM lagi. |

Warning UI:

```text
Apakah tarif transport ini sudah termasuk sopir, BBM, bongkar muat, dan karung? Jika iya, jangan input komponen tersebut lagi agar biaya tidak dobel.
```

---

## 9. Rekomendasi Database

### 9.1 Master Item Transportasi

```sql
CREATE TABLE IF NOT EXISTS transport_logistik_items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nama_item VARCHAR(150) NOT NULL,
  nama_file_asset VARCHAR(255) NULL,
  jenis_item ENUM('kendaraan','tenaga','gudang','alat','operasional','aktivitas') NOT NULL,
  fase_penggunaan VARCHAR(100) DEFAULT 'Transportasi & Logistik',
  relevan_padi TINYINT(1) DEFAULT 0,
  relevan_jagung TINYINT(1) DEFAULT 0,
  relevan_kedelai TINYINT(1) DEFAULT 0,
  mode_biaya_default VARCHAR(100) NULL,
  fungsi TEXT NULL,
  catatan_overlap TEXT NULL,
  status ENUM('aktif','nonaktif') DEFAULT 'aktif',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

### 9.2 Transaksi Biaya Transportasi

```sql
CREATE TABLE IF NOT EXISTS biaya_transport_logistik (
  id INT AUTO_INCREMENT PRIMARY KEY,
  musim_tanam_id INT NOT NULL,
  transport_logistik_item_id INT NULL,
  nama_biaya VARCHAR(150) NOT NULL,
  tanggal_pengiriman DATE NULL,
  asal VARCHAR(150) NULL,
  tujuan VARCHAR(150) NULL,
  jenis_kendaraan VARCHAR(100) NULL,
  mode_biaya ENUM('per_trip','per_km','sewa_harian','sewa_jam','per_karung','per_ton','bbm_sendiri','milik_sendiri','pinjam_kelompok','gudang','input_manual') NOT NULL,
  jarak_km DECIMAL(10,2) NULL,
  jumlah_trip DECIMAL(10,2) NULL,
  jumlah_karung DECIMAL(14,2) NULL,
  berat_total_kg DECIMAL(14,2) NULL,
  tarif_per_trip DECIMAL(14,2) NULL,
  tarif_per_km DECIMAL(14,2) NULL,
  tarif_per_karung DECIMAL(14,2) NULL,
  tarif_per_ton DECIMAL(14,2) NULL,
  tarif_sewa_harian DECIMAL(14,2) NULL,
  jumlah_hari DECIMAL(10,2) NULL,
  liter_bbm DECIMAL(10,2) NULL,
  harga_bbm_per_liter DECIMAL(14,2) NULL,
  biaya_sopir DECIMAL(14,2) NULL,
  biaya_bongkar DECIMAL(14,2) NULL,
  biaya_muat DECIMAL(14,2) NULL,
  biaya_gudang DECIMAL(14,2) NULL,
  berat_keluar_kg DECIMAL(14,2) NULL,
  berat_diterima_kg DECIMAL(14,2) NULL,
  selisih_kg DECIMAL(14,2) NULL,
  biaya_total DECIMAL(14,2) NOT NULL DEFAULT 0,
  catatan TEXT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

---

## 10. Contoh SQL Seed

```sql
INSERT INTO transport_logistik_items
(nama_item, nama_file_asset, jenis_item, fase_penggunaan, relevan_padi, relevan_jagung, relevan_kedelai, mode_biaya_default, fungsi, catatan_overlap)
VALUES
('Pickup Hasil Panen','transport-pickup-hasil-panen.jpg','kendaraan','Transportasi & Logistik',1,1,1,'per_trip','Mengangkut hasil dari lahan/titik kumpul ke rumah, gudang, penggilingan, pengepul, atau pembeli.','Pastikan apakah tarif sudah termasuk BBM, sopir, dan bongkar muat.'),
('Motor Roda Tiga / Tosa','transport-motor-roda-tiga.jpg','kendaraan','Transportasi & Logistik',1,1,1,'per_trip','Mengangkut hasil pada akses sempit atau jarak pendek.','Cocok untuk volume sedang dan jalan kecil.'),
('Gerobak Dorong / Arco','transport-gerobak-dorong.jpg','alat','Transportasi Internal',1,1,1,'milik_sendiri','Mengangkut hasil jarak pendek di lahan, jemuran, atau gudang.','Pisahkan biaya alat gerobak dan tenaga angkut.'),
('Gudang Penyimpanan Hasil','transport-gudang-penyimpanan.jpg','gudang','Penyimpanan Logistik',1,1,1,'gudang','Menyimpan hasil sementara sebelum jual/proses.','Pastikan kadar air aman sebelum simpan.'),
('Bongkar Muat Hasil Panen','transport-bongkar-muat.jpg','tenaga','Loading / Unloading',1,1,1,'per_karung','Memuat dan menurunkan hasil dari kendaraan.','Jangan input jika sudah termasuk tarif transport.'),
('Tenaga Angkut Hasil','tenaga-angkut-hasil.jpg','tenaga','Transportasi Internal',1,1,1,'per_karung','Mengangkut hasil manual antartitik.','Jangan dobel dengan Panen jika sudah dicatat di fase panen.'),
('Timbang & Serah Terima','alat-timbangan-digital.jpg','alat','Serah Terima',1,1,1,'input_manual','Memastikan bobot hasil saat keluar/masuk gudang atau pembeli.','Simpan berat keluar dan berat diterima.'),
('Biaya BBM/Operasional Kendaraan','bahan-jerigen.jpg','operasional','Transportasi & Logistik',1,1,1,'bbm_sendiri','Mencatat bahan bakar kendaraan/logistik.','Jangan input jika sewa kendaraan sudah all-in.');
```

---

## 11. Rekomendasi MVP AgroTrack

Prioritas masuk MVP:

1. Pickup Hasil Panen
2. Bongkar Muat Hasil Panen
3. Tenaga Angkut Hasil
4. Gudang Penyimpanan Hasil
5. Timbang & Serah Terima
6. Biaya BBM/Operasional Kendaraan

Prioritas tambahan:

7. Motor Roda Tiga / Tosa
8. Gerobak Dorong / Arco

Alasan:
- Pickup, bongkar muat, dan tenaga angkut adalah biaya logistik paling mudah dipahami.
- Gudang dan timbang penting untuk akurasi hasil serta kualitas penyimpanan.
- Motor roda tiga dan gerobak sangat realistis untuk akses lahan kecil, tetapi bisa menjadi opsi tambahan.

---

## 12. Copy UI Singkat per Item

| Item | Copy pendek untuk card |
|---|---|
| Pickup Hasil Panen | Kendaraan untuk mengirim hasil dari lahan ke rumah, gudang, atau pembeli. |
| Motor Roda Tiga | Kendaraan kecil untuk akses lahan sempit dan pengiriman jarak pendek. |
| Gerobak Dorong | Alat angkut manual untuk jarak pendek di lahan atau gudang. |
| Gudang Penyimpanan | Tempat menyimpan hasil sementara sebelum dijual atau diproses. |
| Bongkar Muat | Tenaga kerja untuk menaikkan dan menurunkan karung/hasil. |
| Tenaga Angkut | Tenaga manual untuk memindahkan hasil antar titik. |
| Timbang & Serah Terima | Validasi bobot hasil saat pengiriman atau penjualan. |
| BBM Kendaraan | Biaya bahan bakar untuk transportasi hasil panen. |

---

## 13. Referensi Utama

1. BPS — Nilai Produksi dan Biaya Produksi per Musim Tanam per Hektar Budidaya Padi, Jagung, dan Kedelai.  
   https://www.bps.go.id/id/statistics-table/1/MjA1NSMx/nilai-produksi-dan-biaya-produksi-per-musim-tanam-per-hektar-budidaya-tanaman-padi-sawah--padi-ladang--jagung--dan-kedelai--2017.html

2. Deliveree — Harga sewa pickup harian.  
   https://www.deliveree.com/id/cek-ongkir/harga-sewa-pickup-harian-termurah/

3. Deliveree — Daftar harga sewa truk Fuso, Tronton, Engkel 2026.  
   https://www.deliveree.com/id/cek-ongkir/daftar-harga-sewa-truk-fuso-tronton-engkel/

4. TheLorry — Sewa harian kendaraan logistik.  
   https://thelorry.com/id/sewa-harian/

5. Indotrading — Gerobak sorong.  
   https://www.indotrading.com/jual-gerobak-sorong

6. Jurnal Pangan — Penanganan gabah dan GHP/GMP.  
   https://www.jurnalpangan.com/index.php/pangan/article/download/369/323/880

7. Jurnal Polinela — Kadar air jagung aman disimpan 12–14%.  
   https://jurnal.polinela.ac.id/index.php/JFA/article/download/1110/760/2356

8. Pertamina Patra Niaga — Harga BBM terbaru.  
   https://pertaminapatraniaga.com/page/harga-terbaru-bbm

9. CNN Indonesia — Harga BBM Pertamina per 1 Juni 2026.  
   https://www.cnnindonesia.com/ekonomi/20260531225743-85-1364005/daftar-harga-bbm-pertamina-per-1-juni-2026-pertamax-turbo-naik
