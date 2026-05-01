-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2026 at 03:49 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `baddiecloset`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_subscribers`
--

CREATE TABLE `newsletter_subscribers` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` varchar(20) DEFAULT 'active',
  `subscribed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `total_price` decimal(12,2) NOT NULL,
  `payment_method` varchar(20) DEFAULT 'COD',
  `order_status` enum('pending','confirmed','out_for_delivery','delivered','cancelled') DEFAULT 'pending',
  `shipping_address` text NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `zip_code` varchar(20) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `item_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `size` varchar(50) DEFAULT NULL,
  `price_at_purchase` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(12,2) NOT NULL,
  `stock_quantity` int(11) DEFAULT 0,
  `image_url` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `sale_tag` varchar(50) DEFAULT NULL,
  `discount_percentage` int(11) DEFAULT 0,
  `video_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `name`, `description`, `price`, `stock_quantity`, `image_url`, `is_active`, `created_at`, `sale_tag`, `discount_percentage`, `video_url`) VALUES
(11, NULL, 'Trio Bear Besties Casual Tee', 'Three times the friendship, three times the comfort! This soft, classic-fit t-shirt features your favorite stackable bear trio in a cheerful hug. Perfect for everyday wear or cartoon marathons.', 2000.00, 99, '1774895971_SaveClip.App_643016323_18035255081589010_4006883576187056646_n.jpg', 1, '2026-03-30 18:39:31', 'NEW', 10, NULL),
(12, NULL, 'Shy Panda Peek-A-Boo T-Shirt', 'Shy Panda Peek-A-Boo T-Shirt', 1200.00, 99, '1774896048_SaveClip.App_645902502_18036365192589010_8778943956094127464_n.jpg', 1, '2026-03-30 18:40:48', 'Featured', 0, NULL),
(13, NULL, 'Ice Bear \'Silly Side\' Graphic Tee', 'Ice Bear is cool, but even a polar bear gets a little silly! Show your quirky side with this unique graphic of Ice Bear playfully sticking his tongue out. Made from ultra-soft cotton for all-day comfort.', 2000.00, 93, '1774896129_SaveClip.App_645797273_18036364757589010_8600319132575447466_n.jpg', 1, '2026-03-30 18:42:09', '', 0, NULL),
(15, NULL, 'Heritage Carpet Print Streetwear Tee', 'Weave history into your wardrobe. This premium cotton tee features a stunningly detailed, Persian-inspired carpet pattern on the back, complete with a creative \"paint-drip\" effect along the bottom hem. Available in both black and cream variants.', 3400.00, 0, '1774896276_SaveClip.App_645983962_18036365222589010_2450976280439682636_n.jpg', 1, '2026-03-30 18:44:36', '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_gallery`
--

