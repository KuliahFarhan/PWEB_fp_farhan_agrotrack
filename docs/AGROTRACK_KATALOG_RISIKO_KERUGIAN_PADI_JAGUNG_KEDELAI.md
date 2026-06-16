# AgroTrack — Katalog Risiko / Kerugian untuk Padi, Jagung, dan Kedelai

**Versi:** 1.0  
**Tanggal penyusunan:** 16 Juni 2026  
**Kategori:** Risiko / Kerugian  
**Target komoditas:** Padi, Jagung, Kedelai  
**Fungsi dokumen:** Referensi seed database, UI pencatatan risiko, kerugian, mitigasi, asuransi, evaluasi musim tanam, dan pengurang profit AgroTrack.

---

## 1. Catatan Utama

Kategori **Risiko / Kerugian** bukan sekadar “biaya tambahan”. Risiko bisa berupa:
- potensi kejadian yang belum terjadi,
- kejadian aktual yang menurunkan hasil,
- kerusakan aset,
- kenaikan biaya,
- penurunan harga jual,
- gagal bayar,
- susut pascapanen,
- kerugian karena hama/penyakit/cuaca,
- kehilangan kualitas,
- biaya pemulihan.

Di AgroTrack, risiko harus bisa dicatat dalam dua bentuk:

1. **Risiko potensial**
   - Belum terjadi, tetapi mungkin terjadi.
   - Contoh: risiko banjir, risiko wereng, risiko harga turun.

2. **Kerugian aktual**
   - Sudah terjadi dan punya dampak.
   - Contoh: 0,2 ha padi puso, 100 kg jagung berjamur, pompa rusak, harga jual turun.

Kategori ini penting untuk membuat profit lebih realistis. Tanpa pencatatan risiko, hasil analisis bisa terlalu optimistis.

---

## 2. Prinsip Desain Data

### 2.1 Pisahkan Risiko, Kerugian, dan Biaya Mitigasi

| Istilah | Arti | Contoh |
|---|---|---|
| Risiko | Potensi kejadian negatif | Risiko kekeringan |
| Kerugian | Dampak aktual yang sudah terjadi | Hasil turun 300 kg |
| Biaya mitigasi | Biaya untuk mengurangi risiko | Beli pompa, pasang perangkap, semprot sesuai PHT |
| Biaya pemulihan | Biaya setelah kejadian | Tanam ulang, perbaiki pematang |
| Klaim/asuransi | Uang pengganti kerugian | Klaim AUTP |
| Kerugian bersih | Kerugian dikurangi kompensasi/klaim | Rugi bersih setelah klaim |

### 2.2 Jangan Semua Risiko Dianggap Biaya

Risiko belum tentu menjadi biaya. Risiko baru masuk perhitungan finansial jika:
- ada biaya pencegahan,
- ada biaya penanganan,
- ada hasil yang hilang,
- ada kualitas turun,
- ada harga jual turun,
- ada aset rusak,
- ada klaim/asuransi.

### 2.3 Gunakan Risk Register

Setiap risiko sebaiknya punya:

```text
kategori_risiko
nama_risiko
komoditas
fase
probabilitas
dampak
level_risiko
mitigasi
status
kerugian_estimasi
kerugian_aktual
kompensasi/klaim
kerugian_bersih
catatan
```

---

## 3. Sumber Konsep dan Data

BPS menyediakan data biaya produksi per musim tanam per hektar untuk padi, jagung, dan kedelai. Ini mendukung evaluasi dampak kerugian terhadap biaya dan profit per musim.  
Sumber: https://www.bps.go.id/statictable/2019/04/10/2055/nilai-produksi-dan-biaya-produksi-per-musim-tanam-per-hektar-budidaya-tanaman-padi-sawah-padi-ladang-jagung-dan-kedelai-2017.html

PP No. 6 Tahun 1995 tentang Perlindungan Tanaman menyatakan perlindungan tanaman dilaksanakan dengan sarana dan cara yang tidak mengganggu kesehatan/keselamatan manusia serta tidak menimbulkan gangguan/kerusakan sumber daya alam atau lingkungan hidup. Ini relevan untuk mitigasi risiko OPT berbasis PHT, bukan semprot berlebihan.  
Sumber: https://www.flevin.com/id/lgso/legislation/Mirror/czoyNjoiZD0xOTAwKzk1JmY9cHA2LTE5OTVidC5odG0iOw%3D%3D.html

Permentan No. 10 Tahun 2023 mengatur Balai Besar Peramalan OPT yang bertugas melaksanakan pengamatan, peramalan, dan pengendalian organisme pengganggu tumbuhan. Ini mendukung fitur monitoring/risiko OPT.  
Sumber: https://peraturan.bpk.go.id/Download/314667/Permentan_Nomor_10_Tahun_2023.pdf

Jasindo menjelaskan Asuransi Usaha Tani Padi (AUTP) dengan premi Rp180.000/ha, 80% bantuan pemerintah sehingga petani membayar Rp36.000/ha, dan nilai pertanggungan maksimal Rp6.000.000/ha untuk kriteria tertentu. Angka ini relevan sebagai referensi awal, tetapi harus bisa diperbarui.  
Sumber: https://jasindo.co.id/media/all/mau-klaim-asuransi-tani-padi-begini-langkah-langkahnya

---

## 4. Asset UI

Kategori ini **tidak wajib foto produk**. Lebih baik pakai ikon/ilustrasi default.

Rekomendasi asset opsional:

| No | Nama Asset Opsional | Fungsi UI |
|---:|---|---|
| 1 | `risiko-banjir.svg` | Banjir/genangan |
| 2 | `risiko-kekeringan.svg` | Kekeringan |
| 3 | `risiko-hama.svg` | Serangan hama |
| 4 | `risiko-penyakit.svg` | Penyakit tanaman |
| 5 | `risiko-gulma.svg` | Gulma tidak terkendali |
| 6 | `risiko-gagal-tumbuh.svg` | Benih tidak tumbuh |
| 7 | `risiko-harga-turun.svg` | Harga jual turun |
| 8 | `risiko-input-naik.svg` | Harga input naik |
| 9 | `risiko-alat-rusak.svg` | Alat/mesin rusak |
| 10 | `risiko-susut-pascapanen.svg` | Susut/kerusakan hasil |
| 11 | `risiko-kredit.svg` | Gagal bayar/pembiayaan |
| 12 | `risiko-kecelakaan-kerja.svg` | K3/cedera |
| 13 | `risiko-pencurian.svg` | Pencurian/kehilangan |
| 14 | `risiko-asuransi.svg` | Klaim/asuransi |

