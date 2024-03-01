-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 25, 2024 at 02:46 PM
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
-- Database: `sub4data`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) NOT NULL,
  `title` varchar(191) NOT NULL,
  `log` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `type`, `title`, `log`, `created_at`, `updated_at`) VALUES
(1, 'bulk_email', 'Happy Holidays', 'a:3:{s:4:\"name\";s:11:\"Ayeni Ajayi\";s:5:\"title\";s:14:\"Happy Holidays\";s:7:\"message\";s:797:\"Dear  Esteemed Partner,\n\nHappy Good Friday and Easter Celebrations from us to you!\n\nWe hope that you enjoy this time with your family, friends and loved ones. Good Friday is a time for reflection and remembering the sacrifice of Jesus, and Easter is a time for celebration and new beginnings.\n\nWe would like to take this opportunity to thank you for your continued support and loyalty. We are grateful for the trust you have placed in us and we look forward to continuing to serve you in the future.\n\nAs we prepare to celebrate the Easter holiday, let us all take this time to reflect on the true meaning of Easter, and to celebrate the gift of life and the joy of family.\n\nThank you again for your loyalty and we wish you a safe and happy Easter holiday.\n\nFrom all of us at Vtpass,\n\nHappy Easter!\";}', '2023-06-10 02:31:01', '2023-06-10 02:31:01'),
(2, 'bulk_email', 'Happy Holidays', 'a:3:{s:4:\"name\";s:11:\"Ayeni Ajayi\";s:5:\"title\";s:14:\"Happy Holidays\";s:7:\"message\";s:797:\"Dear  Esteemed Partner,\n\nHappy Good Friday and Easter Celebrations from us to you!\n\nWe hope that you enjoy this time with your family, friends and loved ones. Good Friday is a time for reflection and remembering the sacrifice of Jesus, and Easter is a time for celebration and new beginnings.\n\nWe would like to take this opportunity to thank you for your continued support and loyalty. We are grateful for the trust you have placed in us and we look forward to continuing to serve you in the future.\n\nAs we prepare to celebrate the Easter holiday, let us all take this time to reflect on the true meaning of Easter, and to celebrate the gift of life and the joy of family.\n\nThank you again for your loyalty and we wish you a safe and happy Easter holiday.\n\nFrom all of us at Vtpass,\n\nHappy Easter!\";}', '2023-06-10 02:46:05', '2023-06-10 02:46:05'),
(3, 'bulk_email', 'Happy Holidays', 'a:3:{s:4:\"name\";s:11:\"Ayeni Ajayi\";s:5:\"title\";s:14:\"Happy Holidays\";s:7:\"message\";s:774:\"Happy Good Friday and Easter Celebrations from us to you!\r\n\r\nWe hope that you enjoy this time with your family, friends and loved ones. Good Friday is a time for reflection and remembering the sacrifice of Jesus, and Easter is a time for celebration and new beginnings.\r\n\r\nWe would like to take this opportunity to thank you for your continued support and loyalty. We are grateful for the trust you have placed in us and we look forward to continuing to serve you in the future.\r\n\r\nAs we prepare to celebrate the Easter holiday, let us all take this time to reflect on the true meaning of Easter, and to celebrate the gift of life and the joy of family.\r\n\r\nThank you again for your loyalty and we wish you a safe and happy Easter holiday.\r\n\r\nFrom all of us at Sub4Data,\r\n\r\nHappy Easter!\";}', '2023-06-10 03:08:14', '2023-06-10 03:08:14'),
(4, 'bulk_email', 'Happy Holidays', 'a:3:{s:4:\"name\";s:11:\"Ayeni Ajayi\";s:5:\"title\";s:14:\"Happy Holidays\";s:7:\"message\";s:772:\"Happy Good Friday and Easter Celebrations from us to you!\r\n\r\nWe hope that you enjoy this time with your family, friends and loved ones. Good Friday is a time for reflection and remembering the sacrifice of Jesus, and Easter is a time for celebration and new beginnings.\r\n\r\nWe would like to take this opportunity to thank you for your continued support and loyalty. We are grateful for the trust you have placed in us and we look forward to continuing to serve you in the future.\r\n\r\nAs we prepare to celebrate the Easter holiday, let us all take this time to reflect on the true meaning of Easter, and to celebrate the gift of life and the joy of family.\r\n\r\nThank you again for your loyalty and we wish you a safe and happy Easter holiday.\r\n\r\nFrom all of us at Vtpass,\r\n\r\nHappy Easter!\";}', '2023-06-10 03:11:33', '2023-06-10 03:11:33'),
(5, 'monnify_credit', 'Monnify Merchant Credit Payment', 'a:8:{s:4:\"name\";s:22:\"TOMIWA KUNLE OLUWADARE\";s:5:\"email\";s:19:\"cafeat9ja@gmail.com\";s:5:\"title\";s:47:\"[Debit Transaction] Thank you for your purchase\";s:7:\"balance\";d:3743.5;s:9:\"reference\";s:12:\"SUB826558396\";s:5:\"price\";s:3:\"100\";s:11:\"description\";s:41:\"₦100 Credit to your account via Monnify\";s:10:order_date\";s:19:\"2023-06-11 18:12:37\";}', '2023-06-11 17:12:41', '2023-06-11 17:12:41'),
(6, 'monnify_credit', 'Monnify Merchant Credit Payment', 'a:8:{s:4:\"name\";s:22:\"TOMIWA KUNLE OLUWADARE\";s:5:\"email\";s:19:\"cafeat9ja@gmail.com\";s:5:\"title\";s:47:\"[Debit Transaction] Thank you for your purchase\";s:7:\"balance\";d:3743.5;s:9:\"reference\";s:13:\"SUB1234547564\";s:5:\"price\";s:3:\"100\";s:11:\"description\";s:41:\"₦100 Credit to your account via Monnify\";s:10:order_date\";s:19:\"2023-06-11 18:13:47\";}', '2023-06-11 17:13:51', '2023-06-11 17:13:51'),
(7, 'monnify_credit', 'Monnify Merchant Credit Payment', 'a:8:{s:4:\"name\";s:22:\"TOMIWA KUNLE OLUWADARE\";s:5:\"email\";s:19:\"cafeat9ja@gmail.com\";s:5:\"title\";s:47:\"[Debit Transaction] Thank you for your purchase\";s:7:\"balance\";d:3845;s:9:\"reference\";s:13:\"SUB1062728829\";s:5:\"price\";s:3:\"102\";s:11:\"description\";s:41:\"₦102 Credit to your account via Monnify\";s:10:order_date\";s:19:\"2023-06-11 18:41:45\";}', '2023-06-11 17:41:49', '2023-06-11 17:41:49'),
(8, 'monnify_credit', 'Monnify Merchant Credit Payment', 'a:8:{s:4:\"name\";s:22:\"TOMIWA KUNLE OLUWADARE\";s:5:\"email\";s:19:\"cafeat9ja@gmail.com\";s:5:\"title\";s:47:\"[Debit Transaction] Thank you for your purchase\";s:7:\"balance\";d:4045;s:9:\"reference\";s:13:\"SUB1786012658\";s:5:\"price\";s:3:\"200\";s:11:\"description\";s:41:\"₦200 Credit to your account via Monnify\";s:10:order_date\";s:19:\"2023-06-11 18:47:28\";}', '2023-06-11 17:47:32', '2023-06-11 17:47:32'),
(9, 'debit', '₦74 MTN Airtime', 'a:8:{s:4:\"name\";s:22:\"TOMIWA KUNLE OLUWADARE\";s:5:\"email\";s:19:\"cafeat9ja@gmail.com\";s:5:\"title\";s:47:\"[Debit Transaction] Thank you for your purchase\";s:7:\"balance\";d:3971.5;s:9:\"reference\";s:12:\"SUB307451535\";s:5:\"price\";s:2:\"74\";s:11:\"description\";s:17:\"₦74 MTN Airtime\";s:10:order_date\";s:19:\"2023-06-12 03:18:27\";}', '2023-06-12 02:18:31', '2023-06-12 02:18:31'),
(10, 'debit', '₦74 MTN Airtime', 'a:8:{s:4:\"name\";s:22:\"TOMIWA KUNLE OLUWADARE\";s:5:\"email\";s:19:\"cafeat9ja@gmail.com\";s:5:\"title\";s:47:\"[Debit Transaction] Thank you for your purchase\";s:7:\"balance\";d:3898;s:9:\"reference\";s:13:\"SUB1886656253\";s:5:\"price\";s:2:\"74\";s:11:\"description\";s:17:\"₦74 MTN Airtime\";s:10:order_date\";s:19:\"2023-06-12 03:23:52\";}', '2023-06-12 02:23:57', '2023-06-12 02:23:57'),
(11, 'monnify_credit', 'Monnify Merchant Credit Payment', 'a:8:{s:4:\"name\";s:16:\"Electricity Bill\";s:5:\"email\";s:16:\"admin2@gmail.com\";s:5:\"title\";s:37:\"[Credit Transaction] Payment Received\";s:7:\"balance\";i:10;s:9:\"reference\";s:13:\"SUB1061421106\";s:5:\"price\";s:2:\"10\";s:11:\"description\";s:40:\"₦10 Credit to your account via Monnify\";s:10:order_date\";s:19:\"2023-06-12 05:56:14\";}', '2023-06-12 04:56:22', '2023-06-12 04:56:22'),
(12, 'monnify_credit', 'Monnify Merchant Credit Payment', 'a:8:{s:4:\"name\";s:14:\"Remilekun Amos\";s:5:\"email\";s:25:\"oluwadaretomiwa@gmail.com\";s:5:\"title\";s:37:\"[Credit Transaction] Payment received\";s:7:\"balance\";i:1000;s:9:\"reference\";s:12:\"SUB856637233\";s:5:\"price\";s:5:\"1,000\";s:11:\"description\";s:43:\"₦1,000 Credit to your account via Monnify\";s:10:order_date\";s:19:\"2023-06-13 13:35:59\";}', '2023-06-13 12:36:04', '2023-06-13 12:36:04'),
(13, 'credit_transfer', '₦1 sent from Remilekun Amos', 'a:8:{s:4:\"name\";s:14:\"Remilekun Amos\";s:5:\"email\";s:25:\"oluwadaretomiwa@gmail.com\";s:5:\"title\";s:29:\"[Credit Transaction] Transfer\";s:7:\"balance\";d:999;s:9:\"reference\";s:14:\"TRANS172685287\";s:5:\"price\";s:1:\"1\";s:11:\"description\";s:35:\"₦1 sent to TOMIWA KUNLE OLUWADARE\";s:10:order_date\";s:19:\"2023-06-13 13:48:22\";}', '2023-06-13 12:48:25', '2023-06-13 12:48:25'),
(14, 'debit_transfer', '₦1 sent to TOMIWA KUNLE OLUWADARE', 'a:8:{s:4:\"name\";s:22:\"TOMIWA KUNLE OLUWADARE\";s:5:\"email\";s:19:\"cafeat9ja@gmail.com\";s:5:\"title\";s:28:\"[Debit Transaction] Transfer\";s:7:\"balance\";d:3899;s:9:\"reference\";s:14:\"TRANS228870174\";s:5:\"price\";s:1:\"1\";s:11:\"description\";s:29:\"₦1 sent from Remilekun Amos\";s:10:order_date\";s:19:\"2023-06-13 13:48:25\";}', '2023-06-13 12:48:31', '2023-06-13 12:48:31'),
(15, 'monnify_credit', 'Monnify Merchant Credit Payment', 'a:8:{s:4:\"name\";s:14:\"Remilekun Amos\";s:5:\"email\";s:25:\"oluwadaretomiwa@gmail.com\";s:5:\"title\";s:37:\"[Credit Transaction] Payment Received\";s:7:\"balance\";d:1099;s:9:\"reference\";s:13:\"SUB1433350825\";s:5:\"price\";s:3:\"100\";s:11:\"description\";s:41:\"₦100 Credit to your account via Monnify\";s:10:order_date\";s:19:\"2023-06-13 15:07:00\";}', '2023-06-13 14:07:04', '2023-06-13 14:07:04'),
(16, 'debit', '₦0 MTN Airtime', 'a:8:{s:4:\"name\";s:22:\"TOMIWA KUNLE OLUWADARE\";s:5:\"email\";s:19:\"cafeat9ja@gmail.com\";s:5:\"title\";s:47:\"[Debit Transaction] Thank you for your purchase\";s:7:\"balance\";d:3898.8;s:9:\"reference\";s:13:\"SUB1558120862\";s:5:\"price\";s:1:\"0\";s:11:\"description\";s:16:\"₦0 MTN Airtime\";s:10:order_date\";s:19:\"2023-06-14 08:01:41\";}', '2023-06-14 07:01:50', '2023-06-14 07:01:50'),
(17, 'debit', '₦0 MTN Airtime', 'a:8:{s:4:\"name\";s:22:\"TOMIWA KUNLE OLUWADARE\";s:5:\"email\";s:19:\"cafeat9ja@gmail.com\";s:5:\"title\";s:47:\"[Debit Transaction] Thank you for your purchase\";s:7:\"balance\";d:3898.6000000000004;s:9:\"reference\";s:13:\"SUB1212899814\";s:5:\"price\";s:1:\"0\";s:11:\"description\";s:16:\"₦0 MTN Airtime\";s:10:order_date\";s:19:\"2023-06-14 09:17:30\";}', '2023-06-14 08:17:36', '2023-06-14 08:17:36'),
(18, 'credit', 'Refunded ₦0 MTN Airtime', 'a:8:{s:4:\"name\";s:22:\"TOMIWA KUNLE OLUWADARE\";s:5:\"email\";s:19:\"cafeat9ja@gmail.com\";s:5:\"title\";s:47:\"[Debit Transaction] Thank you for your purchase\";s:7:\"balance\";d:3898.4;s:9:\"reference\";s:7:\"5523417\";s:5:\"price\";s:1:\"0\";s:11:\"description\";s:25:\"Refunded ₦0 MTN Airtime\";s:10:order_date\";s:19:\"2023-06-14 09:18:03\";}', '2023-06-14 08:18:07', '2023-06-14 08:18:07'),
(19, 'credit', 'Refunded ₦0 MTN Airtime', 'a:8:{s:4:\"name\";s:22:\"TOMIWA KUNLE OLUWADARE\";s:5:\"email\";s:19:\"cafeat9ja@gmail.com\";s:5:\"title\";s:47:\"[Debit Transaction] Thank you for your purchase\";s:7:\"balance\";d:3898.4;s:9:\"reference\";s:7:\"5523417\";s:5:\"price\";s:1:\"0\";s:11:\"description\";s:25:\"Refunded ₦0 MTN Airtime\";s:10:order_date\";s:19:\"2023-06-14 09:19:04\";}', '2023-06-14 08:19:08', '2023-06-14 08:19:08'),
(20, 'credit', 'Refunded ₦0 MTN Airtime', 'a:8:{s:4:\"name\";s:22:\"TOMIWA KUNLE OLUWADARE\";s:5:\"email\";s:19:\"cafeat9ja@gmail.com\";s:5:\"title\";s:47:\"[Debit Transaction] Thank you for your purchase\";s:7:\"balance\";d:3898.4;s:9:\"reference\";s:7:\"5523417\";s:5:\"price\";s:1:\"0\";s:11:\"description\";s:25:\"Refunded ₦0 MTN Airtime\";s:10:order_date\";s:19:\"2023-06-14 09:20:03\";}', '2023-06-14 08:20:07', '2023-06-14 08:20:07'),
(21, 'credit', 'Refunded ₦0 MTN Airtime', 'a:8:{s:4:\"name\";s:22:\"TOMIWA KUNLE OLUWADARE\";s:5:\"email\";s:19:\"cafeat9ja@gmail.com\";s:5:\"title\";s:47:\"[Debit Transaction] Thank you for your purchase\";s:7:\"balance\";d:3898.4;s:9:\"reference\";s:7:\"5523417\";s:5:\"price\";s:1:\"0\";s:11:\"description\";s:25:\"Refunded ₦0 MTN Airtime\";s:10:order_date\";s:19:\"2023-06-14 09:21:03\";}', '2023-06-14 08:21:07', '2023-06-14 08:21:07'),
(22, 'credit', 'Refunded ₦0 MTN Airtime', 'a:8:{s:4:\"name\";s:22:\"TOMIWA KUNLE OLUWADARE\";s:5:\"email\";s:19:\"cafeat9ja@gmail.com\";s:5:\"title\";s:47:\"[Debit Transaction] Thank you for your purchase\";s:7:\"balance\";d:3898.4;s:9:\"reference\";s:7:\"5523417\";s:5:\"price\";s:1:\"0\";s:11:\"description\";s:25:\"Refunded ₦0 MTN Airtime\";s:10:order_date\";s:19:\"2023-06-14 09:22:03\";}', '2023-06-14 08:22:06', '2023-06-14 08:22:06'),
(23, 'credit', 'Refunded ₦0 MTN Airtime', 'a:8:{s:4:\"name\";s:22:\"TOMIWA KUNLE OLUWADARE\";s:5:\"email\";s:19:\"cafeat9ja@gmail.com\";s:5:\"title\";s:47:\"[Debit Transaction] Thank you for your purchase\";s:7:\"balance\";d:3898.4;s:9:\"reference\";s:7:\"5523417\";s:5:\"price\";s:1:\"0\";s:11:\"description\";s:25:\"Refunded ₦0 MTN Airtime\";s:10:order_date\";s:19:\"2023-06-14 09:23:03\";}', '2023-06-14 08:23:07', '2023-06-14 08:23:07'),
(24, 'debit', '₦0 MTN Airtime', 'a:8:{s:4:\"name\";s:22:\"TOMIWA KUNLE OLUWADARE\";s:5:\"email\";s:19:\"cafeat9ja@gmail.com\";s:5:\"title\";s:47:\"[Debit Transaction] Thank you for your purchase\";s:7:\"balance\";d:3898.4;s:9:\"reference\";s:13:\"SUB1929969443\";s:5:\"price\";s:1:\"0\";s:11:\"description\";s:16:\"₦0 MTN Airtime\";s:10:order_date\";s:19:\"2023-06-14 09:38:47\";}', '2023-06-14 08:38:52', '2023-06-14 08:38:52'),
(25, 'credit', 'Refunded ₦0 MTN Airtime', 'a:8:{s:4:\"name\";s:22:\"TOMIWA KUNLE OLUWADARE\";s:5:\"email\";s:19:\"cafeat9ja@gmail.com\";s:5:\"title\";s:47:\"[Debit Transaction] Thank you for your purchase\";s:7:\"balance\";d:3898.2000000000003;s:9:\"reference\";s:7:\"5523619\";s:5:\"price\";s:1:\"0\";s:11:\"description\";s:25:\"Refunded ₦0 MTN Airtime\";s:10:order_date\";s:19:\"2023-06-14 09:39:03\";}', '2023-06-14 08:39:07', '2023-06-14 08:39:07'),
(26, 'credit', 'Refunded ₦0 MTN Airtime', 'a:8:{s:4:\"name\";s:22:\"TOMIWA KUNLE OLUWADARE\";s:5:\"email\";s:19:\"cafeat9ja@gmail.com\";s:5:\"title\";s:47:\"[Debit Transaction] Thank you for your purchase\";s:7:\"balance\";d:3898;s:9:\"reference\";s:7:\"5523619\";s:5:\"price\";s:1:\"0\";s:11:\"description\";s:25:\"Refunded ₦0 MTN Airtime\";s:10:order_date\";s:19:\"2023-06-14 09:40:03\";}', '2023-06-14 08:40:07', '2023-06-14 08:40:07'),
(27, 'credit', 'Refunded ₦0 MTN Airtime', 'a:8:{s:4:\"name\";s:22:\"TOMIWA KUNLE OLUWADARE\";s:5:\"email\";s:19:\"cafeat9ja@gmail.com\";s:5:\"title\";s:47:\"[Debit Transaction] Thank you for your purchase\";s:7:\"balance\";d:3897.8;s:9:\"reference\";s:7:\"5523619\";s:5:\"price\";s:1:\"0\";s:11:\"description\";s:25:\"Refunded ₦0 MTN Airtime\";s:10:order_date\";s:19:\"2023-06-14 09:41:03\";}', '2023-06-14 08:41:07', '2023-06-14 08:41:07'),
(28, 'credit', 'Refunded ₦0 MTN Airtime', 'a:8:{s:4:\"name\";s:22:\"TOMIWA KUNLE OLUWADARE\";s:5:\"email\";s:19:\"cafeat9ja@gmail.com\";s:5:\"title\";s:47:\"[Debit Transaction] Thank you for your purchase\";s:7:\"balance\";d:3897.6000000000004;s:9:\"reference\";s:7:\"5523619\";s:5:\"price\";s:1:\"0\";s:11:\"description\";s:25:\"Refunded ₦0 MTN Airtime\";s:10:order_date\";s:19:\"2023-06-14 09:42:03\";}', '2023-06-14 08:42:07', '2023-06-14 08:42:07'),
(29, 'credit', 'Refunded ₦0 MTN Airtime', 'a:8:{s:4:\"name\";s:22:\"TOMIWA KUNLE OLUWADARE\";s:5:\"email\";s:19:\"cafeat9ja@gmail.com\";s:5:\"title\";s:47:\"[Debit Transaction] Thank you for your purchase\";s:7:\"balance\";d:3897.4;s:9:\"reference\";s:7:\"5523619\";s:5:\"price\";s:1:\"0\";s:11:\"description\";s:25:\"Refunded ₦0 MTN Airtime\";s:10:order_date\";s:19:\"2023-06-14 09:43:04\";}', '2023-06-14 08:43:09', '2023-06-14 08:43:09'),
(30, 'debit', '₦16 MTN Corporate Data 50MB', 'a:8:{s:4:\"name\";s:22:\"TOMIWA KUNLE OLUWADARE\";s:5:\"email\";s:19:\"cafeat9ja@gmail.com\";s:5:\"title\";s:47:\"[Debit Transaction] Thank you for your purchase\";s:7:\"balance\";d:3881.4;s:9:\"reference\";s:12:\"SUB815668415\";s:5:\"price\";s:2:\"16\";s:11:\"description\";s:29:\"₦16 MTN Corporate Data 50MB\";s:10:order_date\";s:19:\"2023-06-14 12:18:08\";}', '2023-06-14 11:18:12', '2023-06-14 11:18:12');

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
(7, 10, 'Wema bank', 'Rem', '5000390667', 'REMIL1686661296', '2023-06-13 12:01:38', '2023-06-13 12:01:38');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(191) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
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

