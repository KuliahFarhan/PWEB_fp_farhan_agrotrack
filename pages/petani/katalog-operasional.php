<?php
declare(strict_types=1);
require_once __DIR__ . '/../../app/core/bootstrap.php';
require_once __DIR__ . '/../../app/core/layout.php';
require_once __DIR__ . '/../../app/core/queries.php';

$user = require_login('petani');
$categories = katalog_categories();
$requestedCategory = trim((string) ($_GET['kategori'] ?? ''));
$category = in_array($requestedCategory, $categories, true) ? $requestedCategory : $categories[0];
$crop = trim((string) ($_GET['komoditas'] ?? ''));
$phase = trim((string) ($_GET['fase'] ?? ''));
$q = trim((string) ($_GET['q'] ?? ''));

$countStmt = db()->query(
    'SELECT kategori, COUNT(*) AS total
     FROM katalog_items
     WHERE is_active = 1
     GROUP BY kategori'
);
$categoryCounts = array_fill_keys($categories, 0);
foreach ($countStmt->fetchAll() as $row) {
    $categoryCounts[$row['kategori']] = (int) $row['total'];
}

$where = ['is_active = 1', 'kategori = ?'];
$params = [$category];
if ($crop !== '' && in_array($crop, ['padi', 'jagung', 'kedelai'], true)) {
    $where[] = 'komoditas LIKE ?';
    $params[] = '%' . $crop . '%';
}
if ($phase !== '') {
    $where[] = 'fase LIKE ?';
    $params[] = '%' . $phase . '%';
}
if ($q !== '') {
    $where[] = '(nama LIKE ? OR fungsi LIKE ? OR kategori LIKE ?)';
    array_push($params, '%' . $q . '%', '%' . $q . '%', '%' . $q . '%');
}

