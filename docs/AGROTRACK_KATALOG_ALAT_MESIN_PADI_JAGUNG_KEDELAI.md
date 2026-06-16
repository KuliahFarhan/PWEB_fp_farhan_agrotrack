# AgroTrack — Katalog Alat & Mesin Pertanian untuk Padi, Jagung, dan Kedelai

**Versi:** 1.0  
**Tanggal penyusunan:** 16 Juni 2026  
**Kategori:** Alat & Mesin  
**Target komoditas:** Padi, Jagung, Kedelai  
**Fungsi dokumen:** Referensi seed database, UI katalog operasional, input biaya, dan card asset AgroTrack.

---

## 1. Catatan Utama: Alat & Mesin Harus Dianggap sebagai Aset/Jasa, Bukan Selalu Biaya Sekali Pakai

Kategori **Alat & Mesin** berbeda dari benih, pupuk, atau pestisida. Benih/pupuk umumnya habis dipakai dalam satu musim, sedangkan alat dan mesin bisa:

1. **Dibeli sebagai aset**
   - Contoh: sprayer, timbangan, pompa, traktor, rice transplanter, combine harvester.
   - Biaya bisa dicatat penuh pada saat beli, atau disusutkan per musim.

2. **Disewa**
   - Contoh: sewa traktor, sewa pompa, sewa combine harvester, sewa power thresher.
   - Biaya dihitung per hari, per jam, per hektar, per petak, atau per hasil.

3. **Dimiliki sendiri**
   - Petani/kelompok tani sudah punya alat.
   - Biaya musim ini biasanya bukan harga beli, melainkan BBM, listrik, oli, servis, operator, sparepart, dan penyusutan.

4. **Dipinjam dari kelompok tani**
   - Biaya bisa berupa iuran, biaya operator, konsumsi, BBM, atau biaya perawatan.

5. **Masuk sebagai jasa mesin + operator**
   - Contoh: jasa tanam rice transplanter, jasa panen combine, jasa perontokan power thresher, jasa pemipilan jagung.
   - Petani membayar layanan, bukan membeli mesin.

Karena itu, AgroTrack sebaiknya tidak membuat satu field `harga_estimasi` saja. Untuk alat & mesin, perlu ada `mode_biaya`.

---

## 2. Masalah Overlap dengan Kategori Lain

Beberapa alat muncul di kategori lain:

| Alat | Kategori asal yang overlap | Masalah jika tidak diatur |
|---|---|---|
| Pompa air | Air & Irigasi | Bisa tercatat dua kali sebagai alat dan irigasi. |
| Traktor roda dua | Persiapan Lahan | Bisa tercatat dua kali sebagai alat dan olah tanah. |
| Rotavator | Persiapan Lahan | Bisa tercatat dua kali sebagai alat dan jasa olah tanah. |
| Sprayer | Perlindungan Tanaman / Tenaga Penyemprotan | Bisa tercampur antara alat semprot dan tenaga penyemprotan. |
| Combine harvester | Panen / Tenaga Panen Padi | Bisa tercampur antara mesin dan jasa panen. |
| Power thresher | Pascapanen / Tenaga Perontokan | Bisa tercampur antara mesin dan jasa operator. |
| Corn sheller | Pascapanen Jagung | Bisa tercampur antara mesin dan jasa pemipilan. |
| Timbangan digital | Panen/Pascapanen / Bahan Pendukung | Bisa dianggap alat atau bahan pendukung. |

### 2.1 Solusi Desain Database

Jangan duplikasi item master. Buat satu **master alat** lalu hubungkan ke beberapa konteks penggunaan.

```text
alat_machines
- id
- nama_alat
- file_asset
- tipe_alat
- harga_min
- harga_max
- status_harga
- sumber_harga
- fungsi
- spesifikasi
- catatan

alat_machine_usage
- id
- alat_id
- kategori_konteks
  contoh: Air & Irigasi, Persiapan Lahan, Perlindungan Tanaman, Panen, Pascapanen
- fase_penggunaan
- relevan_padi
- relevan_jagung
- relevan_kedelai
```

Dengan model ini:
- **Pompa air** hanya satu item master, tetapi bisa muncul di kategori **Alat & Mesin** dan **Air & Irigasi**.
- **Traktor** hanya satu item master, tetapi bisa muncul di **Alat & Mesin** dan **Persiapan Lahan**.
- Biaya tetap masuk satu kali ke transaksi musim tanam.
- UI bisa menampilkan alat yang sama dari beberapa halaman tanpa menggandakan data.

### 2.2 Solusi UX

Di UI, tampilkan label:

```text
Item ini juga digunakan pada:
- Air & Irigasi
- Persiapan Lahan
```

Saat user menambahkan biaya, tampilkan pilihan:

```text
Tambahkan sebagai:
[Biaya alat/mesin] [Biaya irigasi] [Biaya persiapan lahan] [Jasa operator]
```

Ini mencegah item terlihat dobel dan membantu user memahami konteks biaya.

---

## 3. Landasan Konsep dan Sumber Umum

Alat dan mesin pertanian atau **alsintan** banyak digunakan untuk meningkatkan efisiensi kerja pertanian, terutama pada pengolahan tanah, tanam, irigasi, perlindungan tanaman, panen, dan pascapanen. Beberapa jenis alsintan yang umum disebut dalam konteks pertanian Indonesia mencakup traktor, pompa air, rice transplanter, combine harvester, dryer, power thresher, corn sheller, dan rice milling unit.

Sumber:
- Repository Universitas Muhammadiyah Jember, pembahasan alsintan:  
  https://repository.unmuhjember.ac.id/9715/3/c.%20BAB%20I.pdf
- Kementerian Pertanian menyebut modernisasi pertanian melalui alsintan seperti rice transplanter untuk proses tanam yang lebih cepat, rapi, dan efisien.  
  https://agricom.id/news/3365/kementan-dorong-modernisasi-pertanian-lewat-penggunaan-rice-transplanter
- Kementerian Pertanian juga mencatat bahwa alsintan dapat menekan biaya olah tanah dalam konteks penggunaan mesin pertanian.  
  https://www.pertanian.go.id/?act=view&id=3320&show=news

---

## 4. Asset yang Sudah Disiapkan

| No | Nama File Asset | Nama Item UI | Status |
|---:|---|---|---|
| 1 | `alat-sprayer-manual.jpg` | Sprayer Manual / Knapsack Sprayer | Siap pakai |
| 2 | `alat-sprayer-elektrik.jpg` | Sprayer Elektrik | Siap pakai |
| 3 | `alat-pompa-air.jpg` | Pompa Air Pertanian / Alkon | Siap pakai |
| 4 | `alat-traktor-roda-dua.jpg` | Traktor Roda Dua / Hand Tractor | Siap pakai |
| 5 | `alat-rotavator.jpg` | Rotavator / Bajak Rotary | Siap pakai |
| 6 | `alat-rice-transplanter.jpg` | Rice Transplanter | Siap pakai |
| 7 | `alat-combine-harvester.jpg` | Combine Harvester Padi | Siap pakai |
| 8 | `alat-power-thresher.jpg` | Power Thresher / Mesin Perontok | Siap pakai |
| 9 | `alat-corn-sheller.jpg` | Corn Sheller / Mesin Pemipil Jagung | Siap pakai |
| 10 | `alat-timbangan-digital.jpg` | Timbangan Digital Pertanian | Siap pakai |

