# AgroTrack — Katalog Modal & Administrasi untuk Padi, Jagung, dan Kedelai

**Versi:** 1.0  
**Tanggal penyusunan:** 16 Juni 2026  
**Kategori:** Modal & Administrasi  
**Target komoditas:** Padi, Jagung, Kedelai  
**Fungsi dokumen:** Referensi seed database, UI biaya non-operasional langsung, input modal kerja, pembiayaan, administrasi, dan arus kas AgroTrack.

---

## 1. Catatan Utama

Kategori **Modal & Administrasi** berbeda dari benih, pupuk, tenaga kerja, atau alat. Kategori ini tidak selalu punya gambar produk, karena isinya lebih banyak berupa **sumber dana, biaya transaksi, biaya legal/administratif, iuran, dan pengelolaan kas**.

Di AgroTrack, kategori ini penting karena banyak petani tidak hanya menghitung biaya fisik seperti benih dan pupuk. Petani juga bisa menghadapi:
- biaya pinjaman,
- bunga/margin,
- biaya transfer,
- iuran kelompok tani,
- biaya administrasi pembelian,
- sewa lahan,
- pajak/iuran lahan,
- cicilan alat,
- kas cadangan,
- biaya komunikasi,
- biaya pencatatan,
- biaya perizinan atau dokumen,
- biaya risiko telat bayar.

Kategori ini sebaiknya tidak dipaksakan memakai gambar detail. UI cukup memakai ikon/kartu generik seperti `modal`, `pinjaman`, `iuran`, `dokumen`, `kas`, dan `administrasi`.

---

## 2. Prinsip Desain Data

### 2.1 Jangan Samakan Modal dengan Biaya Produksi

Modal adalah **sumber dana**. Biaya produksi adalah **penggunaan dana**.

Contoh:
- Pinjam KUR Rp10.000.000 bukan langsung biaya produksi.
- Yang menjadi biaya adalah bunga/margin, biaya admin, denda jika ada, atau cicilan yang perlu dibayar dari arus kas.
- Pokok pinjaman adalah kewajiban, bukan biaya operasional murni.

### 2.2 Pisahkan Arus Kas dan Profit

AgroTrack sebaiknya membedakan:

| Jenis | Arti |
|---|---|
| Cash-in | Uang masuk, misalnya pinjaman, modal sendiri, penjualan hasil |
| Cash-out | Uang keluar, misalnya beli pupuk, bayar tenaga, bayar cicilan |
| Biaya produksi | Pengeluaran untuk menghasilkan tanaman |
| Biaya pembiayaan | Bunga/margin, admin, denda, provisi |
| Kewajiban | Pokok pinjaman/cicilan yang belum lunas |
| Profit kas | Uang penjualan dikurangi cash-out nyata |
| Profit ekonomi | Profit yang juga memperhitungkan tenaga keluarga, penyusutan alat, dan biaya peluang |

### 2.3 Jangan Hardcode Bunga dan Biaya Admin

Suku bunga, margin, biaya admin, dan ketentuan pinjaman berubah menurut:
- bank/lembaga,
- jenis produk,
- tahun,
- subsidi,
- plafon,
- tenor,
- jaminan,
- status debitur,
- kelompok tani,
- koperasi,
- BUMDes,
- pinjaman keluarga.

Karena itu, nilai harus **editable**.

---

## 3. Sumber Konsep dan Data

BPS menyediakan tabel nilai produksi dan biaya produksi per musim tanam per hektar untuk padi sawah, padi ladang, jagung, dan kedelai. Ini mendukung pencatatan biaya per musim dan per hektar.  
Sumber: https://www.bps.go.id/statictable/2019/04/10/2055/nilai-produksi-dan-biaya-produksi-per-musim-tanam-per-hektar-budidaya-tanaman-padi-sawah-padi-ladang-jagung-dan-kedelai-2017.html

Kementerian Koordinator Bidang Perekonomian menyebut pada November 2025 bahwa akses KUR dibuka dengan suku bunga flat 6% untuk semua pelaku usaha sektor produktif tanpa batasan frekuensi akses. Untuk AgroTrack, angka ini boleh dijadikan referensi awal tetapi tetap harus bisa diedit karena kebijakan dan produk pembiayaan dapat berubah.  
Sumber: https://www.ekon.go.id/publikasi/detail/6678/kredit-usaha-rakyat-2025-cetak-kinerja-solid-seluruh-kredit-program-pemerintah-siap-take-off-di-tahun-2026

OJK mendukung perluasan akses keuangan bagi petani melalui ekosistem pembiayaan KUR klaster. Ini relevan untuk fitur sumber modal berbasis kelompok tani/klaster.  
Sumber: https://ojk.go.id/id/media/ojk-tv/detail-video.aspx?id=962

BRI KUR menyebut KUR Mikro sektor produksi 4P mencakup Pertanian, Perikanan, Peternakan, Perkebunan. Ini relevan sebagai contoh sumber modal formal untuk petani.  
Sumber: https://kur.bri.co.id/

---

## 4. Asset UI

Untuk kategori ini **tidak wajib cari gambar foto**. Lebih baik pakai icon atau ilustrasi sederhana.

Rekomendasi asset opsional:

| No | Nama Asset Opsional | Fungsi UI |
|---:|---|---|
| 1 | `modal-kas-usahatani.svg` | Modal sendiri/kas awal |
| 2 | `modal-pinjaman-bank.svg` | Pinjaman bank/KUR |
| 3 | `modal-koperasi.svg` | Pinjaman koperasi/kelompok tani |
| 4 | `modal-iuran-kelompok.svg` | Iuran kelompok tani |
| 5 | `modal-sewa-lahan.svg` | Sewa/bagi hasil lahan |
| 6 | `modal-pajak-lahan.svg` | PBB/iuran lahan |
| 7 | `modal-cicilan-alat.svg` | Cicilan alat/mesin |
| 8 | `modal-biaya-admin.svg` | Biaya admin/transfer |
| 9 | `modal-cadangan-kas.svg` | Dana cadangan |
| 10 | `modal-dokumen.svg` | Dokumen dan pencatatan |

