# AgroTrack UI/UX PRD

Brief UI/UX singkat untuk membuat tampilan AgroTrack yang rapi, modern, responsif, dan siap dikembangkan menjadi aplikasi web Native PHP.

## 1. Konteks Produk

AgroTrack adalah aplikasi web agritech untuk petani dan admin. Petani memakai aplikasi untuk mengelola lahan, menggambar batas lahan di peta, mencatat musim tanam, biaya produksi, hasil panen, dan melihat analisis keuntungan. Admin memakai aplikasi untuk memantau pengguna, tanaman, lahan, dan laporan global.

Desain harus terasa seperti dashboard kerja yang bersih, praktis, dan mudah dipakai, bukan landing page marketing yang terlalu dekoratif.

## 2. Tujuan UI/UX

1. Membuat alur petani mudah dipahami dari dashboard sampai peta lahan.
2. Menonjolkan fitur utama: pilih lahan, gambar area di peta, dan hitung luas otomatis.
3. Membuat data pertanian mudah dibaca melalui card, tabel, grafik, dan status badge.
4. Memisahkan pengalaman Guest, Petani, dan Admin dengan navigasi yang jelas.
5. Menjaga tampilan responsif untuk laptop dan mobile.

## 3. Target Pengguna

### Guest

Pengguna yang belum login. Butuh landing page yang menjelaskan manfaat AgroTrack dan mengarahkan ke login/register.

### Petani

Pengguna utama. Butuh UI sederhana untuk input data, melihat ringkasan, menggambar lahan di peta, dan membaca hasil analisis tanpa kebingungan teknis.

### Admin

Pengelola sistem. Butuh dashboard padat, tabel yang mudah discan, filter, dan monitoring lahan berbasis peta.

## 4. Gaya Visual

### Karakter

1. Modern.
2. Clean.
3. Agritech.
4. Terstruktur.
5. Hangat tetapi tetap profesional.

### Warna

1. Primary: hijau tua atau teal gelap untuk brand, sidebar, tombol utama, dan status aktif.
2. Accent: kuning atau amber secukupnya untuk highlight CTA dan data penting.
3. Neutral: putih, slate, gray muda untuk background dan permukaan dashboard.
4. Danger: merah untuk hapus, error, dan aksi berisiko.
5. Success: hijau/teal untuk berhasil dan status aktif.

Hindari tampilan terlalu ramai, terlalu gelap, atau satu warna hijau penuh tanpa kontras.

### Tipografi

1. Gunakan font sans-serif modern.
2. Judul halaman tegas, ringkas, dan mudah discan.
3. Body text nyaman dibaca.
4. Label form harus jelas.
5. Angka statistik dibuat lebih menonjol daripada teks deskripsi.

## 5. Layout Utama

### Guest Layout

1. Navbar atas dengan logo AgroTrack, menu ringkas, Login, dan Register.
2. Hero landing page memakai visual pertanian atau sawah sebagai konteks.
3. Section fitur utama: peta lahan, musim tanam, biaya, hasil panen, analisis.
4. CTA jelas menuju register.
5. Footer sederhana.

### Petani Layout

1. Sidebar kiri permanen pada desktop.
2. Topbar berisi area role, judul halaman, dan ringkasan user.
3. Konten utama menggunakan spacing lega.
4. Card statistik hanya untuk ringkasan penting.
5. Tabel data menggunakan baris bersih, aksi jelas, dan empty state.

Menu Petani:

1. Dashboard.
2. Lahan.
3. Peta Lahan.
4. Musim Tanam.
5. Biaya Produksi.
6. Hasil Panen.
7. Analisis.
8. Laporan.
9. Profil.
10. Logout.

### Admin Layout

1. Sidebar admin dengan navigasi lebih ringkas.
2. Dashboard berisi statistik global.
3. Tabel dan filter menjadi elemen utama.
4. Monitoring lahan menampilkan kombinasi tabel dan peta.

Menu Admin:

1. Dashboard.
2. Data Pengguna.
3. Data Tanaman.
4. Monitoring Lahan.
5. Laporan.
6. Profil Admin.
7. Logout.

## 6. Komponen UI

### Button

1. Primary: aksi utama seperti Simpan, Tambah Lahan, Login, Register.
2. Secondary: aksi pendukung seperti Batal, Reset, Filter.
3. Danger: hapus atau nonaktifkan.
4. Disabled: tombol tidak aktif saat loading atau data belum valid.

### Form

