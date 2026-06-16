# AgroTrack — Katalog Pascapanen untuk Padi, Jagung, dan Kedelai

**Versi:** 1.0  
**Tanggal penyusunan:** 16 Juni 2026  
**Kategori:** Pascapanen  
**Target komoditas:** Padi, Jagung, Kedelai  
**Fungsi dokumen:** Referensi seed database, UI katalog operasional, pencatatan biaya pascapanen, dan card asset AgroTrack.

---

## 1. Catatan Utama

Kategori **Pascapanen** mencakup semua aktivitas setelah hasil diambil dari lahan sampai siap disimpan, dijual, atau diproses lebih lanjut.

Pascapanen perlu dipisahkan dari:
- **Panen:** aktivitas mengambil hasil dari tanaman/lahan.
- **Transportasi & Logistik:** pergerakan hasil dari lahan ke rumah/gudang/pembeli.
- **Hasil Panen:** jumlah produksi dan pendapatan.
- **Alat & Mesin:** mesin dapat muncul di pascapanen, tetapi biaya alat dan jasa harus dibedakan.
- **Bahan Pendukung:** karung, terpal, dan tali adalah bahan; aktivitas jemur/sortasi adalah pascapanen.

Pascapanen penting karena kualitas jual padi, jagung, dan kedelai sangat dipengaruhi kadar air, kebersihan, kerusakan biji, dan penyimpanan.

Sumber umum:
- BPS menyediakan data biaya produksi per musim tanam per hektar untuk padi, jagung, dan kedelai.  
  https://www.bps.go.id/id/statistics-table/1/MjA1NSMx/nilai-produksi-dan-biaya-produksi-per-musim-tanam-per-hektar-budidaya-tanaman-padi-sawah--padi-ladang--jagung--dan-kedelai--2017.html
- Penanganan pascapanen padi, khususnya pengeringan gabah, memengaruhi rendemen giling dan mutu beras.  
  https://media.neliti.com/media/publications/365735-none-50cdf4fb.pdf

---

## 2. Asset yang Digunakan

Kategori Pascapanen **tidak perlu asset baru** karena asset lama sudah cukup.

| No | Nama File Asset | Asal Folder | Nama Item UI | Status |
|---:|---|---|---|---|
| 1 | `tenaga-jemur-pengeringan.jpg` | `tenaga-kerja/` | Tenaga Jemur / Pengeringan | Pakai ulang |
| 2 | `alat-power-thresher.jpg` | `alat-mesin/` | Power Thresher / Mesin Perontok | Pakai ulang |
| 3 | `alat-corn-sheller.jpg` | `alat-mesin/` | Corn Sheller / Mesin Pemipil Jagung | Pakai ulang |
| 4 | `alat-timbangan-digital.jpg` | `alat-mesin/` | Timbangan Digital | Pakai ulang |
| 5 | `bahan-terpal-jemur.jpg` | `bahan-pendukung/` | Terpal Jemur | Pakai ulang |
| 6 | `bahan-karung-panen.jpg` | `bahan-pendukung/` | Karung Pascapanen | Pakai ulang |
| 7 | `bahan-tali-rafia.jpg` | `bahan-pendukung/` | Tali Rafia | Pakai ulang |
| 8 | `tenaga-angkut-hasil.jpg` | `tenaga-kerja/` | Pindah Hasil ke Area Jemur/Gudang | Pakai ulang |
| 9 | `alat-combine-harvester.jpg` | `alat-mesin/` | Combine Harvester | Pakai ulang, khusus padi bila mencakup rontok |

Asset tambahan opsional di masa depan:
- `alat-moisture-meter.jpg`
- `alat-grain-dryer.jpg`
- `transport-gudang-penyimpanan.jpg`

Saat ini belum wajib karena MD dapat memakai timbangan, terpal, thresher, sheller, karung, dan tenaga jemur.

---

## 3. Ringkasan Item Pascapanen

