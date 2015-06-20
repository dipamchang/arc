-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 20, 2015 at 08:15 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bits_arc`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add course', 7, 'add_course'),
(20, 'Can change course', 7, 'change_course'),
(21, 'Can delete course', 7, 'delete_course'),
(22, 'Can add schedule', 8, 'add_schedule'),
(23, 'Can change schedule', 8, 'change_schedule'),
(24, 'Can delete schedule', 8, 'delete_schedule'),
(25, 'Can add timing', 9, 'add_timing'),
(26, 'Can change timing', 9, 'change_timing'),
(27, 'Can delete timing', 9, 'delete_timing'),
(28, 'Can add timetable', 10, 'add_timetable'),
(29, 'Can change timetable', 10, 'change_timetable'),
(30, 'Can delete timetable', 10, 'delete_timetable');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$12000$DxneMGtYm5qH$cowd88wfRrrpr7GJYlRGG4bW7f76D6GecdFuC66FQ9o=', '2015-04-25 05:26:47', 1, 'admin', '', '', 'gnarula94@gmail.com', 1, 1, '2015-04-08 11:34:20');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_e8701ad4` (`user_id`),
  KEY `auth_user_groups_0e939a4f` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  KEY `auth_user_user_permissions_8373b171` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_417f1b1c` (`content_type_id`),
  KEY `django_admin_log_e8701ad4` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=127 ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2015-04-09 06:09:28', '86', 'Biological Laboratory P5', 2, 'Changed capacity.', 8, 1),
(2, '2015-04-09 06:18:27', '1', 'Timetable object', 2, 'Changed capacity.', 10, 1),
(3, '2015-04-09 06:32:08', '86', 'Biological Laboratory P5', 2, 'No fields changed.', 8, 1),
(4, '2015-04-09 06:39:18', '86', 'Biological Laboratory P5', 2, 'Changed capacity.', 8, 1),
(5, '2015-04-09 06:45:48', '1', 'Timetable object', 2, 'Changed capacity.', 10, 1),
(6, '2015-04-09 06:45:55', '1', 'Timetable object', 2, 'No fields changed.', 10, 1),
(7, '2015-04-09 06:45:57', '1', 'Timetable object', 2, 'No fields changed.', 10, 1),
(8, '2015-04-09 06:50:57', '1', 'Timetable object', 2, 'Changed capacity.', 10, 1),
(9, '2015-04-09 06:53:57', '1', 'Timetable object', 2, 'Changed capacity.', 10, 1),
(10, '2015-04-09 06:57:03', '1', 'Timetable object', 2, 'No fields changed.', 10, 1),
(11, '2015-04-09 07:00:52', '86', 'Biological Laboratory P5', 2, 'Changed capacity.', 8, 1),
(12, '2015-04-09 07:30:56', '126', 'Chemistry Laboratory P8', 2, 'Changed capacity.', 8, 1),
(13, '2015-04-09 07:32:24', '118', 'Chemistry Laboratory P15', 2, 'Changed capacity.', 8, 1),
(14, '2015-04-09 07:35:28', '5', 'Timetable object', 2, 'Changed capacity.', 10, 1),
(15, '2015-04-18 05:20:22', '268', 'Chemistry Laboratory P10', 2, 'Changed capacity.', 8, 1),
(16, '2015-04-22 09:01:01', '288', 'General Chemistry T8', 3, '', 8, 1),
(17, '2015-04-22 09:01:01', '287', 'General Chemistry L8', 3, '', 8, 1),
(18, '2015-04-22 09:01:01', '286', 'General Chemistry T7', 3, '', 8, 1),
(19, '2015-04-22 09:01:01', '285', 'General Chemistry L7', 3, '', 8, 1),
(20, '2015-04-22 09:01:01', '284', 'General Chemistry T6', 3, '', 8, 1),
(21, '2015-04-22 09:01:01', '283', 'General Chemistry L6', 3, '', 8, 1),
(22, '2015-04-22 09:01:01', '282', 'General Chemistry T5', 3, '', 8, 1),
(23, '2015-04-22 09:01:01', '281', 'General Chemistry L5', 3, '', 8, 1),
(24, '2015-04-22 09:01:01', '280', 'General Chemistry T4', 3, '', 8, 1),
(25, '2015-04-22 09:01:01', '279', 'General Chemistry L4', 3, '', 8, 1),
(26, '2015-04-22 09:01:01', '278', 'General Chemistry T3', 3, '', 8, 1),
(27, '2015-04-22 09:01:01', '277', 'General Chemistry L3', 3, '', 8, 1),
(28, '2015-04-22 09:01:01', '276', 'General Chemistry T2', 3, '', 8, 1),
(29, '2015-04-22 09:01:02', '275', 'General Chemistry L2', 3, '', 8, 1),
(30, '2015-04-22 09:01:02', '274', 'General Chemistry T1', 3, '', 8, 1),
(31, '2015-04-22 09:01:02', '273', 'General Chemistry L1', 3, '', 8, 1),
(32, '2015-04-22 09:01:02', '272', 'Chemistry Laboratory P2', 3, '', 8, 1),
(33, '2015-04-22 09:01:02', '271', 'Chemistry Laboratory P9', 3, '', 8, 1),
(34, '2015-04-22 09:01:02', '270', 'Chemistry Laboratory P8', 3, '', 8, 1),
(35, '2015-04-22 09:01:02', '269', 'Chemistry Laboratory P1', 3, '', 8, 1),
(36, '2015-04-22 09:01:02', '268', 'Chemistry Laboratory P10', 3, '', 8, 1),
(37, '2015-04-22 09:01:02', '267', 'Chemistry Laboratory P7', 3, '', 8, 1),
(38, '2015-04-22 09:01:02', '266', 'Chemistry Laboratory P6', 3, '', 8, 1),
(39, '2015-04-22 09:01:02', '265', 'Chemistry Laboratory P5', 3, '', 8, 1),
(40, '2015-04-22 09:01:02', '264', 'Chemistry Laboratory P4', 3, '', 8, 1),
(41, '2015-04-22 09:01:02', '263', 'Chemistry Laboratory P3', 3, '', 8, 1),
(42, '2015-04-22 09:01:02', '262', 'Chemistry Laboratory P15', 3, '', 8, 1),
(43, '2015-04-22 09:01:02', '261', 'Chemistry Laboratory P14', 3, '', 8, 1),
(44, '2015-04-22 09:01:02', '260', 'Chemistry Laboratory P13', 3, '', 8, 1),
(45, '2015-04-22 09:01:02', '259', 'Chemistry Laboratory P12', 3, '', 8, 1),
(46, '2015-04-22 09:01:02', '258', 'Chemistry Laboratory P11', 3, '', 8, 1),
(47, '2015-04-22 09:01:02', '257', 'General Biology T8', 3, '', 8, 1),
(48, '2015-04-22 09:01:02', '256', 'General Biology L8', 3, '', 8, 1),
(49, '2015-04-22 09:01:02', '255', 'General Biology T7', 3, '', 8, 1),
(50, '2015-04-22 09:01:03', '254', 'General Biology L7', 3, '', 8, 1),
(51, '2015-04-22 09:01:03', '253', 'General Biology T4', 3, '', 8, 1),
(52, '2015-04-22 09:01:03', '252', 'General Biology L4', 3, '', 8, 1),
(53, '2015-04-22 09:01:03', '251', 'General Biology T3', 3, '', 8, 1),
(54, '2015-04-22 09:01:03', '250', 'General Biology L3', 3, '', 8, 1),
(55, '2015-04-22 09:01:03', '249', 'General Biology T2', 3, '', 8, 1),
(56, '2015-04-22 09:01:03', '248', 'General Biology L2', 3, '', 8, 1),
(57, '2015-04-22 09:01:03', '247', 'General Biology T6', 3, '', 8, 1),
(58, '2015-04-22 09:01:03', '246', 'General Biology L6', 3, '', 8, 1),
(59, '2015-04-22 09:01:03', '245', 'General Biology T5', 3, '', 8, 1),
(60, '2015-04-22 09:01:03', '244', 'General Biology L5', 3, '', 8, 1),
(61, '2015-04-22 09:01:03', '243', 'General Biology T1', 3, '', 8, 1),
(62, '2015-04-22 09:01:03', '242', 'General Biology L1', 3, '', 8, 1),
(63, '2015-04-22 09:01:03', '241', 'Biological Laboratory P2', 3, '', 8, 1),
(64, '2015-04-22 09:01:03', '240', 'Biological Laboratory P15', 3, '', 8, 1),
(65, '2015-04-22 09:01:03', '239', 'Biological Laboratory P14', 3, '', 8, 1),
(66, '2015-04-22 09:01:03', '238', 'Biological Laboratory P13', 3, '', 8, 1),
(67, '2015-04-22 09:01:03', '237', 'Biological Laboratory P12', 3, '', 8, 1),
(68, '2015-04-22 09:01:04', '236', 'Biological Laboratory P11', 3, '', 8, 1),
(69, '2015-04-22 09:01:04', '235', 'Biological Laboratory P10', 3, '', 8, 1),
(70, '2015-04-22 09:01:04', '234', 'Biological Laboratory P9', 3, '', 8, 1),
(71, '2015-04-22 09:01:04', '233', 'Biological Laboratory P8', 3, '', 8, 1),
(72, '2015-04-22 09:01:04', '232', 'Biological Laboratory P7', 3, '', 8, 1),
(73, '2015-04-22 09:01:04', '231', 'Biological Laboratory P6', 3, '', 8, 1),
(74, '2015-04-22 09:01:04', '230', 'Biological Laboratory P5', 3, '', 8, 1),
(75, '2015-04-22 09:01:04', '229', 'Biological Laboratory P4', 3, '', 8, 1),
(76, '2015-04-22 09:01:04', '228', 'Biological Laboratory P3', 3, '', 8, 1),
(77, '2015-04-22 09:01:04', '227', 'Biological Laboratory P1', 3, '', 8, 1),
(78, '2015-04-22 09:01:04', '226', 'Workshop Practice P5', 3, '', 8, 1),
(79, '2015-04-22 09:01:04', '225', 'Workshop Practice P6', 3, '', 8, 1),
(80, '2015-04-22 09:01:04', '224', 'Workshop Practice P4', 3, '', 8, 1),
(81, '2015-04-22 09:01:04', '223', 'Workshop Practice P3', 3, '', 8, 1),
(82, '2015-04-22 09:01:04', '222', 'Workshop Practice P2', 3, '', 8, 1),
(83, '2015-04-22 09:01:04', '221', 'Workshop Practice P1', 3, '', 8, 1),
(84, '2015-04-22 09:01:04', '220', 'Mathematics-I T4', 3, '', 8, 1),
(85, '2015-04-22 09:01:04', '219', 'Mathematics-I L4', 3, '', 8, 1),
(86, '2015-04-22 09:01:04', '218', 'Mathematics-I T3', 3, '', 8, 1),
(87, '2015-04-22 09:01:04', '217', 'Mathematics-I L3', 3, '', 8, 1),
(88, '2015-04-22 09:01:04', '216', 'Mathematics-I T2', 3, '', 8, 1),
(89, '2015-04-22 09:01:04', '215', 'Mathematics-I L2', 3, '', 8, 1),
(90, '2015-04-22 09:01:04', '214', 'Mathematics-I T1', 3, '', 8, 1),
(91, '2015-04-22 09:01:04', '213', 'Mathematics-I L1', 3, '', 8, 1),
(92, '2015-04-22 09:01:04', '212', 'Mathematics-I T8', 3, '', 8, 1),
(93, '2015-04-22 09:01:04', '211', 'Mathematics-I L8', 3, '', 8, 1),
(94, '2015-04-22 09:01:04', '210', 'Mathematics-I T7', 3, '', 8, 1),
(95, '2015-04-22 09:01:05', '209', 'Mathematics-I L7', 3, '', 8, 1),
(96, '2015-04-22 09:01:05', '208', 'Mathematics-I T6', 3, '', 8, 1),
(97, '2015-04-22 09:01:05', '207', 'Mathematics-I L6', 3, '', 8, 1),
(98, '2015-04-22 09:01:05', '206', 'Mathematics-I T5', 3, '', 8, 1),
(99, '2015-04-22 09:01:05', '205', 'Mathematics-I L5', 3, '', 8, 1),
(100, '2015-04-22 09:01:05', '204', 'Probability & Statistics T4', 3, '', 8, 1),
(101, '2015-04-22 09:01:05', '203', 'Probability & Statistics T3', 3, '', 8, 1),
(102, '2015-04-22 09:01:05', '202', 'Probability & Statistics T2', 3, '', 8, 1),
(103, '2015-04-22 09:01:05', '201', 'Probability & Statistics T1', 3, '', 8, 1),
(104, '2015-04-22 09:01:05', '200', 'Probability & Statistics L1', 3, '', 8, 1),
(105, '2015-04-22 09:01:05', '199', 'Tech Report Writing T3', 3, '', 8, 1),
(106, '2015-04-22 09:01:05', '198', 'Tech Report Writing L3', 3, '', 8, 1),
(107, '2015-04-22 09:01:05', '197', 'Tech Report Writing T2', 3, '', 8, 1),
(108, '2015-04-22 09:01:05', '196', 'Tech Report Writing L2', 3, '', 8, 1),
(109, '2015-04-22 09:01:05', '195', 'Tech Report Writing T1', 3, '', 8, 1),
(110, '2015-04-22 09:01:05', '194', 'Tech Report Writing L1', 3, '', 8, 1),
(111, '2015-04-22 09:01:06', '193', 'Engineering Graphics P6', 3, '', 8, 1),
(112, '2015-04-22 09:01:06', '192', 'Engineering Graphics P5', 3, '', 8, 1),
(113, '2015-04-22 09:01:06', '191', 'Engineering Graphics P4', 3, '', 8, 1),
(114, '2015-04-22 09:01:06', '190', 'Engineering Graphics P3', 3, '', 8, 1),
(115, '2015-04-22 09:01:06', '189', 'Engineering Graphics P2', 3, '', 8, 1),
(116, '2015-04-22 09:02:02', 'PHY F111', 'Mech Oscil & Waves', 3, '', 7, 1),
(117, '2015-04-22 09:02:02', 'PHY F110', 'Physics Laboratory', 3, '', 7, 1),
(118, '2015-04-22 09:02:02', 'ME F110', 'Workshop Practice', 3, '', 7, 1),
(119, '2015-04-22 09:02:02', 'MATH F113', 'Probability & Statistics', 3, '', 7, 1),
(120, '2015-04-22 09:02:02', 'MATH F111', 'Mathematics-I', 3, '', 7, 1),
(121, '2015-04-22 09:02:02', 'CHEM F111', 'General Chemistry', 3, '', 7, 1),
(122, '2015-04-22 09:02:02', 'CHEM F110', 'Chemistry Laboratory', 3, '', 7, 1),
(123, '2015-04-22 09:02:02', 'BITS F112', 'Tech Report Writing', 3, '', 7, 1),
(124, '2015-04-22 09:02:02', 'BITS F110', 'Engineering Graphics', 3, '', 7, 1),
(125, '2015-04-22 09:02:02', 'BIO F111', 'General Biology', 3, '', 7, 1),
(126, '2015-04-22 09:02:02', 'BIO F110', 'Biological Laboratory', 3, '', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'log entry', 'admin', 'logentry'),
(2, 'permission', 'auth', 'permission'),
(3, 'group', 'auth', 'group'),
(4, 'user', 'auth', 'user'),
(5, 'content type', 'contenttypes', 'contenttype'),
(6, 'session', 'sessions', 'session'),
(7, 'course', 'timetable', 'course'),
(8, 'schedule', 'timetable', 'schedule'),
(9, 'timing', 'timetable', 'timing'),
(10, 'timetable', 'timetable', 'timetable');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2015-04-08 11:25:59'),
(2, 'auth', '0001_initial', '2015-04-08 11:26:02'),
(3, 'admin', '0001_initial', '2015-04-08 11:26:03'),
(4, 'sessions', '0001_initial', '2015-04-08 11:26:03'),
(5, 'timetable', '0001_initial', '2015-04-08 11:26:06'),
(6, 'timetable', '0002_timetable_card_number', '2015-04-08 11:26:06'),
(7, 'timetable', '0003_auto_20150316_0733', '2015-04-08 11:26:07'),
(8, 'timetable', '0004_auto_20150424_1655', '2015-04-24 11:26:10');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('vjy38y3vmkmfe03sjxoivk4asa8o9y78', 'NmU0YTk0MGM0MThlYWYyYmMzY2E0MjhjMjgxMTAxYWU2MTlhZGY2ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjllYmY3NzIxMTNmMTc2NDMxOTQzNTAxOTZjNDEwZTgwZmU4ZjgwMDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2015-04-23 05:53:07'),
('z31o9uw9xzmmwnioh6fxhowgmbni0v8i', 'NmU0YTk0MGM0MThlYWYyYmMzY2E0MjhjMjgxMTAxYWU2MTlhZGY2ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjllYmY3NzIxMTNmMTc2NDMxOTQzNTAxOTZjNDEwZTgwZmU4ZjgwMDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2015-05-09 05:26:47');

-- --------------------------------------------------------

--
-- Table structure for table `timetable_course`
--

CREATE TABLE IF NOT EXISTS `timetable_course` (
  `id` varchar(10) NOT NULL,
  `name` varchar(40) NOT NULL,
  `grd` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timetable_course`
