<footer class="bg-teal-950 text-white">
    <div class="mx-auto grid max-w-7xl gap-8 px-5 py-10 md:grid-cols-[1.4fr_1fr_1fr] lg:px-8">
        <div>
            <div class="flex items-center gap-3">
                <img src="<?= e(asset_path('logo/logo-agrotrack.png')); ?>" alt="AgroTrack" class="h-11 w-11 rounded-full bg-white object-contain p-1">
                <span class="text-xl font-black">AgroTrack</span>
            </div>
            <p class="mt-4 max-w-md text-sm leading-6 text-slate-200">Platform monitoring pertanian berbasis peta untuk membantu petani mencatat lahan, musim tanam, biaya, hasil panen, dan profit secara terstruktur.</p>
        </div>
        <div>
            <h2 class="font-bold">Navigasi</h2>
            <div class="mt-4 grid gap-2 text-sm text-slate-200">
                <a href="<?= e(url_for('landing')); ?>#fitur" class="hover:text-yellow-200">Fitur utama</a>
                <a href="<?= e(url_for('landing')); ?>#preview" class="hover:text-yellow-200">Preview peta</a>
                <a href="<?= e(url_for('login')); ?>" class="hover:text-yellow-200">Login</a>
            </div>
        </div>
        <div>
            <h2 class="font-bold">Demo Area</h2>
            <div class="mt-4 grid gap-2 text-sm text-slate-200">
                <a href="<?= e(url_for('petani-dashboard')); ?>" class="hover:text-yellow-200">Dashboard Petani</a>
                <a href="<?= e(url_for('admin-dashboard')); ?>" class="hover:text-yellow-200">Dashboard Admin</a>
            </div>
        </div>
    </div>
</footer>