Jika tidak ada asset, gunakan default:

```text
assets/img/saprodi/default/risiko-kerugian.svg
```

---

## 5. Ringkasan Katalog Risiko / Kerugian

| No | Risiko/Kerugian | Kategori | Komoditas | Fase | Dampak Utama | Status Input |
|---:|---|---|---|---|---|---|
| 1 | Kekeringan | Iklim/Air | Padi, Jagung, Kedelai | Semua fase, paling kritis generatif | Hasil turun, biaya pompa naik | Risk register + kerugian aktual |
| 2 | Banjir / Genangan | Iklim/Air | Padi, Jagung, Kedelai | Pra-tanam sampai panen | Tanaman mati, gagal tanam, busuk akar | Risk register + kerugian aktual |
| 3 | Serangan Hama | OPT | Padi, Jagung, Kedelai | Vegetatif-generatif | Hasil turun, biaya pengendalian naik | Risk register |
| 4 | Penyakit Tanaman | OPT | Padi, Jagung, Kedelai | Vegetatif-generatif | Mutu/hasil turun | Risk register |
| 5 | Gulma Tidak Terkendali | Kompetisi tanaman | Padi, Jagung, Kedelai | Awal-vegetatif | Pertumbuhan terganggu, hasil turun | Risk register |
| 6 | Benih Tidak Tumbuh / Gagal Tumbuh | Produksi | Padi, Jagung, Kedelai | Tanam-awal | Penyulaman, tanam ulang | Kerugian aktual |
| 7 | Keterlambatan Tanam | Operasional | Padi, Jagung, Kedelai | Pra-tanam/tanam | Mundur musim, risiko cuaca | Risk register |
| 8 | Kekurangan Tenaga Kerja | Operasional | Padi, Jagung, Kedelai | Tanam, panen | Kegiatan terlambat, upah naik | Risk register |
| 9 | Alat/Mesin Rusak | Operasional/aset | Padi, Jagung, Kedelai | Semua fase | Biaya servis, pekerjaan tertunda | Kerugian aktual |
| 10 | Kegagalan Irigasi / Pompa | Air/alat | Padi, Jagung, Kedelai | Vegetatif-generatif | Tanaman stres air, biaya tambahan | Kerugian aktual |
| 11 | Kenaikan Harga Input | Finansial/pasar | Padi, Jagung, Kedelai | Pra-tanam/perawatan | Modal membengkak | Risk register |
| 12 | Kelangkaan Input | Pasokan | Padi, Jagung, Kedelai | Pra-tanam/perawatan | Telat pupuk/obat/benih | Risk register |
| 13 | Harga Jual Turun | Pasar | Padi, Jagung, Kedelai | Panen/penjualan | Pendapatan turun | Kerugian aktual |
| 14 | Kualitas Hasil Turun | Mutu | Padi, Jagung, Kedelai | Panen/pascapanen | Harga jual turun | Kerugian aktual |
| 15 | Susut Panen | Panen | Padi, Jagung, Kedelai | Panen | Hasil tercecer/rontok | Kerugian aktual |
| 16 | Susut Pascapanen | Pascapanen | Padi, Jagung, Kedelai | Jemur/simpan | Berjamur, pecah, dimakan hama | Kerugian aktual |
| 17 | Transportasi Bermasalah | Logistik | Padi, Jagung, Kedelai | Panen/penjualan | Ongkir naik, telat kirim, bobot susut | Kerugian aktual |
| 18 | Gudang Lembap / Hama Gudang | Penyimpanan | Padi, Jagung, Kedelai | Pascapanen | Mutu turun, jamur, hama | Kerugian aktual |
| 19 | Pencurian / Kehilangan | Keamanan | Padi, Jagung, Kedelai | Semua fase | Input/hasil/aset hilang | Kerugian aktual |
| 20 | Konflik Lahan / Bagi Hasil | Sosial/legal | Padi, Jagung, Kedelai | Semua fase | Biaya sosial, hasil tertahan | Risk register |
| 21 | Gagal Bayar Pinjaman | Finansial | Padi, Jagung, Kedelai | Akhir musim | Denda, utang menumpuk | Risk register |
| 22 | Kecelakaan Kerja / Paparan Pestisida | K3 | Padi, Jagung, Kedelai | Penyemprotan/panen | Biaya kesehatan, kerja terganggu | Kerugian aktual |
| 23 | Bencana Alam Ekstrem | Iklim/bencana | Padi, Jagung, Kedelai | Semua fase | Puso/gagal panen | Risk register + asuransi |
| 24 | Klaim Asuransi / AUTP | Mitigasi finansial | Padi terutama | Setelah kerugian | Kompensasi sebagian kerugian | Klaim/kompensasi |
| 25 | Risiko Data Salah | Administrasi | Padi, Jagung, Kedelai | Input laporan | Profit salah, keputusan keliru | Audit data |

---

## 6. Detail Risiko/Kerugian

### 6.1 Kekeringan

| Field | Isi |
|---|---|
| Kategori | Iklim/Air |
| Komoditas | Padi, Jagung, Kedelai |
| Fase rawan | Tanam, vegetatif, generatif, pengisian hasil |
| Dampak | Pertumbuhan terganggu, hasil turun, biaya pompa/BBM naik |
| Indikator | Hujan rendah, saluran kering, tanah retak, daun menggulung/layu |
| Mitigasi | Jadwal tanam, pompa, mulsa, irigasi hemat air, varietas sesuai, cadangan BBM |
| Kerugian dicatat sebagai | biaya tambahan air + penurunan hasil |

Rumus:

```text
kerugian_kekeringan =
biaya_tambahan_irigasi
+ nilai_hasil_hilang
```

---

### 6.2 Banjir / Genangan

| Field | Isi |
|---|---|
| Kategori | Iklim/Air |
| Komoditas | Padi, Jagung, Kedelai |
| Fase rawan | Pra-tanam, awal pertumbuhan, menjelang panen |
| Dampak | Benih busuk, tanaman mati, gagal tanam, busuk akar, panen terlambat |
| Indikator | Genangan lama, saluran tidak jalan, pematang jebol, hujan ekstrem |
| Mitigasi | Drainase, pematang, jadwal tanam, pompa buang, bedengan untuk jagung/kedelai |
| Kerugian dicatat sebagai | tanam ulang + hasil hilang + biaya drainase/perbaikan |

Rumus:

```text
kerugian_banjir =
biaya_tanam_ulang
+ biaya_perbaikan
+ nilai_hasil_hilang
- klaim_asuransi
```

---

### 6.3 Serangan Hama

| Field | Isi |
|---|---|
| Kategori | OPT |
| Komoditas | Padi, Jagung, Kedelai |
| Fase rawan | Vegetatif sampai generatif |
| Dampak | Daun rusak, batang rusak, malai/tongkol/polong rusak, hasil turun |
| Indikator | Populasi hama meningkat, kerusakan daun/batang/buah, gejala khas OPT |
| Mitigasi | Monitoring, PHT, perangkap, agens hayati, musuh alami, pestisida sesuai label jika perlu |
| Kerugian dicatat sebagai | biaya pengendalian + nilai hasil hilang |

Catatan:
- Perlindungan tanaman harus mengikuti prinsip aman bagi manusia dan lingkungan.
- Jangan membuat UI yang mendorong semprot otomatis tanpa monitoring.

---

### 6.4 Penyakit Tanaman

| Field | Isi |
|---|---|
| Kategori | OPT |
| Komoditas | Padi, Jagung, Kedelai |
| Fase rawan | Vegetatif-generatif |
| Dampak | Tanaman lemah, daun/polong/tongkol/gabah rusak, mutu turun |
| Indikator | Bercak, busuk, layu, karat, hawar, gejala jamur/bakteri/virus |
| Mitigasi | Benih sehat, sanitasi, rotasi, jarak tanam, drainase, fungisida/bakterisida sesuai label |
| Kerugian dicatat sebagai | biaya pengendalian + penurunan hasil/mutu |

---

### 6.5 Gulma Tidak Terkendali

| Field | Isi |
|---|---|
| Kategori | Kompetisi tanaman |
| Komoditas | Padi, Jagung, Kedelai |
| Fase rawan | Awal pertumbuhan dan vegetatif |
| Dampak | Hara/air/cahaya bersaing, hasil turun, biaya penyiangan naik |
| Indikator | Gulma tumbuh rapat, tanaman utama kalah tumbuh |
| Mitigasi | Penyiangan manual, herbisida sesuai label, mulsa, pengolahan lahan baik |
| Kerugian dicatat sebagai | biaya penyiangan tambahan + potensi hasil hilang |

---

### 6.6 Benih Tidak Tumbuh / Gagal Tumbuh

| Field | Isi |
|---|---|
| Kategori | Produksi |
| Komoditas | Padi, Jagung, Kedelai |
| Fase rawan | Tanam-awal pertumbuhan |
| Dampak | Populasi tanaman rendah, perlu penyulaman/tanam ulang |
| Penyebab | Mutu benih, kedalaman tanam, air, hama, penyakit, genangan/kering |
| Mitigasi | Benih bermutu, seed treatment jika relevan, cek daya tumbuh, penyulaman cepat |
| Kerugian dicatat sebagai | benih tambahan + tenaga penyulaman + hasil hilang |

Rumus:

```text
biaya_gagal_tumbuh =
biaya_benih_tambahan
+ biaya_tenaga_penyulaman
+ estimasi_hasil_hilang
```

---

### 6.7 Keterlambatan Tanam

| Field | Isi |
|---|---|
| Kategori | Operasional |
| Komoditas | Padi, Jagung, Kedelai |
| Fase rawan | Pra-tanam/tanam |
| Dampak | Musim bergeser, risiko kekeringan/hujan saat panen, jadwal tenaga terganggu |
| Penyebab | Telat olah tanah, telat input, alat tidak tersedia, air belum ada |
| Mitigasi | Kalender tanam, booking alat, siapkan input lebih awal, koordinasi kelompok |
| Kerugian dicatat sebagai | biaya tambahan + potensi penurunan hasil |

---

### 6.8 Kekurangan Tenaga Kerja

| Field | Isi |
|---|---|
| Kategori | Operasional |
| Komoditas | Padi, Jagung, Kedelai |
| Fase rawan | Tanam, panen, pascapanen |
| Dampak | Kegiatan terlambat, upah naik, panen mundur, hasil tercecer/rusak |
| Mitigasi | Borongan awal, jadwal tenaga, mekanisasi, gotong royong |
| Kerugian dicatat sebagai | selisih upah + hasil hilang karena telat |

---

### 6.9 Alat/Mesin Rusak

| Field | Isi |
|---|---|
| Kategori | Operasional/aset |
| Komoditas | Padi, Jagung, Kedelai |
| Fase rawan | Olah tanah, irigasi, penyemprotan, panen, pascapanen |
| Dampak | Kegiatan tertunda, biaya servis, sewa pengganti |
| Mitigasi | Servis berkala, sparepart, backup alat, pinjam kelompok |
| Kerugian dicatat sebagai | biaya servis + sewa pengganti + kerugian akibat keterlambatan |

Rumus:

```text
kerugian_alat_rusak =
biaya_servis
+ biaya_sparepart
+ biaya_sewa_pengganti
+ nilai_hasil_hilang_jika_ada
```

---

### 6.10 Kegagalan Irigasi / Pompa

| Field | Isi |
|---|---|
| Kategori | Air/alat |
| Komoditas | Padi, Jagung, Kedelai |
| Fase rawan | Vegetatif-generatif |
| Dampak | Stres air, hasil turun, biaya pompa/BBM naik |
| Mitigasi | Pompa cadangan, cek selang/pipa, jadwal air, perbaikan saluran |
| Kerugian dicatat sebagai | biaya perbaikan + hasil hilang |

---

### 6.11 Kenaikan Harga Input

| Field | Isi |
|---|---|
| Kategori | Finansial/pasar input |
| Komoditas | Padi, Jagung, Kedelai |
| Fase rawan | Pra-tanam/perawatan |
| Dampak | Modal membengkak, pembelian input dikurangi, dosis tidak optimal |
| Mitigasi | Beli awal, bandingkan toko, stok kelompok, cadangan kas |
| Kerugian dicatat sebagai | selisih harga aktual vs rencana |

Rumus:

```text
kerugian_harga_input =
(harga_aktual - harga_rencana) × jumlah_dibeli
```

---

### 6.12 Kelangkaan Input

| Field | Isi |
|---|---|
| Kategori | Pasokan |
| Komoditas | Padi, Jagung, Kedelai |
| Fase rawan | Pra-tanam/perawatan |
| Dampak | Telat tanam, telat pupuk, penggunaan produk pengganti lebih mahal |
| Mitigasi | Rencana kebutuhan awal, supplier alternatif, kelompok tani |
| Kerugian dicatat sebagai | selisih biaya + dampak hasil jika ada |

