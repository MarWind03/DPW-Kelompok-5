-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 09, 2026 at 04:19 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ayu_kevin`
--

-- --------------------------------------------------------

--
-- Table structure for table `acara`
--

CREATE TABLE `acara` (
  `id_acara` int NOT NULL,
  `id_mempelai` int DEFAULT NULL,
  `jenis_acara` enum('Akad Nikah','Resepsi') COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal_acara` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `waktu_acara` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nama_tempat` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alamat` text COLLATE utf8mb4_general_ci,
  `link_maps` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `acara`
--

INSERT INTO `acara` (`id_acara`, `id_mempelai`, `jenis_acara`, `tanggal_acara`, `waktu_acara`, `nama_tempat`, `alamat`, `link_maps`) VALUES
(1, 1, 'Akad Nikah', 'Rabu, 30 September 2026', '08:00 - Selesai', 'EDELWEISS WEDDING HALL', 'Jl. Raya Bojongkoneng Kec. Klapanunggal, Kabupaten Bogor Jawa Barat 16710, Indonesia', 'https://maps.google.com'),
(2, 1, 'Resepsi', 'Rabu, 30 September 2026', '11:00 - Selesai', 'EDELWEISS WEDDING HALL', 'Jl. Anggrek No. 12, Kel. Kebayoran Lama Kec. Kebayoran Lama, Jakarta Selatan', 'https://maps.google.com');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`) VALUES
(1, 'admin', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `buku_tamu`
--

CREATE TABLE `buku_tamu` (
  `id_tamu` int NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `konfirmasi_tambahan` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kehadiran` enum('hadir','tidak-hadir') COLLATE utf8mb4_general_ci NOT NULL,
  `ucapan` text COLLATE utf8mb4_general_ci,
  `waktu_kirim` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku_tamu`
--

INSERT INTO `buku_tamu` (`id_tamu`, `nama`, `konfirmasi_tambahan`, `kehadiran`, `ucapan`, `waktu_kirim`) VALUES
(1, 'Damar', '1 orang', 'hadir', 'sakinah mawaddah warahmah', '2026-10-15 13:17:06'),
(2, 'Carlos', '3 orang', 'hadir', 'Semoga langgeng dan tidak cerai!', '2026-10-15 14:04:49'),
(3, 'Aldi ', '1 ', 'tidak-hadir', 'Ada halangan mendesak', '2026-10-15 14:52:33'),
(4, 'Prabowo', '2', 'hadir', 'blalblabla', '2026-10-15 15:20:13'),
(5, 'Carloss', '1', 'tidak-hadir', 'Ada halangan', '2026-10-15 15:35:12');

-- --------------------------------------------------------

--
-- Table structure for table `galeri`
--

CREATE TABLE `galeri` (
  `id_foto` int NOT NULL,
  `nama_file` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal_upload` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `galeri`
--

INSERT INTO `galeri` (`id_foto`, `nama_file`, `tanggal_upload`) VALUES
(1, 'foto1.jpg', '2026-10-15 13:08:50'),
(2, 'foto2.jpg', '2026-10-15 13:08:50'),
(3, 'foto3.jpg', '2026-10-15 13:08:50'),
(4, 'foto4.jpg', '2026-10-15 13:08:50'),
(5, 'foto5.jpg', '2026-10-15 13:08:50'),
(6, 'foto6.jpg', '2026-10-15 13:08:50');

-- --------------------------------------------------------

--
-- Table structure for table `love_story`
--

CREATE TABLE `love_story` (
  `id_story` int NOT NULL,
  `id_mempelai` int DEFAULT NULL,
  `tahun` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `judul` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deskripsi` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `love_story`
--

INSERT INTO `love_story` (`id_story`, `id_mempelai`, `tahun`, `judul`, `deskripsi`) VALUES
(1, 1, '2023', 'PERTEMUAN', 'Pertemuan pertama kami, di Danau UNRI'),
(2, 1, '2024', 'TAARUF', 'Kami memutuskan untuk kenal lebih dekat'),
(3, 1, '2026', 'KOMITMEN', 'Akhirnya kami memutuskan untuk melanjutkan ke jenjang yang lebih serius');

-- --------------------------------------------------------

--
-- Table structure for table `mempelai`
--

CREATE TABLE `mempelai` (
  `id_mempelai` int NOT NULL,
  `nama_wanita` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_pria` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `ortu_wanita` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ortu_pria` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pesan_aturan` text COLLATE utf8mb4_general_ci,
  `foto_wanita` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `foto_pria` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `foto_cover` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mempelai`
--

INSERT INTO `mempelai` (`id_mempelai`, `nama_wanita`, `nama_pria`, `ortu_wanita`, `ortu_pria`, `pesan_aturan`, `foto_wanita`, `foto_pria`, `foto_cover`) VALUES
(1, 'Ayu', 'Kevin', 'Bapak Ayu & Ibu Ayu', 'Bapak Kevin & Ibu Kevin', 'Harap datang tepat waktu dan mematuhi protokol yang berlaku.', 'ayu.jpg', 'kevin.jpg', 'cover.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acara`
--
ALTER TABLE `acara`
  ADD PRIMARY KEY (`id_acara`),
  ADD KEY `id_mempelai` (`id_mempelai`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `buku_tamu`
--
ALTER TABLE `buku_tamu`
  ADD PRIMARY KEY (`id_tamu`);

--
-- Indexes for table `galeri`
--
ALTER TABLE `galeri`
  ADD PRIMARY KEY (`id_foto`);

--
-- Indexes for table `love_story`
--
ALTER TABLE `love_story`
  ADD PRIMARY KEY (`id_story`),
  ADD KEY `id_mempelai` (`id_mempelai`);

--
-- Indexes for table `mempelai`
--
ALTER TABLE `mempelai`
  ADD PRIMARY KEY (`id_mempelai`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acara`
--
ALTER TABLE `acara`
  MODIFY `id_acara` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `buku_tamu`
--
ALTER TABLE `buku_tamu`
  MODIFY `id_tamu` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `galeri`
--
ALTER TABLE `galeri`
  MODIFY `id_foto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `love_story`
--
ALTER TABLE `love_story`
  MODIFY `id_story` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `acara`
--
ALTER TABLE `acara`
  ADD CONSTRAINT `acara_ibfk_1` FOREIGN KEY (`id_mempelai`) REFERENCES `mempelai` (`id_mempelai`) ON DELETE CASCADE;

--
-- Constraints for table `love_story`
--
ALTER TABLE `love_story`
  ADD CONSTRAINT `love_story_ibfk_1` FOREIGN KEY (`id_mempelai`) REFERENCES `mempelai` (`id_mempelai`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
