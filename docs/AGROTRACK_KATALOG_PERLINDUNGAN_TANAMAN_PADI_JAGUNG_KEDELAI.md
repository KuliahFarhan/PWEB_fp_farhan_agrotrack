# AgroTrack — Katalog Perlindungan Tanaman untuk Padi, Jagung, dan Kedelai

**Versi:** 1.0  
**Tanggal penyusunan:** 16 Juni 2026  
**Kategori:** Perlindungan Tanaman / Perlintan  
**Target komoditas:** Padi, Jagung, Kedelai  
**Fungsi dokumen:** Referensi awal untuk seed database, UI katalog saprodi, dan card asset AgroTrack.

---

## 1. Catatan Validitas dan Batasan

Dokumen ini dibuat untuk **katalog AgroTrack**, bukan untuk memberi rekomendasi dosis pestisida final. Perlindungan tanaman sangat bergantung pada jenis OPT, fase tanaman, intensitas serangan, kondisi cuaca, bahan aktif, label produk, ambang kendali, dan regulasi.

Standar yang dipakai:

1. **Harga tidak dipukul rata.** Setiap kategori memakai contoh sumber harga internet.
2. **Harga adalah referensi katalog**, bukan harga final toko. Harga berubah karena wilayah, stok, merek, ukuran kemasan, ongkir, dan promo.
3. **Jika item terlalu bergantung merek/produk**, status harga ditulis sebagai `TERVERIFIKASI_MARKETPLACE` atau `PERLU_VERIFIKASI_PRODUK`.
4. **Tidak ada dosis aplikasi dalam dokumen ini.** Dosis harus mengikuti label produk dan/atau anjuran penyuluh.
5. **Gunakan pendekatan PHT.** Perlindungan tanaman tidak hanya pestisida kimia, tetapi juga monitoring, agens hayati, sanitasi, perangkap, dan pengendalian mekanis.

Sumber konsep dasar:
- Permentan No. 43 Tahun 2019 tentang Pendaftaran Pestisida.  
  https://peraturan.bpk.go.id/Home/Details/201255/permentan-no-43-tahun-2019
- Permentan No. 39 Tahun 2015 memuat jenis pestisida seperti insektisida, fungisida/bakterisida, herbisida, rodentisida, moluskisida, dan lain-lain.  
  https://peraturan.bpk.go.id/Download/153140/Permentan%20Nomor%2039%20Tahun%202015%20%281%29.pdf
- Buku pengendalian hama dan penyakit tanaman pangan/hortikultura menjelaskan PHT sebagai pendekatan pengendalian berbasis ekosistem, bukan sekadar semprot pestisida.  
  https://eprints.unm.ac.id/21977/1/Buku%20Pengendalian%20Hama%20dan%20Penyakit%20Tanaman%20Pangan%20dan%20Hortikultura.pdf
- Syngenta menampilkan kategori produk crop protection seperti insektisida dan fungisida beserta bahan aktifnya.  
  https://www.syngenta.co.id/products/search/crop-protection

---

## 2. Asset yang Sudah Disiapkan

| No | Nama File Asset | Nama Item UI | Status |
|---:|---|---|---|
| 1 | `perlintan-herbisida.jpg` | Herbisida Gulma | Siap pakai |
| 2 | `perlintan-insektisida.jpg` | Insektisida Hama Serangga | Siap pakai |
| 3 | `perlintan-fungisida.jpg` | Fungisida Penyakit Jamur | Siap pakai |
| 4 | `perlintan-moluskisida.jpg` | Moluskisida Keong/Siput | Siap pakai |
| 5 | `perlintan-rodentisida.jpg` | Rodentisida Tikus | Siap pakai |
| 6 | `perlintan-nematisida.jpg` | Nematisida Nematoda/Hama Tanah | Siap pakai |
| 7 | `perlintan-akarisida.jpg` | Akarisida Tungau | Siap pakai |
| 8 | `perlintan-perekat-perata.jpg` | Perekat, Perata, Penembus Semprot | Siap pakai |
| 9 | `perlintan-trichoderma.jpg` | Agens Hayati Trichoderma | Siap pakai |
| 10 | `perlintan-beauveria.jpg` | Agens Hayati Beauveria bassiana | Siap pakai |
| 11 | `perlintan-metarhizium.jpg` | Agens Hayati Metarhizium anisopliae | Siap pakai |
| 12 | `perlintan-perangkap-feromon.jpg` | Perangkap Feromon | Siap pakai |
| 13 | `perlintan-yellow-sticky-trap.jpg` | Yellow Sticky Trap | Siap pakai |
| 14 | `perlintan-perangkap-tikus.jpg` | Perangkap Tikus Sawah | Siap pakai |

Rekomendasi folder:

```text
assets/img/saprodi/perlindungan-tanaman/
```

---

## 3. Ringkasan Katalog Perlindungan Tanaman

| No | Item | File Asset | Jenis Perlindungan | Fase Penggunaan | Komoditas Relevan | Satuan Harga | Harga Referensi Internet | Status Harga |
|---:|---|---|---|---|---|---|---:|---|
| 1 | Herbisida Gulma | `perlintan-herbisida.jpg` | Pestisida kimia | Pra-tanam / awal pertumbuhan / vegetatif | Padi, Jagung, Kedelai | 1 liter | Rp50.000 – Rp114.400 | TERVERIFIKASI_MARKETPLACE |
| 2 | Insektisida Hama Serangga | `perlintan-insektisida.jpg` | Pestisida kimia | Awal pertumbuhan / vegetatif / generatif | Padi, Jagung, Kedelai | 100 ml / 250 ml | Rp24.225 – Rp195.000 | TERVERIFIKASI_MARKETPLACE |
| 3 | Fungisida Penyakit Jamur | `perlintan-fungisida.jpg` | Pestisida kimia | Vegetatif / generatif | Padi, Jagung, Kedelai | 250 g / 500 g / 250 ml | Rp25.740 – Rp178.100 | TERVERIFIKASI_MARKETPLACE |
| 4 | Moluskisida Keong/Siput | `perlintan-moluskisida.jpg` | Pestisida kimia | Awal tanam, terutama padi sawah | Padi terutama | 15 g / 50 g / 100 g / 450 ml | Rp13.250 – Rp85.000 | TERVERIFIKASI_MARKETPLACE |
| 5 | Rodentisida Tikus | `perlintan-rodentisida.jpg` | Pestisida kimia / umpan | Pra-tanam / vegetatif / generatif | Padi, Jagung | 100 g / 1 kg | Rp7.500 – Rp90.000 | TERVERIFIKASI_MARKETPLACE |
| 6 | Nematisida Nematoda/Hama Tanah | `perlintan-nematisida.jpg` | Pestisida kimia | Pra-tanam / tanam / awal pertumbuhan | Padi, Jagung, Kedelai pada kondisi tertentu | 100 g / 1 kg / 100 ml | Rp4.730 – Rp142.000 | TERVERIFIKASI_MARKETPLACE |
| 7 | Akarisida Tungau | `perlintan-akarisida.jpg` | Pestisida kimia | Vegetatif / generatif | Kedelai terutama, juga tanaman lain bila ada tungau | 250 ml | Rp40.000 – Rp110.000 | TERVERIFIKASI_MARKETPLACE |
| 8 | Perekat, Perata, Penembus Semprot | `perlintan-perekat-perata.jpg` | Adjuvant / bahan bantu semprot | Saat aplikasi semprot | Padi, Jagung, Kedelai | 250 ml / 500 ml / 1 liter | Rp16.000 – Rp90.000 | TERVERIFIKASI_MARKETPLACE |
| 9 | Agens Hayati Trichoderma | `perlintan-trichoderma.jpg` | Agens hayati / biofungisida | Pra-tanam / awal pertumbuhan | Padi, Jagung, Kedelai | 100 g / 500 g / 1 kg | Rp23.750 – Rp102.500 | TERVERIFIKASI_MARKETPLACE |
| 10 | Agens Hayati Beauveria bassiana | `perlintan-beauveria.jpg` | Agens hayati / bioinsektisida | Vegetatif / saat monitoring hama | Padi, Jagung, Kedelai | 50 g / 100 g / 1 kg | Rp12.900 – Rp49.900+ | TERVERIFIKASI_MARKETPLACE |
| 11 | Agens Hayati Metarhizium anisopliae | `perlintan-metarhizium.jpg` | Agens hayati / bioinsektisida | Vegetatif / saat monitoring hama tanah/serangga | Padi, Jagung, Kedelai | 50 g / produk | Rp30.000 – Rp98.000 | TERVERIFIKASI_MARKETPLACE |
| 12 | Perangkap Feromon | `perlintan-perangkap-feromon.jpg` | Monitoring / perangkap massal | Monitoring vegetatif-generatif | Jagung terutama; opsional kedelai | unit / lure | Rp55.500 per lure FAW contoh | TERVERIFIKASI_PRODUK_SPESIFIK |
| 13 | Yellow Sticky Trap | `perlintan-yellow-sticky-trap.jpg` | Monitoring / perangkap visual | Monitoring awal-vegetatif | Kedelai, Jagung, Padi opsional | 10 lembar / pack | PERLU CEK ULANG per produk | PERLU_VERIFIKASI_HARGA |
| 14 | Perangkap Tikus Sawah | `perlintan-perangkap-tikus.jpg` | Mekanis / TBS / bubu | Pra-tanam sampai generatif | Padi terutama, juga jagung | unit / set | Harga sangat tergantung model, bisa dibuat manual | PERLU_VERIFIKASI_LAPANGAN |

