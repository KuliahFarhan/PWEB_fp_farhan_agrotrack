# AgroTrack

**Nama:** Muhammad Farhan
**NRP:** 5054241018
**Kelas:** Pemrograman Web N
**Link Web Publik:** https://agrotrack.farhankuliah.my.id/

AgroTrack adalah aplikasi web manajemen pertanian berbasis PHP native dan MySQL. Aplikasi ini dibuat untuk membantu petani mengelola data lahan, musim tanam, biaya produksi, katalog operasional, hasil panen, dan analisis profit dalam satu sistem. AgroTrack juga menyediakan portal admin untuk memantau pengguna, data lahan, tanaman, katalog kebutuhan, dan laporan global.

Project ini memakai arsitektur PHP native sederhana dengan pemisahan folder `auth`, `pages`, `app`, `api`, `config`, `database`, dan `assets`. Aplikasi sudah mendukung role `admin` dan `petani`, session authentication, prepared statement PDO, CSRF token untuk form penting, serta deployment menggunakan Docker Compose.

## Daftar Isi

- [Fitur Utama](#fitur-utama)
- [Teknologi yang Digunakan](#teknologi-yang-digunakan)
- [Struktur Folder](#struktur-folder)
- [Penjelasan Folder dan File Penting](#penjelasan-folder-dan-file-penting)
- [Database](#database)
- [Cara Menjalankan dengan Docker](#cara-menjalankan-dengan-docker)
- [Deployment VPS](#deployment-vps)
- [Akun Demo](#akun-demo)
- [Alur Penggunaan](#alur-penggunaan)
- [Keamanan dan Validasi](#keamanan-dan-validasi)
- [Catatan Performa](#catatan-performa)

## Fitur Utama

### Landing Page

- Landing page publik AgroTrack.
- Tombol masuk ke sistem.
- Pilihan masuk sebagai admin atau petani.
- Tombol daftar petani.
- Ringkasan fitur yang sesuai dengan modul aplikasi yang benar-benar tersedia.
- Warmup request ke server saat user membuka landing page agar koneksi awal ke backend dan database lebih siap.

### Authentication

- Login untuk admin dan petani.
- Register publik khusus akun petani.
- Logout session.
- Role guard untuk membatasi halaman admin dan petani.
- Password disimpan menggunakan hashing.
- Validasi form login dan register.
- CSRF token pada form login/register.
- Halaman forgot password berupa informasi reset manual, karena reset email otomatis belum diaktifkan.

### Portal Petani

- Dashboard ringkasan petani.
- Kelola data lahan.
- Tambah, edit, dan soft delete lahan.
- Data lahan dibatasi berdasarkan user yang sedang login.
- Peta lahan dengan marker dan polygon.
- Perhitungan luas polygon lahan.
- Buat dan kelola musim tanam.
- Estimasi panen berdasarkan data tanaman.
- Katalog operasional pertanian.
- Input biaya produksi manual.
- Input biaya dari katalog operasional.
- Catat sumber modal.
- Catat risiko dan mitigasi.
- Catat hasil panen.
- Perhitungan pendapatan dari berat panen dan harga jual.
- Analisis biaya, pendapatan, dan profit.
- Grafik ringkasan analisis.
- Export laporan/analisis ke PDF melalui print preview browser.
- Update profil dan foto profil petani.

### Portal Admin

- Dashboard ringkasan sistem.
- Kelola data pengguna.
- Ubah status pengguna.
- Reset password pengguna.
- CRUD master tanaman.
- Kelola katalog operasional.
- Monitoring lahan semua petani.
- Melihat status polygon dan luas lahan.
- Laporan global sistem.
- Export laporan admin ke PDF.
- Update profil dan foto profil admin.

## Teknologi yang Digunakan

### Backend

- PHP 8.2 native.
- PDO MySQL.
- Prepared statement untuk query database.
- Session-based authentication.
- Role guard untuk admin dan petani.
- CSRF token untuk form utama.
- Helper layout dan query di folder `app/core`.

### Frontend

- HTML5.
- CSS3.
- JavaScript vanilla.
- Bootstrap 5.3.8 lokal di `assets/Bootstrap`.
- Custom CSS di `assets/css/styles.css`.
- Font stack lokal/system agar halaman tidak bergantung pada Google Fonts.

### Library Pendukung

- Leaflet untuk peta.
- Leaflet Draw untuk menggambar polygon lahan.
- Turf.js untuk perhitungan area polygon.
- Chart.js untuk grafik.
- jsPDF dan AutoTable untuk export PDF.
- Bootstrap Icons untuk ikon.

### DevOps

- Docker.
- Docker Compose.
- Apache HTTP Server.
- MySQL 8.0.
- phpMyAdmin.
- OPcache untuk runtime PHP production.

## Struktur Folder

```text
PWEB_fp_farhan_agrotrack/
|-- api/
|   |-- lahan-map.php
|   |-- ping.php
|   `-- warmup.php
|-- app/
|   |-- controllers/
|   |-- core/
|   `-- models/
|-- assets/
|   |-- Bootstrap/
|   |-- css/
|   |-- image/
|   |-- js/
|   `-- uploads/
|-- auth/
|   |-- forgot-password.html
|   |-- login.php
|   |-- logout.php
|   `-- register.php
|-- config/
|   `-- database.php
|-- database/
|   `-- init/
|       |-- 001_schema_users.sql
|       |-- 002_schema_tanaman.sql
|       |-- ...
|       |-- 014_schema_views.sql
|       |-- 101_seed_base_users_tanaman.sql
|       |-- ...
|       `-- 204_seed_farhan_operasional_panen.sql
|-- docker/
|   `-- opcache.ini
|-- pages/
|   |-- admin/
|   |-- petani/
|   `-- forbidden.php
|-- docker-compose.yml
|-- docker-compose.fast.yml
|-- docker-compose.prod.yml
|-- Dockerfile
|-- index.html
`-- README.md
```

## Penjelasan Folder dan File Penting

### `index.html`

Landing page publik AgroTrack. File ini menjadi halaman awal sebelum user masuk ke sistem. Di dalamnya terdapat navigasi menuju login, register petani, dan pilihan role masuk sebagai admin atau petani.

### `auth/`

Folder untuk proses autentikasi.

- `login.php`: halaman login dan proses autentikasi user.
- `register.php`: halaman register khusus petani.
- `logout.php`: menghapus session login.
- `forgot-password.html`: halaman informasi reset password manual.

### `pages/petani/`

Folder halaman utama untuk role petani. Semua halaman di folder ini hanya bisa diakses oleh user dengan role `petani`.

Modul di dalamnya mencakup dashboard, lahan, peta lahan, musim tanam, katalog operasional, biaya produksi, hasil panen, analisis, dan profil.

### `pages/admin/`

Folder halaman utama untuk role admin. Semua halaman di folder ini hanya bisa diakses oleh user dengan role `admin`.

Modul di dalamnya mencakup dashboard admin, data pengguna, data tanaman, katalog operasional, monitoring lahan, laporan, dan profil admin.

### `app/core/`

Folder helper utama aplikasi.

- Bootstrap aplikasi.
- Session helper.
- Auth guard.
- CSRF helper.
- Layout helper.
- Query ringkasan dashboard.
- Helper format angka, tanggal, dan upload.

### `app/controllers/`

Folder controller untuk memproses request yang membutuhkan logika terpisah dari halaman, terutama API peta lahan.

### `app/models/`

Folder model untuk akses data yang lebih terstruktur, terutama data lahan dan polygon peta.

### `api/`

Folder endpoint ringan yang dipanggil dari frontend atau dipakai untuk pengecekan server.

- `lahan-map.php`: endpoint data peta lahan.
- `ping.php`: endpoint ping aplikasi/database.
- `warmup.php`: endpoint untuk pemanasan koneksi backend dan database.

### `config/database.php`

File konfigurasi koneksi database. Koneksi menggunakan PDO dan membaca environment variable seperti `DB_HOST`, `DB_DATABASE`, `DB_USERNAME`, dan `DB_PASSWORD`.

### `database/init/`

Folder schema dan seed database yang dijalankan otomatis oleh container MySQL saat database pertama kali dibuat. File dipecah berdasarkan tabel dan jenis data agar lebih mudah dibaca.

### `assets/`

Folder aset frontend.

- `assets/Bootstrap/`: Bootstrap lokal.
- `assets/css/`: stylesheet utama.
- `assets/js/`: JavaScript aplikasi.
- `assets/image/`: gambar statis aplikasi.
- `assets/uploads/`: file upload user seperti foto profil.

### `docker/`

Folder konfigurasi tambahan untuk Docker runtime, termasuk konfigurasi OPcache PHP.

### File Docker Compose

- `docker-compose.yml`: konfigurasi development umum.
- `docker-compose.fast.yml`: konfigurasi mode cepat untuk mengurangi efek lambat bind mount Windows.
- `docker-compose.prod.yml`: konfigurasi production/VPS.

## Database

Database AgroTrack menggunakan MySQL 8.0. File aktif berada di folder `database/init/` dan dijalankan secara alfabetis oleh MySQL Docker entrypoint saat volume database masih kosong.

### Kelompok File SQL

- `001_schema_*` sampai `014_schema_views.sql`: struktur tabel, foreign key, index, dan view.
- `101_seed_*` sampai `104_seed_*`: seed data dasar, akun demo, tanaman, katalog, dan gambar katalog.
- `201_seed_*` sampai `204_seed_*`: seed data dummy akun Farhan untuk demo petani.

### Tabel Utama

- `users`: data akun admin dan petani.
- `tanaman`: master tanaman.
- `lahan`: data lahan petani.
- `musim_tanam`: data musim tanam per lahan.
- `biaya_produksi`: catatan biaya produksi.
- `katalog_items`: katalog kebutuhan operasional.
- `biaya_operasional`: catatan biaya dari operasional/katalog.
- `modal_sumber`: sumber modal musim tanam.
- `risk_register`: catatan risiko dan mitigasi.
- `hasil_panen`: data panen dan pendapatan.
- `monitoring_lahan`: data monitoring lahan.
- `aktivitas`: log aktivitas/ringkasan aktivitas.
- `notifikasi`: notifikasi sistem.

### View Database

Schema juga menyediakan view ringkasan untuk mempercepat pembacaan data dashboard dan analisis.

### Catatan Init Database

Docker MySQL membaca folder ini:

```yaml
./database/init:/docker-entrypoint-initdb.d:ro
```

File di `docker-entrypoint-initdb.d` hanya dijalankan saat volume MySQL masih kosong. Jika database sudah pernah dibuat, perubahan pada file SQL init tidak otomatis masuk ke database lama. Untuk development, reset dapat dilakukan dengan `docker compose down -v`.

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

Reset database development:

```bash
docker compose down -v
docker compose up --build
```

Mode cepat:

```bash
docker compose -f docker-compose.fast.yml up --build
```

Mode cepat berguna untuk mengecek apakah loading lambat berasal dari bind mount Docker Desktop di Windows. Mode ini menjalankan source dari image hasil build, bukan langsung dari mount folder Windows.

## Deployment VPS

Perintah deploy production:

```bash
cd /home/ubuntu/PWEB_fp_farhan_agrotrack
git pull origin main
sudo docker compose -f docker-compose.prod.yml up -d --build
sudo docker compose -f docker-compose.prod.yml ps
```

Pastikan file `.env.production` tersedia di VPS. File tersebut dipakai oleh `docker-compose.prod.yml` untuk konfigurasi database dan port.

Jika perubahan hanya pada kode PHP, HTML, CSS, atau JS, cukup rebuild container app. Jika perubahan pada SQL init ingin diterapkan ke database lama, perlu migration manual atau reset volume database.

## Akun Demo

Contoh akun admin dan petani tersedia dari seed database.

```text
Admin
Email    : admin@agrotrack.com
Password : admin234

Petani
Email    : petani@agrotrack.test
Password : password
```

Register publik hanya membuat akun dengan role `petani`. Akun admin dibuat melalui seed atau pengelolaan database.

## Alur Penggunaan

### Alur Petani

1. Buka landing page.
2. Pilih masuk sebagai petani.
3. Login atau daftar akun petani.
4. Tambahkan data lahan.
5. Gambar marker/polygon lahan di peta.
6. Buat musim tanam.
7. Catat biaya produksi dan biaya operasional.
8. Catat hasil panen.
9. Lihat analisis profit.
10. Export laporan ke PDF jika diperlukan.

### Alur Admin

1. Buka landing page.
2. Pilih masuk sebagai admin.
3. Login menggunakan akun admin.
4. Pantau dashboard sistem.
5. Kelola pengguna.
6. Kelola master tanaman.
7. Kelola katalog operasional.
8. Pantau lahan petani.
9. Generate laporan global.

## Keamanan dan Validasi

- Password disimpan dalam bentuk hash.
- Query memakai PDO prepared statement.
- Form penting memakai CSRF token.
- Session diregenerasi saat login berhasil.
- Halaman admin dan petani dipisahkan dengan role guard.
- Data petani dibatasi berdasarkan `user_id`.
- Upload foto profil dibatasi format file tertentu.
- Koneksi database memiliki timeout agar error database tidak menggantung terlalu lama.

## Catatan Performa

Beberapa optimasi yang sudah diterapkan:

- Bootstrap disimpan lokal di `assets/Bootstrap`.
- Font memakai stack lokal/system agar tidak menunggu Google Fonts.
- JavaScript umum dirapikan agar tidak membawa kode prototype yang tidak dipakai.
- Endpoint `warmup.php` digunakan untuk memanaskan koneksi saat user berada di landing page.
- Query dashboard dan analisis dibantu index database.
- OPcache disiapkan untuk runtime production.
- Docker compose fast tersedia untuk menghindari bottleneck bind mount Windows saat development.

Catatan penting:

- Library peta, grafik, dan PDF tetap dapat memuat aset eksternal sesuai kebutuhan halaman.
- Landing page masih boleh memakai gambar eksternal Unsplash.
- File SQL init hanya berjalan otomatis untuk database baru.

## Lisensi dan Atribusi

Project ini dibuat untuk kebutuhan tugas Pemrograman Web. Bootstrap dan library pihak ketiga digunakan untuk mendukung tampilan, peta, grafik, dan export PDF.
