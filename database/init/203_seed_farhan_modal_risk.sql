SET @farhan_user_id := (SELECT id FROM users WHERE email = 'muhammadfarhanmonggot@gmail.com' LIMIT 1);
SET @modal_item_id := (SELECT id FROM katalog_items WHERE kode = 'MOD-KAS-AWAL' LIMIT 1);
SET @risk_item_id := (SELECT id FROM katalog_items WHERE kode = 'RSK-GAGAL-PANEN' LIMIT 1);

SET @farhan_lahan_id := (
  SELECT id
  FROM lahan
  WHERE user_id = @farhan_user_id
    AND nama_lahan = 'Lahan Jagung Farhan Blok A'
  LIMIT 1
);

SET @farhan_musim_id := (
  SELECT id
  FROM musim_tanam
  WHERE lahan_id = @farhan_lahan_id
    AND kode_musim = 'MT-2026-JAGUNG-FARHAN'
  LIMIT 1
);

DELETE FROM biaya_operasional
WHERE user_id = @farhan_user_id
  AND musim_tanam_id = @farhan_musim_id;

DELETE FROM biaya_produksi
WHERE user_id = @farhan_user_id
  AND musim_tanam_id = @farhan_musim_id;

DELETE FROM modal_sumber
WHERE user_id = @farhan_user_id
  AND musim_tanam_id = @farhan_musim_id;

DELETE FROM risk_register
WHERE user_id = @farhan_user_id
  AND musim_tanam_id = @farhan_musim_id;

DELETE FROM hasil_panen
WHERE user_id = @farhan_user_id
  AND musim_tanam_id = @farhan_musim_id;

INSERT INTO modal_sumber (user_id, musim_tanam_id, katalog_item_id, tanggal, nama_sumber, jenis_modal, nominal, bunga_persen, tenor_bulan, jatuh_tempo, catatan)
VALUES
  (@farhan_user_id, @farhan_musim_id, @modal_item_id, '2026-02-05', 'Modal Sendiri Musim Jagung Farhan', 'modal_sendiri', 75000000.00, NULL, NULL, NULL, 'Dana awal musim disiapkan dari kas pribadi untuk operasional lahan 3,3615 ha.'),
  (@farhan_user_id, @farhan_musim_id, NULL, '2026-02-06', 'Cadangan Kas Operasional', 'lainnya', 5000000.00, NULL, NULL, NULL, 'Dana cadangan untuk kebutuhan mendadak selama musim berjalan.');

INSERT INTO risk_register (user_id, lahan_id, musim_tanam_id, katalog_item_id, tanggal, risiko, dampak_estimasi, status, mitigasi)
VALUES
  (@farhan_user_id, @farhan_lahan_id, @farhan_musim_id, @risk_item_id, '2026-03-20', 'Serangan hama daun dan ulat pada fase vegetatif', 1200000.00, 'dipantau', 'Monitoring mingguan, semprot selektif, dan pengamatan blok serangan.'),
  (@farhan_user_id, @farhan_lahan_id, @farhan_musim_id, NULL, '2026-04-16', 'Hujan ekstrem dan genangan sementara di tepi lahan', 1500000.00, 'dipantau', 'Perbaikan drainase dan buka tutup aliran air agar genangan cepat surut.');
