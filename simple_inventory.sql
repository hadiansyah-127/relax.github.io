-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 23, 2019 at 02:32 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simple_inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `cc_divisi`
--

CREATE TABLE `cc_divisi` (
  `id` int(11) NOT NULL,
  `nama_divisi` varchar(50) DEFAULT NULL,
  `nama_divisi_p` varchar(50) DEFAULT NULL,
  `stat` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cc_divisi`
--

INSERT INTO `cc_divisi` (`id`, `nama_divisi`, `nama_divisi_p`, `stat`) VALUES
(1, 'SUB/BAG. Keuangan', 'Oman', 1),
(2, 'Unit Pengamanan Nuklir (UPN)', 'Irpan', 1),
(3, 'Bidang Senyawa Bertanda dan Radiometri', 'Hadi', 1),
(4, 'SUB/BAG. PKDI', 'Caca', 1),
(5, 'Unit Jaminan Mutu (UJM)', 'Hendra', 1),
(14, 'Bidang Teknofisika', NULL, 1),
(15, 'Bidang Reaktor', NULL, 1),
(16, 'Bidang Keselamatan Kerja dan Keteknikan', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cc_kirim`
--

CREATE TABLE `cc_kirim` (
  `id` int(11) NOT NULL,
  `id_master` int(11) DEFAULT NULL,
  `id_divisi` int(11) DEFAULT NULL,
  `tgl` datetime DEFAULT NULL,
  `jml` int(11) DEFAULT NULL,
  `ket` varchar(300) DEFAULT NULL,
  `stat` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cc_kirim`
--

INSERT INTO `cc_kirim` (`id`, `id_master`, `id_divisi`, `tgl`, `jml`, `ket`, `stat`) VALUES
(5, 6, 15, '2019-09-20 00:00:00', 40, 'Kebutuhan divisi', 1),
(6, 2, 5, '2019-09-21 00:00:00', 45, 'Kebutuhan divisi', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cc_master`
--

CREATE TABLE `cc_master` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `tag` varchar(50) DEFAULT NULL,
  `tgl` datetime DEFAULT NULL,
  `stat` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cc_master`
--

INSERT INTO `cc_master` (`id`, `nama`, `tag`, `tgl`, `stat`) VALUES
(1, 'Gelas Hadiah', 'wira', '2017-07-25 00:00:00', 9),
(2, 'Kertas A4', 'Pabrik Kertas', '2019-09-21 00:00:00', 1),
(3, 'Pulpen Faster', 'Pabrik Faster', '2019-09-21 00:00:00', 1),
(4, 'Voucher Pulsa', 'dayu', '2017-07-27 00:00:00', 9),
(5, 'Kertas Invoice (dus)', 'wira', '2017-07-26 00:00:00', 9),
(6, 'Aqua Botol', 'Pabrik Aqua', '2019-09-21 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cc_project`
--

CREATE TABLE `cc_project` (
  `id` int(11) NOT NULL,
  `nama_project` varchar(100) NOT NULL,
  `tgl` datetime NOT NULL,
  `stat` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cc_temp`
--

CREATE TABLE `cc_temp` (
  `id` int(11) NOT NULL,
  `id_project` int(11) NOT NULL,
  `tb` varchar(30) NOT NULL,
  `id_master` int(11) NOT NULL,
  `id_divisi` int(11) NOT NULL,
  `tgl` datetime NOT NULL,
  `jml` int(11) NOT NULL,
  `ket` varchar(300) NOT NULL,
  `stat` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cc_temp`
--

INSERT INTO `cc_temp` (`id`, `id_project`, `tb`, `id_master`, `id_divisi`, `tgl`, `jml`, `ket`, `stat`) VALUES
(1, 1, 'cc_terima', 1, 0, '2017-07-25 00:00:00', 0, 'Data awal', 1),
(2, 1, 'cc_terima', 2, 0, '2017-07-26 00:00:00', 0, 'Data awal', 1),
(3, 1, 'cc_terima', 3, 0, '2017-07-25 00:00:00', 0, 'Data awal', 1),
(4, 1, 'cc_terima', 4, 0, '2017-07-27 00:00:00', 0, 'Data awal', 1),
(5, 1, 'cc_terima', 5, 0, '2017-07-26 00:00:00', 0, 'Data awal', 1),
(6, 1, 'cc_terima', 6, 0, '2017-07-25 00:00:00', 0, 'Data awal', 1),
(7, 1, 'cc_terima', 3, 0, '2017-07-28 00:00:00', 300, 'dibeli pak made', 1),
(8, 1, 'cc_terima', 2, 0, '2017-07-30 00:00:00', 150, 'dikirim sebagian oleh pak sugih', 1),
(9, 1, 'cc_terima', 6, 0, '2017-07-27 00:00:00', 5000, 'beli', 1),
(10, 1, 'cc_terima', 4, 0, '2017-07-29 00:00:00', 400, 'untuk persediaan quota pulsa sebulan', 1),
(11, 1, 'cc_terima', 1, 0, '2017-07-30 00:00:00', 800, '', 1),
(12, 1, 'cc_terima', 5, 0, '2017-07-30 00:00:00', 50, 'stok untuk masing-masing divisi', 1),
(13, 1, 'cc_terima', 3, 0, '2017-07-30 00:00:00', 200, 'baru dibeli ayu', 1),
(16, 1, 'cc_kirim', 3, 13, '2017-07-29 00:00:00', 80, 'Dikirim ke Distribution', 1),
(17, 1, 'cc_terjual', 3, 13, '2017-07-30 00:00:00', 15, 'kehabisan pulpen', 1),
(18, 2, 'cc_terima', 1, 0, '2017-07-30 00:00:00', 800, 'Data awal periode', 1),
(19, 2, 'cc_terima', 2, 0, '2017-07-30 00:00:00', 150, 'Data awal periode', 1),
(20, 2, 'cc_terima', 3, 0, '2017-07-30 00:00:00', 485, 'Data awal periode', 1),
(21, 2, 'cc_terima', 4, 0, '2017-07-30 00:00:00', 400, 'Data awal periode', 1),
(22, 2, 'cc_terima', 5, 0, '2017-07-30 00:00:00', 50, 'Data awal periode', 1),
(23, 2, 'cc_terima', 6, 0, '2017-07-30 00:00:00', 5000, 'Data awal periode', 1),
(25, 2, 'cc_kirim', 3, 2, '2019-09-18 00:00:00', 30, 'Kebutuhan divisi', 1),
(26, 2, 'cc_kirim', 6, 2, '2019-09-20 00:00:00', 30, 'Kebutuhan divisi', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cc_terima`
--

CREATE TABLE `cc_terima` (
  `id` int(11) NOT NULL,
  `id_master` int(11) DEFAULT NULL,
  `tgl` datetime DEFAULT NULL,
  `jml` int(11) DEFAULT NULL,
  `ket` varchar(300) DEFAULT NULL,
  `stat` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cc_terima`
--

INSERT INTO `cc_terima` (`id`, `id_master`, `tgl`, `jml`, `ket`, `stat`) VALUES
(1, 2, '2019-09-20 00:00:00', 150, 'Data awal periode', 1),
(2, 3, '2019-09-20 00:00:00', 485, 'Data awal periode', 1),
(3, 6, '2019-09-20 00:00:00', 5000, 'Data awal periode', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cc_terjual`
--

CREATE TABLE `cc_terjual` (
  `id` int(11) NOT NULL,
  `id_master` int(11) NOT NULL,
  `id_divisi` int(11) NOT NULL,
  `jml` int(11) DEFAULT NULL,
  `tgl` datetime DEFAULT NULL,
  `ket` varchar(300) NOT NULL,
  `stat` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cms_admin`
--

CREATE TABLE `cms_admin` (
  `username` varchar(32) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('admin','user') NOT NULL,
  `token` varchar(40) DEFAULT NULL,
  `priviledge` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cms_admin`
--

INSERT INTO `cms_admin` (`username`, `name`, `email`, `password`, `role`, `token`, `priviledge`) VALUES
('admin', 'Admin', 'admin@localhost', '$2y$10$NtVX2YLOV3nbuL8H5yYcJ.o3Q3VBKuBV3rfHg2NovHMUEDgM6o8aS', 'admin', 'd8ed7457a3464c783a4485c5173c8adce2210c1a', 1),
('user', 'User', 'user@localhost', 'ee11cbb19052e40b07aac0ca060c23ee', 'user', '827ccb0eea8a706c4c34a16891f84e7b', 2);

-- --------------------------------------------------------

--
-- Table structure for table `cms_admin_fail`
--

CREATE TABLE `cms_admin_fail` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `tgl` datetime DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `useragent` varchar(500) DEFAULT NULL,
  `stat` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cms_admin_fail`
--

INSERT INTO `cms_admin_fail` (`id`, `username`, `tgl`, `ip`, `useragent`, `stat`) VALUES
(1, 'admin', '2019-09-18 01:06:26', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.75 Safari/537.36', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cms_admin_log`
--

CREATE TABLE `cms_admin_log` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `tgl` datetime DEFAULT NULL,
  `expired` datetime DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `user_agent` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cms_admin_log`
--

INSERT INTO `cms_admin_log` (`id`, `username`, `tgl`, `expired`, `token`, `ip`, `user_agent`) VALUES
(1, 'admin', '2017-06-30 05:02:19', '2017-06-30 17:02:19', 'c42b3d41b4d6a3895cf2b80e7a08dcb1be9a83c1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36'),
(2, 'admin', '2017-07-01 02:50:18', '2017-07-01 14:50:18', 'a2f9392bf91dc705be0c92d0f3458a6a52b697d2', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(3, 'admin', '2017-07-03 02:01:15', '2017-07-03 14:01:15', '0ca31bee87d86235bc193dcd8ec46414c452a647', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(4, 'admin', '2017-07-04 03:19:15', '2017-07-04 15:19:15', '15fc59bcb23e52ab0ec6a76a41d66ed28a8aedee', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(5, 'admin', '2017-07-04 05:25:47', '2017-07-04 17:25:47', '26173cfafee8cb96a218ebe97df3ebb185c1fbe2', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(6, 'admin', '2017-07-04 05:25:53', '2017-07-04 17:25:53', '7380ae29990cb723955ce30f7a2ba822fd479669', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(7, 'admin', '2017-07-04 09:51:28', '2017-07-04 21:51:28', '98c1f89c3c6849332601c4bf6cc0d158607ad783', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(8, 'admin', '2017-07-05 03:24:25', '2017-07-05 15:24:25', 'ed3e08a5348fe61c41e7c9d7a9a5219f4041f04f', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(9, 'admin', '2017-07-05 05:12:36', '2017-07-05 17:12:36', '6fbcdf8202f29748e95572958f9f832dbe34eda6', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(10, 'admin', '2017-07-21 02:24:46', '2017-07-21 14:24:46', '95ae6dde76e4e5dc672cd4d29028ab23568c0126', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(11, 'admin', '2017-07-30 14:40:34', '2017-07-31 02:40:34', '769c11ee9774003dfe2a724f0f30f219e8c9d03d', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(12, 'admin', '2017-07-30 14:59:12', '2017-07-31 02:59:12', 'ce7de48eb9bd8ee9b9130fb67d8d99e3f0b017ba', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(13, 'admin', '2017-07-30 14:59:46', '2017-07-31 02:59:46', 'fb491ba4ed16da2d7c7c968a1e632d92e58b4c16', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(14, 'admin', '2017-07-30 15:06:03', '2017-07-31 03:06:03', '3d69ddafbfaa8642ff8fd203eaa50db56b126c3f', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(15, 'admin', '2019-09-15 11:33:46', '2019-09-15 23:33:46', '317a3a05bd4a06eccddd405ab7a835f018b10b99', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.75 Safari/537.36'),
(16, 'admin', '2019-09-18 01:06:35', '2019-09-18 13:06:35', 'bf837c6777610694213d04cf3926cd4c09274850', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.75 Safari/537.36'),
(17, 'admin', '2019-09-20 18:51:46', '2019-09-21 06:51:46', '995a9ee3825bb7aac25cad9726b090bb08ace3bc', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36'),
(18, 'admin', '2019-09-20 22:26:45', '2019-09-21 10:26:45', '5fcb6da9ed863e4e033477c7a3dcd6124f642751', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36'),
(19, 'admin', '2019-09-20 23:51:56', '2019-09-21 11:51:56', '125cecb45708eafe73eb2115aadfccaf3db5b4f8', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36'),
(20, 'admin', '2019-09-21 00:45:05', '2019-09-21 12:45:05', 'c2ae91e803fb8ee0d649b9f888900a5b4f96b2ec', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36'),
(21, 'admin', '2019-09-21 00:48:18', '2019-09-21 12:48:18', '44f1f9eb4c3f7428ab9fa56758e973ccabf70442', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36'),
(22, 'admin', '2019-09-21 01:10:27', '2019-09-21 13:10:27', '4fa2473575c3295fc874947533e1804d57f42fc1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36'),
(23, 'admin', '2019-09-21 01:25:09', '2019-09-21 13:25:09', '5d9f8c0bbe221711cfa46f304f0f8fba964d4ce8', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36'),
(24, 'admin', '2019-09-21 01:31:15', '2019-09-21 13:31:15', 'ca651800fcce0f10053db289cb10a132e08a8309', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36'),
(25, 'admin', '2019-09-21 01:38:28', '2019-09-21 13:38:28', '2b8b5932f9c0e10a07c0a7ea95f2e4e982a0e3d7', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36'),
(26, 'admin', '2019-10-11 08:52:04', '2019-10-11 20:52:04', '3e6bdc0eefdf6042e5a59f3f83fc4e6b5624a250', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36'),
(27, 'admin', '2019-10-14 05:09:30', '2019-10-14 17:09:30', '8ddc0466f609b30252216bdb1546a03d51af0064', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36'),
(28, 'admin', '2019-10-14 05:11:01', '2019-10-14 17:11:01', '6fe15cc04586dc84f82d7ef4f24eda1252856bde', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.1 Safari/605.1.15'),
(29, 'admin', '2019-10-23 14:31:34', '2019-10-24 02:31:34', '2dd687bfa5ccb42fd3ede3243011a8cfa32a5393', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36');

-- --------------------------------------------------------

--
-- Table structure for table `cms_option`
--

CREATE TABLE `cms_option` (
  `id` int(4) NOT NULL,
  `param` varchar(30) DEFAULT NULL,
  `label` varchar(100) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `def` text DEFAULT NULL,
  `stat` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cms_option`
--

INSERT INTO `cms_option` (`id`, `param`, `label`, `content`, `type`, `def`, `stat`) VALUES
(1, 'session_key', 'Session Key', 'tianrosandhy_sess_key', 'text', 'tianrosandhy_sess_key', 9),
(2, 'backend_paging', 'Data Per Page (Admin)', '20', 'number', '20', 1),
(3, 'frontend_paging', 'Data Per Page (Front)', '10', 'number', '10', 1),
(4, 'webname', 'Website Name', 'Aplikasi Monitoring Inventory', 'text', 'Website Name', 1),
(5, 'websubtitle', 'Website Sub Title', 'Another TianRosandhy\'s App', 'text', 'Another TianRosandhy\'s CMS Site', 1),
(6, 'max_login_try', 'Login Failed Max Try', '5', 'number', '5', 1),
(7, 'header_image', 'Header Image', NULL, 'text', NULL, 1),
(8, 'favicon', 'Favicon', NULL, 'text', NULL, 1),
(9, 'mail_system', 'Website Mail', 'me@tianrosandhy.com', 'text', 'me@tianrosandhy.com', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cc_divisi`
--
ALTER TABLE `cc_divisi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cc_kirim`
--
ALTER TABLE `cc_kirim`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cc_master`
--
ALTER TABLE `cc_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cc_project`
--
ALTER TABLE `cc_project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cc_temp`
--
ALTER TABLE `cc_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cc_terima`
--
ALTER TABLE `cc_terima`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cc_terjual`
--
ALTER TABLE `cc_terjual`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_admin`
--
ALTER TABLE `cms_admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `cms_admin_fail`
--
ALTER TABLE `cms_admin_fail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_admin_log`
--
ALTER TABLE `cms_admin_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_option`
--
ALTER TABLE `cms_option`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cc_divisi`
--
ALTER TABLE `cc_divisi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `cc_kirim`
--
ALTER TABLE `cc_kirim`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cc_master`
--
ALTER TABLE `cc_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cc_project`
--
ALTER TABLE `cc_project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cc_temp`
--
ALTER TABLE `cc_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `cc_terima`
--
ALTER TABLE `cc_terima`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cc_terjual`
--
ALTER TABLE `cc_terjual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_admin_fail`
--
ALTER TABLE `cms_admin_fail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `cms_admin_log`
--
ALTER TABLE `cms_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `cms_option`
--
ALTER TABLE `cms_option`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