---

## 4. Detail Item Katalog

### 4.1 Herbisida Gulma

| Field | Isi |
|---|---|
| Nama UI | Herbisida Gulma |
| Nama file | `perlintan-herbisida.jpg` |
| Jenis | Pestisida kimia |
| Target umum | Gulma/rumput liar |
| Relevan untuk | Padi, Jagung, Kedelai |
| Fase penggunaan | Pra-tanam, awal pertumbuhan, vegetatif |
| Satuan umum | 200 ml, 500 ml, 1 liter |
| Harga referensi | Rp50.000 – Rp114.400 / 1 liter |
| Status harga | TERVERIFIKASI_MARKETPLACE |
| Sumber harga | Lazada dan Shopee untuk contoh produk herbisida 1 liter |
| Fungsi utama | Mengendalikan gulma yang bersaing dengan tanaman utama |
| Keunggulan | Mengurangi kebutuhan penyiangan manual; relevan untuk semua komoditas |
| Risiko/keterbatasan | Salah aplikasi dapat merusak tanaman utama, mencemari lingkungan, dan memicu resistensi gulma |
| Catatan UI | Tampilkan sebagai item “gunakan sesuai label produk”; jangan tampilkan dosis default |

Deskripsi card UI:

> Herbisida digunakan untuk mengendalikan gulma atau rumput liar yang bersaing dengan tanaman utama. Cocok untuk fase pra-tanam atau fase awal pertumbuhan, tetapi penggunaannya harus mengikuti label produk dan kondisi lapangan.

Sumber:
- Harga Shopee herbisida 1 L: https://shopee.co.id/herbisida-pembasmi-rumput-roundup-gramoxone-1Liter-original-i.100782208.41321416071
- Harga Lazada herbisida 1 L: https://www.lazada.co.id/tag/gramoxone-dan-roundup-1-liter/
- Konsep pestisida/herbisida: https://peraturan.bpk.go.id/Download/153140/Permentan%20Nomor%2039%20Tahun%202015%20%281%29.pdf
- Resistensi gulma/herbisida: https://repository.pertanian.go.id/bitstreams/fb10a9c5-1dc5-4d30-9771-7b0efec772b3/download

---

### 4.2 Insektisida Hama Serangga

| Field | Isi |
|---|---|
| Nama UI | Insektisida Hama Serangga |
| Nama file | `perlintan-insektisida.jpg` |
| Jenis | Pestisida kimia |
| Target umum | Hama serangga seperti ulat, wereng, penggerek, kutu, dan serangga pengisap |
| Relevan untuk | Padi, Jagung, Kedelai |
| Fase penggunaan | Awal pertumbuhan, vegetatif, generatif |
| Satuan umum | 100 ml, 250 ml, 500 ml, 100 g |
| Harga referensi | Rp24.225 – Rp195.000 tergantung produk dan ukuran |
| Status harga | TERVERIFIKASI_MARKETPLACE |
| Sumber harga | Shopee, Lazada, Blibli, PertanianIndonesia untuk contoh produk insektisida |
| Fungsi utama | Mengendalikan populasi hama serangga ketika serangan telah mencapai ambang kendali |
| Keunggulan | Respon cepat dibanding beberapa metode hayati |
| Risiko/keterbatasan | Dapat membunuh musuh alami, menimbulkan resistensi, dan berisiko bagi operator jika salah pakai |
| Catatan UI | Jangan ditulis “wajib semprot”; tulis “dipakai bila diperlukan berdasarkan monitoring OPT” |

Deskripsi card UI:

> Insektisida digunakan untuk mengendalikan hama serangga. Dalam AgroTrack, item ini sebaiknya muncul setelah petani mencatat adanya serangan hama, bukan sebagai biaya wajib setiap musim.

Sumber:
- Contoh produk crop protection Syngenta: https://www.syngenta.co.id/products/search/crop-protection
- Harga Regent 100/250 ml: https://shopee.co.id/obat-pertanian-insektisida-REGENT-lama-100ml-250ml-i.281001279.14896269315
- Harga Sumo 250 ml: https://www.lazada.co.id/tag/insextisida-sumo-250ml/
- Harga Sankill 100 ml: https://shopee.co.id/search?keyword=insektisida+sankill
- Harga Blibli insektisida 250 ml: https://www.blibli.com/jual/insektisida-250-ml
- PHT: https://eprints.unm.ac.id/21977/1/Buku%20Pengendalian%20Hama%20dan%20Penyakit%20Tanaman%20Pangan%20dan%20Hortikultura.pdf

---

### 4.3 Fungisida Penyakit Jamur

| Field | Isi |
|---|---|
| Nama UI | Fungisida Penyakit Jamur |
| Nama file | `perlintan-fungisida.jpg` |
| Jenis | Pestisida kimia |
| Target umum | Penyakit tanaman akibat cendawan/jamur |
| Relevan untuk | Padi, Jagung, Kedelai |
| Fase penggunaan | Vegetatif dan generatif |
| Satuan umum | 250 g, 500 g, 1 kg, 250 ml |
| Harga referensi | Rp25.740 – Rp178.100 tergantung produk dan ukuran |
| Status harga | TERVERIFIKASI_MARKETPLACE |
| Sumber harga | Lazada, Tanitoon, Toco, dan spesifikasi produk dari BASF/Syngenta |
| Fungsi utama | Mengendalikan penyakit yang disebabkan jamur/cendawan |
| Keunggulan | Relevan pada fase kelembapan tinggi atau saat gejala penyakit muncul |
| Risiko/keterbatasan | Penggunaan berulang dengan mode kerja sama dapat memicu resistensi |
| Catatan UI | Simpan juga field `bahan_aktif` dan `formulasi` jika memilih produk spesifik |

Deskripsi card UI:

> Fungisida digunakan untuk mengendalikan penyakit tanaman yang disebabkan oleh jamur/cendawan. Cocok dicatat sebagai biaya perlindungan tanaman jika ada risiko atau gejala penyakit pada fase vegetatif maupun generatif.

