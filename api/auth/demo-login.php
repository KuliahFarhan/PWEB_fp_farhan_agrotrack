<?php
declare(strict_types=1);

require_once __DIR__ . '/../../config/database.php';

agrotrack_start_session();

$body = agrotrack_request_body();
$role = ($body['role'] ?? 'petani') === 'admin' ? 'admin' : 'petani';
$name = $role === 'admin' ? 'Admin Root' : 'Budi Santoso';
$email = $role === 'admin' ? 'admin@agrotrack.test' : 'petani@agrotrack.test';

try {
    $db = agrotrack_db();
    $stmt = $db->prepare('SELECT id FROM users WHERE email = :email LIMIT 1');
    $stmt->execute(['email' => $email]);
    $userId = $stmt->fetchColumn();

    if (!$userId) {
        $insert = $db->prepare(
            'INSERT INTO users (name, email, profile_photo, role, password_hash, created_at, updated_at)
             VALUES (:name, :email, :profile_photo, :role, :password_hash, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)'
        );
        $insert->execute([
            'name' => $name,
            'email' => $email,
            'profile_photo' => $role === 'admin'
                ? 'assets/image/profil/foto_profil_6.jpg'
                : 'assets/image/profil/farmer-profile.jpg',
            'role' => $role,
            'password_hash' => password_hash('12345678', PASSWORD_DEFAULT),
        ]);
        $userId = (int) $db->lastInsertId();
    }

    $_SESSION['user_id'] = (int) $userId;
    $_SESSION['role'] = $role;
    $_SESSION['name'] = $name;

    agrotrack_json([
        'ok' => true,
        'message' => 'Sesi demo berhasil dibuat.',
        'data' => [
            'user_id' => (int) $userId,
            'role' => $role,
        ],
    ]);
} catch (Throwable $error) {
    agrotrack_json([
        'ok' => false,
        'message' => 'Login demo gagal. Pastikan database dan migrasi sudah dijalankan.',
    ], 500);
}
