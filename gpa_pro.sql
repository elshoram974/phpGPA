-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 29, 2023 at 10:37 PM
-- Server version: 5.7.42-cll-lve
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gpa_pro`
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
  `whenPressUpdate` varchar(1000) DEFAULT NULL,
  `shouldUpdate` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appinfo`
--

INSERT INTO `appinfo` (`id`, `appId`, `buildVersion`, `version`, `messageTitleEn`, `messageTitleAr`, `updateDialogMessageEN`, `updateDialogMessageAR`, `whenPressUpdate`, `shouldUpdate`) VALUES
(1, 'com.mre.cumulative', 7, '1.1.5', 'new app', 'تطبيق جديد', 'Please download the new application. This app is no longer supported. Additionally, the new application has many features, such as saving subjects in a database, simple sharing it with a link, and more features.', 'من فضلك انزل التطبيق الجديد، هذا التطبيق لم يعد مدعوم \r\nكما ان التطبيق الجديد به العديد من المزايا كحفظ المواد في قاعدة بيانات ومشاركة ماتريده بالرابط وغيره ', 'golink', 0),
(2, 'com.mrecode.gpapro', 1, '1.0.0', NULL, NULL, NULL, NULL, NULL, 0);

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
  `subject_note` text,
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
  `subject_isCalculated` tinyint(4) NOT NULL DEFAULT '1',
  `subject_semester` int(11) NOT NULL,
  `subject_year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shared_subjects`
--

INSERT INTO `shared_subjects` (`subject_id`, `remote_id`, `subject_user`, `fromUser`, `subject_nameEn`, `subject_nameAr`, `subject_note`, `subject_myMidDegree`, `subject_myYearWorkDegree`, `subject_myPracticalDegree`, `subject_myFinalDegree`, `subject_maxMidDegree`, `subject_maxYearWorkDegree`, `subject_maxPracticalDegree`, `subject_maxFinalDegree`, `subject_degree`, `subject_maxDegree`, `subject_gpa`, `subject_hours`, `subject_isCalculated`, `subject_semester`, `subject_year`) VALUES
(252, 83, 42, '8588913772', 'eag', 'SAewf', NULL, 0, 1, 0, 0, 0, 0, 0, 0, 75, 100, 1, 5, 1, 0, 0);

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
  `subject_note` text,
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
  `subject_isCalculated` tinyint(4) NOT NULL DEFAULT '1',
  `subject_lastEdit` datetime DEFAULT NULL,
  `subject_semester` int(11) NOT NULL,
  `subject_year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subject_id`, `remote_id`, `subject_user`, `subject_nameEn`, `subject_nameAr`, `subject_note`, `subject_myMidDegree`, `subject_myYearWorkDegree`, `subject_myPracticalDegree`, `subject_myFinalDegree`, `subject_maxMidDegree`, `subject_maxYearWorkDegree`, `subject_maxPracticalDegree`, `subject_maxFinalDegree`, `subject_degree`, `subject_maxDegree`, `subject_gpa`, `subject_hours`, `subject_isCalculated`, `subject_lastEdit`, `subject_semester`, `subject_year`) VALUES
(83, 83, 42, 'eag', 'SAewf', NULL, 0, 1, 0, 0, 0, 0, 0, 0, 75, 100, 1, 5, 1, NULL, 0, 0);

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
  `is_verified` tinyint(4) NOT NULL DEFAULT '0',
  `user_create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` datetime DEFAULT NULL,
  `user_sharedId` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `first_name`, `last_name`, `password`, `user_image`, `verified_code`, `is_verified`, `user_create_at`, `last_login`, `user_sharedId`) VALUES
(42, 'elshoram974@gmail.com', 'mohammed', 'elshora', 'f7a9e24777ec23212c54d7a350bc5bea5477fdbb', NULL, NULL, 1, '2023-08-29 21:58:30', NULL, '8588913772');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shared_subjects`
--
ALTER TABLE `shared_subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

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
