-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2023 at 11:39 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `studentdata`
--

-- --------------------------------------------------------

--
-- Table structure for table `certificate`
--

CREATE TABLE `certificate` (
  `certificateNumber` varchar(50) NOT NULL,
  `courseID` varchar(50) NOT NULL,
  `certificateTitle` varchar(100) NOT NULL,
  `issueDate` date NOT NULL,
  `ExpiryDate` date NOT NULL,
  `certificateID` int(50) NOT NULL,
  `staffID` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `certificate`
--

INSERT INTO `certificate` (`certificateNumber`, `courseID`, `certificateTitle`, `issueDate`, `ExpiryDate`, `certificateID`, `staffID`) VALUES
('4561238', 'UTM4561', 'Computer Science', '2023-06-09', '2024-06-14', 1, 1),
('1234567', 'UTM4562', 'Multimedia', '2023-06-09', '2024-06-10', 2, 1),
('4561238', 'UTM4561', 'Computer Science', '2023-06-09', '2023-06-16', 3, 2),
('AMTC/WAH/23/001', 'AMTC23', 'WAH', '2023-06-11', '2024-06-08', 45698712, 3);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `userID` int(50) NOT NULL,
  `fullName` varchar(100) NOT NULL,
  `identityCardNo` varchar(50) DEFAULT NULL,
  `passportNo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`userID`, `fullName`, `identityCardNo`, `passportNo`) VALUES
(1, 'Hosea Epoi Henry', '030908131009', NULL),
(2, 'Ammar Danish', '030806140457', NULL),
(3, 'Henry Siban', '700923135569', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `certificate`
--
ALTER TABLE `certificate`
  ADD PRIMARY KEY (`certificateID`),
  ADD KEY `fk_user` (`staffID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `certificate`
--
ALTER TABLE `certificate`
  MODIFY `certificateID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45698713;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `userID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `certificate`
--
ALTER TABLE `certificate`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`staffID`) REFERENCES `staff` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
