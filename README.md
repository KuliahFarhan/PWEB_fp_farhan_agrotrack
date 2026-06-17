# AgroTrack

**Muhammad Farhan**  
**NRP:** 5054241018  
**Kelas:** Pemrograman Web N  
**Link Publik:** https://agrotrack.farhankuliah.my.id/

AgroTrack adalah aplikasi web manajemen pertanian berbasis PHP native dan MySQL. Aplikasi ini dibuat untuk membantu petani mencatat data lahan, musim tanam, biaya produksi, katalog kebutuhan operasional, hasil panen, dan analisis profit. AgroTrack juga memiliki portal admin untuk memantau pengguna, data lahan, katalog kebutuhan, tanaman, dan laporan global.

Project ini menggunakan arsitektur PHP native sederhana dengan session authentication, role guard, PDO prepared statement, dan struktur folder yang dipisahkan antara `auth`, `pages`, `app`, `api`, `config`, `database`, dan `assets`.

## Ringkasan Aplikasi

AgroTrack memiliki dua jenis pengguna utama:

1. **Petani**
   - Mengelola data lahan.
   - Menggambar polygon lahan pada peta.
   - Membuat musim tanam.
   - Mencatat biaya produksi dan biaya operasional.
   - Melihat katalog kebutuhan pertanian.
   - Mencatat hasil panen.
   - Melihat analisis biaya, pendapatan, dan profit.
   - Mengelola profil akun.

2. **Admin**
   - Melihat dashboard sistem.
   - Mengelola data pengguna.
   - Mengelola master tanaman.
   - Mengelola katalog kebutuhan.
   - Memantau data lahan petani.
   - Melihat laporan global.
   - Mengelola profil admin.

## Teknologi yang Digunakan

### Backend

- **PHP 8.2**
- **PHP Native**
- **PDO MySQL**
- **Session-based authentication**
- **Password hashing** dengan `password_hash()` dan `password_verify()`
- **CSRF token** untuk form penting
- **Role guard** untuk membedakan akses admin dan petani

### Database

- **MySQL 8.0**
- Relasi tabel dengan foreign key
- Index untuk query utama
- Seed data demo
- Migration SQL incremental

### Frontend

- **HTML5**
- **CSS3**
- **JavaScript vanilla**
- **Bootstrap 5.3.8 lokal/self-hosted**
- Custom CSS AgroTrack di `assets/css/styles.css`
- Fallback ikon lokal melalui JavaScript agar halaman tidak bergantung pada font icon eksternal

### Library Tambahan

- **Leaflet.js** untuk peta lahan
- **Leaflet Draw** untuk menggambar polygon
- **Turf.js** untuk perhitungan area polygon
- **Chart.js** untuk grafik analisis
- **jsPDF + jsPDF AutoTable** untuk export laporan PDF

### DevOps dan Deployment

- **Docker**
- **Docker Compose**
- **Apache HTTP Server**
- **phpMyAdmin**
- Konfigurasi Apache tambahan di `docker/apache-security.conf`

## Fitur Utama

### Authentication

- Login petani dan admin.
- Register publik khusus akun petani.
- Logout session.
- Proteksi role halaman admin dan petani.
- Password disimpan dalam bentuk hash.
- Form login/register menggunakan CSRF token.
- Timeout koneksi database dikonfigurasi agar error DB tidak membuat halaman terlalu lama loading.

### Portal Petani

- **Dashboard Petani**
  - Ringkasan total lahan.
  - Ringkasan musim aktif.
  - Ringkasan total biaya.
  - Ringkasan profit.
  - Daftar lahan prioritas.
  - Daftar musim tanam terbaru.

- **Data Lahan**
  - Tambah, edit, dan soft delete lahan.
  - Data lahan scoped berdasarkan user yang sedang login.
  - Set komoditas, lokasi, status, luas manual, dan catatan.

- **Peta Lahan**
  - Pilih lahan milik petani.
  - Gambar marker dan polygon.
  - Hitung luas polygon otomatis.
  - Simpan polygon ke database.
  - Data polygon hanya dapat diakses oleh pemilik lahan.

