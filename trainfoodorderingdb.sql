/*
SQLyog Enterprise - MySQL GUI v8.18 
MySQL - 5.5.5-10.4.27-MariaDB : Database - trainfoodordering
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`trainfoodordering` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `trainfoodordering`;

/*Table structure for table `customers` */

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Mobile` varchar(15) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `current_in_date` timestamp NULL DEFAULT current_timestamp(),
  `Status` varchar(255) DEFAULT 'Active',
  PRIMARY KEY (`ID`,`Mobile`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `customers` */

insert  into `customers`(`ID`,`Name`,`Email`,`Mobile`,`Address`,`Password`,`current_in_date`,`Status`) values (1,'Mahesh','yp@gmail.com','4324234','Khandwa','123','2024-05-03 05:44:53','Active'),(2,'','','','Active','','2024-05-03 06:04:38','Active'),(3,'Yogesh','yogeshpatel31202@gmail.com','123','Khandwa','123','2024-05-03 06:06:36','Active'),(4,'Suresh','sp@gmail.com','65465654','Khandwa','25321','2024-05-03 06:08:11','Active');

/*Table structure for table `favourite` */

DROP TABLE IF EXISTS `favourite`;

CREATE TABLE `favourite` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerId` int(11) DEFAULT 0,
  `FoodId` int(11) DEFAULT 0,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `favourite` */

insert  into `favourite`(`Id`,`CustomerId`,`FoodId`) values (8,1,4),(13,1,5),(16,1,2),(17,3,1),(20,3,4),(21,3,3);

/*Table structure for table `fooditems` */

DROP TABLE IF EXISTS `fooditems`;

CREATE TABLE `fooditems` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Description` text DEFAULT NULL,
  `Price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `CategoryId` int(11) DEFAULT 0,
  `UserId` int(11) DEFAULT 0,
  `Status` varchar(255) DEFAULT 'Active',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `fooditems` */

insert  into `fooditems`(`Id`,`Name`,`Description`,`Price`,`CategoryId`,`UserId`,`Status`) values (1,'sub','Des','250.00',1,1,'Active'),(2,'sub11','Khandwa','200.00',6,1,'Active'),(3,'c1','de','200.00',3,1,'Active'),(4,'fasdfsd','dsfds','2442.00',3,1,'Active'),(5,'Electronic','sdfasdf','32432.00',3,1,'Active');

/*Table structure for table `item_categories_tb` */

DROP TABLE IF EXISTS `item_categories_tb`;

CREATE TABLE `item_categories_tb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id_fk` int(11) DEFAULT 0,
  `name` varchar(255) DEFAULT '',
  `status` varchar(255) DEFAULT 'Active',
  `current_in_date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `item_categories_tb` */

insert  into `item_categories_tb`(`id`,`user_id_fk`,`name`,`status`,`current_in_date`) values (1,1,'Cat','Active','2024-02-09 09:47:05'),(2,1,'Cat5','Active','2024-05-02 14:09:50'),(3,1,'Cat2','Active','2024-05-02 14:12:15'),(4,1,'Cat3','Active','2024-05-02 14:13:53'),(5,1,'Rakesh','Active','2024-05-02 14:14:35'),(6,1,'Cat11','Active','2024-05-02 14:19:36');

/*Table structure for table `orderitems` */

DROP TABLE IF EXISTS `orderitems`;

CREATE TABLE `orderitems` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `OrderID` int(11) NOT NULL DEFAULT 0,
  `FoodID` int(11) NOT NULL DEFAULT 0,
  `Name` varchar(255) DEFAULT '',
  `Quantity` float NOT NULL DEFAULT 0,
  `Price` float(10,2) DEFAULT 0.00,
  `Description` text NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `OrderID` (`OrderID`),
  KEY `FoodID` (`FoodID`),
  CONSTRAINT `orderitems_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`Id`),
  CONSTRAINT `orderitems_ibfk_2` FOREIGN KEY (`FoodID`) REFERENCES `fooditems` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `orderitems` */

