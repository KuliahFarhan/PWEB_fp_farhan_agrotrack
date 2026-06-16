# AgroTrack — Katalog Pembenah Tanah untuk Padi, Jagung, dan Kedelai

**Versi:** 1.0  
**Tanggal penyusunan:** 16 Juni 2026  
**Kategori:** Pembenah Tanah / Soil Conditioner  
**Target komoditas:** Padi, Jagung, Kedelai  
**Fungsi dokumen:** Referensi awal untuk seed database, UI katalog saprodi, dan card asset AgroTrack.

---

## 1. Catatan Validitas Data

Dokumen ini dibuat untuk katalog AgroTrack, bukan sebagai rekomendasi dosis agronomi final. Pembenah tanah sebaiknya digunakan berdasarkan kondisi tanah, riwayat lahan, pH, bahan organik, drainase, salinitas, dan hasil uji tanah bila tersedia.

Aturan data yang dipakai:

1. **Harga tidak dipukul rata.** Setiap item memakai sumber harga internet yang berbeda.
2. **Harga bersifat referensi katalog**, bukan harga final toko. Harga dapat berubah karena wilayah, ongkir, stok, kemasan, merek, dan promo.
3. **Jika harga tidak cukup kuat**, status ditulis `PERLU_VERIFIKASI`, bukan dikarang.
4. **Fungsi agronomi ditulis umum**, bukan dosis wajib.
5. **Aplikasi AgroTrack sebaiknya menampilkan disclaimer**: “Gunakan sesuai kondisi lahan dan anjuran penyuluh/label produk.”

Sumber dasar konsep:
- Pembenah tanah digunakan untuk memperbaiki kualitas tanah dan mendukung produktivitas tanaman.  
  https://media.neliti.com/media/publications/133114-ID-pembenah-tanah-untuk-meningkatkan-produk.pdf
- Pupuk organik, pupuk hayati, dan pembenah tanah termasuk kategori yang diatur pendaftaran/persyaratan teknisnya oleh regulasi pertanian.  
  https://peraturan.bpk.go.id/Download/266197/Permentan%20Nomor%201%20Tahun%202019.pdf  
  https://peraturan.bpk.go.id/Download/152724/Permentan%20Nomor%2070%20Tahun%202011.pdf

---

## 2. Asset yang Sudah Disiapkan

| No | Nama File Asset | Nama Item UI | Status |
|---:|---|---|---|
| 1 | `pembenah-dolomit.jpg` | Dolomit / Kapur Dolomit | Siap pakai |
| 2 | `pembenah-kapur-pertanian.jpg` | Kapur Pertanian / Kaptan / Kalsit | Siap pakai |
| 3 | `pembenah-zeolit.jpg` | Zeolit Pertanian | Siap pakai |
| 4 | `pembenah-biochar.jpg` | Biochar / Arang Hayati | Siap pakai |
| 5 | `pembenah-arang-sekam.jpg` | Arang Sekam | Siap pakai |
| 6 | `pembenah-kompos.jpg` | Kompos Matang | Siap pakai |
| 7 | `pembenah-pupuk-kandang.jpg` | Pupuk Kandang Matang | Siap pakai |
| 8 | `pembenah-asam-humat.jpg` | Asam Humat / Humic Acid | Siap pakai |
| 9 | `pembenah-gypsum.jpg` | Gypsum Pertanian / Kalsium Sulfat | Siap pakai |
| 10 | `pembenah-dekomposer.jpg` | Dekomposer Bahan Organik | Siap pakai |

Rekomendasi folder:

```text
assets/img/saprodi/pembenah-tanah/
```

---

## 3. Ringkasan Katalog Pembenah Tanah

| No | Item | File Asset | Fase Penggunaan | Komoditas Relevan | Satuan Harga | Harga Referensi Internet | Status Harga |
|---:|---|---|---|---|---|---:|---|
| 1 | Dolomit / Kapur Dolomit | `pembenah-dolomit.jpg` | Pra-tanam | Padi, Jagung, Kedelai | 50 kg / zak | Rp66.000 – Rp150.000 | TERVERIFIKASI_MARKETPLACE |
| 2 | Kapur Pertanian / Kaptan / Kalsit | `pembenah-kapur-pertanian.jpg` | Pra-tanam | Padi, Jagung, Kedelai | 50 kg / zak | Rp66.000 – Rp150.000 | TERVERIFIKASI_SEBAGIAN |
| 3 | Zeolit Pertanian | `pembenah-zeolit.jpg` | Pra-tanam / dasar | Padi, Jagung, Kedelai | 1 kg / 2 kg / 50 kg | Rp15.000/kg, Rp22.500–25.000/2 kg, ±Rp198.000–270.000/50 kg | TERVERIFIKASI_MARKETPLACE |
| 4 | Biochar / Arang Hayati | `pembenah-biochar.jpg` | Pra-tanam / dasar | Padi, Jagung, Kedelai | 1 kg / 5 kg / ton | Rp47.000–75.000/5 kg; ±Rp1.000–1.500/kg referensi produksi/skala besar | TERVERIFIKASI_SEBAGIAN |
| 5 | Arang Sekam | `pembenah-arang-sekam.jpg` | Pra-tanam / media/pembenah | Padi, Jagung, Kedelai | kg / liter / karung | Rp8.900–22.900 untuk kemasan kecil media tanam; perlu verifikasi untuk karung pertanian | PERLU_VERIFIKASI_LAPANGAN |
| 6 | Kompos Matang | `pembenah-kompos.jpg` | Pra-tanam / dasar | Padi, Jagung, Kedelai | 25 kg / sak | Rp52.000–75.000/25 kg | TERVERIFIKASI_MARKETPLACE |
| 7 | Pupuk Kandang Matang | `pembenah-pupuk-kandang.jpg` | Pra-tanam / dasar | Padi, Jagung, Kedelai | 5 kg / 10 kg / 25 kg / 50 kg | Rp88.550/25 kg; Rp172.500/50 kg; sumber lain Rp85.000–125.000/25 kg | TERVERIFIKASI_MARKETPLACE |
| 8 | Asam Humat / Humic Acid | `pembenah-asam-humat.jpg` | Pra-tanam / awal pertumbuhan | Padi, Jagung, Kedelai | 1 kg / 1 liter | Rp28.999–39.999/kg; produk premium bisa Rp80.000–90.900/kg | TERVERIFIKASI_MARKETPLACE |
| 9 | Gypsum Pertanian / Kalsium Sulfat | `pembenah-gypsum.jpg` | Pra-tanam / koreksi tanah tertentu | Padi, Jagung, Kedelai pada kondisi tertentu | 25 kg / sak | Rp150.000–185.000/25 kg untuk produk Gypblend; harga gypsum umum bervariasi | TERVERIFIKASI_PRODUK_SPESIFIK |
| 10 | Dekomposer Bahan Organik | `pembenah-dekomposer.jpg` | Pra-tanam / pengomposan sisa tanaman | Padi, Jagung, Kedelai | 1 kg / 1 liter | Rp21.200–28.083/kg untuk Stardec; Rp23.177–49.950/L untuk EM4; Rp42.500–85.000/L untuk produk dekomposer lain | TERVERIFIKASI_MARKETPLACE |

