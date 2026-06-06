# [PRODUCT REQUIREMENTS

DOCUMENT]()

# [AGROTRACK]()

## [Sistem

Monitoring Pertanian Berbasis Peta dan Manajemen Musim Tanam]()

## [1. Ringkasan Produk]()

### [1.1 Nama Produk]()

AgroTrack

### [1.2 Deskripsi Singkat]()

AgroTrack adalah aplikasi web untuk membantu petani mengelola lahan
pertanian secara digital melalui peta interaktif, pencatatan musim tanam,
pencatatan biaya produksi, input hasil panen, serta analisis keuntungan.
Aplikasi ini juga menyediakan dashboard admin untuk memantau data pengguna,
data tanaman, lahan, musim tanam, dan laporan pertanian secara umum.

### [1.3 Latar Belakang]()

Banyak aktivitas pertanian masih dicatat secara manual, seperti
lokasi lahan, jadwal tanam, biaya produksi, dan hasil panen. Pencatatan manual
berisiko tidak rapi, sulit dianalisis, dan menyulitkan petani dalam
mengevaluasi apakah suatu musim tanam menghasilkan keuntungan atau kerugian.

AgroTrack dibuat sebagai solusi digital berbasis web untuk membantu
petani mencatat dan memonitor aktivitas pertanian dengan lebih terstruktur.
Aplikasi ini juga memanfaatkan peta digital agar petani dapat menentukan lokasi
dan area lahan secara visual.

### [1.4 Tujuan Produk]()

Tujuan utama AgroTrack adalah: 1. Membantu petani mengelola data
lahan secara digital. 2. Membantu petani menentukan lokasi lahan melalui peta
interaktif. 3. Membantu petani mencatat musim tanam dan estimasi panen. 4.
Membantu petani mencatat biaya produksi. 5. Membantu petani mencatat hasil
panen dan menghitung keuntungan. 6. Membantu petani melihat analisis biaya,
pendapatan, dan profit. 7. Membantu admin memantau data pengguna, tanaman,
lahan, dan laporan sistem. 8. Mengurangi ketergantungan pada pencatatan manual.

---

## [2. Ruang Lingkup Produk]()

### [2.1 Scope Utama]()

Fitur utama yang masuk ke implementasi FP:

Landing page.

Register petani.

Login dan logout.

Role access untuk Admin dan
Petani.

Dashboard Petani.

Dashboard Admin.

CRUD master data tanaman oleh
Admin.

CRUD data lahan oleh Petani.

Peta interaktif lahan
menggunakan Leaflet.

10. Penyimpanan marker/polygon area lahan.
11. CRUD musim tanam.
12. Perhitungan estimasi panen.
13. Progress pertumbuhan tanaman.
14. CRUD biaya produksi.
15. CRUD hasil panen.
16. Perhitungan pendapatan dan profit.
17. Analisis grafik sederhana.
18. Laporan tabel.
19. Profil pengguna.
20. Popup, toast, dan validasi form.

### [2.2 Fitur Tambahan Jika

Waktu Cukup]()

Fitur berikut bersifat tambahan: 1. Export PDF. 2. Export Excel. 3.
Upload foto profil. 4. Reset password sederhana. 5. Informasi cuaca dari API.
6. Print laporan. 7. Filter laporan lanjutan.

### [2.3 Di Luar Scope MVP]()

Fitur berikut tidak menjadi target utama karena berpotensi
memperlebar pengerjaan: 1. Marketplace produk pertanian penuh. 2. Checkout. 3.
Payment gateway. 4. Dropshipper. 5. Forum komunitas penuh. 6. Chat konsultasi
real-time. 7. Notifikasi WhatsApp. 8. AI rekomendasi tanaman. 9. IoT sensor.
10. Dark mode.

Catatan: fitur di luar scope dapat tetap dicantumkan sebagai future
development dalam laporan akhir.

---

## [3. Target Pengguna]()

### [3.1 Guest]()

Guest adalah pengguna yang belum login.

Guest dapat: 1. Melihat landing page. 2. Melihat informasi fitur
AgroTrack. 3. Membuka halaman login. 4. Membuka halaman register. 5. Melakukan
registrasi akun petani.

Guest tidak dapat: 1. Mengakses dashboard petani. 2. Mengakses
dashboard admin. 3. Mengelola data lahan. 4. Mengakses laporan internal.

### [3.2 Petani/User]()

Petani adalah pengguna utama aplikasi yang mengelola data pertanian
miliknya sendiri.

Petani dapat: 1. Login ke sistem. 2. Mengelola profil. 3. Menambah,
melihat, mengedit, dan menghapus lahan. 4. Menentukan lokasi lahan pada peta.
5. Menggambar polygon area lahan. 6. Menambahkan musim tanam. 7. Melihat
estimasi panen. 8. Melihat progress pertumbuhan tanaman. 9. Mencatat biaya
produksi. 10. Mencatat hasil panen. 11. Melihat analisis biaya, pendapatan, dan
profit. 12. Melihat laporan pertanian miliknya sendiri.

Petani tidak dapat: 1. Mengakses dashboard admin. 2. Mengelola data
petani lain. 3. Mengubah master data tanaman. 4. Melihat laporan global seluruh
pengguna.

### [3.3 Admin]()

Admin adalah pengguna yang mengelola data utama dan memantau
aktivitas sistem.

Admin dapat: 1. Login ke dashboard admin. 2. Melihat statistik
sistem. 3. Melihat daftar pengguna. 4. Melihat detail pengguna. 5. Mengelola
master data tanaman. 6. Memantau seluruh data lahan. 7. Melihat monitoring
lahan melalui tabel dan peta. 8. Melihat laporan global.

Admin tidak perlu: 1. Mengedit seluruh transaksi petani. 2.
Menggambar polygon lahan milik petani. 3. Mencatat biaya produksi milik petani.
4. Menginput hasil panen milik petani.

Pembatasan ini dibuat agar alur sistem tetap jelas dan tidak rawan
konflik data.

---

## [4. Value Proposition]()

### [4.1 Untuk Petani]()

AgroTrack membantu petani memahami kondisi pertanian mereka secara
lebih terukur. Petani dapat mengetahui lokasi lahan, jadwal tanam, estimasi
panen, total biaya, total pendapatan, dan keuntungan dalam satu sistem.

