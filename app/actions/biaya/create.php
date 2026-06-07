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

function validateDateInput(string $date): bool
{
    $parsed = DateTimeImmutable::createFromFormat('Y-m-d', $date);
    return $parsed && $parsed->format('Y-m-d') === $date;
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    sendJson(['success' => false, 'message' => 'Method tidak didukung.'], 405);
}

$user = requirePetaniJson();
$musimTanamId = filter_input(INPUT_POST, 'musim_tanam_id', FILTER_VALIDATE_INT);
$kategori = $_POST['kategori'] ?? '';
$nominalRaw = trim($_POST['nominal'] ?? '');
$tanggalBiaya = trim($_POST['tanggal_biaya'] ?? '');
$keterangan = trim($_POST['keterangan'] ?? '');
$allowedCategories = ['bibit', 'pupuk', 'pestisida', 'tenaga_kerja', 'transportasi', 'sewa_alat', 'lainnya'];

if (!$musimTanamId || !in_array($kategori, $allowedCategories, true) || $nominalRaw === '' || !is_numeric($nominalRaw) || !validateDateInput($tanggalBiaya)) {
    sendJson(['success' => false, 'message' => 'Musim tanam, kategori, nominal, dan tanggal biaya wajib valid.'], 422);
}

$nominal = (float) $nominalRaw;

if ($nominal <= 0) {
    sendJson(['success' => false, 'message' => 'Nominal harus lebih dari 0.'], 422);
}

try {
    $pdo = getDatabaseConnection();
    $ownedSeason = $pdo->prepare(
        'SELECT mt.id FROM musim_tanam mt
         INNER JOIN lahan l ON l.id = mt.lahan_id
         WHERE mt.id = :id AND l.user_id = :user_id
         LIMIT 1'
    );
    $ownedSeason->execute(['id' => $musimTanamId, 'user_id' => $user['user_id']]);

    if (!$ownedSeason->fetch()) {
        sendJson(['success' => false, 'message' => 'Musim tanam tidak ditemukan.'], 404);
    }

    $statement = $pdo->prepare(
        'INSERT INTO biaya_produksi
            (musim_tanam_id, kategori, nominal, tanggal_biaya, keterangan, created_at, updated_at)
         VALUES
            (:musim_tanam_id, :kategori, :nominal, :tanggal_biaya, :keterangan, NOW(), NOW())'
    );
    $statement->execute([
        'musim_tanam_id' => $musimTanamId,
        'kategori' => $kategori,
        'nominal' => $nominal,
        'tanggal_biaya' => $tanggalBiaya,
        'keterangan' => $keterangan !== '' ? $keterangan : null,
    ]);

    sendJson([
        'success' => true,
        'message' => 'Biaya produksi berhasil ditambahkan.',
        'id' => (int) $pdo->lastInsertId(),
    ], 201);
} catch (PDOException $error) {
    sendJson(['success' => false, 'message' => 'Gagal menambahkan biaya produksi.'], 500);
}
