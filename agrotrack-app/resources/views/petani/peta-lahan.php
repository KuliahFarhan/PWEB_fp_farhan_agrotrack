<section class="grid gap-6 xl:grid-cols-[1fr_360px]">
    <div class="agro-card overflow-hidden rounded-lg">
        <div class="border-b border-slate-200 p-5">
            <h2 class="text-lg font-black text-slate-950">Peta Lahan</h2>
            <p class="mt-1 text-sm text-slate-500">Placeholder Leaflet untuk marker dan polygon. Belum ada penyimpanan koordinat.</p>
        </div>
        <div class="agro-map-placeholder grid min-h-[560px] place-items-center">
            <div class="rounded-lg bg-white/90 p-5 text-center shadow">
                <p class="text-sm font-bold uppercase tracking-[0.2em] text-teal-700">Leaflet Map Placeholder</p>
                <p class="mt-2 max-w-sm text-sm text-slate-600">Nanti area ini berisi OpenStreetMap, marker lokasi lahan, draw tool polygon, reset polygon, dan popup detail lahan.</p>
            </div>
        </div>
    </div>
    <aside class="grid gap-5">
        <section class="agro-card rounded-lg p-5">
            <h3 class="font-black text-slate-950">Panel Detail Lahan</h3>
            <dl class="mt-4 grid gap-3 text-sm">
                <div class="flex justify-between gap-4"><dt class="text-slate-500">Nama</dt><dd class="font-semibold">Kebun Utara</dd></div>
                <div class="flex justify-between gap-4"><dt class="text-slate-500">Latitude</dt><dd class="font-semibold">-7.520045</dd></div>
                <div class="flex justify-between gap-4"><dt class="text-slate-500">Longitude</dt><dd class="font-semibold">112.469272</dd></div>
                <div class="flex justify-between gap-4"><dt class="text-slate-500">Polygon</dt><dd class="font-semibold">Belum disimpan</dd></div>
            </dl>
        </section>
        <section class="agro-card rounded-lg p-5">
            <h3 class="font-black text-slate-950">Aksi Peta</h3>
            <div class="mt-4 grid gap-2">
                <button class="rounded-md bg-teal-700 px-4 py-2 text-sm font-bold text-white">Simpan Lokasi</button>
                <button class="rounded-md bg-blue-600 px-4 py-2 text-sm font-bold text-white">Simpan Polygon</button>
                <button class="rounded-md border border-slate-200 px-4 py-2 text-sm font-bold text-slate-600">Reset Polygon</button>
            </div>
        </section>
    </aside>
</section>
