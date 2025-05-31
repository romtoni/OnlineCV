-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2019 at 11:26 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `biodata`
--
CREATE DATABASE IF NOT EXISTS `biodata` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `biodata`;

-- --------------------------------------------------------

--
-- Table structure for table `academic_qualification`
--

CREATE TABLE `academic_qualification` (
  `id_academic` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `gpa` varchar(4) DEFAULT NULL,
  `id_profile` int(11) UNSIGNED NOT NULL,
  `tgl_create` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `academic_qualification`
--

INSERT INTO `academic_qualification` (`id_academic`, `name`, `city`, `country`, `start_date`, `end_date`, `title`, `department`, `gpa`, `id_profile`, `tgl_create`) VALUES
(1, 'Universitas Gunadarma', 'Jakarta', 'Indonesia', '2007-07-01', '2011-11-01', 'Sarjana Teknik', 'Teknik Informatika', '3.28', 1, '2019-02-05 00:00:00'),
(2, 'SMA Negeri 5 Bekasi', 'Bekasi', 'Indonesia', '2004-07-01', '2007-06-30', NULL, 'Ilmu Pengetahuan Alam', NULL, 1, '2019-02-05 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id_course` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `id_profile` int(10) UNSIGNED NOT NULL,
  `tgl_create` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id_course`, `name`, `company`, `city`, `country`, `start_date`, `end_date`, `id_profile`, `tgl_create`) VALUES
(1, 'Kursus Android Application Development', 'PT Integrasindo Mitra Infotama', 'Jakarta', 'Indonesia', '2017-12-01', '2017-12-01', 1, '2019-02-05 00:00:00'),
(2, 'Kursus System Analysis and Design with UML', 'Brainmatics IT Training and Consulting', 'Jakarta', 'Indonesia', '2016-02-01', '2016-02-01', 1, '2019-02-05 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `key_expertise`
--

CREATE TABLE `key_expertise` (
  `id_expertise` int(11) UNSIGNED NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `descriptions` varchar(4000) DEFAULT NULL,
  `id_profile` int(11) UNSIGNED NOT NULL,
  `tgl_create` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `key_expertise`
--

INSERT INTO `key_expertise` (`id_expertise`, `title`, `descriptions`, `id_profile`, `tgl_create`) VALUES
(1, 'Web Programming', 'Membuat logika pemrograman dan menuangkannya pada aplikasi web-based perusahaan.', 1, '2019-02-05 00:00:00'),
(2, 'Database Administrating', 'Mengelola database perusahaan baik dari sisi table, view, inquery, maupun prosedur yang akan digunakan untuk membuat laporan-laporan yang diperlukan oleh perusahaan', 1, '2019-02-05 00:00:00'),
(3, 'User Manual Creating', 'Membuat user manual yang akan digunakan oleh pengguna sebagai panduan dalam mengoperasikan aplikasinya.', 1, '2019-02-05 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `professional_career`
--

CREATE TABLE `professional_career` (
  `id_career` int(10) UNSIGNED NOT NULL,
  `company` varchar(100) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `jobdesc` varchar(4000) DEFAULT NULL,
  `id_profile` int(10) UNSIGNED DEFAULT NULL,
  `company_logo` varchar(100) DEFAULT NULL,
  `tgl_create` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `professional_career`
--

INSERT INTO `professional_career` (`id_career`, `company`, `city`, `start_date`, `end_date`, `position`, `jobdesc`, `id_profile`, `company_logo`, `tgl_create`) VALUES
(1, 'PT Bhinneka Life Indonesia', 'Jakarta', '2017-01-01', NULL, 'Supervisor (IT Programmer)', 'Melakukan koding pada beberapa web-based application yang digunakan oleh perusahaan meliputi penambahan dan pengurangan fitur dan perbaikan bug. Dari segi database, meliputi pembuatan struktur tabel yang efektif dan efisien,  pembuatan query/view yang informatif, dan pembuatan store prosedur yang digunakan pada laporan-laporan yang bersifat statis, biasanya untuk laporan-laporan yang didasarkan pada rentang waktu/periode. Bekerja bersama 4 orang dalam tim.', 1, 'img/company/bhinneka.png', '2019-02-05 00:00:00'),
(2, 'AJB Bumiputera 1912', 'Jakarta', '2012-07-01', '2016-12-31', 'Staf Muda (IT Programmer)', 'Melakukan koding pada beberapa web-based application yang digunakan oleh perusahaan meliputi penambahan dan pengurangan fitur, perbaikan bug, pembuatan user manual bila diperlukan, serta melayani permintaan dan memandu user secara langsung bila ada yang kurang jelas mengenai aplikasi yang digunakan serta mengelola database yang terkait pada aplikasi tersebut. Bekerja bersama 7 orang dalam tim.', 1, 'img/company/ajbbp1912.png', '2019-02-05 00:00:00'),
(3, 'Universitas Gunadarma', 'Jakarta', '2010-10-01', '2012-03-01', 'Asisten Laboratorium Teknologi Informatika ', 'Menyusun materi, mengajarkan, serta menilai para praktikan melalui ujian dimana sesuai dengan SKS yang diambil pada semester tersebut. Secara berkala, melakukan pengawasan pada ujian tengah semester dan ujian akhir semester para mahasiswa bila ada penunjukkan oleh Asisten Tetap Laboratorium Teknologi Informatika. Bekerja bersama 5 orang dalam tim.', 1, 'img/company/ug.png', '2019-02-05 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id_profile` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `tagline` varchar(255) DEFAULT NULL,
  `hp` varchar(12) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `photo` varchar(100) DEFAULT 'img/photo/nophoto.png',
  `age` int(11) DEFAULT NULL,
  `birth_place` varchar(20) DEFAULT NULL,
  `birth_date` datetime DEFAULT NULL,
  `address` varchar(4000) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `tgl_create` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id_profile`, `name`, `tagline`, `hp`, `email`, `photo`, `age`, `birth_place`, `birth_date`, `address`, `city`, `country`, `tgl_create`) VALUES
(1, 'Romtoni', 'Web Programming & Database Administrating', '081905934749', 'romtoni21@gmail.com', 'img/photo/romtoni.jpg', 29, 'Jakarta', '1989-04-14 00:00:00', 'Jl. Kemang Sari IVB No 2 Pondok Gede', 'Bekasi', 'Indonesia', '2019-02-05 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `skillset`
--

CREATE TABLE `skillset` (
  `id_skill` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `additional_info` varchar(100) DEFAULT NULL,
  `id_profile` int(10) UNSIGNED NOT NULL,
  `tgl_create` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `skillset`
--

INSERT INTO `skillset` (`id_skill`, `name`, `additional_info`, `id_profile`, `tgl_create`) VALUES
(1, 'Bahasa Inggris', 'Pasif', 1, '2019-02-05 00:00:00'),
(2, 'Pemrograman Berbasis Web', 'PHP, MySQL, Javascript', 1, '2019-02-05 00:00:00'),
(3, 'System dan Data Analisis', NULL, 1, '2019-02-05 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `social_media`
--

CREATE TABLE `social_media` (
  `id_social` int(10) UNSIGNED NOT NULL,
  `social_name` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL,
  `social_logo` varchar(100) DEFAULT NULL,
  `id_profile` int(10) UNSIGNED NOT NULL,
  `tgl_create` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `social_media`
--

INSERT INTO `social_media` (`id_social`, `social_name`, `name`, `link`, `social_logo`, `id_profile`, `tgl_create`) VALUES
(1, 'Instagram', 'romtoni14', 'https://www.instagram.com/romtoni14/', 'img/social/ig.png', 1, '2019-02-05 00:00:00'),
(2, 'LinkedIn', 'romtoni', 'https://www.linkedin.com/in/romtoni-b9953b12b', 'img/social/linkedin.png', 1, '2019-02-05 00:00:00'),
(3, 'Wordpress', 'romtoni', 'https://romtoni.wordpress.com/', 'img/social/wordpress.png', 1, '2019-02-05 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `software`
--

CREATE TABLE `software` (
  `id_software` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `id_profile` int(10) UNSIGNED NOT NULL,
  `tgl_create` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `software`
--

INSERT INTO `software` (`id_software`, `name`, `icon`, `id_profile`, `tgl_create`) VALUES
(1, 'XAMPP', 'img/software/xampp.png', 1, '2019-02-05 00:00:00'),
(2, 'Notepad++', 'img/software/npp.png', 1, '2019-02-05 00:00:00'),
(3, 'TOAD for Oracle', 'img/software/toad_oracle.png', 1, '2019-02-05 00:00:00'),
(4, 'Oracle 11g', 'img/software/oracle.png', 1, '2019-02-05 00:00:00'),
(5, 'Adobe Dreamweaver CS3', 'img/software/dw.png', 1, '2019-02-05 00:00:00'),
(6, 'Visual Studio Code', 'img/software/vsc.png', 1, '2019-02-05 00:00:00'),
(7, 'GitHub for Desktop', 'img/software/github_desktop.png', 1, '2019-02-05 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_qualification`
--
ALTER TABLE `academic_qualification`
  ADD PRIMARY KEY (`id_academic`),
  ADD KEY `fk_academic` (`id_profile`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id_course`),
  ADD KEY `fk_course` (`id_profile`);

--
-- Indexes for table `key_expertise`
--
ALTER TABLE `key_expertise`
  ADD PRIMARY KEY (`id_expertise`),
  ADD KEY `fk_profile` (`id_profile`);

--
-- Indexes for table `professional_career`
--
ALTER TABLE `professional_career`
  ADD PRIMARY KEY (`id_career`),
  ADD KEY `fk_career` (`id_profile`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id_profile`);

--
-- Indexes for table `skillset`
--
ALTER TABLE `skillset`
  ADD PRIMARY KEY (`id_skill`),
  ADD KEY `fk_skillset` (`id_profile`);

--
-- Indexes for table `social_media`
--
ALTER TABLE `social_media`
  ADD PRIMARY KEY (`id_social`),
  ADD KEY `fk_social` (`id_profile`);

--
-- Indexes for table `software`
--
ALTER TABLE `software`
  ADD KEY `fk_software` (`id_profile`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_qualification`
--
ALTER TABLE `academic_qualification`
  MODIFY `id_academic` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id_course` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `key_expertise`
--
ALTER TABLE `key_expertise`
  MODIFY `id_expertise` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `professional_career`
--
ALTER TABLE `professional_career`
  MODIFY `id_career` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `id_profile` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `skillset`
--
ALTER TABLE `skillset`
  MODIFY `id_skill` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `social_media`
--
ALTER TABLE `social_media`
  MODIFY `id_social` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `academic_qualification`
--
ALTER TABLE `academic_qualification`
  ADD CONSTRAINT `fk_academic` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id_profile`);

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `fk_course` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id_profile`);

--
-- Constraints for table `key_expertise`
--
ALTER TABLE `key_expertise`
  ADD CONSTRAINT `fk_profile` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id_profile`);

--
-- Constraints for table `professional_career`
--
ALTER TABLE `professional_career`
  ADD CONSTRAINT `fk_career` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id_profile`);

--
-- Constraints for table `skillset`
--
ALTER TABLE `skillset`
  ADD CONSTRAINT `fk_skillset` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id_profile`);

--
-- Constraints for table `social_media`
--
ALTER TABLE `social_media`
  ADD CONSTRAINT `fk_social` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id_profile`);

--
-- Constraints for table `software`
--
ALTER TABLE `software`
  ADD CONSTRAINT `fk_software` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id_profile`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