Jika tidak ada asset, gunakan icon dari UI library atau default:

```text
assets/img/saprodi/default/modal-administrasi.svg
```

---

## 5. Ringkasan Item Modal & Administrasi

| No | Item | Tipe | Fase | Relevan Untuk | Mode Biaya | Status Nilai |
|---:|---|---|---|---|---|---|
| 1 | Modal Sendiri / Kas Awal | Cash-in | Pra-tanam | Padi, Jagung, Kedelai | input modal | INPUT_MANUAL |
| 2 | Pinjaman KUR / Bank | Cash-in + kewajiban | Pra-tanam | Padi, Jagung, Kedelai | pokok, bunga, tenor | INPUT_MANUAL + REFERENSI_KUR |
| 3 | Pinjaman Koperasi / Kelompok Tani | Cash-in + kewajiban | Pra-tanam | Padi, Jagung, Kedelai | pokok, jasa/margin | INPUT_MANUAL |
| 4 | Pinjaman Keluarga / Tetangga | Cash-in + kewajiban | Pra-tanam/Selama musim | Padi, Jagung, Kedelai | pokok, tanpa bunga/ada jasa | INPUT_MANUAL |
| 5 | Dana Talangan Input | Cash-in + kewajiban | Pra-tanam/Tanam | Padi, Jagung, Kedelai | bayar setelah panen | INPUT_MANUAL |
| 6 | Cicilan Alat/Mesin | Pembiayaan aset | Semua fase | Padi, Jagung, Kedelai | cicilan bulanan/musiman | INPUT_MANUAL |
| 7 | Sewa Lahan | Biaya tetap | Pra-tanam/per musim | Padi, Jagung, Kedelai | per musim/per tahun/per ha | INPUT_MANUAL |
| 8 | Bagi Hasil Lahan | Kewajiban hasil | Panen | Padi, Jagung, Kedelai | persen hasil/persen pendapatan | INPUT_MANUAL |
| 9 | Pajak/Iuran Lahan/PBB | Administrasi lahan | Tahunan/musim | Padi, Jagung, Kedelai | nominal periodik | INPUT_MANUAL |
| 10 | Iuran Kelompok Tani | Administrasi sosial | Pra-tanam/Selama musim | Padi, Jagung, Kedelai | per musim/bulan/kegiatan | INPUT_MANUAL |
| 11 | Iuran Irigasi/Desa | Administrasi operasional | Selama musim | Padi, Jagung, Kedelai | per musim/bulan | INPUT_MANUAL |
| 12 | Biaya Administrasi Bank | Biaya transaksi | Saat pinjaman/transaksi | Padi, Jagung, Kedelai | nominal/persen | INPUT_MANUAL |
| 13 | Biaya Transfer/QRIS/E-wallet | Biaya transaksi | Semua fase | Padi, Jagung, Kedelai | per transaksi | INPUT_MANUAL |
| 14 | Biaya Komunikasi | Administrasi lapang | Semua fase | Padi, Jagung, Kedelai | pulsa/data/telepon | INPUT_MANUAL |
| 15 | Biaya Dokumentasi & Pencatatan | Administrasi | Semua fase | Padi, Jagung, Kedelai | alat tulis/cetak/foto | INPUT_MANUAL |
| 16 | Biaya Penyuluhan/Pelatihan | Pengembangan | Pra-tanam/Selama musim | Padi, Jagung, Kedelai | tiket/iuran/transport | INPUT_MANUAL |
| 17 | Biaya Sertifikasi/Label/Legal | Administrasi lanjutan | Pascapanen/penjualan | Padi, Jagung, Kedelai | dokumen/label | INPUT_MANUAL |
| 18 | Dana Cadangan Operasional | Cadangan kas | Semua fase | Padi, Jagung, Kedelai | persen dari biaya | INPUT_MANUAL |
| 19 | Biaya Denda/Telat Bayar | Risiko pembiayaan | Saat jatuh tempo | Padi, Jagung, Kedelai | nominal/persen | INPUT_MANUAL |
| 20 | Biaya Peluang Modal | Analisis ekonomi | Akhir musim | Padi, Jagung, Kedelai | persen modal sendiri | OPSIONAL_ANALITIK |

---

## 6. Detail Item Katalog

### 6.1 Modal Sendiri / Kas Awal

| Field | Isi |
|---|---|
| Nama UI | Modal Sendiri / Kas Awal |
| Tipe | Cash-in / sumber dana |
| Fase | Pra-tanam |
| Komoditas | Padi, Jagung, Kedelai |
| Mode input | `input_modal_sendiri` |
| Fungsi | Mencatat dana pribadi yang dipakai untuk memulai musim tanam |
| Perlakuan akuntansi | Bukan biaya; masuk sebagai sumber dana |
| Catatan UI | Jangan otomatis mengurangi profit sebagai biaya. Biaya muncul saat uang dipakai membeli input atau membayar jasa |

Deskripsi card:

> Modal sendiri adalah dana pribadi petani untuk membiayai musim tanam. Di AgroTrack, modal sendiri dicatat sebagai sumber dana, bukan biaya produksi langsung.

---

### 6.2 Pinjaman KUR / Bank

