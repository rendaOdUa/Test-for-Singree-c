-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Апр 24 2017 г., 15:43
-- Версия сервера: 5.7.14
-- Версия PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `yii2advanced`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `avatarUrl` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `text`, `avatarUrl`) VALUES
(11, 6, 13, 'Ага. Хорошо', '//gravatar.com/avatar/c81b1b90a218dc65eb6a999fe5abb178?s=50'),
(10, 5, 13, 'Это пример комментария :)', '//gravatar.com/avatar/c81b1b90a218dc65eb6a999fe5abb178?s=50'),
(9, 1, 2, '333', '//gravatar.com/avatar/ea4be6b3fe1f8fc32cbcb4a353b49890?s=50'),
(12, 5, 14, 'И еще один для наглядности', '//gravatar.com/avatar/?s=50');

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1492701602),
('m140209_132017_init', 1492701610),
('m140403_174025_create_account_table', 1492701611),
('m140504_113157_update_tables', 1492701614),
('m140504_130429_create_token_table', 1492701614),
('m140830_171933_fix_ip_field', 1492701615),
('m140830_172703_change_account_table_name', 1492701615),
('m141222_110026_update_ip_field', 1492701615),
('m141222_135246_alter_username_length', 1492701616),
('m150614_103145_update_social_account_table', 1492701618),
('m150623_212711_fix_username_notnull', 1492701618),
('m151218_234654_add_timezone_to_profile', 1492701618),
('m160929_103127_add_last_login_at_to_user_table', 1492701619),
('m010101_100001_init_comment', 1493024526),
('m160629_121330_add_relatedTo_column_to_comment', 1493024527),
('m161109_092304_rename_comment_table', 1493024527),
('m161114_094902_add_url_column_to_comment_table', 1493024527);

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `date` datetime NOT NULL,
  `avatarUrl` varchar(255) DEFAULT NULL,
  `imageUrl` varchar(400) DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT '0',
  `rating_count` int(11) NOT NULL DEFAULT '0',
  `appreciated` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `text`, `content`, `date`, `avatarUrl`, `imageUrl`, `rating`, `rating_count`, `appreciated`) VALUES
