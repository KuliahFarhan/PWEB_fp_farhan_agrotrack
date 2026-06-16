# AgroTrack — Katalog Panen untuk Padi, Jagung, dan Kedelai

**Versi:** 1.0  
**Tanggal penyusunan:** 16 Juni 2026  
**Kategori:** Panen  
**Target komoditas:** Padi, Jagung, Kedelai  
**Fungsi dokumen:** Referensi seed database, UI katalog operasional, input biaya panen, dan card asset AgroTrack.

---

## 1. Catatan Utama

Kategori **Panen** tidak sama dengan “hasil panen”. Di AgroTrack, kategori Panen sebaiknya mencatat **aktivitas, tenaga, alat, bahan, dan risiko kehilangan hasil pada saat pengambilan hasil dari lahan**.

Panen harus dipisahkan dari:

1. **Pascapanen**  
   Pascapanen mencakup jemur, perontokan/pemipilan, sortasi, pengemasan, penyimpanan, dan pengukuran kadar air.

2. **Transportasi & Logistik**  
   Transportasi mencakup angkut dari lahan ke rumah/gudang/pengepul, bongkar muat, kendaraan, BBM, dan biaya gudang.

3. **Hasil Panen**  
   Hasil panen adalah output produksi: kg, ton, karung, kualitas, harga jual, pendapatan.

4. **Tenaga Kerja**  
   Tenaga panen bisa dicatat sebagai item tenaga kerja, tetapi dalam kategori Panen user melihat konteks fase panen lengkap.

5. **Alat & Mesin**  
   Combine harvester, sabit, corn sheller, power thresher, dan timbangan bisa muncul sebagai alat, tetapi biaya harus dicegah dari double counting.

Sumber dasar:
- BPS memiliki data biaya produksi per musim tanam per hektar untuk padi, jagung, dan kedelai. Ini mendukung desain AgroTrack yang mencatat biaya per fase/musim, termasuk panen.  
  https://www.bps.go.id/id/statistics-table/1/MjA1NSMx/nilai-produksi-dan-biaya-produksi-per-musim-tanam-per-hektar-budidaya-tanaman-padi-sawah--padi-ladang--jagung--dan-kedelai--2017.html
- Tahapan kegiatan usahatani padi dapat mencakup pengolahan lahan, penyiapan bibit, penanaman, pemupukan, penyiangan, panen, dan pascapanen.  
  https://ejurnal.undana.ac.id/index.php/impas/article/download/19633/7593

---

## 2. Asset yang Digunakan

Kategori Panen **tidak perlu asset baru** karena bisa memakai asset dari folder sebelumnya.

| No | Nama File Asset | Asal Folder | Nama Item UI | Status |
|---:|---|---|---|---|
| 1 | `tenaga-panen-padi.jpg` | `tenaga-kerja/` | Panen Padi Manual | Pakai ulang |
| 2 | `tenaga-panen-jagung.jpg` | `tenaga-kerja/` | Panen Jagung Manual | Pakai ulang |
| 3 | `tenaga-panen-kedelai.jpg` | `tenaga-kerja/` | Panen Kedelai Manual | Pakai ulang |
| 4 | `alat-combine-harvester.jpg` | `alat-mesin/` | Combine Harvester Padi | Pakai ulang |
| 5 | `bahan-karung-panen.jpg` | `bahan-pendukung/` | Karung Panen | Pakai ulang |
| 6 | `bahan-tali-rafia.jpg` | `bahan-pendukung/` | Tali Rafia Panen | Pakai ulang |
| 7 | `alat-timbangan-digital.jpg` | `alat-mesin/` | Timbangan Panen | Pakai ulang |
| 8 | `bahan-jaring-padi.jpg` | `bahan-pendukung/` | Jaring Padi Menjelang Panen | Pakai ulang |
| 9 | `tenaga-angkut-hasil.jpg` | `tenaga-kerja/` | Angkut Hasil dari Petak | Pakai ulang |

