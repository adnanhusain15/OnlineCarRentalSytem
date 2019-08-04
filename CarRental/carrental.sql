-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2019 at 07:35 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

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
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `Bid` int(10) NOT NULL,
  `Bname` varchar(20) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `Owner_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `Vehicle_id` int(10) NOT NULL,
  `License_no` varchar(20) DEFAULT NULL,
  `Model` varchar(20) DEFAULT NULL,
  `Ctype` varchar(20) DEFAULT NULL,
  `Drate` int(10) DEFAULT NULL,
  `Wrate` int(10) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `CYear` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`Vehicle_id`, `License_no`, `Model`, `Ctype`, `Drate`, `Wrate`, `Status`, `CYear`) VALUES
(1, '100', 'tESLA x', 'Medium', 100, 75, NULL, '2017-02-03'),
(3, '101', 'tESLA x', 'Medium', 100, 75, NULL, '2017-02-03'),
(4, '102', 'tESLA x', 'Medium', 100, 75, NULL, '2017-02-03'),
(5, '104', 'tESLA x', 'Medium', 100, 75, NULL, '2017-02-03'),
(6, '1010', 'Maruti 800', 'Large', 150, 100, NULL, '1997-01-15'),
(7, '1011', 'Maruti 800', 'Large', 150, 100, NULL, '1997-01-15');

-- --------------------------------------------------------

--
-- Table structure for table `chauffeur`
--

CREATE TABLE `chauffeur` (
  `Chid` int(10) NOT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Mobile` int(12) DEFAULT NULL,
  `Dno` int(10) DEFAULT NULL,
  `Age` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chauffeur`
--

INSERT INTO `chauffeur` (`Chid`, `Name`, `Status`, `Mobile`, `Dno`, `Age`) VALUES
(1, 'PratikDesai', NULL, 2147483647, 0, 54),
(2, 'PratikDesai', NULL, 2147483647, 78, 54);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `Compid` int(10) NOT NULL,
  `Cname` varchar(20) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `Owner_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Cid` int(10) NOT NULL,
  `Fname` varchar(20) DEFAULT NULL,
  `Lname` varchar(20) DEFAULT NULL,
  `Mobile` int(12) DEFAULT NULL,
  `Age` int(3) DEFAULT NULL,
  `Dno` int(10) DEFAULT NULL,
  `Insno` int(10) DEFAULT NULL,
  `Vehicle_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Cid`, `Fname`, `Lname`, `Mobile`, `Age`, `Dno`, `Insno`, `Vehicle_id`) VALUES
(1, 'Adnan', 'Husain', 2147483647, 22, 100, 100, NULL),
(2, 'Aamir', 'Husain', 2147483647, 24, 200, 200, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `Dno` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`Dno`) VALUES
(0),
(78),
(100),
(200);

-- --------------------------------------------------------

--
-- Table structure for table `individual`
--

CREATE TABLE `individual` (
  `Ssn` int(10) NOT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `Owner_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `individual`
--

INSERT INTO `individual` (`Ssn`, `Name`, `City`, `Owner_id`) VALUES
(2, 'Adnan', 'Nagpur', NULL),
(3, 'Adnan', 'Nagpur', NULL),
(4, 'Adnan', 'Nagpur', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `Owner_id` int(10) NOT NULL,
  `name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `owns`
--

CREATE TABLE `owns` (
  `Owner_id` int(10) NOT NULL,
  `Vehicle_id` int(10) DEFAULT NULL,
  `CType` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rental`
--

CREATE TABLE `rental` (
  `Rid` int(10) NOT NULL,
  `Rdate` date DEFAULT NULL,
  `Amount` int(10) DEFAULT NULL,
  `Dno` int(10) DEFAULT NULL,
  `Vehicle_id` int(10) DEFAULT NULL,
  `CType` varchar(20) DEFAULT NULL,
  `cid` int(10) DEFAULT NULL,
  `RType` varchar(20) DEFAULT NULL,
  `Nodays` int(3) DEFAULT NULL,
  `Noweeks` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rental`
--

INSERT INTO `rental` (`Rid`, `Rdate`, `Amount`, `Dno`, `Vehicle_id`, `CType`, `cid`, `RType`, `Nodays`, `Noweeks`) VALUES
(1, '2019-03-03', NULL, NULL, 3, 'Medium', 2, 'Daily', 4, 0),
(2, '2019-03-03', NULL, NULL, 3, 'Medium', 2, 'Daily', 4, 0),
(3, '2019-03-03', NULL, NULL, 4, 'Medium', 2, 'Daily', 4, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`Bid`),
  ADD KEY `bank_ibfk_1` (`Owner_id`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`Vehicle_id`),
  ADD UNIQUE KEY `License_no` (`License_no`);

--
-- Indexes for table `chauffeur`
--
ALTER TABLE `chauffeur`
  ADD PRIMARY KEY (`Chid`),
  ADD KEY `Dno` (`Dno`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`Compid`),
  ADD KEY `company_ibfk_1` (`Owner_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Cid`),
  ADD KEY `Dno` (`Dno`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`Dno`);

--
-- Indexes for table `individual`
--
ALTER TABLE `individual`
  ADD PRIMARY KEY (`Ssn`),
  ADD KEY `individual_ibfk_1` (`Owner_id`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`Owner_id`);

--
-- Indexes for table `owns`
--
ALTER TABLE `owns`
  ADD PRIMARY KEY (`Owner_id`);

--
-- Indexes for table `rental`
--
ALTER TABLE `rental`
  ADD PRIMARY KEY (`Rid`),
  ADD KEY `Dno` (`Dno`),
  ADD KEY `Vehicle_id` (`Vehicle_id`),
  ADD KEY `cid` (`cid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `car`
--
ALTER TABLE `car`
  MODIFY `Vehicle_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `chauffeur`
--
ALTER TABLE `chauffeur`
  MODIFY `Chid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `Cid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rental`
--
ALTER TABLE `rental`
  MODIFY `Rid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bank`
--
ALTER TABLE `bank`
  ADD CONSTRAINT `bank_ibfk_1` FOREIGN KEY (`Owner_id`) REFERENCES `owner` (`Owner_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chauffeur`
--
ALTER TABLE `chauffeur`
  ADD CONSTRAINT `chauffeur_ibfk_1` FOREIGN KEY (`Dno`) REFERENCES `driver` (`Dno`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_1` FOREIGN KEY (`Owner_id`) REFERENCES `owner` (`Owner_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`Dno`) REFERENCES `driver` (`Dno`);

--
-- Constraints for table `individual`
--
ALTER TABLE `individual`
  ADD CONSTRAINT `individual_ibfk_1` FOREIGN KEY (`Owner_id`) REFERENCES `owner` (`Owner_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `owns`
--
ALTER TABLE `owns`
  ADD CONSTRAINT `owns_ibfk_1` FOREIGN KEY (`Owner_id`) REFERENCES `owner` (`Owner_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rental`
--
ALTER TABLE `rental`
  ADD CONSTRAINT `rental_ibfk_1` FOREIGN KEY (`Dno`) REFERENCES `driver` (`Dno`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rental_ibfk_2` FOREIGN KEY (`Vehicle_id`) REFERENCES `car` (`Vehicle_id`),
  ADD CONSTRAINT `rental_ibfk_3` FOREIGN KEY (`cid`) REFERENCES `customer` (`Cid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
