# Product Requirements Document

# AgroTrack

Sistem monitoring pertanian berbasis peta, manajemen lahan, musim tanam, biaya produksi, hasil panen, analisis keuntungan, dan laporan.

**Versi:** 1.1  
**Tanggal update:** 14 Juni 2026  
**Platform:** Web  
**Teknologi utama:** Native PHP, MySQL, HTML, CSS, JavaScript, Leaflet, Leaflet Draw, Chart.js

---

## 1. Ringkasan Produk

AgroTrack adalah aplikasi web untuk membantu petani mengelola kegiatan pertanian secara digital. Petani dapat mencatat lahan, menentukan lokasi dan batas area lahan melalui peta interaktif, mengelola musim tanam, mencatat biaya produksi, menginput hasil panen, dan melihat analisis keuntungan.

Aplikasi juga menyediakan dashboard admin untuk memantau pengguna, master data tanaman, data lahan, musim tanam, dan laporan global. Nilai utama AgroTrack adalah menggabungkan pencatatan pertanian dengan peta digital sehingga data lahan lebih mudah dipahami secara visual.

## 2. Tujuan Produk

1. Membantu petani mencatat dan mengelola data lahan secara digital.
2. Membantu petani memilih lokasi dan menggambar batas lahan langsung pada peta.
3. Menghitung luas lahan otomatis berdasarkan area yang digambar pada peta.
4. Membantu petani mencatat musim tanam, biaya produksi, dan hasil panen.
5. Menghitung estimasi panen, progress pertumbuhan, pendapatan, dan profit.
6. Menyediakan dashboard dan laporan untuk petani dan admin.
7. Mengurangi ketergantungan pada pencatatan manual.

## 3. Ruang Lingkup

### 3.1 Scope MVP

1. Landing page.
2. Register petani.
3. Login dan logout.
4. Role access untuk Admin dan Petani.
5. Dashboard Petani.
6. Dashboard Admin.
7. CRUD master data tanaman oleh Admin.
8. CRUD data lahan oleh Petani.
9. Peta interaktif lahan menggunakan Leaflet.
10. Pemilihan lahan aktif dari daftar lahan milik petani.
11. Penentuan marker lokasi lahan.
12. Penggambaran polygon batas lahan dengan titik-titik atau gambar bebas.
13. Perhitungan otomatis luas lahan dari polygon.
14. Penyimpanan latitude, longitude, polygon area, dan luas lahan.
15. CRUD musim tanam.
16. Perhitungan estimasi panen.
17. Progress pertumbuhan tanaman.
18. CRUD biaya produksi.
19. CRUD hasil panen.
20. Perhitungan pendapatan dan profit.
21. Analisis grafik sederhana.
22. Laporan tabel.
23. Profil pengguna.
24. Popup, toast, dan validasi form.

### 3.2 Fitur Tambahan

1. Export PDF.
2. Export Excel.
3. Upload foto profil.
4. Reset password sederhana.
5. Informasi cuaca dari API.
6. Print laporan.
7. Filter laporan lanjutan.

### 3.3 Di Luar Scope MVP

1. Marketplace penuh.
2. Checkout dan payment gateway.
3. Dropshipper.
4. Forum komunitas penuh.
5. Chat konsultasi real-time.
6. Notifikasi WhatsApp.
7. AI rekomendasi tanaman.
8. IoT sensor.
9. Dark mode.

## 4. Target Pengguna

### 4.1 Guest

Guest adalah pengguna yang belum login.

Guest dapat:

1. Melihat landing page.
2. Membuka halaman login.
3. Membuka halaman register.
4. Melakukan registrasi akun petani.

Guest tidak dapat:

1. Mengakses dashboard petani.
2. Mengakses dashboard admin.
3. Mengelola data lahan.
4. Mengakses laporan internal.

### 4.2 Petani

Petani adalah pengguna utama aplikasi.

Petani dapat:

1. Login ke sistem.
2. Mengelola profil.
3. Menambah, melihat, mengedit, dan menonaktifkan lahan.
4. Memilih lahan aktif pada halaman peta.
5. Menentukan marker lokasi lahan.
6. Menggambar batas lahan langsung pada peta.
7. Melihat luas otomatis dari area yang digambar.
8. Menyimpan koordinat, polygon, dan luas lahan.
9. Mengelola musim tanam.
10. Mencatat biaya produksi.
11. Mencatat hasil panen.
12. Melihat analisis biaya, pendapatan, dan profit.
13. Melihat laporan pertanian miliknya sendiri.

Petani tidak dapat:

1. Mengakses dashboard admin.
2. Mengelola data petani lain.
3. Mengubah master data tanaman.
4. Melihat laporan global seluruh pengguna.