Catatan:
- `tenaga-angkut-hasil.jpg` bisa muncul di Panen dan Transportasi. Untuk Panen, konteksnya adalah **memindahkan hasil dari titik panen ke titik kumpul lahan**.
- Untuk Transportasi, konteksnya adalah **pengiriman dari lahan/titik kumpul ke rumah, gudang, penggilingan, atau pembeli**.

---

## 3. Ringkasan Item Panen

| No | Item | File Asset | Komoditas | Fase | Mode Biaya Utama | Status Harga/Biaya |
|---:|---|---|---|---|---|---|
| 1 | Panen Padi Manual | `tenaga-panen-padi.jpg` | Padi | Panen | HOK, borongan, per ha, per karung | INPUT_MANUAL_LOKAL |
| 2 | Panen Padi Mekanis / Combine | `alat-combine-harvester.jpg` | Padi | Panen | jasa per ha, jasa per petak, sewa, milik sendiri | INPUT_MANUAL_LOKAL + REFERENSI_ALAT |
| 3 | Panen Jagung Manual | `tenaga-panen-jagung.jpg` | Jagung | Panen | HOK, borongan, per karung, per ha | INPUT_MANUAL_LOKAL |
| 4 | Panen Kedelai Manual | `tenaga-panen-kedelai.jpg` | Kedelai | Panen | HOK, borongan, per ha, tenaga keluarga | INPUT_MANUAL_LOKAL |
| 5 | Karung Panen | `bahan-karung-panen.jpg` | Padi, Jagung, Kedelai | Panen/Pascapanen | beli ulang, habis pakai, dipakai ulang | TERVERIFIKASI_MARKETPLACE |
| 6 | Tali Rafia Panen | `bahan-tali-rafia.jpg` | Padi, Jagung, Kedelai | Panen/Pascapanen | beli ulang, habis pakai | TERVERIFIKASI_MARKETPLACE |
| 7 | Timbangan Panen | `alat-timbangan-digital.jpg` | Padi, Jagung, Kedelai | Panen/Pascapanen | beli, pinjam, milik sendiri | TERVERIFIKASI_MARKETPLACE |
| 8 | Jaring Padi Menjelang Panen | `bahan-jaring-padi.jpg` | Padi terutama | Menjelang panen | beli, dipakai ulang | TERVERIFIKASI_MARKETPLACE |
| 9 | Angkut Hasil ke Titik Kumpul | `tenaga-angkut-hasil.jpg` | Padi, Jagung, Kedelai | Panen | per karung, per trip, borongan, HOK | INPUT_MANUAL_LOKAL |

---

## 4. Kriteria Siap Panen per Komoditas

### 4.1 Padi

| Aspek | Kriteria lapangan |
|---|---|
| Indikator visual | Mayoritas gabah menguning, daun bendera mengering, malai merunduk |
| Kadar air panen | Beberapa rujukan lapang menyebut sekitar 21–26% pada saat panen |
| Risiko panen terlambat | Gabah rontok, susut hasil, mutu turun |
| Asset utama | `tenaga-panen-padi.jpg`, `alat-combine-harvester.jpg`, `bahan-karung-panen.jpg` |

Sumber:
- Dinas Pertanian Pesisir Selatan menyebut padi siap panen saat 95% gabah menguning, daun bendera mengering, umur optimal malai 30–35 hari setelah berbunga, dan kadar air 21–26%.  
  https://disperta.pesisirselatankab.go.id/berita/panen-dan-pasca-panen-padi-sawah
- Kompas Agri mengutip Cybex Kementerian Pertanian bahwa padi siap panen biasanya 95% bulir dan daun bendera mulai menguning.  
  https://agri.kompas.com/read/2022/09/19/142900484/ciri-ciri-tanaman-padi-siap-panen?page=all

### 4.2 Jagung

