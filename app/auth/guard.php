<?php

declare(strict_types=1);

function startSessionIfNeeded(): void
{
    if (session_status() === PHP_SESSION_NONE) {
        session_start();
    }
}

function currentUser(): ?array
{
    startSessionIfNeeded();

    if (empty($_SESSION['user_id'])) {
        return null;
    }

    return [
        'user_id' => (int) $_SESSION['user_id'],
        'nama' => $_SESSION['nama'] ?? '',
        'email' => $_SESSION['email'] ?? '',
        'role' => $_SESSION['role'] ?? '',
    ];
}

function isLoggedIn(): bool
{
    return currentUser() !== null;
}

function requireLogin(): void
{
    if (!isLoggedIn()) {
        header('Location: ../../public/login.html?error=login_required');
        exit;
    }
}

function requireRole(string $role): void
{
    requireLogin();

    $user = currentUser();

    if (!$user || $user['role'] !== $role) {
        header('Location: ../../public/login.html?error=forbidden');
        exit;
    }
}

function redirectIfAuthenticated(): void
{
    $user = currentUser();

    if (!$user) {
        return;
    }

    if ($user['role'] === 'admin') {
        header('Location: ../../public/admin/dashboard.html');
        exit;
    }

    header('Location: ../../public/petani/dashboard.html');
    exit;
}
