<div class="mb-5 flex flex-wrap items-center justify-between gap-3">
    <div>
        <h2 class="text-xl font-black text-slate-950">Data Pengguna</h2>
        <p class="text-sm text-slate-500">Admin dapat melihat pengguna dan status akun. Data masih dummy.</p>
    </div>
    <button class="rounded-md border border-slate-200 px-4 py-2 text-sm font-bold text-slate-600">Filter Role</button>
</div>
<?php
table_placeholder(
    ['Nama', 'Email', 'Nomor HP', 'Role', 'Status', 'Jumlah Lahan'],
    [
        ['Siti Petani', 'siti@agrotrack.test', '081234567890', 'petani', 'aktif', '4'],
        ['Budi Petani', 'budi@agrotrack.test', '082233445566', 'petani', 'aktif', '2'],
        ['Admin Demo', 'admin@agrotrack.test', '-', 'admin', 'aktif', '-'],
    ]
);
?>
