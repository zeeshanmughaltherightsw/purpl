-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2022 at 06:28 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prpal`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `is_required` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `group`, `type`, `key`, `name`, `value`, `status`, `is_required`, `created_at`, `updated_at`) VALUES
(1, 'site_info', 'text', 'site_name', 'Site name', 'AAM Earning', 'active', NULL, '2022-11-14 16:50:05', NULL),
(2, 'site_info', 'text', 'site_phone', 'Site phone', '+923001309060', 'active', NULL, '2022-11-14 16:50:05', NULL),
(3, 'site_info', 'email', 'site_email', 'Site email', 'Contact@aamclick.com', 'active', NULL, '2022-11-14 16:50:05', NULL),
(4, 'site_info', 'text', 'system_info', 'System info', '[]', 'active', NULL, '2022-11-14 16:50:05', NULL),
(5, 'currency_setting', 'text', 'cur_text', 'Currency Text', 'USD', 'active', NULL, '2022-11-14 16:50:05', NULL),
(6, 'currency_setting', 'text', 'cur_sym', 'Currency symbol', '$', 'active', NULL, '2022-11-14 16:50:05', NULL),
(7, 'color', 'text', 'base_color', 'Base Color', '0099ff', 'active', NULL, '2022-11-14 16:50:05', NULL),
(8, 'color', 'text', 'secondary_color', 'Secondary color', '001d4a', 'active', NULL, '2022-11-14 16:50:05', NULL),
(9, 'force_ssl', 'checkbox', 'force_ssl', 'force SSL', '1', 'active', NULL, '2022-11-14 16:50:05', NULL),
(10, 'maintainance_mode', 'checkbox', 'maintainance_mode', 'Maintanance mode', '0', 'active', NULL, '2022-11-14 16:50:05', NULL),
(11, 'auth', 'text', 'registration', 'Registration', '1', 'active', NULL, '2022-11-14 16:50:05', NULL),
(12, 'template', 'text', 'active_template', 'Active template', 'coinjet', 'active', NULL, '2022-11-14 16:50:05', NULL),
(13, 'commission', 'number', 'deposit_commission', 'Deposit commission', '1', 'active', NULL, '2022-11-14 16:50:05', NULL),
(14, 'commission', 'number', 'plan_subscribe_commission', 'Plan subscribe commission', '1', 'active', NULL, '2022-11-14 16:50:05', NULL),
(15, 'bonus', 'number', 'registration_bonus', 'Registration bonus', '50', 'active', NULL, '2022-11-14 16:50:05', NULL),
(16, 'bonus', 'checkbox', 'profit_bonus', 'Profit bonus', '1', 'active', NULL, '2022-11-14 16:50:05', NULL),
(17, 'bonus', 'number', 'profit_bonus_percentage', 'Profit bonus percentage', '50', 'active', NULL, '2022-11-14 16:50:05', NULL),
(18, 'bonus', 'number', 'profit_bonus_days', 'Profit bonus days', '50', 'active', NULL, '2022-11-14 16:50:05', NULL),
(19, 'transfer', 'number', 'balance_transfer_fixed_charge', 'Balance transfer fixed charge', '2', 'active', NULL, '2022-11-14 16:50:05', NULL),
(20, 'transfer', 'number', 'balance_transfer_fixed_percentage', 'Balance transfer fixed percentage', '30', 'active', NULL, '2022-11-14 16:50:05', NULL),
(21, 'transfer', 'number', 'balance_transfer', 'Balance transfer', '1', 'active', NULL, '2022-11-14 16:50:05', NULL),
(22, 'plan', 'select', 'default_plan', 'Default plan', '1', 'active', NULL, '2022-11-14 16:50:05', NULL),
(23, 'ads', 'text', 'ad_auto_approve', 'Ads auto approve', 'middle_name', 'active', 1, '2022-11-14 16:50:05', NULL),
(24, 'ads', 'text', 'user_ads_post', 'User ads post', '0', 'active', 1, '2022-11-14 16:50:05', NULL),
(25, 'ads', 'textarea', 'ads_setting', 'Ads setting', '{\"ad_price\":{\"script\":\"0.25\",\"image\":\"0.25\",\"url\":\"0.25\",\"youtube\":\"0.25\"},\"amount_for_user\":{\"script\":\"0.15\",\"image\":\"0.15\",\"url\":\"0.15\",\"youtube\":\"0.15\"}}', 'active', NULL, '2022-11-14 16:50:05', NULL),
(26, 'verification', 'checkbox', 'email_verification', 'Email verification', '1', 'active', 1, '2022-11-14 16:50:05', NULL),
(27, 'verification', 'checkbox', 'sms_verification', 'SMS verification', '0', 'active', 1, '2022-11-14 16:50:05', NULL),
(28, 'email_notification', 'checkbox', 'active', 'Active', '1', 'active', NULL, '2022-11-14 16:50:05', NULL),
(29, 'payment', 'text', 'payment_address', 'Payment Address', '0x4E6ec31F1B774EE690Ff5fDC2Ec7F4AD371a8cAb', 'active', 1, '2022-11-14 16:50:05', NULL),
(30, 'payment', 'text', 'min_amount', 'Minimum ammount', '20', 'active', 1, '2022-11-14 16:50:05', NULL),
(31, 'email_notification', 'General', 'email_from_name', 'Email From Name', 'Aamearning', 'active', NULL, '2022-11-14 16:50:05', '2022-11-14 16:50:05'),
(32, 'email_notification', 'General', 'reply_to_name', 'Reply to Name', 'Aamearning', 'active', NULL, '2022-11-14 16:50:05', '2022-11-14 16:50:05'),
(33, 'email_notification', 'General', 'reply_to_email', 'Reply to Email', 'admin@aamearning.com', 'active', NULL, '2022-11-14 16:50:05', '2022-11-14 16:50:05'),
(34, 'email_notification', 'General', 'mail_mailer', 'Mail Mailer', 'smtp', 'active', NULL, '2022-11-14 16:50:05', '2022-11-14 16:50:05'),
(35, 'email_notification', 'General', 'mail_host', 'Mail Host', 'smtp.mailtrap.io', 'active', NULL, '2022-11-14 16:50:05', '2022-11-14 16:50:05'),
(36, 'email_notification', 'General', 'mail_port', 'Mail Port', '2525', 'active', NULL, '2022-11-14 16:50:05', '2022-11-14 16:50:05'),
(37, 'email_notification', 'General', 'mail_username', 'Mail Username', '', 'active', NULL, '2022-11-14 16:50:05', '2022-11-14 16:50:05'),
(38, 'email_notification', 'General', 'mail_password', 'Mail Password', '', 'active', NULL, '2022-11-14 16:50:05', '2022-11-14 16:50:05'),
(39, 'email_notification', 'General', 'encryption_type', 'Encryption Type', 'tls', 'active', NULL, '2022-11-14 16:50:05', '2022-11-14 16:50:05');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(71, '2014_10_12_000000_create_users_table', 1),
(72, '2014_10_12_100000_create_password_resets_table', 1),
(73, '2019_08_19_000000_create_failed_jobs_table', 1),
(74, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(75, '2022_07_30_203252_create_permission_tables', 1),
(76, '2022_07_31_104815_create_general_settings_table', 1),
(77, '2022_10_11_100135_create_transactions_table', 1),
(78, '2022_10_12_101754_create_user_logins_table', 1),
(79, '2022_10_18_064749_add_user_type_in_users_table', 1),
(80, '2022_10_20_081942_create_plans_table', 1),
(81, '2022_10_20_093104_create_referrals_table', 1),
(82, '2022_10_30_051253_create_plan_levels_table', 1),
(83, '2022_11_02_105927_create_rewards_table', 1),
(84, '2022_11_08_045808_create_media_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 201),
(2, 'App\\Models\\User', 202),
(3, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3),
(3, 'App\\Models\\User', 4),
(3, 'App\\Models\\User', 5),
(3, 'App\\Models\\User', 6),
(3, 'App\\Models\\User', 7),
(3, 'App\\Models\\User', 8),
(3, 'App\\Models\\User', 9),
(3, 'App\\Models\\User', 10),
(3, 'App\\Models\\User', 11),
(3, 'App\\Models\\User', 12),
(3, 'App\\Models\\User', 13),
(3, 'App\\Models\\User', 14),
(3, 'App\\Models\\User', 15),
(3, 'App\\Models\\User', 16),
(3, 'App\\Models\\User', 17),
(3, 'App\\Models\\User', 18),
(3, 'App\\Models\\User', 19),
(3, 'App\\Models\\User', 20),
(3, 'App\\Models\\User', 21),
(3, 'App\\Models\\User', 22),
(3, 'App\\Models\\User', 23),
(3, 'App\\Models\\User', 24),
(3, 'App\\Models\\User', 25),
(3, 'App\\Models\\User', 26),
(3, 'App\\Models\\User', 27),
(3, 'App\\Models\\User', 28),
(3, 'App\\Models\\User', 29),
(3, 'App\\Models\\User', 30),
(3, 'App\\Models\\User', 31),
(3, 'App\\Models\\User', 32),
(3, 'App\\Models\\User', 33),
(3, 'App\\Models\\User', 34),
(3, 'App\\Models\\User', 35),
(3, 'App\\Models\\User', 36),
(3, 'App\\Models\\User', 37),
(3, 'App\\Models\\User', 38),
(3, 'App\\Models\\User', 39),
(3, 'App\\Models\\User', 40),
(3, 'App\\Models\\User', 41),
(3, 'App\\Models\\User', 42),
(3, 'App\\Models\\User', 43),
(3, 'App\\Models\\User', 44),
(3, 'App\\Models\\User', 45),
(3, 'App\\Models\\User', 46),
(3, 'App\\Models\\User', 47),
(3, 'App\\Models\\User', 48),
(3, 'App\\Models\\User', 49),
(3, 'App\\Models\\User', 50),
(3, 'App\\Models\\User', 51),
(3, 'App\\Models\\User', 52),
(3, 'App\\Models\\User', 53),
(3, 'App\\Models\\User', 54),
(3, 'App\\Models\\User', 55),
(3, 'App\\Models\\User', 56),
(3, 'App\\Models\\User', 57),
(3, 'App\\Models\\User', 58),
(3, 'App\\Models\\User', 59),
(3, 'App\\Models\\User', 60),
(3, 'App\\Models\\User', 61),
(3, 'App\\Models\\User', 62),
(3, 'App\\Models\\User', 63),
(3, 'App\\Models\\User', 64),
(3, 'App\\Models\\User', 65),
(3, 'App\\Models\\User', 66),
(3, 'App\\Models\\User', 67),
(3, 'App\\Models\\User', 68),
(3, 'App\\Models\\User', 69),
(3, 'App\\Models\\User', 70),
(3, 'App\\Models\\User', 71),
(3, 'App\\Models\\User', 72),
(3, 'App\\Models\\User', 73),
(3, 'App\\Models\\User', 74),
(3, 'App\\Models\\User', 75),
(3, 'App\\Models\\User', 76),
(3, 'App\\Models\\User', 77),
(3, 'App\\Models\\User', 78),
(3, 'App\\Models\\User', 79),
(3, 'App\\Models\\User', 80),
(3, 'App\\Models\\User', 81),
(3, 'App\\Models\\User', 82),
(3, 'App\\Models\\User', 83),
(3, 'App\\Models\\User', 84),
(3, 'App\\Models\\User', 85),
(3, 'App\\Models\\User', 86),
(3, 'App\\Models\\User', 87),
(3, 'App\\Models\\User', 88),
(3, 'App\\Models\\User', 89),
(3, 'App\\Models\\User', 90),
(3, 'App\\Models\\User', 91),
(3, 'App\\Models\\User', 92),
(3, 'App\\Models\\User', 93),
(3, 'App\\Models\\User', 94),
(3, 'App\\Models\\User', 95),
(3, 'App\\Models\\User', 96),
(3, 'App\\Models\\User', 97),
(3, 'App\\Models\\User', 98),
(3, 'App\\Models\\User', 99),
(3, 'App\\Models\\User', 100),
(3, 'App\\Models\\User', 101),
(3, 'App\\Models\\User', 102),
(3, 'App\\Models\\User', 103),
(3, 'App\\Models\\User', 104),
(3, 'App\\Models\\User', 105),
(3, 'App\\Models\\User', 106),
(3, 'App\\Models\\User', 107),
(3, 'App\\Models\\User', 108),
(3, 'App\\Models\\User', 109),
(3, 'App\\Models\\User', 110),
(3, 'App\\Models\\User', 111),
(3, 'App\\Models\\User', 112),
(3, 'App\\Models\\User', 113),
(3, 'App\\Models\\User', 114),
(3, 'App\\Models\\User', 115),
(3, 'App\\Models\\User', 116),
(3, 'App\\Models\\User', 117),
(3, 'App\\Models\\User', 118),
(3, 'App\\Models\\User', 119),
(3, 'App\\Models\\User', 120),
(3, 'App\\Models\\User', 121),
(3, 'App\\Models\\User', 122),
(3, 'App\\Models\\User', 123),
(3, 'App\\Models\\User', 124),
(3, 'App\\Models\\User', 125),
(3, 'App\\Models\\User', 126),
(3, 'App\\Models\\User', 127),
(3, 'App\\Models\\User', 128),
(3, 'App\\Models\\User', 129),
(3, 'App\\Models\\User', 130),
(3, 'App\\Models\\User', 131),
(3, 'App\\Models\\User', 132),
(3, 'App\\Models\\User', 133),
(3, 'App\\Models\\User', 134),
(3, 'App\\Models\\User', 135),
(3, 'App\\Models\\User', 136),
(3, 'App\\Models\\User', 137),
(3, 'App\\Models\\User', 138),
(3, 'App\\Models\\User', 139),
(3, 'App\\Models\\User', 140),
(3, 'App\\Models\\User', 141),
(3, 'App\\Models\\User', 142),
(3, 'App\\Models\\User', 143),
(3, 'App\\Models\\User', 144),
(3, 'App\\Models\\User', 145),
(3, 'App\\Models\\User', 146),
(3, 'App\\Models\\User', 147),
(3, 'App\\Models\\User', 148),
(3, 'App\\Models\\User', 149),
(3, 'App\\Models\\User', 150),
(3, 'App\\Models\\User', 151),
(3, 'App\\Models\\User', 152),
(3, 'App\\Models\\User', 153),
(3, 'App\\Models\\User', 154),
(3, 'App\\Models\\User', 155),
(3, 'App\\Models\\User', 156),
(3, 'App\\Models\\User', 157),
(3, 'App\\Models\\User', 158),
(3, 'App\\Models\\User', 159),
(3, 'App\\Models\\User', 160),
(3, 'App\\Models\\User', 161),
(3, 'App\\Models\\User', 162),
(3, 'App\\Models\\User', 163),
(3, 'App\\Models\\User', 164),
(3, 'App\\Models\\User', 165),
(3, 'App\\Models\\User', 166),
(3, 'App\\Models\\User', 167),
(3, 'App\\Models\\User', 168),
(3, 'App\\Models\\User', 169),
(3, 'App\\Models\\User', 170),
(3, 'App\\Models\\User', 171),
(3, 'App\\Models\\User', 172),
(3, 'App\\Models\\User', 173),
(3, 'App\\Models\\User', 174),
(3, 'App\\Models\\User', 175),
(3, 'App\\Models\\User', 176),
(3, 'App\\Models\\User', 177),
(3, 'App\\Models\\User', 178),
(3, 'App\\Models\\User', 179),
(3, 'App\\Models\\User', 180),
(3, 'App\\Models\\User', 181),
(3, 'App\\Models\\User', 182),
(3, 'App\\Models\\User', 183),
(3, 'App\\Models\\User', 184),
(3, 'App\\Models\\User', 185),
(3, 'App\\Models\\User', 186),
(3, 'App\\Models\\User', 187),
(3, 'App\\Models\\User', 188),
(3, 'App\\Models\\User', 189),
(3, 'App\\Models\\User', 190),
(3, 'App\\Models\\User', 191),
(3, 'App\\Models\\User', 192),
(3, 'App\\Models\\User', 193),
(3, 'App\\Models\\User', 194),
(3, 'App\\Models\\User', 195),
(3, 'App\\Models\\User', 196),
(3, 'App\\Models\\User', 197),
(3, 'App\\Models\\User', 198),
(3, 'App\\Models\\User', 199),
(3, 'App\\Models\\User', 200),
(3, 'App\\Models\\User', 203);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `group`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'settings', 'view_settings', 'web', NULL, NULL),
(2, 'settings', 'edit_settings', 'web', NULL, NULL),
(3, 'plans', 'view_plans', 'web', NULL, NULL),
(4, 'plans', 'create_plans', 'web', NULL, NULL),
(5, 'plans', 'edit_plans', 'web', NULL, NULL),
(6, 'plans', 'delete_plans', 'web', NULL, NULL),
(7, 'permissions', 'view_permissions', 'web', NULL, NULL),
(8, 'permissions', 'edit_permissions', 'web', NULL, NULL),
(9, 'roles', 'view_roles', 'web', NULL, NULL),
(10, 'roles', 'edit_roles', 'web', NULL, NULL),
(11, 'roles', 'create_roles', 'web', NULL, NULL),
(12, 'roles', 'delete_roles', 'web', NULL, NULL),
(13, 'administrators', 'view_administrators', 'web', NULL, NULL),
(14, 'administrators', 'edit_administrators', 'web', NULL, NULL),
(15, 'administrators', 'create_administrators', 'web', NULL, NULL),
(16, 'administrators', 'delete_administrators', 'web', NULL, NULL),
(17, 'users', 'view_users', 'web', NULL, NULL),
(18, 'users', 'edit_users', 'web', NULL, NULL),
(19, 'users', 'create_users', 'web', NULL, NULL),
(20, 'users', 'delete_users', 'web', NULL, NULL),
(21, 'commission', 'view_commission', 'web', NULL, NULL),
(22, 'commission', 'edit_commission', 'web', NULL, NULL),
(23, 'commission', 'create_commission', 'web', NULL, NULL),
(24, 'commission', 'delete_commission', 'web', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_price` decimal(8,2) DEFAULT NULL,
  `max_price` decimal(8,2) DEFAULT NULL,
  `plan_type` enum('investor','referral','high_agent') COLLATE utf8mb4_unicode_ci NOT NULL,
  `profit` decimal(8,2) NOT NULL DEFAULT 0.00,
  `min_ref` int(11) DEFAULT NULL,
  `max_ref` int(11) DEFAULT NULL,
  `ref_commission` decimal(8,2) DEFAULT NULL,
  `expire` decimal(8,2) NOT NULL DEFAULT 200.00,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `name`, `min_price`, `max_price`, `plan_type`, `profit`, `min_ref`, `max_ref`, `ref_commission`, `expire`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Basic', '100.00', '499.00', 'investor', '0.50', NULL, NULL, NULL, '2.00', 0, '2022-11-14 16:50:05', '2022-11-14 16:50:05'),