CREATE TABLE `product_gallery` (
  `gallery_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  `file_type` enum('image','video') DEFAULT 'image'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_gallery`
--

INSERT INTO `product_gallery` (`gallery_id`, `product_id`, `file_url`, `file_type`) VALUES
(13, 11, '1774895971_SaveClip.App_643181519_18035255072589010_3205502200180850721_n.jpg', 'image'),
(14, 11, '1774895971_SaveClip.App_643087872_18035255063589010_2451431517452573248_n.jpg', 'image'),
(15, 12, '1774896048_SaveClip.App_645878560_18036365231589010_8966871690205436173_n.jpg', 'image'),
(16, 12, '1774896048_SaveClip.App_645801201_18036365204589010_859671524580499448_n.jpg', 'image'),
(17, 13, '1774896129_SaveClip.App_645805710_18036364775589010_8188699796701507790_n.jpg', 'image'),
(18, 13, '1774896129_SaveClip.App_645726338_18036364766589010_4693969504866130222_n.jpg', 'image'),
(22, 15, '1774896276_SaveClip.App_645816359_18036365240589010_6483276083535305520_n.jpg', 'image'),
(23, 15, '1774896276_SaveClip.App_645983962_18036365222589010_2450976280439682636_n.jpg', 'image'),
(24, 15, '1774896276_SaveClip.App_645809730_18036365213589010_7507207313964802077_n.jpg', 'image');

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `variant_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `variant_type` enum('size','color') DEFAULT NULL,
  `variant_value` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`variant_id`, `product_id`, `variant_type`, `variant_value`) VALUES
(24, 11, 'color', 'White'),
(25, 11, 'color', 'Soft Pink'),
(26, 11, 'color', 'Grey Heather'),
(27, 11, 'color', 'Navy'),
(28, 11, 'size', 'S'),
(29, 11, 'size', 'M'),
(30, 11, 'size', 'L'),
(31, 11, 'size', 'XL'),
(32, 12, 'color', 'White'),
(33, 12, 'color', 'Baby Blue'),
(34, 12, 'color', 'Mint Green'),
(35, 12, 'size', 'XS'),
(36, 12, 'size', 'S'),
(37, 12, 'size', 'M'),
(38, 12, 'size', 'L'),
(39, 13, 'size', 'S'),
(40, 13, 'size', 'M'),
(41, 13, 'size', 'L'),
(42, 13, 'size', 'XL'),
(43, 13, 'size', 'XXL'),
(58, 15, 'size', 'M'),
(59, 15, 'size', 'L'),
(60, 15, 'size', 'XL'),
(61, 15, 'size', 'XXL');

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `setting_key` varchar(50) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`setting_key`, `setting_value`, `updated_at`) VALUES
('global_page_title', 'BaddieCloset', '2026-03-31 10:37:50'),
('hero_cta_text', 'SHOP THE DROP', '2026-03-31 10:37:20'),
('hero_image', 'hero_image_1774953470.jpg', '2026-03-31 10:37:50'),
('hero_subtitle', 'FOR THE UNSEEN ELITE', '2026-03-31 10:37:20'),
('hero_title', 'Baddie Closet', '2026-04-12 08:50:29'),
('site_logo', 'site_logo_1774953489.gif', '2026-03-31 10:38:09');

-- --------------------------------------------------------

--
-- Table structure for table `size_guides`
--

CREATE TABLE `size_guides` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_type` enum('image','pdf') DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `size_guides`
--

INSERT INTO `size_guides` (`id`, `title`, `file_path`, `file_type`, `updated_at`) VALUES
(4, 'SHIRTS SIZE', 'vogue_guide_1774958494.png', 'image', '2026-03-31 12:01:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `user_role` enum('customer','staff','admin','co-founder') DEFAULT 'customer',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_logged_in` tinyint(1) DEFAULT 0,
  `is_blocked` tinyint(1) DEFAULT 0,
  `is_online` tinyint(1) DEFAULT 0,
  `last_active` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `full_name`, `email`, `password_hash`, `user_role`, `created_at`, `is_logged_in`, `is_blocked`, `is_online`, `last_active`) VALUES
(3, 'Master Admin', 'admin@brand.com', '$2y$10$GMFCKMacH4./t9RefX4hHeIL7nRS9v8cCE1DxpxCFcxKYW/pT8mx2', 'admin', '2026-03-29 16:50:39', 0, 0, 1, '2026-04-12 13:49:58'),
(7, 'MansoorAli', 'mansoorali@gmail.com', '$2y$10$SMXiI/hsBQXzmTLEfUyDcuZnZ5e.7ohmtvvs528g9cqp6GwfCEtpW', 'customer', '2026-03-29 18:52:54', 0, 0, 0, '2026-03-31 17:40:42'),
(8, 'mans', 'mansooralipsx@gmail.com', '$2y$10$SpMC0gIu8zsOPjJ/1dD2Pe1TqTpgCXhJtOQsteiVuFAzfhRRDNpUm', 'customer', '2026-03-30 11:07:59', 0, 0, 0, '2026-03-31 17:40:42');

-- --------------------------------------------------------

--
-- Table structure for table `visitor_analytics`
--

CREATE TABLE `visitor_analytics` (
  `id` int(11) NOT NULL,
  `session_id` varchar(100) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `page_url` varchar(255) DEFAULT NULL,
  `time_spent` int(11) DEFAULT 0,
  `visit_date` date DEFAULT NULL,
  `visit_hour` int(11) DEFAULT NULL,
  `last_heartbeat` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `device_type` varchar(50) DEFAULT NULL,
  `os_platform` varchar(50) DEFAULT NULL,
  `browser_name` varchar(50) DEFAULT NULL,
  `screen_resolution` varchar(20) DEFAULT NULL,
  `event_type` varchar(50) DEFAULT 'view',
  `is_abandoned` tinyint(1) DEFAULT 0,
  `last_action_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `revenue` decimal(10,2) DEFAULT 0.00,
  `is_converted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `visitor_analytics`
--

INSERT INTO `visitor_analytics` (`id`, `session_id`, `ip_address`, `country`, `country_code`, `page_url`, `time_spent`, `visit_date`, `visit_hour`, `last_heartbeat`, `created_at`, `device_type`, `os_platform`, `browser_name`, `screen_resolution`, `event_type`, `is_abandoned`, `last_action_timestamp`, `revenue`, `is_converted`) VALUES
(1, 't4gt86ao05j41q9iu6a1ccgtdf', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 40, '2026-03-30', 18, '2026-03-30 13:55:35', '2026-03-30 13:46:06', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 13:55:35', 0.00, 0),
(2, 'ssqfiq7rai6mdm0h125actci7c', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=9', 20, '2026-03-30', 18, '2026-03-30 14:04:34', '2026-03-30 13:46:25', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 14:04:34', 0.00, 0),
(3, 't4gt86ao05j41q9iu6a1ccgtdf', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=10', 10, '2026-03-30', 18, '2026-03-30 13:55:40', '2026-03-30 13:55:36', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 13:55:40', 0.00, 0),
(4, 't4gt86ao05j41q9iu6a1ccgtdf', '8.8.8.8', 'United States', 'US', '/closetbaddie/cart.php', 30, '2026-03-30', 18, '2026-03-30 13:56:36', '2026-03-30 13:55:41', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 13:56:36', 0.00, 0),
(5, 't4gt86ao05j41q9iu6a1ccgtdf', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/checkout.php', 20, '2026-03-30', 18, '2026-03-30 14:01:45', '2026-03-30 13:56:57', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 14:01:45', 0.00, 0),
(6, 't4gt86ao05j41q9iu6a1ccgtdf', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/index.php', 10, '2026-03-30', 19, '2026-03-30 14:01:59', '2026-03-30 14:01:45', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 14:01:59', 0.00, 0),
(7, 't4gt86ao05j41q9iu6a1ccgtdf', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/cart.php', 10, '2026-03-30', 19, '2026-03-30 14:02:21', '2026-03-30 14:02:10', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 14:02:21', 0.00, 0),
(8, 't4gt86ao05j41q9iu6a1ccgtdf', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/index.php', 20, '2026-03-30', 19, '2026-03-30 14:02:33', '2026-03-30 14:02:33', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 14:02:33', 0.00, 0),
(9, 't4gt86ao05j41q9iu6a1ccgtdf', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/cart.php', 10, '2026-03-30', 19, '2026-03-30 14:13:41', '2026-03-30 14:02:33', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 14:13:41', 0.00, 0),
(10, 'ssqfiq7rai6mdm0h125actci7c', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/', 10, '2026-03-30', 19, '2026-03-30 14:04:39', '2026-03-30 14:04:34', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 14:04:39', 0.00, 0),
(11, 'nt9t8egn0r1bklscb3s8aue722', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/index.php', 20, '2026-03-30', 19, '2026-03-30 14:05:29', '2026-03-30 14:04:47', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 14:05:29', 0.00, 0),
(12, 'nt9t8egn0r1bklscb3s8aue722', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/shop.php', 10, '2026-03-30', 19, '2026-03-30 14:05:32', '2026-03-30 14:05:29', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 14:05:32', 0.00, 0),
(13, 'nt9t8egn0r1bklscb3s8aue722', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/index.php', 10, '2026-03-30', 19, '2026-03-30 14:05:34', '2026-03-30 14:05:32', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 14:05:34', 0.00, 0),
(14, 'nt9t8egn0r1bklscb3s8aue722', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/login.php', 10, '2026-03-30', 19, '2026-03-30 14:05:41', '2026-03-30 14:05:34', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 14:05:41', 0.00, 0),
(15, 'nt9t8egn0r1bklscb3s8aue722', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/search.php', 10, '2026-03-30', 19, '2026-03-30 14:05:47', '2026-03-30 14:05:41', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 14:05:47', 0.00, 0),
(16, 'nt9t8egn0r1bklscb3s8aue722', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/cart.php', 30, '2026-03-30', 19, '2026-03-30 14:11:24', '2026-03-30 14:05:58', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 14:11:24', 0.00, 0),
(17, 'nt9t8egn0r1bklscb3s8aue722', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/index.php', 20, '2026-03-30', 19, '2026-03-30 14:24:25', '2026-03-30 14:11:35', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 14:24:25', 0.00, 0),
(18, 't4gt86ao05j41q9iu6a1ccgtdf', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/index.php', 10, '2026-03-30', 19, '2026-03-30 14:13:43', '2026-03-30 14:13:41', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 14:13:43', 0.00, 0),
(19, 't4gt86ao05j41q9iu6a1ccgtdf', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/product_detail.php?id=10', 10, '2026-03-30', 19, '2026-03-30 14:13:47', '2026-03-30 14:13:43', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 14:13:47', 0.00, 0),
(20, 't4gt86ao05j41q9iu6a1ccgtdf', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/cart.php', 10, '2026-03-30', 19, '2026-03-30 14:14:02', '2026-03-30 14:13:59', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 14:14:02', 0.00, 0),
(21, 't4gt86ao05j41q9iu6a1ccgtdf', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/checkout.php', 10, '2026-03-30', 19, '2026-03-30 14:14:18', '2026-03-30 14:14:02', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 14:14:18', 0.00, 0),
(22, 't4gt86ao05j41q9iu6a1ccgtdf', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/success.php?order_id=13', 10, '2026-03-30', 19, '2026-03-30 14:25:19', '2026-03-30 14:14:18', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 14:25:19', 0.00, 0),
(23, 't4gt86ao05j41q9iu6a1ccgtdf', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/index.php', 20, '2026-03-30', 19, '2026-03-30 14:25:35', '2026-03-30 14:25:34', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 14:25:35', 0.00, 0),
(24, 't4gt86ao05j41q9iu6a1ccgtdf', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/shop.php', 20, '2026-03-30', 19, '2026-03-30 14:25:47', '2026-03-30 14:25:45', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 14:25:47', 0.00, 0),
(25, 't4gt86ao05j41q9iu6a1ccgtdf', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/shop.php?cat=new', 10, '2026-03-30', 19, '2026-03-30 14:26:08', '2026-03-30 14:26:08', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 14:26:08', 0.00, 0),
(26, 't4gt86ao05j41q9iu6a1ccgtdf', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/size-guide.php', 80, '2026-03-30', 19, '2026-03-30 14:26:08', '2026-03-30 14:26:08', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 14:26:08', 0.00, 0),
(27, 't4gt86ao05j41q9iu6a1ccgtdf', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/index.php', 20, '2026-03-30', 19, '2026-03-30 14:26:08', '2026-03-30 14:26:08', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 14:26:08', 0.00, 0),
(28, 't4gt86ao05j41q9iu6a1ccgtdf', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/trackorder.php', 40, '2026-03-30', 19, '2026-03-30 14:26:32', '2026-03-30 14:26:12', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 14:26:32', 0.00, 0),
(29, 'nt9t8egn0r1bklscb3s8aue722', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/trackorder.php', 30, '2026-03-30', 19, '2026-03-30 14:27:06', '2026-03-30 14:26:42', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 14:27:06', 0.00, 0),
(30, '7evapra1fh9oqg24kjf0ki3682', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/trackorder.php', 10, '2026-03-30', 19, '2026-03-30 14:27:37', '2026-03-30 14:27:37', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 14:27:37', 0.00, 0),
(31, '9si9hld1k9gq0iclhti9lh0bbd', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/trackorder.php', 10, '2026-03-30', 19, '2026-03-30 14:27:38', '2026-03-30 14:27:38', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 14:27:38', 0.00, 0),
(32, '7evapra1fh9oqg24kjf0ki3682', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/shop.php', 10, '2026-03-30', 19, '2026-03-30 14:27:59', '2026-03-30 14:27:59', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 14:27:59', 0.00, 0),
(33, '7evapra1fh9oqg24kjf0ki3682', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/index.php', 10, '2026-03-30', 19, '2026-03-30 14:27:59', '2026-03-30 14:27:59', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 14:27:59', 0.00, 0),
(34, 't4gt86ao05j41q9iu6a1ccgtdf', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 10, '2026-03-30', 19, '2026-03-30 14:54:56', '2026-03-30 14:54:56', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 14:54:56', 0.00, 0),
(35, 't4gt86ao05j41q9iu6a1ccgtdf', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=9', 10, '2026-03-30', 19, '2026-03-30 14:55:01', '2026-03-30 14:55:01', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 14:55:01', 0.00, 0),
(36, 't4gt86ao05j41q9iu6a1ccgtdf', '8.8.8.8', 'United States', 'US', '/closetbaddie/cart.php', 30, '2026-03-30', 19, '2026-03-30 14:55:27', '2026-03-30 14:55:04', NULL, NULL, NULL, NULL, 'view_cart', 0, '2026-03-30 14:55:27', 0.00, 0),
(37, 't4gt86ao05j41q9iu6a1ccgtdf', '8.8.8.8', 'United States', 'US', '/closetbaddie/checkout.php', 10, '2026-03-30', 19, '2026-03-30 14:55:42', '2026-03-30 14:55:42', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 14:55:42', 0.00, 0),
(38, 't4gt86ao05j41q9iu6a1ccgtdf', '8.8.8.8', 'United States', 'US', '/closetbaddie/cart.php', 20, '2026-03-30', 19, '2026-03-30 14:56:05', '2026-03-30 14:56:01', NULL, NULL, NULL, NULL, 'view_cart', 0, '2026-03-30 14:56:05', 0.00, 0),
(39, 't4gt86ao05j41q9iu6a1ccgtdf', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/index.php', 80, '2026-03-30', 21, '2026-03-30 16:16:58', '2026-03-30 16:11:31', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:16:58', 0.00, 0),
(40, 't4gt86ao05j41q9iu6a1ccgtdf', '8.8.8.8', 'United States', 'US', '/closetbaddie/shop.php', 10, '2026-03-30', 21, '2026-03-30 16:17:03', '2026-03-30 16:17:03', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:17:03', 0.00, 0),
(41, 't4gt86ao05j41q9iu6a1ccgtdf', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 170, '2026-03-30', 21, '2026-03-30 16:24:41', '2026-03-30 16:17:06', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:24:41', 0.00, 0),
(42, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 10, '2026-03-30', 21, '2026-03-30 16:24:43', '2026-03-30 16:24:43', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:24:43', 0.00, 0),
(43, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/shop.php', 10, '2026-03-30', 21, '2026-03-30 16:24:49', '2026-03-30 16:24:49', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:24:49', 0.00, 0),
(44, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/register.php', 10, '2026-03-30', 21, '2026-03-30 16:24:51', '2026-03-30 16:24:51', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:24:51', 0.00, 0),
(45, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 10, '2026-03-30', 21, '2026-03-30 16:24:54', '2026-03-30 16:24:54', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:24:54', 0.00, 0),
(46, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/cart.php', 10, '2026-03-30', 21, '2026-03-30 16:24:57', '2026-03-30 16:24:57', NULL, NULL, NULL, NULL, 'view_cart', 0, '2026-03-30 16:24:57', 0.00, 0),
(47, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 10, '2026-03-30', 21, '2026-03-30 16:25:04', '2026-03-30 16:25:04', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:25:04', 0.00, 0),
(48, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php', 10, '2026-03-30', 21, '2026-03-30 16:25:07', '2026-03-30 16:25:07', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:25:07', 0.00, 0),
(49, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=&min_p=0&max_p=10000', 10, '2026-03-30', 21, '2026-03-30 16:25:08', '2026-03-30 16:25:08', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:25:08', 0.00, 0),
(50, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php', 30, '2026-03-30', 21, '2026-03-30 16:25:32', '2026-03-30 16:25:32', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:25:32', 0.00, 0),
(51, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=&min_p=0&max_p=10000', 10, '2026-03-30', 21, '2026-03-30 16:25:33', '2026-03-30 16:25:33', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:25:33', 0.00, 0),
(52, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 40, '2026-03-30', 21, '2026-03-30 16:26:08', '2026-03-30 16:25:34', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:26:08', 0.00, 0),
(53, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/cart.php', 50, '2026-03-30', 21, '2026-03-30 16:26:57', '2026-03-30 16:26:12', NULL, NULL, NULL, NULL, 'view_cart', 0, '2026-03-30 16:26:57', 0.00, 0),
(54, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 100, '2026-03-30', 21, '2026-03-30 16:33:37', '2026-03-30 16:26:58', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:33:37', 0.00, 0),
(55, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/shop.php', 10, '2026-03-30', 21, '2026-03-30 16:33:51', '2026-03-30 16:33:51', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:33:51', 0.00, 0),
(56, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 80, '2026-03-30', 21, '2026-03-30 16:34:26', '2026-03-30 16:33:52', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:34:26', 0.00, 0),
(57, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php', 10, '2026-03-30', 21, '2026-03-30 16:34:40', '2026-03-30 16:34:40', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:34:40', 0.00, 0),
(58, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=&min_p=0&max_p=10000', 10, '2026-03-30', 21, '2026-03-30 16:34:41', '2026-03-30 16:34:41', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:34:41', 0.00, 0),
(59, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 50, '2026-03-30', 21, '2026-03-30 16:36:24', '2026-03-30 16:34:43', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:36:24', 0.00, 0),
(60, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php', 10, '2026-03-30', 21, '2026-03-30 16:37:00', '2026-03-30 16:37:00', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:37:00', 0.00, 0),
(61, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=&min_p=0&max_p=10000', 10, '2026-03-30', 21, '2026-03-30 16:37:00', '2026-03-30 16:37:00', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:37:00', 0.00, 0),
(62, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php', 10, '2026-03-30', 21, '2026-03-30 16:37:08', '2026-03-30 16:37:08', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:37:08', 0.00, 0),
(63, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=&min_p=0&max_p=10000', 10, '2026-03-30', 21, '2026-03-30 16:37:09', '2026-03-30 16:37:09', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:37:09', 0.00, 0),
(64, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php', 10, '2026-03-30', 21, '2026-03-30 16:37:20', '2026-03-30 16:37:20', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:37:20', 0.00, 0),
(65, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=&min_p=0&max_p=10000', 10, '2026-03-30', 21, '2026-03-30 16:37:20', '2026-03-30 16:37:20', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:37:20', 0.00, 0),
(66, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php', 10, '2026-03-30', 21, '2026-03-30 16:37:32', '2026-03-30 16:37:32', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:37:32', 0.00, 0),
(67, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=&min_p=0&max_p=10000', 10, '2026-03-30', 21, '2026-03-30 16:37:33', '2026-03-30 16:37:33', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:37:33', 0.00, 0),
(68, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php', 10, '2026-03-30', 21, '2026-03-30 16:37:42', '2026-03-30 16:37:41', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:37:42', 0.00, 0),
(69, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=&min_p=0&max_p=10000', 10, '2026-03-30', 21, '2026-03-30 16:37:42', '2026-03-30 16:37:42', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:37:42', 0.00, 0),
(70, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php', 10, '2026-03-30', 21, '2026-03-30 16:38:08', '2026-03-30 16:38:08', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:38:08', 0.00, 0),
(71, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=&min_p=0&max_p=10000', 10, '2026-03-30', 21, '2026-03-30 16:38:09', '2026-03-30 16:38:09', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:38:09', 0.00, 0),
(72, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php', 10, '2026-03-30', 21, '2026-03-30 16:38:09', '2026-03-30 16:38:09', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:38:09', 0.00, 0),
(73, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=&min_p=0&max_p=10000', 10, '2026-03-30', 21, '2026-03-30 16:38:10', '2026-03-30 16:38:10', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:38:10', 0.00, 0),
(74, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php', 10, '2026-03-30', 21, '2026-03-30 16:38:23', '2026-03-30 16:38:23', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:38:23', 0.00, 0),
(75, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=&min_p=0&max_p=10000', 10, '2026-03-30', 21, '2026-03-30 16:38:24', '2026-03-30 16:38:24', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:38:24', 0.00, 0),
(76, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 10, '2026-03-30', 21, '2026-03-30 16:39:29', '2026-03-30 16:39:29', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:39:29', 0.00, 0),
(77, 'thqt80bd6figme0fl7a30tor5h', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 20, '2026-03-30', 21, '2026-03-30 16:39:55', '2026-03-30 16:39:53', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:39:55', 0.00, 0),
(78, 'thqt80bd6figme0fl7a30tor5h', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php', 10, '2026-03-30', 21, '2026-03-30 16:42:18', '2026-03-30 16:42:18', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:42:18', 0.00, 0),
(79, 'thqt80bd6figme0fl7a30tor5h', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=&min_p=0&max_p=10000', 10, '2026-03-30', 21, '2026-03-30 16:42:19', '2026-03-30 16:42:19', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:42:19', 0.00, 0),
(80, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/login.php', 10, '2026-03-30', 21, '2026-03-30 16:50:38', '2026-03-30 16:50:38', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:50:38', 0.00, 0),
(81, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/register.php', 10, '2026-03-30', 21, '2026-03-30 16:50:48', '2026-03-30 16:50:48', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:50:48', 0.00, 0),
(82, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/login.php', 10, '2026-03-30', 21, '2026-03-30 16:50:51', '2026-03-30 16:50:51', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:50:51', 0.00, 0),
(83, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 20, '2026-03-30', 21, '2026-03-30 16:53:08', '2026-03-30 16:51:50', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:53:08', 0.00, 0),
(84, 'thqt80bd6figme0fl7a30tor5h', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 10, '2026-03-30', 21, '2026-03-30 16:53:43', '2026-03-30 16:53:43', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:53:43', 0.00, 0),
(85, 'thqt80bd6figme0fl7a30tor5h', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php', 10, '2026-03-30', 21, '2026-03-30 16:53:44', '2026-03-30 16:53:44', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:53:44', 0.00, 0),
(86, 'thqt80bd6figme0fl7a30tor5h', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=&min_p=0&max_p=5000', 10, '2026-03-30', 21, '2026-03-30 16:53:45', '2026-03-30 16:53:45', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:53:45', 0.00, 0),
(87, 'thqt80bd6figme0fl7a30tor5h', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 20, '2026-03-30', 21, '2026-03-30 16:58:50', '2026-03-30 16:54:14', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:58:50', 0.00, 0),
(88, 'thqt80bd6figme0fl7a30tor5h', '8.8.8.8', 'United States', 'US', '/closetbaddie/shop.php', 10, '2026-03-30', 21, '2026-03-30 16:58:52', '2026-03-30 16:58:52', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:58:52', 0.00, 0),
(89, 'thqt80bd6figme0fl7a30tor5h', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 10, '2026-03-30', 21, '2026-03-30 16:58:58', '2026-03-30 16:58:58', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:58:58', 0.00, 0),
(90, 'thqt80bd6figme0fl7a30tor5h', '8.8.8.8', 'United States', 'US', '/closetbaddie/shop.php', 10, '2026-03-30', 21, '2026-03-30 16:59:01', '2026-03-30 16:59:01', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 16:59:01', 0.00, 0),
(91, 'thqt80bd6figme0fl7a30tor5h', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 20, '2026-03-30', 22, '2026-03-30 17:00:10', '2026-03-30 17:00:03', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 17:00:10', 0.00, 0),
(92, 'thqt80bd6figme0fl7a30tor5h', '8.8.8.8', 'United States', 'US', '/closetbaddie/shop.php', 10, '2026-03-30', 22, '2026-03-30 17:00:11', '2026-03-30 17:00:11', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 17:00:11', 0.00, 0),
(93, 'thqt80bd6figme0fl7a30tor5h', '8.8.8.8', 'United States', 'US', '/closetbaddie/register.php', 10, '2026-03-30', 22, '2026-03-30 17:00:13', '2026-03-30 17:00:13', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 17:00:13', 0.00, 0),
(94, 'thqt80bd6figme0fl7a30tor5h', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 20, '2026-03-30', 22, '2026-03-30 17:00:41', '2026-03-30 17:00:16', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 17:00:41', 0.00, 0),
(95, 'thqt80bd6figme0fl7a30tor5h', '8.8.8.8', 'United States', 'US', '/closetbaddie/size-guide.php', 20, '2026-03-30', 22, '2026-03-30 17:01:32', '2026-03-30 17:01:17', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 17:01:32', 0.00, 0),
(96, 'thqt80bd6figme0fl7a30tor5h', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 10, '2026-03-30', 22, '2026-03-30 17:01:46', '2026-03-30 17:01:46', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 17:01:46', 0.00, 0),
(97, 'thqt80bd6figme0fl7a30tor5h', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=10', 10, '2026-03-30', 22, '2026-03-30 17:01:48', '2026-03-30 17:01:48', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 17:01:48', 0.00, 0),
(98, 'thqt80bd6figme0fl7a30tor5h', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 30, '2026-03-30', 22, '2026-03-30 17:03:51', '2026-03-30 17:02:06', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 17:03:51', 0.00, 0),
(99, 'thqt80bd6figme0fl7a30tor5h', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/login.php', 10, '2026-03-30', 22, '2026-03-30 17:04:15', '2026-03-30 17:04:15', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 17:04:15', 0.00, 0),
(100, 'thqt80bd6figme0fl7a30tor5h', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/shop.php', 10, '2026-03-30', 22, '2026-03-30 17:04:15', '2026-03-30 17:04:15', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 17:04:15', 0.00, 0),
(101, 'thqt80bd6figme0fl7a30tor5h', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/index.php', 30, '2026-03-30', 22, '2026-03-30 17:04:15', '2026-03-30 17:04:15', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 17:04:15', 0.00, 0),
(102, 'thqt80bd6figme0fl7a30tor5h', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/', 230, '2026-03-30', 22, '2026-03-30 17:26:28', '2026-03-30 17:04:18', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 17:26:28', 0.00, 0),
(103, 'a107ok43cfiqv7b063p490vps9', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/index.php', 150, '2026-03-30', 22, '2026-03-30 17:17:14', '2026-03-30 17:06:57', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 17:17:14', 0.00, 0),
(104, 'a107ok43cfiqv7b063p490vps9', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/shop.php?cat=best', 10, '2026-03-30', 22, '2026-03-30 17:17:29', '2026-03-30 17:17:29', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 17:17:29', 0.00, 0),
(105, 'a107ok43cfiqv7b063p490vps9', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/index.php', 50, '2026-03-30', 22, '2026-03-30 17:40:46', '2026-03-30 17:17:32', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 17:40:46', 0.00, 0),
(106, 'thqt80bd6figme0fl7a30tor5h', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/product_detail.php?id=10', 70, '2026-03-30', 22, '2026-03-30 17:26:54', '2026-03-30 17:26:54', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 17:26:54', 0.00, 0),
(107, 'thqt80bd6figme0fl7a30tor5h', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/product_detail.php?id=9', 130, '2026-03-30', 22, '2026-03-30 17:26:54', '2026-03-30 17:26:54', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 17:26:54', 0.00, 0),
(108, 'thqt80bd6figme0fl7a30tor5h', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/index.php', 70, '2026-03-30', 22, '2026-03-30 17:27:00', '2026-03-30 17:26:56', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 17:27:00', 0.00, 0),
(109, 'thqt80bd6figme0fl7a30tor5h', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/login.php', 50, '2026-03-30', 22, '2026-03-30 17:27:02', '2026-03-30 17:27:00', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 17:27:02', 0.00, 0),
(110, 'thqt80bd6figme0fl7a30tor5h', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/index.php', 80, '2026-03-30', 22, '2026-03-30 17:28:44', '2026-03-30 17:27:03', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 17:28:44', 0.00, 0),
(111, 'a107ok43cfiqv7b063p490vps9', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/shop.php', 20, '2026-03-30', 22, '2026-03-30 17:41:38', '2026-03-30 17:41:14', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 17:41:38', 0.00, 0),
(112, 'a107ok43cfiqv7b063p490vps9', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 20, '2026-03-30', 22, '2026-03-30 17:43:35', '2026-03-30 17:43:24', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 17:43:35', 0.00, 0),
(113, 'a107ok43cfiqv7b063p490vps9', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=10', 20, '2026-03-30', 22, '2026-03-30 17:43:39', '2026-03-30 17:43:39', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 17:43:39', 0.00, 0),
(114, 'a107ok43cfiqv7b063p490vps9', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=9', 30, '2026-03-30', 22, '2026-03-30 17:48:22', '2026-03-30 17:43:39', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 17:48:22', 0.00, 0),
(115, 'a107ok43cfiqv7b063p490vps9', '8.8.8.8', 'Unknown', 'XX', '/closetbaddie/index.php', 10, '2026-03-30', 22, '2026-03-30 17:48:25', '2026-03-30 17:48:25', NULL, NULL, NULL, NULL, 'view', 0, '2026-03-30 17:48:25', 0.00, 0),
(116, 'a107ok43cfiqv7b063p490vps9', '8.8.8.8', 'United States', 'US', '/closetbaddie/shop.php', 0, '2026-03-30', 23, '2026-03-30 18:10:46', '2026-03-30 18:10:46', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-30 18:10:46', 0.00, 0),
(117, 'a107ok43cfiqv7b063p490vps9', '8.8.8.8', 'United States', 'US', '/closetbaddie/checkout.php', 0, '2026-03-30', 23, '2026-03-30 18:10:53', '2026-03-30 18:10:53', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-30 18:10:53', 0.00, 0),
(118, 'a107ok43cfiqv7b063p490vps9', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-30', 23, '2026-03-30 18:12:03', '2026-03-30 18:12:03', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-30 18:12:03', 0.00, 0),
(119, 'thqt80bd6figme0fl7a30tor5h', '8.8.8.8', 'United States', 'US', '/closetbaddie/shop.php', 0, '2026-03-30', 23, '2026-03-30 18:15:18', '2026-03-30 18:15:18', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-30 18:15:18', 0.00, 0),
(120, 'thqt80bd6figme0fl7a30tor5h', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=10', 0, '2026-03-30', 23, '2026-03-30 18:15:22', '2026-03-30 18:15:22', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-30 18:15:22', 0.00, 0),
(121, 'thqt80bd6figme0fl7a30tor5h', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-30', 23, '2026-03-30 18:15:33', '2026-03-30 18:15:33', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-30 18:15:33', 0.00, 0),
(122, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/', 0, '2026-03-30', 23, '2026-03-30 18:16:29', '2026-03-30 18:16:29', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-30 18:16:29', 0.00, 0),
(123, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/shop.php?cat=best', 0, '2026-03-30', 23, '2026-03-30 18:32:52', '2026-03-30 18:32:52', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-30 18:32:52', 0.00, 0),
(124, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-30', 23, '2026-03-30 18:33:05', '2026-03-30 18:33:05', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-30 18:33:05', 0.00, 0),
(125, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=11', 0, '2026-03-30', 23, '2026-03-30 18:40:57', '2026-03-30 18:40:57', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-30 18:40:57', 0.00, 0),
(126, '2tu756r1n1gfiv07g4b30mtaaq', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/index.php', 0, '2026-03-30', 23, '2026-03-30 18:42:15', '2026-03-30 18:42:15', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-30 18:42:15', 0.00, 0),
(127, 'p1b7dftgikl6bp7qcfskdc33la', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-30', 23, '2026-03-30 18:47:00', '2026-03-30 18:47:00', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-30 18:47:00', 0.00, 0),
(128, 'p1b7dftgikl6bp7qcfskdc33la', '8.8.8.8', 'United States', 'US', '/closetbaddie/login.php', 0, '2026-03-30', 23, '2026-03-30 18:47:03', '2026-03-30 18:47:03', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-30 18:47:03', 0.00, 0),
(129, 'p1b7dftgikl6bp7qcfskdc33la', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/register.php', 0, '2026-03-30', 23, '2026-03-30 18:47:56', '2026-03-30 18:47:56', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-30 18:47:56', 0.00, 0),
(130, 'p1b7dftgikl6bp7qcfskdc33la', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-30', 23, '2026-03-30 18:48:00', '2026-03-30 18:48:00', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-30 18:48:00', 0.00, 0),
(131, 'p1b7dftgikl6bp7qcfskdc33la', '8.8.8.8', 'United States', 'US', '/closetbaddie/shop.php', 0, '2026-03-30', 23, '2026-03-30 18:48:25', '2026-03-30 18:48:25', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-30 18:48:25', 0.00, 0),
(132, 'p1b7dftgikl6bp7qcfskdc33la', '8.8.8.8', 'United States', 'US', '/closetbaddie/login.php', 0, '2026-03-30', 23, '2026-03-30 18:48:40', '2026-03-30 18:48:40', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-30 18:48:40', 0.00, 0),
(133, 'p1b7dftgikl6bp7qcfskdc33la', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/index.php', 0, '2026-03-30', 23, '2026-03-30 18:48:42', '2026-03-30 18:48:42', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-30 18:48:42', 0.00, 0),
(134, 'p1b7dftgikl6bp7qcfskdc33la', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=14', 0, '2026-03-30', 23, '2026-03-30 18:48:46', '2026-03-30 18:48:46', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-30 18:48:46', 0.00, 0),
(135, 'rl76t2esvde54qa3pdpu1cv2ms', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=14', 0, '2026-03-30', 23, '2026-03-30 18:50:35', '2026-03-30 18:50:35', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-30 18:50:35', 0.00, 0),
(136, 'rl76t2esvde54qa3pdpu1cv2ms', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-30', 23, '2026-03-30 18:50:37', '2026-03-30 18:50:37', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-30 18:50:37', 0.00, 0),
(137, 'rl76t2esvde54qa3pdpu1cv2ms', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/product_detail.php?id=14', 0, '2026-03-30', 23, '2026-03-30 18:50:41', '2026-03-30 18:50:41', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-30 18:50:41', 0.00, 0),
(138, 'rl76t2esvde54qa3pdpu1cv2ms', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=15', 0, '2026-03-30', 23, '2026-03-30 18:50:41', '2026-03-30 18:50:41', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-30 18:50:41', 0.00, 0),
(139, 'rl76t2esvde54qa3pdpu1cv2ms', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-30', 23, '2026-03-30 18:51:46', '2026-03-30 18:51:46', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-30 18:51:46', 0.00, 0),
(140, 'p1b7dftgikl6bp7qcfskdc33la', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-30', 23, '2026-03-30 18:53:29', '2026-03-30 18:53:29', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-30 18:53:29', 0.00, 0),
(141, 'p1b7dftgikl6bp7qcfskdc33la', '8.8.8.8', 'United States', 'US', '/closetbaddie/trackorder.php', 0, '2026-03-30', 23, '2026-03-30 18:54:26', '2026-03-30 18:54:26', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-30 18:54:26', 0.00, 0),
(142, 'p1b7dftgikl6bp7qcfskdc33la', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-30', 23, '2026-03-30 18:54:31', '2026-03-30 18:54:31', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-30 18:54:31', 0.00, 0),
(143, 'rl76t2esvde54qa3pdpu1cv2ms', '8.8.8.8', 'United States', 'US', '/closetbaddie/shop.php', 0, '2026-03-30', 23, '2026-03-30 18:57:32', '2026-03-30 18:57:32', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-30 18:57:32', 0.00, 0),
(144, 'rl76t2esvde54qa3pdpu1cv2ms', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=16', 0, '2026-03-30', 23, '2026-03-30 18:57:36', '2026-03-30 18:57:36', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-30 18:57:36', 0.00, 0),
(145, 'rl76t2esvde54qa3pdpu1cv2ms', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-30', 23, '2026-03-30 18:57:42', '2026-03-30 18:57:42', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-30 18:57:42', 0.00, 0),
(146, 'rl76t2esvde54qa3pdpu1cv2ms', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=12', 0, '2026-03-30', 23, '2026-03-30 18:57:45', '2026-03-30 18:57:45', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-30 18:57:45', 0.00, 0),
(147, 'rl76t2esvde54qa3pdpu1cv2ms', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=13', 0, '2026-03-30', 23, '2026-03-30 18:59:01', '2026-03-30 18:59:01', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-30 18:59:01', 0.00, 0),
(148, 'rl76t2esvde54qa3pdpu1cv2ms', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-30', 23, '2026-03-30 18:59:17', '2026-03-30 18:59:17', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-30 18:59:17', 0.00, 0),
(149, 'rl76t2esvde54qa3pdpu1cv2ms', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=14', 0, '2026-03-31', 0, '2026-03-30 19:00:07', '2026-03-30 19:00:07', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-30 19:00:07', 0.00, 0),
(150, 'rl76t2esvde54qa3pdpu1cv2ms', '8.8.8.8', 'United States', 'US', '/closetbaddie/checkout.php', 0, '2026-03-31', 0, '2026-03-30 19:00:44', '2026-03-30 19:00:44', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-30 19:00:44', 0.00, 0),
(151, 'rl76t2esvde54qa3pdpu1cv2ms', '8.8.8.8', 'United States', 'US', '/closetbaddie/place_order.php', 0, '2026-03-31', 0, '2026-03-30 19:01:41', '2026-03-30 19:01:41', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-30 19:01:41', 0.00, 0),
(152, 'rl76t2esvde54qa3pdpu1cv2ms', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 0, '2026-03-30 19:01:50', '2026-03-30 19:01:50', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-30 19:01:50', 0.00, 0),
(153, '4v0mo4r2689f21ma4i5q185u25', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 0, '2026-03-30 19:03:06', '2026-03-30 19:03:06', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-30 19:03:06', 0.00, 0),
(154, '4v0mo4r2689f21ma4i5q185u25', '8.8.8.8', 'United States', 'US', '/closetbaddie/shop.php', 0, '2026-03-31', 0, '2026-03-30 19:03:18', '2026-03-30 19:03:18', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-30 19:03:18', 0.00, 0),
(155, '4v0mo4r2689f21ma4i5q185u25', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 0, '2026-03-30 19:03:27', '2026-03-30 19:03:27', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-30 19:03:27', 0.00, 0),
(156, '4v0mo4r2689f21ma4i5q185u25', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=16', 0, '2026-03-31', 0, '2026-03-30 19:03:32', '2026-03-30 19:03:32', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-30 19:03:32', 0.00, 0),
(157, '4v0mo4r2689f21ma4i5q185u25', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 0, '2026-03-30 19:04:00', '2026-03-30 19:04:00', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-30 19:04:00', 0.00, 0),
(158, '4v0mo4r2689f21ma4i5q185u25', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=15', 0, '2026-03-31', 0, '2026-03-30 19:04:35', '2026-03-30 19:04:35', 'Mobile', 'Android', 'Chrome', NULL, 'view', 0, '2026-03-30 19:04:35', 0.00, 0),
(159, '4v0mo4r2689f21ma4i5q185u25', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 0, '2026-03-30 19:04:47', '2026-03-30 19:04:47', 'Mobile', 'Android', 'Chrome', NULL, 'view', 0, '2026-03-30 19:04:47', 0.00, 0),
(160, '4v0mo4r2689f21ma4i5q185u25', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=16', 0, '2026-03-31', 0, '2026-03-30 19:04:50', '2026-03-30 19:04:50', 'Mobile', 'Android', 'Chrome', NULL, 'view', 0, '2026-03-30 19:04:50', 0.00, 0),
(161, '4v0mo4r2689f21ma4i5q185u25', '8.8.8.8', 'United States', 'US', '/closetbaddie/checkout.php', 0, '2026-03-31', 0, '2026-03-30 19:05:36', '2026-03-30 19:05:36', 'Mobile', 'Android', 'Chrome', NULL, 'view', 0, '2026-03-30 19:05:36', 0.00, 0),
(162, '4v0mo4r2689f21ma4i5q185u25', '8.8.8.8', 'United States', 'US', '/closetbaddie/login.php', 0, '2026-03-31', 0, '2026-03-30 19:05:47', '2026-03-30 19:05:47', 'Mobile', 'Android', 'Chrome', NULL, 'view', 0, '2026-03-30 19:05:47', 0.00, 0),
(163, '4v0mo4r2689f21ma4i5q185u25', '8.8.8.8', 'United States', 'US', '/closetbaddie/', 0, '2026-03-31', 0, '2026-03-30 19:17:53', '2026-03-30 19:17:53', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-30 19:17:53', 0.00, 0),
(164, '4v0mo4r2689f21ma4i5q185u25', '8.8.8.8', 'United States', 'US', '/closetbaddie/login.php', 0, '2026-03-31', 0, '2026-03-30 19:17:58', '2026-03-30 19:17:58', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-30 19:17:58', 0.00, 0),
(165, '4v0mo4r2689f21ma4i5q185u25', '8.8.8.8', 'United States', 'US', '/closetbaddie/register.php', 0, '2026-03-31', 0, '2026-03-30 19:18:02', '2026-03-30 19:18:02', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-30 19:18:02', 0.00, 0),
(166, '4v0mo4r2689f21ma4i5q185u25', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 0, '2026-03-30 19:18:12', '2026-03-30 19:18:12', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-30 19:18:12', 0.00, 0),
(167, '4v0mo4r2689f21ma4i5q185u25', '8.8.8.8', 'United States', 'US', '/closetbaddie/trackorder.php', 0, '2026-03-31', 0, '2026-03-30 19:21:35', '2026-03-30 19:21:35', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-30 19:21:35', 0.00, 0),
(168, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/', 0, '2026-03-31', 14, '2026-03-31 09:26:48', '2026-03-31 09:26:48', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 09:26:48', 0.00, 0),
(169, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/shop.php', 0, '2026-03-31', 14, '2026-03-31 09:26:59', '2026-03-31 09:26:59', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 09:26:59', 0.00, 0),
(170, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 14, '2026-03-31 09:27:01', '2026-03-31 09:27:01', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 09:27:01', 0.00, 0),
(171, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php', 0, '2026-03-31', 14, '2026-03-31 09:29:04', '2026-03-31 09:29:04', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 09:29:04', 0.00, 0),
(172, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=&min_p=0&max_p=5000', 0, '2026-03-31', 14, '2026-03-31 09:29:05', '2026-03-31 09:29:05', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 09:29:05', 0.00, 0),
(173, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=13', 0, '2026-03-31', 14, '2026-03-31 09:29:10', '2026-03-31 09:29:10', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 09:29:10', 0.00, 0),
(174, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/checkout.php', 0, '2026-03-31', 14, '2026-03-31 09:29:18', '2026-03-31 09:29:18', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 09:29:18', 0.00, 0),
(175, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 14, '2026-03-31 09:29:53', '2026-03-31 09:29:53', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 09:29:53', 0.00, 0),
(176, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/checkout.php', 0, '2026-03-31', 14, '2026-03-31 09:29:57', '2026-03-31 09:29:57', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 09:29:57', 0.00, 0),
(177, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 14, '2026-03-31 09:30:04', '2026-03-31 09:30:04', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 09:30:04', 0.00, 0),
(178, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/shop.php', 0, '2026-03-31', 14, '2026-03-31 09:30:12', '2026-03-31 09:30:12', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 09:30:12', 0.00, 0),
(179, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=11', 0, '2026-03-31', 14, '2026-03-31 09:30:16', '2026-03-31 09:30:16', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 09:30:16', 0.00, 0),
(180, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 14, '2026-03-31 09:30:22', '2026-03-31 09:30:22', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 09:30:22', 0.00, 0),
(181, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/login.php', 0, '2026-03-31', 14, '2026-03-31 09:30:30', '2026-03-31 09:30:30', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 09:30:30', 0.00, 0),
(182, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/register.php', 0, '2026-03-31', 14, '2026-03-31 09:31:29', '2026-03-31 09:31:29', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 09:31:29', 0.00, 0),
(183, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/login.php', 0, '2026-03-31', 14, '2026-03-31 09:32:13', '2026-03-31 09:32:13', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 09:32:13', 0.00, 0),
(184, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 14, '2026-03-31 09:32:18', '2026-03-31 09:32:18', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 09:32:18', 0.00, 0),
(185, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 14, '2026-03-31 09:33:11', '2026-03-31 09:33:11', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 09:33:11', 0.00, 0),
(186, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=12', 0, '2026-03-31', 14, '2026-03-31 09:42:00', '2026-03-31 09:42:00', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 09:42:00', 0.00, 0),
(187, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 14, '2026-03-31 09:48:28', '2026-03-31 09:48:28', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 09:48:28', 0.00, 0),
(188, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/shop.php', 0, '2026-03-31', 14, '2026-03-31 09:48:30', '2026-03-31 09:48:30', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 09:48:30', 0.00, 0),
(189, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=16', 0, '2026-03-31', 14, '2026-03-31 09:48:32', '2026-03-31 09:48:32', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 09:48:32', 0.00, 0),
(190, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=12', 0, '2026-03-31', 14, '2026-03-31 09:48:36', '2026-03-31 09:48:36', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 09:48:36', 0.00, 0),
(191, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/checkout.php', 0, '2026-03-31', 14, '2026-03-31 09:49:03', '2026-03-31 09:49:03', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 09:49:03', 0.00, 0),
(192, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 14, '2026-03-31 09:58:22', '2026-03-31 09:58:22', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 09:58:22', 0.00, 0),
(193, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/checkout.php', 0, '2026-03-31', 14, '2026-03-31 09:59:11', '2026-03-31 09:59:11', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 09:59:11', 0.00, 0),
(194, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 14, '2026-03-31 09:59:39', '2026-03-31 09:59:39', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 09:59:39', 0.00, 0),
(195, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/shop.php', 0, '2026-03-31', 14, '2026-03-31 09:59:48', '2026-03-31 09:59:48', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 09:59:48', 0.00, 0),
(196, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/register.php', 0, '2026-03-31', 15, '2026-03-31 10:00:07', '2026-03-31 10:00:07', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:00:07', 0.00, 0),
(197, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/login.php', 0, '2026-03-31', 15, '2026-03-31 10:02:12', '2026-03-31 10:02:12', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:02:12', 0.00, 0),
(198, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 15, '2026-03-31 10:02:54', '2026-03-31 10:02:54', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:02:54', 0.00, 0),
(199, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/trackorder.php', 0, '2026-03-31', 15, '2026-03-31 10:03:13', '2026-03-31 10:03:13', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:03:13', 0.00, 0),
(200, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 15, '2026-03-31 10:03:28', '2026-03-31 10:03:28', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:03:28', 0.00, 0),
(201, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/trackorder.php', 0, '2026-03-31', 15, '2026-03-31 10:03:31', '2026-03-31 10:03:31', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:03:31', 0.00, 0),
(202, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 15, '2026-03-31 10:06:28', '2026-03-31 10:06:28', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:06:28', 0.00, 0),
(203, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/shop.php', 0, '2026-03-31', 15, '2026-03-31 10:06:53', '2026-03-31 10:06:53', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 10:06:53', 0.00, 0),
(204, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php', 0, '2026-03-31', 15, '2026-03-31 10:06:58', '2026-03-31 10:06:58', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 10:06:58', 0.00, 0),
(205, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=&min_p=0&max_p=5000', 0, '2026-03-31', 15, '2026-03-31 10:07:00', '2026-03-31 10:07:00', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 10:07:00', 0.00, 0),
(206, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/login.php', 0, '2026-03-31', 15, '2026-03-31 10:07:04', '2026-03-31 10:07:04', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 10:07:04', 0.00, 0),
(207, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/register.php', 0, '2026-03-31', 15, '2026-03-31 10:07:10', '2026-03-31 10:07:10', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 10:07:10', 0.00, 0);
INSERT INTO `visitor_analytics` (`id`, `session_id`, `ip_address`, `country`, `country_code`, `page_url`, `time_spent`, `visit_date`, `visit_hour`, `last_heartbeat`, `created_at`, `device_type`, `os_platform`, `browser_name`, `screen_resolution`, `event_type`, `is_abandoned`, `last_action_timestamp`, `revenue`, `is_converted`) VALUES
(208, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/checkout.php', 0, '2026-03-31', 15, '2026-03-31 10:07:20', '2026-03-31 10:07:20', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 10:07:20', 0.00, 0),
(209, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 15, '2026-03-31 10:07:26', '2026-03-31 10:07:26', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 10:07:26', 0.00, 0),
(210, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/trackorder.php', 0, '2026-03-31', 15, '2026-03-31 10:07:30', '2026-03-31 10:07:30', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 10:07:30', 0.00, 0),
(211, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 15, '2026-03-31 10:07:58', '2026-03-31 10:07:58', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 10:07:58', 0.00, 0),
(212, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=16', 0, '2026-03-31', 15, '2026-03-31 10:14:27', '2026-03-31 10:14:27', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:14:27', 0.00, 0),
(213, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 15, '2026-03-31 10:14:32', '2026-03-31 10:14:32', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:14:32', 0.00, 0),
(214, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/shop.php', 0, '2026-03-31', 15, '2026-03-31 10:14:34', '2026-03-31 10:14:34', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:14:34', 0.00, 0),
(215, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/login.php', 0, '2026-03-31', 15, '2026-03-31 10:14:40', '2026-03-31 10:14:40', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:14:40', 0.00, 0),
(216, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/register.php', 0, '2026-03-31', 15, '2026-03-31 10:15:14', '2026-03-31 10:15:14', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:15:14', 0.00, 0),
(217, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 15, '2026-03-31 10:15:19', '2026-03-31 10:15:19', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:15:19', 0.00, 0),
(218, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/login.php', 0, '2026-03-31', 15, '2026-03-31 10:15:20', '2026-03-31 10:15:20', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:15:20', 0.00, 0),
(219, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 15, '2026-03-31 10:15:22', '2026-03-31 10:15:22', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:15:22', 0.00, 0),
(220, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/shop.php', 0, '2026-03-31', 15, '2026-03-31 10:15:24', '2026-03-31 10:15:24', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:15:24', 0.00, 0),
(221, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 15, '2026-03-31 10:15:25', '2026-03-31 10:15:25', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:15:25', 0.00, 0),
(222, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/', 0, '2026-03-31', 15, '2026-03-31 10:16:13', '2026-03-31 10:16:13', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:16:13', 0.00, 0),
(223, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php', 0, '2026-03-31', 15, '2026-03-31 10:16:53', '2026-03-31 10:16:53', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:16:53', 0.00, 0),
(224, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=&min_p=0&max_p=5000', 0, '2026-03-31', 15, '2026-03-31 10:16:54', '2026-03-31 10:16:54', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:16:54', 0.00, 0),
(225, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 15, '2026-03-31 10:16:57', '2026-03-31 10:16:57', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:16:57', 0.00, 0),
(226, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php', 0, '2026-03-31', 15, '2026-03-31 10:17:35', '2026-03-31 10:17:35', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:17:35', 0.00, 0),
(227, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=&min_p=0&max_p=25000', 0, '2026-03-31', 15, '2026-03-31 10:17:37', '2026-03-31 10:17:37', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:17:37', 0.00, 0),
(228, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=dsdas&min_p=0&max_p=25000', 0, '2026-03-31', 15, '2026-03-31 10:17:47', '2026-03-31 10:17:47', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:17:47', 0.00, 0),
(229, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 15, '2026-03-31 10:17:55', '2026-03-31 10:17:55', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:17:55', 0.00, 0),
(230, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/shop.php', 0, '2026-03-31', 15, '2026-03-31 10:18:40', '2026-03-31 10:18:40', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:18:40', 0.00, 0),
(231, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 15, '2026-03-31 10:19:47', '2026-03-31 10:19:47', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:19:47', 0.00, 0),
(232, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/shop.php', 0, '2026-03-31', 15, '2026-03-31 10:19:51', '2026-03-31 10:19:51', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:19:51', 0.00, 0),
(233, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 15, '2026-03-31 10:19:53', '2026-03-31 10:19:53', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:19:53', 0.00, 0),
(234, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/size-guide.php', 0, '2026-03-31', 15, '2026-03-31 10:20:23', '2026-03-31 10:20:23', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:20:23', 0.00, 0),
(235, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 15, '2026-03-31 10:20:32', '2026-03-31 10:20:32', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:20:32', 0.00, 0),
(236, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/trackorder.php', 0, '2026-03-31', 15, '2026-03-31 10:21:17', '2026-03-31 10:21:17', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:21:17', 0.00, 0),
(237, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 15, '2026-03-31 10:21:25', '2026-03-31 10:21:25', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:21:25', 0.00, 0),
(238, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/login.php', 0, '2026-03-31', 15, '2026-03-31 10:21:38', '2026-03-31 10:21:38', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:21:38', 0.00, 0),
(239, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/register.php', 0, '2026-03-31', 15, '2026-03-31 10:22:40', '2026-03-31 10:22:40', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:22:40', 0.00, 0),
(240, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 15, '2026-03-31 10:23:48', '2026-03-31 10:23:48', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:23:48', 0.00, 0),
(241, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/register.php', 0, '2026-03-31', 15, '2026-03-31 10:33:23', '2026-03-31 10:33:23', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:33:23', 0.00, 0),
(242, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/shop.php', 0, '2026-03-31', 15, '2026-03-31 10:33:24', '2026-03-31 10:33:24', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:33:24', 0.00, 0),
(243, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 15, '2026-03-31 10:34:14', '2026-03-31 10:34:14', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 10:34:14', 0.00, 0),
(244, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=15', 0, '2026-03-31', 17, '2026-03-31 12:01:44', '2026-03-31 12:01:44', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 12:01:44', 0.00, 0),
(245, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 17, '2026-03-31 12:01:58', '2026-03-31 12:01:58', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 12:01:58', 0.00, 0),
(246, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/size-guide.php', 0, '2026-03-31', 17, '2026-03-31 12:02:04', '2026-03-31 12:02:04', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 12:02:04', 0.00, 0),
(247, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 17, '2026-03-31 12:02:07', '2026-03-31 12:02:07', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 12:02:07', 0.00, 0),
(248, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/size-guide.php', 0, '2026-03-31', 17, '2026-03-31 12:02:17', '2026-03-31 12:02:17', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 12:02:17', 0.00, 0),
(249, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 17, '2026-03-31 12:02:21', '2026-03-31 12:02:21', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 12:02:21', 0.00, 0),
(250, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=12', 0, '2026-03-31', 17, '2026-03-31 12:02:24', '2026-03-31 12:02:24', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 12:02:24', 0.00, 0),
(251, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 17, '2026-03-31 12:13:57', '2026-03-31 12:13:57', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 12:13:57', 0.00, 0),
(252, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/trackorder.php', 0, '2026-03-31', 17, '2026-03-31 12:13:59', '2026-03-31 12:13:59', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 12:13:59', 0.00, 0),
(253, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/login.php', 0, '2026-03-31', 17, '2026-03-31 12:27:11', '2026-03-31 12:27:11', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 12:27:11', 0.00, 0),
(254, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 17, '2026-03-31 12:27:21', '2026-03-31 12:27:21', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 12:27:21', 0.00, 0),
(255, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/shop.php', 0, '2026-03-31', 18, '2026-03-31 13:03:55', '2026-03-31 13:03:55', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:03:55', 0.00, 0),
(256, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/checkout.php', 0, '2026-03-31', 18, '2026-03-31 13:04:02', '2026-03-31 13:04:02', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:04:02', 0.00, 0),
(257, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/place_order.php', 0, '2026-03-31', 18, '2026-03-31 13:04:15', '2026-03-31 13:04:15', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:04:15', 0.00, 0),
(258, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/', 0, '2026-03-31', 18, '2026-03-31 13:04:43', '2026-03-31 13:04:43', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:04:43', 0.00, 0),
(259, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=15', 0, '2026-03-31', 18, '2026-03-31 13:05:07', '2026-03-31 13:05:07', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:05:07', 0.00, 0),
(260, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/checkout.php', 0, '2026-03-31', 18, '2026-03-31 13:05:12', '2026-03-31 13:05:12', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:05:12', 0.00, 0),
(261, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/place_order.php', 0, '2026-03-31', 18, '2026-03-31 13:05:18', '2026-03-31 13:05:18', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:05:18', 0.00, 0),
(262, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/shop.php', 0, '2026-03-31', 18, '2026-03-31 13:06:10', '2026-03-31 13:06:10', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:06:10', 0.00, 0),
(263, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 18, '2026-03-31 13:06:15', '2026-03-31 13:06:15', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:06:15', 0.00, 0),
(264, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=13', 0, '2026-03-31', 18, '2026-03-31 13:08:03', '2026-03-31 13:08:03', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:08:03', 0.00, 0),
(265, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/checkout.php', 0, '2026-03-31', 18, '2026-03-31 13:08:15', '2026-03-31 13:08:15', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:08:15', 0.00, 0),
(266, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/place_order.php', 0, '2026-03-31', 18, '2026-03-31 13:08:21', '2026-03-31 13:08:21', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:08:21', 0.00, 0),
(267, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/success.php?order_id=17', 0, '2026-03-31', 18, '2026-03-31 13:10:16', '2026-03-31 13:10:16', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:10:16', 0.00, 0),
(268, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 18, '2026-03-31 13:13:39', '2026-03-31 13:13:39', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:13:39', 0.00, 0),
(269, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=14', 0, '2026-03-31', 18, '2026-03-31 13:13:43', '2026-03-31 13:13:43', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:13:43', 0.00, 0),
(270, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/checkout.php', 0, '2026-03-31', 18, '2026-03-31 13:13:48', '2026-03-31 13:13:48', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:13:48', 0.00, 0),
(271, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/place_order.php', 0, '2026-03-31', 18, '2026-03-31 13:13:53', '2026-03-31 13:13:53', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:13:53', 0.00, 0),
(272, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/success.php?order_id=18', 0, '2026-03-31', 18, '2026-03-31 13:13:53', '2026-03-31 13:13:53', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:13:53', 0.00, 0),
(273, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/', 0, '2026-03-31', 18, '2026-03-31 13:14:43', '2026-03-31 13:14:43', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:14:43', 0.00, 0),
(274, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=13', 0, '2026-03-31', 18, '2026-03-31 13:14:46', '2026-03-31 13:14:46', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:14:46', 0.00, 0),
(275, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/checkout.php', 0, '2026-03-31', 18, '2026-03-31 13:14:50', '2026-03-31 13:14:50', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:14:50', 0.00, 0),
(276, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/place_order.php', 0, '2026-03-31', 18, '2026-03-31 13:14:57', '2026-03-31 13:14:57', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:14:57', 0.00, 0),
(277, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/success.php?order_id=19', 0, '2026-03-31', 18, '2026-03-31 13:14:58', '2026-03-31 13:14:58', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:14:58', 0.00, 0),
(278, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/checkout.php', 0, '2026-03-31', 18, '2026-03-31 13:16:04', '2026-03-31 13:16:04', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:16:04', 0.00, 0),
(279, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 18, '2026-03-31 13:16:05', '2026-03-31 13:16:05', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:16:05', 0.00, 0),
(280, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/shop.php', 0, '2026-03-31', 18, '2026-03-31 13:16:07', '2026-03-31 13:16:07', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:16:07', 0.00, 0),
(281, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=15', 0, '2026-03-31', 18, '2026-03-31 13:16:09', '2026-03-31 13:16:09', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:16:09', 0.00, 0),
(282, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/checkout.php', 0, '2026-03-31', 18, '2026-03-31 13:16:13', '2026-03-31 13:16:13', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:16:13', 0.00, 0),
(283, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/place_order.php', 0, '2026-03-31', 18, '2026-03-31 13:16:18', '2026-03-31 13:16:18', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:16:18', 0.00, 0),
(284, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/success.php?order_id=20', 0, '2026-03-31', 18, '2026-03-31 13:16:19', '2026-03-31 13:16:19', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:16:19', 0.00, 0),
(285, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 18, '2026-03-31 13:16:53', '2026-03-31 13:16:53', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:16:53', 0.00, 0),
(286, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=13', 0, '2026-03-31', 18, '2026-03-31 13:16:55', '2026-03-31 13:16:55', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:16:55', 0.00, 0),
(287, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/checkout.php', 0, '2026-03-31', 18, '2026-03-31 13:17:00', '2026-03-31 13:17:00', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:17:00', 0.00, 0),
(288, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/place_order.php', 0, '2026-03-31', 18, '2026-03-31 13:17:05', '2026-03-31 13:17:05', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:17:05', 0.00, 0),
(289, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/success.php?order_id=21', 0, '2026-03-31', 18, '2026-03-31 13:17:07', '2026-03-31 13:17:07', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:17:07', 0.00, 0),
(290, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 18, '2026-03-31 13:18:06', '2026-03-31 13:18:06', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:18:06', 0.00, 0),
(291, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/checkout.php', 0, '2026-03-31', 18, '2026-03-31 13:18:27', '2026-03-31 13:18:27', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:18:27', 0.00, 0),
(292, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/place_order.php', 0, '2026-03-31', 18, '2026-03-31 13:18:32', '2026-03-31 13:18:32', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:18:32', 0.00, 0),
(293, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/shop.php', 0, '2026-03-31', 18, '2026-03-31 13:19:11', '2026-03-31 13:19:11', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:19:11', 0.00, 0),
(294, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 18, '2026-03-31 13:19:14', '2026-03-31 13:19:14', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:19:14', 0.00, 0),
(295, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/checkout.php', 0, '2026-03-31', 18, '2026-03-31 13:19:29', '2026-03-31 13:19:29', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:19:29', 0.00, 0),
(296, '6vg9pb3nv0u2q9lp56vuc7lcon', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/place_order.php', 0, '2026-03-31', 18, '2026-03-31 13:19:35', '2026-03-31 13:19:35', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:19:35', 0.00, 0),
(297, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/shop.php', 0, '2026-03-31', 18, '2026-03-31 13:19:51', '2026-03-31 13:19:51', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:19:51', 0.00, 0),
(298, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=15', 0, '2026-03-31', 18, '2026-03-31 13:19:52', '2026-03-31 13:19:52', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:19:52', 0.00, 0),
(299, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/checkout.php', 0, '2026-03-31', 18, '2026-03-31 13:19:58', '2026-03-31 13:19:58', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:19:58', 0.00, 0),
(300, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/place_order.php', 0, '2026-03-31', 18, '2026-03-31 13:20:02', '2026-03-31 13:20:02', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:20:02', 0.00, 0),
(301, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/success.php?order_id=25', 0, '2026-03-31', 18, '2026-03-31 13:20:02', '2026-03-31 13:20:02', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:20:02', 0.00, 0),
(302, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/shop.php', 0, '2026-03-31', 18, '2026-03-31 13:20:05', '2026-03-31 13:20:05', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:20:05', 0.00, 0),
(303, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 18, '2026-03-31 13:22:23', '2026-03-31 13:22:23', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:22:23', 0.00, 0),
(304, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=14', 0, '2026-03-31', 18, '2026-03-31 13:22:26', '2026-03-31 13:22:26', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:22:26', 0.00, 0),
(305, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/checkout.php', 0, '2026-03-31', 18, '2026-03-31 13:22:31', '2026-03-31 13:22:31', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:22:31', 0.00, 0),
(306, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/place_order.php', 0, '2026-03-31', 18, '2026-03-31 13:22:37', '2026-03-31 13:22:37', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:22:37', 0.00, 0),
(307, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/success.php?order_id=26', 0, '2026-03-31', 18, '2026-03-31 13:22:37', '2026-03-31 13:22:37', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:22:37', 0.00, 0),
(308, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/shop.php', 0, '2026-03-31', 18, '2026-03-31 13:22:41', '2026-03-31 13:22:41', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:22:41', 0.00, 0),
(309, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/checkout.php', 0, '2026-03-31', 18, '2026-03-31 13:24:22', '2026-03-31 13:24:22', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:24:22', 0.00, 0),
(310, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/place_order.php', 0, '2026-03-31', 18, '2026-03-31 13:24:26', '2026-03-31 13:24:26', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:24:26', 0.00, 0),
(311, '549plf34sg0311h8g05k41fcee', '8.8.8.8', 'United States', 'US', '/closetbaddie/success.php?order_id=27', 0, '2026-03-31', 18, '2026-03-31 13:24:27', '2026-03-31 13:24:27', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:24:27', 0.00, 0),
(312, 'qd17j8qi5dki5cot1jlmk4eoek', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 18, '2026-03-31 13:25:08', '2026-03-31 13:25:08', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:25:08', 0.00, 0),
(313, 'qd17j8qi5dki5cot1jlmk4eoek', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=15', 0, '2026-03-31', 18, '2026-03-31 13:25:11', '2026-03-31 13:25:11', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:25:11', 0.00, 0),
(314, 'qd17j8qi5dki5cot1jlmk4eoek', '8.8.8.8', 'United States', 'US', '/closetbaddie/checkout.php', 0, '2026-03-31', 18, '2026-03-31 13:25:16', '2026-03-31 13:25:16', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:25:16', 0.00, 0),
(315, 'qd17j8qi5dki5cot1jlmk4eoek', '8.8.8.8', 'United States', 'US', '/closetbaddie/place_order.php', 0, '2026-03-31', 18, '2026-03-31 13:25:20', '2026-03-31 13:25:20', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:25:20', 0.00, 0),
(316, 'qd17j8qi5dki5cot1jlmk4eoek', '8.8.8.8', 'United States', 'US', '/closetbaddie/success.php?order_id=28', 0, '2026-03-31', 18, '2026-03-31 13:25:21', '2026-03-31 13:25:21', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:25:21', 0.00, 0),
(317, 'qd17j8qi5dki5cot1jlmk4eoek', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 18, '2026-03-31 13:25:29', '2026-03-31 13:25:29', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:25:29', 0.00, 0),
(318, 'qd17j8qi5dki5cot1jlmk4eoek', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=14', 0, '2026-03-31', 18, '2026-03-31 13:25:33', '2026-03-31 13:25:33', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:25:33', 0.00, 0),
(319, 'qd17j8qi5dki5cot1jlmk4eoek', '8.8.8.8', 'United States', 'US', '/closetbaddie/checkout.php', 0, '2026-03-31', 18, '2026-03-31 13:25:38', '2026-03-31 13:25:38', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:25:38', 0.00, 0),
(320, 'qd17j8qi5dki5cot1jlmk4eoek', '8.8.8.8', 'United States', 'US', '/closetbaddie/place_order.php', 0, '2026-03-31', 18, '2026-03-31 13:25:43', '2026-03-31 13:25:43', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:25:43', 0.00, 0),
(321, 'qd17j8qi5dki5cot1jlmk4eoek', '8.8.8.8', 'United States', 'US', '/closetbaddie/success.php?order_id=29', 0, '2026-03-31', 18, '2026-03-31 13:25:43', '2026-03-31 13:25:43', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:25:43', 0.00, 0),
(322, 'mgt4q2r84vbkefr1qk99b1kpsc', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 18, '2026-03-31 13:32:57', '2026-03-31 13:32:57', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:32:57', 0.00, 0),
(323, '8sgan3kq8uee9b2ncq7hek9705', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=14', 0, '2026-03-31', 18, '2026-03-31 13:32:59', '2026-03-31 13:32:59', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:32:59', 0.00, 0),
(324, 'gdnhtk96lg23pko3gb0bu22ebr', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 18, '2026-03-31 13:33:05', '2026-03-31 13:33:05', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:33:05', 0.00, 0),
(325, 'dohbhhn3v8srftq75hesgjmful', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=14', 0, '2026-03-31', 18, '2026-03-31 13:33:08', '2026-03-31 13:33:08', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:33:08', 0.00, 0),
(326, 'qd17j8qi5dki5cot1jlmk4eoek', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 18, '2026-03-31 13:33:24', '2026-03-31 13:33:24', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:33:24', 0.00, 0),
(327, 'qd17j8qi5dki5cot1jlmk4eoek', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=14', 0, '2026-03-31', 18, '2026-03-31 13:33:26', '2026-03-31 13:33:26', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:33:26', 0.00, 0),
(328, 'qd17j8qi5dki5cot1jlmk4eoek', '8.8.8.8', 'United States', 'US', '/closetbaddie/checkout.php', 0, '2026-03-31', 18, '2026-03-31 13:33:32', '2026-03-31 13:33:32', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:33:32', 0.00, 0),
(329, 'qd17j8qi5dki5cot1jlmk4eoek', '8.8.8.8', 'United States', 'US', '/closetbaddie/place_order.php', 0, '2026-03-31', 18, '2026-03-31 13:33:36', '2026-03-31 13:33:36', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:33:36', 0.00, 0),
(330, 'qd17j8qi5dki5cot1jlmk4eoek', '8.8.8.8', 'United States', 'US', '/closetbaddie/success.php?order_id=31', 0, '2026-03-31', 18, '2026-03-31 13:33:37', '2026-03-31 13:33:37', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:33:37', 0.00, 0),
(331, 'qd17j8qi5dki5cot1jlmk4eoek', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 18, '2026-03-31 13:35:00', '2026-03-31 13:35:00', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:35:00', 0.00, 0),
(332, 'qd17j8qi5dki5cot1jlmk4eoek', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=13', 0, '2026-03-31', 18, '2026-03-31 13:35:02', '2026-03-31 13:35:02', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:35:02', 0.00, 0),
(333, 'qd17j8qi5dki5cot1jlmk4eoek', '8.8.8.8', 'United States', 'US', '/closetbaddie/checkout.php', 0, '2026-03-31', 18, '2026-03-31 13:35:09', '2026-03-31 13:35:09', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:35:09', 0.00, 0),
(334, 'qd17j8qi5dki5cot1jlmk4eoek', '8.8.8.8', 'United States', 'US', '/closetbaddie/place_order.php', 0, '2026-03-31', 18, '2026-03-31 13:35:17', '2026-03-31 13:35:17', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:35:17', 0.00, 0),
(335, 'qd17j8qi5dki5cot1jlmk4eoek', '8.8.8.8', 'United States', 'US', '/closetbaddie/success.php?order_id=32', 0, '2026-03-31', 18, '2026-03-31 13:35:17', '2026-03-31 13:35:17', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:35:17', 0.00, 0),
(336, 'qd17j8qi5dki5cot1jlmk4eoek', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 18, '2026-03-31 13:37:16', '2026-03-31 13:37:16', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:37:16', 0.00, 0),
(337, 'qd17j8qi5dki5cot1jlmk4eoek', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=11', 0, '2026-03-31', 18, '2026-03-31 13:37:45', '2026-03-31 13:37:45', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:37:45', 0.00, 0),
(338, 'qd17j8qi5dki5cot1jlmk4eoek', '8.8.8.8', 'United States', 'US', '/closetbaddie/checkout.php', 0, '2026-03-31', 18, '2026-03-31 13:37:51', '2026-03-31 13:37:51', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:37:51', 0.00, 0),
(339, 'qd17j8qi5dki5cot1jlmk4eoek', '8.8.8.8', 'United States', 'US', '/closetbaddie/place_order.php', 0, '2026-03-31', 18, '2026-03-31 13:37:56', '2026-03-31 13:37:56', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:37:56', 0.00, 0),
(340, 'qd17j8qi5dki5cot1jlmk4eoek', '8.8.8.8', 'United States', 'US', '/closetbaddie/success.php?order_id=33', 0, '2026-03-31', 18, '2026-03-31 13:37:57', '2026-03-31 13:37:57', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:37:57', 0.00, 0),
(341, 'qd17j8qi5dki5cot1jlmk4eoek', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/index.php', 0, '2026-03-31', 18, '2026-03-31 13:54:40', '2026-03-31 13:54:40', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:54:40', 0.00, 0),
(342, 's1tuang1lqmdrcsqmm1ll30l4a', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/index.php', 0, '2026-03-31', 18, '2026-03-31 13:54:42', '2026-03-31 13:54:42', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:54:42', 0.00, 0),
(343, 'a9bchqbpbbqqlgmk9r95po77sl', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/index.php', 0, '2026-03-31', 18, '2026-03-31 13:55:09', '2026-03-31 13:55:09', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:55:09', 0.00, 0),
(344, 'a9bchqbpbbqqlgmk9r95po77sl', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/shop.php', 0, '2026-03-31', 18, '2026-03-31 13:55:15', '2026-03-31 13:55:15', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:55:15', 0.00, 0),
(345, 'a9bchqbpbbqqlgmk9r95po77sl', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/product_detail.php?id=15', 0, '2026-03-31', 18, '2026-03-31 13:55:17', '2026-03-31 13:55:17', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:55:17', 0.00, 0),
(346, 'a9bchqbpbbqqlgmk9r95po77sl', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/checkout.php', 0, '2026-03-31', 18, '2026-03-31 13:55:23', '2026-03-31 13:55:23', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:55:23', 0.00, 0),
(347, 'a9bchqbpbbqqlgmk9r95po77sl', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/place_order.php', 0, '2026-03-31', 18, '2026-03-31 13:55:42', '2026-03-31 13:55:42', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:55:42', 0.00, 0),
(348, 'a9bchqbpbbqqlgmk9r95po77sl', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/success.php?order_id=34', 0, '2026-03-31', 18, '2026-03-31 13:55:43', '2026-03-31 13:55:43', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:55:43', 0.00, 0),
(349, 'ulsj1kamuomicc0bf1jepm8lhp', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/index.php', 0, '2026-03-31', 18, '2026-03-31 13:56:44', '2026-03-31 13:56:44', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:56:44', 0.00, 0),
(350, 'ulsj1kamuomicc0bf1jepm8lhp', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/product_detail.php?id=13', 0, '2026-03-31', 18, '2026-03-31 13:56:46', '2026-03-31 13:56:46', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:56:46', 0.00, 0),
(351, 'ulsj1kamuomicc0bf1jepm8lhp', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/checkout.php', 0, '2026-03-31', 18, '2026-03-31 13:56:50', '2026-03-31 13:56:50', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:56:50', 0.00, 0),
(352, 'ulsj1kamuomicc0bf1jepm8lhp', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/place_order.php', 0, '2026-03-31', 18, '2026-03-31 13:56:56', '2026-03-31 13:56:56', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:56:56', 0.00, 0),
(353, 'ulsj1kamuomicc0bf1jepm8lhp', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/success.php?order_id=35', 0, '2026-03-31', 18, '2026-03-31 13:56:56', '2026-03-31 13:56:56', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:56:56', 0.00, 0),
(354, 'ulsj1kamuomicc0bf1jepm8lhp', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/index.php', 0, '2026-03-31', 18, '2026-03-31 13:57:31', '2026-03-31 13:57:31', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:57:31', 0.00, 0),
(355, 'b3lna2hsbtma04m4j5764kfpqf', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/index.php', 0, '2026-03-31', 18, '2026-03-31 13:57:40', '2026-03-31 13:57:40', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:57:40', 0.00, 0),
(356, 'b3lna2hsbtma04m4j5764kfpqf', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/login.php', 0, '2026-03-31', 18, '2026-03-31 13:57:41', '2026-03-31 13:57:41', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:57:41', 0.00, 0),
(357, 'b3lna2hsbtma04m4j5764kfpqf', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/index.php', 0, '2026-03-31', 18, '2026-03-31 13:57:46', '2026-03-31 13:57:46', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 13:57:46', 0.00, 0),
(358, 'sc38oppprvda8v10p92epio2bl', '8.8.8.8', 'United States', 'US', '/closetbaddie/', 0, '2026-03-31', 20, '2026-03-31 15:16:34', '2026-03-31 15:16:34', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 15:16:34', 0.00, 0),
(359, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/', 0, '2026-03-31', 20, '2026-03-31 15:20:30', '2026-03-31 15:20:30', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 15:20:30', 0.00, 0),
(360, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 20, '2026-03-31 15:21:53', '2026-03-31 15:21:53', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:21:53', 0.00, 0),
(361, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php', 0, '2026-03-31', 20, '2026-03-31 15:21:58', '2026-03-31 15:21:58', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:21:58', 0.00, 0),
(362, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/search.php?ajax=1&q=&min_p=0&max_p=25000', 0, '2026-03-31', 20, '2026-03-31 15:22:00', '2026-03-31 15:22:00', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:22:00', 0.00, 0),
(363, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=m&min_p=0&max_p=25000', 0, '2026-03-31', 20, '2026-03-31 15:22:04', '2026-03-31 15:22:04', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:22:04', 0.00, 0),
(364, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 20, '2026-03-31 15:22:15', '2026-03-31 15:22:15', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:22:15', 0.00, 0),
(365, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/shop.php', 0, '2026-03-31', 20, '2026-03-31 15:22:17', '2026-03-31 15:22:17', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:22:17', 0.00, 0),
(366, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=13', 0, '2026-03-31', 20, '2026-03-31 15:22:24', '2026-03-31 15:22:24', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:22:24', 0.00, 0),
(367, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/checkout.php', 0, '2026-03-31', 20, '2026-03-31 15:22:56', '2026-03-31 15:22:56', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:22:56', 0.00, 0),
(368, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/place_order.php', 0, '2026-03-31', 20, '2026-03-31 15:24:08', '2026-03-31 15:24:08', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:24:08', 0.00, 0),
(369, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/success.php?order_id=36', 0, '2026-03-31', 20, '2026-03-31 15:24:08', '2026-03-31 15:24:08', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:24:08', 0.00, 0),
(370, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/shop.php', 0, '2026-03-31', 20, '2026-03-31 15:24:20', '2026-03-31 15:24:20', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:24:20', 0.00, 0),
(371, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 20, '2026-03-31 15:24:23', '2026-03-31 15:24:23', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:24:23', 0.00, 0),
(372, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/login.php', 0, '2026-03-31', 20, '2026-03-31 15:24:25', '2026-03-31 15:24:25', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:24:25', 0.00, 0),
(373, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/register.php', 0, '2026-03-31', 20, '2026-03-31 15:24:29', '2026-03-31 15:24:29', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:24:29', 0.00, 0),
(374, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 20, '2026-03-31 15:24:32', '2026-03-31 15:24:32', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:24:32', 0.00, 0),
(375, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/trackorder.php', 0, '2026-03-31', 20, '2026-03-31 15:24:35', '2026-03-31 15:24:35', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:24:35', 0.00, 0),
(376, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 20, '2026-03-31 15:32:27', '2026-03-31 15:32:27', 'Mobile', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:32:27', 0.00, 0),
(377, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/search.php', 0, '2026-03-31', 20, '2026-03-31 15:36:11', '2026-03-31 15:36:11', 'Desktop', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:36:11', 0.00, 0),
(378, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=&min_p=0&max_p=25000', 0, '2026-03-31', 20, '2026-03-31 15:36:12', '2026-03-31 15:36:12', 'Desktop', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:36:12', 0.00, 0),
(379, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=R&min_p=0&max_p=25000', 0, '2026-03-31', 20, '2026-03-31 15:36:22', '2026-03-31 15:36:22', 'Desktop', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:36:22', 0.00, 0),
(380, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=RE&min_p=0&max_p=25000', 0, '2026-03-31', 20, '2026-03-31 15:36:23', '2026-03-31 15:36:23', 'Desktop', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:36:23', 0.00, 0),
(381, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=RED&min_p=0&max_p=25000', 0, '2026-03-31', 20, '2026-03-31 15:36:24', '2026-03-31 15:36:24', 'Desktop', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:36:24', 0.00, 0),
(382, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=&min_p=0&max_p=25000', 0, '2026-03-31', 20, '2026-03-31 15:36:27', '2026-03-31 15:36:27', 'Desktop', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:36:27', 0.00, 0),
(383, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=P&min_p=0&max_p=25000', 0, '2026-03-31', 20, '2026-03-31 15:36:28', '2026-03-31 15:36:28', 'Desktop', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:36:28', 0.00, 0),
(384, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=PI&min_p=0&max_p=25000', 0, '2026-03-31', 20, '2026-03-31 15:36:28', '2026-03-31 15:36:28', 'Desktop', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:36:28', 0.00, 0),
(385, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=PIN&min_p=0&max_p=25000', 0, '2026-03-31', 20, '2026-03-31 15:36:29', '2026-03-31 15:36:29', 'Desktop', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:36:29', 0.00, 0),
(386, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=PI&min_p=0&max_p=25000', 0, '2026-03-31', 20, '2026-03-31 15:36:31', '2026-03-31 15:36:31', 'Desktop', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:36:31', 0.00, 0),
(387, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=P&min_p=0&max_p=25000', 0, '2026-03-31', 20, '2026-03-31 15:36:32', '2026-03-31 15:36:32', 'Desktop', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:36:32', 0.00, 0),
(388, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/search.php?ajax=1&q=&min_p=0&max_p=25000', 0, '2026-03-31', 20, '2026-03-31 15:36:34', '2026-03-31 15:36:34', 'Desktop', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:36:34', 0.00, 0),
(389, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 20, '2026-03-31 15:36:35', '2026-03-31 15:36:35', 'Desktop', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:36:35', 0.00, 0),
(390, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/shop.php', 0, '2026-03-31', 20, '2026-03-31 15:36:42', '2026-03-31 15:36:42', 'Desktop', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:36:42', 0.00, 0),
(391, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=14', 0, '2026-03-31', 20, '2026-03-31 15:36:46', '2026-03-31 15:36:46', 'Desktop', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:36:46', 0.00, 0),
(392, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/checkout.php', 0, '2026-03-31', 20, '2026-03-31 15:37:56', '2026-03-31 15:37:56', 'Desktop', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:37:56', 0.00, 0),
(393, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/place_order.php', 0, '2026-03-31', 20, '2026-03-31 15:38:15', '2026-03-31 15:38:15', 'Desktop', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:38:15', 0.00, 0),
(394, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/success.php?order_id=37', 0, '2026-03-31', 20, '2026-03-31 15:38:15', '2026-03-31 15:38:15', 'Desktop', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:38:15', 0.00, 0),
(395, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/shop.php', 0, '2026-03-31', 20, '2026-03-31 15:38:22', '2026-03-31 15:38:22', 'Desktop', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:38:22', 0.00, 0),
(396, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 20, '2026-03-31 15:38:24', '2026-03-31 15:38:24', 'Desktop', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:38:24', 0.00, 0),
(397, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/trackorder.php', 0, '2026-03-31', 20, '2026-03-31 15:38:27', '2026-03-31 15:38:27', 'Desktop', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:38:27', 0.00, 0),
(398, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 20, '2026-03-31 15:38:41', '2026-03-31 15:38:41', 'Desktop', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:38:41', 0.00, 0),
(399, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/login.php', 0, '2026-03-31', 20, '2026-03-31 15:38:45', '2026-03-31 15:38:45', 'Desktop', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:38:45', 0.00, 0),
(400, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/register.php', 0, '2026-03-31', 20, '2026-03-31 15:38:49', '2026-03-31 15:38:49', 'Desktop', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:38:49', 0.00, 0),
(401, '1igstshlo7kudg0ns2ijod7njd', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 20, '2026-03-31 15:38:56', '2026-03-31 15:38:56', 'Desktop', 'macOS', 'Safari', NULL, 'view', 0, '2026-03-31 15:38:56', 0.00, 0),
(402, 'h6sog729t89b9rkldq4efm26j3', '8.8.8.8', 'United States', 'US', '/closetbaddie/', 0, '2026-03-31', 21, '2026-03-31 16:11:08', '2026-03-31 16:11:08', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 16:11:08', 0.00, 0),
(403, 'l0a5o8i7c6u34j6e37agclf8fv', '8.8.8.8', 'United States', 'US', '/closetbaddie/', 0, '2026-03-31', 22, '2026-03-31 17:28:16', '2026-03-31 17:28:16', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 17:28:16', 0.00, 0),
(404, 'l0a5o8i7c6u34j6e37agclf8fv', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php', 0, '2026-03-31', 22, '2026-03-31 17:28:21', '2026-03-31 17:28:21', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 17:28:21', 0.00, 0),
(405, 'l0a5o8i7c6u34j6e37agclf8fv', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=&min_p=0&max_p=25000', 0, '2026-03-31', 22, '2026-03-31 17:28:22', '2026-03-31 17:28:22', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 17:28:22', 0.00, 0);
INSERT INTO `visitor_analytics` (`id`, `session_id`, `ip_address`, `country`, `country_code`, `page_url`, `time_spent`, `visit_date`, `visit_hour`, `last_heartbeat`, `created_at`, `device_type`, `os_platform`, `browser_name`, `screen_resolution`, `event_type`, `is_abandoned`, `last_action_timestamp`, `revenue`, `is_converted`) VALUES
(406, 'l0a5o8i7c6u34j6e37agclf8fv', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=Heritage%20Carpet%20Print%20Streetwear%20Tee&min_p=0&max_p=25000', 0, '2026-03-31', 22, '2026-03-31 17:28:23', '2026-03-31 17:28:23', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 17:28:23', 0.00, 0),
(407, 'l0a5o8i7c6u34j6e37agclf8fv', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=15', 0, '2026-03-31', 22, '2026-03-31 17:28:25', '2026-03-31 17:28:25', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 17:28:25', 0.00, 0),
(408, 'l0a5o8i7c6u34j6e37agclf8fv', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 22, '2026-03-31 17:28:42', '2026-03-31 17:28:42', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 17:28:42', 0.00, 0),
(409, 'l0a5o8i7c6u34j6e37agclf8fv', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php', 0, '2026-03-31', 22, '2026-03-31 17:28:50', '2026-03-31 17:28:50', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 17:28:50', 0.00, 0),
(410, 'l0a5o8i7c6u34j6e37agclf8fv', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=&min_p=0&max_p=25000', 0, '2026-03-31', 22, '2026-03-31 17:28:51', '2026-03-31 17:28:51', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 17:28:51', 0.00, 0),
(411, 'l0a5o8i7c6u34j6e37agclf8fv', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=Heritage%20Carpet%20Print%20Streetwear%20Tee&min_p=0&max_p=25000', 0, '2026-03-31', 22, '2026-03-31 17:28:51', '2026-03-31 17:28:51', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 17:28:51', 0.00, 0),
(412, 'l0a5o8i7c6u34j6e37agclf8fv', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=15', 0, '2026-03-31', 22, '2026-03-31 17:28:53', '2026-03-31 17:28:53', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 17:28:53', 0.00, 0),
(413, 'l0a5o8i7c6u34j6e37agclf8fv', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-03-31', 22, '2026-03-31 17:28:57', '2026-03-31 17:28:57', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 17:28:57', 0.00, 0),
(414, 'l0a5o8i7c6u34j6e37agclf8fv', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php', 0, '2026-03-31', 22, '2026-03-31 17:29:14', '2026-03-31 17:29:14', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 17:29:14', 0.00, 0),
(415, 'l0a5o8i7c6u34j6e37agclf8fv', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=&min_p=0&max_p=25000', 0, '2026-03-31', 22, '2026-03-31 17:29:15', '2026-03-31 17:29:15', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 17:29:15', 0.00, 0),
(416, 'l0a5o8i7c6u34j6e37agclf8fv', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=Heritage%20Carpet%20Print%20Streetwear%20Tee&min_p=0&max_p=25000', 0, '2026-03-31', 22, '2026-03-31 17:29:16', '2026-03-31 17:29:16', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 17:29:16', 0.00, 0),
(417, 'l0a5o8i7c6u34j6e37agclf8fv', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=15', 0, '2026-03-31', 22, '2026-03-31 17:29:17', '2026-03-31 17:29:17', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 17:29:17', 0.00, 0),
(418, 'l0a5o8i7c6u34j6e37agclf8fv', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/search.php', 0, '2026-03-31', 22, '2026-03-31 17:29:25', '2026-03-31 17:29:25', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 17:29:25', 0.00, 0),
(419, 'l0a5o8i7c6u34j6e37agclf8fv', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=&min_p=0&max_p=25000', 0, '2026-03-31', 22, '2026-03-31 17:29:26', '2026-03-31 17:29:26', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 17:29:26', 0.00, 0),
(420, 'l0a5o8i7c6u34j6e37agclf8fv', '8.8.8.8', 'United States', 'US', '/closetbaddie/search.php?ajax=1&q=Heritage%20Carpet%20Print%20Streetwear%20Tee&min_p=0&max_p=25000', 0, '2026-03-31', 22, '2026-03-31 17:29:27', '2026-03-31 17:29:27', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 17:29:27', 0.00, 0),
(421, 'l0a5o8i7c6u34j6e37agclf8fv', '8.8.8.8', 'United States', 'US', '/closetbaddie/product_detail.php?id=15', 0, '2026-03-31', 22, '2026-03-31 17:29:28', '2026-03-31 17:29:28', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 17:29:28', 0.00, 0),
(422, 'l0a5o8i7c6u34j6e37agclf8fv', '8.8.8.8', 'United States', 'US', '/closetbaddie/checkout.php', 0, '2026-03-31', 22, '2026-03-31 17:29:33', '2026-03-31 17:29:33', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 17:29:33', 0.00, 0),
(423, 'l0a5o8i7c6u34j6e37agclf8fv', '8.8.8.8', 'United States', 'US', '/closetbaddie/place_order.php', 0, '2026-03-31', 22, '2026-03-31 17:29:39', '2026-03-31 17:29:39', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 17:29:39', 0.00, 0),
(424, 'l0a5o8i7c6u34j6e37agclf8fv', '8.8.8.8', 'United States', 'US', '/closetbaddie/success.php?order_id=38', 0, '2026-03-31', 22, '2026-03-31 17:29:40', '2026-03-31 17:29:40', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 17:29:40', 0.00, 0),
(425, 'l0a5o8i7c6u34j6e37agclf8fv', '8.8.8.8', 'United States', 'US', '/closetbaddie/shop.php', 0, '2026-03-31', 22, '2026-03-31 17:29:43', '2026-03-31 17:29:43', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-03-31 17:29:43', 0.00, 0),
(426, 'dihu6uiqbvlodf3rgi8r2ss7s4', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/', 0, '2026-04-01', 14, '2026-04-01 09:01:52', '2026-04-01 09:01:52', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-04-01 09:01:52', 0.00, 0),
(427, 'dihu6uiqbvlodf3rgi8r2ss7s4', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/product_detail.php?id=12', 0, '2026-04-01', 14, '2026-04-01 09:02:35', '2026-04-01 09:02:35', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-04-01 09:02:35', 0.00, 0),
(428, 'dihu6uiqbvlodf3rgi8r2ss7s4', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/checkout.php', 0, '2026-04-01', 14, '2026-04-01 09:02:45', '2026-04-01 09:02:45', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-04-01 09:02:45', 0.00, 0),
(429, 'dihu6uiqbvlodf3rgi8r2ss7s4', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/place_order.php', 0, '2026-04-01', 14, '2026-04-01 09:02:52', '2026-04-01 09:02:52', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-04-01 09:02:52', 0.00, 0),
(430, 'dihu6uiqbvlodf3rgi8r2ss7s4', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/success.php?order_id=39', 0, '2026-04-01', 14, '2026-04-01 09:02:52', '2026-04-01 09:02:52', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-04-01 09:02:52', 0.00, 0),
(431, 'dihu6uiqbvlodf3rgi8r2ss7s4', '8.8.8.8', 'United States', 'US', '/closetbaddie/index.php', 0, '2026-04-01', 15, '2026-04-01 10:02:47', '2026-04-01 10:02:47', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-04-01 10:02:47', 0.00, 0),
(432, 'bg0fet5rfvtnskn31jq5mb98ln', '8.8.8.8', 'United States', 'US', '/closetbaddie/', 0, '2026-04-01', 16, '2026-04-01 11:23:12', '2026-04-01 11:23:12', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-04-01 11:23:12', 0.00, 0),
(433, 'dnepdplkdogpi7ts81i4jp1j7p', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/', 0, '2026-04-12', 13, '2026-04-12 08:48:20', '2026-04-12 08:48:20', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-04-12 08:48:20', 0.00, 0),
(434, 'dnepdplkdogpi7ts81i4jp1j7p', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/index.php', 0, '2026-04-12', 13, '2026-04-12 08:49:13', '2026-04-12 08:49:13', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-04-12 08:49:13', 0.00, 0),
(435, 'bjnt3ip0t42lpidtkk5v0ehmc8', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/index.php', 0, '2026-04-12', 13, '2026-04-12 08:49:47', '2026-04-12 08:49:47', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-04-12 08:49:47', 0.00, 0),
(436, 'bjnt3ip0t42lpidtkk5v0ehmc8', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/', 0, '2026-04-12', 13, '2026-04-12 08:49:54', '2026-04-12 08:49:54', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-04-12 08:49:54', 0.00, 0),
(437, 'dnepdplkdogpi7ts81i4jp1j7p', '8.8.8.8', 'Localhost', 'XX', '/closetbaddie/product_detail.php?id=15', 0, '2026-04-12', 13, '2026-04-12 08:50:46', '2026-04-12 08:50:46', 'Desktop', 'Windows', 'Chrome', NULL, 'view', 0, '2026-04-12 08:50:46', 0.00, 0);

-- --------------------------------------------------------

--
-- Table structure for table `visitor_logs`
--

CREATE TABLE `visitor_logs` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `page_url` varchar(255) DEFAULT NULL,
  `stay_duration` int(11) DEFAULT 0,
  `visit_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `session_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `visitor_logs`
--

INSERT INTO `visitor_logs` (`id`, `ip_address`, `country_code`, `page_url`, `stay_duration`, `visit_time`, `session_id`) VALUES
(1, '::1', 'XX', '/closetbaddie/admin/tracker.php', 0, '2026-03-30 13:37:56', 't4gt86ao05j41q9iu6a1ccgtdf');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `order_items_ibfk_2` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_gallery`
--
ALTER TABLE `product_gallery`
  ADD PRIMARY KEY (`gallery_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`variant_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`setting_key`);

--
-- Indexes for table `size_guides`
--
ALTER TABLE `size_guides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `email_2` (`email`);

--
-- Indexes for table `visitor_analytics`
--
ALTER TABLE `visitor_analytics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitor_logs`
--
ALTER TABLE `visitor_logs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `product_gallery`
--
ALTER TABLE `product_gallery`
  MODIFY `gallery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `variant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `size_guides`
--
ALTER TABLE `size_guides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `visitor_analytics`
--
ALTER TABLE `visitor_analytics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=438;

--
-- AUTO_INCREMENT for table `visitor_logs`
--
ALTER TABLE `visitor_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL;

--
-- Constraints for table `product_gallery`
--
ALTER TABLE `product_gallery`
  ADD CONSTRAINT `product_gallery_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `product_variants_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
