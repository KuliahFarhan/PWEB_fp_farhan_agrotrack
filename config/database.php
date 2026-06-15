<?php
declare(strict_types=1);

function agrotrack_start_session(): void
{
    if (session_status() !== PHP_SESSION_ACTIVE) {
        session_start();
    }
}

function agrotrack_db(): PDO
{
    static $pdo = null;

    if ($pdo instanceof PDO) {
        return $pdo;
    }

    $host = getenv('AGROTRACK_DB_HOST') ?: getenv('DB_HOST') ?: '127.0.0.1';
    $port = getenv('AGROTRACK_DB_PORT') ?: getenv('DB_PORT') ?: '3306';
    $name = getenv('AGROTRACK_DB_NAME') ?: getenv('DB_DATABASE') ?: 'agrotrack';
    $user = getenv('AGROTRACK_DB_USER') ?: getenv('DB_USERNAME') ?: 'root';
    $pass = getenv('AGROTRACK_DB_PASS') ?: getenv('DB_PASSWORD') ?: '';

    $dsn = "mysql:host={$host};port={$port};dbname={$name};charset=utf8mb4";
    $pdo = new PDO($dsn, $user, $pass, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES => false,
    ]);

    return $pdo;
}

function agrotrack_json(array $payload, int $status = 200): void
{
    http_response_code($status);
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode($payload, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    exit;
}

function agrotrack_request_body(): array
{
    $raw = file_get_contents('php://input');
    $json = json_decode($raw ?: '', true);

    if (is_array($json)) {
        return $json;
    }

    return $_POST;
}

function agrotrack_current_user_id(): ?int
{
    agrotrack_start_session();
    return isset($_SESSION['user_id']) ? (int) $_SESSION['user_id'] : null;
}
