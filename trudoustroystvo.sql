-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Сен 21 2026 г., 13:17
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `trudoustroystvo`
--

-- --------------------------------------------------------

--
-- Структура таблицы `forma`
--

CREATE TABLE `forma` (
  `id_forma` int(1) NOT NULL,
  `nazvanie_forma` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `forma`
--

INSERT INTO `forma` (`id_forma`, `nazvanie_forma`) VALUES
(1, 'трудовой договор'),
(2, 'самозанятый');

-- --------------------------------------------------------

--
-- Структура таблицы `organizacii`
--

CREATE TABLE `organizacii` (
  `id_organizacii` int(1) NOT NULL,
  `INN` varchar(255) NOT NULL,
  `nazvaniye_organizacii` varchar(17) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `organizacii`
--

INSERT INTO `organizacii` (`id_organizacii`, `INN`, `nazvaniye_organizacii`) VALUES
(1, '7710044140', 'ПАО «Россети»'),
(2, '5027060060', 'ООО «ТехноПортал»'),
(3, '7707083893', 'ПАО «Сбербанк»');

-- --------------------------------------------------------

--
-- Структура таблицы `otzivi`
--

CREATE TABLE `otzivi` (
  `id_otzivi` int(1) NOT NULL,
  `kommentariy` varchar(255) DEFAULT NULL,
  `zvezda` int(1) DEFAULT NULL,
  `zayavki_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `otzivi`
--

INSERT INTO `otzivi` (`id_otzivi`, `kommentariy`, `zvezda`, `zayavki_id`) VALUES
(1, 'Отличная компания, дружный коллектив!', 5, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `polzovateli`
--

CREATE TABLE `polzovateli` (
  `id_polzovateli` int(1) NOT NULL,
  `login` varchar(255) NOT NULL,
  `parol` varchar(255) NOT NULL,
  `FIO` varchar(255) NOT NULL,
  `telefon` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `rol_id` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `polzovateli`
--

INSERT INTO `polzovateli` (`id_polzovateli`, `login`, `parol`, `FIO`, `telefon`, `email`, `rol_id`) VALUES
(1, 'Admin', 'KorokNET', 'Adminov Admin Adminovich', '8(901)152-83-16', 'admin@trud.ru', 2),
(2, 'User1', '12345678', 'Ivanov Ivan Ivanovich', '8(963)183-83-12', 'ivanov@mail.ru', 1),
(3, 'User2', 'password8', 'Petrova Petra Petrovna', '8(952)244-52-42', 'petrova@yandex.ru', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `roli`
--

CREATE TABLE `roli` (
  `id_roli` int(1) NOT NULL,
  `rol` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `roli`
--

INSERT INTO `roli` (`id_roli`, `rol`) VALUES
(2, 'администратор'),
(1, 'пользователь');

-- --------------------------------------------------------

--
-- Структура таблицы `status`
--

CREATE TABLE `status` (
  `id_status` int(1) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `status`
--

INSERT INTO `status` (`id_status`, `status`) VALUES
(1, 'новая'),
(2, 'Подтверждено'),
(3, 'Отклонено');

-- --------------------------------------------------------

--
-- Структура таблицы `zayavki`
--

CREATE TABLE `zayavki` (
  `id_zayavki` int(1) NOT NULL,
  `polzovateli_id` int(1) NOT NULL,
  `ogranizacia_id` int(1) NOT NULL,
  `forma_id` int(1) NOT NULL,
  `id_otzivi` int(1) NOT NULL,
  `dolgnost` varchar(19) DEFAULT NULL,
  `data_nachala_raboti` varchar(10) DEFAULT NULL,
  `period` varchar(9) DEFAULT NULL,
  `kuratora_id` int(1) NOT NULL,
  `data_izmeneniya_statusa` varchar(10) DEFAULT NULL,
  `status_id` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `zayavki`
--

INSERT INTO `zayavki` (`id_zayavki`, `polzovateli_id`, `ogranizacia_id`, `forma_id`, `id_otzivi`, `dolgnost`, `data_nachala_raboti`, `period`, `kuratora_id`, `data_izmeneniya_statusa`, `status_id`) VALUES
(1, 2, 1, 1, 0, 'Инженер-энергетик', '01.10.2026', '1 год', 1, '17.09.2026', 2),
(2, 3, 2, 2, 0, 'Веб-разработчик', '20.09.2026', '6 месяцев', 1, '18.09.2026', 1),
(3, 2, 3, 1, 0, 'Финансовый аналитик', '10.11.2026', '1 год', 1, '19.09.2026', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `forma`
--
ALTER TABLE `forma`
  ADD PRIMARY KEY (`id_forma`);

--
-- Индексы таблицы `organizacii`
--
ALTER TABLE `organizacii`
  ADD PRIMARY KEY (`id_organizacii`);

--
-- Индексы таблицы `otzivi`
--
ALTER TABLE `otzivi`
  ADD PRIMARY KEY (`id_otzivi`),
  ADD KEY `fk_otzivi_zayavki` (`zayavki_id`);

--
-- Индексы таблицы `polzovateli`
--
ALTER TABLE `polzovateli`
  ADD PRIMARY KEY (`id_polzovateli`),
  ADD KEY `rol_id` (`rol_id`);

--
-- Индексы таблицы `roli`
--
ALTER TABLE `roli`
  ADD PRIMARY KEY (`id_roli`),
  ADD KEY `rol` (`rol`);

--
-- Индексы таблицы `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id_status`);

--
-- Индексы таблицы `zayavki`
--
ALTER TABLE `zayavki`
  ADD PRIMARY KEY (`id_zayavki`),
  ADD KEY `polzovateli_id` (`polzovateli_id`),
  ADD KEY `ogranizacia_id` (`ogranizacia_id`),
  ADD KEY `forma_id` (`forma_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `id_otzivi` (`id_otzivi`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `forma`
--
ALTER TABLE `forma`
  ADD CONSTRAINT `forma_ibfk_1` FOREIGN KEY (`id_forma`) REFERENCES `zayavki` (`forma_id`);

--
-- Ограничения внешнего ключа таблицы `organizacii`
--
ALTER TABLE `organizacii`
  ADD CONSTRAINT `organizacii_ibfk_1` FOREIGN KEY (`id_organizacii`) REFERENCES `zayavki` (`ogranizacia_id`);

--
-- Ограничения внешнего ключа таблицы `otzivi`
--
ALTER TABLE `otzivi`
  ADD CONSTRAINT `fk_otzivi_zayavki` FOREIGN KEY (`zayavki_id`) REFERENCES `zayavki` (`id_zayavki`);

--
-- Ограничения внешнего ключа таблицы `polzovateli`
--
ALTER TABLE `polzovateli`
  ADD CONSTRAINT `polzovateli_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roli` (`id_roli`);

--
-- Ограничения внешнего ключа таблицы `zayavki`
--
ALTER TABLE `zayavki`
  ADD CONSTRAINT `zayavki_ibfk_1` FOREIGN KEY (`polzovateli_id`) REFERENCES `polzovateli` (`id_polzovateli`),
  ADD CONSTRAINT `zayavki_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`id_status`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