Rekomendasi folder:

```text
assets/img/saprodi/alat-mesin/
```

---

## 5. Model Biaya yang Disarankan

### 5.1 Mode Biaya

```text
beli_baru
beli_baru_disusutkan
sewa_harian
sewa_per_jam
jasa_per_ha
jasa_per_petak
jasa_per_hasil
milik_sendiri
pinjam_kelompok
biaya_operator
biaya_bbm_listrik
biaya_servis_sparepart
input_manual
```

### 5.2 Rumus Biaya

| Mode | Rumus | Cocok untuk |
|---|---|---|
| Beli baru penuh | `biaya_total = harga_beli` | Sprayer, timbangan, alat kecil |
| Beli baru disusutkan | `biaya_musim = harga_beli / umur_pakai_musim` | Pompa, traktor, combine, transplanter |
| Sewa harian | `tarif_harian × jumlah_hari` | Pompa, sprayer, mesin pascapanen |
| Jasa per hektar | `tarif_per_ha × luas_ha` | Traktor, transplanter, combine |
| Jasa per hasil | `jumlah_satuan × tarif_per_satuan` | Corn sheller, thresher, angkut/pascapanen |
| Milik sendiri | `BBM/listrik + operator + servis + penyusutan` | Semua mesin besar |
| Pinjam kelompok | `iuran + operator + BBM + perawatan` | Alsintan kelompok tani |
| Input manual | `nominal sesuai user` | Kasus lokal yang tidak standar |

### 5.3 Field Input Realistis

Untuk alat/mesin, form biaya sebaiknya punya:

```text
mode_biaya
harga_beli
umur_pakai_musim
tarif_sewa_harian
jumlah_hari_pakai
tarif_per_ha
luas_ha
tarif_per_hasil
jumlah_hasil
biaya_operator
biaya_bbm_listrik
biaya_servis
biaya_sparepart
biaya_total
catatan
```

---

## 6. Ringkasan Katalog Alat & Mesin

| No | Item | File Asset | Fungsi | Komoditas | Fase | Harga Referensi Internet | Status Harga |
|---:|---|---|---|---|---|---:|---|
| 1 | Sprayer Manual / Knapsack Sprayer | `alat-sprayer-manual.jpg` | Penyemprotan manual | Padi, Jagung, Kedelai | Perawatan | ±Rp165.000–Rp666.000 | TERVERIFIKASI_MARKETPLACE |
| 2 | Sprayer Elektrik | `alat-sprayer-elektrik.jpg` | Penyemprotan baterai/elektrik | Padi, Jagung, Kedelai | Perawatan | ±Rp228.888–Rp1.213.000 | TERVERIFIKASI_MARKETPLACE |
| 3 | Pompa Air Pertanian / Alkon | `alat-pompa-air.jpg` | Irigasi/pengairan | Padi, Jagung, Kedelai | Air & irigasi | ±Rp1.275.000–Rp7.347.750; produk tertentu lebih rendah/lebih tinggi | TERVERIFIKASI_MARKETPLACE |
| 4 | Traktor Roda Dua / Hand Tractor | `alat-traktor-roda-dua.jpg` | Olah tanah | Padi, Jagung, Kedelai | Pra-tanam | ±Rp15.072.000–Rp60.528.000; jasa olah tanah ±Rp900.000–Rp2.000.000/ha dalam beberapa sumber | TERVERIFIKASI_CAMPURAN |
| 5 | Rotavator / Bajak Rotary | `alat-rotavator.jpg` | Menggemburkan/meratakan tanah | Padi, Jagung, Kedelai | Pra-tanam | Mini tiller/rotary marketplace mulai ±Rp1.215.000; Quick rotary ±Rp45.672.000–Rp47.928.000 | TERVERIFIKASI_MARKETPLACE |
| 6 | Rice Transplanter | `alat-rice-transplanter.jpg` | Tanam padi mekanis | Padi | Tanam | Temco 2RT-4K ±Rp61.373.000–Rp69.064.200 | TERVERIFIKASI_MARKETPLACE |
| 7 | Combine Harvester Padi | `alat-combine-harvester.jpg` | Panen padi mekanis | Padi | Panen | Mini combine ±Rp149.047.200; Temco ±Rp527.385.000–Rp543.790.800; Kubota umum ±Rp200.000.000–Rp600.000.000 | TERVERIFIKASI_CAMPURAN |
| 8 | Power Thresher / Mesin Perontok | `alat-power-thresher.jpg` | Merontokkan padi/kedelai | Padi, Kedelai | Panen/Pascapanen | ±Rp4.619.000–Rp16.095.000; Maksindo AGR-PRP40 Rp8.535.000 | TERVERIFIKASI_MARKETPLACE |
| 9 | Corn Sheller / Mesin Pemipil Jagung | `alat-corn-sheller.jpg` | Memipil jagung | Jagung | Pascapanen | Mini ±Rp2.094.560–Rp3.816.000; mesin besar ±Rp19.800.000–Rp23.000.000 | TERVERIFIKASI_MARKETPLACE |
| 10 | Timbangan Digital Pertanian | `alat-timbangan-digital.jpg` | Menimbang input/hasil | Padi, Jagung, Kedelai | Panen/Pascapanen | ±Rp489.500–Rp3.020.000 untuk 150–300 kg; produk heavy duty bisa lebih mahal | TERVERIFIKASI_MARKETPLACE |

---

## 7. Detail Item Katalog

### 7.1 Sprayer Manual / Knapsack Sprayer

| Field | Isi |
|---|---|
| Nama UI | Sprayer Manual / Knapsack Sprayer |
| Nama file | `alat-sprayer-manual.jpg` |
| Kategori | Alat & Mesin |
| Subkategori | Alat semprot |
| Fase penggunaan | Vegetatif, generatif, perlindungan tanaman, pemupukan cair |
| Relevan untuk | Padi, Jagung, Kedelai |
| Overlap dengan | Perlindungan Tanaman, Tenaga Penyemprotan |
| Mode biaya | `beli_baru`, `milik_sendiri`, `pinjam_kelompok`, `biaya_servis_sparepart` |
| Harga referensi | Lazada 16 L ±Rp165.000–Rp175.229; Shopee 16 L Rp190.000; Chainsaw Surabaya/Tasco 16 L Rp600.000–Rp666.000 |
| Status harga | TERVERIFIKASI_MARKETPLACE |
| Fungsi | Menyemprot pestisida, pupuk cair, POC, atau agens hayati secara manual |
| Keunggulan | Murah, ringan, mudah dirawat, tidak butuh baterai |
| Keterbatasan | Membutuhkan tenaga pompa manual; kurang efisien untuk lahan luas |
| Catatan K3 | Untuk pestisida, wajib APD dan mengikuti label produk |