- **Musim Tanam**
  - Buat musim tanam berdasarkan lahan dan tanaman.
  - Estimasi tanggal panen otomatis berdasarkan masa panen master tanaman.
  - Kalender tanam interaktif.
  - Progress musim tanam.

- **Katalog Operasional**
  - Katalog kebutuhan pertanian untuk padi, jagung, dan kedelai.
  - Kategori dari pra-tanam sampai pascapanen.
  - Detail item, fase, jenis biaya, satuan, fungsi, risiko, dan catatan.
  - Item katalog dapat langsung dipakai untuk mencatat biaya operasional.

- **Biaya Produksi**
  - Input biaya manual.
  - Input biaya dari item katalog.
  - Kategori biaya seperti benih, pupuk, pestisida, tenaga kerja, irigasi, alat, transportasi, dan lainnya.
  - Riwayat biaya berdasarkan user.

- **Hasil Panen**
  - Input data hasil panen.
  - Hitung pendapatan dari berat panen dan harga per kg.
  - Simpan kualitas, status, pembeli, dan catatan.
  - Relasi dengan lahan dan musim tanam.

- **Analisis Petani**
  - Grafik biaya per kategori.
  - Grafik biaya, pendapatan, dan profit per musim.
  - Ringkasan total biaya, total pendapatan, dan profit.
  - Export analisis ke PDF.

- **Profil Petani**
  - Update nama, nomor handphone, lokasi, komoditas utama, total lahan, bio, dan foto profil.
  - Email dibuat readonly agar identitas login tetap konsisten.

### Portal Admin

- **Dashboard Admin**
  - Ringkasan total pengguna.
  - Ringkasan total luas lahan.
  - Ringkasan musim aktif.
  - Ringkasan total panen.
  - Daftar pengguna terbaru.
  - Daftar lahan terbaru.

- **Data Pengguna**
  - Melihat daftar user.
  - Mengubah nama dan status pengguna.
  - Reset password pengguna.
  - Filter/search tabel pengguna.

- **Data Tanaman**
  - CRUD master tanaman.
  - Menentukan nama tanaman, slug, kategori, masa panen, deskripsi, gambar, dan status.
  - Master tanaman dipakai pada lahan dan musim tanam.

- **Katalog Kebutuhan**
  - Mengelola item katalog operasional.
  - Edit nama, kategori, subkategori, fase, mode biaya, satuan, harga, fungsi, keterangan, risiko, path gambar, dan status aktif.
  - Katalog ditampilkan pada portal petani.

- **Monitoring Lahan**
  - Melihat daftar lahan semua petani.
  - Mengetahui status polygon dan luas lahan.
  - Melihat petani pemilik lahan, tanaman, komoditas, lokasi, dan status.

- **Laporan Global**
  - Ringkasan data pengguna, lahan, musim tanam, katalog, dan biaya operasional.
  - Export laporan ke PDF.

- **Profil Admin**
  - Update data profil admin.
  - Upload foto profil.

## Struktur Folder

```text
PWEB_fp_farhan_agrotrack/
├── api/
│   ├── auth/
│   │   └── demo-login.php
│   └── lahan-map.php
├── app/
│   ├── controllers/
│   │   └── LahanMapController.php
│   ├── core/
│   │   ├── bootstrap.php
│   │   ├── layout.php
│   │   └── queries.php
│   └── models/
│       └── LahanMap.php
├── assets/
│   ├── Bootstrap/
│   │   ├── css/
│   │   │   └── bootstrap.min.css
│   │   └── js/
│   │       └── bootstrap.bundle.min.js
│   ├── css/
│   │   └── styles.css
│   ├── image/
│   ├── js/
│   │   ├── app.js
│   │   ├── analisis-petani.js
│   │   ├── laporan-admin.js
│   │   └── peta-lahan.js
│   └── uploads/
├── auth/
│   ├── login.php
│   ├── register.php
│   ├── logout.php
│   └── forgot-password.html
├── config/
│   └── database.php
├── database/
│   ├── 00_create_database.sql
│   ├── 01_schema.sql
│   ├── seed.sql
│   ├── migrations/
│   └── seeds/
├── docker/
│   └── apache-security.conf
├── docs/
├── pages/
│   ├── admin/
│   ├── petani/
│   └── forbidden.php
├── docker-compose.yml
├── Dockerfile
├── index.html
└── README.md
```

