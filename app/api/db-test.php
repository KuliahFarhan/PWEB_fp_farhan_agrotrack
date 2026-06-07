<?php

declare(strict_types=1);

header('Content-Type: application/json');

require_once __DIR__ . '/../config/database.php';

try {
    $pdo = getDatabaseConnection();
    $pdo->query('SELECT 1');

    $usersCount = null;
    $tanamanCount = null;

    try {
        $usersCount = (int) $pdo->query('SELECT COUNT(*) AS total FROM users')->fetch()['total'];
        $tanamanCount = (int) $pdo->query('SELECT COUNT(*) AS total FROM tanaman')->fetch()['total'];
    } catch (PDOException $tableError) {
        // Schema may not be imported yet. Keep connection test successful.
    }

    echo json_encode([
        'success' => true,
        'message' => 'Database connection successful.',
        'database' => databaseConfig()['database'],
        'checks' => [
            'select_1' => true,
            'users_count' => $usersCount,
            'tanaman_count' => $tanamanCount,
        ],
    ], JSON_PRETTY_PRINT);
} catch (PDOException $error) {
    http_response_code(500);

    echo json_encode([
        'success' => false,
        'message' => 'Database connection failed.',
        'error' => $error->getMessage(),
    ], JSON_PRETTY_PRINT);
}
