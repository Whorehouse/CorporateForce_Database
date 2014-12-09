-- --------------------------------------------------------
-- Хост:                         veress.ddns.net
-- Версия сервера:               5.6.21-log - MySQL Community Server (GPL)
-- ОС Сервера:                   Win64
-- HeidiSQL Версия:              9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры базы данных corporateforce
CREATE DATABASE IF NOT EXISTS `corporateforce` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `corporateforce`;


-- Дамп структуры для таблица corporateforce.articles
CREATE TABLE IF NOT EXISTS `articles` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PROJECT` int(10) unsigned NOT NULL,
  `CONTAINER` int(10) unsigned NOT NULL,
  `BODY` mediumtext NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `PROJECT` (`PROJECT`),
  KEY `CONTAINER` (`CONTAINER`),
  CONSTRAINT `FK_articles_projects` FOREIGN KEY (`PROJECT`) REFERENCES `projects` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.


-- Дамп структуры для таблица corporateforce.articlesresourceslink
CREATE TABLE IF NOT EXISTS `articlesresourceslink` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ARTICLE` int(10) unsigned NOT NULL,
  `RESOURCE` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Столбец 2` (`ARTICLE`),
  KEY `Столбец 3` (`RESOURCE`),
  CONSTRAINT `FK__articles` FOREIGN KEY (`ARTICLE`) REFERENCES `articles` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK__resources` FOREIGN KEY (`RESOURCE`) REFERENCES `resources` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.


-- Дамп структуры для таблица corporateforce.chatter
CREATE TABLE IF NOT EXISTS `chatter` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PARENT` int(10) unsigned NOT NULL,
  `CONTAINER` int(10) unsigned NOT NULL,
  `BODY` text NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `PARENT` (`PARENT`),
  KEY `CONTAINER` (`CONTAINER`),
  CONSTRAINT `FK_chatter_users` FOREIGN KEY (`PARENT`) REFERENCES `users` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.


-- Дамп структуры для таблица corporateforce.chatterresourceslink
CREATE TABLE IF NOT EXISTS `chatterresourceslink` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CHATTER` int(10) unsigned NOT NULL,
  `RESOURCE` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `CHATTER` (`CHATTER`),
  KEY `RESOURCE` (`RESOURCE`),
  CONSTRAINT `FK_ChatterResourcesLink_chatter` FOREIGN KEY (`CHATTER`) REFERENCES `chatter` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ChatterResourcesLink_resources` FOREIGN KEY (`RESOURCE`) REFERENCES `resources` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.


-- Дамп структуры для таблица corporateforce.contacts
CREATE TABLE IF NOT EXISTS `contacts` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `USER` int(11) unsigned NOT NULL,
  `CONTAINER` int(11) unsigned NOT NULL,
  `IMAGE` int(11) unsigned DEFAULT NULL,
  `FIRSTNAME` varchar(50) NOT NULL,
  `LASTNAME` varchar(50) NOT NULL,
  `NICKNAME` varchar(50) DEFAULT NULL,
  `ADDRESS` tinytext,
  `PHONE` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `WEBSITE` tinytext,
  `ABOUT` text,
  PRIMARY KEY (`ID`),
  KEY `FK_contacts_users` (`USER`),
  KEY `FK_contacts_container` (`CONTAINER`),
  KEY `FK_contacts_resources` (`IMAGE`),
  CONSTRAINT `FK_contacts_resources` FOREIGN KEY (`IMAGE`) REFERENCES `resources` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_contacts_users` FOREIGN KEY (`USER`) REFERENCES `users` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.


