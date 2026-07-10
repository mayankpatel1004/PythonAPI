-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 10, 2026 at 02:17 PM
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
-- Database: `Demonstration`
--

-- --------------------------------------------------------

--
-- Table structure for table `action`
--

CREATE TABLE `action` (
  `action_id` int(11) NOT NULL,
  `action` varchar(255) DEFAULT NULL,
  `record_id` int(11) NOT NULL DEFAULT 0,
  `table_name` varchar(255) DEFAULT NULL,
  `record_name` varchar(255) DEFAULT NULL,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `display_status` varchar(1) NOT NULL DEFAULT 'Y',
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_by_name` varchar(255) DEFAULT NULL,
  `created_by_role` int(11) NOT NULL DEFAULT 0,
  `deleted_status` varchar(1) NOT NULL DEFAULT 'N',
  `deleted_by` int(11) NOT NULL DEFAULT 0,
  `deleted_by_name` varchar(255) DEFAULT NULL,
  `deleted_time` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `cart_id_pk` int(11) DEFAULT 0,
  `cart_customer_id` varchar(255) DEFAULT NULL,
  `customer_pin` int(11) NOT NULL DEFAULT 0,
  `pos_customer` varchar(1) NOT NULL DEFAULT 'N',
  `name` varchar(255) DEFAULT NULL,
  `first_name` varchar(191) DEFAULT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `role_id` int(11) NOT NULL DEFAULT 0,
  `guest_customer` varchar(1) NOT NULL DEFAULT '0',
  `access_token` varchar(255) DEFAULT NULL,
  `security_question_id` int(11) NOT NULL DEFAULT 0,
  `security_answer` varchar(191) DEFAULT NULL,
  `user_address1` varchar(191) DEFAULT NULL,
  `user_address2` varchar(191) DEFAULT NULL,
  `user_city` varchar(191) DEFAULT NULL,
  `user_state` varchar(191) DEFAULT NULL,
  `user_zipcode` varchar(191) DEFAULT NULL,
  `user_country` varchar(191) DEFAULT NULL,
  `contact_number` varchar(191) DEFAULT NULL,
  `display_on_listing` varchar(1) NOT NULL DEFAULT 'Y',
  `show_action_checkbox` varchar(1) NOT NULL DEFAULT 'Y',
  `web_token` varchar(255) DEFAULT NULL,
  `api_token` varchar(255) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `device_id` varchar(255) DEFAULT NULL,
  `device_name` varchar(255) DEFAULT NULL,
  `item_type` varchar(25) NOT NULL DEFAULT 'users',
  `wallet_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `blocked` varchar(1) NOT NULL DEFAULT 'N',
  `display_order` int(11) NOT NULL DEFAULT 0,
  `display_status` varchar(1) NOT NULL DEFAULT 'Y',
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_by_name` varchar(255) DEFAULT NULL,
  `created_by_role` int(11) NOT NULL DEFAULT 0,
  `deleted_status` varchar(1) NOT NULL DEFAULT 'N',
  `deleted_by` int(11) NOT NULL DEFAULT 0,
  `deleted_by_name` varchar(255) DEFAULT NULL,
  `deleted_time` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL DEFAULT 0,
  `item_title` varchar(255) DEFAULT NULL,
  `item_alias` varchar(255) DEFAULT NULL,
  `item_parent` int(11) NOT NULL DEFAULT 0,
  `item_type` varchar(255) DEFAULT NULL,
  `item_sections_id` varchar(255) DEFAULT NULL,
  `item_description` text DEFAULT NULL,
  `attachment1` varchar(255) DEFAULT NULL,
  `attachment2` varchar(255) DEFAULT NULL,
  `item_shortdescription` text DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `controller` varchar(50) DEFAULT NULL,
  `action` varchar(50) DEFAULT 'index',
  `published_at` date DEFAULT NULL,
  `published_end_at` date DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `display_status` varchar(1) NOT NULL DEFAULT 'Y',
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_by_name` varchar(255) DEFAULT NULL,
  `created_by_role` int(11) NOT NULL DEFAULT 0,
  `deleted_status` varchar(1) NOT NULL DEFAULT 'N',
  `deleted_by` int(11) NOT NULL DEFAULT 0,
  `deleted_by_name` varchar(255) DEFAULT NULL,
  `deleted_time` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_id`, `site_id`, `item_title`, `item_alias`, `item_parent`, `item_type`, `item_sections_id`, `item_description`, `attachment1`, `attachment2`, `item_shortdescription`, `user_id`, `controller`, `action`, `published_at`, `published_end_at`, `meta_title`, `meta_description`, `display_order`, `display_status`, `created_by`, `created_by_name`, `created_by_role`, `deleted_status`, `deleted_by`, `deleted_by_name`, `deleted_time`, `created_at`, `updated_at`) VALUES
(1, 0, 'Home', 'home', 100, 'page', '24', 'description update', 'attachment1-1758612676875.png', 'attachment2-1758612676877.png', 'short description update', 3, 'controller', 'action', '2026-05-26', '2026-05-26', 'meta title update', 'meta description update', 1, 'Y', 1, 'Demonstration', 1, 'N', 0, NULL, NULL, '2026-05-26 12:32:06', '2026-05-26 12:32:06'),
(2, 0, 'About Us', 'about-us', 0, 'page', NULL, 'About Us', NULL, '', '', 1, '', '', '2026-05-26', '2026-05-26', 'About Us', 'About Us', 1, 'Y', 1, 'Demonstration', 1, 'N', 0, NULL, NULL, '2026-05-26 12:32:06', '2026-05-26 12:32:06'),
(3, 0, 'Terms & Conditions', 'terms-and-conditions', 0, 'page', NULL, 'Terms & Conditions', NULL, '', '', 1, '', '', '2026-05-26', '2026-05-26', 'Terms & Conditions', 'Terms & Conditions', 2, 'Y', 1, 'Demonstration', 1, 'N', 0, NULL, NULL, '2026-05-26 12:32:06', '2026-05-26 12:32:06'),
(4, 0, 'Privacy Policy', 'privacy-policy', 0, 'page', NULL, 'Privacy Policy', NULL, '', '', 1, '', '', '2026-05-26', '2026-05-26', 'Privacy Policy', 'Privacy Policy', 3, 'Y', 1, 'Demonstration', 1, 'N', 0, NULL, NULL, '2026-05-26 12:32:06', '2026-05-26 12:32:06'),
(5, 0, 'Item1', 'item1', 0, 'default', '1', 'Item1', '1779799500_item1_4858.png', NULL, 'Item1', 0, NULL, 'index', '2026-05-26', '2031-05-26', '', '', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:45:00', '2026-05-26 12:45:00'),
(6, 0, 'Item2', 'item2', 0, 'default', '1,2,3', 'Item2', '1779799515_item1_2600.png', NULL, 'Item2', 0, NULL, 'index', '2026-05-26', '2031-05-26', '', '', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:45:15', '2026-05-26 12:45:15'),
(7, 0, 'Item3', 'item3', 0, 'default', '1,2,3,4', 'Item3', NULL, NULL, 'Item3', 0, NULL, 'index', '2026-05-26', '2031-05-26', '', '', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:45:29', '2026-05-26 12:45:29'),
(8, 0, 'Item4', 'item4', 0, 'default', '1,2,3,4', 'Item4', '1779799547_item1_7270.png', '1779799547_item2_6385.png', 'Item4', 0, NULL, 'index', '2026-05-26', '2031-05-26', '', '', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:45:47', '2026-05-26 12:45:47'),
(9, 0, 'Item5', 'item5', 0, 'default', '1,2,3,4,5', 'Item5', NULL, NULL, 'Item5', 0, NULL, 'index', '2026-05-26', '2031-05-26', '', '', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:45:59', '2026-05-26 12:45:59'),
(10, 0, 'Item6', 'item6', 0, 'default', '1,2,3,4,5,6', 'Item6', NULL, NULL, 'Item6', 0, NULL, 'index', '2026-05-26', '2031-05-26', 'Item6', '', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:46:13', '2026-05-26 12:46:13'),
(11, 0, 'Item7', 'item7', 0, 'default', '5,6,7,8,9', 'Item7', NULL, NULL, 'Item7', 0, NULL, 'index', '2026-05-26', '2031-05-26', '', '', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:46:26', '2026-05-26 12:46:26'),
(12, 0, 'Item8', 'item8', 0, 'default', '12,13,14,15,16', 'Item8', NULL, NULL, 'Item8', 0, NULL, 'index', '2026-05-26', '2031-05-26', '', '', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:46:40', '2026-05-26 12:46:40'),
(13, 0, 'Item9', 'item9', 0, 'default', '1,2,3,4', 'Item9', NULL, NULL, 'Item9', 0, NULL, 'index', '2026-05-26', '2031-05-26', '', '', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:46:51', '2026-05-26 12:46:51'),
(14, 0, 'Item10', 'item10', 0, 'default', '12,13,14,15,16', 'Item10', NULL, NULL, 'Item10', 0, NULL, 'index', '2026-05-26', '2031-05-26', '', '', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:47:02', '2026-05-26 12:47:02'),
(15, 0, 'Item11', 'item11', 0, 'default', '4,5,6,7,8,9', 'Item11', NULL, NULL, 'Item11', 0, NULL, 'index', '2026-05-26', '2031-05-26', '', '', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:47:13', '2026-05-26 12:47:13'),
(16, 0, 'Item12', 'item12', 0, 'default', '5,6,7,8,9', 'Item12', NULL, NULL, 'Item12', 0, NULL, 'index', '2026-05-26', '2031-05-26', '', '', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:47:24', '2026-05-26 12:47:24'),
(17, 0, 'Item13', 'item13', 0, 'default', '5,6,7,8,9', 'Item12', NULL, NULL, 'Item12', 0, NULL, 'index', '2026-05-26', '2031-05-26', 'Item12', '', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:47:37', '2026-05-26 12:47:37'),
(18, 0, 'Item14', 'item14', 0, 'default', '8,9,10,11', 'Item14', NULL, NULL, 'Item14', 0, NULL, 'index', '2026-05-26', '2031-05-26', '', '', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:47:56', '2026-05-26 12:47:56'),
(19, 0, 'Item15', 'item15', 0, 'default', '4,5,6,7,8', 'Item15', NULL, NULL, 'Item15', 0, NULL, 'index', '2026-05-26', '2031-05-26', '', '', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:48:09', '2026-05-26 12:48:09'),
(20, 0, 'Item16', 'item16', 0, 'default', '1,2,3', 'Item16', NULL, NULL, 'Item16', 0, NULL, 'index', '2026-05-26', '2031-05-26', '', '', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:48:22', '2026-05-26 12:48:22'),
(21, 0, 'Item17', 'item17', 0, 'default', '9,10,11,12,13', 'Item17', NULL, NULL, 'Item17', 0, NULL, 'index', '2026-05-26', '2031-05-26', '', '', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:48:34', '2026-05-26 12:48:34'),
(22, 0, 'Item18', 'item18', 0, 'default', '7,8,9,10', 'Item18', NULL, NULL, 'Item18', 0, NULL, 'index', '2026-05-26', '2031-05-26', '', '', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:48:46', '2026-05-26 12:48:46'),
(23, 0, 'Item19', 'item19', 0, 'default', '12,13,14,15', 'Item19', NULL, NULL, 'Item19', 0, NULL, 'index', '2026-05-26', '2031-05-26', '', '', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:48:57', '2026-05-26 12:48:57'),
(24, 0, 'Item20', 'item20', 0, 'default', '4,5,6,7,8,9', 'Item20', NULL, NULL, 'Item20', 0, NULL, 'index', '2026-05-26', '2031-05-26', '', '', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:49:10', '2026-05-26 12:49:10'),
(25, 0, 'Item21', 'item21', 0, 'default', '13,14', 'Item21', NULL, NULL, 'Item21', 0, NULL, 'index', '2026-05-26', '2031-05-26', '', '', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:49:25', '2026-05-26 12:49:25'),
(26, 0, 'Item22', 'item22', 0, 'default', '2,3,4,5,6', 'Item22', NULL, NULL, 'Item22', 0, NULL, 'index', '2026-05-26', '2031-05-26', '', '', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:49:39', '2026-05-26 12:49:39'),
(27, 0, 'Item23', 'item23', 0, 'default', '7,8,9,10,11', 'Item23', NULL, NULL, 'Item23', 0, NULL, 'index', '2026-05-26', '2031-05-26', '', '', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:50:02', '2026-05-26 12:50:02'),
(28, 0, 'Item24', 'item24', 0, 'default', '3,4,5', 'Item24', NULL, NULL, 'Item24', 0, NULL, 'index', '2026-05-26', '2031-05-26', '', '', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:50:13', '2026-05-26 12:50:13'),
(29, 0, 'Item25', 'item25', 0, 'default', '1,2,3,4', 'Item25', NULL, NULL, 'Item25', 0, NULL, 'index', '2026-05-26', '2031-05-26', '', '', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:50:25', '2026-05-26 12:50:25'),
(30, 0, 'dsf', 'dsf', 0, 'default', '', '<p>f</p><p>fdsf</p><p>dsf</p><p><br></p><p>fs</p><p>f</p><p>sdf</p><p>sdf</p><p>sf</p><p>sf</p><p>sfs</p><p>df</p><p>ds</p><p>ds</p><p>ds</p><p>f</p><p>sf</p><p>dsf</p><p>s</p><p>fsd</p><p>f</p><p>dsfd</p><p>sf</p><p>dsf</p><p>ds</p><p>fs</p><p>fdsfs</p>', NULL, NULL, 'fds\r\nfds\r\nfds\r\nfs\r\ndfsa', 0, NULL, 'index', '2026-05-26', '2031-05-26', '', '', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 15:29:25', '2026-05-26 18:59:25'),
(31, 0, '11111111', '11111111', 0, 'default', '1,2,3,4', '<p>&nbsp; &nbsp; 111111111<br></p>', NULL, NULL, '3333333333', 0, NULL, 'index', '2026-06-13', '2031-06-13', '11', '22', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-06-13 12:17:54', '2026-06-13 15:47:54'),
(32, 0, '11111111', '11111111-1781346007', 0, 'default', '1,2,3,4', '<p>&nbsp; &nbsp; 111111111<br></p>', NULL, NULL, '3333333333', 0, NULL, 'index', '2026-06-13', '2031-06-13', '11', '22', 0, 'Y', 1, 'Developer Account', 1, 'N', 0, NULL, NULL, '2026-06-13 12:20:07', '2026-06-13 15:50:07'),
(33, 0, '11111111', '11111111-1781346071', 0, 'default', '1,2,3,4', '<p>&nbsp; &nbsp; 111111111<br></p>', NULL, NULL, '3333333333', 0, NULL, 'index', '2026-06-13', '2031-06-13', '11', '22', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 16:34:30', '2026-06-13 12:21:11', '2026-06-13 15:51:11'),
(34, 0, '22222', '22222', 0, 'default', '1,2,3,4', '<p>22222</p>', NULL, NULL, '22222', 0, NULL, 'index', '2026-06-13', '2031-06-13', '22222', '22222', 0, 'Y', 1, 'Developer Account', 1, 'N', 0, NULL, NULL, '2026-06-13 14:21:02', '2026-06-13 17:51:02'),
(35, 0, '3333333', '3333333', 0, 'default', '17,18,22', '<p>    3333333<br></p>', NULL, NULL, '3333333', 0, NULL, 'index', '2026-06-13', '2031-06-13', '3333333', '3333333', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 18:04:49', '2026-06-13 14:32:08', '2026-06-13 18:02:08');

-- --------------------------------------------------------

--
-- Table structure for table `item_section`
--

CREATE TABLE `item_section` (
  `item_section_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL DEFAULT 0,
  `item_section_parent_id` int(11) NOT NULL DEFAULT 0,
  `section_title` varchar(255) DEFAULT NULL,
  `section_alias` varchar(255) DEFAULT NULL,
  `item_type` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `attachment1` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT 0,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `display_status` varchar(1) NOT NULL DEFAULT 'Y',
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_by_name` varchar(255) DEFAULT NULL,
  `created_by_role` int(11) NOT NULL DEFAULT 0,
  `deleted_status` varchar(1) NOT NULL DEFAULT 'N',
  `deleted_by` int(11) NOT NULL DEFAULT 0,
  `deleted_by_name` varchar(255) DEFAULT NULL,
  `deleted_time` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_section`
--

INSERT INTO `item_section` (`item_section_id`, `site_id`, `item_section_parent_id`, `section_title`, `section_alias`, `item_type`, `description`, `attachment1`, `user_id`, `meta_title`, `meta_description`, `display_order`, `display_status`, `created_by`, `created_by_name`, `created_by_role`, `deleted_status`, `deleted_by`, `deleted_by_name`, `deleted_time`, `created_at`, `updated_at`) VALUES
(1, 0, 0, 'Section1', 'section1', 'default', 'Section1', '1779799317_isec_2676.png', 0, 'Section1', 'Section1', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:41:57', '2026-05-26 12:41:57'),
(2, 0, 0, 'Section2', 'section2', 'default', 'Section2', '1779799330_isec_6580.png', 0, 'Section2', 'Section2', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:42:10', '2026-05-26 12:42:10'),
(3, 0, 0, 'Section3', 'section3', 'default', 'Section3', NULL, 0, 'Section3', 'Section3', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:42:21', '2026-05-26 12:42:21'),
(4, 0, 0, 'Section4', 'section4', 'default', 'Section4', NULL, 0, 'Section4', 'Section4', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:42:32', '2026-05-26 12:42:32'),
(5, 0, 0, 'Section5', 'section5', 'default', 'Section5', NULL, 0, 'Section5', 'Section5', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:42:44', '2026-05-26 12:42:44'),
(6, 0, 0, 'Section6', 'section6', 'default', 'Section6', NULL, 0, 'Section6', 'Section6', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:42:55', '2026-05-26 12:42:55'),
(7, 0, 0, 'Section7', 'section7', 'default', 'Section7', NULL, 0, 'Section7', 'Section7', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:43:07', '2026-05-26 12:43:07'),
(8, 0, 0, 'Section8', 'section8', 'default', 'Section8', NULL, 0, 'Section8', 'Section8', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:43:18', '2026-05-26 12:43:18'),
(9, 0, 0, 'Section9', 'section9', 'default', 'Section9', NULL, 0, 'Section9', 'Section9', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:43:33', '2026-05-26 12:43:33'),
(10, 0, 0, 'Section10', 'section10', 'default', 'Section10', NULL, 0, 'Section10', 'Section10', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:43:44', '2026-05-26 12:43:44'),
(11, 0, 0, 'Section11', 'section11', 'default', 'Section11', NULL, 0, 'Section11', 'Section11', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:43:54', '2026-05-26 12:43:54'),
(12, 0, 0, 'Section12', 'section12', 'default', 'Section12', NULL, 0, 'Section12', 'Section12', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:44:06', '2026-05-26 12:44:06'),
(13, 0, 0, 'Section13', 'section13', 'default', 'Section13', NULL, 0, 'Section13', 'Section13', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:44:17', '2026-05-26 12:44:17'),
(14, 0, 0, 'Section14', 'section14', 'default', 'Section14', NULL, 0, '', '', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:44:26', '2026-05-26 12:44:26'),
(15, 0, 0, 'Section15', 'section15', 'default', 'Section15', NULL, 0, '', '', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:44:34', '2026-05-26 12:44:34'),
(16, 0, 0, 'Section16', 'section16', 'default', 'Section16', NULL, 0, '', '', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:44:42', '2026-05-26 12:44:42'),
(17, 0, 0, 'Section 17', 'section-17', 'default', 'Section 17', NULL, 0, 'Section 17', 'Section 17', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-06-13 10:58:59', '2026-06-13 14:28:59'),
(18, 0, 0, 'Section 18', 'section-18', 'default', 'Section 18', NULL, 0, 'Section 18', 'Section 18', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-06-13 11:02:57', '2026-06-13 14:32:57'),
(19, 0, 0, 'Section 18', 'section-18-1781341611', 'default', 'Section 18', NULL, 0, 'Section 18', 'Section 18', 0, 'Y', 0, NULL, 0, 'Y', 1, 'Developer Account', '2026-06-13 14:53:37', '2026-06-13 11:06:51', '2026-06-13 14:36:51'),
(20, 0, 0, 'Section 18', 'section-18-1781341631', 'default', 'Section 18', NULL, 0, 'Section 18', 'Section 18', 0, 'Y', 0, NULL, 0, 'Y', 1, 'Developer Account', '2026-06-13 14:48:18', '2026-06-13 11:07:11', '2026-06-13 14:37:11'),
(21, 0, 0, 'Section 18', 'section-18-1781341922', 'default', 'Section 18', NULL, 0, 'Section 18', 'Section 18', 0, 'N', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 14:47:30', '2026-06-13 11:12:02', '2026-06-13 14:42:02'),
(22, 0, 0, 'Section 19', 'section-19', 'default', 'Section 19', NULL, 0, 'Section 19', 'Section 19', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 18:04:24', '2026-06-13 11:26:11', '2026-06-13 14:56:11'),
(23, 0, 0, 'Section 20', 'section-20', 'default', 'Section 20', NULL, 0, 'Section 20', 'Section 20', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 18:03:27', '2026-06-13 14:20:26', '2026-06-13 17:50:26');

-- --------------------------------------------------------

--
-- Table structure for table `item_section_relation`
--

CREATE TABLE `item_section_relation` (
  `item_section_relation_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL DEFAULT 0,
  `item_id` bigint(20) NOT NULL DEFAULT 0,
  `section_id` bigint(20) NOT NULL DEFAULT 0,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `display_status` varchar(1) NOT NULL DEFAULT 'Y',
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_by_name` varchar(255) DEFAULT NULL,
  `created_by_role` int(11) NOT NULL DEFAULT 0,
  `deleted_status` varchar(1) NOT NULL DEFAULT 'N',
  `deleted_by` int(11) NOT NULL DEFAULT 0,
  `deleted_by_name` varchar(255) DEFAULT NULL,
  `deleted_time` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_section_relation`
--

INSERT INTO `item_section_relation` (`item_section_relation_id`, `site_id`, `item_id`, `section_id`, `display_order`, `display_status`, `created_by`, `created_by_name`, `created_by_role`, `deleted_status`, `deleted_by`, `deleted_by_name`, `deleted_time`, `created_at`, `updated_at`) VALUES
(1, 0, 5, 1, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:45:00', '2026-05-26 12:45:00'),
(2, 0, 6, 1, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:45:15', '2026-05-26 12:45:15'),
(3, 0, 6, 2, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:45:15', '2026-05-26 12:45:15'),
(4, 0, 6, 3, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:45:15', '2026-05-26 12:45:15'),
(5, 0, 7, 1, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:45:29', '2026-05-26 12:45:29'),
(6, 0, 7, 2, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:45:29', '2026-05-26 12:45:29'),
(7, 0, 7, 3, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:45:29', '2026-05-26 12:45:29'),
(8, 0, 7, 4, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:45:29', '2026-05-26 12:45:29'),
(9, 0, 8, 1, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:45:47', '2026-05-26 12:45:47'),
(10, 0, 8, 2, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:45:47', '2026-05-26 12:45:47'),
(11, 0, 8, 3, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:45:47', '2026-05-26 12:45:47'),
(12, 0, 8, 4, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:45:47', '2026-05-26 12:45:47'),
(13, 0, 9, 1, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:45:59', '2026-05-26 12:45:59'),
(14, 0, 9, 2, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:45:59', '2026-05-26 12:45:59'),
(15, 0, 9, 3, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:45:59', '2026-05-26 12:45:59'),
(16, 0, 9, 4, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:45:59', '2026-05-26 12:45:59'),
(17, 0, 9, 5, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:45:59', '2026-05-26 12:45:59'),
(18, 0, 10, 1, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:46:13', '2026-05-26 12:46:13'),
(19, 0, 10, 2, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:46:13', '2026-05-26 12:46:13'),
(20, 0, 10, 3, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:46:13', '2026-05-26 12:46:13'),
(21, 0, 10, 4, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:46:13', '2026-05-26 12:46:13'),
(22, 0, 10, 5, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:46:13', '2026-05-26 12:46:13'),
(23, 0, 10, 6, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:46:13', '2026-05-26 12:46:13'),
(24, 0, 11, 5, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:46:26', '2026-05-26 12:46:26'),
(25, 0, 11, 6, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:46:26', '2026-05-26 12:46:26'),
(26, 0, 11, 7, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:46:26', '2026-05-26 12:46:26'),
(27, 0, 11, 8, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:46:26', '2026-05-26 12:46:26'),
(28, 0, 11, 9, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:46:26', '2026-05-26 12:46:26'),
(29, 0, 12, 12, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:46:40', '2026-05-26 12:46:40'),
(30, 0, 12, 13, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:46:40', '2026-05-26 12:46:40'),
(31, 0, 12, 14, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:46:40', '2026-05-26 12:46:40'),
(32, 0, 12, 15, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:46:40', '2026-05-26 12:46:40'),
(33, 0, 12, 16, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:46:40', '2026-05-26 12:46:40'),
(34, 0, 13, 1, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:46:51', '2026-05-26 12:46:51'),
(35, 0, 13, 2, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:46:51', '2026-05-26 12:46:51'),
(36, 0, 13, 3, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:46:51', '2026-05-26 12:46:51'),
(37, 0, 13, 4, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:46:51', '2026-05-26 12:46:51'),
(38, 0, 14, 12, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:47:02', '2026-05-26 12:47:02'),
(39, 0, 14, 13, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:47:02', '2026-05-26 12:47:02'),
(40, 0, 14, 14, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:47:02', '2026-05-26 12:47:02'),
(41, 0, 14, 15, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:47:02', '2026-05-26 12:47:02'),
(42, 0, 14, 16, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:47:02', '2026-05-26 12:47:02'),
(43, 0, 15, 4, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:47:13', '2026-05-26 12:47:13'),
(44, 0, 15, 5, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:47:13', '2026-05-26 12:47:13'),
(45, 0, 15, 6, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:47:13', '2026-05-26 12:47:13'),
(46, 0, 15, 7, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:47:13', '2026-05-26 12:47:13'),
(47, 0, 15, 8, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:47:13', '2026-05-26 12:47:13'),
(48, 0, 15, 9, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:47:13', '2026-05-26 12:47:13'),
(49, 0, 16, 5, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:47:24', '2026-05-26 12:47:24'),
(50, 0, 16, 6, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:47:24', '2026-05-26 12:47:24'),
(51, 0, 16, 7, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:47:24', '2026-05-26 12:47:24'),
(52, 0, 16, 8, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:47:24', '2026-05-26 12:47:24'),
(53, 0, 16, 9, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:47:24', '2026-05-26 12:47:24'),
(54, 0, 17, 5, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:47:37', '2026-05-26 12:47:37'),
(55, 0, 17, 6, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:47:37', '2026-05-26 12:47:37'),
(56, 0, 17, 7, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:47:37', '2026-05-26 12:47:37'),
(57, 0, 17, 8, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:47:37', '2026-05-26 12:47:37'),
(58, 0, 17, 9, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:47:37', '2026-05-26 12:47:37'),
(59, 0, 18, 8, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:47:56', '2026-05-26 12:47:56'),
(60, 0, 18, 9, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:47:56', '2026-05-26 12:47:56'),
(61, 0, 18, 10, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:47:56', '2026-05-26 12:47:56'),
(62, 0, 18, 11, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:47:56', '2026-05-26 12:47:56'),
(63, 0, 19, 4, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:48:09', '2026-05-26 12:48:09'),
(64, 0, 19, 5, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:48:09', '2026-05-26 12:48:09'),
(65, 0, 19, 6, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:48:09', '2026-05-26 12:48:09'),
(66, 0, 19, 7, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:48:09', '2026-05-26 12:48:09'),
(67, 0, 19, 8, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:48:09', '2026-05-26 12:48:09'),
(68, 0, 20, 1, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:48:22', '2026-05-26 12:48:22'),
(69, 0, 20, 2, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:48:22', '2026-05-26 12:48:22'),
(70, 0, 20, 3, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:48:22', '2026-05-26 12:48:22'),
(71, 0, 21, 9, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:48:34', '2026-05-26 12:48:34'),
(72, 0, 21, 10, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:48:34', '2026-05-26 12:48:34'),
(73, 0, 21, 11, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:48:34', '2026-05-26 12:48:34'),
(74, 0, 21, 12, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:48:34', '2026-05-26 12:48:34'),
(75, 0, 21, 13, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:48:34', '2026-05-26 12:48:34'),
(76, 0, 22, 7, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:48:46', '2026-05-26 12:48:46'),
(77, 0, 22, 8, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:48:46', '2026-05-26 12:48:46'),
(78, 0, 22, 9, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:48:46', '2026-05-26 12:48:46'),
(79, 0, 22, 10, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:48:46', '2026-05-26 12:48:46'),
(80, 0, 23, 12, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:48:57', '2026-05-26 12:48:57'),
(81, 0, 23, 13, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:48:57', '2026-05-26 12:48:57'),
(82, 0, 23, 14, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:48:57', '2026-05-26 12:48:57'),
(83, 0, 23, 15, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:48:57', '2026-05-26 12:48:57'),
(84, 0, 24, 4, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:49:10', '2026-05-26 12:49:10'),
(85, 0, 24, 5, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:49:10', '2026-05-26 12:49:10'),
(86, 0, 24, 6, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:49:10', '2026-05-26 12:49:10'),
(87, 0, 24, 7, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:49:10', '2026-05-26 12:49:10'),
(88, 0, 24, 8, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:49:10', '2026-05-26 12:49:10'),
(89, 0, 24, 9, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:49:10', '2026-05-26 12:49:10'),
(106, 0, 26, 2, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:49:39', '2026-05-26 12:49:39'),
(107, 0, 26, 3, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:49:39', '2026-05-26 12:49:39'),
(108, 0, 26, 4, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:49:39', '2026-05-26 12:49:39'),
(109, 0, 26, 5, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:49:39', '2026-05-26 12:49:39'),
(110, 0, 26, 6, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:49:39', '2026-05-26 12:49:39'),
(111, 0, 25, 13, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:49:48', '2026-05-26 12:49:48'),
(112, 0, 25, 14, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:49:48', '2026-05-26 12:49:48'),
(113, 0, 27, 7, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:50:02', '2026-05-26 12:50:02'),
(114, 0, 27, 8, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:50:02', '2026-05-26 12:50:02'),
(115, 0, 27, 9, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:50:02', '2026-05-26 12:50:02'),
(116, 0, 27, 10, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:50:02', '2026-05-26 12:50:02'),
(117, 0, 27, 11, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:50:02', '2026-05-26 12:50:02'),
(118, 0, 28, 3, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:50:13', '2026-05-26 12:50:13'),
(119, 0, 28, 4, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:50:13', '2026-05-26 12:50:13'),
(120, 0, 28, 5, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:50:13', '2026-05-26 12:50:13'),
(121, 0, 29, 1, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:50:25', '2026-05-26 12:50:25'),
(122, 0, 29, 2, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:50:25', '2026-05-26 12:50:25'),
(123, 0, 29, 3, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:50:25', '2026-05-26 12:50:25'),
(124, 0, 29, 4, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:50:25', '2026-05-26 12:50:25'),
(125, 0, 31, 1, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-06-13 12:17:54', '2026-06-13 15:47:54'),
(126, 0, 31, 2, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-06-13 12:17:54', '2026-06-13 15:47:54'),
(127, 0, 31, 3, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-06-13 12:17:54', '2026-06-13 15:47:54'),
(128, 0, 31, 4, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-06-13 12:17:54', '2026-06-13 15:47:54'),
(129, 0, 32, 1, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-06-13 12:20:07', '2026-06-13 15:50:07'),
(130, 0, 32, 2, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-06-13 12:20:07', '2026-06-13 15:50:07'),
(131, 0, 32, 3, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-06-13 12:20:07', '2026-06-13 15:50:07'),
(132, 0, 32, 4, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-06-13 12:20:07', '2026-06-13 15:50:07'),
(133, 0, 33, 1, 0, 'Y', 0, NULL, 0, 'Y', 1, 'Developer Account', '2026-06-13 16:34:30', '2026-06-13 12:21:11', '2026-06-13 15:51:11'),
(134, 0, 33, 2, 0, 'Y', 0, NULL, 0, 'Y', 1, 'Developer Account', '2026-06-13 16:34:30', '2026-06-13 12:21:11', '2026-06-13 15:51:11'),
(135, 0, 33, 3, 0, 'Y', 0, NULL, 0, 'Y', 1, 'Developer Account', '2026-06-13 16:34:30', '2026-06-13 12:21:11', '2026-06-13 15:51:11'),
(136, 0, 33, 4, 0, 'Y', 0, NULL, 0, 'Y', 1, 'Developer Account', '2026-06-13 16:34:30', '2026-06-13 12:21:11', '2026-06-13 15:51:11'),
(137, 0, 34, 1, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-06-13 14:21:02', '2026-06-13 17:51:02'),
(138, 0, 34, 2, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-06-13 14:21:02', '2026-06-13 17:51:02'),
(139, 0, 34, 3, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-06-13 14:21:02', '2026-06-13 17:51:02'),
(140, 0, 34, 4, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-06-13 14:21:02', '2026-06-13 17:51:02'),
(144, 0, 35, 17, 0, 'Y', 0, NULL, 0, 'Y', 1, 'Developer Account', '2026-06-13 18:04:49', '2026-06-13 14:34:04', '2026-06-13 18:04:04'),
(145, 0, 35, 18, 0, 'Y', 0, NULL, 0, 'Y', 1, 'Developer Account', '2026-06-13 18:04:49', '2026-06-13 14:34:04', '2026-06-13 18:04:04'),
(146, 0, 35, 22, 0, 'Y', 0, NULL, 0, 'Y', 1, 'Developer Account', '2026-06-13 18:04:49', '2026-06-13 14:34:04', '2026-06-13 18:04:04');

-- --------------------------------------------------------

--
-- Table structure for table `meta_details`
--

CREATE TABLE `meta_details` (
  `meta_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `end_points` varchar(255) DEFAULT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `sidebar_title` varchar(255) DEFAULT NULL,
  `sidebar_icon` varchar(255) DEFAULT NULL,
  `sidebar_order` int(11) NOT NULL DEFAULT 0,
  `params` varchar(255) DEFAULT NULL,
  `is_module` smallint(6) NOT NULL DEFAULT 0,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `display_status` varchar(1) NOT NULL DEFAULT 'Y',
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_by_name` varchar(255) DEFAULT NULL,
  `created_by_role` int(11) NOT NULL DEFAULT 0,
  `deleted_status` varchar(1) NOT NULL DEFAULT 'N',
  `deleted_by` int(11) NOT NULL DEFAULT 0,
  `deleted_by_name` varchar(255) DEFAULT NULL,
  `deleted_time` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meta_details`
--

INSERT INTO `meta_details` (`meta_id`, `site_id`, `parent_id`, `end_points`, `page_title`, `meta_title`, `meta_description`, `sidebar_title`, `sidebar_icon`, `sidebar_order`, `params`, `is_module`, `display_order`, `display_status`, `created_by`, `created_by_name`, `created_by_role`, `deleted_status`, `deleted_by`, `deleted_by_name`, `deleted_time`, `created_at`, `updated_at`) VALUES
(1, 0, 0, '/', 'Dashboard', 'Dashboard', 'Dashboard', 'Dashboard', 'mdi-view-dashboard', 1, NULL, 1, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(2, 0, 0, '/users', 'Users', 'Users', 'Users', 'Users', 'mdi-account-box', 104, NULL, 1, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(3, 0, 0, '/change-password', 'Change Password', 'Change Password', 'Change Password', 'Change Password', 'mdi mdi-server-security', 105, NULL, 1, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(4, 0, 0, '/items?item_type=page', 'Pages', 'Pages', 'Pages', 'Pages', 'mdi-format-list-bulleted', 3, NULL, 1, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(5, 0, 0, '/configurations', 'Configurations', 'Configurations Meta', 'Desc', 'Configurations', 'mdi-view-headline', 109, NULL, 1, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(6, 0, 0, '/user_form', 'User Form', 'User Form', 'User Form', 'User Form', NULL, 0, NULL, 0, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(7, 0, 0, '/item_section_form', 'Section Form', 'Section Form', 'Section Form', 'Section Form', NULL, 0, NULL, 0, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(8, 0, 0, '/logout', 'Logout', 'Logout', 'Logout', 'Logout', 'mdi-logout-variant', 201, NULL, 1, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(9, 0, 0, '/login', 'Login', 'Login', 'Login', 'Login', NULL, 0, NULL, 0, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(10, 0, 0, '/metadetails', 'Meta Details', 'Meta Details', 'Meta Details', 'SEO', 'mdi-format-list-bulleted', 108, NULL, 1, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(11, 0, 0, '/item_form', 'Item Form', 'Item Form', 'Item Form', 'Item Form', NULL, 0, NULL, 0, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(12, 0, 0, '/forgot-password', 'Forgot Password', 'Forgot Password', 'Forgot Password', 'Forgot Password', NULL, 0, NULL, 0, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(13, 0, 0, '/password-token', 'Password Token', 'Password Token', 'Password Token', 'Password Token', NULL, 0, NULL, 0, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(14, 0, 0, '/reset-password', 'Reset Password', 'Reset Password', 'Reset Password', 'Reset Password', NULL, 0, NULL, 0, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(15, 0, 0, '/roles', 'Roles', 'Roles', 'Roles', 'Roles', 'mdi mdi-account', 103, NULL, 1, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(16, 0, 0, '/role_form', 'Role Form', 'Role Form', 'Role Form', 'Role Form', NULL, 0, NULL, 0, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(17, 0, 0, '/item_form?item_type=blog', 'Blog Form', 'Blog Form', 'Blog Form', NULL, NULL, 0, NULL, 0, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(18, 0, 0, '/item_form?item_type=page', 'Page Form', 'Page Form', 'Page Form', NULL, NULL, 0, NULL, 0, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(19, 0, 0, '/item_section_form?item_type=default', 'Default Section Form', 'Default Section Form', 'Default Section Form', NULL, NULL, 0, NULL, 0, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(20, 0, 0, '/item_section_form?item_type=blog', 'Blog Category Form', 'Blog Category Form', 'Blog Category Form', NULL, NULL, 0, NULL, 0, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(21, 0, 0, '/items/default', 'Demonstration Company', 'Demonstration Company', 'Demonstration Company Description', NULL, NULL, 0, NULL, 0, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(22, 0, 0, '/database_table', 'Database Tables', 'Database Tables', 'Database Tables', 'Database Tables', 'mdi mdi-view-headline', 200, NULL, 1, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(23, 0, 0, '/item_section?item_type=blog', 'Blog Category', 'Blog Category', 'Blog Category', 'Blog Category', 'mdi mdi-view-headline', 5, NULL, 1, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(24, 0, 0, '/items?item_type=blog', 'Blogs', 'Blogs', 'Blogs', 'Blogs', 'mdi-format-list-bulleted', 5, NULL, 1, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(25, 0, 0, '/item_form?item_type=default', 'Default Form', 'Default Form', 'Default Form', NULL, NULL, 0, NULL, 0, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(26, 0, 0, '/item_section?item_type=default', 'Default Section', 'Default Section', 'Default', 'Default Section', 'mdi mdi-view-headline', 1, NULL, 1, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(27, 0, 0, '/items?item_type=default', 'Default Item', 'Default', 'Default', 'Default Items', 'mdi-format-list-bulleted', 1, NULL, 1, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(28, 0, 52, '/template/mdiicons', 'Demonstration Company', 'Demonstration Company', 'Demonstration Company Description', 'MDI Icons', 'mdi mdi-view-headline', 404, 'ui-basic', 1, 0, 'Y', 0, NULL, 0, 'Y', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(29, 0, 52, '/template/formelement', 'Form Elements', 'Form Elements', 'Form Elements', 'Form Element', 'mdi mdi-view-headline', 403, 'ui-basic', 1, 0, 'Y', 0, NULL, 0, 'Y', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(30, 0, 52, '/template/gallery', 'Gallery', 'Gallery', 'Gallery', 'Gallery', 'mdi mdi-view-headline', 402, 'ui-basic', 1, 0, 'Y', 0, NULL, 0, 'Y', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(31, 0, -1, '/template', 'Templates', 'Templates', 'Templates', 'Templates', 'ui-basic', 401, NULL, 1, 0, 'Y', 0, NULL, 0, 'Y', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(32, 0, 0, '/items', 'Demonstration Company', 'Demonstration Company', 'Demonstration Company Description', NULL, NULL, 0, NULL, 0, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(33, 0, 0, '/item_form?item_type=default&edit_id=25', 'Default Page Title', 'Default Meta Title', 'Default Meta Description', NULL, NULL, 0, NULL, 0, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:49:43'),
(34, 0, 0, '/item_section_form?edit_id=16&item_type=default', 'Default Page Title', 'Default Meta Title', 'Default Meta Description', NULL, NULL, 0, NULL, 0, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 18:46:21'),
(35, 0, 0, '/item_form?item_type=default&edit_id=30', 'Default Page Title', 'Default Meta Title', 'Default Meta Description', NULL, NULL, 0, NULL, 0, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 18:59:32'),
(36, 0, 0, '/item_form?item_type=page&edit_id=2', 'Default Page Title', 'Default Meta Title', 'Default Meta Description', NULL, NULL, 0, NULL, 0, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 19:51:53'),
(37, 0, 0, '/user_form?item_type=', 'Default Page Title', 'Default Meta Title', 'Default Meta Description', NULL, NULL, 0, NULL, 0, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-06-10 14:32:03'),
(38, 0, 0, '/users?item_type=', 'Default Page Title', 'Default Meta Title', 'Default Meta Description', NULL, NULL, 0, NULL, 0, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-06-10 14:39:09'),
(39, 0, 0, '/user_form?item_type=user&edit_id=13', 'Default Page Title', 'Default Meta Title', 'Default Meta Description', NULL, NULL, 0, NULL, 0, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-06-10 16:26:00'),
(40, 0, 0, '/item_section_form?edit_id=22&item_type=default', 'Default Page Title', 'Default Meta Title', 'Default Meta Description', NULL, NULL, 0, NULL, 0, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-06-13 15:34:48'),
(41, 0, 0, '/role_form?item_type=role', 'Default Page Title', 'Default Meta Title', 'Default Meta Description', NULL, NULL, 0, NULL, 0, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-06-13 16:38:34'),
(42, 0, 0, '/roles?item_type=role', 'Default Page Title', 'Default Meta Title', 'Default Meta Description', NULL, NULL, 0, NULL, 0, 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-06-13 16:40:52');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL DEFAULT 0,
  `role_title` varchar(255) DEFAULT NULL,
  `item_alias` varchar(255) DEFAULT NULL,
  `item_type` varchar(255) NOT NULL DEFAULT 'role',
  `display_on_listing` varchar(1) NOT NULL DEFAULT 'Y',
  `show_action_checkbox` varchar(1) NOT NULL DEFAULT 'Y',
  `allow_delete` varchar(1) NOT NULL DEFAULT 'Y',
  `display_order` int(11) NOT NULL DEFAULT 0,
  `display_status` varchar(1) NOT NULL DEFAULT 'Y',
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_by_name` varchar(255) DEFAULT NULL,
  `created_by_role` int(11) NOT NULL DEFAULT 0,
  `deleted_status` varchar(1) NOT NULL DEFAULT 'N',
  `deleted_by` int(11) NOT NULL DEFAULT 0,
  `deleted_by_name` varchar(255) DEFAULT NULL,
  `deleted_time` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `site_id`, `role_title`, `item_alias`, `item_type`, `display_on_listing`, `show_action_checkbox`, `allow_delete`, `display_order`, `display_status`, `created_by`, `created_by_name`, `created_by_role`, `deleted_status`, `deleted_by`, `deleted_by_name`, `deleted_time`, `created_at`, `updated_at`) VALUES
(1, 0, 'Developer', 'developer', 'role', 'Y', 'Y', 'N', 1, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:32:06', '2026-05-26 12:32:06'),
(2, 0, 'Super Admin', 'superadmin', 'role', 'Y', 'Y', 'N', 1, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:32:06', '2026-05-26 12:32:06'),
(3, 0, 'Admin', 'admin', 'role', 'Y', 'Y', 'Y', 1, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:32:06', '2026-05-26 12:32:06'),
(4, 0, 'RoleFormmmmmmm', '', 'role', 'Y', 'Y', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 17:02:13', '2026-06-13 13:08:36', '2026-06-13 16:38:49'),
(5, 0, 'RoleFormmmmmmm', '', 'role', 'Y', 'Y', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 17:01:49', '2026-06-13 13:08:36', '2026-06-13 16:40:49'),
(6, 0, 'New', '', 'role', 'Y', 'Y', 'Y', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-06-13 14:24:55', '2026-06-13 17:55:07'),
(7, 0, 'New', '', 'role', 'Y', 'Y', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'N', 0, NULL, NULL, '2026-06-13 14:24:55', '2026-06-13 17:55:48'),
(8, 0, 'New2', '', 'role', 'Y', 'Y', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 18:05:19', '2026-06-13 14:32:29', '2026-06-13 18:02:35');

-- --------------------------------------------------------

--
-- Table structure for table `role_access`
--

CREATE TABLE `role_access` (
  `role_access_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL DEFAULT 0,
  `role_id` int(11) DEFAULT 0,
  `module_id` int(11) DEFAULT 0,
  `grant_add` varchar(1) NOT NULL DEFAULT 'N',
  `grant_edit` varchar(1) NOT NULL DEFAULT 'N',
  `grant_delete` varchar(1) NOT NULL DEFAULT 'N',
  `grant_view` varchar(1) NOT NULL DEFAULT 'N',
  `display_order` int(11) NOT NULL DEFAULT 0,
  `display_status` varchar(1) NOT NULL DEFAULT 'Y',
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_by_name` varchar(255) DEFAULT NULL,
  `created_by_role` int(11) NOT NULL DEFAULT 0,
  `deleted_status` varchar(1) NOT NULL DEFAULT 'N',
  `deleted_by` int(11) NOT NULL DEFAULT 0,
  `deleted_by_name` varchar(255) DEFAULT NULL,
  `deleted_time` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_access`
--

INSERT INTO `role_access` (`role_access_id`, `site_id`, `role_id`, `module_id`, `grant_add`, `grant_edit`, `grant_delete`, `grant_view`, `display_order`, `display_status`, `created_by`, `created_by_name`, `created_by_role`, `deleted_status`, `deleted_by`, `deleted_by_name`, `deleted_time`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 1, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:32:06', '2026-05-26 12:32:06'),
(2, 0, 1, 2, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:32:06', '2026-05-26 12:32:06'),
(3, 0, 1, 3, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:32:06', '2026-05-26 12:32:06'),
(4, 0, 1, 4, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:32:06', '2026-05-26 12:32:06'),
(5, 0, 1, 5, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:32:06', '2026-05-26 12:32:06'),
(6, 0, 1, 8, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:32:06', '2026-05-26 12:32:06'),
(7, 0, 1, 10, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:32:06', '2026-05-26 12:32:06'),
(8, 0, 1, 15, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:32:06', '2026-05-26 12:32:06'),
(9, 0, 1, 22, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:32:06', '2026-05-26 12:32:06'),
(10, 0, 1, 23, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:32:06', '2026-05-26 12:32:06'),
(11, 0, 1, 24, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:32:06', '2026-05-26 12:32:06'),
(12, 0, 1, 26, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:32:06', '2026-05-26 12:32:06'),
(13, 0, 1, 27, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:32:06', '2026-05-26 12:32:06'),
(14, 0, 1, 28, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:32:06', '2026-05-26 12:32:06'),
(15, 0, 1, 29, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:32:06', '2026-05-26 12:32:06'),
(16, 0, 1, 30, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:32:06', '2026-05-26 12:32:06'),
(17, 0, 1, 31, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:32:06', '2026-05-26 12:32:06'),
(18, 0, 4, 1, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 0, NULL, 0, 'Y', 1, 'Developer Account', '2026-06-13 17:02:13', '2026-06-13 13:08:49', '2026-06-13 16:38:49'),
(19, 0, 4, 2, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 0, NULL, 0, 'Y', 1, 'Developer Account', '2026-06-13 17:02:13', '2026-06-13 13:08:49', '2026-06-13 16:38:49'),
(20, 0, 4, 3, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 0, NULL, 0, 'Y', 1, 'Developer Account', '2026-06-13 17:02:13', '2026-06-13 13:08:49', '2026-06-13 16:38:49'),
(21, 0, 4, 4, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 0, NULL, 0, 'Y', 1, 'Developer Account', '2026-06-13 17:02:13', '2026-06-13 13:08:49', '2026-06-13 16:38:49'),
(22, 0, 4, 5, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 0, NULL, 0, 'Y', 1, 'Developer Account', '2026-06-13 17:02:13', '2026-06-13 13:08:49', '2026-06-13 16:38:49'),
(23, 0, 4, 8, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 0, NULL, 0, 'Y', 1, 'Developer Account', '2026-06-13 17:02:13', '2026-06-13 13:08:49', '2026-06-13 16:38:49'),
(24, 0, 4, 10, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 0, NULL, 0, 'Y', 1, 'Developer Account', '2026-06-13 17:02:13', '2026-06-13 13:08:49', '2026-06-13 16:38:49'),
(25, 0, 4, 15, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 0, NULL, 0, 'Y', 1, 'Developer Account', '2026-06-13 17:02:13', '2026-06-13 13:08:49', '2026-06-13 16:38:49'),
(26, 0, 4, 22, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 0, NULL, 0, 'Y', 1, 'Developer Account', '2026-06-13 17:02:13', '2026-06-13 13:08:49', '2026-06-13 16:38:49'),
(27, 0, 4, 23, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 0, NULL, 0, 'Y', 1, 'Developer Account', '2026-06-13 17:02:13', '2026-06-13 13:08:49', '2026-06-13 16:38:49'),
(28, 0, 4, 24, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 0, NULL, 0, 'Y', 1, 'Developer Account', '2026-06-13 17:02:13', '2026-06-13 13:08:49', '2026-06-13 16:38:49'),
(29, 0, 4, 26, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 0, NULL, 0, 'Y', 1, 'Developer Account', '2026-06-13 17:02:13', '2026-06-13 13:08:49', '2026-06-13 16:38:49'),
(30, 0, 4, 27, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 0, NULL, 0, 'Y', 1, 'Developer Account', '2026-06-13 17:02:13', '2026-06-13 13:08:49', '2026-06-13 16:38:49'),
(31, 0, 4, 28, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 0, NULL, 0, 'Y', 1, 'Developer Account', '2026-06-13 17:02:13', '2026-06-13 13:08:49', '2026-06-13 16:38:49'),
(32, 0, 4, 29, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 0, NULL, 0, 'Y', 1, 'Developer Account', '2026-06-13 17:02:13', '2026-06-13 13:08:49', '2026-06-13 16:38:49'),
(33, 0, 4, 30, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 0, NULL, 0, 'Y', 1, 'Developer Account', '2026-06-13 17:02:13', '2026-06-13 13:08:49', '2026-06-13 16:38:49'),
(34, 0, 4, 31, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 0, NULL, 0, 'Y', 1, 'Developer Account', '2026-06-13 17:02:13', '2026-06-13 13:08:49', '2026-06-13 16:38:49'),
(35, 0, 5, 1, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 17:01:49', '2026-06-13 13:10:49', '2026-06-13 16:40:49'),
(36, 0, 5, 2, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 17:01:49', '2026-06-13 13:10:49', '2026-06-13 16:40:49'),
(37, 0, 5, 3, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 17:01:49', '2026-06-13 13:10:49', '2026-06-13 16:40:49'),
(38, 0, 5, 4, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 17:01:49', '2026-06-13 13:10:49', '2026-06-13 16:40:49'),
(39, 0, 5, 5, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 17:01:49', '2026-06-13 13:10:49', '2026-06-13 16:40:49'),
(40, 0, 5, 8, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 17:01:49', '2026-06-13 13:10:49', '2026-06-13 16:40:49'),
(41, 0, 5, 10, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 17:01:49', '2026-06-13 13:10:49', '2026-06-13 16:40:49'),
(42, 0, 5, 15, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 17:01:49', '2026-06-13 13:10:49', '2026-06-13 16:40:49'),
(43, 0, 5, 22, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 17:01:49', '2026-06-13 13:10:49', '2026-06-13 16:40:49'),
(44, 0, 5, 23, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 17:01:49', '2026-06-13 13:10:49', '2026-06-13 16:40:49'),
(45, 0, 5, 24, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 17:01:49', '2026-06-13 13:10:49', '2026-06-13 16:40:49'),
(46, 0, 5, 26, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 17:01:49', '2026-06-13 13:10:49', '2026-06-13 16:40:49'),
(47, 0, 5, 27, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 17:01:49', '2026-06-13 13:10:49', '2026-06-13 16:40:49'),
(48, 0, 5, 28, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 17:01:49', '2026-06-13 13:10:49', '2026-06-13 16:40:49'),
(49, 0, 5, 29, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 17:01:49', '2026-06-13 13:10:49', '2026-06-13 16:40:49'),
(50, 0, 5, 30, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 17:01:49', '2026-06-13 13:10:49', '2026-06-13 16:40:49'),
(51, 0, 5, 31, 'Y', 'Y', 'Y', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 17:01:49', '2026-06-13 13:10:49', '2026-06-13 16:40:49'),
(52, 0, 7, 1, 'Y', 'N', 'N', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'N', 0, NULL, NULL, '2026-06-13 14:25:48', '2026-06-13 17:55:48'),
(53, 0, 7, 2, 'Y', 'N', 'N', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'N', 0, NULL, NULL, '2026-06-13 14:25:48', '2026-06-13 17:55:48'),
(54, 0, 7, 3, 'Y', 'N', 'N', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'N', 0, NULL, NULL, '2026-06-13 14:25:48', '2026-06-13 17:55:48'),
(55, 0, 7, 4, 'Y', 'N', 'N', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'N', 0, NULL, NULL, '2026-06-13 14:25:48', '2026-06-13 17:55:48'),
(56, 0, 7, 5, 'Y', 'N', 'N', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'N', 0, NULL, NULL, '2026-06-13 14:25:48', '2026-06-13 17:55:48'),
(57, 0, 7, 8, 'Y', 'N', 'N', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'N', 0, NULL, NULL, '2026-06-13 14:25:48', '2026-06-13 17:55:48'),
(58, 0, 7, 10, 'Y', 'N', 'N', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'N', 0, NULL, NULL, '2026-06-13 14:25:48', '2026-06-13 17:55:48'),
(59, 0, 7, 15, 'Y', 'N', 'N', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'N', 0, NULL, NULL, '2026-06-13 14:25:48', '2026-06-13 17:55:48'),
(60, 0, 7, 22, 'Y', 'N', 'N', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'N', 0, NULL, NULL, '2026-06-13 14:25:48', '2026-06-13 17:55:48'),
(61, 0, 7, 23, 'Y', 'N', 'N', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'N', 0, NULL, NULL, '2026-06-13 14:25:48', '2026-06-13 17:55:48'),
(62, 0, 7, 24, 'Y', 'N', 'N', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'N', 0, NULL, NULL, '2026-06-13 14:25:48', '2026-06-13 17:55:48'),
(63, 0, 7, 26, 'Y', 'N', 'N', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'N', 0, NULL, NULL, '2026-06-13 14:25:48', '2026-06-13 17:55:48'),
(64, 0, 7, 27, 'Y', 'N', 'N', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'N', 0, NULL, NULL, '2026-06-13 14:25:48', '2026-06-13 17:55:48'),
(65, 0, 7, 28, 'Y', 'N', 'N', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'N', 0, NULL, NULL, '2026-06-13 14:25:48', '2026-06-13 17:55:48'),
(66, 0, 7, 29, 'Y', 'N', 'N', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'N', 0, NULL, NULL, '2026-06-13 14:25:48', '2026-06-13 17:55:48'),
(67, 0, 7, 30, 'Y', 'N', 'N', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'N', 0, NULL, NULL, '2026-06-13 14:25:48', '2026-06-13 17:55:48'),
(68, 0, 7, 31, 'Y', 'N', 'N', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'N', 0, NULL, NULL, '2026-06-13 14:25:48', '2026-06-13 17:55:48'),
(69, 0, 8, 1, 'N', 'N', 'N', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 18:05:19', '2026-06-13 14:32:35', '2026-06-13 18:02:35'),
(70, 0, 8, 2, 'N', 'N', 'N', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 18:05:19', '2026-06-13 14:32:35', '2026-06-13 18:02:35'),
(71, 0, 8, 3, 'N', 'N', 'N', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 18:05:19', '2026-06-13 14:32:35', '2026-06-13 18:02:35'),
(72, 0, 8, 4, 'N', 'N', 'N', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 18:05:19', '2026-06-13 14:32:35', '2026-06-13 18:02:35'),
(73, 0, 8, 5, 'N', 'N', 'N', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 18:05:19', '2026-06-13 14:32:35', '2026-06-13 18:02:35'),
(74, 0, 8, 8, 'N', 'N', 'N', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 18:05:19', '2026-06-13 14:32:35', '2026-06-13 18:02:35'),
(75, 0, 8, 10, 'N', 'N', 'N', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 18:05:19', '2026-06-13 14:32:35', '2026-06-13 18:02:35'),
(76, 0, 8, 15, 'N', 'N', 'N', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 18:05:19', '2026-06-13 14:32:35', '2026-06-13 18:02:35'),
(77, 0, 8, 22, 'N', 'N', 'N', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 18:05:19', '2026-06-13 14:32:35', '2026-06-13 18:02:35'),
(78, 0, 8, 23, 'N', 'N', 'N', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 18:05:19', '2026-06-13 14:32:35', '2026-06-13 18:02:35'),
(79, 0, 8, 24, 'N', 'N', 'N', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 18:05:19', '2026-06-13 14:32:35', '2026-06-13 18:02:35'),
(80, 0, 8, 26, 'N', 'N', 'N', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 18:05:19', '2026-06-13 14:32:35', '2026-06-13 18:02:35'),
(81, 0, 8, 27, 'N', 'N', 'N', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 18:05:19', '2026-06-13 14:32:35', '2026-06-13 18:02:35'),
(82, 0, 8, 28, 'N', 'N', 'N', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 18:05:19', '2026-06-13 14:32:35', '2026-06-13 18:02:35'),
(83, 0, 8, 29, 'N', 'N', 'N', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 18:05:19', '2026-06-13 14:32:35', '2026-06-13 18:02:35'),
(84, 0, 8, 30, 'N', 'N', 'N', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 18:05:19', '2026-06-13 14:32:35', '2026-06-13 18:02:35'),
(85, 0, 8, 31, 'N', 'N', 'N', 'Y', 0, 'Y', 1, 'Developer Account', 1, 'Y', 1, 'Developer Account', '2026-06-13 18:05:19', '2026-06-13 14:32:35', '2026-06-13 18:02:35');

-- --------------------------------------------------------

--
-- Table structure for table `site_config`
--

CREATE TABLE `site_config` (
  `config_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL DEFAULT 0,
  `config_title` varchar(1024) DEFAULT NULL,
  `config_name` varchar(1024) DEFAULT NULL,
  `config_value` text DEFAULT NULL,
  `input_type` varchar(15) DEFAULT NULL,
  `size` int(11) NOT NULL DEFAULT 100,
  `maxlength` int(11) NOT NULL DEFAULT 100,
  `input_type_title` varchar(100) DEFAULT NULL,
  `classname` varchar(100) DEFAULT 'textbox',
  `required` varchar(1) DEFAULT 'O',
  `comments` varchar(255) DEFAULT NULL,
  `additional` varchar(100) DEFAULT NULL,
  `display_on_dashboard` varchar(1) NOT NULL DEFAULT 'N',
  `display_on_third_party` varchar(1) NOT NULL DEFAULT 'N',
  `site_config_parent_id` smallint(6) NOT NULL DEFAULT 0,
  `root_user_only` varchar(1) NOT NULL DEFAULT 'N',
  `display_order` int(11) NOT NULL DEFAULT 0,
  `display_status` varchar(1) NOT NULL DEFAULT 'Y',
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_by_name` varchar(255) DEFAULT NULL,
  `created_by_role` int(11) NOT NULL DEFAULT 0,
  `deleted_status` varchar(1) NOT NULL DEFAULT 'N',
  `deleted_by` int(11) NOT NULL DEFAULT 0,
  `deleted_by_name` varchar(255) DEFAULT NULL,
  `deleted_time` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_config`
--

INSERT INTO `site_config` (`config_id`, `site_id`, `config_title`, `config_name`, `config_value`, `input_type`, `size`, `maxlength`, `input_type_title`, `classname`, `required`, `comments`, `additional`, `display_on_dashboard`, `display_on_third_party`, `site_config_parent_id`, `root_user_only`, `display_order`, `display_status`, `created_by`, `created_by_name`, `created_by_role`, `deleted_status`, `deleted_by`, `deleted_by_name`, `deleted_time`, `created_at`, `updated_at`) VALUES
(1, 0, 'Application Title', 'FRONT_APPLICATION_TITLE', 'CMS123', 'text', 100, 100, 'Please enter your application name for display on frontend side as title', 'form-control', 'Y', NULL, NULL, 'Y', 'Y', 1, 'N', 1, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2019-04-11 13:00:00', '2026-01-30 09:34:40'),
(2, 0, 'Records per page', 'FRONT_RECORD_PER_PAGE', '16', 'select', 100, 60, 'Records per page', 'form-control', 'Y', '8@=16@=24@=32@=40@=80', NULL, 'Y', 'Y', 1, 'N', 5, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2019-04-11 13:00:00', '2019-04-11 21:45:59'),
(3, 0, 'Maintenance Mode', 'SITE_CONSTRUCTION', 'No', 'select', 100, 60, 'Site Under Construction Status', 'form-control', 'Y', 'Yes@=No', NULL, 'Y', 'N', 1, 'N', 12, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2019-04-11 13:00:00', '2021-12-07 22:07:04'),
(4, 0, 'Default Timezone', 'FRONT_DEFAULT_TIMEZONE', 'Asia/Kolkata', 'select', 100, 60, 'Default Timezone', 'form-control', 'Y', 'America/Chicago@=Asia/Kolkata@=Europe/London@=Australia/Perth', NULL, 'Y', 'Y', 1, 'N', 13, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2019-04-11 13:00:00', '2019-04-11 21:45:59'),
(5, 0, 'Backend application Title', 'BACKEND_APPLICATION_TITLE', 'Cloudswift :: Administrator', 'text', 100, 60, 'Application Title', 'form-control', 'Y', NULL, NULL, 'Y', 'N', 2, 'N', 14, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2019-04-11 13:00:00', '2019-10-14 07:08:57'),
(6, 0, 'Meta Description', 'FRONT_META_DESCRIPTION', 'We are the leading Custom Software Solution Company in Vadodara, Gujarat, India who servered more then 50 Clients across World.', 'text', 100, 60, 'Meta Description', 'form-control', 'Y', NULL, NULL, 'N', 'N', 1, 'N', 1, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2019-04-11 13:00:00', '2020-04-17 01:06:07'),
(7, 0, 'Default Robots', 'FRONT_DEFAULT_ROBOTS', 'INDEX,FOLLOW', 'select', 100, 60, 'Default Robots', 'form-control', 'Y', 'INDEX,FOLLOW@=NOINDEX@=NOFOLLOW@=NOINDEX,NOFOLLOW', NULL, 'Y', 'Y', 3, 'N', 25, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2019-04-11 13:00:00', '2019-10-17 08:06:12'),
(8, 0, 'Company Name', 'COMPANY_NAME', 'Demonstration Project Pvt. Ltd.', 'text', 100, 60, 'Company Name', 'form-control', 'Y', NULL, NULL, 'N', 'Y', 5, 'N', 64, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2019-04-11 13:00:00', '2019-11-07 22:26:19'),
(9, 0, 'Company Address', 'COMPANY_ADDRESS1', 'Sama, Near Chanikya crossing', 'text', 100, 60, 'Company Address', 'form-control', 'Y', NULL, NULL, 'N', 'Y', 5, 'N', 65, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2019-04-11 13:00:00', '2019-04-11 21:45:59'),
(10, 0, 'Company Address 2', 'COMPANY_ADDRESS2', '', 'text', 100, 60, 'Company Address 2', 'form-control', 'Y', NULL, NULL, 'N', 'Y', 5, 'N', 66, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2019-04-11 13:00:00', '2019-09-24 08:43:53'),
(11, 0, 'City', 'COMPANY_CITY', 'Vadodara', 'text', 100, 60, 'City', 'form-control', 'Y', NULL, NULL, 'N', 'Y', 5, 'N', 67, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2019-04-11 13:00:00', '2019-04-11 21:45:59'),
(12, 0, 'State', 'COMPANY_STATE', 'GJ', 'text', 100, 60, 'State', 'form-control', 'Y', NULL, NULL, 'N', 'Y', 5, 'N', 68, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2019-04-11 13:00:00', '2019-04-11 21:45:59'),
(13, 0, 'Country', 'COMPANY_COUNTRY', 'INN', 'text', 100, 60, 'Country', 'form-control', 'Y', NULL, NULL, 'N', 'Y', 5, 'N', 69, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2019-04-11 13:00:00', '2019-04-11 21:45:59'),
(14, 0, 'Zipcode', 'COMPANY_ZIPCODE', '390009', 'text', 100, 60, 'Zipcode', 'form-control', 'Y', 'max six digits', NULL, 'N', 'Y', 5, 'N', 70, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2019-04-11 13:00:00', '2019-04-11 21:45:59'),
(15, 0, 'Contact Number', 'COMPANY_CONTACT_NUMBER', '886-630-3621', 'text', 100, 60, 'Contact Number', 'form-control', 'Y', NULL, NULL, 'N', 'Y', 5, 'N', 71, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2019-04-11 13:00:00', '2020-04-13 11:50:21'),
(16, 0, 'Contact us email address', 'COMPANY_EMAIL', 'connect@cloudswiftsolutions.com', 'email', 100, 60, 'Contact us email address', 'form-control', 'Y', NULL, NULL, 'N', 'Y', 8, 'N', 74, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2019-04-11 13:00:00', '2021-08-13 00:40:23'),
(17, 0, 'Contact us person name', 'COMPANY_CONTACT_PERSON', 'Demonstration Project', 'text', 100, 60, 'Contact us person name', 'form-control', 'Y', NULL, NULL, 'N', 'Y', 8, 'N', 75, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2019-04-11 13:00:00', '2021-08-13 01:15:54'),
(18, 0, 'Allow Sending emails', 'ALLOW_SENDING_EMAIL', 'Yes', 'select', 100, 5, 'Allow to send email throughout site? If no, not a single email will execute in this project.', 'form-control', 'Y', 'Yes@=No', NULL, 'N', 'N', 8, 'N', 82, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2019-04-11 13:00:00', '2019-04-11 21:45:59'),
(19, 0, 'Order email name', 'ORDER_CONTACT_PERSON', 'Cloud Swift Solutions', 'text', 100, 60, 'order person name', 'form-control', 'Y', NULL, NULL, 'N', 'N', 8, 'N', 75, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2019-04-11 13:00:00', '2019-11-18 20:14:30'),
(20, 0, 'From email address', 'FROM_EMAIL_ADDRESS', 'notifications@cloudswiftsolutions.com', 'email', 100, 60, 'from email address', 'form-control', 'Y', NULL, NULL, 'N', 'Y', 8, 'N', 74, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2019-04-11 13:00:00', '2021-06-21 21:54:54'),
(21, 0, 'Backend Logo title display', 'BACKEND_LOGO_TITLE_DISPLAY', 'Administrator', 'text', 100, 60, 'backend_logo_title_display', 'form-control', 'Y', '', NULL, 'N', 'Y', 2, 'N', 8, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2019-04-11 13:00:00', '2019-04-11 21:45:59'),
(22, 0, 'Content to display before end of body tag', 'CONTENT_BEFORE_BODY_TAG', '', 'textarea', 100, 6000, 'Please enter content that will before close of body tag.', 'form-control', 'N', NULL, NULL, 'N', 'Y', 6, 'N', 26, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2019-04-11 13:00:00', '2019-09-24 09:24:46'),
(23, 0, 'Script after begin head tag', 'AFTER_HEAD_TAG', '', 'text', 100, 60, 'After head tag javacript script', 'form-control', 'N', NULL, NULL, 'N', 'Y', 3, 'N', 39, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2019-04-11 13:00:00', '2019-09-24 08:43:53'),
(24, 0, 'Application json script', 'APPLICATION_JSON_SCRIPT', '', 'textarea', 100, 6000, 'Application json script', 'form-control', 'N', NULL, NULL, 'N', 'Y', 3, 'N', 26, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2019-04-11 13:00:00', '2019-09-24 09:24:46'),
(25, 0, 'Upload Max Size', 'UPLOAD_MAX_FILESIZE', '2M', 'select', 100, 60, 'Upload Max Size', 'form-control', 'Y', '2M@=8M@=16M@=24M', NULL, 'N', 'N', 4, 'N', 44, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2019-04-11 13:00:00', '2019-04-11 21:45:59'),
(26, 0, 'Facebook', 'FACEBOOK_URL', 'https://www.facebook.com/cloudswiftsolutions/', 'text', 100, 60, 'Please enter your facebook page url', 'form-control', 'N', NULL, NULL, 'N', 'Y', 7, 'N', 40, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2019-04-11 13:00:00', '2019-10-14 07:58:52'),
(27, 0, 'Twitter', 'TWITTER_URL', 'https://twitter.com/cloudswiftsolutions', 'text', 100, 60, 'Please enter your twitter page url', 'form-control', 'N', NULL, NULL, 'N', 'Y', 7, 'N', 40, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2019-04-11 13:00:00', '2019-10-14 07:59:00'),
(28, 0, 'Linkedin', 'LINKEDIN_URL', 'https://www.linkedin.com/company/cloudswiftsolutions/', 'text', 100, 60, 'Please enter your Linkedin page url', 'form-control', 'N', NULL, NULL, 'N', 'Y', 7, 'N', 40, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2019-04-11 13:00:00', '2019-10-14 07:59:06'),
(29, 0, 'Allow to sent email to admin for contact,feedback,etc.', 'ALLOW_CONTACT_EMAIL', 'Y', 'select', 100, 60, 'Please select option', 'form-control', 'Y', 'Y@=N', NULL, 'Y', 'N', 8, 'N', 5, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2019-04-11 13:00:00', '2019-04-11 21:45:59'),
(30, 0, 'Application Name', 'FRONT_APPLICATION_NAME', 'Demonstration Project', 'text', 100, 100, 'Please enter your application name for display on frontend side as name', 'form-control', 'Y', NULL, NULL, 'Y', 'Y', 1, 'N', 1, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2019-04-11 18:30:00', '2019-10-14 13:22:59'),
(31, 0, 'Closed Store Status', 'CLOSED_STORE_STATUS', 'N', 'select', 100, 100, 'This store is closed at present.', 'form-control', 'Y', 'Y@=N', NULL, 'Y', 'Y', 1, 'N', 1, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2019-04-11 18:30:00', '2021-08-02 10:54:46'),
(32, 0, 'Closed Store Message', 'CLOSED_STORE_MESSAGE', 'Store is Under Construction', 'text', 100, 100, 'Closed Store Message', 'form-control', 'Y', NULL, NULL, 'Y', 'Y', 1, 'N', 1, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2019-04-11 18:30:00', '2021-08-02 10:52:45'),
(33, 0, 'BCC Email 1', 'BCC_EMAIL_1', 'bcc@yopmail.com', 'email', 100, 60, 'BCC Email', 'form-control', 'Y', NULL, NULL, 'N', 'Y', 8, 'N', 74, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2019-04-11 18:30:00', '2026-01-29 15:39:46'),
(34, 0, 'SMTP HOST', 'SMTP_HOST', 'smtp.hostinger.com', 'text', 100, 60, 'SMTP HOST', 'form-control', 'Y', NULL, NULL, 'N', 'Y', 8, 'N', 74, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2019-04-11 18:30:00', '2021-08-13 06:20:26'),
(35, 0, 'SMTP PORT', 'SMTP_PORT', '587', 'text', 100, 60, 'SMTP Port', 'form-control', 'Y', NULL, NULL, 'N', 'Y', 8, 'N', 74, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2019-04-11 18:30:00', '2023-09-16 22:32:56'),
(36, 0, 'SMTP PASSWORD', 'SMTP_PASSWORD', 'Cloud@112018', 'email', 100, 60, 'SMTP PASSWORD', 'form-control', 'Y', NULL, NULL, 'N', 'Y', 8, 'N', 74, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2019-04-11 18:30:00', '2021-08-13 06:20:26');

-- --------------------------------------------------------

--
-- Table structure for table `site_config_parent`
--

CREATE TABLE `site_config_parent` (
  `site_config_parent_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `site_config_title` varchar(191) NOT NULL,
  `classname` varchar(191) NOT NULL,
  `root_user_only` varchar(1) NOT NULL,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `display_status` varchar(1) NOT NULL DEFAULT 'Y',
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_by_name` varchar(255) DEFAULT NULL,
  `created_by_role` int(11) NOT NULL DEFAULT 0,
  `deleted_status` varchar(1) NOT NULL DEFAULT 'N',
  `deleted_by` int(11) NOT NULL DEFAULT 0,
  `deleted_by_name` varchar(255) DEFAULT NULL,
  `deleted_time` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_config_parent`
--

INSERT INTO `site_config_parent` (`site_config_parent_id`, `site_id`, `site_config_title`, `classname`, `root_user_only`, `display_order`, `display_status`, `created_by`, `created_by_name`, `created_by_role`, `deleted_status`, `deleted_by`, `deleted_by_name`, `deleted_time`, `created_at`, `updated_at`) VALUES
(1, 0, 'Frontend Settings', 'collapseOne', 'N', 1, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(2, 0, 'Backend Settings', 'collapseTwo', 'N', 2, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(3, 0, 'SEO Settings', 'collapseThree', 'N', 3, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(4, 0, 'Security Settings', 'collapseFour', 'Y', 4, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(5, 0, 'Site Details', 'collapseSeven', 'N', 7, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(6, 0, 'Privacy Settings', 'collapseNine', 'Y', 9, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(7, 0, 'Follow Us', 'collapseTen', 'Y', 10, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:32:06'),
(8, 0, 'Email Settings', 'collapseEight', 'N', 8, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, NULL, '2026-05-26 12:32:06');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL DEFAULT 0,
  `site_db` varchar(255) DEFAULT NULL,
  `user_firstname` varchar(255) DEFAULT NULL,
  `user_lastname` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_token` varchar(255) DEFAULT NULL,
  `user_photo` varchar(255) DEFAULT NULL,
  `user_role_id` smallint(6) NOT NULL DEFAULT 0,
  `is_developer_account` varchar(1) NOT NULL DEFAULT 'N',
  `allow_delete` varchar(1) NOT NULL DEFAULT 'Y',
  `web_or_app` varchar(4) NOT NULL DEFAULT 'App',
  `active_status` varchar(25) NOT NULL DEFAULT 'N',
  `display_order` int(11) NOT NULL DEFAULT 0,
  `display_status` varchar(1) NOT NULL DEFAULT 'Y',
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_by_name` varchar(255) DEFAULT NULL,
  `created_by_role` int(11) NOT NULL DEFAULT 0,
  `deleted_status` varchar(1) NOT NULL DEFAULT 'N',
  `deleted_by` int(11) NOT NULL DEFAULT 0,
  `deleted_by_name` varchar(255) DEFAULT NULL,
  `deleted_time` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `add_1` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `site_id`, `site_db`, `user_firstname`, `user_lastname`, `user_name`, `user_email`, `user_password`, `user_token`, `user_photo`, `user_role_id`, `is_developer_account`, `allow_delete`, `web_or_app`, `active_status`, `display_order`, `display_status`, `created_by`, `created_by_name`, `created_by_role`, `deleted_status`, `deleted_by`, `deleted_by_name`, `deleted_time`, `created_at`, `updated_at`, `add_1`) VALUES
(1, 1, 'nodejsframework', 'Developer', 'Account', 'developer', 'developer112018@yopmail.com', '$2b$12$wK07dgLeMM5C8n3c8D67wOQcgsJxOphl2drJeT5KLcrjL4NiwF/3m', NULL, NULL, 1, 'Y', 'N', 'Web', 'Y', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:32:06', '2026-05-26 12:32:06', NULL),
(2, 1, 'nodejsframework', 'Super', 'Admin', 'cloudswiftsolutions', 'cloudswiftsolutions@gmail.com', '$2a$10$kJTPNZHNRH8L.YWfYLqsX.eZNpNRvzW/6ZnqD0nauEpxObP2kDw26', '511882', NULL, 2, 'N', 'N', 'App', 'Y', 0, 'Y', 0, NULL, 0, 'N', 0, NULL, NULL, '2026-05-26 12:32:06', '2026-05-26 12:32:06', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `action`
--
ALTER TABLE `action`
  ADD PRIMARY KEY (`action_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `item_section`
--
ALTER TABLE `item_section`
  ADD PRIMARY KEY (`item_section_id`);

--
-- Indexes for table `item_section_relation`
--
ALTER TABLE `item_section_relation`
  ADD PRIMARY KEY (`item_section_relation_id`);

--
-- Indexes for table `meta_details`
--
ALTER TABLE `meta_details`
  ADD PRIMARY KEY (`meta_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `role_access`
--
ALTER TABLE `role_access`
  ADD PRIMARY KEY (`role_access_id`);

--
-- Indexes for table `site_config`
--
ALTER TABLE `site_config`
  ADD PRIMARY KEY (`config_id`);

--
-- Indexes for table `site_config_parent`
--
ALTER TABLE `site_config_parent`
  ADD PRIMARY KEY (`site_config_parent_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `action`
--
ALTER TABLE `action`
  MODIFY `action_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `item_section`
--
ALTER TABLE `item_section`
  MODIFY `item_section_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `item_section_relation`
--
ALTER TABLE `item_section_relation`
  MODIFY `item_section_relation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT for table `meta_details`
--
ALTER TABLE `meta_details`
  MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `role_access`
--
ALTER TABLE `role_access`
  MODIFY `role_access_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `site_config`
--
ALTER TABLE `site_config`
  MODIFY `config_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `site_config_parent`
--
ALTER TABLE `site_config_parent`
  MODIFY `site_config_parent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
