-- models/dimensions/dim_produk.sql
SELECT DISTINCT
    kode_barang,
    nama_jenis_barang
FROM "postgres"."staging"."stg_penjualan"
WHERE kode_barang IS NOT NULL