-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Янв 11 2021 г., 20:21
-- Версия сервера: 10.3.16-MariaDB
-- Версия PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
) ENGINE=InnoDB DEFAULT CHARSET=koi8u;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=koi8u;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=koi8u;

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
(25, 'Can add orders', 7, 'add_orders'),
(26, 'Can change orders', 7, 'change_orders'),
(27, 'Can delete orders', 7, 'delete_orders'),
(28, 'Can view orders', 7, 'view_orders'),
(29, 'Can add addresses', 8, 'add_addresses'),
(30, 'Can change addresses', 8, 'change_addresses'),
(31, 'Can delete addresses', 8, 'delete_addresses'),
(32, 'Can view addresses', 8, 'view_addresses'),
(33, 'Can add adresses', 9, 'add_adresses'),
(34, 'Can change adresses', 9, 'change_adresses'),
(35, 'Can delete adresses', 9, 'delete_adresses'),
(36, 'Can view adresses', 9, 'view_adresses');

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
) ENGINE=InnoDB DEFAULT CHARSET=koi8u;

--
-- Дамп данных таблицы `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'test123', '0000-00-00 00:00:00.000000', 0, 'test', 'test', 'test', 'test@mail.ru', 0, 0, '0000-00-00 00:00:00.000000'),
(3, 'pbkdf2_sha256$216000$ek4dtdKtLLx0$vmwaItSDD+YEDcy+Xuwqyn5wbQW2jlb6YeuPtMQurOk=', '2021-01-11 07:18:11.000000', 1, 'artur', 'Артур', 'Ганиев', 'artur.ganiev.2001@mail.ru', 1, 1, '2021-01-11 07:17:11.000000');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=koi8u;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=koi8u;

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
(29, 'улица Ленина 105, Альметьевск'),
(30, 'улица Шевченко 105, Альметьевск'),
(31, 'улица Строителей 21, Альметьевск'),
(32, 'улица Джалиля 21, Альметьевск'),
(33, 'улица Мира 10, Альметьевск'),
(34, '');

-- --------------------------------------------------------

--
-- Структура таблицы `core_orders`
--

CREATE TABLE `core_orders` (
  `id` int(11) NOT NULL,
  `from_adress` varchar(150) NOT NULL,
  `to_adress` varchar(150) NOT NULL,
  `road_comment` longtext DEFAULT NULL,
  `gruz_type` varchar(50) NOT NULL,
  `gruz_type_comment` longtext DEFAULT NULL,
  `loader_count` int(11) DEFAULT NULL,
  `loader_time_count` int(11) DEFAULT NULL,
  `user_tel_nomer` varchar(20) NOT NULL,
  `start_time` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=koi8u;

--
-- Дамп данных таблицы `core_orders`
--

INSERT INTO `core_orders` (`id`, `from_adress`, `to_adress`, `road_comment`, `gruz_type`, `gruz_type_comment`, `loader_count`, `loader_time_count`, `user_tel_nomer`, `start_time`) VALUES
(1, 'Альметьевск Ленина 107', 'Альметьевск Ленина 105', 'Нету', 'переезд', 'Нету', 2, 2, '89872191853', '2021-01-20 04:11:15.000000'),
(2, 'Ленина 105, Альметьевск', 'Ленина 103, Альметьевск', '', 'Мебель', '', 1, 1, '89872191853', '2021-01-16 11:21:00.000000'),
(3, 'Ленина 105, Альметьевск', 'Ленина 103, Альметьевск', '', 'Мото-техника', '', 2, 1, '89872191853', NULL),
(4, 'Тукая 37, Альметьевск', 'Ленина 103, Альметьевск', '', 'Мебель', '', 2, 3, '89872191865', '2021-01-16 20:20:00.000000'),
(5, 'Базовая 1', 'Базовая 2', NULL, 'Стройматериалы', NULL, NULL, NULL, '', NULL),
(6, 'улица Ленина 105, Альметьевск', 'улица Джалиля 21, Альметьевск', '', 'Мото-техника', '', 1, 1, '89872191865', '2021-01-14 13:25:00.000000');

-- --------------------------------------------------------

--
-- Структура таблицы `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL
) ;

