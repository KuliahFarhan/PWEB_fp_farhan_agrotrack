<?php
declare(strict_types=1);

require_once __DIR__ . '/../../config/database.php';

function perf_timing_enabled(): bool
{
    if ((string) ($_GET['agro_debug'] ?? '') === 'timing') {
        start_app_session();
        $_SESSION['agro_debug_timing_until'] = time() + 300;
        return true;
    }

    if (filter_var(env_value('AGROTRACK_TIMING', '0'), FILTER_VALIDATE_BOOLEAN)) {
        return true;
    }

    return !empty($_SESSION['agro_debug_timing_until']) && (int) $_SESSION['agro_debug_timing_until'] >= time();
}

function perf_mark(string $name): void
{
    if (!perf_timing_enabled()) {
        return;
    }

    $now = microtime(true);
    if (!isset($GLOBALS['agro_perf_start'])) {
        $GLOBALS['agro_perf_start'] = $_SERVER['REQUEST_TIME_FLOAT'] ?? $now;
        $GLOBALS['agro_perf_last'] = $GLOBALS['agro_perf_start'];
        $GLOBALS['agro_perf_marks'] = [];
    }

    $last = (float) ($GLOBALS['agro_perf_last'] ?? $GLOBALS['agro_perf_start']);
    $GLOBALS['agro_perf_marks'][] = [
        'name' => preg_replace('/[^A-Za-z0-9_-]/', '_', $name) ?: 'mark',
        'duration' => max(0, ($now - $last) * 1000),
    ];
    $GLOBALS['agro_perf_last'] = $now;
}

function perf_send_header(): void
{
    if (headers_sent() || !perf_timing_enabled()) {
        return;
    }

    $now = microtime(true);
    $start = (float) ($GLOBALS['agro_perf_start'] ?? ($_SERVER['REQUEST_TIME_FLOAT'] ?? $now));
    $marks = $GLOBALS['agro_perf_marks'] ?? [];
    $parts = [];
    foreach ($marks as $mark) {
        $parts[] = $mark['name'] . ';dur=' . number_format((float) $mark['duration'], 2, '.', '');
    }
    $parts[] = 'total;dur=' . number_format(max(0, ($now - $start) * 1000), 2, '.', '');
    header('Server-Timing: ' . implode(', ', $parts));
}

register_shutdown_function('perf_send_header');

function env_value(string $key, ?string $default = null): ?string
{
    $value = getenv($key);
    if ($value === false) {
        return $default;
    }
    return $value;
}

function db(): PDO
{
    return agrotrack_db();
}

function start_app_session(): void
{
    agrotrack_start_session();
}

function e($value): string
{
    return htmlspecialchars((string) $value, ENT_QUOTES, 'UTF-8');
}

function money_id($value): string
{
    return 'Rp' . number_format((float) $value, 0, ',', '.');
}

function number_id($value, int $decimals = 0): string
{
    return number_format((float) $value, $decimals, ',', '.');
}

function redirect_to(string $path): void
{
    header('Location: ' . $path);
    exit;
}

function base_path(string $path = ''): string
{
    $base = rtrim(env_value('AGROTRACK_BASE_PATH', ''), '/');
    return $base . '/' . ltrim($path, '/');
}

function current_user(): ?array
{
    start_app_session();
    if (empty($_SESSION['user_id'])) {
        return null;
    }

    static $user = null;
    if (is_array($user) && (int) $user['id'] === (int) $_SESSION['user_id']) {
        return $user;
    }

    $stmt = db()->prepare('SELECT * FROM users WHERE id = ? AND status = "aktif" LIMIT 1');
    $stmt->execute([(int) $_SESSION['user_id']]);
    $row = $stmt->fetch();
    $user = $row ?: null;
    return $user;
}

