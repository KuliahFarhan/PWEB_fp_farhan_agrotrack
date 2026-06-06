<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= e($title); ?> | AgroTrack</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="<?= e(asset_path('css/app.css')); ?>">
</head>
<body class="font-sans text-slate-800 antialiased">
    <div class="agro-shell flex min-h-screen flex-col">
        <?php require dirname(__DIR__) . '/partials/navbar.php'; ?>
        <main class="flex-1">
            <?= $content; ?>
        </main>
        <?php require dirname(__DIR__) . '/partials/guest-footer.php'; ?>
    </div>
    <script src="<?= e(asset_path('js/app.js')); ?>"></script>
</body>
</html>