--
-- Дамп данных таблицы `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(2, '2021-01-11 07:39:58.058432', '1', 'Ленина 105, Альметьевск', 1, '[{\"added\": {}}]', 9, 3),
(3, '2021-01-11 08:20:39.318020', '2', 'Ленина 105, Альметьевск', 1, '[{\"added\": {}}]', 9, 3),
(4, '2021-01-11 08:20:50.099585', '3', 'Ленина 104, Альметьевск', 1, '[{\"added\": {}}]', 9, 3),
(5, '2021-01-11 09:43:20.872851', '3', 'artur', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 3),
(6, '2021-01-11 18:56:16.421164', '29', 'улица Ленина 105, Альметьевск', 1, '[{\"added\": {}}]', 9, 3),
(7, '2021-01-11 19:11:01.029913', '30', 'улица Шевченко 105', 1, '[{\"added\": {}}]', 9, 3),
(8, '2021-01-11 19:11:12.213821', '31', 'улица Строителей 21', 1, '[{\"added\": {}}]', 9, 3),
(9, '2021-01-11 19:11:28.166692', '32', 'Улица Джалиля 21', 1, '[{\"added\": {}}]', 9, 3),
(10, '2021-01-11 19:11:50.505201', '33', 'улица Мира 10, Альметьевск', 1, '[{\"added\": {}}]', 9, 3),
(11, '2021-01-11 19:12:23.531032', '32', 'улица Джалиля 21, Альметьевск', 2, '[{\"changed\": {\"fields\": [\"\\u0410\\u0434\\u0440\\u0435\\u0441\"]}}]', 9, 3),
(12, '2021-01-11 19:12:36.528871', '31', 'улица Строителей 21, Альметьевск', 2, '[{\"changed\": {\"fields\": [\"\\u0410\\u0434\\u0440\\u0435\\u0441\"]}}]', 9, 3),
(13, '2021-01-11 19:12:54.273213', '30', 'улица Шевченко 105, Альметьевск', 2, '[{\"changed\": {\"fields\": [\"\\u0410\\u0434\\u0440\\u0435\\u0441\"]}}]', 9, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=koi8u;

--
-- Дамп данных таблицы `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(8, 'core', 'addresses'),
(9, 'core', 'adresses'),
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
) ENGINE=InnoDB DEFAULT CHARSET=koi8u;

--
-- Дамп данных таблицы `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-12-26 16:45:51.619386'),
(2, 'auth', '0001_initial', '2020-12-26 16:45:53.229724'),
(3, 'admin', '0001_initial', '2020-12-26 16:46:02.531331'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-12-26 16:46:05.324753'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-12-26 16:46:05.391147'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-12-26 16:46:07.473145'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-12-26 16:46:07.602061'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-12-26 16:46:07.727050'),
(9, 'auth', '0004_alter_user_username_opts', '2020-12-26 16:46:07.779781'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-12-26 16:46:08.668439'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-12-26 16:46:08.836416'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-12-26 16:46:08.918437'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-12-26 16:46:09.060047'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-12-26 16:46:09.160623'),
(15, 'auth', '0010_alter_group_name_max_length', '2020-12-26 16:46:09.400860'),
(16, 'auth', '0011_update_proxy_permissions', '2020-12-26 16:46:09.454571'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2020-12-26 16:46:09.551248'),
(18, 'sessions', '0001_initial', '2020-12-26 16:46:09.962366'),
(19, 'core', '0001_initial', '2021-01-07 08:12:19.377198'),
(20, 'core', '0002_auto_20210107_1553', '2021-01-07 12:53:38.745516'),
(21, 'core', '0003_auto_20210108_0907', '2021-01-08 06:07:37.669624'),
(22, 'core', '0004_auto_20210109_1352', '2021-01-11 06:58:04.603075'),
(23, 'core', '0005_addresses', '2021-01-11 06:58:05.976097'),
(24, 'core', '0006_auto_20210111_1039', '2021-01-11 07:39:39.815079'),
(25, 'core', '0007_auto_20210111_1109', '2021-01-11 08:09:53.927838'),
(26, 'core', '0008_auto_20210111_2145', '2021-01-11 18:46:10.645805');

-- --------------------------------------------------------

--
-- Структура таблицы `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=koi8u;

--
-- Дамп данных таблицы `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
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
-- Индексы таблицы `core_orders`
--
ALTER TABLE `core_orders`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT для таблицы `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT для таблицы `core_orders`
--
ALTER TABLE `core_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
