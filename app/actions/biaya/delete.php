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
        sendJson(['success' => false, 'message' => 'Silakan login terlebih dahulu.'], 401);
    }

    if ($user['role'] !== 'petani') {
        sendJson(['success' => false, 'message' => 'Akses hanya untuk petani.'], 403);
    }

    return $user;
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    sendJson(['success' => false, 'message' => 'Method tidak didukung.'], 405);
}

$user = requirePetaniJson();
$id = filter_input(INPUT_POST, 'id', FILTER_VALIDATE_INT);

if (!$id) {
    sendJson(['success' => false, 'message' => 'ID biaya produksi wajib dikirim.'], 422);
}

try {
    $pdo = getDatabaseConnection();
    $ownedCost = $pdo->prepare(
        'SELECT bp.id FROM biaya_produksi bp
         INNER JOIN musim_tanam mt ON mt.id = bp.musim_tanam_id
         INNER JOIN lahan l ON l.id = mt.lahan_id
         WHERE bp.id = :id AND l.user_id = :user_id
         LIMIT 1'
    );
    $ownedCost->execute(['id' => $id, 'user_id' => $user['user_id']]);

    if (!$ownedCost->fetch()) {
        sendJson(['success' => false, 'message' => 'Data biaya produksi tidak ditemukan.'], 404);
    }

    $statement = $pdo->prepare('DELETE FROM biaya_produksi WHERE id = :id');
    $statement->execute(['id' => $id]);

    sendJson(['success' => true, 'message' => 'Biaya produksi berhasil dihapus.']);
} catch (PDOException $error) {
    sendJson(['success' => false, 'message' => 'Gagal menghapus biaya produksi.'], 500);
}
