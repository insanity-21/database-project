-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2025 at 11:11 PM
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
-- Database: `maternal2`
--

-- --------------------------------------------------------

--
-- Table structure for table `antenatalvisit`
--

CREATE TABLE `antenatalvisit` (
  `visit_id` int(11) NOT NULL,
  `mother_id` int(11) DEFAULT NULL,
  `visit_date` date NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `antenatalvisit`
--

INSERT INTO `antenatalvisit` (`visit_id`, `mother_id`, `visit_date`, `doctor_id`, `notes`) VALUES
(1, 1, '2020-06-29', 1, 'Vitals: BP 118/78 mmHg, FHR 142 bpm\r\nComplaints:  Slight fatigue, otherwise well\r\nPhysical Exam: Fundal height 32 cm; fetal position longitudinal, cephalic presentation'),
(2, 2, '2020-01-30', 2, 'Vitals: BP 118/76 mmHg, HR 82 bpm\r\nComplaints: None\r\nPhysical Exam: Normal fundal height, fetal heart tones audible with Doppler'),
(3, 3, '2021-05-11', 3, 'Vitals: BP 110/72 mmHg, HR 78 bpm\r\nComplaints: Mild back pain, concern about body changes\r\nPhysical Exam: Uterus palpable at umbilicus, fetal movement reported'),
(4, 4, '2019-06-21', 4, 'Vitals: BP 108/68 mmHg, HR 92 bpm\r\nComplaints: Fatigue and mild dizziness\r\nPhysical Exam: Pale conjunctiva, otherwise stable'),
(5, 5, '2021-08-10', 5, 'Vitals: BP 122/78 mmHg, HR 84 bpm, Weight up by 2.5 kg\r\nComplaints: Occasional lower backache\r\nPhysical Exam:  Uterus larger than single gestation; fetal heartbeats heard for both twins. No signs of preterm labour.');

-- --------------------------------------------------------

--
-- Table structure for table `child`
--

CREATE TABLE `child` (
  `child_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `mother_id` int(11) DEFAULT NULL,
  `health_records` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nutrition` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `child`
--

INSERT INTO `child` (`child_id`, `name`, `dob`, `mother_id`, `health_records`, `nutrition`) VALUES
(1, 'Hafsa Mohamed', '2021-01-15', 1, 'Normal Birth Weight\r\nMild flu', 'Exclusive Breastfeeding'),
(2, 'Hamdi Ahmed', '2020-07-25', 2, 'Normal Birth Weight\r\nMinor skin rash at 4 weeks\r\nPreterm, stayed in NICU for 2 weeks', 'Expressed breastmilk via bottle'),
(3, 'Ibrahim Abdullahi', '2021-09-15', 3, 'Normal Birth Weight\r\nMild jaundice at birth (resolved)', 'Breastfed + started mashed fruits at 4 months'),
(4, 'Zainab Omar', '2019-12-19', 4, 'Normal Birth Weight\r\nMild anemia at 3 months (prescribed iron syrup)', 'Breastfed and formula supplement'),
(5, 'Salma Shariff', '2022-02-21', 5, 'Normal Birth Weight\r\nNo complications', 'Breastfed'),
(6, 'Suleiman Shariff', '2022-02-21', 5, 'Normal Birth Weight\r\nNo complications', 'Breastfed');

-- --------------------------------------------------------

--
-- Table structure for table `deliveryrecord`
--

CREATE TABLE `deliveryrecord` (
  `delivery_id` int(11) NOT NULL,
  `mother_id` int(11) DEFAULT NULL,
  `delivery_date` date NOT NULL,
  `hospital_id` int(11) DEFAULT NULL,
  `birth_type` enum('Normal','Caesarean','Breech Birth','Multiple Birth') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deliveryrecord`
--

INSERT INTO `deliveryrecord` (`delivery_id`, `mother_id`, `delivery_date`, `hospital_id`, `birth_type`) VALUES
(1, 1, '2021-01-15', 1, 'Normal'),
(2, 2, '2020-07-25', 2, 'Normal'),
(3, 3, '2021-09-15', 3, 'Breech Birth'),
(4, 4, '2019-12-19', 4, 'Caesarean'),
(5, 5, '2022-02-21', 5, 'Multiple Birth');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doctor_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  `facility_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctor_id`, `name`, `specialization`, `facility_id`) VALUES
(1, 'Dr. Abdullahi', 'Obstetrician', 1),
(2, 'Dr. Elizabeth', 'Obstetrician', 2),
(3, 'Dr. Maxwell', 'Gynecologist', 3),
(4, 'Dr. Smith', 'Obstetrician', 4),
(5, 'Dr. Sarah', 'Maternal Fetal Medicine Specialist', 5);

-- --------------------------------------------------------

--
-- Table structure for table `healthcarefacility`
--

CREATE TABLE `healthcarefacility` (
  `hospital_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `facility_type` enum('Hospital','Clinic','Health Center') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `healthcarefacility`
--

INSERT INTO `healthcarefacility` (`hospital_id`, `name`, `location`, `facility_type`) VALUES
(1, 'City Hospital', 'Garissa', 'Hospital'),
(2, 'Mothers joy', 'Nairobi', 'Hospital'),
(3, 'Matter Hospital', 'Nairobi', 'Hospital'),
(4, 'St John', 'Nyeri', 'Hospital'),
(5, 'Carance', 'Nakuru', 'Clinic'),
(6, 'BrightCare', 'Lodwar', 'Clinic'),
(7, 'Serenity', 'Mombasa', 'Health Center'),
(8, 'PrimeCare', 'Eldoret', 'Health Center'),
(9, 'Vital Point Medical', 'Nairobi', 'Hospital');

-- --------------------------------------------------------

--
-- Table structure for table `immunization`
--

CREATE TABLE `immunization` (
  `immunization_id` int(11) NOT NULL,
  `child_id` int(11) DEFAULT NULL,
  `vaccine_name` varchar(100) NOT NULL,
  `immunization_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `immunization`
--

INSERT INTO `immunization` (`immunization_id`, `child_id`, `vaccine_name`, `immunization_date`) VALUES
(1, 1, 'Hepatitis B', '2021-01-15'),
(2, 2, 'Polio', '2021-01-01'),
(3, 3, 'BCG', '2022-02-09'),
(4, 4, 'Varicela', '2020-12-19'),
(5, 5, 'Mumps', '2023-04-12'),
(6, 6, 'Mumps', '2023-04-12');

-- --------------------------------------------------------

--
-- Table structure for table `mother`
--

CREATE TABLE `mother` (
  `mother_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `medical_history` text DEFAULT NULL,
  `nutrition_status` varchar(50) DEFAULT NULL,
  `high_risk_flag` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mother`
--

INSERT INTO `mother` (`mother_id`, `name`, `age`, `contact`, `medical_history`, `nutrition_status`, `high_risk_flag`) VALUES
(1, 'Mariam Amina', 28, '+254-799-879-645', 'Hypertension', 'Good', 1),
(2, 'Aisha Ali', 40, '+254-798-765-432', 'Diabetes', 'Moderate', 1),
(3, 'Maryam Hassan', 19, '+254-723-456-789', 'No known conditions', 'Great', 0),
(4, 'Zulekha Omar', 25, '+254-720-570-231', 'Asthma', 'Good', 1),
(5, 'Zahra Ahmed', 31, '+254-104-375-512', 'Allergies (Mint)', 'Good', 1);

-- --------------------------------------------------------

--
-- Table structure for table `nutrition`
--

CREATE TABLE `nutrition` (
  `nutrition_id` int(11) NOT NULL,
  `mother_id` int(11) DEFAULT NULL,
  `record_date` date NOT NULL,
  `dietary_intake` text DEFAULT NULL,
  `supplements` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nutrition`
--

INSERT INTO `nutrition` (`nutrition_id`, `mother_id`, `record_date`, `dietary_intake`, `supplements`) VALUES
(1, 1, '2020-10-01', 'Breakfast: Millet porridge with groundnuts, banana\r\nLunch: Ugali, sukuma wiki, beef stew\r\nDinner: Rice, lentils, avocado\r\nFluids: 8 glasses water, 1 glass fresh juice', 'Multivitamin with DHA'),
(2, 2, '2020-04-01', 'Breakfast: Oats with milk, eggs, mango\r\nLunch: Githeri with spinach\r\nDinner: Sweet potatoes, chicken stew\r\nSnacks: Groundnuts, yoghurt', 'Folic acid, Iron, Calcium'),
(3, 3, '2021-09-15', 'Breakfast: Toast with peanut butter, boiled egg, papaya\r\nLunch: Chapati, lentils, sukuma wiki\r\nDinner: Rice with vegetables and minced meat', 'Vitamin C'),
(4, 4, '2019-12-19', 'Breakfast: Tea with milk, maize porridge\r\nLunch: Ugali, liver, pumpkin leaves\r\nDinner: Mashed potatoes with beans', 'Fibre'),
(5, 5, '2022-02-21', 'Breakfast: Three Scrambled eggs with spinach and mushrooms with Two Whole-grain toast and a Glass of milk\r\nLunch: Grilled chicken salad with mixed greens, cherry tomatoes, avocado, olive oil, and balsamic vinegar dressing\r\nDinner: Grilled salmon\r\nSnacks: Greek yogurt with mixed berries or nuts', 'Vitamin D, Magnesium');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `antenatalvisit`
--
ALTER TABLE `antenatalvisit`
  ADD PRIMARY KEY (`visit_id`),
  ADD KEY `mother_id` (`mother_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `child`
--
ALTER TABLE `child`
  ADD PRIMARY KEY (`child_id`),
  ADD KEY `mother_id` (`mother_id`),
  ADD KEY `idx_child_id` (`child_id`);

--
-- Indexes for table `deliveryrecord`
--
ALTER TABLE `deliveryrecord`
  ADD PRIMARY KEY (`delivery_id`),
  ADD KEY `mother_id` (`mother_id`),
  ADD KEY `hospital_id` (`hospital_id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctor_id`),
  ADD KEY `facility_id` (`facility_id`),
  ADD KEY `idx_doctor_id` (`doctor_id`);

--
-- Indexes for table `healthcarefacility`
--
ALTER TABLE `healthcarefacility`
  ADD PRIMARY KEY (`hospital_id`);

--
-- Indexes for table `immunization`
--
ALTER TABLE `immunization`
  ADD PRIMARY KEY (`immunization_id`),
  ADD KEY `child_id` (`child_id`);

--
-- Indexes for table `mother`
--
ALTER TABLE `mother`
  ADD PRIMARY KEY (`mother_id`),
  ADD UNIQUE KEY `contact` (`contact`),
  ADD KEY `idx_mother_id` (`mother_id`);

--
-- Indexes for table `nutrition`
--
ALTER TABLE `nutrition`
  ADD PRIMARY KEY (`nutrition_id`),
  ADD KEY `mother_id` (`mother_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `antenatalvisit`
--
ALTER TABLE `antenatalvisit`
  MODIFY `visit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `child`
--
ALTER TABLE `child`
  MODIFY `child_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `deliveryrecord`
--
ALTER TABLE `deliveryrecord`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doctor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `healthcarefacility`
--
ALTER TABLE `healthcarefacility`
  MODIFY `hospital_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `immunization`
--
ALTER TABLE `immunization`
  MODIFY `immunization_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `mother`
--
ALTER TABLE `mother`
  MODIFY `mother_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `nutrition`
--
ALTER TABLE `nutrition`
  MODIFY `nutrition_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `antenatalvisit`
--
ALTER TABLE `antenatalvisit`
  ADD CONSTRAINT `antenatalvisit_ibfk_1` FOREIGN KEY (`mother_id`) REFERENCES `mother` (`mother_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `antenatalvisit_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`) ON DELETE SET NULL;

--
-- Constraints for table `child`
--
ALTER TABLE `child`
  ADD CONSTRAINT `child_ibfk_1` FOREIGN KEY (`mother_id`) REFERENCES `mother` (`mother_id`) ON DELETE CASCADE;

--
-- Constraints for table `deliveryrecord`
--
ALTER TABLE `deliveryrecord`
  ADD CONSTRAINT `deliveryrecord_ibfk_1` FOREIGN KEY (`mother_id`) REFERENCES `mother` (`mother_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `deliveryrecord_ibfk_2` FOREIGN KEY (`hospital_id`) REFERENCES `healthcarefacility` (`hospital_id`) ON DELETE SET NULL;

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`facility_id`) REFERENCES `healthcarefacility` (`hospital_id`) ON DELETE SET NULL;

--
-- Constraints for table `immunization`
--
ALTER TABLE `immunization`
  ADD CONSTRAINT `immunization_ibfk_1` FOREIGN KEY (`child_id`) REFERENCES `child` (`child_id`) ON DELETE CASCADE;

--
-- Constraints for table `nutrition`
--
ALTER TABLE `nutrition`
  ADD CONSTRAINT `nutrition_ibfk_1` FOREIGN KEY (`mother_id`) REFERENCES `mother` (`mother_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
