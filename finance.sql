-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- 主機: localhost
-- 建立日期: 2016 年 03 月 07 日 02:36
-- 伺服器版本: 5.5.47-0ubuntu0.14.04.1
-- PHP 版本: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 資料庫: `finance`
--

-- --------------------------------------------------------

--
-- 資料表結構 `account_emailaddress`
--

CREATE TABLE IF NOT EXISTS `account_emailaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_5c85949e40d9a61d_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 資料表結構 `account_emailconfirmation`
--

CREATE TABLE IF NOT EXISTS `account_emailconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `sent` datetime DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `acc_email_address_id_5bcf9f503c32d4d8_fk_account_emailaddress_id` (`email_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 資料表結構 `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 資料表結構 `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 資料表結構 `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- 資料表的匯出資料 `auth_permission`
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
(19, 'Can add site', 7, 'add_site'),
(20, 'Can change site', 7, 'change_site'),
(21, 'Can delete site', 7, 'delete_site'),
(22, 'Can add email address', 8, 'add_emailaddress'),
(23, 'Can change email address', 8, 'change_emailaddress'),
(24, 'Can delete email address', 8, 'delete_emailaddress'),
(25, 'Can add email confirmation', 9, 'add_emailconfirmation'),
(26, 'Can change email confirmation', 9, 'change_emailconfirmation'),
(27, 'Can delete email confirmation', 9, 'delete_emailconfirmation'),
(28, 'Can add social application', 10, 'add_socialapp'),
(29, 'Can change social application', 10, 'change_socialapp'),
(30, 'Can delete social application', 10, 'delete_socialapp'),
(31, 'Can add social account', 11, 'add_socialaccount'),
(32, 'Can change social account', 11, 'change_socialaccount'),
(33, 'Can delete social account', 11, 'delete_socialaccount'),
(34, 'Can add social application token', 12, 'add_socialtoken'),
(35, 'Can change social application token', 12, 'change_socialtoken'),
(36, 'Can delete social application token', 12, 'delete_socialtoken');

-- --------------------------------------------------------

--
-- 資料表結構 `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET latin1 NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) CHARACTER SET latin1 NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 資料表的匯出資料 `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$20000$4axam9TdJQuO$AwQ7F4YTVE1ZkQw1Uv7iwlw8lqZKfctzl6NcR9vPXOg=', '2016-02-04 13:39:02', 1, 'jerry', '', '', 'ba911y2@gmail.com', 1, 1, '2016-02-04 06:36:55'),
(5, '!WQ3DDINgByfRjcR6gNqJU8bYrAH3Wc7AVF7odCJm', '2016-02-12 12:13:04', 0, 'user', '振皓', '李', '', 0, 1, '2016-02-04 09:15:23'),
(6, 'pbkdf2_sha256$20000$DThgPHyfJbIi$+T1lrcehI9tcql6GSL4uAKeKmILVO+46q04cQ55/FE8=', '2016-02-27 08:05:37', 0, '123456', '', '', '', 0, 1, '2016-02-12 11:39:24');

-- --------------------------------------------------------

--
-- 資料表結構 `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 資料表結構 `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 資料表結構 `django_admin_log`
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
  KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- 資料表的匯出資料 `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2016-02-04 06:37:19', '1', 'http://104.199.157.95:8000/', 2, 'Changed domain and name.', 7, 1),
(2, '2016-02-04 06:43:28', '1', 'FB', 1, '', 10, 1),
(3, '2016-02-04 08:57:33', '2', 'user', 3, '', 4, 1),
(4, '2016-02-04 09:13:56', '3', 'user', 3, '', 4, 1),
(5, '2016-02-04 09:15:19', '4', 'user', 3, '', 4, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- 資料表的匯出資料 `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(8, 'account', 'emailaddress'),
(9, 'account', 'emailconfirmation'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'sites', 'site'),
(11, 'socialaccount', 'socialaccount'),
(10, 'socialaccount', 'socialapp'),
(12, 'socialaccount', 'socialtoken');

-- --------------------------------------------------------

--
-- 資料表結構 `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- 資料表的匯出資料 `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2016-02-01 12:52:55'),
(2, 'auth', '0001_initial', '2016-02-01 12:52:55'),
(3, 'admin', '0001_initial', '2016-02-01 12:52:55'),
(4, 'contenttypes', '0002_remove_content_type_name', '2016-02-01 12:52:56'),
(5, 'auth', '0002_alter_permission_name_max_length', '2016-02-01 12:52:56'),
(6, 'auth', '0003_alter_user_email_max_length', '2016-02-01 12:52:56'),
(7, 'auth', '0004_alter_user_username_opts', '2016-02-01 12:52:56'),
(8, 'auth', '0005_alter_user_last_login_null', '2016-02-01 12:52:56'),
(9, 'auth', '0006_require_contenttypes_0002', '2016-02-01 12:52:56'),
(10, 'sessions', '0001_initial', '2016-02-01 12:52:56'),
(11, 'account', '0001_initial', '2016-02-04 06:31:52'),
(12, 'account', '0002_email_max_length', '2016-02-04 06:31:52'),
(13, 'sites', '0001_initial', '2016-02-04 06:31:52'),
(14, 'socialaccount', '0001_initial', '2016-02-04 06:31:52'),
(15, 'socialaccount', '0002_token_max_lengths', '2016-02-04 06:31:52');

-- --------------------------------------------------------

--
-- 資料表結構 `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('06aeca0dykgz0v3gcs8yu2nr33nkkh7s', 'OGZmMmM3NTU1NDZhNzFmOWEzZmUxYmYxODY4MTY0ODg5MTRiOWE3ZDp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiNDVjYzE2M2NlOGJjYjEwNjE4NzliODVmMmNhMTgyZjIwZGE4NjQ2YiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjYiLCJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sIm9UdkpCeDRPWDJFQSJdfQ==', '2016-03-11 03:00:09'),
('23gpayqyi8ag6alua9xwxs13m509dn0v', 'Mjc4NmVjZGQ5MDdlZDVlOTIxY2RmMTQ1MmQyNGJjYzExNDIwMzVhZjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiNDVjYzE2M2NlOGJjYjEwNjE4NzliODVmMmNhMTgyZjIwZGE4NjQ2YiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjYifQ==', '2016-03-03 06:38:18'),
('3zwji8cxb9eio4gd6orq4w5vtwqydt0z', 'Mjc4NmVjZGQ5MDdlZDVlOTIxY2RmMTQ1MmQyNGJjYzExNDIwMzVhZjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiNDVjYzE2M2NlOGJjYjEwNjE4NzliODVmMmNhMTgyZjIwZGE4NjQ2YiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjYifQ==', '2016-03-02 06:14:49'),
('6f62sg0s8oglrwbqswsyr64ovqd4m6wg', 'Mjc4NmVjZGQ5MDdlZDVlOTIxY2RmMTQ1MmQyNGJjYzExNDIwMzVhZjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiNDVjYzE2M2NlOGJjYjEwNjE4NzliODVmMmNhMTgyZjIwZGE4NjQ2YiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjYifQ==', '2016-03-03 08:56:35'),
('6obg8v5g7sdfnkp9u9jz2qzjlh8j6o8p', 'N2EzOGE3YmZiMzBiOTc5ZWUzYjIwMTlkZGY0ZjA2MTMxOGQ3N2FiNjp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIifSwiS0ZDUXdsOWt3MlZjIl19', '2016-02-25 12:58:32'),
('9k9eigqfnphirf9qf8psv5n4i07kp1mp', 'Mjc4NmVjZGQ5MDdlZDVlOTIxY2RmMTQ1MmQyNGJjYzExNDIwMzVhZjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiNDVjYzE2M2NlOGJjYjEwNjE4NzliODVmMmNhMTgyZjIwZGE4NjQ2YiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjYifQ==', '2016-03-12 08:05:37'),
('arxgi02fqnnuoy7vgkie1af5sblvcomh', 'ZThjNzQ4YTdkYzcyY2ZlNzAyZWQ1ODJmN2EwZTM3ZWI5YjVlYWZiNDp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiNDVjYzE2M2NlOGJjYjEwNjE4NzliODVmMmNhMTgyZjIwZGE4NjQ2YiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjYiLCJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sInFSVEY4ZTkwOVJkdSJdfQ==', '2016-02-28 08:53:25'),
('atvvgayie4czjw03zhag14w4anlmx6bs', 'ODVjZTYzODQxMzY2MThkNzI0MjNkOWJiZjFhZDVmZGE2OGI5MTBiMDp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiNDVjYzE2M2NlOGJjYjEwNjE4NzliODVmMmNhMTgyZjIwZGE4NjQ2YiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjYiLCJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sIk0xaHFRaG9tbExYVCJdfQ==', '2016-03-04 03:27:27'),
('f1o6vs0z9u3ahn6qjofdot1gh8rzif8c', 'MDZlYzUxNDgyNTlmZGFlZmMyNjdlYWMyNmU4OTNhZDQ5MzVkZDVlZjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiNDVjYzE2M2NlOGJjYjEwNjE4NzliODVmMmNhMTgyZjIwZGE4NjQ2YiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjYiLCJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sIld2d0lHZEVVOFVaMyJdfQ==', '2016-02-26 14:51:41'),
('f7c3zev9xe88dsih9vtwnybji0q1fwkb', 'ZGNmNzkwY2U0ZDU3M2RhYWRjZDA5ZjkwOTQ1NmUwY2MzMGVkYThjOTp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiNDVjYzE2M2NlOGJjYjEwNjE4NzliODVmMmNhMTgyZjIwZGE4NjQ2YiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjYiLCJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sImN1aldDOEZRS2dLZiJdfQ==', '2016-03-01 14:34:28'),
('fatlppoybpj7enepqyvrd9kny51kt32x', 'NWMwZmFjMGFhZWUyMjNjOWUzYjU4NDZhODkzMTk0MzE3ZTc0MTc2ODp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiNDVjYzE2M2NlOGJjYjEwNjE4NzliODVmMmNhMTgyZjIwZGE4NjQ2YiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjYiLCJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sInhQTXUxNlE0end2cCJdfQ==', '2016-03-02 18:02:22'),
('g9imdw7yh84q9zi0nvuw2jmhljpp4u14', 'Mjc4NmVjZGQ5MDdlZDVlOTIxY2RmMTQ1MmQyNGJjYzExNDIwMzVhZjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiNDVjYzE2M2NlOGJjYjEwNjE4NzliODVmMmNhMTgyZjIwZGE4NjQ2YiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjYifQ==', '2016-03-03 01:59:53'),
('l1kujbrhr7z95cv5e0lilpl7nlrzcqng', 'ZjkxZDlmOWY5NmQ2MDMyMjUwODA0YWM5MjJkMDYxOTkwNDQwZThjOTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU0MTZlYTE0MDRhNjRjZWNhMTM3ODYyNzE0NTBlM2MzODk1ODIyZDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiNSJ9', '2016-02-18 09:18:56'),
('p0pgdby6jfynipv5jvwnp77p9mgn0fgb', 'Mjc4NmVjZGQ5MDdlZDVlOTIxY2RmMTQ1MmQyNGJjYzExNDIwMzVhZjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiNDVjYzE2M2NlOGJjYjEwNjE4NzliODVmMmNhMTgyZjIwZGE4NjQ2YiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjYifQ==', '2016-03-04 03:50:43'),
('q5fncmg7sh5fd399engc824y688yrjsp', 'M2I5ZDZiNjczZDFjMGUzODEyMjJmY2IzM2I2MGFmNmFiZTcwNTI2OTp7InNvY2lhbGFjY291bnRfc3RhdGUiOlt7InByb2Nlc3MiOiJsb2dpbiIsInNjb3BlIjoiIiwiYXV0aF9wYXJhbXMiOiIiLCJuZXh0IjoiLyJ9LCJFc1Q5N2FKalY0Z0YiXX0=', '2016-02-18 07:22:21'),
('ro86e4jbr6bfzgfdf8uc9fnyd8zncc4b', 'MjBmMjE3ZjMzNzRkN2ZkZjVlNjRmMjYyNjQ1NWFhZjFkMzhkNzFhMzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiM2VlMDFlMzkwMjRkOGE3YzkwMzM0ZGFjOTE5NTNkNTZjMzNkOWVkZCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sIlhGUmRidnVsSXdkRyJdfQ==', '2016-02-18 07:05:11'),
('ux6j3kh45plpxsxf6hokkcs4qoajagsr', 'NDg4ZGU2NDc3MjQ2ZDRhYzI4YjFkZjc0MTgxNzI0MjgzMWFlOGViMzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiNDVjYzE2M2NlOGJjYjEwNjE4NzliODVmMmNhMTgyZjIwZGE4NjQ2YiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjYiLCJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sIml0SXM3VlFoWW5rZCJdfQ==', '2016-03-06 11:25:06'),
('w8mun1w2kpzxgibmvf1q5rir9u3wpdbl', 'OTI2MjhiMTkzMDI5ZTM2MWVmOTQ4MTNlYTc3MTI0MzY0NGViNTNlMDp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiM2VlMDFlMzkwMjRkOGE3YzkwMzM0ZGFjOTE5NTNkNTZjMzNkOWVkZCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sImtvSldOS2hvWGFtdCJdfQ==', '2016-02-18 13:39:02'),
('xm7jfj1v5wpdlrs8pzup2btsz4ioqz6b', 'ZjkxZDlmOWY5NmQ2MDMyMjUwODA0YWM5MjJkMDYxOTkwNDQwZThjOTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU0MTZlYTE0MDRhNjRjZWNhMTM3ODYyNzE0NTBlM2MzODk1ODIyZDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiNSJ9', '2016-02-18 09:15:23'),
('z79poa8qf5gnm279tz1gocg8q1gdxfsd', 'ZjkxZDlmOWY5NmQ2MDMyMjUwODA0YWM5MjJkMDYxOTkwNDQwZThjOTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU0MTZlYTE0MDRhNjRjZWNhMTM3ODYyNzE0NTBlM2MzODk1ODIyZDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiNSJ9', '2016-02-26 12:13:04');

-- --------------------------------------------------------

--
-- 資料表結構 `django_site`
--

CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 資料表的匯出資料 `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'http://104.199.157.95:8000/', 'http://104.199.157.95:8000/');

