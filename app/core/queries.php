<?php
declare(strict_types=1);

function petani_summary(int $userId): array
{
    $stmt = db()->prepare(
        'SELECT
          (SELECT COUNT(*) FROM lahan WHERE user_id = :uid) AS total_lahan,
          (SELECT COALESCE(SUM(COALESCE(luas_lahan / 10000, luas)), 0) FROM lahan WHERE user_id = :uid) AS total_luas_ha,
          (SELECT COUNT(*) FROM musim_tanam WHERE user_id = :uid AND status = "aktif") AS musim_aktif,
          (SELECT COALESCE(SUM(total_biaya), 0) FROM biaya_produksi WHERE user_id = :uid) AS total_biaya,
          (SELECT COALESCE(SUM(total_pendapatan), 0) FROM hasil_panen WHERE user_id = :uid) AS total_pendapatan'
    );
    $stmt->execute(['uid' => $userId]);
    $row = $stmt->fetch() ?: [];
    $row['total_profit'] = (float) ($row['total_pendapatan'] ?? 0) - (float) ($row['total_biaya'] ?? 0);
    return $row;
}

function admin_summary(): array
{
    $stmt = db()->query(
        'SELECT
          (SELECT COUNT(*) FROM users WHERE status = "aktif") AS total_users,
          (SELECT COUNT(*) FROM users WHERE role = "petani") AS total_petani,
          (SELECT COALESCE(SUM(COALESCE(luas_lahan / 10000, luas)), 0) FROM lahan) AS total_luas_ha,
          (SELECT COUNT(*) FROM musim_tanam WHERE status = "aktif") AS musim_aktif,
          (SELECT COALESCE(SUM(berat_kg), 0) FROM hasil_panen) AS total_panen_kg,
          (SELECT COALESCE(SUM(total_biaya), 0) FROM biaya_produksi) AS total_biaya,
          (SELECT COALESCE(SUM(total_pendapatan), 0) FROM hasil_panen) AS total_pendapatan'
    );
    $row = $stmt->fetch() ?: [];
    $row['total_profit'] = (float) ($row['total_pendapatan'] ?? 0) - (float) ($row['total_biaya'] ?? 0);
    return $row;
}

function user_lahan(int $userId): array
{
    $stmt = db()->prepare('SELECT l.*, t.nama AS tanaman_nama FROM lahan l LEFT JOIN tanaman t ON t.id = l.tanaman_id WHERE l.user_id = ? ORDER BY l.created_at DESC');
    $stmt->execute([$userId]);
    return $stmt->fetchAll();
}

function active_tanaman(): array
{
    return db()->query('SELECT * FROM tanaman WHERE status = "aktif" ORDER BY nama ASC')->fetchAll();
}

function user_musim(int $userId): array
{
    $stmt = db()->prepare(
        'SELECT mt.*, l.nama_lahan, t.nama AS tanaman_nama, t.masa_panen_hari,
          COALESCE((SELECT SUM(total_biaya) FROM biaya_produksi b WHERE b.musim_tanam_id = mt.id), 0) AS total_biaya,
          COALESCE((SELECT SUM(total_pendapatan) FROM hasil_panen h WHERE h.musim_tanam_id = mt.id), 0) AS total_pendapatan
         FROM musim_tanam mt
         JOIN lahan l ON l.id = mt.lahan_id
         LEFT JOIN tanaman t ON t.id = mt.tanaman_id
         WHERE mt.user_id = ?
         ORDER BY mt.tanggal_tanam DESC'
    );
    $stmt->execute([$userId]);
    return $stmt->fetchAll();
}

function calculate_progress(string $tanggalTanam, int $masaPanen): int
{
    $start = new DateTimeImmutable($tanggalTanam);
    $today = new DateTimeImmutable('today');
    $days = max(0, (int) $start->diff($today)->format('%r%a'));
    return max(0, min(100, (int) round(($days / max(1, $masaPanen)) * 100)));
}

function phase_from_progress(int $progress): string
{
    if ($progress >= 100) return 'Siap Panen';
    if ($progress >= 55) return 'Pertumbuhan';
    if ($progress >= 15) return 'Pertumbuhan Awal';
    return 'Persemaian';
}
