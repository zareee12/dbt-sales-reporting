-- models/dimensions/dim_pelanggan.sql
SELECT DISTINCT
    kode_pelanggan,
    nama_pelanggan,
    alamat_pelanggan
FROM {{ ref('stg_penjualan') }}
WHERE kode_pelanggan IS NOT NULL