Sumber:
- Cabrio Top BASF: https://petani-sejahtera.basf.co.id/fungisida/cabrio-top-60-wg
- Score Syngenta: https://www.syngenta.co.id/product/crop-protection/fungisida/score-250-ec
- Harga fungisida Lazada: https://www.lazada.co.id/tag/pertanian-obat-fungisida/
- Harga Tanitoon fungisida: https://tanitoon.com/Produk-Tag/fungisida/
- Harga Score 250 ml: https://toco.id/listing/score-250-ml-fungisida-1776329933883-a262
- Resistensi fungisida: https://repository.pertanian.go.id/bitstreams/fb10a9c5-1dc5-4d30-9771-7b0efec772b3/download

---

### 4.4 Moluskisida Keong/Siput

| Field | Isi |
|---|---|
| Nama UI | Moluskisida Keong/Siput |
| Nama file | `perlintan-moluskisida.jpg` |
| Jenis | Pestisida kimia |
| Target umum | Keong mas, siput, bekicot |
| Relevan untuk | Padi terutama; opsional tanaman lain |
| Fase penggunaan | Awal tanam / fase bibit muda pada padi sawah |
| Satuan umum | 15 g, 50 g, 100 g, 450 ml |
| Harga referensi | Rp13.250 – Rp85.000 |
| Status harga | TERVERIFIKASI_MARKETPLACE |
| Sumber harga | Lazada dan Blibli untuk produk moluskisida/obat keong |
| Fungsi utama | Mengendalikan keong/siput yang merusak tanaman muda, terutama di sawah |
| Keunggulan | Relevan untuk padi sawah yang rawan keong mas |
| Risiko/keterbatasan | Tidak relevan untuk semua lahan; penggunaan harus hati-hati di area perairan |
| Catatan UI | Beri badge “Padi sawah” dan “opsional sesuai serangan keong” |

Deskripsi card UI:

> Moluskisida digunakan untuk mengendalikan hama keong atau siput, terutama pada lahan padi sawah. Item ini tidak perlu muncul sebagai biaya default untuk jagung dan kedelai kecuali petani mencatat masalah siput/keong.

Sumber:
- Harga Lazada obat keong: https://www.lazada.co.id/tag/obat-keong-mas-di-sawah/
- Harga Bentan 45/60 WP: https://www.lazada.co.id/tag/obat-keong-ongatan/
- Harga Blibli pembasmi keong: https://www.blibli.com/jual/pembasmi-keong
- Harga BigGo racun keong: https://biggo.id/s/Racun%20Keong%20MAS
- Jenis pestisida: https://peraturan.bpk.go.id/Download/153140/Permentan%20Nomor%2039%20Tahun%202015%20%281%29.pdf

---

### 4.5 Rodentisida Tikus

| Field | Isi |
|---|---|
| Nama UI | Rodentisida Tikus |
| Nama file | `perlintan-rodentisida.jpg` |
| Jenis | Pestisida kimia / umpan |
| Target umum | Tikus sawah dan pengerat |
| Relevan untuk | Padi terutama, juga jagung |
| Fase penggunaan | Pra-tanam, vegetatif, generatif, menjelang panen |
| Satuan umum | 100 g, 1 kg |
| Harga referensi | Rp7.500/100 g sampai Rp90.000/1 kg |
| Status harga | TERVERIFIKASI_MARKETPLACE |
| Sumber harga | Lazada, Shopee, Blibli |
| Fungsi utama | Mengendalikan hama tikus melalui umpan/racun rodentisida |
| Keunggulan | Dapat menjadi opsi jika serangan tikus tinggi |
| Risiko/keterbatasan | Risiko terhadap hewan non-target dan keselamatan manusia; perlu penempatan aman |
| Catatan UI | Sertakan alternatif PHTT/TBS/perangkap tikus; jangan hanya racun |

Deskripsi card UI:

> Rodentisida digunakan untuk pengendalian hama tikus. Karena berisiko terhadap hewan non-target dan manusia, AgroTrack sebaiknya menampilkan catatan keselamatan dan alternatif pengendalian mekanis seperti perangkap bubu atau TBS.

Sumber:
- Harga Lazada rodentisida: https://www.lazada.co.id/tag/rodentisida-untuk-tikus-pertanian/
- Harga Blibli obat tikus sawah: https://www.blibli.com/jual/obat-tikus-sawah
- Harga Shopee rodentisida: https://shopee.co.id/list/Rodentisida
- Kategori rodentisida: https://fac-pt.com/kategori-produk/pestisida/rodentisida/
- Teknik pengendalian tikus sawah: https://distankan.bulelengkab.go.id/informasi/detail/artikel/teknik-pengendalian-hama-tikus-sawah-48

---

### 4.6 Nematisida Nematoda/Hama Tanah

| Field | Isi |
|---|---|
| Nama UI | Nematisida Nematoda/Hama Tanah |
| Nama file | `perlintan-nematisida.jpg` |
| Jenis | Pestisida kimia |
| Target umum | Nematoda dan sebagian hama tanah, tergantung produk |
| Relevan untuk | Padi, Jagung, Kedelai pada kondisi tertentu |
| Fase penggunaan | Pra-tanam, tanam, awal pertumbuhan |
| Satuan umum | 100 g, 1 kg, 100 ml |
| Harga referensi | Rp4.730–6.600/100 g; Rp19.832–40.000/1 kg; Rp100.000–142.000/100 ml untuk produk premium |
| Status harga | TERVERIFIKASI_MARKETPLACE |
| Sumber harga | Lazada, Shopee, Blibli, PertanianIndonesia |
| Fungsi utama | Mengendalikan nematoda/hama tanah tertentu sesuai label produk |
| Keunggulan | Relevan untuk masalah akar/hama tanah tertentu |
| Risiko/keterbatasan | Tidak boleh dijadikan biaya default; pemakaian harus berdasarkan masalah lapang |
| Catatan UI | Tampilkan sebagai “kondisi khusus”, bukan item wajib per musim |

Deskripsi card UI:

> Nematisida digunakan untuk mengendalikan nematoda atau hama tanah tertentu. Dalam AgroTrack, item ini cocok ditandai sebagai perlindungan khusus yang dipilih hanya jika petani menghadapi gejala atau riwayat serangan hama tanah.

Sumber:
- Harga Furadan/nematisida PertanianIndonesia: https://pertanianindonesia.com/nematisida
- Harga Furadan 100 g Lazada: https://www.lazada.co.id/tag/furadan-100-gram/
- Harga Furadan 100 g Blibli: https://www.blibli.com/p/furadan-100-gram-nematisida-akarisida/ps--WOI-60027-01351
- Harga Velum Prime 100 ml: https://www.lazada.co.id/tag/obat-pertanian-velum-100-ml/

---

### 4.7 Akarisida Tungau

| Field | Isi |
|---|---|
| Nama UI | Akarisida Tungau |
| Nama file | `perlintan-akarisida.jpg` |
| Jenis | Pestisida kimia |
| Target umum | Tungau/mites |
| Relevan untuk | Kedelai terutama; juga tanaman lain jika ada serangan tungau |
| Fase penggunaan | Vegetatif dan generatif |
| Satuan umum | 250 ml |
| Harga referensi | Rp40.000 – Rp110.000 / 250 ml |
| Status harga | TERVERIFIKASI_MARKETPLACE |
| Sumber harga | Purotani, Shopee, Lazada, Blibli, PertanianIndonesia |
| Fungsi utama | Mengendalikan hama tungau pada daun/tanaman |
| Keunggulan | Relevan untuk serangan tungau yang tidak selalu efektif dikendalikan insektisida umum |
| Risiko/keterbatasan | Tidak semua komoditas/fase perlu akarisida; risiko resistensi tetap ada |
| Catatan UI | Letakkan sebagai item opsional; jangan disamakan dengan insektisida umum |

