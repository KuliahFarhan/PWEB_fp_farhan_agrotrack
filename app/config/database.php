<?php

declare(strict_types=1);

/**
 * Native PHP PDO database configuration for AgroTrack.
 *
 * Environment variables are optional. If they are not set, local XAMPP-style
 * defaults are used.
 */

function databaseConfig(): array
{
    return [
        'driver' => 'mysql',
        'host' => getenv('DB_HOST') ?: '127.0.0.1',
        'port' => (int) (getenv('DB_PORT') ?: 3306),
        'database' => getenv('DB_DATABASE') ?: 'agrotrack',
        'username' => getenv('DB_USERNAME') ?: 'root',
        'password' => getenv('DB_PASSWORD') ?: '',
        'charset' => getenv('DB_CHARSET') ?: 'utf8mb4',
    ];
}

function getDatabaseConnection(): PDO
{
    static $pdo = null;

    if ($pdo instanceof PDO) {
        return $pdo;
    }

    $config = databaseConfig();
    $dsn = sprintf(
        '%s:host=%s;port=%d;dbname=%s;charset=%s',
        $config['driver'],
        $config['host'],
        $config['port'],
        $config['database'],
        $config['charset']
    );

    $pdo = new PDO($dsn, $config['username'], $config['password'], [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES => false,
        PDO::ATTR_TIMEOUT => 3,
    ]);

    return $pdo;
}
