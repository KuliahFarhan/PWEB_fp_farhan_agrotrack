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

$namaTanaman = trim($_POST['nama_tanaman'] ?? '');
$masaPanen = filter_input(INPUT_POST, 'masa_panen', FILTER_VALIDATE_INT);
$deskripsi = trim($_POST['deskripsi'] ?? '');
$status = $_POST['status'] ?? 'aktif';

if ($namaTanaman === '' || !$masaPanen || $masaPanen < 1) {
    sendJson([
        'success' => false,
        'message' => 'Nama tanaman dan masa panen positif wajib diisi.',
    ], 422);
}

if (!in_array($status, ['aktif', 'nonaktif'], true)) {
    sendJson([
        'success' => false,
        'message' => 'Status tanaman tidak valid.',
    ], 422);
}

try {
    $pdo = getDatabaseConnection();

    $checkDuplicate = $pdo->prepare(
        'SELECT id FROM tanaman WHERE LOWER(nama_tanaman) = LOWER(:nama_tanaman) LIMIT 1'
    );
    $checkDuplicate->execute(['nama_tanaman' => $namaTanaman]);

    if ($checkDuplicate->fetch()) {
        sendJson([
            'success' => false,
            'message' => 'Nama tanaman sudah terdaftar.',
        ], 409);
    }

    $statement = $pdo->prepare(
        'INSERT INTO tanaman (nama_tanaman, masa_panen, deskripsi, status, created_at, updated_at)
         VALUES (:nama_tanaman, :masa_panen, :deskripsi, :status, NOW(), NOW())'
    );

    $statement->execute([
        'nama_tanaman' => $namaTanaman,
        'masa_panen' => $masaPanen,
        'deskripsi' => $deskripsi !== '' ? $deskripsi : null,
        'status' => $status,
    ]);

    sendJson([
        'success' => true,
        'message' => 'Tanaman berhasil ditambahkan.',
        'id' => (int) $pdo->lastInsertId(),
    ], 201);
} catch (PDOException $error) {
    sendJson([
        'success' => false,
        'message' => 'Gagal menambahkan tanaman.',
    ], 500);
}
