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
        'message' => 'ID musim tanam wajib dikirim.',
    ], 422);
}

try {
    $pdo = getDatabaseConnection();

    $ownedSeason = $pdo->prepare(
        'SELECT mt.id
         FROM musim_tanam mt
         INNER JOIN lahan l ON l.id = mt.lahan_id
         WHERE mt.id = :id AND l.user_id = :user_id
         LIMIT 1'
    );
    $ownedSeason->execute([
        'id' => $id,
        'user_id' => $user['user_id'],
    ]);

    if (!$ownedSeason->fetch()) {
        sendJson([
            'success' => false,
            'message' => 'Data musim tanam tidak ditemukan.',
        ], 404);
    }

    $biayaStatement = $pdo->prepare('SELECT COUNT(*) AS total FROM biaya_produksi WHERE musim_tanam_id = :id');
    $biayaStatement->execute(['id' => $id]);
    $biayaCount = (int) $biayaStatement->fetch()['total'];

    $panenStatement = $pdo->prepare('SELECT COUNT(*) AS total FROM hasil_panen WHERE musim_tanam_id = :id');
    $panenStatement->execute(['id' => $id]);
    $panenCount = (int) $panenStatement->fetch()['total'];

    if ($biayaCount > 0 || $panenCount > 0) {
        sendJson([
            'success' => false,
            'message' => 'Musim tanam tidak dapat dihapus karena sudah memiliki biaya atau hasil panen.',
        ], 409);
    }

    $statement = $pdo->prepare('DELETE FROM musim_tanam WHERE id = :id');
    $statement->execute(['id' => $id]);

    sendJson([
        'success' => true,
        'message' => 'Musim tanam berhasil dihapus.',
    ]);
} catch (PDOException $error) {
    sendJson([
        'success' => false,
        'message' => 'Gagal menghapus musim tanam.',
    ], 500);
}