---

## 4. Detail Item Katalog

### 4.1 Dolomit / Kapur Dolomit

| Field | Isi |
|---|---|
| Nama UI | Dolomit / Kapur Dolomit |
| Nama file | `pembenah-dolomit.jpg` |
| Kategori | Pembenah Tanah |
| Subkategori | Pengapuran / pH correction |
| Fase penggunaan | Pra-tanam |
| Relevan untuk | Padi, Jagung, Kedelai, terutama pada tanah masam |
| Satuan umum | kg, zak 25 kg, zak 50 kg |
| Harga referensi | Rp66.000/50 kg sampai Rp150.000/50 kg |
| Status harga | TERVERIFIKASI_MARKETPLACE |
| Sumber harga | BibitBunga mencantumkan dolomit 50 kg Rp66.000; Shopee/Lazada menampilkan kisaran sekitar Rp67.500–150.000 untuk 50 kg |
| Fungsi utama | Membantu menaikkan pH tanah masam dan memasok Ca/Mg |
| Keunggulan | Cocok untuk lahan masam; membantu ketersediaan hara; murah per kg dibanding banyak input lain |
| Keterbatasan | Tidak semua lahan butuh dolomit; dosis berlebih dapat mengganggu keseimbangan hara |
| Catatan UI | Tampilkan sebagai item “pra-tanam” dan beri label “gunakan berdasarkan pH tanah” |

Deskripsi card UI:

> Dolomit digunakan sebagai pembenah tanah untuk membantu menaikkan pH tanah masam dan menambah unsur kalsium serta magnesium. Umumnya diaplikasikan sebelum tanam agar bereaksi lebih dulu di tanah.

Sumber:
- Harga: https://bibitbunga.com/product/pupuk-kapur-pertanian-dolomit-dolomite-1-zak-50kg-50-kg-kaptan-murah/
- Harga: https://www.lazada.co.id/tag/kapur-pertanian-dolomit-50-kg/
- Harga: https://shopee.co.id/Kapur-Dolomit-50-Kg-Via-Instan-Pupuk-Dolomite-Kalsium-Super-Pertanian-Tani-Ternak-Tambak-Alas-Gecko-Reptil-i.135032082.15457921889
- Fungsi: https://rsud.bulelengkab.go.id/informasi/detail/artikel/87-dolomit-ampuh-bantu-meningkatkan-ph-tanah-menetralkan-kadar-keasaman
- Fungsi ilmiah: https://journal.ipb.ac.id/JIPI/article/download/43330/25144/

---

### 4.2 Kapur Pertanian / Kaptan / Kalsit

| Field | Isi |
|---|---|
| Nama UI | Kapur Pertanian / Kaptan / Kalsit |
| Nama file | `pembenah-kapur-pertanian.jpg` |
| Kategori | Pembenah Tanah |
| Subkategori | Pengapuran |
| Fase penggunaan | Pra-tanam |
| Relevan untuk | Padi, Jagung, Kedelai pada tanah masam |
| Satuan umum | kg, zak 25 kg, zak 50 kg |
| Harga referensi | Rp66.000–150.000/50 kg sebagai acuan pasar kapur/dolomit; harga kalsit spesifik perlu verifikasi |
| Status harga | TERVERIFIKASI_SEBAGIAN |
| Sumber harga | Data marketplace lebih banyak menampilkan dolomit/kaptan daripada kalsit murni |
| Fungsi utama | Menaikkan pH tanah asam; memasok kalsium; memperbaiki reaksi tanah |
| Keunggulan | Cocok untuk correction pH; lebih sederhana daripada input kimia kompleks |
| Keterbatasan | Perlu pH tanah; tidak identik dengan pupuk utama; efek bergantung tekstur dan kondisi tanah |
| Catatan UI | Pisahkan dari dolomit: kapur/kalsit dominan Ca, sedangkan dolomit memasok Ca dan Mg |

