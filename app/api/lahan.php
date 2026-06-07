<?php

declare(strict_types=1);

header('Content-Type: application/json');

require_once __DIR__ . '/../auth/guard.php';
require_once __DIR__ . '/../config/database.php';

function sendJson(array $payload, int $statusCode = 200): void
{
    http_response_code($statusCode);
    echo json_encode($payload, JSON_PRETTY_PRINT);
    exit;
}

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

try {
    $pdo = getDatabaseConnection();
    $id = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);

    if ($id) {
        $statement = $pdo->prepare(
            'SELECT id, user_id, nama_lahan, lokasi, luas_lahan, status_lahan,
                    latitude, longitude, polygon_area, created_at, updated_at
             FROM lahan
             WHERE id = :id AND user_id = :user_id
             LIMIT 1'
        );
        $statement->execute([
            'id' => $id,
            'user_id' => $user['user_id'],
        ]);
        $lahan = $statement->fetch();

        if (!$lahan) {
            sendJson([
                'success' => false,
                'message' => 'Data lahan tidak ditemukan.',
            ], 404);
        }

        sendJson([
            'success' => true,
            'data' => $lahan,
        ]);
    }

    $statement = $pdo->prepare(
        'SELECT id, user_id, nama_lahan, lokasi, luas_lahan, status_lahan,
                latitude, longitude, polygon_area, created_at, updated_at
         FROM lahan
         WHERE user_id = :user_id
         ORDER BY status_lahan ASC, nama_lahan ASC'
    );
    $statement->execute(['user_id' => $user['user_id']]);

    sendJson([
        'success' => true,
        'data' => $statement->fetchAll(),
    ]);
} catch (PDOException $error) {
    sendJson([
        'success' => false,
        'message' => 'Gagal mengambil data lahan.',
    ], 500);
}