| Aspek | Kriteria lapangan |
|---|---|
| Indikator visual | Klobot/kelobot mengering atau cokelat, biji mengeras, black layer terbentuk |
| Umur panen biji kering | Umumnya sekitar 80–110 HST atau 100–120 HST tergantung varietas dan target hasil |
| Risiko panen terlalu basah | Susah dipipil, biji rusak, perlu pengeringan lebih lama |
| Asset utama | `tenaga-panen-jagung.jpg`, `alat-corn-sheller.jpg`, `bahan-karung-panen.jpg` |

Sumber:
- Corteva menyebut jagung biji kering umumnya dipanen saat umur 80–110 HST dan black layer sudah terbentuk.  
  https://www.corteva.com/id/berita/Ketahui-Waktu-Panen-Jagung-yang-Tepat.html
- Kanal Pengetahuan FTP UGM menyebut ciri siap panen jagung seperti umur 7–8 minggu setelah berbunga, daun/batang mulai menguning-cokelat, dan jagung terlalu lama di lahan dapat meningkatkan risiko kehilangan dan jamur.  
  https://kanalpengetahuan.tp.ugm.ac.id/menara-ilmu/2017/581-teknologi-pascapanen-jagung.html
- Panduan Jagung Hibrida Seger menyebut panen jagung 100–120 HST, kelobot mengering/cokelat, biji mengeras, dan black layer pada ujung biji.  
  https://sahabat.seger.co.id/contents/banner/ebook.pdf

### 4.3 Kedelai

| Aspek | Kriteria lapangan |
|---|---|
| Indikator visual | Daun menguning/rontok, polong berubah cokelat, biji mengeras |
| Cara panen | Dicabut atau dipotong, lalu brangkasan dikeringkan |
| Risiko panen tidak tepat | Biji pecah, polong pecah, kehilangan hasil, mutu biji turun |
| Asset utama | `tenaga-panen-kedelai.jpg`, `alat-power-thresher.jpg`, `bahan-karung-panen.jpg` |

Sumber:
- Repository Pertanian menyebut panen kedelai dapat dilakukan manual dengan dicabut/dipotong dan mekanis; penanganan pascapanen mencakup pengeringan brangkasan, perontokan, pembersihan, pengeringan biji, pengemasan, dan penyimpanan.  
  https://repository.pertanian.go.id/items/37b1b5a3-787b-4e72-afcd-372deba51f11
- Dokumen “Panen dan Pasca Panen Kedelai” menyebut pengeringan hingga kadar air sekitar 14% dan perontokan harus hati-hati agar biji tidak pecah/retak.  
  https://repository.pertanian.go.id/bitstreams/51c4898f-e40f-47b5-89b4-e98474c24942/download

---

## 5. Detail Item Katalog

### 5.1 Panen Padi Manual

| Field | Isi |
|---|---|
| Nama UI | Panen Padi Manual |
| Nama file | `tenaga-panen-padi.jpg` |
| Komoditas | Padi |
| Kategori | Panen |
| Jenis biaya | Tenaga kerja |
| Mode biaya | `hok`, `upah_harian`, `borongan`, `per_ha`, `per_karung`, `tenaga_keluarga`, `gotong_royong` |
| Satuan | HOK, ha, petak, karung, kg, kuintal |
| Fungsi | Memotong/memanen padi, mengumpulkan, dan menyiapkan gabah untuk dirontokkan/diangkut |
| Risiko | Susut panen, gabah tercecer, keterlambatan panen, cuaca hujan |
| Catatan UI | Jika memakai combine, jangan tambahkan panen manual penuh kecuali hanya tenaga bantu |

Deskripsi card:

> Panen padi manual digunakan saat petani memakai tenaga kerja untuk memotong dan mengumpulkan padi. Biaya dapat dihitung per HOK, borongan, per hektar, atau per karung sesuai kebiasaan lokal.

---

### 5.2 Panen Padi Mekanis / Combine Harvester

