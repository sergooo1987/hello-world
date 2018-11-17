-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Ноя 17 2018 г., 19:28
-- Версия сервера: 5.7.21-20-beget-5.7.21-20-1-log
-- Версия PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `infokog1_test`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Department`
--
-- Создание: Ноя 17 2018 г., 14:50
-- Последнее обновление: Ноя 17 2018 г., 14:51
--

DROP TABLE IF EXISTS `Department`;
CREATE TABLE `Department` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Department`
--

INSERT INTO `Department` (`id`, `name`) VALUES
(1, 'Дирекция'),
(2, 'Финансовый отдел');

-- --------------------------------------------------------

--
-- Структура таблицы `Emploee`
--
-- Создание: Ноя 17 2018 г., 14:50
-- Последнее обновление: Ноя 17 2018 г., 15:07
--

DROP TABLE IF EXISTS `Emploee`;
CREATE TABLE `Emploee` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `salary` int(6) NOT NULL,
  `department_id` int(11) NOT NULL,
  `birthday` date NOT NULL,
  `city` varchar(50) NOT NULL,
  `gender` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Emploee`
--

INSERT INTO `Emploee` (`id`, `name`, `salary`, `department_id`, `birthday`, `city`, `gender`) VALUES
(1, 'Иван', 6000, 1, '1960-11-17', 'Москва', 1),
(2, 'Наталья', 10000, 2, '2018-11-01', 'Санкт-Петербург', 2),
(3, 'Светлана', 12000, 1, '2018-11-15', 'Иваново', 2),
(4, 'Анатолий', 14000, 1, '2000-11-17', 'Тверь', 1),
(5, 'Петр', 15000, 2, '2018-11-15', 'Астана', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `Gender`
--
-- Создание: Ноя 17 2018 г., 14:50
-- Последнее обновление: Ноя 17 2018 г., 14:51
--

DROP TABLE IF EXISTS `Gender`;
CREATE TABLE `Gender` (
  `id` int(1) NOT NULL,
  `name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Gender`
--

INSERT INTO `Gender` (`id`, `name`) VALUES
(1, 'Мужской'),
(2, 'Женский');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Department`
--
ALTER TABLE `Department`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Emploee`
--
ALTER TABLE `Emploee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Emploee_fk0` (`department_id`),
  ADD KEY `Emploee_fk1` (`gender`);

--
-- Индексы таблицы `Gender`
--
ALTER TABLE `Gender`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Department`
--
ALTER TABLE `Department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `Emploee`
--
ALTER TABLE `Emploee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `Gender`
--
ALTER TABLE `Gender`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Emploee`
--
ALTER TABLE `Emploee`
  ADD CONSTRAINT `Emploee_fk0` FOREIGN KEY (`department_id`) REFERENCES `Department` (`id`),
  ADD CONSTRAINT `Emploee_fk1` FOREIGN KEY (`gender`) REFERENCES `Gender` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