---

### 6.13 Harga Jual Turun

| Field | Isi |
|---|---|
| Kategori | Pasar |
| Komoditas | Padi, Jagung, Kedelai |
| Fase rawan | Panen/penjualan |
| Dampak | Pendapatan turun walaupun produksi bagus |
| Penyebab | Panen raya, kualitas rendah, kadar air tinggi, posisi tawar rendah |
| Mitigasi | Simpan sementara jika layak, kelompok penjualan, kontrak, perbaiki kualitas |
| Kerugian dicatat sebagai | selisih harga rencana vs harga aktual |

Rumus:

```text
kerugian_harga_jual =
(harga_rencana_per_kg - harga_aktual_per_kg) × kg_terjual
```

---

### 6.14 Kualitas Hasil Turun

| Field | Isi |
|---|---|
| Kategori | Mutu |
| Komoditas | Padi, Jagung, Kedelai |
| Fase rawan | Panen/pascapanen |
| Dampak | Harga jual turun, penolakan pembeli, susut |
| Penyebab | Kadar air tinggi, jamur, kotoran, biji pecah, gabah hampa |
| Mitigasi | Jemur baik, sortasi, karung bersih, gudang kering, kadar air dicek |
| Kerugian dicatat sebagai | diskon harga + hasil ditolak/rusak |

---

### 6.15 Susut Panen

| Field | Isi |
|---|---|
| Kategori | Panen |
| Komoditas | Padi, Jagung, Kedelai |
| Fase rawan | Panen |
| Dampak | Hasil tercecer, rontok, tertinggal di lahan |
| Penyebab | Panen terlambat, alat kurang tepat, tenaga kurang, cuaca |
| Mitigasi | Panen tepat waktu, alat sesuai, tenaga cukup, wadah/karung siap |
| Kerugian dicatat sebagai | kg hilang × harga per kg |

Rumus:

```text
kerugian_susut_panen =
kg_hilang × harga_jual_per_kg
```

---

### 6.16 Susut Pascapanen

| Field | Isi |
|---|---|
| Kategori | Pascapanen |
| Komoditas | Padi, Jagung, Kedelai |
| Fase rawan | Jemur, simpan, rontok/pipil |
| Dampak | Hasil bersih turun, mutu turun |
| Penyebab | Tercecer, biji pecah, jamur, kadar air tinggi, hama gudang |
| Mitigasi | Terpal, sortasi, gudang kering, karung baik, kadar air aman |
| Kerugian dicatat sebagai | kg susut + diskon mutu |

---

### 6.17 Transportasi Bermasalah

| Field | Isi |
|---|---|
| Kategori | Logistik |
| Komoditas | Padi, Jagung, Kedelai |
| Fase rawan | Panen/penjualan |
| Dampak | Telat kirim, biaya kendaraan naik, hasil rusak, selisih bobot |
| Penyebab | Jalan becek, kendaraan tidak tersedia, ongkir naik, karung rusak |
| Mitigasi | Booking kendaraan, titik kumpul, karung kuat, jadwal pengiriman |
| Kerugian dicatat sebagai | ongkir tambahan + hasil rusak/susut |

---

### 6.18 Gudang Lembap / Hama Gudang

| Field | Isi |
|---|---|
| Kategori | Penyimpanan |
| Komoditas | Padi, Jagung, Kedelai |
| Fase rawan | Pascapanen/penyimpanan |
| Dampak | Jamur, hama gudang, mutu turun, harga turun |
| Mitigasi | Kadar air aman, ventilasi, alas/palet, gudang bersih, cek rutin |
| Kerugian dicatat sebagai | hasil rusak + biaya penanganan |

---

### 6.19 Pencurian / Kehilangan

| Field | Isi |
|---|---|
| Kategori | Keamanan |
| Komoditas | Padi, Jagung, Kedelai |
| Fase rawan | Semua fase |
| Dampak | Input, alat, atau hasil hilang |
| Mitigasi | Gudang terkunci, catatan stok, kelompok jaga, lokasi aman |
| Kerugian dicatat sebagai | nilai barang/harga hasil yang hilang |

---

### 6.20 Konflik Lahan / Bagi Hasil

| Field | Isi |
|---|---|
| Kategori | Sosial/legal |
| Komoditas | Padi, Jagung, Kedelai |
| Fase rawan | Pra-tanam sampai penjualan |
| Dampak | Hasil tertahan, pembagian tidak jelas, biaya sosial |
| Mitigasi | Perjanjian awal, catatan tertulis, saksi kelompok, input skema bagi hasil |
| Kerugian dicatat sebagai | biaya penyelesaian + hasil/pendapatan tertahan |

---

### 6.21 Gagal Bayar Pinjaman

| Field | Isi |
|---|---|
| Kategori | Finansial |
| Komoditas | Padi, Jagung, Kedelai |
| Fase rawan | Akhir musim |
| Dampak | Denda, bunga berjalan, akses pembiayaan turun |
| Penyebab | Hasil turun, harga jual turun, biaya naik, jadwal panen mundur |
| Mitigasi | Simulasi arus kas, dana cadangan, jadwal jatuh tempo setelah panen |
| Kerugian dicatat sebagai | denda + bunga tambahan + biaya restrukturisasi jika ada |

---

### 6.22 Kecelakaan Kerja / Paparan Pestisida

| Field | Isi |
|---|---|
| Kategori | K3 |
| Komoditas | Padi, Jagung, Kedelai |
| Fase rawan | Penyemprotan, olah tanah, panen, mesin |
| Dampak | Biaya kesehatan, kerja tertunda, produktivitas turun |
| Mitigasi | APD, pelatihan, label pestisida, keselamatan mesin |
| Kerugian dicatat sebagai | biaya kesehatan + kehilangan hari kerja |

Catatan:
- APD dari bahan pendukung seperti masker, sarung tangan, dan sepatu boot dapat menjadi biaya mitigasi.

---

### 6.23 Bencana Alam Ekstrem

| Field | Isi |
|---|---|
| Kategori | Iklim/bencana |
| Komoditas | Padi, Jagung, Kedelai |
| Fase rawan | Semua fase |
| Dampak | Puso, gagal panen, alat rusak, akses putus |
| Mitigasi | Asuransi, kalender tanam, drainase, cadangan kas, diversifikasi |
| Kerugian dicatat sebagai | nilai hasil hilang + biaya pemulihan - klaim |

