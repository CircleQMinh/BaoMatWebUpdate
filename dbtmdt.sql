-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: dbthuongmaidientu
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `AccountID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Type` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `UserID` int NOT NULL,
  `Image` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`AccountID`),
  UNIQUE KEY `idAccount_UNIQUE` (`AccountID`),
  UNIQUE KEY `Username_UNIQUE` (`Username`),
  KEY `fk_account_employee1_idx` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (4,'employee4','675849','employee',12,'https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530494/account/emp_bz5vtq.jpg'),(6,'cus1','1','customer',6,'https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530493/account/emp2_cosm8k.jpg'),(7,'cus2','2','customer',7,'https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530493/account/emp2_cosm8k.jpg'),(8,'cus3','3','customer',8,'https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530493/account/emp2_cosm8k.jpg'),(9,'cus4','4','customer',9,'https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530493/account/emp2_cosm8k.jpg'),(10,'cus5','5','customer',10,'https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530493/account/emp2_cosm8k.jpg'),(12,'cus6','6','customer',11,'https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530493/account/emp2_cosm8k.jpg'),(13,'cus7','7','customer',12,'https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530493/account/emp2_cosm8k.jpg'),(14,'cus8','1234','customer',13,'https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530493/account/emp2_cosm8k.jpg'),(15,'admin','1','admin',1,'https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530493/account/emp2_cosm8k.jpg'),(16,'1','1','admin',2,'https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530493/account/emp2_cosm8k.jpg'),(29,'ngoc123','123','employee',1,'https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530494/account/emp_bz5vtq.jpg'),(30,'vinh123','123','employee',13,'https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530494/account/emp_bz5vtq.jpg'),(31,'dat1234','12345','employee',14,'https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530494/account/emp_bz5vtq.jpg'),(34,'khoa5647','123','employee',15,'https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530494/account/emp_bz5vtq.jpg'),(35,'type23','123','employee',16,'https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530494/account/emp_bz5vtq.jpg'),(36,'qwerty293','abc','employee',17,'https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530494/account/emp_bz5vtq.jpg'),(49,'eqweqwe','123','employee',18,'https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530494/account/emp_bz5vtq.jpg'),(50,'trungkien2035@gmail.com','123','customer',19,''),(51,'tron111','1','customer',20,''),(52,'cusxxx','123','customer',21,''),(53,'aaaa','1234','customer',22,''),(54,'khoaphan123','123456','customer',23,''),(55,'khoa719','thienhoan719','customer',24,''),(56,'cus123','123','customer',25,NULL),(57,'qqqq','123','customer',26,''),(58,'tan','123','customer',27,''),(59,'khoaphan123456','123456','customer',28,''),(60,'dat123456789','1','employee',19,'https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530494/account/emp_bz5vtq.jpg'),(61,'cus10000','1','customer',29,''),(62,'vtqminh','1234','customer',30,'');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `ID` int NOT NULL,
  `Name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Email` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Sex` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Quang','65748930','q@gmail.com','Nam'),(2,'Hoàng','h@gmail.com','283475','Nam');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog` (
  `BlogID` int NOT NULL AUTO_INCREMENT,
  `BlogName` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `BlogContent` varchar(10000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Synopsis` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`BlogID`),
  UNIQUE KEY `BlogID_UNIQUE` (`BlogID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (4,'Bài thuốc nam hiệu quả tháng 7','','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1608567411/product/blog/4_pq4jwt.jpg'),(5,'Tác dụng của đông trùng hạ thảo',NULL,'https://res.cloudinary.com/dkmk9tdwx/image/upload/v1608567403/product/blog/5_gjjvuv.jpg'),(6,'Tác dụng của nghệ tươi',NULL,'https://res.cloudinary.com/dkmk9tdwx/image/upload/v1608567404/product/blog/6_vzhe7m.png'),(7,'Ngày thầy thuốc Việt Nam',NULL,'https://res.cloudinary.com/dkmk9tdwx/image/upload/v1608567405/product/blog/7_qnq8ky.jpg');
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `CustomerName` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Address` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Sex` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Money` int DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `CustomerID_UNIQUE` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (6,'Nguyễn Văn Tèo','TPHCM','0399469372','nvh@gmail.com','Nam',764000),(7,'Trương Tuấn Kiệt','Bình Định','0913649778','ttk@gmail.com','Nam',1788000),(8,'Phạm Hồng Nhung','Tiền Giang','0945689795','phn@gmail.com','Nữ',2900000),(9,'Nguyễn Thị Tuyết Nhi','Cần Thơ','0129479623','nttn@gmail.com','Nữ',4000000),(10,'Trần Thị Thu Vân','An Giang','0839897664','tttv@gmail.com','Nữ',2000000),(11,'Trương Hoài Thu','Bà Rịa','0272659945','tht@gmail.com','Nữ',1000000),(12,'Lê Quốc Anh','Đồng Nai','0936564892','lqa@gmail.com','Nam',1000000),(13,'Dương Thanh Duy','Long An','0127989862','dtd@gmail.com','Nam',1000000),(14,'Nty','EEEWWW','123123123','qwe@gmail.com','Nam',1000000),(19,'qwe','qwe','1231231235','qwe@asd','Nam',0),(20,'Minh','HCM','1234567890','18110320@student.hcmute.edu.vn','Nam',0),(21,'nhật minh','address','0377460828','18110318@student.hcmute.edu.vn','Nam',1),(22,'Vinh','LA','01264985652','18110394@student.hcmute.edu.vn','Nam',0),(23,'Khoa Phan','484 Lê Văn Việt','0399469372','Khoagooner@gmail.com','Nam',0),(24,'Phan Duy Khoa','484, Lê Văn Việt','0399469372','phanduykhoa7198@gmail.com','Nam',0),(25,'test','abc','123','123','Nam',5000),(26,'vinh','LA','01264985652','xvkieu@gmail.com','Nam',0),(27,'Tan','Dak Ha','84092919413','superjunior242@gmail.com','Nam',0),(28,'Phan Duy Khoa','484, Lê Văn Việt','0399469372','phanduykhoa0504@gmail.com','Nam',0),(29,'Đông','Nhà ở Quận Cam','0980989289','kunproabc@gmail.com','Nam',0),(30,'Minh Mâm','38 HCM','0289833700','quocminh.vutran3105@gmail.com','Nam',0);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `EmployeeID` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Address` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `EmployeeName` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Sex` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Salary` int DEFAULT NULL,
  `Paycheck` date DEFAULT NULL,
  `Workdate` int DEFAULT NULL,
  `LastAtt` date DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE KEY `EmployeeID_UNIQUE` (`EmployeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'n@gmail.com','123456789','Cần Thơ','Ngọc Ngọc','Nữ',123456,'2021-02-20',1,'2021-01-22'),(12,'cbhtt@gmail.com','0127897540','Bà Rịa','Tâm','Nữ',8500000,'2021-02-18',0,'2021-01-02'),(13,'xvkiew2u@gmail.com','090387966','Long An','Vinh Xô','Nam',10000000,'2021-01-22',1,'2021-01-19'),(14,'poit@gmail.com','0168799513','Vũng Tàu','Đạt','Nam',10000000,'2021-01-22',1,'2021-01-19'),(15,'lkmt@gmail.com','0129578984','DakLak','Khoa','Nam',9000000,'2021-01-22',0,'2020-12-23'),(16,'ccma65@gmail.com','0837669794','Lâm Đồng','An','Nữ',9000000,'2021-01-22',0,'2020-12-23'),(17,'kttv@gmail.com','0272696779','Tiền Giang','Trọng','Nam',7500000,'2021-01-22',0,'2020-12-23'),(18,'pdkhoa@gmail.com','0833656975','Cần Thơ','Khoa','Nam',5000000,'2021-01-22',1,'2020-12-23'),(19,'letandat0380@gmail.com','0165879465','Hà Nội','Đạt','Nam',9750000,'2021-01-22',1,'2020-12-23'),(20,'ttdong@gmail.com','0145689792','Đồng Nai','Đông','Nam',15000000,'2020-12-01',22,'2020-12-23'),(21,'vtqm@gmail.com','0126598420','Bình Dương','Minh','Nam',15000000,'2020-12-31',22,'2020-12-23'),(22,'kxv@gmail.com','0943569792','Long An','Vinh','Nam',12000000,'2021-01-22',0,'2020-12-23'),(23,'lth@gmail.com','0913697975','Bình Phước','Hải','Nam',7750000,'2021-01-22',0,'2020-12-23'),(24,'ctnlv@gmail.com','0916597852','TPHCM','Nhi','Nữ',10500000,'2021-01-22',0,'2020-12-23'),(25,'ptth@gmail.com','0156978741','Cần Thơ 123','Hân','Nữ',123,'2020-12-31',24,'2020-12-15'),(26,'ntyn@gmail.com','0837986551','Bình Định','Ngọc','Nữ',7900000,'2021-01-14',0,'2020-12-15'),(27,'t@gmail.com','123456789','HCM','Toàn Tình','Nam',12345,'2021-01-09',2,'2020-12-15'),(34,'qwe@gmail.com','123456789','EEE','Tuấn','Nam',123,'2021-01-22',0,'2020-12-22'),(35,'qwe@gmail.com','123456789','EEE','Tuấn','Nam',123,'2021-01-22',0,'2020-12-22'),(36,'qwe@gmail.com','123456789','EEE','Tuấn','Nam',123,'2021-01-22',0,'2020-12-22'),(37,'qwe@gmail.com','123456789','EEEqwe','Tuấn','Nam',123,'2021-01-22',0,'2020-12-22'),(38,'qwe@gmail.com','123456789','EEE','Tuấn','Nam',123,'2021-01-22',0,'2020-12-22'),(40,'khoagooner@gmail.com','0399469372','484 Lê Văn việt','Phan Duy Khoa','Nam',12345,'2021-02-18',0,'2021-01-18'),(42,'rton@gmail.com','1234567890','address','Toản Toản','Nam',12345,'2021-02-19',0,'2021-01-19'),(43,'khoagooner@gmail.com','0399469372','878787','Phan Duy Khoa 18110307','Nam',12345,'2021-02-20',0,'2021-01-20');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `OrderDate` datetime DEFAULT NULL,
  `RequiredDate` datetime DEFAULT NULL,
  `ShippedDate` datetime DEFAULT NULL,
  `Status` int DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  `OrderName` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `OrderAdress` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `OrderPhone` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `OrderEmail` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ShipperID` int DEFAULT NULL,
  `PaymentType` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Note` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  UNIQUE KEY `OrderID_UNIQUE` (`OrderID`),
  KEY `FK_Cus_Ord_idx` (`CustomerID`),
  CONSTRAINT `FK_Cus_Ord` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (8,'2020-02-17 00:00:00','2020-02-18 00:00:00',NULL,6,9,'Hóa đơn 8','1 Võ Văn Ngân','0325481232','hanphong@gmail.com',14,'bank','123456'),(10,'2020-07-19 00:00:00','2020-07-22 00:00:00','2020-12-28 15:22:25',4,10,'Hóa đơn 10','2 Võ Văn Ngân','0325998752','anhong@gmail.com',1,'cash',NULL),(11,'2020-06-11 00:00:00','2020-06-11 00:00:00','2021-01-22 06:30:58',4,13,'Hóa đơn 11','3 Võ Văn Ngân','0325414578','anthhong@gmail.com',1,'cash',NULL),(12,'2020-04-13 00:00:00','2020-04-15 00:00:00','2021-01-08 11:28:43',4,12,'Hóa đơn 12','4 Võ Văn Ngân','0325490125','ddanphong@gmail.com',13,'cash',NULL),(14,'2020-11-13 00:00:00','2020-11-15 00:00:00',NULL,6,6,'Hóa đơn 14','6 Võ Văn Ngân','0325422222','asdnphong@gmail.com',NULL,'cash','Khách hủy đơn hàng'),(17,'2020-08-09 00:00:00','2020-08-12 00:00:00',NULL,6,12,'Hóa đơn 17','9 Võ Văn Ngân','0328415121','anphonggg12@gmail.com',1,'cash','Khách hủy đơn hàng'),(21,'2020-04-13 00:00:00','2020-04-17 00:00:00','2021-01-21 05:11:22',4,8,'Hóa đơn 21','10 Võ Văn Ngân','0321326481','anhptphong@gmail.com',13,'cash','111'),(22,'2020-04-13 00:00:00','2020-04-17 00:00:00',NULL,3,9,'Hóa đơn 22','10 Võ Văn Ngân','0321326481','anhptphong@gmail.com',1,'cash','Không có ghi chú'),(23,'2020-04-13 00:00:00','2020-04-17 00:00:00',NULL,1,10,'Hóa đơn 23','10 Võ Văn Ngân','0321326481','anhptphong@gmail.com',NULL,'cash',NULL),(24,'2020-04-13 00:00:00','2020-04-17 00:00:00','2021-01-20 15:52:22',4,11,'Hóa đơn 24','10 Võ Văn Ngân','0321326481','anhptphong@gmail.com',14,'cash','Không có ghi chú'),(25,'2020-04-13 00:00:00','2020-04-17 00:00:00',NULL,3,12,'Hóa đơn 25','10 Võ Văn Ngân','0321326481','anhptphong@gmail.com',1,'cash','Không có ghi chú'),(26,'2020-04-13 00:00:00','2020-04-17 00:00:00',NULL,1,8,'Hóa đơn 26','10 Võ Văn Ngân','0321326481','anhptphong@gmail.com',NULL,'cash',NULL),(27,'2021-01-16 13:58:40','2021-01-17 00:00:00',NULL,6,6,'Tèo','TPHCM','2342342323','123@gmail.com',NULL,'app account','Khách hủy đơn hàng'),(28,'2021-01-19 08:34:51','2021-01-18 17:00:00',NULL,6,6,'A','HCM','1235676572','Minh@gmail.com',NULL,'app account','Khách hủy đơn hàng'),(29,'2021-01-19 08:45:54','2021-01-18 17:00:00',NULL,2,7,'B','qwe','1234567890','123@gmail.com',NULL,'app account','Không có ghi chú'),(30,'2021-01-19 08:48:06','2021-01-18 17:00:00',NULL,1,7,'b','123','1231231232','b@gmail.com',NULL,'app account',NULL),(31,'2021-01-19 09:10:51','2021-01-18 17:00:00',NULL,1,8,'a','123','1231231232','qwe@gmail.com',NULL,'app account',NULL),(32,'2021-01-19 09:16:01','2021-01-18 17:00:00',NULL,1,8,'a','123','1231231232','qwe@gmail.com',NULL,'app account',NULL),(33,'2021-01-19 13:26:43','2021-01-18 17:00:00',NULL,6,6,'a','qwe','1231231232','a@gmail.com',NULL,'app account','Khách hủy đơn hàng'),(34,'2021-01-19 13:30:34','2021-01-18 17:00:00',NULL,6,6,'a','qwe','1231231232','a@gmail.com',NULL,'app account','Khách hủy đơn hàng'),(35,'2021-01-19 15:40:42','2021-01-19 00:00:00',NULL,6,6,'Thân Trọng Đông','DH SPKT TPHCM','0989283927','dongthan@gmail.com',NULL,'VNPay','Khách hủy đơn hàng'),(37,'2021-01-19 15:57:25','2021-01-19 00:00:00',NULL,6,6,'Thân Trọng Đông','DH SPKT TPHCM','0989283927','dongthan@gmail.com',NULL,'VNPay','Khách hủy đơn hàng'),(38,'2021-01-19 16:10:26','2021-01-19 00:00:00',NULL,1,6,'Thân Trọng Đông','DH SPKT TPHCM','0989283927','dongthan@gmail.com',NULL,'cash',NULL),(39,'2021-01-19 16:20:01','2021-01-19 00:00:00',NULL,1,6,'Thân Trọng Đông','Quận 9','0337579234','thantrongdong1144@gmail.com',NULL,'cash',NULL),(40,'2021-01-19 16:22:22','2021-01-19 00:00:00',NULL,1,12,'Vinh','SPKT','0203651955','18110394@student.hcmute.edu.vn',NULL,'VNPay',NULL),(41,'2021-01-19 16:25:08','2021-01-19 00:00:00',NULL,1,12,'Vinh','SPKT','0203651955','18110394@student.hcmute.edu.vn',NULL,'VNPay',NULL),(42,'2021-01-19 16:28:10','2021-01-19 00:00:00',NULL,1,12,'Vinh','SPKT','0203651955','18110394@student.hcmute.edu.vn',NULL,'VNPay',NULL),(43,'2021-01-19 16:29:54','2021-01-19 00:00:00',NULL,1,12,'Vinh','SPKT','0203651955','18110394@student.hcmute.edu.vn',NULL,'VNPay',NULL),(44,'2021-01-19 16:32:56','2021-01-19 00:00:00',NULL,1,6,'a','HCM','1231232132','a@gmail.com',NULL,'app account',NULL),(45,'2021-01-19 16:35:50','2021-01-19 00:00:00',NULL,1,12,'Vinh','asd','0203651955','18110394@student.hcmute.edu.vn',NULL,'Paypal',NULL),(46,'2021-01-19 16:35:50','2021-01-19 00:00:00',NULL,1,25,'asd','asd','1283728372','2@gmail.com',NULL,'app account',NULL),(47,'2021-01-20 04:01:38','2021-01-20 00:00:00',NULL,1,6,'nguyễn văn nam','484 Lê Văn Việt, Thành Phố HCM','0399469372','khoagooner@gmail.com',NULL,'cash',NULL),(48,'2021-01-20 13:29:40','2021-01-20 00:00:00',NULL,1,26,'Vinh','SPKT','0203651955','xvkieu@gmail.com',NULL,'VNPay',NULL),(49,'2021-01-20 13:37:55','2021-01-20 00:00:00',NULL,1,26,'Vinh','SPKT','0203651955','18110394@student.hcmute.edu.vn',NULL,'cash',NULL),(50,'2021-01-20 15:00:30','2021-01-20 00:00:00',NULL,1,6,'nguyễn văn nam','484 Lê Văn Việt, Thành Phố HCM','0399469372','khoagooner@gmail.com',NULL,'cash',NULL),(51,'2021-01-20 15:01:58','2021-01-20 00:00:00',NULL,1,6,'a','484 Lê Văn Việt, Thành Phố HCM','0399469372','khoagooner@gmail.com',NULL,'app account',NULL),(52,'2021-01-20 15:03:13','2021-01-20 00:00:00',NULL,1,6,'nguyễn văn nam','484 Lê Văn Việt, Thành Phố HCM','0399469372','khoagooner@gmail.com',NULL,'VNPay',NULL),(53,'2021-01-20 15:04:36','2021-01-20 00:00:00',NULL,1,6,'nguyễn văn nam','484 Lê Văn Việt, Thành Phố HCM','0399469372','khoagooner@gmail.com',NULL,'Paypal',NULL),(54,'2021-01-20 15:11:11','2021-01-20 00:00:00','2021-01-21 05:10:31',4,6,'a','484 Lê Văn Việt, Thành Phố HCM','0399469372','thantrongdong1144@gmail.com',13,'VNPay','Không có ghi chú'),(55,'2021-01-20 18:58:46','2021-01-20 00:00:00',NULL,1,6,'nguyễn văn nam','484 Lê Văn Việt, Thành Phố HCM','0399469372','khoagooner@gmail.com',NULL,'cash',NULL),(56,'2021-01-20 19:00:15','2021-01-20 00:00:00',NULL,1,6,'nguyễn văn nam','484 Lê Văn Việt, Thành Phố HCM','0399469372','khoagooner@gmail.com',NULL,'app account',NULL),(57,'2021-01-20 19:00:45','2021-01-20 00:00:00',NULL,1,6,'nguyễn văn nam','484 Lê Văn Việt, Thành Phố HCM','0399469372','khoagooner@gmail.com',NULL,'VNPay',NULL),(58,'2021-01-20 19:02:57','2021-01-20 00:00:00',NULL,1,6,'nguyễn văn nam','484 Lê Văn Việt, Thành Phố HCM','0399469372','khoagooner@gmail.com',NULL,'Paypal',NULL),(59,'2021-01-20 19:12:53','2021-01-20 00:00:00',NULL,1,6,'nguyễn văn nam','484 Lê Văn Việt, Thành Phố HCM','0399469372','khoagooner@gmail.com',NULL,'Paypal',NULL),(60,'2021-01-20 23:30:42','2021-01-20 00:00:00',NULL,1,6,'A','dh','0377460828','mail@gmail.com',NULL,'Paypal',NULL),(61,'2021-01-20 23:31:13','2021-01-20 00:00:00',NULL,1,6,'oh','dh','0377460828','mail@gmail.com',NULL,'cash',NULL),(62,'2021-01-21 02:50:50','2021-01-21 00:00:00',NULL,1,6,'nguyễn văn nam','484 Lê Văn Việt, Thành Phố HCM','0399469372','khoagooner@gmail.com',NULL,'Paypal',NULL),(63,'2021-01-21 02:51:06','2021-01-21 00:00:00',NULL,1,6,'Thân Trọng Đông','DH SPKT TPHCM','0989283927','dongthan@gmail.com',NULL,'Paypal',NULL),(64,'2021-01-21 02:53:54','2021-01-21 00:00:00',NULL,6,6,'nguyễn văn nam','484 Lê Văn Việt, Thành Phố HCM','0399469372','khoagooner@gmail.com',NULL,'Paypal','Khách hủy đơn hàng'),(65,'2021-01-21 03:00:12','2021-01-21 00:00:00',NULL,1,6,'nguyễn văn nam','484 Lê Văn Việt, Thành Phố HCM','0399469372','khoagooner@gmail.com',NULL,'VNPay',NULL),(66,'2021-01-21 03:49:52','2021-01-21 00:00:00',NULL,1,28,'nguyễn văn nam','484 Lê Văn Việt, Thành Phố HCM','0399469372','khoagooner@gmail.com',NULL,'cash',NULL),(67,'2021-01-21 03:52:24','2021-01-21 00:00:00',NULL,6,6,'nguyễn văn nam','484 Lê Văn Việt, Thành Phố HCM','0399469372','khoagooner@gmail.com',13,'app account','123456'),(68,'2021-01-21 03:53:27','2021-01-21 00:00:00',NULL,6,6,'nguyễn văn nam','484 Lê Văn Việt, Thành Phố HCM','0399469372','khoagooner@gmail.com',13,'VNPay','Điền lý do hủy đơn hàng'),(69,'2021-01-21 13:16:10','2021-01-21 00:00:00',NULL,1,6,'Thân Trọng Đông','DH SPKT TPHCM','0989283927','s@gmail.com',NULL,'Paypal',NULL),(70,'2021-01-21 13:23:51','2021-01-21 00:00:00',NULL,1,6,'Thân Trọng Đông','DH SPKT TPHCM','0989283927','dongthan@gmail.com',NULL,'Paypal',NULL),(71,'2021-01-21 13:29:31','2021-01-21 00:00:00',NULL,1,6,'sdsdds','DH SPKT TPHCM','0989283927','dongthan@gmail.com',NULL,'Paypal',NULL),(72,'2021-01-21 13:59:33','2021-01-21 00:00:00',NULL,1,22,'Vinh','SPKT','0203651955','kunpro11144@gmail.com',NULL,'Paypal',NULL),(73,'2021-01-21 14:03:35','2021-01-21 00:00:00',NULL,1,22,'Vinh','SPKT','0203651955','kunpro11144@gmail.com',NULL,'Paypal',NULL),(74,'2021-01-21 14:04:35','2021-01-21 00:00:00',NULL,1,6,'Thân Trọng Đông','DH SPKT TPHCM','0989283927','s@gmail.com',NULL,'Paypal',NULL),(75,'2021-01-21 14:09:52','2021-01-21 00:00:00',NULL,1,6,'Thân Trọng Đông','DH SPKT TPHCM','0989283927','dongthan@gmail.com',NULL,'Paypal',NULL),(76,'2021-01-21 14:10:20','2021-01-21 00:00:00',NULL,1,22,'Vinh','SPKT','0203651955','xvkieu@gmail.com',NULL,'Paypal',NULL),(77,'2021-01-22 06:18:30','2021-01-22 00:00:00',NULL,6,29,'Thân Trọng Đông','DH SPKT TPHCM','0989283927','dongthan@gmail.com',NULL,'VNPay','Khách hủy đơn hàng'),(78,'2021-01-22 15:59:14','2021-01-22 00:00:00',NULL,6,6,'Kun','484 Lê Văn Việt','0374683874','thantrongdong1144@gmail.com',NULL,'VNPay','Khách hủy đơn hàng'),(79,'2021-01-23 00:57:41','2021-01-23 00:00:00','2021-01-23 01:03:23',4,6,'Thân Trọng Đông','DH SPKT TPHCM','0989283927','dongthan@gmail.com',1,'VNPay','Không có ghi chú'),(80,'2021-02-10 13:13:16','2021-02-09 17:00:00',NULL,1,22,'Kiều Xuân Vinh','SPKT','0824006962','xvkieu@gmail.com',NULL,'VNPay',NULL),(81,'2021-04-21 02:52:17','2021-04-20 17:00:00',NULL,1,6,'Thân Trọng Đông','DH SPKT TPHCM','0989283927','dongthan@gmail.com',NULL,'VNPay','Không có ghi chú');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetail`
--

DROP TABLE IF EXISTS `orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetail` (
  `OrderID` int NOT NULL,
  `ProductID` int NOT NULL,
  `QuantityOrdered` int DEFAULT NULL,
  PRIMARY KEY (`OrderID`,`ProductID`),
  KEY `FK_Ordetail_Pro_idx` (`ProductID`),
  CONSTRAINT `FK_Orderdetail_Order` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Ordertail_Pro` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetail`
--

LOCK TABLES `orderdetail` WRITE;
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
INSERT INTO `orderdetail` VALUES (8,80,4),(10,22,1),(10,45,6),(11,80,6),(12,36,4),(14,39,5),(17,15,2),(17,17,4),(17,56,3),(17,67,1),(21,13,3),(22,13,6),(22,15,6),(22,16,6),(22,19,6),(22,23,3),(22,33,6),(22,43,6),(22,45,5),(22,46,2),(22,53,6),(22,65,2),(22,67,6),(22,76,6),(23,56,8),(24,12,21),(24,51,12),(25,11,9),(26,78,3),(27,14,4),(28,60,1),(29,45,1),(30,56,1),(31,18,1),(32,12,1),(33,12,2),(34,11,1),(35,21,1),(35,22,1),(37,17,1),(37,18,1),(38,12,1),(38,13,1),(38,14,1),(39,12,2),(39,45,1),(39,51,1),(40,12,2),(40,13,1),(40,45,1),(41,13,1),(41,14,1),(42,60,1),(42,67,1),(42,98,1),(43,12,1),(43,45,1),(43,51,1),(44,45,1),(45,12,1),(45,45,1),(47,51,2),(48,12,1),(48,45,1),(49,12,1),(49,45,1),(49,51,1),(50,12,1),(50,13,1),(50,14,1),(51,13,1),(51,14,1),(52,15,1),(52,16,1),(53,21,1),(53,22,1),(54,21,1),(54,22,1),(55,12,1),(55,14,1),(56,12,1),(56,13,1),(57,12,1),(57,13,1),(58,12,1),(58,13,1),(59,12,1),(59,13,1),(60,14,1),(61,14,1),(62,13,1),(63,20,10),(63,21,1),(63,22,1),(64,13,1),(64,45,1),(65,12,1),(66,13,2),(66,14,1),(67,12,1),(67,13,1),(68,16,1),(68,17,1),(69,13,1),(69,14,1),(70,12,1),(70,13,1),(70,14,1),(71,11,1),(71,12,1),(71,18,1),(72,11,1),(72,106,1),(73,11,1),(73,106,1),(74,12,1),(74,13,1),(74,14,1),(75,12,1),(75,13,1),(75,14,1),(76,11,1),(76,106,1),(77,13,1),(77,45,1),(77,51,1),(78,11,2),(78,98,1),(79,13,1),(79,14,1),(80,13,1),(81,45,4);
/*!40000 ALTER TABLE `orderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ProductDescription` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Price` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Category` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Picture` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateAdded` date DEFAULT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (11,'Ngưu tất','Ngưu tất có vị đắng, chua công dụng trị đau lưng, mỏi gối, mỏi gân xương, bế kinh, kinh nguyệt không đều, tăng huyết áp',65000,100,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530448/product/11_q4rpkj.jpg','2021-01-21'),(12,'Giảo cổ lam','Giảo cổ lam là loại cây dây leo có tác dụng giảm lượng đường và chloresteron trong máu, lưu thông khí huyết. Hơn nữa, giảo cổ lam có tác dụng làm giảm đau, hạ huyết áp, căng thẳng',75000,99,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530450/product/12_mqkng6.jpg','2018-12-12'),(13,'Cà gai leo','Cà gai leo chủ trị phong thấp, nhức đầu các gân xương, ho khan, ho gà, dị ứng, xơ gan, viêm nhiễm vùng miệng.',80000,126,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530448/product/13_kad7bl.jpg','2018-12-12'),(14,'Ý Dĩ','Ý dĩ với một số tên gọi khác như cườm hạt, bo bo có tác dụng thanh nhiệt, giải độc, tiêu hoá kém, hen suyễn thể phong nhiệt',50000,69,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530448/product/14_vjzuby.jpg','2018-12-12'),(15,'Xuyên Tiêu','Xuyên tiêu là nguồn dược phẩm rất tốt cho sức khoẻ, có thể chữa trị vêt rắn cắn, đau răng, cảm lạnh, đau bụng ',150000,200,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530448/product/15_tarrh4.jpg','2018-12-12'),(16,'Xuyên Tâm Liên','Xuyên tâm liên dùng được cá lá và hoa để trị các căn bệnh thường gặp như lở ngứa, rôm sảy, mịn nhọn, viêm phế quản',100000,95,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530448/product/16_qjnzk4.jpg','2018-12-12'),(17,'Xuyên Luyện Tử','Xuyên luyện tử hay quả xoan thường có trong môi trường tự nhiên với nhiều tác dụng có lợi cho sức khoẻ và chữa các bệnh viêm dạ dày, sỏi tiết niệu, đau âm đạo',95000,85,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530449/product/17_yideaf.jpg','2018-12-12'),(18,'Xuyên Khung','Xuyên khung chuyên trị đau bụng kinh, nhức đầu, chóng mặt, phong thấp, viêm khớp..',55000,50,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530449/product/18_c82bmi.jpg','2018-12-12'),(19,'Xoan','hường được chỉ định dùng trị giun đũa, giun chỉ, giun kim. Liều dùng 5-10g, dạng thuốc sắc. Dùng ngoài trị bệnh tinea, ghẻ, eczema, viêm da, mày đay, viêm phế quản do trichomonas. Nấu nước để rửa, hoặc nghiền ra và pha thêm giấm để đắp ngoài',73000,68,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530449/product/19_qt3zwp.jpg','2018-12-12'),(20,'Xích Thược','Xích thược là loài hoa phổ biến ở nước ta, chủ yếu phân bổ tại Cao Bằng, Lạng Sơn, có tác dụng chữa thoái hoá cột sống, thuỷ đậu, giải độc trị mất ngủ',45000,73,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530449/product/20_uth0fw.jpg','2018-12-12'),(21,'Xa Tiền Tử','Dùng hạt mã đề, sao qua, sắc uống - nếu bí tiểu tiện thì thêm mộc thông - có thể dùng hạt mã đề với rau dừa nước lượng như nhau',35000,22,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530449/product/21_fx8csz.jpg','2018-12-12'),(22,'Xa Sàng Tử','Xạ sàng tử thường mọc hoang ở nhiều vùng tại Việt Nam, thường được lấy cả cây hoặc lấy quả để làm dược liệu chữa trị các bệnh liệt dương, mộng tinh, đau xương, mỏi gối',85000,41,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530450/product/22_ms6lo0.jpg','2018-12-12'),(23,'Xạ Đen','Cây xạ đen có tác dụng phòng chống trong điều trị ung thư, hạn chế phát triển của các khối u; tiêu viêm giải độc, mát gan; ăn ngủ tốt',45000,36,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530449/product/23_btg5da.jpg','2018-12-12'),(24,'Xạ Căn','Xạ căn hay cây rẻ quạt có công dụng trừ hàn tuyên phế, tiêu đờm giảm ho, hạ khí, điều nguyên.  ',50000,56,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530450/product/24_lkhgwe.jpg','2018-12-12'),(25,'Vương Bất Lưu Hành','Vương bất lưu hành thường gọi là cây trâu cỏ thường được lấy hạt để chữa trị các bệnh tư thận, hoạt huyết, thông lâm, thanh nhiệt  ',62000,78,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530450/product/25_djq1us.jpg','2018-12-12'),(26,'Vông Vang','Cây thảo sống hằng năm hay hai năm, cao tới 2m, có lông ráp. Lá mọc so le có cuống dài, gân lá chân vịt, phiến chia thành 5-6 thùy, ngoài mặt có lông, mép khía răng; lá kèm rất hẹp.',79000,89,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530450/product/26_evdm2b.jpg','2018-12-12'),(27,'Vông Nem','Lá vông nem (loại bánh tẻ) một nắm, rửa sạch, luộc hoặc nấu canh ăn hàng ngày. Có thể phối hợp với lá dâu non hoặc hoa thiên lý, mỗi thứ một nắm nấu canh ăn hàng ngày.',81000,67,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530450/product/27_azf7j0.jpg','2018-12-12'),(28,'Viễn Chí','Viễn chí có thể dùng kết hợp với nhiều loại dược liệu khác để có công dụng rất tốt trong việc chữa trị viêm phế quản mạn tính, chân tay lạnh, sổ mũi, an thần',99000,120,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530450/product/28_kfgedw.jpg','2018-12-12'),(29,'Uy Linh Tiên','Uy Linh Tiên hay dân gian còn gọi là dây ruột gà thường có ở miền Bác Việt Nam có tác dụng hữu hiệu với các bệnh: phong tê thấp, đau dây thần kinh chân tay, cổ',66000,110,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530450/product/29_jr2wx7.jpg','2018-12-12'),(30,'Trần Bì','Cây nhỏ, thân cành có gai. Lá đơn mọc so le, mép khía răng cưa, vỏ có mùi thơm đặc biệt. Hoa nhỏ có màu trắng, mọc đơn độc ở kẽ lá.',84000,49,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530451/product/30_msetme.jpg','2018-12-12'),(31,'Trinh Nữ Hoàng Cung','Cây cỏ lớn. Thân hành to, gần hình cầu hoặc hình trứng thuôn, đường kính 8-10cm, bẹ lá úp vào nhau thành một thân giả dài khoảng 10- 15 cm. Lá mọc thẳng từ thân hành, hình dải dài đến 50 cm, có khi hơn rộng 7- 10cm, mép nguyên, gốc phẳng có bẹ, đầu nhọn hoặc tù, gân song song',150000,65,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530451/product/31_isycow.jpg','2018-12-12'),(32,'Beta Glucan','Hỗ trợ thanh nhiệt, giải độc gan, bảo vệ gan và tăng cường chức năng gan. Hỗ trợ hạn chế tác hại của rượu bia ảnh hưởng đến gan.',300000,73,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530451/product/32_lkci7e.png','2018-12-12'),(33,'Vimac','Hỗ trợ tăng khả năng chống oxy hóa, tăng cường sức đề kháng, giúp hạn chế tác hại của quá trình oxy hóa',250000,200,'Thực phẩm chức năng','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530451/product/33_ribe1p.jpg','2018-12-12'),(34,'Glucan','Hỗ trợ tăng cường giải độc, chống oxy hóa, chống gốc tự do, hỗ trợ làm giảm tác dụng của hóa trị, xạ trị. ',280000,200,'Thực phẩm chức năng','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530451/product/34_t2vxst.jpg','2018-12-12'),(35,'Calomil','Bổ sung dinh dưỡng, đặc biệt là nguồn đạm chất lượng cao, chứa nhiều các acid amin thiết yếu và chuỗi nhánh, giúp cho quá trình phục hồi được tốt hơn',350000,360,'Thực phẩm chức năng','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530451/product/35_iwlfqm.jpg','2018-12-12'),(36,'Salvia','Hỗ trợ giảm mỡ máu, giảm nguy cơ xơ vữa động mạch',270000,75,'Thực phẩm chức năng','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530451/product/36_wh1l5h.jpg','2018-12-12'),(37,'Ayuric','Hỗ trợ giúp làm giảm acid uric trong máu, giảm các biểu hiện của viêm khớp do Gout',340000,178,'Thực phẩm chức năng','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530451/product/37_wuvvmm.jpg','2018-12-12'),(38,'Boskaba','Giúp bổ sung dưỡng chất cho khớp, hỗ trợ tái tạo mô sụn, giúp khớp vận động linh hoạt. Hỗ trợ giảm thoái hóa khớp, giảm đau mỏi khớp xương.',240000,165,'Thực phẩm chức năng','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530451/product/38_pwvmwo.jpg','2018-12-12'),(39,'Gout VIETMEC','Hỗ trợ giúp làm giảm acid uric trong máu, giảm các biểu hiện của viêm khớp do Gout',229000,155,'Thực phẩm chức năng','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530452/product/39_uulqse.jpg','2018-12-12'),(40,'Poly VIETMEC','Hỗ trợ nhuận tràng, thông tiện, giảm táo bón.',319000,324,'Thực phẩm chức năng','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530452/product/40_bkkg0s.jpg','2018-12-12'),(41,'Dạ Dày Plus','Hỗ trợ giảm acid dịch vị, giúp bảo vệ niêm mạc dạ dày, hỗ trợ giảm viêm loét dạ dày, tá tràng.',399000,146,'Thực phẩm chức năng','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530452/product/41_uo5psa.jpg','2018-12-12'),(42,'Cảm A Phủ','Hỗ trợ giảm các triệu chứng cảm sốt, hắt hơi, sổ mũi. Hỗ trợ giảm ho, đau rát cổ họng.',299000,251,'Thực phẩm chức năng','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530452/product/42_dcva5h.jpg','2018-12-12'),(43,'Insu VIETMEC','Hỗ trợ giảm đường huyết và giảm các biến chứng do đái tháo đường.',199000,108,'Thực phẩm chức năng','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530452/product/43_td0cnn.jpg','2018-12-12'),(44,'An Nhiên','Giúp tăng sức bền mạch máu, hỗ trợ giảm huyết áp. Hỗ trợ cải thiện các triệu chứng ở người cao huyêt áp.',149000,300,'Thực phẩm chức năng','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530452/product/44_x5mnnk.jpg','2018-12-12'),(45,'Care Plus','Bổ sung các vitamin, khoáng chất và các dưỡng chất cần thiết giúp tăng cường tiêu hóa và hấp thu thức ăn, giúp ăn ngon miệng. Hỗ trợ tăng cường sức khỏe và sức đề kháng cho cơ thể.',99000,282,'Thực phẩm chức năng','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530452/product/45_blcfzf.jpg','2018-12-12'),(46,'Albumin','Bổ sung albumin, các acid amin và DHA, giúp tăng cường sức khỏe và sức đề kháng cho cơ thể.',179000,254,'Thực phẩm chức năng','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530453/product/46_kvrx3l.jpg','2018-12-12'),(47,'Vita Plus','Bổ sung các enzyme tiêu hoá, các vitamin hỗ trợ tăng cường tiêu hoá và hấp thu thức ăn, giúp ăn ngon miệng.',209000,179,'Thực phẩm chức năng','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530452/product/47_ggvkay.jpg','2018-12-12'),(48,'Tô Diệp','Cây nhỏ, cao 0,5 - 1m. Lá mọc đối, mép khía răng, mặt dưới tím tía, có khi hai mặt đều tía. Hoa nhỏ màu trắng mọc thành xim co ở đầu cành. Quả bế, hình cầu',66000,169,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530453/product/48_dmwxpz.jpg','2018-12-12'),(49,'Tiểu Hồi','Cây thảo sống 2 năm hay nhiều năm cao 0,6-2m; rễ cứng, thân nhẵn, màu lục lờ, hơi có khía. Lá mọc so le, có bẹ phát triển; phiến lá xẻ lông chim 3-4 lần thành dải hình sợi',48000,168,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530454/product/49_tg7vtj.jpg','2018-12-12'),(50,'Tiên Mao','Loại cây cỏ cao chừng 40cm, thân ngầm hình trụ dài, lá hình mác hẹp, hai đầu nhọn, dài 15-40cm, rộng 12-35mm, cuống dài 10cm, trông gần giống như lá cau',59000,165,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530453/product/50_bm7g0i.jpg','2018-12-12'),(51,'Tiền Hồ','Cây thuộc thảo, cao 0,7-1,4m, mọc thẳng đứng, trên có phân nhánh trên thân có khía dọc. Lá ở gốc cây lớn, 1-2 lần sẻ lông chim, cuống dục có răng cưa to. Là ở thân nhỏ, cuống ngắn có bẹ lá phồng và rộng',79000,266,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530453/product/51_l1rhm0.jpg','2018-12-12'),(52,'Tiên Hạc Thảo','Loại cỏ cao 0.5-1.5m, toàn thân có vạch dọc và mang lông trắng, nhiều cành. Thân rễ mọc ngang, đường kính có thể đạt tới 1cm, lá mọc so le kép, dìa lẻ, lá chét hình trứng dài, mép có răng cưa to',102000,203,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530453/product/52_miy5xm.jpg','2018-12-12'),(53,'Thuyền Thoái','Con ve sầu là một loại sâu bọ có vỏ cứng, có đốt. Con đực giao cấu xong thì chết, con cái đẻ trứng ở dưới vỏ cây hoặc khe đá. Khi mới nở, chưa có cánh, sống ở dưới đất, sau khi lột xác, có cánh và sống ở trên cây.',68000,265,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530453/product/53_zdcyx7.jpg','2018-12-12'),(54,'Thuỷ Phù Liên','Cây thảo thuỷ sinh nổi. Thân đâm chồi, mang các nhánh ngắn, có lá mọc chụm lại. Lá màu lục tươi, có nhiều lông như nhung và không thấm nước. Buồng hoa nhỏ độ 1cm, màu lục nhạt',57000,287,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530454/product/54_zduzbh.jpg','2018-12-12'),(55,'Thương Truật','Thương truật là một loại cây sống lâu năm, cao chừng 0,60m, có rễ phát triển thành củ to, thân mọc thẳng đứng. Lá mọc so le, gần như không có cuống, lá ở phía gốc chia 3 thùy nhưng cắt không sâu. 2 thùy 2 bên hình mác, không chia thùy',33000,102,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530454/product/55_lcjgcf.jpg','2018-12-12'),(56,'Thương Nhĩ Tử',' Cây thảo, sống hàng năm, cao 50-80cm, ít phân cành. Thân hình trụ, cứng, có khía, mầu lục, đôi khi điểm những chấm mầu nâu tím, có lông cứng. Lá mọc so le, hình tim-tam giác, dài 4-10cm, rộng 4-12cm, chia 3-5 thùy, mép khía răng không đều, có lông ngắn và cứng ở cả hai mặt, gân chính 3, cuống lá dài 10cm, có lông cứng',113000,98,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530454/product/56_upm6mj.jpg','2018-12-12'),(57,'Thương Lục','Thương lục là một cây loại thảo, sống lâu năm, cao khoảng 1m. Toàn thân cây nhẵn, không có lông. Thân hình trụ tròn hoặc hơi có cạnh màu xanh lục pha màu đỏ tím. Lá đơn, nguyên, có cuống, mọc so le, phiến lá hình trứng tròn, đầu nhọn, mép lá nguyên, hai mặt lá nhẵn, dài 10-38cm, rộng 13-14cm. Cụm hoa hình chùm, dài 15-20cm, gồm nhiều hoa mẫu 5 màu trắng. Quả mọng, hình cầu dẹt có 8-10 múi, với vòi nhụy tồn tại, khi chín có màu đỏ tía hay tím đen. Mùa hoa: Tháng 5 đến tháng 7, mùa quả chín từ tháng 8 đến tháng 10.',66000,103,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530454/product/57_sb2i9g.jpg','2018-12-12'),(58,'Thục Địa','Thục địa là rễ của Địa hoàng đã được nấu chín. Song việc chế biến Thục địa rất cầu kỳ. Ở Trung Quốc, người ta chế theo phương thức “Cửu trưng, cửu sái” tức là chín lần nấu, chín lần phơi',77000,45,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530454/product/58_dx9f1p.jpg','2018-12-12'),(59,'Thông Thảo','Cây gỗ hoặc cây gỗ nhỏ cao 2-6m. Thân cứng, giòn, có lõi xốp trắng (tuỷ). Lá to, chia thành nhiều thùy, có khi cắt sâu đến giữa lá, mép có răng cưa to hay nhỏ, gân gốc 5-7. Cuống hoa hình tán, họp thành chuỳ cao 40cm, có lông. Hoa có 4 cánh hoa màu lục, bầu 2 ô, 2 vòi nhuỵ. Quả dẹt hình cầu, màu tía đen, có 8 cạnh. Hoa tháng 10-12. ',69000,91,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530454/product/59_zzp9wy.jpg','2018-12-12'),(60,'Thỏ Ty Tử','Cây có thân hình sợi màu vàng hay nâu nhạt, không có lá, lá biến thành vảy, có rễ mút để hút thức ăn từ cây chủ, dân gian thường gọi là dây tơ hồng. Hoa hình cầu, màu trắng nhạt, không có cuống, quả hình trứng, có kẽ nứt, trong chứa 2-4 hạt, hình trứng, đỉnh dẹt, dài 2mm.',68000,5657,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530454/product/60_i2mbz4.jpg','2020-12-15'),(61,'Thổ Phục Linh','Dây leo trườn dài 4-5m (tới 10m), có nhiều cành mảnh không gai. Rễ củ vặn vẹo. Lá mọc so le, hình trái xoan bầu dục dài 5-12cm, rộng 1-5cm, mang 2 tua cuốn do lá kèm biến đổi, thường tiêu giảm thành mũi nhọn ngắn, có khi kéo dài; cuống lá dài 1cm; gân chính 3, hình cung. Cụm hoa ở nách lá. Tán đơn độc có 20-30 hoa. Hoa màu lục nhạt, cuống hoa dài hơn cuống tán. Hoa đực và hoa cái riêng rẽ. Quả mọng, hình cầu, gần như 3 góc, khi chín màu tím đen, chứa 3 hạt. Cây ra hoa tháng 5-7, quả tháng 8-12',150000,87,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530454/product/61_f6b9yv.jpg','2018-12-12'),(62,'Thổ Hoàng Liên','Dược liệu là đoạn thân rễ có kèm theo rễ. Đoạn thân rễ màu nâu sẫm dài 2 – 8 cm, đường kính 0,3 – 1,1 cm, thường cong queo, có nhiều đốt khúc khuỷu to. Dễ bẻ gẫy, vết bẻ có màu vàng nhạt, không phẳng. Mặt cắt ngang có 2 phần rõ rệt: Phần vỏ màu nâu sẫm, phần gỗ màu vàng, ruột màu xám. Rễ dài 3 – 15 cm, đường kính 0,1 – 0,4 cm, mặt ngoài màu nâu nhạt, có các nếp nhăn dọc. Rễ mềm hơn thân rễ và mặt cắt ngang cũng có hai phần rõ rệt, phần ngoài màu vàng nhạt, lõi gỗ phía trong màu vàng đậm. Vị rất đắng.',89000,67,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530454/product/62_jrpwcw.jpg','2018-12-12'),(63,'Thiên Trúc Hoàng','Cây cao 9-10m; thân rất thẳng, lóng dài 40-60cm, rộng 5-6cm, lúc non có phấn trắng thịt mỏng, mo có lõng nằm, màu nâu sậm ở mặt ngoài, tai (lưỡi) thấp. Lá có phiến thon, gốc nhọn, dài 10-25cm, rộng 1,5-2,5cm, mặt dưới trăng trắng; gân phụ 5-6 mỗi bên, bẹ lá có tai thấp, bầu dục, cong. Cụm hoa với mỗi mắt mang 10-12 nhánh .',91000,405,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530455/product/63_qjwzdb.jpg','2018-12-12'),(64,'Thiên Tiên Tử','Thiên tiên tử là hạt cùa cây thiên tiên tử, một loại cỏ sống hàng năm hay hai năm, có thể cao 0,50m hay hơn. Thân và lá phủ nhiều lông. Phiến lá có thể dài 20-25cm, rộng 5-7cm, lá phía dưới có cuống, lá phía trên thân không cuống hơi ôm vào thân. Phiến lá chia nhiều thùy, gần chính lá nổi rõ. Hoa mọc thành xim một ngả, tràng hoa màu vàng nhạt với những thùy tràng không đều nhau, với những đường gân của cánh tràng màu tía, 5nhị. Ngoài loài Hyoscyamus niger kể trên, ngưòi ta còn khai thác cả thiên tiên tử hoa trắng (Hyoscyamus aibus) cũng có cánh tràng màu vàng nhạt nhưng không có đường gân màu tía.',90000,387,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530455/product/64_vhfqqn.jpg','2018-12-12'),(65,'Thiên Niên Kiện','Cây sống lâu năm nhờ thân rễ mập, bò dài, thơm, khi bẻ ngang có xơ như kim. Lá mọc từ thân rễ, phiến lá sáng bóng, dài tới 30cm, có 3 cặp gân gốc, 7-9 cặp gân phụ. Cụm hoa là những bông mo, có mo màu xanh, dài 4-6cm, không rụng; buồng 3-4cm, ngắn hơn mo; bầu chứa nhiều noãn. Quả mọng thuôn, chứa nhiều hạt có rạch. Mùa hoa tháng 4-6, mùa quả tháng 8-10.',70000,204,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530455/product/65_eb9cjp.jpg','2018-12-12'),(66,'Thiên Ma','Thiên ma là một loài thực vật đặc biệt, kỳ lạ, không có chất diệp lục, toàn thân màu vàng đỏ, rễ thẳng đứng giống hình chân người, lá hình vẩy cá.',50000,39,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530455/product/66_jicbp5.jpg','2018-12-12'),(67,'Bột cao khô Bạch mao căn','Chữa sốt khát nước, hoàng đản, tiểu tiện ít, đái buốt, đái ra máu, ho ra máu, chảy máu cam.',78000,99,'Cao dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530455/product/67_ixsbkq.jpg','2020-12-15'),(68,'Bột cao khô Đảng sâm','Tỳ phế hư nhược, thở dồn, tim đập mạnh, ăn yếu, phân lỏng, ho suyễn, hư tính, nội nhiệt, tiêu khát (đái tháo đường).',77000,58,'Cao dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530455/product/68_p7zzfc.png','2018-12-12'),(69,'Bột cao khô Ngưu tất','Hoạt huyết thông kinh, cường gân cốt, bổ can thận',74000,49,'Cao dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530456/product/69_jk2npr.png','2018-12-12'),(70,'Bột cao khô Cúc Hoa Trắng','Bột cao khô Cúc hoa trắng( Extractum Chrysanthemi morifolii siccus ) ',45000,140,'Cao dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530456/product/70_bkklvk.png','2018-12-12'),(71,'Bột cao khô Chi Tử','Bột cao khô Chi tử( Extractum Gardeniae siccus)',78000,150,'Cao dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530456/product/71_bylx0x.png','2018-12-12'),(72,'Bột cao khô Bồ Công Anh','Cao khô Bồ công anh( Extractum Herba Lactucae siccus)',69000,174,'Cao dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530456/product/72_sok4ke.png','2018-12-12'),(73,'Bột cao khô Bình Vôi','Cao khô Bình vôi (Extractum Stephaniae siccus)  ',110000,169,'Cao dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530459/product/73_tewosn.png','2018-12-12'),(74,'Bột cao khô Áctisô','Cao khô Actiso( Extractum Cynarae siccus)',70000,214,'Cao dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530456/product/74_nyuma2.png','2018-12-12'),(75,'Bột cao khô Đan Sâm','Bột cao khô Đan sâm(Extractum Salviae miltiorrhizae siccus)',60000,315,'Cao dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530456/product/75_wejiq9.png','2018-12-12'),(76,'Bột cao khô Hoàng Kỳ','Cao khô Hoàng kỳ( Extractum Astragali membranacei siccus)',49000,254,'Cao dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530456/product/76_qoeq2f.png','2018-12-12'),(77,'Bột cao khô Hà Thủ Ô','Bột cao khô Hà thủ ô( Extractum Fallopiae multiflorae siccus)',59000,116,'Cao dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530456/product/77_roulgx.png','2018-12-12'),(78,'Bột cao khô Trạch Tả','Bột cao khô Trạch tả( Extractum Alismatis siccus)',79000,119,'Cao dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530457/product/78_tvlupz.png','2018-12-12'),(79,'Bột cao khô Cam thảo','Bột cao khô Cam thảo (Extractum Glycyrrhizae siccus)',69000,212,'Trà cốm thuốc','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530457/product/79_exwhwx.png','2018-12-12'),(80,'Trà Cốm Trinh Nữ Hoàng Cung','Trà cốm Trinh nữ hoàng cung đã được cả Y học cổ truyền và Y học hiện đại chứng minh có nhiều thành phần hoá học có tác dụng rất tốt trong việc cải thiện sức khoẻ cũng như hỗ trợ làm chậm các khối u, có tác dụng hỗ trợ ức chế sự phát triển của u xơ tử cung, u nang buồng trứng, u xơ phì đại lành tính tuyến tiền liệt, u vú, dạ dày, làm giảm khả năng sống của tế bào u, sản phẩm còn có tác dụng lợi niệu, chủ trị tiểu tiện bí dắt',140000,256,'Trà cốm thuốc','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530457/product/80_rpswiw.png','2018-12-12'),(81,'Bột Siêu Mịn Tam Thất','Bột cốm Tam thất có tác dụng rất tốt trong việc bổ máu, làm tan các khối máu tụ, giảm đau tiêu sưng. Bột cốm Tam thất giúp cải thiện khả năng lưu thông máu trong hệ tuần hoàn, đánh tan các cục máu đông xuất hiện trong mạch máu. Giảm sưng đau, các vết máu bầm, tụ máu trên cơ thể, đau thắt ngực, chóng mặt',250000,314,'Trà cốm thuốc','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530457/product/81_ngvevp.jpg','2018-12-12'),(82,'Trà Cốm Quế','Chủ trị cảm mạo phong hàn, tăng cường lưu thông khí huyết, lợi tiểu, giảm sưng phù. Tăng cường hộ hấp và bài tiết, tăng co bóp tử cung, tăng nhu động ruột',339000,219,'Trà cốm thuốc','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530458/product/82_zuc5ql.jpg','2018-12-12'),(83,'Trà Cốm Nhân Trần','Lợi mật, tăng cường tiêu hoá, giảm nguy cơ rối loạn biến dưỡng chất béo. Nhuận gan, thanh nhiệt giải độc cho gan, có lợi trực tiếp đến hệ bài tiết của cơ thể, giảm hiện tượng nổi mụn do nóng gan',279000,260,'Trà cốm thuốc','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530457/product/83_nsuv9j.png','2018-12-12'),(84,'Trà Cốm Giảo Cổ Lam','Có tác dụng giảm các triệu chứng từ các bệnh: tiểu đường tuýp 2, mỡ máu cao và các căn bệnh liên quan đến tim mạch với các hợp chất từ flavonoids, gypenoside, sterols…',199000,200,'Trà cốm thuốc','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530458/product/84_mopbf9.jpg','2018-12-12'),(85,'Trà cốm Cà gai leo','Trà cốm Cà gai leo Có tác dụng rất hiệu quả trong việc bảo vệ gan, ức chế sự phát triển của xơ gan vì trong thành phần có các chất như alkaloid, glycoalkaloid, steroid saponin.',165000,134,'Trà cốm thuốc','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530458/product/85_llmyfn.jpg','2018-12-12'),(86,'Diabetna','Hỗ trợ ổn định đường huyết',380000,264,'Thực phẩm chức năng','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530458/product/86_jqywum.jpg','2018-12-12'),(87,'Thuốc thảo dược bổ gan Nam Dược','Thuốc thảo dược bổ gan Nam Dược giúp giải độc, chống dị ứng, đặc biệt là với những trường hợp suy giảm chức năng gan, mụn nhọt, lở ngứa, vàng da. Thuốc bổ gan cũng hỗ trợ điều trị xơ vữa động mạch, mỡ (triglycerid, cholesterol) trong máu cao, bí đại tiểu tiện, khó tiêu, táo bón',450000,179,'Thực phẩm chức năng','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530458/product/87_egk6t5.png','2018-12-12'),(95,'Thuốc xịn','Uống vô hết bệnh',20000,100,'Thực phẩm chức năng','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607937112/z78cdyxkqvecjylhzvsa.png','2020-12-14'),(98,'Thuốc xịn hơn thuốc xịn','Uống vô chắc chắn hết bệnh :3',40000,123,'Thực phẩm chức năng','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1608704480/hadgfcz1h1z1l920xvwv.png','2020-12-23'),(106,'Panadol Extra','Panadol Extra , uống vô hết bệnh',20000,100,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1611209639/z5xwhcazym3dbskkzueh.png','2021-01-21'),(107,'Thuốc xịn 100','Thuốc này xịn lắm',45000,2345,'Thực phẩm chức năng','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1611296881/hut7ywcfdpz0kfiud2lb.jpg','2021-01-22');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revenue`
--

DROP TABLE IF EXISTS `revenue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revenue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `revenue` int NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revenue`
--

LOCK TABLES `revenue` WRITE;
/*!40000 ALTER TABLE `revenue` DISABLE KEYS */;
INSERT INTO `revenue` VALUES (1,200000,'2020-09-02'),(2,300000,'2020-09-04'),(3,100000,'2020-10-05'),(4,200000,'2020-10-05'),(5,600000,'2020-10-28'),(6,500000,'2020-11-05'),(7,200000,'2020-11-05'),(8,870000,'2020-11-07'),(9,760000,'2020-11-28'),(10,200000,'2020-12-05'),(11,180000,'2020-12-05'),(12,400000,'2020-12-09'),(13,230000,'2020-12-10'),(14,300000,'2020-12-11'),(15,240000,'2020-12-11'),(16,170000,'2020-12-11'),(17,250000,'2020-12-12'),(18,470000,'2020-12-13'),(19,200000,'2020-12-14'),(20,600000,'2020-12-14'),(21,560000,'2020-12-14'),(22,670000,'2020-12-14'),(23,233000,'2020-12-15'),(24,235000,'2020-12-15'),(25,145000,'2020-12-15'),(26,240000,'2020-12-16'),(27,150000,'2020-12-16'),(28,250000,'2020-12-17'),(29,450000,'2020-12-17'),(30,1680000,'2020-12-28'),(31,85000,'2020-12-28'),(32,679000,'2020-12-28'),(33,85000,'2020-12-28'),(34,679000,'2020-12-28'),(35,85000,'2020-12-28'),(36,679000,'2020-12-28'),(37,1080000,'2021-01-08'),(38,1575000,'2021-01-20'),(39,2523000,'2021-01-20'),(40,123456,'2021-01-21'),(41,35000,'2021-01-21'),(42,120000,'2021-01-21'),(43,240000,'2021-01-21'),(44,840000,'2021-01-22'),(45,80000,'2021-01-23'),(46,130000,'2021-01-23');
/*!40000 ALTER TABLE `revenue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unapprovedproduct`
--

DROP TABLE IF EXISTS `unapprovedproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unapprovedproduct` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ProductDescription` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Price` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Category` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Picture` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateAdded` date DEFAULT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unapprovedproduct`
--

LOCK TABLES `unapprovedproduct` WRITE;
/*!40000 ALTER TABLE `unapprovedproduct` DISABLE KEYS */;
INSERT INTO `unapprovedproduct` VALUES (2,'Giảo cổ lam','Giảo cổ lam là loại cây dây leo có tác dụng giảm lượng đường và chloresteron trong máu, lưu thông khí huyết. Hơn nữa, giảo cổ lam có tác dụng làm giảm đau, hạ huyết áp, căng thẳng',75000,120,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530450/product/12_mqkng6.jpg','2018-12-12'),(3,'Cà gai leo','Cà gai leo chủ trị phong thấp, nhức đầu các gân xương, ho khan, ho gà, dị ứng, xơ gan, viêm nhiễm vùng miệng.',80000,130,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530448/product/13_kad7bl.jpg','2018-12-12'),(6,'Vinh','a',10,2,'Dược liệu','https://res.cloudinary.com/dkmk9tdwx/image/upload/v1611235695/kcje4ezxjx7lk99pm80a.png','2021-01-21');
/*!40000 ALTER TABLE `unapprovedproduct` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-02 14:14:23
