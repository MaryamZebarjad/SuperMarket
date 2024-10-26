-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: supermarket4
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `accounts_customer`
--

DROP TABLE IF EXISTS `accounts_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_customer` (
  `user_id` bigint NOT NULL,
  `phone_number` varchar(11) DEFAULT NULL,
  `address` longtext,
  `image_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `accounts_customer_user_id_11606857_fk_accounts_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customer`
--

LOCK TABLES `accounts_customer` WRITE;
/*!40000 ALTER TABLE `accounts_customer` DISABLE KEYS */;
INSERT INTO `accounts_customer` VALUES (29,'820000','address home','images/customer/98e3201a-6f00-471e-a833-5efc43845568.JPG');
/*!40000 ALTER TABLE `accounts_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_customuser`
--

DROP TABLE IF EXISTS `accounts_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `mobile_number` varchar(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `name` varchar(50) NOT NULL,
  `family` varchar(50) NOT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `register_date` date NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `active_code` varchar(100) DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile_number` (`mobile_number`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser`
--

LOCK TABLES `accounts_customuser` WRITE;
/*!40000 ALTER TABLE `accounts_customuser` DISABLE KEYS */;
INSERT INTO `accounts_customuser` VALUES (1,'pbkdf2_sha256$870000$WFGcOWfpIrISnOvcZtftUn$fJJPOZaObMcQlzZGRdWjRAcZ2lIpaw2mR/L9JT7UtTs=','2024-10-21 21:56:57.780237',1,'0990','admin@gmail.com','amir','taheri',NULL,'2024-06-24',1,'65275',1),(29,'pbkdf2_sha256$870000$WqLBrSyg9NN0ILMNZl8QL9$tPiTo5a8lQWcvpjA21UOdMYsVBVSnkpzhD09h4wXxts=','2024-10-21 21:16:53.238278',0,'0915','abol@gmail.com','reza','akbari',NULL,'2024-08-28',1,'12756',0),(31,'pbkdf2_sha256$870000$OhNVtesFMICodoHZyGQLwi$ACrDvX/EGcxETQcW/atwQGwqzrBnAUDyc15WBFf+ZWk=','2024-10-21 21:16:24.845426',0,'0916','','','',NULL,'2024-10-21',1,'73097',0);
/*!40000 ALTER TABLE `accounts_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_customuser_groups`
--

DROP TABLE IF EXISTS `accounts_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_customuser_groups_customuser_id_group_id_c074bdcb_uniq` (`customuser_id`,`group_id`),
  KEY `accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id` (`group_id`),
  CONSTRAINT `accounts_customuser__customuser_id_bc55088e_fk_accounts_` FOREIGN KEY (`customuser_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser_groups`
--

LOCK TABLES `accounts_customuser_groups` WRITE;
/*!40000 ALTER TABLE `accounts_customuser_groups` DISABLE KEYS */;
INSERT INTO `accounts_customuser_groups` VALUES (3,1,1);
/*!40000 ALTER TABLE `accounts_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_customuser_user_permissions`
--

DROP TABLE IF EXISTS `accounts_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_customuser_user_customuser_id_permission_9632a709_uniq` (`customuser_id`,`permission_id`),
  KEY `accounts_customuser__permission_id_aea3d0e5_fk_auth_perm` (`permission_id`),
  CONSTRAINT `accounts_customuser__customuser_id_0deaefae_fk_accounts_` FOREIGN KEY (`customuser_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `accounts_customuser__permission_id_aea3d0e5_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser_user_permissions`
--

LOCK TABLES `accounts_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `accounts_customuser_user_permissions` DISABLE KEYS */;
INSERT INTO `accounts_customuser_user_permissions` VALUES (7,1,1),(8,1,2),(9,1,3),(6,1,4),(10,1,9),(11,1,10),(12,1,21),(13,1,22),(14,1,23),(15,1,24);
/*!40000 ALTER TABLE `accounts_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Gt1'),(2,'Gt2');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (2,1,21),(3,1,22),(4,1,23),(1,1,24),(5,2,1),(6,2,2),(7,2,3),(8,2,4),(9,2,21),(10,2,22),(11,2,23),(12,2,24);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add custom user',6,'add_customuser'),(22,'Can change custom user',6,'change_customuser'),(23,'Can delete custom user',6,'delete_customuser'),(24,'Can view custom user',6,'view_customuser'),(25,'Can add برند',7,'add_brand'),(26,'Can change برند',7,'change_brand'),(27,'Can delete برند',7,'delete_brand'),(28,'Can view برند',7,'view_brand'),(29,'Can add ویژگی',8,'add_feature'),(30,'Can change ویژگی',8,'change_feature'),(31,'Can delete ویژگی',8,'delete_feature'),(32,'Can view ویژگی',8,'view_feature'),(33,'Can add کالا',9,'add_product'),(34,'Can change کالا',9,'change_product'),(35,'Can delete کالا',9,'delete_product'),(36,'Can view کالا',9,'view_product'),(37,'Can add ویژگی محصول',10,'add_productfeature'),(38,'Can change ویژگی محصول',10,'change_productfeature'),(39,'Can delete ویژگی محصول',10,'delete_productfeature'),(40,'Can view ویژگی محصول',10,'view_productfeature'),(41,'Can add تصویر',11,'add_productgallery'),(42,'Can change تصویر',11,'change_productgallery'),(43,'Can delete تصویر',11,'delete_productgallery'),(44,'Can view تصویر',11,'view_productgallery'),(45,'Can add گروه کالا',12,'add_productgroup'),(46,'Can change گروه کالا',12,'change_productgroup'),(47,'Can delete گروه کالا',12,'delete_productgroup'),(48,'Can view گروه کالا',12,'view_productgroup'),(49,'Can add مقدار ویژگی',13,'add_featurevalue'),(50,'Can change مقدار ویژگی',13,'change_featurevalue'),(51,'Can delete مقدار ویژگی',13,'delete_featurevalue'),(52,'Can view مقدار ویژگی',13,'view_featurevalue'),(53,'Can add customer',14,'add_customer'),(54,'Can change customer',14,'change_customer'),(55,'Can delete customer',14,'delete_customer'),(56,'Can view customer',14,'view_customer'),(57,'Can add سفارش',15,'add_order'),(58,'Can change سفارش',15,'change_order'),(59,'Can delete سفارش',15,'delete_order'),(60,'Can view سفارش',15,'view_order'),(61,'Can add order details',16,'add_orderdetails'),(62,'Can change order details',16,'change_orderdetails'),(63,'Can delete order details',16,'delete_orderdetails'),(64,'Can view order details',16,'view_orderdetails'),(65,'Can add نوع پرداخت',17,'add_paymenttype'),(66,'Can change نوع پرداخت',17,'change_paymenttype'),(67,'Can delete نوع پرداخت',17,'delete_paymenttype'),(68,'Can view نوع پرداخت',17,'view_paymenttype'),(69,'Can add کوپن تخفیف',18,'add_coupen'),(70,'Can change کوپن تخفیف',18,'change_coupen'),(71,'Can delete کوپن تخفیف',18,'delete_coupen'),(72,'Can view کوپن تخفیف',18,'view_coupen'),(73,'Can add سبد تخفیف',19,'add_discountbasket'),(74,'Can change سبد تخفیف',19,'change_discountbasket'),(75,'Can delete سبد تخفیف',19,'delete_discountbasket'),(76,'Can view سبد تخفیف',19,'view_discountbasket'),(77,'Can add جزییات سبد تخفیف',20,'add_discountbasketdetails'),(78,'Can change جزییات سبد تخفیف',20,'change_discountbasketdetails'),(79,'Can delete جزییات سبد تخفیف',20,'delete_discountbasketdetails'),(80,'Can view جزییات سبد تخفیف',20,'view_discountbasketdetails'),(81,'Can add کوپن تخفیف',18,'add_coupon'),(82,'Can change کوپن تخفیف',18,'change_coupon'),(83,'Can delete کوپن تخفیف',18,'delete_coupon'),(84,'Can view کوپن تخفیف',18,'view_coupon'),(85,'Can add پرداخت',21,'add_payment'),(86,'Can change پرداخت',21,'change_payment'),(87,'Can delete پرداخت',21,'delete_payment'),(88,'Can view پرداخت',21,'view_payment'),(89,'Can add نوع انبار',22,'add_warehousetype'),(90,'Can change نوع انبار',22,'change_warehousetype'),(91,'Can delete نوع انبار',22,'delete_warehousetype'),(92,'Can view نوع انبار',22,'view_warehousetype'),(93,'Can add انبار',23,'add_warehouse'),(94,'Can change انبار',23,'change_warehouse'),(95,'Can delete انبار',23,'delete_warehouse'),(96,'Can view انبار',23,'view_warehouse'),(97,'Can add نظر',24,'add_comment'),(98,'Can change نظر',24,'change_comment'),(99,'Can delete نظر',24,'delete_comment'),(100,'Can view نظر',24,'view_comment'),(101,'Can add امتیاز',25,'add_scoring'),(102,'Can change امتیاز',25,'change_scoring'),(103,'Can delete امتیاز',25,'delete_scoring'),(104,'Can view امتیاز',25,'view_scoring'),(105,'Can add علاقه',26,'add_favorite'),(106,'Can change علاقه',26,'change_favorite'),(107,'Can delete علاقه',26,'delete_favorite'),(108,'Can view علاقه',26,'view_favorite'),(109,'Can add علاقه',27,'add_favorite'),(110,'Can change علاقه',27,'change_favorite'),(111,'Can delete علاقه',27,'delete_favorite'),(112,'Can view علاقه',27,'view_favorite'),(113,'Can add وضعیت سفارش',28,'add_orderstate'),(114,'Can change وضعیت سفارش',28,'change_orderstate'),(115,'Can delete وضعیت سفارش',28,'delete_orderstate'),(116,'Can view وضعیت سفارش',28,'view_orderstate'),(117,'Can add اسلاید',29,'add_slider'),(118,'Can change اسلاید',29,'change_slider'),(119,'Can delete اسلاید',29,'delete_slider'),(120,'Can view اسلاید',29,'view_slider');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_scoring_favorites_comment`
--

DROP TABLE IF EXISTS `comment_scoring_favorites_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_scoring_favorites_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `comment_text` longtext NOT NULL,
  `register_date` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `approving_user_id` bigint DEFAULT NULL,
  `comment_parent_id` bigint DEFAULT NULL,
  `commenting_user_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_scoring_favo_comment_parent_id_bc33ff60_fk_comment_s` (`comment_parent_id`),
  KEY `comment_scoring_favo_commenting_user_id_f48496b9_fk_accounts_` (`commenting_user_id`),
  KEY `comment_scoring_favo_product_id_16b120b4_fk_products_` (`product_id`),
  KEY `comment_scoring_favo_approving_user_id_25e116f1_fk_accounts_` (`approving_user_id`),
  CONSTRAINT `comment_scoring_favo_approving_user_id_25e116f1_fk_accounts_` FOREIGN KEY (`approving_user_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `comment_scoring_favo_comment_parent_id_bc33ff60_fk_comment_s` FOREIGN KEY (`comment_parent_id`) REFERENCES `comment_scoring_favorites_comment` (`id`),
  CONSTRAINT `comment_scoring_favo_commenting_user_id_f48496b9_fk_accounts_` FOREIGN KEY (`commenting_user_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `comment_scoring_favo_product_id_16b120b4_fk_products_` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_scoring_favorites_comment`
--

LOCK TABLES `comment_scoring_favorites_comment` WRITE;
/*!40000 ALTER TABLE `comment_scoring_favorites_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_scoring_favorites_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_scoring_favorites_favorite`
--

DROP TABLE IF EXISTS `comment_scoring_favorites_favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_scoring_favorites_favorite` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `register_date` datetime(6) NOT NULL,
  `favorite_user_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_scoring_favo_favorite_user_id_c5146b93_fk_accounts_` (`favorite_user_id`),
  KEY `comment_scoring_favo_product_id_45b406cd_fk_products_` (`product_id`),
  CONSTRAINT `comment_scoring_favo_favorite_user_id_c5146b93_fk_accounts_` FOREIGN KEY (`favorite_user_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `comment_scoring_favo_product_id_45b406cd_fk_products_` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_scoring_favorites_favorite`
--

LOCK TABLES `comment_scoring_favorites_favorite` WRITE;
/*!40000 ALTER TABLE `comment_scoring_favorites_favorite` DISABLE KEYS */;
INSERT INTO `comment_scoring_favorites_favorite` VALUES (26,'2024-10-21 21:16:35.298973',31,8),(30,'2024-10-21 21:47:16.208309',29,22),(31,'2024-10-21 22:24:00.933494',1,5),(32,'2024-10-21 22:24:36.084120',1,8),(33,'2024-10-21 22:38:22.352188',1,9),(34,'2024-10-21 22:39:43.210941',1,10),(35,'2024-10-21 22:40:31.246078',1,2),(36,'2024-10-21 22:42:10.729166',1,23);
/*!40000 ALTER TABLE `comment_scoring_favorites_favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_scoring_favorites_scoring`
--

DROP TABLE IF EXISTS `comment_scoring_favorites_scoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_scoring_favorites_scoring` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `register_date` datetime(6) NOT NULL,
  `score` smallint unsigned NOT NULL,
  `product_id` bigint NOT NULL,
  `scoring_user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_scoring_favo_product_id_38c2dbe8_fk_products_` (`product_id`),
  KEY `comment_scoring_favo_scoring_user_id_33462d7e_fk_accounts_` (`scoring_user_id`),
  CONSTRAINT `comment_scoring_favo_product_id_38c2dbe8_fk_products_` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`),
  CONSTRAINT `comment_scoring_favo_scoring_user_id_33462d7e_fk_accounts_` FOREIGN KEY (`scoring_user_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `comment_scoring_favorites_scoring_chk_1` CHECK ((`score` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_scoring_favorites_scoring`
--

LOCK TABLES `comment_scoring_favorites_scoring` WRITE;
/*!40000 ALTER TABLE `comment_scoring_favorites_scoring` DISABLE KEYS */;
INSERT INTO `comment_scoring_favorites_scoring` VALUES (82,'2024-10-10 20:05:17.048790',3,18,1),(83,'2024-10-10 20:05:19.142344',2,18,1),(84,'2024-10-19 11:52:52.468731',1,5,29),(85,'2024-10-19 11:52:58.505863',1,5,29),(86,'2024-10-19 11:53:01.593885',3,5,29),(87,'2024-10-19 11:53:18.562014',4,5,29),(88,'2024-10-19 11:56:29.368772',1,4,29),(89,'2024-10-19 11:56:32.394834',3,4,29),(90,'2024-10-19 12:00:11.533440',2,9,29),(91,'2024-10-19 12:04:36.422737',2,12,29),(92,'2024-10-19 12:08:27.338798',3,14,29),(93,'2024-10-21 19:35:06.509457',2,12,1),(94,'2024-10-21 19:35:32.372868',3,20,1),(95,'2024-10-21 19:36:27.527495',4,20,29),(96,'2024-10-21 19:57:08.369706',2,24,1);
/*!40000 ALTER TABLE `comment_scoring_favorites_scoring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts_coupon`
--

DROP TABLE IF EXISTS `discounts_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts_coupon` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `coupon_code` varchar(10) NOT NULL,
  `start_date` datetime(6) NOT NULL,
  `end_date` datetime(6) NOT NULL,
  `discount` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupen_code` (`coupon_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts_coupon`
--

LOCK TABLES `discounts_coupon` WRITE;
/*!40000 ALTER TABLE `discounts_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `discounts_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts_discountbasket`
--

DROP TABLE IF EXISTS `discounts_discountbasket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts_discountbasket` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `discount_title` varchar(100) NOT NULL,
  `start_date` datetime(6) NOT NULL,
  `end_date` datetime(6) NOT NULL,
  `discount` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts_discountbasket`
--

LOCK TABLES `discounts_discountbasket` WRITE;
/*!40000 ALTER TABLE `discounts_discountbasket` DISABLE KEYS */;
/*!40000 ALTER TABLE `discounts_discountbasket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts_discountbasketdetails`
--

DROP TABLE IF EXISTS `discounts_discountbasketdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts_discountbasketdetails` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `discount_basket_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discounts_discountba_discount_basket_id_bf6bb9b3_fk_discounts` (`discount_basket_id`),
  KEY `discounts_discountba_product_id_0a8a924c_fk_products_` (`product_id`),
  CONSTRAINT `discounts_discountba_discount_basket_id_bf6bb9b3_fk_discounts` FOREIGN KEY (`discount_basket_id`) REFERENCES `discounts_discountbasket` (`id`),
  CONSTRAINT `discounts_discountba_product_id_0a8a924c_fk_products_` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts_discountbasketdetails`
--

LOCK TABLES `discounts_discountbasketdetails` WRITE;
/*!40000 ALTER TABLE `discounts_discountbasketdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `discounts_discountbasketdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-06-28 19:36:37.575408','2','zahra taheri',1,'[{\"added\": {}}]',6,1),(2,'2024-06-28 19:37:05.326691','2','zahra taheri',2,'[{\"changed\": {\"fields\": [\"Is active\", \"Is admin\"]}}]',6,1),(3,'2024-06-28 19:42:55.556812','2','zahra taheri',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',6,1),(4,'2024-07-01 15:04:39.851251','1','Gt1',1,'[{\"added\": {}}]',3,1),(5,'2024-07-01 15:05:14.874143','2','Gt2',1,'[{\"added\": {}}]',3,1),(6,'2024-07-01 15:06:39.806852','1','Gt1',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(7,'2024-07-01 15:06:57.445512','2','Gt2',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(8,'2024-07-01 15:12:53.576322','2','zahra taheri',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',6,1),(9,'2024-07-01 15:13:11.694561','1','amir taheri',2,'[{\"changed\": {\"fields\": [\"Groups\", \"User permissions\"]}}]',6,1),(10,'2024-07-01 15:14:25.735574','1','amir taheri',2,'[{\"changed\": {\"fields\": [\"Groups\", \"User permissions\"]}}]',6,1),(11,'2024-07-01 15:14:48.504495','1','amir taheri',2,'[{\"changed\": {\"fields\": [\"Groups\", \"User permissions\"]}}]',6,1),(12,'2024-07-01 15:14:57.223076','2','zahra taheri',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',6,1),(13,'2024-07-01 15:16:47.749402','2','zahra taheri',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',6,1),(14,'2024-07-01 15:17:08.795549','2','zahra taheri',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',6,1),(15,'2024-07-15 15:53:07.676917','1','LG',1,'[{\"added\": {}}]',7,1),(16,'2024-07-15 15:53:30.917520','2','sony',1,'[{\"added\": {}}]',7,1),(17,'2024-07-15 16:05:51.893597','1','کالا دیجیتال',1,'[{\"added\": {}}]',12,1),(18,'2024-07-15 16:08:19.441443','2','لپ تاپ',1,'[{\"added\": {}}]',12,1),(19,'2024-07-15 16:33:31.721218','3','مد و پوشاک',1,'[{\"added\": {}}, {\"added\": {\"name\": \"\\u06af\\u0631\\u0648\\u0647 \\u06a9\\u0627\\u0644\\u0627\", \"object\": \"\\u0645\\u0631\\u062f\\u0627\\u0646\\u0647\"}}, {\"added\": {\"name\": \"\\u06af\\u0631\\u0648\\u0647 \\u06a9\\u0627\\u0644\\u0627\", \"object\": \"\\u0632\\u0646\\u0627\\u0646\\u0647\"}}]',12,1),(20,'2024-07-16 15:32:19.699647','2','لپ تاپ',2,'[{\"changed\": {\"fields\": [\"\\u0648\\u0636\\u0639\\u06cc\\u062a \\u0641\\u0639\\u0627\\u0644 / \\u063a\\u06cc\\u0631 \\u0641\\u0639\\u0627\\u0644\"]}}]',12,1),(21,'2024-07-17 14:50:03.495599','1','کالا دیجیتال',2,'[{\"changed\": {\"fields\": [\"\\u0648\\u0636\\u0639\\u06cc\\u062a \\u0641\\u0639\\u0627\\u0644 / \\u063a\\u06cc\\u0631 \\u0641\\u0639\\u0627\\u0644\"]}}]',12,1),(22,'2024-07-17 17:32:04.022545','6','saxca',1,'[{\"added\": {}}]',12,1),(23,'2024-07-17 17:36:24.164729','6','saxca',3,'',12,1),(24,'2024-07-17 18:48:14.324203','7','sdas',1,'[{\"added\": {}}]',12,1),(25,'2024-07-17 18:51:29.185262','8','sacxa',1,'[{\"added\": {}}]',12,1),(26,'2024-07-17 18:51:59.413054','9','saxccas',1,'[{\"added\": {}}]',12,1),(27,'2024-07-17 18:52:08.663751','10','dcsc',1,'[{\"added\": {}}]',12,1),(28,'2024-07-17 19:03:01.518962','11','sdcscsc',1,'[{\"added\": {}}]',12,1),(29,'2024-07-17 19:03:37.670605','12','xcazdcs',1,'[{\"added\": {}}]',12,1),(30,'2024-07-17 19:03:46.374982','13','scasca',1,'[{\"added\": {}}]',12,1),(31,'2024-07-17 19:08:49.332352','14','ascasc',1,'[{\"added\": {}}]',12,1),(32,'2024-07-17 19:09:50.154793','15','sacxasc',1,'[{\"added\": {}}]',12,1),(33,'2024-07-17 19:10:05.453735','16','dcsd',1,'[{\"added\": {}}]',12,1),(34,'2024-07-17 19:11:40.181089','17','dcsadcas',1,'[{\"added\": {}}]',12,1),(35,'2024-07-17 19:12:09.385908','18','scsa',1,'[{\"added\": {}}]',12,1),(36,'2024-07-17 19:12:18.184793','19','scascsa',1,'[{\"added\": {}}]',12,1),(37,'2024-07-17 19:16:03.927292','20','sdfcdc',1,'[{\"added\": {}}]',12,1),(38,'2024-07-17 19:16:13.905307','21','sacaac',1,'[{\"added\": {}}]',12,1),(39,'2024-07-17 19:17:02.199214','22','sdcsdca',1,'[{\"added\": {}}]',12,1),(40,'2024-07-18 13:22:40.390767','3','apple',1,'[{\"added\": {}}]',7,1),(41,'2024-07-18 13:23:53.743876','1','iphone',1,'[{\"added\": {}}]',9,1),(42,'2024-07-18 13:27:41.546029','4','beats',1,'[{\"added\": {}}]',7,1),(43,'2024-07-18 13:27:59.361222','2','headphone',1,'[{\"added\": {}}]',9,1),(44,'2024-07-18 13:28:38.157847','2','headphone',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0635\\u0648\\u06cc\\u0631 \\u06a9\\u0627\\u0644\\u0627\", \"\\u0642\\u06cc\\u0645\\u062a \\u06a9\\u0627\\u0644\\u0627\"]}}]',9,1),(45,'2024-07-18 14:27:42.944598','1','وزن',1,'[{\"added\": {}}]',8,1),(46,'2024-07-18 14:28:03.876490','2','رنگ',1,'[{\"added\": {}}]',8,1),(47,'2024-07-18 14:28:16.760218','2','رنگ',2,'[{\"changed\": {\"fields\": [\"\\u06af\\u0631\\u0648\\u0647 \\u06a9\\u0627\\u0644\\u0627\"]}}]',8,1),(48,'2024-07-18 14:28:44.360600','3','اندازه',1,'[{\"added\": {}}]',8,1),(49,'2024-07-18 14:29:31.393808','2','headphone',2,'[{\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"headphone - \\u0631\\u0646\\u06af : \\u0645\\u0634\\u06a9\\u06cc\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"headphone - \\u0627\\u0646\\u062f\\u0627\\u0632\\u0647 : 15\"}}]',9,1),(50,'2024-07-20 18:51:33.446110','2','zahra taheri',3,'',6,1),(51,'2024-07-27 11:45:25.691821','3','apple',3,'',7,1),(52,'2024-07-27 11:45:25.698820','4','beats',3,'',7,1),(53,'2024-07-27 11:45:25.704819','1','LG',3,'',7,1),(54,'2024-07-27 11:45:25.711894','2','sony',3,'',7,1),(55,'2024-07-27 11:45:41.614727','3','اندازه',3,'',8,1),(56,'2024-07-27 11:45:41.628727','2','رنگ',3,'',8,1),(57,'2024-07-27 11:45:41.631727','1','وزن',3,'',8,1),(58,'2024-07-27 11:49:13.592229','5','آدیداس',1,'[{\"added\": {}}]',7,1),(59,'2024-07-27 11:49:53.783215','6','اپل',1,'[{\"added\": {}}]',7,1),(60,'2024-07-27 11:50:16.721407','7','ال جی',1,'[{\"added\": {}}]',7,1),(61,'2024-07-27 11:50:40.257174','8','ایسوس',1,'[{\"added\": {}}]',7,1),(62,'2024-07-27 11:51:01.212194','9','اینتل',1,'[{\"added\": {}}]',7,1),(63,'2024-07-27 11:52:11.716857','10','میهن',1,'[{\"added\": {}}]',7,1),(64,'2024-07-27 11:52:32.023729','11','نایک',1,'[{\"added\": {}}]',7,1),(65,'2024-07-27 13:36:41.562269','23','کالا دیجیتال',1,'[{\"added\": {}}, {\"added\": {\"name\": \"\\u06af\\u0631\\u0648\\u0647 \\u06a9\\u0627\\u0644\\u0627\", \"object\": \"\\u062f\\u0648\\u0631\\u0628\\u06cc\\u0646\"}}, {\"added\": {\"name\": \"\\u06af\\u0631\\u0648\\u0647 \\u06a9\\u0627\\u0644\\u0627\", \"object\": \"\\u06a9\\u0627\\u0645\\u067e\\u06cc\\u0648\\u062a\\u0631 \\u0648 \\u062a\\u062c\\u0647\\u06cc\\u0632\\u0627\\u062a\"}}, {\"added\": {\"name\": \"\\u06af\\u0631\\u0648\\u0647 \\u06a9\\u0627\\u0644\\u0627\", \"object\": \"\\u0644\\u067e \\u062a\\u0627\\u067e\"}}, {\"added\": {\"name\": \"\\u06af\\u0631\\u0648\\u0647 \\u06a9\\u0627\\u0644\\u0627\", \"object\": \"\\u0645\\u0648\\u0628\\u0627\\u06cc\\u0644\"}}]',12,1),(66,'2024-07-27 13:42:36.172979','28','مد و پوشاک',1,'[{\"added\": {}}, {\"added\": {\"name\": \"\\u06af\\u0631\\u0648\\u0647 \\u06a9\\u0627\\u0644\\u0627\", \"object\": \"\\u0628\\u0686\\u0647 \\u06af\\u0627\\u0646\\u0647\"}}, {\"added\": {\"name\": \"\\u06af\\u0631\\u0648\\u0647 \\u06a9\\u0627\\u0644\\u0627\", \"object\": \"\\u0632\\u0646\\u0627\\u0646\\u0647\"}}, {\"added\": {\"name\": \"\\u06af\\u0631\\u0648\\u0647 \\u06a9\\u0627\\u0644\\u0627\", \"object\": \"\\u0645\\u0631\\u062f\\u0627\\u0646\\u0647\"}}]',12,1),(67,'2024-07-27 13:48:14.890914','32','لبنیات',1,'[{\"added\": {}}, {\"added\": {\"name\": \"\\u06af\\u0631\\u0648\\u0647 \\u06a9\\u0627\\u0644\\u0627\", \"object\": \"\\u067e\\u0646\\u06cc\\u0631\"}}, {\"added\": {\"name\": \"\\u06af\\u0631\\u0648\\u0647 \\u06a9\\u0627\\u0644\\u0627\", \"object\": \"\\u0634\\u06cc\\u0631\"}}, {\"added\": {\"name\": \"\\u06af\\u0631\\u0648\\u0647 \\u06a9\\u0627\\u0644\\u0627\", \"object\": \"\\u0645\\u0627\\u0633\\u062a\"}}]',12,1),(68,'2024-07-27 13:57:58.331557','36','کالای سوپر مارکتی',1,'[{\"added\": {}}, {\"added\": {\"name\": \"\\u06af\\u0631\\u0648\\u0647 \\u06a9\\u0627\\u0644\\u0627\", \"object\": \"\\u062a\\u0646\\u0642\\u0644\\u0627\\u062a\"}}, {\"added\": {\"name\": \"\\u06af\\u0631\\u0648\\u0647 \\u06a9\\u0627\\u0644\\u0627\", \"object\": \"\\u0644\\u0628\\u0646\\u06cc\\u0627\\u062a\"}}, {\"added\": {\"name\": \"\\u06af\\u0631\\u0648\\u0647 \\u06a9\\u0627\\u0644\\u0627\", \"object\": \"\\u0645\\u0648\\u0627\\u062f \\u067e\\u0631\\u0648\\u062a\\u0626\\u06cc\\u0646\\u06cc \\u0648 \\u062a\\u062e\\u0645 \\u0645\\u0631\\u063a\"}}]',12,1),(69,'2024-07-27 13:59:36.589277','33','پنیر',2,'[{\"changed\": {\"fields\": [\"\\u0648\\u0627\\u0644\\u062f \\u06af\\u0631\\u0648\\u0647 \\u06a9\\u0627\\u0644\\u0627\"]}}]',12,1),(70,'2024-07-27 13:59:47.853152','34','شیر',2,'[{\"changed\": {\"fields\": [\"\\u0648\\u0627\\u0644\\u062f \\u06af\\u0631\\u0648\\u0647 \\u06a9\\u0627\\u0644\\u0627\"]}}]',12,1),(71,'2024-07-27 14:00:23.745348','35','ماست',2,'[{\"changed\": {\"fields\": [\"\\u0648\\u0627\\u0644\\u062f \\u06af\\u0631\\u0648\\u0647 \\u06a9\\u0627\\u0644\\u0627\"]}}]',12,1),(72,'2024-07-27 14:00:40.541233','32','لبنیات',3,'',12,1),(73,'2024-07-27 14:02:16.151257','40','ورزشی و کوهنوردی',1,'[{\"added\": {}}]',12,1),(74,'2024-07-27 14:09:27.787914','41','پوشاک ورزشی',1,'[{\"added\": {}}]',12,1),(75,'2024-07-27 14:10:51.427651','42','لوازم ورزشی',1,'[{\"added\": {}}]',12,1),(76,'2024-07-27 14:13:07.792623','43','اسنک و پفک',1,'[{\"added\": {}}]',12,1),(77,'2024-07-27 14:13:58.287079','44','پاستیل',1,'[{\"added\": {}}]',12,1),(78,'2024-07-27 14:15:51.464801','45','پنیر پرچرب',1,'[{\"added\": {}}]',12,1),(79,'2024-07-27 14:16:54.123021','46','چنیر خامه ای',1,'[{\"added\": {}}]',12,1),(80,'2024-07-27 14:18:07.207935','47','شیر طعم دار',1,'[{\"added\": {}}]',12,1),(81,'2024-07-27 14:19:05.450963','48','شیر کم پرب',1,'[{\"added\": {}}]',12,1),(82,'2024-07-28 15:46:08.889604','3','پفک چیتوز موتوری',1,'[{\"added\": {}}]',9,1),(83,'2024-07-29 17:48:32.398477','12','مینو',1,'[{\"added\": {}}]',7,1),(84,'2024-07-29 17:48:53.788205','3','پفک نمکی مینو',2,'[{\"changed\": {\"fields\": [\"\\u0646\\u0627\\u0645 \\u06a9\\u0627\\u0644\\u0627\\u0647\\u0627\", \"\\u062a\\u0635\\u0648\\u06cc\\u0631 \\u06a9\\u0627\\u0644\\u0627\", \"\\u0628\\u0631\\u0646\\u062f \\u06a9\\u0627\\u0644\\u0627\", \"Discription\"]}}]',9,1),(85,'2024-07-29 17:49:31.376489','3','پفک نمکی مینو - 110 گرم',2,'[{\"changed\": {\"fields\": [\"\\u0646\\u0627\\u0645 \\u06a9\\u0627\\u0644\\u0627\\u0647\\u0627\", \"\\u062a\\u0635\\u0648\\u06cc\\u0631 \\u06a9\\u0627\\u0644\\u0627\"]}}]',9,1),(86,'2024-07-29 17:53:50.399779','4','پنیر خامه ای ویلی کاله - 1 کیلوگرم',1,'[{\"added\": {}}]',9,1),(87,'2024-07-29 18:25:20.786057','5','شیر پرچرب مینو - یک لیتر بسته 4 عددی',1,'[{\"added\": {}}]',9,1),(88,'2024-07-30 17:06:17.132233','4','وزن',1,'[{\"added\": {}}]',8,1),(89,'2024-07-30 17:08:17.812919','5','لیتر',1,'[{\"added\": {}}]',8,1),(90,'2024-07-30 17:10:35.742596','5','شیر پرچرب مینو - یک لیتر بسته 4 عددی',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0635\\u0648\\u06cc\\u0631 \\u06a9\\u0627\\u0644\\u0627\", \"\\u0628\\u0631\\u0646\\u062f \\u06a9\\u0627\\u0644\\u0627\", \"Discription\"]}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0634\\u06cc\\u0631 \\u067e\\u0631\\u0686\\u0631\\u0628 \\u0645\\u06cc\\u0646\\u0648 - \\u06cc\\u06a9 \\u0644\\u06cc\\u062a\\u0631 \\u0628\\u0633\\u062a\\u0647 4 \\u0639\\u062f\\u062f\\u06cc - \\u0644\\u06cc\\u062a\\u0631 : \\u06cc\\u06a9 \\u0644\\u06cc\\u062a\\u0631\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0634\\u06cc\\u0631 \\u067e\\u0631\\u0686\\u0631\\u0628 \\u0645\\u06cc\\u0646\\u0648 - \\u06cc\\u06a9 \\u0644\\u06cc\\u062a\\u0631 \\u0628\\u0633\\u062a\\u0647 4 \\u0639\\u062f\\u062f\\u06cc - \\u0648\\u0632\\u0646 : 450 \\u06af\\u0631\\u0645\"}}]',9,1),(91,'2024-07-30 17:16:34.217372','5','شیر پرچرب مینو - یک لیتر بسته 4 عددی',2,'[{\"changed\": {\"fields\": [\"Discription\"]}}]',9,1),(92,'2024-07-30 17:18:05.821484','5','شیر پرچرب مینو - یک لیتر بسته 4 عددی',2,'[{\"changed\": {\"fields\": [\"Discription\"]}}]',9,1),(93,'2024-07-30 17:18:31.113539','5','شیر پرچرب مینو - یک لیتر بسته 4 عددی',2,'[{\"changed\": {\"fields\": [\"Discription\"]}}]',9,1),(94,'2024-07-31 14:13:37.161815','5','شیر پرچرب مینو - یک لیتر بسته 4 عددی',2,'[{\"changed\": {\"fields\": [\"Discription\"]}}, {\"added\": {\"name\": \"\\u062a\\u0635\\u0648\\u06cc\\u0631\", \"object\": \"ProductGallery object (1)\"}}, {\"added\": {\"name\": \"\\u062a\\u0635\\u0648\\u06cc\\u0631\", \"object\": \"ProductGallery object (2)\"}}]',9,1),(95,'2024-08-01 11:26:48.590384','4','پنیر خامه ای ویلی کاله - 1 کیلوگرم',2,'[{\"changed\": {\"fields\": [\"\\u06af\\u0631\\u0648\\u0647 \\u06a9\\u0627\\u0644\\u0627\"]}}]',9,1),(96,'2024-08-01 11:27:04.930813','3','پفک نمکی مینو - 110 گرم',2,'[{\"changed\": {\"fields\": [\"\\u06af\\u0631\\u0648\\u0647 \\u06a9\\u0627\\u0644\\u0627\", \"Discription\"]}}]',9,1),(97,'2024-08-01 11:27:27.977239','4','پنیر خامه ای ویلی کاله - 1 کیلوگرم',2,'[{\"changed\": {\"fields\": [\"\\u0648\\u0636\\u0639\\u06cc\\u062a \\u0641\\u0639\\u0627\\u0644 / \\u063a\\u06cc\\u0631 \\u0641\\u0639\\u0627\\u0644\"]}}]',9,1),(98,'2024-08-01 11:27:35.749920','4','پنیر خامه ای ویلی کاله - 1 کیلوگرم',2,'[{\"changed\": {\"fields\": [\"\\u0648\\u0636\\u0639\\u06cc\\u062a \\u0641\\u0639\\u0627\\u0644 / \\u063a\\u06cc\\u0631 \\u0641\\u0639\\u0627\\u0644\"]}}]',9,1),(99,'2024-08-01 12:48:50.469470','5','شیر پرچرب مینو - یک لیتر بسته 4 عددی',2,'[{\"changed\": {\"fields\": [\"\\u0642\\u06cc\\u0645\\u062a \\u06a9\\u0627\\u0644\\u0627\"]}}]',9,1),(100,'2024-08-01 16:28:27.076709','5','شیر پرچرب مینو - یک لیتر بسته 4 عددی',2,'[{\"changed\": {\"fields\": [\"\\u06af\\u0631\\u0648\\u0647 \\u06a9\\u0627\\u0644\\u0627\"]}}]',9,1),(101,'2024-08-01 16:29:07.010161','46','پنیر خامه ای',2,'[{\"changed\": {\"fields\": [\"\\u0639\\u0646\\u0648\\u0627\\u0646 \\u06af\\u0631\\u0648\\u0647 \\u06a9\\u0627\\u0644\\u0627\"]}}]',12,1),(102,'2024-08-01 16:29:45.882141','34','شیر',2,'[]',12,1),(103,'2024-08-01 16:33:05.741373','5','شیر پرچرب مینو - یک لیتر بسته 4 عددی',2,'[]',9,1),(104,'2024-08-02 11:00:23.320274','4','پنیر خامه ای ویلی کاله - 1 کیلوگرم',2,'[{\"changed\": {\"fields\": [\"\\u0642\\u06cc\\u0645\\u062a \\u06a9\\u0627\\u0644\\u0627\"]}}]',9,1),(105,'2024-08-02 11:07:37.660189','5','شیر پرچرب مینو - یک لیتر بسته 4 عددی',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',9,1),(106,'2024-08-02 11:10:11.637582','5','شیر پرچرب مینو - یک لیتر بسته 4 عددی',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',9,1),(107,'2024-08-02 18:25:47.468716','6','استین',1,'[{\"added\": {}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"1  \\u0628\\u0644\\u0646\\u062f\"}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"2  \\u06a9\\u0648\\u062a\\u0627\\u0647\"}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"3  \\u0627\\u0641\\u062a\\u0627\\u062f\\u0647\"}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"4  \\u0633\\u0647 \\u0631\\u0628\\u0639\"}}]',8,1),(108,'2024-08-02 18:53:45.609046','7','رنگ',1,'[{\"added\": {}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"5  \\u0645\\u0634\\u06a9\\u06cc\"}}]',8,1),(109,'2024-08-02 18:59:26.309738','7','رنگ',2,'[{\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"6  \\u0633\\u0641\\u06cc\\u062f\"}}]',8,1),(110,'2024-08-06 11:34:43.999810','3','پفک نمکی مینو - 110 گرم',2,'[{\"changed\": {\"fields\": [\"\\u0642\\u06cc\\u0645\\u062a \\u06a9\\u0627\\u0644\\u0627\"]}}]',9,1),(111,'2024-08-06 11:34:59.001153','4','پنیر خامه ای ویلی کاله - 1 کیلوگرم',2,'[{\"changed\": {\"fields\": [\"\\u0642\\u06cc\\u0645\\u062a \\u06a9\\u0627\\u0644\\u0627\"]}}]',9,1),(112,'2024-08-09 00:01:19.339999','4','پنیر خامه ای ویلی کاله - 1 کیلوگرم',2,'[{\"changed\": {\"fields\": [\"\\u0628\\u0631\\u0646\\u062f \\u06a9\\u0627\\u0644\\u0627\"]}}]',9,1),(113,'2024-08-15 00:33:42.252311','8','مشکی',1,'[{\"added\": {}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"7  \\u0645\\u0634\\u06a9\\u06cc\"}}]',8,1),(114,'2024-08-15 00:33:53.681652','6','لباس دخترانه',1,'[{\"added\": {}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0644\\u0628\\u0627\\u0633 \\u062f\\u062e\\u062a\\u0631\\u0627\\u0646\\u0647 - \\u0627\\u0633\\u062a\\u06cc\\u0646 : \\u0628\\u0644\\u0646\\u062f\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0644\\u0628\\u0627\\u0633 \\u062f\\u062e\\u062a\\u0631\\u0627\\u0646\\u0647 - \\u0645\\u0634\\u06a9\\u06cc : \\u0645\\u0634\\u06a9\\u06cc\"}}]',9,1),(115,'2024-08-28 10:37:26.910706','28','mehdi abbasi',1,'[{\"added\": {}}]',6,1),(116,'2024-08-28 10:37:53.068633','28','mehdi abbasi',1,'[{\"added\": {}}]',14,1),(117,'2024-08-28 10:38:37.912867','28','mehdi abbasi',2,'[]',14,1),(118,'2024-08-28 15:19:47.593601','28','mehdi abbasi',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',6,1),(119,'2024-08-28 15:25:07.895294','29','reza ',1,'[{\"added\": {}}]',14,1),(120,'2024-09-02 15:47:45.663370','1','abcd',1,'[{\"added\": {}}]',18,1),(121,'2024-09-02 16:21:28.156092','2','as',1,'[{\"added\": {}}]',18,1),(122,'2024-09-02 16:22:39.643658','3','شب یلدا',1,'[{\"added\": {}}]',18,1),(123,'2024-09-02 16:22:54.079400','3','شب یلدا',3,'',18,1),(124,'2024-09-02 16:23:48.550982','1','شب یلدا',1,'[{\"added\": {}}, {\"added\": {\"name\": \"\\u062c\\u0632\\u06cc\\u06cc\\u0627\\u062a \\u0633\\u0628\\u062f \\u062a\\u062e\\u0641\\u06cc\\u0641\", \"object\": \"DiscountBasketDetails object (1)\"}}, {\"added\": {\"name\": \"\\u062c\\u0632\\u06cc\\u06cc\\u0627\\u062a \\u0633\\u0628\\u062f \\u062a\\u062e\\u0641\\u06cc\\u0641\", \"object\": \"DiscountBasketDetails object (2)\"}}, {\"added\": {\"name\": \"\\u062c\\u0632\\u06cc\\u06cc\\u0627\\u062a \\u0633\\u0628\\u062f \\u062a\\u062e\\u0641\\u06cc\\u0641\", \"object\": \"DiscountBasketDetails object (3)\"}}]',19,1),(125,'2024-09-02 16:24:36.079601','1','شب یلدا',3,'',19,1),(126,'2024-09-02 16:25:08.691742','2','شب یلدا',1,'[{\"added\": {}}, {\"added\": {\"name\": \"\\u062c\\u0632\\u06cc\\u06cc\\u0627\\u062a \\u0633\\u0628\\u062f \\u062a\\u062e\\u0641\\u06cc\\u0641\", \"object\": \"DiscountBasketDetails object (4)\"}}, {\"added\": {\"name\": \"\\u062c\\u0632\\u06cc\\u06cc\\u0627\\u062a \\u0633\\u0628\\u062f \\u062a\\u062e\\u0641\\u06cc\\u0641\", \"object\": \"DiscountBasketDetails object (5)\"}}, {\"added\": {\"name\": \"\\u062c\\u0632\\u06cc\\u06cc\\u0627\\u062a \\u0633\\u0628\\u062f \\u062a\\u062e\\u0641\\u06cc\\u0641\", \"object\": \"DiscountBasketDetails object (6)\"}}]',19,1),(127,'2024-09-02 16:25:35.035876','2','شب یلدا',2,'[{\"deleted\": {\"name\": \"\\u062c\\u0632\\u06cc\\u06cc\\u0627\\u062a \\u0633\\u0628\\u062f \\u062a\\u062e\\u0641\\u06cc\\u0641\", \"object\": \"DiscountBasketDetails object (None)\"}}]',19,1),(128,'2024-09-02 16:25:43.522542','2','شب یلدا',2,'[]',19,1),(129,'2024-09-02 16:26:20.676139','3','روز دانشجو',1,'[{\"added\": {}}, {\"added\": {\"name\": \"\\u062c\\u0632\\u06cc\\u06cc\\u0627\\u062a \\u0633\\u0628\\u062f \\u062a\\u062e\\u0641\\u06cc\\u0641\", \"object\": \"DiscountBasketDetails object (7)\"}}, {\"added\": {\"name\": \"\\u062c\\u0632\\u06cc\\u06cc\\u0627\\u062a \\u0633\\u0628\\u062f \\u062a\\u062e\\u0641\\u06cc\\u0641\", \"object\": \"DiscountBasketDetails object (8)\"}}]',19,1),(130,'2024-09-02 16:27:03.523458','3','روز دانشجو',2,'[{\"changed\": {\"name\": \"\\u062c\\u0632\\u06cc\\u06cc\\u0627\\u062a \\u0633\\u0628\\u062f \\u062a\\u062e\\u0641\\u06cc\\u0641\", \"object\": \"DiscountBasketDetails object (7)\", \"fields\": [\"\\u06a9\\u0627\\u0644\\u0627\"]}}, {\"changed\": {\"name\": \"\\u062c\\u0632\\u06cc\\u06cc\\u0627\\u062a \\u0633\\u0628\\u062f \\u062a\\u062e\\u0641\\u06cc\\u0641\", \"object\": \"DiscountBasketDetails object (8)\", \"fields\": [\"\\u06a9\\u0627\\u0644\\u0627\"]}}]',19,1),(131,'2024-09-02 16:27:18.531424','2','شب یلدا',2,'[{\"added\": {\"name\": \"\\u062c\\u0632\\u06cc\\u06cc\\u0627\\u062a \\u0633\\u0628\\u062f \\u062a\\u062e\\u0641\\u06cc\\u0641\", \"object\": \"DiscountBasketDetails object (9)\"}}]',19,1),(132,'2024-09-02 16:27:28.007520','2','شب یلدا',2,'[{\"deleted\": {\"name\": \"\\u062c\\u0632\\u06cc\\u06cc\\u0627\\u062a \\u0633\\u0628\\u062f \\u062a\\u062e\\u0641\\u06cc\\u0641\", \"object\": \"DiscountBasketDetails object (None)\"}}]',19,1),(133,'2024-09-08 15:18:07.136839','2','aفروش',2,'[{\"changed\": {\"fields\": [\"\\u0646\\u0648\\u0639 \\u0627\\u0646\\u0628\\u0627\\u0631\"]}}]',22,1),(134,'2024-09-08 15:18:14.478392','2','فروش',2,'[{\"changed\": {\"fields\": [\"\\u0646\\u0648\\u0639 \\u0627\\u0646\\u0628\\u0627\\u0631\"]}}]',22,1),(135,'2024-09-08 15:36:30.816207','8','خرید',1,'[{\"added\": {}}]',23,1),(136,'2024-09-08 15:37:02.482145','9','خرید',1,'[{\"added\": {}}]',23,1),(137,'2024-09-08 15:37:15.773711','10','خرید',1,'[{\"added\": {}}]',23,1),(138,'2024-09-08 17:42:08.066515','11','فروش',1,'[{\"added\": {}}]',23,1),(139,'2024-09-08 17:54:21.504788','12','خرید',1,'[{\"added\": {}}]',23,1),(140,'2024-09-11 11:34:31.761654','13','فروش',1,'[{\"added\": {}}]',23,1),(141,'2024-09-12 13:32:24.661566','1','لباس دخترانه reza akbari',1,'[{\"added\": {}}]',24,1),(142,'2024-09-15 11:24:05.451494','2','پفک نمکی مینو - 110 گرم reza akbari',2,'[{\"changed\": {\"fields\": [\"\\u0648\\u0636\\u0639\\u06cc\\u062a \\u0646\\u0638\\u0631\"]}}]',24,1),(143,'2024-09-15 13:51:23.960414','3','پفک نمکی مینو - 110 گرم amir taheri',2,'[{\"changed\": {\"fields\": [\"\\u0648\\u0636\\u0639\\u06cc\\u062a \\u0646\\u0638\\u0631\"]}}]',24,1),(144,'2024-09-23 10:46:40.971192','9','میزان چربی',1,'[{\"added\": {}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"8  \\u0686\\u0631\\u0628\"}}]',8,1),(145,'2024-09-23 10:48:57.068390','4','وزن',2,'[{\"changed\": {\"fields\": [\"\\u06af\\u0631\\u0648\\u0647 \\u06a9\\u0627\\u0644\\u0627\"]}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"9  450 \\u06af\\u0631\\u0645\"}}]',8,1),(146,'2024-09-23 10:49:26.025928','5','لیتر',2,'[{\"changed\": {\"fields\": [\"\\u06af\\u0631\\u0648\\u0647 \\u06a9\\u0627\\u0644\\u0627\"]}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"10  1\\u0644\\u06cc\\u062a\\u0631\"}}]',8,1),(147,'2024-09-23 10:49:44.199233','5','شیر پرچرب مینو - یک لیتر بسته 4 عددی',2,'[{\"changed\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0634\\u06cc\\u0631 \\u067e\\u0631\\u0686\\u0631\\u0628 \\u0645\\u06cc\\u0646\\u0648 - \\u06cc\\u06a9 \\u0644\\u06cc\\u062a\\u0631 \\u0628\\u0633\\u062a\\u0647 4 \\u0639\\u062f\\u062f\\u06cc - \\u0644\\u06cc\\u062a\\u0631 : \\u06cc\\u06a9 \\u0644\\u06cc\\u062a\\u0631\", \"fields\": [\"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0628\\u0631\\u0627\\u06cc \\u0641\\u06cc\\u0644\\u062a\\u0631\"]}}, {\"changed\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0634\\u06cc\\u0631 \\u067e\\u0631\\u0686\\u0631\\u0628 \\u0645\\u06cc\\u0646\\u0648 - \\u06cc\\u06a9 \\u0644\\u06cc\\u062a\\u0631 \\u0628\\u0633\\u062a\\u0647 4 \\u0639\\u062f\\u062f\\u06cc - \\u0648\\u0632\\u0646 : 450 \\u06af\\u0631\\u0645\", \"fields\": [\"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0628\\u0631\\u0627\\u06cc \\u0641\\u06cc\\u0644\\u062a\\u0631\"]}}]',9,1),(148,'2024-09-23 14:43:24.040238','1','ثبت شده',1,'[{\"added\": {}}]',28,1),(149,'2024-09-23 14:43:42.509891','2','درحال بررسی',1,'[{\"added\": {}}]',28,1),(150,'2024-09-23 14:43:51.775544','3','تحویل پست',1,'[{\"added\": {}}]',28,1),(151,'2024-09-23 14:44:03.743094','4','تحویل پیک',1,'[{\"added\": {}}]',28,1),(152,'2024-09-23 14:44:12.132692','5','تحویل مشتری',1,'[{\"added\": {}}]',28,1),(153,'2024-09-23 14:45:36.072879','12','reza akbari	12	False',2,'[{\"changed\": {\"fields\": [\"\\u0648\\u0636\\u0639\\u06cc\\u062a \\u0633\\u0641\\u0627\\u0631\\u0634\"]}}]',15,1),(154,'2024-09-23 14:45:47.627674','12','reza akbari	12	True',2,'[{\"changed\": {\"fields\": [\"\\u0646\\u0647\\u0627\\u06cc\\u06cc \\u0634\\u062f\\u0647\"]}}]',15,1),(155,'2024-09-23 14:45:56.670562','10','reza akbari	10	True',2,'[{\"changed\": {\"fields\": [\"\\u0646\\u0647\\u0627\\u06cc\\u06cc \\u0634\\u062f\\u0647\", \"\\u0648\\u0636\\u0639\\u06cc\\u062a \\u0633\\u0641\\u0627\\u0631\\u0634\"]}}]',15,1),(156,'2024-09-23 14:46:07.243997','11','reza akbari	11	True',2,'[{\"changed\": {\"fields\": [\"\\u0646\\u0647\\u0627\\u06cc\\u06cc \\u0634\\u062f\\u0647\", \"\\u0648\\u0636\\u0639\\u06cc\\u062a \\u0633\\u0641\\u0627\\u0631\\u0634\"]}}]',15,1),(157,'2024-09-23 14:46:38.243290','20',' 	20	False',3,'',15,1),(158,'2024-09-23 14:46:38.255250','19',' 	19	False',3,'',15,1),(159,'2024-09-23 14:46:38.257243','18',' 	18	False',3,'',15,1),(160,'2024-09-23 14:46:38.259236','17',' 	17	False',3,'',15,1),(161,'2024-09-23 14:46:38.371861','16',' 	16	False',3,'',15,1),(162,'2024-09-23 14:46:38.374888','15',' 	15	False',3,'',15,1),(163,'2024-09-23 14:46:38.377840','14',' 	14	False',3,'',15,1),(164,'2024-09-23 14:46:38.380830','13',' 	13	False',3,'',15,1),(165,'2024-09-23 14:46:52.576524','9','reza akbari	9	True',2,'[{\"changed\": {\"fields\": [\"\\u0646\\u0647\\u0627\\u06cc\\u06cc \\u0634\\u062f\\u0647\", \"\\u0648\\u0636\\u0639\\u06cc\\u062a \\u0633\\u0641\\u0627\\u0631\\u0634\"]}}]',15,1),(166,'2024-09-27 14:06:09.259931','1','عنوان اول - اسلاید اول',1,'[{\"added\": {}}]',29,1),(167,'2024-09-27 14:09:54.154975','1','عنوان اول - اسلاید اول',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0635\\u0648\\u06cc\\u0631 \\u0627\\u0633\\u0644\\u0627\\u06cc\\u062f\\u0631\"]}}]',29,1),(168,'2024-09-27 15:33:16.067911','2','title1',1,'[{\"added\": {}}]',29,1),(169,'2024-09-27 15:37:28.899159','2','title1',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0635\\u0648\\u06cc\\u0631 \\u0627\\u0633\\u0644\\u0627\\u06cc\\u062f\\u0631\"]}}]',29,1),(170,'2024-09-27 15:43:03.192809','1','عنوان اول - اسلاید اول',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0635\\u0648\\u06cc\\u0631 \\u0627\\u0633\\u0644\\u0627\\u06cc\\u062f\\u0631\"]}}]',29,1),(171,'2024-09-27 15:43:18.472184','2','title1',2,'[{\"changed\": {\"fields\": [\"\\u0644\\u06cc\\u0646\\u06a9\"]}}]',29,1),(172,'2024-09-27 16:06:15.711300','7','ddddddddddddddddd',1,'[{\"added\": {}}]',9,1),(173,'2024-09-27 16:07:28.539500','7','ddddddddddddddddd',3,'',9,1),(174,'2024-09-27 16:13:36.848160','8','ddddddddddd',1,'[{\"added\": {}}]',9,1),(175,'2024-09-27 16:13:48.471530','8','ddddddddddd',3,'',9,1),(176,'2024-09-27 17:21:29.314768','9','dddddddddddd',1,'[{\"added\": {}}]',9,1),(177,'2024-09-27 17:21:47.607741','9','dddddddddddd',3,'',9,1),(178,'2024-09-27 17:23:22.285371','10','ddddddd',1,'[{\"added\": {}}]',9,1),(179,'2024-09-27 17:23:40.076878','10','ddddddd',3,'',9,1),(180,'2024-10-10 18:12:20.268882','3','پفک نمکی مینو - 110 گرم amir taheri',3,'',24,1),(181,'2024-10-10 18:12:20.272003','2','پفک نمکی مینو - 110 گرم reza akbari',3,'',24,1),(182,'2024-10-10 18:12:20.274994','1','لباس دخترانه reza akbari',3,'',24,1),(183,'2024-10-10 18:12:30.345966','3','روز دانشجو',3,'',19,1),(184,'2024-10-10 18:12:30.349644','2','شب یلدا',3,'',19,1),(185,'2024-10-10 18:12:36.654433','2','as',3,'',18,1),(186,'2024-10-10 18:12:36.668003','1','abcd',3,'',18,1),(187,'2024-10-10 18:13:01.450258','12','reza akbari	12	True',3,'',15,1),(188,'2024-10-10 18:13:01.452372','11','reza akbari	11	True',3,'',15,1),(189,'2024-10-10 18:13:01.454372','10','reza akbari	10	True',3,'',15,1),(190,'2024-10-10 18:13:01.455526','9','reza akbari	9	True',3,'',15,1),(191,'2024-10-10 18:13:01.458423','8','reza akbari	8	False',3,'',15,1),(192,'2024-10-10 18:13:01.459954','7','reza akbari	7	False',3,'',15,1),(193,'2024-10-10 18:13:01.461965','6','mehdi abbasi	6	True',3,'',15,1),(194,'2024-10-10 18:13:01.463355','5','mehdi abbasi	5	True',3,'',15,1),(195,'2024-10-10 18:13:01.465798','4','mehdi abbasi	4	True',3,'',15,1),(196,'2024-10-10 18:13:01.467213','3','mehdi abbasi	3	False',3,'',15,1),(197,'2024-10-10 18:13:01.468014','2','mehdi abbasi	2	False',3,'',15,1),(198,'2024-10-10 18:13:01.470147','1','mehdi abbasi	1	True',3,'',15,1),(199,'2024-10-10 18:13:09.175409','5','آدیداس',3,'',7,1),(200,'2024-10-10 18:13:09.189870','6','اپل',3,'',7,1),(201,'2024-10-10 18:13:09.193122','7','ال جی',3,'',7,1),(202,'2024-10-10 18:13:09.204495','8','ایسوس',3,'',7,1),(203,'2024-10-10 18:13:09.206509','9','اینتل',3,'',7,1),(204,'2024-10-10 18:13:09.208476','12','مینو',3,'',7,1),(205,'2024-10-10 18:13:09.210019','10','میهن',3,'',7,1),(206,'2024-10-10 18:13:09.211482','11','نایک',3,'',7,1),(207,'2024-10-10 18:13:19.023849','6','استین',3,'',8,1),(208,'2024-10-10 18:13:19.037910','7','رنگ',3,'',8,1),(209,'2024-10-10 18:13:19.040837','5','لیتر',3,'',8,1),(210,'2024-10-10 18:13:19.043840','8','مشکی',3,'',8,1),(211,'2024-10-10 18:13:19.046870','9','میزان چربی',3,'',8,1),(212,'2024-10-10 18:13:19.050348','4','وزن',3,'',8,1),(213,'2024-10-10 18:55:57.305051','4','برنج ایرانی خاطره - 10کیلوگرم',2,'[{\"changed\": {\"fields\": [\"\\u06af\\u0631\\u0648\\u0647 \\u06a9\\u0627\\u0644\\u0627\", \"\\u0628\\u0631\\u0646\\u062f \\u06a9\\u0627\\u0644\\u0627\", \"Description\"]}}]',9,1),(214,'2024-10-10 19:31:50.545900','28','mehdi abbasi',3,'',6,1),(215,'2024-10-10 19:31:50.549487','27',' ',3,'',6,1),(216,'2024-10-10 19:31:50.551565','30',' ',3,'',6,1),(217,'2024-10-10 20:12:37.172465','18','ماست سنتی کاله - 400گرم',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0648\\u0636\\u06cc\\u062d \\u0645\\u062e\\u062a\\u0635\\u0631\", \"\\u062a\\u0648\\u0636\\u06cc\\u062d\\u0627\\u062a \\u06a9\\u0627\\u0645\\u0644\"]}}]',9,1),(218,'2024-10-11 16:32:27.808906','14','خرید',1,'[{\"added\": {}}]',23,1),(219,'2024-10-11 16:33:55.560003','15','خرید',1,'[{\"added\": {}}]',23,1),(220,'2024-10-11 16:34:28.769991','16','خرید',1,'[{\"added\": {}}]',23,1),(221,'2024-10-11 16:34:48.090785','17','خرید',1,'[{\"added\": {}}]',23,1),(222,'2024-10-11 16:35:02.337318','18','خرید',1,'[{\"added\": {}}]',23,1),(223,'2024-10-11 16:35:51.923019','19','خرید',1,'[{\"added\": {}}]',23,1),(224,'2024-10-11 16:43:47.412696','20','خرید',1,'[{\"added\": {}}]',23,1),(225,'2024-10-19 12:28:14.883985','10','وزن',1,'[{\"added\": {}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"11  10 \\u06a9\\u06cc\\u0644\\u0648\\u06af\\u0631\\u0645\"}}]',8,1),(226,'2024-10-19 12:29:31.868665','11','نوع بسته بندی',1,'[{\"added\": {}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"12  \\u06a9\\u06cc\\u0633\\u0647 \\u0627\\u06cc\"}}]',8,1),(227,'2024-10-19 12:30:17.775254','9','برنج دل بهار - 10 کیلوگرم',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0648\\u0636\\u06cc\\u062d\\u0627\\u062a \\u06a9\\u0627\\u0645\\u0644\"]}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0628\\u0631\\u0646\\u062c \\u062f\\u0644 \\u0628\\u0647\\u0627\\u0631 - 10 \\u06a9\\u06cc\\u0644\\u0648\\u06af\\u0631\\u0645 - \\u0648\\u0632\\u0646 : 10 \\u06a9\\u06cc\\u0644\\u0648\\u06af\\u0631\\u0645\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0628\\u0631\\u0646\\u062c \\u062f\\u0644 \\u0628\\u0647\\u0627\\u0631 - 10 \\u06a9\\u06cc\\u0644\\u0648\\u06af\\u0631\\u0645 - \\u0646\\u0648\\u0639 \\u0628\\u0633\\u062a\\u0647 \\u0628\\u0646\\u062f\\u06cc : \\u06a9\\u06cc\\u0633\\u0647 \\u0627\\u06cc\"}}]',9,1),(228,'2024-10-19 12:31:54.570241','9','برنج دل بهار - 10 کیلوگرم',2,'[]',9,1),(229,'2024-10-19 12:54:09.563964','12','وزن',1,'[{\"added\": {}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"13  1.5 \\u0644\\u06cc\\u062a\\u0631\"}}]',8,1),(230,'2024-10-19 13:06:01.287992','11','دوغ صباح - 1.5لیتر',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0648\\u0636\\u06cc\\u062d\\u0627\\u062a \\u06a9\\u0627\\u0645\\u0644\"]}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u062f\\u0648\\u063a \\u0635\\u0628\\u0627\\u062d - 1.5\\u0644\\u06cc\\u062a\\u0631 - \\u0648\\u0632\\u0646 : 1.5 \\u0644\\u06cc\\u062a\\u0631\"}}]',9,1),(231,'2024-10-19 14:42:29.545688','11','دوغ صباح - 1.5لیتر',2,'[]',9,1),(232,'2024-10-19 14:45:12.962993','5','برنج طارم شمال - 10کیلوگرم',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0648\\u0636\\u06cc\\u062d\\u0627\\u062a \\u06a9\\u0627\\u0645\\u0644\"]}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0628\\u0631\\u0646\\u062c \\u0637\\u0627\\u0631\\u0645 \\u0634\\u0645\\u0627\\u0644 - 10\\u06a9\\u06cc\\u0644\\u0648\\u06af\\u0631\\u0645 - \\u0646\\u0648\\u0639 \\u0628\\u0633\\u062a\\u0647 \\u0628\\u0646\\u062f\\u06cc : \\u06a9\\u06cc\\u0633\\u0647 \\u0627\\u06cc\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0628\\u0631\\u0646\\u062c \\u0637\\u0627\\u0631\\u0645 \\u0634\\u0645\\u0627\\u0644 - 10\\u06a9\\u06cc\\u0644\\u0648\\u06af\\u0631\\u0645 - \\u0648\\u0632\\u0646 : 10 \\u06a9\\u06cc\\u0644\\u0648\\u06af\\u0631\\u0645\"}}]',9,1),(233,'2024-10-19 14:51:54.473762','11','نوع بسته بندی',2,'[{\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"14  \\u0628\\u0637\\u0631\\u06cc\"}}]',8,1),(234,'2024-10-19 14:52:32.493406','11','نوع بسته بندی',3,'',8,1),(235,'2024-10-19 14:52:32.497402','12','وزن',3,'',8,1),(236,'2024-10-19 14:52:32.498400','10','وزن',3,'',8,1),(237,'2024-10-19 14:54:12.905075','13','وزن',1,'[{\"added\": {}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"15  500 \\u06af\\u0631\\u0645\"}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"16  1 \\u0644\\u06cc\\u062a\\u0631\"}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"17  1.5 \\u0644\\u06cc\\u062a\\u0631\"}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"18  2 \\u0644\\u06cc\\u062a\\u0631\"}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"19  1 \\u06a9\\u06cc\\u0644\\u0648\\u06af\\u0631\\u0645\"}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"20  2 \\u06a9\\u06cc\\u0644\\u0648\\u06af\\u0631\\u0645\"}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"21  5 \\u06a9\\u06cc\\u0644\\u0648 \\u06af\\u0631\\u0645\"}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"22  10 \\u06a9\\u0628\\u0644\\u0648 \\u06af\\u0631\\u0645\"}}]',8,1),(238,'2024-10-19 14:56:00.691020','14','نوع بسته بندی',1,'[{\"added\": {}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"23  \\u06a9\\u06cc\\u0633\\u0647 \\u0627\\u06cc\"}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"24  \\u0628\\u0637\\u0631\\u06cc\"}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"25  \\u0634\\u06cc\\u0634\\u0647\"}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"26  \\u0642\\u0648\\u0637\\u06cc\"}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"27  \\u062d\\u0644\\u0628\\u06cc\"}}]',8,1),(239,'2024-10-19 14:56:30.718783','9','برنج دل بهار - 10 کیلوگرم',2,'[{\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0628\\u0631\\u0646\\u062c \\u062f\\u0644 \\u0628\\u0647\\u0627\\u0631 - 10 \\u06a9\\u06cc\\u0644\\u0648\\u06af\\u0631\\u0645 - \\u0648\\u0632\\u0646 : 10 \\u06a9\\u06cc\\u0644\\u0648\\u06af\\u0631\\u0645\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0628\\u0631\\u0646\\u062c \\u062f\\u0644 \\u0628\\u0647\\u0627\\u0631 - 10 \\u06a9\\u06cc\\u0644\\u0648\\u06af\\u0631\\u0645 - \\u0646\\u0648\\u0639 \\u0628\\u0633\\u062a\\u0647 \\u0628\\u0646\\u062f\\u06cc : \\u06a9\\u06cc\\u0633\\u0647 \\u0627\\u06cc\"}}]',9,1),(240,'2024-10-19 14:58:52.958655','21','خرید',1,'[{\"added\": {}}]',23,1),(241,'2024-10-19 14:59:46.810155','11','دوغ صباح - 1.5لیتر',2,'[{\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u062f\\u0648\\u063a \\u0635\\u0628\\u0627\\u062d - 1.5\\u0644\\u06cc\\u062a\\u0631 - \\u0648\\u0632\\u0646 : 1.5 \\u0644\\u06cc\\u062a\\u0631\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u062f\\u0648\\u063a \\u0635\\u0628\\u0627\\u062d - 1.5\\u0644\\u06cc\\u062a\\u0631 - \\u0646\\u0648\\u0639 \\u0628\\u0633\\u062a\\u0647 \\u0628\\u0646\\u062f\\u06cc : \\u0628\\u0637\\u0631\\u06cc\"}}]',9,1),(242,'2024-10-19 15:01:36.251040','13','وزن',2,'[{\"changed\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"22  10 \\u06a9\\u06cc\\u0644\\u0648 \\u06af\\u0631\\u0645\", \"fields\": [\"\\u0639\\u0646\\u0648\\u0627\\u0646 \\u0645\\u0642\\u062f\\u0627\\u0631\"]}}]',8,1),(243,'2024-10-19 15:59:44.100517','15','مواد تشکیل‌دهنده',1,'[{\"added\": {}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"28  \\u0633\\u0645\\u0648\\u0644\\u06cc\\u0646\\u0627\"}}]',8,1),(244,'2024-10-19 16:00:24.906373','16','شکل ماده غذایی',1,'[{\"added\": {}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"29  \\u067e\\u06cc\\u0686\\u06cc\"}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"30  \\u0631\\u0634\\u062a\\u0647 \\u0627\\u06cc\"}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"31  \\u067e\\u0631\\u0648\\u0627\\u0646\\u0647 \\u0627\\u06cc\"}}]',8,1),(245,'2024-10-19 16:01:23.757670','17','نوع ویتامین و مواد معدنی',1,'[{\"added\": {}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"32  \\u0648\\u06cc\\u062a\\u0627\\u0645\\u06cc\\u0646 B\"}}]',8,1),(246,'2024-10-19 16:02:10.225899','15','مواد تشکیل‌دهنده',2,'[{\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"33  \\u0622\\u0631\\u062f \\u06af\\u0646\\u062f\\u0645\"}}]',8,1),(247,'2024-10-19 16:02:24.542727','16','شکل ماده غذایی',2,'[{\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"34  \\u0641\\u0627\\u0646\\u062a\\u0632\\u06cc\"}}]',8,1),(248,'2024-10-19 16:03:03.503766','15','مواد تشکیل‌دهنده',2,'[{\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"35  \\u06af\\u0646\\u062f\\u0645\"}}]',8,1),(249,'2024-10-19 16:04:24.497877','18','تعداد در بسته',1,'[{\"added\": {}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"36  \\u06cc\\u06a9\"}}]',8,1),(250,'2024-10-19 16:05:12.007439','19','ویژگی نوشیدنی',1,'[{\"added\": {}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"37  \\u06af\\u0627\\u0632\\u062f\\u0627\\u0631\"}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"38  \\u0628\\u062f\\u0648\\u0646 \\u06af\\u0627\\u0632\"}}]',8,1),(251,'2024-10-19 16:05:52.386569','11','دوغ صباح - 1.5لیتر',2,'[{\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u062f\\u0648\\u063a \\u0635\\u0628\\u0627\\u062d - 1.5\\u0644\\u06cc\\u062a\\u0631 - \\u062a\\u0639\\u062f\\u0627\\u062f \\u062f\\u0631 \\u0628\\u0633\\u062a\\u0647 : \\u06cc\\u06a9\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u062f\\u0648\\u063a \\u0635\\u0628\\u0627\\u062d - 1.5\\u0644\\u06cc\\u062a\\u0631 - \\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0646\\u0648\\u0634\\u06cc\\u062f\\u0646\\u06cc : \\u06af\\u0627\\u0632\\u062f\\u0627\\u0631\"}}]',9,1),(252,'2024-10-19 16:07:54.491342','12','دوغ کاله - 1.5لیتر',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0648\\u0636\\u06cc\\u062d\\u0627\\u062a \\u06a9\\u0627\\u0645\\u0644\"]}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u062f\\u0648\\u063a \\u06a9\\u0627\\u0644\\u0647 - 1.5\\u0644\\u06cc\\u062a\\u0631 - \\u0648\\u0632\\u0646 : 1.5 \\u0644\\u06cc\\u062a\\u0631\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u062f\\u0648\\u063a \\u06a9\\u0627\\u0644\\u0647 - 1.5\\u0644\\u06cc\\u062a\\u0631 - \\u0646\\u0648\\u0639 \\u0628\\u0633\\u062a\\u0647 \\u0628\\u0646\\u062f\\u06cc : \\u0628\\u0637\\u0631\\u06cc\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u062f\\u0648\\u063a \\u06a9\\u0627\\u0644\\u0647 - 1.5\\u0644\\u06cc\\u062a\\u0631 - \\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0646\\u0648\\u0634\\u06cc\\u062f\\u0646\\u06cc : \\u0628\\u062f\\u0648\\u0646 \\u06af\\u0627\\u0632\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u062f\\u0648\\u063a \\u06a9\\u0627\\u0644\\u0647 - 1.5\\u0644\\u06cc\\u062a\\u0631 - \\u062a\\u0639\\u062f\\u0627\\u062f \\u062f\\u0631 \\u0628\\u0633\\u062a\\u0647 : \\u06cc\\u06a9\"}}]',9,1),(253,'2024-10-19 16:08:31.022938','22','خرید',1,'[{\"added\": {}}]',23,1),(254,'2024-10-19 16:12:08.627527','12','دوغ کاله - 1.5لیتر',2,'[{\"changed\": {\"fields\": [\"\\u0642\\u06cc\\u0645\\u062a \\u06a9\\u0627\\u0644\\u0627\"]}}]',9,1),(255,'2024-10-20 10:32:36.475934','11','دوغ صباح - 1.5لیتر',2,'[]',9,1),(256,'2024-10-20 10:33:27.199919','13','وزن',2,'[{\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"39  9 \\u06a9\\u06cc\\u0644\\u0648\\u06af\\u0631\\u0645\"}}]',8,1),(257,'2024-10-20 10:34:35.546087','10','برنج ستایش - 9کیلوگرم',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0648\\u0636\\u06cc\\u062d\\u0627\\u062a \\u06a9\\u0627\\u0645\\u0644\"]}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0628\\u0631\\u0646\\u062c \\u0633\\u062a\\u0627\\u06cc\\u0634 - 9\\u06a9\\u06cc\\u0644\\u0648\\u06af\\u0631\\u0645 - \\u0648\\u0632\\u0646 : 9 \\u06a9\\u06cc\\u0644\\u0648\\u06af\\u0631\\u0645\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0628\\u0631\\u0646\\u062c \\u0633\\u062a\\u0627\\u06cc\\u0634 - 9\\u06a9\\u06cc\\u0644\\u0648\\u06af\\u0631\\u0645 - \\u0646\\u0648\\u0639 \\u0628\\u0633\\u062a\\u0647 \\u0628\\u0646\\u062f\\u06cc : \\u06a9\\u06cc\\u0633\\u0647 \\u0627\\u06cc\"}}]',9,1),(258,'2024-10-20 10:35:23.046623','6','برنج هندی احمد - 9کیلوگرم',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0648\\u0636\\u06cc\\u062d\\u0627\\u062a \\u06a9\\u0627\\u0645\\u0644\"]}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0628\\u0631\\u0646\\u062c \\u0647\\u0646\\u062f\\u06cc \\u0627\\u062d\\u0645\\u062f - 9\\u06a9\\u06cc\\u0644\\u0648\\u06af\\u0631\\u0645 - \\u0648\\u0632\\u0646 : 9 \\u06a9\\u06cc\\u0644\\u0648\\u06af\\u0631\\u0645\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0628\\u0631\\u0646\\u062c \\u0647\\u0646\\u062f\\u06cc \\u0627\\u062d\\u0645\\u062f - 9\\u06a9\\u06cc\\u0644\\u0648\\u06af\\u0631\\u0645 - \\u0646\\u0648\\u0639 \\u0628\\u0633\\u062a\\u0647 \\u0628\\u0646\\u062f\\u06cc : \\u06a9\\u06cc\\u0633\\u0647 \\u0627\\u06cc\"}}]',9,1),(259,'2024-10-20 10:36:57.393115','17','نوع ویتامین و مواد معدنی',2,'[{\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"40  \\u0648\\u06cc\\u062a\\u0627\\u0645\\u06cc\\u0646 D\"}}]',8,1),(260,'2024-10-20 10:37:57.175775','3','شیر پر چرب - 1 لیتر',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0648\\u0636\\u06cc\\u062d\\u0627\\u062a \\u06a9\\u0627\\u0645\\u0644\"]}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0634\\u06cc\\u0631 \\u067e\\u0631 \\u0686\\u0631\\u0628 - 1 \\u0644\\u06cc\\u062a\\u0631 - \\u0648\\u0632\\u0646 : 1 \\u0644\\u06cc\\u062a\\u0631\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0634\\u06cc\\u0631 \\u067e\\u0631 \\u0686\\u0631\\u0628 - 1 \\u0644\\u06cc\\u062a\\u0631 - \\u0646\\u0648\\u0639 \\u0628\\u0633\\u062a\\u0647 \\u0628\\u0646\\u062f\\u06cc : \\u0628\\u0637\\u0631\\u06cc\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0634\\u06cc\\u0631 \\u067e\\u0631 \\u0686\\u0631\\u0628 - 1 \\u0644\\u06cc\\u062a\\u0631 - \\u0646\\u0648\\u0639 \\u0648\\u06cc\\u062a\\u0627\\u0645\\u06cc\\u0646 \\u0648 \\u0645\\u0648\\u0627\\u062f \\u0645\\u0639\\u062f\\u0646\\u06cc : \\u0648\\u06cc\\u062a\\u0627\\u0645\\u06cc\\u0646 D\"}}]',9,1),(261,'2024-10-20 10:38:51.224113','1','نوشابه پپسی - 1.5 لیتری',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0648\\u0636\\u06cc\\u062d\\u0627\\u062a \\u06a9\\u0627\\u0645\\u0644\"]}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0646\\u0648\\u0634\\u0627\\u0628\\u0647 \\u067e\\u067e\\u0633\\u06cc - 1.5 \\u0644\\u06cc\\u062a\\u0631\\u06cc - \\u0648\\u0632\\u0646 : 1.5 \\u0644\\u06cc\\u062a\\u0631\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0646\\u0648\\u0634\\u0627\\u0628\\u0647 \\u067e\\u067e\\u0633\\u06cc - 1.5 \\u0644\\u06cc\\u062a\\u0631\\u06cc - \\u0646\\u0648\\u0639 \\u0628\\u0633\\u062a\\u0647 \\u0628\\u0646\\u062f\\u06cc : \\u0628\\u0637\\u0631\\u06cc\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0646\\u0648\\u0634\\u0627\\u0628\\u0647 \\u067e\\u067e\\u0633\\u06cc - 1.5 \\u0644\\u06cc\\u062a\\u0631\\u06cc - \\u062a\\u0639\\u062f\\u0627\\u062f \\u062f\\u0631 \\u0628\\u0633\\u062a\\u0647 : \\u06cc\\u06a9\"}}]',9,1),(262,'2024-10-20 10:40:12.238155','13','وزن',2,'[{\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"41  300 \\u06af\\u0631\\u0645\"}}]',8,1),(263,'2024-10-20 10:41:40.851324','23','پنیر خامه ای کاله 300گرم',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0648\\u0636\\u06cc\\u062d\\u0627\\u062a \\u06a9\\u0627\\u0645\\u0644\"]}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u067e\\u0646\\u06cc\\u0631 \\u062e\\u0627\\u0645\\u0647 \\u0627\\u06cc \\u06a9\\u0627\\u0644\\u0647 300\\u06af\\u0631\\u0645 - \\u0648\\u0632\\u0646 : 300 \\u06af\\u0631\\u0645\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u067e\\u0646\\u06cc\\u0631 \\u062e\\u0627\\u0645\\u0647 \\u0627\\u06cc \\u06a9\\u0627\\u0644\\u0647 300\\u06af\\u0631\\u0645 - \\u0646\\u0648\\u0639 \\u0628\\u0633\\u062a\\u0647 \\u0628\\u0646\\u062f\\u06cc : \\u0642\\u0648\\u0637\\u06cc\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u067e\\u0646\\u06cc\\u0631 \\u062e\\u0627\\u0645\\u0647 \\u0627\\u06cc \\u06a9\\u0627\\u0644\\u0647 300\\u06af\\u0631\\u0645 - \\u062a\\u0639\\u062f\\u0627\\u062f \\u062f\\u0631 \\u0628\\u0633\\u062a\\u0647 : \\u06cc\\u06a9\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u067e\\u0646\\u06cc\\u0631 \\u062e\\u0627\\u0645\\u0647 \\u0627\\u06cc \\u06a9\\u0627\\u0644\\u0647 300\\u06af\\u0631\\u0645 - \\u0646\\u0648\\u0639 \\u0648\\u06cc\\u062a\\u0627\\u0645\\u06cc\\u0646 \\u0648 \\u0645\\u0648\\u0627\\u062f \\u0645\\u0639\\u062f\\u0646\\u06cc : \\u0648\\u06cc\\u062a\\u0627\\u0645\\u06cc\\u0646 D\"}}]',9,1),(264,'2024-10-20 10:43:50.453208','20','ماکاراتی پیچ پیجی تک مقدار 500 گرم',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0648\\u0636\\u06cc\\u062d\\u0627\\u062a \\u06a9\\u0627\\u0645\\u0644\"]}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0645\\u0627\\u06a9\\u0627\\u0631\\u0627\\u062a\\u06cc \\u067e\\u06cc\\u0686 \\u067e\\u06cc\\u062c\\u06cc \\u062a\\u06a9 \\u0645\\u0642\\u062f\\u0627\\u0631 500 \\u06af\\u0631\\u0645 - \\u0648\\u0632\\u0646 : 500 \\u06af\\u0631\\u0645\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0645\\u0627\\u06a9\\u0627\\u0631\\u0627\\u062a\\u06cc \\u067e\\u06cc\\u0686 \\u067e\\u06cc\\u062c\\u06cc \\u062a\\u06a9 \\u0645\\u0642\\u062f\\u0627\\u0631 500 \\u06af\\u0631\\u0645 - \\u0634\\u06a9\\u0644 \\u0645\\u0627\\u062f\\u0647 \\u063a\\u0630\\u0627\\u06cc\\u06cc : \\u067e\\u06cc\\u0686\\u06cc\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0645\\u0627\\u06a9\\u0627\\u0631\\u0627\\u062a\\u06cc \\u067e\\u06cc\\u0686 \\u067e\\u06cc\\u062c\\u06cc \\u062a\\u06a9 \\u0645\\u0642\\u062f\\u0627\\u0631 500 \\u06af\\u0631\\u0645 - \\u0646\\u0648\\u0639 \\u0628\\u0633\\u062a\\u0647 \\u0628\\u0646\\u062f\\u06cc : \\u06a9\\u06cc\\u0633\\u0647 \\u0627\\u06cc\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0645\\u0627\\u06a9\\u0627\\u0631\\u0627\\u062a\\u06cc \\u067e\\u06cc\\u0686 \\u067e\\u06cc\\u062c\\u06cc \\u062a\\u06a9 \\u0645\\u0642\\u062f\\u0627\\u0631 500 \\u06af\\u0631\\u0645 - \\u062a\\u0639\\u062f\\u0627\\u062f \\u062f\\u0631 \\u0628\\u0633\\u062a\\u0647 : \\u06cc\\u06a9\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0645\\u0627\\u06a9\\u0627\\u0631\\u0627\\u062a\\u06cc \\u067e\\u06cc\\u0686 \\u067e\\u06cc\\u062c\\u06cc \\u062a\\u06a9 \\u0645\\u0642\\u062f\\u0627\\u0631 500 \\u06af\\u0631\\u0645 - \\u0645\\u0648\\u0627\\u062f \\u062a\\u0634\\u06a9\\u06cc\\u0644\\u200c\\u062f\\u0647\\u0646\\u062f\\u0647 : \\u0633\\u0645\\u0648\\u0644\\u06cc\\u0646\\u0627\"}}]',9,1),(265,'2024-10-20 10:45:49.646764','21','ماکارانی پیچ پیچی مانا مقدار 500گرم',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0648\\u0636\\u06cc\\u062d\\u0627\\u062a \\u06a9\\u0627\\u0645\\u0644\"]}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0645\\u0627\\u06a9\\u0627\\u0631\\u0627\\u0646\\u06cc \\u067e\\u06cc\\u0686 \\u067e\\u06cc\\u0686\\u06cc \\u0645\\u0627\\u0646\\u0627 \\u0645\\u0642\\u062f\\u0627\\u0631 500\\u06af\\u0631\\u0645 - \\u0648\\u0632\\u0646 : 500 \\u06af\\u0631\\u0645\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0645\\u0627\\u06a9\\u0627\\u0631\\u0627\\u0646\\u06cc \\u067e\\u06cc\\u0686 \\u067e\\u06cc\\u0686\\u06cc \\u0645\\u0627\\u0646\\u0627 \\u0645\\u0642\\u062f\\u0627\\u0631 500\\u06af\\u0631\\u0645 - \\u0634\\u06a9\\u0644 \\u0645\\u0627\\u062f\\u0647 \\u063a\\u0630\\u0627\\u06cc\\u06cc : \\u067e\\u06cc\\u0686\\u06cc\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0645\\u0627\\u06a9\\u0627\\u0631\\u0627\\u0646\\u06cc \\u067e\\u06cc\\u0686 \\u067e\\u06cc\\u0686\\u06cc \\u0645\\u0627\\u0646\\u0627 \\u0645\\u0642\\u062f\\u0627\\u0631 500\\u06af\\u0631\\u0645 - \\u0646\\u0648\\u0639 \\u0628\\u0633\\u062a\\u0647 \\u0628\\u0646\\u062f\\u06cc : \\u06a9\\u06cc\\u0633\\u0647 \\u0627\\u06cc\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0645\\u0627\\u06a9\\u0627\\u0631\\u0627\\u0646\\u06cc \\u067e\\u06cc\\u0686 \\u067e\\u06cc\\u0686\\u06cc \\u0645\\u0627\\u0646\\u0627 \\u0645\\u0642\\u062f\\u0627\\u0631 500\\u06af\\u0631\\u0645 - \\u062a\\u0639\\u062f\\u0627\\u062f \\u062f\\u0631 \\u0628\\u0633\\u062a\\u0647 : \\u06cc\\u06a9\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0645\\u0627\\u06a9\\u0627\\u0631\\u0627\\u0646\\u06cc \\u067e\\u06cc\\u0686 \\u067e\\u06cc\\u0686\\u06cc \\u0645\\u0627\\u0646\\u0627 \\u0645\\u0642\\u062f\\u0627\\u0631 500\\u06af\\u0631\\u0645 - \\u0645\\u0648\\u0627\\u062f \\u062a\\u0634\\u06a9\\u06cc\\u0644\\u200c\\u062f\\u0647\\u0646\\u062f\\u0647 : \\u0622\\u0631\\u062f \\u06af\\u0646\\u062f\\u0645\"}}]',9,1),(266,'2024-10-20 10:47:17.425470','19','ماکارانی مانا 500گرم',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0648\\u0636\\u06cc\\u062d\\u0627\\u062a \\u06a9\\u0627\\u0645\\u0644\"]}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0645\\u0627\\u06a9\\u0627\\u0631\\u0627\\u0646\\u06cc \\u0645\\u0627\\u0646\\u0627 500\\u06af\\u0631\\u0645 - \\u0648\\u0632\\u0646 : 500 \\u06af\\u0631\\u0645\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0645\\u0627\\u06a9\\u0627\\u0631\\u0627\\u0646\\u06cc \\u0645\\u0627\\u0646\\u0627 500\\u06af\\u0631\\u0645 - \\u0634\\u06a9\\u0644 \\u0645\\u0627\\u062f\\u0647 \\u063a\\u0630\\u0627\\u06cc\\u06cc : \\u0631\\u0634\\u062a\\u0647 \\u0627\\u06cc\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0645\\u0627\\u06a9\\u0627\\u0631\\u0627\\u0646\\u06cc \\u0645\\u0627\\u0646\\u0627 500\\u06af\\u0631\\u0645 - \\u0646\\u0648\\u0639 \\u0628\\u0633\\u062a\\u0647 \\u0628\\u0646\\u062f\\u06cc : \\u06a9\\u06cc\\u0633\\u0647 \\u0627\\u06cc\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0645\\u0627\\u06a9\\u0627\\u0631\\u0627\\u0646\\u06cc \\u0645\\u0627\\u0646\\u0627 500\\u06af\\u0631\\u0645 - \\u062a\\u0639\\u062f\\u0627\\u062f \\u062f\\u0631 \\u0628\\u0633\\u062a\\u0647 : \\u06cc\\u06a9\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0645\\u0627\\u06a9\\u0627\\u0631\\u0627\\u0646\\u06cc \\u0645\\u0627\\u0646\\u0627 500\\u06af\\u0631\\u0645 - \\u0645\\u0648\\u0627\\u062f \\u062a\\u0634\\u06a9\\u06cc\\u0644\\u200c\\u062f\\u0647\\u0646\\u062f\\u0647 : \\u0633\\u0645\\u0648\\u0644\\u06cc\\u0646\\u0627\"}}]',9,1),(267,'2024-10-20 10:48:56.814728','23','خرید',1,'[{\"added\": {}}]',23,1),(268,'2024-10-20 10:49:20.369621','24','خرید',1,'[{\"added\": {}}]',23,1),(269,'2024-10-20 10:50:04.729172','22','خرید',2,'[{\"changed\": {\"fields\": [\"\\u0642\\u06cc\\u0645\\u062a \\u0648\\u0627\\u062d\\u062f\"]}}]',23,1),(270,'2024-10-20 10:50:10.447505','21','خرید',2,'[{\"changed\": {\"fields\": [\"\\u0642\\u06cc\\u0645\\u062a \\u0648\\u0627\\u062d\\u062f\"]}}]',23,1),(271,'2024-10-20 10:50:31.335109','25','خرید',1,'[{\"added\": {}}]',23,1),(272,'2024-10-20 10:53:10.262185','20','نوع ماست',1,'[{\"added\": {}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"42  \\u0633\\u0627\\u062f\\u0647\"}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"43  \\u0686\\u06a9\\u06cc\\u062f\\u0647\"}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"44  \\u0633\\u0646\\u062a\\u06cc\"}}]',8,1),(273,'2024-10-20 10:59:05.173569','20','نوع ماست',2,'[{\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"45  \\u067e\\u0631\\u0686\\u0631\\u0628\"}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"46  \\u06a9\\u0645 \\u0686\\u0631\\u0628\"}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"47  \\u062e\\u0627\\u0645\\u0647 \\u0627\\u06cc\"}}]',8,1),(274,'2024-10-20 11:00:48.107554','16','ماست پر چرب کاله - 1کیلوگرم',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0648\\u0636\\u06cc\\u062d\\u0627\\u062a \\u06a9\\u0627\\u0645\\u0644\"]}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0645\\u0627\\u0633\\u062a \\u067e\\u0631 \\u0686\\u0631\\u0628 \\u06a9\\u0627\\u0644\\u0647 - 1\\u06a9\\u06cc\\u0644\\u0648\\u06af\\u0631\\u0645 - \\u0648\\u0632\\u0646 : 1 \\u06a9\\u06cc\\u0644\\u0648 \\u06af\\u0631\\u0645\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0645\\u0627\\u0633\\u062a \\u067e\\u0631 \\u0686\\u0631\\u0628 \\u06a9\\u0627\\u0644\\u0647 - 1\\u06a9\\u06cc\\u0644\\u0648\\u06af\\u0631\\u0645 - \\u0646\\u0648\\u0639 \\u0645\\u0627\\u0633\\u062a : \\u067e\\u0631\\u0686\\u0631\\u0628\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0645\\u0627\\u0633\\u062a \\u067e\\u0631 \\u0686\\u0631\\u0628 \\u06a9\\u0627\\u0644\\u0647 - 1\\u06a9\\u06cc\\u0644\\u0648\\u06af\\u0631\\u0645 - \\u0646\\u0648\\u0639 \\u0648\\u06cc\\u062a\\u0627\\u0645\\u06cc\\u0646 \\u0648 \\u0645\\u0648\\u0627\\u062f \\u0645\\u0639\\u062f\\u0646\\u06cc : \\u0648\\u06cc\\u062a\\u0627\\u0645\\u06cc\\u0646 D\"}}]',9,1),(275,'2024-10-20 11:02:14.581097','13','وزن',2,'[{\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"48  400 \\u06af\\u0631\\u0645\"}}]',8,1),(276,'2024-10-20 11:03:50.204770','18','ماست سنتی کاله - 400گرم',2,'[{\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0645\\u0627\\u0633\\u062a \\u0633\\u0646\\u062a\\u06cc \\u06a9\\u0627\\u0644\\u0647 - 400\\u06af\\u0631\\u0645 - \\u0648\\u0632\\u0646 : 400 \\u06af\\u0631\\u0645\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0645\\u0627\\u0633\\u062a \\u0633\\u0646\\u062a\\u06cc \\u06a9\\u0627\\u0644\\u0647 - 400\\u06af\\u0631\\u0645 - \\u0646\\u0648\\u0639 \\u0628\\u0633\\u062a\\u0647 \\u0628\\u0646\\u062f\\u06cc : \\u0642\\u0648\\u0637\\u06cc\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0645\\u0627\\u0633\\u062a \\u0633\\u0646\\u062a\\u06cc \\u06a9\\u0627\\u0644\\u0647 - 400\\u06af\\u0631\\u0645 - \\u0646\\u0648\\u0639 \\u0648\\u06cc\\u062a\\u0627\\u0645\\u06cc\\u0646 \\u0648 \\u0645\\u0648\\u0627\\u062f \\u0645\\u0639\\u062f\\u0646\\u06cc : \\u0648\\u06cc\\u062a\\u0627\\u0645\\u06cc\\u0646 D\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0645\\u0627\\u0633\\u062a \\u0633\\u0646\\u062a\\u06cc \\u06a9\\u0627\\u0644\\u0647 - 400\\u06af\\u0631\\u0645 - \\u0646\\u0648\\u0639 \\u0645\\u0627\\u0633\\u062a : \\u0633\\u0646\\u062a\\u06cc\"}}]',9,1),(277,'2024-10-20 11:08:29.930373','20','نوع ماده غذایی',2,'[{\"changed\": {\"fields\": [\"\\u0646\\u0627\\u0645 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"\\u06af\\u0631\\u0648\\u0647 \\u06a9\\u0627\\u0644\\u0627\"]}}]',8,1),(278,'2024-10-20 12:08:48.162893','21','aaaa',1,'[{\"added\": {}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"49  a\"}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"50  b\"}}, {\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"51  c\"}}]',8,1),(279,'2024-10-20 12:09:40.437368','21','aaaa',3,'',8,1),(280,'2024-10-21 19:38:01.992911','8','برنج مژده - 9کیلوگرم',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0648\\u0636\\u06cc\\u062d\\u0627\\u062a \\u06a9\\u0627\\u0645\\u0644\"]}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0628\\u0631\\u0646\\u062c \\u0645\\u0698\\u062f\\u0647 - 9\\u06a9\\u06cc\\u0644\\u0648\\u06af\\u0631\\u0645 - \\u0648\\u0632\\u0646 : 9 \\u06a9\\u06cc\\u0644\\u0648\\u06af\\u0631\\u0645\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0628\\u0631\\u0646\\u062c \\u0645\\u0698\\u062f\\u0647 - 9\\u06a9\\u06cc\\u0644\\u0648\\u06af\\u0631\\u0645 - \\u0646\\u0648\\u0639 \\u0628\\u0633\\u062a\\u0647 \\u0628\\u0646\\u062f\\u06cc : \\u06a9\\u06cc\\u0633\\u0647 \\u0627\\u06cc\"}}]',9,1),(281,'2024-10-21 19:38:21.620325','7','برنج هندی دانه بلند - 10کیلوگرم',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0648\\u0636\\u06cc\\u062d\\u0627\\u062a \\u06a9\\u0627\\u0645\\u0644\"]}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0628\\u0631\\u0646\\u062c \\u0647\\u0646\\u062f\\u06cc \\u062f\\u0627\\u0646\\u0647 \\u0628\\u0644\\u0646\\u062f - 10\\u06a9\\u06cc\\u0644\\u0648\\u06af\\u0631\\u0645 - \\u0648\\u0632\\u0646 : 10 \\u06a9\\u06cc\\u0644\\u0648\\u06af\\u0631\\u0645\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0628\\u0631\\u0646\\u062c \\u0647\\u0646\\u062f\\u06cc \\u062f\\u0627\\u0646\\u0647 \\u0628\\u0644\\u0646\\u062f - 10\\u06a9\\u06cc\\u0644\\u0648\\u06af\\u0631\\u0645 - \\u0646\\u0648\\u0639 \\u0628\\u0633\\u062a\\u0647 \\u0628\\u0646\\u062f\\u06cc : \\u06a9\\u06cc\\u0633\\u0647 \\u0627\\u06cc\"}}]',9,1),(282,'2024-10-21 19:39:20.296694','2','شیر کم چرب - 1 لیتری',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0648\\u0636\\u06cc\\u062d\\u0627\\u062a \\u06a9\\u0627\\u0645\\u0644\"]}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0634\\u06cc\\u0631 \\u06a9\\u0645 \\u0686\\u0631\\u0628 - 1 \\u0644\\u06cc\\u062a\\u0631\\u06cc - \\u0648\\u0632\\u0646 : 1 \\u0644\\u06cc\\u062a\\u0631\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0634\\u06cc\\u0631 \\u06a9\\u0645 \\u0686\\u0631\\u0628 - 1 \\u0644\\u06cc\\u062a\\u0631\\u06cc - \\u0646\\u0648\\u0639 \\u0628\\u0633\\u062a\\u0647 \\u0628\\u0646\\u062f\\u06cc : \\u0628\\u0637\\u0631\\u06cc\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0634\\u06cc\\u0631 \\u06a9\\u0645 \\u0686\\u0631\\u0628 - 1 \\u0644\\u06cc\\u062a\\u0631\\u06cc - \\u0646\\u0648\\u0639 \\u0648\\u06cc\\u062a\\u0627\\u0645\\u06cc\\u0646 \\u0648 \\u0645\\u0648\\u0627\\u062f \\u0645\\u0639\\u062f\\u0646\\u06cc : \\u0648\\u06cc\\u062a\\u0627\\u0645\\u06cc\\u0646 D\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0634\\u06cc\\u0631 \\u06a9\\u0645 \\u0686\\u0631\\u0628 - 1 \\u0644\\u06cc\\u062a\\u0631\\u06cc - \\u0646\\u0648\\u0639 \\u0645\\u0627\\u062f\\u0647 \\u063a\\u0630\\u0627\\u06cc\\u06cc : \\u06a9\\u0645 \\u0686\\u0631\\u0628\"}}]',9,1),(283,'2024-10-21 19:40:11.020163','13','وزن',2,'[{\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"52  350 \\u06af\\u0631\\u0645\"}}]',8,1),(284,'2024-10-21 19:40:54.509272','22','پنیر خامه ای ویلی مقدار 350گرم',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0648\\u0636\\u06cc\\u062d\\u0627\\u062a \\u06a9\\u0627\\u0645\\u0644\"]}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u067e\\u0646\\u06cc\\u0631 \\u062e\\u0627\\u0645\\u0647 \\u0627\\u06cc \\u0648\\u06cc\\u0644\\u06cc \\u0645\\u0642\\u062f\\u0627\\u0631 350\\u06af\\u0631\\u0645 - \\u0648\\u0632\\u0646 : 350 \\u06af\\u0631\\u0645\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u067e\\u0646\\u06cc\\u0631 \\u062e\\u0627\\u0645\\u0647 \\u0627\\u06cc \\u0648\\u06cc\\u0644\\u06cc \\u0645\\u0642\\u062f\\u0627\\u0631 350\\u06af\\u0631\\u0645 - \\u0646\\u0648\\u0639 \\u0628\\u0633\\u062a\\u0647 \\u0628\\u0646\\u062f\\u06cc : \\u0642\\u0648\\u0637\\u06cc\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u067e\\u0646\\u06cc\\u0631 \\u062e\\u0627\\u0645\\u0647 \\u0627\\u06cc \\u0648\\u06cc\\u0644\\u06cc \\u0645\\u0642\\u062f\\u0627\\u0631 350\\u06af\\u0631\\u0645 - \\u0646\\u0648\\u0639 \\u0645\\u0627\\u062f\\u0647 \\u063a\\u0630\\u0627\\u06cc\\u06cc : \\u062e\\u0627\\u0645\\u0647 \\u0627\\u06cc\"}}]',9,1),(285,'2024-10-21 19:42:35.515493','13','دوغ بزرگ آبعلی',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0648\\u0636\\u06cc\\u062d\\u0627\\u062a \\u06a9\\u0627\\u0645\\u0644\"]}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u062f\\u0648\\u063a \\u0628\\u0632\\u0631\\u06af \\u0622\\u0628\\u0639\\u0644\\u06cc - \\u0648\\u0632\\u0646 : 1.5 \\u0644\\u06cc\\u062a\\u0631\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u062f\\u0648\\u063a \\u0628\\u0632\\u0631\\u06af \\u0622\\u0628\\u0639\\u0644\\u06cc - \\u0646\\u0648\\u0639 \\u0628\\u0633\\u062a\\u0647 \\u0628\\u0646\\u062f\\u06cc : \\u0628\\u0637\\u0631\\u06cc\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u062f\\u0648\\u063a \\u0628\\u0632\\u0631\\u06af \\u0622\\u0628\\u0639\\u0644\\u06cc - \\u0646\\u0648\\u0639 \\u0645\\u0627\\u062f\\u0647 \\u063a\\u0630\\u0627\\u06cc\\u06cc : \\u06af\\u0627\\u0632 \\u062f\\u0627\\u0631\"}}]',9,1),(286,'2024-10-21 19:43:28.994197','14','دوغ کوچیک آبعلی',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0648\\u0636\\u06cc\\u062d\\u0627\\u062a \\u06a9\\u0627\\u0645\\u0644\"]}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u062f\\u0648\\u063a \\u06a9\\u0648\\u0686\\u06cc\\u06a9 \\u0622\\u0628\\u0639\\u0644\\u06cc - \\u0648\\u0632\\u0646 : 500 \\u06af\\u0631\\u0645\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u062f\\u0648\\u063a \\u06a9\\u0648\\u0686\\u06cc\\u06a9 \\u0622\\u0628\\u0639\\u0644\\u06cc - \\u0646\\u0648\\u0639 \\u0628\\u0633\\u062a\\u0647 \\u0628\\u0646\\u062f\\u06cc : \\u0628\\u0637\\u0631\\u06cc\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u062f\\u0648\\u063a \\u06a9\\u0648\\u0686\\u06cc\\u06a9 \\u0622\\u0628\\u0639\\u0644\\u06cc - \\u0646\\u0648\\u0639 \\u0645\\u0627\\u062f\\u0647 \\u063a\\u0630\\u0627\\u06cc\\u06cc : \\u06af\\u0627\\u0632 \\u062f\\u0627\\u0631\"}}]',9,1),(287,'2024-10-21 19:43:57.374995','13','وزن',2,'[{\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"53  900 \\u06af\\u0631\\u0645\"}}]',8,1),(288,'2024-10-21 19:45:24.897863','15','ماست پگاه کم چرب - 900گرم',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0648\\u0636\\u06cc\\u062d\\u0627\\u062a \\u06a9\\u0627\\u0645\\u0644\"]}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0645\\u0627\\u0633\\u062a \\u067e\\u06af\\u0627\\u0647 \\u06a9\\u0645 \\u0686\\u0631\\u0628 - 900\\u06af\\u0631\\u0645 - \\u0648\\u0632\\u0646 : 900 \\u06af\\u0631\\u0645\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0645\\u0627\\u0633\\u062a \\u067e\\u06af\\u0627\\u0647 \\u06a9\\u0645 \\u0686\\u0631\\u0628 - 900\\u06af\\u0631\\u0645 - \\u0646\\u0648\\u0639 \\u0645\\u0627\\u062f\\u0647 \\u063a\\u0630\\u0627\\u06cc\\u06cc : \\u06a9\\u0645 \\u0686\\u0631\\u0628\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0645\\u0627\\u0633\\u062a \\u067e\\u06af\\u0627\\u0647 \\u06a9\\u0645 \\u0686\\u0631\\u0628 - 900\\u06af\\u0631\\u0645 - \\u0646\\u0648\\u0639 \\u0648\\u06cc\\u062a\\u0627\\u0645\\u06cc\\u0646 \\u0648 \\u0645\\u0648\\u0627\\u062f \\u0645\\u0639\\u062f\\u0646\\u06cc : \\u0648\\u06cc\\u062a\\u0627\\u0645\\u06cc\\u0646 D\"}}]',9,1),(289,'2024-10-21 19:46:10.437657','13','وزن',2,'[{\"added\": {\"name\": \"\\u0645\\u0642\\u062f\\u0627\\u0631 \\u0648\\u06cc\\u0698\\u06af\\u06cc\", \"object\": \"54  600 \\u06af\\u0631\\u0645\"}}]',8,1),(290,'2024-10-21 19:47:01.034209','17','ماست کم چرب کاله - 600گرم',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0648\\u0636\\u06cc\\u062d\\u0627\\u062a \\u06a9\\u0627\\u0645\\u0644\"]}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0645\\u0627\\u0633\\u062a \\u06a9\\u0645 \\u0686\\u0631\\u0628 \\u06a9\\u0627\\u0644\\u0647 - 600\\u06af\\u0631\\u0645 - \\u0648\\u0632\\u0646 : 600 \\u06af\\u0631\\u0645\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0645\\u0627\\u0633\\u062a \\u06a9\\u0645 \\u0686\\u0631\\u0628 \\u06a9\\u0627\\u0644\\u0647 - 600\\u06af\\u0631\\u0645 - \\u0646\\u0648\\u0639 \\u0645\\u0627\\u062f\\u0647 \\u063a\\u0630\\u0627\\u06cc\\u06cc : \\u06a9\\u0645 \\u0686\\u0631\\u0628\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0645\\u0627\\u0633\\u062a \\u06a9\\u0645 \\u0686\\u0631\\u0628 \\u06a9\\u0627\\u0644\\u0647 - 600\\u06af\\u0631\\u0645 - \\u0646\\u0648\\u0639 \\u0648\\u06cc\\u062a\\u0627\\u0645\\u06cc\\u0646 \\u0648 \\u0645\\u0648\\u0627\\u062f \\u0645\\u0639\\u062f\\u0646\\u06cc : \\u0648\\u06cc\\u062a\\u0627\\u0645\\u06cc\\u0646 D\"}}]',9,1),(291,'2024-10-21 19:56:11.400242','24','نوشابه خانواده کوکاکولا - 1.5لیتر',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0648\\u0636\\u06cc\\u062d\\u0627\\u062a \\u06a9\\u0627\\u0645\\u0644\"]}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0646\\u0648\\u0634\\u0627\\u0628\\u0647 \\u062e\\u0627\\u0646\\u0648\\u0627\\u062f\\u0647 \\u06a9\\u0648\\u06a9\\u0627\\u06a9\\u0648\\u0644\\u0627 - 1.5\\u0644\\u06cc\\u062a\\u0631 - \\u0648\\u0632\\u0646 : 1.5 \\u0644\\u06cc\\u062a\\u0631\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0646\\u0648\\u0634\\u0627\\u0628\\u0647 \\u062e\\u0627\\u0646\\u0648\\u0627\\u062f\\u0647 \\u06a9\\u0648\\u06a9\\u0627\\u06a9\\u0648\\u0644\\u0627 - 1.5\\u0644\\u06cc\\u062a\\u0631 - \\u0646\\u0648\\u0639 \\u0628\\u0633\\u062a\\u0647 \\u0628\\u0646\\u062f\\u06cc : \\u0628\\u0637\\u0631\\u06cc\"}}, {\"added\": {\"name\": \"\\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0645\\u062d\\u0635\\u0648\\u0644\", \"object\": \"\\u0646\\u0648\\u0634\\u0627\\u0628\\u0647 \\u062e\\u0627\\u0646\\u0648\\u0627\\u062f\\u0647 \\u06a9\\u0648\\u06a9\\u0627\\u06a9\\u0648\\u0644\\u0627 - 1.5\\u0644\\u06cc\\u062a\\u0631 - \\u0648\\u06cc\\u0698\\u06af\\u06cc \\u0646\\u0648\\u0634\\u06cc\\u062f\\u0646\\u06cc : \\u06af\\u0627\\u0632 \\u062f\\u0627\\u0631\"}}]',9,1),(292,'2024-10-21 22:05:04.763086','1','عنوان اول - اسلاید اول',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0635\\u0648\\u06cc\\u0631 \\u0627\\u0633\\u0644\\u0627\\u06cc\\u062f\\u0631\"]}}]',29,1),(293,'2024-10-21 22:05:58.301163','2','title1',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0635\\u0648\\u06cc\\u0631 \\u0627\\u0633\\u0644\\u0627\\u06cc\\u062f\\u0631\"]}}]',29,1),(294,'2024-10-21 22:08:41.680518','1','عنوان اول - اسلاید اول',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0635\\u0648\\u06cc\\u0631 \\u0627\\u0633\\u0644\\u0627\\u06cc\\u062f\\u0631\"]}}]',29,1),(295,'2024-10-21 22:10:08.035292','1','عنوان اول - اسلاید اول',2,'[{\"changed\": {\"fields\": [\"\\u062a\\u0635\\u0648\\u06cc\\u0631 \\u0627\\u0633\\u0644\\u0627\\u06cc\\u062f\\u0631\"]}}]',29,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (14,'accounts','customer'),(6,'accounts','customuser'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(24,'comment_scoring_favorites','comment'),(27,'comment_scoring_favorites','favorite'),(25,'comment_scoring_favorites','scoring'),(4,'contenttypes','contenttype'),(18,'discounts','coupon'),(19,'discounts','discountbasket'),(20,'discounts','discountbasketdetails'),(29,'main','slider'),(26,'orders','favorite'),(15,'orders','order'),(16,'orders','orderdetails'),(28,'orders','orderstate'),(17,'orders','paymenttype'),(21,'payments','payment'),(7,'products','brand'),(8,'products','feature'),(13,'products','featurevalue'),(9,'products','product'),(10,'products','productfeature'),(11,'products','productgallery'),(12,'products','productgroup'),(5,'sessions','session'),(23,'warehouses','warehouse'),(22,'warehouses','warehousetype');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-06-24 19:57:08.915727'),(2,'contenttypes','0002_remove_content_type_name','2024-06-24 19:57:08.954540'),(3,'auth','0001_initial','2024-06-24 19:57:09.104050'),(4,'auth','0002_alter_permission_name_max_length','2024-06-24 19:57:09.140768'),(5,'auth','0003_alter_user_email_max_length','2024-06-24 19:57:09.148685'),(6,'auth','0004_alter_user_username_opts','2024-06-24 19:57:09.153637'),(7,'auth','0005_alter_user_last_login_null','2024-06-24 19:57:09.161389'),(8,'auth','0006_require_contenttypes_0002','2024-06-24 19:57:09.165367'),(9,'auth','0007_alter_validators_add_error_messages','2024-06-24 19:57:09.170350'),(10,'auth','0008_alter_user_username_max_length','2024-06-24 19:57:09.176525'),(11,'auth','0009_alter_user_last_name_max_length','2024-06-24 19:57:09.182881'),(12,'auth','0010_alter_group_name_max_length','2024-06-24 19:57:09.198357'),(13,'auth','0011_update_proxy_permissions','2024-06-24 19:57:09.206407'),(14,'auth','0012_alter_user_first_name_max_length','2024-06-24 19:57:09.211390'),(15,'accounts','0001_initial','2024-06-24 19:57:09.395684'),(16,'admin','0001_initial','2024-06-24 19:57:09.481299'),(17,'admin','0002_logentry_remove_auto_add','2024-06-24 19:57:09.488197'),(18,'admin','0003_logentry_add_action_flag_choices','2024-06-24 19:57:09.495512'),(19,'sessions','0001_initial','2024-06-24 19:57:09.523713'),(20,'accounts','0002_alter_customuser_mobile_number','2024-07-13 22:19:15.455782'),(21,'products','0001_initial','2024-07-13 22:19:16.324565'),(22,'products','0002_rename_group_product_productgroup_group_parent_and_more','2024-07-15 15:58:07.863578'),(23,'products','0003_alter_brand_image_name_alter_product_image_name_and_more','2024-07-15 16:04:34.402891'),(24,'products','0004_alter_brand_image_name_alter_product_discription_and_more','2024-07-28 15:50:11.433383'),(25,'products','0005_product_summery_discription_alter_brand_image_name_and_more','2024-07-30 17:22:31.589956'),(26,'products','0006_rename_discription_product_description_and_more','2024-07-30 18:05:47.029240'),(27,'products','0007_rename_description_product_discription_and_more','2024-07-31 13:30:01.642671'),(28,'products','0008_alter_brand_image_name_alter_product_image_name_and_more','2024-08-02 18:10:38.157752'),(29,'accounts','0003_customer','2024-08-27 21:23:20.585911'),(30,'products','0009_alter_brand_image_name_alter_featurevalue_feature_and_more','2024-08-27 21:23:20.626753'),(31,'orders','0001_initial','2024-08-27 21:23:20.791757'),(32,'accounts','0004_alter_customer_image_name','2024-08-28 12:17:34.359504'),(33,'orders','0002_alter_order_discount_alter_order_register_date','2024-08-28 12:17:34.374577'),(34,'products','0010_alter_brand_image_name_alter_product_image_name_and_more','2024-08-28 12:17:34.400282'),(35,'accounts','0005_alter_customer_image_name','2024-08-28 17:07:40.461497'),(36,'orders','0003_paymenttype_order_description_and_more','2024-08-28 17:07:40.566120'),(37,'products','0011_alter_brand_image_name_alter_product_image_name_and_more','2024-08-28 17:07:40.590897'),(38,'accounts','0006_alter_customer_image_name','2024-09-02 15:39:15.003781'),(39,'products','0012_alter_brand_image_name_alter_product_image_name_and_more','2024-09-02 15:39:15.039769'),(40,'discounts','0001_initial','2024-09-02 15:39:15.208062'),(41,'orders','0004_alter_order_register_date','2024-09-02 15:39:15.214042'),(42,'accounts','0007_alter_customer_image_name','2024-09-02 15:48:06.063998'),(43,'discounts','0002_alter_coupen_discount_alter_discountbasket_discount','2024-09-02 15:48:06.075027'),(44,'orders','0005_alter_order_register_date','2024-09-02 15:48:06.085909'),(45,'products','0013_alter_brand_image_name_alter_product_image_name_and_more','2024-09-02 15:48:06.114385'),(46,'accounts','0008_alter_customer_image_name','2024-09-03 16:50:51.397857'),(47,'discounts','0003_rename_coupen_coupon','2024-09-03 16:50:51.458333'),(48,'orders','0006_alter_order_register_date','2024-09-03 16:50:51.464342'),(49,'products','0014_alter_brand_image_name_alter_product_image_name_and_more','2024-09-03 16:50:51.488988'),(50,'accounts','0009_alter_customer_image_name','2024-09-03 17:28:11.659692'),(51,'discounts','0004_rename_coupen_code_coupon_coupon_code','2024-09-03 17:28:11.690635'),(52,'orders','0007_alter_order_register_date','2024-09-03 17:28:11.696995'),(53,'products','0015_alter_brand_image_name_alter_product_image_name_and_more','2024-09-03 17:28:11.723972'),(54,'accounts','0010_alter_customer_image_name','2024-09-07 14:56:59.386006'),(55,'orders','0008_alter_order_register_date','2024-09-07 14:56:59.397002'),(56,'payments','0001_initial','2024-09-07 14:56:59.537916'),(57,'products','0016_alter_brand_image_name_alter_product_image_name_and_more','2024-09-07 14:56:59.565810'),(58,'accounts','0011_alter_customer_image_name','2024-09-07 16:34:54.808890'),(59,'orders','0009_alter_order_register_date_alter_orderdetails_order','2024-09-07 16:34:54.830638'),(60,'products','0017_alter_brand_image_name_alter_product_image_name_and_more','2024-09-07 16:34:54.857901'),(61,'accounts','0012_alter_customer_image_name','2024-09-08 15:05:56.169554'),(62,'orders','0010_alter_order_register_date','2024-09-08 15:05:56.185016'),(63,'products','0018_alter_brand_image_name_alter_product_image_name_and_more','2024-09-08 15:05:56.214203'),(64,'warehouses','0001_initial','2024-09-08 15:05:56.369938'),(65,'accounts','0013_alter_customer_image_name','2024-09-10 16:09:08.011627'),(66,'products','0019_alter_brand_image_name_alter_product_image_name_and_more','2024-09-10 16:09:08.046312'),(67,'comment_scoring_favorites','0001_initial','2024-09-10 16:09:08.238053'),(68,'orders','0011_alter_order_register_date','2024-09-10 16:09:08.246060'),(69,'warehouses','0002_alter_warehouse_product','2024-09-10 16:09:08.264857'),(70,'accounts','0014_alter_customer_image_name','2024-09-12 00:27:10.560163'),(71,'orders','0012_alter_order_register_date','2024-09-12 00:27:10.572966'),(72,'products','0020_alter_brand_image_name_alter_product_image_name_and_more','2024-09-12 00:27:10.604195'),(73,'accounts','0015_alter_customer_image_name','2024-09-12 22:54:17.121318'),(74,'products','0021_alter_brand_image_name_alter_product_image_name_and_more','2024-09-12 22:54:17.161182'),(75,'comment_scoring_favorites','0002_scoring','2024-09-12 22:54:17.638588'),(76,'orders','0013_alter_order_register_date','2024-09-12 22:54:17.647645'),(77,'accounts','0016_alter_customer_image_name','2024-09-13 18:50:36.845811'),(78,'orders','0014_alter_order_register_date','2024-09-13 18:50:36.856698'),(79,'products','0022_alter_brand_image_name_alter_product_image_name_and_more','2024-09-13 18:50:36.891581'),(80,'accounts','0017_alter_customer_image_name','2024-09-14 14:25:53.519274'),(81,'orders','0015_alter_order_register_date','2024-09-14 14:25:53.529238'),(82,'products','0023_alter_brand_image_name_alter_product_image_name_and_more','2024-09-14 14:25:53.566791'),(83,'accounts','0018_alter_customer_image_name','2024-09-14 14:26:55.084699'),(84,'orders','0016_alter_order_register_date','2024-09-14 14:26:55.104718'),(85,'products','0024_alter_brand_image_name_alter_product_image_name_and_more','2024-09-14 14:26:55.149482'),(86,'accounts','0019_alter_customer_image_name','2024-09-14 14:29:41.813440'),(87,'orders','0017_alter_order_register_date','2024-09-14 14:29:41.833371'),(88,'products','0025_alter_brand_image_name_alter_product_image_name_and_more','2024-09-14 14:29:41.865907'),(89,'accounts','0020_alter_customer_image_name','2024-09-14 14:31:45.208957'),(90,'products','0026_alter_brand_image_name_alter_product_image_name_and_more','2024-09-14 14:31:45.258630'),(91,'accounts','0021_alter_customer_image_name','2024-09-14 14:33:12.883425'),(92,'products','0027_alter_brand_image_name_alter_product_image_name_and_more','2024-09-14 14:33:12.930262'),(93,'accounts','0022_alter_customer_image_name','2024-09-15 11:22:54.338239'),(94,'comment_scoring_favorites','0003_alter_comment_approving_user','2024-09-15 11:22:54.871455'),(95,'products','0028_alter_brand_image_name_alter_product_image_name_and_more','2024-09-15 11:22:54.902427'),(96,'orders','0018_favorite','2024-09-15 11:22:55.018962'),(97,'accounts','0023_alter_customer_image_name','2024-09-15 14:28:01.111957'),(98,'products','0029_alter_brand_image_name_alter_product_image_name_and_more','2024-09-15 14:28:01.161789'),(99,'comment_scoring_favorites','0004_favorite','2024-09-15 14:28:02.944774'),(100,'orders','0019_delete_favorite','2024-09-15 14:28:02.964709'),(101,'accounts','0024_alter_customer_image_name','2024-09-23 14:39:00.739818'),(102,'orders','0020_orderstate_order_order_state','2024-09-23 14:39:01.097622'),(103,'products','0030_alter_brand_image_name_alter_product_image_name_and_more','2024-09-23 14:39:01.148452'),(104,'accounts','0025_alter_customer_image_name','2024-09-27 13:51:45.841940'),(105,'main','0001_initial','2024-09-27 13:51:46.110549'),(106,'products','0031_alter_brand_image_name_alter_product_image_name_and_more','2024-09-27 13:51:46.164897'),(107,'accounts','0026_alter_customer_image_name','2024-09-27 14:01:22.586409'),(108,'main','0002_alter_slider_image_name','2024-09-27 14:01:22.605176'),(109,'products','0032_alter_brand_image_name_alter_product_image_name_and_more','2024-09-27 14:01:22.641287'),(110,'accounts','0027_alter_customer_image_name','2024-09-27 14:09:13.786586'),(111,'main','0003_alter_slider_image_name','2024-09-27 14:09:13.803353'),(112,'products','0033_alter_brand_image_name_alter_product_image_name_and_more','2024-09-27 14:09:13.841261'),(113,'accounts','0028_alter_customer_image_name','2024-10-10 17:54:49.558504'),(114,'main','0004_alter_slider_image_name','2024-10-10 17:54:49.574596'),(115,'products','0034_rename_discription_product_description_and_more','2024-10-10 17:54:49.683196'),(116,'accounts','0029_alter_customer_image_name','2024-10-10 19:22:39.186821'),(117,'main','0005_alter_slider_image_name','2024-10-10 19:22:39.204029'),(118,'products','0035_alter_brand_image_name_alter_product_image_name_and_more','2024-10-10 19:22:39.239388'),(119,'accounts','0030_alter_customer_options_alter_customuser_options_and_more','2024-10-10 20:09:59.934977'),(120,'main','0006_alter_slider_image_name','2024-10-10 20:09:59.950311'),(121,'products','0036_remove_product_summery_description_and_more','2024-10-10 20:10:00.063548'),(122,'accounts','0031_alter_customer_image_name','2024-10-11 16:39:52.706635'),(123,'main','0007_alter_slider_image_name','2024-10-11 16:39:52.713638'),(124,'products','0037_alter_brand_image_name_alter_product_image_name_and_more','2024-10-11 16:39:52.750633'),(125,'warehouses','0003_alter_warehouse_user_registered','2024-10-11 16:39:52.837633');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0ozp7hf2pp59u9s7grd23bhqvw1r0yme','eyJzaG9wX2NhcnQiOnt9fQ:1shnF8:ay6kSagi7rX8GMRVaCy-7jnINoQbBz3R6TPZAbSFijM','2024-09-07 13:09:34.077590'),('1ao2izo0vbrphna51b48cjrev3pltyer','eyJzaG9wX2NhcnQiOnt9fQ:1sytvu:zAJ_rwXYTJJJ8gHD3ek-oCQ8z1sqC-i9cRFNG9fKE8c','2024-10-24 17:44:26.259667'),('2785l1qn01dn6ubv8ud2anwzm3id4dol','eyJjb21wYXJlX3Byb2R1Y3QiOltdfQ:1t2w6A:L94i86hrkcRxc9s-P0tWqIx-TMrozqb9qh3BRirIi8Q','2024-11-04 20:51:42.176934'),('36ceiwt0u1z8d7o1zvdrk0gi83d597d3','eyJjb21wYXJlX3Byb2R1Y3QiOltdfQ:1syrTu:TGQ6Yue6-Q1JUvsCa_vys1zwwDMOYs4x3EXiWR8N2BE','2024-10-24 15:07:22.890493'),('41kqt7sehe29jn68ti988e2ht44oqcpu','.eJxVjEEOwiAQRe_C2hCmFASX7j0DGZhBqgaS0q6Md7dNutDte-__twi4LiWsnecwkbgIEKdfFjE9ue6CHljvTaZWl3mKck_kYbu8NeLX9Wj_Dgr2sq0N-rPS1qXBQnaRmRSzBs9m0IRJO4ToM2kAojxuhG3WzhjvRyBFID5f8gM4Yw:1sOFU7:xx-QqZqU-PzkgjdDR5IBfegagenAwEEtiBq8d7g_CyQ','2024-07-15 15:16:15.503707'),('4b43hrpujv0r94e6vumdw8w3era3bf1y','eyJzaG9wX2NhcnQiOnt9fQ:1syrTu:swcJqLznM3XWuTTZS2xIHrd8aUMPvI6VQfhxuLoCbx8','2024-10-24 15:07:22.885209'),('b89x2sdx0jz0wiqfq19wwhp3xh3yg7hj','.eJxVjEEOwiAQRe_C2hCmFASX7j0DGZhBqgaS0q6Md7dNutDte-__twi4LiWsnecwkbgIEKdfFjE9ue6CHljvTaZWl3mKck_kYbu8NeLX9Wj_Dgr2sq0N-rPS1qXBQnaRmRSzBs9m0IRJO4ToM2kAojxuhG3WzhjvRyBFID5f8gM4Yw:1sVBtR:npOzNWHVb8g0f4eTfdPBqLXIKz6GUUN9BEyVgaE_rsw','2024-08-03 18:51:05.286459'),('bd0y6druvxvt7r95ugp3532abxeo32qf','.eJxVjEEOwiAQRe_C2hCmFASX7j0DGZhBqgaS0q6Md7dNutDte-__twi4LiWsnecwkbgIEKdfFjE9ue6CHljvTaZWl3mKck_kYbu8NeLX9Wj_Dgr2sq0N-rPS1qXBQnaRmRSzBs9m0IRJO4ToM2kAojxuhG3WzhjvRyBFID5f8gM4Yw:1sTKEU:-pGWUtJ3oKMDdANA-1p94u2Bjui0hAMx4rGWzKG9Zho','2024-07-29 15:21:06.872396'),('ir2hlmq5dnp4wih7vpjs8yt0408bh66u','eyJjb21wYXJlX3Byb2R1Y3QiOltdfQ:1sxS4q:-NDpHBP1i7aW6ogOocUCVZHAU3lsHDjiDNtUgJwHXWc','2024-10-20 17:47:40.626014'),('kj43yh3bc8etdk95u0teprckwem30gjj','.eJxVjDkOgzAURO_ya4T8vWCgTJ8TRJHlNSYLRjZUiLsHJBqq0cybmRVs-k06ezXl5BY7Q_8QzwpKTJOyOu9-3SpQepmjWorPanDQA8IlM9p-_HgA99bjK9U2jXMeTH1U6pOW-p6c_97O7uUg6hL3dbCMM6kF5bKTiIG1yDxy9KRxRhIZuoBGtJRyR6hohNjFB9I56ghDI2H7A5bDQ-c:1t0h6G:vdwzFTjidBXT2-LGyON6UuhSTK0MehPSKv19XzUSipU','2024-10-29 16:26:32.259034'),('ljik36y9uhld7if3h7t9j8z6mt5g7txe','eyJzaG9wX2NhcnQiOnt9fQ:1szEff:0DshFtOVhioDVTzNRvdGefuwSVOOBjHtLMQ1mKbSdKQ','2024-10-25 15:53:03.201011'),('m81i2k5bhrmivazhkih7t2omi5rh53fy','eyJzaG9wX2NhcnQiOnsiMyI6eyJxdHkiOjMsInByaWNlIjoxMjAwMCwiZmluYWxfcHJpY2UiOjkwMDAuMH19fQ:1sl8S5:lY56Lf0CfizqeG33SlveQEhDiBYVr7Kj6WivdEcESxs','2024-09-16 18:24:45.450481'),('mwk4uawy2ftuyzkz541dt1k050zs78zk','.eJxVjDkOgzAURO_iGln-XjBQps8JosjyGpMFIxsqxN1jJIqkGum9mdmQ0usS1Vp8VqNDAwLU_DKj7ctPh3BPPT0Stmla8mjwUcGnLfianH9fzu7fQdQl1nWwjDOpBeWylwCBdcA8cPCkdUYSGfoARnSUckeoaIWo4QPpHXWEgZH1tMQ0K6vzgoZtb5BNn1lnr-ac3GorvN33L01-Q7I:1svHb5:DgiK0fIZTYnPUeJTMadVN-vzscUoWeuiv-p6pKRuf3c','2024-10-14 18:11:59.510914'),('njn8ja662hyqebbyohpu71mtmltcledk','eyJjb21wYXJlX3Byb2R1Y3QiOltdLCJzaG9wX2NhcnQiOnt9fQ:1sys0H:PgFpVLz5Zg6v1mYyJViX9fnccs7Uf1S7HnoxMCRxa2E','2024-10-24 15:40:49.943021'),('nr13x8kl7dovw8k9hni456y00zl9ubbm','.eJxVjLkOgzAYg98lM4ry5yDA2L1PUFVRzoYeBCUwId69QWJoJ8v-bG9I6XWJai0-q9GhAQFqfjOj7ctPB3BPPT0Stmla8mjwUcEnLfianH9fzu7fQdQl1nWwjDOpBeWylwCBdcA8cPCkdUYSGfoARnSUckeoaIWo4gPpHXWEgZH11KbPrLNXc05utQsabvcGlZhmZXWudtv3L08cQ7I:1t2vFJ:WHpEN6-vFGkSJ3x6H6shIsO6i9GboLt_sktJGuexe6k','2024-11-04 19:57:05.495549'),('o6vueyhiobw8liwqd9ws02y2ipzpy7th','.eJxVjEEOwiAQRe_C2hCmFASX7j0DGZhBqgaS0q6Md7dNutDte-__twi4LiWsnecwkbgIEKdfFjE9ue6CHljvTaZWl3mKck_kYbu8NeLX9Wj_Dgr2sq0N-rPS1qXBQnaRmRSzBs9m0IRJO4ToM2kAojxuhG3WzhjvRyBFID5f8gM4Yw:1sXSGD:Z1uLdr12zpyRdUmkK8H1p4v3iSGz8usqIbiWgafvNYw','2024-08-10 00:43:57.133052'),('oqr6sosd6idccm2ia0o69rcctfjlja5i','.eJxVjEEOwiAQRe_C2hCmFASX7j0DGZhBqgaS0q6Md7dNutDte-__twi4LiWsnecwkbgIEKdfFjE9ue6CHljvTaZWl3mKck_kYbu8NeLX9Wj_Dgr2sq0N-rPS1qXBQnaRmRSzBs9m0IRJO4ToM2kAojxuhG3WzhjvRyBFID5f8gM4Yw:1sXcRo:ffo8E7vjqYY6qjkoOBJ2x0zSGnoNEnlAuC4xt-OcJMU','2024-08-10 11:36:36.991367'),('qtl0k3fyfdcsbyw5ei4f0zr46etidyv5','eyJzaG9wX2NhcnQiOnt9fQ:1sys00:v323R2u9q9kH4VbGNXx4aZI7bHkJ5BRGdq4vOzPoCGU','2024-10-24 15:40:32.326880'),('r0mdldwlqiux5ml0x7r16cxvdspyowko','.eJxVjDkOgzAURO_iGln-XjBQps8JosjyGpMFIxsqxN1jJIqkGum9mdmQ0usS1Vp8VqNDAwLU_DKj7ctPh3BPPT0Stmla8mjwUcGnLfianH9fzu7fQdQl1nWwjDOpBeWylwCBdcA8cPCkdUYSGfoARnSUckeoaIWo4QPpHXWEgZH11KbPrLNXc05utQsabtDdG1RimpXVuYJt37_RlUQb:1sywWU:1fqulbZQIAvW3Zm74xvFnjcUZces6vWyEZm2oyYPc4c','2024-10-24 20:30:22.380775'),('rji7w6asrqjnzcwlo2urhb4zlu2t9hso','eyJzaG9wX2NhcnQiOnt9LCJjb21wYXJlX3Byb2R1Y3QiOltdfQ:1sxS8X:zCS1cS5uA8JAR3dzWwedsZgLku6LaYBR1Mvc90q_hqU','2024-10-20 17:51:29.993623'),('th4g68eio1rub5xq7vakhb0zuvrbd7vi','.eJxVjEEOwiAQRe_C2hCmFASX7j0DGZhBqgaS0q6Md7dNutDte-__twi4LiWsnecwkbgIEKdfFjE9ue6CHljvTaZWl3mKck_kYbu8NeLX9Wj_Dgr2sq0N-rPS1qXBQnaRmRSzBs9m0IRJO4ToM2kAojxuhG3WzhjvRyBFID5f8gM4Yw:1sWyzY:tqWw-6B3xlOYVGfhJNtRnc_vMpzKDb-jaGqD1tsyKOA','2024-08-08 17:28:48.289504'),('v532z59fq8ekijukr3omhqor3al9m6gx','.eJxVjUEOgyAQRe_CujHgSBxddt8zEGDGSmshEe3GePdi46LdTf5_8_4mjF2X0ayZZxNI9ALE5Tdz1j85HgU9bLynyqe4zMFVB1Kdba5uiXi6nuyfYLR5LN-IA9SkW_KdYmcV4KBrkKC906A1ttICcIOdLyfUPAyN8ppaJ5EUkSzSry5zziFF0W_C-iW82fgyXQYUdBIL9UouTGzi-nI8l1x2ClHs-wcbKEvO:1sQ3Lp:O7RRRqXIk8bDGblzmiXrwUhPfbEaI_Wj5J9GWB1GNzo','2024-07-20 14:43:09.226205'),('vt85tgphr0csz3zus5qv7bcr0ii3egcx','.eJxVjEEOwiAQRe_C2hCmFASX7j0DGZhBqgaS0q6Md7dNutDte-__twi4LiWsnecwkbgIEKdfFjE9ue6CHljvTaZWl3mKck_kYbu8NeLX9Wj_Dgr2sq0N-rPS1qXBQnaRmRSzBs9m0IRJO4ToM2kAojxuhG3WzhjvRyBFID5f8gM4Yw:1seL3V:KNbNrosm15sLjzmDjUSqVjzRaJ8PR9iKdm4A5LJNGu4','2024-08-29 00:27:17.955006'),('vvac1tr98zz0fg68z18vfa0t5mimzop0','eyJzaG9wX2NhcnQiOnt9fQ:1t0kf2:OvICqiz1RYRH8WeqszDOMKb-MgN6IjXlII2Xz7LuXHs','2024-10-29 20:14:40.245144'),('wn3iw4jbsatc2wxcq6e6lbddmhv7gi84','.eJxVjDsOgzAQBe-yNbKMwTamTJ8TRJG17JpAPhgZqBB3D0g0tDPz3gpTF0dPmGao1y0Dir8RU_BjirzQDh_PDDwuc-eXKSTfM9SgHFxgg_QJw2H4jcMrCorDnPpGHIk47STukcP3draXgw6nbl8XumxsSZIlNy1aqfPCBeVI2tbIojSsiQyaXNmQy9yxrrgqnG21xKAqZ2D7A7byRF4:1t0jAA:L2pGM0HnF5E9XHKfv9jSWOTymNmXFnJzgYqnseaqjwU','2024-10-29 18:38:42.483910'),('wz5sjcimwapxo9fpl2t5l27nlij0uotz','.eJxVjMsOgyAQRf-FtSGAIKHL7vsFTUNGZlrsQwzoyvjvxcRFuz3n3LsyD8sc_VIo-wHZiUnW_LIewovGXeATxkfiIY1zHnq-J_ywhV8S0vt8tH8HEUqs61YaoYTVWtmgtAWSWqgWe-G0MKRt57BDkobu1koCpVCTMk50VBPj2npaYpp8gDyz07o1LKTPBJn8lBMuocLrbfsCNOBDhg:1t2xwd:XaB7R175ggTcmDghg4UxYuaAg1-c73BYvareYxOROms','2024-11-04 22:49:59.772864'),('xkkjs39xk8kqqb6kmdkl16z3hdsgvhzz','.eJxVjEEOwiAQRe_C2hCmFASX7j0DGZhBqgaS0q6Md7dNutDte-__twi4LiWsnecwkbgIEKdfFjE9ue6CHljvTaZWl3mKck_kYbu8NeLX9Wj_Dgr2sq0N-rPS1qXBQnaRmRSzBs9m0IRJO4ToM2kAojxuhG3WzhjvRyBFID5f8gM4Yw:1sLmaR:wDiDtKAJGldSYsrEtN_6kd_V883bq2IjLwD0uSBZC7w','2024-07-08 20:00:35.080601'),('y7e8a9ky3paiwygqse3m1syj8u7h4sfb','eyJjb21wYXJlX3Byb2R1Y3QiOltdfQ:1t0i5X:fLXHLafaXDEeVgP9zJ-KyCfb12w1-RoszoRXD14DBts','2024-10-29 17:29:51.137187');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_slider`
--

DROP TABLE IF EXISTS `main_slider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_slider` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `slider_title1` varchar(500) DEFAULT NULL,
  `slider_title2` varchar(500) DEFAULT NULL,
  `slider_title3` varchar(500) DEFAULT NULL,
  `image_name` varchar(100) NOT NULL,
  `slider_link` varchar(200) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `register_date` datetime(6) NOT NULL,
  `published_date` datetime(6) NOT NULL,
  `update_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_slider`
--

LOCK TABLES `main_slider` WRITE;
/*!40000 ALTER TABLE `main_slider` DISABLE KEYS */;
INSERT INTO `main_slider` VALUES (1,'عنوان اول - اسلاید اول',NULL,NULL,'images/slides/641a6b66-6724-4a90-8f90-74300067936b.jpg','https://bazarganisib.com/shop/mobile-phone/iphone/iphone15/',1,'2024-09-27 14:06:09.259931','2024-09-27 10:36:05.000000','2024-10-21 22:10:08.033229'),(2,'title1','title2','title3','images/slides/060c0a81-b2c6-45cd-8e41-8ca9914f8bbd.jpg','https://www.amazon.com/ref=nav_logo',1,'2024-09-27 15:33:16.067911','2024-09-27 15:32:05.000000','2024-10-21 22:05:58.298249');
/*!40000 ALTER TABLE `main_slider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_order`
--

DROP TABLE IF EXISTS `orders_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `register_date` date NOT NULL,
  `update_date` date NOT NULL,
  `is_finaly` tinyint(1) NOT NULL,
  `order_code` char(32) NOT NULL,
  `discount` int DEFAULT NULL,
  `customer_id` bigint NOT NULL,
  `description` longtext,
  `payment_type_id` bigint DEFAULT NULL,
  `order_state_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_code` (`order_code`),
  KEY `orders_order_customer_id_0b76f6a4_fk_accounts_customer_user_id` (`customer_id`),
  KEY `orders_order_payment_type_id_fa27978f_fk_orders_paymenttype_id` (`payment_type_id`),
  KEY `orders_order_order_state_id_b4413e2c_fk_orders_orderstate_id` (`order_state_id`),
  CONSTRAINT `orders_order_customer_id_0b76f6a4_fk_accounts_customer_user_id` FOREIGN KEY (`customer_id`) REFERENCES `accounts_customer` (`user_id`),
  CONSTRAINT `orders_order_order_state_id_b4413e2c_fk_orders_orderstate_id` FOREIGN KEY (`order_state_id`) REFERENCES `orders_orderstate` (`id`),
  CONSTRAINT `orders_order_payment_type_id_fa27978f_fk_orders_paymenttype_id` FOREIGN KEY (`payment_type_id`) REFERENCES `orders_paymenttype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_order`
--

LOCK TABLES `orders_order` WRITE;
/*!40000 ALTER TABLE `orders_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_orderdetails`
--

DROP TABLE IF EXISTS `orders_orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_orderdetails` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `qty` int unsigned NOT NULL,
  `price` int NOT NULL,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_orderdetails_order_id_d7985cfb_fk_orders_order_id` (`order_id`),
  KEY `orders_orderdetails_product_id_e66102b1_fk_products_product_id` (`product_id`),
  CONSTRAINT `orders_orderdetails_order_id_d7985cfb_fk_orders_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders_order` (`id`),
  CONSTRAINT `orders_orderdetails_product_id_e66102b1_fk_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`),
  CONSTRAINT `orders_orderdetails_chk_1` CHECK ((`qty` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_orderdetails`
--

LOCK TABLES `orders_orderdetails` WRITE;
/*!40000 ALTER TABLE `orders_orderdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_orderstate`
--

DROP TABLE IF EXISTS `orders_orderstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_orderstate` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_state_title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_orderstate`
--

LOCK TABLES `orders_orderstate` WRITE;
/*!40000 ALTER TABLE `orders_orderstate` DISABLE KEYS */;
INSERT INTO `orders_orderstate` VALUES (1,'ثبت شده'),(2,'درحال بررسی'),(3,'تحویل پست'),(4,'تحویل پیک'),(5,'تحویل مشتری');
/*!40000 ALTER TABLE `orders_orderstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_paymenttype`
--

DROP TABLE IF EXISTS `orders_paymenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_paymenttype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `payment_title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_paymenttype`
--

LOCK TABLES `orders_paymenttype` WRITE;
/*!40000 ALTER TABLE `orders_paymenttype` DISABLE KEYS */;
INSERT INTO `orders_paymenttype` VALUES (3,'درگاه بانکی'),(4,'کیف پول');
/*!40000 ALTER TABLE `orders_paymenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments_payment`
--

DROP TABLE IF EXISTS `payments_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments_payment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `register_date` datetime(6) NOT NULL,
  `update_date` datetime(6) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `is_finally` tinyint(1) NOT NULL,
  `status_code` int NOT NULL,
  `ref_id` varchar(50) DEFAULT NULL,
  `customer_id` bigint NOT NULL,
  `order_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_payment_customer_id_8b4d6141_fk_accounts_` (`customer_id`),
  KEY `payments_payment_order_id_22c479b7_fk_orders_order_id` (`order_id`),
  CONSTRAINT `payments_payment_customer_id_8b4d6141_fk_accounts_` FOREIGN KEY (`customer_id`) REFERENCES `accounts_customer` (`user_id`),
  CONSTRAINT `payments_payment_order_id_22c479b7_fk_orders_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments_payment`
--

LOCK TABLES `payments_payment` WRITE;
/*!40000 ALTER TABLE `payments_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_brand`
--

DROP TABLE IF EXISTS `products_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_brand` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `brand_title` varchar(100) NOT NULL,
  `image_name` varchar(100) NOT NULL,
  `slug` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_brand_slug_925fd11b` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_brand`
--

LOCK TABLES `products_brand` WRITE;
/*!40000 ALTER TABLE `products_brand` DISABLE KEYS */;
INSERT INTO `products_brand` VALUES (1,'پپسی','','pepsi'),(2,'کوکاکولا','','coca-cola'),(3,'ردبول','','red-bull'),(4,'کاله','','kaleh'),(5,'خاطره','','khatereh'),(6,'طارم','','taram'),(7,'احمد','','ahmad'),(8,'آرسیس','','arsis'),(9,'مژده','','mozhdeh'),(10,'دل بهار','','del-bahar'),(11,'ستایش','','setaysh'),(12,'صباح','','sabah'),(13,'کاله','','kaleh'),(14,'آبعلی','','abali'),(15,'پگاه','','pegah'),(16,'مانا','','mana'),(17,'تک','','tak'),(18,'ویلی','','wili');
/*!40000 ALTER TABLE `products_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_feature`
--

DROP TABLE IF EXISTS `products_feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_feature` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `feature_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_feature`
--

LOCK TABLES `products_feature` WRITE;
/*!40000 ALTER TABLE `products_feature` DISABLE KEYS */;
INSERT INTO `products_feature` VALUES (13,'وزن'),(14,'نوع بسته بندی'),(15,'مواد تشکیل‌دهنده'),(16,'شکل ماده غذایی'),(17,'نوع ویتامین و مواد معدنی'),(18,'تعداد در بسته'),(19,'ویژگی نوشیدنی'),(20,'نوع ماده غذایی');
/*!40000 ALTER TABLE `products_feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_feature_product_group`
--

DROP TABLE IF EXISTS `products_feature_product_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_feature_product_group` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `feature_id` bigint NOT NULL,
  `productgroup_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_feature_product_feature_id_productgroup__d519fdd3_uniq` (`feature_id`,`productgroup_id`),
  KEY `products_feature_pro_productgroup_id_ee26510f_fk_products_` (`productgroup_id`),
  CONSTRAINT `products_feature_pro_feature_id_44520903_fk_products_` FOREIGN KEY (`feature_id`) REFERENCES `products_feature` (`id`),
  CONSTRAINT `products_feature_pro_productgroup_id_ee26510f_fk_products_` FOREIGN KEY (`productgroup_id`) REFERENCES `products_productgroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_feature_product_group`
--

LOCK TABLES `products_feature_product_group` WRITE;
/*!40000 ALTER TABLE `products_feature_product_group` DISABLE KEYS */;
INSERT INTO `products_feature_product_group` VALUES (59,13,2),(60,13,3),(61,13,4),(62,13,6),(63,13,7),(64,13,8),(65,13,10),(66,13,11),(67,13,12),(68,14,2),(69,14,3),(70,14,4),(71,14,6),(72,14,7),(73,14,8),(74,14,10),(75,14,11),(76,14,12),(77,15,12),(78,16,12),(79,17,3),(80,17,4),(81,17,6),(82,17,7),(83,17,8),(84,17,11),(85,17,12),(86,18,2),(87,18,3),(88,18,4),(89,18,6),(90,18,7),(91,18,8),(92,18,10),(93,18,11),(94,18,12),(95,19,3),(97,20,6),(98,20,7),(96,20,8);
/*!40000 ALTER TABLE `products_feature_product_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_featurevalue`
--

DROP TABLE IF EXISTS `products_featurevalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_featurevalue` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `value_title` varchar(100) NOT NULL,
  `feature_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_featurevalue_feature_id_24a69ce2_fk_products_feature_id` (`feature_id`),
  CONSTRAINT `products_featurevalue_feature_id_24a69ce2_fk_products_feature_id` FOREIGN KEY (`feature_id`) REFERENCES `products_feature` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_featurevalue`
--

LOCK TABLES `products_featurevalue` WRITE;
/*!40000 ALTER TABLE `products_featurevalue` DISABLE KEYS */;
INSERT INTO `products_featurevalue` VALUES (15,'500 گرم',13),(16,'1 لیتر',13),(17,'1.5 لیتر',13),(18,'2 لیتر',13),(19,'1 کیلوگرم',13),(20,'2 کیلوگرم',13),(21,'5 کیلو گرم',13),(22,'10 کیلو گرم',13),(23,'کیسه ای',14),(24,'بطری',14),(25,'شیشه',14),(26,'قوطی',14),(27,'حلبی',14),(28,'سمولینا',15),(29,'پیچی',16),(30,'رشته ای',16),(31,'پروانه ای',16),(32,'ویتامین B',17),(33,'آرد گندم',15),(34,'فانتزی',16),(35,'گندم',15),(36,'یک',18),(37,'گازدار',19),(38,'بدون گاز',19),(39,'9 کیلوگرم',13),(40,'ویتامین D',17),(41,'300 گرم',13),(42,'ساده',20),(43,'چکیده',20),(44,'سنتی',20),(45,'پرچرب',20),(46,'کم چرب',20),(47,'خامه ای',20),(48,'400 گرم',13),(52,'350 گرم',13),(53,'900 گرم',13),(54,'600 گرم',13);
/*!40000 ALTER TABLE `products_featurevalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_product`
--

DROP TABLE IF EXISTS `products_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_name` varchar(500) NOT NULL,
  `description` longtext,
  `image_name` varchar(100) NOT NULL,
  `price` int unsigned NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `register_date` date DEFAULT NULL,
  `published_date` date NOT NULL,
  `update_date` date NOT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `brand_id` bigint DEFAULT NULL,
  `summary_description` longtext,
  PRIMARY KEY (`id`),
  KEY `products_product_brand_id_3e2e8fd1_fk_products_brand_id` (`brand_id`),
  KEY `products_product_slug_70d3148d` (`slug`),
  CONSTRAINT `products_product_brand_id_3e2e8fd1_fk_products_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `products_brand` (`id`),
  CONSTRAINT `products_product_chk_1` CHECK ((`price` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_product`
--

LOCK TABLES `products_product` WRITE;
/*!40000 ALTER TABLE `products_product` DISABLE KEYS */;
INSERT INTO `products_product` VALUES (1,'نوشابه پپسی - 1.5 لیتری','<p>AAAA</p>','images/product/97efbe9a-970c-4cf7-b2fa-989cd9ee3352/.jpg',20000,1,'2024-10-08','2024-10-08','2024-10-20','pepsi-soda-1-5-liters',1,''),(2,'شیر کم چرب - 1 لیتری','<p>bbbbbb</p>','images/product/baef8cf1-0a21-4fff-bace-37e2af71c76c/.jpg',160000,1,'2024-10-08','2024-10-08','2024-10-21','Low-fat-milk-1liter',4,''),(3,'شیر پر چرب - 1 لیتر','<p>ccccccc</p>','images/product/d927837e-7465-4727-809a-0452370f82c1/.jpg',23000,1,'2024-10-08','2024-10-08','2024-10-20','full-fat-milk-1-liter',4,''),(4,'برنج ایرانی خاطره - 10کیلوگرم','<p>dddddd</p>','images/product/97183731-78a5-4551-9326-ed838642c735/.jpg',300000,1,'2024-10-09','2024-10-09','2024-10-10','khatere-iranian-rice-10kg',5,NULL),(5,'برنج طارم شمال - 10کیلوگرم','<p>eeeeeee</p>','images/product/ace04527-41f1-47ba-962e-1bda9ac718a8/.jpg',500000,1,'2024-10-09','2024-10-09','2024-10-19','north-tarem-rice-10kg',6,''),(6,'برنج هندی احمد - 9کیلوگرم','<p>ffffffff</p>','images/product/c2ac810a-5ae7-4834-8d10-b88078c538e1/.jpg',300000,1,'2024-10-09','2024-10-09','2024-10-20','ahmed-indian-rice-9kg',7,''),(7,'برنج هندی دانه بلند - 10کیلوگرم','<p>gggggggg</p>','images/product/cb53fdd5-ff20-4591-9ae9-d30c30dd3328/.jpg',400000,1,'2024-10-09','2024-10-09','2024-10-21','indian-long-grain-rice-10kg',8,''),(8,'برنج مژده - 9کیلوگرم','<p>hhhhhh</p>','images/product/b4a0d12c-f7fb-4eec-a184-894ac305a935/.jpg',300000,1,'2024-10-09','2024-10-09','2024-10-21','mojdeh-rice-9kg',9,''),(9,'برنج دل بهار - 10 کیلوگرم','<p>kkkk</p>','images/product/0f3e62fa-e568-4c86-a254-80120e450618/.jpg',600000,1,'2024-10-09','2024-10-09','2024-10-19','del-bahar-rice-10kg',10,''),(10,'برنج ستایش - 9کیلوگرم','<p>eeeeee</p>','images/product/700bb3a3-f054-41a0-bcd8-60b5d55ebfa4/.jpg',500000,1,'2024-10-09','2024-10-09','2024-10-20','setaysh-rice-10kg',11,''),(11,'دوغ صباح - 1.5لیتر','<p>eeeeeee</p>','images/product/f63e0531-78d3-46ff-b1bb-6c4819e39344/.jpg',15000,1,'2024-10-09','2024-10-09','2024-10-20','sabah-buttermilk-1-5litr',12,''),(12,'دوغ کاله - 1.5لیتر','<p>eeeeeeee</p>','images/product/11e9d483-1f32-4508-ac50-8a48c80d77e9/.jpg',30000,1,'2024-10-09','2024-10-09','2024-10-19','kaleh-buttermilk-1-5litr',13,''),(13,'دوغ بزرگ آبعلی','<p>eeeeeeeeee</p>','images/product/4dbb6497-5300-4f44-b143-9d07c95b4e13/.jpg',20000,1,'2024-10-09','2024-10-09','2024-10-21','abali-big',14,''),(14,'دوغ کوچیک آبعلی','<p>eeeeeeeeee</p>','images/product/3ed670ce-4250-4ed2-b3d8-a66992df3810/.jpg',12000,1,'2024-10-09','2024-10-09','2024-10-21','abali-small',14,''),(15,'ماست پگاه کم چرب - 900گرم','<p>eeeeeeeee</p>','images/product/8a7ea534-cffb-4b1e-8bca-608bc4cb3639/.jpg',14000,1,'2024-10-09','2024-10-09','2024-10-21','pegah-yogurt-99g',15,''),(16,'ماست پر چرب کاله - 1کیلوگرم','<p>eeeeeeeee</p>','images/product/cbf71935-52b4-4c09-bca3-68d1768c34ff/.jpg',12000,1,'2024-10-09','2024-10-09','2024-10-20','kaleh-yogurt-1kg',4,''),(17,'ماست کم چرب کاله - 600گرم','<p>eeeeeeeeee</p>','images/product/06b01c0c-228c-4262-bb86-8e7ce8c88605/.jpg',16000,1,'2024-10-09','2024-10-09','2024-10-21','kaleh-yogurt-littlefat-1kg',4,''),(18,'ماست سنتی کاله - 400گرم','<p>eeeeeeeee</p>','images/product/5cfddaf8-b0fa-4ba5-8c81-cd6ce3a09e69/.jpg',10000,1,'2024-10-09','2024-10-09','2024-10-20','kaleh-sonati-400g',4,'توضیح ماست سنتی کاله - 400گرم توضیح ماست سنتی کاله - 400گرم توضیح ماست سنتی کاله - 400گرم توضیح ماست سنتی کاله - 400گرم توضیح ماست سنتی کاله - 400گرم توضیح ماست سنتی کاله - 400گرم توضیح ماست سنتی کاله - 400گرم توضیح ماست سنتی کاله - 400گرم توضیح ماست سنتی کاله - 400گرم توضیح ماست سنتی کاله - 400گرم توضیح ماست سنتی کاله - 400گرم'),(19,'ماکارانی مانا 500گرم','<p>eeeeeeeeee</p>','images/product/be2b9463-35bc-4b01-81d3-7186ab3d5794/.jpg',20000,1,'2024-10-09','2024-10-09','2024-10-20','mana-macarani-500g',16,''),(20,'ماکاراتی پیچ پیجی تک مقدار 500 گرم','<p>eeeeeeeee</p>','images/product/d73d2dde-cf0a-435f-8d67-8137826b2da8/.jpg',28000,1,'2024-10-09','2024-10-09','2024-10-20','tak-macarani-500g',17,''),(21,'ماکارانی پیچ پیچی مانا مقدار 500گرم','<p>aaaaaaaaa</p>','images/product/9c79c334-366e-4be3-ba60-18d9e263b6ac.jpg',24000,1,'2024-10-09','2024-10-09','2024-10-20','mana-macarani-pich-500g',16,''),(22,'پنیر خامه ای ویلی مقدار 350گرم','<p>aaaaaaaaaa</p>','images/product/fc612774-76b0-42dd-982e-d917f147c7d7.jpg',30000,1,'2024-10-09','2024-10-09','2024-10-21','wili-cheese-350g',18,''),(23,'پنیر خامه ای کاله 300گرم','<p>aaaaaaaaa</p>','images/product/45f59ff6-fddd-4626-ace0-05db07ae5f2a.jpg',34000,1,'2024-10-09','2024-10-09','2024-10-20','kaleh-cheese-300g',4,''),(24,'نوشابه خانواده کوکاکولا - 1.5لیتر','<p>aaaaaaaa</p>','images/product/976c4be1-ff29-4d56-8eba-a28c46754fd3.jpg',33000,1,'2024-10-09','2024-10-09','2024-10-21','coca-cola-family-1-5litry',2,''),(25,'نوشابه قوطی کوکاکولا - 15 میلی لیتر','aaaaaaaaa','images/product/e5561ef0-1710-4764-ba7e-b5e765d6463a.jpg',15000,1,'2024-10-09','2024-10-09','2024-10-09','can-of-coca-cola-soft-drink-15-ml',2,NULL);
/*!40000 ALTER TABLE `products_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_product_product_group`
--

DROP TABLE IF EXISTS `products_product_product_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_product_product_group` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `productgroup_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_product_product_product_id_productgroup__bd54ad4e_uniq` (`product_id`,`productgroup_id`),
  KEY `products_product_pro_productgroup_id_7f52086a_fk_products_` (`productgroup_id`),
  CONSTRAINT `products_product_pro_product_id_ddcf34ff_fk_products_` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`),
  CONSTRAINT `products_product_pro_productgroup_id_7f52086a_fk_products_` FOREIGN KEY (`productgroup_id`) REFERENCES `products_productgroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_product_product_group`
--

LOCK TABLES `products_product_product_group` WRITE;
/*!40000 ALTER TABLE `products_product_product_group` DISABLE KEYS */;
INSERT INTO `products_product_product_group` VALUES (1,1,2),(2,2,6),(3,3,6),(4,4,11),(5,5,11),(6,6,11),(7,7,11),(8,8,11),(9,9,11),(10,10,11),(11,11,3),(12,12,3),(13,13,3),(14,14,3),(15,15,8),(16,16,8),(17,17,8),(18,18,8),(19,19,12),(20,20,12),(21,21,12),(22,22,7),(23,23,7),(24,24,2),(25,25,2);
/*!40000 ALTER TABLE `products_product_product_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_productfeature`
--

DROP TABLE IF EXISTS `products_productfeature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_productfeature` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `value` varchar(100) NOT NULL,
  `feature_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `filter_value_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_productfeat_feature_id_19139ad6_fk_products_` (`feature_id`),
  KEY `products_productfeat_product_id_b0721d47_fk_products_` (`product_id`),
  KEY `products_productfeat_filter_value_id_2074e371_fk_products_` (`filter_value_id`),
  CONSTRAINT `products_productfeat_feature_id_19139ad6_fk_products_` FOREIGN KEY (`feature_id`) REFERENCES `products_feature` (`id`),
  CONSTRAINT `products_productfeat_filter_value_id_2074e371_fk_products_` FOREIGN KEY (`filter_value_id`) REFERENCES `products_featurevalue` (`id`),
  CONSTRAINT `products_productfeat_product_id_b0721d47_fk_products_` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_productfeature`
--

LOCK TABLES `products_productfeature` WRITE;
/*!40000 ALTER TABLE `products_productfeature` DISABLE KEYS */;
INSERT INTO `products_productfeature` VALUES (12,'10 کیلوگرم',13,9,22),(13,'کیسه ای',14,9,23),(14,'1.5 لیتر',13,11,17),(15,'بطری',14,11,24),(16,'یک',18,11,36),(17,'گازدار',19,11,37),(18,'1.5 لیتر',13,12,17),(19,'بطری',14,12,24),(20,'بدون گاز',19,12,38),(21,'یک',18,12,36),(22,'9 کیلوگرم',13,10,39),(23,'کیسه ای',14,10,23),(24,'9 کیلوگرم',13,6,39),(25,'کیسه ای',14,6,23),(26,'1 لیتر',13,3,16),(27,'بطری',14,3,24),(28,'ویتامین D',17,3,40),(29,'1.5 لیتر',13,1,17),(30,'بطری',14,1,24),(31,'یک',18,1,36),(32,'300 گرم',13,23,41),(33,'قوطی',14,23,26),(34,'یک',18,23,36),(35,'ویتامین D',17,23,40),(36,'500 گرم',13,20,15),(37,'پیچی',16,20,29),(38,'کیسه ای',14,20,23),(39,'یک',18,20,36),(40,'سمولینا',15,20,28),(41,'500 گرم',13,21,15),(42,'پیچی',16,21,29),(43,'کیسه ای',14,21,23),(44,'یک',18,21,36),(45,'آرد گندم',15,21,33),(46,'500 گرم',13,19,15),(47,'رشته ای',16,19,30),(48,'کیسه ای',14,19,23),(49,'یک',18,19,36),(50,'سمولینا',15,19,28),(51,'1 کیلو گرم',13,16,19),(52,'پرچرب',20,16,45),(53,'ویتامین D',17,16,40),(54,'400 گرم',13,18,48),(55,'قوطی',14,18,26),(56,'ویتامین D',17,18,40),(57,'سنتی',20,18,44),(58,'9 کیلوگرم',13,8,39),(59,'کیسه ای',14,8,23),(60,'10 کیلوگرم',13,7,22),(61,'کیسه ای',14,7,23),(62,'1 لیتر',13,2,16),(63,'بطری',14,2,24),(64,'ویتامین D',17,2,40),(65,'کم چرب',20,2,46),(66,'350 گرم',13,22,52),(67,'قوطی',14,22,26),(68,'خامه ای',20,22,47),(69,'1.5 لیتر',13,13,17),(70,'بطری',14,13,24),(71,'گاز دار',20,13,37),(72,'500 گرم',13,14,15),(73,'بطری',14,14,24),(74,'گاز دار',20,14,37),(75,'900 گرم',13,15,53),(76,'کم چرب',20,15,46),(77,'ویتامین D',17,15,40),(78,'600 گرم',13,17,54),(79,'کم چرب',20,17,46),(80,'ویتامین D',17,17,40),(81,'1.5 لیتر',13,24,17),(82,'بطری',14,24,24),(83,'گاز دار',19,24,37);
/*!40000 ALTER TABLE `products_productfeature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_productgallery`
--

DROP TABLE IF EXISTS `products_productgallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_productgallery` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image_name` varchar(100) NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_productgall_product_id_da3ba7cd_fk_products_` (`product_id`),
  CONSTRAINT `products_productgall_product_id_da3ba7cd_fk_products_` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_productgallery`
--

LOCK TABLES `products_productgallery` WRITE;
/*!40000 ALTER TABLE `products_productgallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_productgallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_productgroup`
--

DROP TABLE IF EXISTS `products_productgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_productgroup` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_title` varchar(100) NOT NULL,
  `image_name` varchar(100) NOT NULL,
  `description` longtext,
  `is_active` tinyint(1) NOT NULL,
  `register_date` datetime(6) DEFAULT NULL,
  `published_date` datetime(6) NOT NULL,
  `update_date` datetime(6) NOT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `group_parent_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_productgroup_slug_be40fe80` (`slug`),
  KEY `products_productgrou_group_parent_id_bb49bc40_fk_products_` (`group_parent_id`),
  CONSTRAINT `products_productgrou_group_parent_id_bb49bc40_fk_products_` FOREIGN KEY (`group_parent_id`) REFERENCES `products_productgroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_productgroup`
--

LOCK TABLES `products_productgroup` WRITE;
/*!40000 ALTER TABLE `products_productgroup` DISABLE KEYS */;
INSERT INTO `products_productgroup` VALUES (1,'نوشیدنی ها','','',1,'2024-10-08 00:02:54.210016','2024-10-07 23:56:45.000000','2024-10-08 00:02:54.210016','drinks',NULL),(2,'نوشابه','','',1,'2024-10-08 00:02:54.210951','2024-10-07 23:56:45.000000','2024-10-08 00:02:54.210951','soda',1),(3,'دوغ','','',1,'2024-10-08 00:02:54.211946','2024-10-07 23:56:45.000000','2024-10-08 00:02:54.211946','buttermilk',1),(4,'آبمیوه','','',1,'2024-10-08 00:02:54.212941','2024-10-07 23:56:45.000000','2024-10-08 00:02:54.212941','fruit-juice',1),(5,'لبنیات','','',1,'2024-10-08 00:11:10.618426','2024-10-08 00:06:36.000000','2024-10-08 00:11:10.618426','dairy',NULL),(6,'شیر','','',1,'2024-10-08 00:11:10.619536','2024-10-08 00:06:36.000000','2024-10-08 00:11:10.619536','milk',5),(7,'پنیر','','',1,'2024-10-08 00:11:10.620532','2024-10-08 00:06:36.000000','2024-10-08 00:11:10.620532','cheese',5),(8,'ماست','','',1,'2024-10-08 00:11:10.621530','2024-10-08 00:06:36.000000','2024-10-08 00:11:10.621530','yogurt',5),(9,'نان و غلات','','',1,'2024-10-08 00:19:43.470481','2024-10-08 00:13:36.000000','2024-10-08 00:19:43.470481','bread-cereals',NULL),(10,'نان','','',1,'2024-10-08 00:19:43.472525','2024-10-08 00:13:36.000000','2024-10-08 00:19:43.472525','bread',9),(11,'برنج','','',1,'2024-10-08 00:19:43.473480','2024-10-08 00:13:36.000000','2024-10-09 14:21:50.315618','rice',9),(12,'ماکارانی','','',1,'2024-10-08 00:19:43.474482','2024-10-08 00:13:36.000000','2024-10-08 00:19:43.474482','macarani',9),(13,'محصولات پروتئینی','images/product_group/9217b95b-f090-400b-b546-b7a76bbb805b/.jpg','توضیحات محصولات پروتئینی توضیحات محصولات پروتئینی توضیحات محصولات پروتئینی توضیحات محصولات پروتئینی توضیحات محصولات پروتئینی توضیحات محصولات پروتئینی توضیحات محصولات پروتئینی توضیحات محصولات پروتئینی توضیحات محصولات پروتئینی',1,'2024-10-09 14:05:45.733293','2024-10-09 13:57:17.000000','2024-10-09 14:05:45.733293','protein-products',NULL),(14,'صبحانه','','توضیحات صبحانه توضیحات صبحانه توضیحات صبحانه توضیحات صبحانه توضیحات صبحانه توضیحات صبحانه توضیحات صبحانه توضیحات صبحانه توضیحات صبحانه توضیحات صبحانه توضیحات صبحانه توضیحات صبحانه توضیحات صبحانه توضیحات صبحانه توضیحات صبحانه',1,'2024-10-09 14:07:10.977403','2024-10-09 14:06:28.000000','2024-10-09 14:07:10.977403','breakfast',NULL);
/*!40000 ALTER TABLE `products_productgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouses_warehouse`
--

DROP TABLE IF EXISTS `warehouses_warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouses_warehouse` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL,
  `price` int DEFAULT NULL,
  `register_date` datetime(6) NOT NULL,
  `product_id` bigint NOT NULL,
  `user_registered_id` bigint NOT NULL,
  `warehouse_type_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `warehouses_warehouse_product_id_b6d60142_fk_products_product_id` (`product_id`),
  KEY `warehouses_warehouse_user_registered_id_41a9ee96_fk_accounts_` (`user_registered_id`),
  KEY `warehouses_warehouse_warehouse_type_id_d56d4ac8_fk_warehouse` (`warehouse_type_id`),
  CONSTRAINT `warehouses_warehouse_product_id_b6d60142_fk_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`),
  CONSTRAINT `warehouses_warehouse_user_registered_id_41a9ee96_fk_accounts_` FOREIGN KEY (`user_registered_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `warehouses_warehouse_warehouse_type_id_d56d4ac8_fk_warehouse` FOREIGN KEY (`warehouse_type_id`) REFERENCES `warehouses_warehousetype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouses_warehouse`
--

LOCK TABLES `warehouses_warehouse` WRITE;
/*!40000 ALTER TABLE `warehouses_warehouse` DISABLE KEYS */;
INSERT INTO `warehouses_warehouse` VALUES (14,30,NULL,'2024-10-11 16:32:27.806956',9,1,1),(15,20,NULL,'2024-10-11 16:33:55.559041',10,1,1),(16,25,NULL,'2024-10-11 16:34:28.769000',5,1,1),(17,30,NULL,'2024-10-11 16:34:48.089804',8,1,1),(18,5,NULL,'2024-10-11 16:35:02.336242',6,1,1),(19,6,NULL,'2024-10-11 16:35:51.922096',8,1,1),(20,16,NULL,'2024-10-11 16:43:47.411711',7,1,1),(21,5,NULL,'2024-10-20 10:50:10.445506',11,29,1),(22,10,NULL,'2024-10-20 10:50:04.728173',12,29,1),(23,3,NULL,'2024-10-20 10:48:56.813729',19,1,1),(24,2,NULL,'2024-10-20 10:49:20.368622',20,29,1),(25,5,NULL,'2024-10-20 10:50:31.334110',21,29,1);
/*!40000 ALTER TABLE `warehouses_warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouses_warehousetype`
--

DROP TABLE IF EXISTS `warehouses_warehousetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouses_warehousetype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `warehouse_type_title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouses_warehousetype`
--

LOCK TABLES `warehouses_warehousetype` WRITE;
/*!40000 ALTER TABLE `warehouses_warehousetype` DISABLE KEYS */;
INSERT INTO `warehouses_warehousetype` VALUES (1,'خرید'),(2,'فروش');
/*!40000 ALTER TABLE `warehouses_warehousetype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-21 23:13:49