| Field | Isi |
|---|---|
| Nama UI | Panen Padi Mekanis / Combine Harvester |
| Nama file | `alat-combine-harvester.jpg` |
| Komoditas | Padi |
| Kategori | Panen |
| Jenis biaya | Jasa mesin / alat / operator |
| Mode biaya | `jasa_per_ha`, `jasa_per_petak`, `sewa_harian`, `milik_sendiri`, `pinjam_kelompok`, `input_manual` |
| Satuan | ha, petak, jam, hari |
| Fungsi | Memanen padi secara mekanis, biasanya mencakup pemotongan dan perontokan awal |
| Risiko | Tidak cocok untuk semua kondisi lahan; butuh operator; biaya jasa lokal sangat bervariasi |
| Catatan UI | Jika jasa combine sudah mencakup panen dan rontok, jangan catat power thresher/tenaga panen manual penuh |

Deskripsi card:

> Combine harvester mempercepat panen padi dan dapat mengurangi kebutuhan tenaga panen manual. Dalam AgroTrack, combine lebih realistis dicatat sebagai jasa per hektar/petak daripada harga beli mesin.

---

### 5.3 Panen Jagung Manual

| Field | Isi |
|---|---|
| Nama UI | Panen Jagung Manual |
| Nama file | `tenaga-panen-jagung.jpg` |
| Komoditas | Jagung |
| Kategori | Panen |
| Jenis biaya | Tenaga kerja |
| Mode biaya | `hok`, `upah_harian`, `borongan`, `per_ha`, `per_karung`, `per_kg`, `tenaga_keluarga` |
| Satuan | HOK, ha, karung, kg, kuintal, ton |
| Fungsi | Memetik tongkol jagung, mengumpulkan, dan membawa ke titik kumpul/jemur |
| Risiko | Panen terlalu basah membuat pemipilan dan pengeringan lebih berat |
| Catatan UI | Setelah panen jagung, lanjutkan ke pascapanen: kupas kelobot, jemur, pipil, keringkan, timbang |

Deskripsi card:

> Panen jagung manual mencakup pemetikan tongkol, pengumpulan, dan persiapan menuju pengeringan atau pemipilan. Biaya bisa dihitung borongan, per HOK, per karung, atau per luasan.

---

### 5.4 Panen Kedelai Manual

| Field | Isi |
|---|---|
| Nama UI | Panen Kedelai Manual |
| Nama file | `tenaga-panen-kedelai.jpg` |
| Komoditas | Kedelai |
| Kategori | Panen |
| Jenis biaya | Tenaga kerja |
| Mode biaya | `hok`, `upah_harian`, `borongan`, `per_ha`, `per_karung`, `tenaga_keluarga` |
| Satuan | HOK, ha, karung, kg, kuintal |
| Fungsi | Mencabut atau memotong tanaman kedelai dan mengumpulkan brangkasan |
| Risiko | Polong pecah, biji tercecer, mutu turun jika terlalu basah/lembap |
| Catatan UI | Setelah panen, masuk ke pengeringan brangkasan dan perontokan kedelai |

Deskripsi card:

> Panen kedelai manual mencakup pencabutan atau pemotongan tanaman, pengumpulan brangkasan, dan persiapan pengeringan sebelum perontokan.

---

### 5.5 Karung Panen

| Field | Isi |
|---|---|
| Nama UI | Karung Panen |
| Nama file | `bahan-karung-panen.jpg` |
| Komoditas | Padi, Jagung, Kedelai |
| Kategori | Panen / Pascapanen |
| Jenis biaya | Bahan pendukung |
| Mode biaya | `beli_ulang`, `habis_pakai`, `dipakai_ulang` |
| Satuan | lembar, paket, karung |
| Fungsi | Menampung hasil di lahan dan memudahkan angkut |
| Catatan UI | Kapasitas kg harus bisa diisi manual |

Deskripsi card:

> Karung panen dipakai untuk menampung hasil saat panen dan memudahkan pengangkutan ke titik kumpul, rumah, gudang, atau pembeli.

---

### 5.6 Tali Rafia Panen