### 4.3 Admin

Admin adalah pengguna yang mengelola data utama dan memantau aktivitas sistem.

Admin dapat:

1. Login ke dashboard admin.
2. Melihat statistik sistem.
3. Melihat daftar pengguna.
4. Mengelola master data tanaman.
5. Memantau seluruh data lahan.
6. Melihat monitoring lahan melalui tabel dan peta.
7. Melihat laporan global.

Admin tidak perlu:

1. Menggambar polygon lahan milik petani.
2. Menginput biaya produksi milik petani.
3. Menginput hasil panen milik petani.

## 5. User Journey Utama

### 5.1 Guest Menjadi Petani

1. Guest membuka landing page.
2. Guest membuka halaman register.
3. Guest mengisi nama, email, nomor HP, password, dan konfirmasi password.
4. Sistem memvalidasi data.
5. Sistem membuat akun petani.
6. Petani login.
7. Petani masuk ke dashboard.

### 5.2 Petani Mengelola Lahan dan Peta

1. Petani login.
2. Petani membuka menu Lahan.
3. Petani menambah data dasar lahan: nama, lokasi, luas awal, dan status.
4. Petani membuka menu Peta Lahan.
5. Petani memilih salah satu lahan aktif dari dropdown.
6. Petani klik peta untuk menentukan marker lokasi lahan.
7. Petani menggambar batas lahan dengan salah satu cara:
   - Menggunakan tool polygon dengan klik beberapa titik batas lahan.
   - Menggunakan mode gambar bebas dengan tahan dan geser mouse mengikuti batas lahan.
8. Sistem menampilkan jumlah titik polygon, keliling, luas dalam m2, dan luas dalam hektare.
9. Petani klik Simpan Peta.
10. Sistem menyimpan latitude, longitude, polygon area, dan luas lahan otomatis.
11. Data lahan tampil kembali pada daftar lahan, peta petani, monitoring admin, dashboard, dan laporan.

### 5.3 Petani Mengelola Musim Tanam

1. Petani membuka menu Musim Tanam.
2. Petani memilih lahan.
3. Petani memilih tanaman.
4. Petani mengisi tanggal tanam.
5. Sistem menghitung estimasi panen berdasarkan masa panen tanaman.
6. Sistem menampilkan progress pertumbuhan.
7. Petani dapat memperbarui status musim tanam.

### 5.4 Petani Mengelola Biaya dan Panen

1. Petani membuka menu Biaya Produksi.
2. Petani menambahkan biaya berdasarkan musim tanam.
3. Sistem menghitung total biaya produksi.
4. Petani membuka menu Hasil Panen.
5. Petani mengisi total hasil panen dan harga jual.
6. Sistem menghitung total pendapatan.
7. Sistem menghitung profit.
8. Petani melihat grafik analisis.

### 5.5 Admin Memantau Sistem

1. Admin login.
2. Admin masuk ke dashboard admin.
3. Admin melihat statistik total pengguna, lahan, musim aktif, dan hasil panen.
4. Admin mengelola master data tanaman.
5. Admin memantau lahan melalui tabel dan peta.
6. Admin melihat laporan global.

## 6. Struktur Halaman dan Requirement

### 6.1 Landing Page

**Akses:** Guest, Petani, Admin

**Tujuan:** Menjelaskan fungsi AgroTrack dan mengarahkan pengguna ke login atau register.

**Komponen:**

1. Navbar.
2. Hero section.
3. CTA login/register.
4. Section fitur utama.
5. Section manfaat.
6. Statistik singkat.
7. FAQ.
8. Footer.

**Acceptance criteria:**

1. Landing page dapat dibuka tanpa login.
2. Tombol login mengarah ke halaman login.
3. Tombol register mengarah ke halaman register.
4. Tampilan responsif.

### 6.2 Login

**Akses:** Guest

**Field:**

1. Email.
2. Password.
3. Remember me.

**Validasi:**

1. Email wajib diisi.
2. Password wajib diisi.
3. Email harus terdaftar.
4. Password harus benar.

**Redirect:**

1. Admin diarahkan ke dashboard admin.
2. Petani diarahkan ke dashboard petani.

### 6.3 Register

**Akses:** Guest

**Field:**

1. Nama lengkap.
2. Email.
3. Nomor HP.
4. Password.
5. Konfirmasi password.

**Acceptance criteria:**

1. Akun petani berhasil dibuat.
2. Role default akun baru adalah `petani`.
3. Email yang sama tidak bisa digunakan dua kali.
4. Password tersimpan dalam bentuk hash.

