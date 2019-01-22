-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Jan 2019 pada 15.30
-- Versi server: 10.1.36-MariaDB
-- Versi PHP: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sierra_oscar`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `finance_income`
--

CREATE TABLE `finance_income` (
  `id_finance_income` int(5) NOT NULL,
  `nomor_invoice` varchar(20) NOT NULL,
  `jenis_income` varchar(100) NOT NULL,
  `jumlah` int(20) NOT NULL,
  `tanggal_pembayaran` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kamar`
--

CREATE TABLE `kamar` (
  `id_kamar` int(3) NOT NULL,
  `nomor_kamar` int(3) NOT NULL,
  `id_kamar_tipe` int(3) NOT NULL,
  `max_dewasa` int(11) NOT NULL,
  `max_anak` int(11) NOT NULL,
  `status_kamar` varchar(20) NOT NULL DEFAULT 'TERSEDIA'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kamar`
--

INSERT INTO `kamar` (`id_kamar`, `nomor_kamar`, `id_kamar_tipe`, `max_dewasa`, `max_anak`, `status_kamar`) VALUES
(1, 11, 3, 2, 2, 'TERSEDIA'),
(7, 1, 2, 1, 1, 'TERSEDIA'),
(10, 22, 4, 4, 2, 'TERSEDIA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kamar_tipe`
--

CREATE TABLE `kamar_tipe` (
  `id_kamar_tipe` int(3) NOT NULL,
  `nama_kamar_tipe` varchar(50) NOT NULL,
  `harga_malam` int(3) NOT NULL,
  `harga_orang` int(3) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kamar_tipe`
--

INSERT INTO `kamar_tipe` (`id_kamar_tipe`, `nama_kamar_tipe`, `harga_malam`, `harga_orang`, `keterangan`) VALUES
(2, 'STANDAR', 50000, 25000, 'maksimal 4 orang'),
(3, 'SUPERIOR', 100000, 25000, 'maksimal 4 orang'),
(4, 'SUITE', 150000, 30000, 'maksimal 4 orang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `layanan`
--

CREATE TABLE `layanan` (
  `id_layanan` int(3) NOT NULL,
  `nama_layanan` varchar(100) NOT NULL,
  `id_layanan_kategori` int(3) NOT NULL,
  `satuan` varchar(30) NOT NULL,
  `harga_layanan` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `layanan`
--

INSERT INTO `layanan` (`id_layanan`, `nama_layanan`, `id_layanan_kategori`, `satuan`, `harga_layanan`) VALUES
(1, 'NASI GORENG', 1, 'Porsi', 25000),
(2, 'MIE GORENG', 1, 'Porsi', 15000),
(3, 'KOPI HITAM', 2, 'gelas', 5000),
(4, 'PAKET LAUNDRY', 4, 'kilo', 5000),
(5, 'ES TEH', 2, 'gelas', 3000),
(6, 'ES JERUK', 2, 'gelas', 3000),
(7, 'MIE REBUS + TELUR', 1, 'porsi', 10000),
(8, 'MIE REBUS BIASA', 1, 'porsi', 8000),
(9, 'OJEK ( WISATA PARANGTRITIS)', 3, 'motor', 20000),
(10, 'OJEK KE STASIUN / BANDARA', 3, 'motor', 100000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `layanan_kategori`
--

CREATE TABLE `layanan_kategori` (
  `id_layanan_kategori` int(3) NOT NULL,
  `nama_layanan_kategori` varchar(100) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `layanan_kategori`
--

INSERT INTO `layanan_kategori` (`id_layanan_kategori`, `nama_layanan_kategori`, `keterangan`) VALUES
(1, 'FOOD', 'Produk makanan, snack, sarapan dan lain-lain'),
(2, 'DRINK', 'Produk minuman'),
(3, 'TRANSPORTASI', 'Fasilitas transportasi untuk kebutuhan tamu hotel'),
(4, 'LAUNDRY', 'LAUNDRY');

-- --------------------------------------------------------

--
-- Struktur dari tabel `perusahaan`
--

CREATE TABLE `perusahaan` (
  `id_perusahaan` int(100) NOT NULL,
  `nama_hotel` varchar(100) NOT NULL,
  `nama_perusahaan` varchar(100) NOT NULL,
  `alamat_jalan` text NOT NULL,
  `alamat_kabupaten` varchar(50) NOT NULL,
  `alamat_provinsi` varchar(50) NOT NULL,
  `nomor_telp` varchar(20) NOT NULL,
  `nomor_fax` varchar(20) NOT NULL,
  `website` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `perusahaan`
--

INSERT INTO `perusahaan` (`id_perusahaan`, `nama_hotel`, `nama_perusahaan`, `alamat_jalan`, `alamat_kabupaten`, `alamat_provinsi`, `nomor_telp`, `nomor_fax`, `website`, `email`) VALUES
(1, 'SIERRA OSCAR', 'SIERRA OSCAR', 'Jl.parangtritis km 26, grogol X, Parangtritis,Kretek, Bantul, YK', 'bantul', 'DIY', '089666445746', '628(777-7754)', 'www.sierraoscar.com', 'sierraoscar@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tamu`
--

CREATE TABLE `tamu` (
  `id_tamu` int(3) NOT NULL,
  `prefix` varchar(5) NOT NULL,
  `nama_depan` varchar(100) NOT NULL,
  `nama_belakang` varchar(100) NOT NULL,
  `tipe_identitas` varchar(20) NOT NULL,
  `nomor_identitas` varchar(20) NOT NULL,
  `warga_negara` varchar(100) NOT NULL DEFAULT 'Indonesia',
  `alamat_jalan` text NOT NULL,
  `alamat_kabupaten` varchar(100) NOT NULL,
  `alamat_provinsi` varchar(100) NOT NULL,
  `nomor_telp` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pesanan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tamu`
--

INSERT INTO `tamu` (`id_tamu`, `prefix`, `nama_depan`, `nama_belakang`, `tipe_identitas`, `nomor_identitas`, `warga_negara`, `alamat_jalan`, `alamat_kabupaten`, `alamat_provinsi`, `nomor_telp`, `email`, `pesanan`) VALUES
(1, 'Mr', 'bayu', 'artika', 'KTP', '0088345453', 'indonesia', 'grogol x parangtritis kretek bantul yogyakarta', 'bantul', 'DIY', '089666445746', 'bayuartika67@gmail.com', 'LUNAS');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_kamar`
--

CREATE TABLE `transaksi_kamar` (
  `id_transaksi_kamar` int(3) NOT NULL,
  `id_user` int(3) NOT NULL,
  `nomor_invoice` varchar(20) NOT NULL,
  `tanggal` date NOT NULL,
  `id_tamu` int(3) NOT NULL,
  `id_kamar` int(3) NOT NULL,
  `jumlah_dewasa` int(3) NOT NULL,
  `jumlah_anak` int(3) NOT NULL,
  `tanggal_checkin` date NOT NULL,
  `waktu_checkin` time NOT NULL,
  `tanggal_checkout` date NOT NULL,
  `waktu_checkout` time NOT NULL,
  `total_biaya_kamar` int(20) NOT NULL,
  `deposit` int(20) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'CHECK IN'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_layanan`
--

CREATE TABLE `transaksi_layanan` (
  `id_transaksi_layanan` int(3) NOT NULL,
  `id_user` int(3) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL,
  `id_transaksi_kamar` int(3) NOT NULL,
  `id_layanan` int(3) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi_layanan`
--

INSERT INTO `transaksi_layanan` (`id_transaksi_layanan`, `id_user`, `tanggal`, `waktu`, `id_transaksi_kamar`, `id_layanan`, `jumlah`, `total`) VALUES
(30, 1, '2018-08-15', '18:24:00', 20, 3, 1, 85000),
(31, 1, '2018-08-15', '18:24:00', 20, 2, 2, 30000),
(32, 1, '2018-08-15', '18:24:00', 20, 1, 1, 25000),
(33, 1, '2018-08-15', '20:59:00', 24, 4, 5, 50000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(3) NOT NULL,
  `images` varchar(100) NOT NULL DEFAULT 'user.jpg',
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `id_user_role` int(5) NOT NULL,
  `jabatan` varchar(100) NOT NULL,
  `nomor_telp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `images`, `username`, `password`, `nama`, `id_user_role`, `jabatan`, `nomor_telp`) VALUES
(1, 'default.jpg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Nama Administrator', 1, 'Application Developer', '0800 0000 0000'),
(4, 'user.jpg', 'iteung', 'e92ab3bc72b384a3b1e0f7eaee90a863', 'iteung', 4, 'FO', '081565465465465');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_role`
--

CREATE TABLE `user_role` (
  `id_user_role` int(10) NOT NULL,
  `role_name` varchar(100) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_role`
--

INSERT INTO `user_role` (`id_user_role`, `role_name`, `keterangan`) VALUES
(1, 'DEVELOPER', 'Akses khusus untuk pembuat aplikasi'),
(2, 'SUPER ADMINISTRATOR', ''),
(3, 'ADMINISTRATOR', ''),
(4, 'FRONT OFFICE', ''),
(5, 'ROOM SERVICE', '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `finance_income`
--
ALTER TABLE `finance_income`
  ADD PRIMARY KEY (`id_finance_income`);

--
-- Indeks untuk tabel `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`id_kamar`),
  ADD KEY `id_kamar_tipe` (`id_kamar_tipe`);

--
-- Indeks untuk tabel `kamar_tipe`
--
ALTER TABLE `kamar_tipe`
  ADD PRIMARY KEY (`id_kamar_tipe`);

--
-- Indeks untuk tabel `layanan`
--
ALTER TABLE `layanan`
  ADD PRIMARY KEY (`id_layanan`),
  ADD KEY `id_layanan_kategori` (`id_layanan_kategori`);

--
-- Indeks untuk tabel `layanan_kategori`
--
ALTER TABLE `layanan_kategori`
  ADD PRIMARY KEY (`id_layanan_kategori`);

--
-- Indeks untuk tabel `perusahaan`
--
ALTER TABLE `perusahaan`
  ADD PRIMARY KEY (`id_perusahaan`);

--
-- Indeks untuk tabel `tamu`
--
ALTER TABLE `tamu`
  ADD PRIMARY KEY (`id_tamu`);

--
-- Indeks untuk tabel `transaksi_kamar`
--
ALTER TABLE `transaksi_kamar`
  ADD PRIMARY KEY (`id_transaksi_kamar`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_tamu` (`id_tamu`),
  ADD KEY `id_kamar` (`id_kamar`);

--
-- Indeks untuk tabel `transaksi_layanan`
--
ALTER TABLE `transaksi_layanan`
  ADD PRIMARY KEY (`id_transaksi_layanan`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_layanan` (`id_layanan`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_user_role` (`id_user_role`);

--
-- Indeks untuk tabel `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id_user_role`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `finance_income`
--
ALTER TABLE `finance_income`
  MODIFY `id_finance_income` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kamar`
--
ALTER TABLE `kamar`
  MODIFY `id_kamar` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `kamar_tipe`
--
ALTER TABLE `kamar_tipe`
  MODIFY `id_kamar_tipe` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `layanan`
--
ALTER TABLE `layanan`
  MODIFY `id_layanan` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `layanan_kategori`
--
ALTER TABLE `layanan_kategori`
  MODIFY `id_layanan_kategori` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `perusahaan`
--
ALTER TABLE `perusahaan`
  MODIFY `id_perusahaan` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tamu`
--
ALTER TABLE `tamu`
  MODIFY `id_tamu` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `transaksi_kamar`
--
ALTER TABLE `transaksi_kamar`
  MODIFY `id_transaksi_kamar` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `transaksi_layanan`
--
ALTER TABLE `transaksi_layanan`
  MODIFY `id_transaksi_layanan` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id_user_role` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `kamar`
--
ALTER TABLE `kamar`
  ADD CONSTRAINT `kamar_ibfk_1` FOREIGN KEY (`id_kamar_tipe`) REFERENCES `kamar_tipe` (`id_kamar_tipe`);

--
-- Ketidakleluasaan untuk tabel `layanan`
--
ALTER TABLE `layanan`
  ADD CONSTRAINT `layanan_ibfk_1` FOREIGN KEY (`id_layanan_kategori`) REFERENCES `layanan_kategori` (`id_layanan_kategori`);

--
-- Ketidakleluasaan untuk tabel `transaksi_kamar`
--
ALTER TABLE `transaksi_kamar`
  ADD CONSTRAINT `transaksi_kamar_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `transaksi_kamar_ibfk_2` FOREIGN KEY (`id_tamu`) REFERENCES `tamu` (`id_tamu`),
  ADD CONSTRAINT `transaksi_kamar_ibfk_3` FOREIGN KEY (`id_kamar`) REFERENCES `kamar` (`id_kamar`);

--
-- Ketidakleluasaan untuk tabel `transaksi_layanan`
--
ALTER TABLE `transaksi_layanan`
  ADD CONSTRAINT `transaksi_layanan_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `transaksi_layanan_ibfk_2` FOREIGN KEY (`id_layanan`) REFERENCES `layanan` (`id_layanan`);

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_user_role`) REFERENCES `user_role` (`id_user_role`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
