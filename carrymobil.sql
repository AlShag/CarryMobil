-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Мар 02 2021 г., 07:12
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
(52, 'Can view cargo type', 13, 'view_cargotype'),
(53, 'Can add Адрес', 10, 'add_address'),
(54, 'Can change Адрес', 10, 'change_address'),
(55, 'Can delete Адрес', 10, 'delete_address'),
(56, 'Can view Адрес', 10, 'view_address'),
(57, 'Can add Заказ', 7, 'add_order'),
(58, 'Can change Заказ', 7, 'change_order'),
(59, 'Can delete Заказ', 7, 'delete_order'),
(60, 'Can view Заказ', 7, 'view_order'),
(61, 'Can add profile', 14, 'add_profile'),
(62, 'Can change profile', 14, 'change_profile'),
(63, 'Can delete profile', 14, 'delete_profile'),
(64, 'Can view profile', 14, 'view_profile'),
(65, 'Can add review', 15, 'add_review'),
(66, 'Can change review', 15, 'change_review'),
(67, 'Can delete review', 15, 'delete_review'),
(68, 'Can view review', 15, 'view_review');

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
  `patronymic` varchar(50) DEFAULT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `patronymic`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$216000$DEdAGQEnuD5E$WzFyPpVCzlEtQCTDz66urKKX/O7W7jKZK6uZ0lFOTPM=', '2021-02-26 07:36:24.853455', 1, 'admin', 'Артур', 'Айратович', 'Ганиев', 'admin@admin.ru', 1, 1, '2020-12-28 08:22:09.000000'),
(2, 'pbkdf2_sha256$216000$yDpIoixoNHII$WUZbjieJbeaOXO96mqs8QhQpBK3QOAoEOCsNBws1lx4=', NULL, 0, 'test123', '', NULL, '', '', 0, 1, '2021-01-10 07:28:29.381946'),
(4, 'pbkdf2_sha256$216000$tetOGeaYzZD6$ay6zxiVvO38/8vkhX9oZmpuFwSIhwZYAbnJ340DleKI=', '2021-01-20 07:13:55.444089', 0, 'test1', '', NULL, '', '', 0, 1, '2021-01-20 07:13:48.849142'),
(5, 'pbkdf2_sha256$216000$16OK2AyjUs0l$V2LtXjPZ65qR0zAeWRlEACCWeejGsx0Fi5V7h0oEvEg=', '2021-03-01 11:12:09.683842', 1, 'artur', 'Артур', NULL, 'Ганиев', 'arr@mail.ri', 1, 1, '2021-02-17 09:55:11.351641');

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
-- Структура таблицы `core_address`
--

