-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: 127.13.0.1    Database: c9
-- ------------------------------------------------------
-- Server version	5.1.71

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add client',8,'add_client'),(23,'Can change client',8,'change_client'),(24,'Can delete client',8,'delete_client'),(25,'Can add client crossshop',9,'add_clientcrossshop'),(26,'Can change client crossshop',9,'change_clientcrossshop'),(27,'Can delete client crossshop',9,'delete_clientcrossshop'),(28,'Can add client model momentum',10,'add_clientmodelmomentum'),(29,'Can change client model momentum',10,'change_clientmodelmomentum'),(30,'Can delete client model momentum',10,'delete_clientmodelmomentum'),(31,'Can add client hit list',11,'add_clienthitlist'),(32,'Can change client hit list',11,'change_clienthitlist'),(33,'Can delete client hit list',11,'delete_clienthitlist'),(34,'Can add client search keyword',12,'add_clientsearchkeyword'),(35,'Can change client search keyword',12,'change_clientsearchkeyword'),(36,'Can delete client search keyword',12,'delete_clientsearchkeyword'),(37,'Can add client new used split',13,'add_clientnewusedsplit'),(38,'Can change client new used split',13,'change_clientnewusedsplit'),(39,'Can delete client new used split',13,'delete_clientnewusedsplit');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$10000$95LJ8bTo4BuE$7Jz9l4gsLB+1SnXZRDlsfIf16yrxIVadGSYTO+kZwNw=','2014-03-11 20:41:57',1,'muttinthehut','','','JoeB615@gmail.com',1,1,'2014-02-02 16:50:53'),(2,'pbkdf2_sha256$10000$n9oH7zA2NaHG$0TO3uh8WWwlV9uLHyv2QjEEu89x8f/ba/vO1oz7dB+k=','2014-03-02 01:56:08',1,'jburns','Joe','Burns','jburns@dataium.com',0,1,'2014-02-18 14:51:37'),(3,'pbkdf2_sha256$10000$SVRV1lO26JBm$45T+i2eV6s6vx/NHRWaKHZyEoqjh1OMhnmXiM7qy12U=','2014-03-11 01:00:33',0,'bogususer','Bogus','Name','burns_jp@bellsouth.net',0,1,'2014-02-25 01:24:46'),(4,'pbkdf2_sha256$10000$DhvZNiWqQznC$rGe45kxG4oFUoZ/weGyJ5SC+lKLChGmlTLfTK1Nt3iA=','2014-02-25 01:27:39',0,'bogususer2','','','burns_jp@bellsouth.net',0,1,'2014-02-25 01:27:39');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2014-02-18 14:51:38',1,3,'2','jburns',1,''),(2,'2014-02-18 14:52:11',1,3,'2','jburns',2,'Changed password, first_name, last_name, email and is_superuser.'),(3,'2014-03-11 20:51:34',1,8,'4','Gastonia Nissan',1,''),(4,'2014-03-11 20:53:27',1,8,'5','Uftring Nissan',1,'');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'log entry','admin','logentry'),(8,'client','report','client'),(9,'client crossshop','report','clientcrossshop'),(10,'client model momentum','report','clientmodelmomentum'),(11,'client hit list','report','clienthitlist'),(12,'client search keyword','report','clientsearchkeyword'),(13,'client new used split','report','clientnewusedsplit');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('6m4jv8tgp9lr26yhxebgopqbeozbig8u','NDgzZTA0MmZmNmYwNmFjMDQ1NTkyNjAzMzViNGY4OWEwMzJmYWQxNDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQN1Lg==','2014-03-22 19:43:36'),('ryf3q598u8q2qfghlwws9ymnrxagu8h6','MGM4ZWZjZmYyMTk2YzgzNTFiODcwYzc5ZDJhNjczMmU3ZmY5OTQwNDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu','2014-02-17 13:55:43'),('kdgmxluahpfdp7rii2m61govmtiju6bg','MDNiZjcxNTBmYTc3NmVlNWRiOWNhNmJkMDlkM2RiODI0NzdjZDYwNTqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==','2014-03-25 20:41:57'),('2ilvbztow91ognnmswqlf5ap860vcmdc','NDgzZTA0MmZmNmYwNmFjMDQ1NTkyNjAzMzViNGY4OWEwMzJmYWQxNDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQN1Lg==','2014-03-16 20:52:11');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_client`
--

