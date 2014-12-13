-- --------------------------------------------------------
-- Host:                         veress.ddns.net
-- Server version:               5.6.21-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for corporateforce
CREATE DATABASE IF NOT EXISTS `corporateforce` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `corporateforce`;


-- Dumping structure for table corporateforce.articles
CREATE TABLE IF NOT EXISTS `articles` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PROJECT` int(10) unsigned NOT NULL,
  `CREATOR` int(10) unsigned DEFAULT NULL,
  `CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `NAME` varchar(100) NOT NULL,
  `BODY` mediumtext,
  PRIMARY KEY (`ID`),
  KEY `PROJECT` (`PROJECT`),
  KEY `CREATOR` (`CREATOR`),
  CONSTRAINT `FK_articles_projects` FOREIGN KEY (`PROJECT`) REFERENCES `projects` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_articles_users` FOREIGN KEY (`CREATOR`) REFERENCES `users` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table corporateforce.articlesresourceslink
CREATE TABLE IF NOT EXISTS `articlesresourceslink` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ARTICLE` int(10) unsigned NOT NULL,
  `RESOURCE` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ARTICLE` (`ARTICLE`),
  KEY `RESOURCE` (`RESOURCE`),
  CONSTRAINT `FK_articlesresourceslink_articles` FOREIGN KEY (`ARTICLE`) REFERENCES `articles` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_articlesresourceslink_resources` FOREIGN KEY (`RESOURCE`) REFERENCES `resources` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table corporateforce.chatter
CREATE TABLE IF NOT EXISTS `chatter` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PARENT` int(10) unsigned NOT NULL,
  `CREATOR` int(10) unsigned DEFAULT NULL,
  `CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `BODY` text,
  PRIMARY KEY (`ID`),
  KEY `PARENT` (`PARENT`),
  KEY `CREATOR` (`CREATOR`),
  CONSTRAINT `FK_chatter_users_creator` FOREIGN KEY (`CREATOR`) REFERENCES `users` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_chatter_users_parent` FOREIGN KEY (`PARENT`) REFERENCES `users` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table corporateforce.chatterresourceslink
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

-- Data exporting was unselected.


-- Dumping structure for table corporateforce.contacts
CREATE TABLE IF NOT EXISTS `contacts` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `USER` int(11) unsigned NOT NULL,
  `IMAGE` int(11) unsigned DEFAULT NULL,
  `CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FIRSTNAME` varchar(50) NOT NULL,
  `LASTNAME` varchar(50) NOT NULL,
  `NICKNAME` varchar(50) DEFAULT NULL,
  `GENDER` enum('male','female') NOT NULL,
  `BIRTHDAY` date NOT NULL,
  `ADDRESS` tinytext,
  `PHONE` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `WEBSITE` varchar(255) DEFAULT NULL,
  `ABOUT` text,
  PRIMARY KEY (`ID`),
  KEY `FK_contacts_users` (`USER`),
  KEY `FK_contacts_resources` (`IMAGE`),
  CONSTRAINT `FK_contacts_resources` FOREIGN KEY (`IMAGE`) REFERENCES `resources` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_contacts_users` FOREIGN KEY (`USER`) REFERENCES `users` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table corporateforce.holidays
