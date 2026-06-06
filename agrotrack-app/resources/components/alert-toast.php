<?php

declare(strict_types=1);

if (!function_exists('alert_toast')) {
    function alert_toast(string $message, string $tone = 'info'): void
    {
        $classes = [
            'info' => 'border-blue-200 bg-blue-50 text-blue-800',
            'success' => 'border-teal-200 bg-teal-50 text-teal-800',
            'warning' => 'border-yellow-200 bg-yellow-50 text-yellow-900',
        ];
        ?>
        <div data-static-toast class="mb-5 flex items-center justify-between gap-4 rounded-lg border px-4 py-3 text-sm <?= e($classes[$tone] ?? $classes['info']); ?>">
            <span><?= e($message); ?></span>
            <button type="button" data-static-toast-close class="font-bold">Tutup</button>
        </div>
        <?php
    }
}
