-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2023 at 11:31 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quanlykhohang`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(2, 'Điện Thoại Di Động', 1, 1, 1, '2023-03-07 20:16:23', '2023-03-07 20:16:30'),
(3, 'Đồng Hồ', 1, 1, NULL, '2023-03-07 20:16:56', NULL),
(4, 'Loa', 1, 1, NULL, '2023-03-07 20:17:04', NULL),
(5, 'Máy Tính Bảng', 1, 1, NULL, '2023-03-07 20:17:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `customer_image` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `customer_image`, `mobile_no`, `email`, `address`, `status`, `created_by`, `update_by`, `created_at`, `updated_at`) VALUES
(2, 'Nguyễn Tuấn Hiệp', 'upload/customer/1759695587307369.jpg', '0338800449', 'superkadic@gmail.com', 'Hà Nội', 1, 1, NULL, '2023-03-07 01:08:06', NULL),
(3, 'Nguyễn Tuấn Hiệp', 'upload/customer/1759695971119787.jpg', '123', 'hiep.nguyen2@monstar-lab.com', 'Thái Bình', 1, 1, NULL, '2023-03-07 01:14:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_no` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=Pending, 1=Approved',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_no`, `date`, `description`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(6, '1', '2023-03-14', 'no name', 0, 1, NULL, '2023-03-14 00:56:04', '2023-03-14 00:56:04'),
(7, '2', '2023-03-14', NULL, 1, 1, 1, '2023-03-14 01:18:28', '2023-03-14 01:18:39'),
(8, '3', '2023-03-14', NULL, 0, 1, NULL, '2023-03-14 01:42:06', '2023-03-14 01:42:06'),
(9, '3', '2023-03-14', NULL, 0, 1, NULL, '2023-03-14 01:42:23', '2023-03-14 01:42:23'),
(10, '3', '2023-03-14', NULL, 0, 1, NULL, '2023-03-14 01:42:28', '2023-03-14 01:42:28'),
(11, '4', '2023-03-14', NULL, 0, 1, NULL, '2023-03-14 01:42:54', '2023-03-14 01:42:54'),
(12, '5', '2023-03-14', NULL, 0, 1, NULL, '2023-03-14 01:49:52', '2023-03-14 01:49:52'),
(13, '6', '2023-03-14', NULL, 0, 1, NULL, '2023-03-14 02:33:43', '2023-03-14 02:33:43'),
(14, '6', '2023-03-14', 'ádasdasd', 0, 1, NULL, '2023-03-14 02:38:04', '2023-03-14 02:38:04');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_details`
--

CREATE TABLE `invoice_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `selling_qty` double DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  `selling_price` double DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_details`
--

INSERT INTO `invoice_details` (`id`, `date`, `invoice_id`, `category_id`, `product_id`, `selling_qty`, `unit_price`, `selling_price`, `status`, `created_at`, `updated_at`) VALUES
(6, '2023-03-14', 6, 2, 2, 2, 12, 24, 0, '2023-03-14 00:56:04', '2023-03-14 00:56:04'),
(7, '2023-03-14', 7, 2, 2, 2, 10, 20, 1, '2023-03-14 01:18:28', '2023-03-14 01:18:39'),
(8, '2023-03-14', 8, 2, 2, 22, 40, 880, 0, '2023-03-14 01:42:06', '2023-03-14 01:42:06'),
(9, '2023-03-14', 9, 2, 2, 22, 40, 880, 0, '2023-03-14 01:42:23', '2023-03-14 01:42:23'),
(10, '2023-03-14', 10, 2, 2, 22, 40, 880, 0, '2023-03-14 01:42:28', '2023-03-14 01:42:28'),
(11, '2023-03-14', 11, 2, 2, 2, 50, 100, 0, '2023-03-14 01:42:54', '2023-03-14 01:42:54'),
(12, '2023-03-14', 12, 2, 2, 2, 50, 100, 0, '2023-03-14 01:49:52', '2023-03-14 01:49:52'),
(13, '2023-03-14', 13, 2, 2, 1, 50, 50, 0, '2023-03-14 02:33:43', '2023-03-14 02:33:43'),
(14, '2023-03-14', 14, 2, 2, 1, 50, 50, 0, '2023-03-14 02:38:04', '2023-03-14 02:38:04'),
(15, '2023-03-14', 14, 2, 2, 2, 10, 20, 0, '2023-03-14 02:38:04', '2023-03-14 02:38:04');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(12, '2014_10_12_000000_create_users_table', 1),
(13, '2014_10_12_100000_create_password_resets_table', 1),
(14, '2019_08_19_000000_create_failed_jobs_table', 1),
(15, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(16, '2023_03_06_063419_create_suppliers_table', 1),
(17, '2023_03_07_022735_create_customers_table', 1),
(18, '2023_03_07_085229_create_units_table', 2),
(19, '2023_03_07_093654_create_categories_table', 3),
(20, '2023_03_08_023821_create_products_table', 4),
(21, '2023_03_08_161810_create_purchases_table', 5),
(22, '2023_03_10_093304_create_invoices_table', 6),
(23, '2023_03_10_093424_create_invoice_details_table', 6),
(24, '2023_03_13_071504_create_payments_table', 6),
(25, '2023_03_13_071522_create_payment_details_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `paid_status` varchar(51) DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `due_amount` double DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `discount_amount` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `invoice_id`, `customer_id`, `paid_status`, `paid_amount`, `due_amount`, `total_amount`, `discount_amount`, `created_at`, `updated_at`) VALUES
(6, 6, 2, 'full_paid', 24, 0, 24, NULL, '2023-03-14 00:56:04', '2023-03-14 00:56:04'),
(7, 7, 2, 'full_paid', 20, 0, 20, 0, '2023-03-14 01:18:28', '2023-03-14 01:18:28'),
(8, 8, NULL, NULL, NULL, NULL, 880, NULL, '2023-03-14 01:42:06', '2023-03-14 01:42:06'),
(9, 9, NULL, 'full_paid', 880, 0, 880, NULL, '2023-03-14 01:42:23', '2023-03-14 01:42:23'),
(10, 10, 2, 'full_paid', 880, 0, 880, NULL, '2023-03-14 01:42:28', '2023-03-14 01:42:28'),
(11, 11, 2, 'full_paid', 100, 0, 100, NULL, '2023-03-14 01:42:54', '2023-03-14 01:42:54'),
(12, 12, 2, 'full_paid', 100, 0, 100, NULL, '2023-03-14 01:49:52', '2023-03-14 01:49:52'),
(13, 13, 2, 'full_paid', 50, 0, 50, NULL, '2023-03-14 02:33:43', '2023-03-14 02:33:43'),
(14, 14, 3, 'full_paid', 70, 0, 70, NULL, '2023-03-14 02:38:04', '2023-03-14 02:38:04');

-- --------------------------------------------------------

--
-- Table structure for table `payment_details`
--

CREATE TABLE `payment_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `current_paid_amount` double DEFAULT NULL,
  `date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_details`
