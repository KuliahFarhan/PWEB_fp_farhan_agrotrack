# AgroTrack — Katalog Tenaga Kerja untuk Padi, Jagung, dan Kedelai

**Versi:** 1.0  
**Tanggal penyusunan:** 16 Juni 2026  
**Kategori:** Tenaga Kerja  
**Target komoditas:** Padi, Jagung, Kedelai  
**Fungsi dokumen:** Referensi seed database, UI katalog operasional, input biaya produksi, dan card asset AgroTrack.

---

## 1. Catatan Utama: Tenaga Kerja Harus Fleksibel

Kategori **Tenaga Kerja** tidak boleh diperlakukan seperti benih, pupuk, atau pestisida yang biasanya punya harga per kemasan. Dalam realita petani, tenaga kerja bisa berbentuk:

1. **Upah harian / HOK**  
   Pekerja dibayar per hari atau per Hari Orang Kerja.

2. **Borongan**  
   Pekerjaan dibayar per paket, misalnya tanam padi satu petak, panen satu lahan, atau angkut hasil satu musim.

3. **Upah per satuan hasil**  
   Misalnya angkut per karung, panen per kg/kuintal, jemur per karung, atau pemipilan jagung per karung.

4. **Tenaga keluarga**  
   Dikerjakan oleh keluarga. Bisa dicatat Rp0 secara kas, tetapi tetap bisa diberi nilai bayangan jika ingin analisis ekonomi lengkap.

5. **Gotong royong / sambatan**  
   Biaya tunai kecil atau tidak ada, tetapi bisa ada konsumsi, rokok, transportasi, atau iuran.

6. **Jasa dengan alat/operator**  
   Misalnya panen pakai combine harvester, pemipilan jagung, atau pengolahan tanah dengan traktor. Ini gabungan tenaga kerja + mesin.

7. **Tambahan pekerjaan tak terduga**  
   Misalnya penyulaman ulang karena tanaman mati, pengendalian hama mendadak, perbaikan pematang bocor, panen dipercepat karena hujan, atau pengeringan tambahan.

Karena itu, di AgroTrack kategori tenaga kerja harus menyediakan **opsi tambahan manual**, bukan hanya item yang ada gambarnya.

---

## 2. Landasan Konsep

BPS mendefinisikan upah nominal buruh tani sebagai rata-rata upah harian yang diterima buruh tani sebagai balas jasa pekerjaan yang telah dilakukan. Karena upah berbeda antar wilayah dan waktu, AgroTrack sebaiknya tidak mengunci satu harga nasional sebagai harga final.  
Sumber: https://sirusa.web.bps.go.id/metadata/indikator/3751

BPS juga menyediakan data biaya produksi per musim tanam per hektar untuk padi sawah, padi ladang, jagung, dan kedelai. Ini mendukung desain AgroTrack yang mencatat biaya per musim tanam/per hektar.  
Sumber: https://www.bps.go.id/id/statistics-table/1/MjA1NSMx/nilai-produksi-dan-biaya-produksi-per-musim-tanam-per-hektar-budidaya-tanaman-padi-sawah--padi-ladang--jagung--dan-kedelai--2017.html

Dalam IndoGAP/SNI 8969:2021, tenaga kerja untuk pertanaman, panen, dan penanganan pascapanen harus memiliki kompetensi, pengetahuan penggunaan pestisida/alat, kebersihan personal, dan penerapan K3. Ini relevan untuk UI AgroTrack agar tenaga kerja penyemprotan, panen, dan pascapanen diberi catatan keselamatan.  
Sumber: https://icert.id/wp-content/uploads/2022/08/SNI-INDOGAP.pdf

Dalam kajian usahatani padi, tahapan kegiatan dapat mencakup pengolahan lahan, penyiapan bibit, persemaian, penanaman, pemupukan, penyiangan, panen, dan pascapanen.  
Sumber: https://ejurnal.undana.ac.id/index.php/impas/article/download/19633/7593

Ukuran tenaga kerja dalam usahatani sering dinyatakan sebagai HOK/HKO/HKSP. Salah satu rujukan menyebut ukuran tenaga kerja dapat dinyatakan dalam Hari Orang Kerja atau Hari Kerja Orang.  
Sumber: https://ejournal.unsrat.ac.id/v3/index.php/agrirud/article/download/45048/40756/101969

---

## 3. Asset yang Sudah Disiapkan

| No | Nama File Asset | Nama Item UI | Status |
|---:|---|---|---|
| 1 | `tenaga-olah-tanah-manual.jpg` | Tenaga Olah Tanah Manual | Siap pakai |
| 2 | `tenaga-tanam-padi.jpg` | Tenaga Tanam Padi | Siap pakai |
| 3 | `tenaga-tanam-jagung.jpg` | Tenaga Tanam Jagung | Siap pakai |
| 4 | `tenaga-tanam-kedelai.jpg` | Tenaga Tanam Kedelai | Siap pakai |
| 5 | `tenaga-pemupukan.jpg` | Tenaga Pemupukan | Siap pakai |
| 6 | `tenaga-penyemprotan.jpg` | Tenaga Penyemprotan | Siap pakai |
| 7 | `tenaga-penyiangan.jpg` | Tenaga Penyiangan | Siap pakai |
| 8 | `tenaga-pengairan.jpg` | Tenaga Pengairan | Siap pakai |
| 9 | `tenaga-panen-padi.jpg` | Tenaga Panen Padi | Siap pakai |
| 10 | `tenaga-panen-jagung.jpg` | Tenaga Panen Jagung | Siap pakai |
| 11 | `tenaga-panen-kedelai.jpg` | Tenaga Panen Kedelai | Siap pakai |
| 12 | `tenaga-angkut-hasil.jpg` | Tenaga Angkut Hasil | Siap pakai |
| 13 | `tenaga-jemur-pengeringan.jpg` | Tenaga Jemur / Pengeringan | Siap pakai |

Rekomendasi folder:

```text
assets/img/saprodi/tenaga-kerja/
```

---

## 4. Opsi Tambahan yang Harus Tetap Ada Walaupun Belum Ada Gambar