### 6.4 Dashboard Petani

**Akses:** Petani

**Komponen:**

1. Card total lahan.
2. Card musim aktif.
3. Card total biaya produksi.
4. Card total pendapatan.
5. Card total keuntungan.
6. Card estimasi panen terdekat.
7. Tabel aktivitas terbaru.
8. Grafik ringkas biaya dan profit.

**Acceptance criteria:**

1. Dashboard hanya menampilkan data milik petani yang sedang login.
2. Statistik berubah sesuai data database.
3. Jika data kosong, sistem menampilkan empty state.

### 6.5 Manajemen Lahan

**Akses:** Petani

**Tujuan:** Mengelola data dasar lahan pertanian milik petani.

**Field data lahan:**

| Field | Tipe | Wajib | Keterangan |
| --- | --- | --- | --- |
| Nama lahan | Text | Ya | Nama lahan milik petani. |
| Lokasi | Text | Ya | Desa, kecamatan, atau kabupaten. |
| Luas lahan | Decimal | Ya | Luas dalam hektare. Dapat diisi manual saat membuat lahan dan diperbarui otomatis dari peta. |
| Status lahan | Enum | Ya | `aktif` atau `nonaktif`. |
| Latitude | Decimal | Tidak | Diisi dari marker peta. |
| Longitude | Decimal | Tidak | Diisi dari marker peta. |
| Polygon area | JSON text | Tidak | Daftar titik batas lahan. |
| User ID | Relasi | Ya | Pemilik lahan. |

**Aksi user:**

1. Menambah lahan.
2. Melihat daftar lahan.
3. Mengedit lahan.
4. Menonaktifkan lahan.
5. Membuka peta lahan.

**Acceptance criteria:**

1. Petani hanya dapat melihat lahannya sendiri.
2. Petani tidak dapat mengedit lahan milik pengguna lain.
3. Data lahan tersimpan di database.
4. Lahan yang masih memiliki riwayat penting tidak dihapus permanen, tetapi dinonaktifkan.

### 6.6 Peta Lahan

**Akses:** Petani

**Tujuan:** Memungkinkan petani memilih lahan, menentukan titik lokasi, menggambar batas area lahan, dan mendapatkan luas lahan otomatis dari gambar di peta.

**Komponen:**

1. Peta OpenStreetMap dengan Leaflet.
2. Dropdown Pilih Lahan Aktif.
3. Marker lokasi lahan.
4. Tool polygon Leaflet Draw.
5. Tombol Gambar Bebas.
6. Tombol Reset Gambar.
7. Tombol Simpan Peta.
8. Panel detail lahan.
9. Alert/toast feedback.

**Alur memilih dan menggambar lahan:**

1. Sistem memuat daftar lahan aktif milik petani.
2. Petani memilih lahan dari dropdown.
3. Jika lahan sudah memiliki marker atau polygon, sistem menampilkannya kembali.
4. Petani klik satu titik pada peta untuk menentukan marker lokasi utama lahan.
5. Petani menggambar batas lahan dengan tool polygon:
   - Klik titik pertama di batas lahan.
   - Klik titik berikutnya mengikuti bentuk batas lahan.
   - Minimal 3 titik untuk membentuk area.
   - Klik titik awal atau tombol finish untuk menyelesaikan polygon.
6. Alternatifnya, petani dapat memakai mode Gambar Bebas:
   - Klik tombol Gambar Bebas.
   - Tahan mouse dan geser mengikuti batas lahan.
   - Lepaskan mouse untuk membentuk polygon.
7. Sistem menghitung:
   - Jumlah titik polygon.
   - Keliling dalam meter.
   - Luas dalam m2.
   - Luas dalam hektare.
8. Petani dapat mengedit titik polygon, menghapus polygon, atau menggambar ulang.
9. Saat petani klik Simpan Peta, sistem menyimpan marker, polygon, dan luas lahan hasil perhitungan.

**Data yang disimpan:**

| Data | Format | Keterangan |
| --- | --- | --- |
| `latitude` | Decimal | Latitude marker lokasi utama. |
| `longitude` | Decimal | Longitude marker lokasi utama. |
| `polygon_area` | JSON text | Array titik polygon dalam format latitude dan longitude. |
| `luas_lahan` | Decimal hektare | Diambil dari hasil hitung luas polygon jika polygon valid. |

**Business rules:**

1. Lahan harus dipilih sebelum marker atau polygon dibuat.
2. Marker wajib ada sebelum data peta disimpan.
3. Polygon valid minimal memiliki 3 titik.
4. Luas otomatis dihitung dari polygon, bukan dari input manual.
5. Jika polygon belum valid, luas otomatis tidak mengganti nilai luas lahan yang sudah ada.
6. Reset Gambar hanya menghapus gambar di tampilan sampai user menyimpan perubahan.
7. Data peta hanya boleh disimpan untuk lahan aktif milik user yang sedang login.

