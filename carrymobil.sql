-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Янв 20 2021 г., 16:59
-- Версия сервера: 10.4.17-MariaDB
-- Версия PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `carrymobil`
--

-- --------------------------------------------------------

--
-- Структура таблицы `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `auth_permission`
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
(25, 'Can add Заказ', 7, 'add_orders'),
(26, 'Can change Заказ', 7, 'change_orders'),
(27, 'Can delete Заказ', 7, 'delete_orders'),
(28, 'Can view Заказ', 7, 'view_orders'),
(37, 'Can add addresses', 11, 'add_addresses'),
(38, 'Can change addresses', 11, 'change_addresses'),
(39, 'Can delete addresses', 11, 'delete_addresses'),
(40, 'Can view addresses', 11, 'view_addresses'),
(41, 'Can add Адрес', 10, 'add_adresses'),
(42, 'Can change Адрес', 10, 'change_adresses'),
(43, 'Can delete Адрес', 10, 'delete_adresses'),
(44, 'Can view Адрес', 10, 'view_adresses'),
(45, 'Can add city price', 12, 'add_cityprice'),
(46, 'Can change city price', 12, 'change_cityprice'),
(47, 'Can delete city price', 12, 'delete_cityprice'),
(48, 'Can view city price', 12, 'view_cityprice'),
(49, 'Can add cargo type', 13, 'add_cargotype'),
(50, 'Can change cargo type', 13, 'change_cargotype'),
(51, 'Can delete cargo type', 13, 'delete_cargotype'),
(52, 'Can view cargo type', 13, 'view_cargotype');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$216000$d6IF2k6WlUxo$aTSDk4VV+0r8pl5WXuhFDTBo0HXahjR1blVkx/1jIws=', '2021-01-20 07:23:43.173348', 1, 'admin', 'Артур', 'Ганиев', 'admin@admin.ru', 1, 1, '2020-12-28 08:22:09.000000'),
(2, 'pbkdf2_sha256$216000$yDpIoixoNHII$WUZbjieJbeaOXO96mqs8QhQpBK3QOAoEOCsNBws1lx4=', NULL, 0, 'test123', '', '', '', 0, 1, '2021-01-10 07:28:29.381946'),
(4, 'pbkdf2_sha256$216000$tetOGeaYzZD6$ay6zxiVvO38/8vkhX9oZmpuFwSIhwZYAbnJ340DleKI=', '2021-01-20 07:13:55.444089', 0, 'test1', '', '', '', 0, 1, '2021-01-20 07:13:48.849142');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `core_adresses`
--

CREATE TABLE `core_adresses` (
  `id` int(11) NOT NULL,
  `adress` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=koi8u;

--
-- Дамп данных таблицы `core_adresses`
--

INSERT INTO `core_adresses` (`id`, `adress`) VALUES
(29, 'г. Альметьевск, улица Ленина'),
(30, 'г. Альметьевск, улица Шевченко'),
(31, 'г. Альметьевск, улица Строителей'),
(32, 'г. Альметьевск, улица Джалиля'),
(33, 'г. Альметьевск, улица Мира'),
(38, 'г. Казань, улица Татарстан'),
(39, 'г. Чистополь, улица Валиева');

-- --------------------------------------------------------

--
-- Структура таблицы `core_cargotype`
--

CREATE TABLE `core_cargotype` (
  `id` int(11) NOT NULL,
  `cargo` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `cargo_class` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `core_cargotype`
--

INSERT INTO `core_cargotype` (`id`, `cargo`, `price`, `cargo_class`) VALUES
(1, 'Переезд', 0, NULL),
(2, 'Мебель', 0, NULL),
(3, 'Бытовая техника', 0, NULL),
(4, 'Стройматериалы', 0, 'material'),
(5, 'Мусор', 3000, NULL),
(6, 'Мототехника', 0, 'moto'),
(7, 'Спецтехника', 0, 'spec'),
(8, 'Спец-груз', 0, 'spec'),
(9, 'опасный груз', 0, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `core_cityprice`
--

CREATE TABLE `core_cityprice` (
  `id` int(11) NOT NULL,
  `city_1` varchar(150) NOT NULL,
  `city_2` varchar(150) NOT NULL,
  `distance` int(11) NOT NULL,
  `price_1_5t` int(11) NOT NULL,
  `price_3t` int(11) NOT NULL,
  `price_5t` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `core_cityprice`
--

INSERT INTO `core_cityprice` (`id`, `city_1`, `city_2`, `distance`, `price_1_5t`, `price_3t`, `price_5t`) VALUES
(1, 'Альметьевск', 'Казань', 252, 8000, 11000, 13000),
(2, 'Альметьевск', 'Чистополь', 130, 5000, 8000, 11000);

-- --------------------------------------------------------

--
-- Структура таблицы `core_orders`
--

CREATE TABLE `core_orders` (
  `id` int(11) NOT NULL,
  `from_adress` varchar(150) NOT NULL,
  `to_adress` varchar(150) NOT NULL,
  `road_comment` longtext DEFAULT NULL,
  `loader_count` int(11) DEFAULT NULL,
  `loader_time_count` int(11) DEFAULT NULL,
  `user_tel_nomer` varchar(20) NOT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `order_price` int(11) NOT NULL,
  `cargo_type` varchar(50) NOT NULL,
  `cargo_type_comment` longtext DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `core_orders`
--

INSERT INTO `core_orders` (`id`, `from_adress`, `to_adress`, `road_comment`, `loader_count`, `loader_time_count`, `user_tel_nomer`, `start_time`, `order_price`, `cargo_type`, `cargo_type_comment`, `status`) VALUES
(1, 'Альметьевск, Ленина 107', 'Альметьевск, Ленина 112', 'ауауаууац2432', 2, 2, '89872191853', '2021-01-30 13:37:00.000000', 500, '', NULL, NULL),
(2, 'Альметьевск, Ленина 107', 'Альметьевск, Ленина 112', '', 2, 1, '89872191853', '2021-01-31 13:55:00.000000', 500, '', NULL, NULL),
(3, 'Альметьевск, Ленина 107', 'Альметьевск, Ленина 112', '', 2, 1, '89872191853', NULL, 500, '', NULL, NULL),
(4, 'Альметьевск, Ленина 107', 'Альметьевск, Ленина 112', '', 2, 1, '89872191853', NULL, 500, '', NULL, NULL),
(5, 'Альметьевск, Ленина 107', 'Альметьевск, Ленина 112', '', 2, 1, '89872191853', '2021-01-16 18:32:00.000000', 500, '', NULL, NULL),
(6, 'Альметьевск, Фахредтина 47', 'Альметьевск, Шевченко 150', '', 1, 2, '89872191853', '2021-01-29 10:13:00.000000', 500, '', NULL, NULL),
(7, 'Альметьевск, Чехова 52', 'Альметьевск, Тукая 37', '', 2, 3, '89872191853', '2021-01-17 03:26:00.000000', 500, '', NULL, NULL),
(8, 'Альметьевск, Ленина 105', 'Альметьевск, Марджани 105', '', 1, 1, '89196420035', '2021-01-13 06:00:00.000000', 500, '', NULL, NULL),
(9, 'улица Джалиля 21, Альметьевск', 'улица Шевченко 105, Альметьевск', '', 1, 2, '89196420035', '2021-01-05 12:00:00.000000', 500, '', NULL, NULL),
(10, 'улица Ленина 105, Альметьевск', 'улица Шевченко 105, Альметьевск', '', 2, 1, '89196420035', NULL, 500, '', NULL, NULL),
(11, 'улица Ленина 112, Альметьевск', 'улица Строителей 13, Альметьевск', '', 2, 1, '89196420047', '2021-01-12 14:20:00.000000', 500, '', NULL, NULL),
(12, 'г. Альметьевск, улица Мира', 'г. Альметьевск, улица Ленина 110', '', NULL, NULL, '89196420035', NULL, 500, '', NULL, NULL),
(13, 'г. Альметьевск, улица Джалиля', 'г. Альметьевск, улица Мира', '', NULL, NULL, '89196420035', NULL, 500, '', NULL, NULL),
(14, 'г. Альметьевск, улица Ленина,г. Альметьевск, улица Шевченко', 'г. Казань, улица Татарстан,г. Альметьевск, улица Мира', '', NULL, NULL, '89196420035', NULL, 500, '', NULL, NULL),
(15, 'г. Альметьевск, улица Ленина,г. Альметьевск, улица Джалиля,г. Альметьевск, улица Шевченко', 'г. Альметьевск, улица Шевченко,г. Альметьевск, улица Строителей,г. Казань, улица Татарстан', '', NULL, NULL, '89196420035', '2021-01-17 08:50:00.000000', 500, '', NULL, NULL),
(16, 'г. Альметьевск, улица Ленина', 'г. Альметьевск, улица Строителей', '', 1, 2, '89196420035', '2020-12-31 11:56:00.000000', 500, '', NULL, NULL),
(17, 'г. Альметьевск, улица Ленина', 'г. Альметьевск, улица Строителей', '', 1, 2, '89196420035', NULL, 500, 'Переезд', '', NULL),
(18, 'г. Альметьевск, улица Ленина 102', 'г. Чистополь, улица Валиева 20', '', 2, 2, '89196420035', '2021-01-22 21:40:00.000000', 5000, 'Переезд', '', NULL),
(19, 'г. Альметьевск, улица Ленина 110', 'Альметьевск, Тукая 37', '', 2, 1, '89196250303', '2021-01-20 09:15:00.000000', 1900, 'Переезд', '', NULL),
(20, 'г. Альметьевск, улица Ленина', 'г. Альметьевск, улица Ленина112', '', 2, 1, '89196250303', '2021-02-01 09:00:00.000000', 1900, 'Переезд', '', NULL),
(21, 'г. Альметьевск, улица Ленина,г. Альметьевск, улица Шевченко', 'г. Альметьевск, улица Строителей,г. Чистополь, улица Валиева', '', 4, 2, '89196420035', NULL, 8300, 'Переезд', '', NULL),
(22, 'г. Альметьевск, улица Ленина', 'г. Альметьевск, улица Мира', '', 1, 3, '89196420035', NULL, 1550, 'Переезд', '', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-01-10 18:32:01.700996', '8', 'Ленина 105', 1, '[{\"added\": {}}]', 7, 1),
(2, '2021-01-10 18:32:36.549187', '8', 'Альметьевск, Ленина 105', 2, '[{\"changed\": {\"fields\": [\"\\u041e\\u0442\\u043a\\u0443\\u0434\\u0430\", \"\\u041a\\u0443\\u0434\\u0430\"]}}]', 7, 1),
(3, '2021-01-12 12:26:40.404636', '33', 'г. Альметьевск, улица Мира', 2, '[{\"changed\": {\"fields\": [\"\\u0410\\u0434\\u0440\\u0435\\u0441\"]}}]', 10, 1),
(4, '2021-01-12 12:26:58.635934', '32', 'г. Альметьевск, улица Джалиля', 2, '[{\"changed\": {\"fields\": [\"\\u0410\\u0434\\u0440\\u0435\\u0441\"]}}]', 10, 1),
(5, '2021-01-12 12:29:26.813056', '31', 'г. Альметьевск, улица Строителей', 2, '[{\"changed\": {\"fields\": [\"\\u0410\\u0434\\u0440\\u0435\\u0441\"]}}]', 10, 1),
(6, '2021-01-12 12:29:40.009945', '30', 'г. Альметьевск, улица Шевченко', 2, '[{\"changed\": {\"fields\": [\"\\u0410\\u0434\\u0440\\u0435\\u0441\"]}}]', 10, 1),
(7, '2021-01-12 12:29:51.470185', '29', 'г. Альметьевск, улица Ленина', 2, '[{\"changed\": {\"fields\": [\"\\u0410\\u0434\\u0440\\u0435\\u0441\"]}}]', 10, 1),
(8, '2021-01-12 12:42:37.900659', '37', '', 3, '', 10, 1),
(9, '2021-01-12 12:42:37.906659', '36', '', 3, '', 10, 1),
(10, '2021-01-12 12:42:37.910660', '35', '', 3, '', 10, 1),
(11, '2021-01-12 12:42:37.913661', '34', '', 3, '', 10, 1),
(12, '2021-01-12 16:32:21.560077', '1', 'Альметьевск', 1, '[{\"added\": {}}]', 12, 1),
(13, '2021-01-12 16:43:57.275651', '1', 'Альметьевск', 2, '[]', 12, 1),
(14, '2021-01-13 11:10:06.647012', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 4, 1),
(15, '2021-01-14 19:11:59.175065', '38', 'г. Казань, улица Татарстан', 1, '[{\"added\": {}}]', 10, 1),
(16, '2021-01-19 09:38:10.161757', '2', 'Альметьевск - Чистополь', 1, '[{\"added\": {}}]', 12, 1),
(17, '2021-01-19 09:40:08.466794', '39', 'г. Чистополь, улица Валиева', 1, '[{\"added\": {}}]', 10, 1),
(18, '2021-01-20 07:34:34.740697', '1', 'Переезд', 1, '[{\"added\": {}}]', 13, 1),
(19, '2021-01-20 07:36:18.999840', '2', 'Стройматериалы', 1, '[{\"added\": {}}]', 13, 1),
(20, '2021-01-20 07:36:44.951544', '2', 'Мебель', 2, '[{\"changed\": {\"fields\": [\"\\u0412\\u0438\\u0434 \\u0433\\u0440\\u0443\\u0437\\u0430\"]}}]', 13, 1),
(21, '2021-01-20 07:37:06.376111', '3', 'Бытовая техника', 1, '[{\"added\": {}}]', 13, 1),
(22, '2021-01-20 07:37:23.287535', '4', 'Стройматериалы', 1, '[{\"added\": {}}]', 13, 1),
(23, '2021-01-20 07:37:31.796354', '5', 'Мусор', 1, '[{\"added\": {}}]', 13, 1),
(24, '2021-01-20 07:38:36.534971', '6', 'Мототехника', 1, '[{\"added\": {}}]', 13, 1),
(25, '2021-01-20 07:38:57.305372', '7', 'Спецтехника', 1, '[{\"added\": {}}]', 13, 1),
(26, '2021-01-20 07:39:14.190256', '8', 'Спец-груз', 1, '[{\"added\": {}}]', 13, 1),
(27, '2021-01-20 07:39:29.228325', '9', 'опасный груз', 1, '[{\"added\": {}}]', 13, 1),
(28, '2021-01-20 07:47:51.453852', '9', 'опасный груз', 2, '[{\"changed\": {\"fields\": [\"\\u041a\\u043b\\u0430\\u0441\\u0441\"]}}]', 13, 1),
(29, '2021-01-20 07:47:57.293884', '8', 'Спец-груз', 2, '[{\"changed\": {\"fields\": [\"\\u041a\\u043b\\u0430\\u0441\\u0441\"]}}]', 13, 1),
(30, '2021-01-20 07:48:03.793622', '7', 'Спецтехника', 2, '[{\"changed\": {\"fields\": [\"\\u041a\\u043b\\u0430\\u0441\\u0441\"]}}]', 13, 1),
(31, '2021-01-20 07:48:10.193950', '8', 'Спец-груз', 2, '[{\"changed\": {\"fields\": [\"\\u041a\\u043b\\u0430\\u0441\\u0441\"]}}]', 13, 1),
(32, '2021-01-20 07:48:16.411022', '7', 'Спецтехника', 2, '[]', 13, 1),
(33, '2021-01-20 07:48:22.358697', '6', 'Мототехника', 2, '[{\"changed\": {\"fields\": [\"\\u041a\\u043b\\u0430\\u0441\\u0441\"]}}]', 13, 1),
(34, '2021-01-20 07:48:42.350396', '5', 'Мусор', 2, '[{\"changed\": {\"fields\": [\"\\u041a\\u043b\\u0430\\u0441\\u0441\"]}}]', 13, 1),
(35, '2021-01-20 07:48:58.365895', '4', 'Стройматериалы', 2, '[{\"changed\": {\"fields\": [\"\\u041a\\u043b\\u0430\\u0441\\u0441\"]}}]', 13, 1),
(36, '2021-01-20 07:49:04.169878', '3', 'Бытовая техника', 2, '[{\"changed\": {\"fields\": [\"\\u041a\\u043b\\u0430\\u0441\\u0441\"]}}]', 13, 1),
(37, '2021-01-20 07:49:08.286886', '3', 'Бытовая техника', 2, '[]', 13, 1),
(38, '2021-01-20 07:49:12.598838', '2', 'Мебель', 2, '[{\"changed\": {\"fields\": [\"\\u041a\\u043b\\u0430\\u0441\\u0441\"]}}]', 13, 1),
(39, '2021-01-20 07:49:17.475418', '1', 'Переезд', 2, '[{\"changed\": {\"fields\": [\"\\u041a\\u043b\\u0430\\u0441\\u0441\"]}}]', 13, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(11, 'core', 'addresses'),
(10, 'core', 'adresses'),
(13, 'core', 'cargotype'),
(12, 'core', 'cityprice'),
(7, 'core', 'orders'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Структура таблицы `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-12-27 19:19:31.614592'),
(2, 'auth', '0001_initial', '2020-12-27 19:19:31.809641'),
(3, 'admin', '0001_initial', '2020-12-27 19:19:32.251748'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-12-27 19:19:32.351771'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-12-27 19:19:32.498812'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-12-27 19:19:32.637841'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-12-27 19:19:32.731867'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-12-27 19:19:32.828891'),
(9, 'auth', '0004_alter_user_username_opts', '2020-12-27 19:19:32.860900'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-12-27 19:19:32.994933'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-12-27 19:19:33.008935'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-12-27 19:19:33.030945'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-12-27 19:19:33.100961'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-12-27 19:19:33.149971'),
(15, 'auth', '0010_alter_group_name_max_length', '2020-12-27 19:19:33.298007'),
(16, 'auth', '0011_update_proxy_permissions', '2020-12-27 19:19:33.382031'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2020-12-27 19:19:33.514062'),
(18, 'sessions', '0001_initial', '2020-12-27 19:19:33.554073'),
(19, 'core', '0001_initial', '2021-01-09 08:24:00.917613'),
(20, 'core', '0002_auto_20210107_1553', '2021-01-09 08:24:01.048845'),
(21, 'core', '0003_auto_20210108_0907', '2021-01-09 08:24:01.116112'),
(22, 'core', '0004_auto_20210109_1352', '2021-01-09 10:52:55.725192'),
(27, 'core', '0005_addresses', '2021-01-12 03:37:27.269894'),
(28, 'core', '0006_auto_20210111_1039', '2021-01-12 15:39:31.821793'),
(29, 'core', '0007_auto_20210111_1109', '2021-01-12 15:39:31.837793'),
(30, 'core', '0008_auto_20210111_2145', '2021-01-12 15:39:31.854797'),
(31, 'core', '0009_auto_20210112_1552', '2021-01-12 15:39:31.860800'),
(32, 'core', '0010_auto_20210112_1555', '2021-01-12 15:39:31.882809'),
(33, 'core', '0011_auto_20210112_1606', '2021-01-12 15:39:31.898809'),
(34, 'core', '0012_auto_20210112_1616', '2021-01-12 15:39:31.921815'),
(35, 'core', '0013_cityprice_gruz_weight', '2021-01-12 15:58:16.000174'),
(36, 'core', '0014_auto_20210112_1904', '2021-01-12 16:21:53.064738'),
(37, 'core', '0015_auto_20210112_1905', '2021-01-12 16:21:53.081743'),
(38, 'core', '0016_cityprice_price_3t', '2021-01-12 16:21:53.097743'),
(39, 'core', '0017_orders_order_price', '2021-01-19 08:45:33.804838'),
(40, 'core', '0018_auto_20210119_1228', '2021-01-19 09:28:16.119193'),
(41, 'core', '0019_cargotype', '2021-01-20 07:32:31.787622'),
(42, 'core', '0020_auto_20210120_1033', '2021-01-20 07:33:34.216140'),
(43, 'core', '0021_cargotype_cargo_class', '2021-01-20 07:45:47.897150'),
(44, 'core', '0022_auto_20210120_1047', '2021-01-20 07:47:10.048091'),
(45, 'core', '0023_orders_status', '2021-01-20 15:19:05.490137');

-- --------------------------------------------------------

--
-- Структура таблицы `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('7d0k5bv0yziux6ysk7wxglhb1vfsm78b', '.eJxVjDsOwjAQBe_iGln2-kco6XMGa23v4gBypDipEHeHSCmgfTPzXiLitta4dVriVMRFaHH63RLmB7UdlDu22yzz3NZlSnJX5EG7HOdCz-vh_h1U7PVbB8MOnB3IYMgA5syKPKBOwGBUNp5DVkVzGlyyioJ1Gl0gYPboFTvx_gDOtjeX:1l27qB:CRnYmzDL-O0f9tY-gnHeHTvq3lR1BTKvDnFJ7aTq31U', '2021-02-03 07:23:43.183355'),
('o92lxube1jc64u058pj4635xluo73hbp', '.eJxVjEEOwiAQRe_C2hDKQBGX7nsGMgODVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERIE6_G2F8cN1BumO9NRlbXZeZ5K7Ig3Y5tcTP6-H-HRTs5VurBNogOXZnA8Rs1TgOyrMxyWE20XqdsyOfICJkn2nQQOiyVlZHF1G8P-kNOF4:1kyrSt:G_j6LviPgLd9KLUAz0NjKSlypxKE4THtd070dLixCXE', '2021-01-25 07:18:11.300515');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Индексы таблицы `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Индексы таблицы `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Индексы таблицы `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Индексы таблицы `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Индексы таблицы `core_adresses`
--
ALTER TABLE `core_adresses`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `core_cargotype`
--
ALTER TABLE `core_cargotype`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `core_cityprice`
--
ALTER TABLE `core_cityprice`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `core_orders`
--
ALTER TABLE `core_orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Индексы таблицы `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Индексы таблицы `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT для таблицы `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `core_adresses`
--
ALTER TABLE `core_adresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT для таблицы `core_cargotype`
--
ALTER TABLE `core_cargotype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `core_cityprice`
--
ALTER TABLE `core_cityprice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `core_orders`
--
ALTER TABLE `core_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT для таблицы `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения внешнего ключа таблицы `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
