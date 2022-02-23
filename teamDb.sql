-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.5-10.4.20-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             8.1.0.4545
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table tree_view.team_map
CREATE TABLE IF NOT EXISTS `team_map` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `REPORTING_TO` int(11) NOT NULL,
  `CREATED_DATE` date NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `USER_ID` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table tree_view.team_map: ~15 rows (approximately)
/*!40000 ALTER TABLE `team_map` DISABLE KEYS */;
INSERT INTO `team_map` (`ID`, `USER_ID`, `REPORTING_TO`, `CREATED_DATE`) VALUES
	(1, 1, 0, '2022-02-22'),
	(2, 2, 1, '2022-02-22'),
	(3, 3, 2, '2022-02-22'),
	(4, 4, 1, '2022-02-22'),
	(11, 36, 4, '2022-02-23'),
	(12, 37, 11, '2022-02-23'),
	(13, 38, 1, '2022-02-23'),
	(15, 39, 4, '2022-02-23'),
	(16, 40, 15, '2022-02-23'),
	(17, 41, 13, '2022-02-23'),
	(18, 42, 13, '2022-02-23'),
	(19, 43, 18, '2022-02-23'),
	(20, 44, 2, '2022-02-23'),
	(21, 45, 1, '2022-02-23'),
	(22, 46, 1, '2022-02-23');
/*!40000 ALTER TABLE `team_map` ENABLE KEYS */;


-- Dumping structure for table tree_view.user
CREATE TABLE IF NOT EXISTS `user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FIRST_NAME` varchar(100) NOT NULL,
  `LAST_NAME` varchar(100) NOT NULL,
  `CREATED_DATE` datetime NOT NULL DEFAULT current_timestamp(),
  `STATUS` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - Active\r\n0 - In active',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table tree_view.user: ~6 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`ID`, `FIRST_NAME`, `LAST_NAME`, `CREATED_DATE`, `STATUS`) VALUES
	(1, 'Mohan', 'M', '2022-02-22 16:29:27', 1),
	(2, 'Shankar', 'M', '2022-02-22 16:29:27', 1),
	(3, 'Ram', 'Ganesh', '2022-02-22 16:29:27', 1),
	(4, 'Kala', 'Gopi', '2022-02-22 16:29:27', 1),
	(5, 'Gokul', 'K', '2022-02-22 16:29:27', 1),
	(36, 'Selvi', 'Selvi', '2022-02-23 13:49:51', 1),
	(37, 'Kannan', 'Kannan', '2022-02-23 13:54:45', 1),
	(38, 'Shiva', 'Shiva', '2022-02-23 13:56:28', 1),
	(39, 'Welcome', 'Welcome', '2022-02-23 16:43:48', 1),
	(40, 'Suma', 'Suma', '2022-02-23 16:45:02', 1),
	(41, 'sdsdf', 'sdsdf', '2022-02-23 16:45:18', 1),
	(42, 'Kalai', 'Kalai', '2022-02-23 16:45:46', 1),
	(43, 'Lohith', 'Lohith', '2022-02-23 16:48:44', 1),
	(44, 'Ravi Kannan', 'Ravi Kannan', '2022-02-23 18:05:23', 1),
	(45, 'Greate Work', 'Greate Work', '2022-02-23 18:09:41', 1),
	(46, 'Redhanaya', '', '2022-02-23 18:18:44', 1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
