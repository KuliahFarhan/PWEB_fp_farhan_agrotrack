<?php
declare(strict_types=1);
require_once __DIR__ . '/../../app/core/bootstrap.php';
require_once __DIR__ . '/../../app/core/layout.php';
require_once __DIR__ . '/../../app/core/queries.php';
$user = require_login('petani');
$summary = petani_summary((int) $user['id']);
$lahan = user_lahan((int) $user['id'], 5);
$musim = user_musim((int) $user['id'], 5);
?>
<!doctype html>
<html lang="id">
  <head><?php render_head('AgroTrack - Dashboard Petani'); ?></head>
  <body data-portal="petani" data-active="dashboard" data-base="../../">
    <?php render_sidebar($user, 'dashboard'); ?>
    <main class="app-main">
      <div class="topbar"><div><h1 class="page-title">Dashboard Petani</h1><p class="page-kicker">Ringkasan operasional hari ini, <span data-today></span>.</p></div></div>
      <?php render_flash(); ?>
      <?php render_page_help('Mulai dari mana?', ['Tambahkan data lahan jika belum ada.', 'Gambar polygon agar luas lahan dihitung otomatis.', 'Buat musim tanam, lalu catat biaya dan hasil panen.'], 'Dashboard ini merangkum kondisi terbaru dari semua data yang kamu input.', 'lahan.php', 'Mulai Kelola Lahan'); ?>
      <section class="row g-3 mb-3">
        <div class="col-md-6 col-xl-3"><div class="stat-card"><div class="stat-label">Total Lahan</div><div class="stat-value"><?= number_id($summary['total_luas_ha'] ?? 0, 2) ?> Ha</div><div class="stat-note"><?= e($summary['total_lahan'] ?? 0) ?> blok</div></div></div>
        <div class="col-md-6 col-xl-3"><div class="stat-card"><div class="stat-label">Musim Berjalan</div><div class="stat-value"><?= e($summary['musim_aktif'] ?? 0) ?></div><div class="stat-note">Musim aktif</div></div></div>
        <div class="col-md-6 col-xl-3"><div class="stat-card"><div class="stat-label">Total Biaya</div><div class="stat-value"><?= money_id($summary['total_biaya'] ?? 0) ?></div><div class="stat-note">Semua musim</div></div></div>
        <div class="col-md-6 col-xl-3"><div class="stat-card"><div class="stat-label">Profit</div><div class="stat-value"><?= money_id($summary['total_profit'] ?? 0) ?></div><div class="stat-note">Pendapatan - biaya</div></div></div>
      </section>
      <section class="row g-3">
        <div class="col-xl-7"><div class="panel"><div class="d-flex justify-content-between mb-3"><h2 class="section-title mb-0">Lahan Prioritas</h2><a class="btn btn-sm btn-outline-primary" href="lahan.php">Kelola</a></div><div class="table-responsive"><table class="table align-middle"><thead><tr><th>Lahan</th><th>Komoditas</th><th>Luas</th><th>Status</th></tr></thead><tbody>
          <?php foreach ($lahan as $row): ?><tr><td><?= e($row['nama_lahan']) ?></td><td><?= e($row['tanaman_nama'] ?: $row['komoditas']) ?></td><td><?= $row['luas_lahan'] ? number_id($row['luas_lahan'] / 10000, 4) . ' Ha' : '<span class="text-secondary">Belum digambar</span>' ?></td><td><span class="status-dot"><?= e(status_label($row['status'])) ?></span></td></tr><?php endforeach; ?>
          <?php if (!$lahan): ?><tr><td colspan="4" class="text-center text-secondary py-4">Belum ada lahan.</td></tr><?php endif; ?>
        </tbody></table></div></div></div>
        <div class="col-xl-5"><div class="panel"><h2 class="section-title">Musim Terbaru</h2><div class="vstack gap-3">
          <?php foreach ($musim as $row): $progress = calculate_progress($row['tanggal_tanam'], (int) ($row['masa_panen_hari'] ?: 100)); ?><div><strong><?= e($row['kode_musim']) ?> - <?= e($row['tanaman_nama']) ?></strong><br><span class="text-secondary small"><?= e($row['nama_lahan']) ?>, progress <?= e($progress) ?>%</span><div class="progress mt-1"><div class="progress-bar" style="width: <?= e($progress) ?>%"></div></div></div><?php endforeach; ?>
          <?php if (!$musim): ?><p class="text-secondary mb-0">Belum ada musim tanam.</p><?php endif; ?>
        </div></div></div>
        <div class="col-12"><div class="admin-panel image-panel"><img src="../../assets/image/tanaman/corn-hero.png" alt="Lahan jagung AgroTrack" loading="lazy" decoding="async" /><div class="image-panel-content"><h2 class="section-title text-white">Pantau kondisi tanaman lebih cepat</h2><p class="mb-3 col-lg-7">Data lahan, biaya, panen, dan polygon kini tersambung ke database.</p><a class="btn btn-light align-self-start" href="peta-lahan.php">Buka Peta Lahan</a></div></div></div>
      </section>
    </main>
    <script src="../../assets/js/app.js"></script>
  </body>
</html>