### [4.2 Untuk Admin]()

AgroTrack membantu admin memantau data pengguna, data lahan, musim
tanam aktif, komoditas yang ditanam, dan ringkasan hasil panen secara terpusat.

### [4.3 Nilai Pembeda]()

Nilai pembeda AgroTrack dibanding CRUD biasa adalah: 1. Ada peta
interaktif. 2. Ada polygon area lahan. 3. Ada estimasi panen berbasis masa
panen tanaman. 4. Ada progress pertumbuhan tanaman. 5. Ada analisis profit
berbasis biaya dan hasil panen. 6. Ada dashboard untuk dua role berbeda.

---

## [5.

User Journey]()

### [5.1 Journey Guest ke Petani]()

Guest membuka landing page.

Guest membaca informasi fitur
AgroTrack.

Guest klik tombol Register.

Guest mengisi nama, email,
nomor HP, password, dan konfirmasi password.

Sistem memvalidasi data.

Sistem membuat akun petani.

Petani login.

Petani masuk ke dashboard.

### [5.2 Journey Petani

Mengelola Lahan]()

Petani login.

Petani masuk ke dashboard.

Petani membuka menu Lahan.

Petani menambah data lahan.

Petani membuka halaman Peta
Lahan.

Petani memilih titik lokasi
lahan.

Petani menggambar polygon batas
lahan.

Sistem menyimpan koordinat
lahan.

Data lahan tampil dalam daftar
lahan dan peta.

### [5.3 Journey Petani

Mengelola Musim Tanam]()

Petani membuka menu Musim
Tanam.

Petani klik Tambah Musim Tanam.

Petani memilih lahan.

Petani memilih tanaman.

Petani mengisi tanggal tanam.

Sistem menghitung estimasi
panen berdasarkan masa panen tanaman.

Sistem menampilkan progress
pertumbuhan.

Petani dapat mengubah status
musim tanam.

### [5.4 Journey

Petani Mengelola Biaya dan Panen]()

Petani membuka menu Biaya
Produksi.

Petani menambahkan biaya
berdasarkan musim tanam.

Sistem menghitung total biaya
produksi.

Petani membuka menu Hasil
Panen.

Petani mengisi total hasil
panen dan harga jual.

Sistem menghitung total
pendapatan.

Sistem menghitung profit.

Petani melihat grafik analisis.

### [5.5 Journey Admin]()

Admin login.

Admin masuk ke dashboard admin.

Admin melihat statistik total
pengguna, lahan, musim aktif, dan hasil panen.

Admin mengelola master data
tanaman.

Admin memantau lahan melalui
tabel dan peta.

Admin melihat laporan global.

---

## [6. Struktur Halaman]()

## [6.1

Landing Page]()

### [Akses]()

Guest, Petani, Admin.

### [Tujuan]()

Menjelaskan fungsi AgroTrack dan mengarahkan pengguna ke
login/register.

### [Komponen]()

Navbar.

Hero section.

CTA button.

Section fitur utama.

Section tentang AgroTrack.

Section manfaat.

Statistik singkat.

FAQ.

Footer.

### [Aksi User]()

Klik Login.

Klik Register.

Scroll melihat informasi fitur.

Membaca manfaat aplikasi.

### [Konten Utama]()

Fitur yang ditampilkan: 1. Monitoring lahan. 2. Peta sawah. 3.
Manajemen musim tanam. 4. Biaya produksi. 5. Hasil panen. 6. Analisis
keuntungan.

### [Acceptance Criteria]()

Landing page dapat dibuka tanpa
login.

Tombol login mengarah ke
halaman login.

Tombol register mengarah ke
halaman register.

Desain responsif.

Tidak ada teks sisa dari desain
lama yang tidak relevan.

---

## [6.2

Login]()

### [Akses]()

Guest.

### [Tujuan]()

Memberikan akses masuk kepada Admin dan Petani.

### [Field]()

Email.

Password.

Remember me.

### [Aksi User]()

Mengisi email.

Mengisi password.

Login.

Pindah ke register.

Pindah ke lupa sandi.

### [Validasi]()

Email wajib diisi.

Password wajib diisi.

Email harus terdaftar.

Password harus benar.

### [Redirect]()

Role admin diarahkan ke
dashboard admin.

Role petani diarahkan ke
dashboard petani.

### [Popup/Alert]()

Login gagal.

Email tidak ditemukan.

Password salah.

Session expired.

### [Acceptance Criteria]()

User valid dapat login.

Admin masuk ke dashboard admin.

Petani masuk ke dashboard
petani.

User tidak valid menerima pesan
error.

Password tidak ditampilkan
dalam bentuk teks biasa.

---

## [6.3

Register]()

### [Akses]()

Guest.

### [Tujuan]()

Membuat akun petani baru.

### [Field]()

Nama lengkap.

Email.

Nomor HP.

Password.

Konfirmasi password.

### [Aksi User]()

Mengisi form register.

Membuat akun.

Kembali ke login.

### [Validasi]()

Nama wajib diisi.

Email wajib diisi.

Email harus unik.

Nomor HP wajib diisi.

Password minimal 8 karakter.

Konfirmasi password harus sama.

### [Popup/Alert]()

Register berhasil.

Email sudah digunakan.

Password tidak sama.

Field wajib belum diisi.

### [Acceptance Criteria]()

Akun petani berhasil dibuat.

Role default akun baru adalah
petani.

Email yang sama tidak bisa
digunakan dua kali.

Password tersimpan dalam bentuk
hash.

---

## [6.4

Lupa Sandi]()

### [Akses]()

Guest.

### [Tujuan]()

Memberikan fitur reset password sederhana.

### [Field]()

Email.

Password baru.

Konfirmasi password baru.

### [Aksi User]()

Mengisi email.

Mengisi password baru.

Menyimpan password baru.

### [Validasi]()

Email harus terdaftar.

Password baru minimal 8
karakter.

Konfirmasi password harus sama.

### [Popup/Alert]()

Email tidak ditemukan.

Password berhasil diubah.

Konfirmasi password tidak sama.

### [Acceptance Criteria]()

User dapat mengganti password
jika email terdaftar.

