-- MySQL dump 10.13  Distrib 5.5.37, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: rodan
-- ------------------------------------------------------
-- Server version	5.5.37-0ubuntu0.12.04.1

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
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add client',8,'add_client'),(23,'Can change client',8,'change_client'),(24,'Can delete client',8,'delete_client'),(25,'Can add client crossshop',9,'add_clientcrossshop'),(26,'Can change client crossshop',9,'change_clientcrossshop'),(27,'Can delete client crossshop',9,'delete_clientcrossshop'),(28,'Can add client model momentum',10,'add_clientmodelmomentum'),(29,'Can change client model momentum',10,'change_clientmodelmomentum'),(30,'Can delete client model momentum',10,'delete_clientmodelmomentum'),(31,'Can add client hit list',11,'add_clienthitlist'),(32,'Can change client hit list',11,'change_clienthitlist'),(33,'Can delete client hit list',11,'delete_clienthitlist'),(34,'Can add client search keyword',12,'add_clientsearchkeyword'),(35,'Can change client search keyword',12,'change_clientsearchkeyword'),(36,'Can delete client search keyword',12,'delete_clientsearchkeyword'),(37,'Can add client new used split',13,'add_clientnewusedsplit'),(38,'Can change client new used split',13,'change_clientnewusedsplit'),(39,'Can delete client new used split',13,'delete_clientnewusedsplit'),(40,'Can add registration profile',14,'add_registrationprofile'),(41,'Can change registration profile',14,'change_registrationprofile'),(42,'Can delete registration profile',14,'delete_registrationprofile'),(51,'Can delete user profile',17,'delete_userprofile'),(50,'Can change user profile',17,'change_userprofile'),(49,'Can add user profile',17,'add_userprofile'),(46,'Can add migration history',16,'add_migrationhistory'),(47,'Can change migration history',16,'change_migrationhistory'),(48,'Can delete migration history',16,'delete_migrationhistory'),(55,'Can add dataium dma',19,'add_dataiumdma'),(56,'Can change dataium dma',19,'change_dataiumdma'),(57,'Can delete dataium dma',19,'delete_dataiumdma'),(58,'Can add dataium site traffic',20,'add_dataiumsitetraffic'),(59,'Can change dataium site traffic',20,'change_dataiumsitetraffic'),(60,'Can delete dataium site traffic',20,'delete_dataiumsitetraffic');
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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$eyYFL3EFiBaW$nlRod/gEqe2jOYwEe/v7L43fxjuxkhiAO/jFuwnBwus=','2014-05-09 20:09:59',1,'muttinthehut','','','JoeB615@gmail.com',1,1,'2014-02-02 16:50:53'),(2,'pbkdf2_sha256$12000$0KmJ6yjDGn74$FD2u921v0eFggOfYB9cWd8iobBefC/sy3rXdo7BvW9Y=','2014-03-02 01:56:08',1,'jburns','Joe','Burns','jburns@dataium.com',0,1,'2014-02-18 14:51:37'),(3,'pbkdf2_sha256$12000$2RsklnmZYWBa$jkZcqgh6Tq07Z8/2A9RUuJTT5PW421H+plB3KoauEV8=','2014-04-05 03:24:37',0,'bogususer','Bogus','Name','burns_jp@bellsouth.net',0,1,'2014-02-25 01:24:46'),(4,'pbkdf2_sha256$10000$DhvZNiWqQznC$rGe45kxG4oFUoZ/weGyJ5SC+lKLChGmlTLfTK1Nt3iA=','2014-02-25 01:27:39',0,'bogususer2','','','burns_jp@bellsouth.net',0,1,'2014-02-25 01:27:39'),(5,'pbkdf2_sha256$12000$Lpkjnzte3tjj$dLfTUyz5WfIxk1bBW0G+CIjPK3zhWKV6ko2wf/BYLjc=','2014-04-02 02:54:14',0,'mutt','','','jburns@dataium.com',0,0,'2014-04-02 02:54:14'),(6,'pbkdf2_sha256$12000$XHafgJxoxWIZ$PGNtJVGR1Y2v9JvO8+e36z0aulYORoHj+Dj0sAqiwLA=','2014-04-02 02:58:58',0,'mutt2','','','jburns@dataium.com',0,0,'2014-04-02 02:58:58'),(7,'pbkdf2_sha256$12000$NfZFeD5JreT8$uQ2ftfBIDqR7wmomb4Qur33DGW2PqFx0EYM1wtvktfE=','2014-04-02 03:12:49',0,'mutt3','','','jburns@dataium.com',0,1,'2014-04-02 03:06:12'),(8,'pbkdf2_sha256$12000$vX2NHD9KBMrw$J83u3Wcp3o1gUNqANPoMr/BtUsOTRGJMX+lD6wJhGko=','2014-04-02 03:15:12',0,'mutt4','','','jburns@dataium.com',0,1,'2014-04-02 03:14:13'),(9,'pbkdf2_sha256$12000$frJicdDDNZms$evdF6tToovh2V//PCiq+IBs8p1UWk1mwzH2rjZxkNX0=','2014-04-05 03:17:07',0,'mutt5','','','jburns@dataium.com',0,1,'2014-04-02 03:21:29'),(10,'pbkdf2_sha256$12000$oGry5ybJkEJH$8o/twxi2yrB7AMY2p9ssaYBPNJ2gGqCLzGU3tLyWzPs=','2014-04-04 13:41:51',0,'newprofileuser','','','jburns@dataium.com',0,1,'2014-04-04 13:41:51'),(11,'pbkdf2_sha256$12000$cZsFUrS8Zu6W$51/Up08fHZN3FCIpdrQ3xOHu/EUNAJMt6GQXAEcHGWw=','2014-04-04 13:58:00',0,'newprofileuser2','','','jburns@dataium.com',0,1,'2014-04-04 13:58:00'),(12,'pbkdf2_sha256$12000$F1HDlDVnmslt$oHZ74brWYYzy+0r4hjseU74gx0+jHwg53lro8/77eV0=','2014-04-04 14:38:55',0,'newprofileuser3','','','jburns@dataium.com',0,0,'2014-04-04 14:38:55'),(13,'pbkdf2_sha256$12000$f18VDngUcqNZ$/23kr/UnV+sfgBdSuBPhpcBkOqHgDv5osAy7kFFJabw=','2014-04-09 14:14:15',0,'newprofileuser4','','','jburns@dataium.com',0,1,'2014-04-04 22:40:05'),(14,'pbkdf2_sha256$12000$KAdPWtL7PeS6$B9U7qider5/qEIRMgzbfGzWDYdozZ9LjYy+zJzGnD6w=','2014-04-23 20:08:40',0,'newprofiletest1','','','jburns@dataium.com',0,1,'2014-04-09 15:01:25');
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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2014-02-18 14:51:38',1,3,'2','jburns',1,''),(2,'2014-02-18 14:52:11',1,3,'2','jburns',2,'Changed password, first_name, last_name, email and is_superuser.'),(3,'2014-03-11 20:51:34',1,8,'4','Gastonia Nissan',1,''),(4,'2014-03-11 20:53:27',1,8,'5','Uftring Nissan',1,''),(5,'2014-04-02 03:43:25',1,14,'2','Registration information for mutt2',2,'No fields changed.');
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
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'log entry','admin','logentry'),(8,'client','report','client'),(9,'client crossshop','report','clientcrossshop'),(10,'client model momentum','report','clientmodelmomentum'),(11,'client hit list','report','clienthitlist'),(12,'client search keyword','report','clientsearchkeyword'),(13,'client new used split','report','clientnewusedsplit'),(14,'registration profile','registration','registrationprofile'),(17,'user profile','report','userprofile'),(16,'migration history','south','migrationhistory'),(19,'dataium dma','report','dataiumdma'),(20,'dataium site traffic','report','dataiumsitetraffic');
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
INSERT INTO `django_session` VALUES ('6m4jv8tgp9lr26yhxebgopqbeozbig8u','NDgzZTA0MmZmNmYwNmFjMDQ1NTkyNjAzMzViNGY4OWEwMzJmYWQxNDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQN1Lg==','2014-03-22 19:43:36'),('ryf3q598u8q2qfghlwws9ymnrxagu8h6','MGM4ZWZjZmYyMTk2YzgzNTFiODcwYzc5ZDJhNjczMmU3ZmY5OTQwNDqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu','2014-02-17 13:55:43'),('kdgmxluahpfdp7rii2m61govmtiju6bg','MDNiZjcxNTBmYTc3NmVlNWRiOWNhNmJkMDlkM2RiODI0NzdjZDYwNTqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==','2014-03-25 20:41:57'),('2ilvbztow91ognnmswqlf5ap860vcmdc','NDgzZTA0MmZmNmYwNmFjMDQ1NTkyNjAzMzViNGY4OWEwMzJmYWQxNDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQN1Lg==','2014-03-16 20:52:11'),('8nneszg7lk7a5k65en2ymnxuz55zsxh2','YTkyOWZhMDg0NjkxZjhhMTI0MjliZWRlZGUxYTVhNzQzNDY2MjljNDp7fQ==','2014-04-16 03:43:57'),('xnf1jpybfwzx02ybmlhfcd5ezmhcwv6h','YTkyOWZhMDg0NjkxZjhhMTI0MjliZWRlZGUxYTVhNzQzNDY2MjljNDp7fQ==','2014-04-16 15:55:16'),('i5ku5vh94vph4975gq61w9hp7inlfvjm','N2U1YmNmZmRiNWE3ZWYwZDQzODMxMzI1MzNkZDM4MjVhZjc1MjJlNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-04-18 13:33:41'),('eq1w97skpsexpg04aewl2njyddg4dipy','NTNiNWYwYzQyMzgxMTFjNGFjNmQ0ZDM0ZWQ5NzllOTc4N2M5Zjk1YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTR9','2014-05-07 13:24:52'),('r8pximjck5p8xs7vj65xl3g64psbujdg','NTNiNWYwYzQyMzgxMTFjNGFjNmQ0ZDM0ZWQ5NzllOTc4N2M5Zjk1YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTR9','2014-05-07 20:08:40'),('tjj00p4p1wtni59hdn7x6l1ecsnpz0nu','N2U1YmNmZmRiNWE3ZWYwZDQzODMxMzI1MzNkZDM4MjVhZjc1MjJlNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-05-23 20:09:59');
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
-- Table structure for table `registration_registrationprofile`
--

DROP TABLE IF EXISTS `registration_registrationprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration_registrationprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `activation_key` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_registrationprofile`
--