Deskripsi card:

> Sprayer manual digunakan untuk menyemprot pestisida, pupuk cair, atau agens hayati. Biaya alat harus dipisahkan dari biaya bahan semprot dan tenaga penyemprotan.

Sumber:
- Lazada sprayer 16 liter: https://www.lazada.co.id/tag/pompa-semprot-pertanian-16-liter/
- Shopee sprayer manual 16 L: https://shopee.co.id/Sprayer-16-Liter-manual-Semprotan-hama-manual-sprayer-manual-pompa-16-liter-i.175066929.7271577072
- Chainsaw Surabaya Tasco TB16 SNI: https://www.chainsawsurabaya.com/product/alat-semprot-pertanian-p602921.aspx

---

### 7.2 Sprayer Elektrik

| Field | Isi |
|---|---|
| Nama UI | Sprayer Elektrik |
| Nama file | `alat-sprayer-elektrik.jpg` |
| Kategori | Alat & Mesin |
| Subkategori | Alat semprot elektrik |
| Fase penggunaan | Vegetatif, generatif, perlindungan tanaman, pemupukan cair |
| Relevan untuk | Padi, Jagung, Kedelai |
| Overlap dengan | Perlindungan Tanaman, Tenaga Penyemprotan |
| Mode biaya | `beli_baru`, `milik_sendiri`, `pinjam_kelompok`, `biaya_servis_sparepart` |
| Harga referensi | Shopee ESTE779 16 L Rp410.000; Lazada 16 L ±Rp395.000–Rp462.903; Blibli 16 L ±Rp228.888–Rp1.213.000 |
| Status harga | TERVERIFIKASI_MARKETPLACE |
| Fungsi | Penyemprotan dengan bantuan baterai/pompa elektrik |
| Keunggulan | Lebih ringan operasionalnya dibanding manual, tekanan semprot lebih stabil |
| Keterbatasan | Perlu baterai/charger, risiko kerusakan pompa/baterai |
| Catatan K3 | Tetap wajib APD saat semprot pestisida |

Deskripsi card:

> Sprayer elektrik membantu penyemprotan lebih stabil dan mengurangi beban pompa manual. Di AgroTrack, item ini tetap harus dipisahkan dari biaya bahan semprot dan tenaga operator.

Sumber:
- Shopee sprayer elektrik 16 L: https://shopee.co.id/SPRAYER-ELEKTRIK-ESTE779-16-LITER-SNI-Alat-Semprot-Tanaman-Pertanian-i.1012443142.20993470752
- Lazada sprayer elektrik 16 L: https://www.lazada.co.id/tag/sprayer-elektrik-16-liter-sni/
- Blibli sprayer elektrik 16 L: https://www.blibli.com/jual/sprayer-elektrik-16-liter
- Blibli sprayer elektrik tangki 16: https://www.blibli.com/jual/sprayer-elektrik-tangki-16

---

### 7.3 Pompa Air Pertanian / Alkon

| Field | Isi |
|---|---|
| Nama UI | Pompa Air Pertanian / Alkon |
| Nama file | `alat-pompa-air.jpg` |
| Kategori | Alat & Mesin |
| Subkategori | Mesin irigasi |
| Fase penggunaan | Pra-tanam, vegetatif, generatif, musim kering |
| Relevan untuk | Padi, Jagung, Kedelai |
| Overlap dengan | Air & Irigasi |
| Mode biaya | `beli_baru`, `beli_baru_disusutkan`, `sewa_harian`, `milik_sendiri`, `pinjam_kelompok`, `biaya_bbm_listrik`, `biaya_operator` |
| Harga referensi | Shopee pompa alkon 2 inch contoh Rp1.275.000; Blibli/Lazada/PaDi UMKM untuk pompa 2 inch memiliki rentang lebih luas, tergantung merek dan mesin |
| Status harga | TERVERIFIKASI_MARKETPLACE |
| Fungsi | Mengalirkan air dari sumber air ke lahan |
| Keunggulan | Penting untuk musim kering dan lahan tanpa pasokan irigasi cukup |
| Keterbatasan | Perlu BBM/listrik, operator, selang/pipa, servis |
| Catatan overlap | Di halaman Air & Irigasi, item ini muncul sebagai komponen pengairan. Di halaman Alat & Mesin, item ini muncul sebagai aset/mesin. Transaksi biaya tetap harus satu kali. |

Deskripsi card:

> Pompa air digunakan untuk mengalirkan air ke lahan. Karena sering muncul pada kategori irigasi, AgroTrack harus mencegah pencatatan ganda antara biaya alat, BBM, dan jasa pengairan.

Sumber:
- Shopee pompa alkon 2 inch: https://shopee.co.id/search?keyword=pompa+alkon+2+inch
- Lazada pompa alkon 2 inch: https://www.lazada.co.id/tag/pompa-alkon-2-inch/
- Lazada pompa Honda 2 inch: https://www.lazada.co.id/tag/mesin-alkon-pompa-air-2inch-honda/
- PaDi UMKM Honda GX 160 2 inch: https://padiumkm.id/product/mesin-pompa-air-sawah-irigasi-alkon-water-pump-honda-gx-160-2-inch-2/65fac2f6aeba559677c858b7

---

### 7.4 Traktor Roda Dua / Hand Tractor

| Field | Isi |
|---|---|
| Nama UI | Traktor Roda Dua / Hand Tractor |
| Nama file | `alat-traktor-roda-dua.jpg` |
| Kategori | Alat & Mesin |
| Subkategori | Mesin olah tanah |
| Fase penggunaan | Pra-tanam |
| Relevan untuk | Padi, Jagung, Kedelai |
| Overlap dengan | Persiapan Lahan |
| Mode biaya | `beli_baru`, `beli_baru_disusutkan`, `jasa_per_ha`, `sewa_harian`, `milik_sendiri`, `pinjam_kelompok`, `biaya_operator`, `biaya_bbm_listrik` |
| Harga referensi | Quick traktor roda dua ±Rp15.072.000–Rp60.528.000; Blibli Quick ±Rp18.950.000–Rp42.228.000; Indotrading ±Rp30.200.000–Rp36.000.000 |
| Status harga | TERVERIFIKASI_MARKETPLACE |
| Fungsi | Mengolah tanah sebelum tanam |
| Keunggulan | Mempercepat pengolahan lahan dibanding manual |
| Keterbatasan | Mahal jika beli; sering lebih realistis dicatat sebagai jasa olah tanah per hektar |
| Catatan overlap | Jika user sudah mencatat “Jasa olah tanah” di Persiapan Lahan, jangan catat biaya traktor lagi kecuali memang beli/sewa alat terpisah. |

Deskripsi card:

> Traktor roda dua adalah mesin olah tanah yang umum dipakai pada fase pra-tanam. Dalam aplikasi, default biaya petani sebaiknya berupa jasa per hektar, bukan otomatis harga beli alat.

