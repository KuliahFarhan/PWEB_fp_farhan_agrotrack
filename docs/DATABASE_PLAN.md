# Database Plan

Database AgroTrack menggunakan MySQL dengan 6 tabel utama sesuai PRD:

1. `users`
2. `tanaman`
3. `lahan`
4. `musim_tanam`
5. `biaya_produksi`
6. `hasil_panen`

## Relasi

- Satu user dengan role `petani` dapat memiliki banyak `lahan`.
- Satu `lahan` dapat memiliki banyak `musim_tanam`.
- Satu `tanaman` dapat digunakan oleh banyak `musim_tanam`.
- Satu `musim_tanam` dapat memiliki banyak `biaya_produksi`.
- Satu `musim_tanam` maksimal memiliki satu `hasil_panen`.

## Business Rules

- `estimasi_panen` dihitung dari `tanggal_tanam + masa_panen tanaman`.
- `total_pendapatan` dihitung dari `total_hasil * harga_jual`.
- `total_keuntungan` dihitung dari `total_pendapatan - total biaya produksi`.
- `polygon_area` disimpan sebagai string JSON/text agar bisa digunakan oleh Leaflet nanti.

## Seed Data

`database/seed.sql` menyediakan:

- 1 admin demo: `admin@agrotrack.test`
- 1 petani demo: `petani@agrotrack.test`
- 3 tanaman: Padi, Jagung, Cabai
- 2 lahan demo milik petani
- 2 musim tanam demo
- 6 biaya produksi demo
- 1 hasil panen demo

Password seed masih menggunakan placeholder `PLACEHOLDER_HASH_FOR_password`.
Hash asli harus diganti dengan output `password_hash('password', PASSWORD_DEFAULT)` saat fitur auth native PHP dibuat.

## Import via phpMyAdmin

1. Buat database baru, misalnya `agrotrack`.
2. Buka database tersebut di phpMyAdmin.
3. Masuk tab Import.
4. Import `database/schema.sql`.
5. Setelah selesai, import `database/seed.sql`.

## Import via MySQL CLI

```bash
mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS agrotrack CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
mysql -u root -p agrotrack < database/schema.sql
mysql -u root -p agrotrack < database/seed.sql
```
