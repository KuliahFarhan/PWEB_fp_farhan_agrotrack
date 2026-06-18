<?php
declare(strict_types=1);

require_once __DIR__ . '/../app/core/bootstrap.php';

$startedAt = microtime(true);
$dbMs = null;

try {
    $dbStart = microtime(true);
    db()->query('SELECT 1')->fetchColumn();
    $dbMs = round((microtime(true) - $dbStart) * 1000, 2);

    agrotrack_json([
        'ok' => true,
        'php_ms' => round((microtime(true) - $startedAt) * 1000, 2),
        'db_ms' => $dbMs,
        'time' => date(DATE_ATOM),
    ]);
} catch (Throwable $exception) {
    agrotrack_json([
        'ok' => false,
        'php_ms' => round((microtime(true) - $startedAt) * 1000, 2),
        'db_ms' => $dbMs,
    ], 503);
}
