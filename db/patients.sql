-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 07, 2017 at 01:02 PM
-- Server version: 5.5.53
-- PHP Version: 7.0.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rita-base`
--

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `secondname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `tel` int(11) NOT NULL,
  `age` tinyint(150) NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `lastdate` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `secondname`, `firstname`, `gender`, `tel`, `age`, `comment`, `date`, `lastdate`) VALUES
(37, '<b>teeertret</b>', '<b>sdfsdfds</b>', 'venus', 0, 0, '<i>dffdg</i>', '2017-02-07', '0000-00-00'),
(36, 'dcgdvgdfvgdfv', 'csdgc', 'venus', 0, 0, 'gdfvgdvdfgv', '2017-02-07', '0000-00-00'),
(40, 'sdcdgccdvtd', 'dfvgfdv', 'venus', 423, 127, 'cdgchdvcascdsntbyvc', '2017-02-07', '2017-02-07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
