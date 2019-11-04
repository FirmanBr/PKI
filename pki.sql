-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2019 at 04:30 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pki`
--

-- --------------------------------------------------------

--
-- Table structure for table `aps_profile`
--

CREATE TABLE `aps_profile` (
  `id` int(11) NOT NULL,
  `role` smallint(5) UNSIGNED DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aps_profile`
--

INSERT INTO `aps_profile` (`id`, `role`, `user_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `aps_userprofileinfo`
--

CREATE TABLE `aps_userprofileinfo` (
  `id` int(11) NOT NULL,
  `portfolio_site` varchar(200) NOT NULL,
  `profile_pic` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add permission', 1, 'add_permission'),
(2, 'Can change permission', 1, 'change_permission'),
(3, 'Can delete permission', 1, 'delete_permission'),
(4, 'Can view permission', 1, 'view_permission'),
(5, 'Can add group', 2, 'add_group'),
(6, 'Can change group', 2, 'change_group'),
(7, 'Can delete group', 2, 'delete_group'),
(8, 'Can view group', 2, 'view_group'),
(9, 'Can add user', 3, 'add_user'),
(10, 'Can change user', 3, 'change_user'),
(11, 'Can delete user', 3, 'delete_user'),
(12, 'Can view user', 3, 'view_user'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add django x509 ca', 5, 'add_djangox509ca'),
(18, 'Can change django x509 ca', 5, 'change_djangox509ca'),
(19, 'Can delete django x509 ca', 5, 'delete_djangox509ca'),
(20, 'Can view django x509 ca', 5, 'view_djangox509ca'),
(21, 'Can add django x509 cert', 6, 'add_djangox509cert'),
(22, 'Can change django x509 cert', 6, 'change_djangox509cert'),
(23, 'Can delete django x509 cert', 6, 'delete_djangox509cert'),
(24, 'Can view django x509 cert', 6, 'view_djangox509cert'),
(25, 'Can add mainkey', 7, 'add_mainkey'),
(26, 'Can change mainkey', 7, 'change_mainkey'),
(27, 'Can delete mainkey', 7, 'delete_mainkey'),
(28, 'Can view mainkey', 7, 'view_mainkey'),
(29, 'Can add profile', 8, 'add_profile'),
(30, 'Can change profile', 8, 'change_profile'),
(31, 'Can delete profile', 8, 'delete_profile'),
(32, 'Can view profile', 8, 'view_profile'),
(33, 'Can add user profile info', 9, 'add_userprofileinfo'),
(34, 'Can change user profile info', 9, 'change_userprofileinfo'),
(35, 'Can delete user profile info', 9, 'delete_userprofileinfo'),
(36, 'Can view user profile info', 9, 'view_userprofileinfo'),
(37, 'Can add log entry', 10, 'add_logentry'),
(38, 'Can change log entry', 10, 'change_logentry'),
(39, 'Can delete log entry', 10, 'delete_logentry'),
(40, 'Can view log entry', 10, 'view_logentry'),
(41, 'Can add session', 11, 'add_session'),
(42, 'Can change session', 11, 'change_session'),
(43, 'Can delete session', 11, 'delete_session'),
(44, 'Can view session', 11, 'view_session'),
(45, 'Can add CA', 12, 'add_ca'),
(46, 'Can change CA', 12, 'change_ca'),
(47, 'Can delete CA', 12, 'delete_ca'),
(48, 'Can view CA', 12, 'view_ca'),
(49, 'Can add certificate', 13, 'add_cert'),
(50, 'Can change certificate', 13, 'change_cert'),
(51, 'Can delete certificate', 13, 'delete_cert'),
(52, 'Can view certificate', 13, 'view_cert');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$120000$3TBeeO7sy4ah$VEXZ8W5rnRyOyI40Mc9OnhfLKLzSe4qIaO6OER7XR1A=', '2019-11-04 02:33:11.880350', 1, 'user1', '', '', 'firmanbrilian@gmail.com', 1, 1, '2019-11-01 07:49:10.000000'),
(2, 'pbkdf2_sha256$120000$effgvnQvkJVW$NqwR0lssU9bOrGT6I+nZBBDQKkKhxeGdFWaGvJMEFe0=', '2019-11-04 01:00:01.087143', 0, 'user2', '', '', '', 0, 1, '2019-11-01 07:57:19.000000'),
(3, 'pbkdf2_sha256$120000$xwqnRF5JUMl7$CKsFC6Ha/ajZqYb3HWxGzirYbmU9cwkq2oIYVdgBc/o=', NULL, 0, 'user3', '', '', '', 0, 1, '2019-11-01 07:57:31.000000'),
(4, 'pbkdf2_sha256$120000$w6DGeextnGus$iBx164rRrL+35une5Vzxtz9fPDj2kIkwlYpZNS0Vixg=', NULL, 0, 'user4', '', '', '', 0, 1, '2019-11-01 07:57:41.000000'),
(5, 'pbkdf2_sha256$120000$PyvDLIVtFAWx$zEVBexKBNupanZVHzM5wU1qacO5qs+N5F9Pmvd3wfMU=', NULL, 0, 'user5', '', '', '', 0, 1, '2019-11-01 07:57:50.000000'),
(6, 'pbkdf2_sha256$120000$ps80u0by65IY$6DbNiUGePZ1ECKzTeqzlnd/UAZTIF5+r8DNn/+wbWi8=', NULL, 0, 'user6', '', '', '', 0, 1, '2019-11-01 07:58:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2019-11-01 07:49:41.113747', '1', 'user1', 2, '[{\"changed\": {\"name\": \"profile\", \"object\": \"user1\", \"fields\": [\"role\"]}}]', 3, 1),
(2, '2019-11-01 07:50:41.649948', '1', 'user1', 1, '[{\"added\": {}}]', 12, 1),
(3, '2019-11-01 07:57:19.289144', '2', 'user2', 1, '[{\"added\": {}}]', 3, 1),
(4, '2019-11-01 07:57:31.257535', '3', 'user3', 1, '[{\"added\": {}}]', 3, 1),
(5, '2019-11-01 07:57:41.534705', '4', 'user4', 1, '[{\"added\": {}}]', 3, 1),
(6, '2019-11-01 07:57:50.978760', '5', 'user5', 1, '[{\"added\": {}}]', 3, 1),
(7, '2019-11-01 07:58:00.759917', '6', 'user6', 1, '[{\"added\": {}}]', 3, 1),
(8, '2019-11-01 07:58:41.461630', '2', 'user2', 2, '[{\"changed\": {\"name\": \"profile\", \"object\": \"user2\", \"fields\": [\"role\"]}}]', 3, 1),
(9, '2019-11-01 07:58:48.483710', '3', 'user3', 2, '[{\"changed\": {\"name\": \"profile\", \"object\": \"user3\", \"fields\": [\"role\"]}}]', 3, 1),
(10, '2019-11-01 07:58:55.758725', '4', 'user4', 2, '[{\"changed\": {\"name\": \"profile\", \"object\": \"user4\", \"fields\": [\"role\"]}}]', 3, 1),
(11, '2019-11-01 07:59:01.992889', '5', 'user5', 2, '[{\"changed\": {\"name\": \"profile\", \"object\": \"user5\", \"fields\": [\"role\"]}}]', 3, 1),
(12, '2019-11-01 07:59:08.166240', '6', 'user6', 2, '[{\"changed\": {\"name\": \"profile\", \"object\": \"user6\", \"fields\": [\"role\"]}}]', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(10, 'admin', 'logentry'),
(5, 'aps', 'djangox509ca'),
(6, 'aps', 'djangox509cert'),
(7, 'aps', 'mainkey'),
(8, 'aps', 'profile'),
(9, 'aps', 'userprofileinfo'),
(2, 'auth', 'group'),
(1, 'auth', 'permission'),
(3, 'auth', 'user'),
(4, 'contenttypes', 'contenttype'),
(12, 'django_x509', 'ca'),
(13, 'django_x509', 'cert'),
(11, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-11-01 07:47:05.884295'),
(2, 'auth', '0001_initial', '2019-11-01 07:47:06.240404'),
(3, 'aps', '0001_initial', '2019-11-01 07:47:06.358102'),
(4, 'admin', '0001_initial', '2019-11-01 07:48:10.287173'),
(5, 'admin', '0002_logentry_remove_auto_add', '2019-11-01 07:48:10.296126'),
(6, 'admin', '0003_logentry_add_action_flag_choices', '2019-11-01 07:48:10.303140'),
(7, 'contenttypes', '0002_remove_content_type_name', '2019-11-01 07:48:10.344996'),
(8, 'auth', '0002_alter_permission_name_max_length', '2019-11-01 07:48:10.354481'),
(9, 'auth', '0003_alter_user_email_max_length', '2019-11-01 07:48:10.366479'),
(10, 'auth', '0004_alter_user_username_opts', '2019-11-01 07:48:10.373465'),
(11, 'auth', '0005_alter_user_last_login_null', '2019-11-01 07:48:10.398602'),
(12, 'auth', '0006_require_contenttypes_0002', '2019-11-01 07:48:10.400603'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2019-11-01 07:48:10.408575'),
(14, 'auth', '0008_alter_user_username_max_length', '2019-11-01 07:48:10.422538'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2019-11-01 07:48:10.434506'),
(16, 'django_x509', '0001_initial', '2019-11-01 07:48:10.547302'),
(17, 'django_x509', '0002_certificate', '2019-11-01 07:48:10.593181'),
(18, 'django_x509', '0003_rename_organization_field', '2019-11-01 07:48:10.612133'),
(19, 'django_x509', '0004_auto_20171207_1450', '2019-11-01 07:48:10.662371'),
(20, 'django_x509', '0005_organizational_unit_name', '2019-11-01 07:48:10.688302'),
(21, 'sessions', '0001_initial', '2019-11-01 07:48:10.713238');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('lenertybvwwo71ce2pij5ns7cz6qaodn', 'MjczNjllNzI0OTZmYTcxZmI0NDlhNmRkNWY1YTU2OTVjZDBmZjA0OTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMmJjYjVjMTQ2MmIzZGJkNTZhMWMzMmVlZGIzNzM3NmFlMzNlM2Q1In0=', '2019-11-18 01:55:47.963760'),
('wfvzypxa2d64xqjqegmsu2bi6poz31x7', 'MjczNjllNzI0OTZmYTcxZmI0NDlhNmRkNWY1YTU2OTVjZDBmZjA0OTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMmJjYjVjMTQ2MmIzZGJkNTZhMWMzMmVlZGIzNzM3NmFlMzNlM2Q1In0=', '2019-11-18 02:33:11.887362');

-- --------------------------------------------------------

--
-- Table structure for table `django_x509_ca`
--

CREATE TABLE `django_x509_ca` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `notes` longtext NOT NULL,
  `key_length` varchar(6) NOT NULL,
  `digest` varchar(8) NOT NULL,
  `validity_start` datetime(6) DEFAULT NULL,
  `validity_end` datetime(6) DEFAULT NULL,
  `country_code` varchar(2) NOT NULL,
  `state` varchar(64) NOT NULL,
  `city` varchar(64) NOT NULL,
  `organization_name` varchar(64) NOT NULL,
  `email` varchar(254) NOT NULL,
  `common_name` varchar(63) NOT NULL,
  `extensions` longtext NOT NULL,
  `serial_number` varchar(39) DEFAULT NULL,
  `certificate` longtext NOT NULL,
  `private_key` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `organizational_unit_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_x509_ca`
--

INSERT INTO `django_x509_ca` (`id`, `name`, `notes`, `key_length`, `digest`, `validity_start`, `validity_end`, `country_code`, `state`, `city`, `organization_name`, `email`, `common_name`, `extensions`, `serial_number`, `certificate`, `private_key`, `created`, `modified`, `organizational_unit_name`) VALUES
(1, 'user1', 'tes', '2048', 'sha256', '2019-10-31 00:00:00.000000', '2022-10-29 07:49:54.000000', '', '', '', '', '', '', '[]', '74616606903887689493014937557089154360', '-----BEGIN CERTIFICATE-----\nMIIDDDCCAfSgAwIBAgIQOCKiwRFKSvS9qDiJP1B1ODANBgkqhkiG9w0BAQsFADAA\nMCIYDzIwMTkxMDMxMDAwMDAwWhgPMjAyMjEwMjkwNzQ5NTRaMAAwggEiMA0GCSqG\nSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDWpqA0NviNhA2hpakq0dYaU5Iwie/UjouT\nLewrJmS5BcNbJFoozJj8SJ7M6t6W38PWFS1WqaY96UproPR87VDyoYd75c++hAnd\nA87RnktQ2TD+mBcxEJNF8zdY0sucYxhhtUQTe4lW0DxCyY4drXhzI6frJkc7V1Nd\nPS7nPETt74SIJ8oELK4SK/LWFEgR8NgmhOzIb3sdbcHkJE1KG0YOSCgiDO+xa5dQ\nsUO2UxYhdYwJNiW+tdur6hEBwHZTXO6Zv4228HSwFw7JxUHJizH4eSJa2pY2K97g\nEia9nH4FgnHGFdOlK3iFBtKD18LebY3QWJeNgL9O7VY4hsV3OwZLAgMBAAGjfjB8\nMBIGA1UdEwEB/wQIMAYBAf8CAQAwDgYDVR0PAQH/BAQDAgEGMB0GA1UdDgQWBBQ2\nH0iGw8cCVqC9aHbGPGU6qMcWgjA3BgNVHSMEMDAugBQ2H0iGw8cCVqC9aHbGPGU6\nqMcWgqEEpAIwAIIQOCKiwRFKSvS9qDiJP1B1ODANBgkqhkiG9w0BAQsFAAOCAQEA\nAkQdAgLNBCaEgngOXFUP2tiwHO+Pesb1L/yXMi3fbzE7qrWybD2YHDB8oc8fXcZA\n0QMtNEwSlA3/R58b/z3kVa2Z9XoOPjavfY9QfHjSUjj8arrKzw3XIy/lJHextWKH\n14H4vMYq74gZ20ayXsjQvPROxB1d1KPIcyT8DgmDTmT57VQJXtdP//+J8/CfgIna\nbf0wHX8INcit/fTcseNg1klAGXdtsaBmVQyXOSH2Mr/yqLeT57Vde27+Us8eozAP\nLQtTf5m5qlCbTQbuonFO+fqVGtw7KBuG4C+M9QmK9DClPa7FrsyTwl3a/ISvzQbK\n1+Jg6qGmFHyyYCyxRIqvSA==\n-----END CERTIFICATE-----\n', '-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDWpqA0NviNhA2h\npakq0dYaU5Iwie/UjouTLewrJmS5BcNbJFoozJj8SJ7M6t6W38PWFS1WqaY96Upr\noPR87VDyoYd75c++hAndA87RnktQ2TD+mBcxEJNF8zdY0sucYxhhtUQTe4lW0DxC\nyY4drXhzI6frJkc7V1NdPS7nPETt74SIJ8oELK4SK/LWFEgR8NgmhOzIb3sdbcHk\nJE1KG0YOSCgiDO+xa5dQsUO2UxYhdYwJNiW+tdur6hEBwHZTXO6Zv4228HSwFw7J\nxUHJizH4eSJa2pY2K97gEia9nH4FgnHGFdOlK3iFBtKD18LebY3QWJeNgL9O7VY4\nhsV3OwZLAgMBAAECggEAH7HY4/zd9J90F9NLSFxVneuLIYmslRk7OM9GGRUBOGTG\ndNXITk/vowjiEeX4WhTOaPUVjb9dIbUp3PyWPUAZfMonJD9JzprWjgD67+7MtjJr\nzpwMiJ0m8eQ43u+5Su1C82J9m9bY762tyDrUtkMgDvhL2if7yqJZV+Ip49D9aJh5\nD5zS7tvp631lqNCi9/jOq/1audcw+ZolHVE/lOPXpbgnn4mPFCH8yWOdSz02LRuG\nZrsJjM4ENFD9b8NNCjGF2/2uwnfYLYU5ovf3jpJGWJy2rpkYbD30BYaNJgUic5bv\n8OhgIozwHyieVo/2iwWwct5S1/rK6Z0jRcQOOm2fqQKBgQD1YytRG+EGT0BIaEZ9\ndFnQ3LLmOgOk9JLpNy48Wl5TNGf02Vcv15EF/9q580vuQGfOpWsk0lbMm6MBPTjm\nAr0vdwbL/mQFy6PC4HtL1c9ZMaYTOfnmofvsBFlNyj56DzVukLfKXep9vzJY4z8E\n8z+2CtPgnToQPzcy9Rodqx7kFwKBgQDf7yeGl77lme8nXilUZp+b8QMUac94EQQm\nOlnNXjorgHA8ZHt6+MA4mpvlnZuiP8TDz737BzUnmsL7HQARsNL2CqJAJJKbPzR9\nS/K59y1kP2cC3yuvCnSQinBRYf4Nd3D6AaP0TUiUp+q1znXzkZkactPmhayW3wit\nwVAIKH4r7QKBgF8Csb/q2nrV7p7aeQiUJz5+ZWpM5iJVbBiOfAF0P/dZYDLmgCKP\nBaDcCrVa5XhvSYIyfES6iE8ap8eQC9rLDrM1E9WiPtobmeGXh0W6mFkBpzrkhMTu\nzRr6KBW9i+k4wEh6Eh9xs5xSjkzqV/kzseRrVtQuLFAkGdxKGH2KRyCrAoGASsFV\nmpLRwWgv9B51AZ34rmA4vPnNrrFPh0t3ax2HoboQvbh1mEmuMbc7T93bdMCA+TVC\noKh5UC1T5ex6d21mH4jRPUR4RKdG6IUQFJC1cH/R7Z1+wcJlw1LTx/dEjk5PQsaF\nayrZjfa4XdT8f0EdsTygDJaXVQ5DoW2lP/P0mskCgYAPqC1AyulZquCWj9WgkltZ\ndrg285qmKiTNVQkLETvQWNJgyI7lnM9x0WhCC5ib8Lnyc48oSYjLxPdLNtBU/pQF\nw6G7Q05EJaUpmJT1NNcZk0r3lLSnogOBZnGgWwdi7zxbnse+Dk8HeZuizVW0st3o\ncT9SXBYB0yvbAnik+2cAcA==\n-----END PRIVATE KEY-----\n', '2019-11-01 07:50:41.556692', '2019-11-01 07:50:41.647952', '');

-- --------------------------------------------------------

--
-- Table structure for table `django_x509_cert`
--

CREATE TABLE `django_x509_cert` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `notes` longtext NOT NULL,
  `key_length` varchar(6) NOT NULL,
  `digest` varchar(8) NOT NULL,
  `validity_start` datetime(6) DEFAULT NULL,
  `validity_end` datetime(6) DEFAULT NULL,
  `country_code` varchar(2) NOT NULL,
  `state` varchar(64) NOT NULL,
  `city` varchar(64) NOT NULL,
  `organization_name` varchar(64) NOT NULL,
  `email` varchar(254) NOT NULL,
  `common_name` varchar(63) NOT NULL,
  `extensions` longtext NOT NULL,
  `serial_number` varchar(39) DEFAULT NULL,
  `certificate` longtext NOT NULL,
  `private_key` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `revoked_at` datetime(6) DEFAULT NULL,
  `ca_id` int(11) NOT NULL,
  `organizational_unit_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mainkey`
--

CREATE TABLE `mainkey` (
  `no` int(11) NOT NULL,
  `id` varchar(100) NOT NULL,
  `key_name` longtext NOT NULL,
  `time_start` time(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aps_profile`
--
ALTER TABLE `aps_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `aps_userprofileinfo`
--
ALTER TABLE `aps_userprofileinfo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `django_x509_ca`
--
ALTER TABLE `django_x509_ca`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_x509_cert`
--
ALTER TABLE `django_x509_cert`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_x509_cert_ca_id_serial_number_32257b8b_uniq` (`ca_id`,`serial_number`);

--
-- Indexes for table `mainkey`
--
ALTER TABLE `mainkey`
  ADD PRIMARY KEY (`no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aps_profile`
--
ALTER TABLE `aps_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `aps_userprofileinfo`
--
ALTER TABLE `aps_userprofileinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `django_x509_ca`
--
ALTER TABLE `django_x509_ca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `django_x509_cert`
--
ALTER TABLE `django_x509_cert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mainkey`
--
ALTER TABLE `mainkey`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aps_profile`
--
ALTER TABLE `aps_profile`
  ADD CONSTRAINT `aps_profile_user_id_49cfd8df_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `aps_userprofileinfo`
--
ALTER TABLE `aps_userprofileinfo`
  ADD CONSTRAINT `aps_userprofileinfo_user_id_979cce32_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_x509_cert`
--
ALTER TABLE `django_x509_cert`
  ADD CONSTRAINT `django_x509_cert_ca_id_96dcbad1_fk_django_x509_ca_id` FOREIGN KEY (`ca_id`) REFERENCES `django_x509_ca` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