Deskripsi card UI:

> Akarisida digunakan untuk mengendalikan tungau. Untuk AgroTrack, item ini lebih cocok sebagai perlindungan opsional, terutama pada kedelai atau lahan yang memang memiliki riwayat serangan tungau.

Sumber:
- Harga Purotani Samite 250 ml: https://purotani.id/product/insektisida-akarisida-samite-250-ml-cap-kapal-terbang/
- Harga Shopee Samite 250 ml: https://shopee.co.id/Samite-250-ml-Akarisida-Obat-Hama-Kutu-Tanaman-Pertanian-i.1422171789.27521291611
- Harga Blibli akarisida 250 ml: https://www.blibli.com/jual/akarisida-250-ml
- Harga PertanianIndonesia akarisida: https://pertanianindonesia.com/akarisida
- Harga Lazada akarisida 250 ml: https://www.lazada.co.id/tag/akarisida-untuk-cabe-250-mili/

---

### 4.8 Perekat, Perata, Penembus Semprot

| Field | Isi |
|---|---|
| Nama UI | Perekat, Perata, Penembus Semprot |
| Nama file | `perlintan-perekat-perata.jpg` |
| Jenis | Adjuvant / bahan bantu aplikasi |
| Target umum | Membantu penyebaran, perlekatan, dan penembusan larutan semprot |
| Relevan untuk | Padi, Jagung, Kedelai |
| Fase penggunaan | Saat aplikasi semprot, bukan fase mandiri |
| Satuan umum | 250 ml, 500 ml, 1 liter |
| Harga referensi | Rp16.000 – Rp90.000 |
| Status harga | TERVERIFIKASI_MARKETPLACE |
| Sumber harga | Shopee, Lazada, Blibli, KampoengTani |
| Fungsi utama | Membantu larutan semprot lebih merata dan menempel di permukaan daun |
| Keunggulan | Memperjelas biaya semprot yang sering dilupakan |
| Risiko/keterbatasan | Tidak semua pestisida boleh dicampur adjuvant; ikuti label produk |
| Catatan UI | Kategori ini bukan pestisida utama, tetapi bahan pendukung penyemprotan |

Deskripsi card UI:

> Perekat/perata/penembus adalah bahan bantu semprot yang digunakan bersama pestisida atau pupuk daun tertentu. Dalam AgroTrack, item ini dicatat sebagai biaya pendukung aplikasi semprot, bukan pestisida utama.

Sumber:
- Harga Cluster 500 ml: https://shopee.co.id/Penembus-Perekat-Perata-Pestisida-CLUSTER-500ml-i.216799210.6051112362
- Harga Bola Stick 500 ml/1 L: https://shopee.co.id/Perekat-Tanaman-Perata-Penembus-Pembasah-Pestisida-500-ML-1-Liter-Bola-Stick-i.15001736.9906821107
- Harga Axer 250 ml KampoengTani: https://kampoengtani.com/product/axer-250-ml-perekat-penembus-perata-pestisida/
- Harga Axer 250 ml Blibli: https://www.blibli.com/p/axer-250-ml-perekat-penembus-jaringan-daun-tingkatkan-efektivitas-pestisida-memaksimalkan-penyebaran-penyerapan/ps--GRM-70100-00128
- Harga Lazada perekat 500 ml: https://www.lazada.co.id/tag/perekat-obat-pertanian-500-ml/

---

### 4.9 Agens Hayati Trichoderma

| Field | Isi |
|---|---|
| Nama UI | Agens Hayati Trichoderma |
| Nama file | `perlintan-trichoderma.jpg` |
| Jenis | Agens hayati / biofungisida / mikroba antagonis |
| Target umum | Patogen tanah/jamur penyakit tertentu, tergantung strain/produk |
| Relevan untuk | Padi, Jagung, Kedelai |
| Fase penggunaan | Pra-tanam, perlakuan tanah, awal pertumbuhan |
| Satuan umum | 100 g, 500 g, 1 kg |
| Harga referensi | Rp23.750 – Rp102.500 |
| Status harga | TERVERIFIKASI_MARKETPLACE |
| Sumber harga | Shopee dan referensi agens hayati |
| Fungsi utama | Mendukung pengendalian hayati penyakit tanaman dan kesehatan rizosfer |
| Keunggulan | Selaras dengan konsep PHT; lebih ramah lingkungan daripada bergantung total pada kimia |
| Risiko/keterbatasan | Efektivitas tergantung strain, viabilitas, penyimpanan, kelembapan, dan cara aplikasi |
| Catatan UI | Simpan sebagai “Agens Hayati”, bukan “obat instan” |

Deskripsi card UI:

> Trichoderma adalah agens hayati yang sering dipakai untuk mendukung pengendalian penyakit tanaman dan kesehatan tanah. Cocok dimasukkan ke fase pra-tanam atau awal pertumbuhan.

Sumber:
- Harga Trichoderma Shopee: https://shopee.co.id/search?keyword=tricoderma
- Harga Trichoderma 1 kg: https://shopee.co.id/search?keyword=trichoderma+sp
- Harga bahan aktif Trichoderma: https://shopee.co.id/list/Bahan/Aktif/Trichoderma
- Agens hayati Trichoderma/Beauveria/Metarhizium: https://bookchapter.unnes.ac.id/index.php/ka/article/download/170/165
- Agens hayati: https://distanpangan.baliprov.go.id/wp-content/uploads/2023/08/Buku-Saku-APH.pdf
- Inovasi Trichoderma dan jamur entomopatogen: https://agroteknologi.umsida.ac.id/inovasi-pertanian-kombinasi-trichoderma-dan-jamur-entomopatogen-untuk-perlindungan-padi-di-daerah-endemik-hama-penggerek-batang/

---

### 4.10 Agens Hayati Beauveria bassiana

| Field | Isi |
|---|---|
| Nama UI | Agens Hayati Beauveria bassiana |
| Nama file | `perlintan-beauveria.jpg` |
| Jenis | Agens hayati / bioinsektisida |
| Target umum | Hama serangga tertentu |
| Relevan untuk | Padi, Jagung, Kedelai |
| Fase penggunaan | Vegetatif / saat monitoring hama |
| Satuan umum | 50 g, 100 g, 1 kg |
| Harga referensi | Rp12.900/100 g sampai Rp49.900+; produk 1 kg perlu verifikasi per merek |
| Status harga | TERVERIFIKASI_MARKETPLACE |
| Sumber harga | Lazada, Shopee, Blibli |
| Fungsi utama | Menginfeksi/mengendalikan serangga hama tertentu sebagai bioinsektisida |
| Keunggulan | Lebih ramah lingkungan dan sesuai PHT |
| Risiko/keterbatasan | Kerja lebih lambat daripada kimia; butuh kelembapan/kondisi aplikasi yang mendukung |
| Catatan UI | Tampilkan sebagai opsi “Hayati/PHT”; jangan klaim bekerja secepat kimia |

Deskripsi card UI:

> Beauveria bassiana adalah cendawan entomopatogen yang digunakan sebagai agens hayati untuk membantu mengendalikan hama serangga. Item ini cocok untuk katalog PHT di AgroTrack.

Sumber:
- Beauveria sebagai biopestisida: https://media.neliti.com/media/publications/381544-none-e4bd3472.pdf
- Harga Beauveria 100 g Lazada: https://www.lazada.co.id/tag/beauveria-bassiana-obat/
- Harga Beauveria 1 kg Shopee: https://shopee.co.id/1kg-Beauveria-Bassiana-Pestisida-Hayati-Organik-Insektisida-Alami-Pengendali-Hama-Tanah-untuk-Wereng-dan-Uret-Untuk-Pertanian-i.1250117803.40474852399
- Harga Beauveria Blibli: https://www.blibli.com/jual/beauveria-bassiana
- Agens hayati Trichoderma/Beauveria/Metarhizium: https://bookchapter.unnes.ac.id/index.php/ka/article/download/170/165

