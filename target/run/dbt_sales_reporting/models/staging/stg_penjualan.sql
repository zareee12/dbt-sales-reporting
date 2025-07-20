
  create view "postgres"."staging"."stg_penjualan__dbt_tmp"
    
    
  as (
    -- models/staging/stg_penjualan.sql
SELECT
    "No. Urut" AS id_penjualan,
    "Tgl Ref" AS tanggal_referensi,
    "No. Ref" AS no_referensi_transaksi,
    "Kode Cust" AS kode_pelanggan,
    "Nama Cust" AS nama_pelanggan,
    "Alamat Cust" AS alamat_pelanggan,
    "Kode Sales" AS kode_sales,
    "Nama Sales" AS nama_sales,
    "Kode Barang" AS kode_barang,
    "Nama Jns Brg" AS nama_jenis_barang,
    "Qty" AS jumlah,
    "Sat" AS satuan,
    "Harga (+)" AS harga_plus,
    "Harga Unit(Mu)" AS harga_unit_mu,
    "Total(MU)" AS total_mu,
    "Disc. 1 (%)" AS diskon_1_persen,
    "Disc. 1 (MU)" AS diskon_1_mu,
    "Disc. 2 (%)" AS diskon_2_persen,
    "Disc. 2 (MU)" AS diskon_2_mu,
    "Disc. 3 (%)" AS diskon_3_persen,
    "Disc. 3 (MU)" AS diskon_3_mu,
    "Disc. 4 (MU)" AS diskon_4_mu,
    "Disc. 5 (%)" AS diskon_5_persen,
    "Disc. 5 (MU)" AS diskon_5_mu,
    "Disc. 6 (MU)" AS diskon_6_mu,
    "Subtot Disc(Mu)" AS subtotal_diskon_mu,
    "Subtot(Mu)" AS subtotal_mu,
    "Hrg Unit Riil(Mu)" AS harga_unit_riil_mu,
    "Total Riil(Mu)" AS total_riil_mu,
    "Subtot Disc Riil(Mu)" AS subtotal_diskon_riil_mu,
    "Subtot Riil(Mu)" AS subtotal_riil_mu,
    "Disc Akh(Mu)" AS diskon_akhir_mu,
    "Subtot Net(Mu)" AS subtotal_bersih_mu,
    "Pjk(Mu)" AS pajak_mu,
    "Subtot Net Pjk(Mu)" AS subtotal_bersih_pajak_mu,
    "Kode Kota" AS kode_kota,
    "Nama Kota" AS nama_kota
FROM "postgres"."public"."raw_sales"
  );