LOCK TABLES `registration_registrationprofile` WRITE;
/*!40000 ALTER TABLE `registration_registrationprofile` DISABLE KEYS */;
INSERT INTO `registration_registrationprofile` VALUES (2,6,'57e4c65544b4304964b46ba49851e563abc0dcae'),(3,7,'ALREADY_ACTIVATED'),(4,8,'ALREADY_ACTIVATED'),(5,9,'ALREADY_ACTIVATED'),(6,12,'44c2afe8f97dd88d7dbbeb7cb375d7eb4ddd3c59'),(7,13,'ALREADY_ACTIVATED'),(8,14,'ALREADY_ACTIVATED');
/*!40000 ALTER TABLE `registration_registrationprofile` ENABLE KEYS */;
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
  `clientimagemonth` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_client`
--

LOCK TABLES `report_client` WRITE;
/*!40000 ALTER TABLE `report_client` DISABLE KEYS */;
INSERT INTO `report_client` VALUES ('Lia Infiniti','',334,'Albany-Schenectady-Troy, NY','Latham','NY','liainfiniti.com','client_shops_1_052014','client_dmm_1_052014','client_hitlist_1_052014','client_search_1_052014','client_util_1_052014','May 2014',NULL,1,'052014'),('Mark Miller Toyota','',39010241,'Salt Lake City, UT','Salt Lake City','UT','markmillertoyota.com','client_shops_25_052014','client_dmm_25_052014','client_hitlist_25_052014','client_search_25_052014','client_util_25_052014','May 2014',NULL,25,'052014'),('Kelly Nissan','',1060,'Chicago, IL','Oak Lawn','IL','kellynissan.com','client_shops_24_052014','client_dmm_24_052014','client_hitlist_24_052014','client_search_24_052014','client_util_24_052014','May 2014',NULL,24,'052014'),('Gastonia Nissan','',18,'Charlotte, NC','Gastonia','NC','mygastonianissan.com','client_shops_23_052014','client_dmm_23_052014','client_hitlist_23_052014','client_search_23_052014','client_util_23_052014','May 2014',NULL,23,'052014'),('Stone Mountain Volkswagen','',8732,'Atlanta, GA','Stone Mountain','GA','stonemountainvw.com','client_shops_22_052014','client_dmm_22_052014','client_hitlist_22_052014','client_search_22_052014','client_util_22_052014','May 2014',NULL,22,'052014'),('Howdy Honda','',3908,'Austin, TX','Austin','TX','howdyhonda.com','client_shops_7_052014','client_dmm_7_052014','client_hitlist_7_052014','client_search_7_052014','client_util_7_052014','May 2014',NULL,7,'052014'),('Priority Chevrolet','',46760240,'Norfolk-Portsmouth-Newport News, VA','Chesapeake','VA','prioritychevrolet.com','client_shops_21_052014','client_dmm_21_052014','client_hitlist_21_052014','client_search_21_052014','client_util_21_052014','May 2014',NULL,21,'052014'),('Bommarito Honda','',7655,'St. Louis, MO','Hazelwood','MO','bommaritohonda.com','client_shops_9_052014','client_dmm_9_052014','client_hitlist_9_052014','client_search_9_052014','client_util_9_052014','May 2014',NULL,9,'052014'),('S & K Buick Gmc','',8759,'Champaign and Springfield-Decatur, IL','Springfield','IL','skbuick.com','client_shops_10_052014','client_dmm_10_052014','client_hitlist_10_052014','client_search_10_052014','client_util_10_052014','May 2014',NULL,10,'052014'),('Ganley Honda','',2010289,'Cleveland-Akron (Canton), OH','North Olmsted','OH','ganleyhonda.com','client_shops_11_052014','client_dmm_11_052014','client_hitlist_11_052014','client_search_11_052014','client_util_11_052014','May 2014',NULL,11,'052014'),('Vic Canever Chevrolet','',2260250,'Flint-Saginaw-Bay City, MI','Fenton','MI','viccaneverchevy.com','client_shops_12_052014','client_dmm_12_052014','client_hitlist_12_052014','client_search_12_052014','client_util_12_052014','May 2014',NULL,12,'052014'),('Henderson Ford','',46510240,'New Orleans, LA','Waveland','MS','mrford.com','client_shops_20_052014','client_dmm_20_052014','client_hitlist_20_052014','client_search_20_052014','client_util_20_052014','May 2014',NULL,20,'052014'),('Gordon Chevrolet','',4598,'Tampa-St. Petersburg (Sarasota), FL','Tampa','FL','gordon-chevrolet.com','client_shops_19_052014','client_dmm_19_052014','client_hitlist_19_052014','client_search_19_052014','client_util_19_052014','May 2014',NULL,19,'052014'),('Bommarito Nissan','',1173,'St. Louis, MO','Hazelwood','MO','bommaritonissan.com','client_shops_18_052014','client_dmm_18_052014','client_hitlist_18_052014','client_search_18_052014','client_util_18_052014','May 2014',NULL,18,'052014'),('Astro Lincoln','',50010240,'Mobile, AL-Pensacola (Ft. Walton Beach), FL','Pensacola','FL','astrolincoln.net','client_shops_17_052014','client_dmm_17_052014','client_hitlist_17_052014','client_search_17_052014','client_util_17_052014','May 2014',NULL,17,'052014'),('Mercedes Benz of Baton Rouge','',53010273,'Baton Rouge, LA','Baton Rouge','LA','mbobr.com','client_shops_26_052014','client_dmm_26_052014','client_hitlist_26_052014','client_search_26_052014','client_util_26_052014','May 2014',NULL,26,'052014'),('Miller Auto Group','',1762,'Washington, DC (Hagerstown, MD)','Martinsburg','WV','applevalleytoyota.com','client_shops_27_052014','client_dmm_27_052014','client_hitlist_27_052014','client_search_27_052014','client_util_27_052014','May 2014',NULL,27,'052014'),('Northtown Automotive','',48510243,'Buffalo, NY','Amherst','NY','northtownauto.com','client_shops_28_052014','client_dmm_28_052014','client_hitlist_28_052014','client_search_28_052014','client_util_28_052014','May 2014',NULL,28,'052014'),('Uftring Nissan','',307,'Peoria-Bloomington, IL','Peoria','IL','uftringnissan.net','client_shops_29_052014','client_dmm_29_052014','client_hitlist_29_052014','client_search_29_052014','client_util_29_052014','May 2014',NULL,29,'052014'),('Bommarito Infiniti','',622,'St. Louis, MO','Ellisville','MO','bommaritoinfiniti.com','client_shops_34_052014','client_dmm_34_052014','client_hitlist_34_052014','client_search_34_052014','client_util_34_052014','May 2014',NULL,34,'052014'),('Clear Lake Nissan','',708,'Houston, TX','League City','TX','clearlakenissan.com','client_shops_30_052014','client_dmm_30_052014','client_hitlist_30_052014','client_search_30_052014','client_util_30_052014','May 2014',NULL,30,'052014'),('Coast Nissan','',55,'Santa Barbara-Santa Maria-San Luis Obispo, CA','San Luis Obispo','CA','coastnissan.com','client_shops_31_052014','client_dmm_31_052014','client_hitlist_31_052014','client_search_31_052014','client_util_31_052014','May 2014',NULL,31,'052014'),('Sandy Sansing Nissan','',1095,'Mobile, AL-Pensacola (Ft. Walton Beach), FL','Pensacola','FL','sandysansingnissan.com','client_shops_32_052014','client_dmm_32_052014','client_hitlist_32_052014','client_search_32_052014','client_util_32_052014','May 2014',NULL,32,'052014'),('Sid Dillon Buick GMC Cadillac','',40260249,'Omaha, NE','Fremont','NE','siddillonbuickgmc.com','client_shops_33_052014','client_dmm_33_052014','client_hitlist_33_052014','client_search_33_052014','client_util_33_052014','May 2014',NULL,33,'052014'),('Loeber Motors Mercedes Benz and Porsche','',45760244,'Chicago, IL','Lincolnwood','IL','loebermotors.com','client_shops_35_052014','client_dmm_35_052014','client_hitlist_35_052014','client_search_35_052014','client_util_35_052014','May 2014',NULL,35,'052014'),('Jack Key Family of Dealerships','',55010308,'El Paso, TX','Las Cruces','NM','jackkey.com','client_shops_36_052014','client_dmm_36_052014','client_hitlist_36_052014','client_search_36_052014','client_util_36_052014','May 2014',NULL,36,'052014'),('Apple Valley Toyota','',1763,'Washington, DC (Hagerstown, MD)','Martinsburg','WV','applevalleytoyota.com','client_shops_37_052014','client_dmm_37_052014','client_hitlist_052014','client_search_37_052014','client_util_37_052014','May 2014',NULL,37,'052014');
/*!40000 ALTER TABLE `report_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_client_backup_may2014`
--

DROP TABLE IF EXISTS `report_client_backup_may2014`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_client_backup_may2014` (
  `clientname` varchar(128) CHARACTER SET utf8 NOT NULL,
  `clientemail` varchar(50) CHARACTER SET utf8 NOT NULL,
  `dataiumclientid` int(11) NOT NULL,
  `clientdma` varchar(50) CHARACTER SET utf8 NOT NULL,
  `clientcity` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `clientstate` varchar(12) CHARACTER SET utf8 DEFAULT NULL,
  `clientwebsite` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `clientshopimage` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `clientdmmimage` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `clienthitlistimage` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `clientsocialimage` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `clientutilityimage` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `dataiumreportmonth` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `clienthasoptedout` varchar(3) CHARACTER SET utf8 DEFAULT NULL,
  `id` int(11) NOT NULL DEFAULT '0',
  `clientimagemonth` varchar(20) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_client_backup_may2014`
--

LOCK TABLES `report_client_backup_may2014` WRITE;
/*!40000 ALTER TABLE `report_client_backup_may2014` DISABLE KEYS */;
INSERT INTO `report_client_backup_may2014` VALUES ('Lia Infiniti','apasternak@liacars.com',334,'Albany-Schenectady-Troy, NY','Latham','NY','liainfiniti.com','client_shops_1_052014','client_dmm_1_052014','client_hitlist_1_052014','client_search_1_052014','client_util_1_052014','May 2014',NULL,1,'052014'),('Mark Miller Toyota','jimmyo@markmiller.com',39010241,'Salt Lake City, UT','Salt Lake City','UT','markmillertoyota.com','client_shops_25_052014','client_dmm_25_052014','client_hitlist_25_052014','client_search_25_052014','client_util_25_052014','May 2014',NULL,25,'052014'),('Kelly Nissan','vito@kellynissan.com',1060,'Chicago, IL','Oak Lawn','IL','kellynissan.com','client_shops_24_052014','client_dmm_24_052014','client_hitlist_24_052014','client_search_24_052014','client_util_24_052014','May 2014',NULL,24,'052014'),('Gastonia Nissan','jeff@jdtmarketinggroup.com',18,'Charlotte, NC','Gastonia','NC','mygastonianissan.com','client_shops_23_052014','client_dmm_23_052014','client_hitlist_23_052014','client_search_23_052014','client_util_23_052014','May 2014',NULL,23,'052014'),('Stone Mountain Volkswagen','nzuchegno@stonemountainvw.com',8732,'Atlanta, GA','Stone Mountain','GA','stonemountainvw.com','client_shops_22_052014','client_dmm_22_052014','client_hitlist_22_052014','client_search_22_052014','client_util_22_052014','May 2014',NULL,22,'052014'),('Howdy Honda','avillegas@howdyhonda.com',3908,'Austin, TX','Austin','TX','howdyhonda.com','client_shops_7_052014','client_dmm_7_052014','client_hitlist_7_052014','client_search_7_052014','client_util_7_052014','May 2014',NULL,7,'052014'),('Priority Chevrolet','lambr@priorityauto.com',46760240,'Norfolk-Portsmouth-Newport News, VA','Chesapeake','VA','prioritychevrolet.com','client_shops_21_052014','client_dmm_21_052014','client_hitlist_21_052014','client_search_21_052014','client_util_21_052014','May 2014',NULL,21,'052014'),('Bommarito Honda','abartoli@bommarito.net',7655,'St. Louis, MO','Hazelwood','MO','bommaritohonda.com','client_shops_9_052014','client_dmm_9_052014','client_hitlist_9_052014','client_search_9_052014','client_util_9_052014','May 2014',NULL,9,'052014'),('S & K Buick Gmc','clay@skbuick.com',8759,'Champaign and Springfield-Decatur, IL','Springfield','IL','skbuick.com','client_shops_10_052014','client_dmm_10_052014','client_hitlist_10_052014','client_search_10_052014','client_util_10_052014','May 2014',NULL,10,'052014'),('Ganley Honda','msheppard@ganleyauto.com',2010289,'Cleveland-Akron (Canton), OH','North Olmsted','OH','ganleyhonda.com','client_shops_11_052014','client_dmm_11_052014','client_hitlist_11_052014','client_search_11_052014','client_util_11_052014','May 2014',NULL,11,'052014'),('Vic Canever Chevrolet','viccaneverchevy@gmail.com',2260250,'Flint-Saginaw-Bay City, MI','Fenton','MI','viccaneverchevy.com','client_shops_12_052014','client_dmm_12_052014','client_hitlist_12_052014','client_search_12_052014','client_util_12_052014','May 2014',NULL,12,'052014'),('Henderson Ford','',46510240,'New Orleans, LA','Waveland','MS','mrford.com','client_shops_20_052014','client_dmm_20_052014','client_hitlist_20_052014','client_search_20_052014','client_util_20_052014','May 2014',NULL,20,'052014'),('Gordon Chevrolet','bruenger@gordon-chevrolet.com',4598,'Tampa-St. Petersburg (Sarasota), FL','Tampa','FL','gordon-chevrolet.com','client_shops_19_052014','client_dmm_19_052014','client_hitlist_19_052014','client_search_19_052014','client_util_19_052014','May 2014',NULL,19,'052014'),('Bommarito Nissan','abartoli@bommarito.net',1173,'St. Louis, MO','Hazelwood','MO','bommaritonissan.com','client_shops_18_052014','client_dmm_18_052014','client_hitlist_18_052014','client_search_18_052014','client_util_18_052014','May 2014',NULL,18,'052014'),('Astro Lincoln','',50010240,'Mobile, AL-Pensacola (Ft. Walton Beach), FL','Pensacola','FL','astrolincoln.net','client_shops_17_052014','client_dmm_17_052014','client_hitlist_17_052014','client_search_17_052014','client_util_17_052014','May 2014',NULL,17,'052014'),('Mercedes Benz of Baton Rouge','',53010273,'Baton Rouge, LA','Baton Rouge','LA','mbobr.com','client_shops_26_052014','client_dmm_26_052014','client_hitlist_26_052014','client_search_26_052014','client_util_26_052014','May 2014',NULL,26,'052014'),('Miller Auto Group','',1762,'Washington, DC (Hagerstown, MD)','Martinsburg','WV','applevalleytoyota.com','client_shops_27_052014','client_dmm_27_052014','client_hitlist_27_052014','client_search_27_052014','client_util_27_052014','May 2014',NULL,27,'052014'),('Northtown Automotive','r.shahin@northtownauto.com',48510243,'Buffalo, NY','Amherst','NY','northtownauto.com','client_shops_28_052014','client_dmm_28_052014','client_hitlist_28_052014','client_search_28_052014','client_util_28_052014','May 2014',NULL,28,'052014'),('Uftring Nissan','lettieschmitt@uftringnissan.com',307,'Peoria-Bloomington, IL','Peoria','IL','uftringnissan.net','client_shops_29_052014','client_dmm_29_052014','client_hitlist_29_052014','client_search_29_052014','client_util_29_052014','May 2014',NULL,29,'052014'),('Bommarito Infiniti','jburns@dataium.com',622,'St. Louis, MO','Ellisville','MO','bommaritoinfiniti.com','client_shops_34_052014','client_dmm_34_052014','client_hitlist_34_052014','client_search_34_052014','client_util_34_052014','May 2014',NULL,34,'052014'),('Clear Lake Nissan','shouser@theamgroup.net',708,'Houston, TX','League City','TX','clearlakenissan.com','client_shops_30_052014','client_dmm_30_052014','client_hitlist_30_052014','client_search_30_052014','client_util_30_052014','May 2014',NULL,30,'052014'),('Coast Nissan','lsmith@coast-bmw.com',55,'Santa Barbara-Santa Maria-San Luis Obispo, CA','San Luis Obispo','CA','coastnissan.com','client_shops_31_052014','client_dmm_31_052014','client_hitlist_31_052014','client_search_31_052014','client_util_31_052014','May 2014',NULL,31,'052014'),('Sandy Sansing Nissan','slohbeck@sandysansing.com,dave@dealercontrols.com',1095,'Mobile, AL-Pensacola (Ft. Walton Beach), FL','Pensacola','FL','sandysansingnissan.com','client_shops_32_052014','client_dmm_32_052014','client_hitlist_32_052014','client_search_32_052014','client_util_32_052014','May 2014',NULL,32,'052014'),('Sid Dillon Buick GMC Cadillac','jbaye@siddillon.com',40260249,'Omaha, NE','Fremont','NE','siddillonbuickgmc.com','client_shops_33_052014','client_dmm_33_052014','client_hitlist_33_052014','client_search_33_052014','client_util_33_052014','May 2014',NULL,33,'052014'),('Loeber Motors Mercedes Benz and Porsche','jburns@dataium.com',45760244,'Chicago, IL','Lincolnwood','IL','loebermotors.com','client_shops_35_052014','client_dmm_35_052014','client_hitlist_35_052014','client_search_35_052014','client_util_35_052014','May 2014',NULL,35,'052014'),('Jack Key Family of Dealerships','jburns@dataium.com',55010308,'El Paso, TX','Las Cruces','NM','jackkey.com','client_shops_36_052014','client_dmm_36_052014','client_hitlist_36_052014','client_search_36_052014','client_util_36_052014','May 2014',NULL,36,'052014'),('Apple Valley Toyota','jgillions@drivemiller.com',1763,'Washington, DC (Hagerstown, MD)','Martinsburg','WV','applevalleytoyota.com','client_shops_37_052014','client_dmm_37_052014','client_hitlist_052014','client_search_37_052014','client_util_37_052014','May 2014',NULL,37,'052014');
/*!40000 ALTER TABLE `report_client_backup_may2014` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=160 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_clientcrossshop`
--

LOCK TABLES `report_clientcrossshop` WRITE;
/*!40000 ALTER TABLE `report_clientcrossshop` DISABLE KEYS */;
INSERT INTO `report_clientcrossshop` VALUES (1,1,334,'Infiniti G37','2011 BMW 3 Series',21),(2,1,334,'Infiniti G37','2011 Mercedes-Benz E-Class',13),(3,1,334,'Infiniti G37','2011 Acura TSX',13),(4,1,334,'Infiniti G37','2013 BMW 3 Series',13),(5,1,334,'Infiniti G37','2012 Mercedes-Benz C-Class',12),(6,7,3908,'Honda Accord','2011 Acura TSX',21),(7,7,3908,'Honda Accord','2011 Toyota Camry',15),(8,7,3908,'Honda Accord','2009 Nissan Altima',13),(9,7,3908,'Honda Accord','2013 Hyundai Accent',13),(10,7,3908,'Honda Accord','2013 Mazda Mazda3',12),(11,9,7655,'Honda Accord','New Nissan Altima',16),(12,9,7655,'Honda Accord','2012 Toyota Camry',9),(13,9,7655,'Honda Accord','2011 Toyota Camry',7),(14,9,7655,'Honda Accord','2013 Nissan Altima',6),(15,9,7655,'Honda Accord','New Toyota Camry',6),(16,10,8759,'GMC Sierra','2011 Toyota 4Runner',11),(17,10,8759,'GMC Sierra','2011 Buick Enclave',10),(18,10,8759,'GMC Sierra','2011 Acura MDX',10),(19,10,8759,'GMC Sierra','2010 Chevrolet Tahoe',10),(20,10,8759,'GMC Sierra','2009 Pontiac Vibe',9),(21,10,8759,'GMC Sierra','2009 Chevrolet Impala',9),(22,10,8759,'GMC Sierra','2012 Ford Edge',9),(23,10,8759,'GMC Sierra','2013 Chevrolet Tahoe',9),(24,10,8759,'GMC Sierra','2010 Toyota Tacoma',9),(25,10,8759,'GMC Sierra','2014 Buick LaCrosse',9),(26,10,8759,'GMC Sierra','2010 Cadillac Escalade',9),(27,11,2010289,'Honda Accord','2012 Nissan Altima',12),(28,11,2010289,'Honda Accord','2013 Dodge Avenger',11),(29,11,2010289,'Honda Accord','2011 Subaru Legacy',10),(30,11,2010289,'Honda Accord','2011 Toyota Camry',8),(31,11,2010289,'Honda Accord','2013 Fiat 500',7),(32,11,2010289,'Honda Accord','2010 Volkswagen Jetta',7),(33,11,2010289,'Honda Accord','2011 Nissan Altima',7),(34,11,2010289,'Honda Accord','2013 Chrysler 200',7),(35,11,2010289,'Honda Accord','2012 Mitsubishi Galant',7),(36,12,2260250,'Chevrolet Silverado 1500','2011 GMC Sierra 2500',28),(37,12,2260250,'Chevrolet Silverado 1500','2011 GMC Sierra 1500',27),(38,12,2260250,'Chevrolet Silverado 1500','2011 Buick LaCrosse',27),(39,12,2260250,'Chevrolet Silverado 1500','2014 GMC Sierra 1500',25),(40,12,2260250,'Chevrolet Silverado 1500','2012 GMC Acadia',15),(41,12,2260250,'Chevrolet Silverado 1500','2010 Dodge Journey',15),(42,17,50010240,'Lincoln MKZ','2011 Toyota Prius',2),(43,17,50010240,'Lincoln MKZ','2011 Ford Fiesta',1),(44,17,50010240,'Lincoln MKZ','2011 Ford Escape',1),(45,17,50010240,'Lincoln MKZ','2012 Lexus IS 250',1),(46,17,50010240,'Lincoln MKZ','New Nissan Altima',1),(47,17,50010240,'Lincoln MKZ','2010 Honda Odyssey',1),(48,17,50010240,'Lincoln MKZ','2010 Mazda CX-7',1),(49,17,50010240,'Lincoln MKZ','2010 Toyota Prius',1),(50,18,1173,'Nissan Altima','2013 Honda Civic',5),(51,18,1173,'Nissan Altima','New Honda Civic',5),(52,18,1173,'Nissan Altima','New Honda Accord',5),(53,18,1173,'Nissan Altima','New Buick Regal',4),(54,18,1173,'Nissan Altima','2012 Toyota Camry',4),(55,19,4598,'Chevrolet Malibu','2013 Dodge Dart',17),(56,19,4598,'Chevrolet Malibu','2012 Chrysler 200',17),(57,19,4598,'Chevrolet Silverado 1500','2013 Dodge Dart',16),(58,19,4598,'Chevrolet Malibu','2010 Ford Focus',13),(59,19,4598,'Chevrolet Silverado 1500','2012 Chrysler 200',13),(60,19,4598,'Chevrolet Malibu','2013 Nissan Altima',13),(61,19,4598,'Chevrolet Malibu','2010 Dodge Caliber',13),(62,19,4598,'Chevrolet Silverado 1500','2011 GMC Sierra 1500',12),(63,19,4598,'Chevrolet Silverado 1500','2013 Nissan Altima',10),(64,19,4598,'Chevrolet Silverado 1500','2011 GMC Terrain',10),(65,21,46760240,'Chevrolet Silverado 1500','2012 GMC Sierra 1500',26),(66,21,46760240,'Chevrolet Silverado 1500','2013 Ford F-150',22),(67,21,46760240,'Chevrolet Silverado 1500','2013 GMC Terrain',20),(68,21,46760240,'Chevrolet Silverado 1500','2011 GMC Sierra 1500',16),(69,21,46760240,'Chevrolet Silverado 1500','2012 RAM 1500',15),(70,21,46760240,'Chevrolet Silverado 1500','2012 Toyota Tacoma',15),(71,22,8732,'Volkswagen Passat','2013 Audi A8',4),(72,22,8732,'Volkswagen Passat','2011 Audi A5',4),(73,22,8732,'Volkswagen Passat','New Nissan Altima',3),(74,22,8732,'Volkswagen Passat','2009 Saturn Outlook',3),(75,22,8732,'Volkswagen Passat','2010 Chevrolet Tahoe',2),(76,22,8732,'Volkswagen Passat','2013 Ford Explorer',2),(77,22,8732,'Volkswagen Passat','2012 Honda Accord',2),(78,22,8732,'Volkswagen Passat','2012 Chevrolet Equinox',2),(79,22,8732,'Volkswagen Passat','2011 Acura MDX',2),(80,23,18,'Nissan Altima','2013 Kia Optima',12),(81,23,18,'Nissan Altima','2012 Honda Accord',12),(82,23,18,'Nissan Altima','2013 Hyundai Elantra',10),(83,23,18,'Nissan Altima','2011 Toyota Camry',9),(84,24,1060,'Nissan Altima','2012 Toyota Yaris',12),(85,24,1060,'Nissan Altima','2013 Hyundai Accent',12),(86,24,1060,'Nissan Altima','2013 Mazda Mazda2',9),(87,24,1060,'Nissan Altima','2012 Mazda Mazda2',9),(88,24,1060,'Nissan Altima','2010 Hyundai Sonata',8),(89,25,39010241,'Toyota Tacoma','2010 Chevrolet Silverado',21),(90,25,39010241,'Toyota Tacoma','2013 Nissan Altima',12),(91,25,39010241,'Toyota Tacoma','2013 Chevrolet Cruze',11),(92,25,39010241,'Toyota Tacoma','2010 Hyundai Elantra',10),(93,25,39010241,'Toyota Tacoma','2011 Chevrolet Silverado',10),(94,25,39010241,'Toyota Tacoma','2013 Ford Focus',10),(95,28,48510243,'Porsche 911 GT3','2013 BMW M3',7),(96,28,48510243,'Porsche 911 GT3','2012 Scion tC',5),(97,28,48510243,'Porsche 911 GT3','2010 Mazda Mazda3',5),(98,28,48510243,'Porsche 911 GT3','2014 Mazda Mazda6',5),(99,28,48510243,'Porsche 911 GT3','2013 Lexus LS 460',5),(100,29,307,'Nissan Altima','2012 Chevrolet Cruze',20),(101,29,307,'Nissan Altima','2012 Volkswagen Passat',18),(102,29,307,'Nissan Altima','2011 Ford Fiesta',17),(103,29,307,'Nissan Altima','2009 Lincoln MKS',15),(104,29,307,'Nissan Altima','2009 Honda CR-V',15),(105,29,307,'Nissan Altima','2012 Jeep Compass',15),(106,30,708,'Nissan Altima','2010 Ford Fusion',15),(107,30,708,'Nissan Altima','2010 Toyota Corolla',13),(108,30,708,'Nissan Altima','2009 Toyota Matrix',11),(109,30,708,'Nissan Altima','2012 Mazda Mazda6',9),(110,30,708,'Nissan Altima','2012 Ford Focus',8),(111,31,55,'Nissan Altima','2013 Honda Fit',17),(112,31,55,'Nissan Altima','2013 Chevrolet Impala',16),(113,31,55,'Nissan Altima','2012 Mazda Mazda3',16),(114,31,55,'Nissan Altima','2013 BMW 3 Series',11),(115,31,55,'Nissan Altima','2012 Mitsubishi Eclipse',10),(116,32,1095,'Nissan Altima','2011 Toyota Corolla',12),(117,32,1095,'Nissan Altima','2013 Acura ILX',10),(118,32,1095,'Nissan Altima','2012 Toyota Camry',10),(119,32,1095,'Nissan Altima','2011 Acura TSX',10),(120,32,1095,'Nissan Altima','2009 Toyota Camry',9),(121,33,40260249,'GMC Sierra 1500','2013 Nissan Altima',6),(122,33,40260249,'GMC Sierra 1500','2013 Cadillac XTS',6),(123,33,40260249,'GMC Sierra 1500','2013 Buick LaCrosse',6),(124,33,40260249,'GMC Sierra 1500','2013 Dodge Dart',5),(125,33,40260249,'GMC Sierra 1500','2013 Toyota Avalon',5),(126,33,40260249,'GMC Sierra 1500','2013 Ford F-150',5),(127,33,40260249,'GMC Sierra 1500','2014 Cadillac SRX',5),(128,33,40260249,'GMC Sierra 1500','2013 Chevrolet Cruze',5),(129,33,40260249,'GMC Sierra 1500','2013 Chevrolet Equinox',5),(130,33,40260249,'GMC Sierra 1500','2013 Cadillac Escalade',5),(131,33,40260249,'GMC Sierra 1500','2014 Chevrolet Impala',5),(132,33,40260249,'GMC Sierra 1500','2014 Chevrolet Silverado 2500',5),(133,33,40260249,'GMC Sierra 1500','2013 Honda Ridgeline',5),(134,34,622,'Infiniti G37','2011 Audi A4',8),(135,34,622,'Infiniti G37','2013 Audi A4',7),(136,34,622,'Infiniti G37','New Audi A3',7),(137,34,622,'Infiniti G37','New Audi A4',7),(138,34,622,'Infiniti G37','2012 Audi A4',7),(139,35,45760244,'Porsche Cayenne','2013 Mercedes-Benz GLK350',10),(140,35,45760244,'Porsche Cayenne','2014 Mercedes-Benz ML350',9),(141,35,45760244,'Porsche Cayenne','2012 Mercedes-Benz S550',9),(142,35,45760244,'Porsche Cayenne','New Mercedes-Benz ML350',8),(143,35,45760244,'Porsche Cayenne','2010 Mercedes-Benz ML350',8),(144,36,55010308,'Jeep Wrangler','New Honda Accord',8),(145,36,55010308,'Jeep Wrangler','2010 Chrysler Town & Country',8),(146,36,55010308,'Jeep Wrangler','2013 Kia Optima',8),(147,36,55010308,'Jeep Wrangler','2010 Mazda Mazda6',7),(148,36,55010308,'Jeep Wrangler','2012 Dodge Journey',7),(149,36,55010308,'Jeep Wrangler','2012 Ford F-150',7),(150,36,55010308,'Jeep Wrangler','2013 Acura ILX',7),(151,36,55010308,'Jeep Wrangler','2010 Nissan Versa',7),(152,37,1763,'Toyota Camry','2011 Hyundai Sonata',8),(153,37,1763,'Toyota Camry','2013 Hyundai Elantra',8),(154,37,1763,'Toyota Camry','2012 Nissan Sentra',7),(155,37,1763,'Toyota Camry','2012 Hyundai Sonata',7),(156,37,1763,'Toyota Camry','2013 Chevrolet Cruze',6),(157,37,1763,'Toyota Camry','2011 Chevrolet Impala',6),(158,37,1763,'Toyota Camry','2012 Kia Rio',6),(159,37,1763,'Toyota Camry','2011 Chevrolet Malibu',6);
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
) ENGINE=MyISAM AUTO_INCREMENT=136 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_clienthitlist`
--

LOCK TABLES `report_clienthitlist` WRITE;
/*!40000 ALTER TABLE `report_clienthitlist` DISABLE KEYS */;
INSERT INTO `report_clienthitlist` VALUES (1,1,334,NULL,'Chevrolet Silverado 1500','858',NULL),(2,1,334,NULL,'Subaru Impreza','462',NULL),(3,1,334,NULL,'Subaru Forester','418',NULL),(4,1,334,NULL,'Chevrolet Silverado 2500','397',NULL),(5,1,334,NULL,'Chevrolet Camaro','306',NULL),(6,25,39010241,NULL,'Nissan Altima','564',NULL),(7,25,39010241,NULL,'Mazda Mazda3','562',NULL),(8,25,39010241,NULL,'Nissan Rogue','530',NULL),(9,25,39010241,NULL,'Toyota Tundra','396',NULL),(10,25,39010241,NULL,'Mazda CX-5','367',NULL),(11,24,1060,NULL,'Mitsubishi Outlander Sport','729',NULL),(12,24,1060,NULL,'Jeep Wrangler Unlimited','492',NULL),(13,24,1060,NULL,'Mitsubishi Outlander','487',NULL),(14,24,1060,NULL,'Toyota Camry','453',NULL),(15,24,1060,NULL,'Hyundai Santa Fe','449',NULL),(16,23,18,NULL,'Honda Civic','2656',NULL),(17,23,18,NULL,'Honda Accord','1734',NULL),(18,23,18,NULL,'Honda CR-V','1051',NULL),(19,23,18,NULL,'Ford F-150','745',NULL),(20,23,18,NULL,'Volkswagen Jetta','673',NULL),(21,22,8732,NULL,'Ford F-150','770',NULL),(22,22,8732,NULL,'Toyota Camry','618',NULL),(23,22,8732,NULL,'Toyota Corolla','580',NULL),(24,22,8732,NULL,'Kia Optima','535',NULL),(25,22,8732,NULL,'Toyota Tacoma','479',NULL),(26,7,3908,NULL,'Chevrolet Silverado 1500','893',NULL),(27,7,3908,NULL,'Honda Accord','575',NULL),(28,7,3908,NULL,'Honda Civic','572',NULL),(29,7,3908,NULL,'RAM 1500','528',NULL),(30,7,3908,NULL,'GMC Sierra 1500','524',NULL),(31,21,46760240,NULL,'Jeep Wrangler','457',NULL),(32,21,46760240,NULL,'RAM 1500','397',NULL),(33,21,46760240,NULL,'Chevrolet Silverado 1500','376',NULL),(34,21,46760240,NULL,'Honda Accord','328',NULL),(35,21,46760240,NULL,'Chevrolet Camaro','290',NULL),(36,9,7655,NULL,'Honda Accord','979',NULL),(37,9,7655,NULL,'Honda Civic','559',NULL),(38,9,7655,NULL,'Nissan Altima','546',NULL),(39,9,7655,NULL,'Honda CR-V','535',NULL),(40,9,7655,NULL,'GMC Terrain','490',NULL),(41,10,8759,NULL,'GMC Sierra','248',NULL),(42,10,8759,NULL,'GMC Acadia','109',NULL),(43,10,8759,NULL,'Nissan Altima','106',NULL),(44,10,8759,NULL,'GMC Sierra 1500','101',NULL),(45,10,8759,NULL,'Chevrolet Malibu','97',NULL),(46,11,2010289,NULL,'Mazda Mazda3','428',NULL),(47,11,2010289,NULL,'Infiniti QX60','423',NULL),(48,11,2010289,NULL,'Ford F-150','355',NULL),(49,11,2010289,NULL,'Infiniti Q50','325',NULL),(50,11,2010289,NULL,'GMC Sierra 1500','296',NULL),(51,12,2260250,NULL,'Chevrolet Silverado 1500','284',NULL),(52,12,2260250,NULL,'GMC Sierra 1500','265',NULL),(53,12,2260250,NULL,'Chevrolet Impala','188',NULL),(54,12,2260250,NULL,'Chevrolet Equinox','187',NULL),(55,12,2260250,NULL,'Chevrolet Silverado 2500','174',NULL),(56,20,46510240,NULL,'Honda Accord','800',NULL),(57,20,46510240,NULL,'Infiniti QX60','637',NULL),(58,20,46510240,NULL,'Honda Civic','608',NULL),(59,20,46510240,NULL,'Infiniti Q50','551',NULL),(60,20,46510240,NULL,'Nissan Altima','461',NULL),(61,19,4598,NULL,'Honda Accord','1007',NULL),(62,19,4598,NULL,'Mazda Mazda3','770',NULL),(63,19,4598,NULL,'Chevrolet Silverado 1500','735',NULL),(64,19,4598,NULL,'Honda CR-V','653',NULL),(65,19,4598,NULL,'Ford Mustang','649',NULL),(66,18,1173,NULL,'Honda Accord','979',NULL),(67,18,1173,NULL,'Honda Civic','559',NULL),(68,18,1173,NULL,'Nissan Altima','546',NULL),(69,18,1173,NULL,'Honda CR-V','535',NULL),(70,18,1173,NULL,'GMC Terrain','490',NULL),(71,17,50010240,NULL,'Nissan Altima','640',NULL),(72,17,50010240,NULL,'Hyundai Santa Fe','592',NULL),(73,17,50010240,NULL,'Hyundai Sonata','456',NULL),(74,17,50010240,NULL,'Toyota 4Runner','454',NULL),(75,17,50010240,NULL,'Toyota Tundra','454',NULL),(76,26,53010273,NULL,'Nissan Altima','644',NULL),(77,26,53010273,NULL,'Infiniti QX60','605',NULL),(78,26,53010273,NULL,'Infiniti Q50','572',NULL),(79,26,53010273,NULL,'Subaru Forester','492',NULL),(80,26,53010273,NULL,'Nissan Rogue','377',NULL),(81,27,1762,NULL,'Infiniti G37x','1634',NULL),(82,27,1762,NULL,'Subaru Forester','1137',NULL),(83,27,1762,NULL,'Subaru Impreza','1105',NULL),(84,27,1762,NULL,'RAM 1500','938',NULL),(85,27,1762,NULL,'Subaru Outback','754',NULL),(86,28,48510243,NULL,'Nissan Altima','444',NULL),(87,28,48510243,NULL,'Nissan Rogue','316',NULL),(88,28,48510243,NULL,'Acura RDX','197',NULL),(89,28,48510243,NULL,'Nissan Pathfinder','197',NULL),(90,28,48510243,NULL,'Nissan Sentra','122',NULL),(91,29,307,NULL,'Nissan Altima','597',NULL),(92,29,307,NULL,'Ford F-150','362',NULL),(93,29,307,NULL,'Nissan Rogue','281',NULL),(94,29,307,NULL,'Honda Civic','245',NULL),(95,29,307,NULL,'Honda CR-V','237',NULL),(96,34,622,NULL,'Honda Accord','979',NULL),(97,34,622,NULL,'Honda Civic','559',NULL),(98,34,622,NULL,'Nissan Altima','546',NULL),(99,34,622,NULL,'Honda CR-V','535',NULL),(100,34,622,NULL,'GMC Terrain','490',NULL),(101,30,708,NULL,'Ford F-150','11949',NULL),(102,30,708,NULL,'Ford F-250','2979',NULL),(103,30,708,NULL,'Ford Mustang','2607',NULL),(104,30,708,NULL,'Ford Fusion','1989',NULL),(105,30,708,NULL,'Ford Explorer','1954',NULL),(106,31,55,NULL,'Volkswagen Jetta','293',NULL),(107,31,55,NULL,'Nissan Altima','264',NULL),(108,31,55,NULL,'Volkswagen Beetle','221',NULL),(109,31,55,NULL,'Volkswagen Passat','217',NULL),(110,31,55,NULL,'Nissan Versa','128',NULL),(111,32,1095,NULL,'Nissan Altima','640',NULL),(112,32,1095,NULL,'Hyundai Santa Fe','592',NULL),(113,32,1095,NULL,'Hyundai Sonata','456',NULL),(114,32,1095,NULL,'Toyota 4Runner','454',NULL),(115,32,1095,NULL,'Toyota Tundra','454',NULL),(116,33,40260249,NULL,'Hyundai Santa Fe','512',NULL),(117,33,40260249,NULL,'Hyundai Elantra','474',NULL),(118,33,40260249,NULL,'Chevrolet Silverado 1500','414',NULL),(119,33,40260249,NULL,'Mitsubishi Outlander','285',NULL),(120,33,40260249,NULL,'Hyundai Sonata','273',NULL),(121,35,45760244,NULL,'Mitsubishi Outlander Sport','729',NULL),(122,35,45760244,NULL,'Jeep Wrangler Unlimited','492',NULL),(123,35,45760244,NULL,'Mitsubishi Outlander','487',NULL),(124,35,45760244,NULL,'Toyota Camry','453',NULL),(125,35,45760244,NULL,'Hyundai Santa Fe','449',NULL),(126,36,55010308,NULL,'Hyundai Sonata','307',NULL),(127,36,55010308,NULL,'Hyundai Santa Fe','294',NULL),(128,36,55010308,NULL,'Hyundai Elantra','281',NULL),(129,36,55010308,NULL,'Hyundai Tucson','219',NULL),(130,36,55010308,NULL,'Hyundai Accent','192',NULL),(131,37,1763,NULL,'Infiniti G37x','1634',NULL),(132,37,1763,NULL,'Subaru Forester','1137',NULL),(133,37,1763,NULL,'Subaru Impreza','1105',NULL),(134,37,1763,NULL,'RAM 1500','938',NULL),(135,37,1763,NULL,'Subaru Outback','754',NULL);
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
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_clientmodelmomentum`
--

