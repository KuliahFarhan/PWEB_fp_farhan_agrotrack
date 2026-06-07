<?php

declare(strict_types=1);

header('Content-Type: application/json');

require_once __DIR__ . '/../auth/guard.php';

$user = currentUser();

if (!$user) {
    echo json_encode([
        'authenticated' => false,
    ], JSON_PRETTY_PRINT);
    exit;
}

echo json_encode([
    'authenticated' => true,
    'user' => $user,
], JSON_PRETTY_PRINT);