| No | Item | File Asset | Komoditas | Fase | Mode Biaya Utama | Status Harga/Biaya |
|---:|---|---|---|---|---|---|
| 1 | Jemur / Pengeringan Hasil | `tenaga-jemur-pengeringan.jpg` + `bahan-terpal-jemur.jpg` | Padi, Jagung, Kedelai | Pascapanen | HOK, borongan, sewa tempat, milik sendiri | INPUT_MANUAL_LOKAL |
| 2 | Perontokan Padi/Kedelai | `alat-power-thresher.jpg` | Padi, Kedelai | Pascapanen | jasa per hasil, sewa, milik sendiri, HOK | INPUT_MANUAL_LOKAL + REFERENSI_ALAT |
| 3 | Pemipilan Jagung | `alat-corn-sheller.jpg` | Jagung | Pascapanen | jasa per kg/karung, sewa, milik sendiri | INPUT_MANUAL_LOKAL + REFERENSI_ALAT |
| 4 | Sortasi dan Pembersihan | `tenaga-jemur-pengeringan.jpg` | Padi, Jagung, Kedelai | Pascapanen | HOK, borongan, tenaga keluarga | INPUT_MANUAL_LOKAL |
| 5 | Penimbangan Hasil | `alat-timbangan-digital.jpg` | Padi, Jagung, Kedelai | Pascapanen | milik sendiri, pinjam, jasa timbang | TERVERIFIKASI_MARKETPLACE |
| 6 | Pengemasan Karung | `bahan-karung-panen.jpg` + `bahan-tali-rafia.jpg` | Padi, Jagung, Kedelai | Pascapanen | beli ulang, habis pakai | TERVERIFIKASI_MARKETPLACE |
| 7 | Penyimpanan Sementara | `transport-gudang-penyimpanan.jpg` jika tersedia | Padi, Jagung, Kedelai | Pascapanen | sewa, iuran, milik sendiri, input manual | INPUT_MANUAL_LOKAL |
| 8 | Susut / Kehilangan Pascapanen | Tidak wajib asset | Padi, Jagung, Kedelai | Pascapanen | catatan risiko / pengurang hasil | INPUT_MANUAL |

---

## 4. Target Mutu dan Kadar Air

### 4.1 Padi

| Tahap | Catatan |
|---|---|
| Gabah Kering Panen / GKP | Gabah baru panen biasanya masih berkadar air tinggi. |
| Gabah Kering Giling / GKG | Banyak rujukan memakai sekitar 14% kadar air sebagai kondisi gabah siap giling. |
| Risiko | Gabah terlalu basah mudah rusak, berjamur, berkecambah, dan menurunkan mutu/rendemen. |

Sumber:
- Penerapan GHP/GMP menyebut pengadaan gabah dapat berupa GKP atau GKG, dan penanganan gabah dilakukan hati-hati agar tidak kotor, berjamur, dan membusuk.  
  https://www.jurnalpangan.com/index.php/pangan/article/download/369/323/880
- Artikel standar GKP/GKG menyebut GKP sekitar 20–25% dan GKG sekitar ±14%.  
  https://mtanigroup.com/2025/09/22/standar-mutu-padi-indonesia-peran-gkp-dan-gkg-dalam-penggilingan/

### 4.2 Jagung

| Tahap | Catatan |
|---|---|
| Setelah panen | Jagung biasanya masih perlu dikeringkan sebelum atau sesudah pemipilan. |
| Aman simpan | Banyak rujukan menyebut kadar air biji jagung aman disimpan sekitar 12–14%. |
| Risiko | Jagung terlalu basah mudah rusak, berjamur, dan sulit dipipil dengan baik. |

Sumber:
- FTP UGM menyebut pengeringan jagung diperlukan agar aman disimpan dan lebih mudah dipipil.  
  https://kanalpengetahuan.tp.ugm.ac.id/menara-ilmu/2017/581-teknologi-pascapanen-jagung.html
- Jurnal/penanganan jagung menyebut pengeringan biji jagung aman disimpan pada kadar air sekitar 12–14%.  
  https://jurnal.polinela.ac.id/index.php/JFA/article/download/1110/760/2356
- Dinas Pertanian Demak menyebut kadar air jagung standar mutu perdagangan 14%.  
  https://dinpertanpangan.demakkab.go.id/?p=4538

### 4.3 Kedelai

| Tahap | Catatan |
|---|---|
| Brangkasan | Dikeringkan dulu agar mudah dirontokkan. |
| Biji | Setelah dirontokkan, dibersihkan dan dikeringkan lagi sebelum dikemas/disimpan. |
| Risiko | Biji kedelai mudah pecah/retak jika perontokan tidak hati-hati. |

Sumber:
- Repository Pertanian menyebut tahapan pascapanen kedelai: pengeringan brangkasan, perontokan biji, pembersihan biji, pengeringan biji, pengemasan, dan penyimpanan.  
  https://repository.pertanian.go.id/items/37b1b5a3-787b-4e72-afcd-372deba51f11
