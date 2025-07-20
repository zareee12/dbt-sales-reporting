-- models/dimensions/dim_sales.sql
SELECT DISTINCT
    kode_sales,
    nama_sales
FROM {{ ref('stg_penjualan') }}
WHERE kode_sales IS NOT NULL