| Field | Isi |
|---|---|
| Nama UI | Pinjaman KUR / Bank |
| Tipe | Cash-in + kewajiban |
| Fase | Pra-tanam atau selama musim |
| Komoditas | Padi, Jagung, Kedelai |
| Mode input | `pokok_pinjaman`, `bunga_per_tahun`, `tenor`, `angsuran`, `tanggal_jatuh_tempo` |
| Fungsi | Mencatat sumber modal dari bank/lembaga formal |
| Perlakuan akuntansi | Pokok pinjaman = kewajiban; bunga/margin/admin = biaya pembiayaan |
| Referensi | KUR sektor produktif dapat memakai acuan kebijakan flat 6% sebagai referensi awal, tetapi harus editable |
| Catatan UI | Sertakan simulasi cicilan dan jatuh tempo |

Deskripsi card:

> Pinjaman KUR/bank adalah sumber modal formal. Pokok pinjaman tidak boleh langsung dianggap biaya produksi; yang menjadi biaya adalah bunga, margin, biaya admin, dan denda jika ada.

Rumus sederhana:

```text
bunga_sederhana = pokok_pinjaman × bunga_tahunan × (lama_bulan / 12)

total_bayar = pokok_pinjaman + bunga + biaya_admin + denda

angsuran_per_bulan = total_bayar / tenor_bulan
```

---

### 6.3 Pinjaman Koperasi / Kelompok Tani

| Field | Isi |
|---|---|
| Nama UI | Pinjaman Koperasi / Kelompok Tani |
| Tipe | Cash-in + kewajiban sosial/kelompok |
| Fase | Pra-tanam/Selama musim |
| Komoditas | Padi, Jagung, Kedelai |
| Mode input | `pokok`, `jasa_koperasi`, `tenor`, `angsuran`, `iuran` |
| Fungsi | Mencatat pinjaman dari koperasi, kelompok tani, BUMDes, atau kas kelompok |
| Perlakuan akuntansi | Pokok = kewajiban; jasa/margin/admin = biaya |
| Catatan UI | Sistem harus fleksibel karena aturan tiap kelompok berbeda |

Deskripsi card:

> Pinjaman koperasi atau kelompok tani sering lebih lokal dan fleksibel daripada pinjaman bank. AgroTrack sebaiknya menyediakan input manual untuk jasa, iuran, dan jadwal bayar.

---

### 6.4 Pinjaman Keluarga / Tetangga

| Field | Isi |
|---|---|
| Nama UI | Pinjaman Keluarga / Tetangga |
| Tipe | Cash-in informal |
| Fase | Pra-tanam/Selama musim |
| Komoditas | Padi, Jagung, Kedelai |
| Mode input | `pokok`, `tanpa_bunga`, `jasa_sukarela`, `tanggal_bayar` |
| Fungsi | Mencatat sumber dana informal |
| Perlakuan akuntansi | Pokok = kewajiban; tambahan/jasa = biaya jika ada |
| Catatan UI | Tambahkan field catatan agar petani bisa menulis kesepakatan |

Deskripsi card:

> Pinjaman keluarga/tetangga adalah modal informal. Walaupun kadang tanpa bunga, tetap perlu dicatat agar arus kas dan kewajiban tidak terlupakan.

---

### 6.5 Dana Talangan Input

| Field | Isi |
|---|---|
| Nama UI | Dana Talangan Input |
| Tipe | Kewajiban input |
| Fase | Pra-tanam/Tanam/Pemupukan |
| Komoditas | Padi, Jagung, Kedelai |
| Mode input | `nilai_barang`, `tanggal_ambil`, `tanggal_bayar`, `harga_cash`, `harga_tempo` |
| Fungsi | Mencatat benih, pupuk, pestisida, atau alat yang diambil dulu dan dibayar setelah panen |
| Perlakuan akuntansi | Nilai input = biaya produksi; selisih harga tempo = biaya pembiayaan |
| Catatan UI | Harus bisa membedakan harga tunai dan harga tempo |

Deskripsi card:

> Dana talangan input terjadi ketika petani mengambil barang dulu dan membayar kemudian. Jika harga tempo lebih mahal daripada harga tunai, selisihnya perlu dicatat sebagai biaya pembiayaan.

---

### 6.6 Cicilan Alat/Mesin

| Field | Isi |
|---|---|
| Nama UI | Cicilan Alat/Mesin |
| Tipe | Pembiayaan aset |
| Fase | Semua fase |
| Komoditas | Padi, Jagung, Kedelai |
| Mode input | `harga_alat`, `uang_muka`, `cicilan`, `tenor`, `bunga`, `alat_terkait` |
| Fungsi | Mencatat cicilan sprayer, pompa, traktor, combine, thresher, atau mesin lain |
| Perlakuan akuntansi | Aset disusutkan; bunga/admin cicilan menjadi biaya pembiayaan |
| Catatan UI | Jangan seluruh harga alat dibebankan ke satu musim jika alat dipakai beberapa musim, kecuali user memilih cash-out penuh |

Deskripsi card:

> Cicilan alat/mesin membantu mencatat pembelian alat secara bertahap. Untuk analisis profit ekonomi, alat sebaiknya disusutkan per musim.

---

### 6.7 Sewa Lahan

| Field | Isi |
|---|---|
| Nama UI | Sewa Lahan |
| Tipe | Biaya tetap |
| Fase | Pra-tanam/per musim/per tahun |
| Komoditas | Padi, Jagung, Kedelai |
| Mode input | `per_musim`, `per_tahun`, `per_ha`, `per_petak`, `input_manual` |
| Fungsi | Mencatat biaya memakai lahan yang bukan milik sendiri |
| Perlakuan akuntansi | Biaya tetap musim tanam |
| Catatan UI | Jika sewa tahunan dipakai beberapa musim, bagi biaya sesuai jumlah musim |

Deskripsi card:

> Sewa lahan adalah biaya tetap untuk menggunakan lahan. Jika sewa dibayar tahunan, AgroTrack perlu membagi biaya ke musim tanam yang relevan.

Rumus:

