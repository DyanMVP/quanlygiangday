-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 17, 2023 lúc 06:17 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quanlygiangday`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_classes`
--

CREATE TABLE `wp_classes` (
  `id` int(11) NOT NULL,
  `ten_lop` varchar(255) DEFAULT NULL,
  `ma_khoa` varchar(255) DEFAULT NULL,
  `id_khoa` int(11) DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Đang đổ dữ liệu cho bảng `wp_classes`
--

INSERT INTO `wp_classes` (`id`, `ten_lop`, `ma_khoa`, `id_khoa`, `created_time`) VALUES
(3, '70DCCN21', 'CNTT', 2, '2023-10-17 13:25:48'),
(4, '70DCCN22', 'CNTT', 2, '2023-10-22 09:10:30'),
(5, '70DCCN23', 'CNTT', 2, '2023-10-28 07:21:11'),
(6, '70DCDT21', 'CNTT', 2, '2023-10-28 07:21:32'),
(7, '70DCHT22', 'CNTT', 2, '2023-10-28 07:21:44'),
(8, '70DCTM21', 'CNTT', 2, '2023-10-28 07:21:58'),
(9, '70DCTT21', 'CNTT', 2, '2023-10-28 07:22:13'),
(10, '70DCTT22', 'CNTT', 2, '2023-10-28 07:22:39'),
(11, '70DCTT23', 'CNTT', 2, '2023-10-28 07:22:48'),
(12, '70DCTT24', 'CNTT', 2, '2023-10-28 07:22:56'),
(13, '70DCTT25', 'CNTT', 2, '2023-10-28 07:23:15'),
(14, '70DCHT21', 'CNTT', 2, '2023-10-28 07:23:35'),
(15, '70DCHT22', 'CNTT', 2, '2023-10-28 07:23:43'),
(16, '70DCHT23', 'CNTT', 2, '2023-10-28 07:23:51'),
(17, '71DCCN21', 'CNTT', 4, '2023-10-28 07:24:51'),
(18, '71DCCN22', 'CNTT', 4, '2023-10-28 07:25:04'),
(19, '71DCDT21', 'CNTT', 4, '2023-10-28 07:25:29'),
(20, '71DCDT22', 'CNTT', 4, '2023-10-28 07:25:41'),
(21, '71DCTM21', 'CNTT', 4, '2023-10-28 07:26:46'),
(22, '71DCTM22', 'CNTT', 4, '2023-10-28 07:26:57'),
(23, '71DCTT21', 'CNTT', 4, '2023-10-28 07:27:43'),
(24, '71DCTT22', 'CNTT', 4, '2023-10-28 07:28:00'),
(25, '71DCTT23', 'CNTT', 4, '2023-10-28 07:28:12'),
(26, '71DCTT24', 'CNTT', 4, '2023-10-28 07:28:29'),
(27, '71DCHT21', 'CNTT', 4, '2023-10-28 07:28:52'),
(28, '70DCHT22', 'CNTT', 4, '2023-10-28 07:29:08'),
(29, '70DCHT23', 'CNTT', 4, '2023-10-28 07:29:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2023-10-11 14:31:51', '2023-10-11 14:31:51', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com\">Gravatar</a>.', 0, '1', '', 'comment', 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_dang_ky`
--

CREATE TABLE `wp_dang_ky` (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `id_lop` int(11) DEFAULT NULL,
  `id_mon` int(11) DEFAULT NULL,
  `hoc_ky` int(100) DEFAULT NULL,
  `ghi_chu` varchar(1000) DEFAULT NULL,
  `user_created` varchar(255) DEFAULT NULL,
  `time_start` date DEFAULT NULL,
  `lesson` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `url_detail` varchar(255) DEFAULT NULL,
  `weekdays` varchar(10) NOT NULL,
  `year` int(11) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Đang đổ dữ liệu cho bảng `wp_dang_ky`
--

INSERT INTO `wp_dang_ky` (`id`, `teacher_id`, `id_lop`, `id_mon`, `hoc_ky`, `ghi_chu`, `user_created`, `time_start`, `lesson`, `link`, `url_detail`, `weekdays`, `year`, `created_time`) VALUES
(2, 37, 4, 2, 1, 'note', 'admin123@gmail.com', '2023-10-22', '[1,3]', 'https://goolge.com', 'https://www.youtube.com/watch?v=PA-CNC17TAg', '2', 2023, '2023-10-22 16:21:46'),
(3, 37, 4, 2, 1, 'note', 'admin123@gmail.com', '2023-10-22', '[1,3]', 'https://goolge.com', NULL, '3', 2023, '2023-10-22 16:21:52'),
(4, 37, 4, 2, 1, 'note', 'admin123@gmail.com', '2023-10-22', '[1,3]', 'https://goolge.com', NULL, '4', 2023, '2023-10-22 16:21:52'),
(5, 37, 4, 2, 1, 'note', 'admin123@gmail.com', '2023-10-22', '[1,3]', 'https://goolge.com', NULL, '5', 2023, '2023-10-22 16:21:53'),
(7, 35, 15, 1, 1, '', 'admin123@gmail.com', '2023-10-28', '[1,3]', 'https://zoommeetings.com', NULL, '6', 2023, '2023-10-28 15:28:54'),
(13, 61, 23, 1, 1, '', 'admin123@gmail.com', '2023-10-29', '[1,3]', 'zoom', 'https://www.youtube.com/watch?v=6yGP5mS03xg', '7', 2023, '2023-10-29 08:33:01'),
(16, 64, 3, 1, 1, '....', '', '2023-11-02', '[1,3]', 'https://google.com', '', '3', 2023, '2023-11-02 13:41:47'),
(17, 65, 3, 2, 1, 'note', 'tavandan0901998@gmail.com', '2023-11-05', '[1, 5]', 'https://google.com', '', '4', 2023, '2023-11-04 06:22:28'),
(18, 61, 3, 1, 1, 'note', 'admin123@gmail.com', '2023-11-11', '[3, 5]', 'https://google.com', '', '5', 2023, '2023-11-04 14:59:14'),
(23, 65, 3, 4, 1, '....', 'tavandan0901998@gmail.com', '2023-11-06', '[2, 3]', 'https://google.com', '', '7', 2023, '2023-11-06 12:04:08'),
(25, 35, 3, 1, 1, 'note', 'admin', '2023-11-08', '[1, 3]', 'https://google.com', '', '2', 2023, '2023-11-08 15:06:19'),
(26, 35, 3, 1, 1, '....', 'admin', '2023-11-09', '[3, 5]', 'https://google.com', '', '6', 2023, '2023-11-09 13:47:28'),
(30, 65, 3, 1, 1, 'sdsd', 'tavandan0901998@gmail.com', '2023-09-09', '[1, 3]', 'https://google.com', '', '6', 2023, '2023-11-10 15:00:18'),
(31, 65, 3, 4, 1, '....', 'tavandan0901998@gmail.com', '2023-09-09', '[6, 9]', 'google.com', '', '6', 2023, '2023-11-13 13:45:02'),
(32, 65, 3, 1, 1, '....', 'tavandan0901998@gmail.com', '2023-09-09', '[3, 5]', 'https://zoommeetings.com', '', '3', 2023, '2023-11-16 13:28:42'),
(33, 35, 3, 1, 1, 'sadasđ', 'admin', '2023-09-09', '[4, 7]', 'https://google.com', 'https://www.youtube.com/watch?v=5TUHfN9oHt0&list=RDdm5-tn1Rug0&index=5', '2', 2023, '2023-11-22 15:12:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_history_lesson`
--

CREATE TABLE `wp_history_lesson` (
  `id` int(11) NOT NULL,
  `id_dang_ky` int(11) DEFAULT NULL,
  `details` varchar(10000) DEFAULT NULL,
  `time_created` datetime DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Đang đổ dữ liệu cho bảng `wp_history_lesson`
--

INSERT INTO `wp_history_lesson` (`id`, `id_dang_ky`, `details`, `time_created`, `note`, `created_time`) VALUES
(1, 17, 'https://www.youtube.com/watch?v=Ycoic6Tjcc0', '2023-11-11 13:04:00', 'note', '2023-11-11 06:04:40'),
(2, 17, 'https://www.youtube.com/watch?v=pHXDMe6QV-U&list=RDpHXDMe6QV-U&start_radio=1', '2023-11-11 13:12:00', 'https://www.youtube.com/watch?v=pHXDMe6QV-U&list=RDpHXDMe6QV-U&start_radio=1', '2023-11-11 06:12:29'),
(3, 2, 'https://www.youtube.com/watch?v=PA-CNC17TAg', '2023-11-25 18:40:00', '', '2023-11-25 11:40:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_khoa`
--

CREATE TABLE `wp_khoa` (
  `id` int(11) NOT NULL,
  `ten_khoa` varchar(255) DEFAULT NULL,
  `mo_ta` varchar(255) DEFAULT NULL,
  `start_year` year(4) DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Đang đổ dữ liệu cho bảng `wp_khoa`
--

INSERT INTO `wp_khoa` (`id`, `ten_khoa`, `mo_ta`, `start_year`, `created_time`) VALUES
(2, 'K70', 'DHCQ K70', '2019', '2023-10-15 05:01:58'),
(4, 'K71', 'DHCQ K71', '2020', '2023-10-22 13:01:22'),
(5, 'K72', 'DHCQ K72', '2021', '2023-10-28 07:15:08'),
(6, 'K73', 'DHCQ K73', '2022', '2023-10-28 07:15:32'),
(7, 'K74', 'DHCQ K74', '2023', '2023-10-28 07:15:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_mon_hoc`
--

CREATE TABLE `wp_mon_hoc` (
  `id` int(11) NOT NULL,
  `ten_mon_hoc` varchar(255) DEFAULT NULL,
  `mo_ta` varchar(1000) DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Đang đổ dữ liệu cho bảng `wp_mon_hoc`
--

INSERT INTO `wp_mon_hoc` (`id`, `ten_mon_hoc`, `mo_ta`, `created_time`) VALUES
(1, 'Kiểm thử phần mềm', 'DC3HT41', '2023-10-28 14:58:20'),
(2, 'Hệ thống hoạch định nguồn lực doanh nghiệp ( ERP )', 'DC3HT42', '2023-10-28 14:58:49'),
(4, 'Hệ cơ sở tri thức', 'DC3HT23', '2023-10-28 15:25:29'),
(5, 'Nhập môn xử lý ảnh', 'DC3HT16', '2023-10-28 15:26:16'),
(6, 'Quản lý dự án phần mềm', 'DC3HT32', '2023-10-28 15:26:38'),
(7, 'Tiếng anh chuyên ngành', 'DC3HT18', '2023-10-28 15:26:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/quanlygiangday', 'yes'),
(2, 'home', 'http://localhost/quanlygiangday', 'yes'),
(3, 'blogname', 'Quản lý giảng dạy trực tuyến', 'yes'),
(4, 'blogdescription', '', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'admin123@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '5', 'yes'),
(23, 'date_format', 'd/m/Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:92:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:41:\"index.php?&page_id=2667&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:2:{i:1;s:37:\"user-role-editor/user-role-editor.php\";i:2;s:41:\"wordpress-importer/wordpress-importer.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '7', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', 'a:2:{i:0;s:69:\"D:\\xampp\\htdocs\\quanlygiangday/wp-content/plugins/akismet/akismet.php\";i:1;s:0:\"\";}', 'no'),
(40, 'template', 'twentytwenty', 'yes'),
(41, 'stylesheet', 'twentytwenty', 'yes'),
(42, 'comment_registration', '0', 'yes'),
(43, 'html_type', 'text/html', 'yes'),
(44, 'use_trackback', '0', 'yes'),
(45, 'default_role', 'subscriber', 'yes'),
(46, 'db_version', '56657', 'yes'),
(47, 'uploads_use_yearmonth_folders', '1', 'yes'),
(48, 'upload_path', '', 'yes'),
(49, 'blog_public', '1', 'yes'),
(50, 'default_link_category', '2', 'yes'),
(51, 'show_on_front', 'page', 'yes'),
(52, 'tag_base', '', 'yes'),
(53, 'show_avatars', '1', 'yes'),
(54, 'avatar_rating', 'G', 'yes'),
(55, 'upload_url_path', '', 'yes'),
(56, 'thumbnail_size_w', '150', 'yes'),
(57, 'thumbnail_size_h', '150', 'yes'),
(58, 'thumbnail_crop', '1', 'yes'),
(59, 'medium_size_w', '300', 'yes'),
(60, 'medium_size_h', '300', 'yes'),
(61, 'avatar_default', 'mystery', 'yes'),
(62, 'large_size_w', '1024', 'yes'),
(63, 'large_size_h', '1024', 'yes'),
(64, 'image_default_link_type', 'none', 'yes'),
(65, 'image_default_size', '', 'yes'),
(66, 'image_default_align', '', 'yes'),
(67, 'close_comments_for_old_posts', '0', 'yes'),
(68, 'close_comments_days_old', '14', 'yes'),
(69, 'thread_comments', '1', 'yes'),
(70, 'thread_comments_depth', '5', 'yes'),
(71, 'page_comments', '0', 'yes'),
(72, 'comments_per_page', '50', 'yes'),
(73, 'default_comments_page', 'newest', 'yes'),
(74, 'comment_order', 'asc', 'yes'),
(75, 'sticky_posts', 'a:0:{}', 'yes'),
(76, 'widget_categories', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(77, 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(78, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'uninstall_plugins', 'a:1:{s:37:\"user-role-editor/user-role-editor.php\";a:2:{i:0;s:16:\"User_Role_Editor\";i:1;s:9:\"uninstall\";}}', 'no'),
(80, 'timezone_string', '', 'yes'),
(81, 'page_for_posts', '2658', 'yes'),
(82, 'page_on_front', '2667', 'yes'),
(83, 'default_post_format', '0', 'yes'),
(84, 'link_manager_enabled', '0', 'yes'),
(85, 'finished_splitting_shared_terms', '1', 'yes'),
(86, 'site_icon', '0', 'yes'),
(87, 'medium_large_size_w', '768', 'yes'),
(88, 'medium_large_size_h', '0', 'yes'),
(89, 'wp_page_for_privacy_policy', '3', 'yes'),
(90, 'show_comments_cookies_opt_in', '1', 'yes'),
(91, 'admin_email_lifespan', '1712586711', 'yes'),
(92, 'disallowed_keys', '', 'no'),
(93, 'comment_previously_approved', '1', 'yes'),
(94, 'auto_plugin_theme_update_emails', 'a:0:{}', 'no'),
(95, 'auto_update_core_dev', 'enabled', 'yes'),
(96, 'auto_update_core_minor', 'enabled', 'yes'),
(97, 'auto_update_core_major', 'enabled', 'yes'),
(98, 'wp_force_deactivated_plugins', 'a:0:{}', 'yes'),
(99, 'initial_db_version', '51917', 'yes'),
(100, 'wp_user_roles', 'a:6:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:73:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:14:\"ure_edit_roles\";b:1;s:16:\"ure_create_roles\";b:1;s:16:\"ure_delete_roles\";b:1;s:23:\"ure_create_capabilities\";b:1;s:23:\"ure_delete_capabilities\";b:1;s:18:\"ure_manage_options\";b:1;s:15:\"ure_reset_roles\";b:1;s:17:\"install_languages\";b:1;s:14:\"resume_plugins\";b:1;s:13:\"resume_themes\";b:1;s:23:\"view_site_health_checks\";b:1;s:14:\"quanlygiangday\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:31:{s:19:\"delete_others_pages\";b:1;s:19:\"delete_others_posts\";b:1;s:12:\"delete_pages\";b:1;s:12:\"delete_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:20:\"delete_private_posts\";b:1;s:22:\"delete_published_pages\";b:1;s:22:\"delete_published_posts\";b:1;s:17:\"edit_others_pages\";b:1;s:17:\"edit_others_posts\";b:1;s:10:\"edit_pages\";b:1;s:10:\"edit_posts\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"edit_private_posts\";b:1;s:20:\"edit_published_pages\";b:1;s:20:\"edit_published_posts\";b:1;s:7:\"level_0\";b:1;s:7:\"level_1\";b:1;s:7:\"level_2\";b:1;s:7:\"level_3\";b:1;s:7:\"level_4\";b:1;s:7:\"level_5\";b:1;s:7:\"level_6\";b:1;s:7:\"level_7\";b:1;s:14:\"manage_options\";b:1;s:13:\"publish_pages\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:18:\"read_private_pages\";b:1;s:18:\"read_private_posts\";b:1;s:12:\"upload_files\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:7:\"teacher\";a:2:{s:4:\"name\";s:7:\"Teacher\";s:12:\"capabilities\";a:17:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;s:14:\"quanlygiangday\";b:1;s:19:\"delete_others_posts\";b:1;s:12:\"delete_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:10:\"edit_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:17:\"manage_categories\";b:1;s:17:\"moderate_comments\";b:1;s:13:\"publish_posts\";b:1;s:18:\"read_private_posts\";b:1;s:17:\"unfiltered_upload\";b:1;s:12:\"upload_files\";b:1;}}}', 'yes'),
(101, 'fresh_site', '0', 'yes'),
(102, 'widget_block', 'a:2:{i:6;a:1:{s:7:\"content\";s:71:\"<!-- wp:group -->\n<div class=\"wp-block-group\"></div>\n<!-- /wp:group -->\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(103, 'sidebars_widgets', 'a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:0:{}s:9:\"sidebar-2\";a:1:{i:0;s:7:\"block-6\";}s:13:\"array_version\";i:3;}', 'yes'),
(104, 'cron', 'a:7:{i:1701873112;a:5:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1701873121;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1701873125;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1701907578;a:1:{s:21:\"wp_update_user_counts\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1701959512;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}i:1702307455;a:1:{s:30:\"wp_delete_temp_updater_backups\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}', 'yes'),
(105, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_archives', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'widget_meta', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(113, 'widget_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(114, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(115, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(116, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(118, 'recovery_keys', 'a:0:{}', 'yes'),
(121, 'theme_mods_twentytwentytwo', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1697034772;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}}}}', 'yes'),
(124, 'https_detection_errors', 'a:1:{s:23:\"ssl_verification_failed\";a:1:{i:0;s:36:\"Xác thực SSL không thành công.\";}}', 'yes'),
(147, 'current_theme', 'Twenty Twenty', 'yes'),
(148, 'theme_mods_twentytwenty', 'a:5:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:7:\"primary\";i:3;}s:18:\"custom_css_post_id\";i:-1;s:11:\"custom_logo\";i:2695;s:11:\"retina_logo\";b:1;}', 'yes'),
(149, 'theme_switched', '', 'yes'),
(152, 'finished_updating_comment_type', '1', 'yes'),
(153, 'widget_recent-posts', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(154, 'widget_recent-comments', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(155, 'user_count', '5', 'no'),
(156, 'db_upgraded', '', 'yes'),
(159, 'auto_core_update_notified', 'a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:18:\"admin123@gmail.com\";s:7:\"version\";s:5:\"6.4.1\";s:9:\"timestamp\";i:1699540347;}', 'no'),
(162, 'recovery_mode_email_last_sent', '1700911339', 'yes'),
(168, 'nonce_key', ':{DhgCn5gm&B<duGJy0IC5t,87w1a>M,@:Y 4{eAbpd;}c5({{~DtMgxK/$L`hi]', 'no'),
(169, 'nonce_salt', 'k#z1/7j/te5MXb3rFB=e!k+BE3dG;<Lfxw-Qa(O8%FFnDBoZ!<mTsMP/<(rzG_w|', 'no'),
(177, 'auth_key', '01OG||AAkrY$B6$iSh^C4nQLp(v?]Wr~3t=7f& U`FvF`AP/@q3Ynuta@ed}qRi$', 'no'),
(178, 'auth_salt', 'LD=Q-_K`bA:p+x-Ft:qm2,/l#}lW7f5D [#+&0n7t>&hDa69>,~R{8C-UPe2pIqP', 'no'),
(179, 'logged_in_key', ',{*vnk#?^[VoM_zv1$9=>CakZ.l6#r{PT+$X9jqa5PlJ]rG>K2eil#]D}5F91%7c', 'no'),
(180, 'logged_in_salt', '~6_A4MI1bcy# /VwmwZHU8?,mQJL 2Ou_jNuGElm{^xD<Rf2qB+|+&@TDCDGI;wU', 'no'),
(186, '_transient_health-check-site-status-result', '{\"good\":18,\"recommended\":3,\"critical\":2}', 'yes'),
(227, 'recently_activated', 'a:0:{}', 'yes'),
(304, 'user_role_editor', 'a:7:{s:11:\"ure_version\";s:4:\"4.64\";s:15:\"show_admin_role\";i:0;s:17:\"ure_caps_readable\";i:0;s:24:\"ure_show_deprecated_caps\";i:0;s:23:\"ure_confirm_role_update\";s:1:\"1\";s:14:\"edit_user_caps\";s:1:\"1\";s:18:\"caps_columns_quant\";i:1;}', 'yes'),
(305, 'wp_backup_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'no'),
(306, 'ure_tasks_queue', 'a:0:{}', 'yes'),
(312, 'ure_role_additional_options_values', 'a:1:{s:6:\"editor\";a:0:{}}', 'yes'),
(425, 'wp_calendar_block_has_published_posts', '1', 'yes'),
(429, 'WPLANG', 'vi', 'yes'),
(430, 'new_admin_email', 'admin123@gmail.com', 'yes'),
(689, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}', 'yes'),
(717, 'supsystic_tbl_plugin_version', '1.10.30', 'yes'),
(718, '_supsystic_tables_rev', '61', 'yes'),
(719, 'wp_supsystic_tbl_plug_welcome_show', '1698589363', 'yes'),
(720, 'supsystic_tbl_plug_was_used', '1', 'yes'),
(721, 'widget_tables_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(722, 'supsystic_tbl_reviewNotice', 'a:2:{s:4:\"time\";i:1699194175;s:5:\"shown\";b:0;}', 'yes'),
(723, 'supsystic_tbl_wooAdsNotice', 'a:2:{s:4:\"time\";i:1698588375;s:5:\"shown\";b:0;}', 'yes'),
(724, 'supsystic_tbl_welcome_page_was_showed', '1', 'yes'),
(813, 'site_logo', '2695', 'yes'),
(815, 'category_children', 'a:1:{i:6;a:1:{i:0;i:7;}}', 'yes'),
(975, 'wp_attachment_pages_enabled', '1', 'yes'),
(977, 'can_compress_scripts', '1', 'yes'),
(994, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.4.1.zip\";s:6:\"locale\";s:2:\"vi\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.4.1.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-6.4.1-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-6.4.1-new-bundled.zip\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"6.4.1\";s:7:\"version\";s:5:\"6.4.1\";s:11:\"php_version\";s:5:\"7.0.0\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"6.4\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1701871569;s:15:\"version_checked\";s:5:\"6.4.1\";s:12:\"translations\";a:0:{}}', 'no'),
(1101, 'dismissed_update_core', 'a:1:{s:8:\"6.4.1|vi\";b:1;}', 'no'),
(1174, '_site_transient_timeout_theme_roots', '1701873376', 'no'),
(1175, '_site_transient_theme_roots', 'a:2:{s:12:\"twentytwenty\";s:7:\"/themes\";s:16:\"twentytwentyfour\";s:7:\"/themes\";}', 'no'),
(1176, '_site_transient_update_themes', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1701871577;s:7:\"checked\";a:2:{s:12:\"twentytwenty\";s:3:\"1.9\";s:16:\"twentytwentyfour\";s:3:\"1.0\";}s:8:\"response\";a:1:{s:12:\"twentytwenty\";a:6:{s:5:\"theme\";s:12:\"twentytwenty\";s:11:\"new_version\";s:3:\"2.4\";s:3:\"url\";s:42:\"https://wordpress.org/themes/twentytwenty/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/theme/twentytwenty.2.4.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}}s:9:\"no_update\";a:1:{s:16:\"twentytwentyfour\";a:6:{s:5:\"theme\";s:16:\"twentytwentyfour\";s:11:\"new_version\";s:3:\"1.0\";s:3:\"url\";s:46:\"https://wordpress.org/themes/twentytwentyfour/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/theme/twentytwentyfour.1.0.zip\";s:8:\"requires\";s:3:\"6.4\";s:12:\"requires_php\";s:3:\"7.0\";}}s:12:\"translations\";a:0:{}}', 'no'),
(1177, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1701871578;s:8:\"response\";a:2:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:3:\"5.3\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:54:\"https://downloads.wordpress.org/plugin/akismet.5.3.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:60:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=2818463\";s:2:\"1x\";s:60:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=2818463\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/akismet/assets/banner-1544x500.png?rev=2900731\";s:2:\"1x\";s:62:\"https://ps.w.org/akismet/assets/banner-772x250.png?rev=2900731\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.8\";s:6:\"tested\";s:5:\"6.4.1\";s:12:\"requires_php\";s:6:\"5.6.20\";}s:37:\"user-role-editor/user-role-editor.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:30:\"w.org/plugins/user-role-editor\";s:4:\"slug\";s:16:\"user-role-editor\";s:6:\"plugin\";s:37:\"user-role-editor/user-role-editor.php\";s:11:\"new_version\";s:6:\"4.64.1\";s:3:\"url\";s:47:\"https://wordpress.org/plugins/user-role-editor/\";s:7:\"package\";s:66:\"https://downloads.wordpress.org/plugin/user-role-editor.4.64.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:69:\"https://ps.w.org/user-role-editor/assets/icon-256x256.jpg?rev=1020390\";s:2:\"1x\";s:69:\"https://ps.w.org/user-role-editor/assets/icon-128x128.jpg?rev=1020390\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:71:\"https://ps.w.org/user-role-editor/assets/banner-772x250.png?rev=1263116\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.4\";s:6:\"tested\";s:5:\"6.4.1\";s:12:\"requires_php\";s:3:\"7.3\";}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:1:{s:41:\"wordpress-importer/wordpress-importer.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:32:\"w.org/plugins/wordpress-importer\";s:4:\"slug\";s:18:\"wordpress-importer\";s:6:\"plugin\";s:41:\"wordpress-importer/wordpress-importer.php\";s:11:\"new_version\";s:5:\"0.8.1\";s:3:\"url\";s:49:\"https://wordpress.org/plugins/wordpress-importer/\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/plugin/wordpress-importer.0.8.1.zip\";s:5:\"icons\";a:2:{s:2:\"1x\";s:63:\"https://ps.w.org/wordpress-importer/assets/icon.svg?rev=2791650\";s:3:\"svg\";s:63:\"https://ps.w.org/wordpress-importer/assets/icon.svg?rev=2791650\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:72:\"https://ps.w.org/wordpress-importer/assets/banner-772x250.png?rev=547654\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.2\";}}s:7:\"checked\";a:3:{s:19:\"akismet/akismet.php\";s:3:\"5.1\";s:37:\"user-role-editor/user-role-editor.php\";s:4:\"4.64\";s:41:\"wordpress-importer/wordpress-importer.php\";s:5:\"0.8.1\";}}', 'no'),
(1178, '_site_transient_timeout_php_check_3fde9d06ba9e4fd20d08658e6f30b792', '1702476383', 'no'),
(1179, '_site_transient_php_check_3fde9d06ba9e4fd20d08658e6f30b792', 'a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:3:\"7.0\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'no');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(10, 12, '_edit_lock', '1698514278:1'),
(11, 12, '_wp_page_template', ''),
(12, 14, '_wp_attached_file', '2023/10/istockphoto-1322277517-612x612-1.jpg'),
(13, 14, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:612;s:6:\"height\";i:408;s:4:\"file\";s:44:\"2023/10/istockphoto-1322277517-612x612-1.jpg\";s:8:\"filesize\";i:23957;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:24:\"Getty Images/iStockphoto\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:117:\"Wild grass in the mountains at sunset. Macro image, shallow depth of field. Vintage filter. Summer nature background.\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(17, 18, '_wp_attached_file', '2023/10/leadspace.png'),
(18, 18, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1584;s:6:\"height\";i:633;s:4:\"file\";s:21:\"2023/10/leadspace.png\";s:8:\"filesize\";i:194975;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(19, 1, '_edit_lock', '1698584628:8'),
(22, 1, '_thumbnail_id', '14'),
(26, 2617, 'slide_template', 'default'),
(27, 2617, 'ftc_gallery', ''),
(28, 2617, 'ftc_post_layout', '0'),
(29, 2617, 'ftc_post_left_sidebar', '0'),
(30, 2617, 'ftc_post_right_sidebar', '0'),
(31, 2617, 'ftc_bg_breadcrumbs', ''),
(32, 2617, 'ftc_audio_url', ''),
(33, 2617, 'ftc_video_url', ''),
(34, 2617, '_ftc_post_views_count', '3'),
(35, 2617, 'post_views_count', '4'),
(36, 2617, '_wp_old_date', '2018-08-08'),
(37, 2617, '_wp_old_date', '2019-01-01'),
(38, 2617, 'rs_page_bg_color', '#ffffff'),
(39, 2617, '_wcfm_article_views', '1'),
(41, 2624, 'slide_template', 'default'),
(42, 2624, 'ftc_gallery', ''),
(43, 2624, 'ftc_post_layout', '0'),
(44, 2624, 'ftc_post_left_sidebar', '0'),
(45, 2624, 'ftc_post_right_sidebar', '0'),
(46, 2624, 'ftc_bg_breadcrumbs', ''),
(47, 2624, 'ftc_audio_url', ''),
(48, 2624, 'ftc_video_url', ''),
(49, 2624, '_wp_old_date', '2018-08-08'),
(50, 2624, 'post_views_count', '2'),
(51, 2624, '_wp_old_date', '2019-01-01'),
(52, 2624, 'rs_page_bg_color', '#ffffff'),
(53, 2624, '_wcfm_article_views', '1'),
(55, 2626, 'slide_template', 'default'),
(56, 2626, 'ftc_gallery', ''),
(57, 2626, 'ftc_post_layout', '0'),
(58, 2626, 'ftc_post_left_sidebar', '0'),
(59, 2626, 'ftc_post_right_sidebar', '0'),
(60, 2626, 'ftc_bg_breadcrumbs', ''),
(61, 2626, 'ftc_audio_url', ''),
(62, 2626, 'ftc_video_url', ''),
(63, 2626, '_wp_old_date', '2018-08-08'),
(64, 2626, 'post_views_count', '1'),
(65, 2626, '_wp_old_date', '2019-01-01'),
(66, 2626, 'rs_page_bg_color', '#ffffff'),
(67, 2626, '_wcfm_article_views', '1'),
(69, 2628, 'slide_template', 'default'),
(70, 2628, 'ftc_gallery', ''),
(71, 2628, 'ftc_post_layout', '0'),
(72, 2628, 'ftc_post_left_sidebar', '0'),
(73, 2628, 'ftc_post_right_sidebar', '0'),
(74, 2628, 'ftc_bg_breadcrumbs', ''),
(75, 2628, 'ftc_audio_url', ''),
(76, 2628, 'ftc_video_url', ''),
(77, 2628, '_ftc_post_views_count', '1'),
(78, 2628, 'post_views_count', '2'),
(79, 2628, '_wp_old_date', '2018-08-08'),
(80, 2628, '_wp_old_date', '2019-01-01'),
(81, 2628, 'rs_page_bg_color', '#ffffff'),
(82, 2628, '_wcfm_article_views', '1'),
(84, 2631, 'slide_template', 'default'),
(85, 2631, 'ftc_gallery', ''),
(86, 2631, 'ftc_post_layout', '0'),
(87, 2631, 'ftc_post_left_sidebar', '0'),
(88, 2631, 'ftc_post_right_sidebar', '0'),
(89, 2631, 'ftc_bg_breadcrumbs', ''),
(90, 2631, 'ftc_audio_url', ''),
(91, 2631, 'ftc_video_url', ''),
(92, 2631, '_wp_old_date', '2018-08-08'),
(93, 2631, 'post_views_count', '0'),
(94, 2631, '_wp_old_date', '2019-01-01'),
(95, 2631, 'rs_page_bg_color', '#ffffff'),
(97, 2633, 'slide_template', 'default'),
(98, 2633, 'ftc_gallery', ''),
(99, 2633, 'ftc_post_layout', '0'),
(100, 2633, 'ftc_post_left_sidebar', '0'),
(101, 2633, 'ftc_post_right_sidebar', '0'),
(102, 2633, 'ftc_bg_breadcrumbs', ''),
(103, 2633, 'ftc_audio_url', ''),
(104, 2633, 'ftc_video_url', ''),
(105, 2633, '_wp_old_date', '2018-08-08'),
(106, 2633, 'post_views_count', '0'),
(107, 2633, '_wp_old_date', '2019-01-01'),
(108, 2633, 'rs_page_bg_color', '#ffffff'),
(110, 2634, 'slide_template', 'default'),
(111, 2634, 'ftc_gallery', ''),
(112, 2634, 'ftc_post_layout', '0'),
(113, 2634, 'ftc_post_left_sidebar', '0'),
(114, 2634, 'ftc_post_right_sidebar', '0'),
(115, 2634, 'ftc_bg_breadcrumbs', ''),
(116, 2634, 'ftc_audio_url', ''),
(117, 2634, 'ftc_video_url', ''),
(118, 2634, '_wp_old_date', '2018-08-08'),
(119, 2634, 'post_views_count', '0'),
(120, 2634, '_wp_old_date', '2019-01-01'),
(121, 2634, 'rs_page_bg_color', '#ffffff'),
(123, 2638, 'slide_template', ''),
(124, 2638, 'ftc_gallery', ''),
(125, 2638, 'ftc_post_layout', '0'),
(126, 2638, 'ftc_post_left_sidebar', '0'),
(127, 2638, 'ftc_post_right_sidebar', '0'),
(128, 2638, 'ftc_bg_breadcrumbs', ''),
(129, 2638, 'ftc_audio_url', ''),
(130, 2638, 'ftc_video_url', ''),
(131, 2638, '_wp_old_date', '2019-01-09'),
(132, 2638, '_ftc_post_views_count', '1'),
(133, 2638, 'post_views_count', '1'),
(134, 2638, '_wcfm_article_views', '1'),
(136, 2640, 'slide_template', 'default'),
(137, 2640, 'ftc_gallery', ''),
(138, 2640, 'ftc_post_layout', '0'),
(139, 2640, 'ftc_post_left_sidebar', '0'),
(140, 2640, 'ftc_post_right_sidebar', '0'),
(141, 2640, 'ftc_bg_breadcrumbs', ''),
(142, 2640, 'ftc_audio_url', ''),
(143, 2640, 'ftc_video_url', ''),
(144, 2640, '_wp_old_date', '2018-08-08'),
(145, 2640, 'post_views_count', '1'),
(146, 2640, '_wp_old_date', '2019-01-01'),
(147, 2640, 'rs_page_bg_color', '#ffffff'),
(148, 2640, '_edit_lock', '1699449888:24'),
(151, 2633, '_edit_lock', '1698765289:1'),
(152, 2631, '_edit_lock', '1698765235:1'),
(153, 2628, '_edit_lock', '1698765243:1'),
(154, 2626, '_edit_lock', '1697732230:8'),
(155, 2624, '_edit_lock', '1697732229:8'),
(156, 2617, '_edit_lock', '1697732229:8'),
(157, 2638, '_edit_lock', '1697732228:8'),
(172, 2634, '_edit_lock', '1700583842:1'),
(179, 2652, '_edit_lock', '1698408969:1'),
(180, 2652, '_wp_page_template', 'templates/teacher.php'),
(181, 2654, '_wp_attached_file', '2023/10/65581.png'),
(182, 2654, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:512;s:6:\"height\";i:512;s:4:\"file\";s:17:\"2023/10/65581.png\";s:8:\"filesize\";i:7146;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(183, 2655, '_wp_attached_file', '2023/10/219986.png'),
(184, 2655, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:512;s:6:\"height\";i:512;s:4:\"file\";s:18:\"2023/10/219986.png\";s:8:\"filesize\";i:22945;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(185, 2656, '_wp_attached_file', '2023/10/User_icon-cp.svg_.png'),
(186, 2656, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1656;s:6:\"height\";i:2057;s:4:\"file\";s:29:\"2023/10/User_icon-cp.svg_.png\";s:8:\"filesize\";i:124139;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(187, 2657, '_wp_attached_file', '2023/10/images.png'),
(188, 2657, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:235;s:6:\"height\";i:215;s:4:\"file\";s:18:\"2023/10/images.png\";s:8:\"filesize\";i:2953;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(189, 2658, '_edit_lock', '1698570948:1'),
(193, 2661, '_edit_lock', '1698764829:1'),
(194, 2663, '_menu_item_type', 'post_type'),
(195, 2663, '_menu_item_menu_item_parent', '0'),
(196, 2663, '_menu_item_object_id', '2658'),
(197, 2663, '_menu_item_object', 'page'),
(198, 2663, '_menu_item_target', ''),
(199, 2663, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(200, 2663, '_menu_item_xfn', ''),
(201, 2663, '_menu_item_url', ''),
(203, 2664, '_menu_item_type', 'post_type'),
(204, 2664, '_menu_item_menu_item_parent', '0'),
(205, 2664, '_menu_item_object_id', '2652'),
(206, 2664, '_menu_item_object', 'page'),
(207, 2664, '_menu_item_target', ''),
(208, 2664, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(209, 2664, '_menu_item_xfn', ''),
(210, 2664, '_menu_item_url', ''),
(212, 2665, '_menu_item_type', 'post_type'),
(213, 2665, '_menu_item_menu_item_parent', '0'),
(214, 2665, '_menu_item_object_id', '2661'),
(215, 2665, '_menu_item_object', 'page'),
(216, 2665, '_menu_item_target', ''),
(217, 2665, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(218, 2665, '_menu_item_xfn', ''),
(219, 2665, '_menu_item_url', ''),
(221, 2661, '_wp_page_template', 'templates/lich-day.php'),
(231, 2665, '_wp_old_date', '2023-10-29'),
(232, 2663, '_wp_old_date', '2023-10-29'),
(233, 2664, '_wp_old_date', '2023-10-29'),
(234, 2667, '_edit_lock', '1700500224:1'),
(235, 2669, '_menu_item_type', 'post_type'),
(236, 2669, '_menu_item_menu_item_parent', '0'),
(237, 2669, '_menu_item_object_id', '2667'),
(238, 2669, '_menu_item_object', 'page'),
(239, 2669, '_menu_item_target', ''),
(240, 2669, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(241, 2669, '_menu_item_xfn', ''),
(242, 2669, '_menu_item_url', ''),
(244, 2640, '_edit_last', '1'),
(245, 2640, '_wp_page_template', 'default'),
(248, 2634, '_edit_last', '1'),
(249, 2634, '_wp_page_template', 'default'),
(256, 2667, '_wp_page_template', 'templates/gioi-thieu.php'),
(257, 2633, '_edit_last', '1'),
(258, 2633, '_wp_page_template', 'default'),
(261, 2631, '_edit_last', '1'),
(262, 2631, '_wp_page_template', 'default'),
(265, 2628, '_edit_last', '1'),
(266, 2628, '_wp_page_template', 'default'),
(269, 2672, '_wp_attached_file', '2020/01/1693450343banner-thacsi-2023.png'),
(270, 2672, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1500;s:6:\"height\";i:450;s:4:\"file\";s:40:\"2020/01/1693450343banner-thacsi-2023.png\";s:8:\"filesize\";i:243257;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(271, 2673, '_wp_attached_file', '2020/01/1686731522123.jpg'),
(272, 2673, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1500;s:6:\"height\";i:450;s:4:\"file\";s:25:\"2020/01/1686731522123.jpg\";s:8:\"filesize\";i:214855;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(273, 2674, '_wp_attached_file', '2020/01/1693964604slide_chao_k74@72x.webp'),
(274, 2674, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1500;s:6:\"height\";i:480;s:4:\"file\";s:41:\"2020/01/1693964604slide_chao_k74@72x.webp\";s:8:\"filesize\";i:50342;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(275, 2675, '_wp_attached_file', '2020/01/1696299970slide-cds-quoc-gia.webp'),
(276, 2675, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1501;s:6:\"height\";i:481;s:4:\"file\";s:41:\"2020/01/1696299970slide-cds-quoc-gia.webp\";s:8:\"filesize\";i:38184;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(277, 2676, '_wp_attached_file', '2020/01/1698741194Banner-Website.webp'),
(278, 2676, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1501;s:6:\"height\";i:481;s:4:\"file\";s:37:\"2020/01/1698741194Banner-Website.webp\";s:8:\"filesize\";i:392712;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(281, 2640, '_thumbnail_id', '2676'),
(284, 2634, '_thumbnail_id', '2674'),
(287, 2633, '_thumbnail_id', '2675'),
(290, 2631, '_thumbnail_id', '2673'),
(293, 2628, '_thumbnail_id', '2672'),
(294, 2680, '_edit_lock', '1698765912:1'),
(295, 2681, '_wp_attached_file', '2023/10/bbae629676df150682033a9c841b4e8b.jpg'),
(296, 2681, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1024;s:6:\"height\";i:683;s:4:\"file\";s:44:\"2023/10/bbae629676df150682033a9c841b4e8b.jpg\";s:8:\"filesize\";i:136647;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:3:\"UTT\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(299, 2680, '_thumbnail_id', '2681'),
(302, 2684, '_edit_lock', '1698767807:1'),
(303, 2685, '_wp_attached_file', '2023/10/utt-tham-lam-viec-nhat-ban-2023-01.jpg'),
(304, 2685, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1024;s:6:\"height\";i:661;s:4:\"file\";s:46:\"2023/10/utt-tham-lam-viec-nhat-ban-2023-01.jpg\";s:8:\"filesize\";i:216011;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(307, 2684, '_thumbnail_id', '2685'),
(308, 2687, '_edit_lock', '1698933364:24'),
(309, 2688, '_wp_attached_file', '2023/10/hoc-bong-sv-vuot-kho-02.jpg'),
(310, 2688, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1024;s:6:\"height\";i:683;s:4:\"file\";s:35:\"2023/10/hoc-bong-sv-vuot-kho-02.jpg\";s:8:\"filesize\";i:134177;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:3:\"UTT\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(313, 2687, '_thumbnail_id', '2688'),
(316, 2690, '_wp_attached_file', '2023/11/logo-utt-border.png'),
(317, 2690, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:2678;s:6:\"height\";i:1837;s:4:\"file\";s:27:\"2023/11/logo-utt-border.png\";s:8:\"filesize\";i:124051;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(321, 2692, '_wp_attached_file', '2023/11/logo.png'),
(322, 2692, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:360;s:6:\"height\";i:103;s:4:\"file\";s:16:\"2023/11/logo.png\";s:8:\"filesize\";i:4252;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(326, 2695, '_wp_attached_file', '2023/11/1447346747LOGO_GTVT.png'),
(327, 2695, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:360;s:6:\"height\";i:103;s:4:\"file\";s:31:\"2023/11/1447346747LOGO_GTVT.png\";s:8:\"filesize\";i:10087;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(332, 2687, '_edit_last', '1'),
(333, 2687, '_pingme', '1'),
(334, 2687, 'mo_time_to_read', '3'),
(335, 2687, 'mo_background_header', 'http://localhost/quanlygiangday/wp-content/uploads/2023/11/logo-utt-border.png'),
(336, 2687, 'mo_logo_customer_case', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(255) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2023-10-11 14:31:51', '2023-10-11 14:31:51', '<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2023-10-18 16:08:14', '2023-10-18 16:08:14', '', 0, 'http://localhost/quanlygiangday/?p=1', 0, 'post', '', 1),
(12, 1, '2023-10-14 04:25:29', '2023-10-14 04:25:29', '', 'Home', '', 'publish', 'closed', 'closed', '', 'home', '', '', '2023-10-26 21:11:40', '2023-10-26 14:11:40', '', 0, 'http://localhost/quanlygiangday/?page_id=12', 0, 'page', '', 0),
(13, 1, '2023-10-14 04:25:29', '2023-10-14 04:25:29', '', 'Home', '', 'inherit', 'closed', 'closed', '', '12-revision-v1', '', '', '2023-10-14 04:25:29', '2023-10-14 04:25:29', '', 12, 'http://localhost/quanlygiangday/?p=13', 0, 'revision', '', 0),
(14, 1, '2023-10-15 06:52:45', '2023-10-15 06:52:45', '', 'istockphoto-1322277517-612x612', 'Wild grass in the mountains at sunset. Macro image, shallow depth of field. Vintage filter. Summer nature background.', 'inherit', 'open', 'closed', '', 'istockphoto-1322277517-612x612', '', '', '2023-10-15 06:52:45', '2023-10-15 06:52:45', '', 0, 'http://localhost/quanlygiangday/wp-content/uploads/2023/10/istockphoto-1322277517-612x612-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(18, 1, '2023-10-17 13:29:24', '2023-10-17 13:29:24', '', 'leadspace', '', 'inherit', 'open', 'closed', '', 'leadspace', '', '', '2023-10-17 13:29:24', '2023-10-17 13:29:24', '', 0, 'http://localhost/quanlygiangday/wp-content/uploads/2023/10/leadspace.png', 0, 'attachment', 'image/png', 0),
(20, 8, '2023-10-18 16:08:14', '2023-10-18 16:08:14', '<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->', 'Hello world!', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2023-10-18 16:08:14', '2023-10-18 16:08:14', '', 1, 'http://localhost/quanlygiangday/?p=20', 0, 'revision', '', 0),
(2617, 1, '2020-01-01 01:29:00', '2020-01-01 01:29:00', 'Vestibulum porta iaculis felis, eget tristique ante egestas quis. Sed non quis, convallis felis. Etiam id elit id elit dapibus blandit. Lorem Ipsum has been the industry\"s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \"Content here, content here\", making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \"lorem ipsum\" will uncover many web sites still in their infancy.', 'Interesting Facts About', '', 'publish', 'open', 'open', '', 'interesting-facts-about-4', '', '', '2023-10-19 16:19:26', '2023-10-19 16:19:26', '', 0, 'https://organico.themeftc.com//?p=2617', 0, 'post', '', 0),
(2624, 1, '2020-01-01 01:30:00', '2020-01-01 01:30:00', 'Suspendisse ac quam sed massa tincidunt blandit. Cras aliquam mi sit amet justo rutrum, at dignissim massa gravida. Donec eu libero aliquet, porttitor lacus elementum, sagittis dui. Pellentesque lacus lacus, efficitur ut rutrum vel, feugiat sit amet dui. Ut sed libero luctus, molestie augue et, vehicula odio. Phasellus feugiat risus mauris, in accumsan ipsum mollis vel. Nulla cursus dui ut ante volutpat, quis ultrices velit elementum. Vivamus ullamcorper velit a pretium finibus.\n\nNulla sed mi leo, sit amet molestie nulla. Phasellus lobortis blandit ipsum, at adipiscing eros porta quis. Phasellus in nisi ipsum, quis dapibus magna. Phasellus odio dolor, pretium sit amet aliquam a, gravida eget dui. Pellentesque eu ipsum et quam faucibus scelerisque vitae ut ligula. Ut luctus fermentum commodo. Mauris eget justo turpis, eget fringilla mi. Duis lobortis cursus mi vel tristique. Maecenas eu lorem hendrerit neque dapibus cursus id sit amet nisi. Proin rhoncus sem', 'Lorem Ipsum is simply', '', 'publish', 'open', 'open', '', 'lorem-ipsum-is-simply-4', '', '', '2023-10-19 16:19:21', '2023-10-19 16:19:21', '', 0, 'https://organico.themeftc.com//?p=2624', 0, 'post', '', 0),
(2626, 1, '2020-01-01 01:31:00', '2020-01-01 01:31:00', 'Suspendisse ac quam sed massa tincidunt blandit. Cras aliquam mi sit amet justo rutrum, at dignissim massa gravida. Donec eu libero aliquet, porttitor lacus elementum, sagittis dui. Pellentesque lacus lacus, efficitur ut rutrum vel, feugiat sit amet dui. Ut sed libero luctus, molestie augue et, vehicula odio. Phasellus feugiat risus mauris, in accumsan ipsum mollis vel. Nulla cursus dui ut ante volutpat, quis ultrices velit elementum. Vivamus ullamcorper velit a pretium finibus.\n\nNulla sed mi leo, sit amet molestie nulla. Phasellus lobortis blandit ipsum, at adipiscing eros porta quis. Phasellus in nisi ipsum, quis dapibus magna. Phasellus odio dolor, pretium sit amet aliquam a, gravida eget dui. Pellentesque eu ipsum et quam faucibus scelerisque vitae ut ligula. Ut luctus fermentum commodo. Mauris eget justo turpis, eget fringilla mi. Duis lobortis cursus mi vel tristique. Maecenas eu lorem hendrerit neque dapibus cursus id sit amet nisi. Proin rhoncus sem', 'Lorem Ipsum is simple', '', 'publish', 'open', 'open', '', 'lorem-ipsum-is-simple-4', '', '', '2023-10-19 16:19:18', '2023-10-19 16:19:18', '', 0, 'https://organico.themeftc.com//?p=2626', 0, 'post', '', 0),
(2628, 1, '2020-01-01 01:32:00', '2019-12-31 18:32:00', 'Suspendisse ac quam sed massa tincidunt blandit. Cras aliquam mi sit amet justo rutrum, at dignissim massa gravida. Donec eu libero aliquet, porttitor lacus elementum, sagittis dui. Pellentesque lacus lacus, efficitur ut rutrum vel, feugiat sit amet dui. Ut sed libero luctus, molestie augue et, vehicula odio. Phasellus feugiat risus mauris, in accumsan ipsum mollis vel. Nulla cursus dui ut ante volutpat, quis ultrices velit elementum. Vivamus ullamcorper velit a pretium finibus.', 'Easy to custom content', 'Vestibulum porta iaculis felis, eget tristique ante egestas quis. Sed non quis, convallis felis. Etiam id elit id elit dapibus blandit.', 'publish', 'open', 'open', '', 'easy-to-custom-content-4', '', '', '2023-10-31 22:07:05', '2023-10-31 15:07:05', '', 0, 'https://organico.themeftc.com//?p=2628', 0, 'post', '', 0),
(2631, 1, '2020-01-01 01:36:00', '2019-12-31 18:36:00', 'Vestibulum porta iaculis felis, eget tristique ante egestas quis. Sed non quis, convallis felis. Etiam id elit id elit dapibus blandit. Lorem Ipsum has been the industry\"s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \"Content here, content here\", making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \"lorem ipsum\" will uncover many web sites still in their infancy.', 'Interesting Facts About', 'Vestibulum porta iaculis felis, eget tristique ante egestas quis. Sed non quis, convallis felis. Etiam id elit id elit dapibus blandit.', 'publish', 'open', 'open', '', 'interesting-facts-about-5', '', '', '2023-10-31 22:06:58', '2023-10-31 15:06:58', '', 0, 'https://organico.themeftc.com//?p=2631', 0, 'post', '', 0),
(2633, 1, '2020-01-01 01:37:00', '2019-12-31 18:37:00', 'Suspendisse ac quam sed massa tincidunt blandit. Cras aliquam mi sit amet justo rutrum, at dignissim massa gravida. Donec eu libero aliquet, porttitor lacus elementum, sagittis dui. Pellentesque lacus lacus, efficitur ut rutrum vel, feugiat sit amet dui. Ut sed libero luctus, molestie augue et, vehicula odio. Phasellus feugiat risus mauris, in accumsan ipsum mollis vel. Nulla cursus dui ut ante volutpat, quis ultrices velit elementum. Vivamus ullamcorper velit a pretium finibus.\n\nNulla sed mi leo, sit amet molestie nulla. Phasellus lobortis blandit ipsum, at adipiscing eros porta quis. Phasellus in nisi ipsum, quis dapibus magna. Phasellus odio dolor, pretium sit amet aliquam a, gravida eget dui. Pellentesque eu ipsum et quam faucibus scelerisque vitae ut ligula. Ut luctus fermentum commodo. Mauris eget justo turpis, eget fringilla mi. Duis lobortis cursus mi vel tristique. Maecenas eu lorem hendrerit neque dapibus cursus id sit amet nisi. Proin rhoncus sem', 'Lorem Ipsum is simply', 'Vestibulum porta iaculis felis, eget tristique ante egestas quis. Sed non quis, convallis felis. Etiam id elit id elit dapibus blandit.', 'publish', 'open', 'open', '', 'lorem-ipsum-is-simply-5', '', '', '2023-10-31 22:06:51', '2023-10-31 15:06:51', '', 0, 'https://organico.themeftc.com//?p=2633', 0, 'post', '', 0),
(2634, 1, '2020-01-01 01:38:00', '2019-12-31 18:38:00', 'Suspendisse ac quam sed massa tincidunt blandit. Cras aliquam mi sit amet justo rutrum, at dignissim massa gravida. Donec eu libero aliquet, porttitor lacus elementum, sagittis dui. Pellentesque lacus lacus, efficitur ut rutrum vel, feugiat sit amet dui. Ut sed libero luctus, molestie augue et, vehicula odio. Phasellus feugiat risus mauris, in accumsan ipsum mollis vel. Nulla cursus dui ut ante volutpat, quis ultrices velit elementum. Vivamus ullamcorper velit a pretium finibus.\n\nNulla sed mi leo, sit amet molestie nulla. Phasellus lobortis blandit ipsum, at adipiscing eros porta quis. Phasellus in nisi ipsum, quis dapibus magna. Phasellus odio dolor, pretium sit amet aliquam a, gravida eget dui. Pellentesque eu ipsum et quam faucibus scelerisque vitae ut ligula. Ut luctus fermentum commodo. Mauris eget justo turpis, eget fringilla mi. Duis lobortis cursus mi vel tristique. Maecenas eu lorem hendrerit neque dapibus cursus id sit amet nisi. Proin rhoncus sem', 'Lorem Ipsum is simply', 'Vestibulum porta iaculis felis, eget tristique ante egestas quis. Sed non quis, convallis felis. Etiam id elit id elit dapibus blandit.', 'publish', 'open', 'open', '', 'lorem-ipsum-is-simply-6', '', '', '2023-10-31 22:06:44', '2023-10-31 15:06:44', '', 0, 'https://organico.themeftc.com//?p=2634', 0, 'post', '', 0),
(2638, 1, '2019-01-01 01:39:03', '2019-01-01 01:39:03', 'Suspendisse ac quam sed massa tincidunt blandit. Cras aliquam mi sit amet justo rutrum, at dignissim massa gravida. Donec eu libero aliquet, porttitor lacus elementum, sagittis dui. Pellentesque lacus lacus, efficitur ut rutrum vel, feugiat sit amet dui. Ut sed libero luctus, molestie augue et, vehicula odio. Phasellus feugiat risus mauris, in accumsan ipsum mollis vel. Nulla cursus dui ut ante volutpat, quis ultrices velit elementum. Vivamus ullamcorper velit a pretium finibus.', 'Easy to custom content', '', 'publish', 'open', 'open', '', 'easy-to-custom-content-5', '', '', '2023-10-19 16:19:29', '2023-10-19 16:19:29', '', 0, 'https://organico.themeftc.com//?p=2638', 0, 'post', '', 0),
(2640, 1, '2020-01-01 01:40:00', '2019-12-31 18:40:00', 'Vestibulum porta iaculis felis, eget tristique ante egestas quis. Sed non quis, convallis felis. Etiam id elit id elit dapibus blandit. Lorem Ipsum has been the industry\"s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \"Content here, content here\", making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \"lorem ipsum\" will uncover many web sites still in their infancy.', 'Interesting Facts About', 'Vestibulum porta iaculis felis, eget tristique ante egestas quis. Sed non quis, convallis felis. Etiam id elit id elit dapibus blandit.', 'publish', 'open', 'open', '', 'interesting-facts-about-6', '', '', '2023-10-31 22:06:37', '2023-10-31 15:06:37', '', 0, 'https://organico.themeftc.com//?p=2640', 0, 'post', '', 0),
(2641, 8, '2023-10-19 16:16:09', '2023-10-19 16:16:09', 'Vestibulum porta iaculis felis, eget tristique ante egestas quis. Sed non quis, convallis felis. Etiam id elit id elit dapibus blandit. Lorem Ipsum has been the industry\"s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \"Content here, content here\", making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \"lorem ipsum\" will uncover many web sites still in their infancy.', 'Interesting Facts About', '', 'inherit', 'closed', 'closed', '', '2640-revision-v1', '', '', '2023-10-19 16:16:09', '2023-10-19 16:16:09', '', 2640, 'http://localhost/quanlygiangday/?p=2641', 0, 'revision', '', 0),
(2642, 8, '2023-10-19 16:19:04', '2023-10-19 16:19:04', 'Suspendisse ac quam sed massa tincidunt blandit. Cras aliquam mi sit amet justo rutrum, at dignissim massa gravida. Donec eu libero aliquet, porttitor lacus elementum, sagittis dui. Pellentesque lacus lacus, efficitur ut rutrum vel, feugiat sit amet dui. Ut sed libero luctus, molestie augue et, vehicula odio. Phasellus feugiat risus mauris, in accumsan ipsum mollis vel. Nulla cursus dui ut ante volutpat, quis ultrices velit elementum. Vivamus ullamcorper velit a pretium finibus.\n\nNulla sed mi leo, sit amet molestie nulla. Phasellus lobortis blandit ipsum, at adipiscing eros porta quis. Phasellus in nisi ipsum, quis dapibus magna. Phasellus odio dolor, pretium sit amet aliquam a, gravida eget dui. Pellentesque eu ipsum et quam faucibus scelerisque vitae ut ligula. Ut luctus fermentum commodo. Mauris eget justo turpis, eget fringilla mi. Duis lobortis cursus mi vel tristique. Maecenas eu lorem hendrerit neque dapibus cursus id sit amet nisi. Proin rhoncus sem', 'Lorem Ipsum is simply', '', 'inherit', 'closed', 'closed', '', '2633-revision-v1', '', '', '2023-10-19 16:19:04', '2023-10-19 16:19:04', '', 2633, 'http://localhost/quanlygiangday/?p=2642', 0, 'revision', '', 0),
(2643, 8, '2023-10-19 16:19:09', '2023-10-19 16:19:09', 'Vestibulum porta iaculis felis, eget tristique ante egestas quis. Sed non quis, convallis felis. Etiam id elit id elit dapibus blandit. Lorem Ipsum has been the industry\"s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \"Content here, content here\", making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \"lorem ipsum\" will uncover many web sites still in their infancy.', 'Interesting Facts About', '', 'inherit', 'closed', 'closed', '', '2631-revision-v1', '', '', '2023-10-19 16:19:09', '2023-10-19 16:19:09', '', 2631, 'http://localhost/quanlygiangday/?p=2643', 0, 'revision', '', 0),
(2644, 8, '2023-10-19 16:19:13', '2023-10-19 16:19:13', 'Suspendisse ac quam sed massa tincidunt blandit. Cras aliquam mi sit amet justo rutrum, at dignissim massa gravida. Donec eu libero aliquet, porttitor lacus elementum, sagittis dui. Pellentesque lacus lacus, efficitur ut rutrum vel, feugiat sit amet dui. Ut sed libero luctus, molestie augue et, vehicula odio. Phasellus feugiat risus mauris, in accumsan ipsum mollis vel. Nulla cursus dui ut ante volutpat, quis ultrices velit elementum. Vivamus ullamcorper velit a pretium finibus.', 'Easy to custom content', '', 'inherit', 'closed', 'closed', '', '2628-revision-v1', '', '', '2023-10-19 16:19:13', '2023-10-19 16:19:13', '', 2628, 'http://localhost/quanlygiangday/?p=2644', 0, 'revision', '', 0),
(2645, 8, '2023-10-19 16:19:18', '2023-10-19 16:19:18', 'Suspendisse ac quam sed massa tincidunt blandit. Cras aliquam mi sit amet justo rutrum, at dignissim massa gravida. Donec eu libero aliquet, porttitor lacus elementum, sagittis dui. Pellentesque lacus lacus, efficitur ut rutrum vel, feugiat sit amet dui. Ut sed libero luctus, molestie augue et, vehicula odio. Phasellus feugiat risus mauris, in accumsan ipsum mollis vel. Nulla cursus dui ut ante volutpat, quis ultrices velit elementum. Vivamus ullamcorper velit a pretium finibus.\n\nNulla sed mi leo, sit amet molestie nulla. Phasellus lobortis blandit ipsum, at adipiscing eros porta quis. Phasellus in nisi ipsum, quis dapibus magna. Phasellus odio dolor, pretium sit amet aliquam a, gravida eget dui. Pellentesque eu ipsum et quam faucibus scelerisque vitae ut ligula. Ut luctus fermentum commodo. Mauris eget justo turpis, eget fringilla mi. Duis lobortis cursus mi vel tristique. Maecenas eu lorem hendrerit neque dapibus cursus id sit amet nisi. Proin rhoncus sem', 'Lorem Ipsum is simple', '', 'inherit', 'closed', 'closed', '', '2626-revision-v1', '', '', '2023-10-19 16:19:18', '2023-10-19 16:19:18', '', 2626, 'http://localhost/quanlygiangday/?p=2645', 0, 'revision', '', 0),
(2646, 8, '2023-10-19 16:19:21', '2023-10-19 16:19:21', 'Suspendisse ac quam sed massa tincidunt blandit. Cras aliquam mi sit amet justo rutrum, at dignissim massa gravida. Donec eu libero aliquet, porttitor lacus elementum, sagittis dui. Pellentesque lacus lacus, efficitur ut rutrum vel, feugiat sit amet dui. Ut sed libero luctus, molestie augue et, vehicula odio. Phasellus feugiat risus mauris, in accumsan ipsum mollis vel. Nulla cursus dui ut ante volutpat, quis ultrices velit elementum. Vivamus ullamcorper velit a pretium finibus.\n\nNulla sed mi leo, sit amet molestie nulla. Phasellus lobortis blandit ipsum, at adipiscing eros porta quis. Phasellus in nisi ipsum, quis dapibus magna. Phasellus odio dolor, pretium sit amet aliquam a, gravida eget dui. Pellentesque eu ipsum et quam faucibus scelerisque vitae ut ligula. Ut luctus fermentum commodo. Mauris eget justo turpis, eget fringilla mi. Duis lobortis cursus mi vel tristique. Maecenas eu lorem hendrerit neque dapibus cursus id sit amet nisi. Proin rhoncus sem', 'Lorem Ipsum is simply', '', 'inherit', 'closed', 'closed', '', '2624-revision-v1', '', '', '2023-10-19 16:19:21', '2023-10-19 16:19:21', '', 2624, 'http://localhost/quanlygiangday/?p=2646', 0, 'revision', '', 0),
(2647, 8, '2023-10-19 16:19:26', '2023-10-19 16:19:26', 'Vestibulum porta iaculis felis, eget tristique ante egestas quis. Sed non quis, convallis felis. Etiam id elit id elit dapibus blandit. Lorem Ipsum has been the industry\"s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \"Content here, content here\", making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \"lorem ipsum\" will uncover many web sites still in their infancy.', 'Interesting Facts About', '', 'inherit', 'closed', 'closed', '', '2617-revision-v1', '', '', '2023-10-19 16:19:26', '2023-10-19 16:19:26', '', 2617, 'http://localhost/quanlygiangday/?p=2647', 0, 'revision', '', 0),
(2648, 8, '2023-10-19 16:19:29', '2023-10-19 16:19:29', 'Suspendisse ac quam sed massa tincidunt blandit. Cras aliquam mi sit amet justo rutrum, at dignissim massa gravida. Donec eu libero aliquet, porttitor lacus elementum, sagittis dui. Pellentesque lacus lacus, efficitur ut rutrum vel, feugiat sit amet dui. Ut sed libero luctus, molestie augue et, vehicula odio. Phasellus feugiat risus mauris, in accumsan ipsum mollis vel. Nulla cursus dui ut ante volutpat, quis ultrices velit elementum. Vivamus ullamcorper velit a pretium finibus.', 'Easy to custom content', '', 'inherit', 'closed', 'closed', '', '2638-revision-v1', '', '', '2023-10-19 16:19:29', '2023-10-19 16:19:29', '', 2638, 'http://localhost/quanlygiangday/?p=2648', 0, 'revision', '', 0),
(2649, 8, '2023-10-19 16:19:57', '2023-10-19 16:19:57', 'Suspendisse ac quam sed massa tincidunt blandit. Cras aliquam mi sit amet justo rutrum, at dignissim massa gravida. Donec eu libero aliquet, porttitor lacus elementum, sagittis dui. Pellentesque lacus lacus, efficitur ut rutrum vel, feugiat sit amet dui. Ut sed libero luctus, molestie augue et, vehicula odio. Phasellus feugiat risus mauris, in accumsan ipsum mollis vel. Nulla cursus dui ut ante volutpat, quis ultrices velit elementum. Vivamus ullamcorper velit a pretium finibus.\n\nNulla sed mi leo, sit amet molestie nulla. Phasellus lobortis blandit ipsum, at adipiscing eros porta quis. Phasellus in nisi ipsum, quis dapibus magna. Phasellus odio dolor, pretium sit amet aliquam a, gravida eget dui. Pellentesque eu ipsum et quam faucibus scelerisque vitae ut ligula. Ut luctus fermentum commodo. Mauris eget justo turpis, eget fringilla mi. Duis lobortis cursus mi vel tristique. Maecenas eu lorem hendrerit neque dapibus cursus id sit amet nisi. Proin rhoncus sem', 'Lorem Ipsum is simply', '', 'inherit', 'closed', 'closed', '', '2634-revision-v1', '', '', '2023-10-19 16:19:57', '2023-10-19 16:19:57', '', 2634, 'http://localhost/quanlygiangday/?p=2649', 0, 'revision', '', 0),
(2652, 1, '2023-10-25 22:06:40', '2023-10-25 15:06:40', '', 'Giảng viên', '', 'publish', 'closed', 'closed', '', 'giang-vien', '', '', '2023-10-25 22:08:05', '2023-10-25 15:08:05', '', 0, 'http://localhost/quanlygiangday/?page_id=2652', 0, 'page', '', 0),
(2653, 1, '2023-10-25 22:06:40', '2023-10-25 15:06:40', '', 'Giảng viên', '', 'inherit', 'closed', 'closed', '', '2652-revision-v1', '', '', '2023-10-25 22:06:40', '2023-10-25 15:06:40', '', 2652, 'http://localhost/quanlygiangday/?p=2653', 0, 'revision', '', 0),
(2654, 8, '2023-10-28 23:54:49', '2023-10-28 16:54:49', '', '65581', '', 'inherit', 'open', 'closed', '', '65581', '', '', '2023-10-28 23:54:49', '2023-10-28 16:54:49', '', 0, 'http://localhost/quanlygiangday/wp-content/uploads/2023/10/65581.png', 0, 'attachment', 'image/png', 0),
(2655, 8, '2023-10-28 23:54:50', '2023-10-28 16:54:50', '', '219986', '', 'inherit', 'open', 'closed', '', '219986', '', '', '2023-10-28 23:54:50', '2023-10-28 16:54:50', '', 0, 'http://localhost/quanlygiangday/wp-content/uploads/2023/10/219986.png', 0, 'attachment', 'image/png', 0),
(2656, 8, '2023-10-28 23:54:50', '2023-10-28 16:54:50', '', 'User_icon-cp.svg', '', 'inherit', 'open', 'closed', '', 'user_icon-cp-svg', '', '', '2023-10-28 23:54:50', '2023-10-28 16:54:50', '', 0, 'http://localhost/quanlygiangday/wp-content/uploads/2023/10/User_icon-cp.svg_.png', 0, 'attachment', 'image/png', 0),
(2657, 8, '2023-10-28 23:55:16', '2023-10-28 16:55:16', '', 'images', '', 'inherit', 'open', 'closed', '', 'images', '', '', '2023-10-28 23:55:16', '2023-10-28 16:55:16', '', 0, 'http://localhost/quanlygiangday/wp-content/uploads/2023/10/images.png', 0, 'attachment', 'image/png', 0),
(2658, 1, '2023-10-29 14:01:50', '2023-10-29 07:01:50', '', 'Tin tức', '', 'publish', 'closed', 'closed', '', 'tin-tuc', '', '', '2023-10-29 14:01:50', '2023-10-29 07:01:50', '', 0, 'http://localhost/quanlygiangday/?page_id=2658', 0, 'page', '', 0),
(2659, 1, '2023-10-29 14:01:50', '2023-10-29 07:01:50', '', 'Tin tức', '', 'inherit', 'closed', 'closed', '', '2658-revision-v1', '', '', '2023-10-29 14:01:50', '2023-10-29 07:01:50', '', 2658, 'http://localhost/quanlygiangday/?p=2659', 0, 'revision', '', 0),
(2661, 1, '2023-10-29 16:15:28', '2023-10-29 09:15:28', '', 'Lich dạy', '', 'publish', 'closed', 'closed', '', 'lich-day', '', '', '2023-10-30 20:50:10', '2023-10-30 13:50:10', '', 0, 'http://localhost/quanlygiangday/?page_id=2661', 0, 'page', '', 0),
(2662, 1, '2023-10-29 16:15:28', '2023-10-29 09:15:28', '', 'Lich dạy', '', 'inherit', 'closed', 'closed', '', '2661-revision-v1', '', '', '2023-10-29 16:15:28', '2023-10-29 09:15:28', '', 2661, 'http://localhost/quanlygiangday/?p=2662', 0, 'revision', '', 0),
(2663, 1, '2023-10-30 19:14:24', '2023-10-29 09:16:49', ' ', '', '', 'publish', 'closed', 'closed', '', '2663', '', '', '2023-10-30 19:14:24', '2023-10-30 12:14:24', '', 0, 'http://localhost/quanlygiangday/?p=2663', 3, 'nav_menu_item', '', 0),
(2664, 1, '2023-10-30 19:14:24', '2023-10-29 09:16:49', ' ', '', '', 'publish', 'closed', 'closed', '', '2664', '', '', '2023-10-30 19:14:24', '2023-10-30 12:14:24', '', 0, 'http://localhost/quanlygiangday/?p=2664', 4, 'nav_menu_item', '', 0),
(2665, 1, '2023-10-30 19:14:24', '2023-10-29 09:16:49', ' ', '', '', 'publish', 'closed', 'closed', '', '2665', '', '', '2023-10-30 19:14:24', '2023-10-30 12:14:24', '', 0, 'http://localhost/quanlygiangday/?p=2665', 2, 'nav_menu_item', '', 0),
(2667, 1, '2023-10-30 19:14:05', '2023-10-30 12:14:05', '', 'Giới thiệu', '', 'publish', 'closed', 'closed', '', 'gioi-thieu', '', '', '2023-10-31 21:37:36', '2023-10-31 14:37:36', '', 0, 'http://localhost/quanlygiangday/?page_id=2667', 0, 'page', '', 0),
(2668, 1, '2023-10-30 19:14:05', '2023-10-30 12:14:05', '', 'Giới thiệu', '', 'inherit', 'closed', 'closed', '', '2667-revision-v1', '', '', '2023-10-30 19:14:05', '2023-10-30 12:14:05', '', 2667, 'http://localhost/quanlygiangday/?p=2668', 0, 'revision', '', 0),
(2669, 1, '2023-10-30 19:14:24', '2023-10-30 12:14:24', ' ', '', '', 'publish', 'closed', 'closed', '', '2669', '', '', '2023-10-30 19:14:24', '2023-10-30 12:14:24', '', 0, 'http://localhost/quanlygiangday/?p=2669', 1, 'nav_menu_item', '', 0),
(2670, 1, '2023-10-31 21:33:58', '2023-10-31 14:33:58', 'Vestibulum porta iaculis felis, eget tristique ante egestas quis. Sed non quis, convallis felis. Etiam id elit id elit dapibus blandit. Lorem Ipsum has been the industry\"s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \"Content here, content here\", making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \"lorem ipsum\" will uncover many web sites still in their infancy.', 'Interesting Facts About', 'Vestibulum porta iaculis felis, eget tristique ante egestas quis. Sed non quis, convallis felis. Etiam id elit id elit dapibus blandit.', 'inherit', 'closed', 'closed', '', '2640-revision-v1', '', '', '2023-10-31 21:33:58', '2023-10-31 14:33:58', '', 2640, 'http://localhost/quanlygiangday/?p=2670', 0, 'revision', '', 0),
(2671, 1, '2023-10-31 21:34:19', '2023-10-31 14:34:19', 'Suspendisse ac quam sed massa tincidunt blandit. Cras aliquam mi sit amet justo rutrum, at dignissim massa gravida. Donec eu libero aliquet, porttitor lacus elementum, sagittis dui. Pellentesque lacus lacus, efficitur ut rutrum vel, feugiat sit amet dui. Ut sed libero luctus, molestie augue et, vehicula odio. Phasellus feugiat risus mauris, in accumsan ipsum mollis vel. Nulla cursus dui ut ante volutpat, quis ultrices velit elementum. Vivamus ullamcorper velit a pretium finibus.\n\nNulla sed mi leo, sit amet molestie nulla. Phasellus lobortis blandit ipsum, at adipiscing eros porta quis. Phasellus in nisi ipsum, quis dapibus magna. Phasellus odio dolor, pretium sit amet aliquam a, gravida eget dui. Pellentesque eu ipsum et quam faucibus scelerisque vitae ut ligula. Ut luctus fermentum commodo. Mauris eget justo turpis, eget fringilla mi. Duis lobortis cursus mi vel tristique. Maecenas eu lorem hendrerit neque dapibus cursus id sit amet nisi. Proin rhoncus sem', 'Lorem Ipsum is simply', 'Vestibulum porta iaculis felis, eget tristique ante egestas quis. Sed non quis, convallis felis. Etiam id elit id elit dapibus blandit.', 'inherit', 'closed', 'closed', '', '2634-revision-v1', '', '', '2023-10-31 21:34:19', '2023-10-31 14:34:19', '', 2634, 'http://localhost/quanlygiangday/?p=2671', 0, 'revision', '', 0),
(2672, 1, '2023-10-31 22:05:21', '2023-10-31 15:05:21', '', '1693450343banner-thacsi-2023', '', 'inherit', 'open', 'closed', '', '1693450343banner-thacsi-2023', '', '', '2023-10-31 22:05:21', '2023-10-31 15:05:21', '', 2640, 'http://localhost/quanlygiangday/wp-content/uploads/2020/01/1693450343banner-thacsi-2023.png', 0, 'attachment', 'image/png', 0),
(2673, 1, '2023-10-31 22:05:22', '2023-10-31 15:05:22', '', '1686731522123', '', 'inherit', 'open', 'closed', '', '1686731522123', '', '', '2023-10-31 22:05:22', '2023-10-31 15:05:22', '', 2640, 'http://localhost/quanlygiangday/wp-content/uploads/2020/01/1686731522123.jpg', 0, 'attachment', 'image/jpeg', 0),
(2674, 1, '2023-10-31 22:06:31', '2023-10-31 15:06:31', '', '1693964604slide_chao_k74@72x', '', 'inherit', 'open', 'closed', '', '1693964604slide_chao_k7472x', '', '', '2023-10-31 22:06:31', '2023-10-31 15:06:31', '', 2640, 'http://localhost/quanlygiangday/wp-content/uploads/2020/01/1693964604slide_chao_k74@72x.webp', 0, 'attachment', 'image/webp', 0),
(2675, 1, '2023-10-31 22:06:31', '2023-10-31 15:06:31', '', '1696299970slide-cds-quoc-gia', '', 'inherit', 'open', 'closed', '', '1696299970slide-cds-quoc-gia', '', '', '2023-10-31 22:06:31', '2023-10-31 15:06:31', '', 2640, 'http://localhost/quanlygiangday/wp-content/uploads/2020/01/1696299970slide-cds-quoc-gia.webp', 0, 'attachment', 'image/webp', 0),
(2676, 1, '2023-10-31 22:06:32', '2023-10-31 15:06:32', '', '1698741194Banner-Website', '', 'inherit', 'open', 'closed', '', '1698741194banner-website', '', '', '2023-10-31 22:06:32', '2023-10-31 15:06:32', '', 2640, 'http://localhost/quanlygiangday/wp-content/uploads/2020/01/1698741194Banner-Website.webp', 0, 'attachment', 'image/webp', 0),
(2677, 1, '2023-10-31 22:06:51', '2023-10-31 15:06:51', 'Suspendisse ac quam sed massa tincidunt blandit. Cras aliquam mi sit amet justo rutrum, at dignissim massa gravida. Donec eu libero aliquet, porttitor lacus elementum, sagittis dui. Pellentesque lacus lacus, efficitur ut rutrum vel, feugiat sit amet dui. Ut sed libero luctus, molestie augue et, vehicula odio. Phasellus feugiat risus mauris, in accumsan ipsum mollis vel. Nulla cursus dui ut ante volutpat, quis ultrices velit elementum. Vivamus ullamcorper velit a pretium finibus.\n\nNulla sed mi leo, sit amet molestie nulla. Phasellus lobortis blandit ipsum, at adipiscing eros porta quis. Phasellus in nisi ipsum, quis dapibus magna. Phasellus odio dolor, pretium sit amet aliquam a, gravida eget dui. Pellentesque eu ipsum et quam faucibus scelerisque vitae ut ligula. Ut luctus fermentum commodo. Mauris eget justo turpis, eget fringilla mi. Duis lobortis cursus mi vel tristique. Maecenas eu lorem hendrerit neque dapibus cursus id sit amet nisi. Proin rhoncus sem', 'Lorem Ipsum is simply', 'Vestibulum porta iaculis felis, eget tristique ante egestas quis. Sed non quis, convallis felis. Etiam id elit id elit dapibus blandit.', 'inherit', 'closed', 'closed', '', '2633-revision-v1', '', '', '2023-10-31 22:06:51', '2023-10-31 15:06:51', '', 2633, 'http://localhost/quanlygiangday/?p=2677', 0, 'revision', '', 0),
(2678, 1, '2023-10-31 22:06:58', '2023-10-31 15:06:58', 'Vestibulum porta iaculis felis, eget tristique ante egestas quis. Sed non quis, convallis felis. Etiam id elit id elit dapibus blandit. Lorem Ipsum has been the industry\"s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \"Content here, content here\", making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \"lorem ipsum\" will uncover many web sites still in their infancy.', 'Interesting Facts About', 'Vestibulum porta iaculis felis, eget tristique ante egestas quis. Sed non quis, convallis felis. Etiam id elit id elit dapibus blandit.', 'inherit', 'closed', 'closed', '', '2631-revision-v1', '', '', '2023-10-31 22:06:58', '2023-10-31 15:06:58', '', 2631, 'http://localhost/quanlygiangday/?p=2678', 0, 'revision', '', 0),
(2679, 1, '2023-10-31 22:07:05', '2023-10-31 15:07:05', 'Suspendisse ac quam sed massa tincidunt blandit. Cras aliquam mi sit amet justo rutrum, at dignissim massa gravida. Donec eu libero aliquet, porttitor lacus elementum, sagittis dui. Pellentesque lacus lacus, efficitur ut rutrum vel, feugiat sit amet dui. Ut sed libero luctus, molestie augue et, vehicula odio. Phasellus feugiat risus mauris, in accumsan ipsum mollis vel. Nulla cursus dui ut ante volutpat, quis ultrices velit elementum. Vivamus ullamcorper velit a pretium finibus.', 'Easy to custom content', 'Vestibulum porta iaculis felis, eget tristique ante egestas quis. Sed non quis, convallis felis. Etiam id elit id elit dapibus blandit.', 'inherit', 'closed', 'closed', '', '2628-revision-v1', '', '', '2023-10-31 22:07:05', '2023-10-31 15:07:05', '', 2628, 'http://localhost/quanlygiangday/?p=2679', 0, 'revision', '', 0),
(2680, 1, '2023-10-31 22:12:46', '2023-10-31 15:12:46', '<!-- wp:paragraph -->\n<p>Ngày 26/10, Trường Đại học Công nghệ GTVT đã long trọng tổ chức Lễ trao bằng tốt nghiệp đợt tháng 10 năm 2023 cho các tân cử nhân và tân kỹ sư tại Hội trường lớn cơ sở đào tạo Hà Nội.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Tham dự Lễ tốt nghiệp về phía Nhà trường có PGS.TS. Nguyễn Hoàng Long- Hiệu trưởng Nhà trường; TS. Nguyễn Văn Lâm - Phó Hiệu trưởng; TS. Trần Hà Thanh - Phó Hiệu trưởng, cùng đại diện Lãnh đạo các Khoa, Phòng, Trung tâm, Viện trong Trường; các thầy giáo, cô giáo, quý phụ huynh và các sinh viên được công nhận tốt nghiệp.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/trao-bang-tot-nghiep-01.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>Toàn cảnh Lễ trao&nbsp;bằng tốt nghiệp cho sinh viên đợt tháng 10 năm 2023</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Tại buổi Lễ,&nbsp;TS. Ngô Quốc Trinh – Trường Phòng Đào tạo đã công bố quyết định công nhận tốt nghiệp và quyết định khen thưởng cho các sinh viên. Đây là đợt trao bằng tốt nghiệp lần thứ 5 trong năm 2023 cho các sinh viên.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Phát biểu tại buổi lễ, PGS.TS Nguyễn Hoàng Long - Hiệu trưởng Nhà trường gửi lời chúc mừng tốt đẹp đến các tân cử nhân, tân kỹ sư, sự kiện hôm nay chính là một cột mốc đánh dấu sự trưởng thành của tất cả các em. Trong những năm học vừa qua, các em đã cố gắng vượt qua mọi khó khăn, thử thách, luôn tâm huyết, say mê học tập và nghiên cứu. Thầy ghi nhận những nỗ lực đó và hy vọng rằng trong thời gian tới, dù ở vị trí công tác nào, các em vẫn tiếp tục học tập,&nbsp;vận dụng những kiến thức, kỹ năng&nbsp;đã được&nbsp;trang bị&nbsp;vào cuộc sống để trở thành những người có ích cho xã hội,&nbsp;làm rạng danh truyền thống vẻ vang của Trường Đại học Công nghệ GTVT.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/trao-bang-tot-nghiep-02.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>PGS.TS Nguyễn Hoàng Long - Hiệu trưởng Nhà trường chúc mừng các tân cử nhân, tân kỹ sư được công nhận tốt nghiệp.</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Đại diện cho các em sinh viên được công nhận tốt nghiệp đợt này,&nbsp;em Nguyễn Thị Trang, Lớp 70DCLG22, Khoa Kinh tế vận tải đã phát biểu cảm tưởng&nbsp;và tặng hoa tri ân Nhà trường.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/trao-bang-tot-nghiep-04.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>Sinh viên Nguyễn Thị Trang, Lớp 70DCLG22, Khoa Kinh tế vận tải phát biểu cảm tưởng...</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/trao-bang-tot-nghiep-05.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>...Và tặng hoa tri ân tập thể sư phạm&nbsp;Nhà trường</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>&nbsp;Thay mặt Tập thể lãnh đạo&nbsp;Nhà trường, TS. Nguyễn Văn Lâm – Phó Hiệu trưởng đã&nbsp;trao bằng tốt nghiệp và giấy khen của Hiệu trưởng&nbsp;cho các em sinh viên xếp loại xuất sắc, giỏi</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/trao-bang-tot-nghiep-07.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>TS. Nguyễn Văn Lâm – Phó Hiệu trưởng Nhà trường&nbsp;trao bằng tốt ghiệp và giấy khen của Hiệu trưởng&nbsp;cho các sinh viên xếp loại xuất sắc</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Tiếp đó, đại diện lãnh đạo các Khoa Cơ khí, Kinh tế vận tải và Khoa Công nghệ thông tin trực tiếp trao bằng tốt nghiệp cho các sinh viên được công nhận tốt nghiệp.&nbsp;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Một số hình ảnh tại buổi Lễ trao bằng Tốt nghiệp:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/trao-bang-tot-nghiep-09(1).jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>TS. Nguyễn Quang Anh- Trưởng khoa Cơ khí trao bằng tốt nghiệp cho các em sinh viên khoa Cơ khí</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/trao-bang-tot-nghiep-10.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>TS.&nbsp;Hoàng Thị Hồng Lê&nbsp;- Trưởng khoa Kinh tế vận tải trao bằng tốt nghiệp cho các em sinh viên Khoa Kinh tế vận tải</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/trao-bang-tot-nghiep-08(1).jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>TS. Lê Chí Luận - Phó trưởng khoa, Phụ trách khoa Công nghệ thông tin trao bằng tốt nghiệp cho các em sinh viên Khoa Công nghệ thông tin</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/trao-bang-tot-nghiep-03.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>Đông đảo Quý phụ huynh và các em sinh viên tham dự buổi Lễ.</em></p>\n<!-- /wp:paragraph -->', 'Trường ĐH Công nghệ GTVT tổ chức trao bằng tốt nghiệp cho sinh viên đợt tháng 10 năm 2023', 'Ngày 26/10, Trường Đại học Công nghệ GTVT đã long trọng tổ chức Lễ trao bằng tốt nghiệp đợt tháng 10 năm 2023 cho các tân cử nhân và tân', 'publish', 'open', 'open', '', 'truong-dh-cong-nghe-gtvt-to-chuc-trao-bang-tot-nghiep-cho-sinh-vien-dot-thang-10-nam-2023', '', '', '2023-10-31 22:14:06', '2023-10-31 15:14:06', '', 0, 'http://localhost/quanlygiangday/?p=2680', 0, 'post', '', 0),
(2681, 1, '2023-10-31 22:12:39', '2023-10-31 15:12:39', '', 'bbae629676df150682033a9c841b4e8b', '', 'inherit', 'open', 'closed', '', 'bbae629676df150682033a9c841b4e8b', '', '', '2023-10-31 22:12:39', '2023-10-31 15:12:39', '', 2680, 'http://localhost/quanlygiangday/wp-content/uploads/2023/10/bbae629676df150682033a9c841b4e8b.jpg', 0, 'attachment', 'image/jpeg', 0),
(2682, 1, '2023-10-31 22:12:46', '2023-10-31 15:12:46', '', 'Trường ĐH Công nghệ GTVT tổ chức trao bằng tốt nghiệp cho sinh viên đợt tháng 10 năm 2023', 'Ngày 26/10, Trường Đại học Công nghệ GTVT đã long trọng tổ chức Lễ trao bằng tốt nghiệp đợt tháng 10 năm 2023 cho các tân cử nhân và tân', 'inherit', 'closed', 'closed', '', '2680-revision-v1', '', '', '2023-10-31 22:12:46', '2023-10-31 15:12:46', '', 2680, 'http://localhost/quanlygiangday/?p=2682', 0, 'revision', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(2683, 1, '2023-10-31 22:14:06', '2023-10-31 15:14:06', '<!-- wp:paragraph -->\n<p>Ngày 26/10, Trường Đại học Công nghệ GTVT đã long trọng tổ chức Lễ trao bằng tốt nghiệp đợt tháng 10 năm 2023 cho các tân cử nhân và tân kỹ sư tại Hội trường lớn cơ sở đào tạo Hà Nội.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Tham dự Lễ tốt nghiệp về phía Nhà trường có PGS.TS. Nguyễn Hoàng Long- Hiệu trưởng Nhà trường; TS. Nguyễn Văn Lâm - Phó Hiệu trưởng; TS. Trần Hà Thanh - Phó Hiệu trưởng, cùng đại diện Lãnh đạo các Khoa, Phòng, Trung tâm, Viện trong Trường; các thầy giáo, cô giáo, quý phụ huynh và các sinh viên được công nhận tốt nghiệp.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/trao-bang-tot-nghiep-01.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>Toàn cảnh Lễ trao&nbsp;bằng tốt nghiệp cho sinh viên đợt tháng 10 năm 2023</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Tại buổi Lễ,&nbsp;TS. Ngô Quốc Trinh – Trường Phòng Đào tạo đã công bố quyết định công nhận tốt nghiệp và quyết định khen thưởng cho các sinh viên. Đây là đợt trao bằng tốt nghiệp lần thứ 5 trong năm 2023 cho các sinh viên.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Phát biểu tại buổi lễ, PGS.TS Nguyễn Hoàng Long - Hiệu trưởng Nhà trường gửi lời chúc mừng tốt đẹp đến các tân cử nhân, tân kỹ sư, sự kiện hôm nay chính là một cột mốc đánh dấu sự trưởng thành của tất cả các em. Trong những năm học vừa qua, các em đã cố gắng vượt qua mọi khó khăn, thử thách, luôn tâm huyết, say mê học tập và nghiên cứu. Thầy ghi nhận những nỗ lực đó và hy vọng rằng trong thời gian tới, dù ở vị trí công tác nào, các em vẫn tiếp tục học tập,&nbsp;vận dụng những kiến thức, kỹ năng&nbsp;đã được&nbsp;trang bị&nbsp;vào cuộc sống để trở thành những người có ích cho xã hội,&nbsp;làm rạng danh truyền thống vẻ vang của Trường Đại học Công nghệ GTVT.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/trao-bang-tot-nghiep-02.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>PGS.TS Nguyễn Hoàng Long - Hiệu trưởng Nhà trường chúc mừng các tân cử nhân, tân kỹ sư được công nhận tốt nghiệp.</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Đại diện cho các em sinh viên được công nhận tốt nghiệp đợt này,&nbsp;em Nguyễn Thị Trang, Lớp 70DCLG22, Khoa Kinh tế vận tải đã phát biểu cảm tưởng&nbsp;và tặng hoa tri ân Nhà trường.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/trao-bang-tot-nghiep-04.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>Sinh viên Nguyễn Thị Trang, Lớp 70DCLG22, Khoa Kinh tế vận tải phát biểu cảm tưởng...</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/trao-bang-tot-nghiep-05.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>...Và tặng hoa tri ân tập thể sư phạm&nbsp;Nhà trường</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>&nbsp;Thay mặt Tập thể lãnh đạo&nbsp;Nhà trường, TS. Nguyễn Văn Lâm – Phó Hiệu trưởng đã&nbsp;trao bằng tốt nghiệp và giấy khen của Hiệu trưởng&nbsp;cho các em sinh viên xếp loại xuất sắc, giỏi</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/trao-bang-tot-nghiep-07.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>TS. Nguyễn Văn Lâm – Phó Hiệu trưởng Nhà trường&nbsp;trao bằng tốt ghiệp và giấy khen của Hiệu trưởng&nbsp;cho các sinh viên xếp loại xuất sắc</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Tiếp đó, đại diện lãnh đạo các Khoa Cơ khí, Kinh tế vận tải và Khoa Công nghệ thông tin trực tiếp trao bằng tốt nghiệp cho các sinh viên được công nhận tốt nghiệp.&nbsp;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Một số hình ảnh tại buổi Lễ trao bằng Tốt nghiệp:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/trao-bang-tot-nghiep-09(1).jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>TS. Nguyễn Quang Anh- Trưởng khoa Cơ khí trao bằng tốt nghiệp cho các em sinh viên khoa Cơ khí</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/trao-bang-tot-nghiep-10.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>TS.&nbsp;Hoàng Thị Hồng Lê&nbsp;- Trưởng khoa Kinh tế vận tải trao bằng tốt nghiệp cho các em sinh viên Khoa Kinh tế vận tải</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/trao-bang-tot-nghiep-08(1).jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>TS. Lê Chí Luận - Phó trưởng khoa, Phụ trách khoa Công nghệ thông tin trao bằng tốt nghiệp cho các em sinh viên Khoa Công nghệ thông tin</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/trao-bang-tot-nghiep-03.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>Đông đảo Quý phụ huynh và các em sinh viên tham dự buổi Lễ.</em></p>\n<!-- /wp:paragraph -->', 'Trường ĐH Công nghệ GTVT tổ chức trao bằng tốt nghiệp cho sinh viên đợt tháng 10 năm 2023', 'Ngày 26/10, Trường Đại học Công nghệ GTVT đã long trọng tổ chức Lễ trao bằng tốt nghiệp đợt tháng 10 năm 2023 cho các tân cử nhân và tân', 'inherit', 'closed', 'closed', '', '2680-revision-v1', '', '', '2023-10-31 22:14:06', '2023-10-31 15:14:06', '', 2680, 'http://localhost/quanlygiangday/?p=2683', 0, 'revision', '', 0),
(2684, 1, '2023-10-31 22:44:47', '2023-10-31 15:44:47', '<!-- wp:paragraph -->\n<p>Từ ngày 8/10/2023 - 13/10/2023, đoàn công tác Trường Đại học Công nghệ GTVT do TS. Nguyễn Mạnh Hùng - Phó Hiệu trưởng Nhà trường làm trưởng đoàn đã có chuyến thăm và làm việc tại 2 thành phố Tokyo và Kanazawa, Nhật Bản nhằm thắt chặt mối quan hệ và mở rộng thêm các cơ hội hợp tác với đối tác của Nhà trường tại đất nước mặt trời mọc.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Tham gia chuyến công tác có TS. Nguyễn Mạnh Hùng – Phó Hiệu trưởng; TS. Trần Hà Thanh – Phó Hiệu trưởng, cùng đại diện lãnh đạo Khoa Cơ khí, Khoa Kinh tế vận tải, Phòng Tổ chức cán bộ, Phòng Hành chính - Quản trị của Trường Đại học Công nghệ GTVT.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Đây là chuyến đi nằm trong khuôn khổ hợp tác triển khai chương trình đào tạo định hướng thực tập tại Nhật Bản giữa UTT và các đối tác gồm Tập đoàn Nippon Express, Nghiệp đoàn Kanazawa, Công ty Mitomo.&nbsp;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/utt-tham-lam-viec-nhat-ban-2023-01.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>Đoàn công tác Trường ĐH Công nghệ GTVT thăm và làm việc với Công ty Mimoto</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Trong những năm gần đây, Trường Đại học Công nghệ GTVT đã đẩy mạnh hợp tác với các đơn vị trong và ngoài nước như Công ty cổ phần phát triển nhân lực và công nghệ thông tin (ITM), Nghiệp đoàn Kanazawa - Nhật Bản để triển khai chương trình đào tạo ngôn ngữ tiếng Nhật một cách chất lượng nhất, kết nối các sinh viên đến một môi trường thực tập phù hợp tại các doanh nghiệp, công ty ở Nhật Bản theo đúng ngành nghề đã được đào tạo tại Trường. Đồng thời hỗ trợ tích cực cho các bạn trong và sau quãng thời gian đi thực tập tại nước ngoài một các thuận lợi nhất, về chính sách pháp lý, môi trường sinh hoạt, học tập...</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Làm việc với cán bộ phụ trách trụ sở Tập đoàn Nippon Express và công ty Mimoto tại Nhật Bản, phía Nhà trường đề nghị với các đối tác cần tăng cường hơn nữa hoạt động tiếp nhận sinh viên của nhà trường sang thực tập. Đại diện phía đối tác đồng ý sẽ tiếp tục phối hợp với Nghiệp đoàn Kanazawa, công ty ITM đẩy mạnh công tác này trong thời gian tới.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Để hiểu rõ hơn về cuộc sống của các em sinh viên UTT đang thực tập tại Nhật Bản, Đoàn đã đến thăm nơi ở và tặng quà cho các em, đồng thời lắng nghe, chia sẻ những tâm tư, nguyện vọng của các em. Mặc dù cuộc sống xa quê hương còn nhiều khó khăn, nỗi nhớ gia đình, người thân bạn bè luôn canh cánh, nhưng được sự quan tâm sát sao của đại diện lãnh đạo các công ty Nhật Bản, các em đã yên tâm học tập và mong muốn sau khi kết thúc kỳ thực tập sẽ được ở lại làm việc tại nơi đây. Theo chương trình liên kết, trong thời gian thực tập tại các công ty Nhật Bản, sinh viên sẽ được hưởng lương theo quy định, sau khi tốt nghiệp nếu đạt kết quả tốt các em sẽ có cơ hội được ở lại làm việc hoặc trở về Việt Nam tùy vào nhu cầu của bản thân.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Đoàn tiếp tụcdi chuyển từ Kanazawa về lại Tokyo, sau đó đến thăm trụ sở chính của tập đoàn Nippon Express. Phía tập đoàn cũng bày tỏ thiện chí sẵn sàng hợp tác với nhà trường trong các hoạt động tiếp nhận sinh viên thực tập, giao lưu trao đổi thông tin về ngành logistics và sẽ kết hợp với nghiệp đoàn Kanazawa, Công ty Cổ phần phát triển nhân lực và công nghệ thông tin (ITM) để có thể nhân rộng mô hình đã triển khai thành công tại thành phố Kanazawa sang các thành phố khác mà tập đoàn có trụ sở.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Trong khuôn khổ chương trình, Đoàn công tác đã tới thăm trường Đại học Kinh tế vận tải do tập đoàn Nippon thành lập tại tỉnh Chiba bên cạnh thành phố Tokyo. Tại đây, Đoàn đã có buổi gặp gỡ và trò chuyện thân mật với Giám đốc trung tâm giao lưu quốc tế của Trường và được biết hiện tại có một lượng lớn sinh viên của Việt Nam đang theo học tại đây.&nbsp;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Đại diện Trường Đại học Kinh tế vận tải mong muốn và đề nghị&nbsp;tiếp tục dành nhiều thời gian trao đổi và làm việc với nhau hơn để có thể tiến tới ký Hiệp định hợp tác giữa hai bên. Ngoài việc hợp tác trong lĩnh vực nghiên cứu khoa học, xuất bản các công trình nghiên cứu, phía Đại học kinh tế vận tải còn đưa ra ý tưởng về việc xây dựng chương trình đào tạo 2+1+1 (2 năm học tại Việt Nam, 1 năm thực tập tại các trụ sở của Nippon Express, 1 năm học tại Nhật). Để tận dụng thời gian, vào các dịp nghỉ lễ dài ngày, dịp nghỉ hè có thể mời giáo viên từ đại học UTT sang giảng dạy tại trường bằng tiếng Việt cho các em sinh viên người Việt.&nbsp; &nbsp;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Bên cạnh đó, Đoàn đã đi tham quan Bảo tàng mô hình đường sắt, tới thăm công ty Mimoto và tham quan nhà máy sản xuất của công ty, tham quan các địa điểm nổi tiếng của Nhật Bản.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Sau 5 ngày hành trình tại đất nước Nhật Bản, chuyến thăm&nbsp;và làm việc của đoàn công tác UTT đã kết thúc thành công tốt đẹp, mở ra nhiều cơ hội hợp tác với các bên, đồng thời giúp các thành viên trong Đoàn học hỏi, tích lũy thêm được nhiều kinh nghiệm và kiến thức thực tiễn từ đất nước văn minh này.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Một số hình ảnh trong chuyến thăm&nbsp;và làm việc của Đoàn công tác Trường Đại học Công nghệ GTVT tại Nhật Bản:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/utt-tham-lam-viec-nhat-ban-2023-02.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>Đoàn công tác Trường ĐH Công nghệ GTVT thăm và làm việc với Tập đoàn Nippon Express</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/utt-tham-lam-viec-nhat-ban-2023-03.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/utt-tham-lam-viec-nhat-ban-2023-04.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>Đoàn thăm và làm việc với trường Đại học Rytsu Keizai</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/utt-tham-lam-viec-nhat-ban-2023-05.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>Đoàn thăm sinh viên&nbsp;UTT&nbsp;thực tập tại Nippon Express Kanazawa</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/utt-tham-lam-viec-nhat-ban-2023-06.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>Đoàn công tác&nbsp;làm việc với Lãnh đạo công ty&nbsp;Mimoto</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/utt-tham-lam-viec-nhat-ban-2023-07.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->', 'Đoàn công tác Trường Đại học Công nghệ GTVT thăm và làm việc tại Nhật Bản', 'Từ ngày 8/10/2023 - 13/10/2023, đoàn công tác Trường Đại học Công nghệ GTVT do TS. Nguyễn Mạnh Hùng - Phó Hiệu trưởng Nhà trường ', 'publish', 'open', 'open', '', 'doan-cong-tac-truong-dai-hoc-cong-nghe-gtvt-tham-va-lam-viec-tai-nhat-ban', '', '', '2023-10-31 22:44:47', '2023-10-31 15:44:47', '', 0, 'http://localhost/quanlygiangday/?p=2684', 0, 'post', '', 0),
(2685, 1, '2023-10-31 22:44:40', '2023-10-31 15:44:40', '', 'utt-tham-lam-viec-nhat-ban-2023-01', '', 'inherit', 'open', 'closed', '', 'utt-tham-lam-viec-nhat-ban-2023-01', '', '', '2023-10-31 22:44:40', '2023-10-31 15:44:40', '', 2684, 'http://localhost/quanlygiangday/wp-content/uploads/2023/10/utt-tham-lam-viec-nhat-ban-2023-01.jpg', 0, 'attachment', 'image/jpeg', 0),
(2686, 1, '2023-10-31 22:44:47', '2023-10-31 15:44:47', '<!-- wp:paragraph -->\n<p>Từ ngày 8/10/2023 - 13/10/2023, đoàn công tác Trường Đại học Công nghệ GTVT do TS. Nguyễn Mạnh Hùng - Phó Hiệu trưởng Nhà trường làm trưởng đoàn đã có chuyến thăm và làm việc tại 2 thành phố Tokyo và Kanazawa, Nhật Bản nhằm thắt chặt mối quan hệ và mở rộng thêm các cơ hội hợp tác với đối tác của Nhà trường tại đất nước mặt trời mọc.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Tham gia chuyến công tác có TS. Nguyễn Mạnh Hùng – Phó Hiệu trưởng; TS. Trần Hà Thanh – Phó Hiệu trưởng, cùng đại diện lãnh đạo Khoa Cơ khí, Khoa Kinh tế vận tải, Phòng Tổ chức cán bộ, Phòng Hành chính - Quản trị của Trường Đại học Công nghệ GTVT.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Đây là chuyến đi nằm trong khuôn khổ hợp tác triển khai chương trình đào tạo định hướng thực tập tại Nhật Bản giữa UTT và các đối tác gồm Tập đoàn Nippon Express, Nghiệp đoàn Kanazawa, Công ty Mitomo.&nbsp;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/utt-tham-lam-viec-nhat-ban-2023-01.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>Đoàn công tác Trường ĐH Công nghệ GTVT thăm và làm việc với Công ty Mimoto</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Trong những năm gần đây, Trường Đại học Công nghệ GTVT đã đẩy mạnh hợp tác với các đơn vị trong và ngoài nước như Công ty cổ phần phát triển nhân lực và công nghệ thông tin (ITM), Nghiệp đoàn Kanazawa - Nhật Bản để triển khai chương trình đào tạo ngôn ngữ tiếng Nhật một cách chất lượng nhất, kết nối các sinh viên đến một môi trường thực tập phù hợp tại các doanh nghiệp, công ty ở Nhật Bản theo đúng ngành nghề đã được đào tạo tại Trường. Đồng thời hỗ trợ tích cực cho các bạn trong và sau quãng thời gian đi thực tập tại nước ngoài một các thuận lợi nhất, về chính sách pháp lý, môi trường sinh hoạt, học tập...</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Làm việc với cán bộ phụ trách trụ sở Tập đoàn Nippon Express và công ty Mimoto tại Nhật Bản, phía Nhà trường đề nghị với các đối tác cần tăng cường hơn nữa hoạt động tiếp nhận sinh viên của nhà trường sang thực tập. Đại diện phía đối tác đồng ý sẽ tiếp tục phối hợp với Nghiệp đoàn Kanazawa, công ty ITM đẩy mạnh công tác này trong thời gian tới.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Để hiểu rõ hơn về cuộc sống của các em sinh viên UTT đang thực tập tại Nhật Bản, Đoàn đã đến thăm nơi ở và tặng quà cho các em, đồng thời lắng nghe, chia sẻ những tâm tư, nguyện vọng của các em. Mặc dù cuộc sống xa quê hương còn nhiều khó khăn, nỗi nhớ gia đình, người thân bạn bè luôn canh cánh, nhưng được sự quan tâm sát sao của đại diện lãnh đạo các công ty Nhật Bản, các em đã yên tâm học tập và mong muốn sau khi kết thúc kỳ thực tập sẽ được ở lại làm việc tại nơi đây. Theo chương trình liên kết, trong thời gian thực tập tại các công ty Nhật Bản, sinh viên sẽ được hưởng lương theo quy định, sau khi tốt nghiệp nếu đạt kết quả tốt các em sẽ có cơ hội được ở lại làm việc hoặc trở về Việt Nam tùy vào nhu cầu của bản thân.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Đoàn tiếp tụcdi chuyển từ Kanazawa về lại Tokyo, sau đó đến thăm trụ sở chính của tập đoàn Nippon Express. Phía tập đoàn cũng bày tỏ thiện chí sẵn sàng hợp tác với nhà trường trong các hoạt động tiếp nhận sinh viên thực tập, giao lưu trao đổi thông tin về ngành logistics và sẽ kết hợp với nghiệp đoàn Kanazawa, Công ty Cổ phần phát triển nhân lực và công nghệ thông tin (ITM) để có thể nhân rộng mô hình đã triển khai thành công tại thành phố Kanazawa sang các thành phố khác mà tập đoàn có trụ sở.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Trong khuôn khổ chương trình, Đoàn công tác đã tới thăm trường Đại học Kinh tế vận tải do tập đoàn Nippon thành lập tại tỉnh Chiba bên cạnh thành phố Tokyo. Tại đây, Đoàn đã có buổi gặp gỡ và trò chuyện thân mật với Giám đốc trung tâm giao lưu quốc tế của Trường và được biết hiện tại có một lượng lớn sinh viên của Việt Nam đang theo học tại đây.&nbsp;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Đại diện Trường Đại học Kinh tế vận tải mong muốn và đề nghị&nbsp;tiếp tục dành nhiều thời gian trao đổi và làm việc với nhau hơn để có thể tiến tới ký Hiệp định hợp tác giữa hai bên. Ngoài việc hợp tác trong lĩnh vực nghiên cứu khoa học, xuất bản các công trình nghiên cứu, phía Đại học kinh tế vận tải còn đưa ra ý tưởng về việc xây dựng chương trình đào tạo 2+1+1 (2 năm học tại Việt Nam, 1 năm thực tập tại các trụ sở của Nippon Express, 1 năm học tại Nhật). Để tận dụng thời gian, vào các dịp nghỉ lễ dài ngày, dịp nghỉ hè có thể mời giáo viên từ đại học UTT sang giảng dạy tại trường bằng tiếng Việt cho các em sinh viên người Việt.&nbsp; &nbsp;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Bên cạnh đó, Đoàn đã đi tham quan Bảo tàng mô hình đường sắt, tới thăm công ty Mimoto và tham quan nhà máy sản xuất của công ty, tham quan các địa điểm nổi tiếng của Nhật Bản.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Sau 5 ngày hành trình tại đất nước Nhật Bản, chuyến thăm&nbsp;và làm việc của đoàn công tác UTT đã kết thúc thành công tốt đẹp, mở ra nhiều cơ hội hợp tác với các bên, đồng thời giúp các thành viên trong Đoàn học hỏi, tích lũy thêm được nhiều kinh nghiệm và kiến thức thực tiễn từ đất nước văn minh này.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Một số hình ảnh trong chuyến thăm&nbsp;và làm việc của Đoàn công tác Trường Đại học Công nghệ GTVT tại Nhật Bản:</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/utt-tham-lam-viec-nhat-ban-2023-02.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>Đoàn công tác Trường ĐH Công nghệ GTVT thăm và làm việc với Tập đoàn Nippon Express</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/utt-tham-lam-viec-nhat-ban-2023-03.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/utt-tham-lam-viec-nhat-ban-2023-04.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>Đoàn thăm và làm việc với trường Đại học Rytsu Keizai</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/utt-tham-lam-viec-nhat-ban-2023-05.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>Đoàn thăm sinh viên&nbsp;UTT&nbsp;thực tập tại Nippon Express Kanazawa</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/utt-tham-lam-viec-nhat-ban-2023-06.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>Đoàn công tác&nbsp;làm việc với Lãnh đạo công ty&nbsp;Mimoto</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/utt-tham-lam-viec-nhat-ban-2023-07.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->', 'Đoàn công tác Trường Đại học Công nghệ GTVT thăm và làm việc tại Nhật Bản', 'Từ ngày 8/10/2023 - 13/10/2023, đoàn công tác Trường Đại học Công nghệ GTVT do TS. Nguyễn Mạnh Hùng - Phó Hiệu trưởng Nhà trường ', 'inherit', 'closed', 'closed', '', '2684-revision-v1', '', '', '2023-10-31 22:44:47', '2023-10-31 15:44:47', '', 2684, 'http://localhost/quanlygiangday/?p=2686', 0, 'revision', '', 0),
(2687, 1, '2023-10-31 22:57:48', '2023-10-31 15:57:48', '<!-- wp:paragraph -->\n<p>Ngày 10/10, Trường Đại học Công nghệ GTVT đã tổ chức Lễ trao học bổng khuyến học cho sinh viên vượt khó năm học 2023-2024 nhằm động viên, khích lệ các em phấn đấu vươn lên trong học tập.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Tham dự buổi Lễ, về phía Nhà trường có PGS. TS Nguyễn Hoàng Long- Hiệu trưởng; TS. Nguyễn Văn Lâm – Phó Hiệu trưởng cùng đại diện lãnh đạo các Khoa, Phòng, Trung tâm, Viện trong trường, các GVCN, cố vấn học tập và các em sinh viên được nhận học bổng khuyến học.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/hoc-bong-sv-vuot-kho-02.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>Toàn cảnh buổi Lễ trao học bổng&nbsp;khuyến học cho sinh viên vượt khó năm học 2023-2024</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Phát biểu tại buổi Lễ, PGS. TS Nguyễn Hoàng Long cho biết việc quan tâm chăm lo&nbsp;đến người học, đặc biệt là các sinh viên có hoàn cảnh khó khăn vươn lên trong học tập luôn được coi là nhiệm vụ trọng tâm trong cả năm học của Nhà trường. Trong những năm qua, Nhà trường dành&nbsp;hàng chục tỷ đồng để trao tặng học bổng khuyến khích học tập dành cho sinh viên có thành tích trong học&nbsp;tập;&nbsp;học bổng khuyến học, khuyến tài dành cho&nbsp;sinh viên có hoàn cảnh gia đình đặc biệt khó khăn, sinh viên không may bị ốm đau, bệnh tật&nbsp;để kịp thời chia sẻ, động viên, giúp các em vơi bớt đi những khó khăn của cuộc sống, hỗ trợ tiền học tập, sinh hoạt hàng ngày để các em&nbsp;yên tâm học tập. Nhà trường mong các em hãy yên tâm, quyết tâm học tập bởi bên cạnh các em luôn có sự đồng hành của Nhà trường, sự giúp đỡ tận tâm của các thầy cô giáo, sự ủng hộ nhiệt tình của bạn bè.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/hoc-bong-sv-vuot-kho-09.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>PGS.TS Nguyễn Hoàng Long – Hiệu trưởng Nhà trường phát biểu tại buổi Lễ</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Tại buổi Lễ, TS. Ngô Quốc Trinh- Trưởng Phòng Đào tạo đã công bố các quyết định trao học bổng khuyến học cho các&nbsp;sinh viên vượt khó vươn lên trong học tập năm học 2023-2024, trong đó có 3 suất học bổng mỗi suất 70 triệu đồng cho 3 sinh viên có hoàn cảnh đặc biệt khó khăn; 02 suất học bổng mỗi suất 50 triệu đồng, 06 suất học bổng dành cho sinh viên khuyết tật và 80 suất học bổng dành cho các sinh viên có hoàn cảnh khó khăn, tổng giá trị trao học bổng đợt này là 748 triệu. Như vậy cùng với 200 triệu đồng trao đợt lần thứ nhất,&nbsp;năm nay gần 1 tỷ đồng đã được Nhà trường trao tặng đến các sinh viên vượt khó vươn lên trong học tập.&nbsp;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/hoc-bong-sv-vuot-kho-11.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>PGS. TS Nguyễn Hoàng Long -&nbsp;Hiệu trưởng Nhà trường trao học bổng cho 03 sinh viên có hoàn cảnh đặc biệt khó khăn&nbsp;</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/hoc-bong-sv-vuot-kho-10.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>PGS. TS Nguyễn Hoàng Long -&nbsp;Hiệu trưởng Nhà trường trao học bổng cho các sinh viên khuyết tật và có hoàn cảnh khó khăn</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/hoc-bong-sv-vuot-kho-12.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>TS. Nguyễn Văn Lâm- Phó Hiệu trưởng trao học bổng khuyến học cho 02 sinh viên có hoàn cảnh đặc biệt&nbsp;khó khăn</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/hoc-bong-sv-vuot-kho-06.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>TS. Nguyễn Văn Lâm- Phó Hiệu trưởng trao học bổng khuyến học cho các sinh viên&nbsp;có hoàn cảnh khó khăn</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/hoc-bong-sv-vuot-kho-07.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Sinh viên Nguyễn Thanh Huyền lớp 74DCLG21, sinh viên có hoàn cảnh đặc biệt khó khăn được nhận học bổng 70 triệu đồng&nbsp;đã&nbsp;đại diện cho các sinh viên nhận học bổng đợt này&nbsp;phát biểu&nbsp;cảm ơn Nhà trường và các thầy cô giáo đã luôn quan tâm, giúp đỡ và trao tặng phần học bổng hết sức có ý nghĩa này. Sinh viên Nguyễn Thanh Huyền hứa cố gắng phấn đấu đạt kết quả cao nhất trong học tập, rèn luyện để trở thành sinh viên 5 tốt của&nbsp;Trường Đại học Công nghệ GTVT, xứng đáng với niềm tin yêu của các thầy cô giáo và bạn bè.&nbsp;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/hoc-bong-sv-vuot-kho-08.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>Các thầy cô giáo&nbsp;chụp hình lưu niệm với các em sinh viên được nhận học bổng tại buổi Lễ</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Chương trình khép lại với nhiều thông điệp về sự chia sẻ, cảm thông và tình yêu thương con người. Mỗi em đến từ một địa phương&nbsp;khác nhau, có&nbsp;một hoàn cảnh khác nhau nhưng đều có chung khát vọng vươn lên trong học tập. Đây là chương trình rất ý nghĩa và mang tính nhân văn mà các thầy cô giáo Trường Đại học Công nghệ GTVT gửi đến&nbsp;các em. Chúc các em tiếp tục vững bước trên con đường&nbsp;hiện thực hóa&nbsp;ước mơ chinh phục tri thức&nbsp;của mình.</p>\n<!-- /wp:paragraph -->', 'Trường ĐH Công nghệ GTVT trao tặng học bổng khuyến học gần 1 tỷ đồng cho sinh viên vượt khó năm học 2023-2024', 'Ngày 10/10, Trường Đại học Công nghệ GTVT đã tổ chức Lễ trao học bổng khuyến học cho sinh viên vượt khó năm học 2023-2024', 'publish', 'open', 'open', '', 'truong-dh-cong-nghe-gtvt-trao-tang-hoc-bong-khuyen-hoc-gan-1-ty-dong-cho-sinh-vien-vuot-kho-nam-hoc-2023-2024', '', '', '2023-11-01 21:12:58', '2023-11-01 14:12:58', '', 0, 'http://localhost/quanlygiangday/?p=2687', 0, 'post', '', 0),
(2688, 1, '2023-10-31 22:57:45', '2023-10-31 15:57:45', '', 'hoc-bong-sv-vuot-kho-02', '', 'inherit', 'open', 'closed', '', 'hoc-bong-sv-vuot-kho-02', '', '', '2023-10-31 22:57:45', '2023-10-31 15:57:45', '', 2687, 'http://localhost/quanlygiangday/wp-content/uploads/2023/10/hoc-bong-sv-vuot-kho-02.jpg', 0, 'attachment', 'image/jpeg', 0),
(2689, 1, '2023-10-31 22:57:48', '2023-10-31 15:57:48', '<!-- wp:paragraph -->\n<p>Ngày 10/10, Trường Đại học Công nghệ GTVT đã tổ chức Lễ trao học bổng khuyến học cho sinh viên vượt khó năm học 2023-2024 nhằm động viên, khích lệ các em phấn đấu vươn lên trong học tập.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Tham dự buổi Lễ, về phía Nhà trường có PGS. TS Nguyễn Hoàng Long- Hiệu trưởng; TS. Nguyễn Văn Lâm – Phó Hiệu trưởng cùng đại diện lãnh đạo các Khoa, Phòng, Trung tâm, Viện trong trường, các GVCN, cố vấn học tập và các em sinh viên được nhận học bổng khuyến học.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/hoc-bong-sv-vuot-kho-02.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>Toàn cảnh buổi Lễ trao học bổng&nbsp;khuyến học cho sinh viên vượt khó năm học 2023-2024</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Phát biểu tại buổi Lễ, PGS. TS Nguyễn Hoàng Long cho biết việc quan tâm chăm lo&nbsp;đến người học, đặc biệt là các sinh viên có hoàn cảnh khó khăn vươn lên trong học tập luôn được coi là nhiệm vụ trọng tâm trong cả năm học của Nhà trường. Trong những năm qua, Nhà trường dành&nbsp;hàng chục tỷ đồng để trao tặng học bổng khuyến khích học tập dành cho sinh viên có thành tích trong học&nbsp;tập;&nbsp;học bổng khuyến học, khuyến tài dành cho&nbsp;sinh viên có hoàn cảnh gia đình đặc biệt khó khăn, sinh viên không may bị ốm đau, bệnh tật&nbsp;để kịp thời chia sẻ, động viên, giúp các em vơi bớt đi những khó khăn của cuộc sống, hỗ trợ tiền học tập, sinh hoạt hàng ngày để các em&nbsp;yên tâm học tập. Nhà trường mong các em hãy yên tâm, quyết tâm học tập bởi bên cạnh các em luôn có sự đồng hành của Nhà trường, sự giúp đỡ tận tâm của các thầy cô giáo, sự ủng hộ nhiệt tình của bạn bè.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/hoc-bong-sv-vuot-kho-09.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>PGS.TS Nguyễn Hoàng Long – Hiệu trưởng Nhà trường phát biểu tại buổi Lễ</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Tại buổi Lễ, TS. Ngô Quốc Trinh- Trưởng Phòng Đào tạo đã công bố các quyết định trao học bổng khuyến học cho các&nbsp;sinh viên vượt khó vươn lên trong học tập năm học 2023-2024, trong đó có 3 suất học bổng mỗi suất 70 triệu đồng cho 3 sinh viên có hoàn cảnh đặc biệt khó khăn; 02 suất học bổng mỗi suất 50 triệu đồng, 06 suất học bổng dành cho sinh viên khuyết tật và 80 suất học bổng dành cho các sinh viên có hoàn cảnh khó khăn, tổng giá trị trao học bổng đợt này là 748 triệu. Như vậy cùng với 200 triệu đồng trao đợt lần thứ nhất,&nbsp;năm nay gần 1 tỷ đồng đã được Nhà trường trao tặng đến các sinh viên vượt khó vươn lên trong học tập.&nbsp;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/hoc-bong-sv-vuot-kho-11.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>PGS. TS Nguyễn Hoàng Long -&nbsp;Hiệu trưởng Nhà trường trao học bổng cho 03 sinh viên có hoàn cảnh đặc biệt khó khăn&nbsp;</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/hoc-bong-sv-vuot-kho-10.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>PGS. TS Nguyễn Hoàng Long -&nbsp;Hiệu trưởng Nhà trường trao học bổng cho các sinh viên khuyết tật và có hoàn cảnh khó khăn</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/hoc-bong-sv-vuot-kho-12.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>TS. Nguyễn Văn Lâm- Phó Hiệu trưởng trao học bổng khuyến học cho 02 sinh viên có hoàn cảnh đặc biệt&nbsp;khó khăn</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/hoc-bong-sv-vuot-kho-06.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>TS. Nguyễn Văn Lâm- Phó Hiệu trưởng trao học bổng khuyến học cho các sinh viên&nbsp;có hoàn cảnh khó khăn</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/hoc-bong-sv-vuot-kho-07.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Sinh viên Nguyễn Thanh Huyền lớp 74DCLG21, sinh viên có hoàn cảnh đặc biệt khó khăn được nhận học bổng 70 triệu đồng&nbsp;đã&nbsp;đại diện cho các sinh viên nhận học bổng đợt này&nbsp;phát biểu&nbsp;cảm ơn Nhà trường và các thầy cô giáo đã luôn quan tâm, giúp đỡ và trao tặng phần học bổng hết sức có ý nghĩa này. Sinh viên Nguyễn Thanh Huyền hứa cố gắng phấn đấu đạt kết quả cao nhất trong học tập, rèn luyện để trở thành sinh viên 5 tốt của&nbsp;Trường Đại học Công nghệ GTVT, xứng đáng với niềm tin yêu của các thầy cô giáo và bạn bè.&nbsp;</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image -->\n<figure class=\"wp-block-image\"><img src=\"https://utt.edu.vn/uploads/file-manager/images/hoc-bong-sv-vuot-kho-08.jpg\" alt=\"\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p><em>Các thầy cô giáo&nbsp;chụp hình lưu niệm với các em sinh viên được nhận học bổng tại buổi Lễ</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Chương trình khép lại với nhiều thông điệp về sự chia sẻ, cảm thông và tình yêu thương con người. Mỗi em đến từ một địa phương&nbsp;khác nhau, có&nbsp;một hoàn cảnh khác nhau nhưng đều có chung khát vọng vươn lên trong học tập. Đây là chương trình rất ý nghĩa và mang tính nhân văn mà các thầy cô giáo Trường Đại học Công nghệ GTVT gửi đến&nbsp;các em. Chúc các em tiếp tục vững bước trên con đường&nbsp;hiện thực hóa&nbsp;ước mơ chinh phục tri thức&nbsp;của mình.</p>\n<!-- /wp:paragraph -->', 'Trường ĐH Công nghệ GTVT trao tặng học bổng khuyến học gần 1 tỷ đồng cho sinh viên vượt khó năm học 2023-2024', 'Ngày 10/10, Trường Đại học Công nghệ GTVT đã tổ chức Lễ trao học bổng khuyến học cho sinh viên vượt khó năm học 2023-2024', 'inherit', 'closed', 'closed', '', '2687-revision-v1', '', '', '2023-10-31 22:57:48', '2023-10-31 15:57:48', '', 2687, 'http://localhost/quanlygiangday/?p=2689', 0, 'revision', '', 0),
(2690, 1, '2023-11-01 20:36:15', '2023-11-01 13:36:15', '', 'logo-utt-border', '', 'inherit', 'open', 'closed', '', 'logo-utt-border', '', '', '2023-11-01 20:36:15', '2023-11-01 13:36:15', '', 0, 'http://localhost/quanlygiangday/wp-content/uploads/2023/11/logo-utt-border.png', 0, 'attachment', 'image/png', 0),
(2692, 1, '2023-11-01 20:40:58', '2023-11-01 13:40:58', '', 'logo', '', 'inherit', 'open', 'closed', '', 'logo', '', '', '2023-11-01 20:40:58', '2023-11-01 13:40:58', '', 0, 'http://localhost/quanlygiangday/wp-content/uploads/2023/11/logo.png', 0, 'attachment', 'image/png', 0),
(2695, 1, '2023-11-01 20:59:18', '2023-11-01 13:59:18', '', '1447346747LOGO_GTVT', '', 'inherit', 'open', 'closed', '', '1447346747logo_gtvt', '', '', '2023-11-01 20:59:18', '2023-11-01 13:59:18', '', 0, 'http://localhost/quanlygiangday/wp-content/uploads/2023/11/1447346747LOGO_GTVT.png', 0, 'attachment', 'image/png', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_supsystic_tbl_columns`
--

CREATE TABLE `wp_supsystic_tbl_columns` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_id` int(10) UNSIGNED DEFAULT NULL,
  `index` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_supsystic_tbl_conditions`
--

CREATE TABLE `wp_supsystic_tbl_conditions` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_id` int(10) UNSIGNED DEFAULT NULL,
  `data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_supsystic_tbl_diagrams`
--

CREATE TABLE `wp_supsystic_tbl_diagrams` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_id` int(10) UNSIGNED DEFAULT NULL,
  `start_row` int(10) UNSIGNED DEFAULT NULL,
  `start_col` int(10) UNSIGNED DEFAULT NULL,
  `end_row` int(10) UNSIGNED DEFAULT NULL,
  `end_col` int(10) UNSIGNED DEFAULT NULL,
  `data` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_supsystic_tbl_rows`
--

CREATE TABLE `wp_supsystic_tbl_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_id` int(10) UNSIGNED DEFAULT NULL,
  `data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_supsystic_tbl_rows_history`
--

CREATE TABLE `wp_supsystic_tbl_rows_history` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `table_id` int(11) UNSIGNED NOT NULL,
  `data` mediumtext NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_supsystic_tbl_tables`
--

CREATE TABLE `wp_supsystic_tbl_tables` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `meta` text DEFAULT NULL,
  `settings` text NOT NULL,
  `history_settings` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_teacher`
--

CREATE TABLE `wp_teacher` (
  `id` int(11) NOT NULL,
  `teacher_id` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `ma_to_mon` int(11) DEFAULT NULL,
  `tieu_su` varchar(5000) DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Đang đổ dữ liệu cho bảng `wp_teacher`
--

INSERT INTO `wp_teacher` (`id`, `teacher_id`, `full_name`, `email`, `date_of_birth`, `sex`, `address`, `phone`, `position`, `image`, `ma_to_mon`, `tieu_su`, `created_time`) VALUES
(35, '100', 'Trần Đình Mạnh', 'trandinhmanh@gmail.com', '1980-01-15 00:00:00', 'Nam', '54 Triều Khúc', '555-123-4567', 'GVBM', 'http://localhost/quanlygiangday/wp-content/uploads/2023/10/images.png', 1, '<p>Qu&aacute; tr&igrave;nh học tập v&agrave; l&agrave;m việc tại ĐH CNGTVT H&agrave; Nội</p>', '2023-10-11 15:59:31'),
(36, '100', 'Cao Xuân Hoàng', 'caoxuanhoang@gmail.com', '1980-01-15 00:00:00', 'Nam', '54 Triều Khúc', '555-123-4567', 'GVBM', 'http://localhost/quanlygiangday/wp-content/uploads/2023/10/User_icon-cp.svg_.png', 1, '<p>Qu&aacute; tr&igrave;nh giảng dạy tại DHCNGTVT H&agrave; Nội</p>\n<div>\n<h2>What is Lorem Ipsum?</h2>\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\\\\\\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n</div>\n<div>\n<h2>Why do we use it?</h2>\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \\\\\\\'Content here, content here\\\\\\\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \\\\\\\'lorem ipsum\\\\\\\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\n</div>\n<p>&nbsp;</p>\n<div>\n<h2>Where does it come from?</h2>\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \\\\\\\"de Finibus Bonorum et Malorum\\\\\\\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \\\\\\\"Lorem ipsum dolor sit amet..\\\\\\\", comes from a line in section 1.10.32.</p>\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \\\\\\\"de Finibus Bonorum et Malorum\\\\\\\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham</p>\n</div>', '2023-10-11 15:59:32'),
(37, '100', 'Phạm Đức Anh', 'phamducanh@gmail.com', '1987-09-09 00:00:00', 'Nam', '54 Triều Khúc', '8423-456-235', 'GVBM', 'http://localhost/quanlygiangday/wp-content/uploads/2023/10/images.png', 1, '<p>Qu&aacute; tr&igrave;nh giảng dạy tại DHCNGTVT H&agrave; Nội</p>', '2023-10-11 17:14:37'),
(59, '100', 'Trần Duy Dũng', 'tranduydung@gmail.com', '1986-07-15 00:00:00', 'Nam', '54 Triều Khúc', '8456-566-472', 'GVBM', 'http://localhost/quanlygiangday/wp-content/uploads/2023/10/images.png', 1, '<p>Qu&aacute; tr&igrave;nh giảng dạy tại DHCNGTVT H&agrave; Nội</p>', '2023-10-28 17:03:48'),
(60, '100', 'Đoàn Thị Thanh Hằng', 'thanhhangdoan@gmail.com', '1980-10-05 00:00:00', 'Nữ', '54 Triều Khúc', '8476-462-003', 'GVBM', 'http://localhost/quanlygiangday/wp-content/uploads/2023/10/65581.png', 1, '<p>Qu&aacute; tr&igrave;nh giảng dạy tại DHCNGTVT H&agrave; Nội</p>', '2023-10-28 17:16:24'),
(61, '100', 'Vũ Thị Thu Hà', 'thuhavu@gmail.com', '1978-04-05 00:00:00', 'Nữ', '54 Triều Khúc', '8469458459', 'GVBM', 'http://localhost/quanlygiangday/wp-content/uploads/2023/10/65581.png', 5, '<p>Qu&aacute; tr&igrave;nh giảng dạy tại DHCNGTVT H&agrave; Nội</p>', '2023-10-28 17:18:56'),
(62, '100', 'Lê Chí Luận', 'lechiluan@gmaul.com', '1977-05-15 00:00:00', 'Nam', '54 Triều Khúc', '8425468117', 'GVBM', 'http://localhost/quanlygiangday/wp-content/uploads/2023/10/images.png', 1, '<p>L&agrave;m việc v&agrave; giảng dạy tại DHCNGTVT H&agrave; Nội</p>', '2023-10-29 09:36:21'),
(63, '100', 'Lê Thị Chi', 'lechi@gmail.com', '1986-12-15 00:00:00', 'Nữ', '54 Triều Khúc', '0863598467', 'GVBM', 'http://localhost/quanlygiangday/wp-content/uploads/2023/10/65581.png', 1, '<p>L&agrave;m việc v&agrave; giảng dạy tại DHCNGTVT H&agrave; Nội</p>', '2023-10-29 09:40:18'),
(64, '3313234', 'Đỗ Tuấn Hải', 'abc@gmail.com', '1987-11-02 22:34:58', 'Nam', 'Nam Định', '0985475547', 'GVBM', NULL, 1, NULL, '2023-11-01 15:36:24'),
(65, '100', 'Tạ Văn Dân', 'tavandan0901998@gmail.com', '1998-09-09 00:00:00', 'Nam', '54 Triều khúc', '0837404222', 'GVBM', 'http://localhost/quanlygiangday/wp-content/uploads/2023/10/images.png', 2, '<p>Qu&aacute; tr&igrave;nh l&agrave;m việc v&agrave; giảng dạy tại Trường C&ocirc;ng nghệ Giao th&ocirc;ng vận tải H&agrave; Nội từ năm 2019 đến nay.</p>', '2023-11-02 13:49:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'Cosmetic', 'cosmetic', 0),
(3, 'Menu main', 'menu-main', 0),
(4, 'Giới thiệu', 'gioi-thieu', 0),
(5, 'news', 'news', 0),
(6, 'Bài giảng', 'bai-giang', 0),
(7, 'Nổi bật', 'noi-bat', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(2617, 2, 0),
(2624, 2, 0),
(2626, 2, 0),
(2628, 2, 0),
(2628, 4, 0),
(2631, 2, 0),
(2631, 4, 0),
(2633, 2, 0),
(2633, 4, 0),
(2634, 2, 0),
(2634, 4, 0),
(2638, 2, 0),
(2640, 2, 0),
(2640, 4, 0),
(2663, 3, 0),
(2664, 3, 0),
(2665, 3, 0),
(2669, 3, 0),
(2680, 5, 0),
(2684, 5, 0),
(2687, 5, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'category', '', 0, 9),
(3, 3, 'nav_menu', '', 0, 4),
(4, 4, 'category', '', 0, 5),
(5, 5, 'category', '', 0, 3),
(6, 6, 'category', '', 0, 0),
(7, 7, 'category', '', 6, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_to_mon`
--

CREATE TABLE `wp_to_mon` (
  `id` int(11) NOT NULL,
  `ten_to_mon` varchar(255) DEFAULT NULL,
  `so_giang_vien` varchar(255) DEFAULT NULL,
  `ma_khoa` varchar(255) DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Đang đổ dữ liệu cho bảng `wp_to_mon`
--

INSERT INTO `wp_to_mon` (`id`, `ten_to_mon`, `so_giang_vien`, `ma_khoa`, `created_time`) VALUES
(1, 'Tổ Công nghệ thông tin', '10', 'CNTT', '2023-10-11 15:59:21'),
(2, 'Tổ Hệ thống thông tin', '30', 'CNTT', '2023-10-28 07:31:20'),
(3, 'Tổ Truyền thông và mạng máy tính', '25', 'CNTT', '2023-10-28 07:31:41'),
(4, 'Tổ Điện tử - Viễn thông', '18', 'CNTT', '2023-10-28 07:32:04'),
(5, 'Tổ Cơ điện tử', '22', 'CNTT', '2023-10-28 07:32:25'),
(6, 'Văn phòng Khoa CNTT', '8', 'CNTT', '2023-10-28 07:32:43');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'plugin_editor_notice'),
(15, 1, 'show_welcome_panel', '0'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '4'),
(18, 1, 'wp_user-settings', 'mfold=o&libraryContent=browse'),
(19, 1, 'wp_user-settings-time', '1697975120'),
(21, 1, 'wp_persisted_preferences', 'a:3:{s:14:\"core/edit-post\";a:3:{s:26:\"isComplementaryAreaVisible\";b:0;s:12:\"welcomeGuide\";b:0;s:10:\"openPanels\";a:4:{i:0;s:11:\"post-status\";i:1;s:14:\"featured-image\";i:2;s:12:\"post-excerpt\";i:3;s:23:\"taxonomy-panel-category\";}}s:9:\"_modified\";s:24:\"2023-11-07T12:27:04.107Z\";s:17:\"core/edit-widgets\";a:2:{s:26:\"isComplementaryAreaVisible\";b:1;s:12:\"welcomeGuide\";b:0;}}'),
(37, 3, 'nickname', 'admin123'),
(38, 3, 'first_name', ''),
(39, 3, 'last_name', ''),
(40, 3, 'description', ''),
(41, 3, 'rich_editing', 'true'),
(42, 3, 'syntax_highlighting', 'true'),
(43, 3, 'comment_shortcuts', 'false'),
(44, 3, 'admin_color', 'fresh'),
(45, 3, 'use_ssl', '0'),
(46, 3, 'show_admin_bar_front', 'true'),
(47, 3, 'locale', ''),
(48, 3, 'wp_capabilities', 'a:1:{s:10:\"subscriber\";b:1;}'),
(49, 3, 'wp_user_level', '0'),
(50, 3, 'dismissed_wp_pointers', ''),
(52, 4, 'nickname', 'admin4'),
(53, 4, 'first_name', ''),
(54, 4, 'last_name', ''),
(55, 4, 'description', ''),
(56, 4, 'rich_editing', 'true'),
(57, 4, 'syntax_highlighting', 'true'),
(58, 4, 'comment_shortcuts', 'false'),
(59, 4, 'admin_color', 'fresh'),
(60, 4, 'use_ssl', '0'),
(61, 4, 'show_admin_bar_front', 'true'),
(62, 4, 'locale', ''),
(63, 4, 'wp_capabilities', 'a:14:{s:7:\"teacher\";b:1;s:14:\"quanlygiangday\";b:1;s:19:\"delete_others_posts\";b:1;s:12:\"delete_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:10:\"edit_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:17:\"manage_categories\";b:1;s:17:\"moderate_comments\";b:1;s:13:\"publish_posts\";b:1;s:18:\"read_private_posts\";b:1;}'),
(64, 4, 'wp_user_level', '0'),
(65, 4, 'dismissed_wp_pointers', ''),
(67, 5, 'nickname', 'admin5'),
(68, 5, 'first_name', ''),
(69, 5, 'last_name', ''),
(70, 5, 'description', ''),
(71, 5, 'rich_editing', 'true'),
(72, 5, 'syntax_highlighting', 'true'),
(73, 5, 'comment_shortcuts', 'false'),
(74, 5, 'admin_color', 'fresh'),
(75, 5, 'use_ssl', '0'),
(76, 5, 'show_admin_bar_front', 'true'),
(77, 5, 'locale', ''),
(78, 5, 'wp_capabilities', 'a:1:{s:10:\"subscriber\";b:1;}'),
(79, 5, 'wp_user_level', '0'),
(80, 5, 'dismissed_wp_pointers', ''),
(82, 6, 'nickname', 'admin6'),
(83, 6, 'first_name', ''),
(84, 6, 'last_name', ''),
(85, 6, 'description', ''),
(86, 6, 'rich_editing', 'true'),
(87, 6, 'syntax_highlighting', 'true'),
(88, 6, 'comment_shortcuts', 'false'),
(89, 6, 'admin_color', 'fresh'),
(90, 6, 'use_ssl', '0'),
(91, 6, 'show_admin_bar_front', 'true'),
(92, 6, 'locale', ''),
(93, 6, 'wp_capabilities', 'a:1:{s:10:\"subscriber\";b:1;}'),
(94, 6, 'wp_user_level', '0'),
(95, 6, 'dismissed_wp_pointers', ''),
(111, 4, 'wp_dashboard_quick_press_last_post_id', '17'),
(112, 4, 'closedpostboxes_dashboard', 'a:0:{}'),
(113, 4, 'metaboxhidden_dashboard', 'a:0:{}'),
(114, 4, 'meta-box-order_dashboard', 'a:4:{s:6:\"normal\";s:38:\"dashboard_activity,dashboard_right_now\";s:4:\"side\";s:17:\"dashboard_primary\";s:7:\"column3\";s:21:\"dashboard_quick_press\";s:7:\"column4\";s:0:\"\";}'),
(116, 7, 'nickname', 'tavananhquan9696@gmail.com'),
(117, 7, 'first_name', ''),
(118, 7, 'last_name', ''),
(119, 7, 'description', ''),
(120, 7, 'rich_editing', 'true'),
(121, 7, 'syntax_highlighting', 'true'),
(122, 7, 'comment_shortcuts', 'false'),
(123, 7, 'admin_color', 'fresh'),
(124, 7, 'use_ssl', '0'),
(125, 7, 'show_admin_bar_front', 'true'),
(126, 7, 'locale', ''),
(127, 7, 'wp_capabilities', 'a:1:{s:7:\"teacher\";b:1;}'),
(128, 7, 'wp_user_level', '0'),
(129, 7, 'dismissed_wp_pointers', ''),
(130, 8, 'nickname', 'abc@gmail.com'),
(131, 8, 'first_name', ''),
(132, 8, 'last_name', ''),
(133, 8, 'description', ''),
(134, 8, 'rich_editing', 'true'),
(135, 8, 'syntax_highlighting', 'true'),
(136, 8, 'comment_shortcuts', 'false'),
(137, 8, 'admin_color', 'fresh'),
(138, 8, 'use_ssl', '0'),
(139, 8, 'show_admin_bar_front', 'true'),
(140, 8, 'locale', ''),
(141, 8, 'wp_capabilities', 'a:16:{s:7:\"teacher\";b:1;s:14:\"quanlygiangday\";b:1;s:19:\"delete_others_posts\";b:1;s:12:\"delete_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:10:\"edit_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:17:\"manage_categories\";b:1;s:17:\"moderate_comments\";b:1;s:13:\"publish_posts\";b:1;s:18:\"read_private_posts\";b:1;s:17:\"unfiltered_upload\";b:1;s:12:\"upload_files\";b:1;}'),
(142, 8, 'wp_user_level', '0'),
(143, 8, 'dismissed_wp_pointers', ''),
(145, 8, 'closedpostboxes_dashboard', 'a:0:{}'),
(146, 8, 'metaboxhidden_dashboard', 'a:0:{}'),
(147, 8, 'wp_dashboard_quick_press_last_post_id', '19'),
(148, 1, 'closedpostboxes_dashboard', 'a:0:{}'),
(149, 1, 'metaboxhidden_dashboard', 'a:1:{i:0;s:21:\"dashboard_site_health\";}'),
(150, 1, 'meta-box-order_dashboard', 'a:4:{s:6:\"normal\";s:59:\"danh_sach_lich_day,danh_sach_tai_lieu,dashboard_site_health\";s:4:\"side\";s:0:\"\";s:7:\"column3\";s:0:\"\";s:7:\"column4\";s:0:\"\";}'),
(152, 8, 'meta-box-order_dashboard', 'a:4:{s:6:\"normal\";s:55:\"dashboard_summary,danh_sach_lich_day,danh_sach_tai_lieu\";s:4:\"side\";s:0:\"\";s:7:\"column3\";s:0:\"\";s:7:\"column4\";s:0:\"\";}'),
(153, 8, 'wp_persisted_preferences', 'a:2:{s:14:\"core/edit-post\";a:3:{s:26:\"isComplementaryAreaVisible\";b:1;s:12:\"welcomeGuide\";b:0;s:10:\"openPanels\";a:2:{i:0;s:11:\"post-status\";i:1;s:14:\"featured-image\";}}s:9:\"_modified\";s:24:\"2023-10-19T16:19:12.348Z\";}'),
(154, 8, 'wp_user-settings', 'libraryContent=browse&mfold=o'),
(155, 8, 'wp_user-settings-time', '1697979941'),
(156, 9, 'nickname', 'tavandan09091998@gmail.com'),
(157, 9, 'first_name', ''),
(158, 9, 'last_name', ''),
(159, 9, 'description', ''),
(160, 9, 'rich_editing', 'true'),
(161, 9, 'syntax_highlighting', 'true'),
(162, 9, 'comment_shortcuts', 'false'),
(163, 9, 'admin_color', 'fresh'),
(164, 9, 'use_ssl', '0'),
(165, 9, 'show_admin_bar_front', 'true'),
(166, 9, 'locale', ''),
(167, 9, 'wp_capabilities', 'a:1:{s:7:\"teacher\";b:1;}'),
(168, 9, 'wp_user_level', '0'),
(169, 9, 'dismissed_wp_pointers', ''),
(170, 1, 'manageuserscolumnshidden', 'a:0:{}'),
(174, 10, 'nickname', 'quandz3496@gmail.com'),
(175, 10, 'first_name', ''),
(176, 10, 'last_name', ''),
(177, 10, 'description', ''),
(178, 10, 'rich_editing', 'true'),
(179, 10, 'syntax_highlighting', 'true'),
(180, 10, 'comment_shortcuts', 'false'),
(181, 10, 'admin_color', 'ectoplasm'),
(182, 10, 'use_ssl', '0'),
(183, 10, 'show_admin_bar_front', 'true'),
(184, 10, 'locale', ''),
(185, 10, 'wp_capabilities', 'a:1:{s:7:\"teacher\";b:1;}'),
(186, 10, 'wp_user_level', '0'),
(187, 10, 'dismissed_wp_pointers', ''),
(189, 10, 'closedpostboxes_dashboard', 'a:0:{}'),
(190, 10, 'metaboxhidden_dashboard', 'a:0:{}'),
(191, 10, 'meta-box-order_dashboard', 'a:4:{s:6:\"normal\";s:37:\"danh_sach_tai_lieu,danh_sach_lich_day\";s:4:\"side\";s:0:\"\";s:7:\"column3\";s:0:\"\";s:7:\"column4\";s:0:\"\";}'),
(220, 13, 'nickname', 'phamhonganh@gmail.com'),
(221, 13, 'first_name', ''),
(222, 13, 'last_name', ''),
(223, 13, 'description', ''),
(224, 13, 'rich_editing', 'true'),
(225, 13, 'syntax_highlighting', 'true'),
(226, 13, 'comment_shortcuts', 'false'),
(227, 13, 'admin_color', 'fresh'),
(228, 13, 'use_ssl', '0'),
(229, 13, 'show_admin_bar_front', 'true'),
(230, 13, 'locale', ''),
(231, 13, 'wp_capabilities', 'a:1:{s:7:\"teacher\";b:1;}'),
(232, 13, 'wp_user_level', '0'),
(233, 13, 'dismissed_wp_pointers', ''),
(234, 14, 'nickname', 'dokimphuc@gmail.com'),
(235, 14, 'first_name', ''),
(236, 14, 'last_name', ''),
(237, 14, 'description', ''),
(238, 14, 'rich_editing', 'true'),
(239, 14, 'syntax_highlighting', 'true'),
(240, 14, 'comment_shortcuts', 'false'),
(241, 14, 'admin_color', 'fresh'),
(242, 14, 'use_ssl', '0'),
(243, 14, 'show_admin_bar_front', 'true'),
(244, 14, 'locale', ''),
(245, 14, 'wp_capabilities', 'a:1:{s:7:\"teacher\";b:1;}'),
(246, 14, 'wp_user_level', '0'),
(247, 14, 'dismissed_wp_pointers', ''),
(250, 15, 'nickname', 'tvd@gmail.com'),
(251, 15, 'first_name', ''),
(252, 15, 'last_name', ''),
(253, 15, 'description', ''),
(254, 15, 'rich_editing', 'true'),
(255, 15, 'syntax_highlighting', 'true'),
(256, 15, 'comment_shortcuts', 'false'),
(257, 15, 'admin_color', 'fresh'),
(258, 15, 'use_ssl', '0'),
(259, 15, 'show_admin_bar_front', 'true'),
(260, 15, 'locale', ''),
(261, 15, 'wp_capabilities', 'a:1:{s:7:\"teacher\";b:1;}'),
(262, 15, 'wp_user_level', '0'),
(263, 15, 'dismissed_wp_pointers', ''),
(264, 16, 'nickname', 'hoangvanduc@gmail.com'),
(265, 16, 'first_name', ''),
(266, 16, 'last_name', ''),
(267, 16, 'description', ''),
(268, 16, 'rich_editing', 'true'),
(269, 16, 'syntax_highlighting', 'true'),
(270, 16, 'comment_shortcuts', 'false'),
(271, 16, 'admin_color', 'fresh'),
(272, 16, 'use_ssl', '0'),
(273, 16, 'show_admin_bar_front', 'true'),
(274, 16, 'locale', ''),
(275, 16, 'wp_capabilities', 'a:1:{s:7:\"teacher\";b:1;}'),
(276, 16, 'wp_user_level', '0'),
(277, 16, 'dismissed_wp_pointers', ''),
(278, 17, 'nickname', 'trantuantu@gmail.com'),
(279, 17, 'first_name', ''),
(280, 17, 'last_name', ''),
(281, 17, 'description', ''),
(282, 17, 'rich_editing', 'true'),
(283, 17, 'syntax_highlighting', 'true'),
(284, 17, 'comment_shortcuts', 'false'),
(285, 17, 'admin_color', 'fresh'),
(286, 17, 'use_ssl', '0'),
(287, 17, 'show_admin_bar_front', 'true'),
(288, 17, 'locale', ''),
(289, 17, 'wp_capabilities', 'a:1:{s:7:\"teacher\";b:1;}'),
(290, 17, 'wp_user_level', '0'),
(291, 17, 'dismissed_wp_pointers', ''),
(292, 18, 'nickname', 'sdasdasdsd@gmail.com'),
(293, 18, 'first_name', ''),
(294, 18, 'last_name', ''),
(295, 18, 'description', ''),
(296, 18, 'rich_editing', 'true'),
(297, 18, 'syntax_highlighting', 'true'),
(298, 18, 'comment_shortcuts', 'false'),
(299, 18, 'admin_color', 'fresh'),
(300, 18, 'use_ssl', '0'),
(301, 18, 'show_admin_bar_front', 'true'),
(302, 18, 'locale', ''),
(303, 18, 'wp_capabilities', 'a:1:{s:7:\"teacher\";b:1;}'),
(304, 18, 'wp_user_level', '0'),
(305, 18, 'dismissed_wp_pointers', ''),
(308, 19, 'nickname', 'tranduydung@gmail.com'),
(309, 19, 'first_name', ''),
(310, 19, 'last_name', ''),
(311, 19, 'description', ''),
(312, 19, 'rich_editing', 'true'),
(313, 19, 'syntax_highlighting', 'true'),
(314, 19, 'comment_shortcuts', 'false'),
(315, 19, 'admin_color', 'fresh'),
(316, 19, 'use_ssl', '0'),
(317, 19, 'show_admin_bar_front', 'true'),
(318, 19, 'locale', ''),
(319, 19, 'wp_capabilities', 'a:1:{s:7:\"teacher\";b:1;}'),
(320, 19, 'wp_user_level', '0'),
(321, 19, 'dismissed_wp_pointers', ''),
(324, 20, 'nickname', 'thanhhangdoan@gmail.com'),
(325, 20, 'first_name', ''),
(326, 20, 'last_name', ''),
(327, 20, 'description', ''),
(328, 20, 'rich_editing', 'true'),
(329, 20, 'syntax_highlighting', 'true'),
(330, 20, 'comment_shortcuts', 'false'),
(331, 20, 'admin_color', 'fresh'),
(332, 20, 'use_ssl', '0'),
(333, 20, 'show_admin_bar_front', 'true'),
(334, 20, 'locale', ''),
(335, 20, 'wp_capabilities', 'a:1:{s:7:\"teacher\";b:1;}'),
(336, 20, 'wp_user_level', '0'),
(337, 20, 'dismissed_wp_pointers', ''),
(340, 21, 'nickname', 'thuhavu@gmail.com'),
(341, 21, 'first_name', ''),
(342, 21, 'last_name', ''),
(343, 21, 'description', ''),
(344, 21, 'rich_editing', 'true'),
(345, 21, 'syntax_highlighting', 'true'),
(346, 21, 'comment_shortcuts', 'false'),
(347, 21, 'admin_color', 'fresh'),
(348, 21, 'use_ssl', '0'),
(349, 21, 'show_admin_bar_front', 'true'),
(350, 21, 'locale', ''),
(351, 21, 'wp_capabilities', 'a:1:{s:7:\"teacher\";b:1;}'),
(352, 21, 'wp_user_level', '0'),
(353, 21, 'dismissed_wp_pointers', ''),
(354, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(355, 1, 'metaboxhidden_nav-menus', 'a:0:{}'),
(356, 22, 'nickname', 'lechiluan@gmaul.com'),
(357, 22, 'first_name', ''),
(358, 22, 'last_name', ''),
(359, 22, 'description', ''),
(360, 22, 'rich_editing', 'true'),
(361, 22, 'syntax_highlighting', 'true'),
(362, 22, 'comment_shortcuts', 'false'),
(363, 22, 'admin_color', 'fresh'),
(364, 22, 'use_ssl', '0'),
(365, 22, 'show_admin_bar_front', 'true'),
(366, 22, 'locale', ''),
(367, 22, 'wp_capabilities', 'a:1:{s:7:\"teacher\";b:1;}'),
(368, 22, 'wp_user_level', '0'),
(369, 22, 'dismissed_wp_pointers', ''),
(371, 23, 'nickname', 'lechi@gmail.com'),
(372, 23, 'first_name', ''),
(373, 23, 'last_name', ''),
(374, 23, 'description', ''),
(375, 23, 'rich_editing', 'true'),
(376, 23, 'syntax_highlighting', 'true'),
(377, 23, 'comment_shortcuts', 'false'),
(378, 23, 'admin_color', 'fresh'),
(379, 23, 'use_ssl', '0'),
(380, 23, 'show_admin_bar_front', 'true'),
(381, 23, 'locale', ''),
(382, 23, 'wp_capabilities', 'a:1:{s:7:\"teacher\";b:1;}'),
(383, 23, 'wp_user_level', '0'),
(384, 23, 'dismissed_wp_pointers', ''),
(386, 1, 'nav_menu_recently_edited', '3'),
(387, 1, 'supsystic-tables-tutorial_was_showed', '1'),
(388, 1, 'closedpostboxes_nav-menus', 'a:0:{}'),
(389, 1, 'closedpostboxes_post', 'a:0:{}'),
(390, 1, 'metaboxhidden_post', 'a:0:{}'),
(391, 1, 'meta-box-order_post', 'a:3:{s:6:\"normal\";s:0:\"\";s:8:\"advanced\";s:12:\"post_options\";s:4:\"side\";s:0:\"\";}'),
(393, 24, 'nickname', 'tavandan0901998@gmail.com'),
(394, 24, 'first_name', ''),
(395, 24, 'last_name', ''),
(396, 24, 'description', ''),
(397, 24, 'rich_editing', 'true'),
(398, 24, 'syntax_highlighting', 'true'),
(399, 24, 'comment_shortcuts', 'false'),
(400, 24, 'admin_color', 'fresh'),
(401, 24, 'use_ssl', '0'),
(402, 24, 'show_admin_bar_front', 'true'),
(403, 24, 'locale', ''),
(404, 24, 'wp_capabilities', 'a:1:{s:7:\"teacher\";b:1;}'),
(405, 24, 'wp_user_level', '0'),
(406, 24, 'dismissed_wp_pointers', ''),
(418, 24, '_new_email', 'a:2:{s:4:\"hash\";s:32:\"b0682688589d61ce8ef1021fc900b2ba\";s:8:\"newemail\";s:25:\"tavandan0901998@gmail.com\";}'),
(426, 1, 'session_tokens', 'a:1:{s:64:\"3e90ebd4ea9ad4d7c3dd1a27098edb8f29a383371165f2cf4d63d027872ac0da\";a:4:{s:10:\"expiration\";i:1701083749;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36\";s:5:\"login\";i:1700910949;}}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(255) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BuGJm7ULKxgT4IXeAIQL1r5RaKTrCj/', 'admin', 'admin123@gmail.com', 'http://localhost/quanlygiangday', '2023-10-11 14:31:51', '', 0, 'admin'),
(8, 'abc@gmail.com', '$P$B02MyMnvGYOoeJsurCZzFCPtkihtgx1', 'abc', '', '', '2023-10-18 13:38:36', '', 0, 'abc'),
(22, 'lechiluan@gmail.com', '$P$B/uMauf7ui96odsnTWODgpDAmd.in90', 'le-chi-luan', 'lechiluan@gmail.com', '', '2023-10-29 09:36:21', '', 0, 'Lê Chí Luận'),
(23, 'lechi@gmail.com', '$P$BC7bOFNNYafyFvj9ScGuHcU4vZKGwz/', 'le-thi-chi', 'lechi@gmail.com', '', '2023-10-29 09:40:18', '', 0, 'Lê Thị Chi'),
(24, 'tavandan0901998@gmail.com', '$P$BhoxtMyTl7uI.qb0GB7MCphEhXYcb0.', 'ta-van-dan', 'tavandan09091998@gmail.com', '', '2023-11-02 13:49:10', '', 0, 'Tạ Văn Dân');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `wp_classes`
--
ALTER TABLE `wp_classes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Chỉ mục cho bảng `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Chỉ mục cho bảng `wp_dang_ky`
--
ALTER TABLE `wp_dang_ky`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Chỉ mục cho bảng `wp_history_lesson`
--
ALTER TABLE `wp_history_lesson`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_dang_ky` (`id_dang_ky`);

--
-- Chỉ mục cho bảng `wp_khoa`
--
ALTER TABLE `wp_khoa`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Chỉ mục cho bảng `wp_mon_hoc`
--
ALTER TABLE `wp_mon_hoc`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`),
  ADD KEY `autoload` (`autoload`);

--
-- Chỉ mục cho bảng `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Chỉ mục cho bảng `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Chỉ mục cho bảng `wp_supsystic_tbl_columns`
--
ALTER TABLE `wp_supsystic_tbl_columns`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `wp_supsystic_tbl_conditions`
--
ALTER TABLE `wp_supsystic_tbl_conditions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `wp_supsystic_tbl_diagrams`
--
ALTER TABLE `wp_supsystic_tbl_diagrams`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `wp_supsystic_tbl_rows`
--
ALTER TABLE `wp_supsystic_tbl_rows`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `wp_supsystic_tbl_rows_history`
--
ALTER TABLE `wp_supsystic_tbl_rows_history`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `wp_supsystic_tbl_tables`
--
ALTER TABLE `wp_supsystic_tbl_tables`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `wp_teacher`
--
ALTER TABLE `wp_teacher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ma_to_mon` (`ma_to_mon`);

--
-- Chỉ mục cho bảng `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Chỉ mục cho bảng `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Chỉ mục cho bảng `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Chỉ mục cho bảng `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Chỉ mục cho bảng `wp_to_mon`
--
ALTER TABLE `wp_to_mon`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Chỉ mục cho bảng `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `wp_classes`
--
ALTER TABLE `wp_classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `wp_dang_ky`
--
ALTER TABLE `wp_dang_ky`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `wp_history_lesson`
--
ALTER TABLE `wp_history_lesson`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `wp_khoa`
--
ALTER TABLE `wp_khoa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `wp_mon_hoc`
--
ALTER TABLE `wp_mon_hoc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1180;

--
-- AUTO_INCREMENT cho bảng `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=337;

--
-- AUTO_INCREMENT cho bảng `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2696;

--
-- AUTO_INCREMENT cho bảng `wp_supsystic_tbl_columns`
--
ALTER TABLE `wp_supsystic_tbl_columns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `wp_supsystic_tbl_conditions`
--
ALTER TABLE `wp_supsystic_tbl_conditions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `wp_supsystic_tbl_diagrams`
--
ALTER TABLE `wp_supsystic_tbl_diagrams`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `wp_supsystic_tbl_rows`
--
ALTER TABLE `wp_supsystic_tbl_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `wp_supsystic_tbl_rows_history`
--
ALTER TABLE `wp_supsystic_tbl_rows_history`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `wp_supsystic_tbl_tables`
--
ALTER TABLE `wp_supsystic_tbl_tables`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `wp_teacher`
--
ALTER TABLE `wp_teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT cho bảng `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `wp_to_mon`
--
ALTER TABLE `wp_to_mon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=427;

--
-- AUTO_INCREMENT cho bảng `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `wp_dang_ky`
--
ALTER TABLE `wp_dang_ky`
  ADD CONSTRAINT `wp_dang_ky_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `wp_teacher` (`id`);

--
-- Các ràng buộc cho bảng `wp_history_lesson`
--
ALTER TABLE `wp_history_lesson`
  ADD CONSTRAINT `wp_history_lesson_ibfk_1` FOREIGN KEY (`id_dang_ky`) REFERENCES `wp_dang_ky` (`id`);

--
-- Các ràng buộc cho bảng `wp_teacher`
--
ALTER TABLE `wp_teacher`
  ADD CONSTRAINT `wp_teacher_ibfk_1` FOREIGN KEY (`ma_to_mon`) REFERENCES `wp_to_mon` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
