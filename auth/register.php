<?php
declare(strict_types=1);

require_once __DIR__ . '/../app/core/bootstrap.php';

$error = null;
if (request_method() === 'POST') {
    try {
        verify_csrf();
        $name = post_string('name', 120);
        $phone = post_string('phone', 30);
        $email = strtolower(post_string('email', 190));
        $password = (string) ($_POST['password'] ?? '');

        if ($name === '' || $email === '' || strlen($password) < 8) {
            throw new RuntimeException('Nama, email, dan password minimal 8 karakter wajib diisi.');
        }

        $stmt = db()->prepare('INSERT INTO users (name, email, phone, role, status, password_hash, profile_photo) VALUES (?, ?, ?, "petani", "aktif", ?, ?)');
        $stmt->execute([$name, $email, $phone, password_hash($password, PASSWORD_DEFAULT), 'assets/image/profil/farmer-profile.jpg']);
        flash('success', 'Akun petani berhasil dibuat. Silakan login.');
        session_write_close();
        redirect_to('login.php');
    } catch (PDOException $exception) {
        $error = $exception->getCode() === '23000' ? 'Email sudah terdaftar.' : 'Register gagal.';
    } catch (Throwable $exception) {
        $error = $exception->getMessage();
    }
}
?>
<!doctype html>
<html lang="id">
  <head>
    <?php require_once __DIR__ . '/../app/core/layout.php'; render_head('AgroTrack - Daftar', '../'); ?>
  </head>
  <body class="auth-body">
    <main class="auth-split auth-split-register">
      <section class="auth-visual"><img src="../assets/image/tanaman/corn-hero.png" alt="Petani di lahan jagung" loading="eager" decoding="async" /></section>
      <section class="auth-panel">
        <a class="auth-brand" href="../index.html"><img src="../assets/image/logo/logo_agrotrack.png" alt="Logo AgroTrack" /><span>AgroTrack</span></a>
        <div class="auth-copy"><h1>Register Petani</h1><p>Pendaftaran publik khusus untuk akun petani. Akun admin disiapkan oleh sistem.</p></div>
        <?php if ($error): ?><div class="alert alert-danger"><?= e($error) ?></div><?php endif; ?>
        <form method="post" class="vstack gap-3">
          <input type="hidden" name="csrf_token" value="<?= e(csrf_token()) ?>" />
          <div><label class="form-label" for="name">Nama Lengkap</label><input class="form-control" id="name" name="name" value="<?= e($_POST['name'] ?? '') ?>" required /></div>
          <div><label class="form-label" for="phone">Nomor Handphone</label><input class="form-control" id="phone" name="phone" value="<?= e($_POST['phone'] ?? '') ?>" /></div>
          <div><label class="form-label" for="email">Alamat Email</label><input class="form-control" id="email" name="email" type="email" value="<?= e($_POST['email'] ?? '') ?>" required /></div>
          <div><label class="form-label" for="password">Kata Sandi</label><input class="form-control" id="password" name="password" type="password" required minlength="8" /></div>
          <button class="btn auth-submit w-100" type="submit">Daftar</button>
        </form>
        <div class="auth-link-group">
          <a class="auth-outline-link" href="login.php">Sudah punya akun? Login disini</a>
          <a class="auth-muted-link" href="../index.html"><span class="material-symbols-outlined">arrow_back</span><span>Kembali ke Landing Page</span></a>
        </div>
      </section>
    </main>
    <script src="../assets/js/app.js"></script>
  </body>
</html>
