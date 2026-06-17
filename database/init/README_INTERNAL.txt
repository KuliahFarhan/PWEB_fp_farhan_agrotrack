AgroTrack DB fresh VPS audit
============================

Tujuan
------
- Menentukan jalur auto-run database yang aman untuk fresh deploy VPS.
- Menjaga katalog operasional 14 kategori tetap terisi otomatis.
- Memastikan akun admin, petani demo, dan Muhammad Farhan ikut masuk.
- Menghindari duplikasi dari migration legacy.

Urutan final fresh database
---------------------------
1. `database/01_schema.sql`
2. `database/seed.sql`
3. `database/seeds/030_farhan_dummy_clean.sql`

Implementasi aktif saat ini
---------------------------
`docker-compose.yml` hanya me-mount file berikut ke `/docker-entrypoint-initdb.d/`:
- `01_schema.sql`
- `02_seed.sql`
- `30_farhan_dummy_clean.sql`

File auto-run di atas tidak lagi memakai `USE agrotrack;`.

Klasifikasi file
----------------
`database/01_schema.sql`
- Klasifikasi: `CORE_SCHEMA_ALREADY_INCLUDED`
- Auto-run: ya
- Isi: schema final seluruh tabel utama, foreign key, unique key, view, soft delete `lahan.deleted_at`.

`database/seed.sql`
- Klasifikasi: `REQUIRED_CATALOG_SEED`
- Auto-run: ya
- Isi: admin aktif `admin@agrotrack.com`, petani demo, tanaman dasar, data demo dasar, dan katalog final lintas 14 kategori.
- Catatan: file ini sudah memuat hasil akhir katalog yang sebelumnya disusun melalui migration `006-024`.

`database/seeds/030_farhan_dummy_clean.sql`
- Klasifikasi: `REQUIRED_DUMMY_SEED`
- Auto-run: ya
- Isi: akun `muhammadfarhanmonggot@gmail.com`, lahan polygon, musim tanam, modal, risiko, biaya operasional, hasil panen.
- Catatan: dijalankan setelah katalog terisi agar referensi `katalog_items` tersedia.

`database/00_create_database.sql`
- Klasifikasi: `LEGACY_REFERENCE`
- Auto-run: tidak
- Isi: create database `agrotrack` dan `USE agrotrack`.
- Catatan: dipakai hanya untuk impor manual jika dibutuhkan.

`database/02_seed_demo.sql`
- Klasifikasi: `UNSAFE_AUTO_RUN`
- Auto-run: tidak
- Isi: wrapper lama yang memanggil `seed.sql` dan `seeds/030_farhan_dummy_clean.sql`.
- Catatan: tidak dipakai oleh Docker init aktif dan tidak perlu diikutkan agar jalur fresh deploy tetap eksplisit.

`database/schema.sql`
- Klasifikasi: `LEGACY_REFERENCE`
- Auto-run: tidak
- Isi: wrapper lama ke `/docker-entrypoint-initdb.d/01_schema.sql`.

`database/agrotrack_full_database.sql`
- Klasifikasi: `LEGACY_REFERENCE`
- Auto-run: tidak
- Isi: aggregator impor manual `00_create_database.sql`, `01_schema.sql`, `seed.sql`, `seeds/030_farhan_dummy_clean.sql`.

Migration `001-005`
-------------------
- Status umum: patch legacy / optional / unsafe untuk fresh deploy.

`001_lahan_polygon_columns.sql`
- Klasifikasi: `UNSAFE_AUTO_RUN`
- Alasan: membuat ulang tabel awal, patch kolom yang kini sudah ada di schema, dan insert demo lama `admin@agrotrack.test` / `petani@agrotrack.test`.

`002_user_profile_photo.sql`
- Klasifikasi: `OPTIONAL_PATCH`
- Alasan: kolom `profile_photo` dan nilai default sudah tercakup di schema/seed final.

`003_user_profile_fields.sql`
- Klasifikasi: `OPTIONAL_PATCH`
- Alasan: `address`, `division`, `main_crop`, `total_area`, `bio` sudah ada di schema final.

`004_tanaman_master.sql`
- Klasifikasi: `OPTIONAL_PATCH`
- Alasan: master `tanaman` dan relasi `tanaman_id` sudah masuk `01_schema.sql`, dan seed final sudah memuat tanaman awal.

`005_unique_hasil_panen_musim.sql`
- Klasifikasi: `OPTIONAL_PATCH`
- Alasan: unique key `uq_hasil_panen_musim` sudah ada di schema final.

