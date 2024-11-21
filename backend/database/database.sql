-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2024 at 12:52 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `api`
--

CREATE TABLE `api` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `api_name` varchar(191) NOT NULL,
  `api_key` varchar(191) NOT NULL,
  `api_secret` varchar(191) NOT NULL,
  `api_url` varchar(191) NOT NULL,
  `api_contract_code` varchar(191) DEFAULT NULL,
  `api_payment_charges` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `api`
--

INSERT INTO `api` (`id`, `api_name`, `api_key`, `api_secret`, `api_url`, `api_contract_code`, `api_payment_charges`, `created_at`, `updated_at`) VALUES
(1, 'monnify', 'MK_TEST_URAHPHAT77', '78DLT2XQ6KFM2HYVRSAUPSR9LEHHWMAE', 'https://sandbox.monnify.com', '0426346591', '1.5', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'smartrecharge', '5yu3wd7jord06w4hvu54cadhju0y6f5bgs1', '', 'https://smartrechargeapi.com/api/v2', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `bank_name` varchar(191) NOT NULL,
  `account_name` varchar(191) NOT NULL,
  `account_number` varchar(191) NOT NULL,
  `reference` varchar(191) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `user_id`, `bank_name`, `account_name`, `account_number`, `reference`, `updated_at`, `created_at`) VALUES
(6, 9, 'Wema bank', 'Ele', '5000358118', 'ELECT1686463044', '2023-06-11 04:57:26', '2023-06-11 04:57:26'),
(7, 10, 'Wema bank', 'Rem', '5000390667', 'REMIL1686661296', '2023-06-13 12:01:38', '2023-06-13 12:01:38'),
(8, 23, 'Wema bank', 'Tomiwa', '5000358118', 'ELECT1686463044', '2024-06-05 06:21:18', '2024-06-05 06:21:18'),
(9, 24, 'Wema bank', 'Tomiwa', '5000358118', 'ELECT1686463044', '2024-06-05 06:24:51', '2024-06-05 06:24:51'),
(10, 25, 'Wema bank', 'Tomiwa', '5000358118', 'ELECT1686463044', '2024-06-05 07:03:09', '2024-06-05 07:03:09'),
(11, 26, 'Wema bank', 'Tomiwa', '5000358118', 'ELECT1686463044', '2024-06-05 07:08:21', '2024-06-05 07:08:21'),
(12, 27, 'Wema bank', 'Tomiwa', '5000358118', 'ELECT1686463044', '2024-06-05 07:13:32', '2024-06-05 07:13:32'),
(13, 28, 'Wema bank', 'Tomiwa', '5000358118', 'ELECT1686463044', '2024-06-25 01:32:29', '2024-06-25 01:32:29'),
(14, 29, 'Wema bank', 'Tomiwa', '5000358118', 'ELECT1686463044', '2024-09-24 01:36:19', '2024-09-24 01:36:19'),
(15, 30, 'Wema bank', 'Tomiwa', '5000358118', 'ELECT1686463044', '2024-09-24 02:59:08', '2024-09-24 02:59:08'),
(16, 31, 'Wema bank', 'Tomiwa', '5000358118', 'ELECT1686463044', '2024-09-24 03:41:12', '2024-09-24 03:41:12');

-- --------------------------------------------------------

--
-- Table structure for table `beneficiaries`
--

CREATE TABLE `beneficiaries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `number` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_keyword` mediumtext DEFAULT NULL,
  `meta_description` mediumtext DEFAULT NULL,
  `slug` varchar(191) NOT NULL,
  `api_slug` varchar(50) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `image` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `user_id`, `meta_title`, `meta_keyword`, `meta_description`, `slug`, `api_slug`, `name`, `description`, `image`, `status`, `created_at`, `updated_at`) VALUES
(5, 2, 'Airtime Purchase', 'null', 'null', 'airtime', 'airtime', 'Airtime', 'null', 'uploads/categories/1686016177.svg', 1, '2023-06-05 17:01:15', '2023-06-06 00:49:37'),
(6, 2, 'Data Purchase', 'null', 'null', 'data', 'datashare', 'Data', 'null', 'uploads/categories/1686016240.jpg', 1, '2023-06-06 00:50:40', '2023-06-06 01:43:10'),
(7, 2, 'Bill Payment', '', '', 'bill', 'tv', 'Bill Payment', '', 'uploads/categories/1686049956.jpg', 1, '2023-06-06 10:12:36', '2023-06-06 10:12:36'),
(8, 2, 'Electricity Bill', '', '', 'electricity', 'electric', 'Electricity Bill', '', 'uploads/categories/1686049982.jpg', 1, '2023-06-06 10:13:02', '2023-06-06 10:13:02');

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `created_for_id` varchar(191) NOT NULL DEFAULT 'all',
  `used_by_id` int(11) NOT NULL,
  `code` varchar(191) NOT NULL,
  `percentage` double(11,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `used` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`id`, `created_by_id`, `created_for_id`, `used_by_id`, `code`, `percentage`, `status`, `used`, `created_at`, `updated_at`) VALUES
(1, 2, 'all', 0, 'SUB74062', 100.00, 1, 0, '2024-06-24 19:02:08', '2024-06-25 17:59:43'),
(3, 2, 'all', 0, 'SUB39453', 100.00, 0, 0, '2024-06-24 19:06:10', '2024-06-24 22:49:05'),
(4, 2, 'all', 0, 'SUB93359', 26.50, 0, 0, '2024-06-24 19:10:41', '2024-06-24 22:53:02'),
(5, 2, 'all', 0, 'SUB94698', 26.50, 1, 0, '2024-06-24 19:21:53', '2024-07-07 01:30:54'),
(6, 2, 'all', 0, 'SUB93881', 26.50, 1, 0, '2024-06-24 19:23:44', '2024-06-24 19:23:44'),
(7, 2, 'all', 0, 'SUB26467', 26.50, 1, 0, '2024-06-24 19:25:03', '2024-06-24 19:25:03'),
(8, 2, 'all', 0, 'SUB37450', 26.50, 1, 0, '2024-06-24 19:27:58', '2024-06-24 19:27:58'),
(9, 2, 'all', 0, 'SUB49842', 26.50, 1, 0, '2024-06-24 19:29:10', '2024-06-24 19:29:10'),
(10, 2, '1', 0, 'SUB64937', 26.50, 1, 0, '2024-06-24 19:30:57', '2024-06-24 19:30:57');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ip_whitelists`
--

CREATE TABLE `ip_whitelists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ip` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ip_whitelists`
--

INSERT INTO `ip_whitelists` (`id`, `ip`, `user_id`, `created_at`, `updated_at`, `status`) VALUES
(3, '1.1.1.2', 1, '2024-03-17 21:57:35', '2024-03-17 22:54:07', 0),
(4, '127.0.0.1', 1, '2024-06-05 07:44:14', '2024-06-05 07:44:14', 1),
(6, '192.168.56.1', 1, '2024-06-25 00:08:20', '2024-06-25 00:08:20', 1);

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `level` int(11) NOT NULL,
  `percentage` float NOT NULL DEFAULT 99,
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`id`, `name`, `level`, `percentage`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Basic', 1, 0, 1, '0000-00-00 00:00:00', '2024-02-25 14:38:46'),
(2, 'Agent', 2, 2, 1, '0000-00-00 00:00:00', '2024-06-06 00:36:38');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `successful` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `user_id`, `ip_address`, `successful`, `created_at`, `updated_at`) VALUES
(1, 2, '127.0.0.1', 0, '2024-06-06 06:21:54', '2024-06-06 06:21:54'),
(2, 2, '127.0.0.1', 0, '2024-06-06 06:22:12', '2024-06-06 06:22:12'),
(3, 2, '127.0.0.1', 0, '2024-06-06 06:42:42', '2024-06-06 06:42:42'),
(4, 2, '127.0.0.1', 0, '2024-06-06 06:42:50', '2024-06-06 06:42:50'),
(5, 2, '127.0.0.1', 0, '2024-06-06 06:42:54', '2024-06-06 06:42:54'),
(6, 2, '127.0.0.1', 0, '2024-06-06 06:42:57', '2024-06-06 06:42:57'),
(7, 2, '127.0.0.1', 0, '2024-06-06 06:43:00', '2024-06-06 06:43:00'),
(8, 1, '127.0.0.1', 1, '2024-06-06 06:44:21', '2024-06-06 06:44:21'),
(9, 1, '127.0.0.1', 1, '2024-06-06 11:48:11', '2024-06-06 11:48:11'),
(10, 1, '127.0.0.1', 1, '2024-06-06 11:48:56', '2024-06-06 11:48:56'),
(11, 1, '127.0.0.1', 1, '2024-06-06 11:49:50', '2024-06-06 11:49:50'),
(12, 1, '127.0.0.1', 1, '2024-06-06 11:50:38', '2024-06-06 11:50:38'),
(13, 1, '127.0.0.1', 1, '2024-06-06 11:51:55', '2024-06-06 11:51:55'),
(14, 1, '127.0.0.1', 1, '2024-06-06 11:54:01', '2024-06-06 11:54:01'),
(15, 1, '127.0.0.1', 1, '2024-06-06 11:54:42', '2024-06-06 11:54:42'),
(16, 1, '127.0.0.1', 1, '2024-06-06 11:56:06', '2024-06-06 11:56:06'),
(17, 1, '127.0.0.1', 1, '2024-06-06 11:58:41', '2024-06-06 11:58:41'),
(18, 1, '127.0.0.1', 1, '2024-06-06 11:59:55', '2024-06-06 11:59:55'),
(19, 1, '127.0.0.1', 1, '2024-06-06 12:02:13', '2024-06-06 12:02:13'),
(20, 1, '127.0.0.1', 1, '2024-06-06 12:38:06', '2024-06-06 12:38:06'),
(21, 1, '127.0.0.1', 1, '2024-06-06 12:40:11', '2024-06-06 12:40:11'),
(22, 1, '127.0.0.1', 1, '2024-06-06 12:40:23', '2024-06-06 12:40:23'),
(23, 1, '127.0.0.1', 1, '2024-06-06 12:41:11', '2024-06-06 12:41:11'),
(24, 1, '127.0.0.1', 1, '2024-06-06 12:41:24', '2024-06-06 12:41:24'),
(25, 1, '127.0.0.1', 1, '2024-06-06 12:42:35', '2024-06-06 12:42:35'),
(26, 1, '127.0.0.1', 1, '2024-06-11 22:54:12', '2024-06-11 22:54:12'),
(27, 2, '127.0.0.1', 1, '2024-06-24 12:02:38', '2024-06-24 12:02:38'),
(28, 2, '127.0.0.1', 1, '2024-06-24 23:54:47', '2024-06-24 23:54:47'),
(29, 2, '127.0.0.1', 1, '2024-06-24 23:56:48', '2024-06-24 23:56:48'),
(30, 1, '192.168.56.1', 1, '2024-06-25 00:14:12', '2024-06-25 00:14:12'),
(31, 1, '192.168.56.1', 0, '2024-06-25 01:00:39', '2024-06-25 01:00:39'),
(32, 1, '192.168.56.1', 1, '2024-06-25 01:00:52', '2024-06-25 01:00:52'),
(33, 2, '192.168.56.1', 1, '2024-06-25 01:05:52', '2024-06-25 01:05:52'),
(34, 28, '192.168.56.1', 1, '2024-06-25 06:55:01', '2024-06-25 06:55:01'),
(35, 28, '192.168.56.1', 1, '2024-06-25 08:09:35', '2024-06-25 08:09:35'),
(36, 1, '192.168.56.1', 1, '2024-06-25 08:58:53', '2024-06-25 08:58:53'),
(37, 28, '127.0.0.1', 0, '2024-06-25 09:03:30', '2024-06-25 09:03:30'),
(38, 1, '127.0.0.1', 1, '2024-06-25 09:03:43', '2024-06-25 09:03:43'),
(39, 28, '127.0.0.1', 1, '2024-06-25 09:04:25', '2024-06-25 09:04:25'),
(40, 28, '127.0.0.1', 1, '2024-06-25 09:04:31', '2024-06-25 09:04:31'),
(41, 28, '127.0.0.1', 1, '2024-06-25 09:05:09', '2024-06-25 09:05:09'),
(42, 1, '127.0.0.1', 1, '2024-06-25 09:06:34', '2024-06-25 09:06:34'),
(43, 1, '127.0.0.1', 0, '2024-06-25 09:06:54', '2024-06-25 09:06:54'),
(44, 1, '127.0.0.1', 0, '2024-06-25 09:07:07', '2024-06-25 09:07:07'),
(45, 28, '127.0.0.1', 1, '2024-06-25 09:07:17', '2024-06-25 09:07:17'),
(46, 28, '127.0.0.1', 1, '2024-06-25 10:15:52', '2024-06-25 10:15:52'),
(47, 28, '127.0.0.1', 1, '2024-06-25 10:17:05', '2024-06-25 10:17:05'),
(48, 28, '127.0.0.1', 1, '2024-06-25 10:20:24', '2024-06-25 10:20:24'),
(49, 28, '127.0.0.1', 1, '2024-06-25 10:21:16', '2024-06-25 10:21:16'),
(50, 28, '127.0.0.1', 1, '2024-06-25 10:21:54', '2024-06-25 10:21:54'),
(51, 28, '127.0.0.1', 1, '2024-06-25 10:22:51', '2024-06-25 10:22:51'),
(52, 28, '127.0.0.1', 1, '2024-06-25 10:23:48', '2024-06-25 10:23:48'),
(53, 28, '127.0.0.1', 1, '2024-06-25 10:24:54', '2024-06-25 10:24:54'),
(54, 28, '127.0.0.1', 1, '2024-06-25 10:25:14', '2024-06-25 10:25:14'),
(55, 28, '127.0.0.1', 1, '2024-06-25 10:26:05', '2024-06-25 10:26:05'),
(56, 28, '127.0.0.1', 1, '2024-06-25 10:29:31', '2024-06-25 10:29:31'),
(57, 28, '127.0.0.1', 1, '2024-06-25 10:29:52', '2024-06-25 10:29:52'),
(58, 28, '127.0.0.1', 1, '2024-06-25 10:30:56', '2024-06-25 10:30:56'),
(59, 28, '127.0.0.1', 1, '2024-06-25 10:31:54', '2024-06-25 10:31:54'),
(60, 1, '127.0.0.1', 1, '2024-06-25 10:32:47', '2024-06-25 10:32:47'),
(61, 28, '192.168.56.1', 1, '2024-06-25 11:21:07', '2024-06-25 11:21:07'),
(62, 1, '127.0.0.1', 0, '2024-06-25 12:07:56', '2024-06-25 12:07:56'),
(63, 1, '127.0.0.1', 1, '2024-06-25 12:08:05', '2024-06-25 12:08:05'),
(64, 1, '127.0.0.1', 1, '2024-06-25 12:11:25', '2024-06-25 12:11:25'),
(65, 1, '127.0.0.1', 0, '2024-06-25 12:26:46', '2024-06-25 12:26:46'),
(66, 1, '127.0.0.1', 1, '2024-06-25 12:27:00', '2024-06-25 12:27:00'),
(67, 1, '127.0.0.1', 1, '2024-06-25 12:27:59', '2024-06-25 12:27:59'),
(68, 1, '127.0.0.1', 1, '2024-06-25 12:33:16', '2024-06-25 12:33:16'),
(69, 1, '127.0.0.1', 1, '2024-06-25 12:56:27', '2024-06-25 12:56:27'),
(70, 1, '127.0.0.1', 1, '2024-06-25 12:57:10', '2024-06-25 12:57:10'),
(71, 1, '127.0.0.1', 1, '2024-06-25 13:44:25', '2024-06-25 13:44:25'),
(72, 1, '127.0.0.1', 1, '2024-06-25 13:44:54', '2024-06-25 13:44:54'),
(73, 1, '127.0.0.1', 1, '2024-06-25 13:54:52', '2024-06-25 13:54:52'),
(74, 1, '127.0.0.1', 1, '2024-06-25 14:47:08', '2024-06-25 14:47:08'),
(75, 1, '127.0.0.1', 1, '2024-06-25 14:50:37', '2024-06-25 14:50:37'),
(76, 1, '127.0.0.1', 1, '2024-06-25 14:54:45', '2024-06-25 14:54:45'),
(77, 2, '192.168.56.1', 1, '2024-06-25 16:14:18', '2024-06-25 16:14:18'),
(78, 1, '127.0.0.1', 1, '2024-06-27 09:44:34', '2024-06-27 09:44:34'),
(79, 1, '127.0.0.1', 1, '2024-06-27 09:48:15', '2024-06-27 09:48:15'),
(80, 1, '127.0.0.1', 1, '2024-06-27 11:51:51', '2024-06-27 11:51:51'),
(81, 1, '127.0.0.1', 1, '2024-06-27 18:02:46', '2024-06-27 18:02:46'),
(82, 1, '127.0.0.1', 1, '2024-06-27 18:05:51', '2024-06-27 18:05:51'),
(83, 1, '127.0.0.1', 1, '2024-06-27 18:17:28', '2024-06-27 18:17:28'),
(84, 1, '127.0.0.1', 1, '2024-06-27 19:39:45', '2024-06-27 19:39:45'),
(85, 1, '127.0.0.1', 1, '2024-06-27 19:40:32', '2024-06-27 19:40:32'),
(86, 2, '127.0.0.1', 1, '2024-06-27 19:44:54', '2024-06-27 19:44:54'),
(87, 1, '127.0.0.1', 1, '2024-07-07 00:57:11', '2024-07-07 00:57:11'),
(88, 2, '127.0.0.1', 1, '2024-07-07 01:03:28', '2024-07-07 01:03:28'),
(89, 1, '127.0.0.1', 1, '2024-07-07 01:07:31', '2024-07-07 01:07:31'),
(90, 2, '127.0.0.1', 1, '2024-07-07 01:28:30', '2024-07-07 01:28:30'),
(91, 28, '127.0.0.1', 1, '2024-07-07 01:31:59', '2024-07-07 01:31:59'),
(92, 28, '127.0.0.1', 1, '2024-07-07 02:09:32', '2024-07-07 02:09:32'),
(93, 2, '127.0.0.1', 1, '2024-07-08 02:40:00', '2024-07-08 02:40:00'),
(94, 1, '127.0.0.1', 1, '2024-07-08 02:42:39', '2024-07-08 02:42:39'),
(95, 2, '127.0.0.1', 1, '2024-07-15 09:31:16', '2024-07-15 09:31:16'),
(96, 1, '127.0.0.1', 1, '2024-07-15 09:33:16', '2024-07-15 09:33:16'),
(97, 1, '127.0.0.1', 0, '2024-07-15 22:29:56', '2024-07-15 22:29:56'),
(98, 9, '127.0.0.1', 1, '2024-09-24 00:13:07', '2024-09-24 00:13:07'),
(99, 1, '127.0.0.1', 0, '2024-09-24 00:17:48', '2024-09-24 00:17:48'),
(100, 1, '127.0.0.1', 0, '2024-09-24 00:18:10', '2024-09-24 00:18:10'),
(101, 1, '127.0.0.1', 0, '2024-09-24 00:18:19', '2024-09-24 00:18:19'),
(102, 1, '127.0.0.1', 0, '2024-09-24 00:18:35', '2024-09-24 00:18:35'),
(103, 1, '127.0.0.1', 1, '2024-09-24 03:46:52', '2024-09-24 03:46:52'),
(104, 1, '127.0.0.1', 1, '2024-09-24 03:47:25', '2024-09-24 03:47:25'),
(105, 1, '127.0.0.1', 1, '2024-09-24 03:48:07', '2024-09-24 03:48:07'),
(106, 1, '127.0.0.1', 1, '2024-09-24 04:12:21', '2024-09-24 04:12:21');

-- --------------------------------------------------------