(2, 'Starter', '500.00', '999.00', 'investor', '0.50', NULL, NULL, NULL, '2.00', 0, '2022-11-14 16:50:05', '2022-11-14 16:50:05'),
(3, 'Silver', '1000.00', '100000.00', 'investor', '0.50', NULL, NULL, NULL, '2.00', 0, '2022-11-14 16:50:05', '2022-11-14 16:50:05'),
(4, 'Referral Basic', '1000.00', '2000.00', 'referral', '0.50', 1, 4, '1.00', '2.00', 1, '2022-11-14 16:50:05', '2022-11-14 16:50:05'),
(5, 'Referral Starter', '1000.00', '2000.00', 'referral', '0.50', 5, 20, '2.00', '4.00', 0, '2022-11-14 16:50:05', '2022-11-14 16:50:05'),
(6, 'Referral Silver', '1000.00', '2000.00', 'referral', '0.50', 4, 30, '3.00', '4.00', 0, '2022-11-14 16:50:05', '2022-11-14 16:50:05'),
(7, 'Agent Basic', '1000.00', '2000.00', 'high_agent', '0.50', 1, 50, '4.00', '2.00', 1, '2022-11-14 16:50:05', '2022-11-14 16:50:05'),
(8, 'Agent Starter', '1000.00', '2000.00', 'high_agent', '0.50', 50, 100, '5.00', '2.00', 0, '2022-11-14 16:50:05', '2022-11-14 16:50:05'),
(9, 'Agent Silver', '1000.00', '2000.00', 'high_agent', '0.50', 100, 400, '6.00', '2.00', 0, '2022-11-14 16:50:05', '2022-11-14 16:50:05');

-- --------------------------------------------------------

--
-- Table structure for table `plan_levels`
--

CREATE TABLE `plan_levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `plan_id` bigint(20) UNSIGNED NOT NULL,
  `key` enum('referral') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'referral',
  `level` int(11) DEFAULT NULL,
  `commission` decimal(8,2) NOT NULL DEFAULT 0.00 COMMENT '%',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plan_levels`
--

INSERT INTO `plan_levels` (`id`, `plan_id`, `key`, `level`, `commission`, `created_at`, `updated_at`) VALUES
(1, 4, 'referral', 1, '5.00', NULL, NULL),
(2, 4, 'referral', 2, '2.00', NULL, NULL),
(3, 4, 'referral', 3, '1.00', NULL, NULL),
(4, 4, 'referral', 4, '1.00', NULL, NULL),
(5, 4, 'referral', 5, '1.00', NULL, NULL),
(6, 4, 'referral', 6, '0.50', NULL, NULL),
(7, 4, 'referral', 7, '0.50', NULL, NULL),
(8, 4, 'referral', 8, '0.50', NULL, NULL),
(9, 4, 'referral', 9, '0.25', NULL, NULL),
(10, 4, 'referral', 10, '0.25', NULL, NULL),
(11, 4, 'referral', 11, '0.25', NULL, NULL),
(12, 4, 'referral', 12, '0.25', NULL, NULL),
(13, 4, 'referral', 13, '0.25', NULL, NULL),
(14, 4, 'referral', 14, '0.25', NULL, NULL),
(15, 4, 'referral', 15, '0.25', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `referrals` int(11) DEFAULT NULL,
  `percent` decimal(8,2) DEFAULT NULL,
  `amount_returns` int(11) DEFAULT NULL,
  `commission_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `investing_amount` decimal(8,2) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rewards`
--

CREATE TABLE `rewards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_investment` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `amount` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rewards`
--

INSERT INTO `rewards` (`id`, `name`, `total_investment`, `amount`, `created_at`, `updated_at`) VALUES
(1, 'Sapphare', '5000.00000000', '100.00000000', NULL, NULL),
(2, 'Ruby', '10000.00000000', '200.00000000', NULL, NULL),
(3, 'Emerald', '50000.00000000', '1000.00000000', NULL, NULL),
(4, 'Diamond', '100000.00000000', '2000.00000000', NULL, NULL),
(5, 'Crown diamond', '500000.00000000', '10000.00000000', NULL, NULL),
(6, 'Royal crown diamond', '1000000.00000000', '20000.00000000', NULL, NULL),
(7, 'Vise president', '5000000.00000000', '100000.00000000', NULL, NULL),
(8, 'President', '10000000.00000000', '200000.00000000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2022-11-14 16:50:05', '2022-11-14 16:50:05'),
(2, 'staff', 'web', '2022-11-14 16:50:05', '2022-11-14 16:50:05'),
(3, 'user', 'web', '2022-11-14 16:50:05', '2022-11-14 16:50:05');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(5, 2),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 1),
(8, 2),
(9, 1),
(9, 2),
(10, 1),
(10, 2),
(11, 1),
(11, 2),
(12, 1),
(12, 2),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(17, 2),
(18, 1),
(18, 2),
(19, 1),
(19, 2),
(20, 1),
(20, 2),
(21, 1),
(21, 2),
(22, 1),
(22, 2),
(23, 1),
(23, 2),
(24, 1),
(24, 2);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `post_balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `trx_type` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `amount`, `charge`, `post_balance`, `trx_type`, `trx`, `details`, `remark`, `created_at`, `updated_at`) VALUES
(1, 5, '2000.00000000', '0.00000000', '0.00000000', '+', 'OKBBE1JA6ZF1', 'Received reward from referrals', 'reward', '2022-11-14 16:50:43', '2022-11-14 16:50:43'),
(2, 35, '20000.00000000', '0.00000000', '0.00000000', '+', 'CP1JRFAA5TAP', 'Received reward from referrals', 'reward', '2022-11-14 16:50:43', '2022-11-14 16:50:43'),
(3, 37, '20000.00000000', '0.00000000', '0.00000000', '+', 'H329U8QMKQVG', 'Received reward from referrals', 'reward', '2022-11-14 16:50:43', '2022-11-14 16:50:43'),
(4, 139, '2000.00000000', '0.00000000', '0.00000000', '+', 'D2D4KTMAJ6EK', 'Received reward from referrals', 'reward', '2022-11-14 16:50:43', '2022-11-14 16:50:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_by` bigint(20) UNSIGNED DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `plan_expiry` decimal(8,2) NOT NULL DEFAULT 1.00,
  `plan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `investment` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `profit` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `commission` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `reward` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `reward_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `public_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nonce` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','baned') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Email verfication',
  `mv` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Mobile verfication',
  `two_fa` tinyint(1) NOT NULL DEFAULT 0 COMMENT '2 factor verfication',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `account_no`, `ref_by`, `username`, `address`, `phone_no`, `date_of_birth`, `plan_expiry`, `plan_id`, `email_verified_at`, `password`, `investment`, `profit`, `commission`, `reward`, `reward_title`, `public_address`, `nonce`, `status`, `ev`, `mv`, `two_fa`, `remember_token`, `created_at`, `updated_at`, `user_type`) VALUES
