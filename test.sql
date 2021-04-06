-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2021 at 11:50 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `credusers`
--

CREATE TABLE `credusers` (
  `uId` int(11) NOT NULL,
  `fName` varchar(21) NOT NULL,
  `lName` varchar(64) NOT NULL,
  `eMail` varchar(64) DEFAULT NULL,
  `pWord` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table for Credible Users';

--
-- Dumping data for table `credusers`
--

INSERT INTO `credusers` (`uId`, `fName`, `lName`, `eMail`, `pWord`) VALUES
(10, 'Tommy', 'Trojan', 'guangore@gmail.com', '$2a$10$KIsUAiSfUHPWzHnF/ZqicOtvwocy.snLeuMEq8Ae3GHqfF2kbNzBa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `credusers`
--
ALTER TABLE `credusers`
  ADD PRIMARY KEY (`uId`),
  ADD UNIQUE KEY `U Email` (`eMail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `credusers`
--
ALTER TABLE `credusers`
  MODIFY `uId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