LOCK TABLES `report_clientmodelmomentum` WRITE;
/*!40000 ALTER TABLE `report_clientmodelmomentum` DISABLE KEYS */;
INSERT INTO `report_clientmodelmomentum` VALUES (1,1,334,'Infiniti G37','21','52.81649',NULL),(2,1,334,'Infiniti G37','20','51.62432',NULL),(3,1,334,'Infiniti G37','19','50.757835',NULL),(4,1,334,'Infiniti G37','18','45.3213165',NULL),(5,7,3908,'Honda Accord','21','42.95306',NULL),(6,7,3908,'Honda Accord','20','52.96364',NULL),(7,7,3908,'Honda Accord','19','51.67943',NULL),(8,7,3908,'Honda Accord','18','46.776308',NULL),(9,9,7655,'Honda Accord','21','53.643654',NULL),(10,9,7655,'Honda Accord','20','51.678104',NULL),(11,9,7655,'Honda Accord','19','48.959248',NULL),(12,9,7655,'Honda Accord','18','45.4854315',NULL),(13,10,8759,'GMC Sierra','21','51.36935',NULL),(14,10,8759,'GMC Sierra','20','52.787994',NULL),(15,10,8759,'GMC Sierra','19','48.853176',NULL),(16,10,8759,'GMC Sierra','18','49.181351',NULL),(17,11,2010289,'Honda Accord','21','58.300636',NULL),(18,11,2010289,'Honda Accord','20','57.889973',NULL),(19,11,2010289,'Honda Accord','19','58.385757',NULL),(20,12,2260250,'Chevrolet Silverado 1500','21','49.150856',NULL),(21,12,2260250,'Chevrolet Silverado 1500','20','52.507378',NULL),(22,12,2260250,'Chevrolet Silverado 1500','19','52.622444',NULL),(23,12,2260250,'Chevrolet Silverado 1500','18','48.345378',NULL),(24,18,1173,'Nissan Altima','21','74.649475',NULL),(25,18,1173,'Nissan Altima','20','66.62808',NULL),(26,18,1173,'Nissan Altima','19','47.57739',NULL),(27,18,1173,'Nissan Altima','18','44.796294',NULL),(28,19,4598,'Chevrolet Malibu','21','53.517876',NULL),(29,19,4598,'Chevrolet Malibu','20','54.654377',NULL),(30,19,4598,'Chevrolet Malibu','19','51.80319',NULL),(31,19,4598,'Chevrolet Malibu','18','47.645809',NULL),(32,21,46760240,'Chevrolet Silverado 1500','21','100',NULL),(33,21,46760240,'Chevrolet Silverado 1500','20','100',NULL),(34,21,46760240,'Chevrolet Silverado 1500','19','100',NULL),(35,21,46760240,'Chevrolet Silverado 1500','18','100',NULL),(36,22,8732,'Volkswagen Passat','21','53.667168',NULL),(37,22,8732,'Volkswagen Passat','20','61.147625',NULL),(38,22,8732,'Volkswagen Passat','19','54.366226',NULL),(39,22,8732,'Volkswagen Passat','18','49.8944764',NULL),(40,23,18,'Nissan Altima','21','52.084248',NULL),(41,23,18,'Nissan Altima','20','51.63412',NULL),(42,23,18,'Nissan Altima','19','51.208504',NULL),(43,23,18,'Nissan Altima','18','45.877325',NULL),(44,24,1060,'Nissan Altima','21','51.71233',NULL),(45,24,1060,'Nissan Altima','20','51.71233',NULL),(46,24,1060,'Nissan Altima','19','51.71233',NULL),(47,24,1060,'Nissan Altima','18','51.71233',NULL),(48,25,39010241,'Toyota Tacoma','21','52.44885',NULL),(49,25,39010241,'Toyota Tacoma','20','51.57461',NULL),(50,25,39010241,'Toyota Tacoma','19','48.497227',NULL),(51,25,39010241,'Toyota Tacoma','18','46.502763',NULL),(52,28,48510243,'Porsche 911 GT3','21','0',NULL),(53,28,48510243,'Porsche 911 GT3','20','0',NULL),(54,28,48510243,'Porsche 911 GT3','19','0',NULL),(55,29,307,'Nissan Altima','21','55.09948',NULL),(56,29,307,'Nissan Altima','20','50.61753',NULL),(57,29,307,'Nissan Altima','19','51.94576',NULL),(58,29,307,'Nissan Altima','18','46.1443995',NULL),(59,30,708,'Nissan Altima','21','57.02681',NULL),(60,30,708,'Nissan Altima','20','49.64309',NULL),(61,30,708,'Nissan Altima','19','48.161034',NULL),(62,30,708,'Nissan Altima','18','45.1922685',NULL),(63,31,55,'Nissan Altima','21','52.174835',NULL),(64,31,55,'Nissan Altima','20','57.351795',NULL),(65,31,55,'Nissan Altima','19','52.703583',NULL),(66,31,55,'Nissan Altima','18','47.6356775',NULL),(67,32,1095,'Nissan Altima','21','60.625',NULL),(68,32,1095,'Nissan Altima','20','60.625',NULL),(69,32,1095,'Nissan Altima','19','60.625',NULL),(70,32,1095,'Nissan Altima','18','60.625',NULL),(71,33,40260249,'GMC Sierra 1500','21','60.869564',NULL),(72,33,40260249,'GMC Sierra 1500','20','60.869564',NULL),(73,33,40260249,'GMC Sierra 1500','19','60.869564',NULL),(74,33,40260249,'GMC Sierra 1500','18','60.869564',NULL),(75,34,622,'Infiniti G37','21','49.944077',NULL),(76,34,622,'Infiniti G37','20','50.773224',NULL),(77,34,622,'Infiniti G37','19','50.132607',NULL),(78,34,622,'Infiniti G37','18','47.7258115',NULL),(79,36,55010308,'Jeep Wrangler','21','63.414635',NULL),(80,36,55010308,'Jeep Wrangler','20','63.414635',NULL),(81,36,55010308,'Jeep Wrangler','19','63.414635',NULL),(82,36,55010308,'Jeep Wrangler','18','63.414635',NULL),(83,37,1763,'Toyota Camry','21','48.876476',NULL),(84,37,1763,'Toyota Camry','20','52.51757',NULL),(85,37,1763,'Toyota Camry','19','47.02029',NULL),(86,37,1763,'Toyota Camry','18','45.1237625',NULL);
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
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_clientnewusedsplit`
--

LOCK TABLES `report_clientnewusedsplit` WRITE;
/*!40000 ALTER TABLE `report_clientnewusedsplit` DISABLE KEYS */;
INSERT INTO `report_clientnewusedsplit` VALUES (1,31,55,'34.8%','65.2%'),(2,29,307,'58.6%','41.4%'),(3,24,1060,'43.2%','56.8%'),(4,10,8759,'27.1%','72.9%'),(5,12,2260250,'25.5%','74.5%'),(6,33,40260249,'35.5%','64.5%'),(7,35,45760244,'33.9%','66.1%'),(8,21,46760240,'35.3%','64.7%'),(9,34,622,'60.7%','39.3%'),(10,32,1095,'23.2%','76.8%'),(11,9,7655,'48.5%','51.5%'),(12,25,39010241,'38.9%','61.1%'),(13,28,48510243,'15.9%','84.1%'),(14,17,50010240,'35.6%','64.4%'),(15,1,334,'17.3%','82.7%'),(16,30,708,'54.3%','45.7%'),(17,37,1763,'33.3%','66.7%'),(18,7,3908,'38.5%','61.5%'),(19,23,18,'50.4%','49.6%'),(20,18,1173,'94.6%','5.4%'),(21,19,4598,'30.3%','69.7%'),(22,22,8732,'73.4%','26.6%'),(23,11,2010289,'78.2%','21.8%'),(24,36,55010308,'30.5%','69.5%');
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
) ENGINE=MyISAM AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_clientsearchkeyword`
--

