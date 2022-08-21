/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 5.5.20-log : Database - travel app
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`travel app` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `travel app`;

/*Table structure for table `bank_account` */

DROP TABLE IF EXISTS `bank_account`;

CREATE TABLE `bank_account` (
  `bankid` int(11) NOT NULL AUTO_INCREMENT,
  `user_loginid` int(11) NOT NULL,
  `bankname` varchar(50) NOT NULL,
  `ifsc` varchar(50) NOT NULL,
  `keyno` varchar(50) NOT NULL,
  `accountno` bigint(20) NOT NULL,
  `cash` varchar(50) NOT NULL,
  PRIMARY KEY (`bankid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `bank_account` */

insert  into `bank_account`(`bankid`,`user_loginid`,`bankname`,`ifsc`,`keyno`,`accountno`,`cash`) values 
(1,2,'canara','qw123','123456',123456789,'500000'),
(2,76,'punjab','qw123','123456',123456789,'200000');

/*Table structure for table `blog` */

DROP TABLE IF EXISTS `blog`;

CREATE TABLE `blog` (
  `blog_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `blog` varchar(500) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `date` varchar(45) NOT NULL,
  PRIMARY KEY (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `blog` */

/*Table structure for table `chat` */

DROP TABLE IF EXISTS `chat`;

CREATE TABLE `chat` (
  `chat_id` int(11) NOT NULL AUTO_INCREMENT,
  `to_id` int(11) NOT NULL,
  `date_time` datetime NOT NULL,
  `message` varchar(50) NOT NULL,
  `from_id` int(11) NOT NULL,
  PRIMARY KEY (`chat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `chat` */

insert  into `chat`(`chat_id`,`to_id`,`date_time`,`message`,`from_id`) values 
(1,2,'2022-02-09 00:00:00','HaI ',3),
(2,2,'2022-02-09 00:00:00','What about the payment',3),
(3,3,'2022-02-09 00:00:00','ok paid',2);

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` varchar(50) NOT NULL,
  `date` varchar(45) NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `comment` */

/*Table structure for table `complaints` */

DROP TABLE IF EXISTS `complaints`;

CREATE TABLE `complaints` (
  `complaint_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `complaint` varchar(30) NOT NULL,
  `date` date NOT NULL,
  `replay` varchar(30) NOT NULL,
  PRIMARY KEY (`complaint_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `complaints` */

insert  into `complaints`(`complaint_id`,`user_id`,`complaint`,`date`,`replay`) values 
(1,3,'This is small Complaint from A','2022-02-09','Pending');

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback` varchar(30) NOT NULL,
  `date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `feedback` */

/*Table structure for table `hotel` */

DROP TABLE IF EXISTS `hotel`;

CREATE TABLE `hotel` (
  `hotel_id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_login_id` int(11) NOT NULL,
  `hotel_name` varchar(30) NOT NULL,
  `place` varchar(30) NOT NULL,
  `post` varchar(30) NOT NULL,
  `pin` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `type` varchar(30) NOT NULL,
  PRIMARY KEY (`hotel_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `hotel` */

insert  into `hotel`(`hotel_id`,`hotel_login_id`,`hotel_name`,`place`,`post`,`pin`,`email`,`phone`,`photo`,`type`) values 
(1,6,'Radisson Blu Kochi','Kochi','Elamkulam',682020,'radissonblu@gmail.com',8138445500,'Swimming_Pool-497_comp.webp','5star'),
(2,7,'Emarald Resort','Perintalmanna','Pulamanthole',679323,'emaraldresort@gmail.com',8138556600,'hotel2.webp','4star'),
(3,8,'LeCandles Resorts','Kattangal','Kattangal',673601,'lecandlesresorts@gmail.com',8138667700,'hotel3.webp','4star');

/*Table structure for table `hotelpayment` */

DROP TABLE IF EXISTS `hotelpayment`;

CREATE TABLE `hotelpayment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_login_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `payment_details` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `hotelpayment` */

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `usertype` varchar(30) NOT NULL,
  PRIMARY KEY (`login_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`usertype`) values 
(1,'admin','admin','admin'),
(2,'akmal','akmal','user'),
(3,'akbar','akbar','travelagency'),
(4,'thorop','thorop','travelagency'),
(5,'jaiguru','jaiguru','travelagency'),
(6,'radison','radison','hotel'),
(7,'emarald','emarald','hotel'),
(8,'LeCandles','LeCandles','hotel');

/*Table structure for table `packages` */

DROP TABLE IF EXISTS `packages`;

CREATE TABLE `packages` (
  `packages_id` int(11) NOT NULL AUTO_INCREMENT,
  `travel_agency_login_id` int(11) NOT NULL,
  `package_details` varchar(50) NOT NULL,
  `food_availability` varchar(50) NOT NULL,
  `rate` varchar(50) NOT NULL,
  PRIMARY KEY (`packages_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `packages` */

insert  into `packages`(`packages_id`,`travel_agency_login_id`,`package_details`,`food_availability`,`rate`) values 
(1,3,'Munnar 3 day','Yes','4000'),
(2,3,'Kulu Manali \r\n8 days 9 Nights','Yes','10000');

/*Table structure for table `packagesbooking` */

DROP TABLE IF EXISTS `packagesbooking`;

CREATE TABLE `packagesbooking` (
  `packages_booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `packages_id` int(11) NOT NULL,
  `user_login_id` int(11) NOT NULL,
  `date` varchar(45) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`packages_booking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `packagesbooking` */

insert  into `packagesbooking`(`packages_booking_id`,`packages_id`,`user_login_id`,`date`,`status`) values 
(1,2,2,'9-2-2022','accept'),
(2,1,2,'9-2-2022','pending');

/*Table structure for table `paymentdetails` */

DROP TABLE IF EXISTS `paymentdetails`;

CREATE TABLE `paymentdetails` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_login_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `payment_details` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `paymentdetails` */

/*Table structure for table `place` */

DROP TABLE IF EXISTS `place`;

CREATE TABLE `place` (
  `place_id` int(11) NOT NULL AUTO_INCREMENT,
  `agency_login_id` int(11) NOT NULL,
  `place` varchar(30) NOT NULL,
  `latitude` varchar(30) NOT NULL,
  `longitude` varchar(30) NOT NULL,
  `description` varchar(50) NOT NULL,
  `image` text NOT NULL,
  PRIMARY KEY (`place_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `place` */

insert  into `place`(`place_id`,`agency_login_id`,`place`,`latitude`,`longitude`,`description`,`image`) values 
(1,3,'Munnar','10.089167','77.0595','Good Place to Visit in Winter','munnar.jpg'),
(2,3,'Cape Cost','5.1315','1.2795','Beach','cape.jpg');

/*Table structure for table `placerating` */

DROP TABLE IF EXISTS `placerating`;

CREATE TABLE `placerating` (
  `place_rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `place_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `rating` float NOT NULL,
  PRIMARY KEY (`place_rating_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `placerating` */

insert  into `placerating`(`place_rating_id`,`place_id`,`user_id`,`date`,`rating`) values 
(1,2,2,'2022-02-09',5),
(2,2,2,'2022-02-09',5),
(3,2,2,'2022-02-09',5),
(4,2,2,'2022-02-09',5),
(5,2,2,'2022-02-09',5),
(6,2,2,'2022-02-09',5),
(7,2,2,'2022-02-09',5),
(8,2,2,'2022-02-09',3);

/*Table structure for table `post` */

DROP TABLE IF EXISTS `post`;

CREATE TABLE `post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `photo_video` varchar(50) NOT NULL,
  `post` varchar(100) NOT NULL,
  `date` varchar(45) NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `post` */

/*Table structure for table `report` */

DROP TABLE IF EXISTS `report`;

CREATE TABLE `report` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `report` varchar(50) NOT NULL,
  `trave_hotel_login_id` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `report` */

/*Table structure for table `roombooking` */

DROP TABLE IF EXISTS `roombooking`;

CREATE TABLE `roombooking` (
  `room_booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NOT NULL,
  `user_login_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `date` varchar(45) NOT NULL,
  PRIMARY KEY (`room_booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `roombooking` */

/*Table structure for table `roomdetails` */

DROP TABLE IF EXISTS `roomdetails`;

CREATE TABLE `roomdetails` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_login_id` int(11) NOT NULL,
  `room_details` varchar(50) NOT NULL,
  `price` varchar(50) NOT NULL,
  `a/c_type` varchar(50) NOT NULL,
  `bed_type` varchar(50) NOT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `roomdetails` */

insert  into `roomdetails`(`room_id`,`hotel_login_id`,`room_details`,`price`,`a/c_type`,`bed_type`) values 
(1,7,'Resort in Munnar','5400','A/C',' single'),
(2,7,'Resort in Wayand','5400','NonA/C','double');

/*Table structure for table `travelagencies` */

DROP TABLE IF EXISTS `travelagencies`;

CREATE TABLE `travelagencies` (
  `travel_agency_id` int(11) NOT NULL AUTO_INCREMENT,
  `agency_login_id` int(11) NOT NULL,
  `agency_name` varchar(30) NOT NULL,
  `place` varchar(30) NOT NULL,
  `post` varchar(30) NOT NULL,
  `pin` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` bigint(20) NOT NULL,
  PRIMARY KEY (`travel_agency_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `travelagencies` */

insert  into `travelagencies`(`travel_agency_id`,`agency_login_id`,`agency_name`,`place`,`post`,`pin`,`email`,`phone`) values 
(1,3,'Akbar Travels','Valanchery','Valanchery',676552,'akbartravels@gmail.com',8138112200),
(2,4,'Thorop holidays','Thiruvegappura','Thiruvegappura',679304,'thorop@gmail.com',8138223300),
(3,5,'Jai Guru','Thrissur','Thrissur',620680,'jaiguru@gmail.com',8138334400);

/*Table structure for table `user_certificate` */

DROP TABLE IF EXISTS `user_certificate`;

CREATE TABLE `user_certificate` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `certificate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `user_certificate` */

insert  into `user_certificate`(`cid`,`uid`,`certificate`) values 
(1,2,'20220207_134422.jpg');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_login_id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `gender` varchar(30) NOT NULL,
  `dob` varchar(45) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone_no` bigint(20) NOT NULL,
  `post` varchar(50) NOT NULL,
  `place` varchar(50) NOT NULL,
  `pin` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`user_id`,`user_login_id`,`first_name`,`last_name`,`gender`,`dob`,`email`,`phone_no`,`post`,`place`,`pin`) values 
(1,2,'Mohammed','Akmal','MALE','5-9-2001','akmalmahmoodkinan@gmail.com',8138845540,'Thiruvegappura','Thiruvegappura',679304);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
