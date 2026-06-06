<?php
$adminMenu = [
    'admin-dashboard' => 'Dashboard',
    'admin-users' => 'Data Pengguna',
    'admin-tanaman' => 'Data Tanaman',
    'admin-monitoring-lahan' => 'Monitoring Lahan',
    'admin-laporan' => 'Laporan',
    'admin-profil' => 'Profil Admin',
];
?>
<aside class="bg-teal-950 text-white lg:sticky lg:top-0 lg:h-screen lg:w-72 lg:shrink-0">
    <div class="flex items-center gap-3 border-b border-white/10 px-5 py-5">
        <img src="<?= e(asset_path('logo/logo-agrotrack.png')); ?>" alt="AgroTrack" class="h-11 w-11 rounded-full bg-white object-contain p-1">
        <div>
            <p class="text-lg font-black">AgroTrack</p>
            <p class="text-xs text-teal-100">Panel Admin</p>
        </div>
    </div>
    <nav class="grid gap-1 px-4 py-5">
        <?php foreach ($adminMenu as $key => $label) : ?>
            <a href="<?= e(url_for($key)); ?>" class="agro-sidebar-link <?= $activePage === $key ? 'is-active' : ''; ?>">
                <span class="grid h-8 w-8 place-items-center rounded-md bg-white/10 text-xs font-bold"><?= e(strtoupper(substr($label, 0, 1))); ?></span>
                <span><?= e($label); ?></span>
            </a>
        <?php endforeach; ?>
        <a href="<?= e(url_for('login')); ?>" class="agro-sidebar-link mt-4 border border-white/10">
            <span class="grid h-8 w-8 place-items-center rounded-md bg-white/10 text-xs font-bold">L</span>
            <span>Logout</span>
        </a>
    </nav>
</aside>