--
-- Table structure for table `merchant_api`
--

CREATE TABLE `merchant_api` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `private_key` longtext NOT NULL,
  `public_key` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `merchant_api`
--

INSERT INTO `merchant_api` (`id`, `user_id`, `private_key`, `public_key`, `created_at`, `updated_at`) VALUES
(1, 1, '-----BEGIN PRIVATE KEY-----\nMIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAKm5ecmlGoVRI+FO\nBiUt5Z8uxHbXVHcgGPV77vP1CdUiCsponuAxMye7/j8myaLBYevJSbkPG1YufV87\nNlbCzS9UNUkgx0zMY/Sc1Cc7OuwjQry1w3UVULGU6S8YWTGboswYVpzmbVoqAZLa\nU0MavaUJaHPlbo1i5fpJscrkKlqRAgMBAAECgYB0cL0vLEhvomU9U6w/oadheFJt\nPfnC6JB3Cpm7YSdnw70ndHNbWCXCYuVhKhk3wfiOLUCY59ZXX/m/df4ns+nUKpAB\nXZxrAuOFsA+rDj2fBJzuQROfUQyYuHVDE2ekFXL53XfyNVLulE3ef5fLEZFo22hz\nmp6G3qFaY5fy97rL4QJBANZGIswP83RJfEl2OjivwGlwm8o4uoacQIsPrP4ImTK5\noV4ADUYthX4Zv4PQjcvGGcCQjZDyGTFaNcloqbWRFJUCQQDKxnxafagr8Kb4hZ2s\nqt27dfz+KTdcBSJJ5HctsSy8XOx1hnJmEI0D1iLnm2pE6L/bASaGq24GwDk3bVxx\noFMNAkBSn7LVSyVOZvO1BBDJQQQJ5HE+Vgee1muQ89d6EWi5hZjyvURhFjaOfHE7\n69Rxig7uEQ91n9UVEbsB0gj2yV3NAkA9uS9vKCLBxU4+BgYZ4iT+hArPnuIwC4wF\nbBru+KiCadK8b4FxGgairVMQpxkxApwr4OzGP3aNbYO9IHfsSn4dAkEAjKX8t6+9\nb9KWSCRzXw1MhBDs2knjnfZcCRqJLnKHmuOv3RaxH0qXGzkkcURijenCCAw8/GrO\ntr3HZbTaYMSQUQ==\n-----END PRIVATE KEY-----', '-----BEGIN PUBLIC KEY-----\r\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCpuXnJpRqFUSPhTgYlLeWfLsR2\r\n11R3IBj1e+7z9QnVIgrKaJ7gMTMnu/4/JsmiwWHryUm5DxtWLn1fOzZWws0vVDVJ\r\nIMdMzGP0nNQnOzrsI0K8tcN1FVCxlOkvGFkxm6LMGFac5m1aKgGS2lNDGr2lCWhz\r\n5W6NYuX6SbHK5CpakQIDAQAB\r\n-----END PUBLIC KEY-----', '2024-06-05 22:17:53', '2024-06-05 22:17:53'),
(2, 1, '-----BEGIN PRIVATE KEY-----\r\nMIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAK1mx3aQcQCZcxvo\r\nPSbr6ZTgx9KGbqX38SyU8TtWio7q9Fs7AEjLx0fGAU8Pk0AwMrSTG0QkuVeatWDJ\r\njKI4KwS9suucsx9NAMSgWCmnUnhBPhibPUJT2VbTfEvVNWVAHvHbYXIsPHySkoQG\r\nQ16jaVta6rxTJdWzgS34biPmqn6jAgMBAAECgYARg07j56SyFc1tZSA//RWjRqyH\r\n07H7KzZ9dTGD97KYypwRVr0pnQMseZAKRx1tHzEP0cewMzFQ6rwk4VZFz/xwHJG4\r\njjwUmnssk5e5EJ1jawZixZw0IxoiruCu+SIaoMsxLHUeWxuGlRZ3a9L1WPhW3pZl\r\n2Lg3hthb/UKuS9XT8QJBANhkOtI5s4A1hwJP8WLFCHS3SNBRCqR1LBBXROSe+Ebw\r\nAp4S2YHQd5CTwOmUZGqPo27BWNspmQonwraAzX2V64sCQQDNJBpXRV5la41+Tka4\r\nQVHstovgd2yVMlwm1qyZNt18xJNHvQZrxUIhtUHOHeUlaIS3tLkr3g9KooYnBV9w\r\n2XxJAkAKGoP0lOUgs18eaIUoy3JdoMExmNcaXq40BR8eXZ3SEhrNLqwhN46dnYiA\r\nX4FgyFwlK7nuYb7Xjou04ca2em2JAkA7dRJZZxa0CJdLG37t2qjXFhW2qoaDO8Rv\r\n0VrXUYqipgsWCNh6lgLT6Eg5aHrI++EzqaLd7w+5jx+Y4brG55JZAkEAy4Ww2JwM\r\nzJ5Q11HxIwfdQ/xsAGMiAM4tb2f/LNS4g1aM1kW2BI9t9/NPBxVLvA2DNYue8ZBt\r\nyTSFXKoUtrdd6A==\r\n-----END PRIVATE KEY-----', '-----BEGIN PUBLIC KEY-----\r\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCtZsd2kHEAmXMb6D0m6+mU4MfS\r\nhm6l9/EslPE7VoqO6vRbOwBIy8dHxgFPD5NAMDK0kxtEJLlXmrVgyYyiOCsEvbLr\r\nnLMfTQDEoFgpp1J4QT4Ymz1CU9lW03xL1TVlQB7x22FyLDx8kpKEBkNeo2lbWuq8\r\nUyXVs4Et+G4j5qp+owIDAQAB\r\n-----END PUBLIC KEY-----', '2024-06-05 22:18:58', '2024-06-05 22:18:58'),
(3, 1, '-----BEGIN PRIVATE KEY-----\r\nMIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBANUQUJNS3Ptc/kmX\r\nlBSRzgERmcR8+0YQ735djvGTW5wzRpVKTaupK2TIo/Sc/NgPKCjB6iV6SpYUvhXJ\r\nou2O2kg6Ce7yID5Uv8Vs8CeI6jyrwJ2640seP1NDs77bi6Vgc++EzWcECzDrqEuk\r\nwfx24wJXccehW+G+K+XdWrXWjarPAgMBAAECgYAbS7fG5/q/iS5apzylVfiaUnLs\r\npUZbt5e3DK1fbY1y+W61eYtxzn5srveyQtpxo591eUJSAtTDXWzsxaRF4uM72a85\r\n1icV2dbu62IUPb3VEgNCpEZdoKrBx2RbXaDOXTryvOguWaefm8XFPs36JEsgzZSS\r\nLbkxOGRofSaR3kNoYQJBAPNvvAEoi7wRdDBPiUe4UuiYr3ai5EPBbnRQcVkqWyOS\r\n7rFiax3k6xxIvPqbTH1cFiTDdZM5Cngn6h0zdxHyd8UCQQDgD0xEe+e+dyq/do1t\r\n5GGI2QA1ldb3gdgPeajrwC1kehFLlZJYXlZLH54i6wTKp5ND9TAzmQ4bxEq8KEA0\r\nxe2DAkEAh9a/l/3iC23J4fNf7U9jpDsfHhpDObPESM9ikJjcBnvFCeKbVzEYKM5F\r\n9amXAxTRnm4bO63Gs8nCD81aEf+06QJBAKR+Vq3IkaCheD7MWJSfIIQJXD/627Em\r\nIGtsE/nQQwMLIvtsud4qlAvfEIfuJrxpPpKbxWF8MoFsILn2ivyzeuUCQQCEgGM4\r\nh2VqR7Fq9R2hsJrzebYhiMMtC1xN31vzgHHjDoU0Mem71H6QyTDnAuTX9ib9Rion\r\n3nhOKhkrCAdbZb7D\r\n-----END PRIVATE KEY-----', '-----BEGIN PUBLIC KEY-----\r\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDVEFCTUtz7XP5Jl5QUkc4BEZnE\r\nfPtGEO9+XY7xk1ucM0aVSk2rqStkyKP0nPzYDygoweolekqWFL4VyaLtjtpIOgnu\r\n8iA+VL/FbPAniOo8q8CduuNLHj9TQ7O+24ulYHPvhM1nBAsw66hLpMH8duMCV3HH\r\noVvhvivl3Vq11o2qzwIDAQAB\r\n-----END PUBLIC KEY-----', '2024-06-05 22:23:03', '2024-06-05 22:23:03'),
(4, 1, '-----BEGIN PRIVATE KEY-----\r\nMIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAKxLj/Tl2+lTXyJ3\r\ntnHimKWfUx9dcdiiQVQMdKjW1ERAaxWsLTmFiZ2GhiHpG0qmuwh+gchfXjiUKTYp\r\nfmFzmqsZ8M1ox6SO2X7ytorDOZ/QY8535yedyYoUkv9qHPB0poBm/9ouEu5d00c0\r\nsp0CoQC/GvNd+s1s9cYdV9ofj6kVAgMBAAECgYAMiZ8bIhLjorZ8ipuTI/sZqkNh\r\nN+qN6hi45gMjOibOJKXmONY9plMCTIS8OPtMbl+T2ajWDOKNWXK6R0C0FLZ/eFwA\r\njTpSAftyl7I1Q3MZ/gt6mPzAQzNQ7wqTnHUL9pY+InDSQg2PGJhhiRDI+4FaFovR\r\nNaepnz8BtnsZFYP97QJBANbGIAIZcPol7qSScPToXzza+jtelC0GS8yTXLSa3qyZ\r\nq/NPe8m/goBaTdW/0UnxMXTpO4rbtRF1OdJqzUpJxhsCQQDNXg3MTbnRfxZj5GKB\r\nzcQjXyOM7W1iSqu3MjiHM1obrCrJT5mN1JFFlg/JAMAA7A9/ILbwwnt0pPH9edKO\r\nrgCPAkEAuWDDSeyZtmA9TnFT7CAR7B36NHpbHU286TQcpYqzPnlZkKZ/a1DQnGbV\r\nnfR1+gOkM4wIp78h15K+ON+UmFV7FwJAKm0KxrEr+SabFong+9XpdjE6Y+vM1Ch+\r\n7vq2COBH9j2MHUiPfWhzln+YxTqdb9NUpDu672QOIxvMTkQzhnxV6wJAHyRKw5M9\r\n1Ir8DDY1LI81nF5KNCQD6j8blKa6HV+CjboI71i2PVWXmnOP1i/Vxye8PK4NC2RR\r\nx92utqDjQpXYQg==\r\n-----END PRIVATE KEY-----', '-----BEGIN PUBLIC KEY-----\r\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCsS4/05dvpU18id7Zx4piln1Mf\r\nXXHYokFUDHSo1tREQGsVrC05hYmdhoYh6RtKprsIfoHIX144lCk2KX5hc5qrGfDN\r\naMekjtl+8raKwzmf0GPOd+cnncmKFJL/ahzwdKaAZv/aLhLuXdNHNLKdAqEAvxrz\r\nXfrNbPXGHVfaH4+pFQIDAQAB\r\n-----END PUBLIC KEY-----', '2024-06-05 22:32:21', '2024-06-05 22:32:21'),
(5, 1, '-----BEGIN PRIVATE KEY-----\r\nMIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAMfipfeuBhguitww\r\nUnxgKwk5KwXshXm+tfH10hCjPbVRiUN2iHEU1moKXRRIobAoGuON6/SfXLIrjjXP\r\nEzp9TwwbCmhpAEapvPGNEnkJqdKYDHItc8eddyr9KqkubXdb3b+XwuRqCG/Pq+tz\r\n0ddN2n8aKzDX2UtSAMzqDQ/DJhv1AgMBAAECgYAQ/1gHsNe51LNgOAe7pd3jAeaD\r\nsXJEQRBty+6aFZeYxJ88imbd3tzA1bLGl8qQFUj8EsR+39JdIFEOiFZlQeSnx2ZC\r\nJnP4UXjIBh7eLxQN2p1obrTDxF9p+o1QUTa3VjjxjVpiQRnbGDlYFLpVZ7+fpQgH\r\naWKT5EL95/CNfZkd3QJBAOZudjyetXjp4y5+bf2zd/ZIyngKOys4Et2DWo5ZghyM\r\nCuCBXr1Y2Rplc0vQEriQTyuspSs7q5V0XtJlLJABBrsCQQDeEIF1066dgP35kg3O\r\nKvQeVH0HccuaBL1bLEBQp0ts92gU1H0btSNQVZF2rQKje4zUXzJysPNBTuoTgCIf\r\n9jUPAkEAjNpgs9VfoDV3hOgLW9TkM0tzV8UJPfXcskKki/byrXh8/ZaWzq8MpjH1\r\nNBZQGzk667twiujCjWzAuWLWxn+aGQJAOl1qOVbGuTzzA8pgeISPnv0j03YURkni\r\nnvj1en1N9LjeEUN8EnE8c9vZnLCCVgeeDx9qOfzKIqskGLX/whjK/wJAb8xIElCu\r\nNwf4QhaAtwLLbtcUmLhqNOfuS3BcIhGKFTwhbMVUkS93QE6fhmxPAHYlhKdb6Axx\r\nHVxB0Uhxa3a1Kw==\r\n-----END PRIVATE KEY-----', '-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDH4qX3rgYYLorcMFJ8YCsJOSsF\n7IV5vrXx9dIQoz21UYlDdohxFNZqCl0USKGwKBrjjev0n1yyK441zxM6fU8MGwpo\naQBGqbzxjRJ5CanSmAxyLXPHnXcq/SqpLm13W92/l8Lkaghvz6vrc9HXTdp/Gisw\n19lLUgDM6g0PwyYb9QIDAQAB\n-----END PUBLIC KEY-----', '2024-06-05 22:33:15', '2024-06-05 22:33:15'),
(6, 1, '-----BEGIN PRIVATE KEY-----\r\nMIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAK9GRUBDJOJMaKcs\r\nJUJGQ1bSxnTQBYkPMC1ATFKi/Ay5rnWwlvY0RLcrdP8LjzUkfqK40Pd1ms+aFC80\r\nzjZr7iP2aotvPQ+II3rY8Wx6KEl0E+7sK0Tqa9i5vmK6GIVGF7Ih58D2T0yFZAHl\r\n/fApXdB18F7cgn97sCvJ2wQSoYs3AgMBAAECgYEAgxGZV6TeQBvDZr+sXRMN6C9W\r\nGKQ2f3fMHwqmCGW49gskWv3i5dnQSOlGZDLQtHzF9gkeuu5HBlfCIErsqeWr/hvB\r\ndlB7pUGVGXhvav1T2MaGLYLRsqel5Cj/SbuWEpB2I33h/9wmtH7RJ7gPd1CuxytP\r\nFOFs1+v0vGRO2OzQoQECQQDWmAoGKsfJThKL2bG5o6LPnaePAY5kD/h1AdxMFiDV\r\nvRdh/wBiqMBRTTWpKlyVsCPV14jGdx3jo4T45yeoFF7JAkEA0RgIINmALNodF/lf\r\nawYU6VX/GvkgHm0y2XzTA52F62tMqqbSI0mFkmtYRDo2uIErccMVhPGXHyEVrV+G\r\nL6mZ/wJBAKtryJYklnO4ahhNTit9DBHNXoxeMeC84TyWv+QHyTL0Wjlt+mDVbMuF\r\nYdhAfrUUf4vTIO9pN/cgKJisDoG1xAECQEb+jeP5dZfFBxPYzBkem4MOe+vAorMy\r\nCI3n4A3eMlZYvFNFCRyKHhw07mdcDLBgy0t5HZliHhmntiCDyp/sSikCQG9pbPFH\r\nLVsVusVuehlMiMBJBqy22p17lYvwUU32cPWGZYxIozUYUeyKAxyrz84AjIaTax1T\r\nbylH4zTqYsPqf4c=\r\n-----END PRIVATE KEY-----', '-----BEGIN PUBLIC KEY-----\r\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCvRkVAQyTiTGinLCVCRkNW0sZ0\r\n0AWJDzAtQExSovwMua51sJb2NES3K3T/C481JH6iuND3dZrPmhQvNM42a+4j9mqL\r\nbz0PiCN62PFseihJdBPu7CtE6mvYub5iuhiFRheyIefA9k9MhWQB5f3wKV3QdfBe\r\n3IJ/e7ArydsEEqGLNwIDAQAB\r\n-----END PUBLIC KEY-----', '2024-06-05 22:34:49', '2024-06-05 22:34:49'),
(7, 1, '-----BEGIN PRIVATE KEY-----\r\nMIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAOOhuKwWqUceiG+U\r\nYqIJSjEsE56jES0z7L/cLpc2BMZnczB/QNdgIE31oMixT141OPY6Euua2l1E1TBI\r\nsmuaDN1ZErxJyJ+bk9qU+O5rv7HAT3YZhE9C6hu/P9u7IoVWgN4Kf5MG6ng0Jar2\r\nnTRQlfxS1pnV4CgZsz84/XKkDHARAgMBAAECgYEAwktwuJqjJIxAQpUyV0J8rFoF\r\n6Rsg9ydiBiWnMvQtwTfdz2Be9Tcce86TzZnit/PPygOp0KadiozNN2hluoiEPvKg\r\n68IioUSjEKDhR1bLRT6HucwyHOoxPEDzJvVY04YEu4rUhbnOM0lt63EVpBTJEneT\r\nvmCQQIqO77Vn0H+PAdECQQD36mkfZN0TxdAQaU4LCe+E/eptyEflJCYOAsakfx0z\r\nzIjXWJEyLV/L4hNtxLk5owzD6LdZmzM5w67SFKeSqW8tAkEA6w37M7uiY5zwhPuE\r\n3THe8e5qFbvZi7zziTdMV33cyyuRlmxzoZV2ksFNUZ8lkXj7e0JDzABXhliCWKRs\r\nC89y9QJBAJw4QQ/ATjMUdlyxDrWUCDNkkWGmT++LTNONWkDzvKIUY7JXI/9baj8e\r\ncaG80f8IyJV2wnqbercOoM3OqB2Z2O0CQQDM7zSr5xTvCp69Itm1TMzXXAmMB2rl\r\npYkjgl4CDg9Z6BOX9dhe8gQecYBrAHltuvBvh9e6XjXxQOvsQvac2XKdAkA/MiXu\r\nB9inv91KZnXj+CqRuQpzLyTOwm4QykWqLt4SeyWKIPoekEQbxjLqSBgka23Au7nB\r\niqsBZDpwG0lqRXjo\r\n-----END PRIVATE KEY-----', '-----BEGIN PUBLIC KEY-----\r\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDjobisFqlHHohvlGKiCUoxLBOe\r\noxEtM+y/3C6XNgTGZ3Mwf0DXYCBN9aDIsU9eNTj2OhLrmtpdRNUwSLJrmgzdWRK8\r\nScifm5PalPjua7+xwE92GYRPQuobvz/buyKFVoDeCn+TBup4NCWq9p00UJX8UtaZ\r\n1eAoGbM/OP1ypAxwEQIDAQAB\r\n-----END PUBLIC KEY-----', '2024-06-05 22:39:51', '2024-06-05 22:39:51'),
(8, 1, '-----BEGIN PRIVATE KEY-----\r\nMIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAMR36r94AtZJ1oDH\r\noYNL5k9hBPKfUTGmt0y+1Egj7VuZ3sGEKOsDys0KFUsVzvl4L1VNVMTbFA3L1y6l\r\nvapRK1QoPi7UKjUmRMNR+Rl5mvBjEPf7/maftBO8VkVKhWHr9NAHOxjQHT7rVrLr\r\njcn1E21+9qGRGrC3XLtkinUiDJpdAgMBAAECgYEAthNsOoW+G1nSsQZRaJyulGIV\r\nc8SyOpGGzlkL4s9o6btv9WfFhAe/qsXtdeiAKDJ5q1Q/ezCNJTwD7/cqDu2qeHQP\r\nS26tIaiC/s22xdOnypzOTRSywzT+EsJmjxTrjOXtqXMgwqDvM+v7cFlxLIMT7f1P\r\n6fyn2J/0H+nwUW6XiwECQQDkwvZ9EIIALv5VvgZf2nWSqlhq9PVyt9lJS8qnMTxO\r\nRibUbo5H1ksqH6oQ5Yw+JfKVv+PmqWB/d+ihOZljRkGzAkEA29yaz3GSarf/c8b/\r\nGDX3bDc9OizzCAXoK9pjdTkHVFTETkVvjKcq8MMwa6U/pwKVi1jVnwmjAEUgmKAv\r\nx4ELrwJAXatjKJSg1phndg5oJ8mZCOQNbkY9VqrnIvcQ1OL5MYfSEHvwcIPTpTzv\r\n8xk7EpuRODYpiGJka+1aaOHf5+F1twJAM229AL1ORIxZwtlPnngxMi0Rs2QETWIk\r\nVu20yhzW7BEQAkcXusz3rG3cC7IR250tIfVbsuHsMQn6f/kodABpnQJAGQ2663m2\r\nm6lkymzMToKOlKTDqu7nPhnzlyqYSPQGiWmf3uNHi+VcT861Q6DK9QUru0xirEfX\r\njDFMQfprbfTv3w==\r\n-----END PRIVATE KEY-----', '-----BEGIN PUBLIC KEY-----\r\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDEd+q/eALWSdaAx6GDS+ZPYQTy\r\nn1ExprdMvtRII+1bmd7BhCjrA8rNChVLFc75eC9VTVTE2xQNy9cupb2qUStUKD4u\r\n1Co1JkTDUfkZeZrwYxD3+/5mn7QTvFZFSoVh6/TQBzsY0B0+61ay643J9RNtfvah\r\nkRqwt1y7ZIp1IgyaXQIDAQAB\r\n-----END PUBLIC KEY-----', '2024-06-05 22:51:24', '2024-06-05 22:51:24'),
(9, 1, '-----BEGIN PRIVATE KEY-----\r\nMIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAOdbcgh3cgpiagln\r\nbvL3I0cIcctvbqymeAsC5r4wdMFNZVyeh81+LTdBI20pgofPNzVF+/PW8ooJ9DAU\r\nn20A0AMoR0yBswj+BkkrYuk6gzR7dbsZEOr+hs4obKjAObSbpg7AdNkapXoHvNBm\r\nrOG12YI45o9to/nOZFudcKw0zVTjAgMBAAECgYBWYw/eV3Nuqza60jNcZ6l1gZK0\r\nCqTBtNsICYpNI9zEvPiHL+63bVDG2/y1axWBTn9n1fzxHKatom/acCjjU7VXcriR\r\nkUMkjLiQ2z8c0nq/IjxQpqKJosdcMg05ModkdreRY0psTOxq/OqpKSYcprYiDmmo\r\nJEw0gkNH8DdIyQKkIQJBAPReglUcQpES84gOFDUanPrS8ib9CZtIc4WknwfIfd8Y\r\nsP1XK0Wx9Eu6vHnj9L55xTMqIfqELX0q/FWPtvmIEPECQQDyXmSzYvuc0g0HFK6s\r\njeP/A9C1Xk9oEPkRotWy3uFe5CxtiJPXmdaLgKDMtR0p5OdKgxVAHGkg0lNe3Cqn\r\nlUMTAkEAncrBAdAjs6W3Fy1wIvIyV0wLDN3rbBeWcL9h6RavIHXDI3M7/97uzk+g\r\nEFz/1lau3WDhW/App18wXNdV4T7ZIQJAf8e0X7832J4FsE3/KYpFQhXI21Y1lzAb\r\noGixMfS/7T9vDPCMwYahzjqqjEKQdZ3xMx+Y/Iv+AQfiXIjHFENlcQJBAIDsoO5D\r\ngHCDJTRQ0k4map9witQUl/dnLPlfamSlX4whJ8vuHbRFZyG463FkzXztc5osESrX\r\nunrwSNuQWPE8Nck=\r\n-----END PRIVATE KEY-----', '-----BEGIN PUBLIC KEY-----\r\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDnW3IId3IKYmoJZ27y9yNHCHHL\r\nb26spngLAua+MHTBTWVcnofNfi03QSNtKYKHzzc1Rfvz1vKKCfQwFJ9tANADKEdM\r\ngbMI/gZJK2LpOoM0e3W7GRDq/obOKGyowDm0m6YOwHTZGqV6B7zQZqzhtdmCOOaP\r\nbaP5zmRbnXCsNM1U4wIDAQAB\r\n-----END PUBLIC KEY-----', '2024-06-27 17:59:33', '2024-06-27 17:59:33'),
(10, 1, '-----BEGIN PRIVATE KEY-----\r\nMIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBALdi4tglOCZbrNwx\r\nGw4J0izhOR/qwh8TTRJrCPrhmfO/tDzih2QL3lq4V0VC4HoaqZsRpOQ/kJpL924U\r\nRI9/U0AdM3XwVfrcrvKMD1fXfKgMVxuboHQmlYHEw7NKFfaygRsHqLpzaoWeGPYI\r\nzysW3afKdYYdlgPsGBRhRDPcsGbxAgMBAAECgYEAqCcfM+xk4R88kKbiVOwCcS6P\r\nT8nV9+Kd0B6fHFRS8yM8JHveg4kyeOMA+rxI0w2xqUPze2shr6mqlqA1AZNRhDG8\r\n74lxN4GWhIVF8MFRRKnw44xSiLskMe7JD7Voo3Svdzg8xtWr1q9D7a/J+iDCemC2\r\n3qAA1K66HQ4Wl6rprAECQQDi1gTrwCbNLhpRAAy/nqDcQeGE9VoszraCtQxm1V6k\r\n2l2OnPrq4gGoHUtwWlmkCPEEGofsZYb12v1LxvYnsumxAkEAzvbIAtTHj/clallH\r\nGbdQDRJEsfkPdpaUCPA2LnQoiUhwlHfKpnLl/R7NuJDbtlD2X1vcTLQF8AUSPl/i\r\nz+dhQQJAR1MiYvqdeMC5V6TbXVlEnV09yy/WteYdr0W8a41F4DIlXtVvdHGyMalc\r\nciyGqTSCjFbHTIa0BBRitvQNrHfuUQJAF9LggzLrJe9VJ0DPpm4rkNWhgrsgxI3g\r\nzIaaNg64+9SS4QRJF4/yWYjKNYy3Pe1j7uYsHcg7Rr3Os89l1HjWAQJAMF44ZGjS\r\ndKtQYYaDXdb2/cN9NwvekCd/PpQGr6pQBSlezH/vbMZhIn87SHpf4M0AuwHBLBAz\r\nCspWJJVK+1GnEQ==\r\n-----END PRIVATE KEY-----', '-----BEGIN PUBLIC KEY-----\r\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC3YuLYJTgmW6zcMRsOCdIs4Tkf\r\n6sIfE00Sawj64Znzv7Q84odkC95auFdFQuB6GqmbEaTkP5CaS/duFESPf1NAHTN1\r\n8FX63K7yjA9X13yoDFcbm6B0JpWBxMOzShX2soEbB6i6c2qFnhj2CM8rFt2nynWG\r\nHZYD7BgUYUQz3LBm8QIDAQAB\r\n-----END PUBLIC KEY-----', '2024-09-24 04:56:41', '2024-09-24 04:56:41');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `title`, `body`, `updated_at`, `created_at`) VALUES
(1, 2, 'HI', 'Hello', '2024-06-27 20:23:26', '2024-06-27 20:23:26');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(35, '2014_10_12_000000_create_users_table', 1),
(37, '2019_08_19_000000_create_failed_jobs_table', 1),
(39, '2022_02_18_142516_create_categories_table', 1),
(40, '2022_02_20_174544_create_products_table', 1),
(44, '2023_06_03_101104_create_services_table', 1),
(45, '2023_06_04_152425_create_levels_table', 2),
(46, '2023_06_05_151410_create_banks_table', 3),
(47, '2023_06_07_075256_create_transactions_table', 4),
(48, '2019_12_14_000001_create_personal_access_tokens_table', 5),
(49, '2014_10_12_100000_create_password_resets_table', 6),
(51, '2023_06_09_141301_create_pin_resets_table', 7),
(52, '2023_06_10_011915_create_activity_logs_table', 8),
(53, '2023_06_11_110845_create_api_table', 9),
(54, '2023_07_11_192332_create_beneficiaries_table', 10),
(55, '2024_02_23_212230_cupdate_users_table', 10),
(56, '2024_02_24_202643_update_users_table', 10),
(57, '2024_02_24_202826_update_password_resets_table', 10),
(58, '2024_03_17_200205_create_ip_whitelists_table', 10),
(59, '2024_03_17_214848_update_ip_whitelists_table', 11),
(60, '2024_06_05_092506_create_merchant_api_table', 12),
(61, '2024_06_05_230927_update_keys_columns_in_merchant_api_table', 13),
(62, '2024_06_05_231241_update_keys_columns_in_merchant_api_table', 14),
(63, '2024_06_06_062808_add_login_attempts_to_users_table', 15),
(67, '2024_06_06_070500_drop_activities_logs_table', 19),
(68, '2024_06_06_070016_drop_activities_log_table', 20),
(69, '2024_06_06_070411_drop_activity_log_table', 20),
(70, '2024_06_06_071103_drop_login_attempts_table', 20),
(71, '2024_06_06_071510_drop_login_attempts_table', 21),
(72, '2024_06_06_071616_create_login_attempts_table', 22),
(73, '2024_06_06_072832_add_login_attempts_and_lockout_to_users_table', 23),
(74, '2024_06_06_084912_add_mfa_column_to_users_table', 24),
(76, '2024_06_06_104508_rename_pin_resets_table_to_otps_table', 25),
(78, '2024_06_24_131132_create_discounts_table', 26);

