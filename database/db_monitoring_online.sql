-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 15, 2020 at 02:40 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
  `nama_guru` varchar(50) DEFAULT NULL,
  `jenis_kelamin_guru` varchar(10) DEFAULT NULL,
  `tgl_lahir_guru` date DEFAULT NULL,
  `alamat_guru` text DEFAULT NULL,
  `agama_guru` varchar(25) DEFAULT NULL,
  `no_telp_guru` varchar(15) DEFAULT NULL,
  `email_guru` varchar(50) DEFAULT NULL,
  `img_guru` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ms_guru`
--

INSERT INTO `ms_guru` (`id_guru`, `nik_guru`, `nama_guru`, `jenis_kelamin_guru`, `tgl_lahir_guru`, `alamat_guru`, `agama_guru`, `no_telp_guru`, `email_guru`, `img_guru`) VALUES
(1, NULL, 'Dwi Slamet Santoso, SS, M.Pd\n', 'Laki-Laki', NULL, 'Sengkaling', 'Islam', NULL, NULL, 'default.png');

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
(1, 'XII', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ms_pembimbing`
--

CREATE TABLE `ms_pembimbing` (
  `id_pembimbing` int(11) NOT NULL,
  `nama_pembimbing` varchar(50) DEFAULT NULL,
  `tgl_lahir_pembimbing` date DEFAULT NULL,
  `agama_pembimbing` varchar(25) DEFAULT NULL,
  `jenis_kelamin_pembimbing` varchar(10) DEFAULT NULL,
  `alamat_pembimbing` text DEFAULT NULL,
  `email_pembimbing` varchar(50) DEFAULT NULL,
  `no_telp_pembimbing` varchar(15) DEFAULT NULL,
  `img_pembimbing` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ms_pembimbing`
--

INSERT INTO `ms_pembimbing` (`id_pembimbing`, `nama_pembimbing`, `tgl_lahir_pembimbing`, `agama_pembimbing`, `jenis_kelamin_pembimbing`, `alamat_pembimbing`, `email_pembimbing`, `no_telp_pembimbing`, `img_pembimbing`) VALUES
(1, 'Anthoni Rahman ST', '1978-10-09', 'Islam', 'Laki-Laki', 'Jl Anusopati No. 218 RT 05/RW 07 Candirenggo Singosari Malang   ', NULL, '+6281231678058', 'default.png'),
(2, 'Arif Isa Fakhrudi S. Pd', '1989-05-04', 'Islam', 'Laki-Laki', 'Rt.04 Rw.12 Dsn. Wonorejo Ds. Tulungrejo Kec. Bumiaji kota Batu  ', NULL, '+6281331818807', 'default.png'),
(3, 'Ervin Kurniawan S.Kom', '1984-09-24', 'Islam', 'Laki-Laki', 'Amadanom Rt.05/Rw.04 Dampit  ', 'laporanprakerinskariga@gmail.com', '+6281944944916', 'default.png'),
(4, 'Joko Mulyono A.Md', '1971-07-27', 'Islam', 'Laki-Laki', 'Imam Sujono 33 Rt.01/Rw.04 Bulukerto ', NULL, '+6281215805898', 'default.png'),
(5, 'Kamsuri S. Pd', '1976-10-16', 'Islam', 'Laki-Laki', 'Sumbersari V/480 Malang ', NULL, '+6285233470102', 'default.png'),
(6, 'Mustafa Darmanto ST', '1981-09-11', 'Islam', 'Laki-Laki', 'Perum Arjuna View Kav 27 Semanding Dau Malang   ', NULL, '+6285109680456', 'default.png');

-- --------------------------------------------------------

--
-- Table structure for table `ms_siswa`
--

CREATE TABLE `ms_siswa` (
  `nis_siswa` varchar(10) NOT NULL,
  `nama_siswa` varchar(50) DEFAULT NULL,
  `tgl_lahir_siswa` date DEFAULT NULL,
  `jenis_kelamin_siswa` varchar(10) DEFAULT NULL,
  `agama_siswa` varchar(25) DEFAULT NULL,
  `nama_ortu` varchar(50) DEFAULT NULL,
  `telp_ortu` varchar(15) DEFAULT NULL,
  `alamat_siswa` text DEFAULT NULL,
  `id_kelas` int(11) DEFAULT NULL,
  `id_tempat_prakerin` int(11) DEFAULT NULL,
  `img_siswa` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ms_siswa`
--

INSERT INTO `ms_siswa` (`nis_siswa`, `nama_siswa`, `tgl_lahir_siswa`, `jenis_kelamin_siswa`, `agama_siswa`, `nama_ortu`, `telp_ortu`, `alamat_siswa`, `id_kelas`, `id_tempat_prakerin`, `img_siswa`) VALUES
('18411', 'Arfando Wiyono Pamungkas', NULL, NULL, 'Islam', 'Suyono', '0', 'Kol.Sugiono No.07 RT. 4 RW. 6 Kel. Gadang Kec. Sukun Kota Malang-Jawa Timur', 1, NULL, 'default.png'),
('18615', 'Ahmad Faiz Satriawan', NULL, NULL, 'Islam', 'Mamik Suryono', '081359659471', 'Klampok Kasri No.183 RT. 10 RW. 2 Kel. Gadingkasri Kec. Klojen Kota Malang-Jawa Timur', 1, NULL, 'default.png'),
('18640', 'Elgi Aqmal Firdaus', NULL, NULL, 'Islam', 'Ely Priono', '081232034339', 'Jl. Bung Tomo  RT. 10 RW. 2 Dusun Kemteng Kel. Ngantru Kec. Ngantang Kabupaten Malang-Jawa Timur', 1, NULL, 'default.png'),
('18664', 'Jangkung Sadewo Putro', NULL, NULL, 'Islam', 'Mujiono', '085101409013', 'Imam Sujono No.25 RT. 2 RW. 4 Kel. Mulyorejo Kec. Sukun Kota Malang-Jawa Timur', 1, NULL, 'default.png'),
('18680', 'Muhammad Misbachul Fu Ad', NULL, NULL, 'Islam', 'Sukrul Amin Hanafi', '085106877474', 'Jl Jendral Basuki Rahmad Gg Ii B/880 RT. 05 RW. 02 Kel. Kauman Kec. Klojen Kota Malang-Jawa Timur', 1, NULL, 'default.png'),
('18769', 'Galang Catur Wahyu Permadi', NULL, NULL, 'Islam', 'Sujarwo', '081450297963', 'Indragiri No.32 RT. 8 RW. 2 Dusun Kebonsari Kel. Sumberagung Kec. Ngantang Kabupaten Malang-Jawa Timur', 1, NULL, 'default.png'),
('18823', 'Rifqi Pratama Putra', NULL, NULL, 'Islam', 'Didik Sugiantoro', '081554671727', 'Jl Panderman No. 01 RT. 01 RW. 08 Dusun Junggo Kel. Tulungrejo Kec. Bumiaji Kota Batu-Jawa Timur', 1, NULL, 'default.png'),
('18855', 'Yoga Kurniawan', NULL, NULL, 'Islam', 'Riska Kurnia', '081932682731', 'Banduarjo I RT. 47 RW. 11 Kel. Sumberpetung Kec. Kalipare Kabupaten Malang-Jawa Timur', 1, NULL, 'default.png'),
('18871', 'Haidir Rahul Hammed', NULL, NULL, 'Islam', 'Ahmad Basori', '081803715865', 'Pandawa Ii No.7E RT. 14 RW. 3 Kel. Pendem Kec. Junrejo Kota Batu-Jawa Timur', 1, NULL, 'default.png'),
('19115', 'Nelvi Ayunda Fatimatuzzahra', NULL, NULL, 'Islam', 'Fatkul Amin', '081238117009', 'Jl Bridgjen Abd. Manan Wijaya RT. 20 RW. 10 Dusun Krajan Kel. -- Kec. -- ---Jawa Timur', 1, NULL, 'default.png'),
('19121', 'R. Mukhlisul Ilman Muhammad', NULL, NULL, 'Islam', 'Eko Santoso', '081937975735', 'Jl.Mayjen Panjaitan Xv No.4B RT. 3 RW. 6 Kel. Penanggungan Kec. Klojen Kota Malang-Jawa Timur', 1, NULL, 'default.png'),
('19154', 'Ananta Arviansah', NULL, NULL, 'Islam', 'Yasin', '08983218560', 'Teratai Kel. -- Kec. Bumiaji Kota Batu-Jawa Timur', 1, NULL, 'default.png'),
('19159', 'Devi Ashlihatu Amaliyah Putri', NULL, NULL, 'Islam', 'Rooswidodo Nugroho', '082257306634', 'Mojosantri No.10 RT. 1 RW. 7 Kel. Mojorejo Kec. Junrejo Kota Batu-Jawa Timur', 1, NULL, 'default.png'),
('19244', 'Abdul Salam Raihan Syah Alam Sabilillah', NULL, NULL, 'Islam', 'Irawan', '0895367395808', 'JL MULYODADI NO 51 A RT.01/RW.01Dsn.JETAK UTARA Kel.Mulyoagung Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19245', 'Abhiyasha Cipta Dewantara', NULL, NULL, 'Islam', 'Hendro Agus Sucipto', '089638968811', 'MAWAR NO.17 RT.13/RW.8Dsn.KAJAR Kel.Pandanrejo Kec.Bumiaji-Kota Batu Jawa Timur', 1, NULL, 'default.png'),
('19246', 'Adam Noval Ramadhan', NULL, NULL, 'Islam', 'Rochman', '081333019222', 'SUMBERSARI 1B NO.17 RT.1/RW.1 Kel.Kolursari Kec.Bangil-Kabupaten Pasuruan Jawa Timur 65145', 1, NULL, 'default.png'),
('19247', 'Afif Maulana', NULL, NULL, 'Islam', 'Suprapto', '081347344139', 'RT.22/RW.06Dsn.Leban Kel.Tawangargo Kec.Karangploso-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19248', 'Afrian Roy Anggoro', NULL, NULL, 'Islam', 'Djumar', '087859004160', 'RAMBUTAN NO.34 RT.6/RW.1Dsn.PRABON Kel.Kaumrejo Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19249', 'Afrian Yuhan Fado Pradika', NULL, NULL, 'Islam', 'Rubiati', '081233024456', 'BRANTAS NO.1 RT.5/RW.1Dsn.5= Kel.- Kec.--- -', 1, NULL, 'default.png'),
('19250', 'Agung Hendrawan', NULL, NULL, 'Islam', 'Sochib', '08563569769', 'JL. SIMPANG SUROPATI NO.01 RT.01/RW.03Dsn.LOSARI Kel.Losari Kec.Singosari-Kabupaten Malang Jawa Timur 65153', 1, NULL, 'default.png'),
('19251', 'Agung Setyawan Giantama', NULL, NULL, 'Islam', 'Sugianto', '085536352038', 'kauman RT.4/RW.1 Kel.Girimoyo Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19252', 'Ahmad Saiful Hukama', NULL, NULL, 'Islam', 'Miselan', '085731702340', 'SUMBERAGUNG RT.22/RW.5Dsn.BENDOREJO Kel.Sumberagung Kec.Ngantang-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19253', 'Aji Nugroho', NULL, NULL, 'Islam', 'Heri Sugianto', '0895330678302', 'JL. KERTO ASRI NO. 82E RT.08/RW.01 Kel.Ketawanggede Kec.Lowokwaru-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19254', 'Akhsya Sukma Atikasari', NULL, NULL, 'Islam', 'Riyono', '085234386863', 'JL. DAHLIA NO.21 RT.34/RW.08Dsn.SEKAR PUTIH Kel.Pendem Kec.Junrejo-Kota Batu Jawa Timur 65324', 1, NULL, 'default.png'),
('19255', 'Aldo Delvyano', NULL, NULL, 'Islam', 'Mulyono', '082139229566', 'RT./RW. Kel.Ngantru Kec.Ngantang-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19256', 'Al Rizky Candra Danantya', NULL, NULL, 'Islam', 'Anang Suhartono', '08179664176', 'letjen sutoyo III no.46E RT.3/RW.3 Kel.Lowokwaru Kec.Lowokwaru-Kota Malang Jawa Timur 65141', 1, NULL, 'default.png'),
('19257', 'Alvin Rafliane Dica Pramudya Wijaya', NULL, NULL, 'Islam', 'Victor Satya Nugroho', '089682173481', 'IKAN GURAMI NO.10 RT.3/RW.6Dsn.BRINGIN Kel.Tunjungsekar Kec.Lowokwaru-Kota Malang Jawa Timur 65142', 1, NULL, 'default.png'),
('19258', 'Anang Ifrandi', NULL, NULL, 'Islam', 'Subakti', '081234488644', 'Lang-lang No 01 RT.01/RW.01Dsn.Lang-lang Kel.Langlang Kec.Singosari-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19259', 'Ananta Diva Pitaloka', NULL, NULL, 'Islam', 'Christanto Yuwono', '085891084232', 'JL. BULUTANGKIS NO 27 RT.5/RW.3Dsn.SISIR Kel.Sisir Kec.Batu-Kota Batu Jawa Timur 65314', 1, NULL, 'default.png'),
('19260', 'Andi Lorenza', NULL, NULL, 'Islam', 'Sutikno', '0341', 'Kedung Banteng RT.03/RW.01Dsn.Kedung Banteng Kel.- Kec.--- -', 1, NULL, 'default.png'),
('19261', 'Andre Nesta Wijaya', NULL, NULL, 'Islam', 'Achmad Zainuri', '0895367336939', 'GG.SINGA RT.6/RW.6Dsn.NGEPEH Kel.Ngijo Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19262', 'Ar Rosy Ade Purwanto', NULL, NULL, 'Islam', 'Heri Purwanto', '087828252240', 'abdul manan wijaya no.242 RT.2/RW.2Dsn.krajan Kel.Pujon Lor Kec.Pujon-Kabupaten Malang Jawa Timur 65391', 1, NULL, 'default.png'),
('19263', 'Ari Endra Apta Sahasika', NULL, NULL, 'Islam', 'Moch.Djaenoeri', '087782361513', 'kendalsari no.15B RT.1/RW.10 Kel.Tulusrejo Kec.Lowokwaru-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19264', 'Arya Farhan Setiawan', NULL, NULL, 'Islam', 'Yudik Hendrianto', '085237925435', 'PERUM IKIP TEGALGONDO BLOK A NO. 1 RT./RW. Kel.Tegalgondo Kec.Karangploso-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19265', 'Avfel Armenta Lesmana Putra', NULL, NULL, 'Islam', 'Rudi Lesmono', '081555859455', 'Jl. Klayatan No 2 RT.8/RW.12 Kel.Bandungrejosari Kec.Sukun-Kota Malang Jawa Timur 65148', 1, NULL, 'default.png'),
('19266', 'Awwalul Ilmi', NULL, NULL, 'Islam', 'Nuryadi', '0895395164002', 'JL. KEBALEN WETAN VI NO.40 RT.11/RW.02 Kel.Kotalama Kec.Kedungkandang-Kota Malang Jawa Timur 65136', 1, NULL, 'default.png'),
('19267', 'Bagas Bramantyo', NULL, NULL, 'Islam', 'Dwi Agus Sucahyo', '08815800321', 'ikan piranha BLOK F NO.10 B RT.8/RW.3 Kel.- Kec.--- Jawa Timur 65125', 1, NULL, 'default.png'),
('19268', 'Bagus Cahyo Utomo', NULL, NULL, 'Islam', 'Riyono', '089680845728', 'JL SUMBERSEKAR RT.04/RW.02Dsn.KRAJAN Kel.Sumbersekar Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19269', 'Bagus Tri Prasetyo', NULL, NULL, 'Islam', 'Lawi', '085536364051', 'DIENG ATAS NO.09 RT.2/RW.4Dsn.LOANDENG Kel.Kalisongo Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19270', 'Baharudin Zakaria', NULL, NULL, 'Islam', 'Ach. Muhajir', '085755570821', 'Jl Kerto Pamuji No 65 RT.08/RW.02 Kel.Ketawanggede Kec.Lowokwaru-Kota Malang Jawa Timur 65145', 1, NULL, 'default.png'),
('19271', 'Binzar Bahtiar Arlifudin Amara', NULL, NULL, 'Islam', 'Agus Ruliyanto', '0881026579461', 'Jl. Tirto Rahayu 4 No.9 RT.2/RW.5Dsn.Bendungan Kel.- Kec.--- - 65151', 1, NULL, 'default.png'),
('19272', 'Bisma Alif Fauzin Wardani', NULL, NULL, 'Islam', 'Wari', '0895327416558', 'bulutangkis no.43 RT.2/RW.2Dsn.kasur Kel.Tasikmadu Kec.Lowokwaru-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19273', 'Cahya Ade Risma', NULL, NULL, 'Islam', 'Faisol Rizal', '083119397562', 'JL ANGGREK NO 8 RT.05/RW.03Dsn.WUNUCARI Kel.Pesanggrahan Kec.Batu-Kota Batu Jawa Timur 65313', 1, NULL, 'default.png'),
('19274', 'Danang Okta Putra Nugroho', NULL, NULL, 'Islam', 'Abd.Rojak', '081318144998', 'TRISENTONI NO.6 RT.12/RW.4Dsn.SAYANG Kel.Tulungrejo Kec.Ngantang-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19275', 'Daniel Kristianto Gabriel Farera', NULL, NULL, 'Islam', 'Kusdianto', '087750931695', 'RT.65/RW.4Dsn.kandangan Kel.Gunungsari Kec.Bumiaji-Kota Batu Jawa Timur', 1, NULL, 'default.png'),
('19276', 'Davin Ahnaf Eldiansyah', NULL, NULL, 'Islam', 'Sigit Prijo Trisulo Widianto', '085785855293', 'PERUM GRIYA PERMATA ALAM NO. B 17 RT.02/RW.10Dsn.NGIJO Kel.Ngijo Kec.Karangploso-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19277', 'Deby Imas Nur Mawardah', NULL, NULL, 'Islam', 'Jumadi', '081233198761', 'JA.SUPRAPTO IIE NO.95 RT.1/RW.3Dsn.SAMAAN Kel.Samaan Kec.Klojen-Kota Malang Jawa Timur 65132', 1, NULL, 'default.png'),
('19278', 'Debi Satria Tri Mardani', NULL, NULL, 'Islam', 'Sumardi, SH', '083848576980', 'RT.1/RW.1Dsn.JABON Kel.Tulungrejo Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19279', 'Denny Saputra', NULL, NULL, 'Islam', 'Sulistiono', '085784926320', 'LESTI RT.4/RW.2 Kel.Ngaglik Kec.Batu-Kota Batu Jawa Timur 65311', 1, NULL, 'default.png'),
('19282', 'Dhea Febrian Vanda Puspita', NULL, NULL, 'Islam', 'Yusuf Ari Wibowo', '082249497815', 'JL KERAMAT RT.24/RW.06Dsn.GESINGAN Kel.Pandesari Kec.Pujon-Kabupaten Malang Jawa Timur 65391', 1, NULL, 'default.png'),
('19283', 'Dian Cahya Pangestu', NULL, NULL, 'Islam', 'Heny Windy Purwanti', '081336317653', 'JL. MELATI RT.02/RW. Kel.Kesatrian Kec.Blimbing-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19284', 'Dikki Ilham Syahputra', NULL, NULL, 'Islam', 'M.Khusaeri', '085780094615', 'RT.13/RW.4Dsn.sumbermulyo Kel.- Kec.--- -', 1, NULL, 'default.png'),
('19285', 'Dimas Jibran Ashari', NULL, NULL, 'Islam', 'Edi Mujiono', '0822257838547', 'WELIRANG RT.4/RW.6Dsn.TUTUP Kel.Simojayan Kec.Ampelgading-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19286', 'Dimas Rachmadiyanto', NULL, NULL, 'Islam', 'Widodo Setiawan', '0895630454769', 'KESTARIAN TENES K NO.16 RT.1/RW.9 Kel.Kesatrian Kec.Blimbing-Kota Malang Jawa Timur 65121', 1, NULL, 'default.png'),
('19287', 'Dimas Wahyu Firmansyah', NULL, NULL, 'Islam', 'Simbar Lambang Putra', '081223806088', 'Perum taman Permata Asri No F 13 RT.04/RW.05Dsn.Sari Asri Kel.Sitirejo Kec.Wagir-Kabupaten Malang Jawa Timur 65158', 1, NULL, 'default.png'),
('19288', 'Doni Ivan Rosadi', NULL, NULL, 'Islam', 'Imron Rosadi', '085646789488', 'JL. SITIREJO LEMAH DUWUR NO.34 RT.09/RW.01 Kel.Sitirejo Kec.Wagir-Kabupaten Malang Jawa Timur 65158', 1, NULL, 'default.png'),
('19289', 'Dwi Candra', NULL, NULL, 'Islam', 'Udiono', '0895335339302', 'Jl Plaosan Barat No 58 E RT.06/RW.08 Kel.Purwodadi Kec.Blimbing-Kota Malang Jawa Timur 65125', 1, NULL, 'default.png'),
('19291', 'Elvan Fahrezi Rahma Yula', NULL, NULL, 'Islam', 'Yuchron', '082264775765', 'raya RT.11/RW.2Dsn.sidorejo Kel.Mulyorejo Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19292', 'Eqistian Patria Wicaksono', NULL, NULL, 'Islam', 'Arif Wicaksono', '085334513893', 'rambutan RT.25/RW.1Dsn.P I Kel.Kaumrejo Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19293', 'Fahmi Al Ahmad', NULL, NULL, 'Islam', 'Warisan', '081945717797', 'JL. TLOGOJOYO II NO.67 RT.04/RW.01 Kel.Tlogomas Kec.Lowokwaru-Kota Malang Jawa Timur 65144', 1, NULL, 'default.png'),
('19294', 'Fakhriza Akbar Fairuz Dewa', NULL, NULL, 'Islam', 'Kusworo Setyo', '081252151144', 'JL SIDO MAKMUR NO 5 RT.03/RW.07 Kel.Mulyoagung Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19295', 'Falendryal Marcho Falaqsa', NULL, NULL, 'Islam', 'Sukarlan', '02337621913', 'RT.15/RW.08Dsn.MARON Kel.- Kec.--- -', 1, NULL, 'default.png'),
('19297', 'Febriyan Angga Putra Pratama', NULL, NULL, 'Islam', 'Sanuki Porwanto', '082334240331', 'SAMBIREJO RT.15/RW.4 Kel.Pandansari Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19298', 'Fian Defris Anjasmoro', NULL, NULL, 'Islam', 'Imam Rofii', '085920736248', 'CEMARA ANGIN RT.3/RW.4 Kel.Sidomulyo Kec.Batu-Kota Batu Jawa Timur', 1, NULL, 'default.png'),
('19299', 'Galang Nandita', NULL, NULL, 'Islam', 'Didik Darmadi', '08816204571', 'RT.09/RW.02Dsn.JOMBOK Kel.Jombok Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19300', 'Galih Raka Siwi', NULL, NULL, 'Islam', 'Gumono', '085851129839', 'bunga srigading dalam no.27 RT.1/RW.2 Kel.Jatimulyo Kec.Lowokwaru-Kota Malang Jawa Timur 08585', 1, NULL, 'default.png'),
('19301', 'Gede Ryan Sanjaya', NULL, NULL, 'Islam', 'Gede Mitria', '081227023503', 'JL. BEDALISODO RT.21/RW.07Dsn.BEDALI Kel.Dalisodo Kec.Wagir-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19302', 'Hamsa Eka Aditya', NULL, NULL, 'Islam', 'Suminto', '083846247950', 'JL RAMBUTAN NO 51 RT.06/RW.01Dsn.PRABON 1 Kel.Kaumrejo Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19303', 'Hario Aditya', NULL, NULL, 'Islam', 'Hariono', '081216964009', 'raya bendorejp RT.21/RW.5Dsn.bendorejp Kel.Sumberagung Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19304', 'Helmy Galang Malinda', NULL, NULL, 'Islam', 'Subekti Rusia Afandi', '082232927274', 'RT.07/RW.02Dsn.JOMBOK Kel.Jombok Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19305', 'Ill Hansyah', NULL, NULL, 'Islam', 'Hanafi', '083848076679', 'RT.36/RW.09Dsn.Karangjuwet Kel.Donowarih Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19306', 'Indah Rahmawati', NULL, NULL, 'Islam', 'Teguh Sampurno', '083146723713', 'RT.1/RW.9Dsn.LESES Kel.Ngijo Kec.Karangploso-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19307', 'Jaditya Dipa Jaladri', NULL, NULL, 'Islam', 'Suharmanto', '081228738817', 'RT.08/RW.02Dsn.SIUPAR Kel.Wringinanom Kec.Poncokusumo-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19308', 'Kaka Rifky Al Aziz', NULL, NULL, 'Islam', 'Wawan Haryo Susilo', '081334079100', 'HASANUDIN GG.IV NO.7 RT.1/RW.9 Kel.Pesanggrahan Kec.Batu-Kota Batu Jawa Timur 65313', 1, NULL, 'default.png'),
('19309', 'Kevving Etzuko', NULL, NULL, 'Islam', 'Supa I Kikiz', '082140505928', 'RT.17/RW.03Dsn.SUKOANYAR Kel.Mulyorejo Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19310', 'Kurniawan Dwi Saputra', NULL, NULL, 'Islam', 'Khoirul Witoyo', '089649861472', 'BRANTAS  RT.3/RW.12Dsn.JAJAR Kel.Selopuro Kec.Selopuro-Kabupaten Blitar Jawa Timur 66185', 1, NULL, 'default.png'),
('19311', 'La Ode Muhammad Zulhiya', NULL, NULL, 'Islam', 'La Onde Nduku', '082142754733', 'Jl. Candi Blok II B No 108 RT.5/RW.3Dsn.Nduren Kel.- Kec.--- Nusa Tenggara Timur 65144', 1, NULL, 'default.png'),
('19312', 'M. Andhy Azka', NULL, NULL, 'Islam', 'Supriadi', '085108100064', 'sumber pdam no.9 RT.5/RW.2 Kel.Donowarih Kec.Karangploso-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19313', 'M. Refqi Hidayatullah', NULL, NULL, 'Islam', 'Herdin Afattah', '081332824449', 'JL. BANDUNG NO, 7 RT./RW. Kel.- Kec.Wonokromo-Kota Surabaya Jawa Timur', 1, NULL, 'default.png'),
('19314', 'Manuel Yoga Sesario', NULL, NULL, 'Kristen', 'Sutrisno', '01217351698', 'PERUM VILA BUKIT TIDAR NO.A4-400 RT.09/RW.11 Kel.Dadaprejo Kec.Junrejo-Kota Batu Jawa Timur', 1, NULL, 'default.png'),
('19315', 'Miftahul Hadi', NULL, NULL, 'Islam', 'Machmud', '0895700457807', 'perusahaan K3 RT.1/RW.12 Kel.Tunjungtirto Kec.Singosari-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19316', 'Moch Albi Febriansyah', NULL, NULL, 'Islam', 'Moch. Wahid Hayim', '085855215267', 'Jl. Bima No 186 RT.7/RW.1Dsn.Tulusayu Kel.- Kec.--- - 65165', 1, NULL, 'default.png'),
('19318', 'Mochammad Alfath Akbar', NULL, NULL, 'Islam', 'Sumarwito', '081334210449', 'langsep no.36 RT.21/RW.4Dsn.kauman Kel.Kaumrejo Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19319', 'Moh. Rizal Efendi', NULL, NULL, 'Islam', 'Muliyono', '082334736655', 'bulutangkis no.42 RT.2/RW.2Dsn.kasur Kel.- Kec.--- -', 1, NULL, 'default.png'),
('19320', 'Mohamad Nizar Baihaqi', NULL, NULL, 'Islam', 'Ahmadi', '085335131772', 'Jl. Margobasuki No 57 RT.1/RW.3Dsn.Jetis Kel.Mulyoagung Kec.Dau-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19321', 'Mohamad Yazid Habibie', NULL, NULL, 'Islam', 'Agus Biyanto', '089601278915', 'Jl. Kol Sugiono RT./RW. Kel.Mergosono Kec.Kedungkandang-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19322', 'Mohammad Elyas', NULL, NULL, 'Islam', 'Sanjaya Setya Darma', '081315910602', 'JL. INTAN  II NO. HP-14 RT.3/RW.11Dsn.NGIJO Kel.Tambak Wedi Kec.Kenjeran-Kota Surabaya Jawa Timur', 1, NULL, 'default.png'),
('19323', 'Muchamad Andika Setiawan', NULL, NULL, 'Islam', 'Ayu Solikati', '0895399479925', 'JL. PATIMURA / IV NO.155 RT.03/RW.06Dsn.BESUL Kel.Temas Kec.Batu-Kota Batu Jawa Timur 65315', 1, NULL, 'default.png'),
('19324', 'Muhamad Yazid Al Bastomi', NULL, NULL, 'Islam', 'Pujiono', '089679025569', 'Jl. Joyo Raharjo Gang 1 No 233 A RT.4/RW.2 Kel.Merjosari Kec.Lowokwaru-Kota Malang Jawa Timur 64144', 1, NULL, 'default.png'),
('19326', 'Muhammad Arif', NULL, NULL, 'Islam', 'Didik Darsono', '085731688040', 'ARJUNO KAV.BARU NO.4 RT.9/RW.6Dsn.SISIR Kel.Sisir Kec.Batu-Kota Batu Jawa Timur 65314', 1, NULL, 'default.png'),
('19327', 'Muhammad Arif Wahendra', NULL, NULL, 'Islam', 'Mustari', '085746935114', 'PATIMURA GG.VI NO.23C RT.9/RW.7 Kel.Temas Kec.Batu-Kota Batu Jawa Timur 65315', 1, NULL, 'default.png'),
('19328', 'Muhammad Fairuz Abdal Mufid', NULL, NULL, 'Islam', 'Puji Hariadi', '085648092687', 'JL. WIJAYA KUSUMA Gg II NO. 3 RT.32/RW.8Dsn.SEKAR PUTIH  Kel.Dadaprejo Kec.Junrejo-Kota Batu Jawa Timur 65324', 1, NULL, 'default.png'),
('19329', 'Muhammad Laroyba Rakha Iman', NULL, NULL, 'Islam', 'Tony Sugiharto', '082244256301', 'JL. TRUNOJOYO  NO.50 RT.23/RW.03 Kel.Gondanglegi Kulon Kec.Gondanglegi-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19330', 'Muhammad Thoriq Abid Yulistio', NULL, NULL, 'Islam', 'Sulistiono', '089686461121', 'remujung 22 RT.2/RW.4 Kel.Jatimulyo Kec.Lowokwaru-Kota Malang Jawa Timur 65141', 1, NULL, 'default.png'),
('19331', 'Muhammad Yazid Arzaki', NULL, NULL, 'Islam', 'Zainal Arifin', '081334910452', 'JL. GAGAK RT.01/RW.07Dsn.TAKERAN Kel.Ngijo Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19333', 'Mukhamad Nur Alfan', NULL, NULL, 'Islam', 'Abdul Mutholib', '087859783463', 'JL WERKUDORO RT.17/RW.02Dsn.PAKEL Kel.- Kec.--- - 65165', 1, NULL, 'default.png'),
('19334', 'Munandar Priyo Wibisono', NULL, NULL, 'Islam', 'Harto Tabut', '0895326924727', 'SARIMUN RT.2/RW.2Dsn.KARANGJAMBE Kel.Beji Kec.Junrejo-Kota Batu Jawa Timur', 1, NULL, 'default.png'),
('19335', 'Nicolas Wiroyuda', NULL, NULL, 'Islam', 'Wardono', '082334996164', 'JL. RAYA TRETES RT.02/RW.05Dsn.TRETES Kel.Bendosari Kec.Pujon-Kabupaten Malang Jawa Timur 65391', 1, NULL, 'default.png'),
('19336', 'Nur Hidayat', NULL, NULL, 'Islam', 'Mulyono', '081231394950', 'kelampok RT.16/RW.3Dsn.gading Kel.Kaumrejo Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19337', 'Oktavia Cintya Arta Pertiwi', NULL, NULL, 'Islam', 'Handoko Suro', '08999683231', 'JL JOYO UTOMO V BLOK F NO 09 RT.07/RW.04Dsn.GANDUL Kel.Merjosari Kec.Lowokwaru-Kota Malang Jawa Timur 65144', 1, NULL, 'default.png'),
('19338', 'Oktavian Dwi Prayoga', NULL, NULL, 'Islam', 'Kusmianto', '085331730086', 'JL. RAYA NGEPRIH NO.1 RT.01/RW.05Dsn.NGEPRIH Kel.Bendosari Kec.Pujon-Kabupaten Malang Jawa Timur 65391', 1, NULL, 'default.png'),
('19339', 'Otniel Hansdai Rainfathan Hutabarat', NULL, NULL, 'Kristen', 'Gundala Gmrd Hutabarat', '082230193391', 'Jl. Trunojoyo Gang II B No 2 RT.1/RW.3Dsn.S Kerto Kel.Songgokerto Kec.Batu-Kota Batu Jawa Timur 65312', 1, NULL, 'default.png'),
('19340', 'Penggi Ardi Angsah', NULL, NULL, 'Islam', 'Santoso', '082132318202', 'RT.17/RW.3Dsn.Ngramban Kel.Banturejo Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19342', 'Qory Zaqla Azzahra', NULL, NULL, 'Islam', 'Didik Suachadi', '081233396599', 'Jl. Perum Puri Indah Blok F2 No 13 RT.4/RW.12Dsn.Pokopek Kel.- Kec.--- - 65316', 1, NULL, 'default.png'),
('19343', 'Rachmad Dimas Andi Susilo', NULL, NULL, 'Islam', 'Siono', '085738649378', 'RT.2/RW.2Dsn.sawaluhan Kel.- Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19344', 'Rachmad Gilang Saputra', NULL, NULL, 'Islam', 'Wasis Arifin', '081333286448', 'KENANGA RT.33/RW.10 Kel.Senggreng Kec.Sumber Pucung-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19345', 'Rahmad Hidayat Setiawan', NULL, NULL, 'Islam', 'Ladi', '082230596720', 'JL TAMANU DIHARJO RT.13/RW.04Dsn.BUNDER Kel.Ampeldento Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19346', 'Ramadani Maulana Syah', NULL, NULL, 'Islam', 'Kaselan', '085646531819', 'JL. JOYO SUKO Gg METRO NO. 41L RT.3/RW.12Dsn.JOYO Kel.Merjosari Kec.Lowokwaru-Kota Malang Jawa Timur 65144', 1, NULL, 'default.png'),
('19347', 'Rangga Rambu Hidayat', NULL, NULL, 'Islam', 'Radar Hidayat Darwis', '085854095548', 'Jl. Dodol RT11/RW05, Ds. Wonoagung, Kec. Kasembon, Dsn. Sepukul, Malang.', 1, NULL, 'default.png'),
('19348', 'Rendi Satrio Pratama', NULL, NULL, 'Islam', 'Sugeng Prasetyo', '085655438847', 'RAYA KARANG AMPEL RT.12/RW.2Dsn.KARANG AMPEL Kel.Karangwidoro Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19349', 'Rikki Nur Wahyudi', NULL, NULL, 'Islam', 'Nurgiono', '089655658237', 'JL. MAHESA  RT.06/RW.04Dsn.KRAJAN Kel.Pujon Kidul Kec.Pujon-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19350', 'Rio Pamungkas', NULL, NULL, 'Islam', 'Rahmat', '081235397590', 'Jl Tirta Utama Gang 3 RT./RW. Kel.- Kec.--- -', 1, NULL, 'default.png'),
('19351', 'Risdinata Iqbal Maulana', NULL, NULL, 'Islam', 'Suwandi', '089523952237', 'JL TANJUNG SARI NO 85 RT.33/RW.07Dsn.KARANGPLOSO Kel.Kepuharjo Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19352', 'Rizal Cahya Adi Saputra', NULL, NULL, 'Islam', 'Alfero Dianto', '0341', 'Jl Kolonel Sugiono 3 C no 19 RT.14/RW.04 Kel.Mergosono Kec.Kedungkandang-Kota Malang Jawa Timur 65134', 1, NULL, 'default.png'),
('19353', 'Roudhotul Jannah', NULL, NULL, 'Islam', 'Abdur Rohman', '085103600701', 'Jl Eyang Wlidin  RT.1/RW.1Dsn.Kalangan Kel.Wiyurejo Kec.Pujon-Kabupaten Malang Jawa Timur 65391', 1, NULL, 'default.png'),
('19354', 'Saeza Andromeda Vegananda', NULL, NULL, 'Islam', 'Bambang Irawan', '081280843506', 'SUROPATI GG1 NO.28 RT.4/RW.13Dsn.NGAGLIK Kel.Ngaglik Kec.Batu-Kota Batu Jawa Timur 65311', 1, NULL, 'default.png'),
('19355', 'Syaiful Ari Maskur', NULL, NULL, 'Islam', 'Muhadip', '0341554383', 'JL SRI GADINGG RT.10/RW.02Dsn.KRAJAN Kel.Gadingkulon Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19356', 'Savril Ibrahim Anwar', NULL, NULL, 'Islam', 'Mohammad Mutamakin', '087864402838', 'Jl. Simpang Kepuh No 13 B RT.4/RW.10 Kel.Bandungrejosari Kec.Sukun-Kota Malang Jawa Timur 65148', 1, NULL, 'default.png'),
('19357', 'Shaik Filhanlal', NULL, NULL, 'Islam', 'Mohanlal', '081234388393', 'JL. GENUK WATU BARAT II NO.64A RT.02/RW.03 Kel.Purwantoro Kec.Blimbing-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19359', 'Syifa Sahidah Qalbi', NULL, NULL, 'Islam', 'Sahlan', '081347577616', 'JL TERATAI GG 3 NO 1 RT.02/RW.05Dsn.KRAJAN Kel.Songgokerto Kec.Batu-Kota Batu Jawa Timur 65312', 1, NULL, 'default.png'),
('19360', 'Tiuzi Prima Asridho', NULL, NULL, 'Islam', 'Dul Majid', '085755829283', 'arjuno RT.3/RW.10Dsn.junggo Kel.Tulungrejo Kec.Bumiaji-Kota Batu Jawa Timur 65336', 1, NULL, 'default.png'),
('19361', 'Vembri Novitasari', NULL, NULL, 'Islam', 'Misno', '083129578156', 'Jl Coban Rondo RT.17/RW.4Dsn.Sebalo Kel.Pandesari Kec.Pujon-Kabupaten Malang Jawa Timur 65391', 1, NULL, 'default.png'),
('19362', 'Wafa Muhammad Yusuf', NULL, NULL, 'Islam', 'Rojiin', '085733316352', 'JL. KELUD NO.4 RT.3/RW.1Dsn.PENDEM Kel.Pendem Kec.Junrejo-Kota Batu Jawa Timur 65324', 1, NULL, 'default.png'),
('19363', 'Wahyu Bagus Suryananda', NULL, NULL, 'Islam', 'Muhammad Biyanto', '083195348583', 'ARUMBA NO.07 RT.1/RW.4Dsn.BAWANG Kel.Tunggulwulung Kec.Lowokwaru-Kota Malang Jawa Timur 65143', 1, NULL, 'default.png'),
('19364', 'Welda Kurnia Nova Hariyanto', NULL, NULL, 'Islam', 'Sutris Hariyanto', '081333430255', 'JL. RAYA KLAMPOK RT.02/RW.05Dsn.KLAMPOK Kel.Klampok Kec.Singosari-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19365', 'Yoga Dwi Prasetyo', NULL, NULL, 'Islam', 'Riyanto', '089610588423', 'Jalan Raya Sumber Sekar No.92 RT.05/RW.02Dsn.Krajan Kel.Sumbersekar Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19366', 'Yoga Pratama', NULL, NULL, 'Islam', 'Muliadi Irawan', '082183523030', 'Jl. Cokroaminoto No 41  RT.4/RW.2 Kel.- Kec.--- - 65152', 1, NULL, 'default.png'),
('19367', 'Yogi Mochammad Abdul Kahfi', NULL, NULL, 'Islam', 'Widjanarko', '088235725264', 'PIRANHA ATAS NO.25B RT.2/RW.1 Kel.Tunjungsekar Kec.Lowokwaru-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19368', 'Yosiva Rizki Nurfitria', NULL, NULL, 'Islam', 'Wiyono', '082334667380', 'RT.7/RW.4Dsn.KANDANGAN Kel.Gunungsari Kec.Bumiaji-Kota Batu Jawa Timur 65337', 1, NULL, 'default.png'),
('19369', 'Yuane Varenza', NULL, NULL, 'Islam', 'Puriyadi', '085732285048', 'KARANGAN NO.7 RT.16/RW.4 Kel.Donowarih Kec.Karangploso-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19370', 'Zaenal Arifin', NULL, NULL, 'Islam', 'Slamet Pujiono', '082331417599', 'Jl Tanjung Putra Yudha VI A No 25 RT.15/RW.11 Kel.Tanjungrejo Kec.Sukun-Kota Malang Jawa Timur 65147', 1, NULL, 'default.png'),
('19371', 'Zidan Hidayat Al Kausyar', NULL, NULL, 'Islam', 'Ahmad Mujib', '082132335959', 'SUMBER NYOTO RT.5/RW.4Dsn.LANGLANG Kel.Langlang Kec.Singosari-Kabupaten Malang Jawa Timur 65153', 1, NULL, 'default.png'),
('19372', 'Achsanul Kholiqin', NULL, NULL, 'Islam', 'Imam Suhadak', '085233278248', 'RT.5/RW.2 Kel.Waturejo Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19373', 'Adhan Defa Pratama', NULL, NULL, 'Islam', 'Pujiono', '085603232358', 'rambutan no.09 RT.6/RW.1Dsn.prabon Kel.Kaumrejo Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19374', 'Afrisal Ramadhani', NULL, NULL, 'Islam', 'Samad', '085706858634', 'BYLIRA NO.210 RT.3/RW.5Dsn.BAWANG Kel.Tunggulwulung Kec.Lowokwaru-Kota Malang Jawa Timur 65143', 1, NULL, 'default.png'),
('19375', 'Afrizal Nur Halim', NULL, NULL, 'Islam', 'Nur Halim', '085775943262', 'JL SEKOLAHAN NO 297 RT.10/RW.02Dsn.KRAJAN Kel.Pandanlandung Kec.Wagir-Kabupaten Malang Jawa Timur 65158', 1, NULL, 'default.png'),
('19376', 'Ageng Ilhamsyah', NULL, NULL, 'Islam', 'Hari Cahyono', '088225793036', 'JL. SEKOLAHAN RT.10/RW.02Dsn.KRAJAN Kel.Pandanlandung Kec.Wagir-Kabupaten Malang Jawa Timur 65158', 1, NULL, 'default.png'),
('19378', 'Ahmad Choirul Asyuro', NULL, NULL, 'Islam', 'Mohammad Rochman', '088225793037', 'MARTOREJO  RT.02/RW.03Dsn.ARENG-ARENG Kel.Dadaprejo Kec.Junrejo-Kota Batu Jawa Timur 65323', 1, NULL, 'default.png'),
('19380', 'Akhmad Septian Dwi Cahyo', NULL, NULL, 'Islam', 'Buang Slamet', '083165032426', 'TANJUNG BANJARARUM RT.3/RW.9 Kel.Banjararum Kec.Singosari-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19381', 'Alfiila Romadhona', NULL, NULL, 'Islam', 'Ruci Woncoko', '085885830886', 'JL JOYO TAMAN SARI I NO 16 RT.01/RW.06Dsn.CLUMPRIT Kel.Merjosari Kec.Lowokwaru-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19382', 'Ali Khusna', NULL, NULL, 'Islam', 'Suryo Bambang Nc', '081336049567', 'JL CENDANA NO 3 RT.02/RW.07Dsn.DADAPTULIS Kel.- Kec.--- - 65323', 1, NULL, 'default.png'),
('19383', 'Alif Vicky Hendriansa', NULL, NULL, 'Islam', 'Nanang Susanto', '0895366808048', 'Jl. Candi VI C No 217 RT.8/RW.6Dsn.Gasek Kel.Karang Besuki Kec.Sukun-Kota Malang Jawa Timur 65149', 1, NULL, 'default.png'),
('19384', 'Andi Rani Bayu Septian', NULL, NULL, 'Islam', 'Sulkin', '081336239928', 'Jl. Satria Barat No 551 RT.5/RW.2 Kel.Balearjosari Kec.Blimbing-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19385', 'Arista Zhanuar Titon', NULL, NULL, 'Islam', 'Tutut Suroso', '082269271447', 'JL KAWI RT.04/RW.04Dsn.BABEH Kel.Banjarejo Kec.Ngantang-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19386', 'Arya Bagas Putra Nadila', NULL, NULL, 'Islam', 'Dina Novitasari', '085878712792', 'JL. BENDUNGAN SELOREJO RT.7/RW.1Dsn.PLUMBANG Kel.- Kec.--- -', 1, NULL, 'default.png'),
('19387', 'Bagas Prayogo', NULL, NULL, 'Islam', 'Heru Setyono', '082241711788', 'Jl. Kenanga No 24 RT.3/RW.4Dsn.Karangmloko Kel.Dadaprejo Kec.Junrejo-Kota Batu Jawa Timur 65323', 1, NULL, 'default.png'),
('19388', 'Bagas Roy Pradana', NULL, NULL, 'Islam', 'Rojiin', '082257293819', 'kembar II no.8 RT.4/RW.5Dsn.jurang kuali Kel.Sumber Brantas Kec.Bumiaji-Kota Batu Jawa Timur 65336', 1, NULL, 'default.png'),
('19389', 'Beni Septian', NULL, NULL, 'Islam', 'Ella Ayuningtyas', '08998305026', 'JL. SAMADI NO.01 RT.04/RW.01 Kel.Pesanggrahan Kec.Batu', 1, NULL, 'default.png'),
('19390', 'Briliant Bisma Saka Aditya', NULL, NULL, 'Islam', 'Supriadi', '087880534362', 'Jl. Bro,mo No 34 Pujon RT.8/RW.5Dsn.Krajan Kel.Pujon Lor Kec.Pujon-Kabupaten Malang Jawa Timur 65391', 1, NULL, 'default.png'),
('19391', 'Didin Saputra', NULL, NULL, 'Islam', 'Kasnadi', '081333966560', 'indragiri RT.1/RW.3Dsn.sumberejo Kel.Sumberejo Kec.Batu-Kota Batu Jawa Timur', 1, NULL, 'default.png'),
('19392', 'Dimas Aria Saputra', NULL, NULL, 'Islam', 'Imam Markus', '0895367394615', 'JL. ARIES RT.03/RW.09Dsn.LESES Kel.- Kec.Karangploso-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19393', 'Eka Adi Kristanto', NULL, NULL, 'Islam', 'Eko Sugianto', '081617566883', 'JL GAJAYANA II/673 RT.04/RW.02Dsn.DINOYO Kel.Dinoyo Kec.Lowokwaru-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19394', 'Elia Sangu Ate', NULL, NULL, 'Kristen', 'Rudianto Lendi', '081238999456', 'Jl Tlogomas Gg 9 RT./RW. Kel.- Kec.Wewewa Selatan-Kabupaten Sumba Barat Daya Nusa Tenggara Timur', 1, NULL, 'default.png'),
('19395', 'Ernanda Ridhul Ihrom', NULL, NULL, 'Islam', 'Zaenul Muslikin', '085891693384', 'RT.20/RW.10Dsn.bejirejo Kel.Kasembon Kec.Kasembon-Kabupaten Malang Jawa Timur 65393', 1, NULL, 'default.png'),
('19396', 'Erwin Kristiono', NULL, NULL, 'Islam', 'Radun', '085432123455', 'kucur klasman dau malang RT.17/RW.8Dsn.kucur Kel.Kucur Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19397', 'Evan Kurnia Nuryahya', NULL, NULL, 'Islam', 'Ach.Rokijan', '0341', 'RT.8/RW.2Dsn.BINANGSRI Kel.Purworejo Kec.Ngantang-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19398', 'Fatachul Alim Arisakdi', NULL, NULL, 'Islam', 'Saida Akhmad', '081230282992', 'KARYAWIGUNA RT.3/RW.1Dsn.GONDANG Kel.Tegalgondo Kec.Karangploso-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19399', 'Faza Abinsa Johari', NULL, NULL, 'Islam', 'Eko Dian Johari', '085707490883', 'DURIAN  RT.16/RW.3Dsn.GADING Kel.Kaumrejo Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19400', 'Fiko Ferdian', NULL, NULL, 'Islam', 'Sunyono', '082331601289', 'JL. PAGERSARI RT.7/RW.1Dsn.PAGERSARI Kel.Pagersari Kec.Ngantang-Kabupaten Malang Jawa Timur 63392', 1, NULL, 'default.png'),
('19402', 'Firman Abdul Jaelani', NULL, NULL, 'Islam', 'Sujarwo', '085536374069', 'joyo taman sari no.37 RT.6/RW.6Dsn.clompret Kel.Merjosari Kec.Lowokwaru-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19404', 'Galang Badru Yaza', NULL, NULL, 'Islam', 'Sakri', '082143743975', 'Jl. Kelapa Gading RT.2/RW.5Dsn.Dadaprejo Kel.Dandong Kec.Srengat-Kabupaten Blitar Jawa Timur', 1, NULL, 'default.png'),
('19405', 'Galih Rizky Maulana', NULL, NULL, 'Islam', 'Rianto', '085748335374', 'JL. MARTOREJO NO.105 RT.01/RW.03Dsn.ARENG-ARENG Kel.Dadaprejo Kec.Junrejo-Kota Batu Jawa Timur 65323', 1, NULL, 'default.png'),
('19406', 'Guntur Woro Etanto', NULL, NULL, 'Islam', 'Abdul Malik', '0341', 'trunojoyo RT.2/RW.1 Kel.Waturejo Kec.Ngantang-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19407', 'Handak Tegas M.W', NULL, NULL, 'Islam', 'Mujiman', '085724634228', 'JL. PERTAMANAN NO.4 RT.16/RW.06Dsn.KEPUH Kel.Kepuharjo Kec.Karangploso-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19408', 'Heksa Restu Masdiana', NULL, NULL, 'Hindu', 'Misdi Ondrong', '085748455703', 'RT.17/RW.7Dsn.dodol Kel.Wonoagung Kec.Kasembon-Kabupaten Malang Jawa Timur 65393', 1, NULL, 'default.png'),
('19409', 'Indra Saputra', NULL, NULL, 'Islam', 'Agus Heri Hartono', '089682140749', 'RT.4/RW.6Dsn.manggisari Kel.Bocek Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19410', 'Jofan Cahya Pradana', NULL, NULL, 'Islam', 'Sugiharto', '085749510660', 'Jl. Bareng Raya II F No 457A RT.10/RW.8 Kel.Bareng Kec.Klojen-Kota Malang Jawa Timur 65116', 1, NULL, 'default.png'),
('19411', 'Julio Sendy Prasetyo', NULL, NULL, 'Islam', 'Rupian', '0895396181506', 'RT.09/RW.02Dsn.KRAJAN Kel.Gadingkulon Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19412', 'Kiki Rafika Dahlan', NULL, NULL, 'Islam', 'Khoirul Bazar', '082332557838', 'INDRAGIRI  RT.1/RW.9Dsn.SUMBEREJO Kel.Sumberejo Kec.Batu-Kota Batu Jawa Timur 65318', 1, NULL, 'default.png'),
('19413', 'Lupus Niko Putra Priyanto', NULL, NULL, 'Islam', 'Supriyanto', '085701934820', 'JL. MERGO BASUKI GG III NO.13 RT.01/RW.01Dsn.JETIS Kel.Mulyoagung Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19414', 'M Faizal Muzaki', NULL, NULL, 'Islam', 'Ali Irfan', '085735707575', 'delima no.44 RT.2/RW.15Dsn.jambangan Kel.Tertek Kec.Pare-Kabupaten Kediri Jawa Timur 64215', 1, NULL, 'default.png'),
('19415', 'M. Rizal Mantofani', NULL, NULL, 'Islam', 'Subur Harianto', '089509107908', 'Jalan Singojoyo RT.01/RW.11Dsn.Genitri Kel.Ngenep Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19416', 'M.Ulin Nuha', NULL, NULL, 'Islam', 'Suprinono', '085646834494', 'mulyorejo jetak utara RT.1/RW.2 Kel.Mulyoagung Kec.Dau-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19417', 'Mahdi Syarief Al Hasny', NULL, NULL, 'Islam', 'Musthofa Hasny', '08170476644', 'Jl. Karimata No 1 RT.6/RW.1 Kel.Kasin Kec.Klojen-Kota Malang Jawa Timur 65117', 1, NULL, 'default.png'),
('19418', 'Miftahul Huda', NULL, NULL, 'Islam', 'Ngaseri', '081333845496', 'JL SIDOMAKMUR JETAK NGASRI RT.04/RW.01Dsn.JETAK Kel.Mulyoagung Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19419', 'Mochamad Bintang Ryu A', NULL, NULL, 'Islam', 'Endah Danawati', '081290713554', 'Jl Bareng Tenis Gg 4 A No 610 RT.03/RW.02Dsn.Bare Kel.- Kec.--- - 65116', 1, NULL, 'default.png'),
('19420', 'Mochammad Zanuar Reza', NULL, NULL, 'Islam', 'Subari', '082132949227', 'majapahit selatan no.29 RT.16/RW.6Dsn.ngandat Kel.Ngadirejo Kec.Kromengan-Kabupaten Malang Jawa Timur 65322', 1, NULL, 'default.png'),
('19421', 'Muhammad Ardiasyah', NULL, NULL, 'Islam', 'Amin Tohari', '085791114731', 'Jalan Notojoyo RT.03/RW.01Dsn.Gondang Kel.Tegalgondo Kec.Karangploso-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19422', 'Muhammad Baihaqi', NULL, NULL, 'Islam', 'Moi Widodo', '082144589793', 'JL. BADUT  RT.04/RW.03Dsn.BEJI Kel.Beji Kec.Junrejo-Kota Batu Jawa Timur', 1, NULL, 'default.png'),
('19423', 'Muhammad Ismail Hidayatullah', NULL, NULL, 'Islam', 'Hariono', '083848214988', 'Jl Sidorejo RT.05/RW.03 Desa Sidorejo Kec. Pagelaran Kab. Malang 65177', 1, NULL, 'default.png'),
('19424', 'Muhammad Mufliq Frediansah', NULL, NULL, 'Islam', 'Sumedi', '082229175600', 'JL ORGAN  RT.1/RW.4Dsn.TUNGGULWULUNG Kel.Tunggulwulung Kec.Lowokwaru-Kota Malang Jawa Timur 65143', 1, NULL, 'default.png'),
('19425', 'Muhammad Ramadani', NULL, NULL, 'Islam', 'Suradji', '081235264347', 'KELAPA SAWIT NO.16 RT./RW. Kel.Pisang Candi Kec.Sukun-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19426', 'Muhammad Shirod Al Zidan', NULL, NULL, 'Islam', 'Yadi', '085855739036', 'JL. DURIAN  RT.18/RW.3Dsn.GADING Kel.Kaumrejo Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19427', 'Nur. Muhammad Ramadhana', NULL, NULL, 'Islam', 'Sutiono', '088996249166', 'JL. CEMPAKA NO.25 RT.03/RW.13Dsn.BUMIREJO Kel.Kebobang Kec.Wonosari-Kabupaten Malang Jawa Timur 65164', 1, NULL, 'default.png'),
('19428', 'Ongky Dwi Saputra', NULL, NULL, 'Islam', 'Sarju', '081549624989', 'RT.6/RW.4 Kel.- Kec.Pujon-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19429', 'Prasetya Ardhi Winata Oetomo', NULL, NULL, 'Islam', 'Ade Triastiko', '0895367198246', 'JL. KUTILANG RT.07/RW.05Dsn.NGIJO Kel.Purwodadi Kec.Purwodadi-Kabupaten Pasuruan Jawa Timur 65152', 1, NULL, 'default.png'),
('19430', 'Pulung Ardtya Sagotra', NULL, NULL, 'Islam', 'Rudi Hartono', '085766333481', 'RT./RW. Kel.Temas Kec.Batu-Kota Batu Jawa Timur', 1, NULL, 'default.png'),
('19431', 'Rahadian Insan Fitra Cendekia Kamila', NULL, NULL, 'Islam', 'Edy Zuwono', '085105022177', 'JL. SIDOMAKMUR NO.158 RT.04/RW.01Dsn.JETAK Kel.Mulyoagung Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19433', 'Rendi Adi Setiawan', NULL, NULL, 'Islam', 'Santoso', '08979008768', 'Jl. Karangan RT.5/RW.2 Kel.Donowarih Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19434', 'Rivan Agista', NULL, NULL, 'Islam', 'Nur Mislam', '083846717776', 'JL SRI SENTONI RT.12/RW.04Dsn.SAYANG Kel.Tulungrejo Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19435', 'Rizki Sofyan Harianto', NULL, NULL, 'Islam', 'Suntoro', '082232747593', 'RT.02/RW.05Dsn.TRETES Kel.Bendosari Kec.Pujon-Kabupaten Malang Jawa Timur 65391', 1, NULL, 'default.png'),
('19436', 'Rui Tegar Priyono', NULL, NULL, 'Islam', 'Ruddy Priyo Sunrisno', '081217626696', 'JL. Dr. SUTOMO NO.07 RT.01/RW.09Dsn.SIMPING Kel.Turirejo Kec.Lawang-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19437', 'Ryan Okky Juandisa', NULL, NULL, 'Islam', 'Wahyudi', '085334862363', 'organ no.127 RT.3/RW.4Dsn.bawang Kel.Tunggulwulung Kec.Lowokwaru-Kota Malang Jawa Timur 65143', 1, NULL, 'default.png'),
('19438', 'Sukma Novianto Ludriansyah', NULL, NULL, 'Islam', 'Lumadinoto', '0283111060137', 'RAWISARI NO.10 RT.8/RW.5 Kel.Mulyorejo Kec.Sukun-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19439', 'Trindi Septian', NULL, NULL, 'Islam', 'Misnandar', '081332583409', 'JL TIRTO MULYO NO 93 RT.01/RW.09 Kel.Landungsari Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19440', 'Wahyu Teguh Pribadi', NULL, NULL, 'Islam', 'Nur Susilo', '085732735962', 'godehan NO.06 RT.23/RW.10Dsn.godehan Kel.Kucur Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19441', 'Yoga Arfiansyah', NULL, NULL, 'Islam', 'Yuli Agung', '087721805862', 'KASEMBON RT.18/RW.9 Kel.Kasembon Kec.Kasembon-Kabupaten Malang Jawa Timur 65393', 1, NULL, 'default.png'),
('19443', 'Abdul Qodir Jailani', NULL, NULL, 'Islam', 'Abdul Jalil', '081210401210', 'mawar RT.12/RW.3Dsn.kasin Kel.Jombok Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19444', 'Afgustian Alferransah', NULL, NULL, 'Islam', 'Sumariyono', '081556448726', 'sumberagung no.01 RT.11/RW.3Dsn.sumbermulyo Kel.Sumberagung Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19445', 'Afu Asadil Akbar', NULL, NULL, 'Islam', 'Slamet Sunyoto', '082142193313', 'JL TIRTO UTOMO NO 27 RT.02/RW.02Dsn.RAMBAAN Kel.Landungsari Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19446', 'Ahmad Syaifudin', NULL, NULL, 'Islam', 'Jumain', '087859023314', 'JL. TLOGOMAS GG 8A NO.8 RT.05/RW.05 Kel.- Kec.--- -', 1, NULL, 'default.png'),
('19448', 'Aldito Sadam', NULL, NULL, 'Islam', 'Suprihatin', '0895328734606', 'raya mulyorejo no.01 RT.6/RW.1Dsn.maron Kel.Mulyorejo Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19449', 'Alfan Yulian Hadi', NULL, NULL, 'Islam', 'Rustamaji', '081321204319', 'JL SUPIRMAN NO 18 RT.10/RW.03Dsn.SAYANG Kel.Tulungrejo Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19450', 'Ali Dwi Mashudi', NULL, NULL, 'Islam', 'Waliadi', '0341554383', 'Jl raya Karang Juwet RT.38/RW.09Dsn.Karang Juwet Kel.Donowarih Kec.Karangploso-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19451', 'Andik Setiawan', NULL, NULL, 'Islam', 'Ponari', '082132366561', 'arjuna no.114 RT.5/RW.5Dsn.krajan Kel.Torongrejo Kec.Junrejo-Kota Batu Jawa Timur 65325', 1, NULL, 'default.png'),
('19452', 'Andri Jamal', NULL, NULL, 'Islam', 'Ahmad Sukron', '081235567418', 'Jl. Tlogomas Barat No 49B RT./RW. Kel.Labelen Kec.Solor Timur-Kabupaten Flores Timur Nusa Tenggara Timur 65144', 1, NULL, 'default.png'),
('19453', 'Arik Yuliansyah', NULL, NULL, 'Islam', 'Supeno', '081217066167', 'jl.kodya  RT.9/RW.1 Kel.Tegalweru Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19456', 'David Dwi Christyo', NULL, NULL, 'Kristen', 'Priyanto', '085749566820', 'RT.01/RW.06Dsn.KRAJAN Kel.Torongrejo Kec.Junrejo-Kota Batu Jawa Timur', 1, NULL, 'default.png'),
('19457', 'Eka Rifki Ulul Amri', NULL, NULL, 'Islam', 'Iswody Sulistyo', '085100575798', 'JL. PURI INDAH BLOK K 4 NO 17 RT.5/RW.12 Kel.Oro-Oro Ombo Kec.Batu-Kota Batu Jawa Timur 65316', 1, NULL, 'default.png'),
('19458', 'Fiko Ferdiansah', NULL, NULL, 'Islam', 'Sudadi', '085655989950', 'ponco RT.25/RW.4Dsn.watulor Kel.Waturejo Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19459', 'Galang Pratama', NULL, NULL, 'Islam', 'Sugeng Afriansyah', '08287852564521', 'JL MENDALAN NO 212 RT.04/RW.06Dsn.PONDOK Kel.Pondok Agung Kec.Kasembon-Kabupaten Malang Jawa Timur 65393', 1, NULL, 'default.png'),
('19460', 'Gigih Dhuarma Nurdyansah', NULL, NULL, 'Islam', 'Slamet', '082245464896', 'TRUNOJOYO NO.2 RT.3/RW.1 Kel.Waturejo Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19461', 'Hadi Muhammad Zhakaria', NULL, NULL, 'Islam', 'Suwadi', '08812304246', 'JL KALI PUCANG RT.15/RW.07Dsn.KRAJAN Kel.Ngroto Kec.Pujon-Kabupaten Malang Jawa Timur 65391', 1, NULL, 'default.png'),
('19463', 'Jery Valentino', NULL, NULL, 'Islam', 'Sugianto', '081330153943', 'JL. RAYA ARJUNO GG XII NO.1 RT.05/RW.09Dsn.JUNGGO Kel.Tulungrejo Kec.Bumiaji-Kota Batu Jawa Timur 65338', 1, NULL, 'default.png'),
('19464', 'Kelvin Galang Samudra', NULL, NULL, 'Islam', 'Supadi', '089804087507', 'JL. RAYA PANDANREJO NGUJUNG RT.09/RW.02Dsn.NGUJUNG Kel.- Kec.--- Jawa Timur', 1, NULL, 'default.png'),
('19465', 'Luhur Ahmad Difa  Pratama', NULL, NULL, 'Islam', 'Luhur Setya Wahyu', '083891666894', 'MOJOPAHIT 12 NO 12 RT./RW. Kel.- Kec.Junrejo-Kota Batu Jawa Timur', 1, NULL, 'default.png'),
('19466', 'Lutvan Feri Pradana', NULL, NULL, 'Islam', 'Hadi Sukirno', '083830792877', 'JL. KABUL RT.11/RW.03Dsn.BONJAGUNG Kel.Pait Kec.Kasembon-Kabupaten Malang Jawa Timur 65393', 1, NULL, 'default.png'),
('19467', 'Maulana Afrizal', NULL, NULL, 'Islam', 'Misgianto', '0838484501', 'Jl kertanegara II Jago RT.01/RW.09Dsn.Jago Kel.Tumpang Kec.Tumpang-Kabupaten Malang Jawa Timur 65156', 1, NULL, 'default.png'),
('19468', 'Maulana Fatur Rohman', NULL, NULL, 'Islam', 'Eko', '013575501050', 'TLOGO JOYO NO.59 RT.5/RW.1 Kel.Tlogomas Kec.Lowokwaru-Kota Malang Jawa Timur 65144', 1, NULL, 'default.png'),
('19469', 'Mochamad Nafis Hauzan', NULL, NULL, 'Islam', 'SITI NUR HALIMAH_x000D_', '088211348549', 'SIMPANG PIRANHA ATAS NO.75 RT.13/RW.2 Kel.- Kec.--- - 65142', 1, NULL, 'default.png'),
('19470', 'Moh Zen Zain Afandi', NULL, NULL, 'Islam', 'Ahmad Suhaimi', '085606009384', 'JL. CANDI RAWAN RT.11/RW.3Dsn.SUMBER AWAN Kel.Toyomarto Kec.Singosari-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19472', 'Mokhamad Doni Afrizal', NULL, NULL, 'Islam', 'Muhamad Romli', '082330647706', 'matahari o.19a RT.39/RW.10Dsn.sekarpuro Kel.Pendem Kec.Junrejo-Kota Batu Jawa Timur 65233', 1, NULL, 'default.png'),
('19473', 'Muchammad Faisal', NULL, NULL, 'Islam', 'Warisan', '085755675947', 'RAYA MULYOREJO GG.SOEDIRMAN RT.7/RW.1Dsn.MARON Kel.Mulyorejo Kec.Ngantang-Kabupaten Malang Jawa Timur 65193', 1, NULL, 'default.png'),
('19474', 'Muhammad Badruddin Syafiq', NULL, NULL, 'Islam', 'Arif Oejiono', '083865068801', 'JL. JOYO TAMANSARI I NO 5 RT.2/RW.6Dsn.MERJOSARI Kel.Merjosari Kec.Lowokwaru-Kota Malang Jawa Timur 65144', 1, NULL, 'default.png'),
('19475', 'Muhamad Muhklis', NULL, NULL, 'Islam', 'Marugi', '088224920018', 'Bareng Raya Gg IIn No.529 H RT.13/RW.08 Kel.Bareng Kec.Klojen-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19476', 'Renda Gusti Pramana', NULL, NULL, 'Islam', 'Sukarlin', '085646035536', 'MULYOREJO RT.6/RW.1Dsn.Maron Kel.Mulyorejo Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19477', 'Reza Diki Saputra', NULL, NULL, 'Islam', 'Sodikin', '089607375754', 'JL. SUMBER NYOYO RT.2/RW.4Dsn.LANGLANG Kel.Losari Kec.Singosari-Kabupaten Malang Jawa Timur 65753', 1, NULL, 'default.png'),
('19478', 'Rizki Maulana', NULL, NULL, 'Islam', 'Sholeh', '082257059826', 'Jl. M Ismail No 100 RT.3/RW.2Dsn.langlang Kel.Langlang Kec.Singosari-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19479', 'Satria Ikhsan Aria Dillah', NULL, NULL, 'Islam', 'Suprapto', '085704764877', 'JL MENDALAN NO 212 RT.07/RW.06Dsn.PONDOK Kel.Pondok Agung Kec.Kasembon-Kabupaten Malang Jawa Timur 65293', 1, NULL, 'default.png'),
('19480', 'Septian Anggara Putra', NULL, NULL, 'Islam', 'Batin Suliyono', '082131940401', 'RT.06/RW.02Dsn.KARANGAN Kel.Donowarih Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19481', 'Wahyu Ahlul Firdaus', NULL, NULL, 'Islam', 'Asma Ul Azis', '085807147654', 'RT.9/RW.2Dsn.SIDOREJO Kel.Mulyorejo Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19482', 'Yahya Dedy Firmansyah', NULL, NULL, 'Islam', 'Suraji', '085755176429', 'JL. ZENTANA NO 168 RT.12/RW.04Dsn.BUNDER Kel.Ampeldento Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19483', 'Yofi Hilmana Fadli', NULL, NULL, 'Islam', 'Rukiyanto', '082334865540', 'JL RAYA PURWOREJO NO 26 RT.05/RW.01Dsn.PAKAN Kel.Purworejo Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19484', 'Yoga Riza Pratama', NULL, NULL, 'Islam', 'Wisto', '082230821961', 'kanduruan RT.4/RW.2Dsn.krajan Kel.Ngroto Kec.Pujon-Kabupaten Malang Jawa Timur 65391', 1, NULL, 'default.png'),
('19485', 'Ahmad Khusnun Zaman', NULL, NULL, 'Islam', 'Syukur Anwar', '085649919958', 'Jl. Joyo Suko Metro 2/24 RT.3/RW.12 Kel.Merjosari Kec.Lowokwaru-Kota Malang Jawa Timur 6441', 1, NULL, 'default.png'),
('19486', 'Alvi Khotimah', NULL, NULL, 'Islam', 'Sujarwanto', '082232431056', 'RT.05/RW.05Dsn.TURUS Kel.Banjarejo Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19487', 'Ananda Elvina Sari', NULL, NULL, 'Islam', 'Agus Hanes Basuki', '087771272969', 'JL SAMADI GG II NO 11A RT.02/RW.11Dsn.PESANGGRAHAN Kel.Pesanggrahan Kec.Batu-Kota Batu Jawa Timur', 1, NULL, 'default.png'),
('19488', 'Dela Egi Rahmawati', NULL, NULL, 'Islam', 'Nurhasan', '0895328734606', 'JL RAYA BOCEK KRAJAN RT.01/RW.04Dsn.BOCEK Kel.Bocek Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19489', 'Dwita Rahmawati', NULL, NULL, 'Islam', 'Wari', '082337368140', 'JL. TAMANU DIHARJO RT.13/RW.04Dsn.BUNDER Kel.Ampeldento Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19490', 'Elsa Anggraeni', NULL, NULL, 'Islam', 'Muh Nur Sodik', '081358083278', 'RT.05/RW.05Dsn.TURUS Kel.Banjarejo Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19491', 'Ilham Firmansyah', NULL, NULL, 'Islam', 'Sain', '087854997202', 'BUKUREJO GG.1 NO.25 RT.5/RW.7 Kel.Saptorenggo Kec.Pakis-Kabupaten Malang Jawa Timur 65154', 1, NULL, 'default.png'),
('19492', 'Khayun Rizqun Wasia', NULL, NULL, 'Islam', 'M. Ali Muchtar', '081249898064', 'JL. KH AGUS SALIM RT.29/RW.5Dsn.KRAJAN Kel.Jatisari Kec.Tajinan-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19493', 'Lily Farah Sasmita', NULL, NULL, 'Islam', 'Mohammad Abdul Lathief', '0895366406902', 'Jl. Gunung Sari RT.3/RW.2Dsn.Krajan Kel.Sentul Kec.Purwodadi-Kabupaten Pasuruan Jawa Timur 67163', 1, NULL, 'default.png'),
('19494', 'M. Fani Tri Erwin Saputra', NULL, NULL, 'Islam', 'Herni Susyanti', '089621677675', 'JL RAYA TLOGOMAS GG 7 NO 2 RT./RW. Kel.Sading Kec.Mengwi-Kabupaten Badung Bali 65144', 1, NULL, 'default.png'),
('19495', 'Maristha Karin Narulita', NULL, NULL, 'Islam', 'Meilina Andriani', '089520824510', 'Jl. Manggar No 270 RT.6/RW. Kel.- Kec.--- - 651', 1, NULL, 'default.png'),
('19496', 'Maulidia Wahyuningsih', NULL, NULL, 'Islam', 'Ismail', '085706618115', 'JL TLOGO INDAH GG 6 NO 56 RT.02/RW.02 Kel.Tlogomas Kec.Lowokwaru-Kota Malang Jawa Timur 65144', 1, NULL, 'default.png'),
('19497', 'Revina Fitri Krisnanda', NULL, NULL, 'Islam', 'Samsul Arifin', '083851280675', 'MAHESA RT.23/RW.4Dsn.KRAJAN Kel.Pujon Lor Kec.Pujon-Kabupaten Malang Jawa Timur 65391', 1, NULL, 'default.png'),
('19498', 'Risma Ida Ariva', NULL, NULL, 'Islam', 'Slamet G.Hariyanto', '085236165192', 'RT.23/RW.3Dsn.manting Kel.- Kec.--- - 65391', 1, NULL, 'default.png'),
('19499', 'Rosa Nur Cahyani', NULL, NULL, 'Islam', 'Hari Budiono', '085733374296', 'RT./RW. Kel.Sumberagung Kec.Ngantang-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19500', 'Shinta Puspita Dewi', NULL, NULL, 'Islam', 'Simon', '081233619096', 'Kedung Banteng Bawah RT.26/RW.02Dsn.Kedung Banteng Kel.Kedungbanteng Kec.Sumbermanjing-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png');
INSERT INTO `ms_siswa` (`nis_siswa`, `nama_siswa`, `tgl_lahir_siswa`, `jenis_kelamin_siswa`, `agama_siswa`, `nama_ortu`, `telp_ortu`, `alamat_siswa`, `id_kelas`, `id_tempat_prakerin`, `img_siswa`) VALUES
('19501', 'Yienza Daratista', NULL, NULL, 'Islam', 'Mulyanto', '085607639322', 'JL. RAYA BANTUREJO RT.09/RW.02Dsn.BANU Kel.Banturejo Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19502', 'Yuniar Fanny Saputri', NULL, NULL, 'Islam', 'Mistin Sri Indarmi', '081226051420', 'TLOGO INDAH NO.13 RT.3/RW.1 Kel.Ringin Rejo Kec.Wates-Kabupaten Blitar Jawa Timur 65144', 1, NULL, 'default.png'),
('19503', 'Achmad Dandi Putra Wijaya', NULL, NULL, 'Islam', 'Ngateman', '0895366999', 'Jl. Pirangsia No 81 RT.46/RW.7Dsn.Bendo Kel.Giripurno Kec.Bumiaji-Kota Batu Jawa Timur 35333', 1, NULL, 'default.png'),
('19504', 'Achmad Risal Montela', NULL, NULL, 'Islam', 'Majid', '085812685764', 'tanjungsari VI RT.23/RW.8Dsn.karangploso wetan Kel.Kepuharjo Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19505', 'Achmad Zuhwa Nizar Zulmi', NULL, NULL, 'Islam', 'Abdul Wakhid', '08125271353', 'lang-lang RT.6/RW.4 Kel.Langlang Kec.Singosari-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19506', 'Ade Candra Wijaya', NULL, NULL, 'Islam', 'Harianto', '082229063109', 'JL. GADING KULON 1 RT.09/RW.02Dsn.KRAJAN Kel.Gadingkulon Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19507', 'Adi Prasetyo', NULL, NULL, 'Islam', 'Kasiadi', '085704176106', 'Jl. Kh Yusuf RT.3/RW.4Dsn.Kr Suko Kel.Tasikmadu Kec.Lowokwaru-Kota Malang Jawa Timur 65143', 1, NULL, 'default.png'),
('19508', 'Aditya Riski Kurniawan', NULL, NULL, 'Islam', 'Roni', '085735834798', 'Jl. Raya Lang-lang RT./RW.Dsn.langlang Kel.Langlang Kec.Singosari-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19509', 'Aditya Trinanto Nugraha', NULL, NULL, 'Islam', 'Tri Wahono', '083833391593', 'Griya Nibuw Singhasari D-11 RT.7/RW.9Dsn.Tesosari Kel.- Kec.--- -', 1, NULL, 'default.png'),
('19511', 'Ahmad', NULL, NULL, 'Islam', 'Hasan', '085945925754', 'Jl Arumba No 03 RT.07/RW.04 Kel.Tunggulwulung Kec.Lowokwaru-Kota Malang Jawa Timur 65143', 1, NULL, 'default.png'),
('19512', 'Ahmad Athif Fikri', NULL, NULL, 'Islam', 'Moh. Mustain', '08123369376', 'JL. AKORDION NO.24 B RT.02/RW.01 Kel.Tunggulwulung Kec.Lowokwaru-Kota Malang Jawa Timur 65143', 1, NULL, 'default.png'),
('19513', 'Ahmad Saifudin Alawi', NULL, NULL, 'Islam', 'Mat Romli', '085815371833', 'Jl. Raya Kasembon RT.22/RW.11Dsn.Mbejirjo Kel.Kasembon Kec.Kasembon-Kabupaten Malang Jawa Timur 65393', 1, NULL, 'default.png'),
('19514', 'Ahmad Setiawan', NULL, NULL, 'Islam', 'Iswandi', '085646550120', 'Jl. Tlogo Suryo Gang 04 No 17E RT.3/RW.2 Kel.Tlogomas Kec.Lowokwaru-Kota Malang Jawa Timur 65144', 1, NULL, 'default.png'),
('19516', 'Aldi Wanda Haristama', NULL, NULL, 'Islam', 'Heri Antoni', '085219804596', 'NGANTRU RT.29/RW.4Dsn.BAYANAN Kel.Ngantru Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19517', 'Aldi Yulianto', NULL, NULL, 'Islam', 'Takim', '085735828321', 'BUYUT RISA NO.72 RT.21/RW.7 Kel.Ampeldento Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19518', 'Aldo Natalino Bernardliko', NULL, NULL, 'Khatolik', 'Sirillus Tai Liko', '085235902784', 'JL. GADINGKULON RT.08/RW.03Dsn.PRINCI Kel.Gadingkulon Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19520', 'Ananda Bagus Oktavia', NULL, NULL, 'Islam', 'Sampan', '089634738100', 'JL HASANUDIN NO 119 B RT.04/RW.05Dsn.JEDING Kel.Junrejo Kec.Junrejo-Kota Batu Jawa Timur 65321', 1, NULL, 'default.png'),
('19521', 'Ananta Ferdiansyah', NULL, NULL, 'Islam', 'Widodo', '087762785191', 'JL. KELENGKENG GANG 3 NO. 31B RT.02/RW.03Dsn.KRAJAN Kel.- Kec.--- -', 1, NULL, 'default.png'),
('19522', 'Andi Aditya Saputra', NULL, NULL, 'Islam', 'Mohamad Mujahidin', '081235611913', 'M.JALIL NO.09 RT.2/RW.2Dsn.KLIRAN Kel.Bulukerto Kec.Bumiaji-Kota Batu Jawa Timur 65334', 1, NULL, 'default.png'),
('19523', 'Andi Damai Rahardjo', NULL, NULL, 'Islam', 'Prisdianto', '0812331271672', 'Jl. Raya Tlogomas No 46 RT.1/RW.1 Kel.Tlogomas Kec.Lowokwaru-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19524', 'Angga Tri Prasetyo', NULL, NULL, 'Islam', 'Supriadi', '0895379880423', 'JL SEMERU GG 1 BATU NO 10/20 RT.06/RW.09Dsn.SISIR Kel.Sisir Kec.Batu-Kota Batu Jawa Timur 65314', 1, NULL, 'default.png'),
('19525', 'Angger Ragil Dinar Maylian', NULL, NULL, 'Islam', 'Wakijo', '085322260050', 'JL JANTI BARAT BLOK A NO 16 RT.07/RW.08 Kel.Bandungrejosari Kec.Sukun-Kota Malang Jawa Timur 65148', 1, NULL, 'default.png'),
('19526', 'Aprilianto Ardiansyah', NULL, NULL, 'Islam', 'Sutriman', '087880456636', 'Jl. Renang No 21 RT.1/RW.4Dsn.Karangsuko Kel.Tasikmadu Kec.Lowokwaru-Kota Malang Jawa Timur 65143', 1, NULL, 'default.png'),
('19527', 'Arif Affandi', NULL, NULL, 'Islam', 'Sugiaman', '082337224190', 'rogoboyo RT.12/RW.4Dsn.bunder Kel.Ampeldento Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19529', 'Audra Rivansyah', NULL, NULL, 'Islam', 'Ardi', '087859321076', 'JL. RAYA SELECTA NO.42 RT.04/RW.03Dsn.TINJUMOYO Kel.Sidomulyo Kec.Batu-Kota Batu Jawa Timur 65317', 1, NULL, 'default.png'),
('19530', 'Aureleo Duval', NULL, NULL, 'Islam', 'Yudo Darmono', '0895339430866', 'JL. BARENG RAYA 2C NO.425 RT.07/RW.08 Kel.Bareng Kec.Klojen-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19531', 'Ayu Firnanda', NULL, NULL, 'Islam', 'Agus Mauludi', '082249286404', 'RT.19/RW.6Dsn.sobo Kel.Madiredo Kec.Pujon-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19532', 'Azel Desca Putra Arnanda', NULL, NULL, 'Islam', 'Moch.Socheh', '087859637891', 'SUMBERSARI GG.6 NO.28 RT.3/RW.3 Kel.Sumbersari Kec.Lowokwaru-Kota Malang Jawa Timur 65145', 1, NULL, 'default.png'),
('19533', 'Bagus Eka Saputra', NULL, NULL, 'Islam', 'Wulang Budi Utomo', '088234140977', 'piranha atas no.286a RT.3/RW.2 Kel.Tunjungsekar Kec.Lowokwaru-Kota Malang Jawa Timur 65142', 1, NULL, 'default.png'),
('19534', 'Brian Ramadani', NULL, NULL, 'Islam', 'Bambang Sumantri', '081358885439', 'RT.021/RW.003Dsn.PRINCI Kel.Gadingkulon Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19535', 'Cahya Bintang Prakoso', NULL, NULL, 'Islam', 'Sulkan', '081232752311', 'Villa Bukit Tidar No AI/174 RT.03/RW.11Dsn.Genting Kel.Merjosari Kec.Lowokwaru-Kota Malang Jawa Timur 65144', 1, NULL, 'default.png'),
('19536', 'Ciko Sandy Amirulloh', NULL, NULL, 'Islam', 'Bagio Irianto', '087766519427', 'RT36/RW09 no 64b. Kel.Pendem Kec.Junrejo-Kota Batu Jawa Timur', 1, NULL, 'default.png'),
('19537', 'Dani Kurniawan', NULL, NULL, 'Islam', 'Sujito', '081249363157', 'RT.4/RW.13Dsn.MOJOSARI Kel.Ngenep Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19538', 'Deli Alfin', NULL, NULL, 'Islam', 'Weski', '087859187733', 'JL. SANAN RT.3/RW.16 Kel.Purwantoro Kec.Blimbing-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19539', 'Dewi Rahmawati', NULL, NULL, 'Islam', 'Romli', '081359423260', 'RT.4/RW.9Dsn.LECES Kel.Ngijo Kec.Karangploso-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19540', 'Dhani Nur Rahmad', NULL, NULL, 'Islam', 'Mukminin', '081217700650', 'Jl Raya Karang Mloko No 69 RT.4/RW.5 Kel.Dadaprejo Kec.Junrejo-Kota Batu Jawa Timur 65323', 1, NULL, 'default.png'),
('19541', 'Dimas Guritno', NULL, NULL, 'Khatolik', 'Hilarius Sugi Winarno', '089673719908', 'Jl. Jeruk Songgoriti No 27 RT.2/RW.1Dsn.Songgoriti Kel.Songgokerto Kec.Batu-Kota Batu Jawa Timur', 1, NULL, 'default.png'),
('19542', 'Dimas Setiawan', NULL, NULL, 'Islam', 'Slamet Ridwani', '085850237379', 'JL. JANTI BARAT NO. 131 RT.06/RW.08 Kel.Bandungrejosari Kec.Sukun-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19544', 'Dino Sapta Rizki', NULL, NULL, 'Islam', 'Trisulo Hadi Maruto', '0341562484', 'Jl Duku No 3 RT.12/RW.5 Kel.Bareng Kec.Klojen-Kota Malang Jawa Timur 65116', 1, NULL, 'default.png'),
('19545', 'Dio Wahyu Wijoyo', NULL, NULL, 'Islam', 'Diah Wahyu Lestari', '085815774587', 'griya permata alam KJ no.2 RT.5/RW.14Dsn.ngijo Kel.Ngijo Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19547', 'Dwiky Yusuf Afandy', NULL, NULL, 'Islam', 'Heru Susanto', '082230427703', 'JL. DIRAN NO.67 RT.3/RW.1 Kel.Sisir Kec.Batu-Kota Batu Jawa Timur 65314', 1, NULL, 'default.png'),
('19548', 'Eko Bagus Rahmanto', NULL, NULL, 'Islam', 'Ponimin', '089668294180', 'JL. BRAWIJAYA RT.23/RW.03 Kel.Tegalweru Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19549', 'Eko Susilo', NULL, NULL, 'Islam', 'Edy Suparno_x000D_', '082189314166', 'MULYODADI  RT.3/RW.1 Kel.- Kec.--- -', 1, NULL, 'default.png'),
('19550', 'Eri Tri Wahyudi', NULL, NULL, 'Islam', 'Abdul Rozak', '082334725482', 'RAYA DENGKOL NO.180 RT.3/RW.2Dsn.KRAJAN Kel.Dengkol Kec.Singosari-Kabupaten Malang Jawa Timur 65153', 1, NULL, 'default.png'),
('19552', 'Fadillah Noer Ashary', NULL, NULL, 'Islam', 'Jinto Shahari', '082338690417', 'JL PERTAMANAN III RT.11/RW.04Dsn.KEPUH Kel.Kepuharjo Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19553', 'Farhan Daffa Saputra', NULL, NULL, 'Islam', 'Budiman Toto Suharto', '081252110777', 'Jl. Balean Barat No 63 RT.6/RW.9 Kel.Lowokwaru Kec.Lowokwaru-Kota Malang Jawa Timur 65141', 1, NULL, 'default.png'),
('19554', 'Fatkhul Dhiya Ul Haqillah Al Qudus', NULL, NULL, 'Islam', 'Agus Lestari', '085755304272', 'margojoyo no.5 RT.2/RW.2Dsn.jetis Kel.Mulyoagung Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19555', 'Febrian Putra Nugraha', NULL, NULL, 'Islam', 'Bambang Sumarsono', '082337750336', 'JL DANUR WENDA II 6/E NO 8 RT.04/RW.16 Kel.- Kec.--- -', 1, NULL, 'default.png'),
('19556', 'Febrian Septa Putra Prasetya', NULL, NULL, 'Islam', 'Mincuk Prasetyo', '085615023760', 'RT.47/RW.07Dsn.SABRANG BENDO Kel.- Kec.--- -', 1, NULL, 'default.png'),
('19557', 'Ferdi Kurniawan', NULL, NULL, 'Islam', 'Sumarmi', '082148058629', 'ARIS MUNANDAR RT.4/RW.1Dsn.KRAJAN Kel.Bocek Kec.Karangploso-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19558', 'Fiyo Apriliyo Rahmansyah', NULL, NULL, 'Islam', 'Maman Firmansyah', '082301068353', 'JL SRI GADING RT.16/RW.02Dsn.KRAJAN Kel.Gadingkulon Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19559', 'Fransisco Musafet', NULL, NULL, 'Islam', 'Untung', '082233951259', 'JL MANGGA NO 29 RT.77/RW.12Dsn.SUMBERSARI Kel.Giripurno Kec.Bumiaji-Kota Batu Jawa Timur 65333', 1, NULL, 'default.png'),
('19560', 'Galang Krisna Pramudika', NULL, NULL, 'Islam', 'Bambang Hermanto', '087701457879', 'JL. KLUWEH NO. B 6 RT.2/RW.3 Kel.Bumiayu Kec.Kedungkandang-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19562', 'Gusti Indra Cahya', NULL, NULL, 'Kristen', 'Supranadi', '083131119440669', 'Jl Tirtagangga No 08 RT.08/RW.05Dsn.Samaan Kel.Samaan Kec.Klojen-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19563', 'Guvano Wildana Pramanta', NULL, NULL, 'Islam', 'Amin', '081233835700', 'JL. BERINGIN  RT.25/RW.05Dsn.SEBALUH Kel.Pandesari Kec.Pujon-Kabupaten Malang Jawa Timur 65391', 1, NULL, 'default.png'),
('19564', 'Hasrul Ginanjar', NULL, NULL, 'Islam', 'Nukin', '081917363193', 'LAPANGAN NGABAB RT.21/RW.4 Kel.Ngabab Kec.Pujon-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19565', 'Hermi Arif Setiawan', NULL, NULL, 'Islam', 'Hari Gatot Santoso', '089533998339', 'JL PULAUMAS 03 RT.03/RW.09Dsn.BABAAN Kel.- Kec.--- - 65152', 1, NULL, 'default.png'),
('19566', 'Hisyam Badar Danuarta', NULL, NULL, 'Islam', 'Warsito', '085852071793', 'CANDI III NO.103 RT.6/RW.3 Kel.Karang Besuki Kec.Sukun-Kota Malang Jawa Timur 65146', 1, NULL, 'default.png'),
('19567', 'Indra Sucahyo', NULL, NULL, 'Kristen', 'Rudi Utomo', '082141451258', 'Jl Wukir IX No 5 A RT./RW. Kel.- Kec.--- -', 1, NULL, 'default.png'),
('19568', 'Irfan Agus Wahyudi', NULL, NULL, 'Islam', 'Yauri', '082244653664', 'JL. BEDALISODO RT.22/RW.07Dsn.BEDALI Kel.Dalisodo Kec.Wagir-Kabupaten Malang Jawa Timur 65158', 1, NULL, 'default.png'),
('19569', 'Irvan Yusnizar', NULL, NULL, 'Kristen', 'Kasmin Nababan', '0341593375', 'JL. HAYAM WURUK NO.14 RT.02/RW.03Dsn.ORO ORO OMBO Kel.- Kec.--- - 65316', 1, NULL, 'default.png'),
('19570', 'Isvanur Dwi Prasetyo', NULL, NULL, 'Kristen', 'Supaat', '089654789470', 'JL SUKADI NO 6A RT.02/RW.07Dsn.DADAPTULIS DALAM Kel.Dadaprejo Kec.Junrejo-Kota Batu Jawa Timur 65323', 1, NULL, 'default.png'),
('19572', 'Jun Edi Catur Setiawan', NULL, NULL, 'Islam', 'Djumali', '085232677139', 'Jl. Kol Sugiono / Gadang 1A No 7 RT.2/RW.1Dsn.Gadang Kel.Gadang Kec.Sukun-Kota Malang Jawa Timur 65149', 1, NULL, 'default.png'),
('19573', 'Koirul Hanam', NULL, NULL, 'Islam', 'Roudhotul Djannah', '0341553957', 'sumbersari II NO.99 RT.4/RW.1 Kel.Ngembul Kec.Binangun-Kabupaten Blitar Jawa Timur', 1, NULL, 'default.png'),
('19574', 'Krisna Putra Adi Pratama', NULL, NULL, 'Islam', 'Supriadi', '082233603349', 'JL KELENA NO 1 RT.04/RW.01Dsn.LP Kel.Sumber Brantas Kec.Bumiaji-Kota Batu Jawa Timur', 1, NULL, 'default.png'),
('19575', 'Kurniawan Dwi Yulianto', NULL, NULL, 'Islam', 'Sugianto', '089676583170', 'JL. MASJID GG 5 NO.382 RT.05/RW.04Dsn.KRAJAN Kel.Dengkol Kec.Singosari-Kabupaten Malang Jawa Timur 65153', 1, NULL, 'default.png'),
('19576', 'Lintang Handal Galang Aradhana Sitangsu', NULL, NULL, 'Islam', 'Purwanto', '081334956989', 'JL. ABDUL GHONAIM RT.01/RW.05Dsn.BANARAN Kel.- Kec.--- -', 1, NULL, 'default.png'),
('19577', 'M. Adam Ramadhani', NULL, NULL, 'Islam', 'Adi Susanto', '081334712915', 'Jl Raya Sawojajar Gg 7 No 12 F RT.01/RW.02 Kel.Sawojajar Kec.Kedungkandang-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19578', 'M.Deni Kurniawan', NULL, NULL, 'Islam', 'Imam Kanapi', '0895366898231', 'merpati RT.5/RW.8Dsn.kendalsari Kel.Ngijo Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19579', 'Marela Siska Dinda Wati', NULL, NULL, 'Islam', 'Saleh', '085645525599', 'JL. JANTI BARAT NO. 128 RT.6/RW.8 Kel.Bandungrejosari Kec.Sukun-Kota Malang Jawa Timur 65148', 1, NULL, 'default.png'),
('19580', 'Mochamad Aldo Versyo Setiawan', NULL, NULL, 'Islam', 'Sugeng Setiawan', '087751344301', 'RT.25/RW.4Dsn.KAMBAL Kel.Mulyorejo Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19581', 'Mochammad Khodir', NULL, NULL, 'Islam', 'Suji', '081333088663', 'JL. H. NUROIS RT.3/RW.4Dsn.GENTON Kel.Tirtomoyo Kec.Pakis-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19582', 'Mochammad Nurul Huda', NULL, NULL, 'Islam', 'Suyono', '08993603344', 'dieng atas RT.4/RW.2Dsn.sumberjo Kel.Kalisongo Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19584', 'Mochammad Renaldi Pratama', NULL, NULL, 'Islam', 'Ali Mas Up', '0895397178186', 'JL HASANUDIN RT.68/RW.10Dsn.KEDUNG Kel.Giripurno Kec.Bumiaji-Kota Batu Jawa Timur', 1, NULL, 'default.png'),
('19585', 'Mohamad Denta Abdul Rosyid', NULL, NULL, 'Islam', 'Imam Tabut', '087819745398', 'RT./RW. Kel.Kasembon Kec.Kasembon-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19587', 'Mualif Fadhli Maula', NULL, NULL, 'Islam', 'Sugeng', '081554902875', 'RT.02/RW.01Dsn.SEKAR Kel.Sidodadi Kec.Ngantang-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19588', 'Muhamad Ali Fahmi', NULL, NULL, 'Islam', 'Slamet', '085853461422', 'JL. TANJUNG SARI NO.93B RT.33/RW.07 Kel.Kepuharjo Kec.Karangploso-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19589', 'Muhamad Misbach Suryo Nugroho', NULL, NULL, 'Islam', 'Ahmad Fauzi Maulana', '081357487246', 'jL. Raya Candi V No 177 RT.8/RW.5Dsn.Badud Kel.Karang Besuki Kec.Sukun-Kota Malang Jawa Timur 65146', 1, NULL, 'default.png'),
('19590', 'Muhamad Prasetyo Amarta', NULL, NULL, 'Islam', 'Eko Purwanto', '085604762956', 'RT.19/RW.5Dsn.Dermosari Kel.Sumberagung Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19591', 'Muhammad Abdy Hendrawan', NULL, NULL, 'Islam', 'DIDING SULISTIO RINI_x000D_', '085231828267', 'PERUM KARANGPLOSO VIEW NO. L-5 RT.01/RW.18Dsn.NGENEP Kel.Ngenep Kec.Karangploso-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19592', 'Muhammad Adi Setiawan', NULL, NULL, 'Islam', 'Tolip', '089518542424', 'JL. MELATI NO.33 RT.02/RW.10Dsn.CURAH KEMBANG Kel.Ngenep Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19593', 'Muhammad Ainul Dzaki', NULL, NULL, 'Islam', 'Kistiono', '082335079372', 'RAYA LANGLANG NO.11 RT.3/RW.2Dsn.LANGLANG Kel.Arjosari Kec.Blimbing-Kota Malang Jawa Timur 65153', 1, NULL, 'default.png'),
('19594', 'Muhammad Adji Prasetya Darmawan', NULL, NULL, 'Islam', 'Achmad Taufik Rachman', '0895366346029', 'Jl. Sunan Ampel I/22 RT.9/RW.2 Kel.Dinoyo Kec.Lowokwaru-Kota Malang Jawa Timur 65144', 1, NULL, 'default.png'),
('19595', 'Muhammad Alfian Rizky S', NULL, NULL, 'Islam', 'Salim', '085288774919', 'Jl. Batang Hari No 24  RT.5/RW.3 Kel.Rampal Celaket Kec.Klojen-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19596', 'Muhammad Alfin Syarif Hamizan', NULL, NULL, 'Islam', 'Eko Sulistio', '0895395151099', 'JA.SUPRAPTO IIB NO.97 RT.1/RW.3 Kel.Samaan Kec.Klojen-Kota Malang Jawa Timur 65112', 1, NULL, 'default.png'),
('19597', 'Muhammad Amirudin', NULL, NULL, 'Islam', 'Roudhotul Djannah', '082142552014', 'Jl Sumbersari No 99 RT.04/RW.02 Kel.- Kec.--- - 65145', 1, NULL, 'default.png'),
('19598', 'Muhammad Andy Firmansyah', NULL, NULL, 'Islam', 'Sumaudi', '081334707091', 'joyo utomo II NO.425 RT.1/RW.4 Kel.Merjosari Kec.Lowokwaru-Kota Malang Jawa Timur 65144', 1, NULL, 'default.png'),
('19599', 'Muhammad Bayu Aji Kurniawan', NULL, NULL, 'Islam', 'Adji Djulianto', '087854120647', 'Jl. Tompo Truno RT.3/RW.3Dsn.Beji Kel.Beji Kec.Beji-Kabupaten Pasuruan Jawa Timur 67154', 1, NULL, 'default.png'),
('19601', 'Muhammad Dzikryan Rifanda', NULL, NULL, 'Islam', 'Muhammad Fauzi', '085100722612', 'jombang IB NO.186B RT.11/RW.3 Kel.Gadingkasri Kec.Klojen-Kota Malang Jawa Timur 61551', 1, NULL, 'default.png'),
('19602', 'Muhammad Farhan', NULL, NULL, 'Islam', 'Mstohir', '089656604621', 'JL. TELUK CENDRAWASI NO.16 RT.07/RW.01 Kel.Arjosari Kec.Blimbing-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19603', 'Muhammad Hadiyyatulloh', NULL, NULL, 'Islam', 'Zainal Abidin', '082234840896', 'masjid RT.3/RW.6Dsn.ngepeh Kel.Junrejo Kec.Junrejo-Kota Batu Jawa Timur 65324', 1, NULL, 'default.png'),
('19604', 'Muhammad Islahudin Akbar', NULL, NULL, 'Islam', 'Mukarim', '081334729720', 'PERUM.GPA KD 38 RT.5/RW.15 Kel.Ngijo Kec.Karangploso-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19605', 'Muhammad Nur Andika', NULL, NULL, 'Islam', 'Nur Latif', '082337979757', 'joyo taman sari RT.5/RW.6 Kel.Merjosari Kec.Lowokwaru-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19606', 'Muhammad Nurlianto', NULL, NULL, 'Islam', 'Poniran', '008513040533', 'MENDALAN RT.6/RW.6Dsn.PONDOK Kel.Pondok Agung Kec.Kasembon-Kabupaten Malang Jawa Timur 65393', 1, NULL, 'default.png'),
('19607', 'Muhammad Reza As Adi', NULL, NULL, 'Islam', 'Sukri Utomo', '085233052339', 'JL. MERPATI RT.07/RW.08Dsn.KENDALSARI Kel.Ngijo Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19608', 'Muhammad Rizal Fahrudin', NULL, NULL, 'Islam', 'Imam Amanu', '085804142969', 'RT./RW. Kel.Ngabab Kec.Pujon-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19609', 'Muhammad Syahrul Ramadhan', NULL, NULL, 'Islam', 'Karyo Santoso', '082331281082', 'Jl. Perum Bumi Palapa Blok F No 6A Kel.Jatimulyo Kec.Lowokwaru-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19611', 'Muhammad Wafik Wildan Zamroni', NULL, NULL, 'Islam', 'Khoirul Anwar', '085259237668', 'JL TAMANSARI NO 8 RT.01/RW.02Dsn.MANTUNG Kel.Ngabab Kec.Pujon-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19612', 'Muhammad Yusron Arif', NULL, NULL, 'Islam', 'Taru', '081333777483', 'Jl. Raya Kedawung No 43 RT.7/RW.1Dsn.Kedawung Kel.Ngijo Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19613', 'Myco Wahyudha Pratama', NULL, NULL, 'Islam', 'Wahyudi', '0857483956117', 'Jl. Krajan RT.16/RW.3Dsn.Krajan Kel.Ngabab Kec.Pujon-Kabupaten Malang Jawa Timur 65391', 1, NULL, 'default.png'),
('19614', 'Nadilla Putri Wijaya', NULL, NULL, 'Islam', 'Nirwana Hadi Wijaya', '08217210249', 'BATU RT./RW. Kel.- Kec.--- -', 1, NULL, 'default.png'),
('19615', 'Nadindra Sefa Maulana', NULL, NULL, 'Islam', 'Moch Taufiq Hidayat', '081918438311', 'JL BRIGJEN ABDUL MANAN WIJAYA NO 25 RT.01/RW.01Dsn.KRAJAN Kel.Ngroto Kec.Pujon-Kabupaten Malang Jawa Timur 65391', 1, NULL, 'default.png'),
('19617', 'Neda Putra C', NULL, NULL, 'Islam', 'Sucipto', '08563605839', 'industri timur no.2 RT.1/RW.1 Kel.Purwantoro Kec.Blimbing-Kota Malang Jawa Timur 65122', 1, NULL, 'default.png'),
('19618', 'Nedo Putra C', NULL, NULL, 'Kristen', 'Sucipto', '081217141482', 'INDUSTRI TIMUR II NO.2 RT.1/RW.1 Kel.Purwantoro Kec.Blimbing-Kota Malang Jawa Timur 65122', 1, NULL, 'default.png'),
('19619', 'Muhammad Adam Rivaldo', NULL, NULL, 'Islam', 'Hadi Pranoto', '085100151731', 'atletik no.11 RT.1/RW.3 Kel.Tasikmadu Kec.Lowokwaru-Kota Malang Jawa Timur 65143', 1, NULL, 'default.png'),
('19620', 'Nur Azis', NULL, NULL, 'Islam', 'Jainal Arifin', '089667823943', 'Jl. Simpang Borobudur Utara No 27  RT.1/RW.13 Kel.Mojolangu Kec.Lowokwaru-Kota Malang Jawa Timur 65142', 1, NULL, 'default.png'),
('19621', 'Oktavian Galih Wirandi', NULL, NULL, 'Islam', 'Supriadi', '082245177718', 'JL TULIP DESA NGROTO RT.24/RW.11Dsn.KRAJAN Kel.Ngroto Kec.Pujon-Kabupaten Malang Jawa Timur 65391', 1, NULL, 'default.png'),
('19622', 'Petra Febri Adi Kristian', NULL, NULL, 'Kristen', 'Supradi', '082231119896', 'RT.3/RW.3Dsn.krajan Kel.Sumber Brantas Kec.Bumiaji-Kota Batu Jawa Timur 65336', 1, NULL, 'default.png'),
('19623', 'Priyo Prasetyo', NULL, NULL, 'Islam', 'Sutrisno', '081246558066', 'JL HASANUDIN RT.04/RW.06Dsn.JEDING Kel.Junrejo Kec.Junrejo-Kota Batu Jawa Timur 65321', 1, NULL, 'default.png'),
('19624', 'Putra Regina Prayoga', NULL, NULL, 'Islam', 'Choirul Anam', '085232445388', 'RT.22/RW.07Dsn.lebon Kel.Madiredo Kec.Pujon-Kabupaten Malang Jawa Timur 65391', 1, NULL, 'default.png'),
('19625', 'Raditya Surya Hermawan', NULL, NULL, 'Islam', 'Surya Agus Sanjaya', '083890670380', 'DESA NGABAB RT.13/RW.02Dsn.KRAJAN Kel.- Kec.--- - 65391', 1, NULL, 'default.png'),
('19627', 'Rahmat Pratama Hindarto', NULL, NULL, 'Islam', 'Muhammad Sholihin Sp', '088803021791', 'perum.riverside D/323 RT.3/RW.5 Kel.Balearjosari Kec.Blimbing-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19628', 'Raihan Kevin Ardika Fahreza', NULL, NULL, 'Islam', 'Asbari Sebayu', '089697661180', 'JL. SUWARNO NO 10 RT.01/RW.06Dsn.DADAP TULIS Kel.Dadaprejo Kec.Junrejo-Kota Batu Jawa Timur 65323', 1, NULL, 'default.png'),
('19630', 'Rangga Januar Amayara', NULL, NULL, 'Islam', 'Agus Rudianto', '0895395172318', 'raya sengkaling sidoayem no.4B RT.1/RW.10 Kel.Mulyoagung Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19631', 'Reksa Putra Adi Prasetyo', NULL, NULL, 'Islam', 'Bambang Sutejo', '085259974692', 'Jl Wukir Rantau No 1 RT.1/RW.4Dsn.Krajan Kel.Torongrejo Kec.Junrejo-Kota Batu Jawa Timur 65351', 1, NULL, 'default.png'),
('19632', 'Reza Andrean Fernando', NULL, NULL, 'Islam', 'Satino', '081234356611', 'JL. BUNGA DEWANDARU 19 E RT.04/RW.08 Kel.Tempursari Kec.Sidoharjo-Kabupaten Wonogiri Jawa Tengah', 1, NULL, 'default.png'),
('19633', 'Rezon Aristo Efendy', NULL, NULL, 'Islam', 'Didik Ahmad Efendy', '083848623559', 'TEGAL GONDO NO.3 RT.18/RW.4Dsn.MOJOREJO Kel.Pendem Kec.Junrejo-Kota Batu Jawa Timur 65324', 1, NULL, 'default.png'),
('19634', 'Riski Firmansyah', NULL, NULL, 'Islam', 'Rudi Santoso', '082236932405', 'RT.25/RW.08Dsn.PRECET Kel.Sumbersuko Kec.Wagir-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19635', 'Risky Purba Adi Putra', NULL, NULL, 'Islam', 'Sumarlan Adi Suwarno', '085704195560', 'Jl. Mawar Putih No. 17 RT.01/RW.11Dsn.Sukorembuk Kel.- Kec.Batu-Kota Batu Jawa Timur', 1, NULL, 'default.png'),
('19636', 'Risky Sahroni', NULL, NULL, 'Islam', 'Agus Muchid', '085645865771', 'duku no.17 RT.3/RW.1Dsn.songgoriti Kel.- Kec.Batu-Kota Batu Jawa Timur 65312', 1, NULL, 'default.png'),
('19638', 'Rivky Firmansyah Al Farizi', NULL, NULL, 'Islam', 'Bai', '082131793282', 'JL. RAYA PUTUK NONGKOJAJAR RT.2/RW.1Dsn.PUTUK Kel.Wonosari Kec.Tutur-Kabupaten Pasuruan Jawa Timur', 1, NULL, 'default.png'),
('19640', 'Rohan Irmansyah', NULL, NULL, 'Islam', 'Sulchan', '085649861314', 'Jl. Ikan Piranha Blok  K No 45 RT.8/RW.3Dsn.Purwodadoi Kel.Watugede Kec.Singosari-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19642', 'Rully Dwi Saputra', NULL, NULL, 'Islam', 'Alexander Hardono', '082131881566', 'JL. CANDI BADUT NO.54 RT.04/RW.02 Kel.Mojolangu Kec.Lowokwaru-Kota Malang Jawa Timur 65142', 1, NULL, 'default.png'),
('19643', 'Ryan Wahyu Kurnianto', NULL, NULL, 'Islam', 'Junaedi', '081235249176', 'Jl. Raya RT.29/RW.8 Dsn.Ngudi Kel.Tawangargo Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19644', 'Ryco Ardiansyah', NULL, NULL, 'Islam', 'Eko Sudarmaji', '081232873237', 'JL. RAYA TLOGOMAS NO.65 RT.04/RW.07Dsn.NGELO Kel.Tlogomas Kec.Lowokwaru-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19646', 'Septa Hardi Saputra', NULL, NULL, 'Islam', 'Sindurejo', '082141408811', 'damun no.46 RT.4/RW.6 Kel.Beji Kec.Junrejo-Kota Batu Jawa Timur', 1, NULL, 'default.png'),
('19647', 'Sofyan Adi Permana', NULL, NULL, 'Islam', 'Suliadi', '082332013282', 'RT.02/RW.03Dsn.KRAJAN Kel.Gedangan Kec.Gedangan-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19648', 'Surya Lintang Gumebyar', NULL, NULL, 'Islam', 'Wiwin Sunariyadi', '082132859414', 'JL HASANUDIN  RT.04/RW.05Dsn.JEDING Kel.Junrejo Kec.Junrejo-Kota Batu Jawa Timur 65321', 1, NULL, 'default.png'),
('19650', 'Teguh Wahyudi', NULL, NULL, 'Islam', 'Warimin', '082335926460', 'bedalisodo RT.21/RW.7Dsn.bedali Kel.Dalisodo Kec.Wagir-Kabupaten Malang Jawa Timur 65158', 1, NULL, 'default.png'),
('19651', 'Tomas Adi Pranoto', NULL, NULL, 'Islam', 'Porwadi', '082230243814', 'RT.25/RW.8Dsn.Precet Kel.Sumbersuko Kec.Wagir-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19652', 'Toni Andrianto', NULL, NULL, 'Islam', 'Turijo', '00000000000', 'JL. TLOGOMAS GG.8 C2 RT.06/RW.05 Kel.Tlogomas Kec.Lowokwaru-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19653', 'Toriq Afif Fernanda', NULL, NULL, 'Islam', 'Muchamad Nizar', '081572990944', 'Puncak permata sengkaling Jl Jambu Blok II No 1 RT.3/RW.6 Kel.- Kec.--Kota Denpasar Bali 65151', 1, NULL, 'default.png'),
('19654', 'Valentino Frana Putra', NULL, NULL, 'Islam', 'Lucky Juli Gananda', '088996030591', 'Jl MH Thamrin Gg I B 23 RT.03/RW.04Dsn.Klojen Kel.Gandoang Kec.Cileungsi-Kabupaten Bogor Jawa Barat 65117', 1, NULL, 'default.png'),
('19656', 'Venno Hari Saputra', NULL, NULL, 'Islam', 'Hariyono', '085233050522', 'DEWI SARTIKA NO.11 RT.9/RW.9Dsn.GENENGAN Kel.Temas Kec.Batu-Kota Batu Jawa Timur 65315', 1, NULL, 'default.png'),
('19657', 'Vila Yufen Arvino', NULL, NULL, 'Islam', 'Salkan Efendi`', '085749719945', 'JL. JOYO TAMAN REJO NO.40 RT.03/RW.06 Kel.Merjosari Kec.Lowokwaru-Kota Malang Jawa Timur 65144', 1, NULL, 'default.png'),
('19658', 'Wildhan Rafif Pratama', NULL, NULL, 'Islam', 'Wondo', '082142602201', 'RT.2/RW.5Dsn.Ngrayung Kel.Kedunghardjo Kec.Bangilan-Kabupaten Tuban Jawa Timur', 1, NULL, 'default.png'),
('19659', 'Wiranto Agung Prasetyo', NULL, NULL, 'Khatolik', 'Setyo Aryo Winadi', '085100364774', 'JL. LAHOR NO 38 RT.02/RW.12 Kel.Pesanggrahan Kec.Batu-Kota Batu Jawa Timur 65313', 1, NULL, 'default.png'),
('19660', 'Yuda Prasetyo Lestari', NULL, NULL, 'Islam', 'Mistari', '082232143278', 'RT.09/RW.03Dsn.AMPELANTUK Kel.Sukodadi Kec.Wagir-Kabupaten Malang Jawa Timur 65158', 1, NULL, 'default.png'),
('19661', 'Abdullah Moebin Maulana', NULL, NULL, 'Islam', 'Supriyanto', '05608224505', 'gadang gg.15 no.18 RT.5/RW.2 Kel.Tanjungrejo Kec.Sukun-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19662', 'Abdullah Roziqin', NULL, NULL, 'Islam', 'Bunari', '085102670901', 'apel dalam no.12 RT.5/RW.1Dsn.semanding Kel.Sumbersekar Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19663', 'Agung Ginanjar Mulyono', NULL, NULL, 'Islam', 'Asri Puji Rahayu', '081217392324', 'Jl Simpang Candi Panggung No 92 RT.03/RW.09 Kel.Mojolangu Kec.Lowokwaru-Kota Malang Jawa Timur 65142', 1, NULL, 'default.png'),
('19665', 'Agus Ahmad', NULL, NULL, 'Islam', 'Lasi Wahyono', '082132901942', 'Jl. Mawar RT.20/RW.6Dsn.Girimulyo Kel.Gedangan Kec.Gedangan-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19666', 'Akhmad Wahyu Prasetyo', NULL, NULL, 'Islam', 'Budin', '081239865504', 'Jl. Joyo Tambak Sari No 01 AA RT.5/RW.1 Kel.- Kec.--- -', 1, NULL, 'default.png'),
('19668', 'Aldi Septiansyah', NULL, NULL, 'Islam', 'Suyitno', '081217497780', 'JL BRAWIJAYA RT.14/RW.03Dsn.KRAJAN Kel.Tegalweru Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19669', 'Alfandri Setyawan', NULL, NULL, 'Islam', 'Sumadi', '089666767281', 'TIRTO UTOMO NO.19 RT.3/RW.3 Kel.Landungsari Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19670', 'Alvin Bagus Aditya', NULL, NULL, 'Islam', 'Samsul Hadi', '081334250429', 'JL. TLOGOJOYO NO.15 RT.05/RW.01 Kel.Tlogomas Kec.Lowokwaru-Kota Malang Jawa Timur 65144', 1, NULL, 'default.png'),
('19672', 'Anggi Narta Utama', NULL, NULL, 'Islam', 'Sunarmi', '0895366896636', 'JL. KARANG AMPEL NO.7 RT.16/RW.02Dsn.KARANG AMPEL Kel.Karangwidoro Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19673', 'Aril Febrian Maulana', NULL, NULL, 'Islam', 'Ahmad Mulkan', '087783198455', 'MAWAR RT.4/RW.2Dsn.NGROTO Kel.Ngroto Kec.Pujon-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19675', 'Arjun Ningrat Fajar Fadloli', NULL, NULL, 'Islam', 'Sutikno', '085784328022', 'tirto rahayu gang I no.9 RT.1/RW.4 Kel.Landungsari Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19676', 'Arta Cahaya Sampurno', NULL, NULL, 'Islam', 'Sampurno', '085860161629', 'MULYODADI JETAK LOR RT.2/RW.1 Kel.Mulyoagung Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19677', 'Arya Eka Putra Pratama', NULL, NULL, 'Islam', 'Suyanto', '082301067844', 'RAYA TLOGOMAS IV NO.43 RT.03/RW.06 Kel.Tlogomas Kec.Lowokwaru-Kota Malang Jawa Timur 65144', 1, NULL, 'default.png'),
('19678', 'Brahmanarendra Arya Rahardja', NULL, NULL, 'Islam', 'Yudhi Wirawan', '081333761121', 'Jl. Sidomakmur No 72A Sengkaling RT.2/RW.3 Kel.Mulyoagung Kec.Dau-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19679', 'Danny Baskara Wijaya', NULL, NULL, 'Kristen', 'Wahyudi Baskoro', '083848540013', 'KLAMPOK KASRI NO II A/GA RT.01/RW.02 Kel.Gadingkasri Kec.Klojen-Kota Malang Jawa Timur 65115', 1, NULL, 'default.png'),
('19680', 'Ditto Fransisco', NULL, NULL, 'Islam', 'Suhartono', '087701424848', 'kasin RT.24/RW.8Dsn.kasin Kel.Ampeldento Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19681', 'Donny Chrisendra', NULL, NULL, 'Kristen', 'J. Marconi Iskendra', '087758476299', 'JL. DANAU SENTANI II E3 B NO.26 RT.04/RW.06 Kel.Madyopuro Kec.Kedungkandang-Kota Malang Jawa Timur 65138', 1, NULL, 'default.png'),
('19682', 'Eka Mario Setyawan', NULL, NULL, 'Islam', 'Mariono', '089678289577', 'JL BUDIONO RT.04/RW.02 Kel.Punten Kec.Bumiaji-Kota Batu Jawa Timur 65338', 1, NULL, 'default.png'),
('19683', 'Farhan Ramdani', NULL, NULL, 'Islam', 'Jaenal', '085708988694', 'JL. MERTOJOYO NO. 11 A RT.1/RW.10 Kel.Merjosari Kec.Lowokwaru-Kota Malang Jawa Timur 65144', 1, NULL, 'default.png'),
('19685', 'Fernanda Reza Syahputra', NULL, NULL, 'Islam', 'Eko Witono', '085816615092', 'Jl. Karang  Ampel RT.12/RW.2 Kel.Karangwidoro Kec.Dau-Kabupaten Malang Jawa Timur 6515', 1, NULL, 'default.png'),
('19686', 'Irfan Mardiansyah', NULL, NULL, 'Islam', 'Suliadi', '0341554383', 'Jl. Sebuku Gg XII No 6B RT.8/RW.8 Kel.Bunulrejo Kec.Blimbing-Kota Malang Jawa Timur 65123', 1, NULL, 'default.png'),
('19687', 'Jenny Septianingrum', NULL, NULL, 'Islam', 'Mochamad Zainuri', '0895366406902', 'durian no.18 RT.2/RW.2Dsn.songgoriti Kel.Songgokerto Kec.Batu-Kota Batu Jawa Timur 65312', 1, NULL, 'default.png'),
('19690', 'M. Fiki Aditya Candra', NULL, NULL, 'Islam', 'Supriono', '085736772416', 'JL. KARANG AMPEL NO.9 RT.16/RW.02Dsn.KARANG AMPEL Kel.Karangwidoro Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19691', 'Mohammad Ikhwanul Hakim', NULL, NULL, 'Islam', 'Moh Jumadi', '081945714611', 'Jl Ikan Piranha Atas XV No 10 RT.07/RW.02Dsn.Mbesuk Kel.Tunjungsekar Kec.Lowokwaru-Kota Malang Jawa Timur 65142', 1, NULL, 'default.png'),
('19692', 'Muh. David Dwiyanto', NULL, NULL, 'Islam', 'Mahmudin', '0895395151139', 'kramat RT.6/RW.1Dsn.karas Kel.Madiredo Kec.Pujon-Kabupaten Malang Jawa Timur 65391', 1, NULL, 'default.png'),
('19693', 'Muhamad Iqbal Dwi Saputra', NULL, NULL, 'Islam', 'Ladi Widodo', '083848718898', 'JL. MUHARTO 5B NO.9 RT.17/RW.6 Kel.Kotalama Kec.Kedungkandang-Kota Malang Jawa Timur 65136', 1, NULL, 'default.png'),
('19695', 'Muhammad Fairus Zabadi', NULL, NULL, 'Islam', 'Wadiono', '081235365803', 'SUDIMORO UTARA NO.16 RT.4/RW.17 Kel.Mojolangu Kec.Lowokwaru-Kota Malang Jawa Timur 65142', 1, NULL, 'default.png'),
('19696', 'Muhammad Imam Fauzi', NULL, NULL, 'Islam', 'Turiono', '0895620089339', 'Jl. Raya Ampel No 91 RT.4/RW.1Dsn.Semanding Kel.Sumbersekar Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19697', 'Muhammad Ivani Putra', NULL, NULL, 'Islam', 'Sunardi', '081334761112', 'RT.25/RW.05Dsn.SEBALUH Kel.Pandesari Kec.Pujon-Kabupaten Malang Jawa Timur 65391', 1, NULL, 'default.png'),
('19699', 'Muhammad Rizki Andrianto', NULL, NULL, 'Islam', 'Mo. Efendi', '085607647357', 'RT.6/RW.4Dsn.LANGLANG Kel.Langlang Kec.Singosari-Kabupaten Malang Jawa Timur 65153', 1, NULL, 'default.png'),
('19700', 'Naufal Akhdan Pratama', NULL, NULL, 'Islam', 'Sulianto', '0895802740104', 'JL ANGGUR RT.01/RW.01Dsn.SEMANDING Kel.Sumbersekar Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19701', 'Novreza Arian Valen', NULL, NULL, 'Islam', 'Yasarlan Fauzi', '08230186540', 'Jl. Dr Sutomo Kemantren III No 61 RT.6/RW.13Dsn.Kemantren Kel.- Kec.--- -', 1, NULL, 'default.png'),
('19702', 'Rahayu Pinerkahan', NULL, NULL, 'Kristen', 'Marsudi', '081532255196', 'KUCUR GODEHAN NO.4 RT.24/RW.10Dsn.GOFEHAN Kel.Kucur Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19703', 'Rayhan Fauzani', NULL, NULL, 'Islam', 'Jumaah', '081333644450', 'JL. RAYA TLOGOMAS IX NO.57X RT.02/RW.07Dsn.TLOGOMAS Kel.Tlogomas Kec.Lowokwaru-Kota Malang Jawa Timur 65144', 1, NULL, 'default.png'),
('19704', 'Reyvan Tresnaldi Aby Ramadhan', NULL, NULL, 'Islam', 'Sutrisno', '082144576480', 'Jl. Langsep No 18F RT.2/RW.10Dsn.Binangun Kel.Bumiaji Kec.Bumiaji-Kota Batu Jawa Timur 65331', 1, NULL, 'default.png'),
('19706', 'Reza Maulana A', NULL, NULL, 'Islam', 'Margono', '081284083789', 'Perum Asrikaton Indah /blok F3 No 01 RT.07/RW.09 Kel.Asrikaton Kec.Pakis-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19707', 'Ruly Arizqi Irfansyach', NULL, NULL, 'Islam', 'Ngateno', '081357411053', 'JL SELOKERTO NO 42 RT.14/RW.05Dsn.SELOKERTO Kel.Selorejo Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19708', 'Ryan Abila', NULL, NULL, 'Islam', 'Choirul Imron', '08980563965', 'JL. IKAN KAKAP NO.60 RT.01/RW.06 Kel.Tunjungsekar Kec.Lowokwaru-Kota Malang Jawa Timur 65142', 1, NULL, 'default.png'),
('19709', 'Safryan Adhe Pratama', NULL, NULL, 'Islam', 'Yoyok', '081249746389', 'Jl Mayjen Panjaitan RT./RW. Kel.- Kec.--- -', 1, NULL, 'default.png'),
('19710', 'Saifuddin Akbar', NULL, NULL, 'Islam', 'Slamet Riadi', '081234572346', 'Kh. Hasyim Ashari No 57 RT.6/RW.5 Kel.Kauman Kec.Klojen-Kota Malang Jawa Timur 65119', 1, NULL, 'default.png'),
('19711', 'Sandi Dewangga Priantoko', NULL, NULL, 'Islam', 'Faozan Azima S.', '087758031558', 'Jl MT Haryono No 210 A RT./RW. Kel.- Kec.Sembalun-Kabupaten Lombok Timur Nusa Tenggara Barat', 1, NULL, 'default.png'),
('19712', 'Satria Ardiansyah', NULL, NULL, 'Islam', 'Saiful Abdullah', '081945916123', 'JOYO RAHARJO 3 NO.189 RT.3/RW.2 Kel.Merjosari Kec.Lowokwaru-Kota Malang Jawa Timur 65144', 1, NULL, 'default.png'),
('19713', 'Tandi Andrian Wicaksono', NULL, NULL, 'Islam', 'Imam Sutaji', '085331770041', 'Jl. Sidorahayu Gg Bima RT.7/RW.1 Kel.Sidorahayu Kec.Wagir-Kabupaten Malang Jawa Timur 65158', 1, NULL, 'default.png'),
('19714', 'Vijay Gunawan Mahmud', NULL, NULL, 'Islam', 'Lutfi Maylani Mahmud', '085340794212', 'RT./RW. Kel.- Kec.--- -', 1, NULL, 'default.png'),
('19715', 'Willy Arianto Pramana Putra', NULL, NULL, 'Islam', 'Dwi Supriyanto', '089531958905', 'JL. BANJAR TENGAH RT.05/RW.04 Kel.Dalisodo Kec.Wagir-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19716', 'Yeski Kristian', NULL, NULL, 'Kristen', 'EKO ADYO_x000D_', '082257310937', 'moch.juki no.31 RT.4/RW.3 Kel.Tempursari Kec.Tempursari-Kabupaten Lumajang Jawa Timur', 1, NULL, 'default.png'),
('19717', 'Yohsafat Rehan Dwi Saputra', NULL, NULL, 'Kristen', 'Agus Misdiono', '088217421267', 'RT.08/RW.05Dsn.DADAPAN Kel.- Kec.--- - 65332', 1, NULL, 'default.png'),
('19718', 'Yusril Aditya Yahya', NULL, NULL, 'Islam', 'Abdul Qohar', '082244095214', 'JL BUYUT LISAH RT.25/RW.09Dsn.KASIN Kel.Ampeldento Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19719', 'Zidan Machbubi', NULL, NULL, 'Islam', 'Moch Siful', '085100091040', 'Jl. Bunder RT.2/RW.1Dsn.Bunder Kel.Tunjungtirto Kec.Singosari-Kabupaten Malang Jawa Timur 65153', 1, NULL, 'default.png'),
('19721', 'Andi Yulpikar Anwar', NULL, NULL, 'Islam', 'Mukhamad', '0859185931246', 'tirto taruno no.06-A RT.3/RW.8Dsn.klandungan Kel.Landungsari Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19722', 'Ariya Pramasta', NULL, NULL, 'Islam', 'Sugiarto', '0895397163864', 'ahmad yani RT.6/RW.2Dsn.petungsewu Kel.Petung Sewu Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19723', 'Bagus Fadli', NULL, NULL, 'Islam', 'Sumadi', '088217269603', 'Jl. Tirto Utomo No.53 RT.01/RW.03Dsn.Rambaan Kel.Landungsari Kec.Dau-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19724', 'Bakal Ibnu Afan', NULL, NULL, 'Islam', 'Budiono', '085785388161', 'JL. SIMBAR MENJANGAN RT.05/RW.03Dsn.MANGU Kel.Jatimulyo Kec.Lowokwaru-Kota Malang Jawa Timur 65141', 1, NULL, 'default.png'),
('19725', 'Candra Krisna Dani', NULL, NULL, 'Islam', 'Bambang HP_x000D_', '085100682542', 'JL RAYA AMPEL SEMANDING NO 60 RT.05/RW.01 Kel.Sumbersekar Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19726', 'David Aria Susanto', NULL, NULL, 'Islam', 'Kasmuriyanto', '082333950781', 'Jl.Raya Blimbing NO.19 RT.04/RW.01Dsn.Kenongo Kel.Sumbersuko Kec.Wagir-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19728', 'Dyon Mario Candra', NULL, NULL, 'Islam', 'Dwi Siswanto', '08557265184', 'JL. KARANG JUWET NO.13 RT.32/RW.08Dsn.KARANGJUWET Kel.Donowarih Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19729', 'Fajar Arifian', NULL, NULL, 'Islam', 'Slamet', '085733862912', 'JL. TIRTO TARUNO GG 2 NO.10 RT.01/RW.07Dsn.KLANDUNGAN Kel.Landungsari Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19730', 'Farid Zaidan Abdillah', NULL, NULL, 'Islam', 'Nur Hadi Cahyono', '082244649913', 'JL BRUGAH NO 31 RT.02/RW.04Dsn.BEJI Kel.Beji Kec.Junrejo-Kota Batu Jawa Timur 65326', 1, NULL, 'default.png'),
('19731', 'Frendy Flarezza', NULL, NULL, 'Islam', 'Siti Fatimah', '082337738440', 'RT.1/RW.11Dsn.genitri Kel.- Kec.--- - 65152', 1, NULL, 'default.png'),
('19732', 'Maulana Wahyu Putra Kusuma', NULL, NULL, 'Islam', 'Ketang Supriyadi', '081334759745', 'JL. TERUSAN KEMBANG TURI RT.04/RW.04Dsn.MAGETAN Kel.Jatimulyo Kec.Lowokwaru-Kota Malang Jawa Timur 65141', 1, NULL, 'default.png'),
('19733', 'Muhamad Maulana Ardiansyah', NULL, NULL, 'Islam', 'Tubi Adi', '083846733889', 'JL FLAMBOYAN  RT.40/RW.10Dsn.SEKAR PUTIH Kel.Pendem Kec.Junrejo-Kota Batu Jawa Timur', 1, NULL, 'default.png'),
('19734', 'Muhammad Arwani', NULL, NULL, 'Islam', 'Imam Bukhori', '0895367137508', 'KAKAK TUA RT.2/RW.7Dsn.TAKERAN Kel.Ngijo Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19735', 'Muhammad Farid Arya Putra', NULL, NULL, 'Islam', 'Yantono', '081775743655', 'JL RAYA KANDANGAN RT.04/RW.04Dsn.KANDANGAN Kel.- Kec.--- - 65337', 1, NULL, 'default.png'),
('19736', 'Muhammad Muhaimin', NULL, NULL, 'Islam', 'Nurul Ulfa', '08973264594', 'Jl Bareng Kulon Gg 6E No 921 RT.03/RW.04 Kel.Bareng Kec.Klojen-Kota Malang Jawa Timur 65116', 1, NULL, 'default.png'),
('19737', 'Muhammad Verza Kusnaendo', NULL, NULL, 'Islam', 'Herinanik', '08976759269', 'Jl. Ikan Gurami No 2 RT.5/RW.6Dsn.Mbabatan Kel.- Kec.--- - 65142', 1, NULL, 'default.png'),
('19738', 'Nedi Septyadiono', NULL, NULL, 'Islam', 'Budiono', '085954435333', 'JL TIRTO PRALOYO NO 29 RT.02/RW.08Dsn.KLANDUNGAN Kel.Landungsari Kec.Dau-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19740', 'Nur Mukhlas', NULL, NULL, 'Islam', 'Agus Rochmad Arofi', '081554955883', 'Jl Kramat No 23 RT.01/RW.01Dsn.Langlang Kel.Langlang Kec.Singosari-Kabupaten Malang Jawa Timur 65153', 1, NULL, 'default.png'),
('19741', 'Rio Ambar Frananda', NULL, NULL, 'Islam', 'Iskan', '08123029081', 'JL WATU GEDE NO 03 RT.05/RW.02Dsn.KRAJAN Kel.Selorejo Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19742', 'Salasa Muhammad Alim', NULL, NULL, 'Islam', 'Kamijan', '082335288543', 'JL.RAYA TLOGOMAS NO 15 RT.05/RW.06 Kel.- Kec.--- -', 1, NULL, 'default.png'),
('19743', 'Septian Dimas Al Adam', NULL, NULL, 'Islam', 'Agus Saiful Arifin', '081217489150', 'JL. SAMSURI NO.9 RT.05/RW.02Dsn.KELIRAN Kel.- Kec.Bumiaji-Kota Batu Jawa Timur', 1, NULL, 'default.png'),
('19745', 'Syaheri Ramadhan Putra', NULL, NULL, 'Islam', 'Choiron', '081939317315', 'JL MOJOASRI (KAJANG TENGAH) NO 113 RT.19/RW.02Dsn.MOJOREJO Kel.Junrejo Kec.Junrejo-Kota Batu Jawa Timur', 1, NULL, 'default.png'),
('19746', 'Vicenzo Dida', NULL, NULL, 'Hindu', 'Sutomo', '082333812660', 'ASPARAGUS NO.8 RT.4/RW.11Dsn.JUNGGO Kel.Tulungrejo Kec.Bumiaji-Kota Batu Jawa Timur 65336', 1, NULL, 'default.png'),
('19747', 'Ade Marselia Agung Sekti W', NULL, NULL, 'Islam', 'Sugianto', '081249089481', 'JL. PRONOJIWO RT.12/RW.06Dsn.PRONOJIWO Kel.Pronojiwo Kec.Pronojiwo-Kabupaten Lumajang Jawa Timur 67374', 1, NULL, 'default.png'),
('19748', 'Arno Surya Pratama', NULL, NULL, 'Islam', 'Murgiono', '089629888648', 'karangjuwet donowarih RT.38/RW.9 Kel.Donowarih Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19749', 'Ayub Fardana', NULL, NULL, 'Islam', 'Triyo Yuanto', '081232108909', 'JL. DIRAN GG II NO.56 RT.05/RW.02Dsn.SISIR Kel.Sisir Kec.Batu-Kota Batu Jawa Timur 65314', 1, NULL, 'default.png'),
('19750', 'Bunga Angnesta Arta Bhakti', NULL, NULL, 'Islam', 'Zainal Arifin', '083838050492', 'JL SEKAR NO 7 RT.02/RW.05 Kel.Dadaprejo Kec.Junrejo-Kota Batu Jawa Timur 65323', 1, NULL, 'default.png'),
('19751', 'Dodik Setiawan', NULL, NULL, 'Islam', 'Tohari', '081547387949', 'JL KARANG AMPEL RT.10/RW.02 Kel.Karangwidoro Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19752', 'Fastabichul Ayu Rahmadanti', NULL, NULL, 'Islam', 'Sanuri', '089683568795', 'joyo raharjo no/169 RT.2/RW.2Dsn.joyo Kel.Merjosari Kec.Lowokwaru-Kota Malang Jawa Timur 65144', 1, NULL, 'default.png'),
('19753', 'Muhammad Zainal Efendi', NULL, NULL, 'Islam', 'Rendra Sutarno', '081233442605', 'Jl. Mastrip RT.1/RW.5Dsn.Sumberejo Kel.Balerejo Kec.Wlingi-Kabupaten Blitar Jawa Timur', 1, NULL, 'default.png'),
('19754', 'Nanda Aji Prasetyo', NULL, NULL, 'Islam', 'Bambang Hermanto', '081252640008', 'patimura no.05 RT.5/RW.7 Kel.Temas Kec.Batu-Kota Batu Jawa Timur 65315', 1, NULL, 'default.png'),
('19755', 'Nanda Raenado', NULL, NULL, 'Islam', 'Djuni', '081438041955', 'TAMBAK ASRI  RT.15/RW.03Dsn.SIDOREJO Kel.Tambakasri Kec.Sumbermanjing-Kabupaten Malang Jawa Timur 65176', 1, NULL, 'default.png'),
('19756', 'Okky Yulistya Pratiwi', NULL, NULL, 'Hindu', 'Sulistyo', '08336163663', 'JL. PRONOJIWO RT.33/RW.12Dsn.PRONOJIWO Kel.Pronojiwo Kec.Pronojiwo-Kabupaten Lumajang Jawa Timur 67374', 1, NULL, 'default.png'),
('19757', 'Ricky Andi Dwi Fernando', NULL, NULL, 'Islam', 'Sumarno', '085791578578', 'Jl Joyo Suryo No 631 RT.03/RW.05 Kel.Lebakharjo Kec.Ampelgading-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19758', 'Sabilla Nur Triasa', NULL, NULL, 'Islam', 'Trismiyarti K', '082143463681', 'JL KEDAWUNG GG 4 NO 20 B RT.04/RW.05Dsn.TULUSREJO Kel.- Kec.--- -', 1, NULL, 'default.png'),
('19759', 'Adyan Ghozy Maulana', NULL, NULL, 'Islam', 'Dedy Sumaji', '08125923157', 'Jl. Raya Anggrek No 29 RT.2/RW.2Dsn.Krajan Kel.Sumbersekar Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19760', 'Agil Abdur Ruuf', NULL, NULL, 'Islam', 'Kuswadi', '088805307205', 'JL. KARANGPLOSO VIEW BLOK AB1 RT./RW.Dsn.NGENEP Kel.Mergosono Kec.Kedungkandang-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19761', 'Alfonsho Ady Rekliansha', NULL, NULL, 'Islam', 'Agus Eko Supriyanto', '081334452331', 'JL. PATIMURA IV A NO.293 RT.06/RW.02 Kel.Klojen Kec.Klojen-Kota Malang Jawa Timur 65111', 1, NULL, 'default.png'),
('19762', 'Aliffino Putra Mawardika', NULL, NULL, 'Islam', 'Didik Sunariyadi', '0859185960874', 'JL. BOGOR 2 NO.24 RT.01/RW.04 Kel.Penanggungan Kec.Klojen-Kota Malang Jawa Timur 65113', 1, NULL, 'default.png'),
('19763', 'Amanda Latifah Nur Pahlevy', NULL, NULL, 'Islam', 'Nur Palil', '085524812338', 'RT.1/RW.2Dsn.Ploso Kel.Plosogenuk Kec.Perak-Kabupaten Jombang Jawa Timur 61461', 1, NULL, 'default.png'),
('19764', 'Ananta Wira Yudha', NULL, NULL, 'Islam', 'Masrokhan', '082140441662', 'JL. ASPARAGA NO.18 RT.02/RW.04Dsn.SENGKALING Kel.- Kec.--- - 65151', 1, NULL, 'default.png'),
('19765', 'Andre Edua Putra Irnanto', NULL, NULL, 'Islam', 'Kusiyanto', '085102528121', 'Jl. Hasanudin Gang IX No 5 RT.1/RW.9 Kel.Pesanggrahan Kec.Batu-Kota Batu Jawa Timur 65313', 1, NULL, 'default.png'),
('19766', 'Aulia Dandi Firmansyah Sunardi', NULL, NULL, 'Islam', 'Sunardi', '085791576883', 'janti barat blok A no.26A RT.6/RW.8 Kel.Bandungrejosari Kec.Sukun-Kota Malang Jawa Timur 65148', 1, NULL, 'default.png'),
('19768', 'Deni Setiyawan', NULL, NULL, 'Islam', 'Suwarno', '0341554383', 'supit urang RT.16/RW.4 Kel.Tegalweru Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19769', 'Denny Asmara Hadi', NULL, NULL, 'Islam', 'Hadi Dwi Yanto', '088976044980', 'PB SUDIRMAN RT.1/RW.1 Kel.Kauman Kec.Bangil-Kabupaten Pasuruan Jawa Timur 65152', 1, NULL, 'default.png'),
('19770', 'Fayyadh Kholid Baswedan', NULL, NULL, 'Islam', 'Kholid', '085704395539', 'RAYA TLOGOMAS GG.X NO.105 RT./RW.Dsn.NGELAH Kel.Tlogomas Kec.Lowokwaru-Kota Malang Jawa Timur 65144', 1, NULL, 'default.png'),
('19771', 'Ilham Aji Ramadhan', NULL, NULL, 'Islam', 'Sulistiono', '085732710329', 'PELABUHAN TANJUNG PERAK NO.467 RT.1/RW.3 Kel.Bakalan Krajan Kec.Sukun-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19773', 'Muhamad Fiki Fahruroji', NULL, NULL, 'Islam', 'Machrus', '081290731815', 'Jl, Kenongo Sumbersuko RT.9/RW.3Dsn.Kenongo Kel.Sumbersuko Kec.Wagir-Kabupaten Malang Jawa Timur 65158', 1, NULL, 'default.png'),
('19774', 'Muhammad Arif Maulana', NULL, NULL, 'Islam', 'Suhartono', '085233320053', 'margobasuki GG.I NO.23 RT.2/RW.1 Kel.Mulyoagung Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19775', 'Muhammad Faizal', NULL, NULL, 'Islam', 'Abdul Aziz Alkatiri', '082134334188', 'Jl. Srimulyo No 20 RT.20/RW.02Dsn.kaajan Kel.Srimulyo Kec.Dampit-Kabupaten Malang Jawa Timur 65181', 1, NULL, 'default.png'),
('19776', 'Muhammad Rifki', NULL, NULL, 'Islam', 'Suheri', '081330788120', 'JL. TEGALGONDO NO. 33 RT.9/RW.3Dsn.BABATAN Kel.Tegalgondo Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19777', 'Nanda Marfin Yohanes', NULL, NULL, 'Islam', 'Suliyanto', '087765171433', 'RT.6/RW.2Dsn.meduran Kel.Tawangsari Kec.Pujon-Kabupaten Malang Jawa Timur 65391', 1, NULL, 'default.png'),
('19778', 'Nur Hadi Muslimin', NULL, NULL, 'Islam', 'Supriyanto', '081328510482', 'RT.25/RW.4Dsn.WILOSO Kel.Gondowangi Kec.Wagir-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19779', 'Putra Yolanda', NULL, NULL, 'Islam', 'Moch.Abd.Muchlis', '0816532398', 'aris munandar no.05 RT.5/RW.3Dsn.ngenep Kel.Ngenep Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19780', 'Reynaldy Harvye Putra', NULL, NULL, 'Islam', 'Hari Sutrisno', '081230467511', 'MAHESA NO.40 RT.23/RW.4 Kel.Pujon Lor Kec.Pujon-Kabupaten Malang Jawa Timur 65391', 1, NULL, 'default.png'),
('19781', 'Rifki Bagus Naufal', NULL, NULL, 'Islam', 'Kusdianto', '089513459766', 'JL. INDRAGIRI RT.01/RW.04Dsn.SANTREAN Kel.Sumberejo Kec.Batu-Kota Batu Jawa Timur 65318', 1, NULL, 'default.png'),
('19782', 'Riski Vrayoga', NULL, NULL, 'Islam', 'Joko Siono', '082333505942', 'JL. KRAJAN TIMUR NO. 97 RT.4/RW.3 Kel.Pakiskembar Kec.Pakis-Kabupaten Malang Jawa Timur 65154', 1, NULL, 'default.png'),
('19783', 'Rizal Himawan', NULL, NULL, 'Kristen', 'Sudarmadhi', '082143207060', 'Jl. Maninjau Barat No D2 A6 RT.1/RW.8 Kel.Sawojajar Kec.Kedungkandang-Kota Malang Jawa Timur 65139', 1, NULL, 'default.png'),
('19786', 'Sulton Reisyha Afif Dinulloh', NULL, NULL, 'Islam', 'Zaenal Abidin', '085236497856', 'JL. SIDOMAKMUR NO.116 A RT.02/RW.02Dsn.JETAK Kel.Mulyoagung Kec.Dau-Kabupaten Malang Jawa Timur 6515', 1, NULL, 'default.png'),
('19787', 'Tria Agustin Nova Berliana', NULL, NULL, 'Islam', 'Sujono', '085608725288', 'RT.23/RW.03Dsn.Simo Kel.Sidodadi Kec.Ngantang-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19788', 'Yusuf Halim', NULL, NULL, 'Islam', 'Eka Juni Satria', '081907234397', 'JL TRUNOJOYO I GG SRIGADING NO 10D RT.02/RW.04 Kel.Songgokerto Kec.Batu-Kota Batu Jawa Timur 65312', 1, NULL, 'default.png'),
('19789', 'Zefa Singgih Syahputra', NULL, NULL, 'Islam', 'Nanang Wahyudi', '081259987206', 'welirang no.13 RT.16/RW.3Dsn.ngujung Kel.Pandanrejo Kec.Bumiaji-Kota Batu Jawa Timur 65332', 1, NULL, 'default.png'),
('19790', 'Zefanya Febrian Ardianto', NULL, NULL, 'Islam', 'Kadianto', '082245349741', 'Mojowangi No.36 RT.16/RW.6 Dsn.Mojorejo Kel.Mojorejo Kec.Junrejo-Kota Batu Jawa Timur', 1, NULL, 'default.png');
INSERT INTO `ms_siswa` (`nis_siswa`, `nama_siswa`, `tgl_lahir_siswa`, `jenis_kelamin_siswa`, `agama_siswa`, `nama_ortu`, `telp_ortu`, `alamat_siswa`, `id_kelas`, `id_tempat_prakerin`, `img_siswa`) VALUES
('19791', 'Abril Dhea Joti Pramanda', NULL, NULL, 'Islam', 'Joko Sutomo', '08983553283', 'JL. HASANUDIN RT.69/RW.10Dsn.KEDUNG Kel.Giripurno Kec.Bumiaji-Kota Batu Jawa Timur 65333', 1, NULL, 'default.png'),
('19792', 'Adisty Nurjanah Ana Kirana', NULL, NULL, 'Islam', 'Sukirdi', '081386924004', 'masjid ngroto no.17 RT.13/RW.6 Kel.- Kec.Pujon-Kabupaten Malang Jawa Timur', 1, 216, 'default.png'),
('19794', 'Ahmad Sutikno Alfian', NULL, NULL, 'Islam', 'Suminto', '082188564915', 'JL JOYO RAHARJO 202 A RT.03/RW.02 Kel.Merjosari Kec.Lowokwaru-Kota Malang Jawa Timur 65144', 1, NULL, 'default.png'),
('19795', 'Akmal', NULL, NULL, 'Islam', 'Hani Hilmi Thalib', '085102864582', 'JL SETAMAN NO 28 RT./RW. Kel.Lowokwaru Kec.Lowokwaru-Kota Malang Jawa Timur 65141', 1, NULL, 'default.png'),
('19796', 'Aliefian Ramadhan', NULL, NULL, 'Islam', 'Januarika Lindasanti', '083841790128', 'sarimun no.13 RT.2/RW.2Dsn.beji Kel.- Kec.--- - 65326', 1, NULL, 'default.png'),
('19798', 'Aqshal Rizqullah', NULL, NULL, 'Islam', 'Soeharto', '082131105585', 'Jl Arjuna Kv Baru No 16 RT.9/RW.6Dsn.sisir Kel.Sisir Kec.Batu-Kota Batu Jawa Timur 65314', 1, 216, 'default.png'),
('19799', 'Ardhillah Habibi Alfath', NULL, NULL, 'Islam', 'Kusnul Huda', '085850283362', 'RT.21/RW.03Dsn.BAYANAN Kel.Ngantru Kec.Ngantang-Kabupaten Malang Jawa Timur', 1, 205, 'default.png'),
('19800', 'Ariq Artriska', NULL, NULL, 'Islam', 'Aris Fendy Nurdianto', '081249818822', 'JL. SAWAHAN ATAS NO.47 RT.02/RW.05 Kel.Beji Kec.Junrejo-Kota Batu Jawa Timur 65326', 1, NULL, 'default.png'),
('19801', 'Bagas Lintang Wicaksono', NULL, NULL, 'Islam', 'Sugeng Prayetno', '085233715737', 'RT.16/RW.06Dsn.RUKEM  Kel.Bayem Kec.Kasembon-Kabupaten Malang Jawa Timur 65393', 1, 222, 'default.png'),
('19802', 'Bagus Kurniawan Hafizh', NULL, NULL, 'Islam', 'Imam Wahyudi', '0895396099750', 'Jl. I R Rais RT.2/RW.3 Kel.Tanjungrejo Kec.Sukun-Kota Malang Jawa Timur 65147', 1, 219, 'default.png'),
('19803', 'Bintang Indi Nargari', NULL, NULL, 'Islam', 'Agus Jatmiko', '081232121071', 'banturejo no.1 RT.5/RW.2Dsn.banu Kel.Banturejo Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19804', 'Della Anggraeni', NULL, NULL, 'Islam', 'Ngatiran', '085733563557', 'dewi sartika no.24 RT.2/RW.9Dsn.temas Kel.Temas Kec.Batu-Kota Batu Jawa Timur', 1, NULL, 'default.png'),
('19805', 'Dida Wahyu Wirayoga', NULL, NULL, 'Islam', 'Sugeng Suryanto', '085609906980', 'S.SUPRIADI VIII NO.7 RT.13/RW.6 Kel.Sukun Kec.Sukun-Kota Malang Jawa Timur 65147', 1, 219, 'default.png'),
('19806', 'Didan Putra Surya', NULL, NULL, 'Islam', 'Maman Suryaman', '089606361879', 'Perum Sukun Pondok Indah No AA-05 RT.06/RW.07 Kel.Bandungrejosari Kec.Sukun-Kota Malang Jawa Timur 65148', 1, NULL, 'default.png'),
('19807', 'Diva Dwi Puspitasari', NULL, NULL, 'Islam', 'Sumardiono', '081232859706', 'RT.2/RW.4Dsn.sumbermangu Kel.Kedungpengaron Kec.Modo-Kabupaten Lamongan Jawa Timur 62275', 1, NULL, 'default.png'),
('19808', 'Farid Muhajir', NULL, NULL, 'Islam', 'Tono', '085337004008', 'Jl. Villa Puncak Tidar Blok F RT./RW. Kel.- Kec.Kepanjen-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19809', 'Felly Tri Ayunda Aisa', NULL, NULL, 'Islam', 'Sunardi', '08817055422', 'JL. LETJEN SUTOYO IV NO 22 RT.2/RW.5 Kel.Lowokwaru Kec.Lowokwaru-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19811', 'Gusti Aji Rizky Indarto', NULL, NULL, 'Islam', 'Endy Indarto', '085331180789', 'Jl. Basket No 2 RT.1/RW.3 Kel.Sisir Kec.Batu-Kota Batu Jawa Timur 65314', 1, NULL, 'default.png'),
('19812', 'Ian Alif Pratama', NULL, NULL, 'Islam', 'Slamet Santoso', '087859566581', 'JL. FLAMBOYAN GG II NO.6 RT.03/RW.06Dsn.TAMBUH Kel.Songgokerto Kec.Batu-Kota Batu Jawa Timur 65312', 1, NULL, 'default.png'),
('19813', 'Igo Geo Gigih Hio Ilhamulloh', NULL, NULL, 'Islam', 'Agus Mahmud Arifin', '08259374071', 'raya kasin RT.24/RW.8Dsn.kasin Kel.Ampeldento Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, 219, 'default.png'),
('19814', 'Jemita Satya Kiranti', NULL, NULL, 'Islam', 'Supriadi', '085815267000', 'WUKIR NO.47 RT.2/RW.3 Kel.Temas Kec.Batu-Kota Batu Jawa Timur 65315', 1, NULL, 'default.png'),
('19816', 'Kharisma Romadhon Eka Safitri', NULL, NULL, 'Islam', 'Supardianto', '085102462888', 'sumbersari I/5B RT.2/RW.1 Kel.Sumbersari Kec.Lowokwaru-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19818', 'Mahendra Pujo Prianto', NULL, NULL, 'Kristen', 'Bambang Puji Prianto', '081331220930', 'JL. KELUD NO. 34 RT.02/RW.11Dsn.BATU Kel.Sisir Kec.Batu-Kota Batu Jawa Timur 65314', 1, NULL, 'default.png'),
('19819', 'Muhammad Akbar Ilhamka', NULL, NULL, 'Islam', 'Bambang Wiyanto', '082257227223', 'JL. DESA BAYEM RT.06/RW.02Dsn.GILING Kel.Bayem Kec.Kasembon-Kabupaten Malang Jawa Timur 65393', 1, 222, 'default.png'),
('19820', 'Muhammad Andika Dayu Anglita Putra', NULL, NULL, 'Islam', 'Suwanto', '082124620190', 'MASJID RT.23/RW.6 Kel.Tegalgondo Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, 222, 'default.png'),
('19821', 'Novan Hadi Kurniawan', NULL, NULL, 'Islam', 'Usman Hadi', '085745136755', 'JL. PUCUNG NO.17 RT.12/RW.3Dsn.NGUJUNG Kel.Pandanrejo Kec.Bumiaji-Kota Batu Jawa Timur 65338', 1, NULL, 'default.png'),
('19823', 'Putra Alan Rosydi', NULL, NULL, 'Islam', 'Suparlan', '082302588339', 'Jl Bougenvil Bawah No 29 RT.1/RW.9 Kel.- Kec.--- - 65141', 1, NULL, 'default.png'),
('19824', 'Rachmad Nur Aditya', NULL, NULL, 'Islam', 'Moch. Sodiq', '087701407458', 'JL. ALUMUNIUM NO. 21C RT.05/RW.09 Kel.Purwantoro Kec.Blimbing-Kota Malang Jawa Timur 65122', 1, NULL, 'default.png'),
('19825', 'Rafif Pradyatma Surya Wahyudi', NULL, NULL, 'Islam', 'Sugeng Purwo Wahyudi', '081333915555', 'danau ranau XI G7G NO.7 RT.2/RW.15 Kel.Sawojajar Kec.Kedungkandang-Kota Malang Jawa Timur 65139', 1, NULL, 'default.png'),
('19826', 'Rahmad Nakula Zanuar', NULL, NULL, 'Islam', 'Suji Achmad I', '081217492267', 'JL. RAYA CANDI 2 NO 276 RT.5/RW.2Dsn.KLASEMAN Kel.Karang Besuki Kec.Sukun-Kota Malang Jawa Timur 65146', 1, 219, 'default.png'),
('19828', 'Risqullah Fani Fadhil Rifat', NULL, NULL, 'Islam', 'Totok Fariyanto', '082233965790', 'PERUM PURI INDAH G3 NO.7 RT.4/RW.12 Kel.Oro-Oro Ombo Kec.Batu-Kota Batu Jawa Timur', 1, 222, 'default.png'),
('19829', 'Robby Prawira Eka Pasha', NULL, NULL, 'Islam', 'Siti Malichah', '081228567169', 'SANTOSO NO.53 RT.3/RW.5 Kel.- Kec.--- - 65138', 1, NULL, 'default.png'),
('19830', 'Sevin Ariel Leonanda', NULL, NULL, 'Islam', 'Ari Rachmad Widodo', '089656618865', 'bandulan gg.5 no.740 RT.2/RW.3 Kel.Bandulan Kec.Sukun-Kota Malang Jawa Timur 65146', 1, NULL, 'default.png'),
('19831', 'Solichan', NULL, NULL, 'Islam', 'Purwadi', '087850172698', 'masjid RT.10/RW.3 Kel.- Kec.--- - 65158', 1, NULL, 'default.png'),
('19832', 'Sonia Putri Oktavia', NULL, NULL, 'Islam', 'Asenan', '081330242959', 'JL. AKASIA NO.4 RT.69/RW.10Dsn.kedung Kel.Giripurno Kec.Bumiaji-Kota Batu Jawa Timur 65333', 1, NULL, 'default.png'),
('19833', 'Suhardi Priyanata', NULL, NULL, 'Islam', 'Kasiono', '087859909139', 'JOYO RAHARJO GANG III NO.197 RT.3/RW.2 Kel.Merjosari Kec.Lowokwaru-Kota Malang Jawa Timur 65144', 1, NULL, 'default.png'),
('19834', 'Surya Azhar Kusuma Haris', NULL, NULL, 'Islam', 'Ilwan Indrata Haris', '082337026151', 'Jl Sekar Gadung No 27 RT.06/RW.01 Kel.Banjararum Kec.Singosari-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19835', 'Tegar Primantara', NULL, NULL, 'Islam', 'Suliyadi', '081267902717', 'JL. WIJAYA KUSUMA RT.32/RW.08 Kel.- Kec.--- -', 1, 205, 'default.png'),
('19836', 'Vaskho Mochammad Andilla', NULL, NULL, 'Islam', 'Afnan Fatoni', '085103289916', 'RT.10/RW.1Dsn.kagrengan Kel.Ngijo Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19837', 'Vera Kristina', NULL, NULL, 'Islam', 'Sutiono', '081280038571', 'raya pakan RT.2/RW.1Dsn.pakan Kel.Purworejo Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, 216, 'default.png'),
('19838', 'Wahyu Prima Yuda', NULL, NULL, 'Islam', 'Sukari', '085755898874', 'Jl. Gajahmada RT.5/RW.2 Kel.- Kec.--- - 65154', 1, NULL, 'default.png'),
('19839', 'Yogie Erlangga Putra', NULL, NULL, 'Islam', 'Sugiarjo', '085745205110', 'JL PULAU MAS  RT.04/RW.01Dsn.WR ANOM Kel.Kepuharjo Kec.Karangploso-Kabupaten Malang Jawa Timur', 1, 216, 'default.png'),
('19840', 'Yulia Vaiza Febriana', NULL, NULL, 'Islam', 'Eri Indrawan', '085232965434', 'singojoyo RT.2/RW.4Dsn.ngenep Kel.- Kec.--- -', 1, NULL, 'default.png'),
('19841', 'Yusinta Putri Febriana', NULL, NULL, 'Islam', 'Iwan Yoga Nugraha', '081212603937', 'Jl Pertamanan No 3 RT.11/RW.04Dsn.Kepuharjo Kel.Kepuharjo Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19842', 'Achmadi Gusrif Kandola', NULL, NULL, 'Islam', 'Arif Kandola', '082232720421', 'JL. CILIWUNG NO. 29 G RT./RW. Kel.Lewoleba Kec.Nubatukan-Kabupaten Lembata Nusa Tenggara Timur', 1, NULL, 'default.png'),
('19843', 'Aditiya Prasetiyo', NULL, NULL, 'Islam', 'Sumarto', '081246558535', 'Jl. Gunung Jati RT.21/RW.05 Kel.Pandanlandung Kec.Wagir-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19844', 'Agung Brahmastha Krisnha Jagad Satria', NULL, NULL, 'Islam', 'Suliyanton', '0082228975750', 'RAMBUTAN ATAS NO.19 RT.2/RW.1Dsn.SONGGORITI Kel.Songgokerto Kec.Batu-Kota Batu Jawa Timur 65312', 1, NULL, 'default.png'),
('19845', 'Ahmad Fashihudin', NULL, NULL, 'Islam', 'Musman', '08884067458', 'RT.24/RW.6Dsn.bendorejo Kel.Sumberagung Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19846', 'Ahmad Tegar Dwipa Yoga', NULL, NULL, 'Islam', 'Dwi Slamet Santoso', '081331724691', 'RT.01/RW.04 Kel.Semarang Kec.Banjarnegara-Kabupaten Banjarnegara Jawa Tengah', 1, NULL, 'default.png'),
('19847', 'Alexander Setya Pribadi', NULL, NULL, 'Islam', 'I.G.N Fajar Pribadi', '085932536397', 'terusan sigura-gura G no.163 RT.3/RW.4 Kel.Karang Besuki Kec.Sukun-Kota Malang Jawa Timur 65146', 1, NULL, 'default.png'),
('19848', 'Bielqies Phatherecia Shelvyne', NULL, NULL, 'Islam', 'Sufaat Bhastiawan', '087857491798', 'JL. JAKSA AGUNG SUPRAPTO 1B NO. 179 RT.10/RW.02 Kel.Samaan Kec.Klojen-Kota Malang Jawa Timur 65112', 1, NULL, 'default.png'),
('19851', 'Diovanda Reyhanandi Putra', NULL, NULL, 'Islam', 'Dariyanto', '083129705252', 'JL. JOYO AGUNG NO.1 RT.3/RW.7Dsn.GENTING  Kel.Merjosari Kec.Lowokwaru-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19853', 'Eka Aditya Firdaus', NULL, NULL, 'Islam', 'Muhammad Basuni', '085363941235', 'JL. TLOGOMAS GG 8A NO.32 RT.05/RW.05Dsn.TLOGOMAS Kel.Tlogomas Kec.Lowokwaru-Kota Malang Jawa Timur 65144', 1, NULL, 'default.png'),
('19854', 'Faisal Aditya', NULL, NULL, 'Islam', 'Jumadi', '085335745415', 'Jl. Rogoboyo RT.7/RW.2Dsn.Bunder Kel.Ampeldento Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19855', 'Febriyanti Naela Mahmudah', NULL, NULL, 'Islam', 'Djoko Sartono', '089638293300', 'JL. JOYO RAHARJO GG 1A RT.07/RW.02Dsn.JOYO Kel.Merjosari Kec.Lowokwaru-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19856', 'Friscillia Melani', NULL, NULL, 'Islam', 'Ispendi', '085607824758', 'JL. MERPATI NO.33 RT.04/RW.13Dsn.WONOREJO Kel.Tulungrejo Kec.Bumiaji-Kota Batu Jawa Timur 65336', 1, NULL, 'default.png'),
('19857', 'Gilang Septiano', NULL, NULL, 'Islam', 'Suparno', '085256553225', 'Jl Margo Basuki Gg VII No 4B RT.01/RW.01Dsn.Margomulyo Kel.- Kec.Tarakan Tengah-Kota Tarakan Kalimantan Utara', 1, NULL, 'default.png'),
('19859', 'Ifa Kurniasari', NULL, NULL, 'Islam', 'Siti Fahurul Abidah', '082245324344', 'zentana  RT.12/RW.4Dsn.mbunder Kel.Ampeldento Kec.Karangploso-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19860', 'Ilham Ardiansyah', NULL, NULL, 'Islam', 'Sugianto', '083155986811', 'JL. PANGAYOMAN RT.23/RW.05Dsn.SEBALUH Kel.Pandesari Kec.Pujon-Kabupaten Malang Jawa Timur 65391', 1, NULL, 'default.png'),
('19862', 'Jenni Presila', NULL, NULL, 'Islam', 'Suliono', '0341554383', 'RT.02/RW.06Dsn.MANGGISARI Kel.Bocek Kec.Karangploso-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19863', 'Maftuh Afandi', NULL, NULL, 'Islam', 'Muttaqin', '081456077695', 'RT./RW. Kel.- Kec.Widodaren-Kabupaten Ngawi Jawa Timur', 1, NULL, 'default.png'),
('19864', 'Mochamad Yanuar Karisma Yuda', NULL, NULL, 'Islam', 'Mochamad Effendi', '082334720063', 'Jl. Wukir No 40 RT.01/RW.02 Kel.Temas Kec.Batu-Kota Batu Jawa Timur 65315', 1, NULL, 'default.png'),
('19865', 'Muhammad Bashofi Sudirman', NULL, NULL, 'Islam', 'Andriansyah Qodir', '082251806561', 'Jl. Joyo Utomo No. 22 Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19866', 'Muhammad Shobirin Misbah', NULL, NULL, 'Islam', 'Syamsul Arifin', '085234547999', 'JL. PISANG AGUNG 1 NO. 12 RT.03/RW.05 Kel.Pisang Candi Kec.Sukun-Kota Malang Jawa Timur 65146', 1, NULL, 'default.png'),
('19868', 'Nia Oktavia', NULL, NULL, 'Islam', 'Triono', '082338120602', 'RT.06/RW.01Dsn.KENTENG Kel.Ngantru Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19869', 'Nuryatus Zahroh', NULL, NULL, 'Islam', 'Sumartono', '082132292494', 'PERUM VILA BUKIT TIDAR NO. A4/338 RT.6/RW.XI Kel.Merjosari Kec.Lowokwaru-Kota Malang Jawa Timur 65144', 1, NULL, 'default.png'),
('19871', 'Putri Wahyuningsih', NULL, NULL, 'Islam', 'Latiman', '085731839850', 'RT.18/RW.05Dsn.WONOREJO Kel.Pandansari Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19872', 'Radhiva Maulana', NULL, NULL, 'Islam', 'Santo', '085815820269', 'JL MERTOJOYO BLOK N NO 49 RT.06/RW.04Dsn.GANDUL Kel.Merjosari Kec.Lowokwaru-Kota Malang Jawa Timur 65144', 1, NULL, 'default.png'),
('19873', 'Rahadian Yuwananda A. S.', NULL, NULL, 'Islam', 'Iwan Suriyono', '085852903406', 'JL. SIMPANG MEGO MENDUNG NO.21 RT.04/RW.08 Kel.Pisang Candi Kec.Sukun-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19874', 'Raki Ammar Ismoko', NULL, NULL, 'Islam', 'Erdi Dewi Ismoko', '085620094811', 'Jl. Joyo Raharjo No 234 RT.4/RW.2 Kel.Merjosari Kec.Lowokwaru-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19875', 'Reno Iman Pratama', NULL, NULL, 'Islam', 'Mega Swasono', '089652930', 'Jl. Gajahmada No 22 RT.3/RW.9 Kel.Sisir Kec.Batu-Kota Batu Jawa Timur 65314', 1, NULL, 'default.png'),
('19877', 'Rizal  Nur Afandi', NULL, NULL, 'Islam', 'Nurpa I', '089638965678', 'JL BRAWIJAYA RT.13/RW.03 Kel.Tegalweru Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19878', 'Sahrul Kirom', NULL, NULL, 'Islam', 'Munari', '082230944193', 'JL. RAYA BLIMBING  05 SUMBERSUKO  RT.02/RW.01Dsn.KENONGO Kel.Sumbersuko Kec.Wagir-Kabupaten Malang Jawa Timur 65158', 1, NULL, 'default.png'),
('19879', 'Sandi Andika Akbarrulloh', NULL, NULL, 'Islam', 'Andik Nur Wahyudi', '082331780505', 'RT.27/RW.09Dsn.LEBO Kel.Madiredo Kec.Pujon-Kabupaten Malang Jawa Timur 65391', 1, NULL, 'default.png'),
('19880', 'Steven Geovino', NULL, NULL, 'Kristen', 'Antonius Hadi Mulyono', '008121683645', 'tirto taruna no.11 RT.12/RW.3 Kel.- Kec.--- - 65151', 1, NULL, 'default.png'),
('19881', 'Syahlan Hadi Nur Ichwan', NULL, NULL, 'Islam', 'Djuri', '085648648179', 'JL. KLAMPOK GUNUNG SARI  RT.02/RW.01Dsn.KLAMPOK Kel.Kucur Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19882', 'Syaifi Anwar Hidayatullah', NULL, NULL, 'Islam', 'Liartin Syaiffudin', '082332670000', 'JL. RAYA TLOGOMAS NO.38 RT.06/RW.05 Kel.Tlogomas Kec.Lowokwaru-Kota Malang Jawa Timur 65144', 1, NULL, 'default.png'),
('19883', 'Teggar Saputra', NULL, NULL, 'Islam', 'Siti Robikah', '081217925957', 'Jl. Raya Blimbing No.5 RT.9/RW.3 Dsn.Kenongo Kel.Sumbersuko Kec.Wagir-Kabupaten Malang Jawa Timur 65158', 1, NULL, 'default.png'),
('19884', 'Vera Anis Fitria', NULL, NULL, 'Islam', 'Suwadi', '085236989649', 'RT.13/RW.04Dsn.SAMBIREJO Kel.Pandansari Kec.Ngantang-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19885', 'Verlina Margaretha', NULL, NULL, 'Islam', 'Agus Hariono', '083834381344', 'JL.SUMPIL IA NO.50 RT.05/RW.04 Kel.Purwodadi Kec.Blimbing-Kota Malang Jawa Timur 65125', 1, NULL, 'default.png'),
('19886', 'Yoga Dafin Ferdiansyah', NULL, NULL, 'Islam', 'Sunyoto', '088805686419', 'TUMPANGREJO RT.8/RW.15 Kel.Ngenep Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19887', 'A As Mia Desfitria Sari', NULL, NULL, 'Islam', 'Sutaji', '0895613462861', 'ANYELIR RT.3/RW.2Dsn.KRAJAN Kel.Sumbersekar Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19888', 'Abdul Ghofur', NULL, NULL, 'Islam', 'Rudi Natali Hidayat', '081233350020', 'kaca piring no.75 RT.2/RW.3 Kel.- Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19889', 'Achmad Affandy', NULL, NULL, 'Islam', 'Imam Chambali', '0895619517356', 'JL. RAYA DAWUHAN TEGALGONDO NO.252 RT.16/RW.05Dsn.DAWUHAN Kel.Tegalgondo Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19890', 'Ady Ryan Yosafat', NULL, NULL, 'Kristen', 'Sugeng', '08990441679', 'JL ANYELIR NO 82 RT.02/RW.02Dsn.KRAJAN Kel.Sumbersekar Kec.Dau-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19891', 'Agathis Dammara Attariqi', NULL, NULL, 'Islam', 'Agung Triyono', '081339178636', 'JL KERTARAJASA GG X No. 146  RT.05/RW.04 Kel. Candi Renggo Kec. Singosari', 1, NULL, 'default.png'),
('19892', 'Ahmad Nasrukhan Andriansyah', NULL, NULL, 'Islam', 'Mistari', '085651497675', 'RT.10/RW.4Dsn.SENGON Kel.Dalisodo Kec.Wagir-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19893', 'Akhdan Hafish Sofyan', NULL, NULL, 'Islam', 'Yuda', '081339178684', 'sidomakmur no.30 RT.2/RW.5 Kel.Mulyoagung Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19894', 'Alexander Benyamin Dandra', NULL, NULL, 'Kristen', 'Yosias Dandra', '085792348384', 'JL  TRUNOJOYO II KAV F2 RT.04/RW.03Dsn.KRAJAN Kel.Songgokerto Kec.Batu-Kota Batu Jawa Timur 65312', 1, NULL, 'default.png'),
('19895', 'Alfino Radtya Amanullah', NULL, NULL, 'Islam', 'Andy Putranto', '085604621356', 'Puncak Permata Sengkaling No L-10 RT.01/RW.06 Kel.Sumbersekar Kec.Dau-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19896', 'Allaudin Bagus Satriaji', NULL, NULL, 'Islam', 'Chrisnadani', '087871928311', 'WILIS GANG 4 NO.14 RT.05/RW.08Dsn.SISIR Kel.Sisir Kec.Batu-Kota Batu Jawa Timur', 1, NULL, 'default.png'),
('19897', 'Anandia Shafina Salsabillah', NULL, NULL, 'Islam', 'Mariyah Puspita', '0895601293243', 'kanjuruhan gg,2a no.20 RT.2/RW.3Dsn.watugong Kel.- Kec.--- - 65144', 1, NULL, 'default.png'),
('19898', 'Anggina Rose', NULL, NULL, 'Islam', 'Suparman', '08997217767', 'JL RAYA TLOGOMAS GG 9 NO 42 RT.01/RW.07 Kel.Tlogomas Kec.Lowokwaru-Kota Malang Jawa Timur 65144', 1, NULL, 'default.png'),
('19899', 'Arya Putra Pratama', NULL, NULL, 'Islam', 'Kasdi', '085331476516', 'raya mulyorejo no.4 RT.1/RW.3 Kel.Mulyorejo Kec.Sukun-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19900', 'Asha Aurora Ninawa Mayantis', NULL, NULL, 'Islam', 'Anang Purbadi', '085648419632', 'JL. MASJID NO 10 B RT.7/RW.3Dsn.KAJANG Kel.Mojorejo Kec.Junrejo-Kota Batu Jawa Timur 65322', 1, NULL, 'default.png'),
('19901', 'Asnely Alvi Nurillah', NULL, NULL, 'Islam', 'Misdi', '089651567771', 'JL. KELENGKENG NO. 304 RT.3/RW.1Dsn.SEMANDING Kel.Sumbersekar Kec.Dau-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19902', 'Aulia Dina Rosyidah', NULL, NULL, 'Islam', 'Sulhak Akhyadi', '087859773312', 'JL. KAPI JANULA NO. 15 F / 17 RT.3/RW.14 Kel.Sekarpuro Kec.Pakis-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19903', 'Ayu Yulia Anggraeni', NULL, NULL, 'Islam', 'Suarnam', '085731935185', 'JL. DEWI SARTIKA NO 3B RT.6/RW.9Dsn.GENENGAN  Kel.Temas Kec.Batu-Kota Batu Jawa Timur 65315', 1, NULL, 'default.png'),
('19904', 'Azhar Zakaria', NULL, NULL, 'Islam', 'Agus Sulaiman Amin', '081333267075', 'M.T HARIONO NO.1152 RT.3/RW.5 Kel.Dinoyo Kec.Lowokwaru-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19905', 'Bachrul Ulum Ali Mahmud', NULL, NULL, 'Islam', 'Ahmat Nur Salim', '085336271177', 'Jl. Pisang Agung No 52 B RT./RW. Kel.- Kec.Klojen-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19906', 'Bawon Meilina', NULL, NULL, 'Islam', 'Mursid', '082232959866', 'hassanudin kedung giripurno no.9b RT.7/RW.10Dsn.kedung Kel.- Kec.Karangploso-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19907', 'Berlian Maharani Citra Dewi', NULL, NULL, 'Islam', 'Dadik', '082147572020', 'JL RAYA TLOGOMAS NO 108 RT.06/RW.05 Kel.Tlogomas Kec.Lowokwaru-Kota Malang Jawa Timur 65144', 1, NULL, 'default.png'),
('19908', 'Bimo Manggala Vira Sakti', NULL, NULL, 'Islam', 'Pangestu Istiawan', '082132874864', 'JL. RAYA NGIJO RT.02/RW.05Dsn.NGIJO Kel.Ngijo Kec.Karangploso-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19909', 'Bintang Putra Sadewa', NULL, NULL, 'Islam', 'Irwan', '0821322958016', 'JL MAKAM GG. 2 RT.3/RW.4Dsn.BEJI Kel.Beji Kec.Junrejo-Kota Batu Jawa Timur 46532', 1, NULL, 'default.png'),
('19911', 'Daffa Rizqi Septiansyah', NULL, NULL, 'Islam', 'Nurul Afida', '083850191759', 'Jl letjen Sutoyo III No 72G RT.05/RW.03 Kel.- Kec.--- - 65141', 1, NULL, 'default.png'),
('19912', 'Danang Alya Prakoso', NULL, NULL, 'Islam', 'Sumarlan', '085232526650', 'RT.4/RW.2Dsn.bayem Kel.Bayem Kec.Kasembon-Kabupaten Malang Jawa Timur 65393', 1, NULL, 'default.png'),
('19916', 'Dendy Krisdianto', NULL, NULL, 'Kristen', 'Kariyo Jatmiko', '082259310941', 'MOCH.JUKI NO.31 RT.4/RW.3 Kel.Tempurrejo Kec.Tempursari-Kabupaten Lumajang Jawa Timur', 1, NULL, 'default.png'),
('19918', 'Dhea Nur Aisyiah Efendi', NULL, NULL, 'Islam', 'Yunus Efendi', '081217214506', 'Jl Bandulan IV  RT.04/RW.05 Kel.Bandulan Kec.Sukun-Kota Malang Jawa Timur 65146', 1, NULL, 'default.png'),
('19919', 'Dian Permata Sari', NULL, NULL, 'Islam', 'Suliadi', '08154192138', 'Jl. Rawi Sari Supit Urang No 50 RT.03/RW.05 Kel.Mulyorejo Kec.Sukun-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19920', 'Diana Novita Sari', NULL, NULL, 'Islam', 'Tubi', '085852968992', 'JL. NUSA INDAH DUREK NO.16C RT.01/RW.01Dsn.DUREK Kel.Giripurno Kec.Bumiaji-Kota Batu Jawa Timur 65333', 1, NULL, 'default.png'),
('19921', 'Dicki Valentino', NULL, NULL, 'Islam', 'Andri Oktavianto', '0895366648954', 'TIRTO UTOMO GG IX NO.30A RT.2/RW.3Dsn.RAMBAAN Kel.Landungsari Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19922', 'Dio Febian Aditama', NULL, NULL, 'Islam', 'Rudi Yulianto', '08383385125', 'JL. TIRTO TARUNO NO. 50 RT.03/RW.07 Kel.Landungsari Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19923', 'Dita Via Pramesella', NULL, NULL, 'Islam', 'Moh. Arif', '083147668300', 'JL. MELATI NO 99 RT.1/RW.4Dsn.BANJAR Kel.Sumbersekar Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19924', 'Djaduex  Saka Nugraha', NULL, NULL, 'Islam', 'Joko Budi Raharjo', '081252689640', 'BALEAN BARAT NO.4 RT.02/RW.11 Kel.- Kec.--- -', 1, NULL, 'default.png'),
('19925', 'Dwi Fatiawati', NULL, NULL, 'Islam', 'Budi', '082142031384', 'JL. RAYA TOREJO  RT.6/RW.2Dsn.SELOREJO Malang Jawa Timur', 1, NULL, 'default.png'),
('19926', 'Dwiky Alfikriansyah', NULL, NULL, 'Islam', 'Teguh Sumarsono', '081252467044', 'dewi sartika gang 3 blok M no.9 RT.2/RW.10 Kel.Temas Kec.Batu-Kota Batu Jawa Timur', 1, NULL, 'default.png'),
('19927', 'Eka Bayu Kurniawan', NULL, NULL, 'Islam', 'Raharjo', '085707647633', 'JL. MERGOJOYO NO 79 RT.02/RW.02Dsn.JETIS Kel.Mulyoagung Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19929', 'Erly Tsamarah Difa', NULL, NULL, 'Islam', 'Yasarlan Faudi', '085331051109', 'IR.RAIS NO.11A RT.6/RW.2 Kel.Tanjungrejo Kec.Sukun-Kota Malang Jawa Timur 65147', 1, NULL, 'default.png'),
('19930', 'Fahri Misbahul Munir', NULL, NULL, 'Islam', 'Matsari', '088996995533', 'raya karang widoro RT.25/RW.3Dsn.ndoro Kel.Karangwidoro Kec.Dau-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19931', 'Fajar Wahyu Setiawan', NULL, NULL, 'Islam', 'Mulyono', '083190684495', 'raya tlogomas viii no.13 RT.5/RW.5 Kel.Tlogomas Kec.Lowokwaru-Kota Malang Jawa Timur 65144', 1, NULL, 'default.png'),
('19932', 'Fallah Adam Wardhana', NULL, NULL, 'Islam', 'Zainul Arifin', 'wa 081216285362', 'JL DIPONEGORO GG 2 NO 21 RT.02/RW.07Dsn.SISIR Kel.Sisir Kec.Batu-Kota Batu Jawa Timur', 1, NULL, 'default.png'),
('19933', 'Farah Mufidah', NULL, NULL, 'Islam', 'M. Machmudin', '089631772676', 'RT.02/RW.01Dsn.SUWALUHAN Kec.Karangploso-Kab Malang Jawa Timur', 1, NULL, 'default.png'),
('19934', 'Febiana Wulandari', NULL, NULL, 'Islam', 'Nari', '081235507748', 'JL ANYELIR RT.01/RW.02Dsn.KRAJAN Kel.Sumbersekar Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19935', 'Febriana Eka Alviandani', NULL, NULL, 'Islam', 'Sugianto', '085230250236', 'kenanga no.59 RT.1/RW.7Dsn.krajan Kel.Oro-Oro Ombo Kec.Batu-Kota Batu Jawa Timur', 1, NULL, 'default.png'),
('19936', 'Firman Syah Kurniawan', NULL, NULL, 'Islam', 'Kartubi', '082245099972', 'RT.28/RW.11Dsn.Tawang Kel.Tirtomarto Kec.Ampelgading-Kabupaten Malang Jawa Timur 65183', 1, NULL, 'default.png'),
('19937', 'Galih Kusuma Putra', NULL, NULL, 'Islam', 'Su[Arti', '082232547383', 'p.sudirman gg.4 no.4 RT./RW.Dsn.lesti Kel.- Kec.--- Jawa Timur 65311', 1, NULL, 'default.png'),
('19939', 'Hanif Zulfikri', NULL, NULL, 'Islam', 'Suoyno', '089651889747', 'RT.19/RW.5Dsn.leban Kel.Tawangargo Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19941', 'Hendra Wahyudi', NULL, NULL, 'Islam', 'Didik Purwanto', '085536821996', 'Jl. Arjuno No 05 RT.47/RW.7Dsn.SB Bendo Kel.Giripurno Kec.Bumiaji-Kota Batu Jawa Timur 65333', 1, NULL, 'default.png'),
('19942', 'Hening Augusty Mukafaah', NULL, NULL, 'Islam', 'Zainal Mustofa', '085691482197', 'mojomulyo no.87a RT.3/RW.1Dsn.kajang Kel.Mojorejo Kec.Junrejo-Kota Batu Jawa Timur 65322', 1, NULL, 'default.png'),
('19943', 'Johan Aditya Hadinata', NULL, NULL, 'Islam', 'Sutris', '081331507800', 'JL. SUMBER ARUM NO.86 RT.22/RW.05Dsn.JENGGLONG Kel.Tegalweru Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19944', 'Juvita Avianti', NULL, NULL, 'Islam', 'Rochim', '081231175366', 'pandawa no.8 RT.14/RW.3Dsn.maron Kel.Pendem Kec.Junrejo-Kota Batu Jawa Timur', 1, NULL, 'default.png'),
('19945', 'Kaisar Yulian Al Akbar', NULL, NULL, 'Islam', 'Agus Yulianto', '08563575849', 'JL. DIPONEGORO NO.64 RT.07/RW.01 Kel.Sisir Kec.Batu-Kota Batu Jawa Timur 65314', 1, NULL, 'default.png'),
('19946', 'Khana Putri Mega', NULL, NULL, 'Islam', 'Imam Faisol', '081231180464', 'JL. CANDI PANGGUNG BARAT NO.17 RT.03/RW.18 Kel.Mojolangu Kec.Lowokwaru-Kota Malang Jawa Timur 65142', 1, NULL, 'default.png'),
('19947', 'Khoirul Adi Pratama', NULL, NULL, 'Islam', 'Rubiatun', '081336985145', 'JL. TRUNOJOYO RT.06/RW.02Dsn.WATUKIDUL Kel.- Kec.--- - 65392', 1, NULL, 'default.png'),
('19949', 'Kurnia Nur Aisyah', NULL, NULL, 'Islam', 'Slamet Mulyono', '083832467852', 'Jl. Tirto Taruno  RT.4/RW.8 Kel.Landungsari Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19950', 'M. Dimas Ariya Pratama', NULL, NULL, 'Islam', 'Suwajar', '082229352674', 'JL. MAWAR  RT.04/RW.02Dsn.KRAJAN Kel.Sumbersekar Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19952', 'Meisya Afifa Rahma', NULL, NULL, 'Islam', 'Khotib', '089637875945', 'Jl. Atletik Tasikmadu Lowokwaru No 05 RT.01/RW.04 Dsn.Karangsuko Kel.Tasikmadu Kec.Lowokwaru-Kota Malang Jawa Timur 65143', 1, NULL, 'default.png'),
('19953', 'Miftahul Huda Nur Azis', NULL, NULL, 'Islam', 'Mohamad Nur Hidayat Huda Santosa', '081615227920', 'RT.25/RW.03Dsn.Ndoro Kel.Karangwidoro Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19954', 'Moch Arizal Fauzi', NULL, NULL, 'Islam', 'Sanimin', '0341554383', 'JL. KARANG AMPEL RT.15/RW.02Dsn.KARANG AMPEL Kel.Karangwidoro Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, 205, 'default.png'),
('19955', 'Muhammad Arya Fandi Fardana', NULL, NULL, 'Islam', 'Suliadi', '085102343062', 'woneso RT.6/RW.1 Kel.Gunungsari Kec.Bumiaji-Kota Batu Jawa Timur', 1, NULL, 'default.png'),
('19956', 'Muhammad Aditiya Ramadhan', NULL, NULL, 'Islam', 'Novi Dwi Lestari', '089516591363', 'JL. BANDULAN NO.VIII B  RT.1/RW.1Dsn.BANDULAN Kel.- Kec.--- - 65146', 1, NULL, 'default.png'),
('19957', 'Muhammad Alief Rahman Hakim', NULL, NULL, 'Islam', 'Tamaji', '083857802444', 'patmiura gg.8 no.1 RT.5/RW.7Dsn.temas Kel.Temas Kec.Batu-Kota Batu Jawa Timur 65315', 1, NULL, 'default.png'),
('19958', 'Muhammad Alif Jamaludin Baharsyah', NULL, NULL, 'Islam', 'Patria Yovananta', '081358088033', 'JL SUROPATI NO 26 RT.02/RW.07 PESANGGRAHAN  Kec.Batu-Kota Batu Jawa Timur 65313', 1, NULL, 'default.png'),
('19959', 'Muhammad Bagus Ferdiansyah', NULL, NULL, 'Islam', 'Sutiknu', '082331833028', 'Jl. Perjuangan RT.24/RW.08Dsn.Pagergunung Kel.Dadapan Kec.Wajak-Kabupaten Malang Jawa Timur 65173', 1, NULL, 'default.png'),
('19960', 'Muhammad Faiq Hidayatullah', NULL, NULL, 'Islam', 'Achmad Mashuri', '085816555676', 'JL. TLOGO INDAH NO 43 RT.02/RW.01 Kel.Tlogomas Kec.Lowokwaru-Kota Malang Jawa Timur 65144', 1, NULL, 'default.png'),
('19961', 'Muhammad Farhan Hamid', NULL, NULL, 'Islam', 'Muhammad Sholeh', '0895623475341', 'Tirto utomo no.7b Gg 1A RT.1/RW.2 Dsn.Rambaan Kel.Landungsari Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19962', 'Muhammad Nur Ramadhan Syah', NULL, NULL, 'Islam', 'Kuswari', '085812351338', 'JL. RA. KARTINI I NO.4A RT.05/RW.01Dsn.JUNWATU Kel.Junrejo Kec.Junrejo-Kota Batu Jawa Timur 65314', 1, NULL, 'default.png'),
('19963', 'Muhammad Rizki Zulfikar', NULL, NULL, 'Islam', 'Kuswanto', '081227017713', 'JL. BRIGJEND ABDUL MANAN WIJAYA RT.13/RW.01 Kel.- Kec.Pujon-Kabupaten Malang Jawa Timur 65391', 1, NULL, 'default.png'),
('19964', 'Nanda Dwiky Prayoga', NULL, NULL, 'Islam', 'Sukirno', '08135983570', 'Jl.Trunojoyo RT.3/RW.9Dsn.Rejoso Kel.Junrejo Kec.Junrejo-Kota Batu Jawa Timur', 1, NULL, 'default.png'),
('19965', 'Nazhima Fakhira Farhaz', NULL, NULL, 'Islam', 'Arif Rochman Hakim', '083848980938', 'CIPANAS DALAM NO.14 RT.8/RW.4 Kel.- Kec.--- - 65113', 1, NULL, 'default.png'),
('19966', 'Nicko Suhadi', NULL, NULL, 'Islam', 'Suhadi', '085798449103', 'RT.01/RW.08 Kel.Balerejo Kec.Wlingi-Kabupaten Blitar Jawa Timur', 1, NULL, 'default.png'),
('19967', 'Ninda Rosita Dewi', NULL, NULL, 'Islam', 'Saiful Fatoni', '085334985105', 'RT.11/RW.3Dsn.DONOMULYO Kel.Donomulyo Kec.Donomulyo-Kabupaten Malang Jawa Timur 65167', 1, NULL, 'default.png'),
('19969', 'Nur Ahmad Fajar', NULL, NULL, 'Islam', 'Sawito', '089680630668', 'JL NURHADI RT.04/RW.01Dsn.CANGAR Kel.Bulukerto Kec.Bumiaji-Kota Batu Jawa Timur 65334', 1, NULL, 'default.png'),
('19970', 'Putra Dwi Cahyadi', NULL, NULL, 'Islam', 'Rismita Ardian', '0855322050', 'TAMRIN NO.59 RT.4/RW.1Dsn.SEMANDING Kel.Sumbersekar Kec.Dau-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19971', 'Putri Novita Sari', NULL, NULL, 'Islam', 'Rodiin', '085835018654', 'RT.24/RW.05Dsn.BIYAN Kel.Sukomulyo Kec.Pujon-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19972', 'Putri Wahyu Oktaviani', NULL, NULL, 'Islam', 'Moh.Hadi', '085334422403', 'Jl Brawijaya RT.12/RW.3 Dsn.krajan Kel.Tegalweru Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19973', 'Raden Osa', NULL, NULL, 'Islam', 'Thoifin Muhammad', '082233326787', 'DR.SUTOMO NO.28 RT.7/RW.4Dsn.JUNREJO Kel.Junrejo Kec.Junrejo-Kota Batu Jawa Timur', 1, NULL, 'default.png'),
('19974', 'Rama Andika Priambada', NULL, NULL, 'Islam', 'Suswanto', '082332881991', 'TIRTO TARUNO NO.88A RT.3/RW.8Dsn.KLANDUNGAN Kel.Landungsari Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19975', 'Rayhan Hari Prasetyo', NULL, NULL, 'Islam', 'Teguh Hari Prasetyo', '082334259539', 'JL SIDOMAKMUR NO 44 RT.02/RW.03 Kel.Mulyoagung Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19976', 'Riza Adhani', NULL, NULL, 'Islam', 'Andrina Wijaya Ningsih', '089673466525', 'Jl. JA Suprapto  1A No 235 RT.9/RW.3Dsn.Celaket Kel.Samaan Kec.Klojen-Kota Malang Jawa Timur 65112', 1, NULL, 'default.png'),
('19977', 'Roby Zainul Abidin', NULL, NULL, 'Islam', 'Bismo Susilo', '081339178681', 'B.S.RIADI gg.4B NO.1 RT.12/RW.2 Kel.Oro Oro Dowo Kec.Klojen-Kota Malang Jawa Timur 65112', 1, NULL, 'default.png'),
('19978', 'Safa Bintang Nabiyan', NULL, NULL, 'Islam', 'Windra Satrio Pramono', '01234028745', 'PERUM CAKALANG INDAH 1 NO.286 J RT./RW. Kel.- Kec.--- -', 1, NULL, 'default.png'),
('19979', 'Salsa Nabila Marta', NULL, NULL, 'Islam', 'Samsul', '0895396060110', 'JL. GILIMANUK GG 2 NO. 6A RT.05/RW.12 Kel.Lowokwaru Kec.Lowokwaru-Kota Malang Jawa Timur 65141', 1, NULL, 'default.png'),
('19980', 'Selvita Aldina Putri', NULL, NULL, 'Islam', 'Khoirul Tajudin', '085102567037', 'Jl Margobasuki RT.6/RW.10Dsn.Jetis Kel.Mulyoagung Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19981', 'Shirojul Munir', NULL, NULL, 'Islam', 'Heru Matsari', '081234290710', 'Jl. Karang Widoro 02 RT.23/RW.3Dsn.ndoro Kel.Karangwidoro Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19982', 'Silfia Anggraeni', NULL, NULL, 'Islam', 'Sugianto', '08990359424', 'Jl/ Kh Yusuf Tasik Madu Lowokwaru RT.6/RW.5Dsn.Lowokwaru Kel.Tasikmadu Kec.Lowokwaru-Kota Malang Jawa Timur 65143', 1, NULL, 'default.png'),
('19983', 'Syalomiele Pratama Agustinus Susanto', NULL, NULL, 'Kristen', 'Hari Susanto', '081333422278', 'JL. KASIN JAYA GG 4 NO. 32 RT.11/RW.01 Kel.Tanjungrejo Kec.Sukun-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('19985', 'Teuqilla Arni Sugianto', NULL, NULL, 'Islam', 'Didik Sugianto', '085646584125', 'JL NITIHARJO RT.06/RW.03Dsn.TEGALSARI Kel.- Kec.--- -', 1, NULL, 'default.png'),
('19986', 'Yanuar Bayu Yudhantara', NULL, NULL, 'Islam', 'Heri Karyawanto', '081249307740', 'Jl. Anggrek No 3 RT.1/RW.1Dsn.Sempu Kel.Gadingkulon Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19987', 'Yefta Putra N', NULL, NULL, 'Kristen', 'Barkah Tri Wahyudi', '081549017508', 'JL. DIPONEGORO NO.133 RT.20/RW.05Dsn.NGAMBON Kel.Girimoyo Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('19988', 'Yoan Putra Adetya', NULL, NULL, 'Hindu', 'Suci Asti', '085785922209', 'JL. RAYA ARJUNA GG 22 NO.07 RT.04/RW.01Dsn.JUNGGO Kel.- Kec.--- - 65336', 1, NULL, 'default.png'),
('19989', 'Yoga Adi Pratama', NULL, NULL, 'Islam', 'Sunarto', '085746677489', 'RT.14/RW.3Dsn.ngramban Kel.Banturejo Kec.Ngantang-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19990', 'Zahwa Dewi Syahrani', NULL, NULL, 'Islam', 'Sumardi', '085888022652', 'BESTA NO.10 RT.1/RW.16Dsn.JUNGGO Kel.- Kec.--- - 65336', 1, NULL, 'default.png'),
('19991', 'Adinda Mutia Syahrani', NULL, NULL, 'Islam', 'Nardi', '0856488020', 'JL. KENAROK NO.7 RT.04/RW.01Dsn.KENTENG Kel.Ngantru Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('19992', 'Adinda Nova Eliza', NULL, NULL, 'Islam', 'M. Arifin', '085710552554', 'JL. MAWAR NO. 113 RT.4/RW.3Dsn.LANG LANG Kel.Langlang Kec.Singosari-Kabupaten Malang Jawa Timur 65153', 1, NULL, 'default.png'),
('19993', 'Adinda Zahra Safira Nisaa', NULL, NULL, 'Islam', 'Kristiawan Widyayudianto', '081805677834', 'JL. PERUMAHAN D WIGA B2 NO.9 RT.6/RW.17 Kel.Mojolangu Kec.Lowokwaru-Kota Malang Jawa Timur 65142', 1, NULL, 'default.png'),
('19994', 'Aisyah Ulandari', NULL, NULL, 'Islam', 'Sugiharto', '085791119667', 'RT.18/RW.4Dsn.BULUREJO Kel.Petung Sewu Kec.Dau-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('19996', 'Amelia Amanda Putri', NULL, NULL, 'Islam', 'Purnomo', '081249881090', 'kol.sugiono 7A NO.44 RT.6/RW.2 Kel.Mergosono Kec.Kedungkandang-Kota Malang Jawa Timur 65134', 1, NULL, 'default.png'),
('19997', 'Anggelya Mery Ningtyastuti', NULL, NULL, 'Islam', 'Rianto', '081252983750', 'RT.20/RW.03Dsn.PRINCI Kel.Gadingkulon Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('19998', 'Anjelina Lidia Ananda', NULL, NULL, 'Islam', 'Kevin Erik Irhani', '085103616872', 'JL. RAYA CANDI 3 NO.19 RT.02/RW.03 Kel.Karang Besuki Kec.Sukun-Kota Malang Jawa Timur 65146', 1, NULL, 'default.png'),
('19999', 'Ariska Rahayu Ningtias', NULL, NULL, 'Islam', 'Eko Wiyanto', '081246193681', 'TELAGA MADIREDO NO.001 B RT.37/RW.8Dsn.SIDODADI Kel.Madiredo Kec.Pujon-Kabupaten Malang Jawa Timur 65391', 1, NULL, 'default.png'),
('20000', 'Aryani Rizky Rahmalia Ivani', NULL, NULL, 'Islam', 'Suhersono', '085791292614', 'JL. ARJUNO NO.4 RT.41/RW.06Dsn.KRAJAN Kel.Giripurno Kec.Bumiaji-Kota Batu Jawa Timur 65333', 1, NULL, 'default.png'),
('20001', 'Aulia Jihan Salsabila', NULL, NULL, 'Islam', 'Wiyono', '0895366653428', 'JL, TLOGOMAS RT.01/RW.07 Kel.Tlogomas Kec.Lowokwaru-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('20002', 'Azizah Senja Mega Sari', NULL, NULL, 'Islam', 'Moch.Ngatemin', '081332176932', 'raya candi v no.397 RT.8/RW.5 Kel.Karang Besuki Kec.Sukun-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('20003', 'Daffa Nawwaf Nadirraihan', NULL, NULL, 'Islam', 'Subandi', '081252701966', 'JL. MT HARYONO XXI NO.09 RT.04/RW.06 Kel.Dinoyo Kec.Lowokwaru-Kota Malang Jawa Timur 65144', 1, NULL, 'default.png'),
('20004', 'Delva Ayu Riwanda', NULL, NULL, 'Islam', 'Wasis', '085235125925', 'AIR MANCUR RT.9/RW.2Dsn.JOMBOK Kel.Jombok Kec.Ngantang-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('20005', 'Devi Widia Putri', NULL, NULL, 'Islam', 'Rumiati', '0895395333195', 'SULTAN AGUNG NO.62 RT.4/RW.3Dsn.SUWUN Kel.- Kec.Wagir-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('20006', 'Diah Ayu Safitri', NULL, NULL, 'Islam', 'Sunariyono', '085607050163', 'MT.HARYONO GG.BRAWIJAYA I NO.44 RT.3/RW.5Dsn.TAWANGPAI Kel.Ketawanggede Kec.Lowokwaru-Kota Malang Jawa Timur 65145', 1, NULL, 'default.png'),
('20007', 'Dimas Dedi Septian', NULL, NULL, 'Islam', 'Ngamari', '085251181642', 'JL. RAYA BLIMBING NO.40 RT.01/RW.01Dsn.KENONGO Kel.Sumbersuko Kec.Wagir-Kabupaten Malang Jawa Timur 65158', 1, NULL, 'default.png'),
('20008', 'Dinda Ayu Patricia', NULL, NULL, 'Islam', 'Suwarno', '082140337949', 'inspol suwoto RT.2/RW.1Dsn.sidodadi Kel.Sidodadi Kec.Lawang-Kabupaten Malang Jawa Timur 65251', 1, NULL, 'default.png'),
('20010', 'Dwi Nur Aini', NULL, NULL, 'Islam', 'Ngateno', '0895621112388', 'JL. SANAN GG 5A RT./RW. Kel.- Kec.--- -', 1, NULL, 'default.png'),
('20011', 'Eki Sutatik Irianti', NULL, NULL, 'Islam', 'Sutatok', '082232456461', 'Jl. Kedung Banateng RT.5/RW.2 Kel.Kedungbanteng Kec.Sumbermanjing-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('20012', 'Eko Eriko Kusuma', NULL, NULL, 'Islam', 'Katma', '0341554383', 'CENDANA DADAPREJO NO 38 RT.01/RW.02Dsn.DADAP TULIS Kel.- Kec.--- - 65323', 1, NULL, 'default.png'),
('20013', 'Elen Agustin', NULL, NULL, 'Islam', 'Marwan', '083114310360', 'PENGAYOMAN NO 122 RT.17/RW.4Dsn.SEBALUH Kel.Pandesari Kec.Pujon-Kabupaten Malang Jawa Timur 65391', 1, NULL, 'default.png'),
('20014', 'Erlina Indah Safira', NULL, NULL, 'Islam', 'Susilo Joko Akbar', '082264893991', 'Jl Joyo Utomo No 24 RT.2/RW.4 Kel.- Kec.--- - 65144', 1, NULL, 'default.png'),
('20015', 'Feni Fatmasari', NULL, NULL, 'Islam', 'Wasis', '082335436290', 'RT.27/RW.4Dsn.LEBO Kel.Madiredo Kec.Pujon-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('20016', 'Fidiya Sri Astutik', NULL, NULL, 'Islam', 'Saturi', '085755449158', 'JL. NGROTO RT.10/RW.05Dsn.NGROTO Kel.Ngroto Kec.Pujon-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('20017', 'Finta Aulia Widianti', NULL, NULL, 'Islam', 'Luluk Yudianto', '085258732869', 'JL. TAMANGILANG RT.14/RW.05Dsn.TAMANGILANG Kel.Tamankuncaran Kec.Tirto Yudo-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('20018', 'Firdiah Agustina Sukmawati', NULL, NULL, 'Islam', 'Moch Safiin', '0895705432305', 'JL.BOWLING RT.02/RW.01Dsn.NJERUK Kel.Tasikmadu Kec.Lowokwaru-Kota Malang Jawa Timur 65143', 1, NULL, 'default.png'),
('20019', 'Fitri Dwi Pratiwi', NULL, NULL, 'Islam', 'Ngadi', '082314578153', 'JL. SELOKERTO RT.17/RW.06Dsn.SELOKERTO Kel.Selorejo Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('20020', 'Fitri Muaiminah', NULL, NULL, 'Islam', 'Sugito', '085102468258', 'Jl. Sumber Nyolo RT.6/RW.4Dsn.lang-lang Kel.Langlang Kec.Singosari-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('20021', 'Gadhing Kusumaning Dewy', NULL, NULL, 'Islam', 'Eksan Surani', '081906061227', 'RT.13/RW.2Dsn.Kenteng Kel.Ngantru Kec.Ngantang-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('20023', 'Icha Valia Rahma Desianti', NULL, NULL, 'Islam', 'Iswandi', '089541050426', 'JL. KENANGA NO.1 RT.04/RW.04Dsn.KRMLOKO Kel.Dadaprejo Kec.Junrejo-Kota Batu Jawa Timur 65323', 1, NULL, 'default.png'),
('20024', 'Ifadatul Ummah', NULL, NULL, 'Islam', 'Moh Fauzi', '087864976054', 'JL. ANGKASA NO.36 RT.01/RW.08Dsn.KRAJAN Kel.Watugede Kec.Singosari-Kabupaten Malang Jawa Timur 65153', 1, NULL, 'default.png'),
('20025', 'Ika Syafaroh', NULL, NULL, 'Islam', 'Achmad Karjani', '085731738079', 'JL. TLAGA AL-KAUSTAR NO 103 RT.5/RW.10Dsn.JETIS Kel.Mulyoagung Kec.Dau-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('20026', 'Ima Maulidah', NULL, NULL, 'Islam', 'Samsunan Rochim', '085735509057', 'kenanga indah no.31 RT.5/RW.6 Kel.Jatimulyo Kec.Lowokwaru-Kota Malang Jawa Timur 65141', 1, NULL, 'default.png'),
('20027', 'Indah Sutrianingsih', NULL, NULL, 'Islam', 'Ahmad Supii', '087888896481', 'MASJID  RT.15/RW.7Dsn.NGROTO Kel.Ngroto Kec.Pujon-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('20029', 'Isma Fitri Nuraini', NULL, NULL, 'Islam', 'Iswanto', '089647338052', 'Jl. Brawijaya RT.11/RW.3Dsn.Krajan Kel.Tegalweru Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('20031', 'Levia Pinky Leoni', NULL, NULL, 'Islam', 'Alfanu Rohman', '081336388339', 'JL PADANG RT.03/RW.01Dsn.KRAJAN Kel.Tegalweru Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('20032', 'Mariska Dwi Damayanti', NULL, NULL, 'Islam', 'Lasmini', '08817075713', 'JL. PATIMURA GG 3 NO.4 RT.02/RW.01Dsn.TEMAS Kel.Temas Kec.Batu-Kota Batu Jawa Timur 65315', 1, NULL, 'default.png'),
('20033', 'Martha Dinatha Avrilla Vanessa', NULL, NULL, 'Islam', 'Jumari', '0895397111672', 'JL. KANJURUHAN GG 1 NO.5 RT.01/RW.03Dsn.WATUGONG Kel.- Kec.--- - 65144', 1, NULL, 'default.png'),
('20034', 'Meidensha Kurnia Fernanda', NULL, NULL, 'Islam', 'Abdreas Supriono', '08852692881', 'banturejo RT.9/RW.2Dsn.banu Kel.Banturejo Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('20035', 'Nabila Ardistyasari', NULL, NULL, 'Islam', 'Rudi Setyo Santoso', '087851314437', 'JL. BRIGJEN SLAMET RIADI GANG 4B NO 13 RT.9/RW.2Dsn.ORO ORO DOWO Kel.Oro Oro Dowo Kec.Klojen-Kota Malang Jawa Timur 65112', 1, NULL, 'default.png'),
('20036', 'Ning Anida', NULL, NULL, 'Islam', 'Samat', '082232455502', 'JL. BLIMBING NO 5 RT.3/RW.1Dsn.KENANGA Kel.Sumbersuko Kec.Wagir-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('20037', 'Nouval Ahmad Arhan', NULL, NULL, 'Islam', 'H. Purnomo Sidi', '081233654073', 'JL. KEDAWUNG NO.12 RT.03/RW.05Dsn.TULES REJO Kel.- Kec.--- -', 1, NULL, 'default.png'),
('20038', 'Nova Nur Aisyah', NULL, NULL, 'Islam', 'Jumadi', '085749371655', 'RT.5/RW.8Dsn.mbaron Kel.Sukoanyar Kec.Pakis-Kabupaten Malang Jawa Timur 65154', 1, NULL, 'default.png'),
('20039', 'Pravangasta Sulihyang Levi Helda Valing Hyen', NULL, NULL, 'Islam', 'Kasuwan', '085732640168', 'JL SARIMUN 99 PUNDEN NO 49 RT.4/RW.1Dsn.BEJI Kel.Beji Kec.Junrejo-Kota Batu Jawa Timur 65326', 1, NULL, 'default.png'),
('20040', 'Putri', NULL, NULL, 'Islam', 'Sutomo', '085732986349', 'raya langlang RT.5/RW.3Dsn.langlang Kel.- Kec.--- - 65153', 1, NULL, 'default.png'),
('20041', 'Putri Agustina Rahayu', NULL, NULL, 'Islam', 'Sulhan', '082139171446', 'JL. SRI GADING RT.09/RW.02Dsn.KRAJAN  Kel.Gadingkulon Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('20042', 'Putri Auliasari', NULL, NULL, 'Islam', 'Sukadi', '081259667719', 'anggrek  RT./RW. Kel.Donowarih Kec.Karangploso-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('20043', 'Putri Aurelia Munika', NULL, NULL, 'Islam', 'Adhi Munika', '081217450157', 'JL MULYODADI NO 46 RT.03/RW.01Dsn.JETAK Kel.Mulyoagung Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('20045', 'Quiesha Amalia', NULL, NULL, 'Islam', 'Mukhlas Rowi', '081515811183', 'Jl. PErtamanan IV RT.16/RW.06Dsn.Kepuh Kel.Kepuharjo Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('20047', 'Ranita', NULL, NULL, 'Islam', 'Witgianto', '085606447926', 'JL. SIGURA GURA BARAT NO. 22 RT.03/RW.08 Kel.- Kec.--- - 65146', 1, NULL, 'default.png'),
('20048', 'Ria Adelia', NULL, NULL, 'Islam', 'Supeno', '085733915703', 'JL. SUDIRMAN RT.23/RW.5Dsn.TORONG Kel.Ngabab Kec.Pujon-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('20049', 'Riska Dwi Hafifa', NULL, NULL, 'Islam', 'Riko Is Hariyanto', '085830704022', 'KENDALSARI NO.49 RT.5/RW.10 Kel.Tulusrejo Kec.Lowokwaru-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('20051', 'Sasnanita Bintang V', NULL, NULL, 'Islam', 'Slamet Pujiono', '081249190196', 'Jl. Melati  RT.5/RW.3Dsn.Kalpataru Kel.Gunungsari Kec.Bumiaji-Kota Batu Jawa Timur 65337', 1, NULL, 'default.png'),
('20052', 'Sherlina Wayu Astutik', NULL, NULL, 'Islam', 'Slamet Sugiarto', '008123216076', 'KOLONEL SUGIONO vV NO.35 RT.13/RW.3 Kel.Mergosono Kec.Kedungkandang-Kota Malang Jawa Timur 65134', 1, NULL, 'default.png'),
('20053', 'Shesi Putri Prameswari', NULL, NULL, 'Islam', 'Agus Jaenal Abidin', '085733642562', 'Jl. Bunga Kumis Kucing No. 17 Rt. 4 Rw. 3 Tembalangan Lowokwaru Kota Malang', 1, NULL, 'default.png'),
('20054', 'Silvina Febiyanti', NULL, NULL, 'Islam', 'Suliono', '089630150539', 'TIRTO JOYO GENTING NO.3 RT.3/RW.7Dsn.GENTING Kel.Merjosari Kec.Lowokwaru-Kota Malang Jawa Timur 65144', 1, NULL, 'default.png'),
('20055', 'Siti Komariah', NULL, NULL, 'Islam', 'Solihin', '0341554383', 'margojoyo RT./RW. Kel.Mulyoagung Kec.Dau-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('20056', 'Syifa Alifianti Andariesta', NULL, NULL, 'Islam', 'Andar Pribadi', '085895984959', 'RT.02/RW.01Dsn.SROMO Kel.Banturejo Kec.Ngantang-Kabupaten Malang Jawa Timur 65392', 1, NULL, 'default.png'),
('20057', 'Tri Dwi Eliga', NULL, NULL, 'Islam', 'Trimo', '085730912813', 'JL. NOTOJOYO RT.02/RW.01Dsn.GONDANG Kel.Tegalgondo Kec.Karangploso-Kabupaten Malang Jawa Timur 65152', 1, NULL, 'default.png'),
('20058', 'Tsani Isma Sifana', NULL, NULL, 'Islam', 'Imam Ghozali', '085748844732', 'JL. MASJID RT.19/RW.03 Kel.Tawangsari Kec.Pujon-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('20059', 'Tsaniatun Nabila', NULL, NULL, 'Islam', 'Hariono', '085232708983', 'RT.1/RW.3Dsn.Dadapan wetan Kel.Bendosari Kec.Pujon-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('20060', 'Wahyu Eka Lestari', NULL, NULL, 'Islam', 'Slamet Rianto', '081233478942', 'JL. TRUNOJOYO NO 15 RT.3/RW.9Dsn.REJOSO Kel.Junrejo Kec.Junrejo-Kota Batu Jawa Timur', 1, NULL, 'default.png'),
('20061', 'Wiji Lestari', NULL, NULL, 'Islam', 'Agus Riyanto', '082334070133', 'SAMAN RT.6/RW.2Dsn.KRAJAN Kel.Tegalweru Kec.Dau-Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('20062', 'Winda Cindi Nurliyanto', NULL, NULL, 'Islam', 'Jumaiyah', '089504144383', 'JL. MARSI RT.1/RW.2 Kel.- Kec.Selakau-Kabupaten Sambas Kalimantan Barat', 1, NULL, 'default.png'),
('20063', 'Yuliati', NULL, NULL, 'Islam', 'Sutrisno', '081338734856', 'terusan kembang turi no.53 RT.4/RW.4Dsn.magetan Kel.Jatimulyo Kec.Lowokwaru-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('20064', 'Zulkaisa Ngaris Pramudita', NULL, NULL, 'Islam', 'Ngarijo', '081225483532', 'JL. SEMANGGI BARAT NO.37 RT.01/RW.03Dsn.MANGU Kel.Jatimulyo Kec.Lowokwaru-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('20065', 'Ahmat Rojikin', NULL, NULL, 'Islam', 'Ngaseri', '012345678910', 'RT.19/RW.08Dsn.TEMUREJO Kel.Wonoagung Kec.Kasembon-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('20066', 'Aldo Rizal Bagir Mahdi', NULL, NULL, 'Islam', 'Maskuri', '0341588249', 'Jl Bendungan Sutami IA No 50 RT.01/RW.02 Kel.Sumbersari Kec.Lowokwaru-Kota Malang Jawa Timur 65145', 1, NULL, 'default.png'),
('20067', 'Angga Satria Ardiansyah', NULL, NULL, 'Islam', 'Jumadi', '089682134231', 'JL MULYODADI NO 75 RT.01/RW.01Dsn.JETAK Kel.- Kec.--- - 65151', 1, NULL, 'default.png'),
('20068', 'Ismawanto', NULL, NULL, 'Islam', 'Suyatmoko Sugiyanto', '085655898848', 'RT.02/RW.04Dsn.TEMPEL Kel.Kedungmunggal Kec.Pungging-Kabupaten Mojokerto Jawa Timur 61384', 1, NULL, 'default.png'),
('20069', 'Jasmine Ayu Qumalya Putri', NULL, NULL, 'Islam', 'Yudhistiro Suryo Nugroho', '085330837117', 'MT.HARYONO GG.XIV NO.1183A RT.2/RW.5 Kel.Dinoyo Kec.Lowokwaru-Kota Malang Jawa Timur 65144', 1, NULL, 'default.png'),
('20070', 'Muhamad Firdaus', NULL, NULL, 'Islam', 'Hartono', '081803806106', 'JL. CEMPAKA PUTIH DALAM NO.5A RT.02/RW.12 Kel.Lowokwaru Kec.Lowokwaru-Kota Malang Jawa Timur', 1, NULL, 'default.png'),
('20071', 'Muhammad Enrico Dwi Putra Perdana', NULL, NULL, 'Islam', 'Firman Perdana', '081336547647', 'JOYOLAND NO. A11 RT./RW. Kel.Merjosari Kec.Lowokwaru-Kota Malang Jawa Timur 65146', 1, NULL, 'default.png'),
('20072', 'Naito Yuuki', NULL, NULL, 'Islam', 'Shinji Naito', '081338655237', 'JL. SARIMUN NO. 53 RT.03/RW.01Dsn.BEJI Kel.- Kec.Junrejo-Kota Batu Jawa Timur', 1, NULL, 'default.png'),
('20073', 'Rahmat Hadi', NULL, NULL, 'Islam', 'Suyati', '081554814804', 'JL. JOYO SUKO RT.1/RW.12Dsn.SUKO Kel.Merjosari Kec.Lowokwaru-Kota Malang Jawa Timur 65144', 1, NULL, 'default.png'),
('20074', 'Rangga Elang Mustika Prabowo', NULL, NULL, 'Islam', 'Yuda Agung Prabowo', '085334919778', 'JL. PERUM PONDOK MUTIARA ASRI/D NO.9 RT.34/RW.07 Kel.Pandanlandung Kec.Wagir-Kabupaten Malang Jawa Timur', 1, NULL, 'default.png'),
('20075', 'Tafania Ad Ha Safarah', NULL, NULL, 'Islam', 'Rianto', '085230615372', 'Dsn. Krajan Des. Selorejo Kec. Dau Rt : 3 Rw : 1 Kab. Malang', 1, NULL, 'default.png'),
('20076', 'Titik Yulita Sari', NULL, NULL, 'Islam', 'Warno Feriyanto', '081805110681', 'JL. JOYO MULYO NO.332 AO RT.01/RW.03 Kel.Merjosari Kec.Lowokwaru-Kota Malang Jawa Timur 65144', 1, NULL, 'default.png'),
('20077', 'Dea Aulia Rachma', NULL, NULL, 'Islam', 'MUCH. MUCHLIS', '087888707304', 'JL. KH.AHMAD DAHLAN GG I NO.494 RT.4/RW.2 Kel.Sukoharjo- Kec.Klojen Kota Malang -Jawa Timur', 1, NULL, 'default.png'),
('20078', 'Alvian Adi Purnama', NULL, NULL, 'Islam', 'Nomo', '085232623385', 'JL. IMAM SUJONO N. 44A RT.2/RW.4 Dusun SEDUDUT Kel.Mulyorejo Kec.Sukun - Kota Malang Jawa Timur 65147', 1, NULL, 'default.png');
INSERT INTO `ms_siswa` (`nis_siswa`, `nama_siswa`, `tgl_lahir_siswa`, `jenis_kelamin_siswa`, `agama_siswa`, `nama_ortu`, `telp_ortu`, `alamat_siswa`, `id_kelas`, `id_tempat_prakerin`, `img_siswa`) VALUES
('20079', 'Aditia Eko Prasetyo', NULL, NULL, 'Islam', 'SUDIRJO YUWONO', '081217206391', 'KENANGAN KELIAN RT.3/RW.2 Kel.BULUKERTO Kec.BUMIAJI - Kota Batu Jawa Timur 65334', 1, NULL, 'default.png'),
('20080', 'Felix Vannial Ramadhan Fiari', NULL, NULL, 'Islam', 'SUBAKRI_x000D_', '085755940683', 'JL. TIRTO UTOMO GG.4 NO.10 RT.2/RW.2 Kel.Landungssari Kec.Dau - Kabupaten Malang Jawa Timur 65151', 1, NULL, 'default.png'),
('20081', 'Salsabilla Zahrani Purnama', NULL, NULL, 'Islam', 'YUDI PURNOMO', '082230474923', 'DOLI UTARA NO.22 RT.8/RW.3 Kel.Tanjungrejo Kec.Sukun-Kota Malang Jawa Timur 65147', 1, NULL, 'default.png'),
('20084', 'Raihan Almer Maulana', NULL, NULL, 'Islam', 'EDDY KURNIA', '081216824852', 'JL. LETJEN SUTOYO III NO. 36 RT.2/RW.3 Kel.Lowokwaru Kec.Lowokwaru-Kota Malang Jawa Timur  65141', 1, NULL, 'default.png'),
('20085', 'Farhad Ehla Muzaki', NULL, NULL, 'Islam', 'Eko Noto Santoso', '082230918380', 'Buyut Tarisah RT.7/RW.20 Dsn Kasin Kel. Ampeldento Kec. Karangploso-Kab Malang Jawa Timur 65125', 1, NULL, 'default.png');

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
(1, 2019, 2020),
(2, 2020, 2021);

-- --------------------------------------------------------

--
-- Table structure for table `ms_tempat_prakerin`
--

CREATE TABLE `ms_tempat_prakerin` (
  `id_tempat_prakerin` int(11) NOT NULL,
  `detail_tempat` varchar(100) NOT NULL,
  `alamat_tempat` text NOT NULL,
  `telp_kantor` varchar(18) DEFAULT NULL,
  `email_kantor` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ms_tempat_prakerin`
--

INSERT INTO `ms_tempat_prakerin` (`id_tempat_prakerin`, `detail_tempat`, `alamat_tempat`, `telp_kantor`, `email_kantor`) VALUES
(1, 'BENGKEL MOBIL SOLEH', 'Torongrejo Krajan Junrejo Batu', '0341-511619', NULL),
(2, 'Bengkel Supri', 'Raya Beji No 87', '08123223578', NULL),
(3, 'PT. MITRA SEHATI MAJU BERSAMA', 'Kawasan Industri Candi Blok 20 No 1A Semarang', '02476175852', NULL),
(4, 'PT. NUSANTARANTAMA MULTI MEDIA', 'Jl. Bunga Andong Selatan Kav. 12 Malang', '0341 402055', NULL),
(5, 'SMK PGRI 3 MALANG', 'Jl. Tlogomas IX No 29 Malang', '0', NULL),
(6, 'SURYA KENCANA', 'Jl. Candi Panggung Kota Malang', '081235727779', NULL),
(7, 'Transmart MX', 'Jl. Veteran Malang', '-', NULL),
(8, 'AHASS TONGAN MALANG', 'Jl. Ade Irma Suryani', '0341-325220', NULL),
(9, 'ALFAMART GEMEKAN MOJOKERTO', 'Jl. Raya Brangkal MOJOKERTO', '-', NULL),
(10, 'ALFAMART JATILANGKUNG MOJOKERTO', 'Jl Raya Pacet KM 3 RT :01 RW :01 Pungging MOJOKERTO', '081294670767', NULL),
(11, 'ALFAMART KEBON WARIS PASURUAN', 'jl.kebon waris Pasuruan RT.0 RW.0', '-', NULL),
(12, 'ALFAMART KEPULUNGAN PASURUAN', 'jln.surabaya malang', '-', NULL),
(13, 'ALFAMART LOSARI MOJOKERTO', ' losari mojokerto', '-', NULL),
(14, 'ALFAMART MONA SUWAYUWO PASURUAN', 'jl raya suwayuwo perum candra kartika. PASURUAN', '-', NULL),
(15, 'ALFAMART NGROWO MOJOKERTO', 'Jl. Raya Ngrowo kec. Bangsal Bangsal MOJOKERTO', '-', NULL),
(16, 'ALFAMART TAMAN SAFARI BARU', 'Dusun Palang Sukorejo RT.01 RW.01 ', '-', NULL),
(17, 'ASCO DAIHATSU JEMBER', 'JL. HAYAM WURUK JEMBER', '0331-428665', NULL),
(18, 'AUTO 2000 PECINDILAN SURABAYA', 'Surabaya', '-', NULL),
(19, 'BAMBANG DJAJA MOJOKERTO', 'Ngoro Industri Park Block C 1-2 Ngoro Mojokerto', '0', NULL),
(20, 'BE IMAGE CINEMA', 'Perum Asabri Bumiayu Indah Blok C3 Malang', '087859796889', NULL),
(21, 'BENGKEL BOROBUDUR', 'Jl. Borobudur Malang', '0341-7468000', NULL),
(22, 'BENGKEL BUDI SERVICE', 'Jl. Kedoya Barat 16', '0818388431', NULL),
(23, 'Bengkel Feri', 'Jl. Kalisongo Malang', '-', NULL),
(24, 'bengkel hadi', 'Jl. WR Supratman No 58 Batu', '08125254540', NULL),
(25, 'BENGKEL RAPI', 'Jl. Maijen Panjaitan 14 C Malang', '0341-552285', NULL),
(26, 'Bengkel Tomo', 'Jl Bend. Sutami 49', '0818389266', NULL),
(27, 'Bintang Jaya Listrik', 'Jl. Sartono SH No 6', '0341-367903', NULL),
(28, 'CENTRA KOMPUTER GALUNGGUNG', 'Jl. Galunggung Malang', '085855955530', NULL),
(29, 'CV TATA MITRA SENTOSA', 'Jl. Sigura-gura 35 Malang', '0341578420', NULL),
(30, 'CV. GARUDA MUDA', 'Jl. Danar Jonge H4 E42 RT. 5/10 Sawojajar', '-', NULL),
(31, 'CV. INDONESIA ONLINE', 'Jl. Flamboyan No 45B', '-', NULL),
(32, 'CV. MEDIA UTAMA', 'Jln. Sigura-Gura', '0341-559736', NULL),
(33, 'CV. MULTI MEDIA PRATAMA', 'Jl. Bendungan Sagulingt No. 06 Malang', '0341-552497', NULL),
(34, 'CV. SARI MUTIARA ABADI', 'Dsn. Krajan, Srigading Lawang Malang', '-', NULL),
(35, 'Dako Brand & Comunication', 'Jl. Dako Malang', '-', NULL),
(36, 'Deka Hotel Surabaya', 'HR. Muhammad No. 24, Surabaya', '081331981380', NULL),
(37, 'delta prima', 'Jl. Pisang Kipas', '-', NULL),
(38, 'HAWAI WATERPARK', 'Jl. Graha Kencana Utara V, Karanglo, Banjararum, Kec. Singosari, Malang, Jawa Timur 65153', '(0341) 4351797', NULL),
(39, 'HEASOFT INDONESIA', 'Ruko Mergan Kelurahan Jl Terusan Mergan Raya 1 Tanjung Rejo Sukun Malang', '-', NULL),
(40, 'HEIMA (SUBBING TITLE)', 'Bukit Cemara Tidar Block L3 No 25-26 Karang Besuki Sukun Malang', '081298109990', NULL),
(41, 'HOTEL ARIA GAJAYANA', 'Jl. Kawi No 24, Malang', '085258774333', NULL),
(42, 'HOTEL CIPTANINGATI', 'Jl. Argopuro No.154 Batu', '081555459845', NULL),
(43, 'HOTEL SWISS-BELINN MALANG', 'Jl. Veteran No.8A, Penanggungan, Klojen, Kota Malang', '-', NULL),
(44, 'IMARKS', 'IMARKS : RUKO SOEHAT INDAH B.4', '-', NULL),
(45, 'INOT PRODUCTION', 'Jln. Batujajar 24 Malang', '03419393366', NULL),
(46, 'JAMBU LUWUK HOTEL', 'BATU', '-', NULL),
(47, 'JANTRA BALI', 'Jl. Gunung Galunggung No. 168C', '-', NULL),
(48, 'JANTRA JOGJAKARTA', 'JL. DAMAI 168 NGUDAL SARI HARJO, NGAGLIK, SLEMAN', '-', NULL),
(49, 'Jantra Malang', 'Jl. Ki Ageng Gribig Malang', '-', NULL),
(50, 'JANTRA SEMARANG', 'JL. KEDUNG MUNDU RAYA SENDANGGUWO, TEMBALANG, KEDUNGMUNDU NO. 47 SEMARANG', '02476411269', NULL),
(51, 'JANTRA SOLO', 'SOLO', '-', NULL),
(52, 'LAS Damai', 'Jl. Sarimun Gg III No. 344 RT. 03 RW.02 Kec. Junrejo Kota Batu', '0341-595748', NULL),
(53, 'MAJESTY', 'Jl. Brigjen Slamet Riadi 44 Malang', '0341-369800', NULL),
(54, 'MAXZFOOD', 'KARANG BESUKI SUKUN MALANG', '03415082875', NULL),
(55, 'MOCCA ANIMATION', 'Jl. Maninjau Raya No. 19', '085749696020', NULL),
(56, 'POLYTRON SURABAYA - KAPAS KRAMPUNG', 'SURABAYA', '-', NULL),
(57, 'PPPPTK Pendem', 'Jl. Arhanud Ds. Junrejo Pendem Kota Batu', '081-333633311', NULL),
(58, 'PT DHARMA POLIPLAST', 'Jl. Meranti 1 Blok LI-10 Delta Silicon I Cikarang, Bekasi', '021 89909898', NULL),
(59, 'PT ISTANA MOBIL RODA MAS BANYUWANGI', 'Jl. Raya Rogojampi - pakistaji Banyuwangi', '0333 417888', NULL),
(60, 'PT ISTANA MOBIL RODA MAS jember', 'Jl. Hayam Wuruk No 187-189 Jember 68136', '1331-421888', NULL),
(61, 'PT. ADI PUTRO WIRASEJATI', 'Jl. Bale Arjosari 35 Malang', '087859072494', NULL),
(62, 'PT. AGUNG HIDRAULICH MACHINERY', 'Jl. Raya Pendem 50 Junrejo Batu', '0341463225', NULL),
(63, 'PT. ANGLER BIO CHEMLAB', 'Jl. Raya Sawo No. 17-19, Kel. Bridgin, Kec. Sambikerep Surabaya', '-', NULL),
(64, 'PT. Arthawena Gemilang (Otomotif)', 'Jl. Kertanegara 45 Karangploso Malang', '0341-468500', NULL),
(65, 'PT. Arthawenasakti Gemilang', 'Jl. Kertanegara 45 Karangploso Malang', '0341-468500', NULL),
(66, 'PT. ASIA PROTENDO GRAHA BOYOLALI SOLO', 'Jl. Raya Solo Boyolali Km 147 Jawa tengah', '0271-780150', NULL),
(67, 'PT. ASTRA INTERNASIONAL, TBK. (DAIHATSU MALANG)', 'Jl. Ahmad Yani No 175 Malang', '085100711700', NULL),
(68, 'PT. DEPO GLOBAL INDONESIA', 'MALANG', '-', NULL),
(69, 'PT. INDO JAYA MOTOR', 'Jl. LA Adi Sucipto - Sleman Yogyakarta', '0274-487982', NULL),
(70, 'PT. INDO SENTOSA TRADA INDOMOBIL (NISSAN JEMBER)', 'JL. HAYAM WURUK NO 181-183 MANGLI, KALIWATES JEMBER', '0331-412828', NULL),
(71, 'PT. INDONESIA PRECISION PART', 'Kawasan Industri Candi B3 No 9 Semarang', '0247617891', NULL),
(72, 'PT. INDONESIAN MARINE', 'Jl. Raya Ardimulya 2 Singosari', '0341-458952', NULL),
(73, 'PT. INTI KARYA TEKNIK', 'Jl. Batu Bara 32 Malang', '0341-491144', NULL),
(74, 'PT. KEDIRI GLOBAL MEDIATAMA (KS TV)', 'Jl. Ruko Hayam Wuruk Trade Center F-4/F-5 Kediri', '(0354 682888)', NULL),
(75, 'PT. KOPESERA ENGINEERING', 'Jl. Jembawan 4B/21 Sawojajar 2 Malang', '0341-720654', NULL),
(76, 'PT. LG ELECTRONICS INDONESIA SC JEMBER', 'Jl. Gajah Mada No 74 - Jember', '0331-320462', NULL),
(77, 'PT. LG ELECTRONICS INDONESIA SC KEDIRI', 'Jl. Balowerti Gang I No 15 ', '0354683162', NULL),
(78, 'PT. LG ELECTRONICS INDONESIA SC MALANG', 'Jl. Letjen Sunandar Priyo Sudarmo', '0341 403900', NULL),
(79, 'PT. LG ELECTRONICS INDONESIA SC SURABAYA', 'Jl. Tegal Sari no. 41 Surabaya', '031-5342277', NULL),
(80, 'PT. MAXZER SOLUSI STERIL', 'Jl. Karya Barat 21 Malang', '0341373093', NULL),
(81, 'PT. MAYANGSARI BERLIAN MOTOR JEMBER', 'Jl. Gajah mada 224 A - Jember', '0331-484366', NULL),
(82, 'PT. MGG SOFTWARE ', 'Jl. Bantaran terusan 2 No. 62 Malang', '-', NULL),
(83, 'PT. NAYATI INDONESIA', 'Kaw. Ind. Terboyo Megah 19 Semarang', '024-6580573', NULL),
(84, 'PT. PJB UBJOM PLTU INDRAMAYU', 'Desa Sumur Adem Kec Sukra Kab Indramayu Jawa Barat', '0', NULL),
(85, 'PT. PJB UBJOM PLTU PAITON BARU', 'Jl. Raya Surabaya-Situbondo km 142 Paiton Probolinggo', '0335-771668', NULL),
(86, 'PT. PJB UBJOM PLTU REMBANG', 'Jl. Raya Semarang Surabaya Km. 130, Desa Leran dan Desa Trahan, Kec. Sluke, Kab. Rembang', '0', NULL),
(87, 'PT. PLN (PERSERO) ULP DINOYO', 'Jln. MT Haryono Malang', '081252607611', NULL),
(88, 'PT. PLN (PERSERO) ULP KEPANJEN', 'Jl. Panji No. 2 Kepanjen', '0341-395033', NULL),
(89, 'PT. PRIMAKOM SURABAYA', 'Jl. Jajar Tunggal 1 Blok D-12A Wiyung Surabaya', '0318284901', NULL),
(90, 'PT. RETGOO SENTRIS INFORMA', 'Terra Building Lantai 2-3 Jl. Terusan Candi Mendut 9B Malang', '-', NULL),
(91, 'PT. Surabaya Autocomp Indonesia', 'Ngoro Industri Persada (NIP) - Mojokerto', '082230072003', NULL),
(92, 'RADAR MALANG', 'Jl. Kawi II B Malang', '0341363700', NULL),
(93, 'ROLEPLAY ANIMATION', 'Jl. Sulfat Agung XI/ 4C Malang', '081216489381', NULL),
(94, 'Royal ATK', 'Jl. Ciliwung No.2 Malang', '081333007790', NULL),
(95, 'ROYAL ATK DAN ROYAL OLE OLE BATU', 'Jl. Raya Soekarno No.159 Batu', '0341-5104464', NULL),
(96, 'SENTRA MEDIA KOMPUTINDO', 'Jl. Bendungan Sigura-Gura L2 No. 4 Kav 3', '0341 569636', NULL),
(97, 'SION DIGITAL PRINTING', 'Jln. Bendungan Sutami', '0341568873', NULL),
(98, 'SUZUKI TLOGOMAS MALANG', 'Jl. Raya Tlogomas Malang', '0341-575666', NULL),
(99, 'The Onsen Hot Spring Resort Songgoriti', 'Jl. Raya Arumdulu 98 Songgoriti Batu', '03415101888', NULL),
(100, 'Ubud Hotel & Villas', 'Malang', '-', NULL),
(101, 'WAHID PRINTING', 'Jl. Candi Panggung Barat 17 C Malang', '085100589438', NULL),
(102, 'YPPII BATU. ', 'Jl. Indragiri No. 5 Batu', '-', NULL),
(103, 'ACT DIGITAL AGENCY', 'Griyasanta Blok H 253', '-', NULL),
(104, 'AHASS ALIM JAYA MOTOR', 'Jl. Tenaga 2B - Kav 1 Malang', '0341-491005', NULL),
(105, 'AHASS ASIA', 'Jl Raya Pakisaji', '0341809912', NULL),
(106, 'AHASS DIPONEGORO MOTOR', 'Jl. Diponegoro 73 Batu P. Hozi', '0341-591689', NULL),
(107, 'AHASS KOTA LAMA JAYA MOTOR', 'Jl. Laksamana Mardinata 129 B Malang', '0341-353561', NULL),
(108, 'AHASS KURNIA MOTOR BATU', 'Jl. Diponegoro 173 Batu', '0341-511888', NULL),
(109, 'AHASS MURNI MOTOR', 'Jl. Galunggung 76 DE Malang', '0341-569931', NULL),
(110, 'AHASS SAHABAT JUNIOR', 'Jl. Panji Suroso No 18 Malang', '03414352557', NULL),
(111, 'AHASS SINAR JAYA MOTOR', 'JL. Letjen S. Priyosudarmo 5N Malang', '0341-407000', NULL),
(112, 'ALFAMART CANDI WATES PASURUAN', 'Jl raya candi jawi Rt 05 Rw 02 Candi Wates prigen', '-', NULL),
(113, 'ALFAMART GRIYATAMA JASEM MOJOKERTO', 'Jasem kel: Jasem kec: Ngoro kab: Mojokerto ', '-', NULL),
(114, 'ALFAMART JAGIL PRIGEN PASURUAN', 'Alfamart Jagil Prigen', '-', NULL),
(115, 'ALFAMART KUPANG JETIS MOJOKERTO', 'dsn kupang kec.jetis mojokerto', '-', NULL),
(116, 'ALFAMART KUTOREJO PASURUAN', 'jln.Pahlawan Sunaryo No. 18,Magasari, kutorejo, kec. Pandaan pasuruan', '-', NULL),
(117, 'ALFAMART LECARI PASURUAN', 'desa lecari banyak putih', '-', NULL),
(118, 'ALFAMART LOLAWANG MOJOKERTO', 'Jl.Raya lolawang Dusun.sumberbendo RT2 RW2 Desa lolawang kec.Ngoro kab.Mojokerto', '-', NULL),
(119, 'ALFAMART MANDURO MOJOKERTO', 'Dsn manduro rt/rw :014/003', '-', NULL),
(120, 'ALFAMART MENANGGAL MOJOKERTO', 'Jl Raya Gajah Mada No.24,Menanggal,Mojosari,Mojokerto', '-', NULL),
(121, 'ALFAMART MURIA MOJOKERTO', 'Jl MURIA RAYA WATES KELURAHAN WATES MAGERSAR', '-', NULL),
(122, 'ALFAMART PENANGUNGAN PRIDGEN PASURUAN', 'jl. Raya gg. Temurejo no. 11 PASURUAN', '-', NULL),
(123, 'ALFAMART RAYA KEPULUNGAN PASURUAN', 'Jl. Raya Kepulungan, Kepulungan Satu, Gempol, Kec. Gempol, Pasuruan, Jawa Timur 67155', '-', NULL),
(124, 'ALFAMART RAYA SAMBIROTO MOJOKERTO', 'Jln raya sambiroto dsn sambiroto ds mlaten', '-', NULL),
(125, 'ALFAMART RAYA TAMAN SAFARI PASURUAN', 'jl taman safari Kel. Pakukerto kec. Sukorejo Pasuruan', '-', NULL),
(126, 'ALFAMART SUMOLAWANG MOJOKERTO', 'Perum Lawang Asri kec. Puri Sumolawang Mojokerto', '-', NULL),
(127, 'ALFAMART SUWAYUWO PASURUAN', 'Suwayuwo dusun klanting no. 28', '-', NULL),
(128, 'AREMA TV', 'Jl. Baiduri Pandan No.16 Tlogomas Malang', '-', NULL),
(129, 'ASTRA INTERNASIONAL DAIHATSU KEDIRI', 'Jl. Sukarno Hatta 152 Kediri', '0354-684412', NULL),
(130, 'AUTO 2000  JEMURSARI SURABAYA', 'Jl. Raya Jemursari 215 Surabaya', '081337655487', NULL),
(131, 'AUTO 2000 KEDIRI', 'KEDIRI', '-', NULL),
(132, 'AUTO 2000 KENJERAN', 'SURABAYA KENJERAN', '-', NULL),
(133, 'AUTO 2000 KERTAJAYA SURABAYA', 'Surabaya', '0', NULL),
(134, 'Auto 2000 Madiun', 'Jl. Cokroaminoto Madiun', '0351-492000', NULL),
(135, 'Auto 2000 Pasuruan', '-', '-', NULL),
(136, 'Auto 2000 Probolinggo', 'PROBOLINGGO', '-', NULL),
(137, 'Auto 2000 Singosari', 'Jl. Dr.Cipto NO. 150 Randu Agung Singosari', '03413062000', NULL),
(138, 'BATU COMPUTER', 'Jl. Diponegoro Kota Batu', '0341-5102706', NULL),
(139, 'Bayu Electronic Production', 'Jl. Soekarno Hatta 44 Malang', '082257846342', NULL),
(140, 'BDI INIDIA STUDIO ANIMASI', 'Bali Creative Industry Center (Balai Diklat Industri Denpasar) Jl. WR. Supratman No. 302 Kesiman Kertalangu, Denpasar Timur, Bali', '-', NULL),
(141, 'Bengkel Anugrah', 'Jl. MT Haryono Malang', '0', NULL),
(142, 'BENGKEL BAGONG', 'Jl. Perusahaan 12 plambesan Tunjungtirto', '08980003423', NULL),
(143, 'Bengkel Bubut Crew', 'Jl. Raya Mendalan Wangi No. 34 Wagir Malang', '-', NULL),
(144, 'BENGKEL DIDIK MOTOR', 'Jl. Wukir RT. 1 RW.1', '085100686901', NULL),
(145, 'BENGKEL DIPONEGORO', 'Jl. Raya Diponegoro Batu', '085815444180', NULL),
(146, 'BENGKEL IRUL', 'Batu', '-', NULL),
(147, 'Bengkel Kalpataru', 'Jl. Kalpataru No. 141 Malang', '0341-408731', NULL),
(148, 'bengkel M. Yusuf', 'Jl. Suropati Gg. III/14 Batu', '03419128841', NULL),
(149, 'Bengkel Setia jaya', 'Jl Sumber Wuni No 50 Lawang', '085100271712', NULL),
(150, 'BENGKEL SETYA MEKAR', 'Jl. Raya dau kab. Malang', '082244336625', NULL),
(151, 'Bengkel Soekarno Hatta Auto Service', 'Ters Candi  Mendut 37 Malang', '081252454545', NULL),
(152, 'Bengkel Takim', 'Jl. Kenanga Bulukerto - Batu', '085102323989', NULL),
(153, 'BENING FOTOGRAPHI', 'Jl. Bendungan Bening 30-32 Malang', '0341567357', NULL),
(154, 'Beringin putih', 'Jl. Kenikir no. 9 Malang', '0341-6108433', NULL),
(155, 'Breaker Video Production', 'Jl. Soekarno Hatta Indah IV No. 1 Mojolangu, Kec. Lowokwaru, Kota Malang', '085691919722', NULL),
(156, 'CAHAYA ADVERTISING', 'Jl. ters Sulfat 71 Malang', '0341-7304773', NULL),
(157, 'CARREFOUR', 'Jl. A. Yani No 2 Malang', '0341470234', NULL),
(158, 'CV BUMI BUANA CITRA', 'Jl. Industri 78 - 82 Mangliawan Malang', '085755409719', NULL),
(159, 'CV. CAHAYA MUSTIKA', 'Jl. MT Hariyono Malang Ruko Istana Dinoyo B 11 Malang', '08155501980', NULL),
(160, 'CV. CARMEL HILL MACHINERY', 'Jl. Tumenggung Suryo 21 A Malang', '0341 492032', NULL),
(161, 'CV. GREEN YUFID GROUP / ASTON PRINTER', 'Jl. Sigura - gura Barat No 20F', '0341-558893', NULL),
(162, 'CV. MESIN JATIM', 'Jl. Ronggolawe Kav. 18 No. 13', '085398000857', NULL),
(163, 'CV. RONGGOLAWE', 'Jl. Raya Jetis Mulyoagung No. 62 Dau Malang', '0341532138', NULL),
(164, 'CV. ROWELIN PERSADA UTAMA', 'Jalan Ikan Cucut No. 2 Kemirahan Malang', '081542478444', NULL),
(165, 'CV. UNO MEDIA', 'Jl. Kesatrian', '085749619148', NULL),
(166, 'CYBER AKSES', 'Jl. Piranha Atas 288 Malang', '08174822412', NULL),
(167, 'DATSUN MALANG', 'JL. S.Parman 95 Malang', '0341491101', NULL),
(168, 'DESRO DESIGN', 'Jl. LS Sucipto 192 Malang', '081233610878', NULL),
(169, 'DIANS PRINTS', 'Jl. Kendalsari Barat 1 No 4 Malang', '08123302100', NULL),
(170, 'DIGITAL PHOTO GRAPHICS', 'Jl. Raya Siligita No. 12X Nusa Dua - Bali', '0361 778034', NULL),
(171, 'focus speed', 'Jl. Perusahaan No 31 Karanglo', '085234646699', NULL),
(172, 'HALMIN BALI', 'Jl. Diponegoro Komp. Pertokoan kertawijaya Blok A - 10 Denpasar', '0361-248803', NULL),
(173, 'HONDA MOBIL SUKUN', 'Jl. S. Supriadi nO 19.22 Malang', '0341363477', NULL),
(174, 'INET BALI', 'Pertokoan Imam Bonjol Square A-20', '089603012929', NULL),
(175, 'INIXINDO', 'Jl. Jemursari Utara II No 24 Surabaya', '031-8299398', NULL),
(176, 'JADIMAU.COM', 'Jl. Danau Surubec Sawojajar Kedung Kandang', '-', NULL),
(177, 'JANTRA KEDIRI', 'KEDIRI', '-', NULL),
(178, 'JANTRA SIDOARJO', 'SIDOARJO', '-', NULL),
(179, 'JOLO DAIHATSU MALANG', 'Malang', '081236686646', NULL),
(180, 'KOCHIRO', 'Bantaran 1 No. 45 Malang', '0341 784580', NULL),
(181, 'LENTERA ADV.', 'Jl. Letda Made Putra No. 26 Bali', '0361-254263', NULL),
(182, 'MALANG TV', 'Jl. Puncak Joyo Agung Merjosari', '0341 550088', NULL),
(183, 'MALANGTIMES.COM', 'Ruko Tlogomas Square Kav. 14 Malang Jatim, ', '03415074961', NULL),
(184, 'MAXZ LAB', 'Jl. Karya Barat 21 Malang', '-', NULL),
(185, 'merpati bali', 'Jl Raya Kuta 67 Bali', '0361764665', NULL),
(186, 'MITSUBISHI SERVICES', 'Jl Candi Mendut Utara No 15', '085855135006', NULL),
(187, 'PASSANG ORNAMEN', 'Jl. MT. Haryono Gg. 2 Malang', '08125437303', NULL),
(188, 'PERDANA PAINT REPAIR', 'Jl. Jaksa Agung Suprapto No. 7 Malang', '0341-7010000', NULL),
(189, 'PERUM DAMRI', 'Jl. Letjen S.Parman 11 Malang', '0341-473586', NULL),
(190, 'POLYTRON BOJONEGORO', 'Jl. Basuki Rahmad No 44 Bojonegoro', '0353-893131', NULL),
(191, 'POLYTRON JEMBER', 'Jl. Letjen Suprapto No 123 C Jember', '0331-337495', NULL),
(192, 'POLYTRON KEDIRI', 'Jl. Perintis kemerdekaan (ngronggo) no 23 Kediri', '0354-682235', NULL),
(193, 'POLYTRON MADIUN', 'Jl. Wuni No 24 A Madiun', '0351-499248', NULL),
(194, 'POLYTRON MALANG', 'Jl. Temenggung Suryo No 100 C', '4803320', NULL),
(195, 'POLYTRON PASURUAN', 'Jl. Raden Patah. No 98 Pasuruan', '082236926686', NULL),
(196, 'POLYTRON SURABAYA', 'Jl. Rungkut Industri IV No 26 Surabaya', '031-8478098', NULL),
(197, 'PROBIS UM MALANG', 'Jl. Semarang 5 Malang', '085100577764', NULL),
(198, 'PT BERKAH UTAMA ALLOY', 'Jl. Raya Sedati  38 Desa Wedi Gedangan Sidoarjo', '031-8913500', NULL),
(199, 'PT DAKWAH INTI MEDIA (TV9)', 'Jl. Raya Darmo 96 Surabaya', '031-5620999', NULL),
(200, 'PT MEDIA TELEVISI LESTARI SATU (METRO TV)', 'Jl. Ketampon Ruko Permata Bintoro Kav 118-123 Surabaya', '03156220991', NULL),
(201, 'PT. ADI PUTRO WIRA SEJATI (Mesin)', 'Jl. Bale arjosari 15 Malang', '0341-491139', NULL),
(202, 'PT. ARTHAWENA SAKTI GEMILANG TANGERANG', 'Jl. Raya Serang KM 12.5 Kp Cirewed. Ds Sukadamai. Kec Cikupa. Kab.Tangerang. Propinsi Banten', '021-5960499', NULL),
(203, 'PT. ASSIST SOFTWARE INDONESIA', 'Pondok Blimbing Indah Blok. E1-14 Malang 65126', '(0341) 419004', NULL),
(204, 'PT. ASTRA INTERNASIONAL, TBK. (DAIHATSU MALANG/BODI REPAIR)', 'JL. LA SUCIPTO NO. 241 MALANG', '081803283186', NULL),
(205, 'PT. AUTOCHEM INDUSTRY', 'Jl. Raya Gatot Subroto Km.7 Jatake Jatiuwung Tangerang Banten - 15136', '021-5900131', NULL),
(206, 'PT. BROMO STEEL INDONESIA', 'Jl.RE Martadinata No. 18-20 Pasuruan', '0343-421074', NULL),
(207, 'PT. CAHAYA SURYA BALI INDAH (HINO DEVISION)', 'Jl. Cokroaminoto 470 Denpasar - Bali', '0361-410909', NULL),
(208, 'PT. CAHAYA SURYA BALI INDAH (TBSM)', 'Jl. Bypass Ngurahrai 110 C Denpasar', '0361-753887', NULL),
(209, 'PT. CENDANA TEKNIKA UTAMA', 'Jl. Raya Sukarno Hatta - Ruko Griya Shanta NR. 24-25 Malang', '0341-496497', NULL),
(210, 'PT. CM LAB DIGITAL INDONESIA', 'Jl. Seruni No.9 Malang', '-', NULL),
(211, 'PT. CYBER NETWORK INDONESIA', 'Jl. Gatsu Barat 333 Bali', '0361 9004770', NULL),
(212, 'PT. DEMPO LASER METALINDO', 'Jl. Rungkut Industri I No. 29 Surabaya', '031-8437363', NULL),
(213, 'PT. DHOHO MEDIA TELEVISI', 'Jl. Mayjend Panjaitan 1 Kediri', '0354-693999', NULL),
(214, 'PT. DOT INDONESIA', 'Perum Permata Hijau No. A.15', '081290090671', NULL),
(215, 'PT. ESA SURYA ARCAPADA', 'Jl. Ir. Soekarno No. 17/266 Mojorejo', '08510150280', NULL),
(216, 'PT. GIRISA TEKNOLOGI', 'Ruko Taman Borobudur Indah Kav. 33 Jl. Puncak Borobudur No. 1 Malang', '0341-4345807', NULL),
(217, 'PT. Hartono Putra', 'Karangploso-Malang', '0341-402454', NULL),
(218, 'PT. INDIRATEX SPINDO', 'Jl. Raya Randuagung No.KM. 75, Randutelu, Randuangung, Kec. Singosari, Malang, Jawa Timur', '(0341) 450888', NULL),
(219, 'PT. INDONESIA ONLINE ALAMAYA', 'Jl. By Pass Prof. DR. IB Mantra Puri Chandra Asri A-25 Denpasar', '0361-468408', NULL),
(220, 'PT. Indonesia Power UPJP Perak Grati Pasuruan', 'Jl. Raya Sby Prob Km. 73 Grati Pasuruan', '0343 413582-3', NULL),
(221, 'PT. Inovasi Tjaraka Buana (MYNET)', 'Jl. Sukabirus No. 88B, Dayeuhkolot, Bandung', '022-87301369', NULL),
(222, 'PT. INTERNUSA CIPTA SOLUSI PERDANA', 'Jl. Rawa Domba Kav. Agraria No 160 Jakarta Timur 13440', '021-86604931', NULL),
(223, 'PT. INTI KARYA TEKNIK - Cikarang', 'Pasar Bersih - Cikarang', '-', NULL),
(224, 'PT. KING MANUFACTURE', 'Jl. Amarta Raya No 17 Surakarta', '0271-783029', NULL),
(225, 'PT. KUSUMA SATRIA DINASASRI WISATAJAYA (KUSUMA AGRO)Elektro', 'Jalan Abdul Gani Atas Batu Malang', '0341-593333', NULL),
(226, 'PT. KUSUMA SATRIA DINASASRI WISATAJAYA (KUSUMA AGRO)Otomotif', 'Jalan Abdul Gani Atas Batu Malang', '0341-593333', NULL),
(227, 'PT. MAXZER SOLUSI STERIL CURUNG REJO', 'CURUNG REJO', '-', NULL),
(228, 'PT. MORODADI PRIMA 2', 'Jl. Raya Randuagung No.1, Karangkunci, Randuangung, Kec. Singosari, Malang, Jawa Timur 65153', '082339291961', NULL),
(229, 'PT. MURNI DIAMOND MOTOR (BP)', 'Jl. Kalijaten No. 4 Sidoarjo', '0317874640', NULL),
(230, 'PT. NARAYA TELEMATIKA', 'Ruko Taman Borobudur Indah Kav. 33 Jl. Puncak Borobudur No. 1 Malang', '0341-4345807', NULL),
(231, 'PT. PADINET MALANG', 'Malang', '0341404900', NULL),
(232, 'PT. PARAMITHA AUTOGRAHA (PAG)', 'Jl. Achmad Yani No 999 Denpasar', '0361 423188', NULL);

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
(1, 'admin@gmail.com', 'admin', 'Admin', NULL, NULL),
(2, 'laporanprakerinskariga@gmail.com', 'smkbisa', 'Pembimbing', 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_history`
--

CREATE TABLE `tb_history` (
  `id_history` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `kegiatan` text DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `catatan` text DEFAULT NULL,
  `id_pembimbing` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Indexes for table `tb_history`
--
ALTER TABLE `tb_history`
  ADD PRIMARY KEY (`id_history`),
  ADD KEY `id_user` (`id_user`);

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
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ms_pembimbing`
--
ALTER TABLE `ms_pembimbing`
  MODIFY `id_pembimbing` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ms_tahun_ajaran`
--
ALTER TABLE `ms_tahun_ajaran`
  MODIFY `id_tahun_ajaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ms_tempat_prakerin`
--
ALTER TABLE `ms_tempat_prakerin`
  MODIFY `id_tempat_prakerin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=233;

--
-- AUTO_INCREMENT for table `ms_users`
--
ALTER TABLE `ms_users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_history`
--
ALTER TABLE `tb_history`
  MODIFY `id_history` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_jurnal`
--
ALTER TABLE `tb_jurnal`
  MODIFY `id_jurnal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_laporan_prakerin`
--
ALTER TABLE `tb_laporan_prakerin`
  MODIFY `id_laporan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_monitoring`
--
ALTER TABLE `tb_monitoring`
  MODIFY `id_monitoring` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_monitoring_detail`
--
ALTER TABLE `tb_monitoring_detail`
  MODIFY `id_monitoring_detail` int(11) NOT NULL AUTO_INCREMENT;

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
-- Constraints for table `tb_history`
--
ALTER TABLE `tb_history`
  ADD CONSTRAINT `tb_history_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `ms_users` (`id_user`);

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
