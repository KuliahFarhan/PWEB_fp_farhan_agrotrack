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

function positiveDecimal(string $value, string $field): float
{
    if ($value === '' || !is_numeric($value) || (float) $value <= 0) {
        sendJson(['success' => false, 'message' => $field . ' harus berupa angka lebih dari 0.'], 422);
    }

    return (float) $value;
}

function calculateTotalCost(PDO $pdo, int $musimTanamId): float
{
    $statement = $pdo->prepare('SELECT COALESCE(SUM(nominal), 0) AS total FROM biaya_produksi WHERE musim_tanam_id = :id');
    $statement->execute(['id' => $musimTanamId]);

    return (float) $statement->fetch()['total'];
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    sendJson(['success' => false, 'message' => 'Method tidak didukung.'], 405);
}

$user = requirePetaniJson();
$musimTanamId = filter_input(INPUT_POST, 'musim_tanam_id', FILTER_VALIDATE_INT);
$totalHasil = positiveDecimal(trim($_POST['total_hasil'] ?? ''), 'Total hasil');
$satuan = $_POST['satuan'] ?? 'kg';
$hargaJual = positiveDecimal(trim($_POST['harga_jual'] ?? ''), 'Harga jual');
$catatan = trim($_POST['catatan'] ?? '');
$allowedUnits = ['kg', 'kuintal', 'ton'];

if (!$musimTanamId || !in_array($satuan, $allowedUnits, true)) {
    sendJson(['success' => false, 'message' => 'Musim tanam dan satuan wajib valid.'], 422);
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
    $ownedSeason->execute(['id' => $musimTanamId, 'user_id' => $user['user_id']]);

    if (!$ownedSeason->fetch()) {
        sendJson(['success' => false, 'message' => 'Musim tanam tidak ditemukan.'], 404);
    }

    $duplicate = $pdo->prepare('SELECT id FROM hasil_panen WHERE musim_tanam_id = :id LIMIT 1');
    $duplicate->execute(['id' => $musimTanamId]);

    if ($duplicate->fetch()) {
        sendJson(['success' => false, 'message' => 'Musim tanam ini sudah memiliki hasil panen.'], 409);
    }

    $totalPendapatan = $totalHasil * $hargaJual;
    $totalBiaya = calculateTotalCost($pdo, $musimTanamId);
    $totalKeuntungan = $totalPendapatan - $totalBiaya;

    $statement = $pdo->prepare(
        'INSERT INTO hasil_panen
            (musim_tanam_id, total_hasil, satuan, harga_jual, total_pendapatan, total_keuntungan, catatan, created_at, updated_at)
         VALUES
            (:musim_tanam_id, :total_hasil, :satuan, :harga_jual, :total_pendapatan, :total_keuntungan, :catatan, NOW(), NOW())'
    );
    $statement->execute([
        'musim_tanam_id' => $musimTanamId,
        'total_hasil' => $totalHasil,
        'satuan' => $satuan,
        'harga_jual' => $hargaJual,
        'total_pendapatan' => $totalPendapatan,
        'total_keuntungan' => $totalKeuntungan,
        'catatan' => $catatan !== '' ? $catatan : null,
    ]);

    $hasilPanenId = (int) $pdo->lastInsertId();

    $pdo->prepare('UPDATE musim_tanam SET status = :status, updated_at = NOW() WHERE id = :id')
        ->execute(['status' => 'panen_selesai', 'id' => $musimTanamId]);

    sendJson([
        'success' => true,
        'message' => 'Hasil panen berhasil ditambahkan.',
        'id' => $hasilPanenId,
        'total_pendapatan' => $totalPendapatan,
        'total_biaya' => $totalBiaya,
        'total_keuntungan' => $totalKeuntungan,
    ], 201);
} catch (PDOException $error) {
    sendJson(['success' => false, 'message' => 'Gagal menambahkan hasil panen.'], 500);
}
