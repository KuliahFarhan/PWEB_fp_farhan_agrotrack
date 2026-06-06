<header class="sticky top-0 z-30 border-b border-white/20 bg-teal-950/95 text-white shadow-sm backdrop-blur">
    <nav class="mx-auto flex max-w-7xl items-center justify-between px-5 py-4 lg:px-8">
        <a href="<?= e(url_for('landing')); ?>" class="flex items-center gap-3">
            <img src="<?= e(asset_path('logo/logo-agrotrack.png')); ?>" alt="AgroTrack" class="h-10 w-10 rounded-full bg-white object-contain p-1">
            <span class="text-lg font-black tracking-wide">AgroTrack</span>
        </a>
        <div class="hidden items-center gap-7 text-sm font-semibold md:flex">
            <a href="<?= e(url_for('landing')); ?>#home" class="hover:text-yellow-200">Home</a>
            <a href="<?= e(url_for('landing')); ?>#fitur" class="hover:text-yellow-200">Fitur</a>
            <a href="<?= e(url_for('landing')); ?>#tentang" class="hover:text-yellow-200">Tentang</a>
            <a href="<?= e(url_for('landing')); ?>#preview" class="hover:text-yellow-200">Peta/Preview</a>
        </div>
        <div class="flex items-center gap-2">
            <a href="<?= e(url_for('login')); ?>" class="rounded-md px-4 py-2 text-sm font-semibold text-white hover:bg-white/10">Login</a>
            <a href="<?= e(url_for('register')); ?>" class="rounded-md bg-yellow-200 px-4 py-2 text-sm font-bold text-teal-950 hover:bg-yellow-100">Register</a>
        </div>
    </nav>
</header>