Password baru tersimpan dalam
bentuk hash.

User dapat login menggunakan
password baru.

---

## [6.5 Dashboard Petani]()

### [Akses]()

Petani.

### [Tujuan]()

Menampilkan ringkasan aktivitas pertanian milik petani.

### [Komponen]()

Sidebar petani.

Card total lahan.

Card musim aktif.

Card total biaya produksi.

Card total pendapatan.

Card estimasi/total keuntungan.

Card estimasi panen terdekat.

Tabel aktivitas terbaru.

Grafik ringkas biaya dan
profit.

### [Aksi User]()

Melihat ringkasan data.

Klik shortcut tambah lahan.

Klik shortcut tambah musim
tanam.

Klik shortcut tambah biaya.

Klik shortcut input hasil
panen.

### [Data yang Ditampilkan]()

Jumlah lahan milik petani.

Jumlah musim tanam aktif.

Total biaya produksi.

Total pendapatan.

Total keuntungan.

Daftar musim tanam terbaru.

### [Acceptance Criteria]()

Dashboard hanya menampilkan
data milik petani yang sedang login.

Statistik berubah sesuai data
database.

Jika data kosong, sistem
menampilkan empty state.

Tidak ada data milik petani
lain yang tampil.

---

## [6.6 Manajemen Lahan]()

### [Akses]()

Petani.

### [Tujuan]()

Mengelola data lahan pertanian milik petani.

### [Halaman]()

Daftar lahan.

Tambah lahan.

Detail lahan.

Edit lahan.

### [Field Data Lahan]()

Nama lahan.

Lokasi.

Luas lahan.

Status lahan.

Latitude.

Longitude.

Polygon area.

User ID.

### [Aksi User]()

Menambah lahan.

Melihat daftar lahan.

Melihat detail lahan.

Mengedit lahan.

Menghapus lahan.

Membuka peta lahan.

### [Validasi]()

Nama lahan wajib diisi.

Lokasi wajib diisi.

Luas lahan harus berupa angka.

Status lahan wajib dipilih.

### [Popup/Alert]()

Lahan berhasil ditambahkan.

Lahan berhasil diperbarui.

Konfirmasi hapus lahan.

Lahan berhasil dihapus.

Lahan tidak dapat dihapus jika
masih memiliki musim tanam aktif.

### [Acceptance Criteria]()

Petani hanya dapat melihat
lahannya sendiri.

Petani tidak dapat mengedit
lahan milik pengguna lain.

Data lahan tersimpan di
database.

Hapus data memiliki konfirmasi.

Daftar lahan memiliki aksi
detail, edit, dan hapus.

---

## [6.7

Peta Lahan]()

### [Akses]()

Petani.

### [Tujuan]()

Memungkinkan petani menentukan lokasi dan batas area lahan melalui
peta.

### [Komponen]()

Peta OpenStreetMap.

Marker lokasi lahan.

Polygon draw tool.

Panel detail lahan.

Tombol Simpan Lokasi.

Tombol Simpan Polygon.

Tombol Reset Polygon.

### [Aksi User]()

Melihat peta.

Klik lokasi lahan.

Menambahkan marker.

Menggambar polygon.

Menyimpan koordinat.

Mereset polygon.

Melihat popup detail lahan.

### [Data yang Disimpan]()

Latitude.

Longitude.

Polygon area dalam format
JSON/text.

Luas lahan jika dihitung
otomatis.

### [Popup/Alert]()

Marker popup berisi nama lahan,
lokasi, luas, dan status.

Konfirmasi simpan polygon.

Konfirmasi reset polygon.

Alert jika polygon belum
digambar.

Toast koordinat berhasil
disimpan.

### [Acceptance Criteria]()

Peta tampil dengan benar.

User dapat menambahkan marker.

User dapat menggambar polygon.

Koordinat polygon tersimpan.

Polygon lama muncul kembali
saat halaman dibuka ulang.

Data peta hanya terhubung
dengan lahan milik user.

---

## [6.8

Musim Tanam]()

### [Akses]()

Petani.

### [Tujuan]()

Mengelola periode tanam pada suatu lahan.

### [Halaman]()

Daftar musim tanam.

Tambah musim tanam.

Detail musim tanam.

Edit musim tanam.

### [Field]()

Lahan.

Tanaman.

Tanggal tanam.

Estimasi panen.

Status.

Catatan.

### [Status Musim Tanam]()

Persemaian.

Pertumbuhan.

Siap Panen.

Panen Selesai.

### [Aksi User]()

Membuat musim tanam.

Memilih lahan.

Memilih tanaman.

Mengisi tanggal tanam.

Melihat estimasi panen.

Melihat progress pertumbuhan.

Mengubah status.

Menghapus musim tanam.

### [Perhitungan]()

Estimasi panen dihitung dari:

Tanggal Tanam + Masa Panen Tanaman

Progress pertumbuhan dihitung dari:

Jumlah Hari Berjalan / Masa Panen Tanaman x 100%

### [Popup/Alert]()

Musim tanam berhasil dibuat.

Musim tanam berhasil
diperbarui.

Konfirmasi hapus musim tanam.

Alert lahan belum dipilih.

Alert tanaman belum dipilih.

Alert tanggal tanam kosong.

### [Acceptance Criteria]()

Estimasi panen terhitung
otomatis.

Progress pertumbuhan tampil
dalam bentuk progress bar.

Petani hanya dapat mengelola
musim tanam dari lahannya sendiri.

Status musim tanam dapat
diperbarui.

Musim tanam tampil di dashboard
dan laporan.

---

## [6.9 Detail Musim

Tanam / Progress Tanaman]()

### [Akses]()

Petani.

### [Tujuan]()

Menampilkan detail pertumbuhan
tanaman dalam satu musim tanam.

### [Komponen]()

Card informasi lahan.

Card tanaman.

Tanggal tanam.

Estimasi panen.

Status musim.

Progress bar pertumbuhan.

Timeline tanaman.

Tabel biaya produksi terkait.

Ringkasan hasil panen jika
sudah ada.

10. Ringkasan profit.

### [Aksi User]()

Melihat progress.

Mengubah status.

Melihat biaya terkait.

Melihat hasil panen terkait.

Menuju halaman tambah biaya.