-- --------------------------------------------------------

--
-- Table structure for table `otps`
--

CREATE TABLE `otps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) NOT NULL,
  `token` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `otps`
--

INSERT INTO `otps` (`id`, `email`, `token`, `created_at`, `updated_at`) VALUES
(1, 'cafeat9ja@gmail.com', 21436, '2023-06-09 13:41:44', '2023-06-09 13:41:44'),
(7, 'cafeat9ja@gmail.com', 65775, '2023-06-09 13:57:11', '2023-06-09 13:57:11'),
(8, 'cafeat9ja@gmail.com', 66265, '2023-06-09 14:12:53', '2023-06-09 14:12:53'),
(9, 'cafeat9ja@gmail.com', 51390, '2024-02-25 09:44:28', '2024-02-25 09:44:28'),
(10, 'cafeat9ja@gmail.com', 70881, '2024-03-16 06:06:55', '2024-03-16 06:06:55'),
(11, 'cafeat9ja@gmail.com', 13561, '2024-03-16 06:07:15', '2024-03-16 06:07:15'),
(12, 'admin10@gmail.com', 63893, '2024-06-05 08:04:33', '2024-06-05 08:04:33'),
(13, 'cafeat9ja@gmail.com', 87703, '2024-06-06 10:54:23', '2024-06-06 10:54:23'),
(14, 'cafeat9ja@gmail.com', 61681, '2024-06-06 10:54:59', '2024-06-06 10:54:59'),
(15, 'cafeat9ja@gmail.com', 88466, '2024-06-06 10:57:15', '2024-06-06 10:57:15'),
(16, 'cafeat9ja@gmail.com', 49404, '2024-06-06 11:00:48', '2024-06-06 11:00:48'),
(17, 'cafeat9ja@gmail.com', 29267, '2024-06-06 11:14:11', '2024-06-06 11:14:11'),
(18, 'cafeat9ja@gmail.com', 62898, '2024-06-06 11:15:53', '2024-06-06 11:15:53'),
(19, 'cafeat9ja@gmail.com', 43288, '2024-06-06 11:17:49', '2024-06-06 11:17:49'),
(20, 'cafeat9ja@gmail.com', 55965, '2024-06-06 11:18:32', '2024-06-06 11:18:32'),
(21, 'cafeat9ja@gmail.com', 72856, '2024-06-06 11:32:20', '2024-06-06 11:32:20'),
(22, 'cafeat9ja@gmail.com', 94954, '2024-06-06 11:36:41', '2024-06-06 11:36:41'),
(23, 'cafeat9ja@gmail.com', 84569, '2024-06-06 11:41:10', '2024-06-06 11:41:10'),
(24, 'cafeat9ja@gmail.com', 43206, '2024-06-06 11:41:24', '2024-06-06 11:41:24'),
(25, 'cafeat9ja@gmail.com', 75186, '2024-06-06 11:48:05', '2024-06-06 11:48:05'),
(26, 'cafeat9ja@gmail.com', 47225, '2024-06-06 11:48:50', '2024-06-06 11:48:50'),
(27, 'cafeat9ja@gmail.com', 19864, '2024-06-06 11:49:44', '2024-06-06 11:49:44'),
(28, 'cafeat9ja@gmail.com', 84446, '2024-06-06 11:50:33', '2024-06-06 11:50:33'),
(29, 'cafeat9ja@gmail.com', 72710, '2024-06-06 11:51:50', '2024-06-06 11:51:50'),
(30, 'cafeat9ja@gmail.com', 18227, '2024-06-06 11:53:56', '2024-06-06 11:53:56'),
(31, 'cafeat9ja@gmail.com', 42206, '2024-06-06 11:54:37', '2024-06-06 11:54:37'),
(32, 'cafeat9ja@gmail.com', 40152, '2024-06-06 11:56:01', '2024-06-06 11:56:01'),
(33, 'cafeat9ja@gmail.com', 82495, '2024-06-06 11:58:36', '2024-06-06 11:58:36'),
(34, 'cafeat9ja@gmail.com', 30327, '2024-06-06 11:59:50', '2024-06-06 11:59:50'),
(35, 'cafeat9ja@gmail.com', 83631, '2024-06-06 12:02:08', '2024-06-06 12:02:08'),
(36, 'cafeat9ja@gmail.com', 54774, '2024-06-06 12:33:53', '2024-06-06 12:33:53'),
(37, 'cafeat9ja@gmail.com', 19298, '2024-06-06 12:34:45', '2024-06-06 12:34:45'),
(38, 'cafeat9ja@gmail.com', 93842, '2024-06-06 12:38:28', '2024-06-06 12:38:28'),
(39, 'user@gmail.com', 51761, '2024-06-25 01:21:15', '2024-06-25 01:21:15'),
(40, 'user@gmail.com', 90623, '2024-06-25 01:28:03', '2024-06-25 01:28:03'),
(41, 'user@gmail.com', 45410, '2024-06-25 01:32:04', '2024-06-25 01:32:04'),
(42, 'cafeat9ja@gmail.com', 79285, '2024-06-25 11:26:10', '2024-06-25 11:26:10'),
(43, 'cafeat9ja@gmail.com', 18886, '2024-06-25 11:32:00', '2024-06-25 11:32:00'),
(44, 'cafeat9ja@gmail.com', 69446, '2024-06-25 11:32:34', '2024-06-25 11:32:34'),
(45, 'cafeat9ja@gmail.com', 65469, '2024-06-25 11:34:07', '2024-06-25 11:34:07'),
(46, 'cafeat9ja@gmail.com', 52330, '2024-06-25 11:34:51', '2024-06-25 11:34:51'),
(47, 'cafeat9ja@gmail.com', 82928, '2024-06-25 11:36:25', '2024-06-25 11:36:25'),
(48, 'cafeat9ja@gmail.com', 25361, '2024-06-25 11:40:17', '2024-06-25 11:40:17'),
(49, 'cafeat9ja@gmail.com', 99668, '2024-06-25 11:43:17', '2024-06-25 11:43:17'),
(50, 'cafeat9ja@gmail.com', 41231, '2024-06-25 11:44:19', '2024-06-25 11:44:19'),
(51, 'cafeat9ja@gmail.com', 39281, '2024-06-25 12:11:52', '2024-06-25 12:11:52'),
(52, 'cafeat9ja@gmail.com', 30042, '2024-06-25 12:20:36', '2024-06-25 12:20:36'),
(53, 'cafeat9ja@gmail.com', 40011, '2024-06-25 12:21:58', '2024-06-25 12:21:58'),
(54, 'cafeat9ja@gmail.com', 72711, '2024-06-25 12:24:02', '2024-06-25 12:24:02'),
(55, 'cafeat9ja@gmail.com', 30678, '2024-06-25 12:24:29', '2024-06-25 12:24:29'),
(56, 'cafeat9ja@gmail.com', 44063, '2024-06-25 12:40:00', '2024-06-25 12:40:00'),
(57, 'cafeat9ja@gmail.com', 61330, '2024-06-25 12:45:59', '2024-06-25 12:45:59'),
(58, 'cafeat9ja@gmail.com', 80143, '2024-06-25 12:47:33', '2024-06-25 12:47:33'),
(59, 'cafeat9ja@gmail.com', 72543, '2024-06-25 12:49:26', '2024-06-25 12:49:26'),
(60, 'cafeat9ja@gmail.com', 79526, '2024-06-25 12:52:24', '2024-06-25 12:52:24'),
(61, 'cafeat9ja@gmail.com', 30896, '2024-06-25 12:55:55', '2024-06-25 12:55:55'),
(62, 'cafeat9ja@gmail.com', 43612, '2024-06-25 12:56:50', '2024-06-25 12:56:50'),
(63, 'cafeat9ja@gmail.com', 80999, '2024-06-25 14:53:00', '2024-06-25 14:53:00'),
(64, 'cafeat9ja@gmail.com', 36971, '2024-06-25 15:00:01', '2024-06-25 15:00:01'),
(65, 'cafeat9ja@gmail.com', 38738, '2024-06-25 15:36:28', '2024-06-25 15:36:28'),
(66, 'cafeat9ja@gmail.com', 65552, '2024-06-25 15:37:42', '2024-06-25 15:37:42'),
(67, 'cafeat9ja@gmail.com', 45488, '2024-06-25 15:40:25', '2024-06-25 15:40:25'),
(68, 'cafeat9ja@gmail.com', 96681, '2024-06-25 15:41:07', '2024-06-25 15:41:07'),
(69, 'cafeat9ja@gmail.com', 86473, '2024-06-25 15:42:17', '2024-06-25 15:42:17'),
(70, 'cafeat9ja@gmail.com', 97914, '2024-06-25 15:48:48', '2024-06-25 15:48:48'),
(71, 'cafeat9ja@gmail.com', 41592, '2024-07-06 00:48:18', '2024-07-06 00:48:18'),
(72, 'cafeat9ja@gmail.com', 41488, '2024-07-06 00:55:15', '2024-07-06 00:55:15'),
(73, 'cafeat9ja@gmail.com', 42984, '2024-07-06 00:56:35', '2024-07-06 00:56:35'),
(74, 'cafeat9ja@gmail.com', 41482, '2024-07-06 01:07:21', '2024-07-06 01:07:21'),
(75, 'cafeat9ja@gmail.com', 95536, '2024-07-06 01:12:47', '2024-07-06 01:12:47'),
(76, 'cafeat9ja@gmail.com', 90271, '2024-07-06 01:14:40', '2024-07-06 01:14:40'),
(77, 'cafeat9ja@gmail.com', 12855, '2024-07-07 00:51:07', '2024-07-07 00:51:07'),
(78, 'cafeat9ja@gmail.com', 52358, '2024-07-15 08:43:30', '2024-07-15 08:43:30'),
(79, 'cafeat9ja@gmail.com', 17100, '2024-07-15 08:44:09', '2024-07-15 08:44:09'),
(80, 'cafeat9ja@gmail.com', 41682, '2024-07-15 08:44:56', '2024-07-15 08:44:56'),
(81, 'cafeat9ja@gmail.com', 45445, '2024-07-15 08:51:51', '2024-07-15 08:51:51'),
(82, 'cafeat9ja@gmail.com', 46151, '2024-07-15 08:53:57', '2024-07-15 08:53:57'),
(83, 'cafeat9ja@gmail.com', 22097, '2024-07-15 08:54:25', '2024-07-15 08:54:25'),
(84, 'cafeat9ja@gmail.com', 35256, '2024-07-15 08:56:22', '2024-07-15 08:56:22'),
(85, 'cafeat9ja@gmail.com', 67778, '2024-07-15 08:58:02', '2024-07-15 08:58:02'),
(86, 'cafeat9ja@gmail.com', 20451, '2024-07-15 20:22:27', '2024-07-15 20:22:27'),
(87, 'cafeat9ja@gmail.com', 48245, '2024-07-15 20:23:36', '2024-07-15 20:23:36'),
(88, 'cafeat9ja@gmail.com', 37563, '2024-07-15 21:08:54', '2024-07-15 21:08:54'),
(89, 'cafeat9ja@gmail.com', 10331, '2024-09-24 00:19:06', '2024-09-24 00:19:06'),
(90, 'cafeat9ja@gmail.com', 11285, '2024-09-24 00:19:37', '2024-09-24 00:19:37'),
(91, 'cafeat9ja@gmail.com', 16943, '2024-09-24 00:23:29', '2024-09-24 00:23:29'),
(92, 'cafeat9ja@gmail.com', 30705, '2024-09-24 00:24:15', '2024-09-24 00:24:15'),
(93, 'cafeat9ja@gmail.com', 52741, '2024-09-24 00:30:24', '2024-09-24 00:30:24'),
(94, 'cafeat9ja@gmail.com', 71554, '2024-09-24 00:31:50', '2024-09-24 00:31:50'),
(95, 'cafeat9ja@gmail.com', 49451, '2024-09-24 00:37:06', '2024-09-24 00:37:06'),
(96, 'cafeat9ja@gmail.com', 45537, '2024-09-24 00:40:52', '2024-09-24 00:40:52'),
(97, 'cafeat9ja@gmail.com', 97786, '2024-09-24 00:44:56', '2024-09-24 00:44:56'),
(98, 'cafeat9ja@gmail.com', 37459, '2024-09-24 00:49:17', '2024-09-24 00:49:17'),
(99, 'cafeat9jadsgshsfhdfhf@gmail.com', 92088, '2024-09-24 01:28:49', '2024-09-24 01:28:49'),
(100, 'cafeat9jadsgshsfhdfhf@gmail.com', 31466, '2024-09-24 01:29:11', '2024-09-24 01:29:11'),
(101, 'cafeasfsfvsdvt9ja@gmail.com', 94970, '2024-09-24 01:29:29', '2024-09-24 01:29:29'),
(102, 'cafeatddd9ja@gmail.com', 64766, '2024-09-24 01:33:40', '2024-09-24 01:33:40'),
(103, 'cafeat9jssa@gmail.com', 12856, '2024-09-24 01:36:01', '2024-09-24 01:36:01'),
(104, 'makinde@gmail.com', 37022, '2024-09-24 01:41:33', '2024-09-24 01:41:33'),
(105, 'makinde@gmail.com', 36670, '2024-09-24 01:42:36', '2024-09-24 01:42:36'),
(106, 'cafeat9ajssa@gmail.com', 21075, '2024-09-24 02:30:18', '2024-09-24 02:30:18'),
(107, 'cafeat9ajssa@gmail.com', 48516, '2024-09-24 02:31:54', '2024-09-24 02:31:54'),
(108, 'cafeat9ajssa@gmail.com', 31798, '2024-09-24 02:32:30', '2024-09-24 02:32:30'),
(109, 'cafeat9ajssa@gmail.com', 34025, '2024-09-24 02:32:41', '2024-09-24 02:32:41'),
(110, 'cafeat9jadd@gmail.com', 98466, '2024-09-24 02:44:34', '2024-09-24 02:44:34'),
(111, 'cassfeat9ja@gmail.com', 99138, '2024-09-24 02:58:47', '2024-09-24 02:58:47'),
(112, 'cafeasft9ja@gmail.com', 63530, '2024-09-24 03:00:50', '2024-09-24 03:00:50'),
(113, 'cafeaxxt9ja@gmail.com', 48753, '2024-09-24 03:02:09', '2024-09-24 03:02:09'),
(114, 'cafeaxxt9ja@gmail.com', 35538, '2024-09-24 03:06:42', '2024-09-24 03:06:42'),
(115, 'cafeaxxt9ja@gmail.com', 59130, '2024-09-24 03:07:30', '2024-09-24 03:07:30'),
(116, 'cafeaxxt9ja@gmail.com', 75942, '2024-09-24 03:08:02', '2024-09-24 03:08:02'),
(117, 'cafeaxxt9ja@gmail.com', 91220, '2024-09-24 03:08:48', '2024-09-24 03:08:48'),
(118, 'cafeaxxt9ja@gmail.com', 74844, '2024-09-24 03:09:48', '2024-09-24 03:09:48'),
(119, 'cafeaxxt9ja@gmail.com', 58638, '2024-09-24 03:10:15', '2024-09-24 03:10:15'),
(120, 'cafeaxxt9ja@gmail.com', 69634, '2024-09-24 03:10:38', '2024-09-24 03:10:38'),
(121, 'cafeat9frtja@gmail.com', 71509, '2024-09-24 03:11:20', '2024-09-24 03:11:20'),
(122, 'cafeat9jafr@gmail.com', 14177, '2024-09-24 03:40:33', '2024-09-24 03:40:33'),
(123, 'cafeat9ja@gmail.com', 54251, '2024-09-24 03:52:30', '2024-09-24 03:52:30'),
(124, 'cafeat9ja@gmail.com', 21466, '2024-09-24 04:07:28', '2024-09-24 04:07:28'),
(125, 'cafeat9ja@gmail.com', 24128, '2024-09-24 04:58:04', '2024-09-24 04:58:04'),
(126, 'cafeat9ja@gmail.com', 23084, '2024-09-24 04:58:42', '2024-09-24 04:58:42'),
(127, 'cafeat9ja@gmail.com', 62511, '2024-09-24 04:59:00', '2024-09-24 04:59:00');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`id`, `email`, `token`, `created_at`, `updated_at`) VALUES
(1, 'cafeat9ja@gmail.com', '95409', '2023-06-08 18:38:23', '2023-06-08 19:38:23'),
(2, 'cafeat9ja@gmail.com', '44048', '2023-06-08 18:40:27', '2023-06-08 19:40:27'),
(3, 'cafeat9ja@gmail.com', '33983', '2023-06-08 18:51:17', '2023-06-08 19:51:17'),
(4, 'cafeat9ja@gmail.com', '55962', '2023-06-08 18:53:06', '2023-06-08 19:53:06'),
(5, 'cafeat9ja@gmail.com', '45615', '2023-06-09 01:02:19', '2023-06-09 02:02:19'),
(6, 'cafeat9ja@gmail.com', '41983', '2023-06-09 01:03:22', '2023-06-09 02:03:22'),
(7, 'cafeat9ja@gmail.com', '20156', '2023-06-09 01:58:46', '2023-06-09 02:58:46'),
(8, 'cafeat9ja@gmail.com', '95126', '2023-06-09 01:58:49', '2023-06-09 02:58:49'),
(9, 'cafeat9ja@gmail.com', '26815', '2023-06-09 01:58:49', '2023-06-09 02:58:49'),
(10, 'cafeat9ja@gmail.com', '49066', '2023-06-09 01:58:50', '2023-06-09 02:58:50'),
(11, 'cafeat9ja@gmail.com', '38005', '2023-06-09 01:58:51', '2023-06-09 02:58:51'),
(12, 'cafeat9ja@gmail.com', '90923', '2023-06-09 01:58:51', '2023-06-09 02:58:51'),
(13, 'cafeat9ja@gmail.com', '25116', '2023-06-09 01:58:51', '2023-06-09 02:58:51'),
(14, 'cafeat9ja@gmail.com', '72072', '2023-06-09 01:58:52', '2023-06-09 02:58:52'),
(15, 'cafeat9ja@gmail.com', '42960', '2023-06-09 01:58:52', '2023-06-09 02:58:52'),
(16, 'cafeat9ja@gmail.com', '47419', '2023-06-09 01:58:53', '2023-06-09 02:58:53'),
(17, 'cafeat9ja@gmail.com', '45256', '2023-06-09 02:01:58', '2023-06-09 03:01:58'),
(18, 'cafeat9ja@gmail.com', '77231', '2023-06-09 02:02:01', '2023-06-09 03:02:01'),
(19, 'cafeat9ja@gmail.com', '84301', '2023-06-09 02:02:01', '2023-06-09 03:02:01'),
(20, 'cafeat9ja@gmail.com', '73233', '2023-06-09 02:02:03', '2023-06-09 03:02:03'),
(21, 'cafeat9ja@gmail.com', '40142', '2023-06-09 02:02:03', '2023-06-09 03:02:03'),
(22, 'cafeat9ja@gmail.com', '63760', '2023-06-09 02:02:04', '2023-06-09 03:02:04'),
(23, 'cafeat9ja@gmail.com', '55538', '2023-06-09 02:02:05', '2023-06-09 03:02:05'),
(24, 'cafeat9ja@gmail.com', '49056', '2023-06-09 02:02:06', '2023-06-09 03:02:06'),
(25, 'cafeat9ja@gmail.com', '99680', '2023-06-09 02:02:06', '2023-06-09 03:02:06'),
(26, 'cafeat9ja@gmail.com', '49798', '2023-06-09 02:02:07', '2023-06-09 03:02:07'),
(27, 'cafeat9ja@gmail.com', '89530', '2023-06-09 02:07:08', '2023-06-09 03:07:08'),
(28, 'cafeat9ja@gmail.com', '57265', '2023-06-09 02:07:11', '2023-06-09 03:07:11'),
(29, 'cafeat9ja@gmail.com', '20333', '2023-06-09 02:07:11', '2023-06-09 03:07:11'),
(30, 'cafeat9ja@gmail.com', '75302', '2023-06-09 02:07:12', '2023-06-09 03:07:12'),
(31, 'cafeat9ja@gmail.com', '24228', '2023-06-09 02:07:12', '2023-06-09 03:07:12'),
(32, 'cafeat9ja@gmail.com', '99734', '2023-06-09 02:07:13', '2023-06-09 03:07:13'),
(33, 'cafeat9ja@gmail.com', '96196', '2023-06-09 02:24:56', '2023-06-09 03:24:56'),
(34, 'cafeat9ja@gmail.com', '44209', '2023-06-09 04:41:55', '2023-06-09 05:41:55'),
(35, 'cafeat9ja@gmail.com', '29209', '2023-06-09 08:38:50', '2023-06-09 09:38:50'),
(36, 'cafeat9ja@gmail.com', '19348', '2023-06-09 08:41:14', '2023-06-09 09:41:14'),
(37, 'cafeat9ja@gmail.com', '54496', '2023-06-09 12:06:10', '2023-06-09 13:06:10'),
(38, 'cafeat9ja@gmail.com', '95818', '2023-06-09 12:08:56', '2023-06-09 13:08:56'),
(39, 'cafeat9ja@gmail.com', '10099', '2023-06-09 12:11:19', '2023-06-09 13:11:19'),
(40, 'cafeat9ja@gmail.com', '49052', '2023-06-09 12:14:49', '2023-06-09 13:14:49'),
(41, 'cafeat9ja@gmail.com', '36419', '2023-06-09 12:17:24', '2023-06-09 13:17:24'),
(42, 'cafeat9ja@gmail.com', '27693', '2023-06-09 12:18:17', '2023-06-09 13:18:17'),
(43, 'cafeat9ja@gmail.com', '95322', '2023-06-09 12:20:51', '2023-06-09 13:20:51'),
(44, 'cafeat9ja@gmail.com', '95253', '2023-06-09 12:25:29', '2023-06-09 13:25:29'),
(45, 'cafeat9ja@gmail.com', '98270', '2023-06-09 12:29:27', '2023-06-09 13:29:27'),
(46, 'cafeat9ja@gmail.com', '96318', '2023-06-09 12:30:11', '2023-06-09 13:30:11'),
(47, 'cafeat9ja@gmail.com', '38822', '2023-06-09 12:32:30', '2023-06-09 13:32:30'),
(48, 'cafeat9ja@gmail.com', '96073', '2023-06-09 12:35:04', '2023-06-09 13:35:04'),
(49, 'cafeat9ja@gmail.com', '81650', '2023-06-09 12:38:07', '2023-06-09 13:38:07'),
(50, 'oluwadaretomiwa@gmail.com', '15008', '2023-06-10 08:07:56', '2023-06-10 09:07:56'),
(51, 'oluwadaretomiwa@gmail.com', '74968', '2023-06-10 08:13:46', '2023-06-10 09:13:46'),
(52, 'oluwadaretomiwa@gmail.com', '56275', '2023-06-10 08:23:38', '2023-06-10 09:23:38'),
(53, 'admin2@gmail.com', '45425', '2023-06-11 03:31:02', '2023-06-11 04:31:02'),
(54, 'admin2@gmail.com', '64520', '2023-06-11 04:05:14', '2023-06-11 05:05:14'),
(55, 'admin2@gmail.com', '61936', '2023-06-11 04:56:53', '2023-06-11 05:56:53'),
(56, 'oluwadaretomiwa@gmail.com', '97390', '2023-06-13 12:00:01', '2023-06-13 13:00:01'),
(57, 'cafeat9ja2@gmail.com', '38108', '2024-02-25 08:50:07', '2024-02-25 08:50:07'),
(58, 'cafeat9ja2@gmail.com', '95196', '2024-02-25 08:50:28', '2024-02-25 08:50:28'),
(59, 'cafeat9ja2@gmail.com', '47324', '2024-02-25 08:51:54', '2024-02-25 08:51:54'),
(60, 'cafeat9ja2@gmail.com', '63699', '2024-02-25 10:46:15', '2024-02-25 10:46:15'),
(61, 'cafeat9ja2@gmail.com', '34775', '2024-02-25 10:46:34', '2024-02-25 10:46:34'),
(62, 'cafeat9ja2@gmail.com', '79405', '2024-02-25 10:47:38', '2024-02-25 10:47:38'),
(63, 'cafeat9ja2@gmail.com', '25243', '2024-02-25 10:50:05', '2024-02-25 10:50:05'),
(64, 'cafeat9ja2@gmail.com', '36282', '2024-02-25 10:55:27', '2024-02-25 10:55:27'),
(65, 'oluwadaretomiwa2@gmail.com', '45941', '2024-02-25 10:56:55', '2024-02-25 10:56:55'),
(66, 'oluwadaretomiwa2@gmail.com', '95993', '2024-02-25 10:58:10', '2024-02-25 10:58:10'),
(67, 'oluwadaretomiwa@gmail.com', '30256', '2024-02-25 10:59:09', '2024-02-25 10:59:09'),
(68, 'oluwadaretomiwa@gmail.com', '16644', '2024-02-25 11:01:19', '2024-02-25 11:01:19'),
(69, 'oluwadaretomiwa@gmail.com', '48632', '2024-02-25 11:15:20', '2024-02-25 11:15:20'),
(70, 'oluwadaretomiwa@gmail.com', '20488', '2024-02-25 11:19:52', '2024-02-25 11:19:52'),
(71, 'oluwadaretomiwa@gmail.com', '13077', '2024-02-25 11:24:58', '2024-02-25 11:24:58'),
(72, 'oluwadaretomiwa@gmail.com', '46608', '2024-02-25 11:29:22', '2024-02-25 11:29:22'),
(73, 'oluwadaretomiwa@gmail.com', '52582', '2024-02-25 11:44:27', '2024-02-25 11:44:27'),
(74, 'oluwadaretomiwa@gmail.com', '73785', '2024-02-25 11:49:32', '2024-02-25 11:49:32'),
(75, 'cafeat9ja2@gmail.com', '88453', '2024-02-25 12:04:48', '2024-02-25 12:04:48'),
(76, 'cafeat9ja2@gmail.com', '87016', '2024-02-25 12:05:17', '2024-02-25 12:05:17'),
(77, 'cafeat9ja2@gmail.com', '63211', '2024-02-25 12:06:27', '2024-02-25 12:06:27'),
(78, 'cafeat9ja2@gmail.com', '56730', '2024-02-25 12:06:37', '2024-02-25 12:06:37'),
(79, 'cafeat9ja2@gmail.com', '35341', '2024-02-25 12:26:40', '2024-02-25 12:26:40'),
(80, 'cafeat9ja2@gmail.com', '29293', '2024-02-25 12:29:57', '2024-02-25 12:29:57'),
(81, 'cafeat9ja2@gmail.com', '87456', '2024-02-25 13:00:53', '2024-02-25 13:00:53'),
(82, 'cafeat9ja2@gmail.com', '16529', '2024-02-25 13:03:16', '2024-02-25 13:03:16'),
(83, 'cafeat9ja2@gmail.com', '12634', '2024-02-25 13:04:18', '2024-02-25 13:04:18'),
(84, 'cafeat9ja2@gmail.com', '95119', '2024-02-25 13:12:59', '2024-02-25 13:12:59'),
(85, 'cafeat9ja2@gmail.com', '16323', '2024-02-25 13:25:14', '2024-02-25 13:25:14'),
(86, 'cafeat9ja3@gmail.com', '94977', '2024-02-25 13:29:03', '2024-02-25 13:29:03'),
(87, 'admin3@gmail.com', '42486', '2024-03-03 10:17:33', '2024-03-03 10:17:33'),
(88, 'admin3@gmail.com', '63747', '2024-03-03 10:22:35', '2024-03-03 10:22:35'),
(89, 'admin3@gmail.com', '71656', '2024-03-03 10:25:10', '2024-03-03 10:25:10'),
(90, 'adminsd@gmail.com', '64192', '2024-03-16 23:04:48', '2024-03-16 23:04:48'),
(91, 'adminsd@gmail.com', '52136', '2024-03-16 23:05:13', '2024-03-16 23:05:13'),
(92, 'adminsd@gmail.com', '30887', '2024-03-16 23:05:28', '2024-03-16 23:05:28'),
(93, 'admin4@gmail.com', '27970', '2024-06-05 05:42:34', '2024-06-05 06:42:34'),
(94, 'admin5@gmail.com', '59068', '2024-06-05 06:09:40', '2024-06-05 07:09:40'),
(95, 'admin6@gmail.com', '41907', '2024-06-05 06:11:05', '2024-06-05 07:11:05'),
(96, 'admin7@gmail.com', '76093', '2024-06-05 06:21:07', '2024-06-05 07:21:07'),
(97, 'admin8@gmail.com', '57321', '2024-06-05 06:24:40', '2024-06-05 07:24:40'),
(98, 'admin9@gmail.com', '61978', '2024-06-05 07:02:41', '2024-06-05 08:02:41'),
(99, 'admin10@gmail.com', '59744', '2024-06-05 07:08:05', '2024-06-05 08:08:05'),
(100, 'admin11@gmail.com', '94823', '2024-06-05 07:13:17', '2024-06-05 08:13:17');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `roles_id` int(11) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `user_id`, `roles_id`, `status`, `created_at`, `updated_at`) VALUES
(462, 2, 67, 1, '2024-03-01 09:11:58', '2024-03-16 07:59:26'),
(463, 2, 68, 1, '2024-03-01 09:11:58', '2024-03-16 07:59:26'),
(464, 2, 69, 1, '2024-03-01 09:11:58', '2024-03-16 07:59:26'),
(465, 2, 70, 1, '2024-03-01 09:11:58', '2024-03-16 07:59:26'),
(466, 2, 71, 1, '2024-03-01 09:11:58', '2024-03-16 07:59:26'),
(467, 2, 72, 1, '2024-03-01 09:11:58', '2024-03-16 07:59:26'),
(468, 2, 73, 1, '2024-03-01 09:11:58', '2024-03-16 07:59:26'),
(469, 2, 74, 1, '2024-03-01 09:11:58', '2024-03-16 07:59:26'),
(470, 2, 75, 1, '2024-03-01 09:11:58', '2024-03-16 07:59:26'),
(471, 2, 76, 1, '2024-03-01 09:11:58', '2024-03-16 07:59:26'),
(472, 2, 77, 1, '2024-03-01 09:11:58', '2024-03-16 07:59:26'),
(473, 2, 78, 1, '2024-03-01 09:11:58', '2024-03-16 07:59:26'),
(474, 2, 79, 1, '2024-03-01 09:11:58', '2024-03-16 07:59:26'),
(475, 2, 80, 1, '2024-03-01 09:11:59', '2024-03-16 07:59:27'),
(476, 2, 85, 1, '2024-03-01 09:11:59', '2024-03-16 07:59:27'),
(477, 2, 86, 1, '2024-03-01 09:11:59', '2024-03-16 07:59:27'),
(478, 2, 87, 1, '2024-03-01 09:11:59', '2024-03-16 07:59:27'),
(479, 2, 88, 1, '2024-03-01 09:11:59', '2024-03-16 07:59:27'),
(480, 2, 93, 1, '2024-03-01 09:11:59', '2024-03-16 07:59:27'),
(481, 2, 94, 1, '2024-03-01 09:11:59', '2024-03-16 07:59:27'),
(482, 2, 95, 1, '2024-03-01 09:11:59', '2024-03-16 07:59:27'),
(483, 2, 96, 1, '2024-03-01 09:11:59', '2024-03-16 07:59:27'),
(484, 2, 97, 1, '2024-03-01 09:11:59', '2024-03-16 07:59:27'),
(535, 9, 101, 1, '2024-03-01 09:19:26', '2024-03-16 11:36:38'),
(536, 9, 102, 1, '2024-03-01 09:19:26', '2024-03-16 11:33:04'),
(537, 9, 103, 1, '2024-03-01 09:19:27', '2024-03-17 20:45:54'),
(538, 9, 104, 1, '2024-03-01 09:19:27', '2024-03-17 20:45:54'),
(539, 2, 98, 1, '2024-03-03 08:18:18', '2024-03-16 07:59:27'),
(540, 2, 99, 1, '2024-03-03 08:18:18', '2024-03-16 07:59:27'),
(541, 2, 100, 1, '2024-03-03 08:18:18', '2024-03-16 07:59:27'),
(542, 2, 101, 1, '2024-03-03 08:18:18', '2024-03-16 07:59:27'),
(543, 2, 102, 1, '2024-03-03 08:18:18', '2024-03-16 07:59:27'),
(544, 2, 103, 1, '2024-03-03 08:18:18', '2024-03-16 07:59:27'),
(545, 2, 104, 1, '2024-03-03 08:18:18', '2024-03-16 07:59:27'),
(546, 2, 53, 1, '2024-03-03 10:26:57', '2024-03-16 07:59:27'),
(547, 18, 53, 0, '2024-03-03 11:07:37', '2024-06-05 05:41:33'),
(548, 18, 55, 0, '2024-03-03 11:07:38', '2024-06-05 05:41:33'),
(549, 18, 56, 0, '2024-03-03 11:07:38', '2024-06-05 05:41:33'),
(550, 18, 57, 0, '2024-03-03 11:07:38', '2024-06-05 05:41:33'),
(551, 18, 58, 0, '2024-03-03 11:07:38', '2024-06-05 05:41:33'),
(552, 18, 59, 0, '2024-03-03 11:07:38', '2024-06-05 05:41:33'),
(553, 18, 60, 0, '2024-03-03 11:07:38', '2024-06-05 05:41:33'),
(554, 18, 61, 0, '2024-03-03 11:07:38', '2024-06-05 05:41:33'),
(555, 18, 62, 0, '2024-03-03 11:07:38', '2024-06-05 05:41:33'),
(556, 18, 63, 0, '2024-03-03 11:07:38', '2024-06-05 05:41:33'),
(557, 18, 64, 0, '2024-03-03 11:07:38', '2024-06-05 05:41:33'),
(558, 18, 65, 0, '2024-03-03 11:07:38', '2024-06-05 05:41:33'),
(559, 18, 66, 0, '2024-03-03 11:07:38', '2024-06-05 05:41:34'),
(560, 18, 67, 0, '2024-03-03 11:07:38', '2024-06-05 05:41:34'),
(561, 18, 68, 0, '2024-03-03 11:07:38', '2024-06-05 05:41:34'),
(562, 18, 69, 0, '2024-03-03 11:07:38', '2024-06-05 05:41:34'),
(563, 18, 70, 0, '2024-03-03 11:07:39', '2024-06-05 05:41:34'),
(564, 18, 71, 0, '2024-03-03 11:07:39', '2024-06-05 05:41:34'),
(565, 18, 72, 0, '2024-03-03 11:07:39', '2024-06-05 05:41:34'),
(566, 18, 73, 0, '2024-03-03 11:07:39', '2024-06-05 05:41:34'),
(567, 18, 74, 0, '2024-03-03 11:07:39', '2024-06-05 05:41:34'),
(568, 18, 75, 0, '2024-03-03 11:07:39', '2024-06-05 05:41:34'),
(569, 18, 76, 0, '2024-03-03 11:07:39', '2024-06-05 05:41:34'),
(570, 18, 77, 0, '2024-03-03 11:07:39', '2024-06-05 05:41:34'),
(571, 18, 78, 0, '2024-03-03 11:07:39', '2024-06-05 05:41:34'),
(572, 18, 79, 0, '2024-03-03 11:07:39', '2024-06-05 05:41:34'),
(573, 18, 80, 0, '2024-03-03 11:07:39', '2024-06-05 05:41:34'),
(574, 18, 85, 0, '2024-03-03 11:07:39', '2024-06-05 05:41:34'),
(575, 18, 86, 0, '2024-03-03 11:07:39', '2024-06-05 05:41:34'),
(576, 18, 87, 0, '2024-03-03 11:07:39', '2024-06-05 05:41:34'),
(577, 18, 88, 0, '2024-03-03 11:07:39', '2024-06-05 05:41:34'),
(578, 18, 93, 0, '2024-03-03 11:07:39', '2024-06-05 05:41:34'),
(579, 18, 94, 0, '2024-03-03 11:07:40', '2024-06-05 05:41:34'),
(580, 18, 95, 0, '2024-03-03 11:07:40', '2024-06-05 05:41:35'),
(581, 18, 96, 0, '2024-03-03 11:07:40', '2024-06-05 05:41:35'),
(582, 18, 97, 0, '2024-03-03 11:07:40', '2024-06-05 05:41:35'),
(583, 18, 98, 0, '2024-03-03 11:07:40', '2024-06-05 05:41:35'),
(584, 18, 99, 0, '2024-03-03 11:07:40', '2024-06-05 05:41:35'),
(585, 18, 100, 0, '2024-03-03 11:07:40', '2024-06-05 05:41:35'),
(586, 18, 101, 0, '2024-03-03 11:07:40', '2024-06-05 05:41:35'),
(587, 18, 102, 0, '2024-03-03 11:07:40', '2024-06-05 05:41:35'),
(588, 18, 103, 0, '2024-03-03 11:07:40', '2024-06-05 05:41:35'),
(589, 18, 104, 0, '2024-03-03 11:07:40', '2024-06-05 05:41:35'),
(590, 9, 53, 1, '2024-03-16 07:57:21', '2024-03-17 20:45:54'),
(591, 18, 105, 0, '2024-03-17 20:43:50', '2024-06-05 05:41:35'),
(592, 18, 106, 0, '2024-03-17 20:43:50', '2024-06-05 05:41:35'),
(593, 18, 107, 0, '2024-03-17 20:43:50', '2024-06-05 05:41:35'),
(594, 18, 108, 0, '2024-03-17 20:43:50', '2024-06-05 05:41:35'),
(595, 1, 53, 1, '2024-03-17 20:50:50', '2024-03-17 20:52:55'),
(596, 1, 55, 1, '2024-03-17 20:50:50', '2024-03-17 20:52:55'),
(597, 1, 56, 1, '2024-03-17 20:50:50', '2024-03-17 20:52:55'),
(598, 1, 57, 1, '2024-03-17 20:50:51', '2024-03-17 20:52:55'),
(599, 1, 58, 1, '2024-03-17 20:50:51', '2024-03-17 20:50:51'),
(600, 1, 59, 1, '2024-03-17 20:50:51', '2024-03-17 20:52:55'),
(601, 1, 60, 1, '2024-03-17 20:50:51', '2024-03-17 20:52:55'),
(602, 1, 61, 1, '2024-03-17 20:50:51', '2024-03-17 20:52:55'),
(603, 1, 62, 1, '2024-03-17 20:50:51', '2024-03-17 20:50:51'),
(604, 1, 63, 1, '2024-03-17 20:50:51', '2024-03-17 20:52:55'),
(605, 1, 64, 1, '2024-03-17 20:50:51', '2024-03-17 20:52:55'),
(606, 1, 65, 1, '2024-03-17 20:50:51', '2024-03-17 20:52:55'),
(607, 1, 66, 1, '2024-03-17 20:50:51', '2024-03-17 20:50:51'),
(608, 1, 67, 1, '2024-03-17 20:50:51', '2024-03-17 20:52:55'),
(609, 1, 68, 1, '2024-03-17 20:50:51', '2024-03-17 20:52:55'),
(610, 1, 69, 1, '2024-03-17 20:50:51', '2024-03-17 20:52:55'),
(611, 1, 70, 1, '2024-03-17 20:50:51', '2024-03-17 20:50:51'),
(612, 1, 71, 1, '2024-03-17 20:50:51', '2024-03-17 20:52:55'),
(613, 1, 72, 1, '2024-03-17 20:50:51', '2024-03-17 20:52:55'),
(614, 1, 73, 1, '2024-03-17 20:50:51', '2024-03-17 20:52:55'),
(615, 1, 74, 1, '2024-03-17 20:50:52', '2024-03-17 20:50:52'),
(616, 1, 75, 1, '2024-03-17 20:50:52', '2024-03-17 20:52:55'),
(617, 1, 76, 1, '2024-03-17 20:50:52', '2024-03-17 20:52:55'),
(618, 1, 77, 1, '2024-03-17 20:50:52', '2024-03-17 20:52:55'),
(619, 1, 78, 1, '2024-03-17 20:50:52', '2024-03-17 20:50:52'),
(620, 1, 79, 1, '2024-03-17 20:50:52', '2024-03-17 20:52:55'),
(621, 1, 80, 1, '2024-03-17 20:50:52', '2024-03-17 20:52:55'),
(622, 1, 85, 1, '2024-03-17 20:50:52', '2024-03-17 20:52:55'),
(623, 1, 86, 1, '2024-03-17 20:50:52', '2024-03-17 20:50:52'),
(624, 1, 87, 1, '2024-03-17 20:50:52', '2024-03-17 20:52:55'),
(625, 1, 88, 1, '2024-03-17 20:50:52', '2024-03-17 20:52:55'),
(626, 1, 93, 1, '2024-03-17 20:50:52', '2024-03-17 20:52:55'),
(627, 1, 94, 1, '2024-03-17 20:50:53', '2024-03-17 20:50:53'),
(628, 1, 95, 1, '2024-03-17 20:50:53', '2024-03-17 20:52:55'),
(629, 1, 96, 1, '2024-03-17 20:50:53', '2024-03-17 20:52:55'),
(630, 1, 97, 1, '2024-03-17 20:50:53', '2024-03-17 20:52:55'),
(631, 1, 98, 1, '2024-03-17 20:50:53', '2024-03-17 20:50:53'),
(632, 1, 99, 1, '2024-03-17 20:50:53', '2024-03-17 20:52:55'),
(633, 1, 100, 1, '2024-03-17 20:50:53', '2024-03-17 20:52:55'),
(634, 1, 101, 1, '2024-03-17 20:50:53', '2024-03-17 20:52:55'),
(635, 1, 102, 1, '2024-03-17 20:50:53', '2024-03-17 20:50:53'),
(636, 1, 103, 1, '2024-03-17 20:50:53', '2024-03-17 20:52:55'),
(637, 1, 104, 1, '2024-03-17 20:50:53', '2024-03-17 20:52:55'),
(638, 1, 105, 1, '2024-03-17 20:50:53', '2024-03-17 20:52:55'),
(639, 1, 106, 1, '2024-03-17 20:50:53', '2024-03-17 20:52:55'),
(640, 1, 107, 1, '2024-03-17 20:50:53', '2024-03-17 20:52:55'),
(641, 1, 108, 1, '2024-03-17 20:50:53', '2024-03-17 20:52:55'),
(642, 2, 55, 1, '2024-03-17 20:52:28', '2024-03-17 20:52:55'),
(643, 2, 56, 1, '2024-03-17 20:52:28', '2024-03-17 20:52:55'),
(644, 2, 57, 1, '2024-03-17 20:52:28', '2024-03-17 20:52:55'),
(645, 2, 58, 1, '2024-03-17 20:52:29', '2024-03-17 20:52:29'),
(646, 2, 59, 1, '2024-03-17 20:52:29', '2024-03-17 20:52:55'),
(647, 2, 60, 1, '2024-03-17 20:52:29', '2024-03-17 20:52:55'),
(648, 2, 61, 1, '2024-03-17 20:52:29', '2024-03-17 20:52:55'),
(649, 2, 62, 1, '2024-03-17 20:52:29', '2024-03-17 20:52:29'),
(650, 2, 63, 1, '2024-03-17 20:52:29', '2024-03-17 20:52:55'),
(651, 2, 64, 1, '2024-03-17 20:52:29', '2024-03-17 20:52:55'),
(652, 2, 65, 1, '2024-03-17 20:52:29', '2024-03-17 20:52:55'),
(653, 2, 66, 1, '2024-03-17 20:52:29', '2024-03-17 20:52:29'),
(654, 2, 105, 1, '2024-03-17 20:52:29', '2024-03-17 20:52:55'),
(655, 2, 106, 1, '2024-03-17 20:52:29', '2024-03-17 20:52:55'),
(656, 2, 107, 1, '2024-03-17 20:52:29', '2024-03-17 20:52:55'),
(657, 2, 108, 1, '2024-03-17 20:52:29', '2024-03-17 20:52:55'),
(658, 9, 55, 0, '2024-06-05 04:58:05', '2024-06-05 04:58:05'),
(659, 9, 56, 0, '2024-06-05 04:58:05', '2024-06-05 04:58:05'),
(660, 9, 57, 0, '2024-06-05 04:58:05', '2024-06-05 04:58:05'),
(661, 9, 58, 1, '2024-06-05 04:58:05', '2024-06-05 04:58:05'),
(662, 9, 59, 0, '2024-06-05 04:58:05', '2024-06-05 04:58:05'),
(663, 9, 60, 0, '2024-06-05 04:58:05', '2024-06-05 04:58:05'),
(664, 9, 61, 0, '2024-06-05 04:58:05', '2024-06-05 04:58:05'),
(665, 9, 62, 1, '2024-06-05 04:58:05', '2024-06-05 04:58:05'),
(666, 9, 63, 0, '2024-06-05 04:58:05', '2024-06-05 04:58:05'),
(667, 9, 64, 0, '2024-06-05 04:58:06', '2024-06-05 04:58:06'),
(668, 9, 65, 0, '2024-06-05 04:58:06', '2024-06-05 04:58:06'),
(669, 9, 66, 1, '2024-06-05 04:58:06', '2024-06-05 04:58:06'),
(670, 9, 67, 0, '2024-06-05 04:58:06', '2024-06-05 04:58:06'),
(671, 9, 68, 0, '2024-06-05 04:58:06', '2024-06-05 04:58:06'),
(672, 9, 69, 0, '2024-06-05 04:58:06', '2024-06-05 04:58:06'),
(673, 9, 70, 1, '2024-06-05 04:58:06', '2024-06-05 04:58:06'),
(674, 9, 71, 0, '2024-06-05 04:58:06', '2024-06-05 04:58:06'),
(675, 9, 72, 0, '2024-06-05 04:58:06', '2024-06-05 04:58:06'),
(676, 9, 73, 0, '2024-06-05 04:58:06', '2024-06-05 04:58:06'),
(677, 9, 74, 1, '2024-06-05 04:58:06', '2024-06-05 04:58:06'),
(678, 9, 75, 0, '2024-06-05 04:58:06', '2024-06-05 04:58:06'),
(679, 9, 76, 0, '2024-06-05 04:58:06', '2024-06-05 04:58:06'),
(680, 9, 77, 0, '2024-06-05 04:58:06', '2024-06-05 04:58:06'),
(681, 9, 78, 1, '2024-06-05 04:58:06', '2024-06-05 04:58:06'),
(682, 9, 79, 0, '2024-06-05 04:58:06', '2024-06-05 04:58:06'),
(683, 9, 80, 0, '2024-06-05 04:58:06', '2024-06-05 04:58:06'),
(684, 9, 85, 0, '2024-06-05 04:58:06', '2024-06-05 04:58:06'),
(685, 9, 86, 1, '2024-06-05 04:58:06', '2024-06-05 04:58:06'),
(686, 9, 87, 0, '2024-06-05 04:58:07', '2024-06-05 04:58:07'),
(687, 9, 88, 0, '2024-06-05 04:58:07', '2024-06-05 04:58:07'),
(688, 9, 93, 0, '2024-06-05 04:58:07', '2024-06-05 04:58:07'),
(689, 9, 94, 1, '2024-06-05 04:58:07', '2024-06-05 04:58:07'),
(690, 9, 95, 0, '2024-06-05 04:58:07', '2024-06-05 04:58:07'),
(691, 9, 96, 0, '2024-06-05 04:58:07', '2024-06-05 04:58:07'),
(692, 9, 97, 0, '2024-06-05 04:58:07', '2024-06-05 04:58:07'),
(693, 9, 98, 1, '2024-06-05 04:58:07', '2024-06-05 04:58:07'),
(694, 9, 99, 0, '2024-06-05 04:58:07', '2024-06-05 04:58:07'),
(695, 9, 100, 0, '2024-06-05 04:58:07', '2024-06-05 04:58:07'),
(696, 9, 105, 0, '2024-06-05 04:58:07', '2024-06-05 04:58:07'),
(697, 9, 106, 0, '2024-06-05 04:58:07', '2024-06-05 04:58:07'),
(698, 9, 107, 0, '2024-06-05 04:58:07', '2024-06-05 04:58:07'),
(699, 9, 108, 0, '2024-06-05 04:58:07', '2024-06-05 04:58:07'),
(700, 24, 53, 0, '2024-06-05 06:59:31', '2024-06-05 06:59:31'),
(701, 24, 55, 0, '2024-06-05 06:59:32', '2024-06-05 06:59:32'),
(702, 24, 56, 0, '2024-06-05 06:59:32', '2024-06-05 06:59:32'),
(703, 24, 57, 0, '2024-06-05 06:59:32', '2024-06-05 06:59:32'),
(704, 24, 58, 1, '2024-06-05 06:59:32', '2024-06-05 06:59:32'),
(705, 24, 59, 0, '2024-06-05 06:59:33', '2024-06-05 06:59:33'),
(706, 24, 60, 0, '2024-06-05 06:59:33', '2024-06-05 06:59:33'),
(707, 24, 61, 0, '2024-06-05 06:59:33', '2024-06-05 06:59:33'),
(708, 24, 62, 1, '2024-06-05 06:59:33', '2024-06-05 06:59:33'),
(709, 24, 63, 0, '2024-06-05 06:59:33', '2024-06-05 06:59:33'),
(710, 24, 64, 0, '2024-06-05 06:59:33', '2024-06-05 06:59:33'),
(711, 24, 65, 0, '2024-06-05 06:59:33', '2024-06-05 06:59:33'),
(712, 24, 66, 1, '2024-06-05 06:59:33', '2024-06-05 06:59:33'),
(713, 24, 67, 0, '2024-06-05 06:59:33', '2024-06-05 06:59:33'),
(714, 24, 68, 0, '2024-06-05 06:59:34', '2024-06-05 06:59:34'),
(715, 24, 69, 0, '2024-06-05 06:59:34', '2024-06-05 06:59:34'),
(716, 24, 70, 1, '2024-06-05 06:59:34', '2024-06-05 06:59:34'),
(717, 24, 71, 0, '2024-06-05 06:59:34', '2024-06-05 06:59:34'),
(718, 24, 72, 0, '2024-06-05 06:59:34', '2024-06-05 06:59:34'),
(719, 24, 73, 0, '2024-06-05 06:59:34', '2024-06-05 06:59:34'),
(720, 24, 74, 1, '2024-06-05 06:59:34', '2024-06-05 06:59:34'),
(721, 24, 75, 0, '2024-06-05 06:59:35', '2024-06-05 06:59:35'),
(722, 24, 76, 0, '2024-06-05 06:59:35', '2024-06-05 06:59:35'),
(723, 24, 77, 0, '2024-06-05 06:59:35', '2024-06-05 06:59:35'),
(724, 24, 78, 1, '2024-06-05 06:59:35', '2024-06-05 06:59:35'),
(725, 24, 79, 0, '2024-06-05 06:59:35', '2024-06-05 06:59:35'),
(726, 24, 80, 0, '2024-06-05 06:59:35', '2024-06-05 06:59:35'),
(727, 24, 85, 0, '2024-06-05 06:59:35', '2024-06-05 06:59:35'),
(728, 24, 86, 1, '2024-06-05 06:59:35', '2024-06-05 06:59:35'),
(729, 24, 87, 0, '2024-06-05 06:59:35', '2024-06-05 06:59:35'),
(730, 24, 88, 0, '2024-06-05 06:59:35', '2024-06-05 06:59:35'),
(731, 24, 93, 0, '2024-06-05 06:59:36', '2024-06-05 06:59:36'),
(732, 24, 94, 1, '2024-06-05 06:59:36', '2024-06-05 06:59:36'),
(733, 24, 95, 0, '2024-06-05 06:59:36', '2024-06-05 06:59:36'),
(734, 24, 96, 0, '2024-06-05 06:59:37', '2024-06-05 06:59:37'),
(735, 24, 97, 0, '2024-06-05 06:59:37', '2024-06-05 06:59:37'),
(736, 24, 98, 1, '2024-06-05 06:59:37', '2024-06-05 06:59:37'),
(737, 24, 99, 0, '2024-06-05 06:59:37', '2024-06-05 06:59:37'),
(738, 24, 100, 0, '2024-06-05 06:59:37', '2024-06-05 06:59:37'),
(739, 24, 101, 0, '2024-06-05 06:59:37', '2024-06-05 06:59:37'),
(740, 24, 102, 1, '2024-06-05 06:59:37', '2024-06-05 06:59:37'),
(741, 24, 103, 0, '2024-06-05 06:59:38', '2024-06-05 06:59:38'),
(742, 24, 104, 0, '2024-06-05 06:59:38', '2024-06-05 06:59:38'),
(743, 24, 105, 0, '2024-06-05 06:59:38', '2024-06-05 06:59:38'),
(744, 24, 106, 0, '2024-06-05 06:59:38', '2024-06-05 06:59:38'),
(745, 24, 107, 0, '2024-06-05 06:59:38', '2024-06-05 06:59:38'),
(746, 24, 108, 0, '2024-06-05 06:59:38', '2024-06-05 06:59:38'),
(747, 2, 109, 1, '2024-06-05 23:13:57', '2024-06-05 23:14:42'),
(748, 24, 109, 0, '2024-06-24 12:03:08', '2024-06-24 12:03:08'),
(749, 2, 110, 1, '2024-06-24 18:19:17', '2024-06-24 18:20:34'),
(750, 2, 111, 1, '2024-06-24 18:19:17', '2024-06-24 18:20:34'),
(751, 2, 112, 1, '2024-06-24 18:19:17', '2024-06-24 18:20:35'),
(752, 2, 113, 1, '2024-06-24 18:19:18', '2024-06-24 18:20:34');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(17, 'AppModelsUser', 8, 'admin2@gmail.com_Token', '5fa0bb6a50e0fa00818c244964072bc77ceb0c456348ce357fecdd34df0f3d45', '[\"*\"]', '0000-00-00 00:00:00', '2023-06-11 04:55:35', '2023-06-11 04:55:35'),
(33, 'AppModelsUser', 2, 'admin@gmail.com_AdminToken', '2e9082cb73dc0e899bee719a98a963bf0daefbfec0637243e86d29d0151e4219', '[\"server:admin\"]', '2023-06-14 11:58:15', '2023-06-14 11:58:04', '2023-06-14 11:58:15'),
(74, 'App\\Models\\User', 18, 'admin3@gmail.com_Token', '85c626e5da56e0eca26513324e83645e85331e64a5bb14d164325ca13866db0c', '[\"*\"]', '2024-03-03 11:41:50', '2024-03-03 10:25:31', '2024-03-03 11:41:50'),
(75, 'App\\Models\\User', 18, 'admin3@gmail.com_AdminToken', '1325e4f69ebd2a700700bd701101a0c209868861e3af84487f11919d0fb0b6da', '[\"server:admin\"]', '2024-03-03 11:50:59', '2024-03-03 11:44:47', '2024-03-03 11:50:59'),
(76, 'App\\Models\\User', 18, 'admin3@gmail.com_AdminToken', '9b5bc9492b3e01c0bd638ec955c1dfcfe910fab6ea9c2f7caefcaa0071b65150', '[\"server:admin\"]', '2024-03-03 14:07:09', '2024-03-03 11:53:47', '2024-03-03 14:07:09'),
(197, 'App\\Models\\User', 25, 'admin9@gmail.com_Token', '1b0117852b6777fbc043c6392660af5a07d0ba09776d73577dbdf8cc479f151f', '[\"*\"]', NULL, '2024-06-05 07:03:10', '2024-06-05 07:03:10'),
(206, 'App\\Models\\User', 26, 'admin10@gmail.com_Token', '00700aed157fbd4b34dbf15fb6fafc7d8a57610b474ed117c8c07c79270ab3fb', '[\"client:user\"]', '2024-06-05 09:23:11', '2024-06-05 07:51:12', '2024-06-05 09:23:11');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `api_product_id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `charges` decimal(10,2) NOT NULL,
  `description` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `api_product_id`, `name`, `discount`, `charges`, `description`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 5, 'mtn_custom', 'MTN Airtime', 3.30, 0.00, 'MTN Airtime', 'uploads/products/1686017821.png', 1, '2023-06-06 01:17:01', '2024-02-25 14:34:46'),