--

INSERT INTO `payment_details` (`id`, `invoice_id`, `current_paid_amount`, `date`, `updated_by`, `created_at`, `updated_at`) VALUES
(6, 6, 24, '2023-03-14', NULL, '2023-03-14 00:56:04', '2023-03-14 00:56:04'),
(7, 7, 20, '2023-03-14', NULL, '2023-03-14 01:18:28', '2023-03-14 01:18:28'),
(8, 8, NULL, '2023-03-14', NULL, '2023-03-14 01:42:06', '2023-03-14 01:42:06'),
(9, 9, 880, '2023-03-14', NULL, '2023-03-14 01:42:23', '2023-03-14 01:42:23'),
(10, 10, 880, '2023-03-14', NULL, '2023-03-14 01:42:28', '2023-03-14 01:42:28'),
(11, 11, 100, '2023-03-14', NULL, '2023-03-14 01:42:54', '2023-03-14 01:42:54'),
(12, 12, 100, '2023-03-14', NULL, '2023-03-14 01:49:52', '2023-03-14 01:49:52'),
(13, 13, 50, '2023-03-14', NULL, '2023-03-14 02:33:43', '2023-03-14 02:33:43'),
(14, 14, 70, '2023-03-14', NULL, '2023-03-14 02:38:04', '2023-03-14 02:38:04');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `quantity` double NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `supplier_id`, `unit_id`, `category_id`, `name`, `quantity`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(2, 3, 3, 2, 'Iphone 13 ProMax', 106, 1, 1, NULL, '2023-03-08 00:08:42', '2023-03-14 01:18:39'),
(3, 3, 3, 2, 'Iphone 14 ProMax', 0, 1, 1, NULL, '2023-03-08 00:09:19', '2023-03-14 00:11:01'),
(4, 4, 3, 5, 'Samsung A232', 0, 1, 1, 1, '2023-03-08 00:09:31', '2023-03-08 00:57:09'),
(5, 3, 3, 3, 'Apple Watch Series 8 GPS', 0, 1, 1, NULL, '2023-03-08 20:39:19', '2023-03-14 00:23:01'),
(6, 3, 3, 3, 'Apple Watch Series 8 GPS 45mm', 0, 1, 1, NULL, '2023-03-08 20:39:42', NULL),
(7, 3, 3, 4, 'Apple HomePod Mini (Space Gray)', 0, 1, 1, NULL, '2023-03-08 20:40:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `purchase_no` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `buying_qty` double NOT NULL,
  `unit_price` double NOT NULL,
  `buying_price` double NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=Pending, 1=Approved',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `supplier_id`, `category_id`, `product_id`, `purchase_no`, `date`, `description`, `buying_qty`, `unit_price`, `buying_price`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(3, 4, 5, 4, '103101', '2023-03-10', NULL, 1, 15000000, 15000000, 0, 1, NULL, '2023-03-09 10:44:23', '2023-03-09 10:44:23'),
(6, 3, 2, 2, '103184', '2023-03-11', NULL, 1, 23000000, 23000000, 0, 1, NULL, '2023-03-09 10:47:11', '2023-03-09 10:47:11'),
(7, 3, 3, 5, '13312331', '2023-03-15', NULL, 1, 4, 4, 0, 1, NULL, '2023-03-09 10:47:30', '2023-03-09 10:47:30'),
(8, 3, 3, 5, '13312331', '2023-03-15', NULL, 1, 4, 4, 0, 1, NULL, '2023-03-09 10:47:55', '2023-03-09 10:47:55'),
(9, 3, 3, 5, '13312331', '2023-03-15', NULL, 1, 4, 4, 0, 1, NULL, '2023-03-09 10:48:02', '2023-03-09 10:48:02'),
(10, 3, 3, 5, '13312331', '2023-03-15', NULL, 1, 4, 4, 0, 1, NULL, '2023-03-09 10:48:07', '2023-03-09 10:48:07'),
(11, 3, 3, 5, '13312331', '2023-03-15', NULL, 1, 4, 4, 0, 1, NULL, '2023-03-09 10:48:11', '2023-03-09 10:48:11'),
(12, 3, 3, 5, '13312331', '2023-03-15', NULL, 1, 4, 4, 0, 1, NULL, '2023-03-09 10:48:15', '2023-03-09 10:48:15'),
(14, 3, 3, 5, '13312331', '2023-03-15', NULL, 1, 4, 4, 1, 1, NULL, '2023-03-09 10:48:25', '2023-03-09 23:37:41'),
(15, 3, 3, 5, '13312331', '2023-03-15', NULL, 1, 4, 4, 1, 1, NULL, '2023-03-09 10:48:29', '2023-03-09 10:48:58'),
(17, 3, 3, 5, '13312331', '2023-03-15', NULL, 1, 4, 4, 1, 1, NULL, '2023-03-09 10:48:40', '2023-03-09 10:48:48'),
(18, 4, 5, 4, '103123', '2023-03-11', NULL, 2, 15000, 30000, 0, 1, NULL, '2023-03-09 23:29:35', '2023-03-09 23:29:35'),
(19, 3, 2, 3, '123', '2023-03-10', NULL, 1, 200000, 200000, 0, 1, NULL, '2023-03-09 23:35:20', '2023-03-09 23:35:20');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `customer_image` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `customer_image`, `mobile_no`, `email`, `address`, `status`, `created_by`, `update_by`, `created_at`, `updated_at`) VALUES
(3, 'Apple', NULL, '0338800449', 'apple@youngboycodon.com', 'Hà Nội', 1, 1, NULL, '2023-03-07 20:11:56', NULL),
(4, 'Samsung', NULL, '12467823452', 'samsung@youngboycodon.com', 'Nam Định', 1, 1, NULL, '2023-03-07 20:12:13', NULL),
(5, 'Oppo', NULL, '03388004432', 'oppo@youngboycodon.com', 'Thái Bình', 1, 1, NULL, '2023-03-07 20:12:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(3, 'Chiếc', 1, 1, NULL, '2023-03-07 20:12:53', NULL),
(4, 'Lô', 1, 1, NULL, '2023-03-07 20:12:59', NULL),
(5, 'Thùng', 1, 1, NULL, '2023-03-07 20:13:07', NULL),
(6, 'Kg', 1, 1, NULL, '2023-03-07 20:13:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Nguyễn Tuấn Hiệp', 'superkadic@gmail.com', 'hieptn102', NULL, '$2y$10$Ou9sKoMDnsFV232hs/5CLO21Wcuc1kto8YY9A9OErR.hEFNDp3DM2', NULL, '2023-03-06 21:30:38', '2023-03-06 21:30:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `invoice_details`
--
ALTER TABLE `invoice_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `payment_details`
--
ALTER TABLE `payment_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
