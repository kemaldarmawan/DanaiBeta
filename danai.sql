-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 12, 2014 at 05:55 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `danai`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `categoryId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryId`, `name`) VALUES
(1, 'Games'),
(2, 'Art');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `commentId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `projectId` int(11) NOT NULL,
  `content` varchar(500) NOT NULL,
  `createdDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`commentId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`commentId`, `userId`, `projectId`, `content`, `createdDateTime`) VALUES
(1, 1, 2, 'mantap gan', '2014-01-12 04:29:53'),
(2, 2, 2, 'lanjut gan', '2014-01-12 04:29:53');

-- --------------------------------------------------------

--
-- Table structure for table `fund`
--

CREATE TABLE IF NOT EXISTS `fund` (
  `fundId` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `createdDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`fundId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `fund`
--

INSERT INTO `fund` (`fundId`, `projectId`, `userId`, `value`, `createdDateTime`) VALUES
(4, 2, 2, 5000, '2014-01-12 04:55:03'),
(5, 2, 3, 2000, '2014-01-12 04:55:03');

--
-- Triggers `fund`
--
DROP TRIGGER IF EXISTS `addCurrentFund`;
DELIMITER //
CREATE TRIGGER `addCurrentFund` AFTER INSERT ON `fund`
 FOR EACH ROW BEGIN
UPDATE project set currentFund = currentFund + new.value where project.projectId = new.projectId;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `subtractCurrentFund`;
DELIMITER //
CREATE TRIGGER `subtractCurrentFund` AFTER DELETE ON `fund`
 FOR EACH ROW BEGIN
UPDATE project set currentFund = currentFund - old.value where project.projectId = old.projectId;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `locationId` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(50) NOT NULL,
  `province` varchar(50) NOT NULL,
  PRIMARY KEY (`locationId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`locationId`, `city`, `province`) VALUES
(1, 'Surabaya', 'Jawa Timur'),
(2, 'Bandung', 'Jawa Barat');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `projectId` int(11) NOT NULL AUTO_INCREMENT,
  `locationId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `minimalFund` int(11) NOT NULL,
  `currentFund` int(11) NOT NULL DEFAULT '0',
  `createdDate` date NOT NULL,
  `lastDate` date NOT NULL,
  `photo` varchar(200) NOT NULL,
  `explanation` text NOT NULL,
  PRIMARY KEY (`projectId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`projectId`, `locationId`, `categoryId`, `userId`, `title`, `description`, `minimalFund`, `currentFund`, `createdDate`, `lastDate`, `photo`, `explanation`) VALUES
(2, 1, 1, 1, 'Project Nimbus', 'Take to the sky in this high speed mech action game. Dodge bullets, intercept missiles, defeat your enemies and save the Earth.', 50000, 7000, '2014-01-01', '2014-02-07', '', ''),
(3, 2, 2, 2, 'Another Project', 'Art Category', 250000, 0, '2014-01-16', '2014-01-23', '', 'Another Project'),
(4, 1, 1, 1, 'aaaaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaa', 1, 0, '2013-12-01', '2014-01-10', '', ''),
(5, 2, 2, 2, 'AAAAAAAAAAAAA', 'aaaaaaaaaaaaaa', 1, 0, '2013-12-01', '2013-12-17', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `foto` varchar(200) NOT NULL,
  `bio` varchar(200) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `username`, `password`, `name`, `foto`, `bio`) VALUES
(1, 'haidar', '1', 'haidar', '', ''),
(2, 'witheld', '1', 'witheld', '', ''),
(3, 'kemal', 'kemal', 'kemal', '', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
