<?php
declare(strict_types=1);
require_once __DIR__ . '/../../app/core/bootstrap.php';
require_once __DIR__ . '/../../app/core/layout.php';
require_once __DIR__ . '/../../app/core/queries.php';
$user = require_login('petani');
$userId = (int) $user['id'];
$error = null;
$lahan = user_lahan($userId);
$tanaman = active_tanaman();

if (request_method() === 'POST') {
    try {
        verify_csrf();
        $lahanId = post_int('lahan_id');
        $tanamanId = post_int('tanaman_id');
        $tanggal = post_string('tanggal_tanam', 20);
        $kode = post_string('kode_musim', 30) ?: 'MT-' . date('Ymd-His');
        $catatan = post_string('catatan', 1000);
        $stmt = db()->prepare('SELECT id FROM lahan WHERE id = ? AND user_id = ?');
        $stmt->execute([$lahanId, $userId]);
        if (!$stmt->fetch()) throw new RuntimeException('Lahan tidak valid.');
        $stmt = db()->prepare('SELECT masa_panen_hari FROM tanaman WHERE id = ? AND status = "aktif"');
        $stmt->execute([$tanamanId]);
        $crop = $stmt->fetch();
        if (!$crop) throw new RuntimeException('Tanaman tidak valid.');
        $estimasi = (new DateTimeImmutable($tanggal))->modify('+' . (int) $crop['masa_panen_hari'] . ' days')->format('Y-m-d');
        $stmt = db()->prepare('INSERT INTO musim_tanam (user_id, lahan_id, tanaman_id, kode_musim, nama_musim, tanggal_tanam, estimasi_panen, fase, progress, status, catatan) VALUES (?, ?, ?, ?, ?, ?, ?, "persiapan", 0, "aktif", ?)');
        $stmt->execute([$userId, $lahanId, $tanamanId, $kode, $kode, $tanggal, $estimasi, $catatan]);
        flash('success', 'Musim tanam berhasil dibuat.');
        redirect_to('musim-tanam.php');
    } catch (Throwable $exception) { $error = $exception->getMessage(); }
}
$rows = user_musim($userId);
?>
<!doctype html><html lang="id"><head><?php render_head('AgroTrack - Musim Tanam'); ?></head>
<body data-portal="petani" data-active="musim" data-base="../../"><?php render_sidebar($user, 'musim'); ?><main class="app-main">
<div class="topbar"><div><h1 class="page-title">Musim Tanam</h1><p class="page-kicker">Pilih lahan, tanaman, dan tanggal tanam. Estimasi panen otomatis dari masa panen master tanaman.</p></div></div>
<?php render_flash(); if ($error): ?><div class="alert alert-danger"><?= e($error) ?></div><?php endif; ?>
<section class="row g-3 mb-3"><div class="col-xl-4"><div class="panel h-100"><h2 class="section-title">Tambah Musim</h2><form method="post" class="vstack gap-3">
<input type="hidden" name="csrf_token" value="<?= e(csrf_token()) ?>" />
<div><label class="form-label fw-semibold">Kode Musim</label><input class="form-control" name="kode_musim" value="MT-<?= e(date('Ym')) ?>" /></div>
<div><label class="form-label fw-semibold">Lahan</label><select class="form-select" name="lahan_id" required><?php foreach ($lahan as $row): ?><option value="<?= e($row['id']) ?>"><?= e($row['nama_lahan']) ?></option><?php endforeach; ?></select></div>
<div><label class="form-label fw-semibold">Tanaman</label><select class="form-select" name="tanaman_id" required><?php foreach ($tanaman as $row): ?><option value="<?= e($row['id']) ?>"><?= e($row['nama']) ?> - <?= e($row['masa_panen_hari']) ?> hari</option><?php endforeach; ?></select></div>
<div><label class="form-label fw-semibold">Tanggal Tanam</label><input class="form-control" name="tanggal_tanam" type="date" value="<?= e(date('Y-m-d')) ?>" required /></div>
<div><label class="form-label fw-semibold">Catatan</label><textarea class="form-control" name="catatan" rows="3"></textarea></div><button class="btn btn-primary">Simpan Musim</button></form></div></div>
<div class="col-xl-8"><div class="panel h-100"><h2 class="section-title">Kalender Tanam</h2><div class="calendar-widget"><div class="calendar-head"><button class="icon-button" type="button"><span class="material-symbols-outlined">chevron_left</span></button><strong><?= e(date('F Y')) ?></strong><button class="icon-button" type="button"><span class="material-symbols-outlined">chevron_right</span></button></div><div class="calendar-week"><span>Min</span><span>Sen</span><span>Sel</span><span>Rab</span><span>Kam</span><span>Jum</span><span>Sab</span></div><div class="calendar-grid"><?php for ($i=1;$i<=35;$i++): ?><button class="<?= $i === (int) date('j') ? 'selected' : '' ?>" type="button"><?= e((($i - 1) % 31) + 1) ?></button><?php endfor; ?></div></div></div></div></section>
<section class="panel"><h2 class="section-title">Daftar Musim</h2><div class="table-responsive"><table class="table align-middle"><thead><tr><th>Musim</th><th>Lahan</th><th>Tanaman</th><th>Tanam</th><th>Estimasi Panen</th><th>Progress</th><th>Biaya</th><th>Pendapatan</th></tr></thead><tbody>
<?php foreach ($rows as $row): $progress = calculate_progress($row['tanggal_tanam'], (int) ($row['masa_panen_hari'] ?: 100)); ?><tr><td><?= e($row['kode_musim']) ?></td><td><?= e($row['nama_lahan']) ?></td><td><?= e($row['tanaman_nama']) ?></td><td><?= e($row['tanggal_tanam']) ?></td><td><?= e($row['estimasi_panen']) ?></td><td><span class="status-dot"><?= e(phase_from_progress($progress)) ?></span><div class="progress mt-1"><div class="progress-bar" style="width: <?= e($progress) ?>%"></div></div></td><td><?= money_id($row['total_biaya']) ?></td><td><?= money_id($row['total_pendapatan']) ?></td></tr><?php endforeach; ?>
<?php if (!$rows): ?><tr><td colspan="8" class="text-center text-secondary py-4">Belum ada musim tanam.</td></tr><?php endif; ?></tbody></table></div></section>
</main><script src="../../assets/js/app.js"></script></body></html>
