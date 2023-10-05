-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 05, 2023 at 02:49 AM
-- Server version: 5.7.43-cll-lve
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
  `appleStoreId` varchar(50) DEFAULT NULL,
  `microsoftStoreId` varchar(50) DEFAULT NULL,
  `buildVersion` int(11) NOT NULL,
  `version` char(10) NOT NULL,
  `messageTitleEn` char(50) NOT NULL,
  `messageTitleAr` char(50) NOT NULL,
  `updateDialogMessageEN` varchar(255) NOT NULL,
  `updateDialogMessageAR` varchar(255) NOT NULL,
  `whenPressUpdateAndroid` varchar(255) DEFAULT NULL,
  `whenPressUpdateIos` varchar(255) DEFAULT NULL,
  `whenPressUpdateWindows` varchar(255) DEFAULT NULL,
  `whenPressUpdateMac` varchar(255) DEFAULT NULL,
  `whenPressUpdateLinux` varchar(255) DEFAULT NULL,
  `whenPressUpdateWeb` varchar(255) DEFAULT NULL,
  `shouldUpdateOnly` tinyint(1) NOT NULL DEFAULT '0',
  `privacyPolicyLink` varchar(255) DEFAULT NULL,
  `appLegalese` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `appinfo`
--

INSERT INTO `appinfo` (`id`, `appId`, `appleStoreId`, `microsoftStoreId`, `buildVersion`, `version`, `messageTitleEn`, `messageTitleAr`, `updateDialogMessageEN`, `updateDialogMessageAR`, `whenPressUpdateAndroid`, `whenPressUpdateIos`, `whenPressUpdateWindows`, `whenPressUpdateMac`, `whenPressUpdateLinux`, `whenPressUpdateWeb`, `shouldUpdateOnly`, `privacyPolicyLink`, `appLegalese`) VALUES
(1, 'com.mre.cumulative', NULL, NULL, 10, '1.2.6', 'New app', 'تطبيق جديد', 'Please download the new application. This app is no longer supported. Additionally, the new application has many features, such as saving subjects in a database, simple sharing it with a link, and more features.', 'من فضلك انزل التطبيق الجديد، هذا التطبيق لم يعد مدعوم \r\nكما ان التطبيق الجديد به العديد من المزايا كحفظ المواد في قاعدة بيانات ومشاركة ماتريده بالرابط وغيره ', 'https://play.google.com/store/apps/details?id=com.mrecode.gpapro', NULL, 'https://drive.google.com/drive/folders/18z72L4daYRQQFNVRsh_5WdhcoPIrepLe?usp=drive_link', NULL, NULL, NULL, 0, NULL, NULL),
(2, 'com.mrecode.gpapro', NULL, NULL, 3, '1.0.2', 'New update', 'تحديث جديد', 'Please download the new update. It\'s added shareing subjects and deleting subjects via the link has been added The update request dialog has been modified Done editing when the realized hours were deleted or modified  And other things...', 'برجاء تنزيل التحديث الجديد.\r\nتمت إضافة مشاركة المواد وحذفها عبر الرابط\r\nتم تعديل نافذة طلب التحديث\r\nتم التعديل عند حذف الساعات المحققة او التعديل عليها\r\nوأشياء غيرهم ايضا...', 'https://play.google.com/store/apps/details?id=com.mrecode.gpapro', NULL, 'https://drive.google.com/drive/folders/18z72L4daYRQQFNVRsh_5WdhcoPIrepLe?usp=drive_link', NULL, NULL, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shared_subjects`
--

CREATE TABLE `shared_subjects` (
  `subject_id` int(11) NOT NULL,
  `remote_id` int(11) DEFAULT NULL,
  `subject_user` int(11) DEFAULT NULL,
  `fromUser` char(255) DEFAULT NULL,
  `subject_nameEn` char(35) DEFAULT NULL,
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
  `subject_degree` float DEFAULT NULL,
  `subject_maxDegree` float DEFAULT NULL,
  `subject_gpa` float DEFAULT NULL,
  `subject_hours` int(11) DEFAULT NULL,
  `subject_isCalculated` tinyint(4) NOT NULL DEFAULT '1',
  `subject_semester` char(35) DEFAULT NULL,
  `subject_year` char(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shared_subjects`
--

INSERT INTO `shared_subjects` (`subject_id`, `remote_id`, `subject_user`, `fromUser`, `subject_nameEn`, `subject_nameAr`, `subject_note`, `subject_myMidDegree`, `subject_myYearWorkDegree`, `subject_myPracticalDegree`, `subject_myFinalDegree`, `subject_maxMidDegree`, `subject_maxYearWorkDegree`, `subject_maxPracticalDegree`, `subject_maxFinalDegree`, `subject_degree`, `subject_maxDegree`, `subject_gpa`, `subject_hours`, `subject_isCalculated`, `subject_semester`, `subject_year`) VALUES
(1, 1, 2, '0000000000', 'Electronics Engineering', 'هندسة إلكترونيات', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 3, 1, 'first_semester', 'third_year'),
(2, 2, 2, '0000000000', 'Data Structure', 'هياكل البيانات', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 3, 1, 'first_semester', 'third_year'),
(3, 3, 2, '0000000000', 'Automatic Control', 'تحكم آلي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 3, 1, 'first_semester', 'third_year'),
(4, 4, 2, '0000000000', 'Computer organization, architecture', 'تنظيم وبنية الحاسب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 3, 1, 'first_semester', 'third_year'),
(5, 5, 2, '0000000000', 'Microprocessors', 'معالجات دقيقة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 3, 1, 'second_semester', 'second_year'),
(6, 6, 2, '0000000000', 'Electronic Device', 'نبائط إلكترونية', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 3, 1, 'second_semester', 'second_year'),
(7, 7, 2, '0000000000', 'Signal Analysis', 'تحليل اشارات', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 3, 1, 'second_semester', 'second_year'),
(8, 8, 2, '0000000000', 'Modeling And Simulation', 'نمذجة ومحاكاة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 3, 1, 'second_semester', 'second_year'),
(9, 9, 2, '0000000000', 'مبادئ هندسة التصميم والتصنيع', 'مبادئ هندسة التصميم والتصنيع', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 2, 1, 'second_semester', 'second_year'),
(10, 10, 2, '0000000000', 'التذوق الأدبي', 'التذوق الأدبي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 2, 1, 'second_semester', 'second_year'),
(11, 11, 2, '0000000000', 'تدريب  ميداني 1', 'تدريب  ميداني 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 1, 1, 'second_semester', 'second_year'),
(12, 12, 2, '0000000000', 'Maths 2', 'رياضيات ٢', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 3, 1, 'second_semester', 'preparatory_year'),
(13, 13, 2, '0000000000', 'Physics 2', 'فيزياء ٢', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 3, 1, 'second_semester', 'preparatory_year'),
(14, 14, 2, '0000000000', 'English 2', 'انجليزي ٢', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 2, 1, 'second_semester', 'preparatory_year'),
(15, 15, 2, '0000000000', 'الرسم الهندسي والإسقاط', 'الرسم الهندسي والإسقاط', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 3, 1, 'second_semester', 'preparatory_year'),
(16, 16, 2, '0000000000', 'Mechanics', 'الميكانيكا الهندسية', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 4, 1, 'second_semester', 'preparatory_year'),
(17, 17, 2, '0000000000', 'مقدمة في تاريخ الحضارات', 'مقدمة في تاريخ الحضارات', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 2, 1, 'second_semester', 'preparatory_year'),
(18, 18, 2, '0000000000', 'AI And It.s Applications', 'الذكاء الاصطناعي وتطبيقاته', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 3, 1, 'second_semester', 'fourth_year'),
(19, 19, 2, '0000000000', 'Embedded Systems', 'الانظمة المدمجة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 3, 1, 'second_semester', 'fourth_year'),
(20, 20, 2, '0000000000', 'Advanced Programming Methods', 'أساليب البرمجة المتقدمة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 3, 1, 'second_semester', 'fourth_year'),
(21, 21, 2, '0000000000', 'Mobile Communications', 'إتصالات المتحركات', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 3, 1, 'second_semester', 'fourth_year'),
(22, 22, 2, '0000000000', 'Project 2', 'مشروع ٢', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 4, 1, 'second_semester', 'fourth_year'),
(23, 23, 2, '0000000000', 'مهارات البحث والتحليل', 'مهارات البحث والتحليل', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 2, 1, 'first_semester', 'fourth_year'),
(24, 24, 2, '0000000000', 'إدارة مشروعات', 'إدارة مشروعات', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 2, 1, 'first_semester', 'fourth_year'),
(25, 25, 2, '0000000000', 'أخلاقيات المهنة', 'أخلاقيات المهنة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 1, 1, 'first_semester', 'fourth_year'),
(26, 26, 2, '0000000000', 'Software Engineering', 'هندسة البرمجيات', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 3, 1, 'first_semester', 'fourth_year'),
(27, 27, 2, '0000000000', 'Digital Communication System', 'نظم الاتصالات الرقمية', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 3, 1, 'first_semester', 'fourth_year'),
(28, 28, 2, '0000000000', 'Operating Systems', 'نظم التشغيل', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 3, 1, 'first_semester', 'fourth_year'),
(29, 29, 2, '0000000000', 'Project 1', 'مشروع ١', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 2, 1, 'first_semester', 'fourth_year'),
(30, 30, 2, '0000000000', 'Maths 1', 'رياضيات ١', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 3, 1, 'first_semester', 'preparatory_year'),
(31, 31, 2, '0000000000', 'Physics 1', 'فيزياء ١', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 3, 1, 'first_semester', 'preparatory_year'),
(32, 32, 2, '0000000000', 'Chemistry', 'كيمياء هندسية', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 3, 1, 'first_semester', 'preparatory_year'),
(33, 33, 2, '0000000000', 'مبادئ هندسة التصنيع', 'مبادئ هندسة التصنيع', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 2, 1, 'first_semester', 'preparatory_year'),
(34, 34, 2, '0000000000', 'تاريخ الهندسة', 'تاريخ الهندسة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 1, 1, 'first_semester', 'preparatory_year'),
(35, 35, 2, '0000000000', 'اللغة العربية', 'اللغة العربية', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 2, 1, 'first_semester', 'preparatory_year'),
(36, 36, 2, '0000000000', 'English 1', 'انجليزي ١', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 2, 1, 'first_semester', 'preparatory_year'),
(37, 37, 2, '0000000000', 'حقوق الانسان', 'حقوق الانسان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 1, 1, 'first_semester', 'preparatory_year'),
(38, 38, 2, '0000000000', 'Computer', 'حاسب الي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 0, 1, 'first_semester', 'preparatory_year'),
(39, 39, 2, '0000000000', 'Maths 4', 'رياضيات ٤', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 3, 1, 'second_semester', 'first_year'),
(40, 40, 2, '0000000000', 'Electromagnetic Fields', 'مجالات كهرومغناطيسية', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 3, 1, 'second_semester', 'first_year'),
(41, 41, 2, '0000000000', 'Circuit 2', 'دوائر كهربية ٢', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 2, 1, 'second_semester', 'first_year'),
(42, 42, 2, '0000000000', 'Energy Conversion', 'تحويل الطاقة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 3, 1, 'second_semester', 'first_year'),
(43, 43, 2, '0000000000', 'مبادئ هندسة التشييد والبناء', 'مبادئ هندسة التشييد والبناء', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 2, 1, 'second_semester', 'first_year'),
(44, 44, 2, '0000000000', 'مهارات اتصال وعرض', 'مهارات اتصال وعرض', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 2, 1, 'second_semester', 'first_year'),
(45, 45, 2, '0000000000', 'حضارة عربية وإسلامية', 'حضارة عربية وإسلامية', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 2, 1, 'second_semester', 'first_year'),
(46, 46, 2, '0000000000', 'قوى ميكانيكية', 'قوى ميكانيكية', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 2, 1, 'first_semester', 'first_year'),
(47, 47, 2, '0000000000', 'Maths 3', 'رياضيات ٣', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 3, 1, 'first_semester', 'first_year'),
(48, 48, 2, '0000000000', 'Electrical Circuit 1', 'دوائر كهربية ١', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 2, 1, 'first_semester', 'first_year'),
(49, 49, 2, '0000000000', 'Electrical Measurements', 'قياسات كهربية', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 3, 1, 'first_semester', 'first_year'),
(50, 50, 2, '0000000000', 'Electrical Materials', 'مواد كهربية', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 3, 1, 'first_semester', 'first_year'),
(51, 51, 2, '0000000000', 'إعداد التقارير', 'إعداد التقارير', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 2, 1, 'first_semester', 'first_year'),
(52, 52, 2, '0000000000', 'تاريخ مصر الحديث', 'تاريخ مصر الحديث', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 2, 1, 'first_semester', 'second_year'),
(53, 53, 2, '0000000000', 'نظم المراقبة وضبط الجودة', 'نظم المراقبة وضبط الجودة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 1, 1, 'first_semester', 'second_year'),
(54, 54, 2, '0000000000', 'Maths 5', 'رياضيات 5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 3, 1, 'first_semester', 'second_year'),
(55, 55, 2, '0000000000', 'Computer Programming', 'برمجة الحاسب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 3, 1, 'first_semester', 'second_year'),
(56, 56, 2, '0000000000', 'Logic Circuits', 'دوائر رقمية ومنطقية', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 3, 1, 'first_semester', 'second_year'),
(57, 57, 2, '0000000000', 'إحصاء ونظرية الاحتمالات', 'إحصاء ونظرية الاحتمالات', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 3, 1, 'first_semester', 'second_year'),
(58, 58, 2, '0000000000', 'Electrical Machine', 'آلات ومحولات كهربية', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 3, 1, 'first_semester', 'second_year'),
(59, 59, 2, '0000000000', 'إقتصاد هندسي', 'إقتصاد هندسي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 2, 1, 'second_semester', 'third_year'),
(60, 60, 2, '0000000000', 'مبادىء التفاوض', 'مبادىء التفاوض', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 2, 1, 'second_semester', 'third_year'),
(61, 61, 2, '0000000000', 'Computer Networks', 'شبكات الحاسب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 3, 1, 'second_semester', 'third_year'),
(62, 62, 2, '0000000000', 'Electrical Power', 'قوى كهربية', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 3, 1, 'second_semester', 'third_year'),
(63, 63, 2, '0000000000', 'Electrical Communications', 'إتصالات كهربية', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 3, 1, 'second_semester', 'third_year'),
(64, 64, 2, '0000000000', 'Power Electronics', 'الكترونيات القدرة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 3, 1, 'second_semester', 'third_year'),
(65, 65, 2, '0000000000', 'تدريب ميداني 2', 'تدريب ميداني 2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 1, 1, 'second_semester', 'third_year'),
(66, 66, 2, '0000000000', 'إدارة أعمال', 'إدارة أعمال', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 2, 1, 'first_semester', 'third_year'),
(67, 67, 2, '0000000000', 'أثر بيئي', 'أثر بيئي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.9, 100, NULL, 1, 1, 'first_semester', 'third_year');

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
  `subject_semester` char(35) NOT NULL,
  `subject_year` char(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subject_id`, `remote_id`, `subject_user`, `subject_nameEn`, `subject_nameAr`, `subject_note`, `subject_myMidDegree`, `subject_myYearWorkDegree`, `subject_myPracticalDegree`, `subject_myFinalDegree`, `subject_maxMidDegree`, `subject_maxYearWorkDegree`, `subject_maxPracticalDegree`, `subject_maxFinalDegree`, `subject_degree`, `subject_maxDegree`, `subject_gpa`, `subject_hours`, `subject_isCalculated`, `subject_lastEdit`, `subject_semester`, `subject_year`) VALUES
(1, 1, 3, 'Microprocessors', 'معالجات دقيقة', NULL, 20, 20, 10, 50, 20, 20, 10, 50, 100, 100, NULL, 3, 1, NULL, 'second_semester', 'second_year'),
(2, 2, 3, 'Electronic Device', 'نبائط إلكترونية', NULL, 20, 20, NULL, 47, 20, 20, NULL, 60, 87, 100, NULL, 3, 1, NULL, 'second_semester', 'second_year'),
(3, 3, 3, 'Signal Analysis', 'تحليل اشارات', NULL, 20, 20, 9, 50, 20, 20, 10, 50, 99, 100, NULL, 3, 1, NULL, 'second_semester', 'second_year'),
(4, 4, 3, 'Modeling And Simulation', 'نمذجة ومحاكاة', NULL, 12, 20, 8, 44, 20, 20, 10, 50, 84, 100, NULL, 3, 1, NULL, 'second_semester', 'second_year'),
(5, 5, 3, 'مبادئ هندسة التصميم والتصنيع', 'مبادئ هندسة التصميم والتصنيع', NULL, 20, 20, NULL, 53, 20, 20, NULL, 60, 93, 100, NULL, 2, 1, NULL, 'second_semester', 'second_year'),
(6, 6, 3, 'التذوق الأدبي', 'التذوق الأدبي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 78, 100, NULL, 2, 1, NULL, 'second_semester', 'second_year'),
(7, 7, 3, 'تدريب  ميداني 1', 'تدريب  ميداني 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98, 100, NULL, 1, 0, NULL, 'second_semester', 'second_year'),
(8, 8, 3, 'Maths 2', 'رياضيات ٢', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 97, 100, NULL, 3, 0, NULL, 'second_semester', 'preparatory_year'),
(9, 9, 3, 'Physics 2', 'فيزياء ٢', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 97, 100, NULL, 3, 0, NULL, 'second_semester', 'preparatory_year'),
(10, 10, 3, 'English 2', 'انجليزي ٢', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 97, 100, NULL, 2, 0, NULL, 'second_semester', 'preparatory_year'),
(11, 11, 3, 'الرسم الهندسي والإسقاط', 'الرسم الهندسي والإسقاط', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 97, 100, NULL, 3, 0, NULL, 'second_semester', 'preparatory_year'),
(12, 12, 3, 'Mechanics', 'الميكانيكا الهندسية', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 97, 100, NULL, 4, 0, NULL, 'second_semester', 'preparatory_year'),
(13, 13, 3, 'مقدمة في تاريخ الحضارات', 'مقدمة في تاريخ الحضارات', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 97, 100, NULL, 2, 0, NULL, 'second_semester', 'preparatory_year'),
(14, 14, 3, 'AI And It.s Applications', 'الذكاء الاصطناعي وتطبيقاته', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93, 100, NULL, 3, 0, NULL, 'second_semester', 'fourth_year'),
(15, 15, 3, 'Embedded Systems', 'الانظمة المدمجة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93, 100, NULL, 3, 0, NULL, 'second_semester', 'fourth_year'),
(16, 16, 3, 'Advanced Programming Methods', 'أساليب البرمجة المتقدمة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93, 100, NULL, 3, 0, NULL, 'second_semester', 'fourth_year'),
(17, 17, 3, 'Mobile Communications', 'إتصالات المتحركات', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93, 100, NULL, 3, 0, NULL, 'second_semester', 'fourth_year'),
(18, 18, 3, 'Project 2', 'مشروع ٢', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93, 100, NULL, 4, 0, NULL, 'second_semester', 'fourth_year'),
(19, 19, 3, 'حضارة عربية وإسلامية', 'حضارة عربية وإسلامية', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 76, 100, NULL, 2, 1, NULL, 'summer_semester', 'first_year'),
(20, 20, 3, 'Maths 4', 'رياضيات ٤', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, 100, NULL, 3, 1, NULL, 'second_semester', 'first_year'),
(21, 21, 3, 'Electromagnetic Fields', 'مجالات كهرومغناطيسية', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99, 100, NULL, 3, 1, NULL, 'second_semester', 'first_year'),
(22, 22, 3, 'Circuit 2', 'دوائر كهربية ٢', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98, 100, NULL, 2, 1, NULL, 'second_semester', 'first_year'),
(23, 23, 3, 'Energy Conversion', 'تحويل الطاقة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 86, 100, NULL, 3, 1, NULL, 'second_semester', 'first_year'),
(24, 24, 3, 'مبادئ هندسة التشييد والبناء', 'مبادئ هندسة التشييد والبناء', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95, 100, NULL, 2, 1, NULL, 'second_semester', 'first_year'),
(25, 25, 3, 'مهارات اتصال وعرض', 'مهارات اتصال وعرض', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 89, 100, NULL, 2, 1, NULL, 'second_semester', 'first_year'),
(26, 26, 3, 'حضارة عربية وإسلامية', 'حضارة عربية وإسلامية', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 64, 100, NULL, 2, 0, NULL, 'second_semester', 'first_year'),
(27, 27, 3, 'تاريخ مصر الحديث', 'تاريخ مصر الحديث', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 68, 100, NULL, 2, 1, NULL, 'first_semester', 'second_year'),
(28, 28, 3, 'نظم المراقبة وضبط الجودة', 'نظم المراقبة وضبط الجودة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88, 100, NULL, 1, 1, NULL, 'first_semester', 'second_year'),
(29, 29, 3, 'Maths 5', 'رياضيات 5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95, 100, NULL, 3, 1, NULL, 'first_semester', 'second_year'),
(30, 30, 3, 'Computer Programming', 'برمجة الحاسب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 84, 100, NULL, 3, 1, NULL, 'first_semester', 'second_year'),
(31, 31, 3, 'Logic Circuits', 'دوائر رقمية ومنطقية', NULL, 20, 20, 9, 50, 20, 20, 10, 50, 99, 100, NULL, 3, 1, NULL, 'first_semester', 'second_year'),
(32, 32, 3, 'إحصاء ونظرية الاحتمالات', 'إحصاء ونظرية الاحتمالات', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, 100, NULL, 3, 1, NULL, 'first_semester', 'second_year'),
(33, 33, 3, 'Electrical Machine', 'آلات ومحولات كهربية', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 92, 100, NULL, 3, 1, NULL, 'first_semester', 'second_year'),
(34, 34, 3, 'إقتصاد هندسي', 'إقتصاد هندسي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 91, 100, NULL, 2, 1, NULL, 'second_semester', 'third_year'),
(35, 35, 3, 'مبادىء التفاوض', 'مبادىء التفاوض', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 66, 100, NULL, 2, 1, NULL, 'second_semester', 'third_year'),
(36, 36, 3, 'Computer Networks', 'شبكات الحاسب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 89, 100, NULL, 3, 1, NULL, 'second_semester', 'third_year'),
(37, 37, 3, 'Electrical Power', 'قوى كهربية', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 82, 100, NULL, 3, 1, NULL, 'second_semester', 'third_year'),
(38, 38, 3, 'Electrical Communications', 'إتصالات كهربية', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 96, 100, NULL, 3, 1, NULL, 'second_semester', 'third_year'),
(39, 39, 3, 'Power Electronics', 'الكترونيات القدرة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 92, 100, NULL, 3, 1, NULL, 'second_semester', 'third_year'),
(40, 40, 3, 'تدريب ميداني 2', 'تدريب ميداني 2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, 50, 97, 100, NULL, 1, 0, NULL, 'second_semester', 'third_year'),
(41, 41, 3, 'إدارة مشروعات', 'إدارة مشروعات', NULL, 16, 18, NULL, 46, 20, 20, NULL, 60, 80, 100, NULL, 2, 1, NULL, 'summer_semester', 'third_year'),
(42, 42, 3, 'مهارات البحث والتحليل', 'مهارات البحث والتحليل', NULL, 19, 17, NULL, 38, 20, 20, NULL, 60, 74, 100, NULL, 2, 1, NULL, 'summer_semester', 'third_year'),
(43, 43, 3, 'تدريب  ميداني 1', 'تدريب  ميداني 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98, 100, NULL, 1, 1, NULL, 'first_semester', 'third_year'),
(44, 44, 3, 'Electronics Engineering', 'هندسة إلكترونيات', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 96, 100, NULL, 3, 1, NULL, 'first_semester', 'third_year'),
(45, 45, 3, 'Data Structure', 'هياكل البيانات', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93, 100, NULL, 3, 1, NULL, 'first_semester', 'third_year'),
(46, 46, 3, 'Automatic Control', 'تحكم آلي', NULL, 20, 19, NULL, 60, 20, 20, NULL, 60, 99, 100, NULL, 3, 1, NULL, 'first_semester', 'third_year'),
(47, 47, 3, 'Computer organization, architecture', 'تنظيم وبنية الحاسب', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88, 100, NULL, 3, 1, NULL, 'first_semester', 'third_year'),
(48, 48, 3, 'إدارة أعمال', 'إدارة أعمال', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 66, 100, NULL, 2, 1, NULL, 'first_semester', 'third_year'),
(49, 49, 3, 'أثر بيئي', 'أثر بيئي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 64, 100, NULL, 1, 1, NULL, 'first_semester', 'third_year'),
(50, 50, 3, 'تدريب ميداني 2', 'تدريب ميداني 2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, 50, 99, 100, NULL, 1, 1, NULL, 'first_semester', 'fourth_year'),
(51, 51, 3, 'مهارات البحث والتحليل', 'مهارات البحث والتحليل', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 97, 100, NULL, 2, 0, NULL, 'first_semester', 'fourth_year'),
(52, 52, 3, 'إدارة مشروعات', 'إدارة مشروعات', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93, 100, NULL, 2, 0, NULL, 'first_semester', 'fourth_year'),
(53, 53, 3, 'أخلاقيات المهنة', 'أخلاقيات المهنة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93, 100, NULL, 1, 0, NULL, 'first_semester', 'fourth_year'),
(54, 54, 3, 'Software Engineering', 'هندسة البرمجيات', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 97, 100, NULL, 3, 0, NULL, 'first_semester', 'fourth_year'),
(55, 55, 3, 'Digital Communication System', 'نظم الاتصالات الرقمية', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93, 100, NULL, 3, 0, NULL, 'first_semester', 'fourth_year'),
(56, 56, 3, 'Operating Systems', 'نظم التشغيل', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93, 100, NULL, 3, 0, NULL, 'first_semester', 'fourth_year'),
(57, 57, 3, 'Project 1', 'مشروع ١', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93, 100, NULL, 2, 0, NULL, 'first_semester', 'fourth_year'),
(58, 58, 3, 'Maths 1', 'رياضيات ١', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98, 100, NULL, 3, 1, NULL, 'first_semester', 'preparatory_year'),
(59, 59, 3, 'Physics 1', 'فيزياء ١', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 92, 100, NULL, 3, 1, NULL, 'first_semester', 'preparatory_year'),
(60, 60, 3, 'Chemistry', 'كيمياء هندسية', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 81, 100, NULL, 3, 1, NULL, 'first_semester', 'preparatory_year'),
(61, 61, 3, 'مبادئ هندسة التصنيع', 'مبادئ هندسة التصنيع', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 86, 100, NULL, 2, 1, NULL, 'first_semester', 'preparatory_year'),
(62, 62, 3, 'تاريخ الهندسة', 'تاريخ الهندسة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 68, 100, NULL, 1, 1, NULL, 'first_semester', 'preparatory_year'),
(63, 63, 3, 'اللغة العربية', 'اللغة العربية', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70, 100, NULL, 2, 1, NULL, 'first_semester', 'preparatory_year'),
(64, 64, 3, 'English 1', 'انجليزي ١', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 96, 100, NULL, 2, 1, NULL, 'first_semester', 'preparatory_year'),
(65, 65, 3, 'حقوق الانسان', 'حقوق الانسان', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 76, 100, NULL, 1, 1, NULL, 'first_semester', 'preparatory_year'),
(66, 66, 3, 'Computer', 'حاسب الي', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 100, NULL, 0, 0, NULL, 'first_semester', 'preparatory_year'),
(67, 67, 3, 'قوى ميكانيكية', 'قوى ميكانيكية', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 89, 100, NULL, 2, 1, NULL, 'first_semester', 'first_year'),
(68, 68, 3, 'Maths 3', 'رياضيات ٣', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, 100, NULL, 3, 1, NULL, 'first_semester', 'first_year'),
(69, 69, 3, 'Electrical Circuit 1', 'دوائر كهربية ١', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 85, 100, NULL, 2, 1, NULL, 'first_semester', 'first_year'),
(70, 70, 3, 'Electrical Measurements', 'قياسات كهربية', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93, 100, NULL, 3, 1, NULL, 'first_semester', 'first_year'),
(71, 71, 3, 'Electrical Materials', 'مواد كهربية', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90, 100, NULL, 3, 1, NULL, 'first_semester', 'first_year'),
(72, 72, 3, 'إعداد التقارير', 'إعداد التقارير', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 74, 100, NULL, 2, 1, NULL, 'first_semester', 'first_year');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_image` varchar(255) DEFAULT NULL,
  `verified_code` int(11) DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `user_create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` datetime DEFAULT NULL,
  `user_sharedId` char(255) DEFAULT NULL,
  `approved_ads` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `first_name`, `last_name`, `password`, `user_image`, `verified_code`, `is_verified`, `user_create_at`, `last_login`, `user_sharedId`, `approved_ads`) VALUES
(1, 'info@mrecode.com', 'MRE', '', '7c222fb2927d828af22f592134e8932480637c0d', NULL, 320783, 1, '2023-09-28 13:02:39', '2023-10-05 02:44:44', NULL, 1),
(2, 'thiet@mrecode.com', 'MRE', 'THIET', '7c222fb2927d828af22f592134e8932480637c0d', NULL, NULL, 1, '2023-09-28 13:02:39', '2023-10-01 17:37:01', '0000000000', 1),
(3, 'elshoram974@gmail.com', 'Mohammed', 'El Shora', 'b63bcc63e3a76dddcc286c391485b76cd484ecb8', 'elshoram974@gmail.com.jpg', NULL, 1, '2023-09-28 14:22:03', '2023-10-05 02:45:42', NULL, 0),
(4, 'aglal4245@gmail.com', 'Ali', 'Elshora', 'c9e069f413015437dab1a66befe03cd70fbd06ad', 'aglal4245@gmail.com.jpg', NULL, 1, '2023-09-29 11:24:52', '2023-09-30 13:34:22', NULL, 1),
(7, 'totaishoney@gmail.com', 'فاطمة', 'رياض', 'aa0803cb72471eb471e72ec902927aac101468fe', 'totaishoney@gmail.com.jpg', NULL, 1, '2023-10-01 02:20:24', '2023-10-02 16:16:13', NULL, 1),
(8, 'ahmed.hazem708@gmail.com', 'Ahmed', 'Hazem', 'ece031d2aaa1a1aeb7ac3e7869d5a721ade58511', NULL, NULL, 1, '2023-10-03 03:02:47', '2023-10-03 03:04:23', NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appinfo`
--
ALTER TABLE `appinfo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `app_id` (`appId`),
  ADD UNIQUE KEY `appleStoreId` (`appleStoreId`),
  ADD UNIQUE KEY `microsoftStoreId` (`microsoftStoreId`);

--
-- Indexes for table `shared_subjects`
--
ALTER TABLE `shared_subjects`
  ADD PRIMARY KEY (`subject_id`),
  ADD UNIQUE KEY `remote_id` (`remote_id`),
  ADD KEY `subject_user` (`subject_user`),
  ADD KEY `fromUser` (`fromUser`);

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
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `shared_subjects`
--
ALTER TABLE `shared_subjects`
  ADD CONSTRAINT `shared_subjects_ibfk_1` FOREIGN KEY (`subject_user`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shared_subjects_ibfk_2` FOREIGN KEY (`fromUser`) REFERENCES `users` (`user_sharedId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`subject_user`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