Sumber:
- Quick traktor roda dua: https://tokoquick.id/category/unit/unit-traktor-roda-2-quick
- Blibli traktor sawah Quick: https://www.blibli.com/jual/traktor-sawah-quik
- Blibli mesin hand tractor: https://www.blibli.com/jual/mesin-hand-tractor
- Indotrading traktor sawah: https://www.indotrading.com/jual-traktor-sawah
- Antara Foto jasa bajak sawah: https://www.antarafoto.com/id/view/1132310/kenaikan-tarif-jasa-bajak-sawah

---

### 7.5 Rotavator / Bajak Rotary

| Field | Isi |
|---|---|
| Nama UI | Rotavator / Bajak Rotary |
| Nama file | `alat-rotavator.jpg` |
| Kategori | Alat & Mesin |
| Subkategori | Mesin/attachment olah tanah |
| Fase penggunaan | Pra-tanam |
| Relevan untuk | Padi, Jagung, Kedelai |
| Overlap dengan | Persiapan Lahan |
| Mode biaya | `beli_baru`, `beli_baru_disusutkan`, `jasa_per_ha`, `sewa_harian`, `milik_sendiri`, `biaya_operator`, `biaya_bbm_listrik` |
| Harga referensi | Quick rotary ±Rp45.672.000–Rp47.928.000; Lazada alat rotary/mini tiller mulai sekitar Rp1.215.000; Shopee mesin traktor/cultivator bervariasi |
| Status harga | TERVERIFIKASI_MARKETPLACE |
| Fungsi | Menggemburkan dan meratakan tanah |
| Keunggulan | Membuat tanah lebih halus dan siap tanam |
| Keterbatasan | Tidak selalu perlu jika jasa olah tanah sudah mencakup rotary |
| Catatan overlap | Jika paket jasa traktor sudah termasuk rotary, jangan input biaya rotavator terpisah. |

Deskripsi card:

> Rotavator digunakan untuk menggemburkan dan meratakan tanah. Di AgroTrack, item ini perlu dibedakan antara alat milik sendiri, sewa, atau bagian dari jasa olah tanah.

Sumber:
- Quick traktor/rotary: https://tokoquick.id/category/unit/unit-traktor-roda-2-quick
- Lazada traktor rotary: https://www.lazada.co.id/tag/traktor-rotary/
- Shopee mesin traktor sawah: https://shopee.co.id/list/Mesin%20Traktor/Sawah
- Kementan tentang alsintan menekan biaya olah tanah: https://www.pertanian.go.id/?act=view&id=3320&show=news

---

### 7.6 Rice Transplanter

| Field | Isi |
|---|---|
| Nama UI | Rice Transplanter |
| Nama file | `alat-rice-transplanter.jpg` |
| Kategori | Alat & Mesin |
| Subkategori | Mesin tanam padi |
| Fase penggunaan | Tanam |
| Relevan untuk | Padi |
| Overlap dengan | Tenaga Tanam Padi |
| Mode biaya | `beli_baru`, `beli_baru_disusutkan`, `jasa_per_ha`, `sewa_harian`, `milik_sendiri`, `pinjam_kelompok`, `biaya_operator`, `biaya_bbm_listrik` |
| Harga referensi | Indotara Temco 2RT-4K Rp61.373.000; Blibli Temco 2RT-4K sekitar Rp68.414.600–Rp69.064.200 |
| Status harga | TERVERIFIKASI_MARKETPLACE |
| Fungsi | Menanam bibit padi secara mekanis |
| Keunggulan | Lebih cepat, rapi, dan efisien dibanding tanam manual pada kondisi lahan yang mendukung |
| Keterbatasan | Butuh bibit/persemaian khusus, operator, kondisi sawah sesuai, dan biaya alat cukup tinggi |
| Catatan overlap | Jika user memilih rice transplanter, biaya tenaga tanam manual bisa dikurangi atau tidak dipakai. |

Deskripsi card:

> Rice transplanter adalah mesin tanam padi yang membantu proses tanam lebih cepat dan seragam. Dalam AgroTrack, item ini sebaiknya menjadi alternatif dari tenaga tanam padi manual, bukan tambahan otomatis.

Sumber:
- Indotara Temco 2RT-4K: https://www.indotarapersada.com/product/mesin-penanam-padi-rice-transplanter-temco-2rt-4k-p1400109.aspx
- Blibli rice transplanter: https://www.blibli.com/jual/rice-transplanter
- Artikel modernisasi rice transplanter: https://agricom.id/news/3365/kementan-dorong-modernisasi-pertanian-lewat-penggunaan-rice-transplanter

---

### 7.7 Combine Harvester Padi

| Field | Isi |
|---|---|
| Nama UI | Combine Harvester Padi |
| Nama file | `alat-combine-harvester.jpg` |
| Kategori | Alat & Mesin |
| Subkategori | Mesin panen |
| Fase penggunaan | Panen |
| Relevan untuk | Padi |
| Overlap dengan | Tenaga Panen Padi, Panen, Pascapanen |
| Mode biaya | `beli_baru`, `beli_baru_disusutkan`, `jasa_per_ha`, `jasa_per_petak`, `milik_sendiri`, `pinjam_kelompok`, `biaya_operator`, `biaya_bbm_listrik` |
| Harga referensi | Blibli mini rice harvester Temco 4RM-1.1 Rp149.047.200; combine Temco 4CH-4.0 Rp527.385.000; Temco 4CH-6.0 Rp543.790.800; Kubota umum diperkirakan Rp200 juta–Rp600 juta dalam sumber pasar |
| Status harga | TERVERIFIKASI_CAMPURAN |
| Fungsi | Memanen padi secara mekanis, biasanya mencakup potong, rontok, dan pembersihan awal |
| Keunggulan | Menghemat waktu panen dan mengurangi ketergantungan buruh panen manual |
| Keterbatasan | Harga beli tinggi, butuh operator, kondisi lahan harus mendukung, biaya perawatan tinggi |
| Catatan overlap | Jika panen pakai combine, biaya tenaga panen manual/power thresher mungkin tidak perlu dimasukkan terpisah. |

Deskripsi card:

> Combine harvester digunakan untuk panen padi secara mekanis. Untuk petani kecil, lebih realistis mencatatnya sebagai jasa panen per hektar atau per petak, bukan harga beli alat.

Sumber:
- Blibli rice combine harvester: https://www.blibli.com/jual/rice-combine-harvester
- Kubota combine harvester spesifikasi: https://ptkubota.co.id/products/mesin-pemanen-padi-combine-harvester/
- Kisaran harga Kubota: https://iharvester.com/harga-mesin-panen-padi-berapa-kubota/
- Yanmar AW70V: https://www.andaromesin.com/product/mesin-panen-padi-yanmar-aw70v-combine-harvester-70-hp/

---

### 7.8 Power Thresher / Mesin Perontok