---

### 4.11 Agens Hayati Metarhizium anisopliae

| Field | Isi |
|---|---|
| Nama UI | Agens Hayati Metarhizium anisopliae |
| Nama file | `perlintan-metarhizium.jpg` |
| Jenis | Agens hayati / bioinsektisida |
| Target umum | Serangga hama tertentu, termasuk sebagian hama tanah |
| Relevan untuk | Padi, Jagung, Kedelai |
| Fase penggunaan | Vegetatif / monitoring hama tanah/serangga |
| Satuan umum | 50 g, 100 g, produk cair/serbuk |
| Harga referensi | Rp30.000 – Rp98.000 untuk produk terkait Metarhizium/Entomobac di marketplace |
| Status harga | TERVERIFIKASI_MARKETPLACE |
| Sumber harga | Blibli, Shopee, Lazada |
| Fungsi utama | Bioinsektisida berbasis jamur yang menginfeksi hama serangga tertentu |
| Keunggulan | Mendukung sistem PHT dan pengurangan ketergantungan pada kimia |
| Risiko/keterbatasan | Efektivitas tergantung strain, formulasi, kondisi lingkungan, dan target hama |
| Catatan UI | Hindari klaim “membasmi semua hama”; tulis target umum dan perlu monitoring |

Deskripsi card UI:

> Metarhizium anisopliae adalah cendawan entomopatogen yang digunakan sebagai agens hayati untuk menekan hama serangga tertentu. Dalam AgroTrack, item ini masuk kategori Perlindungan Hayati.

Sumber:
- Potensi Metarhizium sebagai agens pengendali hayati: https://distankan.bulelengkab.go.id/informasi/detail/artikel/16_potensi-metarhizium-anisopliae-sebagai-agens-pengendali-hayati
- Harga Metarhizium Blibli: https://www.blibli.com/jual/metarhizium-anisopliae
- Harga Metarhizium Lazada: https://www.lazada.co.id/tag/metri-metarhizium/
- Harga Entomobac Shopee: https://shopee.co.id/Entomobac-50-gr-Metarhizium-Beauveria-Bassiana-Bio-Insektisida-Organik-Agen-Hayati-Pembasmi-Hama-Serangga-Tanaman-Buah-Bunga-Sayur-Hias-i.135032082.24419534611
- Agens hayati: https://bookchapter.unnes.ac.id/index.php/ka/article/download/170/165
- Metarhizium untuk ulat grayak kedelai disebut dalam daftar rujukan artikel Polije: https://proceedings.polije.ac.id/index.php/agropross/article/view/302

---

### 4.12 Perangkap Feromon

| Field | Isi |
|---|---|
| Nama UI | Perangkap Feromon |
| Nama file | `perlintan-perangkap-feromon.jpg` |
| Jenis | Monitoring / atraktan / perangkap massal |
| Target umum | Hama tertentu yang tertarik feromon, contoh ulat grayak jagung |
| Relevan untuk | Jagung terutama; opsional kedelai sesuai target hama |
| Fase penggunaan | Monitoring vegetatif-generatif |
| Satuan umum | unit perangkap, lure, set |
| Harga referensi | Rp55.500 untuk contoh FAW lure |
| Status harga | TERVERIFIKASI_PRODUK_SPESIFIK |
| Sumber harga | Indotrading/Rumah Bio Indonesia |
| Fungsi utama | Monitoring atau menekan populasi imago hama tertentu lewat atraktan feromon |
| Keunggulan | Lebih spesifik dan ramah lingkungan dibanding aplikasi kimia luas |
| Risiko/keterbatasan | Harus sesuai target hama; feromon satu hama tidak otomatis efektif untuk hama lain |
| Catatan UI | Cocok untuk fitur “monitoring OPT” pada tanaman jagung |

Deskripsi card UI:

> Perangkap feromon digunakan untuk menarik hama tertentu, misalnya ulat grayak pada jagung. Item ini lebih tepat diposisikan sebagai alat monitoring/PHT, bukan pestisida kimia.

Sumber:
- Harga FAW Lure: https://rumahbioindonesia.web.indotrading.com/product/faw-lure-perangkap-feromon-pengendali-hama-ulat-jagung-p1203442.aspx
- Feromon untuk Spodoptera frugiperda: https://repository.unhas.ac.id/id/eprint/32240/3/G011191112_skripsi_15-01-2024%201-2.pdf
- Potensi feromon pada ulat grayak jagung: https://www.researchgate.net/publication/366325518_Potensi_Pengendalian_Ulat_Grayak_Spodoptera_frugiperda_JE_SMITH_Pada_Tanaman_Jagung_Menggunakan_Feromon_Sex
- Feromon berperan sebagai atraktan, mating disruption, dan mass trapping: https://ejournal.unsrat.ac.id/v3/index.php/samrat-agrotek/article/download/44343/40540/100655
- Tips PHT ulat grayak jagung: https://spi.or.id/tips-pengendalian-hama-tanaman-pht-ulat-grayak-pada-tanaman-jagung/

---

### 4.13 Yellow Sticky Trap

| Field | Isi |
|---|---|
| Nama UI | Yellow Sticky Trap |
| Nama file | `perlintan-yellow-sticky-trap.jpg` |
| Jenis | Monitoring / perangkap visual |
| Target umum | Serangga terbang kecil yang tertarik warna kuning |
| Relevan untuk | Kedelai, Jagung, Padi opsional; lebih umum hortikultura, tetapi tetap bisa jadi item monitoring |
| Fase penggunaan | Awal pertumbuhan sampai vegetatif |
| Satuan umum | lembar, pack 10 lembar, pack 20 lembar |
| Harga referensi | Perlu verifikasi ulang dari toko spesifik |
| Status harga | PERLU_VERIFIKASI_HARGA |
| Fungsi utama | Monitoring keberadaan serangga terbang dan sebagian hama kecil |
| Keunggulan | Murah, visual, mudah dipahami user |
| Risiko/keterbatasan | Tidak spesifik; bisa menangkap serangga non-target; lebih cocok monitoring daripada pengendalian utama |
| Catatan UI | Bisa dibuat sebagai item “monitoring hama”, bukan “obat” |

Deskripsi card UI:

> Yellow sticky trap adalah perangkap berperekat warna kuning untuk monitoring serangga terbang kecil. Dalam AgroTrack, item ini cocok sebagai perlindungan non-kimia dan alat pemantauan.

Sumber:
- PHT umum dan monitoring: https://eprints.unm.ac.id/21977/1/Buku%20Pengendalian%20Hama%20dan%20Penyakit%20Tanaman%20Pangan%20dan%20Hortikultura.pdf
- Catatan harga: belum dimasukkan angka final karena perlu verifikasi produk/kemasan yang stabil. Untuk seed awal, gunakan `harga_status = PERLU_VERIFIKASI_HARGA`.

---

### 4.14 Perangkap Tikus Sawah

| Field | Isi |
|---|---|
| Nama UI | Perangkap Tikus Sawah |
| Nama file | `perlintan-perangkap-tikus.jpg` |
| Jenis | Mekanis / Trap Barrier System / bubu |
| Target umum | Tikus sawah |
| Relevan untuk | Padi terutama; jagung opsional |
| Fase penggunaan | Pra-tanam sampai generatif |
| Satuan umum | unit, set perangkap, bubu |
| Harga referensi | Perlu verifikasi lokal karena banyak dibuat sendiri atau berbasis set TBS |
| Status harga | PERLU_VERIFIKASI_LAPANGAN |
| Fungsi utama | Menangkap tikus secara mekanis; bagian dari pengendalian tikus terpadu |
| Keunggulan | Mengurangi ketergantungan pada racun; cocok untuk narasi PHT |
| Risiko/keterbatasan | Efektif bila dipasang tepat dan dikelola bersama/hamparan; biaya bergantung model |
| Catatan UI | Tampilkan sebagai alternatif rodentisida dan bagian PHTT |

