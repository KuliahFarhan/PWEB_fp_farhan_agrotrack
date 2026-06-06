<?php alert_toast('Dashboard admin ini statis. Statistik global akan diambil dari database pada task backend.', 'info'); ?>
<section class="grid gap-5 md:grid-cols-2 xl:grid-cols-4">
    <?php stat_card('Total Petani', '128', 'Dummy pengguna aktif', 'teal'); ?>
    <?php stat_card('Total Lahan', '342', 'Dummy lahan terdaftar', 'yellow'); ?>
    <?php stat_card('Musim Aktif', '87', 'Dummy musim berjalan', 'blue'); ?>
    <?php stat_card('Total Panen', '42 ton', 'Dummy panen global', 'slate'); ?>
</section>
<section class="mt-6 grid gap-6 xl:grid-cols-[0.9fr_1.1fr]">
    <div class="agro-card rounded-lg p-5">
        <h2 class="text-lg font-black text-slate-950">Grafik Statistik Sistem</h2>
        <div class="agro-chart-placeholder mt-4 grid h-72 place-items-center rounded-md border border-slate-200">
            <p class="rounded-md bg-white/90 px-4 py-2 text-sm font-bold text-teal-800">Chart.js Placeholder</p>
        </div>
    </div>
    <div>
        <h2 class="mb-4 text-lg font-black text-slate-950">Aktivitas Terbaru</h2>
        <?php
        table_placeholder(
            ['Waktu', 'Aktivitas', 'User', 'Status'],
            [
                ['Hari ini', 'Tambah lahan', 'Siti Petani', 'Sukses'],
                ['Hari ini', 'Input panen', 'Budi Petani', 'Sukses'],
                ['Kemarin', 'Update tanaman', 'Admin', 'Sukses'],
            ]
        );
        ?>
    </div>
</section>
