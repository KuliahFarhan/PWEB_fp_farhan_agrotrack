SET @farhan_user_id := (SELECT id FROM users WHERE email = 'muhammadfarhanmonggot@gmail.com' LIMIT 1);
SET @jagung_farhan_id := (SELECT id FROM tanaman WHERE slug = 'jagung-bima-uri-bima-20-uri' LIMIT 1);
SET @modal_item_id := (SELECT id FROM katalog_items WHERE kode = 'MOD-KAS-AWAL' LIMIT 1);
SET @risk_item_id := (SELECT id FROM katalog_items WHERE kode = 'RSK-GAGAL-PANEN' LIMIT 1);

INSERT INTO lahan (user_id, nama_lahan, kode_lahan, luas, tanaman_id, komoditas, lokasi, status, latitude, longitude, polygon_area, luas_lahan, deleted_at, catatan)
VALUES (
  @farhan_user_id,
  'Lahan Jagung Farhan Blok A',
  'FAR-JG-33615',
  3.3615,
  @jagung_farhan_id,
  'Jagung Bima URI / Bima 20 URI',
  'Gedangan, Sidoarjo, Jawa Timur',
  'selesai',
  -7.28658000,
  112.79065000,
  JSON_OBJECT(
    'type', 'Polygon',
    'coordinates', JSON_ARRAY(
      JSON_ARRAY(
        JSON_ARRAY(112.789862, -7.285714),
        JSON_ARRAY(112.789765, -7.287384),
        JSON_ARRAY(112.791411, -7.287400),
        JSON_ARRAY(112.791562, -7.285809),
        JSON_ARRAY(112.789862, -7.285714)
      )
    )
  ),
  33614.91,
  NULL,
  'Lahan dummy deploy dengan polygon aktif seluas sekitar 33.614,91 m2.'
)
ON DUPLICATE KEY UPDATE
  kode_lahan = VALUES(kode_lahan),
  luas = VALUES(luas),
  tanaman_id = VALUES(tanaman_id),
  komoditas = VALUES(komoditas),
  lokasi = VALUES(lokasi),
  status = VALUES(status),
  latitude = VALUES(latitude),
  longitude = VALUES(longitude),
  polygon_area = VALUES(polygon_area),
  luas_lahan = VALUES(luas_lahan),
  deleted_at = NULL,
  catatan = VALUES(catatan);

SET @farhan_lahan_id := (
  SELECT id
  FROM lahan
  WHERE user_id = @farhan_user_id
    AND nama_lahan = 'Lahan Jagung Farhan Blok A'
  LIMIT 1
);

INSERT INTO musim_tanam (user_id, lahan_id, tanaman_id, kode_musim, nama_musim, tanggal_tanam, estimasi_panen, tanggal_panen, fase, progress, status, catatan)
VALUES (
  @farhan_user_id,
  @farhan_lahan_id,
  @jagung_farhan_id,
  'MT-2026-JAGUNG-FARHAN',
  'Musim Jagung Farhan 2026',
  '2026-02-14',
  '2026-05-25',
  '2026-05-31',
  'selesai',
  100,
  'selesai',
  'Musim dummy lengkap untuk validasi alur biaya, modal, risiko, dan panen.'
)
ON DUPLICATE KEY UPDATE
  tanaman_id = VALUES(tanaman_id),
  nama_musim = VALUES(nama_musim),
  tanggal_tanam = VALUES(tanggal_tanam),
  estimasi_panen = VALUES(estimasi_panen),
  tanggal_panen = VALUES(tanggal_panen),
  fase = VALUES(fase),
  progress = VALUES(progress),
  status = VALUES(status),
  catatan = VALUES(catatan);

SET @farhan_musim_id := (
  SELECT id
  FROM musim_tanam
  WHERE lahan_id = @farhan_lahan_id
    AND kode_musim = 'MT-2026-JAGUNG-FARHAN'
  LIMIT 1
);