Asset yang ada sudah cukup kuat, tetapi UI AgroTrack sebaiknya tetap menyediakan tombol **“Tambah Tenaga Kerja Lainnya”**. Alasannya: kebutuhan tenaga kerja petani sangat lokal dan bisa muncul mendadak.

| No | Opsi Tambahan | Relevan untuk | Fase | Alasan perlu ada |
|---:|---|---|---|---|
| 1 | Tenaga Persemaian Padi | Padi | Pra-tanam | Padi sering memakai persemaian sebelum pindah tanam. |
| 2 | Tenaga Cabut Bibit / Pindah Tanam | Padi | Tanam | Padi sawah butuh cabut bibit dan pindah tanam jika sistem manual. |
| 3 | Tenaga Penyulaman | Padi, Jagung, Kedelai | Awal pertumbuhan | Mengganti tanaman mati/tidak tumbuh. |
| 4 | Tenaga Penjarangan | Jagung, Kedelai | Awal pertumbuhan | Mengatur jumlah tanaman per lubang/baris. |
| 5 | Tenaga Pengamatan OPT | Padi, Jagung, Kedelai | Vegetatif-Generatif | Monitoring hama/penyakit sebelum tindakan. |
| 6 | Tenaga Pemasangan Perangkap | Padi, Jagung, Kedelai | Vegetatif-Generatif | Feromon, sticky trap, perangkap tikus. |
| 7 | Tenaga Perbaikan Pematang | Padi | Pra-tanam/Selama musim | Pematang bocor memengaruhi air sawah. |
| 8 | Tenaga Perbaikan Drainase | Jagung, Kedelai, Padi | Pra-tanam/Hujan | Mengurangi genangan. |
| 9 | Operator Traktor | Padi, Jagung, Kedelai | Pra-tanam | Jasa mesin biasanya butuh operator. |
| 10 | Operator Pompa Air | Padi, Jagung, Kedelai | Saat irigasi | Pompa bisa membutuhkan operator harian. |
| 11 | Operator Combine Harvester | Padi | Panen | Jika panen mekanis. |
| 12 | Tenaga Perontokan Padi | Padi | Panen/Pascapanen | Jika tidak memakai combine. |
| 13 | Tenaga Pemipilan Jagung | Jagung | Pascapanen | Jagung perlu dipipil sebelum dijual/disimpan. |
| 14 | Tenaga Sortasi / Grading | Padi, Jagung, Kedelai | Pascapanen | Memilah hasil layak jual. |
| 15 | Tenaga Bongkar Muat | Padi, Jagung, Kedelai | Panen/Pascapanen | Loading hasil ke kendaraan/gudang. |
| 16 | Tenaga Penyimpanan Gudang | Padi, Jagung, Kedelai | Pascapanen | Menata karung, menjaga gudang, cek kelembapan. |
| 17 | Tenaga Penjualan / Distribusi | Padi, Jagung, Kedelai | Pascapanen | Mengantar ke pengepul/pasar. |
| 18 | Mandor / Koordinator Buruh | Padi, Jagung, Kedelai | Semua fase | Muncul pada lahan besar atau borongan. |
| 19 | Konsumsi Tenaga Kerja | Padi, Jagung, Kedelai | Semua fase | Biaya non-upah yang sering nyata. |
| 20 | Transport Tenaga Kerja | Padi, Jagung, Kedelai | Semua fase | Ongkos antar jemput pekerja jika ada. |

Catatan UI:
- Opsi tambahan ini tidak wajib punya gambar di awal.
- Untuk item manual, gunakan gambar default `tenaga-lainnya.jpg` atau icon pekerja.
- Jangan batasi petani hanya pada item yang ada gambar.

---

## 5. Model Biaya Tenaga Kerja

### 5.1 Mode Pembayaran

| Mode | Rumus biaya | Contoh |
|---|---|---|
| Upah harian | `jumlah_orang × jumlah_hari × upah_per_orang_per_hari` | 3 orang × 2 hari × Rp80.000 |
| HOK/HKO | `jumlah_HOK × upah_per_HOK` | 10 HOK × Rp75.000 |
| Borongan | `biaya_total = tarif_borongan` | Tanam padi satu petak Rp600.000 |
| Per luas | `luas_ha × tarif_per_ha` | Panen padi Rp1.500.000/ha |
| Per hasil | `jumlah_karung/kg/kuintal × tarif_per_satuan` | Angkut 50 karung × Rp5.000 |
| Tenaga keluarga | `biaya_tunai = 0`, `nilai_ekonomi_opsional = HOK × upah_acuan` | Dikerjakan keluarga |
| Gotong royong | `konsumsi + iuran + biaya kecil lain` | Konsumsi Rp150.000 |
| Jasa mesin + operator | `tarif_jasa + BBM + operator jika terpisah` | Combine harvester |
| Input manual | `nominal bebas` | Kasus lokal/tidak standar |

### 5.2 Rumus HOK Sederhana

```text
HOK = (jumlah_orang × jumlah_jam_kerja × jumlah_hari) / jam_standar_kerja
```

Rekomendasi default AgroTrack:

```text
jam_standar_kerja = 7 atau 8 jam
```

Untuk UI sederhana, pakai:

```text
HOK = jumlah_orang × jumlah_hari
```

Tetapi sediakan field jam kerja jika ingin lebih detail.

### 5.3 Tenaga Keluarga dan Nilai Bayangan

Untuk analisis kas sederhana:

```text
biaya_tunai_tenaga_keluarga = 0
```

Untuk analisis ekonomi lengkap:

```text
nilai_tenaga_keluarga = jumlah_HOK × upah_acuan_lokal
```

Saran AgroTrack:
- Tampilkan dua angka:
  1. **Biaya tunai**
  2. **Nilai ekonomi tenaga keluarga** opsional

Ini penting karena profit kas dan profit ekonomi bisa berbeda. Jika petani mengerjakan sendiri, cash-out kecil, tetapi waktu kerja tetap punya nilai.

---

## 6. Ringkasan Katalog Tenaga Kerja