Deskripsi card UI:

> Kapur pertanian digunakan untuk mengurangi kemasaman tanah. Item ini cocok ditampilkan sebagai pembenah tanah pra-tanam, terutama bila pH tanah terlalu rendah.

Sumber:
- Fungsi umum kapur pertanian: https://jurnal.penerbitwidina.com/index.php/JPMWidina/article/download/2041/1508
- Harga acuan dolomit/kaptan: https://bibitbunga.com/product/pupuk-kapur-pertanian-dolomit-dolomite-1-zak-50kg-50-kg-kaptan-murah/
- Harga acuan marketplace: https://www.lazada.co.id/tag/kapur-kalsit-50kg/
- Catatan: harga kalsit murni untuk pertanian perlu diverifikasi dari toko/supplier lokal sebelum masuk angka final database.

---

### 4.3 Zeolit Pertanian

| Field | Isi |
|---|---|
| Nama UI | Zeolit Pertanian |
| Nama file | `pembenah-zeolit.jpg` |
| Kategori | Pembenah Tanah |
| Subkategori | Mineral pembenah / adsorben |
| Fase penggunaan | Pra-tanam / pupuk dasar |
| Relevan untuk | Padi, Jagung, Kedelai, khususnya lahan dengan masalah retensi hara/air |
| Satuan umum | 1 kg, 2 kg, 50 kg |
| Harga referensi | Rp15.000/kg; Rp22.500–25.000/2 kg; Rp198.000–270.000/50 kg |
| Status harga | TERVERIFIKASI_MARKETPLACE |
| Fungsi utama | Mendukung perbaikan sifat tanah, daya simpan air/hara, dan efisiensi hara |
| Keunggulan | Dapat dipakai sebagai mineral pembenah; relatif stabil; sering dikaitkan dengan KTK/daya tukar kation |
| Keterbatasan | Manfaat sangat bergantung tipe zeolit, ukuran partikel, dosis, dan kondisi tanah |
| Catatan UI | Jangan klaim sebagai pupuk utama; tampilkan sebagai “pembenah mineral” |

Deskripsi card UI:

> Zeolit adalah mineral aluminosilikat berpori yang dapat digunakan sebagai pembenah tanah dan adsorben. Dalam katalog AgroTrack, zeolit lebih tepat ditampilkan sebagai pembenah mineral, bukan sebagai pengganti pupuk utama.

Sumber:
- Konsep zeolit: https://unnes.ac.id/mipa/id/2021/07/14/mengenal-zeolit-alam-dari-sukabumi-dan-cara-meningkatkan-kemampuan-adsorpsinya/
- Harga Blibli: https://www.blibli.com/jual/zeolit-pertanian
- Harga Lazada 50 kg: https://www.lazada.co.id/tag/zeolite-pertanian-50-kg/
- Harga Shopee 50 kg: https://shopee.co.id/PUPUK-PAK-TANI-ZSP-36-BERAT-50-KG-ZEOLIT-KEMASAN-PABRIK-VIA-CARGO-i.16443162.18283223492
- Produk/supplier: https://www.indonetwork.co.id/product/zeolite-best-powder-50kg-untuk-tanaman-jagung-7500147

---

### 4.4 Biochar / Arang Hayati

| Field | Isi |
|---|---|
| Nama UI | Biochar / Arang Hayati |
| Nama file | `pembenah-biochar.jpg` |
| Kategori | Pembenah Tanah |
| Subkategori | Karbon stabil / organik |
| Fase penggunaan | Pra-tanam / dasar |
| Relevan untuk | Padi, Jagung, Kedelai |
| Satuan umum | 1 kg, 5 kg, ton |
| Harga referensi | Rp47.000–75.000/5 kg; referensi analisis produksi sekitar Rp1.000/kg; referensi solusi biochar mulai Rp1.500.000/ton |
| Status harga | TERVERIFIKASI_SEBAGIAN |
| Fungsi utama | Meningkatkan bahan karbon stabil, daya simpan air dan hara, serta kualitas fisik/biologi tanah |
| Keunggulan | Memanfaatkan limbah biomassa; dapat meningkatkan kesuburan dan ketahanan tanah |
| Keterbatasan | Kualitas biochar sangat bergantung bahan baku dan proses pirolisis; tidak semua biochar sama |
| Catatan UI | Cocok untuk narasi “pertanian berkelanjutan” dan pembenah tanah jangka menengah |

Deskripsi card UI:

> Biochar adalah arang hayati dari biomassa yang digunakan sebagai pembenah tanah. Biochar dapat membantu memperbaiki sifat tanah, menyimpan air/hara, dan mendukung sistem pertanian berkelanjutan.

Sumber:
- Fungsi biochar: https://journalng.uwks.ac.id/japt/article/download/76/52
- Harga marketplace 5 kg: https://shopee.co.id/Biochar-Bubuk-Arang-Aktif-Media-tanam-Penyubur-tanah-%285kg%29-i.1560601050.26037440805
- Harga marketplace 5 kg: https://www.lazada.co.id/tag/biochar/
- Analisis biaya biochar: https://www.researchgate.net/publication/322270183_ANALISIS_MANFAAT_BIAYA_BIOCHAR_DI_LAHAN_PERTANIAN_UNTUK_MENINGKATKAN_PENDAPATAN_PETANI_DI_KABUPATEN_MERAUKE/fulltext/5a4f7dff4585151ee284dec7/ANALISIS-MANFAAT-BIAYA-BIOCHAR-DI-LAHAN-PERTANIAN-UNTUK-MENINGKATKAN-PENDAPATAN-PETANI-DI-KABUPATEN-MERAUKE.pdf
- Referensi harga tonase: https://www.wastex.io/id/solutions

