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

function requiredDecimal(?string $value, string $field, float $min, float $max): float
{
    $value = trim((string) $value);

    if ($value === '' || !is_numeric($value)) {
        sendJson([
            'success' => false,
            'message' => $field . ' wajib berupa angka.',
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

function optionalPositiveDecimal(?string $value, string $field, float $max): ?float
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

    if ($number <= 0 || $number > $max) {
        sendJson([
            'success' => false,
            'message' => $field . ' harus lebih dari 0 dan berada di rentang valid.',
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
$id = filter_input(INPUT_POST, 'id', FILTER_VALIDATE_INT);
$latitude = requiredDecimal($_POST['latitude'] ?? null, 'Latitude', -90, 90);
$longitude = requiredDecimal($_POST['longitude'] ?? null, 'Longitude', -180, 180);
$polygonArea = trim($_POST['polygon_area'] ?? '');
$luasLahan = optionalPositiveDecimal($_POST['luas_lahan'] ?? null, 'Luas lahan', 99999999.99);

if (!$id) {
    sendJson([
        'success' => false,
        'message' => 'ID lahan wajib dikirim.',
    ], 422);
}

if ($polygonArea !== '') {
    json_decode($polygonArea, true);

    if (json_last_error() !== JSON_ERROR_NONE) {
        $normalizedPolygonArea = stripslashes($polygonArea);
        json_decode($normalizedPolygonArea, true);

        if (json_last_error() !== JSON_ERROR_NONE) {
            sendJson([
                'success' => false,
                'message' => 'Format polygon tidak valid.',
            ], 422);
        }

        $polygonArea = $normalizedPolygonArea;
    }
}

try {
    $pdo = getDatabaseConnection();
    $statement = $pdo->prepare(
        'UPDATE lahan
         SET latitude = :latitude,
             longitude = :longitude,
             polygon_area = :polygon_area,
             luas_lahan = COALESCE(:luas_lahan, luas_lahan),
             updated_at = NOW()
         WHERE id = :id
           AND user_id = :user_id
           AND status_lahan = :status_lahan'
    );

    $statement->execute([
        'latitude' => $latitude,
        'longitude' => $longitude,
        'polygon_area' => $polygonArea !== '' ? $polygonArea : null,
        'luas_lahan' => $luasLahan,
        'id' => $id,
        'user_id' => $user['user_id'],
        'status_lahan' => 'aktif',
    ]);

    if ($statement->rowCount() === 0) {
        $checkExists = $pdo->prepare(
            'SELECT id FROM lahan
             WHERE id = :id
               AND user_id = :user_id
               AND status_lahan = :status_lahan
             LIMIT 1'
        );
        $checkExists->execute([
            'id' => $id,
            'user_id' => $user['user_id'],
            'status_lahan' => 'aktif',
        ]);

        if (!$checkExists->fetch()) {
            sendJson([
                'success' => false,
                'message' => 'Data lahan aktif tidak ditemukan.',
            ], 404);
        }
    }

    sendJson([
        'success' => true,
        'message' => 'Data peta lahan berhasil disimpan.',
    ]);
} catch (PDOException $error) {
    sendJson([
        'success' => false,
        'message' => 'Gagal menyimpan data peta lahan.',
    ], 500);
}
