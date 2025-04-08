-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2025, at 10:33 AM
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
-- Database: `maternalchildhealthdb`
--

-- --------------------------------------------------------

---
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
(1, 1, '2024-11-15', 1, 'Routine check-up, blood pressure elevated');

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
(2, 'Hamdi Ahmed', '2020-07-25', 2, 'Normal Birth Weight\r\nMild anemia at 3 months (prescribed iron syrup)', 'Breastfed and formula supplement'),
(3, 'Ibrahim Abdullahi', '2020-07-25', 3, 'Normal Birth Weight\r\nMild jaundice at birth (resolved)', 'Breastfed + started mashed fruits at 4 months'),
(4, 'Zainab Omar', '2020-07-25', 4, 'Normal Birth Weight\r\nMinor skin rash at 4 weeks\r\nPreterm, stayed in NICU for 2 weeks', 'Expressed breastmilk via bottle'),
(5, 'Salma Hasna', '2021-09-11', 5, 'Normal Birth Weight\r\nBreech presentation, no neonatal complications', 'Breastfed + formula introduced occasionally') ;

-- --------------------------------------------------------

--
-- Table structure for table `deliveryrecord`
--

CREATE TABLE `deliveryrecord` (
  `delivery_id` int(11) NOT NULL,
  `mother_id` int(11) DEFAULT NULL,
  `delivery_date` date NOT NULL,
  `hospital_id` int(11) DEFAULT NULL,
  `birth_type` enum('Normal', 'C-Section', 'Other') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deliveryrecord`
--

INSERT INTO `deliveryrecord` (`delivery_id`, `mother_id`, `delivery_date`, `hospital_id`, `birth_type`) VALUES
(1, 1, '2021-01-15', 1, 'Normal');

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
(1, 'Dr. Smith', 'Obstetrician', 1);

-- --------------------------------------------------------

--
-- Table structure for table `healthcarefacility`
--

CREATE TABLE `healthcarefacility` (
  `hospital_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `facility_type` enum('Hospital',' Clinic',' Health Center') NOT NULL
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
(8, 'PrimeCare', 'Eldoret', 'Health Center');

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
(1, 1, 'Hepatitis B', '2024-02-01'),
(2, 2, 'Polio', '2024-02-01'),
(3, 3, 'BCG', '2024-02-01');

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
(2, 'Aisha Ali', 29, '+254-798-765-432', 'Diabetes', 'Moderate', 1),
(3, 'Maryam Hassan', 35, '+254-723-456-789', 'No known conditions', 'Great', 0),
(4, 'Zulekha Omar', 25, '+254-720-570-231', 'Asthma', 'Good', 1),
(5, 'Zahra Ahmed', 29, '+254-104-375-512', 'Allergies (Mint)' 1);

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
(1, 1, '2023-12-01', 'Balanced Diet with Folic Acid', 'Iron, Calcium');

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
  MODIFY `visit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `child`
--
ALTER TABLE `child`
  MODIFY `child_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `deliveryrecord`
--
ALTER TABLE `deliveryrecord`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doctor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `healthcarefacility`
--
ALTER TABLE `healthcarefacility`
  MODIFY `hospital_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `immunization`
--
ALTER TABLE `immunization`
  MODIFY `immunization_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mother`
--
ALTER TABLE `mother`
  MODIFY `mother_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `nutrition`
--
ALTER TABLE `nutrition`
  MODIFY `nutrition_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
