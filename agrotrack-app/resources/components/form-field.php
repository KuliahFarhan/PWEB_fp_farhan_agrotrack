<?php

declare(strict_types=1);

if (!function_exists('form_field')) {
    function form_field(string $label, string $name, string $type = 'text', string $placeholder = ''): void
    {
        ?>
        <label class="grid gap-2">
            <span class="text-sm font-semibold text-slate-700"><?= e($label); ?></span>
            <input type="<?= e($type); ?>" name="<?= e($name); ?>" placeholder="<?= e($placeholder); ?>" class="rounded-md border border-slate-200 bg-white px-4 py-3 text-sm outline-none transition focus:border-teal-600 focus:ring-4 focus:ring-teal-100">
        </label>
        <?php
    }
}
