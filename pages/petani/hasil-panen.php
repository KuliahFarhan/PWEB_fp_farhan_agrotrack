<?php
declare(strict_types=1);

require_once __DIR__ . '/../../app/core/bootstrap.php';
require_once __DIR__ . '/../../app/core/layout.php';
require_once __DIR__ . '/../../app/core/queries.php';

$user = require_login('petani');
$userId = (int) $user['id'];
$error = null;
$musim = user_musim($userId);

function harvest_visual_asset(?string $commodity): string
{
    $commodity = strtolower((string) $commodity);
    if (str_contains($commodity, 'jagung')) {
        return '../../assets/image/gambar_tanaman/gambar_jagung_1.jpg';
    }
    if (str_contains($commodity, 'padi')) {
        return '../../assets/image/gambar_tanaman/gambar_padi_1.jpg';
    }
    if (str_contains($commodity, 'kedelai')) {
        return '../../assets/image/gambar_tanaman/gambar_kedelai_1.jpg';
    }
    return '../../assets/image/tanaman/farm-landscape.jpg';
}

if (request_method() === 'POST') {
    try {
        verify_csrf();
        $musimId = post_int('musim_tanam_id');
        $stmt = db()->prepare(
            'SELECT mt.*, l.luas, t.nama AS tanaman
             FROM musim_tanam mt
             JOIN lahan l ON l.id = mt.lahan_id
             LEFT JOIN tanaman t ON t.id = mt.tanaman_id
             WHERE mt.id = ? AND mt.user_id = ?'
        );
        $stmt->execute([$musimId, $userId]);
        $m = $stmt->fetch();
        if (!$m) {
            throw new RuntimeException('Musim tidak valid.');
        }

        $berat = post_float('berat_kg');
        $harga = post_float('harga_per_kg');
        if ($berat <= 0 || $harga <= 0) {
            throw new RuntimeException('Hasil dan harga jual harus lebih dari 0.');
        }

        $total = $berat * $harga;
        $stmt = db()->prepare(
            'INSERT INTO hasil_panen
             (user_id, lahan_id, musim_tanam_id, tanggal_panen, komoditas, berat_kg, harga_per_kg, total_pendapatan, kualitas, status, pembeli, catatan)
             VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
             ON DUPLICATE KEY UPDATE
             tanggal_panen = VALUES(tanggal_panen),
             berat_kg = VALUES(berat_kg),
             harga_per_kg = VALUES(harga_per_kg),
             total_pendapatan = VALUES(total_pendapatan),
             kualitas = VALUES(kualitas),
             pembeli = VALUES(pembeli),
             catatan = VALUES(catatan)'
        );
        $stmt->execute([
            $userId,
            $m['lahan_id'],
            $musimId,
            post_string('tanggal_panen', 20),
            $m['tanaman'] ?: 'Panen',
            $berat,
            $harga,
            $total,
            $_POST['kualitas'] ?? 'baik',
            'terverifikasi',
            post_string('pembeli', 120),
            post_string('catatan', 1000),
        ]);

        flash('success', 'Hasil panen berhasil disimpan.');
        redirect_to('hasil-panen.php');
    } catch (Throwable $e) {
        $error = $e->getMessage();
    }
}

$stmt = db()->prepare(
    'SELECT h.*, mt.kode_musim,
      (
        COALESCE((SELECT SUM(total_biaya) FROM biaya_produksi b WHERE b.musim_tanam_id = h.musim_tanam_id), 0) +
        COALESCE((SELECT SUM(total_biaya) FROM biaya_operasional bo WHERE bo.musim_tanam_id = h.musim_tanam_id), 0)
      ) AS total_biaya
     FROM hasil_panen h
     LEFT JOIN musim_tanam mt ON mt.id = h.musim_tanam_id
     WHERE h.user_id = ?
     ORDER BY h.tanggal_panen DESC'
);
$stmt->execute([$userId]);
$rows = $stmt->fetchAll();

