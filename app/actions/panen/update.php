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
$id = filter_input(INPUT_POST, 'id', FILTER_VALIDATE_INT);
$totalHasil = positiveDecimal(trim($_POST['total_hasil'] ?? ''), 'Total hasil');
$satuan = $_POST['satuan'] ?? 'kg';
$hargaJual = positiveDecimal(trim($_POST['harga_jual'] ?? ''), 'Harga jual');
$catatan = trim($_POST['catatan'] ?? '');
$allowedUnits = ['kg', 'kuintal', 'ton'];

if (!$id || !in_array($satuan, $allowedUnits, true)) {
    sendJson(['success' => false, 'message' => 'ID hasil panen dan satuan wajib valid.'], 422);
}

try {
    $pdo = getDatabaseConnection();
    $ownedHarvest = $pdo->prepare(
        'SELECT hp.id, hp.musim_tanam_id
         FROM hasil_panen hp
         INNER JOIN musim_tanam mt ON mt.id = hp.musim_tanam_id
         INNER JOIN lahan l ON l.id = mt.lahan_id
         WHERE hp.id = :id AND l.user_id = :user_id
         LIMIT 1'
    );
    $ownedHarvest->execute(['id' => $id, 'user_id' => $user['user_id']]);
    $harvest = $ownedHarvest->fetch();

    if (!$harvest) {
        sendJson(['success' => false, 'message' => 'Data hasil panen tidak ditemukan.'], 404);
    }

    $totalPendapatan = $totalHasil * $hargaJual;
    $totalBiaya = calculateTotalCost($pdo, (int) $harvest['musim_tanam_id']);
    $totalKeuntungan = $totalPendapatan - $totalBiaya;

    $statement = $pdo->prepare(
        'UPDATE hasil_panen
         SET total_hasil = :total_hasil,
             satuan = :satuan,
             harga_jual = :harga_jual,
             total_pendapatan = :total_pendapatan,
             total_keuntungan = :total_keuntungan,
             catatan = :catatan,
             updated_at = NOW()
         WHERE id = :id'
    );
    $statement->execute([
        'total_hasil' => $totalHasil,
        'satuan' => $satuan,
        'harga_jual' => $hargaJual,
        'total_pendapatan' => $totalPendapatan,
        'total_keuntungan' => $totalKeuntungan,
        'catatan' => $catatan !== '' ? $catatan : null,
        'id' => $id,
    ]);

    sendJson([
        'success' => true,
        'message' => 'Hasil panen berhasil diperbarui.',
        'total_pendapatan' => $totalPendapatan,
        'total_biaya' => $totalBiaya,
        'total_keuntungan' => $totalKeuntungan,
    ]);
} catch (PDOException $error) {
    sendJson(['success' => false, 'message' => 'Gagal memperbarui hasil panen.'], 500);
}
