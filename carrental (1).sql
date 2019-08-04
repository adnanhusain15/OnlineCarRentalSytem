-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 31, 2019 at 05:20 AM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
CREATE TABLE IF NOT EXISTS `car` (
  `Vehicle_id` int(10) NOT NULL AUTO_INCREMENT,
  `License_no` varchar(20) DEFAULT NULL,
  `Model` varchar(20) DEFAULT NULL,
  `Ctype` varchar(20) DEFAULT NULL,
  `Status` varchar(20) NOT NULL DEFAULT 'Active',
  `CYear` date DEFAULT NULL,
  PRIMARY KEY (`Vehicle_id`),
  UNIQUE KEY `License_no` (`License_no`),
  KEY `Ctype` (`Ctype`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`Vehicle_id`, `License_no`, `Model`, `Ctype`, `Status`, `CYear`) VALUES
(1, '100', 'tESLA x', 'Medium', 'Active', '2017-02-03'),
(3, '101', 'tESLA x', 'Medium', 'Active', '2017-02-03'),
(4, '102', 'tESLA x', 'Medium', 'Active', '2017-02-03'),
(5, '104', 'tESLA x', 'Medium', 'Active', '2017-02-03'),
(6, '1010', 'Maruti 800', 'Large', 'Active', '1997-01-15'),
(7, '1011', 'Maruti 800', 'Large', 'Active', '1997-01-15'),
(8, '12345', 'SWIFT DEZIRE', 'Medium', 'Active', '2013-04-12'),
(9, '7845', 'I10', 'Compact', 'Hired', '2013-04-12'),
(10, '312', 'HondaCity', 'Large', 'Active', '2013-04-12'),
(11, '1412151317', 'Baleno', 'Compact', 'Hired', '2001-01-01'),
(12, '36363636', 'Honda Accord', 'Medium', 'Active', '2012-05-05'),
(14, '36363631', 'Innova', 'SUV', 'Active', '2012-05-05'),
(15, '3636363786', 'Scorpio', 'SUV', 'Active', '2012-05-05'),
(16, '5253', 'Zen', 'Compact', 'Active', '2001-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `chauffeur`
--

DROP TABLE IF EXISTS `chauffeur`;
CREATE TABLE IF NOT EXISTS `chauffeur` (
  `Chid` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Mobile` int(15) DEFAULT NULL,
  `Dno` int(10) DEFAULT NULL,
  `Age` int(3) DEFAULT NULL,
  PRIMARY KEY (`Chid`),
  KEY `Dno` (`Dno`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chauffeur`
--

INSERT INTO `chauffeur` (`Chid`, `Name`, `Status`, `Mobile`, `Dno`, `Age`) VALUES
(1, 'PratikDesai', NULL, 2147483647, 0, 54),
(2, 'PratikDesai', NULL, 2147483647, 78, 54),
(3, 'RamSharma', NULL, 758880009, 346, 23),
(4, 'RamanSharma', NULL, 258880009, 342, 33),
(6, 'RamDesai', NULL, 7777777, 786, 19),
(7, 'VermaJI', NULL, 66666655, 62626262, 66);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `Cid` int(10) NOT NULL AUTO_INCREMENT,
  `Fname` varchar(20) DEFAULT NULL,
  `Lname` varchar(20) DEFAULT NULL,
  `Mobile` int(15) DEFAULT NULL,
  `Age` int(3) DEFAULT NULL,
  `Dno` int(10) DEFAULT NULL,
  `Insno` int(10) DEFAULT NULL,
  PRIMARY KEY (`Cid`),
  KEY `Dno` (`Dno`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Cid`, `Fname`, `Lname`, `Mobile`, `Age`, `Dno`, `Insno`) VALUES
(1, 'Adnan', 'Husain', 2147483647, 22, 100, 100),
(2, 'Aamir', 'Husain', 2147483647, 24, 200, 200),
(3, 'Harsh', 'Goyal', 758880009, 20, 127, 127),
(4, 'Vivek', 'Jain', 85213, 17, 666, 666),
(5, 'Vivek', 'Jain', 777777, 18, 6664, 6664),
(6, 'Dilipkumar', 'Borikar', 989796959, 45, 989796959, 989795969),
(7, 'Kartik', 'Kasat', 12458798, 23, 986532555, 23568956),
(8, 'Gaurav', 'Goenka', 12458798, 45, 986532551, 23568951),
(9, 'Gaurav1', 'Goenka1', 12458791, 41, 986532552, 23568952),
(10, 'Gaurav1_1', 'Goenka1_1', 12458793, 51, 986532553, 23568953),
(11, 'Vivek', 'Jain', 758880009, 23, 675, 8989),
(12, 'Yash', 'gin', 12321324, 20, 1231, 2133);

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
CREATE TABLE IF NOT EXISTS `driver` (
  `Dno` int(10) NOT NULL,
  PRIMARY KEY (`Dno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`Dno`) VALUES
(0),
(78),
(100),
(121),
(123),
(127),
(200),
(341),
(342),
(345),
(346),
(348),
(349),
(666),
(675),
(786),
(1231),
(6661),
(6664),
(1234567),
(62626262),
(986532551),
(986532552),
(986532553),
(986532555),
(989796959);

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
CREATE TABLE IF NOT EXISTS `log` (
  `Bid` int(10) NOT NULL AUTO_INCREMENT,
  `Rdate` date DEFAULT NULL,
  `Vehicle_id` int(10) DEFAULT NULL,
  `CType` varchar(20) DEFAULT NULL,
  `cid` int(10) DEFAULT NULL,
  `RType` varchar(20) DEFAULT NULL,
  `Nodays` int(3) DEFAULT NULL,
  `Noweeks` int(3) DEFAULT NULL,
  `Amount` int(10) NOT NULL,
  PRIMARY KEY (`Bid`),
  KEY `Vehicle_id` (`Vehicle_id`),
  KEY `cid` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`Bid`, `Rdate`, `Vehicle_id`, `CType`, `cid`, `RType`, `Nodays`, `Noweeks`, `Amount`) VALUES
(22, '1994-11-11', 8, 'Medium', 2, 'Daily', 0, 3, 300),
(23, '2002-01-01', 11, 'Compact', 6, 'Weekly', 2, 3, 135),
(24, '1994-11-11', 14, 'SUV', 10, 'Weekly', 1, 3, 705),
(25, '1994-11-11', 1, 'Medium', 10, 'Weekly', 1, 3, 300),
(26, '1994-11-11', 12, 'Medium', 7, 'Weekly', 1, 3, 300),
(29, '2002-01-01', 16, 'Compact', 11, 'Weekly', 0, 2, 200);

-- --------------------------------------------------------

--
-- Table structure for table `rates`
--

DROP TABLE IF EXISTS `rates`;
CREATE TABLE IF NOT EXISTS `rates` (
  `CType` varchar(20) NOT NULL,
  `Drate` int(10) DEFAULT NULL,
  `Wrate` int(10) DEFAULT NULL,
  PRIMARY KEY (`CType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rates`
--

INSERT INTO `rates` (`CType`, `Drate`, `Wrate`) VALUES
('Compact', 120, 100),
('Large', 500, 766),
('Medium', 75, 100),
('SUV', 250, 235),
('Truck', NULL, NULL),
('Van', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rental`
--

DROP TABLE IF EXISTS `rental`;
CREATE TABLE IF NOT EXISTS `rental` (
  `Rid` int(10) NOT NULL AUTO_INCREMENT,
  `Rdate` date DEFAULT NULL,
  `Vehicle_id` int(10) DEFAULT NULL,
  `CType` varchar(20) DEFAULT NULL,
  `cid` int(10) DEFAULT NULL,
  `RType` varchar(20) DEFAULT NULL,
  `Nodays` int(3) DEFAULT NULL,
  `Noweeks` int(3) DEFAULT NULL,
  PRIMARY KEY (`Rid`),
  KEY `Vehicle_id` (`Vehicle_id`),
  KEY `cid` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rental`
--

INSERT INTO `rental` (`Rid`, `Rdate`, `Vehicle_id`, `CType`, `cid`, `RType`, `Nodays`, `Noweeks`) VALUES
(27, '1994-11-11', 11, 'Compact', 1, 'Weekly', 1, 1),
(28, '2018-11-11', 9, 'Compact', 1, 'Daily', 4, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`Ctype`) REFERENCES `rates` (`CType`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chauffeur`
--
ALTER TABLE `chauffeur`
  ADD CONSTRAINT `chauffeur_ibfk_1` FOREIGN KEY (`Dno`) REFERENCES `driver` (`Dno`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`Dno`) REFERENCES `driver` (`Dno`);

--
-- Constraints for table `rental`
--
ALTER TABLE `rental`
  ADD CONSTRAINT `rental_ibfk_2` FOREIGN KEY (`Vehicle_id`) REFERENCES `car` (`Vehicle_id`),
  ADD CONSTRAINT `rental_ibfk_3` FOREIGN KEY (`cid`) REFERENCES `customer` (`Cid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