---

### 4.5 Arang Sekam

| Field | Isi |
|---|---|
| Nama UI | Arang Sekam |
| Nama file | `pembenah-arang-sekam.jpg` |
| Kategori | Pembenah Tanah |
| Subkategori | Bahan organik / media tanam |
| Fase penggunaan | Pra-tanam / media / campuran tanah |
| Relevan untuk | Padi, Jagung, Kedelai; lebih umum pada persemaian/media tanam |
| Satuan umum | kg, liter, karung |
| Harga referensi | Rp8.900–22.900 untuk kemasan kecil media tanam; harga karung pertanian perlu cek lokal |
| Status harga | PERLU_VERIFIKASI_LAPANGAN |
| Fungsi utama | Membantu aerasi, porositas, dan campuran media; dapat masuk pembenah ringan |
| Keunggulan | Mudah dicari dari limbah sekam; ringan; cocok sebagai visual katalog |
| Keterbatasan | Harga online sering untuk hobi/media tanam, bukan skala sawah; data harga ha tidak kuat |
| Catatan UI | Cocok sebagai “bahan pendukung pembenah/media”, bukan input wajib semua lahan |

Deskripsi card UI:

> Arang sekam adalah bahan hasil pembakaran sekam padi yang sering dipakai sebagai campuran media tanam dan bahan organik pembenah. Untuk skala sawah, harga dan kebutuhan sebaiknya diinput manual sesuai kondisi lokal.

Sumber:
- Referensi arang sebagai residu karbon: https://id.wikipedia.org/wiki/Arang
- Harga media tanam kecil: https://www.ruparupa.com/jual/pupuk%20kompos?query=pupuk+kompos
- Harga kompos/media kecil: https://www.blibli.com/jual/pupuk-kompos
- Catatan: belum ditemukan harga arang sekam pertanian skala karung yang cukup kuat dari sumber publik stabil; perlu verifikasi lokal.

---

### 4.6 Kompos Matang

| Field | Isi |
|---|---|
| Nama UI | Kompos Matang |
| Nama file | `pembenah-kompos.jpg` |
| Kategori | Pembenah Tanah |
| Subkategori | Organik |
| Fase penggunaan | Pra-tanam / pupuk dasar |
| Relevan untuk | Padi, Jagung, Kedelai |
| Satuan umum | 25 kg / sak; kg |
| Harga referensi | Rp52.000–75.000/25 kg; ada juga harga kecil Rp4.000–5.000/kg |
| Status harga | TERVERIFIKASI_MARKETPLACE |
| Fungsi utama | Menambah bahan organik, memperbaiki struktur tanah, mendukung mikroba tanah |
| Keunggulan | Relevan untuk semua tanaman; mudah dipahami petani; cocok untuk fase pra-tanam |
| Keterbatasan | Kualitas tergantung bahan baku dan tingkat kematangan; kompos belum matang dapat mengganggu tanaman |
| Catatan UI | Tandai sebagai “kompos matang”, bukan sembarang bahan organik segar |

Deskripsi card UI:

> Kompos matang digunakan untuk menambah bahan organik dan membantu memperbaiki struktur tanah. Dalam AgroTrack, kompos bisa masuk fase pra-tanam sebagai pembenah organik dan pupuk dasar pendukung.

Sumber:
- Harga Tisera: https://tisera.id/produk/detail/pupuk-organik-kompos-25-kgFmnxpWsqgi4169
- Harga Shopee kompos 25 kg: https://shopee.co.id/Pupuk-Kompos-Top-Green-Pupuk-Organik-Fermentasi-25-KG-i.1165774892.41602930576
- Harga Lazada kompos: https://www.lazada.co.id/tag/pupuk-kompos-siap-pakai-25kg/
- Harga Blibli kompos: https://www.blibli.com/jual/pupuk-kompos
- Regulasi mutu pupuk organik/pembenah: https://peraturan.bpk.go.id/Download/152724/Permentan%20Nomor%2070%20Tahun%202011.pdf

---

### 4.7 Pupuk Kandang Matang

| Field | Isi |
|---|---|
| Nama UI | Pupuk Kandang Matang |
| Nama file | `pembenah-pupuk-kandang.jpg` |
| Kategori | Pembenah Tanah |
| Subkategori | Organik |
| Fase penggunaan | Pra-tanam / dasar |
| Relevan untuk | Padi, Jagung, Kedelai |
| Satuan umum | 5 kg, 10 kg, 25 kg, 50 kg |
| Harga referensi | Rp88.550/25 kg dan Rp172.500/50 kg; sumber lain Rp85.000–125.000/25 kg |
| Status harga | TERVERIFIKASI_MARKETPLACE |
| Fungsi utama | Menambah bahan organik, memperbaiki struktur tanah, dan mendukung aktivitas mikroba |
| Keunggulan | Sangat familiar di petani; cocok untuk lahan yang butuh bahan organik |
| Keterbatasan | Harus matang/terfermentasi; pupuk kandang mentah berisiko membawa patogen/gulma dan panas fermentasi |
| Catatan UI | Pakai istilah “matang/fermentasi” agar tidak menyesatkan |

