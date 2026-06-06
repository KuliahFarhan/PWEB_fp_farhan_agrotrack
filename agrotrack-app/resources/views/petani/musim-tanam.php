<div class="mb-5 flex flex-wrap items-center justify-between gap-3">
    <div>
        <h2 class="text-xl font-black text-slate-950">Musim Tanam</h2>
        <p class="text-sm text-slate-500">Estimasi panen dan progress akan dihitung dari tanggal tanam + masa panen tanaman.</p>
    </div>
    <button class="rounded-md bg-teal-700 px-4 py-2 text-sm font-bold text-white">+ Tambah Musim</button>
</div>
<?php
table_placeholder(
    ['Lahan', 'Tanaman', 'Tanggal Tanam', 'Estimasi Panen', 'Progress', 'Status'],
    [
        ['Kebun Utara', 'Jagung Manis', '01 Jun 2026', '30 Agu 2026', '65%', 'Pertumbuhan'],
        ['Lahan Barat', 'Jagung Pipil', '12 Jun 2026', '10 Sep 2026', '42%', 'Persemaian'],
        ['Kebun Timur', 'Cabai', '20 Mei 2026', '18 Agu 2026', '90%', 'Siap Panen'],
    ]
);
?>
<section class="agro-card mt-6 rounded-lg p-5">
    <h3 class="font-black text-slate-950">Form Musim Tanam Placeholder</h3>
    <div class="mt-4 grid gap-4 md:grid-cols-2">
        <?php form_field('Lahan', 'lahan_id', 'text', 'Dropdown lahan'); ?>
        <?php form_field('Tanaman', 'tanaman_id', 'text', 'Dropdown tanaman'); ?>
        <?php form_field('Tanggal Tanam', 'tanggal_tanam', 'date', ''); ?>
        <?php form_field('Status', 'status', 'text', 'Persemaian / Pertumbuhan / Siap Panen'); ?>
    </div>
</section>
