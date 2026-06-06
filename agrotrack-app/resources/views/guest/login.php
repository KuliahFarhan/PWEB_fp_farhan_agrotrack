<section class="grid min-h-[calc(100vh-160px)] bg-white lg:grid-cols-[0.9fr_1.1fr]">
    <div class="flex items-center bg-teal-950 px-6 py-12 text-white lg:px-16">
        <div class="w-full max-w-md">
            <p class="text-sm font-bold uppercase tracking-[0.24em] text-yellow-200">Login AgroTrack</p>
            <h1 class="mt-4 text-3xl font-black">Masuk ke dashboard petani atau admin.</h1>
            <p class="mt-4 text-sm leading-6 text-slate-200">Form ini masih statis. Validasi akun, session, dan redirect role akan dibuat pada task backend.</p>
            <?php alert_toast('UI login siap. Autentikasi belum diimplementasikan.', 'info'); ?>
            <form class="mt-6 grid gap-4">
                <label class="grid gap-2">
                    <span class="text-sm font-semibold text-white">Alamat Email</span>
                    <input type="email" name="email" placeholder="admin@agrotrack.test" class="rounded-md border border-white/20 bg-white px-4 py-3 text-sm text-slate-900 outline-none transition focus:border-yellow-200 focus:ring-4 focus:ring-yellow-100/30">
                </label>
                <label class="grid gap-2">
                    <span class="text-sm font-semibold text-white">Kata Sandi</span>
                    <input type="password" name="password" placeholder="password" class="rounded-md border border-white/20 bg-white px-4 py-3 text-sm text-slate-900 outline-none transition focus:border-yellow-200 focus:ring-4 focus:ring-yellow-100/30">
                </label>
                <div class="flex items-center justify-between text-sm">
                    <label class="flex items-center gap-2 text-slate-200"><input type="checkbox" class="rounded"> Remember me</label>
                    <a href="<?= e(url_for('forgot-password')); ?>" class="font-semibold text-yellow-200">Lupa sandi?</a>
                </div>
                <a href="<?= e(url_for('petani-dashboard')); ?>" class="rounded-md bg-blue-600 px-5 py-3 text-center font-bold text-white hover:bg-blue-700">Masuk Demo Petani</a>
                <a href="<?= e(url_for('admin-dashboard')); ?>" class="rounded-md border border-white/20 px-5 py-3 text-center font-bold text-white hover:bg-white/10">Masuk Demo Admin</a>
            </form>
            <p class="mt-6 text-sm text-slate-200">Belum punya akun? <a href="<?= e(url_for('register')); ?>" class="font-bold text-yellow-200">Daftar petani</a></p>
        </div>
    </div>
    <div class="hidden bg-cover bg-center lg:block" style="background-image: linear-gradient(rgba(4,47,46,.25), rgba(4,47,46,.25)), url('<?= e(asset_path('images/auth-illustration.png')); ?>');"></div>
</section>
