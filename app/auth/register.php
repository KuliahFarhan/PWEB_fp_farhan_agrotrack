<?php

declare(strict_types=1);

require_once __DIR__ . '/../config/database.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header('Location: ../../public/register.html');
    exit;
}

$nama = trim($_POST['nama'] ?? '');
$email = trim($_POST['email'] ?? '');
$nomorHp = trim($_POST['nomor_hp'] ?? '');
$password = $_POST['password'] ?? '';
$confirmPassword = $_POST['confirm_password'] ?? '';

if ($nama === '' || $email === '' || $nomorHp === '' || $password === '' || $confirmPassword === '') {
    header('Location: ../../public/register.html?error=required');
    exit;
}

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    header('Location: ../../public/register.html?error=invalid_email');
    exit;
}

if (strlen($password) < 8) {
    header('Location: ../../public/register.html?error=password_min');
    exit;
}

if ($password !== $confirmPassword) {
    header('Location: ../../public/register.html?error=password_mismatch');
    exit;
}

try {
    $pdo = getDatabaseConnection();

    $checkEmail = $pdo->prepare('SELECT id FROM users WHERE email = :email LIMIT 1');
    $checkEmail->execute(['email' => $email]);

    if ($checkEmail->fetch()) {
        header('Location: ../../public/register.html?error=email_exists');
        exit;
    }

    $insertUser = $pdo->prepare(
        'INSERT INTO users (nama, email, password, nomor_hp, role, status, created_at, updated_at)
         VALUES (:nama, :email, :password, :nomor_hp, :role, :status, NOW(), NOW())'
    );

    $insertUser->execute([
        'nama' => $nama,
        'email' => $email,
        'password' => password_hash($password, PASSWORD_DEFAULT),
        'nomor_hp' => $nomorHp,
        'role' => 'petani',
        'status' => 'aktif',
    ]);

    header('Location: ../../public/login.html?success=registered');
    exit;
} catch (PDOException $error) {
    header('Location: ../../public/register.html?error=server');
    exit;
}
