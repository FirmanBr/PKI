-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 24, 2019 at 08:35 AM
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
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'admin'),
(3, 'ca'),
(2, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 1, 18),
(19, 1, 19),
(20, 1, 20),
(21, 1, 21),
(22, 1, 22),
(23, 1, 23),
(24, 1, 24),
(25, 1, 25),
(26, 1, 26),
(27, 1, 27),
(28, 1, 28),
(29, 1, 29),
(30, 1, 30),
(31, 1, 31),
(32, 1, 32),
(33, 1, 33),
(34, 1, 34),
(35, 1, 35),
(36, 1, 36),
(37, 2, 25),
(38, 2, 26),
(39, 2, 27),
(40, 2, 28),
(46, 3, 9),
(47, 3, 25),
(48, 3, 26),
(49, 3, 27),
(50, 3, 28),
(51, 3, 29),
(52, 3, 30),
(53, 3, 31),
(41, 3, 32),
(42, 3, 33),
(43, 3, 34),
(44, 3, 35),
(45, 3, 36);

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
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add user profile info', 7, 'add_userprofileinfo'),
(26, 'Can change user profile info', 7, 'change_userprofileinfo'),
(27, 'Can delete user profile info', 7, 'delete_userprofileinfo'),
(28, 'Can view user profile info', 7, 'view_userprofileinfo'),
(29, 'Can add CA', 8, 'add_ca'),
(30, 'Can change CA', 8, 'change_ca'),
(31, 'Can delete CA', 8, 'delete_ca'),
(32, 'Can view CA', 8, 'view_ca'),
(33, 'Can add certificate', 9, 'add_cert'),
(34, 'Can change certificate', 9, 'change_cert'),
(35, 'Can delete certificate', 9, 'delete_cert'),
(36, 'Can view certificate', 9, 'view_cert'),
(37, 'Can add master key', 10, 'add_masterkey'),
(38, 'Can change master key', 10, 'change_masterkey'),
(39, 'Can delete master key', 10, 'delete_masterkey'),
(40, 'Can view master key', 10, 'view_masterkey'),
(41, 'Can add master', 11, 'add_master'),
(42, 'Can change master', 11, 'change_master'),
(43, 'Can delete master', 11, 'delete_master'),
(44, 'Can view master', 11, 'view_master');

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
(1, 'pbkdf2_sha256$120000$MqyCW11Apmy0$DRj+s45Jw8LDQfdT2z12Gy9F3M7xbz78sWivPhJYWtM=', '2019-10-24 01:46:58.102624', 1, 'firman', 'firman', 'brilian', 'firmanbrlian@gmail.com', 1, 1, '2019-10-18 02:51:36.000000'),
(2, 'pbkdf2_sha256$120000$Dap786KYTXoV$qnB+OUxBaNLlWmPA6hO3PR+rW2Lk8dbCdQIAEyp+Flg=', '2019-10-24 06:00:49.812380', 0, 'ian', 'ian', 'agung', 'ian.agung@len.co.id', 0, 1, '2019-10-22 06:34:36.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1);

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
(1, '2019-10-22 06:34:36.416068', '2', 'ian', 1, '[{\"added\": {}}]', 4, 1),
(2, '2019-10-22 06:35:14.631795', '2', 'ian', 2, '[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\"]}}]', 4, 1),
(3, '2019-10-22 06:35:35.573571', '1', 'firman', 2, '[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]', 4, 1),
(4, '2019-10-22 06:36:08.023205', '1', 'admin', 1, '[{\"added\": {}}]', 3, 1),
(5, '2019-10-22 06:37:37.319735', '2', 'user', 1, '[{\"added\": {}}]', 3, 1),
(6, '2019-10-22 06:38:41.827273', '3', 'ca', 1, '[{\"added\": {}}]', 3, 1),
(7, '2019-10-22 06:39:08.573339', '1', 'firman', 2, '[{\"changed\": {\"fields\": [\"groups\"]}}]', 4, 1);

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
(1, 'admin', 'logentry'),
(11, 'aps', 'master'),
(10, 'aps', 'masterkey'),
(7, 'aps', 'userprofileinfo'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(8, 'django_x509', 'ca'),
(9, 'django_x509', 'cert'),
(6, 'sessions', 'session');

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
(1, 'contenttypes', '0001_initial', '2019-10-18 02:35:38.271340'),
(2, 'auth', '0001_initial', '2019-10-18 02:35:38.473782'),
(3, 'admin', '0001_initial', '2019-10-18 02:35:38.923909'),
(4, 'admin', '0002_logentry_remove_auto_add', '2019-10-18 02:35:39.022572'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2019-10-18 02:35:39.039479'),
(6, 'aps', '0001_initial', '2019-10-18 02:35:39.077379'),
(7, 'contenttypes', '0002_remove_content_type_name', '2019-10-18 02:35:39.161190'),
(8, 'auth', '0002_alter_permission_name_max_length', '2019-10-18 02:35:39.175151'),
(9, 'auth', '0003_alter_user_email_max_length', '2019-10-18 02:35:39.193069'),
(10, 'auth', '0004_alter_user_username_opts', '2019-10-18 02:35:39.205037'),
(11, 'auth', '0005_alter_user_last_login_null', '2019-10-18 02:35:39.247052'),
(12, 'auth', '0006_require_contenttypes_0002', '2019-10-18 02:35:39.252007'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2019-10-18 02:35:39.265007'),
(14, 'auth', '0008_alter_user_username_max_length', '2019-10-18 02:35:39.279931'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2019-10-18 02:35:39.296887'),
(16, 'auth', '0010_alter_group_name_max_length', '2019-10-18 02:35:39.311054'),
(17, 'auth', '0011_update_proxy_permissions', '2019-10-18 02:35:39.320823'),
(18, 'sessions', '0001_initial', '2019-10-18 02:35:39.347750'),
(19, 'django_x509', '0001_initial', '2019-10-18 06:15:02.638869'),
(20, 'django_x509', '0002_certificate', '2019-10-18 06:15:02.675815'),
(21, 'django_x509', '0003_rename_organization_field', '2019-10-18 06:15:02.691729'),
(22, 'django_x509', '0004_auto_20171207_1450', '2019-10-18 06:15:02.746581'),
(23, 'django_x509', '0005_organizational_unit_name', '2019-10-18 06:15:02.774562'),
(24, 'aps', '0002_masterkey', '2019-10-24 05:48:42.382957'),
(25, 'aps', '0003_auto_20191024_1257', '2019-10-24 05:59:25.891353'),
(26, 'aps', '0004_master', '2019-10-24 05:59:25.905494'),
(27, 'aps', '0005_auto_20191024_1303', '2019-10-24 06:03:27.855716');

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
('ceqptfxgpb2tp8e4cfqdlynywk3ekzx1', 'NjZjNmNiOTRhZDQwY2E2OTk2YWQwY2FkNzllNmZhYzhiNjA5ZDA4MDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwODM4MmNkYjk0YWYzNDZiNDBmZDcxNzAxNDc3YjcwZTdlZmRiODA5In0=', '2019-11-07 06:00:49.816369'),
('i16m0oelp7r42fhvqyc1f1ca4jgj6e46', 'MTIxNjJlYmYyNzJlYmE5M2U5ZDYzOGM1YzNmNzZlYmEzNmMxOGEwNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYTg1MjI4ZmI4ZjQzMTQ5MmQxNTFjZTgxYjI2NDRhNDhiZjUyYTk5In0=', '2019-11-01 08:16:19.816231'),
('l3jwcm95fn1cc9ofkrmdx6erc0dxodue', 'ZGVlYjZmZGY2ZGM2ZjU2ZjYzMjFmZWY3MzlhYjkyMWUzYjNmMDQzYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNjZmZTUzYjA0NWQ5NWQ5OTA5YjkzZmMzNmMyYTFiMjAwODNlOGVlIn0=', '2019-11-04 03:14:56.858564'),
('pmat913k4gx975gttqesb0yyjh2gj6dh', 'MTIxNjJlYmYyNzJlYmE5M2U5ZDYzOGM1YzNmNzZlYmEzNmMxOGEwNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYTg1MjI4ZmI4ZjQzMTQ5MmQxNTFjZTgxYjI2NDRhNDhiZjUyYTk5In0=', '2019-11-04 09:16:27.051789'),
('sytxlt0r8osvv6r4snz7mifcg50iekio', 'MTIxNjJlYmYyNzJlYmE5M2U5ZDYzOGM1YzNmNzZlYmEzNmMxOGEwNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYTg1MjI4ZmI4ZjQzMTQ5MmQxNTFjZTgxYjI2NDRhNDhiZjUyYTk5In0=', '2019-11-04 02:29:58.663392'),
('w8p9i38bpwnkrfqd7335kn5nu6n5kprb', 'MTIxNjJlYmYyNzJlYmE5M2U5ZDYzOGM1YzNmNzZlYmEzNmMxOGEwNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYTg1MjI4ZmI4ZjQzMTQ5MmQxNTFjZTgxYjI2NDRhNDhiZjUyYTk5In0=', '2019-11-04 00:59:08.746675');

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
-- Table structure for table `masterkey`
--

CREATE TABLE `masterkey` (
  `no` int(11) NOT NULL,
  `id` varchar(100) NOT NULL,
  `kunci` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `masterkey`
--

INSERT INTO `masterkey` (`no`, `id`, `kunci`) VALUES
(1, '2', 'gAAAAABdsUMI47--KvjZl9PSQWSrZ5uHVi9aidTYZ6mmYp5_mO6mQd0NAc4HiM17WpTKvC5_z63_9FyE8CTQAJGloZFET-Ni5w==');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `masterkey`
--
ALTER TABLE `masterkey`
  ADD PRIMARY KEY (`no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aps_userprofileinfo`
--
ALTER TABLE `aps_userprofileinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `django_x509_ca`
--
ALTER TABLE `django_x509_ca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_x509_cert`
--
ALTER TABLE `django_x509_cert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `masterkey`
--
ALTER TABLE `masterkey`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

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