Deskripsi card UI:

> Pupuk kandang matang adalah pembenah organik dari kotoran ternak yang sudah difermentasi atau matang. Cocok untuk menambah bahan organik dan memperbaiki sifat tanah pada fase pra-tanam.

Sumber:
- Harga Floria: https://floria.id/jual/pupuk
- Harga Lazada 25 kg: https://www.lazada.co.id/tag/pupuk-kandang-25kg/
- Harga Shopee: https://shopee.co.id/list/Pupuk/Kandang
- Harga Blibli: https://www.blibli.com/jual/pupuk-kandang-kotoran-kambing-25-kg
- Regulasi mutu pupuk organik/pembenah: https://peraturan.bpk.go.id/Download/152724/Permentan%20Nomor%2070%20Tahun%202011.pdf

---

### 4.8 Asam Humat / Humic Acid

| Field | Isi |
|---|---|
| Nama UI | Asam Humat / Humic Acid |
| Nama file | `pembenah-asam-humat.jpg` |
| Kategori | Pembenah Tanah |
| Subkategori | Bahan organik aktif / humat |
| Fase penggunaan | Pra-tanam / awal pertumbuhan / susulan tertentu |
| Relevan untuk | Padi, Jagung, Kedelai |
| Satuan umum | 1 kg, 500 g, 1 liter |
| Harga referensi | Rp28.999–39.999/kg; produk premium Rp80.000–90.900/kg; cair 1 L dapat Rp15.000–27.200 |
| Status harga | TERVERIFIKASI_MARKETPLACE |
| Fungsi utama | Mendukung perbaikan sifat tanah dan ketersediaan hara; sering dipakai sebagai pembenah/biostimulan tanah |
| Keunggulan | Bentuk cair/serbuk mudah masuk katalog; cocok untuk narasi perbaikan tanah |
| Keterbatasan | Kandungan dan efektivitas sangat tergantung merek/konsentrasi; jangan samakan semua asam humat |
| Catatan UI | Wajib tampilkan konsentrasi produk jika nanti memilih merek spesifik |

Deskripsi card UI:

> Asam humat adalah bahan organik aktif yang sering digunakan sebagai pembenah tanah dan pendukung penyerapan hara. Dalam katalog AgroTrack, harga harus mengikuti produk dan konsentrasi karena perbedaan antar merek cukup besar.

Sumber:
- Studi asam humat sebagai amelioran: https://epublikasi.pertanian.go.id/berkala/index.php/ijas/article/download/281/239
- Harga Shopee: https://shopee.co.id/list/Asam/Humat
- Harga Shopee pencarian pupuk asam humat: https://shopee.co.id/search?keyword=pupuk+asam+humat
- Harga Lazada: https://www.lazada.co.id/tag/asamhumat-1-kg/
- Harga Blibli: https://www.blibli.com/jual/asam-humat-1-sak

---

### 4.9 Gypsum Pertanian / Kalsium Sulfat

| Field | Isi |
|---|---|
| Nama UI | Gypsum Pertanian / Kalsium Sulfat |
| Nama file | `pembenah-gypsum.jpg` |
| Kategori | Pembenah Tanah |
| Subkategori | Kalsium-sulfur / koreksi tanah tertentu |
| Fase penggunaan | Pra-tanam / pembenahan tanah spesifik |
| Relevan untuk | Padi, Jagung, Kedelai pada kondisi tertentu, terutama tanah salin/sodik atau butuh Ca/S |
| Satuan umum | 5 kg, 25 kg |
| Harga referensi | Rp150.000–185.000/25 kg untuk produk Gypblend; harga gypsum umum sangat bervariasi |
| Status harga | TERVERIFIKASI_PRODUK_SPESIFIK |
| Fungsi utama | Sumber kalsium dan sulfur; dapat membantu perbaikan struktur pada tanah bermasalah tertentu |
| Keunggulan | Tidak menaikkan pH sekuat kapur; berguna untuk kondisi tanah tertentu |
| Keterbatasan | Tidak cocok disamaratakan untuk semua lahan; perlu diagnosis tanah |
| Catatan UI | Tampilkan sebagai “opsional/kondisi khusus”, bukan item wajib |

Deskripsi card UI:

> Gypsum pertanian merupakan bahan kalsium sulfat yang dapat digunakan untuk pembenahan tanah tertentu, misalnya tanah bermasalah dengan struktur/salinitas. Item ini sebaiknya diberi label “gunakan sesuai kondisi tanah”.

Sumber:
- Spesifikasi gypsum pertanian: https://chemicalsindonesia.indonetwork.co.id/product/gypsum-pertanian-5642624
- Produk Gypblend: https://sadewa-agrijaya.com/product/gypblend/
- Harga Gypblend: https://www.primatani.com/catalog/detail/1187_gypblend/16_pupuk
- Harga Gypblend: https://www.happyshopingbatam.com/product/pupuk-gypblend-25-kg/
- Fungsi tanah salin: https://www.centrabiotechindonesia.com/id/blog/gypsum-pertanian-sebagai-pembenah-tanah-salin

---

### 4.10 Dekomposer Bahan Organik

