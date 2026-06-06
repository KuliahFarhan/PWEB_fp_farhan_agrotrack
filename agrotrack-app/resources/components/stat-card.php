<?php

declare(strict_types=1);

if (!function_exists('stat_card')) {
    function stat_card(string $label, string $value, string $note = '', string $tone = 'teal'): void
    {
        $toneClasses = [
            'teal' => 'bg-teal-50 text-teal-900 ring-teal-100',
            'yellow' => 'bg-yellow-50 text-yellow-900 ring-yellow-100',
            'blue' => 'bg-blue-50 text-blue-900 ring-blue-100',
            'red' => 'bg-red-50 text-red-900 ring-red-100',
            'slate' => 'bg-slate-50 text-slate-900 ring-slate-100',
        ];
        $classes = $toneClasses[$tone] ?? $toneClasses['teal'];
        ?>
        <article class="agro-card rounded-lg p-5 ring-1 <?= e($classes); ?>">
            <p class="text-sm font-semibold text-slate-500"><?= e($label); ?></p>
            <div class="mt-3 text-3xl font-black"><?= e($value); ?></div>
            <?php if ($note !== '') : ?>
                <p class="mt-2 text-sm text-slate-500"><?= e($note); ?></p>
            <?php endif; ?>
        </article>
        <?php
    }
}