(2, 5, 'airtel_custom', 'Airtel Airtime', 3.80, 0.00, 'Airtel Airtime', 'uploads/products/1686018013.png', 1, '2023-06-06 01:20:13', '2023-06-13 07:45:49'),
(3, 5, 'glo_custom', 'Glo Airtime', 7.80, 0.00, 'GLO Corporate Data', 'uploads/products/1686018059.png', 1, '2023-06-06 01:20:59', '2023-06-13 07:46:05'),
(4, 5, '9mobile_custom', '9mobile Airtime', 6.00, 0.00, '9mobile Airtime', 'uploads/products/1686018091.png', 1, '2023-06-06 01:21:31', '2023-06-13 07:46:19'),
(5, 6, 'mtn-data-sme', 'MTN SME Data', 0.00, 0.00, 'MTN SME Data', 'uploads/products/1686019467.png', 1, '2023-06-06 01:44:27', '2023-06-06 01:44:27'),
(6, 6, 'mtn-data-corporate', 'MTN Corporate Data', 0.00, 0.00, 'MTN Corporate Data', 'uploads/products/1686019527.jpg', 1, '2023-06-06 01:45:27', '2023-06-06 01:45:27'),
(7, 6, 'glo-data-sme', 'GLO SME Data', 0.00, 0.00, 'GLO SME Data', 'uploads/products/1686019577.png', 0, '2023-06-06 01:46:17', '2023-06-14 11:09:41'),
(8, 6, 'glo_corporate_data', 'GLO Corporate Data', 0.00, 0.00, 'GLO Corporate Data', 'uploads/products/1686019630.jpg', 1, '2023-06-06 01:47:10', '2023-06-06 01:47:10'),
(9, 6, 'airtel-data-sme', 'AIRTEL SME Data', 0.00, 0.00, 'AIRTEL SME Data', 'uploads/products/1686019666.png', 1, '2023-06-06 01:47:46', '2023-06-06 01:47:46'),
(10, 6, '9mobile-data', '9mobile SME Data', 0.00, 0.00, '9mobile SME', 'uploads/products/1686019756.png', 1, '2023-06-06 01:49:16', '2023-06-06 01:49:16'),
(11, 7, 'gotv', 'Gotv', 0.00, 0.00, 'Gotv', 'uploads/products/1686050089.png', 1, '2023-06-06 10:14:49', '2023-06-06 10:14:49'),
(12, 7, 'dstv', 'Dstv', 0.00, 0.00, 'Dstv', 'uploads/products/1686050130.png', 1, '2023-06-06 10:15:30', '2023-06-06 10:15:30'),
(13, 7, 'startimes', 'Startimes', 0.00, 0.00, 'Startimes', 'uploads/products/1686050243.png', 1, '2023-06-06 10:17:23', '2023-06-06 10:17:23'),
(14, 8, 'abuja_distribution_company', 'Abuja Distribution Company', 0.00, 100.00, 'Abuja Distribution Company', 'uploads/products/1686051298.jpg', 1, '2023-06-06 10:34:58', '2023-06-14 11:28:29'),
(15, 8, 'kaduna_distribution_company', 'Kaduna Distribution Company', 0.00, 100.00, 'Kaduna Distribution Company', 'uploads/products/1686051345.jpg', 1, '2023-06-06 10:35:45', '2023-06-14 11:28:47'),
(16, 8, 'kano_distribution_company', 'Kano Distribution Company', 0.00, 100.00, 'Kano Distribution Company', 'uploads/products/1686051379.jpg', 1, '2023-06-06 10:36:19', '2023-06-14 11:29:08'),
(17, 8, 'jos_distribution_company', 'Jos Distribution Company', 0.00, 100.00, 'Jos Distribution Company', 'uploads/products/1686051418.jpg', 1, '2023-06-06 10:36:58', '2023-06-14 11:29:27'),
(18, 8, 'ibadan_distribution_company', 'Ibadan Distribution Company', 0.00, 100.00, 'Ibadan Distribution Company', 'uploads/products/1686051446.jpg', 1, '2023-06-06 10:37:26', '2023-06-14 11:29:45'),
(19, 8, 'ikeja_distribution_company', 'Ikeja Distribution Company', 0.00, 100.00, 'Ikeja Distribution Company', 'uploads/products/1686051476.jpg', 1, '2023-06-06 10:37:56', '2023-06-14 11:30:03'),
(20, 8, 'eko_distribution_company', 'Eko Distribution Company', 0.00, 100.00, 'Eko Distribution Company', 'uploads/products/1686051500.jpg', 1, '2023-06-06 10:38:20', '2023-06-14 11:30:22'),
(21, 8, 'enugu_distribution_company', 'Enugu Distribution Company', 0.00, 100.00, 'Enugu Distribution Company', 'uploads/products/1686051529.jpg', 1, '2023-06-06 10:38:49', '2023-06-14 11:30:44'),
(22, 8, 'port_harcourt_distribution_company', 'Port Harcourt Distribution Company', 0.00, 100.00, 'Port Harcourt Distribution Company', 'uploads/products/1686051553.jpg', 1, '2023-06-06 10:39:13', '2023-06-14 11:30:59');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(20) NOT NULL,
  `default_permission` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `default_permission`, `created_at`, `updated_at`) VALUES