| No | Item | File Asset | Fase | Komoditas | Mode Biaya Utama | Status Harga/Upah |
|---:|---|---|---|---|---|---|
| 1 | Tenaga Olah Tanah Manual | `tenaga-olah-tanah-manual.jpg` | Pra-tanam | Padi, Jagung, Kedelai | HOK, harian, borongan, keluarga | INPUT_MANUAL_LOKAL |
| 2 | Tenaga Tanam Padi | `tenaga-tanam-padi.jpg` | Tanam | Padi | HOK, borongan, keluarga | INPUT_MANUAL_LOKAL |
| 3 | Tenaga Tanam Jagung | `tenaga-tanam-jagung.jpg` | Tanam | Jagung | HOK, borongan, keluarga | INPUT_MANUAL_LOKAL |
| 4 | Tenaga Tanam Kedelai | `tenaga-tanam-kedelai.jpg` | Tanam | Kedelai | HOK, borongan, keluarga | INPUT_MANUAL_LOKAL |
| 5 | Tenaga Pemupukan | `tenaga-pemupukan.jpg` | Dasar, vegetatif, generatif | Padi, Jagung, Kedelai | HOK, harian, borongan | INPUT_MANUAL_LOKAL |
| 6 | Tenaga Penyemprotan | `tenaga-penyemprotan.jpg` | Vegetatif, generatif | Padi, Jagung, Kedelai | HOK, harian, borongan | INPUT_MANUAL_LOKAL + K3 |
| 7 | Tenaga Penyiangan | `tenaga-penyiangan.jpg` | Awal-vegetatif | Padi, Jagung, Kedelai | HOK, harian, borongan, keluarga | INPUT_MANUAL_LOKAL |
| 8 | Tenaga Pengairan | `tenaga-pengairan.jpg` | Selama musim | Padi, Jagung, Kedelai | Harian, operator, iuran, keluarga | INPUT_MANUAL_LOKAL |
| 9 | Tenaga Panen Padi | `tenaga-panen-padi.jpg` | Panen | Padi | Borongan, per ha, per hasil, harian | INPUT_MANUAL_LOKAL |
| 10 | Tenaga Panen Jagung | `tenaga-panen-jagung.jpg` | Panen | Jagung | Borongan, per ha, per hasil, harian | INPUT_MANUAL_LOKAL |
| 11 | Tenaga Panen Kedelai | `tenaga-panen-kedelai.jpg` | Panen | Kedelai | Borongan, per ha, per hasil, harian | INPUT_MANUAL_LOKAL |
| 12 | Tenaga Angkut Hasil | `tenaga-angkut-hasil.jpg` | Panen/Pascapanen | Padi, Jagung, Kedelai | Per karung, per trip, borongan, harian | INPUT_MANUAL_LOKAL |
| 13 | Tenaga Jemur / Pengeringan | `tenaga-jemur-pengeringan.jpg` | Pascapanen | Padi, Jagung, Kedelai | HOK, harian, borongan, keluarga | INPUT_MANUAL_LOKAL |

---

## 7. Detail Item Katalog

### 7.1 Tenaga Olah Tanah Manual

| Field | Isi |
|---|---|
| Nama UI | Tenaga Olah Tanah Manual |
| Nama file | `tenaga-olah-tanah-manual.jpg` |
| Fase | Pra-tanam |
| Komoditas | Padi, Jagung, Kedelai |
| Jenis pekerjaan | Mencangkul, merapikan tanah, membuat parit kecil, memperbaiki area lahan |
| Mode biaya | `upah_harian`, `HOK`, `borongan`, `tenaga_keluarga`, `gotong_royong`, `input_manual` |
| Satuan | HOK, orang-hari, paket, petak, hektar |
| Fungsi | Menyiapkan lahan secara manual ketika alat mesin tidak dipakai atau hanya untuk pekerjaan detail |
| Risiko/keterbatasan | Lambat untuk lahan luas; biaya tenaga bisa besar |
| Catatan UI | Cocok sebagai biaya tambahan walaupun lahan juga dibajak traktor |

Deskripsi card:

> Tenaga olah tanah manual digunakan untuk pekerjaan detail seperti mencangkul, merapikan tanah, membuka parit kecil, atau memperbaiki bagian lahan yang tidak terjangkau mesin.

---

### 7.2 Tenaga Tanam Padi

| Field | Isi |
|---|---|
| Nama UI | Tenaga Tanam Padi |
| Nama file | `tenaga-tanam-padi.jpg` |
| Fase | Tanam |
| Komoditas | Padi |
| Jenis pekerjaan | Cabut bibit, angkut bibit, tandur/pindah tanam, merapikan jarak tanam |
| Mode biaya | `HOK`, `upah_harian`, `borongan`, `tenaga_keluarga`, `gotong_royong` |
| Satuan | orang-hari, HOK, petak, hektar |
| Fungsi | Memindahkan bibit padi dari persemaian ke sawah |
| Risiko/keterbatasan | Waktu tanam perlu serempak agar pertumbuhan lebih merata |
| Catatan UI | Tambahkan opsi “tenaga persemaian” dan “cabut bibit” sebagai detail tambahan |

Deskripsi card:

> Tenaga tanam padi digunakan untuk pekerjaan pindah tanam/tandur. Pada beberapa daerah, pekerjaan ini dibayar borongan per petak atau per luasan.

---

### 7.3 Tenaga Tanam Jagung

| Field | Isi |
|---|---|
| Nama UI | Tenaga Tanam Jagung |
| Nama file | `tenaga-tanam-jagung.jpg` |
| Fase | Tanam |
| Komoditas | Jagung |
| Jenis pekerjaan | Membuat lubang tanam, memasukkan benih, menutup lubang, menata barisan |
| Mode biaya | `HOK`, `upah_harian`, `borongan`, `tenaga_keluarga` |
| Satuan | orang-hari, HOK, hektar, petak |
| Fungsi | Menanam benih jagung sesuai jarak tanam |
| Risiko/keterbatasan | Keseragaman jarak dan kedalaman tanam memengaruhi pertumbuhan |
| Catatan UI | Tambahkan opsi “penjarangan” pada fase awal pertumbuhan |

Deskripsi card:

> Tenaga tanam jagung mencakup pembuatan lubang tanam, penempatan benih, dan penutupan lubang. Item ini bisa dihitung per HOK atau borongan per lahan.

---

### 7.4 Tenaga Tanam Kedelai

| Field | Isi |
|---|---|
| Nama UI | Tenaga Tanam Kedelai |
| Nama file | `tenaga-tanam-kedelai.jpg` |
| Fase | Tanam |
| Komoditas | Kedelai |
| Jenis pekerjaan | Membuat lubang/baris tanam, menanam benih, menutup lubang, pengaturan jarak |
| Mode biaya | `HOK`, `upah_harian`, `borongan`, `tenaga_keluarga` |
| Satuan | orang-hari, HOK, hektar, petak |
| Fungsi | Menanam benih kedelai pada lahan kering atau bekas padi |
| Risiko/keterbatasan | Benih perlu tertanam seragam; genangan dapat mengganggu pertumbuhan |
| Catatan UI | Tambahkan opsi “penyulaman” jika banyak benih tidak tumbuh |

Deskripsi card:

> Tenaga tanam kedelai mencakup pekerjaan membuat lubang atau barisan tanam dan menanam benih secara seragam.

---

### 7.5 Tenaga Pemupukan

| Field | Isi |
|---|---|
| Nama UI | Tenaga Pemupukan |
| Nama file | `tenaga-pemupukan.jpg` |
| Fase | Pra-tanam, awal pertumbuhan, vegetatif, generatif |
| Komoditas | Padi, Jagung, Kedelai |
| Jenis pekerjaan | Menabur pupuk dasar, pupuk susulan, pupuk organik, atau nutrisi tambahan |
| Mode biaya | `HOK`, `upah_harian`, `borongan`, `tenaga_keluarga` |
| Satuan | orang-hari, HOK, aplikasi, hektar |
| Fungsi | Mengaplikasikan pupuk sesuai fase tanaman |
| Risiko/keterbatasan | Salah waktu/cara aplikasi dapat menurunkan efisiensi pupuk |
| Catatan UI | Hubungkan dengan item pupuk yang dipakai agar biaya tenaga dan biaya input terlihat terpisah |

Deskripsi card:

> Tenaga pemupukan adalah biaya kerja untuk mengaplikasikan pupuk. Dalam AgroTrack, biaya ini sebaiknya dipisah dari harga pupuk agar analisis biaya lebih jelas.

---

### 7.6 Tenaga Penyemprotan

| Field | Isi |
|---|---|
| Nama UI | Tenaga Penyemprotan |
| Nama file | `tenaga-penyemprotan.jpg` |
| Fase | Vegetatif, generatif, kondisi serangan OPT |
| Komoditas | Padi, Jagung, Kedelai |
| Jenis pekerjaan | Menyemprot pestisida, pupuk daun, POC, atau agens hayati |
| Mode biaya | `HOK`, `upah_harian`, `borongan`, `jasa_semprot`, `tenaga_keluarga` |
| Satuan | orang-hari, aplikasi, tangki, hektar |
| Fungsi | Mengaplikasikan perlindungan tanaman atau nutrisi cair |
| Risiko/keterbatasan | Membutuhkan APD, pengetahuan pestisida, dan kondisi cuaca yang sesuai |
| Catatan UI | Wajib tampilkan badge K3 dan “gunakan APD” |

Deskripsi card:

> Tenaga penyemprotan mencakup pekerjaan aplikasi pestisida, pupuk daun, POC, atau agens hayati. Item ini harus diberi catatan keselamatan kerja karena berkaitan dengan bahan kimia atau mikroba.

---

### 7.7 Tenaga Penyiangan

| Field | Isi |
|---|---|
| Nama UI | Tenaga Penyiangan |
| Nama file | `tenaga-penyiangan.jpg` |
| Fase | Awal pertumbuhan, vegetatif |
| Komoditas | Padi, Jagung, Kedelai |
| Jenis pekerjaan | Menyiangi gulma manual, membersihkan rumput sekitar tanaman, merapikan barisan |
| Mode biaya | `HOK`, `upah_harian`, `borongan`, `tenaga_keluarga`, `gotong_royong` |
| Satuan | orang-hari, HOK, hektar, petak |
| Fungsi | Mengurangi persaingan gulma terhadap tanaman utama |
| Risiko/keterbatasan | Bisa memakan banyak tenaga jika gulma tinggi |
| Catatan UI | Bisa dibandingkan dengan biaya herbisida pada kategori perlindungan tanaman |

Deskripsi card:

> Tenaga penyiangan digunakan untuk membersihkan gulma secara manual. Biaya ini penting dicatat karena dapat menjadi alternatif atau pendamping penggunaan herbisida.

---

### 7.8 Tenaga Pengairan

| Field | Isi |
|---|---|
| Nama UI | Tenaga Pengairan |
| Nama file | `tenaga-pengairan.jpg` |
| Fase | Selama musim tanam |
| Komoditas | Padi, Jagung, Kedelai |
| Jenis pekerjaan | Mengatur air, membuka/menutup saluran, mengoperasikan pompa, memantau drainase |
| Mode biaya | `upah_harian`, `operator`, `iuran`, `tenaga_keluarga`, `input_manual` |
| Satuan | hari, jam, aplikasi, musim |
| Fungsi | Mengatur ketersediaan air sesuai kebutuhan tanaman |
| Risiko/keterbatasan | Biaya dapat meningkat saat kemarau karena perlu pompa/BBM |
| Catatan UI | Hubungkan dengan kategori Air & Irigasi seperti pompa, BBM, saluran, dan drainase |

Deskripsi card:

> Tenaga pengairan adalah pekerjaan mengatur aliran air, pompa, atau saluran. Biaya ini sering muncul saat irigasi tidak otomatis atau saat musim kering.

---

### 7.9 Tenaga Panen Padi