Menuju halaman input panen.

### [Acceptance Criteria]()

Detail musim tanam menampilkan
data lengkap.

Progress bar sesuai tanggal
tanam dan masa panen.

Jika belum ada biaya, muncul
empty state.

Jika belum ada panen, muncul
tombol input panen.

---

## [6.10 Biaya Produksi]()

### [Akses]()

Petani.

### [Tujuan]()

Mencatat pengeluaran selama musim tanam.

### [Halaman]()

Daftar biaya produksi.

Tambah biaya.

Edit biaya.

### [Field]()

Musim tanam.

Kategori biaya.

Nominal.

Tanggal biaya.

Keterangan.

### [Kategori Biaya]()

Bibit.

Pupuk.

Pestisida.

Tenaga kerja.

Transportasi.

Sewa alat.

Lainnya.

### [Aksi User]()

Menambah biaya.

Melihat daftar biaya.

Filter berdasarkan musim tanam.

Filter berdasarkan kategori.

Mengedit biaya.

Menghapus biaya.

Melihat total biaya.

### [Validasi]()

Musim tanam wajib dipilih.

Kategori wajib dipilih.

Nominal wajib diisi.

Nominal harus angka dan lebih
dari 0.

### [Popup/Alert]()

Biaya berhasil ditambahkan.

Biaya berhasil diperbarui.

Konfirmasi hapus biaya.

Nominal harus valid.

### [Acceptance Criteria]()

Biaya tersimpan sesuai musim
tanam.

Total biaya per musim tanam
terhitung benar.

Petani hanya dapat melihat
biaya dari musim tanam miliknya.

Filter berjalan dengan benar.

---

## [6.11

Hasil Panen]()

### [Akses]()

Petani.

### [Tujuan]()

Mencatat hasil panen dan menghitung pendapatan serta profit.

### [Halaman]()

Daftar hasil panen.

Tambah hasil panen.

Edit hasil panen.

### [Field]()

Musim tanam.

Total hasil panen.

Satuan.

Harga jual per satuan.

Total pendapatan.

Total biaya produksi.

Total keuntungan.

Catatan.

### [Aksi User]()

Input hasil panen.

Mengisi total hasil.

Mengisi harga jual.

Sistem menghitung pendapatan.

Sistem menghitung profit.

Mengedit hasil panen.

Menghapus hasil panen.

### [Perhitungan]()

Total pendapatan:

Total Hasil Panen x Harga Jual

Profit:

Total Pendapatan - Total Biaya Produksi

### [Popup/Alert]()

Hasil panen berhasil disimpan.

Hasil panen berhasil
diperbarui.

Konfirmasi hapus hasil panen.

Alert jika musim tanam belum
dipilih.

Alert jika total hasil atau
harga jual tidak valid.

### [Acceptance Criteria]()

Satu musim tanam idealnya hanya
memiliki satu data hasil panen.

Total pendapatan otomatis
terhitung.

Total biaya produksi diambil
dari data biaya.

Profit otomatis terhitung.

Data panen tampil di analisis
dan laporan.

---

## [6.12

Analisis]()

### [Akses]()

Petani.

### [Tujuan]()

Menyediakan visualisasi biaya, pendapatan, dan keuntungan.

### [Komponen]()

Card total biaya.

Card total pendapatan.

Card total profit.

Grafik biaya berdasarkan
kategori.

Grafik pendapatan vs biaya.

Grafik profit per musim.

Tabel ringkasan musim.

### [Aksi User]()

Melihat grafik.

Filter berdasarkan musim tanam.

Filter berdasarkan periode.

Membaca ringkasan untung/rugi.

### [Data Visualisasi]()

Total biaya produksi.

Total hasil panen.

Total pendapatan.

Total profit.

Biaya per kategori.

Profit per musim.

### [Acceptance Criteria]()

Grafik mengambil data dari
database.

Grafik tetap tampil meskipun
data sedikit.

Jika data kosong, muncul empty
state.

Angka pada card sesuai dengan
data laporan.

---

## [6.13 Laporan Petani]()

### [Akses]()

Petani.

### [Tujuan]()

Menampilkan laporan pertanian milik petani.

### [Jenis Laporan]()

Laporan biaya produksi.

Laporan hasil panen.

Laporan keuntungan.

Laporan musim tanam.

### [Aksi User]()

Melihat laporan.

Filter berdasarkan musim tanam.

Filter berdasarkan tanggal.

Print laporan.

Export PDF jika tersedia.

Export Excel jika tersedia.

### [Popup/Alert]()

Modal filter laporan.

Toast export berhasil.

Alert jika data laporan kosong.

### [Acceptance Criteria]()

Petani hanya melihat laporannya
sendiri.

Filter laporan berjalan.

Total biaya, pendapatan, dan
profit sesuai data.

Laporan bisa digunakan untuk
demo meskipun export belum tersedia.

---

## [6.14 Profil Petani]()

### [Akses]()

Petani.

### [Tujuan]()

Mengelola data profil pengguna.

### [Field]()

Nama lengkap.

Email.

Nomor HP.

Foto profil.

Password lama.

Password baru.

Konfirmasi password baru.

### [Aksi User]()

Melihat profil.

Mengubah nama.

Mengubah nomor HP.

Mengupload foto profil jika
tersedia.

Mengubah password.

### [Popup/Alert]()

Profil berhasil diperbarui.

Password lama salah.

Password baru tidak sama.

Ukuran file terlalu besar.

Format file tidak valid.

### [Acceptance Criteria]()

User dapat memperbarui profil.

Email tidak boleh duplikat.

Password baru tersimpan dalam
hash.

Upload foto hanya menerima
format gambar jika fitur diimplementasikan.

---

## [6.15 Dashboard Admin]()

### [Akses]()

Admin.

### [Tujuan]()

Menampilkan ringkasan data sistem.

### [Komponen]()

Sidebar admin.

Card total petani.

Card total lahan.

Card total musim aktif.

Card total hasil panen.

Grafik statistik sistem.

Tabel data terbaru.

### [Aksi Admin]()

Melihat statistik sistem.

Membuka data pengguna.

Membuka data tanaman.

Membuka monitoring lahan.

Membuka laporan.

### [Acceptance Criteria]()

