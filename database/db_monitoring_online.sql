-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2020 at 09:53 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_monitoring_online`
--

-- --------------------------------------------------------

--
-- Table structure for table `ms_guru`
--

CREATE TABLE `ms_guru` (
  `id_guru` int(11) NOT NULL,
  `nik_guru` varchar(16) DEFAULT NULL,
  `nama_guru` varchar(50) NOT NULL,
  `jenis_kelamin_guru` varchar(10) NOT NULL,
  `tgl_lahir_guru` date NOT NULL,
  `alamat_guru` text NOT NULL,
  `agama_guru` varchar(25) NOT NULL,
  `no_telp_guru` varchar(15) DEFAULT NULL,
  `email_guru` varchar(50) DEFAULT NULL,
  `img_guru` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ms_guru`
--

INSERT INTO `ms_guru` (`id_guru`, `nik_guru`, `nama_guru`, `jenis_kelamin_guru`, `tgl_lahir_guru`, `alamat_guru`, `agama_guru`, `no_telp_guru`, `email_guru`, `img_guru`) VALUES
(1, '2138420123890120', 'Dwi Slamet Santoso', 'Laki-Laki', '1991-02-13', 'Sengkaling', 'Islam', '081238923982', 'dwislamet@gmail.com', '429_090920151524.png');

-- --------------------------------------------------------

--
-- Table structure for table `ms_kelas`
--