**Acceptance criteria:**

1. Petani dapat memilih lahan aktif dari dropdown.
2. Petani dapat klik peta untuk menentukan marker.
3. Petani dapat menggambar polygon dengan klik titik-titik pada peta.
4. Petani dapat menggambar polygon dengan mode gambar bebas.
5. Sistem menampilkan luas m2 dan hektare setelah polygon valid.
6. Sistem otomatis memperbarui `luas_lahan` berdasarkan polygon saat Simpan Peta.
7. Polygon lama muncul kembali saat halaman dibuka ulang.
8. Petani dapat mengedit atau menggambar ulang polygon.
9. Sistem menampilkan error jika lahan belum dipilih, marker belum dibuat, atau polygon tidak valid.

### 6.7 Musim Tanam

**Akses:** Petani

**Field:**

1. Lahan.
2. Tanaman.
3. Tanggal tanam.
4. Estimasi panen.
5. Status.
6. Catatan.

**Status musim tanam:**

1. `persemaian`.
2. `pertumbuhan`.
3. `siap_panen`.
4. `panen_selesai`.

**Perhitungan:**

```text
Estimasi Panen = Tanggal Tanam + Masa Panen Tanaman
Progress = Hari Berjalan / Masa Panen Tanaman * 100%
```

**Acceptance criteria:**

1. Estimasi panen terhitung otomatis.
2. Progress pertumbuhan tampil dalam bentuk progress bar.
3. Petani hanya dapat mengelola musim tanam dari lahannya sendiri.

### 6.8 Biaya Produksi

**Akses:** Petani

**Field:**

1. Musim tanam.
2. Kategori biaya.
3. Nominal.
4. Tanggal biaya.
5. Keterangan.

**Kategori biaya:**

1. `bibit`.
2. `pupuk`.
3. `pestisida`.
4. `tenaga_kerja`.
5. `transportasi`.
6. `sewa_alat`.
7. `lainnya`.

**Acceptance criteria:**

1. Biaya tersimpan sesuai musim tanam.
2. Total biaya per musim tanam terhitung benar.
3. Petani hanya dapat melihat biaya dari musim tanam miliknya.

### 6.9 Hasil Panen

**Akses:** Petani

**Field:**

1. Musim tanam.
2. Total hasil panen.
3. Satuan.
4. Harga jual per satuan.
5. Total pendapatan.
6. Total biaya produksi.
7. Total keuntungan.
8. Catatan.

**Perhitungan:**

```text
Total Pendapatan = Total Hasil Panen * Harga Jual
Profit = Total Pendapatan - Total Biaya Produksi
```

**Acceptance criteria:**

1. Total pendapatan otomatis terhitung.
2. Total biaya produksi diambil dari data biaya.
3. Profit otomatis terhitung.
4. Satu musim tanam idealnya hanya memiliki satu data hasil panen.

### 6.10 Analisis

**Akses:** Petani

**Komponen:**

1. Card total biaya.
2. Card total pendapatan.
3. Card total profit.
4. Grafik biaya berdasarkan kategori.
5. Grafik pendapatan vs biaya.
6. Grafik profit per musim.
7. Tabel ringkasan musim.

**Acceptance criteria:**

1. Grafik mengambil data dari database.
2. Grafik tetap tampil meskipun data sedikit.
3. Jika data kosong, muncul empty state.

### 6.11 Laporan Petani

**Akses:** Petani

**Jenis laporan:**

1. Laporan lahan.
2. Laporan musim tanam.
3. Laporan biaya produksi.
4. Laporan hasil panen.
5. Laporan keuntungan.

**Acceptance criteria:**

1. Laporan hanya menampilkan data milik petani yang sedang login.
2. Filter berjalan sesuai periode, musim tanam, atau tanaman.
3. Data laporan sesuai dengan data transaksi.

### 6.12 Dashboard Admin

**Akses:** Admin

**Komponen:**

1. Total pengguna.
2. Total lahan.
3. Total musim tanam aktif.
4. Total hasil panen.
5. Grafik ringkasan.
6. Tabel aktivitas terbaru.

### 6.13 Master Data Tanaman

**Akses:** Admin

**Field:**

1. Nama tanaman.
2. Masa panen dalam hari.
3. Deskripsi.
4. Status aktif/nonaktif.

**Acceptance criteria:**