| Field | Isi |
|---|---|
| Nama UI | Power Thresher / Mesin Perontok |
| Nama file | `alat-power-thresher.jpg` |
| Kategori | Alat & Mesin |
| Subkategori | Mesin pascapanen/perontok |
| Fase penggunaan | Panen/Pascapanen |
| Relevan untuk | Padi, Kedelai |
| Overlap dengan | Tenaga Panen, Pascapanen, Jemur/Pengeringan |
| Mode biaya | `beli_baru`, `beli_baru_disusutkan`, `sewa_harian`, `jasa_per_hasil`, `milik_sendiri`, `biaya_operator`, `biaya_bbm_listrik` |
| Harga referensi | Shopee ±Rp4.619.000–Rp11.919.000; Indotrading Rp14.500.000; Changdong Rp16.095.000; Maksindo AGR-PRP40 Rp8.535.000 |
| Status harga | TERVERIFIKASI_MARKETPLACE |
| Fungsi | Merontokkan gabah/padi atau biji dari tanaman setelah panen |
| Keunggulan | Mengurangi waktu perontokan manual |
| Keterbatasan | Butuh operator, bahan bakar/listrik, dan biaya perawatan |
| Catatan overlap | Jika panen menggunakan combine, power thresher biasanya tidak perlu dicatat lagi. |

Deskripsi card:

> Power thresher membantu merontokkan hasil panen, terutama padi. Biaya bisa berupa beli alat, sewa, atau jasa per hasil.

Sumber:
- Shopee power thresher: https://shopee.co.id/search?keyword=power+thresher
- Indotrading power thresher: https://www.indotrading.com/showcase/power-thresher
- Maksindo power thresher AGR-PRP40: https://www.maksindo.com/mesin-perontok-padi-power-thresher.htm
- Changdong power thresher: https://www.changdongindonesia.com/product/mesin-perontok-padi-power-thresher-p1611373.aspx

---

### 7.9 Corn Sheller / Mesin Pemipil Jagung

| Field | Isi |
|---|---|
| Nama UI | Corn Sheller / Mesin Pemipil Jagung |
| Nama file | `alat-corn-sheller.jpg` |
| Kategori | Alat & Mesin |
| Subkategori | Mesin pascapanen jagung |
| Fase penggunaan | Pascapanen |
| Relevan untuk | Jagung |
| Overlap dengan | Pascapanen, Tenaga Pemipilan Jagung |
| Mode biaya | `beli_baru`, `beli_baru_disusutkan`, `sewa_harian`, `jasa_per_hasil`, `milik_sendiri`, `biaya_operator`, `biaya_bbm_listrik` |
| Harga referensi | Blibli mini corn sheller Rp2.094.560–Rp3.816.000; Changdong Rp19.850.000; Kencana Jaya Teknik Rp23.000.000; Indotrading Rp19.800.000 |
| Status harga | TERVERIFIKASI_MARKETPLACE |
| Fungsi | Memipil biji jagung dari tongkol |
| Keunggulan | Mempercepat pascapanen jagung |
| Keterbatasan | Butuh kondisi jagung sesuai, operator, dan biaya mesin |
| Catatan overlap | Jika pemipilan dibayar sebagai jasa per karung/kg, jangan catat harga mesin sebagai biaya musim kecuali mesin memang dibeli/disusutkan. |

Deskripsi card:

> Corn sheller digunakan untuk memipil jagung setelah panen. Dalam AgroTrack, item ini paling realistis dicatat sebagai jasa pemipilan atau biaya mesin milik sendiri.

Sumber:
- Kubota corn sheller spesifikasi: https://ptkubota.co.id/products/mesin-pemipil-jagung-corn-sheller/
- Blibli corn sheller: https://www.blibli.com/jual/corn-sheller
- Changdong corn sheller Honda: https://www.changdongindonesia.com/product/mesin-corn-sheller-honda-pemipil-jagung-p689867.aspx
- Kencana Jaya Teknik mesin pemipil jagung: https://www.kencanajayateknik.com/product/mesin-pemipil-jagung-p42996.aspx
- Indotrading corn sheller: https://www.indotrading.com/showcase/corn-sheller

---

### 7.10 Timbangan Digital Pertanian

| Field | Isi |
|---|---|
| Nama UI | Timbangan Digital Pertanian |
| Nama file | `alat-timbangan-digital.jpg` |
| Kategori | Alat & Mesin |
| Subkategori | Alat ukur hasil/input |
| Fase penggunaan | Panen, pascapanen, penjualan, pembelian input |
| Relevan untuk | Padi, Jagung, Kedelai |
| Overlap dengan | Bahan Pendukung, Panen, Pascapanen, Laporan |
| Mode biaya | `beli_baru`, `milik_sendiri`, `pinjam_kelompok`, `biaya_servis_sparepart` |
| Harga referensi | Shopee 150 kg Rp489.500–Rp505.500; Lazada 150 kg contoh Rp816.900–Rp881.000; Monotaro 150/300 kg Rp519.900–Rp1.699.900+; RupaRupa Krisbow 150 kg Rp2.129.000 dan 300 kg Rp3.020.000 |
| Status harga | TERVERIFIKASI_MARKETPLACE |
| Fungsi | Menimbang hasil panen, karung, input, atau penjualan |
| Keunggulan | Membuat data hasil panen dan pendapatan lebih akurat |
| Keterbatasan | Perlu kapasitas sesuai hasil; akurasi/tera penting jika untuk transaksi dagang |
| Catatan overlap | Timbangan adalah alat ukur, bukan biaya panen langsung kecuali dibeli/disewa. Jangan tercampur dengan biaya tenaga angkut. |

Deskripsi card:

> Timbangan digital digunakan untuk menimbang hasil panen dan input pertanian. Item ini membantu validasi data hasil panen, laporan, dan perhitungan pendapatan.

Sumber:
- Shopee timbangan digital 150 kg: https://shopee.co.id/Timbangan-Digital-150Kg-Timbangan-Duduk-Digital-150kg-i.475333485.29750068636
- Lazada timbangan digital 150 kg padi: https://www.lazada.co.id/tag/timbangan-digital-150kg-padi/
- Monotaro timbangan digital 150 kg: https://www.monotaro.id/k/store/timbangan%20digital%20150%20kg
- Monotaro timbangan digital 300 kg: https://www.monotaro.id/k/store/timbangan%20digital%20300kg
- RupaRupa Krisbow 150 kg: https://www.ruparupa.com/p/krisbow-timbangan-barang-digital-dengan-tera-150-kg.html
- RupaRupa Krisbow 300 kg: https://www.ruparupa.com/p/krisbow-timbangan-barang-digital-300-kg.html

---

## 8. Pemetaan Overlap Agar Tidak Double Counting

### 8.1 Pemetaan Kategori