```text
biaya_sewa_per_musim = sewa_tahunan / jumlah_musim_dalam_tahun
```

---

### 6.8 Bagi Hasil Lahan

| Field | Isi |
|---|---|
| Nama UI | Bagi Hasil Lahan |
| Tipe | Kewajiban hasil |
| Fase | Panen/Akhir musim |
| Komoditas | Padi, Jagung, Kedelai |
| Mode input | `persen_hasil`, `persen_pendapatan`, `kg_hasil`, `nominal` |
| Fungsi | Mencatat pembagian hasil kepada pemilik lahan/pemodal |
| Perlakuan akuntansi | Pengurang pendapatan atau biaya lahan, tergantung model laporan |
| Catatan UI | Jangan dicatat dua kali dengan sewa lahan jika skemanya bagi hasil, bukan sewa tunai |

Deskripsi card:

> Bagi hasil lahan mencatat kewajiban pembagian hasil kepada pemilik lahan atau pemodal. Sistem harus mendukung persen hasil, persen pendapatan, atau nominal manual.

---

### 6.9 Pajak / Iuran Lahan / PBB

| Field | Isi |
|---|---|
| Nama UI | Pajak / Iuran Lahan / PBB |
| Tipe | Administrasi lahan |
| Fase | Tahunan/per musim |
| Komoditas | Padi, Jagung, Kedelai |
| Mode input | `nominal_tahunan`, `nominal_musim`, `input_manual` |
| Fungsi | Mencatat kewajiban administratif terkait lahan |
| Perlakuan akuntansi | Biaya tetap/admin |
| Catatan UI | Jika bukan pemilik lahan, bisa tidak relevan |

Deskripsi card:

> Pajak atau iuran lahan adalah biaya administratif yang dapat muncul pada lahan milik sendiri atau lahan yang dikelola dengan perjanjian tertentu.

---

### 6.10 Iuran Kelompok Tani

| Field | Isi |
|---|---|
| Nama UI | Iuran Kelompok Tani |
| Tipe | Administrasi sosial/kelompok |
| Fase | Pra-tanam/Selama musim |
| Komoditas | Padi, Jagung, Kedelai |
| Mode input | `per_bulan`, `per_musim`, `per_kegiatan`, `input_manual` |
| Fungsi | Mencatat iuran ke kelompok tani, koperasi, kas kelompok, atau kegiatan kolektif |
| Perlakuan akuntansi | Biaya administrasi/kelompok |
| Catatan UI | Bisa dikaitkan dengan akses alat, benih, pupuk, irigasi, pelatihan, atau pinjaman |

Deskripsi card:

> Iuran kelompok tani adalah biaya kolektif yang dapat berhubungan dengan kas kelompok, alat bersama, kegiatan tanam, pelatihan, atau distribusi input.

---

### 6.11 Iuran Irigasi / Desa

| Field | Isi |
|---|---|
| Nama UI | Iuran Irigasi / Desa |
| Tipe | Administrasi operasional |
| Fase | Pra-tanam/Selama musim |
| Komoditas | Padi paling kuat; jagung/kedelai jika lahan irigasi |
| Mode input | `per_musim`, `per_bulan`, `per_luas`, `input_manual` |
| Fungsi | Mencatat biaya kolektif terkait air, saluran, desa, atau perawatan infrastruktur |
| Perlakuan akuntansi | Biaya operasional/admin |
| Catatan UI | Overlap dengan Air & Irigasi; transaksi harus satu kali |

Deskripsi card:

> Iuran irigasi/desa mencatat biaya kolektif untuk akses air atau perawatan fasilitas desa/saluran. Hindari pencatatan ganda dengan kategori Air & Irigasi.

---

### 6.12 Biaya Administrasi Bank

| Field | Isi |
|---|---|
| Nama UI | Biaya Administrasi Bank |
| Tipe | Biaya transaksi/pembiayaan |
| Fase | Saat pinjaman/transaksi |
| Komoditas | Padi, Jagung, Kedelai |
| Mode input | `nominal`, `persen_pinjaman`, `per_transaksi` |
| Fungsi | Mencatat biaya admin pembukaan pinjaman, rekening, transfer, atau pencairan |
| Perlakuan akuntansi | Biaya pembiayaan/administrasi |
| Catatan UI | Jangan digabung ke pokok pinjaman tanpa label |

Deskripsi card:

> Biaya administrasi bank adalah biaya yang muncul saat transaksi, pencairan, atau pengelolaan rekening/pinjaman. Catat terpisah dari pokok pinjaman.

---

### 6.13 Biaya Transfer / QRIS / E-wallet

| Field | Isi |
|---|---|
| Nama UI | Biaya Transfer / QRIS / E-wallet |
| Tipe | Biaya transaksi |
| Fase | Semua fase |
| Komoditas | Padi, Jagung, Kedelai |
| Mode input | `per_transaksi`, `total_musim`, `input_manual` |
| Fungsi | Mencatat biaya kecil untuk pembayaran input, upah, ongkir, atau transaksi digital |
| Perlakuan akuntansi | Biaya administrasi |
| Catatan UI | Kecil, tetapi bisa banyak jika sering transaksi |

Deskripsi card:

> Biaya transfer atau pembayaran digital sering kecil per transaksi, tetapi dapat terkumpul sepanjang musim. Cocok dicatat sebagai biaya administrasi.

---

### 6.14 Biaya Komunikasi

| Field | Isi |
|---|---|
| Nama UI | Biaya Komunikasi |
| Tipe | Administrasi lapang |
| Fase | Semua fase |
| Komoditas | Padi, Jagung, Kedelai |
| Mode input | `pulsa`, `paket_data`, `telepon`, `input_manual` |
| Fungsi | Mencatat komunikasi dengan pekerja, pengepul, toko saprodi, penyuluh, jasa alat, atau transport |
| Perlakuan akuntansi | Biaya administrasi/operasional kecil |
| Catatan UI | Opsional, jangan wajib untuk semua user |