-- --------------------------------------------------------

--
-- 資料表結構 `socialaccount_socialaccount`
--

CREATE TABLE IF NOT EXISTS `socialaccount_socialaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_36eec1734f431f56_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialacc_user_id_3fd78aac97693583_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 資料表的匯出資料 `socialaccount_socialaccount`
--

INSERT INTO `socialaccount_socialaccount` (`id`, `provider`, `uid`, `last_login`, `date_joined`, `extra_data`, `user_id`) VALUES
(4, 'facebook', '1275932225756662', '2016-02-12 12:13:04', '2016-02-04 09:15:23', '{"first_name": "\\u632f\\u7693", "last_name": "\\u674e", "verified": true, "name": "\\u674e\\u632f\\u7693", "locale": "zh_TW", "gender": "male", "updated_time": "2015-07-04T10:54:20+0000", "link": "https://www.facebook.com/app_scoped_user_id/1275932225756662/", "timezone": 8, "id": "1275932225756662"}', 5);

-- --------------------------------------------------------

--
-- 資料表結構 `socialaccount_socialapp`
--

CREATE TABLE IF NOT EXISTS `socialaccount_socialapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 資料表的匯出資料 `socialaccount_socialapp`
--

INSERT INTO `socialaccount_socialapp` (`id`, `provider`, `name`, `client_id`, `secret`, `key`) VALUES
(1, 'facebook', 'FB', '472207286311881', 'd9415145a3a8aa3ca464e657d7be783f', '');

-- --------------------------------------------------------

--
-- 資料表結構 `socialaccount_socialapp_sites`
--

CREATE TABLE IF NOT EXISTS `socialaccount_socialapp_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialapp_id` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialap_site_id_a859406a22be3fe_fk_django_site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 資料表的匯出資料 `socialaccount_socialapp_sites`
--

