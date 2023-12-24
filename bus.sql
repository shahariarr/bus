-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 24, 2023 at 05:44 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bus`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Dhaka', NULL, NULL),
(2, 'Chittagong', NULL, NULL),
(3, 'Cumilla', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_12_23_123804_create_locations_table', 1),
(6, '2023_12_23_123830_create_trips_table', 1),
(7, '2023_12_23_123844_create_seat_allocations_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seat_allocations`
--

CREATE TABLE `seat_allocations` (
  `id` bigint UNSIGNED NOT NULL,
  `seats` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seat_allocations`
--

INSERT INTO `seat_allocations` (`id`, `seats`, `created_at`, `updated_at`) VALUES
(1, '[\"0\"]', '2023-12-23 08:05:37', '2023-12-23 09:02:33');

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

CREATE TABLE `trips` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trips`
--

INSERT INTO `trips` (`id`, `name`, `mobile`, `from`, `to`, `date`, `created_at`, `updated_at`) VALUES
(1, 'A', 'B', 'Dhaka', 'Chittagong', '2023-12-27', '2023-12-23 08:05:37', '2023-12-23 08:05:37'),
(2, 'A', 'B', 'Dhaka', 'Chittagong', '2023-12-27', '2023-12-23 08:08:26', '2023-12-23 08:08:26'),
(3, 'A', 'B', 'Dhaka', 'Cumilla', '2023-12-26', '2023-12-23 08:09:04', '2023-12-23 08:09:04'),
(4, 'A', 'B', 'Dhaka', 'Cumilla', '2023-12-26', '2023-12-23 08:09:44', '2023-12-23 08:09:44'),
(5, 'R', 'A', 'Dhaka', 'Chittagong', '2023-12-27', '2023-12-23 08:10:16', '2023-12-23 08:10:16'),
(6, 'A', 'B', 'Dhaka', 'Chittagong', '2023-12-29', '2023-12-23 08:39:17', '2023-12-23 08:39:17'),
(7, 'arif', 'B', 'Dhaka', 'Dhaka', '2023-12-25', '2023-12-23 08:40:43', '2023-12-23 08:40:43'),
(8, 'A', 'B', 'Dhaka', 'Dhaka', '2023-12-26', '2023-12-23 08:43:26', '2023-12-23 08:43:26'),
(9, 'arif', 'V', 'Dhaka', 'Cumilla', '2023-12-26', '2023-12-23 08:43:44', '2023-12-23 08:43:44'),
(10, 'aE', 'aZ', 'Dhaka', 'Dhaka', '2023-12-26', '2023-12-23 08:50:59', '2023-12-23 08:50:59'),
(11, 'tEST', 'tEST', 'Dhaka', 'Dhaka', '2023-12-26', '2023-12-23 08:51:15', '2023-12-23 08:51:15'),
(12, 'a', 'e', 'Dhaka', 'Dhaka', '2023-12-14', '2023-12-23 08:53:11', '2023-12-23 08:53:11'),
(13, 'w', 'q', 'Dhaka', 'Dhaka', '2023-12-26', '2023-12-23 08:53:33', '2023-12-23 08:53:33'),
(14, 'y', 't', 'Dhaka', 'Dhaka', '2023-12-26', '2023-12-23 08:54:40', '2023-12-23 08:54:40'),
(15, 'a', 't', 'Dhaka', 'Dhaka', '2023-12-26', '2023-12-23 08:56:11', '2023-12-23 08:56:11'),
(16, 'u', 'i', 'Dhaka', 'Dhaka', '2023-12-27', '2023-12-23 08:56:25', '2023-12-23 08:56:25'),
(17, 'aE', 'D', 'Dhaka', 'Dhaka', '2023-12-26', '2023-12-23 08:57:39', '2023-12-23 08:57:39'),
(18, 'R', 'U', 'Dhaka', 'Dhaka', '2023-12-19', '2023-12-23 08:57:56', '2023-12-23 08:57:56'),
(19, 'R', 'Y', 'Dhaka', 'Dhaka', '2023-12-28', '2023-12-23 08:58:10', '2023-12-23 08:58:10'),
(20, 'Teset', '22155', 'Dhaka', 'Chittagong', '2023-12-23', '2023-12-23 09:00:02', '2023-12-23 09:00:02'),
(21, 'shifat', '012487784555', 'Cumilla', 'Dhaka', '2023-12-25', '2023-12-23 09:00:50', '2023-12-23 09:00:50'),
(22, 'shuifat', '5644', 'Chittagong', 'Cumilla', '2023-12-25', '2023-12-23 09:02:33', '2023-12-23 09:02:33');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `seat_allocations`
--
ALTER TABLE `seat_allocations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trips`
--
ALTER TABLE `trips`
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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seat_allocations`
--
ALTER TABLE `seat_allocations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `trips`
--
ALTER TABLE `trips`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