- Dokumen “Panen dan Pasca Panen Kedelai” menyebut pengeringan hingga sekitar 14% dan perontokan harus hati-hati untuk menghindari biji pecah/retak.  
  https://repository.pertanian.go.id/bitstreams/51c4898f-e40f-47b5-89b4-e98474c24942/download
- Dinas Pertanian Demak menyebut penjemuran kedelai sampai kadar air 10–15% dan brangkasan tidak boleh ditumpuk besar terutama musim hujan.  
  https://dinpertanpangan.demakkab.go.id/?p=3395

---

## 5. Detail Item Katalog

### 5.1 Jemur / Pengeringan Hasil

| Field | Isi |
|---|---|
| Nama UI | Jemur / Pengeringan Hasil |
| Asset utama | `tenaga-jemur-pengeringan.jpg`, `bahan-terpal-jemur.jpg` |
| Komoditas | Padi, Jagung, Kedelai |
| Jenis biaya | Tenaga kerja, bahan pendukung, sewa tempat, alat pengering opsional |
| Mode biaya | `hok`, `upah_harian`, `borongan`, `tenaga_keluarga`, `milik_sendiri`, `input_manual` |
| Satuan | HOK, hari jemur, karung, kg, kuintal, m² terpal |
| Fungsi | Menurunkan kadar air hasil agar lebih aman disimpan/dijual |
| Risiko | Hujan, hasil berjamur, kadar air tidak seragam, kontaminasi tanah jika tanpa alas |
| Catatan UI | Hubungkan dengan terpal, tenaga jemur, dan target kadar air |

Deskripsi card:

> Jemur/pengeringan adalah aktivitas inti pascapanen untuk menurunkan kadar air gabah, jagung, atau kedelai. Biaya bisa berupa tenaga jemur, terpal, sewa tempat, atau jasa pengeringan.

---

### 5.2 Perontokan Padi/Kedelai

| Field | Isi |
|---|---|
| Nama UI | Perontokan Padi/Kedelai |
| Asset utama | `alat-power-thresher.jpg` |
| Komoditas | Padi, Kedelai |
| Jenis biaya | Jasa mesin, tenaga kerja, alat |
| Mode biaya | `jasa_per_hasil`, `sewa_harian`, `milik_sendiri`, `hok`, `borongan` |
| Satuan | kg, kuintal, karung, jam, hari |
| Fungsi | Memisahkan gabah/biji dari malai/tanaman/brangkasan |
| Risiko | Biji pecah, tercecer, kualitas turun, mesin tidak sesuai kadar air |
| Catatan UI | Jika panen padi memakai combine, perontokan mungkin sudah termasuk |

Deskripsi card:

> Perontokan memisahkan gabah atau biji kedelai dari tanaman. Untuk kedelai, perontokan perlu hati-hati agar biji tidak pecah atau retak.

---

### 5.3 Pemipilan Jagung

| Field | Isi |
|---|---|
| Nama UI | Pemipilan Jagung |
| Asset utama | `alat-corn-sheller.jpg` |
| Komoditas | Jagung |
| Jenis biaya | Jasa pemipilan, alat, tenaga kerja |
| Mode biaya | `jasa_per_kg`, `jasa_per_karung`, `sewa_harian`, `milik_sendiri`, `hok`, `borongan` |
| Satuan | kg, karung, kuintal, ton, jam |
| Fungsi | Memisahkan biji jagung dari tongkol |
| Risiko | Jagung terlalu basah dapat meningkatkan kerusakan biji saat dipipil |
| Catatan UI | Pisahkan biaya pemipilan dari biaya panen jagung jika tidak satu paket |

Deskripsi card:

> Pemipilan jagung adalah proses memisahkan biji dari tongkol. Biaya paling realistis dicatat sebagai jasa per kg/karung/kuintal atau biaya mesin milik sendiri.

---

### 5.4 Sortasi dan Pembersihan

| Field | Isi |
|---|---|
| Nama UI | Sortasi dan Pembersihan |
| Asset utama | `tenaga-jemur-pengeringan.jpg` atau icon default pascapanen |
| Komoditas | Padi, Jagung, Kedelai |
| Jenis biaya | Tenaga kerja |
| Mode biaya | `hok`, `upah_harian`, `borongan`, `tenaga_keluarga`, `input_manual` |
| Satuan | HOK, karung, kg, kuintal |
| Fungsi | Memisahkan kotoran, biji rusak, sisa batang/daun, dan material asing |
| Risiko | Mutu turun jika kotoran tinggi atau biji rusak tercampur |
| Catatan UI | Kualitas hasil dapat dihubungkan dengan harga jual |

