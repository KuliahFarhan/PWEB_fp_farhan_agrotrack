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

function optionalDecimal(?string $value, string $field, float $min, float $max): ?float
{
    $value = trim((string) $value);

    if ($value === '') {
        return null;
    }

    if (!is_numeric($value)) {
        sendJson([
            'success' => false,
            'message' => $field . ' harus berupa angka.',
        ], 422);
    }

    $number = (float) $value;

    if ($number < $min || $number > $max) {
        sendJson([
            'success' => false,
            'message' => $field . ' berada di luar rentang yang valid.',
        ], 422);
    }

    return $number;
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    sendJson([
        'success' => false,
        'message' => 'Method tidak didukung.',
    ], 405);
}

$user = requirePetaniJson();

$namaLahan = trim($_POST['nama_lahan'] ?? '');
$lokasi = trim($_POST['lokasi'] ?? '');
$luasLahanRaw = trim($_POST['luas_lahan'] ?? '');
$statusLahan = $_POST['status_lahan'] ?? 'aktif';
$latitude = optionalDecimal($_POST['latitude'] ?? null, 'Latitude', -90, 90);
$longitude = optionalDecimal($_POST['longitude'] ?? null, 'Longitude', -180, 180);
$polygonArea = trim($_POST['polygon_area'] ?? '');

if ($namaLahan === '' || $lokasi === '' || $luasLahanRaw === '' || !is_numeric($luasLahanRaw)) {
    sendJson([
        'success' => false,
        'message' => 'Nama lahan, lokasi, dan luas lahan wajib diisi.',
    ], 422);
}

$luasLahan = (float) $luasLahanRaw;

if ($luasLahan <= 0) {
    sendJson([
        'success' => false,
        'message' => 'Luas lahan harus lebih dari 0.',
    ], 422);
}

if (!in_array($statusLahan, ['aktif', 'nonaktif'], true)) {
    sendJson([
        'success' => false,
        'message' => 'Status lahan tidak valid.',
    ], 422);
}

try {
    $pdo = getDatabaseConnection();
    $statement = $pdo->prepare(
        'INSERT INTO lahan
            (user_id, nama_lahan, lokasi, luas_lahan, status_lahan, latitude, longitude, polygon_area, created_at, updated_at)
         VALUES
            (:user_id, :nama_lahan, :lokasi, :luas_lahan, :status_lahan, :latitude, :longitude, :polygon_area, NOW(), NOW())'
    );

    $statement->execute([
        'user_id' => $user['user_id'],
        'nama_lahan' => $namaLahan,
        'lokasi' => $lokasi,
        'luas_lahan' => $luasLahan,
        'status_lahan' => $statusLahan,
        'latitude' => $latitude,
        'longitude' => $longitude,
        'polygon_area' => $polygonArea !== '' ? $polygonArea : null,
    ]);

    sendJson([
        'success' => true,
        'message' => 'Lahan berhasil ditambahkan.',
        'id' => (int) $pdo->lastInsertId(),
    ], 201);
} catch (PDOException $error) {
    sendJson([
        'success' => false,
        'message' => 'Gagal menambahkan lahan.',
    ], 500);
}