---

### 6.24 Klaim Asuransi / AUTP

| Field | Isi |
|---|---|
| Kategori | Mitigasi finansial |
| Komoditas | Padi terutama |
| Fase | Setelah kerugian |
| Fungsi | Mencatat kompensasi finansial atas kerugian tertentu |
| Referensi | AUTP: premi Rp180.000/ha, bantuan pemerintah 80%, petani membayar Rp36.000/ha, pertanggungan maksimal Rp6.000.000/ha pada kriteria tertentu menurut Jasindo |
| Catatan UI | Jadikan angka referensi, bukan hardcode permanen |

Rumus:

```text
kerugian_bersih =
kerugian_aktual
- nilai_klaim_diterima
```

---

### 6.25 Risiko Data Salah

| Field | Isi |
|---|---|
| Kategori | Administrasi/data |
| Komoditas | Padi, Jagung, Kedelai |
| Fase rawan | Semua fase |
| Dampak | Profit salah, keputusan salah, biaya dobel, hasil tidak akurat |
| Mitigasi | Validasi input, audit transaksi, anti-double-counting, histori edit |
| Kerugian dicatat sebagai | bukan kerugian langsung, tetapi risiko kualitas keputusan |

Contoh:
- biaya traktor dicatat di Persiapan Lahan dan Alat & Mesin sekaligus,
- BBM pompa dicatat di Air & Irigasi dan Modal/Admin,
- karung panen dicatat di Panen dan Bahan Pendukung,
- hasil panen dihitung dua kali karena kg dan karung tidak dikonversi.

---

## 7. Matriks Risiko

### 7.1 Skor Probabilitas

| Skor | Label | Makna |
|---:|---|---|
| 1 | Sangat rendah | Jarang terjadi |
| 2 | Rendah | Mungkin terjadi, tetapi tidak sering |
| 3 | Sedang | Cukup mungkin terjadi |
| 4 | Tinggi | Sering terjadi di lahan/daerah tersebut |
| 5 | Sangat tinggi | Hampir pasti/berulang |

### 7.2 Skor Dampak

| Skor | Label | Makna |
|---:|---|---|
| 1 | Ringan | Kerugian kecil, tidak mengganggu musim |
| 2 | Rendah | Ada biaya tambahan, hasil relatif aman |
| 3 | Sedang | Hasil/biaya terdampak cukup jelas |
| 4 | Tinggi | Hasil turun besar atau biaya besar |
| 5 | Sangat tinggi | Gagal panen/puso/utang bermasalah |

### 7.3 Level Risiko

```text
risk_score = probabilitas × dampak
```

| Skor | Level | Tindakan |
|---:|---|---|
| 1–4 | Rendah | Monitor |
| 5–9 | Sedang | Buat mitigasi |
| 10–16 | Tinggi | Wajib rencana tindakan dan cadangan biaya |
| 17–25 | Kritis | Butuh tindakan cepat, klaim/asuransi/cadangan |

---

## 8. Model Perhitungan Kerugian

### 8.1 Kerugian Hasil Hilang

```text
kerugian_hasil =
kg_hasil_hilang × harga_jual_per_kg
```

### 8.2 Kerugian Mutu Turun

```text
kerugian_mutu =
(harga_normal_per_kg - harga_diskon_per_kg) × kg_terjual
```

### 8.3 Kerugian Input Terbuang

```text
kerugian_input =
nilai_benih_terbuang
+ nilai_pupuk_terbuang
+ nilai_pestisida_terbuang
+ biaya_tenaga_terbuang
```

### 8.4 Kerugian Karena Tanam Ulang

```text
kerugian_tanam_ulang =
biaya_benih_ulang
+ biaya_olah_tanah_ulang
+ biaya_tanam_ulang
+ biaya_pemupukan_ulang
+ biaya_lain
```

### 8.5 Kerugian Bersih Setelah Klaim

```text
kerugian_bersih =
kerugian_aktual
+ biaya_pemulihan
- klaim_asuransi
- kompensasi_lain
```

### 8.6 Expected Loss

```text
expected_loss =
probabilitas_kejadian × estimasi_dampak_rupiah
```

Untuk UI sederhana:

```text
expected_loss =
(probabilitas_skor / 5) × estimasi_dampak_rupiah
```

---

## 9. Anti Double Counting

| Kasus | Aturan |
|---|---|
| Hama menyerang dan petani beli pestisida | Pestisida = biaya mitigasi di Perlindungan Tanaman. Kerugian hasil = Risiko/Kerugian. Jangan gabungkan tanpa label. |
| Banjir menyebabkan tanam ulang | Biaya tanam ulang masuk biaya aktual; hasil hilang masuk kerugian. |
| Harga jual turun | Catat sebagai kerugian pasar, bukan biaya produksi. |
| Susut pascapanen | Catat sebagai pengurang hasil bersih, bukan biaya tunai kecuali ada biaya penanganan. |
| Alat rusak | Biaya servis masuk biaya aktual; keterlambatan yang menurunkan hasil masuk kerugian. |
| Klaim asuransi | Catat sebagai pengurang kerugian, bukan pendapatan panen biasa. |
| Dana cadangan | Cadangan bukan kerugian sampai dipakai. |
| Biaya APD | APD adalah mitigasi K3, bukan kerugian. |
| Denda pinjaman | Masuk Modal & Administrasi sebagai biaya pembiayaan; boleh ditautkan ke risiko gagal bayar. |

Warning UI:

```text
Apakah ini biaya pencegahan, kerugian aktual, atau kompensasi? Pilih jenis yang benar agar profit tidak bias.
```

---

## 10. Rekomendasi UI AgroTrack

### 10.1 Kelompok UI

1. **Risiko Produksi**
   - Kekeringan
   - Banjir/genangan
   - Benih gagal tumbuh
   - Keterlambatan tanam

2. **Risiko OPT**
   - Hama
   - Penyakit
   - Gulma

3. **Risiko Operasional**
   - Tenaga kerja kurang
   - Alat rusak
   - Pompa/irigasi gagal
   - Transport bermasalah

4. **Risiko Pasar dan Keuangan**
   - Input naik
   - Input langka
   - Harga jual turun
   - Gagal bayar pinjaman

5. **Risiko Pascapanen dan Mutu**
   - Susut panen
   - Susut pascapanen
   - Kualitas turun
   - Gudang lembap/hama gudang

6. **Risiko Sosial, Keamanan, dan K3**
   - Pencurian
   - Konflik lahan/bagi hasil
   - Kecelakaan kerja/paparan pestisida