CREATE TABLE `core_address` (
  `id` int(11) NOT NULL,
  `address` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=koi8u;

--
-- Дамп данных таблицы `core_address`
--

INSERT INTO `core_address` (`id`, `address`) VALUES
(29, 'г. Альметьевск, улица Ленина'),
(30, 'г. Альметьевск, улица Шевченко'),
(31, 'г. Альметьевск, улица Строителей'),
(32, 'г. Альметьевск, улица Джалиля'),
(33, 'г. Альметьевск, улица Мира'),
(38, 'г. Казань, улица Татарстан'),
(39, 'г. Чистополь, улица Валиева'),
(40, 'г. Альметьевск, улица Гафиатуллина');

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
-- Структура таблицы `core_order`
--

CREATE TABLE `core_order` (
  `id` int(11) NOT NULL,
  `road_comment` longtext DEFAULT NULL,
  `loader_count` int(11) DEFAULT NULL,
  `loader_time_count` int(11) DEFAULT NULL,
  `user_tel_nomer` varchar(20) NOT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `order_price` int(11) NOT NULL,
  `cargo_type` varchar(50) NOT NULL,
  `cargo_type_comment` longtext DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `full_road` varchar(300) NOT NULL,
  `prices` varchar(150) DEFAULT NULL,
  `sended_in` datetime(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `core_order`
--

INSERT INTO `core_order` (`id`, `road_comment`, `loader_count`, `loader_time_count`, `user_tel_nomer`, `start_time`, `order_price`, `cargo_type`, `cargo_type_comment`, `status`, `full_road`, `prices`, `sended_in`) VALUES
(35, '', 1, 2, '89196420035', NULL, 9200, '', '', 0, '[0]from:г. Альметьевск, улица Строителей;to:г. Казань, улица Татарстан;passing_to:0;/[1]from:г. Альметьевск, улица Строителей;to:г. Альметьевск, улица Мира;passing_\\to:1;/', NULL, '2021-02-18 06:53:16.554744'),
(36, '', NULL, NULL, '89196420035', NULL, 500, 'Бытовая техника', '', 0, '[0]from:г. Альметьевск, улица Шевченко;to:г. Альметьевск, улица Шевченко;passing_to:0;/', NULL, '2021-02-18 06:53:16.554744'),
(37, '', NULL, NULL, '89196420035', NULL, 500, 'Мототехника', '', 0, '[0]from:г. Альметьевск, улица Мира;to:г. Альметьевск, улица Шевченко;passing_to:0;/', NULL, '2021-02-18 06:53:16.554744'),
(38, '', 1, 2, '89196420035', NULL, 1200, '', '', 1, '[0]from:г. Альметьевск, улица Шевченко;to:г. Альметьевск, улица Мира;passing_to:0;/', NULL, '2021-02-18 06:53:16.554744'),
(39, '', 1, 2, '89196420035', NULL, 1200, '', '', 0, '[0]from:г. Альметьевск, улица Шевченко 32;to:г. Альметьевск, улица Строителей 51;passing_to:0;/', '0)500;/type_price:0/loader_price:700', '2021-02-18 06:53:16.554744'),
(40, '', 2, 2, '89196420035', NULL, 2400, 'Бытовая техника', '', 0, '[0]from:г. Альметьевск, улица Джалиля;to:г. Альметьевск, улица Строителей;passing_to:0;/[1]from:г. Альметьевск, улица Джалиля;to:г. Альметьевск, улица Мира;passing_to:1;/', '1000/0)500;1)500;/type_price:0/loader_price:1400', '2021-02-18 06:53:16.554744'),
(43, '', NULL, NULL, '89196420035', '2021-02-27 13:00:00.000000', 1500, '', '', 0, '[0]from:г. Альметьевск, улица Ленина 12;to:г. Альметьевск, улица Гафиатуллина 21;passing_to:0;/[1]from:г. Альметьевск, улица Джалиля;to:г. Альметьевск, улица Джалиля;passing_to:0;/[2]from:г. Альметьевск, улица Шевченко;to:г. Альметьевск, улица Строителей 51;passing_to:0;/', '1500/0)500;1)500;2)500;/type_price:0/loader_price:0/', '2021-02-23 19:08:50.000000'),
(45, '', 1, 2, '89196420035', '2021-03-26 17:13:00.000000', 1700, 'Стройматериалы', '', 0, '[0]from:г. Альметьевск, улица Ленина;to:г. Альметьевск, улица Шевченко;passing_to:0;/[1]from:г. Альметьевск, улица Ленина;to:г. Альметьевск, улица Мира 10;passing_to:1;/', '1000/0)500;1)500;/type_price:0/loader_price:700/', '2021-03-01 15:25:47.000000'),
(46, '', 1, 1, '89196420035', NULL, 8350, 'Стройматериалы', '', 0, '[0]from:г. Альметьевск, улица Ленина;to:г. Казань, улица Татарстан;passing_to:0;/', '8000/0)8000;/type_price:0/loader_price:350/', '2021-03-02 05:57:35.000000'),
(47, '', NULL, NULL, '8457866358764', NULL, 1000, '', '', 0, '[0]from:г. Альметьевск, улица Строителей;to:г. Альметьевск, улица Джалиля;passing_to:0;/[1]from:г. Альметьевск, улица Строителей;to:г. Альметьевск, улица Гафиатуллина;passing_to:0;/', '1000/0)500;1)500;/type_price:0/loader_price:0/', '2021-03-02 05:57:35.000000');

-- --------------------------------------------------------

--
-- Структура таблицы `core_profile`
--

CREATE TABLE `core_profile` (
  `id` int(11) NOT NULL,
  `company` varchar(40) NOT NULL,
  `location` varchar(30) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `core_profile`
--

INSERT INTO `core_profile` (`id`, `company`, `location`, `birth_date`, `user_id`) VALUES
(1, 'Кэрримобил', 'Тайсуган аулы', '2001-09-04', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `core_review`
--

CREATE TABLE `core_review` (
  `id` int(11) NOT NULL,
  `text` longtext NOT NULL,
  `published_date` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  `likes` int(11),
  `stars` int(11)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `core_review`
--

INSERT INTO `core_review` (`id`, `text`, `published_date`, `author_id`, `likes`, `stars`) VALUES
(1, 'Классный сервис)', '2021-02-18 15:19:47.935207', 5, 0, 1),
(3, 'Хороший сервис, всем советую!', '2021-02-27 03:00:37.239123', 5, 0, 5);

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
(39, '2021-01-20 07:49:17.475418', '1', 'Переезд', 2, '[{\"changed\": {\"fields\": [\"\\u041a\\u043b\\u0430\\u0441\\u0441\"]}}]', 13, 1),
(40, '2021-02-23 12:24:57.295880', '40', 'г. Альметьевск, улица Гафиатуллина 35', 1, '[{\"added\": {}}]', 10, 5),
(41, '2021-02-23 12:25:04.496392', '40', 'г. Альметьевск, улица Гафиатуллина', 2, '[{\"changed\": {\"fields\": [\"\\u0410\\u0434\\u0440\\u0435\\u0441\"]}}]', 10, 5);

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
(10, 'core', 'address'),
(11, 'core', 'addresses'),
(13, 'core', 'cargotype'),
(12, 'core', 'cityprice'),
(7, 'core', 'order'),
(14, 'core', 'profile'),
(15, 'core', 'review'),
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
(45, 'core', '0023_orders_status', '2021-01-20 15:19:05.490137'),
(46, 'core', '0024_auto_20210122_1040', '2021-01-23 03:28:26.878863'),
(47, 'core', '0025_profile', '2021-02-16 15:10:51.472821'),
(48, 'core', '0026_order_full_road', '2021-02-16 15:11:47.534230'),
(49, 'core', '0027_auto_20210217_1154', '2021-02-17 08:55:05.566998'),
(50, 'core', '0028_order_prices', '2021-02-17 10:54:33.954955'),
(51, 'core', '0029_auto_20210218_0653', '2021-02-18 03:53:30.218134'),
(52, 'core', '0026_review', '2021-02-18 14:42:55.207030'),
(53, 'core', '0027_auto_20210216_1814', '2021-02-18 14:42:55.322059'),
(54, 'core', '0030_merge_20210218_1742', '2021-02-18 14:42:55.400078'),
(55, 'core', '0031_auto_20210227_0550', '2021-02-27 02:50:52.086767');

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
('3puhx8akbfgssfpqw9auxaggu8p2insn', 'e30:1lFWKB:Ty4HGZSbYRrA-muZSfofuPJUHznzpG4wQPyUK6EuZJk', '2021-03-12 06:10:03.847939'),
('ddcsu1e1db99xc0rrbevy0venpz0ba4t', 'e30:1lFWG1:bwLNYtBhvs2RqSdwVtIg1OVmhPHlGJK1MLMcyiQZbog', '2021-03-12 06:05:45.104282'),
('e9mzu2veowdmgk3wgon4s3k8imd2k5el', 'e30:1lFXfk:cM69Wz_wpu_JknmSPrm6uC1TeAva_-Kx6XxS0puSGlI', '2021-03-12 07:36:24.847455'),
('f51ts03uy1iddq6apw7x7bnnt1u86uoj', 'e30:1lFWFr:E7dtgeV-7Vm_F7zddDDVJHVTf_jXqNeHz-HMkER5siU', '2021-03-12 06:05:35.393526'),
('jcasvxmsplwew68i7qzp6war45lrtuln', '.eJxVjDsOwjAQBe_iGln4I7OmpOcM1nrXiwPIluKkQtwdIqWA9s3Me6mE61LTOsqcJlZnZdThd8tIj9I2wHdst66pt2West4UvdOhr53L87K7fwcVR_3WEi0EZ72JlsELYQbxmciAlBOEiJayBGQB4yiUI0t0kMU5QA-FUb0_9UI43Q:1l70Nr:wyDFGKLMz18ixfvjeQqXP_sdf3LjMyS015r7Dxfhwoc', '2021-02-16 18:26:39.325674'),
('o92lxube1jc64u058pj4635xluo73hbp', '.eJxVjEEOwiAQRe_C2hDKQBGX7nsGMgODVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3ERIE6_G2F8cN1BumO9NRlbXZeZ5K7Ig3Y5tcTP6-H-HRTs5VurBNogOXZnA8Rs1TgOyrMxyWE20XqdsyOfICJkn2nQQOiyVlZHF1G8P-kNOF4:1kyrSt:G_j6LviPgLd9KLUAz0NjKSlypxKE4THtd070dLixCXE', '2021-01-25 07:18:11.300515'),
('rz2emdg2zumtcjy0etzewds0bk93xt4g', '.eJxVjDEOwjAMRe-SGUWt4qQOIztnqBzbkAJKpKadKu4OlTrA-t97fzMjrUse16bzOIk5G29Ov1sifmrZgTyo3KvlWpZ5SnZX7EGbvVbR1-Vw_w4ytfyt-wBBfUc-ORw8UAzgASP3EEQ7TR1GAHUs6IQxSULPQ0RCF28cCcz7A8T1N5k:1lGgTB:j4Zqc1l4-8I44N2N-iyvfrvJoFMvd1CYtkAL4ieUlSY', '2021-03-15 11:12:09.716850');

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
-- Индексы таблицы `core_address`
--
ALTER TABLE `core_address`
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
-- Индексы таблицы `core_order`
--
ALTER TABLE `core_order`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `core_profile`
--
ALTER TABLE `core_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Индексы таблицы `core_review`
--
ALTER TABLE `core_review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_review_author_id_b9ff1c35_fk_auth_user_id` (`author_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT для таблицы `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
-- AUTO_INCREMENT для таблицы `core_address`
--
ALTER TABLE `core_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

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
-- AUTO_INCREMENT для таблицы `core_order`
--
ALTER TABLE `core_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT для таблицы `core_profile`
--
ALTER TABLE `core_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `core_review`
--
ALTER TABLE `core_review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT для таблицы `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

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
-- Ограничения внешнего ключа таблицы `core_profile`
--
ALTER TABLE `core_profile`
  ADD CONSTRAINT `core_profile_user_id_bf8ada58_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения внешнего ключа таблицы `core_review`
--
ALTER TABLE `core_review`
  ADD CONSTRAINT `core_review_author_id_b9ff1c35_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`);

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