| Field | Isi |
|---|---|
| Nama UI | Tenaga Panen Padi |
| Nama file | `tenaga-panen-padi.jpg` |
| Fase | Panen |
| Komoditas | Padi |
| Jenis pekerjaan | Memotong padi, mengumpulkan, merontokkan manual, mengemas gabah |
| Mode biaya | `borongan`, `per_ha`, `per_hasil`, `HOK`, `jasa_mesin_operator` |
| Satuan | hektar, petak, karung, kg, kuintal, HOK |
| Fungsi | Mengambil hasil padi dari lahan |
| Risiko/keterbatasan | Cuaca dan ketersediaan buruh sangat memengaruhi kecepatan panen |
| Catatan UI | Jika memakai combine, catat sebagai jasa mesin + operator, bukan hanya tenaga manual |

Deskripsi card:

> Tenaga panen padi digunakan untuk memanen dan mengumpulkan gabah. Jika panen memakai combine harvester, AgroTrack sebaiknya mencatatnya sebagai jasa mesin/operator.

---

### 7.10 Tenaga Panen Jagung

| Field | Isi |
|---|---|
| Nama UI | Tenaga Panen Jagung |
| Nama file | `tenaga-panen-jagung.jpg` |
| Fase | Panen |
| Komoditas | Jagung |
| Jenis pekerjaan | Memetik tongkol, mengumpulkan, mengangkut ke tempat jemur/pemipilan |
| Mode biaya | `borongan`, `per_ha`, `per_hasil`, `HOK`, `tenaga_keluarga` |
| Satuan | hektar, petak, karung, kg, kuintal, HOK |
| Fungsi | Mengambil tongkol jagung dari lahan |
| Risiko/keterbatasan | Hasil sering masih perlu dikeringkan dan dipipil |
| Catatan UI | Tambahkan opsi tambahan “tenaga pemipilan jagung” untuk pascapanen |

Deskripsi card:

> Tenaga panen jagung mencakup pemetikan tongkol, pengumpulan, dan persiapan menuju pengeringan atau pemipilan.

---

### 7.11 Tenaga Panen Kedelai

| Field | Isi |
|---|---|
| Nama UI | Tenaga Panen Kedelai |
| Nama file | `tenaga-panen-kedelai.jpg` |
| Fase | Panen |
| Komoditas | Kedelai |
| Jenis pekerjaan | Mencabut/memotong tanaman, mengumpulkan brangkasan, mengangkut ke tempat jemur |
| Mode biaya | `borongan`, `per_ha`, `per_hasil`, `HOK`, `tenaga_keluarga` |
| Satuan | hektar, petak, karung, kg, HOK |
| Fungsi | Mengambil tanaman kedelai saat polong siap panen |
| Risiko/keterbatasan | Kedelai perlu penanganan tepat agar kehilangan hasil tidak tinggi |
| Catatan UI | Tambahkan opsi “perontokan kedelai” dan “sortasi biji” jika katalog diperluas |

Deskripsi card:

> Tenaga panen kedelai mencakup mencabut atau memotong tanaman, mengumpulkan brangkasan, dan menyiapkan hasil untuk pengeringan/perontokan.

---

### 7.12 Tenaga Angkut Hasil

| Field | Isi |
|---|---|
| Nama UI | Tenaga Angkut Hasil |
| Nama file | `tenaga-angkut-hasil.jpg` |
| Fase | Panen dan pascapanen |
| Komoditas | Padi, Jagung, Kedelai |
| Jenis pekerjaan | Mengangkut karung, hasil panen, input, alat, atau hasil dari lahan ke rumah/gudang/pembeli |
| Mode biaya | `per_karung`, `per_trip`, `borongan`, `upah_harian`, `input_manual` |
| Satuan | karung, trip, kg, kuintal, hari |
| Fungsi | Memindahkan hasil atau input dari/ke lahan |
| Risiko/keterbatasan | Biaya sangat dipengaruhi jarak lahan, akses jalan, dan berat hasil |
| Catatan UI | Bedakan tenaga angkut dari biaya kendaraan/transportasi jika memungkinkan |

Deskripsi card:

> Tenaga angkut hasil adalah biaya kerja untuk memindahkan hasil panen dari lahan ke rumah, gudang, tempat jemur, atau pembeli. Tarif bisa per karung, per trip, atau borongan.

---

### 7.13 Tenaga Jemur / Pengeringan

| Field | Isi |
|---|---|
| Nama UI | Tenaga Jemur / Pengeringan |
| Nama file | `tenaga-jemur-pengeringan.jpg` |
| Fase | Pascapanen |
| Komoditas | Padi, Jagung, Kedelai |
| Jenis pekerjaan | Menjemur, membalik hasil, menjaga jemuran, mengangkat saat hujan, mengemas setelah kering |
| Mode biaya | `HOK`, `upah_harian`, `borongan`, `tenaga_keluarga`, `input_manual` |
| Satuan | orang-hari, karung, kuintal, hari jemur |
| Fungsi | Menurunkan kadar air hasil panen agar lebih aman disimpan/dijual |
| Risiko/keterbatasan | Sangat tergantung cuaca, tempat jemur, dan tenaga untuk membalik/mengangkat hasil |
| Catatan UI | Hubungkan dengan asset bahan pendukung seperti terpal jemur dan moisture meter jika ada |

Deskripsi card:

> Tenaga jemur/pengeringan mencakup pekerjaan menjemur, membalik, menjaga, dan mengangkat hasil panen. Biaya ini penting untuk padi, jagung, dan kedelai karena kualitas jual dipengaruhi kadar air.

---

## 8. Relevansi per Fase Tanam

| Fase | Tenaga kerja utama | Opsi tambahan |
|---|---|---|
| Pra-tanam | Olah tanah manual | Persemaian, pembersihan lahan, perbaikan pematang, drainase |
| Tanam | Tanam padi, tanam jagung, tanam kedelai | Cabut bibit padi, pindah tanam, penanda baris |
| Awal pertumbuhan | Penyiangan awal, penyulaman | Penjarangan jagung/kedelai, cek tumbuh |
| Vegetatif | Pemupukan, penyemprotan, pengairan, penyiangan | Monitoring OPT, pemasangan perangkap |
| Generatif | Pengairan, penyemprotan jika perlu | Pengamatan bunga/tongkol/polong, pencegahan serangan |
| Menjelang panen | Pengairan terbatas, persiapan panen | Tenaga persiapan karung/alat panen |
| Panen | Panen padi, jagung, kedelai, angkut hasil | Operator mesin panen, bongkar muat |
| Pascapanen | Jemur/pengeringan, angkut hasil | Sortasi, grading, pemipilan, perontokan, penyimpanan |

