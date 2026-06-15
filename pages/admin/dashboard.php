<?php
declare(strict_types=1);
require_once __DIR__ . '/../../app/core/bootstrap.php';
require_once __DIR__ . '/../../app/core/layout.php';
require_once __DIR__ . '/../../app/core/queries.php';
$user = require_login('admin');
$summary = admin_summary();
$users = db()->query('SELECT * FROM users ORDER BY created_at DESC LIMIT 5')->fetchAll();
$lahan = db()->query('SELECT l.*, u.name AS petani FROM lahan l JOIN users u ON u.id = l.user_id ORDER BY l.created_at DESC LIMIT 5')->fetchAll();
?>
<!doctype html>
<html lang="id">
  <head><?php render_head('AgroTrack - Dashboard Admin'); ?></head>
  <body data-portal="admin" data-active="admin-dashboard" data-base="../../">
    <?php render_sidebar($user, 'admin-dashboard'); ?>
    <main class="app-main">
      <div class="admin-topbar d-flex align-items-center justify-content-between gap-3"><div class="admin-search"><span class="material-symbols-outlined">search</span><input class="form-control" placeholder="Cari data, petani, atau lahan..." /></div></div>
      <div class="topbar"><div><h1 class="page-title">Dashboard Administrator</h1><p class="page-kicker">Ringkasan operasional sistem AgroTrack hari ini.</p></div><a class="btn btn-primary" href="laporan.php">Export Data</a></div>
      <?php render_flash(); ?>
      <section class="row g-3 mb-3">
        <div class="col-md-6 col-xl-3"><div class="stat-card admin-stat"><div><div class="stat-label">Total Pengguna</div><div class="stat-value"><?= e($summary['total_users']) ?></div></div></div></div>
        <div class="col-md-6 col-xl-3"><div class="stat-card admin-stat"><div><div class="stat-label">Total Lahan</div><div class="stat-value"><?= number_id($summary['total_luas_ha'], 2) ?> Ha</div></div></div></div>
        <div class="col-md-6 col-xl-3"><div class="stat-card admin-stat"><div><div class="stat-label">Musim Aktif</div><div class="stat-value"><?= e($summary['musim_aktif']) ?></div></div></div></div>
        <div class="col-md-6 col-xl-3"><div class="stat-card admin-stat"><div><div class="stat-label">Total Panen</div><div class="stat-value"><?= number_id(((float) $summary['total_panen_kg']) / 1000, 2) ?> Ton</div></div></div></div>
      </section>
      <section class="row g-3">
        <div class="col-xl-7"><div class="panel admin-panel"><h2 class="section-title">Manajemen Pengguna Terbaru</h2><div class="table-responsive"><table class="table admin-table"><thead><tr><th>Nama</th><th>Role</th><th>Status</th><th>Email</th></tr></thead><tbody><?php foreach ($users as $row): ?><tr><td><?= e($row['name']) ?></td><td><?= e($row['role']) ?></td><td><span class="status-dot"><?= e($row['status']) ?></span></td><td><?= e($row['email']) ?></td></tr><?php endforeach; ?></tbody></table></div></div></div>
        <div class="col-xl-5"><div class="panel admin-panel"><h2 class="section-title">Lahan Terbaru</h2><div class="vstack gap-3 small"><?php foreach ($lahan as $row): ?><div><strong><?= e($row['nama_lahan']) ?></strong><br><span class="text-secondary"><?= e($row['petani']) ?> - <?= e($row['komoditas']) ?></span></div><?php endforeach; ?><?php if (!$lahan): ?><p class="text-secondary">Belum ada lahan.</p><?php endif; ?></div></div></div>
        <div class="col-12"><div class="admin-panel image-panel"><img src="../../assets/image/tanaman/digital-farming-preview.png" alt="Pertanian digital" /><div class="image-panel-content"><h2 class="section-title text-white">Data Tanaman Prioritas</h2><p class="mb-3">Kelola master tanaman agar musim tanam dan estimasi panen lebih akurat.</p><a class="btn btn-light" href="tanaman.php">Kelola Tanaman</a></div></div></div>
      </section>
    </main>
    <script src="../../assets/js/app.js"></script>
  </body>
</html>
