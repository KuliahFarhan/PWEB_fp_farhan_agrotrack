<?php
declare(strict_types=1);

require_once __DIR__ . '/../app/core/bootstrap.php';

start_app_session();
if (current_user()) {
    $user = current_user();
    redirect_to($user['role'] === 'admin' ? '../pages/admin/dashboard.php' : '../pages/petani/dashboard.php');
}

$error = null;
if (request_method() === 'POST') {
    try {
        verify_csrf();
        $email = strtolower(post_string('email', 190));
        $password = (string) ($_POST['password'] ?? '');

        $stmt = db()->prepare('SELECT * FROM users WHERE email = ? AND status = "aktif" LIMIT 1');
        $stmt->execute([$email]);
        $user = $stmt->fetch();

        if (!$user || !password_verify($password, $user['password_hash'])) {
            throw new RuntimeException('Email atau password salah.');
        }

        session_regenerate_id(true);
        $_SESSION['user_id'] = (int) $user['id'];
        $_SESSION['role'] = $user['role'];
        db()->prepare('UPDATE users SET last_login_at = NOW() WHERE id = ?')->execute([(int) $user['id']]);
        redirect_to($user['role'] === 'admin' ? '../pages/admin/dashboard.php' : '../pages/petani/dashboard.php');
    } catch (Throwable $exception) {
        $error = $exception->getMessage();
    }
}
?>
<!doctype html>
<html lang="id">
  <head>
    <?php require_once __DIR__ . '/../app/core/layout.php'; render_head('AgroTrack - Masuk', '../'); ?>
  </head>
  <body class="auth-body">
    <main class="auth-split auth-split-login">
      <section class="auth-panel" aria-label="Form login AgroTrack">
        <a class="auth-brand" href="../index.html"><img src="../assets/image/logo/logo_agrotrack.png" alt="Logo AgroTrack" /><span>AgroTrack</span></a>
        <div class="auth-copy"><h1>Login</h1><p>Masuk sebagai petani atau admin AgroTrack.</p></div>
        <?php if ($error): ?><div class="alert alert-danger"><?= e($error) ?></div><?php endif; ?>
        <form method="post" class="vstack gap-3">
          <input type="hidden" name="csrf_token" value="<?= e(csrf_token()) ?>" />
          <div><label class="form-label" for="email">Alamat Email</label><input class="form-control" id="email" name="email" type="email" value="<?= e($_POST['email'] ?? '') ?>" placeholder="petani@email.com atau admin@agrotrack.com" required /></div>
          <div><label class="form-label" for="password">Kata Sandi</label><input class="form-control" id="password" name="password" type="password" required /></div>
          <button class="btn auth-submit w-100" type="submit">Masuk</button>
        </form>
        <div class="auth-link-group">
          <a class="auth-outline-link" href="register.php">Belum punya akun? Daftar sebagai petani</a>
          <a class="auth-muted-link" href="forgot-password.html">Lupa Sandi?</a>
        </div>
      </section>
      <section class="auth-visual"><img src="../assets/image/tanaman/auth-illustration.png" alt="Petani di area tanaman" /></section>
    </main>
    <script src="../assets/js/app.js"></script>
  </body>
</html>
