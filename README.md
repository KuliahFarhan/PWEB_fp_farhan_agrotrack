# AgroTrack

AgroTrack adalah aplikasi PHP native + MySQL untuk petani dan admin. Versi ini memakai session PHP, PDO prepared statement, `password_hash`/`password_verify`, role guard, CRUD utama, Leaflet map, katalog operasional, dan Docker.

## Jalankan via Docker

```bash
cd PWEB_fp_farhan_agrotrack
docker compose up --build
```

URL:

- App: http://localhost:8090
- phpMyAdmin: http://localhost:8081
- MySQL host dari container app: `mysql`
- Database: `agrotrack`
- User DB: `agrotrack`
- Password DB: `agrotrack_password`

Seed demo otomatis dipasang saat volume MySQL pertama kali dibuat. Jika ingin reset total:

```bash
docker compose down -v
docker compose up --build
```

Jika tidak ingin reset volume lama, import dulu `database/migrations/006_katalog_operasional.sql`, lalu isi data katalog dari database baru/fresh seed. Untuk development paling simpel tetap `docker compose down -v` agar schema dan seed terbaru masuk bersih.

## Jalankan tanpa Docker

1. Pastikan PHP 8.2+, Apache/Nginx, dan MySQL aktif.
2. Import `database/01_schema.sql`.
3. Import `database/seed.sql`.
4. Arahkan document root ke folder `PWEB_fp_farhan_agrotrack`.
5. Set environment DB, atau edit default di `config/database.php`.

Jangan buka file `.php` memakai Live Server atau langsung via `file:///...`, karena PHP akan dianggap file statis dan bisa terdownload. Pakai Apache/PHP server, misalnya Docker di atas.

## Akun Demo

- Admin: `admin@agrotrack.com` / `admin234`
- Petani: `petani@agrotrack.test` / `password`

Register publik selalu membuat akun role `petani`. Admin dibuat dari seed/database.

## Fitur Berjalan

- Auth login/register/logout real dengan session.
- Role guard admin/petani.
- Admin CRUD master tanaman di `pages/admin/tanaman.php`.
- Petani CRUD lahan di `pages/petani/lahan.php`.
- Petani CRUD musim tanam dengan estimasi panen otomatis.
- Petani CRUD biaya produksi.
- Petani katalog operasional 14 kategori dari pra-tanam sampai pascapanen.
- Petani bisa mencatat biaya dari item katalog atau input manual ke `biaya_operasional`.
- Petani input hasil panen dan profit.
- Analisis petani dengan Chart.js.
- Admin edit master katalog kebutuhan dari database.
- Laporan admin global berbasis database dan bisa generate PDF.
- Profil user dengan email readonly.
- Peta lahan Leaflet + Leaflet Draw + Turf.js.
- Layer OpenStreetMap dan Esri World Imagery satellite.
- API polygon scoped ke `user_id` petani login.

## CDN External

- Bootstrap 5.3.3
- Google Fonts Inter
- Google Material Symbols
- Leaflet.js
- Leaflet Draw
- Turf.js
- Chart.js
- jsPDF dan jsPDF AutoTable

## Catatan Struktur

File `.html` lama masih dibiarkan sebagai arsip UI statis. Jalur aplikasi yang benar memakai `.php` lewat Apache/PHP; file auth berada di folder `auth/`.

Katalog operasional berasal dari dokumen `docs/AGROTRACK_KATALOG_*.md`, disimpan ke tabel `katalog_items`, dan dipakai oleh halaman petani/admin. Harga yang belum stabil atau lokal disimpan sebagai `NULL`/status manual agar tidak memakai angka karangan.

## File Database

- `database/01_schema.sql`: schema utama.
- `database/seed.sql`: seed demo, termasuk katalog operasional.
- `database/migrations/*`: patch incremental dari proses refactor.
- `database/schema.sql`: wrapper import untuk kebutuhan manual tertentu.