| Field | Isi |
|---|---|
| Nama UI | Dekomposer Bahan Organik |
| Nama file | `pembenah-dekomposer.jpg` |
| Kategori | Pembenah Tanah |
| Subkategori | Bioaktivator / pengurai bahan organik |
| Fase penggunaan | Pra-tanam / pengolahan sisa tanaman / pembuatan kompos |
| Relevan untuk | Padi, Jagung, Kedelai |
| Satuan umum | 1 kg, 1 liter |
| Harga referensi | Stardec 1 kg Rp21.200–28.083; EM4 1 L Rp23.177–49.950; dekomposer cair lain Rp42.500–85.000/L |
| Status harga | TERVERIFIKASI_MARKETPLACE |
| Fungsi utama | Membantu mempercepat penguraian bahan organik seperti jerami, sisa tanaman, dan bahan kompos |
| Keunggulan | Relevan untuk integrasi pascapanen-pra-tanam; bisa menghubungkan sisa tanaman menjadi bahan organik |
| Keterbatasan | Efektivitas tergantung kelembapan, bahan organik, suhu, dan cara aplikasi |
| Catatan UI | Cocok untuk fitur “olah sisa panen menjadi bahan organik” |

Deskripsi card UI:

> Dekomposer digunakan untuk membantu proses penguraian bahan organik, misalnya jerami, sisa tanaman, pupuk kandang, atau bahan kompos. Dalam AgroTrack, item ini cocok ditempatkan pada fase pra-tanam dan pascapanen.

Sumber:
- Harga Stardec: https://shopee.co.id/STARDEC-1-KG-DEKOMPOSER-PENGURAI-ORGANIK-KOMPOS-i.16443162.24332920887
- Harga EM4: https://www.lazada.co.id/tag/dekomposer-em4/
- Harga EM4 Inaproc: https://katalog.inaproc.id/tajako-abadi-sejahtera-group/dekomposer-em4-pertanian
- Harga Beka: https://www.lazada.co.id/tag/dekomposer-beka/
- Harga Blibli: https://www.blibli.com/jual/dekomposser
- Harga Biodex: https://www.indotrading.com/jual-pupuk-kompos

---

## 5. Rekomendasi Tampilan UI AgroTrack

### 5.1 Card Katalog

Contoh struktur card:

```text
[Foto Pembenah]
Dolomit / Kapur Dolomit
Kategori: Pembenah Tanah
Fase: Pra-tanam
Harga acuan: Rp66.000 – Rp150.000 / 50 kg
Cocok untuk: Padi, Jagung, Kedelai
Fungsi: Membantu menaikkan pH tanah masam dan memasok Ca/Mg
Tombol: Tambahkan ke Rencana Operasional
```

### 5.2 Filter UI

Filter yang disarankan:

1. Tanaman: Padi / Jagung / Kedelai
2. Fase: Pra-tanam / Tanam / Awal Pertumbuhan / Vegetatif / Generatif / Panen / Pascapanen
3. Jenis pembenah:
   - Pengapuran
   - Organik
   - Mineral
   - Humat
   - Dekomposer
   - Kondisi khusus
4. Status harga:
   - TERVERIFIKASI_MARKETPLACE
   - TERVERIFIKASI_PRODUK_SPESIFIK
   - TERVERIFIKASI_SEBAGIAN
   - PERLU_VERIFIKASI_LAPANGAN

### 5.3 Label Risiko

Tambahkan badge kecil:

| Badge | Makna |
|---|---|
| `Perlu pH tanah` | Sebaiknya dipakai setelah mengetahui pH tanah |
| `Opsional` | Tidak wajib untuk semua lahan |
| `Organik` | Berasal dari bahan organik/biologis |
| `Kondisi khusus` | Dipakai untuk masalah tanah tertentu |
| `Harga berubah` | Harga mengikuti toko dan wilayah |

---

## 6. Rekomendasi Database

Tabel `saprodi_items`:

```sql
CREATE TABLE IF NOT EXISTS saprodi_items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  tanaman_id INT NULL,
  kategori VARCHAR(100) NOT NULL,
  subkategori VARCHAR(100) NULL,
  nama_item VARCHAR(150) NOT NULL,
  nama_file_asset VARCHAR(255) NULL,
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
  status ENUM('aktif','nonaktif') DEFAULT 'aktif',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

Catatan desain:
- Untuk pembenah tanah yang relevan ke semua tanaman, `tanaman_id` boleh `NULL`.
- Jika ingin relasi many-to-many ke tanaman, buat tabel `saprodi_item_tanaman`.
- Simpan `harga_min` dan `harga_max`, bukan satu harga tunggal.

---

## 7. Contoh SQL Seed

```sql
INSERT INTO saprodi_items
(kategori, subkategori, nama_item, nama_file_asset, fase_penggunaan, satuan_harga, harga_min, harga_max, harga_status, sumber_harga, tanggal_cek_harga, fungsi, keunggulan, keterbatasan, catatan_penggunaan)
VALUES
('Pembenah Tanah','Pengapuran','Dolomit / Kapur Dolomit','pembenah-dolomit.jpg','Pra-tanam','50 kg / zak',66000,150000,'TERVERIFIKASI_MARKETPLACE','BibitBunga, Shopee, Lazada','2026-06-16','Membantu menaikkan pH tanah masam dan memasok Ca/Mg.','Murah per kg dan relevan untuk tanah masam.','Tidak semua lahan butuh; gunakan berdasarkan pH tanah.','Aplikasikan sebelum tanam sesuai rekomendasi lapang.'),