insert  into `orderitems`(`Id`,`OrderID`,`FoodID`,`Name`,`Quantity`,`Price`,`Description`) values (1,7,4,'fasdfsd',3,2442.00,'dsfds'),(2,7,4,'fasdfsd',3,2442.00,'dsfds'),(3,8,1,'sub',2,250.00,'Des'),(4,8,2,'sub11',2,200.00,'Khandwa'),(5,9,4,'fasdfsd',1.5,2442.00,'dsfds'),(6,9,1,'sub',2,250.00,'Des'),(7,10,1,'sub',2,250.00,'Des'),(8,10,2,'sub11',3,200.00,'Khandwa'),(9,11,1,'sub',1,250.00,'Des'),(10,12,4,'fasdfsd',1,2442.00,'dsfds'),(11,13,4,'fasdfsd',1,2442.00,'dsfds'),(12,14,4,'fasdfsd',1,2442.00,'dsfds');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID` int(11) NOT NULL DEFAULT 0,
  `CustName` varchar(255) DEFAULT '',
  `CustMobile` varchar(255) DEFAULT '',
  `TrainID` int(11) NOT NULL DEFAULT 0,
  `TrainNo` int(11) DEFAULT 0,
  `OrderDateTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `TotalAmount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `PaidAmount` decimal(10,2) DEFAULT 0.00,
  `SheetNo` int(11) DEFAULT 0,
  `CoachNo` varchar(255) DEFAULT '',
  `Status` varchar(255) DEFAULT 'Pending',
  `Remark` text DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `CustomerID` (`CustomerID`),
  KEY `TrainID` (`TrainID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`ID`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`TrainID`) REFERENCES `trains` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `orders` */

insert  into `orders`(`Id`,`CustomerID`,`CustName`,`CustMobile`,`TrainID`,`TrainNo`,`OrderDateTime`,`TotalAmount`,`PaidAmount`,`SheetNo`,`CoachNo`,`Status`,`Remark`) values (6,1,'Demo','316687676',1,64564,'2024-05-03 00:00:58','0.00','150.00',22,'M2','Pending',''),(7,2,'Demo','316687676',1,64564,'2024-05-03 00:05:48','0.00','0.00',22,'M2','Pending',''),(8,2,'Demo','316687676',1,4234234,'2024-05-03 00:11:33','775.00','775.00',22,'M2','Complete',''),(9,3,'Demo','316687676',1,4234,'2024-05-03 00:13:02','4163.00','4163.00',22,'M2','Complete',''),(10,3,'Demo','316687676',1,64564,'2024-05-03 14:22:24','1100.00','1100.00',22,'M2','Failed',''),(11,3,'Yogesh','123',1,64564,'2024-05-03 17:43:49','250.00','250.00',22,'M2','Failed',''),(12,3,'Yogesh','123',1,64564,'2024-05-03 17:44:26','2442.00','2442.00',22,'M2','Failed','ok'),(13,3,'Yogesh','123',1,64564,'2024-05-03 17:47:47','2442.00','2442.00',22,'M2','Complete',''),(14,3,'Yogesh','123',1,64564,'2024-05-03 18:07:52','2442.00','0.00',22,'M2','Pending',NULL);

/*Table structure for table `trains` */

DROP TABLE IF EXISTS `trains`;

CREATE TABLE `trains` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `TrainNumber` varchar(20) NOT NULL,
  `DepartureStation` varchar(100) NOT NULL,
  `ArrivalStation` varchar(100) NOT NULL,
  `DepartureTime` varchar(255) NOT NULL,
  `ArrivalTime` varchar(255) NOT NULL,
  `UserId` int(11) NOT NULL DEFAULT 0,
  `Status` varchar(255) NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `TrainNumber` (`TrainNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `trains` */

insert  into `trains`(`Id`,`TrainNumber`,`DepartureStation`,`ArrivalStation`,`DepartureTime`,`ArrivalTime`,`UserId`,`Status`) values (1,'11023','Khandwa','Lucknow','15:35','16:35',1,'Active'),(3,'11020','Khandwa','Bhopal','03:35','14:35',1,'Active');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Mobile` varchar(15) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `users` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
