-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 30, 2025 at 05:54 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sipedesv2`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_activation_attempts`
--

CREATE TABLE `auth_activation_attempts` (
  `id` int UNSIGNED NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups`
--

CREATE TABLE `auth_groups` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `auth_groups`
--

INSERT INTO `auth_groups` (`id`, `name`, `description`) VALUES
(1, 'head', 'Unit manajerial tingkat tinggi yang bertanggung jawab memimpin, mengelola, dan mengkoordinasikan berbagai tim di organisasi untuk mencapai tujuan strategis.'),
(2, 'admin', 'Mengelola dan mengawasi fungsi administratif sistem, termasuk manajemen pengguna dan hak akses, untuk mendukung operasional harian.'),
(3, 'pegawai', 'Mencakup anggota yang fokus pada kehadiran dan aktivitas presensi, dengan akses terbatas untuk memastikan pencatatan dan pemantauan presensi yang akurat.');

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups_permissions`
--

CREATE TABLE `auth_groups_permissions` (
  `group_id` int UNSIGNED NOT NULL DEFAULT '0',
  `permission_id` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `auth_groups_permissions`
--

INSERT INTO `auth_groups_permissions` (`group_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 1),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups_users`
--

CREATE TABLE `auth_groups_users` (
  `group_id` int UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `auth_groups_users`
--

INSERT INTO `auth_groups_users` (`group_id`, `user_id`) VALUES
(1, 1),
(2, 9),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 10),
(3, 11);

-- --------------------------------------------------------

--
-- Table structure for table `auth_logins`
--

CREATE TABLE `auth_logins` (
  `id` int UNSIGNED NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `auth_logins`
--

INSERT INTO `auth_logins` (`id`, `ip_address`, `email`, `user_id`, `date`, `success`) VALUES
(1, '::1', 'jaya@present.com', 1, '2025-06-29 18:48:12', 1),
(2, '::1', 'tamani@present.com', 2, '2025-06-29 19:08:36', 1),
(3, '::1', 'tamani@present.com', 2, '2025-06-29 22:49:12', 1),
(4, '::1', 'kartika@gmail.com', 1, '2025-06-29 23:21:09', 1),
(5, '::1', 'tamani@present.com', 2, '2025-06-29 23:24:25', 1),
(6, '::1', 'tamanindah@gmail.com', NULL, '2025-06-30 06:05:33', 0),
(7, '::1', 'tamani@present.com', 2, '2025-06-30 06:05:44', 1),
(8, '::1', 'kartika@gmail.com', 1, '2025-06-30 07:25:49', 1),
(9, '::1', 'tamani@present.com', 2, '2025-06-30 07:26:22', 1),
(10, '::1', 'pian@gmail.com', 9, '2025-06-30 08:53:57', 1),
(11, '::1', 'yunus@gmail.com', 11, '2025-06-30 11:17:26', 1),
(12, '::1', 'pian@gmail.com', 9, '2025-06-30 11:28:31', 1),
(13, '::1', 'kartika@gmail.com', 1, '2025-06-30 11:48:07', 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permissions`
--

CREATE TABLE `auth_permissions` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `auth_permissions`
--

INSERT INTO `auth_permissions` (`id`, `name`, `description`) VALUES
(1, 'kelola_data', 'Mengelola Data Presensi, Data Lokasi Presensi, Data Jabatan, dan Data Pegawai'),
(2, 'isi_presensi', 'Izin untuk pengguna dapat melakukan dan melihat riwayat kehadiran, serta mengajukan ketidakhadiran.'),
(3, 'kelola_pengajuan_cuti', 'Izin yang memberikan akses untuk menyetujui atau memberikan persetujuan terhadap permintaan cuti yang diajukan oleh karyawan. Izin ini memungkinkan pengguna untuk mengelola dan memproses permintaan cuti melalui sistem.');

-- --------------------------------------------------------

--
-- Table structure for table `auth_reset_attempts`
--

CREATE TABLE `auth_reset_attempts` (
  `id` int UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `auth_tokens`
--

CREATE TABLE `auth_tokens` (
  `id` int UNSIGNED NOT NULL,
  `selector` varchar(255) NOT NULL,
  `hashedValidator` varchar(255) NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `expires` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `auth_users_permissions`
--

CREATE TABLE `auth_users_permissions` (
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `permission_id` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `email_tokens`
--

CREATE TABLE `email_tokens` (
  `id` int UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_time` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `email_tokens`
--

INSERT INTO `email_tokens` (`id`, `email`, `token`, `created_time`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'yunus@gmail.com', '881bd81f26dd5816376e58da2b569459', 1751257332, '2025-06-30 11:22:12', '2025-06-30 11:22:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `id` int UNSIGNED NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`id`, `jabatan`, `slug`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Kepala Desa', 'kepala-desa', NULL, '2025-06-29 18:48:56', NULL),
(2, 'Admin', 'admin', NULL, '2025-06-29 19:11:25', NULL),
(3, 'Pegawai', 'pegawai', NULL, '2025-06-29 19:11:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ketidakhadiran`
--

CREATE TABLE `ketidakhadiran` (
  `id` int UNSIGNED NOT NULL,
  `id_pegawai` int UNSIGNED NOT NULL,
  `tipe_ketidakhadiran` varchar(255) NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_berakhir` date NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `status_pengajuan` varchar(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ketidakhadiran`
--

INSERT INTO `ketidakhadiran` (`id`, `id_pegawai`, `tipe_ketidakhadiran`, `tanggal_mulai`, `tanggal_berakhir`, `deskripsi`, `file`, `status_pengajuan`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 5, 'TUGAS LUAR', '2025-05-07', '2025-05-07', 'abdi aya tugas ngadamel pesawat dibandung', 'SuratKeterangan-harismulyana-2025-05-07-072523.pdf', 'APPROVED', NULL, NULL, NULL),
(4, 9, 'IZIN', '2025-05-28', '2025-05-28', 'Sakit bu, teu tiasa damel deui', 'SuratKeterangan-pian123-2025-05-28-231012.pdf', 'APPROVED', NULL, NULL, NULL),
(5, 9, 'IZIN', '2025-07-01', '2025-07-02', 'Sakit bang karena tidak punya uang', 'SuratKeterangan-pian123-2025-06-30-113858.pdf', 'APPROVED', '2025-06-30 11:38:58', '2025-06-30 11:50:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lokasi_presensi`
--

CREATE TABLE `lokasi_presensi` (
  `id` int UNSIGNED NOT NULL,
  `nama_lokasi` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `alamat_lokasi` varchar(255) NOT NULL,
  `tipe_lokasi` varchar(255) NOT NULL,
  `latitude` varchar(50) NOT NULL,
  `longitude` varchar(50) NOT NULL,
  `radius` int NOT NULL,
  `zona_waktu` varchar(100) NOT NULL,
  `jam_masuk` time NOT NULL,
  `jam_pulang` time NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `lokasi_presensi`
--

INSERT INTO `lokasi_presensi` (`id`, `nama_lokasi`, `slug`, `alamat_lokasi`, `tipe_lokasi`, `latitude`, `longitude`, `radius`, `zona_waktu`, `jam_masuk`, `jam_pulang`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Gedung Jaya Raya', 'gedung-jaya-raya', 'RT.5/RW.2, Gambir, Kecamatan Gambir, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10110', 'Pusat', '-6.195590234157995', '106.81301455947505', 500, 'Asia/Jakarta', '08:00:00', '18:00:00', NULL, NULL, NULL),
(2, 'Rumah Alamahul Bayan', 'rumah-alamahul-bayan', 'JL. SUPARNO, KP CIKARAG, Mekarsari, Kec. Cibatu, Kabupaten Garut, Jawa Barat 44185', 'Cabang', '-7.060838379549278', '107.99596561610389', 100, 'Asia/Jakarta', '08:00:00', '17:00:00', '2025-06-29 19:33:16', '2025-06-29 19:33:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int NOT NULL,
  `batch` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2024-02-02-091537', 'App\\Database\\Migrations\\CreateOPresentTables', 'default', 'App', 1751197614, 1),
(2, '2024-02-02-142048', 'App\\Database\\Migrations\\CreateAuthTables', 'default', 'App', 1751197616, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id` int UNSIGNED NOT NULL,
  `nip` varchar(50) NOT NULL,
  `id_jabatan` int UNSIGNED NOT NULL,
  `id_lokasi_presensi` int UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_handphone` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id`, `nip`, `id_jabatan`, `id_lokasi_presensi`, `nama`, `jenis_kelamin`, `alamat`, `no_handphone`, `foto`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'PEG-0001', 1, 1, 'KARTIKA ERNAWATI, S.AP', 'Perempuan', 'Jl. Harsono RM No.1, Ragunan, Ps. Minggu, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12550', '081234567891', 'default.jpg', NULL, '2025-06-29 19:10:10', NULL),
(3, 'PEG-0003', 3, 1, 'ADE IRMAYANTI', 'Laki-laki', 'Jl. Taman Suropati No.5, RT.5/RW.5, Menteng, Kec. Menteng, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10310', '081287761290', 'default.jpg', NULL, '2025-06-29 19:12:34', NULL),
(4, 'PEG-0004', 3, 1, ' ELIT IWAN SULAEMAN', 'Laki-laki', 'Jl. Harsono RM No.1, Ragunan, Ps. Minggu, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12550', '088912345678', 'default.jpg', '2025-06-29 19:14:40', '2025-06-29 19:14:40', NULL),
(5, 'PEG-0005', 3, 1, 'HARIS MULYANA ', 'Laki-laki', 'Jl. Taman Suropati No.5, RT.5/RW.5, Menteng, Kec. Menteng, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10310', '081275750055', 'default.jpg', '2025-06-29 19:16:17', '2025-06-29 19:16:17', NULL),
(6, 'PEG-0006', 3, 1, 'KEUKEU SETIAPANI', 'Perempuan', 'Jalan Daun Mawar No. 2', '081234567891', 'default.jpg', '2025-06-29 19:18:18', '2025-06-29 19:18:18', NULL),
(7, 'PEG-0007', 3, 1, 'PIRMAN PERMANA', 'Laki-laki', 'Jl. Soepomo no.12 KP. Lewo', '089654367812', 'default.jpg', '2025-06-29 19:20:15', '2025-06-29 19:20:15', NULL),
(8, 'PEG-0008', 3, 1, 'RETNO', 'Laki-laki', 'Jl. Harsono RM No.1, Ragunan, Ps. Minggu, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12550', '088473113412', 'default.jpg', '2025-06-29 19:21:45', '2025-06-29 19:21:45', NULL),
(9, 'PEG-0009', 2, 2, 'PIAN', 'Perempuan', 'Jl. Harsono RM No.1, Ragunan, Ps. Minggu, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12550', '085738512457', 'default.jpg', '2025-06-29 19:23:21', '2025-06-30 11:52:06', NULL),
(10, 'PEG-0010', 3, 1, ' TRIA MUTIARA ', 'Perempuan', 'Jalan Daun Mawar No. 2', '081588654672', 'default.jpg', '2025-06-29 19:24:30', '2025-06-29 19:24:30', NULL),
(11, 'PEG-0011', 3, 2, 'YUNUS SUBAGJA', 'Laki-laki', 'Jl. Taman Suropati No.5, RT.5/RW.5, Menteng, Kec. Menteng, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10310', '088912345678', 'default.jpg', '2025-06-29 19:25:57', '2025-06-30 11:28:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `presensi`
--

CREATE TABLE `presensi` (
  `id` int UNSIGNED NOT NULL,
  `id_pegawai` int UNSIGNED NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `jam_masuk` time NOT NULL,
  `foto_masuk` varchar(255) NOT NULL,
  `tanggal_keluar` date NOT NULL,
  `jam_keluar` time NOT NULL,
  `foto_keluar` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `presensi`
--

INSERT INTO `presensi` (`id`, `id_pegawai`, `tanggal_masuk`, `jam_masuk`, `foto_masuk`, `tanggal_keluar`, `jam_keluar`, `foto_keluar`, `created_at`, `updated_at`, `deleted_at`) VALUES
(110, 3, '2025-01-01', '08:11:16', 'masuk-2025-01-01-08-11-16-default.png', '2025-01-01', '16:53:19', 'keluar-2025-01-01-16-53-19-default.png', NULL, NULL, NULL),
(111, 3, '2025-01-02', '08:52:05', 'masuk-2025-01-02-08-52-05-default.png', '2025-01-02', '16:00:29', 'keluar-2025-01-02-16-00-29-default.png', NULL, NULL, NULL),
(112, 3, '2025-01-03', '07:55:25', 'masuk-2025-01-03-07-55-25-default.png', '2025-01-03', '16:16:00', 'keluar-2025-01-03-16-16-00-default.png', NULL, NULL, NULL),
(113, 3, '2025-01-06', '08:37:47', 'masuk-2025-01-06-08-37-47-default.png', '2025-01-06', '17:10:49', 'keluar-2025-01-06-17-10-49-default.png', NULL, NULL, NULL),
(114, 3, '2025-01-07', '07:14:01', 'masuk-2025-01-07-07-14-01-default.png', '2025-01-07', '16:15:33', 'keluar-2025-01-07-16-15-33-default.png', NULL, NULL, NULL),
(115, 3, '2025-01-08', '07:46:36', 'masuk-2025-01-08-07-46-36-default.png', '2025-01-08', '17:35:05', 'keluar-2025-01-08-17-35-05-default.png', NULL, NULL, NULL),
(116, 3, '2025-01-09', '07:16:32', 'masuk-2025-01-09-07-16-32-default.png', '2025-01-09', '16:36:59', 'keluar-2025-01-09-16-36-59-default.png', NULL, NULL, NULL),
(117, 3, '2025-01-10', '08:07:52', 'masuk-2025-01-10-08-07-52-default.png', '2025-01-10', '16:17:50', 'keluar-2025-01-10-16-17-50-default.png', NULL, NULL, NULL),
(118, 3, '2025-01-13', '08:54:06', 'masuk-2025-01-13-08-54-06-default.png', '2025-01-13', '17:28:24', 'keluar-2025-01-13-17-28-24-default.png', NULL, NULL, NULL),
(119, 3, '2025-01-14', '07:37:12', 'masuk-2025-01-14-07-37-12-default.png', '2025-01-14', '17:14:58', 'keluar-2025-01-14-17-14-58-default.png', NULL, NULL, NULL),
(120, 3, '2025-01-15', '08:48:36', 'masuk-2025-01-15-08-48-36-default.png', '2025-01-15', '17:48:18', 'keluar-2025-01-15-17-48-18-default.png', NULL, NULL, NULL),
(121, 3, '2025-01-16', '07:27:10', 'masuk-2025-01-16-07-27-10-default.png', '2025-01-16', '17:00:41', 'keluar-2025-01-16-17-00-41-default.png', NULL, NULL, NULL),
(122, 3, '2025-01-17', '07:56:36', 'masuk-2025-01-17-07-56-36-default.png', '2025-01-17', '16:05:24', 'keluar-2025-01-17-16-05-24-default.png', NULL, NULL, NULL),
(123, 3, '2025-01-20', '08:42:54', 'masuk-2025-01-20-08-42-54-default.png', '2025-01-20', '17:12:50', 'keluar-2025-01-20-17-12-50-default.png', NULL, NULL, NULL),
(124, 3, '2025-01-21', '08:55:43', 'masuk-2025-01-21-08-55-43-default.png', '2025-01-21', '16:57:13', 'keluar-2025-01-21-16-57-13-default.png', NULL, NULL, NULL),
(125, 3, '2025-01-22', '07:23:11', 'masuk-2025-01-22-07-23-11-default.png', '2025-01-22', '17:11:13', 'keluar-2025-01-22-17-11-13-default.png', NULL, NULL, NULL),
(126, 3, '2025-01-23', '07:54:29', 'masuk-2025-01-23-07-54-29-default.png', '2025-01-23', '16:45:49', 'keluar-2025-01-23-16-45-49-default.png', NULL, NULL, NULL),
(127, 3, '2025-01-24', '07:29:41', 'masuk-2025-01-24-07-29-41-default.png', '2025-01-24', '17:27:10', 'keluar-2025-01-24-17-27-10-default.png', NULL, NULL, NULL),
(128, 3, '2025-01-27', '08:13:15', 'masuk-2025-01-27-08-13-15-default.png', '2025-01-27', '17:21:47', 'keluar-2025-01-27-17-21-47-default.png', NULL, NULL, NULL),
(129, 3, '2025-01-28', '07:07:07', 'masuk-2025-01-28-07-07-07-default.png', '2025-01-28', '17:18:53', 'keluar-2025-01-28-17-18-53-default.png', NULL, NULL, NULL),
(130, 3, '2025-01-29', '07:17:16', 'masuk-2025-01-29-07-17-16-default.png', '2025-01-29', '17:22:40', 'keluar-2025-01-29-17-22-40-default.png', NULL, NULL, NULL),
(131, 3, '2025-01-30', '08:38:01', 'masuk-2025-01-30-08-38-01-default.png', '2025-01-30', '17:35:07', 'keluar-2025-01-30-17-35-07-default.png', NULL, NULL, NULL),
(132, 3, '2025-01-31', '08:15:45', 'masuk-2025-01-31-08-15-45-default.png', '2025-01-31', '17:35:10', 'keluar-2025-01-31-17-35-10-default.png', NULL, NULL, NULL),
(133, 3, '2025-02-03', '08:51:09', 'masuk-2025-02-03-08-51-09-default.png', '2025-02-03', '16:35:28', 'keluar-2025-02-03-16-35-28-default.png', NULL, NULL, NULL),
(134, 3, '2025-02-04', '08:30:35', 'masuk-2025-02-04-08-30-35-default.png', '2025-02-04', '16:39:01', 'keluar-2025-02-04-16-39-01-default.png', NULL, NULL, NULL),
(135, 3, '2025-02-05', '08:34:43', 'masuk-2025-02-05-08-34-43-default.png', '2025-02-05', '16:59:12', 'keluar-2025-02-05-16-59-12-default.png', NULL, NULL, NULL),
(136, 3, '2025-02-06', '08:53:31', 'masuk-2025-02-06-08-53-31-default.png', '2025-02-06', '17:45:48', 'keluar-2025-02-06-17-45-48-default.png', NULL, NULL, NULL),
(137, 3, '2025-02-07', '08:51:34', 'masuk-2025-02-07-08-51-34-default.png', '2025-02-07', '17:48:53', 'keluar-2025-02-07-17-48-53-default.png', NULL, NULL, NULL),
(138, 3, '2025-02-10', '07:33:37', 'masuk-2025-02-10-07-33-37-default.png', '2025-02-10', '17:47:25', 'keluar-2025-02-10-17-47-25-default.png', NULL, NULL, NULL),
(139, 3, '2025-02-11', '08:23:38', 'masuk-2025-02-11-08-23-38-default.png', '2025-02-11', '16:56:23', 'keluar-2025-02-11-16-56-23-default.png', NULL, NULL, NULL),
(140, 3, '2025-02-12', '08:39:10', 'masuk-2025-02-12-08-39-10-default.png', '2025-02-12', '16:05:35', 'keluar-2025-02-12-16-05-35-default.png', NULL, NULL, NULL),
(141, 3, '2025-02-13', '07:57:55', 'masuk-2025-02-13-07-57-55-default.png', '2025-02-13', '16:43:08', 'keluar-2025-02-13-16-43-08-default.png', NULL, NULL, NULL),
(142, 3, '2025-02-14', '08:14:53', 'masuk-2025-02-14-08-14-53-default.png', '2025-02-14', '16:48:15', 'keluar-2025-02-14-16-48-15-default.png', NULL, NULL, NULL),
(143, 3, '2025-02-17', '07:09:00', 'masuk-2025-02-17-07-09-00-default.png', '2025-02-17', '16:09:27', 'keluar-2025-02-17-16-09-27-default.png', NULL, NULL, NULL),
(144, 3, '2025-02-18', '07:04:58', 'masuk-2025-02-18-07-04-58-default.png', '2025-02-18', '17:36:05', 'keluar-2025-02-18-17-36-05-default.png', NULL, NULL, NULL),
(145, 3, '2025-02-19', '08:48:28', 'masuk-2025-02-19-08-48-28-default.png', '2025-02-19', '16:17:46', 'keluar-2025-02-19-16-17-46-default.png', NULL, NULL, NULL),
(146, 3, '2025-02-20', '08:16:08', 'masuk-2025-02-20-08-16-08-default.png', '2025-02-20', '17:18:28', 'keluar-2025-02-20-17-18-28-default.png', NULL, NULL, NULL),
(147, 3, '2025-02-21', '07:50:49', 'masuk-2025-02-21-07-50-49-default.png', '2025-02-21', '17:00:58', 'keluar-2025-02-21-17-00-58-default.png', NULL, NULL, NULL),
(148, 3, '2025-02-24', '08:22:14', 'masuk-2025-02-24-08-22-14-default.png', '2025-02-24', '17:37:09', 'keluar-2025-02-24-17-37-09-default.png', NULL, NULL, NULL),
(149, 3, '2025-02-25', '07:43:01', 'masuk-2025-02-25-07-43-01-default.png', '2025-02-25', '17:36:28', 'keluar-2025-02-25-17-36-28-default.png', NULL, NULL, NULL),
(150, 3, '2025-02-26', '07:06:45', 'masuk-2025-02-26-07-06-45-default.png', '2025-02-26', '17:00:12', 'keluar-2025-02-26-17-00-12-default.png', NULL, NULL, NULL),
(151, 3, '2025-02-27', '08:51:08', 'masuk-2025-02-27-08-51-08-default.png', '2025-02-27', '16:06:05', 'keluar-2025-02-27-16-06-05-default.png', NULL, NULL, NULL),
(152, 3, '2025-02-28', '07:23:18', 'masuk-2025-02-28-07-23-18-default.png', '2025-02-28', '16:39:25', 'keluar-2025-02-28-16-39-25-default.png', NULL, NULL, NULL),
(153, 3, '2025-03-03', '07:24:36', 'masuk-2025-03-03-07-24-36-default.png', '2025-03-03', '17:13:47', 'keluar-2025-03-03-17-13-47-default.png', NULL, NULL, NULL),
(154, 3, '2025-03-04', '08:05:10', 'masuk-2025-03-04-08-05-10-default.png', '2025-03-04', '17:26:36', 'keluar-2025-03-04-17-26-36-default.png', NULL, NULL, NULL),
(155, 3, '2025-03-05', '08:16:41', 'masuk-2025-03-05-08-16-41-default.png', '2025-03-05', '17:13:01', 'keluar-2025-03-05-17-13-01-default.png', NULL, NULL, NULL),
(156, 3, '2025-03-06', '07:25:04', 'masuk-2025-03-06-07-25-04-default.png', '2025-03-06', '17:43:34', 'keluar-2025-03-06-17-43-34-default.png', NULL, NULL, NULL),
(157, 3, '2025-03-07', '07:18:07', 'masuk-2025-03-07-07-18-07-default.png', '2025-03-07', '17:10:26', 'keluar-2025-03-07-17-10-26-default.png', NULL, NULL, NULL),
(158, 3, '2025-03-10', '08:40:04', 'masuk-2025-03-10-08-40-04-default.png', '2025-03-10', '17:22:40', 'keluar-2025-03-10-17-22-40-default.png', NULL, NULL, NULL),
(159, 3, '2025-03-11', '08:52:26', 'masuk-2025-03-11-08-52-26-default.png', '2025-03-11', '17:20:52', 'keluar-2025-03-11-17-20-52-default.png', NULL, NULL, NULL),
(160, 3, '2025-03-12', '07:58:51', 'masuk-2025-03-12-07-58-51-default.png', '2025-03-12', '17:49:27', 'keluar-2025-03-12-17-49-27-default.png', NULL, NULL, NULL),
(161, 3, '2025-03-13', '07:14:35', 'masuk-2025-03-13-07-14-35-default.png', '2025-03-13', '16:59:35', 'keluar-2025-03-13-16-59-35-default.png', NULL, NULL, NULL),
(162, 3, '2025-03-14', '07:18:45', 'masuk-2025-03-14-07-18-45-default.png', '2025-03-14', '16:52:22', 'keluar-2025-03-14-16-52-22-default.png', NULL, NULL, NULL),
(163, 3, '2025-03-17', '08:35:40', 'masuk-2025-03-17-08-35-40-default.png', '2025-03-17', '17:29:22', 'keluar-2025-03-17-17-29-22-default.png', NULL, NULL, NULL),
(164, 3, '2025-03-18', '07:08:49', 'masuk-2025-03-18-07-08-49-default.png', '2025-03-18', '17:31:56', 'keluar-2025-03-18-17-31-56-default.png', NULL, NULL, NULL),
(165, 3, '2025-03-19', '08:08:32', 'masuk-2025-03-19-08-08-32-default.png', '2025-03-19', '17:46:00', 'keluar-2025-03-19-17-46-00-default.png', NULL, NULL, NULL),
(166, 3, '2025-03-20', '08:14:20', 'masuk-2025-03-20-08-14-20-default.png', '2025-03-20', '16:40:50', 'keluar-2025-03-20-16-40-50-default.png', NULL, NULL, NULL),
(167, 3, '2025-03-21', '07:35:07', 'masuk-2025-03-21-07-35-07-default.png', '2025-03-21', '16:08:52', 'keluar-2025-03-21-16-08-52-default.png', NULL, NULL, NULL),
(168, 3, '2025-03-24', '08:18:13', 'masuk-2025-03-24-08-18-13-default.png', '2025-03-24', '16:11:47', 'keluar-2025-03-24-16-11-47-default.png', NULL, NULL, NULL),
(169, 3, '2025-03-25', '08:24:50', 'masuk-2025-03-25-08-24-50-default.png', '2025-03-25', '16:05:20', 'keluar-2025-03-25-16-05-20-default.png', NULL, NULL, NULL),
(170, 3, '2025-03-26', '08:26:51', 'masuk-2025-03-26-08-26-51-default.png', '2025-03-26', '17:26:55', 'keluar-2025-03-26-17-26-55-default.png', NULL, NULL, NULL),
(171, 3, '2025-03-27', '08:42:29', 'masuk-2025-03-27-08-42-29-default.png', '2025-03-27', '17:23:29', 'keluar-2025-03-27-17-23-29-default.png', NULL, NULL, NULL),
(172, 3, '2025-03-28', '08:04:17', 'masuk-2025-03-28-08-04-17-default.png', '2025-03-28', '17:37:52', 'keluar-2025-03-28-17-37-52-default.png', NULL, NULL, NULL),
(173, 3, '2025-03-31', '08:57:12', 'masuk-2025-03-31-08-57-12-default.png', '2025-03-31', '17:56:50', 'keluar-2025-03-31-17-56-50-default.png', NULL, NULL, NULL),
(174, 3, '2025-04-01', '07:17:55', 'masuk-2025-04-01-07-17-55-default.png', '2025-04-01', '17:51:03', 'keluar-2025-04-01-17-51-03-default.png', NULL, NULL, NULL),
(175, 3, '2025-04-02', '07:05:20', 'masuk-2025-04-02-07-05-20-default.png', '2025-04-02', '16:32:57', 'keluar-2025-04-02-16-32-57-default.png', NULL, NULL, NULL),
(176, 3, '2025-04-03', '07:50:20', 'masuk-2025-04-03-07-50-20-default.png', '2025-04-03', '17:36:24', 'keluar-2025-04-03-17-36-24-default.png', NULL, NULL, NULL),
(177, 3, '2025-04-04', '08:17:50', 'masuk-2025-04-04-08-17-50-default.png', '2025-04-04', '17:43:03', 'keluar-2025-04-04-17-43-03-default.png', NULL, NULL, NULL),
(178, 3, '2025-04-07', '07:39:49', 'masuk-2025-04-07-07-39-49-default.png', '2025-04-07', '16:44:33', 'keluar-2025-04-07-16-44-33-default.png', NULL, NULL, NULL),
(179, 3, '2025-04-08', '08:32:15', 'masuk-2025-04-08-08-32-15-default.png', '2025-04-08', '17:20:03', 'keluar-2025-04-08-17-20-03-default.png', NULL, NULL, NULL),
(180, 3, '2025-04-09', '07:36:53', 'masuk-2025-04-09-07-36-53-default.png', '2025-04-09', '17:36:44', 'keluar-2025-04-09-17-36-44-default.png', NULL, NULL, NULL),
(181, 3, '2025-04-10', '07:20:57', 'masuk-2025-04-10-07-20-57-default.png', '2025-04-10', '17:21:54', 'keluar-2025-04-10-17-21-54-default.png', NULL, NULL, NULL),
(182, 3, '2025-04-11', '07:18:07', 'masuk-2025-04-11-07-18-07-default.png', '2025-04-11', '17:31:30', 'keluar-2025-04-11-17-31-30-default.png', NULL, NULL, NULL),
(183, 3, '2025-04-14', '08:37:47', 'masuk-2025-04-14-08-37-47-default.png', '2025-04-14', '16:56:00', 'keluar-2025-04-14-16-56-00-default.png', NULL, NULL, NULL),
(184, 3, '2025-04-15', '08:53:52', 'masuk-2025-04-15-08-53-52-default.png', '2025-04-15', '17:35:16', 'keluar-2025-04-15-17-35-16-default.png', NULL, NULL, NULL),
(185, 3, '2025-04-16', '07:56:12', 'masuk-2025-04-16-07-56-12-default.png', '2025-04-16', '16:37:31', 'keluar-2025-04-16-16-37-31-default.png', NULL, NULL, NULL),
(186, 3, '2025-04-17', '07:22:27', 'masuk-2025-04-17-07-22-27-default.png', '2025-04-17', '16:43:40', 'keluar-2025-04-17-16-43-40-default.png', NULL, NULL, NULL),
(187, 3, '2025-04-18', '07:35:57', 'masuk-2025-04-18-07-35-57-default.png', '2025-04-18', '16:38:49', 'keluar-2025-04-18-16-38-49-default.png', NULL, NULL, NULL),
(188, 3, '2025-04-21', '08:54:01', 'masuk-2025-04-21-08-54-01-default.png', '2025-04-21', '16:26:49', 'keluar-2025-04-21-16-26-49-default.png', NULL, NULL, NULL),
(189, 3, '2025-04-22', '08:08:13', 'masuk-2025-04-22-08-08-13-default.png', '2025-04-22', '17:53:02', 'keluar-2025-04-22-17-53-02-default.png', NULL, NULL, NULL),
(190, 3, '2025-04-23', '08:47:31', 'masuk-2025-04-23-08-47-31-default.png', '2025-04-23', '17:18:43', 'keluar-2025-04-23-17-18-43-default.png', NULL, NULL, NULL),
(191, 3, '2025-04-24', '08:19:11', 'masuk-2025-04-24-08-19-11-default.png', '2025-04-24', '17:26:37', 'keluar-2025-04-24-17-26-37-default.png', NULL, NULL, NULL),
(192, 3, '2025-04-25', '08:26:03', 'masuk-2025-04-25-08-26-03-default.png', '2025-04-25', '17:46:02', 'keluar-2025-04-25-17-46-02-default.png', NULL, NULL, NULL),
(193, 3, '2025-04-28', '07:34:44', 'masuk-2025-04-28-07-34-44-default.png', '2025-04-28', '16:13:36', 'keluar-2025-04-28-16-13-36-default.png', NULL, NULL, NULL),
(194, 3, '2025-04-29', '08:09:22', 'masuk-2025-04-29-08-09-22-default.png', '2025-04-29', '17:34:50', 'keluar-2025-04-29-17-34-50-default.png', NULL, NULL, NULL),
(195, 3, '2025-04-30', '07:15:03', 'masuk-2025-04-30-07-15-03-default.png', '2025-04-30', '16:33:28', 'keluar-2025-04-30-16-33-28-default.png', NULL, NULL, NULL),
(196, 3, '2025-05-01', '07:19:40', 'masuk-2025-05-01-07-19-40-default.png', '2025-05-01', '17:38:44', 'keluar-2025-05-01-17-38-44-default.png', NULL, NULL, NULL),
(197, 3, '2025-05-02', '07:39:37', 'masuk-2025-05-02-07-39-37-default.png', '2025-05-02', '16:04:45', 'keluar-2025-05-02-16-04-45-default.png', NULL, NULL, NULL),
(198, 3, '2025-05-05', '08:26:44', 'masuk-2025-05-05-08-26-44-default.png', '2025-05-05', '16:12:15', 'keluar-2025-05-05-16-12-15-default.png', NULL, NULL, NULL),
(199, 3, '2025-05-06', '08:26:51', 'masuk-2025-05-06-08-26-51-default.png', '2025-05-06', '17:41:12', 'keluar-2025-05-06-17-41-12-default.png', NULL, NULL, NULL),
(200, 3, '2025-05-07', '07:02:38', 'masuk-2025-05-07-07-02-38-default.png', '2025-05-07', '17:00:47', 'keluar-2025-05-07-17-00-47-default.png', NULL, NULL, NULL),
(201, 3, '2025-05-08', '08:15:57', 'masuk-2025-05-08-08-15-57-default.png', '2025-05-08', '16:07:53', 'keluar-2025-05-08-16-07-53-default.png', NULL, NULL, NULL),
(203, 3, '2025-05-12', '08:48:45', 'masuk-2025-05-12-08-48-45-default.png', '2025-05-12', '17:46:38', 'keluar-2025-05-12-17-46-38-default.png', NULL, NULL, NULL),
(204, 3, '2025-05-13', '08:23:30', 'masuk-2025-05-13-08-23-30-default.png', '2025-05-13', '17:06:27', 'keluar-2025-05-13-17-06-27-default.png', NULL, NULL, NULL),
(205, 3, '2025-05-14', '08:49:38', 'masuk-2025-05-14-08-49-38-default.png', '2025-05-14', '16:05:47', 'keluar-2025-05-14-16-05-47-default.png', NULL, NULL, NULL),
(206, 3, '2025-05-15', '07:19:13', 'masuk-2025-05-15-07-19-13-default.png', '2025-05-15', '17:12:50', 'keluar-2025-05-15-17-12-50-default.png', NULL, NULL, NULL),
(207, 3, '2025-05-16', '07:59:30', 'masuk-2025-05-16-07-59-30-default.png', '2025-05-16', '17:59:49', 'keluar-2025-05-16-17-59-49-default.png', NULL, NULL, NULL),
(208, 3, '2025-05-19', '07:56:53', 'masuk-2025-05-19-07-56-53-default.png', '2025-05-19', '16:17:53', 'keluar-2025-05-19-16-17-53-default.png', NULL, NULL, NULL),
(209, 3, '2025-05-20', '07:34:11', 'masuk-2025-05-20-07-34-11-default.png', '2025-05-20', '17:23:38', 'keluar-2025-05-20-17-23-38-default.png', NULL, NULL, NULL),
(210, 3, '2025-05-21', '08:04:25', 'masuk-2025-05-21-08-04-25-default.png', '2025-05-21', '17:27:01', 'keluar-2025-05-21-17-27-01-default.png', NULL, NULL, NULL),
(211, 3, '2025-05-22', '08:07:07', 'masuk-2025-05-22-08-07-07-default.png', '2025-05-22', '17:31:41', 'keluar-2025-05-22-17-31-41-default.png', NULL, NULL, NULL),
(212, 3, '2025-05-23', '08:37:32', 'masuk-2025-05-23-08-37-32-default.png', '2025-05-23', '16:31:26', 'keluar-2025-05-23-16-31-26-default.png', NULL, NULL, NULL),
(213, 3, '2025-05-26', '07:57:43', 'masuk-2025-05-26-07-57-43-default.png', '2025-05-26', '17:33:47', 'keluar-2025-05-26-17-33-47-default.png', NULL, NULL, NULL),
(214, 3, '2025-05-27', '08:44:54', 'masuk-2025-05-27-08-44-54-default.png', '2025-05-27', '16:56:08', 'keluar-2025-05-27-16-56-08-default.png', NULL, NULL, NULL),
(215, 3, '2025-05-28', '08:14:16', 'masuk-2025-05-28-08-14-16-default.png', '2025-05-28', '16:12:51', 'keluar-2025-05-28-16-12-51-default.png', NULL, NULL, NULL),
(216, 3, '2025-05-29', '07:05:27', 'masuk-2025-05-29-07-05-27-default.png', '2025-05-29', '17:00:01', 'keluar-2025-05-29-17-00-01-default.png', NULL, NULL, NULL),
(217, 3, '2025-05-30', '08:36:03', 'masuk-2025-05-30-08-36-03-default.png', '2025-05-30', '17:54:43', 'keluar-2025-05-30-17-54-43-default.png', NULL, NULL, NULL),
(218, 4, '2025-01-01', '07:11:14', 'masuk-2025-01-01-07-11-14-default.png', '2025-01-01', '17:12:56', 'keluar-2025-01-01-17-12-56-default.png', NULL, NULL, NULL),
(219, 4, '2025-01-02', '07:12:57', 'masuk-2025-01-02-07-12-57-default.png', '2025-01-02', '17:29:37', 'keluar-2025-01-02-17-29-37-default.png', NULL, NULL, NULL),
(220, 4, '2025-01-03', '07:13:19', 'masuk-2025-01-03-07-13-19-default.png', '2025-01-03', '17:12:40', 'keluar-2025-01-03-17-12-40-default.png', NULL, NULL, NULL),
(221, 4, '2025-01-06', '07:00:31', 'masuk-2025-01-06-07-00-31-default.png', '2025-01-06', '16:15:40', 'keluar-2025-01-06-16-15-40-default.png', NULL, NULL, NULL),
(222, 4, '2025-01-07', '08:21:47', 'masuk-2025-01-07-08-21-47-default.png', '2025-01-07', '17:25:37', 'keluar-2025-01-07-17-25-37-default.png', NULL, NULL, NULL),
(223, 4, '2025-01-08', '07:52:19', 'masuk-2025-01-08-07-52-19-default.png', '2025-01-08', '16:20:34', 'keluar-2025-01-08-16-20-34-default.png', NULL, NULL, NULL),
(224, 4, '2025-01-09', '07:30:11', 'masuk-2025-01-09-07-30-11-default.png', '2025-01-09', '17:30:56', 'keluar-2025-01-09-17-30-56-default.png', NULL, NULL, NULL),
(225, 4, '2025-01-10', '08:59:59', 'masuk-2025-01-10-08-59-59-default.png', '2025-01-10', '16:23:53', 'keluar-2025-01-10-16-23-53-default.png', NULL, NULL, NULL),
(226, 4, '2025-01-13', '08:18:02', 'masuk-2025-01-13-08-18-02-default.png', '2025-01-13', '16:17:20', 'keluar-2025-01-13-16-17-20-default.png', NULL, NULL, NULL),
(227, 4, '2025-01-14', '08:59:51', 'masuk-2025-01-14-08-59-51-default.png', '2025-01-14', '17:30:43', 'keluar-2025-01-14-17-30-43-default.png', NULL, NULL, NULL),
(228, 4, '2025-01-15', '08:16:20', 'masuk-2025-01-15-08-16-20-default.png', '2025-01-15', '16:33:55', 'keluar-2025-01-15-16-33-55-default.png', NULL, NULL, NULL),
(229, 4, '2025-01-16', '07:51:24', 'masuk-2025-01-16-07-51-24-default.png', '2025-01-16', '17:12:47', 'keluar-2025-01-16-17-12-47-default.png', NULL, NULL, NULL),
(230, 4, '2025-01-17', '08:22:14', 'masuk-2025-01-17-08-22-14-default.png', '2025-01-17', '17:35:11', 'keluar-2025-01-17-17-35-11-default.png', NULL, NULL, NULL),
(231, 4, '2025-01-20', '07:47:24', 'masuk-2025-01-20-07-47-24-default.png', '2025-01-20', '17:14:54', 'keluar-2025-01-20-17-14-54-default.png', NULL, NULL, NULL),
(232, 4, '2025-01-21', '08:47:24', 'masuk-2025-01-21-08-47-24-default.png', '2025-01-21', '17:08:29', 'keluar-2025-01-21-17-08-29-default.png', NULL, NULL, NULL),
(233, 4, '2025-01-22', '07:52:14', 'masuk-2025-01-22-07-52-14-default.png', '2025-01-22', '17:43:04', 'keluar-2025-01-22-17-43-04-default.png', NULL, NULL, NULL),
(234, 4, '2025-01-23', '07:46:46', 'masuk-2025-01-23-07-46-46-default.png', '2025-01-23', '17:49:18', 'keluar-2025-01-23-17-49-18-default.png', NULL, NULL, NULL),
(235, 4, '2025-01-24', '08:25:14', 'masuk-2025-01-24-08-25-14-default.png', '2025-01-24', '17:24:09', 'keluar-2025-01-24-17-24-09-default.png', NULL, NULL, NULL),
(236, 4, '2025-01-27', '07:34:40', 'masuk-2025-01-27-07-34-40-default.png', '2025-01-27', '17:00:27', 'keluar-2025-01-27-17-00-27-default.png', NULL, NULL, NULL),
(237, 4, '2025-01-28', '07:49:47', 'masuk-2025-01-28-07-49-47-default.png', '2025-01-28', '17:13:06', 'keluar-2025-01-28-17-13-06-default.png', NULL, NULL, NULL),
(238, 4, '2025-01-29', '08:25:30', 'masuk-2025-01-29-08-25-30-default.png', '2025-01-29', '16:29:19', 'keluar-2025-01-29-16-29-19-default.png', NULL, NULL, NULL),
(239, 4, '2025-01-30', '08:02:26', 'masuk-2025-01-30-08-02-26-default.png', '2025-01-30', '16:53:11', 'keluar-2025-01-30-16-53-11-default.png', NULL, NULL, NULL),
(240, 4, '2025-01-31', '08:16:20', 'masuk-2025-01-31-08-16-20-default.png', '2025-01-31', '16:37:04', 'keluar-2025-01-31-16-37-04-default.png', NULL, NULL, NULL),
(241, 4, '2025-02-03', '08:47:07', 'masuk-2025-02-03-08-47-07-default.png', '2025-02-03', '17:02:48', 'keluar-2025-02-03-17-02-48-default.png', NULL, NULL, NULL),
(242, 4, '2025-02-04', '08:20:16', 'masuk-2025-02-04-08-20-16-default.png', '2025-02-04', '16:21:57', 'keluar-2025-02-04-16-21-57-default.png', NULL, NULL, NULL),
(243, 4, '2025-02-05', '08:50:22', 'masuk-2025-02-05-08-50-22-default.png', '2025-02-05', '17:18:27', 'keluar-2025-02-05-17-18-27-default.png', NULL, NULL, NULL),
(244, 4, '2025-02-06', '08:34:19', 'masuk-2025-02-06-08-34-19-default.png', '2025-02-06', '16:06:40', 'keluar-2025-02-06-16-06-40-default.png', NULL, NULL, NULL),
(245, 4, '2025-02-07', '07:29:24', 'masuk-2025-02-07-07-29-24-default.png', '2025-02-07', '16:40:10', 'keluar-2025-02-07-16-40-10-default.png', NULL, NULL, NULL),
(246, 4, '2025-02-10', '08:17:13', 'masuk-2025-02-10-08-17-13-default.png', '2025-02-10', '16:47:13', 'keluar-2025-02-10-16-47-13-default.png', NULL, NULL, NULL),
(247, 4, '2025-02-11', '08:01:30', 'masuk-2025-02-11-08-01-30-default.png', '2025-02-11', '16:36:59', 'keluar-2025-02-11-16-36-59-default.png', NULL, NULL, NULL),
(248, 4, '2025-02-12', '07:58:54', 'masuk-2025-02-12-07-58-54-default.png', '2025-02-12', '16:43:51', 'keluar-2025-02-12-16-43-51-default.png', NULL, NULL, NULL),
(249, 4, '2025-02-13', '07:16:10', 'masuk-2025-02-13-07-16-10-default.png', '2025-02-13', '16:46:42', 'keluar-2025-02-13-16-46-42-default.png', NULL, NULL, NULL),
(250, 4, '2025-02-14', '08:36:20', 'masuk-2025-02-14-08-36-20-default.png', '2025-02-14', '17:22:17', 'keluar-2025-02-14-17-22-17-default.png', NULL, NULL, NULL),
(251, 4, '2025-02-17', '08:11:06', 'masuk-2025-02-17-08-11-06-default.png', '2025-02-17', '17:47:49', 'keluar-2025-02-17-17-47-49-default.png', NULL, NULL, NULL),
(252, 4, '2025-02-18', '07:03:37', 'masuk-2025-02-18-07-03-37-default.png', '2025-02-18', '17:28:13', 'keluar-2025-02-18-17-28-13-default.png', NULL, NULL, NULL),
(253, 4, '2025-02-19', '08:10:30', 'masuk-2025-02-19-08-10-30-default.png', '2025-02-19', '16:06:15', 'keluar-2025-02-19-16-06-15-default.png', NULL, NULL, NULL),
(254, 4, '2025-02-20', '08:08:12', 'masuk-2025-02-20-08-08-12-default.png', '2025-02-20', '16:53:36', 'keluar-2025-02-20-16-53-36-default.png', NULL, NULL, NULL),
(255, 4, '2025-02-21', '07:36:59', 'masuk-2025-02-21-07-36-59-default.png', '2025-02-21', '17:13:01', 'keluar-2025-02-21-17-13-01-default.png', NULL, NULL, NULL),
(256, 4, '2025-02-24', '08:35:23', 'masuk-2025-02-24-08-35-23-default.png', '2025-02-24', '16:13:42', 'keluar-2025-02-24-16-13-42-default.png', NULL, NULL, NULL),
(257, 4, '2025-02-25', '08:22:53', 'masuk-2025-02-25-08-22-53-default.png', '2025-02-25', '17:43:26', 'keluar-2025-02-25-17-43-26-default.png', NULL, NULL, NULL),
(258, 4, '2025-02-26', '07:36:19', 'masuk-2025-02-26-07-36-19-default.png', '2025-02-26', '17:32:05', 'keluar-2025-02-26-17-32-05-default.png', NULL, NULL, NULL),
(259, 4, '2025-02-27', '08:20:28', 'masuk-2025-02-27-08-20-28-default.png', '2025-02-27', '16:08:51', 'keluar-2025-02-27-16-08-51-default.png', NULL, NULL, NULL),
(260, 4, '2025-02-28', '07:16:05', 'masuk-2025-02-28-07-16-05-default.png', '2025-02-28', '16:04:10', 'keluar-2025-02-28-16-04-10-default.png', NULL, NULL, NULL),
(261, 4, '2025-03-03', '07:56:24', 'masuk-2025-03-03-07-56-24-default.png', '2025-03-03', '16:44:07', 'keluar-2025-03-03-16-44-07-default.png', NULL, NULL, NULL),
(262, 4, '2025-03-04', '08:20:58', 'masuk-2025-03-04-08-20-58-default.png', '2025-03-04', '16:54:33', 'keluar-2025-03-04-16-54-33-default.png', NULL, NULL, NULL),
(263, 4, '2025-03-05', '08:25:44', 'masuk-2025-03-05-08-25-44-default.png', '2025-03-05', '16:36:03', 'keluar-2025-03-05-16-36-03-default.png', NULL, NULL, NULL),
(264, 4, '2025-03-06', '08:44:25', 'masuk-2025-03-06-08-44-25-default.png', '2025-03-06', '17:21:10', 'keluar-2025-03-06-17-21-10-default.png', NULL, NULL, NULL),
(265, 4, '2025-03-07', '08:12:23', 'masuk-2025-03-07-08-12-23-default.png', '2025-03-07', '16:10:01', 'keluar-2025-03-07-16-10-01-default.png', NULL, NULL, NULL),
(266, 4, '2025-03-10', '08:51:13', 'masuk-2025-03-10-08-51-13-default.png', '2025-03-10', '16:45:05', 'keluar-2025-03-10-16-45-05-default.png', NULL, NULL, NULL),
(267, 4, '2025-03-11', '08:50:07', 'masuk-2025-03-11-08-50-07-default.png', '2025-03-11', '17:40:32', 'keluar-2025-03-11-17-40-32-default.png', NULL, NULL, NULL),
(268, 4, '2025-03-12', '08:11:22', 'masuk-2025-03-12-08-11-22-default.png', '2025-03-12', '17:23:08', 'keluar-2025-03-12-17-23-08-default.png', NULL, NULL, NULL),
(269, 4, '2025-03-13', '07:47:46', 'masuk-2025-03-13-07-47-46-default.png', '2025-03-13', '17:04:49', 'keluar-2025-03-13-17-04-49-default.png', NULL, NULL, NULL),
(270, 4, '2025-03-14', '07:37:47', 'masuk-2025-03-14-07-37-47-default.png', '2025-03-14', '16:33:11', 'keluar-2025-03-14-16-33-11-default.png', NULL, NULL, NULL),
(271, 4, '2025-03-17', '08:18:15', 'masuk-2025-03-17-08-18-15-default.png', '2025-03-17', '16:20:38', 'keluar-2025-03-17-16-20-38-default.png', NULL, NULL, NULL),
(272, 4, '2025-03-18', '08:21:46', 'masuk-2025-03-18-08-21-46-default.png', '2025-03-18', '16:44:09', 'keluar-2025-03-18-16-44-09-default.png', NULL, NULL, NULL),
(273, 4, '2025-03-19', '08:55:46', 'masuk-2025-03-19-08-55-46-default.png', '2025-03-19', '17:26:38', 'keluar-2025-03-19-17-26-38-default.png', NULL, NULL, NULL),
(274, 4, '2025-03-20', '07:05:10', 'masuk-2025-03-20-07-05-10-default.png', '2025-03-20', '16:51:04', 'keluar-2025-03-20-16-51-04-default.png', NULL, NULL, NULL),
(275, 4, '2025-03-21', '08:54:12', 'masuk-2025-03-21-08-54-12-default.png', '2025-03-21', '16:41:53', 'keluar-2025-03-21-16-41-53-default.png', NULL, NULL, NULL),
(276, 4, '2025-03-24', '08:42:39', 'masuk-2025-03-24-08-42-39-default.png', '2025-03-24', '17:34:18', 'keluar-2025-03-24-17-34-18-default.png', NULL, NULL, NULL),
(277, 4, '2025-03-25', '07:24:59', 'masuk-2025-03-25-07-24-59-default.png', '2025-03-25', '16:31:47', 'keluar-2025-03-25-16-31-47-default.png', NULL, NULL, NULL),
(278, 4, '2025-03-26', '07:26:23', 'masuk-2025-03-26-07-26-23-default.png', '2025-03-26', '17:14:01', 'keluar-2025-03-26-17-14-01-default.png', NULL, NULL, NULL),
(279, 4, '2025-03-27', '07:48:13', 'masuk-2025-03-27-07-48-13-default.png', '2025-03-27', '16:57:39', 'keluar-2025-03-27-16-57-39-default.png', NULL, NULL, NULL),
(280, 4, '2025-03-28', '08:46:58', 'masuk-2025-03-28-08-46-58-default.png', '2025-03-28', '17:39:38', 'keluar-2025-03-28-17-39-38-default.png', NULL, NULL, NULL),
(281, 4, '2025-03-31', '08:29:20', 'masuk-2025-03-31-08-29-20-default.png', '2025-03-31', '16:32:31', 'keluar-2025-03-31-16-32-31-default.png', NULL, NULL, NULL),
(282, 4, '2025-04-01', '08:06:29', 'masuk-2025-04-01-08-06-29-default.png', '2025-04-01', '17:41:04', 'keluar-2025-04-01-17-41-04-default.png', NULL, NULL, NULL),
(283, 4, '2025-04-02', '07:19:51', 'masuk-2025-04-02-07-19-51-default.png', '2025-04-02', '17:43:45', 'keluar-2025-04-02-17-43-45-default.png', NULL, NULL, NULL),
(284, 4, '2025-04-03', '07:00:05', 'masuk-2025-04-03-07-00-05-default.png', '2025-04-03', '17:52:20', 'keluar-2025-04-03-17-52-20-default.png', NULL, NULL, NULL),
(285, 4, '2025-04-04', '08:17:24', 'masuk-2025-04-04-08-17-24-default.png', '2025-04-04', '16:58:57', 'keluar-2025-04-04-16-58-57-default.png', NULL, NULL, NULL),
(286, 4, '2025-04-07', '08:59:52', 'masuk-2025-04-07-08-59-52-default.png', '2025-04-07', '17:32:10', 'keluar-2025-04-07-17-32-10-default.png', NULL, NULL, NULL),
(287, 4, '2025-04-08', '08:54:34', 'masuk-2025-04-08-08-54-34-default.png', '2025-04-08', '17:25:02', 'keluar-2025-04-08-17-25-02-default.png', NULL, NULL, NULL),
(288, 4, '2025-04-09', '07:29:36', 'masuk-2025-04-09-07-29-36-default.png', '2025-04-09', '16:50:05', 'keluar-2025-04-09-16-50-05-default.png', NULL, NULL, NULL),
(289, 4, '2025-04-10', '07:37:08', 'masuk-2025-04-10-07-37-08-default.png', '2025-04-10', '17:52:09', 'keluar-2025-04-10-17-52-09-default.png', NULL, NULL, NULL),
(290, 4, '2025-04-11', '08:31:56', 'masuk-2025-04-11-08-31-56-default.png', '2025-04-11', '16:41:57', 'keluar-2025-04-11-16-41-57-default.png', NULL, NULL, NULL),
(291, 4, '2025-04-14', '07:02:59', 'masuk-2025-04-14-07-02-59-default.png', '2025-04-14', '17:01:08', 'keluar-2025-04-14-17-01-08-default.png', NULL, NULL, NULL),
(292, 4, '2025-04-15', '07:48:02', 'masuk-2025-04-15-07-48-02-default.png', '2025-04-15', '17:38:04', 'keluar-2025-04-15-17-38-04-default.png', NULL, NULL, NULL),
(293, 4, '2025-04-16', '08:54:53', 'masuk-2025-04-16-08-54-53-default.png', '2025-04-16', '17:01:31', 'keluar-2025-04-16-17-01-31-default.png', NULL, NULL, NULL),
(294, 4, '2025-04-17', '08:49:02', 'masuk-2025-04-17-08-49-02-default.png', '2025-04-17', '17:00:23', 'keluar-2025-04-17-17-00-23-default.png', NULL, NULL, NULL),
(295, 4, '2025-04-18', '08:07:24', 'masuk-2025-04-18-08-07-24-default.png', '2025-04-18', '16:03:21', 'keluar-2025-04-18-16-03-21-default.png', NULL, NULL, NULL),
(296, 4, '2025-04-21', '07:27:02', 'masuk-2025-04-21-07-27-02-default.png', '2025-04-21', '16:18:37', 'keluar-2025-04-21-16-18-37-default.png', NULL, NULL, NULL),
(297, 4, '2025-04-22', '07:20:50', 'masuk-2025-04-22-07-20-50-default.png', '2025-04-22', '16:26:05', 'keluar-2025-04-22-16-26-05-default.png', NULL, NULL, NULL),
(298, 4, '2025-04-23', '07:20:01', 'masuk-2025-04-23-07-20-01-default.png', '2025-04-23', '16:06:36', 'keluar-2025-04-23-16-06-36-default.png', NULL, NULL, NULL),
(299, 4, '2025-04-24', '08:40:10', 'masuk-2025-04-24-08-40-10-default.png', '2025-04-24', '17:37:32', 'keluar-2025-04-24-17-37-32-default.png', NULL, NULL, NULL),
(300, 4, '2025-04-25', '08:05:12', 'masuk-2025-04-25-08-05-12-default.png', '2025-04-25', '17:20:42', 'keluar-2025-04-25-17-20-42-default.png', NULL, NULL, NULL),
(301, 4, '2025-04-28', '07:29:41', 'masuk-2025-04-28-07-29-41-default.png', '2025-04-28', '16:47:10', 'keluar-2025-04-28-16-47-10-default.png', NULL, NULL, NULL),
(302, 4, '2025-04-29', '08:50:52', 'masuk-2025-04-29-08-50-52-default.png', '2025-04-29', '16:32:57', 'keluar-2025-04-29-16-32-57-default.png', NULL, NULL, NULL),
(303, 4, '2025-04-30', '07:04:41', 'masuk-2025-04-30-07-04-41-default.png', '2025-04-30', '17:05:33', 'keluar-2025-04-30-17-05-33-default.png', NULL, NULL, NULL),
(304, 4, '2025-05-01', '07:32:05', 'masuk-2025-05-01-07-32-05-default.png', '2025-05-01', '16:51:48', 'keluar-2025-05-01-16-51-48-default.png', NULL, NULL, NULL),
(305, 4, '2025-05-02', '07:55:39', 'masuk-2025-05-02-07-55-39-default.png', '2025-05-02', '16:41:25', 'keluar-2025-05-02-16-41-25-default.png', NULL, NULL, NULL),
(306, 4, '2025-05-05', '08:41:05', 'masuk-2025-05-05-08-41-05-default.png', '2025-05-05', '17:01:22', 'keluar-2025-05-05-17-01-22-default.png', NULL, NULL, NULL),
(307, 4, '2025-05-06', '07:53:00', 'masuk-2025-05-06-07-53-00-default.png', '2025-05-06', '17:12:51', 'keluar-2025-05-06-17-12-51-default.png', NULL, NULL, NULL),
(308, 4, '2025-05-07', '07:34:08', 'masuk-2025-05-07-07-34-08-default.png', '2025-05-07', '16:23:59', 'keluar-2025-05-07-16-23-59-default.png', NULL, NULL, NULL),
(309, 4, '2025-05-08', '07:50:38', 'masuk-2025-05-08-07-50-38-default.png', '2025-05-08', '16:37:08', 'keluar-2025-05-08-16-37-08-default.png', NULL, NULL, NULL),
(310, 4, '2025-05-09', '07:24:03', 'masuk-2025-05-09-07-24-03-default.png', '2025-05-09', '16:46:34', 'keluar-2025-05-09-16-46-34-default.png', NULL, NULL, NULL),
(311, 4, '2025-05-12', '07:16:29', 'masuk-2025-05-12-07-16-29-default.png', '2025-05-12', '17:42:20', 'keluar-2025-05-12-17-42-20-default.png', NULL, NULL, NULL),
(312, 4, '2025-05-13', '07:04:41', 'masuk-2025-05-13-07-04-41-default.png', '2025-05-13', '16:14:53', 'keluar-2025-05-13-16-14-53-default.png', NULL, NULL, NULL),
(313, 4, '2025-05-14', '07:15:26', 'masuk-2025-05-14-07-15-26-default.png', '2025-05-14', '16:47:19', 'keluar-2025-05-14-16-47-19-default.png', NULL, NULL, NULL),
(314, 4, '2025-05-15', '08:03:27', 'masuk-2025-05-15-08-03-27-default.png', '2025-05-15', '16:09:35', 'keluar-2025-05-15-16-09-35-default.png', NULL, NULL, NULL),
(315, 4, '2025-05-16', '08:44:41', 'masuk-2025-05-16-08-44-41-default.png', '2025-05-16', '16:07:07', 'keluar-2025-05-16-16-07-07-default.png', NULL, NULL, NULL),
(316, 4, '2025-05-19', '07:58:57', 'masuk-2025-05-19-07-58-57-default.png', '2025-05-19', '17:24:15', 'keluar-2025-05-19-17-24-15-default.png', NULL, NULL, NULL),
(317, 4, '2025-05-20', '08:05:12', 'masuk-2025-05-20-08-05-12-default.png', '2025-05-20', '17:29:47', 'keluar-2025-05-20-17-29-47-default.png', NULL, NULL, NULL),
(318, 4, '2025-05-21', '07:58:46', 'masuk-2025-05-21-07-58-46-default.png', '2025-05-21', '17:08:16', 'keluar-2025-05-21-17-08-16-default.png', NULL, NULL, NULL),
(319, 4, '2025-05-22', '07:39:50', 'masuk-2025-05-22-07-39-50-default.png', '2025-05-22', '17:05:44', 'keluar-2025-05-22-17-05-44-default.png', NULL, NULL, NULL),
(320, 4, '2025-05-23', '08:03:40', 'masuk-2025-05-23-08-03-40-default.png', '2025-05-23', '17:46:39', 'keluar-2025-05-23-17-46-39-default.png', NULL, NULL, NULL),
(321, 4, '2025-05-26', '08:04:13', 'masuk-2025-05-26-08-04-13-default.png', '2025-05-26', '16:10:52', 'keluar-2025-05-26-16-10-52-default.png', NULL, NULL, NULL),
(322, 4, '2025-05-27', '07:21:02', 'masuk-2025-05-27-07-21-02-default.png', '2025-05-27', '16:10:21', 'keluar-2025-05-27-16-10-21-default.png', NULL, NULL, NULL),
(323, 4, '2025-05-28', '08:25:10', 'masuk-2025-05-28-08-25-10-default.png', '2025-05-28', '16:36:13', 'keluar-2025-05-28-16-36-13-default.png', NULL, NULL, NULL),
(324, 4, '2025-05-29', '08:26:14', 'masuk-2025-05-29-08-26-14-default.png', '2025-05-29', '16:35:54', 'keluar-2025-05-29-16-35-54-default.png', NULL, NULL, NULL),
(325, 4, '2025-05-30', '07:04:21', 'masuk-2025-05-30-07-04-21-default.png', '2025-05-30', '17:35:36', 'keluar-2025-05-30-17-35-36-default.png', NULL, NULL, NULL),
(326, 5, '2025-01-01', '08:41:23', 'masuk-2025-01-01-08-41-23-default.png', '2025-01-01', '17:47:06', 'keluar-2025-01-01-17-47-06-default.png', NULL, NULL, NULL),
(327, 5, '2025-01-02', '07:40:31', 'masuk-2025-01-02-07-40-31-default.png', '2025-01-02', '17:19:20', 'keluar-2025-01-02-17-19-20-default.png', NULL, NULL, NULL),
(328, 5, '2025-01-03', '07:08:09', 'masuk-2025-01-03-07-08-09-default.png', '2025-01-03', '17:06:56', 'keluar-2025-01-03-17-06-56-default.png', NULL, NULL, NULL),
(329, 5, '2025-01-06', '07:11:45', 'masuk-2025-01-06-07-11-45-default.png', '2025-01-06', '16:39:05', 'keluar-2025-01-06-16-39-05-default.png', NULL, NULL, NULL),
(330, 5, '2025-01-07', '07:44:37', 'masuk-2025-01-07-07-44-37-default.png', '2025-01-07', '16:52:03', 'keluar-2025-01-07-16-52-03-default.png', NULL, NULL, NULL),
(331, 5, '2025-01-08', '07:18:13', 'masuk-2025-01-08-07-18-13-default.png', '2025-01-08', '17:31:35', 'keluar-2025-01-08-17-31-35-default.png', NULL, NULL, NULL),
(332, 5, '2025-01-09', '07:45:08', 'masuk-2025-01-09-07-45-08-default.png', '2025-01-09', '17:43:23', 'keluar-2025-01-09-17-43-23-default.png', NULL, NULL, NULL),
(333, 5, '2025-01-10', '07:06:01', 'masuk-2025-01-10-07-06-01-default.png', '2025-01-10', '16:44:24', 'keluar-2025-01-10-16-44-24-default.png', NULL, NULL, NULL),
(334, 5, '2025-01-13', '07:43:25', 'masuk-2025-01-13-07-43-25-default.png', '2025-01-13', '17:31:12', 'keluar-2025-01-13-17-31-12-default.png', NULL, NULL, NULL),
(335, 5, '2025-01-14', '08:41:12', 'masuk-2025-01-14-08-41-12-default.png', '2025-01-14', '16:29:47', 'keluar-2025-01-14-16-29-47-default.png', NULL, NULL, NULL),
(336, 5, '2025-01-15', '07:26:40', 'masuk-2025-01-15-07-26-40-default.png', '2025-01-15', '16:30:32', 'keluar-2025-01-15-16-30-32-default.png', NULL, NULL, NULL),
(337, 5, '2025-01-16', '08:05:03', 'masuk-2025-01-16-08-05-03-default.png', '2025-01-16', '16:58:29', 'keluar-2025-01-16-16-58-29-default.png', NULL, NULL, NULL),
(338, 5, '2025-01-17', '08:20:14', 'masuk-2025-01-17-08-20-14-default.png', '2025-01-17', '16:31:38', 'keluar-2025-01-17-16-31-38-default.png', NULL, NULL, NULL),
(339, 5, '2025-01-20', '07:42:23', 'masuk-2025-01-20-07-42-23-default.png', '2025-01-20', '17:32:56', 'keluar-2025-01-20-17-32-56-default.png', NULL, NULL, NULL),
(340, 5, '2025-01-21', '07:48:57', 'masuk-2025-01-21-07-48-57-default.png', '2025-01-21', '16:01:44', 'keluar-2025-01-21-16-01-44-default.png', NULL, NULL, NULL),
(341, 5, '2025-01-22', '07:52:36', 'masuk-2025-01-22-07-52-36-default.png', '2025-01-22', '17:21:11', 'keluar-2025-01-22-17-21-11-default.png', NULL, NULL, NULL),
(342, 5, '2025-01-23', '07:57:25', 'masuk-2025-01-23-07-57-25-default.png', '2025-01-23', '17:35:48', 'keluar-2025-01-23-17-35-48-default.png', NULL, NULL, NULL),
(343, 5, '2025-01-24', '08:32:56', 'masuk-2025-01-24-08-32-56-default.png', '2025-01-24', '16:35:03', 'keluar-2025-01-24-16-35-03-default.png', NULL, NULL, NULL),
(344, 5, '2025-01-27', '07:10:43', 'masuk-2025-01-27-07-10-43-default.png', '2025-01-27', '17:05:52', 'keluar-2025-01-27-17-05-52-default.png', NULL, NULL, NULL),
(345, 5, '2025-01-28', '07:21:30', 'masuk-2025-01-28-07-21-30-default.png', '2025-01-28', '16:40:58', 'keluar-2025-01-28-16-40-58-default.png', NULL, NULL, NULL),
(346, 5, '2025-01-29', '08:33:04', 'masuk-2025-01-29-08-33-04-default.png', '2025-01-29', '17:23:24', 'keluar-2025-01-29-17-23-24-default.png', NULL, NULL, NULL),
(347, 5, '2025-01-30', '08:27:13', 'masuk-2025-01-30-08-27-13-default.png', '2025-01-30', '17:31:09', 'keluar-2025-01-30-17-31-09-default.png', NULL, NULL, NULL),
(348, 5, '2025-01-31', '08:09:10', 'masuk-2025-01-31-08-09-10-default.png', '2025-01-31', '16:47:44', 'keluar-2025-01-31-16-47-44-default.png', NULL, NULL, NULL),
(349, 5, '2025-02-03', '08:14:46', 'masuk-2025-02-03-08-14-46-default.png', '2025-02-03', '17:48:22', 'keluar-2025-02-03-17-48-22-default.png', NULL, NULL, NULL),
(350, 5, '2025-02-04', '08:44:01', 'masuk-2025-02-04-08-44-01-default.png', '2025-02-04', '16:49:16', 'keluar-2025-02-04-16-49-16-default.png', NULL, NULL, NULL),
(351, 5, '2025-02-05', '07:53:28', 'masuk-2025-02-05-07-53-28-default.png', '2025-02-05', '17:35:02', 'keluar-2025-02-05-17-35-02-default.png', NULL, NULL, NULL),
(352, 5, '2025-02-06', '08:10:02', 'masuk-2025-02-06-08-10-02-default.png', '2025-02-06', '17:17:23', 'keluar-2025-02-06-17-17-23-default.png', NULL, NULL, NULL),
(353, 5, '2025-02-07', '08:33:45', 'masuk-2025-02-07-08-33-45-default.png', '2025-02-07', '16:25:35', 'keluar-2025-02-07-16-25-35-default.png', NULL, NULL, NULL),
(354, 5, '2025-02-10', '07:09:01', 'masuk-2025-02-10-07-09-01-default.png', '2025-02-10', '16:44:55', 'keluar-2025-02-10-16-44-55-default.png', NULL, NULL, NULL),
(355, 5, '2025-02-11', '07:54:52', 'masuk-2025-02-11-07-54-52-default.png', '2025-02-11', '16:27:45', 'keluar-2025-02-11-16-27-45-default.png', NULL, NULL, NULL),
(356, 5, '2025-02-12', '07:44:20', 'masuk-2025-02-12-07-44-20-default.png', '2025-02-12', '16:13:17', 'keluar-2025-02-12-16-13-17-default.png', NULL, NULL, NULL),
(357, 5, '2025-02-13', '07:16:34', 'masuk-2025-02-13-07-16-34-default.png', '2025-02-13', '16:25:39', 'keluar-2025-02-13-16-25-39-default.png', NULL, NULL, NULL),
(358, 5, '2025-02-14', '07:22:25', 'masuk-2025-02-14-07-22-25-default.png', '2025-02-14', '16:03:22', 'keluar-2025-02-14-16-03-22-default.png', NULL, NULL, NULL),
(359, 5, '2025-02-17', '07:23:11', 'masuk-2025-02-17-07-23-11-default.png', '2025-02-17', '17:51:55', 'keluar-2025-02-17-17-51-55-default.png', NULL, NULL, NULL),
(360, 5, '2025-02-18', '07:45:25', 'masuk-2025-02-18-07-45-25-default.png', '2025-02-18', '17:15:13', 'keluar-2025-02-18-17-15-13-default.png', NULL, NULL, NULL),
(361, 5, '2025-02-19', '07:47:48', 'masuk-2025-02-19-07-47-48-default.png', '2025-02-19', '17:36:58', 'keluar-2025-02-19-17-36-58-default.png', NULL, NULL, NULL),
(362, 5, '2025-02-20', '07:39:13', 'masuk-2025-02-20-07-39-13-default.png', '2025-02-20', '17:49:53', 'keluar-2025-02-20-17-49-53-default.png', NULL, NULL, NULL),
(363, 5, '2025-02-21', '07:46:57', 'masuk-2025-02-21-07-46-57-default.png', '2025-02-21', '17:19:55', 'keluar-2025-02-21-17-19-55-default.png', NULL, NULL, NULL),
(364, 5, '2025-02-24', '08:03:16', 'masuk-2025-02-24-08-03-16-default.png', '2025-02-24', '16:27:48', 'keluar-2025-02-24-16-27-48-default.png', NULL, NULL, NULL),
(365, 5, '2025-02-25', '07:31:55', 'masuk-2025-02-25-07-31-55-default.png', '2025-02-25', '17:09:10', 'keluar-2025-02-25-17-09-10-default.png', NULL, NULL, NULL),
(366, 5, '2025-02-26', '08:35:35', 'masuk-2025-02-26-08-35-35-default.png', '2025-02-26', '17:19:33', 'keluar-2025-02-26-17-19-33-default.png', NULL, NULL, NULL),
(367, 5, '2025-02-27', '07:49:18', 'masuk-2025-02-27-07-49-18-default.png', '2025-02-27', '16:17:00', 'keluar-2025-02-27-16-17-00-default.png', NULL, NULL, NULL),
(368, 5, '2025-02-28', '07:48:01', 'masuk-2025-02-28-07-48-01-default.png', '2025-02-28', '17:40:45', 'keluar-2025-02-28-17-40-45-default.png', NULL, NULL, NULL),
(369, 5, '2025-03-03', '07:44:48', 'masuk-2025-03-03-07-44-48-default.png', '2025-03-03', '16:54:37', 'keluar-2025-03-03-16-54-37-default.png', NULL, NULL, NULL),
(370, 5, '2025-03-04', '08:06:12', 'masuk-2025-03-04-08-06-12-default.png', '2025-03-04', '17:25:21', 'keluar-2025-03-04-17-25-21-default.png', NULL, NULL, NULL),
(371, 5, '2025-03-05', '07:14:07', 'masuk-2025-03-05-07-14-07-default.png', '2025-03-05', '16:20:28', 'keluar-2025-03-05-16-20-28-default.png', NULL, NULL, NULL),
(372, 5, '2025-03-06', '07:50:29', 'masuk-2025-03-06-07-50-29-default.png', '2025-03-06', '16:05:37', 'keluar-2025-03-06-16-05-37-default.png', NULL, NULL, NULL),
(373, 5, '2025-03-07', '07:28:55', 'masuk-2025-03-07-07-28-55-default.png', '2025-03-07', '16:37:37', 'keluar-2025-03-07-16-37-37-default.png', NULL, NULL, NULL),
(374, 5, '2025-03-10', '08:24:52', 'masuk-2025-03-10-08-24-52-default.png', '2025-03-10', '17:00:09', 'keluar-2025-03-10-17-00-09-default.png', NULL, NULL, NULL),
(375, 5, '2025-03-11', '08:39:50', 'masuk-2025-03-11-08-39-50-default.png', '2025-03-11', '16:26:46', 'keluar-2025-03-11-16-26-46-default.png', NULL, NULL, NULL),
(376, 5, '2025-03-12', '08:04:48', 'masuk-2025-03-12-08-04-48-default.png', '2025-03-12', '17:01:49', 'keluar-2025-03-12-17-01-49-default.png', NULL, NULL, NULL),
(377, 5, '2025-03-13', '07:55:20', 'masuk-2025-03-13-07-55-20-default.png', '2025-03-13', '16:57:26', 'keluar-2025-03-13-16-57-26-default.png', NULL, NULL, NULL),
(378, 5, '2025-03-14', '07:00:35', 'masuk-2025-03-14-07-00-35-default.png', '2025-03-14', '17:39:37', 'keluar-2025-03-14-17-39-37-default.png', NULL, NULL, NULL),
(379, 5, '2025-03-17', '07:08:34', 'masuk-2025-03-17-07-08-34-default.png', '2025-03-17', '16:53:13', 'keluar-2025-03-17-16-53-13-default.png', NULL, NULL, NULL),
(380, 5, '2025-03-18', '07:06:58', 'masuk-2025-03-18-07-06-58-default.png', '2025-03-18', '16:34:26', 'keluar-2025-03-18-16-34-26-default.png', NULL, NULL, NULL),
(381, 5, '2025-03-19', '08:38:15', 'masuk-2025-03-19-08-38-15-default.png', '2025-03-19', '16:42:08', 'keluar-2025-03-19-16-42-08-default.png', NULL, NULL, NULL),
(382, 5, '2025-03-20', '07:50:41', 'masuk-2025-03-20-07-50-41-default.png', '2025-03-20', '17:46:21', 'keluar-2025-03-20-17-46-21-default.png', NULL, NULL, NULL),
(383, 5, '2025-03-21', '08:04:36', 'masuk-2025-03-21-08-04-36-default.png', '2025-03-21', '16:03:38', 'keluar-2025-03-21-16-03-38-default.png', NULL, NULL, NULL),
(384, 5, '2025-03-24', '08:40:31', 'masuk-2025-03-24-08-40-31-default.png', '2025-03-24', '17:22:35', 'keluar-2025-03-24-17-22-35-default.png', NULL, NULL, NULL),
(385, 5, '2025-03-25', '08:14:07', 'masuk-2025-03-25-08-14-07-default.png', '2025-03-25', '16:53:02', 'keluar-2025-03-25-16-53-02-default.png', NULL, NULL, NULL),
(386, 5, '2025-03-26', '07:51:53', 'masuk-2025-03-26-07-51-53-default.png', '2025-03-26', '17:24:41', 'keluar-2025-03-26-17-24-41-default.png', NULL, NULL, NULL),
(387, 5, '2025-03-27', '07:53:47', 'masuk-2025-03-27-07-53-47-default.png', '2025-03-27', '16:10:49', 'keluar-2025-03-27-16-10-49-default.png', NULL, NULL, NULL),
(388, 5, '2025-03-28', '07:34:05', 'masuk-2025-03-28-07-34-05-default.png', '2025-03-28', '16:46:44', 'keluar-2025-03-28-16-46-44-default.png', NULL, NULL, NULL),
(389, 5, '2025-03-31', '08:00:54', 'masuk-2025-03-31-08-00-54-default.png', '2025-03-31', '16:48:56', 'keluar-2025-03-31-16-48-56-default.png', NULL, NULL, NULL),
(390, 5, '2025-04-01', '07:25:55', 'masuk-2025-04-01-07-25-55-default.png', '2025-04-01', '16:31:55', 'keluar-2025-04-01-16-31-55-default.png', NULL, NULL, NULL),
(391, 5, '2025-04-02', '07:04:15', 'masuk-2025-04-02-07-04-15-default.png', '2025-04-02', '17:57:07', 'keluar-2025-04-02-17-57-07-default.png', NULL, NULL, NULL),
(392, 5, '2025-04-03', '08:48:15', 'masuk-2025-04-03-08-48-15-default.png', '2025-04-03', '16:42:01', 'keluar-2025-04-03-16-42-01-default.png', NULL, NULL, NULL),
(393, 5, '2025-04-04', '08:25:26', 'masuk-2025-04-04-08-25-26-default.png', '2025-04-04', '16:06:14', 'keluar-2025-04-04-16-06-14-default.png', NULL, NULL, NULL),
(394, 5, '2025-04-07', '07:13:30', 'masuk-2025-04-07-07-13-30-default.png', '2025-04-07', '17:35:29', 'keluar-2025-04-07-17-35-29-default.png', NULL, NULL, NULL),
(395, 5, '2025-04-08', '07:37:19', 'masuk-2025-04-08-07-37-19-default.png', '2025-04-08', '17:43:57', 'keluar-2025-04-08-17-43-57-default.png', NULL, NULL, NULL),
(396, 5, '2025-04-09', '07:33:34', 'masuk-2025-04-09-07-33-34-default.png', '2025-04-09', '16:39:38', 'keluar-2025-04-09-16-39-38-default.png', NULL, NULL, NULL),
(397, 5, '2025-04-10', '08:02:51', 'masuk-2025-04-10-08-02-51-default.png', '2025-04-10', '16:31:06', 'keluar-2025-04-10-16-31-06-default.png', NULL, NULL, NULL),
(398, 5, '2025-04-11', '07:12:22', 'masuk-2025-04-11-07-12-22-default.png', '2025-04-11', '17:38:30', 'keluar-2025-04-11-17-38-30-default.png', NULL, NULL, NULL),
(399, 5, '2025-04-14', '07:25:22', 'masuk-2025-04-14-07-25-22-default.png', '2025-04-14', '17:01:17', 'keluar-2025-04-14-17-01-17-default.png', NULL, NULL, NULL),
(400, 5, '2025-04-15', '07:49:47', 'masuk-2025-04-15-07-49-47-default.png', '2025-04-15', '16:15:47', 'keluar-2025-04-15-16-15-47-default.png', NULL, NULL, NULL),
(401, 5, '2025-04-16', '07:32:34', 'masuk-2025-04-16-07-32-34-default.png', '2025-04-16', '16:47:25', 'keluar-2025-04-16-16-47-25-default.png', NULL, NULL, NULL),
(402, 5, '2025-04-17', '07:56:15', 'masuk-2025-04-17-07-56-15-default.png', '2025-04-17', '17:10:35', 'keluar-2025-04-17-17-10-35-default.png', NULL, NULL, NULL),
(403, 5, '2025-04-18', '08:04:28', 'masuk-2025-04-18-08-04-28-default.png', '2025-04-18', '16:00:54', 'keluar-2025-04-18-16-00-54-default.png', NULL, NULL, NULL),
(404, 5, '2025-04-21', '08:47:10', 'masuk-2025-04-21-08-47-10-default.png', '2025-04-21', '16:33:41', 'keluar-2025-04-21-16-33-41-default.png', NULL, NULL, NULL),
(405, 5, '2025-04-22', '07:31:33', 'masuk-2025-04-22-07-31-33-default.png', '2025-04-22', '16:23:15', 'keluar-2025-04-22-16-23-15-default.png', NULL, NULL, NULL),
(406, 5, '2025-04-23', '08:07:48', 'masuk-2025-04-23-08-07-48-default.png', '2025-04-23', '16:47:11', 'keluar-2025-04-23-16-47-11-default.png', NULL, NULL, NULL),
(407, 5, '2025-04-24', '08:28:54', 'masuk-2025-04-24-08-28-54-default.png', '2025-04-24', '16:23:16', 'keluar-2025-04-24-16-23-16-default.png', NULL, NULL, NULL),
(408, 5, '2025-04-25', '07:08:11', 'masuk-2025-04-25-07-08-11-default.png', '2025-04-25', '16:37:38', 'keluar-2025-04-25-16-37-38-default.png', NULL, NULL, NULL),
(409, 5, '2025-04-28', '08:18:36', 'masuk-2025-04-28-08-18-36-default.png', '2025-04-28', '16:01:25', 'keluar-2025-04-28-16-01-25-default.png', NULL, NULL, NULL),
(410, 5, '2025-04-29', '08:47:28', 'masuk-2025-04-29-08-47-28-default.png', '2025-04-29', '16:15:28', 'keluar-2025-04-29-16-15-28-default.png', NULL, NULL, NULL),
(411, 5, '2025-04-30', '07:16:09', 'masuk-2025-04-30-07-16-09-default.png', '2025-04-30', '17:08:12', 'keluar-2025-04-30-17-08-12-default.png', NULL, NULL, NULL),
(412, 5, '2025-05-01', '07:13:23', 'masuk-2025-05-01-07-13-23-default.png', '2025-05-01', '16:37:15', 'keluar-2025-05-01-16-37-15-default.png', NULL, NULL, NULL),
(413, 5, '2025-05-02', '07:38:52', 'masuk-2025-05-02-07-38-52-default.png', '2025-05-02', '17:31:14', 'keluar-2025-05-02-17-31-14-default.png', NULL, NULL, NULL),
(414, 5, '2025-05-05', '08:42:31', 'masuk-2025-05-05-08-42-31-default.png', '2025-05-05', '16:00:43', 'keluar-2025-05-05-16-00-43-default.png', NULL, NULL, NULL),
(415, 5, '2025-05-06', '07:02:58', 'masuk-2025-05-06-07-02-58-default.png', '2025-05-06', '16:22:54', 'keluar-2025-05-06-16-22-54-default.png', NULL, NULL, NULL),
(417, 5, '2025-05-08', '08:25:44', 'masuk-2025-05-08-08-25-44-default.png', '2025-05-08', '16:28:07', 'keluar-2025-05-08-16-28-07-default.png', NULL, NULL, NULL),
(418, 5, '2025-05-09', '07:18:41', 'masuk-2025-05-09-07-18-41-default.png', '2025-05-09', '16:44:17', 'keluar-2025-05-09-16-44-17-default.png', NULL, NULL, NULL),
(419, 5, '2025-05-12', '07:53:08', 'masuk-2025-05-12-07-53-08-default.png', '2025-05-12', '16:27:25', 'keluar-2025-05-12-16-27-25-default.png', NULL, NULL, NULL),
(420, 5, '2025-05-13', '08:55:49', 'masuk-2025-05-13-08-55-49-default.png', '2025-05-13', '17:07:33', 'keluar-2025-05-13-17-07-33-default.png', NULL, NULL, NULL);
INSERT INTO `presensi` (`id`, `id_pegawai`, `tanggal_masuk`, `jam_masuk`, `foto_masuk`, `tanggal_keluar`, `jam_keluar`, `foto_keluar`, `created_at`, `updated_at`, `deleted_at`) VALUES
(421, 5, '2025-05-14', '07:39:17', 'masuk-2025-05-14-07-39-17-default.png', '2025-05-14', '16:08:34', 'keluar-2025-05-14-16-08-34-default.png', NULL, NULL, NULL),
(422, 5, '2025-05-15', '07:22:29', 'masuk-2025-05-15-07-22-29-default.png', '2025-05-15', '17:13:04', 'keluar-2025-05-15-17-13-04-default.png', NULL, NULL, NULL),
(424, 5, '2025-05-19', '07:03:20', 'masuk-2025-05-19-07-03-20-default.png', '2025-05-19', '16:00:14', 'keluar-2025-05-19-16-00-14-default.png', NULL, NULL, NULL),
(425, 5, '2025-05-20', '08:15:05', 'masuk-2025-05-20-08-15-05-default.png', '2025-05-20', '17:52:26', 'keluar-2025-05-20-17-52-26-default.png', NULL, NULL, NULL),
(426, 5, '2025-05-21', '08:27:38', 'masuk-2025-05-21-08-27-38-default.png', '2025-05-21', '16:10:02', 'keluar-2025-05-21-16-10-02-default.png', NULL, NULL, NULL),
(427, 5, '2025-05-22', '07:24:14', 'masuk-2025-05-22-07-24-14-default.png', '2025-05-22', '17:22:23', 'keluar-2025-05-22-17-22-23-default.png', NULL, NULL, NULL),
(428, 5, '2025-05-23', '07:32:31', 'masuk-2025-05-23-07-32-31-default.png', '2025-05-23', '17:19:00', 'keluar-2025-05-23-17-19-00-default.png', NULL, NULL, NULL),
(430, 5, '2025-05-27', '07:00:14', 'masuk-2025-05-27-07-00-14-default.png', '2025-05-27', '16:04:15', 'keluar-2025-05-27-16-04-15-default.png', NULL, NULL, NULL),
(431, 5, '2025-05-28', '07:22:41', 'masuk-2025-05-28-07-22-41-default.png', '2025-05-28', '17:57:45', 'keluar-2025-05-28-17-57-45-default.png', NULL, NULL, NULL),
(432, 5, '2025-05-29', '07:26:34', 'masuk-2025-05-29-07-26-34-default.png', '2025-05-29', '16:52:49', 'keluar-2025-05-29-16-52-49-default.png', NULL, NULL, NULL),
(433, 5, '2025-05-30', '08:38:47', 'masuk-2025-05-30-08-38-47-default.png', '2025-05-30', '17:09:23', 'keluar-2025-05-30-17-09-23-default.png', NULL, NULL, NULL),
(434, 6, '2025-01-01', '08:44:51', 'masuk-2025-01-01-08-44-51-default.png', '2025-01-01', '16:17:28', 'keluar-2025-01-01-16-17-28-default.png', NULL, NULL, NULL),
(435, 6, '2025-01-02', '07:09:28', 'masuk-2025-01-02-07-09-28-default.png', '2025-01-02', '16:40:08', 'keluar-2025-01-02-16-40-08-default.png', NULL, NULL, NULL),
(436, 6, '2025-01-03', '07:28:48', 'masuk-2025-01-03-07-28-48-default.png', '2025-01-03', '16:16:02', 'keluar-2025-01-03-16-16-02-default.png', NULL, NULL, NULL),
(437, 6, '2025-01-06', '07:55:56', 'masuk-2025-01-06-07-55-56-default.png', '2025-01-06', '17:51:49', 'keluar-2025-01-06-17-51-49-default.png', NULL, NULL, NULL),
(438, 6, '2025-01-07', '07:34:19', 'masuk-2025-01-07-07-34-19-default.png', '2025-01-07', '17:57:00', 'keluar-2025-01-07-17-57-00-default.png', NULL, NULL, NULL),
(439, 6, '2025-01-08', '07:18:51', 'masuk-2025-01-08-07-18-51-default.png', '2025-01-08', '17:58:15', 'keluar-2025-01-08-17-58-15-default.png', NULL, NULL, NULL),
(440, 6, '2025-01-09', '07:39:12', 'masuk-2025-01-09-07-39-12-default.png', '2025-01-09', '16:05:55', 'keluar-2025-01-09-16-05-55-default.png', NULL, NULL, NULL),
(441, 6, '2025-01-10', '07:02:15', 'masuk-2025-01-10-07-02-15-default.png', '2025-01-10', '16:41:58', 'keluar-2025-01-10-16-41-58-default.png', NULL, NULL, NULL),
(442, 6, '2025-01-13', '07:18:05', 'masuk-2025-01-13-07-18-05-default.png', '2025-01-13', '16:53:31', 'keluar-2025-01-13-16-53-31-default.png', NULL, NULL, NULL),
(443, 6, '2025-01-14', '08:46:56', 'masuk-2025-01-14-08-46-56-default.png', '2025-01-14', '16:58:30', 'keluar-2025-01-14-16-58-30-default.png', NULL, NULL, NULL),
(444, 6, '2025-01-15', '08:05:19', 'masuk-2025-01-15-08-05-19-default.png', '2025-01-15', '17:37:36', 'keluar-2025-01-15-17-37-36-default.png', NULL, NULL, NULL),
(445, 6, '2025-01-16', '07:46:52', 'masuk-2025-01-16-07-46-52-default.png', '2025-01-16', '17:31:48', 'keluar-2025-01-16-17-31-48-default.png', NULL, NULL, NULL),
(446, 6, '2025-01-17', '07:52:38', 'masuk-2025-01-17-07-52-38-default.png', '2025-01-17', '16:28:20', 'keluar-2025-01-17-16-28-20-default.png', NULL, NULL, NULL),
(447, 6, '2025-01-20', '08:52:18', 'masuk-2025-01-20-08-52-18-default.png', '2025-01-20', '16:49:41', 'keluar-2025-01-20-16-49-41-default.png', NULL, NULL, NULL),
(448, 6, '2025-01-21', '07:38:28', 'masuk-2025-01-21-07-38-28-default.png', '2025-01-21', '16:05:51', 'keluar-2025-01-21-16-05-51-default.png', NULL, NULL, NULL),
(449, 6, '2025-01-22', '08:53:01', 'masuk-2025-01-22-08-53-01-default.png', '2025-01-22', '17:45:51', 'keluar-2025-01-22-17-45-51-default.png', NULL, NULL, NULL),
(450, 6, '2025-01-23', '07:35:02', 'masuk-2025-01-23-07-35-02-default.png', '2025-01-23', '17:59:25', 'keluar-2025-01-23-17-59-25-default.png', NULL, NULL, NULL),
(451, 6, '2025-01-24', '08:11:05', 'masuk-2025-01-24-08-11-05-default.png', '2025-01-24', '17:42:22', 'keluar-2025-01-24-17-42-22-default.png', NULL, NULL, NULL),
(452, 6, '2025-01-27', '08:59:10', 'masuk-2025-01-27-08-59-10-default.png', '2025-01-27', '16:11:14', 'keluar-2025-01-27-16-11-14-default.png', NULL, NULL, NULL),
(453, 6, '2025-01-28', '07:00:37', 'masuk-2025-01-28-07-00-37-default.png', '2025-01-28', '16:39:14', 'keluar-2025-01-28-16-39-14-default.png', NULL, NULL, NULL),
(454, 6, '2025-01-29', '07:05:55', 'masuk-2025-01-29-07-05-55-default.png', '2025-01-29', '16:34:41', 'keluar-2025-01-29-16-34-41-default.png', NULL, NULL, NULL),
(455, 6, '2025-01-30', '07:17:58', 'masuk-2025-01-30-07-17-58-default.png', '2025-01-30', '16:39:47', 'keluar-2025-01-30-16-39-47-default.png', NULL, NULL, NULL),
(456, 6, '2025-01-31', '08:06:23', 'masuk-2025-01-31-08-06-23-default.png', '2025-01-31', '17:12:53', 'keluar-2025-01-31-17-12-53-default.png', NULL, NULL, NULL),
(457, 6, '2025-02-03', '08:35:17', 'masuk-2025-02-03-08-35-17-default.png', '2025-02-03', '17:24:56', 'keluar-2025-02-03-17-24-56-default.png', NULL, NULL, NULL),
(458, 6, '2025-02-04', '07:48:21', 'masuk-2025-02-04-07-48-21-default.png', '2025-02-04', '16:44:14', 'keluar-2025-02-04-16-44-14-default.png', NULL, NULL, NULL),
(459, 6, '2025-02-05', '08:23:21', 'masuk-2025-02-05-08-23-21-default.png', '2025-02-05', '17:31:37', 'keluar-2025-02-05-17-31-37-default.png', NULL, NULL, NULL),
(460, 6, '2025-02-06', '07:53:24', 'masuk-2025-02-06-07-53-24-default.png', '2025-02-06', '17:23:23', 'keluar-2025-02-06-17-23-23-default.png', NULL, NULL, NULL),
(461, 6, '2025-02-07', '08:21:04', 'masuk-2025-02-07-08-21-04-default.png', '2025-02-07', '16:08:05', 'keluar-2025-02-07-16-08-05-default.png', NULL, NULL, NULL),
(462, 6, '2025-02-10', '07:56:10', 'masuk-2025-02-10-07-56-10-default.png', '2025-02-10', '17:06:56', 'keluar-2025-02-10-17-06-56-default.png', NULL, NULL, NULL),
(463, 6, '2025-02-11', '08:25:02', 'masuk-2025-02-11-08-25-02-default.png', '2025-02-11', '17:21:38', 'keluar-2025-02-11-17-21-38-default.png', NULL, NULL, NULL),
(464, 6, '2025-02-12', '07:14:44', 'masuk-2025-02-12-07-14-44-default.png', '2025-02-12', '16:35:34', 'keluar-2025-02-12-16-35-34-default.png', NULL, NULL, NULL),
(465, 6, '2025-02-13', '08:59:07', 'masuk-2025-02-13-08-59-07-default.png', '2025-02-13', '16:13:50', 'keluar-2025-02-13-16-13-50-default.png', NULL, NULL, NULL),
(466, 6, '2025-02-14', '07:32:33', 'masuk-2025-02-14-07-32-33-default.png', '2025-02-14', '16:57:22', 'keluar-2025-02-14-16-57-22-default.png', NULL, NULL, NULL),
(467, 6, '2025-02-17', '07:42:03', 'masuk-2025-02-17-07-42-03-default.png', '2025-02-17', '16:00:51', 'keluar-2025-02-17-16-00-51-default.png', NULL, NULL, NULL),
(468, 6, '2025-02-18', '08:40:52', 'masuk-2025-02-18-08-40-52-default.png', '2025-02-18', '17:09:30', 'keluar-2025-02-18-17-09-30-default.png', NULL, NULL, NULL),
(469, 6, '2025-02-19', '08:26:40', 'masuk-2025-02-19-08-26-40-default.png', '2025-02-19', '17:33:35', 'keluar-2025-02-19-17-33-35-default.png', NULL, NULL, NULL),
(470, 6, '2025-02-20', '08:10:08', 'masuk-2025-02-20-08-10-08-default.png', '2025-02-20', '16:43:43', 'keluar-2025-02-20-16-43-43-default.png', NULL, NULL, NULL),
(471, 6, '2025-02-21', '07:16:57', 'masuk-2025-02-21-07-16-57-default.png', '2025-02-21', '17:21:41', 'keluar-2025-02-21-17-21-41-default.png', NULL, NULL, NULL),
(472, 6, '2025-02-24', '07:46:08', 'masuk-2025-02-24-07-46-08-default.png', '2025-02-24', '16:05:15', 'keluar-2025-02-24-16-05-15-default.png', NULL, NULL, NULL),
(473, 6, '2025-02-25', '08:17:29', 'masuk-2025-02-25-08-17-29-default.png', '2025-02-25', '17:33:48', 'keluar-2025-02-25-17-33-48-default.png', NULL, NULL, NULL),
(474, 6, '2025-02-26', '07:30:39', 'masuk-2025-02-26-07-30-39-default.png', '2025-02-26', '16:47:11', 'keluar-2025-02-26-16-47-11-default.png', NULL, NULL, NULL),
(475, 6, '2025-02-27', '08:20:44', 'masuk-2025-02-27-08-20-44-default.png', '2025-02-27', '16:48:58', 'keluar-2025-02-27-16-48-58-default.png', NULL, NULL, NULL),
(476, 6, '2025-02-28', '08:11:19', 'masuk-2025-02-28-08-11-19-default.png', '2025-02-28', '16:24:01', 'keluar-2025-02-28-16-24-01-default.png', NULL, NULL, NULL),
(477, 6, '2025-03-03', '08:48:00', 'masuk-2025-03-03-08-48-00-default.png', '2025-03-03', '17:14:34', 'keluar-2025-03-03-17-14-34-default.png', NULL, NULL, NULL),
(478, 6, '2025-03-04', '08:00:10', 'masuk-2025-03-04-08-00-10-default.png', '2025-03-04', '17:25:15', 'keluar-2025-03-04-17-25-15-default.png', NULL, NULL, NULL),
(479, 6, '2025-03-05', '08:16:48', 'masuk-2025-03-05-08-16-48-default.png', '2025-03-05', '17:26:48', 'keluar-2025-03-05-17-26-48-default.png', NULL, NULL, NULL),
(480, 6, '2025-03-06', '08:28:12', 'masuk-2025-03-06-08-28-12-default.png', '2025-03-06', '17:10:47', 'keluar-2025-03-06-17-10-47-default.png', NULL, NULL, NULL),
(481, 6, '2025-03-07', '07:44:23', 'masuk-2025-03-07-07-44-23-default.png', '2025-03-07', '17:23:57', 'keluar-2025-03-07-17-23-57-default.png', NULL, NULL, NULL),
(482, 6, '2025-03-10', '07:08:50', 'masuk-2025-03-10-07-08-50-default.png', '2025-03-10', '16:26:34', 'keluar-2025-03-10-16-26-34-default.png', NULL, NULL, NULL),
(483, 6, '2025-03-11', '08:26:23', 'masuk-2025-03-11-08-26-23-default.png', '2025-03-11', '17:29:33', 'keluar-2025-03-11-17-29-33-default.png', NULL, NULL, NULL),
(484, 6, '2025-03-12', '08:45:05', 'masuk-2025-03-12-08-45-05-default.png', '2025-03-12', '16:17:07', 'keluar-2025-03-12-16-17-07-default.png', NULL, NULL, NULL),
(485, 6, '2025-03-13', '08:22:49', 'masuk-2025-03-13-08-22-49-default.png', '2025-03-13', '16:28:05', 'keluar-2025-03-13-16-28-05-default.png', NULL, NULL, NULL),
(486, 6, '2025-03-14', '08:20:51', 'masuk-2025-03-14-08-20-51-default.png', '2025-03-14', '16:17:10', 'keluar-2025-03-14-16-17-10-default.png', NULL, NULL, NULL),
(487, 6, '2025-03-17', '08:06:43', 'masuk-2025-03-17-08-06-43-default.png', '2025-03-17', '16:03:33', 'keluar-2025-03-17-16-03-33-default.png', NULL, NULL, NULL),
(488, 6, '2025-03-18', '08:03:45', 'masuk-2025-03-18-08-03-45-default.png', '2025-03-18', '17:46:28', 'keluar-2025-03-18-17-46-28-default.png', NULL, NULL, NULL),
(489, 6, '2025-03-19', '08:09:42', 'masuk-2025-03-19-08-09-42-default.png', '2025-03-19', '16:53:59', 'keluar-2025-03-19-16-53-59-default.png', NULL, NULL, NULL),
(490, 6, '2025-03-20', '08:27:04', 'masuk-2025-03-20-08-27-04-default.png', '2025-03-20', '17:22:29', 'keluar-2025-03-20-17-22-29-default.png', NULL, NULL, NULL),
(491, 6, '2025-03-21', '08:51:49', 'masuk-2025-03-21-08-51-49-default.png', '2025-03-21', '16:55:16', 'keluar-2025-03-21-16-55-16-default.png', NULL, NULL, NULL),
(492, 6, '2025-03-24', '07:31:58', 'masuk-2025-03-24-07-31-58-default.png', '2025-03-24', '17:56:15', 'keluar-2025-03-24-17-56-15-default.png', NULL, NULL, NULL),
(493, 6, '2025-03-25', '07:31:47', 'masuk-2025-03-25-07-31-47-default.png', '2025-03-25', '16:35:24', 'keluar-2025-03-25-16-35-24-default.png', NULL, NULL, NULL),
(494, 6, '2025-03-26', '07:42:56', 'masuk-2025-03-26-07-42-56-default.png', '2025-03-26', '16:47:29', 'keluar-2025-03-26-16-47-29-default.png', NULL, NULL, NULL),
(495, 6, '2025-03-27', '08:33:59', 'masuk-2025-03-27-08-33-59-default.png', '2025-03-27', '17:22:27', 'keluar-2025-03-27-17-22-27-default.png', NULL, NULL, NULL),
(496, 6, '2025-03-28', '07:42:13', 'masuk-2025-03-28-07-42-13-default.png', '2025-03-28', '16:57:21', 'keluar-2025-03-28-16-57-21-default.png', NULL, NULL, NULL),
(497, 6, '2025-03-31', '07:51:44', 'masuk-2025-03-31-07-51-44-default.png', '2025-03-31', '16:44:31', 'keluar-2025-03-31-16-44-31-default.png', NULL, NULL, NULL),
(498, 6, '2025-04-01', '08:16:33', 'masuk-2025-04-01-08-16-33-default.png', '2025-04-01', '17:10:39', 'keluar-2025-04-01-17-10-39-default.png', NULL, NULL, NULL),
(499, 6, '2025-04-02', '07:31:58', 'masuk-2025-04-02-07-31-58-default.png', '2025-04-02', '16:45:55', 'keluar-2025-04-02-16-45-55-default.png', NULL, NULL, NULL),
(500, 6, '2025-04-03', '07:52:50', 'masuk-2025-04-03-07-52-50-default.png', '2025-04-03', '17:59:58', 'keluar-2025-04-03-17-59-58-default.png', NULL, NULL, NULL),
(501, 6, '2025-04-04', '08:44:20', 'masuk-2025-04-04-08-44-20-default.png', '2025-04-04', '16:50:32', 'keluar-2025-04-04-16-50-32-default.png', NULL, NULL, NULL),
(502, 6, '2025-04-07', '08:47:01', 'masuk-2025-04-07-08-47-01-default.png', '2025-04-07', '17:38:19', 'keluar-2025-04-07-17-38-19-default.png', NULL, NULL, NULL),
(503, 6, '2025-04-08', '08:19:44', 'masuk-2025-04-08-08-19-44-default.png', '2025-04-08', '17:27:54', 'keluar-2025-04-08-17-27-54-default.png', NULL, NULL, NULL),
(504, 6, '2025-04-09', '07:37:35', 'masuk-2025-04-09-07-37-35-default.png', '2025-04-09', '17:26:19', 'keluar-2025-04-09-17-26-19-default.png', NULL, NULL, NULL),
(505, 6, '2025-04-10', '08:24:41', 'masuk-2025-04-10-08-24-41-default.png', '2025-04-10', '16:57:57', 'keluar-2025-04-10-16-57-57-default.png', NULL, NULL, NULL),
(506, 6, '2025-04-11', '08:54:02', 'masuk-2025-04-11-08-54-02-default.png', '2025-04-11', '17:20:14', 'keluar-2025-04-11-17-20-14-default.png', NULL, NULL, NULL),
(507, 6, '2025-04-14', '08:18:58', 'masuk-2025-04-14-08-18-58-default.png', '2025-04-14', '16:06:44', 'keluar-2025-04-14-16-06-44-default.png', NULL, NULL, NULL),
(508, 6, '2025-04-15', '07:28:13', 'masuk-2025-04-15-07-28-13-default.png', '2025-04-15', '17:00:45', 'keluar-2025-04-15-17-00-45-default.png', NULL, NULL, NULL),
(509, 6, '2025-04-16', '07:34:05', 'masuk-2025-04-16-07-34-05-default.png', '2025-04-16', '17:35:06', 'keluar-2025-04-16-17-35-06-default.png', NULL, NULL, NULL),
(510, 6, '2025-04-17', '08:40:51', 'masuk-2025-04-17-08-40-51-default.png', '2025-04-17', '16:27:27', 'keluar-2025-04-17-16-27-27-default.png', NULL, NULL, NULL),
(511, 6, '2025-04-18', '08:41:30', 'masuk-2025-04-18-08-41-30-default.png', '2025-04-18', '17:42:19', 'keluar-2025-04-18-17-42-19-default.png', NULL, NULL, NULL),
(512, 6, '2025-04-21', '07:50:01', 'masuk-2025-04-21-07-50-01-default.png', '2025-04-21', '17:15:37', 'keluar-2025-04-21-17-15-37-default.png', NULL, NULL, NULL),
(513, 6, '2025-04-22', '08:18:01', 'masuk-2025-04-22-08-18-01-default.png', '2025-04-22', '17:18:26', 'keluar-2025-04-22-17-18-26-default.png', NULL, NULL, NULL),
(514, 6, '2025-04-23', '07:04:22', 'masuk-2025-04-23-07-04-22-default.png', '2025-04-23', '16:53:48', 'keluar-2025-04-23-16-53-48-default.png', NULL, NULL, NULL),
(515, 6, '2025-04-24', '07:12:27', 'masuk-2025-04-24-07-12-27-default.png', '2025-04-24', '17:52:17', 'keluar-2025-04-24-17-52-17-default.png', NULL, NULL, NULL),
(516, 6, '2025-04-25', '07:35:36', 'masuk-2025-04-25-07-35-36-default.png', '2025-04-25', '16:33:00', 'keluar-2025-04-25-16-33-00-default.png', NULL, NULL, NULL),
(517, 6, '2025-04-28', '07:02:53', 'masuk-2025-04-28-07-02-53-default.png', '2025-04-28', '16:17:41', 'keluar-2025-04-28-16-17-41-default.png', NULL, NULL, NULL),
(518, 6, '2025-04-29', '07:55:58', 'masuk-2025-04-29-07-55-58-default.png', '2025-04-29', '17:47:55', 'keluar-2025-04-29-17-47-55-default.png', NULL, NULL, NULL),
(519, 6, '2025-04-30', '07:22:46', 'masuk-2025-04-30-07-22-46-default.png', '2025-04-30', '16:56:14', 'keluar-2025-04-30-16-56-14-default.png', NULL, NULL, NULL),
(520, 6, '2025-05-01', '08:49:25', 'masuk-2025-05-01-08-49-25-default.png', '2025-05-01', '17:24:45', 'keluar-2025-05-01-17-24-45-default.png', NULL, NULL, NULL),
(521, 6, '2025-05-02', '08:52:37', 'masuk-2025-05-02-08-52-37-default.png', '2025-05-02', '17:29:53', 'keluar-2025-05-02-17-29-53-default.png', NULL, NULL, NULL),
(522, 6, '2025-05-05', '07:48:59', 'masuk-2025-05-05-07-48-59-default.png', '2025-05-05', '16:31:23', 'keluar-2025-05-05-16-31-23-default.png', NULL, NULL, NULL),
(523, 6, '2025-05-06', '07:01:53', 'masuk-2025-05-06-07-01-53-default.png', '2025-05-06', '16:37:41', 'keluar-2025-05-06-16-37-41-default.png', NULL, NULL, NULL),
(524, 6, '2025-05-07', '08:28:23', 'masuk-2025-05-07-08-28-23-default.png', '2025-05-07', '17:22:10', 'keluar-2025-05-07-17-22-10-default.png', NULL, NULL, NULL),
(525, 6, '2025-05-08', '08:49:49', 'masuk-2025-05-08-08-49-49-default.png', '2025-05-08', '16:12:08', 'keluar-2025-05-08-16-12-08-default.png', NULL, NULL, NULL),
(526, 6, '2025-05-09', '07:04:40', 'masuk-2025-05-09-07-04-40-default.png', '2025-05-09', '16:50:29', 'keluar-2025-05-09-16-50-29-default.png', NULL, NULL, NULL),
(527, 6, '2025-05-12', '08:10:30', 'masuk-2025-05-12-08-10-30-default.png', '2025-05-12', '16:32:32', 'keluar-2025-05-12-16-32-32-default.png', NULL, NULL, NULL),
(528, 6, '2025-05-13', '08:00:41', 'masuk-2025-05-13-08-00-41-default.png', '2025-05-13', '16:32:27', 'keluar-2025-05-13-16-32-27-default.png', NULL, NULL, NULL),
(529, 6, '2025-05-14', '08:52:54', 'masuk-2025-05-14-08-52-54-default.png', '2025-05-14', '17:56:06', 'keluar-2025-05-14-17-56-06-default.png', NULL, NULL, NULL),
(530, 6, '2025-05-15', '08:49:33', 'masuk-2025-05-15-08-49-33-default.png', '2025-05-15', '16:22:09', 'keluar-2025-05-15-16-22-09-default.png', NULL, NULL, NULL),
(531, 6, '2025-05-16', '08:21:24', 'masuk-2025-05-16-08-21-24-default.png', '2025-05-16', '16:32:36', 'keluar-2025-05-16-16-32-36-default.png', NULL, NULL, NULL),
(532, 6, '2025-05-19', '07:19:11', 'masuk-2025-05-19-07-19-11-default.png', '2025-05-19', '17:48:25', 'keluar-2025-05-19-17-48-25-default.png', NULL, NULL, NULL),
(533, 6, '2025-05-20', '08:42:05', 'masuk-2025-05-20-08-42-05-default.png', '2025-05-20', '16:43:35', 'keluar-2025-05-20-16-43-35-default.png', NULL, NULL, NULL),
(534, 6, '2025-05-21', '07:59:55', 'masuk-2025-05-21-07-59-55-default.png', '2025-05-21', '17:08:51', 'keluar-2025-05-21-17-08-51-default.png', NULL, NULL, NULL),
(535, 6, '2025-05-22', '08:17:37', 'masuk-2025-05-22-08-17-37-default.png', '2025-05-22', '17:43:26', 'keluar-2025-05-22-17-43-26-default.png', NULL, NULL, NULL),
(536, 6, '2025-05-23', '07:20:21', 'masuk-2025-05-23-07-20-21-default.png', '2025-05-23', '17:52:36', 'keluar-2025-05-23-17-52-36-default.png', NULL, NULL, NULL),
(537, 6, '2025-05-26', '07:35:17', 'masuk-2025-05-26-07-35-17-default.png', '2025-05-26', '16:17:41', 'keluar-2025-05-26-16-17-41-default.png', NULL, NULL, NULL),
(538, 6, '2025-05-27', '08:13:55', 'masuk-2025-05-27-08-13-55-default.png', '2025-05-27', '17:11:38', 'keluar-2025-05-27-17-11-38-default.png', NULL, NULL, NULL),
(539, 6, '2025-05-28', '07:39:06', 'masuk-2025-05-28-07-39-06-default.png', '2025-05-28', '16:33:27', 'keluar-2025-05-28-16-33-27-default.png', NULL, NULL, NULL),
(540, 6, '2025-05-29', '08:09:57', 'masuk-2025-05-29-08-09-57-default.png', '2025-05-29', '16:27:24', 'keluar-2025-05-29-16-27-24-default.png', NULL, NULL, NULL),
(541, 6, '2025-05-30', '07:37:51', 'masuk-2025-05-30-07-37-51-default.png', '2025-05-30', '16:34:52', 'keluar-2025-05-30-16-34-52-default.png', NULL, NULL, NULL),
(542, 7, '2025-01-01', '08:32:13', 'masuk-2025-01-01-08-32-13-default.png', '2025-01-01', '16:10:09', 'keluar-2025-01-01-16-10-09-default.png', NULL, NULL, NULL),
(543, 7, '2025-01-02', '08:07:29', 'masuk-2025-01-02-08-07-29-default.png', '2025-01-02', '16:51:12', 'keluar-2025-01-02-16-51-12-default.png', NULL, NULL, NULL),
(544, 7, '2025-01-03', '07:43:16', 'masuk-2025-01-03-07-43-16-default.png', '2025-01-03', '17:17:56', 'keluar-2025-01-03-17-17-56-default.png', NULL, NULL, NULL),
(545, 7, '2025-01-06', '07:06:23', 'masuk-2025-01-06-07-06-23-default.png', '2025-01-06', '17:36:25', 'keluar-2025-01-06-17-36-25-default.png', NULL, NULL, NULL),
(546, 7, '2025-01-07', '08:03:24', 'masuk-2025-01-07-08-03-24-default.png', '2025-01-07', '17:35:33', 'keluar-2025-01-07-17-35-33-default.png', NULL, NULL, NULL),
(547, 7, '2025-01-08', '07:23:50', 'masuk-2025-01-08-07-23-50-default.png', '2025-01-08', '16:48:59', 'keluar-2025-01-08-16-48-59-default.png', NULL, NULL, NULL),
(548, 7, '2025-01-09', '07:55:08', 'masuk-2025-01-09-07-55-08-default.png', '2025-01-09', '16:30:47', 'keluar-2025-01-09-16-30-47-default.png', NULL, NULL, NULL),
(549, 7, '2025-01-10', '07:28:15', 'masuk-2025-01-10-07-28-15-default.png', '2025-01-10', '16:51:45', 'keluar-2025-01-10-16-51-45-default.png', NULL, NULL, NULL),
(550, 7, '2025-01-13', '07:24:53', 'masuk-2025-01-13-07-24-53-default.png', '2025-01-13', '16:24:39', 'keluar-2025-01-13-16-24-39-default.png', NULL, NULL, NULL),
(551, 7, '2025-01-14', '07:34:20', 'masuk-2025-01-14-07-34-20-default.png', '2025-01-14', '17:20:30', 'keluar-2025-01-14-17-20-30-default.png', NULL, NULL, NULL),
(552, 7, '2025-01-15', '08:33:23', 'masuk-2025-01-15-08-33-23-default.png', '2025-01-15', '16:34:27', 'keluar-2025-01-15-16-34-27-default.png', NULL, NULL, NULL),
(553, 7, '2025-01-16', '08:55:11', 'masuk-2025-01-16-08-55-11-default.png', '2025-01-16', '17:46:14', 'keluar-2025-01-16-17-46-14-default.png', NULL, NULL, NULL),
(554, 7, '2025-01-17', '08:57:05', 'masuk-2025-01-17-08-57-05-default.png', '2025-01-17', '17:53:33', 'keluar-2025-01-17-17-53-33-default.png', NULL, NULL, NULL),
(555, 7, '2025-01-20', '08:07:27', 'masuk-2025-01-20-08-07-27-default.png', '2025-01-20', '16:18:12', 'keluar-2025-01-20-16-18-12-default.png', NULL, NULL, NULL),
(556, 7, '2025-01-21', '08:09:49', 'masuk-2025-01-21-08-09-49-default.png', '2025-01-21', '16:43:41', 'keluar-2025-01-21-16-43-41-default.png', NULL, NULL, NULL),
(557, 7, '2025-01-22', '07:14:53', 'masuk-2025-01-22-07-14-53-default.png', '2025-01-22', '17:24:12', 'keluar-2025-01-22-17-24-12-default.png', NULL, NULL, NULL),
(558, 7, '2025-01-23', '07:42:46', 'masuk-2025-01-23-07-42-46-default.png', '2025-01-23', '17:18:08', 'keluar-2025-01-23-17-18-08-default.png', NULL, NULL, NULL),
(559, 7, '2025-01-24', '08:48:38', 'masuk-2025-01-24-08-48-38-default.png', '2025-01-24', '16:17:27', 'keluar-2025-01-24-16-17-27-default.png', NULL, NULL, NULL),
(560, 7, '2025-01-27', '08:03:06', 'masuk-2025-01-27-08-03-06-default.png', '2025-01-27', '16:19:45', 'keluar-2025-01-27-16-19-45-default.png', NULL, NULL, NULL),
(561, 7, '2025-01-28', '07:12:24', 'masuk-2025-01-28-07-12-24-default.png', '2025-01-28', '16:49:56', 'keluar-2025-01-28-16-49-56-default.png', NULL, NULL, NULL),
(562, 7, '2025-01-29', '08:20:11', 'masuk-2025-01-29-08-20-11-default.png', '2025-01-29', '16:28:43', 'keluar-2025-01-29-16-28-43-default.png', NULL, NULL, NULL),
(563, 7, '2025-01-30', '08:06:19', 'masuk-2025-01-30-08-06-19-default.png', '2025-01-30', '17:09:48', 'keluar-2025-01-30-17-09-48-default.png', NULL, NULL, NULL),
(564, 7, '2025-01-31', '07:50:30', 'masuk-2025-01-31-07-50-30-default.png', '2025-01-31', '17:43:47', 'keluar-2025-01-31-17-43-47-default.png', NULL, NULL, NULL),
(565, 7, '2025-02-03', '08:23:05', 'masuk-2025-02-03-08-23-05-default.png', '2025-02-03', '17:57:57', 'keluar-2025-02-03-17-57-57-default.png', NULL, NULL, NULL),
(566, 7, '2025-02-04', '07:54:45', 'masuk-2025-02-04-07-54-45-default.png', '2025-02-04', '17:36:14', 'keluar-2025-02-04-17-36-14-default.png', NULL, NULL, NULL),
(567, 7, '2025-02-05', '07:50:10', 'masuk-2025-02-05-07-50-10-default.png', '2025-02-05', '17:18:37', 'keluar-2025-02-05-17-18-37-default.png', NULL, NULL, NULL),
(568, 7, '2025-02-06', '07:16:31', 'masuk-2025-02-06-07-16-31-default.png', '2025-02-06', '17:25:13', 'keluar-2025-02-06-17-25-13-default.png', NULL, NULL, NULL),
(569, 7, '2025-02-07', '07:24:48', 'masuk-2025-02-07-07-24-48-default.png', '2025-02-07', '16:01:35', 'keluar-2025-02-07-16-01-35-default.png', NULL, NULL, NULL),
(570, 7, '2025-02-10', '08:01:50', 'masuk-2025-02-10-08-01-50-default.png', '2025-02-10', '17:41:18', 'keluar-2025-02-10-17-41-18-default.png', NULL, NULL, NULL),
(571, 7, '2025-02-11', '08:45:04', 'masuk-2025-02-11-08-45-04-default.png', '2025-02-11', '16:12:06', 'keluar-2025-02-11-16-12-06-default.png', NULL, NULL, NULL),
(572, 7, '2025-02-12', '07:45:40', 'masuk-2025-02-12-07-45-40-default.png', '2025-02-12', '16:00:50', 'keluar-2025-02-12-16-00-50-default.png', NULL, NULL, NULL),
(573, 7, '2025-02-13', '07:44:47', 'masuk-2025-02-13-07-44-47-default.png', '2025-02-13', '16:00:42', 'keluar-2025-02-13-16-00-42-default.png', NULL, NULL, NULL),
(574, 7, '2025-02-14', '08:39:41', 'masuk-2025-02-14-08-39-41-default.png', '2025-02-14', '17:28:13', 'keluar-2025-02-14-17-28-13-default.png', NULL, NULL, NULL),
(575, 7, '2025-02-17', '08:56:14', 'masuk-2025-02-17-08-56-14-default.png', '2025-02-17', '17:53:10', 'keluar-2025-02-17-17-53-10-default.png', NULL, NULL, NULL),
(576, 7, '2025-02-18', '07:03:40', 'masuk-2025-02-18-07-03-40-default.png', '2025-02-18', '16:07:36', 'keluar-2025-02-18-16-07-36-default.png', NULL, NULL, NULL),
(577, 7, '2025-02-19', '07:51:40', 'masuk-2025-02-19-07-51-40-default.png', '2025-02-19', '17:39:59', 'keluar-2025-02-19-17-39-59-default.png', NULL, NULL, NULL),
(578, 7, '2025-02-20', '08:10:10', 'masuk-2025-02-20-08-10-10-default.png', '2025-02-20', '17:15:14', 'keluar-2025-02-20-17-15-14-default.png', NULL, NULL, NULL),
(579, 7, '2025-02-21', '08:16:44', 'masuk-2025-02-21-08-16-44-default.png', '2025-02-21', '16:53:03', 'keluar-2025-02-21-16-53-03-default.png', NULL, NULL, NULL),
(580, 7, '2025-02-24', '08:55:45', 'masuk-2025-02-24-08-55-45-default.png', '2025-02-24', '17:32:33', 'keluar-2025-02-24-17-32-33-default.png', NULL, NULL, NULL),
(581, 7, '2025-02-25', '07:03:54', 'masuk-2025-02-25-07-03-54-default.png', '2025-02-25', '17:31:49', 'keluar-2025-02-25-17-31-49-default.png', NULL, NULL, NULL),
(582, 7, '2025-02-26', '07:19:02', 'masuk-2025-02-26-07-19-02-default.png', '2025-02-26', '16:41:37', 'keluar-2025-02-26-16-41-37-default.png', NULL, NULL, NULL),
(583, 7, '2025-02-27', '07:03:39', 'masuk-2025-02-27-07-03-39-default.png', '2025-02-27', '17:35:57', 'keluar-2025-02-27-17-35-57-default.png', NULL, NULL, NULL),
(584, 7, '2025-02-28', '08:51:13', 'masuk-2025-02-28-08-51-13-default.png', '2025-02-28', '17:31:15', 'keluar-2025-02-28-17-31-15-default.png', NULL, NULL, NULL),
(585, 7, '2025-03-03', '08:15:26', 'masuk-2025-03-03-08-15-26-default.png', '2025-03-03', '17:39:39', 'keluar-2025-03-03-17-39-39-default.png', NULL, NULL, NULL),
(586, 7, '2025-03-04', '08:42:08', 'masuk-2025-03-04-08-42-08-default.png', '2025-03-04', '17:08:22', 'keluar-2025-03-04-17-08-22-default.png', NULL, NULL, NULL),
(587, 7, '2025-03-05', '07:19:21', 'masuk-2025-03-05-07-19-21-default.png', '2025-03-05', '16:20:39', 'keluar-2025-03-05-16-20-39-default.png', NULL, NULL, NULL),
(588, 7, '2025-03-06', '08:29:30', 'masuk-2025-03-06-08-29-30-default.png', '2025-03-06', '16:58:06', 'keluar-2025-03-06-16-58-06-default.png', NULL, NULL, NULL),
(589, 7, '2025-03-07', '07:39:47', 'masuk-2025-03-07-07-39-47-default.png', '2025-03-07', '17:10:18', 'keluar-2025-03-07-17-10-18-default.png', NULL, NULL, NULL),
(590, 7, '2025-03-10', '08:44:11', 'masuk-2025-03-10-08-44-11-default.png', '2025-03-10', '17:19:27', 'keluar-2025-03-10-17-19-27-default.png', NULL, NULL, NULL),
(591, 7, '2025-03-11', '08:02:18', 'masuk-2025-03-11-08-02-18-default.png', '2025-03-11', '17:49:16', 'keluar-2025-03-11-17-49-16-default.png', NULL, NULL, NULL),
(592, 7, '2025-03-12', '08:43:23', 'masuk-2025-03-12-08-43-23-default.png', '2025-03-12', '17:37:00', 'keluar-2025-03-12-17-37-00-default.png', NULL, NULL, NULL),
(593, 7, '2025-03-13', '08:23:01', 'masuk-2025-03-13-08-23-01-default.png', '2025-03-13', '17:52:51', 'keluar-2025-03-13-17-52-51-default.png', NULL, NULL, NULL),
(594, 7, '2025-03-14', '08:40:26', 'masuk-2025-03-14-08-40-26-default.png', '2025-03-14', '16:27:54', 'keluar-2025-03-14-16-27-54-default.png', NULL, NULL, NULL),
(595, 7, '2025-03-17', '07:24:31', 'masuk-2025-03-17-07-24-31-default.png', '2025-03-17', '16:55:56', 'keluar-2025-03-17-16-55-56-default.png', NULL, NULL, NULL),
(596, 7, '2025-03-18', '08:58:22', 'masuk-2025-03-18-08-58-22-default.png', '2025-03-18', '17:18:50', 'keluar-2025-03-18-17-18-50-default.png', NULL, NULL, NULL),
(597, 7, '2025-03-19', '08:57:57', 'masuk-2025-03-19-08-57-57-default.png', '2025-03-19', '17:10:50', 'keluar-2025-03-19-17-10-50-default.png', NULL, NULL, NULL),
(598, 7, '2025-03-20', '07:52:13', 'masuk-2025-03-20-07-52-13-default.png', '2025-03-20', '16:32:47', 'keluar-2025-03-20-16-32-47-default.png', NULL, NULL, NULL),
(599, 7, '2025-03-21', '08:31:03', 'masuk-2025-03-21-08-31-03-default.png', '2025-03-21', '16:32:54', 'keluar-2025-03-21-16-32-54-default.png', NULL, NULL, NULL),
(600, 7, '2025-03-24', '08:20:02', 'masuk-2025-03-24-08-20-02-default.png', '2025-03-24', '16:59:39', 'keluar-2025-03-24-16-59-39-default.png', NULL, NULL, NULL),
(601, 7, '2025-03-25', '07:26:52', 'masuk-2025-03-25-07-26-52-default.png', '2025-03-25', '17:40:55', 'keluar-2025-03-25-17-40-55-default.png', NULL, NULL, NULL),
(602, 7, '2025-03-26', '07:27:04', 'masuk-2025-03-26-07-27-04-default.png', '2025-03-26', '17:56:48', 'keluar-2025-03-26-17-56-48-default.png', NULL, NULL, NULL),
(603, 7, '2025-03-27', '07:36:27', 'masuk-2025-03-27-07-36-27-default.png', '2025-03-27', '16:16:36', 'keluar-2025-03-27-16-16-36-default.png', NULL, NULL, NULL),
(604, 7, '2025-03-28', '07:27:31', 'masuk-2025-03-28-07-27-31-default.png', '2025-03-28', '17:58:18', 'keluar-2025-03-28-17-58-18-default.png', NULL, NULL, NULL),
(605, 7, '2025-03-31', '08:55:59', 'masuk-2025-03-31-08-55-59-default.png', '2025-03-31', '17:19:49', 'keluar-2025-03-31-17-19-49-default.png', NULL, NULL, NULL),
(606, 7, '2025-04-01', '07:03:33', 'masuk-2025-04-01-07-03-33-default.png', '2025-04-01', '16:10:01', 'keluar-2025-04-01-16-10-01-default.png', NULL, NULL, NULL),
(607, 7, '2025-04-02', '07:13:00', 'masuk-2025-04-02-07-13-00-default.png', '2025-04-02', '16:29:48', 'keluar-2025-04-02-16-29-48-default.png', NULL, NULL, NULL),
(608, 7, '2025-04-03', '08:18:24', 'masuk-2025-04-03-08-18-24-default.png', '2025-04-03', '16:27:51', 'keluar-2025-04-03-16-27-51-default.png', NULL, NULL, NULL),
(609, 7, '2025-04-04', '07:18:06', 'masuk-2025-04-04-07-18-06-default.png', '2025-04-04', '16:05:20', 'keluar-2025-04-04-16-05-20-default.png', NULL, NULL, NULL),
(610, 7, '2025-04-07', '07:20:01', 'masuk-2025-04-07-07-20-01-default.png', '2025-04-07', '17:02:19', 'keluar-2025-04-07-17-02-19-default.png', NULL, NULL, NULL),
(611, 7, '2025-04-08', '08:44:41', 'masuk-2025-04-08-08-44-41-default.png', '2025-04-08', '17:59:09', 'keluar-2025-04-08-17-59-09-default.png', NULL, NULL, NULL),
(612, 7, '2025-04-09', '08:40:14', 'masuk-2025-04-09-08-40-14-default.png', '2025-04-09', '16:14:01', 'keluar-2025-04-09-16-14-01-default.png', NULL, NULL, NULL),
(613, 7, '2025-04-10', '08:43:37', 'masuk-2025-04-10-08-43-37-default.png', '2025-04-10', '17:53:22', 'keluar-2025-04-10-17-53-22-default.png', NULL, NULL, NULL),
(614, 7, '2025-04-11', '07:28:40', 'masuk-2025-04-11-07-28-40-default.png', '2025-04-11', '17:51:33', 'keluar-2025-04-11-17-51-33-default.png', NULL, NULL, NULL),
(615, 7, '2025-04-14', '08:24:30', 'masuk-2025-04-14-08-24-30-default.png', '2025-04-14', '17:23:02', 'keluar-2025-04-14-17-23-02-default.png', NULL, NULL, NULL),
(616, 7, '2025-04-15', '07:21:30', 'masuk-2025-04-15-07-21-30-default.png', '2025-04-15', '17:19:29', 'keluar-2025-04-15-17-19-29-default.png', NULL, NULL, NULL),
(617, 7, '2025-04-16', '08:42:53', 'masuk-2025-04-16-08-42-53-default.png', '2025-04-16', '16:53:57', 'keluar-2025-04-16-16-53-57-default.png', NULL, NULL, NULL),
(618, 7, '2025-04-17', '07:41:47', 'masuk-2025-04-17-07-41-47-default.png', '2025-04-17', '17:55:34', 'keluar-2025-04-17-17-55-34-default.png', NULL, NULL, NULL),
(619, 7, '2025-04-18', '08:26:13', 'masuk-2025-04-18-08-26-13-default.png', '2025-04-18', '16:48:48', 'keluar-2025-04-18-16-48-48-default.png', NULL, NULL, NULL),
(620, 7, '2025-04-21', '07:11:10', 'masuk-2025-04-21-07-11-10-default.png', '2025-04-21', '17:03:17', 'keluar-2025-04-21-17-03-17-default.png', NULL, NULL, NULL),
(621, 7, '2025-04-22', '07:02:36', 'masuk-2025-04-22-07-02-36-default.png', '2025-04-22', '17:37:40', 'keluar-2025-04-22-17-37-40-default.png', NULL, NULL, NULL),
(622, 7, '2025-04-23', '07:40:02', 'masuk-2025-04-23-07-40-02-default.png', '2025-04-23', '16:59:05', 'keluar-2025-04-23-16-59-05-default.png', NULL, NULL, NULL),
(623, 7, '2025-04-24', '07:13:28', 'masuk-2025-04-24-07-13-28-default.png', '2025-04-24', '17:41:42', 'keluar-2025-04-24-17-41-42-default.png', NULL, NULL, NULL),
(624, 7, '2025-04-25', '07:34:38', 'masuk-2025-04-25-07-34-38-default.png', '2025-04-25', '17:57:51', 'keluar-2025-04-25-17-57-51-default.png', NULL, NULL, NULL),
(625, 7, '2025-04-28', '08:25:21', 'masuk-2025-04-28-08-25-21-default.png', '2025-04-28', '17:04:43', 'keluar-2025-04-28-17-04-43-default.png', NULL, NULL, NULL),
(626, 7, '2025-04-29', '08:31:44', 'masuk-2025-04-29-08-31-44-default.png', '2025-04-29', '16:19:45', 'keluar-2025-04-29-16-19-45-default.png', NULL, NULL, NULL),
(627, 7, '2025-04-30', '07:32:43', 'masuk-2025-04-30-07-32-43-default.png', '2025-04-30', '17:16:59', 'keluar-2025-04-30-17-16-59-default.png', NULL, NULL, NULL),
(628, 7, '2025-05-01', '07:39:42', 'masuk-2025-05-01-07-39-42-default.png', '2025-05-01', '16:43:40', 'keluar-2025-05-01-16-43-40-default.png', NULL, NULL, NULL),
(629, 7, '2025-05-02', '08:29:40', 'masuk-2025-05-02-08-29-40-default.png', '2025-05-02', '17:02:35', 'keluar-2025-05-02-17-02-35-default.png', NULL, NULL, NULL),
(630, 7, '2025-05-05', '08:39:36', 'masuk-2025-05-05-08-39-36-default.png', '2025-05-05', '17:14:18', 'keluar-2025-05-05-17-14-18-default.png', NULL, NULL, NULL),
(631, 7, '2025-05-06', '08:25:30', 'masuk-2025-05-06-08-25-30-default.png', '2025-05-06', '16:44:10', 'keluar-2025-05-06-16-44-10-default.png', NULL, NULL, NULL),
(632, 7, '2025-05-07', '07:29:18', 'masuk-2025-05-07-07-29-18-default.png', '2025-05-07', '16:24:04', 'keluar-2025-05-07-16-24-04-default.png', NULL, NULL, NULL),
(633, 7, '2025-05-08', '07:52:51', 'masuk-2025-05-08-07-52-51-default.png', '2025-05-08', '16:32:33', 'keluar-2025-05-08-16-32-33-default.png', NULL, NULL, NULL),
(634, 7, '2025-05-09', '07:04:50', 'masuk-2025-05-09-07-04-50-default.png', '2025-05-09', '16:31:12', 'keluar-2025-05-09-16-31-12-default.png', NULL, NULL, NULL),
(635, 7, '2025-05-12', '07:39:51', 'masuk-2025-05-12-07-39-51-default.png', '2025-05-12', '16:32:35', 'keluar-2025-05-12-16-32-35-default.png', NULL, NULL, NULL),
(636, 7, '2025-05-13', '07:44:20', 'masuk-2025-05-13-07-44-20-default.png', '2025-05-13', '16:31:32', 'keluar-2025-05-13-16-31-32-default.png', NULL, NULL, NULL),
(637, 7, '2025-05-14', '07:31:36', 'masuk-2025-05-14-07-31-36-default.png', '2025-05-14', '17:28:51', 'keluar-2025-05-14-17-28-51-default.png', NULL, NULL, NULL),
(638, 7, '2025-05-15', '08:23:55', 'masuk-2025-05-15-08-23-55-default.png', '2025-05-15', '17:44:44', 'keluar-2025-05-15-17-44-44-default.png', NULL, NULL, NULL),
(639, 7, '2025-05-16', '07:57:46', 'masuk-2025-05-16-07-57-46-default.png', '2025-05-16', '16:10:02', 'keluar-2025-05-16-16-10-02-default.png', NULL, NULL, NULL),
(640, 7, '2025-05-19', '08:53:08', 'masuk-2025-05-19-08-53-08-default.png', '2025-05-19', '16:37:32', 'keluar-2025-05-19-16-37-32-default.png', NULL, NULL, NULL),
(641, 7, '2025-05-20', '08:43:16', 'masuk-2025-05-20-08-43-16-default.png', '2025-05-20', '16:53:20', 'keluar-2025-05-20-16-53-20-default.png', NULL, NULL, NULL),
(642, 7, '2025-05-21', '07:34:00', 'masuk-2025-05-21-07-34-00-default.png', '2025-05-21', '16:15:09', 'keluar-2025-05-21-16-15-09-default.png', NULL, NULL, NULL),
(643, 7, '2025-05-22', '07:53:01', 'masuk-2025-05-22-07-53-01-default.png', '2025-05-22', '16:30:20', 'keluar-2025-05-22-16-30-20-default.png', NULL, NULL, NULL),
(644, 7, '2025-05-23', '07:39:47', 'masuk-2025-05-23-07-39-47-default.png', '2025-05-23', '16:51:00', 'keluar-2025-05-23-16-51-00-default.png', NULL, NULL, NULL),
(645, 7, '2025-05-26', '07:08:14', 'masuk-2025-05-26-07-08-14-default.png', '2025-05-26', '17:23:14', 'keluar-2025-05-26-17-23-14-default.png', NULL, NULL, NULL),
(646, 7, '2025-05-27', '07:23:13', 'masuk-2025-05-27-07-23-13-default.png', '2025-05-27', '16:56:11', 'keluar-2025-05-27-16-56-11-default.png', NULL, NULL, NULL),
(647, 7, '2025-05-28', '07:19:20', 'masuk-2025-05-28-07-19-20-default.png', '2025-05-28', '16:46:56', 'keluar-2025-05-28-16-46-56-default.png', NULL, NULL, NULL),
(648, 7, '2025-05-29', '07:27:20', 'masuk-2025-05-29-07-27-20-default.png', '2025-05-29', '17:02:32', 'keluar-2025-05-29-17-02-32-default.png', NULL, NULL, NULL),
(649, 7, '2025-05-30', '07:53:25', 'masuk-2025-05-30-07-53-25-default.png', '2025-05-30', '16:52:42', 'keluar-2025-05-30-16-52-42-default.png', NULL, NULL, NULL),
(650, 8, '2025-01-01', '07:50:26', 'masuk-2025-01-01-07-50-26-default.png', '2025-01-01', '17:01:17', 'keluar-2025-01-01-17-01-17-default.png', NULL, NULL, NULL),
(651, 8, '2025-01-02', '08:48:11', 'masuk-2025-01-02-08-48-11-default.png', '2025-01-02', '16:29:01', 'keluar-2025-01-02-16-29-01-default.png', NULL, NULL, NULL),
(652, 8, '2025-01-03', '08:15:57', 'masuk-2025-01-03-08-15-57-default.png', '2025-01-03', '17:03:10', 'keluar-2025-01-03-17-03-10-default.png', NULL, NULL, NULL),
(653, 8, '2025-01-06', '08:17:01', 'masuk-2025-01-06-08-17-01-default.png', '2025-01-06', '16:53:40', 'keluar-2025-01-06-16-53-40-default.png', NULL, NULL, NULL),
(654, 8, '2025-01-07', '07:38:08', 'masuk-2025-01-07-07-38-08-default.png', '2025-01-07', '17:08:07', 'keluar-2025-01-07-17-08-07-default.png', NULL, NULL, NULL),
(655, 8, '2025-01-08', '07:02:31', 'masuk-2025-01-08-07-02-31-default.png', '2025-01-08', '17:49:22', 'keluar-2025-01-08-17-49-22-default.png', NULL, NULL, NULL),
(656, 8, '2025-01-09', '08:09:58', 'masuk-2025-01-09-08-09-58-default.png', '2025-01-09', '16:16:01', 'keluar-2025-01-09-16-16-01-default.png', NULL, NULL, NULL),
(657, 8, '2025-01-10', '08:30:38', 'masuk-2025-01-10-08-30-38-default.png', '2025-01-10', '16:55:53', 'keluar-2025-01-10-16-55-53-default.png', NULL, NULL, NULL),
(658, 8, '2025-01-13', '08:34:52', 'masuk-2025-01-13-08-34-52-default.png', '2025-01-13', '16:03:59', 'keluar-2025-01-13-16-03-59-default.png', NULL, NULL, NULL),
(659, 8, '2025-01-14', '07:24:43', 'masuk-2025-01-14-07-24-43-default.png', '2025-01-14', '17:12:39', 'keluar-2025-01-14-17-12-39-default.png', NULL, NULL, NULL),
(660, 8, '2025-01-15', '07:39:27', 'masuk-2025-01-15-07-39-27-default.png', '2025-01-15', '16:30:22', 'keluar-2025-01-15-16-30-22-default.png', NULL, NULL, NULL),
(661, 8, '2025-01-16', '07:43:01', 'masuk-2025-01-16-07-43-01-default.png', '2025-01-16', '16:44:51', 'keluar-2025-01-16-16-44-51-default.png', NULL, NULL, NULL),
(662, 8, '2025-01-17', '08:39:04', 'masuk-2025-01-17-08-39-04-default.png', '2025-01-17', '16:23:56', 'keluar-2025-01-17-16-23-56-default.png', NULL, NULL, NULL),
(663, 8, '2025-01-20', '07:19:30', 'masuk-2025-01-20-07-19-30-default.png', '2025-01-20', '17:28:18', 'keluar-2025-01-20-17-28-18-default.png', NULL, NULL, NULL),
(664, 8, '2025-01-21', '08:47:30', 'masuk-2025-01-21-08-47-30-default.png', '2025-01-21', '16:51:50', 'keluar-2025-01-21-16-51-50-default.png', NULL, NULL, NULL),
(665, 8, '2025-01-22', '07:03:38', 'masuk-2025-01-22-07-03-38-default.png', '2025-01-22', '16:36:40', 'keluar-2025-01-22-16-36-40-default.png', NULL, NULL, NULL),
(666, 8, '2025-01-23', '08:55:53', 'masuk-2025-01-23-08-55-53-default.png', '2025-01-23', '16:40:54', 'keluar-2025-01-23-16-40-54-default.png', NULL, NULL, NULL),
(667, 8, '2025-01-24', '08:45:47', 'masuk-2025-01-24-08-45-47-default.png', '2025-01-24', '17:26:57', 'keluar-2025-01-24-17-26-57-default.png', NULL, NULL, NULL),
(668, 8, '2025-01-27', '07:43:22', 'masuk-2025-01-27-07-43-22-default.png', '2025-01-27', '17:24:30', 'keluar-2025-01-27-17-24-30-default.png', NULL, NULL, NULL),
(669, 8, '2025-01-28', '07:41:28', 'masuk-2025-01-28-07-41-28-default.png', '2025-01-28', '16:06:16', 'keluar-2025-01-28-16-06-16-default.png', NULL, NULL, NULL),
(670, 8, '2025-01-29', '07:13:25', 'masuk-2025-01-29-07-13-25-default.png', '2025-01-29', '17:31:17', 'keluar-2025-01-29-17-31-17-default.png', NULL, NULL, NULL),
(671, 8, '2025-01-30', '08:40:37', 'masuk-2025-01-30-08-40-37-default.png', '2025-01-30', '16:03:37', 'keluar-2025-01-30-16-03-37-default.png', NULL, NULL, NULL),
(672, 8, '2025-01-31', '07:24:56', 'masuk-2025-01-31-07-24-56-default.png', '2025-01-31', '16:03:49', 'keluar-2025-01-31-16-03-49-default.png', NULL, NULL, NULL),
(673, 8, '2025-02-03', '07:47:01', 'masuk-2025-02-03-07-47-01-default.png', '2025-02-03', '16:21:37', 'keluar-2025-02-03-16-21-37-default.png', NULL, NULL, NULL),
(674, 8, '2025-02-04', '07:54:08', 'masuk-2025-02-04-07-54-08-default.png', '2025-02-04', '16:41:57', 'keluar-2025-02-04-16-41-57-default.png', NULL, NULL, NULL),
(675, 8, '2025-02-05', '07:05:14', 'masuk-2025-02-05-07-05-14-default.png', '2025-02-05', '16:44:01', 'keluar-2025-02-05-16-44-01-default.png', NULL, NULL, NULL),
(676, 8, '2025-02-06', '08:23:25', 'masuk-2025-02-06-08-23-25-default.png', '2025-02-06', '16:17:28', 'keluar-2025-02-06-16-17-28-default.png', NULL, NULL, NULL),
(677, 8, '2025-02-07', '08:05:01', 'masuk-2025-02-07-08-05-01-default.png', '2025-02-07', '17:42:52', 'keluar-2025-02-07-17-42-52-default.png', NULL, NULL, NULL),
(678, 8, '2025-02-10', '07:21:04', 'masuk-2025-02-10-07-21-04-default.png', '2025-02-10', '17:34:39', 'keluar-2025-02-10-17-34-39-default.png', NULL, NULL, NULL),
(679, 8, '2025-02-11', '08:39:11', 'masuk-2025-02-11-08-39-11-default.png', '2025-02-11', '16:25:03', 'keluar-2025-02-11-16-25-03-default.png', NULL, NULL, NULL),
(680, 8, '2025-02-12', '07:13:49', 'masuk-2025-02-12-07-13-49-default.png', '2025-02-12', '16:01:12', 'keluar-2025-02-12-16-01-12-default.png', NULL, NULL, NULL),
(681, 8, '2025-02-13', '08:44:14', 'masuk-2025-02-13-08-44-14-default.png', '2025-02-13', '17:15:35', 'keluar-2025-02-13-17-15-35-default.png', NULL, NULL, NULL),
(682, 8, '2025-02-14', '08:17:27', 'masuk-2025-02-14-08-17-27-default.png', '2025-02-14', '16:05:59', 'keluar-2025-02-14-16-05-59-default.png', NULL, NULL, NULL),
(683, 8, '2025-02-17', '07:37:55', 'masuk-2025-02-17-07-37-55-default.png', '2025-02-17', '17:27:47', 'keluar-2025-02-17-17-27-47-default.png', NULL, NULL, NULL),
(684, 8, '2025-02-18', '08:03:15', 'masuk-2025-02-18-08-03-15-default.png', '2025-02-18', '16:53:11', 'keluar-2025-02-18-16-53-11-default.png', NULL, NULL, NULL),
(685, 8, '2025-02-19', '07:56:46', 'masuk-2025-02-19-07-56-46-default.png', '2025-02-19', '16:47:06', 'keluar-2025-02-19-16-47-06-default.png', NULL, NULL, NULL),
(686, 8, '2025-02-20', '08:45:05', 'masuk-2025-02-20-08-45-05-default.png', '2025-02-20', '16:25:34', 'keluar-2025-02-20-16-25-34-default.png', NULL, NULL, NULL),
(687, 8, '2025-02-21', '07:35:50', 'masuk-2025-02-21-07-35-50-default.png', '2025-02-21', '17:45:52', 'keluar-2025-02-21-17-45-52-default.png', NULL, NULL, NULL),
(688, 8, '2025-02-24', '07:29:08', 'masuk-2025-02-24-07-29-08-default.png', '2025-02-24', '17:55:13', 'keluar-2025-02-24-17-55-13-default.png', NULL, NULL, NULL),
(689, 8, '2025-02-25', '08:54:20', 'masuk-2025-02-25-08-54-20-default.png', '2025-02-25', '16:52:19', 'keluar-2025-02-25-16-52-19-default.png', NULL, NULL, NULL),
(690, 8, '2025-02-26', '07:10:38', 'masuk-2025-02-26-07-10-38-default.png', '2025-02-26', '17:56:21', 'keluar-2025-02-26-17-56-21-default.png', NULL, NULL, NULL),
(691, 8, '2025-02-27', '08:58:09', 'masuk-2025-02-27-08-58-09-default.png', '2025-02-27', '16:07:33', 'keluar-2025-02-27-16-07-33-default.png', NULL, NULL, NULL),
(692, 8, '2025-02-28', '07:44:58', 'masuk-2025-02-28-07-44-58-default.png', '2025-02-28', '17:53:54', 'keluar-2025-02-28-17-53-54-default.png', NULL, NULL, NULL),
(693, 8, '2025-03-03', '08:27:16', 'masuk-2025-03-03-08-27-16-default.png', '2025-03-03', '16:04:14', 'keluar-2025-03-03-16-04-14-default.png', NULL, NULL, NULL),
(694, 8, '2025-03-04', '07:25:26', 'masuk-2025-03-04-07-25-26-default.png', '2025-03-04', '16:27:22', 'keluar-2025-03-04-16-27-22-default.png', NULL, NULL, NULL),
(695, 8, '2025-03-05', '07:41:52', 'masuk-2025-03-05-07-41-52-default.png', '2025-03-05', '17:44:19', 'keluar-2025-03-05-17-44-19-default.png', NULL, NULL, NULL),
(696, 8, '2025-03-06', '07:40:41', 'masuk-2025-03-06-07-40-41-default.png', '2025-03-06', '16:16:55', 'keluar-2025-03-06-16-16-55-default.png', NULL, NULL, NULL),
(697, 8, '2025-03-07', '07:12:18', 'masuk-2025-03-07-07-12-18-default.png', '2025-03-07', '17:44:38', 'keluar-2025-03-07-17-44-38-default.png', NULL, NULL, NULL),
(698, 8, '2025-03-10', '07:51:20', 'masuk-2025-03-10-07-51-20-default.png', '2025-03-10', '16:49:25', 'keluar-2025-03-10-16-49-25-default.png', NULL, NULL, NULL),
(699, 8, '2025-03-11', '07:33:10', 'masuk-2025-03-11-07-33-10-default.png', '2025-03-11', '16:19:49', 'keluar-2025-03-11-16-19-49-default.png', NULL, NULL, NULL),
(700, 8, '2025-03-12', '07:43:03', 'masuk-2025-03-12-07-43-03-default.png', '2025-03-12', '17:14:58', 'keluar-2025-03-12-17-14-58-default.png', NULL, NULL, NULL),
(701, 8, '2025-03-13', '08:32:09', 'masuk-2025-03-13-08-32-09-default.png', '2025-03-13', '16:51:04', 'keluar-2025-03-13-16-51-04-default.png', NULL, NULL, NULL),
(702, 8, '2025-03-14', '08:01:05', 'masuk-2025-03-14-08-01-05-default.png', '2025-03-14', '16:15:55', 'keluar-2025-03-14-16-15-55-default.png', NULL, NULL, NULL),
(703, 8, '2025-03-17', '08:36:41', 'masuk-2025-03-17-08-36-41-default.png', '2025-03-17', '17:14:49', 'keluar-2025-03-17-17-14-49-default.png', NULL, NULL, NULL),
(704, 8, '2025-03-18', '08:19:45', 'masuk-2025-03-18-08-19-45-default.png', '2025-03-18', '16:40:06', 'keluar-2025-03-18-16-40-06-default.png', NULL, NULL, NULL),
(705, 8, '2025-03-19', '08:11:03', 'masuk-2025-03-19-08-11-03-default.png', '2025-03-19', '16:25:18', 'keluar-2025-03-19-16-25-18-default.png', NULL, NULL, NULL),
(706, 8, '2025-03-20', '08:26:01', 'masuk-2025-03-20-08-26-01-default.png', '2025-03-20', '16:38:08', 'keluar-2025-03-20-16-38-08-default.png', NULL, NULL, NULL),
(707, 8, '2025-03-21', '07:51:56', 'masuk-2025-03-21-07-51-56-default.png', '2025-03-21', '16:10:48', 'keluar-2025-03-21-16-10-48-default.png', NULL, NULL, NULL),
(708, 8, '2025-03-24', '07:36:02', 'masuk-2025-03-24-07-36-02-default.png', '2025-03-24', '16:11:50', 'keluar-2025-03-24-16-11-50-default.png', NULL, NULL, NULL),
(709, 8, '2025-03-25', '08:57:29', 'masuk-2025-03-25-08-57-29-default.png', '2025-03-25', '17:32:12', 'keluar-2025-03-25-17-32-12-default.png', NULL, NULL, NULL),
(710, 8, '2025-03-26', '07:56:49', 'masuk-2025-03-26-07-56-49-default.png', '2025-03-26', '16:49:46', 'keluar-2025-03-26-16-49-46-default.png', NULL, NULL, NULL),
(711, 8, '2025-03-27', '07:07:00', 'masuk-2025-03-27-07-07-00-default.png', '2025-03-27', '16:24:22', 'keluar-2025-03-27-16-24-22-default.png', NULL, NULL, NULL),
(712, 8, '2025-03-28', '07:32:04', 'masuk-2025-03-28-07-32-04-default.png', '2025-03-28', '16:41:55', 'keluar-2025-03-28-16-41-55-default.png', NULL, NULL, NULL),
(713, 8, '2025-03-31', '08:17:14', 'masuk-2025-03-31-08-17-14-default.png', '2025-03-31', '17:24:53', 'keluar-2025-03-31-17-24-53-default.png', NULL, NULL, NULL),
(714, 8, '2025-04-01', '08:20:57', 'masuk-2025-04-01-08-20-57-default.png', '2025-04-01', '16:33:04', 'keluar-2025-04-01-16-33-04-default.png', NULL, NULL, NULL),
(715, 8, '2025-04-02', '07:27:56', 'masuk-2025-04-02-07-27-56-default.png', '2025-04-02', '16:15:44', 'keluar-2025-04-02-16-15-44-default.png', NULL, NULL, NULL),
(716, 8, '2025-04-03', '08:29:47', 'masuk-2025-04-03-08-29-47-default.png', '2025-04-03', '17:17:25', 'keluar-2025-04-03-17-17-25-default.png', NULL, NULL, NULL),
(717, 8, '2025-04-04', '08:54:35', 'masuk-2025-04-04-08-54-35-default.png', '2025-04-04', '16:45:37', 'keluar-2025-04-04-16-45-37-default.png', NULL, NULL, NULL),
(718, 8, '2025-04-07', '08:10:39', 'masuk-2025-04-07-08-10-39-default.png', '2025-04-07', '17:40:01', 'keluar-2025-04-07-17-40-01-default.png', NULL, NULL, NULL),
(719, 8, '2025-04-08', '08:07:35', 'masuk-2025-04-08-08-07-35-default.png', '2025-04-08', '17:25:30', 'keluar-2025-04-08-17-25-30-default.png', NULL, NULL, NULL),
(720, 8, '2025-04-09', '08:07:10', 'masuk-2025-04-09-08-07-10-default.png', '2025-04-09', '17:42:31', 'keluar-2025-04-09-17-42-31-default.png', NULL, NULL, NULL),
(721, 8, '2025-04-10', '08:24:31', 'masuk-2025-04-10-08-24-31-default.png', '2025-04-10', '16:22:40', 'keluar-2025-04-10-16-22-40-default.png', NULL, NULL, NULL),
(722, 8, '2025-04-11', '07:30:20', 'masuk-2025-04-11-07-30-20-default.png', '2025-04-11', '17:19:36', 'keluar-2025-04-11-17-19-36-default.png', NULL, NULL, NULL),
(723, 8, '2025-04-14', '08:10:07', 'masuk-2025-04-14-08-10-07-default.png', '2025-04-14', '16:41:24', 'keluar-2025-04-14-16-41-24-default.png', NULL, NULL, NULL),
(724, 8, '2025-04-15', '07:28:12', 'masuk-2025-04-15-07-28-12-default.png', '2025-04-15', '17:38:41', 'keluar-2025-04-15-17-38-41-default.png', NULL, NULL, NULL),
(725, 8, '2025-04-16', '07:51:20', 'masuk-2025-04-16-07-51-20-default.png', '2025-04-16', '17:03:11', 'keluar-2025-04-16-17-03-11-default.png', NULL, NULL, NULL),
(726, 8, '2025-04-17', '08:11:18', 'masuk-2025-04-17-08-11-18-default.png', '2025-04-17', '17:00:01', 'keluar-2025-04-17-17-00-01-default.png', NULL, NULL, NULL),
(727, 8, '2025-04-18', '08:55:05', 'masuk-2025-04-18-08-55-05-default.png', '2025-04-18', '17:03:58', 'keluar-2025-04-18-17-03-58-default.png', NULL, NULL, NULL),
(728, 8, '2025-04-21', '08:16:58', 'masuk-2025-04-21-08-16-58-default.png', '2025-04-21', '16:51:23', 'keluar-2025-04-21-16-51-23-default.png', NULL, NULL, NULL),
(729, 8, '2025-04-22', '08:08:08', 'masuk-2025-04-22-08-08-08-default.png', '2025-04-22', '16:59:44', 'keluar-2025-04-22-16-59-44-default.png', NULL, NULL, NULL),
(730, 8, '2025-04-23', '08:44:37', 'masuk-2025-04-23-08-44-37-default.png', '2025-04-23', '17:24:31', 'keluar-2025-04-23-17-24-31-default.png', NULL, NULL, NULL),
(731, 8, '2025-04-24', '07:37:20', 'masuk-2025-04-24-07-37-20-default.png', '2025-04-24', '16:04:21', 'keluar-2025-04-24-16-04-21-default.png', NULL, NULL, NULL);
INSERT INTO `presensi` (`id`, `id_pegawai`, `tanggal_masuk`, `jam_masuk`, `foto_masuk`, `tanggal_keluar`, `jam_keluar`, `foto_keluar`, `created_at`, `updated_at`, `deleted_at`) VALUES
(732, 8, '2025-04-25', '08:56:24', 'masuk-2025-04-25-08-56-24-default.png', '2025-04-25', '16:47:10', 'keluar-2025-04-25-16-47-10-default.png', NULL, NULL, NULL),
(733, 8, '2025-04-28', '08:27:33', 'masuk-2025-04-28-08-27-33-default.png', '2025-04-28', '17:16:39', 'keluar-2025-04-28-17-16-39-default.png', NULL, NULL, NULL),
(734, 8, '2025-04-29', '08:13:38', 'masuk-2025-04-29-08-13-38-default.png', '2025-04-29', '17:02:10', 'keluar-2025-04-29-17-02-10-default.png', NULL, NULL, NULL),
(735, 8, '2025-04-30', '07:52:20', 'masuk-2025-04-30-07-52-20-default.png', '2025-04-30', '17:27:42', 'keluar-2025-04-30-17-27-42-default.png', NULL, NULL, NULL),
(736, 8, '2025-05-01', '08:26:51', 'masuk-2025-05-01-08-26-51-default.png', '2025-05-01', '17:45:05', 'keluar-2025-05-01-17-45-05-default.png', NULL, NULL, NULL),
(739, 8, '2025-05-06', '07:33:54', 'masuk-2025-05-06-07-33-54-default.png', '2025-05-06', '17:40:13', 'keluar-2025-05-06-17-40-13-default.png', NULL, NULL, NULL),
(740, 8, '2025-05-07', '07:48:49', 'masuk-2025-05-07-07-48-49-default.png', '2025-05-07', '17:51:41', 'keluar-2025-05-07-17-51-41-default.png', NULL, NULL, NULL),
(741, 8, '2025-05-08', '08:36:17', 'masuk-2025-05-08-08-36-17-default.png', '2025-05-08', '16:06:45', 'keluar-2025-05-08-16-06-45-default.png', NULL, NULL, NULL),
(742, 8, '2025-05-09', '08:51:02', 'masuk-2025-05-09-08-51-02-default.png', '2025-05-09', '16:02:13', 'keluar-2025-05-09-16-02-13-default.png', NULL, NULL, NULL),
(743, 8, '2025-05-12', '08:29:23', 'masuk-2025-05-12-08-29-23-default.png', '2025-05-12', '16:13:26', 'keluar-2025-05-12-16-13-26-default.png', NULL, NULL, NULL),
(744, 8, '2025-05-13', '08:56:04', 'masuk-2025-05-13-08-56-04-default.png', '2025-05-13', '16:37:20', 'keluar-2025-05-13-16-37-20-default.png', NULL, NULL, NULL),
(745, 8, '2025-05-14', '08:58:46', 'masuk-2025-05-14-08-58-46-default.png', '2025-05-14', '17:55:37', 'keluar-2025-05-14-17-55-37-default.png', NULL, NULL, NULL),
(746, 8, '2025-05-15', '07:20:33', 'masuk-2025-05-15-07-20-33-default.png', '2025-05-15', '17:35:31', 'keluar-2025-05-15-17-35-31-default.png', NULL, NULL, NULL),
(747, 8, '2025-05-16', '07:31:10', 'masuk-2025-05-16-07-31-10-default.png', '2025-05-16', '16:41:22', 'keluar-2025-05-16-16-41-22-default.png', NULL, NULL, NULL),
(748, 8, '2025-05-19', '07:01:32', 'masuk-2025-05-19-07-01-32-default.png', '2025-05-19', '16:54:26', 'keluar-2025-05-19-16-54-26-default.png', NULL, NULL, NULL),
(749, 8, '2025-05-20', '07:31:03', 'masuk-2025-05-20-07-31-03-default.png', '2025-05-20', '16:12:27', 'keluar-2025-05-20-16-12-27-default.png', NULL, NULL, NULL),
(750, 8, '2025-05-21', '07:28:51', 'masuk-2025-05-21-07-28-51-default.png', '2025-05-21', '17:52:01', 'keluar-2025-05-21-17-52-01-default.png', NULL, NULL, NULL),
(751, 8, '2025-05-22', '07:48:30', 'masuk-2025-05-22-07-48-30-default.png', '2025-05-22', '17:42:10', 'keluar-2025-05-22-17-42-10-default.png', NULL, NULL, NULL),
(752, 8, '2025-05-23', '07:29:10', 'masuk-2025-05-23-07-29-10-default.png', '2025-05-23', '16:18:02', 'keluar-2025-05-23-16-18-02-default.png', NULL, NULL, NULL),
(753, 8, '2025-05-26', '07:35:36', 'masuk-2025-05-26-07-35-36-default.png', '2025-05-26', '16:21:16', 'keluar-2025-05-26-16-21-16-default.png', NULL, NULL, NULL),
(754, 8, '2025-05-27', '08:40:32', 'masuk-2025-05-27-08-40-32-default.png', '2025-05-27', '16:28:04', 'keluar-2025-05-27-16-28-04-default.png', NULL, NULL, NULL),
(755, 8, '2025-05-28', '07:32:36', 'masuk-2025-05-28-07-32-36-default.png', '2025-05-28', '17:49:22', 'keluar-2025-05-28-17-49-22-default.png', NULL, NULL, NULL),
(756, 8, '2025-05-29', '08:35:21', 'masuk-2025-05-29-08-35-21-default.png', '2025-05-29', '17:12:05', 'keluar-2025-05-29-17-12-05-default.png', NULL, NULL, NULL),
(757, 8, '2025-05-30', '07:24:54', 'masuk-2025-05-30-07-24-54-default.png', '2025-05-30', '16:04:13', 'keluar-2025-05-30-16-04-13-default.png', NULL, NULL, NULL),
(758, 9, '2025-01-01', '07:14:10', 'masuk-2025-01-01-07-14-10-default.png', '2025-01-01', '17:23:19', 'keluar-2025-01-01-17-23-19-default.png', NULL, NULL, NULL),
(759, 9, '2025-01-02', '07:27:53', 'masuk-2025-01-02-07-27-53-default.png', '2025-01-02', '16:54:01', 'keluar-2025-01-02-16-54-01-default.png', NULL, NULL, NULL),
(760, 9, '2025-01-03', '07:02:11', 'masuk-2025-01-03-07-02-11-default.png', '2025-01-03', '17:25:48', 'keluar-2025-01-03-17-25-48-default.png', NULL, NULL, NULL),
(761, 9, '2025-01-06', '08:37:34', 'masuk-2025-01-06-08-37-34-default.png', '2025-01-06', '16:39:12', 'keluar-2025-01-06-16-39-12-default.png', NULL, NULL, NULL),
(762, 9, '2025-01-07', '07:45:54', 'masuk-2025-01-07-07-45-54-default.png', '2025-01-07', '16:05:17', 'keluar-2025-01-07-16-05-17-default.png', NULL, NULL, NULL),
(763, 9, '2025-01-08', '07:23:39', 'masuk-2025-01-08-07-23-39-default.png', '2025-01-08', '16:14:36', 'keluar-2025-01-08-16-14-36-default.png', NULL, NULL, NULL),
(764, 9, '2025-01-09', '08:29:38', 'masuk-2025-01-09-08-29-38-default.png', '2025-01-09', '16:55:36', 'keluar-2025-01-09-16-55-36-default.png', NULL, NULL, NULL),
(765, 9, '2025-01-10', '08:48:16', 'masuk-2025-01-10-08-48-16-default.png', '2025-01-10', '17:32:44', 'keluar-2025-01-10-17-32-44-default.png', NULL, NULL, NULL),
(766, 9, '2025-01-13', '07:57:02', 'masuk-2025-01-13-07-57-02-default.png', '2025-01-13', '17:00:13', 'keluar-2025-01-13-17-00-13-default.png', NULL, NULL, NULL),
(767, 9, '2025-01-14', '07:56:11', 'masuk-2025-01-14-07-56-11-default.png', '2025-01-14', '16:21:44', 'keluar-2025-01-14-16-21-44-default.png', NULL, NULL, NULL),
(768, 9, '2025-01-15', '07:18:28', 'masuk-2025-01-15-07-18-28-default.png', '2025-01-15', '17:19:15', 'keluar-2025-01-15-17-19-15-default.png', NULL, NULL, NULL),
(769, 9, '2025-01-16', '08:03:33', 'masuk-2025-01-16-08-03-33-default.png', '2025-01-16', '16:44:45', 'keluar-2025-01-16-16-44-45-default.png', NULL, NULL, NULL),
(770, 9, '2025-01-17', '08:23:10', 'masuk-2025-01-17-08-23-10-default.png', '2025-01-17', '16:25:46', 'keluar-2025-01-17-16-25-46-default.png', NULL, NULL, NULL),
(771, 9, '2025-01-20', '07:31:50', 'masuk-2025-01-20-07-31-50-default.png', '2025-01-20', '17:45:42', 'keluar-2025-01-20-17-45-42-default.png', NULL, NULL, NULL),
(772, 9, '2025-01-21', '07:23:13', 'masuk-2025-01-21-07-23-13-default.png', '2025-01-21', '16:51:34', 'keluar-2025-01-21-16-51-34-default.png', NULL, NULL, NULL),
(773, 9, '2025-01-22', '07:06:20', 'masuk-2025-01-22-07-06-20-default.png', '2025-01-22', '16:08:37', 'keluar-2025-01-22-16-08-37-default.png', NULL, NULL, NULL),
(774, 9, '2025-01-23', '07:05:18', 'masuk-2025-01-23-07-05-18-default.png', '2025-01-23', '17:44:58', 'keluar-2025-01-23-17-44-58-default.png', NULL, NULL, NULL),
(775, 9, '2025-01-24', '08:45:54', 'masuk-2025-01-24-08-45-54-default.png', '2025-01-24', '16:11:06', 'keluar-2025-01-24-16-11-06-default.png', NULL, NULL, NULL),
(776, 9, '2025-01-27', '07:24:50', 'masuk-2025-01-27-07-24-50-default.png', '2025-01-27', '17:43:09', 'keluar-2025-01-27-17-43-09-default.png', NULL, NULL, NULL),
(777, 9, '2025-01-28', '07:49:54', 'masuk-2025-01-28-07-49-54-default.png', '2025-01-28', '16:29:02', 'keluar-2025-01-28-16-29-02-default.png', NULL, NULL, NULL),
(778, 9, '2025-01-29', '07:11:13', 'masuk-2025-01-29-07-11-13-default.png', '2025-01-29', '17:37:51', 'keluar-2025-01-29-17-37-51-default.png', NULL, NULL, NULL),
(779, 9, '2025-01-30', '07:34:21', 'masuk-2025-01-30-07-34-21-default.png', '2025-01-30', '16:03:14', 'keluar-2025-01-30-16-03-14-default.png', NULL, NULL, NULL),
(780, 9, '2025-01-31', '08:30:33', 'masuk-2025-01-31-08-30-33-default.png', '2025-01-31', '17:11:34', 'keluar-2025-01-31-17-11-34-default.png', NULL, NULL, NULL),
(781, 9, '2025-02-03', '08:00:19', 'masuk-2025-02-03-08-00-19-default.png', '2025-02-03', '17:51:16', 'keluar-2025-02-03-17-51-16-default.png', NULL, NULL, NULL),
(782, 9, '2025-02-04', '07:57:04', 'masuk-2025-02-04-07-57-04-default.png', '2025-02-04', '16:42:44', 'keluar-2025-02-04-16-42-44-default.png', NULL, NULL, NULL),
(783, 9, '2025-02-05', '07:17:01', 'masuk-2025-02-05-07-17-01-default.png', '2025-02-05', '17:15:39', 'keluar-2025-02-05-17-15-39-default.png', NULL, NULL, NULL),
(784, 9, '2025-02-06', '08:11:15', 'masuk-2025-02-06-08-11-15-default.png', '2025-02-06', '17:35:45', 'keluar-2025-02-06-17-35-45-default.png', NULL, NULL, NULL),
(785, 9, '2025-02-07', '07:28:14', 'masuk-2025-02-07-07-28-14-default.png', '2025-02-07', '16:44:17', 'keluar-2025-02-07-16-44-17-default.png', NULL, NULL, NULL),
(786, 9, '2025-02-10', '07:36:51', 'masuk-2025-02-10-07-36-51-default.png', '2025-02-10', '17:26:05', 'keluar-2025-02-10-17-26-05-default.png', NULL, NULL, NULL),
(787, 9, '2025-02-11', '07:04:45', 'masuk-2025-02-11-07-04-45-default.png', '2025-02-11', '17:40:03', 'keluar-2025-02-11-17-40-03-default.png', NULL, NULL, NULL),
(788, 9, '2025-02-12', '08:58:19', 'masuk-2025-02-12-08-58-19-default.png', '2025-02-12', '16:43:04', 'keluar-2025-02-12-16-43-04-default.png', NULL, NULL, NULL),
(789, 9, '2025-02-13', '07:54:22', 'masuk-2025-02-13-07-54-22-default.png', '2025-02-13', '17:16:04', 'keluar-2025-02-13-17-16-04-default.png', NULL, NULL, NULL),
(790, 9, '2025-02-14', '07:08:01', 'masuk-2025-02-14-07-08-01-default.png', '2025-02-14', '16:28:49', 'keluar-2025-02-14-16-28-49-default.png', NULL, NULL, NULL),
(791, 9, '2025-02-17', '08:11:11', 'masuk-2025-02-17-08-11-11-default.png', '2025-02-17', '17:05:26', 'keluar-2025-02-17-17-05-26-default.png', NULL, NULL, NULL),
(792, 9, '2025-02-18', '07:39:21', 'masuk-2025-02-18-07-39-21-default.png', '2025-02-18', '17:39:04', 'keluar-2025-02-18-17-39-04-default.png', NULL, NULL, NULL),
(793, 9, '2025-02-19', '07:21:22', 'masuk-2025-02-19-07-21-22-default.png', '2025-02-19', '17:34:40', 'keluar-2025-02-19-17-34-40-default.png', NULL, NULL, NULL),
(794, 9, '2025-02-20', '08:30:41', 'masuk-2025-02-20-08-30-41-default.png', '2025-02-20', '16:04:35', 'keluar-2025-02-20-16-04-35-default.png', NULL, NULL, NULL),
(795, 9, '2025-02-21', '07:46:31', 'masuk-2025-02-21-07-46-31-default.png', '2025-02-21', '17:27:53', 'keluar-2025-02-21-17-27-53-default.png', NULL, NULL, NULL),
(796, 9, '2025-02-24', '08:54:01', 'masuk-2025-02-24-08-54-01-default.png', '2025-02-24', '17:55:50', 'keluar-2025-02-24-17-55-50-default.png', NULL, NULL, NULL),
(797, 9, '2025-02-25', '08:25:41', 'masuk-2025-02-25-08-25-41-default.png', '2025-02-25', '16:43:33', 'keluar-2025-02-25-16-43-33-default.png', NULL, NULL, NULL),
(798, 9, '2025-02-26', '07:49:00', 'masuk-2025-02-26-07-49-00-default.png', '2025-02-26', '17:36:27', 'keluar-2025-02-26-17-36-27-default.png', NULL, NULL, NULL),
(799, 9, '2025-02-27', '08:51:53', 'masuk-2025-02-27-08-51-53-default.png', '2025-02-27', '17:43:23', 'keluar-2025-02-27-17-43-23-default.png', NULL, NULL, NULL),
(800, 9, '2025-02-28', '07:36:53', 'masuk-2025-02-28-07-36-53-default.png', '2025-02-28', '16:08:58', 'keluar-2025-02-28-16-08-58-default.png', NULL, NULL, NULL),
(801, 9, '2025-03-03', '08:48:23', 'masuk-2025-03-03-08-48-23-default.png', '2025-03-03', '17:28:41', 'keluar-2025-03-03-17-28-41-default.png', NULL, NULL, NULL),
(802, 9, '2025-03-04', '07:19:45', 'masuk-2025-03-04-07-19-45-default.png', '2025-03-04', '16:58:12', 'keluar-2025-03-04-16-58-12-default.png', NULL, NULL, NULL),
(803, 9, '2025-03-05', '07:10:51', 'masuk-2025-03-05-07-10-51-default.png', '2025-03-05', '16:16:02', 'keluar-2025-03-05-16-16-02-default.png', NULL, NULL, NULL),
(804, 9, '2025-03-06', '08:47:34', 'masuk-2025-03-06-08-47-34-default.png', '2025-03-06', '16:39:15', 'keluar-2025-03-06-16-39-15-default.png', NULL, NULL, NULL),
(805, 9, '2025-03-07', '08:11:02', 'masuk-2025-03-07-08-11-02-default.png', '2025-03-07', '17:33:45', 'keluar-2025-03-07-17-33-45-default.png', NULL, NULL, NULL),
(806, 9, '2025-03-10', '08:10:51', 'masuk-2025-03-10-08-10-51-default.png', '2025-03-10', '16:34:04', 'keluar-2025-03-10-16-34-04-default.png', NULL, NULL, NULL),
(807, 9, '2025-03-11', '07:30:54', 'masuk-2025-03-11-07-30-54-default.png', '2025-03-11', '17:27:26', 'keluar-2025-03-11-17-27-26-default.png', NULL, NULL, NULL),
(808, 9, '2025-03-12', '07:03:45', 'masuk-2025-03-12-07-03-45-default.png', '2025-03-12', '17:39:33', 'keluar-2025-03-12-17-39-33-default.png', NULL, NULL, NULL),
(809, 9, '2025-03-13', '08:29:06', 'masuk-2025-03-13-08-29-06-default.png', '2025-03-13', '17:48:17', 'keluar-2025-03-13-17-48-17-default.png', NULL, NULL, NULL),
(810, 9, '2025-03-14', '08:31:54', 'masuk-2025-03-14-08-31-54-default.png', '2025-03-14', '16:43:58', 'keluar-2025-03-14-16-43-58-default.png', NULL, NULL, NULL),
(811, 9, '2025-03-17', '08:37:40', 'masuk-2025-03-17-08-37-40-default.png', '2025-03-17', '16:46:15', 'keluar-2025-03-17-16-46-15-default.png', NULL, NULL, NULL),
(812, 9, '2025-03-18', '08:22:04', 'masuk-2025-03-18-08-22-04-default.png', '2025-03-18', '16:45:08', 'keluar-2025-03-18-16-45-08-default.png', NULL, NULL, NULL),
(813, 9, '2025-03-19', '08:07:41', 'masuk-2025-03-19-08-07-41-default.png', '2025-03-19', '17:21:27', 'keluar-2025-03-19-17-21-27-default.png', NULL, NULL, NULL),
(814, 9, '2025-03-20', '07:15:56', 'masuk-2025-03-20-07-15-56-default.png', '2025-03-20', '17:20:04', 'keluar-2025-03-20-17-20-04-default.png', NULL, NULL, NULL),
(815, 9, '2025-03-21', '08:43:11', 'masuk-2025-03-21-08-43-11-default.png', '2025-03-21', '17:02:20', 'keluar-2025-03-21-17-02-20-default.png', NULL, NULL, NULL),
(816, 9, '2025-03-24', '07:27:36', 'masuk-2025-03-24-07-27-36-default.png', '2025-03-24', '16:19:56', 'keluar-2025-03-24-16-19-56-default.png', NULL, NULL, NULL),
(817, 9, '2025-03-25', '08:51:52', 'masuk-2025-03-25-08-51-52-default.png', '2025-03-25', '17:39:45', 'keluar-2025-03-25-17-39-45-default.png', NULL, NULL, NULL),
(818, 9, '2025-03-26', '07:45:31', 'masuk-2025-03-26-07-45-31-default.png', '2025-03-26', '16:54:39', 'keluar-2025-03-26-16-54-39-default.png', NULL, NULL, NULL),
(819, 9, '2025-03-27', '08:56:53', 'masuk-2025-03-27-08-56-53-default.png', '2025-03-27', '16:07:32', 'keluar-2025-03-27-16-07-32-default.png', NULL, NULL, NULL),
(820, 9, '2025-03-28', '08:19:05', 'masuk-2025-03-28-08-19-05-default.png', '2025-03-28', '16:50:27', 'keluar-2025-03-28-16-50-27-default.png', NULL, NULL, NULL),
(821, 9, '2025-03-31', '08:29:56', 'masuk-2025-03-31-08-29-56-default.png', '2025-03-31', '17:43:12', 'keluar-2025-03-31-17-43-12-default.png', NULL, NULL, NULL),
(822, 9, '2025-04-01', '07:55:23', 'masuk-2025-04-01-07-55-23-default.png', '2025-04-01', '16:31:23', 'keluar-2025-04-01-16-31-23-default.png', NULL, NULL, NULL),
(823, 9, '2025-04-02', '07:48:40', 'masuk-2025-04-02-07-48-40-default.png', '2025-04-02', '16:32:35', 'keluar-2025-04-02-16-32-35-default.png', NULL, NULL, NULL),
(824, 9, '2025-04-03', '08:22:41', 'masuk-2025-04-03-08-22-41-default.png', '2025-04-03', '17:47:55', 'keluar-2025-04-03-17-47-55-default.png', NULL, NULL, NULL),
(825, 9, '2025-04-04', '08:23:10', 'masuk-2025-04-04-08-23-10-default.png', '2025-04-04', '16:16:34', 'keluar-2025-04-04-16-16-34-default.png', NULL, NULL, NULL),
(826, 9, '2025-04-07', '08:20:08', 'masuk-2025-04-07-08-20-08-default.png', '2025-04-07', '16:21:13', 'keluar-2025-04-07-16-21-13-default.png', NULL, NULL, NULL),
(827, 9, '2025-04-08', '08:12:04', 'masuk-2025-04-08-08-12-04-default.png', '2025-04-08', '16:43:10', 'keluar-2025-04-08-16-43-10-default.png', NULL, NULL, NULL),
(828, 9, '2025-04-09', '08:51:15', 'masuk-2025-04-09-08-51-15-default.png', '2025-04-09', '16:14:00', 'keluar-2025-04-09-16-14-00-default.png', NULL, NULL, NULL),
(829, 9, '2025-04-10', '07:03:52', 'masuk-2025-04-10-07-03-52-default.png', '2025-04-10', '17:26:31', 'keluar-2025-04-10-17-26-31-default.png', NULL, NULL, NULL),
(830, 9, '2025-04-11', '07:25:31', 'masuk-2025-04-11-07-25-31-default.png', '2025-04-11', '16:52:09', 'keluar-2025-04-11-16-52-09-default.png', NULL, NULL, NULL),
(831, 9, '2025-04-14', '07:19:20', 'masuk-2025-04-14-07-19-20-default.png', '2025-04-14', '16:29:53', 'keluar-2025-04-14-16-29-53-default.png', NULL, NULL, NULL),
(832, 9, '2025-04-15', '07:56:53', 'masuk-2025-04-15-07-56-53-default.png', '2025-04-15', '16:29:54', 'keluar-2025-04-15-16-29-54-default.png', NULL, NULL, NULL),
(833, 9, '2025-04-16', '08:52:13', 'masuk-2025-04-16-08-52-13-default.png', '2025-04-16', '17:34:59', 'keluar-2025-04-16-17-34-59-default.png', NULL, NULL, NULL),
(834, 9, '2025-04-17', '08:58:08', 'masuk-2025-04-17-08-58-08-default.png', '2025-04-17', '16:18:02', 'keluar-2025-04-17-16-18-02-default.png', NULL, NULL, NULL),
(835, 9, '2025-04-18', '08:58:15', 'masuk-2025-04-18-08-58-15-default.png', '2025-04-18', '17:24:55', 'keluar-2025-04-18-17-24-55-default.png', NULL, NULL, NULL),
(836, 9, '2025-04-21', '07:31:24', 'masuk-2025-04-21-07-31-24-default.png', '2025-04-21', '17:26:37', 'keluar-2025-04-21-17-26-37-default.png', NULL, NULL, NULL),
(837, 9, '2025-04-22', '07:03:23', 'masuk-2025-04-22-07-03-23-default.png', '2025-04-22', '16:39:18', 'keluar-2025-04-22-16-39-18-default.png', NULL, NULL, NULL),
(838, 9, '2025-04-23', '08:45:02', 'masuk-2025-04-23-08-45-02-default.png', '2025-04-23', '17:18:24', 'keluar-2025-04-23-17-18-24-default.png', NULL, NULL, NULL),
(839, 9, '2025-04-24', '07:47:26', 'masuk-2025-04-24-07-47-26-default.png', '2025-04-24', '17:44:29', 'keluar-2025-04-24-17-44-29-default.png', NULL, NULL, NULL),
(840, 9, '2025-04-25', '08:49:16', 'masuk-2025-04-25-08-49-16-default.png', '2025-04-25', '16:22:32', 'keluar-2025-04-25-16-22-32-default.png', NULL, NULL, NULL),
(842, 9, '2025-04-29', '07:52:22', 'masuk-2025-04-29-07-52-22-default.png', '2025-04-29', '16:41:14', 'keluar-2025-04-29-16-41-14-default.png', NULL, NULL, NULL),
(843, 9, '2025-04-30', '08:45:32', 'masuk-2025-04-30-08-45-32-default.png', '2025-04-30', '16:40:02', 'keluar-2025-04-30-16-40-02-default.png', NULL, NULL, NULL),
(844, 9, '2025-05-01', '07:32:11', 'masuk-2025-05-01-07-32-11-default.png', '2025-05-01', '17:40:40', 'keluar-2025-05-01-17-40-40-default.png', NULL, NULL, NULL),
(846, 9, '2025-05-05', '07:23:20', 'masuk-2025-05-05-07-23-20-default.png', '2025-05-05', '16:25:41', 'keluar-2025-05-05-16-25-41-default.png', NULL, NULL, NULL),
(847, 9, '2025-05-06', '07:59:16', 'masuk-2025-05-06-07-59-16-default.png', '2025-05-06', '16:38:33', 'keluar-2025-05-06-16-38-33-default.png', NULL, NULL, NULL),
(848, 9, '2025-05-07', '07:20:17', 'masuk-2025-05-07-07-20-17-default.png', '2025-05-07', '17:50:22', 'keluar-2025-05-07-17-50-22-default.png', NULL, NULL, NULL),
(849, 9, '2025-05-08', '07:51:51', 'masuk-2025-05-08-07-51-51-default.png', '2025-05-08', '17:47:50', 'keluar-2025-05-08-17-47-50-default.png', NULL, NULL, NULL),
(850, 9, '2025-05-09', '08:24:52', 'masuk-2025-05-09-08-24-52-default.png', '2025-05-09', '17:11:45', 'keluar-2025-05-09-17-11-45-default.png', NULL, NULL, NULL),
(851, 9, '2025-05-12', '08:22:20', 'masuk-2025-05-12-08-22-20-default.png', '2025-05-12', '17:14:29', 'keluar-2025-05-12-17-14-29-default.png', NULL, NULL, NULL),
(852, 9, '2025-05-13', '08:56:12', 'masuk-2025-05-13-08-56-12-default.png', '2025-05-13', '16:43:26', 'keluar-2025-05-13-16-43-26-default.png', NULL, NULL, NULL),
(853, 9, '2025-05-14', '08:29:25', 'masuk-2025-05-14-08-29-25-default.png', '2025-05-14', '17:37:07', 'keluar-2025-05-14-17-37-07-default.png', NULL, NULL, NULL),
(854, 9, '2025-05-15', '08:32:40', 'masuk-2025-05-15-08-32-40-default.png', '2025-05-15', '16:53:24', 'keluar-2025-05-15-16-53-24-default.png', NULL, NULL, NULL),
(855, 9, '2025-05-16', '08:05:30', 'masuk-2025-05-16-08-05-30-default.png', '2025-05-16', '17:13:14', 'keluar-2025-05-16-17-13-14-default.png', NULL, NULL, NULL),
(856, 9, '2025-05-19', '08:43:00', 'masuk-2025-05-19-08-43-00-default.png', '2025-05-19', '16:14:39', 'keluar-2025-05-19-16-14-39-default.png', NULL, NULL, NULL),
(857, 9, '2025-05-20', '07:59:04', 'masuk-2025-05-20-07-59-04-default.png', '2025-05-20', '17:15:56', 'keluar-2025-05-20-17-15-56-default.png', NULL, NULL, NULL),
(858, 9, '2025-05-21', '08:00:34', 'masuk-2025-05-21-08-00-34-default.png', '2025-05-21', '17:27:12', 'keluar-2025-05-21-17-27-12-default.png', NULL, NULL, NULL),
(859, 9, '2025-05-22', '07:31:15', 'masuk-2025-05-22-07-31-15-default.png', '2025-05-22', '16:39:19', 'keluar-2025-05-22-16-39-19-default.png', NULL, NULL, NULL),
(860, 9, '2025-05-23', '07:43:34', 'masuk-2025-05-23-07-43-34-default.png', '2025-05-23', '16:40:31', 'keluar-2025-05-23-16-40-31-default.png', NULL, NULL, NULL),
(861, 9, '2025-05-26', '08:28:51', 'masuk-2025-05-26-08-28-51-default.png', '2025-05-26', '16:35:51', 'keluar-2025-05-26-16-35-51-default.png', NULL, NULL, NULL),
(862, 9, '2025-05-27', '08:19:15', 'masuk-2025-05-27-08-19-15-default.png', '2025-05-27', '16:02:15', 'keluar-2025-05-27-16-02-15-default.png', NULL, NULL, NULL),
(864, 9, '2025-05-29', '08:29:45', 'masuk-2025-05-29-08-29-45-default.png', '2025-05-29', '16:20:50', 'keluar-2025-05-29-16-20-50-default.png', NULL, NULL, NULL),
(865, 9, '2025-05-30', '08:34:43', 'masuk-2025-05-30-08-34-43-default.png', '2025-05-30', '17:17:09', 'keluar-2025-05-30-17-17-09-default.png', NULL, NULL, NULL),
(866, 10, '2025-01-01', '07:43:02', 'masuk-2025-01-01-07-43-02-default.png', '2025-01-01', '16:22:50', 'keluar-2025-01-01-16-22-50-default.png', NULL, NULL, NULL),
(867, 10, '2025-01-02', '07:20:49', 'masuk-2025-01-02-07-20-49-default.png', '2025-01-02', '17:25:14', 'keluar-2025-01-02-17-25-14-default.png', NULL, NULL, NULL),
(868, 10, '2025-01-03', '07:00:29', 'masuk-2025-01-03-07-00-29-default.png', '2025-01-03', '16:43:29', 'keluar-2025-01-03-16-43-29-default.png', NULL, NULL, NULL),
(869, 10, '2025-01-06', '08:17:54', 'masuk-2025-01-06-08-17-54-default.png', '2025-01-06', '17:30:05', 'keluar-2025-01-06-17-30-05-default.png', NULL, NULL, NULL),
(870, 10, '2025-01-07', '07:28:03', 'masuk-2025-01-07-07-28-03-default.png', '2025-01-07', '16:18:30', 'keluar-2025-01-07-16-18-30-default.png', NULL, NULL, NULL),
(871, 10, '2025-01-08', '08:30:58', 'masuk-2025-01-08-08-30-58-default.png', '2025-01-08', '16:57:05', 'keluar-2025-01-08-16-57-05-default.png', NULL, NULL, NULL),
(872, 10, '2025-01-09', '07:42:11', 'masuk-2025-01-09-07-42-11-default.png', '2025-01-09', '17:22:58', 'keluar-2025-01-09-17-22-58-default.png', NULL, NULL, NULL),
(873, 10, '2025-01-10', '07:34:38', 'masuk-2025-01-10-07-34-38-default.png', '2025-01-10', '17:54:16', 'keluar-2025-01-10-17-54-16-default.png', NULL, NULL, NULL),
(874, 10, '2025-01-13', '08:38:58', 'masuk-2025-01-13-08-38-58-default.png', '2025-01-13', '16:56:13', 'keluar-2025-01-13-16-56-13-default.png', NULL, NULL, NULL),
(875, 10, '2025-01-14', '08:57:00', 'masuk-2025-01-14-08-57-00-default.png', '2025-01-14', '17:36:42', 'keluar-2025-01-14-17-36-42-default.png', NULL, NULL, NULL),
(876, 10, '2025-01-15', '07:47:49', 'masuk-2025-01-15-07-47-49-default.png', '2025-01-15', '17:27:32', 'keluar-2025-01-15-17-27-32-default.png', NULL, NULL, NULL),
(877, 10, '2025-01-16', '08:27:37', 'masuk-2025-01-16-08-27-37-default.png', '2025-01-16', '16:26:17', 'keluar-2025-01-16-16-26-17-default.png', NULL, NULL, NULL),
(878, 10, '2025-01-17', '08:21:54', 'masuk-2025-01-17-08-21-54-default.png', '2025-01-17', '16:30:05', 'keluar-2025-01-17-16-30-05-default.png', NULL, NULL, NULL),
(879, 10, '2025-01-20', '07:52:45', 'masuk-2025-01-20-07-52-45-default.png', '2025-01-20', '17:13:55', 'keluar-2025-01-20-17-13-55-default.png', NULL, NULL, NULL),
(880, 10, '2025-01-21', '08:39:56', 'masuk-2025-01-21-08-39-56-default.png', '2025-01-21', '17:10:26', 'keluar-2025-01-21-17-10-26-default.png', NULL, NULL, NULL),
(881, 10, '2025-01-22', '08:52:24', 'masuk-2025-01-22-08-52-24-default.png', '2025-01-22', '17:52:29', 'keluar-2025-01-22-17-52-29-default.png', NULL, NULL, NULL),
(882, 10, '2025-01-23', '07:33:38', 'masuk-2025-01-23-07-33-38-default.png', '2025-01-23', '16:27:56', 'keluar-2025-01-23-16-27-56-default.png', NULL, NULL, NULL),
(883, 10, '2025-01-24', '07:22:49', 'masuk-2025-01-24-07-22-49-default.png', '2025-01-24', '17:53:20', 'keluar-2025-01-24-17-53-20-default.png', NULL, NULL, NULL),
(884, 10, '2025-01-27', '07:13:22', 'masuk-2025-01-27-07-13-22-default.png', '2025-01-27', '17:08:32', 'keluar-2025-01-27-17-08-32-default.png', NULL, NULL, NULL),
(885, 10, '2025-01-28', '07:58:48', 'masuk-2025-01-28-07-58-48-default.png', '2025-01-28', '16:10:57', 'keluar-2025-01-28-16-10-57-default.png', NULL, NULL, NULL),
(886, 10, '2025-01-29', '07:47:38', 'masuk-2025-01-29-07-47-38-default.png', '2025-01-29', '17:51:56', 'keluar-2025-01-29-17-51-56-default.png', NULL, NULL, NULL),
(887, 10, '2025-01-30', '08:05:42', 'masuk-2025-01-30-08-05-42-default.png', '2025-01-30', '16:27:18', 'keluar-2025-01-30-16-27-18-default.png', NULL, NULL, NULL),
(888, 10, '2025-01-31', '07:08:06', 'masuk-2025-01-31-07-08-06-default.png', '2025-01-31', '17:02:55', 'keluar-2025-01-31-17-02-55-default.png', NULL, NULL, NULL),
(889, 10, '2025-02-03', '07:00:58', 'masuk-2025-02-03-07-00-58-default.png', '2025-02-03', '17:00:15', 'keluar-2025-02-03-17-00-15-default.png', NULL, NULL, NULL),
(890, 10, '2025-02-04', '08:28:21', 'masuk-2025-02-04-08-28-21-default.png', '2025-02-04', '17:56:27', 'keluar-2025-02-04-17-56-27-default.png', NULL, NULL, NULL),
(891, 10, '2025-02-05', '07:58:17', 'masuk-2025-02-05-07-58-17-default.png', '2025-02-05', '16:27:13', 'keluar-2025-02-05-16-27-13-default.png', NULL, NULL, NULL),
(892, 10, '2025-02-06', '07:33:31', 'masuk-2025-02-06-07-33-31-default.png', '2025-02-06', '16:52:06', 'keluar-2025-02-06-16-52-06-default.png', NULL, NULL, NULL),
(893, 10, '2025-02-07', '08:18:12', 'masuk-2025-02-07-08-18-12-default.png', '2025-02-07', '16:03:49', 'keluar-2025-02-07-16-03-49-default.png', NULL, NULL, NULL),
(894, 10, '2025-02-10', '07:26:12', 'masuk-2025-02-10-07-26-12-default.png', '2025-02-10', '16:38:18', 'keluar-2025-02-10-16-38-18-default.png', NULL, NULL, NULL),
(895, 10, '2025-02-11', '07:48:33', 'masuk-2025-02-11-07-48-33-default.png', '2025-02-11', '16:28:11', 'keluar-2025-02-11-16-28-11-default.png', NULL, NULL, NULL),
(896, 10, '2025-02-12', '08:03:30', 'masuk-2025-02-12-08-03-30-default.png', '2025-02-12', '16:16:25', 'keluar-2025-02-12-16-16-25-default.png', NULL, NULL, NULL),
(897, 10, '2025-02-13', '07:59:55', 'masuk-2025-02-13-07-59-55-default.png', '2025-02-13', '16:53:29', 'keluar-2025-02-13-16-53-29-default.png', NULL, NULL, NULL),
(898, 10, '2025-02-14', '07:13:44', 'masuk-2025-02-14-07-13-44-default.png', '2025-02-14', '17:02:08', 'keluar-2025-02-14-17-02-08-default.png', NULL, NULL, NULL),
(899, 10, '2025-02-17', '08:03:53', 'masuk-2025-02-17-08-03-53-default.png', '2025-02-17', '17:46:32', 'keluar-2025-02-17-17-46-32-default.png', NULL, NULL, NULL),
(900, 10, '2025-02-18', '07:14:08', 'masuk-2025-02-18-07-14-08-default.png', '2025-02-18', '17:36:42', 'keluar-2025-02-18-17-36-42-default.png', NULL, NULL, NULL),
(901, 10, '2025-02-19', '08:25:47', 'masuk-2025-02-19-08-25-47-default.png', '2025-02-19', '17:50:21', 'keluar-2025-02-19-17-50-21-default.png', NULL, NULL, NULL),
(902, 10, '2025-02-20', '07:40:23', 'masuk-2025-02-20-07-40-23-default.png', '2025-02-20', '17:54:40', 'keluar-2025-02-20-17-54-40-default.png', NULL, NULL, NULL),
(903, 10, '2025-02-21', '08:09:27', 'masuk-2025-02-21-08-09-27-default.png', '2025-02-21', '17:53:33', 'keluar-2025-02-21-17-53-33-default.png', NULL, NULL, NULL),
(904, 10, '2025-02-24', '08:17:29', 'masuk-2025-02-24-08-17-29-default.png', '2025-02-24', '17:20:49', 'keluar-2025-02-24-17-20-49-default.png', NULL, NULL, NULL),
(905, 10, '2025-02-25', '07:33:46', 'masuk-2025-02-25-07-33-46-default.png', '2025-02-25', '16:17:27', 'keluar-2025-02-25-16-17-27-default.png', NULL, NULL, NULL),
(906, 10, '2025-02-26', '07:42:57', 'masuk-2025-02-26-07-42-57-default.png', '2025-02-26', '17:43:31', 'keluar-2025-02-26-17-43-31-default.png', NULL, NULL, NULL),
(907, 10, '2025-02-27', '07:03:48', 'masuk-2025-02-27-07-03-48-default.png', '2025-02-27', '17:06:41', 'keluar-2025-02-27-17-06-41-default.png', NULL, NULL, NULL),
(908, 10, '2025-02-28', '08:12:26', 'masuk-2025-02-28-08-12-26-default.png', '2025-02-28', '17:33:28', 'keluar-2025-02-28-17-33-28-default.png', NULL, NULL, NULL),
(909, 10, '2025-03-03', '07:40:28', 'masuk-2025-03-03-07-40-28-default.png', '2025-03-03', '16:51:30', 'keluar-2025-03-03-16-51-30-default.png', NULL, NULL, NULL),
(910, 10, '2025-03-04', '08:16:57', 'masuk-2025-03-04-08-16-57-default.png', '2025-03-04', '16:34:38', 'keluar-2025-03-04-16-34-38-default.png', NULL, NULL, NULL),
(911, 10, '2025-03-05', '07:13:28', 'masuk-2025-03-05-07-13-28-default.png', '2025-03-05', '17:08:02', 'keluar-2025-03-05-17-08-02-default.png', NULL, NULL, NULL),
(912, 10, '2025-03-06', '07:16:04', 'masuk-2025-03-06-07-16-04-default.png', '2025-03-06', '17:21:53', 'keluar-2025-03-06-17-21-53-default.png', NULL, NULL, NULL),
(913, 10, '2025-03-07', '08:21:30', 'masuk-2025-03-07-08-21-30-default.png', '2025-03-07', '17:31:13', 'keluar-2025-03-07-17-31-13-default.png', NULL, NULL, NULL),
(914, 10, '2025-03-10', '08:45:00', 'masuk-2025-03-10-08-45-00-default.png', '2025-03-10', '17:26:03', 'keluar-2025-03-10-17-26-03-default.png', NULL, NULL, NULL),
(915, 10, '2025-03-11', '08:55:05', 'masuk-2025-03-11-08-55-05-default.png', '2025-03-11', '16:36:04', 'keluar-2025-03-11-16-36-04-default.png', NULL, NULL, NULL),
(916, 10, '2025-03-12', '08:30:23', 'masuk-2025-03-12-08-30-23-default.png', '2025-03-12', '16:13:44', 'keluar-2025-03-12-16-13-44-default.png', NULL, NULL, NULL),
(917, 10, '2025-03-13', '08:01:26', 'masuk-2025-03-13-08-01-26-default.png', '2025-03-13', '16:20:43', 'keluar-2025-03-13-16-20-43-default.png', NULL, NULL, NULL),
(918, 10, '2025-03-14', '07:34:16', 'masuk-2025-03-14-07-34-16-default.png', '2025-03-14', '17:40:07', 'keluar-2025-03-14-17-40-07-default.png', NULL, NULL, NULL),
(919, 10, '2025-03-17', '08:05:23', 'masuk-2025-03-17-08-05-23-default.png', '2025-03-17', '16:44:40', 'keluar-2025-03-17-16-44-40-default.png', NULL, NULL, NULL),
(920, 10, '2025-03-18', '07:23:21', 'masuk-2025-03-18-07-23-21-default.png', '2025-03-18', '17:38:52', 'keluar-2025-03-18-17-38-52-default.png', NULL, NULL, NULL),
(921, 10, '2025-03-19', '08:01:58', 'masuk-2025-03-19-08-01-58-default.png', '2025-03-19', '17:11:12', 'keluar-2025-03-19-17-11-12-default.png', NULL, NULL, NULL),
(922, 10, '2025-03-20', '08:02:35', 'masuk-2025-03-20-08-02-35-default.png', '2025-03-20', '17:13:26', 'keluar-2025-03-20-17-13-26-default.png', NULL, NULL, NULL),
(923, 10, '2025-03-21', '08:32:02', 'masuk-2025-03-21-08-32-02-default.png', '2025-03-21', '16:28:22', 'keluar-2025-03-21-16-28-22-default.png', NULL, NULL, NULL),
(924, 10, '2025-03-24', '07:02:23', 'masuk-2025-03-24-07-02-23-default.png', '2025-03-24', '17:02:13', 'keluar-2025-03-24-17-02-13-default.png', NULL, NULL, NULL),
(925, 10, '2025-03-25', '07:40:14', 'masuk-2025-03-25-07-40-14-default.png', '2025-03-25', '16:06:38', 'keluar-2025-03-25-16-06-38-default.png', NULL, NULL, NULL),
(926, 10, '2025-03-26', '08:39:08', 'masuk-2025-03-26-08-39-08-default.png', '2025-03-26', '16:35:58', 'keluar-2025-03-26-16-35-58-default.png', NULL, NULL, NULL),
(927, 10, '2025-03-27', '08:02:12', 'masuk-2025-03-27-08-02-12-default.png', '2025-03-27', '16:57:57', 'keluar-2025-03-27-16-57-57-default.png', NULL, NULL, NULL),
(928, 10, '2025-03-28', '08:04:58', 'masuk-2025-03-28-08-04-58-default.png', '2025-03-28', '16:25:41', 'keluar-2025-03-28-16-25-41-default.png', NULL, NULL, NULL),
(929, 10, '2025-03-31', '07:00:40', 'masuk-2025-03-31-07-00-40-default.png', '2025-03-31', '17:17:18', 'keluar-2025-03-31-17-17-18-default.png', NULL, NULL, NULL),
(930, 10, '2025-04-01', '07:28:51', 'masuk-2025-04-01-07-28-51-default.png', '2025-04-01', '16:16:38', 'keluar-2025-04-01-16-16-38-default.png', NULL, NULL, NULL),
(931, 10, '2025-04-02', '07:04:25', 'masuk-2025-04-02-07-04-25-default.png', '2025-04-02', '17:48:15', 'keluar-2025-04-02-17-48-15-default.png', NULL, NULL, NULL),
(932, 10, '2025-04-03', '08:01:33', 'masuk-2025-04-03-08-01-33-default.png', '2025-04-03', '17:13:44', 'keluar-2025-04-03-17-13-44-default.png', NULL, NULL, NULL),
(933, 10, '2025-04-04', '07:21:47', 'masuk-2025-04-04-07-21-47-default.png', '2025-04-04', '17:36:10', 'keluar-2025-04-04-17-36-10-default.png', NULL, NULL, NULL),
(934, 10, '2025-04-07', '07:16:04', 'masuk-2025-04-07-07-16-04-default.png', '2025-04-07', '16:02:52', 'keluar-2025-04-07-16-02-52-default.png', NULL, NULL, NULL),
(935, 10, '2025-04-08', '07:26:49', 'masuk-2025-04-08-07-26-49-default.png', '2025-04-08', '16:02:25', 'keluar-2025-04-08-16-02-25-default.png', NULL, NULL, NULL),
(936, 10, '2025-04-09', '08:37:49', 'masuk-2025-04-09-08-37-49-default.png', '2025-04-09', '17:39:00', 'keluar-2025-04-09-17-39-00-default.png', NULL, NULL, NULL),
(937, 10, '2025-04-10', '08:21:58', 'masuk-2025-04-10-08-21-58-default.png', '2025-04-10', '16:53:49', 'keluar-2025-04-10-16-53-49-default.png', NULL, NULL, NULL),
(938, 10, '2025-04-11', '08:27:24', 'masuk-2025-04-11-08-27-24-default.png', '2025-04-11', '16:18:09', 'keluar-2025-04-11-16-18-09-default.png', NULL, NULL, NULL),
(939, 10, '2025-04-14', '07:13:12', 'masuk-2025-04-14-07-13-12-default.png', '2025-04-14', '17:34:04', 'keluar-2025-04-14-17-34-04-default.png', NULL, NULL, NULL),
(940, 10, '2025-04-15', '08:52:41', 'masuk-2025-04-15-08-52-41-default.png', '2025-04-15', '17:22:01', 'keluar-2025-04-15-17-22-01-default.png', NULL, NULL, NULL),
(941, 10, '2025-04-16', '07:45:02', 'masuk-2025-04-16-07-45-02-default.png', '2025-04-16', '16:40:09', 'keluar-2025-04-16-16-40-09-default.png', NULL, NULL, NULL),
(942, 10, '2025-04-17', '07:00:40', 'masuk-2025-04-17-07-00-40-default.png', '2025-04-17', '17:33:45', 'keluar-2025-04-17-17-33-45-default.png', NULL, NULL, NULL),
(943, 10, '2025-04-18', '07:56:00', 'masuk-2025-04-18-07-56-00-default.png', '2025-04-18', '16:30:14', 'keluar-2025-04-18-16-30-14-default.png', NULL, NULL, NULL),
(944, 10, '2025-04-21', '07:30:50', 'masuk-2025-04-21-07-30-50-default.png', '2025-04-21', '17:33:28', 'keluar-2025-04-21-17-33-28-default.png', NULL, NULL, NULL),
(945, 10, '2025-04-22', '08:01:26', 'masuk-2025-04-22-08-01-26-default.png', '2025-04-22', '17:51:04', 'keluar-2025-04-22-17-51-04-default.png', NULL, NULL, NULL),
(946, 10, '2025-04-23', '08:23:54', 'masuk-2025-04-23-08-23-54-default.png', '2025-04-23', '17:35:10', 'keluar-2025-04-23-17-35-10-default.png', NULL, NULL, NULL),
(947, 10, '2025-04-24', '08:47:10', 'masuk-2025-04-24-08-47-10-default.png', '2025-04-24', '17:59:12', 'keluar-2025-04-24-17-59-12-default.png', NULL, NULL, NULL),
(948, 10, '2025-04-25', '08:28:11', 'masuk-2025-04-25-08-28-11-default.png', '2025-04-25', '17:16:51', 'keluar-2025-04-25-17-16-51-default.png', NULL, NULL, NULL),
(949, 10, '2025-04-28', '07:37:05', 'masuk-2025-04-28-07-37-05-default.png', '2025-04-28', '16:39:40', 'keluar-2025-04-28-16-39-40-default.png', NULL, NULL, NULL),
(950, 10, '2025-04-29', '08:33:56', 'masuk-2025-04-29-08-33-56-default.png', '2025-04-29', '17:56:43', 'keluar-2025-04-29-17-56-43-default.png', NULL, NULL, NULL),
(951, 10, '2025-04-30', '07:52:01', 'masuk-2025-04-30-07-52-01-default.png', '2025-04-30', '17:29:27', 'keluar-2025-04-30-17-29-27-default.png', NULL, NULL, NULL),
(952, 10, '2025-05-01', '07:51:23', 'masuk-2025-05-01-07-51-23-default.png', '2025-05-01', '16:52:24', 'keluar-2025-05-01-16-52-24-default.png', NULL, NULL, NULL),
(953, 10, '2025-05-02', '08:58:53', 'masuk-2025-05-02-08-58-53-default.png', '2025-05-02', '17:44:26', 'keluar-2025-05-02-17-44-26-default.png', NULL, NULL, NULL),
(954, 10, '2025-05-05', '08:08:41', 'masuk-2025-05-05-08-08-41-default.png', '2025-05-05', '17:12:48', 'keluar-2025-05-05-17-12-48-default.png', NULL, NULL, NULL),
(955, 10, '2025-05-06', '08:11:24', 'masuk-2025-05-06-08-11-24-default.png', '2025-05-06', '17:05:58', 'keluar-2025-05-06-17-05-58-default.png', NULL, NULL, NULL),
(956, 10, '2025-05-07', '08:00:04', 'masuk-2025-05-07-08-00-04-default.png', '2025-05-07', '17:04:27', 'keluar-2025-05-07-17-04-27-default.png', NULL, NULL, NULL),
(957, 10, '2025-05-08', '08:35:22', 'masuk-2025-05-08-08-35-22-default.png', '2025-05-08', '17:21:19', 'keluar-2025-05-08-17-21-19-default.png', NULL, NULL, NULL),
(958, 10, '2025-05-09', '08:50:02', 'masuk-2025-05-09-08-50-02-default.png', '2025-05-09', '16:31:53', 'keluar-2025-05-09-16-31-53-default.png', NULL, NULL, NULL),
(959, 10, '2025-05-12', '08:55:15', 'masuk-2025-05-12-08-55-15-default.png', '2025-05-12', '16:37:08', 'keluar-2025-05-12-16-37-08-default.png', NULL, NULL, NULL),
(960, 10, '2025-05-13', '07:33:21', 'masuk-2025-05-13-07-33-21-default.png', '2025-05-13', '17:32:44', 'keluar-2025-05-13-17-32-44-default.png', NULL, NULL, NULL),
(961, 10, '2025-05-14', '08:04:20', 'masuk-2025-05-14-08-04-20-default.png', '2025-05-14', '16:55:54', 'keluar-2025-05-14-16-55-54-default.png', NULL, NULL, NULL),
(962, 10, '2025-05-15', '07:49:35', 'masuk-2025-05-15-07-49-35-default.png', '2025-05-15', '16:17:45', 'keluar-2025-05-15-16-17-45-default.png', NULL, NULL, NULL),
(963, 10, '2025-05-16', '08:05:51', 'masuk-2025-05-16-08-05-51-default.png', '2025-05-16', '17:48:43', 'keluar-2025-05-16-17-48-43-default.png', NULL, NULL, NULL),
(964, 10, '2025-05-19', '07:57:02', 'masuk-2025-05-19-07-57-02-default.png', '2025-05-19', '16:32:00', 'keluar-2025-05-19-16-32-00-default.png', NULL, NULL, NULL),
(965, 10, '2025-05-20', '07:18:18', 'masuk-2025-05-20-07-18-18-default.png', '2025-05-20', '16:55:19', 'keluar-2025-05-20-16-55-19-default.png', NULL, NULL, NULL),
(966, 10, '2025-05-21', '07:52:00', 'masuk-2025-05-21-07-52-00-default.png', '2025-05-21', '16:30:54', 'keluar-2025-05-21-16-30-54-default.png', NULL, NULL, NULL),
(967, 10, '2025-05-22', '08:26:28', 'masuk-2025-05-22-08-26-28-default.png', '2025-05-22', '17:07:57', 'keluar-2025-05-22-17-07-57-default.png', NULL, NULL, NULL),
(968, 10, '2025-05-23', '07:45:26', 'masuk-2025-05-23-07-45-26-default.png', '2025-05-23', '17:48:43', 'keluar-2025-05-23-17-48-43-default.png', NULL, NULL, NULL),
(969, 10, '2025-05-26', '07:13:25', 'masuk-2025-05-26-07-13-25-default.png', '2025-05-26', '16:13:00', 'keluar-2025-05-26-16-13-00-default.png', NULL, NULL, NULL),
(970, 10, '2025-05-27', '07:37:37', 'masuk-2025-05-27-07-37-37-default.png', '2025-05-27', '17:42:14', 'keluar-2025-05-27-17-42-14-default.png', NULL, NULL, NULL),
(971, 10, '2025-05-28', '07:19:00', 'masuk-2025-05-28-07-19-00-default.png', '2025-05-28', '17:21:32', 'keluar-2025-05-28-17-21-32-default.png', NULL, NULL, NULL),
(972, 10, '2025-05-29', '07:52:12', 'masuk-2025-05-29-07-52-12-default.png', '2025-05-29', '17:06:32', 'keluar-2025-05-29-17-06-32-default.png', NULL, NULL, NULL),
(973, 10, '2025-05-30', '08:47:57', 'masuk-2025-05-30-08-47-57-default.png', '2025-05-30', '16:55:18', 'keluar-2025-05-30-16-55-18-default.png', NULL, NULL, NULL),
(974, 11, '2025-01-01', '08:02:44', 'masuk-2025-01-01-08-02-44-default.png', '2025-01-01', '17:56:12', 'keluar-2025-01-01-17-56-12-default.png', NULL, NULL, NULL),
(975, 11, '2025-01-02', '08:51:49', 'masuk-2025-01-02-08-51-49-default.png', '2025-01-02', '17:46:08', 'keluar-2025-01-02-17-46-08-default.png', NULL, NULL, NULL),
(976, 11, '2025-01-03', '08:21:54', 'masuk-2025-01-03-08-21-54-default.png', '2025-01-03', '17:26:18', 'keluar-2025-01-03-17-26-18-default.png', NULL, NULL, NULL),
(977, 11, '2025-01-06', '07:03:41', 'masuk-2025-01-06-07-03-41-default.png', '2025-01-06', '16:22:05', 'keluar-2025-01-06-16-22-05-default.png', NULL, NULL, NULL),
(978, 11, '2025-01-07', '08:24:03', 'masuk-2025-01-07-08-24-03-default.png', '2025-01-07', '17:08:12', 'keluar-2025-01-07-17-08-12-default.png', NULL, NULL, NULL),
(979, 11, '2025-01-08', '07:42:00', 'masuk-2025-01-08-07-42-00-default.png', '2025-01-08', '17:29:07', 'keluar-2025-01-08-17-29-07-default.png', NULL, NULL, NULL),
(980, 11, '2025-01-09', '08:20:03', 'masuk-2025-01-09-08-20-03-default.png', '2025-01-09', '16:45:52', 'keluar-2025-01-09-16-45-52-default.png', NULL, NULL, NULL),
(981, 11, '2025-01-10', '07:16:16', 'masuk-2025-01-10-07-16-16-default.png', '2025-01-10', '17:08:54', 'keluar-2025-01-10-17-08-54-default.png', NULL, NULL, NULL),
(982, 11, '2025-01-13', '07:17:50', 'masuk-2025-01-13-07-17-50-default.png', '2025-01-13', '17:51:02', 'keluar-2025-01-13-17-51-02-default.png', NULL, NULL, NULL),
(983, 11, '2025-01-14', '07:01:31', 'masuk-2025-01-14-07-01-31-default.png', '2025-01-14', '17:06:07', 'keluar-2025-01-14-17-06-07-default.png', NULL, NULL, NULL),
(984, 11, '2025-01-15', '07:20:56', 'masuk-2025-01-15-07-20-56-default.png', '2025-01-15', '17:58:19', 'keluar-2025-01-15-17-58-19-default.png', NULL, NULL, NULL),
(985, 11, '2025-01-16', '07:23:16', 'masuk-2025-01-16-07-23-16-default.png', '2025-01-16', '16:11:44', 'keluar-2025-01-16-16-11-44-default.png', NULL, NULL, NULL),
(986, 11, '2025-01-17', '07:28:14', 'masuk-2025-01-17-07-28-14-default.png', '2025-01-17', '16:40:52', 'keluar-2025-01-17-16-40-52-default.png', NULL, NULL, NULL),
(987, 11, '2025-01-20', '07:31:54', 'masuk-2025-01-20-07-31-54-default.png', '2025-01-20', '17:42:52', 'keluar-2025-01-20-17-42-52-default.png', NULL, NULL, NULL),
(988, 11, '2025-01-21', '08:24:03', 'masuk-2025-01-21-08-24-03-default.png', '2025-01-21', '17:47:56', 'keluar-2025-01-21-17-47-56-default.png', NULL, NULL, NULL),
(989, 11, '2025-01-22', '08:13:05', 'masuk-2025-01-22-08-13-05-default.png', '2025-01-22', '17:28:55', 'keluar-2025-01-22-17-28-55-default.png', NULL, NULL, NULL),
(990, 11, '2025-01-23', '08:20:43', 'masuk-2025-01-23-08-20-43-default.png', '2025-01-23', '17:50:52', 'keluar-2025-01-23-17-50-52-default.png', NULL, NULL, NULL),
(991, 11, '2025-01-24', '08:58:30', 'masuk-2025-01-24-08-58-30-default.png', '2025-01-24', '16:16:01', 'keluar-2025-01-24-16-16-01-default.png', NULL, NULL, NULL),
(992, 11, '2025-01-27', '07:34:08', 'masuk-2025-01-27-07-34-08-default.png', '2025-01-27', '17:29:11', 'keluar-2025-01-27-17-29-11-default.png', NULL, NULL, NULL),
(993, 11, '2025-01-28', '07:12:07', 'masuk-2025-01-28-07-12-07-default.png', '2025-01-28', '16:51:10', 'keluar-2025-01-28-16-51-10-default.png', NULL, NULL, NULL),
(994, 11, '2025-01-29', '07:18:30', 'masuk-2025-01-29-07-18-30-default.png', '2025-01-29', '17:16:22', 'keluar-2025-01-29-17-16-22-default.png', NULL, NULL, NULL),
(995, 11, '2025-01-30', '08:01:31', 'masuk-2025-01-30-08-01-31-default.png', '2025-01-30', '17:19:48', 'keluar-2025-01-30-17-19-48-default.png', NULL, NULL, NULL),
(996, 11, '2025-01-31', '08:34:37', 'masuk-2025-01-31-08-34-37-default.png', '2025-01-31', '17:34:57', 'keluar-2025-01-31-17-34-57-default.png', NULL, NULL, NULL),
(997, 11, '2025-02-03', '08:47:01', 'masuk-2025-02-03-08-47-01-default.png', '2025-02-03', '16:38:32', 'keluar-2025-02-03-16-38-32-default.png', NULL, NULL, NULL),
(998, 11, '2025-02-04', '08:19:23', 'masuk-2025-02-04-08-19-23-default.png', '2025-02-04', '17:32:17', 'keluar-2025-02-04-17-32-17-default.png', NULL, NULL, NULL),
(999, 11, '2025-02-05', '07:20:24', 'masuk-2025-02-05-07-20-24-default.png', '2025-02-05', '16:43:28', 'keluar-2025-02-05-16-43-28-default.png', NULL, NULL, NULL),
(1000, 11, '2025-02-06', '08:09:14', 'masuk-2025-02-06-08-09-14-default.png', '2025-02-06', '17:49:08', 'keluar-2025-02-06-17-49-08-default.png', NULL, NULL, NULL),
(1001, 11, '2025-02-07', '08:01:36', 'masuk-2025-02-07-08-01-36-default.png', '2025-02-07', '17:54:44', 'keluar-2025-02-07-17-54-44-default.png', NULL, NULL, NULL),
(1002, 11, '2025-02-10', '07:52:30', 'masuk-2025-02-10-07-52-30-default.png', '2025-02-10', '17:54:47', 'keluar-2025-02-10-17-54-47-default.png', NULL, NULL, NULL),
(1003, 11, '2025-02-11', '08:03:50', 'masuk-2025-02-11-08-03-50-default.png', '2025-02-11', '16:32:29', 'keluar-2025-02-11-16-32-29-default.png', NULL, NULL, NULL),
(1004, 11, '2025-02-12', '07:47:13', 'masuk-2025-02-12-07-47-13-default.png', '2025-02-12', '16:00:23', 'keluar-2025-02-12-16-00-23-default.png', NULL, NULL, NULL),
(1005, 11, '2025-02-13', '08:32:07', 'masuk-2025-02-13-08-32-07-default.png', '2025-02-13', '16:52:34', 'keluar-2025-02-13-16-52-34-default.png', NULL, NULL, NULL),
(1006, 11, '2025-02-14', '07:02:12', 'masuk-2025-02-14-07-02-12-default.png', '2025-02-14', '16:21:52', 'keluar-2025-02-14-16-21-52-default.png', NULL, NULL, NULL),
(1007, 11, '2025-02-17', '07:30:06', 'masuk-2025-02-17-07-30-06-default.png', '2025-02-17', '16:51:01', 'keluar-2025-02-17-16-51-01-default.png', NULL, NULL, NULL),
(1008, 11, '2025-02-18', '08:51:52', 'masuk-2025-02-18-08-51-52-default.png', '2025-02-18', '16:40:53', 'keluar-2025-02-18-16-40-53-default.png', NULL, NULL, NULL),
(1009, 11, '2025-02-19', '07:27:46', 'masuk-2025-02-19-07-27-46-default.png', '2025-02-19', '17:45:48', 'keluar-2025-02-19-17-45-48-default.png', NULL, NULL, NULL),
(1010, 11, '2025-02-20', '08:32:30', 'masuk-2025-02-20-08-32-30-default.png', '2025-02-20', '16:46:55', 'keluar-2025-02-20-16-46-55-default.png', NULL, NULL, NULL),
(1011, 11, '2025-02-21', '08:43:14', 'masuk-2025-02-21-08-43-14-default.png', '2025-02-21', '17:32:46', 'keluar-2025-02-21-17-32-46-default.png', NULL, NULL, NULL),
(1012, 11, '2025-02-24', '08:56:47', 'masuk-2025-02-24-08-56-47-default.png', '2025-02-24', '16:42:57', 'keluar-2025-02-24-16-42-57-default.png', NULL, NULL, NULL),
(1013, 11, '2025-02-25', '08:15:27', 'masuk-2025-02-25-08-15-27-default.png', '2025-02-25', '17:19:15', 'keluar-2025-02-25-17-19-15-default.png', NULL, NULL, NULL),
(1014, 11, '2025-02-26', '07:33:02', 'masuk-2025-02-26-07-33-02-default.png', '2025-02-26', '16:49:40', 'keluar-2025-02-26-16-49-40-default.png', NULL, NULL, NULL),
(1015, 11, '2025-02-27', '07:01:44', 'masuk-2025-02-27-07-01-44-default.png', '2025-02-27', '16:43:01', 'keluar-2025-02-27-16-43-01-default.png', NULL, NULL, NULL),
(1016, 11, '2025-02-28', '08:58:50', 'masuk-2025-02-28-08-58-50-default.png', '2025-02-28', '16:18:30', 'keluar-2025-02-28-16-18-30-default.png', NULL, NULL, NULL),
(1017, 11, '2025-03-03', '08:20:04', 'masuk-2025-03-03-08-20-04-default.png', '2025-03-03', '16:01:21', 'keluar-2025-03-03-16-01-21-default.png', NULL, NULL, NULL),
(1018, 11, '2025-03-04', '07:24:20', 'masuk-2025-03-04-07-24-20-default.png', '2025-03-04', '16:16:05', 'keluar-2025-03-04-16-16-05-default.png', NULL, NULL, NULL),
(1019, 11, '2025-03-05', '07:16:39', 'masuk-2025-03-05-07-16-39-default.png', '2025-03-05', '16:37:42', 'keluar-2025-03-05-16-37-42-default.png', NULL, NULL, NULL),
(1020, 11, '2025-03-06', '07:10:04', 'masuk-2025-03-06-07-10-04-default.png', '2025-03-06', '16:05:55', 'keluar-2025-03-06-16-05-55-default.png', NULL, NULL, NULL),
(1021, 11, '2025-03-07', '07:20:30', 'masuk-2025-03-07-07-20-30-default.png', '2025-03-07', '16:53:16', 'keluar-2025-03-07-16-53-16-default.png', NULL, NULL, NULL),
(1022, 11, '2025-03-10', '07:45:53', 'masuk-2025-03-10-07-45-53-default.png', '2025-03-10', '17:39:14', 'keluar-2025-03-10-17-39-14-default.png', NULL, NULL, NULL),
(1023, 11, '2025-03-11', '07:21:29', 'masuk-2025-03-11-07-21-29-default.png', '2025-03-11', '16:31:11', 'keluar-2025-03-11-16-31-11-default.png', NULL, NULL, NULL),
(1024, 11, '2025-03-12', '07:22:36', 'masuk-2025-03-12-07-22-36-default.png', '2025-03-12', '17:59:44', 'keluar-2025-03-12-17-59-44-default.png', NULL, NULL, NULL),
(1025, 11, '2025-03-13', '07:33:11', 'masuk-2025-03-13-07-33-11-default.png', '2025-03-13', '16:10:45', 'keluar-2025-03-13-16-10-45-default.png', NULL, NULL, NULL),
(1026, 11, '2025-03-14', '07:05:01', 'masuk-2025-03-14-07-05-01-default.png', '2025-03-14', '16:43:40', 'keluar-2025-03-14-16-43-40-default.png', NULL, NULL, NULL),
(1027, 11, '2025-03-17', '08:21:14', 'masuk-2025-03-17-08-21-14-default.png', '2025-03-17', '17:59:27', 'keluar-2025-03-17-17-59-27-default.png', NULL, NULL, NULL),
(1028, 11, '2025-03-18', '07:55:09', 'masuk-2025-03-18-07-55-09-default.png', '2025-03-18', '17:42:25', 'keluar-2025-03-18-17-42-25-default.png', NULL, NULL, NULL),
(1029, 11, '2025-03-19', '08:46:02', 'masuk-2025-03-19-08-46-02-default.png', '2025-03-19', '17:51:03', 'keluar-2025-03-19-17-51-03-default.png', NULL, NULL, NULL),
(1030, 11, '2025-03-20', '07:58:51', 'masuk-2025-03-20-07-58-51-default.png', '2025-03-20', '17:58:28', 'keluar-2025-03-20-17-58-28-default.png', NULL, NULL, NULL),
(1031, 11, '2025-03-21', '07:50:53', 'masuk-2025-03-21-07-50-53-default.png', '2025-03-21', '16:08:45', 'keluar-2025-03-21-16-08-45-default.png', NULL, NULL, NULL),
(1032, 11, '2025-03-24', '08:13:02', 'masuk-2025-03-24-08-13-02-default.png', '2025-03-24', '16:57:22', 'keluar-2025-03-24-16-57-22-default.png', NULL, NULL, NULL),
(1033, 11, '2025-03-25', '07:56:03', 'masuk-2025-03-25-07-56-03-default.png', '2025-03-25', '17:38:36', 'keluar-2025-03-25-17-38-36-default.png', NULL, NULL, NULL),
(1034, 11, '2025-03-26', '08:03:59', 'masuk-2025-03-26-08-03-59-default.png', '2025-03-26', '17:26:24', 'keluar-2025-03-26-17-26-24-default.png', NULL, NULL, NULL),
(1035, 11, '2025-03-27', '08:40:39', 'masuk-2025-03-27-08-40-39-default.png', '2025-03-27', '17:43:35', 'keluar-2025-03-27-17-43-35-default.png', NULL, NULL, NULL),
(1036, 11, '2025-03-28', '07:59:14', 'masuk-2025-03-28-07-59-14-default.png', '2025-03-28', '16:40:58', 'keluar-2025-03-28-16-40-58-default.png', NULL, NULL, NULL),
(1037, 11, '2025-03-31', '08:10:37', 'masuk-2025-03-31-08-10-37-default.png', '2025-03-31', '16:34:59', 'keluar-2025-03-31-16-34-59-default.png', NULL, NULL, NULL),
(1038, 11, '2025-04-01', '08:36:47', 'masuk-2025-04-01-08-36-47-default.png', '2025-04-01', '17:44:53', 'keluar-2025-04-01-17-44-53-default.png', NULL, NULL, NULL),
(1039, 11, '2025-04-02', '08:14:33', 'masuk-2025-04-02-08-14-33-default.png', '2025-04-02', '16:08:33', 'keluar-2025-04-02-16-08-33-default.png', NULL, NULL, NULL),
(1040, 11, '2025-04-03', '08:00:30', 'masuk-2025-04-03-08-00-30-default.png', '2025-04-03', '16:54:15', 'keluar-2025-04-03-16-54-15-default.png', NULL, NULL, NULL),
(1041, 11, '2025-04-04', '08:55:53', 'masuk-2025-04-04-08-55-53-default.png', '2025-04-04', '16:23:58', 'keluar-2025-04-04-16-23-58-default.png', NULL, NULL, NULL),
(1042, 11, '2025-04-07', '08:08:22', 'masuk-2025-04-07-08-08-22-default.png', '2025-04-07', '16:24:33', 'keluar-2025-04-07-16-24-33-default.png', NULL, NULL, NULL),
(1043, 11, '2025-04-08', '08:23:39', 'masuk-2025-04-08-08-23-39-default.png', '2025-04-08', '16:04:12', 'keluar-2025-04-08-16-04-12-default.png', NULL, NULL, NULL),
(1044, 11, '2025-04-09', '08:42:44', 'masuk-2025-04-09-08-42-44-default.png', '2025-04-09', '17:39:57', 'keluar-2025-04-09-17-39-57-default.png', NULL, NULL, NULL);
INSERT INTO `presensi` (`id`, `id_pegawai`, `tanggal_masuk`, `jam_masuk`, `foto_masuk`, `tanggal_keluar`, `jam_keluar`, `foto_keluar`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1045, 11, '2025-04-10', '08:05:40', 'masuk-2025-04-10-08-05-40-default.png', '2025-04-10', '16:55:05', 'keluar-2025-04-10-16-55-05-default.png', NULL, NULL, NULL),
(1046, 11, '2025-04-11', '07:21:08', 'masuk-2025-04-11-07-21-08-default.png', '2025-04-11', '17:33:59', 'keluar-2025-04-11-17-33-59-default.png', NULL, NULL, NULL),
(1047, 11, '2025-04-14', '08:22:17', 'masuk-2025-04-14-08-22-17-default.png', '2025-04-14', '17:45:30', 'keluar-2025-04-14-17-45-30-default.png', NULL, NULL, NULL),
(1048, 11, '2025-04-15', '07:39:42', 'masuk-2025-04-15-07-39-42-default.png', '2025-04-15', '17:52:20', 'keluar-2025-04-15-17-52-20-default.png', NULL, NULL, NULL),
(1049, 11, '2025-04-16', '08:41:43', 'masuk-2025-04-16-08-41-43-default.png', '2025-04-16', '16:34:22', 'keluar-2025-04-16-16-34-22-default.png', NULL, NULL, NULL),
(1050, 11, '2025-04-17', '08:34:44', 'masuk-2025-04-17-08-34-44-default.png', '2025-04-17', '17:50:06', 'keluar-2025-04-17-17-50-06-default.png', NULL, NULL, NULL),
(1051, 11, '2025-04-18', '08:36:45', 'masuk-2025-04-18-08-36-45-default.png', '2025-04-18', '16:53:47', 'keluar-2025-04-18-16-53-47-default.png', NULL, NULL, NULL),
(1052, 11, '2025-04-21', '07:18:39', 'masuk-2025-04-21-07-18-39-default.png', '2025-04-21', '17:23:21', 'keluar-2025-04-21-17-23-21-default.png', NULL, NULL, NULL),
(1053, 11, '2025-04-22', '08:30:05', 'masuk-2025-04-22-08-30-05-default.png', '2025-04-22', '16:03:19', 'keluar-2025-04-22-16-03-19-default.png', NULL, NULL, NULL),
(1054, 11, '2025-04-23', '07:59:27', 'masuk-2025-04-23-07-59-27-default.png', '2025-04-23', '17:33:13', 'keluar-2025-04-23-17-33-13-default.png', NULL, NULL, NULL),
(1055, 11, '2025-04-24', '08:43:06', 'masuk-2025-04-24-08-43-06-default.png', '2025-04-24', '16:08:05', 'keluar-2025-04-24-16-08-05-default.png', NULL, NULL, NULL),
(1056, 11, '2025-04-25', '08:43:48', 'masuk-2025-04-25-08-43-48-default.png', '2025-04-25', '17:47:23', 'keluar-2025-04-25-17-47-23-default.png', NULL, NULL, NULL),
(1057, 11, '2025-04-28', '08:05:48', 'masuk-2025-04-28-08-05-48-default.png', '2025-04-28', '17:39:01', 'keluar-2025-04-28-17-39-01-default.png', NULL, NULL, NULL),
(1058, 11, '2025-04-29', '07:52:18', 'masuk-2025-04-29-07-52-18-default.png', '2025-04-29', '16:09:00', 'keluar-2025-04-29-16-09-00-default.png', NULL, NULL, NULL),
(1059, 11, '2025-04-30', '07:29:41', 'masuk-2025-04-30-07-29-41-default.png', '2025-04-30', '16:54:35', 'keluar-2025-04-30-16-54-35-default.png', NULL, NULL, NULL),
(1060, 11, '2025-05-01', '07:14:28', 'masuk-2025-05-01-07-14-28-default.png', '2025-05-01', '17:49:18', 'keluar-2025-05-01-17-49-18-default.png', NULL, NULL, NULL),
(1061, 11, '2025-05-02', '07:04:06', 'masuk-2025-05-02-07-04-06-default.png', '2025-05-02', '16:45:26', 'keluar-2025-05-02-16-45-26-default.png', NULL, NULL, NULL),
(1062, 11, '2025-05-05', '08:13:52', 'masuk-2025-05-05-08-13-52-default.png', '2025-05-05', '16:57:09', 'keluar-2025-05-05-16-57-09-default.png', NULL, NULL, NULL),
(1063, 11, '2025-05-06', '08:57:37', 'masuk-2025-05-06-08-57-37-default.png', '2025-05-06', '17:52:07', 'keluar-2025-05-06-17-52-07-default.png', NULL, NULL, NULL),
(1064, 11, '2025-05-07', '08:04:28', 'masuk-2025-05-07-08-04-28-default.png', '2025-05-07', '16:48:24', 'keluar-2025-05-07-16-48-24-default.png', NULL, NULL, NULL),
(1065, 11, '2025-05-08', '08:20:52', 'masuk-2025-05-08-08-20-52-default.png', '2025-05-08', '16:54:53', 'keluar-2025-05-08-16-54-53-default.png', NULL, NULL, NULL),
(1066, 11, '2025-05-09', '07:15:06', 'masuk-2025-05-09-07-15-06-default.png', '2025-05-09', '16:40:31', 'keluar-2025-05-09-16-40-31-default.png', NULL, NULL, NULL),
(1067, 11, '2025-05-12', '08:29:26', 'masuk-2025-05-12-08-29-26-default.png', '2025-05-12', '16:40:57', 'keluar-2025-05-12-16-40-57-default.png', NULL, NULL, NULL),
(1068, 11, '2025-05-13', '08:12:57', 'masuk-2025-05-13-08-12-57-default.png', '2025-05-13', '17:32:46', 'keluar-2025-05-13-17-32-46-default.png', NULL, NULL, NULL),
(1069, 11, '2025-05-14', '08:43:30', 'masuk-2025-05-14-08-43-30-default.png', '2025-05-14', '17:05:26', 'keluar-2025-05-14-17-05-26-default.png', NULL, NULL, NULL),
(1070, 11, '2025-05-15', '08:37:17', 'masuk-2025-05-15-08-37-17-default.png', '2025-05-15', '17:03:06', 'keluar-2025-05-15-17-03-06-default.png', NULL, NULL, NULL),
(1071, 11, '2025-05-16', '07:43:25', 'masuk-2025-05-16-07-43-25-default.png', '2025-05-16', '17:31:14', 'keluar-2025-05-16-17-31-14-default.png', NULL, NULL, NULL),
(1072, 11, '2025-05-19', '08:11:20', 'masuk-2025-05-19-08-11-20-default.png', '2025-05-19', '17:36:48', 'keluar-2025-05-19-17-36-48-default.png', NULL, NULL, NULL),
(1073, 11, '2025-05-20', '07:26:27', 'masuk-2025-05-20-07-26-27-default.png', '2025-05-20', '17:20:09', 'keluar-2025-05-20-17-20-09-default.png', NULL, NULL, NULL),
(1074, 11, '2025-05-21', '08:21:28', 'masuk-2025-05-21-08-21-28-default.png', '2025-05-21', '17:26:50', 'keluar-2025-05-21-17-26-50-default.png', NULL, NULL, NULL),
(1075, 11, '2025-05-22', '08:16:23', 'masuk-2025-05-22-08-16-23-default.png', '2025-05-22', '16:39:48', 'keluar-2025-05-22-16-39-48-default.png', NULL, NULL, NULL),
(1076, 11, '2025-05-23', '08:34:54', 'masuk-2025-05-23-08-34-54-default.png', '2025-05-23', '17:37:01', 'keluar-2025-05-23-17-37-01-default.png', NULL, NULL, NULL),
(1077, 11, '2025-05-26', '08:01:17', 'masuk-2025-05-26-08-01-17-default.png', '2025-05-26', '17:01:18', 'keluar-2025-05-26-17-01-18-default.png', NULL, NULL, NULL),
(1078, 11, '2025-05-27', '08:48:44', 'masuk-2025-05-27-08-48-44-default.png', '2025-05-27', '17:57:51', 'keluar-2025-05-27-17-57-51-default.png', NULL, NULL, NULL),
(1079, 11, '2025-05-28', '07:35:43', 'masuk-2025-05-28-07-35-43-default.png', '2025-05-28', '17:44:05', 'keluar-2025-05-28-17-44-05-default.png', NULL, NULL, NULL),
(1080, 11, '2025-05-29', '08:23:21', 'masuk-2025-05-29-08-23-21-default.png', '2025-05-29', '17:44:32', 'keluar-2025-05-29-17-44-32-default.png', NULL, NULL, NULL),
(1081, 11, '2025-05-30', '08:07:40', 'masuk-2025-05-30-08-07-40-default.png', '2025-05-30', '16:59:35', 'keluar-2025-05-30-16-59-35-default.png', NULL, NULL, NULL),
(1082, 9, '2025-06-30', '11:29:40', 'masuk-2025-06-30-11-30-38-pian123.png', '0000-00-00', '00:00:00', '', '2025-06-30 11:30:38', '2025-06-30 11:30:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `id_pegawai` int UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `reset_hash` varchar(255) DEFAULT NULL,
  `reset_at` datetime DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `activate_hash` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_message` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `force_pass_reset` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `id_pegawai`, `email`, `username`, `password_hash`, `reset_hash`, `reset_at`, `reset_expires`, `activate_hash`, `status`, `status_message`, `active`, `force_pass_reset`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'kartika@gmail.com', 'kartika', '$2y$10$.g0bOzk.wZdSJS6/QwQX7.xgvxYxESFH7r/GuDZyFWcPLGq2fqXTe', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2025-06-29 19:10:10', NULL),
(3, 3, 'choland@present.com', 'ade123', '$2y$10$HslMKgwyZ/4gR7qAfJRUS.WFKiZaT58kwReAZQOQHZdtX3tw4wsAG', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2025-06-29 19:12:34', NULL),
(4, 4, 'Elit@gmail.com', 'elitiwan', '$2y$10$OQBCzE7zIp/ZbdMrWGOynuNTFNnvrV0gyb5mm2rmPmYbgRS7T/tMO', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2025-06-29 19:14:41', '2025-06-29 19:14:41', NULL),
(5, 5, 'haris@gmail.com', 'harismulyana', '$2y$10$9vtejUS3ADqEHcMox8.gV.OVryX24D4JeE30paeHrPRqih8mgtWAu', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2025-06-29 19:16:17', '2025-06-29 19:16:17', NULL),
(6, 6, 'keukeu@gmail.com', 'setiapani', '$2y$10$/ETiUuZRlXHJ6oyw1A7PDODq9hrEESvinownyiwIRMh1ufIaR9PUi', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2025-06-29 19:18:19', '2025-06-29 19:18:19', NULL),
(7, 7, 'pirmanpermana@gmai.com', 'pirmanpermanan', '$2y$10$oXfvG7WyU2lfAHj8/lRQgeLr8McM16lNzcN.qx8D.xBVN1jASl3A2', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2025-06-29 19:20:15', '2025-06-29 19:20:15', NULL),
(8, 8, 'retno@gmail.com', 'retno123', '$2y$10$fVsGqN6qlg2KeAWPzrpate18RCLN7GXBFjovr4gj4jZjmaSGhsWkW', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2025-06-29 19:21:45', '2025-06-29 19:21:45', NULL),
(9, 9, 'pian@gmail.com', 'pian123', '$2y$10$YlsrFN7Sbh4Eg9kJsBp/QeMFkTcBsnasc5HxfR.O8MdzxeNguxHra', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2025-06-29 19:23:21', '2025-06-30 11:52:06', NULL),
(10, 10, 'triamutiara@gmail.com', 'triamutiara', '$2y$10$7FVPFeJq3xiLY2YVY/EdFurXZtq4PMRBIAAcrGkRU52nQuL4GqCw.', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2025-06-29 19:24:30', '2025-06-29 19:24:30', NULL),
(11, 11, 'yunus@gmail.com', 'yunussubagja', '$2y$10$OJELZAGBAeLRzgTa7kjjNek0yE.K6tbhzIeQltSg7k1W2liclzKpW', '0f43aa27544e9c940b4cb9470e0628fa', NULL, '2025-06-30 12:22:59', NULL, NULL, NULL, 1, 0, '2025-06-29 19:25:57', '2025-06-30 11:28:59', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_groups`
--
ALTER TABLE `auth_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD KEY `auth_groups_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `group_id_permission_id` (`group_id`,`permission_id`);

--
-- Indexes for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD KEY `auth_groups_users_user_id_foreign` (`user_id`),
  ADD KEY `group_id_user_id` (`group_id`,`user_id`);

--
-- Indexes for table `auth_logins`
--
ALTER TABLE `auth_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_permissions`
--
ALTER TABLE `auth_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_reset_attempts`
--
ALTER TABLE `auth_reset_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auth_tokens_user_id_foreign` (`user_id`),
  ADD KEY `selector` (`selector`);

--
-- Indexes for table `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD KEY `auth_users_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `user_id_permission_id` (`user_id`,`permission_id`);

--
-- Indexes for table `email_tokens`
--
ALTER TABLE `email_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ketidakhadiran`
--
ALTER TABLE `ketidakhadiran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ketidakhadiran_id_pegawai_foreign` (`id_pegawai`);

--
-- Indexes for table `lokasi_presensi`
--
ALTER TABLE `lokasi_presensi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nip` (`nip`),
  ADD KEY `pegawai_id_jabatan_foreign` (`id_jabatan`),
  ADD KEY `pegawai_id_lokasi_presensi_foreign` (`id_lokasi_presensi`);

--
-- Indexes for table `presensi`
--
ALTER TABLE `presensi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `presensi_id_pegawai_foreign` (`id_pegawai`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `users_id_pegawai_foreign` (`id_pegawai`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_groups`
--
ALTER TABLE `auth_groups`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_logins`
--
ALTER TABLE `auth_logins`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `auth_permissions`
--
ALTER TABLE `auth_permissions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_reset_attempts`
--
ALTER TABLE `auth_reset_attempts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_tokens`
--
ALTER TABLE `email_tokens`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ketidakhadiran`
--
ALTER TABLE `ketidakhadiran`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lokasi_presensi`
--
ALTER TABLE `lokasi_presensi`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `presensi`
--
ALTER TABLE `presensi`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1083;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD CONSTRAINT `auth_groups_permissions_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD CONSTRAINT `auth_groups_users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD CONSTRAINT `auth_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD CONSTRAINT `auth_users_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_users_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ketidakhadiran`
--
ALTER TABLE `ketidakhadiran`
  ADD CONSTRAINT `ketidakhadiran_id_pegawai_foreign` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `pegawai_id_jabatan_foreign` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pegawai_id_lokasi_presensi_foreign` FOREIGN KEY (`id_lokasi_presensi`) REFERENCES `lokasi_presensi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `presensi`
--
ALTER TABLE `presensi`
  ADD CONSTRAINT `presensi_id_pegawai_foreign` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_id_pegawai_foreign` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