$latestHarvest = $rows[0] ?? null;
$totalBerat = 0.0;
$totalPendapatan = 0.0;
$totalBiaya = 0.0;
foreach ($rows as $row) {
    $totalBerat += (float) $row['berat_kg'];
    $totalPendapatan += (float) $row['total_pendapatan'];
    $totalBiaya += (float) $row['total_biaya'];
}
$totalProfit = $totalPendapatan - $totalBiaya;
$avgPrice = $totalBerat > 0 ? $totalPendapatan / $totalBerat : 0.0;
?>
<!doctype html>
<html lang="id">
<head><?php render_head('AgroTrack - Hasil Panen'); ?></head>
<body data-portal="petani" data-active="panen" data-base="../../">
<?php render_sidebar($user, 'panen'); ?>
<main class="app-main">
  <div class="topbar">
    <div>
      <h1 class="page-title">Hasil Panen</h1>
      <p class="page-kicker">Pendapatan dihitung otomatis dari total hasil x harga jual.</p>
    </div>
  </div>

  <?php render_flash(); ?>
  <?php if ($error): ?><div class="alert alert-danger"><?= e($error) ?></div><?php endif; ?>
  <?php render_page_help('Cara mencatat panen', ['Pilih musim tanam yang sudah selesai atau siap panen.', 'Isi tanggal panen, berat hasil, harga jual, kualitas, dan pembeli.', 'Simpan agar pendapatan dan profit otomatis muncul di analisis.'], 'Satu musim panen akan diperbarui jika kamu menginput ulang musim yang sama.', 'analisis.php', 'Lihat Analisis'); ?>

  <section class="row g-3 mb-3">
    <div class="col-xl-4">
      <div class="panel h-100">
        <h2 class="section-title">Input Panen</h2>
        <form method="post" class="vstack gap-3">
          <input type="hidden" name="csrf_token" value="<?= e(csrf_token()) ?>" />
          <div>
            <label class="form-label fw-semibold">Musim</label>
            <select class="form-select" name="musim_tanam_id">
              <?php foreach ($musim as $m): ?>
                <option value="<?= e($m['id']) ?>"><?= e($m['kode_musim']) ?> - <?= e($m['tanaman_nama']) ?></option>
              <?php endforeach; ?>
            </select>
          </div>
          <div>
            <label class="form-label fw-semibold">Tanggal Panen</label>
            <input class="form-control" name="tanggal_panen" type="date" value="<?= e(date('Y-m-d')) ?>" />
          </div>
          <div>
            <label class="form-label fw-semibold">Total Hasil (kg)</label>
            <input class="form-control" name="berat_kg" type="number" step="0.01" min="0.01" required />
          </div>
          <div>
            <label class="form-label fw-semibold">Harga Jual / kg</label>
            <input class="form-control" name="harga_per_kg" type="number" min="1" required />
          </div>
          <div>
            <label class="form-label fw-semibold">Kualitas</label>
            <select class="form-select" name="kualitas">
              <option value="premium">Premium</option>
              <option value="baik" selected>Baik</option>
              <option value="sedang">Sedang</option>
              <option value="rendah">Rendah</option>
            </select>
          </div>
          <div>
            <label class="form-label fw-semibold">Pembeli</label>
            <input class="form-control" name="pembeli" />
          </div>
          <div>
            <label class="form-label fw-semibold">Catatan</label>
            <textarea class="form-control" name="catatan" rows="3"></textarea>
          </div>
          <button class="btn btn-primary" type="submit">
            <span class="material-symbols-outlined">save</span> Simpan Panen
          </button>
        </form>
      </div>
    </div>

    <div class="col-xl-8">
      <div class="image-panel harvest-hero-panel panel p-0 h-100">
        <img src="<?= e(harvest_visual_asset($latestHarvest['komoditas'] ?? null)) ?>" alt="Visual hasil panen" />
        <div class="image-panel-content">
          <span class="asset-tag mb-2">Ringkasan Panen</span>
          <h2 class="mb-2"><?= e($latestHarvest['komoditas'] ?? 'Belum ada panen tercatat') ?></h2>
          <p class="mb-3">
            <?php if ($latestHarvest): ?>
              Panen terakhir pada <?= e($latestHarvest['tanggal_panen']) ?> dengan hasil <?= number_id((float) $latestHarvest['berat_kg'], 2) ?> kg.
            <?php else: ?>
              Setelah panen dicatat, kartu ini akan menampilkan ringkasan hasil, harga jual, dan pembeli utama.
            <?php endif; ?>
          </p>
          <div class="harvest-highlight-grid">
            <div class="harvest-highlight-card">
              <small>Total hasil</small>
              <strong><?= number_id($totalBerat, 2) ?> kg</strong>
            </div>
            <div class="harvest-highlight-card">
              <small>Rata-rata harga</small>
              <strong><?= money_id($avgPrice) ?>/kg</strong>
            </div>
            <div class="harvest-highlight-card">
              <small>Total profit</small>
              <strong><?= money_id($totalProfit) ?></strong>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="row g-3">
    <div class="col-12">
      <div class="panel">
        <div class="d-flex flex-wrap align-items-center justify-content-between gap-3 mb-3">
          <h2 class="section-title mb-0">Riwayat Panen</h2>
          <div class="d-flex flex-wrap gap-2">
            <span class="asset-tag">Pendapatan <?= money_id($totalPendapatan) ?></span>
            <span class="asset-tag">Biaya <?= money_id($totalBiaya) ?></span>
            <span class="asset-tag">Total <?= count($rows) ?> panen</span>
          </div>
        </div>
        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
                <th>Tanggal</th>
                <th>Musim</th>
                <th>Komoditas</th>
                <th>Hasil</th>
                <th>Harga / kg</th>
                <th>Pembeli</th>
                <th>Pendapatan</th>
                <th>Profit</th>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($rows as $r): ?>
                <tr>
                  <td><?= e($r['tanggal_panen']) ?></td>
                  <td><?= e($r['kode_musim']) ?></td>
                  <td>
                    <div class="history-copy">
                      <strong><?= e($r['komoditas']) ?></strong>
                      <small>Kualitas <?= e(ucfirst((string) $r['kualitas'])) ?></small>
                    </div>
                  </td>
                  <td><?= number_id((float) $r['berat_kg'], 2) ?> kg</td>
                  <td><?= money_id((float) $r['harga_per_kg']) ?></td>
                  <td><?= e($r['pembeli'] ?: 'Belum diisi') ?></td>
                  <td><?= money_id((float) $r['total_pendapatan']) ?></td>
                  <td><?= money_id((float) $r['total_pendapatan'] - (float) $r['total_biaya']) ?></td>
                </tr>
              <?php endforeach; ?>
              <?php if (!$rows): ?>
                <tr><td colspan="8" class="text-center text-secondary py-4">Belum ada hasil panen.</td></tr>
              <?php endif; ?>
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
