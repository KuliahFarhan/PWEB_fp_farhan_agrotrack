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
$namaTanaman = trim($_POST['nama_tanaman'] ?? '');
$masaPanen = filter_input(INPUT_POST, 'masa_panen', FILTER_VALIDATE_INT);
$deskripsi = trim($_POST['deskripsi'] ?? '');
$status = $_POST['status'] ?? 'aktif';

if (!$id || $namaTanaman === '' || !$masaPanen || $masaPanen < 1) {
    sendJson([
        'success' => false,
        'message' => 'ID, nama tanaman, dan masa panen positif wajib diisi.',
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
        'SELECT id FROM tanaman
         WHERE LOWER(nama_tanaman) = LOWER(:nama_tanaman)
         AND id <> :id
         LIMIT 1'
    );
    $checkDuplicate->execute([
        'nama_tanaman' => $namaTanaman,
        'id' => $id,
    ]);

    if ($checkDuplicate->fetch()) {
        sendJson([
            'success' => false,
            'message' => 'Nama tanaman sudah digunakan data lain.',
        ], 409);
    }

    $statement = $pdo->prepare(
        'UPDATE tanaman
         SET nama_tanaman = :nama_tanaman,
             masa_panen = :masa_panen,
             deskripsi = :deskripsi,
             status = :status,
             updated_at = NOW()
         WHERE id = :id'
    );

    $statement->execute([
        'nama_tanaman' => $namaTanaman,
        'masa_panen' => $masaPanen,
        'deskripsi' => $deskripsi !== '' ? $deskripsi : null,
        'status' => $status,
        'id' => $id,
    ]);

    if ($statement->rowCount() === 0) {
        $checkExists = $pdo->prepare('SELECT id FROM tanaman WHERE id = :id LIMIT 1');
        $checkExists->execute(['id' => $id]);

        if (!$checkExists->fetch()) {
            sendJson([
                'success' => false,
                'message' => 'Data tanaman tidak ditemukan.',
            ], 404);
        }
    }

    sendJson([
        'success' => true,
        'message' => 'Tanaman berhasil diperbarui.',
    ]);
} catch (PDOException $error) {
    sendJson([
        'success' => false,
        'message' => 'Gagal memperbarui tanaman.',
    ], 500);
}