Deskripsi card UI:

> Perangkap tikus sawah digunakan dalam pengendalian tikus secara mekanis, termasuk konsep bubu atau Trap Barrier System. Cocok untuk padi dan lebih aman sebagai alternatif/pendamping rodentisida.

Sumber:
- Sistem perangkap bubu tikus: https://repository.pertanian.go.id/bitstreams/794c9aed-2442-4f78-bd42-0337e832d43b/download
- Pengendalian tikus sawah dengan perangkap: https://journal.lppm-unasman.ac.id/index.php/agrovital/article/view/2004
- Pengendalian hama tikus di lahan sawah: https://dkpp.klaten.go.id/pengendalian-hama-tikus-di-lahan-sawah
- Cara pengendalian tikus, TBS dan gropyokan: https://dinperta.bojonegorokab.go.id/berita/baca/136
- Teknik pengendalian hama tikus sawah: https://distankan.bulelengkab.go.id/informasi/detail/artikel/teknik-pengendalian-hama-tikus-sawah-48

---

## 5. Pembagian Relevansi per Tanaman

| Item | Padi | Jagung | Kedelai | Catatan |
|---|---|---|---|---|
| Herbisida | Sangat relevan | Sangat relevan | Sangat relevan | Untuk gulma; harus sesuai label tanaman |
| Insektisida | Sangat relevan | Sangat relevan | Sangat relevan | Berdasarkan monitoring hama |
| Fungisida | Relevan | Relevan | Relevan | Untuk penyakit jamur/cendawan |
| Moluskisida | Sangat relevan di padi sawah | Rendah | Rendah | Khusus keong/siput |
| Rodentisida | Relevan | Relevan | Opsional | Hati-hati hewan non-target |
| Nematisida | Opsional | Opsional | Opsional | Kondisi khusus hama tanah/nematoda |
| Akarisida | Opsional | Opsional | Relevan bila ada tungau | Lebih spesifik daripada insektisida umum |
| Perekat/Perata | Relevan | Relevan | Relevan | Bahan bantu aplikasi semprot |
| Trichoderma | Relevan | Relevan | Relevan | Agens hayati tanah/penyakit |
| Beauveria | Relevan | Relevan | Relevan | Agens hayati serangga |
| Metarhizium | Relevan | Relevan | Relevan | Agens hayati serangga/hama tertentu |
| Perangkap feromon | Opsional | Sangat relevan untuk ulat grayak jagung | Opsional | Spesifik target hama |
| Yellow sticky trap | Opsional | Opsional | Opsional | Lebih kuat sebagai alat monitoring |
| Perangkap tikus | Sangat relevan | Relevan | Rendah | Lebih cocok padi sawah |

---

## 6. Rekomendasi Tampilan UI AgroTrack

### 6.1 Kelompok UI

Jangan semua dimasukkan ke satu grid “obat”. Pecah menjadi:

1. **Kimia Perlindungan**
   - Herbisida
   - Insektisida
   - Fungisida
   - Moluskisida
   - Rodentisida
   - Nematisida
   - Akarisida

2. **Bahan Bantu Semprot**
   - Perekat
   - Perata
   - Penembus

3. **Perlindungan Hayati**
   - Trichoderma
   - Beauveria
   - Metarhizium

4. **Monitoring & Perangkap**
   - Perangkap feromon
   - Yellow sticky trap
   - Perangkap tikus

### 6.2 Card Katalog

Contoh card:

```text
[Foto Item]
Herbisida Gulma
Kategori: Perlindungan Tanaman
Jenis: Kimia
Fase: Pra-tanam / Vegetatif
Cocok untuk: Padi, Jagung, Kedelai
Harga acuan: Rp50.000 – Rp114.400 / 1 liter
Fungsi: Mengendalikan gulma yang bersaing dengan tanaman utama
Catatan: Gunakan sesuai label produk
Tombol: Tambahkan ke Rencana Operasional
```

### 6.3 Badge Risiko

| Badge | Makna |
|---|---|
| `Gunakan sesuai label` | Untuk pestisida kimia dan adjuvant |
| `PHT` | Cocok untuk pendekatan pengendalian hama terpadu |
| `Hayati` | Agens pengendali hayati |
| `Monitoring` | Untuk pemantauan, bukan biaya semprot utama |
| `Kondisi khusus` | Dipakai jika ada masalah spesifik |
| `Harga berubah` | Harga mengikuti toko, wilayah, dan kemasan |

### 6.4 Field Tambahan yang Disarankan

Untuk item perlindungan tanaman, database sebaiknya punya field tambahan:

```text
jenis_perlindungan:
- kimia
- hayati
- mekanis
- monitoring
- adjuvant

target_opt:
- gulma
- serangga
- jamur
- keong/siput
- tikus
- nematoda
- tungau
- hama spesifik

peringatan_penggunaan:
- Ikuti label produk
- Gunakan APD
- Jangan mencampur produk tanpa petunjuk
- Hindari aplikasi berlebihan
```

---

## 7. Rekomendasi Database

Tabel `saprodi_items` bisa dipakai sama seperti katalog benih, pupuk, dan pembenah tanah. Tambahan field khusus perlintan:

```sql
ALTER TABLE saprodi_items
ADD COLUMN jenis_perlindungan ENUM('kimia','hayati','mekanis','monitoring','adjuvant') NULL,
ADD COLUMN target_opt VARCHAR(150) NULL,
ADD COLUMN bahan_aktif VARCHAR(150) NULL,
ADD COLUMN formulasi VARCHAR(50) NULL,
ADD COLUMN peringatan_penggunaan TEXT NULL;
```

Atau jika ingin dari awal:

```sql
CREATE TABLE IF NOT EXISTS saprodi_items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  tanaman_id INT NULL,
  kategori VARCHAR(100) NOT NULL,
  subkategori VARCHAR(100) NULL,
  jenis_perlindungan ENUM('kimia','hayati','mekanis','monitoring','adjuvant') NULL,
  target_opt VARCHAR(150) NULL,
  nama_item VARCHAR(150) NOT NULL,
  nama_file_asset VARCHAR(255) NULL,
  bahan_aktif VARCHAR(150) NULL,
  formulasi VARCHAR(50) NULL,
  fase_penggunaan VARCHAR(100) NULL,
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
  peringatan_penggunaan TEXT NULL,
  status ENUM('aktif','nonaktif') DEFAULT 'aktif',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

---

## 8. Contoh SQL Seed

```sql
INSERT INTO saprodi_items
(kategori, subkategori, jenis_perlindungan, target_opt, nama_item, nama_file_asset, fase_penggunaan, satuan_harga, harga_min, harga_max, harga_status, sumber_harga, tanggal_cek_harga, fungsi, keunggulan, keterbatasan, catatan_penggunaan, peringatan_penggunaan)
VALUES
('Perlindungan Tanaman','Kimia','kimia','Gulma','Herbisida Gulma','perlintan-herbisida.jpg','Pra-tanam / awal pertumbuhan / vegetatif','1 liter',50000,114400,'TERVERIFIKASI_MARKETPLACE','Shopee dan Lazada contoh herbisida 1 liter','2026-06-16','Mengendalikan gulma yang bersaing dengan tanaman utama.','Mengurangi kebutuhan penyiangan manual.','Salah aplikasi dapat merusak tanaman dan memicu resistensi.','Dipakai berdasarkan kondisi gulma.','Gunakan sesuai label produk dan gunakan APD.'),

