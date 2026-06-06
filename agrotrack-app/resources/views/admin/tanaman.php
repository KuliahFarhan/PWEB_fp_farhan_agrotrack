<div class="mb-5 flex flex-wrap items-center justify-between gap-3">
    <div>
        <h2 class="text-xl font-black text-slate-950">Data Tanaman</h2>
        <p class="text-sm text-slate-500">CRUD master tanaman akan dibuat setelah backend siap.</p>
    </div>
    <button class="rounded-md bg-teal-700 px-4 py-2 text-sm font-bold text-white">+ Tambah Tanaman</button>
</div>
<?php
table_placeholder(
    ['Nama Tanaman', 'Masa Panen', 'Status', 'Deskripsi', 'Aksi'],
    [
        ['Jagung Manis', '90 hari', 'aktif', 'Tanaman jagung untuk musim reguler', 'Edit | Hapus'],
        ['Jagung Pipil', '100 hari', 'aktif', 'Varietas jagung kering', 'Edit | Hapus'],
        ['Cabai', '85 hari', 'aktif', 'Komoditas tambahan demo', 'Edit | Hapus'],
    ]
);
?>
<div class="mt-6 grid gap-6 lg:grid-cols-2">
    <section class="agro-card rounded-lg p-5">
        <h3 class="font-black text-slate-950">Form Tanaman Placeholder</h3>
        <div class="mt-4 grid gap-4">
            <?php form_field('Nama Tanaman', 'nama_tanaman', 'text', 'Contoh: Jagung Manis'); ?>
            <?php form_field('Masa Panen', 'masa_panen', 'number', 'Hari'); ?>
            <?php form_field('Status', 'status', 'text', 'aktif / nonaktif'); ?>
        </div>
    </section>
    <?php confirmation_modal('Konfirmasi hapus tanaman', 'Nanti hapus tanaman dibatasi jika sudah dipakai oleh musim tanam.'); ?>
</div>