DROP TABLE IF EXISTS `report_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_client` (
  `clientname` varchar(128) NOT NULL,
  `clientemail` varchar(50) NOT NULL,
  `dataiumclientid` int(11) NOT NULL,
  `clientdma` varchar(50) NOT NULL,
  `clientcity` varchar(50) DEFAULT NULL,
  `clientstate` varchar(12) DEFAULT NULL,
  `clientwebsite` varchar(50) DEFAULT NULL,
  `clientshopimage` varchar(100) DEFAULT NULL,
  `clientdmmimage` varchar(100) DEFAULT NULL,
  `clienthitlistimage` varchar(100) DEFAULT NULL,
  `clientsocialimage` varchar(100) DEFAULT NULL,
  `clientutilityimage` varchar(100) DEFAULT NULL,
  `dataiumreportmonth` varchar(50) DEFAULT NULL,
  `clienthasoptedout` varchar(3) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_client`
--

LOCK TABLES `report_client` WRITE;
/*!40000 ALTER TABLE `report_client` DISABLE KEYS */;
INSERT INTO `report_client` VALUES ('Lia Infiniti','keggers@dataium.com',334,'Albany-Schenectady-Troy, NY','Latham','NY','liainfiniti.com','client_shops_1.png','client_dmm_1.png','client334hitlist.png','client_search_1.png','client334util.png','February 2014',NULL,1),('Clear Lake Nissan','jburns@dataium.com',708,'Houston, TX','League City','TX','clearlakenissan.com','client_shops_2.png','client_dmm_2.png','client708hitlist.png','client_search_2.png','client708util.png','February 2014',NULL,2),('Kelly Nissan','jburns@dataium.com',1060,'Chicago, IL','Oak Lawn','IL','kellynissanusa.com','client_shops_3.png','client_dmm_3.png','client1060hitlist.png','client_search_3.png','client1060util.png','February 2014',NULL,3),('Gastonia Nissan','jburns@dataium.com',18,'Charlotte, NC','Gastonia','NC','mygastonianissan.com','client_shops_4.png','client_dmm_4.png','client18hitlist.png','client_search_4.png','client18util.png','February 2014',NULL,4),('Uftring Nissan','jburns@dataium.com',307,'Peoria-Bloomington, IL','Peoria','IL','uftringnissan.com','client_shops_5.png','client_dmm_5.png','client307hitlist.png','client_search_5.png','client307util.png','February 2014',NULL,5),('Miller Auto Group','jburns@dataium.com',1762,'Washington, DC (Hagerstown, MD)','','','drivemiller.com','client_shops_6.png','client_dmm_6.png','client1762hitlist.png','client_search_6.png','client1762util.png','February 2014',NULL,6),('Howdy Honda','jburns@dataium.com',3908,'Austin, TX','Austin','TX','howdyhonda.com','client_shops_7.png','client_dmm_7.png','client3908hitlist.png','client_search_7.png','client3908util.png','February 2014',NULL,7),('Crown Ford','jburns@dataium.com',5363,'Nashville, TN','Nashville','TN','crownford.com','client_shops_8.png','client_dmm_8.png','client5363hitlist.png','client_search_8.png','client5363util.png','February 2014',NULL,8),('Bommarito Honda','jburns@dataium.com',7655,'St. Louis, MO','Hazelwood','MO','bommaritohonda.com','client_shops_9.png','client_dmm_9.png','client7655hitlist.png','client_search_9.png','client7655util.png','February 2014',NULL,9),('S & K Buick Gmc','jburns@dataium.com',8759,'Champaign and Springfield-Decatur, IL','Springfield','IL','skbuick.com','client_shops_10.png','client_dmm_10.png','client8759hitlist.png','client_search_10.png','client8759util.png','February 2014',NULL,10),('Ganley Honda','jburns@dataium.com',2010289,'Cleveland-Akron (Canton), OH','North Olmsted','OH','ganleyhonda.com','client_shops_11.png','client_dmm_11.png','client2010289hitlist.png','client_search_11.png','client2010289util.png','February 2014',NULL,11),('Vic Canever Chevrolet','jburns@dataium.com',2260250,'Flint-Saginaw-Bay City, MI','Fenton','MI','viccaneverchevy.com','client_shops_12.png','client_dmm_12.png','client2260250hitlist.png','client_search_12.png','client2260250util.png','February 2014',NULL,12),('New Smyrna Chevrolet','jburns@dataium.com',7510240,'Orlando-Daytona Beach-Melbourne, FL','New Smyrna','Florida','newsmyrnachevy.com','client_shops_13.png','client_dmm_13.png','client7510240hitlist.png','client_search_13.png','client7510240util.png','February 2014',NULL,13),('Springfield Acura','jburns@dataium.com',38010249,'New York, NY','Springfield','NJ','springfieldacura.com','client_shops_14.png','client_dmm_14.png','client38010249hitlist.png','client_search_14.png','client38010249util.png','February 2014',NULL,14),('Astro Lincoln','jburns@dataium.com',45760241,'Mobile, AL-Pensacola (Ft. Walton Beach), FL','Pensacola','FL','astroauto.com','client_shops_15.png','client_dmm_15.png','client45760241hitlist.png','client_search_15.png','client45760241util.png','February 2014',NULL,15),('Astro Ford','jburns@dataium.com',45760242,'Baton Rouge, LA','D\'Iberville','MS','astroford.com','client_shops_16.png','client_dmm_16.png','client45760242hitlist.png','client_search_16.png','client45760242util.png','February 2014',NULL,16);
/*!40000 ALTER TABLE `report_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_clientcrossshop`
--

DROP TABLE IF EXISTS `report_clientcrossshop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_clientcrossshop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `dataiumclientid` int(11) NOT NULL,
  `clientmodel` varchar(50) NOT NULL,
  `crossmodel` varchar(50) NOT NULL,
  `shops` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_clientcrossshop_4fea5d6a` (`client_id`)
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_clientcrossshop`
--

LOCK TABLES `report_clientcrossshop` WRITE;
/*!40000 ALTER TABLE `report_clientcrossshop` DISABLE KEYS */;
INSERT INTO `report_clientcrossshop` VALUES (1,5,307,'Nissan Altima','2012 Chevrolet Cruze',11),(2,5,307,'Nissan Altima','2009 Ford Taurus',7),(3,5,307,'Nissan Altima','2013 Chevrolet Malibu',7),(4,5,307,'Nissan Altima','2009 Chevrolet Cobalt',4),(5,5,307,'Nissan Altima','2011 Ford Edge',4),(6,5,307,'Nissan Altima','2012 Ford Focus',4),(7,1,334,'Infiniti G37','2012 Acura TSX',11),(8,1,334,'Infiniti G37','2013 Audi Q5',11),(9,1,334,'Infiniti G37','2011 Mercedes-Benz C-Class',8),(10,1,334,'Infiniti G37','2011 Lexus RX',7),(11,1,334,'Infiniti G37','2012 Audi A4',7),(12,1,334,'Infiniti G37','2012 Mercedes-Benz C-Class',7),(13,2,708,'Nissan Altima','2013 Toyota Camry',17),(14,2,708,'Nissan Altima','2012 Chrysler 200',16),(15,2,708,'Nissan Altima','2010 Toyota Matrix',10),(16,2,708,'Nissan Altima','2011 Chevrolet Camaro',10),(17,2,708,'Nissan Altima','2012 Chevrolet Malibu',9),(18,2,708,'Nissan Altima','2011 Toyota Camry',9),(19,2,708,'Nissan Altima','New Hyundai Sonata',9),(20,7,3908,'Honda CR-V','2012 Acura RDX',14),(21,7,3908,'Honda CR-V','2011 Mazda CX-9',8),(22,7,3908,'Honda CR-V','2013 Toyota Corolla',7),(23,7,3908,'Honda CR-V','2011 Lexus IS 250C',6),(24,7,3908,'Honda CR-V','2011 Acura TL',6),(25,7,3908,'Honda CR-V','2013 Volkswagen Tiguan',6),(26,8,5363,'Ford F150','2012 RAM 1500',10),(27,8,5363,'Ford F150','2010 Lincoln MKX',9),(28,8,5363,'Ford F150','2012 GMC Yukon',8),(29,8,5363,'Ford F150','2011 Chevrolet Malibu',3),(30,8,5363,'Ford F150','2011 RAM 2500',2),(31,8,5363,'Ford F150','2010 Chrysler 300',2),(32,8,5363,'Ford F150','2012 Mazda Mazda3',2),(33,8,5363,'Ford F150','2012 Nissan Titan',2),(34,8,5363,'Ford F150','New Nissan Frontier',2),(35,8,5363,'Ford F150','New Nissan Titan',2),(36,9,7655,'Honda Accord','2013 Nissan Altima',11),(37,9,7655,'Honda Accord','New Nissan Altima',10),(38,9,7655,'Honda Accord','2011 Toyota Camry',9),(39,9,7655,'Honda Accord','New Toyota Camry',9),(40,9,7655,'Honda Accord','2013 Toyota Camry',7),(41,9,7655,'Honda Accord','New Mazda CX-5',7),(42,9,7655,'Honda Accord','New Toyota Corolla',7),(43,10,8759,'Buick Enclave','New GMC Yukon',7),(44,10,8759,'Buick Enclave','New GMC Acadia',7),(45,10,8759,'Buick Enclave','2010 Cadillac SRX',4),(46,10,8759,'Buick Enclave','2013 Chevrolet Tahoe',4),(47,10,8759,'Buick Enclave','2009 Ford Edge',3),(48,10,8759,'Buick Enclave','2010 GMC Acadia',3),(49,10,8759,'Buick Enclave','2013 GMC Acadia',3),(50,10,8759,'Buick Enclave','2011 GMC Acadia',3),(51,10,8759,'Buick Enclave','2013 GMC Terrain',3),(52,10,8759,'Buick Enclave','New GMC Terrain',3),(53,10,8759,'Buick Enclave','2013 GMC Yukon',3),(54,10,8759,'Buick Enclave','2012 GMC Terrain',3),(55,11,2010289,'Honda Civic','2012 Nissan Versa',7),(56,11,2010289,'Honda Civic','2009 Toyota Venza',3),(57,11,2010289,'Honda Civic','2013 Chevrolet Impala',3),(58,11,2010289,'Honda Civic','2013 Dodge Journey',3),(59,11,2010289,'Honda Civic','2012 Chrysler 200',2),(60,11,2010289,'Honda Civic','2013 Chrysler 200',2),(61,11,2010289,'Honda Civic','New Nissan Altima',2),(62,11,2010289,'Honda Civic','2012 Nissan Sentra',2),(63,11,2010289,'Honda Civic','2012 MINI Cooper Clubman',2),(64,11,2010289,'Honda Civic','New Nissan Sentra',2),(65,12,2260250,'Chevrolet Impala','2009 GMC Envoy',30),(66,12,2260250,'Chevrolet Impala','2011 Buick Regal',23),(67,12,2260250,'Chevrolet Impala','2010 Ford Edge',16),(68,12,2260250,'Chevrolet Impala','2010 Cadillac CTS',14),(69,12,2260250,'Chevrolet Impala','2011 GMC Acadia',13),(70,13,7510240,'Chevrolet Camaro','2011 Buick Regal',2),(71,13,7510240,'Chevrolet Camaro','2013 Ford Focus',2),(72,13,7510240,'Chevrolet Camaro','2009 GMC Yukon XL',1),(73,13,7510240,'Chevrolet Camaro','2010 Dodge Avenger',1),(74,13,7510240,'Chevrolet Camaro','2012 Hyundai Veloster',1),(75,13,7510240,'Chevrolet Camaro','2012 Nissan Altima',1),(76,13,7510240,'Chevrolet Camaro','2009 Ford Focus',1),(77,13,7510240,'Chevrolet Camaro','2009 Toyota Camry',1),(78,13,7510240,'Chevrolet Camaro','2010 Nissan Altima',1),(79,13,7510240,'Chevrolet Camaro','2012 Toyota Camry',1),(80,13,7510240,'Chevrolet Camaro','2012 Dodge Caliber',1),(81,13,7510240,'Chevrolet Camaro','2012 Ford Mustang',1),(82,13,7510240,'Chevrolet Camaro','New Ford Fiesta',1),(83,13,7510240,'Chevrolet Camaro','New Ford Mustang',1),(84,13,7510240,'Chevrolet Camaro','2013 Lincoln MKS',1),(85,13,7510240,'Chevrolet Camaro','2013 Ford Mustang',1);
/*!40000 ALTER TABLE `report_clientcrossshop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_clienthitlist`
--

DROP TABLE IF EXISTS `report_clienthitlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_clienthitlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `dataiumclientid` int(11) NOT NULL,
  `stocknumber` varchar(20) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `shopperindex` varchar(20) DEFAULT NULL,
  `lastviewed` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `report_clienthitlist_4fea5d6a` (`client_id`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_clienthitlist`
--

LOCK TABLES `report_clienthitlist` WRITE;
/*!40000 ALTER TABLE `report_clienthitlist` DISABLE KEYS */;
INSERT INTO `report_clienthitlist` VALUES (1,6,1762,NULL,'Maserati Ghibli','1019',NULL),(2,6,1762,NULL,'RAM 1500','850',NULL),(3,6,1762,NULL,'Jeep Wrangler','700',NULL),(4,6,1762,NULL,'Maserati GranTurismo','671',NULL),(5,6,1762,NULL,'Toyota Highlander','602',NULL),(6,9,7655,NULL,'Honda Accord','726',NULL),(7,9,7655,NULL,'Honda CR-V','472',NULL),(8,9,7655,NULL,'GMC Acadia','426',NULL),(9,9,7655,NULL,'Audi A6','414',NULL),(10,9,7655,NULL,'Infiniti JX35','414',NULL),(11,5,307,NULL,'GMC Sierra 1500','364',NULL),(12,5,307,NULL,'Nissan Altima','344',NULL),(13,5,307,NULL,'Honda CR-V','309',NULL),(14,5,307,NULL,'Ford F150','267',NULL),(15,5,307,NULL,'Nissan Rogue','248',NULL),(16,13,7510240,NULL,'Toyota Camry','1537',NULL),(17,13,7510240,NULL,'Toyota Avalon','759',NULL),(18,13,7510240,NULL,'Ford F150','679',NULL),(19,13,7510240,NULL,'Kia Optima','678',NULL),(20,13,7510240,NULL,'Porsche 911','621',NULL),(21,14,38010249,NULL,'Infiniti FX35','580',NULL),(22,14,38010249,NULL,'BMW 328','488',NULL),(23,14,38010249,NULL,'Ford Explorer','467',NULL),(24,14,38010249,NULL,'Infiniti Q50','393',NULL),(25,14,38010249,NULL,'BMW X5','372',NULL),(26,14,38010249,NULL,'Subaru Outback','372',NULL),(27,8,5363,NULL,'Ford F150','901',NULL),(28,8,5363,NULL,'Nissan Altima','667',NULL),(29,8,5363,NULL,'Infiniti G37','546',NULL),(30,8,5363,NULL,'Jeep Wrangler','521',NULL),(31,8,5363,NULL,'Nissan Rogue','509',NULL),(32,15,45760241,NULL,'Hyundai Sonata','436',NULL),(33,15,45760241,NULL,'Toyota Highlander','375',NULL),(34,15,45760241,NULL,'Toyota Tacoma','254',NULL),(35,15,45760241,NULL,'Toyota Tundra','240',NULL),(36,15,45760241,NULL,'Honda Accord','225',NULL),(37,2,708,NULL,'Ford F150','4018',NULL),(38,2,708,NULL,'Hyundai Elantra','1371',NULL),(39,2,708,NULL,'Infiniti Q50','1058',NULL),(40,2,708,NULL,'Infiniti QX60','1052',NULL),(41,2,708,NULL,'Hyundai Sonata','1037',NULL),(42,12,2260250,NULL,'Chevrolet Silverado 1500','566',NULL),(43,12,2260250,NULL,'GMC Sierra 1500','534',NULL),(44,12,2260250,NULL,'Chevrolet Malibu','167',NULL),(45,12,2260250,NULL,'Chevrolet Equinox','147',NULL),(46,12,2260250,NULL,'GMC Terrain','138',NULL),(47,11,2010289,NULL,'Infiniti Q50','524',NULL),(48,11,2010289,NULL,'Infiniti QX60','366',NULL),(49,11,2010289,NULL,'Nissan Rogue','347',NULL),(50,11,2010289,NULL,'Nissan Altima','289',NULL),(51,11,2010289,NULL,'Infiniti QX80','185',NULL),(52,11,2010289,NULL,'Nissan Frontier','185',NULL),(53,3,1060,NULL,'Mitsubishi Outlander Sport','833',NULL),(54,3,1060,NULL,'Mitsubishi Outlander','770',NULL),(55,3,1060,NULL,'RAM 1500','647',NULL),(56,3,1060,NULL,'Hyundai Santa Fe','569',NULL),(57,3,1060,NULL,'Toyota Highlander','476',NULL),(58,4,18,NULL,'Hyundai Elantra','613',NULL),(59,4,18,NULL,'Nissan Altima','590',NULL),(60,4,18,NULL,'Hyundai Sonata','531',NULL),(61,4,18,NULL,'Ford F150','501',NULL),(62,4,18,NULL,'Volkswagen Passat','474',NULL),(63,10,8759,NULL,'Chevrolet Silverado 1500','406',NULL),(64,10,8759,NULL,'Chevrolet Equinox','199',NULL),(65,10,8759,NULL,'GMC Sierra 1500','197',NULL),(66,10,8759,NULL,'Nissan Rogue','146',NULL),(67,10,8759,NULL,'Chevrolet Impala','123',NULL),(68,16,45760242,NULL,'Nissan Altima','682',NULL),(69,16,45760242,NULL,'Infiniti QX60','646',NULL),(70,16,45760242,NULL,'Acura MDX','618',NULL),(71,16,45760242,NULL,'Nissan Rogue','577',NULL),(72,16,45760242,NULL,'Infiniti Q50','470',NULL),(73,7,3908,NULL,'Honda Accord','568',NULL),(74,7,3908,NULL,'Honda CR-V','494',NULL),(75,7,3908,NULL,'Honda Civic','335',NULL),(76,7,3908,NULL,'Honda Odyssey','253',NULL),(77,7,3908,NULL,'Nissan Rogue','246',NULL),(78,1,334,NULL,'Chevrolet Camaro','579',NULL),(79,1,334,NULL,'Chevrolet Equinox','478',NULL),(80,1,334,NULL,'Infiniti Q50','346',NULL),(81,1,334,NULL,'Chevrolet Cruze','345',NULL),(82,1,334,NULL,'Chevrolet Impala','275',NULL);
/*!40000 ALTER TABLE `report_clienthitlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_clientmodelmomentum`
--

DROP TABLE IF EXISTS `report_clientmodelmomentum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_clientmodelmomentum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `dataiumclientid` int(11) NOT NULL,
  `clientmodel` varchar(50) NOT NULL,
  `yearmonth` varchar(20) NOT NULL,
  `dmm` varchar(10) NOT NULL,
  `active` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `report_clientmodelmomentum_4fea5d6a` (`client_id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_clientmodelmomentum`
--

LOCK TABLES `report_clientmodelmomentum` WRITE;
/*!40000 ALTER TABLE `report_clientmodelmomentum` DISABLE KEYS */;
INSERT INTO `report_clientmodelmomentum` VALUES (1,1,334,'Infiniti G37','7','49.7','Y'),(2,1,334,'Infiniti G37','8','51.8','Y'),(3,1,334,'Infiniti G37','9','46.5','Y'),(4,1,334,'Infiniti G37','10','52.1','Y'),(5,2,708,'Nissan Altima','7','48.1','Y'),(6,2,708,'Nissan Altima','8','50.4','Y'),(7,2,708,'Nissan Altima','9','44.8','Y'),(8,2,708,'Nissan Altima','10','49.4','Y'),(9,5,307,'Nissan Altima','7','50.8','Y'),(10,5,307,'Nissan Altima','8','57.9','Y'),(11,5,307,'Nissan Altima','9','49.1','Y'),(12,5,307,'Nissan Altima','10','54.5','Y'),(13,7,3908,'Honda CR-V','7','48.4','Y'),(14,7,3908,'Honda CR-V','8','51.7','Y'),(15,7,3908,'Honda CR-V','9','45.9','Y'),(16,7,3908,'Honda CR-V','10','51.4','Y'),(17,8,5363,'Ford F150','7','47.5','Y'),(18,8,5363,'Ford F150','8','49.3','Y'),(19,8,5363,'Ford F150','9','45.0','Y'),(20,8,5363,'Ford F150','10','51.3','Y'),(21,9,7655,'Honda Accord','7','52.4','Y'),(22,9,7655,'Honda Accord','8','54.2','Y'),(23,9,7655,'Honda Accord','9','47.7','Y'),(24,9,7655,'Honda Accord','10','53.4','Y'),(25,10,8759,'Buick Enclave','7','52.3','Y'),(26,10,8759,'Buick Enclave','8','50.8','Y'),(27,10,8759,'Buick Enclave','9','47.3','Y'),(28,10,8759,'Buick Enclave','10','54.9','Y'),(29,11,2010289,'Honda Civic','7','52.1','Y'),(30,11,2010289,'Honda Civic','8','55.4','Y'),(31,11,2010289,'Honda Civic','9','49.5','Y'),(32,11,2010289,'Honda Civic','10','56.2','Y'),(33,12,2260250,'Chevrolet Impala','7','58.8','Y'),(34,12,2260250,'Chevrolet Impala','8','59.7','Y'),(35,12,2260250,'Chevrolet Impala','9','48.8','Y'),(36,12,2260250,'Chevrolet Impala','10','56.0','Y'),(37,13,7510240,'Chevrolet Camaro','7','45.1','Y'),(38,13,7510240,'Chevrolet Camaro','8','49.4','Y'),(39,13,7510240,'Chevrolet Camaro','9','47.4','Y'),(40,13,7510240,'Chevrolet Camaro','10','51.7','Y');
/*!40000 ALTER TABLE `report_clientmodelmomentum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_clientnewusedsplit`
--

DROP TABLE IF EXISTS `report_clientnewusedsplit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_clientnewusedsplit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `dataiumclientid` int(11) NOT NULL,
  `newpercent` varchar(10) NOT NULL,
  `usedpercent` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_clientnewusedsplit_4fea5d6a` (`client_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_clientnewusedsplit`
--

LOCK TABLES `report_clientnewusedsplit` WRITE;
/*!40000 ALTER TABLE `report_clientnewusedsplit` DISABLE KEYS */;
INSERT INTO `report_clientnewusedsplit` VALUES (1,11,2010289,'45%','55%'),(2,1,334,'30%','70%'),(3,2,708,'48%','52%'),(4,7,3908,'27%','73%'),(5,13,7510240,'46%','54%'),(6,9,7655,'41%','59%'),(7,5,307,'62%','38%'),(8,8,5363,'68%','32%'),(9,10,8759,'33%','67%'),(10,12,2260250,'22%','78%');
/*!40000 ALTER TABLE `report_clientnewusedsplit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_clientsearchkeyword`
--

DROP TABLE IF EXISTS `report_clientsearchkeyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_clientsearchkeyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `dataiumclientid` int(11) NOT NULL,
  `searchkeyword` varchar(100) NOT NULL,
  `searchkw_pageviews` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_clientsearchkeyword_4fea5d6a` (`client_id`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_clientsearchkeyword`
--

LOCK TABLES `report_clientsearchkeyword` WRITE;
/*!40000 ALTER TABLE `report_clientsearchkeyword` DISABLE KEYS */;
INSERT INTO `report_clientsearchkeyword` VALUES (1,5,307,'uftring nissan',87),(2,5,307,'nissan peoria il',33),(3,5,307,'http://www.uftringnissan.net/',13),(4,5,307,'nissan',7),(5,5,307,'uftring nissan peoria il',7),(6,1,334,'lia infiniti',151),(7,1,334,'infiniti',110),(8,1,334,'infiniti q50',34),(9,1,334,'infiniti albany ny',22),(10,1,334,'lia infinity',17),(11,2,708,'clear lake nissan',388),(12,2,708,'nissan',49),(13,2,708,'http://www.clearlakenissan.com/',45),(14,2,708,'nissan clear lake',45),(15,2,708,'clearlake nissan',37),(16,3,1060,'kelly nissan',216),(17,3,1060,'kelly nissan oak lawn',83),(18,3,1060,'nissan dealers in chicago',51),(19,3,1060,'nissan altima',29),(20,3,1060,'oak lawn nissan',20),(21,7,3908,'howdy honda',686),(22,7,3908,'honda austin',156),(23,7,3908,'http://www.howdyhonda.com/',82),(24,7,3908,'honda',62),(25,7,3908,'howdy honda austin',46),(26,8,5363,'crown ford',223),(27,8,5363,'crown ford nashville',109),(28,8,5363,'ford nashville',24),(29,8,5363,'crown ford nashville tn',22),(30,8,5363,'nashville ford dealers',21),(31,9,7655,'bommarito honda',514),(32,9,7655,'http://www.bommaritohonda.com/',43),(33,9,7655,'honda dealer st louis',33),(34,9,7655,'honda',22),(35,9,7655,'st louis honda',21),(36,10,8759,'s and k pontiac',25),(37,10,8759,'sk buick',18),(38,10,8759,'s and k buick',9),(39,10,8759,'used cars springfield il',9),(40,10,8759,'friendly chevrolet',9),(41,11,2010289,'ganley honda',293),(42,11,2010289,'ganley honda north olmsted',54),(43,11,2010289,'http://www.ganleyhonda.com/',31),(44,11,2010289,'honda north olmsted',18),(45,11,2010289,'north olmsted honda',13),(46,12,2260250,'vic canever chevrolet',323),(47,12,2260250,'vic canever',80),(48,12,2260250,'vic canever fenton',33),(49,12,2260250,'vic canever used cars fenton',33),(50,12,2260250,'vic canever chevrolet fenton',33),(51,13,7510240,'new smyrna chevrolet',53),(52,13,7510240,'new smyrna chevy',38),(53,13,7510240,'http://www.newsmyrnachevy.com/',20),(54,13,7510240,'new smyrna beach chevy',10),(55,13,7510240,'new smyrna beach chevrolet',9),(56,14,38010249,'springfield acura',73),(57,14,38010249,'http://www.springfieldacura.com',16),(58,14,38010249,'http://www.springfieldacura.com/',13),(59,14,38010249,'acura springfield nj',12),(60,14,38010249,'springfield acura nj',11),(61,15,45760241,'auto trader',2),(62,15,45760241,'used cars',2),(63,15,45760241,'astro lincoln mercury used cars',2),(64,15,45760241,'autotrader pensacola',1),(65,15,45760241,'astro pensacola fl',1),(66,16,45760242,'astro ford',12),(67,16,45760242,'astroford',3),(68,16,45760242,'astro ford diberville',3),(69,16,45760242,'astro ford of d\'iberville ms',3),(70,16,45760242,'astro ford diberville ms',1);
/*!40000 ALTER TABLE `report_clientsearchkeyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stg_report_clientcrossshop`
--

DROP TABLE IF EXISTS `stg_report_clientcrossshop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stg_report_clientcrossshop` (
  `id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `MakeModelID` int(11) DEFAULT NULL,
  `SiteVehicle` varchar(100) DEFAULT NULL,
  `DMA_CS_VehicleYear` varchar(50) DEFAULT NULL,
  `DMA_CS_VehicleMake` varchar(100) DEFAULT NULL,
  `DMA_CS_VehicleModel` varchar(100) DEFAULT NULL,
  `DMA_CS_UserCount` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stg_report_clientcrossshop`
--

LOCK TABLES `stg_report_clientcrossshop` WRITE;
/*!40000 ALTER TABLE `stg_report_clientcrossshop` DISABLE KEYS */;
INSERT INTO `stg_report_clientcrossshop` VALUES (0,307,146,2136,'Nissan Altima','2012','Chevrolet','Cruze',11,5),(1,307,146,2136,'Nissan Altima','2009','Ford','Taurus',7,5),(2,307,146,2136,'Nissan Altima','2013','Chevrolet','Malibu',7,5),(3,307,146,2136,'Nissan Altima','2009','Chevrolet','Cobalt',4,5),(4,307,146,2136,'Nissan Altima','2011','Ford','Edge',4,5),(5,307,146,2136,'Nissan Altima','2012','Ford','Focus',4,5),(6,334,2,1416,'Infiniti G37','2012','Acura','TSX',11,1),(7,334,2,1416,'Infiniti G37','2013','Audi','Q5',11,1),(8,334,2,1416,'Infiniti G37','2011','Mercedes-Benz','C-Class',8,1),(9,334,2,1416,'Infiniti G37','2011','Lexus','RX',7,1),(10,334,2,1416,'Infiniti G37','2012','Audi','A4',7,1),(11,334,2,1416,'Infiniti G37','2012','Mercedes-Benz','C-Class',7,1),(12,708,88,2136,'Nissan Altima','2013','Toyota','Camry',17,2),(13,708,88,2136,'Nissan Altima','2012','Chrysler','200',16,2),(14,708,88,2136,'Nissan Altima','2010','Toyota','Matrix',10,2),(15,708,88,2136,'Nissan Altima','2011','Chevrolet','Camaro',10,2),(16,708,88,2136,'Nissan Altima','2012','Chevrolet','Malibu',9,2),(17,708,88,2136,'Nissan Altima','2011','Toyota','Camry',9,2),(18,708,88,2136,'Nissan Altima','New','Hyundai','Sonata',9,2),(19,3908,11,1257,'Honda CR-V','2012','Acura','RDX',14,7),(20,3908,11,1257,'Honda CR-V','2011','Mazda','CX-9',8,7),(21,3908,11,1257,'Honda CR-V','2013','Toyota','Corolla',7,7),(22,3908,11,1257,'Honda CR-V','2011','Lexus','IS 250C',6,7),(23,3908,11,1257,'Honda CR-V','2011','Acura','TL',6,7),(24,3908,11,1257,'Honda CR-V','2013','Volkswagen','Tiguan',6,7),(25,5363,132,1058,'Ford F150','2012','RAM','1500',10,8),(26,5363,132,1058,'Ford F150','2010','Lincoln','MKX',9,8),(27,5363,132,1058,'Ford F150','2012','GMC','Yukon',8,8),(28,5363,132,1058,'Ford F150','2011','Chevrolet','Malibu',3,8),(29,5363,132,1058,'Ford F150','2011','RAM','2500',2,8),(30,5363,132,1058,'Ford F150','2010','Chrysler','300',2,8),(31,5363,132,1058,'Ford F150','2012','Mazda','Mazda3',2,8),(32,5363,132,1058,'Ford F150','2012','Nissan','Titan',2,8),(33,5363,132,1058,'Ford F150','New','Nissan','Frontier',2,8),(34,5363,132,1058,'Ford F150','New','Nissan','Titan',2,8),(35,7655,182,1254,'Honda Accord','2013','Nissan','Altima',11,9),(36,7655,182,1254,'Honda Accord','New','Nissan','Altima',10,9),(37,7655,182,1254,'Honda Accord','2011','Toyota','Camry',9,9),(38,7655,182,1254,'Honda Accord','New','Toyota','Camry',9,9),(39,7655,182,1254,'Honda Accord','2013','Toyota','Camry',7,9),(40,7655,182,1254,'Honda Accord','New','Mazda','CX-5',7,9),(41,7655,182,1254,'Honda Accord','New','Toyota','Corolla',7,9),(42,8759,31,337,'Buick Enclave','New','GMC','Yukon',7,10),(43,8759,31,337,'Buick Enclave','New','GMC','Acadia',7,10),(44,8759,31,337,'Buick Enclave','2010','Cadillac','SRX',4,10),(45,8759,31,337,'Buick Enclave','2013','Chevrolet','Tahoe',4,10),(46,8759,31,337,'Buick Enclave','2009','Ford','Edge',3,10),(47,8759,31,337,'Buick Enclave','2010','GMC','Acadia',3,10),(48,8759,31,337,'Buick Enclave','2013','GMC','Acadia',3,10),(49,8759,31,337,'Buick Enclave','2011','GMC','Acadia',3,10),(50,8759,31,337,'Buick Enclave','2013','GMC','Terrain',3,10),(51,8759,31,337,'Buick Enclave','New','GMC','Terrain',3,10),(52,8759,31,337,'Buick Enclave','2013','GMC','Yukon',3,10),(53,8759,31,337,'Buick Enclave','2012','GMC','Terrain',3,10),(54,2010289,42,1260,'Honda Civic','2012','Nissan','Versa',7,11),(55,2010289,42,1260,'Honda Civic','2009','Toyota','Venza',3,11),(56,2010289,42,1260,'Honda Civic','2013','Chevrolet','Impala',3,11),(57,2010289,42,1260,'Honda Civic','2013','Dodge','Journey',3,11),(58,2010289,42,1260,'Honda Civic','2012','Chrysler','200',2,11),(59,2010289,42,1260,'Honda Civic','2013','Chrysler','200',2,11),(60,2010289,42,1260,'Honda Civic','New','Nissan','Altima',2,11),(61,2010289,42,1260,'Honda Civic','2012','Nissan','Sentra',2,11),(62,2010289,42,1260,'Honda Civic','2012','MINI','Cooper Clubman',2,11),(63,2010289,42,1260,'Honda Civic','New','Nissan','Sentra',2,11),(64,2260250,66,553,'Chevrolet Impala','2009','GMC','Envoy',30,12),(65,2260250,66,553,'Chevrolet Impala','2011','Buick','Regal',23,12),(66,2260250,66,553,'Chevrolet Impala','2010','Ford','Edge',16,12),(67,2260250,66,553,'Chevrolet Impala','2010','Cadillac','CTS',14,12),(68,2260250,66,553,'Chevrolet Impala','2011','GMC','Acadia',13,12),(69,7510240,140,510,'Chevrolet Camaro','2011','Buick','Regal',2,13),(70,7510240,140,510,'Chevrolet Camaro','2013','Ford','Focus',2,13),(71,7510240,140,510,'Chevrolet Camaro','2009','GMC','Yukon XL',1,13),(72,7510240,140,510,'Chevrolet Camaro','2010','Dodge','Avenger',1,13),(73,7510240,140,510,'Chevrolet Camaro','2012','Hyundai','Veloster',1,13),(74,7510240,140,510,'Chevrolet Camaro','2012','Nissan','Altima',1,13),(75,7510240,140,510,'Chevrolet Camaro','2009','Ford','Focus',1,13),(76,7510240,140,510,'Chevrolet Camaro','2009','Toyota','Camry',1,13),(77,7510240,140,510,'Chevrolet Camaro','2010','Nissan','Altima',1,13),(78,7510240,140,510,'Chevrolet Camaro','2012','Toyota','Camry',1,13),(79,7510240,140,510,'Chevrolet Camaro','2012','Dodge','Caliber',1,13),(80,7510240,140,510,'Chevrolet Camaro','2012','Ford','Mustang',1,13),(81,7510240,140,510,'Chevrolet Camaro','New','Ford','Fiesta',1,13),(82,7510240,140,510,'Chevrolet Camaro','New','Ford','Mustang',1,13),(83,7510240,140,510,'Chevrolet Camaro','2013','Lincoln','MKS',1,13),(84,7510240,140,510,'Chevrolet Camaro','2013','Ford','Mustang',1,13);
/*!40000 ALTER TABLE `stg_report_clientcrossshop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stg_report_clienthitlist`
--

DROP TABLE IF EXISTS `stg_report_clienthitlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stg_report_clienthitlist` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DMA_ID` int(11) DEFAULT NULL,
  `DMA_DESC` varchar(100) DEFAULT NULL,
  `Vehicle_Make` varchar(100) DEFAULT NULL,
  `Vehicle_Model` varchar(100) DEFAULT NULL,
  `ASI` int(11) DEFAULT NULL,
  `Rank` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `dataiumclientid` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stg_report_clienthitlist`
--

LOCK TABLES `stg_report_clienthitlist` WRITE;
/*!40000 ALTER TABLE `stg_report_clienthitlist` DISABLE KEYS */;
INSERT INTO `stg_report_clienthitlist` VALUES (1,198,'Washington, DC (Hagerstown, MD)','Maserati','Ghibli',1019,1,6,1762),(2,198,'Washington, DC (Hagerstown, MD)','RAM','1500',850,2,6,1762),(3,198,'Washington, DC (Hagerstown, MD)','Jeep','Wrangler',700,3,6,1762),(4,198,'Washington, DC (Hagerstown, MD)','Maserati','GranTurismo',671,4,6,1762),(5,198,'Washington, DC (Hagerstown, MD)','Toyota','Highlander',602,5,6,1762),(6,182,'St. Louis, MO','Honda','Accord',726,1,9,7655),(7,182,'St. Louis, MO','Honda','CR-V',472,2,9,7655),(8,182,'St. Louis, MO','GMC','Acadia',426,3,9,7655),(9,182,'St. Louis, MO','Audi','A6',414,4,9,7655),(10,182,'St. Louis, MO','Infiniti','JX35',414,4,9,7655),(11,146,'Peoria-Bloomington, IL','GMC','Sierra 1500',364,1,5,307),(12,146,'Peoria-Bloomington, IL','Nissan','Altima',344,2,5,307),(13,146,'Peoria-Bloomington, IL','Honda','CR-V',309,3,5,307),(14,146,'Peoria-Bloomington, IL','Ford','F150',267,4,5,307),(15,146,'Peoria-Bloomington, IL','Nissan','Rogue',248,5,5,307),(16,140,'Orlando-Daytona Beach-Melbourne, FL','Toyota','Camry',1537,1,13,7510240),(17,140,'Orlando-Daytona Beach-Melbourne, FL','Toyota','Avalon',759,2,13,7510240),(18,140,'Orlando-Daytona Beach-Melbourne, FL','Ford','F150',679,3,13,7510240),(19,140,'Orlando-Daytona Beach-Melbourne, FL','Kia','Optima',678,4,13,7510240),(20,140,'Orlando-Daytona Beach-Melbourne, FL','Porsche','911',621,5,13,7510240),(21,134,'New York, NY','Infiniti','FX35',580,1,14,38010249),(22,134,'New York, NY','BMW','328',488,2,14,38010249),(23,134,'New York, NY','Ford','Explorer',467,3,14,38010249),(24,134,'New York, NY','Infiniti','Q50',393,4,14,38010249),(25,134,'New York, NY','BMW','X5',372,5,14,38010249),(26,134,'New York, NY','Subaru','Outback',372,5,14,38010249),(27,132,'Nashville, TN','Ford','F150',901,1,8,5363),(28,132,'Nashville, TN','Nissan','Altima',667,2,8,5363),(29,132,'Nashville, TN','Infiniti','G37',546,3,8,5363),(30,132,'Nashville, TN','Jeep','Wrangler',521,4,8,5363),(31,132,'Nashville, TN','Nissan','Rogue',509,5,8,5363),(32,127,'Mobile, AL-Pensacola (Ft. Walton Beach), FL','Hyundai','Sonata',436,1,15,45760241),(33,127,'Mobile, AL-Pensacola (Ft. Walton Beach), FL','Toyota','Highlander',375,2,15,45760241),(34,127,'Mobile, AL-Pensacola (Ft. Walton Beach), FL','Toyota','Tacoma',254,3,15,45760241),(35,127,'Mobile, AL-Pensacola (Ft. Walton Beach), FL','Toyota','Tundra',240,4,15,45760241),(36,127,'Mobile, AL-Pensacola (Ft. Walton Beach), FL','Honda','Accord',225,5,15,45760241),(37,88,'Houston, TX','Ford','F150',4018,1,2,708),(38,88,'Houston, TX','Hyundai','Elantra',1371,2,2,708),(39,88,'Houston, TX','Infiniti','Q50',1058,3,2,708),(40,88,'Houston, TX','Infiniti','QX60',1052,4,2,708),(41,88,'Houston, TX','Hyundai','Sonata',1037,5,2,708),(42,66,'Flint-Saginaw-Bay City, MI','Chevrolet','Silverado 1500',566,1,12,2260250),(43,66,'Flint-Saginaw-Bay City, MI','GMC','Sierra 1500',534,2,12,2260250),(44,66,'Flint-Saginaw-Bay City, MI','Chevrolet','Malibu',167,3,12,2260250),(45,66,'Flint-Saginaw-Bay City, MI','Chevrolet','Equinox',147,4,12,2260250),(46,66,'Flint-Saginaw-Bay City, MI','GMC','Terrain',138,5,12,2260250),(47,42,'Cleveland-Akron (Canton), OH','Infiniti','Q50',524,1,11,2010289),(48,42,'Cleveland-Akron (Canton), OH','Infiniti','QX60',366,2,11,2010289),(49,42,'Cleveland-Akron (Canton), OH','Nissan','Rogue',347,3,11,2010289),(50,42,'Cleveland-Akron (Canton), OH','Nissan','Altima',289,4,11,2010289),(51,42,'Cleveland-Akron (Canton), OH','Infiniti','QX80',185,5,11,2010289),(52,42,'Cleveland-Akron (Canton), OH','Nissan','Frontier',185,5,11,2010289),(53,38,'Chicago, IL','Mitsubishi','Outlander Sport',833,1,3,1060),(54,38,'Chicago, IL','Mitsubishi','Outlander',770,2,3,1060),(55,38,'Chicago, IL','RAM','1500',647,3,3,1060),(56,38,'Chicago, IL','Hyundai','Santa Fe',569,4,3,1060),(57,38,'Chicago, IL','Toyota','Highlander',476,5,3,1060),(58,34,'Charlotte, NC','Hyundai','Elantra',613,1,4,18),(59,34,'Charlotte, NC','Nissan','Altima',590,2,4,18),(60,34,'Charlotte, NC','Hyundai','Sonata',531,3,4,18),(61,34,'Charlotte, NC','Ford','F150',501,4,4,18),(62,34,'Charlotte, NC','Volkswagen','Passat',474,5,4,18),(63,31,'Champaign and Springfield-Decatur, IL','Chevrolet','Silverado 1500',406,1,10,8759),(64,31,'Champaign and Springfield-Decatur, IL','Chevrolet','Equinox',199,2,10,8759),(65,31,'Champaign and Springfield-Decatur, IL','GMC','Sierra 1500',197,3,10,8759),(66,31,'Champaign and Springfield-Decatur, IL','Nissan','Rogue',146,4,10,8759),(67,31,'Champaign and Springfield-Decatur, IL','Chevrolet','Impala',123,5,10,8759),(68,15,'Baton Rouge, LA','Nissan','Altima',682,1,16,45760242),(69,15,'Baton Rouge, LA','Infiniti','QX60',646,2,16,45760242),(70,15,'Baton Rouge, LA','Acura','MDX',618,3,16,45760242),(71,15,'Baton Rouge, LA','Nissan','Rogue',577,4,16,45760242),(72,15,'Baton Rouge, LA','Infiniti','Q50',470,5,16,45760242),(73,11,'Austin, TX','Honda','Accord',568,1,7,3908),(74,11,'Austin, TX','Honda','CR-V',494,2,7,3908),(75,11,'Austin, TX','Honda','Civic',335,3,7,3908),(76,11,'Austin, TX','Honda','Odyssey',253,4,7,3908),(77,11,'Austin, TX','Nissan','Rogue',246,5,7,3908),(78,2,'Albany-Schenectady-Troy, NY','Chevrolet','Camaro',579,1,1,334),(79,2,'Albany-Schenectady-Troy, NY','Chevrolet','Equinox',478,2,1,334),(80,2,'Albany-Schenectady-Troy, NY','Infiniti','Q50',346,3,1,334),(81,2,'Albany-Schenectady-Troy, NY','Chevrolet','Cruze',345,4,1,334),(82,2,'Albany-Schenectady-Troy, NY','Chevrolet','Impala',275,5,1,334);
/*!40000 ALTER TABLE `stg_report_clienthitlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stg_report_clientmodelmomentum`
--

DROP TABLE IF EXISTS `stg_report_clientmodelmomentum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stg_report_clientmodelmomentum` (
  `row_number` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `site` varchar(100) DEFAULT NULL,
  `week_of_year` int(11) DEFAULT NULL,
  `cal_year` int(11) DEFAULT NULL,
  `cal_month` int(11) DEFAULT NULL,
  `vehicle` varchar(100) DEFAULT NULL,
  `avgvisitspersite` double DEFAULT NULL,
  `rsi` double DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stg_report_clientmodelmomentum`
--

LOCK TABLES `stg_report_clientmodelmomentum` WRITE;
/*!40000 ALTER TABLE `stg_report_clientmodelmomentum` DISABLE KEYS */;
INSERT INTO `stg_report_clientmodelmomentum` VALUES (66102,307,'Uftring Nissan',7,2014,2,'Nissan Altima',47,50.83529,5),(66103,307,'Uftring Nissan',8,2014,2,'Nissan Altima',85,57.94903,5),(66104,307,'Uftring Nissan',9,2014,2,'Nissan Altima',63,53.15387,5),(66105,307,'Uftring Nissan',9,2014,3,'Nissan Altima',18,44.9589,5),(66106,307,'Uftring Nissan',10,2014,3,'Nissan Altima',75,54.52313,5),(65674,334,'Lia Infiniti',7,2014,2,'Infiniti G37',73,49.65182,1),(65675,334,'Lia Infiniti',8,2014,2,'Infiniti G37',87,51.75589,1),(65676,334,'Lia Infiniti',9,2014,2,'Infiniti G37',80,50.616882,1),(65677,334,'Lia Infiniti',9,2014,3,'Infiniti G37',22,42.30863,1),(65678,334,'Lia Infiniti',10,2014,3,'Infiniti G37',89,52.091354,1),(61719,708,'Clear Lake Nissan',7,2014,2,'Nissan Altima',196,48.127205,2),(61720,708,'Clear Lake Nissan',8,2014,2,'Nissan Altima',250,50.417427,2),(61721,708,'Clear Lake Nissan',9,2014,2,'Nissan Altima',177,47.372494,2),(61722,708,'Clear Lake Nissan',9,2014,3,'Nissan Altima',43,42.319965,2),(61723,708,'Clear Lake Nissan',10,2014,3,'Nissan Altima',207,49.42896,2),(34488,3908,'Howdy Honda',7,2014,2,'Honda CR-V',89,48.446224,7),(34489,3908,'Howdy Honda',8,2014,2,'Honda CR-V',122,51.701687,7),(34490,3908,'Howdy Honda',9,2014,2,'Honda CR-V',83,47.855587,7),(34491,3908,'Howdy Honda',9,2014,3,'Honda CR-V',39,43.888775,7),(34492,3908,'Howdy Honda',10,2014,3,'Honda CR-V',115,51.384735,7),(22418,5363,'Crown Ford',7,2014,2,'Ford F150',65,47.522587,8),(22419,5363,'Crown Ford',8,2014,2,'Ford F150',79,49.287395,8),(22420,5363,'Crown Ford',9,2014,2,'Ford F150',60,46.978348,8),(22421,5363,'Crown Ford',9,2014,3,'Ford F150',26,43.0882,8),(22422,5363,'Crown Ford',10,2014,3,'Ford F150',90,51.26841,8),(17300,7655,'Bommarito Honda',7,2014,2,'Honda Accord',102,52.44801,9),(17301,7655,'Bommarito Honda',8,2014,2,'Honda Accord',117,54.21691,9),(17302,7655,'Bommarito Honda',9,2014,2,'Honda Accord',98,51.598606,9),(17303,7655,'Bommarito Honda',9,2014,3,'Honda Accord',32,43.703217,9),(17304,7655,'Bommarito Honda',10,2014,3,'Honda Accord',115,53.367012,9),(15705,8759,'S & K Buick Gmc',7,2014,2,'Buick Enclave',22,52.340977,10),(15706,8759,'S & K Buick Gmc',8,2014,2,'Buick Enclave',19,50.812035,10),(15707,8759,'S & K Buick Gmc',9,2014,2,'Buick Enclave',18,50.284744,10),(15708,8759,'S & K Buick Gmc',9,2014,3,'Buick Enclave',6,44.33866,10),(15709,8759,'S & K Buick Gmc',10,2014,3,'Buick Enclave',28,54.873985,10),(10515,2010289,'Ganley Honda',7,2014,2,'Honda Civic',30,52.121532,11),(10516,2010289,'Ganley Honda',8,2014,2,'Honda Civic',43,55.43885,11),(10517,2010289,'Ganley Honda',9,2014,2,'Honda Civic',31,51.86648,11),(10518,2010289,'Ganley Honda',9,2014,3,'Honda Civic',14,47.223934,11),(10519,2010289,'Ganley Honda',10,2014,3,'Honda Civic',50,56.170807,11),(9428,2260250,'Vic Canever Chevrolet',7,2014,2,'Chevrolet Impala',85,58.77146,12),(9429,2260250,'Vic Canever Chevrolet',8,2014,2,'Chevrolet Impala',90,59.68382,12),(9430,2260250,'Vic Canever Chevrolet',9,2014,2,'Chevrolet Impala',63,52.878845,12),(9431,2260250,'Vic Canever Chevrolet',9,2014,3,'Chevrolet Impala',23,44.740257,12),(9432,2260250,'Vic Canever Chevrolet',10,2014,3,'Chevrolet Impala',85,56.035294,12),(8338,7510240,'New Smyrna Chevrolet',7,2014,2,'Chevrolet Camaro',7,45.089798,13),(8339,7510240,'New Smyrna Chevrolet',8,2014,2,'Chevrolet Camaro',18,49.417255,13),(8340,7510240,'New Smyrna Chevrolet',9,2014,2,'Chevrolet Camaro',14,47.937775,13),(8341,7510240,'New Smyrna Chevrolet',9,2014,3,'Chevrolet Camaro',11,46.80595,13),(8342,7510240,'New Smyrna Chevrolet',10,2014,3,'Chevrolet Camaro',23,51.71664,13);
/*!40000 ALTER TABLE `stg_report_clientmodelmomentum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stg_site_keyword`
--

DROP TABLE IF EXISTS `stg_site_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stg_site_keyword` (
  `idstg_site_keyword` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `rollup_search_keyword` varchar(100) DEFAULT NULL,
  `PV_Count` int(11) DEFAULT NULL,
  PRIMARY KEY (`idstg_site_keyword`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stg_site_keyword`
--

LOCK TABLES `stg_site_keyword` WRITE;
/*!40000 ALTER TABLE `stg_site_keyword` DISABLE KEYS */;
INSERT INTO `stg_site_keyword` VALUES (1,5,307,'uftring nissan',87),(2,5,307,'nissan peoria il',33),(3,5,307,'http://www.uftringnissan.net/',13),(4,5,307,'nissan',7),(5,5,307,'uftring nissan peoria il',7),(6,1,334,'lia infiniti',151),(7,1,334,'infiniti',110),(8,1,334,'infiniti q50',34),(9,1,334,'infiniti albany ny',22),(10,1,334,'lia infinity',17),(11,2,708,'clear lake nissan',388),(12,2,708,'nissan',49),(13,2,708,'http://www.clearlakenissan.com/',45),(14,2,708,'nissan clear lake',45),(15,2,708,'clearlake nissan',37),(16,3,1060,'kelly nissan',216),(17,3,1060,'kelly nissan oak lawn',83),(18,3,1060,'nissan dealers in chicago',51),(19,3,1060,'nissan altima',29),(20,3,1060,'oak lawn nissan',20),(21,7,3908,'howdy honda',686),(22,7,3908,'honda austin',156),(23,7,3908,'http://www.howdyhonda.com/',82),(24,7,3908,'honda',62),(25,7,3908,'howdy honda austin',46),(26,8,5363,'crown ford',223),(27,8,5363,'crown ford nashville',109),(28,8,5363,'ford nashville',24),(29,8,5363,'crown ford nashville tn',22),(30,8,5363,'nashville ford dealers',21),(31,9,7655,'bommarito honda',514),(32,9,7655,'http://www.bommaritohonda.com/',43),(33,9,7655,'honda dealer st louis',33),(34,9,7655,'honda',22),(35,9,7655,'st louis honda',21),(36,10,8759,'s and k pontiac',25),(37,10,8759,'sk buick',18),(38,10,8759,'s and k buick',9),(39,10,8759,'used cars springfield il',9),(40,10,8759,'friendly chevrolet',9),(41,11,2010289,'ganley honda',293),(42,11,2010289,'ganley honda north olmsted',54),(43,11,2010289,'http://www.ganleyhonda.com/',31),(44,11,2010289,'honda north olmsted',18),(45,11,2010289,'north olmsted honda',13),(46,12,2260250,'vic canever chevrolet',323),(47,12,2260250,'vic canever',80),(48,12,2260250,'vic canever fenton',33),(49,12,2260250,'vic canever used cars fenton',33),(50,12,2260250,'vic canever chevrolet fenton',33),(51,13,7510240,'new smyrna chevrolet',53),(52,13,7510240,'new smyrna chevy',38),(53,13,7510240,'http://www.newsmyrnachevy.com/',20),(54,13,7510240,'new smyrna beach chevy',10),(55,13,7510240,'new smyrna beach chevrolet',9),(56,14,38010249,'springfield acura',73),(57,14,38010249,'http://www.springfieldacura.com',16),(58,14,38010249,'http://www.springfieldacura.com/',13),(59,14,38010249,'acura springfield nj',12),(60,14,38010249,'springfield acura nj',11),(61,15,45760241,'auto trader',2),(62,15,45760241,'used cars',2),(63,15,45760241,'astro lincoln mercury used cars',2),(64,15,45760241,'autotrader pensacola',1),(65,15,45760241,'astro pensacola fl',1),(66,16,45760242,'astro ford',12),(67,16,45760242,'astroford',3),(68,16,45760242,'astro ford diberville',3),(69,16,45760242,'astro ford of d\'iberville ms',3),(70,16,45760242,'astro ford diberville ms',1);
/*!40000 ALTER TABLE `stg_site_keyword` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-03-21 14:02:43
