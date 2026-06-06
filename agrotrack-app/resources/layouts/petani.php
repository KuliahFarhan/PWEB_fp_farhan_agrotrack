<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= e($title); ?> | AgroTrack Petani</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="<?= e(asset_path('css/app.css')); ?>">
</head>
<body class="bg-slate-50 font-sans text-slate-800 antialiased">
    <div class="min-h-screen lg:flex">
        <?php require dirname(__DIR__) . '/partials/petani-sidebar.php'; ?>
        <div class="min-w-0 flex-1">
            <header class="sticky top-0 z-20 border-b border-slate-200 bg-white/90 px-5 py-4 backdrop-blur lg:px-8">
                <div class="flex flex-wrap items-center justify-between gap-3">
                    <div>
                        <p class="text-xs font-semibold uppercase tracking-[0.24em] text-teal-700">Area Petani</p>
                        <h1 class="text-2xl font-bold text-slate-950"><?= e($title); ?></h1>
                    </div>
                    <a href="<?= e(url_for('landing')); ?>" class="rounded-md border border-slate-200 px-4 py-2 text-sm font-semibold text-slate-600 hover:bg-slate-100">Preview Home</a>
                </div>
            </header>
            <main class="px-5 py-6 lg:px-8">
                <?= $content; ?>
            </main>
        </div>
    </div>
    <script src="<?= e(asset_path('js/app.js')); ?>"></script>
</body>
</html>
