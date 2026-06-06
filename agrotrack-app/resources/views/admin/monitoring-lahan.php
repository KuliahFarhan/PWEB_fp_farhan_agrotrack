<section class="grid gap-6 xl:grid-cols-[1fr_0.9fr]">
    <div>
        <div class="mb-5">
            <h2 class="text-xl font-black text-slate-950">Monitoring Lahan</h2>
            <p class="text-sm text-slate-500">Admin melihat seluruh lahan melalui tabel dan peta. Tidak ada edit transaksi petani di skeleton ini.</p>
        </div>
        <?php
        table_placeholder(
            ['Petani', 'Nama Lahan', 'Luas', 'Tanaman Aktif', 'Status'],
            [
                ['Siti Petani', 'Kebun Utara', '1.8 ha', 'Jagung Manis', 'Aktif'],
                ['Budi Petani', 'Lahan Barat', '2.1 ha', 'Jagung Pipil', 'Aktif'],
                ['Ayu Petani', 'Kebun Timur', '1.2 ha', 'Cabai', 'Nonaktif'],
            ]
        );
        ?>
    </div>
    <div class="agro-card overflow-hidden rounded-lg">
        <div class="border-b border-slate-200 p-5">
            <h3 class="font-black text-slate-950">Peta Global Lahan</h3>
            <p class="text-sm text-slate-500">Placeholder Leaflet untuk seluruh marker/polygon.</p>
        </div>
        <div class="agro-map-placeholder grid min-h-[420px] place-items-center">
            <p class="rounded-md bg-white/90 px-4 py-2 text-sm font-bold text-teal-800">Admin Leaflet Placeholder</p>
        </div>
    </div>
</section>