7. **Mitigasi Finansial**
   - Asuransi/AUTP
   - Klaim
   - Dana cadangan

### 10.2 Form Risiko Potensial

```text
nama_risiko
kategori_risiko
komoditas
fase
probabilitas_skor
dampak_skor
risk_score
level_risiko
estimasi_dampak_rupiah
rencana_mitigasi
penanggung_jawab
status_risiko
catatan
```

### 10.3 Form Kerugian Aktual

```text
nama_kejadian
tanggal_kejadian
kategori_risiko
komoditas
fase
luas_terdampak_ha
persen_kerusakan
kg_hasil_hilang
harga_per_kg
biaya_pemulihan
biaya_tambahan
klaim_asuransi
kompensasi_lain
kerugian_bersih
bukti_foto
catatan
```

### 10.4 Badge UI

| Badge | Makna |
|---|---|
| `Potensial` | Risiko belum terjadi |
| `Aktual` | Kerugian sudah terjadi |
| `Mitigasi` | Ada tindakan pencegahan |
| `Klaim` | Ada asuransi/kompensasi |
| `Kritis` | Skor risiko tinggi |
| `Pengurang Profit` | Mengurangi hasil/pendapatan |
| `Non-tunai` | Tidak selalu ada uang keluar, tetapi hasil hilang |
| `Butuh bukti` | Perlu foto/catatan untuk klaim |

---

## 11. Rekomendasi Database

### 11.1 Master Risiko

