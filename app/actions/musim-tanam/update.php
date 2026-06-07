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

function validateDateInput(string $date): bool
{
    $parsed = DateTimeImmutable::createFromFormat('Y-m-d', $date);

    return $parsed && $parsed->format('Y-m-d') === $date;
}

function calculateHarvestDate(string $tanggalTanam, int $masaPanen): string
{
    return (new DateTimeImmutable($tanggalTanam))
        ->modify('+' . $masaPanen . ' days')
        ->format('Y-m-d');
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    sendJson([
        'success' => false,
        'message' => 'Method tidak didukung.',
    ], 405);
}

$user = requirePetaniJson();
$id = filter_input(INPUT_POST, 'id', FILTER_VALIDATE_INT);
$lahanId = filter_input(INPUT_POST, 'lahan_id', FILTER_VALIDATE_INT);
$tanamanId = filter_input(INPUT_POST, 'tanaman_id', FILTER_VALIDATE_INT);
$tanggalTanam = trim($_POST['tanggal_tanam'] ?? '');
$status = $_POST['status'] ?? 'persemaian';
$catatan = trim($_POST['catatan'] ?? '');
$allowedStatuses = ['persemaian', 'pertumbuhan', 'siap_panen', 'panen_selesai'];

if (!$id || !$lahanId || !$tanamanId || $tanggalTanam === '' || !validateDateInput($tanggalTanam)) {
    sendJson([
        'success' => false,
        'message' => 'ID, lahan, tanaman, dan tanggal tanam valid wajib diisi.',
    ], 422);
}

if (!in_array($status, $allowedStatuses, true)) {
    sendJson([
        'success' => false,
        'message' => 'Status musim tanam tidak valid.',
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

    $lahanStatement = $pdo->prepare(
        'SELECT id FROM lahan
         WHERE id = :id AND user_id = :user_id AND status_lahan = :status_lahan
         LIMIT 1'
    );
    $lahanStatement->execute([
        'id' => $lahanId,
        'user_id' => $user['user_id'],
        'status_lahan' => 'aktif',
    ]);

    if (!$lahanStatement->fetch()) {
        sendJson([
            'success' => false,
            'message' => 'Lahan aktif tidak ditemukan.',
        ], 404);
    }

    $tanamanStatement = $pdo->prepare(
        'SELECT id, masa_panen FROM tanaman
         WHERE id = :id AND status = :status
         LIMIT 1'
    );
    $tanamanStatement->execute([
        'id' => $tanamanId,
        'status' => 'aktif',
    ]);
    $tanaman = $tanamanStatement->fetch();

    if (!$tanaman) {
        sendJson([
            'success' => false,
            'message' => 'Tanaman aktif tidak ditemukan.',
        ], 404);
    }

    $estimasiPanen = calculateHarvestDate($tanggalTanam, (int) $tanaman['masa_panen']);
    $statement = $pdo->prepare(
        'UPDATE musim_tanam
         SET lahan_id = :lahan_id,
             tanaman_id = :tanaman_id,
             tanggal_tanam = :tanggal_tanam,
             estimasi_panen = :estimasi_panen,
             status = :status,
             catatan = :catatan,
             updated_at = NOW()
         WHERE id = :id'
    );
    $statement->execute([
        'lahan_id' => $lahanId,
        'tanaman_id' => $tanamanId,
        'tanggal_tanam' => $tanggalTanam,
        'estimasi_panen' => $estimasiPanen,
        'status' => $status,
        'catatan' => $catatan !== '' ? $catatan : null,
        'id' => $id,
    ]);

    sendJson([
        'success' => true,
        'message' => 'Musim tanam berhasil diperbarui.',
        'estimasi_panen' => $estimasiPanen,
    ]);
} catch (PDOException $error) {
    sendJson([
        'success' => false,
        'message' => 'Gagal memperbarui musim tanam.',
    ], 500);
}
