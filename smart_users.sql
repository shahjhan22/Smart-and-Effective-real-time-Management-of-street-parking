-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 11, 2017 at 05:52 PM
-- Server version: 5.7.20-0ubuntu0.16.04.1
-- PHP Version: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smart_users`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `email`) VALUES
(2, 'Shahjhan', 'Shahjhan123', 'Shah@gmail.com'),
(3, 'admin', 'admin123', 'admin@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `attendant`
--

CREATE TABLE `attendant` (
  `id_attendant` int(200) NOT NULL,
  `Fname` varchar(200) NOT NULL,
  `Lname` varchar(200) NOT NULL,
  `mobile_no` varchar(200) NOT NULL,
  `location` varchar(200) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendant`
--

INSERT INTO `attendant` (`id_attendant`, `Fname`, `Lname`, `mobile_no`, `location`, `username`, `password`) VALUES
(1, 'Rohit', 'Kumar', '0708009360', 'sec-11', 'rohit12345', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `parkings`
--

CREATE TABLE `parkings` (
  `id` int(200) NOT NULL,
  `location` varchar(200) NOT NULL,
  `street` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `slot` int(200) NOT NULL,
  `remaining_slots` varchar(50) NOT NULL,
  `attendant` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `price` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parkings`
--

INSERT INTO `parkings` (`id`, `location`, `street`, `name`, `slot`, `remaining_slots`, `attendant`, `date`, `price`) VALUES
(1, 'Old Faridabad', 'sec-11', 'Joshi Parking', 35, '35', 'rohit', '2024-05-09 11:45:59', '100');

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` int(255) NOT NULL,
  `parking_id` int(25) NOT NULL,
  `slots` varchar(25) NOT NULL,
  `hours` int(25) NOT NULL,
  `cost` int(25) NOT NULL,
  `customer` varchar(25) NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `parking_id`, `slots`, `hours`, `cost`, `customer`, `time`, `status`) VALUES
(12, 1, '1', 4, 80, 'maink@gmail.com', '2024-07-21 12:19:29', 'completed'),
(13, 5, '1', 2, 1000, 'dan@gmail.com', '2024-10-31 14:45:59', 'requested');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `password_confirm` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `password_confirm`) VALUES
(1, 'john', 'john@gmail.com', 'john1234', 'john1234'),
(2, 'Shahjhan', 'Shahjhan@gmail.com', '12345', '12345'),
(3, 'Dan', 'dan@gmail.com', '$2y$10$OWWnE8vrh0EKvnbBhjgVYu5oV21m36Exi9l8y7wfwZ3VRkuolmNFu', '$2y$10$LIE8WLMnBogS625KGhqqZOszGdxmtCLyIR1bNTI2hg13VMrabZaoa'),
(4, 'king', 'test@gmail.com', '$2y$10$WZUiLaha1ZLII0KE0ev55uFW3ECjX3WhVjydS37r5PqLkrscyU2k.', '$2y$10$ro2qv7h841xx9go4L9lq/uQXSkj8nQ1DT89RF/NroJ15VtHT2b3uu');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendant`
--
ALTER TABLE `attendant`
  ADD PRIMARY KEY (`id_attendant`);

--
-- Indexes for table `parkings`
--
ALTER TABLE `parkings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `attendant`
--
ALTER TABLE `attendant`
  MODIFY `id_attendant` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `parkings`
--
ALTER TABLE `parkings`
  MODIFY `id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