CREATE TABLE IF NOT EXISTS `holidays` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `USER` int(11) unsigned NOT NULL,
  `CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `START` date NOT NULL,
  `END` date NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `USER` (`USER`),
  CONSTRAINT `FK_holidays_users` FOREIGN KEY (`USER`) REFERENCES `users` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table corporateforce.labels
CREATE TABLE IF NOT EXISTS `labels` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `LANGUAGE` int(11) unsigned NOT NULL,
  `CODE` varchar(50) NOT NULL,
  `TEXT` tinytext NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `LANGUAGE` (`LANGUAGE`),
  CONSTRAINT `FK_labels_languages` FOREIGN KEY (`LANGUAGE`) REFERENCES `languages` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table corporateforce.languages
CREATE TABLE IF NOT EXISTS `languages` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table corporateforce.objectives
CREATE TABLE IF NOT EXISTS `objectives` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PROJECT` int(10) unsigned NOT NULL,
  `CREATOR` int(10) unsigned DEFAULT NULL,
  `CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DESCRIPTION` text NOT NULL,
  `STATUS` enum('new','pending','in progress','done','rejected') NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `PROJECT` (`PROJECT`),
  KEY `CREATOR` (`CREATOR`),
  CONSTRAINT `FK_objectives_projects` FOREIGN KEY (`PROJECT`) REFERENCES `projects` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_objectives_users` FOREIGN KEY (`CREATOR`) REFERENCES `users` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table corporateforce.offices
CREATE TABLE IF NOT EXISTS `offices` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `ADDRESS` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table corporateforce.profiles
CREATE TABLE IF NOT EXISTS `profiles` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `LOGIN_ENABLED` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `SYSTEM_CONTROL` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `MANAGE_USERS` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table corporateforce.projects
CREATE TABLE IF NOT EXISTS `projects` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CREATOR` int(10) unsigned DEFAULT NULL,
  `LEAD` int(10) unsigned DEFAULT NULL,
  `CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `STATUS` enum('active','suspended','closed') NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `DESCRIPTION` text,
  PRIMARY KEY (`ID`),
  KEY `LEAD` (`LEAD`),
  KEY `CREATOR` (`CREATOR`),
  CONSTRAINT `FK__users` FOREIGN KEY (`LEAD`) REFERENCES `users` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_projects_users` FOREIGN KEY (`CREATOR`) REFERENCES `users` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table corporateforce.questions
CREATE TABLE IF NOT EXISTS `questions` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TRAINING` int(10) unsigned NOT NULL,
  `INDEX` smallint(5) unsigned NOT NULL,
  `BODY` mediumtext NOT NULL,
  `ANSWERS` text NOT NULL,
  `CORRECT` tinytext NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `TRAINING` (`TRAINING`),
  CONSTRAINT `FK_questions_trainings` FOREIGN KEY (`TRAINING`) REFERENCES `trainings` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table corporateforce.resources
CREATE TABLE IF NOT EXISTS `resources` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CREATOR` int(10) unsigned DEFAULT NULL,
  `CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `NAME` varchar(50) NOT NULL,
  `FILETYPE` varchar(10) NOT NULL,
  `FILENAME` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `CREATOR` (`CREATOR`),
  CONSTRAINT `FK_resources_contacts` FOREIGN KEY (`ID`) REFERENCES `contacts` (`IMAGE`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_resources_users` FOREIGN KEY (`CREATOR`) REFERENCES `users` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table corporateforce.results
CREATE TABLE IF NOT EXISTS `results` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TRAINING` int(10) unsigned NOT NULL,
  `USER` int(10) unsigned NOT NULL,
  `CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DURATION` int(10) unsigned NOT NULL,
  `ANSWERED` smallint(5) unsigned NOT NULL,
  `WRONG` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `TRAINING` (`TRAINING`),
  KEY `USER` (`USER`),
  CONSTRAINT `FK_results_trainings` FOREIGN KEY (`TRAINING`) REFERENCES `trainings` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_results_users` FOREIGN KEY (`USER`) REFERENCES `users` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table corporateforce.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PARENT` int(10) unsigned DEFAULT NULL,
  `NAME` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `PARENT` (`PARENT`),
  CONSTRAINT `FK_roles_roles` FOREIGN KEY (`PARENT`) REFERENCES `roles` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table corporateforce.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `USER` int(10) unsigned NOT NULL,
  `LANGUAGE` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK__languages` (`LANGUAGE`),
  KEY `USER` (`USER`),
  CONSTRAINT `FK__languages` FOREIGN KEY (`LANGUAGE`) REFERENCES `languages` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_settings_users` FOREIGN KEY (`USER`) REFERENCES `users` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table corporateforce.tickets
CREATE TABLE IF NOT EXISTS `tickets` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PROJECT` int(11) unsigned NOT NULL,
  `USER` int(11) unsigned DEFAULT NULL,
  `CREATOR` int(10) unsigned DEFAULT NULL,
  `CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TYPE` enum('bug','task','question','new feature','improvement') NOT NULL,
  `PRIORITY` enum('major','minor','trivial') NOT NULL,
  `STATUS` enum('open','in progress','closed') NOT NULL,
  `ESTIMATE` smallint(5) unsigned DEFAULT NULL,
  `DUEDATE` date NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `DESCRIPTION` text,
  PRIMARY KEY (`ID`),
  KEY `PROJECT` (`PROJECT`),
  KEY `USER` (`USER`),
  KEY `FK_tickets_users_creator` (`CREATOR`),
  CONSTRAINT `FK_tickets_projects` FOREIGN KEY (`PROJECT`) REFERENCES `projects` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tickets_users_creator` FOREIGN KEY (`CREATOR`) REFERENCES `users` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_tickets_users_user` FOREIGN KEY (`USER`) REFERENCES `users` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table corporateforce.trainings