--

INSERT INTO `timetable_course` (`id`, `name`, `grd`) VALUES
('BIO F110', 'Biological Laboratory', 1027),
('BIO F111', 'General Biology', 1672),
('BITS F110', 'Engineering Graphics', NULL),
('BITS F112', 'Tech Report Writing', 1137),
('CHEM F110', 'Chemistry Laboratory', 1147),
('CHEM F111', 'General Chemistry', 1163),
('MATH F111', 'Mathematics-I', 1611),
('MATH F113', 'Probability & Statistics', NULL),
('ME F110', 'Workshop Practice', 1664),
('PHY F110', 'Physics Laboratory', 3890),
('PHY F111', 'Mech Oscil & Waves', 1686);

-- --------------------------------------------------------

--
-- Table structure for table `timetable_schedule`
--

CREATE TABLE IF NOT EXISTS `timetable_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_nbr` int(11) NOT NULL,
  `capacity` int(11) NOT NULL,
  `section` varchar(3) NOT NULL,
  `type` varchar(1) NOT NULL,
  `location` varchar(7) NOT NULL,
  `course_id` varchar(10) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `timetable_schedule_2eb935c9` (`class_nbr`),
  KEY `timetable_schedule_ea134da7` (`course_id`),
  KEY `timetable_schedule_6be37982` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=433 ;

