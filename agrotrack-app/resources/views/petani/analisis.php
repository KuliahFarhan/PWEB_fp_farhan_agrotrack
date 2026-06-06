<section class="grid gap-5 md:grid-cols-3">
    <?php stat_card('Total Biaya', 'Rp 8,7 jt', 'Dummy akumulasi', 'red'); ?>
    <?php stat_card('Total Pendapatan', 'Rp 27,3 jt', 'Dummy akumulasi', 'teal'); ?>
    <?php stat_card('Total Profit', 'Rp 18,6 jt', 'Placeholder profit', 'blue'); ?>
</section>
<section class="mt-6 grid gap-6 xl:grid-cols-2">
    <div class="agro-card rounded-lg p-5">
        <h2 class="text-lg font-black text-slate-950">Grafik Biaya per Kategori</h2>
        <div class="agro-chart-placeholder mt-4 grid h-72 place-items-center rounded-md border border-slate-200">
            <p class="rounded-md bg-white/90 px-4 py-2 text-sm font-bold text-teal-800">Chart.js Placeholder</p>
        </div>
    </div>
    <div class="agro-card rounded-lg p-5">
        <h2 class="text-lg font-black text-slate-950">Pendapatan vs Biaya</h2>
        <div class="agro-chart-placeholder mt-4 grid h-72 place-items-center rounded-md border border-slate-200">
            <p class="rounded-md bg-white/90 px-4 py-2 text-sm font-bold text-teal-800">Chart.js Placeholder</p>
        </div>
    </div>
</section>
<div class="mt-6">
    <?php
    table_placeholder(
        ['Musim', 'Biaya', 'Pendapatan', 'Profit', 'Status'],
        [
            ['Jagung Manis 2026', 'Rp 8.700.000', 'Rp 12.000.000', 'Rp 3.300.000', 'Untung'],
            ['Cabai 2026', 'Rp 8.200.000', 'Rp 15.300.000', 'Rp 7.100.000', 'Untung'],
        ]
    );
    ?>
</div>