function require_login(?string $role = null): array
{
    $user = current_user();
    if (!$user) {
        redirect_to(base_path('auth/login.php'));
    }

    if ($role !== null && $user['role'] !== $role) {
        http_response_code(403);
        require __DIR__ . '/../../pages/forbidden.php';
        exit;
    }

    return $user;
}

function csrf_token(): string
{
    start_app_session();
    if (empty($_SESSION['csrf_token'])) {
        $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
    }
    return $_SESSION['csrf_token'];
}

function verify_csrf(): void
{
    start_app_session();
    $token = $_POST['csrf_token'] ?? '';
    if (!is_string($token) || !hash_equals($_SESSION['csrf_token'] ?? '', $token)) {
        throw new RuntimeException('Token form tidak valid. Muat ulang halaman dan coba lagi.');
    }
}

function flash(?string $key = null, ?string $message = null): ?string
{
    start_app_session();
    if ($key !== null && $message !== null) {
        $_SESSION['flash'][$key] = $message;
        return null;
    }
    if ($key === null) {
        return null;
    }
    $value = $_SESSION['flash'][$key] ?? null;
    unset($_SESSION['flash'][$key]);
    return $value;
}

function request_method(): string
{
    return strtoupper($_SERVER['REQUEST_METHOD'] ?? 'GET');
}

function post_string(string $key, int $max = 255): string
{
    $value = trim((string) ($_POST[$key] ?? ''));
    return substr($value, 0, $max);
}

function post_float(string $key): float
{
    $value = $_POST[$key] ?? null;
    if (!is_numeric($value)) {
        throw new InvalidArgumentException('Nilai ' . $key . ' harus angka.');
    }
    return (float) $value;
}

function post_int(string $key): int
{
    $value = filter_var($_POST[$key] ?? null, FILTER_VALIDATE_INT);
    if ($value === false || $value === null) {
        throw new InvalidArgumentException('Nilai ' . $key . ' tidak valid.');
    }
    return (int) $value;
}

function option_selected($a, $b): string
{
    return (string) $a === (string) $b ? 'selected' : '';
}

function status_label(string $status): string
{
    return ucwords(str_replace('_', ' ', $status));
}

function save_uploaded_profile_photo(string $field, string $fallback = 'assets/image/profil/farmer-profile.jpg'): string
{
    if (empty($_FILES[$field]) || !is_array($_FILES[$field]) || (int) ($_FILES[$field]['error'] ?? UPLOAD_ERR_NO_FILE) === UPLOAD_ERR_NO_FILE) {
        return $fallback;
    }

    $file = $_FILES[$field];
    if ((int) ($file['error'] ?? UPLOAD_ERR_NO_FILE) !== UPLOAD_ERR_OK) {
        throw new RuntimeException('Upload foto profil gagal.');
    }

    $tmp = (string) ($file['tmp_name'] ?? '');
    if ($tmp === '' || !is_uploaded_file($tmp)) {
        throw new RuntimeException('File foto profil tidak valid.');
    }

    $mime = mime_content_type($tmp) ?: '';
    $extByMime = [
        'image/jpeg' => 'jpg',
        'image/png' => 'png',
        'image/webp' => 'webp',
    ];
    if (!isset($extByMime[$mime])) {
        throw new RuntimeException('Foto profil harus berupa JPG, PNG, atau WEBP.');
    }

    $uploadDir = dirname(__DIR__, 2) . '/assets/uploads/profile';
    if (!is_dir($uploadDir) && !mkdir($uploadDir, 0775, true) && !is_dir($uploadDir)) {
        throw new RuntimeException('Folder upload foto profil tidak dapat dibuat.');
    }

    $filename = 'profile-' . date('Ymd-His') . '-' . bin2hex(random_bytes(4)) . '.' . $extByMime[$mime];
    $target = $uploadDir . '/' . $filename;
    if (!move_uploaded_file($tmp, $target)) {
        throw new RuntimeException('Foto profil gagal disimpan.');
    }

    return 'assets/uploads/profile/' . $filename;
}
