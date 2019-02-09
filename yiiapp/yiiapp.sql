-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 09 2019 г., 18:18
-- Версия сервера: 10.1.35-MariaDB
-- Версия PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `yiiapp`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`category_id`, `name`, `slug`, `description`, `parent`) VALUES
(4, 'Спорт', 'sport', 'Спорт', 0),
(5, 'Авто', 'avto', 'Авто', 4),
(6, 'Гонки', 'gonki', 'Гонки', 5),
(7, 'Формула1', 'formula1', 'Формула1', 6),
(8, 'Ралли', 'ralli', 'Ралли', 5),
(9, 'Мото', 'moto', 'Мото', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1549655217),
('m130524_201442_init', 1549655232),
('m190209_071219_category', 1549699018),
('m190209_102319_news', 1549708243);

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE `news` (
  `news_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`news_id`, `title`, `slug`, `description`, `category_id`) VALUES
(2, 'Презентации новых машин: Haas VF-19', 'presentacii_machin', '\r\nВ четверг, 7 февраля, в Королевском автомобильном клубе в Лондоне команда Haas провела презентацию титульного спонсора Rich Energy и показала новую раскраску. Кевин Магнуссен и Роман Грожан стянули защитное покрывало с прошлогодней машины с антикрылом 2', 7),
(3, 'Сан-Марино\'95: Возвращение чемпиона-2', 'vozvrashenie_chempiona', 'Гонка #567. 30 апреля 1995 года. Гран При Сан-Марино. Имола\r\nПоул	Михаэль Шумахер (Benetton B195) – 1:27,274 (201,916 км/ч)\r\nЛучший круг	Герхард Бергер (Ferrari 412 T2) – 1:29,568 (196,744 км/ч)\r\nПобедитель	Деймон Хилл (Williams FW17) – 1:41:42,552 (181,9', 7),
(4, 'Rally Mexico: бензин должен быть!', 'rally_mexico', 'Пока что центральным событием WRC в ближайшее время считается Rally Sweden – все-таки интересно, как будут развиваться события после головоломного Rallye Automobile de Monte-Carlo, где до последних метров дистанции никто не знал, кто именно станет победит', 8),
(5, '«Дакар»-2018: детективная история', 'dakar', 'Пока разгорается первостатейный скандал в грузовом зачете (вчера Федерико Вильягра произвел дозаправку в зоне нейтрализации, что запрещено правилами), сейчас можно ненадолго отвлечься. И вспомнить о другой истории, которая стремительно вспыхнула несколько', 8),
(6, 'Окон пообещал преобразить себя к моменту возвращения в Ф1', 'okon', 'Эстебан Окон провел в Формуле 1 два с половиной года, после чего потерял место в чемпионате мира. Существует вероятность, что спустя сезон он вернется – по крайней мере, глава Mercedes Тото Вольф заявил, что гарантирует своему подопечному место в конкурен', 9),
(7, 'Сын Ханта ответил на вопросы пользователей Reddit. Он не знает, сколько у него братьев!', 'syn_hanta', 'Что вы думаете о фильме «Гонка» и о том, каким в нем изображен ваш папа?\r\n\r\nВ целом это хороший фильм, но сделать его можно было лучше. Игра Даниэля Брюля – произведение искусства, а вот [Крису] Хемсворту совершенно не удалось схватить характер отца. Он д', 9);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'user1', 'L9wYxn2cEYv3sbMesWfwSwlwq_UPAup5', '$2y$13$WwO5R6cOaPrlTtrOZjbeouMX5WIXs/6WXXxeqc4GcJ.55p0JbJcSS', NULL, 'artem_ishenko@meta.ua', 10, 1549655663, 1549655663),
(2, 'user2', 'NRAeGuNALMx3SYTA9by8-c_MKNDJRBOT', '$2y$13$fbLAZMgHhHsUmF7ixALIR.m52/m7GR/oOoJiQhgIcOfZgNiiFCCWa', NULL, 'sf', 10, 1549663545, 1549663545);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