Dashboard admin hanya bisa
diakses admin.

Statistik berasal dari
database.

Admin dapat melihat ringkasan
data global.

Petani tidak dapat mengakses
dashboard admin.

---

## [6.16 Data Pengguna]()

### [Akses]()

Admin.

### [Tujuan]()

Memantau data pengguna aplikasi.

### [Data yang Ditampilkan]()

Nama.

Email.

Nomor HP.

Role.

Status akun.

Jumlah lahan.

Tanggal daftar.

### [Aksi Admin]()

Melihat daftar pengguna.

Melihat detail pengguna.

Mengaktifkan/nonaktifkan user
jika tersedia.

Menghapus user jika tidak
memiliki data relasi penting.

### [Popup/Alert]()

Konfirmasi nonaktifkan user.

Konfirmasi hapus user.

User berhasil diperbarui.

User tidak dapat dihapus karena
memiliki data terkait.

### [Acceptance Criteria]()

Admin dapat melihat semua
pengguna.

Admin dapat melihat detail
pengguna.

Data pengguna tampil lengkap.

Aksi hapus/nonaktif memiliki
konfirmasi.

---

## [6.17 Master Data Tanaman]()

### [Akses]()

Admin.

### [Tujuan]()

Mengelola daftar tanaman yang digunakan pada musim tanam.

### [Field]()

Nama tanaman.

Masa panen dalam hari.

Deskripsi.

Status aktif/nonaktif.

### [Aksi Admin]()

Melihat daftar tanaman.

Menambah tanaman.

Mengedit tanaman.

Menghapus/nonaktifkan tanaman.

### [Validasi]()

Nama tanaman wajib diisi.

Masa panen wajib diisi.

Masa panen harus angka lebih
dari 0.

Nama tanaman tidak boleh
duplikat.

### [Popup/Alert]()

Tanaman berhasil ditambahkan.

Tanaman berhasil diperbarui.

Konfirmasi hapus tanaman.

Tanaman tidak dapat dihapus
karena sudah dipakai pada musim tanam.

### [Acceptance Criteria]()

Data tanaman dapat digunakan
pada form musim tanam.

Masa panen tanaman digunakan
untuk menghitung estimasi panen.

Tanaman aktif tampil pada
dropdown.

Tanaman nonaktif tidak tampil
pada dropdown musim tanam.

---

## [6.18 Monitoring Lahan Admin]()

### [Akses]()

Admin.

### [Tujuan]()

Memantau seluruh data lahan pengguna.

### [Komponen]()

Tabel seluruh lahan.

Peta monitoring.

Filter petani.

Filter tanaman.

Filter status lahan/musim.

Detail lahan.

### [Aksi Admin]()

Melihat seluruh lahan.

Melihat posisi lahan pada peta.

Membuka detail lahan.

Filter data lahan.

### [Popup/Alert]()

Popup marker berisi nama
petani, nama lahan, luas, tanaman aktif, dan status.

Modal detail lahan.

### [Acceptance Criteria]()

Admin dapat melihat semua
lahan.

Peta menampilkan marker/polygon
lahan.

Filter berjalan.

Admin tidak perlu mengubah
polygon petani.

---

## [6.19 Laporan Admin]()

### [Akses]()

Admin.

### [Tujuan]()

Menampilkan laporan global sistem.

### [Jenis Laporan]()

Laporan pengguna.

Laporan lahan.

Laporan musim tanam.

Laporan hasil panen.

Laporan keuntungan.

### [Aksi Admin]()

Melihat laporan global.

Filter berdasarkan periode.

Filter berdasarkan petani.

Filter berdasarkan tanaman.

Print/export jika tersedia.

### [Acceptance Criteria]()

Admin dapat melihat laporan
global.

Laporan bersumber dari
database.

Filter laporan berjalan.

Data agregasi sesuai dengan
data petani.

---

## [7. Navigasi dan Menu]()

### [7.1 Navbar Guest]()

Home.

Fitur.

Tentang.

Peta/Preview.

Login.

Register.

### [7.2 Sidebar Petani]()

Dashboard.

Lahan.

Peta Lahan.

Musim Tanam.

Biaya Produksi.

Hasil Panen.

Analisis.

Laporan.

Profil.

10. Logout.

### [7.3 Sidebar Admin]()

Dashboard.

Data Pengguna.

Data Tanaman.

Monitoring Lahan.

Laporan.

Profil Admin.

Logout.

---

## [8. Popup, Modal, dan

Feedback Sistem]()

### [8.1 Alert Login Gagal]()

Digunakan ketika email atau password salah.

### [8.2 Alert Register Berhasil]()

Digunakan ketika akun petani berhasil
dibuat.

### [8.3 Alert Validasi Form]()

Digunakan ketika field wajib belum diisi
atau format input salah.

### [8.4 Toast Simpan Berhasil]()

Digunakan pada semua form create dan
update.

### [8.5 Toast Hapus Berhasil]()

Digunakan setelah data berhasil dihapus.

### [8.6 Modal Konfirmasi Hapus]()

Digunakan pada: 1. Lahan. 2. Musim
tanam. 3. Biaya produksi. 4. Hasil panen. 5. Data tanaman. 6. Data pengguna.

### [8.7 Marker Popup]()

Digunakan pada peta lahan untuk menampilkan
informasi singkat lahan.

### [8.8 Modal Reset Polygon]()

Digunakan ketika user ingin menghapus
gambar polygon sementara.

### [8.9 Modal Filter Laporan]()

Digunakan untuk memilih periode, musim
tanam, tanaman, atau petani pada laporan.

### [8.10 Logout Confirmation]()

Opsional. Digunakan untuk konfirmasi
keluar dari sistem.

---

## [9. Requirement Fungsional]()

### [RF-01 Landing Page]()

Sistem harus menyediakan landing page yang dapat diakses tanpa
login.

### [RF-02 Register]()

Sistem harus menyediakan fitur registrasi akun petani.

### [RF-03 Login]()

Sistem harus menyediakan fitur login untuk admin dan petani.

### [RF-04 Logout]()

Sistem harus menyediakan fitur logout.

### [RF-05 Role Access]()

Sistem harus membatasi akses berdasarkan role pengguna.

### [RF-06 Dashboard Petani]()