CREATE TABLE `ms_kelas` (
  `id_kelas` int(11) NOT NULL,
  `detail_kelas` varchar(50) NOT NULL,
  `id_tahun_ajaran` int(11) NOT NULL,
  `id_wali_kelas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ms_kelas`
--

INSERT INTO `ms_kelas` (`id_kelas`, `detail_kelas`, `id_tahun_ajaran`, `id_wali_kelas`) VALUES
(1, 'XI RPLA', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ms_pembimbing`
--

CREATE TABLE `ms_pembimbing` (
  `id_pembimbing` int(11) NOT NULL,
  `nama_pembimbing` varchar(50) NOT NULL,
  `tgl_lahir_pembimbing` date NOT NULL,
  `agama_pembimbing` varchar(25) NOT NULL,
  `jenis_kelamin_pembimbing` varchar(10) NOT NULL,
  `alamat_pembimbing` text NOT NULL,
  `email_pembimbing` varchar(50) NOT NULL,
  `no_telp_pembimbing` varchar(15) NOT NULL,
  `img_pembimbing` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ms_pembimbing`
--

INSERT INTO `ms_pembimbing` (`id_pembimbing`, `nama_pembimbing`, `tgl_lahir_pembimbing`, `agama_pembimbing`, `jenis_kelamin_pembimbing`, `alamat_pembimbing`, `email_pembimbing`, `no_telp_pembimbing`, `img_pembimbing`) VALUES
(1, 'Ervin Kurniawan', '1984-06-12', 'Islam', 'Laki-Laki', 'Malang', 'laporanprakerinskariga@gmail.com', '08239210293', '2457_280920122007.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `ms_siswa`
--

CREATE TABLE `ms_siswa` (
  `nis_siswa` varchar(10) NOT NULL,
  `nama_siswa` varchar(50) NOT NULL,
  `tgl_lahir_siswa` date NOT NULL,
  `jenis_kelamin_siswa` varchar(10) NOT NULL,
  `agama_siswa` varchar(25) NOT NULL,
  `nama_ortu` varchar(50) NOT NULL,
  `telp_ortu` varchar(15) NOT NULL,
  `alamat_siswa` text NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_tempat_prakerin` int(11) NOT NULL,
  `img_siswa` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ms_siswa`
--

INSERT INTO `ms_siswa` (`nis_siswa`, `nama_siswa`, `tgl_lahir_siswa`, `jenis_kelamin_siswa`, `agama_siswa`, `nama_ortu`, `telp_ortu`, `alamat_siswa`, `id_kelas`, `id_tempat_prakerin`, `img_siswa`) VALUES
('19801', 'Bagas Lintang Wicaksono', '2003-07-18', 'Laki-Laki', 'Islam', 'Lintang', '085101635250', 'Kasembon', 1, 3, 'default.png'),
('19820', 'Muhammad Andika Dayu Anglita Putra', '2003-07-28', 'Laki-Laki', 'Islam', 'Suwanto', '085101635250', 'Jl Dawuhan Tegalgondo', 1, 3, '2224_071020105001.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `ms_tahun_ajaran`
--

CREATE TABLE `ms_tahun_ajaran` (
  `id_tahun_ajaran` int(11) NOT NULL,
  `tahun_awal` int(4) NOT NULL,
  `tahun_akhir` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ms_tahun_ajaran`
--

INSERT INTO `ms_tahun_ajaran` (`id_tahun_ajaran`, `tahun_awal`, `tahun_akhir`) VALUES
(2, 2019, 2020),
(3, 2018, 2019);

-- --------------------------------------------------------

--
-- Table structure for table `ms_tempat_prakerin`
--

CREATE TABLE `ms_tempat_prakerin` (
  `id_tempat_prakerin` int(11) NOT NULL,
  `detail_tempat` varchar(50) NOT NULL,
  `alamat_tempat` text NOT NULL,
  `telp_kantor` varchar(15) DEFAULT NULL,
  `email_kantor` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ms_tempat_prakerin`
--

INSERT INTO `ms_tempat_prakerin` (`id_tempat_prakerin`, `detail_tempat`, `alamat_tempat`, `telp_kantor`, `email_kantor`) VALUES
(2, 'PT Girisa', 'Malang Malang', '0212208802', 'girisa@gmail.com'),
(3, 'PT Internusa Cipta Solusi Perdana', 'Jakarta', '021345678', 'info@icsp.co.id');

-- --------------------------------------------------------

--
-- Table structure for table `ms_users`
--

CREATE TABLE `ms_users` (
  `id_user` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(25) NOT NULL,
  `id_pembimbing` int(11) DEFAULT NULL,
  `id_siswa_detail` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ms_users`
--

INSERT INTO `ms_users` (`id_user`, `email`, `password`, `role`, `id_pembimbing`, `id_siswa_detail`) VALUES
(1, 'admin@admin.com', 'admin', 'Admin', NULL, NULL),
(2, 'laporanprakerinskariga@gmail.com', 'smkbisa', 'Pembimbing', 1, NULL),
(3, 'dikapolk@gmail.com', 'andika', 'Siswa', NULL, '19820');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jurnal`
--

CREATE TABLE `tb_jurnal` (
  `id_jurnal` int(11) NOT NULL,
  `nis_siswa` varchar(10) NOT NULL,
  `jam_masuk` time NOT NULL,
  `jam_keluar` time NOT NULL,
  `prosedur_kerja` text DEFAULT NULL,
  `kegiatan_kerja` text DEFAULT NULL,
  `spesifikasi_bahan` text DEFAULT NULL,
  `tgl_jurnal` date NOT NULL,
  `is_valid` int(2) DEFAULT 0,
  `id_pembimbing` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_jurnal`
--

INSERT INTO `tb_jurnal` (`id_jurnal`, `nis_siswa`, `jam_masuk`, `jam_keluar`, `prosedur_kerja`, `kegiatan_kerja`, `spesifikasi_bahan`, `tgl_jurnal`, `is_valid`, `id_pembimbing`) VALUES
(1, '19820', '09:00:00', '17:00:00', '<ol><li>Nyalakan Laptop</li><li>Membuka Sublime dan Browser</li><li>Meniru cara membuat tabel di browser bootstrap</li></ol>', '<ol><li>Membuat Tabel dengan class Bootstrap</li></ol>', '<ol><li>Laptop</li><li>Browser</li><li>Sublime</li><li>Database</li></ol>', '2020-10-14', 1, 2),
(2, '19820', '09:00:00', '17:00:00', '<ol><li>Hidupkan Laptop</li><li>Membuka CMD</li><li>Create project laravel melalui composer</li></ol>', '<ol><li>Membuat Project Laravel</li></ol>', '<ol><li>Laptop</li><li>CMD dengan Composer</li></ol>', '2020-10-16', 1, 2),
(3, '19820', '01:12:00', '11:16:00', 'beli kopi', '<ul><li>ngopi</li></ul>', '<p>gelas</p><p>kopi</p>', '2020-10-29', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tb_laporan_prakerin`
--

CREATE TABLE `tb_laporan_prakerin` (
  `id_laporan` int(11) NOT NULL,
  `nis_siswa` varchar(10) NOT NULL,
  `judul_laporan` varchar(75) NOT NULL,
  `file_laporan` text NOT NULL,
  `tgl_laporan` date NOT NULL,
  `lp_valid` int(2) DEFAULT 0,
  `id_pembimbing` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_laporan_prakerin`
--

INSERT INTO `tb_laporan_prakerin` (`id_laporan`, `nis_siswa`, `judul_laporan`, `file_laporan`, `tgl_laporan`, `lp_valid`, `id_pembimbing`) VALUES
(1, '19820', 'Aplikasi Monitoring Prakerin Online', '19820_Laporan_111020122853.pdf', '2020-10-11', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tb_monitoring`
--

CREATE TABLE `tb_monitoring` (
  `id_monitoring` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `tgl_monitoring` date NOT NULL,
  `division` varchar(75) NOT NULL,
  `evaluasi_hasil` text NOT NULL,
  `penyelesaian` text NOT NULL,
  `id_tempat_prakerin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_monitoring`
--

INSERT INTO `tb_monitoring` (`id_monitoring`, `id_user`, `tgl_monitoring`, `division`, `evaluasi_hasil`, `penyelesaian`, `id_tempat_prakerin`) VALUES
(6, 2, '2020-10-22', 'TIK', '<ol><li>Aman</li></ol>', '<ol><li>Tidak Ada</li></ol>', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_monitoring_detail`
--

CREATE TABLE `tb_monitoring_detail` (
  `id_monitoring_detail` int(11) NOT NULL,
  `id_monitoring` int(11) NOT NULL,
  `nis_siswa` varchar(10) NOT NULL,
  `check_jurnal` int(2) DEFAULT 0,
  `check_apd` int(2) DEFAULT 0,
  `check_rambut` int(2) DEFAULT 0,
  `check_lksp` int(2) DEFAULT 0,
  `check_kinerja` int(2) DEFAULT 0,
  `check_penampilan` int(2) DEFAULT 0,
  `alpa_siswa` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_monitoring_detail`
--

INSERT INTO `tb_monitoring_detail` (`id_monitoring_detail`, `id_monitoring`, `nis_siswa`, `check_jurnal`, `check_apd`, `check_rambut`, `check_lksp`, `check_kinerja`, `check_penampilan`, `alpa_siswa`) VALUES
(1, 6, '19801', NULL, NULL, NULL, 1, 1, NULL, '12 Nov 2019, 17 Nov 2019'),
(2, 6, '19820', NULL, NULL, NULL, 1, 1, NULL, '13 Nov 2019 , 18 Nov 2019');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ms_guru`
--
ALTER TABLE `ms_guru`
  ADD PRIMARY KEY (`id_guru`);

--
-- Indexes for table `ms_kelas`
--
ALTER TABLE `ms_kelas`
  ADD PRIMARY KEY (`id_kelas`),
  ADD KEY `id_tahun_ajaran` (`id_tahun_ajaran`),
  ADD KEY `id_wali_kelas` (`id_wali_kelas`);

--
-- Indexes for table `ms_pembimbing`
--
ALTER TABLE `ms_pembimbing`
  ADD PRIMARY KEY (`id_pembimbing`);

--
-- Indexes for table `ms_siswa`
--
ALTER TABLE `ms_siswa`
  ADD PRIMARY KEY (`nis_siswa`),
  ADD KEY `id_tempat_prakerin` (`id_tempat_prakerin`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indexes for table `ms_tahun_ajaran`
--
ALTER TABLE `ms_tahun_ajaran`
  ADD PRIMARY KEY (`id_tahun_ajaran`);

--
-- Indexes for table `ms_tempat_prakerin`
--
ALTER TABLE `ms_tempat_prakerin`
  ADD PRIMARY KEY (`id_tempat_prakerin`);

--
-- Indexes for table `ms_users`
--
ALTER TABLE `ms_users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_pembimbing` (`id_pembimbing`),
  ADD KEY `id_siswa_detail` (`id_siswa_detail`);

--
-- Indexes for table `tb_jurnal`
--
ALTER TABLE `tb_jurnal`
  ADD PRIMARY KEY (`id_jurnal`),
  ADD KEY `nis_siswa` (`nis_siswa`),
  ADD KEY `id_pembimbing` (`id_pembimbing`);

--
-- Indexes for table `tb_laporan_prakerin`
--
ALTER TABLE `tb_laporan_prakerin`
  ADD PRIMARY KEY (`id_laporan`),
  ADD KEY `id_pembimbing` (`id_pembimbing`),
  ADD KEY `nis_siswa` (`nis_siswa`);

--
-- Indexes for table `tb_monitoring`
--
ALTER TABLE `tb_monitoring`
  ADD PRIMARY KEY (`id_monitoring`),
  ADD KEY `id_tempat_prakerin` (`id_tempat_prakerin`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `tb_monitoring_detail`
--
ALTER TABLE `tb_monitoring_detail`
  ADD PRIMARY KEY (`id_monitoring_detail`),
  ADD KEY `id_monitoring` (`id_monitoring`),
  ADD KEY `nis_siswa` (`nis_siswa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ms_guru`
--
ALTER TABLE `ms_guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ms_kelas`
--
ALTER TABLE `ms_kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ms_pembimbing`
--
ALTER TABLE `ms_pembimbing`
  MODIFY `id_pembimbing` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ms_tahun_ajaran`
--
ALTER TABLE `ms_tahun_ajaran`
  MODIFY `id_tahun_ajaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ms_tempat_prakerin`
--
ALTER TABLE `ms_tempat_prakerin`
  MODIFY `id_tempat_prakerin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ms_users`
--
ALTER TABLE `ms_users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_jurnal`
--
ALTER TABLE `tb_jurnal`
  MODIFY `id_jurnal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_laporan_prakerin`
--
ALTER TABLE `tb_laporan_prakerin`
  MODIFY `id_laporan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_monitoring`
--
ALTER TABLE `tb_monitoring`
  MODIFY `id_monitoring` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_monitoring_detail`
--
ALTER TABLE `tb_monitoring_detail`
  MODIFY `id_monitoring_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ms_kelas`
--
ALTER TABLE `ms_kelas`
  ADD CONSTRAINT `ms_kelas_ibfk_1` FOREIGN KEY (`id_tahun_ajaran`) REFERENCES `ms_tahun_ajaran` (`id_tahun_ajaran`),
  ADD CONSTRAINT `ms_kelas_ibfk_2` FOREIGN KEY (`id_wali_kelas`) REFERENCES `ms_guru` (`id_guru`);

--
-- Constraints for table `ms_siswa`
--
ALTER TABLE `ms_siswa`
  ADD CONSTRAINT `ms_siswa_ibfk_1` FOREIGN KEY (`id_tempat_prakerin`) REFERENCES `ms_tempat_prakerin` (`id_tempat_prakerin`),
  ADD CONSTRAINT `ms_siswa_ibfk_2` FOREIGN KEY (`id_kelas`) REFERENCES `ms_kelas` (`id_kelas`);

--
-- Constraints for table `ms_users`
--
ALTER TABLE `ms_users`
  ADD CONSTRAINT `ms_users_ibfk_1` FOREIGN KEY (`id_pembimbing`) REFERENCES `ms_pembimbing` (`id_pembimbing`),
  ADD CONSTRAINT `ms_users_ibfk_2` FOREIGN KEY (`id_siswa_detail`) REFERENCES `ms_siswa` (`nis_siswa`);

--
-- Constraints for table `tb_jurnal`
--
ALTER TABLE `tb_jurnal`
  ADD CONSTRAINT `tb_jurnal_ibfk_1` FOREIGN KEY (`nis_siswa`) REFERENCES `ms_siswa` (`nis_siswa`),
  ADD CONSTRAINT `tb_jurnal_ibfk_2` FOREIGN KEY (`id_pembimbing`) REFERENCES `ms_users` (`id_user`);

--
-- Constraints for table `tb_laporan_prakerin`
--
ALTER TABLE `tb_laporan_prakerin`
  ADD CONSTRAINT `tb_laporan_prakerin_ibfk_1` FOREIGN KEY (`id_pembimbing`) REFERENCES `ms_users` (`id_user`),
  ADD CONSTRAINT `tb_laporan_prakerin_ibfk_2` FOREIGN KEY (`nis_siswa`) REFERENCES `ms_siswa` (`nis_siswa`);

--
-- Constraints for table `tb_monitoring`
--
ALTER TABLE `tb_monitoring`
  ADD CONSTRAINT `tb_monitoring_ibfk_1` FOREIGN KEY (`id_tempat_prakerin`) REFERENCES `ms_tempat_prakerin` (`id_tempat_prakerin`),
  ADD CONSTRAINT `tb_monitoring_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `ms_users` (`id_user`);

--
-- Constraints for table `tb_monitoring_detail`
--
ALTER TABLE `tb_monitoring_detail`
  ADD CONSTRAINT `tb_monitoring_detail_ibfk_1` FOREIGN KEY (`id_monitoring`) REFERENCES `tb_monitoring` (`id_monitoring`),
  ADD CONSTRAINT `tb_monitoring_detail_ibfk_2` FOREIGN KEY (`nis_siswa`) REFERENCES `ms_siswa` (`nis_siswa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
