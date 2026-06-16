<?php
declare(strict_types=1);
require_once __DIR__ . '/../../app/core/bootstrap.php';
require_once __DIR__ . '/../../app/core/layout.php';
require_once __DIR__ . '/../../app/core/queries.php';

$user = require_login('petani');
$userId = (int) $user['id'];
$error = null;
$musim = user_musim($userId);
$categories = katalog_categories();

$selectedItem = null;
$selectedId = filter_var($_GET['katalog_item_id'] ?? null, FILTER_VALIDATE_INT);
if ($selectedId) {
    $stmt = db()->prepare('SELECT * FROM katalog_items WHERE id = ? AND is_active = 1');
    $stmt->execute([$selectedId]);
    $selectedItem = $stmt->fetch() ?: null;
}

if (request_method() === 'POST') {
    try {
        verify_csrf();
        $musimId = post_int('musim_tanam_id');
        $stmt = db()->prepare('SELECT mt.id, mt.lahan_id FROM musim_tanam mt WHERE mt.id = ? AND mt.user_id = ?');
        $stmt->execute([$musimId, $userId]);
        $m = $stmt->fetch();
        if (!$m) {
            throw new RuntimeException('Musim tanam tidak valid.');
        }

        $item = null;
        $itemId = filter_var($_POST['katalog_item_id'] ?? null, FILTER_VALIDATE_INT);
        if ($itemId) {
            $stmt = db()->prepare('SELECT * FROM katalog_items WHERE id = ? AND is_active = 1');
            $stmt->execute([$itemId]);
            $item = $stmt->fetch() ?: null;
            if (!$item) {
                throw new RuntimeException('Item katalog tidak valid.');
            }
        }

        $kategori = $item ? $item['kategori'] : post_string('kategori', 80);
        if (!in_array($kategori, $categories, true)) {
            throw new RuntimeException('Kategori tidak valid.');
        }

        $qty = post_float('jumlah');
        $harga = post_float('harga_satuan');
        if ($qty <= 0 || $harga < 0) {
            throw new RuntimeException('Jumlah harus lebih dari 0 dan harga tidak boleh negatif.');
        }
        $total = $qty * $harga;
        if ($total <= 0) {
            throw new RuntimeException('Total biaya harus lebih dari 0.');
        }

        $stmt = db()->prepare(
            'INSERT INTO biaya_operasional
             (user_id, lahan_id, musim_tanam_id, katalog_item_id, tanggal, kategori, subkategori, nama_item, mode_biaya, jumlah, satuan, harga_satuan, total_biaya, catatan)
             VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)'
        );
        $stmt->execute([
            $userId,
            (int) $m['lahan_id'],
            $musimId,
            $item ? (int) $item['id'] : null,
            post_string('tanggal', 20),
            $kategori,
            $item ? $item['subkategori'] : post_string('subkategori', 120),
            $item ? $item['nama'] : post_string('nama_item', 160),
            $item ? $item['mode_biaya'] : post_string('mode_biaya', 80),
            $qty,
            post_string('satuan', 40) ?: 'unit',
            $harga,
            $total,
            post_string('catatan', 1000),
        ]);
        flash('success', 'Biaya operasional berhasil disimpan.');
        redirect_to('biaya-produksi.php');
    } catch (Throwable $e) {
        $error = $e->getMessage();
    }
}

