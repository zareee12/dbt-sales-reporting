-- models/dimensions/dim_lokasi.sql
SELECT DISTINCT
    kode_kota,
    nama_kota
FROM {{ ref('stg_penjualan') }}
WHERE kode_kota IS NOT NULL