Deskripsi card:

> Biaya komunikasi mencakup pulsa, paket data, atau telepon untuk koordinasi operasional musim tanam.

---

### 6.15 Biaya Dokumentasi & Pencatatan

| Field | Isi |
|---|---|
| Nama UI | Biaya Dokumentasi & Pencatatan |
| Tipe | Administrasi |
| Fase | Semua fase |
| Komoditas | Padi, Jagung, Kedelai |
| Mode input | `alat_tulis`, `fotokopi`, `cetak`, `foto`, `input_manual` |
| Fungsi | Mencatat biaya dokumen, nota, form kelompok, print, materai, atau pencatatan manual |
| Perlakuan akuntansi | Biaya administrasi |
| Catatan UI | Relevan untuk kelompok tani, sertifikasi, bantuan, atau arsip usaha |

Deskripsi card:

> Dokumentasi dan pencatatan membantu menjaga bukti transaksi dan riwayat musim tanam. Biaya dapat berupa fotokopi, cetak, nota, alat tulis, atau dokumen kelompok.

---

### 6.16 Biaya Penyuluhan / Pelatihan

| Field | Isi |
|---|---|
| Nama UI | Biaya Penyuluhan / Pelatihan |
| Tipe | Pengembangan kapasitas |
| Fase | Pra-tanam/Selama musim |
| Komoditas | Padi, Jagung, Kedelai |
| Mode input | `transport`, `iuran`, `konsumsi`, `tiket`, `input_manual` |
| Fungsi | Mencatat biaya mengikuti pelatihan, demplot, penyuluhan, atau pertemuan teknis |
| Perlakuan akuntansi | Biaya pengembangan/administrasi |
| Catatan UI | Tidak selalu ada, tetapi bagus untuk petani yang ikut program kelompok |

Deskripsi card:

> Biaya penyuluhan/pelatihan mencatat pengeluaran untuk meningkatkan pengetahuan teknis atau mengikuti program kelompok tani.

---

### 6.17 Biaya Sertifikasi / Label / Legal

| Field | Isi |
|---|---|
| Nama UI | Biaya Sertifikasi / Label / Legal |
| Tipe | Administrasi lanjutan |
| Fase | Pascapanen/Penjualan |
| Komoditas | Padi, Jagung, Kedelai |
| Mode input | `dokumen`, `label`, `uji_mutu`, `input_manual` |
| Fungsi | Mencatat biaya legal/label/mutu jika hasil dijual dengan standar tertentu |
| Perlakuan akuntansi | Biaya administrasi/penjualan |
| Catatan UI | Opsional; tidak wajib untuk petani biasa |

Deskripsi card:

> Biaya sertifikasi, label, atau legal relevan jika hasil dijual melalui skema khusus, kelompok, koperasi, atau pasar yang membutuhkan dokumen tambahan.

---

### 6.18 Dana Cadangan Operasional

| Field | Isi |
|---|---|
| Nama UI | Dana Cadangan Operasional |
| Tipe | Cadangan kas |
| Fase | Semua fase |
| Komoditas | Padi, Jagung, Kedelai |
| Mode input | `nominal`, `persen_dari_total_biaya`, `input_manual` |
| Fungsi | Menyiapkan dana untuk biaya tak terduga |
| Perlakuan akuntansi | Bukan biaya aktual sampai dipakai; catat sebagai cadangan |
| Catatan UI | Sangat berguna untuk risiko pupuk naik, hama mendadak, pompa rusak, atau panen tertunda |

Deskripsi card:

> Dana cadangan bukan biaya aktual sampai benar-benar digunakan. Namun, cadangan membantu petani menjaga arus kas saat muncul kebutuhan mendadak.

Rumus:

```text
cadangan = total_estimasi_biaya × persen_cadangan
```

Rekomendasi awal UI:

```text
persen_cadangan = 5% sampai 15% dari total estimasi biaya
```

Angka ini bukan aturan baku; user/admin harus bisa mengubahnya.

---

### 6.19 Biaya Denda / Telat Bayar

| Field | Isi |
|---|---|
| Nama UI | Biaya Denda / Telat Bayar |
| Tipe | Risiko pembiayaan |
| Fase | Saat jatuh tempo |
| Komoditas | Padi, Jagung, Kedelai |
| Mode input | `nominal`, `persen`, `per_hari`, `input_manual` |
| Fungsi | Mencatat biaya akibat keterlambatan pembayaran |
| Perlakuan akuntansi | Biaya pembiayaan/rugi |
| Catatan UI | Jangan disatukan dengan bunga normal |

Deskripsi card:

> Biaya denda/telat bayar perlu dipisahkan dari bunga normal agar petani bisa melihat konsekuensi keterlambatan arus kas.

---

### 6.20 Biaya Peluang Modal

| Field | Isi |
|---|---|
| Nama UI | Biaya Peluang Modal |
| Tipe | Analisis ekonomi |
| Fase | Akhir musim |
| Komoditas | Padi, Jagung, Kedelai |
| Mode input | `persen_modal_sendiri`, `input_manual` |
| Fungsi | Menghitung nilai alternatif dari modal sendiri jika tidak dipakai bertani |
| Perlakuan akuntansi | Tidak wajib untuk laporan kas; berguna untuk analisis ekonomi |
| Catatan UI | Jadikan opsi advanced, bukan field wajib |

Deskripsi card:

> Biaya peluang modal adalah nilai alternatif dari modal sendiri. Ini berguna untuk analisis ekonomi, tetapi sebaiknya tidak diwajibkan pada user umum.

---

## 7. Model Perhitungan

### 7.1 Total Modal Tersedia