Sistem harus menampilkan ringkasan data pertanian milik petani.

### [RF-07 Dashboard Admin]()

Sistem harus menampilkan ringkasan data global untuk admin.

### [RF-08 CRUD Tanaman]()

Admin harus dapat mengelola master data tanaman.

### [RF-09 CRUD Lahan]()

Petani harus dapat mengelola data lahan miliknya sendiri.

### [RF-10 Peta Lahan]()

Sistem harus menampilkan peta interaktif untuk menentukan lokasi
lahan.

### [RF-11 Polygon Area]()

Sistem harus memungkinkan petani menggambar dan menyimpan polygon
area lahan.

### [RF-12 CRUD Musim Tanam]()

Petani harus dapat mengelola data musim tanam.

### [RF-13 Estimasi Panen]()

Sistem harus menghitung estimasi panen berdasarkan tanggal tanam dan
masa panen tanaman.

### [RF-14 Progress Tanaman]()

Sistem harus menampilkan progress pertumbuhan tanaman.

### [RF-15 CRUD Biaya Produksi]()

Petani harus dapat mencatat biaya produksi.

### [RF-16 Total Biaya]()

Sistem harus menghitung total biaya produksi per musim tanam.

### [RF-17 CRUD Hasil Panen]()

Petani harus dapat mencatat hasil panen.

### [RF-18 Total Pendapatan]()

Sistem harus menghitung total pendapatan dari total hasil panen dan
harga jual.

### [RF-19 Profit]()

Sistem harus menghitung profit dari total pendapatan dikurangi total
biaya produksi.

### [RF-20 Analisis]()

Sistem harus menampilkan grafik biaya, pendapatan, dan profit.

### [RF-21 Laporan Petani]()

Sistem harus menampilkan laporan milik petani.

### [RF-22 Laporan Admin]()

Sistem harus menampilkan laporan global untuk admin.

### [RF-23 Profil]()

Sistem harus menyediakan halaman profil pengguna.

### [RF-24 Validasi Form]()

Sistem harus memvalidasi input pengguna.

### [RF-25 Popup dan Toast]()

Sistem harus memberikan feedback visual setelah aksi pengguna.

---

## [10. Requirement Non-Fungsional]()

### [10.1 Usability]()

Tampilan harus mudah dipahami.

Menu harus konsisten.

Form harus memiliki label yang
jelas.

Error message harus mudah
dimengerti.

Empty state harus tersedia
ketika data kosong.

### [10.2 Performance]()

Halaman dashboard harus dapat
dimuat dengan cepat.

Query agregasi dashboard harus
efisien.

Peta tidak boleh membuat
halaman terlalu berat.

Gambar harus dikompresi jika
menggunakan upload.

### [10.3 Security]()

Password harus disimpan
menggunakan hashing.

Input harus divalidasi.

Akses halaman harus dibatasi
berdasarkan role.

Petani tidak boleh mengakses
data petani lain.

Sistem harus menggunakan CSRF
protection jika memakai Laravel.

Query database harus aman dari
SQL injection.

### [10.4 Reliability]()

Data yang disimpan harus masuk
ke database.

Sistem harus tetap menampilkan
halaman walaupun data kosong.

Kesalahan input harus ditangani
dengan alert.

Hapus data penting harus
memakai konfirmasi.

### [10.5 Responsiveness]()

Landing page responsif.

Login dan register responsif.

Dashboard tetap dapat digunakan
pada laptop.

Tampilan mobile minimal tidak
rusak.

---

## [11. Struktur Database]()

### [11.1 Tabel users]()

Digunakan untuk menyimpan akun admin dan petani.

Field: 1. id 2. nama 3. email 4. password 5. nomor_hp 6. role 7.
status 8. foto_profil 9. created_at 10. updated_at

Role: 1. admin 2. petani

Status: 1. aktif 2. nonaktif

### [11.2 Tabel tanaman]()

Digunakan untuk menyimpan master data tanaman.

Field: 1. id 2. nama_tanaman 3. masa_panen 4. deskripsi 5. status 6.
created_at 7. updated_at

### [11.3 Tabel lahan]()

Digunakan untuk menyimpan data lahan petani.

Field: 1. id 2. user_id 3. nama_lahan 4. lokasi 5. luas_lahan 6.
status_lahan 7. latitude 8. longitude 9. polygon_area 10. created_at 11.
updated_at

### [11.4 Tabel musim_tanam]()

Digunakan untuk menyimpan musim tanam pada lahan.

Field: 1. id 2. lahan_id 3. tanaman_id 4. tanggal_tanam 5.
estimasi_panen 6. status 7. catatan 8. created_at 9. updated_at

### [11.5 Tabel biaya_produksi]()

Digunakan untuk menyimpan biaya produksi per musim tanam.

Field: 1. id 2. musim_tanam_id 3. kategori 4. nominal 5.
tanggal_biaya 6. keterangan 7. created_at 8. updated_at

### [11.6 Tabel hasil_panen]()

Digunakan untuk menyimpan hasil panen.

Field: 1. id 2. musim_tanam_id 3. total_hasil 4. satuan 5.
harga_jual 6. total_pendapatan 7. total_keuntungan 8. catatan 9. created_at 10.
updated_at

---

## [12. Relasi Database]()

Satu user petani memiliki
banyak lahan.

Satu lahan memiliki banyak
musim tanam.

Satu tanaman dapat digunakan
oleh banyak musim tanam.

Satu musim tanam memiliki
banyak biaya produksi.

Satu musim tanam memiliki satu
hasil panen.

Admin berada di tabel users
dengan role admin.

Relasi: 1. users 1..n
lahan 2. lahan 1..n musim_tanam 3. tanaman 1..n musim_tanam 4. musim_tanam 1..n
biaya_produksi 5. musim_tanam 1..1 hasil_panen

---

## [13. Business Logic]()

### [13.1 Estimasi Panen]()

Estimasi panen dihitung ketika petani membuat musim tanam.

Rumus: Tanggal Tanam + Masa Panen Tanaman

Contoh: Tanggal tanam: 1 Juni 2026

Tanaman: Jagung

Masa panen: 90 hari

Estimasi panen: 30 Agustus 2026

### [13.2 Progress Tanaman]()