| Field | Isi |
|---|---|
| Nama UI | Tali Rafia Panen |
| Nama file | `bahan-tali-rafia.jpg` |
| Komoditas | Padi, Jagung, Kedelai |
| Kategori | Panen / Pascapanen |
| Jenis biaya | Bahan pendukung |
| Mode biaya | `beli_ulang`, `habis_pakai` |
| Satuan | roll, kg |
| Fungsi | Mengikat karung, bundel, terpal, jaring, atau penanda panen |
| Catatan UI | Umumnya biaya kecil tetapi realistis untuk operasional |

Deskripsi card:

> Tali rafia adalah bahan pengikat serbaguna pada fase panen dan pascapanen. Item ini cocok dicatat sebagai bahan habis pakai kecil.

---

### 5.7 Timbangan Panen

| Field | Isi |
|---|---|
| Nama UI | Timbangan Panen |
| Nama file | `alat-timbangan-digital.jpg` |
| Komoditas | Padi, Jagung, Kedelai |
| Kategori | Panen / Pascapanen |
| Jenis biaya | Alat ukur |
| Mode biaya | `beli_baru`, `milik_sendiri`, `pinjam_kelompok`, `dipakai_ulang` |
| Satuan | unit |
| Fungsi | Menimbang hasil untuk catatan produksi dan penjualan |
| Catatan UI | Jangan dicatat sebagai biaya panen jika sudah dimiliki dan tidak ada biaya baru |

Deskripsi card:

> Timbangan panen membantu mencatat hasil secara akurat. Dalam AgroTrack, hasil panen sebaiknya tidak hanya “perkiraan karung”, tetapi bisa dikonversi ke kg/ton.

---

### 5.8 Jaring Padi Menjelang Panen

| Field | Isi |
|---|---|
| Nama UI | Jaring Padi Menjelang Panen |
| Nama file | `bahan-jaring-padi.jpg` |
| Komoditas | Padi terutama |
| Kategori | Panen / Perlindungan Fisik |
| Jenis biaya | Bahan pendukung |
| Mode biaya | `beli_baru`, `dipakai_ulang`, `milik_sendiri` |
| Satuan | roll, meter |
| Fungsi | Mengurangi gangguan burung menjelang panen |
| Catatan UI | Muncul pada fase generatif/menjelang panen, bukan saat panen utama |

Deskripsi card:

> Jaring padi digunakan sebagai perlindungan fisik non-kimia untuk mengurangi gangguan burung menjelang panen.

---

### 5.9 Angkut Hasil ke Titik Kumpul

| Field | Isi |
|---|---|
| Nama UI | Angkut Hasil ke Titik Kumpul |
| Nama file | `tenaga-angkut-hasil.jpg` |
| Komoditas | Padi, Jagung, Kedelai |
| Kategori | Panen |
| Jenis biaya | Tenaga kerja |
| Mode biaya | `per_karung`, `per_trip`, `borongan`, `hok`, `input_manual` |
| Satuan | karung, trip, kg, kuintal, HOK |
| Fungsi | Memindahkan hasil dari petak panen ke titik kumpul di lahan |
| Catatan UI | Bedakan dari Transportasi & Logistik yang mencakup kendaraan ke rumah/gudang/pembeli |

Deskripsi card:

> Angkut hasil ke titik kumpul adalah biaya memindahkan hasil dari petak ke pinggir lahan atau lokasi pengumpulan sementara. Setelah itu, biaya kendaraan masuk kategori Transportasi & Logistik.

---

## 6. Model Biaya Panen

| Mode | Rumus |
|---|---|
| HOK | `jumlah_HOK × upah_per_HOK` |
| Upah harian | `jumlah_orang × jumlah_hari × upah_per_orang` |
| Borongan | `tarif_borongan` |
| Per hektar | `luas_ha × tarif_per_ha` |
| Per hasil | `jumlah_karung/kg/kuintal × tarif_per_satuan` |
| Jasa combine | `luas_ha × tarif_combine_per_ha` atau input manual |
| Tenaga keluarga | `biaya_tunai = 0`, `nilai_ekonomi_opsional = HOK × upah_acuan` |
| Bahan panen | `jumlah × harga_satuan` |

---