1. Tanaman aktif tampil pada dropdown musim tanam.
2. Masa panen tanaman digunakan untuk menghitung estimasi panen.
3. Nama tanaman tidak boleh duplikat.

### 6.14 Monitoring Lahan Admin

**Akses:** Admin

**Tujuan:** Memantau seluruh data lahan pengguna.

**Komponen:**

1. Tabel seluruh lahan.
2. Peta monitoring.
3. Filter petani.
4. Filter tanaman.
5. Filter status lahan atau musim.
6. Detail lahan.

**Acceptance criteria:**

1. Admin dapat melihat semua lahan.
2. Peta menampilkan marker dan polygon lahan.
3. Admin dapat melihat luas lahan hasil perhitungan polygon.
4. Admin tidak perlu mengubah polygon petani.

## 7. Requirement Fungsional

| ID | Requirement |
| --- | --- |
| RF-01 | Sistem menyediakan landing page yang dapat diakses tanpa login. |
| RF-02 | Sistem menyediakan registrasi akun petani. |
| RF-03 | Sistem menyediakan login untuk admin dan petani. |
| RF-04 | Sistem menyediakan logout. |
| RF-05 | Sistem membatasi akses berdasarkan role. |
| RF-06 | Sistem menampilkan dashboard petani. |
| RF-07 | Sistem menampilkan dashboard admin. |
| RF-08 | Admin dapat mengelola master data tanaman. |
| RF-09 | Petani dapat mengelola data lahan miliknya sendiri. |
| RF-10 | Sistem menampilkan peta interaktif untuk menentukan lokasi lahan. |
| RF-11 | Sistem memungkinkan petani memilih lahan aktif sebelum menggambar area. |
| RF-12 | Sistem memungkinkan petani menggambar polygon dengan titik-titik pada peta. |
| RF-13 | Sistem menyediakan mode gambar bebas untuk menggambar batas lahan. |
| RF-14 | Sistem menghitung luas lahan otomatis dari polygon. |
| RF-15 | Sistem menyimpan latitude, longitude, polygon area, dan luas lahan. |
| RF-16 | Sistem menampilkan polygon lama saat halaman peta dibuka ulang. |
| RF-17 | Petani dapat mengelola musim tanam. |
| RF-18 | Sistem menghitung estimasi panen. |
| RF-19 | Sistem menampilkan progress pertumbuhan tanaman. |
| RF-20 | Petani dapat mencatat biaya produksi. |
| RF-21 | Sistem menghitung total biaya produksi. |
| RF-22 | Petani dapat mencatat hasil panen. |
| RF-23 | Sistem menghitung total pendapatan. |
| RF-24 | Sistem menghitung profit. |
| RF-25 | Sistem menampilkan grafik analisis. |
| RF-26 | Sistem menampilkan laporan petani. |
| RF-27 | Sistem menampilkan laporan admin. |
| RF-28 | Sistem menyediakan halaman profil pengguna. |
| RF-29 | Sistem memvalidasi input pengguna. |
| RF-30 | Sistem memberikan feedback visual setelah aksi pengguna. |

## 8. Requirement Non-Fungsional

### 8.1 Usability

1. Tampilan mudah dipahami.
2. Menu konsisten.
3. Form memiliki label yang jelas.
4. Error message mudah dimengerti.
5. Empty state tersedia ketika data kosong.
6. Instruksi menggambar lahan pada peta harus singkat dan jelas.

### 8.2 Performance

1. Dashboard harus dapat dimuat dengan cepat.
2. Query agregasi dashboard harus efisien.
3. Peta tidak boleh membuat halaman terlalu berat.
4. Tile peta harus tetap memiliki fallback pesan ketika gagal dimuat.

### 8.3 Security

1. Password harus disimpan menggunakan hashing.
2. Input harus divalidasi.
3. Akses halaman dibatasi berdasarkan role.
4. Petani tidak boleh mengakses data petani lain.
5. Update data peta hanya boleh dilakukan pada lahan aktif milik user.
6. Query database harus aman dari SQL injection.

### 8.4 Reliability

1. Data yang disimpan harus masuk ke database.
2. Sistem tetap menampilkan halaman walaupun data kosong.
3. Kesalahan input ditangani dengan alert.
4. Hapus data penting memakai konfirmasi atau nonaktif.

### 8.5 Responsiveness

1. Landing page responsif.
2. Login dan register responsif.
3. Dashboard tetap nyaman digunakan pada laptop.
4. Tampilan mobile minimal tidak rusak.
5. Panel peta tetap dapat digunakan pada layar laptop.

## 9. Struktur Database

### 9.1 `users`

Menyimpan akun admin dan petani.

