-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 17, 2021 at 03:39 AM
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
-- Database: `milioner`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `is_true` int(1) NOT NULL COMMENT '0- false 1 -true'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `question_id`, `answer`, `is_true`) VALUES
(1, 1, 'Plastic', 0),
(2, 1, 'Metal', 1),
(3, 1, 'Wood', 0),
(4, 1, 'The wrong man', 0),
(5, 2, 'Ireland', 0),
(6, 2, 'Wales', 0),
(7, 2, 'The United States', 0),
(8, 2, 'Scotland', 1),
(9, 3, 'Food', 0),
(10, 3, 'Money', 1),
(11, 3, 'Clothing', 0),
(12, 3, 'Reality television', 0),
(13, 4, 'July 4th weekend', 0),
(14, 4, 'Halloween night', 0),
(15, 4, 'Christmas Day', 1),
(16, 4, 'National Burrito Month', 0),
(17, 5, 'Your tongue', 0),
(18, 5, 'Your teeth', 0),
(19, 5, 'Your passport', 1),
(20, 5, 'The door', 0),
(21, 6, 'Wake up', 0),
(22, 6, 'Fall asleep', 1),
(23, 6, 'Eat', 0),
(24, 6, 'Invest wisely', 0),
(29, 6, 'Play football', 0);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `description` text NOT NULL,
  `points` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `description`, `points`) VALUES
(1, 'A magnet would most likely attract which of the following?', 10),
(2, 'Where did Scotch whisky originate?', 8),
(3, 'According to the old saying, \"love of\" what \"is the root of all evil\"?', 15),
(4, 'A well-known lyric in the holiday song \"Silver Bells\" promises that \"soon it will be\" what?', 9),
(5, 'If someone asked to see your ID, what might you show them?', 5),
(6, 'A lullaby is a song sung to babies to help them do what?', 13);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `array` varchar(255) DEFAULT NULL,
  `points` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `array`, `points`) VALUES
(108, '[1,6,2,3,5]', 28),
(109, '[2,3,4,1,6]', 15),
(110, '[6]', 0),
(111, '[3,4,1,2,6]', 27),
(112, '[2]', 0),
(113, '[5]', 0),
(114, '[1]', 0),
(115, '[4,3,5,2,6]', 14);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question` (`question_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `question` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