(53, 'Read all activities', 'read_activies', 0, '2024-02-29 12:00:00', '2024-03-01 07:19:55'),
(55, 'Read Aceess Control Lists', 'read_acls', 0, '2024-02-29 12:00:00', '2024-03-01 07:17:16'),
(56, 'Update Aceess Control Lists', 'update_acls', 0, '2024-02-29 12:00:00', '2024-02-29 12:00:00'),
(57, 'Create Categories', 'create_categories', 0, '2024-02-29 12:00:00', '2024-02-29 12:00:00'),
(58, 'Read Categories', 'read_categories', 1, '2024-02-29 12:00:00', '2024-03-03 10:04:39'),
(59, 'Update Categories', 'update_categories', 0, '2024-02-29 12:00:00', '2024-02-29 12:00:00'),
(60, 'Delete Categories', 'delete_categories', 0, '2024-02-29 12:00:00', '2024-02-29 12:00:00'),
(61, 'Create Products', 'create_products', 0, '2024-02-29 12:00:00', '2024-02-29 12:00:00'),
(62, 'Read Products', 'read_products', 1, '2024-02-29 12:00:00', '2024-03-03 10:04:49'),
(63, 'Update Products', 'update_products', 0, '2024-02-29 12:00:00', '2024-02-29 12:00:00'),
(64, 'Delete Products', 'delete_products', 0, '2024-02-29 12:00:00', '2024-02-29 12:00:00'),
(65, 'Create Services', 'create_services', 0, '2024-02-29 12:00:00', '2024-02-29 12:00:00'),
(66, 'Read Services', 'read_services', 1, '2024-02-29 12:00:00', '2024-03-03 10:04:57'),
(67, 'Update Services', 'update_services', 0, '2024-02-29 12:00:00', '2024-02-29 12:00:00'),
(68, 'Delete Services', 'delete_services', 0, '2024-02-29 12:00:00', '2024-02-29 12:00:00'),
(69, 'Create Levels', 'create_levels', 0, '2024-02-29 12:00:00', '2024-02-29 12:00:00'),
(70, 'Read Levels', 'read_levels', 1, '2024-02-29 12:00:00', '2024-03-03 10:05:06'),
(71, 'Update Levels', 'update_levels', 0, '2024-02-29 12:00:00', '2024-02-29 12:00:00'),
(72, 'Delete Levels', 'delete_levels', 0, '2024-02-29 12:00:00', '2024-02-29 12:00:00'),
(73, 'Create APIs', 'create_apis', 0, '2024-02-29 12:00:00', '2024-02-29 12:00:00'),
(74, 'Read APIs', 'read_apis', 1, '2024-02-29 12:00:00', '2024-03-03 10:05:20'),
(75, 'Update APIs', 'update_apis', 0, '2024-02-29 12:00:00', '2024-02-29 12:00:00'),
(76, 'Delete APIs', 'delete_apis', 0, '2024-02-29 12:00:00', '2024-02-29 12:00:00'),
(77, 'Create Users', 'create_users', 0, '2024-02-29 12:00:00', '2024-02-29 12:00:00'),
(78, 'Read Users', 'read_users', 1, '2024-02-29 12:00:00', '2024-03-03 10:05:31'),
(79, 'Update Users', 'update_users', 0, '2024-02-29 12:00:00', '2024-02-29 12:00:00'),
(80, 'Delete Users', 'delete_users', 0, '2024-02-29 12:00:00', '2024-02-29 12:00:00'),
(85, 'Create Messages', 'create_messages', 0, '2024-02-29 12:00:00', '2024-02-29 12:00:00'),
(86, 'Read Messages', 'read_messages', 1, '2024-02-29 12:00:00', '2024-03-03 10:05:45'),
(87, 'Update Messages', 'update_messages', 0, '2024-02-29 12:00:00', '2024-02-29 12:00:00'),
(88, 'Delete Messages', 'delete_messages', 0, '2024-02-29 12:00:00', '2024-02-29 12:00:00'),
(93, 'Create Activities', 'create_activities', 0, '2024-02-29 12:00:00', '2024-02-29 12:00:00'),
(94, 'Read Activities', 'read_activities', 1, '2024-02-29 12:00:00', '2024-03-03 10:15:38'),
(95, 'Update Activities', 'update_activities', 0, '2024-02-29 12:00:00', '2024-02-29 12:00:00'),
(96, 'Delete Activities', 'delete_activities', 0, '2024-02-29 12:00:00', '2024-02-29 12:00:00'),
(97, 'Create DB Backups', 'create_db_backups', 0, '2024-02-29 12:00:00', '2024-02-29 12:00:00'),
(98, 'Read DB Backups', 'read_db_backups', 1, '2024-02-29 12:00:00', '2024-03-03 10:15:29'),
(99, 'Update DB Backups', 'update_db_backups', 0, '2024-02-29 12:00:00', '2024-02-29 12:00:00'),
(100, 'Delete DB Backups', 'delete_db_backups', 0, '2024-02-29 12:00:00', '2024-02-29 12:00:00'),
(101, 'Create Transactions', 'create_transactions', 0, '2024-03-01 09:04:34', '2024-03-01 09:04:34'),
(102, 'Read Transactions', 'read_transactions', 1, '2024-03-01 09:04:34', '2024-03-03 10:15:22'),
(103, 'Update Transactions', 'update_transactions', 0, '2024-03-01 09:04:34', '2024-03-01 09:04:34'),
(104, 'Delete Transactions', 'delete_transactions', 0, '2024-03-01 09:04:34', '2024-03-01 09:04:34'),
(105, 'Create IPs', 'create_ips', 0, '2024-03-17 20:22:32', '2024-03-17 20:22:32'),
(106, 'Read IPs', 'read_ips', 0, '2024-03-17 20:22:32', '2024-03-17 20:22:32'),
(107, 'Update IPs', 'update_ips', 0, '2024-03-17 20:22:32', '2024-03-17 20:22:32'),
(108, 'Delete IPs', 'delete_ips', 0, '2024-03-17 20:22:32', '2024-03-17 20:22:32'),
(109, 'Read Merchants', 'read_merchants', 0, '2024-06-06 00:13:01', '2024-06-06 00:13:01'),
(110, 'Create discount', 'create_discount', 0, '2024-03-17 20:22:32', '2024-03-17 20:22:32'),
(111, 'Read discounts', 'read_discounts', 0, '2024-03-17 20:22:32', '2024-03-17 20:22:32'),
(112, 'Update discount', 'update_discount', 0, '2024-03-17 20:22:32', '2024-03-17 20:22:32'),
(113, 'Delete discount', 'delete_discount', 0, '2024-03-17 20:22:32', '2024-03-17 20:22:32');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `api_service_id` varchar(191) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `product_id`, `name`, `description`, `price`, `api_service_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 5, 'DATA SHARE 1GB', NULL, 220.00, 'data_share_1gb', 1, '2023-06-06 09:25:53', '2024-02-25 14:36:06'),
(2, 5, 'DATA SHARE 2GB', '', 450.00, 'data_share_2gb', 1, '2023-06-06 09:26:30', '2023-06-13 03:15:07'),
(3, 5, 'DATA SHARE 5GB', '', 1125.00, 'data_share_5gb', 1, '2023-06-06 09:28:48', '2023-06-13 03:15:40'),
(4, 5, 'DATA SHARE 3GB', '', 675.00, 'data_share_3gb', 1, '2023-06-06 09:30:46', '2023-06-13 03:16:06'),
(5, 5, 'DATA SHARE 500MB', '', 110.00, 'data_share_500mb', 1, '2023-06-06 09:31:15', '2023-06-12 15:26:57'),
(6, 5, 'DATA SHARE 10GB', '', 2250.00, 'data_share_10gb', 1, '2023-06-06 09:31:54', '2023-06-13 03:16:35'),
(7, 9, 'Data Share Airtel 100MB 7Days', '', 25.00, 'data_share_airtel_100mb_7days', 1, '2023-06-06 09:41:46', '2023-06-13 03:22:07'),
(8, 9, 'Data Share Airtel 500MB 30Days', '', 110.00, 'data_share_airtel_500mb_30days', 1, '2023-06-06 09:42:12', '2023-06-13 03:23:38'),
(9, 9, 'Data Share Airtel 1GB 30Days', '', 220.00, 'data_share_airtel_1gb_30days', 1, '2023-06-06 09:42:41', '2023-06-13 03:24:04'),
(10, 9, 'Data Share Airtel 2GB 30Days', '', 450.00, 'data_share_airtel_2gb_30days', 1, '2023-06-06 09:43:10', '2023-06-13 03:26:00'),
(11, 9, 'Data Share Airtel 5GB 30Days', '', 1100.00, 'data_share_airtel_5gb_30days', 1, '2023-06-06 09:44:28', '2023-06-13 03:27:20'),
(12, 9, 'Data Share Airtel 10GB 30Days', '', 2250.00, 'data_share_airtel_10gb_30days', 1, '2023-06-06 09:44:54', '2023-06-13 03:28:10'),
(13, 9, 'Data Share Airtel 15GB 30Days', '', 3300.00, 'data_share_airtel_15gb_30days', 1, '2023-06-06 09:45:20', '2023-06-13 03:28:36'),
(14, 9, 'Data Share Airtel 20GB 30Days', '', 4500.00, 'data_share_airtel_20gb_30days', 1, '2023-06-06 09:45:44', '2023-06-13 03:29:42'),
(15, 9, 'Data Share Airtel 300MB 7Days', '', 75.00, 'data_share_airtel_300mb_7days', 1, '2023-06-06 09:46:07', '2023-06-13 03:30:18'),
(16, 10, '9mobile SME 1GB', '', 165.00, '9mobile_sme_1gb', 1, '2023-06-06 09:47:11', '2023-06-13 03:31:13'),
(17, 10, '9mobile SME 1.5GB', '', 245.00, '9mobile_sme_1_5gb', 1, '2023-06-06 09:47:36', '2023-06-13 03:31:48'),
(18, 10, '9mobile SME 2GB', '', 325.00, '9mobile_sme_2gb', 1, '2023-06-06 09:48:07', '2023-06-13 03:32:29'),
(19, 10, '9mobile SME 3GB', '', 4850.00, '9mobile_sme_3gb', 1, '2023-06-06 09:48:40', '2023-06-13 03:34:57'),
(20, 10, '9mobile SME 5GB', '', 850.00, '9mobile_sme_5gb', 1, '2023-06-06 09:49:27', '2023-06-13 03:35:54'),
(21, 10, '9mobile SME 10GB', '', 1650.00, '9mobile_sme_10gb', 1, '2023-06-06 09:50:05', '2023-06-13 03:37:05'),
(22, 10, '9mobile SME 4GB', '', 650.00, '9mobile_sme_4gb', 1, '2023-06-06 09:50:41', '2023-06-13 03:39:00'),
(23, 10, '9mobile SME 40GB', '', 6500.00, '9mobile_sme_40gb', 1, '2023-06-06 09:51:08', '2023-06-13 03:39:51'),
(24, 10, '9mobile SME 7.5GB', '', 1250.00, '9mobile_sme_7_5gb', 1, '2023-06-06 09:51:37', '2023-06-13 03:42:07'),
(25, 10, '9mobile SME 500MB', '', 85.00, '9mobile_sme_500mb', 1, '2023-06-06 09:52:08', '2023-06-13 03:42:47'),
(26, 10, '9mobile SME 300MB', '', 50.00, '9mobile_sme_300mb', 1, '2023-06-06 09:52:36', '2023-06-13 03:43:22'),
(27, 10, '9mobile SME 100MB', '', 30.00, '9mobile_sme_100mb', 1, '2023-06-06 09:53:39', '2023-06-13 03:44:55'),
(28, 10, '9mobile SME 11GB', '', 2000.00, '9mobile_sme_11gb', 1, '2023-06-06 09:54:11', '2023-06-13 03:45:44'),
(29, 6, 'MTN Corporate Data 500MB', '', 116.00, 'mtn_corporate_data_500mb', 1, '2023-06-06 09:57:35', '2023-06-14 11:16:50'),
(30, 6, 'MTN Corporate Data 1GB', '', 230.00, 'mtn_corporate_data_1gb', 1, '2023-06-06 09:58:02', '2023-06-13 03:49:07'),
(31, 6, 'MTN Corporate Data 2GB', '', 470.00, 'mtn_corporate_data_2gb', 1, '2023-06-06 09:58:36', '2023-06-13 03:50:08'),
(32, 6, 'MTN Corporate Data 3GB', '', 700.00, 'mtn_corporate_data_3gb', 1, '2023-06-06 09:59:08', '2023-06-13 03:51:02'),
(33, 6, 'MTN Corporate Data 5GB', '', 1200.00, 'mtn_corporate_data_5gb', 1, '2023-06-06 09:59:54', '2023-06-13 03:52:01'),
(34, 6, 'MTN Corporate Data 10GB', '', 2400.00, 'mtn_corporate_data_10gb', 1, '2023-06-06 10:00:29', '2023-06-13 03:52:38'),
(35, 6, 'MTN Corporate Data 15GB', '', 3500.00, 'mtn_corporate_data_15gb', 1, '2023-06-06 10:01:01', '2023-06-13 03:53:31'),
(36, 6, 'MTN Corporate Data 20GB', '', 4800.00, 'mtn_corporate_data_20gb', 1, '2023-06-06 10:01:26', '2023-06-13 03:54:07'),
(37, 6, 'MTN Corporate Data 40GB', '', 9200.00, 'mtn_corporate_data_40gb', 1, '2023-06-06 10:01:58', '2023-06-13 03:55:05'),
(38, 6, 'MTN Corporate Data 250MB', '', 60.00, 'mtn_corporate_data_250mb', 1, '2023-06-06 10:02:33', '2023-06-13 03:56:07'),
(39, 6, 'MTN Corporate Data 150MB', '', 50.00, 'mtn_corporate_data_150mb', 1, '2023-06-06 10:03:09', '2023-06-13 03:57:07'),
(40, 6, 'MTN Corporate Data 50MB', '', 16.00, 'mtn_corporate_data_50mb', 1, '2023-06-06 10:03:43', '2023-06-13 03:57:47'),
(41, 6, 'MTN Corporate Data 25GB', '', 8000.00, 'mtn_corporate_data_25gb', 0, '2023-06-06 10:04:28', '2023-06-13 04:01:02'),
(42, 6, 'MTN Corporate Data 75GB', '', 18000.00, 'mtn_corporate_data_75gb', 1, '2023-06-06 10:05:00', '2023-06-13 04:02:22'),
(43, 6, 'MTN Corporate Data 100GB', '', 24500.00, 'mtn_corporate_data_100gb', 1, '2023-06-06 10:05:34', '2023-06-13 04:03:32'),
(44, 8, 'GLO CG 200MB', '', 70.00, 'glo_cg_200mb', 1, '2023-06-06 10:07:18', '2023-06-06 10:07:18'),
(45, 8, 'GLO CG 500MB', '', 125.00, 'glo_cg_500mb', 1, '2023-06-06 10:07:50', '2023-06-13 04:05:54'),
(46, 8, 'GLO CG 1GB', '', 250.00, 'glo_cg_1gb', 1, '2023-06-06 10:08:30', '2023-06-13 04:06:39'),
(47, 8, 'GLO CG 2GB', '', 485.00, 'glo_cg_2gb', 1, '2023-06-06 10:09:09', '2023-06-13 04:07:51'),
(48, 8, 'GLO CG 3GB', '', 700.00, 'glo_cg_3gb', 1, '2023-06-06 10:09:45', '2023-06-13 04:08:56'),
(49, 8, 'GLO CG 5GB', '', 1250.00, 'glo_cg_5gb', 1, '2023-06-06 10:10:14', '2023-06-13 04:09:27'),
(50, 8, 'GLO CG 10GB', '', 2450.00, 'glo_cg_10gb', 1, '2023-06-06 10:10:39', '2023-06-13 04:10:13'),
(51, 11, 'GOTv Max', '', 4800.00, 'gotv_max', 1, '2023-06-06 10:21:00', '2023-06-13 04:12:08'),
(52, 11, 'GOTv Smallie', '', 1000.00, 'gotv_smallie', 1, '2023-06-06 10:21:24', '2023-06-13 04:12:35'),
(53, 11, 'GOTv Jinja', '', 2200.00, 'gotv_jinja', 1, '2023-06-06 10:21:49', '2023-06-13 04:13:06'),
(54, 11, 'Gotv Jolli', '', 3200.00, 'gotv_jolli', 1, '2023-06-06 10:22:12', '2023-06-13 04:13:34'),
(55, 11, 'Gotv Super', '', 6300.00, 'gotv_super', 0, '2023-06-06 10:22:44', '2023-06-13 05:56:42'),
(56, 12, 'DSTv Compact', '', 10350.00, 'dstv_compact', 1, '2023-06-06 10:23:30', '2023-06-13 05:58:06'),
(57, 12, 'DsTv Compact Plus', '', 16400.00, 'dstv_compact_plus', 1, '2023-06-06 10:23:52', '2023-06-13 05:58:40'),
(58, 12, 'DSTv Premium', '', 24350.00, 'dstv_premium', 1, '2023-06-06 10:24:15', '2023-06-13 05:59:38'),
(59, 12, 'DSTv Confam', '', 6100.00, 'dstv_confam', 1, '2023-06-06 10:24:35', '2023-06-13 06:00:09'),
(60, 12, 'Dstv Padi', '', 2450.00, 'dstv_padi', 1, '2023-06-06 10:24:55', '2023-06-13 06:00:58'),
(61, 12, 'DSTv Yanga', '', 3450.00, 'dstv_yanga', 1, '2023-06-06 10:25:27', '2023-06-13 06:01:39'),
(62, 13, 'StarTimes Nova', '', 1150.00, 'startimes_nova', 1, '2023-06-06 10:26:17', '2023-06-13 06:02:34'),
(63, 13, 'StarTimes Basic', '', 2050.00, 'startimes_basic', 1, '2023-06-06 10:26:40', '2023-06-13 06:03:06'),
(64, 13, 'StarTimes Smart', '', 2700.00, 'startimes_smart', 1, '2023-06-06 10:27:03', '2023-06-13 06:03:23'),
(65, 13, 'StarTimes Classic', '', 3050.00, 'startimes_classic', 1, '2023-06-06 10:27:25', '2023-06-13 06:04:02'),
(66, 13, 'StarTimes Super', '', 5200.00, 'startimes_super', 1, '2023-06-06 10:27:48', '2023-06-13 06:04:35'),
(67, 14, 'Abuja Distribution Company Postpaid', '', 0.00, 'aedc_postpaid_custom', 1, '2023-06-06 10:45:57', '2023-06-06 10:46:44'),
(68, 14, 'Abuja Distribution Company Prepaid', '', 0.00, 'aedc_prepaid_custom', 1, '2023-06-06 10:47:07', '2023-06-06 10:47:07'),
(69, 15, 'Kaduna Distribution Company Postpaid', '', 0.00, 'kedco_postpaid_custom', 1, '2023-06-06 10:47:59', '2023-06-06 10:48:22'),
(70, 15, 'Kaduna Distribution Company Prepaid', '', 0.00, 'kedco_prepaid_custom', 1, '2023-06-06 10:48:52', '2023-06-06 10:48:52'),
(71, 16, 'Kano Distribution Company PostPaid', '', 0.00, 'kedc_postpaid_custom', 1, '2023-06-06 10:49:24', '2023-06-06 10:49:24'),
(72, 16, 'Kano Distribution Company PrePaid', '', 0.00, 'kedc_prepaid_custom', 1, '2023-06-06 10:49:49', '2023-06-06 10:49:49'),
(73, 17, 'Jos Distribution Company Postpaid', '', 0.00, 'jedc_postpaid_custom', 1, '2023-06-06 10:50:58', '2023-06-06 10:50:58'),
(74, 17, 'Jos Distribution Company Prepaid', '', 0.00, 'jedc_prepaid_custom', 1, '2023-06-06 10:51:33', '2023-06-06 10:51:33'),
(75, 18, 'Ibadan Distribution Company Postpaid', '', 0.00, 'ibedc_postpaid_custom', 1, '2023-06-06 10:52:24', '2023-06-06 10:52:24'),
(76, 18, 'Ibadan Distribution Company Prepaid', '', 0.00, 'ibedc_pretpaid_custom', 1, '2023-06-06 10:53:07', '2023-06-06 10:53:07'),
(77, 19, 'Ikeja Distribution Company Postpaid', '', 0.00, 'ikedc_postpaid_custom', 1, '2023-06-06 10:53:45', '2023-06-06 10:53:45'),
(78, 19, 'Ikeja Distribution Company Prepaid', '', 0.00, 'ikedc_prepaid_custom', 1, '2023-06-06 10:54:06', '2023-06-06 10:54:06'),
(79, 20, 'Eko Distribution Company Postpaid', '', 0.00, 'ekedc_postpaid_custom', 1, '2023-06-06 10:55:10', '2023-06-06 10:55:10'),
(80, 20, 'Eko Distribution Company Prepaid', '', 0.00, 'ekedc_prepaid_custom', 1, '2023-06-06 10:55:34', '2023-06-06 10:55:34'),
(81, 21, 'Enugu Distribution Company Postpaid', '', 0.00, 'eedc_postpaid_custom', 1, '2023-06-06 10:56:13', '2023-06-06 10:56:13'),
(82, 21, 'Enugu Distribution Company Prepaid', '', 0.00, 'eedc_prepaid_custom', 1, '2023-06-06 10:56:34', '2023-06-06 10:56:34'),
(83, 22, 'Port Harcourt Distribution Company Postpaid', '', 0.00, 'phed_postpaid_custom', 1, '2023-06-06 10:57:25', '2023-06-06 10:57:25'),
(84, 22, 'Port Harcourt Distribution Company Postpaid', '', 0.00, 'phed_prepaid_custom', 1, '2023-06-06 10:57:52', '2023-06-06 10:57:52');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `reference` varchar(50) NOT NULL,
  `api_reference` varchar(50) DEFAULT NULL,
  `status` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `type`, `category_id`, `product_id`, `service_id`, `amount`, `description`, `reference`, `api_reference`, `status`, `created_at`, `updated_at`) VALUES
(5, 1, 'debit', 6, 5, 3, 1470.00, '₦1,470 DATA SHARE 5GB', 'SUB320862483', '', 'failed', '2023-06-07 13:01:33', '2023-06-14 07:30:03'),
(6, 1, 'debit', 7, 11, 51, 3565.00, '₦3,565 GOTv Max', 'SUB1680784425', '', 'success', '2023-06-07 14:38:20', '2023-06-07 14:38:20'),
(7, 1, 'debit', 7, 11, 55, 4704.00, '₦4,704 Gotv Super', 'SUB1665287946', '', 'success', '2023-06-07 14:42:00', '2023-06-07 14:42:00'),
(8, 1, 'debit', 7, 11, 53, 1654.00, '₦1,654 GOTv Jinja', 'SUB1759074058', '', 'success', '2023-06-07 14:48:11', '2023-06-07 14:48:11'),
(9, 1, 'debit', 7, 11, 52, 809.00, '₦809 GOTv Smallie', 'SUB502669858', '', 'success', '2023-06-07 14:50:18', '2023-06-07 14:50:18'),
(10, 1, 'debit', 7, 11, 54, 2426.00, '₦2,426 Gotv Jolli', 'SUB1867490878', '', 'success', '2023-06-07 14:53:43', '2023-06-07 14:53:43'),
(11, 1, 'debit', 7, 11, 54, 2426.00, '₦2,426 Gotv Jolli', 'SUB214782036', '', 'success', '2023-06-07 15:04:56', '2023-06-07 15:04:56'),
(12, 1, 'debit', 7, 11, 54, 2426.00, '₦2,426 Gotv Jolli', 'SUB1173775357', '', 'success', '2023-06-07 15:08:07', '2023-06-07 15:08:07'),
(13, 1, 'debit', 5, 1, 0, 74.00, '₦74 MTN Airtime', 'SUB419781863', '', 'success', '2023-06-07 19:32:50', '2023-06-07 19:32:50'),
(14, 1, 'debit', 5, 1, 0, 74.00, '₦74 MTN Airtime', 'SUB543434598', '', 'success', '2023-06-07 19:34:01', '2023-06-07 19:34:01'),
(15, 1, 'debit', 5, 1, 0, 74.00, '₦74 MTN Airtime', 'SUB2135317798', '', 'success', '2023-06-07 19:34:50', '2023-06-07 19:34:50'),
(16, 1, 'debit', 5, 1, 0, 74.00, '₦74 MTN Airtime', 'SUB1553528367', '', 'success', '2023-06-07 19:54:05', '2023-06-07 19:54:05'),
(17, 1, 'debit', 5, 1, 0, 74.00, '₦74 MTN Airtime', 'SUB794662214', '', 'success', '2023-06-07 19:56:54', '2023-06-07 19:56:54'),
(18, 1, 'debit', 5, 1, 0, 74.00, '₦74 MTN Airtime', 'SUB1072577270', '', 'success', '2023-06-07 19:57:44', '2023-06-07 19:57:44'),
(19, 1, 'debit', 5, 1, 0, 74.00, '₦74 MTN Airtime', 'SUB2021222858', '', 'success', '2023-06-07 19:59:58', '2023-06-07 19:59:58'),
(20, 1, 'debit', 5, 4, 0, 74.00, '₦74 9mobile Airtime', 'SUB727853310', '', 'success', '2023-06-07 20:00:24', '2023-06-07 20:00:24'),
(21, 1, 'debit', 6, 5, 1, 221.00, '₦221 DATA SHARE 1GB', 'SUB118940434', '', 'success', '2023-06-07 20:00:56', '2023-06-07 20:00:56'),
(22, 1, 'debit', 7, 11, 52, 809.00, '₦809 GOTv Smallie', 'SUB1686242905', '', 'success', '2023-06-07 20:06:41', '2023-06-07 20:06:41'),
(23, 1, 'debit', 7, 11, 52, 809.00, '₦809 GOTv Smallie', 'SUB227275831', '', 'success', '2023-06-07 20:09:45', '2023-06-07 20:09:45'),
(24, 1, 'debit', 8, 19, 0, 735.00, '₦735 Ikeja Distribution Company', 'SUB538212631', '', 'success', '2023-06-07 20:26:54', '2023-06-07 20:26:54'),
(26, 1, 'credit_transfer', 0, 0, 0, 100.00, '₦100 sent from TOMIWA KUNLE OLUWADARE', 'TRANS1777863518', '', 'success', '2023-06-08 04:56:02', '2023-06-08 04:56:02'),
(27, 1, 'debit_transfer', 0, 0, 0, 100.00, '₦100 sent to TOMIWA KUNLE OLUWADARE', 'TRANS1230848976', '', 'success', '2023-06-08 04:56:02', '2023-06-08 04:56:02'),
(28, 1, 'credit_transfer', 0, 0, 0, 100.00, '₦100 sent from ADMIN ACCOUNT', 'TRANS1023661873', '', 'success', '2023-06-08 04:59:09', '2023-06-08 04:59:09'),
(29, 1, 'debit_transfer', 0, 0, 0, 100.00, '₦100 sent to ADMIN ACCOUNT', 'TRANS1940454089', '', 'success', '2023-06-08 04:59:09', '2023-06-08 04:59:09'),
(30, 1, 'credit_transfer', 0, 0, 0, 41.00, '₦41 sent from ADMIN ACCOUNT', 'TRANS591100778', '', 'success', '2023-06-08 05:06:02', '2023-06-08 05:06:02'),
(31, 1, 'debit_transfer', 0, 0, 0, 41.00, '₦41 sent to ADMIN ACCOUNT', 'TRANS1154970010', '', 'success', '2023-06-08 05:06:02', '2023-06-08 05:06:02'),
(32, 1, 'credit_transfer', 0, 0, 0, 1.00, '₦1 sent from ADMIN ACCOUNT', 'TRANS771325171', '', 'success', '2023-06-08 05:08:40', '2023-06-08 05:08:40'),
(33, 1, 'debit_transfer', 0, 0, 0, 1.00, '₦1 sent to ADMIN ACCOUNT', 'TRANS265977364', '', 'success', '2023-06-08 05:08:40', '2023-06-08 05:08:40'),
(34, 1, 'credit_transfer', 0, 0, 0, 1.00, '₦1 sent from ADMIN ACCOUNT', 'TRANS1618571225', '', 'success', '2023-06-08 05:10:50', '2023-06-08 05:10:50'),
(35, 1, 'debit_transfer', 0, 0, 0, 1.00, '₦1 sent to ADMIN ACCOUNT', 'TRANS1685972273', '', 'success', '2023-06-08 05:10:50', '2023-06-08 05:10:50'),
(36, 1, 'credit_transfer', 0, 0, 0, 10.00, '₦10 sent from ADMIN ACCOUNT', 'TRANS325707796', '', 'success', '2023-06-08 05:19:38', '2023-06-08 05:19:38'),
(37, 1, 'debit_transfer', 0, 0, 0, 10.00, '₦10 sent to TOMIWA KUNLE OLUWADARE', 'TRANS678184350', '', 'success', '2023-06-08 05:19:38', '2023-06-08 05:19:38'),
(38, 1, 'credit_transfer', 0, 0, 0, 10.00, '₦10 sent from ADMIN ACCOUNT', 'TRANS1390156311', '', 'success', '2023-06-08 05:21:26', '2023-06-08 05:21:26'),
(39, 1, 'debit_transfer', 0, 0, 0, 10.00, '₦10 sent to TOMIWA KUNLE OLUWADARE', 'TRANS348535001', '', 'success', '2023-06-08 05:21:26', '2023-06-08 05:21:26'),
(40, 1, 'credit_transfer', 0, 0, 0, 100.00, '₦100 sent from ADMIN ACCOUNT', 'TRANS346121904', '', 'success', '2023-06-08 13:42:20', '2023-06-08 13:42:20'),
(41, 1, 'debit_transfer', 0, 0, 0, 100.00, '₦100 sent to TOMIWA KUNLE OLUWADARE', 'TRANS703295914', '', 'success', '2023-06-08 13:42:20', '2023-06-08 13:42:20'),
(42, 1, 'credit_transfer', 0, 0, 0, 10.00, '₦10 sent from ADMIN ACCOUNT', 'TRANS1936523866', '', 'success', '2023-06-08 13:57:53', '2023-06-08 13:57:53'),
(43, 2, 'debit_transfer', 0, 0, 0, 10.00, '₦10 sent to TOMIWA KUNLE OLUWADARE', 'TRANS1049086391', '', 'success', '2023-06-08 13:57:53', '2023-06-08 13:57:53'),
(44, 2, 'credit_transfer', 0, 0, 0, 100.00, '₦100 sent from TOMIWA KUNLE OLUWADARE', 'TRANS1796965142', '', 'success', '2023-06-08 14:53:11', '2023-06-08 14:53:11'),
(45, 1, 'debit_transfer', 0, 0, 0, 100.00, '₦100 sent to ADMIN ACCOUNT', 'TRANS441303389', '', 'success', '2023-06-08 14:53:11', '2023-06-08 14:53:11'),
(46, 1, 'debit', 7, 11, 52, 809.00, '₦809 GOTv Smallie for 7023687567', 'SUB94171299', '', 'success', '2023-06-08 15:38:17', '2023-06-08 15:38:17'),
(47, 1, 'debit', 5, 1, 0, 74.00, '₦74 MTN Airtime', 'SUB93535641', '', 'success', '2023-06-08 15:39:07', '2023-06-08 15:39:07'),
(48, 1, 'debit', 5, 1, 0, 37.00, '₦37 MTN Airtime', 'SUB1389480312', '', 'success', '2023-06-09 10:07:32', '2023-06-09 10:07:32'),
(49, 1, 'debit', 5, 1, 0, 37.00, '₦37 MTN Airtime', 'SUB1266025134', '', 'success', '2023-06-09 10:08:37', '2023-06-09 10:08:37'),
(50, 1, 'debit', 5, 1, 0, 37.00, '₦37 MTN Airtime', 'SUB1954039700', '', 'success', '2023-06-09 10:36:34', '2023-06-09 10:36:34'),
(51, 1, 'debit', 5, 1, 0, 37.00, '₦37 MTN Airtime', 'SUB989819796', '', 'success', '2023-06-09 10:43:10', '2023-06-09 10:43:10'),
(52, 1, 'debit', 5, 1, 0, 37.00, '₦37 MTN Airtime', 'SUB1127879653', '', 'success', '2023-06-09 10:53:12', '2023-06-09 10:53:12'),
(53, 1, 'debit', 5, 1, 0, 37.00, '₦37 MTN Airtime', 'SUB205980544', '', 'success', '2023-06-09 10:55:32', '2023-06-09 10:55:32'),
(54, 1, 'debit', 5, 1, 0, 37.00, '₦37 MTN Airtime', 'SUB1104603931', '', 'success', '2023-06-09 10:58:08', '2023-06-09 10:58:08'),
(55, 1, 'debit', 5, 1, 0, 37.00, '₦37 MTN Airtime', 'SUB1133595523', '', 'success', '2023-06-09 11:09:15', '2023-06-09 11:09:15'),
(57, 1, 'credit', 0, 0, 0, 102.00, '₦102 Credit to your account via Monnify', 'SUB1062728829', 'SUB1291940504?paymentReference=SUB1291940504', 'unknown', '2023-06-11 17:41:49', '2023-06-11 17:41:49'),
(58, 1, 'credit', 0, 0, 0, 200.00, '₦200 Credit to your account via Monnify', 'SUB1786012658', 'SUB615770131?paymentReference=SUB615770131', 'success', '2023-06-11 17:47:33', '2023-06-11 17:47:33'),
(59, 1, 'debit', 5, 1, 0, 74.00, '₦74 MTN Airtime', 'SUB307451535', '', 'success', '2023-06-12 02:18:31', '2023-06-12 02:18:31'),
(60, 1, 'debit', 5, 1, 0, 74.00, '₦74 MTN Airtime', 'SUB1886656253', '', 'success', '2023-06-12 02:23:57', '2023-06-12 02:23:57'),
(61, 9, 'credit', 0, 0, 0, 10.00, '₦10 Credit to your account via Monnify', 'SUB1061421106', 'MNFY|39|20230611200934|000621', 'PAID', '2023-06-12 04:56:22', '2023-06-12 04:56:22'),
(62, 10, 'credit', 0, 0, 0, 1000.00, '₦1,000 Credit to your account via Monnify', 'SUB856637233', 'SUB1517123382?paymentReference=SUB1517123382', 'success', '2023-06-13 12:36:04', '2023-06-13 12:36:04'),
(63, 1, 'credit_transfer', 0, 0, 0, 1.00, '₦1 sent from Remilekun Amos', 'TRANS228870174', '', 'success', '2023-06-13 12:48:31', '2023-06-13 12:48:31'),
(64, 10, 'debit_transfer', 0, 0, 0, 1.00, '₦1 sent to TOMIWA KUNLE OLUWADARE', 'TRANS172685287', '', 'success', '2023-06-13 12:48:31', '2023-06-13 12:48:31'),
(65, 10, 'credit', 0, 0, 0, 100.00, '₦100 Credit to your account via Monnify', 'SUB1433350825', 'MNFY|39|20230613160439|000884', 'PAID', '2023-06-13 14:07:04', '2023-06-13 14:07:04'),
(66, 1, 'debit', 5, 1, 0, 0.00, '₦0 MTN Airtime', 'SUB1558120862', '5522646', 'failed', '2023-06-14 07:01:50', '2023-06-14 07:30:05'),
(67, 1, 'debit', 5, 1, 0, 0.20, '₦0 MTN Airtime', 'SUB1212899814', '5523417', 'failed', '2023-06-14 08:17:36', '2023-06-14 08:23:03'),
(68, 1, 'debit', 5, 1, 0, 0.20, '₦0 MTN Airtime', 'SUB1929969443', '5523619', 'failed', '2023-06-14 08:38:52', '2023-06-14 08:43:03'),
(69, 1, 'debit', 6, 6, 40, 16.00, '₦16 MTN Corporate Data 50MB', 'SUB815668415', '5524764', 'success', '2023-06-14 11:18:12', '2023-06-14 11:18:12'),
(70, 28, 'credit_transfer', NULL, NULL, NULL, 41.00, '₦41 sent from Tomiwa Oluwadare', 'TRANS35590244', NULL, 'success', '2024-06-25 15:59:34', '2024-06-25 15:59:34'),
(71, 1, 'debit_transfer', NULL, NULL, NULL, 41.00, '₦41 sent to Lerry', 'TRANS986585585', NULL, 'success', '2024-06-25 15:59:34', '2024-06-25 15:59:34'),
(72, 1, 'debit', 6, 5, 5, 110.00, '₦110 DATA SHARE 500MB for 08137841576', 'SUB1291208320', '122255453', 'success', '2024-07-08 03:23:01', '2024-07-08 03:23:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `password` varchar(191) NOT NULL,
  `pin` varchar(191) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `access_token` varchar(50) DEFAULT NULL,
  `role_as` int(1) NOT NULL DEFAULT 0,
  `level` int(1) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1,
  `balance` decimal(10,2) DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `login_attempts` int(11) NOT NULL DEFAULT 0,
  `lockout_time` timestamp NULL DEFAULT NULL,
  `mfa` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `pin`, `remember_token`, `access_token`, `role_as`, `level`, `status`, `balance`, `created_at`, `updated_at`, `login_attempts`, `lockout_time`, `mfa`) VALUES
(1, 'Tomiwa Oluwadare', 'cafeat9ja@gmail.com', '2024-09-24 05:57:59', '$2y$10$dWPg83dXcYqU3UoaQyN9MeTgJET/ugz0m2j94MTGsU5b/F0X9EjFq', '1667', '', '304|llniVpYRoFsXwo0Y7ONDqsF0wl2JWnAM0trg0xtt', 0, 1, 1, 3730.40, '2023-06-05 14:50:13', '2024-09-24 04:57:59', 0, NULL, 0),
(2, 'Small God', 'admin@gmail.com', '2024-07-15 10:31:16', '$2y$10$ql3JV963ShkxCSoVMz74e.F3GFYeFZZESfCsle7WXTCEEStkGEPc2', '', '', '295|g2UfFxwJ9GlYzfeTF0EAzV0CCWYOzeF9LYR3SibX', 1, 1, 1, 227.00, '2023-06-05 16:05:00', '2024-07-15 09:31:16', 0, NULL, 0),
(3, 'Ayeni Ajayi', 'oluwadartomiwa@gmail.com', '0000-00-00 00:00:00', '$2y$10$A6KX7Q1XMRagU2MGsYeeWu7qqBhazEjJsN5on2M/nHJ5j2sk/WujC', '1234', '', '', 0, 1, 1, 0.00, '2023-06-08 16:26:54', '2023-06-08 16:29:41', 0, NULL, 0),
(4, 'SME Data', 'oluwadaretomiwa@gmail.co', '0000-00-00 00:00:00', '$2y$10$H02aDYwvlcPHX0qmPPnxp.7CTkvaDYlDem19hrf5tjELitCtRsDLa', '', '', '', 0, 1, 1, 0.00, '2023-06-10 08:41:38', '2023-06-10 08:41:38', 0, NULL, 0),
(9, 'Admin 2', 'admin2@gmail.com', '2024-09-24 01:13:07', '$2y$10$ql3JV963ShkxCSoVMz74e.F3GFYeFZZESfCsle7WXTCEEStkGEPc2', '', '', '297|LAEVIwemBWIqyrBmVL1VN3KkgvYXpVXWeAIg8lcx', 1, 1, 1, 10.00, '2023-06-11 04:57:26', '2024-09-24 00:13:07', 0, NULL, 0),
(16, 'TOMIWA KUNLE OLUWADARE', 'cafeat9ja2@gmail.com', NULL, '$2y$10$dO.nsfmajO.Y2lzbzQhVoOynv.XmskhfgUGAvxcLkgsJ00qsM9fou', NULL, NULL, NULL, 0, 1, 1, 0.00, '2024-02-25 13:27:35', '2024-02-25 13:27:35', 0, NULL, 0),
(17, '-', 'cafeat9ja3@gmail.com', NULL, '$2y$10$MmUVjlFxe3Wf8DZNTg8CduPRHaRx5hCjL6hC.pDgsTi8F4EO7JYGa', NULL, NULL, NULL, 0, 1, 1, 0.00, '2024-02-25 13:29:13', '2024-02-25 13:29:13', 0, NULL, 0),
(18, 'ADMIN 3', 'admin3@gmail.com', '2024-03-17 20:43:50', '$2y$10$cXBRTzOi3fDPTGSA301s6Ovnm57JtYW0z7ixzwW2y02rV1vKRPPd6', NULL, NULL, '76|xlHnuZ08mL5Ps9uXCTmlpUtkSIV9Cikw0dRSAEQr', 1, 1, 1, 0.00, '2024-03-03 10:25:31', '2024-03-17 20:43:50', 0, NULL, 0),
(19, 'Admin 4', 'admin4@gmail.com', '2024-06-05 07:02:34', '$2y$10$JZKZ841bBtMTnIg5L2qyzuQpxQnFShGTUnmwcipETbymubrksqPvm', NULL, NULL, NULL, 0, 1, 1, 0.00, '2024-06-05 06:02:34', '2024-06-05 06:02:34', 0, NULL, 0),
(20, 'Admin 5', 'admin5@gmail.com', '2024-06-05 07:09:51', '$2y$10$JBWI6TwMnwK4YqjUPTiaAu.wqHXxOsh8rZZoR4Xi46Mo5QRyV1oBy', NULL, NULL, NULL, 0, 1, 1, 0.00, '2024-06-05 06:09:51', '2024-06-05 06:09:51', 0, NULL, 0),
(21, 'Admin 6', 'admin6@gmail.com', '2024-06-05 07:11:14', '$2y$10$5ehQeyhINxKpUoHQQG578O9mQxgZHAmxFcjtsAwK1RjIpRFtMjmKq', NULL, NULL, NULL, 0, 1, 1, 0.00, '2024-06-05 06:11:14', '2024-06-05 06:11:14', 0, NULL, 0),
(23, 'Admin 7', 'admin7@gmail.com', '2024-06-05 07:21:18', '$2y$10$a3h22ETS1QSALUrv7UgVZubqeWmeDcvnaqYB4k5VGFflpAO/6E5WW', NULL, NULL, NULL, 0, 1, 1, 0.00, '2024-06-05 06:21:18', '2024-06-05 06:21:18', 0, NULL, 0),
(24, 'Admin 8', 'admin8@gmail.com', '2024-06-05 08:00:52', '$2y$10$l5f4wOe4tmGmcXlPhREWy.bDrIagPTa3WzW4m42hRKP2g6YFUA6HC', NULL, NULL, '196|O9I8sy7sdy58K77pIvooLfP2chzaSw5Fg8TdvFc0', 1, 1, 1, 0.00, '2024-06-05 06:24:51', '2024-06-05 07:00:52', 0, NULL, 0),
(25, 'Admin 9', 'admin9@gmail.com', '2024-06-05 08:03:09', '$2y$10$K8jlXFwXfXZxcCl08mAzWeK1FGEw6mSQgyTT/2VwWAUip1XsXaJy6', NULL, NULL, NULL, 0, 1, 1, 0.00, '2024-06-05 07:03:09', '2024-06-05 07:03:09', 0, NULL, 0),
(26, 'Admin 10', 'admin10@gmail.com', '2024-06-05 08:51:13', '$2y$10$lQtf9RZE.rpFDb.UQtsJBuhVzoFJk46jajPMgln0yBUb8snk.9rEi', NULL, NULL, '206|3b9n2JuFMHImrRKkdhRKDnOkWie939ayfqcBkIfn', 0, 1, 1, 0.00, '2024-06-05 07:08:21', '2024-06-05 07:51:13', 0, NULL, 0),
(27, 'Admin 11', 'admin11@gmail.com', '2024-06-05 08:13:32', '$2y$10$RymYYcggPhNsWXAMC5JqEux00cmhZe06pMTFuyAC05ssEsTVmFvdG', NULL, NULL, NULL, 0, 1, 1, 0.00, '2024-06-05 07:13:32', '2024-06-05 07:13:32', 0, NULL, 0),
(28, 'Tomiwa Oluwadare', 'user@gmail.com', '2024-07-07 03:10:13', '$2y$10$wMqLalbZUj9oPZPepumlOuZ./e6VBlq12qJZdU1D5ziXurvfoiNXu', NULL, NULL, '292|MEHUHxzkU9ZQhgdAK6Z3vyAc1G5jzEJDQ4sFEPf2', 0, 1, 1, 41.00, '2024-06-25 01:32:29', '2024-07-07 02:10:13', 0, NULL, 0),
(29, 'TOMIWA KUNLE OLUWADARE', 'cafeat9jssa@gmail.com', '2024-09-24 02:36:19', '$2y$10$OjSQH9DWAb0w7p7QJedBGOxYEMCGFlMlkEsG1X6ME3VAzLdHI4AJa', NULL, NULL, NULL, 0, 1, 1, 0.00, '2024-09-24 01:36:19', '2024-09-24 01:36:19', 0, NULL, 0),
(30, '1', 'cassfeat9ja@gmail.com', '2024-09-24 03:59:07', '$2y$10$VsSjBHfPSgryQFy3OKIKDuYR5itgDbhw9bIXKmXn/qYW6pxUQQHQS', NULL, NULL, NULL, 0, 1, 1, 0.00, '2024-09-24 02:59:07', '2024-09-24 02:59:07', 0, NULL, 0),
(31, 'TOMIWA KUNLE OLUWADARE', 'cafeat9jafr@gmail.com', '2024-09-24 04:41:12', '$2y$10$YOyiGS156fYihInrLXGLPO7q2F7a5Em1G/eYrkh31VCPT.Nsjcs3a', NULL, NULL, NULL, 0, 1, 1, 0.00, '2024-09-24 03:41:12', '2024-09-24 03:41:12', 0, NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api`
--
ALTER TABLE `api`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `beneficiaries`
--
ALTER TABLE `beneficiaries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `beneficiaries_number_unique` (`number`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `discounts_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `ip_whitelists`
--
ALTER TABLE `ip_whitelists`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ip` (`ip`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `level` (`level`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `merchant_api`
--
ALTER TABLE `merchant_api`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `otps`
--
ALTER TABLE `otps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api`
--
ALTER TABLE `api`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `beneficiaries`
--
ALTER TABLE `beneficiaries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ip_whitelists`
--
ALTER TABLE `ip_whitelists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `merchant_api`
--
ALTER TABLE `merchant_api`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `otps`
--
ALTER TABLE `otps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=753;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=305;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `discounts`
--
ALTER TABLE `discounts`
  ADD CONSTRAINT `discounts_ibfk_1` FOREIGN KEY (`created_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `permissions_ibfk_2` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