$stmt = db()->prepare(
    'SELECT tanggal, kode_musim, kategori, subkategori, nama_item AS deskripsi, jumlah, satuan, harga_satuan, total_biaya, sumber, katalog_kode, image_path
     FROM (
       SELECT bo.tanggal, mt.kode_musim, bo.kategori, bo.subkategori, bo.nama_item, bo.jumlah, bo.satuan, bo.harga_satuan, bo.total_biaya, "Operasional" AS sumber, ki.kode AS katalog_kode, ki.image_path
       FROM biaya_operasional bo
       LEFT JOIN musim_tanam mt ON mt.id = bo.musim_tanam_id
       LEFT JOIN katalog_items ki ON ki.id = bo.katalog_item_id
       WHERE bo.user_id = ?
       UNION ALL
       SELECT b.tanggal, mt.kode_musim, b.kategori, NULL AS subkategori, b.deskripsi AS nama_item, b.jumlah, b.satuan, b.harga_satuan, b.total_biaya, "Legacy" AS sumber, NULL AS katalog_kode, NULL AS image_path
       FROM biaya_produksi b LEFT JOIN musim_tanam mt ON mt.id = b.musim_tanam_id
       WHERE b.user_id = ?
     ) rows_all
     ORDER BY tanggal DESC'
);
$stmt->execute([$userId, $userId]);
$rows = $stmt->fetchAll();