1. Label berada dekat dengan input.
2. Placeholder memberi contoh isi.
3. Field wajib harus terlihat jelas.
4. Error tampil dekat input atau di alert area.
5. Form panjang dibagi menjadi grid dua kolom pada desktop dan satu kolom pada mobile.

### Table

1. Header tegas.
2. Row mudah discan.
3. Status memakai badge.
4. Aksi row memakai tombol kecil: Detail, Edit, Nonaktifkan/Hapus.
5. Empty state harus informatif.

### Card Statistik

1. Berisi label, angka utama, dan subtext pendek.
2. Ikon boleh digunakan untuk mempercepat scan.
3. Jangan terlalu dekoratif.

### Modal

1. Dipakai untuk create/edit data dan konfirmasi.
2. Judul jelas.
3. Tombol utama di kanan bawah.
4. Modal konfirmasi danger harus menampilkan konsekuensi aksi.

### Toast/Alert

1. Success: data berhasil disimpan/diperbarui.
2. Error: validasi gagal atau server error.
3. Warning: data belum lengkap.
4. Pesan harus singkat dan mudah dipahami.

## 7. Halaman Utama

### 7.1 Landing Page

Tujuan: memperkenalkan AgroTrack dan mengarahkan user ke register/login.

Isi utama:

1. Hero dengan nama AgroTrack dan manfaat utama.
2. CTA Register dan Login.
3. Fitur: peta lahan, musim tanam, biaya produksi, hasil panen, analisis profit.
4. Preview dashboard atau peta.
5. Footer.

### 7.2 Login

Tujuan: masuk ke dashboard sesuai role.

Elemen:

1. Logo AgroTrack.
2. Field email.
3. Field password.
4. Remember me.
5. Tombol Login.
6. Link Register dan Lupa Sandi.
7. Area error login.

### 7.3 Register

Tujuan: membuat akun petani.

Field:

1. Nama lengkap.
2. Email.
3. Nomor HP.
4. Password.
5. Konfirmasi password.

### 7.4 Dashboard Petani

Tujuan: memberi ringkasan kondisi pertanian user.

Elemen:

1. Total lahan.
2. Musim aktif.
3. Total biaya.
4. Total pendapatan.
5. Total profit.
6. Estimasi panen terdekat.
7. Aktivitas terbaru.
8. Grafik biaya/profit ringkas.

### 7.5 Lahan

Tujuan: mengelola data dasar lahan.

Elemen:

1. Tombol Tambah Lahan.
2. Tabel lahan.
3. Kolom nama, lokasi, luas, koordinat, status, aksi.
4. Modal tambah/edit lahan.
5. Modal konfirmasi nonaktif.

### 7.6 Peta Lahan

Tujuan: memilih lahan, menentukan marker, menggambar batas area, dan menghitung luas otomatis.

Layout desktop:

1. Area peta besar di kiri.
2. Panel kanan berisi pilih lahan aktif, detail lahan, metrik luas, dan pesan bantuan.
3. Toolbar peta di atas area peta: Gambar Bebas, Reset Gambar, Simpan Peta.

Layout mobile:

1. Dropdown pilih lahan di atas.
2. Peta tampil penuh lebar.
3. Panel detail berada di bawah peta.
4. Tombol aksi tetap mudah dijangkau.

Alur interaksi:

1. User memilih lahan aktif dari dropdown.
2. Sistem menampilkan marker/polygon lama jika ada.
3. User klik peta untuk menentukan marker lokasi utama.
4. User menggambar polygon dengan klik titik-titik batas lahan.
5. Alternatif: user menekan Gambar Bebas, lalu tahan dan geser mouse mengikuti batas lahan.
6. Setelah polygon valid, sistem menampilkan jumlah titik, keliling, luas m2, dan luas hektare.
7. User dapat mengedit titik polygon, reset gambar, atau menggambar ulang.
8. User klik Simpan Peta.
9. Sistem menampilkan toast berhasil dan memperbarui luas lahan.

State wajib:

1. Belum ada lahan: tampilkan empty state dan arahkan user menambah lahan.
2. Lahan belum dipilih: tombol simpan disabled atau muncul alert.
3. Marker belum dibuat: alert "Klik peta untuk menentukan titik lahan."
4. Polygon kurang dari 3 titik: tampilkan luas sebagai "-".
5. Polygon valid: tampilkan luas otomatis.
6. Loading simpan: tombol berubah menjadi "Menyimpan...".
7. Error peta: tampilkan alert jika tile peta gagal/lambat dimuat.

Data yang tampil di panel detail:

1. Nama lahan.
2. Lokasi.
3. Luas tersimpan.
4. Koordinat marker.
5. Jumlah titik polygon.
6. Keliling.
7. Luas m2.
8. Luas hektare.

### 7.7 Musim Tanam

Tujuan: mengelola periode tanam pada lahan.

Elemen:

1. Tabel musim tanam.
2. Filter lahan/status.
3. Form tambah/edit.
4. Field lahan, tanaman, tanggal tanam, estimasi panen, status, catatan.
5. Progress bar pertumbuhan.

### 7.8 Biaya Produksi

Tujuan: mencatat pengeluaran per musim tanam.

Elemen:

1. Tabel biaya.
2. Filter musim tanam dan kategori.
3. Card total biaya.
4. Form tambah/edit biaya.

### 7.9 Hasil Panen

Tujuan: mencatat hasil panen dan menghitung pendapatan/profit.

Elemen:

1. Tabel hasil panen.
2. Form input panen.
3. Kalkulasi total pendapatan.
4. Kalkulasi profit.
5. Badge untung/impas/rugi.

### 7.10 Analisis

Tujuan: menampilkan visualisasi biaya, pendapatan, dan keuntungan.

Elemen:

1. Card total biaya.
2. Card total pendapatan.
3. Card total profit.
4. Grafik biaya berdasarkan kategori.
5. Grafik pendapatan vs biaya.
6. Grafik profit per musim.

### 7.11 Dashboard Admin

Tujuan: melihat kondisi global sistem.

Elemen:

1. Total pengguna.
2. Total lahan.
3. Total musim aktif.
4. Total hasil panen.
5. Grafik ringkasan.
6. Aktivitas terbaru.

### 7.12 Monitoring Lahan Admin

Tujuan: memantau lahan seluruh petani.

Elemen:

1. Filter petani, tanaman, status.
2. Tabel lahan.
3. Peta monitoring marker/polygon.
4. Panel detail lahan.
5. Badge status lahan dan musim tanam.

## 8. Responsive Behavior

### Desktop

1. Sidebar selalu terlihat.
2. Konten utama menggunakan grid.
3. Peta lahan memakai layout dua kolom.
4. Tabel tampil lengkap.

### Tablet

1. Sidebar dapat dipersempit.
2. Card statistik menjadi dua kolom.
3. Panel detail peta dapat turun ke bawah.

### Mobile

1. Sidebar berubah menjadi menu.
2. Card statistik satu kolom.
3. Tabel dapat horizontal scroll.
4. Form satu kolom.
5. Peta tetap punya tinggi minimum yang nyaman.

## 9. Microcopy

Gunakan bahasa Indonesia yang sederhana.

Contoh:

1. Empty lahan: "Belum ada data lahan. Tambahkan lahan pertama untuk mulai menggunakan AgroTrack."
2. Peta belum dipilih: "Pilih lahan aktif untuk mulai mengatur lokasi pada peta."
3. Marker belum dibuat: "Klik peta untuk menentukan titik lahan."
4. Polygon valid: "Area lahan berhasil digambar. Periksa luas otomatis sebelum menyimpan."
5. Simpan berhasil: "Data peta lahan berhasil disimpan."
6. Error polygon: "Gambar minimal 3 titik untuk membentuk area lahan."

## 10. Accessibility

1. Kontras teks harus jelas.
2. Tombol memiliki label yang mudah dipahami.
3. Form input memiliki label.
4. Error tidak hanya mengandalkan warna.
5. Fokus keyboard harus terlihat.
6. Peta harus memiliki instruksi teks di luar canvas/peta.

## 11. Output yang Diharapkan dari Desain

1. Landing page.
2. Login.
3. Register.
4. Dashboard Petani.
5. Lahan.
6. Peta Lahan dengan panel detail dan toolbar gambar.
7. Musim Tanam.
8. Biaya Produksi.
9. Hasil Panen.
10. Analisis.
11. Dashboard Admin.
12. Monitoring Lahan Admin.
13. Komponen reusable: button, input, select, table, card, badge, modal, alert, toast, sidebar.

## 12. Prioritas Desain

1. Peta Lahan harus menjadi halaman paling jelas dan paling kuat secara UX.
2. Dashboard harus mudah discan dalam 5 detik.
3. Form harus cepat diisi dan minim kebingungan.
4. Tabel harus rapi, tidak padat berlebihan, dan aksi row harus mudah ditemukan.
5. UI harus konsisten antara Petani dan Admin, tetapi role tetap terasa berbeda dari menu dan konteks data.
