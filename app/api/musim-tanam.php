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

function calculateProgress(string $tanggalTanam, int $masaPanen): int
{
    if ($masaPanen <= 0) {
        return 0;
    }

    $today = new DateTimeImmutable('today');
    $startDate = new DateTimeImmutable($tanggalTanam);
    $daysElapsed = (int) $startDate->diff($today)->format('%r%a');
    $progress = ($daysElapsed / $masaPanen) * 100;

    return max(0, min(100, (int) round($progress)));
}

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

try {
    $pdo = getDatabaseConnection();
    $id = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);

    $baseQuery = 'SELECT mt.id, mt.lahan_id, mt.tanaman_id,
                         l.nama_lahan, t.nama_tanaman, t.masa_panen,
                         mt.tanggal_tanam, mt.estimasi_panen, mt.status,
                         mt.catatan, mt.created_at, mt.updated_at
                  FROM musim_tanam mt
                  INNER JOIN lahan l ON l.id = mt.lahan_id
                  INNER JOIN tanaman t ON t.id = mt.tanaman_id
                  WHERE l.user_id = :user_id';

    if ($id) {
        $statement = $pdo->prepare($baseQuery . ' AND mt.id = :id LIMIT 1');
        $statement->execute([
            'user_id' => $user['user_id'],
            'id' => $id,
        ]);
        $musimTanam = $statement->fetch();

        if (!$musimTanam) {
            sendJson([
                'success' => false,
                'message' => 'Data musim tanam tidak ditemukan.',
            ], 404);
        }

        $musimTanam['progress'] = calculateProgress(
            $musimTanam['tanggal_tanam'],
            (int) $musimTanam['masa_panen']
        );

        sendJson([
            'success' => true,
            'data' => $musimTanam,
        ]);
    }

    $statement = $pdo->prepare($baseQuery . ' ORDER BY mt.tanggal_tanam DESC, mt.id DESC');
    $statement->execute(['user_id' => $user['user_id']]);
    $items = $statement->fetchAll();

    foreach ($items as &$item) {
        $item['progress'] = calculateProgress($item['tanggal_tanam'], (int) $item['masa_panen']);
    }
    unset($item);

    $lahanStatement = $pdo->prepare(
        'SELECT id, nama_lahan
         FROM lahan
         WHERE user_id = :user_id AND status_lahan = :status_lahan
         ORDER BY nama_lahan ASC'
    );
    $lahanStatement->execute([
        'user_id' => $user['user_id'],
        'status_lahan' => 'aktif',
    ]);

    $tanamanStatement = $pdo->prepare(
        'SELECT id, nama_tanaman, masa_panen
         FROM tanaman
         WHERE status = :status
         ORDER BY nama_tanaman ASC'
    );
    $tanamanStatement->execute(['status' => 'aktif']);

    sendJson([
        'success' => true,
        'data' => $items,
        'options' => [
            'lahan' => $lahanStatement->fetchAll(),
            'tanaman' => $tanamanStatement->fetchAll(),
        ],
    ]);
} catch (PDOException $error) {
    sendJson([
        'success' => false,
        'message' => 'Gagal mengambil data musim tanam.',
    ], 500);
}