| Field | Keterangan |
| --- | --- |
| `id` | Primary key. |
| `nama` | Nama pengguna. |
| `email` | Email unik. |
| `password` | Password hash. |
| `nomor_hp` | Nomor HP. |
| `role` | `admin` atau `petani`. |
| `status` | `aktif` atau `nonaktif`. |
| `foto_profil` | Foto profil opsional. |
| `created_at`, `updated_at` | Timestamp. |

### 9.2 `tanaman`

Menyimpan master data tanaman.

| Field | Keterangan |
| --- | --- |
| `id` | Primary key. |
| `nama_tanaman` | Nama tanaman unik. |
| `masa_panen` | Masa panen dalam hari. |
| `deskripsi` | Deskripsi tanaman. |
| `status` | `aktif` atau `nonaktif`. |
| `created_at`, `updated_at` | Timestamp. |

### 9.3 `lahan`

Menyimpan data lahan petani.

| Field | Keterangan |
| --- | --- |
| `id` | Primary key. |
| `user_id` | Pemilik lahan. |
| `nama_lahan` | Nama lahan. |
| `lokasi` | Lokasi lahan. |
| `luas_lahan` | Luas lahan dalam hektare. Bisa diperbarui otomatis dari polygon. |
| `status_lahan` | `aktif` atau `nonaktif`. |
| `latitude` | Latitude marker. |
| `longitude` | Longitude marker. |
| `polygon_area` | JSON titik polygon. |
| `created_at`, `updated_at` | Timestamp. |

**Catatan akurasi:** Jika luas lahan perlu presisi tinggi, kolom `luas_lahan` sebaiknya menggunakan minimal 4 angka desimal, misalnya `DECIMAL(12,4)`.

### 9.4 `musim_tanam`

Menyimpan musim tanam pada lahan.

| Field | Keterangan |
| --- | --- |
| `id` | Primary key. |
| `lahan_id` | Relasi ke lahan. |
| `tanaman_id` | Relasi ke tanaman. |
| `tanggal_tanam` | Tanggal tanam. |
| `estimasi_panen` | Tanggal estimasi panen. |
| `status` | Status musim tanam. |
| `catatan` | Catatan opsional. |
| `created_at`, `updated_at` | Timestamp. |

### 9.5 `biaya_produksi`

Menyimpan biaya produksi per musim tanam.

| Field | Keterangan |
| --- | --- |
| `id` | Primary key. |
| `musim_tanam_id` | Relasi ke musim tanam. |
| `kategori` | Kategori biaya. |
| `nominal` | Nominal biaya. |
| `tanggal_biaya` | Tanggal biaya. |
| `keterangan` | Keterangan opsional. |
| `created_at`, `updated_at` | Timestamp. |

### 9.6 `hasil_panen`

Menyimpan hasil panen.

| Field | Keterangan |
| --- | --- |
| `id` | Primary key. |
| `musim_tanam_id` | Relasi ke musim tanam. |
| `total_hasil` | Jumlah hasil panen. |
| `satuan` | `kg`, `kuintal`, atau `ton`. |
| `harga_jual` | Harga jual per satuan. |
| `total_pendapatan` | Total hasil * harga jual. |
| `total_keuntungan` | Pendapatan - biaya produksi. |
| `catatan` | Catatan opsional. |
| `created_at`, `updated_at` | Timestamp. |

## 10. Relasi Database

1. Satu user petani memiliki banyak lahan.
2. Satu lahan memiliki banyak musim tanam.
3. Satu tanaman dapat digunakan oleh banyak musim tanam.
4. Satu musim tanam memiliki banyak biaya produksi.
5. Satu musim tanam memiliki satu hasil panen.
6. Admin berada di tabel `users` dengan role `admin`.

## 11. Business Logic

### 11.1 Perhitungan Luas Lahan dari Polygon

Sistem menghitung luas lahan setelah polygon memiliki minimal 3 titik. Titik polygon disimpan sebagai pasangan latitude dan longitude. Luas dihitung dalam meter persegi, lalu dikonversi menjadi hektare.

```text
Luas Hektare = Luas Meter Persegi / 10.000
```

Aturan:

1. Jika polygon kurang dari 3 titik, luas dianggap belum valid.
2. Jika polygon valid, panel detail menampilkan luas m2 dan hektare.
3. Saat Simpan Peta, nilai `luas_lahan` diperbarui menggunakan luas hektare dari polygon.
4. Jika user menghapus polygon tetapi belum menyimpan, data lama di database belum berubah.
5. Jika user mengedit titik polygon, luas harus dihitung ulang secara langsung.

### 11.2 Estimasi Panen

