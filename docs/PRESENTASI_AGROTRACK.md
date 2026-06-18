# Presentasi AgroTrack

**Muhammad Farhan**  
**NRP:** 5054241018  
**Kelas:** Pemrograman Web N  
**Link Web:** https://agrotrack.farhankuliah.my.id/

## Slide 1 - Judul

**AgroTrack**  
Platform Manajemen Pertanian Digital

Poin bicara:

- AgroTrack adalah aplikasi web untuk membantu pencatatan dan analisis data pertanian.
- Sistem ini memiliki dua portal utama, yaitu petani dan admin.
- Project dibuat untuk tugas Pemrograman Web.

## Slide 2 - Latar Belakang

Masalah:

- Pencatatan lahan, biaya, dan panen sering terpisah.
- Petani sulit mengetahui profit secara cepat.
- Admin membutuhkan sistem untuk memantau data pengguna, lahan, katalog, dan laporan.

Poin bicara:

- Banyak data pertanian sebenarnya saling terhubung.
- Jika dicatat manual, data biaya dan hasil panen sulit dianalisis.
- AgroTrack mencoba menyatukan proses tersebut dalam satu web.

## Slide 3 - Tujuan Aplikasi

Tujuan:

- Membantu petani mencatat lahan dan musim tanam.
- Membantu petani menghitung biaya, pendapatan, dan profit.
- Membantu admin memantau data sistem.
- Menyediakan laporan yang dapat diexport ke PDF.

Poin bicara:

- Fokus aplikasi bukan hanya input data, tetapi juga membuat data tersebut berguna untuk keputusan.

## Slide 4 - Pengguna Sistem

### Petani

- Mengelola lahan.
- Menggambar polygon lahan.
- Membuat musim tanam.
- Mencatat biaya produksi.
- Mencatat hasil panen.
- Melihat analisis profit.

### Admin

- Mengelola pengguna.
- Mengelola master tanaman.
- Mengelola katalog kebutuhan.
- Monitoring lahan.
- Melihat laporan global.

Poin bicara:

- Role dipisahkan agar akses admin dan petani tidak tercampur.

## Slide 5 - Teknologi yang Digunakan

Backend:

- PHP Native
- PDO MySQL
- Session authentication
- CSRF token
- Password hashing

Frontend:

- HTML5
- CSS3
- JavaScript Vanilla
- Bootstrap 5.3.8 lokal

Library:

- Leaflet.js
- Leaflet Draw
- Turf.js
- Chart.js
- jsPDF

Deployment:

- Docker
- Docker Compose
- Apache
- MySQL
- phpMyAdmin

## Slide 6 - Arsitektur Project

Struktur utama:

```text
auth/       halaman login, register, logout
pages/      halaman admin dan petani
app/        core helper, layout, query
api/        endpoint API dan warmup
config/     koneksi database
database/   schema, seed, migration
assets/     CSS, JS, Bootstrap lokal, gambar
docs/       dokumentasi project
```

Poin bicara:

- Struktur dibuat agar halaman, logic helper, database, dan asset terpisah.
- Akses halaman diproteksi menggunakan role guard.

## Slide 7 - Fitur Authentication

Fitur:

- Login admin dan petani.
- Register publik khusus petani.
- Logout session.
- Role guard.
- Password hashing.
- CSRF token.

Poin bicara:

- Admin tidak dibuat dari form publik.
- Jika akun petani mencoba halaman admin, sistem menolak akses.

## Slide 8 - Portal Petani

Fitur utama:

- Dashboard petani.
- Kelola lahan.
- Peta lahan.
- Musim tanam.
- Katalog operasional.
- Biaya produksi.
- Hasil panen.
- Analisis profit.
- Profil petani.

Poin bicara:

- Alur petani dimulai dari lahan, lalu musim tanam, biaya, panen, dan analisis.

## Slide 9 - Peta Lahan

Fitur:

- Menampilkan lahan milik petani.
- Menggambar polygon.
- Menghitung luas otomatis.
- Menyimpan polygon ke database.

Teknologi:

- Leaflet.js
- Leaflet Draw
- Turf.js

Poin bicara:

- Luas lahan tidak hanya input manual, tetapi dapat dihitung dari batas polygon.

## Slide 10 - Biaya dan Hasil Panen

Biaya:

- Input biaya manual.
- Input biaya dari katalog.
- Kategori biaya pertanian.
- Riwayat biaya per user.

Hasil panen:

- Total hasil dalam kg.
- Harga jual per kg.
- Pendapatan otomatis.
- Kualitas dan pembeli.