('Perlindungan Tanaman','Kimia','kimia','Serangga hama','Insektisida Hama Serangga','perlintan-insektisida.jpg','Awal pertumbuhan / vegetatif / generatif','100 ml / 250 ml',24225,195000,'TERVERIFIKASI_MARKETPLACE','Shopee, Lazada, Blibli, PertanianIndonesia','2026-06-16','Mengendalikan hama serangga sesuai target label.','Respon cepat untuk serangan tertentu.','Dapat membunuh musuh alami dan memicu resistensi.','Pilih setelah monitoring OPT.','Gunakan sesuai label produk dan jangan mencampur sembarangan.'),

('Perlindungan Tanaman','Kimia','kimia','Penyakit jamur/cendawan','Fungisida Penyakit Jamur','perlintan-fungisida.jpg','Vegetatif / generatif','250 g / 500 g / 250 ml',25740,178100,'TERVERIFIKASI_MARKETPLACE','Lazada, Tanitoon, Toco, BASF, Syngenta','2026-06-16','Mengendalikan penyakit tanaman akibat jamur/cendawan.','Relevan saat kelembapan tinggi atau gejala penyakit muncul.','Penggunaan berulang mode kerja sama dapat memicu resistensi.','Catat bahan aktif jika memakai produk spesifik.','Gunakan sesuai label produk.'),

('Perlindungan Tanaman','Kimia','kimia','Keong/siput','Moluskisida Keong/Siput','perlintan-moluskisida.jpg','Awal tanam padi sawah','15 g / 50 g / 100 g / 450 ml',13250,85000,'TERVERIFIKASI_MARKETPLACE','Lazada, Blibli, BigGo','2026-06-16','Mengendalikan keong/siput terutama pada padi sawah.','Relevan pada fase tanaman muda di sawah.','Tidak relevan untuk semua lahan dan harus hati-hati di area perairan.','Badge: Padi sawah, kondisi khusus.','Gunakan sesuai label produk.'),

('Perlindungan Tanaman','Kimia','kimia','Tikus/pengerat','Rodentisida Tikus','perlintan-rodentisida.jpg','Pra-tanam / vegetatif / generatif','100 g / 1 kg',7500,90000,'TERVERIFIKASI_MARKETPLACE','Lazada, Shopee, Blibli','2026-06-16','Mengendalikan hama tikus melalui umpan/racun.','Bisa dipakai saat serangan tikus tinggi.','Berisiko terhadap hewan non-target dan manusia.','Sertakan alternatif perangkap/TBS.','Gunakan aman, jauhkan dari anak/hewan non-target.'),

('Perlindungan Tanaman','Kimia','kimia','Nematoda/hama tanah','Nematisida Nematoda/Hama Tanah','perlintan-nematisida.jpg','Pra-tanam / tanam / awal pertumbuhan','100 g / 1 kg / 100 ml',4730,142000,'TERVERIFIKASI_MARKETPLACE','Lazada, Shopee, Blibli, PertanianIndonesia','2026-06-16','Mengendalikan nematoda atau hama tanah tertentu sesuai label.','Relevan untuk masalah akar/hama tanah.','Tidak boleh jadi biaya default; hanya kondisi khusus.','Badge: kondisi khusus.','Gunakan sesuai label produk.'),

('Perlindungan Tanaman','Kimia','kimia','Tungau/mites','Akarisida Tungau','perlintan-akarisida.jpg','Vegetatif / generatif','250 ml',40000,110000,'TERVERIFIKASI_MARKETPLACE','Purotani, Shopee, Lazada, Blibli, PertanianIndonesia','2026-06-16','Mengendalikan hama tungau.','Lebih spesifik daripada insektisida umum.','Tidak semua komoditas perlu akarisida; risiko resistensi tetap ada.','Lebih relevan untuk kedelai bila ada tungau.','Gunakan sesuai label produk.'),

('Perlindungan Tanaman','Bahan Bantu Semprot','adjuvant','Aplikasi semprot','Perekat, Perata, Penembus Semprot','perlintan-perekat-perata.jpg','Saat aplikasi semprot','250 ml / 500 ml / 1 liter',16000,90000,'TERVERIFIKASI_MARKETPLACE','Shopee, Lazada, Blibli, KampoengTani','2026-06-16','Membantu larutan semprot lebih merata dan menempel.','Mencatat biaya semprot yang sering terlupakan.','Tidak semua produk boleh dicampur adjuvant.','Bukan pestisida utama.','Ikuti label pestisida dan adjuvant.'),

('Perlindungan Tanaman','Hayati','hayati','Patogen tanah/jamur tertentu','Agens Hayati Trichoderma','perlintan-trichoderma.jpg','Pra-tanam / awal pertumbuhan','100 g / 500 g / 1 kg',23750,102500,'TERVERIFIKASI_MARKETPLACE','Shopee, UNNES, Buku Saku APH','2026-06-16','Mendukung pengendalian hayati penyakit tanaman dan kesehatan tanah.','Selaras dengan PHT.','Efektivitas tergantung strain, viabilitas, kelembapan, dan aplikasi.','Agens hayati, bukan obat instan.','Simpan sesuai petunjuk produk.'),

('Perlindungan Tanaman','Hayati','hayati','Serangga hama','Agens Hayati Beauveria bassiana','perlintan-beauveria.jpg','Vegetatif / monitoring hama','50 g / 100 g / 1 kg',12900,49900,'TERVERIFIKASI_MARKETPLACE','Lazada, Shopee, Blibli, literatur Beauveria','2026-06-16','Cendawan entomopatogen untuk membantu mengendalikan hama serangga tertentu.','Lebih ramah lingkungan dan sesuai PHT.','Kerja lebih lambat dan dipengaruhi lingkungan.','Tampilkan sebagai Perlindungan Hayati.','Simpan dan aplikasikan sesuai label.'),

('Perlindungan Tanaman','Hayati','hayati','Serangga/hama tanah tertentu','Agens Hayati Metarhizium anisopliae','perlintan-metarhizium.jpg','Vegetatif / monitoring hama','50 g / produk',30000,98000,'TERVERIFIKASI_MARKETPLACE','Blibli, Shopee, Lazada, literatur Metarhizium','2026-06-16','Cendawan entomopatogen untuk menekan hama serangga tertentu.','Mendukung PHT dan pengurangan ketergantungan kimia.','Efektivitas tergantung strain, formulasi, dan lingkungan.','Jangan klaim membasmi semua hama.','Simpan dan aplikasikan sesuai label.'),

('Perlindungan Tanaman','Monitoring','monitoring','Hama spesifik/ulat grayak jagung','Perangkap Feromon','perlintan-perangkap-feromon.jpg','Monitoring vegetatif-generatif','unit / lure',55500,55500,'TERVERIFIKASI_PRODUK_SPESIFIK','Indotrading/Rumah Bio Indonesia dan literatur feromon FAW','2026-06-16','Menarik hama tertentu untuk monitoring/perangkap massal.','Lebih spesifik dan ramah lingkungan.','Harus sesuai target hama.','Sangat relevan untuk jagung bila target hama cocok.','Pasang sesuai petunjuk produk.'),

('Perlindungan Tanaman','Monitoring','monitoring','Serangga terbang kecil','Yellow Sticky Trap','perlintan-yellow-sticky-trap.jpg','Awal pertumbuhan / vegetatif','lembar / pack',NULL,NULL,'PERLU_VERIFIKASI_HARGA','Belum dipilih produk/kemasan stabil','2026-06-16','Monitoring serangga terbang kecil.','Murah, visual, mudah dipahami.','Tidak spesifik dan bisa menangkap non-target.','Alat monitoring, bukan obat.','Pasang sesuai kebutuhan monitoring.'),