-- Дамп структуры для таблица corporateforce.container
CREATE TABLE IF NOT EXISTS `container` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CREATOR` int(10) unsigned DEFAULT NULL,
  `CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `CREATOR` (`CREATOR`),
  KEY `CREATED` (`CREATED`),
  CONSTRAINT `FK_container_articles` FOREIGN KEY (`ID`) REFERENCES `articles` (`CONTAINER`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_container_contacts` FOREIGN KEY (`ID`) REFERENCES `contacts` (`CONTAINER`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_container_holidays` FOREIGN KEY (`ID`) REFERENCES `holidays` (`CONTAINER`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_container_objectives` FOREIGN KEY (`ID`) REFERENCES `objectives` (`CONTAINER`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_container_profiles` FOREIGN KEY (`ID`) REFERENCES `profiles` (`CONTAINER`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_container_projects` FOREIGN KEY (`ID`) REFERENCES `projects` (`CONTAINER`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_container_resources` FOREIGN KEY (`ID`) REFERENCES `resources` (`CONTAINER`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_container_results` FOREIGN KEY (`ID`) REFERENCES `results` (`CONTAINER`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_container_rights` FOREIGN KEY (`ID`) REFERENCES `rights` (`CONTAINER`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_container_roles` FOREIGN KEY (`ID`) REFERENCES `roles` (`CONTAINER`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_container_tickets` FOREIGN KEY (`ID`) REFERENCES `tickets` (`CONTAINER`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_container_trainings` FOREIGN KEY (`ID`) REFERENCES `trainings` (`CONTAINER`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_container_users_creator` FOREIGN KEY (`CREATOR`) REFERENCES `users` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_container_users_id` FOREIGN KEY (`ID`) REFERENCES `users` (`CONTAINER`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_container_worklogs` FOREIGN KEY (`ID`) REFERENCES `worklogs` (`CONTAINER`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.


-- Дамп структуры для таблица corporateforce.holidays
CREATE TABLE IF NOT EXISTS `holidays` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `USER` int(11) unsigned NOT NULL,
  `CONTAINER` int(11) unsigned NOT NULL,
  `START` date NOT NULL,
  `END` date NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `USER` (`USER`),
  KEY `CONTAINER` (`CONTAINER`),
  CONSTRAINT `FK_holidays_users` FOREIGN KEY (`USER`) REFERENCES `users` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.


-- Дамп структуры для таблица corporateforce.labels
CREATE TABLE IF NOT EXISTS `labels` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `LANGUAGE` int(11) unsigned NOT NULL,
  `TEXT` tinytext NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `LANGUAGE` (`LANGUAGE`),
  CONSTRAINT `FK_labels_languages` FOREIGN KEY (`LANGUAGE`) REFERENCES `languages` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.


-- Дамп структуры для таблица corporateforce.languages
CREATE TABLE IF NOT EXISTS `languages` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.


-- Дамп структуры для таблица corporateforce.objectives
CREATE TABLE IF NOT EXISTS `objectives` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PROJECT` int(10) unsigned NOT NULL,
  `CONTAINER` int(10) unsigned NOT NULL,
  `DESCRIPTION` text NOT NULL,
  `STATUS` enum('New','Pending','In progress','Done') NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `PROJECT` (`PROJECT`),
  KEY `CONTAINER` (`CONTAINER`),
  CONSTRAINT `FK_objectives_projects` FOREIGN KEY (`PROJECT`) REFERENCES `projects` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.


-- Дамп структуры для таблица corporateforce.profiles
CREATE TABLE IF NOT EXISTS `profiles` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CONTAINER` int(10) unsigned NOT NULL,
  `RIGHTS` int(10) unsigned DEFAULT NULL,
  `NAME` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `CONTAINER` (`CONTAINER`),
  KEY `RIGHTS` (`RIGHTS`),
  CONSTRAINT `FK_profiles_rights` FOREIGN KEY (`RIGHTS`) REFERENCES `rights` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.


-- Дамп структуры для таблица corporateforce.projects
CREATE TABLE IF NOT EXISTS `projects` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CONTAINER` int(10) unsigned NOT NULL,
  `LEAD` int(10) unsigned DEFAULT NULL,
  `STATUS` enum('Active','Closed') NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `DESCRIPTION` text,
  PRIMARY KEY (`ID`),
  KEY `CONTAINER` (`CONTAINER`),
  KEY `LEAD` (`LEAD`),
  CONSTRAINT `FK__users` FOREIGN KEY (`LEAD`) REFERENCES `users` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.


-- Дамп структуры для таблица corporateforce.questions
CREATE TABLE IF NOT EXISTS `questions` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TRAINING` int(10) unsigned NOT NULL,
  `INDEX` smallint(5) unsigned NOT NULL,
  `BODY` mediumtext NOT NULL,
  `ANSWERS` text NOT NULL,
  `CORRECT` tinytext NOT NULL,
  `CHECKBOX` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `TRAINING` (`TRAINING`),
  CONSTRAINT `FK_questions_trainings` FOREIGN KEY (`TRAINING`) REFERENCES `trainings` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.


-- Дамп структуры для таблица corporateforce.resources
CREATE TABLE IF NOT EXISTS `resources` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CONTAINER` int(10) unsigned NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `FILETYPE` varchar(10) NOT NULL,
  `FILENAME` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `CONTAINER` (`CONTAINER`),
  CONSTRAINT `FK_resources_contacts` FOREIGN KEY (`ID`) REFERENCES `contacts` (`IMAGE`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.


-- Дамп структуры для таблица corporateforce.results
CREATE TABLE IF NOT EXISTS `results` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TRAINING` int(10) unsigned NOT NULL,
  `CONTAINER` int(10) unsigned NOT NULL,
  `DURATION` int(10) unsigned NOT NULL,
  `ANSWERED` smallint(5) unsigned NOT NULL,
  `WRONG` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `TRAINING` (`TRAINING`),
  KEY `USER` (`CONTAINER`),
  CONSTRAINT `FK_results_trainings` FOREIGN KEY (`TRAINING`) REFERENCES `trainings` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.


-- Дамп структуры для таблица corporateforce.rights
CREATE TABLE IF NOT EXISTS `rights` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CONTAINER` int(10) unsigned NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `LOGIN_ENABLED` tinyint(1) NOT NULL DEFAULT '0',
  `SYSTEM_CONTROL` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `MANAGE_USERS` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CONTAINER` (`CONTAINER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.


-- Дамп структуры для таблица corporateforce.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CONTAINER` int(10) unsigned NOT NULL,
  `PARENT` int(10) unsigned DEFAULT NULL,
  `NAME` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `CONTAINER` (`CONTAINER`),
  KEY `PARENT` (`PARENT`),
  CONSTRAINT `FK_roles_roles` FOREIGN KEY (`PARENT`) REFERENCES `roles` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.


-- Дамп структуры для таблица corporateforce.tickets
CREATE TABLE IF NOT EXISTS `tickets` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `CONTAINER` int(11) unsigned NOT NULL,
  `PROJECT` int(11) unsigned NOT NULL,
  `USER` int(11) unsigned DEFAULT NULL,
  `TYPE` enum('Bug','Task','Question','New Feature','Improvement') NOT NULL,
  `PRIORITY` enum('Major','Minor','Trivial') NOT NULL,
  `STATUS` enum('Open','In progress','Closed') NOT NULL,
  `RESOLUTION` enum('Unresolved','Resolved','Done') NOT NULL,
  `ESTIMATE` smallint(5) unsigned DEFAULT NULL,
  `DUEDATE` date NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `DESCRIPTION` text,
  PRIMARY KEY (`ID`),
  KEY `CONTAINER` (`CONTAINER`),
  KEY `PROJECT` (`PROJECT`),
  KEY `USER` (`USER`),
  CONSTRAINT `FK_tickets_projects` FOREIGN KEY (`PROJECT`) REFERENCES `projects` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tickets_users` FOREIGN KEY (`USER`) REFERENCES `users` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.


-- Дамп структуры для таблица corporateforce.trainings
CREATE TABLE IF NOT EXISTS `trainings` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CONTAINER` int(10) unsigned NOT NULL,
  `ATTACHMENT` int(10) unsigned DEFAULT NULL,
  `NAME` varchar(100) NOT NULL,
  `TUTORIAL` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CONTAINER` (`CONTAINER`),
  KEY `ATTACHMENT` (`ATTACHMENT`),
  CONSTRAINT `FK_trainings_resources` FOREIGN KEY (`ATTACHMENT`) REFERENCES `resources` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.


-- Дамп структуры для таблица corporateforce.trainingsuserslink
CREATE TABLE IF NOT EXISTS `trainingsuserslink` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TRAINING` int(10) unsigned NOT NULL,
  `USER` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `TRAINING` (`TRAINING`),
  KEY `User` (`USER`),
  CONSTRAINT `FK_TrainingsUsersLink_users` FOREIGN KEY (`USER`) REFERENCES `users` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK__trainings` FOREIGN KEY (`TRAINING`) REFERENCES `trainings` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.


-- Дамп структуры для таблица corporateforce.tutorials
CREATE TABLE IF NOT EXISTS `tutorials` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TRAINING` int(10) unsigned NOT NULL,
  `INDEX` smallint(5) unsigned NOT NULL,
  `BODY` mediumtext NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `TRAINING` (`TRAINING`),
  CONSTRAINT `FK_Tutorials_trainings` FOREIGN KEY (`TRAINING`) REFERENCES `trainings` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.


-- Дамп структуры для таблица corporateforce.users
CREATE TABLE IF NOT EXISTS `users` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PROFILE` int(10) unsigned NOT NULL,
  `ROLE` int(10) unsigned NOT NULL,
  `CONTAINER` int(10) unsigned NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `PASSWORD` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USERNAME` (`USERNAME`),
  KEY `PROFILE` (`PROFILE`),
  KEY `ROLE` (`ROLE`),
  KEY `CONTAINER` (`CONTAINER`),
  CONSTRAINT `FK_users_profiles` FOREIGN KEY (`PROFILE`) REFERENCES `profiles` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.


-- Дамп структуры для таблица corporateforce.worklogs
CREATE TABLE IF NOT EXISTS `worklogs` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `TICKET` int(11) unsigned NOT NULL,
  `CONTAINER` int(11) unsigned NOT NULL,
  `TIME` tinyint(3) unsigned NOT NULL,
  `LOG` text NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `TICKET` (`TICKET`),
  KEY `CONTAINER` (`CONTAINER`),
  CONSTRAINT `FK_worklogs_tickets` FOREIGN KEY (`TICKET`) REFERENCES `tickets` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