INSERT INTO `categories` (`id`, `meta_title`, `meta_keyword`, `meta_description`, `slug`, `api_slug`, `name`, `description`, `image`, `status`, `created_at`, `updated_at`) VALUES
(5, 'Airtime Purchase', 'null', 'null', 'airtime', 'airtime', 'Airtime', 'null', 'uploads/categories/1686016177.svg', 1, '2023-06-05 17:01:15', '2023-06-06 00:49:37'),
(6, 'Data Purchase', 'null', 'null', 'data', 'datashare', 'Data', 'null', 'uploads/categories/1686016240.jpg', 1, '2023-06-06 00:50:40', '2023-06-06 01:43:10'),
(7, 'Bill Payment', '', '', 'bill', 'tv', 'Bill Payment', '', 'uploads/categories/1686049956.jpg', 1, '2023-06-06 10:12:36', '2023-06-06 10:12:36'),
(8, 'Electricity Bill', '', '', 'electricity', 'electric', 'Electricity Bill', '', 'uploads/categories/1686049982.jpg', 1, '2023-06-06 10:13:02', '2023-06-06 10:13:02');

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
(1, 'Basic', 1, 0, 1, '0000-00-00 00:00:00', '2023-06-13 08:02:58'),
(2, 'Agent', 2, 2, 1, '0000-00-00 00:00:00', '2023-06-13 07:56:10');

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
(53, '2023_06_11_110845_create_api_table', 9);

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
(86, 'cafeat9ja3@gmail.com', '94977', '2024-02-25 13:29:03', '2024-02-25 13:29:03');

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
(57, 'App\\Models\\User', 1, 'cafeat9ja@gmail.com_Token', '1c908a184043e90cd77513257aa372ae54d779c0d1446e72d96032659a7307de', '[\"client:user\"]', '2024-02-25 13:46:23', '2024-02-25 13:34:33', '2024-02-25 13:46:23');