Deskripsi card:

> Sortasi dan pembersihan membantu meningkatkan mutu hasil panen sebelum dikemas, disimpan, atau dijual. Aktivitas ini penting untuk jagung dan kedelai biji, serta gabah yang banyak kotoran.

---

### 5.5 Penimbangan Hasil

| Field | Isi |
|---|---|
| Nama UI | Penimbangan Hasil |
| Asset utama | `alat-timbangan-digital.jpg` |
| Komoditas | Padi, Jagung, Kedelai |
| Jenis biaya | Alat/jasa timbang |
| Mode biaya | `milik_sendiri`, `pinjam`, `beli_baru`, `jasa_timbang`, `input_manual` |
| Satuan | kg, karung, kuintal, ton |
| Fungsi | Mengukur hasil aktual sebagai dasar laporan dan pendapatan |
| Risiko | Data produksi tidak akurat jika hanya mengandalkan estimasi karung |
| Catatan UI | Harus terhubung ke tabel `hasil_panen` |

Deskripsi card:

> Penimbangan hasil mengubah catatan panen dari perkiraan menjadi data produksi yang lebih terukur. Ini penting untuk analisis profit AgroTrack.

---

### 5.6 Pengemasan Karung

| Field | Isi |
|---|---|
| Nama UI | Pengemasan Karung |
| Asset utama | `bahan-karung-panen.jpg`, `bahan-tali-rafia.jpg` |
| Komoditas | Padi, Jagung, Kedelai |
| Jenis biaya | Bahan pendukung + tenaga kerja |
| Mode biaya | `beli_ulang`, `habis_pakai`, `per_karung`, `borongan`, `input_manual` |
| Satuan | karung, lembar, roll, kg |
| Fungsi | Menyiapkan hasil agar mudah disimpan/diangkut/dijual |
| Risiko | Karung buruk dapat robek, kotor, atau tidak sesuai kapasitas |
| Catatan UI | Biaya karung dan tenaga pengemasan sebaiknya bisa dipisahkan |

Deskripsi card:

> Pengemasan karung mencakup penggunaan karung dan pengikat agar hasil siap disimpan atau diangkut. Cocok untuk gabah, jagung pipil, dan kedelai.

---

### 5.7 Penyimpanan Sementara

| Field | Isi |
|---|---|
| Nama UI | Penyimpanan Sementara |
| Asset utama | `transport-gudang-penyimpanan.jpg` jika tersedia |
| Komoditas | Padi, Jagung, Kedelai |
| Jenis biaya | Sewa/iuran gudang, tenaga susun, alas/palet, karung |
| Mode biaya | `sewa`, `iuran`, `milik_sendiri`, `input_manual` |
| Satuan | hari, minggu, bulan, karung, m² |
| Fungsi | Menyimpan hasil sementara sebelum dijual atau diproses |
| Risiko | Hasil rusak jika kadar air tinggi, gudang lembap, atau ventilasi buruk |
| Catatan UI | Tampilkan peringatan kadar air dan risiko jamur |

Deskripsi card:

> Penyimpanan sementara digunakan ketika hasil tidak langsung dijual. AgroTrack sebaiknya mencatat lama simpan, kondisi hasil, dan biaya gudang/iuran bila ada.

---

### 5.8 Susut / Kehilangan Pascapanen

| Field | Isi |
|---|---|
| Nama UI | Susut / Kehilangan Pascapanen |
| Asset utama | Tidak wajib |
| Komoditas | Padi, Jagung, Kedelai |
| Jenis biaya | Catatan risiko/pengurang hasil |
| Mode biaya | `persentase_susut`, `kg_susut`, `nilai_rugi`, `input_manual` |
| Satuan | %, kg, karung, rupiah |
| Fungsi | Mencatat kehilangan akibat tercecer, rusak, berjamur, pecah, atau dimakan hama |
| Risiko | Jika tidak dicatat, profit terlihat lebih baik dari kenyataan |
| Catatan UI | Bisa masuk sebagai pengurang hasil bersih |

Deskripsi card:

> Susut pascapanen membantu mencatat selisih antara hasil panen bruto dan hasil bersih siap jual. Ini penting untuk analisis profit yang lebih realistis.

---

## 6. Model Biaya Pascapanen