('Pembenah Tanah','Pengapuran','Kapur Pertanian / Kaptan / Kalsit','pembenah-kapur-pertanian.jpg','Pra-tanam','50 kg / zak',66000,150000,'TERVERIFIKASI_SEBAGIAN','Sumber harga pasar kapur/dolomit; kalsit spesifik perlu verifikasi','2026-06-16','Membantu menaikkan pH tanah asam dan memasok kalsium.','Cocok untuk correction pH.','Harga kalsit spesifik belum kuat; jangan samakan dengan dolomit jika komposisi berbeda.','Gunakan berdasarkan pH tanah.'),

('Pembenah Tanah','Mineral','Zeolit Pertanian','pembenah-zeolit.jpg','Pra-tanam / dasar','1 kg / 2 kg / 50 kg',15000,270000,'TERVERIFIKASI_MARKETPLACE','Blibli, Lazada, Shopee','2026-06-16','Pembenah mineral untuk mendukung daya simpan air/hara.','Dapat mendukung efisiensi hara.','Manfaat tergantung jenis zeolit, ukuran partikel, dan kondisi tanah.','Tampilkan sebagai pembenah mineral, bukan pupuk utama.'),

('Pembenah Tanah','Karbon Organik','Biochar / Arang Hayati','pembenah-biochar.jpg','Pra-tanam / dasar','5 kg / paket',47000,75000,'TERVERIFIKASI_SEBAGIAN','Shopee, Lazada, analisis biaya biochar, WasteX','2026-06-16','Meningkatkan karbon stabil dan daya simpan air/hara.','Baik untuk narasi pertanian berkelanjutan.','Kualitas sangat tergantung bahan baku dan proses.','Gunakan sebagai pembenah tanah jangka menengah.'),

('Pembenah Tanah','Bahan Organik','Arang Sekam','pembenah-arang-sekam.jpg','Pra-tanam / media','kg / liter / karung',8900,22900,'PERLU_VERIFIKASI_LAPANGAN','RupaRupa/Blibli untuk kemasan kecil media tanam','2026-06-16','Membantu aerasi dan campuran media tanam.','Mudah dipahami dan visualnya jelas.','Harga online sering untuk hobi/media, bukan skala sawah.','Biarkan admin mengedit harga lokal.'),

('Pembenah Tanah','Organik','Kompos Matang','pembenah-kompos.jpg','Pra-tanam / dasar','25 kg / sak',52000,75000,'TERVERIFIKASI_MARKETPLACE','Tisera, Shopee, Lazada, Blibli','2026-06-16','Menambah bahan organik dan memperbaiki struktur tanah.','Relevan untuk padi, jagung, dan kedelai.','Kualitas tergantung kematangan dan bahan baku.','Gunakan kompos matang, bukan bahan organik mentah.'),

('Pembenah Tanah','Organik','Pupuk Kandang Matang','pembenah-pupuk-kandang.jpg','Pra-tanam / dasar','25 kg / sak',85000,125000,'TERVERIFIKASI_MARKETPLACE','Floria, Lazada, Shopee, Blibli','2026-06-16','Menambah bahan organik dan mendukung aktivitas mikroba.','Familiar bagi petani.','Harus matang/terfermentasi.','Tampilkan istilah matang/fermentasi.'),

('Pembenah Tanah','Humat','Asam Humat / Humic Acid','pembenah-asam-humat.jpg','Pra-tanam / awal pertumbuhan','1 kg / 1 liter',28999,90900,'TERVERIFIKASI_MARKETPLACE','Shopee, Lazada, Blibli','2026-06-16','Mendukung perbaikan sifat tanah dan ketersediaan hara.','Mudah masuk katalog sebagai pembenah aktif.','Konsentrasi produk berbeda-beda.','Simpan konsentrasi jika memakai produk spesifik.'),

('Pembenah Tanah','Kondisi Khusus','Gypsum Pertanian / Kalsium Sulfat','pembenah-gypsum.jpg','Pra-tanam / kondisi khusus','25 kg / sak',150000,185000,'TERVERIFIKASI_PRODUK_SPESIFIK','Prima Tani, Happy Tani, Sadewa Agri Jaya','2026-06-16','Sumber kalsium dan sulfur; membantu tanah tertentu.','Berguna untuk kondisi tanah tertentu.','Tidak wajib untuk semua lahan.','Tampilkan sebagai item opsional/kondisi khusus.'),

