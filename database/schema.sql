-- AgroTrack Database Schema
-- Native PHP + MySQL project
-- Safe to re-import during development because tables are dropped in FK order.

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS hasil_panen;
DROP TABLE IF EXISTS biaya_produksi;
DROP TABLE IF EXISTS musim_tanam;
DROP TABLE IF EXISTS lahan;
DROP TABLE IF EXISTS tanaman;
DROP TABLE IF EXISTS users;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE users (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(150) NOT NULL,
    email VARCHAR(180) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    nomor_hp VARCHAR(30) NOT NULL,
    role ENUM('admin', 'petani') NOT NULL DEFAULT 'petani',
    status ENUM('aktif', 'nonaktif') NOT NULL DEFAULT 'aktif',
    foto_profil VARCHAR(255) NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_users_role (role),
    INDEX idx_users_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE tanaman (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nama_tanaman VARCHAR(120) NOT NULL,
    masa_panen INT UNSIGNED NOT NULL,
    deskripsi TEXT NULL,
    status ENUM('aktif', 'nonaktif') NOT NULL DEFAULT 'aktif',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uq_tanaman_nama (nama_tanaman),
    INDEX idx_tanaman_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE lahan (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    nama_lahan VARCHAR(150) NOT NULL,
    lokasi VARCHAR(255) NOT NULL,
    luas_lahan DECIMAL(10,2) NOT NULL,
    status_lahan ENUM('aktif', 'nonaktif') NOT NULL DEFAULT 'aktif',
    latitude DECIMAL(10,8) NULL,
    longitude DECIMAL(11,8) NULL,
    polygon_area TEXT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_lahan_user_id (user_id),
    INDEX idx_lahan_status (status_lahan),
    CONSTRAINT fk_lahan_user
        FOREIGN KEY (user_id) REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE musim_tanam (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    lahan_id BIGINT UNSIGNED NOT NULL,
    tanaman_id BIGINT UNSIGNED NOT NULL,
    tanggal_tanam DATE NOT NULL,
    estimasi_panen DATE NOT NULL,
    status ENUM('persemaian', 'pertumbuhan', 'siap_panen', 'panen_selesai') NOT NULL DEFAULT 'persemaian',
    catatan TEXT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_musim_lahan_id (lahan_id),
    INDEX idx_musim_tanaman_id (tanaman_id),
    INDEX idx_musim_status (status),
    INDEX idx_musim_tanggal_tanam (tanggal_tanam),
    CONSTRAINT fk_musim_lahan
        FOREIGN KEY (lahan_id) REFERENCES lahan(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_musim_tanaman
        FOREIGN KEY (tanaman_id) REFERENCES tanaman(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE biaya_produksi (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    musim_tanam_id BIGINT UNSIGNED NOT NULL,
    kategori ENUM('bibit', 'pupuk', 'pestisida', 'tenaga_kerja', 'transportasi', 'sewa_alat', 'lainnya') NOT NULL,
    nominal DECIMAL(14,2) NOT NULL,
    tanggal_biaya DATE NOT NULL,
    keterangan TEXT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_biaya_musim_tanam_id (musim_tanam_id),
    INDEX idx_biaya_kategori (kategori),
    INDEX idx_biaya_tanggal (tanggal_biaya),
    CONSTRAINT fk_biaya_musim
        FOREIGN KEY (musim_tanam_id) REFERENCES musim_tanam(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE hasil_panen (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    musim_tanam_id BIGINT UNSIGNED NOT NULL,
    total_hasil DECIMAL(12,2) NOT NULL,
    satuan ENUM('kg', 'kuintal', 'ton') NOT NULL DEFAULT 'kg',
    harga_jual DECIMAL(14,2) NOT NULL,
    total_pendapatan DECIMAL(14,2) NOT NULL,
    total_keuntungan DECIMAL(14,2) NOT NULL,
    catatan TEXT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uq_hasil_panen_musim (musim_tanam_id),
    INDEX idx_hasil_satuan (satuan),
    CONSTRAINT fk_hasil_musim
        FOREIGN KEY (musim_tanam_id) REFERENCES musim_tanam(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