-- --------------------------------------------------------

--
-- Table structure for table `pin_resets`
--

CREATE TABLE `pin_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) NOT NULL,
  `token` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pin_resets`
--

INSERT INTO `pin_resets` (`id`, `email`, `token`, `created_at`, `updated_at`) VALUES
(1, 'cafeat9ja@gmail.com', 21436, '2023-06-09 13:41:44', '2023-06-09 13:41:44'),
(7, 'cafeat9ja@gmail.com', 65775, '2023-06-09 13:57:11', '2023-06-09 13:57:11'),
(8, 'cafeat9ja@gmail.com', 66265, '2023-06-09 14:12:53', '2023-06-09 14:12:53'),
(9, 'cafeat9ja@gmail.com', 51390, '2024-02-25 09:44:28', '2024-02-25 09:44:28');

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
(1, 5, 'mtn_custom', 'MTN Airtime', 3.30, 0.00, 'MTN Airtime', 'uploads/products/1686017821.png', 1, '2023-06-06 01:17:01', '2023-06-13 07:44:28'),
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
(1, 5, 'DATA SHARE 1GB', '', 220.00, 'data_share_1gb', 1, '2023-06-06 09:25:53', '2023-06-13 03:24:20'),
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
(69, 1, 'debit', 6, 6, 40, 16.00, '₦16 MTN Corporate Data 50MB', 'SUB815668415', '5524764', 'success', '2023-06-14 11:18:12', '2023-06-14 11:18:12');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `pin` varchar(191) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `access_token` varchar(50) DEFAULT NULL,
  `role_as` int(1) NOT NULL DEFAULT 0,
  `level` int(1) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1,
  `balance` decimal(10,2) DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `pin`, `remember_token`, `access_token`, `role_as`, `level`, `status`, `balance`, `created_at`, `updated_at`) VALUES
