<section id="home" class="relative overflow-hidden bg-teal-950 text-white">
    <img src="<?= e(asset_path('images/hero-corn-field.png')); ?>" alt="Ladang jagung" class="absolute inset-0 h-full w-full object-cover opacity-35">
    <div class="relative mx-auto grid min-h-[620px] max-w-7xl items-center gap-10 px-5 py-20 lg:grid-cols-[1.1fr_0.9fr] lg:px-8">
        <div>
            <p class="text-sm font-bold uppercase tracking-[0.28em] text-yellow-200">Monitoring Pertanian Berbasis Peta</p>
            <h1 class="mt-5 max-w-3xl text-4xl font-black leading-tight md:text-6xl">Kelola lahan, musim tanam, biaya, dan hasil panen dalam satu sistem.</h1>
            <p class="mt-6 max-w-2xl text-lg leading-8 text-slate-100">AgroTrack membantu petani mencatat aktivitas pertanian secara digital, menentukan lokasi lahan melalui peta, dan melihat analisis profit dengan lebih rapi.</p>
            <div class="mt-8 flex flex-wrap gap-3">
                <a href="<?= e(url_for('register')); ?>" class="rounded-md bg-yellow-200 px-6 py-3 font-bold text-teal-950 hover:bg-yellow-100">Mulai sebagai Petani</a>
                <a href="<?= e(url_for('petani-dashboard')); ?>" class="rounded-md border border-white/40 px-6 py-3 font-bold text-white hover:bg-white/10">Lihat Demo UI</a>
            </div>
        </div>
        <div class="agro-card hidden rounded-lg bg-white/95 p-5 text-slate-900 lg:block">
            <img src="<?= e(asset_path('images/digital-farming-preview.png')); ?>" alt="Preview digital farming" class="h-72 w-full rounded-md object-cover">
            <div class="mt-5 grid grid-cols-3 gap-3 text-center">
                <div class="rounded-md bg-teal-50 p-3">
                    <p class="text-2xl font-black text-teal-950">12</p>
                    <p class="text-xs text-slate-500">Lahan</p>
                </div>
                <div class="rounded-md bg-yellow-50 p-3">
                    <p class="text-2xl font-black text-yellow-900">8</p>
                    <p class="text-xs text-slate-500">Musim Aktif</p>
                </div>
                <div class="rounded-md bg-blue-50 p-3">
                    <p class="text-2xl font-black text-blue-900">23%</p>
                    <p class="text-xs text-slate-500">Profit</p>
                </div>
            </div>
        </div>
    </div>
</section>

<section id="fitur" class="mx-auto max-w-7xl px-5 py-16 lg:px-8">
    <div class="max-w-2xl">
        <p class="text-sm font-bold uppercase tracking-[0.24em] text-teal-700">Fitur Utama</p>
        <h2 class="mt-3 text-3xl font-black text-slate-950">Dibangun sesuai alur kerja petani dan admin.</h2>
    </div>
    <div class="mt-8 grid gap-5 md:grid-cols-2 lg:grid-cols-3">
        <?php
        $features = [
            ['Peta Lahan', 'Marker dan polygon area lahan sebagai placeholder Leaflet.'],
            ['Musim Tanam', 'Tanggal tanam, estimasi panen, status, dan progress pertumbuhan.'],
            ['Biaya Produksi', 'Catatan biaya bibit, pupuk, pestisida, tenaga kerja, dan lainnya.'],
            ['Hasil Panen', 'Input hasil panen, harga jual, pendapatan, dan profit.'],
            ['Analisis Profit', 'Placeholder Chart.js untuk biaya, pendapatan, dan keuntungan.'],
            ['Laporan', 'Tabel laporan petani dan global admin untuk skenario demo.'],
        ];
        foreach ($features as [$featureTitle, $featureText]) :
        ?>
            <article class="agro-card rounded-lg p-6">
                <h3 class="text-lg font-bold text-teal-950"><?= e($featureTitle); ?></h3>
                <p class="mt-3 text-sm leading-6 text-slate-500"><?= e($featureText); ?></p>
            </article>
        <?php endforeach; ?>
    </div>
</section>

<section id="tentang" class="bg-white">
    <div class="mx-auto grid max-w-7xl gap-10 px-5 py-16 lg:grid-cols-2 lg:px-8">
        <div>
            <p class="text-sm font-bold uppercase tracking-[0.24em] text-teal-700">Tentang AgroTrack</p>
            <h2 class="mt-3 text-3xl font-black text-slate-950">Dari catatan manual menuju monitoring pertanian yang terukur.</h2>
            <p class="mt-5 leading-8 text-slate-600">Skeleton ini menyiapkan tampilan awal untuk proses login, dashboard, manajemen lahan, peta, musim tanam, biaya, panen, analisis, dan laporan. Data di halaman ini masih dummy dan akan diganti dari database pada task berikutnya.</p>
        </div>
        <img src="<?= e(asset_path('images/farm-landscape.jpg')); ?>" alt="Lanskap pertanian" class="h-80 w-full rounded-lg object-cover shadow-lg">
    </div>
</section>

<section id="preview" class="mx-auto max-w-7xl px-5 py-16 lg:px-8">
    <div class="grid gap-8 lg:grid-cols-[1fr_0.8fr]">
        <div class="agro-map-placeholder grid min-h-[360px] place-items-center rounded-lg border border-teal-100">
            <div class="rounded-lg bg-white/90 p-5 text-center shadow">
                <p class="text-sm font-bold uppercase tracking-[0.2em] text-teal-700">Leaflet Placeholder</p>
                <p class="mt-2 text-slate-600">Peta marker dan polygon akan diintegrasikan setelah struktur backend siap.</p>
            </div>
        </div>
        <div class="grid gap-4">
            <?php stat_card('Total Lahan Demo', '12', 'Dummy untuk preview dashboard', 'teal'); ?>
            <?php stat_card('Musim Aktif', '8', 'Akan dihitung dari database', 'yellow'); ?>
            <?php stat_card('Profit Terkini', 'Rp 18,4 jt', 'Placeholder analisis Chart.js', 'blue'); ?>
        </div>
    </div>
</section>
