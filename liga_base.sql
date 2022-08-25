-- Adminer 4.8.1 MySQL 5.7.38 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

CREATE DATABASE `liga_base` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `liga_base`;

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `club`;
CREATE TABLE `club` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_manager` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `budget` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `club` (`id`, `name`, `name_manager`, `budget`) VALUES
(9,	'Real Betis Balompié',	'Benito Villa',	9800000),
(10,	'Real Madrid',	'Florentino Perez',	9009099),
(11,	'Club Pinto',	'Manolo Vidal',	98000),
(12,	'Club Getafe',	'Paco Mora',	999880),
(13,	'Sevilla Club',	'Manolo Loro',	88800),
(14,	'Real Betis',	'Alberto Paz',	980000),
(15,	'Club Levante',	'Paco Soria',	880000),
(16,	'Club Valdemoro',	'Coco Fari',	9000000);

DROP TABLE IF EXISTS `coach`;
CREATE TABLE `coach` (
  `id` int(11) NOT NULL,
  `type_coach` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `experience` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_3F596DCCBF396750` FOREIGN KEY (`id`) REFERENCES `person` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `coach` (`id`, `type_coach`, `experience`) VALUES
(15,	'entrenador general',	5),
(18,	'entrenador general',	3),
(19,	'entrenador general',	5),
(20,	'entrenador general',	5),
(22,	'entrenador portero',	2),
(23,	'entrenador portero',	4),
(25,	'entrenador general',	7),
(34,	'entrenador basico',	4);

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `messenger_messages` (`id`, `body`, `headers`, `queue_name`, `created_at`, `available_at`, `delivered_at`) VALUES
(1,	'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:28:\\\"Sending emails is fun again!\\\";i:1;s:5:\\\"utf-8\\\";i:2;s:56:\\\"<p>See Twig integration for better HTML integration!</p>\\\";i:3;s:5:\\\"utf-8\\\";i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:24:\\\"testproyectlhm@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:22:\\\"lisandrahm88@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:24:\\\"Time for Symfony Mailer!\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}',	'[]',	'default',	'2022-08-24 07:31:06',	'2022-08-24 07:31:06',	NULL);

DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int(11) DEFAULT NULL,
  `identification` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` double DEFAULT NULL,
  `club_id` int(11) DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_34DCD17649E7720D` (`identification`),
  KEY `IDX_34DCD17661190A32` (`club_id`),
  CONSTRAINT `FK_34DCD17661190A32` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `person` (`id`, `name`, `age`, `identification`, `salary`, `club_id`, `email`, `telephone`, `type`) VALUES
(13,	'Felipe',	30,	'5525454F',	4500,	9,	'felo@gmail.com',	5254522,	'player'),
(14,	'Rolando',	20,	'123457F',	0,	NULL,	'roli@gmail.com',	123456,	'player'),
(15,	'Manolo',	50,	'2545877R',	2000,	9,	'manolo@gmail.com',	545854,	'coach'),
(16,	'Raul',	25,	'78957F',	0,	NULL,	'rmartinez@gmail.com',	564578,	'player'),
(18,	'Carlos',	40,	'3345877R',	5000,	9,	'manolo@gmail.com',	545854,	'coach'),
(19,	'Fransisco',	48,	'31258797R',	4000,	10,	'fran@gmail.com',	655854,	'coach'),
(20,	'Ramiro',	55,	'880114T',	4000,	10,	'ramiro@gmail.com',	545854,	'coach'),
(22,	'Mario',	39,	'79254S',	3000,	9,	'mario@gmail.com',	6331010,	'coach'),
(23,	'Manuel',	43,	'012545G',	5000,	9,	'manu@gmail.com',	6331010,	'coach'),
(25,	'Jose',	51,	'022554G',	0,	NULL,	'manu@gmail.com',	6225411,	'coach'),
(26,	'Juan',	25,	'85421F',	3800,	9,	'juani@gmail.com',	62254154,	'player'),
(27,	'Alex',	24,	'800421F',	3800,	10,	'alex@gmail.com',	62254542,	'player'),
(28,	'Cuco',	26,	'878547M',	3500,	10,	'cuco@gmail.com',	63214542,	'player'),
(29,	'Lalo',	25,	'338547M',	3900,	10,	'lalo@gmail.com',	63210212,	'player'),
(30,	'Luis',	31,	'124047M',	2700,	10,	'luis@gmail.com',	63200012,	'player'),
(31,	'Jorge',	21,	'7781047T',	3700,	9,	'jorge21@gmail.com',	63200888,	'player'),
(32,	'Armando',	27,	'3211047T',	4200,	9,	'armandox@gmail.com',	6354214,	'player'),
(33,	'Gabi',	19,	'502144T',	0,	NULL,	'gabi17@gmail.com',	6221117,	'player'),
(34,	'Eduardo',	45,	'025487H',	0,	NULL,	'edu45@gmail.com',	62254321,	'coach');

DROP TABLE IF EXISTS `player`;
CREATE TABLE `player` (
  `id` int(11) NOT NULL,
  `positions` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `height` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `number_shirt` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_98197A65BF396750` FOREIGN KEY (`id`) REFERENCES `person` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `player` (`id`, `positions`, `height`, `weight`, `number_shirt`) VALUES
(13,	'delantero',	1.77,	69,	11),
(14,	'portero',	1.8,	74,	2),
(16,	'delantero',	1.7,	68,	13),
(26,	'central',	1.8,	75,	3),
(27,	'central',	1.8,	70,	4),
(28,	'defensa',	1.8,	70,	6),
(29,	'portero',	1.5,	68,	8),
(30,	'defensa',	1.7,	68,	10),
(31,	'defensa',	1.7,	68,	12),
(32,	'defensa',	1.7,	68,	13),
(33,	'central',	1.75,	72,	17);

-- 2022-08-25 15:01:54
