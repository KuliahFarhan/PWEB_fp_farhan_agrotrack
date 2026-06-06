<?php

declare(strict_types=1);

/**
 * Static UI route map.
 *
 * This is intentionally a simple native PHP array for the UI skeleton.
 * Future tasks can replace this with a dispatcher that applies auth,
 * role checks, controllers, and database-backed data.
 */

return [
    'landing' => [
        'title' => 'Landing Page',
        'layout' => 'guest',
        'view' => 'guest/landing',
    ],
    'login' => [
        'title' => 'Login',
        'layout' => 'guest',
        'view' => 'guest/login',
    ],
    'register' => [
        'title' => 'Register Petani',
        'layout' => 'guest',
        'view' => 'guest/register',
    ],
    'forgot-password' => [
        'title' => 'Forgot Password',
        'layout' => 'guest',
        'view' => 'guest/forgot-password',
    ],
    'petani-dashboard' => [
        'title' => 'Dashboard Petani',
        'layout' => 'petani',
        'view' => 'petani/dashboard',
    ],
    'petani-lahan' => [
        'title' => 'Lahan',
        'layout' => 'petani',
        'view' => 'petani/lahan',
    ],
    'petani-peta-lahan' => [
        'title' => 'Peta Lahan',
        'layout' => 'petani',
        'view' => 'petani/peta-lahan',
    ],
    'petani-musim-tanam' => [
        'title' => 'Musim Tanam',
        'layout' => 'petani',
        'view' => 'petani/musim-tanam',
    ],
    'petani-biaya-produksi' => [
        'title' => 'Biaya Produksi',
        'layout' => 'petani',
        'view' => 'petani/biaya-produksi',
    ],
    'petani-hasil-panen' => [
        'title' => 'Hasil Panen',
        'layout' => 'petani',
        'view' => 'petani/hasil-panen',
    ],
    'petani-analisis' => [
        'title' => 'Analisis',
        'layout' => 'petani',
        'view' => 'petani/analisis',
    ],
    'petani-laporan' => [
        'title' => 'Laporan',
        'layout' => 'petani',
        'view' => 'petani/laporan',
    ],
    'petani-profil' => [
        'title' => 'Profil',
        'layout' => 'petani',
        'view' => 'petani/profil',
    ],
    'admin-dashboard' => [
        'title' => 'Dashboard Admin',
        'layout' => 'admin',
        'view' => 'admin/dashboard',
    ],
    'admin-users' => [
        'title' => 'Data Pengguna',
        'layout' => 'admin',
        'view' => 'admin/users',
    ],
    'admin-tanaman' => [
        'title' => 'Data Tanaman',
        'layout' => 'admin',
        'view' => 'admin/tanaman',
    ],
    'admin-monitoring-lahan' => [
        'title' => 'Monitoring Lahan',
        'layout' => 'admin',
        'view' => 'admin/monitoring-lahan',
    ],
    'admin-laporan' => [
        'title' => 'Laporan Admin',
        'layout' => 'admin',
        'view' => 'admin/laporan',
    ],
    'admin-profil' => [
        'title' => 'Profil Admin',
        'layout' => 'admin',
        'view' => 'admin/profil',
    ],
    'not-found' => [
        'title' => 'Halaman Tidak Ditemukan',
        'layout' => 'guest',
        'view' => 'guest/not-found',
    ],
];
