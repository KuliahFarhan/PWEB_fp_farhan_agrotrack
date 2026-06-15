# AgroTrack Refactor

AgroTrack adalah aplikasi PHP native + MySQL untuk petani dan admin. Versi ini sudah memakai session PHP, PDO prepared statement, `password_hash`/`password_verify`, role guard, CRUD utama, Leaflet map, dan Docker.

## Jalankan via Docker

```bash
cd AgroTrack_Refactor
docker compose up --build
```

URL:

- App: http://localhost:8080
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

## Jalankan tanpa Docker

1. Pastikan PHP 8.2+, Apache/Nginx, dan MySQL aktif.
2. Import `database/01_schema.sql`.
3. Import `database/seed.sql`.
4. Arahkan document root ke folder `AgroTrack_Refactor`.
5. Set environment DB, atau edit default di `config/database.php`.

## Akun Demo

- Admin: `admin@agrotrack.test` / `password`
- Petani: `petani@agrotrack.test` / `password`

Register publik selalu membuat akun role `petani`. Admin dibuat dari seed/database.

## Fitur Berjalan

- Auth login/register/logout real dengan session.
- Role guard admin/petani.
- Admin CRUD master tanaman di `pages/admin/tanaman.php`.
- Petani CRUD lahan di `pages/petani/lahan.php`.
- Petani CRUD musim tanam dengan estimasi panen otomatis.
- Petani CRUD biaya produksi.
- Petani input hasil panen dan profit.
- Analisis petani dengan Chart.js.
- Laporan admin global berbasis database.
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

File `.html` lama masih dibiarkan sebagai arsip UI statis. Jalur aplikasi yang benar memakai `.php`; file auth berada di folder `auth/`.

## File Database

- `database/01_schema.sql`: schema utama.
- `database/seed.sql`: seed demo.
- `database/migrations/*`: patch incremental dari proses refactor.
- `database/schema.sql`: wrapper import untuk kebutuhan manual tertentu.
