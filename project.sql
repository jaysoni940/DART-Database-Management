CREATE DATABASE  IF NOT EXISTS `dart` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dart`;
-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: dart
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `a_class_passenger`
--

DROP TABLE IF EXISTS `a_class_passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `a_class_passenger` (
  `passenger_id` varchar(5) NOT NULL,
  `ac_person_id` varchar(5) NOT NULL,
  PRIMARY KEY (`passenger_id`,`ac_person_id`),
  KEY `fk_a_class_passenger_1_idx` (`ac_person_id`),
  CONSTRAINT `fk_a_class_passenger_1` FOREIGN KEY (`ac_person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `a_star_passenger`
--

DROP TABLE IF EXISTS `a_star_passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `a_star_passenger` (
  `a_star_id` varchar(5) NOT NULL,
  PRIMARY KEY (`a_star_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bus`
--

DROP TABLE IF EXISTS `bus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bus` (
  `license_plate_no` varchar(7) NOT NULL,
  `bus_no` varchar(5) NOT NULL,
  `bus_route_id` varchar(5) NOT NULL,
  `no_of_seats` int NOT NULL,
  `bus_type` varchar(5) NOT NULL,
  PRIMARY KEY (`license_plate_no`,`bus_no`),
  KEY `fk_bus_2_idx` (`bus_route_id`),
  CONSTRAINT `fk_bus_2` FOREIGN KEY (`bus_route_id`) REFERENCES `route` (`route_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `bus_BEFORE_INSERT` BEFORE INSERT ON `bus` FOR EACH ROW BEGIN
if new.license_plate_no regexp '^[A-Z]{3}[0-9]{4}$' = 0 then
signal sqlstate '45000' 
set message_text = 'License plate number format is incorrect';
elseif new.no_of_seats > 100 then
signal sqlstate '45000'
set message_text = 'Number of seats cannot be more than 100';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `bus_BEFORE_UPDATE` BEFORE UPDATE ON `bus` FOR EACH ROW BEGIN
if new.license_plate_no regexp '^[A-Z]{3}[0-9]{4}$' = 0 then
signal sqlstate '45000' 
set message_text = 'License plate number format is incorrect';
elseif new.no_of_seats > 100 then
signal sqlstate '45000'
set message_text = 'Number of seats cannot be more than 100';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `bus_driver`
--

DROP TABLE IF EXISTS `bus_driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bus_driver` (
  `driver_id` varchar(5) NOT NULL,
  `d_employee_id` varchar(5) NOT NULL,
  PRIMARY KEY (`driver_id`,`d_employee_id`),
  KEY `fk_bus_driver_1_idx` (`d_employee_id`),
  CONSTRAINT `fk_bus_driver_1` FOREIGN KEY (`d_employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bus_stop`
--

DROP TABLE IF EXISTS `bus_stop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bus_stop` (
  `stop_no` varchar(5) NOT NULL,
  `stop_route_id` varchar(5) NOT NULL,
  `location` varchar(45) NOT NULL,
  PRIMARY KEY (`stop_no`),
  KEY `fk_bus_stop_1_idx` (`stop_route_id`),
  CONSTRAINT `fk_bus_stop_1` FOREIGN KEY (`stop_route_id`) REFERENCES `route` (`route_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `can_have_a_class`
--

DROP TABLE IF EXISTS `can_have_a_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `can_have_a_class` (
  `ch_pass_id` varchar(5) NOT NULL,
  `ch_passenger_id` varchar(5) NOT NULL,
  `month` varchar(2) NOT NULL,
  PRIMARY KEY (`ch_pass_id`,`ch_passenger_id`),
  KEY `fk_can_have_2_idx` (`ch_passenger_id`),
  CONSTRAINT `fk_can_have_1` FOREIGN KEY (`ch_pass_id`) REFERENCES `pass` (`pass_id`),
  CONSTRAINT `fk_can_have_2` FOREIGN KEY (`ch_passenger_id`) REFERENCES `a_class_passenger` (`passenger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `can_have_a_class_BEFORE_INSERT` BEFORE INSERT ON `can_have_a_class` FOR EACH ROW BEGIN
if new.`month` regexp '^[0][1-9]$' = 0 then
if new.`month` regexp '^[1][0-2]$' = 0 then
signal sqlstate '45000'
set message_text = 'Month format is incorrect';
end if;
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `can_have_a_class_BEFORE_UPDATE` BEFORE UPDATE ON `can_have_a_class` FOR EACH ROW BEGIN
if new.`month` regexp '^[0][1-9]$' = 0 then
if new.`month` regexp '^[1][0-2]$' = 0 then
signal sqlstate '45000'
set message_text = 'Month format is incorrect';
end if;
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `can_have_a_star`
--

DROP TABLE IF EXISTS `can_have_a_star`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `can_have_a_star` (
  `ch_pass_id` varchar(5) NOT NULL,
  `ch_a_star_id` varchar(5) NOT NULL,
  `month` varchar(2) NOT NULL,
  PRIMARY KEY (`ch_pass_id`,`ch_a_star_id`,`month`),
  KEY `fk_can_have_a_star_2_idx` (`ch_a_star_id`),
  CONSTRAINT `fk_can_have_a_star_1` FOREIGN KEY (`ch_pass_id`) REFERENCES `pass` (`pass_id`),
  CONSTRAINT `fk_can_have_a_star_2` FOREIGN KEY (`ch_a_star_id`) REFERENCES `a_star_passenger` (`a_star_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `can_have_a_star_BEFORE_INSERT` BEFORE INSERT ON `can_have_a_star` FOR EACH ROW BEGIN
if new.`month` regexp '^[0][1-9]$' = 0 then
if new.`month` regexp '^[1][0-2]$' = 0 then
signal sqlstate '45000'
set message_text = 'Month format is incorrect';
end if;
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `can_have_a_star_BEFORE_UPDATE` BEFORE UPDATE ON `can_have_a_star` FOR EACH ROW BEGIN
if new.`month` regexp '^[0][1-9]$' = 0 then
if new.`month` regexp '^[1][0-2]$' = 0 then
signal sqlstate '45000'
set message_text = 'Month format is incorrect';
end if;
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `contains`
--

DROP TABLE IF EXISTS `contains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contains` (
  `c_card_id` varchar(5) NOT NULL,
  `c_promo_id` varchar(5) NOT NULL,
  `c_a_star_id` varchar(5) NOT NULL,
  PRIMARY KEY (`c_card_id`,`c_promo_id`,`c_a_star_id`),
  KEY `fk_contains_2_idx` (`c_promo_id`),
  KEY `fk_contains_3_idx` (`c_a_star_id`),
  CONSTRAINT `fk_contains_1` FOREIGN KEY (`c_card_id`) REFERENCES `travel_card` (`card_id`),
  CONSTRAINT `fk_contains_2` FOREIGN KEY (`c_promo_id`) REFERENCES `promotional_discount` (`promo_id`),
  CONSTRAINT `fk_contains_3` FOREIGN KEY (`c_a_star_id`) REFERENCES `a_star_passenger` (`a_star_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drives`
--

DROP TABLE IF EXISTS `drives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drives` (
  `d_driver_id` varchar(5) NOT NULL,
  `d_bus_no` varchar(7) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`d_driver_id`,`d_bus_no`,`date`),
  KEY `fk_drives_2_idx` (`d_bus_no`),
  CONSTRAINT `fk_drives_1` FOREIGN KEY (`d_driver_id`) REFERENCES `bus_driver` (`driver_id`),
  CONSTRAINT `fk_drives_2` FOREIGN KEY (`d_bus_no`) REFERENCES `bus` (`license_plate_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `drives_BEFORE_INSERT` BEFORE INSERT ON `drives` FOR EACH ROW BEGIN
DECLARE val INT;
SET val = (SELECT COUNT(*) FROM `dart`.`drives` WHERE `d_driver_id` = NEW.d_driver_id AND `date` = NEW.date);
IF val > 0 THEN
SIGNAL SQLSTATE '45000'
SET message_text = 'Driver can drive only one bus on a particular day';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` varchar(5) NOT NULL,
  `emp_person_id` varchar(5) NOT NULL,
  `start_date` date NOT NULL,
  `e_type` varchar(45) NOT NULL,
  PRIMARY KEY (`employee_id`,`emp_person_id`),
  KEY `emp_person_id` (`emp_person_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`emp_person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `employee_BEFORE_INSERT` BEFORE INSERT ON `employee` FOR EACH ROW BEGIN
IF new.e_type not in ('Bus Driver', 'Staff', 'Ticket Checker') then
signal sqlstate '45000' 
set message_text = 'Employee type must be Bus Driver, Staff, Ticket Checker';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `employee_BEFORE_UPDATE` BEFORE UPDATE ON `employee` FOR EACH ROW BEGIN
IF new.e_type not in ('Bus Driver', 'Staff', 'Ticket Checker') then
signal sqlstate '45000' 
set message_text = 'Employee type must be Bus Driver, Staff, Ticket Checker';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `follows`
--

DROP TABLE IF EXISTS `follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follows` (
  `f_bus_no` varchar(7) NOT NULL,
  `f_tt_id` varchar(5) NOT NULL,
  PRIMARY KEY (`f_bus_no`,`f_tt_id`),
  KEY `fk_follows_1_idx` (`f_tt_id`),
  CONSTRAINT `fk_follows_1` FOREIGN KEY (`f_tt_id`) REFERENCES `timetable` (`tt_id`),
  CONSTRAINT `fk_follows_2` FOREIGN KEY (`f_bus_no`) REFERENCES `bus` (`license_plate_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guest`
--

DROP TABLE IF EXISTS `guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest` (
  `guest_id` varchar(5) NOT NULL,
  `g_a_star_id` varchar(5) NOT NULL,
  `f_name` varchar(45) NOT NULL,
  `m_name` varchar(45) DEFAULT NULL,
  `l_name` varchar(45) NOT NULL,
  `street` varchar(45) NOT NULL,
  `apt_no` varchar(5) NOT NULL,
  `zip_code` varchar(5) NOT NULL,
  `date` date NOT NULL,
  `month` varchar(2) NOT NULL,
  PRIMARY KEY (`guest_id`,`g_a_star_id`,`date`),
  KEY `fk_guest_1_idx` (`g_a_star_id`),
  KEY `fk_guest_2_idx` (`zip_code`),
  CONSTRAINT `fk_guest_1` FOREIGN KEY (`g_a_star_id`) REFERENCES `a_star_passenger` (`a_star_id`),
  CONSTRAINT `fk_guest_2` FOREIGN KEY (`zip_code`) REFERENCES `zip_code` (`zip_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `guest_BEFORE_INSERT` BEFORE INSERT ON `guest` FOR EACH ROW BEGIN
if (select COUNT(*) from guest where g_a_star_id = new.g_a_star_id and `month` = new.`month`) = 4 then
signal sqlstate '45000'
set message_text = 'A-Star Passenger cannot have more than 4 guests in a month';

elseif new.`month` regexp '^[0][1-9]$' = 0 then
if new.`month` regexp '^[1][0-2]$' = 0 then
signal sqlstate '45000'
set message_text = 'Month format is incorrect';
end if;

end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `guest_BEFORE_UPDATE` BEFORE UPDATE ON `guest` FOR EACH ROW BEGIN
if (select COUNT(*) from guest where g_a_star_id = new.g_a_star_id and `month` = new.`month`) = 4 then
signal sqlstate '45000'
set message_text = 'A-Star Passenger cannot have more than 4 guests in a month';

elseif new.`month` regexp '^[0][1-9]$' = 0 then
if new.`month` regexp '^[1][0-2]$' = 0 then
signal sqlstate '45000'
set message_text = 'Month format is incorrect';
end if;

end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `guest_phone`
--

DROP TABLE IF EXISTS `guest_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest_phone` (
  `phn_guest_id` varchar(5) NOT NULL,
  `phone_no` varchar(10) NOT NULL,
  PRIMARY KEY (`phn_guest_id`,`phone_no`),
  CONSTRAINT `fk_guest_phone_1` FOREIGN KEY (`phn_guest_id`) REFERENCES `guest` (`guest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `guest_phone_BEFORE_INSERT` BEFORE INSERT ON `guest_phone` FOR EACH ROW BEGIN
if new.phone_no regexp '^[0-9]{10}$' = 0 then
signal sqlstate '45000' 
set message_text = 'Phone number format is wrong';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `guest_phone_BEFORE_UPDATE` BEFORE UPDATE ON `guest_phone` FOR EACH ROW BEGIN
if new.phone_no regexp '^[0-9]{10}$' = 0 then
signal sqlstate '45000' 
set message_text = 'Phone number format is wrong';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `is_a_class_a_star`
--

DROP TABLE IF EXISTS `is_a_class_a_star`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `is_a_class_a_star` (
  `aa_passenger_id` varchar(5) NOT NULL,
  `aa_a_star_id` varchar(5) NOT NULL,
  PRIMARY KEY (`aa_passenger_id`),
  KEY `fk_is_a_class_a_star_2_idx` (`aa_a_star_id`),
  CONSTRAINT `fk_is_a_class_a_star_1` FOREIGN KEY (`aa_passenger_id`) REFERENCES `a_class_passenger` (`passenger_id`),
  CONSTRAINT `fk_is_a_class_a_star_2` FOREIGN KEY (`aa_a_star_id`) REFERENCES `a_star_passenger` (`a_star_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `is_emp_a_star`
--

DROP TABLE IF EXISTS `is_emp_a_star`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `is_emp_a_star` (
  `ea_employee_id` varchar(5) NOT NULL,
  `ea_a_star_id` varchar(5) NOT NULL,
  PRIMARY KEY (`ea_employee_id`),
  KEY `fk_is_emp_a_star_2_idx` (`ea_a_star_id`),
  CONSTRAINT `fk_is_emp_a_star_1` FOREIGN KEY (`ea_employee_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `fk_is_emp_a_star_2` FOREIGN KEY (`ea_a_star_id`) REFERENCES `a_star_passenger` (`a_star_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parks`
--

DROP TABLE IF EXISTS `parks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parks` (
  `p_terminal_id` varchar(5) NOT NULL,
  `p_bus_no` varchar(7) NOT NULL,
  `time` time NOT NULL,
  `date` date NOT NULL,
  `duration` int NOT NULL,
  PRIMARY KEY (`p_terminal_id`,`p_bus_no`),
  KEY `fk_parks_2_idx` (`p_bus_no`),
  CONSTRAINT `fk_parks_1` FOREIGN KEY (`p_terminal_id`) REFERENCES `terminal` (`terminal_id`),
  CONSTRAINT `fk_parks_2` FOREIGN KEY (`p_bus_no`) REFERENCES `bus` (`license_plate_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pass`
--

DROP TABLE IF EXISTS `pass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pass` (
  `pass_id` varchar(5) NOT NULL,
  `issue_date` date NOT NULL,
  `expiry_date` date NOT NULL,
  `p_staff_id` varchar(5) NOT NULL,
  `p_payment_id` varchar(5) NOT NULL,
  PRIMARY KEY (`pass_id`),
  KEY `fk_pass_1_idx` (`p_staff_id`),
  KEY `fk_pass_3_idx` (`p_payment_id`),
  CONSTRAINT `fk_pass_1` FOREIGN KEY (`p_staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_pass_3` FOREIGN KEY (`p_payment_id`) REFERENCES `payment_details` (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment_details`
--

DROP TABLE IF EXISTS `payment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_details` (
  `payment_id` varchar(5) NOT NULL,
  `amount` float NOT NULL,
  `method` varchar(5) NOT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `payment_details_BEFORE_INSERT` BEFORE INSERT ON `payment_details` FOR EACH ROW BEGIN
if new.method not in ('card', 'cash') then
signal sqlstate '45000'
set message_text = 'Payment method can be cash or card';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `payment_details_BEFORE_UPDATE` BEFORE UPDATE ON `payment_details` FOR EACH ROW BEGIN
if new.method not in ('card', 'cash') then
signal sqlstate '45000'
set message_text = 'Payment method can be cash or card';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `person_id` varchar(4) NOT NULL,
  `f_name` varchar(45) NOT NULL,
  `m_name` varchar(45) DEFAULT NULL,
  `l_name` varchar(45) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `dob` date NOT NULL,
  `street` varchar(45) NOT NULL,
  `apt_no` varchar(5) NOT NULL,
  `zip_code` varchar(5) NOT NULL,
  PRIMARY KEY (`person_id`),
  KEY `fk_person_1_idx` (`zip_code`),
  CONSTRAINT `fk_person_1` FOREIGN KEY (`zip_code`) REFERENCES `zip_code` (`zip_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `person_check_before_insert` BEFORE INSERT ON `person` FOR EACH ROW BEGIN

IF TIMESTAMPDIFF(YEAR, NEW.dob, CURDATE()) < 16 THEN
SIGNAL SQLSTATE '45000'
SET message_text = 'Age of person must be greater than 16 years.';

ELSEIF NEW.person_id REGEXP'^[P][0-9]{3}$' = 0 THEN
SIGNAL SQLSTATE '45000'
SET message_text = 'PersonID must have format`PXXX`';

ELSEIF NEW.gender NOT IN ('M', 'F') THEN
SIGNAL SQLSTATE '45000'
SET message_text = 'Gender is not correct.';
END IF;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `person_check_before_update` BEFORE UPDATE ON `person` FOR EACH ROW BEGIN

IF TIMESTAMPDIFF(YEAR, NEW.dob, CURDATE()) < 16 THEN
SIGNAL SQLSTATE '45000'
SET message_text = 'Age of person must be greater than 16 years.';

ELSEIF NEW.person_id REGEXP'^[P][0-9]{3}$' = 0 THEN
SIGNAL SQLSTATE '45000'
SET message_text = 'PersonID must have format`PXXX`';

ELSEIF NEW.gender NOT IN ('M', 'F') THEN
SIGNAL SQLSTATE '45000'
SET message_text = 'Gender is not correct.';
END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `person_phone`
--

DROP TABLE IF EXISTS `person_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person_phone` (
  `phn_person_id` varchar(4) NOT NULL,
  `phone_no` varchar(10) NOT NULL,
  PRIMARY KEY (`phn_person_id`,`phone_no`),
  CONSTRAINT `fk_person_phone_1` FOREIGN KEY (`phn_person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `person_phone_BEFORE_INSERT` BEFORE INSERT ON `person_phone` FOR EACH ROW BEGIN
if new.phone_no regexp '^[0-9]{10}$' = 0 then
signal sqlstate '45000' 
set message_text = 'Phone number format is wrong';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `person_phone_BEFORE_UPDATE` BEFORE UPDATE ON `person_phone` FOR EACH ROW BEGIN
if new.phone_no regexp '^[0-9]{10}$' = 0 then
signal sqlstate '45000' 
set message_text = 'Phone number format is wrong';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `popular_bus`
--

DROP TABLE IF EXISTS `popular_bus`;
/*!50001 DROP VIEW IF EXISTS `popular_bus`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `popular_bus` AS SELECT 
 1 AS `license_plate_no`,
 1 AS `bus_no`,
 1 AS `no_of_seats`,
 1 AS `bus_type`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `potential_a_star_passenger`
--

DROP TABLE IF EXISTS `potential_a_star_passenger`;
/*!50001 DROP VIEW IF EXISTS `potential_a_star_passenger`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `potential_a_star_passenger` AS SELECT 
 1 AS `first_name`,
 1 AS `middle_name`,
 1 AS `last_name`,
 1 AS `phone_number`,
 1 AS `person_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `promotional_discount`
--

DROP TABLE IF EXISTS `promotional_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotional_discount` (
  `promo_id` varchar(5) NOT NULL,
  `discount_percent` int NOT NULL,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`promo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `promotional_discount_BEFORE_INSERT` BEFORE INSERT ON `promotional_discount` FOR EACH ROW BEGIN
if new.discount_percent < 0 or new.discount_percent > 100 then
signal sqlstate '45000' 
set message_text = 'Discount percent out of range';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `promotional_discount_BEFORE_UPDATE` BEFORE UPDATE ON `promotional_discount` FOR EACH ROW BEGIN
if new.discount_percent < 0 or new.discount_percent > 100 then
signal sqlstate '45000' 
set message_text = 'Discount percent out of range';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route` (
  `route_id` varchar(5) NOT NULL,
  PRIMARY KEY (`route_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` varchar(5) NOT NULL,
  `s_employee_id` varchar(5) NOT NULL,
  PRIMARY KEY (`staff_id`,`s_employee_id`),
  KEY `fk_staff_1_idx` (`s_employee_id`),
  CONSTRAINT `fk_staff_1` FOREIGN KEY (`s_employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `terminal`
--

DROP TABLE IF EXISTS `terminal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminal` (
  `terminal_id` varchar(5) NOT NULL,
  `location` varchar(45) NOT NULL,
  PRIMARY KEY (`terminal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `ticket_id` varchar(5) NOT NULL,
  `t_bus_no` varchar(7) NOT NULL,
  `t_seat_no` int NOT NULL,
  `t_checker_id` varchar(5) NOT NULL,
  `t_staff_id` varchar(5) NOT NULL,
  `t_person_id` varchar(4) NOT NULL,
  `t_payment_id` varchar(5) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `fk_ticket_1_idx` (`t_bus_no`),
  KEY `fk_ticket_2_idx` (`t_checker_id`),
  KEY `fk_ticket_3_idx` (`t_staff_id`),
  KEY `fk_ticket_4_idx` (`t_person_id`),
  KEY `fk_ticket_5_idx` (`t_payment_id`),
  CONSTRAINT `fk_ticket_1` FOREIGN KEY (`t_bus_no`) REFERENCES `bus` (`license_plate_no`),
  CONSTRAINT `fk_ticket_2` FOREIGN KEY (`t_checker_id`) REFERENCES `ticket_checker` (`checker_id`),
  CONSTRAINT `fk_ticket_3` FOREIGN KEY (`t_staff_id`) REFERENCES `staff` (`staff_id`),
  CONSTRAINT `fk_ticket_4` FOREIGN KEY (`t_person_id`) REFERENCES `person` (`person_id`),
  CONSTRAINT `fk_ticket_5` FOREIGN KEY (`t_payment_id`) REFERENCES `payment_details` (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ticket_checker`
--

DROP TABLE IF EXISTS `ticket_checker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_checker` (
  `checker_id` varchar(5) NOT NULL,
  `tc_bus_no` varchar(7) NOT NULL,
  `tc_employee_id` varchar(5) NOT NULL,
  PRIMARY KEY (`checker_id`,`tc_bus_no`,`tc_employee_id`),
  KEY `fk_ticket_checker_1_idx` (`tc_employee_id`),
  KEY `fk_ticket_checker_2_idx` (`tc_bus_no`),
  CONSTRAINT `fk_ticket_checker_1` FOREIGN KEY (`tc_employee_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `fk_ticket_checker_2` FOREIGN KEY (`tc_bus_no`) REFERENCES `bus` (`license_plate_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timetable`
--

DROP TABLE IF EXISTS `timetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timetable` (
  `tt_id` varchar(4) NOT NULL,
  `day` varchar(3) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `interval` int NOT NULL,
  PRIMARY KEY (`tt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `timetable_BEFORE_INSERT` BEFORE INSERT ON `timetable` FOR EACH ROW BEGIN

IF NEW.tt_id REGEXP'^(DT)?[0-9]{2}$' = 0 THEN
SIGNAL SQLSTATE '45000'
SET message_text = 'Timetable ID must have format`DTXX`';

ELSEIF NEW.day NOT IN ('M', 'T', 'W', 'Th', 'F', 'Sat', 'Sun') THEN
SIGNAL SQLSTATE '45000'
SET message_text = 'Day is not correct';

ELSEIF NEW.interval NOT IN ('15', '20', '30') THEN
SIGNAL SQLSTATE '45000'
SET message_text = 'Time Interval is not correct, Please enter 15, 20 or 30 minute intervals';

END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `timetable_BEFORE_UPDATE` BEFORE UPDATE ON `timetable` FOR EACH ROW BEGIN

IF NEW.tt_id REGEXP'^(DT)?[0-9]{2}$' = 0 THEN
SIGNAL SQLSTATE '45000'
SET message_text = 'Timetable ID must have format`DTXX`';

ELSEIF NEW.day NOT IN ('M', 'T', 'W', 'Th', 'F', 'Sat', 'Sun') THEN
SIGNAL SQLSTATE '45000'
SET message_text = 'Day is not correct';

ELSEIF NEW.interval NOT IN ('15', '20', '30') THEN
SIGNAL SQLSTATE '45000'
SET message_text = 'Time Interval is not correct, Please enter 15, 20 or 30 minute intervals';

END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `top_a_star_passengers`
--

DROP TABLE IF EXISTS `top_a_star_passengers`;
/*!50001 DROP VIEW IF EXISTS `top_a_star_passengers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `top_a_star_passengers` AS SELECT 
 1 AS `person_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `date_of_membership`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `top_employee`
--

DROP TABLE IF EXISTS `top_employee`;
/*!50001 DROP VIEW IF EXISTS `top_employee`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `top_employee` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `start_date`,
 1 AS `employee_type`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `travel_card`
--

DROP TABLE IF EXISTS `travel_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travel_card` (
  `card_id` varchar(5) NOT NULL,
  `card_a_star_id` varchar(5) NOT NULL,
  `issue_date` date NOT NULL,
  `expiry_date` date NOT NULL,
  PRIMARY KEY (`card_id`,`card_a_star_id`),
  KEY `fk_travel_card_1_idx` (`card_a_star_id`),
  CONSTRAINT `fk_travel_card_1` FOREIGN KEY (`card_a_star_id`) REFERENCES `a_star_passenger` (`a_star_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zip_code`
--

DROP TABLE IF EXISTS `zip_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zip_code` (
  `zip_code` varchar(5) NOT NULL,
  `city` varchar(45) NOT NULL,
  PRIMARY KEY (`zip_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `zip_code_BEFORE_INSERT` BEFORE INSERT ON `zip_code` FOR EACH ROW BEGIN
if new.zip_code regexp '^[0-9]{5}$' = 0 then
signal sqlstate '45000' 
set message_text = 'Zip code format wrong';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `zip_code_BEFORE_UPDATE` BEFORE UPDATE ON `zip_code` FOR EACH ROW BEGIN
if new.zip_code regexp '^[0-9]{5}$' = 0 then
signal sqlstate '45000' 
set message_text = 'Zip code format wrong';
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'dart'
--

--
-- Dumping routines for database 'dart'
--

--
-- Final view structure for view `popular_bus`
--

/*!50001 DROP VIEW IF EXISTS `popular_bus`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `popular_bus` AS select `bus`.`license_plate_no` AS `license_plate_no`,`bus`.`bus_no` AS `bus_no`,`bus`.`no_of_seats` AS `no_of_seats`,`bus`.`bus_type` AS `bus_type` from (`bus` join `ticket`) where ((`bus`.`license_plate_no` = `ticket`.`t_bus_no`) and (`ticket`.`date` > cast((curdate() - interval 2 month) as date))) group by `ticket`.`t_bus_no` order by count(`ticket`.`ticket_id`) limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `potential_a_star_passenger`
--

/*!50001 DROP VIEW IF EXISTS `potential_a_star_passenger`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `potential_a_star_passenger` AS select `person`.`f_name` AS `first_name`,`person`.`m_name` AS `middle_name`,`person`.`l_name` AS `last_name`,`person_phone`.`phone_no` AS `phone_number`,`person`.`person_id` AS `person_id` from ((`person` join `person_phone`) join `ticket`) where (exists(select 1 from (`a_class_passenger` join `is_a_class_a_star`) where ((`a_class_passenger`.`passenger_id` = `is_a_class_a_star`.`aa_passenger_id`) and (`person`.`person_id` = `a_class_passenger`.`ac_person_id`))) is false and (`person`.`person_id` = `person_phone`.`phn_person_id`) and (`person`.`person_id` = `ticket`.`t_person_id`) and (`ticket`.`date` > cast((curdate() - interval 2 month) as date))) group by `ticket`.`t_person_id` having (count(`ticket`.`ticket_id`) > 4) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_a_star_passengers`
--

/*!50001 DROP VIEW IF EXISTS `top_a_star_passengers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top_a_star_passengers` AS select `person`.`person_id` AS `person_id`,`person`.`f_name` AS `first_name`,`person`.`l_name` AS `last_name`,`travel_card`.`issue_date` AS `date_of_membership` from ((`person` join `ticket`) join `travel_card`) where ((`person`.`person_id`,`travel_card`.`card_id`) in (select `person`.`person_id`,`travel_card`.`card_id` from (`person` join `travel_card`) where (exists(select 1 from (`a_class_passenger` join `is_a_class_a_star`) where ((`a_class_passenger`.`passenger_id` = `is_a_class_a_star`.`aa_passenger_id`) and (`person`.`person_id` = `a_class_passenger`.`ac_person_id`) and (`is_a_class_a_star`.`aa_a_star_id` = `travel_card`.`card_a_star_id`))) or exists(select 1 from (`employee` join `is_emp_a_star`) where ((`employee`.`employee_id` = `is_emp_a_star`.`ea_employee_id`) and (`person`.`person_id` = `employee`.`emp_person_id`) and (`is_emp_a_star`.`ea_a_star_id` = `travel_card`.`card_a_star_id`))))) and (`person`.`person_id` = `ticket`.`t_person_id`) and (`ticket`.`date` > cast((curdate() - interval 1 month) as date))) group by `ticket`.`t_person_id` having (count(`ticket`.`ticket_id`) > 6) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_employee`
--

/*!50001 DROP VIEW IF EXISTS `top_employee`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top_employee` AS select `person`.`f_name` AS `first_name`,`person`.`l_name` AS `last_name`,`employee`.`start_date` AS `start_date`,`employee`.`e_type` AS `employee_type` from ((`person` join `employee`) join `ticket`) where ((`person`.`person_id` = `employee`.`emp_person_id`) and (`person`.`person_id` = `ticket`.`t_person_id`) and (`ticket`.`date` > cast((curdate() - interval 1 month) as date))) group by `ticket`.`t_person_id` having (0 <> max(`ticket`.`ticket_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-18 13:23:08
