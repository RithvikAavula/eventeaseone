-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: eventease
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `AdminID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`AdminID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'John','Doe','john.doe@example.com','SecurePass123','2025-03-31 12:56:00'),(2,'Jhon','Snow','jhon123@gmail.com','john@123','2025-03-31 13:09:19');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codingstudioevents`
--

DROP TABLE IF EXISTS `codingstudioevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `codingstudioevents` (
  `EventID` int NOT NULL AUTO_INCREMENT,
  `EventName` varchar(100) NOT NULL,
  `Description` text,
  `EventDate` date NOT NULL,
  `StartTime` time NOT NULL,
  `EndTime` time NOT NULL,
  `Location` varchar(255) NOT NULL,
  `TotalSeats` int NOT NULL,
  `AvailableSeats` int NOT NULL,
  `OrganizerID` int DEFAULT NULL,
  PRIMARY KEY (`EventID`),
  KEY `OrganizerID` (`OrganizerID`),
  CONSTRAINT `codingstudioevents_ibfk_1` FOREIGN KEY (`OrganizerID`) REFERENCES `admins` (`AdminID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codingstudioevents`
--

LOCK TABLES `codingstudioevents` WRITE;
/*!40000 ALTER TABLE `codingstudioevents` DISABLE KEYS */;
INSERT INTO `codingstudioevents` VALUES (1,'vibha','all types of performences are welcomed','2025-04-25','10:30:00','16:20:00','VBIT Ground',100,100,2);
/*!40000 ALTER TABLE `codingstudioevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codingstudioregistrations`
--

DROP TABLE IF EXISTS `codingstudioregistrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `codingstudioregistrations` (
  `RegistrationID` int NOT NULL AUTO_INCREMENT,
  `EventID` int DEFAULT NULL,
  `RegistrationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Status` enum('Pending','Confirmed','Cancelled') DEFAULT 'Pending',
  `Email` varchar(255) NOT NULL,
  `FullName` varchar(255) NOT NULL,
  `Phone_Number` varchar(15) NOT NULL,
  `Department` varchar(100) NOT NULL,
  `Year` varchar(100) NOT NULL,
  `Section` varchar(50) NOT NULL,
  `EventName` varchar(255) NOT NULL,
  `StudentID` varchar(100) NOT NULL,
  PRIMARY KEY (`RegistrationID`),
  UNIQUE KEY `StudentID` (`StudentID`),
  KEY `EventID` (`EventID`),
  CONSTRAINT `codingstudioregistrations_ibfk_1` FOREIGN KEY (`EventID`) REFERENCES `codingstudioevents` (`EventID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codingstudioregistrations`
--

LOCK TABLES `codingstudioregistrations` WRITE;
/*!40000 ALTER TABLE `codingstudioregistrations` DISABLE KEYS */;
INSERT INTO `codingstudioregistrations` VALUES (1,1,'2025-04-10 15:24:00','Pending','23p61a1253@vbithyd.ac.in','Sanjay Konduri','6782926322','IT','2','A','vibha','23P61A1253'),(2,1,'2025-04-23 12:11:35','Pending','23p61a1231@vbithyd.ac.in','Mani Ruthvik Gadakari','7569394968','IT','2','A','vibha','23p61a1231');
/*!40000 ALTER TABLE `codingstudioregistrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ieeeevents`
--

DROP TABLE IF EXISTS `ieeeevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ieeeevents` (
  `EventID` int NOT NULL AUTO_INCREMENT,
  `EventName` varchar(100) NOT NULL,
  `Description` text,
  `EventDate` date NOT NULL,
  `StartTime` time NOT NULL,
  `EndTime` time NOT NULL,
  `Location` varchar(255) NOT NULL,
  `TotalSeats` int NOT NULL,
  `AvailableSeats` int NOT NULL,
  `OrganizerID` int DEFAULT NULL,
  PRIMARY KEY (`EventID`),
  KEY `OrganizerID` (`OrganizerID`),
  CONSTRAINT `ieeeevents_ibfk_1` FOREIGN KEY (`OrganizerID`) REFERENCES `admins` (`AdminID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ieeeevents`
--

LOCK TABLES `ieeeevents` WRITE;
/*!40000 ALTER TABLE `ieeeevents` DISABLE KEYS */;
INSERT INTO `ieeeevents` VALUES (1,'holi','It is a colourful festival','2025-04-08','01:39:00','23:36:00','Mahabubnagar',200,150,1);
/*!40000 ALTER TABLE `ieeeevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ieeeregistrations`
--

DROP TABLE IF EXISTS `ieeeregistrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ieeeregistrations` (
  `RegistrationID` int NOT NULL AUTO_INCREMENT,
  `EventID` int DEFAULT NULL,
  `RegistrationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Status` enum('Pending','Confirmed','Cancelled') DEFAULT 'Pending',
  `Email` varchar(255) NOT NULL,
  `FullName` varchar(255) NOT NULL,
  `Phone_Number` varchar(15) NOT NULL,
  `Department` varchar(100) NOT NULL,
  `Year` varchar(100) NOT NULL,
  `Section` varchar(50) NOT NULL,
  `EventName` varchar(255) NOT NULL,
  `StudentID` varchar(100) NOT NULL,
  PRIMARY KEY (`RegistrationID`),
  UNIQUE KEY `StudentID` (`StudentID`),
  KEY `EventID` (`EventID`),
  CONSTRAINT `ieeeregistrations_ibfk_1` FOREIGN KEY (`EventID`) REFERENCES `codingstudioevents` (`EventID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ieeeregistrations`
--

LOCK TABLES `ieeeregistrations` WRITE;
/*!40000 ALTER TABLE `ieeeregistrations` DISABLE KEYS */;
INSERT INTO `ieeeregistrations` VALUES (1,1,'2025-04-10 15:38:34','Pending','23p61a1262@vbithyd.ac.in','Ajay','6978544787','IT','2','A','holi','23P61A1262');
/*!40000 ALTER TABLE `ieeeregistrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ieteevents`
--

DROP TABLE IF EXISTS `ieteevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ieteevents` (
  `EventID` int NOT NULL AUTO_INCREMENT,
  `EventName` varchar(100) NOT NULL,
  `Description` text,
  `EventDate` date NOT NULL,
  `StartTime` time NOT NULL,
  `EndTime` time NOT NULL,
  `Location` varchar(255) NOT NULL,
  `TotalSeats` int NOT NULL,
  `AvailableSeats` int NOT NULL,
  `OrganizerID` int DEFAULT NULL,
  PRIMARY KEY (`EventID`),
  KEY `OrganizerID` (`OrganizerID`),
  CONSTRAINT `ieteevents_ibfk_1` FOREIGN KEY (`OrganizerID`) REFERENCES `admins` (`AdminID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ieteevents`
--

LOCK TABLES `ieteevents` WRITE;
/*!40000 ALTER TABLE `ieteevents` DISABLE KEYS */;
INSERT INTO `ieteevents` VALUES (1,'rangoli','colourful','2025-04-17','11:43:00','04:22:00','hyderabad',300,120,1);
/*!40000 ALTER TABLE `ieteevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ieteregistrations`
--

DROP TABLE IF EXISTS `ieteregistrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ieteregistrations` (
  `RegistrationID` int NOT NULL AUTO_INCREMENT,
  `EventID` int DEFAULT NULL,
  `RegistrationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Status` enum('Pending','Confirmed','Cancelled') DEFAULT 'Pending',
  `Email` varchar(255) NOT NULL,
  `FullName` varchar(255) NOT NULL,
  `Phone_Number` varchar(15) NOT NULL,
  `Department` varchar(100) NOT NULL,
  `Year` varchar(100) NOT NULL,
  `Section` varchar(50) NOT NULL,
  `EventName` varchar(255) NOT NULL,
  `StudentID` varchar(100) NOT NULL,
  PRIMARY KEY (`RegistrationID`),
  UNIQUE KEY `StudentID` (`StudentID`),
  KEY `EventID` (`EventID`),
  CONSTRAINT `ieteregistrations_ibfk_1` FOREIGN KEY (`EventID`) REFERENCES `codingstudioevents` (`EventID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ieteregistrations`
--

LOCK TABLES `ieteregistrations` WRITE;
/*!40000 ALTER TABLE `ieteregistrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ieteregistrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nonpaymentregistrations`
--

DROP TABLE IF EXISTS `nonpaymentregistrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nonpaymentregistrations` (
  `NonPaymentRegistrationID` int NOT NULL AUTO_INCREMENT,
  `StudentID` varchar(100) DEFAULT NULL,
  `EventID` int DEFAULT NULL,
  `RegistrationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Status` enum('Pending','Confirmed','Cancelled') DEFAULT 'Pending',
  PRIMARY KEY (`NonPaymentRegistrationID`),
  KEY `EventID` (`EventID`),
  KEY `StudentID` (`StudentID`),
  CONSTRAINT `nonpaymentregistrations_ibfk_2` FOREIGN KEY (`EventID`) REFERENCES `vitarkaevents` (`EventID`),
  CONSTRAINT `nonpaymentregistrations_ibfk_3` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nonpaymentregistrations`
--

LOCK TABLES `nonpaymentregistrations` WRITE;
/*!40000 ALTER TABLE `nonpaymentregistrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `nonpaymentregistrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `PaymentID` int NOT NULL AUTO_INCREMENT,
  `RegistrationID` int DEFAULT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `PaymentStatus` enum('Pending','Completed','Failed') DEFAULT 'Pending',
  `PaymentDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `TransactionID` varchar(100) NOT NULL,
  PRIMARY KEY (`PaymentID`),
  UNIQUE KEY `TransactionID` (`TransactionID`),
  KEY `RegistrationID` (`RegistrationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shrishtievents`
--

DROP TABLE IF EXISTS `shrishtievents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shrishtievents` (
  `EventID` int NOT NULL AUTO_INCREMENT,
  `EventName` varchar(100) NOT NULL,
  `Description` text,
  `EventDate` date NOT NULL,
  `StartTime` time NOT NULL,
  `EndTime` time NOT NULL,
  `Location` varchar(255) NOT NULL,
  `TotalSeats` int NOT NULL,
  `AvailableSeats` int NOT NULL,
  `OrganizerID` int DEFAULT NULL,
  PRIMARY KEY (`EventID`),
  KEY `OrganizerID` (`OrganizerID`),
  CONSTRAINT `shrishtievents_ibfk_1` FOREIGN KEY (`OrganizerID`) REFERENCES `admins` (`AdminID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shrishtievents`
--

LOCK TABLES `shrishtievents` WRITE;
/*!40000 ALTER TABLE `shrishtievents` DISABLE KEYS */;
INSERT INTO `shrishtievents` VALUES (1,'dusshera','festival','2025-04-02','01:43:00','23:40:00','karimnagar',500,300,1);
/*!40000 ALTER TABLE `shrishtievents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shrishtiregistrations`
--

DROP TABLE IF EXISTS `shrishtiregistrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shrishtiregistrations` (
  `RegistrationID` int NOT NULL AUTO_INCREMENT,
  `EventID` int DEFAULT NULL,
  `RegistrationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Status` enum('Pending','Confirmed','Cancelled') DEFAULT 'Pending',
  `Email` varchar(255) NOT NULL,
  `FullName` varchar(255) NOT NULL,
  `Phone_Number` varchar(15) NOT NULL,
  `Department` varchar(100) NOT NULL,
  `Year` varchar(100) NOT NULL,
  `Section` varchar(50) NOT NULL,
  `EventName` varchar(255) NOT NULL,
  `StudentID` varchar(100) NOT NULL,
  PRIMARY KEY (`RegistrationID`),
  UNIQUE KEY `StudentID` (`StudentID`),
  KEY `EventID` (`EventID`),
  CONSTRAINT `shrishtiregistrations_ibfk_1` FOREIGN KEY (`EventID`) REFERENCES `codingstudioevents` (`EventID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shrishtiregistrations`
--

LOCK TABLES `shrishtiregistrations` WRITE;
/*!40000 ALTER TABLE `shrishtiregistrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `shrishtiregistrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `StudentID` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Department` varchar(50) DEFAULT NULL,
  `Year` int DEFAULT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `EventID` int DEFAULT NULL,
  `FullName` varchar(200) NOT NULL,
  `Phone_Number` varchar(100) DEFAULT NULL,
  `section` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`StudentID`),
  UNIQUE KEY `Email` (`Email`),
  KEY `EventID` (`EventID`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`EventID`) REFERENCES `vitarkaevents` (`EventID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES ('23P61A1202','23p61a1202@gmail.com','IT',2,'2025-04-01 07:54:09',NULL,'Rithvik Aavula','7569394968','A');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virinchievents`
--

DROP TABLE IF EXISTS `virinchievents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `virinchievents` (
  `EventID` int NOT NULL AUTO_INCREMENT,
  `EventName` varchar(100) NOT NULL,
  `Description` text,
  `EventDate` date NOT NULL,
  `StartTime` time NOT NULL,
  `EndTime` time NOT NULL,
  `Location` varchar(255) NOT NULL,
  `TotalSeats` int NOT NULL,
  `AvailableSeats` int NOT NULL,
  `OrganizerID` int DEFAULT NULL,
  PRIMARY KEY (`EventID`),
  KEY `OrganizerID` (`OrganizerID`),
  CONSTRAINT `virinchievents_ibfk_1` FOREIGN KEY (`OrganizerID`) REFERENCES `admins` (`AdminID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virinchievents`
--

LOCK TABLES `virinchievents` WRITE;
/*!40000 ALTER TABLE `virinchievents` DISABLE KEYS */;
INSERT INTO `virinchievents` VALUES (1,'vinayaka chavithi','fest','2025-04-02','22:41:00','22:41:00','hyd',600,400,1);
/*!40000 ALTER TABLE `virinchievents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virinchiregistrations`
--

DROP TABLE IF EXISTS `virinchiregistrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `virinchiregistrations` (
  `RegistrationID` int NOT NULL AUTO_INCREMENT,
  `EventID` int DEFAULT NULL,
  `RegistrationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Status` enum('Pending','Confirmed','Cancelled') DEFAULT 'Confirmed',
  `Email` varchar(255) NOT NULL,
  `FullName` varchar(255) NOT NULL,
  `Phone_Number` varchar(15) NOT NULL,
  `Department` varchar(100) NOT NULL,
  `Year` varchar(100) NOT NULL,
  `Section` varchar(50) NOT NULL,
  `EventName` varchar(255) NOT NULL,
  `StudentID` varchar(100) NOT NULL,
  PRIMARY KEY (`RegistrationID`),
  UNIQUE KEY `StudentID` (`StudentID`),
  KEY `EventID` (`EventID`),
  CONSTRAINT `virinchiregistrations_ibfk_1` FOREIGN KEY (`EventID`) REFERENCES `codingstudioevents` (`EventID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virinchiregistrations`
--

LOCK TABLES `virinchiregistrations` WRITE;
/*!40000 ALTER TABLE `virinchiregistrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `virinchiregistrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vitarkaevents`
--

DROP TABLE IF EXISTS `vitarkaevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vitarkaevents` (
  `EventID` int NOT NULL AUTO_INCREMENT,
  `EventName` varchar(100) NOT NULL,
  `Description` text,
  `EventDate` date NOT NULL,
  `StartTime` time NOT NULL,
  `EndTime` time NOT NULL,
  `Location` varchar(255) NOT NULL,
  `TotalSeats` int NOT NULL,
  `AvailableSeats` int NOT NULL,
  `OrganizerID` int DEFAULT NULL,
  PRIMARY KEY (`EventID`),
  KEY `OrganizerID` (`OrganizerID`),
  CONSTRAINT `vitarkaevents_ibfk_1` FOREIGN KEY (`OrganizerID`) REFERENCES `admins` (`AdminID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vitarkaevents`
--

LOCK TABLES `vitarkaevents` WRITE;
/*!40000 ALTER TABLE `vitarkaevents` DISABLE KEYS */;
INSERT INTO `vitarkaevents` VALUES (3,'Gen AI Hackathon','Building Generative AI projects for respective problem statements.','2025-04-08','10:30:00','14:20:00','Nalanda Auditorium',50,30,2),(6,'Avishkar 2K25','Bringing Brilliant minds with innovative thoughts.','2025-04-30','10:30:00','14:20:00','Nalanda Auditorium',50,50,1),(8,'Tech Fest','All type of tech projects are welcomed','2025-05-12','10:30:00','16:20:00','Nalanda Auditorium',100,100,2);
/*!40000 ALTER TABLE `vitarkaevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vitarkanotifications`
--

DROP TABLE IF EXISTS `vitarkanotifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vitarkanotifications` (
  `NotificationID` int NOT NULL AUTO_INCREMENT,
  `StudentID` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Message` text,
  `Timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`NotificationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vitarkanotifications`
--

LOCK TABLES `vitarkanotifications` WRITE;
/*!40000 ALTER TABLE `vitarkanotifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `vitarkanotifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vitarkaregistrations`
--

DROP TABLE IF EXISTS `vitarkaregistrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vitarkaregistrations` (
  `RegistrationID` int NOT NULL AUTO_INCREMENT,
  `EventID` int DEFAULT NULL,
  `RegistrationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Status` enum('Pending','Confirmed','Cancelled') DEFAULT 'Pending',
  `Email` varchar(255) NOT NULL,
  `FullName` varchar(255) NOT NULL,
  `Phone_Number` varchar(15) NOT NULL,
  `Department` varchar(100) NOT NULL,
  `Year` varchar(100) NOT NULL,
  `Section` varchar(50) NOT NULL,
  `EventName` varchar(255) NOT NULL,
  `StudentID` varchar(100) NOT NULL,
  PRIMARY KEY (`RegistrationID`),
  UNIQUE KEY `StudentID` (`StudentID`),
  KEY `EventID` (`EventID`),
  CONSTRAINT `vitarkaregistrations_ibfk_1` FOREIGN KEY (`EventID`) REFERENCES `vitarkaevents` (`EventID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vitarkaregistrations`
--

LOCK TABLES `vitarkaregistrations` WRITE;
/*!40000 ALTER TABLE `vitarkaregistrations` DISABLE KEYS */;
INSERT INTO `vitarkaregistrations` VALUES (1,3,'2025-04-24 15:46:38','Pending','23p61a1202@vbithyd.ac.in','Rithvik Aavula','7569394968','IT','2','A','Gen AI Hackathon','23p61a1202');
/*!40000 ALTER TABLE `vitarkaregistrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-26 16:37:56
