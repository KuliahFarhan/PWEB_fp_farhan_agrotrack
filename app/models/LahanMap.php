<?php
declare(strict_types=1);

final class LahanMap
{
    public static function listForUser(PDO $db, int $userId): array
    {
        $stmt = $db->prepare(
            'SELECT id, nama_lahan, luas, komoditas, status, latitude, longitude, polygon_area, luas_lahan
             FROM lahan
             WHERE user_id = :user_id
             ORDER BY nama_lahan ASC'
        );
        $stmt->execute(['user_id' => $userId]);

        return array_map([self::class, 'decodePolygon'], $stmt->fetchAll());
    }

    public static function findForUser(PDO $db, int $userId, int $lahanId): ?array
    {
        $stmt = $db->prepare(
            'SELECT id, nama_lahan, luas, komoditas, status, latitude, longitude, polygon_area, luas_lahan
             FROM lahan
             WHERE id = :id AND user_id = :user_id
             LIMIT 1'
        );
        $stmt->execute([
            'id' => $lahanId,
            'user_id' => $userId,
        ]);

        $row = $stmt->fetch();
        return $row ? self::decodePolygon($row) : null;
    }

    public static function savePolygon(PDO $db, int $userId, int $lahanId, array $data): bool
    {
        $stmt = $db->prepare(
            'UPDATE lahan
             SET latitude = :latitude,
                 longitude = :longitude,
                 polygon_area = :polygon_area,
                 luas_lahan = :luas_lahan
             WHERE id = :id AND user_id = :user_id'
        );

        $stmt->execute([
            'latitude' => $data['latitude'],
            'longitude' => $data['longitude'],
            'polygon_area' => $data['polygon_area'],
            'luas_lahan' => $data['luas_lahan'],
            'id' => $lahanId,
            'user_id' => $userId,
        ]);

        return $stmt->rowCount() > 0;
    }

    public static function resetPolygon(PDO $db, int $userId, int $lahanId): bool
    {
        $stmt = $db->prepare(
            'UPDATE lahan
             SET latitude = NULL,
                 longitude = NULL,
                 polygon_area = NULL,
                 luas_lahan = NULL
             WHERE id = :id AND user_id = :user_id'
        );

        $stmt->execute([
            'id' => $lahanId,
            'user_id' => $userId,
        ]);

        return $stmt->rowCount() > 0;
    }

    private static function decodePolygon(array $row): array
    {
        if (!empty($row['polygon_area']) && is_string($row['polygon_area'])) {
            $decoded = json_decode($row['polygon_area'], true);
            $row['polygon_area'] = is_array($decoded) ? $decoded : null;
        }

        if (isset($row['latitude'])) {
            $row['latitude'] = $row['latitude'] !== null ? (float) $row['latitude'] : null;
        }

        if (isset($row['longitude'])) {
            $row['longitude'] = $row['longitude'] !== null ? (float) $row['longitude'] : null;
        }

        if (isset($row['luas_lahan'])) {
            $row['luas_lahan'] = $row['luas_lahan'] !== null ? (float) $row['luas_lahan'] : null;
        }

        return $row;
    }
}
