<?php

declare(strict_types=1);

if (!function_exists('table_placeholder')) {
    function table_placeholder(array $headers, array $rows): void
    {
        ?>
        <div class="agro-card overflow-hidden rounded-lg">
            <div class="overflow-x-auto">
                <table class="min-w-full divide-y divide-slate-200 text-sm">
                    <thead class="bg-slate-100 text-left text-xs uppercase tracking-wide text-slate-500">
                        <tr>
                            <?php foreach ($headers as $header) : ?>
                                <th class="px-5 py-3 font-bold"><?= e($header); ?></th>
                            <?php endforeach; ?>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-100 bg-white">
                        <?php foreach ($rows as $row) : ?>
                            <tr>
                                <?php foreach ($row as $cell) : ?>
                                    <td class="px-5 py-4 text-slate-700"><?= e((string) $cell); ?></td>
                                <?php endforeach; ?>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
        <?php
    }
}
