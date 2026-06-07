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

if ($user['role'] !== 'admin') {
    sendJson([
        'success' => false,
        'message' => 'Akses hanya untuk admin.',
    ], 403);
}

try {
    $pdo = getDatabaseConnection();
    $id = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);

    if ($id) {
        $statement = $pdo->prepare(
            'SELECT id, nama_tanaman, masa_panen, deskripsi, status, created_at, updated_at
             FROM tanaman
             WHERE id = :id
             LIMIT 1'
        );
        $statement->execute(['id' => $id]);
        $tanaman = $statement->fetch();

        if (!$tanaman) {
            sendJson([
                'success' => false,
                'message' => 'Data tanaman tidak ditemukan.',
            ], 404);
        }

        sendJson([
            'success' => true,
            'data' => $tanaman,
        ]);
    }

    $statement = $pdo->query(
        'SELECT id, nama_tanaman, masa_panen, deskripsi, status, created_at, updated_at
         FROM tanaman
         ORDER BY status ASC, nama_tanaman ASC'
    );

    sendJson([
        'success' => true,
        'data' => $statement->fetchAll(),
    ]);
} catch (PDOException $error) {
    sendJson([
        'success' => false,
        'message' => 'Gagal mengambil data tanaman.',
    ], 500);
}
