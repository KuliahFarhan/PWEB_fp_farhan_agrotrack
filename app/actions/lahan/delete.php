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

function requirePetaniJson(): array
{
    $user = currentUser();

    if (!$user) {
        sendJson([
            'success' => false,
            'message' => 'Silakan login terlebih dahulu.',
        ], 401);
    }

    if ($user['role'] !== 'petani') {
        sendJson([
            'success' => false,
            'message' => 'Akses hanya untuk petani.',
        ], 403);
    }

    return $user;
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    sendJson([
        'success' => false,
        'message' => 'Method tidak didukung.',
    ], 405);
}

$user = requirePetaniJson();
$id = filter_input(INPUT_POST, 'id', FILTER_VALIDATE_INT);

if (!$id) {
    sendJson([
        'success' => false,
        'message' => 'ID lahan wajib dikirim.',
    ], 422);
}

try {
    $pdo = getDatabaseConnection();

    $checkExists = $pdo->prepare('SELECT id FROM lahan WHERE id = :id AND user_id = :user_id LIMIT 1');
    $checkExists->execute([
        'id' => $id,
        'user_id' => $user['user_id'],
    ]);

    if (!$checkExists->fetch()) {
        sendJson([
            'success' => false,
            'message' => 'Data lahan tidak ditemukan.',
        ], 404);
    }

    $statement = $pdo->prepare(
        'UPDATE lahan
         SET status_lahan = :status_lahan,
             updated_at = NOW()
         WHERE id = :id AND user_id = :user_id'
    );
    $statement->execute([
        'status_lahan' => 'nonaktif',
        'id' => $id,
        'user_id' => $user['user_id'],
    ]);

    sendJson([
        'success' => true,
        'message' => 'Lahan berhasil dinonaktifkan.',
    ]);
} catch (PDOException $error) {
    sendJson([
        'success' => false,
        'message' => 'Gagal menonaktifkan lahan.',
    ], 500);
}
