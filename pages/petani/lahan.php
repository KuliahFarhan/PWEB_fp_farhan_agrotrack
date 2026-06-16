<?php
declare(strict_types=1);
require_once __DIR__ . '/../../app/core/bootstrap.php';
require_once __DIR__ . '/../../app/core/layout.php';
require_once __DIR__ . '/../../app/core/queries.php';
$user = require_login('petani');
$userId = (int) $user['id'];
$tanaman = active_tanaman();
$editing = null;
$error = null;

if (isset($_GET['edit'])) {
    $stmt = db()->prepare('SELECT * FROM lahan WHERE id = ? AND user_id = ?');
    $stmt->execute([(int) $_GET['edit'], $userId]);
    $editing = $stmt->fetch() ?: null;
}

if (request_method() === 'POST') {
    try {
        verify_csrf();
        $action = $_POST['action'] ?? 'save';
        $id = (int) ($_POST['id'] ?? 0);
        if ($action === 'delete') {
            db()->prepare('DELETE FROM lahan WHERE id = ? AND user_id = ?')->execute([$id, $userId]);
            flash('success', 'Lahan berhasil dihapus.');
            redirect_to('lahan.php');
        }

        $nama = post_string('nama_lahan', 120);
        $kode = post_string('kode_lahan', 50);
        $tanamanId = post_int('tanaman_id');
        $lokasi = post_string('lokasi', 190);
        $status = in_array($_POST['status'] ?? 'aktif', ['persiapan','aktif','menjelang_panen','inspeksi','selesai'], true) ? $_POST['status'] : 'aktif';
        $catatan = post_string('catatan', 1000);
        if ($nama === '') {
            throw new RuntimeException('Nama lahan wajib diisi.');
        }
        $stmt = db()->prepare('SELECT nama, kategori FROM tanaman WHERE id = ? AND status = "aktif"');
        $stmt->execute([$tanamanId]);
        $crop = $stmt->fetch();
        if (!$crop) throw new RuntimeException('Tanaman tidak valid.');

        if ($id > 0) {
            $stmt = db()->prepare('UPDATE lahan SET nama_lahan=?, kode_lahan=?, tanaman_id=?, komoditas=?, lokasi=?, status=?, catatan=? WHERE id=? AND user_id=?');
            $stmt->execute([$nama, $kode, $tanamanId, $crop['nama'], $lokasi, $status, $catatan, $id, $userId]);
            flash('success', 'Lahan berhasil diperbarui.');
        } else {
            $stmt = db()->prepare('INSERT INTO lahan (user_id, nama_lahan, kode_lahan, luas, tanaman_id, komoditas, lokasi, status, catatan) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)');
            $stmt->execute([$userId, $nama, $kode, 0, $tanamanId, $crop['nama'], $lokasi, $status, $catatan]);
            flash('success', 'Lahan berhasil ditambahkan.');
        }
        redirect_to('lahan.php');
    } catch (Throwable $exception) {
        $error = $exception->getMessage();
    }
}
$rows = user_lahan($userId);
?>
<!doctype html>
<html lang="id">
  <head><?php render_head('AgroTrack - Lahan'); ?></head>
  <body data-portal="petani" data-active="lahan" data-base="../../">
    <?php render_sidebar($user, 'lahan'); ?>
    <main class="app-main">
      <div class="topbar"><div><h1 class="page-title">Data Lahan</h1><p class="page-kicker">Lahan yang tampil hanya milik akun petani yang sedang login. Tambahkan lahan dulu, lalu gambar polygon di Peta Lahan.</p></div></div>
      <?php render_flash(); if ($error): ?><div class="alert alert-danger"><?= e($error) ?></div><?php endif; ?>
      <?php render_page_help('Fungsi halaman ini', ['Buat nama lahan atau blok sawah terlebih dahulu.', 'Pilih tanaman utama dan status lahan.', 'Setelah tersimpan, klik Gambar Polygon agar luas lahan dihitung dari peta.'], 'Luas tidak diisi manual karena AgroTrack memakai hasil perhitungan polygon.', 'peta-lahan.php', 'Buka Peta Lahan'); ?>
      <section class="row g-3">
        <div class="col-xl-4">
          <div class="panel h-100">
            <h2 class="section-title"><?= $editing ? 'Edit Lahan' : 'Tambah Lahan' ?></h2>
            <p class="text-secondary small mb-3">Luas lahan dihitung otomatis dari polygon di Peta Lahan.</p>
            <form method="post" class="vstack gap-3">
              <input type="hidden" name="csrf_token" value="<?= e(csrf_token()) ?>" /><input type="hidden" name="id" value="<?= e($editing['id'] ?? 0) ?>" />
              <div><label class="form-label fw-semibold">Nama Lahan</label><input class="form-control" name="nama_lahan" value="<?= e($editing['nama_lahan'] ?? '') ?>" required /></div>
              <div><label class="form-label fw-semibold">Kode Lahan</label><input class="form-control" name="kode_lahan" value="<?= e($editing['kode_lahan'] ?? '') ?>" /></div>
              <div><label class="form-label fw-semibold">Tanaman</label><select class="form-select" name="tanaman_id" required><?php foreach ($tanaman as $t): ?><option value="<?= e($t['id']) ?>" <?= option_selected($editing['tanaman_id'] ?? '', $t['id']) ?>><?= e($t['nama']) ?> - <?= e($t['masa_panen_hari']) ?> hari</option><?php endforeach; ?></select></div>
              <div><label class="form-label fw-semibold">Lokasi</label><input class="form-control" name="lokasi" value="<?= e($editing['lokasi'] ?? '') ?>" /></div>
              <div><label class="form-label fw-semibold">Status</label><select class="form-select" name="status"><?php foreach (['persiapan','aktif','menjelang_panen','inspeksi','selesai'] as $s): ?><option value="<?= e($s) ?>" <?= option_selected($editing['status'] ?? 'aktif', $s) ?>><?= e(status_label($s)) ?></option><?php endforeach; ?></select></div>
              <div><label class="form-label fw-semibold">Catatan</label><textarea class="form-control" name="catatan" rows="3"><?= e($editing['catatan'] ?? '') ?></textarea></div>
              <button class="btn btn-primary">Simpan Lahan</button>
            </form>
          </div>
        </div>
        <div class="col-xl-8">
          <div class="panel">
            <div class="d-flex justify-content-between mb-3"><h2 class="section-title mb-0">Daftar Lahan</h2><a class="btn btn-sm btn-outline-primary" href="peta-lahan.php">Buka Peta</a></div>
            <div class="table-responsive">
              <table class="table align-middle">
                <thead><tr><th>Lahan</th><th>Tanaman</th><th>Luas Polygon</th><th>Status</th><th>Aksi</th></tr></thead>
                <tbody>
                  <?php foreach ($rows as $row): ?>
                    <tr>
                      <td><strong><?= e($row['nama_lahan']) ?></strong><br><small class="text-secondary"><?= e($row['lokasi']) ?></small></td>
                      <td><?= e($row['tanaman_nama'] ?: $row['komoditas']) ?></td>
                      <td><?= $row['luas_lahan'] ? number_id($row['luas_lahan'] / 10000, 4) . ' Ha' : '<span class="text-secondary">Belum digambar</span>' ?></td>
                      <td><span class="status-dot"><?= e(status_label($row['status'])) ?></span></td>
                      <td class="text-nowrap"><a class="btn btn-sm btn-outline-primary" href="?edit=<?= e($row['id']) ?>">Edit</a>
                        <a class="btn btn-sm btn-outline-success" href="peta-lahan.php?lahan_id=<?= e($row['id']) ?>">Gambar Polygon</a>
                        <form method="post" class="d-inline" onsubmit="return confirm('Hapus lahan ini?')"><input type="hidden" name="csrf_token" value="<?= e(csrf_token()) ?>" /><input type="hidden" name="action" value="delete" /><input type="hidden" name="id" value="<?= e($row['id']) ?>" /><button class="btn btn-sm btn-outline-danger">Hapus</button></form>
                      </td>
                    </tr>
                  <?php endforeach; ?>
                  <?php if (!$rows): ?><tr><td colspan="5" class="text-center text-secondary py-4">Belum ada lahan. Tambahkan lahan pertama untuk mulai memakai AgroTrack.</td></tr><?php endif; ?>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </section>
    </main>
    <script src="../../assets/js/app.js"></script>
  </body>
</html>