```text
Estimasi Panen = Tanggal Tanam + Masa Panen Tanaman
```

Contoh:

1. Tanggal tanam: 1 Juni 2026.
2. Tanaman: Jagung.
3. Masa panen: 90 hari.
4. Estimasi panen: 30 Agustus 2026.

### 11.3 Progress Tanaman

```text
Progress = Hari Berjalan / Masa Panen Tanaman * 100%
```

Aturan:

1. Jika progress kurang dari 0, tampilkan 0%.
2. Jika progress lebih dari 100, tampilkan 100%.
3. Jika progress mencapai 100%, tanaman dapat ditandai siap panen.

### 11.4 Total Biaya Produksi

```text
Total Biaya = Jumlah seluruh nominal biaya produksi pada satu musim tanam
```

### 11.5 Total Pendapatan

```text
Total Pendapatan = Total Hasil Panen * Harga Jual
```

### 11.6 Profit

```text
Profit = Total Pendapatan - Total Biaya Produksi
```

Aturan:

1. Profit lebih dari 0 berarti untung.
2. Profit sama dengan 0 berarti impas.
3. Profit kurang dari 0 berarti rugi.

## 12. API dan Endpoint Utama

### 12.1 Guest dan Auth

| Method | Endpoint | Fungsi |
| --- | --- | --- |
| GET | `/` | Landing page. |
| GET | `/login` | Halaman login. |
| POST | `/app/auth/login.php` | Proses login. |
| GET | `/register` | Halaman register. |
| POST | `/app/auth/register.php` | Proses register. |
| POST | `/app/auth/logout.php` | Logout. |

### 12.2 Petani

| Method | Endpoint | Fungsi |
| --- | --- | --- |
| GET | `/public/petani/dashboard.html` | Dashboard petani. |
| GET | `/app/api/lahan.php` | Mengambil daftar lahan petani. |
| POST | `/app/actions/lahan/create.php` | Menambah lahan. |
| POST | `/app/actions/lahan/update.php` | Mengedit lahan. |
| POST | `/app/actions/lahan/delete.php` | Menonaktifkan lahan. |
| POST | `/app/actions/lahan/update-map.php` | Menyimpan marker, polygon, dan luas peta lahan. |
| GET | `/app/api/musim-tanam.php` | Mengambil data musim tanam. |
| GET | `/app/api/biaya.php` | Mengambil data biaya. |
| GET | `/app/api/panen.php` | Mengambil data hasil panen. |
| GET | `/app/api/dashboard.php` | Mengambil ringkasan dashboard. |
| GET | `/app/api/laporan.php` | Mengambil data laporan. |

### 12.3 Admin

| Method | Endpoint | Fungsi |
| --- | --- | --- |
| GET | `/public/admin/dashboard.html` | Dashboard admin. |
| GET | `/public/admin/users.html` | Manajemen pengguna. |
| GET | `/public/admin/tanaman.html` | Master data tanaman. |
| GET | `/app/api/tanaman.php` | Mengambil data tanaman. |
| POST | `/app/actions/tanaman/create.php` | Menambah tanaman. |
| POST | `/app/actions/tanaman/update.php` | Mengedit tanaman. |
| POST | `/app/actions/tanaman/delete.php` | Menonaktifkan atau menghapus tanaman. |
| GET | `/app/api/admin-monitoring-lahan.php` | Mengambil data monitoring lahan admin. |

## 13. Navigasi

### 13.1 Navbar Guest

1. Home.
2. Fitur.
3. Tentang.
4. Peta/Preview.
5. Login.
6. Register.

### 13.2 Sidebar Petani

1. Dashboard.
2. Lahan.
3. Peta Lahan.
4. Musim Tanam.
5. Biaya Produksi.
6. Hasil Panen.
7. Analisis.
8. Laporan.
9. Profil.
10. Logout.

### 13.3 Sidebar Admin

1. Dashboard.
2. Data Pengguna.
3. Data Tanaman.
4. Monitoring Lahan.
5. Laporan.
6. Profil Admin.
7. Logout.

## 14. Popup, Modal, dan Feedback

1. Alert login gagal.
2. Alert register berhasil.
3. Alert validasi form.
4. Toast simpan berhasil.
5. Toast hapus atau nonaktif berhasil.
6. Modal konfirmasi nonaktif/hapus.
7. Marker popup pada peta.
8. Alert polygon belum valid.
9. Alert lahan belum dipilih.
10. Alert marker belum dibuat.
11. Alert tile peta gagal dimuat atau lambat.
12. Modal/filter laporan jika tersedia.

## 15. Prioritas Implementasi

### 15.1 Prioritas Wajib

