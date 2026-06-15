CREATE DATABASE IF NOT EXISTS agrotrack CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE agrotrack;

SOURCE /docker-entrypoint-initdb.d/01_schema.sql;
