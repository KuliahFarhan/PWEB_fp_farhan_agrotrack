CREATE OR REPLACE VIEW v_ringkasan_petani AS
SELECT
  u.id AS user_id,
  u.name AS nama_petani,
  COALESCE(l.total_lahan, 0) AS total_lahan,
  COALESCE(l.total_luas_manual_ha, 0) AS total_luas_manual_ha,
  COALESCE(l.total_luas_polygon_m2, 0) AS total_luas_polygon_m2,
  COALESCE(b.total_biaya, 0) AS total_biaya,
  COALESCE(h.total_pendapatan, 0) AS total_pendapatan,
  COALESCE(h.total_pendapatan, 0) - COALESCE(b.total_biaya, 0) AS total_profit
FROM users u
LEFT JOIN (
  SELECT user_id, COUNT(*) AS total_lahan, SUM(luas) AS total_luas_manual_ha, SUM(luas_lahan) AS total_luas_polygon_m2
  FROM lahan GROUP BY user_id
) l ON l.user_id = u.id
LEFT JOIN (
  SELECT user_id, SUM(total_biaya) AS total_biaya
  FROM (
    SELECT user_id, total_biaya FROM biaya_produksi
    UNION ALL
    SELECT user_id, total_biaya FROM biaya_operasional
  ) biaya_all
  GROUP BY user_id
) b ON b.user_id = u.id
LEFT JOIN (
  SELECT user_id, SUM(total_pendapatan) AS total_pendapatan FROM hasil_panen GROUP BY user_id
) h ON h.user_id = u.id
WHERE u.role = 'petani';

CREATE OR REPLACE VIEW v_lahan_monitoring_admin AS
SELECT
  l.id AS lahan_id,
  l.nama_lahan,
  l.komoditas,
  l.lokasi,
  l.status AS status_lahan,
  u.id AS user_id,
  u.name AS nama_petani,
  m.kategori AS kategori_monitoring,
  m.severity,
  m.status AS status_monitoring,
  m.tanggal_temuan
FROM lahan l
JOIN users u ON u.id = l.user_id
LEFT JOIN monitoring_lahan m ON m.lahan_id = l.id AND m.status <> 'selesai';
