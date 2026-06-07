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
    $musimFilter = filter_input(INPUT_GET, 'musim_tanam_id', FILTER_VALIDATE_INT);

    $query = 'SELECT bp.id, bp.musim_tanam_id, bp.kategori, bp.nominal,
                     bp.tanggal_biaya, bp.keterangan, bp.created_at, bp.updated_at,
                     mt.tanggal_tanam, mt.estimasi_panen,
                     l.nama_lahan, t.nama_tanaman
              FROM biaya_produksi bp
              INNER JOIN musim_tanam mt ON mt.id = bp.musim_tanam_id
              INNER JOIN lahan l ON l.id = mt.lahan_id
              INNER JOIN tanaman t ON t.id = mt.tanaman_id
              WHERE l.user_id = :user_id';
    $params = ['user_id' => $user['user_id']];

    if ($musimFilter) {
        $query .= ' AND bp.musim_tanam_id = :musim_tanam_id';
        $params['musim_tanam_id'] = $musimFilter;
    }

    $query .= ' ORDER BY bp.tanggal_biaya DESC, bp.id DESC';

    $statement = $pdo->prepare($query);
    $statement->execute($params);
    $items = $statement->fetchAll();

    $totalBiaya = 0;
    $totalPerKategori = [];

    foreach ($items as $item) {
        $nominal = (float) $item['nominal'];
        $totalBiaya += $nominal;
        $totalPerKategori[$item['kategori']] = ($totalPerKategori[$item['kategori']] ?? 0) + $nominal;
    }

    $optionsStatement = $pdo->prepare(
        'SELECT mt.id, mt.tanggal_tanam, mt.estimasi_panen, l.nama_lahan, t.nama_tanaman
         FROM musim_tanam mt
         INNER JOIN lahan l ON l.id = mt.lahan_id
         INNER JOIN tanaman t ON t.id = mt.tanaman_id
         WHERE l.user_id = :user_id
         ORDER BY mt.tanggal_tanam DESC, mt.id DESC'
    );
    $optionsStatement->execute(['user_id' => $user['user_id']]);

    sendJson([
        'success' => true,
        'data' => $items,
        'summary' => [
            'total_biaya' => $totalBiaya,
            'total_per_kategori' => $totalPerKategori,
        ],
        'options' => [
            'musim_tanam' => $optionsStatement->fetchAll(),
        ],
    ]);
} catch (PDOException $error) {
    sendJson(['success' => false, 'message' => 'Gagal mengambil data biaya produksi.'], 500);
}