Poin bicara:

- Pendapatan dihitung otomatis dari hasil panen dan harga jual.
- Profit dihitung dari pendapatan dikurangi biaya.

## Slide 11 - Analisis Profit

Fitur:

- Grafik biaya per kategori.
- Grafik biaya, pendapatan, dan profit per musim.
- Ringkasan total biaya.
- Ringkasan total pendapatan.
- Ringkasan profit.
- Export PDF.

Poin bicara:

- Analisis membantu petani melihat komponen biaya terbesar dan hasil akhir usaha tani.

## Slide 12 - Portal Admin

Fitur:

- Dashboard admin.
- Data pengguna.
- Data tanaman.
- Katalog kebutuhan.
- Monitoring lahan.
- Laporan global.
- Profil admin.

Poin bicara:

- Admin berperan menjaga master data dan memantau kondisi sistem secara global.

## Slide 13 - Laporan PDF

Fitur:

- Generate PDF laporan admin.
- Generate PDF analisis petani.
- Print preview sebelum file disimpan.
- Detail laporan lebih lengkap.

Poin bicara:

- PDF tidak langsung terdownload, tetapi membuka preview agar user dapat memeriksa hasilnya dulu.

## Slide 14 - Optimasi Performa

Optimasi yang diterapkan:

- Bootstrap disimpan lokal.
- Cache header untuk asset.
- Query database dibatasi dengan `LIMIT`.
- Index database untuk query penting.
- PDO persistent connection.
- Timeout koneksi database.
- Warmup server dari landing page.
- Gambar besar dikompresi manual.

Poin bicara:

- Loading yang tidak stabil biasanya berasal dari cold start, koneksi DB, cache browser, atau asset eksternal.
- Warmup server dipakai untuk membuka koneksi ringan sebelum user login.

## Slide 15 - Demo Aplikasi

Urutan demo petani:

1. Buka landing page.
2. Klik masuk sebagai petani.
3. Login sebagai petani.
4. Buka dashboard.
5. Kelola lahan.
6. Buka peta lahan.
7. Tambah musim tanam.
8. Catat biaya produksi.
9. Catat hasil panen.
10. Lihat analisis.

Urutan demo admin:

1. Login sebagai admin.
2. Buka dashboard admin.
3. Buka data pengguna.
4. Buka data tanaman.
5. Buka katalog kebutuhan.
6. Buka monitoring lahan.
7. Generate laporan PDF.

## Slide 16 - Testing dan Validasi

Validasi yang dilakukan:

- Docker Compose config valid.
- JavaScript dicek dengan `node --check`.
- Role admin dan petani dipisahkan.
- Query login memakai prepared statement.
- PDF membuka print preview.
- Favicon tampil menggunakan logo AgroTrack.

Poin bicara:

- Beberapa validasi PHP lint bergantung pada ketersediaan PHP CLI di environment lokal.

## Slide 17 - Kelebihan Aplikasi

- Fitur cukup lengkap untuk alur usaha tani.
- Role admin dan petani jelas.
- UI sudah menggunakan Bootstrap dan custom CSS.
- Peta lahan interaktif.
- Ada laporan dan export PDF.
- Database memiliki relasi dan index.
- Dapat dijalankan dengan Docker.

## Slide 18 - Batasan Aplikasi

- Beberapa library masih memakai CDN.
- Gambar katalog perlu terus dikompresi agar ringan.
- Data cuaca dan analisis tanah belum benar-benar terintegrasi API eksternal.
- Belum ada pagination penuh di semua halaman.
- Belum ada dashboard real-time.

## Slide 19 - Pengembangan Selanjutnya

Rencana pengembangan:

- Pagination untuk tabel besar.
- Optimasi gambar ke WebP.
- Menyimpan library eksternal secara lokal.
- Integrasi data cuaca.
- Analisis tanah dan rekomendasi tanaman.
- Notifikasi musim tanam dan panen.
- Backup dan restore data.

## Slide 20 - Penutup

Kesimpulan:

AgroTrack adalah aplikasi web manajemen pertanian yang membantu pencatatan lahan, musim tanam, biaya produksi, hasil panen, analisis profit, dan laporan. Sistem ini membagi akses antara petani dan admin sehingga data lebih rapi, terstruktur, dan mudah dipantau.

Kalimat penutup:

Dengan AgroTrack, data usaha tani tidak hanya dicatat, tetapi juga diolah menjadi informasi yang membantu pengambilan keputusan.

