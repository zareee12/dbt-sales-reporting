
  create view "postgres"."staging"."dim_sales__dbt_tmp"
    
    
  as (
    -- models/dimensions/dim_sales.sql
SELECT DISTINCT
    kode_sales,
    nama_sales
FROM "postgres"."staging"."stg_penjualan"
WHERE kode_sales IS NOT NULL
  );