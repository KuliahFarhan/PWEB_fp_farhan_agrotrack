<?php

declare(strict_types=1);

header('Content-Type: application/json');

require_once __DIR__ . '/../../auth/guard.php';
require_once __DIR__ . '/../../config/database.php';

function sendJson(array $payload, int $statusCode = 200): void
{
    http_response_code($statusCode);
    echo json_encode($payload, JSON_PRETTY_PRINT);
    exit;
}

function requireAdminJson(): void
{
    $user = currentUser();

    if (!$user) {
        sendJson([
            'success' => false,
            'message' => 'Silakan login terlebih dahulu.',
        ], 401);
    }

    if ($user['role'] !== 'admin') {
        sendJson([
            'success' => false,
            'message' => 'Akses hanya untuk admin.',
        ], 403);
    }
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    sendJson([
        'success' => false,
        'message' => 'Method tidak didukung.',
    ], 405);
}

requireAdminJson();

$id = filter_input(INPUT_POST, 'id', FILTER_VALIDATE_INT);

if (!$id) {
    sendJson([
        'success' => false,
        'message' => 'ID tanaman wajib dikirim.',
    ], 422);
}

try {
    $pdo = getDatabaseConnection();

    $checkExists = $pdo->prepare('SELECT id, status FROM tanaman WHERE id = :id LIMIT 1');
    $checkExists->execute(['id' => $id]);
    $tanaman = $checkExists->fetch();

    if (!$tanaman) {
        sendJson([
            'success' => false,
            'message' => 'Data tanaman tidak ditemukan.',
        ], 404);
    }

    $statement = $pdo->prepare(
        'UPDATE tanaman
         SET status = :status,
             updated_at = NOW()
         WHERE id = :id'
    );
    $statement->execute([
        'status' => 'nonaktif',
        'id' => $id,
    ]);

    sendJson([
        'success' => true,
        'message' => 'Tanaman berhasil dinonaktifkan.',
    ]);
} catch (PDOException $error) {
    sendJson([
        'success' => false,
        'message' => 'Gagal menonaktifkan tanaman.',
    ], 500);
}