```text
total_modal_tersedia =
modal_sendiri
+ pinjaman_bank
+ pinjaman_koperasi
+ pinjaman_keluarga
+ dana_talangan_input
+ sumber_modal_lain
```

### 7.2 Total Biaya Administrasi

```text
total_biaya_administrasi =
biaya_admin_bank
+ biaya_transfer
+ iuran_kelompok
+ iuran_irigasi
+ pajak_lahan
+ dokumentasi
+ komunikasi
+ pelatihan
+ legal_label
+ denda
```

### 7.3 Total Biaya Pembiayaan

```text
total_biaya_pembiayaan =
bunga_pinjaman
+ margin_koperasi
+ biaya_admin_pinjaman
+ denda_telat_bayar
+ selisih_harga_tempo
```

### 7.4 Kebutuhan Modal Kerja

```text
kebutuhan_modal_kerja =
total_estimasi_biaya_operasional
+ total_biaya_administrasi
+ dana_cadangan
- modal_sendiri_yang_tersedia
```

### 7.5 Rasio Beban Pembiayaan

```text
rasio_beban_pembiayaan =
total_biaya_pembiayaan / total_pendapatan_panen
```

Interpretasi sederhana:
- Semakin tinggi rasio, semakin besar tekanan pinjaman terhadap hasil.
- Jika rasio tinggi tetapi hasil panen turun, risiko gagal bayar meningkat.

---

## 8. Anti Double Counting

| Kasus | Aturan |
|---|---|
| Pinjaman dipakai beli pupuk | Catat pinjaman sebagai sumber dana, pupuk sebagai biaya. Jangan catat pokok pinjaman sebagai biaya produksi. |
| Bunga pinjaman | Catat sebagai biaya pembiayaan. |
| Cicilan alat | Pisahkan pokok, bunga, dan penyusutan alat jika ingin analisis detail. |
| Sewa lahan vs bagi hasil | Pilih salah satu jika sistemnya memang hanya satu. Jangan catat sewa dan bagi hasil sekaligus tanpa alasan. |
| Iuran irigasi | Jika sudah dicatat di Air & Irigasi, jangan catat lagi di Modal & Administrasi. |
| Dana cadangan | Jangan dihitung sebagai biaya aktual sampai benar-benar dipakai. |
| Tenaga keluarga | Jika dihitung sebagai nilai ekonomi, jangan campur dengan biaya tunai. |
| Biaya transfer | Jangan digabung ke harga barang jika ingin audit biaya admin. |

Warning UI:

```text
Apakah nominal ini adalah sumber dana, biaya aktual, atau kewajiban? Pilih jenis yang benar agar profit tidak bias.
```

---

## 9. Rekomendasi UI AgroTrack

### 9.1 Kelompok UI

1. **Sumber Modal**
   - Modal sendiri
   - Pinjaman KUR/bank
   - Pinjaman koperasi/kelompok tani
   - Pinjaman keluarga
   - Dana talangan input

2. **Biaya Pembiayaan**
   - Bunga/margin
   - Biaya admin bank
   - Cicilan alat
   - Denda/telat bayar
   - Selisih harga tempo

3. **Administrasi Lahan dan Kelompok**
   - Sewa lahan
   - Bagi hasil
   - Pajak/PBB
   - Iuran kelompok tani
   - Iuran irigasi/desa

4. **Administrasi Operasional**
   - Transfer/QRIS/e-wallet
   - Komunikasi
   - Dokumentasi
   - Pelatihan
   - Sertifikasi/label/legal

5. **Cadangan dan Analitik**
   - Dana cadangan
   - Biaya peluang modal
   - Proyeksi kebutuhan modal kerja

### 9.2 Form Modal

```text
nama_sumber_modal
jenis_sumber_modal
tanggal_masuk
nominal_modal
lembaga_pemberi
bunga_per_tahun
tenor_bulan
tanggal_jatuh_tempo
angsuran
biaya_admin
catatan
```

### 9.3 Form Administrasi

```text
nama_biaya
kategori_administrasi
tanggal_biaya
nominal
periode
terkait_lahan
terkait_kelompok
terkait_pinjaman
catatan
```

### 9.4 Badge UI

| Badge | Makna |
|---|---|
| `Sumber Dana` | Uang masuk, bukan biaya langsung |
| `Biaya Pembiayaan` | Bunga/margin/admin/denda |
| `Biaya Tetap` | Tidak bergantung langsung pada volume hasil |
| `Iuran` | Biaya kolektif/kelompok |
| `Opsional` | Tidak selalu ada |
| `Advanced` | Untuk analisis ekonomi lebih detail |
| `Jangan Dobel` | Rawan tercatat di kategori lain |

---

## 10. Rekomendasi Database

### 10.1 Master Item Modal & Administrasi

