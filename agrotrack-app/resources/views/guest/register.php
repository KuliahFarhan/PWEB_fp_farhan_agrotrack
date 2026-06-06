<section class="mx-auto grid max-w-7xl gap-10 px-5 py-14 lg:grid-cols-[0.9fr_1.1fr] lg:px-8">
    <div class="rounded-lg bg-teal-950 p-8 text-white">
        <p class="text-sm font-bold uppercase tracking-[0.24em] text-yellow-200">Register Petani</p>
        <h1 class="mt-4 text-3xl font-black">Buat akun petani untuk mulai mencatat lahan.</h1>
        <p class="mt-4 leading-7 text-slate-200">Role akun baru nantinya otomatis menjadi petani. Untuk sekarang, form ini masih skeleton UI tanpa penyimpanan database.</p>
        <img src="<?= e(asset_path('images/corn-hero.png')); ?>" alt="Jagung" class="mt-8 h-52 w-full rounded-lg object-cover">
    </div>
    <form class="agro-card grid gap-4 rounded-lg p-6">
        <?php alert_toast('Placeholder validasi: email unik, password minimal 8 karakter, dan konfirmasi cocok.', 'warning'); ?>
        <?php form_field('Nama Lengkap', 'nama', 'text', 'Masukkan nama lengkap'); ?>
        <?php form_field('Alamat Email', 'email', 'email', 'petani@agrotrack.test'); ?>
        <?php form_field('Nomor HP', 'nomor_hp', 'tel', '08xxxxxxxxxx'); ?>
        <?php form_field('Password', 'password', 'password', 'Minimal 8 karakter'); ?>
        <?php form_field('Konfirmasi Password', 'password_confirmation', 'password', 'Ulangi password'); ?>
        <a href="<?= e(url_for('login')); ?>" class="rounded-md bg-teal-700 px-5 py-3 text-center font-bold text-white hover:bg-teal-800">Daftar Akun Demo</a>
    </form>
</section>