## Penjelasan Folder Penting

- `auth/`
  - Berisi login, register, logout, dan halaman reset password demo.

- `app/core/`
  - `bootstrap.php`: helper utama aplikasi seperti session, redirect, CSRF, current user, role guard, format angka, dan upload foto.
  - `layout.php`: komponen layout seperti `render_head()`, sidebar, flash message, dan panel bantuan.
  - `queries.php`: query ringkasan petani/admin dan helper katalog/progress.

- `app/controllers/` dan `app/models/`
  - Dipakai untuk API peta lahan dan penyimpanan polygon.

- `pages/petani/`
  - Halaman utama untuk role petani.

- `pages/admin/`
  - Halaman utama untuk role admin.

- `config/database.php`
  - Konfigurasi koneksi database menggunakan PDO.
  - Mendukung environment variable `AGROTRACK_DB_*` atau `DB_*`.
  - Memiliki timeout koneksi agar error database lebih cepat diketahui.

- `database/`
  - Schema utama, seed demo, migration, dan data awal.

- `assets/Bootstrap/`
  - Bootstrap resmi yang disimpan lokal agar halaman tidak bergantung pada CDN Bootstrap.

- `assets/css/styles.css`
  - Styling utama AgroTrack.

- `assets/js/`
  - JavaScript umum aplikasi, peta, analisis, dan laporan.

## Database

Schema utama berada di:

```text
database/01_schema.sql
```

Tabel utama:

- `users`
- `tanaman`
- `lahan`
- `musim_tanam`
- `biaya_produksi`
- `katalog_items`
- `biaya_operasional`
- `modal_sumber`
- `risk_register`
- `hasil_panen`
- `monitoring_lahan`
- `aktivitas`
- `notifikasi`

View ringkasan:

- `v_ringkasan_petani`

Seed utama:

```text
database/seed.sql
database/seeds/030_farhan_dummy_clean.sql
```

## Cara Menjalankan dengan Docker

Pastikan Docker Desktop sudah aktif, lalu jalankan:

```bash
docker compose up --build
```

URL lokal:

- App: http://localhost:8090
- phpMyAdmin: http://localhost:8081
- MySQL dari host: `localhost:3307`
- MySQL dari container app: `mysql:3306`

Konfigurasi default:

```text
Database: agrotrack
User: agrotrack
Password: agrotrack_password
Root Password: root_password
```

Jika ingin reset database total:

```bash
docker compose down -v
docker compose up --build
```

Perintah `down -v` akan menghapus volume MySQL, jadi gunakan hanya untuk development.

## Cara Menjalankan tanpa Docker

1. Pastikan PHP 8.2+, Apache/Nginx, dan MySQL sudah aktif.
2. Buat database `agrotrack`.
3. Import schema:

   ```sql
   database/01_schema.sql
   ```

4. Import seed:

   ```sql
   database/seed.sql
   database/seeds/030_farhan_dummy_clean.sql
   ```

5. Arahkan document root web server ke folder project.
6. Set environment variable database, atau sesuaikan default di `config/database.php`.

Jangan membuka file `.php` langsung memakai `file:///...` atau Live Server biasa, karena PHP harus diproses oleh PHP runtime/Apache.

## Environment Variable

Contoh environment tersedia di:

```text
.env.example
.env.production.example
```

Variable utama:

```text
APP_PORT=8090
PHPMYADMIN_PORT=8081

DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=agrotrack
DB_USERNAME=agrotrack
DB_PASSWORD=agrotrack_password
DB_ROOT_PASSWORD=root_password
DB_FORWARD_PORT=3307
DB_TIMEOUT=3

AGROTRACK_DB_HOST=mysql
AGROTRACK_DB_PORT=3306
AGROTRACK_DB_NAME=agrotrack
AGROTRACK_DB_USER=agrotrack
AGROTRACK_DB_PASS=agrotrack_password
AGROTRACK_DB_TIMEOUT=3
```