```sql
CREATE TABLE IF NOT EXISTS modal_administrasi_items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nama_item VARCHAR(150) NOT NULL,
  kategori VARCHAR(100) NOT NULL DEFAULT 'Modal & Administrasi',
  subkategori VARCHAR(100) NULL,
  tipe_item ENUM(
    'sumber_modal',
    'biaya_pembiayaan',
    'administrasi_lahan',
    'administrasi_kelompok',
    'administrasi_operasional',
    'cadangan',
    'analitik'
  ) NOT NULL,
  fase_penggunaan VARCHAR(100) NULL,
  relevan_padi TINYINT(1) DEFAULT 1,
  relevan_jagung TINYINT(1) DEFAULT 1,
  relevan_kedelai TINYINT(1) DEFAULT 1,
  mode_input_default VARCHAR(100) NULL,
  fungsi TEXT NULL,
  catatan_overlap TEXT NULL,
  status ENUM('aktif','nonaktif') DEFAULT 'aktif',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

### 10.2 Transaksi Modal

```sql
CREATE TABLE IF NOT EXISTS modal_musim_tanam (
  id INT AUTO_INCREMENT PRIMARY KEY,
  musim_tanam_id INT NOT NULL,
  modal_item_id INT NULL,
  nama_modal VARCHAR(150) NOT NULL,
  jenis_modal ENUM(
    'modal_sendiri',
    'pinjaman_bank',
    'pinjaman_koperasi',
    'pinjaman_keluarga',
    'talangan_input',
    'sumber_lain'
  ) NOT NULL,
  tanggal_masuk DATE NULL,
  nominal_modal DECIMAL(14,2) NOT NULL DEFAULT 0,
  lembaga_pemberi VARCHAR(150) NULL,
  bunga_per_tahun DECIMAL(6,3) NULL,
  tenor_bulan INT NULL,
  biaya_admin DECIMAL(14,2) NULL,
  tanggal_jatuh_tempo DATE NULL,
  angsuran_per_bulan DECIMAL(14,2) NULL,
  status_pinjaman ENUM('aktif','lunas','macet','tidak_ada') DEFAULT 'tidak_ada',
  catatan TEXT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

### 10.3 Transaksi Administrasi

```sql
CREATE TABLE IF NOT EXISTS biaya_administrasi_musim (
  id INT AUTO_INCREMENT PRIMARY KEY,
  musim_tanam_id INT NOT NULL,
  modal_item_id INT NULL,
  nama_biaya VARCHAR(150) NOT NULL,
  tipe_biaya ENUM(
    'bunga',
    'margin',
    'admin_bank',
    'transfer',
    'sewa_lahan',
    'bagi_hasil',
    'pajak_lahan',
    'iuran_kelompok',
    'iuran_irigasi',
    'komunikasi',
    'dokumentasi',
    'pelatihan',
    'sertifikasi',
    'cadangan',
    'denda',
    'biaya_peluang',
    'input_manual'
  ) NOT NULL,
  tanggal_biaya DATE NULL,
  nominal DECIMAL(14,2) NOT NULL DEFAULT 0,
  periode VARCHAR(50) NULL,
  terkait_pinjaman_id INT NULL,
  terkait_lahan_id INT NULL,
  catatan TEXT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

---

## 11. Contoh SQL Seed

```sql
INSERT INTO modal_administrasi_items
(nama_item, subkategori, tipe_item, fase_penggunaan, mode_input_default, fungsi, catatan_overlap)
VALUES
('Modal Sendiri / Kas Awal','Sumber Modal','sumber_modal','Pra-tanam','input_modal_sendiri','Mencatat dana pribadi yang dipakai untuk memulai musim tanam.','Bukan biaya produksi langsung.'),
('Pinjaman KUR / Bank','Sumber Modal Formal','sumber_modal','Pra-tanam','pokok_bunga_tenor','Mencatat sumber modal dari bank atau KUR.','Pokok pinjaman adalah kewajiban, bukan biaya produksi.'),
('Pinjaman Koperasi / Kelompok Tani','Sumber Modal Kelompok','sumber_modal','Pra-tanam / Selama musim','input_manual','Mencatat pinjaman dari koperasi, kelompok tani, BUMDes, atau kas kelompok.','Jasa/margin menjadi biaya pembiayaan.'),
('Pinjaman Keluarga / Tetangga','Sumber Modal Informal','sumber_modal','Pra-tanam / Selama musim','input_manual','Mencatat sumber dana informal.','Tetap catat kewajiban walaupun tanpa bunga.'),
('Dana Talangan Input','Sumber Modal Barang','sumber_modal','Pra-tanam / Tanam','harga_cash_vs_tempo','Mencatat input yang diambil dulu dan dibayar setelah panen.','Selisih harga tempo menjadi biaya pembiayaan.'),
('Cicilan Alat/Mesin','Pembiayaan Aset','biaya_pembiayaan','Semua fase','cicilan','Mencatat cicilan alat/mesin pertanian.','Pisahkan pokok, bunga, dan penyusutan alat.'),
('Sewa Lahan','Administrasi Lahan','administrasi_lahan','Pra-tanam','per_musim_per_ha','Mencatat biaya penggunaan lahan.','Jangan dobel dengan bagi hasil jika sistemnya bukan keduanya.'),
('Bagi Hasil Lahan','Administrasi Lahan','administrasi_lahan','Panen','persen_hasil','Mencatat pembagian hasil kepada pemilik lahan atau pemodal.','Jangan dobel dengan sewa tunai.'),
('Pajak / Iuran Lahan / PBB','Administrasi Lahan','administrasi_lahan','Tahunan / Musim','input_manual','Mencatat kewajiban administratif terkait lahan.','Bisa tidak relevan untuk lahan sewa.'),
('Iuran Kelompok Tani','Administrasi Kelompok','administrasi_kelompok','Pra-tanam / Selama musim','input_manual','Mencatat iuran kelompok tani atau kas kolektif.','Bisa terkait alat bersama, benih, pupuk, atau kegiatan kelompok.'),
('Iuran Irigasi / Desa','Administrasi Operasional','administrasi_operasional','Selama musim','input_manual','Mencatat iuran akses air atau desa.','Jangan dobel dengan kategori Air & Irigasi.'),
('Biaya Administrasi Bank','Biaya Pembiayaan','biaya_pembiayaan','Saat pinjaman/transaksi','nominal_persen','Mencatat biaya admin pencairan atau transaksi bank.','Pisahkan dari pokok pinjaman.'),
('Biaya Transfer / QRIS / E-wallet','Administrasi Operasional','administrasi_operasional','Semua fase','per_transaksi','Mencatat biaya transaksi digital.','Kecil tetapi bisa terkumpul.'),
('Biaya Komunikasi','Administrasi Operasional','administrasi_operasional','Semua fase','input_manual','Mencatat pulsa/data/telepon untuk koordinasi.','Opsional.'),
('Biaya Dokumentasi & Pencatatan','Administrasi Operasional','administrasi_operasional','Semua fase','input_manual','Mencatat nota, fotokopi, cetak, alat tulis, atau arsip.','Berguna untuk audit musim tanam.'),
('Biaya Penyuluhan / Pelatihan','Pengembangan','administrasi_operasional','Pra-tanam / Selama musim','input_manual','Mencatat biaya pelatihan, demplot, penyuluhan, atau pertemuan teknis.','Opsional.'),
('Biaya Sertifikasi / Label / Legal','Administrasi Penjualan','administrasi_operasional','Pascapanen / Penjualan','input_manual','Mencatat dokumen, label, uji mutu, atau legalitas penjualan.','Opsional untuk pasar khusus.'),
('Dana Cadangan Operasional','Cadangan','cadangan','Semua fase','persen_biaya','Mencatat dana cadangan untuk kebutuhan tak terduga.','Bukan biaya aktual sampai dipakai.'),
('Biaya Denda / Telat Bayar','Risiko Pembiayaan','biaya_pembiayaan','Jatuh tempo','input_manual','Mencatat denda atau biaya akibat telat bayar.','Pisahkan dari bunga normal.'),
('Biaya Peluang Modal','Analitik Ekonomi','analitik','Akhir musim','persen_modal_sendiri','Menghitung nilai alternatif dari modal sendiri.','Advanced, tidak wajib untuk user umum.');
```

---

## 12. Rekomendasi MVP AgroTrack

Prioritas wajib:

1. Modal Sendiri / Kas Awal
2. Pinjaman KUR / Bank
3. Pinjaman Koperasi / Kelompok Tani
4. Dana Talangan Input
5. Sewa Lahan
6. Bagi Hasil Lahan
7. Iuran Kelompok Tani
8. Iuran Irigasi / Desa
9. Biaya Administrasi Bank / Transfer
10. Dana Cadangan Operasional

Prioritas lanjutan:

11. Cicilan Alat/Mesin
12. Pajak/PBB
13. Biaya Komunikasi
14. Dokumentasi/Pencatatan
15. Pelatihan
16. Sertifikasi/Label
17. Denda/Telat Bayar
18. Biaya Peluang Modal

---

## 13. Copy UI Singkat per Item

| Item | Copy pendek untuk card |
|---|---|
| Modal Sendiri | Dana pribadi untuk membiayai musim tanam. |
| Pinjaman KUR/Bank | Sumber modal formal dengan pokok, bunga, tenor, dan jatuh tempo. |
| Pinjaman Koperasi | Pinjaman dari koperasi, kelompok tani, BUMDes, atau kas kelompok. |
| Pinjaman Keluarga | Modal informal yang tetap perlu dicatat sebagai kewajiban. |
| Dana Talangan Input | Input diambil dulu dan dibayar setelah panen. |
| Cicilan Alat | Cicilan pembelian alat atau mesin pertanian. |
| Sewa Lahan | Biaya menggunakan lahan per musim, tahun, petak, atau hektar. |
| Bagi Hasil | Pembagian hasil atau pendapatan kepada pemilik lahan/pemodal. |
| Pajak/Iuran Lahan | Biaya administratif terkait lahan. |
| Iuran Kelompok Tani | Iuran kolektif untuk kegiatan atau kas kelompok. |
| Iuran Irigasi | Biaya kolektif untuk akses air atau perawatan saluran. |
| Admin Bank | Biaya administrasi pencairan, rekening, atau transaksi bank. |
| Transfer/QRIS | Biaya kecil dari transaksi digital selama musim. |
| Komunikasi | Pulsa, paket data, atau telepon untuk koordinasi lapang. |
| Dokumentasi | Nota, fotokopi, cetak, alat tulis, atau arsip transaksi. |
| Pelatihan | Biaya penyuluhan, demplot, atau pengembangan kapasitas. |
| Sertifikasi/Label | Dokumen atau label untuk pasar khusus. |
| Dana Cadangan | Dana untuk biaya tak terduga yang belum menjadi biaya aktual. |
| Denda | Biaya akibat telat bayar atau kewajiban yang jatuh tempo. |
| Biaya Peluang | Nilai alternatif dari modal sendiri untuk analisis ekonomi. |

---

## 14. Referensi Utama

1. BPS — Nilai Produksi dan Biaya Produksi per Musim Tanam per Hektar Budidaya Padi, Jagung, dan Kedelai.  
   https://www.bps.go.id/statictable/2019/04/10/2055/nilai-produksi-dan-biaya-produksi-per-musim-tanam-per-hektar-budidaya-tanaman-padi-sawah-padi-ladang-jagung-dan-kedelai-2017.html

2. BPS — Hasil Survei Struktur Ongkos Usaha Tanaman Padi 2017.  
   https://www.bps.go.id/id/publication/2017/12/26/07ca064175333cd9f796c183/hasil-survei-struktur-ongkos-usaha-tanaman-padi-2017.html

3. Kemenko Perekonomian — KUR 2025 cetak kinerja solid, kredit program siap take-off 2026.  
   https://www.ekon.go.id/publikasi/detail/6678/kredit-usaha-rakyat-2025-cetak-kinerja-solid-seluruh-kredit-program-pemerintah-siap-take-off-di-tahun-2026

4. OJK — Pembiayaan KUR klaster bagi petani.  
   https://ojk.go.id/id/media/ojk-tv/detail-video.aspx?id=962

5. BRI KUR — Informasi KUR BRI.  
   https://kur.bri.co.id/

6. Kementerian Pertanian — Literasi KUR sektor pertanian.  
   https://pustaka.bppsdmp.pertanian.go.id/info-literasi/info-literasi-kur-sektor-pertanian-solusi-modal-bagi-petani-milenial