INSERT INTO `socialaccount_socialapp_sites` (`id`, `socialapp_id`, `site_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `socialaccount_socialtoken`
--

CREATE TABLE IF NOT EXISTS `socialaccount_socialtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_697928748c2e1968_uniq` (`app_id`,`account_id`),
  KEY `so_account_id_3fc809e243dd8c0a_fk_socialaccount_socialaccount_id` (`account_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 資料表的匯出資料 `socialaccount_socialtoken`
--

INSERT INTO `socialaccount_socialtoken` (`id`, `token`, `token_secret`, `expires_at`, `account_id`, `app_id`) VALUES
(4, 'CAAGteFOPm8kBAMsZBdPVP29ZA3ZAIWJSDbdugGzWXlzVj7n9ZBFcnbTtQ2jexCSUiD9bGensSVAM8qZAjaVr4ik7lCg5EncLUUjE4ooesQyQL0WoY6FHOF7nS0MGatgZCpzr8mdSHJ1lgDza2BrQU08sXPGzmSndEGU9ugOEJP6OAXmxBIHFIQgQm8PvrZClxZAFISgZAEPfloQZDZD', '', NULL, 4, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `stock_history`
--

CREATE TABLE IF NOT EXISTS `stock_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `symbolid` varchar(20) CHARACTER SET latin1 NOT NULL,
  `open` varchar(10) CHARACTER SET latin1 NOT NULL,
  `close` varchar(10) CHARACTER SET latin1 NOT NULL,
  `high` varchar(10) CHARACTER SET latin1 NOT NULL,
  `low` varchar(10) CHARACTER SET latin1 NOT NULL,
  `volume` varchar(15) CHARACTER SET latin1 NOT NULL,
  `date` datetime NOT NULL,
  `k` float NOT NULL,
  `d` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `symbolid` (`symbolid`),
  KEY `symbolid_2` (`symbolid`),
  KEY `symbolid_3` (`symbolid`),
  KEY `symbolid_4` (`symbolid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 資料表結構 `stock_list`
--

CREATE TABLE IF NOT EXISTS `stock_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `symbolid` varchar(10) NOT NULL,
  `symbol` varchar(10) NOT NULL,
  `start` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `symbolid` (`symbolid`),
  KEY `symbolid_2` (`symbolid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=829 ;

--
-- 資料表的匯出資料 `stock_list`
--

INSERT INTO `stock_list` (`id`, `symbolid`, `symbol`, `start`, `type`) VALUES
(1, '1101', '台泥', '1962-02-09 00:00:00', '水泥工業'),
(2, '1102', '亞泥', '1962-06-08 00:00:00', '水泥工業'),
(3, '1103', '嘉泥', '1969-11-14 00:00:00', '水泥工業'),
(4, '1104', '環泥', '1971-02-01 00:00:00', '水泥工業'),
(5, '1108', '幸福', '1990-06-06 00:00:00', '水泥工業'),
(6, '1109', '信大', '1991-12-05 00:00:00', '水泥工業'),
(7, '1110', '東泥', '1994-10-22 00:00:00', '水泥工業'),
(8, '1201', '味全', '1962-02-09 00:00:00', '食品工業'),
(9, '1203', '味王', '1964-08-24 00:00:00', '食品工業'),
(10, '1210', '大成', '1978-05-20 00:00:00', '食品工業'),
(11, '1213', '大飲', '1981-04-10 00:00:00', '食品工業'),
(12, '1215', '卜蜂', '1987-07-27 00:00:00', '食品工業'),
(13, '1216', '統一', '1987-12-28 00:00:00', '食品工業'),
(14, '1217', '愛之味', '1989-10-28 00:00:00', '食品工業'),
(15, '1218', '泰山', '1989-11-11 00:00:00', '食品工業'),
(16, '1219', '福壽', '1990-12-01 00:00:00', '食品工業'),
(17, '1220', '台榮', '1991-11-20 00:00:00', '食品工業'),
(18, '1225', '福懋油', '1993-09-27 00:00:00', '食品工業'),
(19, '1227', '佳格', '1994-04-09 00:00:00', '食品工業'),
(20, '1229', '聯華', '1976-07-19 00:00:00', '食品工業'),
(21, '1231', '聯華食', '1995-11-02 00:00:00', '食品工業'),
(22, '1232', '大統益', '1996-02-09 00:00:00', '食品工業'),
(23, '1233', '天仁', '1999-01-20 00:00:00', '食品工業'),
(24, '1234', '黑松', '1999-03-12 00:00:00', '食品工業'),
(25, '1235', '興泰', '2000-09-11 00:00:00', '食品工業'),
(26, '1236', '宏亞', '2001-09-17 00:00:00', '食品工業'),
(27, '1262', 'F-綠悅', '2014-01-16 00:00:00', '其他業'),
(28, '1301', '台塑', '1964-07-27 00:00:00', '塑膠工業'),
(29, '1303', '南亞', '1967-11-05 00:00:00', '塑膠工業'),
(30, '1304', '台聚', '1972-05-20 00:00:00', '塑膠工業'),
(31, '1305', '華夏', '1973-03-05 00:00:00', '塑膠工業'),
(32, '1307', '三芳', '1985-11-23 00:00:00', '塑膠工業'),
(33, '1308', '亞聚', '1986-06-20 00:00:00', '塑膠工業'),
(34, '1309', '台達化', '1986-06-27 00:00:00', '塑膠工業'),
(35, '1310', '台苯', '1987-08-06 00:00:00', '塑膠工業'),
(36, '1312', '國喬', '1988-12-21 00:00:00', '塑膠工業'),
(37, '1313', '聯成', '1989-03-27 00:00:00', '塑膠工業'),
(38, '1314', '中石化', '1991-07-12 00:00:00', '塑膠工業'),
(39, '1315', '達新', '1992-05-09 00:00:00', '塑膠工業'),
(40, '1316', '上曜', '1992-10-15 00:00:00', '化學工業'),
(41, '1319', '東陽', '1994-12-12 00:00:00', '塑膠工業'),
(42, '1321', '大洋', '1999-01-26 00:00:00', '塑膠工業'),
(43, '1323', '永裕', '2000-09-11 00:00:00', '塑膠工業'),
(44, '1324', '地球', '2000-09-11 00:00:00', '塑膠工業'),
(45, '1325', '恆大', '2000-09-11 00:00:00', '塑膠工業'),
(46, '1326', '台化', '1984-12-20 00:00:00', '塑膠工業'),
(47, '1337', 'F-再生', '2011-07-01 00:00:00', '塑膠工業'),
(48, '1338', 'F-廣華', '2012-12-19 00:00:00', '汽車工業'),
(49, '1339', '昭輝', '2012-04-24 00:00:00', '塑膠工業'),
(50, '1340', 'F-勝悅', '2013-12-06 00:00:00', '塑膠工業'),
(51, '1402', '遠東新', '1967-04-14 00:00:00', '紡織纖維'),
(52, '1409', '新纖', '1973-08-31 00:00:00', '紡織纖維'),
(53, '1410', '南染', '1973-10-18 00:00:00', '紡織纖維'),
(54, '1414', '東和', '1976-02-02 00:00:00', '紡織纖維'),
(55, '1416', '廣豐', '1976-04-20 00:00:00', '紡織纖維'),
(56, '1417', '嘉裕', '1976-12-28 00:00:00', '紡織纖維'),
(57, '1418', '東華', '1977-02-14 00:00:00', '紡織纖維'),
(58, '1419', '新紡', '1977-03-14 00:00:00', '紡織纖維'),
(59, '1423', '利華', '1979-04-02 00:00:00', '紡織纖維'),
(60, '1432', '大魯閣', '1982-07-26 00:00:00', '紡織纖維'),
(61, '1434', '福懋', '1985-12-24 00:00:00', '紡織纖維'),
(62, '1435', '中福', '1987-12-28 00:00:00', '其他業'),
(63, '1436', '華友聯', '1988-04-11 00:00:00', '建材營造業'),
(64, '1438', '裕豐', '1988-12-15 00:00:00', '建材營造業'),
(65, '1439', '中和', '1989-05-22 00:00:00', '紡織纖維'),
(66, '1440', '南紡', '1989-10-03 00:00:00', '紡織纖維'),
(67, '1441', '大東', '1989-10-27 00:00:00', '紡織纖維'),
(68, '1442', '名軒', '1989-11-16 00:00:00', '建材營造業'),
(69, '1443', '立益', '1990-04-21 00:00:00', '紡織纖維'),
(70, '1444', '力麗', '1990-08-08 00:00:00', '紡織纖維'),
(71, '1445', '大宇', '1991-02-05 00:00:00', '紡織纖維'),
(72, '1446', '宏和', '1991-10-15 00:00:00', '紡織纖維'),
(73, '1447', '力鵬', '1992-01-28 00:00:00', '紡織纖維'),
(74, '1449', '佳和', '1992-03-12 00:00:00', '紡織纖維'),
(75, '1451', '年興', '1992-12-21 00:00:00', '紡織纖維'),
(76, '1452', '宏益', '1992-12-28 00:00:00', '紡織纖維'),
(77, '1453', '大將', '1993-04-19 00:00:00', '紡織纖維'),
(78, '1454', '台富', '1993-05-07 00:00:00', '紡織纖維'),
(79, '1455', '集盛', '1993-10-07 00:00:00', '紡織纖維'),
(80, '1456', '怡華', '1993-12-09 00:00:00', '紡織纖維'),
(81, '1457', '宜進', '1994-10-20 00:00:00', '紡織纖維'),
(82, '1459', '聯發', '1994-10-26 00:00:00', '紡織纖維'),
(83, '1460', '宏遠', '1995-04-28 00:00:00', '紡織纖維'),
(84, '1463', '強盛', '1996-12-05 00:00:00', '紡織纖維'),
(85, '1464', '得力', '1997-01-18 00:00:00', '紡織纖維'),
(86, '1465', '偉全', '1997-09-08 00:00:00', '紡織纖維'),
(87, '1467', '南緯', '1998-12-21 00:00:00', '紡織纖維'),
(88, '1468', '昶和', '1999-01-21 00:00:00', '紡織纖維'),
(89, '1469', '理隆', '1999-02-05 00:00:00', '紡織纖維'),
(90, '1470', '大統染', '1999-05-21 00:00:00', '紡織纖維'),
(91, '1471', '首利', '2000-03-06 00:00:00', '電子零組件業'),
(92, '1472', '三洋紡', '2000-09-11 00:00:00', '紡織纖維'),
(93, '1473', '台南', '2000-09-11 00:00:00', '紡織纖維'),
(94, '1474', '弘裕', '2000-10-31 00:00:00', '紡織纖維'),
(95, '1475', '本盟', '2000-10-27 00:00:00', '紡織纖維'),
(96, '1476', '儒鴻', '2001-04-18 00:00:00', '紡織纖維'),
(97, '1477', '聚陽', '2003-01-21 00:00:00', '紡織纖維'),
(98, '1503', '士電', '1969-12-15 00:00:00', '電機機械'),
(99, '1504', '東元', '1973-11-05 00:00:00', '電機機械'),
(100, '1506', '正道', '1980-08-11 00:00:00', '電機機械'),
(101, '1507', '永大', '1989-11-09 00:00:00', '電機機械'),
(102, '1512', '瑞利', '1994-01-28 00:00:00', '電機機械'),
(103, '1513', '中興電', '1994-03-08 00:00:00', '電機機械'),
(104, '1514', '亞力', '1994-03-26 00:00:00', '電機機械'),
(105, '1515', '力山', '1995-02-04 00:00:00', '電機機械'),
(106, '1516', '川飛', '1995-04-01 00:00:00', '其他業'),
(107, '1517', '利奇', '1995-11-14 00:00:00', '電機機械'),
(108, '1519', '華城', '1997-04-16 00:00:00', '電機機械'),
(109, '1521', '大億', '1997-10-06 00:00:00', '電機機械'),
(110, '1522', '堤維西', '1997-10-06 00:00:00', '電機機械'),
(111, '1524', '耿鼎', '1998-10-30 00:00:00', '電機機械'),
(112, '1525', '江申', '1999-05-15 00:00:00', '電機機械'),
(113, '1526', '日馳', '2000-03-27 00:00:00', '電機機械'),
(114, '1527', '鑽全', '2000-06-21 00:00:00', '電機機械'),
(115, '1528', '恩德', '2000-09-11 00:00:00', '電機機械'),
(116, '1529', '樂士', '2000-09-11 00:00:00', '電機機械'),
(117, '1530', '亞崴', '2000-09-11 00:00:00', '電機機械'),
(118, '1531', '高林股', '2000-09-11 00:00:00', '電機機械'),
(119, '1532', '勤美', '2000-09-11 00:00:00', '鋼鐵工業'),
(120, '1533', '車王電', '2001-04-06 00:00:00', '電機機械'),
(121, '1535', '中宇', '2001-09-17 00:00:00', '電機機械'),
(122, '1536', '和大', '2001-09-17 00:00:00', '電機機械'),
(123, '1537', '廣隆', '2002-01-22 00:00:00', '電機機械'),
(124, '1538', '正峰新', '2002-08-26 00:00:00', '電機機械'),
(125, '1539', '巨庭', '2002-10-29 00:00:00', '電機機械'),
(126, '1540', '喬福', '2002-08-26 00:00:00', '電機機械'),
(127, '1541', '錩泰', '2003-03-19 00:00:00', '電機機械'),
(128, '1560', '中砂', '2005-01-31 00:00:00', '電機機械'),
(129, '1568', '倉佑', '2014-05-14 00:00:00', '電機機械'),
(130, '1582', '信錦', '2009-12-17 00:00:00', '電子零組件業'),
(131, '1583', '程泰', '2008-01-24 00:00:00', '電機機械'),
(132, '1589', 'F-永冠', '2012-04-27 00:00:00', '電機機械'),
(133, '1590', 'F-亞德', '2010-12-13 00:00:00', '電機機械'),
(134, '1592', 'F-英瑞', '2014-10-16 00:00:00', '電機機械'),
(135, '1603', '華電', '1968-06-03 00:00:00', '電器電纜'),
(136, '1604', '聲寶', '1970-12-14 00:00:00', '電器電纜'),
(137, '1605', '華新', '1972-11-03 00:00:00', '電器電纜'),
(138, '1608', '華榮', '1988-07-11 00:00:00', '電器電纜'),
(139, '1609', '大亞', '1988-12-12 00:00:00', '電器電纜'),
(140, '1611', '中電', '1990-01-16 00:00:00', '電器電纜'),
(141, '1612', '宏泰', '1993-05-08 00:00:00', '電器電纜'),
(142, '1613', '台一', '1995-10-20 00:00:00', '電器電纜'),
(143, '1614', '三洋電', '1997-09-18 00:00:00', '電器電纜'),
(144, '1615', '大山', '2000-03-30 00:00:00', '電器電纜'),
(145, '1616', '億泰', '2000-09-11 00:00:00', '電器電纜'),
(146, '1617', '榮星', '2000-09-11 00:00:00', '電器電纜'),
(147, '1618', '合機', '2000-09-11 00:00:00', '電器電纜'),
(148, '1626', 'F-艾美', '2013-03-21 00:00:00', '電器電纜'),
(149, '1701', '中化', '1962-02-09 00:00:00', '生技醫療業'),
(150, '1702', '南僑', '1973-05-30 00:00:00', '食品工業'),
(151, '1704', '榮化', '1977-12-17 00:00:00', '化學工業'),
(152, '1707', '葡萄王', '1982-12-20 00:00:00', '生技醫療業'),
(153, '1708', '東鹼', '1986-06-16 00:00:00', '化學工業'),
(154, '1709', '和益', '1986-07-03 00:00:00', '化學工業'),
(155, '1710', '東聯', '1987-10-21 00:00:00', '化學工業'),
(156, '1711', '永光', '1988-12-27 00:00:00', '化學工業'),
(157, '1712', '興農', '1989-12-14 00:00:00', '化學工業'),
(158, '1713', '國化', '1990-01-31 00:00:00', '化學工業'),
(159, '1714', '和桐', '1991-08-30 00:00:00', '化學工業'),
(160, '1715', '萬洲', '1992-12-28 00:00:00', '塑膠工業'),
(161, '1717', '長興', '1994-03-31 00:00:00', '化學工業'),
(162, '1718', '中纖', '1963-12-02 00:00:00', '化學工業'),
(163, '1720', '生達', '1995-12-12 00:00:00', '生技醫療業'),
(164, '1721', '三晃', '1996-05-16 00:00:00', '化學工業'),
(165, '1722', '台肥', '1998-03-24 00:00:00', '化學工業'),
(166, '1723', '中碳', '1998-11-27 00:00:00', '化學工業'),
(167, '1724', '台硝', '1995-03-30 00:00:00', '化學工業'),
(168, '1725', '元禎', '2000-09-11 00:00:00', '化學工業'),
(169, '1726', '永記', '2000-09-11 00:00:00', '化學工業'),
(170, '1727', '中華化', '2000-09-11 00:00:00', '化學工業'),
(171, '1729', '必翔', '2001-03-21 00:00:00', '生技醫療業'),
(172, '1730', '花仙子', '2001-09-17 00:00:00', '化學工業'),
(173, '1731', '美吾華', '2001-09-17 00:00:00', '生技醫療業'),
(174, '1732', '毛寶', '2001-09-17 00:00:00', '化學工業'),
(175, '1734', '杏輝', '2002-08-26 00:00:00', '生技醫療業'),
(176, '1735', '日勝化', '2002-08-26 00:00:00', '化學工業'),
(177, '1736', '喬山', '2003-01-09 00:00:00', '生技醫療業'),
(178, '1737', '臺鹽', '2003-11-18 00:00:00', '食品工業'),
(179, '1762', '中化生', '2010-12-20 00:00:00', '生技醫療業'),
(180, '1773', '勝一', '2009-02-27 00:00:00', '化學工業'),
(181, '1783', '和康生', '2013-12-20 00:00:00', '生技醫療業'),
(182, '1786', '科妍', '2013-11-12 00:00:00', '生技醫療業'),
(183, '1789', '神隆', '2011-09-29 00:00:00', '生技醫療業'),
(184, '1802', '台玻', '1973-07-20 00:00:00', '玻璃陶瓷'),
(185, '1805', '寶徠', '1989-10-20 00:00:00', '建材營造業'),
(186, '1806', '冠軍', '1992-09-29 00:00:00', '玻璃陶瓷'),
(187, '1808', '潤隆', '1994-10-26 00:00:00', '建材營造業'),
(188, '1809', '中釉', '1996-04-30 00:00:00', '玻璃陶瓷'),
(189, '1810', '和成', '1991-10-14 00:00:00', '玻璃陶瓷'),
(190, '1817', '凱撒衛', '2013-10-24 00:00:00', '玻璃陶瓷'),
(191, '1902', '台紙', '1962-02-09 00:00:00', '造紙工業'),
(192, '1903', '士紙', '1963-12-09 00:00:00', '造紙工業'),
(193, '1904', '正隆', '1971-09-10 00:00:00', '造紙工業'),
(194, '1905', '華紙', '1975-02-07 00:00:00', '造紙工業'),
(195, '1906', '寶隆', '1976-04-26 00:00:00', '造紙工業'),
(196, '1907', '永豐餘', '1977-02-22 00:00:00', '造紙工業'),
(197, '1909', '榮成', '1985-11-19 00:00:00', '造紙工業'),
(198, '2002', '中鋼', '1974-12-26 00:00:00', '鋼鐵工業'),
(199, '2006', '東鋼', '1988-07-13 00:00:00', '鋼鐵工業'),
(200, '2007', '燁興', '1988-10-04 00:00:00', '鋼鐵工業'),
(201, '2008', '高興昌', '1988-12-28 00:00:00', '鋼鐵工業'),
(202, '2009', '第一銅', '1989-10-20 00:00:00', '鋼鐵工業'),
(203, '2010', '春源', '1989-12-22 00:00:00', '鋼鐵工業'),
(204, '2012', '春雨', '1991-10-17 00:00:00', '鋼鐵工業'),
(205, '2013', '中鋼構', '1992-01-21 00:00:00', '鋼鐵工業'),
(206, '2014', '中鴻', '1992-02-20 00:00:00', '鋼鐵工業'),
(207, '2015', '豐興', '1992-05-25 00:00:00', '鋼鐵工業'),
(208, '2017', '官田鋼', '1992-11-02 00:00:00', '鋼鐵工業'),
(209, '2020', '美亞', '1993-04-27 00:00:00', '鋼鐵工業'),
(210, '2022', '聚亨', '1995-03-27 00:00:00', '鋼鐵工業'),
(211, '2023', '燁輝', '1995-07-28 00:00:00', '鋼鐵工業'),
(212, '2024', '志聯', '1995-12-30 00:00:00', '鋼鐵工業'),
(213, '2025', '千興', '1996-02-08 00:00:00', '鋼鐵工業'),
(214, '2027', '大成鋼', '1996-10-24 00:00:00', '鋼鐵工業'),
(215, '2028', '威致', '1996-12-13 00:00:00', '鋼鐵工業'),
(216, '2029', '盛餘', '1997-01-11 00:00:00', '鋼鐵工業'),
(217, '2030', '彰源', '1998-12-24 00:00:00', '鋼鐵工業'),
(218, '2031', '新光鋼', '2000-09-11 00:00:00', '鋼鐵工業'),
(219, '2032', '新鋼', '2000-09-11 00:00:00', '鋼鐵工業'),
(220, '2033', '佳大', '2000-09-11 00:00:00', '鋼鐵工業'),
(221, '2034', '允強', '2001-09-17 00:00:00', '鋼鐵工業'),
(222, '2038', '海光', '2008-12-30 00:00:00', '鋼鐵工業'),
(223, '2049', '上銀', '2009-06-26 00:00:00', '電機機械'),
(224, '2059', '川湖', '2008-06-25 00:00:00', '電子零組件業'),
(225, '2062', '橋椿', '2007-11-16 00:00:00', '其他業'),
(226, '2101', '南港', '1963-11-01 00:00:00', '橡膠工業'),
(227, '2102', '泰豐', '1979-07-16 00:00:00', '橡膠工業'),
(228, '2103', '台橡', '1982-09-25 00:00:00', '橡膠工業'),
(229, '2104', '中橡', '1986-07-15 00:00:00', '橡膠工業'),
(230, '2105', '正新', '1987-12-07 00:00:00', '橡膠工業'),
(231, '2106', '建大', '1990-12-20 00:00:00', '橡膠工業'),
(232, '2107', '厚生', '1992-03-03 00:00:00', '橡膠工業'),
(233, '2108', '南帝', '1992-10-27 00:00:00', '橡膠工業'),
(234, '2109', '華豐', '2000-05-08 00:00:00', '橡膠工業'),
(235, '2114', '鑫永銓', '2010-12-29 00:00:00', '橡膠工業'),
(236, '2115', 'F-六暉', '2013-12-25 00:00:00', '橡膠工業'),
(237, '2201', '裕隆', '1976-07-08 00:00:00', '汽車工業'),
(238, '2204', '中華', '1991-03-12 00:00:00', '汽車工業'),
(239, '2206', '三陽', '1996-07-29 00:00:00', '汽車工業'),
(240, '2207', '和泰車', '1997-02-25 00:00:00', '汽車工業'),
(241, '2208', '台船', '2008-12-22 00:00:00', '航運業'),
(242, '2227', '裕日車', '2004-12-21 00:00:00', '汽車工業'),
(243, '2228', '劍麟', '2013-11-25 00:00:00', '電機機械'),
(244, '2231', '為升', '2010-11-19 00:00:00', '電機機械'),
(245, '2236', 'F-百達', '2015-06-03 00:00:00', '電機機械'),
(246, '2301', '光寶科', '1995-11-17 00:00:00', '電腦及週邊設備業'),
(247, '2302', '麗正', '1985-01-15 00:00:00', '半導體業'),
(248, '2303', '聯電', '1985-07-16 00:00:00', '半導體業'),
(249, '2305', '全友', '1988-10-21 00:00:00', '電腦及週邊設備業'),
(250, '2308', '台達電', '1988-12-19 00:00:00', '電子零組件業'),
(251, '2311', '日月光', '1989-07-19 00:00:00', '半導體業'),
(252, '2312', '金寶', '1989-11-07 00:00:00', '其他電子業'),
(253, '2313', '華通', '1990-07-24 00:00:00', '電子零組件業'),
(254, '2314', '台揚', '1990-08-08 00:00:00', '通信網路業'),
(255, '2316', '楠梓電', '1991-02-05 00:00:00', '電子零組件業'),
(256, '2317', '鴻海', '1991-06-18 00:00:00', '其他電子業'),
(257, '2321', '東訊', '1991-11-08 00:00:00', '通信網路業'),
(258, '2323', '中環', '1992-02-17 00:00:00', '光電業'),
(259, '2324', '仁寶', '1992-02-18 00:00:00', '電腦及週邊設備業'),
(260, '2325', '矽品', '1993-04-07 00:00:00', '半導體業'),
(261, '2327', '國巨', '1993-10-22 00:00:00', '電子零組件業'),
(262, '2328', '廣宇', '1993-11-09 00:00:00', '電子零組件業'),
(263, '2329', '華泰', '1994-04-20 00:00:00', '半導體業'),
(264, '2330', '台積電', '1994-09-05 00:00:00', '半導體業'),
(265, '2331', '精英', '1994-09-21 00:00:00', '電腦及週邊設備業'),
(266, '2332', '友訊', '1994-10-17 00:00:00', '通信網路業'),
(267, '2337', '旺宏', '1995-03-15 00:00:00', '半導體業'),
(268, '2338', '光罩', '1995-04-17 00:00:00', '半導體業'),
(269, '2340', '光磊', '1995-05-02 00:00:00', '光電業'),
(270, '2342', '茂矽', '1995-09-19 00:00:00', '半導體業'),
(271, '2344', '華邦電', '1995-10-18 00:00:00', '半導體業'),
(272, '2345', '智邦', '1995-11-15 00:00:00', '通信網路業'),
(273, '2347', '聯強', '1995-12-13 00:00:00', '電子通路業'),
(274, '2349', '錸德', '1996-04-23 00:00:00', '光電業'),
(275, '2351', '順德', '1996-04-25 00:00:00', '半導體業'),
(276, '2352', '佳世達', '1996-07-22 00:00:00', '電腦及週邊設備業'),
(277, '2353', '宏碁', '1996-09-18 00:00:00', '電腦及週邊設備業'),
(278, '2354', '鴻準', '1996-10-08 00:00:00', '其他電子業'),
(279, '2355', '敬鵬', '1996-10-14 00:00:00', '電子零組件業'),
(280, '2356', '英業達', '1996-11-13 00:00:00', '電腦及週邊設備業'),
(281, '2357', '華碩', '1996-11-14 00:00:00', '電腦及週邊設備業'),
(282, '2358', '廷鑫', '1996-12-18 00:00:00', '電腦及週邊設備業'),
(283, '2359', '所羅門', '1996-12-19 00:00:00', '其他電子業'),
(284, '2360', '致茂', '1996-12-21 00:00:00', '其他電子業'),
(285, '2362', '藍天', '1997-04-02 00:00:00', '電腦及週邊設備業'),
(286, '2363', '矽統', '1997-08-01 00:00:00', '半導體業'),
(287, '2364', '倫飛', '1997-08-11 00:00:00', '電腦及週邊設備業'),
(288, '2365', '昆盈', '1997-11-03 00:00:00', '電腦及週邊設備業'),
(289, '2367', '燿華', '1997-12-13 00:00:00', '電子零組件業'),
(290, '2368', '金像電', '1998-03-09 00:00:00', '電子零組件業'),
(291, '2369', '菱生', '1998-04-10 00:00:00', '半導體業'),
(292, '2371', '大同', '1962-02-09 00:00:00', '電機機械'),
(293, '2373', '震旦行', '1991-08-01 00:00:00', '其他電子業'),
(294, '2374', '佳能', '1995-01-16 00:00:00', '光電業'),
(295, '2375', '智寶', '1998-08-29 00:00:00', '電子零組件業'),
(296, '2376', '技嘉', '1998-09-24 00:00:00', '電腦及週邊設備業'),
(297, '2377', '微星', '1998-10-31 00:00:00', '電腦及週邊設備業'),
(298, '2379', '瑞昱', '1998-10-26 00:00:00', '半導體業'),
(299, '2380', '虹光', '1998-12-03 00:00:00', '電腦及週邊設備業'),
(300, '2382', '廣達', '1999-01-08 00:00:00', '電腦及週邊設備業'),
(301, '2383', '台光電', '1998-11-27 00:00:00', '電子零組件業'),
(302, '2387', '精元', '1999-01-25 00:00:00', '電腦及週邊設備業'),
(303, '2388', '威盛', '1999-03-05 00:00:00', '半導體業'),
(304, '2390', '云辰', '1999-06-15 00:00:00', '其他電子業'),
(305, '2392', '正崴', '1999-09-20 00:00:00', '電子零組件業'),
(306, '2393', '億光', '1999-11-04 00:00:00', '光電業'),
(307, '2395', '研華', '1999-12-13 00:00:00', '電腦及週邊設備業'),
(308, '2397', '友通', '2000-01-15 00:00:00', '電腦及週邊設備業'),
(309, '2399', '映泰', '1999-12-16 00:00:00', '電腦及週邊設備業'),
(310, '2401', '凌陽', '2000-01-27 00:00:00', '半導體業'),
(311, '2402', '毅嘉', '2000-01-14 00:00:00', '電子零組件業'),
(312, '2404', '漢唐', '2000-03-14 00:00:00', '其他電子業'),
(313, '2405', '浩鑫', '2000-03-17 00:00:00', '電腦及週邊設備業'),
(314, '2406', '國碩', '2000-04-29 00:00:00', '光電業'),
(315, '2408', '南亞科', '2000-08-17 00:00:00', '半導體業'),
(316, '2409', '友達', '2000-09-08 00:00:00', '光電業'),
(317, '2412', '中華電', '2000-10-27 00:00:00', '通信網路業'),
(318, '2413', '環科', '2000-09-11 00:00:00', '電子零組件業'),
(319, '2414', '精技', '2000-09-11 00:00:00', '電子通路業'),
(320, '2415', '錩新', '2000-09-11 00:00:00', '電子零組件業'),
(321, '2417', '圓剛', '2000-09-11 00:00:00', '電腦及週邊設備業'),
(322, '2419', '仲琦', '2000-09-11 00:00:00', '通信網路業'),
(323, '2420', '新巨', '2000-09-11 00:00:00', '電子零組件業'),
(324, '2421', '建準', '2000-09-11 00:00:00', '電子零組件業'),
(325, '2423', '固緯', '2000-09-11 00:00:00', '其他電子業'),
(326, '2424', '隴華', '2000-09-11 00:00:00', '電腦及週邊設備業'),
(327, '2425', '承啟', '2000-09-11 00:00:00', '電腦及週邊設備業'),
(328, '2426', '鼎元', '2000-09-11 00:00:00', '光電業'),
(329, '2427', '三商電', '2000-09-11 00:00:00', '資訊服務業'),
(330, '2428', '興勤', '2000-09-11 00:00:00', '電子零組件業'),
(331, '2429', '銘旺科', '2000-09-11 00:00:00', '電子零組件業'),
(332, '2430', '燦坤', '2000-09-11 00:00:00', '電子通路業'),
(333, '2431', '聯昌', '2000-09-11 00:00:00', '電子零組件業'),
(334, '2433', '互盛電', '2000-09-11 00:00:00', '其他電子業'),
(335, '2434', '統懋', '2000-09-11 00:00:00', '半導體業'),
(336, '2436', '偉詮電', '2000-09-11 00:00:00', '半導體業'),
(337, '2437', '旺詮', '2000-09-11 00:00:00', '電子零組件業'),
(338, '2439', '美律', '2000-09-11 00:00:00', '通信網路業'),
(339, '2440', '太空梭', '2000-11-10 00:00:00', '電子零組件業'),
(340, '2441', '超豐', '2000-10-26 00:00:00', '半導體業'),
(341, '2442', '新美齊', '2000-11-22 00:00:00', '電腦及週邊設備業'),
(342, '2443', '新利虹', '2001-01-03 00:00:00', '電子零組件業'),
(343, '2444', '友旺', '2000-12-08 00:00:00', '通信網路業'),
(344, '2448', '晶電', '2001-05-25 00:00:00', '光電業'),
(345, '2449', '京元電', '2001-05-09 00:00:00', '半導體業'),
(346, '2450', '神腦', '2001-05-24 00:00:00', '通信網路業'),
(347, '2451', '創見', '2001-05-03 00:00:00', '半導體業'),
(348, '2453', '凌群', '2001-05-22 00:00:00', '資訊服務業'),
(349, '2454', '聯發科', '2001-07-23 00:00:00', '半導體業'),
(350, '2455', '全新', '2002-01-24 00:00:00', '通信網路業'),
(351, '2457', '飛宏', '2001-09-17 00:00:00', '電子零組件業'),
(352, '2458', '義隆', '2001-09-17 00:00:00', '半導體業'),
(353, '2459', '敦吉', '2001-09-17 00:00:00', '電子通路業'),
(354, '2460', '建通', '2001-09-17 00:00:00', '電子零組件業'),
(355, '2461', '光群雷', '2001-09-17 00:00:00', '其他電子業'),
(356, '2462', '良得電', '2001-09-17 00:00:00', '電子零組件業'),
(357, '2464', '盟立', '2001-09-17 00:00:00', '其他電子業'),
(358, '2465', '麗臺', '2001-09-19 00:00:00', '電腦及週邊設備業'),
(359, '2467', '志聖', '2001-09-17 00:00:00', '電子零組件業'),
(360, '2468', '華經', '2001-09-17 00:00:00', '資訊服務業'),
(361, '2471', '資通', '2001-09-17 00:00:00', '資訊服務業'),
(362, '2472', '立隆電', '2001-09-17 00:00:00', '電子零組件業'),
(363, '2474', '可成', '2001-09-17 00:00:00', '其他電子業'),
(364, '2475', '華映', '2001-09-17 00:00:00', '光電業'),
(365, '2476', '鉅祥', '2001-09-17 00:00:00', '電子零組件業'),
(366, '2477', '美隆電', '2001-09-17 00:00:00', '其他電子業'),
(367, '2478', '大毅', '2001-09-17 00:00:00', '電子零組件業'),
(368, '2480', '敦陽科', '2001-09-17 00:00:00', '資訊服務業'),
(369, '2481', '強茂', '2001-09-17 00:00:00', '半導體業'),
(370, '2482', '連宇', '2001-09-17 00:00:00', '其他電子業'),
(371, '2483', '百容', '2001-09-17 00:00:00', '電子零組件業'),
(372, '2484', '希華', '2001-09-17 00:00:00', '電子零組件業'),
(373, '2485', '兆赫', '2001-09-17 00:00:00', '通信網路業'),
(374, '2486', '一詮', '2001-09-19 00:00:00', '光電業'),
(375, '2488', '漢平', '2001-09-17 00:00:00', '其他電子業'),
(376, '2489', '瑞軒', '2001-09-17 00:00:00', '光電業'),
(377, '2491', '吉祥全', '2001-09-17 00:00:00', '光電業'),
(378, '2492', '華新科', '2001-09-17 00:00:00', '電子零組件業'),
(379, '2493', '揚博', '2002-01-23 00:00:00', '電子零組件業'),
(380, '2495', '普安', '2002-03-25 00:00:00', '其他電子業'),
(381, '2496', '卓越', '2002-03-08 00:00:00', '通信網路業'),
(382, '2497', '怡利電', '2002-02-04 00:00:00', '其他電子業'),
(383, '2498', '宏達電', '2002-03-26 00:00:00', '通信網路業'),
(384, '2499', '東貝', '2002-02-19 00:00:00', '光電業'),
(385, '2501', '國建', '1967-10-28 00:00:00', '建材營造業'),
(386, '2505', '國揚', '1979-11-14 00:00:00', '建材營造業'),
(387, '2506', '太設', '1980-02-02 00:00:00', '建材營造業'),
(388, '2509', '全坤建', '1988-05-20 00:00:00', '建材營造業'),
(389, '2511', '太子', '1991-04-24 00:00:00', '建材營造業'),
(390, '2514', '龍邦', '1992-09-26 00:00:00', '其他業'),
(391, '2515', '中工', '1993-03-02 00:00:00', '建材營造業'),
(392, '2516', '新建', '1993-05-25 00:00:00', '建材營造業'),
(393, '2520', '冠德', '1993-10-27 00:00:00', '建材營造業'),
(394, '2524', '京城', '1994-10-18 00:00:00', '建材營造業'),
(395, '2527', '宏璟', '1995-03-06 00:00:00', '建材營造業'),
(396, '2528', '皇普', '1995-03-10 00:00:00', '建材營造業'),
(397, '2530', '華建', '1995-10-12 00:00:00', '建材營造業'),
(398, '2534', '宏盛', '1996-02-12 00:00:00', '建材營造業'),
(399, '2535', '達欣工', '1996-03-11 00:00:00', '建材營造業'),
(400, '2536', '宏普', '1996-03-14 00:00:00', '建材營造業'),
(401, '2537', '聯上發', '1996-09-06 00:00:00', '建材營造業'),
(402, '2538', '基泰', '1996-11-01 00:00:00', '建材營造業'),
(403, '2539', '櫻花建', '1997-07-16 00:00:00', '建材營造業'),
(404, '2540', '愛山林', '1989-12-26 00:00:00', '建材營造業'),
(405, '2542', '興富發', '1999-05-03 00:00:00', '建材營造業'),
(406, '2543', '皇昌', '1999-10-15 00:00:00', '建材營造業'),
(407, '2545', '皇翔', '2000-09-11 00:00:00', '建材營造業'),
(408, '2546', '根基', '2000-09-11 00:00:00', '建材營造業'),
(409, '2547', '日勝生', '2000-12-22 00:00:00', '建材營造業'),
(410, '2548', '華固', '2002-08-26 00:00:00', '建材營造業'),
(411, '2597', '潤弘', '2010-03-26 00:00:00', '建材營造業'),
(412, '2601', '益航', '1965-11-04 00:00:00', '貿易百貨業'),
(413, '2603', '長榮', '1987-09-21 00:00:00', '航運業'),
(414, '2605', '新興', '1989-12-08 00:00:00', '航運業'),
(415, '2606', '裕民', '1990-12-08 00:00:00', '航運業'),
(416, '2607', '榮運', '1990-12-14 00:00:00', '航運業'),
(417, '2608', '大榮', '1990-12-20 00:00:00', '航運業'),
(418, '2609', '陽明', '1992-04-20 00:00:00', '航運業'),
(419, '2610', '華航', '1993-02-26 00:00:00', '航運業'),
(420, '2611', '志信', '1993-10-28 00:00:00', '航運業'),
(421, '2612', '中航', '1994-10-20 00:00:00', '航運業'),
(422, '2613', '中櫃', '1995-01-20 00:00:00', '航運業'),
(423, '2614', '東森', '1995-09-23 00:00:00', '貿易百貨業'),
(424, '2615', '萬海', '1996-05-16 00:00:00', '航運業'),
(425, '2616', '山隆', '1997-11-08 00:00:00', '油電燃氣業'),
(426, '2617', '台航', '1998-06-24 00:00:00', '航運業'),
(427, '2618', '長榮航', '2001-09-17 00:00:00', '航運業'),
(428, '2634', '漢翔', '2014-08-25 00:00:00', '航運業'),
(429, '2637', 'F-慧洋', '2010-12-01 00:00:00', '航運業'),
(430, '2642', '宅配通', '2013-12-12 00:00:00', '航運業'),
(431, '2701', '萬企', '1965-03-22 00:00:00', '觀光事業'),
(432, '2702', '華園', '1965-02-14 00:00:00', '觀光事業'),
(433, '2704', '國賓', '1982-11-10 00:00:00', '觀光事業'),
(434, '2705', '六福', '1988-12-24 00:00:00', '觀光事業'),
(435, '2706', '第一店', '1991-06-25 00:00:00', '觀光事業'),
(436, '2707', '晶華', '1998-03-09 00:00:00', '觀光事業'),
(437, '2712', '遠雄來', '2013-12-03 00:00:00', '觀光事業'),
(438, '2722', '夏都', '2012-03-14 00:00:00', '觀光事業'),
(439, '2723', 'F-美食', '2010-11-22 00:00:00', '觀光事業'),
(440, '2727', '王品', '2012-03-06 00:00:00', '觀光事業'),
(441, '2731', '雄獅', '2013-09-24 00:00:00', '觀光事業'),
(442, '2801', '彰銀', '1962-02-15 00:00:00', '金融保險業'),
(443, '2809', '京城銀', '1983-07-20 00:00:00', '金融保險業'),
(444, '2812', '台中銀', '1984-05-15 00:00:00', '金融保險業'),
(445, '2816', '旺旺保', '1992-05-05 00:00:00', '金融保險業'),
(446, '2820', '華票', '1994-10-26 00:00:00', '金融保險業'),
(447, '2823', '中壽', '1995-02-08 00:00:00', '金融保險業'),
(448, '2832', '台產', '1997-09-30 00:00:00', '金融保險業'),
(449, '2834', '臺企銀', '1998-01-03 00:00:00', '金融保險業'),
(450, '2836', '高雄銀', '1998-05-18 00:00:00', '金融保險業'),
(451, '2838', '聯邦銀', '1998-06-29 00:00:00', '金融保險業'),
(452, '2841', '台開', '1999-01-08 00:00:00', '建材營造業'),
(453, '2845', '遠東銀', '1998-11-27 00:00:00', '金融保險業'),
(454, '2847', '大眾銀', '1999-02-04 00:00:00', '金融保險業'),
(455, '2849', '安泰銀', '1999-09-27 00:00:00', '金融保險業'),
(456, '2850', '新產', '2000-05-22 00:00:00', '金融保險業'),
(457, '2851', '中再保', '2000-07-06 00:00:00', '金融保險業'),
(458, '2852', '第一保', '2000-11-28 00:00:00', '金融保險業'),
(459, '2855', '統一證', '2002-09-16 00:00:00', '金融保險業'),
(460, '2856', '元富證', '2002-09-16 00:00:00', '金融保險業'),
(461, '2867', '三商壽', '2012-12-18 00:00:00', '金融保險業'),
(462, '2880', '華南金', '2001-12-19 00:00:00', '金融保險業'),
(463, '2882', '國泰金', '2001-12-31 00:00:00', '金融保險業'),
(464, '2883', '開發金', '2001-12-28 00:00:00', '金融保險業'),
(465, '2884', '玉山金', '2002-01-28 00:00:00', '金融保險業'),
(466, '2885', '元大金', '2002-02-04 00:00:00', '金融保險業'),
(467, '2886', '兆豐金', '2002-02-04 00:00:00', '金融保險業'),
(468, '2887', '台新金', '2002-02-18 00:00:00', '金融保險業'),
(469, '2888', '新光金', '2002-02-19 00:00:00', '金融保險業'),
(470, '2889', '國票金', '2002-03-26 00:00:00', '金融保險業'),
(471, '2890', '永豐金', '2002-05-09 00:00:00', '金融保險業'),
(472, '2891', '中信金', '2002-05-17 00:00:00', '金融保險業'),
(473, '2892', '第一金', '2003-01-02 00:00:00', '金融保險業'),
(474, '2901', '欣欣', '1976-05-07 00:00:00', '貿易百貨業'),
(475, '2903', '遠百', '1978-10-11 00:00:00', '貿易百貨業'),
(476, '2904', '匯僑', '1983-01-05 00:00:00', '其他業'),
(477, '2906', '高林', '1989-12-26 00:00:00', '貿易百貨業'),
(478, '2908', '特力', '1993-02-18 00:00:00', '貿易百貨業'),
(479, '2910', '統領', '1996-12-30 00:00:00', '貿易百貨業'),
(480, '2911', '麗嬰房', '1997-01-18 00:00:00', '貿易百貨業'),
(481, '2912', '統一超', '1997-08-22 00:00:00', '貿易百貨業'),
(482, '2913', '農林', '1962-02-09 00:00:00', '貿易百貨業'),
(483, '2915', '潤泰全', '1977-07-20 00:00:00', '貿易百貨業'),
(484, '2923', 'F-鼎固', '2012-12-07 00:00:00', '建材營造業'),
(485, '2929', 'F-淘帝', '2013-12-30 00:00:00', '貿易百貨業'),
(486, '3002', '歐格', '2002-01-23 00:00:00', '電腦及週邊設備業'),
(487, '3003', '健和興', '2002-02-19 00:00:00', '電子零組件業'),
(488, '3004', '豐達科', '2002-02-25 00:00:00', '鋼鐵工業'),
(489, '3005', '神基', '2002-02-25 00:00:00', '電腦及週邊設備業'),
(490, '3006', '晶豪科', '2002-03-04 00:00:00', '半導體業'),
(491, '3008', '大立光', '2002-03-11 00:00:00', '光電業'),
(492, '3010', '華立', '2002-07-22 00:00:00', '電子通路業'),
(493, '3011', '今皓', '2002-07-22 00:00:00', '電子零組件業'),
(494, '3013', '晟銘電', '2002-09-16 00:00:00', '電腦及週邊設備業'),
(495, '3014', '聯陽', '2002-10-29 00:00:00', '半導體業'),
(496, '3015', '全漢', '2002-10-16 00:00:00', '電子零組件業'),
(497, '3016', '嘉晶', '2002-12-24 00:00:00', '半導體業'),
(498, '3017', '奇鋐', '2002-09-27 00:00:00', '電腦及週邊設備業'),
(499, '3018', '同開', '2002-08-26 00:00:00', '其他電子業'),
(500, '3019', '亞光', '2002-08-26 00:00:00', '光電業'),
(501, '3021', '鴻名', '2002-08-26 00:00:00', '電子零組件業'),
(502, '3022', '威強電', '2002-08-26 00:00:00', '電腦及週邊設備業'),
(503, '3023', '信邦', '2002-08-26 00:00:00', '電子零組件業'),
(504, '3024', '憶聲', '2002-08-26 00:00:00', '光電業'),
(505, '3025', '星通', '2002-08-26 00:00:00', '通信網路業'),
(506, '3026', '禾伸堂', '2002-08-26 00:00:00', '電子零組件業'),
(507, '3027', '盛達', '2002-08-26 00:00:00', '通信網路業'),
(508, '3028', '增你強', '2002-08-26 00:00:00', '電子通路業'),
(509, '3029', '零壹', '2002-08-26 00:00:00', '資訊服務業'),
(510, '3030', '德律', '2002-10-29 00:00:00', '其他電子業'),
(511, '3031', '佰鴻', '2002-08-26 00:00:00', '光電業'),
(512, '3032', '偉訓', '2002-08-26 00:00:00', '電子零組件業'),
(513, '3033', '威健', '2002-08-26 00:00:00', '電子通路業'),
(514, '3034', '聯詠', '2002-08-26 00:00:00', '半導體業'),
(515, '3035', '智原', '2002-08-26 00:00:00', '半導體業'),
(516, '3036', '文曄', '2002-08-26 00:00:00', '電子通路業'),
(517, '3037', '欣興', '2002-08-26 00:00:00', '電子零組件業'),
(518, '3038', '全台', '2002-08-26 00:00:00', '光電業'),
(519, '3041', '揚智', '2002-08-26 00:00:00', '半導體業'),
(520, '3042', '晶技', '2002-08-26 00:00:00', '電子零組件業'),
(521, '3043', '科風', '2002-08-26 00:00:00', '其他電子業'),
(522, '3044', '健鼎', '2002-08-26 00:00:00', '電子零組件業'),
(523, '3045', '台灣大', '2002-08-26 00:00:00', '通信網路業'),
(524, '3046', '建碁', '2002-08-26 00:00:00', '電腦及週邊設備業'),
(525, '3047', '訊舟', '2002-08-26 00:00:00', '通信網路業'),
(526, '3048', '益登', '2002-10-01 00:00:00', '電子通路業'),
(527, '3049', '和鑫', '2002-09-27 00:00:00', '光電業'),
(528, '3050', '鈺德', '2002-10-29 00:00:00', '光電業'),
(529, '3051', '力特', '2002-10-28 00:00:00', '光電業'),
(530, '3052', '夆典', '1995-11-25 00:00:00', '建材營造業'),
(531, '3055', '蔚華科', '2002-12-12 00:00:00', '電子通路業'),
(532, '3056', '總太', '2003-03-03 00:00:00', '建材營造業'),
(533, '3057', '喬鼎', '2002-12-18 00:00:00', '電腦及週邊設備業'),
(534, '3058', '立德', '2002-12-09 00:00:00', '電子零組件業'),
(535, '3059', '華晶科', '2002-12-24 00:00:00', '光電業'),
(536, '3060', '銘異', '2003-04-21 00:00:00', '電腦及週邊設備業'),
(537, '3062', '建漢', '2003-07-28 00:00:00', '通信網路業'),
(538, '3090', '日電貿', '2007-12-31 00:00:00', '電子零組件業'),
(539, '3094', '聯傑', '2007-08-06 00:00:00', '半導體業'),
(540, '3130', '一零四', '2006-02-17 00:00:00', '資訊服務業'),
(541, '3149', '正達', '2011-11-23 00:00:00', '光電業'),
(542, '3164', '景岳', '2010-03-22 00:00:00', '生技醫療業'),
(543, '3167', '大量', '2013-10-21 00:00:00', '電機機械'),
(544, '3189', '景碩', '2004-11-01 00:00:00', '半導體業'),
(545, '3209', '全科', '2008-11-26 00:00:00', '電子通路業'),
(546, '3229', '晟鈦', '2009-12-31 00:00:00', '電子零組件業'),
(547, '3231', '緯創', '2003-08-19 00:00:00', '電腦及週邊設備業'),
(548, '3257', '虹冠電', '2011-03-21 00:00:00', '半導體業'),
(549, '3296', '勝德', '2007-12-31 00:00:00', '電子零組件業'),
(550, '3305', '昇貿', '2008-07-10 00:00:00', '其他電子業'),
(551, '3308', '聯德', '2008-03-12 00:00:00', '電子零組件業'),
(552, '3311', '閎暉', '2004-03-08 00:00:00', '通信網路業'),
(553, '3312', '弘憶股', '2010-12-29 00:00:00', '電子通路業'),
(554, '3315', '宣昶', '2006-10-26 00:00:00', '電子通路業'),
(555, '3338', '泰碩', '2013-12-13 00:00:00', '電子零組件業'),
(556, '3356', '奇偶', '2005-03-28 00:00:00', '光電業'),
(557, '3376', '新日興', '2007-12-31 00:00:00', '電子零組件業'),
(558, '3380', '明泰', '2004-12-20 00:00:00', '通信網路業'),
(559, '3383', '新世紀', '2007-12-10 00:00:00', '光電業'),
(560, '3406', '玉晶光', '2005-12-20 00:00:00', '光電業'),
(561, '3419', '譁裕', '2008-01-21 00:00:00', '通信網路業'),
(562, '3432', '台端', '2010-12-30 00:00:00', '電子零組件業'),
(563, '3437', '榮創', '2014-07-09 00:00:00', '光電業'),
(564, '3443', '創意', '2006-11-03 00:00:00', '半導體業'),
(565, '3450', '聯鈞', '2006-04-12 00:00:00', '其他電子業'),
(566, '3454', '晶睿', '2011-07-22 00:00:00', '光電業'),
(567, '3474', '華亞科', '2006-03-17 00:00:00', '半導體業'),
(568, '3481', '群創', '2006-10-24 00:00:00', '光電業'),
(569, '3494', '誠研', '2007-12-13 00:00:00', '電腦及週邊設備業'),
(570, '3501', '維熹', '2007-09-20 00:00:00', '電子零組件業'),
(571, '3504', '揚明光', '2007-01-26 00:00:00', '光電業'),
(572, '3514', '昱晶', '2007-11-02 00:00:00', '光電業'),
(573, '3515', '華擎', '2007-11-08 00:00:00', '電腦及週邊設備業'),
(574, '3518', '柏騰', '2007-11-28 00:00:00', '其他電子業'),
(575, '3519', '綠能', '2008-01-25 00:00:00', '半導體業'),
(576, '3532', '台勝科', '2007-12-10 00:00:00', '半導體業'),
(577, '3533', '嘉澤', '2007-12-10 00:00:00', '電子零組件業'),
(578, '3535', '晶彩科', '2008-01-31 00:00:00', '光電業'),
(579, '3550', '聯穎', '2010-11-10 00:00:00', '電子零組件業'),
(580, '3557', '嘉威', '2008-02-27 00:00:00', '光電業'),
(581, '3559', '全智科', '2008-10-23 00:00:00', '半導體業'),
(582, '3561', '昇陽科', '2008-12-05 00:00:00', '光電業'),
(583, '3573', '穎台', '2009-08-26 00:00:00', '光電業'),
(584, '3576', '新日光', '2009-01-12 00:00:00', '光電業'),
(585, '3583', '辛耘', '2013-03-12 00:00:00', '半導體業'),
(586, '3584', '介面', '2010-07-27 00:00:00', '光電業'),
(587, '3588', '通嘉', '2009-08-14 00:00:00', '半導體業'),
(588, '3591', '艾笛森', '2010-11-12 00:00:00', '光電業'),
(589, '3593', '力銘', '2009-03-16 00:00:00', '光電業'),
(590, '3596', '智易', '2009-03-11 00:00:00', '通信網路業'),
(591, '3598', '奕力', '2011-01-11 00:00:00', '半導體業'),
(592, '3607', '谷崧', '2009-10-28 00:00:00', '電子零組件業'),
(593, '3622', '洋華', '2009-03-25 00:00:00', '光電業'),
(594, '3645', '達邁', '2011-10-05 00:00:00', '電子零組件業'),
(595, '3653', '健策', '2009-11-18 00:00:00', '電子零組件業'),
(596, '3661', 'F-世芯', '2010-12-23 00:00:00', '半導體業'),
(597, '3665', 'F-貿聯', '2011-04-21 00:00:00', '其他電子業'),
(598, '3669', '圓展', '2011-08-25 00:00:00', '光電業'),
(599, '3673', 'F-TPK', '2010-10-29 00:00:00', '光電業'),
(600, '3679', '新至陞', '2011-10-05 00:00:00', '電子零組件業'),
(601, '3682', '亞太電', '2013-08-05 00:00:00', '通信網路業'),
(602, '3686', '達能', '2010-07-20 00:00:00', '半導體業'),
(603, '3694', '海華', '2011-05-03 00:00:00', '通信網路業'),
(604, '3698', '隆達', '2011-09-29 00:00:00', '光電業'),
(605, '3701', '大眾控', '2004-08-30 00:00:00', '電腦及週邊設備業'),
(606, '3702', '大聯大', '2005-11-09 00:00:00', '電子通路業'),
(607, '3703', '欣陸', '2010-04-08 00:00:00', '建材營造業'),
(608, '3704', '合勤控', '2010-08-16 00:00:00', '通信網路業'),
(609, '3705', '永信', '2011-01-03 00:00:00', '生技醫療業'),
(610, '3706', '神達', '2013-09-12 00:00:00', '電腦及週邊設備業'),
(611, '4104', '佳醫', '2007-12-31 00:00:00', '生技醫療業'),
(612, '4106', '雃博', '2004-11-08 00:00:00', '生技醫療業'),
(613, '4108', '懷特', '2008-07-16 00:00:00', '生技醫療業'),
(614, '4119', '旭富', '2004-01-07 00:00:00', '生技醫療業'),
(615, '4133', '亞諾法', '2009-12-28 00:00:00', '生技醫療業'),
(616, '4137', 'F-麗豐', '2013-11-27 00:00:00', '生技醫療業'),
(617, '4141', 'F-龍燈', '2012-04-25 00:00:00', '生技醫療業'),
(618, '4142', '國光生', '2012-05-03 00:00:00', '生技醫療業'),
(619, '4144', 'F-康聯', '2011-10-05 00:00:00', '生技醫療業'),
(620, '4164', '承業醫', '2012-10-24 00:00:00', '生技醫療業'),
(621, '4190', 'F-佐登', '2015-10-21 00:00:00', '生技醫療業'),
(622, '4306', '炎洲', '2008-01-21 00:00:00', '塑膠工業'),
(623, '4414', '如興', '2004-09-06 00:00:00', '紡織纖維'),
(624, '4426', '利勤', '2011-12-16 00:00:00', '紡織纖維'),
(625, '4526', '東台', '2003-09-15 00:00:00', '電機機械'),
(626, '4532', '瑞智', '2003-08-04 00:00:00', '電機機械'),
(627, '4536', '拓凱', '2013-10-09 00:00:00', '其他業'),
(628, '4557', 'F-永新', '2015-10-12 00:00:00', '電機機械'),
(629, '4722', '國精化', '2012-08-15 00:00:00', '化學工業'),
(630, '4725', '信昌化', '2007-10-02 00:00:00', '化學工業'),
(631, '4733', '上緯', '2010-12-30 00:00:00', '化學工業'),
(632, '4737', '華廣', '2010-12-23 00:00:00', '生技醫療業'),
(633, '4746', '台耀', '2011-03-01 00:00:00', '生技醫療業'),
(634, '4755', '三福化', '2013-11-27 00:00:00', '化學工業'),
(635, '4904', '遠傳', '2005-08-24 00:00:00', '通信網路業'),
(636, '4906', '正文', '2003-06-30 00:00:00', '通信網路業'),
(637, '4915', '致伸', '2012-10-05 00:00:00', '電腦及週邊設備業'),
(638, '4919', '新唐', '2010-09-27 00:00:00', '半導體業'),
(639, '4930', '燦星網', '2010-06-21 00:00:00', '電器電纜'),
(640, '4934', '太極', '2010-03-10 00:00:00', '光電業'),
(641, '4935', 'F-茂林', '2011-07-28 00:00:00', '光電業'),
(642, '4938', '和碩', '2010-06-24 00:00:00', '電腦及週邊設備業'),
(643, '4942', '嘉彰', '2011-06-27 00:00:00', '光電業'),
(644, '4952', '凌通', '2011-11-01 00:00:00', '半導體業'),
(645, '4956', '光鋐', '2011-10-24 00:00:00', '光電業'),
(646, '4958', 'F-臻鼎', '2011-12-26 00:00:00', '電子零組件業'),
(647, '4960', '奇美材', '2011-10-24 00:00:00', '光電業'),
(648, '4976', '佳凌', '2012-11-20 00:00:00', '光電業'),
(649, '4977', 'F-眾達', '2013-11-20 00:00:00', '通信網路業'),
(650, '4984', 'F-科納', '2011-08-31 00:00:00', '通信網路業'),
(651, '4994', '傳奇', '2013-12-25 00:00:00', '資訊服務業'),
(652, '4999', '鑫禾', '2013-06-03 00:00:00', '電子零組件業'),
(653, '5007', '三星', '2011-09-16 00:00:00', '鋼鐵工業'),
(654, '5203', '訊連', '2004-09-27 00:00:00', '資訊服務業'),
(655, '5215', 'F-科嘉', '2011-12-26 00:00:00', '電腦及週邊設備業'),
(656, '5225', 'F-東科', '2012-11-05 00:00:00', '其他電子業'),
(657, '5234', '達興', '2012-07-16 00:00:00', '光電業'),
(658, '5243', 'F-乙盛', '2013-11-25 00:00:00', '光電業'),
(659, '5259', '清惠', '2013-12-03 00:00:00', '光電業'),
(660, '5264', 'F-鎧勝', '2013-01-25 00:00:00', '電腦及週邊設備業'),
(661, '5269', '祥碩', '2012-12-12 00:00:00', '半導體業'),
(662, '5285', '界霖', '2014-02-25 00:00:00', '半導體業'),
(663, '5288', 'F-豐祥', '2014-09-25 00:00:00', '電機機械'),
(664, '5305', '敦南', '2004-07-19 00:00:00', '半導體業'),
(665, '5388', '中磊', '2007-12-03 00:00:00', '通信網路業'),
(666, '5434', '崇越', '2003-08-25 00:00:00', '電子通路業'),
(667, '5469', '瀚宇博', '2003-08-25 00:00:00', '電子零組件業'),
(668, '5471', '松翰', '2003-08-25 00:00:00', '半導體業'),
(669, '5484', '慧友', '2003-08-25 00:00:00', '光電業'),
(670, '5515', '建國', '2003-10-06 00:00:00', '建材營造業'),
(671, '5519', '隆大', '2014-02-10 00:00:00', '建材營造業'),
(672, '5521', '工信', '2012-12-18 00:00:00', '建材營造業'),
(673, '5522', '遠雄', '2007-08-06 00:00:00', '建材營造業'),
(674, '5525', '順天', '2004-11-26 00:00:00', '建材營造業'),
(675, '5531', '鄉林', '2005-01-31 00:00:00', '建材營造業'),
(676, '5533', '皇鼎', '2008-04-30 00:00:00', '建材營造業'),
(677, '5534', '長虹', '2004-05-24 00:00:00', '建材營造業'),
(678, '5538', 'F-東明', '2013-12-16 00:00:00', '鋼鐵工業'),
(679, '5607', '遠雄港', '2004-12-02 00:00:00', '航運業'),
(680, '5608', '四維航', '2003-08-25 00:00:00', '航運業'),
(681, '5706', '鳳凰', '2011-10-21 00:00:00', '觀光事業'),
(682, '5871', 'F-中租', '2011-12-13 00:00:00', '其他業'),
(683, '5880', '合庫金', '2011-12-01 00:00:00', '金融保險業'),
(684, '5906', 'F-台南', '2011-10-24 00:00:00', '貿易百貨業'),
(685, '5907', 'F-大洋', '2012-06-06 00:00:00', '貿易百貨業'),
(686, '6005', '群益證', '2005-11-21 00:00:00', '金融保險業'),
(687, '6108', '競國', '2008-12-30 00:00:00', '電子零組件業'),
(688, '6112', '聚碩', '2003-08-04 00:00:00', '資訊服務業'),
(689, '6115', '鎰勝', '2004-07-19 00:00:00', '電子零組件業'),
(690, '6116', '彩晶', '2004-09-06 00:00:00', '光電業'),
(691, '6117', '迎廣', '2003-08-25 00:00:00', '電腦及週邊設備業'),
(692, '6128', '上福', '2003-06-16 00:00:00', '電腦及週邊設備業'),
(693, '6133', '金橋', '2003-08-15 00:00:00', '電子零組件業'),
(694, '6136', '富爾特', '2003-08-25 00:00:00', '通信網路業'),
(695, '6139', '亞翔', '2003-08-25 00:00:00', '其他電子業'),
(696, '6141', '柏承', '2003-10-22 00:00:00', '電子零組件業'),
(697, '6142', '友勁', '2003-08-04 00:00:00', '通信網路業'),
(698, '6145', '勁永', '2003-08-25 00:00:00', '電子通路業'),
(699, '6152', '百一', '2009-12-08 00:00:00', '通信網路業'),
(700, '6153', '嘉聯益', '2008-01-21 00:00:00', '電子零組件業'),
(701, '6155', '鈞寶', '2006-08-18 00:00:00', '電子零組件業'),
(702, '6164', '華興', '2008-10-21 00:00:00', '光電業'),
(703, '6165', '捷泰', '2003-08-04 00:00:00', '電子零組件業'),
(704, '6166', '凌華', '2004-11-08 00:00:00', '電腦及週邊設備業'),
(705, '6168', '宏齊', '2003-08-25 00:00:00', '光電業'),
(706, '6172', '互億', '2004-05-24 00:00:00', '電腦及週邊設備業'),
(707, '6176', '瑞儀', '2007-05-15 00:00:00', '光電業'),
(708, '6177', '達麗', '2013-08-01 00:00:00', '建材營造業'),
(709, '6183', '關貿', '2011-12-01 00:00:00', '資訊服務業'),
(710, '6184', '大豐電', '2005-02-15 00:00:00', '其他業'),
(711, '6189', '豐藝', '2004-05-24 00:00:00', '電子通路業'),
(712, '6191', '精成科', '2007-10-19 00:00:00', '電子零組件業'),
(713, '6192', '巨路', '2004-09-27 00:00:00', '其他電子業'),
(714, '6196', '帆宣', '2004-05-24 00:00:00', '其他電子業'),
(715, '6197', '佳必琪', '2004-11-08 00:00:00', '電子零組件業'),
(716, '6201', '亞弘電', '2004-09-27 00:00:00', '其他電子業'),
(717, '6202', '盛群', '2004-09-27 00:00:00', '半導體業'),
(718, '6205', '詮欣', '2008-01-21 00:00:00', '電子零組件業'),
(719, '6206', '飛捷', '2004-08-03 00:00:00', '電腦及週邊設備業'),
(720, '6209', '今國光', '2004-11-08 00:00:00', '光電業'),
(721, '6213', '聯茂', '2008-01-21 00:00:00', '電子零組件業'),
(722, '6214', '精誠', '2010-12-30 00:00:00', '資訊服務業'),
(723, '6215', '和椿', '2007-12-31 00:00:00', '其他電子業'),
(724, '6216', '居易', '2004-09-27 00:00:00', '通信網路業'),
(725, '6224', '聚鼎', '2009-09-17 00:00:00', '電子零組件業'),
(726, '6225', '天瀚', '2004-09-27 00:00:00', '光電業'),
(727, '6226', '光鼎', '2008-11-10 00:00:00', '光電業'),
(728, '6230', '超眾', '2010-09-16 00:00:00', '電腦及週邊設備業'),
(729, '6235', '華孚', '2004-08-23 00:00:00', '電腦及週邊設備業'),
(730, '6239', '力成', '2004-11-08 00:00:00', '半導體業'),
(731, '6243', '迅杰', '2009-12-17 00:00:00', '半導體業'),
(732, '6251', '定穎', '2009-03-18 00:00:00', '電子零組件業'),
(733, '6257', '矽格', '2003-08-25 00:00:00', '半導體業'),
(734, '6269', '台郡', '2003-09-23 00:00:00', '電子零組件業'),
(735, '6271', '同欣電', '2007-11-16 00:00:00', '半導體業'),
(736, '6277', '宏正', '2003-10-30 00:00:00', '電腦及週邊設備業'),
(737, '6278', '台表科', '2010-08-24 00:00:00', '光電業'),
(738, '6281', '全國電', '2005-12-08 00:00:00', '電子通路業'),
(739, '6282', '康舒', '2003-09-08 00:00:00', '電子零組件業'),
(740, '6283', '淳安', '2008-01-21 00:00:00', '通信網路業'),
(741, '6285', '啟碁', '2003-09-22 00:00:00', '通信網路業'),
(742, '6286', '立錡', '2003-10-21 00:00:00', '半導體業'),
(743, '6289', '華上', '2003-08-28 00:00:00', '光電業'),
(744, '6405', '悅城', '2013-11-28 00:00:00', '光電業'),
(745, '6409', '旭隼', '2014-03-31 00:00:00', '其他電子業'),
(746, '6412', '群電', '2013-11-08 00:00:00', '電子零組件業'),
(747, '6414', '樺漢', '2014-03-28 00:00:00', '電腦及週邊設備業'),
(748, '6415', 'F-矽力', '2013-12-12 00:00:00', '半導體業'),
(749, '6431', 'F-光麗', '2014-12-04 00:00:00', '光電業'),
(750, '6451', 'F-訊芯', '2015-01-26 00:00:00', '半導體業'),
(751, '6452', 'F-康友', '2015-03-25 00:00:00', '生技醫療業'),
(752, '6456', 'F-GIS', '2015-06-12 00:00:00', '光電業'),
(753, '6504', '南六', '2013-05-07 00:00:00', '其他業'),
(754, '6505', '台塑化', '2003-12-26 00:00:00', '油電燃氣業'),
(755, '6605', '帝寶', '2004-03-17 00:00:00', '電機機械'),
(756, '8011', '台通', '2011-09-19 00:00:00', '通信網路業'),
(757, '8016', '矽創', '2003-12-25 00:00:00', '半導體業'),
(758, '8021', '尖點', '2008-01-21 00:00:00', '其他電子業'),
(759, '8033', '雷虎', '2007-06-21 00:00:00', '其他業'),
(760, '8039', '台虹', '2009-12-17 00:00:00', '電子零組件業'),
(761, '8046', '南電', '2006-04-07 00:00:00', '電子零組件業'),
(762, '8070', '長華', '2007-12-31 00:00:00', '電子通路業'),
(763, '8072', '陞泰', '2005-08-19 00:00:00', '光電業'),
(764, '8081', '致新', '2008-12-30 00:00:00', '半導體業'),
(765, '8101', '華冠', '2004-07-01 00:00:00', '通信網路業'),
(766, '8103', '瀚荃', '2009-09-29 00:00:00', '電子零組件業'),
(767, '8105', '凌巨', '2006-12-27 00:00:00', '光電業'),
(768, '8110', '華東', '2007-10-31 00:00:00', '半導體業'),
(769, '8112', '至上', '2007-12-31 00:00:00', '電子通路業'),
(770, '8114', '振樺電', '2012-11-26 00:00:00', '電腦及週邊設備業'),
(771, '8131', '福懋科', '2007-11-29 00:00:00', '半導體業'),
(772, '8150', '南茂', '2014-04-11 00:00:00', '半導體業'),
(773, '8163', '達方', '2007-11-28 00:00:00', '電腦及週邊設備業');
INSERT INTO `stock_list` (`id`, `symbolid`, `symbol`, `start`, `type`) VALUES
(774, '8201', '無敵', '2007-10-29 00:00:00', '其他電子業'),
(775, '8210', '勤誠', '2011-12-01 00:00:00', '電腦及週邊設備業'),
(776, '8213', '志超', '2009-12-25 00:00:00', '電子零組件業'),
(777, '8215', '明基材', '2010-11-12 00:00:00', '光電業'),
(778, '8249', '菱光', '2005-05-17 00:00:00', '電子零組件業'),
(779, '8261', '富鼎', '2009-12-11 00:00:00', '半導體業'),
(780, '8271', '宇瞻', '2010-12-29 00:00:00', '半導體業'),
(781, '8374', '羅昇', '2008-12-25 00:00:00', '電機機械'),
(782, '8411', 'F-福貞', '2011-11-01 00:00:00', '其他業'),
(783, '8422', '可寧衛', '2011-10-05 00:00:00', '其他業'),
(784, '8427', 'F-基勝', '2011-12-06 00:00:00', '其他業'),
(785, '8429', 'F-金麗', '2012-12-20 00:00:00', '貿易百貨業'),
(786, '8443', '阿瘦', '2014-09-15 00:00:00', '貿易百貨業'),
(787, '8467', 'F-波力', '2015-12-15 00:00:00', '其他業'),
(788, '8926', '台汽電', '2003-08-25 00:00:00', '油電燃氣業'),
(789, '8940', '新天地', '2009-05-15 00:00:00', '觀光事業'),
(790, '8996', '高力', '2014-02-14 00:00:00', '電機機械'),
(791, '9802', 'F-鈺齊', '2012-10-18 00:00:00', '其他業'),
(792, '9902', '台火', '1964-07-14 00:00:00', '其他業'),
(793, '9904', '寶成', '1990-01-19 00:00:00', '其他業'),
(794, '9905', '大華', '1990-08-08 00:00:00', '其他業'),
(795, '9907', '統一實', '1991-01-29 00:00:00', '其他業'),
(796, '9908', '大台北', '1991-02-06 00:00:00', '油電燃氣業'),
(797, '9910', '豐泰', '1992-02-18 00:00:00', '其他業'),
(798, '9911', '櫻花', '1992-07-16 00:00:00', '其他業'),
(799, '9912', '偉聯', '1992-08-08 00:00:00', '電腦及週邊設備業'),
(800, '9914', '美利達', '1992-09-30 00:00:00', '其他業'),
(801, '9917', '中保', '1993-12-08 00:00:00', '其他業'),
(802, '9918', '欣天然', '1994-04-26 00:00:00', '油電燃氣業'),
(803, '9919', '康那香', '1994-11-04 00:00:00', '其他業'),
(804, '9921', '巨大', '1994-12-29 00:00:00', '其他業'),
(805, '9924', '福興', '1995-03-15 00:00:00', '其他業'),
(806, '9925', '新保', '1995-12-09 00:00:00', '其他業'),
(807, '9926', '新海', '1998-04-08 00:00:00', '油電燃氣業'),
(808, '9927', '泰銘', '1999-03-12 00:00:00', '其他業'),
(809, '9928', '中視', '1999-08-09 00:00:00', '其他業'),
(810, '9929', '秋雨', '1999-06-28 00:00:00', '其他業'),
(811, '9930', '中聯資', '1999-11-22 00:00:00', '其他業'),
(812, '9931', '欣高', '2000-03-21 00:00:00', '油電燃氣業'),
(813, '9933', '中鼎', '1993-05-28 00:00:00', '其他業'),
(814, '9934', '成霖', '2000-09-11 00:00:00', '其他業'),
(815, '9935', '慶豐富', '2000-09-11 00:00:00', '其他業'),
(816, '9937', '全國', '2000-09-11 00:00:00', '油電燃氣業'),
(817, '9938', '百和', '2001-01-12 00:00:00', '其他業'),
(818, '9939', '宏全', '2001-03-02 00:00:00', '其他業'),
(819, '9940', '信義', '2001-09-17 00:00:00', '其他業'),
(820, '9941', '裕融', '2001-09-17 00:00:00', '其他業'),
(821, '9942', '茂順', '2002-01-28 00:00:00', '其他業'),
(822, '9943', '好樂迪', '2002-08-26 00:00:00', '觀光事業'),
(823, '9944', '新麗', '2002-08-26 00:00:00', '其他業'),
(824, '9945', '潤泰新', '1992-04-30 00:00:00', '其他業'),
(825, '9946', '三發', '2013-09-17 00:00:00', '建材營造業'),
(826, '9955', '佳龍', '2008-01-21 00:00:00', '其他業'),
(827, '9958', '世紀鋼', '2008-03-12 00:00:00', '鋼鐵工業'),
(828, '1312A', '國喬特', '1988-12-21 00:00:00', '塑膠工業');

-- --------------------------------------------------------

--
-- 資料表結構 `user_finance_record`
--

CREATE TABLE IF NOT EXISTS `user_finance_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(5) NOT NULL,
  `type` int(1) NOT NULL,
  `symbolid` varchar(20) NOT NULL,
  `num` int(10) NOT NULL,
  `price` float NOT NULL,
  `hand` int(10) NOT NULL,
  `tax` int(10) NOT NULL,
  `fout` int(10) NOT NULL,
  `fin` int(10) NOT NULL,
  `total` int(10) NOT NULL,
  `date` date NOT NULL,
  `mtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `symbolid` (`symbolid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- 資料表的匯出資料 `user_finance_record`
--

INSERT INTO `user_finance_record` (`id`, `uid`, `type`, `symbolid`, `num`, `price`, `hand`, `tax`, `fout`, `fin`, `total`, `date`, `mtime`) VALUES
(4, 5, 1, '1517', 6000, 10.25, 87, 0, 61587, 0, 0, '2015-08-26', '2016-02-12 14:35:50'),
(6, 5, 2, '1517', 6000, 11.45, 97, 206, 0, 68396, 0, '2015-11-16', '2016-02-12 14:40:09'),
(8, 5, 3, '1517', 6000, 0.5, 0, 0, 0, 3000, 0, '2015-08-29', '2016-02-12 14:42:15'),
(9, 5, 1, '2353', 2000, 10.5, 29, 0, 21029, 0, 0, '2016-02-12', '2016-02-12 14:42:56'),
(10, 5, 1, '2353', 2000, 10.55, 30, 0, 21130, 0, 0, '2016-02-12', '2016-02-12 14:43:01'),
(11, 5, 1, '2890', 2000, 8.29, 23, 0, 16603, 0, 0, '2016-02-12', '2016-02-12 14:43:12'),
(12, 5, 2, '2353', 4000, 11.4, 64, 136, 0, 45398, 0, '2016-02-12', '2016-02-12 14:43:23'),
(13, 5, 2, '2890', 2000, 9, 25, 54, 0, 17920, 0, '2016-02-12', '2016-02-12 14:43:33');

-- --------------------------------------------------------

--
-- 資料表結構 `user_finance_stock`
--

CREATE TABLE IF NOT EXISTS `user_finance_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(5) NOT NULL,
  `symbolid` varchar(20) NOT NULL,
  `num` int(10) NOT NULL,
  `bprice` float NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 資料表的匯出資料 `user_finance_stock`
--

INSERT INTO `user_finance_stock` (`id`, `uid`, `symbolid`, `num`, `bprice`, `date`) VALUES
(1, 5, '1517', 1, 10, '2016-01-01'),
(2, 5, '555', 1, 10, '2016-01-01'),
(3, 5, '1517', 10, 10.5, '2016-02-11'),
(4, 5, '1517', 2, 3, '2016-02-12'),
(5, 5, '1517', 2, 2, '2016-02-12'),
(6, 5, '1517', 222, 22, '2016-02-12'),
(7, 5, '0', 0, 0, '2016-02-12'),
(8, 5, '1', 1, 1, '2016-02-12'),
(9, 6, '1517', 1, 1, '2016-02-12');

-- --------------------------------------------------------

--
-- 資料表結構 `user_profile`
--

CREATE TABLE IF NOT EXISTS `user_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `bank` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `udate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 資料表的匯出資料 `user_profile`
--

INSERT INTO `user_profile` (`id`, `uid`, `bank`, `num`, `udate`) VALUES
(1, 5, 10000, 2, '2016-02-12 00:00:00');

-- --------------------------------------------------------

--
-- 資料表結構 `world_stock_history`
--

CREATE TABLE IF NOT EXISTS `world_stock_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AS30` float NOT NULL,
  `AS30d` float NOT NULL,
  `NYK` float NOT NULL,
  `NYKd` float NOT NULL,
  `KOSPI` float NOT NULL,
  `KOSPId` float NOT NULL,
  `TWSE` float NOT NULL,
  `TWSEd` float NOT NULL,
  `SHCOMP` float NOT NULL,
  `SHCOMPd` float NOT NULL,
  `SHAOMP` float NOT NULL,
  `SHAOMPd` float NOT NULL,
  `SHBOMP` float NOT NULL,
  `SHBOMPd` float NOT NULL,
  `SZASHR` float NOT NULL,
  `SZASHRd` float NOT NULL,
  `SZBSHR` float NOT NULL,
  `SZBSHRd` float NOT NULL,
  `HSI` float NOT NULL,
  `HSId` float NOT NULL,
  `FSSTI` float NOT NULL,
  `FSSTId` float NOT NULL,
  `KLCI` float NOT NULL,
  `KLCId` float NOT NULL,
  `RTSI` float NOT NULL,
  `RTSId` float NOT NULL,
  `UKX` float NOT NULL,
  `UKXd` float NOT NULL,
  `CAC` float NOT NULL,
  `CACd` float NOT NULL,
  `DAX` float NOT NULL,
  `DAXd` float NOT NULL,
  `INDU` float NOT NULL,
  `INDUd` float NOT NULL,
  `CCMP` float NOT NULL,
  `CCMPd` float NOT NULL,
  `SPX` float NOT NULL,
  `SPXd` float NOT NULL,
  `RAY` float NOT NULL,
  `RAYd` float NOT NULL,
  `SOX` float NOT NULL,
  `SOXd` float NOT NULL,
  `SPTSX` float NOT NULL,
  `SPTSXd` float NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- 資料表的匯出資料 `world_stock_history`
--

INSERT INTO `world_stock_history` (`id`, `AS30`, `AS30d`, `NYK`, `NYKd`, `KOSPI`, `KOSPId`, `TWSE`, `TWSEd`, `SHCOMP`, `SHCOMPd`, `SHAOMP`, `SHAOMPd`, `SHBOMP`, `SHBOMPd`, `SZASHR`, `SZASHRd`, `SZBSHR`, `SZBSHRd`, `HSI`, `HSId`, `FSSTI`, `FSSTId`, `KLCI`, `KLCId`, `RTSI`, `RTSId`, `UKX`, `UKXd`, `CAC`, `CACd`, `DAX`, `DAXd`, `INDU`, `INDUd`, `CCMP`, `CCMPd`, `SPX`, `SPXd`, `RAY`, `RAYd`, `SOX`, `SOXd`, `SPTSX`, `SPTSXd`, `date`) VALUES
(8, 5094.3, 37.7, 17865.2, 346.93, 1924.82, 12.76, 8156.96, 11.75, 2688.85, -48.75, 2813.68, -51.08, 340.57, -4.29, 1747.7, -18.3, 1132.78, -13.99, 19595.5, -87.61, 2602.41, -26.7, 1667.8, 33.27, 730.39, -14.91, 6060.1, -23.69, 4392.33, -24.69, 9757.88, -40.23, 16449.2, -17.12, 4620.37, 6.41, 1939.38, -0.86, 1136.46, -0.37, 616.6, 2.92, 12674.4, -147.76, '2016-02-01'),
(9, 5044, -50.3, 17750.7, -114.55, 1906.6, -18.22, 8131.24, -25.72, 2749.57, 60.72, 2877.21, 63.53, 348.4, 7.83, 1807.69, 59.99, 1142.84, 10.05, 19446.8, -148.66, 2579.23, -23.18, 1653.18, -14.62, 701.21, -29.18, 5922.01, -138.09, 4283.99, -108.34, 9581.04, -176.84, 16153.5, -295.64, 4516.94, -103.42, 1903.03, -36.35, 1114.22, -22.25, 595.7, -20.91, 12442.3, -232.11, '2016-02-02'),
(10, 4930.8, -113.2, 17191.2, -559.43, 1890.67, -15.93, 8063, -68.24, 2739.25, -10.32, 2866.36, -10.85, 348.45, 0.05, 1816.28, 8.59, 1134.07, -8.76, 18991.6, -455.25, 2542.15, -37.08, 1633.3, -19.88, 696.96, -4.25, 5837.14, -84.87, 4226.96, -57.03, 9434.82, -146.22, 16336.7, 183.12, 4504.24, -12.71, 1912.53, 9.5, 1119.71, 5.49, 597.11, 1.41, 12593, 150.76, '2016-02-03'),
(11, 5029.3, 98.5, 17045, -146.26, 1916.26, 25.59, 8063, -68.24, 2781.02, 41.78, 2910.08, 43.72, 353.56, 5.11, 1851.76, 35.49, 1145.48, 11.4, 19183.1, 191.5, 2558.49, 7.75, 1656.77, 23.47, 740.89, 43.93, 5898.76, 61.62, 4228.53, 1.57, 9393.36, -41.46, 16416.6, 79.92, 4509.56, 5.32, 1915.45, 2.92, 1122.46, 2.75, 607.72, 10.61, 12774.5, 181.48, '2016-02-04'),
(12, 5025.6, -3.7, 16819.6, -225.4, 1917.79, 1.53, 8063, -68.24, 2763.49, -17.53, 2891.62, -18.46, 354.33, 0.78, 1830.4, -21.36, 1141.3, -4.18, 19288.2, 105.08, 2623.21, 64.72, 1662.46, 5.69, 725.91, 28.95, 5848.06, -50.7, 4200.67, -27.86, 9286.23, -107.13, 16205, -211.61, 4363.15, -146.41, 1880.05, -35.4, 1099.56, -22.9, 586.25, -21.47, 12764, -10.51, '2016-02-05'),
(13, 5022.1, -3.5, 17004.3, 184.71, 1917.79, 1.53, 8063, -68.24, 2763.49, -17.53, 2891.62, -18.46, 354.33, 0.78, 1830.4, -21.36, 1141.3, -4.18, 19288.2, 105.08, 2623.21, 64.72, 1662.46, 5.69, 704.03, -21.88, 5689.36, -158.7, 4066.31, -134.36, 8979.36, -306.87, 16027, -177.92, 4283.75, -79.39, 1853.44, -26.61, 1082.23, -17.32, 571.45, -14.8, 12535.4, -228.59, '2016-02-08'),
(14, 4882.6, -139.5, 16085.4, -918.86, 1917.79, 1.53, 8063, -68.24, 2763.49, -17.53, 2891.62, -18.46, 354.33, 0.78, 1830.4, -21.36, 1141.3, -4.18, 19288.2, 105.08, 2623.21, 64.72, 1662.46, 5.69, 690.37, -13.66, 5632.19, -57.17, 3997.54, -68.77, 8879.4, -99.96, 16014.4, -12.67, 4268.76, -14.99, 1852.21, -1.23, 1080.86, -1.37, 567.99, -3.46, 12282.7, -252.75, '2016-02-09'),
(15, 4826.5, -56.1, 15713.4, -372.05, 1917.79, 1.53, 8063, -68.24, 2763.49, -17.53, 2891.62, -18.46, 354.33, 0.78, 1830.4, -21.36, 1141.3, -4.18, 19288.2, 105.08, 2582.1, -41.11, 1644.41, -18.05, 696.61, 6.24, 5672.3, 40.11, 4061.2, 63.66, 9017.29, 137.89, 15914.7, -99.64, 4283.59, 14.83, 1851.86, -0.35, 1080.81, 0.2, 563.65, -4.34, 12185.7, -96.93, '2016-02-10'),
(16, 4870.9, 44.4, 15713.4, -372.05, 1861.54, -56.25, 8063, -68.24, 2763.49, -17.53, 2891.62, -18.46, 354.33, 0.78, 1830.4, -21.36, 1141.3, -4.18, 18545.8, -742.37, 2538.28, -43.82, 1643.95, -0.46, 671.34, -25.27, 5536.97, -135.33, 3896.71, -164.49, 8752.87, -264.42, 15660.2, -254.56, 4266.84, -16.76, 1829.08, -22.78, 1067.34, -13.47, 559.18, -4.47, 12087.4, -98.35, '2016-02-11'),
(17, 4816.6, -54.3, 14952.6, -760.78, 1835.28, -26.26, 8063, -68.24, 2763.49, -17.53, 2891.62, -18.46, 354.33, 0.78, 1830.4, -21.36, 1141.3, -4.18, 18319.6, -226.22, 2539.95, 1.67, 1643.74, -0.21, 689.9, 18.56, 5707.6, 170.63, 3995.06, 98.35, 8967.51, 214.64, 15973.8, 313.66, 4337.51, 70.67, 1864.78, 35.7, 1088.26, 20.92, 571.9, 12.72, 12381.2, 293.87, '2016-02-12');

--
-- 已匯出資料表的限制(Constraint)
--

--
-- 資料表的 Constraints `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD CONSTRAINT `account_emailaddress_user_id_5c85949e40d9a61d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 資料表的 Constraints `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD CONSTRAINT `acc_email_address_id_5bcf9f503c32d4d8_fk_account_emailaddress_id` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`);

--
-- 資料表的 Constraints `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- 資料表的 Constraints `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- 資料表的 Constraints `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 資料表的 Constraints `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 資料表的 Constraints `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- 資料表的 Constraints `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
  ADD CONSTRAINT `socialaccount_socialacc_user_id_3fd78aac97693583_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 資料表的 Constraints `socialaccount_socialapp_sites`
--
ALTER TABLE `socialaccount_socialapp_sites`
  ADD CONSTRAINT `socialaccount_socialap_site_id_a859406a22be3fe_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`),
  ADD CONSTRAINT `soci_socialapp_id_7b02380b6127b1b8_fk_socialaccount_socialapp_id` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`);

--
-- 資料表的 Constraints `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
  ADD CONSTRAINT `socialaccou_app_id_2125549785bd662_fk_socialaccount_socialapp_id` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`),
  ADD CONSTRAINT `so_account_id_3fc809e243dd8c0a_fk_socialaccount_socialaccount_id` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
