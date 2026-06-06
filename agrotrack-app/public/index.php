<?php

declare(strict_types=1);

/**
 * AgroTrack native PHP front controller.
 *
 * This file is intentionally minimal for the initial project structure.
 * Authentication, routing dispatch, database access, and business features
 * will be implemented in later tasks.
 */

$appName = 'AgroTrack';

?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars($appName, ENT_QUOTES, 'UTF-8'); ?></title>
</head>
<body>
    <main>
        <h1><?= htmlspecialchars($appName, ENT_QUOTES, 'UTF-8'); ?></h1>
        <p>Native PHP application structure is ready.</p>
    </main>
</body>
</html>
