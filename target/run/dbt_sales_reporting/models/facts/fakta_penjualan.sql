
  create view "postgres"."staging"."fakta_penjualan__dbt_tmp"
    
    
  as (
    -- models/facts/fakta_penjualan.sql
SELECT
    s.id_penjualan,
    s.tanggal_referensi AS kunci_tanggal,
    s.kode_pelanggan,
    s.kode_sales,
    s.kode_barang,
    s.kode_kota,
    s.jumlah,
    s.satuan,
    s.harga_plus,
    s.harga_unit_mu,
    s.total_mu,
    s.subtotal_diskon_mu,
    s.subtotal_mu,
    s.harga_unit_riil_mu,
    s.total_riil_mu,
    s.subtotal_diskon_riil_mu,
    s.subtotal_riil_mu,
    s.diskon_akhir_mu,
    s.subtotal_bersih_mu,
    s.pajak_mu,
    s.subtotal_bersih_pajak_mu
FROM "postgres"."staging"."stg_penjualan" s
  );