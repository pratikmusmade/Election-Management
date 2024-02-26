CREATE DATABASE  IF NOT EXISTS `voting_app` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `voting_app`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: voting_app
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `acc_year`
--

DROP TABLE IF EXISTS `acc_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acc_year` (
  `id` int NOT NULL AUTO_INCREMENT,
  `year_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_year`
--

LOCK TABLES `acc_year` WRITE;
/*!40000 ALTER TABLE `acc_year` DISABLE KEYS */;
INSERT INTO `acc_year` VALUES (1,'First Year'),(2,'Second Year'),(3,'Third Year'),(4,'Fourth Year'),(5,'fifthy');
/*!40000 ALTER TABLE `acc_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `id` int NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'Computer Sci'),(2,'Electrical Engineering'),(3,'Mechanical Engineering'),(4,'Civil Engineering'),(5,'Chemical Engineering');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidate`
--

DROP TABLE IF EXISTS `candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `election_id` int DEFAULT NULL,
  `partyName` varchar(255) DEFAULT NULL,
  `partySymbol` varchar(255) DEFAULT NULL,
  `slogan` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `candidate_constraint_cnt` (`student_id`,`election_id`),
  KEY `election_id` (`election_id`),
  CONSTRAINT `candidate_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  CONSTRAINT `candidate_ibfk_2` FOREIGN KEY (`election_id`) REFERENCES `election` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate`
--

LOCK TABLES `candidate` WRITE;
/*!40000 ALTER TABLE `candidate` DISABLE KEYS */;
INSERT INTO `candidate` VALUES (1,1,1,'Ach','../assets/images/GitHubIcon.png','jai jai'),(3,3,1,'Ach','../assets/images/wallpaperflare.com_wallpaper.jpg','Go Go'),(4,6,1,'ATP','../assets/images/black-clover-wallpaper-quotes-10.jpg','Permium Product'),(6,10,1,'Senu Warriors ','../assets/images/PraikProfile.jpeg','hu hu hu'),(8,8,1,'Ingenious','../assets/images/codingImg.jpg','Go Go'),(9,2,1,'Ingenious','../assets/images/codingImg.jpg','Go Go'),(11,4,1,'Ingenious','../assets/images/squareGear.jpg',''),(12,5,1,'Senu Warriors ','../assets/images/zoro.jpg','gogog'),(13,1,2,'Ingenious','../assets/images/GitHubIcon.png','2222'),(14,3,2,'Senu Warriors','../assets/images/black-clover-wallpaper-quotes-12.jpg','hu hu hu'),(15,7,1,'Ach','../assets/images/senu5.jpg','Go Go'),(16,1,4,'Ingenious','../assets/images/luffy-smile.jpg','code code');
/*!40000 ALTER TABLE `candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `election`
--

DROP TABLE IF EXISTS `election`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `election` (
  `id` int NOT NULL AUTO_INCREMENT,
  `election_name` varchar(255) NOT NULL,
  `election_status` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `election`
--

LOCK TABLES `election` WRITE;
/*!40000 ALTER TABLE `election` DISABLE KEYS */;
INSERT INTO `election` VALUES (1,'2023','Decom'),(2,'2024','Active'),(4,'2024 Summer','Active');
/*!40000 ALTER TABLE `election` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) NOT NULL,
  `middleName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `enrolment_number` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `student_image` varchar(255) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `branch_id` int DEFAULT NULL,
  `year_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enrolment_number` (`enrolment_number`),
  UNIQUE KEY `email` (`email`),
  KEY `branch_id` (`branch_id`),
  KEY `year_id` (`year_id`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`year_id`) REFERENCES `acc_year` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'John','Doe','Smith','77','Vaibhav Nagar Ganesh Chowk Latur','john.doe@example.com','password123','../assets/images/luffy.jpg','1234567890',1,1),(2,'Jane','Ella','Doe','EN54321','									456 Elm St, Town\r\n									','jane.doe@example.com','pass123','../assets/images/black-clover-wallpaper-quotes-12.jpg','9876543210',2,2),(3,'Michael','David','Brown','EN67890','								789 Oak St, Village\r\n								','michael.brown@example.com','securepass','../assets/images/wallpaperflare.com_wallpaper.jpg','1112223333',1,3),(4,'Emily','Grace','Johnson','EN98765','101 Pine St, Hamlet','emily.johnson@example.com','pass456','image4.jpg','4445556666',2,4),(5,'Alice','Marie','Johnson','EN24680','234 Cedar St, Town','alice.johnson@example.com','pass789','image5.jpg','7778889999',3,1),(6,'James','Robert','Williams','EN13579','								345 Maple St, City\r\n								','james.williams@example.com','pass987','../assets/images/7631461.jpg','2223334444',1,2),(7,'Sophia','Elizabeth','Brown','EN36912','456 Pine St, Village','sophia.brown@example.com','password456','image7.jpg','5556667777',3,3),(8,'Daniel','Joseph','Miller','EN57913','567 Elm St, Hamlet','daniel.miller@example.com','pass321','image8.jpg','8889990000',2,4),(9,'Olivia','Grace','Martinez','EN95173','678 Oak St, City','olivia.martinez@example.com','securepass123','image9.jpg','3334445555',1,1),(10,'William','Alexander','Taylor','EN24682','								789 Cedar St, Town\r\n								','william.taylor@example.com','password789','../assets/images/Untitled.png','6667778888',3,2),(14,'Shrinivas','g','Mate','EN123','Vaibhav Nagar Ganesh Chowk Latur','sdfghjk@gamil.com','Pooja@@123','../assets/images/PraikProfile.jpeg','1234567890',2,1);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vote`
--

DROP TABLE IF EXISTS `vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vote` (
  `id` int NOT NULL AUTO_INCREMENT,
  `voter_id` int DEFAULT NULL,
  `vote_to_candidate` int DEFAULT NULL,
  `election_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `voter_id` (`voter_id`,`election_id`),
  UNIQUE KEY `voter_id_2` (`voter_id`,`vote_to_candidate`,`election_id`),
  KEY `vote_to_candidate` (`vote_to_candidate`),
  KEY `election_id` (`election_id`),
  CONSTRAINT `vote_ibfk_1` FOREIGN KEY (`voter_id`) REFERENCES `student` (`id`),
  CONSTRAINT `vote_ibfk_2` FOREIGN KEY (`vote_to_candidate`) REFERENCES `candidate` (`id`),
  CONSTRAINT `vote_ibfk_3` FOREIGN KEY (`election_id`) REFERENCES `election` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vote`
--

LOCK TABLES `vote` WRITE;
/*!40000 ALTER TABLE `vote` DISABLE KEYS */;
INSERT INTO `vote` VALUES (1,1,6,1),(6,2,3,1),(11,3,6,1),(13,4,6,1),(32,4,14,2),(17,5,6,1),(26,5,14,2),(35,8,6,1),(41,8,14,2),(36,10,12,1),(38,10,14,2);
/*!40000 ALTER TABLE `vote` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-26 18:37:55
