<section class="mx-auto flex min-h-[calc(100vh-180px)] max-w-3xl items-center px-5 py-14">
    <form class="agro-card w-full rounded-lg p-6 md:p-8">
        <p class="text-sm font-bold uppercase tracking-[0.24em] text-teal-700">Forgot Password</p>
        <h1 class="mt-3 text-3xl font-black text-slate-950">Reset password sederhana.</h1>
        <p class="mt-3 text-sm leading-6 text-slate-500">Skeleton UI untuk reset password. Pengecekan email dan hashing password akan dibuat setelah backend siap.</p>
        <div class="mt-6 grid gap-4">
            <?php form_field('Alamat Email', 'email', 'email', 'email yang terdaftar'); ?>
            <?php form_field('Password Baru', 'password', 'password', 'Minimal 8 karakter'); ?>
            <?php form_field('Konfirmasi Password Baru', 'password_confirmation', 'password', 'Ulangi password baru'); ?>
            <a href="<?= e(url_for('login')); ?>" class="rounded-md bg-teal-700 px-5 py-3 text-center font-bold text-white hover:bg-teal-800">Simpan Password Demo</a>
        </div>
    </form>
</section>
