<div class="mb-5 flex flex-wrap items-center justify-between gap-3">
    <div>
        <h2 class="text-xl font-black text-slate-950">Laporan Global</h2>
        <p class="text-sm text-slate-500">Ringkasan lintas petani, tanaman, lahan, musim tanam, biaya, dan panen.</p>
    </div>
    <div class="flex gap-2">
        <button class="rounded-md border border-slate-200 px-4 py-2 text-sm font-bold text-slate-600">Filter</button>
        <button class="rounded-md bg-teal-700 px-4 py-2 text-sm font-bold text-white">Print</button>
    </div>
</div>
<section class="grid gap-5 md:grid-cols-3">
    <?php stat_card('Total Biaya Global', 'Rp 124 jt', 'Dummy laporan', 'red'); ?>
    <?php stat_card('Pendapatan Global', 'Rp 310 jt', 'Dummy laporan', 'teal'); ?>
    <?php stat_card('Profit Global', 'Rp 186 jt', 'Dummy laporan', 'blue'); ?>
</section>
<div class="mt-6">
    <?php
    table_placeholder(
        ['Petani', 'Musim', 'Tanaman', 'Biaya', 'Pendapatan', 'Profit'],
        [
            ['Siti Petani', 'Jun - Agu 2026', 'Jagung Manis', 'Rp 8.700.000', 'Rp 12.000.000', 'Rp 3.300.000'],
            ['Budi Petani', 'Jun - Sep 2026', 'Jagung Pipil', 'Rp 12.400.000', 'Rp 20.000.000', 'Rp 7.600.000'],
            ['Ayu Petani', 'Mei - Agu 2026', 'Cabai', 'Rp 8.200.000', 'Rp 15.300.000', 'Rp 7.100.000'],
        ]
    );
    ?>
</div>
