-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 25, 2023 at 10:33 PM
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
-- Database: `cumulative_gpa`
--

-- --------------------------------------------------------

--
-- Table structure for table `appinfo`
--

CREATE TABLE `appinfo` (
  `id` int(11) NOT NULL,
  `appId` char(50) NOT NULL,
  `buildVersion` int(11) NOT NULL,
  `version` char(10) NOT NULL,
  `messageTitleEn` char(50) DEFAULT NULL,
  `messageTitleAr` char(50) DEFAULT NULL,
  `updateDialogMessageEN` varchar(1000) DEFAULT NULL,
  `updateDialogMessageAR` varchar(1000) DEFAULT NULL,
  `whenPressUpdate` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appinfo`
--

INSERT INTO `appinfo` (`id`, `appId`, `buildVersion`, `version`, `messageTitleEn`, `messageTitleAr`, `updateDialogMessageEN`, `updateDialogMessageAR`, `whenPressUpdate`) VALUES
(1, 'com.mre.cumulative', 7, '1.1.5', 'new app', 'تطبيق جديد', 'Please download the new application. This app is no longer supported. Additionally, the new application has many features, such as saving subjects in a database, simple sharing it with a link, and more features.', 'من فضلك انزل التطبيق الجديد، هذا التطبيق لم يعد مدعوم \r\nكما ان التطبيق الجديد به العديد من المزايا كحفظ المواد في قاعدة بيانات ومشاركة ماتريده بالرابط وغيره ', 'golink');

-- --------------------------------------------------------

--
-- Table structure for table `shared_subjects`
--

CREATE TABLE `shared_subjects` (
  `subject_id` int(11) NOT NULL,
  `remote_id` int(11) DEFAULT NULL,
  `subject_user` int(11) NOT NULL,
  `fromUser` char(255) NOT NULL,
  `subject_nameEn` char(35) NOT NULL,
  `subject_nameAr` char(35) DEFAULT NULL,
  `subject_note` text DEFAULT NULL,
  `subject_myMidDegree` float DEFAULT NULL,
  `subject_myYearWorkDegree` float DEFAULT NULL,
  `subject_myPracticalDegree` float DEFAULT NULL,
  `subject_myFinalDegree` float DEFAULT NULL,
  `subject_maxMidDegree` float DEFAULT NULL,
  `subject_maxYearWorkDegree` float DEFAULT NULL,
  `subject_maxPracticalDegree` float DEFAULT NULL,
  `subject_maxFinalDegree` float DEFAULT NULL,
  `subject_degree` float NOT NULL,
  `subject_maxDegree` float NOT NULL,
  `subject_gpa` float DEFAULT NULL,
  `subject_hours` int(11) NOT NULL,
  `subject_isCalculated` tinyint(4) NOT NULL DEFAULT 1,
  `subject_semester` int(11) NOT NULL,
  `subject_year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `subject_id` int(11) NOT NULL,
  `remote_id` int(11) DEFAULT NULL,
  `subject_user` int(11) NOT NULL,
  `subject_nameEn` char(35) NOT NULL,
  `subject_nameAr` char(35) DEFAULT NULL,
  `subject_note` text DEFAULT NULL,
  `subject_myMidDegree` float DEFAULT NULL,
  `subject_myYearWorkDegree` float DEFAULT NULL,
  `subject_myPracticalDegree` float DEFAULT NULL,
  `subject_myFinalDegree` float DEFAULT NULL,
  `subject_maxMidDegree` float DEFAULT NULL,
  `subject_maxYearWorkDegree` float DEFAULT NULL,
  `subject_maxPracticalDegree` float DEFAULT NULL,
  `subject_maxFinalDegree` float DEFAULT NULL,
  `subject_degree` float NOT NULL,
  `subject_maxDegree` float NOT NULL,
  `subject_gpa` float DEFAULT NULL,
  `subject_hours` int(11) NOT NULL,
  `subject_isCalculated` tinyint(4) NOT NULL DEFAULT 1,
  `subject_lastEdit` datetime DEFAULT NULL,
  `subject_semester` int(11) NOT NULL,
  `subject_year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `first_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `last_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_image` varchar(255) DEFAULT NULL,
  `verified_code` int(11) DEFAULT NULL,
  `is_verified` tinyint(4) NOT NULL DEFAULT 0,
  `user_create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `last_login` datetime DEFAULT NULL,
  `user_sharedId` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appinfo`
--
ALTER TABLE `appinfo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `app_id` (`appId`);

--
-- Indexes for table `shared_subjects`
--
ALTER TABLE `shared_subjects`
  ADD PRIMARY KEY (`subject_id`),
  ADD UNIQUE KEY `remote_id` (`remote_id`),
  ADD KEY `subject_user` (`subject_user`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subject_id`),
  ADD UNIQUE KEY `remote_id` (`remote_id`),
  ADD KEY `subject_user` (`subject_user`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `user_sharedId` (`user_sharedId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appinfo`
--
ALTER TABLE `appinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shared_subjects`
--
ALTER TABLE `shared_subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `shared_subjects`
--
ALTER TABLE `shared_subjects`
  ADD CONSTRAINT `shared_subjects_ibfk_1` FOREIGN KEY (`subject_user`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`subject_user`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