LOCK TABLES `report_clientsearchkeyword` WRITE;
/*!40000 ALTER TABLE `report_clientsearchkeyword` DISABLE KEYS */;
INSERT INTO `report_clientsearchkeyword` VALUES (1,36,55010308,'jack key',39),(2,36,55010308,'jack key motors',38),(3,36,55010308,'jackkeymotors.com',11),(4,36,55010308,'jack key auto group',11),(5,36,55010308,'jackkey.com',10),(6,17,50010240,'astro lincoln pensacola',23),(7,17,50010240,'astro lincoln',15),(8,17,50010240,'astro lincoln mercury',7),(9,17,50010240,'astro lincoln in pensacola',4),(10,17,50010240,'astro lincoln in pensacola fl',3),(11,28,48510243,'northtown auto',327),(12,28,48510243,'northtown',72),(13,28,48510243,'used cars buffalo ny',26),(14,28,48510243,'northtown automotive',20),(15,28,48510243,'northtowne',16),(16,21,46760240,'priority chevrolet',290),(17,21,46760240,'priority chevrolet chesapeake',37),(18,21,46760240,'priority chevy',21),(19,21,46760240,'priority chevrolet chesapeake va',19),(20,21,46760240,'http://www.prioritychevrolet.com/',17),(21,20,46510240,'henderson ford',19),(22,20,46510240,'craigslist',10),(23,20,46510240,'charlie henderson ford',8),(24,20,46510240,'henderson ford waveland ms',8),(25,20,46510240,'mr ford',4),(26,35,45760244,'loeber motors',158),(27,35,45760244,'porsche',33),(28,35,45760244,'porsche macan release date',33),(29,35,45760244,'http://www.loebermotors.com/blog/2014-mercedes-benz-cls550-chicago-il/',17),(30,35,45760244,'loeber mercedes',15),(31,33,40260249,'http://www.siddillonbuickgmc.com/',4),(32,33,40260249,'sid dillon',4),(33,33,40260249,'sid dillon fremont',3),(34,33,40260249,'sid dillion buick',2),(35,33,40260249,'sid dillon gmc',2),(36,25,39010241,'mark miller toyota',155),(37,25,39010241,'http://www.markmillertoyota.com/',17),(38,25,39010241,'mark miller toyota service',17),(39,25,39010241,'toyota salt lake city',17),(40,25,39010241,'toyota utah',10),(41,12,2260250,'vic canever chevrolet',80),(42,12,2260250,'vic canever',63),(43,12,2260250,'vic canever fenton',24),(44,12,2260250,'vic canaver fenton',9),(45,12,2260250,'canever chevrolet',7),(46,11,2010289,'ganley honda',196),(47,11,2010289,'ganley honda north olmsted',50),(48,11,2010289,'http://www.ganleyhonda.com/',12),(49,11,2010289,'honda north olmsted',11),(50,11,2010289,'sunnyside honda',11),(51,10,8759,'skbuick.com',11),(52,10,8759,'sk buick',7),(53,10,8759,'s and k pontiac',6),(54,10,8759,'s k pontiac',6),(55,10,8759,'skbuick',5),(56,22,8732,'stone mountain volkswagen',36),(57,22,8732,'stone mountain vw',33),(58,22,8732,'http://www.stonemountainvw.com/',9),(59,22,8732,'stone mountain volkswagon',6),(60,22,8732,'volkswagen stone mountain',6),(61,9,7655,'bommarito honda',204),(62,9,7655,'http://www.bommaritohonda.com/',23),(63,9,7655,'bommarito honda hazelwood',12),(64,9,7655,'st louis honda dealers',12),(65,9,7655,'honda st louis',8),(66,19,4598,'gordon chevrolet',246),(67,19,4598,'gordon chevy',21),(68,19,4598,'gordon chevrolet garden city mi',13),(69,19,4598,'http://www.gordonchevrolet.com/',12),(70,19,4598,'gordon chevrolet garden city',11),(71,7,3908,'howdy honda',498),(72,7,3908,'howdy honda austin',102),(73,7,3908,'honda austin',84),(74,7,3908,'http://www.howdyhonda.com/',36),(75,7,3908,'howdy honda used cars',23),(76,37,1763,'apple valley toyota',76),(77,37,1763,'apple valley toyota martinsburg wv',24),(78,37,1763,'apple valley toyota martinsburg',18),(79,37,1763,'kern toyota winchester va',8),(80,37,1763,'toyota martinsburg wv',8),(81,18,1173,'bommarito nissan',229),(82,18,1173,'http://www.bommaritonissan.com/',19),(83,18,1173,'bommarito nissan hazelwood mo',17),(84,18,1173,'bommarito',15),(85,18,1173,'nissan',12),(86,32,1095,'sandy sansing nissan',281),(87,32,1095,'nissan pensacola',29),(88,32,1095,'sandy sansing',23),(89,32,1095,'sandy sansing nissan pensacola',11),(90,32,1095,'nissan pensacola fl',10),(91,24,1060,'kelly nissan',98),(92,24,1060,'kelly nissan oak lawn',36),(93,24,1060,'bad credit auto loans',13),(94,24,1060,'kelly kean nissan',8),(95,24,1060,'http://www.kellynissan.com',8),(96,30,708,'clear lake nissan',235),(97,30,708,'clearlake nissan',27),(98,30,708,'nissan clear lake',24),(99,30,708,'nissan',17),(100,30,708,'http://www.clearlakenissan.com/',10),(101,34,622,'bommarito infiniti',55),(102,34,622,'bommarito infinity',12),(103,34,622,'st louis infiniti',5),(104,34,622,'infiniti st louis',4),(105,34,622,'infiniti',4),(106,1,334,'lia infiniti',82),(107,1,334,'lia infiniti of latham',19),(108,1,334,'infiniti',17),(109,1,334,'lia infinity',16),(110,1,334,'lia infiniti of latham latham ny',9),(111,29,307,'uftring nissan',33),(112,29,307,'nissan peoria il',9),(113,29,307,'http://www.uftringnissan.net/',5),(114,29,307,'uftring nissan peoria il',5),(115,29,307,'uftring nissan peoria',4),(116,31,55,'coast nissan',49),(117,31,55,'nissan san luis obispo',16),(118,31,55,'coast nissan san luis obispo',11),(119,31,55,'coast nissan in san luis obispo',9),(120,31,55,'san luis obispo nissan',7),(121,23,18,'gastonia nissan',141),(122,23,18,'nissan of gastonia',37),(123,23,18,'nissan gastonia',37),(124,23,18,'gastonia nissan gastonia nc',19),(125,23,18,'nissan',9);
/*!40000 ALTER TABLE `report_clientsearchkeyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_dataiumdma`
--

DROP TABLE IF EXISTS `report_dataiumdma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_dataiumdma` (
  `dataiumdmaid` int(11) DEFAULT NULL,
  `dmaname` varchar(128) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_dataiumdma`
--

LOCK TABLES `report_dataiumdma` WRITE;
/*!40000 ALTER TABLE `report_dataiumdma` DISABLE KEYS */;
INSERT INTO `report_dataiumdma` VALUES (1,'Abilene-Sweetwater, TX',1),(2,'Albany-Schenectady-Troy, NY',2),(3,'Albany, GA',3),(4,'Albuquerque-Santa Fe, NM',4),(5,'Alexandria, LA',5),(6,'Alpena, MI',6),(7,'Amarillo, TX',7),(8,'Anchorage, AK',8),(9,'Atlanta, GA',9),(10,'Augusta, GA',10),(11,'Austin, TX',11),(12,'Bakersfield, CA',12),(13,'Baltimore, MD',13),(14,'Bangor, ME',14),(15,'Baton Rouge, LA',15),(16,'Beaumont-Port Arthur, TX',16),(17,'Bend, OR',17),(18,'Billings, MT',18),(19,'Biloxi-Gulfport, MS',19),(20,'Binghamton, NY',20),(21,'Birmingham (Anniston and Tuscaloosa), AL',21),(22,'Bluefield-Beckley-Oak Hill, WV',22),(23,'Boise, ID',23),(24,'Boston, MA (Manchester, NH)',24),(25,'Bowling Green, KY',25),(26,'Buffalo, NY',26),(27,'Burlington, VT-Plattsburgh, NY',27),(28,'Butte-Bozeman, MT',28),(29,'Casper-Riverton, WY',29),(30,'Cedar Rapids-Waterloo-Iowa City and Dubuque, IA',30),(31,'Champaign and Springfield-Decatur, IL',31),(32,'Charleston-Huntington, WV',32),(33,'Charleston, SC',33),(34,'Charlotte, NC',34),(35,'Charlottesville, VA',35),(36,'Chattanooga, TN',36),(37,'Cheyenne, WY-Scottsbluff, NE',37),(38,'Chicago, IL',38),(39,'Chico-Redding, CA',39),(40,'Cincinnati, OH',40),(41,'Clarksburg-Weston, WV',41),(42,'Cleveland-Akron (Canton), OH',42),(43,'Colorado Springs-Pueblo, CO',43),(44,'Columbia-Jefferson City, MO',44),(45,'Columbia, SC',45),(46,'Columbus-Tupelo-West Point, MS',46),(47,'Columbus, GA',47),(48,'Columbus, OH',48),(49,'Corpus Christi, TX',49),(50,'Dallas-Ft. Worth, TX',50),(51,'Davenport, IA-Rock Island-Moline, IL',51),(52,'Dayton, OH',52),(53,'Denver, CO',53),(54,'Des Moines-Ames, IA',54),(55,'Detroit, MI',55),(56,'Dothan, AL',56),(57,'Duluth, MN-Superior, WI',57),(58,'El Paso, TX',58),(59,'Elmira, NY',59),(60,'Erie, PA',60),(61,'Eugene, OR',61),(62,'Eureka, CA',62),(63,'Evansville, IN',63),(64,'Fairbanks, AK',64),(65,'Fargo-Valley City, ND',65),(66,'Flint-Saginaw-Bay City, MI',66),(67,'Fresno-Visalia, CA',67),(68,'Ft. Myers-Naples, Fl',68),(69,'Ft. Smith-Fayetteville-Springdale-Rogers, AR',69),(70,'Ft. Wayne, IN',70),(71,'Gainesville, FL',71),(73,'Grand Junction-Montrose, CO',72),(74,'Grand Rapids-Kalamazoo-Battle Creek, MI',73),(75,'Great Falls, MT',74),(76,'Green Bay-Appleton, WI',75),(77,'Greensboro-High Point-Winston Salem, NC',76),(78,'Greenville-New Bern-Washington, NC',77),(79,'Greenville-Spartanburg, SC-Asheville, NC-Anderson,SC',78),(80,'Greenwood-Greenville, MS',79),(81,'Harlingen-Weslaco-Brownsville-McAllen, TX',80),(82,'Harrisburg-Lancaster-Lebanon-York, PA',81),(83,'Harrisonburg, VA',82),(84,'Hartford and New Haven, CT',83),(85,'Hattiesburg-Laurel, MS',84),(86,'Helena, MT',85),(87,'Honolulu, HI',86),(88,'Houston, TX',87),(89,'Huntsville-Decatur (Florence), AL',88),(90,'Idaho Falls-Pocatello, ID',89),(91,'Indianapolis, IN',90),(92,'Jackson, MS',91),(93,'Jackson, TN',92),(94,'Jacksonville, FL',93),(95,'Johnstown-Altoona, PA',94),(96,'Jonesboro, AR',95),(97,'Joplin, MO-Pittsburg, KS',96),(99,'Kansas City, MO',97),(100,'Knoxville, TN',98),(101,'La Crosse-Eau Claire, WI',99),(102,'Lafayette, IN',100),(103,'Lafayette, LA',101),(104,'Lake Charles, LA',102),(105,'Lansing, MI',103),(106,'Laredo, TX',104),(107,'Las Vegas, NV',105),(108,'Lexington, KY',106),(109,'Lima, OH',107),(110,'Lincoln and Hastings-Kearney, NE',108),(111,'Little Rock-Pine Bluff, AR',109),(112,'Los Angeles, CA',110),(113,'Louisville, KY',111),(114,'Lubbock, TX',112),(115,'Macon, GA',113),(116,'Madison, WI',114),(117,'Mankato, MN',115),(118,'Marquette, MI',116),(119,'Medford-Klamath Falls, OR',117),(120,'Memphis, TN',118),(121,'Meridian, MS',119),(122,'Miami-Fort Lauderdale, FL',120),(123,'Milwaukee, WI',121),(124,'Minneapolis-St. Paul, MN',122),(125,'Minot-Bismarck-Dickinson(Williston), ND',123),(126,'Missoula, MT',124),(127,'Mobile, AL-Pensacola (Ft. Walton Beach), FL',125),(128,'Monroe, LA-El Dorado, AR',126),(129,'Monterey-Salinas, CA',127),(130,'Montgomery-Selma, AL',128),(131,'Myrtle Beach-Florence, SC',129),(132,'Nashville, TN',130),(133,'New Orleans, LA',131),(134,'New York, NY',132),(135,'Norfolk-Portsmouth-Newport News, VA',133),(136,'North Platte, NE',134),(137,'Odessa-Midland, TX',135),(138,'Oklahoma City, OK',136),(139,'Omaha, NE',137),(140,'Orlando-Daytona Beach-Melbourne, FL',138),(141,'Ottumwa, IA-Kirksville, MO',139),(142,'Paducah, KY-Cape Girardeau, MO-Harrisburg, IL',140),(143,'Palm Springs, CA',141),(144,'Panama City, FL',142),(145,'Parkersburg, WV',143),(146,'Peoria-Bloomington, IL',144),(147,'Philadelphia, PA',145),(148,'Phoenix, AZ',146),(149,'Pittsburgh, PA',147),(150,'Portland-Auburn, ME',148),(151,'Portland, OR',149),(152,'Presque Isle, ME',150),(153,'Providence, RI-New Bedford, MA',151),(154,'Quincy, IL-Hannibal, MO-Keokuk, IA',152),(155,'Raleigh-Durham (Fayetteville), NC',153),(156,'Rapid City, SD',154),(157,'Reno, NV',155),(158,'Richmond-Petersburg, VA',156),(159,'Roanoke-Lynchburg, VA',157),(160,'Rochester, MN-Mason City, IA-Austin, MN',158),(161,'Rochester, NY',159),(162,'Rockford, IL',160),(163,'Sacramento-Stockton-Modesto, CA',161),(164,'Salisbury, MD',162),(165,'Salt Lake City, UT',163),(166,'San Angelo, TX',164),(167,'San Antonio, TX',165),(168,'San Diego, CA',166),(169,'San Francisco-Oakland-San Jose, CA',167),(170,'Santa Barbara-Santa Maria-San Luis Obispo, CA',168),(171,'Savannah, GA',169),(172,'Seattle-Tacoma, WA',170),(173,'Sherman, TX-Ada, OK',171),(174,'Shreveport, LA',172),(175,'Sioux City, IA',173),(176,'Sioux Falls (Mitchell), SD',174),(177,'South Bend-Elkhart, IN',175),(178,'Spokane, WA',176),(179,'Springfield-Holyoke, MA',177),(180,'Springfield, MO',178),(181,'St. Joseph, MO',179),(182,'St. Louis, MO',180),(183,'Syracuse, NY',181),(184,'Tallahassee, FL-Thomasville, GA',182),(185,'Tampa-St. Petersburg (Sarasota), FL',183),(186,'Terre Haute, IN',184),(187,'Toledo, OH',185),(188,'Topeka, KS',186),(189,'Traverse City-Cadillac, MI',187),(190,'Tri-Cities, TN-VA',188),(191,'Tucson (Sierra Vista), AZ',189),(192,'Tulsa, OK',190),(193,'Twin Falls, ID',191),(194,'Tyler-Longview(Lufkin and Nacogdoches), TX',192),(195,'Utica, NY',193),(196,'Victoria, TX',194),(197,'Waco-Temple-Bryan, TX',195),(198,'Washington, DC (Hagerstown, MD)',196),(199,'Watertown, NY',197),(200,'Wausau-Rhinelander, WI',198),(201,'West Palm Beach-Ft. Pierce, FL',199),(202,'Wheeling, WV-Steubenville, OH',200),(203,'Wichita Falls, TX-Lawton, OK',201),(204,'Wichita-Hutchinson, KS Plus',202),(205,'Wilkes Barre-Scranton, PA',203),(206,'Wilmington, NC',204),(207,'Yakima-Pasco-Richland-Kennewick, WA',205),(208,'Youngstown, OH',206),(209,'Yuma, AZ-El Centro, CA',207),(210,'Zanesville, OH',208),(414,'Regina/Moose Jaw, SK',209),(415,'Winnipeg/Brandon, MB',210),(416,'Vancouver-Victoria, BC',211),(417,'Barrie/Orillia, ON',212),(418,'Edmonton, AB',213),(419,'Calgary/Lethbridge, AB',214),(420,'Ottawa, ON/Gatineau, QC',215),(421,'St John/Fredericton/Moncton, NB',216),(422,'Sydney/Glace Bay, NS',217),(423,'Halifax/Dartmouth, NS',218);
/*!40000 ALTER TABLE `report_dataiumdma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_dataiumsitetraffic`
--

DROP TABLE IF EXISTS `report_dataiumsitetraffic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_dataiumsitetraffic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataiumsiteid` int(11) NOT NULL,
  `sitename` varchar(128) NOT NULL,
  `dealername` varchar(128) NOT NULL,
  `dma_id` int(11) NOT NULL,
  `percentdma` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_dataiumsitetraffic_52e1ec19` (`dma_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_dataiumsitetraffic`
--

LOCK TABLES `report_dataiumsitetraffic` WRITE;
/*!40000 ALTER TABLE `report_dataiumsitetraffic` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_dataiumsitetraffic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_userprofile`
--

DROP TABLE IF EXISTS `report_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `bio` longtext,
  `position` longtext,
  `has_optedout` tinyint(1) NOT NULL,
  `wants_alerts` tinyint(1) NOT NULL,
  `wants_marketinfo` tinyint(1) NOT NULL,
  `wants_newsletters` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_userprofile`
--

LOCK TABLES `report_userprofile` WRITE;
/*!40000 ALTER TABLE `report_userprofile` DISABLE KEYS */;
INSERT INTO `report_userprofile` VALUES (1,14,'a long line of mutts - Great Danes, Shepards, and Airedales!','big dog on porch and the back deck!',0,1,1,1);
/*!40000 ALTER TABLE `report_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `south_migrationhistory`
--

DROP TABLE IF EXISTS `south_migrationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (4,'report','0001_initial','2014-04-09 14:57:44'),(5,'report','0002_auto__del_userprofile','2014-04-09 14:57:44'),(6,'report','0003_auto__add_userprofile','2014-04-09 14:57:44'),(7,'report','0004_auto__del_userprofile','2014-04-09 14:57:44'),(8,'report','0005_auto__add_userprofile','2014-04-09 14:57:44'),(9,'report','0006_auto__add_field_client_clientimagemonth','2014-04-18 13:55:50'),(10,'report','0007_auto__add_dataiumdma__add_dataiumsite','2014-05-21 01:37:38'),(11,'report','0008_auto__add_field_dataiumsite_percentdma','2014-05-30 02:25:41'),(12,'report','0009_auto__del_dataiumsite__add_dataiumsitetraffic','2014-06-11 19:53:48');
/*!40000 ALTER TABLE `south_migrationhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stg_client_contactinfo`
--

DROP TABLE IF EXISTS `stg_client_contactinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stg_client_contactinfo` (
  `id` int(11) NOT NULL DEFAULT '0',
  `dataiumclientid` int(11) NOT NULL,
  `clientname` varchar(128) CHARACTER SET utf8 NOT NULL,
  `clientemail` varchar(50) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stg_client_contactinfo`
--

LOCK TABLES `stg_client_contactinfo` WRITE;
/*!40000 ALTER TABLE `stg_client_contactinfo` DISABLE KEYS */;
INSERT INTO `stg_client_contactinfo` VALUES (1,334,'Lia Infiniti','apasternak@liacars.com'),(7,3908,'Howdy Honda','avillegas@howdyhonda.com'),(9,7655,'Bommarito Honda','abartoli@bommarito.net'),(10,8759,'S & K Buick Gmc','clay@skbuick.com'),(11,2010289,'Ganley Honda','msheppard@ganleyauto.com'),(12,2260250,'Vic Canever Chevrolet','viccaneverchevy@gmail.com'),(17,50010240,'Astro Lincoln',''),(18,1173,'Bommarito Nissan','abartoli@bommarito.net'),(19,4598,'Gordon Chevrolet','bruenger@gordon-chevrolet.com'),(20,46510240,'Henderson Ford',''),(21,46760240,'Priority Chevrolet','lambr@priorityauto.com'),(22,8732,'Stone Mountain Volkswagen','nzuchegno@stonemountainvw.com'),(23,18,'Gastonia Nissan','jeff@jdtmarketinggroup.com'),(24,1060,'Kelly Nissan','vito@kellynissan.com'),(25,39010241,'Mark Miller Toyota','jimmyo@markmiller.com'),(26,53010273,'Mercedes Benz of Baton Rouge',''),(27,1762,'Miller Auto Group',''),(28,48510243,'Northtown Automotive','r.shahin@northtownauto.com'),(29,307,'Uftring Nissan','lettieschmitt@uftringnissan.com'),(30,708,'Clear Lake Nissan','shouser@theamgroup.net'),(31,55,'Coast Nissan','lsmith@coast-bmw.com'),(32,1095,'Sandy Sansing Nissan','slohbeck@sandysansing.com'),(33,40260249,'Sid Dillon Buick GMC Cadillac','jbaye@siddillon.com');
/*!40000 ALTER TABLE `stg_client_contactinfo` ENABLE KEYS */;
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
INSERT INTO `stg_report_clientcrossshop` VALUES (NULL,18,34,14750667,'Nissan Altima','2013','Kia','Optima',12,23),(NULL,18,34,14750667,'Nissan Altima','2012','Honda','Accord',12,23),(NULL,18,34,14750667,'Nissan Altima','2013','Hyundai','Elantra',10,23),(NULL,18,34,14750667,'Nissan Altima','2011','Toyota','Camry',9,23),(NULL,55,170,14750667,'Nissan Altima','2013','Honda','Fit',17,31),(NULL,55,170,14750667,'Nissan Altima','2012','Mazda','Mazda3',16,31),(NULL,55,170,14750667,'Nissan Altima','2013','Chevrolet','Impala',16,31),(NULL,55,170,14750667,'Nissan Altima','2013','BMW','3 Series',11,31),(NULL,55,170,14750667,'Nissan Altima','2012','Mitsubishi','Eclipse',10,31),(NULL,307,146,14750667,'Nissan Altima','2012','Chevrolet','Cruze',20,29),(NULL,307,146,14750667,'Nissan Altima','2012','Volkswagen','Passat',18,29),(NULL,307,146,14750667,'Nissan Altima','2011','Ford','Fiesta',17,29),(NULL,307,146,14750667,'Nissan Altima','2009','Honda','CR-V',15,29),(NULL,307,146,14750667,'Nissan Altima','2009','Lincoln','MKS',15,29),(NULL,307,146,14750667,'Nissan Altima','2012','Jeep','Compass',15,29),(NULL,334,2,14750369,'Infiniti G37','2011','BMW','3 Series',21,1),(NULL,334,2,14750369,'Infiniti G37','2011','Mercedes-Benz','E-Class',13,1),(NULL,334,2,14750369,'Infiniti G37','2011','Acura','TSX',13,1),(NULL,334,2,14750369,'Infiniti G37','2013','BMW','3 Series',13,1),(NULL,334,2,14750369,'Infiniti G37','2012','Mercedes-Benz','C-Class',12,1),(NULL,622,182,14750369,'Infiniti G37','2011','Audi','A4',8,34),(NULL,622,182,14750369,'Infiniti G37','2013','Audi','A4',7,34),(NULL,622,182,14750369,'Infiniti G37','New','Audi','A3',7,34),(NULL,622,182,14750369,'Infiniti G37','New','Audi','A4',7,34),(NULL,622,182,14750369,'Infiniti G37','2012','Audi','A4',7,34),(NULL,708,88,14750667,'Nissan Altima','2010','Ford','Fusion',15,30),(NULL,708,88,14750667,'Nissan Altima','2010','Toyota','Corolla',13,30),(NULL,708,88,14750667,'Nissan Altima','2009','Toyota','Matrix',11,30),(NULL,708,88,14750667,'Nissan Altima','2012','Mazda','Mazda6',9,30),(NULL,708,88,14750667,'Nissan Altima','2012','Ford','Focus',8,30),(NULL,1060,38,14750667,'Nissan Altima','2012','Toyota','Yaris',12,24),(NULL,1060,38,14750667,'Nissan Altima','2013','Hyundai','Accent',12,24),(NULL,1060,38,14750667,'Nissan Altima','2012','Mazda','Mazda2',9,24),(NULL,1060,38,14750667,'Nissan Altima','2013','Mazda','Mazda2',9,24),(NULL,1060,38,14750667,'Nissan Altima','2010','Hyundai','Sonata',8,24),(NULL,1095,127,14750667,'Nissan Altima','2011','Toyota','Corolla',12,32),(NULL,1095,127,14750667,'Nissan Altima','2011','Acura','TSX',10,32),(NULL,1095,127,14750667,'Nissan Altima','2012','Toyota','Camry',10,32),(NULL,1095,127,14750667,'Nissan Altima','2013','Acura','ILX',10,32),(NULL,1095,127,14750667,'Nissan Altima','2009','Toyota','Camry',9,32),(NULL,1173,182,14750667,'Nissan Altima','New','Honda','Accord',5,18),(NULL,1173,182,14750667,'Nissan Altima','New','Honda','Civic',5,18),(NULL,1173,182,14750667,'Nissan Altima','2013','Honda','Civic',5,18),(NULL,1173,182,14750667,'Nissan Altima','2012','Toyota','Camry',4,18),(NULL,1173,182,14750667,'Nissan Altima','New','Buick','Regal',4,18),(NULL,1763,198,14750762,'Toyota Camry','2011','Hyundai','Sonata',8,37),(NULL,1763,198,14750762,'Toyota Camry','2013','Hyundai','Elantra',8,37),(NULL,1763,198,14750762,'Toyota Camry','2012','Hyundai','Sonata',7,37),(NULL,1763,198,14750762,'Toyota Camry','2012','Nissan','Sentra',7,37),(NULL,1763,198,14750762,'Toyota Camry','2011','Chevrolet','Impala',6,37),(NULL,1763,198,14750762,'Toyota Camry','2011','Chevrolet','Malibu',6,37),(NULL,1763,198,14750762,'Toyota Camry','2013','Chevrolet','Cruze',6,37),(NULL,1763,198,14750762,'Toyota Camry','2012','Kia','Rio',6,37),(NULL,3908,11,14750335,'Honda Accord','2011','Acura','TSX',21,7),(NULL,3908,11,14750335,'Honda Accord','2011','Toyota','Camry',15,7),(NULL,3908,11,14750335,'Honda Accord','2009','Nissan','Altima',13,7),(NULL,3908,11,14750335,'Honda Accord','2013','Hyundai','Accent',13,7),(NULL,3908,11,14750335,'Honda Accord','2013','Mazda','Mazda3',12,7),(NULL,4598,55,14750231,'Chevrolet Malibu','2013','Dodge','Dart',17,19),(NULL,4598,55,14750231,'Chevrolet Malibu','2012','Chrysler','200',17,19),(NULL,4598,55,14750237,'Chevrolet Silverado 1500','2013','Dodge','Dart',16,19),(NULL,4598,55,14750231,'Chevrolet Malibu','2010','Ford','Focus',13,19),(NULL,4598,55,14750231,'Chevrolet Malibu','2013','Nissan','Altima',13,19),(NULL,4598,55,14750237,'Chevrolet Silverado 1500','2012','Chrysler','200',13,19),(NULL,4598,55,14750231,'Chevrolet Malibu','2010','Dodge','Caliber',13,19),(NULL,4598,55,14750237,'Chevrolet Silverado 1500','2011','GMC','Sierra 1500',12,19),(NULL,4598,55,14750237,'Chevrolet Silverado 1500','2011','GMC','Terrain',10,19),(NULL,4598,55,14750237,'Chevrolet Silverado 1500','2013','Nissan','Altima',10,19),(NULL,7655,182,14750335,'Honda Accord','New','Nissan','Altima',16,9),(NULL,7655,182,14750335,'Honda Accord','2012','Toyota','Camry',9,9),(NULL,7655,182,14750335,'Honda Accord','2011','Toyota','Camry',7,9),(NULL,7655,182,14750335,'Honda Accord','2013','Nissan','Altima',6,9),(NULL,7655,182,14750335,'Honda Accord','New','Toyota','Camry',6,9),(NULL,8732,9,14750793,'Volkswagen Passat','2011','Audi','A5',4,22),(NULL,8732,9,14750793,'Volkswagen Passat','2013','Audi','A8',4,22),(NULL,8732,9,14750793,'Volkswagen Passat','2009','Saturn','Outlook',3,22),(NULL,8732,9,14750793,'Volkswagen Passat','New','Nissan','Altima',3,22),(NULL,8732,9,14750793,'Volkswagen Passat','2010','Chevrolet','Tahoe',2,22),(NULL,8732,9,14750793,'Volkswagen Passat','2011','Acura','MDX',2,22),(NULL,8732,9,14750793,'Volkswagen Passat','2012','Honda','Accord',2,22),(NULL,8732,9,14750793,'Volkswagen Passat','2013','Ford','Explorer',2,22),(NULL,8732,9,14750793,'Volkswagen Passat','2012','Chevrolet','Equinox',2,22),(NULL,8759,31,14750327,'GMC Sierra','2011','Toyota','4Runner',11,10),(NULL,8759,31,14750327,'GMC Sierra','2010','Chevrolet','Tahoe',10,10),(NULL,8759,31,14750327,'GMC Sierra','2011','Acura','MDX',10,10),(NULL,8759,31,14750327,'GMC Sierra','2011','Buick','Enclave',10,10),(NULL,8759,31,14750327,'GMC Sierra','2009','Pontiac','Vibe',9,10),(NULL,8759,31,14750327,'GMC Sierra','2009','Chevrolet','Impala',9,10),(NULL,8759,31,14750327,'GMC Sierra','2012','Ford','Edge',9,10),(NULL,8759,31,14750327,'GMC Sierra','2010','Cadillac','Escalade',9,10),(NULL,8759,31,14750327,'GMC Sierra','2013','Chevrolet','Tahoe',9,10),(NULL,8759,31,14750327,'GMC Sierra','2010','Toyota','Tacoma',9,10),(NULL,8759,31,14750327,'GMC Sierra','2014','Buick','LaCrosse',9,10),(NULL,2010289,42,14750335,'Honda Accord','2012','Nissan','Altima',12,11),(NULL,2010289,42,14750335,'Honda Accord','2013','Dodge','Avenger',11,11),(NULL,2010289,42,14750335,'Honda Accord','2011','Subaru','Legacy',10,11),(NULL,2010289,42,14750335,'Honda Accord','2011','Toyota','Camry',8,11),(NULL,2010289,42,14750335,'Honda Accord','2012','Mitsubishi','Galant',7,11),(NULL,2010289,42,14750335,'Honda Accord','2010','Volkswagen','Jetta',7,11),(NULL,2010289,42,14750335,'Honda Accord','2011','Nissan','Altima',7,11),(NULL,2010289,42,14750335,'Honda Accord','2013','Chrysler','200',7,11),(NULL,2010289,42,14750335,'Honda Accord','2013','Fiat','500',7,11),(NULL,2260250,66,14750237,'Chevrolet Silverado 1500','2011','GMC','Sierra 2500',28,12),(NULL,2260250,66,14750237,'Chevrolet Silverado 1500','2011','GMC','Sierra 1500',27,12),(NULL,2260250,66,14750237,'Chevrolet Silverado 1500','2011','Buick','LaCrosse',27,12),(NULL,2260250,66,14750237,'Chevrolet Silverado 1500','2014','GMC','Sierra 1500',25,12),(NULL,2260250,66,14750237,'Chevrolet Silverado 1500','2010','Dodge','Journey',15,12),(NULL,2260250,66,14750237,'Chevrolet Silverado 1500','2012','GMC','Acadia',15,12),(NULL,39010241,165,14750780,'Toyota Tacoma','2010','Chevrolet','Silverado',21,25),(NULL,39010241,165,14750780,'Toyota Tacoma','2013','Nissan','Altima',12,25),(NULL,39010241,165,14750780,'Toyota Tacoma','2013','Chevrolet','Cruze',11,25),(NULL,39010241,165,14750780,'Toyota Tacoma','2010','Hyundai','Elantra',10,25),(NULL,39010241,165,14750780,'Toyota Tacoma','2011','Chevrolet','Silverado',10,25),(NULL,39010241,165,14750780,'Toyota Tacoma','2013','Ford','Focus',10,25),(NULL,40260249,139,14750328,'GMC Sierra 1500','2013','Buick','LaCrosse',6,33),(NULL,40260249,139,14750328,'GMC Sierra 1500','2013','Cadillac','XTS',6,33),(NULL,40260249,139,14750328,'GMC Sierra 1500','2013','Nissan','Altima',6,33),(NULL,40260249,139,14750328,'GMC Sierra 1500','2013','Dodge','Dart',5,33),(NULL,40260249,139,14750328,'GMC Sierra 1500','2013','Chevrolet','Equinox',5,33),(NULL,40260249,139,14750328,'GMC Sierra 1500','2013','Ford','F-150',5,33),(NULL,40260249,139,14750328,'GMC Sierra 1500','2013','Toyota','Avalon',5,33),(NULL,40260249,139,14750328,'GMC Sierra 1500','2013','Cadillac','Escalade',5,33),(NULL,40260249,139,14750328,'GMC Sierra 1500','2014','Chevrolet','Impala',5,33),(NULL,40260249,139,14750328,'GMC Sierra 1500','2014','Chevrolet','Silverado 2500',5,33),(NULL,40260249,139,14750328,'GMC Sierra 1500','2013','Honda','Ridgeline',5,33),(NULL,40260249,139,14750328,'GMC Sierra 1500','2013','Chevrolet','Cruze',5,33),(NULL,40260249,139,14750328,'GMC Sierra 1500','2014','Cadillac','SRX',5,33),(NULL,45760244,38,14750712,'Porsche Cayenne','2013','Mercedes-Benz','GLK350',10,35),(NULL,45760244,38,14750712,'Porsche Cayenne','2012','Mercedes-Benz','S550',9,35),(NULL,45760244,38,14750712,'Porsche Cayenne','2014','Mercedes-Benz','ML350',9,35),(NULL,45760244,38,14750712,'Porsche Cayenne','2010','Mercedes-Benz','ML350',8,35),(NULL,45760244,38,14750712,'Porsche Cayenne','New','Mercedes-Benz','ML350',8,35),(NULL,46760240,135,14750237,'Chevrolet Silverado 1500','2012','GMC','Sierra 1500',26,21),(NULL,46760240,135,14750237,'Chevrolet Silverado 1500','2013','Ford','F-150',22,21),(NULL,46760240,135,14750237,'Chevrolet Silverado 1500','2013','GMC','Terrain',20,21),(NULL,46760240,135,14750237,'Chevrolet Silverado 1500','2011','GMC','Sierra 1500',16,21),(NULL,46760240,135,14750237,'Chevrolet Silverado 1500','2012','RAM','1500',15,21),(NULL,46760240,135,14750237,'Chevrolet Silverado 1500','2012','Toyota','Tacoma',15,21),(NULL,48510243,26,14750706,'Porsche 911 GT3','2013','BMW','M3',7,28),(NULL,48510243,26,14750706,'Porsche 911 GT3','2010','Mazda','Mazda3',5,28),(NULL,48510243,26,14750706,'Porsche 911 GT3','2012','Scion','tC',5,28),(NULL,48510243,26,14750706,'Porsche 911 GT3','2013','Lexus','LS 460',5,28),(NULL,48510243,26,14750706,'Porsche 911 GT3','2014','Mazda','Mazda6',5,28),(NULL,50010240,127,14750489,'Lincoln MKZ','2011','Toyota','Prius',2,17),(NULL,50010240,127,14750489,'Lincoln MKZ','2010','Honda','Odyssey',1,17),(NULL,50010240,127,14750489,'Lincoln MKZ','2010','Mazda','CX-7',1,17),(NULL,50010240,127,14750489,'Lincoln MKZ','2010','Toyota','Prius',1,17),(NULL,50010240,127,14750489,'Lincoln MKZ','2011','Ford','Fiesta',1,17),(NULL,50010240,127,14750489,'Lincoln MKZ','2012','Lexus','IS 250',1,17),(NULL,50010240,127,14750489,'Lincoln MKZ','2011','Ford','Escape',1,17),(NULL,50010240,127,14750489,'Lincoln MKZ','New','Nissan','Altima',1,17),(NULL,55010308,58,14750413,'Jeep Wrangler','2010','Chrysler','Town & Country',8,36),(NULL,55010308,58,14750413,'Jeep Wrangler','2013','Kia','Optima',8,36),(NULL,55010308,58,14750413,'Jeep Wrangler','New','Honda','Accord',8,36),(NULL,55010308,58,14750413,'Jeep Wrangler','2010','Mazda','Mazda6',7,36),(NULL,55010308,58,14750413,'Jeep Wrangler','2012','Dodge','Journey',7,36),(NULL,55010308,58,14750413,'Jeep Wrangler','2012','Ford','F-150',7,36),(NULL,55010308,58,14750413,'Jeep Wrangler','2013','Acura','ILX',7,36),(NULL,55010308,58,14750413,'Jeep Wrangler','2010','Nissan','Versa',7,36);
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
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stg_report_clienthitlist`
--

LOCK TABLES `stg_report_clienthitlist` WRITE;
/*!40000 ALTER TABLE `stg_report_clienthitlist` DISABLE KEYS */;
INSERT INTO `stg_report_clienthitlist` VALUES (1,198,'Washington, DC (Hagerstown, MD)','Infiniti','G37x',1634,1,NULL,NULL),(2,198,'Washington, DC (Hagerstown, MD)','Subaru','Forester',1137,2,NULL,NULL),(3,198,'Washington, DC (Hagerstown, MD)','Subaru','Impreza',1105,3,NULL,NULL),(4,198,'Washington, DC (Hagerstown, MD)','RAM','1500',938,4,NULL,NULL),(5,198,'Washington, DC (Hagerstown, MD)','Subaru','Outback',754,5,NULL,NULL),(6,185,'Tampa-St. Petersburg (Sarasota), FL','Honda','Accord',1007,1,NULL,NULL),(7,185,'Tampa-St. Petersburg (Sarasota), FL','Mazda','Mazda3',770,2,NULL,NULL),(8,185,'Tampa-St. Petersburg (Sarasota), FL','Chevrolet','Silverado 1500',735,3,NULL,NULL),(9,185,'Tampa-St. Petersburg (Sarasota), FL','Honda','CR-V',653,4,NULL,NULL),(10,185,'Tampa-St. Petersburg (Sarasota), FL','Ford','Mustang',649,5,NULL,NULL),(11,182,'St. Louis, MO','Honda','Accord',979,1,NULL,NULL),(12,182,'St. Louis, MO','Honda','Civic',559,2,NULL,NULL),(13,182,'St. Louis, MO','Nissan','Altima',546,3,NULL,NULL),(14,182,'St. Louis, MO','Honda','CR-V',535,4,NULL,NULL),(15,182,'St. Louis, MO','GMC','Terrain',490,5,NULL,NULL),(16,170,'Santa Barbara-Santa Maria-San Luis Obispo, CA','Volkswagen','Jetta',293,1,NULL,NULL),(17,170,'Santa Barbara-Santa Maria-San Luis Obispo, CA','Nissan','Altima',264,2,NULL,NULL),(18,170,'Santa Barbara-Santa Maria-San Luis Obispo, CA','Volkswagen','Beetle',221,3,NULL,NULL),(19,170,'Santa Barbara-Santa Maria-San Luis Obispo, CA','Volkswagen','Passat',217,4,NULL,NULL),(20,170,'Santa Barbara-Santa Maria-San Luis Obispo, CA','Nissan','Versa',128,5,NULL,NULL),(21,165,'Salt Lake City, UT','Nissan','Altima',564,1,NULL,NULL),(22,165,'Salt Lake City, UT','Mazda','Mazda3',562,2,NULL,NULL),(23,165,'Salt Lake City, UT','Nissan','Rogue',530,3,NULL,NULL),(24,165,'Salt Lake City, UT','Toyota','Tundra',396,4,NULL,NULL),(25,165,'Salt Lake City, UT','Mazda','CX-5',367,5,NULL,NULL),(26,146,'Peoria-Bloomington, IL','Nissan','Altima',597,1,NULL,NULL),(27,146,'Peoria-Bloomington, IL','Ford','F-150',362,2,NULL,NULL),(28,146,'Peoria-Bloomington, IL','Nissan','Rogue',281,3,NULL,NULL),(29,146,'Peoria-Bloomington, IL','Honda','Civic',245,4,NULL,NULL),(30,146,'Peoria-Bloomington, IL','Honda','CR-V',237,5,NULL,NULL),(31,139,'Omaha, NE','Hyundai','Santa Fe',512,1,NULL,NULL),(32,139,'Omaha, NE','Hyundai','Elantra',474,2,NULL,NULL),(33,139,'Omaha, NE','Chevrolet','Silverado 1500',414,3,NULL,NULL),(34,139,'Omaha, NE','Mitsubishi','Outlander',285,4,NULL,NULL),(35,139,'Omaha, NE','Hyundai','Sonata',273,5,NULL,NULL),(36,135,'Norfolk-Portsmouth-Newport News, VA','Jeep','Wrangler',457,1,NULL,NULL),(37,135,'Norfolk-Portsmouth-Newport News, VA','RAM','1500',397,2,NULL,NULL),(38,135,'Norfolk-Portsmouth-Newport News, VA','Chevrolet','Silverado 1500',376,3,NULL,NULL),(39,135,'Norfolk-Portsmouth-Newport News, VA','Honda','Accord',328,4,NULL,NULL),(40,135,'Norfolk-Portsmouth-Newport News, VA','Chevrolet','Camaro',290,5,NULL,NULL),(41,133,'New Orleans, LA','Honda','Accord',800,1,NULL,NULL),(42,133,'New Orleans, LA','Infiniti','QX60',637,2,NULL,NULL),(43,133,'New Orleans, LA','Honda','Civic',608,3,NULL,NULL),(44,133,'New Orleans, LA','Infiniti','Q50',551,4,NULL,NULL),(45,133,'New Orleans, LA','Nissan','Altima',461,5,NULL,NULL),(46,127,'Mobile, AL-Pensacola (Ft. Walton Beach), FL','Nissan','Altima',640,1,NULL,NULL),(47,127,'Mobile, AL-Pensacola (Ft. Walton Beach), FL','Hyundai','Santa Fe',592,2,NULL,NULL),(48,127,'Mobile, AL-Pensacola (Ft. Walton Beach), FL','Hyundai','Sonata',456,3,NULL,NULL),(49,127,'Mobile, AL-Pensacola (Ft. Walton Beach), FL','Toyota','4Runner',454,4,NULL,NULL),(50,127,'Mobile, AL-Pensacola (Ft. Walton Beach), FL','Toyota','Tundra',454,4,NULL,NULL),(51,88,'Houston, TX','Ford','F-150',11949,1,NULL,NULL),(52,88,'Houston, TX','Ford','F-250',2979,2,NULL,NULL),(53,88,'Houston, TX','Ford','Mustang',2607,3,NULL,NULL),(54,88,'Houston, TX','Ford','Fusion',1989,4,NULL,NULL),(55,88,'Houston, TX','Ford','Explorer',1954,5,NULL,NULL),(56,66,'Flint-Saginaw-Bay City, MI','Chevrolet','Silverado 1500',284,1,NULL,NULL),(57,66,'Flint-Saginaw-Bay City, MI','GMC','Sierra 1500',265,2,NULL,NULL),(58,66,'Flint-Saginaw-Bay City, MI','Chevrolet','Impala',188,3,NULL,NULL),(59,66,'Flint-Saginaw-Bay City, MI','Chevrolet','Equinox',187,4,NULL,NULL),(60,66,'Flint-Saginaw-Bay City, MI','Chevrolet','Silverado 2500',174,5,NULL,NULL),(61,58,'El Paso, TX','Hyundai','Sonata',307,1,NULL,NULL),(62,58,'El Paso, TX','Hyundai','Santa Fe',294,2,NULL,NULL),(63,58,'El Paso, TX','Hyundai','Elantra',281,3,NULL,NULL),(64,58,'El Paso, TX','Hyundai','Tucson',219,4,NULL,NULL),(65,58,'El Paso, TX','Hyundai','Accent',192,5,NULL,NULL),(66,42,'Cleveland-Akron (Canton), OH','Mazda','Mazda3',428,1,NULL,NULL),(67,42,'Cleveland-Akron (Canton), OH','Infiniti','QX60',423,2,NULL,NULL),(68,42,'Cleveland-Akron (Canton), OH','Ford','F-150',355,3,NULL,NULL),(69,42,'Cleveland-Akron (Canton), OH','Infiniti','Q50',325,4,NULL,NULL),(70,42,'Cleveland-Akron (Canton), OH','GMC','Sierra 1500',296,5,NULL,NULL),(71,38,'Chicago, IL','Mitsubishi','Outlander Sport',729,1,NULL,NULL),(72,38,'Chicago, IL','Jeep','Wrangler Unlimited',492,2,NULL,NULL),(73,38,'Chicago, IL','Mitsubishi','Outlander',487,3,NULL,NULL),(74,38,'Chicago, IL','Toyota','Camry',453,4,NULL,NULL),(75,38,'Chicago, IL','Hyundai','Santa Fe',449,5,NULL,NULL),(76,34,'Charlotte, NC','Honda','Civic',2656,1,NULL,NULL),(77,34,'Charlotte, NC','Honda','Accord',1734,2,NULL,NULL),(78,34,'Charlotte, NC','Honda','CR-V',1051,3,NULL,NULL),(79,34,'Charlotte, NC','Ford','F-150',745,4,NULL,NULL),(80,34,'Charlotte, NC','Volkswagen','Jetta',673,5,NULL,NULL),(81,31,'Champaign and Springfield-Decatur, IL','GMC','Sierra',248,1,NULL,NULL),(82,31,'Champaign and Springfield-Decatur, IL','GMC','Acadia',109,2,NULL,NULL),(83,31,'Champaign and Springfield-Decatur, IL','Nissan','Altima',106,3,NULL,NULL),(84,31,'Champaign and Springfield-Decatur, IL','GMC','Sierra 1500',101,4,NULL,NULL),(85,31,'Champaign and Springfield-Decatur, IL','Chevrolet','Malibu',97,5,NULL,NULL),(86,26,'Buffalo, NY','Nissan','Altima',444,1,NULL,NULL),(87,26,'Buffalo, NY','Nissan','Rogue',316,2,NULL,NULL),(88,26,'Buffalo, NY','Acura','RDX',197,3,NULL,NULL),(89,26,'Buffalo, NY','Nissan','Pathfinder',197,3,NULL,NULL),(90,26,'Buffalo, NY','Nissan','Sentra',122,5,NULL,NULL),(91,15,'Baton Rouge, LA','Nissan','Altima',644,1,NULL,NULL),(92,15,'Baton Rouge, LA','Infiniti','QX60',605,2,NULL,NULL),(93,15,'Baton Rouge, LA','Infiniti','Q50',572,3,NULL,NULL),(94,15,'Baton Rouge, LA','Subaru','Forester',492,4,NULL,NULL),(95,15,'Baton Rouge, LA','Nissan','Rogue',377,5,NULL,NULL),(96,11,'Austin, TX','Chevrolet','Silverado 1500',893,1,NULL,NULL),(97,11,'Austin, TX','Honda','Accord',575,2,NULL,NULL),(98,11,'Austin, TX','Honda','Civic',572,3,NULL,NULL),(99,11,'Austin, TX','RAM','1500',528,4,NULL,NULL),(100,11,'Austin, TX','GMC','Sierra 1500',524,5,NULL,NULL),(101,9,'Atlanta, GA','Ford','F-150',770,1,NULL,NULL),(102,9,'Atlanta, GA','Toyota','Camry',618,2,NULL,NULL),(103,9,'Atlanta, GA','Toyota','Corolla',580,3,NULL,NULL),(104,9,'Atlanta, GA','Kia','Optima',535,4,NULL,NULL),(105,9,'Atlanta, GA','Toyota','Tacoma',479,5,NULL,NULL),(106,2,'Albany-Schenectady-Troy, NY','Chevrolet','Silverado 1500',858,1,NULL,NULL),(107,2,'Albany-Schenectady-Troy, NY','Subaru','Impreza',462,2,NULL,NULL),(108,2,'Albany-Schenectady-Troy, NY','Subaru','Forester',418,3,NULL,NULL),(109,2,'Albany-Schenectady-Troy, NY','Chevrolet','Silverado 2500',397,4,NULL,NULL),(110,2,'Albany-Schenectady-Troy, NY','Chevrolet','Camaro',306,5,NULL,NULL);
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
INSERT INTO `stg_report_clientmodelmomentum` VALUES (92869,18,'Gastonia Nissan',18,2014,4,'Nissan Altima',22,45.36489,23),(92870,18,'Gastonia Nissan',18,2014,5,'Nissan Altima',31,46.38976,23),(92871,18,'Gastonia Nissan',19,2014,5,'Nissan Altima',75,51.208504,23),(92872,18,'Gastonia Nissan',20,2014,5,'Nissan Altima',79,51.63412,23),(92873,18,'Gastonia Nissan',21,2014,5,'Nissan Altima',83,52.084248,23),(92511,55,'Coast Nissan',18,2014,4,'Nissan Altima',13,46.10466,31),(92512,55,'Coast Nissan',18,2014,5,'Nissan Altima',22,49.166695,31),(92513,55,'Coast Nissan',19,2014,5,'Nissan Altima',33,52.703583,31),(92514,55,'Coast Nissan',20,2014,5,'Nissan Altima',49,57.351795,31),(92515,55,'Coast Nissan',21,2014,5,'Nissan Altima',34,52.174835,31),(90383,307,'Uftring Nissan',18,2014,4,'Nissan Altima',35,46.820606,29),(90384,307,'Uftring Nissan',18,2014,5,'Nissan Altima',26,45.468193,29),(90385,307,'Uftring Nissan',19,2014,5,'Nissan Altima',65,51.94576,29),(90386,307,'Uftring Nissan',20,2014,5,'Nissan Altima',57,50.61753,29),(90387,307,'Uftring Nissan',21,2014,5,'Nissan Altima',86,55.09948,29),(89939,334,'Lia Infiniti',18,2014,4,'Infiniti G37',37,45.00876,1),(89940,334,'Lia Infiniti',18,2014,5,'Infiniti G37',41,45.633873,1),(89941,334,'Lia Infiniti',19,2014,5,'Infiniti G37',75,50.757835,1),(89942,334,'Lia Infiniti',20,2014,5,'Infiniti G37',81,51.62432,1),(89943,334,'Lia Infiniti',21,2014,5,'Infiniti G37',89,52.81649,1),(85917,622,'Bommarito Infiniti',18,2014,4,'Infiniti G37',13,46.680943,34),(85918,622,'Bommarito Infiniti',18,2014,5,'Infiniti G37',30,48.77068,34),(85919,622,'Bommarito Infiniti',19,2014,5,'Infiniti G37',41,50.132607,34),(85920,622,'Bommarito Infiniti',20,2014,5,'Infiniti G37',46,50.773224,34),(85921,622,'Bommarito Infiniti',21,2014,5,'Infiniti G37',40,49.944077,34),(84808,708,'Clear Lake Nissan',18,2014,4,'Nissan Altima',102,45.52927,30),(84809,708,'Clear Lake Nissan',18,2014,5,'Nissan Altima',85,44.855267,30),(84810,708,'Clear Lake Nissan',19,2014,5,'Nissan Altima',153,48.161034,30),(84811,708,'Clear Lake Nissan',20,2014,5,'Nissan Altima',184,49.64309,30),(84812,708,'Clear Lake Nissan',21,2014,5,'Nissan Altima',357,57.02681,30),(78661,1060,'Kelly Nissan',18,2014,5,'Nissan Altima',31,51.71233,24),(78662,1060,'Kelly Nissan',18,2014,4,'Nissan Altima',23,51.71233,24),(78663,1060,'Kelly Nissan',19,2014,5,'Nissan Altima',55,51.71233,24),(78664,1060,'Kelly Nissan',20,2014,5,'Nissan Altima',58,51.71233,24),(78665,1060,'Kelly Nissan',21,2014,5,'Nissan Altima',70,51.71233,24),(77907,1095,'Sandy Sansing Nissan',18,2014,4,'Nissan Altima',32,60.625,32),(77908,1095,'Sandy Sansing Nissan',18,2014,5,'Nissan Altima',48,60.625,32),(77909,1095,'Sandy Sansing Nissan',19,2014,5,'Nissan Altima',84,60.625,32),(77910,1095,'Sandy Sansing Nissan',20,2014,5,'Nissan Altima',143,60.625,32),(77911,1095,'Sandy Sansing Nissan',21,2014,5,'Nissan Altima',87,60.625,32),(76678,1173,'Bommarito Nissan',18,2014,4,'Nissan Altima',3,44.491898,18),(76679,1173,'Bommarito Nissan',18,2014,5,'Nissan Altima',4,45.10069,18),(76680,1173,'Bommarito Nissan',19,2014,5,'Nissan Altima',8,47.57739,18),(76681,1173,'Bommarito Nissan',20,2014,5,'Nissan Altima',55,66.62808,18),(76682,1173,'Bommarito Nissan',21,2014,5,'Nissan Altima',93,74.649475,18),(68365,1763,'Apple Valley Toyota',18,2014,4,'Toyota Camry',5,43.706158,37),(68366,1763,'Apple Valley Toyota',18,2014,5,'Toyota Camry',11,46.541367,37),(68367,1763,'Apple Valley Toyota',19,2014,5,'Toyota Camry',12,47.02029,37),(68368,1763,'Apple Valley Toyota',20,2014,5,'Toyota Camry',24,52.51757,37),(68369,1763,'Apple Valley Toyota',21,2014,5,'Toyota Camry',16,48.876476,37),(48696,3908,'Howdy Honda',18,2014,4,'Honda Accord',87,45.987854,7),(48697,3908,'Howdy Honda',18,2014,5,'Honda Accord',111,47.564762,7),(48698,3908,'Howdy Honda',19,2014,5,'Honda Accord',176,51.67943,7),(48699,3908,'Howdy Honda',20,2014,5,'Honda Accord',197,52.96364,7),(48700,3908,'Howdy Honda',21,2014,5,'Honda Accord',26,42.95306,7),(43086,4598,'Gordon Chevrolet',18,2014,4,'Chevrolet Malibu',24,47.337498,19),(43087,4598,'Gordon Chevrolet',18,2014,5,'Chevrolet Malibu',27,47.95412,19),(43088,4598,'Gordon Chevrolet',19,2014,5,'Chevrolet Malibu',46,51.80319,19),(43089,4598,'Gordon Chevrolet',20,2014,5,'Chevrolet Malibu',61,54.654377,19),(43090,4598,'Gordon Chevrolet',21,2014,5,'Chevrolet Malibu',56,53.517876,19),(27365,7655,'Bommarito Honda',18,2014,4,'Honda Accord',47,45.744297,9),(27366,7655,'Bommarito Honda',18,2014,5,'Honda Accord',42,45.226566,9),(27367,7655,'Bommarito Honda',19,2014,5,'Honda Accord',72,48.959248,9),(27368,7655,'Bommarito Honda',20,2014,5,'Honda Accord',95,51.678104,9),(27369,7655,'Bommarito Honda',21,2014,5,'Honda Accord',112,53.643654,9),(25438,8732,'Stone Mountain Volkswagen',18,2014,4,'Volkswagen Passat',17,49.0267,22),(25439,8732,'Stone Mountain Volkswagen',18,2014,5,'Volkswagen Passat',30,50.762253,22),(25440,8732,'Stone Mountain Volkswagen',19,2014,5,'Volkswagen Passat',58,54.366226,22),(25441,8732,'Stone Mountain Volkswagen',20,2014,5,'Volkswagen Passat',120,61.147625,22),(25442,8732,'Stone Mountain Volkswagen',21,2014,5,'Volkswagen Passat',66,53.667168,22),(25289,8759,'S & K Buick Gmc',18,2014,4,'GMC Sierra',23,48.871162,10),(25290,8759,'S & K Buick Gmc',18,2014,5,'GMC Sierra',25,49.49154,10),(25291,8759,'S & K Buick Gmc',19,2014,5,'GMC Sierra',23,48.853176,10),(25292,8759,'S & K Buick Gmc',20,2014,5,'GMC Sierra',35,52.787994,10),(25293,8759,'S & K Buick Gmc',21,2014,5,'GMC Sierra',31,51.36935,10),(18247,2010289,'Ganley Honda',19,2014,5,'Honda Accord',65,58.385757,11),(18248,2010289,'Ganley Honda',20,2014,5,'Honda Accord',64,57.889973,11),(18249,2010289,'Ganley Honda',20,2014,5,'Honda Accord',64,57.889973,11),(18250,2010289,'Ganley Honda',21,2014,5,'Honda Accord',65,58.300636,11),(18251,2010289,'Ganley Honda',21,2014,5,'Honda Accord',65,58.300636,11),(16705,2260250,'Vic Canever Chevrolet',18,2014,4,'Chevrolet Silverado 1500',44,47.81336,12),(16706,2260250,'Vic Canever Chevrolet',18,2014,5,'Chevrolet Silverado 1500',54,48.877396,12),(16707,2260250,'Vic Canever Chevrolet',19,2014,5,'Chevrolet Silverado 1500',90,52.622444,12),(16708,2260250,'Vic Canever Chevrolet',20,2014,5,'Chevrolet Silverado 1500',89,52.507378,12),(16709,2260250,'Vic Canever Chevrolet',21,2014,5,'Chevrolet Silverado 1500',60,49.150856,12),(3613,39010241,'Mark Miller Toyota',18,2014,4,'Toyota Tacoma',31,45.95909,25),(3614,39010241,'Mark Miller Toyota',18,2014,5,'Toyota Tacoma',41,47.046436,25),(3615,39010241,'Mark Miller Toyota',19,2014,5,'Toyota Tacoma',54,48.497227,25),(3616,39010241,'Mark Miller Toyota',20,2014,5,'Toyota Tacoma',82,51.57461,25),(3617,39010241,'Mark Miller Toyota',21,2014,5,'Toyota Tacoma',90,52.44885,25),(3145,40260249,'Sid Dillon Buick Gmc Cadillac',18,2014,4,'GMC Sierra 1500',4,60.869564,33),(3146,40260249,'Sid Dillon Buick Gmc Cadillac',18,2014,5,'GMC Sierra 1500',7,60.869564,33),(3147,40260249,'Sid Dillon Buick Gmc Cadillac',19,2014,5,'GMC Sierra 1500',17,60.869564,33),(3148,40260249,'Sid Dillon Buick Gmc Cadillac',20,2014,5,'GMC Sierra 1500',19,60.869564,33),(3149,40260249,'Sid Dillon Buick Gmc Cadillac',21,2014,5,'GMC Sierra 1500',13,60.869564,33),(2348,45760244,'Loeber Motors',18,2014,4,'Porsche Cayenne',29,48.747154,NULL),(2349,45760244,'Loeber Motors',18,2014,5,'Porsche Cayenne',36,48.747154,NULL),(2350,45760244,'Loeber Motors',19,2014,5,'Porsche Cayenne',79,48.747154,NULL),(2351,45760244,'Loeber Motors',20,2014,5,'Porsche Cayenne',65,47.12858,NULL),(2352,45760244,'Loeber Motors',21,2014,5,'Porsche Cayenne',48,45.167416,NULL),(2269,46760240,'Priority Chevrolet ',18,2014,4,'Chevrolet Silverado 1500',6,100,21),(2270,46760240,'Priority Chevrolet ',18,2014,5,'Chevrolet Silverado 1500',64,100,21),(2271,46760240,'Priority Chevrolet ',19,2014,5,'Chevrolet Silverado 1500',94,100,21),(2272,46760240,'Priority Chevrolet ',20,2014,5,'Chevrolet Silverado 1500',114,100,21),(2273,46760240,'Priority Chevrolet ',21,2014,5,'Chevrolet Silverado 1500',131,100,21),(2233,48510243,'Northtown Automotive',19,2014,5,'Porsche 911 GT3',181,0,28),(2234,48510243,'Northtown Automotive',20,2014,5,'Porsche 911 GT3',73,0,28),(2235,48510243,'Northtown Automotive',21,2014,5,'Porsche 911 GT3',14,0,28),(1913,50010240,'Astro Lincoln - Mercury Inc.',18,2014,4,'Lincoln MKZ',4,54.83871,NULL),(1914,50010240,'Astro Lincoln - Mercury Inc.',18,2014,5,'Lincoln MKZ',3,54.83871,NULL),(1915,50010240,'Astro Lincoln - Mercury Inc.',19,2014,5,'Lincoln MKZ',8,54.83871,NULL),(1916,50010240,'Astro Lincoln - Mercury Inc.',20,2014,5,'Lincoln MKZ',5,54.83871,NULL),(1917,50010240,'Astro Lincoln - Mercury Inc.',21,2014,5,'Lincoln MKZ',6,54.83871,NULL),(982,55010308,'Jack Key Family Of Dealerships',18,2014,4,'Jeep Wrangler',8,63.414635,36),(983,55010308,'Jack Key Family Of Dealerships',18,2014,5,'Jeep Wrangler',8,63.414635,36),(984,55010308,'Jack Key Family Of Dealerships',19,2014,5,'Jeep Wrangler',17,63.414635,36),(985,55010308,'Jack Key Family Of Dealerships',20,2014,5,'Jeep Wrangler',15,63.414635,36),(986,55010308,'Jack Key Family Of Dealerships',21,2014,5,'Jeep Wrangler',22,63.414635,36);
/*!40000 ALTER TABLE `stg_report_clientmodelmomentum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stg_report_clientnewusedsplit`
--

DROP TABLE IF EXISTS `stg_report_clientnewusedsplit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stg_report_clientnewusedsplit` (
  `site_id` int(11) DEFAULT NULL,
  `NewVDP` varchar(45) DEFAULT NULL,
  `UsedVDP` varchar(45) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `row_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stg_report_clientnewusedsplit`
--

LOCK TABLES `stg_report_clientnewusedsplit` WRITE;
/*!40000 ALTER TABLE `stg_report_clientnewusedsplit` DISABLE KEYS */;
INSERT INTO `stg_report_clientnewusedsplit` VALUES (55,'0.347886029411765','0.652113970588235',31,NULL),(307,'0.585914297836233','0.414085702163767',29,NULL),(1060,'0.431712604521524','0.568287395478476',24,NULL),(8759,'0.271139063591894','0.728860936408106',10,NULL),(2260250,'0.254745254745255','0.745254745254745',12,NULL),(40260249,'0.354961832061069','0.645038167938931',33,NULL),(45760244,'0.338768504612744','0.661231495387256',35,NULL),(46760240,'0.352842388109833','0.647157611890167',21,NULL),(622,'0.607227488151659','0.392772511848341',34,NULL),(1095,'0.23216276477146','0.76783723522854',32,NULL),(7655,'0.485406258217197','0.514593741782803',9,NULL),(39010241,'0.389420813059174','0.610579186940826',25,NULL),(48510243,'0.159164733178654','0.840835266821346',28,NULL),(50010240,'0.355932203389831','0.644067796610169',17,NULL),(334,'0.172965453280779','0.827034546719221',1,NULL),(708,'0.543081433840916','0.456918566159084',30,NULL),(1763,'0.333333333333333','0.666666666666667',37,NULL),(3908,'0.384615384615385','0.615384615384615',7,NULL),(18,'0.503623188405797','0.496376811594203',23,NULL),(1173,'0.945853843241196','0.0541461567588035',18,NULL),(4598,'0.302660406885759','0.697339593114241',19,NULL),(8732,'0.733794295592048','0.266205704407952',22,NULL),(2010289,'0.782359679266896','0.217640320733104',11,NULL),(55010308,'0.305387830933581','0.694612169066419',36,NULL);
/*!40000 ALTER TABLE `stg_report_clientnewusedsplit` ENABLE KEYS */;
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
  `MonthID` int(11) DEFAULT NULL,
  PRIMARY KEY (`idstg_site_keyword`)
) ENGINE=MyISAM AUTO_INCREMENT=126 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stg_site_keyword`
--

