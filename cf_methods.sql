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


-- Dumping structure for procedure corporateforce.articleChangeBody
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `articleChangeBody`(IN `id` INT(10) UNSIGNED, IN `body` MEDIUMTEXT)
BEGIN
	UPDATE articles
	SET articles.BODY = body
	WHERE articles.ID = id;
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.articleChangeName
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `articleChangeName`(IN `id` INT(10) UNSIGNED, IN `name` VARCHAR(100))
BEGIN
	UPDATE articles
	SET articles.NAME = name
	WHERE articles.ID = id;
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.articleCreate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `articleCreate`(IN `project` INT(10) UNSIGNED, IN `creator` INT(10) UNSIGNED, IN `name` VARCHAR(100), IN `body` MEDIUMTEXT)
BEGIN
	INSERT INTO articles (articles.PROJECT, articles.CREATOR, articles.NAME, articles.BODY)
	VALUES (project, creator, name, body);
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.articlesresourceslinkCreate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `articlesresourceslinkCreate`(IN `article` INT(10) UNSIGNED, IN `resource` INT(10) UNSIGNED)
BEGIN
	INSERT INTO articlesresourceslink (articlesresourceslink.ARTICLE, articlesresourceslink.RESOURCE)
	VALUES (article, resource);
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.articleUpdate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `articleUpdate`(IN `id` INT(10) UNSIGNED, IN `name` VARCHAR(100), IN `body` MEDIUMTEXT)
BEGIN
	UPDATE articles
	SET
		articles.NAME = name,
		articles.BODY = body
	WHERE articles.ID = id;
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.chatterChangeBody
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `chatterChangeBody`(IN `id` INT(10) UNSIGNED, IN `body` TEXT)
BEGIN
	UPDATE chatter
	SET chatter.BODY = body
	WHERE chatter.ID = id;
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.chatterCreate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `chatterCreate`(IN `parent` INT(10) UNSIGNED, IN `creator` INT(10) UNSIGNED, IN `body` TEXT)
BEGIN
	INSERT INTO chatter (chatter.PARENT, chatter.CREATOR, chatter.BODY)
	VALUES (parent, creator, body);
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.chatterresourceslinkCreate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `chatterresourceslinkCreate`(IN `chatter` INT(10) UNSIGNED, IN `resource` INT(10) UNSIGNED)
BEGIN
	INSERT INTO chatterresourceslink (chatterresourceslink.CHATTER, chatterresourceslink.RESOURCE)
	VALUES (chatter, resource);
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.contactChangeBirthday
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `contactChangeBirthday`(IN `id` INT(10) UNSIGNED, IN `birthday` DATE)
BEGIN
	Update contacts
	SET contacts.BIRTHDAY = birthday
	WHERE contacts.ID = id;
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.contactChangeGender
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `contactChangeGender`(IN `id` INT(10) UNSIGNED, IN `gender` ENUM('MALE','FEMALE'))
BEGIN
	Update contacts
	SET contacts.GENDER = gender
	WHERE contacts.ID = id;
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.contactChangeImage
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `contactChangeImage`(IN `id` INT(10) UNSIGNED, IN `image` INT(10) UNSIGNED)
BEGIN
	Update contacts
	SET contacts.IMAGE = image
	WHERE contacts.ID = id;
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.contactCreate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `contactCreate`(IN `user` INT(10) UNSIGNED, IN `image` INT(10) UNSIGNED, IN `firstname` VARCHAR(50), IN `lastname` VARCHAR(50), IN `nickname` VARCHAR(50), IN `gender` ENUM('MALE','FEMALE'), IN `birthday` DATE, IN `address` TEXT, IN `phone` VARCHAR(50), IN `email` VARCHAR(50), IN `website` VARCHAR(255), IN `about` TEXT)
BEGIN
	INSERT INTO contacts 
	(
		contacts.USER,
		contacts.IMAGE,
		contacts.FIRSTNAME,
		contacts.LASTNAME,
		contacts.NICKNAME,
		contacts.GENDER,
		contacts.BIRTHDAY,
		contacts.ADDRESS,
		contacts.PHONE,
		contacts.EMAIL,
		contacts.WEBSITE,
		contacts.ABOUT
	)
	VALUES (user, image, firstname, lastname, nickname, gender, birthday, address, phone, email, website, about);
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.contactUpdate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `contactUpdate`(IN `id` INT(10) UNSIGNED, IN `image` INT(10) UNSIGNED, IN `firstname` VARCHAR(50), IN `lastname` VARCHAR(50), IN `nickname` VARCHAR(50), IN `gender` ENUM('MALE','FEMALE'), IN `birthday` DATE, IN `address` TEXT, IN `phone` VARCHAR(50), IN `email` VARCHAR(50), IN `website` VARCHAR(255), IN `about` TEXT)
BEGIN
	Update contacts
	SET
		contacts.IMAGE = image,
		contacts.FIRSTNAME = firstname,
		contacts.LASTNAME = lastname,
		contacts.NICKNAME = nickname,
		contacts.GENDER = gender,
		contacts.BIRTHDAY = birthday,
		contacts.ADDRESS = address,
		contacts.PHONE = phone,
		contacts.EMAIL = email,
		contacts.WEBSITE = website,
		contacts.ABOUT = about
	WHERE contacts.ID = id;
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.holidayChangeEndDate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `holidayChangeEndDate`(IN `id` INT(10) UNSIGNED, IN `endDate` DATE)
BEGIN
	UPDATE holidays
	SET holidays.`END` = endDate
	WHERE holidays.ID = id;
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.holidayChangeStartDate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `holidayChangeStartDate`(IN `id` INT(10) UNSIGNED, IN `startDate` DATE)
BEGIN
	UPDATE holidays
	SET holidays.`START` = startDate
	WHERE holidays.ID = id;
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.holidayCreate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `holidayCreate`(IN `user` INT(10) UNSIGNED, IN `startDate` DATE, IN `endDate` DATE)
BEGIN
	INSERT INTO holidays (holidays.USER, holidays.`START`, holidays.`END`)
	VALUES (user, startDate, endDate);
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.holidayUpdate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `holidayUpdate`(IN `id` INT(10) UNSIGNED, IN `startDate` DATE, IN `endDate` DATE)
BEGIN
	UPDATE holidays
	SET
		holidays.`START` = startDate,
		holidays.`END` = endDate
	WHERE holidays.ID = id;
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.objectiveCreate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `objectiveCreate`(IN `project` INT(10) UNSIGNED, IN `creator` INT(10) UNSIGNED, IN `description` TEXT, IN `status` ENUM('NEW','PENDING','IN PROGRESS','DONE','REJECTED'))
BEGIN
	INSERT INTO objectives (objectives.PROJECT, objectives.CREATOR, objectives.DESCRIPTION, objectives.`STATUS`)
	VALUES (project, creator, description, `status`);
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.objectivesChangeDescription
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `objectivesChangeDescription`(IN `id` INT(10) UNSIGNED, IN `description` TEXT)
BEGIN
	UPDATE objectives
	SET objectives.DESCRIPTION = description
	WHERE objectives.ID = id;
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.objectivesChangeStatus
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `objectivesChangeStatus`(IN `id` INT(10) UNSIGNED, IN `status` ENUM('NEW','PENDING','IN PROGRESS','DONE','REJECTED'))
BEGIN
	UPDATE objectives
	SET objectives.`STATUS` = `status`
	WHERE objectives.ID = id;
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.objectiveUpdate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `objectiveUpdate`(IN `id` INT(10) UNSIGNED, IN `description` TEXT, IN `status` ENUM('NEW','PENDING','IN PROGRESS','DONE','REJECTED'))
BEGIN
	UPDATE objectives
	SET
		objectives.DESCRIPTION = description,
		objectives.`STATUS` = `status`
	WHERE objectives.ID = id;
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.officeCreate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `officeCreate`(IN `name` VARCHAR(50), IN `address` TEXT)
BEGIN
	INSERT INTO offices (offices.NAME, offices.ADDRESS)
	VALUES (name, address);
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.officeUpdate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `officeUpdate`(IN `id` INT(10) UNSIGNED, IN `name` VARCHAR(50), IN `address` TEXT)
BEGIN
	UPDATE offices
	SET
		offices.NAME = name,
		offices.ADDRESS = address
	WHERE offices.ID = id;
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.profileCreate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `profileCreate`(IN `name` VARCHAR(50))
BEGIN
	INSERT INTO profiles (profiles.NAME)
	VALUES (name);
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.profileUpdate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `profileUpdate`(IN `id` INT(10) UNSIGNED, IN `name` VARCHAR(50))
BEGIN
	UPDATE profiles
	SET profiles.NAME = name
	WHERE profiles.ID = id;
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.projectChangeDescription
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `projectChangeDescription`(IN `id` INT(10) UNSIGNED, IN `description` TEXT)
BEGIN
	UPDATE projects
	SET projects.`STATUS` = `status`
	WHERE projects.ID = id;
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.projectChangeLead
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `projectChangeLead`(IN `id` INT(10) UNSIGNED, IN `lead` INT(10) UNSIGNED)
BEGIN
	UPDATE projects
	SET projects.LEAD = lead
	WHERE projects.ID = id;
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.projectChangeName
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `projectChangeName`(IN `id` INT(10) UNSIGNED, IN `name` VARCHAR(100))
BEGIN
	UPDATE projects
	SET projects.NAME = name
	WHERE projects.ID = id;
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.projectChangeStatus
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `projectChangeStatus`(IN `id` INT(10) UNSIGNED, IN `status` ENUM('ACTIVE','SUSPENDED','CLOSED'))
BEGIN
	UPDATE projects
	SET projects.`STATUS` = `status`
	WHERE projects.ID = id;
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.projectCreate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `projectCreate`(IN `creator` INT(10) UNSIGNED, IN `lead` INT(10) UNSIGNED, IN `status` ENUM('ACTIVE','SUSPENDED','CLOSED'), IN `name` VARCHAR(100), IN `description` TEXT)
BEGIN
	INSERT INTO projects (projects.CREATOR, projects.LEAD, projects.`STATUS`, projects.NAME, projects.DESCRIPTION)
	VALUES (creator, lead, `status`, name, description);
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.projectUpdate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `projectUpdate`(IN `id` INT(10) UNSIGNED, IN `status` ENUM('ACTIVE','SUSPENDED','CLOSED'), IN `name` VARCHAR(100), IN `description` TEXT)
BEGIN
	UPDATE projects
	SET
		projects.LEAD = lead,
		projects.`STATUS` = `status`,
		projects.NAME = name,
		projects.DESCRIPTION = description
	WHERE projects.ID = id;
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.questionCreate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `questionCreate`(IN `training` INT(10) UNSIGNED, IN `index` INT(10) UNSIGNED, IN `body` MEDIUMTEXT, IN `answers` TEXT, IN `correct` TINYTEXT)
BEGIN
	INSERT INTO questions (questions.TRAINING, questions.`INDEX`, questions.BODY, questions.ANSWERS, questions.CORRECT)
	VALUES (training, `index`, body, answers, correct);
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.questionUpdate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `questionUpdate`(IN `id` INT(10) UNSIGNED, IN `body` MEDIUMTEXT, IN `answers` TEXT, IN `correct` TINYTEXT)
BEGIN
	UPDATE questions
	SET
		questions.`INDEX` = `index`,
		questions.BODY = body,
		questions.ANSWERS = answers,
		questions.CORRECT = correct
	WHERE questions.ID = id;
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.resourcesCreate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `resourcesCreate`(IN `creator` INT(10) UNSIGNED, IN `name` VARCHAR(50), IN `filetype` VARCHAR(10), IN `filename` VARCHAR(50))
BEGIN
	INSERT INTO resources (resources.CREATOR, resources.NAME, resources.FILETYPE, resources.FILENAME)
	VALUES (creator, name, filetype, filename);
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.resourceUpdate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `resourceUpdate`(IN `id` INT(10) UNSIGNED, IN `name` VARCHAR(50), IN `filetype` VARCHAR(10), IN `filename` VARCHAR(50))
BEGIN
	UPDATE resources
	SET
		resources.NAME = name,
		resources.FILETYPE = filetype,
		resources.FILENAME = filename
	WHERE resources.ID = id;
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.resultCreate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `resultCreate`(IN `training` INT(10) UNSIGNED, IN `user` INT(10) UNSIGNED, IN `duration` INT(10) UNSIGNED, IN `answered` SMALLINT, IN `wrong` SMALLINT)
BEGIN
	INSERT INTO results (results.TRAINING, results.USER, results.DURATION, results.ANSWERED, results.WRONG)
	VALUES (training, user, duration, answered, wrong);
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.roleCreate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `roleCreate`(IN `parent` INT(10) UNSIGNED, IN `name` VARCHAR(50))
BEGIN
	INSERT INTO roles (roles.PARENT, roles.NAME)
	VALUES (parent, name);
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.roleUpdate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `roleUpdate`(IN `id` INT(10) UNSIGNED, IN `parent` INT(10) UNSIGNED, IN `name` VARCHAR(50))
BEGIN
	UPDATE roles
	SET
		roles.PARENT = parent,
		roles.NAME = name
	WHERE roles.ID = id;
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.settingsCreate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `settingsCreate`(IN `user` INT(10) UNSIGNED)
BEGIN
	INSERT INTO settings (settings.USER)
	VALUES (user);
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.settingsUpdate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `settingsUpdate`(IN `id` INT(10) UNSIGNED, IN `language` INT(10) UNSIGNED)
BEGIN
	UPDATE settings
	SET settings.`LANGUAGE` = `language`
	WHERE settings.ID = id;
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.ticketCreate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `ticketCreate`(IN `project` INT(10) UNSIGNED, IN `user` INT(10) UNSIGNED, IN `creator` INT(10) UNSIGNED, IN `type` ENUM('BUG','TASK','QUESTION','NEW FEATURE','IMPROVEMENT'), IN `priority` ENUM('MAJOR','MINOR','TRIVIAL'), IN `status` ENUM('OPEN','IN PROGRESS','CLOSED'), IN `estimate` DECIMAL(3,1), IN `duedate` DATE, IN `name` VARCHAR(50), IN `description` TEXT)
BEGIN
	INSERT INTO tickets (
								tickets.PROJECT,
								tickets.USER,
								tickets.CREATOR,
								tickets.`TYPE`,
								tickets.PRIORITY,
								tickets.`STATUS`,
								tickets.ESTIMATE,
								tickets.DUEDATE,
								tickets.NAME,
								tickets.DESCRIPTION
								)
	VALUES (project, user, creator, `type`, priority, `status`, estimate, duedate, name, description);
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.ticketUpdate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `ticketUpdate`(IN `id` INT(10) UNSIGNED, IN `user` INT(10) UNSIGNED, IN `type` ENUM('BUG','TASK','QUESTION','NEW FEATURE','IMPROVEMENT'), IN `priority` ENUM('MAJOR','MINOR','TRIVIAL'), IN `status` ENUM('OPEN','IN PROGRESS','CLOSED'), IN `estimate` DECIMAL(3,1), IN `duedate` DATE, IN `name` VARCHAR(50), IN `description` TEXT)
BEGIN
	UPDATE tickets
	SET
		tickets.USER = user,
		tickets.`TYPE` = `type`,
		tickets.PRIORITY = priority,
		tickets.`STATUS` = `status`,
		tickets.ESTIMATE = estimate,
		tickets.DUEDATE = duedate,
		tickets.NAME = name,
		tickets.DESCRIPTION = description
	WHERE tickets.ID = id;
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.trainingCreate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `trainingCreate`(IN `creator` INT(10) UNSIGNED, IN `attachment` INT(10) UNSIGNED, IN `name` VARCHAR(100), IN `tutorial` TINYINT(1))
BEGIN
	INSERT INTO trainings (trainings.CREATOR, trainings.ATTACHMENT, trainings.NAME, trainings.TUTORIAL)
	VALUES (creator, attachment, name, tutorial);
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.trainingsuserslinkCreate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `trainingsuserslinkCreate`(IN `training` INT(10) UNSIGNED, IN `user` INT(10) UNSIGNED)
BEGIN
	INSERT INTO trainingsuserslink (trainingsuserslink.TRAINING, trainingsuserslink.USER)
	VALUES (training, user);
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.trainingUpdate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `trainingUpdate`(IN `id` INT(10) UNSIGNED, IN `attachment` INT(10) UNSIGNED, IN `name` VARCHAR(100), IN `tutorial` TINYINT(1))
BEGIN
	UPDATE trainings
	SET
		trainings.ATTACHMENT = attachment,
		trainings.NAME = name,
		trainings.TUTORIAL = tutorial
	WHERE trainings.ID = id;
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.tutorialCreate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `tutorialCreate`(IN `training` INT(10) UNSIGNED, IN `index` SMALLINT, IN `body` MEDIUMTEXT)
BEGIN
	INSERT INTO tutorials (tutorials.TRAINING, tutorials.`INDEX`, tutorials.BODY)
	VALUES (training, `index`, body);
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.tutorialUpdate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `tutorialUpdate`(IN `id` INT(10) UNSIGNED, IN `index` SMALLINT, IN `body` MEDIUMTEXT)
BEGIN
	UPDATE tutorials
	SET
		tutorials.`INDEX` = `index`,
		tutorials.BODY = body
	WHERE tutorials.ID = id;
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.userChangeManager
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `userChangeManager`(IN `id` INT, IN `manager` INT)
BEGIN
	UPDATE users
	SET users.MANAGER = manager
	WHERE users.ID = id;
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.userChangeOffice
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `userChangeOffice`(IN `id` INT(10) UNSIGNED, IN `office` INT(10) UNSIGNED)
BEGIN
	UPDATE users
	SET users.OFFICE = office
	WHERE users.ID = id;
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.userChangePassword
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `userChangePassword`(IN `id` INT(10) UNSIGNED, IN `password` VARCHAR(32))
BEGIN
	UPDATE users
	SET users.PASSWORD = MD5(MD5(password))
	WHERE users.ID = id;
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.userChangeProfile
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `userChangeProfile`(IN `id` INT(10) UNSIGNED, IN `profile` INT(10) UNSIGNED)
BEGIN
	UPDATE users
	SET users.PROFILE = profile
	WHERE users.ID = id;
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.userChangeRole
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `userChangeRole`(IN `id` INT(10) UNSIGNED, IN `role` INT(10) UNSIGNED)
BEGIN
	UPDATE users
	SET users.ROLE = role
	WHERE users.ID = id;
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.userCreate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `userCreate`(IN `profile` INT(10) UNSIGNED, IN `office` INT(10) UNSIGNED, IN `role` INT(10) UNSIGNED, IN `manager` INT(10) UNSIGNED, IN `username` VARCHAR(50), IN `password` VARCHAR(32))
BEGIN
	INSERT INTO users (users.PROFILE, users.OFFICE, users.ROLE, users.MANAGER, users.USERNAME, users.PASSWORD)
	VALUES (profile, office, role, manager, username, MD5(MD5(password)));
	CALL settingsCreate(LAST_INSERT_ID());
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.userCreateWithContact
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `userCreateWithContact`(IN `profile` INT(10) UNSIGNED, IN `office` INT(10) UNSIGNED, IN `role` INT(10) UNSIGNED, IN `manager` INT(10) UNSIGNED, IN `username` VARCHAR(50), IN `password` VARCHAR(32), IN `firstname` VARCHAR(50), IN `lastname` VARCHAR(50), IN `gender` ENUM('MALE','FEMALE'), IN `birthday` DATE)
BEGIN
	CALL userCreate(profile, office, role, manager, username, password);
	CALL contactCreate(LAST_INSERT_ID(), null, firstname, lastname, null, gender, birthday, null, null, null, null, null);
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.userUpdate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `userUpdate`(IN `id` INT, IN `profile` INT, IN `role` INT, IN `manager` INT, IN `username` VARCHAR(50), IN `password` VARCHAR(32))
BEGIN
	UPDATE users SET
						users.PROFILE = profile,
						users.OFFICE = office,
						users.ROLE = role,
						users.MANAGER = manager,
						users.USERNAME = username,
						users.PASSWORD = MD5(MD5(password))
	WHERE users.ID = id;
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.worklogCreate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `worklogCreate`(IN `ticket` INT(10) UNSIGNED, IN `creator` INT(10) UNSIGNED, IN `time` DECIMAL(3,1), IN `log` TEXT)
BEGIN
	INSERT INTO worklogs (worklogs.TICKET, worklogs.CREATOR, worklogs.TIME, worklogs.LOG)
	VALUES (ticket, creator, time, log);
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.worklogUpdate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `worklogUpdate`(IN `id` INT(10) UNSIGNED, IN `time` DECIMAL(3,1), IN `log` TEXT)
BEGIN
	UPDATE worklogs
	SET
		worklogs.TIME = time,
		worklogs.LOG = log
	WHERE worklogs.ID = id;
