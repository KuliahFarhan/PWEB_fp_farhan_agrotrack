<div class="mb-5 flex flex-wrap items-center justify-between gap-3">
    <div>
        <h2 class="text-xl font-black text-slate-950">Biaya Produksi</h2>
        <p class="text-sm text-slate-500">Catat pengeluaran per musim tanam. Data saat ini dummy.</p>
    </div>
    <button class="rounded-md bg-teal-700 px-4 py-2 text-sm font-bold text-white">+ Tambah Biaya</button>
</div>
<section class="grid gap-5 md:grid-cols-3">
    <?php stat_card('Bibit', 'Rp 1,2 jt', 'Dummy kategori', 'yellow'); ?>
    <?php stat_card('Pupuk', 'Rp 3,1 jt', 'Dummy kategori', 'teal'); ?>
    <?php stat_card('Total Biaya', 'Rp 8,7 jt', 'Dummy total', 'blue'); ?>
</section>
<div class="mt-6">
    <?php
    table_placeholder(
        ['Musim', 'Kategori', 'Nominal', 'Tanggal', 'Keterangan', 'Aksi'],
        [
            ['Jagung Manis 2026', 'Bibit', 'Rp 1.200.000', '03 Jun 2026', 'Benih unggul', 'Edit | Hapus'],
            ['Jagung Manis 2026', 'Pupuk', 'Rp 2.000.000', '10 Jun 2026', 'Pupuk NPK', 'Edit | Hapus'],
            ['Jagung Pipil 2026', 'Tenaga kerja', 'Rp 1.500.000', '12 Jun 2026', 'Olah lahan', 'Edit | Hapus'],
        ]
    );
    ?>
</div>