Progress dihitung berdasarkan hari berjalan sejak tanggal tanam.

Rumus: Hari Berjalan / Masa Panen Tanaman x 100%

Aturan: 1. Jika progress kurang dari 0, tampilkan 0%. 2. Jika
progress lebih dari 100, tampilkan 100%. 3. Jika progress mencapai 100%,
tanaman dapat ditandai siap panen.

### [13.3 Total Biaya Produksi]()

Total biaya produksi dihitung dari seluruh biaya yang terkait dengan
satu musim tanam.

Rumus: Total Biaya = Jumlah seluruh nominal biaya produksi

### [13.4 Total Pendapatan]()

Total pendapatan dihitung dari hasil panen dan harga jual.

Rumus: Total Pendapatan = Total Hasil Panen x Harga Jual

### [13.5 Profit]()

Profit dihitung dari total pendapatan dikurangi total biaya
produksi.

Rumus: Profit = Total Pendapatan - Total Biaya Produksi

Aturan: 1. Jika profit lebih dari 0, status keuangan adalah untung.
2. Jika profit sama dengan 0, status keuangan adalah impas. 3. Jika profit
kurang dari 0, status keuangan adalah rugi.

---

## [14.

Teknologi]()

### [14.1 Front-End]()

HTML5.

CSS3.

JavaScript.

Bootstrap atau Tailwind CSS.

Chart.js.

Leaflet.js.

Leaflet Draw Plugin.

### [14.2 Back-End]()

PHP.

Laravel atau PHP native.

Session authentication.

Role middleware.

CRUD controller.

### [14.3 Database]()

MySQL.

phpMyAdmin.

### [14.4 Tools]()

Visual Studio Code.

XAMPP atau Laragon.

GitHub.

Figma.

Postman jika memakai API
endpoint.

---

## [15. Design Requirement]()

### [15.1 Konsep Visual]()

Desain menggunakan gaya: 1. Modern. 2. Clean. 3. Minimalis. 4.
Agritech. 5. Responsif.

### [15.2 Warna]()

Warna utama: 1. Hijau tua. 2. Hijau muda. 3. Putih. 4. Coklat
earthy. 5. Abu modern.

### [15.3 Komponen UI]()

Navbar.

Sidebar.

Statistik card.

Tabel modern.

Form input.

Button utama.

Button aksi.

Modal konfirmasi.

Toast.

10. Progress bar.
11. Chart.
12. Interactive map.

### [15.4 Prinsip UI]()

Setiap halaman dashboard
memakai sidebar konsisten.

Aksi utama memakai tombol yang
jelas.

Tabel memiliki aksi detail,
edit, hapus.

Form memiliki validasi.

Data kosong memiliki empty
state.

Warna hijau digunakan sebagai
identitas utama.

---

## [16.

Routing]()

### [16.1 Guest Routes]()

GET /

GET /login

POST /login

GET /register

POST /register

GET /forgot-password

POST /forgot-password

### [16.2 Petani Routes]()

GET /petani/dashboard

GET /petani/lahan

GET /petani/lahan/create

POST /petani/lahan

GET /petani/lahan/{id}

GET /petani/lahan/{id}/edit

PUT /petani/lahan/{id}

DELETE /petani/lahan/{id}

GET /petani/peta-lahan

10. POST /petani/peta-lahan/{id}
11. GET /petani/musim-tanam
12. GET /petani/musim-tanam/create
13. POST /petani/musim-tanam
14. GET /petani/musim-tanam/{id}
15. GET /petani/musim-tanam/{id}/edit
16. PUT /petani/musim-tanam/{id}
17. DELETE /petani/musim-tanam/{id}
18. GET /petani/biaya
19. GET /petani/biaya/create
20. POST /petani/biaya
21. GET /petani/biaya/{id}/edit
22. PUT /petani/biaya/{id}
23. DELETE /petani/biaya/{id}
24. GET /petani/panen
25. GET /petani/panen/create
26. POST /petani/panen
27. GET /petani/panen/{id}/edit
28. PUT /petani/panen/{id}
29. DELETE /petani/panen/{id}
30. GET /petani/analisis
31. GET /petani/laporan
32. GET /petani/profil
33. PUT /petani/profil
34. POST /logout

### [16.3 Admin Routes]()

GET /admin/dashboard

GET /admin/users

GET /admin/users/{id}

PUT /admin/users/{id}/status

GET /admin/tanaman

GET /admin/tanaman/create

POST /admin/tanaman

GET /admin/tanaman/{id}/edit

PUT /admin/tanaman/{id}

10. DELETE /admin/tanaman/{id}
11. GET /admin/monitoring-lahan
12. GET /admin/laporan
13. GET /admin/profil
14. PUT /admin/profil
15. POST /logout

---

## [17. Prioritas Implementasi]()

### [17.1 Prioritas Wajib]()

Auth dan role.

Dashboard.

CRUD tanaman.

CRUD lahan.

Peta lahan.

CRUD musim tanam.

CRUD biaya produksi.

CRUD hasil panen.

Analisis profit.

10. Laporan tabel.

### [17.2 Prioritas Tambahan]()

Export PDF.

Export Excel.

Upload foto profil.

Reset password.

Cuaca API.

### [17.3 Prioritas Ditunda]()

Marketplace.

Dropshipper.

Payment.

Forum.

Konsultasi.

AI rekomendasi tanaman.

IoT.

---

## [18. Timeline Implementasi 3 Hari]()

### [Hari 1: Fondasi Sistem

dan Desain]()

Target: 1. Finalisasi desain
AgroTrack dari desain lama. 2. Setup project. 3. Setup database. 4. Membuat
migration/schema. 5. Seeder admin dan tanaman. 6. Auth register, login, logout.
7. Middleware role. 8. Layout guest, petani, dan admin. 9. Landing page awal.
10. Dashboard petani/admin versi awal.

Output: 1. Project dapat
dijalankan. 2. User dapat register. 3. Admin dan petani dapat login. 4. Role
access berjalan. 5. Layout utama siap.

### [Hari 2: CRUD Inti dan Peta]()