1. Auth dan role.
2. Dashboard.
3. CRUD tanaman.
4. CRUD lahan.
5. Peta lahan.
6. Gambar polygon dan auto hitung luas.
7. CRUD musim tanam.
8. CRUD biaya produksi.
9. CRUD hasil panen.
10. Analisis profit.
11. Laporan tabel.

### 15.2 Prioritas Tambahan

1. Export PDF.
2. Export Excel.
3. Upload foto profil.
4. Reset password.
5. Cuaca API.

## 16. Risiko dan Mitigasi

| Risiko | Mitigasi |
| --- | --- |
| Waktu implementasi terbatas | Fokus pada alur demo utama: auth, lahan, peta, musim tanam, biaya, panen, analisis. |
| Peta Leaflet sulit selesai | Minimal marker dan polygon titik-titik harus berjalan; gambar bebas menjadi nilai tambah. |
| Hitung luas tidak presisi | Tampilkan hasil sebagai estimasi dan gunakan satuan hektare dengan pembulatan yang jelas. |
| Data peta gagal disimpan | Validasi lahan, marker, polygon, dan ownership sebelum update database. |
| Role access bermasalah | Test akun admin dan petani sejak awal. |
| Relasi data mengganggu hapus | Gunakan nonaktif atau batasi hapus jika data sudah punya relasi. |

## 17. Skenario Demo

### 17.1 Demo Guest

1. Buka landing page.
2. Tunjukkan fitur utama.
3. Klik register.

### 17.2 Demo Petani

1. Register akun petani.
2. Login sebagai petani.
3. Buka dashboard.
4. Tambah lahan.
5. Buka Peta Lahan.
6. Pilih lahan aktif.
7. Klik peta untuk menentukan marker.
8. Gambar polygon dengan titik-titik atau gambar bebas.
9. Tunjukkan luas m2 dan hektare otomatis.
10. Simpan peta.
11. Tunjukkan luas lahan di daftar lahan.
12. Tambah musim tanam.
13. Tunjukkan estimasi panen dan progress.
14. Tambah biaya produksi.
15. Input hasil panen.
16. Tunjukkan profit.
17. Buka analisis dan laporan.

### 17.3 Demo Admin

1. Login sebagai admin.
2. Buka dashboard admin.
3. Tunjukkan data pengguna.
4. Tunjukkan master data tanaman.
5. Tunjukkan monitoring lahan dengan marker, polygon, dan luas.
6. Tunjukkan laporan global.

## 18. Akun Demo

### Admin

```text
Email: admin@agrotrack.test
Password: password
```

### Petani

```text
Email: petani@agrotrack.test
Password: password
```

## 19. Kriteria Selesai

AgroTrack dianggap selesai untuk FP jika:

1. Semua halaman utama dapat dibuka.
2. Tidak ada error fatal saat demo.
3. Auth dan role berjalan.
4. CRUD utama berjalan.
5. Petani dapat memilih lahan pada peta.
6. Petani dapat menentukan marker lokasi lahan.
7. Petani dapat menggambar polygon batas lahan.
8. Sistem menghitung luas lahan otomatis dari polygon.
9. Sistem menyimpan marker, polygon, dan luas lahan.
10. Estimasi panen berjalan.
11. Perhitungan biaya, pendapatan, dan profit benar.
12. Dashboard menampilkan data dari database.
13. Analisis dan laporan tampil.
14. Dokumentasi dan README tersedia.
15. Source code tersimpan di GitHub.

## 20. Future Development

1. Mobile app.
2. AI rekomendasi tanaman.
3. IoT monitoring sensor tanah.
4. Notifikasi WhatsApp.
5. Analisis cuaca lanjutan.
6. Integrasi harga pasar komoditas.
7. Forum komunitas petani.
8. Konsultasi dengan ahli pertanian.
9. Marketplace hasil panen.
10. Payment gateway.
11. QR code laporan lahan.
12. Dark mode.

## 21. Kesimpulan

AgroTrack adalah aplikasi web pertanian berbasis peta yang membantu petani mengelola lahan, musim tanam, biaya produksi, hasil panen, dan analisis keuntungan secara digital. Fitur peta menjadi pembeda utama karena petani dapat memilih lahan, menggambar batas area langsung di peta, dan mendapatkan luas otomatis berdasarkan area yang digambar.

Dengan cakupan autentikasi, role access, CRUD, database relasional, peta interaktif, perhitungan bisnis, dashboard, grafik, laporan, validasi form, dan dokumentasi, AgroTrack sudah memenuhi kebutuhan proyek final Pemrograman Web dan siap dijadikan alur demo yang jelas.
