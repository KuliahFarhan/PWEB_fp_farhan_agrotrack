<div class="mb-5 flex flex-wrap items-center justify-between gap-3">
    <div>
        <h2 class="text-xl font-black text-slate-950">Hasil Panen</h2>
        <p class="text-sm text-slate-500">Pendapatan dan profit akan dihitung otomatis dari hasil panen, harga jual, dan total biaya.</p>
    </div>
    <button class="rounded-md bg-teal-700 px-4 py-2 text-sm font-bold text-white">+ Input Panen</button>
</div>
<?php
table_placeholder(
    ['Musim', 'Total Hasil', 'Harga Jual', 'Pendapatan', 'Profit', 'Aksi'],
    [
        ['Jagung Manis 2026', '2.400 kg', 'Rp 5.000', 'Rp 12.000.000', 'Rp 3.300.000', 'Edit | Hapus'],
        ['Cabai 2026', '850 kg', 'Rp 18.000', 'Rp 15.300.000', 'Rp 7.100.000', 'Edit | Hapus'],
    ]
);
?>
<section class="agro-card mt-6 rounded-lg p-5">
    <h3 class="font-black text-slate-950">Form Panen Placeholder</h3>
    <div class="mt-4 grid gap-4 md:grid-cols-2">
        <?php form_field('Musim Tanam', 'musim_tanam_id', 'text', 'Dropdown musim'); ?>
        <?php form_field('Total Hasil', 'total_hasil', 'number', 'Jumlah panen'); ?>
        <?php form_field('Satuan', 'satuan', 'text', 'kg / ton'); ?>
        <?php form_field('Harga Jual', 'harga_jual', 'number', 'Harga per satuan'); ?>
    </div>
</section>