| Alat | Tampil di Alat & Mesin | Tampil di kategori lain | Aturan anti double counting |
|---|---|---|---|
| Sprayer manual | Ya | Perlindungan Tanaman, Tenaga Penyemprotan | Biaya alat hanya dicatat jika beli/sewa/servis. Biaya tenaga semprot dan pestisida dicatat terpisah. |
| Sprayer elektrik | Ya | Perlindungan Tanaman, Tenaga Penyemprotan | Sama seperti sprayer manual. |
| Pompa air | Ya | Air & Irigasi | Jika dicatat sebagai aset, jangan catat lagi sebagai item irigasi. Irigasi cukup BBM/operator/iuran. |
| Traktor roda dua | Ya | Persiapan Lahan | Jika jasa olah tanah sudah mencakup traktor, jangan catat beli/sewa traktor lagi. |
| Rotavator | Ya | Persiapan Lahan | Jika jasa rotary sudah masuk paket traktor, jangan input dobel. |
| Rice transplanter | Ya | Tenaga Tanam Padi | Jika pakai transplanter, kurangi/hilangkan tenaga tanam manual kecuali ada tenaga pendukung. |
| Combine harvester | Ya | Panen Padi | Jika pakai combine, panen manual dan power thresher biasanya tidak perlu dicatat penuh. |
| Power thresher | Ya | Pascapanen Padi/Kedelai | Jika sudah pakai combine, power thresher tidak perlu. |
| Corn sheller | Ya | Pascapanen Jagung | Jika bayar jasa pemipilan, jangan catat harga mesin. |
| Timbangan digital | Ya | Panen/Pascapanen/Laporan | Biaya alat hanya jika beli/sewa; penggunaan timbangan tidak otomatis biaya panen. |

### 8.2 Rule yang Dapat Diterapkan di UI

Jika user menambahkan alat yang overlap, tampilkan warning:

```text
Item ini juga muncul pada kategori lain. Pilih konteks biaya agar tidak tercatat dua kali:
- Sebagai aset alat/mesin
- Sebagai jasa operasional
- Sebagai biaya bahan bakar/operator
- Sebagai aktivitas tanpa biaya
```

Contoh warning untuk combine:

```text
Anda memilih Combine Harvester. Jika biaya jasa combine sudah mencakup panen dan perontokan, jangan tambahkan Tenaga Panen Padi dan Power Thresher secara penuh kecuali ada biaya tambahan.
```

---

## 9. Rekomendasi Database

### 9.1 Master Alat

```sql
CREATE TABLE IF NOT EXISTS alat_mesin (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nama_alat VARCHAR(150) NOT NULL,
  nama_file_asset VARCHAR(255) NULL,
  kategori VARCHAR(100) NOT NULL DEFAULT 'Alat & Mesin',
  subkategori VARCHAR(100) NULL,
  tipe_alat ENUM('manual','elektrik','mesin_bbm','mesin_diesel','mesin_pascapanen','alat_ukur','lainnya') DEFAULT 'lainnya',
  fase_penggunaan VARCHAR(100) NULL,
  relevan_padi TINYINT(1) DEFAULT 0,
  relevan_jagung TINYINT(1) DEFAULT 0,
  relevan_kedelai TINYINT(1) DEFAULT 0,
  harga_min DECIMAL(14,2) NULL,
  harga_max DECIMAL(14,2) NULL,
  satuan_harga VARCHAR(50) NULL,
  harga_status VARCHAR(50) NOT NULL DEFAULT 'PERLU_VERIFIKASI',
  sumber_harga TEXT NULL,
  tanggal_cek_harga DATE NULL,
  fungsi TEXT NULL,
  keunggulan TEXT NULL,
  keterbatasan TEXT NULL,
  catatan_overlap TEXT NULL,
  status ENUM('aktif','nonaktif') DEFAULT 'aktif',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

### 9.2 Konteks Penggunaan Alat

```sql
CREATE TABLE IF NOT EXISTS alat_mesin_usage (
  id INT AUTO_INCREMENT PRIMARY KEY,
  alat_mesin_id INT NOT NULL,
  kategori_konteks VARCHAR(100) NOT NULL,
  fase_penggunaan VARCHAR(100) NULL,
  relevan_padi TINYINT(1) DEFAULT 0,
  relevan_jagung TINYINT(1) DEFAULT 0,
  relevan_kedelai TINYINT(1) DEFAULT 0,
  catatan TEXT NULL,
  FOREIGN KEY (alat_mesin_id) REFERENCES alat_mesin(id)
);
```

### 9.3 Transaksi Biaya Alat

```sql
CREATE TABLE IF NOT EXISTS biaya_alat_mesin (
  id INT AUTO_INCREMENT PRIMARY KEY,
  musim_tanam_id INT NOT NULL,
  alat_mesin_id INT NOT NULL,
  konteks_biaya VARCHAR(100) NULL,
  mode_biaya ENUM(
    'beli_baru',
    'beli_baru_disusutkan',
    'sewa_harian',
    'sewa_per_jam',
    'jasa_per_ha',
    'jasa_per_petak',
    'jasa_per_hasil',
    'milik_sendiri',
    'pinjam_kelompok',
    'biaya_operator',
    'biaya_bbm_listrik',
    'biaya_servis_sparepart',
    'input_manual'
  ) NOT NULL,
  harga_beli DECIMAL(14,2) NULL,
  umur_pakai_musim INT NULL,
  biaya_penyusutan_musim DECIMAL(14,2) NULL,
  tarif_harian DECIMAL(14,2) NULL,
  jumlah_hari DECIMAL(10,2) NULL,
  tarif_per_jam DECIMAL(14,2) NULL,
  jumlah_jam DECIMAL(10,2) NULL,
  tarif_per_ha DECIMAL(14,2) NULL,
  luas_ha DECIMAL(10,4) NULL,
  tarif_per_petak DECIMAL(14,2) NULL,
  jumlah_petak DECIMAL(10,2) NULL,
  tarif_per_hasil DECIMAL(14,2) NULL,
  jumlah_hasil DECIMAL(14,2) NULL,
  satuan_hasil VARCHAR(50) NULL,
  biaya_operator DECIMAL(14,2) NULL,
  biaya_bbm_listrik DECIMAL(14,2) NULL,
  biaya_servis_sparepart DECIMAL(14,2) NULL,
  biaya_total DECIMAL(14,2) NOT NULL DEFAULT 0,
  tanggal_biaya DATE NULL,
  catatan TEXT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (alat_mesin_id) REFERENCES alat_mesin(id)
);
```

---

## 10. Contoh SQL Seed Master Alat

```sql
INSERT INTO alat_mesin
(nama_alat, nama_file_asset, subkategori, tipe_alat, fase_penggunaan, relevan_padi, relevan_jagung, relevan_kedelai, harga_min, harga_max, satuan_harga, harga_status, sumber_harga, tanggal_cek_harga, fungsi, keunggulan, keterbatasan, catatan_overlap)
VALUES
('Sprayer Manual / Knapsack Sprayer','alat-sprayer-manual.jpg','Alat Semprot','manual','Vegetatif / Generatif',1,1,1,165000,666000,'unit','TERVERIFIKASI_MARKETPLACE','Lazada, Shopee, Chainsaw Surabaya','2026-06-16','Menyemprot pestisida, pupuk cair, POC, atau agens hayati.','Murah dan mudah dirawat.','Butuh tenaga manual dan kurang efisien untuk lahan luas.','Overlap dengan Perlindungan Tanaman dan Tenaga Penyemprotan.'),