--
-- Dumping data for table `timetable_schedule`
--

INSERT INTO `timetable_schedule` (`id`, `class_nbr`, `capacity`, `section`, `type`, `location`, `course_id`, `parent_id`) VALUES
(289, 1760, 25, 'T4', 'T', 'C-404', 'PHY F111', 290),
(290, 1760, 25, 'L4', 'L', 'LT1', 'PHY F111', NULL),
(291, 1761, 55, 'T5', 'T', 'A-603', 'PHY F111', 292),
(292, 1761, 55, 'L5', 'L', 'LT1', 'PHY F111', NULL),
(293, 1762, 55, 'L6', 'L', 'LT1', 'PHY F111', NULL),
(294, 1762, 55, 'T6', 'T', 'A-604', 'PHY F111', 293),
(295, 1763, 55, 'L7', 'L', 'LT1', 'PHY F111', NULL),
(296, 1763, 55, 'T7', 'T', 'C-301', 'PHY F111', 295),
(297, 1764, 55, 'L8', 'L', 'LT1', 'PHY F111', NULL),
(298, 1764, 55, 'T8', 'T', 'C-302', 'PHY F111', 297),
(299, 1766, 55, 'T10', 'T', 'C-404', 'PHY F111', 300),
(300, 1766, 55, 'L10', 'L', 'LT1', 'PHY F111', NULL),
(301, 1767, 55, 'T11', 'T', 'A-603', 'PHY F111', 302),
(302, 1767, 55, 'L11', 'L', 'LT1', 'PHY F111', NULL),
(303, 1768, 55, 'T12', 'T', 'A-604', 'PHY F111', 304),
(304, 1768, 55, 'L12', 'L', 'LT1', 'PHY F111', NULL),
(305, 1765, 55, 'L9', 'L', 'LT1', 'PHY F111', NULL),
(306, 1765, 55, 'T9', 'T', 'C-402', 'PHY F111', 305),
(307, 1659, 55, 'T1', 'T', 'C-301', 'PHY F111', 308),
(308, 1659, 55, 'L1', 'L', 'LT1', 'PHY F111', NULL),
(309, 1660, 55, 'T2', 'T', 'C-302', 'PHY F111', 310),
(310, 1660, 55, 'L2', 'L', 'LT1', 'PHY F111', NULL),
(311, 1759, 55, 'T3', 'T', 'C-402', 'PHY F111', 312),
(312, 1759, 55, 'L3', 'L', 'LT1', 'PHY F111', NULL),
(313, 1888, 30, 'P14', 'P', '', 'PHY F110', NULL),
(314, 1889, 30, 'P15', 'P', '', 'PHY F110', NULL),
(315, 1657, 30, 'P1', 'P', '', 'PHY F110', NULL),
(316, 1658, 20, 'P2', 'P', '', 'PHY F110', NULL),
(317, 1877, 30, 'P3', 'P', '', 'PHY F110', NULL),
(318, 1878, 30, 'P4', 'P', '', 'PHY F110', NULL),
(319, 1879, 10, 'P5', 'P', '', 'PHY F110', NULL),
(320, 1880, 30, 'P6', 'P', '', 'PHY F110', NULL),
(321, 1881, 30, 'P7', 'P', '', 'PHY F110', NULL),
(322, 1882, 30, 'P8', 'P', '', 'PHY F110', NULL),
(323, 1883, 30, 'P9', 'P', '', 'PHY F110', NULL),
(324, 1884, 30, 'P10', 'P', '', 'PHY F110', NULL),
(325, 1885, 30, 'P11', 'P', '', 'PHY F110', NULL),
(326, 1886, 30, 'P12', 'P', '', 'PHY F110', NULL),
(327, 1887, 30, 'P13', 'P', '', 'PHY F110', NULL),
(328, 1126, 300, 'L1', 'L', 'LT1', 'BITS F110', NULL),
(329, 1127, 110, 'T1', 'T', 'LT1', 'BITS F110', 328),
(330, 1128, 100, 'T2', 'T', 'C-401', 'BITS F110', 328),
(331, 1129, 110, 'T3', 'T', 'A-602', 'BITS F110', 328),
(332, 1131, 52, 'P1', 'P', 'CC-219', 'BITS F110', NULL),
(333, 1132, 52, 'P2', 'P', 'CC-219', 'BITS F110', NULL),
(334, 1133, 52, 'P3', 'P', 'CC-219', 'BITS F110', NULL),
(335, 1134, 52, 'P4', 'P', 'CC-219', 'BITS F110', NULL),
(336, 1135, 52, 'P5', 'P', 'CC-219', 'BITS F110', NULL),
(337, 1136, 52, 'P6', 'P', 'CC-219', 'BITS F110', NULL),
(338, 1097, 110, 'L1', 'L', 'C-401', 'BITS F112', NULL),
(339, 1097, 110, 'T1', 'T', 'LT1', 'BITS F112', 338),
(340, 1098, 110, 'L2', 'L', 'LT4', 'BITS F112', NULL),
(341, 1098, 110, 'T2', 'T', 'LT4', 'BITS F112', 340),
(342, 1099, 90, 'L3', 'L', 'A-605', 'BITS F112', NULL),
(343, 1099, 90, 'T3', 'T', 'LT2', 'BITS F112', 342),
(344, 2986, 310, 'L1', 'L', 'LT1', 'MATH F113', NULL),
(345, 1614, 70, 'T1', 'T', 'C-401', 'MATH F113', 344),
(346, 1616, 80, 'T2', 'T', 'C-306', 'MATH F113', 344),
(347, 1617, 80, 'T3', 'T', 'C-405', 'MATH F113', 344),
(348, 1618, 80, 'T4', 'T', 'C-301', 'MATH F113', 344),
(349, 1600, 75, 'L5', 'L', 'LT1', 'MATH F111', NULL),
(350, 1600, 75, 'T5', 'T', 'C-302', 'MATH F111', 349),
(351, 1601, 85, 'L6', 'L', 'LT1', 'MATH F111', NULL),
(352, 1601, 85, 'T6', 'T', 'C-401', 'MATH F111', 351),
(353, 1602, 85, 'L7', 'L', 'LT1', 'MATH F111', NULL),
(354, 1602, 85, 'T7', 'T', 'C-404', 'MATH F111', 353),
(355, 1603, 85, 'L8', 'L', 'LT1', 'MATH F111', NULL),
(356, 1603, 85, 'T8', 'T', 'A-603', 'MATH F111', 355),
(357, 1595, 85, 'L1', 'L', 'LT1', 'MATH F111', NULL),
(358, 1595, 85, 'T1', 'T', 'A-501', 'MATH F111', 357),
(359, 1597, 65, 'L2', 'L', 'LT1', 'MATH F111', NULL),
(360, 1597, 65, 'T2', 'T', 'C-401', 'MATH F111', 359),
(361, 1598, 85, 'L3', 'L', 'LT1', 'MATH F111', NULL),
(362, 1598, 85, 'T3', 'T', 'C-404', 'MATH F111', 361),
(363, 1599, 85, 'L4', 'L', 'LT1', 'MATH F111', NULL),
(364, 1599, 85, 'T4', 'T', 'A-603', 'MATH F111', 363),
(365, 1665, 55, 'P1', 'P', '', 'ME F110', NULL),
(366, 1666, 55, 'P2', 'P', '', 'ME F110', NULL),
(367, 1667, 35, 'P3', 'P', '', 'ME F110', NULL),
(368, 1668, 55, 'P4', 'P', '', 'ME F110', NULL),
(369, 1670, 55, 'P6', 'P', '', 'ME F110', NULL),
(370, 1669, 55, 'P5', 'P', '', 'ME F110', NULL),
(371, 1028, 24, 'P1', 'P', 'C-103', 'BIO F110', NULL),
(372, 1030, 24, 'P3', 'P', 'C-103', 'BIO F110', NULL),
(373, 1031, 24, 'P4', 'P', 'C-103', 'BIO F110', NULL),
(374, 1032, 24, 'P5', 'P', 'C-103', 'BIO F110', NULL),
(375, 1033, 4, 'P6', 'P', 'C-103', 'BIO F110', NULL),
(376, 1034, 24, 'P7', 'P', 'C-103', 'BIO F110', NULL),
(377, 1035, 24, 'P8', 'P', 'C-103', 'BIO F110', NULL),
(378, 1036, 24, 'P9', 'P', 'C-103', 'BIO F110', NULL),
(379, 1037, 24, 'P10', 'P', 'C-103', 'BIO F110', NULL),
(380, 1038, 24, 'P11', 'P', 'C-103', 'BIO F110', NULL),
(381, 1039, 24, 'P12', 'P', 'C-103', 'BIO F110', NULL),
(382, 1040, 24, 'P13', 'P', 'C-103', 'BIO F110', NULL),
(383, 1041, 24, 'P14', 'P', 'C-103', 'BIO F110', NULL),
(384, 1042, 24, 'P15', 'P', 'C-103', 'BIO F110', NULL),
(385, 1029, 24, 'P2', 'P', 'C-103', 'BIO F110', NULL),
(386, 1217, 65, 'L1', 'L', 'LT1', 'BIO F111', NULL),
(387, 1217, 65, 'T1', 'T', 'C-306', 'BIO F111', 386),
(388, 1873, 85, 'L5', 'L', 'LT1', 'BIO F111', NULL),
(389, 1873, 85, 'T5', 'T', 'C-306', 'BIO F111', 388),
(390, 1874, 75, 'L6', 'L', 'LT1', 'BIO F111', NULL),
(391, 1874, 75, 'T6', 'T', 'C-402', 'BIO F111', 390),
(392, 1455, 85, 'L2', 'L', 'LT1', 'BIO F111', NULL),
(393, 1455, 85, 'T2', 'T', 'C-308', 'BIO F111', 392),
(394, 1456, 85, 'L3', 'L', 'LT1', 'BIO F111', NULL),
(395, 1456, 85, 'T3', 'T', 'C-301', 'BIO F111', 394),
(396, 1457, 85, 'L4', 'L', 'LT1', 'BIO F111', NULL),
(397, 1457, 85, 'T4', 'T', 'C-301', 'BIO F111', 396),
(398, 1875, 85, 'L7', 'L', 'LT1', 'BIO F111', NULL),
(399, 1875, 85, 'T7', 'T', 'C-308', 'BIO F111', 398),
(400, 1876, 85, 'L8', 'L', 'LT1', 'BIO F111', NULL),
(401, 1876, 85, 'T8', 'T', 'A-503', 'BIO F111', 400),
(402, 1152, 22, 'P11', 'P', 'C-111', 'CHEM F110', NULL),
(403, 1153, 22, 'P12', 'P', 'C-111', 'CHEM F110', NULL),
(404, 1154, 22, 'P13', 'P', 'C-111', 'CHEM F110', NULL),
(405, 1155, 12, 'P14', 'P', 'C-111', 'CHEM F110', NULL),
(406, 1156, 22, 'P15', 'P', 'C-111', 'CHEM F110', NULL),
(407, 1158, 22, 'P3', 'P', 'C-111', 'CHEM F110', NULL),
(408, 1159, 22, 'P4', 'P', 'C-111', 'CHEM F110', NULL),
(409, 1160, 22, 'P5', 'P', 'C-111', 'CHEM F110', NULL),
(410, 1161, 22, 'P6', 'P', 'C-111', 'CHEM F110', NULL),
(411, 1162, 22, 'P7', 'P', 'C-111', 'CHEM F110', NULL),
(412, 1151, 22, 'P10', 'P', 'C-111', 'CHEM F110', NULL),
(413, 1148, 22, 'P1', 'P', 'C-111', 'CHEM F110', NULL),
(414, 1149, 22, 'P8', 'P', 'C-111', 'CHEM F110', NULL),
(415, 1150, 22, 'P9', 'P', 'C-111', 'CHEM F110', NULL),
(416, 1157, 22, 'P2', 'P', 'C-111', 'CHEM F110', NULL),
(417, 1164, 55, 'L1', 'L', 'LT1', 'CHEM F111', NULL),
(418, 1164, 55, 'T1', 'T', 'A-502', 'CHEM F111', 417),
(419, 1166, 85, 'L2', 'L', 'LT1', 'CHEM F111', NULL),
(420, 1166, 85, 'T2', 'T', 'C-306', 'CHEM F111', 419),
(421, 1168, 85, 'L3', 'L', 'LT1', 'CHEM F111', NULL),
(422, 1168, 85, 'T3', 'T', 'C-308', 'CHEM F111', 421),
(423, 1170, 85, 'L4', 'L', 'LT1', 'CHEM F111', NULL),
(424, 1170, 85, 'T4', 'T', 'C-306', 'CHEM F111', 423),
(425, 1172, 85, 'L5', 'L', 'LT1', 'CHEM F111', NULL),
(426, 1172, 85, 'T5', 'T', 'A-503', 'CHEM F111', 425),
(427, 1174, 85, 'L6', 'L', 'LT1', 'CHEM F111', NULL),
(428, 1174, 85, 'T6', 'T', 'C-306', 'CHEM F111', 427),
(429, 1176, 85, 'L7', 'L', 'LT1', 'CHEM F111', NULL),
(430, 1176, 85, 'T7', 'T', 'C-308', 'CHEM F111', 429),
(431, 1178, 85, 'L8', 'L', 'LT1', 'CHEM F111', NULL),
(432, 1178, 85, 'T8', 'T', 'C-308', 'CHEM F111', 431);

