<?php
declare(strict_types=1);

function petani_summary(int $userId): array
{
    $stmt = db()->prepare(
        'SELECT
          (SELECT COUNT(*) FROM lahan WHERE user_id = ? AND deleted_at IS NULL) AS total_lahan,
          (SELECT COALESCE(SUM(COALESCE(luas_lahan / 10000, 0)), 0) FROM lahan WHERE user_id = ? AND deleted_at IS NULL) AS total_luas_ha,
          (SELECT COUNT(*) FROM musim_tanam WHERE user_id = ? AND status = "aktif") AS musim_aktif,
          (
            (SELECT COALESCE(SUM(total_biaya), 0) FROM biaya_produksi WHERE user_id = ?) +
            (SELECT COALESCE(SUM(total_biaya), 0) FROM biaya_operasional WHERE user_id = ?)
          ) AS total_biaya,
          (SELECT COALESCE(SUM(total_pendapatan), 0) FROM hasil_panen WHERE user_id = ?) AS total_pendapatan'
    );
    $stmt->execute([$userId, $userId, $userId, $userId, $userId, $userId]);
    $row = $stmt->fetch() ?: [];
    $row['total_profit'] = (float) ($row['total_pendapatan'] ?? 0) - (float) ($row['total_biaya'] ?? 0);
    return $row;
}

function admin_summary(): array
{
    $stmt = db()->query(
        'SELECT
          (SELECT COUNT(*) FROM users WHERE status = "aktif") AS total_users,
          (SELECT COUNT(*) FROM users WHERE role = "petani") AS total_petani,
          (SELECT COALESCE(SUM(COALESCE(luas_lahan / 10000, 0)), 0) FROM lahan WHERE deleted_at IS NULL) AS total_luas_ha,
          (SELECT COUNT(*) FROM musim_tanam WHERE status = "aktif") AS musim_aktif,
          (SELECT COALESCE(SUM(berat_kg), 0) FROM hasil_panen) AS total_panen_kg,
          (
            (SELECT COALESCE(SUM(total_biaya), 0) FROM biaya_produksi) +
            (SELECT COALESCE(SUM(total_biaya), 0) FROM biaya_operasional)
          ) AS total_biaya,
          (SELECT COALESCE(SUM(total_pendapatan), 0) FROM hasil_panen) AS total_pendapatan'
    );
    $row = $stmt->fetch() ?: [];
    $row['total_profit'] = (float) ($row['total_pendapatan'] ?? 0) - (float) ($row['total_biaya'] ?? 0);
    return $row;
}

function user_lahan(int $userId): array
{
    $stmt = db()->prepare('SELECT l.*, t.nama AS tanaman_nama FROM lahan l LEFT JOIN tanaman t ON t.id = l.tanaman_id WHERE l.user_id = ? AND l.deleted_at IS NULL ORDER BY l.created_at DESC');
    $stmt->execute([$userId]);
    return $stmt->fetchAll();
}

function active_tanaman(): array
{
    return db()->query('SELECT * FROM tanaman WHERE status = "aktif" ORDER BY nama ASC')->fetchAll();
}

function user_musim(int $userId): array
{
    $stmt = db()->prepare(
        'SELECT mt.*, l.nama_lahan, t.nama AS tanaman_nama, t.masa_panen_hari,
          (
            COALESCE((SELECT SUM(total_biaya) FROM biaya_produksi b WHERE b.musim_tanam_id = mt.id), 0) +
            COALESCE((SELECT SUM(total_biaya) FROM biaya_operasional bo WHERE bo.musim_tanam_id = mt.id), 0)
          ) AS total_biaya,
          COALESCE((SELECT SUM(total_pendapatan) FROM hasil_panen h WHERE h.musim_tanam_id = mt.id), 0) AS total_pendapatan
         FROM musim_tanam mt
         JOIN lahan l ON l.id = mt.lahan_id
         LEFT JOIN tanaman t ON t.id = mt.tanaman_id
         WHERE mt.user_id = ?
         ORDER BY mt.tanggal_tanam DESC'
    );
    $stmt->execute([$userId]);
    return $stmt->fetchAll();
}

function katalog_categories(): array
{
    return [
        'Benih & Bibit',
        'Pupuk & Nutrisi',
        'Pembenah Tanah',
        'Perlindungan Tanaman',
        'Air & Irigasi',
        'Persiapan Lahan',
        'Tenaga Kerja',
        'Alat & Mesin',
        'Bahan Pendukung',
        'Panen',
        'Pascapanen',
        'Transportasi & Logistik',
        'Modal & Administrasi',
        'Risiko / Kerugian',
    ];
}