Target: 1. CRUD master data
tanaman. 2. CRUD lahan. 3. Integrasi Leaflet. 4. Simpan marker dan polygon. 5.
CRUD musim tanam. 6. Estimasi panen otomatis. 7. Progress tanaman. 8. CRUD
biaya produksi. 9. Monitoring lahan admin versi awal.

Output: 1. Data tanaman bisa
dikelola admin. 2. Data lahan bisa dikelola petani. 3. Peta dapat menyimpan
koordinat/polygon. 4. Musim tanam berjalan. 5. Biaya produksi berjalan.

### [Hari 3: Panen,

Analisis, Laporan, Testing]()

Target: 1. CRUD hasil
panen. 2. Hitung total pendapatan. 3. Hitung profit. 4. Dashboard final. 5.
Analisis Chart.js. 6. Laporan petani. 7. Laporan admin. 8.
Popup/toast/validasi. 9. UI polish. 10. Testing manual. 11. README dan
dokumentasi. 12. Skenario demo.

Output: 1. Alur demo
utama berjalan. 2. Analisis dan laporan tampil. 3. Aplikasi siap
dipresentasikan. 4. Dokumentasi tersedia.

---

## [19. Success Metrics]()

AgroTrack dianggap
berhasil jika:

Guest dapat membuka landing
page.

Petani dapat register dan
login.

Admin dapat login.

Role access berjalan.

Petani dapat membuat lahan.

Petani dapat menyimpan
lokasi/polygon lahan.

Petani dapat membuat musim
tanam.

Estimasi panen otomatis
berjalan.

Progress tanaman tampil.

10. Petani dapat mencatat biaya.
11. Petani dapat mencatat hasil panen.
12. Profit terhitung otomatis.
13. Grafik analisis tampil.
14. Laporan tampil.
15. Admin dapat melihat data pengguna, tanaman, lahan, dan laporan.
16. Aplikasi dapat didemokan tanpa error utama.

---

## [20. Risiko dan Mitigasi]()

### [Risiko 1: Waktu 3

Hari Terlalu Ketat]()

Mitigasi: 1. Kerjakan alur utama terlebih dahulu. 2. Jangan
mengerjakan marketplace, payment, dropshipper, forum, dan chat. 3. Export
PDF/Excel dikerjakan setelah laporan tabel selesai.

### [Risiko 2: Peta

Leaflet Memakan Waktu]()

Mitigasi: 1. Target minimal adalah marker dan simpan koordinat. 2.
Polygon disusulkan setelah marker berjalan. 3. Luas otomatis boleh diganti
input manual jika debugging terlalu lama.

### [Risiko 3: Role Access

Bermasalah]()

Mitigasi: 1. Auth dan middleware diselesaikan hari pertama. 2. Buat
akun demo admin dan petani. 3. Test akses admin/petani sejak awal.

### [Risiko 4:

Dashboard dan Grafik Tidak Selesai]()

Mitigasi: 1. Buat card statistik dahulu. 2. Grafik cukup 2–3 yang
paling penting. 3. Empty state disiapkan untuk data kosong.

### [Risiko 5: Data

Relasi Membuat Hapus Data Error]()

Mitigasi: 1. Gunakan konfirmasi hapus. 2. Gunakan soft delete atau
status nonaktif untuk data penting. 3. Batasi hapus jika data sudah memiliki
relasi.

---

## [21. Skenario Demo]()

### [21.1 Demo Guest]()

Buka landing page.

Tunjukkan fitur utama.

Klik register.

### [21.2 Demo Petani]()

Register akun petani.

Login sebagai petani.

Buka dashboard.

Tambah lahan.

Buka peta lahan.

Tambahkan marker/polygon.

Tambah musim tanam.

Tunjukkan estimasi panen.

Tunjukkan progress pertumbuhan.

10. Tambah biaya produksi.
11. Input hasil panen.
12. Tunjukkan profit.
13. Buka analisis.
14. Buka laporan.

### [21.3 Demo Admin]()

Login sebagai admin.

Buka dashboard admin.

Tunjukkan data pengguna.

Tunjukkan master data tanaman.

Tunjukkan monitoring lahan.

Tunjukkan laporan global.

---

## [22.

Akun Demo]()

### [Admin]()

Email: admin@agrotrack.test

Password: password

### [Petani]()

Email: petani@agrotrack.test

Password: password

---

## [23. Kriteria Selesai]()

Aplikasi dianggap
selesai untuk FP jika:

Semua halaman utama dapat
dibuka.

Tidak ada error fatal saat
demo.

Auth dan role berjalan.

CRUD utama berjalan.

Peta lahan berjalan minimal
marker dan polygon.

Estimasi panen berjalan.

Perhitungan biaya, pendapatan,
dan profit benar.

Dashboard menampilkan data dari
database.

Laporan tampil.

10. Dokumentasi dan README tersedia.
11. Source code tersimpan di GitHub.
12. Screenshot aplikasi tersedia untuk laporan.

---

## [24. Future Development]()

Fitur yang dapat
dikembangkan setelah FP:

Mobile app.

AI rekomendasi tanaman.

IoT monitoring sensor tanah.

Notifikasi WhatsApp.

Analisis cuaca lanjutan.

Integrasi harga pasar
komoditas.

Forum komunitas petani.

Konsultasi dengan ahli
pertanian.

Marketplace hasil panen.

10. Payment gateway.
11. QR code laporan lahan.
12. Dark mode.
13. Multi-role management yang lebih kompleks.

---

## [25.

Kesimpulan]()

AgroTrack adalah aplikasi web
pertanian berbasis peta yang dirancang untuk membantu petani mengelola lahan,
musim tanam, biaya produksi, hasil panen, dan analisis keuntungan secara
digital. Produk ini memiliki dua role utama, yaitu Petani dan Admin. Petani
berfokus pada pengelolaan data pertanian miliknya sendiri, sedangkan Admin
berfokus pada monitoring data sistem secara global.

Dalam konteks FP Pemrograman
Web, AgroTrack memiliki cakupan yang kuat karena mencakup autentikasi, role
access, CRUD, database relasional, peta interaktif, perhitungan bisnis,
dashboard, grafik, laporan, validasi form, dan dokumentasi. Dengan prioritas pengerjaan
yang tepat, AgroTrack dapat menjadi proyek FP yang lengkap, relevan, dan dapat
didemokan secara jelas.
