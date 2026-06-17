-- Validator only. This file is not a migration and must not be auto-run during database init.

SELECT COUNT(*) AS total_users FROM users;
SELECT email, role FROM users ORDER BY email;

SELECT COUNT(*) AS total_katalog_items FROM katalog_items;
SELECT kategori, COUNT(*) AS total
FROM katalog_items
GROUP BY kategori
ORDER BY kategori;

SELECT COUNT(DISTINCT kategori) AS total_kategori
FROM katalog_items;

SELECT u.email, COUNT(l.id) AS total_lahan
FROM users u
LEFT JOIN lahan l ON l.user_id = u.id
WHERE u.email = 'muhammadfarhanmonggot@gmail.com'
GROUP BY u.email;

SELECT u.email, COUNT(mt.id) AS total_musim
FROM users u
LEFT JOIN lahan l ON l.user_id = u.id
LEFT JOIN musim_tanam mt ON mt.lahan_id = l.id
WHERE u.email = 'muhammadfarhanmonggot@gmail.com'
GROUP BY u.email;

SELECT u.email, COUNT(bo.id) AS total_biaya_operasional
FROM users u
LEFT JOIN lahan l ON l.user_id = u.id
LEFT JOIN musim_tanam mt ON mt.lahan_id = l.id
LEFT JOIN biaya_operasional bo ON bo.musim_tanam_id = mt.id
WHERE u.email = 'muhammadfarhanmonggot@gmail.com'
GROUP BY u.email;
