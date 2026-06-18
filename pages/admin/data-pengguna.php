<?php
declare(strict_types=1);
require_once __DIR__ . '/../../app/core/bootstrap.php';
require_once __DIR__ . '/../../app/core/layout.php';

$user = require_login('admin');
$error = null;
$editing = null;

if (isset($_GET['edit'])) {
    $stmt = db()->prepare('SELECT id, name, email, role, status, profile_photo FROM users WHERE id = ? LIMIT 1');
    $stmt->execute([(int) $_GET['edit']]);
    $editing = $stmt->fetch() ?: null;
}

if (request_method() === 'POST') {
    try {
        verify_csrf();
        $id = post_int('id');
        $name = post_string('name', 120);
        $status = in_array($_POST['status'] ?? 'aktif', ['aktif', 'validasi', 'nonaktif'], true) ? $_POST['status'] : 'aktif';
        $password = (string) ($_POST['password'] ?? '');
        if ($name === '') {
            throw new RuntimeException('Nama wajib diisi.');
        }
        if ($password !== '' && strlen($password) < 8) {
            throw new RuntimeException('Password baru minimal 8 karakter.');
        }

        if ($password !== '') {
            $stmt = db()->prepare('UPDATE users SET name = ?, status = ?, password_hash = ? WHERE id = ?');
            $stmt->execute([$name, $status, password_hash($password, PASSWORD_DEFAULT), $id]);
        } else {
            $stmt = db()->prepare('UPDATE users SET name = ?, status = ? WHERE id = ?');
            $stmt->execute([$name, $status, $id]);
        }
        flash('success', 'Data pengguna berhasil diperbarui.');
        redirect_to('data-pengguna.php');
    } catch (Throwable $e) {
        $error = $e->getMessage();
    }
}

$rows = db()->query(
    'SELECT u.id, u.name, u.email, u.role, u.status, u.profile_photo,
            (SELECT COUNT(*) FROM lahan l WHERE l.user_id = u.id AND l.deleted_at IS NULL) AS total_lahan
     FROM users u
     ORDER BY u.created_at DESC
     LIMIT 100'
)->fetchAll();
?>
<!doctype html>
<html lang="id">
<head><?php render_head('AgroTrack - Data Pengguna'); ?></head>
<body data-portal="admin" data-active="pengguna" data-base="../../">
<?php render_sidebar($user, 'pengguna'); ?>
<main class="app-main">
  <div class="topbar"><div><h1 class="page-title">Data Pengguna</h1><p class="page-kicker">Kelola nama, status, dan password akun pengguna AgroTrack.</p></div></div>
  <?php render_flash(); if ($error): ?><div class="alert alert-danger"><?= e($error) ?></div><?php endif; ?>
  <?php render_page_help('Mengedit akun pengguna', ['Klik Edit pada baris pengguna.', 'Ubah nama atau status akun sesuai kebutuhan.', 'Isi password baru hanya jika ingin mengganti sandi pengguna.'], 'Email dan role tidak diedit dari sini agar identitas login tetap stabil.', 'monitoring-lahan.php', 'Cek Monitoring Lahan'); ?>

  <section class="row g-3">
    <div class="col-xl-4">
      <div class="panel h-100">
        <h2 class="section-title"><?= $editing ? 'Edit Pengguna' : 'Pilih Pengguna' ?></h2>
        <?php if ($editing): ?>
          <form method="post" class="vstack gap-3">
            <input type="hidden" name="csrf_token" value="<?= e(csrf_token()) ?>" />
            <input type="hidden" name="id" value="<?= e($editing['id']) ?>" />
            <div class="d-flex align-items-center gap-2">
              <img class="user-avatar" src="../../<?= e($editing['profile_photo'] ?: 'assets/image/profil/farmer-profile.jpg') ?>" alt="<?= e($editing['name']) ?>" />
              <div><strong><?= e($editing['email']) ?></strong><br><small class="text-secondary"><?= e($editing['role']) ?></small></div>
            </div>
            <div><label class="form-label fw-semibold">Nama</label><input class="form-control" name="name" value="<?= e($editing['name']) ?>" required /></div>
            <div><label class="form-label fw-semibold">Status</label><select class="form-select" name="status"><?php foreach (['aktif','validasi','nonaktif'] as $s): ?><option value="<?= e($s) ?>" <?= option_selected($editing['status'], $s) ?>><?= e(status_label($s)) ?></option><?php endforeach; ?></select></div>
            <div><label class="form-label fw-semibold">Password Baru</label><input class="form-control" name="password" type="password" minlength="8" placeholder="Kosongkan jika tidak diganti" /></div>
            <button class="btn btn-primary" type="submit">Simpan Pengguna</button>
            <a class="btn btn-outline-primary" href="data-pengguna.php">Batal</a>
          </form>
        <?php else: ?>
          <p class="text-secondary mb-0">Pilih tombol Edit pada daftar pengguna untuk membuka form perubahan.</p>
        <?php endif; ?>
      </div>
    </div>
    <div class="col-xl-8">
      <section class="panel">
        <div class="d-flex justify-content-between mb-3"><h2 class="section-title mb-0">Daftar Pengguna</h2><input class="form-control w-auto" data-table-search="#userTable" placeholder="Cari pengguna..." /></div>
        <div class="table-responsive"><table class="table admin-table" id="userTable"><thead><tr><th>Nama & Email</th><th>Role</th><th>Status</th><th>Lahan</th><th>Aksi</th></tr></thead><tbody>
          <?php foreach($rows as $r): ?><tr>
            <td><div class="d-flex align-items-center gap-2"><img class="user-avatar" src="../../<?= e($r['profile_photo'] ?: 'assets/image/profil/farmer-profile.jpg') ?>" alt="<?= e($r['name']) ?>" /><span><strong><?= e($r['name']) ?></strong><br><small class="text-secondary"><?= e($r['email']) ?></small></span></div></td>
            <td><span class="role-badge <?= $r['role'] === 'admin' ? 'admin' : '' ?>"><?= e($r['role']) ?></span></td>
            <td><span class="status-dot <?= $r['status'] === 'nonaktif' ? 'danger' : ($r['status'] === 'validasi' ? 'warning' : '') ?>"><?= e(status_label($r['status'])) ?></span></td>
            <td><?= e($r['total_lahan']) ?></td>
            <td><a class="btn btn-sm btn-outline-primary" href="?edit=<?= e($r['id']) ?>">Edit</a></td>
          </tr><?php endforeach; ?>
        </tbody></table></div>
      </section>
    </div>
  </section>
</main>
<script src="../../assets/js/app.js"></script>
</body>
</html>
