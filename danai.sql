-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2014 at 05:53 AM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryId`, `name`) VALUES
(1, 'Games'),
(2, 'Art'),
(3, 'Technology'),
(4, 'Film'),
(5, 'Music'),
(6, 'Comics'),
(7, 'Design');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `commentId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `projectId` int(11) NOT NULL,
  `content` varchar(2000) NOT NULL,
  `createdDateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`commentId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`commentId`, `userId`, `projectId`, `content`, `createdDateTime`) VALUES
(7, 14, 27, '17 days to go? Can we make it to 50,000 people? I''d love to see that happen. With Dean''s permission anyone want to do a big get the word out push Friday on social media?', '2014-01-16 04:40:51'),
(8, 15, 27, 'I don''t know if you decided on what you were thinking for more stretch goals, but my top choice would be more/new content, and second would be either embossed or debossed covers. these are just ideas, by no means do you have to use my ideas.', '2014-01-16 04:41:45'),
(9, 15, 20, 'I''m nervous I''ve hit a bad bug. I''m in the room with the body scanner and I can no longer move Hope. I get the red circle with the line through it no matter where I click. I''ve reloaded the game and have the same issue. Can anyone tell me if this is a bug or am I just missing something here? Thanks!', '2014-01-16 04:42:31'),
(10, 21, 20, 'Loving the game thus far. Tbh I''m used to getting stuff a little late from KS - I''d say less than a week past launch is good. Hopefully you guys can get it to everyone else quickly too :)', '2014-01-16 04:46:19'),
(11, 19, 20, 'I was just looking at the backer exclusive t-shirt ... really wish I''d bumped up my backing level that little bit higher to get it. Of course, I didn''t know it was going to look like that at the time, but I should have known with all the art talent at Camouflaj and Logan it was going to be amazing!', '2014-01-16 04:47:28'),
(12, 14, 20, 'Hey everyone, sorry for not being able to jump into this comments section and answer all the great questions in here. We''ve been working throughout the holidays to answer emails, direct messages, and comments on the Backer Updates as well as making sure to gifting copies and preparing Paypal for mass refunds. Please make sure to read the latest updates.\nBut I''ll jump in and answer some of your questions now! If I?ve skipped over you, it?s likely cause our records show you?ve received the game or because I know we?ve had correspondence else where.\nIf any of you are having troubles with the redemption process, please email into support_backers@camouflaj.com; it?ll be much easier to troubleshoot through there.\n@pevita - We''re still working on getting you all a copy of the Season Pass; we''ll have more info later this month. :)', '2014-01-16 04:49:42');

-- --------------------------------------------------------

--
-- Table structure for table `fund`
--