('Pembenah Tanah','Dekomposer','Dekomposer Bahan Organik','pembenah-dekomposer.jpg','Pra-tanam / pascapanen','1 kg / 1 liter',21199,85000,'TERVERIFIKASI_MARKETPLACE','Shopee, Lazada, Blibli, Inaproc, Indotrading','2026-06-16','Membantu penguraian bahan organik dan pembuatan kompos.','Menghubungkan sisa panen ke pembenahan tanah.','Efektivitas tergantung kelembapan, bahan, dan cara aplikasi.','Cocok untuk olah jerami/sisa tanaman.');
```

---

## 8. Rekomendasi Prioritas Masuk AgroTrack

Prioritas MVP:

1. Dolomit
2. Kompos Matang
3. Pupuk Kandang Matang
4. Dekomposer
5. Zeolit
6. Asam Humat

Prioritas tambahan:

7. Biochar
8. Arang Sekam
9. Kapur Pertanian/Kalsit
10. Gypsum Pertanian

Alasan:
- Enam item pertama mudah dipahami petani dan relevan untuk fase pra-tanam.
- Biochar, arang sekam, kalsit, dan gypsum lebih baik masuk setelah UI filter dan catatan penggunaan sudah rapi.

---

## 9. Copy UI Singkat per Item

| Item | Copy pendek untuk card |
|---|---|
| Dolomit | Pembenah tanah untuk membantu menaikkan pH tanah masam dan menambah Ca/Mg. |
| Kapur Pertanian | Kapur/kalsit untuk koreksi tanah asam dan sumber kalsium. |
| Zeolit | Mineral pembenah untuk mendukung daya simpan air dan hara. |
| Biochar | Arang hayati untuk meningkatkan karbon stabil dan kualitas tanah. |
| Arang Sekam | Bahan ringan untuk memperbaiki aerasi dan campuran media tanam. |
| Kompos | Bahan organik matang untuk memperbaiki struktur tanah. |
| Pupuk Kandang | Pembenah organik dari kotoran ternak matang/fermentasi. |
| Asam Humat | Bahan humat untuk membantu perbaikan tanah dan penyerapan hara. |
| Gypsum | Pembenah kalsium-sulfur untuk kondisi tanah tertentu. |
| Dekomposer | Bioaktivator untuk membantu penguraian sisa tanaman/kompos. |

---

## 10. Referensi Utama

1. Dariah, A. dkk. Pembenah tanah untuk meningkatkan produktivitas lahan pertanian.  
   https://media.neliti.com/media/publications/133114-ID-pembenah-tanah-untuk-meningkatkan-produk.pdf

2. Permentan No. 1 Tahun 2019 tentang pendaftaran pupuk organik, pupuk hayati, dan pembenah tanah.  
   https://peraturan.bpk.go.id/Download/266197/Permentan%20Nomor%201%20Tahun%202019.pdf

3. Permentan No. 70 Tahun 2011 tentang pupuk organik, pupuk hayati, dan pembenah tanah.  
   https://peraturan.bpk.go.id/Download/152724/Permentan%20Nomor%2070%20Tahun%202011.pdf

4. BibitBunga — Dolomit 50 kg.  
   https://bibitbunga.com/product/pupuk-kapur-pertanian-dolomit-dolomite-1-zak-50kg-50-kg-kaptan-murah/

5. Shopee — Kapur Dolomit 50 kg.  
   https://shopee.co.id/Kapur-Dolomit-50-Kg-Via-Instan-Pupuk-Dolomite-Kalsium-Super-Pertanian-Tani-Ternak-Tambak-Alas-Gecko-Reptil-i.135032082.15457921889

6. Lazada — Kapur pertanian/dolomit 50 kg.  
   https://www.lazada.co.id/tag/kapur-pertanian-dolomit-50-kg/

7. UNNES — Zeolit alam dan kemampuan adsorpsi.  
   https://unnes.ac.id/mipa/id/2021/07/14/mengenal-zeolit-alam-dari-sukabumi-dan-cara-meningkatkan-kemampuan-adsorpsinya/

8. Blibli — Zeolit pertanian.  
   https://www.blibli.com/jual/zeolit-pertanian

9. Lazada — Zeolite pertanian 50 kg.  
   https://www.lazada.co.id/tag/zeolite-pertanian-50-kg/

10. Shopee — ZSP-36 Zeolit 50 kg.  
    https://shopee.co.id/PUPUK-PAK-TANI-ZSP-36-BERAT-50-KG-ZEOLIT-KEMASAN-PABRIK-VIA-CARGO-i.16443162.18283223492

11. Journal UWKS — Manfaat biochar.  
    https://journalng.uwks.ac.id/japt/article/download/76/52

12. Shopee — Biochar 5 kg.  
    https://shopee.co.id/Biochar-Bubuk-Arang-Aktif-Media-tanam-Penyubur-tanah-%285kg%29-i.1560601050.26037440805

13. Lazada — Biochar.  
    https://www.lazada.co.id/tag/biochar/

14. Tisera — Kompos 25 kg.  
    https://tisera.id/produk/detail/pupuk-organik-kompos-25-kgFmnxpWsqgi4169

15. Shopee — Kompos 25 kg.  
    https://shopee.co.id/Pupuk-Kompos-Top-Green-Pupuk-Organik-Fermentasi-25-KG-i.1165774892.41602930576

16. Floria — Pupuk kandang.  
    https://floria.id/jual/pupuk

17. Lazada — Pupuk kandang 25 kg.  
    https://www.lazada.co.id/tag/pupuk-kandang-25kg/

18. IJAS — Asam humat sebagai amelioran.  
    https://epublikasi.pertanian.go.id/berkala/index.php/ijas/article/download/281/239

19. Shopee — Asam humat.  
    https://shopee.co.id/list/Asam/Humat

20. Indonetwork — Gypsum pertanian.  
    https://chemicalsindonesia.indonetwork.co.id/product/gypsum-pertanian-5642624

21. Sadewa Agri Jaya — Gypblend.  
    https://sadewa-agrijaya.com/product/gypblend/

22. Prima Tani — Gypblend 25 kg.  
    https://www.primatani.com/catalog/detail/1187_gypblend/16_pupuk

23. Shopee — Stardec dekomposer 1 kg.  
    https://shopee.co.id/STARDEC-1-KG-DEKOMPOSER-PENGURAI-ORGANIK-KOMPOS-i.16443162.24332920887

24. Lazada — EM4 dekomposer.  
    https://www.lazada.co.id/tag/dekomposer-em4/

25. Blibli — Dekomposer.  
    https://www.blibli.com/jual/dekomposser