('Sprayer Elektrik','alat-sprayer-elektrik.jpg','Alat Semprot','elektrik','Vegetatif / Generatif',1,1,1,228888,1213000,'unit','TERVERIFIKASI_MARKETPLACE','Shopee, Lazada, Blibli','2026-06-16','Menyemprot dengan bantuan baterai/pompa elektrik.','Tekanan lebih stabil dan lebih ringan dipakai.','Butuh baterai, charger, dan perawatan pompa.','Overlap dengan Perlindungan Tanaman dan Tenaga Penyemprotan.'),

('Pompa Air Pertanian / Alkon','alat-pompa-air.jpg','Irigasi','mesin_bbm','Pra-tanam / Vegetatif / Generatif',1,1,1,1275000,7347750,'unit','TERVERIFIKASI_MARKETPLACE','Shopee, Lazada, PaDi UMKM, Blibli','2026-06-16','Mengalirkan air dari sumber ke lahan.','Penting saat kemarau atau irigasi tidak cukup.','Perlu BBM/listrik, operator, selang/pipa, dan servis.','Overlap dengan Air & Irigasi.'),

('Traktor Roda Dua / Hand Tractor','alat-traktor-roda-dua.jpg','Olah Tanah','mesin_diesel','Pra-tanam',1,1,1,15072000,60528000,'unit','TERVERIFIKASI_MARKETPLACE','Quick, Blibli, Indotrading, Inaproc, Antara Foto','2026-06-16','Mengolah tanah sebelum tanam.','Mempercepat olah tanah dibanding manual.','Harga beli tinggi; sering lebih realistis sebagai jasa per ha.','Overlap dengan Persiapan Lahan.'),

('Rotavator / Bajak Rotary','alat-rotavator.jpg','Olah Tanah','mesin_diesel','Pra-tanam',1,1,1,1215000,47928000,'unit','TERVERIFIKASI_MARKETPLACE','Quick, Lazada, Shopee','2026-06-16','Menggemburkan dan meratakan tanah.','Membuat tanah lebih halus dan siap tanam.','Sering sudah termasuk paket jasa olah tanah.','Overlap dengan Persiapan Lahan.'),

('Rice Transplanter','alat-rice-transplanter.jpg','Mesin Tanam','mesin_bbm','Tanam',1,0,0,61373000,69064200,'unit','TERVERIFIKASI_MARKETPLACE','Indotara Persada, Blibli','2026-06-16','Menanam bibit padi secara mekanis.','Lebih cepat, rapi, dan efisien.','Butuh bibit/persemaian sesuai dan kondisi sawah mendukung.','Overlap dengan Tenaga Tanam Padi.'),

('Combine Harvester Padi','alat-combine-harvester.jpg','Mesin Panen','mesin_diesel','Panen',1,0,0,149047200,543790800,'unit','TERVERIFIKASI_CAMPURAN','Blibli, Kubota, iHarvester, Yanmar/Andaro','2026-06-16','Memanen padi secara mekanis.','Menghemat waktu panen dan tenaga kerja.','Harga beli sangat tinggi dan butuh operator.','Overlap dengan Tenaga Panen Padi dan Power Thresher.'),

('Power Thresher / Mesin Perontok','alat-power-thresher.jpg','Mesin Pascapanen','mesin_bbm','Panen / Pascapanen',1,0,1,4619000,16095000,'unit','TERVERIFIKASI_MARKETPLACE','Shopee, Indotrading, Maksindo, Changdong','2026-06-16','Merontokkan gabah atau biji dari tanaman.','Mengurangi waktu perontokan manual.','Butuh operator dan BBM/listrik.','Tidak perlu jika combine sudah mencakup perontokan.'),

('Corn Sheller / Mesin Pemipil Jagung','alat-corn-sheller.jpg','Mesin Pascapanen','mesin_bbm','Pascapanen',0,1,0,2094560,23000000,'unit','TERVERIFIKASI_MARKETPLACE','Kubota, Blibli, Changdong, Kencana Jaya, Indotrading','2026-06-16','Memipil jagung dari tongkol.','Mempercepat pascapanen jagung.','Butuh operator dan kondisi jagung sesuai.','Overlap dengan pascapanen jagung dan tenaga pemipilan.'),

('Timbangan Digital Pertanian','alat-timbangan-digital.jpg','Alat Ukur','alat_ukur','Panen / Pascapanen',1,1,1,489500,3020000,'unit','TERVERIFIKASI_MARKETPLACE','Shopee, Lazada, Monotaro, RupaRupa','2026-06-16','Menimbang hasil panen dan input pertanian.','Meningkatkan akurasi hasil panen dan pendapatan.','Perlu kapasitas dan akurasi sesuai kebutuhan.','Overlap dengan Panen, Pascapanen, dan Laporan.');
```

---

## 11. Contoh SQL Seed Usage Context

```sql
INSERT INTO alat_mesin_usage
(alat_mesin_id, kategori_konteks, fase_penggunaan, relevan_padi, relevan_jagung, relevan_kedelai, catatan)
VALUES
(1, 'Perlindungan Tanaman', 'Vegetatif / Generatif', 1, 1, 1, 'Sprayer sebagai alat aplikasi, bukan bahan pestisida.'),
(1, 'Tenaga Kerja', 'Penyemprotan', 1, 1, 1, 'Pisahkan biaya alat dari upah penyemprotan.'),

(2, 'Perlindungan Tanaman', 'Vegetatif / Generatif', 1, 1, 1, 'Sprayer elektrik sebagai alat aplikasi.'),
(2, 'Tenaga Kerja', 'Penyemprotan', 1, 1, 1, 'Pisahkan biaya alat dari tenaga semprot.'),

(3, 'Air & Irigasi', 'Pra-tanam / Vegetatif / Generatif', 1, 1, 1, 'Pompa muncul sebagai mesin utama irigasi.'),

(4, 'Persiapan Lahan', 'Pra-tanam', 1, 1, 1, 'Traktor sebagai alat/jasa olah tanah.'),
(5, 'Persiapan Lahan', 'Pra-tanam', 1, 1, 1, 'Rotavator sebagai olah tanah lanjutan.'),

