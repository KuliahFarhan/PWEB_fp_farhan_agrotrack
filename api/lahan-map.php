<?php
declare(strict_types=1);

require_once __DIR__ . '/../config/database.php';
require_once __DIR__ . '/../app/controllers/LahanMapController.php';

agrotrack_start_session();

$userId = agrotrack_current_user_id();

if (!$userId) {
    agrotrack_json([
        'ok' => false,
        'message' => 'Sesi login tidak ditemukan. Silakan masuk terlebih dahulu.',
    ], 401);
}

$stmt = agrotrack_db()->prepare('SELECT role FROM users WHERE id = ? AND status = "aktif" LIMIT 1');
$stmt->execute([$userId]);
$user = $stmt->fetch();
if (!$user || $user['role'] !== 'petani') {
    agrotrack_json([
        'ok' => false,
        'message' => 'API peta hanya tersedia untuk akun petani.',
    ], 403);
}

$controller = new LahanMapController(agrotrack_db(), $userId);
$controller->handle($_SERVER['REQUEST_METHOD'] ?? 'GET');