function katalog_asset_path(array $item): string
{
    $root = dirname(__DIR__, 2);
    $path = trim((string) ($item['image_path'] ?? ''));
    if ($path !== '' && is_file($root . DIRECTORY_SEPARATOR . str_replace('/', DIRECTORY_SEPARATOR, $path))) {
        return $path;
    }

    $code = (string) ($item['kode'] ?? '');
    $byCode = [
        'ALT-SPRAYER' => 'assets/image/perlindungan_tanaman/perlintan-insektisida.jpg',
        'ALT-SPRAYER-ELEKTRIK' => 'assets/image/perlindungan_tanaman/perlintan-insektisida.jpg',
        'ALT-POMPA-AIR' => 'assets/image/irigasi/irigasi-pompa-air.jpg',
        'ALT-TRAKTOR' => 'assets/image/persiapan/persiapan-traktor-roda-dua.jpg',
        'ALT-ROTAVATOR' => 'assets/image/persiapan/persiapan-rotavator.jpg',
        'ALT-COMBINE' => 'assets/image/tenaga_kerja/tenaga-panen-padi.jpg',
        'ALT-POWER-THRESHER' => 'assets/image/tenaga_kerja/tenaga-jemur-pengeringan.jpg',
        'ALT-CORN-SHELLER' => 'assets/image/tenaga_kerja/tenaga-panen-jagung.jpg',
        'ALT-TIMBANGAN-DIGITAL' => 'assets/image/tanaman/digital-farming-preview.png',
        'BHN-KARUNG' => 'assets/image/tenaga_kerja/tenaga-angkut-hasil.jpg',
        'BHN-TALI' => 'assets/image/tenaga_kerja/tenaga-angkut-hasil.jpg',
        'BHN-TERPAL' => 'assets/image/tenaga_kerja/tenaga-jemur-pengeringan.jpg',
        'PAN-ANGKUT' => 'assets/image/tenaga_kerja/tenaga-angkut-hasil.jpg',
        'PAN-KARUNG' => 'assets/image/tenaga_kerja/tenaga-angkut-hasil.jpg',
        'PAN-KEDELAI' => 'assets/image/tenaga_kerja/tenaga-panen-kedelai.jpg',
        'PAN-TALI' => 'assets/image/tenaga_kerja/tenaga-angkut-hasil.jpg',
        'PAN-TIMBANG' => 'assets/image/tanaman/digital-farming-preview.png',
        'PAS-KARUNG' => 'assets/image/tenaga_kerja/tenaga-angkut-hasil.jpg',
        'PAS-PIPIL-JAGUNG' => 'assets/image/tenaga_kerja/tenaga-panen-jagung.jpg',
        'PAS-RONTOK' => 'assets/image/tenaga_kerja/tenaga-jemur-pengeringan.jpg',
        'PAS-SIMPAN' => 'assets/image/tanaman/farm-landscape.jpg',
        'PAS-SORTASI' => 'assets/image/tenaga_kerja/tenaga-jemur-pengeringan.jpg',
        'PAS-TIMBANG' => 'assets/image/tanaman/digital-farming-preview.png',
        'TRN-BBM' => 'assets/image/irigasi/irigasi-bahan-bakar-pompa.jpg',
        'TRN-BONGKAR' => 'assets/image/tenaga_kerja/tenaga-angkut-hasil.jpg',
        'TRN-GEROBAK' => 'assets/image/tenaga_kerja/tenaga-angkut-hasil.jpg',
        'TRN-PICKUP' => 'assets/image/tenaga_kerja/tenaga-angkut-hasil.jpg',
        'TRN-TIMBANG' => 'assets/image/tanaman/digital-farming-preview.png',
    ];
    if (isset($byCode[$code])) {
        return $byCode[$code];
    }

    $category = (string) ($item['kategori'] ?? '');
    $byCategory = [
        'Benih & Bibit' => 'assets/image/bibit/padi-ciherang.jpg',
        'Pupuk & Nutrisi' => 'assets/image/pupuk/pupuk-npk-phonska.jpg',
        'Pembenah Tanah' => 'assets/image/pembenah_tanaman/pembenah-kompos.jpg',
        'Perlindungan Tanaman' => 'assets/image/perlindungan_tanaman/perlintan-insektisida.jpg',
        'Air & Irigasi' => 'assets/image/irigasi/irigasi-pompa-air.jpg',
        'Persiapan Lahan' => 'assets/image/persiapan/persiapan-traktor-roda-dua.jpg',
        'Tenaga Kerja' => 'assets/image/tenaga_kerja/tenaga-olah-tanah-manual.jpg',
        'Alat & Mesin' => 'assets/image/persiapan/persiapan-traktor-roda-dua.jpg',
        'Bahan Pendukung' => 'assets/image/tenaga_kerja/tenaga-angkut-hasil.jpg',
        'Panen' => 'assets/image/tenaga_kerja/tenaga-panen-padi.jpg',
        'Pascapanen' => 'assets/image/tenaga_kerja/tenaga-jemur-pengeringan.jpg',
        'Transportasi & Logistik' => 'assets/image/tenaga_kerja/tenaga-angkut-hasil.jpg',
        'Modal & Administrasi' => 'assets/image/tanaman/digital-farming-preview.png',
        'Risiko / Kerugian' => 'assets/image/tanaman/farm-landscape.jpg',
    ];

    return $byCategory[$category] ?? 'assets/image/tanaman/farm-landscape.jpg';
}

function calculate_progress(string $tanggalTanam, int $masaPanen): int
{
    $start = new DateTimeImmutable($tanggalTanam);
    $today = new DateTimeImmutable('today');
    $days = max(0, (int) $start->diff($today)->format('%r%a'));
    return max(0, min(100, (int) round(($days / max(1, $masaPanen)) * 100)));
}

function phase_from_progress(int $progress): string
{
    if ($progress >= 100) return 'Siap Panen';
    if ($progress >= 55) return 'Pertumbuhan';
    if ($progress >= 15) return 'Pertumbuhan Awal';
    return 'Persemaian';
}
