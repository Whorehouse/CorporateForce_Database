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


-- Dumping structure for function corporateforce.userSignIn
DELIMITER //
CREATE DEFINER=`veress`@`%` FUNCTION `userSignIn`(`username` VARCHAR(50), `password` VARCHAR(32)) RETURNS int(10) unsigned
BEGIN
	DECLARE result INT(10) UNSIGNED;
	SELECT `users`.`id` INTO result FROM `users` WHERE `users`.`USERNAME`=username AND `users`.`PASSWORD`=MD5(MD5(password));
	return result;
END//
DELIMITER ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