CREATE TABLE IF NOT EXISTS `trainings` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CREATOR` int(10) unsigned DEFAULT NULL,
  `ATTACHMENT` int(10) unsigned DEFAULT NULL,
  `CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `NAME` varchar(100) NOT NULL,
  `TUTORIAL` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ATTACHMENT` (`ATTACHMENT`),
  KEY `CREATOR` (`CREATOR`),
  CONSTRAINT `FK_trainings_resources` FOREIGN KEY (`ATTACHMENT`) REFERENCES `resources` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_trainings_users` FOREIGN KEY (`CREATOR`) REFERENCES `users` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table corporateforce.trainingsuserslink
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

-- Data exporting was unselected.


-- Dumping structure for table corporateforce.tutorials
CREATE TABLE IF NOT EXISTS `tutorials` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TRAINING` int(10) unsigned NOT NULL,
  `INDEX` smallint(5) unsigned NOT NULL,
  `BODY` mediumtext NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `TRAINING` (`TRAINING`),
  CONSTRAINT `FK_Tutorials_trainings` FOREIGN KEY (`TRAINING`) REFERENCES `trainings` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table corporateforce.users
CREATE TABLE IF NOT EXISTS `users` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PROFILE` int(10) unsigned NOT NULL,
  `OFFICE` int(10) unsigned DEFAULT NULL,
  `ROLE` int(10) unsigned DEFAULT NULL,
  `MANAGER` int(10) unsigned DEFAULT NULL,
  `CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `USERNAME` varchar(50) NOT NULL,
  `PASSWORD` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USERNAME` (`USERNAME`),
  KEY `PROFILE` (`PROFILE`),
  KEY `ROLE` (`ROLE`),
  KEY `OFFICE` (`OFFICE`),
  KEY `MANAGER` (`MANAGER`),
  CONSTRAINT `FK_users_offices` FOREIGN KEY (`OFFICE`) REFERENCES `offices` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_users_profiles` FOREIGN KEY (`PROFILE`) REFERENCES `profiles` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_users_roles` FOREIGN KEY (`ROLE`) REFERENCES `roles` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_users_users` FOREIGN KEY (`MANAGER`) REFERENCES `users` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table corporateforce.worklogs
CREATE TABLE IF NOT EXISTS `worklogs` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `TICKET` int(11) unsigned NOT NULL,
  `CREATOR` int(10) unsigned DEFAULT NULL,
  `CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME` decimal(3,1) unsigned NOT NULL,
  `LOG` text NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `TICKET` (`TICKET`),
  KEY `CREATOR` (`CREATOR`),
  CONSTRAINT `FK_worklogs_tickets` FOREIGN KEY (`TICKET`) REFERENCES `tickets` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_worklogs_users` FOREIGN KEY (`CREATOR`) REFERENCES `users` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
