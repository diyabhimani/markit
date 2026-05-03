-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2026 at 02:17 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `markit`
--

-- --------------------------------------------------------

--
-- Table structure for table `diya_attendance`
--

CREATE TABLE `diya_attendance` (
  `id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `diya_attendance_records`
--

CREATE TABLE `diya_attendance_records` (
  `id` int(11) NOT NULL,
  `attendance_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `status` enum('present','absent') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `diya_classes`
--

CREATE TABLE `diya_classes` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `diya_students`
--

CREATE TABLE `diya_students` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `roll_no` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `diya_users`
--

CREATE TABLE `diya_users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `diya_attendance`
--
ALTER TABLE `diya_attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `diya_attendance_records`
--
ALTER TABLE `diya_attendance_records`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attendance_id` (`attendance_id`,`student_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `diya_classes`
--
ALTER TABLE `diya_classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diya_students`
--
ALTER TABLE `diya_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `diya_users`
--
ALTER TABLE `diya_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `diya_attendance`
--
ALTER TABLE `diya_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `diya_attendance_records`
--
ALTER TABLE `diya_attendance_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `diya_classes`
--
ALTER TABLE `diya_classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `diya_students`
--
ALTER TABLE `diya_students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `diya_users`
--
ALTER TABLE `diya_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `diya_attendance`
--
ALTER TABLE `diya_attendance`
  ADD CONSTRAINT `diya_attendance_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `diya_classes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `diya_attendance_records`
--
ALTER TABLE `diya_attendance_records`
  ADD CONSTRAINT `diya_attendance_records_ibfk_1` FOREIGN KEY (`attendance_id`) REFERENCES `diya_attendance` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `diya_attendance_records_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `diya_students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `diya_students`
--
ALTER TABLE `diya_students`
  ADD CONSTRAINT `diya_students_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `diya_classes` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
