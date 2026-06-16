<?php
declare(strict_types=1);
require_once __DIR__ . '/../../app/core/bootstrap.php';
require_once __DIR__ . '/../../app/core/layout.php';
require_once __DIR__ . '/../../app/core/queries.php';

$user = require_login('admin');
$error = null;
$categories = katalog_categories();

if (request_method() === 'POST') {
    try {
        verify_csrf();
        $id = post_int('id');
        $hargaMin = $_POST['harga_min'] === '' ? null : post_float('harga_min');
        $hargaMax = $_POST['harga_max'] === '' ? null : post_float('harga_max');
        $kategori = post_string('kategori', 80);
        if (!in_array($kategori, $categories, true)) {
            throw new RuntimeException('Kategori tidak valid.');
        }
        $stmt = db()->prepare(
            'UPDATE katalog_items
             SET nama=?, kategori=?, subkategori=?, image_path=?, fase=?, jenis_biaya=?, mode_biaya=?, satuan_default=?,
                 harga_min=?, harga_max=?, harga_status=?, fungsi=?, keterangan=?, risiko=?, detail_json=?, is_active=?
             WHERE id=?'
        );
        $stmt->execute([
            post_string('nama', 160),
            $kategori,
            post_string('subkategori', 120),
            post_string('image_path', 255),
            post_string('fase', 120),
            post_string('jenis_biaya', 80),
            post_string('mode_biaya', 80),
            post_string('satuan_default', 40),
            $hargaMin,
            $hargaMax,
            post_string('harga_status', 80),
            post_string('fungsi', 2000),
            post_string('keterangan', 2000),
            post_string('risiko', 2000),
            trim((string) ($_POST['detail_json'] ?? '')) !== '' ? trim((string) $_POST['detail_json']) : null,
            isset($_POST['is_active']) ? 1 : 0,
            $id,
        ]);
        flash('success', 'Katalog kebutuhan berhasil diperbarui.');
        redirect_to('katalog-kebutuhan.php?kategori=' . urlencode($kategori) . '&edit=' . $id);
    } catch (Throwable $e) {
        $error = $e->getMessage();
    }
}

$countStmt = db()->query('SELECT kategori, COUNT(*) total, SUM(is_active=1) aktif FROM katalog_items GROUP BY kategori');
$categoryCounts = array_fill_keys($categories, ['total' => 0, 'aktif' => 0]);
foreach ($countStmt->fetchAll() as $row) {
    $categoryCounts[$row['kategori']] = ['total' => (int) $row['total'], 'aktif' => (int) $row['aktif']];
}

$requestedCategory = trim((string) ($_GET['kategori'] ?? ''));
$category = in_array($requestedCategory, $categories, true) ? $requestedCategory : $categories[0];
$q = trim((string) ($_GET['q'] ?? ''));
$where = ['kategori = ?'];
$params = [$category];
if ($q !== '') {
    $where[] = '(nama LIKE ? OR subkategori LIKE ? OR fungsi LIKE ?)';
    array_push($params, '%' . $q . '%', '%' . $q . '%', '%' . $q . '%');
}
$stmt = db()->prepare('SELECT * FROM katalog_items WHERE ' . implode(' AND ', $where) . ' ORDER BY is_active DESC, nama ASC');
$stmt->execute($params);
$items = $stmt->fetchAll();

