<?php
declare(strict_types=1);

function render_sidebar(array $user, string $active, string $base = '../../'): void
{
    $isAdmin = $user['role'] === 'admin';
    $nav = $isAdmin ? [
        ['dashboard', 'Dashboard', 'dashboard.php', 'admin-dashboard'],
        ['groups', 'Data Pengguna', 'data-pengguna.php', 'pengguna'],
        ['psychiatry', 'Data Tanaman', 'tanaman.php', 'tanaman'],
        ['inventory_2', 'Katalog Kebutuhan', 'katalog-kebutuhan.php', 'katalog'],
        ['monitoring', 'Monitoring Lahan', 'monitoring-lahan.php', 'monitoring'],
        ['summarize', 'Laporan', 'laporan.php', 'laporan'],
        ['manage_accounts', 'Profil Admin', 'profil.php', 'profil'],
    ] : [
        ['dashboard', 'Dashboard', 'dashboard.php', 'dashboard'],
        ['agriculture', 'Lahan', 'lahan.php', 'lahan'],
        ['map', 'Peta Lahan', 'peta-lahan.php', 'peta'],
        ['calendar_today', 'Musim Tanam', 'musim-tanam.php', 'musim'],
        ['inventory_2', 'Katalog Operasional', 'katalog-operasional.php', 'katalog'],
        ['payments', 'Biaya Produksi', 'biaya-produksi.php', 'biaya'],
        ['receipt_long', 'Hasil Panen', 'hasil-panen.php', 'panen'],
        ['analytics', 'Analisis', 'analisis.php', 'analisis'],
        ['account_circle', 'Profil', 'profil.php', 'profil'],
    ];
    $portalLabel = $isAdmin ? 'Administrator' : 'Farmer Portal';
    $photo = $user['profile_photo'] ?: ($isAdmin ? 'assets/image/profil/foto_profil_6.jpg' : 'assets/image/profil/farmer-profile.jpg');
    ?>
    <aside class="app-sidebar" aria-label="Navigasi <?= e($portalLabel) ?>">
      <a class="d-flex align-items-center gap-2" href="<?= e($isAdmin ? 'dashboard.php' : 'dashboard.php') ?>">
        <img class="brand-logo" src="<?= e($base) ?>assets/image/logo/logo_agrotrack.png" alt="Logo AgroTrack" />
        <span><strong class="d-block fs-5">AgroTrack</strong><small class="text-white-50"><?= e($portalLabel) ?></small></span>
      </a>
      <nav class="sidebar-nav">
        <?php foreach ($nav as [$icon, $label, $href, $key]): ?>
          <a class="sidebar-link <?= $active === $key ? 'active' : '' ?>" href="<?= e($href) ?>">
            <span class="material-symbols-outlined"><?= e($icon) ?></span><span><?= e($label) ?></span>
          </a>
        <?php endforeach; ?>
        <a class="sidebar-link" href="<?= e($base) ?>index.html">
          <span class="material-symbols-outlined">home</span><span>Landing Page</span>
        </a>
      </nav>
      <div class="sidebar-footer">
        <div class="d-flex align-items-center gap-2 mb-3">
          <img class="profile-avatar" src="<?= e($base . $photo) ?>" alt="Foto profil <?= e($user['name']) ?>" />
          <span><strong class="d-block"><?= e($user['name']) ?></strong><small class="text-white-50"><?= e($isAdmin ? 'Super Admin' : 'Petani') ?></small></span>
        </div>
        <a class="sidebar-link" href="<?= e($base) ?>auth/logout.php" data-logout-link>
          <span class="material-symbols-outlined">logout</span><span>Keluar</span>
        </a>
      </div>
    </aside>
    <button class="sidebar-backdrop border-0" type="button" aria-label="Tutup menu"></button>
    <?php
}

function render_head(string $title, string $base = '../../', array $extraCss = []): void
{
    $bootstrapFile = dirname(__DIR__, 2) . '/assets/Bootstrap/css/bootstrap.min.css';
    $bootstrapVersion = is_file($bootstrapFile) ? (string) filemtime($bootstrapFile) : '1';
    $cssFile = dirname(__DIR__, 2) . '/assets/css/styles.css';
    $cssVersion = is_file($cssFile) ? (string) filemtime($cssFile) : '1';
    ?>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title><?= e($title) ?></title>
    <link href="<?= e($base) ?>assets/Bootstrap/css/bootstrap.min.css?v=<?= e($bootstrapVersion) ?>" rel="stylesheet" />
    <?php foreach ($extraCss as $href): ?><link href="<?= e($href) ?>" rel="stylesheet" /><?php endforeach; ?>
    <link href="<?= e($base) ?>assets/css/styles.css?v=<?= e($cssVersion) ?>" rel="stylesheet" />
    <?php
}

function render_flash(): void
{
    $success = flash('success');
    $error = flash('error');
    if ($success): ?><div class="alert alert-success"><?= e($success) ?></div><?php endif;
    if ($error): ?><div class="alert alert-danger"><?= e($error) ?></div><?php endif;
}

function render_page_help(string $title, array $steps, ?string $note = null, ?string $actionHref = null, ?string $actionLabel = null): void
{
    ?>
    <section class="guide-panel" aria-label="Panduan halaman">
      <div class="guide-heading">
        <span class="material-symbols-outlined">tips_and_updates</span>
        <div>
          <strong><?= e($title) ?></strong>
          <?php if ($note): ?><p><?= e($note) ?></p><?php endif; ?>
        </div>
      </div>
      <ol class="guide-steps">
        <?php foreach ($steps as $step): ?><li><?= e($step) ?></li><?php endforeach; ?>
      </ol>
      <?php if ($actionHref && $actionLabel): ?>
        <a class="btn btn-sm btn-primary guide-action" href="<?= e($actionHref) ?>"><?= e($actionLabel) ?></a>
      <?php endif; ?>
    </section>
    <?php
}