## 7. Field Input UI yang Disarankan

```text
komoditas
musim_tanam_id
item_panen_id
tanggal_panen
metode_panen
mode_biaya
luas_dipanen_ha
jumlah_orang
jumlah_hari
jumlah_HOK
upah_per_HOK
tarif_borongan
tarif_per_ha
jumlah_karung
berat_per_karung_kg
total_berat_kg
biaya_bahan
biaya_jasa_mesin
biaya_tenaga
biaya_total_panen
catatan_kualitas
catatan_cuaca
```

---

## 8. Anti Double Counting

| Kasus | Aturan |
|---|---|
| Panen padi pakai combine | Jangan catat tenaga panen manual penuh dan power thresher lagi, kecuali ada tenaga bantu/biaya tambahan. |
| Panen jagung manual | Corn sheller masuk Pascapanen, bukan Panen, kecuali jasa pemipilan sudah satu paket panen. |
| Panen kedelai manual | Power thresher/perontokan masuk Pascapanen, bukan biaya panen utama, kecuali borongan mencakup panen + rontok. |
| Karung dan tali | Catat sebagai bahan pendukung, jangan dijadikan bagian dari upah tenaga panen. |
| Angkut hasil | Angkut dari petak ke titik kumpul = Panen; kendaraan ke gudang/pembeli = Transportasi & Logistik. |

Warning UI:

```text
Periksa apakah biaya ini sudah termasuk tenaga panen, alat, karung, angkut, atau perontokan. Jika sudah satu paket borongan, jangan input komponen yang sama dua kali.
```

---

## 9. Rekomendasi Database

### 9.1 Master Item Panen

