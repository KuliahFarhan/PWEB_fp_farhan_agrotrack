<?php
declare(strict_types=1);

require_once __DIR__ . '/../models/LahanMap.php';

final class LahanMapController
{
    private $db;
    private $userId;

    public function __construct(PDO $db, int $userId)
    {
        $this->db = $db;
        $this->userId = $userId;
    }

    public function handle(string $method): void
    {
        try {
            if ($method === 'GET') {
                $this->show();
                return;
            }

            if ($method === 'POST') {
                $this->store();
                return;
            }

            if ($method === 'DELETE') {
                $this->destroy();
                return;
            }

            agrotrack_json(['ok' => false, 'message' => 'Method tidak didukung.'], 405);
        } catch (InvalidArgumentException $error) {
            agrotrack_json(['ok' => false, 'message' => $error->getMessage()], 422);
        } catch (Throwable $error) {
            agrotrack_json(['ok' => false, 'message' => 'Terjadi kesalahan server.'], 500);
        }
    }

    private function show(): void
    {
        $lahanId = isset($_GET['lahan_id']) ? (int) $_GET['lahan_id'] : 0;

        if ($lahanId <= 0) {
            agrotrack_json([
                'ok' => true,
                'data' => LahanMap::listForUser($this->db, $this->userId),
            ]);
        }

        $lahan = LahanMap::findForUser($this->db, $this->userId, $lahanId);

        if (!$lahan) {
            agrotrack_json(['ok' => false, 'message' => 'Lahan tidak ditemukan untuk akun ini.'], 404);
        }

        agrotrack_json(['ok' => true, 'data' => $lahan]);
    }

    private function store(): void
    {
        $body = agrotrack_request_body();
        $lahanId = $this->requirePositiveInt($body['lahan_id'] ?? null, 'Lahan belum dipilih.');

        if (!LahanMap::findForUser($this->db, $this->userId, $lahanId)) {
            agrotrack_json(['ok' => false, 'message' => 'Lahan bukan milik akun yang sedang login.'], 403);
        }

        $latitude = $this->requireFloatInRange($body['latitude'] ?? null, -90, 90, 'Latitude tidak valid.');
        $longitude = $this->requireFloatInRange($body['longitude'] ?? null, -180, 180, 'Longitude tidak valid.');
        $area = $this->requireFloatInRange($body['luas_lahan'] ?? null, 1, 999999999, 'Luas polygon tidak valid.');
        $polygon = $this->validatePolygon($body['polygon_area'] ?? null);

        LahanMap::savePolygon($this->db, $this->userId, $lahanId, [
            'latitude' => $latitude,
            'longitude' => $longitude,
            'polygon_area' => json_encode($polygon, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES),
            'luas_lahan' => $area,
        ]);

        agrotrack_json([
            'ok' => true,
            'message' => 'Polygon lahan berhasil disimpan.',
            'data' => [
                'lahan_id' => $lahanId,
                'latitude' => $latitude,
                'longitude' => $longitude,
                'luas_lahan' => $area,
                'luas_hektar' => $area / 10000,
            ],
        ]);
    }

    private function destroy(): void
    {
        $lahanId = isset($_GET['lahan_id']) ? (int) $_GET['lahan_id'] : 0;

        if ($lahanId <= 0) {
            $body = agrotrack_request_body();
            $lahanId = $this->requirePositiveInt($body['lahan_id'] ?? null, 'Lahan belum dipilih.');
        }

        if (!LahanMap::findForUser($this->db, $this->userId, $lahanId)) {
            agrotrack_json(['ok' => false, 'message' => 'Lahan bukan milik akun yang sedang login.'], 403);
        }

        LahanMap::resetPolygon($this->db, $this->userId, $lahanId);
        agrotrack_json(['ok' => true, 'message' => 'Polygon lahan berhasil direset.']);
    }

    private function requirePositiveInt($value, string $message): int
    {
        $int = filter_var($value, FILTER_VALIDATE_INT);

        if ($int === false || $int <= 0) {
            throw new InvalidArgumentException($message);
        }

        return $int;
    }

    private function requireFloatInRange($value, float $min, float $max, string $message): float
    {
        if (!is_numeric($value)) {
            throw new InvalidArgumentException($message);
        }

        $float = (float) $value;

        if ($float < $min || $float > $max) {
            throw new InvalidArgumentException($message);
        }

        return $float;
    }

    private function validatePolygon($polygon): array
    {
        if (is_string($polygon)) {
            $polygon = json_decode($polygon, true);
        }

        if (!is_array($polygon) || ($polygon['type'] ?? null) !== 'Polygon') {
            throw new InvalidArgumentException('Polygon belum digambar.');
        }

        $ring = $polygon['coordinates'][0] ?? null;

        if (!is_array($ring) || count($ring) < 4) {
            throw new InvalidArgumentException('Polygon minimal memiliki 3 titik.');
        }

        foreach ($ring as $point) {
            if (!is_array($point) || count($point) < 2 || !is_numeric($point[0]) || !is_numeric($point[1])) {
                throw new InvalidArgumentException('Koordinat polygon tidak valid.');
            }

            $lng = (float) $point[0];
            $lat = (float) $point[1];

            if ($lng < -180 || $lng > 180 || $lat < -90 || $lat > 90) {
                throw new InvalidArgumentException('Koordinat polygon di luar rentang peta.');
            }
        }

        return $polygon;
    }
}