(10, 13, 'Почему он используется?', 'Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которо', '', '2017-04-24 14:50:39', '//gravatar.com/avatar/c81b1b90a218dc65eb6a999fe5abb178?s=50', '/uploads/13/pochemu-on-ispol-zuetsya/User 10.jpg', 0, 0, NULL),
(8, 14, 'И так далее...', 'Дальше будут просто заглушки с Lorem Ipsum', '', '2017-04-24 14:47:08', '//gravatar.com/avatar/?s=50', '/uploads/14/i-tak-dalee/User 05.jpg', 4, 2, 'a:2:{i:14;s:1:"3";i:13;s:1:"1";}'),
(9, 14, 'Что такое Lorem Ipsum?', 'Lorem Ipsum - это текст-"рыба", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной "рыбой" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя', '', '2017-04-24 14:48:23', '//gravatar.com/avatar/?s=50', '/uploads/14/chto-takoe-lorem-ipsum/User 02.jpg', 0, 0, NULL),
(6, 13, 'Что еще...', 'Можно заполнить профиль, добавить граватар и т.п.\r\nКартинки справа, аватарки слева.\r\nЕсть пагинация на 10 постов...', '', '2017-04-24 14:39:11', '//gravatar.com/avatar/c81b1b90a218dc65eb6a999fe5abb178?s=50', '/uploads/13/chto-esche/User 17.jpg', 7, 2, 'a:2:{i:14;s:1:"4";i:13;s:1:"3";}'),
(7, 14, 'А это другой пользователь', 'Оценку можно выставить одну на один пост с одного пользователя.\r\nВыводится ваша оценка + средняя.', '', '2017-04-24 14:43:38', '//gravatar.com/avatar/?s=50', '/uploads/14/a-eto-drugoy-pol-zovatel/User 16.jpg', 2, 1, 'a:1:{i:14;s:1:"2";}'),
(5, 13, 'Первый пост', 'По сути ни чего интересного...\r\nПосле регистрации можно создавать, оценивать посты и комментировать их.', '', '2017-04-24 14:36:30', '//gravatar.com/avatar/c81b1b90a218dc65eb6a999fe5abb178?s=50', '/uploads/13/pervyy-post/111.jpg', 3, 1, 'a:1:{i:14;s:1:"3";}'),
(11, 13, ' Откуда он появился?', 'Многие думают, что Lorem Ipsum - взятый с потолка псевдо-латинский набор слов, но это не совсем так. Его корни уходят в один фрагмент классической латыни 45 года н.э., то есть более двух тысячелетий назад. Ричард МакКлинток, профессор латыни из колледжа H', '', '2017-04-24 14:51:01', '//gravatar.com/avatar/c81b1b90a218dc65eb6a999fe5abb178?s=50', '/uploads/13/otkuda-on-poyavilsya/User 09.jpg', 0, 0, NULL),
(12, 13, 'Где его взять?', 'Есть много вариантов Lorem Ipsum, но большинство из них имеет не всегда приемлемые модификации, например, юмористические вставки или слова, которые даже отдалённо не напоминают латынь. Если вам нужен Lorem Ipsum для серьёзного проекта, вы наверняка не хот', '', '2017-04-24 14:51:41', '//gravatar.com/avatar/c81b1b90a218dc65eb6a999fe5abb178?s=50', '/uploads/13/gde-ego-vzyat/User 03.jpg', 4, 1, 'a:1:{i:13;s:1:"4";}'),
(13, 13, ' Откуда он появился?', 'Есть много вариантов Lorem Ipsum, но большинство из них имеет не всегда приемлемые модификации, например, юмористические вставки или слова, которые даже отдалённо не напоминают латынь. Если вам нужен Lorem Ipsum для серьёзного проекта, вы наверняка не хот', '', '2017-04-24 14:51:58', '//gravatar.com/avatar/c81b1b90a218dc65eb6a999fe5abb178?s=50', '/uploads/13/otkuda-on-poyavilsya/User 06.jpg', 0, 0, NULL),
(14, 13, ' Откуда он появился?', 'бразцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, пр', '', '2017-04-24 14:52:22', '//gravatar.com/avatar/c81b1b90a218dc65eb6a999fe5abb178?s=50', '/uploads/13/otkuda-on-poyavilsya/User 04.jpg', 0, 0, NULL),
(15, 13, 'нский набор слов, но это не совсем так.', 'нский набор слов, но это не совсем так. Его корни уходят в один фрагмент классической латыни 45 года н.э., то есть более двух тысячелетий назад. Ричард МакКлинток, профессор латыни из колледжа Hampden-Sydney, шт', '', '2017-04-24 14:53:37', '//gravatar.com/avatar/c81b1b90a218dc65eb6a999fe5abb178?s=50', '/uploads/13/nskiy-nabor-slov-no-eto-ne-sovsem-tak/user8.jpg', 0, 0, NULL),
(16, 13, 'нский набор слов, но это не со', 'нский набор слов, но это не совсем так. Его корни уходят в один фрагмент классической латыни 45 года н.э., то есть более двух тысячелетий назад. Ричард МакКлинток, профессор латыни из колледжа Hampden', '', '2017-04-24 14:56:52', '//gravatar.com/avatar/c81b1b90a218dc65eb6a999fe5abb178?s=50', '/uploads/13/nskiy-nabor-slov-no-eto-ne-so/111.jpg', 4, 1, 'a:1:{i:13;s:1:"4";}'),
(17, 13, 'нский набор слов, но это не со', 'нский набор слов, но это не совсем так. Его корни уходят в один фрагмент классической латыни 45 года н.э., то есть более двух тысячелетий назад. Ричард МакКлинток, профессор латыни из колледжа Hampden', '', '2017-04-24 14:57:03', '//gravatar.com/avatar/c81b1b90a218dc65eb6a999fe5abb178?s=50', '/uploads/13/nskiy-nabor-slov-no-eto-ne-so/111.jpg', 3, 1, 'a:1:{i:13;s:1:"3";}'),
(18, 13, 'нский набор слов, но это не со', 'нский набор слов, но это не совсем так. Его корни уходят в один фрагмент классической латыни 45 года н.э., то есть более двух тысячелетий назад. Ричард МакКлинток, профессор латыни из колледжа Hampden', '', '2017-04-24 14:57:09', '//gravatar.com/avatar/c81b1b90a218dc65eb6a999fe5abb178?s=50', '/uploads/13/nskiy-nabor-slov-no-eto-ne-so/User 08.jpg', 0, 0, NULL),
(19, 13, 'нский набор слов, но это не со', 'нский набор слов, но это не совсем так. Его корни уходят в один фрагмент классической латыни 45 года н.э., то есть более двух тысячелетий назад. Ричард МакКлинток, профессор латыни из колледжа Hampden', '', '2017-04-24 14:57:37', '//gravatar.com/avatar/c81b1b90a218dc65eb6a999fe5abb178?s=50', '/uploads/13/nskiy-nabor-slov-no-eto-ne-so/User 05.jpg', 0, 0, NULL),
(20, 13, 'нский набор слов, но это не со', 'нский набор слов, но это не совсем так. Его корни уходят в один фрагмент классической латыни 45 года н.э., то есть более двух тысячелетий назад. Ричард МакКлинток, профессор латыни из колледжа Hampden', '', '2017-04-24 14:57:51', '//gravatar.com/avatar/c81b1b90a218dc65eb6a999fe5abb178?s=50', '/uploads/13/nskiy-nabor-slov-no-eto-ne-so/User 06.jpg', 0, 0, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `profile`
--

CREATE TABLE `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci,
  `timezone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `profile`
--

INSERT INTO `profile` (`user_id`, `name`, `public_email`, `gravatar_email`, `gravatar_id`, `location`, `website`, `bio`, `timezone`) VALUES
(13, 'Артём', 'artem.rendak@mail.ru', 'artem.rendak@mail.ru', 'c81b1b90a218dc65eb6a999fe5abb178', 'Одесса', '', 'lol', 'Pacific/Majuro'),
(14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `social_account`
--

CREATE TABLE `social_account` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `token`
--

CREATE TABLE `token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `token`
--

INSERT INTO `token` (`user_id`, `code`, `created_at`, `type`) VALUES
(13, 'oG1kxESWVC0xwYjM8ZAm9HpOtW6ZB-1V', 1493044546, 0),
(14, '-SUfy0oWSAM3HIe6Goia1vGND52KYS0a', 1493045005, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `registration_ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  `last_login_at` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '10'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `confirmed_at`, `unconfirmed_email`, `blocked_at`, `registration_ip`, `created_at`, `updated_at`, `flags`, `last_login_at`, `status`) VALUES
(13, 'Renda', 'artem.rendak@mail.ru', '$2y$12$vg15cCbyyB1eqDSgyw8j9eA5wMQ2Yi.ipzcqFdhEmo38CwB6X139u', 'YWGDMRqvzy3--uDiZ4usN1sfwrVQM8bV', NULL, NULL, NULL, '::1', 1493044546, 1493044546, 0, 1493045949, 10),
(14, 'Masha', 'artem.rendak2@mail.ru', '$2y$12$Yrt.tIZH3KlF8wvTFXE4uOOTqkO589Gbi6WvlJH15qZ6EFtCn.cQ.', 'z8hkGXKn2uezpu6LMSv9nRt77bSCoJEb', NULL, NULL, NULL, '::1', 1493045005, 1493045005, 0, 1493045014, 10);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`user_id`);

--
-- Индексы таблицы `social_account`
--
ALTER TABLE `social_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_unique` (`provider`,`client_id`),
  ADD UNIQUE KEY `account_unique_code` (`code`),
  ADD KEY `fk_user_account` (`user_id`);

--
-- Индексы таблицы `token`
--
ALTER TABLE `token`
  ADD UNIQUE KEY `token_unique` (`user_id`,`code`,`type`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_unique_username` (`username`),
  ADD UNIQUE KEY `user_unique_email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT для таблицы `social_account`
--
ALTER TABLE `social_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `social_account`
--
ALTER TABLE `social_account`
  ADD CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `token`
--
ALTER TABLE `token`
  ADD CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