```sql
CREATE TABLE IF NOT EXISTS panen_items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nama_item VARCHAR(150) NOT NULL,
  nama_file_asset VARCHAR(255) NULL,
  komoditas ENUM('padi','jagung','kedelai','semua') NOT NULL,
  jenis_item ENUM('tenaga','alat','bahan','aktivitas','perlindungan_fisik') NOT NULL,
  fase_penggunaan VARCHAR(100) DEFAULT 'Panen',
  mode_biaya_default VARCHAR(100) NULL,
  fungsi TEXT NULL,
  catatan_overlap TEXT NULL,
  status ENUM('aktif','nonaktif') DEFAULT 'aktif',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

### 9.2 Transaksi Biaya Panen

```sql
CREATE TABLE IF NOT EXISTS biaya_panen (
  id INT AUTO_INCREMENT PRIMARY KEY,
  musim_tanam_id INT NOT NULL,
  panen_item_id INT NULL,
  nama_biaya VARCHAR(150) NOT NULL,
  tanggal_panen DATE NULL,
  metode_panen ENUM('manual','mekanis','kombinasi','input_manual') DEFAULT 'manual',
  mode_biaya ENUM('hok','upah_harian','borongan','per_ha','per_hasil','jasa_mesin','bahan','tenaga_keluarga','input_manual') NOT NULL,
  luas_ha DECIMAL(10,4) NULL,
  jumlah_orang DECIMAL(10,2) NULL,
  jumlah_hari DECIMAL(10,2) NULL,
  jumlah_hok DECIMAL(10,2) NULL,
  upah_per_hok DECIMAL(14,2) NULL,
  upah_per_orang DECIMAL(14,2) NULL,
  tarif_borongan DECIMAL(14,2) NULL,
  tarif_per_ha DECIMAL(14,2) NULL,
  jumlah_satuan DECIMAL(14,2) NULL,
  satuan VARCHAR(50) NULL,
  tarif_per_satuan DECIMAL(14,2) NULL,
  biaya_total DECIMAL(14,2) NOT NULL DEFAULT 0,
  catatan TEXT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

---

## 10. Contoh SQL Seed

```sql
INSERT INTO panen_items
(nama_item, nama_file_asset, komoditas, jenis_item, fase_penggunaan, mode_biaya_default, fungsi, catatan_overlap)
VALUES
('Panen Padi Manual','tenaga-panen-padi.jpg','padi','tenaga','Panen','borongan','Memanen dan mengumpulkan padi secara manual.','Jika memakai combine, jangan input tenaga manual penuh.'),
('Panen Padi Mekanis / Combine','alat-combine-harvester.jpg','padi','alat','Panen','jasa_mesin','Memanen padi dengan mesin combine harvester.','Biasanya mencakup potong dan rontok awal.'),
('Panen Jagung Manual','tenaga-panen-jagung.jpg','jagung','tenaga','Panen','borongan','Memetik dan mengumpulkan tongkol jagung.','Pemipilan masuk Pascapanen kecuali satu paket.'),
('Panen Kedelai Manual','tenaga-panen-kedelai.jpg','kedelai','tenaga','Panen','hok','Mencabut atau memotong tanaman kedelai dan mengumpulkan brangkasan.','Perontokan masuk Pascapanen.'),
('Karung Panen','bahan-karung-panen.jpg','semua','bahan','Panen / Pascapanen','bahan','Menampung hasil panen.','Bahan pendukung, bukan tenaga panen.'),
('Tali Rafia Panen','bahan-tali-rafia.jpg','semua','bahan','Panen / Pascapanen','bahan','Mengikat karung atau bundel hasil.','Bahan kecil/habis pakai.'),
('Timbangan Panen','alat-timbangan-digital.jpg','semua','alat','Panen / Pascapanen','input_manual','Menimbang hasil panen.','Jangan catat biaya jika sudah dimiliki dan tidak ada biaya baru.'),
('Jaring Padi Menjelang Panen','bahan-jaring-padi.jpg','padi','perlindungan_fisik','Menjelang Panen','bahan','Mengurangi gangguan burung menjelang panen.','Bisa tampil juga pada Perlindungan Tanaman.'),
('Angkut Hasil ke Titik Kumpul','tenaga-angkut-hasil.jpg','semua','tenaga','Panen','per_hasil','Memindahkan hasil dari petak panen ke titik kumpul lahan.','Transport kendaraan ke gudang/pembeli masuk Transportasi & Logistik.');
```

---

## 11. Referensi Utama

1. BPS — Nilai Produksi dan Biaya Produksi per Musim Tanam per Hektar Budidaya Padi, Jagung, dan Kedelai.  
   https://www.bps.go.id/id/statistics-table/1/MjA1NSMx/nilai-produksi-dan-biaya-produksi-per-musim-tanam-per-hektar-budidaya-tanaman-padi-sawah--padi-ladang--jagung--dan-kedelai--2017.html

2. Studi tahapan kegiatan usahatani padi sawah.  
   https://ejurnal.undana.ac.id/index.php/impas/article/download/19633/7593

3. Dinas Pertanian Pesisir Selatan — Panen dan pascapanen padi sawah.  
   https://disperta.pesisirselatankab.go.id/berita/panen-dan-pasca-panen-padi-sawah

4. Kompas Agri/Cybex Kementan — Ciri padi siap panen.  
   https://agri.kompas.com/read/2022/09/19/142900484/ciri-ciri-tanaman-padi-siap-panen?page=all

5. Corteva — Waktu panen jagung.  
   https://www.corteva.com/id/berita/Ketahui-Waktu-Panen-Jagung-yang-Tepat.html

6. FTP UGM — Teknologi pascapanen jagung.  
   https://kanalpengetahuan.tp.ugm.ac.id/menara-ilmu/2017/581-teknologi-pascapanen-jagung.html

7. Panduan Praktis Budidaya Jagung Hibrida.  
   https://sahabat.seger.co.id/contents/banner/ebook.pdf

8. Repository Pertanian — Teknologi panen dan pascapanen kedelai.  
   https://repository.pertanian.go.id/items/37b1b5a3-787b-4e72-afcd-372deba51f11

9. Repository Pertanian — Panen dan Pasca Panen Kedelai.  
   https://repository.pertanian.go.id/bitstreams/51c4898f-e40f-47b5-89b4-e98474c24942/download