$defaultHarga = $selectedItem && $selectedItem['harga_min'] !== null ? (float) $selectedItem['harga_min'] : 0;
$defaultSatuan = $selectedItem ? ($selectedItem['satuan_default'] ?: 'unit') : 'unit';
?>
<!doctype html>
<html lang="id">
<head><?php render_head('AgroTrack - Biaya Produksi'); ?></head>
<body data-portal="petani" data-active="biaya" data-base="../../">
<?php render_sidebar($user, 'biaya'); ?>
<main class="app-main">
  <div class="topbar">
    <div>
      <h1 class="page-title">Biaya Produksi</h1>
      <p class="page-kicker">Catat biaya dari katalog operasional atau input manual sesuai kondisi lahan.</p>
    </div>
    <a class="btn btn-outline-primary" href="katalog-operasional.php"><span class="material-symbols-outlined">inventory_2</span> Pilih dari Katalog</a>
  </div>
  <?php render_flash(); if ($error): ?><div class="alert alert-danger"><?= e($error) ?></div><?php endif; ?>
  <?php render_page_help('Cara mencatat biaya', ['Pastikan musim tanam sudah dibuat.', 'Pilih item dari katalog atau isi manual jika biaya belum ada di katalog.', 'Isi jumlah dan harga satuan, lalu simpan agar analisis profit ikut terhitung.'], 'Biaya yang dicatat di sini akan masuk ke laporan dan grafik analisis.', 'katalog-operasional.php', 'Pilih dari Katalog'); ?>

  <?php if ($selectedItem): ?>
    <section class="input-with-preview mb-3">
      <img src="../../<?= e(katalog_asset_path($selectedItem)) ?>" alt="<?= e($selectedItem['nama']) ?>" />
      <div>
        <strong><?= e($selectedItem['nama']) ?></strong>
        <p class="text-secondary mb-1"><?= e($selectedItem['fungsi'] ?: 'Item katalog AgroTrack.') ?></p>
        <span class="asset-tag"><?= e($selectedItem['kategori']) ?></span>
        <span class="asset-tag"><?= e($selectedItem['harga_status']) ?></span>
      </div>
    </section>
  <?php endif; ?>

  <section class="row g-3">
    <div class="col-xl-4">
      <div class="panel h-100">
        <h2 class="section-title">Input Biaya</h2>
        <form method="post" class="vstack gap-3">
          <input type="hidden" name="csrf_token" value="<?= e(csrf_token()) ?>" />
          <input type="hidden" name="katalog_item_id" value="<?= e($selectedItem['id'] ?? '') ?>" />
          <div>
            <label class="form-label fw-semibold">Musim</label>
            <select class="form-select" name="musim_tanam_id" required>
              <?php foreach ($musim as $m): ?><option value="<?= e($m['id']) ?>"><?= e($m['kode_musim']) ?> - <?= e($m['nama_lahan']) ?></option><?php endforeach; ?>
            </select>
          </div>
          <div><label class="form-label fw-semibold">Tanggal</label><input class="form-control" name="tanggal" type="date" value="<?= e(date('Y-m-d')) ?>" required /></div>
          <?php if (!$selectedItem): ?>
            <div><label class="form-label fw-semibold">Kategori</label><select class="form-select" name="kategori"><?php foreach ($categories as $cat): ?><option value="<?= e($cat) ?>"><?= e($cat) ?></option><?php endforeach; ?></select></div>
            <div><label class="form-label fw-semibold">Subkategori</label><input class="form-control" name="subkategori" placeholder="Opsional" /></div>
            <div><label class="form-label fw-semibold">Nama Item</label><input class="form-control" name="nama_item" placeholder="Contoh: sewa traktor 1 ha" required /></div>
            <div><label class="form-label fw-semibold">Mode Biaya</label><input class="form-control" name="mode_biaya" value="input_manual" /></div>
          <?php else: ?>
            <div><label class="form-label fw-semibold">Kategori</label><input class="form-control" value="<?= e($selectedItem['kategori']) ?>" readonly /></div>
          <?php endif; ?>
          <div class="row g-2">
            <div class="col-5"><label class="form-label fw-semibold">Jumlah</label><input class="form-control" name="jumlah" type="number" step="0.01" min="0.01" value="1" required /></div>
            <div class="col-7"><label class="form-label fw-semibold">Satuan</label><input class="form-control" name="satuan" value="<?= e($defaultSatuan) ?>" required /></div>
          </div>
          <div><label class="form-label fw-semibold">Harga Satuan</label><input class="form-control" name="harga_satuan" type="number" step="0.01" min="0" value="<?= e($defaultHarga) ?>" required /></div>
          <div><label class="form-label fw-semibold">Catatan</label><textarea class="form-control" name="catatan" rows="3"></textarea></div>
          <button class="btn btn-primary" type="submit"><span class="material-symbols-outlined">save</span> Simpan Biaya</button>
        </form>
      </div>
    </div>
    <div class="col-xl-8">
      <div class="panel">
        <h2 class="section-title">Riwayat Biaya</h2>
        <div class="table-responsive">
          <table class="table">
            <thead><tr><th>Tanggal</th><th>Musim</th><th>Kategori</th><th>Item</th><th>Qty</th><th>Total</th><th>Sumber</th></tr></thead>
            <tbody>
              <?php foreach ($rows as $r): ?>
                <?php
                  $thumb = katalog_asset_path([
                      'kategori' => $r['kategori'],
                      'kode' => $r['katalog_kode'] ?? '',
                      'image_path' => $r['image_path'] ?? '',
                  ]);
                ?>
                <tr>
                  <td><?= e($r['tanggal']) ?></td>
                  <td><?= e($r['kode_musim']) ?></td>
                  <td><?= e(status_label($r['kategori'])) ?></td>
                  <td>
                    <div class="history-item">
                      <img class="history-thumb" src="../../<?= e($thumb) ?>" alt="<?= e($r['deskripsi']) ?>" />
                      <div class="history-copy">
                        <strong><?= e($r['deskripsi']) ?></strong>
                        <small><?= e($r['subkategori'] ?: 'Kebutuhan operasional lapangan') ?></small>
                        <small>Harga acuan: <?= money_id((float) $r['harga_satuan']) ?> / <?= e($r['satuan']) ?></small>
                      </div>
                    </div>
                  </td>
                  <td><?= number_id($r['jumlah'], 2) ?> <?= e($r['satuan']) ?></td>
                  <td><?= money_id($r['total_biaya']) ?></td>
                  <td><span class="asset-tag"><?= e($r['sumber']) ?></span></td>
                </tr>
              <?php endforeach; ?>
              <?php if (!$rows): ?><tr><td colspan="7" class="text-center text-secondary py-4">Belum ada biaya.</td></tr><?php endif; ?>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </section>
</main>
<script src="../../assets/js/app.js"></script>
</body>
</html>
