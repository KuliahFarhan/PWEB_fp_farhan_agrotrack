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

if ($user['role'] !== 'petani') {
    sendJson(['success' => false, 'message' => 'Akses hanya untuk petani.'], 403);
}

try {
    $pdo = getDatabaseConnection();
    $query = 'SELECT hp.id, hp.musim_tanam_id, hp.total_hasil, hp.satuan,
                     hp.harga_jual, hp.total_pendapatan, hp.total_keuntungan,
                     hp.catatan, hp.created_at, hp.updated_at,
                     mt.tanggal_tanam, mt.estimasi_panen,
                     l.nama_lahan, t.nama_tanaman,
                     COALESCE(SUM(bp.nominal), 0) AS total_biaya
              FROM hasil_panen hp
              INNER JOIN musim_tanam mt ON mt.id = hp.musim_tanam_id
              INNER JOIN lahan l ON l.id = mt.lahan_id
              INNER JOIN tanaman t ON t.id = mt.tanaman_id
              LEFT JOIN biaya_produksi bp ON bp.musim_tanam_id = mt.id
              WHERE l.user_id = :user_id
              GROUP BY hp.id, hp.musim_tanam_id, hp.total_hasil, hp.satuan,
                       hp.harga_jual, hp.total_pendapatan, hp.total_keuntungan,
                       hp.catatan, hp.created_at, hp.updated_at,
                       mt.tanggal_tanam, mt.estimasi_panen,
                       l.nama_lahan, t.nama_tanaman
              ORDER BY hp.created_at DESC, hp.id DESC';
    $statement = $pdo->prepare($query);
    $statement->execute(['user_id' => $user['user_id']]);
    $items = $statement->fetchAll();

    $summary = [
        'total_records' => count($items),
        'total_pendapatan' => 0,
        'total_biaya' => 0,
        'total_keuntungan' => 0,
    ];

    foreach ($items as $item) {
        $summary['total_pendapatan'] += (float) $item['total_pendapatan'];
        $summary['total_biaya'] += (float) $item['total_biaya'];
        $summary['total_keuntungan'] += (float) $item['total_keuntungan'];
    }

    $optionsStatement = $pdo->prepare(
        'SELECT mt.id, mt.tanggal_tanam, mt.estimasi_panen,
                l.nama_lahan, t.nama_tanaman,
                hp.id AS hasil_panen_id,
                COALESCE(SUM(bp.nominal), 0) AS total_biaya
         FROM musim_tanam mt
         INNER JOIN lahan l ON l.id = mt.lahan_id
         INNER JOIN tanaman t ON t.id = mt.tanaman_id
         LEFT JOIN hasil_panen hp ON hp.musim_tanam_id = mt.id
         LEFT JOIN biaya_produksi bp ON bp.musim_tanam_id = mt.id
         WHERE l.user_id = :user_id
         GROUP BY mt.id, mt.tanggal_tanam, mt.estimasi_panen,
                  l.nama_lahan, t.nama_tanaman, hp.id
         ORDER BY mt.tanggal_tanam DESC, mt.id DESC'
    );
    $optionsStatement->execute(['user_id' => $user['user_id']]);

    sendJson([
        'success' => true,
        'data' => $items,
        'summary' => $summary,
        'options' => [
            'musim_tanam' => $optionsStatement->fetchAll(),
        ],
    ]);
} catch (PDOException $error) {
    sendJson(['success' => false, 'message' => 'Gagal mengambil data hasil panen.'], 500);
}