-- --------------------------------------------------------

--
-- Table structure for table `timetable_timetable`
--

CREATE TABLE IF NOT EXISTS `timetable_timetable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `current_capacity` int(11) DEFAULT NULL,
  `card_number` varchar(40) NOT NULL,
  `max_capacity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `card_number` (`card_number`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `timetable_timetable`
--

INSERT INTO `timetable_timetable` (`id`, `current_capacity`, `card_number`, `max_capacity`) VALUES
(1, 19, 'R_WS_1', 20),
(2, 9, 'R_EG_1', 10);

-- --------------------------------------------------------

--
-- Table structure for table `timetable_timetable_schedules`
--

CREATE TABLE IF NOT EXISTS `timetable_timetable_schedules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timetable_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `timetable_id` (`timetable_id`,`schedule_id`),
  KEY `timetable_timetable_schedules_3b1b59f0` (`timetable_id`),
  KEY `timetable_timetable_schedules_9bc70bb9` (`schedule_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `timetable_timetable_schedules`
--

INSERT INTO `timetable_timetable_schedules` (`id`, `timetable_id`, `schedule_id`) VALUES
(2, 1, 289),
(1, 1, 290),
(3, 1, 319),
(4, 1, 342),
(5, 1, 343),
(6, 1, 359),
(7, 1, 360),
(8, 1, 367),
(9, 1, 375),
(10, 1, 386),
(11, 1, 387),
(12, 1, 417),
(13, 1, 418),
(15, 2, 289),
(14, 2, 290),
(16, 2, 316),
(17, 2, 328),
(18, 2, 330),
(19, 2, 344),
(20, 2, 345),
(21, 2, 349),
(22, 2, 350),
(23, 2, 390),
(24, 2, 391),
(25, 2, 405),
(26, 2, 417),
(27, 2, 418);

-- --------------------------------------------------------

--
-- Table structure for table `timetable_timing`
--

CREATE TABLE IF NOT EXISTS `timetable_timing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `day_of_week` varchar(10) DEFAULT NULL,
  `schedule_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `timetable_timing_9bc70bb9` (`schedule_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=682 ;

--
-- Dumping data for table `timetable_timing`
--

INSERT INTO `timetable_timing` (`id`, `start_time`, `end_time`, `day_of_week`, `schedule_id`) VALUES
(455, '08:00:00', '09:00:00', 'T', 289),
(456, '09:00:00', '10:00:00', 'M', 290),
(457, '09:00:00', '10:00:00', 'W', 290),
(458, '09:00:00', '10:00:00', 'F', 290),
(459, '08:00:00', '09:00:00', 'T', 291),
(460, '09:00:00', '10:00:00', 'M', 292),
(461, '09:00:00', '10:00:00', 'W', 292),
(462, '09:00:00', '10:00:00', 'F', 292),
(463, '09:00:00', '10:00:00', 'M', 293),
(464, '09:00:00', '10:00:00', 'W', 293),
(465, '09:00:00', '10:00:00', 'F', 293),
(466, '08:00:00', '09:00:00', 'T', 294),
(467, '10:00:00', '11:00:00', 'T', 295),
(468, '10:00:00', '11:00:00', 'Th', 295),
(469, '10:00:00', '11:00:00', 'S', 295),
(470, '08:00:00', '09:00:00', 'Th', 296),
(471, '10:00:00', '11:00:00', 'T', 297),
(472, '10:00:00', '11:00:00', 'Th', 297),
(473, '10:00:00', '11:00:00', 'S', 297),
(474, '08:00:00', '09:00:00', 'Th', 298),
(475, '08:00:00', '09:00:00', 'Th', 299),
(476, '10:00:00', '11:00:00', 'T', 300),
(477, '10:00:00', '11:00:00', 'Th', 300),
(478, '10:00:00', '11:00:00', 'S', 300),
(479, '08:00:00', '09:00:00', 'Th', 301),
(480, '10:00:00', '11:00:00', 'T', 302),
(481, '10:00:00', '11:00:00', 'Th', 302),
(482, '10:00:00', '11:00:00', 'S', 302),
(483, '08:00:00', '09:00:00', 'Th', 303),
(484, '10:00:00', '11:00:00', 'T', 304),
(485, '10:00:00', '11:00:00', 'Th', 304),
(486, '10:00:00', '11:00:00', 'S', 304),
(487, '10:00:00', '11:00:00', 'T', 305),
(488, '10:00:00', '11:00:00', 'Th', 305),
(489, '10:00:00', '11:00:00', 'S', 305),
(490, '10:00:00', '11:00:00', 'Th', 306),
(491, '08:00:00', '09:00:00', 'T', 307),
(492, '09:00:00', '10:00:00', 'M', 308),
(493, '09:00:00', '10:00:00', 'W', 308),
(494, '09:00:00', '10:00:00', 'F', 308),
(495, '08:00:00', '09:00:00', 'T', 309),
(496, '09:00:00', '10:00:00', 'M', 310),
(497, '09:00:00', '10:00:00', 'W', 310),
(498, '09:00:00', '10:00:00', 'F', 310),
(499, '08:00:00', '09:00:00', 'T', 311),
(500, '09:00:00', '10:00:00', 'M', 312),
(501, '09:00:00', '10:00:00', 'W', 312),
(502, '09:00:00', '10:00:00', 'F', 312),
(503, '11:00:00', '13:00:00', 'F', 313),
(504, '14:00:00', '16:00:00', 'F', 314),
(505, '09:00:00', '11:00:00', 'M', 315),
(506, '11:00:00', '13:00:00', 'M', 316),
(507, '14:00:00', '16:00:00', 'M', 317),
(508, '09:00:00', '11:00:00', 'T', 318),
(509, '11:00:00', '13:00:00', 'T', 319),
(510, '14:00:00', '16:00:00', 'T', 320),
(511, '09:00:00', '11:00:00', 'W', 321),
(512, '11:00:00', '13:00:00', 'W', 322),
(513, '14:00:00', '16:00:00', 'W', 323),
(514, '09:00:00', '11:00:00', 'Th', 324),
(515, '11:00:00', '13:00:00', 'Th', 325),
(516, '14:00:00', '16:00:00', 'Th', 326),
(517, '09:00:00', '11:00:00', 'F', 327),
(518, '16:00:00', '17:00:00', 'T', 328),
(519, '16:00:00', '17:00:00', 'Th', 329),
(520, '14:00:00', '15:00:00', 'W', 330),
(521, '16:00:00', '17:00:00', 'Th', 331),
(522, '11:00:00', '13:00:00', 'M', 332),
(523, '14:00:00', '16:00:00', 'T', 333),
(524, '09:00:00', '11:00:00', 'F', 334),
(525, '14:00:00', '16:00:00', 'F', 335),
(526, '09:00:00', '11:00:00', 'S', 336),
(527, '11:00:00', '13:00:00', 'S', 337),
(528, '16:00:00', '17:00:00', 'T', 338),
(529, '16:00:00', '17:00:00', 'Th', 338),
(530, '08:00:00', '09:00:00', 'M', 339),
(531, '16:00:00', '17:00:00', 'M', 340),
(532, '16:00:00', '17:00:00', 'W', 340),
(533, '16:00:00', '17:00:00', 'F', 341),
(534, '16:00:00', '17:00:00', 'T', 342),
(535, '16:00:00', '17:00:00', 'Th', 342),
(536, '08:00:00', '09:00:00', 'M', 343),
(537, '16:00:00', '17:00:00', 'M', 344),
(538, '16:00:00', '17:00:00', 'W', 344),
(539, '16:00:00', '17:00:00', 'F', 344),
(540, '08:00:00', '09:00:00', 'M', 345),
(541, '08:00:00', '09:00:00', 'M', 346),
(542, '08:00:00', '09:00:00', 'S', 347),
(543, '08:00:00', '09:00:00', 'W', 348),
(544, '11:00:00', '12:00:00', 'T', 349),
(545, '11:00:00', '12:00:00', 'Th', 349),
(546, '11:00:00', '12:00:00', 'S', 349),
(547, '08:00:00', '09:00:00', 'W', 350),
(548, '11:00:00', '12:00:00', 'T', 351),
(549, '11:00:00', '12:00:00', 'Th', 351),
(550, '11:00:00', '12:00:00', 'S', 351),
(551, '08:00:00', '09:00:00', 'W', 352),
(552, '11:00:00', '12:00:00', 'T', 353),
(553, '11:00:00', '12:00:00', 'Th', 353),
(554, '11:00:00', '12:00:00', 'S', 353),
(555, '08:00:00', '09:00:00', 'W', 354),
(556, '11:00:00', '12:00:00', 'T', 355),
(557, '11:00:00', '12:00:00', 'Th', 355),
(558, '11:00:00', '12:00:00', 'S', 355),
(559, '08:00:00', '09:00:00', 'W', 356),
(560, '12:00:00', '13:00:00', 'M', 357),
(561, '12:00:00', '13:00:00', 'W', 357),
(562, '12:00:00', '13:00:00', 'F', 357),
(563, '08:00:00', '09:00:00', 'F', 358),
(564, '12:00:00', '13:00:00', 'M', 359),
(565, '12:00:00', '13:00:00', 'W', 359),
(566, '12:00:00', '13:00:00', 'F', 359),
(567, '08:00:00', '09:00:00', 'F', 360),
(568, '12:00:00', '13:00:00', 'M', 361),
(569, '12:00:00', '13:00:00', 'W', 361),
(570, '12:00:00', '13:00:00', 'F', 361),
(571, '08:00:00', '09:00:00', 'F', 362),
(572, '12:00:00', '13:00:00', 'M', 363),
(573, '12:00:00', '13:00:00', 'W', 363),
(574, '12:00:00', '13:00:00', 'F', 363),
(575, '08:00:00', '09:00:00', 'F', 364),
(576, '09:00:00', '11:00:00', 'M', 365),
(577, '09:00:00', '11:00:00', 'W', 365),
(578, '11:00:00', '13:00:00', 'M', 366),
(579, '11:00:00', '13:00:00', 'W', 366),
(580, '14:00:00', '16:00:00', 'M', 367),
(581, '14:00:00', '16:00:00', 'W', 367),
(582, '09:00:00', '11:00:00', 'T', 368),
(583, '09:00:00', '11:00:00', 'Th', 368),
(584, '14:00:00', '16:00:00', 'T', 369),
(585, '14:00:00', '16:00:00', 'Th', 369),
(586, '11:00:00', '13:00:00', 'T', 370),
(587, '11:00:00', '13:00:00', 'Th', 370),
(588, '09:00:00', '11:00:00', 'M', 371),
(589, '14:00:00', '16:00:00', 'M', 372),
(590, '09:00:00', '11:00:00', 'T', 373),
(591, '11:00:00', '13:00:00', 'T', 374),
(592, '14:00:00', '16:00:00', 'T', 375),
(593, '09:00:00', '11:00:00', 'W', 376),
(594, '11:00:00', '13:00:00', 'W', 377),
(595, '14:00:00', '16:00:00', 'W', 378),
(596, '09:00:00', '11:00:00', 'Th', 379),
(597, '11:00:00', '13:00:00', 'Th', 380),
(598, '14:00:00', '16:00:00', 'Th', 381),
(599, '09:00:00', '11:00:00', 'F', 382),
(600, '11:00:00', '13:00:00', 'F', 383),
(601, '14:00:00', '16:00:00', 'F', 384),
(602, '11:00:00', '13:00:00', 'M', 385),
(603, '11:00:00', '12:00:00', 'M', 386),
(604, '11:00:00', '12:00:00', 'W', 386),
(605, '11:00:00', '12:00:00', 'F', 386),
(606, '08:00:00', '09:00:00', 'S', 387),
(607, '12:00:00', '13:00:00', 'T', 388),
(608, '12:00:00', '13:00:00', 'Th', 388),
(609, '12:00:00', '13:00:00', 'S', 388),
(610, '08:00:00', '09:00:00', 'F', 389),
(611, '12:00:00', '13:00:00', 'T', 390),
(612, '12:00:00', '13:00:00', 'Th', 390),
(613, '12:00:00', '13:00:00', 'S', 390),
(614, '08:00:00', '09:00:00', 'F', 391),
(615, '11:00:00', '12:00:00', 'M', 392),
(616, '11:00:00', '12:00:00', 'W', 392),
(617, '11:00:00', '12:00:00', 'F', 392),
(618, '08:00:00', '09:00:00', 'S', 393),
(619, '11:00:00', '12:00:00', 'M', 394),
(620, '11:00:00', '12:00:00', 'W', 394),
(621, '11:00:00', '12:00:00', 'F', 394),
(622, '15:00:00', '16:00:00', 'Th', 395),
(623, '11:00:00', '12:00:00', 'M', 396),
(624, '11:00:00', '12:00:00', 'W', 396),
(625, '11:00:00', '12:00:00', 'F', 396),
(626, '15:00:00', '16:00:00', 'M', 397),
(627, '12:00:00', '13:00:00', 'T', 398),
(628, '12:00:00', '13:00:00', 'Th', 398),
(629, '12:00:00', '13:00:00', 'S', 398),
(630, '08:00:00', '09:00:00', 'F', 399),
(631, '12:00:00', '13:00:00', 'T', 400),
(632, '12:00:00', '13:00:00', 'Th', 400),
(633, '12:00:00', '13:00:00', 'S', 400),
(634, '08:00:00', '09:00:00', 'F', 401),
(635, '11:00:00', '13:00:00', 'Th', 402),
(636, '14:00:00', '16:00:00', 'Th', 403),
(637, '09:00:00', '11:00:00', 'F', 404),
(638, '11:00:00', '13:00:00', 'F', 405),
(639, '14:00:00', '16:00:00', 'F', 406),
(640, '14:00:00', '16:00:00', 'M', 407),
(641, '09:00:00', '11:00:00', 'T', 408),
(642, '11:00:00', '13:00:00', 'T', 409),
(643, '14:00:00', '16:00:00', 'T', 410),
(644, '09:00:00', '11:00:00', 'W', 411),
(645, '09:00:00', '11:00:00', 'Th', 412),
(646, '09:00:00', '11:00:00', 'M', 413),
(647, '11:00:00', '13:00:00', 'W', 414),
(648, '14:00:00', '16:00:00', 'W', 415),
(649, '11:00:00', '13:00:00', 'M', 416),
(650, '10:00:00', '11:00:00', 'M', 417),
(651, '10:00:00', '11:00:00', 'W', 417),
(652, '10:00:00', '11:00:00', 'F', 417),
(653, '08:00:00', '09:00:00', 'Th', 418),
(654, '10:00:00', '11:00:00', 'M', 419),
(655, '10:00:00', '11:00:00', 'W', 419),
(656, '10:00:00', '11:00:00', 'F', 419),
(657, '08:00:00', '09:00:00', 'Th', 420),
(658, '10:00:00', '11:00:00', 'M', 421),
(659, '10:00:00', '11:00:00', 'W', 421),
(660, '10:00:00', '11:00:00', 'F', 421),
(661, '08:00:00', '09:00:00', 'Th', 422),
(662, '10:00:00', '11:00:00', 'M', 423),
(663, '10:00:00', '11:00:00', 'W', 423),
(664, '10:00:00', '11:00:00', 'F', 423),
(665, '15:00:00', '16:00:00', 'T', 424),
(666, '09:00:00', '10:00:00', 'T', 425),
(667, '09:00:00', '10:00:00', 'Th', 425),
(668, '09:00:00', '10:00:00', 'S', 425),
(669, '08:00:00', '09:00:00', 'T', 426),
(670, '09:00:00', '10:00:00', 'T', 427),
(671, '09:00:00', '10:00:00', 'Th', 427),
(672, '09:00:00', '10:00:00', 'S', 427),
(673, '08:00:00', '09:00:00', 'T', 428),
(674, '09:00:00', '10:00:00', 'T', 429),
(675, '09:00:00', '10:00:00', 'Th', 429),
(676, '09:00:00', '10:00:00', 'S', 429),
(677, '08:00:00', '09:00:00', 'T', 430),
(678, '09:00:00', '10:00:00', 'T', 431),
(679, '09:00:00', '10:00:00', 'Th', 431),
(680, '09:00:00', '10:00:00', 'S', 431),
(681, '15:00:00', '16:00:00', 'Th', 432);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `timetable_schedule`
--
ALTER TABLE `timetable_schedule`
  ADD CONSTRAINT `timetable_sche_course_id_230bb9e91ebf4f72_fk_timetable_course_id` FOREIGN KEY (`course_id`) REFERENCES `timetable_course` (`id`),
  ADD CONSTRAINT `timetable_sc_parent_id_5919e25e17dcf6e3_fk_timetable_schedule_id` FOREIGN KEY (`parent_id`) REFERENCES `timetable_schedule` (`id`);

--
-- Constraints for table `timetable_timetable_schedules`
--
ALTER TABLE `timetable_timetable_schedules`
  ADD CONSTRAINT `timetable__schedule_id_6f9c161bf910050e_fk_timetable_schedule_id` FOREIGN KEY (`schedule_id`) REFERENCES `timetable_schedule` (`id`),
  ADD CONSTRAINT `timetabl_timetable_id_3f945297ee4e1ac1_fk_timetable_timetable_id` FOREIGN KEY (`timetable_id`) REFERENCES `timetable_timetable` (`id`);

--
-- Constraints for table `timetable_timing`
--
ALTER TABLE `timetable_timing`
  ADD CONSTRAINT `timetable__schedule_id_700e008f2c46c2d1_fk_timetable_schedule_id` FOREIGN KEY (`schedule_id`) REFERENCES `timetable_schedule` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
