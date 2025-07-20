# 📊 Penjualan Data Model & Dashboard Documentation

## 1. 🧱 Overall Data Model

Model ini dibangun berdasarkan pendekatan **star schema**, dengan satu tabel fakta utama (`fakta_penjualan`) yang terhubung ke beberapa tabel dimensi. Semua model ini didefinisikan dan divalidasi menggunakan **DBT (Data Build Tool)**.

### 🌟 Fakta: `fakta_penjualan`

Tabel pusat yang berisi data transaksi penjualan granular. Tiap baris mewakili satu transaksi.

| Kolom             | Tipe     | Deskripsi |
|-------------------|----------|-----------|
| `id_penjualan`    | Integer  | ID unik untuk transaksi |
| `kunci_tanggal`   | Date     | Tanggal transaksi |
| `kode_pelanggan`  | String   | Kode pelanggan |
| `kode_barang`     | String   | Kode produk |
| `kode_sales`      | String   | Kode sales |
| `kode_kota`       | String   | Kode kota transaksi |
| `jumlah`          | Integer  | Jumlah barang terjual |
| `total_mu`        | Numeric  | Total nilai transaksi |
| `pajak_mu`        | Numeric  | Pajak atas transaksi |

### 🧩 Dimensi:

| Nama Tabel      | Kunci Utama     | Atribut Utama          |
|------------------|------------------|--------------------------|
| `dim_pelanggan`  | `kode_pelanggan` | `nama_pelanggan`         |
| `dim_produk`     | `kode_barang`    | `nama_jenis_barang`      |
| `dim_sales`      | `kode_sales`     | `nama_sales`             |
| `dim_lokasi`     | `kode_kota`      | `nama_kota`              |
| `dim_tanggal`    | `kunci_tanggal`  | `tahun`, `bulan`         |

Relasi antar tabel telah diuji menggunakan `unique` dan `not_null` tests untuk menjaga integritas data dan mencegah duplikasi saat dilakukan join.

---

## 2. 🧠 Assumptions Made

- Data berasal dari `raw_sales`, yang telah dibersihkan melalui model `stg_penjualan`.
- Setiap tabel dimensi memiliki baris **unik** berdasarkan primary key-nya.
- Semua nilai `total_mu` dan `pajak_mu` menggunakan satuan moneter yang konsisten.
- Tidak ada diskon atau komponen biaya tambahan lain di luar `total_mu` dan `pajak_mu`.
- Semua join dilakukan melalui key sederhana (`kode_*`, `kunci_tanggal`) tanpa transformasi kompleks.
- `dim_tanggal` dibentuk langsung dari field `tanggal` pada transaksi (tanpa kalender lengkap).

---

## 3. 🎯 Dashboard Goals & Contents
Dashboard hanya menggunakan **satu dataset utama** (fakta_penjualan) agar filter global konsisten dan performa optimal.
Dashboard ini dibangun dengan **Apache Superset / Preset.io** dan ditujukan untuk:

- Manajer Penjualan
- Tim Sales & Distribusi
- Tim Keuangan atau Pajak
- Analis Bisnis

### 📌 Goals:
- Menyediakan overview performa penjualan secara menyeluruh
- Mengidentifikasi tren penjualan dan pajak dari waktu ke waktu
- Menilai performa per produk, kota, pelanggan, dan sales
- Memberikan insight berbasis data yang langsung bisa diakses oleh user non-teknis

---

## 4. 📊 Dashboard Sections

### 🧮 KPI Summary (Big Numbers)
- 💰 Total Penjualan (SUM total_mu)
- 📦 Total Barang Terjual (SUM jumlah)
- 🧾 Total Pajak (SUM pajak_mu)
- 👥 Jumlah Pelanggan Unik (COUNT kode_pelanggan)

### 📈 Trend Over Time (Time Series)
- Penjualan Bulanan
- Pajak Bulanan
- Volume Barang Bulanan

### 📊 Dimensional Breakdown (via kode)
- Penjualan per Kota (kode_kota)
- Produk Terlaris (kode_barang)
- Top Pelanggan (kode_pelanggan)

### 📄 Detail View
- Tabel Interaktif lengkap untuk keperluan granular/investigatif

---

## 5. 🔜 Future Enhancements
- Join ke dimensi (`dim_pelanggan`, `dim_produk`, dsb.) untuk menampilkan nama lengkap
- Penggunaan filter cascade antar entitas
- Visualisasi geo berdasarkan `kode_kota`

---
## 🖼️ Dashboard Preview

![Dashboard Screenshot](https://raw.githubusercontent.com/zareee12/dbt-sales-reporting/main/image/screenshot.png)


