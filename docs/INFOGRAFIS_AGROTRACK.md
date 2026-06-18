# Infografis AgroTrack

**Muhammad Farhan**  
**NRP:** 5054241018  
**Kelas:** Pemrograman Web N  
**Link Web:** https://agrotrack.farhankuliah.my.id/

## Judul Utama

**AgroTrack: Platform Manajemen Pertanian Digital**

## Tagline

Pantau lahan, musim tanam, biaya produksi, hasil panen, dan profit dalam satu sistem yang rapi.

## Masalah yang Diangkat

Petani sering mencatat data usaha tani secara terpisah, manual, atau tidak konsisten. Akibatnya, data lahan, biaya produksi, hasil panen, dan profit sulit dihitung secara cepat.

## Solusi AgroTrack

AgroTrack membantu petani dan admin mengelola data pertanian berbasis web. Semua proses utama dicatat dalam satu aplikasi, mulai dari data lahan sampai laporan.

## Pengguna Utama

### Petani

- Mengelola data lahan.
- Menggambar polygon lahan.
- Membuat musim tanam.
- Mencatat biaya produksi.
- Mencatat hasil panen.
- Melihat analisis profit.
- Mengelola profil akun.

### Admin

- Memantau pengguna.
- Mengelola master tanaman.
- Mengelola katalog kebutuhan.
- Memantau lahan petani.
- Melihat laporan global.
- Menghasilkan laporan PDF.

## Alur Sistem

1. **Login / Register**
   Petani dapat mendaftar, sedangkan admin disiapkan oleh sistem.

2. **Kelola Lahan**
   Petani menambahkan data lahan, lokasi, status, dan komoditas.

3. **Peta Lahan**
   Petani menggambar polygon pada peta untuk menghitung luas lahan.

4. **Musim Tanam**
   Petani membuat musim tanam berdasarkan lahan dan tanaman.

5. **Biaya Produksi**
   Biaya dicatat manual atau dari katalog operasional.

6. **Hasil Panen**
   Pendapatan dihitung dari total hasil dan harga jual per kg.

7. **Analisis Profit**
   Sistem menampilkan biaya, pendapatan, dan profit.

8. **Laporan**
   Admin dan petani dapat menghasilkan rekap data dalam PDF.

## Fitur Unggulan

- Role login untuk admin dan petani.
- Register publik khusus petani.
- Dashboard ringkasan data.
- Peta lahan dengan polygon.
- Perhitungan luas otomatis.
- Katalog kebutuhan operasional.
- Pencatatan biaya produksi dan biaya operasional.
- Pencatatan hasil panen.
- Analisis biaya, pendapatan, dan profit.
- Export laporan PDF dengan print preview.
- Favicon dan logo AgroTrack.
- Optimasi loading dengan Bootstrap lokal, cache asset, query limit, dan warmup server.

## Teknologi

- PHP Native
- MySQL
- PDO
- HTML5
- CSS3
- JavaScript Vanilla
- Bootstrap 5.3.8 lokal
- Leaflet.js
- Leaflet Draw
- Turf.js
- Chart.js
- jsPDF
- Docker Compose

## Arsitektur Singkat

```text
User
  |
  v
Landing Page
  |
  v
Auth Login / Register
  |
  +--> Portal Petani
  |      +--> Lahan
  |      +--> Peta Lahan
  |      +--> Musim Tanam
  |      +--> Biaya Produksi
  |      +--> Hasil Panen
  |      +--> Analisis
  |
  +--> Portal Admin
         +--> Data Pengguna
         +--> Data Tanaman
         +--> Katalog Kebutuhan
         +--> Monitoring Lahan
         +--> Laporan Global
```

## Keamanan dan Validasi

- Password disimpan dengan hashing.
- Form penting menggunakan CSRF token.
- Role guard memisahkan akses admin dan petani.
- Query database menggunakan PDO prepared statement.
- Data petani dibatasi berdasarkan user yang sedang login.

## Optimasi Performa

- Bootstrap disimpan lokal.
- Asset CSS dan JS diberi cache header.
- Koneksi database diberi timeout.
- Query dashboard dan admin dibatasi dengan `LIMIT`.
- Index database ditambahkan untuk query utama.
- Endpoint warmup ringan dari landing page.
- Gambar besar dikompresi manual.

## Output Akhir

AgroTrack menghasilkan sistem manajemen pertanian berbasis web yang dapat membantu pencatatan, pemantauan, analisis, dan pelaporan data usaha tani.

## Ide Layout Infografis

### Bagian Atas

- Logo AgroTrack
- Judul utama
- Tagline
- Identitas mahasiswa

### Bagian Tengah

- Masalah
- Solusi
- Dua role pengguna: Admin dan Petani
- Alur sistem dalam bentuk panah

### Bagian Bawah

- Fitur unggulan
- Teknologi
- Link web publik
- Ringkasan manfaat

## Warna yang Disarankan

- Hijau tua untuk identitas pertanian.
- Kuning/oranye untuk highlight panen dan profit.
- Putih atau hijau muda untuk latar konten.
- Biru lembut untuk informasi sistem atau data.