## Akun Demo

```text
Admin
Email    : admin@agrotrack.com
Password : admin234

Petani
Email    : petani@agrotrack.test
Password : password
```

Register publik akan selalu membuat akun dengan role `petani`. Akun admin dibuat melalui seed/database.

## Alur Penggunaan

### Alur Petani

1. Login sebagai petani.
2. Tambahkan data lahan.
3. Buka peta lahan dan gambar polygon.
4. Buat musim tanam.
5. Catat biaya produksi atau biaya dari katalog operasional.
6. Input hasil panen.
7. Lihat analisis profit dan laporan.

### Alur Admin

1. Login sebagai admin.
2. Pantau ringkasan sistem dari dashboard.
3. Kelola data pengguna.
4. Kelola master tanaman.
5. Kelola katalog kebutuhan.
6. Pantau lahan petani.
7. Generate laporan global.

## Keamanan dan Validasi

- Password user disimpan dalam bentuk hash.
- Query database menggunakan PDO prepared statement.
- Form penting memakai CSRF token.
- Session diregenerasi saat login berhasil.
- Halaman admin dan petani dipisahkan dengan role guard.
- Query data petani dibatasi berdasarkan `user_id`.
- Upload foto profil dibatasi pada format JPG, PNG, dan WEBP.
- Koneksi database memiliki timeout agar tidak menggantung terlalu lama saat konfigurasi salah.

## Optimasi Loading

Beberapa optimasi yang sudah diterapkan:

- Bootstrap dipasang lokal di `assets/Bootstrap`, bukan dari CDN.
- Font utama memakai stack lokal/system font agar tidak menunggu Google Fonts.
- Ikon memakai fallback lokal agar tidak menunggu font icon eksternal.
- CSS utama diberi versioning berdasarkan `filemtime()`.
- Timeout database dibuat pendek dan bisa diatur lewat environment variable.

Catatan:

- Beberapa fitur seperti peta, grafik, dan PDF masih memakai library eksternal seperti Leaflet, Turf, Chart.js, dan jsPDF. Bagian tersebut dapat dilokalkan juga jika diperlukan untuk mode full offline.

## Catatan File HTML dan PHP

Folder ini masih menyimpan beberapa file `.html` sebagai arsip/prototipe tampilan. Jalur aplikasi yang aktif dan terhubung database adalah file `.php`, terutama:

- `auth/login.php`
- `auth/register.php`
- `pages/petani/*.php`
- `pages/admin/*.php`
- `api/lahan-map.php`

Gunakan halaman `.php` ketika menjalankan aplikasi sebenarnya.

## Dokumentasi Katalog

Dokumen referensi katalog berada di folder:

```text
docs/
```

Contoh isi:

- katalog benih dan bibit
- katalog pupuk dan nutrisi
- katalog pembenah tanah
- katalog perlindungan tanaman
- katalog air dan irigasi
- katalog persiapan lahan
- katalog tenaga kerja
- katalog alat dan mesin
- katalog panen dan pascapanen
- katalog transportasi dan logistik
- katalog risiko dan kerugian

Data katalog tersebut dipakai sebagai dasar isi tabel `katalog_items`.

## Deployment

Versi publik project tersedia di:

```text
https://agrotrack.farhankuliah.my.id/
```

Untuk production, pastikan:

- `APP_DEBUG=false`
- password database diganti dari default
- permission folder upload benar
- HTTPS aktif
- database dibackup secara berkala
- file seed demo tidak dijalankan ulang sembarangan pada database production

## Lisensi dan Atribusi

Project ini dibuat untuk kebutuhan tugas Pemrograman Web. Bootstrap digunakan sebagai framework CSS lokal/self-hosted. Library pihak ketiga lain digunakan sesuai kebutuhan fitur peta, grafik, dan export PDF.
