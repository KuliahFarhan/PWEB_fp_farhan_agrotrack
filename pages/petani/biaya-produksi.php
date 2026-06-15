<?php
declare(strict_types=1);
require_once __DIR__ . '/../../app/core/bootstrap.php';
require_once __DIR__ . '/../../app/core/layout.php';
require_once __DIR__ . '/../../app/core/queries.php';
$user = require_login('petani'); $userId = (int) $user['id']; $error = null; $musim = user_musim($userId);
if (request_method() === 'POST') {
  try { verify_csrf(); $musimId = post_int('musim_tanam_id'); $kategori = $_POST['kategori'] ?? 'lainnya'; $allowed = ['benih','pupuk','pestisida','tenaga_kerja','transportasi','alat','lainnya']; if (!in_array($kategori,$allowed,true)) throw new RuntimeException('Kategori tidak valid.');
    $nominal = post_float('total_biaya'); if ($nominal <= 0) throw new RuntimeException('Nominal harus lebih dari 0.');
    $stmt = db()->prepare('SELECT mt.id, mt.lahan_id FROM musim_tanam mt WHERE mt.id=? AND mt.user_id=?'); $stmt->execute([$musimId,$userId]); $m=$stmt->fetch(); if(!$m) throw new RuntimeException('Musim tanam tidak valid.');
    $stmt = db()->prepare('INSERT INTO biaya_produksi (user_id,lahan_id,musim_tanam_id,tanggal,kategori,deskripsi,jumlah,satuan,harga_satuan,total_biaya,catatan) VALUES (?,?,?,?,?,?,?,?,?,?,?)');
    $qty = max(1, (float)($_POST['jumlah'] ?? 1)); $harga = $nominal / $qty; $stmt->execute([$userId,$m['lahan_id'],$musimId,post_string('tanggal',20),$kategori,post_string('deskripsi',190),$qty,post_string('satuan',30),$harga,$nominal,post_string('catatan',1000)]);
    flash('success','Biaya berhasil disimpan.'); redirect_to('biaya-produksi.php');
  } catch(Throwable $e){$error=$e->getMessage();}
}
$stmt = db()->prepare('SELECT b.*, mt.kode_musim FROM biaya_produksi b LEFT JOIN musim_tanam mt ON mt.id=b.musim_tanam_id WHERE b.user_id=? ORDER BY b.tanggal DESC'); $stmt->execute([$userId]); $rows=$stmt->fetchAll();
?>
<!doctype html><html lang="id"><head><?php render_head('AgroTrack - Biaya Produksi'); ?></head><body data-portal="petani" data-active="biaya" data-base="../../"><?php render_sidebar($user,'biaya'); ?><main class="app-main">
<div class="topbar"><div><h1 class="page-title">Biaya Produksi</h1><p class="page-kicker">Input biaya per musim tanam dan kategori.</p></div></div><?php render_flash(); if($error):?><div class="alert alert-danger"><?=e($error)?></div><?php endif;?>
<section class="row g-3"><div class="col-xl-4"><div class="panel h-100"><h2 class="section-title">Tambah Biaya</h2><form method="post" class="vstack gap-3"><input type="hidden" name="csrf_token" value="<?=e(csrf_token())?>" />
<div><label class="form-label fw-semibold">Musim</label><select class="form-select" name="musim_tanam_id"><?php foreach($musim as $m):?><option value="<?=e($m['id'])?>"><?=e($m['kode_musim'])?> - <?=e($m['nama_lahan'])?></option><?php endforeach;?></select></div>
<div><label class="form-label fw-semibold">Tanggal</label><input class="form-control" name="tanggal" type="date" value="<?=e(date('Y-m-d'))?>" /></div><div><label class="form-label fw-semibold">Kategori</label><select class="form-select" name="kategori"><?php foreach(['benih'=>'Bibit','pupuk'=>'Pupuk','pestisida'=>'Pestisida','tenaga_kerja'=>'Tenaga Kerja','transportasi'=>'Transportasi','alat'=>'Sewa Alat','lainnya'=>'Lainnya'] as $k=>$v):?><option value="<?=e($k)?>"><?=e($v)?></option><?php endforeach;?></select></div>
<div><label class="form-label fw-semibold">Deskripsi</label><input class="form-control" name="deskripsi" value="Pupuk Phonska" required /></div><div class="row g-2"><div class="col"><label class="form-label fw-semibold">Jumlah</label><input class="form-control" name="jumlah" type="number" step="0.01" value="1" /></div><div class="col"><label class="form-label fw-semibold">Satuan</label><input class="form-control" name="satuan" value="sak" /></div></div>
<div><label class="form-label fw-semibold">Total Biaya</label><input class="form-control" name="total_biaya" type="number" min="1" value="175000" required /></div><div><label class="form-label fw-semibold">Catatan</label><textarea class="form-control" name="catatan" rows="3"></textarea></div><button class="btn btn-primary">Simpan Biaya</button></form></div></div>
<div class="col-xl-8"><div class="panel"><h2 class="section-title">Riwayat Biaya</h2><div class="table-responsive"><table class="table"><thead><tr><th>Tanggal</th><th>Musim</th><th>Kategori</th><th>Deskripsi</th><th>Total</th></tr></thead><tbody><?php foreach($rows as $r):?><tr><td><?=e($r['tanggal'])?></td><td><?=e($r['kode_musim'])?></td><td><?=e(status_label($r['kategori']))?></td><td><?=e($r['deskripsi'])?></td><td><?=money_id($r['total_biaya'])?></td></tr><?php endforeach;?><?php if(!$rows):?><tr><td colspan="5" class="text-center text-secondary py-4">Belum ada biaya.</td></tr><?php endif;?></tbody></table></div></div></div></section>
</main><script src="../../assets/js/app.js"></script></body></html>