(6, 'Tenaga Kerja', 'Tanam Padi', 1, 0, 0, 'Alternatif tenaga tanam manual.'),
(7, 'Panen', 'Panen Padi', 1, 0, 0, 'Alternatif panen manual dan thresher.'),
(8, 'Pascapanen', 'Perontokan', 1, 0, 1, 'Tidak perlu jika combine sudah mencakup perontokan.'),
(9, 'Pascapanen', 'Pemipilan Jagung', 0, 1, 0, 'Bisa sebagai alat sendiri atau jasa pemipilan.'),
(10, 'Pascapanen', 'Penimbangan', 1, 1, 1, 'Alat ukur untuk validasi hasil panen.');
```

---

## 12. Rekomendasi MVP AgroTrack

Prioritas MVP:

1. Sprayer Manual
2. Sprayer Elektrik
3. Pompa Air
4. Traktor Roda Dua
5. Rotavator
6. Combine Harvester
7. Power Thresher
8. Corn Sheller
9. Timbangan Digital

Rice transplanter bisa tetap ada, tetapi jangan dijadikan fitur utama jika waktu sempit. Alasannya: rice transplanter hanya relevan untuk padi, butuh konteks persemaian khusus, dan lebih jarang dipakai petani kecil dibanding jasa traktor/pompa/sprayer/panen.

Namun, karena asset sudah ada, tetap masukkan sebagai katalog **opsional**.

---

## 13. Copy UI Singkat per Item

| Item | Copy pendek untuk card |
|---|---|
| Sprayer Manual | Alat semprot manual untuk pestisida, pupuk cair, atau agens hayati. |
| Sprayer Elektrik | Alat semprot baterai untuk penyemprotan lebih stabil dan ringan. |
| Pompa Air | Mesin untuk mengalirkan air dari sumber ke lahan. |
| Traktor Roda Dua | Mesin olah tanah untuk mempercepat persiapan lahan. |
| Rotavator | Alat rotary untuk menggemburkan dan meratakan tanah. |
| Rice Transplanter | Mesin tanam padi untuk penanaman lebih cepat dan seragam. |
| Combine Harvester | Mesin panen padi yang menggabungkan potong dan perontokan. |
| Power Thresher | Mesin perontok hasil panen, terutama padi dan sebagian kedelai. |
| Corn Sheller | Mesin pemipil jagung untuk mempercepat pascapanen. |
| Timbangan Digital | Alat timbang hasil panen dan input pertanian. |

---

## 14. Referensi Utama

1. Repository UM Jember — Pembahasan alsintan.  
   https://repository.unmuhjember.ac.id/9715/3/c.%20BAB%20I.pdf

2. Kementan/AGRICOM — Modernisasi penggunaan rice transplanter.  
   https://agricom.id/news/3365/kementan-dorong-modernisasi-pertanian-lewat-penggunaan-rice-transplanter

3. Kementan — Alsintan menekan biaya olah tanah.  
   https://www.pertanian.go.id/?act=view&id=3320&show=news

4. Chainsaw Surabaya — Sprayer Manual Tasco 16 L.  
   https://www.chainsawsurabaya.com/product/alat-semprot-pertanian-p602921.aspx

5. Lazada — Sprayer manual 16 L.  
   https://www.lazada.co.id/tag/pompa-semprot-pertanian-16-liter/

6. Shopee — Sprayer manual 16 L.  
   https://shopee.co.id/Sprayer-16-Liter-manual-Semprotan-hama-manual-sprayer-manual-pompa-16-liter-i.175066929.7271577072

7. Shopee — Sprayer elektrik 16 L.  
   https://shopee.co.id/SPRAYER-ELEKTRIK-ESTE779-16-LITER-SNI-Alat-Semprot-Tanaman-Pertanian-i.1012443142.20993470752

8. Lazada — Sprayer elektrik 16 L.  
   https://www.lazada.co.id/tag/sprayer-elektrik-16-liter-sni/

9. Blibli — Sprayer elektrik 16 L.  
   https://www.blibli.com/jual/sprayer-elektrik-16-liter

10. Shopee — Pompa alkon 2 inch.  
    https://shopee.co.id/search?keyword=pompa+alkon+2+inch

11. Lazada — Pompa alkon 2 inch.  
    https://www.lazada.co.id/tag/pompa-alkon-2-inch/

12. PaDi UMKM — Pompa air Honda GX 160 2 inch.  
    https://padiumkm.id/product/mesin-pompa-air-sawah-irigasi-alkon-water-pump-honda-gx-160-2-inch-2/65fac2f6aeba559677c858b7

13. Quick — Traktor roda dua.  
    https://tokoquick.id/category/unit/unit-traktor-roda-2-quick

14. Blibli — Traktor sawah Quick.  
    https://www.blibli.com/jual/traktor-sawah-quik

15. Indotrading — Traktor sawah.  
    https://www.indotrading.com/jual-traktor-sawah

16. Lazada — Traktor rotary.  
    https://www.lazada.co.id/tag/traktor-rotary/

17. Indotara — Rice Transplanter Temco 2RT-4K.  
    https://www.indotarapersada.com/product/mesin-penanam-padi-rice-transplanter-temco-2rt-4k-p1400109.aspx

18. Blibli — Rice Transplanter.  
    https://www.blibli.com/jual/rice-transplanter

19. Blibli — Rice Combine Harvester.  
    https://www.blibli.com/jual/rice-combine-harvester

20. Kubota — Combine Harvester.  
    https://ptkubota.co.id/products/mesin-pemanen-padi-combine-harvester/

21. iHarvester — Kisaran harga combine Kubota.  
    https://iharvester.com/harga-mesin-panen-padi-berapa-kubota/

22. Shopee — Power thresher.  
    https://shopee.co.id/search?keyword=power+thresher

23. Indotrading — Power thresher.  
    https://www.indotrading.com/showcase/power-thresher

24. Maksindo — Mesin perontok padi power thresher AGR-PRP40.  
    https://www.maksindo.com/mesin-perontok-padi-power-thresher.htm

25. Changdong — Power thresher.  
    https://www.changdongindonesia.com/product/mesin-perontok-padi-power-thresher-p1611373.aspx

26. Kubota — Corn sheller.  
    https://ptkubota.co.id/products/mesin-pemipil-jagung-corn-sheller/

27. Blibli — Corn sheller.  
    https://www.blibli.com/jual/corn-sheller

28. Changdong — Corn sheller Honda.  
    https://www.changdongindonesia.com/product/mesin-corn-sheller-honda-pemipil-jagung-p689867.aspx

29. Kencana Jaya Teknik — Mesin pemipil jagung.  
    https://www.kencanajayateknik.com/product/mesin-pemipil-jagung-p42996.aspx

30. Indotrading — Corn sheller.  
    https://www.indotrading.com/showcase/corn-sheller

31. Shopee — Timbangan digital 150 kg.  
    https://shopee.co.id/Timbangan-Digital-150Kg-Timbangan-Duduk-Digital-150kg-i.475333485.29750068636

32. Lazada — Timbangan digital 150 kg padi.  
    https://www.lazada.co.id/tag/timbangan-digital-150kg-padi/

33. Monotaro — Timbangan digital 150 kg.  
    https://www.monotaro.id/k/store/timbangan%20digital%20150%20kg

34. Monotaro — Timbangan digital 300 kg.  
    https://www.monotaro.id/k/store/timbangan%20digital%20300kg

35. RupaRupa — Krisbow timbangan digital 300 kg.  
    https://www.ruparupa.com/p/krisbow-timbangan-barang-digital-300-kg.html