$stmt = db()->prepare('SELECT * FROM katalog_items WHERE ' . implode(' AND ', $where) . ' ORDER BY FIELD(kategori, "' . implode('","', $categories) . '"), nama ASC');
$stmt->execute($params);
$items = $stmt->fetchAll();
$activeTotal = $categoryCounts[$category] ?? 0;
$categoryIcons = [
    'Benih & Bibit' => 'eco',
    'Pupuk & Nutrisi' => 'compost',
    'Pembenah Tanah' => 'terrain',
    'Perlindungan Tanaman' => 'health_and_safety',
    'Air & Irigasi' => 'water_drop',
    'Persiapan Lahan' => 'agriculture',
    'Tenaga Kerja' => 'engineering',
    'Alat & Mesin' => 'precision_manufacturing',
    'Bahan Pendukung' => 'inventory_2',
    'Panen' => 'agriculture',
    'Pascapanen' => 'warehouse',
    'Transportasi & Logistik' => 'local_shipping',
    'Modal & Administrasi' => 'account_balance_wallet',
    'Risiko / Kerugian' => 'warning',
];
?>
<!doctype html>
<html lang="id">
<head><?php render_head('AgroTrack - Katalog Operasional'); ?></head>
<body data-portal="petani" data-active="katalog" data-base="../../">
<?php render_sidebar($user, 'katalog'); ?>
<main class="app-main">
  <div class="topbar">
    <div>
      <h1 class="page-title">Katalog Operasional</h1>
      <p class="page-kicker">Pilih kebutuhan dari pra-tanam sampai pascapanen, lalu catat sebagai biaya musim tanam.</p>
    </div>
    <a class="btn btn-primary" href="biaya-produksi.php"><span class="material-symbols-outlined">add</span> Input Manual</a>
  </div>
  <?php render_page_help('Cara memakai katalog', ['Pilih kategori 1-14 dari sidebar kiri.', 'Gunakan filter komoditas, fase, atau cari nama item.', 'Klik Catat Biaya untuk membawa item ke halaman Biaya Produksi.'], 'Harga katalog adalah referensi. Jumlah dan total biaya tetap bisa disesuaikan saat dicatat.', 'biaya-produksi.php', 'Buka Biaya Produksi'); ?>

  <section class="katalog-shell">
    <aside class="katalog-sidebar">
      <div class="katalog-sidebar-head">
        <span class="material-symbols-outlined">category</span>
        <div>
          <strong>Kategori</strong>
          <small><?= e(array_sum($categoryCounts)) ?> item aktif</small>
        </div>
      </div>
      <nav class="katalog-category-list" aria-label="Kategori katalog">
        <?php foreach ($categories as $index => $cat): ?>
          <?php
            $query = array_filter([
                'kategori' => $cat,
                'komoditas' => $crop,
                'fase' => $phase,
                'q' => $q,
            ], static fn($value) => $value !== '');
          ?>
          <a class="katalog-category-link <?= $cat === $category ? 'active' : '' ?>" href="?<?= e(http_build_query($query)) ?>">
            <span class="katalog-category-index"><?= e($index + 1) ?></span>
            <span class="material-symbols-outlined"><?= e($categoryIcons[$cat] ?? 'category') ?></span>
            <span class="katalog-category-name"><?= e($cat) ?></span>
            <strong><?= e($categoryCounts[$cat] ?? 0) ?></strong>
          </a>
        <?php endforeach; ?>
      </nav>
    </aside>

    <div class="katalog-content">
      <section class="admin-panel admin-filter-panel katalog-focus-panel mb-3">
        <div>
          <span class="asset-tag">Kategori aktif</span>
          <h2 class="section-title mb-1"><?= e($category) ?></h2>
          <p class="text-secondary mb-0"><?= e(count($items)) ?> item tampil dari <?= e($activeTotal) ?> item kategori ini.</p>
        </div>
        <form class="row g-3 align-items-end" method="get">
          <input type="hidden" name="kategori" value="<?= e($category) ?>" />
          <div class="col-lg-3 col-md-6">
            <label class="form-label fw-semibold">Komoditas</label>
            <select class="form-select" name="komoditas">
              <option value="">Semua</option>
              <?php foreach (['padi' => 'Padi', 'jagung' => 'Jagung', 'kedelai' => 'Kedelai'] as $key => $label): ?><option value="<?= e($key) ?>" <?= option_selected($crop, $key) ?>><?= e($label) ?></option><?php endforeach; ?>
            </select>
          </div>
          <div class="col-lg-3 col-md-6">
            <label class="form-label fw-semibold">Fase</label>
            <select class="form-select" name="fase">
              <option value="">Semua fase</option>
              <?php foreach (['Pra-tanam', 'Tanam', 'Vegetatif', 'Generatif', 'Panen', 'Pascapanen'] as $p): ?><option value="<?= e($p) ?>" <?= option_selected($phase, $p) ?>><?= e($p) ?></option><?php endforeach; ?>
            </select>
          </div>
          <div class="col-lg-4 col-md-8">
            <label class="form-label fw-semibold">Cari</label>
            <input class="form-control" name="q" value="<?= e($q) ?>" placeholder="Cari item di kategori ini..." />
          </div>
          <div class="col-lg-2 col-md-4 d-grid">
            <button class="btn btn-primary" type="submit"><span class="material-symbols-outlined">filter_alt</span> Terapkan</button>
          </div>
        </form>
      </section>

      <section class="katalog-grid">
        <?php foreach ($items as $item): ?>
          <?php
            $img = katalog_asset_path($item);
            $price = $item['harga_min'] !== null
                ? money_id($item['harga_min']) . ((float) $item['harga_max'] > (float) $item['harga_min'] ? ' - ' . money_id($item['harga_max']) : '')
                : 'Input manual';
          ?>
          <article class="katalog-card">
            <img src="../../<?= e($img) ?>" alt="<?= e($item['nama']) ?>" />
            <div class="katalog-card-body">
              <div class="asset-meta">
                <span class="asset-tag"><?= e($item['kategori']) ?></span>
                <span class="asset-tag"><?= e($item['fase']) ?></span>
              </div>
              <h2><?= e($item['nama']) ?></h2>
              <p><?= e($item['fungsi'] ?: 'Item operasional AgroTrack.') ?></p>
              <div class="katalog-price"><?= e($price) ?> <small><?= e($item['satuan_default'] ? '/ ' . $item['satuan_default'] : '') ?></small></div>
              <details>
                <summary>Detail & catatan</summary>
                <p><?= e($item['keterangan'] ?: '-') ?></p>
                <p class="text-secondary mb-0"><?= e($item['risiko'] ?: '') ?></p>
              </details>
              <?php if (in_array($item['kategori'], ['Modal & Administrasi', 'Risiko / Kerugian'], true)): ?>
                <div class="mt-auto">
                  <span class="asset-tag">Dicatat di modul Modal/Risiko</span>
                  <p class="small text-secondary mt-2 mb-0">Item ini tidak dimasukkan otomatis ke biaya produksi agar profit tidak salah hitung.</p>
                </div>
              <?php else: ?>
                <a class="btn btn-primary w-100 mt-auto" href="biaya-produksi.php?katalog_item_id=<?= e($item['id']) ?>">
                  <span class="material-symbols-outlined">add_shopping_cart</span> Catat Biaya
                </a>
              <?php endif; ?>
            </div>
          </article>
        <?php endforeach; ?>
        <?php if (!$items): ?>
          <div class="panel text-center py-5">
            <h2 class="section-title">Belum ada item yang cocok</h2>
            <p class="text-secondary mb-0">Coba longgarkan filter komoditas, fase, atau kata kunci.</p>
          </div>
        <?php endif; ?>
      </section>
    </div>
  </section>
</main>
<script src="../../assets/js/app.js"></script>
</body>
</html>
