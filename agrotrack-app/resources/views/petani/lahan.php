<div class="mb-5 flex flex-wrap items-center justify-between gap-3">
    <div>
        <h2 class="text-xl font-black text-slate-950">Daftar Lahan</h2>
        <p class="text-sm text-slate-500">CRUD lahan akan dihubungkan ke database pada task berikutnya.</p>
    </div>
    <button class="rounded-md bg-teal-700 px-4 py-2 text-sm font-bold text-white">+ Tambah Lahan</button>
</div>
<?php
// Future backend: replace dummy rows with lahan table filtered by current user_id.
table_placeholder(
    ['Nama Lahan', 'Lokasi', 'Luas', 'Status', 'Aksi'],
    [
        ['Kebun Utara', 'Mojokerto', '1.8 ha', 'Aktif', 'Detail | Edit | Hapus'],
        ['Lahan Barat', 'Jombang', '2.1 ha', 'Aktif', 'Detail | Edit | Hapus'],
        ['Kebun Timur', 'Lamongan', '1.2 ha', 'Nonaktif', 'Detail | Edit | Hapus'],
    ]
);
?>
<div class="mt-6 grid gap-6 lg:grid-cols-2">
    <section class="agro-card rounded-lg p-5">
        <h3 class="font-black text-slate-950">Form Lahan Placeholder</h3>
        <div class="mt-4 grid gap-4">
            <?php form_field('Nama Lahan', 'nama_lahan', 'text', 'Contoh: Kebun Utara'); ?>
            <?php form_field('Lokasi', 'lokasi', 'text', 'Desa / Kecamatan'); ?>
            <?php form_field('Luas Lahan', 'luas_lahan', 'number', 'Luas dalam hektar'); ?>
        </div>
    </section>
    <?php confirmation_modal('Konfirmasi hapus lahan', 'Nanti modal ini muncul sebelum data lahan dihapus.'); ?>
</div>
