-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2021 at 06:47 PM
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
-- Database: `bus_booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `booked`
--

CREATE TABLE `booked` (
  `id` int(30) NOT NULL,
  `schedule_id` int(30) NOT NULL,
  `ref_no` text NOT NULL,
  `name` varchar(250) NOT NULL,
  `qty` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT 0 COMMENT '1=Paid, 0- Unpaid',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booked`
--

INSERT INTO `booked` (`id`, `schedule_id`, `ref_no`, `name`, `qty`, `status`, `date_updated`) VALUES
(1, 1, '202009091727', 'John Smith', 1, 1, '2020-09-09 10:29:44'),
(2, 1, '202009091626', 'Sample', 2, 0, '2020-09-09 09:34:28'),
(3, 1, '202009099953', 'asdasd asdasd', 27, 0, '2020-09-09 09:53:09'),
(4, 2, '202104263409', 'Rahul', 0, 0, '2021-04-26 10:40:22'),
(5, 3, '202104263711', 'Rahul kumar', 100, 0, '2021-04-26 10:42:51'),
(6, 6, '202104304705', 'Rohan', 4, 0, '2021-05-01 00:00:01'),
(7, 9, '202104307573', 'Rahul', 5, 0, '2021-05-01 00:00:14'),
(8, 7, '202104307588', 'Aditya', 50, 1, '2021-05-01 00:03:54'),
(9, 10, '202104304849', 'Dhoni', 2, 1, '2021-05-01 00:03:48'),
(10, 6, '202105045094', 'Passenger', 5, 0, '2021-05-04 08:11:09'),
(11, 6, '202105047178', '1', 1, 0, '2021-05-04 09:02:10');

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `bus_number` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 = inactive, 1 = active',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`id`, `name`, `bus_number`, `status`, `date_updated`) VALUES
(3, 'Economy', '5001', 1, '2021-05-11 13:15:21'),
(4, 'Economy', '5002', 1, '2021-04-30 23:11:53'),
(5, 'deluxe', '5003', 1, '2021-04-30 23:12:45'),
(6, 'luxury', '5004', 1, '2021-04-30 23:13:32'),
(7, 'luxury', '5005', 1, '2021-04-30 23:13:51');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(30) NOT NULL,
  `terminal_name` text NOT NULL,
  `city` varchar(250) NOT NULL,
  `state` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0= inactive , 1= active',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `terminal_name`, `city`, `state`, `status`, `date_updated`) VALUES
(1, 'chandni chowk', 'new delhi', 'new delhi', 1, '2021-04-30 23:15:31'),
(2, 'marine drive ', 'mumbai', 'Maharashtra', 1, '2021-04-30 23:16:28'),
(3, 'mp colony', 'bikaner', 'Rajasthan', 1, '2021-04-30 23:14:28'),
(4, 'civil line', 'allahabad', 'u.p.', 1, '2021-04-30 23:14:18'),
(5, 'Marina Beach', 'Chennai', 'Tamil Nadu', 1, '2021-04-30 23:51:56'),
(6, 'Hawa Mahal', 'jaipur', 'Rajasthan', 1, '2021-04-30 23:54:06');

-- --------------------------------------------------------

--
-- Table structure for table `schedule_list`
--

CREATE TABLE `schedule_list` (
  `id` int(30) NOT NULL,
  `bus_id` int(30) NOT NULL,
  `from_location` int(30) NOT NULL,
  `to_location` int(30) NOT NULL,
  `departure_time` datetime NOT NULL,
  `eta` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `availability` int(11) NOT NULL,
  `price` text NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedule_list`
--

INSERT INTO `schedule_list` (`id`, `bus_id`, `from_location`, `to_location`, `departure_time`, `eta`, `status`, `availability`, `price`, `date_updated`) VALUES
(6, 3, 1, 2, '2021-04-02 23:24:00', '2021-04-03 23:24:00', 1, 50, '500', '2021-04-30 17:55:06'),
(7, 4, 2, 1, '2021-05-01 23:49:00', '2021-05-03 23:49:00', 1, 50, '1700', '2021-04-30 18:19:51'),
(8, 5, 5, 6, '2021-05-12 23:54:00', '2021-05-14 23:54:00', 1, 70, '2000', '2021-04-30 18:24:50'),
(9, 6, 2, 4, '2021-05-10 23:55:00', '2021-05-11 23:55:00', 1, 50, '400', '2021-04-30 18:25:17'),
(10, 7, 3, 6, '2021-05-18 23:55:00', '2021-05-20 23:56:00', 1, 76, '500', '2021-04-30 18:26:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` varchar(150) NOT NULL,
  `user_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = admin, 2= employee , 3 = customer',
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT ' 0 = incative , 1 = active',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `user_type`, `username`, `password`, `status`, `date_updated`) VALUES
(1, 'Ticket Incharge', 1, 'admin', '123', 1, '2021-04-30 23:02:13'),
(3, 'Driver', 2, 'aditya', '123', 1, '2021-05-11 10:46:14'),
(5, 'Driver', 2, 'Rohit', '123', 1, '2021-05-04 11:09:36'),
(6, 'Ticket Incharge', 1, 'Rahul', '123', 1, '2021-05-04 08:52:02'),
(7, 'Conductor', 2, 'Pankaj', '123', 1, '2021-05-04 11:09:40'),
(8, 'Driver', 2, 'Aditya', '123', 1, '2021-05-04 11:09:44'),
(9, 'Passenger', 3, 'Khushi', '123', 1, '2021-05-04 11:09:48'),
(10, 'Passenger', 3, 'Nandini', '123', 1, '2021-05-04 11:10:20'),
(11, 'Passenger', 3, 'pass1', '123', 1, '2021-05-04 11:10:23'),
(12, 'Passenger', 3, 'pass2', '123', 1, '2021-05-04 11:10:26'),
(13, 'Passenger', 3, 'pass3', '123', 1, '2021-05-04 11:10:29'),
(14, 'Passenger', 3, 'pass4', '123', 1, '2021-05-04 11:10:40'),
(15, 'Passenger', 3, 'pass5', '123', 1, '2021-05-04 11:10:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booked`
--
ALTER TABLE `booked`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule_list`
--
ALTER TABLE `schedule_list`
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
-- AUTO_INCREMENT for table `booked`
--
ALTER TABLE `booked`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `bus`
--
ALTER TABLE `bus`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `schedule_list`
--
ALTER TABLE `schedule_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
