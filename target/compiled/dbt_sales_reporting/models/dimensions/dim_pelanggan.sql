-- models/dimensions/dim_pelanggan.sql
SELECT DISTINCT
    kode_pelanggan,
    nama_pelanggan,
    alamat_pelanggan
FROM "postgres"."staging"."stg_penjualan"
WHERE kode_pelanggan IS NOT NULL