<?php

declare(strict_types=1);

header('Content-Type: application/json');

require_once __DIR__ . '/../auth/guard.php';
require_once __DIR__ . '/../config/database.php';

function sendJson(array $payload, int $statusCode = 200): void
{
    http_response_code($statusCode);
    echo json_encode($payload, JSON_PRETTY_PRINT);
    exit;
}

$user = currentUser();

if (!$user) {
    sendJson(['success' => false, 'message' => 'Silakan login terlebih dahulu.'], 401);
}

if ($user['role'] !== 'admin') {
    sendJson(['success' => false, 'message' => 'Akses hanya untuk admin.'], 403);
}

try {
    $pdo = getDatabaseConnection();
    $statement = $pdo->prepare(
        'SELECT l.id, l.nama_lahan, l.lokasi, l.luas_lahan, l.status_lahan,
                l.latitude, l.longitude, l.polygon_area, l.created_at, l.updated_at,
                u.nama AS nama_petani, u.email AS email_petani,
                mt.id AS musim_tanam_id, mt.status AS status_musim,
                mt.estimasi_panen, t.nama_tanaman
         FROM lahan l
         INNER JOIN users u ON u.id = l.user_id
         LEFT JOIN musim_tanam mt ON mt.id = (
             SELECT mt2.id
             FROM musim_tanam mt2
             WHERE mt2.lahan_id = l.id
             ORDER BY
                CASE WHEN mt2.status <> "panen_selesai" THEN 0 ELSE 1 END,
                mt2.estimasi_panen ASC,
                mt2.id DESC
             LIMIT 1
         )
         LEFT JOIN tanaman t ON t.id = mt.tanaman_id
         ORDER BY l.status_lahan ASC, l.updated_at DESC, l.id DESC'
    );
    $statement->execute();
    $items = $statement->fetchAll();

    $summary = [
        'total_lahan' => count($items),
        'lahan_aktif' => 0,
        'with_marker' => 0,
        'with_polygon' => 0,
    ];

    foreach ($items as $item) {
        if ($item['status_lahan'] === 'aktif') {
            $summary['lahan_aktif'] += 1;
        }

        if ($item['latitude'] !== null && $item['longitude'] !== null) {
            $summary['with_marker'] += 1;
        }

        if (!empty($item['polygon_area'])) {
            json_decode($item['polygon_area'], true);

            if (json_last_error() === JSON_ERROR_NONE) {
                $summary['with_polygon'] += 1;
            }
        }
    }

    sendJson([
        'success' => true,
        'data' => $items,
        'summary' => $summary,
    ]);
} catch (PDOException $error) {
    sendJson(['success' => false, 'message' => 'Gagal mengambil data monitoring lahan.'], 500);
}
