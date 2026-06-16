<?php
declare(strict_types=1);
require_once __DIR__ . '/../../app/core/bootstrap.php';
require_once __DIR__ . '/../../app/core/layout.php';
$user = require_login('admin');

$editing = null;
$error = null;
if (isset($_GET['edit'])) {
    $stmt = db()->prepare('SELECT * FROM tanaman WHERE id = ?');
    $stmt->execute([(int) $_GET['edit']]);
    $editing = $stmt->fetch() ?: null;
}

if (request_method() === 'POST') {
    try {
        verify_csrf();
        $action = $_POST['action'] ?? 'save';
        if ($action === 'delete') {
            $id = post_int('id');
            db()->prepare('UPDATE tanaman SET status = "nonaktif" WHERE id = ?')->execute([$id]);
            flash('success', 'Tanaman berhasil dinonaktifkan.');
            redirect_to('tanaman.php');
        }

        $id = (int) ($_POST['id'] ?? 0);
        $nama = post_string('nama', 120);
        $kategori = post_string('kategori', 80);
        $masaPanen = post_int('masa_panen_hari');
        $deskripsi = post_string('deskripsi', 1000);
        $gambar = post_string('gambar_url', 255);
        $status = in_array($_POST['status'] ?? 'aktif', ['aktif', 'nonaktif'], true) ? $_POST['status'] : 'aktif';
        if ($nama === '' || $masaPanen <= 0) {
            throw new RuntimeException('Nama tanaman wajib diisi dan masa panen harus lebih dari 0.');
        }
        $slug = strtolower(trim(preg_replace('/[^a-z0-9]+/i', '-', $nama), '-'));

        if ($id > 0) {
            $stmt = db()->prepare('UPDATE tanaman SET nama=?, slug=?, kategori=?, masa_panen_hari=?, deskripsi=?, gambar_url=?, status=? WHERE id=?');
            $stmt->execute([$nama, $slug, $kategori, $masaPanen, $deskripsi, $gambar, $status, $id]);
            flash('success', 'Tanaman berhasil diperbarui.');
        } else {
            $stmt = db()->prepare('INSERT INTO tanaman (nama, slug, kategori, masa_panen_hari, deskripsi, gambar_url, status) VALUES (?, ?, ?, ?, ?, ?, ?)');
            $stmt->execute([$nama, $slug, $kategori, $masaPanen, $deskripsi, $gambar, $status]);
            flash('success', 'Tanaman berhasil ditambahkan.');
        }
        redirect_to('tanaman.php');
    } catch (PDOException $exception) {
        $error = $exception->getCode() === '23000' ? 'Nama tanaman sudah ada.' : 'Data tanaman gagal disimpan.';
    } catch (Throwable $exception) {
        $error = $exception->getMessage();
    }
}