---

## 9. Relevansi per Komoditas

| Item | Padi | Jagung | Kedelai | Catatan |
|---|---|---|---|---|
| Olah tanah manual | Relevan | Relevan | Relevan | Biasanya tambahan dari jasa traktor |
| Tanam padi | Sangat relevan | Tidak relevan | Tidak relevan | Khusus padi |
| Tanam jagung | Tidak relevan | Sangat relevan | Tidak relevan | Khusus jagung |
| Tanam kedelai | Tidak relevan | Tidak relevan | Sangat relevan | Khusus kedelai |
| Pemupukan | Relevan | Relevan | Relevan | Pisahkan dari biaya pupuk |
| Penyemprotan | Relevan | Relevan | Relevan | Wajib catatan K3 |
| Penyiangan | Relevan | Relevan | Relevan | Alternatif/pendamping herbisida |
| Pengairan | Sangat relevan | Relevan | Relevan | Padi paling kuat |
| Panen padi | Sangat relevan | Tidak relevan | Tidak relevan | Bisa manual atau combine |
| Panen jagung | Tidak relevan | Sangat relevan | Tidak relevan | Tambahkan pemipilan |
| Panen kedelai | Tidak relevan | Tidak relevan | Sangat relevan | Tambahkan perontokan/sortasi |
| Angkut hasil | Relevan | Relevan | Relevan | Bisa per karung/trip |
| Jemur/pengeringan | Relevan | Relevan | Relevan | Penting untuk kualitas jual |

---

## 10. Rekomendasi UI AgroTrack

### 10.1 Kelompok UI

Jangan tampilkan semua tenaga kerja sebagai satu grid datar. Pecah menjadi:

1. **Pra-tanam & Tanam**
   - Olah tanah manual
   - Tanam padi
   - Tanam jagung
   - Tanam kedelai
   - Opsi tambahan: persemaian, cabut bibit, penyulaman

2. **Perawatan**
   - Pemupukan
   - Penyemprotan
   - Penyiangan
   - Pengairan
   - Opsi tambahan: monitoring OPT, pemasangan perangkap

3. **Panen**
   - Panen padi
   - Panen jagung
   - Panen kedelai
   - Angkut hasil
   - Opsi tambahan: operator mesin, bongkar muat

4. **Pascapanen**
   - Jemur/pengeringan
   - Opsi tambahan: pemipilan, perontokan, sortasi, grading, penyimpanan

### 10.2 Card UI

Contoh card:

```text
[Foto Tenaga Kerja]
Tenaga Pemupukan
Kategori: Tenaga Kerja
Fase: Vegetatif / Generatif
Cocok untuk: Padi, Jagung, Kedelai
Mode biaya:
- Upah harian
- HOK
- Borongan
- Tenaga keluarga
Tombol: Tambahkan ke Biaya Musim Ini
```

### 10.3 Form Input

Field yang disarankan:

```text
nama_pekerjaan
fase_penggunaan
komoditas
mode_biaya
jumlah_orang
jumlah_hari
jam_per_hari
jumlah_HOK
upah_per_HOK
tarif_borongan
tarif_per_satuan
jumlah_satuan
biaya_konsumsi
biaya_transport_pekerja
biaya_total
tenaga_keluarga_ya_tidak
nilai_ekonomi_opsional
catatan
```

### 10.4 Badge UI

| Badge | Makna |
|---|---|
| `HOK` | Dapat dihitung sebagai hari orang kerja |
| `Borongan` | Bisa dibayar paket |
| `Keluarga` | Bisa dikerjakan keluarga tanpa biaya tunai |
| `Gotong Royong` | Biaya bisa berupa konsumsi/iuran |
| `K3` | Perlu keselamatan kerja |
| `Tambahan Manual` | Bisa ditambah user di luar katalog |
| `Jasa Mesin` | Gabungan tenaga operator dan alat |

---

## 11. Database yang Disarankan

### 11.1 Master Item Tenaga Kerja