(1, 'Ines Kshlerin', 'jdoyle@example.org', NULL, 33, 'waldo.krajcik', '551 Rippin Hill\nNikkimouth, WI 98507-7723', '+12256386329', NULL, '1.00', 1, '2022-11-14 16:50:05', '$2y$10$de3GwGP7.3ZKeNlsbgq1zuJjNr38CNq.En08RL7DjnBwQdWpIps8u', '761768.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '763550000000', 'active', 1, 1, 0, 'UhCPhdaAWF', '2022-11-14 16:50:38', '2022-11-14 16:50:38', 'user'),
(2, 'Willy Grady', 'noemi.bechtelar@example.net', NULL, 163, 'aniyah.hayes', '6689 Lottie Tunnel Suite 106\nNorth Rubyechester, NJ 68889', '(224) 982-4710', NULL, '1.00', 5, '2022-11-14 16:50:05', '$2y$10$V7X5e5vExGs5yWgG3DgvWecF259vO7mmqdUJT.zaZhqLmiWoN15ja', '990293.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '150319000000', 'baned', 1, 1, 0, '9iJhZbPGok', '2022-11-14 16:50:38', '2022-11-14 16:50:38', 'user'),
(3, 'Mustafa White', 'porter.davis@example.com', NULL, 186, 'cbotsford', '7100 Roxane Extension Apt. 061\nSavannahburgh, HI 67294-0924', '843-748-7252', NULL, '1.00', 4, '2022-11-14 16:50:05', '$2y$10$sI7fIizKjyo60/DSJVwHIuOOMlRI9b513C0VbzEqeQk67k9EFCy2G', '23428.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '977265000000', 'active', 1, 0, 0, 'v7EVsvFZ39', '2022-11-14 16:50:38', '2022-11-14 16:50:38', 'user'),
(4, 'Earline Lemke', 'grace.herzog@example.org', NULL, 157, 'bgerhold', '93264 Hermann Divide Suite 557\nPort Jerrell, MO 27264', '(757) 660-1721', NULL, '1.00', 1, '2022-11-14 16:50:06', '$2y$10$VvdaAndDQje/JFTgYTl/qurYH9WdLge/7huByqLOv3YxGOhEYLp2.', '185662.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '195796000000', 'active', 1, 0, 0, 'z9ZWFf30Hf', '2022-11-14 16:50:38', '2022-11-14 16:50:38', 'user'),
(5, 'Tierra Schaefer', 'michelle.jast@example.com', NULL, 107, 'alexandrea.nolan', '1415 Gerlach Courts Apt. 142\nGaylordport, NE 00804', '626.647.5033', NULL, '1.00', 5, '2022-11-14 16:50:06', '$2y$10$2Mn8ollgBPkMpc4fDXlFv.wb7fvpGqg1gb1KhRtp/BZhEBYnPfm8C', '304182.00000000', '0.00000000', '0.00000000', '2000.00000000', 'Diamond', NULL, '492199000000', 'active', 1, 0, 0, 'LaI383mPM9', '2022-11-14 16:50:38', '2022-11-14 16:50:43', 'user'),
(6, 'Colt Christiansen', 'loraine33@example.org', NULL, 189, 'elmer.abshire', '906 Taryn Hill Suite 039\nJamarcusland, ID 09092', '1-640-255-8961', NULL, '1.00', 9, '2022-11-14 16:50:06', '$2y$10$Q3p8d50y.q9OGAbtkP5fsumlJJdc5EGu0O4L.qJXQAwTpG71Nx2Kq', '421377.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '880757000000', 'active', 1, 0, 1, 'ar87giNI21', '2022-11-14 16:50:38', '2022-11-14 16:50:38', 'user'),
(7, 'Brenden Kuvalis', 'kheller@example.com', NULL, 41, 'christopher43', '14438 Mariela Alley\nNew Suzanne, LA 73162', '(430) 272-8483', NULL, '1.00', 9, '2022-11-14 16:50:06', '$2y$10$Dal88Cr2TJhgnssv/XJ1C.EM2Pvnsvs8QlHCdzGMjXt8BYLa1Chu2', '157831.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '233069000000', 'baned', 1, 0, 1, 'RddPspoGw4', '2022-11-14 16:50:38', '2022-11-14 16:50:38', 'user'),
(8, 'Shany Harris', 'eulalia.moore@example.net', NULL, 189, 'irwin78', '418 Tremblay Curve Apt. 338\nGusikowskihaven, ND 26480', '(865) 326-6897', NULL, '1.00', 7, '2022-11-14 16:50:07', '$2y$10$HUokSxzfUfg3OQVOu/WqKOGrOUBnxXMyGR8fcajo29eVxlBaKYoYC', '668826.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '92902000000', 'baned', 1, 1, 0, 'y0Cr9UUdsT', '2022-11-14 16:50:38', '2022-11-14 16:50:38', 'user'),
(9, 'Jacynthe Ferry', 'kirk55@example.com', NULL, 203, 'uleannon', '71519 Gaylord Inlet Apt. 064\nAlecstad, MO 16958-1362', '559.851.2879', NULL, '1.00', 2, '2022-11-14 16:50:07', '$2y$10$ArqcmZk0YrYJ12ANLDVHR.VKpuPNNKFLG9d8vdV4bOANux.w0NF3m', '433950.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '723751000000', 'baned', 1, 0, 0, 'WsPWbSeE5S', '2022-11-14 16:50:38', '2022-11-14 16:50:38', 'user'),
(10, 'Destinee Kshlerin', 'terrance95@example.com', NULL, 26, 'qconnelly', '472 Ed Wall Suite 506\nMurazikville, MI 46944-0875', '+1-626-669-7209', NULL, '1.00', 5, '2022-11-14 16:50:07', '$2y$10$P1SJPr7L3IJ9abAfCQplbeXZFUHg1FPqnvMyUOcYnAVeh4gwV2lV6', '885432.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '675436000000', 'baned', 0, 1, 1, 'VydhAU1rWA', '2022-11-14 16:50:38', '2022-11-14 16:50:38', 'user'),
(11, 'Nico Ratke', 'ava11@example.org', NULL, 162, 'oschulist', '25382 Dariana Brook\nNew Dalton, MA 10593', '(248) 485-0798', NULL, '1.00', 2, '2022-11-14 16:50:07', '$2y$10$UHVU1H4zWi6H17AQudV8KuE64DRIMqoFWR6mKOC4Rwh9ebmbxZyK2', '16586.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '184713000000', 'baned', 0, 1, 0, '6TVNAMzqxA', '2022-11-14 16:50:38', '2022-11-14 16:50:38', 'user'),
(12, 'Freida Morissette', 'hettie47@example.net', NULL, 35, 'shakira.brekke', '290 Trevor Brooks\nSchmidtport, PA 53422', '1-812-359-0810', NULL, '1.00', 1, '2022-11-14 16:50:07', '$2y$10$6IPu9o.bd2DALa2geYcpGOrzS./KGof.zjlIy6B58RcZgh2EYSbaW', '334877.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '838078000000', 'baned', 0, 1, 1, 'ruY4PC1gQY', '2022-11-14 16:50:38', '2022-11-14 16:50:38', 'user'),
(13, 'Shanon Borer', 'delphia.hyatt@example.org', NULL, 145, 'rlarkin', '2924 Cummerata Brook\nEast Mabel, RI 44460-7210', '+1-774-997-7314', NULL, '1.00', 9, '2022-11-14 16:50:07', '$2y$10$KxAO/cvE5aTLgMn9iG7G4OViAQmpmlZ29vyPOZNIPZU4NE.eN7YoC', '33017.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '960152000000', 'active', 1, 1, 1, 'IRdR4gWlN9', '2022-11-14 16:50:38', '2022-11-14 16:50:38', 'user'),
(14, 'Hallie Parker', 'khalid91@example.com', NULL, 180, 'rsauer', '44685 Shane Drive Suite 970\nEast Kory, ME 40525-3887', '(229) 556-4520', NULL, '1.00', 2, '2022-11-14 16:50:08', '$2y$10$/dbVH05/kbSbVfyMEU8p2O9cBdeOUBllijs3O0nRIAApMv5Kf93rK', '266920.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '433303000000', 'active', 0, 0, 1, '9nTyErDBze', '2022-11-14 16:50:38', '2022-11-14 16:50:38', 'user'),
(15, 'Sterling Schmeler', 'selmer07@example.org', NULL, 163, 'boyle.dylan', '778 Lane Mountain Apt. 200\nNorth Crawford, FL 74662', '1-920-894-7951', NULL, '1.00', 8, '2022-11-14 16:50:08', '$2y$10$zTGHsgCCQMGAXzhNOW3.3uZtOui6kqzFkmFf4rARFo9PSijf4WKXm', '434498.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '300608000000', 'active', 1, 1, 1, 'ebc4IYo3V4', '2022-11-14 16:50:38', '2022-11-14 16:50:38', 'user'),
(16, 'Dominique Harris', 'bogisich.albina@example.org', NULL, 80, 'mohr.aisha', '2932 Arthur Tunnel Apt. 189\nLenoremouth, OH 99789', '484.701.7157', NULL, '1.00', 4, '2022-11-14 16:50:08', '$2y$10$ZUgqFNATDHR77jr0OgEftO15HM4C9GwrVxqPycd1I.5sSc27mf9S2', '151491.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '741521000000', 'active', 0, 0, 1, 'vlppdCGyp5', '2022-11-14 16:50:38', '2022-11-14 16:50:38', 'user'),
(17, 'Loraine Walsh', 'cassandre39@example.com', NULL, 154, 'russel.don', '27721 Schaefer Hill\nPort Vivianneville, GA 24305', '904.694.5971', NULL, '1.00', 8, '2022-11-14 16:50:08', '$2y$10$Fhv8c69Hix9Dhed1b6fNYuIZRXBLbx8El9XYRqmMjoPX.09v1oykC', '930463.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '208829000000', 'active', 0, 1, 1, 'tYgQkinoAH', '2022-11-14 16:50:38', '2022-11-14 16:50:38', 'user'),
(18, 'Jackeline Brown', 'alexandre.swift@example.net', NULL, 47, 'kaylee.nienow', '57802 Bogisich Circle\nLake Marcel, VT 97120-7863', '+1-405-478-9077', NULL, '1.00', 5, '2022-11-14 16:50:08', '$2y$10$R.qA7PrBuFGRlfglVzOS8Ou2y46qbJulgB62PKEQXUtXethk9.j0q', '295505.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '748960000000', 'baned', 1, 0, 1, 'VLSDAF8heM', '2022-11-14 16:50:38', '2022-11-14 16:50:38', 'user'),
(19, 'Jovany Gleason', 'rebert@example.org', NULL, 57, 'xwyman', '3573 McGlynn Inlet\nWintheisermouth, IA 54121-5536', '1-765-938-0452', NULL, '1.00', 2, '2022-11-14 16:50:08', '$2y$10$VKaFHRS2.Bp3.dpFscY92.zX5vOoetKreB8Sk40O08/wo/H6l1ESq', '991903.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '488030000000', 'baned', 0, 0, 1, 'J4vTLDpqia', '2022-11-14 16:50:38', '2022-11-14 16:50:38', 'user'),
(20, 'Brittany Carter', 'julio.beahan@example.org', NULL, 37, 'shawn.lindgren', '8061 Alyce Expressway Suite 391\nNorth Immanuelburgh, RI 99478', '1-412-690-3803', NULL, '1.00', 1, '2022-11-14 16:50:08', '$2y$10$U85E69bjSGLxoF31DSeWEOWmU0Lmvn6jVhEFq.fafRHCDXJvM1ERS', '826134.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '498255000000', 'baned', 0, 1, 1, 'uHW00H8oT3', '2022-11-14 16:50:38', '2022-11-14 16:50:38', 'user'),
(21, 'Roxane Kautzer', 'vella.klocko@example.net', NULL, 128, 'lenore12', '671 Everardo Lodge Suite 585\nRiceton, SD 82374', '+1 (678) 275-6140', NULL, '1.00', 3, '2022-11-14 16:50:08', '$2y$10$up0R.oDcCk/.ijazsAnz6uMKmAfTbK4yIOm7O47wi3ygg7/YMbYuO', '894797.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '238395000000', 'baned', 0, 0, 0, 'YkobQvvcvA', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(22, 'Vito Harvey', 'madisyn51@example.org', NULL, 166, 'rupton', '1560 Vidal Place Suite 908\nJarredburgh, IL 49520-0010', '+1-860-544-8739', NULL, '1.00', 2, '2022-11-14 16:50:08', '$2y$10$CoVg6cehfO57w2TyWs5jV.SqVrnDLJfrFkxPz0EzvhQ1BVvoPcbQy', '230619.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '546629000000', 'active', 1, 0, 1, 'tZb6iwNSBK', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(23, 'Malika Spinka', 'fisher.fanny@example.net', NULL, 145, 'berneice.harber', '1040 Schiller Spur Apt. 005\nKihnfort, WI 48177', '+1-636-276-5585', NULL, '1.00', 6, '2022-11-14 16:50:09', '$2y$10$NeHKpoRGWr4UAiH.ESwMaODULCCPL/c.DDUK2Wd6gmXZi3ZZUVXNa', '284260.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '194716000000', 'active', 0, 0, 0, '7oiBubojMS', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(24, 'Collin Cassin', 'gusikowski.serenity@example.com', NULL, 162, 'lucienne.beatty', '8615 Haag Valleys\nSouth Mathilde, FL 65218', '+17203516059', NULL, '1.00', 3, '2022-11-14 16:50:09', '$2y$10$71TIJb1k0GpyjRR.fbSWxe4ARQ8zOxC6PWJ8VjNcNRRWWjOTtl2NO', '100560.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '491474000000', 'active', 1, 1, 0, 'GAlZxKv889', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(25, 'Oswaldo Torp', 'aisha.kessler@example.com', NULL, 97, 'fabiola.watsica', '20091 Eichmann Roads\nGulgowskimouth, ND 41437-9494', '(929) 703-1452', NULL, '1.00', 2, '2022-11-14 16:50:09', '$2y$10$fK.U8U8xYJuLbwE1V4miJus3gbGAY8QnB0ciSbWqfgmgDELYyPXJm', '876008.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '265861000000', 'baned', 1, 1, 1, '7NTi3h2UTE', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(26, 'Aurelia Hodkiewicz', 'qpfannerstill@example.org', NULL, 96, 'ethelyn.lowe', '736 Savannah Land\nMikemouth, SC 61881-1260', '+1 (817) 876-5821', NULL, '1.00', 1, '2022-11-14 16:50:09', '$2y$10$5iabYCGCNINW/kWvDaVoX.8AJ29SLzMHHy3EIJIQvjmu/kI567iY6', '871425.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '592311000000', 'baned', 1, 1, 1, 'aaOXLz2OI2', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(27, 'Lacey Halvorson', 'willa.hessel@example.org', NULL, 198, 'emmitt.johnston', '769 Koepp Lock\nDaniellastad, MO 67802', '1-989-324-0368', NULL, '1.00', 4, '2022-11-14 16:50:09', '$2y$10$/BexZhHJ62RM7/yuGWlsUOpe7QuPyNsA/Srz9Btgd7XckgmfnH5WW', '348.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '181874000000', 'active', 0, 0, 1, 'Huoqx2BStM', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(28, 'Ericka Effertz', 'ohane@example.com', NULL, 103, 'reyna56', '201 Hamill Wall\nFriedrichmouth, MD 40050', '+1-430-935-2355', NULL, '1.00', 7, '2022-11-14 16:50:10', '$2y$10$TPo1geKDcd3ZXqc6sqJFwuRZ9FFeaCIDFDMDgcsyArc/ceu.8IhDi', '970510.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '207526000000', 'baned', 1, 1, 0, 'cBsArl4ujt', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(29, 'Gail Hoeger', 'nikolaus.reagan@example.com', NULL, 56, 'dprosacco', '315 Schuyler Parkway\nSchinnertown, WI 48180', '1-725-314-8742', NULL, '1.00', 5, '2022-11-14 16:50:10', '$2y$10$IZU.KWMPKI52ThF2iMOKr.3mapWOwOaZ4v1bwxDUQZ4Et6zEk78QW', '883412.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '420306000000', 'baned', 0, 1, 1, '4rEpJ8Riac', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(30, 'Jerod Wisozk', 'devante46@example.net', NULL, 82, 'runte.elmore', '389 Schuppe Islands\nDonnietown, VA 32804-1459', '912-312-1652', NULL, '1.00', 6, '2022-11-14 16:50:10', '$2y$10$Z/82Yadow0jzXqS5HMR5q.mphWw8L8meFTLyWmIxjaIva70/Is4Sa', '355110.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '713822000000', 'active', 1, 1, 1, 'OEeax100Xa', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(31, 'Eric Becker', 'neil.breitenberg@example.com', NULL, 29, 'sallie.sanford', '5099 Jay Haven\nD\'Amoreside, AR 31597', '1-689-736-2341', NULL, '1.00', 3, '2022-11-14 16:50:10', '$2y$10$Mtzv3SjNDASHpi8o5vQJCeovk8V2TigZDhHerklxvHG2np.im6ySu', '563066.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '493880000000', 'active', 0, 1, 1, 'nspHJMRQbv', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(32, 'Juwan Boyer', 'newell39@example.com', NULL, 163, 'dock.white', '5102 Bauch Isle Apt. 545\nWilburnfurt, IA 34575', '574.946.2523', NULL, '1.00', 6, '2022-11-14 16:50:10', '$2y$10$HTNgBgukK/oXyCx/2g6v1.vWcWlHFyIUNTJnsmKM7ZJBHkT5b1VNa', '768958.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '469136000000', 'baned', 0, 1, 0, 'IaX9hyCHv9', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(33, 'Margarett Beatty', 'odell.medhurst@example.com', NULL, 5, 'madalyn90', '276 Judah Street Apt. 516\nSouth Pearlton, FL 00530', '+1 (828) 538-1013', NULL, '1.00', 7, '2022-11-14 16:50:11', '$2y$10$1u6BVKsoqvp9SjM2AuQCX.FDlUBuskVazP0lkNQ4zSu9D5i9HVSr2', '265589.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '153990000000', 'baned', 1, 1, 0, 'yQiMfWydjJ', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(34, 'Lesly Mosciski', 'qmueller@example.net', NULL, 172, 'constance36', '7718 Rolfson Knolls\nBoganmouth, WA 85305', '1-726-828-8875', NULL, '1.00', 7, '2022-11-14 16:50:11', '$2y$10$CGVPuhKlcQRLJwoPWqE.8.iIqY.FR1cwuOkepHArDUpQrOheFyRFO', '457703.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '764699000000', 'baned', 0, 1, 1, 'KCrchJHlXQ', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(35, 'Leila Bashirian', 'dahlia68@example.net', NULL, 74, 'mikel84', '5812 O\'Hara Brook\nLake Sydnieburgh, DC 10309-1170', '769-806-1172', NULL, '1.00', 5, '2022-11-14 16:50:11', '$2y$10$Bgzt9AZDH.8CXli3aCfL9.Gmzhqc78l1nbzn6h3pblz7rU5Wn3VC2', '98022.00000000', '0.00000000', '0.00000000', '20000.00000000', 'Royal crown diamond', NULL, '194406000000', 'active', 1, 1, 1, 'Avt2YTvkAV', '2022-11-14 16:50:39', '2022-11-14 16:50:43', 'user'),
(36, 'Hertha Monahan', 'tavares74@example.org', NULL, 14, 'kgoodwin', '72577 Harber Road Suite 907\nToyshire, AR 26716-3297', '1-626-918-6608', NULL, '1.00', 3, '2022-11-14 16:50:11', '$2y$10$FInkI0fwlmYgMWuU34aCNuKg/8cKJJj3ox78f9XtkNnrXSnADoPVa', '466351.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '816972000000', 'baned', 1, 1, 0, 'sLnXEfoj9v', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(37, 'Vinnie Kozey', 'leffler.junius@example.net', NULL, 141, 'schuster.carolanne', '2798 Kyra Glens Apt. 442\nNorth Josh, PA 07104-6907', '+1 (737) 853-6577', NULL, '1.00', 5, '2022-11-14 16:50:11', '$2y$10$4p1hyehRSqUv2dHtQMfR3ujyg/Do8mQ9CHkVj7mMpomcXsgkOzWDC', '632824.00000000', '0.00000000', '0.00000000', '20000.00000000', 'Royal crown diamond', NULL, '173334000000', 'active', 0, 0, 1, '7X3HM3I6oK', '2022-11-14 16:50:39', '2022-11-14 16:50:43', 'user'),
(38, 'Kaci Keeling', 'sophia.schinner@example.com', NULL, 71, 'barrows.uriah', '516 Kevin Villages\nMertztown, OK 38670', '816.653.7034', NULL, '1.00', 8, '2022-11-14 16:50:12', '$2y$10$.WySXi0uiRn33aaGrzfEdunOuyVTud.c/XEmTb3SYcFH2408VgUAu', '997828.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '351537000000', 'baned', 0, 0, 1, 'oIvFI88SJi', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(39, 'Natalie Johns', 'uthiel@example.net', NULL, 14, 'justine09', '67720 Schroeder Dam\nPort Bessieshire, MI 74149', '213-885-7758', NULL, '1.00', 2, '2022-11-14 16:50:12', '$2y$10$25bbFxcwHuTwxYiEfLtwdOUVT8JQWdGUtpbI9/p3Fj/Xd6ZhkUqNW', '925370.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '940307000000', 'active', 1, 0, 0, 'uUOmpv9vAB', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(40, 'Kaya Kirlin', 'fae82@example.net', NULL, 85, 'khaag', '4845 Electa Road Apt. 601\nRosannashire, AL 60103', '270-448-9234', NULL, '1.00', 4, '2022-11-14 16:50:12', '$2y$10$2WykzAjXHO7rdb65AQyJg.lVY2Kd/d.TUmuC51hEckZ3r.8QUsN5C', '541348.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '814288000000', 'baned', 1, 0, 1, 'bOiSFIRqh4', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(41, 'Gabe Howell', 'blockman@example.net', NULL, 79, 'wiza.zachary', '5020 Naomi Plains\nLindchester, IL 44229', '+1.201.406.4728', NULL, '1.00', 9, '2022-11-14 16:50:12', '$2y$10$aWfvYOlqsAtxKP0aU6.q6OiZdEHJlMetyioXOpVPHcISepAwSUtzy', '463438.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '984407000000', 'active', 0, 1, 1, 'Tgal5qGXG6', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(42, 'Grayce Goyette', 'mariam.rodriguez@example.com', NULL, 41, 'vhagenes', '4791 Watson Villages Apt. 828\nModestoton, FL 81026', '+1.862.402.3397', NULL, '1.00', 6, '2022-11-14 16:50:12', '$2y$10$hYwPd9GyTLqbbNiHr2HMO.VaHxz00P9gnowMBdjzrjh.pB1TOOOWi', '633308.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '406717000000', 'baned', 0, 1, 0, '3z7UQEOPTN', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(43, 'Quinn Anderson', 'walter.boyle@example.com', NULL, 133, 'weimann.judson', '915 Barton Expressway Suite 559\nWest Shanybury, TN 83875-0569', '717-963-6898', NULL, '1.00', 7, '2022-11-14 16:50:12', '$2y$10$AWmnwSKWKZYnvkzKp1.TquW9Nq2MRlt01HitRQoM5IN0IW9W5BfRe', '909309.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '16856000000', 'active', 1, 0, 0, 'FpD6kbG38s', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(44, 'Naomie Monahan', 'rhoda.fay@example.net', NULL, 31, 'gemard', '6876 White Road\nJusticefurt, ND 63074-1950', '727-480-8807', NULL, '1.00', 9, '2022-11-14 16:50:12', '$2y$10$OcIWZpk84wjUS4DkhRqfL.7Ng2xK01MGuzgRCl5XaFbr3j9zKYMFq', '621664.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '616133000000', 'active', 0, 1, 0, 'tzFAI7nYVa', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(45, 'Grant Langosh', 'tdaniel@example.net', NULL, 74, 'johann28', '42503 Davion Skyway\nJoycefort, OK 66577', '+1.458.391.5024', NULL, '1.00', 3, '2022-11-14 16:50:13', '$2y$10$TW9EucS0HOFQV2sB468z4.dLCJYhe2VLKXqTa//SQeEcHv4baJdsW', '89975.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '916456000000', 'baned', 1, 0, 0, 'NvsYCWhlnV', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(46, 'Joshua Ullrich', 'mustafa.spencer@example.com', NULL, 47, 'kunze.ed', '320 Misael Junction Apt. 490\nPort Lemuel, CO 99964', '+1.478.702.0734', NULL, '1.00', 6, '2022-11-14 16:50:13', '$2y$10$JNSnmvkUPF9oD3RwtkqUiONLUHh.j/eIgFvO5LycUoKnHKGTwJXC6', '313622.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '494293000000', 'active', 0, 0, 0, 'khGEY4sYPG', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(47, 'Carrie Dooley', 'ellen50@example.org', NULL, 128, 'tracy.leuschke', '26158 Effertz Inlet\nLake Goldenstad, IN 01015', '1-703-587-3058', NULL, '1.00', 3, '2022-11-14 16:50:13', '$2y$10$GwQ7nZO165Weln94xgYaRuAv2FAvL8M5yrpiuyA0b6YlJgebApTjK', '122972.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '653392000000', 'baned', 1, 1, 0, '8MU0o64bDy', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(48, 'Filiberto O\'Keefe', 'emelia30@example.com', NULL, 183, 'elena.stehr', '2919 Trudie Hill\nSouth Oliver, IA 47399-4645', '586.240.8803', NULL, '1.00', 9, '2022-11-14 16:50:13', '$2y$10$YML.913jMXE5On18tpdyfefWyB0aE.5IIQmXgjILgCPIYK/XscfPC', '765151.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '241431000000', 'active', 0, 0, 1, 'zI5oo4VOnz', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(49, 'Van Kertzmann', 'adan.skiles@example.org', NULL, 200, 'zkub', '3890 Ratke Drive Apt. 674\nTommiemouth, NC 03875-9444', '+1.443.610.3476', NULL, '1.00', 5, '2022-11-14 16:50:13', '$2y$10$FcD2u0HAx4fW2gpbQLUtf.BjTJgcl8kD3YQkC62Y7SmiF1Tc8dHf6', '32053.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '638728000000', 'active', 0, 0, 0, '8Ititz0mCs', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(50, 'Dannie Schiller', 'dayana85@example.org', NULL, 201, 'mkonopelski', '4960 Mosciski Radial\nTorpstad, CT 42903', '+1-931-450-6782', NULL, '1.00', 7, '2022-11-14 16:50:13', '$2y$10$xX/MzS1FKM6lGMULetJBe.MW7LK3MQjHXa5rZd8gncUKjX5S6DB5.', '281872.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '873779000000', 'active', 1, 1, 1, 'qIwQcGMLlX', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(51, 'Yasmine Cremin', 'koss.betty@example.com', NULL, 48, 'angela.schmeler', '5402 Marks Centers\nSouth Viola, SD 19426-4966', '1-228-993-1605', NULL, '1.00', 4, '2022-11-14 16:50:14', '$2y$10$A39HtZ0IpXLkmfaHDByl2O.bGqO.iSLNSfcPHhHtpc76AEkH67cGG', '823232.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '137125000000', 'active', 0, 1, 1, 'Ks7sEx1Q9W', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(52, 'Daren Mante', 'folson@example.com', NULL, 53, 'amie28', '2957 Amelie Trafficway Suite 147\nJanisport, TN 62799-9531', '1-984-458-6210', NULL, '1.00', 5, '2022-11-14 16:50:14', '$2y$10$vcAVvz1iNe/xxjX0ElndjuUjsXPIr/5QN.c1WyfQSxN.ZmjE5QENG', '986103.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '666375000000', 'baned', 0, 1, 1, 'Ze7iEtX5Ek', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(53, 'Javier Wyman', 'blaze.bradtke@example.net', NULL, 9, 'vidal.cormier', '93606 Schimmel Track\nJoelmouth, SD 53335', '682-409-3664', NULL, '1.00', 8, '2022-11-14 16:50:14', '$2y$10$1IWjUKbdhnX.kGKWG3WcJ.bpyW4bbKECZtzJsMn8Zmyio7ZDSWRQe', '283442.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '542309000000', 'active', 1, 0, 0, 'jqu7UH97M9', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(54, 'Zetta Emmerich', 'goyette.alexzander@example.net', NULL, 128, 'klein.margarette', '4529 Betsy Mills Apt. 522\nSauerland, MO 51214', '(843) 744-7397', NULL, '1.00', 4, '2022-11-14 16:50:14', '$2y$10$yZRls1/dMqEokvv.7H/Q3ebWf74HV9Cse4qGLz9.K6GARI0W0oGgm', '498404.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '324088000000', 'active', 1, 1, 1, 'aMLPXHtpJS', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(55, 'Mortimer Koss', 'sjohnson@example.org', NULL, 152, 'fsipes', '346 Mante Mission Apt. 382\nNew Muriel, NM 44893', '225-914-3011', NULL, '1.00', 9, '2022-11-14 16:50:14', '$2y$10$VjXNnd3ma8dAvxTTP.o5oO2OP.lC6jWaNIerBI86051XhoqiFYmTO', '688311.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '666503000000', 'active', 0, 1, 0, 'g9c0NQcaxa', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(56, 'Don Dietrich', 'wunsch.kaycee@example.org', NULL, 47, 'xjacobson', '37327 Haley Pike\nLake Francesview, NY 84726', '1-423-452-4782', NULL, '1.00', 7, '2022-11-14 16:50:14', '$2y$10$WNIyaZb1FhfUEQscQfwWjOm80ebmVQbZD5k0Nz8Kk49U540Olh7x6', '840473.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '38761000000', 'active', 0, 1, 0, 'MJpaSlaGtg', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(57, 'Jannie Gleichner', 'nhaag@example.com', NULL, 126, 'hermann.dale', '10732 Green Cliff\nDavidland, WA 03108', '(870) 262-2293', NULL, '1.00', 8, '2022-11-14 16:50:14', '$2y$10$0jm/l9FdBWfOrG/ltlNZhu.k6nDy.h0Eh7dlgyjnx3r.HAlp3X2KW', '804233.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '428219000000', 'active', 0, 0, 0, 'etYwJ7kJM6', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(58, 'Marquise Cruickshank', 'keebler.lucas@example.net', NULL, 167, 'melba.batz', '764 Odie Summit\nPort Zaneville, CO 15819-6684', '1-718-224-4904', NULL, '1.00', 3, '2022-11-14 16:50:14', '$2y$10$aCVt9UPN8t/rnlGZZM6VJOLJUiWTw482DJiafSkM/1PYsDhlYm7mi', '132812.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '961880000000', 'active', 0, 1, 0, '7HirVdE0cg', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(59, 'Lucinda O\'Reilly', 'kuhlman.alta@example.org', NULL, 100, 'dorcas54', '664 Hollis Island\nEvanston, WA 75912-5611', '+1.573.796.6921', NULL, '1.00', 1, '2022-11-14 16:50:15', '$2y$10$awDW/xe5fXtBJaY6MDbnIOFQVGWFaCboLnun/IHMtsP2gVSNPxX9e', '441746.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '810132000000', 'active', 1, 1, 0, 'zSbTt42nRl', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(60, 'Holly McClure', 'dgreenholt@example.net', NULL, 102, 'kreiger.pink', '37854 Hoeger Lane\nEast Mariamouth, NH 35432', '(872) 989-9552', NULL, '1.00', 5, '2022-11-14 16:50:15', '$2y$10$9LrPMtIxDUH379iGda.SzuUnn/vhkJ.C5DKPq1iGKEnmTnLVFCBC2', '429560.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '499469000000', 'baned', 1, 1, 0, 'YNb4ewaneg', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(61, 'Einar White', 'markus23@example.com', NULL, 134, 'stiedemann.thad', '25418 Konopelski Row Apt. 282\nAlysonville, CO 76919-7934', '+1.814.480.7975', NULL, '1.00', 1, '2022-11-14 16:50:15', '$2y$10$cRh1Sp36SVO1T6NQz6M2mucgyuEa48yxitOtcKN1i9/7UvCdCXMMu', '11248.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '861017000000', 'active', 1, 0, 0, 'tDiKVbNGT3', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(62, 'Sabryna Schroeder', 'vandervort.fabian@example.net', NULL, 102, 'dillan98', '8633 Salvatore Burg Suite 433\nWest Rashad, AL 33985', '1-904-506-8420', NULL, '1.00', 6, '2022-11-14 16:50:15', '$2y$10$AwXy3UwL5N2beRJuSsA2fOnsR0DAO5P.neUdDS1YUYeI/MYD7Hrj2', '556670.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '498159000000', 'baned', 1, 0, 0, 'x4aTQtIMiv', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(63, 'Evelyn Bechtelar', 'jaskolski.favian@example.org', NULL, 47, 'walter.dino', '6728 Jena Lodge\nNorth Erlingport, OK 41579', '231-348-3912', NULL, '1.00', 8, '2022-11-14 16:50:15', '$2y$10$tIm9dBsTNT6hiVEfMbBRSeji7Ay8OxfZJoJ656awThGAHF9hqicTi', '420375.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '912482000000', 'baned', 1, 1, 1, 'XlVv6oq1qj', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(64, 'Danyka Brown', 'clare20@example.com', NULL, 111, 'kale08', '31352 McDermott Springs Apt. 725\nWest Elvera, AR 85722-4125', '+1-713-325-6957', NULL, '1.00', 2, '2022-11-14 16:50:15', '$2y$10$Gi60Kp/x/B1GLdamqtgAoefdEtByx1tIfAfP30NqMLC7ioKHSza8m', '180603.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '425478000000', 'active', 1, 1, 1, 'GktOLvse9b', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(65, 'Dina Larkin', 'dgleason@example.org', NULL, 92, 'piper60', '64514 Streich Mission\nHuldafort, IN 77271-2805', '+1-872-264-8121', NULL, '1.00', 1, '2022-11-14 16:50:15', '$2y$10$8Ky6M757NQoy7GAsaCld.e5a4q7c3DnelJvxquxLND8sYDSOrl4Ze', '776977.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '954698000000', 'baned', 1, 0, 1, 'FlPlWW67pU', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(66, 'Newell Rutherford', 'sawayn.nyah@example.com', NULL, 98, 'bailee72', '273 Ulises Summit Suite 038\nCrooksstad, WV 31786', '1-786-887-4800', NULL, '1.00', 8, '2022-11-14 16:50:15', '$2y$10$iQeM5xMqmPWNFu6pHeBQsehkp3BmhhDcRGkkvz5iDtoJKzc3t/Wui', '481033.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '102507000000', 'active', 1, 1, 1, 'GSF1x1FXol', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(67, 'Dax Kunde', 'mcdermott.rosemarie@example.org', NULL, 134, 'khodkiewicz', '732 Macy Dale\nEast Veronica, HI 08147-1346', '478-345-1222', NULL, '1.00', 2, '2022-11-14 16:50:16', '$2y$10$xEitzSkIRIdff2TvvExt1e.jw2pQEQnw8pkmW8Y1RoolvN.7D2AH2', '466587.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '327646000000', 'baned', 0, 1, 0, '29JZKHBG2w', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(68, 'Vallie Luettgen', 'qsanford@example.com', NULL, 133, 'bogisich.alize', '199 June Avenue\nCoybury, ME 68209-2026', '1-571-419-0020', NULL, '1.00', 9, '2022-11-14 16:50:16', '$2y$10$ctGjQWDHyiy9XOMYL1J/Zenieeb2.32MLPGXT6M.7PtFiTJzteBJy', '92420.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '473057000000', 'active', 0, 1, 1, 'BaVz1iRedn', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(69, 'Lee Connelly', 'sortiz@example.org', NULL, 74, 'hassan11', '162 Alba Course\nNorth Marcelluston, NC 49752-4317', '531.835.7090', NULL, '1.00', 8, '2022-11-14 16:50:16', '$2y$10$pmcR7Yl8JF1fJ6OUqNQBMundnkxajW4eUlZJchThDMVp/2mSbrccS', '585607.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '957543000000', 'baned', 0, 0, 1, 'xtbq1sXEra', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(70, 'Antwon Bayer', 'qpagac@example.net', NULL, 108, 'horacio.haag', '4739 Clinton Neck\nJaniyamouth, NE 64839-8062', '+1 (678) 268-1430', NULL, '1.00', 2, '2022-11-14 16:50:16', '$2y$10$aR9P14fFUSZ1FPWXL1gZeeDh6K7CtBEOeaUSnLfyY0M4CAoGjzyju', '669549.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '560767000000', 'active', 0, 1, 1, 'dUn8POCnRo', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(71, 'Doug Schamberger', 'kim.schneider@example.org', NULL, 54, 'ansel69', '495 Forest Trail\nLake Emoryfurt, AR 22806', '1-641-705-3858', NULL, '1.00', 9, '2022-11-14 16:50:16', '$2y$10$cg4oqmfuajh0MNcvr65x2eYhw5jbwTzaXBRWbLL2Icch/rRH6gwuq', '626479.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '289000000', 'active', 1, 0, 0, 'yrXiyk8hfa', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(72, 'Carmela Bruen', 'ibarrows@example.com', NULL, 14, 'joaquin.grimes', '191 Wolf Forest\nHayleemouth, MO 68176', '1-561-704-6602', NULL, '1.00', 6, '2022-11-14 16:50:16', '$2y$10$wkHCWX26muzCT7/yG.fateO5/5H2EuogFqA9i6Jf3rABt.icp6D2G', '339939.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '311105000000', 'active', 0, 0, 0, 'Fjvw0G9t1y', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(73, 'Elna Stamm', 'mallie.kunde@example.net', NULL, 200, 'huels.jerrod', '21062 Audie Lodge Apt. 160\nEladiobury, NV 96729-4765', '1-283-942-6865', NULL, '1.00', 6, '2022-11-14 16:50:16', '$2y$10$bFlIeKP8ym2DJEpyKBPAruX5dzN1M832UOyOO8WMVLnQhX.Ifdmn2', '793606.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '159211000000', 'baned', 1, 0, 1, '04SkzbOesv', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(74, 'August Wolf', 'jonas.mosciski@example.org', NULL, 129, 'durgan.guadalupe', '4420 Legros Harbor Suite 642\nJohnsburgh, ID 71602-0532', '+1.848.279.2706', NULL, '1.00', 9, '2022-11-14 16:50:16', '$2y$10$hl3HbSSqy1HCgshlbKKHRO8pEGgy/FQdPY8Vp0Zg7zpoqNy5kyKvu', '717017.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '52865000000', 'active', 0, 0, 1, 'eZZ0rizrC1', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(75, 'Irma Wilkinson', 'muriel04@example.com', NULL, 62, 'guy.kub', '27239 Karlie Haven Apt. 640\nSauerton, NY 79147-8567', '1-628-895-0274', NULL, '1.00', 5, '2022-11-14 16:50:17', '$2y$10$UssGbMSg05FRB9vuDC3v2eh4osQpqxya8FtxYqEW0xP0n7wqNL1MC', '21629.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '671123000000', 'baned', 0, 0, 0, 'cpGRwfOGy6', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(76, 'Adella Welch', 'carlee.marquardt@example.com', NULL, 159, 'orin.volkman', '23362 Glover Course\nLebsackshire, MA 23719-6768', '+1 (770) 426-5941', NULL, '1.00', 2, '2022-11-14 16:50:17', '$2y$10$kaVgGWgDJMTSzqUPyA0m0ekvLOI80O.iN/9WPdUk.FDtMpTOljtGG', '41335.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '734508000000', 'baned', 1, 1, 1, 'jod9f7mr5Y', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(77, 'Stacey Gusikowski', 'ruecker.deion@example.net', NULL, 186, 'wolff.karolann', '3560 Godfrey Village Apt. 373\nNorth Saul, NH 84247', '517.399.1450', NULL, '1.00', 2, '2022-11-14 16:50:17', '$2y$10$BDVg8jRvhJJds8UGjYNItezNd7u3vrDvmlFUCQPJozuSqCFmLZXNS', '550329.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '895343000000', 'active', 1, 0, 1, '5Hnbi5k0CN', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(78, 'Finn Halvorson', 'leslie16@example.net', NULL, 7, 'kirstin.green', '80664 Beatty Key\nJakobborough, MT 01885-8545', '+1-321-962-1909', NULL, '1.00', 1, '2022-11-14 16:50:17', '$2y$10$ekkTrJqPWiiPF2LOno0l/OGp.sCIZ3bnOL1F9knJfodOa5TL0pKh6', '939442.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '338469000000', 'baned', 0, 1, 1, '1g1hl8reaN', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(79, 'Brisa Schneider', 'adolfo66@example.net', NULL, 153, 'greenfelder.arielle', '98471 Stokes Lock Apt. 789\nAuerbury, IL 53044', '(610) 336-0200', NULL, '1.00', 2, '2022-11-14 16:50:17', '$2y$10$lBCEUP2grAsEC.r2uy2aZ.8.2/p//7vCzF4fA5aOAGAtJKnvBFXxO', '285348.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '861001000000', 'active', 0, 1, 1, 'DKWDq1mDMI', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(80, 'Myrtle Gleason', 'elvie32@example.org', NULL, 171, 'tconsidine', '3097 Rath Overpass Suite 073\nOtiliamouth, AZ 81254', '740-806-9365', NULL, '1.00', 6, '2022-11-14 16:50:17', '$2y$10$OXtcmHrHkeYYTGtC8ne3vOXsVoKNF/50Z6MPmMueWS0woU1C2ALDa', '117168.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '312174000000', 'baned', 1, 1, 0, 'QvsPkeEn4V', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(81, 'Haskell Gusikowski', 'laurel.howell@example.com', NULL, 130, 'cali.dietrich', '9278 Senger Pike Suite 661\nRyanton, SC 77792', '+17148600026', NULL, '1.00', 6, '2022-11-14 16:50:18', '$2y$10$fCwi.sc00L.OPTW14TNvFubz83YrJ.jFR..1xY4oW6c8t98zl3epO', '933173.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '525885000000', 'active', 0, 0, 1, 'bX3PwVWurw', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(82, 'Layla Ruecker', 'jast.lucas@example.net', NULL, 155, 'laurel.torphy', '4841 Kayley Spring\nWest Jessie, MI 28141-7747', '716.489.2202', NULL, '1.00', 3, '2022-11-14 16:50:18', '$2y$10$0GPtHCflhqxa3r2PmOS0HecaeE7CTE1/HYabJ7NrLKLol5jGTmb7.', '801018.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '582364000000', 'active', 0, 0, 0, 'IGAg7900Aw', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(83, 'Blake Yost', 'connelly.melyna@example.net', NULL, 94, 'santos79', '983 Roberts Overpass\nHeathcotehaven, OR 04791', '1-802-942-0133', NULL, '1.00', 1, '2022-11-14 16:50:18', '$2y$10$ZLnh1.uDxBCSi/brwLISFe.SUswaQRiryfDvi1hGGzpMSXQMkNBEO', '113987.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '455357000000', 'active', 0, 0, 1, 'mZzjg4FmaP', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(84, 'Verlie Mills', 'dalton16@example.net', NULL, 203, 'maude.raynor', '75015 Jeanie Land\nLabadiefort, WV 28937-1711', '757-921-1169', NULL, '1.00', 6, '2022-11-14 16:50:18', '$2y$10$3fU5mQe5PctSz/fM.N.p5eN08dU2gxuEFOQGibvzJyg8hufCCetV2', '867206.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '389694000000', 'baned', 1, 1, 0, 'A0H2wfpez7', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(85, 'Deshaun Barrows', 'tmayer@example.net', NULL, 116, 'zkuhic', '536 Herminia Land Suite 461\nSouth Napoleon, ME 74472-3033', '+1.669.272.0758', NULL, '1.00', 8, '2022-11-14 16:50:18', '$2y$10$Z6lb.iSgPD0V.0cqfUcqge1GH/c.5Y1lKdOLXQTJBLHg4Jc3shM1C', '496398.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '470800000000', 'baned', 1, 0, 0, 'UAxH2dNk4H', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(86, 'Daija Kiehn', 'velva.swaniawski@example.org', NULL, 56, 'cathy32', '949 Paula Ramp Apt. 499\nArnoside, NH 23682', '+1-630-947-6740', NULL, '1.00', 5, '2022-11-14 16:50:18', '$2y$10$BrOKb7EXW6n0oTHM2DHjHu/CI8uZndE15paHml83CMxd/5d64yqre', '426622.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '398198000000', 'active', 0, 0, 0, 'cHhzSgHnr2', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(87, 'Meggie Smith', 'nelle33@example.org', NULL, 65, 'nbergnaum', '772 Bradtke View\nSouth Dejon, NH 99827-0820', '+1-309-931-3077', NULL, '1.00', 3, '2022-11-14 16:50:18', '$2y$10$a3prnmOPx47UiN.1bzSs0O8hHmWiijkeEJgFViD2VyH/wOV5xgDna', '527161.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '417945000000', 'baned', 1, 1, 0, '5PJpoHncS8', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(88, 'Rogelio Jakubowski', 'howe.tierra@example.net', NULL, 74, 'jquitzon', '4502 Weston Walks Apt. 161\nDaisyfort, AZ 97328', '+1-303-558-7835', NULL, '1.00', 1, '2022-11-14 16:50:18', '$2y$10$eddit/HdDFF1.jA3gI3izevrQMIyulCBMhztlb5duDOWi9jNoUI6u', '263076.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '885738000000', 'active', 1, 0, 1, 'rfk0LBmNcZ', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(89, 'Camilla Wuckert', 'aiden.halvorson@example.org', NULL, 53, 'shannon03', '3953 Jerde Light\nNew Quincy, KS 29657-6673', '+1-463-648-6063', NULL, '1.00', 5, '2022-11-14 16:50:18', '$2y$10$rPjS2/9YTpaT3YT9SYDyn.hY1tSYuq6unEWgQDSCEn1dJo9LDy/pm', '453055.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '449900000000', 'baned', 1, 0, 0, 'DywKKtwqtq', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(90, 'Astrid Klocko', 'pbeahan@example.org', NULL, 73, 'melissa.gaylord', '14379 Alexandro Glen\nDakotachester, SC 84280-3733', '+1-610-759-6916', NULL, '1.00', 1, '2022-11-14 16:50:19', '$2y$10$tklmrtBAR4QIto60WL6stOQh0tepBb72KpHRBlC5axBgNSCwY.aRW', '181593.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '155798000000', 'active', 1, 0, 1, '8H0qxojaYO', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(91, 'Helga Langworth', 'herzog.zion@example.com', NULL, 33, 'littel.elisa', '66250 Gerda Neck Apt. 546\nKohlerhaven, AR 88288', '+1.917.714.4553', NULL, '1.00', 4, '2022-11-14 16:50:19', '$2y$10$B5zV7Uzx9RFiGuRE8hzTi.63UjyqZ6d/W13O56B9IUqVK7VfHuPLq', '454524.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '855183000000', 'active', 0, 1, 1, 'zaEUafsnyB', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(92, 'Devante Smitham', 'gilda08@example.net', NULL, 193, 'milan.powlowski', '25353 Wolff Spurs\nNew Keshawn, NC 39115-4610', '1-540-591-2324', NULL, '1.00', 2, '2022-11-14 16:50:19', '$2y$10$Z/knwt4qQn9aI0EnVlb6uu3f9AxU0UF7aPv3Ng3p3PDk8hfEc4Phe', '283581.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '39904000000', 'active', 1, 1, 0, 'Gel4uwAqSU', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(93, 'Delores Marquardt', 'erin68@example.org', NULL, 114, 'mgoldner', '57297 Lindsay River Apt. 086\nRobertashire, IL 90411-1151', '681.375.3245', NULL, '1.00', 9, '2022-11-14 16:50:19', '$2y$10$gx3TdJkp8v2vAMW8EOD1We.mo4Lo5QPlaSpvS8YdukWCm5xbDMpTW', '234406.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '899257000000', 'baned', 1, 0, 0, 'xtSsQ5uULW', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(94, 'Cortez Botsford', 'wuckert.bobbie@example.com', NULL, 25, 'darrin73', '55710 Harber Extension Suite 006\nSheilahaven, RI 50179', '1-603-504-1322', NULL, '1.00', 7, '2022-11-14 16:50:19', '$2y$10$lGjjJ0exEeGAP4J6X6N1Su1lO8ObK5cSNvCGsc37YhqOF9nFYyqJq', '3290.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '154408000000', 'active', 1, 1, 0, '1PGZ1n9Wwv', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(95, 'Arianna Runolfsdottir', 'vmoen@example.com', NULL, 153, 'zshanahan', '15901 William Course\nEwaldland, AK 55167-6241', '743.209.0431', NULL, '1.00', 2, '2022-11-14 16:50:20', '$2y$10$OTzKXqr37bW4MyALWXBfxuGlUtgpZXxUVqLDQkDbWHdlqielSfM5C', '153394.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '386205000000', 'active', 0, 1, 1, 'm7E53ev3Ga', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(96, 'Alexzander Lang', 'arch42@example.com', NULL, 21, 'juana.ohara', '4111 Lynch Track\nWest Vallie, WV 96131-2315', '+1 (443) 991-1681', NULL, '1.00', 9, '2022-11-14 16:50:20', '$2y$10$1uJy1aCT1VsaA2BCfD0JieWP.tjevUAzpz8EFwZASc4VDD5FXqODi', '420202.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '412221000000', 'active', 0, 0, 0, 'NFg819TW8v', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(97, 'Gideon Boehm', 'rosalyn.braun@example.org', NULL, 51, 'julianne85', '6974 Blanche Mall\nWintheisermouth, AZ 31571', '+17548394655', NULL, '1.00', 7, '2022-11-14 16:50:20', '$2y$10$65O.q9OKIeDP43hv.iQcVeQ20Yq00.vziPJtHiH8usAY23FBFhxbW', '169393.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '242670000000', 'active', 0, 1, 1, 'CdeuUefgC6', '2022-11-14 16:50:39', '2022-11-14 16:50:39', 'user'),
(98, 'Modesto Cruickshank', 'presley21@example.org', NULL, 109, 'nolan92', '25464 Lavon Hills Suite 851\nPort Leopoldotown, NJ 19724', '+1 (541) 522-3258', NULL, '1.00', 5, '2022-11-14 16:50:21', '$2y$10$4J2g0CeD9rcdqW3gdU2QEu2WVA5jXn67hIXxT6wzUieDpb1DD87wa', '709096.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '675826000000', 'baned', 0, 0, 0, 'qFxGeFRhEl', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(99, 'Chanelle Bosco', 'halvorson.marcelina@example.org', NULL, 143, 'qdickinson', '167 Gideon Mountain Suite 058\nSouth Hermina, OR 21655-5789', '+1-820-882-2172', NULL, '1.00', 5, '2022-11-14 16:50:21', '$2y$10$bztBTu8LDZ8su7BHLbUlPOkcoHLBrWs99HHat/Ldl0fRRIR.AT42S', '735674.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '444148000000', 'baned', 0, 1, 0, 'C4I5EQ1099', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(100, 'Waylon Gerhold', 'mccullough.ardith@example.net', NULL, 81, 'haleigh.morar', '758 Barton Fords Suite 859\nSandrinefurt, LA 23099', '1-212-340-1148', NULL, '1.00', 6, '2022-11-14 16:50:21', '$2y$10$X1.Njzn.jrlI5RHmrzh9nOWmUfU7uA9GhiqT04581tCl7HA/us.T.', '559186.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '593122000000', 'baned', 1, 0, 1, 'L6ewiQSmzQ', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(101, 'Keyon Borer', 'ayden.johnson@example.org', NULL, 159, 'dawn97', '514 Erin Landing Apt. 972\nSouth Brandon, PA 96326-0716', '(678) 465-9014', NULL, '1.00', 1, '2022-11-14 16:50:21', '$2y$10$xLYNihmd3RKxukkykp5TgOXUZmJ/bzqz.63Ood/QoN85l48YbeTui', '845055.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '316066000000', 'active', 1, 0, 1, 'In3F6timmC', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(102, 'Joy Trantow', 'weissnat.casimer@example.net', NULL, 98, 'columbus.watsica', '41270 Franz Coves Suite 584\nCliftonshire, OK 87321', '1-724-721-3772', NULL, '1.00', 5, '2022-11-14 16:50:21', '$2y$10$om23nddxl1pa5ZclYruubOS0CjUEFY7KEdWRNZukKaPUiXzi8f5zO', '789905.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '334969000000', 'baned', 0, 1, 0, 'jOAcV0EB6v', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(103, 'Rosendo Adams', 'ppurdy@example.org', NULL, 46, 'marco17', '80047 Steuber Crossroad\nWest Elmore, WA 89972-3543', '+1.215.395.8344', NULL, '1.00', 4, '2022-11-14 16:50:22', '$2y$10$xY5FRp3MOV8n1u6GlIxN6egC4rda0/B.FR2SiXsgUqWETOSNn6WkC', '784656.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '743107000000', 'baned', 1, 1, 0, 'jIIfP7fdyy', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(104, 'Duncan Kreiger', 'bauch.berniece@example.net', NULL, 28, 'wstreich', '301 Reid Stream Suite 488\nTorphytown, IN 67225-6597', '+1.515.622.2892', NULL, '1.00', 9, '2022-11-14 16:50:22', '$2y$10$EMHDDUqGkBc9myBE6ppIT.7Kxm0aKjip5vofbg.7IZVRWthdsjKQ6', '447301.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '856431000000', 'active', 0, 1, 0, 'DwpjneQExn', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(105, 'Julien Hessel', 'treva.macejkovic@example.org', NULL, 119, 'talon.jones', '8175 Streich Track\nEast Cristobal, MN 40568-5684', '801-328-5430', NULL, '1.00', 4, '2022-11-14 16:50:22', '$2y$10$2ptjPeCqp.kGP7mULPYGwOHY8eDajjDEg9f6ATKe5M6VTVHPRFdG6', '646043.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '106836000000', 'baned', 0, 1, 1, 'lniYSU3nYl', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(106, 'Leola Stanton', 'cwilderman@example.net', NULL, 137, 'darron.keebler', '1799 Everardo Haven Apt. 600\nDewaynehaven, IN 42690-8170', '(765) 962-4617', NULL, '1.00', 3, '2022-11-14 16:50:22', '$2y$10$i5I3bquKKEi1/PMF3fmyoufWG9dh/CB7UkIYOyL9DwIlhrTF1DP7S', '328074.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '747149000000', 'active', 1, 0, 0, 'DeCgAxcZW4', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(107, 'Riley Stiedemann', 'marjolaine.gibson@example.org', NULL, 150, 'alangworth', '59185 Xzavier Field\nLake Mayside, NJ 61505-1954', '(567) 351-8280', NULL, '1.00', 1, '2022-11-14 16:50:23', '$2y$10$3tyQncBtSAZ9qo5euKj/AeVw2VOVehSwkjWsUNqiUa.30SQphyCmS', '209076.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '95727000000', 'baned', 0, 1, 0, '7JEUQpnM3A', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(108, 'Eleazar Cassin', 'dovie.mueller@example.com', NULL, 52, 'rdaniel', '5451 Leo Gardens Suite 928\nNew Hayleeberg, OK 67271-5278', '520-417-5940', NULL, '1.00', 9, '2022-11-14 16:50:23', '$2y$10$KuWqOlbR8yb3dOoYbEv2Tuoia5LBAH2.Wsree.Y1.Th7uBNA9K54W', '239355.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '41980000000', 'active', 1, 0, 0, 'GAlsNFnhde', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(109, 'Dasia Dibbert', 'hegmann.lou@example.com', NULL, 46, 'cgoodwin', '73854 Phoebe Rapid\nTheamouth, WY 65131', '+18204457427', NULL, '1.00', 6, '2022-11-14 16:50:23', '$2y$10$ZphGrE/ODdgMnnqHAuQfM.bdlKg8oLIE0qD22LurMXHN.G8.OmHNC', '880897.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '733028000000', 'active', 0, 1, 1, 'RWPMKLIdWX', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(110, 'Anthony Hane', 'phudson@example.org', NULL, 97, 'pcorkery', '57578 Baumbach Port Apt. 631\nLeannland, MD 87607-0454', '(618) 319-9830', NULL, '1.00', 5, '2022-11-14 16:50:23', '$2y$10$ZQGRyNnPXtAGlU3tb4Yhl.vFLTJs5HFMy9niGW0maCWk5N3t8.48e', '966057.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '917066000000', 'active', 0, 0, 1, 'cKQW54WO0q', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(111, 'Jamil Orn', 'thiel.elva@example.net', NULL, 14, 'kertzmann.jennings', '9278 Daphnee Dale Suite 520\nSouth Orion, VT 85349', '641-800-3080', NULL, '1.00', 3, '2022-11-14 16:50:23', '$2y$10$.ksck0KKAKp.yCgUAudeVu4UMC/4KvAds3/LPS5yFCi7eFYLrQ2ha', '289971.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '942315000000', 'baned', 0, 1, 1, 'BYnhYfWXk9', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(112, 'Jaylen Harris', 'cornell96@example.org', NULL, 113, 'rortiz', '23789 Lind Circles\nPort Susanbury, ID 39370', '+17142898997', NULL, '1.00', 9, '2022-11-14 16:50:23', '$2y$10$LYdZQaGc8m..lqzp34O6gOw7ZfG6pjjau5tsJhRVczOZrOh75slii', '417607.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '569130000000', 'baned', 1, 0, 0, 'C1SrYK0sTe', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(113, 'Bert Streich', 'oconner.eugene@example.com', NULL, 65, 'eliane.ohara', '217 Edmond Harbor Apt. 331\nSchneiderbury, TX 87650', '+1-570-677-0150', NULL, '1.00', 8, '2022-11-14 16:50:24', '$2y$10$R3XXmnCaT66n3No5ikrdeOG7iJorOj3RVONO/JDPjqm07rYvIJuvu', '167763.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '276589000000', 'active', 1, 1, 0, 'hPxvJnf4Ew', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(114, 'Nicole Baumbach', 'bmclaughlin@example.net', NULL, 63, 'juliet.schulist', '50203 Boehm Ports\nLake Favian, KY 57100-4530', '+1-680-743-1820', NULL, '1.00', 7, '2022-11-14 16:50:24', '$2y$10$AmIEyXH4dcbM.tIzHnBwBeWTYXz0.cYANHxrDdDjd/x8LRoxToTC2', '881814.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '411151000000', 'active', 0, 1, 1, '8P0yQEpspv', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(115, 'Casimer Lakin', 'althea09@example.com', NULL, 47, 'arippin', '48025 Swift Alley Apt. 128\nPort Bernardo, DC 17784-9081', '661-457-8927', NULL, '1.00', 1, '2022-11-14 16:50:24', '$2y$10$0w.8IV8OMrIeclxiNreZRupcWaSG6ON9mlE8j3d.bKJHG9fL18iPS', '796259.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '886233000000', 'active', 1, 0, 0, 'HPmMbfki2P', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(116, 'Wilburn Leuschke', 'jammie33@example.org', NULL, 97, 'kaitlin.mayer', '8063 Fritsch Ways Apt. 187\nTracyton, WA 58084', '(779) 787-2622', NULL, '1.00', 3, '2022-11-14 16:50:24', '$2y$10$ezdNy6.3RffRI/EjvK1mfe.m/qHuNqEXGTVC9rW5wSh3/trEhVnZK', '539656.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '967115000000', 'baned', 1, 1, 0, 'jFvCo9HF6r', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(117, 'Carmelo Barton', 'raegan75@example.org', NULL, 118, 'pablo.walsh', '46501 Ankunding Fork Apt. 332\nWintheiserfurt, NM 46802', '+1.202.210.8949', NULL, '1.00', 2, '2022-11-14 16:50:24', '$2y$10$xjeuGEFpPtdA4pxlQcWl7OZB9Nvyb1OneglClVZdi79uawIR326O6', '521253.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '317717000000', 'baned', 0, 0, 0, '3VAu3cjqfz', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user');
INSERT INTO `users` (`id`, `name`, `email`, `account_no`, `ref_by`, `username`, `address`, `phone_no`, `date_of_birth`, `plan_expiry`, `plan_id`, `email_verified_at`, `password`, `investment`, `profit`, `commission`, `reward`, `reward_title`, `public_address`, `nonce`, `status`, `ev`, `mv`, `two_fa`, `remember_token`, `created_at`, `updated_at`, `user_type`) VALUES
(118, 'Barry O\'Keefe', 'cfeil@example.org', NULL, 20, 'sally.treutel', '239 Donna Isle Apt. 789\nToyfurt, AK 95174', '1-434-550-3099', NULL, '1.00', 8, '2022-11-14 16:50:24', '$2y$10$3tlzmJebHlzPS1Z/aIfieO77NAr8.lT1/hmXyrIvhvaSQLjCW/KT.', '692872.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '212264000000', 'baned', 0, 1, 1, 'yw6QH46NVg', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(119, 'Brendan Harvey', 'creinger@example.org', NULL, 23, 'mhoeger', '826 Madeline Valleys Suite 692\nTysonborough, OR 76178', '+17019033725', NULL, '1.00', 4, '2022-11-14 16:50:24', '$2y$10$8rJp5IlQu5caJ4R.I68zXu/doYmGx2PwPalFf9oBHo0CqBjBeHr66', '184759.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '691077000000', 'active', 1, 0, 0, 'y53cujQv5F', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(120, 'Dashawn Hickle', 'mturner@example.net', NULL, 78, 'lynch.percy', '337 Greenholt Light\nPort Reva, NJ 88332', '+12623145047', NULL, '1.00', 4, '2022-11-14 16:50:25', '$2y$10$FNc3rFxWGEy9H7xT/S7j2.2QZiMHagh1ZF.1MQF6kThIR76LIxw9u', '52086.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '267335000000', 'baned', 0, 0, 0, 'OJfaEUpyp4', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(121, 'Chance Fahey', 'williamson.tomasa@example.net', NULL, 154, 'dolly.quigley', '7487 Schulist Village Apt. 376\nEast Kylee, VT 07852-3276', '+1 (978) 595-0712', NULL, '1.00', 9, '2022-11-14 16:50:25', '$2y$10$3t2v8DIpMVA1KkeItHqIUuiywFeTpIbtn15tDrA0i6.WoSXTqSiuS', '524809.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '625257000000', 'baned', 1, 1, 0, 'Pi4eCJJErX', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(122, 'Earnestine Prosacco', 'jayden52@example.org', NULL, 112, 'crawford.lesch', '40569 Reyes Unions Apt. 076\nLake Anyaland, MI 25818-3127', '838-475-2501', NULL, '1.00', 3, '2022-11-14 16:50:25', '$2y$10$r9/8sDtRDPTSV35RCsHiTexa3sGVyDy8pcM1h0uhqzrjvp84T74iS', '183569.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '266455000000', 'active', 1, 0, 1, 'qECENu1Z5Q', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(123, 'Cielo Wuckert', 'xquigley@example.org', NULL, 11, 'vergie.kuvalis', '8740 Towne Stravenue Apt. 717\nReymundoshire, MA 17015', '+1.719.716.0596', NULL, '1.00', 2, '2022-11-14 16:50:25', '$2y$10$wG9jjb/HBXV..RhwcztCge3KdmMRShnw6QPu/z8VTG.PuHm5GLSwO', '936001.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '854375000000', 'baned', 1, 1, 1, 'wbqJ7PwLoB', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(124, 'Layne Keebler', 'gmante@example.com', NULL, 123, 'bins.cordelia', '910 Williamson Isle Suite 893\nGeovanniton, AR 68385-6803', '+1.385.215.3268', NULL, '1.00', 2, '2022-11-14 16:50:25', '$2y$10$o7HSQzGPkaXnHn1ouBQrSuSvUaLwJ3utJjgu.oMUVIpKdHsCLZjmi', '229299.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '467513000000', 'baned', 0, 1, 0, 'NH4bacsjtt', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(125, 'Hayden Steuber', 'meaghan.medhurst@example.org', NULL, 77, 'vbarton', '6187 Raynor Prairie Apt. 914\nSouth Shaina, VT 51610', '(930) 910-4953', NULL, '1.00', 8, '2022-11-14 16:50:25', '$2y$10$i6uPSbJdUQlhHjMBRunCcOATh72MbEi/lK4.VJ0jUvLU1ELKZSmMO', '845302.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '50474000000', 'baned', 1, 0, 1, '7a8HSmUDqD', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(126, 'Madisyn Powlowski', 'lauren.stark@example.net', NULL, 152, 'kattie.kassulke', '8301 Emmie Shore Apt. 974\nGuillermoshire, NM 93681-3509', '(407) 796-0060', NULL, '1.00', 9, '2022-11-14 16:50:25', '$2y$10$Y23h8mh67jzwKCZo9M/Zy.ZlibCu2J7Szo0rPa7OYWJfR2AuxDGfW', '792320.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '154956000000', 'baned', 1, 1, 1, 'v4hlHD87dw', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(127, 'Lera Johns', 'maegan83@example.com', NULL, 165, 'eschroeder', '130 Mante Prairie\nEberttown, VA 44881', '+1-925-339-2943', NULL, '1.00', 4, '2022-11-14 16:50:25', '$2y$10$j./uJgmrtE/pLi8pSGuRuuguPZTmL6.aDNxJCabky.4ExDAv2z7rm', '95497.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '227149000000', 'baned', 0, 0, 1, 'H4H9t62gSm', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(128, 'Carleton Kassulke', 'bahringer.beverly@example.org', NULL, 133, 'sydnee.emmerich', '55167 Rubie Circles Suite 172\nZettafort, SC 01166-3429', '+12762952373', NULL, '1.00', 1, '2022-11-14 16:50:25', '$2y$10$f7hbL47Vbl0M45ZbHvqbn.blsxpp4JP5MUj9xwQFJzj9XMq8emcwa', '94365.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '803476000000', 'active', 0, 1, 0, 'pUWDnWcRaU', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(129, 'Sallie Marks', 'tabitha.hermann@example.net', NULL, 124, 'carroll56', '199 Bridgette Centers Suite 905\nNorth Giovanni, VA 68931-3556', '(445) 437-7645', NULL, '1.00', 1, '2022-11-14 16:50:25', '$2y$10$l/4xWhZQDs3nfrcH0kxeHOYyq6G0gKvtqIvef0/yy7wh.TdQSM3D6', '619521.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '773452000000', 'active', 0, 0, 0, 'aIZnuFteKr', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(130, 'Camila Reynolds', 'jessica74@example.org', NULL, 166, 'heaven79', '280 Michale Corners Suite 571\nCassinberg, MD 08696', '1-765-225-5518', NULL, '1.00', 3, '2022-11-14 16:50:26', '$2y$10$lCSIPSxI2hBE3yvzBc2jQuVyv5peeIFKhtNlO5ZHr4YGqhlvRUcsa', '69562.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '815783000000', 'baned', 1, 1, 0, '4vWxOGZ8fG', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(131, 'Gabe Johnston', 'derek89@example.org', NULL, 193, 'nora.jacobi', '589 Corene Spring\nWest Manley, IN 22867', '+1-802-941-9000', NULL, '1.00', 6, '2022-11-14 16:50:26', '$2y$10$iHQ4SxeTuB46JNo9DWwUkejIrsKJksqPFtrcQPJxVK421zRPJsUgm', '205273.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '279137000000', 'active', 1, 1, 1, '9W0IitfJYp', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(132, 'Mckayla Lang', 'jamir93@example.net', NULL, 13, 'purdy.samir', '467 Gaston Skyway\nFloport, CA 68215-5979', '(563) 478-5746', NULL, '1.00', 5, '2022-11-14 16:50:26', '$2y$10$qyaEvscYh2nUvqk0diPOIueITSh9t79wD854aEabrChOfUMJ6O6PK', '918029.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '341438000000', 'baned', 1, 1, 1, 'KdGuobXJDl', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(133, 'Hermann Hermiston', 'mafalda.kozey@example.org', NULL, 185, 'romaguera.joanne', '73859 Ilene Road Apt. 466\nJudsonmouth, MS 16884', '(254) 264-9734', NULL, '1.00', 4, '2022-11-14 16:50:26', '$2y$10$DABcZfh9sz8ICGVcCKp4DOFcM85fV2f7D//VCvzSAec98t/sL/37i', '743212.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '723656000000', 'baned', 0, 1, 0, 'E5uLnPZj1I', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(134, 'Chadrick Kulas', 'vboyer@example.net', NULL, 29, 'mosciski.cleo', '191 Macejkovic Crossroad Suite 796\nSouth Noeliamouth, MO 16163', '+1-478-220-7150', NULL, '1.00', 3, '2022-11-14 16:50:26', '$2y$10$ORatD2N.WGwV5MHXGzK5Vu4Wd0Zs0Reb6tsqkD50iC8B//Xvt4roG', '132064.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '116835000000', 'active', 0, 1, 0, 'SwOj0oWAWv', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(135, 'Ernesto Wilkinson', 'vaughn64@example.com', NULL, 159, 'xfeeney', '957 Alexzander Plain Suite 125\nNew Arianemouth, GA 58346-0704', '+14427148728', NULL, '1.00', 8, '2022-11-14 16:50:26', '$2y$10$sxob.WmfilvckZYMelM5Nu1Fs5danVcFxNs7OT4YGgH3tFBx21QqC', '783661.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '51033000000', 'active', 1, 0, 0, 'eEhihxJWHe', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(136, 'Chester Hegmann', 'bode.faustino@example.net', NULL, 165, 'danial30', '862 Newell Manors\nLake Effieside, MS 21618', '+1-216-976-6913', NULL, '1.00', 4, '2022-11-14 16:50:26', '$2y$10$udt2bT9QOtBNHoL4SY/9vuSq9EA6JH4ESga.RDBUYZrEZP0p45fWa', '920413.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '192146000000', 'active', 1, 1, 0, 'Owgt6qll7N', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(137, 'Kristian Bauch', 'tanya.rippin@example.com', NULL, 159, 'fprohaska', '449 Kunde Plaza\nSouth Asia, NE 79276-0148', '402.427.6618', NULL, '1.00', 3, '2022-11-14 16:50:26', '$2y$10$Cvy88jilm9gGIB3esiLEvuBLMjlltz.c5hVRYPuIpQFz5u9D24UmO', '15490.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '38703000000', 'active', 0, 1, 1, 'PINeiMByYO', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(138, 'Jaylin Steuber', 'maia.torp@example.com', NULL, 165, 'drice', '24355 Eleanora Junction\nRutherfordfort, AL 73175-5454', '(445) 397-0367', NULL, '1.00', 6, '2022-11-14 16:50:27', '$2y$10$cGNYs43Bv36EyrHP6abxyOYkTgDXJjHo4wuedG9cBmLFrKa2fs8ZC', '940981.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '852752000000', 'active', 1, 0, 1, '0GIlx6DeN1', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(139, 'Jon Zulauf', 'elyse.fritsch@example.net', NULL, 76, 'elissa95', '657 Celestino Well\nSouth Heavenfurt, OR 57700-6461', '(646) 578-7047', NULL, '1.00', 5, '2022-11-14 16:50:27', '$2y$10$oI7UqUesH6nmrGiPGqQwNeJpuoFnBM1RKGWoe6wCgaKTwKhwujVN6', '862286.00000000', '0.00000000', '0.00000000', '2000.00000000', 'Diamond', NULL, '208925000000', 'active', 1, 1, 1, 'n9cPZ3i1bL', '2022-11-14 16:50:40', '2022-11-14 16:50:43', 'user'),
(140, 'Vaughn Jast', 'beth.bailey@example.com', NULL, 195, 'green.mikel', '540 Marquardt Forges\nLake Kareem, NM 95097', '657-201-0945', NULL, '1.00', 7, '2022-11-14 16:50:27', '$2y$10$sa55kZ5tbVtbLdJ1DP7vbunJIeLij//0jBRKsUwidNFxfvdQ2b6Cu', '864359.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '252154000000', 'active', 1, 1, 1, 'eannM6vmVx', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(141, 'Tyreek Price', 'kaia.schamberger@example.com', NULL, 103, 'aturner', '4681 Heathcote Rapid\nEast Marcelino, MO 67543', '417.621.0995', NULL, '1.00', 4, '2022-11-14 16:50:27', '$2y$10$BMc.WJfwaH7IA0oftw9jqOAo6uq6J8rfiHdwqIZ7ihYWs3O83v2RW', '997942.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '165948000000', 'active', 1, 0, 0, 'eeuoRWIRtt', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(142, 'Hermina Schulist', 'julian92@example.com', NULL, 98, 'vita.okuneva', '9084 Alphonso Lane\nMikaylafort, NH 02580', '+1-918-407-9940', NULL, '1.00', 8, '2022-11-14 16:50:28', '$2y$10$IHcTYbDjdThTOru3hlaQBu1N1zvFQH4ApfigSharTz2HYcviib2Ky', '256440.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '186847000000', 'baned', 0, 1, 0, 'hDBPC29Nof', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(143, 'Lonzo Cummerata', 'prosacco.ryleigh@example.net', NULL, 125, 'luigi72', '492 Odessa Bridge\nKeeblerville, MD 07043', '+1-940-605-9858', NULL, '1.00', 6, '2022-11-14 16:50:28', '$2y$10$2Bh9bzYCQqdL0j3fc9a9SeBlfjgmNbjVlBo.m22328DgF3eewQd0G', '64868.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '186079000000', 'active', 0, 0, 1, 'Q802DLvd1K', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(144, 'Courtney Runte', 'effertz.adrianna@example.org', NULL, 61, 'ksmith', '2045 Jerrold Islands\nNew Delphinechester, CA 58157-1121', '+1 (564) 238-6837', NULL, '1.00', 2, '2022-11-14 16:50:28', '$2y$10$0TOL.cdPKNhyzoteEoNFAOfmN.cQfKmAttIRe3TTgAoo3VD9ByiWO', '592989.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '639662000000', 'active', 0, 0, 1, 'VZZ7XBSYhj', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(145, 'Myrtice Torp', 'austyn.torp@example.com', NULL, 149, 'taya36', '68903 Xander Underpass Apt. 776\nJohnsview, MA 72126', '321.278.0015', NULL, '1.00', 8, '2022-11-14 16:50:28', '$2y$10$4MZGC2PCMgP4X4EcPBakEO.IkOQStxaGzotBtM2HNV5pTHgPHsSQ.', '503008.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '249765000000', 'active', 0, 1, 0, 'XGt3EipbPK', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(146, 'Simeon Kiehn', 'flakin@example.org', NULL, 68, 'morissette.mittie', '710 Haley Mills Apt. 327\nEverettview, LA 32385-7452', '+1 (330) 368-5060', NULL, '1.00', 7, '2022-11-14 16:50:28', '$2y$10$vYUEpynE9pvlkiq39og56uqrANFXyLCfzvm.sUC7wlp7IUI7OiHX.', '932873.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '814058000000', 'active', 1, 0, 1, 'PwnAEdIhTN', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(147, 'Albina Schaefer', 'ykertzmann@example.org', NULL, 70, 'padberg.aliza', '51617 Patricia Hill Suite 154\nKunzeton, MI 20985', '513-671-5341', NULL, '1.00', 4, '2022-11-14 16:50:28', '$2y$10$eL8KImPf58xifz2jLfH0Wun6ZGDtx5G6s643Sg3lwXuJdIoHvfiPC', '402583.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '836372000000', 'baned', 0, 1, 1, 'xrJGH0T8xF', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(148, 'Jessica Rutherford', 'vida.lebsack@example.com', NULL, 48, 'isobel24', '2956 Brakus Brooks Suite 582\nTheostad, MI 36995-7744', '573.204.9333', NULL, '1.00', 1, '2022-11-14 16:50:29', '$2y$10$FIBKy1R0.7LFoANoI6o0eOUc8vsQhHkltemUr4f3peFebIAVjzQHC', '734073.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '838968000000', 'baned', 0, 1, 0, 'XafJq0JQZ6', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(149, 'Hope Marvin', 'ekemmer@example.com', NULL, 35, 'katelyn.legros', '10899 Mosciski Views\nEltonhaven, NY 40017', '848.298.9662', NULL, '1.00', 7, '2022-11-14 16:50:29', '$2y$10$G8CXf5b2/gBVimeEWcMKTuCIqzMuczugOyuW3JINJQw/5r9PwM6Ha', '924477.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '595434000000', 'active', 1, 0, 0, 'zEWCXT14VJ', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(150, 'Eleazar Sawayn', 'xrutherford@example.org', NULL, 116, 'delia.cummerata', '627 Conn Tunnel Suite 738\nSouth Alexie, IA 22579', '+1 (478) 729-5802', NULL, '1.00', 1, '2022-11-14 16:50:29', '$2y$10$wG/bjGFThQMlQ4rzddV4aOiLFICAw7hIwubIpIsIoUJV4OYKuZgna', '127023.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '981100000000', 'baned', 0, 1, 1, 'pPr30PT6cr', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(151, 'Regan Williamson', 'lupe.conroy@example.com', NULL, 128, 'yhermann', '7566 Conner Drive Apt. 254\nEast Gisselle, DC 81900-2401', '+1-802-810-1651', NULL, '1.00', 7, '2022-11-14 16:50:29', '$2y$10$A3o6TiMran7ncrj0hl0ZMOSUpMls7JtPgBQ/e4e/g7HsYoao0XcVa', '171950.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '203559000000', 'active', 0, 0, 1, '6MDT1h9DIB', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(152, 'Eliezer Kilback', 'cjacobs@example.net', NULL, 68, 'ivory.barrows', '131 Cole Forest Suite 518\nRoryland, MT 21966-8262', '+1.272.996.7021', NULL, '1.00', 6, '2022-11-14 16:50:30', '$2y$10$1qiU7B4uhBdYvquYF425jeqirFgZFy2cHWZulRpud3UNx8hGtlqiK', '488700.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '85579000000', 'active', 1, 1, 1, 'aJFYkeeVj1', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(153, 'Monique Auer', 'daniella03@example.com', NULL, 102, 'larry.purdy', '8573 Walker Mountain Suite 227\nSouth Electa, AZ 71950', '1-502-867-4103', NULL, '1.00', 8, '2022-11-14 16:50:30', '$2y$10$08cy95q1Bh7FzP6l3oLWkOlBK9vnLM.RUDVdYJYjwLMl/4KvReFFG', '500794.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '143818000000', 'active', 1, 1, 1, 'q2WMyPHv2l', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(154, 'Katelyn Wilderman', 'keira60@example.org', NULL, 106, 'rdach', '904 Ivah Keys\nBuckridgemouth, WV 03521-1299', '(952) 902-7152', NULL, '1.00', 2, '2022-11-14 16:50:30', '$2y$10$JqjfhmyZ8BVWjjPgZhHDMuM1pozDYJmMsB1VPvc9g8svvjrxWoWnW', '87186.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '451930000000', 'baned', 1, 0, 1, 'yXIh9IEWoG', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(155, 'Adam Schamberger', 'kozey.burnice@example.com', NULL, 35, 'chris.walter', '747 Harvey Parkway Apt. 452\nMurphyton, NV 69696', '1-347-859-0863', NULL, '1.00', 9, '2022-11-14 16:50:30', '$2y$10$Q3fwelwSTc6qxu2Lag0.Sur0nZtMvwdH4KavF4rPEIjy0paudOtSm', '888527.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '417100000000', 'active', 1, 0, 0, '3IbgQiPEqF', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(156, 'Joanne Strosin', 'fern.olson@example.org', NULL, 163, 'ccollins', '210 Aliyah Divide Apt. 290\nSouth Rosario, NY 88270', '+1 (575) 860-8130', NULL, '1.00', 6, '2022-11-14 16:50:30', '$2y$10$pscjCNehVnPlQe0evQe2NemEq9mh76Ay8kq9e41mjXyiiAe0j7z6O', '767470.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '65111000000', 'baned', 1, 0, 0, 'hTaMMbhnzt', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(157, 'Ludie Mraz', 'lola05@example.org', NULL, 15, 'kreiger.violet', '466 Branson Fork Suite 455\nEast Marilou, KY 22787-2286', '+1-417-767-8765', NULL, '1.00', 8, '2022-11-14 16:50:30', '$2y$10$vlY18ZEY9CScpgACdF/4/OuDw4MaH3cy8F0mEcQUamCER8aqXkF1.', '123316.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '72456000000', 'active', 0, 1, 1, 'UQ5xFk8re2', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(158, 'Citlalli Kuhic', 'rice.golden@example.org', NULL, 121, 'america.bode', '7130 Mack Garden Apt. 931\nReichertfurt, DC 91643', '+1.667.889.5151', NULL, '1.00', 4, '2022-11-14 16:50:30', '$2y$10$3A6NYcKtEt80ZLQzbMW0JOHJSs2e5UJA/tjP2Tk05pU65k8uM6zfG', '747496.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '502591000000', 'baned', 1, 0, 0, 'rsL8r12reo', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(159, 'Bruce Muller', 'destany17@example.com', NULL, 151, 'keshawn89', '98672 Lubowitz Row\nDeckowborough, NC 07546-9502', '+1.713.586.4551', NULL, '1.00', 6, '2022-11-14 16:50:31', '$2y$10$n5ooJdggPKXEjtHoCW48V.DjXk20rQtlG3W/FQt7YhRcUqb/uAGIC', '119102.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '54910000000', 'active', 1, 0, 0, 'SqonDOoFnJ', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(160, 'Rey Berge', 'hollie.dickens@example.com', NULL, 46, 'nhaag', '643 Robel Parks Apt. 415\nNoraview, SD 14342', '832-667-8304', NULL, '1.00', 9, '2022-11-14 16:50:31', '$2y$10$J0pgjw8noWlL4iP6qYyu3e3jWiRt0qH9eDhL8TblLWFl4oFpk3ZCe', '758379.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '640637000000', 'baned', 1, 0, 0, 'A9zMNhmYRf', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(161, 'Aurore Wyman', 'okirlin@example.com', NULL, 7, 'medhurst.aditya', '66438 Haskell Centers\nWest Dorcas, OH 83528-2800', '1-541-593-0915', NULL, '1.00', 4, '2022-11-14 16:50:31', '$2y$10$OUIuvx9SU2gXBOGjHu/rT.q6aKUxcZCEobXRoabwd50olAPet0Vx6', '962476.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '292897000000', 'active', 1, 0, 0, '00eMhDsJFd', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(162, 'Sterling Pfeffer', 'samson.schmidt@example.com', NULL, 168, 'dkassulke', '26690 Nakia Fords Suite 427\nSavanahfurt, OK 65760-6452', '458-215-9441', NULL, '1.00', 2, '2022-11-14 16:50:31', '$2y$10$vxrNz4CmhDHNUT6.a8wi.eTxrby8f7gv/5rt6rFkck2DwIpGC6SDS', '57487.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '269824000000', 'baned', 1, 1, 1, 'pb3F3sKphe', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(163, 'Kiara Johns', 'blick.jayne@example.com', NULL, 9, 'kohler.rollin', '74712 Jayne Throughway\nLake Etha, MI 40898-9924', '+18703822442', NULL, '1.00', 8, '2022-11-14 16:50:31', '$2y$10$joKcn15ZKKUcfzSpNhTxYuvkjr/tAnheKEWQBAVMWebFf6dbA4jiy', '500584.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '995884000000', 'baned', 0, 1, 0, 'Qp9ebzOTFs', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(164, 'Beverly Wiza', 'laurence.ernser@example.com', NULL, 106, 'maxie.bergstrom', '544 Stephanie Mountains\nMorarton, LA 83401', '+1 (629) 665-1785', NULL, '1.00', 7, '2022-11-14 16:50:31', '$2y$10$tNlgJUzVfp3YfN.n9X.ssO.OOYhW9DHkuMSgS3ZW3cXDz3Dw.ojk6', '155643.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '88898000000', 'active', 1, 1, 0, 'TTDXwBPD0s', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(165, 'Ida Von', 'kane.goyette@example.com', NULL, 196, 'vschmidt', '23778 Prosacco Court Suite 034\nElectafurt, NH 32469', '1-949-756-3075', NULL, '1.00', 7, '2022-11-14 16:50:32', '$2y$10$a4AQx7Xe3P8LWR2T/OJ89.pDzZ1ZLeYMsCeVse3HWHTc6ODij3nFy', '719824.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '299037000000', 'active', 0, 0, 1, 'K0x1h6TGjW', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(166, 'Ben Nolan', 'emard.trenton@example.com', NULL, 189, 'constantin.mclaughlin', '210 Strosin Keys Apt. 660\nWest Kelsieside, UT 25564', '(863) 784-3834', NULL, '1.00', 1, '2022-11-14 16:50:32', '$2y$10$B1GcJNNZxMT5JH9hseWutuhcYvJoqeB46.0jI0NLeRqS3XmugxG2C', '130601.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '384679000000', 'active', 1, 0, 0, 'pTFYy6zlXx', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(167, 'Schuyler Berge', 'yturcotte@example.net', NULL, 166, 'jmcdermott', '9305 Gisselle Ville\nGabrielland, NV 66974-5203', '+1 (520) 354-4964', NULL, '1.00', 4, '2022-11-14 16:50:32', '$2y$10$BsTCu2BDiAWfOF3ODBwFZe2lp82h1kDJNxuRLtsNy/.pOdagkxP8K', '79539.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '397613000000', 'baned', 1, 1, 1, 'ywvhWxu4Q2', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(168, 'Vaughn Parker', 'jamar30@example.org', NULL, 150, 'laurence87', '1799 Joan Stream\nLake Kyla, ME 65731-4496', '+1-414-489-1683', NULL, '1.00', 9, '2022-11-14 16:50:32', '$2y$10$.GTB/g5S6sME2r32c3ydF.ii7PEStjbYQbRkzr9Gol10JedABnDl.', '504299.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '250876000000', 'baned', 1, 1, 0, 'cAQZXUgwmL', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(169, 'Tom Goldner', 'emmerich.myrtle@example.org', NULL, 99, 'elody.hintz', '18005 Tyler Mills Apt. 405\nSusiefort, SC 86835-0292', '336.434.9753', NULL, '1.00', 4, '2022-11-14 16:50:33', '$2y$10$mIDaelThFLo3Qg5BCRHVHuxWXx3Z9fBbXTLl3QfFDeKKFXjUr1n2m', '953556.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '32405000000', 'active', 1, 0, 1, 'zE7w2LgRWW', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(170, 'Columbus Hagenes', 'fay.emma@example.net', NULL, 167, 'krajcik.joanie', '914 Leila Ferry\nHelgaton, NE 38739', '1-857-973-5523', NULL, '1.00', 6, '2022-11-14 16:50:33', '$2y$10$AKVg7vw6i9PKjvWs0Jt00uW4hNtR28gTFTkaXUh4PNI5BxjStM6nC', '22669.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '535192000000', 'baned', 1, 1, 1, 'VaFpBvqFJ3', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(171, 'Jaida Von', 'lockman.arnold@example.com', NULL, 203, 'genevieve93', '84154 Jermain Route Apt. 861\nWest Alessandrofort, MA 72731-0408', '+1-253-927-3225', NULL, '1.00', 6, '2022-11-14 16:50:33', '$2y$10$agGPR1Zt1yAn7Aj6/2HK4uuA2fQ7NULn9FLAfXjJjdy/ARn8x8e6m', '702969.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '203440000000', 'baned', 1, 0, 1, 'zmqBVwo2dw', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(172, 'Cory Berge', 'adonis97@example.org', NULL, 126, 'bo26', '103 Hammes Pine\nNew Ila, FL 56695', '(973) 326-9901', NULL, '1.00', 5, '2022-11-14 16:50:34', '$2y$10$o28DM2V1eIFXR6xsPnC8GOuSompmA6CfXHKiLvzTr.Sbo4T8YAW3a', '212252.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '594930000000', 'baned', 0, 1, 0, 'vR3NJickMM', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(173, 'Verda Feil', 'summer.mante@example.net', NULL, 189, 'laura.quitzon', '78929 Wiegand Isle\nKshlerinshire, SC 37776', '+1 (856) 604-3372', NULL, '1.00', 9, '2022-11-14 16:50:34', '$2y$10$L8sZGLvhurp2DhAVhmloOuqE7sKkId0njt7pZzmG44z2fZaEIeZli', '634624.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '737739000000', 'active', 1, 1, 0, '7rdO9rNbG7', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(174, 'Rahul Braun', 'aliya.keebler@example.com', NULL, 88, 'dennis.thiel', '864 Ratke Trail\nWyattville, GA 60658', '+16782341045', NULL, '1.00', 7, '2022-11-14 16:50:34', '$2y$10$Sg3b2gcwElAxuySJm/imROZNm5LCWOZHvPNOmry6RMereikJyAAlm', '107797.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '62654000000', 'baned', 1, 0, 0, '35XQOTeuQW', '2022-11-14 16:50:40', '2022-11-14 16:50:40', 'user'),
(175, 'Alessandra Lehner', 'abner.denesik@example.net', NULL, 81, 'hpowlowski', '7496 Baumbach Passage Apt. 928\nNorth Jonasbury, KY 36772-5002', '(248) 299-9020', NULL, '1.00', 6, '2022-11-14 16:50:34', '$2y$10$l9lNWTL8TiYZgIRStQZJcexVmIlI2xLk92AMgFCauXuhhODlW2tNq', '14664.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '301165000000', 'active', 1, 0, 1, 'dxIOhdBA31', '2022-11-14 16:50:41', '2022-11-14 16:50:41', 'user'),
(176, 'Wayne Pouros', 'shemar.kunde@example.net', NULL, 112, 'melisa07', '666 Santos Streets\nMoenchester, MD 23271-6631', '352-843-3993', NULL, '1.00', 9, '2022-11-14 16:50:34', '$2y$10$9Y6vIHyRAp7ICNQaYJR3u.kA/9xKP3SEKF5NIPx2XeVIHMb2ca1.e', '639809.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '566566000000', 'baned', 1, 0, 0, 'ukqwUFZfTW', '2022-11-14 16:50:41', '2022-11-14 16:50:41', 'user'),
(177, 'Matilde Gislason', 'eulalia76@example.com', NULL, 200, 'becker.katrina', '6363 Frederick Square\nBergstromfort, NY 66647', '(757) 428-4409', NULL, '1.00', 9, '2022-11-14 16:50:34', '$2y$10$e2sXe2Sot7/eWUeePPRpzO8Wl1Ju5IDf83G7S.oxyiTMr3OMfCkRG', '440503.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '75686000000', 'active', 0, 1, 1, 'RKQJu05Our', '2022-11-14 16:50:41', '2022-11-14 16:50:41', 'user'),
(178, 'Patricia Keeling', 'eunice.schuppe@example.com', NULL, 139, 'fahey.yoshiko', '12693 Berta Mountains Apt. 418\nPort Stella, NV 29454', '539.268.6857', NULL, '1.00', 2, '2022-11-14 16:50:35', '$2y$10$rVzD.0HEqprBqEjZiKC.A.2.LI5jz/RCS7M8SyNkpLSktlf/oJEY.', '228837.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '211626000000', 'baned', 0, 1, 1, 'VfpkgYDKwe', '2022-11-14 16:50:41', '2022-11-14 16:50:41', 'user'),
(179, 'Kayden Stamm', 'crooks.johann@example.org', NULL, 103, 'nbreitenberg', '897 Rylan Loop Apt. 124\nWest Mylenechester, SD 98029', '970-912-7966', NULL, '1.00', 4, '2022-11-14 16:50:35', '$2y$10$EMeAUEHYoPi.XUe9BbsJ0.rQt8Ky5107iJ5qi9U9rNiXUVUBTJ59G', '435511.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '804266000000', 'active', 0, 1, 1, 'lUA30tqBPB', '2022-11-14 16:50:41', '2022-11-14 16:50:41', 'user'),
(180, 'Reggie Kunze', 'pcummerata@example.org', NULL, 55, 'kayleigh86', '6922 Dibbert Hollow Suite 165\nCiceroburgh, AK 84009-3448', '+1 (413) 762-2078', NULL, '1.00', 3, '2022-11-14 16:50:35', '$2y$10$04ounIU9689rOnabBbA6Dedw5T2UBI7s.pISMUeYdBDctftXGbJv.', '669093.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '677963000000', 'baned', 0, 0, 0, 'rVvLywzftj', '2022-11-14 16:50:41', '2022-11-14 16:50:41', 'user'),
(181, 'Julio Lowe', 'else.stracke@example.net', NULL, 37, 'hildegard.russel', '4323 Lucy Circles Apt. 908\nHandhaven, RI 02144-4887', '(256) 339-7042', NULL, '1.00', 3, '2022-11-14 16:50:35', '$2y$10$4xzNtYVEca08lc4YBFbrr.FkMjdbID0Q6ZxmUAJah6WfwXcCaAC4W', '690377.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '374949000000', 'baned', 1, 1, 1, 'bEreBqPtQH', '2022-11-14 16:50:41', '2022-11-14 16:50:41', 'user'),
(182, 'Gustave Romaguera', 'jazmin83@example.net', NULL, 12, 'eharvey', '8360 Eli Well\nKundechester, AL 05139', '+1-574-926-0070', NULL, '1.00', 2, '2022-11-14 16:50:35', '$2y$10$UrWP.PY1vP1sdDjyx.XKBuWLY1UvLuZIcKF3KQUkLtRy1ISmOVXfa', '402773.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '230990000000', 'baned', 1, 1, 0, 'fCpLuTjc5Q', '2022-11-14 16:50:41', '2022-11-14 16:50:41', 'user'),
(183, 'Loyce Schmitt', 'horace.gutkowski@example.net', NULL, 64, 'ritchie.alia', '28527 King Pine Apt. 589\nWest Kavon, MO 33239-4900', '+1.619.315.1676', NULL, '1.00', 9, '2022-11-14 16:50:35', '$2y$10$Sr8sppHAdbynRg.qqnXFK.4xAsGvJnxMt5j8G6HGtP3GWFzx5IWri', '940984.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '505052000000', 'active', 0, 0, 1, 'zajzgLobv9', '2022-11-14 16:50:41', '2022-11-14 16:50:41', 'user'),
(184, 'Abdul Pfannerstill', 'von.terrell@example.com', NULL, 124, 'ckoepp', '843 Toy Orchard Suite 209\nEast Philiptown, AK 98805-2443', '+1 (878) 731-9141', NULL, '1.00', 5, '2022-11-14 16:50:36', '$2y$10$vLE28xmQndITXdcA2JQWluCvW6/x98E23SjbShYx9pb832cFxX9Pa', '283231.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '623731000000', 'active', 1, 1, 1, 'Ww6mVGhpSp', '2022-11-14 16:50:41', '2022-11-14 16:50:41', 'user'),
(185, 'Elva Abbott', 'gjakubowski@example.com', NULL, 178, 'abbey02', '5649 Johns Extensions Suite 588\nPurdymouth, WY 06591-0104', '1-708-741-7596', NULL, '1.00', 4, '2022-11-14 16:50:36', '$2y$10$p0Y202/5u0U8x28y8ksDa.dSp9BaPSjF59tAzy775qmT24CWzFKmG', '580415.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '125742000000', 'active', 1, 1, 0, 'gTLzbxs7Xj', '2022-11-14 16:50:41', '2022-11-14 16:50:41', 'user'),
(186, 'Carissa Wolff', 'green.lorenz@example.net', NULL, 120, 'jazmin.bauch', '61963 Ledner Expressway\nOberbrunnerview, MN 83252', '1-734-446-5480', NULL, '1.00', 2, '2022-11-14 16:50:36', '$2y$10$BHaxQ5s/2rg8avZ/NZVaguV2vkyGvp7Oi2fy5F8Q9I4knD8Ik3NrK', '494811.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '569380000000', 'active', 0, 1, 1, 'aK2NIbeKBK', '2022-11-14 16:50:41', '2022-11-14 16:50:41', 'user'),
(187, 'Junius Stroman', 'flarson@example.net', NULL, 134, 'durgan.mckenna', '8332 General Valleys\nPort Eliezerchester, MD 81385', '1-734-974-2398', NULL, '1.00', 1, '2022-11-14 16:50:36', '$2y$10$DH5y2QwDGZHLaBI9pxoQsOTX1/.YSyY9uZJLOVplpCwYNA9qAnVVO', '478811.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '520625000000', 'active', 1, 0, 1, '0X7n0xcFRk', '2022-11-14 16:50:41', '2022-11-14 16:50:41', 'user'),
(188, 'Bradley Lindgren', 'wgrimes@example.net', NULL, 158, 'lucy69', '2128 Mitchell Fork\nPort Vida, SD 72448-0094', '+1-859-706-3069', NULL, '1.00', 9, '2022-11-14 16:50:36', '$2y$10$9J9H.7D/F7ls2RpdFaUgI.va.8ZAex7/1Cfy4Sp..cTSfdEty/TAa', '229317.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '195451000000', 'active', 0, 0, 1, 'QvJ7iNd6GE', '2022-11-14 16:50:41', '2022-11-14 16:50:41', 'user'),
(189, 'Susie Hintz', 'aliya03@example.com', NULL, 133, 'iberge', '10963 Michael Islands\nD\'Amoreville, PA 28171-5556', '+16618545050', NULL, '1.00', 7, '2022-11-14 16:50:37', '$2y$10$1cJb73P6u5qkpGfXJ6I/YOmOvCM3X62VTiQher9v.HLHdf8gs1vCu', '904349.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '923722000000', 'active', 0, 1, 0, 'MufwLQIHHm', '2022-11-14 16:50:41', '2022-11-14 16:50:41', 'user'),
(190, 'Ashly Steuber', 'schmidt.santina@example.net', NULL, 109, 'jimmie.effertz', '71700 Ledner Park\nPort Cicero, SC 38493', '231.583.2116', NULL, '1.00', 1, '2022-11-14 16:50:37', '$2y$10$RX.ZoCAdmIReIse5HuQBaOADxzlNQkOlq95Bdzcw5nzHS8VaOSjiO', '699198.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '316225000000', 'active', 1, 0, 0, 'WDIkO5Npc1', '2022-11-14 16:50:41', '2022-11-14 16:50:41', 'user'),
(191, 'Samir Considine', 'alfreda.christiansen@example.com', NULL, 65, 'izaiah.herzog', '21330 Hermann Land\nLubowitzside, FL 39577', '(930) 293-6924', NULL, '1.00', 3, '2022-11-14 16:50:37', '$2y$10$r5HqVU7Rw/2iqWZUj/OhDumXdA.Ru3/a0CGLPxfK00597liP.XuzS', '397725.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '30045000000', 'baned', 0, 1, 1, 'J0u2s7sKXy', '2022-11-14 16:50:41', '2022-11-14 16:50:41', 'user'),
(192, 'Brody Marks', 'lang.brendon@example.org', NULL, 66, 'remington81', '985 Hermann Union\nEmiliebury, MD 37811', '304-332-7511', NULL, '1.00', 6, '2022-11-14 16:50:37', '$2y$10$KJWFsYkTHnoXEw8dBX7kyuDUouqAuqKDxvwGelY01qRGo230eL/Ye', '870374.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '893338000000', 'baned', 0, 0, 0, 'qKzpoD7vKs', '2022-11-14 16:50:41', '2022-11-14 16:50:41', 'user'),
(193, 'Keshaun Farrell', 'derek.schaden@example.com', NULL, 119, 'ebony74', '17828 Guadalupe Street Apt. 048\nWest Daphney, NM 46031-6291', '689-776-4658', NULL, '1.00', 3, '2022-11-14 16:50:37', '$2y$10$ZXyjR30t4meXNkTIVl6f3uK1Wc5DCbDYf/jTTHTRnWzhTQccsZrkq', '888240.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '458799000000', 'active', 1, 1, 1, 'ZoyCyWLwEq', '2022-11-14 16:50:41', '2022-11-14 16:50:41', 'user'),
(194, 'Vena Dare', 'baumbach.santino@example.org', NULL, 175, 'lemke.domenico', '9001 Ethyl Fords\nNew Roberta, SC 36435-9777', '+1-239-902-7622', NULL, '1.00', 5, '2022-11-14 16:50:37', '$2y$10$uQ46WBdu5pxwbg1dHvqaa.341vYI2471jFewwGI..8WqXv78BOV5u', '423955.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '363027000000', 'active', 0, 1, 0, 'HQ3yHSujd6', '2022-11-14 16:50:42', '2022-11-14 16:50:42', 'user'),
(195, 'Makayla Witting', 'kyler.dietrich@example.net', NULL, 79, 'kale89', '8548 Dortha Vista\nPort Wallace, LA 89475-1605', '1-781-963-0307', NULL, '1.00', 4, '2022-11-14 16:50:37', '$2y$10$a/gmRG0N1HYc6L2n1lm7kOxeP7F31VfFGwa92/RmzyePlnLGgVlqC', '145171.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '218978000000', 'active', 1, 1, 1, 'mvi4yE8hkR', '2022-11-14 16:50:42', '2022-11-14 16:50:42', 'user'),
(196, 'Liam Kulas', 'eula.armstrong@example.com', NULL, 122, 'cletus27', '3679 Thompson Well\nLake Ernest, MO 81656-3387', '+1 (339) 408-4732', NULL, '1.00', 5, '2022-11-14 16:50:37', '$2y$10$snCcL1hmP4G0xCsPEVp1Ju4Lsct0ByjM9rgytXjvf728jHwbXXGfa', '435495.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '943080000000', 'baned', 0, 1, 0, 'ouuSwzsGF0', '2022-11-14 16:50:42', '2022-11-14 16:50:42', 'user'),
(197, 'Rickie Kirlin', 'neoma87@example.org', NULL, 199, 'ron.farrell', '45010 Delfina Manor\nMelvinville, DE 34940-3741', '1-586-730-1639', NULL, '1.00', 5, '2022-11-14 16:50:38', '$2y$10$nldKO3gqDIf1FA2j2B/n7up3NK/RpMEe4LakPuLxwaAXDp1st4qWS', '941076.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '422973000000', 'baned', 0, 1, 1, 'TBz8GurYXI', '2022-11-14 16:50:42', '2022-11-14 16:50:42', 'user'),
(198, 'Madyson Carter', 'durgan.novella@example.net', NULL, 31, 'janick04', '40240 Meda Crossroad Apt. 672\nRohanview, TX 07462-8722', '+1 (828) 624-2082', NULL, '1.00', 1, '2022-11-14 16:50:38', '$2y$10$U6Sdg5c9oP7gpQ7vTjeTS.3B34CoXrMKsmm6knR0VivY4juxn92.q', '853036.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '413951000000', 'baned', 0, 1, 1, '72KXgZespJ', '2022-11-14 16:50:42', '2022-11-14 16:50:42', 'user'),
(199, 'Lessie Daniel', 'margaretta72@example.com', NULL, 38, 'phackett', '56032 Damaris Vista Suite 307\nEast Margaretfurt, IA 40686-3208', '757-816-9692', NULL, '1.00', 4, '2022-11-14 16:50:38', '$2y$10$e0sH6mJvxRyj9rP6mQg9J.AZk1mntwCQjquX40gkc0cdmYvLrKfg.', '264420.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '566709000000', 'active', 1, 0, 1, 'Nvby7DlZT3', '2022-11-14 16:50:42', '2022-11-14 16:50:42', 'user'),
(200, 'Loyal Heathcote', 'esteban08@example.org', NULL, 8, 'zena19', '193 Wilmer Mews Apt. 539\nCummingsmouth, SD 00188', '458-898-8222', NULL, '1.00', 6, '2022-11-14 16:50:38', '$2y$10$GaAwQ4pCSn91xYTYq2a4G./C.L84mD/3vTjpj8zVEglKzeJnc1R6q', '229715.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '186148000000', 'baned', 1, 1, 0, '4dr6ZITyxz', '2022-11-14 16:50:42', '2022-11-14 16:50:42', 'user'),
(201, 'Admin', 'admin@stonearn.com', NULL, NULL, 'admin', NULL, NULL, NULL, '1.00', NULL, '2022-11-14 16:50:42', '$2y$10$PBfARym7wm8NyXWirgHgROjhHwM/aIyYI6SDhMJ34sumsBVisujDG', '0.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '220010000000', 'active', 0, 0, 0, NULL, '2022-11-14 16:50:42', '2022-11-14 16:50:42', 'admin'),
(202, 'staff', 'staff@stonearn.com', NULL, NULL, 'staff', NULL, NULL, NULL, '1.00', NULL, '2022-11-14 16:50:42', '$2y$10$zKI.loGjtEKmta8Es/O5FOyLafNgo56tm2EV7s.rbdM6iLtdtKfXe', '0.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, NULL, '683927000000', 'active', 0, 0, 0, NULL, '2022-11-14 16:50:42', '2022-11-14 16:50:42', 'staff'),
(203, 'User', 'user@stonearn.com', NULL, NULL, 'user', NULL, NULL, NULL, '1.00', 1, '2022-11-14 16:50:42', '$2y$10$/YrfXfDJdyHTZ3gYZGYdjOVbFZtUdkAbMoab9qzDU3zMOD8e845FK', '5000.00000000', '0.00000000', '0.00000000', '0.00000000', NULL, '0x4e6ec31f1b774ee690ff5fdc2ec7f4ad371a8cab', '33838000000', 'active', 0, 0, 0, NULL, '2022-11-14 16:50:42', '2022-11-14 11:55:18', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_logins`
--

INSERT INTO `user_logins` (`id`, `user_id`, `user_ip`, `location`, `browser`, `os`, `longitude`, `latitude`, `country`, `country_code`, `created_at`, `updated_at`) VALUES
(1, 1, 'sdfghjkjhgfds', 'Lorem Lahore', 'Chrome', 'Window', '30.1575° N', '71.5249° E', 'Pakistan', '+92', '2022-11-14 16:50:42', '2022-11-14 16:50:42');

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
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plans_name_unique` (`name`);

--
-- Indexes for table `plan_levels`
--
ALTER TABLE `plan_levels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plan_levels_plan_id_foreign` (`plan_id`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rewards`
--
ALTER TABLE `rewards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_logins_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `plan_levels`
--
ALTER TABLE `plan_levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rewards`
--
ALTER TABLE `rewards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `plan_levels`
--
ALTER TABLE `plan_levels`
  ADD CONSTRAINT `plan_levels_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`);

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD CONSTRAINT `user_logins_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
