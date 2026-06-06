<div class="mb-5 flex flex-wrap items-center justify-between gap-3">
    <div>
        <h2 class="text-xl font-black text-slate-950">Laporan Petani</h2>
        <p class="text-sm text-slate-500">Filter dan export masih placeholder. Tabel memakai dummy data.</p>
    </div>
    <div class="flex gap-2">
        <button class="rounded-md border border-slate-200 px-4 py-2 text-sm font-bold text-slate-600">Filter</button>
        <button class="rounded-md bg-teal-700 px-4 py-2 text-sm font-bold text-white">Print</button>
    </div>
</div>
<?php
table_placeholder(
    ['Jenis', 'Periode', 'Total Biaya', 'Pendapatan', 'Profit'],
    [
        ['Musim Tanam', 'Jun - Agu 2026', 'Rp 8.700.000', 'Rp 12.000.000', 'Rp 3.300.000'],
        ['Hasil Panen', 'Mei - Agu 2026', 'Rp 8.200.000', 'Rp 15.300.000', 'Rp 7.100.000'],
        ['Biaya Produksi', 'Jun 2026', 'Rp 4.700.000', '-', '-'],
    ]
);
?>