END//
DELIMITER ;


-- Dumping structure for function corporateforce.userChangePasswordSecure
DELIMITER //
CREATE DEFINER=`veress`@`%` FUNCTION `userChangePasswordSecure`(`id` INT(10) UNSIGNED, `oldPassword` VARCHAR(32), `newPassword` VARCHAR(32)) RETURNS tinyint(1)
BEGIN
	DECLARE currentPassword VARCHAR(32);
	
	SELECT users.PASSWORD
		INTO currentPassword
		FROM users
		WHERE users.ID = id;

	IF NOT MD5(MD5(oldPassword)) = currentPassword
		THEN
			return false;
		END IF;

	UPDATE users 
		SET users.PASSWORD = MD5(MD5(newPassword)) 
		WHERE users.ID = id;

	return true;
END//
DELIMITER ;


-- Dumping structure for function corporateforce.userSignIn
DELIMITER //
CREATE DEFINER=`veress`@`%` FUNCTION `userSignIn`(`username` VARCHAR(50), `password` VARCHAR(32)) RETURNS int(10) unsigned
BEGIN
	DECLARE result INT(10) UNSIGNED;
	SELECT users.ID
		INTO result
		FROM users
		WHERE users.USERNAME = username
		AND users.PASSWORD = MD5(MD5(password));
	return result;
END//
DELIMITER ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