CREATE TABLE IF NOT EXISTS `fund` (
  `fundId` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `createdDateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`fundId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `fund`
--

INSERT INTO `fund` (`fundId`, `projectId`, `userId`, `value`, `createdDateTime`) VALUES
(1, 20, 15, 10000, '2014-01-16 04:25:34'),
(2, 20, 16, 400000, '2014-01-16 04:25:34'),
(3, 20, 17, 50000, '2014-01-16 04:26:26'),
(4, 20, 18, 70000, '2014-01-16 04:26:26'),
(5, 20, 20, 60000, '2014-01-16 04:26:54'),
(6, 20, 13, 200000, '2014-01-16 04:26:54'),
(7, 22, 13, 1500, '2014-01-16 04:28:06'),
(8, 28, 13, 50000, '2014-01-16 04:29:26'),
(9, 28, 14, 2000, '2014-01-16 04:29:26'),
(10, 28, 18, 6000, '2014-01-16 04:29:52'),
(11, 28, 19, 7000, '2014-01-16 04:29:52'),
(12, 27, 13, 3000, '2014-01-16 04:30:45'),
(13, 27, 14, 2000, '2014-01-16 04:30:45'),
(14, 25, 14, 12000, '2014-01-16 04:35:22'),
(15, 26, 13, 2000, '2014-01-16 04:37:07'),
(16, 26, 14, 3000, '2014-01-16 04:37:07'),
(17, 24, 18, 1000, '2014-01-16 04:39:27'),
(18, 24, 19, 3000, '2014-01-16 04:39:27');

--
-- Triggers `fund`
--
DROP TRIGGER IF EXISTS `addCurrentFund`;
DELIMITER //
CREATE TRIGGER `addCurrentFund` AFTER INSERT ON `fund`
 FOR EACH ROW BEGIN
UPDATE project set currentFund = currentFund + new.value where project.projectId = new.projectId;
UPDATE project set fundedNumber = fundedNumber + 1 where project.projectId = new.projectId;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `subtractCurrentFund`;
DELIMITER //
CREATE TRIGGER `subtractCurrentFund` AFTER DELETE ON `fund`
 FOR EACH ROW BEGIN
UPDATE project set currentFund = currentFund - old.value where project.projectId = old.projectId;
UPDATE project set fundedNumber = fundedNumber - 1 where project.projectId = old.projectId;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `updateCurrentFund`;
DELIMITER //
CREATE TRIGGER `updateCurrentFund` AFTER UPDATE ON `fund`
 FOR EACH ROW BEGIN
UPDATE project set currentFund = currentFund - old.value where project.projectId = old.projectId;
UPDATE project set fundedNumber = fundedNumber - 1 where project.projectId = old.projectId;
UPDATE project set currentFund = currentFund + new.value where project.projectId = new.projectId;
UPDATE project set fundedNumber = fundedNumber + 1 where project.projectId = new.projectId;
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`locationId`, `city`, `province`) VALUES
(1, 'Surabaya', 'Jawa Timur'),
(2, 'Bandung', 'Jawa Barat'),
(3, 'Malang', 'Jawa Timur'),
(4, 'Jakarta', 'D.I. Jakarta'),
(5, 'Yogyakarta', 'D.I. Yogyakarta');

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
  `fundedNumber` int(11) DEFAULT '0',
  `minimalFund` int(11) NOT NULL,
  `currentFund` int(11) DEFAULT '0',
  `createdDate` date NOT NULL,
  `lastDate` date DEFAULT NULL,
  `explanation` text NOT NULL,
  PRIMARY KEY (`projectId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`projectId`, `locationId`, `categoryId`, `userId`, `title`, `description`, `fundedNumber`, `minimalFund`, `currentFund`, `createdDate`, `lastDate`, `explanation`) VALUES
(20, 2, 1, 14, 'Republique', 'Help Hope escape from a 1984-inspired dystopia. Developed by Camouflaj (MGS4, F.E.A.R., Halo 4, Kinect) and Logan (Skyrim TV spot).', 6, 500000, 790000, '2013-12-05', '2014-01-14', 'Developed by industry veterans behind AAA games like Metal Gear Solid, Halo, F.E.A.R., Kinect, and cutting edge videos like the Skyrim television spot and the iconic iPod ?silhouette? ads, République represents a strategic alliance between Camouflaj and Logan to make an epic action game designed specifically for touch-based devices.'),
(22, 4, 2, 14, 'The Aesir Deck - Viking Gods', 'Happy Ragnarok! Another year, another apocalypse. Celebrate the "end of the world" with cards dedicated to Viking lore.', 1, 6000, 1500, '2014-01-01', '2014-01-31', 'The star of the deck, Odin, is the main god of the Æsir, the pantheon of Norse gods. He exchanged an eye to be able to drink from the Well of Wisdom and was the god of battle, poetry, magic, and perhaps not surprisingly, wisdom. Two of his sons, Thor and Balder, are the King of Clubs and Hearts, respectively. The King of Diamonds is Njord, a member of the Vanir race, with whom the Æsir were at war. When they were negotiating a peace treaty, Njord was selected to join the Æsir in what amounted to a hostage exchange. The Queens of each suit are wives of that suit''s King and all but one of the Jacks are sons of that suit''s King. Since two of Odin''s sons are Kings themselves, the Jack of Spades is represented by Odin''s trusted ravens Hugin and Munin (Thought and Memory).'),
(23, 2, 1, 15, 'Octopus City Bullet', 'The authentic Octopus City simulation for Windows, OS X and Linux. A surreal adventure game about everything and nothing.', 0, 7000, 0, '2014-01-12', '2014-01-15', 'Assume the role of Kaf Kafkaryan, a cowardly middle-aged octopus blood junkie and tentacle trimmer, living in a city built around a giant octopus. Kaf has been experiencing bizarre dreams about a world populated by twisted creatures. To help the inhabitants of his dreams, he must learn more about the people of the city and explore the underside of the towering metropolis. Along the way he becomes entangled in a conspiracy with far-reaching implications for Octopus City.'),
(24, 4, 4, 16, 'Hadeas', 'A short film about the primal nature of evil and the moment when we truly know ourselves.', 2, 21500, 4000, '2014-01-16', '2014-01-17', 'From the hands of a little girl, to an older man, to a young boy, the rock interacts with the brokenness of human relationships, the loss of innocence, and regret that comes with age.  Set in the sparsely beautiful rolling hills and small quaint towns of Central California, Hadeas delves into the nature of evil and how it affects us as human beings.'),
(25, 4, 3, 17, 'My N3RD', 'My N3RD is a revolutionary Wi-Fi product that allows you to control any device from your Smart Phone. No internet or router required.', 1, 50000, 12000, '2014-01-16', '2014-01-31', 'My N3RD turns your smartphone into a remote control for every gadget, vehicle and appliance you own. It works with the My N3RD app to upgrade ANY switch into a wireless controlled, programmable, and automatic smart switch, updating all of your devices into intelligent connected ones.\r\n\r\nConnect and control devices directly. No internet connection or router required.  \r\nWorks with DC and mobile applications such as Cars, RVs, and boats. My N3RD is not just limited to your home.\r\nConnects to any switch, enabling you to upgrade virtually anything, not just simple appliances like fans and lights.\r\nSimple setup. You only need to configure functions in the App once, and you can reuse them again and again.\r\nMy N3RD is equipped with two relays and two inputs that can be used with external switches and physical switches to create a wide variety of uses.\r\nMy N3RD is smart. You can program My N3RD to act without your intervention. Use the app to set timers for appliances and electronics.\r\n\r\nAlthough My N3RD has the advantage of direct connect capability, it can also be connected through your home WiFi allowing you to control devices from anywhere. Upgrade anything to an Internet of Things device.'),
(26, 4, 5, 18, 'I am Voyager', 'Voyager needs your help to say "I am Voyager" and be a part of finishing album number V. Watch the video and find out how!', 2, 7500, 5000, '2014-01-01', '2014-01-29', 'So, we''re about half way through our album and mixing, production and promo is still to come. This stuff is expensive and we''re all out of fan cookies! That''s why we need your help finishing off the album. This is a huge step for us, but our fans have been so amazing over the last decade that we really think this can work. It''s DIRECT support, which is the way we think it should be.'),
(27, 1, 6, 19, 'Something Terrible', 'Something Terrible is a short, autobiographical comic about recovery from childhood trauma and the power of fictional heroes.', 2, 6400, 5000, '2014-01-16', '2014-01-18', 'Something Terrible follows the effects of childhood abuse into my adult life, with the conflicting ideas of the Cycle of Abuse theory and the message of all good superhero stories, "You are who you choose to be," battled in my mind until I was finally, completely set free by the fictional characters I''d modeled my life on. I wrote more about this in the afterword, which I shared on Huffington Post.'),
(28, 1, 7, 20, 'Snaak: Millions of Shapes', '3D puzzle and shape-maker tool. Line of 64 cuboids that lock into infinite forms. Design, doodle and play in 3D!', 4, 20000, 65000, '2014-01-16', '2014-02-12', 'You can snaak from column to cube; from cube back to column; transform from column to eight cubes; and back to column. Goto rod and make pyramid; and back to rod.  From rod snaak to three interlocking cubes or nine interlocking cubes or eight diamonds; and back to rod.  From rod, snaak to hypercube or tesseract; and back to rod. From rod, snaak to square; then fold to fit in your pocket...');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `bio` varchar(200) NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `username`, `password`, `name`, `bio`) VALUES
(13, 'faldir', '123456', 'faldi', 'bio'),
(14, 'Camouflaj', '123456', 'Camouflaj', 'game creator'),
(15, 'ghost_in_a_bottle', '123456', 'Ghost in a Bottle', 'game studio in Kuwait'),
(16, 'randy_may', '123456', 'Randy May', 'aspiring director'),
(17, 'wild_hare', '123456', 'Wild Hare LLC', 'Rob Dorrell created Wild Hare, LLC as his "creative release" and to provide his Engineering and Manufacturing Company a solution for product creation and ideation.'),
(18, 'voyager', '123456', 'Voyager', 'Metal band from NY, USA'),
(19, 'dean_t', '123456', 'Dean Trippe', 'comic creator from Jefferson, CA.'),
(20, 'snaak_llc', '123456', 'Snaak LLC', 'Snaak invention: Gideon Cube-Sherman, London. '),
(21, 'pevitap', '123456', 'Pevita', 'indonesian artist');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