| Mode | Rumus |
|---|---|
| HOK/upah harian | `jumlah_orang × jumlah_hari × upah_per_orang` |
| Borongan | `tarif_borongan` |
| Jasa per hasil | `jumlah_kg/karung/kuintal × tarif_per_satuan` |
| Sewa alat | `tarif_sewa × durasi` |
| Milik sendiri | `BBM/listrik + operator + servis + penyusutan opsional` |
| Bahan pendukung | `jumlah × harga_satuan` |
| Sewa gudang | `tarif_per_hari/bulan × durasi` |
| Susut | `hasil_bruto - hasil_bersih` atau `hasil_bruto × persen_susut` |

---

## 7. Field Input UI yang Disarankan

```text
komoditas
musim_tanam_id
item_pascapanen_id
tanggal_mulai
tanggal_selesai
mode_biaya
jumlah_hasil_bruto_kg
jumlah_hasil_bersih_kg
persen_susut
kadar_air_awal
kadar_air_akhir
jumlah_karung
jumlah_orang
jumlah_hari
upah_per_hari
tarif_jasa_per_kg
tarif_jasa_per_karung
biaya_alat
biaya_bahan
biaya_tenaga
biaya_total_pascapanen
catatan_mutu
catatan_cuaca
```

---

## 8. Anti Double Counting

| Kasus | Aturan |
|---|---|
| Combine harvester | Jika combine sudah mencakup potong dan rontok, jangan input power thresher sebagai biaya penuh. |
| Terpal jemur | Terpal adalah bahan/aset, sedangkan tenaga jemur adalah upah. Keduanya boleh ada, tetapi jangan digabung tanpa rincian. |
| Corn sheller | Jika jasa pemipilan sudah dibayar per kg/karung, jangan masukkan harga beli mesin sebagai biaya musim. |
| Karung | Karung masuk bahan pendukung; jangan dijadikan bagian dari upah pengemasan kecuali borongan sudah mencakup karung. |
| Transportasi | Angkut ke gudang/pembeli masuk kategori Transportasi & Logistik, bukan Pascapanen, kecuali hanya geser hasil di area jemur/gudang. |

Warning UI:

```text
Periksa apakah biaya pascapanen ini sudah termasuk bahan, tenaga, alat, atau transportasi. Jika sudah satu paket borongan, jangan input komponen yang sama dua kali.
```

---

## 9. Rekomendasi Database

### 9.1 Master Item Pascapanen