$rows = db()->query('SELECT * FROM tanaman ORDER BY status ASC, nama ASC')->fetchAll();
?>
<!doctype html>
<html lang="id">
  <head><?php render_head('AgroTrack - Data Tanaman'); ?></head>
  <body data-portal="admin" data-active="tanaman" data-base="../../">
    <?php render_sidebar($user, 'tanaman'); ?>
    <main class="app-main">
      <div class="topbar"><div><h1 class="page-title">Data Tanaman</h1><p class="page-kicker">CRUD master tanaman untuk lahan dan musim tanam.</p></div></div>
      <?php render_flash(); if ($error): ?><div class="alert alert-danger"><?= e($error) ?></div><?php endif; ?>
      <?php render_page_help('Fungsi master tanaman', ['Tanaman aktif akan muncul di form Lahan dan Musim Tanam petani.', 'Masa panen dipakai untuk menghitung estimasi tanggal panen.', 'Nonaktifkan tanaman jika tidak ingin dipilih lagi tanpa menghapus riwayat lama.'], 'Pastikan nama, kategori, gambar, dan masa panen sesuai referensi katalog.', 'katalog-kebutuhan.php', 'Cek Katalog'); ?>
      <section class="row g-3">
        <div class="col-xl-4">
          <div class="panel h-100">
            <h2 class="section-title"><?= $editing ? 'Edit Tanaman' : 'Tambah Tanaman' ?></h2>
            <form method="post" class="vstack gap-3">
              <input type="hidden" name="csrf_token" value="<?= e(csrf_token()) ?>" />
              <input type="hidden" name="id" value="<?= e($editing['id'] ?? 0) ?>" />
              <div><label class="form-label fw-semibold">Nama Tanaman</label><input class="form-control" name="nama" value="<?= e($editing['nama'] ?? '') ?>" required /></div>
              <div><label class="form-label fw-semibold">Kategori</label><input class="form-control" name="kategori" value="<?= e($editing['kategori'] ?? '') ?>" placeholder="Padi, Jagung, Kedelai" /></div>
              <div><label class="form-label fw-semibold">Masa Panen Hari</label><input class="form-control" name="masa_panen_hari" type="number" min="1" value="<?= e($editing['masa_panen_hari'] ?? 100) ?>" required /></div>
              <div><label class="form-label fw-semibold">Gambar URL/Path</label><input class="form-control" name="gambar_url" value="<?= e($editing['gambar_url'] ?? 'assets/image/gambar_tanaman/gambar_padi_1.jpg') ?>" /></div>
              <div><label class="form-label fw-semibold">Status</label><select class="form-select" name="status"><option value="aktif" <?= option_selected($editing['status'] ?? '', 'aktif') ?>>Aktif</option><option value="nonaktif" <?= option_selected($editing['status'] ?? '', 'nonaktif') ?>>Nonaktif</option></select></div>
              <div><label class="form-label fw-semibold">Deskripsi</label><textarea class="form-control" name="deskripsi" rows="3"><?= e($editing['deskripsi'] ?? '') ?></textarea></div>
              <button class="btn btn-primary" type="submit">Simpan Tanaman</button>
            </form>
          </div>
        </div>
        <div class="col-xl-8">
          <div class="panel">
            <div class="d-flex justify-content-between mb-3"><h2 class="section-title mb-0">Daftar Tanaman</h2><input class="form-control w-auto" data-table-search="#tanamanTable" placeholder="Cari tanaman..." /></div>
            <div class="table-responsive">
              <table class="table admin-table" id="tanamanTable">
                <thead><tr><th>Tanaman</th><th>Kategori</th><th>Masa Panen</th><th>Status</th><th>Aksi</th></tr></thead>
                <tbody>
                <?php foreach ($rows as $row): ?>
                  <tr>
                    <td><div class="d-flex align-items-center gap-2"><img class="user-avatar" src="../../<?= e($row['gambar_url'] ?: 'assets/image/gambar_tanaman/gambar_padi_1.jpg') ?>" alt="<?= e($row['nama']) ?>" /><strong><?= e($row['nama']) ?></strong></div></td>
                    <td><?= e($row['kategori']) ?></td><td><?= e($row['masa_panen_hari']) ?> hari</td><td><span class="status-dot <?= $row['status'] === 'aktif' ? '' : 'warning' ?>"><?= e(status_label($row['status'])) ?></span></td>
                    <td class="text-nowrap"><a class="btn btn-sm btn-outline-primary" href="?edit=<?= e($row['id']) ?>">Edit</a>
                      <form class="d-inline" method="post" onsubmit="return confirm('Nonaktifkan tanaman ini?')"><input type="hidden" name="csrf_token" value="<?= e(csrf_token()) ?>" /><input type="hidden" name="action" value="delete" /><input type="hidden" name="id" value="<?= e($row['id']) ?>" /><button class="btn btn-sm btn-outline-danger">Hapus</button></form>
                    </td>
                  </tr>
                <?php endforeach; ?>
                <?php if (!$rows): ?><tr><td colspan="5" class="text-center text-secondary py-4">Belum ada data tanaman.</td></tr><?php endif; ?>
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
