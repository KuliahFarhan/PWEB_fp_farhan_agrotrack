<section class="grid gap-6 lg:grid-cols-[320px_1fr]">
    <aside class="agro-card rounded-lg p-5 text-center">
        <img src="<?= e(asset_path('logo/logo-agrotrack.png')); ?>" alt="Profil admin" class="mx-auto h-32 w-32 rounded-full bg-teal-950 object-contain p-5">
        <h2 class="mt-4 text-xl font-black text-slate-950">Admin AgroTrack</h2>
        <p class="text-sm text-slate-500">admin@agrotrack.test</p>
        <p class="mt-3 rounded-full bg-teal-50 px-3 py-1 text-sm font-bold text-teal-800">Role: Admin</p>
    </aside>
    <form class="agro-card rounded-lg p-5">
        <h2 class="text-lg font-black text-slate-950">Edit Profil Admin Placeholder</h2>
        <div class="mt-4 grid gap-4 md:grid-cols-2">
            <?php form_field('Nama Lengkap', 'nama', 'text', 'Admin AgroTrack'); ?>
            <?php form_field('Email', 'email', 'email', 'admin@agrotrack.test'); ?>
            <?php form_field('Nomor HP', 'nomor_hp', 'tel', '08xxxxxxxxxx'); ?>
            <?php form_field('Status', 'status', 'text', 'aktif'); ?>
            <?php form_field('Password Lama', 'password_lama', 'password', ''); ?>
            <?php form_field('Password Baru', 'password_baru', 'password', ''); ?>
        </div>
        <button class="mt-5 rounded-md bg-teal-700 px-5 py-3 font-bold text-white">Simpan Profil Demo</button>
    </form>
</section>
