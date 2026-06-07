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

function fetchValue(PDO $pdo, string $query, array $params = []): mixed
{
    $statement = $pdo->prepare($query);
    $statement->execute($params);

    return $statement->fetchColumn();
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
    sendJson(['success' => false, 'message' => 'Silakan login terlebih dahulu.'], 401);
}

$scope = $_GET['scope'] ?? $user['role'];

if (!in_array($scope, ['petani', 'admin'], true)) {
    sendJson(['success' => false, 'message' => 'Scope dashboard tidak valid.'], 422);
}

if ($scope !== $user['role']) {
    sendJson(['success' => false, 'message' => 'Akses dashboard tidak sesuai role.'], 403);
}

try {
    $pdo = getDatabaseConnection();

    if ($scope === 'petani') {
        $userId = $user['user_id'];
        $summary = [
            'total_lahan' => (int) fetchValue(
                $pdo,
                'SELECT COUNT(*) FROM lahan WHERE user_id = :user_id AND status_lahan = :status',
                ['user_id' => $userId, 'status' => 'aktif']
            ),
            'total_musim_aktif' => (int) fetchValue(
                $pdo,
                'SELECT COUNT(*)
                 FROM musim_tanam mt
                 INNER JOIN lahan l ON l.id = mt.lahan_id
                 WHERE l.user_id = :user_id AND mt.status <> :status',
                ['user_id' => $userId, 'status' => 'panen_selesai']
            ),
            'total_biaya' => (float) fetchValue(
                $pdo,
                'SELECT COALESCE(SUM(bp.nominal), 0)
                 FROM biaya_produksi bp
                 INNER JOIN musim_tanam mt ON mt.id = bp.musim_tanam_id
                 INNER JOIN lahan l ON l.id = mt.lahan_id
                 WHERE l.user_id = :user_id',
                ['user_id' => $userId]
            ),
            'total_pendapatan' => (float) fetchValue(
                $pdo,
                'SELECT COALESCE(SUM(hp.total_pendapatan), 0)
                 FROM hasil_panen hp
                 INNER JOIN musim_tanam mt ON mt.id = hp.musim_tanam_id
                 INNER JOIN lahan l ON l.id = mt.lahan_id
                 WHERE l.user_id = :user_id',
                ['user_id' => $userId]
            ),
            'total_keuntungan' => (float) fetchValue(
                $pdo,
                'SELECT COALESCE(SUM(hp.total_keuntungan), 0)
                 FROM hasil_panen hp
                 INNER JOIN musim_tanam mt ON mt.id = hp.musim_tanam_id
                 INNER JOIN lahan l ON l.id = mt.lahan_id
                 WHERE l.user_id = :user_id',
                ['user_id' => $userId]
            ),
        ];

        $nearestStatement = $pdo->prepare(
            'SELECT mt.id, mt.estimasi_panen, mt.status, l.nama_lahan, t.nama_tanaman
             FROM musim_tanam mt
             INNER JOIN lahan l ON l.id = mt.lahan_id
             INNER JOIN tanaman t ON t.id = mt.tanaman_id
             WHERE l.user_id = :user_id
               AND mt.status <> :status
               AND mt.estimasi_panen >= CURDATE()
             ORDER BY mt.estimasi_panen ASC
             LIMIT 1'
        );
        $nearestStatement->execute(['user_id' => $userId, 'status' => 'panen_selesai']);

        $recentSeasonStatement = $pdo->prepare(
            'SELECT mt.id, mt.tanggal_tanam, mt.estimasi_panen, mt.status,
                    l.nama_lahan, t.nama_tanaman, t.masa_panen
             FROM musim_tanam mt
             INNER JOIN lahan l ON l.id = mt.lahan_id
             INNER JOIN tanaman t ON t.id = mt.tanaman_id
             WHERE l.user_id = :user_id
             ORDER BY mt.updated_at DESC, mt.id DESC
             LIMIT 5'
        );
        $recentSeasonStatement->execute(['user_id' => $userId]);
        $recentSeasons = $recentSeasonStatement->fetchAll();

        foreach ($recentSeasons as &$season) {
            $season['progress'] = calculateProgress($season['tanggal_tanam'], (int) $season['masa_panen']);
        }
        unset($season);

        $recentLahanStatement = $pdo->prepare(
            'SELECT id, nama_lahan, lokasi, luas_lahan, status_lahan, created_at
             FROM lahan
             WHERE user_id = :user_id
             ORDER BY created_at DESC, id DESC
             LIMIT 5'
        );
        $recentLahanStatement->execute(['user_id' => $userId]);

        $recentBiayaStatement = $pdo->prepare(
            'SELECT bp.id, bp.kategori, bp.nominal, bp.tanggal_biaya,
                    l.nama_lahan, t.nama_tanaman
             FROM biaya_produksi bp
             INNER JOIN musim_tanam mt ON mt.id = bp.musim_tanam_id
             INNER JOIN lahan l ON l.id = mt.lahan_id
             INNER JOIN tanaman t ON t.id = mt.tanaman_id
             WHERE l.user_id = :user_id
             ORDER BY bp.created_at DESC, bp.id DESC
             LIMIT 5'
        );
        $recentBiayaStatement->execute(['user_id' => $userId]);

        $recentPanenStatement = $pdo->prepare(
            'SELECT hp.id, hp.total_pendapatan, hp.total_keuntungan,
                    l.nama_lahan, t.nama_tanaman, hp.created_at
             FROM hasil_panen hp
             INNER JOIN musim_tanam mt ON mt.id = hp.musim_tanam_id
             INNER JOIN lahan l ON l.id = mt.lahan_id
             INNER JOIN tanaman t ON t.id = mt.tanaman_id
             WHERE l.user_id = :user_id
             ORDER BY hp.created_at DESC, hp.id DESC
             LIMIT 5'
        );
        $recentPanenStatement->execute(['user_id' => $userId]);

        sendJson([
            'success' => true,
            'scope' => 'petani',
            'summary' => $summary,
            'panen_terdekat' => $nearestStatement->fetch() ?: null,
            'recent' => [
                'lahan' => $recentLahanStatement->fetchAll(),
                'musim_tanam' => $recentSeasons,
                'biaya' => $recentBiayaStatement->fetchAll(),
                'panen' => $recentPanenStatement->fetchAll(),
            ],
        ]);
    }

    $summary = [
        'total_petani' => (int) fetchValue($pdo, 'SELECT COUNT(*) FROM users WHERE role = :role AND status = :status', ['role' => 'petani', 'status' => 'aktif']),
        'total_lahan' => (int) fetchValue($pdo, 'SELECT COUNT(*) FROM lahan'),
        'total_tanaman_aktif' => (int) fetchValue($pdo, 'SELECT COUNT(*) FROM tanaman WHERE status = :status', ['status' => 'aktif']),
        'total_musim_aktif' => (int) fetchValue($pdo, 'SELECT COUNT(*) FROM musim_tanam WHERE status <> :status', ['status' => 'panen_selesai']),
        'total_hasil_panen' => (int) fetchValue($pdo, 'SELECT COUNT(*) FROM hasil_panen'),
        'total_pendapatan' => (float) fetchValue($pdo, 'SELECT COALESCE(SUM(total_pendapatan), 0) FROM hasil_panen'),
        'total_keuntungan' => (float) fetchValue($pdo, 'SELECT COALESCE(SUM(total_keuntungan), 0) FROM hasil_panen'),
    ];

    $latestUsers = $pdo->query(
        'SELECT id, nama, email, role, status, created_at
         FROM users
         ORDER BY created_at DESC, id DESC
         LIMIT 5'
    )->fetchAll();

    $latestLahan = $pdo->query(
        'SELECT l.id, l.nama_lahan, l.lokasi, l.status_lahan, u.nama AS nama_user, l.created_at
         FROM lahan l
         INNER JOIN users u ON u.id = l.user_id
         ORDER BY l.created_at DESC, l.id DESC
         LIMIT 5'
    )->fetchAll();

    $latestMusim = $pdo->query(
        'SELECT mt.id, mt.tanggal_tanam, mt.estimasi_panen, mt.status,
                l.nama_lahan, t.nama_tanaman, u.nama AS nama_user
         FROM musim_tanam mt
         INNER JOIN lahan l ON l.id = mt.lahan_id
         INNER JOIN tanaman t ON t.id = mt.tanaman_id
         INNER JOIN users u ON u.id = l.user_id
         ORDER BY mt.created_at DESC, mt.id DESC
         LIMIT 5'
    )->fetchAll();

    sendJson([
        'success' => true,
        'scope' => 'admin',
        'summary' => $summary,
        'latest' => [
            'users' => $latestUsers,
            'lahan' => $latestLahan,
            'musim_tanam' => $latestMusim,
        ],
    ]);
} catch (PDOException $error) {
    sendJson(['success' => false, 'message' => 'Gagal mengambil data dashboard.'], 500);
}
