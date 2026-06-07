<?php

declare(strict_types=1);

require_once __DIR__ . '/../config/database.php';
require_once __DIR__ . '/guard.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header('Location: ../../public/login.html');
    exit;
}

$email = trim($_POST['email'] ?? '');
$password = $_POST['password'] ?? '';

if ($email === '' || $password === '') {
    header('Location: ../../public/login.html?error=required');
    exit;
}

try {
    $pdo = getDatabaseConnection();
    $statement = $pdo->prepare('SELECT id, nama, email, password, role, status FROM users WHERE email = :email LIMIT 1');
    $statement->execute(['email' => $email]);
    $user = $statement->fetch();

    if (!$user || !password_verify($password, $user['password'])) {
        header('Location: ../../public/login.html?error=invalid_credentials');
        exit;
    }

    if ($user['status'] !== 'aktif') {
        header('Location: ../../public/login.html?error=inactive');
        exit;
    }

    startSessionIfNeeded();
    session_regenerate_id(true);

    $_SESSION['user_id'] = (int) $user['id'];
    $_SESSION['nama'] = $user['nama'];
    $_SESSION['email'] = $user['email'];
    $_SESSION['role'] = $user['role'];

    if ($user['role'] === 'admin') {
        header('Location: ../../public/admin/dashboard.html');
        exit;
    }

    header('Location: ../../public/petani/dashboard.html');
    exit;
} catch (PDOException $error) {
    header('Location: ../../public/login.html?error=server');
    exit;
}
