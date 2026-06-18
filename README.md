# AgroTrack

**Muhammad Farhan**  
**NRP:** 5054241018  
**Kelas:** Pemrograman Web N  
**Link Publik:** https://agrotrack.farhankuliah.my.id/

AgroTrack adalah aplikasi web manajemen pertanian berbasis PHP native dan MySQL. Aplikasi ini membantu petani mencatat lahan, musim tanam, biaya produksi, katalog operasional, hasil panen, dan analisis profit. AgroTrack juga menyediakan portal admin untuk mengelola pengguna, tanaman, katalog, monitoring lahan, dan laporan global.

## Fitur Utama

### Petani

- Login, logout, dan register akun petani.
- Kelola data lahan dengan soft delete.
- Gambar marker dan polygon lahan pada peta.
- Buat musim tanam berdasarkan lahan dan tanaman.
- Catat biaya produksi manual atau dari katalog operasional.
- Catat hasil panen dan pendapatan.
- Lihat analisis biaya, pendapatan, dan profit.
- Export analisis ke PDF melalui print preview browser.
- Update profil dan foto profil.

### Admin

- Dashboard ringkasan sistem.
- Kelola data pengguna dan reset password.
- CRUD master tanaman.
- Kelola katalog kebutuhan operasional.
- Monitoring lahan semua petani.
- Laporan global dan export PDF.
- Update profil admin.

## Teknologi

- PHP 8.2 native
- MySQL 8.0
- PDO prepared statement
- Session authentication dan role guard
- CSRF token untuk form utama
- Bootstrap 5.3.8 lokal di `assets/Bootstrap`
- JavaScript vanilla
- Leaflet, Leaflet Draw, dan Turf.js untuk peta
- Chart.js untuk grafik
- jsPDF dan AutoTable untuk laporan PDF
- Docker, Docker Compose, Apache, dan phpMyAdmin

## Struktur Repo

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

## Folder Penting

- `index.html`: landing page publik.
- `auth/`: login, register, logout, dan informasi reset sandi.
- `pages/petani/`: portal petani yang terhubung database.
- `pages/admin/`: portal admin yang terhubung database.
- `api/`: endpoint peta lahan, ping database, dan warmup server.
- `app/core/`: helper session, auth guard, layout, query ringkasan, CSRF, upload, dan format angka.
- `config/database.php`: koneksi PDO MySQL berbasis environment variable.
- `database/init/`: schema dan seed MySQL yang dijalankan Docker secara alfabetis saat volume database masih kosong.
- `assets/js/app.js`: JavaScript umum produksi.

## Database

Schema dan seed aktif berada di `database/init/`. File dipisah berdasarkan tabel dan jenis data agar lebih mudah dibaca.

Urutan utama:

- `001_schema_*` sampai `014_schema_views.sql`: struktur tabel, relasi, index, dan view.
- `101_seed_*` sampai `104_seed_*`: data dasar, akun demo, tanaman, katalog, dan gambar katalog.
- `201_seed_*` sampai `204_seed_*`: data dummy akun Farhan untuk demo petani.

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

Docker MySQL membaca folder ini lewat mount:

```yaml
./database/init:/docker-entrypoint-initdb.d:ro
```

## Menjalankan dengan Docker

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

## Deploy VPS

```bash
cd /home/ubuntu/PWEB_fp_farhan_agrotrack
git pull origin main
sudo docker compose -f docker-compose.prod.yml up -d --build
sudo docker compose -f docker-compose.prod.yml ps
```

Jika ingin menerapkan perubahan file SQL init ke database yang sudah pernah dibuat, volume MySQL harus di-reset atau perubahan SQL diterapkan manual melalui migrasi/query, karena `docker-entrypoint-initdb.d` hanya berjalan saat database masih kosong.
