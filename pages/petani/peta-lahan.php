<?php
declare(strict_types=1);
require_once __DIR__ . '/../../app/core/bootstrap.php';
require_once __DIR__ . '/../../app/core/layout.php';
$user = require_login('petani');
?>
<!doctype html>
<html lang="id">
  <head>
    <?php render_head('AgroTrack - Peta Lahan', '../../', [
      'https://unpkg.com/leaflet@1.9.4/dist/leaflet.css',
      'https://cdnjs.cloudflare.com/ajax/libs/leaflet.draw/1.0.4/leaflet.draw.css',
    ]); ?>
  </head>
  <body data-portal="petani" data-active="peta" data-base="../../">
    <?php render_sidebar($user, 'peta'); ?>
    <main class="app-main">
      <div class="topbar"><div><h1 class="page-title">Peta Lahan</h1><p class="page-kicker">Gambar marker dan polygon untuk data lahan yang sudah dibuat di menu Data Lahan.</p></div></div>
      <?php render_page_help('Cara menyimpan polygon', ['Pilih lahan yang sudah dibuat di menu Data Lahan.', 'Klik tool polygon di sisi kiri peta, lalu gambar batas lahan sampai tertutup.', 'Cek luas otomatis, lalu klik Simpan Polygon.'], 'Kalau dropdown lahan kosong, tambahkan data lahan dulu sebelum menggambar.', 'lahan.php', 'Tambah Lahan'); ?>
      <section class="row g-3">
        <div class="col-xl-8"><div class="panel p-0 overflow-hidden"><div id="fieldMap" class="leaflet-map"></div></div></div>
        <div class="col-xl-4"><div class="panel h-100"><h2 class="section-title">Kontrol Polygon</h2>
          <div class="vstack gap-3">
            <div class="alert alert-info mb-0 small">Pilih Lahan artinya memilih data lahan milik akun ini sebagai tempat menyimpan polygon. Kalau daftar masih kosong, tambahkan lahan dulu.</div>
            <div><label class="form-label fw-semibold" for="lahanSelect">Pilih Lahan</label><select class="form-select" id="lahanSelect"></select></div>
            <a class="btn btn-outline-primary w-100" href="lahan.php">Tambah Lahan</a>
            <div class="map-action-grid"><button class="btn btn-primary" id="savePolygonBtn" type="button">Simpan Polygon</button><button class="btn btn-outline-danger" id="resetPolygonBtn" type="button">Reset Polygon</button></div>
            <div class="stat-card map-metric"><div class="stat-label">Luas Polygon</div><div class="stat-value" id="areaMeter">0 m2</div><div class="stat-note" id="areaHectare">0 ha</div></div>
            <div class="map-coordinate"><span>Latitude</span><strong id="centerLat">-</strong></div><div class="map-coordinate"><span>Longitude</span><strong id="centerLng">-</strong></div>
            <p class="small text-secondary" id="mapHint">Pilih tool polygon di kiri peta, gambar batas lahan, lalu simpan.</p>
            <pre class="polygon-preview" id="polygonPreview">Belum ada polygon.</pre>
          </div>
        </div></div>
      </section>
    </main>
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/leaflet.draw/1.0.4/leaflet.draw.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@turf/turf@6/turf.min.js"></script>
    <script src="../../assets/js/app.js"></script>
    <script src="../../assets/js/peta-lahan.js"></script>
  </body>
</html>