LOCK TABLES `stg_site_keyword` WRITE;
/*!40000 ALTER TABLE `stg_site_keyword` DISABLE KEYS */;
INSERT INTO `stg_site_keyword` VALUES (1,36,55010308,'jack key',39,NULL),(2,36,55010308,'jack key motors',38,NULL),(3,36,55010308,'jackkeymotors.com',11,NULL),(4,36,55010308,'jack key auto group',11,NULL),(5,36,55010308,'jackkey.com',10,NULL),(6,17,50010240,'astro lincoln pensacola',23,NULL),(7,17,50010240,'astro lincoln',15,NULL),(8,17,50010240,'astro lincoln mercury',7,NULL),(9,17,50010240,'astro lincoln in pensacola',4,NULL),(10,17,50010240,'astro lincoln in pensacola fl',3,NULL),(11,28,48510243,'northtown auto',327,NULL),(12,28,48510243,'northtown',72,NULL),(13,28,48510243,'used cars buffalo ny',26,NULL),(14,28,48510243,'northtown automotive',20,NULL),(15,28,48510243,'northtowne',16,NULL),(16,21,46760240,'priority chevrolet',290,NULL),(17,21,46760240,'priority chevrolet chesapeake',37,NULL),(18,21,46760240,'priority chevy',21,NULL),(19,21,46760240,'priority chevrolet chesapeake va',19,NULL),(20,21,46760240,'http://www.prioritychevrolet.com/',17,NULL),(21,20,46510240,'henderson ford',19,NULL),(22,20,46510240,'craigslist',10,NULL),(23,20,46510240,'charlie henderson ford',8,NULL),(24,20,46510240,'henderson ford waveland ms',8,NULL),(25,20,46510240,'mr ford',4,NULL),(26,35,45760244,'loeber motors',158,NULL),(27,35,45760244,'porsche',33,NULL),(28,35,45760244,'porsche macan release date',33,NULL),(29,35,45760244,'http://www.loebermotors.com/blog/2014-mercedes-benz-cls550-chicago-il/',17,NULL),(30,35,45760244,'loeber mercedes',15,NULL),(31,33,40260249,'http://www.siddillonbuickgmc.com/',4,NULL),(32,33,40260249,'sid dillon',4,NULL),(33,33,40260249,'sid dillon fremont',3,NULL),(34,33,40260249,'sid dillion buick',2,NULL),(35,33,40260249,'sid dillon gmc',2,NULL),(36,25,39010241,'mark miller toyota',155,NULL),(37,25,39010241,'http://www.markmillertoyota.com/',17,NULL),(38,25,39010241,'mark miller toyota service',17,NULL),(39,25,39010241,'toyota salt lake city',17,NULL),(40,25,39010241,'toyota utah',10,NULL),(41,12,2260250,'vic canever chevrolet',80,NULL),(42,12,2260250,'vic canever',63,NULL),(43,12,2260250,'vic canever fenton',24,NULL),(44,12,2260250,'vic canaver fenton',9,NULL),(45,12,2260250,'canever chevrolet',7,NULL),(46,11,2010289,'ganley honda',196,NULL),(47,11,2010289,'ganley honda north olmsted',50,NULL),(48,11,2010289,'http://www.ganleyhonda.com/',12,NULL),(49,11,2010289,'honda north olmsted',11,NULL),(50,11,2010289,'sunnyside honda',11,NULL),(51,10,8759,'skbuick.com',11,NULL),(52,10,8759,'sk buick',7,NULL),(53,10,8759,'s and k pontiac',6,NULL),(54,10,8759,'s k pontiac',6,NULL),(55,10,8759,'skbuick',5,NULL),(56,22,8732,'stone mountain volkswagen',36,NULL),(57,22,8732,'stone mountain vw',33,NULL),(58,22,8732,'http://www.stonemountainvw.com/',9,NULL),(59,22,8732,'stone mountain volkswagon',6,NULL),(60,22,8732,'volkswagen stone mountain',6,NULL),(61,9,7655,'bommarito honda',204,NULL),(62,9,7655,'http://www.bommaritohonda.com/',23,NULL),(63,9,7655,'bommarito honda hazelwood',12,NULL),(64,9,7655,'st louis honda dealers',12,NULL),(65,9,7655,'honda st louis',8,NULL),(66,19,4598,'gordon chevrolet',246,NULL),(67,19,4598,'gordon chevy',21,NULL),(68,19,4598,'gordon chevrolet garden city mi',13,NULL),(69,19,4598,'http://www.gordonchevrolet.com/',12,NULL),(70,19,4598,'gordon chevrolet garden city',11,NULL),(71,7,3908,'howdy honda',498,NULL),(72,7,3908,'howdy honda austin',102,NULL),(73,7,3908,'honda austin',84,NULL),(74,7,3908,'http://www.howdyhonda.com/',36,NULL),(75,7,3908,'howdy honda used cars',23,NULL),(76,37,1763,'apple valley toyota',76,NULL),(77,37,1763,'apple valley toyota martinsburg wv',24,NULL),(78,37,1763,'apple valley toyota martinsburg',18,NULL),(79,37,1763,'kern toyota winchester va',8,NULL),(80,37,1763,'toyota martinsburg wv',8,NULL),(81,18,1173,'bommarito nissan',229,NULL),(82,18,1173,'http://www.bommaritonissan.com/',19,NULL),(83,18,1173,'bommarito nissan hazelwood mo',17,NULL),(84,18,1173,'bommarito',15,NULL),(85,18,1173,'nissan',12,NULL),(86,32,1095,'sandy sansing nissan',281,NULL),(87,32,1095,'nissan pensacola',29,NULL),(88,32,1095,'sandy sansing',23,NULL),(89,32,1095,'sandy sansing nissan pensacola',11,NULL),(90,32,1095,'nissan pensacola fl',10,NULL),(91,24,1060,'kelly nissan',98,NULL),(92,24,1060,'kelly nissan oak lawn',36,NULL),(93,24,1060,'bad credit auto loans',13,NULL),(94,24,1060,'kelly kean nissan',8,NULL),(95,24,1060,'http://www.kellynissan.com',8,NULL),(96,30,708,'clear lake nissan',235,NULL),(97,30,708,'clearlake nissan',27,NULL),(98,30,708,'nissan clear lake',24,NULL),(99,30,708,'nissan',17,NULL),(100,30,708,'http://www.clearlakenissan.com/',10,NULL),(101,34,622,'bommarito infiniti',55,NULL),(102,34,622,'bommarito infinity',12,NULL),(103,34,622,'st louis infiniti',5,NULL),(104,34,622,'infiniti st louis',4,NULL),(105,34,622,'infiniti',4,NULL),(106,1,334,'lia infiniti',82,NULL),(107,1,334,'lia infiniti of latham',19,NULL),(108,1,334,'infiniti',17,NULL),(109,1,334,'lia infinity',16,NULL),(110,1,334,'lia infiniti of latham latham ny',9,NULL),(111,29,307,'uftring nissan',33,NULL),(112,29,307,'nissan peoria il',9,NULL),(113,29,307,'http://www.uftringnissan.net/',5,NULL),(114,29,307,'uftring nissan peoria il',5,NULL),(115,29,307,'uftring nissan peoria',4,NULL),(116,31,55,'coast nissan',49,NULL),(117,31,55,'nissan san luis obispo',16,NULL),(118,31,55,'coast nissan san luis obispo',11,NULL),(119,31,55,'coast nissan in san luis obispo',9,NULL),(120,31,55,'san luis obispo nissan',7,NULL),(121,23,18,'gastonia nissan',141,NULL),(122,23,18,'nissan of gastonia',37,NULL),(123,23,18,'nissan gastonia',37,NULL),(124,23,18,'gastonia nissan gastonia nc',19,NULL),(125,23,18,'nissan',9,NULL);
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

-- Dump completed on 2014-06-23  9:09:47
