<?php
declare(strict_types=1);

require_once __DIR__ . '/../app/core/bootstrap.php';

$startedAt = microtime(true);

try {
    db()->query('SELECT 1')->fetchColumn();

    agrotrack_json([
        'ok' => true,
        'duration_ms' => round((microtime(true) - $startedAt) * 1000, 2),
        'timestamp' => date(DATE_ATOM),
    ]);
} catch (Throwable $exception) {
    agrotrack_json([
        'ok' => false,
        'duration_ms' => round((microtime(true) - $startedAt) * 1000, 2),
    ], 503);
}