```sql
CREATE TABLE IF NOT EXISTS tenaga_kerja_items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nama_item VARCHAR(150) NOT NULL,
  nama_file_asset VARCHAR(255) NULL,
  kategori VARCHAR(100) NOT NULL DEFAULT 'Tenaga Kerja',
  subkategori VARCHAR(100) NULL,
  fase_penggunaan VARCHAR(100) NULL,
  relevan_padi TINYINT(1) DEFAULT 0,
  relevan_jagung TINYINT(1) DEFAULT 0,
  relevan_kedelai TINYINT(1) DEFAULT 0,
  mode_biaya_default VARCHAR(100) NULL,
  satuan_default VARCHAR(50) NULL,
  fungsi TEXT NULL,
  catatan_penggunaan TEXT NULL,
  perlu_k3 TINYINT(1) DEFAULT 0,
  bisa_tenaga_keluarga TINYINT(1) DEFAULT 1,
  bisa_tambah_manual TINYINT(1) DEFAULT 1,
  status ENUM('aktif','nonaktif') DEFAULT 'aktif',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

### 11.2 Transaksi Biaya Tenaga Kerja

```sql
CREATE TABLE IF NOT EXISTS biaya_tenaga_kerja (
  id INT AUTO_INCREMENT PRIMARY KEY,
  musim_tanam_id INT NOT NULL,
  tenaga_kerja_item_id INT NULL,
  nama_pekerjaan VARCHAR(150) NOT NULL,
  fase_penggunaan VARCHAR(100) NULL,
  mode_biaya ENUM(
    'upah_harian',
    'hok',
    'borongan',
    'per_luas',
    'per_hasil',
    'tenaga_keluarga',
    'gotong_royong',
    'jasa_mesin_operator',
    'input_manual'
  ) NOT NULL,
  jumlah_orang DECIMAL(10,2) NULL,
  jumlah_hari DECIMAL(10,2) NULL,
  jam_per_hari DECIMAL(10,2) NULL,
  jumlah_hok DECIMAL(10,2) NULL,
  upah_per_hok DECIMAL(14,2) NULL,
  upah_per_orang_per_hari DECIMAL(14,2) NULL,
  luas_ha DECIMAL(10,4) NULL,
  tarif_per_ha DECIMAL(14,2) NULL,
  jumlah_satuan DECIMAL(14,2) NULL,
  satuan_hasil VARCHAR(50) NULL,
  tarif_per_satuan DECIMAL(14,2) NULL,
  tarif_borongan DECIMAL(14,2) NULL,
  biaya_konsumsi DECIMAL(14,2) NULL,
  biaya_transport_pekerja DECIMAL(14,2) NULL,
  biaya_total DECIMAL(14,2) NOT NULL DEFAULT 0,
  tenaga_keluarga TINYINT(1) DEFAULT 0,
  nilai_ekonomi_tenaga_keluarga DECIMAL(14,2) NULL,
  tanggal_biaya DATE NULL,
  catatan TEXT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

### 11.3 Logika Hitung Biaya

```text
upah_harian:
biaya_total = jumlah_orang × jumlah_hari × upah_per_orang_per_hari

hok:
biaya_total = jumlah_hok × upah_per_hok

borongan:
biaya_total = tarif_borongan

per_luas:
biaya_total = luas_ha × tarif_per_ha

per_hasil:
biaya_total = jumlah_satuan × tarif_per_satuan

tenaga_keluarga:
biaya_total = 0
nilai_ekonomi_tenaga_keluarga = jumlah_hok × upah_acuan_lokal

gotong_royong:
biaya_total = biaya_konsumsi + biaya_transport_pekerja

jasa_mesin_operator:
biaya_total = tarif_borongan + biaya_operator + biaya_konsumsi jika ada

input_manual:
biaya_total = input user
```

---

## 12. Contoh SQL Seed

```sql
INSERT INTO tenaga_kerja_items
(nama_item, nama_file_asset, subkategori, fase_penggunaan, relevan_padi, relevan_jagung, relevan_kedelai, mode_biaya_default, satuan_default, fungsi, catatan_penggunaan, perlu_k3, bisa_tenaga_keluarga, bisa_tambah_manual)
VALUES
('Tenaga Olah Tanah Manual','tenaga-olah-tanah-manual.jpg','Pra-tanam','Pra-tanam',1,1,1,'hok','HOK','Mengerjakan olah tanah manual, merapikan lahan, dan pekerjaan detail pra-tanam.','Bisa dikerjakan sendiri, keluarga, buruh harian, atau borongan.',0,1,1),

('Tenaga Tanam Padi','tenaga-tanam-padi.jpg','Tanam','Tanam',1,0,0,'borongan','petak/ha/HOK','Menanam atau pindah tanam bibit padi di sawah.','Tambahkan opsi cabut bibit/persemaian jika diperlukan.',0,1,1),

('Tenaga Tanam Jagung','tenaga-tanam-jagung.jpg','Tanam','Tanam',0,1,0,'hok','HOK/ha','Menanam benih jagung sesuai baris dan jarak tanam.','Tambahkan opsi penjarangan pada fase awal pertumbuhan.',0,1,1),

('Tenaga Tanam Kedelai','tenaga-tanam-kedelai.jpg','Tanam','Tanam',0,0,1,'hok','HOK/ha','Menanam benih kedelai pada lahan kering atau bekas padi.','Tambahkan opsi penyulaman jika benih tidak tumbuh.',0,1,1),

('Tenaga Pemupukan','tenaga-pemupukan.jpg','Perawatan','Pra-tanam / Vegetatif / Generatif',1,1,1,'hok','HOK/aplikasi','Mengaplikasikan pupuk dasar atau pupuk susulan.','Pisahkan dari biaya pupuk agar analisis lebih jelas.',0,1,1),

('Tenaga Penyemprotan','tenaga-penyemprotan.jpg','Perawatan','Vegetatif / Generatif',1,1,1,'hok','HOK/aplikasi','Mengaplikasikan pestisida, pupuk daun, POC, atau agens hayati.','Wajib memakai APD dan mengikuti label produk.',1,1,1),

('Tenaga Penyiangan','tenaga-penyiangan.jpg','Perawatan','Awal Pertumbuhan / Vegetatif',1,1,1,'hok','HOK/ha','Membersihkan gulma secara manual.','Bisa dibandingkan dengan biaya herbisida.',0,1,1),

('Tenaga Pengairan','tenaga-pengairan.jpg','Perawatan Air','Sepanjang Musim',1,1,1,'upah_harian','hari/jam','Mengatur air, saluran, pompa, atau drainase.','Hubungkan dengan kategori Air & Irigasi.',0,1,1),

('Tenaga Panen Padi','tenaga-panen-padi.jpg','Panen','Panen',1,0,0,'borongan','ha/petak/karung','Memanen padi secara manual atau membantu proses panen.','Jika memakai combine, catat sebagai jasa mesin/operator.',0,1,1),

('Tenaga Panen Jagung','tenaga-panen-jagung.jpg','Panen','Panen',0,1,0,'borongan','ha/karung/kg','Memetik dan mengumpulkan jagung.','Tambahkan opsi pemipilan jagung di pascapanen.',0,1,1),

('Tenaga Panen Kedelai','tenaga-panen-kedelai.jpg','Panen','Panen',0,0,1,'borongan','ha/karung/kg','Memanen atau mencabut/memotong tanaman kedelai.','Tambahkan opsi perontokan dan sortasi biji.',0,1,1),

('Tenaga Angkut Hasil','tenaga-angkut-hasil.jpg','Panen/Pascapanen','Panen / Pascapanen',1,1,1,'per_hasil','karung/trip/kg','Mengangkut hasil dari lahan ke rumah, gudang, jemuran, atau pembeli.','Bedakan biaya tenaga angkut dari biaya kendaraan jika memungkinkan.',0,1,1),

('Tenaga Jemur / Pengeringan','tenaga-jemur-pengeringan.jpg','Pascapanen','Pascapanen',1,1,1,'hok','HOK/hari','Menjemur, membalik, menjaga, dan mengangkat hasil panen.','Hubungkan dengan terpal jemur dan moisture meter jika ada.',0,1,1);
```

---

## 13. Rekomendasi MVP AgroTrack

Prioritas yang wajib masuk UI awal:

1. Tenaga Olah Tanah Manual
2. Tenaga Tanam Padi
3. Tenaga Tanam Jagung
4. Tenaga Tanam Kedelai
5. Tenaga Pemupukan
6. Tenaga Penyemprotan
7. Tenaga Penyiangan
8. Tenaga Panen sesuai tanaman aktif
9. Tenaga Angkut Hasil
10. Tenaga Jemur/Pengeringan
11. Tombol **Tambah Tenaga Kerja Lainnya**

Kenapa `Tambah Tenaga Kerja Lainnya` wajib:
- Karena kegiatan lapangan tidak selalu sama antar daerah.
- Karena tenaga kerja bisa muncul mendadak, seperti penyulaman ulang, perbaikan pematang, panen dipercepat, atau sortasi tambahan.
- Karena sebagian pekerjaan tidak punya asset gambar khusus tetapi tetap menghasilkan biaya.

---

## 14. Copy UI Singkat per Item

| Item | Copy pendek untuk card |
|---|---|
| Olah Tanah Manual | Tenaga kerja untuk mencangkul, merapikan, dan menyiapkan lahan secara manual. |
| Tanam Padi | Tenaga kerja untuk pindah tanam/tandur padi di sawah. |
| Tanam Jagung | Tenaga kerja untuk menanam benih jagung sesuai baris dan jarak tanam. |
| Tanam Kedelai | Tenaga kerja untuk menanam benih kedelai di lahan kering/bekas padi. |
| Pemupukan | Tenaga kerja untuk aplikasi pupuk dasar atau susulan. |
| Penyemprotan | Tenaga kerja untuk aplikasi pestisida, pupuk daun, POC, atau agens hayati. |
| Penyiangan | Tenaga kerja untuk membersihkan gulma secara manual. |
| Pengairan | Tenaga kerja untuk mengatur air, pompa, saluran, dan drainase. |
| Panen Padi | Tenaga kerja untuk memanen dan mengumpulkan gabah. |
| Panen Jagung | Tenaga kerja untuk memetik dan mengumpulkan jagung. |
| Panen Kedelai | Tenaga kerja untuk memanen kedelai dan menyiapkan perontokan. |
| Angkut Hasil | Tenaga kerja untuk membawa hasil dari lahan ke rumah/gudang/pembeli. |
| Jemur/Pengeringan | Tenaga kerja untuk menjemur, membalik, menjaga, dan mengangkat hasil panen. |

---

## 15. Referensi Utama

1. BPS — Metadata Upah Nominal Buruh Tani.  
   https://sirusa.web.bps.go.id/metadata/indikator/3751

2. BPS — Nilai Produksi dan Biaya Produksi per Musim Tanam per Hektar Budidaya Padi, Jagung, dan Kedelai, 2017.  
   https://www.bps.go.id/id/statistics-table/1/MjA1NSMx/nilai-produksi-dan-biaya-produksi-per-musim-tanam-per-hektar-budidaya-tanaman-padi-sawah--padi-ladang--jagung--dan-kedelai--2017.html

3. SNI IndoGAP 8969:2021.  
   https://icert.id/wp-content/uploads/2022/08/SNI-INDOGAP.pdf

4. Kementerian Pertanian / Petunjuk teknis padi — kegiatan intensifikasi mencakup pengelolaan tanah, benih bermutu, penanaman, pemupukan, pengendalian hama/penyakit, panen, dan pascapanen.  
   https://ppid.kemendagri.go.id/storage/dokumen/kzGKu3rSf1AZyMoPzbjcUNi0hp4SW6iSS8vaohxC.pdf

5. Studi curahan tenaga kerja usahatani padi sawah — ukuran tenaga kerja dinyatakan dalam HOK/HKO/HKSP.  
   https://ejournal.unsrat.ac.id/v3/index.php/agrirud/article/download/45048/40756/101969

6. Studi tahapan kegiatan usahatani padi sawah — pengolahan lahan, penyiapan bibit, persemaian, penanaman, pemupukan, penyiangan, panen, pascapanen.  
   https://ejurnal.undana.ac.id/index.php/impas/article/download/19633/7593

7. Kajian tenaga kerja luar keluarga pada usahatani padi sawah.  
   https://media.neliti.com/media/publications/15085-ID-faktor-faktor-yang-berpengaruh-terhadap-penggunaan-tenaga-kerja-luar-keluarga-pa.pdf

8. Studi biaya tenaga kerja padi sawah — tenaga kerja luar keluarga dapat menjadi komponen biaya besar.  
   https://ejurnal.ung.ac.id/index.php/AGR/article/download/17964/7391

9. Studi perbedaan pendapatan petani padi sawah — contoh curahan tenaga kerja kegiatan pengangkutan dan pengeringan/penjemuran.  
   https://j-innovative.org/index.php/Innovative/article/download/15811/10747/27102

10. Petunjuk teknis kegiatan jagung — kegiatan budidaya jagung mencakup pengolahan lahan, pengairan, saprodi, dan alat pascapanen.  
    https://ppid.kemendagri.go.id/storage/dokumen/tlmrDwg25mA2i9LYmP1jnBlfkV1fXhzKrUmjV2K1.pdf

11. Teknologi Budidaya Jagung — pascapanen jagung sering masih sederhana dan kualitas dapat rendah bila panen/pengeringan/pemipilan tidak dikelola baik.  
    https://repository.pertanian.go.id/items/c7f02e9d-7835-40a7-955f-42e17e0732e5

12. Buku Pengendalian Hama dan Penyakit Tanaman Pangan dan Hortikultura — perlindungan tanaman perlu pendekatan PHT.  
    https://eprints.unm.ac.id/21977/1/Buku%20Pengendalian%20Hama%20dan%20Penyakit%20Tanaman%20Pangan%20dan%20Hortikultura.pdf
