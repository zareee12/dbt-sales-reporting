-- models/dimensions/dim_tanggal.sql
SELECT DISTINCT
    tanggal_referensi AS kunci_tanggal,
    EXTRACT(YEAR FROM tanggal_referensi) AS tahun,
    EXTRACT(MONTH FROM tanggal_referensi) AS bulan,
    EXTRACT(DAY FROM tanggal_referensi) AS hari,
    TO_CHAR(tanggal_referensi, 'YYYY-MM') AS tahun_bulan,
    TO_CHAR(tanggal_referensi, 'Day') AS nama_hari_dalam_minggu
FROM {{ ref('stg_penjualan') }}
WHERE tanggal_referensi IS NOT NULL