-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: localhost    Database: travel app
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `bank_account`
--

DROP TABLE IF EXISTS `bank_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_account` (
  `bankid` int NOT NULL AUTO_INCREMENT,
  `user_loginid` int NOT NULL,
  `bankname` varchar(50) NOT NULL,
  `ifsc` varchar(50) NOT NULL,
  `keyno` varchar(50) NOT NULL,
  `accountno` bigint NOT NULL,
  `cash` varchar(50) NOT NULL,
  PRIMARY KEY (`bankid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_account`
--

LOCK TABLES `bank_account` WRITE;
/*!40000 ALTER TABLE `bank_account` DISABLE KEYS */;
INSERT INTO `bank_account` VALUES (1,2,'canara','qw123','123456',123456789,'84600'),(2,76,'punjab','qw123','123456',123456789,'200000');
/*!40000 ALTER TABLE `bank_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog` (
  `blog_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `blog` varchar(500) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `date` varchar(45) NOT NULL,
  PRIMARY KEY (`blog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (1,2,'new blogjkjjjjjgugufyfyfyf7f7f7f7f7f7f7f7f7f7f7f7f7f7f7g8g8g8f8g8g8gxg8g8g8g8gg8g8','IMG-20201130-WA0395.jpg','2022-04-26'),(2,2,'jhjjjjjgg','IMG-20201130-WA0382.jpg','2022-04-26'),(3,2,'fgg','IMG-20201130-WA0369.jpg','2022-04-26'),(4,2,'fgg','IMG-20201130-WA0369.jpg','2022-04-26'),(5,2,'fgg','IMG-20201130-WA0381.jpg','2022-04-26'),(6,2,'baba','IMG-20201130-WA0381.jpg','2022-04-26'),(7,2,'yfogyffo','IMG-20201130-WA0402.jpg','2022-04-26'),(8,2,'gggh','IMG-20201130-WA0402.jpg','2022-04-26'),(9,2,'idtdit','IMG-20201130-WA0399.jpg','2022-04-26');
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat` (
  `chat_id` int NOT NULL AUTO_INCREMENT,
  `to_id` int NOT NULL,
  `date_time` datetime NOT NULL,
  `message` varchar(50) NOT NULL,
  `from_id` int NOT NULL,
  PRIMARY KEY (`chat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` VALUES (1,2,'2022-02-09 00:00:00','HaI ',3),(2,2,'2022-02-09 00:00:00','What about the payment',3),(3,3,'2022-02-09 00:00:00','ok paid',2),(4,9,'2022-04-22 00:00:00','ghhj',2),(5,3,'2022-04-22 00:00:00','hjj',2),(6,16,'2022-04-22 00:00:00','hai',7),(7,7,'2022-04-22 00:00:00','Is it available now?',16),(8,16,'2022-04-22 00:00:00','hai',7),(9,16,'2022-04-22 00:00:00','sure',7),(10,16,'2022-04-22 00:00:00','hai, this is akmal, how was Munnar?',2);
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `user_id` int NOT NULL,
  `comment` varchar(50) NOT NULL,
  `date` varchar(45) NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,1,2,'wowwww','2022-04-26'),(2,1,2,'wowwww','2022-04-26'),(3,1,2,'ygss','2022-04-26'),(4,1,2,'ygss','2022-04-26'),(5,1,2,'ygss','2022-04-26'),(6,1,2,'bbb','2022-04-26'),(7,1,2,'thu','2022-04-26'),(8,1,2,'hehwhjw','2022-04-26');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaints`
--

DROP TABLE IF EXISTS `complaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaints` (
  `complaint_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `complaint` varchar(30) NOT NULL,
  `date` date NOT NULL,
  `replay` varchar(30) NOT NULL,
  PRIMARY KEY (`complaint_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaints`
--

LOCK TABLES `complaints` WRITE;
/*!40000 ALTER TABLE `complaints` DISABLE KEYS */;
INSERT INTO `complaints` VALUES (1,3,'we need some update in UI','2022-04-22','Pending'),(2,3,'Repeating customer problem','2022-04-22','Pending'),(3,3,'New feature request','2022-04-22','thank you for contacting us'),(4,4,'UI problem in complaint','2022-04-22','Pending'),(5,4,'update needed','2022-04-22','Pending'),(6,7,'UI is not good','2022-04-22','pending'),(7,7,'We need an update','2022-04-22','Thanks for your feedback'),(8,7,'Web is running slow','2022-04-22','pending');
/*!40000 ALTER TABLE `complaints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `feedback_id` int NOT NULL AUTO_INCREMENT,
  `feedback` varchar(30) NOT NULL,
  `date` varchar(45) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'good','9-2-2022',2),(2,'igsitdit','2022-04-26',2),(3,'7r8yf865','2022-04-26',2);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel` (
  `hotel_id` int NOT NULL AUTO_INCREMENT,
  `hotel_login_id` int NOT NULL,
  `hotel_name` varchar(30) NOT NULL,
  `place` varchar(30) NOT NULL,
  `post` varchar(30) NOT NULL,
  `pin` int NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` bigint NOT NULL,
  `photo` varchar(200) NOT NULL,
  `type` varchar(30) NOT NULL,
  PRIMARY KEY (`hotel_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (1,6,'Radisson Blu Kochi','Kochi','Elamkulam',682020,'radissonblu@gmail.com',8138445500,'Swimming_Pool-497_comp.webp','5star'),(2,7,'Emarald Resort','Perintalmanna','Pulamanthole',679323,'emaraldresort@gmail.com',8138556600,'hotel2.webp','4star'),(3,8,'LeCandles Resorts','Kattangal','Kattangal',673601,'lecandlesresorts@gmail.com',8138667700,'hotel3.webp','4star'),(4,12,'Cherai Beach Resorts','Kochi','kochi',683514,'cherairesort@gmail.com',9645124482,'cherai.jpg','4star'),(5,13,'Taj Malabar Resort','Willingdon Island','kochi',682009,'tajmalabar@gmail.com',8138845540,'tajmalabar.jpg','3star'),(6,14,'Bolgatty Palace','Mulavukad','Kochi',682504,'bolgatty@gmail.com',7736085689,'bogatty.jpg','4star');
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotelpayment`
--

DROP TABLE IF EXISTS `hotelpayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotelpayment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `user_login_id` int NOT NULL,
  `room_id` int NOT NULL,
  `payment_details` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotelpayment`
--

LOCK TABLES `hotelpayment` WRITE;
/*!40000 ALTER TABLE `hotelpayment` DISABLE KEYS */;
INSERT INTO `hotelpayment` VALUES (1,2,1,'5400','paid','2022-04-26');
/*!40000 ALTER TABLE `hotelpayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `login_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `usertype` varchar(30) NOT NULL,
  PRIMARY KEY (`login_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'admin','admin','admin'),(2,'akmal','akmal','user'),(3,'mizero','mizero','travelagency'),(4,'thorop','thorop','travelagency'),(5,'jaiguru','jaiguru','travelagency'),(6,'radison','radison','hotel'),(7,'edmond','edmond','hotel'),(8,'LeCandles','LeCandles','hotel'),(9,'shuhaib','shuhqib','user'),(10,'atlas','atlas','travelagency'),(11,'flywell','flywell','travelagency'),(12,'cherai','cherai','hotel'),(13,'tajmalabar','tajmalabar','hotel'),(14,'bogatty','bolgatty','hotel'),(16,'antwi','antwi','user'),(17,'heritier','heritier','user');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packages` (
  `packages_id` int NOT NULL AUTO_INCREMENT,
  `travel_agency_login_id` int NOT NULL,
  `package_details` varchar(50) NOT NULL,
  `food_availability` varchar(50) NOT NULL,
  `rate` varchar(50) NOT NULL,
  PRIMARY KEY (`packages_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages`
--

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
INSERT INTO `packages` VALUES (1,3,'Munnar 3 day ','Yes','4000'),(2,3,'Kulu Manali \r\n8 days 9 Nights','Yes','10000'),(3,3,'Goa Package','No','5500'),(4,3,'Ghattu ghat','Yes','3999'),(5,3,'Shivapuri','Yes','1500');
/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packagesbooking`
--

DROP TABLE IF EXISTS `packagesbooking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packagesbooking` (
  `packages_booking_id` int NOT NULL AUTO_INCREMENT,
  `packages_id` int NOT NULL,
  `user_login_id` int NOT NULL,
  `date` varchar(45) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`packages_booking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packagesbooking`
--

LOCK TABLES `packagesbooking` WRITE;
/*!40000 ALTER TABLE `packagesbooking` DISABLE KEYS */;
INSERT INTO `packagesbooking` VALUES (1,2,2,'9-2-2022','paid'),(2,1,2,'9-2-2022','pending'),(3,2,2,'30-4-2022','pending'),(4,1,2,'26-6-2022','pending');
/*!40000 ALTER TABLE `packagesbooking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentdetails`
--

DROP TABLE IF EXISTS `paymentdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymentdetails` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `user_login_id` int NOT NULL,
  `package_id` int NOT NULL,
  `payment_details` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentdetails`
--

LOCK TABLES `paymentdetails` WRITE;
/*!40000 ALTER TABLE `paymentdetails` DISABLE KEYS */;
INSERT INTO `paymentdetails` VALUES (1,2,1,'10000','paid','2022-04-26');
/*!40000 ALTER TABLE `paymentdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place`
--

DROP TABLE IF EXISTS `place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `place` (
  `place_id` int NOT NULL AUTO_INCREMENT,
  `agency_login_id` int NOT NULL,
  `place` varchar(30) NOT NULL,
  `latitude` varchar(30) NOT NULL,
  `longitude` varchar(30) NOT NULL,
  `description` varchar(50) NOT NULL,
  `image` text NOT NULL,
  PRIMARY KEY (`place_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place`
--

LOCK TABLES `place` WRITE;
/*!40000 ALTER TABLE `place` DISABLE KEYS */;
INSERT INTO `place` VALUES (1,3,'Munnar','10.089167','77.0595','Good Place to Visit in Winter','munnar.jpg'),(2,3,'Cape Cost','5.1315','1.2795','Beach','cape.jpg'),(3,4,'valanchery','10.8878','76.0732','Town','WhatsApp_Image_2022-04-22_at_12.32.56_PM.jpeg'),(4,4,'Delhi','28.7041','77.1025','Capital of India','delhi.jpeg');
/*!40000 ALTER TABLE `place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `placerating`
--

DROP TABLE IF EXISTS `placerating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `placerating` (
  `place_rating_id` int NOT NULL AUTO_INCREMENT,
  `place_id` int NOT NULL,
  `user_id` int NOT NULL,
  `date` date NOT NULL,
  `rating` float NOT NULL,
  PRIMARY KEY (`place_rating_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `placerating`
--

LOCK TABLES `placerating` WRITE;
/*!40000 ALTER TABLE `placerating` DISABLE KEYS */;
INSERT INTO `placerating` VALUES (1,2,2,'2022-02-09',5),(2,2,2,'2022-02-09',5),(3,2,2,'2022-02-09',5),(4,2,2,'2022-02-09',5),(5,2,2,'2022-02-09',5),(6,2,2,'2022-02-09',5),(7,2,2,'2022-02-09',5),(8,2,2,'2022-02-09',3),(9,1,2,'2022-04-22',5),(10,4,2,'2022-04-22',5),(11,1,17,'2022-04-22',4.5),(12,4,17,'2022-04-22',4.5),(13,1,2,'2022-04-22',5),(14,3,2,'2022-04-23',2);
/*!40000 ALTER TABLE `placerating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `post_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `photo_video` varchar(50) NOT NULL,
  `post` varchar(100) NOT NULL,
  `date` varchar(45) NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,2,'FB_IMG_1647813724105.jpg','new post','2022-04-26'),(2,2,'IMG-20201130-WA0402.jpg','hai','2022-04-26'),(3,2,'IMG-20201130-WA0402.jpg','jxtdut','2022-04-26'),(4,2,'IMG-20201130-WA0369.jpg','hhhd','2022-04-26'),(5,2,'IMG-20201130-WA0382.jpg','y7d7t','2022-04-26');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `report_id` int NOT NULL AUTO_INCREMENT,
  `report` varchar(50) NOT NULL,
  `trave_hotel_login_id` int NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES (1,'report_sample.png',3,'2022-04-22'),(2,'report_sample.png',4,'2022-04-22'),(3,'report_sample.png',7,'2022-04-22'),(4,'report_sample.png',6,'2022-04-22');
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roombooking`
--

DROP TABLE IF EXISTS `roombooking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roombooking` (
  `room_booking_id` int NOT NULL AUTO_INCREMENT,
  `room_id` int NOT NULL,
  `user_login_id` int NOT NULL,
  `status` varchar(50) NOT NULL,
  `date` varchar(45) NOT NULL,
  PRIMARY KEY (`room_booking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roombooking`
--

LOCK TABLES `roombooking` WRITE;
/*!40000 ALTER TABLE `roombooking` DISABLE KEYS */;
INSERT INTO `roombooking` VALUES (1,2,2,'paid','22-4-2022'),(2,1,17,'pending','23-4-2022'),(3,2,2,'pending','20-5-2022'),(4,3,16,'pending','16-5-2022'),(5,1,2,'pending','18-5-2022'),(6,3,2,'pending','30-4-2022'),(7,1,2,'pending','30-4-2022');
/*!40000 ALTER TABLE `roombooking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomdetails`
--

DROP TABLE IF EXISTS `roomdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roomdetails` (
  `room_id` int NOT NULL AUTO_INCREMENT,
  `hotel_login_id` int NOT NULL,
  `room_details` varchar(50) NOT NULL,
  `price` varchar(50) NOT NULL,
  `a/c_type` varchar(50) NOT NULL,
  `bed_type` varchar(50) NOT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomdetails`
--

LOCK TABLES `roomdetails` WRITE;
/*!40000 ALTER TABLE `roomdetails` DISABLE KEYS */;
INSERT INTO `roomdetails` VALUES (1,7,'Resort in Munnar','5400','A/C',' single'),(2,7,'Resort in Wayand','5400','NonA/C','double'),(3,7,'Presidential suit in Kozhikode','10000','NonA/C','3 bedrooms'),(4,7,'Suite in kochi','4000','NonA/C','2 bedroom');
/*!40000 ALTER TABLE `roomdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelagencies`
--

DROP TABLE IF EXISTS `travelagencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travelagencies` (
  `travel_agency_id` int NOT NULL AUTO_INCREMENT,
  `agency_login_id` int NOT NULL,
  `agency_name` varchar(30) NOT NULL,
  `place` varchar(30) NOT NULL,
  `post` varchar(30) NOT NULL,
  `pin` int NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` bigint NOT NULL,
  PRIMARY KEY (`travel_agency_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelagencies`
--

LOCK TABLES `travelagencies` WRITE;
/*!40000 ALTER TABLE `travelagencies` DISABLE KEYS */;
INSERT INTO `travelagencies` VALUES (1,3,'Akbar Travels','Valanchery','Valanchery',676552,'akbartravels@gmail.com',8138112200),(2,4,'Thorop holidays','Thiruvegappura','Thiruvegappura',679304,'thorop@gmail.com',8138223300),(3,5,'Jai Guru','Thrissur','Thrissur',620680,'jaiguru@gmail.com',8138334400),(4,10,'Atlas tours and travels','kochi','kochi',682005,'atlas@gmail.com',9895265429),(5,11,'Flywell Tours and Travels','Ernakulam','Kochi',682015,'flywelltours@gmail.com',9388332255);
/*!40000 ALTER TABLE `travelagencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_certificate`
--

DROP TABLE IF EXISTS `user_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_certificate` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL,
  `certificate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_certificate`
--

LOCK TABLES `user_certificate` WRITE;
/*!40000 ALTER TABLE `user_certificate` DISABLE KEYS */;
INSERT INTO `user_certificate` VALUES (1,2,'20220207_134422.jpg'),(2,9,'Screenshot_20220327-114317_Instagram.jpg'),(3,17,'Covid_cer.jpg');
/*!40000 ALTER TABLE `user_certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_login_id` int NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `gender` varchar(30) NOT NULL,
  `dob` varchar(45) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone_no` bigint NOT NULL,
  `post` varchar(50) NOT NULL,
  `place` varchar(50) NOT NULL,
  `pin` bigint NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,2,'Mohammed','Akmal','MALE','5-9-2001','akmalmahmoodkinan@gmail.com',8138845540,'Thiruvegappura','Thiruvegappura',679304),(2,9,'Mohammed ','shuhaib','MALE','22-4-2022','shuhaib@gmail.com',9645124482,'Kolathoor','Kolathoor',679304),(3,16,'Edmond','Antwi','MALE','22-4-1995','edmermizero@gmail.com',7306619735,'Valanchery','Valanchery',676552),(4,17,'Mizero','Heritier','MALE','22-4-2022','hermizero@gmail.com',17736085689,'Valanchery','Valanchery',676555);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-26 17:19:24
