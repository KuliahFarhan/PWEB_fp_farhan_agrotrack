<?php
declare(strict_types=1);
require_once __DIR__ . '/../../app/core/bootstrap.php';
require_once __DIR__ . '/../../app/core/layout.php';

$user = require_login('admin');
$error = null;
$profilePhotos = array_map(
    static fn(string $path) => 'assets/image/profil/' . basename($path),
    glob(__DIR__ . '/../../assets/image/profil/*.{jpg,jpeg,png,webp}', GLOB_BRACE) ?: []
);
sort($profilePhotos);

if (request_method() === 'POST') {
    try {
        verify_csrf();
        $photo = post_string('profile_photo', 255);
        if (!in_array($photo, $profilePhotos, true)) {
            $photo = 'assets/image/profil/foto_profil_6.jpg';
        }
        $stmt = db()->prepare('UPDATE users SET name=?, phone=?, address=?, division=?, bio=?, profile_photo=? WHERE id=? AND role="admin"');
        $stmt->execute([
            post_string('name', 120),
            post_string('phone', 30),
            post_string('address', 190),
            post_string('division', 120),
            post_string('bio', 1000),
            $photo,
            (int) $user['id'],
        ]);
        flash('success', 'Profil admin berhasil diperbarui.');
        redirect_to('profil.php');
    } catch (Throwable $e) {
        $error = $e->getMessage();
    }
}
$user = current_user();
?>
<!doctype html>
<html lang="id">
<head><?php render_head('AgroTrack - Profil Admin'); ?></head>
<body data-portal="admin" data-active="profil" data-base="../../">
<?php render_sidebar($user, 'profil'); ?>
<main class="app-main">
  <div class="topbar"><div><h1 class="page-title">Profil Admin</h1><p class="page-kicker">Email tidak dapat diedit.</p></div></div>
  <?php render_flash(); if($error): ?><div class="alert alert-danger"><?= e($error) ?></div><?php endif; ?>
  <?php render_page_help('Mengatur profil admin', ['Pilih foto profil dari aset yang tersedia.', 'Perbarui nama, nomor handphone, divisi, alamat kantor, dan bio.', 'Klik Update Profil untuk menyimpan perubahan.'], 'Email dikunci karena dipakai sebagai identitas login.', 'dashboard.php', 'Kembali Dashboard'); ?>
  <section class="panel profile-panel">
    <form method="post" class="vstack gap-3">
      <input type="hidden" name="csrf_token" value="<?= e(csrf_token()) ?>" />
      <div class="profile-photo-editor"><img src="../../<?= e($user['profile_photo'] ?: 'assets/image/profil/foto_profil_6.jpg') ?>" alt="Foto admin" /></div>
      <div>
        <label class="form-label fw-semibold">Pilih Foto Profil</label>
        <div class="profile-photo-grid">
          <?php foreach ($profilePhotos as $photo): ?>
            <label class="profile-photo-option <?= ($user['profile_photo'] ?: 'assets/image/profil/foto_profil_6.jpg') === $photo ? 'active' : '' ?>">
              <input type="radio" name="profile_photo" value="<?= e($photo) ?>" <?= option_selected($user['profile_photo'] ?: 'assets/image/profil/foto_profil_6.jpg', $photo) ?> />
              <img src="../../<?= e($photo) ?>" alt="Pilihan foto profil" />
            </label>
          <?php endforeach; ?>
        </div>
      </div>
      <div class="row g-3">
        <div class="col-md-6"><label class="form-label fw-semibold">Nama</label><input class="form-control" name="name" value="<?= e($user['name']) ?>" /></div>
        <div class="col-md-6"><label class="form-label fw-semibold">Nomor Handphone</label><input class="form-control" name="phone" value="<?= e($user['phone']) ?>" /></div>
        <div class="col-md-6"><label class="form-label fw-semibold">Email</label><input class="form-control" value="<?= e($user['email']) ?>" readonly /></div>
        <div class="col-md-6"><label class="form-label fw-semibold">Divisi</label><input class="form-control" name="division" value="<?= e($user['division']) ?>" /></div>
        <div class="col-12"><label class="form-label fw-semibold">Alamat/Kantor</label><input class="form-control" name="address" value="<?= e($user['address']) ?>" /></div>
        <div class="col-12"><label class="form-label fw-semibold">Bio</label><textarea class="form-control" name="bio" rows="3"><?= e($user['bio']) ?></textarea></div>
      </div>
      <button class="btn btn-primary align-self-start">Update Profil</button>
    </form>
  </section>
</main>
<script src="../../assets/js/app.js"></script>
</body>
</html>
