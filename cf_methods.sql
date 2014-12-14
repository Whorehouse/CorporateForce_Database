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


-- Dumping structure for procedure corporateforce.chatterCreate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `chatterCreate`(IN `parent` INT(10) UNSIGNED, IN `creator` INT(10) UNSIGNED, IN `body` TEXT)
BEGIN
	INSERT INTO chatter (chatter.PARENT, chatter.CREATOR, chatter.BODY)
	VALUES (parent, creator, body);
END//
DELIMITER ;


-- Dumping structure for procedure corporateforce.contactCreate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `contactCreate`(IN `user` INT(10) UNSIGNED, IN `image` INT(10) UNSIGNED, IN `firstname` VARCHAR(50), IN `lastname` VARCHAR(50), IN `nickname` VARCHAR(50), IN `gender` ENUM('MALE','FEMALE'), IN `birthday` DATE, IN `address` TEXT, IN `phone` VARCHAR(50), IN `email` VARCHAR(50), IN `website` VARCHAR(255), IN `about` TEXT)
BEGIN
	INSERT INTO contacts (
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


-- Dumping structure for procedure corporateforce.holidayCreate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `holidayCreate`(IN `user` INT(10) UNSIGNED, IN `startDate` DATE, IN `endDate` DATE)
BEGIN
	INSERT INTO holidays (holidays.USER, holidays.`START`, holidays.`END`)
	VALUES (user, startDate, endDate);
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


-- Dumping structure for procedure corporateforce.profileCreate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `profileCreate`(IN `name` VARCHAR(50))
BEGIN
	INSERT INTO profiles (profiles.NAME)
	VALUES (name);
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


-- Dumping structure for procedure corporateforce.settingsCreate
DELIMITER //
CREATE DEFINER=`veress`@`%` PROCEDURE `settingsCreate`(IN `user` INT(10) UNSIGNED)
BEGIN
	INSERT INTO settings (settings.USER)
	VALUES (user);
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