(1, 'TOMIWA KUNLE OLUWADARE', 'cafeat9ja@gmail.com', '0000-00-00 00:00:00', '$2y$10$TLmZs67yBHt4DuwQDAD9eOh3FB4fyudpWH.8AR45ai98/YAig7ZYW', '1111', '', '57|PqZQezgI5UJzkclWnbpIIh7xFePq6IghIPjJk7ZW', 0, 1, 1, 3881.40, '2023-06-05 14:50:13', '2024-02-25 13:34:33'),
(2, 'ADMIN ACCOUNT', 'admin@gmail.com', '0000-00-00 00:00:00', '$2y$10$ql3JV963ShkxCSoVMz74e.F3GFYeFZZESfCsle7WXTCEEStkGEPc2', '', '', '53|PIEAUabmuK7sSFZ9Ys5vPyyykAIvwHrnlXVpV4Ll', 1, 1, 1, 227.00, '2023-06-05 16:05:00', '2024-02-25 09:35:00'),
(3, 'Ayeni Ajayi', 'oluwadartomiwa@gmail.com', '0000-00-00 00:00:00', '$2y$10$A6KX7Q1XMRagU2MGsYeeWu7qqBhazEjJsN5on2M/nHJ5j2sk/WujC', '1234', '', '', 0, 1, 1, 0.00, '2023-06-08 16:26:54', '2023-06-08 16:29:41'),
(4, 'SME Data', 'oluwadaretomiwa@gmail.co', '0000-00-00 00:00:00', '$2y$10$H02aDYwvlcPHX0qmPPnxp.7CTkvaDYlDem19hrf5tjELitCtRsDLa', '', '', '', 0, 1, 1, 0.00, '2023-06-10 08:41:38', '2023-06-10 08:41:38'),
(9, 'Electricity Bill', 'admin2@gmail.com', '0000-00-00 00:00:00', '$2y$10$ar8Uc5TLkghvidt862tczuVSrH6NCwi21qosj7l4VM05gRQvoXPZy', '', '', '', 0, 1, 1, 10.00, '2023-06-11 04:57:26', '2023-06-12 04:56:22'),
(16, 'TOMIWA KUNLE OLUWADARE', 'cafeat9ja2@gmail.com', NULL, '$2y$10$dO.nsfmajO.Y2lzbzQhVoOynv.XmskhfgUGAvxcLkgsJ00qsM9fou', NULL, NULL, NULL, 0, 1, 1, 0.00, '2024-02-25 13:27:35', '2024-02-25 13:27:35'),
(17, '-', 'cafeat9ja3@gmail.com', NULL, '$2y$10$MmUVjlFxe3Wf8DZNTg8CduPRHaRx5hCjL6hC.pDgsTi8F4EO7JYGa', NULL, NULL, NULL, 0, 1, 1, 0.00, '2024-02-25 13:29:13', '2024-02-25 13:29:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api`
--
ALTER TABLE `api`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `level` (`level`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pin_resets`
--
ALTER TABLE `pin_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `api`
--
ALTER TABLE `api`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `pin_resets`
--
ALTER TABLE `pin_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
