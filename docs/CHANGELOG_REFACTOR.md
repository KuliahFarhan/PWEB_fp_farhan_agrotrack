# Changelog Refactor

## Refactor PHP Native + MySQL

- Menambahkan backend auth real: login, register, logout.
- Menambahkan helper session guard dan CSRF sederhana.
- Mengubah halaman utama aplikasi menjadi PHP guarded pages.
- Menambahkan CRUD admin untuk master tanaman.
- Menambahkan CRUD petani untuk lahan, musim tanam, biaya produksi, hasil panen.
- Menambahkan analisis Chart.js dari data database.
- Menambahkan laporan admin global dari database.
- Menambahkan profil petani/admin dengan email readonly.
- Menambahkan layer satelit Esri pada peta Leaflet.
- Mengamankan API peta agar hanya petani login yang bisa akses lahannya.
- Menambahkan Dockerfile, docker-compose, .env.example.
- Menambahkan seed akun demo dan data pertanian.

## Catatan Teknis

- Query ringkasan memakai subquery agregasi untuk menghindari join multiplication.
- Password demo memakai bcrypt hash untuk kata sandi `password`.
- File HTML lama tetap ada sebagai arsip UI, tetapi rute aplikasi aktif memakai PHP.