```sql
CREATE TABLE IF NOT EXISTS pascapanen_items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nama_item VARCHAR(150) NOT NULL,
  nama_file_asset VARCHAR(255) NULL,
  komoditas ENUM('padi','jagung','kedelai','semua') NOT NULL,
  jenis_item ENUM('tenaga','alat','bahan','aktivitas','risiko','penyimpanan') NOT NULL,
  fase_penggunaan VARCHAR(100) DEFAULT 'Pascapanen',
  mode_biaya_default VARCHAR(100) NULL,
  fungsi TEXT NULL,
  catatan_overlap TEXT NULL,
  status ENUM('aktif','nonaktif') DEFAULT 'aktif',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

### 9.2 Transaksi Biaya Pascapanen

```sql
CREATE TABLE IF NOT EXISTS biaya_pascapanen (
  id INT AUTO_INCREMENT PRIMARY KEY,
  musim_tanam_id INT NOT NULL,
  pascapanen_item_id INT NULL,
  nama_biaya VARCHAR(150) NOT NULL,
  tanggal_biaya DATE NULL,
  mode_biaya ENUM('hok','upah_harian','borongan','jasa_per_hasil','sewa_alat','milik_sendiri','bahan','sewa_gudang','susut','input_manual') NOT NULL,
  jumlah_hasil_bruto_kg DECIMAL(14,2) NULL,
  jumlah_hasil_bersih_kg DECIMAL(14,2) NULL,
  kadar_air_awal DECIMAL(5,2) NULL,
  kadar_air_akhir DECIMAL(5,2) NULL,
  persen_susut DECIMAL(5,2) NULL,
  jumlah_orang DECIMAL(10,2) NULL,
  jumlah_hari DECIMAL(10,2) NULL,
  upah_per_orang DECIMAL(14,2) NULL,
  jumlah_satuan DECIMAL(14,2) NULL,
  satuan VARCHAR(50) NULL,
  tarif_per_satuan DECIMAL(14,2) NULL,
  tarif_borongan DECIMAL(14,2) NULL,
  biaya_bahan DECIMAL(14,2) NULL,
  biaya_alat DECIMAL(14,2) NULL,
  biaya_total DECIMAL(14,2) NOT NULL DEFAULT 0,
  catatan TEXT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

---

## 10. Contoh SQL Seed

```sql
INSERT INTO pascapanen_items
(nama_item, nama_file_asset, komoditas, jenis_item, fase_penggunaan, mode_biaya_default, fungsi, catatan_overlap)
VALUES
('Jemur / Pengeringan Hasil','tenaga-jemur-pengeringan.jpg','semua','aktivitas','Pascapanen','hok','Menurunkan kadar air hasil agar lebih aman disimpan atau dijual.','Terpal dan tenaga jemur dapat dicatat terpisah.'),
('Perontokan Padi/Kedelai','alat-power-thresher.jpg','semua','alat','Pascapanen','jasa_per_hasil','Merontokkan gabah atau biji kedelai.','Tidak perlu jika combine sudah mencakup perontokan.'),
('Pemipilan Jagung','alat-corn-sheller.jpg','jagung','alat','Pascapanen','jasa_per_hasil','Memisahkan biji jagung dari tongkol.','Pisahkan dari biaya panen jagung jika tidak satu paket.'),
('Sortasi dan Pembersihan','tenaga-jemur-pengeringan.jpg','semua','tenaga','Pascapanen','hok','Memisahkan kotoran, biji rusak, dan material asing.','Kualitas hasil dapat memengaruhi harga jual.'),
('Penimbangan Hasil','alat-timbangan-digital.jpg','semua','alat','Pascapanen','input_manual','Mengukur hasil aktual untuk laporan dan pendapatan.','Terhubung ke hasil_panen.'),
('Pengemasan Karung','bahan-karung-panen.jpg','semua','bahan','Pascapanen','bahan','Menyiapkan hasil agar mudah disimpan/diangkut/dijual.','Karung dan tenaga pengemasan bisa dipisah.'),
('Penyimpanan Sementara','transport-gudang-penyimpanan.jpg','semua','penyimpanan','Pascapanen','sewa_gudang','Menyimpan hasil sementara sebelum dijual atau diproses.','Pastikan kadar air aman sebelum disimpan.'),
('Susut / Kehilangan Pascapanen',NULL,'semua','risiko','Pascapanen','susut','Mencatat kehilangan hasil akibat tercecer, rusak, jamur, pecah, atau penyimpanan.','Masuk sebagai pengurang hasil bersih.');
```

---

## 11. Referensi Utama

1. BPS — Nilai Produksi dan Biaya Produksi per Musim Tanam per Hektar Budidaya Padi, Jagung, dan Kedelai.  
   https://www.bps.go.id/id/statistics-table/1/MjA1NSMx/nilai-produksi-dan-biaya-produksi-per-musim-tanam-per-hektar-budidaya-tanaman-padi-sawah--padi-ladang--jagung--dan-kedelai--2017.html

2. Penerapan GHP dan GMP pada Penanganan Pascapanen Gabah.  
   https://www.jurnalpangan.com/index.php/pangan/article/download/369/323/880

3. Penanganan pascapanen padi dan pengeringan gabah.  
   https://media.neliti.com/media/publications/365735-none-50cdf4fb.pdf

4. Standar GKP dan GKG.  
   https://mtanigroup.com/2025/09/22/standar-mutu-padi-indonesia-peran-gkp-dan-gkg-dalam-penggilingan/

5. FTP UGM — Teknologi Pascapanen Jagung.  
   https://kanalpengetahuan.tp.ugm.ac.id/menara-ilmu/2017/581-teknologi-pascapanen-jagung.html

6. Potensi kehilangan hasil panen dan pascapanen jagung.  
   https://jurnal.polinela.ac.id/index.php/JFA/article/download/1110/760/2356

7. Dinas Pertanian Demak — Mengupayakan jagung supaya tidak ditolak di pasaran.  
   https://dinpertanpangan.demakkab.go.id/?p=4538

8. Repository Pertanian — Teknologi panen dan pascapanen kedelai.  
   https://repository.pertanian.go.id/items/37b1b5a3-787b-4e72-afcd-372deba51f11

9. Repository Pertanian — Panen dan Pasca Panen Kedelai.  
   https://repository.pertanian.go.id/bitstreams/51c4898f-e40f-47b5-89b4-e98474c24942/download

10. Dinas Pertanian Demak — Pasca Panen Kedelai.  
    https://dinpertanpangan.demakkab.go.id/?p=3395
