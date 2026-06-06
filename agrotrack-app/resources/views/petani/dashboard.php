<?php alert_toast('Dashboard ini memakai dummy data. Nanti card dan tabel diisi dari database milik petani yang login.', 'info'); ?>
<section class="grid gap-5 md:grid-cols-2 xl:grid-cols-4">
    <?php stat_card('Total Lahan', '4', 'Data petani aktif', 'teal'); ?>
    <?php stat_card('Musim Aktif', '3', 'Periode tanam berjalan', 'yellow'); ?>
    <?php stat_card('Total Biaya', 'Rp 8,7 jt', 'Akumulasi musim aktif', 'blue'); ?>
    <?php stat_card('Profit Estimasi', 'Rp 14,2 jt', 'Dummy analisis', 'slate'); ?>
</section>

<section class="mt-6 grid gap-6 xl:grid-cols-[1fr_0.8fr]">
    <div>
        <div class="mb-4 flex items-center justify-between">
            <h2 class="text-lg font-black text-slate-950">Musim Tanam Terbaru</h2>
            <a href="<?= e(url_for('petani-musim-tanam')); ?>" class="text-sm font-bold text-teal-700">Lihat semua</a>
        </div>
        <?php
        // Future backend: replace rows with musim_tanam joined with lahan and tanaman for current petani.
        table_placeholder(
            ['Lahan', 'Tanaman', 'Tanggal Tanam', 'Estimasi Panen', 'Status'],
            [
                ['Kebun Utara', 'Jagung Manis', '01 Jun 2026', '30 Agu 2026', 'Pertumbuhan'],
                ['Lahan Barat', 'Jagung Pipil', '12 Jun 2026', '10 Sep 2026', 'Persemaian'],
                ['Kebun Timur', 'Cabai', '20 Mei 2026', '18 Agu 2026', 'Siap Panen'],
            ]
        );
        ?>
    </div>
    <div class="agro-card rounded-lg p-5">
        <h2 class="text-lg font-black text-slate-950">Progress Pertumbuhan</h2>
        <div class="mt-5 grid gap-4">
            <?php foreach ([65, 42, 90] as $index => $progress) : ?>
                <div>
                    <div class="mb-2 flex justify-between text-sm">
                        <span class="font-semibold text-slate-700">Musim #<?= $index + 1; ?></span>
                        <span class="text-slate-500"><?= $progress; ?>%</span>
                    </div>
                    <div class="h-3 rounded-full bg-slate-100">
                        <div class="h-3 rounded-full bg-teal-600" style="width: <?= $progress; ?>%"></div>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </div>
</section>