```sql
CREATE TABLE IF NOT EXISTS risiko_items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nama_risiko VARCHAR(150) NOT NULL,
  kategori_risiko ENUM(
    'iklim_air',
    'opt',
    'produksi',
    'operasional',
    'pasar',
    'finansial',
    'pascapanen_mutu',
    'logistik',
    'keamanan',
    'sosial_legal',
    'k3',
    'administrasi_data',
    'mitigasi_finansial'
  ) NOT NULL,
  fase_penggunaan VARCHAR(100) NULL,
  relevan_padi TINYINT(1) DEFAULT 0,
  relevan_jagung TINYINT(1) DEFAULT 0,
  relevan_kedelai TINYINT(1) DEFAULT 0,
  indikator TEXT NULL,
  dampak_umum TEXT NULL,
  mitigasi_umum TEXT NULL,
  catatan_overlap TEXT NULL,
  status ENUM('aktif','nonaktif') DEFAULT 'aktif',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

### 11.2 Risk Register Musim Tanam

```sql
CREATE TABLE IF NOT EXISTS risiko_musim_tanam (
  id INT AUTO_INCREMENT PRIMARY KEY,
  musim_tanam_id INT NOT NULL,
  risiko_item_id INT NULL,
  nama_risiko VARCHAR(150) NOT NULL,
  kategori_risiko VARCHAR(100) NOT NULL,
  fase VARCHAR(100) NULL,
  probabilitas_skor TINYINT NULL,
  dampak_skor TINYINT NULL,
  risk_score INT NULL,
  level_risiko ENUM('rendah','sedang','tinggi','kritis') NULL,
  estimasi_dampak_rupiah DECIMAL(14,2) NULL,
  rencana_mitigasi TEXT NULL,
  status_risiko ENUM('teridentifikasi','dipantau','terjadi','tertangani','ditutup') DEFAULT 'teridentifikasi',
  catatan TEXT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

### 11.3 Kerugian Aktual

```sql
CREATE TABLE IF NOT EXISTS kerugian_musim_tanam (
  id INT AUTO_INCREMENT PRIMARY KEY,
  musim_tanam_id INT NOT NULL,
  risiko_musim_tanam_id INT NULL,
  nama_kejadian VARCHAR(150) NOT NULL,
  tanggal_kejadian DATE NULL,
  kategori_kerugian VARCHAR(100) NULL,
  fase VARCHAR(100) NULL,
  luas_terdampak_ha DECIMAL(10,4) NULL,
  persen_kerusakan DECIMAL(5,2) NULL,
  kg_hasil_hilang DECIMAL(14,2) NULL,
  harga_per_kg DECIMAL(14,2) NULL,
  nilai_hasil_hilang DECIMAL(14,2) NULL,
  biaya_pemulihan DECIMAL(14,2) NULL,
  biaya_tambahan DECIMAL(14,2) NULL,
  klaim_asuransi DECIMAL(14,2) NULL,
  kompensasi_lain DECIMAL(14,2) NULL,
  kerugian_bersih DECIMAL(14,2) NOT NULL DEFAULT 0,
  bukti_foto VARCHAR(255) NULL,
  catatan TEXT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

### 11.4 Klaim Asuransi / Kompensasi

```sql
CREATE TABLE IF NOT EXISTS klaim_kerugian (
  id INT AUTO_INCREMENT PRIMARY KEY,
  kerugian_id INT NOT NULL,
  jenis_klaim ENUM('AUTP','asuransi_lain','bantuan_pemerintah','kompensasi_pembeli','lainnya') NOT NULL,
  nomor_polis VARCHAR(100) NULL,
  tanggal_pengajuan DATE NULL,
  tanggal_diterima DATE NULL,
  nilai_diajukan DECIMAL(14,2) NULL,
  nilai_disetujui DECIMAL(14,2) NULL,
  nilai_diterima DECIMAL(14,2) NULL,
  status_klaim ENUM('draft','diajukan','disetujui','ditolak','dibayar') DEFAULT 'draft',
  catatan TEXT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

---

## 12. Contoh SQL Seed Master Risiko

```sql
INSERT INTO risiko_items
(nama_risiko, kategori_risiko, fase_penggunaan, relevan_padi, relevan_jagung, relevan_kedelai, indikator, dampak_umum, mitigasi_umum, catatan_overlap)
VALUES
('Kekeringan','iklim_air','Semua fase / Generatif',1,1,1,'Hujan rendah, saluran kering, tanah retak, tanaman layu.','Hasil turun dan biaya irigasi naik.','Jadwal tanam, pompa, irigasi hemat air, cadangan BBM.','Biaya pompa masuk Air & Irigasi; kerugian hasil masuk Risiko/Kerugian.'),
('Banjir / Genangan','iklim_air','Pra-tanam sampai panen',1,1,1,'Genangan lama, pematang jebol, saluran tidak jalan.','Tanaman mati, gagal tanam, busuk akar.','Drainase, pematang, pompa buang, bedengan.','Biaya drainase masuk Air & Irigasi/Persiapan Lahan.'),
('Serangan Hama','opt','Vegetatif / Generatif',1,1,1,'Populasi hama dan kerusakan tanaman meningkat.','Hasil turun dan biaya pengendalian naik.','Monitoring, PHT, perangkap, agens hayati, pestisida sesuai label.','Biaya pestisida masuk Perlindungan Tanaman; hasil hilang masuk Kerugian.'),
('Penyakit Tanaman','opt','Vegetatif / Generatif',1,1,1,'Bercak, busuk, layu, hawar, karat, gejala penyakit.','Mutu dan hasil turun.','Benih sehat, sanitasi, drainase, pengendalian sesuai label.','Biaya pengendalian dan kerugian hasil dipisah.'),
('Gulma Tidak Terkendali','produksi','Awal / Vegetatif',1,1,1,'Gulma rapat dan tanaman utama kalah tumbuh.','Pertumbuhan terganggu dan hasil turun.','Penyiangan, herbisida sesuai label, mulsa, olah tanah baik.','Biaya penyiangan masuk Tenaga Kerja.'),
('Benih Tidak Tumbuh / Gagal Tumbuh','produksi','Tanam / Awal',1,1,1,'Populasi tanaman rendah setelah tanam.','Perlu penyulaman/tanam ulang dan hasil turun.','Benih bermutu, cek daya tumbuh, penyulaman cepat.','Biaya benih tambahan masuk Benih; kerugian hasil masuk Kerugian.'),
('Keterlambatan Tanam','operasional','Pra-tanam / Tanam',1,1,1,'Input/alat/air terlambat.','Musim bergeser dan risiko cuaca meningkat.','Kalender tanam, booking alat, siapkan input awal.','Dampak bisa masuk biaya tambahan dan hasil hilang.'),
('Kekurangan Tenaga Kerja','operasional','Tanam / Panen',1,1,1,'Buruh sulit tersedia atau upah naik.','Kegiatan terlambat dan biaya naik.','Jadwal tenaga, borongan awal, mekanisasi, gotong royong.','Biaya tenaga tetap di Tenaga Kerja.'),
('Alat/Mesin Rusak','operasional','Semua fase',1,1,1,'Pompa/traktor/sprayer/mesin panen tidak berfungsi.','Biaya servis dan pekerjaan tertunda.','Servis berkala, sparepart, backup alat.','Servis masuk Alat & Mesin; hasil hilang masuk Kerugian.'),
('Kegagalan Irigasi / Pompa','operasional','Vegetatif / Generatif',1,1,1,'Pompa rusak, air tidak sampai, saluran bocor.','Tanaman stres air dan biaya tambahan.','Pompa cadangan, cek pipa/selang, jadwal air.','Biaya air masuk Air & Irigasi.'),
('Kenaikan Harga Input','finansial','Pra-tanam / Perawatan',1,1,1,'Harga benih/pupuk/pestisida naik dari rencana.','Modal membengkak.','Beli awal, bandingkan toko, stok kelompok, cadangan kas.','Selisih harga bisa dicatat sebagai risiko finansial.'),
('Kelangkaan Input','operasional','Pra-tanam / Perawatan',1,1,1,'Input tidak tersedia tepat waktu.','Telat tanam/pupuk dan biaya pengganti naik.','Supplier alternatif dan perencanaan awal.','Dampak bisa biaya tambahan dan hasil hilang.'),
('Harga Jual Turun','pasar','Panen / Penjualan',1,1,1,'Harga aktual lebih rendah dari target.','Pendapatan turun.','Penyimpanan layak, kelompok penjualan, kualitas hasil.','Bukan biaya produksi; catat sebagai kerugian pasar.'),
('Kualitas Hasil Turun','pascapanen_mutu','Panen / Pascapanen',1,1,1,'Kadar air tinggi, kotor, jamur, biji pecah.','Harga jual turun atau hasil ditolak.','Jemur, sortasi, gudang kering, karung bersih.','Diskon harga masuk kerugian mutu.'),
('Susut Panen','pascapanen_mutu','Panen',1,1,1,'Hasil tercecer/rontok/tertinggal.','Hasil bersih turun.','Panen tepat waktu, alat sesuai, karung siap.','Kg hilang × harga per kg.'),
('Susut Pascapanen','pascapanen_mutu','Pascapanen',1,1,1,'Berjamur, pecah, tercecer, dimakan hama gudang.','Hasil bersih dan mutu turun.','Terpal, kadar air aman, gudang bersih.','Masuk sebagai pengurang hasil bersih.'),
('Transportasi Bermasalah','logistik','Panen / Penjualan',1,1,1,'Kendaraan telat, jalan rusak, ongkir naik.','Telat kirim, hasil rusak, biaya naik.','Booking kendaraan, titik kumpul, karung kuat.','Biaya kendaraan masuk Transportasi; kerusakan hasil masuk Kerugian.'),
('Gudang Lembap / Hama Gudang','pascapanen_mutu','Penyimpanan',1,1,1,'Gudang lembap, jamur, hama gudang.','Mutu turun dan hasil rusak.','Kadar air aman, ventilasi, palet, cek rutin.','Biaya gudang masuk Logistik/Pascapanen.'),
('Pencurian / Kehilangan','keamanan','Semua fase',1,1,1,'Input, alat, atau hasil hilang.','Kerugian nilai barang.','Catatan stok, gudang terkunci, kelompok jaga.','Kerugian dihitung dari nilai barang/harga hasil.'),
('Konflik Lahan / Bagi Hasil','sosial_legal','Semua fase',1,1,1,'Pembagian tidak jelas atau lahan diperselisihkan.','Hasil/pendapatan tertahan.','Perjanjian awal dan catatan tertulis.','Biaya bagi hasil masuk Modal & Administrasi.'),
('Gagal Bayar Pinjaman','finansial','Akhir musim',1,1,1,'Pendapatan tidak cukup untuk bayar kewajiban.','Denda, bunga tambahan, akses pembiayaan terganggu.','Simulasi arus kas dan dana cadangan.','Denda masuk Modal & Administrasi.'),
('Kecelakaan Kerja / Paparan Pestisida','k3','Penyemprotan / Panen / Mesin',1,1,1,'Cedera, keracunan, paparan pestisida.','Biaya kesehatan dan kehilangan hari kerja.','APD, pelatihan, ikuti label, keselamatan mesin.','APD masuk Bahan Pendukung.'),
('Bencana Alam Ekstrem','iklim_air','Semua fase',1,1,1,'Banjir besar, angin, kekeringan ekstrem.','Puso/gagal panen dan alat rusak.','Asuransi, kalender tanam, drainase, cadangan kas.','Klaim asuransi mengurangi kerugian bersih.'),
('Klaim Asuransi / AUTP','mitigasi_finansial','Setelah kerugian',1,0,0,'Kejadian memenuhi syarat klaim.','Mengurangi kerugian bersih.','Simpan bukti, daftar polis, ajukan klaim tepat waktu.','Kompensasi bukan pendapatan panen biasa.'),
('Risiko Data Salah','administrasi_data','Semua fase',1,1,1,'Biaya dobel, hasil salah input, satuan tidak konsisten.','Profit salah dan keputusan keliru.','Validasi input, audit, histori edit, anti-double-counting.','Risiko internal aplikasi.');
```

---

## 13. Rekomendasi MVP AgroTrack

Prioritas wajib:

1. Kekeringan
2. Banjir / Genangan
3. Serangan Hama
4. Penyakit Tanaman
5. Gulma Tidak Terkendali
6. Benih Tidak Tumbuh
7. Alat/Mesin Rusak
8. Kenaikan Harga Input
9. Harga Jual Turun
10. Susut Panen
11. Susut Pascapanen
12. Kualitas Hasil Turun
13. Transportasi Bermasalah
14. Gagal Bayar Pinjaman
15. Klaim Asuransi / AUTP
16. Risiko Data Salah

Prioritas lanjutan:

17. Keterlambatan Tanam
18. Kekurangan Tenaga Kerja
19. Gudang Lembap / Hama Gudang
20. Pencurian / Kehilangan
21. Konflik Lahan
22. Kecelakaan Kerja
23. Bencana Alam Ekstrem

---

## 14. Copy UI Singkat per Item

| Risiko | Copy pendek untuk card |
|---|---|
| Kekeringan | Risiko kekurangan air yang dapat menurunkan hasil dan menambah biaya irigasi. |
| Banjir/Genangan | Risiko air berlebih yang dapat merusak tanaman atau menyebabkan tanam ulang. |
| Serangan Hama | Risiko OPT yang menurunkan hasil dan menambah biaya pengendalian. |
| Penyakit Tanaman | Risiko penyakit yang menurunkan mutu dan produktivitas tanaman. |
| Gulma | Risiko persaingan gulma yang menghambat pertumbuhan tanaman utama. |
| Gagal Tumbuh | Risiko benih tidak tumbuh sehingga perlu penyulaman atau tanam ulang. |
| Keterlambatan Tanam | Risiko jadwal tanam mundur dan terkena musim yang kurang ideal. |
| Kekurangan Tenaga | Risiko pekerjaan penting terlambat karena tenaga kerja tidak tersedia. |
| Alat Rusak | Risiko alat/mesin rusak dan menambah biaya servis atau sewa pengganti. |
| Irigasi Gagal | Risiko air tidak sampai ke lahan karena pompa/saluran bermasalah. |
| Input Naik | Risiko biaya benih, pupuk, pestisida, atau alat naik dari rencana. |
| Input Langka | Risiko input tidak tersedia saat dibutuhkan. |
| Harga Jual Turun | Risiko pendapatan turun karena harga pasar lebih rendah dari target. |
| Kualitas Turun | Risiko hasil dijual lebih murah karena kadar air, kotoran, jamur, atau pecah. |
| Susut Panen | Risiko hasil hilang saat panen karena rontok, tercecer, atau tertinggal. |
| Susut Pascapanen | Risiko hasil berkurang saat jemur, rontok, pipil, simpan, atau angkut. |
| Transport Bermasalah | Risiko telat kirim, ongkir naik, atau hasil rusak saat pengiriman. |
| Gudang Lembap | Risiko hasil rusak karena penyimpanan tidak kering/aman. |
| Pencurian | Risiko input, alat, atau hasil hilang. |
| Konflik Lahan | Risiko pembagian lahan/hasil tidak jelas. |
| Gagal Bayar | Risiko kewajiban pinjaman tidak bisa dibayar tepat waktu. |
| Kecelakaan Kerja | Risiko cedera atau paparan pestisida saat bekerja. |
| Bencana Ekstrem | Risiko gagal panen akibat kejadian ekstrem. |
| Klaim Asuransi | Catatan kompensasi untuk mengurangi kerugian bersih. |
| Data Salah | Risiko profit salah karena input data dobel atau tidak konsisten. |

---

## 15. Referensi Utama

1. BPS — Nilai Produksi dan Biaya Produksi per Musim Tanam per Hektar Budidaya Padi, Jagung, dan Kedelai.  
   https://www.bps.go.id/statictable/2019/04/10/2055/nilai-produksi-dan-biaya-produksi-per-musim-tanam-per-hektar-budidaya-tanaman-padi-sawah-padi-ladang-jagung-dan-kedelai-2017.html

2. PP No. 6 Tahun 1995 tentang Perlindungan Tanaman.  
   https://www.flevin.com/id/lgso/legislation/Mirror/czoyNjoiZD0xOTAwKzk1JmY9cHA2LTE5OTVidC5odG0iOw%3D%3D.html

3. Permentan No. 10 Tahun 2023 — Balai Besar Peramalan OPT.  
   https://peraturan.bpk.go.id/Download/314667/Permentan_Nomor_10_Tahun_2023.pdf

4. Jasindo — Klaim Asuransi Tani Padi / AUTP.  
   https://jasindo.co.id/media/all/mau-klaim-asuransi-tani-padi-begini-langkah-langkahnya

5. Buku Pengendalian Hama dan Penyakit Tanaman Pangan dan Hortikultura.  
   https://eprints.unm.ac.id/21977/1/Buku%20Pengendalian%20Hama%20dan%20Penyakit%20Tanaman%20Pangan%20dan%20Hortikultura.pdf

6. Dinas Pertanian Demak — Pascapanen Kedelai.  
   https://dinpertanpangan.demakkab.go.id/?p=3395

7. FTP UGM — Teknologi Pascapanen Jagung.  
   https://kanalpengetahuan.tp.ugm.ac.id/menara-ilmu/2017/581-teknologi-pascapanen-jagung.html

8. Penanganan pascapanen padi dan pengeringan gabah.  
   https://media.neliti.com/media/publications/365735-none-50cdf4fb.pdf

9. Pertamina Patra Niaga — Harga BBM terbaru.  
   https://pertaminapatraniaga.com/page/harga-terbaru-bbm