Migration `006-024`
-------------------
- Status umum: sumber historis pembentukan katalog final.
- Keputusan fresh deploy: tidak auto-run satu per satu karena hasil finalnya sudah dibawa ke `database/seed.sql`.
- Alasan: mencegah duplikasi/overlap/patch berulang pada fresh VPS dan menjaga jalur init tetap sederhana.

`006_katalog_operasional.sql`
- Klasifikasi: `CORE_SCHEMA_ALREADY_INCLUDED`
- Isi: create `katalog_items`, `biaya_operasional`, `modal_sumber`, `risk_register`.

`007_katalog_detail_json.sql`
- Klasifikasi: `LEGACY_REFERENCE`
- Isi: enrich `detail_json` item katalog.

`009_katalog_detail_rich.sql`
- Klasifikasi: `LEGACY_REFERENCE`
- Isi: enrich detail untuk item yang sudah ada.

`010_benih_bibit_complete.sql`
`011_pupuk_nutrisi_complete.sql`
`012_pembenah_tanah_complete.sql`
`013_perlindungan_tanaman_complete.sql`
`014_air_irigasi_complete.sql`
`015_persiapan_lahan_complete.sql`
`016_tenaga_kerja_complete.sql`
`017_alat_mesin_complete.sql`
`019_bahan_pendukung_complete.sql`
`020_panen_complete.sql`
`021_pascapanen_complete.sql`
`022_transport_logistik_complete.sql`
`023_modal_administrasi_complete.sql`
`024_risiko_kerugian_complete.sql`
- Klasifikasi: `LEGACY_REFERENCE`
- Alasan: seluruh kategori dan item finalnya sudah tercermin di `database/seed.sql`; beberapa file memakai `INSERT IGNORE`, `UPDATE`, atau `DELETE` yang lebih aman diperlakukan sebagai sumber historis, bukan jalur init fresh.

Migration `025-027`
-------------------
`025_tanaman_from_benih_catalog.sql`
- Klasifikasi: `OPTIONAL_PATCH`
- Alasan: menyalin master tanaman dari katalog benih; hasil finalnya sudah ada di seed/schema aktif.

`026_admin_login_agrotrack_com.sql`
- Klasifikasi: `OPTIONAL_PATCH`
- Alasan: admin `admin@agrotrack.com` sudah di-seed langsung di `database/seed.sql`.

`027_lahan_soft_delete.sql`
- Klasifikasi: `OPTIONAL_PATCH`
- Alasan: kolom `deleted_at` dan index-nya sudah masuk `database/01_schema.sql`.

Seed tambahan
-------------
`database/seeds/farhan_dummy_account.sql`
- Klasifikasi: `LEGACY_REFERENCE`
- Auto-run: tidak
- Alasan: file lama yang hanya cocok sebagai referensi data dummy, sementara seed aktif untuk deploy adalah `030_farhan_dummy_clean.sql`.

Validasi audit
--------------
- Path asset yang direferensikan `database/seed.sql` tervalidasi ada di repo.
- Fresh DB tidak perlu menjalankan migration `001-027` satu per satu.
- Jangan gunakan `docker compose down -v` di production.

Catatan deploy VPS
------------------
- Urutan init database fresh:
  1. `database/01_schema.sql`
  2. `database/seed.sql`
  3. `database/seeds/030_farhan_dummy_clean.sql`
- File migration legacy tidak auto-run.
- `database/init/validate_after_deploy.sql` dipakai untuk verifikasi setelah deploy.
- `phpMyAdmin` hanya boleh diakses via localhost atau SSH tunnel.
- Login produksi memakai `/auth/login.php`.

Akun demo aktif
---------------
- `admin@agrotrack.com / admin234`
- `petani@agrotrack.test / password`
- `muhammadfarhanmonggot@gmail.com / password`

Cara test local fresh DB
------------------------
1. `docker compose down -v`
2. `docker compose up -d --build`
3. Cek:
   - `SELECT COUNT(*) FROM katalog_items;`
   - `SELECT kategori, COUNT(*) FROM katalog_items GROUP BY kategori ORDER BY kategori;`
   - akun `admin@agrotrack.com`
   - akun `petani@agrotrack.test`
   - akun `muhammadfarhanmonggot@gmail.com`

Cara update deploy VPS tanpa reset data
---------------------------------------
1. `docker compose down`
2. `docker compose up -d --build`
3. Jangan gunakan `down -v` kecuali memang ingin reset database total.

Permission upload di VPS
------------------------
- Pastikan folder upload tersedia:
  - `mkdir -p assets/uploads/profile`
  - `chmod -R 775 assets/uploads`
- Jika Docker memakai bind mount repo, pastikan user Apache di container bisa menulis ke `assets/uploads`.
