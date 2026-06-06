<?php

declare(strict_types=1);

if (!function_exists('confirmation_modal')) {
    function confirmation_modal(string $title = 'Konfirmasi hapus', string $message = 'Data ini belum akan dihapus pada UI statis.'): void
    {
        ?>
        <section class="agro-card rounded-lg p-5">
            <p class="text-xs font-bold uppercase tracking-[0.2em] text-red-600">Modal Placeholder</p>
            <h2 class="mt-2 text-lg font-bold text-slate-950"><?= e($title); ?></h2>
            <p class="mt-2 text-sm text-slate-500"><?= e($message); ?></p>
            <div class="mt-4 flex gap-2">
                <button class="rounded-md bg-red-600 px-4 py-2 text-sm font-bold text-white">Hapus</button>
                <button class="rounded-md border border-slate-200 px-4 py-2 text-sm font-bold text-slate-600">Batal</button>
            </div>
        </section>
        <?php
    }
}
