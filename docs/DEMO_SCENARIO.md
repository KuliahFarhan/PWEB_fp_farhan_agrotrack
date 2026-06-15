# Demo Scenario AgroTrack

## Guest

1. Buka http://localhost:8080.
2. Klik `Daftar` untuk membuat petani baru.
3. Klik `Masuk` dan login memakai akun demo.

## Petani

1. Login: `petani@agrotrack.test` / `password`.
2. Buka `Lahan`, tambah lahan baru, pilih tanaman dari master data.
3. Buka `Peta Lahan`, pilih lahan, gambar polygon, cek luas m2/hektar, lalu simpan.
4. Reload halaman peta dan pastikan polygon muncul kembali.
5. Buka `Musim Tanam`, pilih lahan dan tanaman, simpan tanggal tanam.
6. Buka `Biaya Produksi`, pilih musim, tambah biaya bibit/pupuk/pestisida.
7. Buka `Hasil Panen`, pilih musim, isi total hasil dan harga jual.
8. Buka `Analisis`, cek total biaya, pendapatan, profit, dan grafik.
9. Buka `Profil`, edit data selain email.
10. Klik logout dan pastikan muncul konfirmasi.

## Admin

1. Login: `admin@agrotrack.test` / `password`.
2. Buka `Data Tanaman`, tambah tanaman baru dengan masa panen > 0.
3. Edit tanaman, lalu coba nonaktifkan.
4. Buka `Data Pengguna`, cek daftar user.
5. Buka `Monitoring Lahan`, cek data lahan semua petani.
6. Buka `Laporan`, cek tabel global dan tombol generate PDF.
7. Buka `Profil Admin`, edit data selain email.

## Validasi Role

- Saat belum login, buka `pages/admin/dashboard.php`; harus redirect ke login.
- Login sebagai petani lalu buka halaman admin; harus mendapat akses ditolak.
- Login sebagai admin lalu buka halaman petani; harus mendapat akses ditolak.