('Perlindungan Tanaman','Mekanis','mekanis','Tikus sawah','Perangkap Tikus Sawah','perlintan-perangkap-tikus.jpg','Pra-tanam sampai generatif','unit / set',NULL,NULL,'PERLU_VERIFIKASI_LAPANGAN','Harga tergantung model bubu/TBS/lokal','2026-06-16','Menangkap tikus secara mekanis.','Mengurangi ketergantungan rodentisida.','Efektif bila dipasang dan dikelola tepat.','Alternatif PHTT/TBS untuk padi.','Periksa perangkap rutin dan kelola bersama hamparan.');
```

---

## 9. Prioritas Masuk MVP AgroTrack

Prioritas realistis untuk MVP:

1. Herbisida
2. Insektisida
3. Fungisida
4. Moluskisida
5. Rodentisida
6. Perekat/Perata
7. Trichoderma
8. Beauveria
9. Perangkap Feromon
10. Perangkap Tikus

Prioritas tambahan:

11. Metarhizium
12. Akarisida
13. Nematisida
14. Yellow Sticky Trap

Alasan:
- MVP perlu menampilkan perlindungan kimia utama dan opsi PHT/hayati.
- Nematisida, akarisida, dan sticky trap tetap berguna, tetapi tidak selalu relevan untuk padi-jagung-kedelai skala umum.
- Perangkap tikus dan moluskisida kuat untuk padi, sedangkan perangkap feromon kuat untuk jagung.

---

## 10. Copy UI Singkat per Item

| Item | Copy pendek untuk card |
|---|---|
| Herbisida | Mengendalikan gulma yang bersaing dengan tanaman utama. |
| Insektisida | Mengendalikan hama serangga sesuai monitoring OPT. |
| Fungisida | Mengendalikan penyakit tanaman akibat jamur/cendawan. |
| Moluskisida | Mengendalikan keong/siput, terutama pada padi sawah. |
| Rodentisida | Mengendalikan tikus, dengan perhatian khusus pada keamanan. |
| Nematisida | Perlindungan khusus untuk nematoda atau hama tanah tertentu. |
| Akarisida | Perlindungan khusus untuk hama tungau. |
| Perekat/Perata | Bahan bantu agar larutan semprot lebih merata dan menempel. |
| Trichoderma | Agens hayati untuk mendukung kesehatan tanah dan pengendalian penyakit. |
| Beauveria | Agens hayati untuk membantu mengendalikan hama serangga. |
| Metarhizium | Agens hayati untuk menekan hama serangga tertentu. |
| Perangkap Feromon | Alat monitoring/perangkap hama spesifik seperti ulat grayak jagung. |
| Yellow Sticky Trap | Perangkap visual untuk monitoring serangga terbang kecil. |
| Perangkap Tikus | Perangkap mekanis untuk pengendalian tikus sawah. |

---

## 11. Referensi Utama

1. Permentan No. 43 Tahun 2019 tentang Pendaftaran Pestisida.  
   https://peraturan.bpk.go.id/Home/Details/201255/permentan-no-43-tahun-2019

2. Permentan No. 39 Tahun 2015 tentang Pendaftaran Pestisida.  
   https://peraturan.bpk.go.id/Download/153140/Permentan%20Nomor%2039%20Tahun%202015%20%281%29.pdf

3. Buku Pengendalian Hama dan Penyakit Tanaman Pangan dan Hortikultura.  
   https://eprints.unm.ac.id/21977/1/Buku%20Pengendalian%20Hama%20dan%20Penyakit%20Tanaman%20Pangan%20dan%20Hortikultura.pdf

4. Syngenta — Produk Crop Protection.  
   https://www.syngenta.co.id/products/search/crop-protection

5. BASF — Cabrio Top 60 WG.  
   https://petani-sejahtera.basf.co.id/fungisida/cabrio-top-60-wg

6. Syngenta — Score 250 EC.  
   https://www.syngenta.co.id/product/crop-protection/fungisida/score-250-ec

7. Repository Pertanian — Pengelompokan pestisida berdasarkan cara kerja.  
   https://repository.pertanian.go.id/bitstreams/fb10a9c5-1dc5-4d30-9771-7b0efec772b3/download

8. UNNES — Pembiakan jamur agensia hayati Beauveria, Metarhizium, dan Trichoderma.  
   https://bookchapter.unnes.ac.id/index.php/ka/article/download/170/165

9. Buku Saku APH Bali.  
   https://distanpangan.baliprov.go.id/wp-content/uploads/2023/08/Buku-Saku-APH.pdf

10. Beauveria bassiana: Biopestisida Ramah Lingkungan.  
    https://media.neliti.com/media/publications/381544-none-e4bd3472.pdf

11. Feromon FAW Lure untuk ulat grayak jagung.  
    https://repository.unhas.ac.id/id/eprint/32240/3/G011191112_skripsi_15-01-2024%201-2.pdf

12. FAW Lure harga produk.  
    https://rumahbioindonesia.web.indotrading.com/product/faw-lure-perangkap-feromon-pengendali-hama-ulat-jagung-p1203442.aspx

13. Sistem Perangkap Bubu Tikus.  
    https://repository.pertanian.go.id/bitstreams/794c9aed-2442-4f78-bd42-0337e832d43b/download

14. Teknik Pengendalian Hama Tikus Sawah.  
    https://distankan.bulelengkab.go.id/informasi/detail/artikel/teknik-pengendalian-hama-tikus-sawah-48

15. Shopee — Herbisida 1 liter.  
    https://shopee.co.id/herbisida-pembasmi-rumput-roundup-gramoxone-1Liter-original-i.100782208.41321416071

16. Lazada — Herbisida 1 liter.  
    https://www.lazada.co.id/tag/gramoxone-dan-roundup-1-liter/

17. Shopee — Insektisida Regent.  
    https://shopee.co.id/obat-pertanian-insektisida-REGENT-lama-100ml-250ml-i.281001279.14896269315

18. Lazada — Insektisida Sumo 250 ml.  
    https://www.lazada.co.id/tag/insextisida-sumo-250ml/

19. Lazada — Fungisida pertanian.  
    https://www.lazada.co.id/tag/pertanian-obat-fungisida/

20. Tanitoon — Fungisida.  
    https://tanitoon.com/Produk-Tag/fungisida/

21. Lazada — Obat keong.  
    https://www.lazada.co.id/tag/obat-keong-mas-di-sawah/

22. Blibli — Pembasmi keong.  
    https://www.blibli.com/jual/pembasmi-keong

23. Shopee — Rodentisida.  
    https://shopee.co.id/list/Rodentisida

24. Blibli — Obat tikus sawah.  
    https://www.blibli.com/jual/obat-tikus-sawah

25. PertanianIndonesia — Nematisida.  
    https://pertanianindonesia.com/nematisida

26. Lazada — Velum Prime nematisida.  
    https://www.lazada.co.id/tag/obat-pertanian-velum-100-ml/

27. Purotani — Samite akarisida 250 ml.  
    https://purotani.id/product/insektisida-akarisida-samite-250-ml-cap-kapal-terbang/

28. Shopee — Perekat/perata Cluster 500 ml.  
    https://shopee.co.id/Penembus-Perekat-Perata-Pestisida-CLUSTER-500ml-i.216799210.6051112362

29. KampoengTani — Axer 250 ml.  
    https://kampoengtani.com/product/axer-250-ml-perekat-penembus-perata-pestisida/

30. Shopee — Trichoderma.  
    https://shopee.co.id/search?keyword=trichoderma+sp

31. Lazada — Beauveria bassiana.  
    https://www.lazada.co.id/tag/beauveria-bassiana-obat/

32. Blibli — Metarhizium anisopliae.  
    https://www.blibli.com/jual/metarhizium-anisopliae