$editId = filter_var($_GET['edit'] ?? null, FILTER_VALIDATE_INT);
$selectedItem = null;
foreach ($items as $item) {
    if ($editId && (int) $item['id'] === $editId) {
        $selectedItem = $item;
        break;
    }
}
$selectedItem ??= $items[0] ?? null;
$categoryIcons = [
    'Benih & Bibit' => 'eco', 'Pupuk & Nutrisi' => 'compost', 'Pembenah Tanah' => 'terrain',
    'Perlindungan Tanaman' => 'health_and_safety', 'Air & Irigasi' => 'water_drop',
    'Persiapan Lahan' => 'agriculture', 'Tenaga Kerja' => 'engineering', 'Alat & Mesin' => 'precision_manufacturing',
    'Bahan Pendukung' => 'inventory_2', 'Panen' => 'agriculture', 'Pascapanen' => 'warehouse',
    'Transportasi & Logistik' => 'local_shipping', 'Modal & Administrasi' => 'account_balance_wallet', 'Risiko / Kerugian' => 'warning',
];
?>
<!doctype html>
<html lang="id">
<head><?php render_head('AgroTrack - Katalog Kebutuhan'); ?></head>
<body data-portal="admin" data-active="katalog" data-base="../../">
<?php render_sidebar($user, 'katalog'); ?>
<main class="app-main">
  <div class="topbar"><div><h1 class="page-title">Katalog Kebutuhan</h1><p class="page-kicker">Edit master kebutuhan petani dengan navigasi kategori 1-14.</p></div></div>
  <?php render_flash(); if ($error): ?><div class="alert alert-danger"><?= e($error) ?></div><?php endif; ?>
  <?php render_page_help('Mengelola katalog kebutuhan', ['Pilih kategori dari sidebar.', 'Klik Edit pada item yang ingin diubah.', 'Perbarui detail, harga, risiko, dan status aktif lalu simpan.'], 'Item aktif akan muncul di Katalog Operasional petani.', 'laporan.php', 'Lihat Laporan'); ?>

  <section class="katalog-shell">
    <aside class="katalog-sidebar">
      <div class="katalog-sidebar-head"><span class="material-symbols-outlined">category</span><div><strong>Kategori</strong><small><?= e(array_sum(array_column($categoryCounts, 'total'))) ?> item</small></div></div>
      <nav class="katalog-category-list" aria-label="Kategori katalog admin">
        <?php foreach ($categories as $index => $cat): ?>
          <a class="katalog-category-link <?= $cat === $category ? 'active' : '' ?>" href="?kategori=<?= e(urlencode($cat)) ?>">
            <span class="katalog-category-index"><?= e($index + 1) ?></span>
            <span class="material-symbols-outlined"><?= e($categoryIcons[$cat] ?? 'category') ?></span>
            <span class="katalog-category-name"><?= e($cat) ?></span>
            <strong><?= e($categoryCounts[$cat]['aktif']) ?>/<?= e($categoryCounts[$cat]['total']) ?></strong>
          </a>
        <?php endforeach; ?>
      </nav>
    </aside>

    <div class="katalog-content">
      <section class="admin-panel admin-filter-panel katalog-focus-panel mb-3">
        <div><span class="asset-tag">Kategori aktif</span><h2 class="section-title mb-1"><?= e($category) ?></h2><p class="text-secondary mb-0"><?= e(count($items)) ?> item tampil.</p></div>
        <form class="row g-3 align-items-end" method="get">
          <input type="hidden" name="kategori" value="<?= e($category) ?>" />
          <div class="col-md-9"><label class="form-label fw-semibold">Cari Item</label><input class="form-control" name="q" value="<?= e($q) ?>" placeholder="Cari nama, subkategori, fungsi..." /></div>
          <div class="col-md-3 d-grid"><button class="btn btn-primary" type="submit"><span class="material-symbols-outlined">search</span> Cari</button></div>
        </form>
      </section>

      <section class="row g-3">
        <div class="col-xl-5">
          <div class="panel h-100">
            <h2 class="section-title">Daftar Item</h2>
            <div class="katalog-admin-list">
              <?php foreach ($items as $item): ?>
                <a class="katalog-admin-row <?= $selectedItem && (int) $selectedItem['id'] === (int) $item['id'] ? 'active' : '' ?>" href="?kategori=<?= e(urlencode($category)) ?>&q=<?= e(urlencode($q)) ?>&edit=<?= e($item['id']) ?>">
                  <img src="../../<?= e(katalog_asset_path($item)) ?>" alt="<?= e($item['nama']) ?>" />
                  <span><strong><?= e($item['nama']) ?></strong><small><?= e($item['subkategori'] ?: $item['fase']) ?></small></span>
                  <em><?= (int) $item['is_active'] === 1 ? 'Aktif' : 'Nonaktif' ?></em>
                </a>
              <?php endforeach; ?>
              <?php if (!$items): ?><p class="text-secondary mb-0">Tidak ada item pada filter ini.</p><?php endif; ?>
            </div>
          </div>
        </div>
        <div class="col-xl-7">
          <div class="panel h-100">
            <h2 class="section-title">Editor Item</h2>
            <?php if ($selectedItem): ?>
              <form class="katalog-editor-form" method="post">
                <input type="hidden" name="csrf_token" value="<?= e(csrf_token()) ?>" />
                <input type="hidden" name="id" value="<?= e($selectedItem['id']) ?>" />
                <div class="input-with-preview mb-3"><img src="../../<?= e(katalog_asset_path($selectedItem)) ?>" alt="<?= e($selectedItem['nama']) ?>" /><div><strong><?= e($selectedItem['nama']) ?></strong><p class="text-secondary mb-0"><?= e($selectedItem['sumber_dokumen'] ?: 'Katalog AgroTrack') ?></p></div></div>
                <div class="row g-3">
                  <div class="col-md-7"><label class="form-label">Nama</label><input class="form-control" name="nama" value="<?= e($selectedItem['nama']) ?>" required /></div>
                  <div class="col-md-5"><label class="form-label">Kategori</label><select class="form-select" name="kategori"><?php foreach ($categories as $cat): ?><option value="<?= e($cat) ?>" <?= option_selected($selectedItem['kategori'], $cat) ?>><?= e($cat) ?></option><?php endforeach; ?></select></div>
                  <div class="col-md-6"><label class="form-label">Subkategori</label><input class="form-control" name="subkategori" value="<?= e($selectedItem['subkategori']) ?>" /></div>
                  <div class="col-md-6"><label class="form-label">Path Gambar</label><input class="form-control" name="image_path" value="<?= e($selectedItem['image_path']) ?>" /></div>
                  <div class="col-md-6"><label class="form-label">Fase</label><input class="form-control" name="fase" value="<?= e($selectedItem['fase']) ?>" /></div>
                  <div class="col-md-6"><label class="form-label">Jenis Biaya</label><input class="form-control" name="jenis_biaya" value="<?= e($selectedItem['jenis_biaya']) ?>" /></div>
                  <div class="col-md-4"><label class="form-label">Mode</label><input class="form-control" name="mode_biaya" value="<?= e($selectedItem['mode_biaya']) ?>" /></div>
                  <div class="col-md-4"><label class="form-label">Satuan</label><input class="form-control" name="satuan_default" value="<?= e($selectedItem['satuan_default']) ?>" /></div>
                  <div class="col-md-4"><label class="form-label">Status Harga</label><input class="form-control" name="harga_status" value="<?= e($selectedItem['harga_status']) ?>" /></div>
                  <div class="col-md-6"><label class="form-label">Harga Min</label><input class="form-control" type="number" step="0.01" name="harga_min" value="<?= e($selectedItem['harga_min']) ?>" /></div>
                  <div class="col-md-6"><label class="form-label">Harga Max</label><input class="form-control" type="number" step="0.01" name="harga_max" value="<?= e($selectedItem['harga_max']) ?>" /></div>
                  <div class="col-12"><label class="form-label">Fungsi</label><textarea class="form-control" name="fungsi" rows="2"><?= e($selectedItem['fungsi']) ?></textarea></div>
                  <div class="col-12"><label class="form-label">Keterangan</label><textarea class="form-control" name="keterangan" rows="2"><?= e($selectedItem['keterangan']) ?></textarea></div>
                  <div class="col-12"><label class="form-label">Risiko</label><textarea class="form-control" name="risiko" rows="2"><?= e($selectedItem['risiko']) ?></textarea></div>
                  <div class="col-12"><label class="form-label">Detail JSON</label><textarea class="form-control font-monospace" name="detail_json" rows="4"><?= e($selectedItem['detail_json'] ?? '') ?></textarea></div>
                  <div class="col-12"><label class="form-check"><input class="form-check-input" type="checkbox" name="is_active" <?= (int) $selectedItem['is_active'] === 1 ? 'checked' : '' ?> /> <span class="form-check-label">Item aktif dan tampil untuk petani</span></label></div>
                </div>
                <button class="btn btn-primary mt-3" type="submit"><span class="material-symbols-outlined">save</span> Simpan Perubahan</button>
              </form>
            <?php else: ?>
              <p class="text-secondary mb-0">Pilih kategori dan item untuk mulai mengedit.</p>
            <?php endif; ?>
          </div>
        </div>
      </section>
    </div>
  </section>
</main>
<script src="../../assets/js/app.js"></script>
</body>
</html>
