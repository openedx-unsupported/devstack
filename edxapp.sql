-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: localhost    Database: edxapp
-- ------------------------------------------------------
-- Server version	5.7.35

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
-- Current Database: `edxapp`
--

/*!40000 DROP DATABASE IF EXISTS `edxapp`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `edxapp` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `edxapp`;

--
-- Table structure for table `agreements_integritysignature`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agreements_integritysignature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_key` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `agreements_integritysignature_user_id_course_key_80bb4165_uniq` (`user_id`,`course_key`),
  KEY `agreements_integritysignature_course_key_0536c1fa` (`course_key`),
  CONSTRAINT `agreements_integritysignature_user_id_a4d26f65_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agreements_integritysignature`
--

LOCK TABLES `agreements_integritysignature` WRITE;
/*!40000 ALTER TABLE `agreements_integritysignature` DISABLE KEYS */;
/*!40000 ALTER TABLE `agreements_integritysignature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements_announcement`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements_announcement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements_announcement`
--

LOCK TABLES `announcements_announcement` WRITE;
/*!40000 ALTER TABLE `announcements_announcement` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements_announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_admin_apiaccessconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_admin_apiaccessconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_admin_apiaccessconfig_changed_by_id_d2f4cd88_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `api_admin_apiaccessconfig_changed_by_id_d2f4cd88_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_admin_apiaccessconfig`
--

LOCK TABLES `api_admin_apiaccessconfig` WRITE;
/*!40000 ALTER TABLE `api_admin_apiaccessconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_admin_apiaccessconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_admin_apiaccessrequest`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_admin_apiaccessrequest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `status` varchar(255) NOT NULL,
  `website` varchar(200) NOT NULL,
  `reason` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_address` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `contacted` tinyint(1) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_admin_apiaccessrequest_user_id_eb0cc217_uniq` (`user_id`),
  KEY `api_admin_apiaccessrequest_status_f8039aea` (`status`),
  KEY `api_admin_apiaccessrequest_site_id_b78f5161_fk_django_site_id` (`site_id`),
  CONSTRAINT `api_admin_apiaccessrequest_site_id_b78f5161_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`),
  CONSTRAINT `api_admin_apiaccessrequest_user_id_eb0cc217_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_admin_apiaccessrequest`
--

LOCK TABLES `api_admin_apiaccessrequest` WRITE;
/*!40000 ALTER TABLE `api_admin_apiaccessrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_admin_apiaccessrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_assessment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_assessment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submission_uuid` varchar(128) NOT NULL,
  `scored_at` datetime(6) NOT NULL,
  `scorer_id` varchar(40) NOT NULL,
  `score_type` varchar(2) NOT NULL,
  `feedback` longtext NOT NULL,
  `rubric_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assessment_assessment_submission_uuid_cf5817c5` (`submission_uuid`),
  KEY `assessment_assessment_scored_at_a1a213d6` (`scored_at`),
  KEY `assessment_assessment_scorer_id_ad1a38cb` (`scorer_id`),
  KEY `assessment_assessment_rubric_id_2ed0d5db_fk_assessment_rubric_id` (`rubric_id`),
  CONSTRAINT `assessment_assessment_rubric_id_2ed0d5db_fk_assessment_rubric_id` FOREIGN KEY (`rubric_id`) REFERENCES `assessment_rubric` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_assessment`
--

LOCK TABLES `assessment_assessment` WRITE;
/*!40000 ALTER TABLE `assessment_assessment` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_assessment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_assessmentfeedback`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_assessmentfeedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submission_uuid` varchar(128) NOT NULL,
  `feedback_text` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `submission_uuid` (`submission_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_assessmentfeedback`
--

LOCK TABLES `assessment_assessmentfeedback` WRITE;
/*!40000 ALTER TABLE `assessment_assessmentfeedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_assessmentfeedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_assessmentfeedback_assessments`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_assessmentfeedback_assessments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assessmentfeedback_id` int(11) NOT NULL,
  `assessment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assessment_assessmentfee_assessmentfeedback_id_as_f8246578_uniq` (`assessmentfeedback_id`,`assessment_id`),
  KEY `assessment_assessmen_assessment_id_033f1121_fk_assessmen` (`assessment_id`),
  CONSTRAINT `assessment_assessmen_assessment_id_033f1121_fk_assessmen` FOREIGN KEY (`assessment_id`) REFERENCES `assessment_assessment` (`id`),
  CONSTRAINT `assessment_assessmen_assessmentfeedback_i_6634a3b4_fk_assessmen` FOREIGN KEY (`assessmentfeedback_id`) REFERENCES `assessment_assessmentfeedback` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_assessmentfeedback_assessments`
--

LOCK TABLES `assessment_assessmentfeedback_assessments` WRITE;
/*!40000 ALTER TABLE `assessment_assessmentfeedback_assessments` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_assessmentfeedback_assessments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_assessmentfeedback_options`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_assessmentfeedback_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assessmentfeedback_id` int(11) NOT NULL,
  `assessmentfeedbackoption_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assessment_assessmentfee_assessmentfeedback_id_as_4e554cc7_uniq` (`assessmentfeedback_id`,`assessmentfeedbackoption_id`),
  KEY `assessment_assessmen_assessmentfeedbackop_a9af45f6_fk_assessmen` (`assessmentfeedbackoption_id`),
  CONSTRAINT `assessment_assessmen_assessmentfeedback_i_004e1bf0_fk_assessmen` FOREIGN KEY (`assessmentfeedback_id`) REFERENCES `assessment_assessmentfeedback` (`id`),
  CONSTRAINT `assessment_assessmen_assessmentfeedbackop_a9af45f6_fk_assessmen` FOREIGN KEY (`assessmentfeedbackoption_id`) REFERENCES `assessment_assessmentfeedbackoption` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_assessmentfeedback_options`
--

LOCK TABLES `assessment_assessmentfeedback_options` WRITE;
/*!40000 ALTER TABLE `assessment_assessmentfeedback_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_assessmentfeedback_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_assessmentfeedbackoption`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_assessmentfeedbackoption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `text` (`text`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_assessmentfeedbackoption`
--

LOCK TABLES `assessment_assessmentfeedbackoption` WRITE;
/*!40000 ALTER TABLE `assessment_assessmentfeedbackoption` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_assessmentfeedbackoption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_assessmentpart`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_assessmentpart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback` longtext NOT NULL,
  `assessment_id` int(11) NOT NULL,
  `criterion_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assessment_assessmen_assessment_id_de1999cd_fk_assessmen` (`assessment_id`),
  KEY `assessment_assessmen_criterion_id_5bc40925_fk_assessmen` (`criterion_id`),
  KEY `assessment_assessmen_option_id_dd35c2c5_fk_assessmen` (`option_id`),
  CONSTRAINT `assessment_assessmen_assessment_id_de1999cd_fk_assessmen` FOREIGN KEY (`assessment_id`) REFERENCES `assessment_assessment` (`id`),
  CONSTRAINT `assessment_assessmen_criterion_id_5bc40925_fk_assessmen` FOREIGN KEY (`criterion_id`) REFERENCES `assessment_criterion` (`id`),
  CONSTRAINT `assessment_assessmen_option_id_dd35c2c5_fk_assessmen` FOREIGN KEY (`option_id`) REFERENCES `assessment_criterionoption` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_assessmentpart`
--

LOCK TABLES `assessment_assessmentpart` WRITE;
/*!40000 ALTER TABLE `assessment_assessmentpart` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_assessmentpart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_criterion`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_criterion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `label` varchar(100) NOT NULL,
  `order_num` int(10) unsigned NOT NULL,
  `prompt` longtext NOT NULL,
  `rubric_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assessment_criterion_rubric_id_fe236962_fk_assessment_rubric_id` (`rubric_id`),
  CONSTRAINT `assessment_criterion_rubric_id_fe236962_fk_assessment_rubric_id` FOREIGN KEY (`rubric_id`) REFERENCES `assessment_rubric` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_criterion`
--

LOCK TABLES `assessment_criterion` WRITE;
/*!40000 ALTER TABLE `assessment_criterion` DISABLE KEYS */;
INSERT INTO `assessment_criterion` VALUES (1,'Content','Content',0,'Did the response describe a meal and did it describe why someone should chose to eat it?',1),(2,'Organization & Clarity','Organization & Clarity',1,'How well did the response use language?',1),(3,'Persuasiveness','Persuasiveness',2,'How well did the response convince you to try the meal that it describes?',1);
/*!40000 ALTER TABLE `assessment_criterion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_criterionoption`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_criterionoption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_num` int(10) unsigned NOT NULL,
  `points` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `label` varchar(100) NOT NULL,
  `explanation` longtext NOT NULL,
  `criterion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assessment_criterion_criterion_id_53928be7_fk_assessmen` (`criterion_id`),
  CONSTRAINT `assessment_criterion_criterion_id_53928be7_fk_assessmen` FOREIGN KEY (`criterion_id`) REFERENCES `assessment_criterion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_criterionoption`
--

LOCK TABLES `assessment_criterionoption` WRITE;
/*!40000 ALTER TABLE `assessment_criterionoption` DISABLE KEYS */;
INSERT INTO `assessment_criterionoption` VALUES (1,0,0,'Off Topic','Off Topic','The essay is off-topic or does not answer all or part of the question.',1),(2,1,5,'No Explanation','No Explanation','A meal is described, but no argument is made to persuade the reader to try it.',1),(3,2,5,'Unclear recommendation','Unclear recommendation','A meal is not described, but an argument is made to persuade the reader to try it.',1),(4,3,10,'Persuasive recommendation','Persuasive recommendation','The essay give a good description of the meal and provides supporting reasons for trying the meal.',1),(5,0,0,'Confusing','Confusing','It is difficult to identify the argument and main idea.',2),(6,1,1,'Basic Structure','Basic Structure','The essay provides a main idea. Additional details are provided, and some support the main idea.',2),(7,2,2,'Clear Structure','Clear Structure','The essay provides a clear main idea supported by specific details.',2),(8,3,3,'Complete Structure','Complete Structure','The essay has a complete structure: an introduction, statement of main idea, supporting details and summary.',2),(9,0,0,'Unconvincing','Unconvincing','The author did not present a persuasive argument, and I have no interest in trying this meal.',3),(10,1,2,'Interesting','Interesting','The author’s argument was somewhat persuarsive. I need more information to consider trying this meal.',3),(11,2,4,'Persuasive','Persuasive','The author’s argument was persuasive, and I will consider trying the meal.',3),(12,3,6,'Inspiring','Inspiring','The author presented an exceptionally strong case and has convinced me to try the meal.',3);
/*!40000 ALTER TABLE `assessment_criterionoption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_historicalsharedfileupload`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_historicalsharedfileupload` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `team_id` varchar(255) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `owner_id` varchar(255) NOT NULL,
  `file_key` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `size` bigint(20) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `assessment_historica_history_user_id_28fa87d9_fk_auth_user` (`history_user_id`),
  KEY `assessment_historicalsharedfileupload_id_34052991` (`id`),
  KEY `assessment_historicalsharedfileupload_team_id_e32268e1` (`team_id`),
  KEY `assessment_historicalsharedfileupload_course_id_7fd70b9d` (`course_id`),
  KEY `assessment_historicalsharedfileupload_item_id_b7bca199` (`item_id`),
  KEY `assessment_historicalsharedfileupload_owner_id_09b09e30` (`owner_id`),
  KEY `assessment_historicalsharedfileupload_file_key_03fbd3e7` (`file_key`),
  CONSTRAINT `assessment_historica_history_user_id_28fa87d9_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_historicalsharedfileupload`
--

LOCK TABLES `assessment_historicalsharedfileupload` WRITE;
/*!40000 ALTER TABLE `assessment_historicalsharedfileupload` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_historicalsharedfileupload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_peerworkflow`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_peerworkflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(40) NOT NULL,
  `item_id` varchar(128) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `submission_uuid` varchar(128) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `completed_at` datetime(6) DEFAULT NULL,
  `grading_completed_at` datetime(6) DEFAULT NULL,
  `cancelled_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `submission_uuid` (`submission_uuid`),
  KEY `assessment_peerworkflow_student_id_9382ae54` (`student_id`),
  KEY `assessment_peerworkflow_item_id_c17d799e` (`item_id`),
  KEY `assessment_peerworkflow_course_id_875599e3` (`course_id`),
  KEY `assessment_peerworkflow_created_at_b8aaf4a5` (`created_at`),
  KEY `assessment_peerworkflow_completed_at_681f19e1` (`completed_at`),
  KEY `assessment_peerworkflow_grading_completed_at_33e2560c` (`grading_completed_at`),
  KEY `assessment_peerworkflow_cancelled_at_0e258929` (`cancelled_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_peerworkflow`
--

LOCK TABLES `assessment_peerworkflow` WRITE;
/*!40000 ALTER TABLE `assessment_peerworkflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_peerworkflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_peerworkflowitem`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_peerworkflowitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submission_uuid` varchar(128) NOT NULL,
  `started_at` datetime(6) NOT NULL,
  `scored` tinyint(1) NOT NULL,
  `assessment_id` int(11) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `scorer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assessment_peerworkf_assessment_id_27f9ef1f_fk_assessmen` (`assessment_id`),
  KEY `assessment_peerworkf_author_id_0e3ed804_fk_assessmen` (`author_id`),
  KEY `assessment_peerworkf_scorer_id_27e47cd4_fk_assessmen` (`scorer_id`),
  KEY `assessment_peerworkflowitem_submission_uuid_edd446aa` (`submission_uuid`),
  KEY `assessment_peerworkflowitem_started_at_8644e7a0` (`started_at`),
  CONSTRAINT `assessment_peerworkf_assessment_id_27f9ef1f_fk_assessmen` FOREIGN KEY (`assessment_id`) REFERENCES `assessment_assessment` (`id`),
  CONSTRAINT `assessment_peerworkf_author_id_0e3ed804_fk_assessmen` FOREIGN KEY (`author_id`) REFERENCES `assessment_peerworkflow` (`id`),
  CONSTRAINT `assessment_peerworkf_scorer_id_27e47cd4_fk_assessmen` FOREIGN KEY (`scorer_id`) REFERENCES `assessment_peerworkflow` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_peerworkflowitem`
--

LOCK TABLES `assessment_peerworkflowitem` WRITE;
/*!40000 ALTER TABLE `assessment_peerworkflowitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_peerworkflowitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_rubric`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_rubric` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_hash` varchar(40) NOT NULL,
  `structure_hash` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_hash` (`content_hash`),
  KEY `assessment_rubric_structure_hash_fb456373` (`structure_hash`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_rubric`
--

LOCK TABLES `assessment_rubric` WRITE;
/*!40000 ALTER TABLE `assessment_rubric` DISABLE KEYS */;
INSERT INTO `assessment_rubric` VALUES (1,'b2783932b715f500b0af5f2e0d80757e54301353','ab95e8c199881793b6999c5efb1a5754fd7417d5');
/*!40000 ALTER TABLE `assessment_rubric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_sharedfileupload`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_sharedfileupload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `team_id` varchar(255) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `owner_id` varchar(255) NOT NULL,
  `file_key` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `size` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `file_key` (`file_key`),
  KEY `assessment_sharedfileupload_team_id_dbdd3cb7` (`team_id`),
  KEY `assessment_sharedfileupload_course_id_73edb775` (`course_id`),
  KEY `assessment_sharedfileupload_item_id_b471d0c9` (`item_id`),
  KEY `assessment_sharedfileupload_owner_id_f4d7fe4f` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_sharedfileupload`
--

LOCK TABLES `assessment_sharedfileupload` WRITE;
/*!40000 ALTER TABLE `assessment_sharedfileupload` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_sharedfileupload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_staffworkflow`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_staffworkflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scorer_id` varchar(40) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `item_id` varchar(128) NOT NULL,
  `submission_uuid` varchar(128) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `grading_completed_at` datetime(6) DEFAULT NULL,
  `grading_started_at` datetime(6) DEFAULT NULL,
  `cancelled_at` datetime(6) DEFAULT NULL,
  `assessment` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `submission_uuid` (`submission_uuid`),
  KEY `assessment_staffworkflow_scorer_id_ae799ebc` (`scorer_id`),
  KEY `assessment_staffworkflow_course_id_3f18693d` (`course_id`),
  KEY `assessment_staffworkflow_item_id_4fa3697b` (`item_id`),
  KEY `assessment_staffworkflow_created_at_a253bc02` (`created_at`),
  KEY `assessment_staffworkflow_grading_completed_at_acd0199f` (`grading_completed_at`),
  KEY `assessment_staffworkflow_grading_started_at_90f99005` (`grading_started_at`),
  KEY `assessment_staffworkflow_cancelled_at_bc8f93d5` (`cancelled_at`),
  KEY `assessment_staffworkflow_assessment_7c1dcc5d` (`assessment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_staffworkflow`
--

LOCK TABLES `assessment_staffworkflow` WRITE;
/*!40000 ALTER TABLE `assessment_staffworkflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_staffworkflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_studenttrainingworkflow`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_studenttrainingworkflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submission_uuid` varchar(128) NOT NULL,
  `student_id` varchar(40) NOT NULL,
  `item_id` varchar(128) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `submission_uuid` (`submission_uuid`),
  KEY `assessment_studenttrainingworkflow_student_id_ea8fdfa8` (`student_id`),
  KEY `assessment_studenttrainingworkflow_item_id_f5812a25` (`item_id`),
  KEY `assessment_studenttrainingworkflow_course_id_a14d6cde` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_studenttrainingworkflow`
--

LOCK TABLES `assessment_studenttrainingworkflow` WRITE;
/*!40000 ALTER TABLE `assessment_studenttrainingworkflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_studenttrainingworkflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_studenttrainingworkflowitem`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_studenttrainingworkflowitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_num` int(10) unsigned NOT NULL,
  `started_at` datetime(6) NOT NULL,
  `completed_at` datetime(6) DEFAULT NULL,
  `training_example_id` int(11) NOT NULL,
  `workflow_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assessment_studenttraini_workflow_id_order_num_1ab60238_uniq` (`workflow_id`,`order_num`),
  KEY `assessment_studenttr_training_example_id_881dddbd_fk_assessmen` (`training_example_id`),
  CONSTRAINT `assessment_studenttr_training_example_id_881dddbd_fk_assessmen` FOREIGN KEY (`training_example_id`) REFERENCES `assessment_trainingexample` (`id`),
  CONSTRAINT `assessment_studenttr_workflow_id_a75a9a2e_fk_assessmen` FOREIGN KEY (`workflow_id`) REFERENCES `assessment_studenttrainingworkflow` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_studenttrainingworkflowitem`
--

LOCK TABLES `assessment_studenttrainingworkflowitem` WRITE;
/*!40000 ALTER TABLE `assessment_studenttrainingworkflowitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_studenttrainingworkflowitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_teamstaffworkflow`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_teamstaffworkflow` (
  `staffworkflow_ptr_id` int(11) NOT NULL,
  `team_submission_uuid` varchar(128) NOT NULL,
  PRIMARY KEY (`staffworkflow_ptr_id`),
  UNIQUE KEY `team_submission_uuid` (`team_submission_uuid`),
  CONSTRAINT `assessment_teamstaff_staffworkflow_ptr_id_e55a780c_fk_assessmen` FOREIGN KEY (`staffworkflow_ptr_id`) REFERENCES `assessment_staffworkflow` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_teamstaffworkflow`
--

LOCK TABLES `assessment_teamstaffworkflow` WRITE;
/*!40000 ALTER TABLE `assessment_teamstaffworkflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_teamstaffworkflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_trainingexample`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_trainingexample` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `raw_answer` longtext NOT NULL,
  `content_hash` varchar(40) NOT NULL,
  `rubric_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_hash` (`content_hash`),
  KEY `assessment_traininge_rubric_id_cfb4afc3_fk_assessmen` (`rubric_id`),
  CONSTRAINT `assessment_traininge_rubric_id_cfb4afc3_fk_assessmen` FOREIGN KEY (`rubric_id`) REFERENCES `assessment_rubric` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_trainingexample`
--

LOCK TABLES `assessment_trainingexample` WRITE;
/*!40000 ALTER TABLE `assessment_trainingexample` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_trainingexample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_trainingexample_options_selected`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_trainingexample_options_selected` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trainingexample_id` int(11) NOT NULL,
  `criterionoption_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assessment_trainingexamp_trainingexample_id_crite_4b6b8b90_uniq` (`trainingexample_id`,`criterionoption_id`),
  KEY `assessment_traininge_criterionoption_id_de6716f1_fk_assessmen` (`criterionoption_id`),
  CONSTRAINT `assessment_traininge_criterionoption_id_de6716f1_fk_assessmen` FOREIGN KEY (`criterionoption_id`) REFERENCES `assessment_criterionoption` (`id`),
  CONSTRAINT `assessment_traininge_trainingexample_id_7a04b572_fk_assessmen` FOREIGN KEY (`trainingexample_id`) REFERENCES `assessment_trainingexample` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_trainingexample_options_selected`
--

LOCK TABLES `assessment_trainingexample_options_selected` WRITE;
/*!40000 ALTER TABLE `assessment_trainingexample_options_selected` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_trainingexample_options_selected` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_accountrecovery`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_accountrecovery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `secondary_email` varchar(254) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `secondary_email` (`secondary_email`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `auth_accountrecovery_user_id_0c61e73c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_accountrecovery`
--

LOCK TABLES `auth_accountrecovery` WRITE;
/*!40000 ALTER TABLE `auth_accountrecovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_accountrecovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'API Access Request Approvers');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1697 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',2,'add_permission'),(2,'Can change permission',2,'change_permission'),(3,'Can delete permission',2,'delete_permission'),(4,'Can view permission',2,'view_permission'),(5,'Can add group',3,'add_group'),(6,'Can change group',3,'change_group'),(7,'Can delete group',3,'delete_group'),(8,'Can view group',3,'view_group'),(9,'Can add user',4,'add_user'),(10,'Can change user',4,'change_user'),(11,'Can delete user',4,'delete_user'),(12,'Can view user',4,'view_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can view content type',5,'view_contenttype'),(17,'Can add redirect',6,'add_redirect'),(18,'Can change redirect',6,'change_redirect'),(19,'Can delete redirect',6,'delete_redirect'),(20,'Can view redirect',6,'view_redirect'),(21,'Can add session',7,'add_session'),(22,'Can change session',7,'change_session'),(23,'Can delete session',7,'delete_session'),(24,'Can view session',7,'view_session'),(25,'Can add site',8,'add_site'),(26,'Can change site',8,'change_site'),(27,'Can delete site',8,'delete_site'),(28,'Can view site',8,'view_site'),(29,'Can add task result',9,'add_taskresult'),(30,'Can change task result',9,'change_taskresult'),(31,'Can delete task result',9,'delete_taskresult'),(32,'Can view task result',9,'view_taskresult'),(33,'Can add chord counter',10,'add_chordcounter'),(34,'Can change chord counter',10,'change_chordcounter'),(35,'Can delete chord counter',10,'delete_chordcounter'),(36,'Can view chord counter',10,'view_chordcounter'),(37,'Can add Flag',11,'add_flag'),(38,'Can change Flag',11,'change_flag'),(39,'Can delete Flag',11,'delete_flag'),(40,'Can view Flag',11,'view_flag'),(41,'Can add Sample',12,'add_sample'),(42,'Can change Sample',12,'change_sample'),(43,'Can delete Sample',12,'delete_sample'),(44,'Can view Sample',12,'view_sample'),(45,'Can add Switch',13,'add_switch'),(46,'Can change Switch',13,'change_switch'),(47,'Can delete Switch',13,'delete_switch'),(48,'Can view Switch',13,'view_switch'),(49,'Can add course message',14,'add_coursemessage'),(50,'Can change course message',14,'change_coursemessage'),(51,'Can delete course message',14,'delete_coursemessage'),(52,'Can view course message',14,'view_coursemessage'),(53,'Can add global status message',15,'add_globalstatusmessage'),(54,'Can change global status message',15,'change_globalstatusmessage'),(55,'Can delete global status message',15,'delete_globalstatusmessage'),(56,'Can view global status message',15,'view_globalstatusmessage'),(57,'Can add asset base url config',16,'add_assetbaseurlconfig'),(58,'Can change asset base url config',16,'change_assetbaseurlconfig'),(59,'Can delete asset base url config',16,'delete_assetbaseurlconfig'),(60,'Can view asset base url config',16,'view_assetbaseurlconfig'),(61,'Can add asset excluded extensions config',17,'add_assetexcludedextensionsconfig'),(62,'Can change asset excluded extensions config',17,'change_assetexcludedextensionsconfig'),(63,'Can delete asset excluded extensions config',17,'delete_assetexcludedextensionsconfig'),(64,'Can view asset excluded extensions config',17,'view_assetexcludedextensionsconfig'),(65,'Can add course asset cache ttl config',18,'add_courseassetcachettlconfig'),(66,'Can change course asset cache ttl config',18,'change_courseassetcachettlconfig'),(67,'Can delete course asset cache ttl config',18,'delete_courseassetcachettlconfig'),(68,'Can view course asset cache ttl config',18,'view_courseassetcachettlconfig'),(69,'Can add cdn user agents config',19,'add_cdnuseragentsconfig'),(70,'Can change cdn user agents config',19,'change_cdnuseragentsconfig'),(71,'Can delete cdn user agents config',19,'delete_cdnuseragentsconfig'),(72,'Can view cdn user agents config',19,'view_cdnuseragentsconfig'),(73,'Can add site configuration',20,'add_siteconfiguration'),(74,'Can change site configuration',20,'change_siteconfiguration'),(75,'Can delete site configuration',20,'delete_siteconfiguration'),(76,'Can view site configuration',20,'view_siteconfiguration'),(77,'Can add site configuration history',21,'add_siteconfigurationhistory'),(78,'Can change site configuration history',21,'change_siteconfigurationhistory'),(79,'Can delete site configuration history',21,'delete_siteconfigurationhistory'),(80,'Can view site configuration history',21,'view_siteconfigurationhistory'),(81,'Can add course hls playback enabled flag',22,'add_coursehlsplaybackenabledflag'),(82,'Can change course hls playback enabled flag',22,'change_coursehlsplaybackenabledflag'),(83,'Can delete course hls playback enabled flag',22,'delete_coursehlsplaybackenabledflag'),(84,'Can view course hls playback enabled flag',22,'view_coursehlsplaybackenabledflag'),(85,'Can add hls playback enabled flag',23,'add_hlsplaybackenabledflag'),(86,'Can change hls playback enabled flag',23,'change_hlsplaybackenabledflag'),(87,'Can delete hls playback enabled flag',23,'delete_hlsplaybackenabledflag'),(88,'Can view hls playback enabled flag',23,'view_hlsplaybackenabledflag'),(89,'Can add course video transcript enabled flag',24,'add_coursevideotranscriptenabledflag'),(90,'Can change course video transcript enabled flag',24,'change_coursevideotranscriptenabledflag'),(91,'Can delete course video transcript enabled flag',24,'delete_coursevideotranscriptenabledflag'),(92,'Can view course video transcript enabled flag',24,'view_coursevideotranscriptenabledflag'),(93,'Can add video transcript enabled flag',25,'add_videotranscriptenabledflag'),(94,'Can change video transcript enabled flag',25,'change_videotranscriptenabledflag'),(95,'Can delete video transcript enabled flag',25,'delete_videotranscriptenabledflag'),(96,'Can view video transcript enabled flag',25,'view_videotranscriptenabledflag'),(97,'Can add transcript migration setting',26,'add_transcriptmigrationsetting'),(98,'Can change transcript migration setting',26,'change_transcriptmigrationsetting'),(99,'Can delete transcript migration setting',26,'delete_transcriptmigrationsetting'),(100,'Can view transcript migration setting',26,'view_transcriptmigrationsetting'),(101,'Can add migration enqueued course',27,'add_migrationenqueuedcourse'),(102,'Can change migration enqueued course',27,'change_migrationenqueuedcourse'),(103,'Can delete migration enqueued course',27,'delete_migrationenqueuedcourse'),(104,'Can view migration enqueued course',27,'view_migrationenqueuedcourse'),(105,'Can add updated course videos',28,'add_updatedcoursevideos'),(106,'Can change updated course videos',28,'change_updatedcoursevideos'),(107,'Can delete updated course videos',28,'delete_updatedcoursevideos'),(108,'Can view updated course videos',28,'view_updatedcoursevideos'),(109,'Can add video thumbnail setting',29,'add_videothumbnailsetting'),(110,'Can change video thumbnail setting',29,'change_videothumbnailsetting'),(111,'Can delete video thumbnail setting',29,'delete_videothumbnailsetting'),(112,'Can view video thumbnail setting',29,'view_videothumbnailsetting'),(113,'Can add course youtube blocked flag',30,'add_courseyoutubeblockedflag'),(114,'Can change course youtube blocked flag',30,'change_courseyoutubeblockedflag'),(115,'Can delete course youtube blocked flag',30,'delete_courseyoutubeblockedflag'),(116,'Can view course youtube blocked flag',30,'view_courseyoutubeblockedflag'),(117,'Can add course video uploads enabled by default',31,'add_coursevideouploadsenabledbydefault'),(118,'Can change course video uploads enabled by default',31,'change_coursevideouploadsenabledbydefault'),(119,'Can delete course video uploads enabled by default',31,'delete_coursevideouploadsenabledbydefault'),(120,'Can view course video uploads enabled by default',31,'view_coursevideouploadsenabledbydefault'),(121,'Can add video uploads enabled by default',32,'add_videouploadsenabledbydefault'),(122,'Can change video uploads enabled by default',32,'change_videouploadsenabledbydefault'),(123,'Can delete video uploads enabled by default',32,'delete_videouploadsenabledbydefault'),(124,'Can view video uploads enabled by default',32,'view_videouploadsenabledbydefault'),(125,'Can add vem pipeline integration',33,'add_vempipelineintegration'),(126,'Can change vem pipeline integration',33,'change_vempipelineintegration'),(127,'Can delete vem pipeline integration',33,'delete_vempipelineintegration'),(128,'Can view vem pipeline integration',33,'view_vempipelineintegration'),(129,'Can add offline computed grade',34,'add_offlinecomputedgrade'),(130,'Can change offline computed grade',34,'change_offlinecomputedgrade'),(131,'Can delete offline computed grade',34,'delete_offlinecomputedgrade'),(132,'Can view offline computed grade',34,'view_offlinecomputedgrade'),(133,'Can add offline computed grade log',35,'add_offlinecomputedgradelog'),(134,'Can change offline computed grade log',35,'change_offlinecomputedgradelog'),(135,'Can delete offline computed grade log',35,'delete_offlinecomputedgradelog'),(136,'Can view offline computed grade log',35,'view_offlinecomputedgradelog'),(137,'Can add student field override',36,'add_studentfieldoverride'),(138,'Can change student field override',36,'change_studentfieldoverride'),(139,'Can delete student field override',36,'delete_studentfieldoverride'),(140,'Can view student field override',36,'view_studentfieldoverride'),(141,'Can add student module',37,'add_studentmodule'),(142,'Can change student module',37,'change_studentmodule'),(143,'Can delete student module',37,'delete_studentmodule'),(144,'Can view student module',37,'view_studentmodule'),(145,'Can add student module history',38,'add_studentmodulehistory'),(146,'Can change student module history',38,'change_studentmodulehistory'),(147,'Can delete student module history',38,'delete_studentmodulehistory'),(148,'Can view student module history',38,'view_studentmodulehistory'),(149,'Can add x module student info field',39,'add_xmodulestudentinfofield'),(150,'Can change x module student info field',39,'change_xmodulestudentinfofield'),(151,'Can delete x module student info field',39,'delete_xmodulestudentinfofield'),(152,'Can view x module student info field',39,'view_xmodulestudentinfofield'),(153,'Can add x module student prefs field',40,'add_xmodulestudentprefsfield'),(154,'Can change x module student prefs field',40,'change_xmodulestudentprefsfield'),(155,'Can delete x module student prefs field',40,'delete_xmodulestudentprefsfield'),(156,'Can view x module student prefs field',40,'view_xmodulestudentprefsfield'),(157,'Can add x module user state summary field',41,'add_xmoduleuserstatesummaryfield'),(158,'Can change x module user state summary field',41,'change_xmoduleuserstatesummaryfield'),(159,'Can delete x module user state summary field',41,'delete_xmoduleuserstatesummaryfield'),(160,'Can view x module user state summary field',41,'view_xmoduleuserstatesummaryfield'),(161,'Can add course dynamic upgrade deadline configuration',42,'add_coursedynamicupgradedeadlineconfiguration'),(162,'Can change course dynamic upgrade deadline configuration',42,'change_coursedynamicupgradedeadlineconfiguration'),(163,'Can delete course dynamic upgrade deadline configuration',42,'delete_coursedynamicupgradedeadlineconfiguration'),(164,'Can view course dynamic upgrade deadline configuration',42,'view_coursedynamicupgradedeadlineconfiguration'),(165,'Can add dynamic upgrade deadline configuration',43,'add_dynamicupgradedeadlineconfiguration'),(166,'Can change dynamic upgrade deadline configuration',43,'change_dynamicupgradedeadlineconfiguration'),(167,'Can delete dynamic upgrade deadline configuration',43,'delete_dynamicupgradedeadlineconfiguration'),(168,'Can view dynamic upgrade deadline configuration',43,'view_dynamicupgradedeadlineconfiguration'),(169,'Can add org dynamic upgrade deadline configuration',44,'add_orgdynamicupgradedeadlineconfiguration'),(170,'Can change org dynamic upgrade deadline configuration',44,'change_orgdynamicupgradedeadlineconfiguration'),(171,'Can delete org dynamic upgrade deadline configuration',44,'delete_orgdynamicupgradedeadlineconfiguration'),(172,'Can view org dynamic upgrade deadline configuration',44,'view_orgdynamicupgradedeadlineconfiguration'),(173,'Can add student module history extended',45,'add_studentmodulehistoryextended'),(174,'Can change student module history extended',45,'change_studentmodulehistoryextended'),(175,'Can delete student module history extended',45,'delete_studentmodulehistoryextended'),(176,'Can view student module history extended',45,'view_studentmodulehistoryextended'),(177,'Can add anonymous user id',46,'add_anonymoususerid'),(178,'Can change anonymous user id',46,'change_anonymoususerid'),(179,'Can delete anonymous user id',46,'delete_anonymoususerid'),(180,'Can view anonymous user id',46,'view_anonymoususerid'),(181,'Can add course access role',47,'add_courseaccessrole'),(182,'Can change course access role',47,'change_courseaccessrole'),(183,'Can delete course access role',47,'delete_courseaccessrole'),(184,'Can view course access role',47,'view_courseaccessrole'),(185,'Can add course enrollment',48,'add_courseenrollment'),(186,'Can change course enrollment',48,'change_courseenrollment'),(187,'Can delete course enrollment',48,'delete_courseenrollment'),(188,'Can view course enrollment',48,'view_courseenrollment'),(189,'Can add course enrollment allowed',49,'add_courseenrollmentallowed'),(190,'Can change course enrollment allowed',49,'change_courseenrollmentallowed'),(191,'Can delete course enrollment allowed',49,'delete_courseenrollmentallowed'),(192,'Can view course enrollment allowed',49,'view_courseenrollmentallowed'),(193,'Can add course enrollment attribute',50,'add_courseenrollmentattribute'),(194,'Can change course enrollment attribute',50,'change_courseenrollmentattribute'),(195,'Can delete course enrollment attribute',50,'delete_courseenrollmentattribute'),(196,'Can view course enrollment attribute',50,'view_courseenrollmentattribute'),(197,'Can add dashboard configuration',51,'add_dashboardconfiguration'),(198,'Can change dashboard configuration',51,'change_dashboardconfiguration'),(199,'Can delete dashboard configuration',51,'delete_dashboardconfiguration'),(200,'Can view dashboard configuration',51,'view_dashboardconfiguration'),(201,'Can add enrollment refund configuration',52,'add_enrollmentrefundconfiguration'),(202,'Can change enrollment refund configuration',52,'change_enrollmentrefundconfiguration'),(203,'Can delete enrollment refund configuration',52,'delete_enrollmentrefundconfiguration'),(204,'Can view enrollment refund configuration',52,'view_enrollmentrefundconfiguration'),(205,'Can add entrance exam configuration',53,'add_entranceexamconfiguration'),(206,'Can change entrance exam configuration',53,'change_entranceexamconfiguration'),(207,'Can delete entrance exam configuration',53,'delete_entranceexamconfiguration'),(208,'Can view entrance exam configuration',53,'view_entranceexamconfiguration'),(209,'Can add language proficiency',54,'add_languageproficiency'),(210,'Can change language proficiency',54,'change_languageproficiency'),(211,'Can delete language proficiency',54,'delete_languageproficiency'),(212,'Can view language proficiency',54,'view_languageproficiency'),(213,'Can add linked in add to profile configuration',55,'add_linkedinaddtoprofileconfiguration'),(214,'Can change linked in add to profile configuration',55,'change_linkedinaddtoprofileconfiguration'),(215,'Can delete linked in add to profile configuration',55,'delete_linkedinaddtoprofileconfiguration'),(216,'Can view linked in add to profile configuration',55,'view_linkedinaddtoprofileconfiguration'),(217,'Can add Login Failure',56,'add_loginfailures'),(218,'Can change Login Failure',56,'change_loginfailures'),(219,'Can delete Login Failure',56,'delete_loginfailures'),(220,'Can view Login Failure',56,'view_loginfailures'),(221,'Can add manual enrollment audit',57,'add_manualenrollmentaudit'),(222,'Can change manual enrollment audit',57,'change_manualenrollmentaudit'),(223,'Can delete manual enrollment audit',57,'delete_manualenrollmentaudit'),(224,'Can view manual enrollment audit',57,'view_manualenrollmentaudit'),(225,'Can add pending email change',58,'add_pendingemailchange'),(226,'Can change pending email change',58,'change_pendingemailchange'),(227,'Can delete pending email change',58,'delete_pendingemailchange'),(228,'Can view pending email change',58,'view_pendingemailchange'),(229,'Can add pending name change',59,'add_pendingnamechange'),(230,'Can change pending name change',59,'change_pendingnamechange'),(231,'Can delete pending name change',59,'delete_pendingnamechange'),(232,'Can view pending name change',59,'view_pendingnamechange'),(233,'Can add registration',60,'add_registration'),(234,'Can change registration',60,'change_registration'),(235,'Can delete registration',60,'delete_registration'),(236,'Can view registration',60,'view_registration'),(237,'Can add user profile',61,'add_userprofile'),(238,'Can change user profile',61,'change_userprofile'),(239,'Can delete user profile',61,'delete_userprofile'),(240,'Can view user profile',61,'view_userprofile'),(241,'Can deactivate, but NOT delete users',61,'can_deactivate_users'),(242,'Can add user signup source',62,'add_usersignupsource'),(243,'Can change user signup source',62,'change_usersignupsource'),(244,'Can delete user signup source',62,'delete_usersignupsource'),(245,'Can view user signup source',62,'view_usersignupsource'),(246,'Can add user standing',63,'add_userstanding'),(247,'Can change user standing',63,'change_userstanding'),(248,'Can delete user standing',63,'delete_userstanding'),(249,'Can view user standing',63,'view_userstanding'),(250,'Can add user test group',64,'add_usertestgroup'),(251,'Can change user test group',64,'change_usertestgroup'),(252,'Can delete user test group',64,'delete_usertestgroup'),(253,'Can view user test group',64,'view_usertestgroup'),(254,'Can add user attribute',65,'add_userattribute'),(255,'Can change user attribute',65,'change_userattribute'),(256,'Can delete user attribute',65,'delete_userattribute'),(257,'Can view user attribute',65,'view_userattribute'),(258,'Can add registration cookie configuration',66,'add_registrationcookieconfiguration'),(259,'Can change registration cookie configuration',66,'change_registrationcookieconfiguration'),(260,'Can delete registration cookie configuration',66,'delete_registrationcookieconfiguration'),(261,'Can view registration cookie configuration',66,'view_registrationcookieconfiguration'),(262,'Can add social link',67,'add_sociallink'),(263,'Can change social link',67,'change_sociallink'),(264,'Can delete social link',67,'delete_sociallink'),(265,'Can view social link',67,'view_sociallink'),(266,'Can add account recovery',68,'add_accountrecovery'),(267,'Can change account recovery',68,'change_accountrecovery'),(268,'Can delete account recovery',68,'delete_accountrecovery'),(269,'Can view account recovery',68,'view_accountrecovery'),(270,'Can add pending secondary email change',69,'add_pendingsecondaryemailchange'),(271,'Can change pending secondary email change',69,'change_pendingsecondaryemailchange'),(272,'Can delete pending secondary email change',69,'delete_pendingsecondaryemailchange'),(273,'Can view pending secondary email change',69,'view_pendingsecondaryemailchange'),(274,'Can add historical course enrollment',70,'add_historicalcourseenrollment'),(275,'Can change historical course enrollment',70,'change_historicalcourseenrollment'),(276,'Can delete historical course enrollment',70,'delete_historicalcourseenrollment'),(277,'Can view historical course enrollment',70,'view_historicalcourseenrollment'),(278,'Can add bulk unenroll configuration',71,'add_bulkunenrollconfiguration'),(279,'Can change bulk unenroll configuration',71,'change_bulkunenrollconfiguration'),(280,'Can delete bulk unenroll configuration',71,'delete_bulkunenrollconfiguration'),(281,'Can view bulk unenroll configuration',71,'view_bulkunenrollconfiguration'),(282,'Can add fbe enrollment exclusion',72,'add_fbeenrollmentexclusion'),(283,'Can change fbe enrollment exclusion',72,'change_fbeenrollmentexclusion'),(284,'Can delete fbe enrollment exclusion',72,'delete_fbeenrollmentexclusion'),(285,'Can view fbe enrollment exclusion',72,'view_fbeenrollmentexclusion'),(286,'Can add allowed auth user',73,'add_allowedauthuser'),(287,'Can change allowed auth user',73,'change_allowedauthuser'),(288,'Can delete allowed auth user',73,'delete_allowedauthuser'),(289,'Can view allowed auth user',73,'view_allowedauthuser'),(290,'Can add historical manual enrollment audit',74,'add_historicalmanualenrollmentaudit'),(291,'Can change historical manual enrollment audit',74,'change_historicalmanualenrollmentaudit'),(292,'Can delete historical manual enrollment audit',74,'delete_historicalmanualenrollmentaudit'),(293,'Can view historical manual enrollment audit',74,'view_historicalmanualenrollmentaudit'),(294,'Can add account recovery configuration',75,'add_accountrecoveryconfiguration'),(295,'Can change account recovery configuration',75,'change_accountrecoveryconfiguration'),(296,'Can delete account recovery configuration',75,'delete_accountrecoveryconfiguration'),(297,'Can view account recovery configuration',75,'view_accountrecoveryconfiguration'),(298,'Can add course enrollment celebration',76,'add_courseenrollmentcelebration'),(299,'Can change course enrollment celebration',76,'change_courseenrollmentcelebration'),(300,'Can delete course enrollment celebration',76,'delete_courseenrollmentcelebration'),(301,'Can view course enrollment celebration',76,'view_courseenrollmentcelebration'),(302,'Can add bulk change enrollment configuration',77,'add_bulkchangeenrollmentconfiguration'),(303,'Can change bulk change enrollment configuration',77,'change_bulkchangeenrollmentconfiguration'),(304,'Can delete bulk change enrollment configuration',77,'delete_bulkchangeenrollmentconfiguration'),(305,'Can view bulk change enrollment configuration',77,'view_bulkchangeenrollmentconfiguration'),(306,'Can add user password toggle history',78,'add_userpasswordtogglehistory'),(307,'Can change user password toggle history',78,'change_userpasswordtogglehistory'),(308,'Can delete user password toggle history',78,'delete_userpasswordtogglehistory'),(309,'Can view user password toggle history',78,'view_userpasswordtogglehistory'),(310,'Can add user celebration',79,'add_usercelebration'),(311,'Can change user celebration',79,'change_usercelebration'),(312,'Can delete user celebration',79,'delete_usercelebration'),(313,'Can view user celebration',79,'view_usercelebration'),(314,'Can add rate limit configuration',80,'add_ratelimitconfiguration'),(315,'Can change rate limit configuration',80,'change_ratelimitconfiguration'),(316,'Can delete rate limit configuration',80,'delete_ratelimitconfiguration'),(317,'Can view rate limit configuration',80,'view_ratelimitconfiguration'),(318,'Can add certificate generation configuration',81,'add_certificategenerationconfiguration'),(319,'Can change certificate generation configuration',81,'change_certificategenerationconfiguration'),(320,'Can delete certificate generation configuration',81,'delete_certificategenerationconfiguration'),(321,'Can view certificate generation configuration',81,'view_certificategenerationconfiguration'),(322,'Can add certificate generation course setting',82,'add_certificategenerationcoursesetting'),(323,'Can change certificate generation course setting',82,'change_certificategenerationcoursesetting'),(324,'Can delete certificate generation course setting',82,'delete_certificategenerationcoursesetting'),(325,'Can view certificate generation course setting',82,'view_certificategenerationcoursesetting'),(326,'Can add certificate html view configuration',83,'add_certificatehtmlviewconfiguration'),(327,'Can change certificate html view configuration',83,'change_certificatehtmlviewconfiguration'),(328,'Can delete certificate html view configuration',83,'delete_certificatehtmlviewconfiguration'),(329,'Can view certificate html view configuration',83,'view_certificatehtmlviewconfiguration'),(330,'Can add certificate template',84,'add_certificatetemplate'),(331,'Can change certificate template',84,'change_certificatetemplate'),(332,'Can delete certificate template',84,'delete_certificatetemplate'),(333,'Can view certificate template',84,'view_certificatetemplate'),(334,'Can add certificate template asset',85,'add_certificatetemplateasset'),(335,'Can change certificate template asset',85,'change_certificatetemplateasset'),(336,'Can delete certificate template asset',85,'delete_certificatetemplateasset'),(337,'Can view certificate template asset',85,'view_certificatetemplateasset'),(338,'Can add example certificate',86,'add_examplecertificate'),(339,'Can change example certificate',86,'change_examplecertificate'),(340,'Can delete example certificate',86,'delete_examplecertificate'),(341,'Can view example certificate',86,'view_examplecertificate'),(342,'Can add example certificate set',87,'add_examplecertificateset'),(343,'Can change example certificate set',87,'change_examplecertificateset'),(344,'Can delete example certificate set',87,'delete_examplecertificateset'),(345,'Can view example certificate set',87,'view_examplecertificateset'),(346,'Can add generated certificate',88,'add_generatedcertificate'),(347,'Can change generated certificate',88,'change_generatedcertificate'),(348,'Can delete generated certificate',88,'delete_generatedcertificate'),(349,'Can view generated certificate',88,'view_generatedcertificate'),(350,'Can add certificate generation history',89,'add_certificategenerationhistory'),(351,'Can change certificate generation history',89,'change_certificategenerationhistory'),(352,'Can delete certificate generation history',89,'delete_certificategenerationhistory'),(353,'Can view certificate generation history',89,'view_certificategenerationhistory'),(354,'Can add certificate invalidation',90,'add_certificateinvalidation'),(355,'Can change certificate invalidation',90,'change_certificateinvalidation'),(356,'Can delete certificate invalidation',90,'delete_certificateinvalidation'),(357,'Can view certificate invalidation',90,'view_certificateinvalidation'),(358,'Can add historical generated certificate',91,'add_historicalgeneratedcertificate'),(359,'Can change historical generated certificate',91,'change_historicalgeneratedcertificate'),(360,'Can delete historical generated certificate',91,'delete_historicalgeneratedcertificate'),(361,'Can view historical generated certificate',91,'view_historicalgeneratedcertificate'),(362,'Can add historical certificate invalidation',92,'add_historicalcertificateinvalidation'),(363,'Can change historical certificate invalidation',92,'change_historicalcertificateinvalidation'),(364,'Can delete historical certificate invalidation',92,'delete_historicalcertificateinvalidation'),(365,'Can view historical certificate invalidation',92,'view_historicalcertificateinvalidation'),(366,'Can add cert_generation argument',93,'add_certificategenerationcommandconfiguration'),(367,'Can change cert_generation argument',93,'change_certificategenerationcommandconfiguration'),(368,'Can delete cert_generation argument',93,'delete_certificategenerationcommandconfiguration'),(369,'Can view cert_generation argument',93,'view_certificategenerationcommandconfiguration'),(370,'Can add certificate allowlist',94,'add_certificateallowlist'),(371,'Can change certificate allowlist',94,'change_certificateallowlist'),(372,'Can delete certificate allowlist',94,'delete_certificateallowlist'),(373,'Can view certificate allowlist',94,'view_certificateallowlist'),(374,'Can add historical certificate allowlist',95,'add_historicalcertificateallowlist'),(375,'Can change historical certificate allowlist',95,'change_historicalcertificateallowlist'),(376,'Can delete historical certificate allowlist',95,'delete_historicalcertificateallowlist'),(377,'Can view historical certificate allowlist',95,'view_historicalcertificateallowlist'),(378,'Can add instructor task',96,'add_instructortask'),(379,'Can change instructor task',96,'change_instructortask'),(380,'Can delete instructor task',96,'delete_instructortask'),(381,'Can view instructor task',96,'view_instructortask'),(382,'Can add grade report setting',97,'add_gradereportsetting'),(383,'Can change grade report setting',97,'change_gradereportsetting'),(384,'Can delete grade report setting',97,'delete_gradereportsetting'),(385,'Can view grade report setting',97,'view_gradereportsetting'),(386,'Can add cohort membership',98,'add_cohortmembership'),(387,'Can change cohort membership',98,'change_cohortmembership'),(388,'Can delete cohort membership',98,'delete_cohortmembership'),(389,'Can view cohort membership',98,'view_cohortmembership'),(390,'Can add course cohort',99,'add_coursecohort'),(391,'Can change course cohort',99,'change_coursecohort'),(392,'Can delete course cohort',99,'delete_coursecohort'),(393,'Can view course cohort',99,'view_coursecohort'),(394,'Can add course cohorts settings',100,'add_coursecohortssettings'),(395,'Can change course cohorts settings',100,'change_coursecohortssettings'),(396,'Can delete course cohorts settings',100,'delete_coursecohortssettings'),(397,'Can view course cohorts settings',100,'view_coursecohortssettings'),(398,'Can add course user group',101,'add_courseusergroup'),(399,'Can change course user group',101,'change_courseusergroup'),(400,'Can delete course user group',101,'delete_courseusergroup'),(401,'Can view course user group',101,'view_courseusergroup'),(402,'Can add course user group partition group',102,'add_courseusergrouppartitiongroup'),(403,'Can change course user group partition group',102,'change_courseusergrouppartitiongroup'),(404,'Can delete course user group partition group',102,'delete_courseusergrouppartitiongroup'),(405,'Can view course user group partition group',102,'view_courseusergrouppartitiongroup'),(406,'Can add unregistered learner cohort assignments',103,'add_unregisteredlearnercohortassignments'),(407,'Can change unregistered learner cohort assignments',103,'change_unregisteredlearnercohortassignments'),(408,'Can delete unregistered learner cohort assignments',103,'delete_unregisteredlearnercohortassignments'),(409,'Can view unregistered learner cohort assignments',103,'view_unregisteredlearnercohortassignments'),(410,'Can add course authorization',104,'add_courseauthorization'),(411,'Can change course authorization',104,'change_courseauthorization'),(412,'Can delete course authorization',104,'delete_courseauthorization'),(413,'Can view course authorization',104,'view_courseauthorization'),(414,'Can add course email',105,'add_courseemail'),(415,'Can change course email',105,'change_courseemail'),(416,'Can delete course email',105,'delete_courseemail'),(417,'Can view course email',105,'view_courseemail'),(418,'Can add course email template',106,'add_courseemailtemplate'),(419,'Can change course email template',106,'change_courseemailtemplate'),(420,'Can delete course email template',106,'delete_courseemailtemplate'),(421,'Can view course email template',106,'view_courseemailtemplate'),(422,'Can add optout',107,'add_optout'),(423,'Can change optout',107,'change_optout'),(424,'Can delete optout',107,'delete_optout'),(425,'Can view optout',107,'view_optout'),(426,'Can add bulk email flag',108,'add_bulkemailflag'),(427,'Can change bulk email flag',108,'change_bulkemailflag'),(428,'Can delete bulk email flag',108,'delete_bulkemailflag'),(429,'Can view bulk email flag',108,'view_bulkemailflag'),(430,'Can add target',109,'add_target'),(431,'Can change target',109,'change_target'),(432,'Can delete target',109,'delete_target'),(433,'Can view target',109,'view_target'),(434,'Can add cohort target',110,'add_cohorttarget'),(435,'Can change cohort target',110,'change_cohorttarget'),(436,'Can delete cohort target',110,'delete_cohorttarget'),(437,'Can view cohort target',110,'view_cohorttarget'),(438,'Can add course mode target',111,'add_coursemodetarget'),(439,'Can change course mode target',111,'change_coursemodetarget'),(440,'Can delete course mode target',111,'delete_coursemodetarget'),(441,'Can view course mode target',111,'view_coursemodetarget'),(442,'Can add branding api config',112,'add_brandingapiconfig'),(443,'Can change branding api config',112,'change_brandingapiconfig'),(444,'Can delete branding api config',112,'delete_brandingapiconfig'),(445,'Can view branding api config',112,'view_brandingapiconfig'),(446,'Can add branding info config',113,'add_brandinginfoconfig'),(447,'Can change branding info config',113,'change_brandinginfoconfig'),(448,'Can delete branding info config',113,'delete_brandinginfoconfig'),(449,'Can view branding info config',113,'view_brandinginfoconfig'),(450,'Can add disable progress page stacked config',114,'add_disableprogresspagestackedconfig'),(451,'Can change disable progress page stacked config',114,'change_disableprogresspagestackedconfig'),(452,'Can delete disable progress page stacked config',114,'delete_disableprogresspagestackedconfig'),(453,'Can view disable progress page stacked config',114,'view_disableprogresspagestackedconfig'),(454,'Can add application',115,'add_application'),(455,'Can change application',115,'change_application'),(456,'Can delete application',115,'delete_application'),(457,'Can view application',115,'view_application'),(458,'Can add access token',116,'add_accesstoken'),(459,'Can change access token',116,'change_accesstoken'),(460,'Can delete access token',116,'delete_accesstoken'),(461,'Can view access token',116,'view_accesstoken'),(462,'Can add grant',117,'add_grant'),(463,'Can change grant',117,'change_grant'),(464,'Can delete grant',117,'delete_grant'),(465,'Can view grant',117,'view_grant'),(466,'Can add refresh token',118,'add_refreshtoken'),(467,'Can change refresh token',118,'change_refreshtoken'),(468,'Can delete refresh token',118,'delete_refreshtoken'),(469,'Can view refresh token',118,'view_refreshtoken'),(470,'Can add restricted application',119,'add_restrictedapplication'),(471,'Can change restricted application',119,'change_restrictedapplication'),(472,'Can delete restricted application',119,'delete_restrictedapplication'),(473,'Can view restricted application',119,'view_restrictedapplication'),(474,'Can add application access',120,'add_applicationaccess'),(475,'Can change application access',120,'change_applicationaccess'),(476,'Can delete application access',120,'delete_applicationaccess'),(477,'Can view application access',120,'view_applicationaccess'),(478,'Can add application organization',121,'add_applicationorganization'),(479,'Can change application organization',121,'change_applicationorganization'),(480,'Can delete application organization',121,'delete_applicationorganization'),(481,'Can view application organization',121,'view_applicationorganization'),(482,'Can add SAML Provider Data',122,'add_samlproviderdata'),(483,'Can change SAML Provider Data',122,'change_samlproviderdata'),(484,'Can delete SAML Provider Data',122,'delete_samlproviderdata'),(485,'Can view SAML Provider Data',122,'view_samlproviderdata'),(486,'Can add SAML Configuration',123,'add_samlconfiguration'),(487,'Can change SAML Configuration',123,'change_samlconfiguration'),(488,'Can delete SAML Configuration',123,'delete_samlconfiguration'),(489,'Can view SAML Configuration',123,'view_samlconfiguration'),(490,'Can add Provider Configuration (OAuth)',124,'add_oauth2providerconfig'),(491,'Can change Provider Configuration (OAuth)',124,'change_oauth2providerconfig'),(492,'Can delete Provider Configuration (OAuth)',124,'delete_oauth2providerconfig'),(493,'Can view Provider Configuration (OAuth)',124,'view_oauth2providerconfig'),(494,'Can add Provider Configuration (LTI)',125,'add_ltiproviderconfig'),(495,'Can change Provider Configuration (LTI)',125,'change_ltiproviderconfig'),(496,'Can delete Provider Configuration (LTI)',125,'delete_ltiproviderconfig'),(497,'Can view Provider Configuration (LTI)',125,'view_ltiproviderconfig'),(498,'Can add Provider Configuration (SAML IdP)',126,'add_samlproviderconfig'),(499,'Can change Provider Configuration (SAML IdP)',126,'change_samlproviderconfig'),(500,'Can delete Provider Configuration (SAML IdP)',126,'delete_samlproviderconfig'),(501,'Can view Provider Configuration (SAML IdP)',126,'view_samlproviderconfig'),(502,'Can add system wide role',127,'add_systemwiderole'),(503,'Can change system wide role',127,'change_systemwiderole'),(504,'Can delete system wide role',127,'delete_systemwiderole'),(505,'Can view system wide role',127,'view_systemwiderole'),(506,'Can add system wide role assignment',128,'add_systemwideroleassignment'),(507,'Can change system wide role assignment',128,'change_systemwideroleassignment'),(508,'Can delete system wide role assignment',128,'delete_systemwideroleassignment'),(509,'Can view system wide role assignment',128,'view_systemwideroleassignment'),(510,'Can add article',129,'add_article'),(511,'Can change article',129,'change_article'),(512,'Can delete article',129,'delete_article'),(513,'Can view article',129,'view_article'),(514,'Can edit all articles and lock/unlock/restore',129,'moderate'),(515,'Can change ownership of any article',129,'assign'),(516,'Can assign permissions to other users',129,'grant'),(517,'Can add Article for object',130,'add_articleforobject'),(518,'Can change Article for object',130,'change_articleforobject'),(519,'Can delete Article for object',130,'delete_articleforobject'),(520,'Can view Article for object',130,'view_articleforobject'),(521,'Can add article plugin',131,'add_articleplugin'),(522,'Can change article plugin',131,'change_articleplugin'),(523,'Can delete article plugin',131,'delete_articleplugin'),(524,'Can view article plugin',131,'view_articleplugin'),(525,'Can add article revision',132,'add_articlerevision'),(526,'Can change article revision',132,'change_articlerevision'),(527,'Can delete article revision',132,'delete_articlerevision'),(528,'Can view article revision',132,'view_articlerevision'),(529,'Can add reusable plugin',133,'add_reusableplugin'),(530,'Can change reusable plugin',133,'change_reusableplugin'),(531,'Can delete reusable plugin',133,'delete_reusableplugin'),(532,'Can view reusable plugin',133,'view_reusableplugin'),(533,'Can add revision plugin',134,'add_revisionplugin'),(534,'Can change revision plugin',134,'change_revisionplugin'),(535,'Can delete revision plugin',134,'delete_revisionplugin'),(536,'Can view revision plugin',134,'view_revisionplugin'),(537,'Can add revision plugin revision',135,'add_revisionpluginrevision'),(538,'Can change revision plugin revision',135,'change_revisionpluginrevision'),(539,'Can delete revision plugin revision',135,'delete_revisionpluginrevision'),(540,'Can view revision plugin revision',135,'view_revisionpluginrevision'),(541,'Can add simple plugin',136,'add_simpleplugin'),(542,'Can change simple plugin',136,'change_simpleplugin'),(543,'Can delete simple plugin',136,'delete_simpleplugin'),(544,'Can view simple plugin',136,'view_simpleplugin'),(545,'Can add URL path',137,'add_urlpath'),(546,'Can change URL path',137,'change_urlpath'),(547,'Can delete URL path',137,'delete_urlpath'),(548,'Can view URL path',137,'view_urlpath'),(549,'Can add notification',138,'add_notification'),(550,'Can change notification',138,'change_notification'),(551,'Can delete notification',138,'delete_notification'),(552,'Can view notification',138,'view_notification'),(553,'Can add type',139,'add_notificationtype'),(554,'Can change type',139,'change_notificationtype'),(555,'Can delete type',139,'delete_notificationtype'),(556,'Can view type',139,'view_notificationtype'),(557,'Can add settings',140,'add_settings'),(558,'Can change settings',140,'change_settings'),(559,'Can delete settings',140,'delete_settings'),(560,'Can view settings',140,'view_settings'),(561,'Can add subscription',141,'add_subscription'),(562,'Can change subscription',141,'change_subscription'),(563,'Can delete subscription',141,'delete_subscription'),(564,'Can view subscription',141,'view_subscription'),(565,'Can add log entry',142,'add_logentry'),(566,'Can change log entry',142,'change_logentry'),(567,'Can delete log entry',142,'delete_logentry'),(568,'Can view log entry',142,'view_logentry'),(569,'Can add permission',143,'add_permission'),(570,'Can change permission',143,'change_permission'),(571,'Can delete permission',143,'delete_permission'),(572,'Can view permission',143,'view_permission'),(573,'Can add role',144,'add_role'),(574,'Can change role',144,'change_role'),(575,'Can delete role',144,'delete_role'),(576,'Can view role',144,'view_role'),(577,'Can add forums config',145,'add_forumsconfig'),(578,'Can change forums config',145,'change_forumsconfig'),(579,'Can delete forums config',145,'delete_forumsconfig'),(580,'Can view forums config',145,'view_forumsconfig'),(581,'Can add course discussion settings',146,'add_coursediscussionsettings'),(582,'Can change course discussion settings',146,'change_coursediscussionsettings'),(583,'Can delete course discussion settings',146,'delete_coursediscussionsettings'),(584,'Can view course discussion settings',146,'view_coursediscussionsettings'),(585,'Can add discussions id mapping',147,'add_discussionsidmapping'),(586,'Can change discussions id mapping',147,'change_discussionsidmapping'),(587,'Can delete discussions id mapping',147,'delete_discussionsidmapping'),(588,'Can view discussions id mapping',147,'view_discussionsidmapping'),(589,'Can add splash config',148,'add_splashconfig'),(590,'Can change splash config',148,'change_splashconfig'),(591,'Can delete splash config',148,'delete_splashconfig'),(592,'Can view splash config',148,'view_splashconfig'),(593,'Can add user course tag',149,'add_usercoursetag'),(594,'Can change user course tag',149,'change_usercoursetag'),(595,'Can delete user course tag',149,'delete_usercoursetag'),(596,'Can view user course tag',149,'view_usercoursetag'),(597,'Can add user org tag',150,'add_userorgtag'),(598,'Can change user org tag',150,'change_userorgtag'),(599,'Can delete user org tag',150,'delete_userorgtag'),(600,'Can view user org tag',150,'view_userorgtag'),(601,'Can add user preference',151,'add_userpreference'),(602,'Can change user preference',151,'change_userpreference'),(603,'Can delete user preference',151,'delete_userpreference'),(604,'Can view user preference',151,'view_userpreference'),(605,'Can add retirement state',152,'add_retirementstate'),(606,'Can change retirement state',152,'change_retirementstate'),(607,'Can delete retirement state',152,'delete_retirementstate'),(608,'Can view retirement state',152,'view_retirementstate'),(609,'Can add User Retirement Status',153,'add_userretirementstatus'),(610,'Can change User Retirement Status',153,'change_userretirementstatus'),(611,'Can delete User Retirement Status',153,'delete_userretirementstatus'),(612,'Can view User Retirement Status',153,'view_userretirementstatus'),(613,'Can add User Retirement Request',154,'add_userretirementrequest'),(614,'Can change User Retirement Request',154,'change_userretirementrequest'),(615,'Can delete User Retirement Request',154,'delete_userretirementrequest'),(616,'Can view User Retirement Request',154,'view_userretirementrequest'),(617,'Can add User Retirement Reporting Status',155,'add_userretirementpartnerreportingstatus'),(618,'Can change User Retirement Reporting Status',155,'change_userretirementpartnerreportingstatus'),(619,'Can delete User Retirement Reporting Status',155,'delete_userretirementpartnerreportingstatus'),(620,'Can view User Retirement Reporting Status',155,'view_userretirementpartnerreportingstatus'),(621,'Can add course mode',156,'add_coursemode'),(622,'Can change course mode',156,'change_coursemode'),(623,'Can delete course mode',156,'delete_coursemode'),(624,'Can view course mode',156,'view_coursemode'),(625,'Can add course modes archive',157,'add_coursemodesarchive'),(626,'Can change course modes archive',157,'change_coursemodesarchive'),(627,'Can delete course modes archive',157,'delete_coursemodesarchive'),(628,'Can view course modes archive',157,'view_coursemodesarchive'),(629,'Can add course mode expiration config',158,'add_coursemodeexpirationconfig'),(630,'Can change course mode expiration config',158,'change_coursemodeexpirationconfig'),(631,'Can delete course mode expiration config',158,'delete_coursemodeexpirationconfig'),(632,'Can view course mode expiration config',158,'view_coursemodeexpirationconfig'),(633,'Can add historical course mode',159,'add_historicalcoursemode'),(634,'Can change historical course mode',159,'change_historicalcoursemode'),(635,'Can delete historical course mode',159,'delete_historicalcoursemode'),(636,'Can view historical course mode',159,'view_historicalcoursemode'),(637,'Can add course entitlement',160,'add_courseentitlement'),(638,'Can change course entitlement',160,'change_courseentitlement'),(639,'Can delete course entitlement',160,'delete_courseentitlement'),(640,'Can view course entitlement',160,'view_courseentitlement'),(641,'Can add course entitlement policy',161,'add_courseentitlementpolicy'),(642,'Can change course entitlement policy',161,'change_courseentitlementpolicy'),(643,'Can delete course entitlement policy',161,'delete_courseentitlementpolicy'),(644,'Can view course entitlement policy',161,'view_courseentitlementpolicy'),(645,'Can add course entitlement support detail',162,'add_courseentitlementsupportdetail'),(646,'Can change course entitlement support detail',162,'change_courseentitlementsupportdetail'),(647,'Can delete course entitlement support detail',162,'delete_courseentitlementsupportdetail'),(648,'Can view course entitlement support detail',162,'view_courseentitlementsupportdetail'),(649,'Can add historical course entitlement',163,'add_historicalcourseentitlement'),(650,'Can change historical course entitlement',163,'change_historicalcourseentitlement'),(651,'Can delete historical course entitlement',163,'delete_historicalcourseentitlement'),(652,'Can view historical course entitlement',163,'view_historicalcourseentitlement'),(653,'Can add historical course entitlement support detail',164,'add_historicalcourseentitlementsupportdetail'),(654,'Can change historical course entitlement support detail',164,'change_historicalcourseentitlementsupportdetail'),(655,'Can delete historical course entitlement support detail',164,'delete_historicalcourseentitlementsupportdetail'),(656,'Can view historical course entitlement support detail',164,'view_historicalcourseentitlementsupportdetail'),(657,'Can add software secure photo verification',165,'add_softwaresecurephotoverification'),(658,'Can change software secure photo verification',165,'change_softwaresecurephotoverification'),(659,'Can delete software secure photo verification',165,'delete_softwaresecurephotoverification'),(660,'Can view software secure photo verification',165,'view_softwaresecurephotoverification'),(661,'Can add verification deadline',166,'add_verificationdeadline'),(662,'Can change verification deadline',166,'change_verificationdeadline'),(663,'Can delete verification deadline',166,'delete_verificationdeadline'),(664,'Can view verification deadline',166,'view_verificationdeadline'),(665,'Can add sso verification',167,'add_ssoverification'),(666,'Can change sso verification',167,'change_ssoverification'),(667,'Can delete sso verification',167,'delete_ssoverification'),(668,'Can view sso verification',167,'view_ssoverification'),(669,'Can add manual verification',168,'add_manualverification'),(670,'Can change manual verification',168,'change_manualverification'),(671,'Can delete manual verification',168,'delete_manualverification'),(672,'Can view manual verification',168,'view_manualverification'),(673,'Can add sspv retry student argument',169,'add_sspverificationretryconfig'),(674,'Can change sspv retry student argument',169,'change_sspverificationretryconfig'),(675,'Can delete sspv retry student argument',169,'delete_sspverificationretryconfig'),(676,'Can view sspv retry student argument',169,'view_sspverificationretryconfig'),(677,'Can add dark lang config',170,'add_darklangconfig'),(678,'Can change dark lang config',170,'change_darklangconfig'),(679,'Can delete dark lang config',170,'delete_darklangconfig'),(680,'Can view dark lang config',170,'view_darklangconfig'),(681,'Can add whitelisted rss url',171,'add_whitelistedrssurl'),(682,'Can change whitelisted rss url',171,'change_whitelistedrssurl'),(683,'Can delete whitelisted rss url',171,'delete_whitelistedrssurl'),(684,'Can view whitelisted rss url',171,'view_whitelistedrssurl'),(685,'Can add country',172,'add_country'),(686,'Can change country',172,'change_country'),(687,'Can delete country',172,'delete_country'),(688,'Can view country',172,'view_country'),(689,'Can add country access rule',173,'add_countryaccessrule'),(690,'Can change country access rule',173,'change_countryaccessrule'),(691,'Can delete country access rule',173,'delete_countryaccessrule'),(692,'Can view country access rule',173,'view_countryaccessrule'),(693,'Can add course access rule history',174,'add_courseaccessrulehistory'),(694,'Can change course access rule history',174,'change_courseaccessrulehistory'),(695,'Can delete course access rule history',174,'delete_courseaccessrulehistory'),(696,'Can view course access rule history',174,'view_courseaccessrulehistory'),(697,'Can add embargoed course',175,'add_embargoedcourse'),(698,'Can change embargoed course',175,'change_embargoedcourse'),(699,'Can delete embargoed course',175,'delete_embargoedcourse'),(700,'Can view embargoed course',175,'view_embargoedcourse'),(701,'Can add embargoed state',176,'add_embargoedstate'),(702,'Can change embargoed state',176,'change_embargoedstate'),(703,'Can delete embargoed state',176,'delete_embargoedstate'),(704,'Can view embargoed state',176,'view_embargoedstate'),(705,'Can add ip filter',177,'add_ipfilter'),(706,'Can change ip filter',177,'change_ipfilter'),(707,'Can delete ip filter',177,'delete_ipfilter'),(708,'Can view ip filter',177,'view_ipfilter'),(709,'Can add restricted course',178,'add_restrictedcourse'),(710,'Can change restricted course',178,'change_restrictedcourse'),(711,'Can delete restricted course',178,'delete_restrictedcourse'),(712,'Can view restricted course',178,'view_restrictedcourse'),(713,'Can add course rerun state',179,'add_coursererunstate'),(714,'Can change course rerun state',179,'change_coursererunstate'),(715,'Can delete course rerun state',179,'delete_coursererunstate'),(716,'Can view course rerun state',179,'view_coursererunstate'),(717,'Can add mobile api config',180,'add_mobileapiconfig'),(718,'Can change mobile api config',180,'change_mobileapiconfig'),(719,'Can delete mobile api config',180,'delete_mobileapiconfig'),(720,'Can view mobile api config',180,'view_mobileapiconfig'),(721,'Can add app version config',181,'add_appversionconfig'),(722,'Can change app version config',181,'change_appversionconfig'),(723,'Can delete app version config',181,'delete_appversionconfig'),(724,'Can view app version config',181,'view_appversionconfig'),(725,'Can add ignore mobile available flag config',182,'add_ignoremobileavailableflagconfig'),(726,'Can change ignore mobile available flag config',182,'change_ignoremobileavailableflagconfig'),(727,'Can delete ignore mobile available flag config',182,'delete_ignoremobileavailableflagconfig'),(728,'Can view ignore mobile available flag config',182,'view_ignoremobileavailableflagconfig'),(729,'Can add association',183,'add_association'),(730,'Can change association',183,'change_association'),(731,'Can delete association',183,'delete_association'),(732,'Can view association',183,'view_association'),(733,'Can add code',184,'add_code'),(734,'Can change code',184,'change_code'),(735,'Can delete code',184,'delete_code'),(736,'Can view code',184,'view_code'),(737,'Can add nonce',185,'add_nonce'),(738,'Can change nonce',185,'change_nonce'),(739,'Can delete nonce',185,'delete_nonce'),(740,'Can view nonce',185,'view_nonce'),(741,'Can add user social auth',186,'add_usersocialauth'),(742,'Can change user social auth',186,'change_usersocialauth'),(743,'Can delete user social auth',186,'delete_usersocialauth'),(744,'Can view user social auth',186,'view_usersocialauth'),(745,'Can add partial',187,'add_partial'),(746,'Can change partial',187,'change_partial'),(747,'Can delete partial',187,'delete_partial'),(748,'Can view partial',187,'view_partial'),(749,'Can add survey answer',188,'add_surveyanswer'),(750,'Can change survey answer',188,'change_surveyanswer'),(751,'Can delete survey answer',188,'delete_surveyanswer'),(752,'Can view survey answer',188,'view_surveyanswer'),(753,'Can add survey form',189,'add_surveyform'),(754,'Can change survey form',189,'change_surveyform'),(755,'Can delete survey form',189,'delete_surveyform'),(756,'Can view survey form',189,'view_surveyform'),(757,'Can add x block asides config',190,'add_xblockasidesconfig'),(758,'Can change x block asides config',190,'change_xblockasidesconfig'),(759,'Can delete x block asides config',190,'delete_xblockasidesconfig'),(760,'Can view x block asides config',190,'view_xblockasidesconfig'),(761,'Can add score',191,'add_score'),(762,'Can change score',191,'change_score'),(763,'Can delete score',191,'delete_score'),(764,'Can view score',191,'view_score'),(765,'Can add student item',192,'add_studentitem'),(766,'Can change student item',192,'change_studentitem'),(767,'Can delete student item',192,'delete_studentitem'),(768,'Can view student item',192,'view_studentitem'),(769,'Can add submission',193,'add_submission'),(770,'Can change submission',193,'change_submission'),(771,'Can delete submission',193,'delete_submission'),(772,'Can view submission',193,'view_submission'),(773,'Can add score summary',194,'add_scoresummary'),(774,'Can change score summary',194,'change_scoresummary'),(775,'Can delete score summary',194,'delete_scoresummary'),(776,'Can view score summary',194,'view_scoresummary'),(777,'Can add score annotation',195,'add_scoreannotation'),(778,'Can change score annotation',195,'change_scoreannotation'),(779,'Can delete score annotation',195,'delete_scoreannotation'),(780,'Can view score annotation',195,'view_scoreannotation'),(781,'Can add team submission',196,'add_teamsubmission'),(782,'Can change team submission',196,'change_teamsubmission'),(783,'Can delete team submission',196,'delete_teamsubmission'),(784,'Can view team submission',196,'view_teamsubmission'),(785,'Can add assessment',197,'add_assessment'),(786,'Can change assessment',197,'change_assessment'),(787,'Can delete assessment',197,'delete_assessment'),(788,'Can view assessment',197,'view_assessment'),(789,'Can add assessment feedback',198,'add_assessmentfeedback'),(790,'Can change assessment feedback',198,'change_assessmentfeedback'),(791,'Can delete assessment feedback',198,'delete_assessmentfeedback'),(792,'Can view assessment feedback',198,'view_assessmentfeedback'),(793,'Can add assessment feedback option',199,'add_assessmentfeedbackoption'),(794,'Can change assessment feedback option',199,'change_assessmentfeedbackoption'),(795,'Can delete assessment feedback option',199,'delete_assessmentfeedbackoption'),(796,'Can view assessment feedback option',199,'view_assessmentfeedbackoption'),(797,'Can add assessment part',200,'add_assessmentpart'),(798,'Can change assessment part',200,'change_assessmentpart'),(799,'Can delete assessment part',200,'delete_assessmentpart'),(800,'Can view assessment part',200,'view_assessmentpart'),(801,'Can add criterion',201,'add_criterion'),(802,'Can change criterion',201,'change_criterion'),(803,'Can delete criterion',201,'delete_criterion'),(804,'Can view criterion',201,'view_criterion'),(805,'Can add criterion option',202,'add_criterionoption'),(806,'Can change criterion option',202,'change_criterionoption'),(807,'Can delete criterion option',202,'delete_criterionoption'),(808,'Can view criterion option',202,'view_criterionoption'),(809,'Can add peer workflow',203,'add_peerworkflow'),(810,'Can change peer workflow',203,'change_peerworkflow'),(811,'Can delete peer workflow',203,'delete_peerworkflow'),(812,'Can view peer workflow',203,'view_peerworkflow'),(813,'Can add peer workflow item',204,'add_peerworkflowitem'),(814,'Can change peer workflow item',204,'change_peerworkflowitem'),(815,'Can delete peer workflow item',204,'delete_peerworkflowitem'),(816,'Can view peer workflow item',204,'view_peerworkflowitem'),(817,'Can add rubric',205,'add_rubric'),(818,'Can change rubric',205,'change_rubric'),(819,'Can delete rubric',205,'delete_rubric'),(820,'Can view rubric',205,'view_rubric'),(821,'Can add student training workflow',206,'add_studenttrainingworkflow'),(822,'Can change student training workflow',206,'change_studenttrainingworkflow'),(823,'Can delete student training workflow',206,'delete_studenttrainingworkflow'),(824,'Can view student training workflow',206,'view_studenttrainingworkflow'),(825,'Can add student training workflow item',207,'add_studenttrainingworkflowitem'),(826,'Can change student training workflow item',207,'change_studenttrainingworkflowitem'),(827,'Can delete student training workflow item',207,'delete_studenttrainingworkflowitem'),(828,'Can view student training workflow item',207,'view_studenttrainingworkflowitem'),(829,'Can add training example',208,'add_trainingexample'),(830,'Can change training example',208,'change_trainingexample'),(831,'Can delete training example',208,'delete_trainingexample'),(832,'Can view training example',208,'view_trainingexample'),(833,'Can add staff workflow',209,'add_staffworkflow'),(834,'Can change staff workflow',209,'change_staffworkflow'),(835,'Can delete staff workflow',209,'delete_staffworkflow'),(836,'Can view staff workflow',209,'view_staffworkflow'),(837,'Can add historical shared file upload',210,'add_historicalsharedfileupload'),(838,'Can change historical shared file upload',210,'change_historicalsharedfileupload'),(839,'Can delete historical shared file upload',210,'delete_historicalsharedfileupload'),(840,'Can view historical shared file upload',210,'view_historicalsharedfileupload'),(841,'Can add shared file upload',211,'add_sharedfileupload'),(842,'Can change shared file upload',211,'change_sharedfileupload'),(843,'Can delete shared file upload',211,'delete_sharedfileupload'),(844,'Can view shared file upload',211,'view_sharedfileupload'),(845,'Can add team staff workflow',212,'add_teamstaffworkflow'),(846,'Can change team staff workflow',212,'change_teamstaffworkflow'),(847,'Can delete team staff workflow',212,'delete_teamstaffworkflow'),(848,'Can view team staff workflow',212,'view_teamstaffworkflow'),(849,'Can add assessment workflow',213,'add_assessmentworkflow'),(850,'Can change assessment workflow',213,'change_assessmentworkflow'),(851,'Can delete assessment workflow',213,'delete_assessmentworkflow'),(852,'Can view assessment workflow',213,'view_assessmentworkflow'),(853,'Can add assessment workflow cancellation',214,'add_assessmentworkflowcancellation'),(854,'Can change assessment workflow cancellation',214,'change_assessmentworkflowcancellation'),(855,'Can delete assessment workflow cancellation',214,'delete_assessmentworkflowcancellation'),(856,'Can view assessment workflow cancellation',214,'view_assessmentworkflowcancellation'),(857,'Can add assessment workflow step',215,'add_assessmentworkflowstep'),(858,'Can change assessment workflow step',215,'change_assessmentworkflowstep'),(859,'Can delete assessment workflow step',215,'delete_assessmentworkflowstep'),(860,'Can view assessment workflow step',215,'view_assessmentworkflowstep'),(861,'Can add team assessment workflow',216,'add_teamassessmentworkflow'),(862,'Can change team assessment workflow',216,'change_teamassessmentworkflow'),(863,'Can delete team assessment workflow',216,'delete_teamassessmentworkflow'),(864,'Can view team assessment workflow',216,'view_teamassessmentworkflow'),(865,'Can add profile',217,'add_profile'),(866,'Can change profile',217,'change_profile'),(867,'Can delete profile',217,'delete_profile'),(868,'Can view profile',217,'view_profile'),(869,'Can add video',218,'add_video'),(870,'Can change video',218,'change_video'),(871,'Can delete video',218,'delete_video'),(872,'Can view video',218,'view_video'),(873,'Can add encoded video',219,'add_encodedvideo'),(874,'Can change encoded video',219,'change_encodedvideo'),(875,'Can delete encoded video',219,'delete_encodedvideo'),(876,'Can view encoded video',219,'view_encodedvideo'),(877,'Can add course video',220,'add_coursevideo'),(878,'Can change course video',220,'change_coursevideo'),(879,'Can delete course video',220,'delete_coursevideo'),(880,'Can view course video',220,'view_coursevideo'),(881,'Can add video image',221,'add_videoimage'),(882,'Can change video image',221,'change_videoimage'),(883,'Can delete video image',221,'delete_videoimage'),(884,'Can view video image',221,'view_videoimage'),(885,'Can add transcript preference',222,'add_transcriptpreference'),(886,'Can change transcript preference',222,'change_transcriptpreference'),(887,'Can delete transcript preference',222,'delete_transcriptpreference'),(888,'Can view transcript preference',222,'view_transcriptpreference'),(889,'Can add video transcript',223,'add_videotranscript'),(890,'Can change video transcript',223,'change_videotranscript'),(891,'Can delete video transcript',223,'delete_videotranscript'),(892,'Can view video transcript',223,'view_videotranscript'),(893,'Can add third party transcript credentials state',224,'add_thirdpartytranscriptcredentialsstate'),(894,'Can change third party transcript credentials state',224,'change_thirdpartytranscriptcredentialsstate'),(895,'Can delete third party transcript credentials state',224,'delete_thirdpartytranscriptcredentialsstate'),(896,'Can view third party transcript credentials state',224,'view_thirdpartytranscriptcredentialsstate'),(897,'Can add course overview',225,'add_courseoverview'),(898,'Can change course overview',225,'change_courseoverview'),(899,'Can delete course overview',225,'delete_courseoverview'),(900,'Can view course overview',225,'view_courseoverview'),(901,'Can add course overview tab',226,'add_courseoverviewtab'),(902,'Can change course overview tab',226,'change_courseoverviewtab'),(903,'Can delete course overview tab',226,'delete_courseoverviewtab'),(904,'Can view course overview tab',226,'view_courseoverviewtab'),(905,'Can add course overview image set',227,'add_courseoverviewimageset'),(906,'Can change course overview image set',227,'change_courseoverviewimageset'),(907,'Can delete course overview image set',227,'delete_courseoverviewimageset'),(908,'Can view course overview image set',227,'view_courseoverviewimageset'),(909,'Can add course overview image config',228,'add_courseoverviewimageconfig'),(910,'Can change course overview image config',228,'change_courseoverviewimageconfig'),(911,'Can delete course overview image config',228,'delete_courseoverviewimageconfig'),(912,'Can view course overview image config',228,'view_courseoverviewimageconfig'),(913,'Can add historical course overview',229,'add_historicalcourseoverview'),(914,'Can change historical course overview',229,'change_historicalcourseoverview'),(915,'Can delete historical course overview',229,'delete_historicalcourseoverview'),(916,'Can view historical course overview',229,'view_historicalcourseoverview'),(917,'Can add simulate_publish argument',230,'add_simulatecoursepublishconfig'),(918,'Can change simulate_publish argument',230,'change_simulatecoursepublishconfig'),(919,'Can delete simulate_publish argument',230,'delete_simulatecoursepublishconfig'),(920,'Can view simulate_publish argument',230,'view_simulatecoursepublishconfig'),(921,'Can add block structure configuration',231,'add_blockstructureconfiguration'),(922,'Can change block structure configuration',231,'change_blockstructureconfiguration'),(923,'Can delete block structure configuration',231,'delete_blockstructureconfiguration'),(924,'Can view block structure configuration',231,'view_blockstructureconfiguration'),(925,'Can add block structure model',232,'add_blockstructuremodel'),(926,'Can change block structure model',232,'change_blockstructuremodel'),(927,'Can delete block structure model',232,'delete_blockstructuremodel'),(928,'Can view block structure model',232,'view_blockstructuremodel'),(929,'Can add x domain proxy configuration',233,'add_xdomainproxyconfiguration'),(930,'Can change x domain proxy configuration',233,'change_xdomainproxyconfiguration'),(931,'Can delete x domain proxy configuration',233,'delete_xdomainproxyconfiguration'),(932,'Can view x domain proxy configuration',233,'view_xdomainproxyconfiguration'),(933,'Can add commerce configuration',234,'add_commerceconfiguration'),(934,'Can change commerce configuration',234,'change_commerceconfiguration'),(935,'Can delete commerce configuration',234,'delete_commerceconfiguration'),(936,'Can view commerce configuration',234,'view_commerceconfiguration'),(937,'Can add credit course',235,'add_creditcourse'),(938,'Can change credit course',235,'change_creditcourse'),(939,'Can delete credit course',235,'delete_creditcourse'),(940,'Can view credit course',235,'view_creditcourse'),(941,'Can add credit eligibility',236,'add_crediteligibility'),(942,'Can change credit eligibility',236,'change_crediteligibility'),(943,'Can delete credit eligibility',236,'delete_crediteligibility'),(944,'Can view credit eligibility',236,'view_crediteligibility'),(945,'Can add credit provider',237,'add_creditprovider'),(946,'Can change credit provider',237,'change_creditprovider'),(947,'Can delete credit provider',237,'delete_creditprovider'),(948,'Can view credit provider',237,'view_creditprovider'),(949,'Can add credit request',238,'add_creditrequest'),(950,'Can change credit request',238,'change_creditrequest'),(951,'Can delete credit request',238,'delete_creditrequest'),(952,'Can view credit request',238,'view_creditrequest'),(953,'Can add credit requirement',239,'add_creditrequirement'),(954,'Can change credit requirement',239,'change_creditrequirement'),(955,'Can delete credit requirement',239,'delete_creditrequirement'),(956,'Can view credit requirement',239,'view_creditrequirement'),(957,'Can add credit requirement status',240,'add_creditrequirementstatus'),(958,'Can change credit requirement status',240,'change_creditrequirementstatus'),(959,'Can delete credit requirement status',240,'delete_creditrequirementstatus'),(960,'Can view credit requirement status',240,'view_creditrequirementstatus'),(961,'Can add credit config',241,'add_creditconfig'),(962,'Can change credit config',241,'change_creditconfig'),(963,'Can delete credit config',241,'delete_creditconfig'),(964,'Can view credit config',241,'view_creditconfig'),(965,'Can add course team',242,'add_courseteam'),(966,'Can change course team',242,'change_courseteam'),(967,'Can delete course team',242,'delete_courseteam'),(968,'Can view course team',242,'view_courseteam'),(969,'Can add course team membership',243,'add_courseteammembership'),(970,'Can change course team membership',243,'change_courseteammembership'),(971,'Can delete course team membership',243,'delete_courseteammembership'),(972,'Can view course team membership',243,'view_courseteammembership'),(973,'Can add x block configuration',244,'add_xblockconfiguration'),(974,'Can change x block configuration',244,'change_xblockconfiguration'),(975,'Can delete x block configuration',244,'delete_xblockconfiguration'),(976,'Can view x block configuration',244,'view_xblockconfiguration'),(977,'Can add x block studio configuration',245,'add_xblockstudioconfiguration'),(978,'Can change x block studio configuration',245,'change_xblockstudioconfiguration'),(979,'Can delete x block studio configuration',245,'delete_xblockstudioconfiguration'),(980,'Can view x block studio configuration',245,'view_xblockstudioconfiguration'),(981,'Can add x block studio configuration flag',246,'add_xblockstudioconfigurationflag'),(982,'Can change x block studio configuration flag',246,'change_xblockstudioconfigurationflag'),(983,'Can delete x block studio configuration flag',246,'delete_xblockstudioconfigurationflag'),(984,'Can view x block studio configuration flag',246,'view_xblockstudioconfigurationflag'),(985,'Can add programs api config',247,'add_programsapiconfig'),(986,'Can change programs api config',247,'change_programsapiconfig'),(987,'Can delete programs api config',247,'delete_programsapiconfig'),(988,'Can view programs api config',247,'view_programsapiconfig'),(989,'Can add catalog integration',248,'add_catalogintegration'),(990,'Can change catalog integration',248,'change_catalogintegration'),(991,'Can delete catalog integration',248,'delete_catalogintegration'),(992,'Can view catalog integration',248,'view_catalogintegration'),(993,'Can add self paced configuration',249,'add_selfpacedconfiguration'),(994,'Can change self paced configuration',249,'change_selfpacedconfiguration'),(995,'Can delete self paced configuration',249,'delete_selfpacedconfiguration'),(996,'Can view self paced configuration',249,'view_selfpacedconfiguration'),(997,'Can add kv store',250,'add_kvstore'),(998,'Can change kv store',250,'change_kvstore'),(999,'Can delete kv store',250,'delete_kvstore'),(1000,'Can view kv store',250,'view_kvstore'),(1001,'Can add course content milestone',251,'add_coursecontentmilestone'),(1002,'Can change course content milestone',251,'change_coursecontentmilestone'),(1003,'Can delete course content milestone',251,'delete_coursecontentmilestone'),(1004,'Can view course content milestone',251,'view_coursecontentmilestone'),(1005,'Can add course milestone',252,'add_coursemilestone'),(1006,'Can change course milestone',252,'change_coursemilestone'),(1007,'Can delete course milestone',252,'delete_coursemilestone'),(1008,'Can view course milestone',252,'view_coursemilestone'),(1009,'Can add milestone',253,'add_milestone'),(1010,'Can change milestone',253,'change_milestone'),(1011,'Can delete milestone',253,'delete_milestone'),(1012,'Can view milestone',253,'view_milestone'),(1013,'Can add milestone relationship type',254,'add_milestonerelationshiptype'),(1014,'Can change milestone relationship type',254,'change_milestonerelationshiptype'),(1015,'Can delete milestone relationship type',254,'delete_milestonerelationshiptype'),(1016,'Can view milestone relationship type',254,'view_milestonerelationshiptype'),(1017,'Can add user milestone',255,'add_usermilestone'),(1018,'Can change user milestone',255,'change_usermilestone'),(1019,'Can delete user milestone',255,'delete_usermilestone'),(1020,'Can view user milestone',255,'view_usermilestone'),(1021,'Can add api access request',1,'add_apiaccessrequest'),(1022,'Can change api access request',1,'change_apiaccessrequest'),(1023,'Can delete api access request',1,'delete_apiaccessrequest'),(1024,'Can view api access request',1,'view_apiaccessrequest'),(1025,'Can add api access config',256,'add_apiaccessconfig'),(1026,'Can change api access config',256,'change_apiaccessconfig'),(1027,'Can delete api access config',256,'delete_apiaccessconfig'),(1028,'Can view api access config',256,'view_apiaccessconfig'),(1029,'Can add catalog',257,'add_catalog'),(1030,'Can change catalog',257,'change_catalog'),(1031,'Can delete catalog',257,'delete_catalog'),(1032,'Can view catalog',257,'view_catalog'),(1033,'Can add verified track cohorted course',258,'add_verifiedtrackcohortedcourse'),(1034,'Can change verified track cohorted course',258,'change_verifiedtrackcohortedcourse'),(1035,'Can delete verified track cohorted course',258,'delete_verifiedtrackcohortedcourse'),(1036,'Can view verified track cohorted course',258,'view_verifiedtrackcohortedcourse'),(1037,'Can add migrate verified track cohorts setting',259,'add_migrateverifiedtrackcohortssetting'),(1038,'Can change migrate verified track cohorts setting',259,'change_migrateverifiedtrackcohortssetting'),(1039,'Can delete migrate verified track cohorts setting',259,'delete_migrateverifiedtrackcohortssetting'),(1040,'Can view migrate verified track cohorts setting',259,'view_migrateverifiedtrackcohortssetting'),(1041,'Can add badge assertion',260,'add_badgeassertion'),(1042,'Can change badge assertion',260,'change_badgeassertion'),(1043,'Can delete badge assertion',260,'delete_badgeassertion'),(1044,'Can view badge assertion',260,'view_badgeassertion'),(1045,'Can add badge class',261,'add_badgeclass'),(1046,'Can change badge class',261,'change_badgeclass'),(1047,'Can delete badge class',261,'delete_badgeclass'),(1048,'Can view badge class',261,'view_badgeclass'),(1049,'Can add course complete image configuration',262,'add_coursecompleteimageconfiguration'),(1050,'Can change course complete image configuration',262,'change_coursecompleteimageconfiguration'),(1051,'Can delete course complete image configuration',262,'delete_coursecompleteimageconfiguration'),(1052,'Can view course complete image configuration',262,'view_coursecompleteimageconfiguration'),(1053,'Can add course event badges configuration',263,'add_courseeventbadgesconfiguration'),(1054,'Can change course event badges configuration',263,'change_courseeventbadgesconfiguration'),(1055,'Can delete course event badges configuration',263,'delete_courseeventbadgesconfiguration'),(1056,'Can view course event badges configuration',263,'view_courseeventbadgesconfiguration'),(1057,'Can add failed task',264,'add_failedtask'),(1058,'Can change failed task',264,'change_failedtask'),(1059,'Can delete failed task',264,'delete_failedtask'),(1060,'Can view failed task',264,'view_failedtask'),(1061,'Can add crawlers config',265,'add_crawlersconfig'),(1062,'Can change crawlers config',265,'change_crawlersconfig'),(1063,'Can delete crawlers config',265,'delete_crawlersconfig'),(1064,'Can view crawlers config',265,'view_crawlersconfig'),(1065,'Can add Waffle flag course override',266,'add_waffleflagcourseoverridemodel'),(1066,'Can change Waffle flag course override',266,'change_waffleflagcourseoverridemodel'),(1067,'Can delete Waffle flag course override',266,'delete_waffleflagcourseoverridemodel'),(1068,'Can view Waffle flag course override',266,'view_waffleflagcourseoverridemodel'),(1069,'Can add course goal',267,'add_coursegoal'),(1070,'Can change course goal',267,'change_coursegoal'),(1071,'Can delete course goal',267,'delete_coursegoal'),(1072,'Can view course goal',267,'view_coursegoal'),(1073,'Can add historical course goal',268,'add_historicalcoursegoal'),(1074,'Can change historical course goal',268,'change_historicalcoursegoal'),(1075,'Can delete historical course goal',268,'delete_historicalcoursegoal'),(1076,'Can view historical course goal',268,'view_historicalcoursegoal'),(1077,'Can add historical user calendar sync config',269,'add_historicalusercalendarsyncconfig'),(1078,'Can change historical user calendar sync config',269,'change_historicalusercalendarsyncconfig'),(1079,'Can delete historical user calendar sync config',269,'delete_historicalusercalendarsyncconfig'),(1080,'Can view historical user calendar sync config',269,'view_historicalusercalendarsyncconfig'),(1081,'Can add user calendar sync config',270,'add_usercalendarsyncconfig'),(1082,'Can change user calendar sync config',270,'change_usercalendarsyncconfig'),(1083,'Can delete user calendar sync config',270,'delete_usercalendarsyncconfig'),(1084,'Can view user calendar sync config',270,'view_usercalendarsyncconfig'),(1085,'Can add course duration limit config',271,'add_coursedurationlimitconfig'),(1086,'Can change course duration limit config',271,'change_coursedurationlimitconfig'),(1087,'Can delete course duration limit config',271,'delete_coursedurationlimitconfig'),(1088,'Can view course duration limit config',271,'view_coursedurationlimitconfig'),(1089,'Can add content type gating config',272,'add_contenttypegatingconfig'),(1090,'Can change content type gating config',272,'change_contenttypegatingconfig'),(1091,'Can delete content type gating config',272,'delete_contenttypegatingconfig'),(1092,'Can view content type gating config',272,'view_contenttypegatingconfig'),(1093,'Can add discount restriction config',273,'add_discountrestrictionconfig'),(1094,'Can change discount restriction config',273,'change_discountrestrictionconfig'),(1095,'Can delete discount restriction config',273,'delete_discountrestrictionconfig'),(1096,'Can view discount restriction config',273,'view_discountrestrictionconfig'),(1097,'Can add discount percentage config',274,'add_discountpercentageconfig'),(1098,'Can change discount percentage config',274,'change_discountpercentageconfig'),(1099,'Can delete discount percentage config',274,'delete_discountpercentageconfig'),(1100,'Can view discount percentage config',274,'view_discountpercentageconfig'),(1101,'Can add Experiment Data',275,'add_experimentdata'),(1102,'Can change Experiment Data',275,'change_experimentdata'),(1103,'Can delete Experiment Data',275,'delete_experimentdata'),(1104,'Can view Experiment Data',275,'view_experimentdata'),(1105,'Can add Experiment Key-Value Pair',276,'add_experimentkeyvalue'),(1106,'Can change Experiment Key-Value Pair',276,'change_experimentkeyvalue'),(1107,'Can delete Experiment Key-Value Pair',276,'delete_experimentkeyvalue'),(1108,'Can view Experiment Key-Value Pair',276,'view_experimentkeyvalue'),(1109,'Can add historical Experiment Key-Value Pair',277,'add_historicalexperimentkeyvalue'),(1110,'Can change historical Experiment Key-Value Pair',277,'change_historicalexperimentkeyvalue'),(1111,'Can delete historical Experiment Key-Value Pair',277,'delete_historicalexperimentkeyvalue'),(1112,'Can view historical Experiment Key-Value Pair',277,'view_historicalexperimentkeyvalue'),(1113,'Can add self paced relative dates config',278,'add_selfpacedrelativedatesconfig'),(1114,'Can change self paced relative dates config',278,'change_selfpacedrelativedatesconfig'),(1115,'Can delete self paced relative dates config',278,'delete_selfpacedrelativedatesconfig'),(1116,'Can view self paced relative dates config',278,'view_selfpacedrelativedatesconfig'),(1117,'Can add external id',279,'add_externalid'),(1118,'Can change external id',279,'change_externalid'),(1119,'Can delete external id',279,'delete_externalid'),(1120,'Can view external id',279,'view_externalid'),(1121,'Can add external id type',280,'add_externalidtype'),(1122,'Can change external id type',280,'change_externalidtype'),(1123,'Can delete external id type',280,'delete_externalidtype'),(1124,'Can view external id type',280,'view_externalidtype'),(1125,'Can add historical external id',281,'add_historicalexternalid'),(1126,'Can change historical external id',281,'change_historicalexternalid'),(1127,'Can delete historical external id',281,'delete_historicalexternalid'),(1128,'Can view historical external id',281,'view_historicalexternalid'),(1129,'Can add historical external id type',282,'add_historicalexternalidtype'),(1130,'Can change historical external id type',282,'change_historicalexternalidtype'),(1131,'Can delete historical external id type',282,'delete_historicalexternalidtype'),(1132,'Can view historical external id type',282,'view_historicalexternalidtype'),(1133,'Can add user demographic',283,'add_userdemographics'),(1134,'Can change user demographic',283,'change_userdemographics'),(1135,'Can delete user demographic',283,'delete_userdemographics'),(1136,'Can view user demographic',283,'view_userdemographics'),(1137,'Can add historical user demographic',284,'add_historicaluserdemographics'),(1138,'Can change historical user demographic',284,'change_historicaluserdemographics'),(1139,'Can delete historical user demographic',284,'delete_historicaluserdemographics'),(1140,'Can view historical user demographic',284,'view_historicaluserdemographics'),(1141,'Can add Schedule',285,'add_schedule'),(1142,'Can change Schedule',285,'change_schedule'),(1143,'Can delete Schedule',285,'delete_schedule'),(1144,'Can view Schedule',285,'view_schedule'),(1145,'Can add schedule config',286,'add_scheduleconfig'),(1146,'Can change schedule config',286,'change_scheduleconfig'),(1147,'Can delete schedule config',286,'delete_scheduleconfig'),(1148,'Can view schedule config',286,'view_scheduleconfig'),(1149,'Can add schedule experience',287,'add_scheduleexperience'),(1150,'Can change schedule experience',287,'change_scheduleexperience'),(1151,'Can delete schedule experience',287,'delete_scheduleexperience'),(1152,'Can view schedule experience',287,'view_scheduleexperience'),(1153,'Can add historical Schedule',288,'add_historicalschedule'),(1154,'Can change historical Schedule',288,'change_historicalschedule'),(1155,'Can delete historical Schedule',288,'delete_historicalschedule'),(1156,'Can view historical Schedule',288,'view_historicalschedule'),(1157,'Can add course section',289,'add_coursesection'),(1158,'Can change course section',289,'change_coursesection'),(1159,'Can delete course section',289,'delete_coursesection'),(1160,'Can view course section',289,'view_coursesection'),(1161,'Can add Course Sequence',290,'add_coursesectionsequence'),(1162,'Can change Course Sequence',290,'change_coursesectionsequence'),(1163,'Can delete Course Sequence',290,'delete_coursesectionsequence'),(1164,'Can view Course Sequence',290,'view_coursesectionsequence'),(1165,'Can add learning context',291,'add_learningcontext'),(1166,'Can change learning context',291,'change_learningcontext'),(1167,'Can delete learning context',291,'delete_learningcontext'),(1168,'Can view learning context',291,'view_learningcontext'),(1169,'Can add learning sequence',292,'add_learningsequence'),(1170,'Can change learning sequence',292,'change_learningsequence'),(1171,'Can delete learning sequence',292,'delete_learningsequence'),(1172,'Can view learning sequence',292,'view_learningsequence'),(1173,'Can add Course',293,'add_coursecontext'),(1174,'Can change Course',293,'change_coursecontext'),(1175,'Can delete Course',293,'delete_coursecontext'),(1176,'Can view Course',293,'view_coursecontext'),(1177,'Can add course sequence exam',294,'add_coursesequenceexam'),(1178,'Can change course sequence exam',294,'change_coursesequenceexam'),(1179,'Can delete course sequence exam',294,'delete_coursesequenceexam'),(1180,'Can view course sequence exam',294,'view_coursesequenceexam'),(1181,'Can add publish report',295,'add_publishreport'),(1182,'Can change publish report',295,'change_publishreport'),(1183,'Can delete publish report',295,'delete_publishreport'),(1184,'Can view publish report',295,'view_publishreport'),(1185,'Can add content error',296,'add_contenterror'),(1186,'Can change content error',296,'change_contenterror'),(1187,'Can delete content error',296,'delete_contenterror'),(1188,'Can view content error',296,'view_contenterror'),(1189,'Can add user partition group',297,'add_userpartitiongroup'),(1190,'Can change user partition group',297,'change_userpartitiongroup'),(1191,'Can delete user partition group',297,'delete_userpartitiongroup'),(1192,'Can view user partition group',297,'view_userpartitiongroup'),(1193,'Can add section sequence partition group',298,'add_sectionsequencepartitiongroup'),(1194,'Can change section sequence partition group',298,'change_sectionsequencepartitiongroup'),(1195,'Can delete section sequence partition group',298,'delete_sectionsequencepartitiongroup'),(1196,'Can view section sequence partition group',298,'view_sectionsequencepartitiongroup'),(1197,'Can add section partition group',299,'add_sectionpartitiongroup'),(1198,'Can change section partition group',299,'change_sectionpartitiongroup'),(1199,'Can delete section partition group',299,'delete_sectionpartitiongroup'),(1200,'Can view section partition group',299,'view_sectionpartitiongroup'),(1201,'Can add Router Configuration',300,'add_routerconfiguration'),(1202,'Can change Router Configuration',300,'change_routerconfiguration'),(1203,'Can delete Router Configuration',300,'delete_routerconfiguration'),(1204,'Can view Router Configuration',300,'view_routerconfiguration'),(1205,'Can add organization',301,'add_organization'),(1206,'Can change organization',301,'change_organization'),(1207,'Can delete organization',301,'delete_organization'),(1208,'Can view organization',301,'view_organization'),(1209,'Can add Link Course',302,'add_organizationcourse'),(1210,'Can change Link Course',302,'change_organizationcourse'),(1211,'Can delete Link Course',302,'delete_organizationcourse'),(1212,'Can view Link Course',302,'view_organizationcourse'),(1213,'Can add historical organization',303,'add_historicalorganization'),(1214,'Can change historical organization',303,'change_historicalorganization'),(1215,'Can delete historical organization',303,'delete_historicalorganization'),(1216,'Can view historical organization',303,'view_historicalorganization'),(1217,'Can add historical Link Course',304,'add_historicalorganizationcourse'),(1218,'Can change historical Link Course',304,'change_historicalorganizationcourse'),(1219,'Can delete historical Link Course',304,'delete_historicalorganizationcourse'),(1220,'Can view historical Link Course',304,'view_historicalorganizationcourse'),(1221,'Can add integrity signature',305,'add_integritysignature'),(1222,'Can change integrity signature',305,'change_integritysignature'),(1223,'Can delete integrity signature',305,'delete_integritysignature'),(1224,'Can view integrity signature',305,'view_integritysignature'),(1225,'Can add enrollment notification email template',306,'add_enrollmentnotificationemailtemplate'),(1226,'Can change enrollment notification email template',306,'change_enrollmentnotificationemailtemplate'),(1227,'Can delete enrollment notification email template',306,'delete_enrollmentnotificationemailtemplate'),(1228,'Can view enrollment notification email template',306,'view_enrollmentnotificationemailtemplate'),(1229,'Can add Enterprise Catalog Query',307,'add_enterprisecatalogquery'),(1230,'Can change Enterprise Catalog Query',307,'change_enterprisecatalogquery'),(1231,'Can delete Enterprise Catalog Query',307,'delete_enterprisecatalogquery'),(1232,'Can view Enterprise Catalog Query',307,'view_enterprisecatalogquery'),(1233,'Can add Enterprise Customer',308,'add_enterprisecustomer'),(1234,'Can change Enterprise Customer',308,'change_enterprisecustomer'),(1235,'Can delete Enterprise Customer',308,'delete_enterprisecustomer'),(1236,'Can view Enterprise Customer',308,'view_enterprisecustomer'),(1237,'Can add Branding Configuration',309,'add_enterprisecustomerbrandingconfiguration'),(1238,'Can change Branding Configuration',309,'change_enterprisecustomerbrandingconfiguration'),(1239,'Can delete Branding Configuration',309,'delete_enterprisecustomerbrandingconfiguration'),(1240,'Can view Branding Configuration',309,'view_enterprisecustomerbrandingconfiguration'),(1241,'Can add Enterprise Customer Catalog',310,'add_enterprisecustomercatalog'),(1242,'Can change Enterprise Customer Catalog',310,'change_enterprisecustomercatalog'),(1243,'Can delete Enterprise Customer Catalog',310,'delete_enterprisecustomercatalog'),(1244,'Can view Enterprise Customer Catalog',310,'view_enterprisecustomercatalog'),(1245,'Can add enterprise customer identity provider',311,'add_enterprisecustomeridentityprovider'),(1246,'Can change enterprise customer identity provider',311,'change_enterprisecustomeridentityprovider'),(1247,'Can delete enterprise customer identity provider',311,'delete_enterprisecustomeridentityprovider'),(1248,'Can view enterprise customer identity provider',311,'view_enterprisecustomeridentityprovider'),(1249,'Can add enterprise customer reporting configuration',312,'add_enterprisecustomerreportingconfiguration'),(1250,'Can change enterprise customer reporting configuration',312,'change_enterprisecustomerreportingconfiguration'),(1251,'Can delete enterprise customer reporting configuration',312,'delete_enterprisecustomerreportingconfiguration'),(1252,'Can view enterprise customer reporting configuration',312,'view_enterprisecustomerreportingconfiguration'),(1253,'Can add Enterprise Customer Type',313,'add_enterprisecustomertype'),(1254,'Can change Enterprise Customer Type',313,'change_enterprisecustomertype'),(1255,'Can delete Enterprise Customer Type',313,'delete_enterprisecustomertype'),(1256,'Can view Enterprise Customer Type',313,'view_enterprisecustomertype'),(1257,'Can add Enterprise Customer Learner',314,'add_enterprisecustomeruser'),(1258,'Can change Enterprise Customer Learner',314,'change_enterprisecustomeruser'),(1259,'Can delete Enterprise Customer Learner',314,'delete_enterprisecustomeruser'),(1260,'Can view Enterprise Customer Learner',314,'view_enterprisecustomeruser'),(1261,'Can add enterprise course enrollment',315,'add_enterprisecourseenrollment'),(1262,'Can change enterprise course enrollment',315,'change_enterprisecourseenrollment'),(1263,'Can delete enterprise course enrollment',315,'delete_enterprisecourseenrollment'),(1264,'Can view enterprise course enrollment',315,'view_enterprisecourseenrollment'),(1265,'Can add enterprise enrollment source',316,'add_enterpriseenrollmentsource'),(1266,'Can change enterprise enrollment source',316,'change_enterpriseenrollmentsource'),(1267,'Can delete enterprise enrollment source',316,'delete_enterpriseenrollmentsource'),(1268,'Can view enterprise enrollment source',316,'view_enterpriseenrollmentsource'),(1269,'Can add enterprise feature role',317,'add_enterprisefeaturerole'),(1270,'Can change enterprise feature role',317,'change_enterprisefeaturerole'),(1271,'Can delete enterprise feature role',317,'delete_enterprisefeaturerole'),(1272,'Can view enterprise feature role',317,'view_enterprisefeaturerole'),(1273,'Can add enterprise feature user role assignment',318,'add_enterprisefeatureuserroleassignment'),(1274,'Can change enterprise feature user role assignment',318,'change_enterprisefeatureuserroleassignment'),(1275,'Can delete enterprise feature user role assignment',318,'delete_enterprisefeatureuserroleassignment'),(1276,'Can view enterprise feature user role assignment',318,'view_enterprisefeatureuserroleassignment'),(1277,'Can add historical enrollment notification email template',319,'add_historicalenrollmentnotificationemailtemplate'),(1278,'Can change historical enrollment notification email template',319,'change_historicalenrollmentnotificationemailtemplate'),(1279,'Can delete historical enrollment notification email template',319,'delete_historicalenrollmentnotificationemailtemplate'),(1280,'Can view historical enrollment notification email template',319,'view_historicalenrollmentnotificationemailtemplate'),(1281,'Can add historical enterprise course enrollment',320,'add_historicalenterprisecourseenrollment'),(1282,'Can change historical enterprise course enrollment',320,'change_historicalenterprisecourseenrollment'),(1283,'Can delete historical enterprise course enrollment',320,'delete_historicalenterprisecourseenrollment'),(1284,'Can view historical enterprise course enrollment',320,'view_historicalenterprisecourseenrollment'),(1285,'Can add historical Enterprise Customer',321,'add_historicalenterprisecustomer'),(1286,'Can change historical Enterprise Customer',321,'change_historicalenterprisecustomer'),(1287,'Can delete historical Enterprise Customer',321,'delete_historicalenterprisecustomer'),(1288,'Can view historical Enterprise Customer',321,'view_historicalenterprisecustomer'),(1289,'Can add historical Enterprise Customer Catalog',322,'add_historicalenterprisecustomercatalog'),(1290,'Can change historical Enterprise Customer Catalog',322,'change_historicalenterprisecustomercatalog'),(1291,'Can delete historical Enterprise Customer Catalog',322,'delete_historicalenterprisecustomercatalog'),(1292,'Can view historical Enterprise Customer Catalog',322,'view_historicalenterprisecustomercatalog'),(1293,'Can add historical pending enrollment',323,'add_historicalpendingenrollment'),(1294,'Can change historical pending enrollment',323,'change_historicalpendingenrollment'),(1295,'Can delete historical pending enrollment',323,'delete_historicalpendingenrollment'),(1296,'Can view historical pending enrollment',323,'view_historicalpendingenrollment'),(1297,'Can add historical pending enterprise customer user',324,'add_historicalpendingenterprisecustomeruser'),(1298,'Can change historical pending enterprise customer user',324,'change_historicalpendingenterprisecustomeruser'),(1299,'Can delete historical pending enterprise customer user',324,'delete_historicalpendingenterprisecustomeruser'),(1300,'Can view historical pending enterprise customer user',324,'view_historicalpendingenterprisecustomeruser'),(1301,'Can add pending enrollment',325,'add_pendingenrollment'),(1302,'Can change pending enrollment',325,'change_pendingenrollment'),(1303,'Can delete pending enrollment',325,'delete_pendingenrollment'),(1304,'Can view pending enrollment',325,'view_pendingenrollment'),(1305,'Can add pending enterprise customer user',326,'add_pendingenterprisecustomeruser'),(1306,'Can change pending enterprise customer user',326,'change_pendingenterprisecustomeruser'),(1307,'Can delete pending enterprise customer user',326,'delete_pendingenterprisecustomeruser'),(1308,'Can view pending enterprise customer user',326,'view_pendingenterprisecustomeruser'),(1309,'Can add system wide enterprise role',327,'add_systemwideenterpriserole'),(1310,'Can change system wide enterprise role',327,'change_systemwideenterpriserole'),(1311,'Can delete system wide enterprise role',327,'delete_systemwideenterpriserole'),(1312,'Can view system wide enterprise role',327,'view_systemwideenterpriserole'),(1313,'Can add system wide enterprise user role assignment',328,'add_systemwideenterpriseuserroleassignment'),(1314,'Can change system wide enterprise user role assignment',328,'change_systemwideenterpriseuserroleassignment'),(1315,'Can delete system wide enterprise user role assignment',328,'delete_systemwideenterpriseuserroleassignment'),(1316,'Can view system wide enterprise user role assignment',328,'view_systemwideenterpriseuserroleassignment'),(1317,'Can add licensed enterprise course enrollment',329,'add_licensedenterprisecourseenrollment'),(1318,'Can change licensed enterprise course enrollment',329,'change_licensedenterprisecourseenrollment'),(1319,'Can delete licensed enterprise course enrollment',329,'delete_licensedenterprisecourseenrollment'),(1320,'Can view licensed enterprise course enrollment',329,'view_licensedenterprisecourseenrollment'),(1321,'Can add historical licensed enterprise course enrollment',330,'add_historicallicensedenterprisecourseenrollment'),(1322,'Can change historical licensed enterprise course enrollment',330,'change_historicallicensedenterprisecourseenrollment'),(1323,'Can delete historical licensed enterprise course enrollment',330,'delete_historicallicensedenterprisecourseenrollment'),(1324,'Can view historical licensed enterprise course enrollment',330,'view_historicallicensedenterprisecourseenrollment'),(1325,'Can add historical pending enterprise customer admin user',331,'add_historicalpendingenterprisecustomeradminuser'),(1326,'Can change historical pending enterprise customer admin user',331,'change_historicalpendingenterprisecustomeradminuser'),(1327,'Can delete historical pending enterprise customer admin user',331,'delete_historicalpendingenterprisecustomeradminuser'),(1328,'Can view historical pending enterprise customer admin user',331,'view_historicalpendingenterprisecustomeradminuser'),(1329,'Can add pending enterprise customer admin user',332,'add_pendingenterprisecustomeradminuser'),(1330,'Can change pending enterprise customer admin user',332,'change_pendingenterprisecustomeradminuser'),(1331,'Can delete pending enterprise customer admin user',332,'delete_pendingenterprisecustomeradminuser'),(1332,'Can view pending enterprise customer admin user',332,'view_pendingenterprisecustomeradminuser'),(1333,'Can add historical enterprise analytics user',333,'add_historicalenterpriseanalyticsuser'),(1334,'Can change historical enterprise analytics user',333,'change_historicalenterpriseanalyticsuser'),(1335,'Can delete historical enterprise analytics user',333,'delete_historicalenterpriseanalyticsuser'),(1336,'Can view historical enterprise analytics user',333,'view_historicalenterpriseanalyticsuser'),(1337,'Can add enterprise analytics user',334,'add_enterpriseanalyticsuser'),(1338,'Can change enterprise analytics user',334,'change_enterpriseanalyticsuser'),(1339,'Can delete enterprise analytics user',334,'delete_enterpriseanalyticsuser'),(1340,'Can view enterprise analytics user',334,'view_enterpriseanalyticsuser'),(1341,'Can add update role assignments with customers config',335,'add_updateroleassignmentswithcustomersconfig'),(1342,'Can change update role assignments with customers config',335,'change_updateroleassignmentswithcustomersconfig'),(1343,'Can delete update role assignments with customers config',335,'delete_updateroleassignmentswithcustomersconfig'),(1344,'Can view update role assignments with customers config',335,'view_updateroleassignmentswithcustomersconfig'),(1345,'Can add Admin Notification Filter',336,'add_adminnotificationfilter'),(1346,'Can change Admin Notification Filter',336,'change_adminnotificationfilter'),(1347,'Can delete Admin Notification Filter',336,'delete_adminnotificationfilter'),(1348,'Can view Admin Notification Filter',336,'view_adminnotificationfilter'),(1349,'Can add Enterprise Customer Admin Notification',337,'add_adminnotification'),(1350,'Can change Enterprise Customer Admin Notification',337,'change_adminnotification'),(1351,'Can delete Enterprise Customer Admin Notification',337,'delete_adminnotification'),(1352,'Can view Enterprise Customer Admin Notification',337,'view_adminnotification'),(1353,'Can add Admin Notification Read',338,'add_adminnotificationread'),(1354,'Can change Admin Notification Read',338,'change_adminnotificationread'),(1355,'Can delete Admin Notification Read',338,'delete_adminnotificationread'),(1356,'Can view Admin Notification Read',338,'view_adminnotificationread'),(1357,'Can add historical system wide enterprise user role assignment',339,'add_historicalsystemwideenterpriseuserroleassignment'),(1358,'Can change historical system wide enterprise user role assignment',339,'change_historicalsystemwideenterpriseuserroleassignment'),(1359,'Can delete historical system wide enterprise user role assignment',339,'delete_historicalsystemwideenterpriseuserroleassignment'),(1360,'Can view historical system wide enterprise user role assignment',339,'view_historicalsystemwideenterpriseuserroleassignment'),(1361,'Can add historical Enterprise Customer Learner',340,'add_historicalenterprisecustomeruser'),(1362,'Can change historical Enterprise Customer Learner',340,'change_historicalenterprisecustomeruser'),(1363,'Can delete historical Enterprise Customer Learner',340,'delete_historicalenterprisecustomeruser'),(1364,'Can view historical Enterprise Customer Learner',340,'view_historicalenterprisecustomeruser'),(1365,'Can add Data Sharing Consent Record',341,'add_datasharingconsent'),(1366,'Can change Data Sharing Consent Record',341,'change_datasharingconsent'),(1367,'Can delete Data Sharing Consent Record',341,'delete_datasharingconsent'),(1368,'Can view Data Sharing Consent Record',341,'view_datasharingconsent'),(1369,'Can add historical Data Sharing Consent Record',342,'add_historicaldatasharingconsent'),(1370,'Can change historical Data Sharing Consent Record',342,'change_historicaldatasharingconsent'),(1371,'Can delete historical Data Sharing Consent Record',342,'delete_historicaldatasharingconsent'),(1372,'Can view historical Data Sharing Consent Record',342,'view_historicaldatasharingconsent'),(1373,'Can add data sharing consent text overrides',343,'add_datasharingconsenttextoverrides'),(1374,'Can change data sharing consent text overrides',343,'change_datasharingconsenttextoverrides'),(1375,'Can delete data sharing consent text overrides',343,'delete_datasharingconsenttextoverrides'),(1376,'Can view data sharing consent text overrides',343,'view_datasharingconsenttextoverrides'),(1377,'Can add learner data transmission audit',344,'add_learnerdatatransmissionaudit'),(1378,'Can change learner data transmission audit',344,'change_learnerdatatransmissionaudit'),(1379,'Can delete learner data transmission audit',344,'delete_learnerdatatransmissionaudit'),(1380,'Can view learner data transmission audit',344,'view_learnerdatatransmissionaudit'),(1381,'Can add content metadata item transmission',345,'add_contentmetadataitemtransmission'),(1382,'Can change content metadata item transmission',345,'change_contentmetadataitemtransmission'),(1383,'Can delete content metadata item transmission',345,'delete_contentmetadataitemtransmission'),(1384,'Can view content metadata item transmission',345,'view_contentmetadataitemtransmission'),(1385,'Can add degreed enterprise customer configuration',346,'add_degreedenterprisecustomerconfiguration'),(1386,'Can change degreed enterprise customer configuration',346,'change_degreedenterprisecustomerconfiguration'),(1387,'Can delete degreed enterprise customer configuration',346,'delete_degreedenterprisecustomerconfiguration'),(1388,'Can view degreed enterprise customer configuration',346,'view_degreedenterprisecustomerconfiguration'),(1389,'Can add degreed global configuration',347,'add_degreedglobalconfiguration'),(1390,'Can change degreed global configuration',347,'change_degreedglobalconfiguration'),(1391,'Can delete degreed global configuration',347,'delete_degreedglobalconfiguration'),(1392,'Can view degreed global configuration',347,'view_degreedglobalconfiguration'),(1393,'Can add degreed learner data transmission audit',348,'add_degreedlearnerdatatransmissionaudit'),(1394,'Can change degreed learner data transmission audit',348,'change_degreedlearnerdatatransmissionaudit'),(1395,'Can delete degreed learner data transmission audit',348,'delete_degreedlearnerdatatransmissionaudit'),(1396,'Can view degreed learner data transmission audit',348,'view_degreedlearnerdatatransmissionaudit'),(1397,'Can add historical degreed enterprise customer configuration',349,'add_historicaldegreedenterprisecustomerconfiguration'),(1398,'Can change historical degreed enterprise customer configuration',349,'change_historicaldegreedenterprisecustomerconfiguration'),(1399,'Can delete historical degreed enterprise customer configuration',349,'delete_historicaldegreedenterprisecustomerconfiguration'),(1400,'Can view historical degreed enterprise customer configuration',349,'view_historicaldegreedenterprisecustomerconfiguration'),(1401,'Can add sap success factors learner data transmission audit',350,'add_sapsuccessfactorslearnerdatatransmissionaudit'),(1402,'Can change sap success factors learner data transmission audit',350,'change_sapsuccessfactorslearnerdatatransmissionaudit'),(1403,'Can delete sap success factors learner data transmission audit',350,'delete_sapsuccessfactorslearnerdatatransmissionaudit'),(1404,'Can view sap success factors learner data transmission audit',350,'view_sapsuccessfactorslearnerdatatransmissionaudit'),(1405,'Can add sap success factors global configuration',351,'add_sapsuccessfactorsglobalconfiguration'),(1406,'Can change sap success factors global configuration',351,'change_sapsuccessfactorsglobalconfiguration'),(1407,'Can delete sap success factors global configuration',351,'delete_sapsuccessfactorsglobalconfiguration'),(1408,'Can view sap success factors global configuration',351,'view_sapsuccessfactorsglobalconfiguration'),(1409,'Can add sap success factors enterprise customer configuration',352,'add_sapsuccessfactorsenterprisecustomerconfiguration'),(1410,'Can change sap success factors enterprise customer configuration',352,'change_sapsuccessfactorsenterprisecustomerconfiguration'),(1411,'Can delete sap success factors enterprise customer configuration',352,'delete_sapsuccessfactorsenterprisecustomerconfiguration'),(1412,'Can view sap success factors enterprise customer configuration',352,'view_sapsuccessfactorsenterprisecustomerconfiguration'),(1413,'Can add cornerstone enterprise customer configuration',353,'add_cornerstoneenterprisecustomerconfiguration'),(1414,'Can change cornerstone enterprise customer configuration',353,'change_cornerstoneenterprisecustomerconfiguration'),(1415,'Can delete cornerstone enterprise customer configuration',353,'delete_cornerstoneenterprisecustomerconfiguration'),(1416,'Can view cornerstone enterprise customer configuration',353,'view_cornerstoneenterprisecustomerconfiguration'),(1417,'Can add cornerstone global configuration',354,'add_cornerstoneglobalconfiguration'),(1418,'Can change cornerstone global configuration',354,'change_cornerstoneglobalconfiguration'),(1419,'Can delete cornerstone global configuration',354,'delete_cornerstoneglobalconfiguration'),(1420,'Can view cornerstone global configuration',354,'view_cornerstoneglobalconfiguration'),(1421,'Can add cornerstone learner data transmission audit',355,'add_cornerstonelearnerdatatransmissionaudit'),(1422,'Can change cornerstone learner data transmission audit',355,'change_cornerstonelearnerdatatransmissionaudit'),(1423,'Can delete cornerstone learner data transmission audit',355,'delete_cornerstonelearnerdatatransmissionaudit'),(1424,'Can view cornerstone learner data transmission audit',355,'view_cornerstonelearnerdatatransmissionaudit'),(1425,'Can add historical cornerstone enterprise customer configuration',356,'add_historicalcornerstoneenterprisecustomerconfiguration'),(1426,'Can change historical cornerstone enterprise customer configuration',356,'change_historicalcornerstoneenterprisecustomerconfiguration'),(1427,'Can delete historical cornerstone enterprise customer configuration',356,'delete_historicalcornerstoneenterprisecustomerconfiguration'),(1428,'Can view historical cornerstone enterprise customer configuration',356,'view_historicalcornerstoneenterprisecustomerconfiguration'),(1429,'Can add xapilrs configuration',357,'add_xapilrsconfiguration'),(1430,'Can change xapilrs configuration',357,'change_xapilrsconfiguration'),(1431,'Can delete xapilrs configuration',357,'delete_xapilrsconfiguration'),(1432,'Can view xapilrs configuration',357,'view_xapilrsconfiguration'),(1433,'Can add xapi learner data transmission audit',358,'add_xapilearnerdatatransmissionaudit'),(1434,'Can change xapi learner data transmission audit',358,'change_xapilearnerdatatransmissionaudit'),(1435,'Can delete xapi learner data transmission audit',358,'delete_xapilearnerdatatransmissionaudit'),(1436,'Can view xapi learner data transmission audit',358,'view_xapilearnerdatatransmissionaudit'),(1437,'Can add historical blackboard enterprise customer configuration',359,'add_historicalblackboardenterprisecustomerconfiguration'),(1438,'Can change historical blackboard enterprise customer configuration',359,'change_historicalblackboardenterprisecustomerconfiguration'),(1439,'Can delete historical blackboard enterprise customer configuration',359,'delete_historicalblackboardenterprisecustomerconfiguration'),(1440,'Can view historical blackboard enterprise customer configuration',359,'view_historicalblackboardenterprisecustomerconfiguration'),(1441,'Can add blackboard enterprise customer configuration',360,'add_blackboardenterprisecustomerconfiguration'),(1442,'Can change blackboard enterprise customer configuration',360,'change_blackboardenterprisecustomerconfiguration'),(1443,'Can delete blackboard enterprise customer configuration',360,'delete_blackboardenterprisecustomerconfiguration'),(1444,'Can view blackboard enterprise customer configuration',360,'view_blackboardenterprisecustomerconfiguration'),(1445,'Can add blackboard learner data transmission audit',361,'add_blackboardlearnerdatatransmissionaudit'),(1446,'Can change blackboard learner data transmission audit',361,'change_blackboardlearnerdatatransmissionaudit'),(1447,'Can delete blackboard learner data transmission audit',361,'delete_blackboardlearnerdatatransmissionaudit'),(1448,'Can view blackboard learner data transmission audit',361,'view_blackboardlearnerdatatransmissionaudit'),(1449,'Can add blackboard learner assessment data transmission audit',362,'add_blackboardlearnerassessmentdatatransmissionaudit'),(1450,'Can change blackboard learner assessment data transmission audit',362,'change_blackboardlearnerassessmentdatatransmissionaudit'),(1451,'Can delete blackboard learner assessment data transmission audit',362,'delete_blackboardlearnerassessmentdatatransmissionaudit'),(1452,'Can view blackboard learner assessment data transmission audit',362,'view_blackboardlearnerassessmentdatatransmissionaudit'),(1453,'Can add historical canvas enterprise customer configuration',363,'add_historicalcanvasenterprisecustomerconfiguration'),(1454,'Can change historical canvas enterprise customer configuration',363,'change_historicalcanvasenterprisecustomerconfiguration'),(1455,'Can delete historical canvas enterprise customer configuration',363,'delete_historicalcanvasenterprisecustomerconfiguration'),(1456,'Can view historical canvas enterprise customer configuration',363,'view_historicalcanvasenterprisecustomerconfiguration'),(1457,'Can add canvas enterprise customer configuration',364,'add_canvasenterprisecustomerconfiguration'),(1458,'Can change canvas enterprise customer configuration',364,'change_canvasenterprisecustomerconfiguration'),(1459,'Can delete canvas enterprise customer configuration',364,'delete_canvasenterprisecustomerconfiguration'),(1460,'Can view canvas enterprise customer configuration',364,'view_canvasenterprisecustomerconfiguration'),(1461,'Can add canvas learner data transmission audit',365,'add_canvaslearnerdatatransmissionaudit'),(1462,'Can change canvas learner data transmission audit',365,'change_canvaslearnerdatatransmissionaudit'),(1463,'Can delete canvas learner data transmission audit',365,'delete_canvaslearnerdatatransmissionaudit'),(1464,'Can view canvas learner data transmission audit',365,'view_canvaslearnerdatatransmissionaudit'),(1465,'Can add canvas learner assessment data transmission audit',366,'add_canvaslearnerassessmentdatatransmissionaudit'),(1466,'Can change canvas learner assessment data transmission audit',366,'change_canvaslearnerassessmentdatatransmissionaudit'),(1467,'Can delete canvas learner assessment data transmission audit',366,'delete_canvaslearnerassessmentdatatransmissionaudit'),(1468,'Can view canvas learner assessment data transmission audit',366,'view_canvaslearnerassessmentdatatransmissionaudit'),(1469,'Can add moodle enterprise customer configuration',367,'add_moodleenterprisecustomerconfiguration'),(1470,'Can change moodle enterprise customer configuration',367,'change_moodleenterprisecustomerconfiguration'),(1471,'Can delete moodle enterprise customer configuration',367,'delete_moodleenterprisecustomerconfiguration'),(1472,'Can view moodle enterprise customer configuration',367,'view_moodleenterprisecustomerconfiguration'),(1473,'Can add historical moodle enterprise customer configuration',368,'add_historicalmoodleenterprisecustomerconfiguration'),(1474,'Can change historical moodle enterprise customer configuration',368,'change_historicalmoodleenterprisecustomerconfiguration'),(1475,'Can delete historical moodle enterprise customer configuration',368,'delete_historicalmoodleenterprisecustomerconfiguration'),(1476,'Can view historical moodle enterprise customer configuration',368,'view_historicalmoodleenterprisecustomerconfiguration'),(1477,'Can add moodle learner data transmission audit',369,'add_moodlelearnerdatatransmissionaudit'),(1478,'Can change moodle learner data transmission audit',369,'change_moodlelearnerdatatransmissionaudit'),(1479,'Can delete moodle learner data transmission audit',369,'delete_moodlelearnerdatatransmissionaudit'),(1480,'Can view moodle learner data transmission audit',369,'view_moodlelearnerdatatransmissionaudit'),(1481,'Can add announcement',370,'add_announcement'),(1482,'Can change announcement',370,'change_announcement'),(1483,'Can delete announcement',370,'delete_announcement'),(1484,'Can view announcement',370,'view_announcement'),(1485,'Can add bookmark',371,'add_bookmark'),(1486,'Can change bookmark',371,'change_bookmark'),(1487,'Can delete bookmark',371,'delete_bookmark'),(1488,'Can view bookmark',371,'view_bookmark'),(1489,'Can add x block cache',372,'add_xblockcache'),(1490,'Can change x block cache',372,'change_xblockcache'),(1491,'Can delete x block cache',372,'delete_xblockcache'),(1492,'Can view x block cache',372,'view_xblockcache'),(1493,'Can add content library',373,'add_contentlibrary'),(1494,'Can change content library',373,'change_contentlibrary'),(1495,'Can delete content library',373,'delete_contentlibrary'),(1496,'Can view content library',373,'view_contentlibrary'),(1497,'Can add content library permission',374,'add_contentlibrarypermission'),(1498,'Can change content library permission',374,'change_contentlibrarypermission'),(1499,'Can delete content library permission',374,'delete_contentlibrarypermission'),(1500,'Can view content library permission',374,'view_contentlibrarypermission'),(1501,'Can add credentials api config',375,'add_credentialsapiconfig'),(1502,'Can change credentials api config',375,'change_credentialsapiconfig'),(1503,'Can delete credentials api config',375,'delete_credentialsapiconfig'),(1504,'Can view credentials api config',375,'view_credentialsapiconfig'),(1505,'Can add notify_credentials argument',376,'add_notifycredentialsconfig'),(1506,'Can change notify_credentials argument',376,'change_notifycredentialsconfig'),(1507,'Can delete notify_credentials argument',376,'delete_notifycredentialsconfig'),(1508,'Can view notify_credentials argument',376,'view_notifycredentialsconfig'),(1509,'Can add historical discussions configuration',377,'add_historicaldiscussionsconfiguration'),(1510,'Can change historical discussions configuration',377,'change_historicaldiscussionsconfiguration'),(1511,'Can delete historical discussions configuration',377,'delete_historicaldiscussionsconfiguration'),(1512,'Can view historical discussions configuration',377,'view_historicaldiscussionsconfiguration'),(1513,'Can add discussions configuration',378,'add_discussionsconfiguration'),(1514,'Can change discussions configuration',378,'change_discussionsconfiguration'),(1515,'Can delete discussions configuration',378,'delete_discussionsconfiguration'),(1516,'Can view discussions configuration',378,'view_discussionsconfiguration'),(1517,'Can add provider filter',379,'add_providerfilter'),(1518,'Can change provider filter',379,'change_providerfilter'),(1519,'Can delete provider filter',379,'delete_providerfilter'),(1520,'Can view provider filter',379,'view_providerfilter'),(1521,'Can add persistent subsection grade',380,'add_persistentsubsectiongrade'),(1522,'Can change persistent subsection grade',380,'change_persistentsubsectiongrade'),(1523,'Can delete persistent subsection grade',380,'delete_persistentsubsectiongrade'),(1524,'Can view persistent subsection grade',380,'view_persistentsubsectiongrade'),(1525,'Can add visible blocks',381,'add_visibleblocks'),(1526,'Can change visible blocks',381,'change_visibleblocks'),(1527,'Can delete visible blocks',381,'delete_visibleblocks'),(1528,'Can view visible blocks',381,'view_visibleblocks'),(1529,'Can add course persistent grades flag',382,'add_coursepersistentgradesflag'),(1530,'Can change course persistent grades flag',382,'change_coursepersistentgradesflag'),(1531,'Can delete course persistent grades flag',382,'delete_coursepersistentgradesflag'),(1532,'Can view course persistent grades flag',382,'view_coursepersistentgradesflag'),(1533,'Can add persistent grades enabled flag',383,'add_persistentgradesenabledflag'),(1534,'Can change persistent grades enabled flag',383,'change_persistentgradesenabledflag'),(1535,'Can delete persistent grades enabled flag',383,'delete_persistentgradesenabledflag'),(1536,'Can view persistent grades enabled flag',383,'view_persistentgradesenabledflag'),(1537,'Can add persistent course grade',384,'add_persistentcoursegrade'),(1538,'Can change persistent course grade',384,'change_persistentcoursegrade'),(1539,'Can delete persistent course grade',384,'delete_persistentcoursegrade'),(1540,'Can view persistent course grade',384,'view_persistentcoursegrade'),(1541,'Can add compute grades setting',385,'add_computegradessetting'),(1542,'Can change compute grades setting',385,'change_computegradessetting'),(1543,'Can delete compute grades setting',385,'delete_computegradessetting'),(1544,'Can view compute grades setting',385,'view_computegradessetting'),(1545,'Can add persistent subsection grade override',386,'add_persistentsubsectiongradeoverride'),(1546,'Can change persistent subsection grade override',386,'change_persistentsubsectiongradeoverride'),(1547,'Can delete persistent subsection grade override',386,'delete_persistentsubsectiongradeoverride'),(1548,'Can view persistent subsection grade override',386,'view_persistentsubsectiongradeoverride'),(1549,'Can add historical persistent subsection grade override',387,'add_historicalpersistentsubsectiongradeoverride'),(1550,'Can change historical persistent subsection grade override',387,'change_historicalpersistentsubsectiongradeoverride'),(1551,'Can delete historical persistent subsection grade override',387,'delete_historicalpersistentsubsectiongradeoverride'),(1552,'Can view historical persistent subsection grade override',387,'view_historicalpersistentsubsectiongradeoverride'),(1553,'Can add historical program enrollment',388,'add_historicalprogramenrollment'),(1554,'Can change historical program enrollment',388,'change_historicalprogramenrollment'),(1555,'Can delete historical program enrollment',388,'delete_historicalprogramenrollment'),(1556,'Can view historical program enrollment',388,'view_historicalprogramenrollment'),(1557,'Can add program enrollment',389,'add_programenrollment'),(1558,'Can change program enrollment',389,'change_programenrollment'),(1559,'Can delete program enrollment',389,'delete_programenrollment'),(1560,'Can view program enrollment',389,'view_programenrollment'),(1561,'Can add historical program course enrollment',390,'add_historicalprogramcourseenrollment'),(1562,'Can change historical program course enrollment',390,'change_historicalprogramcourseenrollment'),(1563,'Can delete historical program course enrollment',390,'delete_historicalprogramcourseenrollment'),(1564,'Can view historical program course enrollment',390,'view_historicalprogramcourseenrollment'),(1565,'Can add program course enrollment',391,'add_programcourseenrollment'),(1566,'Can change program course enrollment',391,'change_programcourseenrollment'),(1567,'Can delete program course enrollment',391,'delete_programcourseenrollment'),(1568,'Can view program course enrollment',391,'view_programcourseenrollment'),(1569,'Can add course access role assignment',392,'add_courseaccessroleassignment'),(1570,'Can change course access role assignment',392,'change_courseaccessroleassignment'),(1571,'Can delete course access role assignment',392,'delete_courseaccessroleassignment'),(1572,'Can view course access role assignment',392,'view_courseaccessroleassignment'),(1573,'Can add site theme',393,'add_sitetheme'),(1574,'Can change site theme',393,'change_sitetheme'),(1575,'Can delete site theme',393,'delete_sitetheme'),(1576,'Can view site theme',393,'view_sitetheme'),(1577,'Can add content date',394,'add_contentdate'),(1578,'Can change content date',394,'change_contentdate'),(1579,'Can delete content date',394,'delete_contentdate'),(1580,'Can view content date',394,'view_contentdate'),(1581,'Can add date policy',395,'add_datepolicy'),(1582,'Can change date policy',395,'change_datepolicy'),(1583,'Can delete date policy',395,'delete_datepolicy'),(1584,'Can view date policy',395,'view_datepolicy'),(1585,'Can add user date',396,'add_userdate'),(1586,'Can change user date',396,'change_userdate'),(1587,'Can delete user date',396,'delete_userdate'),(1588,'Can view user date',396,'view_userdate'),(1589,'Can add csv operation',397,'add_csvoperation'),(1590,'Can change csv operation',397,'change_csvoperation'),(1591,'Can delete csv operation',397,'delete_csvoperation'),(1592,'Can view csv operation',397,'view_csvoperation'),(1593,'Can add block completion',398,'add_blockcompletion'),(1594,'Can change block completion',398,'change_blockcompletion'),(1595,'Can delete block completion',398,'delete_blockcompletion'),(1596,'Can view block completion',398,'view_blockcompletion'),(1597,'Can add proctored exam',399,'add_proctoredexam'),(1598,'Can change proctored exam',399,'change_proctoredexam'),(1599,'Can delete proctored exam',399,'delete_proctoredexam'),(1600,'Can view proctored exam',399,'view_proctoredexam'),(1601,'Can add Proctored exam review policy',400,'add_proctoredexamreviewpolicy'),(1602,'Can change Proctored exam review policy',400,'change_proctoredexamreviewpolicy'),(1603,'Can delete Proctored exam review policy',400,'delete_proctoredexamreviewpolicy'),(1604,'Can view Proctored exam review policy',400,'view_proctoredexamreviewpolicy'),(1605,'Can add proctored exam review policy history',401,'add_proctoredexamreviewpolicyhistory'),(1606,'Can change proctored exam review policy history',401,'change_proctoredexamreviewpolicyhistory'),(1607,'Can delete proctored exam review policy history',401,'delete_proctoredexamreviewpolicyhistory'),(1608,'Can view proctored exam review policy history',401,'view_proctoredexamreviewpolicyhistory'),(1609,'Can add proctored exam software secure comment',402,'add_proctoredexamsoftwaresecurecomment'),(1610,'Can change proctored exam software secure comment',402,'change_proctoredexamsoftwaresecurecomment'),(1611,'Can delete proctored exam software secure comment',402,'delete_proctoredexamsoftwaresecurecomment'),(1612,'Can view proctored exam software secure comment',402,'view_proctoredexamsoftwaresecurecomment'),(1613,'Can add Proctored exam software secure review',403,'add_proctoredexamsoftwaresecurereview'),(1614,'Can change Proctored exam software secure review',403,'change_proctoredexamsoftwaresecurereview'),(1615,'Can delete Proctored exam software secure review',403,'delete_proctoredexamsoftwaresecurereview'),(1616,'Can view Proctored exam software secure review',403,'view_proctoredexamsoftwaresecurereview'),(1617,'Can add Proctored exam review archive',404,'add_proctoredexamsoftwaresecurereviewhistory'),(1618,'Can change Proctored exam review archive',404,'change_proctoredexamsoftwaresecurereviewhistory'),(1619,'Can delete Proctored exam review archive',404,'delete_proctoredexamsoftwaresecurereviewhistory'),(1620,'Can view Proctored exam review archive',404,'view_proctoredexamsoftwaresecurereviewhistory'),(1621,'Can add proctored allowance',405,'add_proctoredexamstudentallowance'),(1622,'Can change proctored allowance',405,'change_proctoredexamstudentallowance'),(1623,'Can delete proctored allowance',405,'delete_proctoredexamstudentallowance'),(1624,'Can view proctored allowance',405,'view_proctoredexamstudentallowance'),(1625,'Can add proctored allowance history',406,'add_proctoredexamstudentallowancehistory'),(1626,'Can change proctored allowance history',406,'change_proctoredexamstudentallowancehistory'),(1627,'Can delete proctored allowance history',406,'delete_proctoredexamstudentallowancehistory'),(1628,'Can view proctored allowance history',406,'view_proctoredexamstudentallowancehistory'),(1629,'Can add proctored exam attempt',407,'add_proctoredexamstudentattempt'),(1630,'Can change proctored exam attempt',407,'change_proctoredexamstudentattempt'),(1631,'Can delete proctored exam attempt',407,'delete_proctoredexamstudentattempt'),(1632,'Can view proctored exam attempt',407,'view_proctoredexamstudentattempt'),(1633,'Can add proctored exam attempt history',408,'add_proctoredexamstudentattempthistory'),(1634,'Can change proctored exam attempt history',408,'change_proctoredexamstudentattempthistory'),(1635,'Can delete proctored exam attempt history',408,'delete_proctoredexamstudentattempthistory'),(1636,'Can view proctored exam attempt history',408,'view_proctoredexamstudentattempthistory'),(1637,'Can add score overrider',409,'add_scoreoverrider'),(1638,'Can change score overrider',409,'change_scoreoverrider'),(1639,'Can delete score overrider',409,'delete_scoreoverrider'),(1640,'Can view score overrider',409,'view_scoreoverrider'),(1641,'Can add lti configuration',410,'add_lticonfiguration'),(1642,'Can change lti configuration',410,'change_lticonfiguration'),(1643,'Can delete lti configuration',410,'delete_lticonfiguration'),(1644,'Can view lti configuration',410,'view_lticonfiguration'),(1645,'Can add lti ags line item',411,'add_ltiagslineitem'),(1646,'Can change lti ags line item',411,'change_ltiagslineitem'),(1647,'Can delete lti ags line item',411,'delete_ltiagslineitem'),(1648,'Can view lti ags line item',411,'view_ltiagslineitem'),(1649,'Can add lti ags score',412,'add_ltiagsscore'),(1650,'Can change lti ags score',412,'change_ltiagsscore'),(1651,'Can delete lti ags score',412,'delete_ltiagsscore'),(1652,'Can view lti ags score',412,'view_ltiagsscore'),(1653,'Can add lti dl content item',413,'add_ltidlcontentitem'),(1654,'Can change lti dl content item',413,'change_ltidlcontentitem'),(1655,'Can delete lti dl content item',413,'delete_ltidlcontentitem'),(1656,'Can view lti dl content item',413,'view_ltidlcontentitem'),(1657,'Can add course allow pii sharing in lti flag',414,'add_courseallowpiisharinginltiflag'),(1658,'Can change course allow pii sharing in lti flag',414,'change_courseallowpiisharinginltiflag'),(1659,'Can delete course allow pii sharing in lti flag',414,'delete_courseallowpiisharinginltiflag'),(1660,'Can view course allow pii sharing in lti flag',414,'view_courseallowpiisharinginltiflag'),(1661,'Can add verified name',415,'add_verifiedname'),(1662,'Can change verified name',415,'change_verifiedname'),(1663,'Can delete verified name',415,'delete_verifiedname'),(1664,'Can view verified name',415,'view_verifiedname'),(1665,'Can add video upload config',416,'add_videouploadconfig'),(1666,'Can change video upload config',416,'change_videouploadconfig'),(1667,'Can delete video upload config',416,'delete_videouploadconfig'),(1668,'Can view video upload config',416,'view_videouploadconfig'),(1669,'Can add course outline regenerate',417,'add_courseoutlineregenerate'),(1670,'Can change course outline regenerate',417,'change_courseoutlineregenerate'),(1671,'Can delete course outline regenerate',417,'delete_courseoutlineregenerate'),(1672,'Can view course outline regenerate',417,'view_courseoutlineregenerate'),(1673,'Can add course creator',418,'add_coursecreator'),(1674,'Can change course creator',418,'change_coursecreator'),(1675,'Can delete course creator',418,'delete_coursecreator'),(1676,'Can view course creator',418,'view_coursecreator'),(1677,'Can add studio config',419,'add_studioconfig'),(1678,'Can change studio config',419,'change_studioconfig'),(1679,'Can delete studio config',419,'delete_studioconfig'),(1680,'Can view studio config',419,'view_studioconfig'),(1681,'Can add available tag value',420,'add_tagavailablevalues'),(1682,'Can change available tag value',420,'change_tagavailablevalues'),(1683,'Can delete available tag value',420,'delete_tagavailablevalues'),(1684,'Can view available tag value',420,'view_tagavailablevalues'),(1685,'Can add tag category',421,'add_tagcategories'),(1686,'Can change tag category',421,'change_tagcategories'),(1687,'Can delete tag category',421,'delete_tagcategories'),(1688,'Can view tag category',421,'view_tagcategories'),(1689,'Can add user task artifact',422,'add_usertaskartifact'),(1690,'Can change user task artifact',422,'change_usertaskartifact'),(1691,'Can delete user task artifact',422,'delete_usertaskartifact'),(1692,'Can view user task artifact',422,'view_usertaskartifact'),(1693,'Can add user task status',423,'add_usertaskstatus'),(1694,'Can change user task status',423,'change_usertaskstatus'),(1695,'Can delete user task status',423,'delete_usertaskstatus'),(1696,'Can view user task status',423,'view_usertaskstatus');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_registration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activation_key` varchar(32) NOT NULL,
  `user_id` int(11) NOT NULL,
  `activation_timestamp` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `activation_key` (`activation_key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `auth_registration_user_id_f99bc297_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_registration`
--

LOCK TABLES `auth_registration` WRITE;
/*!40000 ALTER TABLE `auth_registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'!QFIHa5ncEQJjtL8LA3TmFTGSrgGXTLzQUZAG1Ffh',NULL,1,'ecommerce_worker','','','ecommerce_worker@example.com',1,1,'2021-07-30 19:56:11.249784'),(2,'!E69DHoVh7k0hsyCSfGpDqySuKUGdcnkdj5MgI8CX',NULL,0,'login_service_user','','','login_service_user@fake.email',0,1,'2021-07-30 19:58:11.936191'),(3,'pbkdf2_sha256$150000$iScgl9wzIn3L$uy1M+YAS6ouDBBUBt64heQPHaElxihWuPGRomhee5Q4=',NULL,1,'edx','','','edx@example.com',1,1,'2021-07-30 20:01:46.187568'),(4,'pbkdf2_sha256$150000$LUUZX5Zbwfth$pGwk/LJUNYIJzbF1MPXp5OuX3rb9Odi7c1RZLbtR7M0=',NULL,0,'enterprise_worker','','','enterprise_worker@example.com',1,1,'2021-07-30 20:02:08.780691'),(5,'pbkdf2_sha256$20000$TjE34FJjc3vv$0B7GUmH8RwrOc/BvMoxjb5j8EgnWTt3sxorDANeF7Qw=',NULL,0,'honor','','','honor@example.com',0,1,'2021-07-30 20:03:49.290239'),(6,'pbkdf2_sha256$20000$TjE34FJjc3vv$0B7GUmH8RwrOc/BvMoxjb5j8EgnWTt3sxorDANeF7Qw=',NULL,0,'audit','','','audit@example.com',0,1,'2021-07-30 20:04:00.735092'),(7,'pbkdf2_sha256$20000$TjE34FJjc3vv$0B7GUmH8RwrOc/BvMoxjb5j8EgnWTt3sxorDANeF7Qw=',NULL,0,'verified','','','verified@example.com',0,1,'2021-07-30 20:04:12.294406'),(8,'pbkdf2_sha256$20000$TjE34FJjc3vv$0B7GUmH8RwrOc/BvMoxjb5j8EgnWTt3sxorDANeF7Qw=',NULL,0,'staff','','','staff@example.com',1,1,'2021-07-30 20:04:24.080168'),(9,'pbkdf2_sha256$150000$0CbTPO52VORK$lXIrLK9B9YhnAv+5hmgizznv8znftP8ms5cr+3ii3hw=',NULL,1,'retirement_service_worker','','','retirement_service_worker@example.com',1,1,'2021-07-30 20:15:14.924863');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (1,4,1225),(2,4,1226),(3,4,1227),(4,4,1228),(5,4,1229),(6,4,1230),(7,4,1231),(8,4,1232),(9,4,1233),(10,4,1234),(11,4,1235),(12,4,1236),(13,4,1237),(14,4,1238),(15,4,1239),(16,4,1240),(17,4,1241),(18,4,1242),(19,4,1243),(20,4,1244),(21,4,1245),(22,4,1246),(23,4,1247),(24,4,1248),(25,4,1249),(26,4,1250),(27,4,1251),(28,4,1252),(29,4,1253),(30,4,1254),(31,4,1255),(32,4,1256),(33,4,1257),(34,4,1258),(35,4,1259),(36,4,1260),(37,4,1261),(38,4,1262),(39,4,1263),(40,4,1264),(41,4,1265),(42,4,1266),(43,4,1267),(44,4,1268),(45,4,1269),(46,4,1270),(47,4,1271),(48,4,1272),(49,4,1273),(50,4,1274),(51,4,1275),(52,4,1276),(53,4,1277),(54,4,1278),(55,4,1279),(56,4,1280),(57,4,1281),(58,4,1282),(59,4,1283),(60,4,1284),(61,4,1285),(62,4,1286),(63,4,1287),(64,4,1288),(65,4,1289),(66,4,1290),(67,4,1291),(68,4,1292),(69,4,1293),(70,4,1294),(71,4,1295),(72,4,1296),(73,4,1297),(74,4,1298),(75,4,1299),(76,4,1300),(77,4,1301),(78,4,1302),(79,4,1303),(80,4,1304),(81,4,1305),(82,4,1306),(83,4,1307),(84,4,1308),(85,4,1309),(86,4,1310),(87,4,1311),(88,4,1312),(89,4,1313),(90,4,1314),(91,4,1315),(92,4,1316),(93,4,1317),(94,4,1318),(95,4,1319),(96,4,1320),(97,4,1321),(98,4,1322),(99,4,1323),(100,4,1324),(101,4,1325),(102,4,1326),(103,4,1327),(104,4,1328),(105,4,1329),(106,4,1330),(107,4,1331),(108,4,1332),(109,4,1333),(110,4,1334),(111,4,1335),(112,4,1336),(113,4,1337),(114,4,1338),(115,4,1339),(116,4,1340),(117,4,1341),(118,4,1342),(119,4,1343),(120,4,1344),(121,4,1345),(122,4,1346),(123,4,1347),(124,4,1348),(125,4,1349),(126,4,1350),(127,4,1351),(128,4,1352),(129,4,1353),(130,4,1354),(131,4,1355),(132,4,1356),(133,4,1357),(134,4,1358),(135,4,1359),(136,4,1360),(137,4,1361),(138,4,1362),(139,4,1363),(140,4,1364);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_userprofile`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `meta` longtext NOT NULL,
  `courseware` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `year_of_birth` int(11) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `level_of_education` varchar(6) DEFAULT NULL,
  `mailing_address` longtext,
  `city` longtext,
  `country` varchar(2) DEFAULT NULL,
  `goals` longtext,
  `bio` varchar(3000) DEFAULT NULL,
  `profile_image_uploaded_at` datetime(6) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `auth_userprofile_name_50909f10` (`name`),
  KEY `auth_userprofile_language_8948d814` (`language`),
  KEY `auth_userprofile_location_ca92e4f6` (`location`),
  KEY `auth_userprofile_year_of_birth_6559b9a5` (`year_of_birth`),
  KEY `auth_userprofile_gender_44a122fb` (`gender`),
  KEY `auth_userprofile_level_of_education_93927e04` (`level_of_education`),
  CONSTRAINT `auth_userprofile_user_id_62634b27_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_userprofile`
--

LOCK TABLES `auth_userprofile` WRITE;
/*!40000 ALTER TABLE `auth_userprofile` DISABLE KEYS */;
INSERT INTO `auth_userprofile` VALUES (1,'','','course.xml','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL),(2,'','','course.xml','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL),(3,'','','course.xml','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),(4,'','','course.xml','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,NULL),(5,'','','course.xml','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,NULL),(6,'','','course.xml','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,NULL),(7,'','','course.xml','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,NULL),(8,'','','course.xml','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `auth_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badges_badgeassertion`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badges_badgeassertion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  `backend` varchar(50) NOT NULL,
  `image_url` varchar(200) NOT NULL,
  `assertion_url` varchar(200) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `created` datetime(6) NOT NULL,
  `badge_class_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `badges_badgeassertion_created_d098832e` (`created`),
  KEY `badges_badgeassertio_badge_class_id_902ac30e_fk_badges_ba` (`badge_class_id`),
  KEY `badges_badgeassertion_user_id_13665630_fk_auth_user_id` (`user_id`),
  CONSTRAINT `badges_badgeassertio_badge_class_id_902ac30e_fk_badges_ba` FOREIGN KEY (`badge_class_id`) REFERENCES `badges_badgeclass` (`id`),
  CONSTRAINT `badges_badgeassertion_user_id_13665630_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badges_badgeassertion`
--

LOCK TABLES `badges_badgeassertion` WRITE;
/*!40000 ALTER TABLE `badges_badgeassertion` DISABLE KEYS */;
/*!40000 ALTER TABLE `badges_badgeassertion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badges_badgeclass`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badges_badgeclass` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `issuing_component` varchar(50) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `criteria` longtext NOT NULL,
  `mode` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `badgr_server_slug` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `badges_badgeclass_slug_issuing_component_course_id_92cd3912_uniq` (`slug`,`issuing_component`,`course_id`),
  KEY `badges_badgeclass_slug_5f420f6f` (`slug`),
  KEY `badges_badgeclass_issuing_component_85b6d93d` (`issuing_component`),
  KEY `badges_badgeclass_badgr_server_slug_701a8bf1` (`badgr_server_slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badges_badgeclass`
--

LOCK TABLES `badges_badgeclass` WRITE;
/*!40000 ALTER TABLE `badges_badgeclass` DISABLE KEYS */;
/*!40000 ALTER TABLE `badges_badgeclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badges_coursecompleteimageconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badges_coursecompleteimageconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mode` varchar(125) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `default` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mode` (`mode`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badges_coursecompleteimageconfiguration`
--

LOCK TABLES `badges_coursecompleteimageconfiguration` WRITE;
/*!40000 ALTER TABLE `badges_coursecompleteimageconfiguration` DISABLE KEYS */;
INSERT INTO `badges_coursecompleteimageconfiguration` VALUES (1,'honor','badges/badges/honor.png',0),(2,'verified','badges/badges/verified.png',0),(3,'professional','badges/badges/professional.png',0);
/*!40000 ALTER TABLE `badges_coursecompleteimageconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badges_courseeventbadgesconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badges_courseeventbadgesconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `courses_completed` longtext NOT NULL,
  `courses_enrolled` longtext NOT NULL,
  `course_groups` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `badges_courseeventba_changed_by_id_db04ed01_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `badges_courseeventba_changed_by_id_db04ed01_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badges_courseeventbadgesconfiguration`
--

LOCK TABLES `badges_courseeventbadgesconfiguration` WRITE;
/*!40000 ALTER TABLE `badges_courseeventbadgesconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `badges_courseeventbadgesconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blackboard_blackboardenterprisecustomerconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blackboard_blackboardenterprisecustomerconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `transmission_chunk_size` int(11) NOT NULL,
  `channel_worker_username` varchar(255) DEFAULT NULL,
  `catalogs_to_transmit` longtext,
  `client_id` varchar(255) DEFAULT NULL,
  `client_secret` varchar(255) DEFAULT NULL,
  `blackboard_base_url` varchar(255) DEFAULT NULL,
  `refresh_token` varchar(255) NOT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_customer_id` (`enterprise_customer_id`),
  CONSTRAINT `blackboard_blackboar_enterprise_customer__39f883b0_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blackboard_blackboardenterprisecustomerconfiguration`
--

LOCK TABLES `blackboard_blackboardenterprisecustomerconfiguration` WRITE;
/*!40000 ALTER TABLE `blackboard_blackboardenterprisecustomerconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `blackboard_blackboardenterprisecustomerconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blackboard_blackboardlearnerassessmentdatatransmissionaudit`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blackboard_blackboardlearnerassessmentdatatransmissionaudit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blackboard_user_email` varchar(255) NOT NULL,
  `enterprise_course_enrollment_id` int(10) unsigned NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `subsection_id` varchar(255) NOT NULL,
  `grade_point_score` double NOT NULL,
  `grade_points_possible` double NOT NULL,
  `grade` double NOT NULL,
  `subsection_name` varchar(255) NOT NULL,
  `status` varchar(100) NOT NULL,
  `error_message` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blackboard_blackboardlearne_enterprise_course_enrollmen_4d99c86b` (`enterprise_course_enrollment_id`),
  KEY `blackboard_blackboardlearne_subsection_id_6ddb999b` (`subsection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blackboard_blackboardlearnerassessmentdatatransmissionaudit`
--

LOCK TABLES `blackboard_blackboardlearnerassessmentdatatransmissionaudit` WRITE;
/*!40000 ALTER TABLE `blackboard_blackboardlearnerassessmentdatatransmissionaudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `blackboard_blackboardlearnerassessmentdatatransmissionaudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blackboard_blackboardlearnerdatatransmissionaudit`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blackboard_blackboardlearnerdatatransmissionaudit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blackboard_user_email` varchar(255) NOT NULL,
  `completed_timestamp` varchar(10) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `course_completed` tinyint(1) NOT NULL,
  `enterprise_course_enrollment_id` int(10) unsigned NOT NULL,
  `grade` decimal(3,2) DEFAULT NULL,
  `total_hours` double DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `error_message` longtext NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blackboard_blackboardlearne_enterprise_course_enrollmen_941ea543` (`enterprise_course_enrollment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blackboard_blackboardlearnerdatatransmissionaudit`
--

LOCK TABLES `blackboard_blackboardlearnerdatatransmissionaudit` WRITE;
/*!40000 ALTER TABLE `blackboard_blackboardlearnerdatatransmissionaudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `blackboard_blackboardlearnerdatatransmissionaudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blackboard_historicalblackboardenterprisecustomerconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blackboard_historicalblackboardenterprisecustomerconfiguration` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `transmission_chunk_size` int(11) NOT NULL,
  `channel_worker_username` varchar(255) DEFAULT NULL,
  `catalogs_to_transmit` longtext,
  `client_id` varchar(255) DEFAULT NULL,
  `client_secret` varchar(255) DEFAULT NULL,
  `blackboard_base_url` varchar(255) DEFAULT NULL,
  `refresh_token` varchar(255) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_customer_id` char(32) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `blackboard_historica_history_user_id_099f295b_fk_auth_user` (`history_user_id`),
  KEY `blackboard_historicalblackb_id_7675c06f` (`id`),
  KEY `blackboard_historicalblackb_enterprise_customer_id_b9053e9a` (`enterprise_customer_id`),
  CONSTRAINT `blackboard_historica_history_user_id_099f295b_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blackboard_historicalblackboardenterprisecustomerconfiguration`
--

LOCK TABLES `blackboard_historicalblackboardenterprisecustomerconfiguration` WRITE;
/*!40000 ALTER TABLE `blackboard_historicalblackboardenterprisecustomerconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `blackboard_historicalblackboardenterprisecustomerconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block_structure`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_structure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `data_usage_key` varchar(255) NOT NULL,
  `data_version` varchar(255) DEFAULT NULL,
  `data_edit_timestamp` datetime(6) DEFAULT NULL,
  `transformers_schema_version` varchar(255) NOT NULL,
  `block_structure_schema_version` varchar(255) NOT NULL,
  `data` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_usage_key` (`data_usage_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block_structure`
--

LOCK TABLES `block_structure` WRITE;
/*!40000 ALTER TABLE `block_structure` DISABLE KEYS */;
/*!40000 ALTER TABLE `block_structure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block_structure_config`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_structure_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `num_versions_to_keep` int(11) DEFAULT NULL,
  `cache_timeout_in_seconds` int(11) DEFAULT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `block_structure_config_changed_by_id_45af0b10_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `block_structure_config_changed_by_id_45af0b10_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block_structure_config`
--

LOCK TABLES `block_structure_config` WRITE;
/*!40000 ALTER TABLE `block_structure_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `block_structure_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookmarks_bookmark`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookmarks_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_key` varchar(255) NOT NULL,
  `usage_key` varchar(255) NOT NULL,
  `path` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `xblock_cache_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bookmarks_bookmark_user_id_usage_key_61eac24b_uniq` (`user_id`,`usage_key`),
  KEY `bookmarks_bookmark_course_key_46609583` (`course_key`),
  KEY `bookmarks_bookmark_usage_key_d07927c9` (`usage_key`),
  KEY `bookmarks_bookmark_xblock_cache_id_808a7639_fk_bookmarks` (`xblock_cache_id`),
  CONSTRAINT `bookmarks_bookmark_user_id_a26bf17c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `bookmarks_bookmark_xblock_cache_id_808a7639_fk_bookmarks` FOREIGN KEY (`xblock_cache_id`) REFERENCES `bookmarks_xblockcache` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmarks_bookmark`
--

LOCK TABLES `bookmarks_bookmark` WRITE;
/*!40000 ALTER TABLE `bookmarks_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookmarks_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookmarks_xblockcache`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookmarks_xblockcache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_key` varchar(255) NOT NULL,
  `usage_key` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `paths` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usage_key` (`usage_key`),
  KEY `bookmarks_xblockcache_course_key_5297fa77` (`course_key`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmarks_xblockcache`
--

LOCK TABLES `bookmarks_xblockcache` WRITE;
/*!40000 ALTER TABLE `bookmarks_xblockcache` DISABLE KEYS */;
INSERT INTO `bookmarks_xblockcache` VALUES (1,'2021-07-30 20:03:24.260222','2021-07-30 20:03:33.880393','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@course+block@course','Demonstration Course','[]'),(2,'2021-07-30 20:03:33.885412','2021-07-30 20:03:33.885412','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@chapter+block@9fca584977d04885bc911ea76a9ef29e','holding section','[]'),(3,'2021-07-30 20:03:33.891574','2021-07-30 20:03:36.146111','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@07bc32474380492cb34f76e5f9d9a135','New Subsection','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@9fca584977d04885bc911ea76a9ef29e\",\"holding section\"]]]'),(4,'2021-07-30 20:03:33.898424','2021-07-30 20:03:33.898424','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7','About Exams and Certificates','[]'),(5,'2021-07-30 20:03:33.904979','2021-07-30 20:03:36.148434','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow','edX Exams','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"]]]'),(6,'2021-07-30 20:03:33.911162','2021-07-30 20:03:36.150601','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@d6eaa391d2be41dea20b8b1bfbcb1c45','Getting Your edX Certificate','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"]]]'),(7,'2021-07-30 20:03:33.917012','2021-07-30 20:03:36.152857','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@6b6bee43c7c641509da71c9299cc9f5a','Blank HTML Page','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@d6eaa391d2be41dea20b8b1bfbcb1c45\",\"Getting Your edX Certificate\"]]]'),(8,'2021-07-30 20:03:33.922767','2021-07-30 20:03:36.155215','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@148ae8fa73ea460eb6f05505da0ba6e6','Getting Your edX Certificate','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@d6eaa391d2be41dea20b8b1bfbcb1c45\",\"Getting Your edX Certificate\"]]]'),(9,'2021-07-30 20:03:33.928358','2021-07-30 20:03:36.157345','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@c7e98fd39a6944edb6b286c32e1150ff','Passing a Course','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"]]]'),(10,'2021-07-30 20:03:33.934034','2021-07-30 20:03:36.159592','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@23e6eda482c04335af2bb265beacaf59','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@c7e98fd39a6944edb6b286c32e1150ff\",\"Passing a Course\"]]]'),(11,'2021-07-30 20:03:33.939769','2021-07-30 20:03:36.161845','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@5e009378f0b64585baa0a14b155974b9','Passing a Course','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@c7e98fd39a6944edb6b286c32e1150ff\",\"Passing a Course\"]]]'),(12,'2021-07-30 20:03:33.945787','2021-07-30 20:03:36.164318','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@1b0e2c2c84884b95b1c99fb678cc964c','Overall Grade Performance','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"]]]'),(13,'2021-07-30 20:03:33.951625','2021-07-30 20:03:36.167111','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@1a810b1a3b2447b998f0917d0e5a802b','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@1b0e2c2c84884b95b1c99fb678cc964c\",\"Overall Grade Performance\"]]]'),(14,'2021-07-30 20:03:33.957410','2021-07-30 20:03:36.169208','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@f4a39219742149f781a1dda6f43a623c','Overall Grade','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@1b0e2c2c84884b95b1c99fb678cc964c\",\"Overall Grade Performance\"]]]'),(15,'2021-07-30 20:03:33.963415','2021-07-30 20:03:36.171241','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_36e0beb03f0a','Randomized Questions','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"]]]'),(16,'2021-07-30 20:03:33.969660','2021-07-30 20:03:36.173388','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@ddede76df71045ffa16de9d1481d2119','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_36e0beb03f0a\",\"Randomized Questions\"]]]'),(17,'2021-07-30 20:03:33.976421','2021-07-30 20:03:36.175424','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@ex_practice_3','Randomized Questions','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_36e0beb03f0a\",\"Randomized Questions\"]]]'),(18,'2021-07-30 20:03:33.982368','2021-07-30 20:03:36.177689','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_ac391cde8a91','Limited Checks','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"]]]'),(19,'2021-07-30 20:03:33.988662','2021-07-30 20:03:36.179683','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@cd177caa62444fbca48aa8f843f09eac','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_ac391cde8a91\",\"Limited Checks\"]]]'),(20,'2021-07-30 20:03:33.994929','2021-07-30 20:03:36.181911','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@d1b84dcd39b0423d9e288f27f0f7f242','Few Checks','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_ac391cde8a91\",\"Limited Checks\"]]]'),(21,'2021-07-30 20:03:34.001779','2021-07-30 20:03:36.184010','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@ex_practice_limited_checks','Limited Checks','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_ac391cde8a91\",\"Limited Checks\"]]]'),(22,'2021-07-30 20:03:34.007288','2021-07-30 20:03:36.185938','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@f91d8d31f7cf48ce990f8d8745ae4cfa','Answering More Than Once','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"]]]'),(23,'2021-07-30 20:03:34.012626','2021-07-30 20:03:36.188045','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@b8cec2a19ebf463f90cd3544c7927b0e','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@f91d8d31f7cf48ce990f8d8745ae4cfa\",\"Answering More Than Once\"]]]'),(24,'2021-07-30 20:03:34.018165','2021-07-30 20:03:36.190319','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@651e0945b77f42e0a4c89b8c3e6f5b3b','Answering More Than Once','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@f91d8d31f7cf48ce990f8d8745ae4cfa\",\"Answering More Than Once\"]]]'),(25,'2021-07-30 20:03:34.023682','2021-07-30 20:03:36.192779','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@b6662b497c094bcc9b870d8270c90c93','Getting Answers','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"]]]'),(26,'2021-07-30 20:03:34.029073','2021-07-30 20:03:36.195107','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@f480df4ce91347c5ae4301ddf6146238','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@b6662b497c094bcc9b870d8270c90c93\",\"Getting Answers\"]]]'),(27,'2021-07-30 20:03:34.035006','2021-07-30 20:03:36.197400','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@45d46192272c4f6db6b63586520bbdf4','Getting Answers','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@b6662b497c094bcc9b870d8270c90c93\",\"Getting Answers\"]]]'),(28,'2021-07-30 20:03:34.041106','2021-07-30 20:03:36.199514','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_f04afeac0131','Immediate Feedback','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"]]]'),(29,'2021-07-30 20:03:34.046474','2021-07-30 20:03:36.201588','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@4aba537a78774bd5a862485a8563c345','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_f04afeac0131\",\"Immediate Feedback\"]]]'),(30,'2021-07-30 20:03:34.051976','2021-07-30 20:03:36.203653','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@ex_practice_2','Immediate Feedback','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_f04afeac0131\",\"Immediate Feedback\"]]]'),(31,'2021-07-30 20:03:34.059969','2021-07-30 20:03:36.205523','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@934cc32c177d41b580c8413e561346b3','EdX Exams','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"]]]'),(32,'2021-07-30 20:03:34.066107','2021-07-30 20:03:36.207501','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@8293139743f34377817d537b69911530','EdX Exams','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@934cc32c177d41b580c8413e561346b3\",\"EdX Exams\"]]]'),(33,'2021-07-30 20:03:34.072381','2021-07-30 20:03:34.072381','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration','Example Week 3: Be Social','[]'),(34,'2021-07-30 20:03:34.077954','2021-07-30 20:03:36.209357','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@6ab9c442501d472c8ed200e367b4edfa','More Ways to Connect','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"]]]'),(35,'2021-07-30 20:03:34.084107','2021-07-30 20:03:36.211456','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@3f2c11aba9434e459676a7d7acc4d960','Google Hangout','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@6ab9c442501d472c8ed200e367b4edfa\",\"More Ways to Connect\"]]]'),(36,'2021-07-30 20:03:34.089551','2021-07-30 20:03:36.213563','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@ade92343df3d4953a40ab3adc8805390','Google Hangout','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@6ab9c442501d472c8ed200e367b4edfa\",\"More Ways to Connect\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@3f2c11aba9434e459676a7d7acc4d960\",\"Google Hangout\"]]]'),(37,'2021-07-30 20:03:34.094986','2021-07-30 20:03:36.215900','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@55cbc99f262443d886a25cf84594eafb','Text','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@6ab9c442501d472c8ed200e367b4edfa\",\"More Ways to Connect\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@3f2c11aba9434e459676a7d7acc4d960\",\"Google Hangout\"]]]'),(38,'2021-07-30 20:03:34.100798','2021-07-30 20:03:36.218454','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@d45779ad3d024a40a09ad8cc317c0970','Text','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@6ab9c442501d472c8ed200e367b4edfa\",\"More Ways to Connect\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@3f2c11aba9434e459676a7d7acc4d960\",\"Google Hangout\"]]]'),(39,'2021-07-30 20:03:34.106656','2021-07-30 20:03:36.220531','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@dbe8fc027bcb4fe9afb744d2e8415855','Homework - Find Your Study Buddy','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"]]]'),(40,'2021-07-30 20:03:34.112602','2021-07-30 20:03:36.222708','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@26d89b08f75d48829a63520ed8b0037d','Homework - Find Your Study Buddy','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@dbe8fc027bcb4fe9afb744d2e8415855\",\"Homework - Find Your Study Buddy\"]]]'),(41,'2021-07-30 20:03:34.118545','2021-07-30 20:03:36.225035','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@6018785795994726950614ce7d0f38c5','Find Your Study Buddy','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@dbe8fc027bcb4fe9afb744d2e8415855\",\"Homework - Find Your Study Buddy\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@26d89b08f75d48829a63520ed8b0037d\",\"Homework - Find Your Study Buddy\"]]]'),(42,'2021-07-30 20:03:34.124137','2021-07-30 20:03:36.227301','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@48ecb924d7fe4b66a230137626bfa93e','Lesson 3 - Be Social','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"]]]'),(43,'2021-07-30 20:03:34.129731','2021-07-30 20:03:36.229360','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@312cb4faed17420e82ab3178fc3e251a','Getting Help','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@48ecb924d7fe4b66a230137626bfa93e\",\"Lesson 3 - Be Social\"]]]'),(44,'2021-07-30 20:03:34.137066','2021-07-30 20:03:36.231680','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@8bb218cccf8d40519a971ff0e4901ccf','Getting Help','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@48ecb924d7fe4b66a230137626bfa93e\",\"Lesson 3 - Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@312cb4faed17420e82ab3178fc3e251a\",\"Getting Help\"]]]'),(45,'2021-07-30 20:03:34.142633','2021-07-30 20:03:36.233878','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_3888db0bc286','Discussion Forums','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@48ecb924d7fe4b66a230137626bfa93e\",\"Lesson 3 - Be Social\"]]]'),(46,'2021-07-30 20:03:34.148272','2021-07-30 20:03:36.236045','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@discussion_5deb6081620d','Discussion Forums','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@48ecb924d7fe4b66a230137626bfa93e\",\"Lesson 3 - Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_3888db0bc286\",\"Discussion Forums\"]]]'),(47,'2021-07-30 20:03:34.153945','2021-07-30 20:03:36.237940','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@html_49b4494da2f7','Discussion Forums','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@48ecb924d7fe4b66a230137626bfa93e\",\"Lesson 3 - Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_3888db0bc286\",\"Discussion Forums\"]]]'),(48,'2021-07-30 20:03:34.159681','2021-07-30 20:03:36.239692','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@3c4b575924bf4b75a2f3542df5c354fc','Be Social','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@48ecb924d7fe4b66a230137626bfa93e\",\"Lesson 3 - Be Social\"]]]'),(49,'2021-07-30 20:03:34.167018','2021-07-30 20:03:36.241783','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@f9f3a25e7bab46e583fd1fbbd7a2f6a0','Be Social','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@48ecb924d7fe4b66a230137626bfa93e\",\"Lesson 3 - Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@3c4b575924bf4b75a2f3542df5c354fc\",\"Be Social\"]]]'),(50,'2021-07-30 20:03:34.173267','2021-07-30 20:03:34.173267','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions','Example Week 2: Get Interactive','[]'),(51,'2021-07-30 20:03:34.178723','2021-07-30 20:03:36.243675','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@175e76c4951144a29d46211361266e0e','Homework - Essays','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"]]]'),(52,'2021-07-30 20:03:34.184049','2021-07-30 20:03:36.245750','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@fb79dcbad35b466a8c6364f8ffee9050','Peer Assessed Essays','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@175e76c4951144a29d46211361266e0e\",\"Homework - Essays\"]]]'),(53,'2021-07-30 20:03:34.189540','2021-07-30 20:03:36.247854','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@12ad4f3ff4c14114a6e629b00e000976','Peer Grading','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@175e76c4951144a29d46211361266e0e\",\"Homework - Essays\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@fb79dcbad35b466a8c6364f8ffee9050\",\"Peer Assessed Essays\"]]]'),(54,'2021-07-30 20:03:34.195238','2021-07-30 20:03:36.249933','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@openassessment+block@b24c33ea35954c7889e1d2944d3fe397','Open Response Assessment','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@175e76c4951144a29d46211361266e0e\",\"Homework - Essays\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@fb79dcbad35b466a8c6364f8ffee9050\",\"Peer Assessed Essays\"]]]'),(55,'2021-07-30 20:03:34.200919','2021-07-30 20:03:36.252111','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations','Homework - Labs and Demos','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"]]]'),(56,'2021-07-30 20:03:34.206957','2021-07-30 20:03:36.253931','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_bc69a47c6fae','Protein Creator','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"]]]'),(57,'2021-07-30 20:03:34.212500','2021-07-30 20:03:36.255948','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@ed01bcd164e64038a78964a16eac3edc','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_bc69a47c6fae\",\"Protein Creator\"]]]'),(58,'2021-07-30 20:03:34.218097','2021-07-30 20:03:36.257931','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@700x_proteinmake','Designing Proteins in Two Dimensions','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_bc69a47c6fae\",\"Protein Creator\"]]]'),(59,'2021-07-30 20:03:34.224287','2021-07-30 20:03:36.260233','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@78e3719e864e45f3bee938461f3c3de6','Protein Builder','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_bc69a47c6fae\",\"Protein Creator\"]]]'),(60,'2021-07-30 20:03:34.230315','2021-07-30 20:03:36.262289','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_c037f3757df1','Electric Circuit Simulator','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"]]]'),(61,'2021-07-30 20:03:34.236339','2021-07-30 20:03:36.264455','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@4f06b358a96f4d1dae57d6d81acd06f2','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_c037f3757df1\",\"Electric Circuit Simulator\"]]]'),(62,'2021-07-30 20:03:34.242191','2021-07-30 20:03:36.266846','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@logic_gate_problem','problem','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_c037f3757df1\",\"Electric Circuit Simulator\"]]]'),(63,'2021-07-30 20:03:34.247678','2021-07-30 20:03:36.269407','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@free_form_simulation','problem','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_c037f3757df1\",\"Electric Circuit Simulator\"]]]'),(64,'2021-07-30 20:03:34.253906','2021-07-30 20:03:36.271843','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@d5a5caaf35e84ebc9a747038465dcfb4','Electronic Circuit Simulator','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_c037f3757df1\",\"Electric Circuit Simulator\"]]]'),(65,'2021-07-30 20:03:34.259489','2021-07-30 20:03:36.273794','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_aae927868e55','Code Grader','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"]]]'),(66,'2021-07-30 20:03:34.264793','2021-07-30 20:03:36.275753','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@c6cd4bea43454aaea60ad01beb0cf213','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_aae927868e55\",\"Code Grader\"]]]'),(67,'2021-07-30 20:03:34.270243','2021-07-30 20:03:36.277770','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@python_grader','problem','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_aae927868e55\",\"Code Grader\"]]]'),(68,'2021-07-30 20:03:34.276020','2021-07-30 20:03:36.279708','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@891211e17f9a472290a5f12c7a6626d7','Code Grader','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_aae927868e55\",\"Code Grader\"]]]'),(69,'2021-07-30 20:03:34.281702','2021-07-30 20:03:36.281696','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_0fab6aa52165','Molecule Editor','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"]]]'),(70,'2021-07-30 20:03:34.288321','2021-07-30 20:03:36.283693','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@0aa7a3bdbe18427795b0c1a1d7c3cb9a','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_0fab6aa52165\",\"Molecule Editor\"]]]'),(71,'2021-07-30 20:03:34.295069','2021-07-30 20:03:36.285662','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@700x_editmolB','Molecule Editor','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_0fab6aa52165\",\"Molecule Editor\"]]]'),(72,'2021-07-30 20:03:34.300490','2021-07-30 20:03:36.287760','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@2b94658d2eee4d85ae13f83bc24cfca9','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_0fab6aa52165\",\"Molecule Editor\"]]]'),(73,'2021-07-30 20:03:34.307422','2021-07-30 20:03:36.289723','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@d6cee45205a449369d7ef8f159b22bdf','Labs and Demos','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"]]]'),(74,'2021-07-30 20:03:34.313140','2021-07-30 20:03:36.291733','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@2bee8c4248e842a19ba1e73ed8d426c2','Labs and Demos','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@d6cee45205a449369d7ef8f159b22bdf\",\"Labs and Demos\"]]]'),(75,'2021-07-30 20:03:34.318597','2021-07-30 20:03:36.293805','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations','Lesson 2 - Let\'s Get Interactive!','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"]]]'),(76,'2021-07-30 20:03:34.324260','2021-07-30 20:03:36.295823','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_d32bf9b2242c','Electronic Sound Experiment','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"]]]'),(77,'2021-07-30 20:03:34.329949','2021-07-30 20:03:36.297772','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@03f051f9a8814881a3783d2511613aa6','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_d32bf9b2242c\",\"Electronic Sound Experiment\"]]]'),(78,'2021-07-30 20:03:34.335479','2021-07-30 20:03:36.299890','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@Lab_5B_Mosfet_Amplifier_Experiment','Electronic Sound Experiment','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_d32bf9b2242c\",\"Electronic Sound Experiment\"]]]'),(79,'2021-07-30 20:03:34.340832','2021-07-30 20:03:36.302164','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_98cf62510471','Zooming Diagrams','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"]]]'),(80,'2021-07-30 20:03:34.346195','2021-07-30 20:03:36.304249','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@e0d7423118ab432582d03e8e8dad8e36','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_98cf62510471\",\"Zooming Diagrams\"]]]'),(81,'2021-07-30 20:03:34.351457','2021-07-30 20:03:36.306250','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@700x_pathways','Zooming Diagrams','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_98cf62510471\",\"Zooming Diagrams\"]]]'),(82,'2021-07-30 20:03:34.356814','2021-07-30 20:03:36.308194','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_2dbb0072785e','An Interactive Reference Table','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"]]]'),(83,'2021-07-30 20:03:34.362235','2021-07-30 20:03:36.311102','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@6f7a6670f87147149caeff6afa07a526','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_2dbb0072785e\",\"An Interactive Reference Table\"]]]'),(84,'2021-07-30 20:03:34.369800','2021-07-30 20:03:36.313155','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@html_07d547513285','An Interactive Reference Table','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_2dbb0072785e\",\"An Interactive Reference Table\"]]]'),(85,'2021-07-30 20:03:34.376606','2021-07-30 20:03:36.315129','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@d0d804e8863c4a95a659c04d8a2b2bc0','Lesson 2 - Let\'s Get Interactive! ','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"]]]'),(86,'2021-07-30 20:03:34.383575','2021-07-30 20:03:36.317242','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@78d7d3642f3a4dbabbd1b017861aa5f2','Lesson 2: Let\'s Get Interactive!','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@d0d804e8863c4a95a659c04d8a2b2bc0\",\"Lesson 2 - Let\'s Get Interactive! \"]]]'),(87,'2021-07-30 20:03:34.389492','2021-07-30 20:03:34.389492','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations','Example Week 1: Getting Started','[]'),(88,'2021-07-30 20:03:34.395161','2021-07-30 20:03:36.319018','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions','Homework - Question Styles','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"]]]'),(89,'2021-07-30 20:03:34.400911','2021-07-30 20:03:36.320862','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@e8a5cc2aed424838853defab7be45e42','Text input','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"]]]'),(90,'2021-07-30 20:03:34.407121','2021-07-30 20:03:36.322902','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@6244918637ed4ff4b5f94a840a7e4b43','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@e8a5cc2aed424838853defab7be45e42\",\"Text input\"]]]'),(91,'2021-07-30 20:03:34.414451','2021-07-30 20:03:36.324845','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@0d759dee4f9d459c8956136dbde55f02','Text Input','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@e8a5cc2aed424838853defab7be45e42\",\"Text input\"]]]'),(92,'2021-07-30 20:03:34.422041','2021-07-30 20:03:36.327101','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@2889db1677a549abb15eb4d886f95d1c','Numerical Input','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"]]]'),(93,'2021-07-30 20:03:34.429172','2021-07-30 20:03:36.329258','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@501aed9d902349eeb2191fa505548de2','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@2889db1677a549abb15eb4d886f95d1c\",\"Numerical Input\"]]]'),(94,'2021-07-30 20:03:34.435970','2021-07-30 20:03:36.331420','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@75f9562c77bc4858b61f907bb810d974','Numerical Input','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@2889db1677a549abb15eb4d886f95d1c\",\"Numerical Input\"]]]'),(95,'2021-07-30 20:03:34.442239','2021-07-30 20:03:36.333658','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_1fef54c2b23b','Chemical Equations','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"]]]'),(96,'2021-07-30 20:03:34.448010','2021-07-30 20:03:36.336219','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@4d672c5893cb4f1dad0de67d2008522e','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_1fef54c2b23b\",\"Chemical Equations\"]]]'),(97,'2021-07-30 20:03:34.453929','2021-07-30 20:03:36.338560','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@Sample_ChemFormula_Problem','Chemical Equations','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_1fef54c2b23b\",\"Chemical Equations\"]]]'),(98,'2021-07-30 20:03:34.460984','2021-07-30 20:03:36.340617','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_0c92347a5c00','Mathematical Expressions','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"]]]'),(99,'2021-07-30 20:03:34.467463','2021-07-30 20:03:36.342805','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@870371212ba04dcf9536d7c7b8f3109e','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_0c92347a5c00\",\"Mathematical Expressions\"]]]'),(100,'2021-07-30 20:03:34.474532','2021-07-30 20:03:36.345085','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@Sample_Algebraic_Problem','Mathematical Expressions','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_0c92347a5c00\",\"Mathematical Expressions\"]]]'),(101,'2021-07-30 20:03:34.481012','2021-07-30 20:03:36.347204','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@54bb9b142c6c4c22afc62bcb628f0e68','Multiple Choice Questions','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"]]]'),(102,'2021-07-30 20:03:34.486933','2021-07-30 20:03:36.349378','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@67c26b1e826e47aaa29757f62bcd1ad0','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@54bb9b142c6c4c22afc62bcb628f0e68\",\"Multiple Choice Questions\"]]]'),(103,'2021-07-30 20:03:34.492981','2021-07-30 20:03:36.351652','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@a0effb954cca4759994f1ac9e9434bf4','Multiple Choice Questions','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@54bb9b142c6c4c22afc62bcb628f0e68\",\"Multiple Choice Questions\"]]]'),(104,'2021-07-30 20:03:34.499208','2021-07-30 20:03:36.353684','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@47dbd5f836544e61877a483c0b75606c','Drag and Drop','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"]]]'),(105,'2021-07-30 20:03:34.504981','2021-07-30 20:03:36.355852','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@5ab88e67d46049b9aa694cb240c39cef','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@47dbd5f836544e61877a483c0b75606c\",\"Drag and Drop\"]]]'),(106,'2021-07-30 20:03:34.510675','2021-07-30 20:03:36.358331','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@d2e35c1d294b4ba0b3b1048615605d2a','Drag and Drop','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@47dbd5f836544e61877a483c0b75606c\",\"Drag and Drop\"]]]'),(107,'2021-07-30 20:03:34.516068','2021-07-30 20:03:36.360379','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@2152d4a4aadc4cb0af5256394a3d1fc7','Pointing on a Picture','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"]]]'),(108,'2021-07-30 20:03:34.521924','2021-07-30 20:03:36.362473','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@e5eac7e1a5a24f5fa7ed77bb6d136591','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@2152d4a4aadc4cb0af5256394a3d1fc7\",\"Pointing on a Picture\"]]]'),(109,'2021-07-30 20:03:34.527139','2021-07-30 20:03:36.364748','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@c554538a57664fac80783b99d9d6da7c','Pointing on a Picture','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@2152d4a4aadc4cb0af5256394a3d1fc7\",\"Pointing on a Picture\"]]]'),(110,'2021-07-30 20:03:34.532732','2021-07-30 20:03:36.366806','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5','Lesson 1 - Getting Started','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"]]]'),(111,'2021-07-30 20:03:34.538100','2021-07-30 20:03:36.369358','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@134df56c516a4a0dbb24dd5facef746e','Reading Assignments','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"]]]'),(112,'2021-07-30 20:03:34.543759','2021-07-30 20:03:36.371590','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@ffa5817d49e14fec83ad6187cbe16358','Reading Sample','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@134df56c516a4a0dbb24dd5facef746e\",\"Reading Assignments\"]]]'),(113,'2021-07-30 20:03:34.549425','2021-07-30 20:03:36.373674','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@303034da25524878a2e66fb57c91cf85','Attributing Blame','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@134df56c516a4a0dbb24dd5facef746e\",\"Reading Assignments\"]]]'),(114,'2021-07-30 20:03:34.555152','2021-07-30 20:03:36.375844','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@932e6f2ce8274072a355a94560216d1a','Perchance to Dream','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@134df56c516a4a0dbb24dd5facef746e\",\"Reading Assignments\"]]]'),(115,'2021-07-30 20:03:34.561311','2021-07-30 20:03:36.378261','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@2574c523e97b477a9d72fbb37bfb995f','Text','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@134df56c516a4a0dbb24dd5facef746e\",\"Reading Assignments\"]]]'),(116,'2021-07-30 20:03:34.567060','2021-07-30 20:03:36.380235','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@e0254b911fa246218bd98bbdadffef06','Reading Assignments','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@134df56c516a4a0dbb24dd5facef746e\",\"Reading Assignments\"]]]'),(117,'2021-07-30 20:03:34.572719','2021-07-30 20:03:36.382108','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@e3601c0abee6427d8c17e6d6f8fdddd1','Interactive Questions','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"]]]'),(118,'2021-07-30 20:03:34.578628','2021-07-30 20:03:36.384253','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@3169f89efde2452993f2f2d9bc74f5b2','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@e3601c0abee6427d8c17e6d6f8fdddd1\",\"Interactive Questions\"]]]'),(119,'2021-07-30 20:03:34.584566','2021-07-30 20:03:36.386309','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@9cee77a606ea4c1aa5440e0ea5d0f618','Interactive Questions','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@e3601c0abee6427d8c17e6d6f8fdddd1\",\"Interactive Questions\"]]]'),(120,'2021-07-30 20:03:34.589925','2021-07-30 20:03:36.388251','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@256f17a44983429fb1a60802203ee4e0','Video Presentation Styles','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"]]]'),(121,'2021-07-30 20:03:34.595520','2021-07-30 20:03:36.390153','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@e2cb0e0994f84b0abfa5f4ae42ed9d44','Video Presentation Styles','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@256f17a44983429fb1a60802203ee4e0\",\"Video Presentation Styles\"]]]'),(122,'2021-07-30 20:03:34.602791','2021-07-30 20:03:36.392156','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@video+block@636541acbae448d98ab484b028c9a7f6','Connecting a Circuit and a Circuit Diagram','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@256f17a44983429fb1a60802203ee4e0\",\"Video Presentation Styles\"]]]'),(123,'2021-07-30 20:03:34.608643','2021-07-30 20:03:36.394481','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@c2f7008c9ccf4bd09d5d800c98fb0722','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@256f17a44983429fb1a60802203ee4e0\",\"Video Presentation Styles\"]]]'),(124,'2021-07-30 20:03:34.615043','2021-07-30 20:03:36.396564','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@4a1bba2a403f40bca5ec245e945b0d76','Video Demonstrations','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"]]]'),(125,'2021-07-30 20:03:34.622419','2021-07-30 20:03:36.398754','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@9f9e1373cc8243b985c8750cc8acec7d','Video Demonstrations','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@4a1bba2a403f40bca5ec245e945b0d76\",\"Video Demonstrations\"]]]'),(126,'2021-07-30 20:03:34.629028','2021-07-30 20:03:36.400947','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@ed5dccf14ae94353961f46fa07217491','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@4a1bba2a403f40bca5ec245e945b0d76\",\"Video Demonstrations\"]]]'),(127,'2021-07-30 20:03:34.635315','2021-07-30 20:03:36.403055','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@3dc16db8d14842e38324e95d4030b8a0','Videos on edX','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"]]]'),(128,'2021-07-30 20:03:34.640507','2021-07-30 20:03:36.405360','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@722085be27c84ac693cfebc8ac5da700','Videos on edX','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@3dc16db8d14842e38324e95d4030b8a0\",\"Videos on edX\"]]]'),(129,'2021-07-30 20:03:34.645976','2021-07-30 20:03:36.407664','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@video+block@5c90cffecd9b48b188cbfea176bf7fe9','Video','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@3dc16db8d14842e38324e95d4030b8a0\",\"Videos on edX\"]]]'),(130,'2021-07-30 20:03:34.651419','2021-07-30 20:03:36.409924','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@0a3b4139f51a4917a3aff9d519b1eeb6','Videos on edX','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@3dc16db8d14842e38324e95d4030b8a0\",\"Videos on edX\"]]]'),(131,'2021-07-30 20:03:34.656564','2021-07-30 20:03:36.412091','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@4f6c1b4e316a419ab5b6bf30e6c708e9','Working with Videos','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"]]]'),(132,'2021-07-30 20:03:34.662217','2021-07-30 20:03:36.414194','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@412dc8dbb6674014862237b23c1f643f','Working with Videos','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@4f6c1b4e316a419ab5b6bf30e6c708e9\",\"Working with Videos\"]]]'),(133,'2021-07-30 20:03:34.667956','2021-07-30 20:03:36.416499','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@video+block@7e9b434e6de3435ab99bd3fb25bde807','Science and Cooking Chef Profile: JOSÉ ANDRÉS','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@4f6c1b4e316a419ab5b6bf30e6c708e9\",\"Working with Videos\"]]]'),(134,'2021-07-30 20:03:34.673669','2021-07-30 20:03:36.418681','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@6bcccc2d7343416e9e03fd7325b2f232','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@4f6c1b4e316a419ab5b6bf30e6c708e9\",\"Working with Videos\"]]]'),(135,'2021-07-30 20:03:34.680003','2021-07-30 20:03:36.422548','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@867dddb6f55d410caaa9c1eb9c6743ec','Getting Started','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"]]]'),(136,'2021-07-30 20:03:34.685628','2021-07-30 20:03:36.426762','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@82d599b014b246c7a9b5dfc750dc08a9','Getting Started','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@867dddb6f55d410caaa9c1eb9c6743ec\",\"Getting Started\"]]]'),(137,'2021-07-30 20:03:34.692838','2021-07-30 20:03:34.692838','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@chapter+block@d8a6192ade314473a78242dfeedfbf5b','Introduction','[]'),(138,'2021-07-30 20:03:34.699965','2021-07-30 20:03:36.429265','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@edx_introduction','Demo Course Overview','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@d8a6192ade314473a78242dfeedfbf5b\",\"Introduction\"]]]'),(139,'2021-07-30 20:03:34.707732','2021-07-30 20:03:36.431473','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_0270f6de40fc','Introduction: Video and Sequences','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@d8a6192ade314473a78242dfeedfbf5b\",\"Introduction\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@edx_introduction\",\"Demo Course Overview\"]]]'),(140,'2021-07-30 20:03:34.714769','2021-07-30 20:03:36.433680','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@video+block@0b9e39477cf34507a7a48f74be381fdd','Welcome!','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@d8a6192ade314473a78242dfeedfbf5b\",\"Introduction\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@edx_introduction\",\"Demo Course Overview\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_0270f6de40fc\",\"Introduction: Video and Sequences\"]]]'),(141,'2021-07-30 20:03:34.721544','2021-07-30 20:03:36.437044','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@030e35c4756a4ddc8d40b95fbbfff4d4','Blank HTML Page','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@d8a6192ade314473a78242dfeedfbf5b\",\"Introduction\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@edx_introduction\",\"Demo Course Overview\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_0270f6de40fc\",\"Introduction: Video and Sequences\"]]]'),(142,'2021-07-30 20:03:36.443213','2021-07-30 20:03:36.443213','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@45c7cedb4bfe46f4a68c78787151cfb5','New Unit','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@9fca584977d04885bc911ea76a9ef29e\",\"holding section\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@07bc32474380492cb34f76e5f9d9a135\",\"New Subsection\"]]]'),(143,'2021-07-30 20:03:36.448660','2021-07-30 20:03:36.448660','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@7efc7bf4a47b4a6cb6595c32cde7712a','Homework - Find Your Study Buddy','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@48ecb924d7fe4b66a230137626bfa93e\",\"Lesson 3 - Be Social\"]]]'),(144,'2021-07-30 20:03:36.453829','2021-07-30 20:03:36.453829','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@87fa6792d79f4862be098e5169e93339','Blank HTML Page','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@48ecb924d7fe4b66a230137626bfa93e\",\"Lesson 3 - Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@7efc7bf4a47b4a6cb6595c32cde7712a\",\"Homework - Find Your Study Buddy\"]]]'),(145,'2021-07-30 20:03:36.459469','2021-07-30 20:03:36.459469','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@8f89194410954e768bde1764985454a7','Molecule Structures','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"]]]'),(146,'2021-07-30 20:03:36.466120','2021-07-30 20:03:36.466120','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@9b9687073e904ae197799dc415df899f','Molecule Structures','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@8f89194410954e768bde1764985454a7\",\"Molecule Structures\"]]]'),(147,'2021-07-30 20:03:36.472271','2021-07-30 20:03:36.472271','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@4e592689563243c484af947465eaef0d','New Unit','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"]]]'),(148,'2021-07-30 20:03:36.478643','2021-07-30 20:03:36.478643','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@video+block@af7fe1335eb841cd81ce31c7ee8eb069','Video','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@4e592689563243c484af947465eaef0d\",\"New Unit\"]]]'),(149,'2021-07-30 20:03:36.483921','2021-07-30 20:03:36.483921','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@fb6b62dbec4348528629cf2232b86aea','Instructor Programmed Responses','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"]]]'),(150,'2021-07-30 20:03:36.489113','2021-07-30 20:03:36.489113','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@d7daeff25e4f4026bdd269ae69e03e02','Instructor-Programmed Responses','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@fb6b62dbec4348528629cf2232b86aea\",\"Instructor Programmed Responses\"]]]'),(151,'2021-07-30 20:03:36.494582','2021-07-30 20:03:36.494582','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@d91b9e5d8bc64d57a1332d06bf2f2193','When Are Your Exams? ','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"]]]'),(152,'2021-07-30 20:03:36.500455','2021-07-30 20:03:36.500455','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@9d5104b502f24ee89c3d2f4ce9d347cf','When Are Your Exams? ','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@d91b9e5d8bc64d57a1332d06bf2f2193\",\"When Are Your Exams? \"]]]'),(153,'2021-07-30 20:03:36.505742','2021-07-30 20:03:36.505742','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@a79d59cd72034188a71d388f4954a606','Exciting Labs and Tools','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"]]]'),(154,'2021-07-30 20:03:36.511090','2021-07-30 20:03:36.511090','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@1c8d47c425724346a7968fa1bc745dcd','Labs and Tools','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@a79d59cd72034188a71d388f4954a606\",\"Exciting Labs and Tools\"]]]'),(155,'2021-07-30 20:03:36.518055','2021-07-30 20:03:36.518055','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@ffcd6351126d4ca984409180e41d1b51','Exciting Labs and Tools','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@a79d59cd72034188a71d388f4954a606\",\"Exciting Labs and Tools\"]]]'),(156,'2021-07-30 20:03:36.524210','2021-07-30 20:03:36.524210','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@f0e6d90842c44cc7a50fd1a18a7dd982','Video Demonstrations','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"]]]'),(157,'2021-07-30 20:03:36.529605','2021-07-30 20:03:36.529605','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@2d3efa8db04346548bd5e5374de77628','Text','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@f0e6d90842c44cc7a50fd1a18a7dd982\",\"Video Demonstrations\"]]]'),(158,'2021-07-30 20:03:36.535328','2021-07-30 20:03:36.535328','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@video+block@ab98b0e385e64445ae97e730ffdf17e7','Biology Demonstration','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@f0e6d90842c44cc7a50fd1a18a7dd982\",\"Video Demonstrations\"]]]'),(159,'2021-07-30 20:03:36.543378','2021-07-30 20:03:36.543378','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@eb469ec408fa4ab1a9b86c634ca9bfa9','Text','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@f0e6d90842c44cc7a50fd1a18a7dd982\",\"Video Demonstrations\"]]]');
/*!40000 ALTER TABLE `bookmarks_xblockcache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branding_brandingapiconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branding_brandingapiconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `branding_brandingapi_changed_by_id_bab2730f_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `branding_brandingapi_changed_by_id_bab2730f_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branding_brandingapiconfig`
--

LOCK TABLES `branding_brandingapiconfig` WRITE;
/*!40000 ALTER TABLE `branding_brandingapiconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `branding_brandingapiconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branding_brandinginfoconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branding_brandinginfoconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `configuration` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `branding_brandinginf_changed_by_id_616dd172_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `branding_brandinginf_changed_by_id_616dd172_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branding_brandinginfoconfig`
--

LOCK TABLES `branding_brandinginfoconfig` WRITE;
/*!40000 ALTER TABLE `branding_brandinginfoconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `branding_brandinginfoconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulk_email_bulkemailflag`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulk_email_bulkemailflag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `require_course_email_auth` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bulk_email_bulkemailflag_changed_by_id_c510754b_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `bulk_email_bulkemailflag_changed_by_id_c510754b_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulk_email_bulkemailflag`
--

LOCK TABLES `bulk_email_bulkemailflag` WRITE;
/*!40000 ALTER TABLE `bulk_email_bulkemailflag` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulk_email_bulkemailflag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulk_email_cohorttarget`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulk_email_cohorttarget` (
  `target_ptr_id` int(11) NOT NULL,
  `cohort_id` int(11) NOT NULL,
  PRIMARY KEY (`target_ptr_id`),
  KEY `bulk_email_cohorttar_cohort_id_096f39c9_fk_course_gr` (`cohort_id`),
  CONSTRAINT `bulk_email_cohorttar_cohort_id_096f39c9_fk_course_gr` FOREIGN KEY (`cohort_id`) REFERENCES `course_groups_courseusergroup` (`id`),
  CONSTRAINT `bulk_email_cohorttar_target_ptr_id_7e1a1a40_fk_bulk_emai` FOREIGN KEY (`target_ptr_id`) REFERENCES `bulk_email_target` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulk_email_cohorttarget`
--

LOCK TABLES `bulk_email_cohorttarget` WRITE;
/*!40000 ALTER TABLE `bulk_email_cohorttarget` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulk_email_cohorttarget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulk_email_courseauthorization`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulk_email_courseauthorization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `email_enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulk_email_courseauthorization`
--

LOCK TABLES `bulk_email_courseauthorization` WRITE;
/*!40000 ALTER TABLE `bulk_email_courseauthorization` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulk_email_courseauthorization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulk_email_courseemail`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulk_email_courseemail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(128) NOT NULL,
  `subject` varchar(128) NOT NULL,
  `html_message` longtext,
  `text_message` longtext,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `to_option` varchar(64) NOT NULL,
  `template_name` varchar(255) DEFAULT NULL,
  `from_addr` varchar(255) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bulk_email_courseemail_sender_id_865f6979_fk_auth_user_id` (`sender_id`),
  KEY `bulk_email_courseemail_slug_bd25801f` (`slug`),
  KEY `bulk_email_courseemail_course_id_b7b8a9a2` (`course_id`),
  CONSTRAINT `bulk_email_courseemail_sender_id_865f6979_fk_auth_user_id` FOREIGN KEY (`sender_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulk_email_courseemail`
--

LOCK TABLES `bulk_email_courseemail` WRITE;
/*!40000 ALTER TABLE `bulk_email_courseemail` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulk_email_courseemail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulk_email_courseemail_targets`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulk_email_courseemail_targets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseemail_id` int(11) NOT NULL,
  `target_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bulk_email_courseemail_t_courseemail_id_target_id_e0440acc_uniq` (`courseemail_id`,`target_id`),
  KEY `bulk_email_courseema_target_id_52b11fa9_fk_bulk_emai` (`target_id`),
  CONSTRAINT `bulk_email_courseema_courseemail_id_83f5bdcd_fk_bulk_emai` FOREIGN KEY (`courseemail_id`) REFERENCES `bulk_email_courseemail` (`id`),
  CONSTRAINT `bulk_email_courseema_target_id_52b11fa9_fk_bulk_emai` FOREIGN KEY (`target_id`) REFERENCES `bulk_email_target` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulk_email_courseemail_targets`
--

LOCK TABLES `bulk_email_courseemail_targets` WRITE;
/*!40000 ALTER TABLE `bulk_email_courseemail_targets` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulk_email_courseemail_targets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulk_email_courseemailtemplate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulk_email_courseemailtemplate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `html_template` longtext,
  `plain_template` longtext,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulk_email_courseemailtemplate`
--

LOCK TABLES `bulk_email_courseemailtemplate` WRITE;
/*!40000 ALTER TABLE `bulk_email_courseemailtemplate` DISABLE KEYS */;
INSERT INTO `bulk_email_courseemailtemplate` VALUES (1,'<!DOCTYPE html PUBLIC \'-//W3C//DTD XHTML 1.0 Transitional//EN\' \'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\'><html xmlns:fb=\'http://www.facebook.com/2008/fbml\' xmlns:og=\'http://opengraph.org/schema/\'> <head><meta property=\'og:title\' content=\'Update from {course_title}\'/><meta property=\'fb:page_id\' content=\'43929265776\' />        <meta http-equiv=\'Content-Type\' content=\'text/html; charset=UTF-8\'>        <title>Update from {course_title}</title>                    </head>        <body leftmargin=\'0\' marginwidth=\'0\' topmargin=\'0\' marginheight=\'0\' offset=\'0\' style=\'margin: 0;padding: 0;background-color: #ffffff;\'>        <center>            <table align=\'center\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' height=\'100%\' width=\'100%\' id=\'bodyTable\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;margin: 0;padding: 0;background-color: #ffffff;height: 100% !important;width: 100% !important;\'>                <tr>                   <td align=\'center\' valign=\'top\' id=\'bodyCell\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;margin: 0;padding: 0;border-top: 0;height: 100% !important;width: 100% !important;\'>                        <!-- BEGIN TEMPLATE // -->                        <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                            <tr>                                <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                    <!-- BEGIN PREHEADER // -->                                    <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' id=\'templatePreheader\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;background-color: #fcfcfc;border-top: 0;border-bottom: 0;\'>                                        <tr>                                        <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'templateContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                    <tr>                                                        <td valign=\'top\' class=\'preheaderContainer\' style=\'padding-top: 9px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'366\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-left: 18px;padding-bottom: 9px;padding-right: 0;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 11px;line-height: 125%;text-align: left;\'>                                                    <br>                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table></td>                                                    </tr>                                                </table>                                            </td>                                                                                    </tr>                                    </table>                                    <!-- // END PREHEADER -->                                </td>                            </tr>                            <tr>                                <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                    <!-- BEGIN HEADER // -->                                    <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' id=\'templateHeader\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;background-color: #fcfcfc;border-top: 0;border-bottom: 0;\'>                                        <tr>                                            <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'templateContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                    <tr>                                                        <td valign=\'top\' class=\'headerContainer\' style=\'padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnImageBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnImageBlockOuter\'>            <tr>                <td valign=\'top\' style=\'padding: 9px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\' class=\'mcnImageBlockInner\'>                    <table align=\'left\' width=\'100%\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' class=\'mcnImageContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                        <tbody><tr>                            <td class=\'mcnImageContent\' valign=\'top\' style=\'padding-right: 9px;padding-left: 9px;padding-top: 0;padding-bottom: 0;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                                    <a href=\'http://edx.org\' title=\'\' class=\'\' target=\'_self\' style=\'word-wrap: break-word !important;\'>                                        <img align=\'left\' alt=\'edX\' src=\'http://courses.edx.org/static/images/bulk_email/edXHeaderImage.jpg\' width=\'564.0000152587891\' style=\'max-width: 600px;padding-bottom: 0;display: inline !important;vertical-align: bottom;border: 0;line-height: 100%;outline: none;text-decoration: none;height: auto !important;\' class=\'mcnImage\'>                                    </a>                                                            </td>                        </tr>                    </tbody></table>                </td>            </tr>    </tbody></table><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'599\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 15px;line-height: 150%;text-align: left;\'>                                                    <div style=\'text-align: right;\'><span style=\'font-size:11px;\'><span style=\'color:#00a0e3;\'>Connect with edX:</span></span> &nbsp;<a href=\'http://facebook.com/edxonline\' target=\'_blank\' style=\'color: #6DC6DD;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/FacebookIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp;&nbsp;<a href=\'http://twitter.com/edxonline\' target=\'_blank\' style=\'color: #6DC6DD;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/TwitterIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp;&nbsp;<a href=\'http://www.meetup.com/edX-Communities/\' target=\'_blank\' style=\'color: #6DC6DD;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/MeetupIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a></div>                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table></td>                                                    </tr>                                                </table>                                            </td>                                        </tr>                                    </table>                                    <!-- // END HEADER -->                                </td>                            </tr>                            <tr>                                <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                    <!-- BEGIN BODY // -->                                    <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' id=\'templateBody\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;background-color: #fcfcfc;border-top: 0;border-bottom: 0;\'>                                        <tr>                                            <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'templateContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                    <tr>                                                        <td valign=\'top\' class=\'bodyContainer\' style=\'padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnCaptionBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnCaptionBlockOuter\'>        <tr>            <td class=\'mcnCaptionBlockInner\' valign=\'top\' style=\'padding: 9px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' class=\'mcnCaptionLeftContentOuter\' width=\'100%\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody><tr>        <td valign=\'top\' class=\'mcnCaptionLeftContentInner\' style=\'padding: 0 9px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>            <table align=\'right\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' class=\'mcnCaptionLeftImageContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                <tbody><tr>                    <td class=\'mcnCaptionLeftImageContent\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                                    <img alt=\'\' src=\'{course_image_url}\' width=\'176\' style=\'max-width: 180px;border: 0;line-height: 100%;outline: none;text-decoration: none;vertical-align: bottom;height: auto !important;\' class=\'mcnImage\'>                                                                </td>                </tr>            </tbody></table>            <table class=\'mcnCaptionLeftTextContentContainer\' align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'352\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                <tbody><tr>                    <td valign=\'top\' class=\'mcnTextContent\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 14px;line-height: 150%;text-align: left;\'>                        <h3 class=\'null\' style=\'display: block;font-family: Helvetica;font-size: 18px;font-style: normal;font-weight: bold;line-height: 125%;letter-spacing: -.5px;margin: 0;text-align: left;color: #606060 !important;\'><strong style=\'font-size: 22px;\'>{course_title}</strong><br></h3><br>                    </td>                </tr>            </tbody></table>        </td>    </tr></tbody></table>            </td>        </tr>    </tbody></table><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 14px;line-height: 150%;text-align: left;\'>                        {{message_body}}                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnDividerBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnDividerBlockOuter\'>        <tr>            <td class=\'mcnDividerBlockInner\' style=\'padding: 18px 18px 3px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                <table class=\'mcnDividerContent\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' style=\'border-top-width: 1px;border-top-style: solid;border-top-color: #666666;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                        <td style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                            <span></span>                        </td>                    </tr>                </tbody></table>            </td>        </tr>    </tbody></table><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 14px;line-height: 150%;text-align: left;\'>                                                    <div style=\'text-align: right;\'><a href=\'http://facebook.com/edxonline\' target=\'_blank\' style=\'color: #2f73bc;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/FacebookIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp;&nbsp;<a href=\'http://twitter.com/edxonline\' target=\'_blank\' style=\'color: #2f73bc;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/TwitterIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp; &nbsp;<a href=\'http://www.meetup.com/edX-Communities/\' target=\'_blank\' style=\'color: #2f73bc;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/MeetupIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a></div>                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table></td>                                                    </tr>                                                </table>                                            </td>                                        </tr>                                    </table>                                    <!-- // END BODY -->                                </td>                            </tr>                            <tr>                                <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                    <!-- BEGIN FOOTER // -->                                    <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' id=\'templateFooter\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;background-color: #9FCFE8;border-top: 0;border-bottom: 0;\'>                                        <tr>                                            <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'templateContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                    <tr>                                                        <td valign=\'top\' class=\'footerContainer\' style=\'padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #f2f2f2;font-family: Helvetica;font-size: 11px;line-height: 125%;text-align: left;\'>                                                    <em>Copyright © 2013 edX, All rights reserved.</em><br><br><br>  <b>Our mailing address is:</b><br>  edX<br>  11 Cambridge Center, Suite 101<br>  Cambridge, MA, USA 02142<br><br><br>This email was automatically sent from {platform_name}. <br>You are receiving this email at address {email} because you are enrolled in <a href=\'{course_url}\'>{course_title}</a>.<br>To stop receiving email like this, update your course email settings <a href=\'{email_settings_url}\'>here</a>. <br><br><a href=\'{unsubscribe_link}\'>unsubscribe</a>                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table></td>                                                    </tr>                                                </table>                                            </td>                                        </tr>                                    </table>                                    <!-- // END FOOTER -->                                </td>                            </tr>                        </table>                        <!-- // END TEMPLATE -->                    </td>                </tr>            </table>        </center>    </body>    </body> </html>','{course_title}\n\n{{message_body}}\r\n----\r\nCopyright 2013 edX, All rights reserved.\r\n----\r\nConnect with edX:\r\nFacebook (http://facebook.com/edxonline)\r\nTwitter (http://twitter.com/edxonline)\r\nMeetup (http://www.meetup.com/edX-Communities/)\r\n----\r\nThis email was automatically sent from {platform_name}.\r\nYou are receiving this email at address {email} because you are enrolled in {course_title}\r\n(URL: {course_url} ).\r\nTo stop receiving email like this, update your course email settings at {email_settings_url}.\r\n{unsubscribe_link}\r\n',NULL),(2,'<!DOCTYPE html PUBLIC \'-//W3C//DTD XHTML 1.0 Transitional//EN\' \'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\'><html xmlns:fb=\'http://www.facebook.com/2008/fbml\' xmlns:og=\'http://opengraph.org/schema/\'> <head><meta property=\'og:title\' content=\'Update from {course_title}\'/><meta property=\'fb:page_id\' content=\'43929265776\' />        <meta http-equiv=\'Content-Type\' content=\'text/html; charset=UTF-8\'>        THIS IS A BRANDED HTML TEMPLATE <title>Update from {course_title}</title>                    </head>        <body leftmargin=\'0\' marginwidth=\'0\' topmargin=\'0\' marginheight=\'0\' offset=\'0\' style=\'margin: 0;padding: 0;background-color: #ffffff;\'>        <center>            <table align=\'center\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' height=\'100%\' width=\'100%\' id=\'bodyTable\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;margin: 0;padding: 0;background-color: #ffffff;height: 100% !important;width: 100% !important;\'>                <tr>                   <td align=\'center\' valign=\'top\' id=\'bodyCell\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;margin: 0;padding: 0;border-top: 0;height: 100% !important;width: 100% !important;\'>                        <!-- BEGIN TEMPLATE // -->                        <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                            <tr>                                <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                    <!-- BEGIN PREHEADER // -->                                    <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' id=\'templatePreheader\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;background-color: #fcfcfc;border-top: 0;border-bottom: 0;\'>                                        <tr>                                        <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'templateContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                    <tr>                                                        <td valign=\'top\' class=\'preheaderContainer\' style=\'padding-top: 9px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'366\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-left: 18px;padding-bottom: 9px;padding-right: 0;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 11px;line-height: 125%;text-align: left;\'>                                                    <br>                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table></td>                                                    </tr>                                                </table>                                            </td>                                                                                    </tr>                                    </table>                                    <!-- // END PREHEADER -->                                </td>                            </tr>                            <tr>                                <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                    <!-- BEGIN HEADER // -->                                    <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' id=\'templateHeader\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;background-color: #fcfcfc;border-top: 0;border-bottom: 0;\'>                                        <tr>                                            <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'templateContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                    <tr>                                                        <td valign=\'top\' class=\'headerContainer\' style=\'padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnImageBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnImageBlockOuter\'>            <tr>                <td valign=\'top\' style=\'padding: 9px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\' class=\'mcnImageBlockInner\'>                    <table align=\'left\' width=\'100%\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' class=\'mcnImageContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                        <tbody><tr>                            <td class=\'mcnImageContent\' valign=\'top\' style=\'padding-right: 9px;padding-left: 9px;padding-top: 0;padding-bottom: 0;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                                    <a href=\'http://edx.org\' title=\'\' class=\'\' target=\'_self\' style=\'word-wrap: break-word !important;\'>                                        <img align=\'left\' alt=\'edX\' src=\'http://courses.edx.org/static/images/bulk_email/edXHeaderImage.jpg\' width=\'564.0000152587891\' style=\'max-width: 600px;padding-bottom: 0;display: inline !important;vertical-align: bottom;border: 0;line-height: 100%;outline: none;text-decoration: none;height: auto !important;\' class=\'mcnImage\'>                                    </a>                                                            </td>                        </tr>                    </tbody></table>                </td>            </tr>    </tbody></table><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'599\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 15px;line-height: 150%;text-align: left;\'>                                                    <div style=\'text-align: right;\'><span style=\'font-size:11px;\'><span style=\'color:#00a0e3;\'>Connect with edX:</span></span> &nbsp;<a href=\'http://facebook.com/edxonline\' target=\'_blank\' style=\'color: #6DC6DD;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/FacebookIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp;&nbsp;<a href=\'http://twitter.com/edxonline\' target=\'_blank\' style=\'color: #6DC6DD;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/TwitterIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp;&nbsp;<a href=\'http://www.meetup.com/edX-Communities/\' target=\'_blank\' style=\'color: #6DC6DD;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/MeetupIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a></div>                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table></td>                                                    </tr>                                                </table>                                            </td>                                        </tr>                                    </table>                                    <!-- // END HEADER -->                                </td>                            </tr>                            <tr>                                <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                    <!-- BEGIN BODY // -->                                    <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' id=\'templateBody\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;background-color: #fcfcfc;border-top: 0;border-bottom: 0;\'>                                        <tr>                                            <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'templateContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                    <tr>                                                        <td valign=\'top\' class=\'bodyContainer\' style=\'padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnCaptionBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnCaptionBlockOuter\'>        <tr>            <td class=\'mcnCaptionBlockInner\' valign=\'top\' style=\'padding: 9px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' class=\'mcnCaptionLeftContentOuter\' width=\'100%\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody><tr>        <td valign=\'top\' class=\'mcnCaptionLeftContentInner\' style=\'padding: 0 9px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>            <table align=\'right\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' class=\'mcnCaptionLeftImageContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                <tbody><tr>                    <td class=\'mcnCaptionLeftImageContent\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                                    <img alt=\'\' src=\'{course_image_url}\' width=\'176\' style=\'max-width: 180px;border: 0;line-height: 100%;outline: none;text-decoration: none;vertical-align: bottom;height: auto !important;\' class=\'mcnImage\'>                                                                </td>                </tr>            </tbody></table>            <table class=\'mcnCaptionLeftTextContentContainer\' align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'352\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                <tbody><tr>                    <td valign=\'top\' class=\'mcnTextContent\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 14px;line-height: 150%;text-align: left;\'>                        <h3 class=\'null\' style=\'display: block;font-family: Helvetica;font-size: 18px;font-style: normal;font-weight: bold;line-height: 125%;letter-spacing: -.5px;margin: 0;text-align: left;color: #606060 !important;\'><strong style=\'font-size: 22px;\'>{course_title}</strong><br></h3><br>                    </td>                </tr>            </tbody></table>        </td>    </tr></tbody></table>            </td>        </tr>    </tbody></table><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 14px;line-height: 150%;text-align: left;\'>                        {{message_body}}                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnDividerBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnDividerBlockOuter\'>        <tr>            <td class=\'mcnDividerBlockInner\' style=\'padding: 18px 18px 3px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                <table class=\'mcnDividerContent\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' style=\'border-top-width: 1px;border-top-style: solid;border-top-color: #666666;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                        <td style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                            <span></span>                        </td>                    </tr>                </tbody></table>            </td>        </tr>    </tbody></table><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 14px;line-height: 150%;text-align: left;\'>                                                    <div style=\'text-align: right;\'><a href=\'http://facebook.com/edxonline\' target=\'_blank\' style=\'color: #2f73bc;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/FacebookIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp;&nbsp;<a href=\'http://twitter.com/edxonline\' target=\'_blank\' style=\'color: #2f73bc;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/TwitterIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp; &nbsp;<a href=\'http://www.meetup.com/edX-Communities/\' target=\'_blank\' style=\'color: #2f73bc;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/MeetupIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a></div>                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table></td>                                                    </tr>                                                </table>                                            </td>                                        </tr>                                    </table>                                    <!-- // END BODY -->                                </td>                            </tr>                            <tr>                                <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                    <!-- BEGIN FOOTER // -->                                    <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' id=\'templateFooter\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;background-color: #9FCFE8;border-top: 0;border-bottom: 0;\'>                                        <tr>                                            <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'templateContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                    <tr>                                                        <td valign=\'top\' class=\'footerContainer\' style=\'padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #f2f2f2;font-family: Helvetica;font-size: 11px;line-height: 125%;text-align: left;\'>                                                    <em>Copyright © 2013 edX, All rights reserved.</em><br><br><br>  <b>Our mailing address is:</b><br>  edX<br>  11 Cambridge Center, Suite 101<br>  Cambridge, MA, USA 02142<br><br><br>This email was automatically sent from {platform_name}. <br>You are receiving this email at address {email} because you are enrolled in <a href=\'{course_url}\'>{course_title}</a>.<br>To stop receiving email like this, update your course email settings <a href=\'{email_settings_url}\'>here</a>. <br><br><a href=\'{unsubscribe_link}\'>unsubscribe</a>                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table></td>                                                    </tr>                                                </table>                                            </td>                                        </tr>                                    </table>                                    <!-- // END FOOTER -->                                </td>                            </tr>                        </table>                        <!-- // END TEMPLATE -->                    </td>                </tr>            </table>        </center>    </body>    </body> </html>','THIS IS A BRANDED TEXT TEMPLATE. {course_title}\n\n{{message_body}}\r\n----\r\nCopyright 2013 edX, All rights reserved.\r\n----\r\nConnect with edX:\r\nFacebook (http://facebook.com/edxonline)\r\nTwitter (http://twitter.com/edxonline)\r\nMeetup (http://www.meetup.com/edX-Communities/)\r\n----\r\nThis email was automatically sent from {platform_name}.\r\nYou are receiving this email at address {email} because you are enrolled in {course_title}\r\n(URL: {course_url} ).\r\nTo stop receiving email like this, update your course email settings at {email_settings_url}.\r\n{unsubscribe_link}\r\n','branded.template');
/*!40000 ALTER TABLE `bulk_email_courseemailtemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulk_email_coursemodetarget`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulk_email_coursemodetarget` (
  `target_ptr_id` int(11) NOT NULL,
  `track_id` int(11) NOT NULL,
  PRIMARY KEY (`target_ptr_id`),
  KEY `bulk_email_coursemod_track_id_2b68bb43_fk_course_mo` (`track_id`),
  CONSTRAINT `bulk_email_coursemod_target_ptr_id_f2f054ce_fk_bulk_emai` FOREIGN KEY (`target_ptr_id`) REFERENCES `bulk_email_target` (`id`),
  CONSTRAINT `bulk_email_coursemod_track_id_2b68bb43_fk_course_mo` FOREIGN KEY (`track_id`) REFERENCES `course_modes_coursemode` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulk_email_coursemodetarget`
--

LOCK TABLES `bulk_email_coursemodetarget` WRITE;
/*!40000 ALTER TABLE `bulk_email_coursemodetarget` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulk_email_coursemodetarget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulk_email_optout`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulk_email_optout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bulk_email_optout_user_id_course_id_e0e2d6a6_uniq` (`user_id`,`course_id`),
  KEY `bulk_email_optout_course_id_5c5836a8` (`course_id`),
  CONSTRAINT `bulk_email_optout_user_id_ff6223d6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulk_email_optout`
--

LOCK TABLES `bulk_email_optout` WRITE;
/*!40000 ALTER TABLE `bulk_email_optout` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulk_email_optout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulk_email_target`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulk_email_target` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_type` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulk_email_target`
--

LOCK TABLES `bulk_email_target` WRITE;
/*!40000 ALTER TABLE `bulk_email_target` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulk_email_target` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulk_grades_scoreoverrider`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulk_grades_scoreoverrider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modified` datetime(6) NOT NULL,
  `created` datetime(6) NOT NULL,
  `module_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bulk_grades_scoreove_module_id_33617068_fk_coursewar` (`module_id`),
  KEY `bulk_grades_scoreoverrider_user_id_9768d9f6_fk_auth_user_id` (`user_id`),
  KEY `bulk_grades_scoreoverrider_created_2d9c74a5` (`created`),
  CONSTRAINT `bulk_grades_scoreoverrider_user_id_9768d9f6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulk_grades_scoreoverrider`
--

LOCK TABLES `bulk_grades_scoreoverrider` WRITE;
/*!40000 ALTER TABLE `bulk_grades_scoreoverrider` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulk_grades_scoreoverrider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_sync_historicalusercalendarsyncconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_sync_historicalusercalendarsyncconfig` (
  `id` int(11) NOT NULL,
  `course_key` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ics_sequence` int(11) NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `calendar_sync_histor_history_user_id_e696e2d5_fk_auth_user` (`history_user_id`),
  KEY `calendar_sync_historicalusercalendarsyncconfig_id_2b36f9ae` (`id`),
  KEY `calendar_sync_historicaluse_course_key_0f40c91a` (`course_key`),
  KEY `calendar_sync_historicalusercalendarsyncconfig_user_id_c2855120` (`user_id`),
  CONSTRAINT `calendar_sync_histor_history_user_id_e696e2d5_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_sync_historicalusercalendarsyncconfig`
--

LOCK TABLES `calendar_sync_historicalusercalendarsyncconfig` WRITE;
/*!40000 ALTER TABLE `calendar_sync_historicalusercalendarsyncconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_sync_historicalusercalendarsyncconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_sync_usercalendarsyncconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_sync_usercalendarsyncconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_key` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ics_sequence` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendar_sync_usercalend_user_id_course_key_57c343ab_uniq` (`user_id`,`course_key`),
  KEY `calendar_sync_usercalendarsyncconfig_course_key_86657ca7` (`course_key`),
  CONSTRAINT `calendar_sync_userca_user_id_5dd14ead_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_sync_usercalendarsyncconfig`
--

LOCK TABLES `calendar_sync_usercalendarsyncconfig` WRITE;
/*!40000 ALTER TABLE `calendar_sync_usercalendarsyncconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_sync_usercalendarsyncconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canvas_canvasenterprisecustomerconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canvas_canvasenterprisecustomerconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `transmission_chunk_size` int(11) NOT NULL,
  `channel_worker_username` varchar(255) DEFAULT NULL,
  `catalogs_to_transmit` longtext,
  `client_id` varchar(255) DEFAULT NULL,
  `client_secret` varchar(255) DEFAULT NULL,
  `canvas_account_id` bigint(20) DEFAULT NULL,
  `canvas_base_url` varchar(255) DEFAULT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  `refresh_token` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_customer_id` (`enterprise_customer_id`),
  CONSTRAINT `canvas_canvasenterpr_enterprise_customer__b2e73393_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canvas_canvasenterprisecustomerconfiguration`
--

LOCK TABLES `canvas_canvasenterprisecustomerconfiguration` WRITE;
/*!40000 ALTER TABLE `canvas_canvasenterprisecustomerconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `canvas_canvasenterprisecustomerconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canvas_canvaslearnerassessmentdatatransmissionaudit`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canvas_canvaslearnerassessmentdatatransmissionaudit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canvas_user_email` varchar(255) NOT NULL,
  `enterprise_course_enrollment_id` int(10) unsigned NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `subsection_id` varchar(255) NOT NULL,
  `grade_point_score` double NOT NULL,
  `grade_points_possible` double NOT NULL,
  `grade` double NOT NULL,
  `subsection_name` varchar(255) NOT NULL,
  `status` varchar(100) NOT NULL,
  `error_message` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `canvas_canvaslearnerassessm_enterprise_course_enrollmen_d9dba2b4` (`enterprise_course_enrollment_id`),
  KEY `canvas_canvaslearnerassessm_subsection_id_b3450f75` (`subsection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canvas_canvaslearnerassessmentdatatransmissionaudit`
--

LOCK TABLES `canvas_canvaslearnerassessmentdatatransmissionaudit` WRITE;
/*!40000 ALTER TABLE `canvas_canvaslearnerassessmentdatatransmissionaudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `canvas_canvaslearnerassessmentdatatransmissionaudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canvas_canvaslearnerdatatransmissionaudit`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canvas_canvaslearnerdatatransmissionaudit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canvas_user_email` varchar(255) NOT NULL,
  `enterprise_course_enrollment_id` int(10) unsigned NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `course_completed` tinyint(1) NOT NULL,
  `completed_timestamp` varchar(10) NOT NULL,
  `status` varchar(100) NOT NULL,
  `error_message` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `grade` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `canvas_canvaslearnerdatatra_enterprise_course_enrollmen_c2a9800c` (`enterprise_course_enrollment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canvas_canvaslearnerdatatransmissionaudit`
--

LOCK TABLES `canvas_canvaslearnerdatatransmissionaudit` WRITE;
/*!40000 ALTER TABLE `canvas_canvaslearnerdatatransmissionaudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `canvas_canvaslearnerdatatransmissionaudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canvas_historicalcanvasenterprisecustomerconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canvas_historicalcanvasenterprisecustomerconfiguration` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `transmission_chunk_size` int(11) NOT NULL,
  `channel_worker_username` varchar(255) DEFAULT NULL,
  `catalogs_to_transmit` longtext,
  `client_id` varchar(255) DEFAULT NULL,
  `client_secret` varchar(255) DEFAULT NULL,
  `canvas_account_id` bigint(20) DEFAULT NULL,
  `canvas_base_url` varchar(255) DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_customer_id` char(32) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `refresh_token` varchar(255) NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `canvas_historicalcan_history_user_id_615fc2a2_fk_auth_user` (`history_user_id`),
  KEY `canvas_historicalcanvasente_id_8769e0b6` (`id`),
  KEY `canvas_historicalcanvasente_enterprise_customer_id_8bd0d3ec` (`enterprise_customer_id`),
  CONSTRAINT `canvas_historicalcan_history_user_id_615fc2a2_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canvas_historicalcanvasenterprisecustomerconfiguration`
--

LOCK TABLES `canvas_historicalcanvasenterprisecustomerconfiguration` WRITE;
/*!40000 ALTER TABLE `canvas_historicalcanvasenterprisecustomerconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `canvas_historicalcanvasenterprisecustomerconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_catalogintegration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_catalogintegration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `internal_api_url` varchar(200) NOT NULL,
  `cache_ttl` int(10) unsigned NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `service_username` varchar(100) NOT NULL,
  `page_size` int(10) unsigned NOT NULL,
  `long_term_cache_ttl` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_cataloginteg_changed_by_id_cde406de_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `catalog_cataloginteg_changed_by_id_cde406de_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_catalogintegration`
--

LOCK TABLES `catalog_catalogintegration` WRITE;
/*!40000 ALTER TABLE `catalog_catalogintegration` DISABLE KEYS */;
INSERT INTO `catalog_catalogintegration` VALUES (1,'2021-07-30 20:15:36.967204',1,'https://example.com/api',0,NULL,'discovery_worker',100,86400);
/*!40000 ALTER TABLE `catalog_catalogintegration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celery_utils_failedtask`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `celery_utils_failedtask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `task_name` varchar(255) NOT NULL,
  `task_id` varchar(255) NOT NULL,
  `args` longtext NOT NULL,
  `kwargs` longtext NOT NULL,
  `exc` varchar(255) NOT NULL,
  `datetime_resolved` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `celery_utils_failedtask_task_name_exc_efb8c9be_idx` (`task_name`,`exc`),
  KEY `celery_utils_failedtask_task_id_37af0933` (`task_id`),
  KEY `celery_utils_failedtask_datetime_resolved_8160e407` (`datetime_resolved`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celery_utils_failedtask`
--

LOCK TABLES `celery_utils_failedtask` WRITE;
/*!40000 ALTER TABLE `celery_utils_failedtask` DISABLE KEYS */;
/*!40000 ALTER TABLE `celery_utils_failedtask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_certificateallowlist`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_certificateallowlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `allowlist` tinyint(1) NOT NULL,
  `notes` longtext,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `certificates_certificate_course_id_user_id_660abede_uniq` (`course_id`,`user_id`),
  KEY `certificates_certifi_user_id_6c4d38f7_fk_auth_user` (`user_id`),
  CONSTRAINT `certificates_certifi_user_id_6c4d38f7_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_certificateallowlist`
--

LOCK TABLES `certificates_certificateallowlist` WRITE;
/*!40000 ALTER TABLE `certificates_certificateallowlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_certificateallowlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_certificategenerationcommandconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_certificategenerationcommandconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `arguments` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `certificates_certifi_changed_by_id_a2950eaa_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `certificates_certifi_changed_by_id_a2950eaa_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_certificategenerationcommandconfiguration`
--

LOCK TABLES `certificates_certificategenerationcommandconfiguration` WRITE;
/*!40000 ALTER TABLE `certificates_certificategenerationcommandconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_certificategenerationcommandconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_certificategenerationconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_certificategenerationconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `certificates_certifi_changed_by_id_a6d06e99_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `certificates_certifi_changed_by_id_a6d06e99_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_certificategenerationconfiguration`
--

LOCK TABLES `certificates_certificategenerationconfiguration` WRITE;
/*!40000 ALTER TABLE `certificates_certificategenerationconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_certificategenerationconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_certificategenerationcoursesetting`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_certificategenerationcoursesetting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_key` varchar(255) NOT NULL,
  `language_specific_templates_enabled` tinyint(1) NOT NULL,
  `self_generation_enabled` tinyint(1) NOT NULL,
  `include_hours_of_effort` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `certificates_certificategen_course_key_dd10af41` (`course_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_certificategenerationcoursesetting`
--

LOCK TABLES `certificates_certificategenerationcoursesetting` WRITE;
/*!40000 ALTER TABLE `certificates_certificategenerationcoursesetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_certificategenerationcoursesetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_certificategenerationhistory`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_certificategenerationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `is_regeneration` tinyint(1) NOT NULL,
  `generated_by_id` int(11) NOT NULL,
  `instructor_task_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `certificates_certifi_generated_by_id_e9d4b7f2_fk_auth_user` (`generated_by_id`),
  KEY `certificates_certifi_instructor_task_id_8f7176a6_fk_instructo` (`instructor_task_id`),
  CONSTRAINT `certificates_certifi_generated_by_id_e9d4b7f2_fk_auth_user` FOREIGN KEY (`generated_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `certificates_certifi_instructor_task_id_8f7176a6_fk_instructo` FOREIGN KEY (`instructor_task_id`) REFERENCES `instructor_task_instructortask` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_certificategenerationhistory`
--

LOCK TABLES `certificates_certificategenerationhistory` WRITE;
/*!40000 ALTER TABLE `certificates_certificategenerationhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_certificategenerationhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_certificatehtmlviewconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_certificatehtmlviewconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `configuration` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `certificates_certifi_changed_by_id_bcf656f2_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `certificates_certifi_changed_by_id_bcf656f2_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_certificatehtmlviewconfiguration`
--

LOCK TABLES `certificates_certificatehtmlviewconfiguration` WRITE;
/*!40000 ALTER TABLE `certificates_certificatehtmlviewconfiguration` DISABLE KEYS */;
INSERT INTO `certificates_certificatehtmlviewconfiguration` VALUES (1,'2021-07-30 19:55:48.905867',0,'{\"default\": {\"accomplishment_class_append\": \"accomplishment-certificate\", \"platform_name\": \"Your Platform Name Here\", \"company_about_url\": \"http://www.example.com/about-us\", \"company_privacy_url\": \"http://www.example.com/privacy-policy\", \"company_tos_url\": \"http://www.example.com/terms-service\", \"company_verified_certificate_url\": \"http://www.example.com/verified-certificate\", \"logo_src\": \"/static/certificates/images/logo.png\", \"logo_url\": \"http://www.example.com\"}, \"honor\": {\"certificate_type\": \"Honor Code\", \"certificate_title\": \"Certificate of Achievement\"}, \"verified\": {\"certificate_type\": \"Verified\", \"certificate_title\": \"Verified Certificate of Achievement\"}}',NULL);
/*!40000 ALTER TABLE `certificates_certificatehtmlviewconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_certificateinvalidation`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_certificateinvalidation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `notes` longtext,
  `active` tinyint(1) NOT NULL,
  `generated_certificate_id` int(11) NOT NULL,
  `invalidated_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `certificates_certifi_generated_certificat_31bed498_fk_certifica` (`generated_certificate_id`),
  KEY `certificates_certifi_invalidated_by_id_e3c101f1_fk_auth_user` (`invalidated_by_id`),
  CONSTRAINT `certificates_certifi_generated_certificat_31bed498_fk_certifica` FOREIGN KEY (`generated_certificate_id`) REFERENCES `certificates_generatedcertificate` (`id`),
  CONSTRAINT `certificates_certifi_invalidated_by_id_e3c101f1_fk_auth_user` FOREIGN KEY (`invalidated_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_certificateinvalidation`
--

LOCK TABLES `certificates_certificateinvalidation` WRITE;
/*!40000 ALTER TABLE `certificates_certificateinvalidation` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_certificateinvalidation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_certificatetemplate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_certificatetemplate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `template` longtext NOT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `course_key` varchar(255) DEFAULT NULL,
  `mode` varchar(125) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `language` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `certificates_certificate_organization_id_course_k_88e26c0d_uniq` (`organization_id`,`course_key`,`mode`,`language`),
  KEY `certificates_certificatetemplate_organization_id_030a747d` (`organization_id`),
  KEY `certificates_certificatetemplate_course_key_9a6a823d` (`course_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_certificatetemplate`
--

LOCK TABLES `certificates_certificatetemplate` WRITE;
/*!40000 ALTER TABLE `certificates_certificatetemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_certificatetemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_certificatetemplateasset`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_certificatetemplateasset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `asset` varchar(255) NOT NULL,
  `asset_slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `asset_slug` (`asset_slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_certificatetemplateasset`
--

LOCK TABLES `certificates_certificatetemplateasset` WRITE;
/*!40000 ALTER TABLE `certificates_certificatetemplateasset` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_certificatetemplateasset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_examplecertificate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_examplecertificate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `description` varchar(255) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `access_key` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `template` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `error_reason` longtext,
  `download_url` varchar(255) DEFAULT NULL,
  `example_cert_set_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `certificates_examplecertificate_access_key_8b745a5d` (`access_key`),
  KEY `certificates_example_example_cert_set_id_7e660917_fk_certifica` (`example_cert_set_id`),
  CONSTRAINT `certificates_example_example_cert_set_id_7e660917_fk_certifica` FOREIGN KEY (`example_cert_set_id`) REFERENCES `certificates_examplecertificateset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_examplecertificate`
--

LOCK TABLES `certificates_examplecertificate` WRITE;
/*!40000 ALTER TABLE `certificates_examplecertificate` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_examplecertificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_examplecertificateset`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_examplecertificateset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_key` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `certificates_examplecertificateset_course_key_16497ee9` (`course_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_examplecertificateset`
--

LOCK TABLES `certificates_examplecertificateset` WRITE;
/*!40000 ALTER TABLE `certificates_examplecertificateset` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_examplecertificateset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_generatedcertificate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_generatedcertificate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `verify_uuid` varchar(32) NOT NULL,
  `download_uuid` varchar(32) NOT NULL,
  `download_url` varchar(128) NOT NULL,
  `grade` varchar(5) NOT NULL,
  `key` varchar(32) NOT NULL,
  `distinction` tinyint(1) NOT NULL,
  `status` varchar(32) NOT NULL,
  `mode` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `error_reason` varchar(512) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `certificates_generatedce_user_id_course_id_fc1bb3ee_uniq` (`user_id`,`course_id`),
  KEY `certificates_generatedcertificate_verify_uuid_97405316` (`verify_uuid`),
  CONSTRAINT `certificates_generat_user_id_54119d22_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_generatedcertificate`
--

LOCK TABLES `certificates_generatedcertificate` WRITE;
/*!40000 ALTER TABLE `certificates_generatedcertificate` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_generatedcertificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_historicalcertificateallowlist`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_historicalcertificateallowlist` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `allowlist` tinyint(1) NOT NULL,
  `notes` longtext,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `certificates_histori_history_user_id_016a68db_fk_auth_user` (`history_user_id`),
  KEY `certificates_historicalcertificateallowlist_id_c3818cd9` (`id`),
  KEY `certificates_historicalcertificateallowlist_user_id_4d17e30a` (`user_id`),
  CONSTRAINT `certificates_histori_history_user_id_016a68db_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_historicalcertificateallowlist`
--

LOCK TABLES `certificates_historicalcertificateallowlist` WRITE;
/*!40000 ALTER TABLE `certificates_historicalcertificateallowlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_historicalcertificateallowlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_historicalcertificateinvalidation`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_historicalcertificateinvalidation` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `notes` longtext,
  `active` tinyint(1) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `generated_certificate_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `invalidated_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `certificates_histori_history_user_id_67c7d840_fk_auth_user` (`history_user_id`),
  KEY `certificates_historicalcertificateinvalidation_id_fae092a9` (`id`),
  KEY `certificates_historicalcert_generated_certificate_id_35f5becb` (`generated_certificate_id`),
  KEY `certificates_historicalcert_invalidated_by_id_5f2eff10` (`invalidated_by_id`),
  CONSTRAINT `certificates_histori_history_user_id_67c7d840_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_historicalcertificateinvalidation`
--

LOCK TABLES `certificates_historicalcertificateinvalidation` WRITE;
/*!40000 ALTER TABLE `certificates_historicalcertificateinvalidation` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_historicalcertificateinvalidation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates_historicalgeneratedcertificate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_historicalgeneratedcertificate` (
  `id` int(11) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `verify_uuid` varchar(32) NOT NULL,
  `download_uuid` varchar(32) NOT NULL,
  `download_url` varchar(128) NOT NULL,
  `grade` varchar(5) NOT NULL,
  `key` varchar(32) NOT NULL,
  `distinction` tinyint(1) NOT NULL,
  `status` varchar(32) NOT NULL,
  `mode` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `error_reason` varchar(512) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `certificates_histori_history_user_id_1b53bb5f_fk_auth_user` (`history_user_id`),
  KEY `certificates_historicalgeneratedcertificate_id_269c8929` (`id`),
  KEY `certificates_historicalgeneratedcertificate_verify_uuid_783d764e` (`verify_uuid`),
  KEY `certificates_historicalgeneratedcertificate_user_id_e7970938` (`user_id`),
  CONSTRAINT `certificates_histori_history_user_id_1b53bb5f_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_historicalgeneratedcertificate`
--

LOCK TABLES `certificates_historicalgeneratedcertificate` WRITE;
/*!40000 ALTER TABLE `certificates_historicalgeneratedcertificate` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates_historicalgeneratedcertificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commerce_commerceconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_commerceconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `checkout_on_ecommerce_service` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `cache_ttl` int(10) unsigned NOT NULL,
  `receipt_page` varchar(255) NOT NULL,
  `enable_automatic_refund_approval` tinyint(1) NOT NULL,
  `basket_checkout_page` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `commerce_commercecon_changed_by_id_2c9a6f14_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `commerce_commercecon_changed_by_id_2c9a6f14_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commerce_commerceconfiguration`
--

LOCK TABLES `commerce_commerceconfiguration` WRITE;
/*!40000 ALTER TABLE `commerce_commerceconfiguration` DISABLE KEYS */;
INSERT INTO `commerce_commerceconfiguration` VALUES (1,'2021-07-30 20:02:30.181571',1,1,NULL,0,'/checkout/receipt/?order_number=',1,'/basket/add/');
/*!40000 ALTER TABLE `commerce_commerceconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `completion_blockcompletion`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `completion_blockcompletion` (
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `course_key` varchar(255) NOT NULL,
  `block_key` varchar(255) NOT NULL,
  `block_type` varchar(64) NOT NULL,
  `completion` double NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `completion_blockcompleti_course_key_block_key_use_b15bac54_uniq` (`course_key`,`block_key`,`user_id`),
  KEY `completion_blockcompletio_user_id_course_key_modifi_ed54291e_idx` (`user_id`,`course_key`,`modified`),
  KEY `completion_blockcompletio_course_key_block_type_use_0f0d4d2d_idx` (`course_key`,`block_type`,`user_id`),
  CONSTRAINT `completion_blockcompletion_user_id_20994c23_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `completion_blockcompletion`
--

LOCK TABLES `completion_blockcompletion` WRITE;
/*!40000 ALTER TABLE `completion_blockcompletion` DISABLE KEYS */;
/*!40000 ALTER TABLE `completion_blockcompletion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consent_datasharingconsent`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consent_datasharingconsent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `username` varchar(255) NOT NULL,
  `granted` tinyint(1) DEFAULT NULL,
  `course_id` varchar(255) NOT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `consent_datasharingconse_enterprise_customer_id_u_8bdd34e4_uniq` (`enterprise_customer_id`,`username`,`course_id`),
  CONSTRAINT `consent_datasharingc_enterprise_customer__f46c6b77_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consent_datasharingconsent`
--

LOCK TABLES `consent_datasharingconsent` WRITE;
/*!40000 ALTER TABLE `consent_datasharingconsent` DISABLE KEYS */;
/*!40000 ALTER TABLE `consent_datasharingconsent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consent_datasharingconsenttextoverrides`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consent_datasharingconsenttextoverrides` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `page_title` varchar(255) NOT NULL,
  `left_sidebar_text` longtext,
  `top_paragraph` longtext,
  `agreement_text` longtext,
  `continue_text` varchar(255) NOT NULL,
  `abort_text` varchar(255) NOT NULL,
  `policy_dropdown_header` varchar(255) DEFAULT NULL,
  `policy_paragraph` longtext,
  `confirmation_modal_header` varchar(255) NOT NULL,
  `confirmation_modal_text` longtext NOT NULL,
  `modal_affirm_decline_text` varchar(255) NOT NULL,
  `modal_abort_decline_text` varchar(255) NOT NULL,
  `declined_notification_title` longtext NOT NULL,
  `declined_notification_message` longtext NOT NULL,
  `published` tinyint(1) NOT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_customer_id` (`enterprise_customer_id`),
  CONSTRAINT `consent_datasharingc_enterprise_customer__b979dfc1_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consent_datasharingconsenttextoverrides`
--

LOCK TABLES `consent_datasharingconsenttextoverrides` WRITE;
/*!40000 ALTER TABLE `consent_datasharingconsenttextoverrides` DISABLE KEYS */;
/*!40000 ALTER TABLE `consent_datasharingconsenttextoverrides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consent_historicaldatasharingconsent`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consent_historicaldatasharingconsent` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `username` varchar(255) NOT NULL,
  `granted` tinyint(1) DEFAULT NULL,
  `course_id` varchar(255) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_customer_id` char(32) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `consent_historicalda_history_user_id_08d7bf89_fk_auth_user` (`history_user_id`),
  KEY `consent_historicaldatasharingconsent_id_69bef37e` (`id`),
  KEY `consent_historicaldatashari_enterprise_customer_id_35c184bf` (`enterprise_customer_id`),
  CONSTRAINT `consent_historicalda_history_user_id_08d7bf89_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consent_historicaldatasharingconsent`
--

LOCK TABLES `consent_historicaldatasharingconsent` WRITE;
/*!40000 ALTER TABLE `consent_historicaldatasharingconsent` DISABLE KEYS */;
/*!40000 ALTER TABLE `consent_historicaldatasharingconsent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_libraries_contentlibrary`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_libraries_contentlibrary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(50) NOT NULL,
  `bundle_uuid` char(32) NOT NULL,
  `allow_public_learning` tinyint(1) NOT NULL,
  `allow_public_read` tinyint(1) NOT NULL,
  `org_id` int(11) NOT NULL,
  `type` varchar(25) NOT NULL,
  `license` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bundle_uuid` (`bundle_uuid`),
  UNIQUE KEY `content_libraries_contentlibrary_org_id_slug_2b964108_uniq` (`org_id`,`slug`),
  KEY `content_libraries_contentlibrary_slug_30d5507f` (`slug`),
  CONSTRAINT `content_libraries_co_org_id_b945a402_fk_organizat` FOREIGN KEY (`org_id`) REFERENCES `organizations_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_libraries_contentlibrary`
--

LOCK TABLES `content_libraries_contentlibrary` WRITE;
/*!40000 ALTER TABLE `content_libraries_contentlibrary` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_libraries_contentlibrary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_libraries_contentlibrarypermission`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_libraries_contentlibrarypermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_level` varchar(30) NOT NULL,
  `library_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_libraries_conten_library_id_group_id_3ecc38b9_uniq` (`library_id`,`group_id`),
  UNIQUE KEY `content_libraries_conten_library_id_user_id_81babe29_uniq` (`library_id`,`user_id`),
  KEY `content_libraries_co_user_id_b071c54d_fk_auth_user` (`user_id`),
  KEY `content_libraries_co_group_id_c2a4b6a1_fk_auth_grou` (`group_id`),
  CONSTRAINT `content_libraries_co_group_id_c2a4b6a1_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `content_libraries_co_library_id_51247096_fk_content_l` FOREIGN KEY (`library_id`) REFERENCES `content_libraries_contentlibrary` (`id`),
  CONSTRAINT `content_libraries_co_user_id_b071c54d_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_libraries_contentlibrarypermission`
--

LOCK TABLES `content_libraries_contentlibrarypermission` WRITE;
/*!40000 ALTER TABLE `content_libraries_contentlibrarypermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_libraries_contentlibrarypermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_type_gating_contenttypegatingconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_type_gating_contenttypegatingconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `org` varchar(255) DEFAULT NULL,
  `enabled_as_of` datetime(6) DEFAULT NULL,
  `studio_override_enabled` tinyint(1) DEFAULT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `course_id` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `org_course` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `content_type_gating__changed_by_id_e1754c4b_fk_auth_user` (`changed_by_id`),
  KEY `content_type_gating_contenttypegatingconfig_org_043e72a9` (`org`),
  KEY `content_typ_site_id_e91576_idx` (`site_id`,`org`,`course_id`),
  KEY `content_type_gating__course_id_f19cc50d_fk_course_ov` (`course_id`),
  KEY `content_typ_site_id_650310_idx` (`site_id`,`org`,`org_course`,`course_id`),
  KEY `content_type_gating_contenttypegatingconfig_org_course_70742f9e` (`org_course`),
  CONSTRAINT `content_type_gating__changed_by_id_e1754c4b_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `content_type_gating__course_id_f19cc50d_fk_course_ov` FOREIGN KEY (`course_id`) REFERENCES `course_overviews_courseoverview` (`id`),
  CONSTRAINT `content_type_gating__site_id_c9f3bc6a_fk_django_si` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_type_gating_contenttypegatingconfig`
--

LOCK TABLES `content_type_gating_contenttypegatingconfig` WRITE;
/*!40000 ALTER TABLE `content_type_gating_contenttypegatingconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_type_gating_contenttypegatingconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentserver_cdnuseragentsconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contentserver_cdnuseragentsconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `cdn_user_agents` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contentserver_cdnuse_changed_by_id_19d8cb94_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `contentserver_cdnuse_changed_by_id_19d8cb94_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentserver_cdnuseragentsconfig`
--

LOCK TABLES `contentserver_cdnuseragentsconfig` WRITE;
/*!40000 ALTER TABLE `contentserver_cdnuseragentsconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `contentserver_cdnuseragentsconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentserver_courseassetcachettlconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contentserver_courseassetcachettlconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `cache_ttl` int(10) unsigned NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contentserver_course_changed_by_id_a9213047_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `contentserver_course_changed_by_id_a9213047_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentserver_courseassetcachettlconfig`
--

LOCK TABLES `contentserver_courseassetcachettlconfig` WRITE;
/*!40000 ALTER TABLE `contentserver_courseassetcachettlconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `contentserver_courseassetcachettlconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentstore_videouploadconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contentstore_videouploadconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `profile_whitelist` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contentstore_videoup_changed_by_id_e7352cb2_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `contentstore_videoup_changed_by_id_e7352cb2_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentstore_videouploadconfig`
--

LOCK TABLES `contentstore_videouploadconfig` WRITE;
/*!40000 ALTER TABLE `contentstore_videouploadconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `contentstore_videouploadconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cornerstone_cornerstoneenterprisecustomerconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cornerstone_cornerstoneenterprisecustomerconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `transmission_chunk_size` int(11) NOT NULL,
  `cornerstone_base_url` varchar(255) NOT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  `channel_worker_username` varchar(255) DEFAULT NULL,
  `catalogs_to_transmit` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_customer_id` (`enterprise_customer_id`),
  CONSTRAINT `cornerstone_cornerst_enterprise_customer__5b56887b_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cornerstone_cornerstoneenterprisecustomerconfiguration`
--

LOCK TABLES `cornerstone_cornerstoneenterprisecustomerconfiguration` WRITE;
/*!40000 ALTER TABLE `cornerstone_cornerstoneenterprisecustomerconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `cornerstone_cornerstoneenterprisecustomerconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cornerstone_cornerstoneglobalconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cornerstone_cornerstoneglobalconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `completion_status_api_path` varchar(255) NOT NULL,
  `oauth_api_path` varchar(255) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `subject_mapping` longtext NOT NULL,
  `key` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `languages` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cornerstone_cornerst_changed_by_id_117db502_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `cornerstone_cornerst_changed_by_id_117db502_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cornerstone_cornerstoneglobalconfiguration`
--

LOCK TABLES `cornerstone_cornerstoneglobalconfiguration` WRITE;
/*!40000 ALTER TABLE `cornerstone_cornerstoneglobalconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `cornerstone_cornerstoneglobalconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cornerstone_cornerstonelearnerdatatransmissionaudit`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cornerstone_cornerstonelearnerdatatransmissionaudit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `user_guid` varchar(255) NOT NULL,
  `enterprise_course_enrollment_id` int(10) unsigned DEFAULT NULL,
  `course_id` varchar(255) NOT NULL,
  `session_token` varchar(255) NOT NULL,
  `callback_url` varchar(255) NOT NULL,
  `subdomain` varchar(255) NOT NULL,
  `course_completed` tinyint(1) NOT NULL,
  `completed_timestamp` datetime(6) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `error_message` longtext,
  `user_id` int(11) NOT NULL,
  `grade` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cornerstone_cornerstonel_user_id_course_id_c975cc5f_uniq` (`user_id`,`course_id`),
  KEY `cornerstone_cornerstonelear_enterprise_course_enrollmen_e3b05dac` (`enterprise_course_enrollment_id`),
  CONSTRAINT `cornerstone_cornerst_user_id_43bd15bf_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cornerstone_cornerstonelearnerdatatransmissionaudit`
--

LOCK TABLES `cornerstone_cornerstonelearnerdatatransmissionaudit` WRITE;
/*!40000 ALTER TABLE `cornerstone_cornerstonelearnerdatatransmissionaudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `cornerstone_cornerstonelearnerdatatransmissionaudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cornerstone_historicalcornerstoneenterprisecustomerconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cornerstone_historicalcornerstoneenterprisecustomerconfiguration` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `transmission_chunk_size` int(11) NOT NULL,
  `cornerstone_base_url` varchar(255) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_customer_id` char(32) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `channel_worker_username` varchar(255) DEFAULT NULL,
  `catalogs_to_transmit` longtext,
  PRIMARY KEY (`history_id`),
  KEY `cornerstone_historic_history_user_id_1ded83c5_fk_auth_user` (`history_user_id`),
  KEY `cornerstone_historicalcorne_id_513efd93` (`id`),
  KEY `cornerstone_historicalcorne_enterprise_customer_id_7f1c53b1` (`enterprise_customer_id`),
  CONSTRAINT `cornerstone_historic_history_user_id_1ded83c5_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cornerstone_historicalcornerstoneenterprisecustomerconfiguration`
--

LOCK TABLES `cornerstone_historicalcornerstoneenterprisecustomerconfiguration` WRITE;
/*!40000 ALTER TABLE `cornerstone_historicalcornerstoneenterprisecustomerconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `cornerstone_historicalcornerstoneenterprisecustomerconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cors_csrf_xdomainproxyconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cors_csrf_xdomainproxyconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `whitelist` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cors_csrf_xdomainpro_changed_by_id_b8e97ec3_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `cors_csrf_xdomainpro_changed_by_id_b8e97ec3_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cors_csrf_xdomainproxyconfiguration`
--

LOCK TABLES `cors_csrf_xdomainproxyconfiguration` WRITE;
/*!40000 ALTER TABLE `cors_csrf_xdomainproxyconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `cors_csrf_xdomainproxyconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_action_state_coursererunstate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_action_state_coursererunstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `course_key` varchar(255) NOT NULL,
  `action` varchar(100) NOT NULL,
  `state` varchar(50) NOT NULL,
  `should_display` tinyint(1) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `source_course_key` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `created_user_id` int(11) DEFAULT NULL,
  `updated_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_action_state_cour_course_key_action_2a8434fb_uniq` (`course_key`,`action`),
  KEY `course_action_state__created_user_id_5373c218_fk_auth_user` (`created_user_id`),
  KEY `course_action_state__updated_user_id_3689fe4b_fk_auth_user` (`updated_user_id`),
  KEY `course_action_state_coursererunstate_course_key_f87bef79` (`course_key`),
  KEY `course_action_state_coursererunstate_action_149773f1` (`action`),
  KEY `course_action_state_coursererunstate_source_course_key_b5037317` (`source_course_key`),
  CONSTRAINT `course_action_state__created_user_id_5373c218_fk_auth_user` FOREIGN KEY (`created_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `course_action_state__updated_user_id_3689fe4b_fk_auth_user` FOREIGN KEY (`updated_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_action_state_coursererunstate`
--

LOCK TABLES `course_action_state_coursererunstate` WRITE;
/*!40000 ALTER TABLE `course_action_state_coursererunstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_action_state_coursererunstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_creators_coursecreator`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_creators_coursecreator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state_changed` datetime(6) NOT NULL,
  `state` varchar(24) NOT NULL,
  `note` varchar(512) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `course_creators_coursecreator_user_id_e4da548d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_creators_coursecreator`
--

LOCK TABLES `course_creators_coursecreator` WRITE;
/*!40000 ALTER TABLE `course_creators_coursecreator` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_creators_coursecreator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_date_signals_selfpacedrelativedatesconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_date_signals_selfpacedrelativedatesconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `org` varchar(255) DEFAULT NULL,
  `org_course` varchar(255) DEFAULT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `course_id` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_date_site_id_a44836_idx` (`site_id`,`org`,`course_id`),
  KEY `course_date_site_id_c0164a_idx` (`site_id`,`org`,`org_course`,`course_id`),
  KEY `course_date_signals__changed_by_id_5f8228f2_fk_auth_user` (`changed_by_id`),
  KEY `course_date_signals__course_id_361d8ca8_fk_course_ov` (`course_id`),
  KEY `course_date_signals_selfpacedrelativedatesconfig_org_9c13e820` (`org`),
  KEY `course_date_signals_selfpac_org_course_b7041c4f` (`org_course`),
  CONSTRAINT `course_date_signals__changed_by_id_5f8228f2_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `course_date_signals__course_id_361d8ca8_fk_course_ov` FOREIGN KEY (`course_id`) REFERENCES `course_overviews_courseoverview` (`id`),
  CONSTRAINT `course_date_signals__site_id_29483878_fk_django_si` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_date_signals_selfpacedrelativedatesconfig`
--

LOCK TABLES `course_date_signals_selfpacedrelativedatesconfig` WRITE;
/*!40000 ALTER TABLE `course_date_signals_selfpacedrelativedatesconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_date_signals_selfpacedrelativedatesconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_duration_limits_coursedurationlimitconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_duration_limits_coursedurationlimitconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `org` varchar(255) DEFAULT NULL,
  `enabled_as_of` datetime(6) DEFAULT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `course_id` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `org_course` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_duration_limi_changed_by_id_f320fd76_fk_auth_user` (`changed_by_id`),
  KEY `course_duration_limits_coursedurationlimitconfig_org_c2cc0091` (`org`),
  KEY `course_dura_site_id_424016_idx` (`site_id`,`org`,`course_id`),
  KEY `course_duration_limi_course_id_97b7a8e9_fk_course_ov` (`course_id`),
  KEY `course_dura_site_id_b5bbcd_idx` (`site_id`,`org`,`org_course`,`course_id`),
  KEY `course_duration_limits_cour_org_course_bcd05764` (`org_course`),
  CONSTRAINT `course_duration_limi_changed_by_id_f320fd76_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `course_duration_limi_course_id_97b7a8e9_fk_course_ov` FOREIGN KEY (`course_id`) REFERENCES `course_overviews_courseoverview` (`id`),
  CONSTRAINT `course_duration_limi_site_id_cb492296_fk_django_si` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_duration_limits_coursedurationlimitconfig`
--

LOCK TABLES `course_duration_limits_coursedurationlimitconfig` WRITE;
/*!40000 ALTER TABLE `course_duration_limits_coursedurationlimitconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_duration_limits_coursedurationlimitconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_goals_coursegoal`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_goals_coursegoal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_key` varchar(255) NOT NULL,
  `goal_key` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_goals_coursegoal_user_id_course_key_052bc0d3_uniq` (`user_id`,`course_key`),
  KEY `course_goals_coursegoal_course_key_5585ca51` (`course_key`),
  CONSTRAINT `course_goals_coursegoal_user_id_0a07e3db_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_goals_coursegoal`
--

LOCK TABLES `course_goals_coursegoal` WRITE;
/*!40000 ALTER TABLE `course_goals_coursegoal` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_goals_coursegoal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_goals_historicalcoursegoal`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_goals_historicalcoursegoal` (
  `id` int(11) NOT NULL,
  `course_key` varchar(255) NOT NULL,
  `goal_key` varchar(100) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `course_goals_histori_history_user_id_b20abbc7_fk_auth_user` (`history_user_id`),
  KEY `course_goals_historicalcoursegoal_id_ae96ee01` (`id`),
  KEY `course_goals_historicalcoursegoal_course_key_a8e29f00` (`course_key`),
  KEY `course_goals_historicalcoursegoal_user_id_3aef8b4b` (`user_id`),
  CONSTRAINT `course_goals_histori_history_user_id_b20abbc7_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_goals_historicalcoursegoal`
--

LOCK TABLES `course_goals_historicalcoursegoal` WRITE;
/*!40000 ALTER TABLE `course_goals_historicalcoursegoal` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_goals_historicalcoursegoal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_groups_cohortmembership`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_groups_cohortmembership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `course_user_group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_groups_cohortmembership_user_id_course_id_c247eb7f_uniq` (`user_id`,`course_id`),
  KEY `course_groups_cohort_course_user_group_id_6ea50b45_fk_course_gr` (`course_user_group_id`),
  CONSTRAINT `course_groups_cohort_course_user_group_id_6ea50b45_fk_course_gr` FOREIGN KEY (`course_user_group_id`) REFERENCES `course_groups_courseusergroup` (`id`),
  CONSTRAINT `course_groups_cohortmembership_user_id_aae5b8e7_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_groups_cohortmembership`
--

LOCK TABLES `course_groups_cohortmembership` WRITE;
/*!40000 ALTER TABLE `course_groups_cohortmembership` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_groups_cohortmembership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_groups_coursecohort`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_groups_coursecohort` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_type` varchar(20) NOT NULL,
  `course_user_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_user_group_id` (`course_user_group_id`),
  CONSTRAINT `course_groups_course_course_user_group_id_ec5703ee_fk_course_gr` FOREIGN KEY (`course_user_group_id`) REFERENCES `course_groups_courseusergroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_groups_coursecohort`
--

LOCK TABLES `course_groups_coursecohort` WRITE;
/*!40000 ALTER TABLE `course_groups_coursecohort` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_groups_coursecohort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_groups_coursecohortssettings`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_groups_coursecohortssettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_cohorted` tinyint(1) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `cohorted_discussions` longtext,
  `always_cohort_inline_discussions` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_groups_coursecohortssettings`
--

LOCK TABLES `course_groups_coursecohortssettings` WRITE;
/*!40000 ALTER TABLE `course_groups_coursecohortssettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_groups_coursecohortssettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_groups_courseusergroup`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_groups_courseusergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `group_type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_groups_courseusergroup_name_course_id_b767231d_uniq` (`name`,`course_id`),
  KEY `course_groups_courseusergroup_course_id_902aea4c` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_groups_courseusergroup`
--

LOCK TABLES `course_groups_courseusergroup` WRITE;
/*!40000 ALTER TABLE `course_groups_courseusergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_groups_courseusergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_groups_courseusergroup_users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_groups_courseusergroup_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseusergroup_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_groups_courseuser_courseusergroup_id_user__694e8c30_uniq` (`courseusergroup_id`,`user_id`),
  KEY `course_groups_course_user_id_28aff981_fk_auth_user` (`user_id`),
  CONSTRAINT `course_groups_course_courseusergroup_id_26a7966f_fk_course_gr` FOREIGN KEY (`courseusergroup_id`) REFERENCES `course_groups_courseusergroup` (`id`),
  CONSTRAINT `course_groups_course_user_id_28aff981_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_groups_courseusergroup_users`
--

LOCK TABLES `course_groups_courseusergroup_users` WRITE;
/*!40000 ALTER TABLE `course_groups_courseusergroup_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_groups_courseusergroup_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_groups_courseusergrouppartitiongroup`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_groups_courseusergrouppartitiongroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partition_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `course_user_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_user_group_id` (`course_user_group_id`),
  CONSTRAINT `course_groups_course_course_user_group_id_6032d512_fk_course_gr` FOREIGN KEY (`course_user_group_id`) REFERENCES `course_groups_courseusergroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_groups_courseusergrouppartitiongroup`
--

LOCK TABLES `course_groups_courseusergrouppartitiongroup` WRITE;
/*!40000 ALTER TABLE `course_groups_courseusergrouppartitiongroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_groups_courseusergrouppartitiongroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_groups_unregisteredlearnercohortassignments`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_groups_unregisteredlearnercohortassignments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `course_user_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_groups_unregister_course_id_email_81a9d1db_uniq` (`course_id`,`email`),
  KEY `course_groups_unregi_course_user_group_id_c1c8a247_fk_course_gr` (`course_user_group_id`),
  KEY `course_groups_unregisteredl_email_05d0e40e` (`email`),
  CONSTRAINT `course_groups_unregi_course_user_group_id_c1c8a247_fk_course_gr` FOREIGN KEY (`course_user_group_id`) REFERENCES `course_groups_courseusergroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_groups_unregisteredlearnercohortassignments`
--

LOCK TABLES `course_groups_unregisteredlearnercohortassignments` WRITE;
/*!40000 ALTER TABLE `course_groups_unregisteredlearnercohortassignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_groups_unregisteredlearnercohortassignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_home_api_disableprogresspagestackedconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_home_api_disableprogresspagestackedconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `org` varchar(255) DEFAULT NULL,
  `org_course` varchar(255) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `course_id` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_home_site_id_6988e4_idx` (`site_id`,`org`,`course_id`),
  KEY `course_home_site_id_23dec6_idx` (`site_id`,`org`,`org_course`,`course_id`),
  KEY `course_home_api_disa_changed_by_id_2a8c1176_fk_auth_user` (`changed_by_id`),
  KEY `course_home_api_disa_course_id_815633f2_fk_course_ov` (`course_id`),
  KEY `course_home_api_disableprogresspagestackedconfig_org_d6dd0056` (`org`),
  KEY `course_home_api_disableprog_org_course_b4b94c97` (`org_course`),
  CONSTRAINT `course_home_api_disa_changed_by_id_2a8c1176_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `course_home_api_disa_course_id_815633f2_fk_course_ov` FOREIGN KEY (`course_id`) REFERENCES `course_overviews_courseoverview` (`id`),
  CONSTRAINT `course_home_api_disa_site_id_81e5e9d3_fk_django_si` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_home_api_disableprogresspagestackedconfig`
--

LOCK TABLES `course_home_api_disableprogresspagestackedconfig` WRITE;
/*!40000 ALTER TABLE `course_home_api_disableprogresspagestackedconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_home_api_disableprogresspagestackedconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_modes_coursemode`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_modes_coursemode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `mode_slug` varchar(100) NOT NULL,
  `mode_display_name` varchar(255) NOT NULL,
  `min_price` int(11) NOT NULL,
  `currency` varchar(8) NOT NULL,
  `expiration_datetime` datetime(6) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `suggested_prices` varchar(255) NOT NULL,
  `description` longtext,
  `sku` varchar(255) DEFAULT NULL,
  `expiration_datetime_is_explicit` tinyint(1) NOT NULL,
  `bulk_sku` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_modes_coursemode_course_id_mode_slug_curr_56f8e675_uniq` (`course_id`,`mode_slug`,`currency`),
  KEY `course_modes_coursemode_course_id_3daf3b9d` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_modes_coursemode`
--

LOCK TABLES `course_modes_coursemode` WRITE;
/*!40000 ALTER TABLE `course_modes_coursemode` DISABLE KEYS */;
INSERT INTO `course_modes_coursemode` VALUES (1,'course-v1:edX+DemoX+Demo_Course','verified','Verified Certificate',149,'usd','2022-07-30 20:19:59.064405',NULL,'',NULL,'8CF08E5',1,'A5B6DBE'),(2,'course-v1:edX+DemoX+Demo_Course','audit','Audit',0,'usd',NULL,NULL,'',NULL,'68EFFFF',0,NULL);
/*!40000 ALTER TABLE `course_modes_coursemode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_modes_coursemodeexpirationconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_modes_coursemodeexpirationconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `verification_window` bigint(20) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_modes_coursem_changed_by_id_208463ee_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `course_modes_coursem_changed_by_id_208463ee_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_modes_coursemodeexpirationconfig`
--

LOCK TABLES `course_modes_coursemodeexpirationconfig` WRITE;
/*!40000 ALTER TABLE `course_modes_coursemodeexpirationconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_modes_coursemodeexpirationconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_modes_coursemodesarchive`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_modes_coursemodesarchive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `mode_slug` varchar(100) NOT NULL,
  `mode_display_name` varchar(255) NOT NULL,
  `min_price` int(11) NOT NULL,
  `suggested_prices` varchar(255) NOT NULL,
  `currency` varchar(8) NOT NULL,
  `expiration_date` date DEFAULT NULL,
  `expiration_datetime` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_modes_coursemodesarchive_course_id_f67bbd35` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_modes_coursemodesarchive`
--

LOCK TABLES `course_modes_coursemodesarchive` WRITE;
/*!40000 ALTER TABLE `course_modes_coursemodesarchive` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_modes_coursemodesarchive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_modes_historicalcoursemode`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_modes_historicalcoursemode` (
  `id` int(11) NOT NULL,
  `mode_slug` varchar(100) NOT NULL,
  `mode_display_name` varchar(255) NOT NULL,
  `min_price` int(11) NOT NULL,
  `currency` varchar(8) NOT NULL,
  `expiration_datetime` datetime(6) DEFAULT NULL,
  `expiration_datetime_is_explicit` tinyint(1) NOT NULL,
  `expiration_date` date DEFAULT NULL,
  `suggested_prices` varchar(255) NOT NULL,
  `description` longtext,
  `sku` varchar(255) DEFAULT NULL,
  `bulk_sku` varchar(255) DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `course_id` varchar(255) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `course_modes_histori_history_user_id_d92d6b6e_fk_auth_user` (`history_user_id`),
  KEY `course_modes_historicalcoursemode_id_14918a77` (`id`),
  KEY `course_modes_historicalcoursemode_course_id_e8de13cd` (`course_id`),
  CONSTRAINT `course_modes_histori_history_user_id_d92d6b6e_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_modes_historicalcoursemode`
--

LOCK TABLES `course_modes_historicalcoursemode` WRITE;
/*!40000 ALTER TABLE `course_modes_historicalcoursemode` DISABLE KEYS */;
INSERT INTO `course_modes_historicalcoursemode` VALUES (1,'verified','Verified Certificate',149,'usd','2022-07-30 20:19:59.064405',1,NULL,'',NULL,'8CF08E5','A5B6DBE',1,'2021-07-30 20:20:00.366861',NULL,'+','course-v1:edX+DemoX+Demo_Course',1),(2,'audit','Audit',0,'usd',NULL,0,NULL,'',NULL,'68EFFFF',NULL,2,'2021-07-30 20:20:00.372685',NULL,'+','course-v1:edX+DemoX+Demo_Course',1);
/*!40000 ALTER TABLE `course_modes_historicalcoursemode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_overviews_courseoverview`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_overviews_courseoverview` (
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `version` int(11) NOT NULL,
  `id` varchar(255) NOT NULL,
  `_location` varchar(255) NOT NULL,
  `display_name` longtext,
  `display_number_with_default` longtext NOT NULL,
  `display_org_with_default` longtext NOT NULL,
  `start` datetime(6) DEFAULT NULL,
  `end` datetime(6) DEFAULT NULL,
  `advertised_start` longtext,
  `course_image_url` longtext NOT NULL,
  `social_sharing_url` longtext,
  `end_of_course_survey_url` longtext,
  `certificates_display_behavior` longtext,
  `certificates_show_before_end` tinyint(1) NOT NULL,
  `cert_html_view_enabled` tinyint(1) NOT NULL,
  `has_any_active_web_certificate` tinyint(1) NOT NULL,
  `cert_name_short` longtext NOT NULL,
  `cert_name_long` longtext NOT NULL,
  `lowest_passing_grade` decimal(5,2) DEFAULT NULL,
  `days_early_for_beta` double DEFAULT NULL,
  `mobile_available` tinyint(1) NOT NULL,
  `visible_to_staff_only` tinyint(1) NOT NULL,
  `_pre_requisite_courses_json` longtext NOT NULL,
  `enrollment_start` datetime(6) DEFAULT NULL,
  `enrollment_end` datetime(6) DEFAULT NULL,
  `enrollment_domain` longtext,
  `invitation_only` tinyint(1) NOT NULL,
  `max_student_enrollments_allowed` int(11) DEFAULT NULL,
  `announcement` datetime(6) DEFAULT NULL,
  `catalog_visibility` longtext,
  `course_video_url` longtext,
  `effort` longtext,
  `short_description` longtext,
  `org` longtext NOT NULL,
  `self_paced` tinyint(1) NOT NULL,
  `marketing_url` longtext,
  `eligible_for_financial_aid` tinyint(1) NOT NULL,
  `language` longtext,
  `certificate_available_date` datetime(6) DEFAULT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  `banner_image_url` longtext NOT NULL,
  `has_highlights` tinyint(1) DEFAULT NULL,
  `allow_proctoring_opt_out` tinyint(1) NOT NULL,
  `enable_proctored_exams` tinyint(1) NOT NULL,
  `proctoring_escalation_email` longtext,
  `proctoring_provider` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_overviews_courseoverview`
--

LOCK TABLES `course_overviews_courseoverview` WRITE;
/*!40000 ALTER TABLE `course_overviews_courseoverview` DISABLE KEYS */;
INSERT INTO `course_overviews_courseoverview` VALUES ('2021-07-30 20:03:24.113182','2021-07-30 20:03:35.592577',15,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@course+block@course','Demonstration Course','DemoX','edX','2013-02-05 05:00:00.000000',NULL,NULL,'/asset-v1:edX+DemoX+Demo_Course+type@asset+block@images_course_image.jpg',NULL,NULL,'end',0,1,0,'','',0.60,NULL,0,0,'[]',NULL,NULL,NULL,0,NULL,NULL,'both',NULL,NULL,NULL,'edX',0,NULL,1,NULL,NULL,NULL,NULL,'/asset-v1:edX+DemoX+Demo_Course+type@asset+block@images_course_image.jpg',0,0,0,NULL,'null');
/*!40000 ALTER TABLE `course_overviews_courseoverview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_overviews_courseoverviewimageconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_overviews_courseoverviewimageconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `small_width` int(11) NOT NULL,
  `small_height` int(11) NOT NULL,
  `large_width` int(11) NOT NULL,
  `large_height` int(11) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_overviews_cou_changed_by_id_b60ae39a_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `course_overviews_cou_changed_by_id_b60ae39a_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_overviews_courseoverviewimageconfig`
--

LOCK TABLES `course_overviews_courseoverviewimageconfig` WRITE;
/*!40000 ALTER TABLE `course_overviews_courseoverviewimageconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_overviews_courseoverviewimageconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_overviews_courseoverviewimageset`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_overviews_courseoverviewimageset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `small_url` longtext NOT NULL,
  `large_url` longtext NOT NULL,
  `course_overview_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_overview_id` (`course_overview_id`),
  CONSTRAINT `course_overviews_cou_course_overview_id_ef7aa548_fk_course_ov` FOREIGN KEY (`course_overview_id`) REFERENCES `course_overviews_courseoverview` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_overviews_courseoverviewimageset`
--

LOCK TABLES `course_overviews_courseoverviewimageset` WRITE;
/*!40000 ALTER TABLE `course_overviews_courseoverviewimageset` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_overviews_courseoverviewimageset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_overviews_courseoverviewtab`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_overviews_courseoverviewtab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tab_id` varchar(50) NOT NULL,
  `course_overview_id` varchar(255) NOT NULL,
  `course_staff_only` tinyint(1) NOT NULL,
  `name` longtext,
  `type` varchar(50) DEFAULT NULL,
  `url_slug` longtext,
  `link` longtext,
  `is_hidden` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_overviews_cou_course_overview_id_71fa6321_fk_course_ov` (`course_overview_id`),
  CONSTRAINT `course_overviews_cou_course_overview_id_71fa6321_fk_course_ov` FOREIGN KEY (`course_overview_id`) REFERENCES `course_overviews_courseoverview` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_overviews_courseoverviewtab`
--

LOCK TABLES `course_overviews_courseoverviewtab` WRITE;
/*!40000 ALTER TABLE `course_overviews_courseoverviewtab` DISABLE KEYS */;
INSERT INTO `course_overviews_courseoverviewtab` VALUES (13,'info','course-v1:edX+DemoX+Demo_Course',0,'Home','course_info',NULL,NULL,0),(14,'courseware','course-v1:edX+DemoX+Demo_Course',0,'Course','courseware',NULL,NULL,0),(15,'discussion','course-v1:edX+DemoX+Demo_Course',0,'Discussion','discussion','tab/discussion',NULL,0),(16,'wiki','course-v1:edX+DemoX+Demo_Course',0,'Wiki','wiki',NULL,NULL,0),(17,'textbooks','course-v1:edX+DemoX+Demo_Course',0,'Textbooks','textbooks',NULL,NULL,0),(18,'progress','course-v1:edX+DemoX+Demo_Course',0,'Progress','progress',NULL,NULL,0);
/*!40000 ALTER TABLE `course_overviews_courseoverviewtab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_overviews_historicalcourseoverview`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_overviews_historicalcourseoverview` (
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `version` int(11) NOT NULL,
  `id` varchar(255) NOT NULL,
  `_location` varchar(255) NOT NULL,
  `org` longtext NOT NULL,
  `display_name` longtext,
  `display_number_with_default` longtext NOT NULL,
  `display_org_with_default` longtext NOT NULL,
  `start` datetime(6) DEFAULT NULL,
  `end` datetime(6) DEFAULT NULL,
  `advertised_start` longtext,
  `announcement` datetime(6) DEFAULT NULL,
  `course_image_url` longtext NOT NULL,
  `social_sharing_url` longtext,
  `end_of_course_survey_url` longtext,
  `certificates_display_behavior` longtext,
  `certificates_show_before_end` tinyint(1) NOT NULL,
  `cert_html_view_enabled` tinyint(1) NOT NULL,
  `has_any_active_web_certificate` tinyint(1) NOT NULL,
  `cert_name_short` longtext NOT NULL,
  `cert_name_long` longtext NOT NULL,
  `certificate_available_date` datetime(6) DEFAULT NULL,
  `lowest_passing_grade` decimal(5,2) DEFAULT NULL,
  `days_early_for_beta` double DEFAULT NULL,
  `mobile_available` tinyint(1) NOT NULL,
  `visible_to_staff_only` tinyint(1) NOT NULL,
  `_pre_requisite_courses_json` longtext NOT NULL,
  `enrollment_start` datetime(6) DEFAULT NULL,
  `enrollment_end` datetime(6) DEFAULT NULL,
  `enrollment_domain` longtext,
  `invitation_only` tinyint(1) NOT NULL,
  `max_student_enrollments_allowed` int(11) DEFAULT NULL,
  `catalog_visibility` longtext,
  `short_description` longtext,
  `course_video_url` longtext,
  `effort` longtext,
  `self_paced` tinyint(1) NOT NULL,
  `marketing_url` longtext,
  `eligible_for_financial_aid` tinyint(1) NOT NULL,
  `language` longtext,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  `banner_image_url` longtext NOT NULL,
  `has_highlights` tinyint(1) DEFAULT NULL,
  `allow_proctoring_opt_out` tinyint(1) NOT NULL,
  `enable_proctored_exams` tinyint(1) NOT NULL,
  `proctoring_escalation_email` longtext,
  `proctoring_provider` longtext,
  PRIMARY KEY (`history_id`),
  KEY `course_overviews_his_history_user_id_e21063d9_fk_auth_user` (`history_user_id`),
  KEY `course_overviews_historicalcourseoverview_id_647043f0` (`id`),
  CONSTRAINT `course_overviews_his_history_user_id_e21063d9_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_overviews_historicalcourseoverview`
--

LOCK TABLES `course_overviews_historicalcourseoverview` WRITE;
/*!40000 ALTER TABLE `course_overviews_historicalcourseoverview` DISABLE KEYS */;
INSERT INTO `course_overviews_historicalcourseoverview` VALUES ('2021-07-30 20:03:24.113182','2021-07-30 20:03:24.119099',15,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@course+block@course','edX','Empty','DemoX','edX','2030-01-01 00:00:00.000000',NULL,NULL,NULL,'/asset-v1:edX+DemoX+Demo_Course+type@asset+block@images_course_image.jpg',NULL,NULL,'end',0,1,0,'','',NULL,0.50,NULL,0,0,'[]',NULL,NULL,NULL,0,NULL,'both',NULL,NULL,NULL,0,NULL,1,NULL,1,'2021-07-30 20:03:24.121944',NULL,'+',NULL,NULL,NULL,'/asset-v1:edX+DemoX+Demo_Course+type@asset+block@images_course_image.jpg',0,0,0,NULL,'null'),('2021-07-30 20:03:24.113182','2021-07-30 20:03:33.124665',15,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@course+block@course','edX','Demonstration Course','DemoX','edX','2013-02-05 05:00:00.000000',NULL,NULL,NULL,'/asset-v1:edX+DemoX+Demo_Course+type@asset+block@images_course_image.jpg',NULL,NULL,'end',0,1,0,'','',NULL,0.60,NULL,0,0,'[]',NULL,NULL,NULL,0,NULL,'both',NULL,NULL,NULL,0,NULL,1,NULL,2,'2021-07-30 20:03:33.128097',NULL,'~',NULL,NULL,NULL,'/asset-v1:edX+DemoX+Demo_Course+type@asset+block@images_course_image.jpg',0,0,0,NULL,'null'),('2021-07-30 20:03:24.113182','2021-07-30 20:03:35.592577',15,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@course+block@course','edX','Demonstration Course','DemoX','edX','2013-02-05 05:00:00.000000',NULL,NULL,NULL,'/asset-v1:edX+DemoX+Demo_Course+type@asset+block@images_course_image.jpg',NULL,NULL,'end',0,1,0,'','',NULL,0.60,NULL,0,0,'[]',NULL,NULL,NULL,0,NULL,'both',NULL,NULL,NULL,0,NULL,1,NULL,3,'2021-07-30 20:03:35.594238',NULL,'~',NULL,NULL,NULL,'/asset-v1:edX+DemoX+Demo_Course+type@asset+block@images_course_image.jpg',0,0,0,NULL,'null');
/*!40000 ALTER TABLE `course_overviews_historicalcourseoverview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_overviews_simulatecoursepublishconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_overviews_simulatecoursepublishconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `arguments` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_overviews_sim_changed_by_id_3413c118_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `course_overviews_sim_changed_by_id_3413c118_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_overviews_simulatecoursepublishconfig`
--

LOCK TABLES `course_overviews_simulatecoursepublishconfig` WRITE;
/*!40000 ALTER TABLE `course_overviews_simulatecoursepublishconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_overviews_simulatecoursepublishconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseware_coursedynamicupgradedeadlineconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseware_coursedynamicupgradedeadlineconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `deadline_days` smallint(5) unsigned NOT NULL,
  `opt_out` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courseware_coursedyn_changed_by_id_2c4efc3a_fk_auth_user` (`changed_by_id`),
  KEY `courseware_coursedynamicupg_course_id_60b88041` (`course_id`),
  CONSTRAINT `courseware_coursedyn_changed_by_id_2c4efc3a_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_coursedynamicupgradedeadlineconfiguration`
--

LOCK TABLES `courseware_coursedynamicupgradedeadlineconfiguration` WRITE;
/*!40000 ALTER TABLE `courseware_coursedynamicupgradedeadlineconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseware_coursedynamicupgradedeadlineconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseware_dynamicupgradedeadlineconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseware_dynamicupgradedeadlineconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `deadline_days` smallint(5) unsigned NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courseware_dynamicup_changed_by_id_6a450e2c_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `courseware_dynamicup_changed_by_id_6a450e2c_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_dynamicupgradedeadlineconfiguration`
--

LOCK TABLES `courseware_dynamicupgradedeadlineconfiguration` WRITE;
/*!40000 ALTER TABLE `courseware_dynamicupgradedeadlineconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseware_dynamicupgradedeadlineconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseware_offlinecomputedgrade`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseware_offlinecomputedgrade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `updated` datetime(6) NOT NULL,
  `gradeset` longtext,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courseware_offlinecomputedgrade_user_id_course_id_18dfd343_uniq` (`user_id`,`course_id`),
  KEY `courseware_offlinecomputedgrade_course_id_03e21ba7` (`course_id`),
  KEY `courseware_offlinecomputedgrade_created_b5bca47f` (`created`),
  KEY `courseware_offlinecomputedgrade_updated_6f3faff6` (`updated`),
  CONSTRAINT `courseware_offlinecomputedgrade_user_id_14864cea_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_offlinecomputedgrade`
--

LOCK TABLES `courseware_offlinecomputedgrade` WRITE;
/*!40000 ALTER TABLE `courseware_offlinecomputedgrade` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseware_offlinecomputedgrade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseware_offlinecomputedgradelog`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseware_offlinecomputedgradelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `seconds` int(11) NOT NULL,
  `nstudents` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courseware_offlinecomputedgradelog_course_id_1014e127` (`course_id`),
  KEY `courseware_offlinecomputedgradelog_created_33076a1a` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_offlinecomputedgradelog`
--

LOCK TABLES `courseware_offlinecomputedgradelog` WRITE;
/*!40000 ALTER TABLE `courseware_offlinecomputedgradelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseware_offlinecomputedgradelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseware_orgdynamicupgradedeadlineconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseware_orgdynamicupgradedeadlineconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `org_id` varchar(255) NOT NULL,
  `deadline_days` smallint(5) unsigned NOT NULL,
  `opt_out` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courseware_orgdynami_changed_by_id_b557a1ea_fk_auth_user` (`changed_by_id`),
  KEY `courseware_orgdynamicupgrad_org_id_85d3cbe4` (`org_id`),
  CONSTRAINT `courseware_orgdynami_changed_by_id_b557a1ea_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_orgdynamicupgradedeadlineconfiguration`
--

LOCK TABLES `courseware_orgdynamicupgradedeadlineconfiguration` WRITE;
/*!40000 ALTER TABLE `courseware_orgdynamicupgradedeadlineconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseware_orgdynamicupgradedeadlineconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseware_studentfieldoverride`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseware_studentfieldoverride` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `field` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courseware_studentfieldo_course_id_field_location_a1f7da25_uniq` (`course_id`,`field`,`location`,`student_id`),
  KEY `courseware_studentfi_student_id_7a972765_fk_auth_user` (`student_id`),
  KEY `courseware_studentfieldoverride_course_id_7ca0051c` (`course_id`),
  KEY `courseware_studentfieldoverride_location_95ad5047` (`location`),
  CONSTRAINT `courseware_studentfi_student_id_7a972765_fk_auth_user` FOREIGN KEY (`student_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_studentfieldoverride`
--

LOCK TABLES `courseware_studentfieldoverride` WRITE;
/*!40000 ALTER TABLE `courseware_studentfieldoverride` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseware_studentfieldoverride` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseware_studentmodule`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseware_studentmodule` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `module_type` varchar(32) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `state` longtext,
  `grade` double DEFAULT NULL,
  `max_grade` double DEFAULT NULL,
  `done` varchar(8) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courseware_studentmodule_student_id_module_id_cou_48e8deef_uniq` (`student_id`,`module_id`,`course_id`),
  KEY `courseware_studentmodule_module_type_f4f8863f` (`module_type`),
  KEY `courseware_studentmodule_course_id_0637cb49` (`course_id`),
  KEY `courseware_studentmodule_grade_adac1ba7` (`grade`),
  KEY `courseware_studentmodule_created_9976b4ad` (`created`),
  KEY `courseware_studentmodule_modified_f6a0b0cc` (`modified`),
  KEY `courseware_stats` (`module_id`,`grade`,`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_studentmodule`
--

LOCK TABLES `courseware_studentmodule` WRITE;
/*!40000 ALTER TABLE `courseware_studentmodule` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseware_studentmodule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseware_studentmodulehistory`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseware_studentmodulehistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(255) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `state` longtext,
  `grade` double DEFAULT NULL,
  `max_grade` double DEFAULT NULL,
  `student_module_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courseware_studentmo_student_module_id_6efc64cf_fk_coursewar` (`student_module_id`),
  KEY `courseware_studentmodulehistory_version_d3823ad1` (`version`),
  KEY `courseware_studentmodulehistory_created_19cb94d2` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_studentmodulehistory`
--

LOCK TABLES `courseware_studentmodulehistory` WRITE;
/*!40000 ALTER TABLE `courseware_studentmodulehistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseware_studentmodulehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseware_xmodulestudentinfofield`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseware_xmodulestudentinfofield` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(64) NOT NULL,
  `value` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courseware_xmodulestuden_student_id_field_name_2f3a4ee8_uniq` (`student_id`,`field_name`),
  KEY `courseware_xmodulestudentinfofield_field_name_191b762e` (`field_name`),
  KEY `courseware_xmodulestudentinfofield_created_beada63d` (`created`),
  KEY `courseware_xmodulestudentinfofield_modified_b53f9c88` (`modified`),
  CONSTRAINT `courseware_xmodulest_student_id_b78d39b4_fk_auth_user` FOREIGN KEY (`student_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_xmodulestudentinfofield`
--

LOCK TABLES `courseware_xmodulestudentinfofield` WRITE;
/*!40000 ALTER TABLE `courseware_xmodulestudentinfofield` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseware_xmodulestudentinfofield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseware_xmodulestudentprefsfield`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseware_xmodulestudentprefsfield` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(64) NOT NULL,
  `value` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `module_type` varchar(64) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courseware_xmodulestuden_student_id_module_type_f_1c218850_uniq` (`student_id`,`module_type`,`field_name`),
  KEY `courseware_xmodulestudentprefsfield_field_name_68d5e66e` (`field_name`),
  KEY `courseware_xmodulestudentprefsfield_created_16090241` (`created`),
  KEY `courseware_xmodulestudentprefsfield_modified_5b4e5525` (`modified`),
  KEY `courseware_xmodulestudentprefsfield_module_type_45b994b9` (`module_type`),
  CONSTRAINT `courseware_xmodulest_student_id_3c60ec8a_fk_auth_user` FOREIGN KEY (`student_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_xmodulestudentprefsfield`
--

LOCK TABLES `courseware_xmodulestudentprefsfield` WRITE;
/*!40000 ALTER TABLE `courseware_xmodulestudentprefsfield` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseware_xmodulestudentprefsfield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseware_xmoduleuserstatesummaryfield`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseware_xmoduleuserstatesummaryfield` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(64) NOT NULL,
  `value` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `usage_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courseware_xmoduleuserst_usage_id_field_name_e4e34c44_uniq` (`usage_id`,`field_name`),
  KEY `courseware_xmoduleuserstatesummaryfield_field_name_395cd2a6` (`field_name`),
  KEY `courseware_xmoduleuserstatesummaryfield_created_57d773a1` (`created`),
  KEY `courseware_xmoduleuserstatesummaryfield_modified_b4277a5d` (`modified`),
  KEY `courseware_xmoduleuserstatesummaryfield_usage_id_9f239d1f` (`usage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseware_xmoduleuserstatesummaryfield`
--

LOCK TABLES `courseware_xmoduleuserstatesummaryfield` WRITE;
/*!40000 ALTER TABLE `courseware_xmoduleuserstatesummaryfield` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseware_xmoduleuserstatesummaryfield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crawlers_crawlersconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crawlers_crawlersconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `known_user_agents` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `crawlers_crawlersconfig_changed_by_id_544af924_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `crawlers_crawlersconfig_changed_by_id_544af924_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crawlers_crawlersconfig`
--

LOCK TABLES `crawlers_crawlersconfig` WRITE;
/*!40000 ALTER TABLE `crawlers_crawlersconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `crawlers_crawlersconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credentials_credentialsapiconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credentials_credentialsapiconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `internal_service_url` varchar(200) NOT NULL,
  `public_service_url` varchar(200) NOT NULL,
  `enable_learner_issuance` tinyint(1) NOT NULL,
  `enable_studio_authoring` tinyint(1) NOT NULL,
  `cache_ttl` int(10) unsigned NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `credentials_credenti_changed_by_id_9e145a81_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `credentials_credenti_changed_by_id_9e145a81_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credentials_credentialsapiconfig`
--

LOCK TABLES `credentials_credentialsapiconfig` WRITE;
/*!40000 ALTER TABLE `credentials_credentialsapiconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `credentials_credentialsapiconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credentials_notifycredentialsconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credentials_notifycredentialsconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `arguments` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `credentials_notifycr_changed_by_id_e31cde0e_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `credentials_notifycr_changed_by_id_e31cde0e_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credentials_notifycredentialsconfig`
--

LOCK TABLES `credentials_notifycredentialsconfig` WRITE;
/*!40000 ALTER TABLE `credentials_notifycredentialsconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `credentials_notifycredentialsconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_creditconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_creditconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `cache_ttl` int(10) unsigned NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `credit_creditconfig_changed_by_id_72e1eca9_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `credit_creditconfig_changed_by_id_72e1eca9_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_creditconfig`
--

LOCK TABLES `credit_creditconfig` WRITE;
/*!40000 ALTER TABLE `credit_creditconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_creditconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_creditcourse`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_creditcourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_key` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_key` (`course_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_creditcourse`
--

LOCK TABLES `credit_creditcourse` WRITE;
/*!40000 ALTER TABLE `credit_creditcourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_creditcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_crediteligibility`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_crediteligibility` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `username` varchar(255) NOT NULL,
  `deadline` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `credit_crediteligibility_username_course_id_7906b4c1_uniq` (`username`,`course_id`),
  KEY `credit_crediteligibi_course_id_d86f481f_fk_credit_cr` (`course_id`),
  KEY `credit_crediteligibility_username_4c275fb5` (`username`),
  CONSTRAINT `credit_crediteligibi_course_id_d86f481f_fk_credit_cr` FOREIGN KEY (`course_id`) REFERENCES `credit_creditcourse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_crediteligibility`
--

LOCK TABLES `credit_crediteligibility` WRITE;
/*!40000 ALTER TABLE `credit_crediteligibility` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_crediteligibility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_creditprovider`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_creditprovider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `provider_id` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `enable_integration` tinyint(1) NOT NULL,
  `provider_url` varchar(200) NOT NULL,
  `provider_status_url` varchar(200) NOT NULL,
  `provider_description` longtext NOT NULL,
  `fulfillment_instructions` longtext,
  `eligibility_email_message` longtext NOT NULL,
  `receipt_email_message` longtext NOT NULL,
  `thumbnail_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `provider_id` (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_creditprovider`
--

LOCK TABLES `credit_creditprovider` WRITE;
/*!40000 ALTER TABLE `credit_creditprovider` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_creditprovider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_creditrequest`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_creditrequest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `uuid` varchar(32) NOT NULL,
  `username` varchar(255) NOT NULL,
  `parameters` longtext NOT NULL,
  `status` varchar(255) NOT NULL,
  `course_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `credit_creditrequest_username_course_id_provi_3b019afe_uniq` (`username`,`course_id`,`provider_id`),
  KEY `credit_creditrequest_course_id_5478ceaf_fk_credit_cr` (`course_id`),
  KEY `credit_creditrequest_provider_id_5465ab8b_fk_credit_cr` (`provider_id`),
  KEY `credit_creditrequest_username_bd5623e4` (`username`),
  CONSTRAINT `credit_creditrequest_course_id_5478ceaf_fk_credit_cr` FOREIGN KEY (`course_id`) REFERENCES `credit_creditcourse` (`id`),
  CONSTRAINT `credit_creditrequest_provider_id_5465ab8b_fk_credit_cr` FOREIGN KEY (`provider_id`) REFERENCES `credit_creditprovider` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_creditrequest`
--

LOCK TABLES `credit_creditrequest` WRITE;
/*!40000 ALTER TABLE `credit_creditrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_creditrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_creditrequirement`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_creditrequirement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `criteria` longtext NOT NULL,
  `active` tinyint(1) NOT NULL,
  `course_id` int(11) NOT NULL,
  `sort_value` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `credit_creditrequirement_namespace_name_course_id_87c301e6_uniq` (`namespace`,`name`,`course_id`),
  KEY `credit_creditrequire_course_id_b6aa812a_fk_credit_cr` (`course_id`),
  CONSTRAINT `credit_creditrequire_course_id_b6aa812a_fk_credit_cr` FOREIGN KEY (`course_id`) REFERENCES `credit_creditcourse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_creditrequirement`
--

LOCK TABLES `credit_creditrequirement` WRITE;
/*!40000 ALTER TABLE `credit_creditrequirement` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_creditrequirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_creditrequirementstatus`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_creditrequirementstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `username` varchar(255) NOT NULL,
  `status` varchar(32) NOT NULL,
  `reason` longtext NOT NULL,
  `requirement_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `credit_creditrequirement_username_requirement_id_f761eba5_uniq` (`username`,`requirement_id`),
  KEY `credit_creditrequire_requirement_id_cde25c76_fk_credit_cr` (`requirement_id`),
  KEY `credit_creditrequirementstatus_username_4c2511ed` (`username`),
  CONSTRAINT `credit_creditrequire_requirement_id_cde25c76_fk_credit_cr` FOREIGN KEY (`requirement_id`) REFERENCES `credit_creditrequirement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_creditrequirementstatus`
--

LOCK TABLES `credit_creditrequirementstatus` WRITE;
/*!40000 ALTER TABLE `credit_creditrequirementstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_creditrequirementstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dark_lang_darklangconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dark_lang_darklangconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `released_languages` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `beta_languages` longtext NOT NULL,
  `enable_beta_languages` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dark_lang_darklangconfig_changed_by_id_9a7df899_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `dark_lang_darklangconfig_changed_by_id_9a7df899_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dark_lang_darklangconfig`
--

LOCK TABLES `dark_lang_darklangconfig` WRITE;
/*!40000 ALTER TABLE `dark_lang_darklangconfig` DISABLE KEYS */;
INSERT INTO `dark_lang_darklangconfig` VALUES (1,'2021-07-30 19:56:37.351278',1,'',NULL,'',0);
/*!40000 ALTER TABLE `dark_lang_darklangconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degreed_degreedenterprisecustomerconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `degreed_degreedenterprisecustomerconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `key` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `degreed_company_id` varchar(255) NOT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  `transmission_chunk_size` int(11) NOT NULL,
  `degreed_base_url` varchar(255) NOT NULL,
  `degreed_user_id` varchar(255) NOT NULL,
  `degreed_user_password` varchar(255) NOT NULL,
  `provider_id` varchar(100) NOT NULL,
  `channel_worker_username` varchar(255) DEFAULT NULL,
  `catalogs_to_transmit` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_customer_id` (`enterprise_customer_id`),
  CONSTRAINT `degreed_degreedenter_enterprise_customer__86f16a0d_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degreed_degreedenterprisecustomerconfiguration`
--

LOCK TABLES `degreed_degreedenterprisecustomerconfiguration` WRITE;
/*!40000 ALTER TABLE `degreed_degreedenterprisecustomerconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `degreed_degreedenterprisecustomerconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degreed_degreedglobalconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `degreed_degreedglobalconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `completion_status_api_path` varchar(255) NOT NULL,
  `course_api_path` varchar(255) NOT NULL,
  `oauth_api_path` varchar(255) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `degreed_degreedgloba_changed_by_id_00a8a7be_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `degreed_degreedgloba_changed_by_id_00a8a7be_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degreed_degreedglobalconfiguration`
--

LOCK TABLES `degreed_degreedglobalconfiguration` WRITE;
/*!40000 ALTER TABLE `degreed_degreedglobalconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `degreed_degreedglobalconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degreed_degreedlearnerdatatransmissionaudit`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `degreed_degreedlearnerdatatransmissionaudit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `degreed_user_email` varchar(255) NOT NULL,
  `enterprise_course_enrollment_id` int(10) unsigned NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `course_completed` tinyint(1) NOT NULL,
  `completed_timestamp` varchar(10) NOT NULL,
  `status` varchar(100) NOT NULL,
  `error_message` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `degreed_degreedlearnerdatat_enterprise_course_enrollmen_2b4fe278` (`enterprise_course_enrollment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degreed_degreedlearnerdatatransmissionaudit`
--

LOCK TABLES `degreed_degreedlearnerdatatransmissionaudit` WRITE;
/*!40000 ALTER TABLE `degreed_degreedlearnerdatatransmissionaudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `degreed_degreedlearnerdatatransmissionaudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degreed_historicaldegreedenterprisecustomerconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `degreed_historicaldegreedenterprisecustomerconfiguration` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `key` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `degreed_company_id` varchar(255) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_customer_id` char(32) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `transmission_chunk_size` int(11) NOT NULL,
  `degreed_base_url` varchar(255) NOT NULL,
  `degreed_user_id` varchar(255) NOT NULL,
  `degreed_user_password` varchar(255) NOT NULL,
  `provider_id` varchar(100) NOT NULL,
  `channel_worker_username` varchar(255) DEFAULT NULL,
  `catalogs_to_transmit` longtext,
  PRIMARY KEY (`history_id`),
  KEY `degreed_historicalde_history_user_id_5b4776d8_fk_auth_user` (`history_user_id`),
  KEY `degreed_historicaldegreeden_id_756f1445` (`id`),
  KEY `degreed_historicaldegreeden_enterprise_customer_id_12129e6f` (`enterprise_customer_id`),
  CONSTRAINT `degreed_historicalde_history_user_id_5b4776d8_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degreed_historicaldegreedenterprisecustomerconfiguration`
--

LOCK TABLES `degreed_historicaldegreedenterprisecustomerconfiguration` WRITE;
/*!40000 ALTER TABLE `degreed_historicaldegreedenterprisecustomerconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `degreed_historicaldegreedenterprisecustomerconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demographics_historicaluserdemographics`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demographics_historicaluserdemographics` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `show_call_to_action` tinyint(1) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `demographics_histori_history_user_id_a05d5af3_fk_auth_user` (`history_user_id`),
  KEY `demographics_historicaluserdemographics_id_7a2d6c8f` (`id`),
  KEY `demographics_historicaluserdemographics_user_id_4fb8f26b` (`user_id`),
  CONSTRAINT `demographics_histori_history_user_id_a05d5af3_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demographics_historicaluserdemographics`
--

LOCK TABLES `demographics_historicaluserdemographics` WRITE;
/*!40000 ALTER TABLE `demographics_historicaluserdemographics` DISABLE KEYS */;
/*!40000 ALTER TABLE `demographics_historicaluserdemographics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demographics_userdemographics`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demographics_userdemographics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `show_call_to_action` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `demographics_userdemographics_user_id_e435d5d5_uniq` (`user_id`),
  CONSTRAINT `demographics_userdemographics_user_id_e435d5d5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demographics_userdemographics`
--

LOCK TABLES `demographics_userdemographics` WRITE;
/*!40000 ALTER TABLE `demographics_userdemographics` DISABLE KEYS */;
/*!40000 ALTER TABLE `demographics_userdemographics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts_discountpercentageconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discounts_discountpercentageconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `org` varchar(255) DEFAULT NULL,
  `org_course` varchar(255) DEFAULT NULL,
  `percentage` int(10) unsigned NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `course_id` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discounts_d_site_id_f87020_idx` (`site_id`,`org`,`course_id`),
  KEY `discounts_d_site_id_9fe8d6_idx` (`site_id`,`org`,`org_course`,`course_id`),
  KEY `discounts_discountpe_changed_by_id_b00d7aa3_fk_auth_user` (`changed_by_id`),
  KEY `discounts_discountpe_course_id_19913d92_fk_course_ov` (`course_id`),
  KEY `discounts_discountpercentageconfig_org_294e22dd` (`org`),
  KEY `discounts_discountpercentageconfig_org_course_31d0939e` (`org_course`),
  CONSTRAINT `discounts_discountpe_changed_by_id_b00d7aa3_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `discounts_discountpe_course_id_19913d92_fk_course_ov` FOREIGN KEY (`course_id`) REFERENCES `course_overviews_courseoverview` (`id`),
  CONSTRAINT `discounts_discountpe_site_id_b103a2af_fk_django_si` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts_discountpercentageconfig`
--

LOCK TABLES `discounts_discountpercentageconfig` WRITE;
/*!40000 ALTER TABLE `discounts_discountpercentageconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `discounts_discountpercentageconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts_discountrestrictionconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discounts_discountrestrictionconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `org` varchar(255) DEFAULT NULL,
  `org_course` varchar(255) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `course_id` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discounts_d_site_id_d67da3_idx` (`site_id`,`org`,`course_id`),
  KEY `discounts_d_site_id_f83727_idx` (`site_id`,`org`,`org_course`,`course_id`),
  KEY `discounts_discountre_changed_by_id_f18a5c1b_fk_auth_user` (`changed_by_id`),
  KEY `discounts_discountre_course_id_d7f6674b_fk_course_ov` (`course_id`),
  KEY `discounts_discountrestrictionconfig_org_010f786f` (`org`),
  KEY `discounts_discountrestrictionconfig_org_course_bb36b3cd` (`org_course`),
  CONSTRAINT `discounts_discountre_changed_by_id_f18a5c1b_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `discounts_discountre_course_id_d7f6674b_fk_course_ov` FOREIGN KEY (`course_id`) REFERENCES `course_overviews_courseoverview` (`id`),
  CONSTRAINT `discounts_discountre_site_id_3f4c1be6_fk_django_si` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts_discountrestrictionconfig`
--

LOCK TABLES `discounts_discountrestrictionconfig` WRITE;
/*!40000 ALTER TABLE `discounts_discountrestrictionconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `discounts_discountrestrictionconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussions_discussionsconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussions_discussionsconfiguration` (
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `context_key` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `plugin_configuration` longtext NOT NULL,
  `provider_type` varchar(100) NOT NULL,
  `lti_configuration_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`context_key`),
  KEY `discussions_discussi_lti_configuration_id_7088d266_fk_lti_consu` (`lti_configuration_id`),
  CONSTRAINT `discussions_discussi_lti_configuration_id_7088d266_fk_lti_consu` FOREIGN KEY (`lti_configuration_id`) REFERENCES `lti_consumer_lticonfiguration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussions_discussionsconfiguration`
--

LOCK TABLES `discussions_discussionsconfiguration` WRITE;
/*!40000 ALTER TABLE `discussions_discussionsconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `discussions_discussionsconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussions_historicaldiscussionsconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussions_historicaldiscussionsconfiguration` (
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `context_key` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `plugin_configuration` longtext NOT NULL,
  `provider_type` varchar(100) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `lti_configuration_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `discussions_historic_history_user_id_df7ddb62_fk_auth_user` (`history_user_id`),
  KEY `discussions_historicaldiscu_context_key_7c3bca39` (`context_key`),
  KEY `discussions_historicaldiscu_lti_configuration_id_a6693472` (`lti_configuration_id`),
  CONSTRAINT `discussions_historic_history_user_id_df7ddb62_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussions_historicaldiscussionsconfiguration`
--

LOCK TABLES `discussions_historicaldiscussionsconfiguration` WRITE;
/*!40000 ALTER TABLE `discussions_historicaldiscussionsconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `discussions_historicaldiscussionsconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussions_providerfilter`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussions_providerfilter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `org` varchar(255) DEFAULT NULL,
  `org_course` varchar(255) DEFAULT NULL,
  `allow` varchar(63) NOT NULL,
  `deny` varchar(63) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `course_id` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discussions_site_id_48e4b2_idx` (`site_id`,`org`,`course_id`),
  KEY `discussions_site_id_0f23d5_idx` (`site_id`,`org`,`org_course`,`course_id`),
  KEY `discussions_provider_changed_by_id_771ce4d3_fk_auth_user` (`changed_by_id`),
  KEY `discussions_provider_course_id_7b7d915c_fk_course_ov` (`course_id`),
  KEY `discussions_providerfilter_org_c5365456` (`org`),
  KEY `discussions_providerfilter_org_course_7b77bd87` (`org_course`),
  CONSTRAINT `discussions_provider_changed_by_id_771ce4d3_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `discussions_provider_course_id_7b7d915c_fk_course_ov` FOREIGN KEY (`course_id`) REFERENCES `course_overviews_courseoverview` (`id`),
  CONSTRAINT `discussions_providerfilter_site_id_9c77a203_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussions_providerfilter`
--

LOCK TABLES `discussions_providerfilter` WRITE;
/*!40000 ALTER TABLE `discussions_providerfilter` DISABLE KEYS */;
/*!40000 ALTER TABLE `discussions_providerfilter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_results_chordcounter`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_celery_results_chordcounter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(255) NOT NULL,
  `sub_tasks` longtext NOT NULL,
  `count` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_results_chordcounter`
--

LOCK TABLES `django_celery_results_chordcounter` WRITE;
/*!40000 ALTER TABLE `django_celery_results_chordcounter` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_results_chordcounter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_results_taskresult`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_celery_results_taskresult` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `content_type` varchar(128) NOT NULL,
  `content_encoding` varchar(64) NOT NULL,
  `result` longtext,
  `date_done` datetime(6) NOT NULL,
  `traceback` longtext,
  `meta` longtext,
  `task_args` longtext,
  `task_kwargs` longtext,
  `task_name` varchar(255) DEFAULT NULL,
  `worker` varchar(100) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `django_celery_results_taskresult_date_done_49edada6` (`date_done`),
  KEY `django_celery_results_taskresult_status_cbbed23a` (`status`),
  KEY `django_celery_results_taskresult_task_name_90987df3` (`task_name`),
  KEY `django_celery_results_taskresult_worker_f8711389` (`worker`),
  KEY `django_celery_results_taskresult_date_created_099f3424` (`date_created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_results_taskresult`
--

LOCK TABLES `django_celery_results_taskresult` WRITE;
/*!40000 ALTER TABLE `django_celery_results_taskresult` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_results_taskresult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_comment_client_permission`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_comment_client_permission` (
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comment_client_permission`
--

LOCK TABLES `django_comment_client_permission` WRITE;
/*!40000 ALTER TABLE `django_comment_client_permission` DISABLE KEYS */;
INSERT INTO `django_comment_client_permission` VALUES ('create_comment'),('create_sub_comment'),('create_thread'),('delete_comment'),('delete_thread'),('edit_content'),('endorse_comment'),('follow_commentable'),('follow_thread'),('group_delete_comment'),('group_delete_thread'),('group_edit_content'),('group_endorse_comment'),('group_openclose_thread'),('manage_moderator'),('openclose_thread'),('see_all_cohorts'),('unfollow_commentable'),('unfollow_thread'),('unvote'),('update_comment'),('update_thread'),('vote');
/*!40000 ALTER TABLE `django_comment_client_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_comment_client_permission_roles`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_comment_client_permission_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` varchar(30) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_comment_client_pe_permission_id_role_id_d3680ec3_uniq` (`permission_id`,`role_id`),
  KEY `django_comment_clien_role_id_d2cb08a2_fk_django_co` (`role_id`),
  CONSTRAINT `django_comment_clien_permission_id_f9f47fd2_fk_django_co` FOREIGN KEY (`permission_id`) REFERENCES `django_comment_client_permission` (`name`),
  CONSTRAINT `django_comment_clien_role_id_d2cb08a2_fk_django_co` FOREIGN KEY (`role_id`) REFERENCES `django_comment_client_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comment_client_permission_roles`
--

LOCK TABLES `django_comment_client_permission_roles` WRITE;
/*!40000 ALTER TABLE `django_comment_client_permission_roles` DISABLE KEYS */;
INSERT INTO `django_comment_client_permission_roles` VALUES (79,'create_comment',1),(34,'create_comment',2),(45,'create_comment',3),(62,'create_comment',4),(11,'create_comment',5),(74,'create_sub_comment',1),(29,'create_sub_comment',2),(40,'create_sub_comment',3),(57,'create_sub_comment',4),(6,'create_sub_comment',5),(76,'create_thread',1),(31,'create_thread',2),(42,'create_thread',3),(59,'create_thread',4),(8,'create_thread',5),(67,'delete_comment',1),(16,'delete_comment',2),(50,'delete_comment',4),(64,'delete_thread',1),(13,'delete_thread',2),(47,'delete_thread',4),(63,'edit_content',1),(12,'edit_content',2),(46,'edit_content',4),(66,'endorse_comment',1),(15,'endorse_comment',2),(49,'endorse_comment',4),(77,'follow_commentable',1),(32,'follow_commentable',2),(43,'follow_commentable',3),(60,'follow_commentable',4),(9,'follow_commentable',5),(71,'follow_thread',1),(26,'follow_thread',2),(37,'follow_thread',3),(54,'follow_thread',4),(3,'follow_thread',5),(22,'group_delete_comment',3),(19,'group_delete_thread',3),(18,'group_edit_content',3),(21,'group_endorse_comment',3),(20,'group_openclose_thread',3),(23,'manage_moderator',1),(65,'openclose_thread',1),(14,'openclose_thread',2),(48,'openclose_thread',4),(68,'see_all_cohorts',1),(17,'see_all_cohorts',2),(51,'see_all_cohorts',4),(78,'unfollow_commentable',1),(33,'unfollow_commentable',2),(44,'unfollow_commentable',3),(61,'unfollow_commentable',4),(10,'unfollow_commentable',5),(72,'unfollow_thread',1),(27,'unfollow_thread',2),(38,'unfollow_thread',3),(55,'unfollow_thread',4),(4,'unfollow_thread',5),(75,'unvote',1),(30,'unvote',2),(41,'unvote',3),(58,'unvote',4),(7,'unvote',5),(73,'update_comment',1),(28,'update_comment',2),(39,'update_comment',3),(56,'update_comment',4),(5,'update_comment',5),(70,'update_thread',1),(25,'update_thread',2),(36,'update_thread',3),(53,'update_thread',4),(2,'update_thread',5),(69,'vote',1),(24,'vote',2),(35,'vote',3),(52,'vote',4),(1,'vote',5);
/*!40000 ALTER TABLE `django_comment_client_permission_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_comment_client_role`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_comment_client_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_comment_client_role_course_id_08a9c1d1` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comment_client_role`
--

LOCK TABLES `django_comment_client_role` WRITE;
/*!40000 ALTER TABLE `django_comment_client_role` DISABLE KEYS */;
INSERT INTO `django_comment_client_role` VALUES (1,'Administrator','course-v1:edX+DemoX+Demo_Course'),(2,'Moderator','course-v1:edX+DemoX+Demo_Course'),(3,'Group Moderator','course-v1:edX+DemoX+Demo_Course'),(4,'Community TA','course-v1:edX+DemoX+Demo_Course'),(5,'Student','course-v1:edX+DemoX+Demo_Course');
/*!40000 ALTER TABLE `django_comment_client_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_comment_client_role_users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_comment_client_role_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_comment_client_role_users_role_id_user_id_93ab4289_uniq` (`role_id`,`user_id`),
  KEY `dcc_role_users_user_role_idx` (`user_id`,`role_id`),
  CONSTRAINT `django_comment_clien_role_id_baec77f6_fk_django_co` FOREIGN KEY (`role_id`) REFERENCES `django_comment_client_role` (`id`),
  CONSTRAINT `django_comment_clien_user_id_5d7991df_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comment_client_role_users`
--

LOCK TABLES `django_comment_client_role_users` WRITE;
/*!40000 ALTER TABLE `django_comment_client_role_users` DISABLE KEYS */;
INSERT INTO `django_comment_client_role_users` VALUES (1,5,5),(2,5,6),(3,5,7),(4,5,8);
/*!40000 ALTER TABLE `django_comment_client_role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_comment_common_coursediscussionsettings`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_comment_common_coursediscussionsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `always_divide_inline_discussions` tinyint(1) NOT NULL,
  `divided_discussions` longtext,
  `division_scheme` varchar(20) NOT NULL,
  `discussions_id_map` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comment_common_coursediscussionsettings`
--

LOCK TABLES `django_comment_common_coursediscussionsettings` WRITE;
/*!40000 ALTER TABLE `django_comment_common_coursediscussionsettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_comment_common_coursediscussionsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_comment_common_discussionsidmapping`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_comment_common_discussionsidmapping` (
  `course_id` varchar(255) NOT NULL,
  `mapping` longtext NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comment_common_discussionsidmapping`
--

LOCK TABLES `django_comment_common_discussionsidmapping` WRITE;
/*!40000 ALTER TABLE `django_comment_common_discussionsidmapping` DISABLE KEYS */;
INSERT INTO `django_comment_common_discussionsidmapping` VALUES ('course-v1:edX+DemoX+Demo_Course','{\"d9f970a42067413cbb633f81cfb12604\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@412dc8dbb6674014862237b23c1f643f\",\"98d8feb5971041a085512ae22b398613\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@722085be27c84ac693cfebc8ac5da700\",\"1d153da210844719a1a6cc39ca09673c\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@9f9e1373cc8243b985c8750cc8acec7d\",\"265ca2d808814d76ad670957a2b6071f\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@e2cb0e0994f84b0abfa5f4ae42ed9d44\",\"23347cb1d1e74ec79453ce361e38eb18\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@3169f89efde2452993f2f2d9bc74f5b2\",\"4250393f9f684bfeb3f1d514e15592d1\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@ffa5817d49e14fec83ad6187cbe16358\",\"eb264c9899b745fc81cd7405b53a7a65\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@e5eac7e1a5a24f5fa7ed77bb6d136591\",\"aecab8f355744782af5a9470185f0005\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@5ab88e67d46049b9aa694cb240c39cef\",\"cba3e4cd91d0466b9ac50926e495b76f\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@67c26b1e826e47aaa29757f62bcd1ad0\",\"ed3164d1235645739374094a8172964b\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@870371212ba04dcf9536d7c7b8f3109e\",\"b770140a122741fea651a50362dee7e6\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@4d672c5893cb4f1dad0de67d2008522e\",\"c49f0dfb8fc94c9c8d9999cc95190c56\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@501aed9d902349eeb2191fa505548de2\",\"53c486b035b4437c9197a543371e0f03\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@6244918637ed4ff4b5f94a840a7e4b43\",\"d7b66e45154b4af18f33213337685e91\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@6f7a6670f87147149caeff6afa07a526\",\"9ad16580878f49d1bf20ce1bc533d16e\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@e0d7423118ab432582d03e8e8dad8e36\",\"b11488e3580241f08146cbcfca693d06\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@03f051f9a8814881a3783d2511613aa6\",\"bb15269287ec44b6a2f69447db43d845\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@0aa7a3bdbe18427795b0c1a1d7c3cb9a\",\"239ef52e6eee468fb698b4217a7bafc6\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@c6cd4bea43454aaea60ad01beb0cf213\",\"cdad92273f7d4622aed770b7de8583bc\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@4f06b358a96f4d1dae57d6d81acd06f2\",\"e4365aad2c39498d824cf984b3f9b083\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@ed01bcd164e64038a78964a16eac3edc\",\"6e51dd8f181b44ffa6d91303a287ed3f\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@12ad4f3ff4c14114a6e629b00e000976\",\"edx_demo_embedded_discussion\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@discussion_5deb6081620d\",\"31c83aefa6634e83a3c80b81f5447201\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@ade92343df3d4953a40ab3adc8805390\",\"0717ec26e67e49b2a9f30d2e15c417dd\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@4aba537a78774bd5a862485a8563c345\",\"df0905ee484844769644f330844253e7\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@f480df4ce91347c5ae4301ddf6146238\",\"e252d4de97c7426e8b67ff516a9962f6\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@b8cec2a19ebf463f90cd3544c7927b0e\",\"97f19f6202e54d6a9ea59f7a573725a1\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@cd177caa62444fbca48aa8f843f09eac\",\"d459fcb5792b459ca0aefe141e633ccc\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@ddede76df71045ffa16de9d1481d2119\",\"ba12c2e0b81e4cef8e05e22049aafd63\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@1a810b1a3b2447b998f0917d0e5a802b\",\"a56e406f164746d8bbff76545e6d981f\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@23e6eda482c04335af2bb265beacaf59\",\"8ff02d4204bb42059db629e399a50a26\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@1c8d47c425724346a7968fa1bc745dcd\"}');
/*!40000 ALTER TABLE `django_comment_common_discussionsidmapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_comment_common_forumsconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_comment_common_forumsconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `connection_timeout` double NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `django_comment_commo_changed_by_id_9292e296_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `django_comment_commo_changed_by_id_9292e296_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comment_common_forumsconfig`
--

LOCK TABLES `django_comment_common_forumsconfig` WRITE;
/*!40000 ALTER TABLE `django_comment_common_forumsconfig` DISABLE KEYS */;
INSERT INTO `django_comment_common_forumsconfig` VALUES (1,'2021-07-30 19:56:47.278174',1,5,NULL);
/*!40000 ALTER TABLE `django_comment_common_forumsconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=424 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (142,'admin','logentry'),(305,'agreements','integritysignature'),(370,'announcements','announcement'),(256,'api_admin','apiaccessconfig'),(1,'api_admin','apiaccessrequest'),(257,'api_admin','catalog'),(197,'assessment','assessment'),(198,'assessment','assessmentfeedback'),(199,'assessment','assessmentfeedbackoption'),(200,'assessment','assessmentpart'),(201,'assessment','criterion'),(202,'assessment','criterionoption'),(210,'assessment','historicalsharedfileupload'),(203,'assessment','peerworkflow'),(204,'assessment','peerworkflowitem'),(205,'assessment','rubric'),(211,'assessment','sharedfileupload'),(209,'assessment','staffworkflow'),(206,'assessment','studenttrainingworkflow'),(207,'assessment','studenttrainingworkflowitem'),(212,'assessment','teamstaffworkflow'),(208,'assessment','trainingexample'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(260,'badges','badgeassertion'),(261,'badges','badgeclass'),(262,'badges','coursecompleteimageconfiguration'),(263,'badges','courseeventbadgesconfiguration'),(360,'blackboard','blackboardenterprisecustomerconfiguration'),(362,'blackboard','blackboardlearnerassessmentdatatransmissionaudit'),(361,'blackboard','blackboardlearnerdatatransmissionaudit'),(359,'blackboard','historicalblackboardenterprisecustomerconfiguration'),(231,'block_structure','blockstructureconfiguration'),(232,'block_structure','blockstructuremodel'),(371,'bookmarks','bookmark'),(372,'bookmarks','xblockcache'),(112,'branding','brandingapiconfig'),(113,'branding','brandinginfoconfig'),(108,'bulk_email','bulkemailflag'),(110,'bulk_email','cohorttarget'),(104,'bulk_email','courseauthorization'),(105,'bulk_email','courseemail'),(106,'bulk_email','courseemailtemplate'),(111,'bulk_email','coursemodetarget'),(107,'bulk_email','optout'),(109,'bulk_email','target'),(409,'bulk_grades','scoreoverrider'),(269,'calendar_sync','historicalusercalendarsyncconfig'),(270,'calendar_sync','usercalendarsyncconfig'),(364,'canvas','canvasenterprisecustomerconfiguration'),(366,'canvas','canvaslearnerassessmentdatatransmissionaudit'),(365,'canvas','canvaslearnerdatatransmissionaudit'),(363,'canvas','historicalcanvasenterprisecustomerconfiguration'),(248,'catalog','catalogintegration'),(264,'celery_utils','failedtask'),(94,'certificates','certificateallowlist'),(93,'certificates','certificategenerationcommandconfiguration'),(81,'certificates','certificategenerationconfiguration'),(82,'certificates','certificategenerationcoursesetting'),(89,'certificates','certificategenerationhistory'),(83,'certificates','certificatehtmlviewconfiguration'),(90,'certificates','certificateinvalidation'),(84,'certificates','certificatetemplate'),(85,'certificates','certificatetemplateasset'),(86,'certificates','examplecertificate'),(87,'certificates','examplecertificateset'),(88,'certificates','generatedcertificate'),(95,'certificates','historicalcertificateallowlist'),(92,'certificates','historicalcertificateinvalidation'),(91,'certificates','historicalgeneratedcertificate'),(234,'commerce','commerceconfiguration'),(398,'completion','blockcompletion'),(341,'consent','datasharingconsent'),(343,'consent','datasharingconsenttextoverrides'),(342,'consent','historicaldatasharingconsent'),(19,'contentserver','cdnuseragentsconfig'),(18,'contentserver','courseassetcachettlconfig'),(417,'contentstore','courseoutlineregenerate'),(416,'contentstore','videouploadconfig'),(5,'contenttypes','contenttype'),(373,'content_libraries','contentlibrary'),(374,'content_libraries','contentlibrarypermission'),(272,'content_type_gating','contenttypegatingconfig'),(353,'cornerstone','cornerstoneenterprisecustomerconfiguration'),(354,'cornerstone','cornerstoneglobalconfiguration'),(355,'cornerstone','cornerstonelearnerdatatransmissionaudit'),(356,'cornerstone','historicalcornerstoneenterprisecustomerconfiguration'),(233,'cors_csrf','xdomainproxyconfiguration'),(42,'courseware','coursedynamicupgradedeadlineconfiguration'),(43,'courseware','dynamicupgradedeadlineconfiguration'),(34,'courseware','offlinecomputedgrade'),(35,'courseware','offlinecomputedgradelog'),(44,'courseware','orgdynamicupgradedeadlineconfiguration'),(36,'courseware','studentfieldoverride'),(37,'courseware','studentmodule'),(38,'courseware','studentmodulehistory'),(39,'courseware','xmodulestudentinfofield'),(40,'courseware','xmodulestudentprefsfield'),(41,'courseware','xmoduleuserstatesummaryfield'),(45,'coursewarehistoryextended','studentmodulehistoryextended'),(179,'course_action_state','coursererunstate'),(418,'course_creators','coursecreator'),(278,'course_date_signals','selfpacedrelativedatesconfig'),(271,'course_duration_limits','coursedurationlimitconfig'),(267,'course_goals','coursegoal'),(268,'course_goals','historicalcoursegoal'),(98,'course_groups','cohortmembership'),(99,'course_groups','coursecohort'),(100,'course_groups','coursecohortssettings'),(101,'course_groups','courseusergroup'),(102,'course_groups','courseusergrouppartitiongroup'),(103,'course_groups','unregisteredlearnercohortassignments'),(114,'course_home_api','disableprogresspagestackedconfig'),(156,'course_modes','coursemode'),(158,'course_modes','coursemodeexpirationconfig'),(157,'course_modes','coursemodesarchive'),(159,'course_modes','historicalcoursemode'),(225,'course_overviews','courseoverview'),(228,'course_overviews','courseoverviewimageconfig'),(227,'course_overviews','courseoverviewimageset'),(226,'course_overviews','courseoverviewtab'),(229,'course_overviews','historicalcourseoverview'),(230,'course_overviews','simulatecoursepublishconfig'),(265,'crawlers','crawlersconfig'),(375,'credentials','credentialsapiconfig'),(376,'credentials','notifycredentialsconfig'),(241,'credit','creditconfig'),(235,'credit','creditcourse'),(236,'credit','crediteligibility'),(237,'credit','creditprovider'),(238,'credit','creditrequest'),(239,'credit','creditrequirement'),(240,'credit','creditrequirementstatus'),(170,'dark_lang','darklangconfig'),(346,'degreed','degreedenterprisecustomerconfiguration'),(347,'degreed','degreedglobalconfiguration'),(348,'degreed','degreedlearnerdatatransmissionaudit'),(349,'degreed','historicaldegreedenterprisecustomerconfiguration'),(284,'demographics','historicaluserdemographics'),(283,'demographics','userdemographics'),(274,'discounts','discountpercentageconfig'),(273,'discounts','discountrestrictionconfig'),(378,'discussions','discussionsconfiguration'),(377,'discussions','historicaldiscussionsconfiguration'),(379,'discussions','providerfilter'),(10,'django_celery_results','chordcounter'),(9,'django_celery_results','taskresult'),(146,'django_comment_common','coursediscussionsettings'),(147,'django_comment_common','discussionsidmapping'),(145,'django_comment_common','forumsconfig'),(143,'django_comment_common','permission'),(144,'django_comment_common','role'),(138,'django_notify','notification'),(139,'django_notify','notificationtype'),(140,'django_notify','settings'),(141,'django_notify','subscription'),(220,'edxval','coursevideo'),(219,'edxval','encodedvideo'),(217,'edxval','profile'),(224,'edxval','thirdpartytranscriptcredentialsstate'),(222,'edxval','transcriptpreference'),(218,'edxval','video'),(221,'edxval','videoimage'),(223,'edxval','videotranscript'),(415,'edx_name_affirmation','verifiedname'),(399,'edx_proctoring','proctoredexam'),(400,'edx_proctoring','proctoredexamreviewpolicy'),(401,'edx_proctoring','proctoredexamreviewpolicyhistory'),(402,'edx_proctoring','proctoredexamsoftwaresecurecomment'),(403,'edx_proctoring','proctoredexamsoftwaresecurereview'),(404,'edx_proctoring','proctoredexamsoftwaresecurereviewhistory'),(405,'edx_proctoring','proctoredexamstudentallowance'),(406,'edx_proctoring','proctoredexamstudentallowancehistory'),(407,'edx_proctoring','proctoredexamstudentattempt'),(408,'edx_proctoring','proctoredexamstudentattempthistory'),(394,'edx_when','contentdate'),(395,'edx_when','datepolicy'),(396,'edx_when','userdate'),(172,'embargo','country'),(173,'embargo','countryaccessrule'),(174,'embargo','courseaccessrulehistory'),(175,'embargo','embargoedcourse'),(176,'embargo','embargoedstate'),(177,'embargo','ipfilter'),(178,'embargo','restrictedcourse'),(337,'enterprise','adminnotification'),(336,'enterprise','adminnotificationfilter'),(338,'enterprise','adminnotificationread'),(306,'enterprise','enrollmentnotificationemailtemplate'),(334,'enterprise','enterpriseanalyticsuser'),(307,'enterprise','enterprisecatalogquery'),(315,'enterprise','enterprisecourseenrollment'),(308,'enterprise','enterprisecustomer'),(309,'enterprise','enterprisecustomerbrandingconfiguration'),(310,'enterprise','enterprisecustomercatalog'),(311,'enterprise','enterprisecustomeridentityprovider'),(312,'enterprise','enterprisecustomerreportingconfiguration'),(313,'enterprise','enterprisecustomertype'),(314,'enterprise','enterprisecustomeruser'),(316,'enterprise','enterpriseenrollmentsource'),(317,'enterprise','enterprisefeaturerole'),(318,'enterprise','enterprisefeatureuserroleassignment'),(319,'enterprise','historicalenrollmentnotificationemailtemplate'),(333,'enterprise','historicalenterpriseanalyticsuser'),(320,'enterprise','historicalenterprisecourseenrollment'),(321,'enterprise','historicalenterprisecustomer'),(322,'enterprise','historicalenterprisecustomercatalog'),(340,'enterprise','historicalenterprisecustomeruser'),(330,'enterprise','historicallicensedenterprisecourseenrollment'),(323,'enterprise','historicalpendingenrollment'),(331,'enterprise','historicalpendingenterprisecustomeradminuser'),(324,'enterprise','historicalpendingenterprisecustomeruser'),(339,'enterprise','historicalsystemwideenterpriseuserroleassignment'),(329,'enterprise','licensedenterprisecourseenrollment'),(325,'enterprise','pendingenrollment'),(332,'enterprise','pendingenterprisecustomeradminuser'),(326,'enterprise','pendingenterprisecustomeruser'),(327,'enterprise','systemwideenterpriserole'),(328,'enterprise','systemwideenterpriseuserroleassignment'),(335,'enterprise','updateroleassignmentswithcustomersconfig'),(160,'entitlements','courseentitlement'),(161,'entitlements','courseentitlementpolicy'),(162,'entitlements','courseentitlementsupportdetail'),(163,'entitlements','historicalcourseentitlement'),(164,'entitlements','historicalcourseentitlementsupportdetail'),(300,'event_routing_backends','routerconfiguration'),(275,'experiments','experimentdata'),(276,'experiments','experimentkeyvalue'),(277,'experiments','historicalexperimentkeyvalue'),(279,'external_user_ids','externalid'),(280,'external_user_ids','externalidtype'),(281,'external_user_ids','historicalexternalid'),(282,'external_user_ids','historicalexternalidtype'),(385,'grades','computegradessetting'),(382,'grades','coursepersistentgradesflag'),(387,'grades','historicalpersistentsubsectiongradeoverride'),(384,'grades','persistentcoursegrade'),(383,'grades','persistentgradesenabledflag'),(380,'grades','persistentsubsectiongrade'),(386,'grades','persistentsubsectiongradeoverride'),(381,'grades','visibleblocks'),(97,'instructor_task','gradereportsetting'),(96,'instructor_task','instructortask'),(345,'integrated_channel','contentmetadataitemtransmission'),(344,'integrated_channel','learnerdatatransmissionaudit'),(296,'learning_sequences','contenterror'),(293,'learning_sequences','coursecontext'),(289,'learning_sequences','coursesection'),(290,'learning_sequences','coursesectionsequence'),(294,'learning_sequences','coursesequenceexam'),(291,'learning_sequences','learningcontext'),(292,'learning_sequences','learningsequence'),(295,'learning_sequences','publishreport'),(299,'learning_sequences','sectionpartitiongroup'),(298,'learning_sequences','sectionsequencepartitiongroup'),(297,'learning_sequences','userpartitiongroup'),(190,'lms_xblock','xblockasidesconfig'),(414,'lti_consumer','courseallowpiisharinginltiflag'),(411,'lti_consumer','ltiagslineitem'),(412,'lti_consumer','ltiagsscore'),(410,'lti_consumer','lticonfiguration'),(413,'lti_consumer','ltidlcontentitem'),(251,'milestones','coursecontentmilestone'),(252,'milestones','coursemilestone'),(253,'milestones','milestone'),(254,'milestones','milestonerelationshiptype'),(255,'milestones','usermilestone'),(181,'mobile_api','appversionconfig'),(182,'mobile_api','ignoremobileavailableflagconfig'),(180,'mobile_api','mobileapiconfig'),(368,'moodle','historicalmoodleenterprisecustomerconfiguration'),(367,'moodle','moodleenterprisecustomerconfiguration'),(369,'moodle','moodlelearnerdatatransmissionaudit'),(116,'oauth2_provider','accesstoken'),(115,'oauth2_provider','application'),(117,'oauth2_provider','grant'),(118,'oauth2_provider','refreshtoken'),(120,'oauth_dispatch','applicationaccess'),(121,'oauth_dispatch','applicationorganization'),(119,'oauth_dispatch','restrictedapplication'),(303,'organizations','historicalorganization'),(304,'organizations','historicalorganizationcourse'),(301,'organizations','organization'),(302,'organizations','organizationcourse'),(247,'programs','programsapiconfig'),(392,'program_enrollments','courseaccessroleassignment'),(390,'program_enrollments','historicalprogramcourseenrollment'),(388,'program_enrollments','historicalprogramenrollment'),(391,'program_enrollments','programcourseenrollment'),(389,'program_enrollments','programenrollment'),(6,'redirects','redirect'),(171,'rss_proxy','whitelistedrssurl'),(352,'sap_success_factors','sapsuccessfactorsenterprisecustomerconfiguration'),(351,'sap_success_factors','sapsuccessfactorsglobalconfiguration'),(350,'sap_success_factors','sapsuccessfactorslearnerdatatransmissionaudit'),(288,'schedules','historicalschedule'),(285,'schedules','schedule'),(286,'schedules','scheduleconfig'),(287,'schedules','scheduleexperience'),(249,'self_paced','selfpacedconfiguration'),(7,'sessions','session'),(8,'sites','site'),(20,'site_configuration','siteconfiguration'),(21,'site_configuration','siteconfigurationhistory'),(183,'social_django','association'),(184,'social_django','code'),(185,'social_django','nonce'),(187,'social_django','partial'),(186,'social_django','usersocialauth'),(148,'splash','splashconfig'),(16,'static_replace','assetbaseurlconfig'),(17,'static_replace','assetexcludedextensionsconfig'),(14,'status','coursemessage'),(15,'status','globalstatusmessage'),(68,'student','accountrecovery'),(75,'student','accountrecoveryconfiguration'),(73,'student','allowedauthuser'),(46,'student','anonymoususerid'),(77,'student','bulkchangeenrollmentconfiguration'),(71,'student','bulkunenrollconfiguration'),(47,'student','courseaccessrole'),(48,'student','courseenrollment'),(49,'student','courseenrollmentallowed'),(50,'student','courseenrollmentattribute'),(76,'student','courseenrollmentcelebration'),(51,'student','dashboardconfiguration'),(52,'student','enrollmentrefundconfiguration'),(53,'student','entranceexamconfiguration'),(72,'student','fbeenrollmentexclusion'),(70,'student','historicalcourseenrollment'),(74,'student','historicalmanualenrollmentaudit'),(54,'student','languageproficiency'),(55,'student','linkedinaddtoprofileconfiguration'),(56,'student','loginfailures'),(57,'student','manualenrollmentaudit'),(58,'student','pendingemailchange'),(59,'student','pendingnamechange'),(69,'student','pendingsecondaryemailchange'),(60,'student','registration'),(66,'student','registrationcookieconfiguration'),(67,'student','sociallink'),(65,'student','userattribute'),(79,'student','usercelebration'),(78,'student','userpasswordtogglehistory'),(61,'student','userprofile'),(62,'student','usersignupsource'),(63,'student','userstanding'),(64,'student','usertestgroup'),(191,'submissions','score'),(195,'submissions','scoreannotation'),(194,'submissions','scoresummary'),(192,'submissions','studentitem'),(193,'submissions','submission'),(196,'submissions','teamsubmission'),(397,'super_csv','csvoperation'),(188,'survey','surveyanswer'),(189,'survey','surveyform'),(127,'system_wide_roles','systemwiderole'),(128,'system_wide_roles','systemwideroleassignment'),(420,'tagging','tagavailablevalues'),(421,'tagging','tagcategories'),(242,'teams','courseteam'),(243,'teams','courseteammembership'),(393,'theming','sitetheme'),(125,'third_party_auth','ltiproviderconfig'),(124,'third_party_auth','oauth2providerconfig'),(123,'third_party_auth','samlconfiguration'),(126,'third_party_auth','samlproviderconfig'),(122,'third_party_auth','samlproviderdata'),(250,'thumbnail','kvstore'),(152,'user_api','retirementstate'),(149,'user_api','usercoursetag'),(150,'user_api','userorgtag'),(151,'user_api','userpreference'),(155,'user_api','userretirementpartnerreportingstatus'),(154,'user_api','userretirementrequest'),(153,'user_api','userretirementstatus'),(422,'user_tasks','usertaskartifact'),(423,'user_tasks','usertaskstatus'),(80,'util','ratelimitconfiguration'),(259,'verified_track_content','migrateverifiedtrackcohortssetting'),(258,'verified_track_content','verifiedtrackcohortedcourse'),(168,'verify_student','manualverification'),(165,'verify_student','softwaresecurephotoverification'),(167,'verify_student','ssoverification'),(169,'verify_student','sspverificationretryconfig'),(166,'verify_student','verificationdeadline'),(22,'video_config','coursehlsplaybackenabledflag'),(24,'video_config','coursevideotranscriptenabledflag'),(30,'video_config','courseyoutubeblockedflag'),(23,'video_config','hlsplaybackenabledflag'),(27,'video_config','migrationenqueuedcourse'),(26,'video_config','transcriptmigrationsetting'),(28,'video_config','updatedcoursevideos'),(29,'video_config','videothumbnailsetting'),(25,'video_config','videotranscriptenabledflag'),(31,'video_pipeline','coursevideouploadsenabledbydefault'),(33,'video_pipeline','vempipelineintegration'),(32,'video_pipeline','videouploadsenabledbydefault'),(11,'waffle','flag'),(12,'waffle','sample'),(13,'waffle','switch'),(266,'waffle_utils','waffleflagcourseoverridemodel'),(129,'wiki','article'),(130,'wiki','articleforobject'),(131,'wiki','articleplugin'),(132,'wiki','articlerevision'),(133,'wiki','reusableplugin'),(134,'wiki','revisionplugin'),(135,'wiki','revisionpluginrevision'),(136,'wiki','simpleplugin'),(137,'wiki','urlpath'),(213,'workflow','assessmentworkflow'),(214,'workflow','assessmentworkflowcancellation'),(215,'workflow','assessmentworkflowstep'),(216,'workflow','teamassessmentworkflow'),(358,'xapi','xapilearnerdatatransmissionaudit'),(357,'xapi','xapilrsconfiguration'),(419,'xblock_config','studioconfig'),(244,'xblock_django','xblockconfiguration'),(245,'xblock_django','xblockstudioconfiguration'),(246,'xblock_django','xblockstudioconfigurationflag');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=690 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-07-30 19:55:41.417847'),(2,'auth','0001_initial','2021-07-30 19:55:41.654936'),(3,'admin','0001_initial','2021-07-30 19:55:42.096197'),(4,'admin','0002_logentry_remove_auto_add','2021-07-30 19:55:42.210360'),(5,'admin','0003_logentry_add_action_flag_choices','2021-07-30 19:55:42.249486'),(6,'agreements','0001_initial','2021-07-30 19:55:42.317562'),(7,'announcements','0001_initial','2021-07-30 19:55:42.416481'),(8,'sites','0001_initial','2021-07-30 19:55:42.449485'),(9,'contenttypes','0002_remove_content_type_name','2021-07-30 19:55:42.622259'),(10,'api_admin','0001_initial','2021-07-30 19:55:42.777263'),(11,'api_admin','0002_auto_20160325_1604','2021-07-30 19:55:42.994283'),(12,'api_admin','0003_auto_20160404_1618','2021-07-30 19:55:43.569172'),(13,'api_admin','0004_auto_20160412_1506','2021-07-30 19:55:43.955117'),(14,'api_admin','0005_auto_20160414_1232','2021-07-30 19:55:44.088841'),(15,'api_admin','0006_catalog','2021-07-30 19:55:44.101465'),(16,'api_admin','0007_delete_historical_api_records','2021-07-30 19:55:44.338389'),(17,'assessment','0001_initial','2021-07-30 19:55:45.222308'),(18,'assessment','0002_staffworkflow','2021-07-30 19:55:46.208525'),(19,'assessment','0003_expand_course_id','2021-07-30 19:55:46.548011'),(20,'assessment','0004_historicalsharedfileupload_sharedfileupload','2021-07-30 19:55:46.669560'),(21,'assessment','0005_add_filename_to_sharedupload','2021-07-30 19:55:46.995408'),(22,'assessment','0006_TeamWorkflows','2021-07-30 19:55:47.039547'),(23,'auth','0002_alter_permission_name_max_length','2021-07-30 19:55:47.137699'),(24,'auth','0003_alter_user_email_max_length','2021-07-30 19:55:47.195014'),(25,'auth','0004_alter_user_username_opts','2021-07-30 19:55:47.235582'),(26,'auth','0005_alter_user_last_login_null','2021-07-30 19:55:47.300574'),(27,'auth','0006_require_contenttypes_0002','2021-07-30 19:55:47.307071'),(28,'auth','0007_alter_validators_add_error_messages','2021-07-30 19:55:47.348955'),(29,'auth','0008_alter_user_username_max_length','2021-07-30 19:55:47.412689'),(30,'auth','0009_alter_user_last_name_max_length','2021-07-30 19:55:47.479991'),(31,'auth','0010_alter_group_name_max_length','2021-07-30 19:55:47.547017'),(32,'auth','0011_update_proxy_permissions','2021-07-30 19:55:47.631489'),(33,'instructor_task','0001_initial','2021-07-30 19:55:47.693166'),(34,'certificates','0001_initial','2021-07-30 19:55:48.489089'),(35,'certificates','0002_data__certificatehtmlviewconfiguration_data','2021-07-30 19:55:48.911986'),(36,'certificates','0003_data__default_modes','2021-07-30 19:55:49.050710'),(37,'certificates','0004_certificategenerationhistory','2021-07-30 19:55:49.115117'),(38,'certificates','0005_auto_20151208_0801','2021-07-30 19:55:49.265207'),(39,'certificates','0006_certificatetemplateasset_asset_slug','2021-07-30 19:55:49.318728'),(40,'certificates','0007_certificateinvalidation','2021-07-30 19:55:49.396052'),(41,'badges','0001_initial','2021-07-30 19:55:49.758261'),(42,'badges','0002_data__migrate_assertions','2021-07-30 19:55:50.029893'),(43,'badges','0003_schema__add_event_configuration','2021-07-30 19:55:50.113326'),(44,'badges','0004_badgeclass_badgr_server_slug','2021-07-30 19:55:50.198064'),(45,'waffle','0001_initial','2021-07-30 19:55:50.382403'),(46,'sites','0002_alter_domain_unique','2021-07-30 19:55:50.581075'),(47,'enterprise','0001_squashed_0092_auto_20200312_1650','2021-07-30 19:55:53.323180'),(48,'enterprise','0093_add_use_enterprise_catalog_flag','2021-07-30 19:55:54.146000'),(49,'enterprise','0094_add_use_enterprise_catalog_sample','2021-07-30 19:55:54.372752'),(50,'enterprise','0095_auto_20200507_1138','2021-07-30 19:55:54.501976'),(51,'enterprise','0096_enterprise_catalog_admin_role','2021-07-30 19:55:54.605107'),(52,'enterprise','0097_auto_20200619_1130','2021-07-30 19:55:54.919170'),(53,'enterprise','0098_auto_20200629_1756','2021-07-30 19:55:55.047687'),(54,'enterprise','0099_auto_20200702_1537','2021-07-30 19:55:55.188321'),(55,'enterprise','0100_add_licensed_enterprise_course_enrollment','2021-07-30 19:55:55.351099'),(56,'enterprise','0101_move_data_to_saved_for_later','2021-07-30 19:55:55.502777'),(57,'enterprise','0102_auto_20200708_1615','2021-07-30 19:55:55.644573'),(58,'enterprise','0103_remove_marked_done','2021-07-30 19:55:55.768062'),(59,'enterprise','0104_sync_query_field','2021-07-30 19:55:55.898579'),(60,'enterprise','0105_add_branding_config_color_fields','2021-07-30 19:55:56.029920'),(61,'enterprise','0106_move_branding_config_colors','2021-07-30 19:55:56.129563'),(62,'enterprise','0107_remove_branding_config_banner_fields','2021-07-30 19:55:56.218918'),(63,'enterprise','0108_add_licensed_enrollment_is_revoked','2021-07-30 19:55:56.322770'),(64,'enterprise','0109_remove_use_enterprise_catalog_sample','2021-07-30 19:55:56.424123'),(65,'enterprise','0110_add_default_contract_discount','2021-07-30 19:55:56.564444'),(66,'enterprise','0111_pendingenterprisecustomeradminuser','2021-07-30 19:55:56.732306'),(67,'enterprise','0112_auto_20200914_0926','2021-07-30 19:55:56.941664'),(68,'enterprise','0113_auto_20200914_2054','2021-07-30 19:55:57.086413'),(69,'blackboard','0001_initial','2021-07-30 19:55:57.264748'),(70,'blackboard','0002_auto_20200930_1723','2021-07-30 19:55:57.731349'),(71,'blackboard','0003_blackboardlearnerdatatransmissionaudit','2021-07-30 19:55:57.758457'),(72,'blackboard','0004_blackboard_tx_chunk_size_default_1','2021-07-30 19:55:57.861186'),(73,'blackboard','0005_blackboardlearnerassessmentdatatransmissionaudit','2021-07-30 19:55:57.889242'),(74,'blackboard','0006_auto_20210708_1446','2021-07-30 19:55:57.997227'),(75,'block_structure','0001_config','2021-07-30 19:55:58.092335'),(76,'block_structure','0002_blockstructuremodel','2021-07-30 19:55:58.139285'),(77,'block_structure','0003_blockstructuremodel_storage','2021-07-30 19:55:58.152570'),(78,'block_structure','0004_blockstructuremodel_usagekeywithrun','2021-07-30 19:55:58.165165'),(79,'block_structure','0005_trim_leading_slashes_in_data_path','2021-07-30 19:55:58.185100'),(80,'bookmarks','0001_initial','2021-07-30 19:55:58.461199'),(81,'branding','0001_initial','2021-07-30 19:55:58.703534'),(82,'course_modes','0001_initial','2021-07-30 19:55:58.806201'),(83,'course_modes','0002_coursemode_expiration_datetime_is_explicit','2021-07-30 19:55:58.857642'),(84,'course_modes','0003_auto_20151113_1443','2021-07-30 19:55:58.869571'),(85,'course_modes','0004_auto_20151113_1457','2021-07-30 19:55:58.959924'),(86,'course_modes','0005_auto_20151217_0958','2021-07-30 19:55:58.998287'),(87,'course_modes','0006_auto_20160208_1407','2021-07-30 19:55:59.058430'),(88,'course_modes','0007_coursemode_bulk_sku','2021-07-30 19:55:59.090318'),(89,'course_groups','0001_initial','2021-07-30 19:55:59.769328'),(90,'bulk_email','0001_initial','2021-07-30 19:56:00.244294'),(91,'bulk_email','0002_data__load_course_email_template','2021-07-30 19:56:00.516981'),(92,'bulk_email','0003_config_model_feature_flag','2021-07-30 19:56:00.615598'),(93,'bulk_email','0004_add_email_targets','2021-07-30 19:56:01.177288'),(94,'bulk_email','0005_move_target_data','2021-07-30 19:56:01.394939'),(95,'bulk_email','0006_course_mode_targets','2021-07-30 19:56:01.518417'),(96,'courseware','0001_initial','2021-07-30 19:56:02.573738'),(97,'bulk_grades','0001_initial','2021-07-30 19:56:03.074597'),(98,'bulk_grades','0002_auto_20190703_1526','2021-07-30 19:56:03.231305'),(99,'calendar_sync','0001_initial','2021-07-30 19:56:03.527573'),(100,'calendar_sync','0002_auto_20200709_1743','2021-07-30 19:56:04.137431'),(101,'canvas','0001_initial','2021-07-30 19:56:04.478564'),(102,'canvas','0002_auto_20200806_1632','2021-07-30 19:56:04.725601'),(103,'canvas','0003_delete_canvasglobalconfiguration','2021-07-30 19:56:04.742269'),(104,'canvas','0004_adding_learner_data_to_canvas','2021-07-30 19:56:04.770811'),(105,'canvas','0005_auto_20200909_1534','2021-07-30 19:56:04.803941'),(106,'canvas','0006_canvaslearnerassessmentdatatransmissionaudit','2021-07-30 19:56:04.838259'),(107,'canvas','0007_auto_20210222_2225','2021-07-30 19:56:05.047227'),(108,'canvas','0008_auto_20210707_0815','2021-07-30 19:56:05.175413'),(109,'canvas','0009_auto_20210708_1639','2021-07-30 19:56:05.324164'),(110,'catalog','0001_initial','2021-07-30 19:56:05.471202'),(111,'catalog','0002_catalogintegration_username','2021-07-30 19:56:05.801476'),(112,'catalog','0003_catalogintegration_page_size','2021-07-30 19:56:06.053509'),(113,'catalog','0004_auto_20170616_0618','2021-07-30 19:56:06.128380'),(114,'catalog','0005_catalogintegration_long_term_cache_ttl','2021-07-30 19:56:06.221577'),(115,'celery_utils','0001_initial','2021-07-30 19:56:06.275262'),(116,'celery_utils','0002_chordable_django_backend','2021-07-30 19:56:06.299353'),(117,'certificates','0008_schema__remove_badges','2021-07-30 19:56:06.595352'),(118,'certificates','0009_certificategenerationcoursesetting_language_self_generation','2021-07-30 19:56:06.810254'),(119,'certificates','0010_certificatetemplate_language','2021-07-30 19:56:06.847254'),(120,'certificates','0011_certificatetemplate_alter_unique','2021-07-30 19:56:07.375411'),(121,'certificates','0012_certificategenerationcoursesetting_include_hours_of_effort','2021-07-30 19:56:07.451390'),(122,'certificates','0013_remove_certificategenerationcoursesetting_enabled','2021-07-30 19:56:07.521058'),(123,'certificates','0014_change_eligible_certs_manager','2021-07-30 19:56:07.642318'),(124,'certificates','0015_add_masters_choice','2021-07-30 19:56:07.798876'),(125,'certificates','0016_historicalgeneratedcertificate','2021-07-30 19:56:07.939086'),(126,'certificates','0017_add_mode_20201118_1725','2021-07-30 19:56:08.142268'),(127,'certificates','0018_historicalcertificateinvalidation','2021-07-30 19:56:08.271697'),(128,'certificates','0019_allowlistgenerationconfiguration','2021-07-30 19:56:08.435262'),(129,'certificates','0020_remove_existing_mgmt_cmd_args','2021-07-30 19:56:08.603165'),(130,'certificates','0021_remove_certificate_allowlist_duplicate_records','2021-07-30 19:56:08.751705'),(131,'certificates','0022_add_unique_constraints_to_certificatewhitelist_model','2021-07-30 19:56:08.834893'),(132,'certificates','0023_certificategenerationcommandconfiguration','2021-07-30 19:56:08.922808'),(133,'certificates','0024_delete_allowlistgenerationconfiguration','2021-07-30 19:56:08.966676'),(134,'certificates','0025_cleanup_certificate_errors','2021-07-30 19:56:09.182688'),(135,'certificates','0026_certificateallowlist','2021-07-30 19:56:09.301627'),(136,'certificates','0027_historicalcertificateallowlist','2021-07-30 19:56:09.467101'),(137,'certificates','0028_allowlist_data_20210615_2033','2021-07-30 19:56:09.653074'),(138,'certificates','0029_allowlist_created_20210623_1417','2021-07-30 19:56:10.092332'),(139,'certificates','0030_delete_certificatewhitelist','2021-07-30 19:56:10.110854'),(140,'user_api','0001_initial','2021-07-30 19:56:10.712690'),(141,'user_api','0002_retirementstate_userretirementstatus','2021-07-30 19:56:10.957569'),(142,'commerce','0001_data__add_ecommerce_service_user','2021-07-30 19:56:11.264665'),(143,'commerce','0002_commerceconfiguration','2021-07-30 19:56:11.391886'),(144,'commerce','0003_auto_20160329_0709','2021-07-30 19:56:11.502494'),(145,'commerce','0004_auto_20160531_0950','2021-07-30 19:56:11.721973'),(146,'commerce','0005_commerceconfiguration_enable_automatic_refund_approval','2021-07-30 19:56:11.826172'),(147,'commerce','0006_auto_20170424_1734','2021-07-30 19:56:11.906856'),(148,'commerce','0007_auto_20180313_0609','2021-07-30 19:56:12.096712'),(149,'commerce','0008_auto_20191024_2048','2021-07-30 19:56:12.768820'),(150,'completion','0001_initial','2021-07-30 19:56:13.164222'),(151,'completion','0002_auto_20180125_1510','2021-07-30 19:56:13.392195'),(152,'completion','0003_learning_context','2021-07-30 19:56:13.833269'),(153,'consent','0001_initial','2021-07-30 19:56:14.128760'),(154,'consent','0002_migrate_to_new_data_sharing_consent','2021-07-30 19:56:14.379523'),(155,'consent','0003_historicaldatasharingconsent_history_change_reason','2021-07-30 19:56:14.529948'),(156,'consent','0004_datasharingconsenttextoverrides','2021-07-30 19:56:14.666821'),(157,'organizations','0001_initial','2021-07-30 19:56:14.869370'),(158,'organizations','0002_auto_20170117_1434','2021-07-30 19:56:14.873974'),(159,'organizations','0003_auto_20170221_1138','2021-07-30 19:56:14.878385'),(160,'organizations','0004_auto_20170413_2315','2021-07-30 19:56:14.882821'),(161,'organizations','0005_auto_20171116_0640','2021-07-30 19:56:14.887361'),(162,'organizations','0006_auto_20171207_0259','2021-07-30 19:56:14.891782'),(163,'organizations','0007_historicalorganization','2021-07-30 19:56:14.896722'),(164,'content_libraries','0001_initial','2021-07-30 19:56:15.800404'),(165,'content_libraries','0002_group_permissions','2021-07-30 19:56:16.676407'),(166,'content_libraries','0003_contentlibrary_type','2021-07-30 19:56:16.774857'),(167,'content_libraries','0004_contentlibrary_license','2021-07-30 19:56:16.815419'),(168,'course_overviews','0001_initial','2021-07-30 19:56:16.884267'),(169,'course_overviews','0002_add_course_catalog_fields','2021-07-30 19:56:17.061286'),(170,'course_overviews','0003_courseoverviewgeneratedhistory','2021-07-30 19:56:17.088278'),(171,'course_overviews','0004_courseoverview_org','2021-07-30 19:56:17.137373'),(172,'course_overviews','0005_delete_courseoverviewgeneratedhistory','2021-07-30 19:56:17.154945'),(173,'course_overviews','0006_courseoverviewimageset','2021-07-30 19:56:17.187938'),(174,'course_overviews','0007_courseoverviewimageconfig','2021-07-30 19:56:17.412717'),(175,'course_overviews','0008_remove_courseoverview_facebook_url','2021-07-30 19:56:17.482538'),(176,'course_overviews','0009_readd_facebook_url','2021-07-30 19:56:17.490893'),(177,'course_overviews','0010_auto_20160329_2317','2021-07-30 19:56:17.697229'),(178,'course_overviews','0011_courseoverview_marketing_url','2021-07-30 19:56:17.760098'),(179,'course_overviews','0012_courseoverview_eligible_for_financial_aid','2021-07-30 19:56:17.829871'),(180,'course_overviews','0013_courseoverview_language','2021-07-30 19:56:17.887063'),(181,'course_overviews','0014_courseoverview_certificate_available_date','2021-07-30 19:56:17.939355'),(182,'content_type_gating','0001_initial','2021-07-30 19:56:18.240787'),(183,'content_type_gating','0002_auto_20181119_0959','2021-07-30 19:56:18.772846'),(184,'content_type_gating','0003_auto_20181128_1407','2021-07-30 19:56:18.953748'),(185,'content_type_gating','0004_auto_20181128_1521','2021-07-30 19:56:19.102474'),(186,'content_type_gating','0005_auto_20190306_1547','2021-07-30 19:56:20.018916'),(187,'content_type_gating','0006_auto_20190308_1447','2021-07-30 19:56:20.201436'),(188,'content_type_gating','0007_auto_20190311_1919','2021-07-30 19:56:20.971989'),(189,'content_type_gating','0008_auto_20190313_1634','2021-07-30 19:56:21.085507'),(190,'contentserver','0001_initial','2021-07-30 19:56:21.226829'),(191,'contentserver','0002_cdnuseragentsconfig','2021-07-30 19:56:21.390927'),(192,'cornerstone','0001_initial','2021-07-30 19:56:22.075312'),(193,'cornerstone','0002_cornerstoneglobalconfiguration_subject_mapping','2021-07-30 19:56:22.347343'),(194,'cornerstone','0003_auto_20190621_1000','2021-07-30 19:56:23.095768'),(195,'cornerstone','0004_cornerstoneglobalconfiguration_languages','2021-07-30 19:56:23.215290'),(196,'cornerstone','0005_auto_20190925_0730','2021-07-30 19:56:23.405949'),(197,'cornerstone','0006_auto_20191001_0742','2021-07-30 19:56:23.594937'),(198,'cornerstone','0007_auto_20210708_1446','2021-07-30 19:56:23.738750'),(199,'cors_csrf','0001_initial','2021-07-30 19:56:23.878963'),(200,'course_action_state','0001_initial','2021-07-30 19:56:24.147518'),(201,'course_overviews','0015_historicalcourseoverview','2021-07-30 19:56:24.392208'),(202,'course_overviews','0016_simulatecoursepublishconfig','2021-07-30 19:56:24.567555'),(203,'course_overviews','0017_auto_20191002_0823','2021-07-30 19:56:24.694610'),(204,'course_overviews','0018_add_start_end_in_CourseOverview','2021-07-30 19:56:25.324625'),(205,'course_overviews','0019_improve_courseoverviewtab','2021-07-30 19:56:25.654007'),(206,'course_date_signals','0001_initial','2021-07-30 19:56:26.040271'),(207,'course_duration_limits','0001_initial','2021-07-30 19:56:26.316425'),(208,'course_duration_limits','0002_auto_20181119_0959','2021-07-30 19:56:26.517217'),(209,'course_duration_limits','0003_auto_20181128_1407','2021-07-30 19:56:26.659424'),(210,'course_duration_limits','0004_auto_20181128_1521','2021-07-30 19:56:26.775379'),(211,'course_duration_limits','0005_auto_20190306_1546','2021-07-30 19:56:26.890820'),(212,'course_duration_limits','0006_auto_20190308_1447','2021-07-30 19:56:27.023982'),(213,'course_duration_limits','0007_auto_20190311_1919','2021-07-30 19:56:28.059197'),(214,'course_duration_limits','0008_auto_20190313_1634','2021-07-30 19:56:28.186312'),(215,'course_goals','0001_initial','2021-07-30 19:56:28.446406'),(216,'course_goals','0002_auto_20171010_1129','2021-07-30 19:56:28.584893'),(217,'course_goals','0003_historicalcoursegoal','2021-07-30 19:56:28.735440'),(218,'course_groups','0002_change_inline_default_cohort_value','2021-07-30 19:56:28.803399'),(219,'course_groups','0003_auto_20170609_1455','2021-07-30 19:56:28.980131'),(220,'course_overviews','0020_courseoverviewtab_url_slug','2021-07-30 19:56:29.060414'),(221,'course_overviews','0021_courseoverviewtab_link','2021-07-30 19:56:29.104729'),(222,'course_overviews','0022_courseoverviewtab_is_hidden','2021-07-30 19:56:29.152359'),(223,'course_overviews','0023_courseoverview_banner_image_url','2021-07-30 19:56:29.239511'),(224,'course_overviews','0024_overview_adds_has_highlights','2021-07-30 19:56:29.328424'),(225,'course_home_api','0001_initial','2021-07-30 19:56:29.724881'),(226,'course_modes','0008_course_key_field_to_foreign_key','2021-07-30 19:56:30.009553'),(227,'course_modes','0009_suggested_prices_to_charfield','2021-07-30 19:56:30.035892'),(228,'course_modes','0010_archived_suggested_prices_to_charfield','2021-07-30 19:56:30.054849'),(229,'course_modes','0011_change_regex_for_comma_separated_ints','2021-07-30 19:56:30.092439'),(230,'course_modes','0012_historicalcoursemode','2021-07-30 19:56:30.252498'),(231,'course_modes','0013_auto_20200115_2022','2021-07-30 19:56:30.786576'),(232,'course_overviews','0025_auto_20210702_1602','2021-07-30 19:56:31.431274'),(233,'coursewarehistoryextended','0001_initial','2021-07-30 19:56:31.733549'),(234,'coursewarehistoryextended','0002_force_studentmodule_index','2021-07-30 19:56:31.754995'),(235,'courseware','0002_coursedynamicupgradedeadlineconfiguration_dynamicupgradedeadlineconfiguration','2021-07-30 19:56:31.846325'),(236,'courseware','0003_auto_20170825_0935','2021-07-30 19:56:31.929331'),(237,'courseware','0004_auto_20171010_1639','2021-07-30 19:56:31.958436'),(238,'courseware','0005_orgdynamicupgradedeadlineconfiguration','2021-07-30 19:56:32.026641'),(239,'courseware','0006_remove_module_id_index','2021-07-30 19:56:32.096147'),(240,'courseware','0007_remove_done_index','2021-07-30 19:56:32.132709'),(241,'courseware','0008_move_idde_to_edx_when','2021-07-30 19:56:32.312774'),(242,'courseware','0009_auto_20190703_1955','2021-07-30 19:56:32.431438'),(243,'courseware','0010_auto_20190709_1559','2021-07-30 19:56:32.548406'),(244,'courseware','0011_csm_id_bigint','2021-07-30 19:56:32.687151'),(245,'courseware','0012_adjust_fields','2021-07-30 19:56:32.850406'),(246,'courseware','0013_auto_20191001_1858','2021-07-30 19:56:33.043740'),(247,'courseware','0014_fix_nan_value_for_global_speed','2021-07-30 19:56:33.609455'),(248,'courseware','0015_add_courseware_stats_index','2021-07-30 19:56:33.701446'),(249,'crawlers','0001_initial','2021-07-30 19:56:33.826888'),(250,'crawlers','0002_auto_20170419_0018','2021-07-30 19:56:33.933763'),(251,'credentials','0001_initial','2021-07-30 19:56:34.065260'),(252,'credentials','0002_auto_20160325_0631','2021-07-30 19:56:34.165637'),(253,'credentials','0003_auto_20170525_1109','2021-07-30 19:56:34.328486'),(254,'credentials','0004_notifycredentialsconfig','2021-07-30 19:56:34.454444'),(255,'credentials','0005_remove_existing_mgmt_cmd_args','2021-07-30 19:56:34.665856'),(256,'credit','0001_initial','2021-07-30 19:56:35.221905'),(257,'credit','0002_creditconfig','2021-07-30 19:56:35.636531'),(258,'credit','0003_auto_20160511_2227','2021-07-30 19:56:35.679957'),(259,'credit','0004_delete_historical_credit_records','2021-07-30 19:56:36.684299'),(260,'credit','0005_creditrequirement_sort_value','2021-07-30 19:56:36.728277'),(261,'credit','0006_creditrequirement_alter_ordering','2021-07-30 19:56:36.748475'),(262,'credit','0007_creditrequirement_copy_values','2021-07-30 19:56:36.951587'),(263,'credit','0008_creditrequirement_remove_order','2021-07-30 19:56:36.990375'),(264,'dark_lang','0001_initial','2021-07-30 19:56:37.135243'),(265,'dark_lang','0002_data__enable_on_install','2021-07-30 19:56:37.358271'),(266,'dark_lang','0003_auto_20180425_0359','2021-07-30 19:56:37.609415'),(267,'database_fixups','0001_initial','2021-07-30 19:56:37.823555'),(268,'degreed','0001_initial','2021-07-30 19:56:38.294644'),(269,'degreed','0002_auto_20180104_0103','2021-07-30 19:56:38.664489'),(270,'degreed','0003_auto_20180109_0712','2021-07-30 19:56:38.803833'),(271,'degreed','0004_auto_20180306_1251','2021-07-30 19:56:38.954900'),(272,'degreed','0005_auto_20180807_1302','2021-07-30 19:56:40.412927'),(273,'degreed','0006_upgrade_django_simple_history','2021-07-30 19:56:40.537150'),(274,'degreed','0007_auto_20190925_0730','2021-07-30 19:56:40.735586'),(275,'degreed','0008_auto_20191001_0742','2021-07-30 19:56:40.906943'),(276,'degreed','0009_auto_20210119_1546','2021-07-30 19:56:41.716965'),(277,'degreed','0010_auto_20210708_1446','2021-07-30 19:56:41.858928'),(278,'demographics','0001_initial','2021-07-30 19:56:42.481049'),(279,'demographics','0002_clean_duplicate_entries','2021-07-30 19:56:42.733726'),(280,'demographics','0003_auto_20200827_1949','2021-07-30 19:56:42.888551'),(281,'discounts','0001_initial','2021-07-30 19:56:43.241145'),(282,'discounts','0002_auto_20191022_1720','2021-07-30 19:56:43.689939'),(283,'lti_consumer','0001_initial','2021-07-30 19:56:43.783111'),(284,'discussions','0001_initial','2021-07-30 19:56:44.060619'),(285,'discussions','0002_add_provider_filter','2021-07-30 19:56:44.484254'),(286,'discussions','0003_alter_provider_filter_list','2021-07-30 19:56:45.164877'),(287,'django_celery_results','0001_initial','2021-07-30 19:56:45.202208'),(288,'django_celery_results','0002_add_task_name_args_kwargs','2021-07-30 19:56:45.328058'),(289,'django_celery_results','0003_auto_20181106_1101','2021-07-30 19:56:45.348116'),(290,'django_celery_results','0004_auto_20190516_0412','2021-07-30 19:56:45.549857'),(291,'django_celery_results','0005_taskresult_worker','2021-07-30 19:56:45.605533'),(292,'django_celery_results','0006_taskresult_date_created','2021-07-30 19:56:45.871022'),(293,'django_celery_results','0007_remove_taskresult_hidden','2021-07-30 19:56:45.917700'),(294,'django_celery_results','0008_chordcounter','2021-07-30 19:56:45.943805'),(295,'django_comment_common','0001_initial','2021-07-30 19:56:46.240250'),(296,'django_comment_common','0002_forumsconfig','2021-07-30 19:56:46.851823'),(297,'django_comment_common','0003_enable_forums','2021-07-30 19:56:47.284627'),(298,'django_comment_common','0004_auto_20161117_1209','2021-07-30 19:56:47.384990'),(299,'django_comment_common','0005_coursediscussionsettings','2021-07-30 19:56:47.418057'),(300,'django_comment_common','0006_coursediscussionsettings_discussions_id_map','2021-07-30 19:56:47.457653'),(301,'django_comment_common','0007_discussionsidmapping','2021-07-30 19:56:47.486917'),(302,'django_comment_common','0008_role_user_index','2021-07-30 19:56:47.517907'),(303,'django_notify','0001_initial','2021-07-30 19:56:48.121953'),(304,'edx_proctoring','0001_initial','2021-07-30 19:56:50.423884'),(305,'edx_proctoring','0002_proctoredexamstudentattempt_is_status_acknowledged','2021-07-30 19:56:51.127673'),(306,'edx_proctoring','0003_auto_20160101_0525','2021-07-30 19:56:51.342369'),(307,'edx_proctoring','0004_auto_20160201_0523','2021-07-30 19:56:51.461444'),(308,'edx_proctoring','0005_proctoredexam_hide_after_due','2021-07-30 19:56:51.514637'),(309,'edx_proctoring','0006_allowed_time_limit_mins','2021-07-30 19:56:51.763004'),(310,'edx_proctoring','0007_proctoredexam_backend','2021-07-30 19:56:51.819343'),(311,'edx_proctoring','0008_auto_20181116_1551','2021-07-30 19:56:52.179973'),(312,'edx_proctoring','0009_proctoredexamreviewpolicy_remove_rules','2021-07-30 19:56:52.843198'),(313,'edx_proctoring','0010_update_backend','2021-07-30 19:56:53.069010'),(314,'edx_proctoring','0011_allow_multiple_attempts','2021-07-30 19:56:53.200957'),(315,'edx_proctoring','0012_proctoredexamstudentattempt_time_remaining_seconds','2021-07-30 19:56:53.334070'),(316,'edx_proctoring','0013_proctoredexamsoftwaresecurereview_is_active_attempt','2021-07-30 19:56:53.595934'),(317,'edx_proctoring','0014_add_is_resumable_to_proctoredexamstudentattempt','2021-07-30 19:56:53.857885'),(318,'edx_proctoring','0015_rm_proctoredexamstudentattempt_ips','2021-07-30 19:56:54.448493'),(319,'edx_proctoring','0016_nullable_proctoredexamstudentattempt_name','2021-07-30 19:56:54.714612'),(320,'edx_proctoring','0017_rm_proctoredexamstudentattempt_name','2021-07-30 19:56:54.969729'),(321,'edx_when','0001_initial','2021-07-30 19:56:55.811551'),(322,'edx_when','0002_auto_20190318_1736','2021-07-30 19:56:56.464403'),(323,'edx_when','0003_auto_20190402_1501','2021-07-30 19:56:56.996707'),(324,'edx_when','0004_datepolicy_rel_date','2021-07-30 19:56:57.036881'),(325,'edx_when','0005_auto_20190911_1056','2021-07-30 19:56:57.223577'),(326,'edx_when','0006_drop_active_index','2021-07-30 19:56:57.261023'),(327,'edx_when','0007_meta_tweaks','2021-07-30 19:56:57.282978'),(328,'edxval','0001_initial','2021-07-30 19:56:57.876700'),(329,'edxval','0002_data__default_profiles','2021-07-30 19:56:57.882340'),(330,'edxval','0003_coursevideo_is_hidden','2021-07-30 19:56:57.888173'),(331,'edxval','0004_data__add_hls_profile','2021-07-30 19:56:57.894885'),(332,'edxval','0005_videoimage','2021-07-30 19:56:57.901610'),(333,'edxval','0006_auto_20171009_0725','2021-07-30 19:56:57.907833'),(334,'edxval','0007_transcript_credentials_state','2021-07-30 19:56:57.913969'),(335,'edxval','0008_remove_subtitles','2021-07-30 19:56:57.920284'),(336,'edxval','0009_auto_20171127_0406','2021-07-30 19:56:57.926522'),(337,'edxval','0010_add_video_as_foreign_key','2021-07-30 19:56:57.933003'),(338,'edxval','0011_data__add_audio_mp3_profile','2021-07-30 19:56:57.939310'),(339,'edxval','0012_thirdpartytranscriptcredentialsstate_has_creds','2021-07-30 19:56:57.946002'),(340,'edxval','0013_thirdpartytranscriptcredentialsstate_copy_values','2021-07-30 19:56:57.951890'),(341,'edxval','0014_transcript_credentials_state_retype_exists','2021-07-30 19:56:57.957774'),(342,'edxval','0015_remove_thirdpartytranscriptcredentialsstate_exists','2021-07-30 19:56:57.963728'),(343,'edxval','0016_add_transcript_credentials_model','2021-07-30 19:56:57.969735'),(344,'edxval','0002_add_error_description_field','2021-07-30 19:56:58.214156'),(345,'edxval','0003_delete_transcriptcredentials','2021-07-30 19:56:58.264812'),(346,'email_marketing','0001_initial','2021-07-30 19:56:58.435943'),(347,'email_marketing','0002_auto_20160623_1656','2021-07-30 19:57:00.052232'),(348,'email_marketing','0003_auto_20160715_1145','2021-07-30 19:57:00.607651'),(349,'email_marketing','0004_emailmarketingconfiguration_welcome_email_send_delay','2021-07-30 19:57:00.778938'),(350,'email_marketing','0005_emailmarketingconfiguration_user_registration_cookie_timeout_delay','2021-07-30 19:57:00.908696'),(351,'email_marketing','0006_auto_20170711_0615','2021-07-30 19:57:01.018609'),(352,'email_marketing','0007_auto_20170809_0653','2021-07-30 19:57:01.356220'),(353,'email_marketing','0008_auto_20170809_0539','2021-07-30 19:57:01.592846'),(354,'email_marketing','0009_remove_emailmarketingconfiguration_sailthru_activation_template','2021-07-30 19:57:01.719723'),(355,'email_marketing','0010_auto_20180425_0800','2021-07-30 19:57:01.977300'),(356,'email_marketing','0011_delete_emailmarketingconfiguration','2021-07-30 19:57:01.998480'),(357,'embargo','0001_initial','2021-07-30 19:57:02.966392'),(358,'embargo','0002_data__add_countries','2021-07-30 19:57:03.831660'),(359,'enterprise','0114_auto_20201020_0142','2021-07-30 19:57:04.055320'),(360,'enterprise','0115_enterpriseanalyticsuser_historicalenterpriseanalyticsuser','2021-07-30 19:57:04.409163'),(361,'enterprise','0116_auto_20201116_0400','2021-07-30 19:57:04.537534'),(362,'enterprise','0116_auto_20201208_1759','2021-07-30 19:57:04.759018'),(363,'enterprise','0117_auto_20201215_0258','2021-07-30 19:57:04.962015'),(364,'enterprise','unique_constraints_pending_users','2021-07-30 19:57:05.528893'),(365,'enterprise','0001_auto_20210111_1253','2021-07-30 19:57:05.739572'),(366,'enterprise','0120_systemwiderole_applies_to_all_contexts','2021-07-30 19:57:06.010068'),(367,'enterprise','0121_systemwiderole_add_ent_cust_field','2021-07-30 19:57:06.713110'),(368,'enterprise','0122_remove_field_sync_enterprise_catalog_query','2021-07-30 19:57:06.948268'),(369,'enterprise','0123_enterprisecustomeridentityprovider_default_provider','2021-07-30 19:57:07.016448'),(370,'enterprise','0124_auto_20210301_1309','2021-07-30 19:57:07.187122'),(371,'enterprise','0125_add_config_for_role_assign_backfill','2021-07-30 19:57:07.354094'),(372,'enterprise','0126_auto_20210308_1522','2021-07-30 19:57:07.565139'),(373,'enterprise','0127_enterprisecatalogquery_uuid','2021-07-30 19:57:07.604901'),(374,'enterprise','0128_enterprisecatalogquery_generate_uuids','2021-07-30 19:57:07.862938'),(375,'enterprise','0129_enterprisecatalogquery_uuid_unique','2021-07-30 19:57:07.915049'),(376,'enterprise','0130_lms_customer_lp_search_help_text','2021-07-30 19:57:08.093952'),(377,'enterprise','0131_auto_20210517_0924','2021-07-30 19:57:08.324324'),(378,'enterprise','0132_auto_20210608_1921','2021-07-30 19:57:08.714768'),(379,'enterprise','0133_auto_20210608_1931','2021-07-30 19:57:08.950122'),(380,'enterprise','0134_enterprisecustomerreportingconfiguration_enable_compression','2021-07-30 19:57:09.019843'),(381,'enterprise','0135_adminnotification_adminnotificationfilter_adminnotificationread','2021-07-30 19:57:09.254820'),(382,'enterprise','0136_auto_20210629_2129','2021-07-30 19:57:10.317618'),(383,'enterprise','0137_enrollment_email_update','2021-07-30 19:57:10.684639'),(384,'experiments','0001_initial','2021-07-30 19:57:11.094172'),(385,'student','0001_squashed_0031_auto_20200317_1122','2021-07-30 19:57:18.570600'),(386,'entitlements','0001_initial','2021-07-30 19:57:19.726125'),(387,'entitlements','0002_auto_20171102_0719','2021-07-30 19:57:20.179015'),(388,'entitlements','0003_auto_20171205_1431','2021-07-30 19:57:21.247493'),(389,'entitlements','0004_auto_20171206_1729','2021-07-30 19:57:21.425025'),(390,'entitlements','0005_courseentitlementsupportdetail','2021-07-30 19:57:21.588178'),(391,'entitlements','0006_courseentitlementsupportdetail_action','2021-07-30 19:57:21.784867'),(392,'entitlements','0007_change_expiration_period_default','2021-07-30 19:57:21.842556'),(393,'entitlements','0008_auto_20180328_1107','2021-07-30 19:57:22.088356'),(394,'entitlements','0009_courseentitlement_refund_locked','2021-07-30 19:57:22.209812'),(395,'entitlements','0010_backfill_refund_lock','2021-07-30 19:57:22.510421'),(396,'entitlements','0011_historicalcourseentitlement','2021-07-30 19:57:22.664260'),(397,'entitlements','0012_allow_blank_order_number_values','2021-07-30 19:57:22.935294'),(398,'entitlements','0013_historicalcourseentitlementsupportdetail','2021-07-30 19:57:23.076412'),(399,'entitlements','0014_auto_20200115_2022','2021-07-30 19:57:23.247026'),(400,'entitlements','0015_add_unique_together_constraint','2021-07-30 19:57:23.529403'),(401,'event_routing_backends','0001_initial','2021-07-30 19:57:23.666385'),(402,'event_routing_backends','0002_auto_20210503_0648','2021-07-30 19:57:23.896143'),(403,'experiments','0002_auto_20170627_1402','2021-07-30 19:57:23.952819'),(404,'experiments','0003_auto_20170713_1148','2021-07-30 19:57:23.981699'),(405,'experiments','0004_historicalexperimentkeyvalue','2021-07-30 19:57:24.125290'),(406,'external_user_ids','0001_initial','2021-07-30 19:57:25.300963'),(407,'external_user_ids','0002_mb_coaching_20200210_1754','2021-07-30 19:57:25.726649'),(408,'external_user_ids','0003_auto_20200224_1836','2021-07-30 19:57:25.835543'),(409,'external_user_ids','0004_add_lti_type','2021-07-30 19:57:26.172198'),(410,'grades','0001_initial','2021-07-30 19:57:26.293546'),(411,'grades','0002_rename_last_edited_field','2021-07-30 19:57:26.351074'),(412,'grades','0003_coursepersistentgradesflag_persistentgradesenabledflag','2021-07-30 19:57:26.627551'),(413,'grades','0004_visibleblocks_course_id','2021-07-30 19:57:26.712581'),(414,'grades','0005_multiple_course_flags','2021-07-30 19:57:26.830354'),(415,'grades','0006_persistent_course_grades','2021-07-30 19:57:26.890061'),(416,'grades','0007_add_passed_timestamp_column','2021-07-30 19:57:26.960393'),(417,'grades','0008_persistentsubsectiongrade_first_attempted','2021-07-30 19:57:27.004060'),(418,'grades','0009_auto_20170111_1507','2021-07-30 19:57:27.062277'),(419,'grades','0010_auto_20170112_1156','2021-07-30 19:57:27.095322'),(420,'grades','0011_null_edited_time','2021-07-30 19:57:27.196595'),(421,'grades','0012_computegradessetting','2021-07-30 19:57:27.341679'),(422,'grades','0013_persistentsubsectiongradeoverride','2021-07-30 19:57:27.403102'),(423,'grades','0014_persistentsubsectiongradeoverridehistory','2021-07-30 19:57:27.582381'),(424,'grades','0015_historicalpersistentsubsectiongradeoverride','2021-07-30 19:57:27.761501'),(425,'grades','0016_auto_20190703_1446','2021-07-30 19:57:28.120669'),(426,'grades','0017_delete_manual_psgoverride_table','2021-07-30 19:57:28.302177'),(427,'grades','0018_add_waffle_flag_defaults','2021-07-30 19:57:28.628125'),(428,'instructor_task','0002_gradereportsetting','2021-07-30 19:57:28.779789'),(429,'instructor_task','0003_alter_task_input_field','2021-07-30 19:57:28.929398'),(430,'integrated_channel','0001_squashed_0007_auto_20190925_0730','2021-07-30 19:57:29.655999'),(431,'integrated_channel','0002_learnerdatatransmissionaudit_subsection_id','2021-07-30 19:57:29.730235'),(432,'learning_sequences','0001_initial','2021-07-30 19:57:30.224943'),(433,'learning_sequences','0002_coursesectionsequence_inaccessible_after_due','2021-07-30 19:57:30.363559'),(434,'learning_sequences','0003_create_course_context_for_course_specific_models','2021-07-30 19:57:30.699245'),(435,'learning_sequences','0004_coursecontext_self_paced','2021-07-30 19:57:30.796398'),(436,'learning_sequences','0005_coursecontext_days_early_for_beta','2021-07-30 19:57:30.840461'),(437,'learning_sequences','0006_coursecontext_entrance_exam_id','2021-07-30 19:57:30.882460'),(438,'learning_sequences','0007_coursesequenceexam','2021-07-30 19:57:30.927317'),(439,'learning_sequences','0008_add_learning_context_title_index','2021-07-30 19:57:30.984125'),(440,'learning_sequences','0009_contenterror_publishreport','2021-07-30 19:57:31.060935'),(441,'learning_sequences','0010_add_publishreport_indexes','2021-07-30 19:57:31.193910'),(442,'learning_sequences','0011_course_meta_names','2021-07-30 19:57:31.244986'),(443,'learning_sequences','0012_add_user_partition_group','2021-07-30 19:57:31.377508'),(444,'learning_sequences','0013_through_model_for_user_partition_groups_1','2021-07-30 19:57:31.600285'),(445,'learning_sequences','0014_remove_user_partition_group_duplicates','2021-07-30 19:57:32.026062'),(446,'learning_sequences','0015_add_user_partition_group_unique_constraint','2021-07-30 19:57:32.068953'),(447,'learning_sequences','0016_through_model_for_user_partition_groups_2','2021-07-30 19:57:32.136978'),(448,'lms_xblock','0001_initial','2021-07-30 19:57:32.293704'),(449,'lti_consumer','0002_ltiagslineitem','2021-07-30 19:57:32.563497'),(450,'lti_consumer','0003_ltiagsscore','2021-07-30 19:57:32.791563'),(451,'lti_consumer','0004_keyset_mgmt_to_model','2021-07-30 19:57:32.986537'),(452,'lti_consumer','0005_migrate_keyset_to_model','2021-07-30 19:57:33.324059'),(453,'lti_consumer','0006_add_on_model_config_for_lti_1p1','2021-07-30 19:57:33.933284'),(454,'lti_consumer','0007_ltidlcontentitem','2021-07-30 19:57:34.132679'),(455,'lti_consumer','0008_fix_uuid_backfill','2021-07-30 19:57:35.081961'),(456,'lti_consumer','0009_backfill-empty-string-config-id','2021-07-30 19:57:35.424311'),(457,'lti_consumer','0010_backfill-empty-string-lti-config','2021-07-30 19:57:35.747028'),(458,'lti_consumer','0011_courseeditltifieldsenabledflag','2021-07-30 19:57:35.953550'),(459,'lti_consumer','0012_rename_courseeditltifieldsenabledflag_model','2021-07-30 19:57:36.469859'),(460,'milestones','0001_initial','2021-07-30 19:57:36.936045'),(461,'milestones','0002_data__seed_relationship_types','2021-07-30 19:57:37.485340'),(462,'milestones','0003_coursecontentmilestone_requirements','2021-07-30 19:57:37.538232'),(463,'milestones','0004_auto_20151221_1445','2021-07-30 19:57:37.668105'),(464,'mobile_api','0001_initial','2021-07-30 19:57:37.862281'),(465,'mobile_api','0002_auto_20160406_0904','2021-07-30 19:57:37.940287'),(466,'mobile_api','0003_ignore_mobile_available_flag','2021-07-30 19:57:38.830644'),(467,'moodle','0001_initial','2021-07-30 19:57:39.329003'),(468,'moodle','0002_moodlelearnerdatatransmissionaudit','2021-07-30 19:57:39.432753'),(469,'moodle','0003_auto_20201006_1706','2021-07-30 19:57:39.658796'),(470,'moodle','0004_auto_20201105_1921','2021-07-30 19:57:39.882652'),(471,'moodle','0005_auto_20210708_1446','2021-07-30 19:57:40.105155'),(472,'oauth2_provider','0001_initial','2021-07-30 19:57:41.141592'),(473,'oauth2_provider','0002_auto_20190406_1805','2021-07-30 19:57:41.697859'),(474,'oauth_dispatch','0001_initial','2021-07-30 19:57:41.903878'),(475,'oauth_dispatch','0002_scopedapplication_scopedapplicationorganization','2021-07-30 19:57:42.901773'),(476,'oauth_dispatch','0003_application_data','2021-07-30 19:57:43.307224'),(477,'oauth_dispatch','0004_auto_20180626_1349','2021-07-30 19:57:44.233547'),(478,'oauth_dispatch','0005_applicationaccess_type','2021-07-30 19:57:44.373500'),(479,'oauth_dispatch','0006_drop_application_id_constraints','2021-07-30 19:57:44.516032'),(480,'oauth_dispatch','0007_restore_application_id_constraints','2021-07-30 19:57:44.707458'),(481,'oauth_dispatch','0008_applicationaccess_filters','2021-07-30 19:57:44.764036'),(482,'oauth_dispatch','0009_delete_enable_scopes_waffle_switch','2021-07-30 19:57:45.116194'),(483,'oauth_dispatch','0010_noop_migration_to_test_rollback','2021-07-30 19:57:45.135571'),(484,'oauth_dispatch','0011_noop_migration_to_test_rollback','2021-07-30 19:57:45.154763'),(485,'oauth_dispatch','0012_noop_migration_to_test_rollback','2021-07-30 19:57:45.173215'),(486,'organizations','0002_unique_short_name','2021-07-30 19:57:45.249391'),(487,'organizations','0003_historicalorganizationcourse','2021-07-30 19:57:45.309966'),(488,'program_enrollments','0001_initial','2021-07-30 19:57:45.469249'),(489,'program_enrollments','0002_historicalprogramcourseenrollment_programcourseenrollment','2021-07-30 19:57:46.018768'),(490,'program_enrollments','0003_auto_20190424_1622','2021-07-30 19:57:46.888837'),(491,'program_enrollments','0004_add_programcourseenrollment_relatedname','2021-07-30 19:57:47.125174'),(492,'program_enrollments','0005_canceled_not_withdrawn','2021-07-30 19:57:47.434320'),(493,'program_enrollments','0006_add_the_correct_constraints','2021-07-30 19:57:47.626167'),(494,'program_enrollments','0007_waiting_programcourseenrollment_constraint','2021-07-30 19:57:47.674765'),(495,'program_enrollments','0008_add_ended_programenrollment_status','2021-07-30 19:57:47.747359'),(496,'program_enrollments','0009_update_course_enrollment_field_to_foreign_key','2021-07-30 19:57:47.853646'),(497,'program_enrollments','0010_add_courseaccessroleassignment','2021-07-30 19:57:47.964405'),(498,'programs','0001_initial','2021-07-30 19:57:48.062361'),(499,'programs','0002_programsapiconfig_cache_ttl','2021-07-30 19:57:48.155571'),(500,'programs','0003_auto_20151120_1613','2021-07-30 19:57:48.417353'),(501,'programs','0004_programsapiconfig_enable_certification','2021-07-30 19:57:48.488587'),(502,'programs','0005_programsapiconfig_max_retries','2021-07-30 19:57:48.560412'),(503,'programs','0006_programsapiconfig_xseries_ad_enabled','2021-07-30 19:57:48.632794'),(504,'programs','0007_programsapiconfig_program_listing_enabled','2021-07-30 19:57:48.702408'),(505,'programs','0008_programsapiconfig_program_details_enabled','2021-07-30 19:57:48.774490'),(506,'programs','0009_programsapiconfig_marketing_path','2021-07-30 19:57:48.846863'),(507,'programs','0010_auto_20170204_2332','2021-07-30 19:57:48.937732'),(508,'programs','0011_auto_20170301_1844','2021-07-30 19:57:49.731208'),(509,'programs','0012_auto_20170419_0018','2021-07-30 19:57:49.779288'),(510,'programs','0013_customprogramsconfig','2021-07-30 19:57:49.849568'),(511,'programs','0014_delete_customprogramsconfig','2021-07-30 19:57:49.900923'),(512,'redirects','0001_initial','2021-07-30 19:57:50.128659'),(513,'rss_proxy','0001_initial','2021-07-30 19:57:50.214719'),(514,'sap_success_factors','0001_squashed_0022_auto_20200206_1046','2021-07-30 19:57:51.270234'),(515,'sap_success_factors','0002_sapsuccessfactorslearnerdatatransmissionaudit_credit_hours','2021-07-30 19:57:51.383595'),(516,'sap_success_factors','0003_auto_20210701_1556','2021-07-30 19:57:51.446560'),(517,'sap_success_factors','0004_auto_20210708_1639','2021-07-30 19:57:51.510385'),(518,'sap_success_factors','0005_sapsuccessfactorsenterprisecustomerconfiguration_prevent_learner_self_submit_grades','2021-07-30 19:57:51.595396'),(519,'schedules','0001_initial','2021-07-30 19:57:51.822761'),(520,'schedules','0002_auto_20170816_1532','2021-07-30 19:57:51.937154'),(521,'schedules','0003_scheduleconfig','2021-07-30 19:57:52.173653'),(522,'schedules','0004_auto_20170922_1428','2021-07-30 19:57:52.610970'),(523,'schedules','0005_auto_20171010_1722','2021-07-30 19:57:52.988739'),(524,'schedules','0006_scheduleexperience','2021-07-30 19:57:53.215043'),(525,'schedules','0007_scheduleconfig_hold_back_ratio','2021-07-30 19:57:53.427586'),(526,'schedules','0008_add_new_start_date_field','2021-07-30 19:57:53.492611'),(527,'schedules','0009_schedule_copy_column_values','2021-07-30 19:57:53.844583'),(528,'schedules','0010_remove_null_blank_from_schedules_date','2021-07-30 19:57:53.909573'),(529,'schedules','0011_auto_20200228_2018','2021-07-30 19:57:53.971812'),(530,'schedules','0012_auto_20200302_1914','2021-07-30 19:57:54.037264'),(531,'schedules','0013_historicalschedule','2021-07-30 19:57:54.110821'),(532,'schedules','0014_historicalschedule_drop_fk','2021-07-30 19:57:54.255654'),(533,'schedules','0015_schedules_start_nullable','2021-07-30 19:57:54.399485'),(534,'schedules','0016_remove_start_from_schedules','2021-07-30 19:57:54.456600'),(535,'schedules','0017_remove_start_from_historicalschedule','2021-07-30 19:57:54.527791'),(536,'schedules','0018_readd_historicalschedule_fks','2021-07-30 19:57:54.661685'),(537,'schedules','0019_auto_20200316_1935','2021-07-30 19:57:54.863453'),(538,'schedules','0020_remove_config_rollout_fields','2021-07-30 19:57:55.071629'),(539,'self_paced','0001_initial','2021-07-30 19:57:55.171546'),(540,'sessions','0001_initial','2021-07-30 19:57:55.244858'),(541,'site_configuration','0001_initial','2021-07-30 19:57:56.170663'),(542,'site_configuration','0002_auto_20160720_0231','2021-07-30 19:57:56.441256'),(543,'site_configuration','0003_auto_20200217_1058','2021-07-30 19:57:56.569575'),(544,'site_configuration','0004_add_site_values_field','2021-07-30 19:57:56.727920'),(545,'site_configuration','0005_populate_siteconfig_history_site_values','2021-07-30 19:57:56.753489'),(546,'site_configuration','0006_copy_values_to_site_values','2021-07-30 19:57:57.129360'),(547,'site_configuration','0007_remove_values_field','2021-07-30 19:57:57.285724'),(548,'default','0001_initial','2021-07-30 19:57:57.609244'),(549,'social_auth','0001_initial','2021-07-30 19:57:57.617468'),(550,'default','0002_add_related_name','2021-07-30 19:57:57.766172'),(551,'social_auth','0002_add_related_name','2021-07-30 19:57:57.774657'),(552,'default','0003_alter_email_max_length','2021-07-30 19:57:57.829366'),(553,'social_auth','0003_alter_email_max_length','2021-07-30 19:57:57.837597'),(554,'default','0004_auto_20160423_0400','2021-07-30 19:57:57.910598'),(555,'social_auth','0004_auto_20160423_0400','2021-07-30 19:57:57.919568'),(556,'social_auth','0005_auto_20160727_2333','2021-07-30 19:57:57.956143'),(557,'social_django','0006_partial','2021-07-30 19:57:57.991874'),(558,'social_django','0007_code_timestamp','2021-07-30 19:57:58.060331'),(559,'social_django','0008_partial_timestamp','2021-07-30 19:57:58.116745'),(560,'social_django','0009_auto_20191118_0520','2021-07-30 19:57:58.299675'),(561,'social_django','0010_uid_db_index','2021-07-30 19:57:58.385145'),(562,'splash','0001_initial','2021-07-30 19:57:58.499507'),(563,'static_replace','0001_initial','2021-07-30 19:57:58.625821'),(564,'static_replace','0002_assetexcludedextensionsconfig','2021-07-30 19:57:58.753633'),(565,'status','0001_initial','2021-07-30 19:57:59.020178'),(566,'status','0002_update_help_text','2021-07-30 19:57:59.150962'),(567,'student','0032_removed_logout_view_configuration','2021-07-30 19:57:59.338649'),(568,'student','0033_userprofile_state','2021-07-30 19:57:59.473091'),(569,'student','0034_courseenrollmentcelebration','2021-07-30 19:57:59.631582'),(570,'student','0035_bulkchangeenrollmentconfiguration','2021-07-30 19:57:59.807753'),(571,'student','0036_userpasswordtogglehistory','2021-07-30 19:57:59.988870'),(572,'student','0037_linkedinaddtoprofileconfiguration_updates','2021-07-30 19:58:00.394572'),(573,'student','0038_auto_20201021_1256','2021-07-30 19:58:00.512839'),(574,'student','0039_anon_id_context','2021-07-30 19:58:00.630520'),(575,'student','0040_usercelebration','2021-07-30 19:58:01.445297'),(576,'student','0041_registration_activation_timestamp','2021-07-30 19:58:01.598516'),(577,'student','0042_allow_certificate_null_20210427_1519','2021-07-30 19:58:01.739167'),(578,'student','0043_remove_userprofile_allow_certificate','2021-07-30 19:58:01.881705'),(579,'submissions','0001_initial','2021-07-30 19:58:02.466444'),(580,'submissions','0002_auto_20151119_0913','2021-07-30 19:58:02.474676'),(581,'submissions','0003_submission_status','2021-07-30 19:58:02.483856'),(582,'submissions','0004_remove_django_extensions','2021-07-30 19:58:02.492661'),(583,'submissions','0005_CreateTeamModel','2021-07-30 19:58:02.501220'),(584,'super_csv','0001_initial','2021-07-30 19:58:02.842576'),(585,'super_csv','0002_csvoperation_user','2021-07-30 19:58:03.031646'),(586,'super_csv','0003_csvoperation_original_filename','2021-07-30 19:58:03.210826'),(587,'survey','0001_initial','2021-07-30 19:58:03.485605'),(588,'system_wide_roles','0001_SystemWideRole_SystemWideRoleAssignment','2021-07-30 19:58:03.742487'),(589,'system_wide_roles','0002_add_system_wide_student_support_role','2021-07-30 19:58:04.184051'),(590,'system_wide_roles','0003_systemwideroleassignment_applies_to_all_contexts','2021-07-30 19:58:04.324215'),(591,'teams','0001_initial','2021-07-30 19:58:04.834675'),(592,'teams','0002_slug_field_ids','2021-07-30 19:58:05.169722'),(593,'teams','0003_courseteam_organization_protected','2021-07-30 19:58:05.328640'),(594,'teams','0004_alter_defaults','2021-07-30 19:58:06.479378'),(595,'theming','0001_initial','2021-07-30 19:58:06.661187'),(596,'third_party_auth','0001_squashed_0026_auto_20200401_1932','2021-07-30 19:58:07.561687'),(597,'third_party_auth','0002_samlproviderconfig_country','2021-07-30 19:58:08.109920'),(598,'third_party_auth','0002_auto_20200721_1650','2021-07-30 19:58:08.788504'),(599,'third_party_auth','0003_samlconfiguration_is_public','2021-07-30 19:58:08.944133'),(600,'third_party_auth','0004_auto_20200919_0955','2021-07-30 19:58:09.609018'),(601,'third_party_auth','0005_auto_20210723_1527','2021-07-30 19:58:10.209762'),(602,'thumbnail','0001_initial','2021-07-30 19:58:10.247340'),(603,'track','0001_initial','2021-07-30 19:58:11.018069'),(604,'track','0002_delete_trackinglog','2021-07-30 19:58:11.046989'),(605,'user_api','0003_userretirementrequest','2021-07-30 19:58:11.249960'),(606,'user_api','0004_userretirementpartnerreportingstatus','2021-07-30 19:58:11.497469'),(607,'user_authn','0001_data__add_login_service','2021-07-30 19:58:11.954001'),(608,'util','0001_initial','2021-07-30 19:58:12.165065'),(609,'util','0002_data__default_rate_limit_config','2021-07-30 19:58:12.594640'),(610,'verified_track_content','0001_initial','2021-07-30 19:58:12.640385'),(611,'verified_track_content','0002_verifiedtrackcohortedcourse_verified_cohort_name','2021-07-30 19:58:12.709358'),(612,'verified_track_content','0003_migrateverifiedtrackcohortssetting','2021-07-30 19:58:12.948688'),(613,'verify_student','0001_initial','2021-07-30 19:58:15.520123'),(614,'verify_student','0002_auto_20151124_1024','2021-07-30 19:58:16.018756'),(615,'verify_student','0003_auto_20151113_1443','2021-07-30 19:58:16.094184'),(616,'verify_student','0004_delete_historical_records','2021-07-30 19:58:16.189193'),(617,'verify_student','0005_remove_deprecated_models','2021-07-30 19:58:17.897308'),(618,'verify_student','0006_ssoverification','2021-07-30 19:58:18.059378'),(619,'verify_student','0007_idverificationaggregate','2021-07-30 19:58:18.273604'),(620,'verify_student','0008_populate_idverificationaggregate','2021-07-30 19:58:18.755398'),(621,'verify_student','0009_remove_id_verification_aggregate','2021-07-30 19:58:19.117619'),(622,'verify_student','0010_manualverification','2021-07-30 19:58:19.281738'),(623,'verify_student','0011_add_fields_to_sspv','2021-07-30 19:58:19.599591'),(624,'verify_student','0012_sspverificationretryconfig','2021-07-30 19:58:20.502602'),(625,'verify_student','0013_add_expiration_date_field','2021-07-30 19:58:20.919485'),(626,'verify_student','0014_remove_softwaresecurephotoverification_expiry_date','2021-07-30 19:58:21.084835'),(627,'video_config','0001_initial','2021-07-30 19:58:21.409370'),(628,'video_config','0002_coursevideotranscriptenabledflag_videotranscriptenabledflag','2021-07-30 19:58:21.846613'),(629,'video_config','0003_transcriptmigrationsetting','2021-07-30 19:58:22.083156'),(630,'video_config','0004_transcriptmigrationsetting_command_run','2021-07-30 19:58:22.252415'),(631,'video_config','0005_auto_20180719_0752','2021-07-30 19:58:22.436669'),(632,'video_config','0006_videothumbnailetting_updatedcoursevideos','2021-07-30 19:58:22.697789'),(633,'video_config','0007_videothumbnailsetting_offset','2021-07-30 19:58:22.883708'),(634,'video_config','0008_courseyoutubeblockedflag','2021-07-30 19:58:23.066293'),(635,'video_pipeline','0001_initial','2021-07-30 19:58:23.286085'),(636,'video_pipeline','0002_auto_20171114_0704','2021-07-30 19:58:23.577827'),(637,'video_pipeline','0003_coursevideouploadsenabledbydefault_videouploadsenabledbydefault','2021-07-30 19:58:23.933296'),(638,'video_pipeline','0004_vempipelineintegration','2021-07-30 19:58:24.183152'),(639,'video_pipeline','0005_add_vem_course_percentage','2021-07-30 19:58:24.363388'),(640,'video_pipeline','0006_remove_vempipelineintegration_vem_enabled_courses_percentage','2021-07-30 19:58:24.513769'),(641,'video_pipeline','0007_delete_videopipelineintegration','2021-07-30 19:58:24.550693'),(642,'waffle','0002_auto_20161201_0958','2021-07-30 19:58:24.592103'),(643,'waffle','0003_update_strings_for_i18n','2021-07-30 19:58:27.461980'),(644,'waffle','0004_update_everyone_nullbooleanfield','2021-07-30 19:58:27.575030'),(645,'waffle_utils','0001_initial','2021-07-30 19:58:27.739458'),(646,'waffle_utils','0002_waffleflagcourseoverridemodel_note','2021-07-30 19:58:27.904855'),(647,'wiki','0001_initial','2021-07-30 19:58:33.668765'),(648,'wiki','0002_remove_article_subscription','2021-07-30 19:58:34.432312'),(649,'wiki','0003_ip_address_conv','2021-07-30 19:58:34.905126'),(650,'wiki','0004_increase_slug_size','2021-07-30 19:58:35.034352'),(651,'wiki','0005_remove_attachments_and_images','2021-07-30 19:58:36.078597'),(652,'wiki','0006_auto_20200110_1003','2021-07-30 19:58:36.358441'),(653,'workflow','0001_initial','2021-07-30 19:58:36.492877'),(654,'workflow','0002_remove_django_extensions','2021-07-30 19:58:36.617490'),(655,'workflow','0003_TeamWorkflows','2021-07-30 19:58:36.668301'),(656,'workflow','0004_assessmentworkflowstep_skipped','2021-07-30 19:58:36.745038'),(657,'xapi','0001_initial','2021-07-30 19:58:36.887343'),(658,'xapi','0002_auto_20180726_0142','2021-07-30 19:58:37.038689'),(659,'xapi','0003_auto_20190807_1006','2021-07-30 19:58:37.269555'),(660,'xapi','0004_auto_20190830_0710','2021-07-30 19:58:37.423528'),(661,'xblock_django','0001_initial','2021-07-30 19:58:37.556027'),(662,'xblock_django','0002_auto_20160204_0809','2021-07-30 19:58:37.690761'),(663,'xblock_django','0003_add_new_config_models','2021-07-30 19:58:38.080081'),(664,'xblock_django','0004_delete_xblock_disable_config','2021-07-30 19:58:38.326497'),(665,'social_django','0004_auto_20160423_0400','2021-07-30 19:58:38.344066'),(666,'social_django','0003_alter_email_max_length','2021-07-30 19:58:38.352967'),(667,'social_django','0002_add_related_name','2021-07-30 19:58:38.362416'),(668,'social_django','0005_auto_20160727_2333','2021-07-30 19:58:38.371828'),(669,'social_django','0001_initial','2021-07-30 19:58:38.380659'),(670,'submissions','0001_squashed_0005_CreateTeamModel','2021-07-30 19:58:38.389282'),(671,'edxval','0001_squashed_0016_add_transcript_credentials_model','2021-07-30 19:58:38.398405'),(672,'organizations','0001_squashed_0007_historicalorganization','2021-07-30 19:58:38.406972'),(673,'contentstore','0001_initial','2021-07-30 20:01:10.193536'),(674,'contentstore','0002_add_assets_page_flag','2021-07-30 20:01:10.870030'),(675,'contentstore','0003_remove_assets_page_flag','2021-07-30 20:01:11.608359'),(676,'contentstore','0004_remove_push_notification_configmodel_table','2021-07-30 20:01:12.198424'),(677,'contentstore','0005_add_enable_checklists_quality_waffle_flag','2021-07-30 20:01:12.227379'),(678,'contentstore','0006_courseoutlineregenerate','2021-07-30 20:01:12.250146'),(679,'course_creators','0001_initial','2021-07-30 20:01:12.553479'),(680,'tagging','0001_initial','2021-07-30 20:01:12.686397'),(681,'tagging','0002_auto_20170116_1541','2021-07-30 20:01:12.762608'),(682,'user_tasks','0001_initial','2021-07-30 20:01:13.420337'),(683,'user_tasks','0002_artifact_file_storage','2021-07-30 20:01:13.539378'),(684,'user_tasks','0003_url_max_length','2021-07-30 20:01:13.579594'),(685,'user_tasks','0004_url_textfield','2021-07-30 20:01:13.641414'),(686,'xblock_config','0001_initial','2021-07-30 20:01:13.830114'),(687,'xblock_config','0002_courseeditltifieldsenabledflag','2021-07-30 20:01:13.840356'),(688,'xblock_config','0003_move_course_edit_lti_fields_enabled_flag_model_to_lti_consumer','2021-07-30 20:01:13.850428'),(689,'xblock_config','0001_squashed_0003_move_course_edit_lti_fields_enabled_flag_model_to_lti_consumer','2021-07-30 20:01:13.894650');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_redirect`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_redirect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `old_path` varchar(200) NOT NULL,
  `new_path` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_redirect_site_id_old_path_ac5dd16b_uniq` (`site_id`,`old_path`),
  KEY `django_redirect_old_path_c6cc94d3` (`old_path`),
  CONSTRAINT `django_redirect_site_id_c3e37341_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_redirect`
--

LOCK TABLES `django_redirect` WRITE;
/*!40000 ALTER TABLE `django_redirect` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_redirect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
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
-- Table structure for table `edx_when_contentdate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edx_when_contentdate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `policy_id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `field` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `edx_when_contentdate_policy_id_location_field_a26790ec_uniq` (`policy_id`,`location`,`field`),
  KEY `edx_when_contentdate_course_id_e6c39fdc` (`course_id`),
  KEY `edx_when_contentdate_location_485206ea` (`location`),
  KEY `edx_when_contentdate_policy_id_af2bcaf4` (`policy_id`),
  CONSTRAINT `edx_when_contentdate_policy_id_af2bcaf4_fk_edx_when_` FOREIGN KEY (`policy_id`) REFERENCES `edx_when_datepolicy` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edx_when_contentdate`
--

LOCK TABLES `edx_when_contentdate` WRITE;
/*!40000 ALTER TABLE `edx_when_contentdate` DISABLE KEYS */;
INSERT INTO `edx_when_contentdate` VALUES (1,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@course+block@course',1,1,'start'),(2,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@edx_introduction',2,1,'start'),(3,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions',3,1,'start'),(4,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@Sample_Algebraic_Problem',3,1,'start'),(5,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations',2,1,'start'),(6,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@html_07d547513285',3,1,'start'),(7,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@700x_pathways',3,1,'start'),(8,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations',3,1,'start'),(9,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@700x_editmolB',3,1,'start'),(10,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@python_grader',3,1,'start'),(11,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@free_form_simulation',3,1,'start'),(12,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@logic_gate_problem',3,1,'start'),(13,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@700x_proteinmake',3,1,'start'),(14,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@48ecb924d7fe4b66a230137626bfa93e',4,1,'start'),(15,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7',2,1,'start'),(16,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow',3,1,'start'),(17,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@chapter+block@9fca584977d04885bc911ea76a9ef29e',5,1,'start');
/*!40000 ALTER TABLE `edx_when_contentdate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edx_when_datepolicy`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edx_when_datepolicy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `abs_date` datetime(6) DEFAULT NULL,
  `rel_date` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `edx_when_datepolicy_abs_date_1a510cd3` (`abs_date`),
  KEY `edx_when_datepolicy_rel_date_836d6051` (`rel_date`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edx_when_datepolicy`
--

LOCK TABLES `edx_when_datepolicy` WRITE;
/*!40000 ALTER TABLE `edx_when_datepolicy` DISABLE KEYS */;
INSERT INTO `edx_when_datepolicy` VALUES (1,'2021-07-30 20:03:33.741576','2021-07-30 20:03:33.741576','2013-02-05 05:00:00.000000',NULL),(2,'2021-07-30 20:03:33.747629','2021-07-30 20:03:33.747629','1970-01-01 05:00:00.000000',NULL),(3,'2021-07-30 20:03:33.757359','2021-07-30 20:03:33.757359','2013-02-05 00:00:00.000000',NULL),(4,'2021-07-30 20:03:33.838258','2021-07-30 20:03:33.838258','1978-02-05 00:00:00.000000',NULL),(5,'2021-07-30 20:03:33.853049','2021-07-30 20:03:33.853049','2970-01-01 05:00:00.000000',NULL);
/*!40000 ALTER TABLE `edx_when_datepolicy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edx_when_userdate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edx_when_userdate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `abs_date` datetime(6) DEFAULT NULL,
  `rel_date` bigint(20) DEFAULT NULL,
  `reason` longtext NOT NULL,
  `actor_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `content_date_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `edx_when_userdate_user_id_46e8cc36_fk_auth_user_id` (`user_id`),
  KEY `edx_when_userdate_content_date_id_35c5e2e2_fk_edx_when_` (`content_date_id`),
  KEY `edx_when_userdate_actor_id_cbef1cdc_fk_auth_user_id` (`actor_id`),
  KEY `edx_when_userdate_rel_date_954ee5b4` (`rel_date`),
  CONSTRAINT `edx_when_userdate_actor_id_cbef1cdc_fk_auth_user_id` FOREIGN KEY (`actor_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `edx_when_userdate_content_date_id_35c5e2e2_fk_edx_when_` FOREIGN KEY (`content_date_id`) REFERENCES `edx_when_contentdate` (`id`),
  CONSTRAINT `edx_when_userdate_user_id_46e8cc36_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edx_when_userdate`
--

LOCK TABLES `edx_when_userdate` WRITE;
/*!40000 ALTER TABLE `edx_when_userdate` DISABLE KEYS */;
/*!40000 ALTER TABLE `edx_when_userdate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edxval_coursevideo`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edxval_coursevideo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `video_id` int(11) NOT NULL,
  `is_hidden` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `edxval_coursevideo_course_id_video_id_ebd82f35_uniq` (`course_id`,`video_id`),
  KEY `edxval_coursevideo_video_id_85dfcf76_fk_edxval_video_id` (`video_id`),
  CONSTRAINT `edxval_coursevideo_video_id_85dfcf76_fk_edxval_video_id` FOREIGN KEY (`video_id`) REFERENCES `edxval_video` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edxval_coursevideo`
--

LOCK TABLES `edxval_coursevideo` WRITE;
/*!40000 ALTER TABLE `edxval_coursevideo` DISABLE KEYS */;
/*!40000 ALTER TABLE `edxval_coursevideo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edxval_encodedvideo`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edxval_encodedvideo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `url` varchar(200) NOT NULL,
  `file_size` int(10) unsigned NOT NULL,
  `bitrate` int(10) unsigned NOT NULL,
  `profile_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `edxval_encodedvideo_profile_id_d9f3e086_fk_edxval_profile_id` (`profile_id`),
  KEY `edxval_encodedvideo_video_id_d8857acb_fk_edxval_video_id` (`video_id`),
  CONSTRAINT `edxval_encodedvideo_profile_id_d9f3e086_fk_edxval_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `edxval_profile` (`id`),
  CONSTRAINT `edxval_encodedvideo_video_id_d8857acb_fk_edxval_video_id` FOREIGN KEY (`video_id`) REFERENCES `edxval_video` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edxval_encodedvideo`
--

LOCK TABLES `edxval_encodedvideo` WRITE;
/*!40000 ALTER TABLE `edxval_encodedvideo` DISABLE KEYS */;
/*!40000 ALTER TABLE `edxval_encodedvideo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edxval_profile`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edxval_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_name` (`profile_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edxval_profile`
--

LOCK TABLES `edxval_profile` WRITE;
/*!40000 ALTER TABLE `edxval_profile` DISABLE KEYS */;
INSERT INTO `edxval_profile` VALUES (1,'audio_mp3'),(3,'desktop_mp4'),(4,'desktop_webm'),(2,'hls'),(5,'mobile_high'),(6,'mobile_low'),(7,'youtube');
/*!40000 ALTER TABLE `edxval_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edxval_thirdpartytranscriptcredentialsstate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edxval_thirdpartytranscriptcredentialsstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `org` varchar(32) NOT NULL,
  `provider` varchar(20) NOT NULL,
  `has_creds` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `edxval_thirdpartytranscr_org_provider_188f7ddf_uniq` (`org`,`provider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edxval_thirdpartytranscriptcredentialsstate`
--

LOCK TABLES `edxval_thirdpartytranscriptcredentialsstate` WRITE;
/*!40000 ALTER TABLE `edxval_thirdpartytranscriptcredentialsstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `edxval_thirdpartytranscriptcredentialsstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edxval_transcriptpreference`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edxval_transcriptpreference` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `provider` varchar(20) NOT NULL,
  `cielo24_fidelity` varchar(20) DEFAULT NULL,
  `cielo24_turnaround` varchar(20) DEFAULT NULL,
  `three_play_turnaround` varchar(20) DEFAULT NULL,
  `preferred_languages` longtext NOT NULL,
  `video_source_language` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edxval_transcriptpreference`
--

LOCK TABLES `edxval_transcriptpreference` WRITE;
/*!40000 ALTER TABLE `edxval_transcriptpreference` DISABLE KEYS */;
/*!40000 ALTER TABLE `edxval_transcriptpreference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edxval_video`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edxval_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `edx_video_id` varchar(100) NOT NULL,
  `client_video_id` varchar(255) NOT NULL,
  `duration` double NOT NULL,
  `status` varchar(255) NOT NULL,
  `error_description` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `edx_video_id` (`edx_video_id`),
  KEY `edxval_video_client_video_id_2b668312` (`client_video_id`),
  KEY `edxval_video_status_5f33a104` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edxval_video`
--

LOCK TABLES `edxval_video` WRITE;
/*!40000 ALTER TABLE `edxval_video` DISABLE KEYS */;
INSERT INTO `edxval_video` VALUES (1,'2021-07-30 20:03:23.013599','0097780c-8149-4c04-a6f8-a2e585a3e72b','External Video',0,'external',NULL),(2,'2021-07-30 20:03:23.074102','8d8edaee-c510-4e02-8610-5f7f869dfd56','External Video',0,'external',NULL),(3,'2021-07-30 20:03:23.120345','2ee3effc-2339-4db5-8648-db518c6190d4','External Video',0,'external',NULL),(4,'2021-07-30 20:03:23.155393','c1fc41ed-650b-4684-8e5d-ac0850bfce69','External Video',0,'external',NULL),(5,'2021-07-30 20:03:23.193551','8b4a688f-64a4-4612-a486-cd126da0f53a','External Video',0,'external',NULL),(6,'2021-07-30 20:03:34.760505','7d06f060-ed5a-4530-932d-5d87b4c3adf9','External Video',0,'external',NULL),(7,'2021-07-30 20:03:34.800758','07345653-929b-46e5-bfde-cc9373f19ff5','External Video',0,'external',NULL),(8,'2021-07-30 20:03:34.822330','caed5b70-3eb1-4538-9319-01d8fd078a6e','External Video',0,'external',NULL),(9,'2021-07-30 20:03:34.926081','a295c105-a6d7-4176-b8c2-4a1ed7481d3a','External Video',0,'external',NULL);
/*!40000 ALTER TABLE `edxval_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edxval_videoimage`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edxval_videoimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `generated_images` longtext NOT NULL,
  `course_video_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_video_id` (`course_video_id`),
  CONSTRAINT `edxval_videoimage_course_video_id_06855d34_fk_edxval_co` FOREIGN KEY (`course_video_id`) REFERENCES `edxval_coursevideo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edxval_videoimage`
--

LOCK TABLES `edxval_videoimage` WRITE;
/*!40000 ALTER TABLE `edxval_videoimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `edxval_videoimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edxval_videotranscript`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edxval_videotranscript` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `transcript` varchar(255) DEFAULT NULL,
  `language_code` varchar(50) NOT NULL,
  `provider` varchar(30) NOT NULL,
  `file_format` varchar(20) NOT NULL,
  `video_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `edxval_videotranscript_video_id_language_code_37532906_uniq` (`video_id`,`language_code`),
  KEY `edxval_videotranscript_language_code_d78ce3d1` (`language_code`),
  KEY `edxval_videotranscript_file_format_3adddaf7` (`file_format`),
  CONSTRAINT `edxval_videotranscript_video_id_6ffdfb56_fk_edxval_video_id` FOREIGN KEY (`video_id`) REFERENCES `edxval_video` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edxval_videotranscript`
--

LOCK TABLES `edxval_videotranscript` WRITE;
/*!40000 ALTER TABLE `edxval_videotranscript` DISABLE KEYS */;
INSERT INTO `edxval_videotranscript` VALUES (1,'2021-07-30 20:03:23.033186','2021-07-30 20:03:23.036210','video-transcripts/47482e31b07e436996843034faa05815.sjson','en','Custom','sjson',1),(2,'2021-07-30 20:03:23.086289','2021-07-30 20:03:23.091190','video-transcripts/9972af9689e94737ae690d31eab8f658.sjson','en','Custom','sjson',2),(3,'2021-07-30 20:03:23.129048','2021-07-30 20:03:23.131718','video-transcripts/777c9ed2e6934ee6a75af8404d1aa270.sjson','en','Custom','sjson',3),(4,'2021-07-30 20:03:23.164139','2021-07-30 20:03:23.166702','video-transcripts/68c4f051fe764ce7afd2d7fa2dbd908a.sjson','en','Custom','sjson',4),(5,'2021-07-30 20:03:23.203407','2021-07-30 20:03:23.206698','video-transcripts/3b534b34be1f423bb2acb9fa6a1e73e8.sjson','en','Custom','sjson',5),(6,'2021-07-30 20:03:34.770836','2021-07-30 20:03:34.773716','video-transcripts/a759e08b38bf4c118031298f16918c29.sjson','en','Custom','sjson',6),(7,'2021-07-30 20:03:34.830201','2021-07-30 20:03:34.833772','video-transcripts/64809c267d034513979fa0aa60236dea.sjson','en','Custom','sjson',8),(8,'2021-07-30 20:03:34.933868','2021-07-30 20:03:34.936216','video-transcripts/f11497de98bf4439b3344aa8f1b1b451.sjson','en','Custom','sjson',9);
/*!40000 ALTER TABLE `edxval_videotranscript` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `embargo_country`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `embargo_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `country` (`country`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `embargo_country`
--

LOCK TABLES `embargo_country` WRITE;
/*!40000 ALTER TABLE `embargo_country` DISABLE KEYS */;
INSERT INTO `embargo_country` VALUES (6,'AD'),(235,'AE'),(1,'AF'),(10,'AG'),(8,'AI'),(3,'AL'),(12,'AM'),(7,'AO'),(9,'AQ'),(11,'AR'),(5,'AS'),(15,'AT'),(14,'AU'),(13,'AW'),(2,'AX'),(16,'AZ'),(29,'BA'),(20,'BB'),(19,'BD'),(22,'BE'),(36,'BF'),(35,'BG'),(18,'BH'),(37,'BI'),(24,'BJ'),(186,'BL'),(25,'BM'),(34,'BN'),(27,'BO'),(28,'BQ'),(32,'BR'),(17,'BS'),(26,'BT'),(31,'BV'),(30,'BW'),(21,'BY'),(23,'BZ'),(41,'CA'),(48,'CC'),(52,'CD'),(43,'CF'),(51,'CG'),(217,'CH'),(55,'CI'),(53,'CK'),(45,'CL'),(40,'CM'),(46,'CN'),(49,'CO'),(54,'CR'),(57,'CU'),(38,'CV'),(58,'CW'),(47,'CX'),(59,'CY'),(60,'CZ'),(84,'DE'),(62,'DJ'),(61,'DK'),(63,'DM'),(64,'DO'),(4,'DZ'),(65,'EC'),(70,'EE'),(66,'EG'),(247,'EH'),(69,'ER'),(211,'ES'),(72,'ET'),(76,'FI'),(75,'FJ'),(73,'FK'),(144,'FM'),(74,'FO'),(77,'FR'),(81,'GA'),(236,'GB'),(89,'GD'),(83,'GE'),(78,'GF'),(93,'GG'),(85,'GH'),(86,'GI'),(88,'GL'),(82,'GM'),(94,'GN'),(90,'GP'),(68,'GQ'),(87,'GR'),(208,'GS'),(92,'GT'),(91,'GU'),(95,'GW'),(96,'GY'),(101,'HK'),(98,'HM'),(100,'HN'),(56,'HR'),(97,'HT'),(102,'HU'),(105,'ID'),(108,'IE'),(110,'IL'),(109,'IM'),(104,'IN'),(33,'IO'),(107,'IQ'),(106,'IR'),(103,'IS'),(111,'IT'),(114,'JE'),(112,'JM'),(115,'JO'),(113,'JP'),(117,'KE'),(121,'KG'),(39,'KH'),(118,'KI'),(50,'KM'),(188,'KN'),(164,'KP'),(209,'KR'),(120,'KW'),(42,'KY'),(116,'KZ'),(122,'LA'),(124,'LB'),(189,'LC'),(128,'LI'),(212,'LK'),(126,'LR'),(125,'LS'),(129,'LT'),(130,'LU'),(123,'LV'),(127,'LY'),(150,'MA'),(146,'MC'),(145,'MD'),(148,'ME'),(190,'MF'),(132,'MG'),(138,'MH'),(165,'MK'),(136,'ML'),(152,'MM'),(147,'MN'),(131,'MO'),(166,'MP'),(139,'MQ'),(140,'MR'),(149,'MS'),(137,'MT'),(141,'MU'),(135,'MV'),(133,'MW'),(143,'MX'),(134,'MY'),(151,'MZ'),(153,'NA'),(157,'NC'),(160,'NE'),(163,'NF'),(161,'NG'),(159,'NI'),(156,'NL'),(167,'NO'),(155,'NP'),(154,'NR'),(162,'NU'),(158,'NZ'),(168,'OM'),(172,'PA'),(175,'PE'),(79,'PF'),(173,'PG'),(176,'PH'),(169,'PK'),(178,'PL'),(191,'PM'),(177,'PN'),(180,'PR'),(171,'PS'),(179,'PT'),(170,'PW'),(174,'PY'),(181,'QA'),(182,'RE'),(183,'RO'),(198,'RS'),(184,'RU'),(185,'RW'),(196,'SA'),(205,'SB'),(199,'SC'),(213,'SD'),(216,'SE'),(201,'SG'),(187,'SH'),(204,'SI'),(215,'SJ'),(203,'SK'),(200,'SL'),(194,'SM'),(197,'SN'),(206,'SO'),(214,'SR'),(210,'SS'),(195,'ST'),(67,'SV'),(202,'SX'),(218,'SY'),(71,'SZ'),(231,'TC'),(44,'TD'),(80,'TF'),(224,'TG'),(222,'TH'),(220,'TJ'),(225,'TK'),(223,'TL'),(230,'TM'),(228,'TN'),(226,'TO'),(229,'TR'),(227,'TT'),(232,'TV'),(219,'TW'),(221,'TZ'),(234,'UA'),(233,'UG'),(237,'UM'),(238,'US'),(239,'UY'),(240,'UZ'),(99,'VA'),(192,'VC'),(242,'VE'),(244,'VG'),(245,'VI'),(243,'VN'),(241,'VU'),(246,'WF'),(193,'WS'),(119,'XK'),(248,'YE'),(142,'YT'),(207,'ZA'),(249,'ZM'),(250,'ZW');
/*!40000 ALTER TABLE `embargo_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `embargo_countryaccessrule`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `embargo_countryaccessrule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_type` varchar(255) NOT NULL,
  `country_id` int(11) NOT NULL,
  `restricted_course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `embargo_countryaccessrul_restricted_course_id_cou_477b6bb1_uniq` (`restricted_course_id`,`country_id`),
  KEY `embargo_countryacces_country_id_6af33e89_fk_embargo_c` (`country_id`),
  CONSTRAINT `embargo_countryacces_country_id_6af33e89_fk_embargo_c` FOREIGN KEY (`country_id`) REFERENCES `embargo_country` (`id`),
  CONSTRAINT `embargo_countryacces_restricted_course_id_eedb3d21_fk_embargo_r` FOREIGN KEY (`restricted_course_id`) REFERENCES `embargo_restrictedcourse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `embargo_countryaccessrule`
--

LOCK TABLES `embargo_countryaccessrule` WRITE;
/*!40000 ALTER TABLE `embargo_countryaccessrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `embargo_countryaccessrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `embargo_courseaccessrulehistory`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `embargo_courseaccessrulehistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime(6) NOT NULL,
  `course_key` varchar(255) NOT NULL,
  `snapshot` longtext,
  PRIMARY KEY (`id`),
  KEY `embargo_courseaccessrulehistory_timestamp_0267f0e6` (`timestamp`),
  KEY `embargo_courseaccessrulehistory_course_key_6f7a7a06` (`course_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `embargo_courseaccessrulehistory`
--

LOCK TABLES `embargo_courseaccessrulehistory` WRITE;
/*!40000 ALTER TABLE `embargo_courseaccessrulehistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `embargo_courseaccessrulehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `embargo_embargoedcourse`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `embargo_embargoedcourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `embargoed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `embargo_embargoedcourse`
--

LOCK TABLES `embargo_embargoedcourse` WRITE;
/*!40000 ALTER TABLE `embargo_embargoedcourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `embargo_embargoedcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `embargo_embargoedstate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `embargo_embargoedstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `embargoed_countries` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `embargo_embargoedstate_changed_by_id_f7763260_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `embargo_embargoedstate_changed_by_id_f7763260_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `embargo_embargoedstate`
--

LOCK TABLES `embargo_embargoedstate` WRITE;
/*!40000 ALTER TABLE `embargo_embargoedstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `embargo_embargoedstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `embargo_ipfilter`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `embargo_ipfilter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `whitelist` longtext NOT NULL,
  `blacklist` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `embargo_ipfilter_changed_by_id_39e4eed2_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `embargo_ipfilter_changed_by_id_39e4eed2_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `embargo_ipfilter`
--

LOCK TABLES `embargo_ipfilter` WRITE;
/*!40000 ALTER TABLE `embargo_ipfilter` DISABLE KEYS */;
/*!40000 ALTER TABLE `embargo_ipfilter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `embargo_restrictedcourse`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `embargo_restrictedcourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_key` varchar(255) NOT NULL,
  `enroll_msg_key` varchar(255) NOT NULL,
  `access_msg_key` varchar(255) NOT NULL,
  `disable_access_check` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_key` (`course_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `embargo_restrictedcourse`
--

LOCK TABLES `embargo_restrictedcourse` WRITE;
/*!40000 ALTER TABLE `embargo_restrictedcourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `embargo_restrictedcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_adminnotification`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_adminnotification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `text` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `start_date` date NOT NULL,
  `expiration_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_adminnotification`
--

LOCK TABLES `enterprise_adminnotification` WRITE;
/*!40000 ALTER TABLE `enterprise_adminnotification` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_adminnotification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_adminnotification_admin_notification_filter`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_adminnotification_admin_notification_filter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminnotification_id` int(11) NOT NULL,
  `adminnotificationfilter_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_adminnotifica_adminnotification_id_adm_d4f4da63_uniq` (`adminnotification_id`,`adminnotificationfilter_id`),
  KEY `enterprise_adminnoti_adminnotificationfil_276acc56_fk_enterpris` (`adminnotificationfilter_id`),
  CONSTRAINT `enterprise_adminnoti_adminnotification_id_6ab95bff_fk_enterpris` FOREIGN KEY (`adminnotification_id`) REFERENCES `enterprise_adminnotification` (`id`),
  CONSTRAINT `enterprise_adminnoti_adminnotificationfil_276acc56_fk_enterpris` FOREIGN KEY (`adminnotificationfilter_id`) REFERENCES `enterprise_adminnotificationfilter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_adminnotification_admin_notification_filter`
--

LOCK TABLES `enterprise_adminnotification_admin_notification_filter` WRITE;
/*!40000 ALTER TABLE `enterprise_adminnotification_admin_notification_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_adminnotification_admin_notification_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_adminnotificationfilter`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_adminnotificationfilter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `filter` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filter` (`filter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_adminnotificationfilter`
--

LOCK TABLES `enterprise_adminnotificationfilter` WRITE;
/*!40000 ALTER TABLE `enterprise_adminnotificationfilter` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_adminnotificationfilter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_adminnotificationread`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_adminnotificationread` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `admin_notification_id` int(11) NOT NULL,
  `enterprise_customer_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_adminnotifica_enterprise_customer_user_767d1bcc_uniq` (`enterprise_customer_user_id`,`admin_notification_id`),
  KEY `enterprise_adminnoti_admin_notification_i_77267771_fk_enterpris` (`admin_notification_id`),
  CONSTRAINT `enterprise_adminnoti_admin_notification_i_77267771_fk_enterpris` FOREIGN KEY (`admin_notification_id`) REFERENCES `enterprise_adminnotification` (`id`),
  CONSTRAINT `enterprise_adminnoti_enterprise_customer__4a67a03f_fk_enterpris` FOREIGN KEY (`enterprise_customer_user_id`) REFERENCES `enterprise_enterprisecustomeruser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_adminnotificationread`
--

LOCK TABLES `enterprise_adminnotificationread` WRITE;
/*!40000 ALTER TABLE `enterprise_adminnotificationread` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_adminnotificationread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_enrollmentnotificationemailtemplate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_enrollmentnotificationemailtemplate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `plaintext_template` longtext NOT NULL,
  `html_template` longtext NOT NULL,
  `subject_line` varchar(100) NOT NULL,
  `enterprise_customer_id` char(32) DEFAULT NULL,
  `template_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_customer_id` (`enterprise_customer_id`),
  CONSTRAINT `enterprise_enrollmen_enterprise_customer__df17d9ff_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_enrollmentnotificationemailtemplate`
--

LOCK TABLES `enterprise_enrollmentnotificationemailtemplate` WRITE;
/*!40000 ALTER TABLE `enterprise_enrollmentnotificationemailtemplate` DISABLE KEYS */;
INSERT INTO `enterprise_enrollmentnotificationemailtemplate` VALUES (1,'2021-07-30 19:57:08.931998','2021-07-30 19:57:08.931998','\n        {% load i18n %}{% if user_name %}{% blocktrans %}Dear {{ user_name }},{% endblocktrans %}{% else %}{% blocktrans %}Hi!{% endblocktrans %}{% endif %}\n        {% if enrolled_in.type == \"program\" %}\n        {% blocktrans with program_url=enrolled_in.url program_name=enrolled_in.name program_branding=enrolled_in.branding start_date=enrolled_in.start|date:\"DATE_FORMAT\" %}You have been enrolled in {{ program_name }}, a {{ program_branding }} program offered by {{ organization_name }}. This program begins {{ start_date }}. For more information, see the following link:\n\n        {{ program_url }}{% endblocktrans %}{% else %}\n        {% blocktrans with course_url=enrolled_in.url course_name=enrolled_in.name start_date=enrolled_in.start|date:\"DATE_FORMAT\" %}You have been enrolled in {{ course_name }}, a course offered by {{ organization_name }}. This course begins {{ start_date }}. For more information, see the following link:\n\n        {{ course_url }}{% endblocktrans %}{% endif %}\n        {% blocktrans with enrolled_in_name=enrolled_in.name %}\n        Thanks,\n\n        The {{enrolled_in_name}} team{% endblocktrans %}\n        ','\n        {% load i18n %}<html>\n        <body>\n        <p>{% if user_name %}{% blocktrans %}Dear {{ user_name }},{% endblocktrans %}{% else %}{% blocktrans %}Hi!{% endblocktrans %}{% endif %}</p>\n        <p>{% if enrolled_in.type == \"program\" %}\n        {% blocktrans with program_url=enrolled_in.url program_name=enrolled_in.name program_branding=enrolled_in.branding start_date=enrolled_in.start|date:\"DATE_FORMAT\" %}You have been enrolled in <a href=\"{{ program_url }}\">{{ program_name }}</a>, a {{ program_branding }} program offered by {{ organization_name }}. This program begins {{ start_date }}. For more information, see <a href=\"{{ program_url }}\">{{ program_name }}</a>.{% endblocktrans %}{% else %}\n        {% blocktrans with course_url=enrolled_in.url course_name=enrolled_in.name start_date=enrolled_in.start|date:\"DATE_FORMAT\" %}You have been enrolled in <a href=\"{{ course_url }}\">{{ course_name }}</a>, a course offered by {{ organization_name }}. This course begins {{ start_date }}. For more information, see <a href=\"{{ course_url }}\">{{ course_name }}</a>.{% endblocktrans %}{% endif %}\n        </p>\n        {% blocktrans with enrolled_in_name=enrolled_in.name %}<p>\n        Thanks,\n        </p>\n        <p>\n        The {{enrolled_in_name}} team\n        </p>{% endblocktrans %}\n        </body>\n        </html>','',NULL,'SELF_ENROLL'),(2,'2021-07-30 19:57:08.939475','2021-07-30 19:57:10.673913','\n        Great News! You\'ve been enrolled in {{enrolled_in.name}} by {{organization_name}}\n\n        This course is a free benefit offered especially for you, and we are excited for you to meet your learning community on edX.\n\n        Visit this link to see and enroll in your course, {{enrolled_in.url}}\n\n        The {{enrolled_in.name}} team\n        ','\n<html>\n<head>\n    <style type=\"text/css\">\n        a, a:visited, a:hover, a:active {\n            text-decoration: none;\n            color: #00262b;\n        }\n    </style>\n</head>\n<body>\n    <table style=\"max-width: 650;\" align=\"center\">\n        <tbody>\n            <tr>\n            <td>\n                <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px\">\n                    <tbody>\n                        <tr>\n                        <td align=\"left\" valign=\"top\" style=\"padding:8px;Margin:0;width:560px\">\n                            <img src=\"https://ci3.googleusercontent.com/proxy/ZAml-YgIIJEht-OBl6GqLNIUeVKLyPvs_ldFo9FShp-andj1YQxvliJXv_s_Tmh6cg1-5avJJmvXmzxbQp06sB_WUeYYkN9kzV6jtVUvYKPPjUX_8_iFJAZqsNqYakl4nQyHnl0dClFzxiaLuULSPoqGPLBfJmNOEXIBYkvKYa95640xvHwDiQ22bZ16=s0-d-e1-ft#https://appboy-images.com/appboy/communication/assets/image_assets/images/5fc568622213594dcbda2623/original.png?1606772834\" width=\"110\" height=\"57\" border=\"0\" style=\"display:block\" alt=\"edX\" id=\"m_-37988256656304111logo\" class=\"CToWUd\">\n                        </td>\n                        <td align=\"right\" valign=\"top\" style=\"white-space:nowrap;text-decoration:none;color:#00262b;font-family:\'inter\',Arial,sans-serif;font-size:18px;line-height:21px\">\n                            <a href=\"{{dashboard_url}}\">My Dashboard</a> \n                        </td>\n                        </tr>\n                    </tbody>\n                </table>\n            </td>\n            </tr>\n            <tr>\n            <td align=\"left\" bgcolor=\"#002b2b\" style=\"Margin:0;padding-left:20px;padding-right:20px;padding-top:40px;padding-bottom:40px;background-color:#002b2b;background-image:url(https://ci3.googleusercontent.com/proxy/2CLnc9QL2u1L0MsUErVcQVBOz6OlDew2A5O8umOI9v7PGI3ip8YnJqYPRcexkjGsbNvNa6kUFyuHAMp7LlVBKKa7bxaKUjEO566AyX4M_6PhDtwz-QpLXLg9eQZQ93LIwP-5SbUtfxd203xXFTVBatJrN9P2hsuJSWFwd9k2pooiea6Qsg=s0-d-e1-ft#https://fzvpwi.stripocdn.email/content/guids/CABINET_4d3c6887b8ac137f656a3dd54bb5f6c8/images/53481614126118338.png);background-repeat:no-repeat;background-position:left top\" background=\"https://ci3.googleusercontent.com/proxy/2CLnc9QL2u1L0MsUErVcQVBOz6OlDew2A5O8umOI9v7PGI3ip8YnJqYPRcexkjGsbNvNa6kUFyuHAMp7LlVBKKa7bxaKUjEO566AyX4M_6PhDtwz-QpLXLg9eQZQ93LIwP-5SbUtfxd203xXFTVBatJrN9P2hsuJSWFwd9k2pooiea6Qsg=s0-d-e1-ft#https://fzvpwi.stripocdn.email/content/guids/CABINET_4d3c6887b8ac137f656a3dd54bb5f6c8/images/53481614126118338.png\">\n                <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse;border-spacing:0px\">\n                    <tbody>\n                        <tr>\n                        <td align=\"center\" valign=\"top\" style=\"padding:0;Margin:0;width:560px\">\n                            <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px\">\n                                <tbody>\n                                    <tr>\n                                    <td align=\"center\" style=\"padding:0;Margin:0\">\n                                        <p style=\"Margin:0;font-size:32px;font-family:helvetica,\'helvetica neue\',arial,verdana,sans-serif;line-height:48px;color:#ffffff\"><strong><span class=\"il\">Congratulations</span>, Restless Learner</strong></p>\n                                    </td>\n                                    </tr>\n                                    <tr>\n                                    <td align=\"center\" style=\"padding:0;Margin:0\">\n                                        <p style=\"Margin:0;font-size:20px;font-family:arial,\'helvetica neue\',helvetica,sans-serif;line-height:30px;color:#ffffff\">Great News! You\'ve been <span class=\"il\">Enrolled</span> in {{enrolled_in.name}} by {{organization_name}}</p>\n                                    </td>\n                                    </tr>\n                                </tbody>\n                            </table>\n                        </td>\n                        </tr>\n                    </tbody>\n                </table>\n            </td>\n            </tr>\n            <tr>\n            <td align=\"left\" style=\"padding:0;Margin:0;padding-top:20px;padding-left:20px;padding-right:20px\">\n                <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse;border-spacing:0px\">\n                    <tbody>\n                        <tr>\n                        <td align=\"center\" valign=\"top\" style=\"padding:0;Margin:0;width:560px\">\n                            <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px\">\n                                <tbody>\n                                    <tr>\n                                    <td align=\"center\" style=\"padding:0;Margin:0\">\n                                        <p style=\"Margin:0;font-size:14px;font-family:arial,\'helvetica neue\',helvetica,sans-serif;line-height:21px;color:#333333\">\n                                            This course is a free benefit offered especially for you, and we are excited for you to meet your learning community on edX.\n                                        </p>\n                                    </td>\n                                    </tr>\n                                </tbody>\n                            </table>\n                        </td>\n                        </tr>\n                    </tbody>\n                </table>\n            </td>\n            </tr>\n            <tr>\n            <td>\n                <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px\">\n                    <tbody>\n                        <tr>\n                        <td align=\"center\" bgcolor=\"#ffffff\" style=\"padding:0;Margin:0;padding-top:10px;padding-left:10px;padding-bottom:15px\"><span class=\"m_-37988256656304111es-button-border\" style=\"border-style:solid;border-color:#d03529;background:#d03529;border-width:0px 0px 2px 0px;display:inline-block;border-radius:0px;width:auto\"><a href=\"{{enrolled_in.url}}\" class=\"m_-37988256656304111es-button\" style=\"text-decoration:none;font-family:helvetica,\'helvetica neue\',arial,verdana,sans-serif;font-size:18px;color:#ffffff;border-style:solid;border-color:#d03529;border-width:10px 15px;display:inline-block;background:#d03529;border-radius:0px;font-weight:normal;font-style:normal;line-height:22px;width:auto;text-align:center\" target=\"_blank\">Start my course</a></span></td>\n                        </tr>\n                    </tbody>\n                </table>\n            </td>\n            </tr>\n            <tr>\n            <td align=\"center\" bgcolor=\"#ffffff\" style=\"padding:20px;Margin:0;background-color:#ffffff\">\n                <table cellpadding=\"0\" cellspacing=\"0\" class=\"m_-37988256656304111es-left\" align=\"center\" style=\"display:inline-block;border-collapse:collapse;border-spacing:0px;\">\n                    <tbody>\n                        <tr>\n                        <td class=\"m_-37988256656304111es-m-p0r\" align=\"center\" style=\"padding:0;Margin:0;width:50px\">\n                            <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px\">\n                                <tbody>\n                                    <tr>\n                                    <td align=\"center\" style=\"padding:0;Margin:0;font-size:0px\"><a href=\"https://www.facebook.com/edX\"><img src=\"https://ci3.googleusercontent.com/proxy/2EBI4EepyVUk0cIRxzfMGmsBqU6TKjJsw7CqB8hSM0zRlLb0-BL0Y_JXhu-E6b1DiMGQ-4NHHem0qkjDgG_0xHNTYSsmJ0Rv9qBXCj2SJyT-yFlrkA7SYr4YkGg8CdkRYlkwZsQzU0DiZIDWZopRyOkPvcHWVTLwzCdJMKZcFc57HfR-eQ=s0-d-e1-ft#https://fzvpwi.stripocdn.email/content/guids/CABINET_4d3c6887b8ac137f656a3dd54bb5f6c8/images/71001614127047298.png\" alt=\"facebook logo hyperlink\" style=\"display:block;border:0;outline:none;text-decoration:none\" width=\"35\" height=\"35\" class=\"CToWUd\"></a></td>\n                                    </tr>\n                                </tbody>\n                            </table>\n                        </td>\n                        <td class=\"m_-37988256656304111es-hidden\" style=\"padding:0;Margin:0;width:15px\"></td>\n                        </tr>\n                    </tbody>\n                </table>\n                <table cellpadding=\"0\" cellspacing=\"0\" class=\"m_-37988256656304111es-left\" align=\"center\" style=\"display:inline-block;border-collapse:collapse;border-spacing:0px;\">\n                    <tbody>\n                        <tr>\n                        <td align=\"center\" style=\"padding:0;Margin:0;width:50px\">\n                            <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px\">\n                                <tbody>\n                                    <tr>\n                                    <td align=\"center\" style=\"padding:0;Margin:0;font-size:0px\"><a href=\"https://twitter.com/edXOnline\"><img src=\"https://ci4.googleusercontent.com/proxy/yPnmVX7UE9sXw9LbZmrtTLvkrZVy9NJurDVqU6aByY871Dj0GMzEmJZOQm5kTImdMT_qNIIvpVpTpTpboYZB6wPyZuOUKwd49j6Q7yTB9IM0DWSMdldQ4XiOHReWms7Mw7HL9rRGk1iRLwmx0IT5frUGIcmc4ulwvQcjBFSHUBcMBDrAvQ=s0-d-e1-ft#https://fzvpwi.stripocdn.email/content/guids/CABINET_4d3c6887b8ac137f656a3dd54bb5f6c8/images/19131614127052508.png\" alt=\"twitter logo hyperlink\" style=\"display:block;border:0;outline:none;text-decoration:none\" width=\"35\" height=\"35\" class=\"CToWUd\"></a></td>\n                                    </tr>\n                                </tbody>\n                            </table>\n                        </td>\n                        <td class=\"m_-37988256656304111es-hidden\" style=\"padding:0;Margin:0;width:15px\"></td>\n                        </tr>\n                    </tbody>\n                </table>\n                <table cellpadding=\"0\" cellspacing=\"0\" class=\"m_-37988256656304111es-left\" align=\"center\" style=\"display:inline-block;border-collapse:collapse;border-spacing:0px\">\n                    <tbody>\n                        <tr>\n                        <td align=\"center\" style=\"padding:0;Margin:0;width:50px\">\n                            <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px\">\n                                <tbody>\n                                    <tr>\n                                    <td align=\"center\" style=\"padding:0;Margin:0;font-size:0px\"><a href=\"https://www.linkedin.com/school/edx/\"><img src=\"https://ci6.googleusercontent.com/proxy/GT773Vs37lIPuUvoTpVMvtQ8sSuiC9sGLGtWGNti6nwmrZGrcewvoO_zFG4XJadUV-xPRYqf9zbLEshuVcSQMZiI1yUuM5VKxTF9lLfuzDWV1ZbMPEpk2cAWEZcDAW8mD3VFxY5l0y1Gxvcc_2bB4L-ApvPHnnIw7rXB_XDe1o37B4xPaA=s0-d-e1-ft#https://fzvpwi.stripocdn.email/content/guids/CABINET_4d3c6887b8ac137f656a3dd54bb5f6c8/images/42721614127058646.png\" alt=\"linkedin logo hyperlink\" style=\"display:block;border:0;outline:none;text-decoration:none\" width=\"35\" height=\"35\" class=\"CToWUd\"></a></td>\n                                    </tr>\n                                </tbody>\n                            </table>\n                        </td>\n                        <td class=\"m_-37988256656304111es-hidden\" style=\"padding:0;Margin:0;width:15px\"></td>\n                        </tr>\n                    </tbody>\n                </table>\n                <table cellpadding=\"0\" cellspacing=\"0\" class=\"m_-37988256656304111es-left\" align=\"center\" style=\"display:inline-block;border-collapse:collapse;border-spacing:0px\">\n                    <tbody>\n                        <tr>\n                        <td align=\"center\" style=\"padding:0;Margin:0;width:50px\">\n                            <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px\">\n                                <tbody>\n                                    <tr>\n                                    <td align=\"center\" style=\"padding:0;Margin:0;font-size:0px\"><a href=\"https://www.reddit.com/r/edX/\"><img src=\"https://ci6.googleusercontent.com/proxy/hVT_30jYZguhmOyUAcTTZhCNDjjlivo3GAljGnyt_nNnjp0A0zcheoKw-XgM2NSD7M-CemzJEui6RIte_cH0YyJXUwCJWFpZ6j96QCB3T2UeQddtN1_VrVyQoDnAR1G82cHdJnq6Ysc-KQPvBKngjYaaPYSvcvMuHR0QS7dcnlGK35dUlA=s0-d-e1-ft#https://fzvpwi.stripocdn.email/content/guids/CABINET_4d3c6887b8ac137f656a3dd54bb5f6c8/images/23371614127063365.png\" alt=\"reddit logo hyperlink\" style=\"display:block;border:0;outline:none;text-decoration:none\" width=\"35\" height=\"35\" class=\"CToWUd\"></a></td>\n                                    </tr>\n                                </tbody>\n                            </table>\n                        </td>\n                        <td class=\"m_-37988256656304111es-hidden\" style=\"padding:0;Margin:0;width:15px\"></td>\n                        </tr>\n                    </tbody>\n                </table>\n                <table cellpadding=\"0\" cellspacing=\"0\" class=\"m_-37988256656304111es-left\" align=\"center\" style=\"display:inline-block;border-collapse:collapse;border-spacing:0px;\">\n                    <tbody>\n                        <tr>\n                        <td align=\"left\" style=\"padding:0;Margin:0;width:50px\">\n                            <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px\">\n                                <tbody>\n                                    <tr>\n                                    <td align=\"center\" style=\"padding:0;Margin:0;font-size:0px\"><a href=\"https://api.whatsapp.com/send?text=edX\"><img src=\"https://ci4.googleusercontent.com/proxy/9UmWL708u3GDWbf_b3dzLoavIieL1kLHnipq6vGF06ZpMlLEQe9WkHJZsNVHfBwYZhpp71tbA8EJgf2_mhGV2RwDBIiUox83T4sP6uZKF3rw6QGEtQY2Ou16eR6v39Quf2AHsnh78t6JK6PMqlxGVSVKB2WkmUX37_2jtgfIqVtOLlV1bw=s0-d-e1-ft#https://fzvpwi.stripocdn.email/content/guids/CABINET_4d3c6887b8ac137f656a3dd54bb5f6c8/images/18781614127069989.png\" alt=\"whatsapp logo hyperlink\" style=\"display:block;border:0;outline:none;text-decoration:none\" width=\"35\" height=\"35\" class=\"CToWUd\"></a></td>\n                                    </tr>\n                                </tbody>\n                            </table>\n                        </td>\n                        </tr>\n                    </tbody>\n                </table>\n            </td>\n            </tr>\n            <tr>\n            <td>\n                <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n                    <tbody>\n                        <tr>\n                        <td height=\"20\" style=\"line-height:1px;font-size:1px\"></td>\n                        </tr>\n                        <tr>\n                        <td align=\"left\" valign=\"top\"><a href=\"https://business.edx.org\" style=\"font-family:\'Open Sans\',Arial,sans-serif;font-size:14px;line-height:17px;text-decoration:none;color:#707070\" target=\"_blank\"><span style=\"color:#00262b\">edX for Business</span><span style=\"color:#707070\"> — eLearning Solutions for Your Company</span></a></td>\n                        </tr>\n                        <tr>\n                        <td height=\"20\" style=\"line-height:1px;font-size:1px\"></td>\n                        </tr>\n                        <tr>\n                        <td align=\"left\" style=\"font-family:\'Open Sans\',Arial,sans-serif;color:#707070;font-size:14px;line-height:17px\" valign=\"top\">© 2021 edX Inc. All rights reserved.</td>\n                        </tr>\n                        <tr>\n                        <td height=\"20\" style=\"line-height:1px;font-size:1px\"></td>\n                        </tr>\n                        <tr>\n                        <td height=\"20\" style=\"line-height:1px;font-size:1px\"></td>\n                        </tr>\n                        <tr>\n                        <td align=\"left\" style=\"font-family:\'Open Sans\',Arial,sans-serif;color:#707070;font-size:14px;line-height:17px\" valign=\"top\">141 Portland St. 9th Floor, Cambridge, MA 02139</td>\n                        </tr>\n                        <tr>\n                        <td height=\"30\" style=\"line-height:1px;font-size:1px\"></td>\n                        </tr>\n                    </tbody>\n                </table>\n            </td>\n            </tr>\n        </tbody>\n    </table>\n</body>\n</html>\n         ','',NULL,'ADMIN_ENROLL');
/*!40000 ALTER TABLE `enterprise_enrollmentnotificationemailtemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_enterpriseanalyticsuser`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_enterpriseanalyticsuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `analytics_user_id` varchar(255) NOT NULL,
  `enterprise_customer_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_enterpriseana_enterprise_customer_user_bdd48f28_uniq` (`enterprise_customer_user_id`,`analytics_user_id`),
  CONSTRAINT `enterprise_enterpris_enterprise_customer__006186e8_fk_enterpris` FOREIGN KEY (`enterprise_customer_user_id`) REFERENCES `enterprise_enterprisecustomeruser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_enterpriseanalyticsuser`
--

LOCK TABLES `enterprise_enterpriseanalyticsuser` WRITE;
/*!40000 ALTER TABLE `enterprise_enterpriseanalyticsuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_enterpriseanalyticsuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_enterprisecatalogquery`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_enterprisecatalogquery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content_filter` longtext,
  `uuid` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_enterprisecatalogquery_uuid_4fdf5c5a_uniq` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_enterprisecatalogquery`
--

LOCK TABLES `enterprise_enterprisecatalogquery` WRITE;
/*!40000 ALTER TABLE `enterprise_enterprisecatalogquery` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_enterprisecatalogquery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_enterprisecourseenrollment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_enterprisecourseenrollment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `enterprise_customer_user_id` int(11) NOT NULL,
  `source_id` int(11) DEFAULT NULL,
  `saved_for_later` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_enterprisecou_enterprise_customer_user_71fe301a_uniq` (`enterprise_customer_user_id`,`course_id`),
  KEY `enterprise_enterpris_source_id_c347bfa6_fk_enterpris` (`source_id`),
  CONSTRAINT `enterprise_enterpris_enterprise_customer__cf423e59_fk_enterpris` FOREIGN KEY (`enterprise_customer_user_id`) REFERENCES `enterprise_enterprisecustomeruser` (`id`),
  CONSTRAINT `enterprise_enterpris_source_id_c347bfa6_fk_enterpris` FOREIGN KEY (`source_id`) REFERENCES `enterprise_enterpriseenrollmentsource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_enterprisecourseenrollment`
--

LOCK TABLES `enterprise_enterprisecourseenrollment` WRITE;
/*!40000 ALTER TABLE `enterprise_enterprisecourseenrollment` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_enterprisecourseenrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_enterprisecustomer`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_enterprisecustomer` (
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `uuid` char(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(30) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `country` varchar(2) DEFAULT NULL,
  `hide_course_original_price` tinyint(1) NOT NULL,
  `enable_data_sharing_consent` tinyint(1) NOT NULL,
  `enforce_data_sharing_consent` varchar(25) NOT NULL,
  `enable_audit_enrollment` tinyint(1) NOT NULL,
  `enable_audit_data_reporting` tinyint(1) NOT NULL,
  `replace_sensitive_sso_username` tinyint(1) NOT NULL,
  `enable_autocohorting` tinyint(1) NOT NULL,
  `enable_portal_code_management_screen` tinyint(1) NOT NULL,
  `enable_portal_reporting_config_screen` tinyint(1) NOT NULL,
  `enable_portal_subscription_management_screen` tinyint(1) NOT NULL,
  `enable_learner_portal` tinyint(1) NOT NULL,
  `contact_email` varchar(254) DEFAULT NULL,
  `customer_type_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `enable_slug_login` tinyint(1) NOT NULL,
  `enable_portal_saml_configuration_screen` tinyint(1) NOT NULL,
  `default_contract_discount` decimal(8,5) DEFAULT NULL,
  `enable_analytics_screen` tinyint(1) NOT NULL,
  `enable_integrated_customer_learner_portal_search` tinyint(1) NOT NULL,
  `default_language` varchar(25) DEFAULT NULL,
  `enable_portal_lms_configurations_screen` tinyint(1) NOT NULL,
  `sender_alias` varchar(255) DEFAULT NULL,
  `reply_to` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `slug` (`slug`),
  KEY `enterprise_enterpris_customer_type_id_4b1ee315_fk_enterpris` (`customer_type_id`),
  KEY `enterprise_enterprisecustomer_site_id_947ed084_fk_django_site_id` (`site_id`),
  CONSTRAINT `enterprise_enterpris_customer_type_id_4b1ee315_fk_enterpris` FOREIGN KEY (`customer_type_id`) REFERENCES `enterprise_enterprisecustomertype` (`id`),
  CONSTRAINT `enterprise_enterprisecustomer_site_id_947ed084_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_enterprisecustomer`
--

LOCK TABLES `enterprise_enterprisecustomer` WRITE;
/*!40000 ALTER TABLE `enterprise_enterprisecustomer` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_enterprisecustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_enterprisecustomerbrandingconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_enterprisecustomerbrandingconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  `primary_color` varchar(7) DEFAULT NULL,
  `secondary_color` varchar(7) DEFAULT NULL,
  `tertiary_color` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_customer_id` (`enterprise_customer_id`),
  CONSTRAINT `enterprise_enterpris_enterprise_customer__09c1ee14_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_enterprisecustomerbrandingconfiguration`
--

LOCK TABLES `enterprise_enterprisecustomerbrandingconfiguration` WRITE;
/*!40000 ALTER TABLE `enterprise_enterprisecustomerbrandingconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_enterprisecustomerbrandingconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_enterprisecustomercatalog`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_enterprisecustomercatalog` (
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `uuid` char(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content_filter` longtext,
  `enabled_course_modes` longtext NOT NULL,
  `publish_audit_enrollment_urls` tinyint(1) NOT NULL,
  `enterprise_catalog_query_id` int(11) DEFAULT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `enterprise_enterpris_enterprise_catalog_q_aa53eb7d_fk_enterpris` (`enterprise_catalog_query_id`),
  KEY `enterprise_enterpris_enterprise_customer__3b4660ad_fk_enterpris` (`enterprise_customer_id`),
  CONSTRAINT `enterprise_enterpris_enterprise_catalog_q_aa53eb7d_fk_enterpris` FOREIGN KEY (`enterprise_catalog_query_id`) REFERENCES `enterprise_enterprisecatalogquery` (`id`),
  CONSTRAINT `enterprise_enterpris_enterprise_customer__3b4660ad_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_enterprisecustomercatalog`
--

LOCK TABLES `enterprise_enterprisecustomercatalog` WRITE;
/*!40000 ALTER TABLE `enterprise_enterprisecustomercatalog` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_enterprisecustomercatalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_enterprisecustomeridentityprovider`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_enterprisecustomeridentityprovider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `provider_id` varchar(50) NOT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  `default_provider` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `provider_id` (`provider_id`),
  KEY `enterprise_enterprisecustom_enterprise_customer_id_40b39097` (`enterprise_customer_id`),
  CONSTRAINT `enterprise_enterpris_enterprise_customer__40b39097_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_enterprisecustomeridentityprovider`
--

LOCK TABLES `enterprise_enterprisecustomeridentityprovider` WRITE;
/*!40000 ALTER TABLE `enterprise_enterprisecustomeridentityprovider` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_enterprisecustomeridentityprovider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_enterprisecustomerreportingconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_enterprisecustomerreportingconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `uuid` char(32) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `include_date` tinyint(1) NOT NULL,
  `delivery_method` varchar(20) NOT NULL,
  `pgp_encryption_key` longtext,
  `data_type` varchar(20) NOT NULL,
  `report_type` varchar(20) NOT NULL,
  `email` longtext NOT NULL,
  `frequency` varchar(20) NOT NULL,
  `day_of_month` smallint(6) DEFAULT NULL,
  `day_of_week` smallint(6) DEFAULT NULL,
  `hour_of_day` smallint(6) NOT NULL,
  `decrypted_password` longblob,
  `sftp_hostname` varchar(256) DEFAULT NULL,
  `sftp_port` int(10) unsigned DEFAULT NULL,
  `sftp_username` varchar(256) DEFAULT NULL,
  `decrypted_sftp_password` longblob,
  `sftp_file_path` varchar(256) DEFAULT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  `enable_compression` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `enterprise_enterpris_enterprise_customer__d5b55543_fk_enterpris` (`enterprise_customer_id`),
  CONSTRAINT `enterprise_enterpris_enterprise_customer__d5b55543_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_enterprisecustomerreportingconfiguration`
--

LOCK TABLES `enterprise_enterprisecustomerreportingconfiguration` WRITE;
/*!40000 ALTER TABLE `enterprise_enterprisecustomerreportingconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_enterprisecustomerreportingconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_enterprisecustomerreportingconfiguration_enterpricf00`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_enterprisecustomerreportingconfiguration_enterpricf00` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprisecustomerreportingconfiguration_id` int(11) NOT NULL,
  `enterprisecustomercatalog_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_enterprisecus_enterprisecustomerreport_cc87ab4c_uniq` (`enterprisecustomerreportingconfiguration_id`,`enterprisecustomercatalog_id`),
  KEY `enterprise_enterpris_enterprisecustomerca_ebdae525_fk_enterpris` (`enterprisecustomercatalog_id`),
  CONSTRAINT `enterprise_enterpris_enterprisecustomerca_ebdae525_fk_enterpris` FOREIGN KEY (`enterprisecustomercatalog_id`) REFERENCES `enterprise_enterprisecustomercatalog` (`uuid`),
  CONSTRAINT `enterprise_enterpris_enterprisecustomerre_66147101_fk_enterpris` FOREIGN KEY (`enterprisecustomerreportingconfiguration_id`) REFERENCES `enterprise_enterprisecustomerreportingconfiguration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_enterprisecustomerreportingconfiguration_enterpricf00`
--

LOCK TABLES `enterprise_enterprisecustomerreportingconfiguration_enterpricf00` WRITE;
/*!40000 ALTER TABLE `enterprise_enterprisecustomerreportingconfiguration_enterpricf00` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_enterprisecustomerreportingconfiguration_enterpricf00` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_enterprisecustomertype`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_enterprisecustomertype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_enterprisecustomertype`
--

LOCK TABLES `enterprise_enterprisecustomertype` WRITE;
/*!40000 ALTER TABLE `enterprise_enterprisecustomertype` DISABLE KEYS */;
INSERT INTO `enterprise_enterprisecustomertype` VALUES (1,'2021-07-30 19:55:52.656204','2021-07-30 19:55:52.656204','Enterprise');
/*!40000 ALTER TABLE `enterprise_enterprisecustomertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_enterprisecustomeruser`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_enterprisecustomeruser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `active` tinyint(1) NOT NULL,
  `linked` tinyint(1) NOT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_enterprisecus_enterprise_customer_id_u_ffddc29f_uniq` (`enterprise_customer_id`,`user_id`),
  KEY `enterprise_enterprisecustomeruser_user_id_aa8d772f` (`user_id`),
  CONSTRAINT `enterprise_enterpris_enterprise_customer__f0fea924_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_enterprisecustomeruser`
--

LOCK TABLES `enterprise_enterprisecustomeruser` WRITE;
/*!40000 ALTER TABLE `enterprise_enterprisecustomeruser` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_enterprisecustomeruser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_enterpriseenrollmentsource`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_enterpriseenrollmentsource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(64) NOT NULL,
  `slug` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_enterpriseenrollmentsource`
--

LOCK TABLES `enterprise_enterpriseenrollmentsource` WRITE;
/*!40000 ALTER TABLE `enterprise_enterpriseenrollmentsource` DISABLE KEYS */;
INSERT INTO `enterprise_enterpriseenrollmentsource` VALUES (1,'2021-07-30 19:55:53.294357','2021-07-30 19:55:53.294357','Manual Enterprise Enrollment','manual'),(2,'2021-07-30 19:55:53.299502','2021-07-30 19:55:53.299502','Enterprise API Enrollment','enterprise_api'),(3,'2021-07-30 19:55:53.305742','2021-07-30 19:55:53.305742','Enterprise Enrollment URL','enrollment_url'),(4,'2021-07-30 19:55:53.310894','2021-07-30 19:55:53.310894','Enterprise Offer Redemption','offer_redemption'),(5,'2021-07-30 19:55:53.314689','2021-07-30 19:55:53.314689','Enterprise User Enrollment Background Task','enrollment_task'),(6,'2021-07-30 19:55:53.318212','2021-07-30 19:55:53.318212','Enterprise management command enrollment','management_command');
/*!40000 ALTER TABLE `enterprise_enterpriseenrollmentsource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_enterprisefeaturerole`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_enterprisefeaturerole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_enterprisefeaturerole`
--

LOCK TABLES `enterprise_enterprisefeaturerole` WRITE;
/*!40000 ALTER TABLE `enterprise_enterprisefeaturerole` DISABLE KEYS */;
INSERT INTO `enterprise_enterprisefeaturerole` VALUES (1,'2021-07-30 19:55:53.185889','2021-07-30 19:55:53.185889','catalog_admin',NULL),(2,'2021-07-30 19:55:53.189222','2021-07-30 19:55:53.189222','dashboard_admin',NULL),(3,'2021-07-30 19:55:53.192711','2021-07-30 19:55:53.192711','enrollment_api_admin',NULL),(4,'2021-07-30 19:55:53.196386','2021-07-30 19:55:53.196386','reporting_config_admin',NULL);
/*!40000 ALTER TABLE `enterprise_enterprisefeaturerole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_enterprisefeatureuserroleassignment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_enterprisefeatureuserroleassignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `applies_to_all_contexts` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enterprise_enterpris_role_id_5e8cff42_fk_enterpris` (`role_id`),
  KEY `enterprise_enterpris_user_id_2d335bd4_fk_auth_user` (`user_id`),
  CONSTRAINT `enterprise_enterpris_role_id_5e8cff42_fk_enterpris` FOREIGN KEY (`role_id`) REFERENCES `enterprise_enterprisefeaturerole` (`id`),
  CONSTRAINT `enterprise_enterpris_user_id_2d335bd4_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_enterprisefeatureuserroleassignment`
--

LOCK TABLES `enterprise_enterprisefeatureuserroleassignment` WRITE;
/*!40000 ALTER TABLE `enterprise_enterprisefeatureuserroleassignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_enterprisefeatureuserroleassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_historicalenrollmentnotificationemailtemplate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_historicalenrollmentnotificationemailtemplate` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `plaintext_template` longtext NOT NULL,
  `html_template` longtext NOT NULL,
  `subject_line` varchar(100) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_customer_id` char(32) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `template_type` varchar(255) NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `enterprise_historica_history_user_id_f2a6d605_fk_auth_user` (`history_user_id`),
  KEY `enterprise_historicalenroll_id_d4b3fed2` (`id`),
  KEY `enterprise_historicalenroll_enterprise_customer_id_bc826535` (`enterprise_customer_id`),
  CONSTRAINT `enterprise_historica_history_user_id_f2a6d605_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_historicalenrollmentnotificationemailtemplate`
--

LOCK TABLES `enterprise_historicalenrollmentnotificationemailtemplate` WRITE;
/*!40000 ALTER TABLE `enterprise_historicalenrollmentnotificationemailtemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_historicalenrollmentnotificationemailtemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_historicalenterpriseanalyticsuser`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_historicalenterpriseanalyticsuser` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `analytics_user_id` varchar(255) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_customer_user_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `enterprise_historica_history_user_id_749d5e98_fk_auth_user` (`history_user_id`),
  KEY `enterprise_historicalenterpriseanalyticsuser_id_62dc75c5` (`id`),
  KEY `enterprise_historicalenterp_enterprise_customer_user_id_2b116b91` (`enterprise_customer_user_id`),
  CONSTRAINT `enterprise_historica_history_user_id_749d5e98_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_historicalenterpriseanalyticsuser`
--

LOCK TABLES `enterprise_historicalenterpriseanalyticsuser` WRITE;
/*!40000 ALTER TABLE `enterprise_historicalenterpriseanalyticsuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_historicalenterpriseanalyticsuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_historicalenterprisecourseenrollment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_historicalenterprisecourseenrollment` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_customer_user_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `saved_for_later` tinyint(1) NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `enterprise_historica_history_user_id_a7d84786_fk_auth_user` (`history_user_id`),
  KEY `enterprise_historicalenterprisecourseenrollment_id_452a4b04` (`id`),
  KEY `enterprise_historicalenterp_enterprise_customer_user_id_380ecc4e` (`enterprise_customer_user_id`),
  KEY `enterprise_historicalenterp_source_id_015c9e9c` (`source_id`),
  CONSTRAINT `enterprise_historica_history_user_id_a7d84786_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_historicalenterprisecourseenrollment`
--

LOCK TABLES `enterprise_historicalenterprisecourseenrollment` WRITE;
/*!40000 ALTER TABLE `enterprise_historicalenterprisecourseenrollment` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_historicalenterprisecourseenrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_historicalenterprisecustomer`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_historicalenterprisecustomer` (
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `uuid` char(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(30) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `country` varchar(2) DEFAULT NULL,
  `hide_course_original_price` tinyint(1) NOT NULL,
  `enable_data_sharing_consent` tinyint(1) NOT NULL,
  `enforce_data_sharing_consent` varchar(25) NOT NULL,
  `enable_audit_enrollment` tinyint(1) NOT NULL,
  `enable_audit_data_reporting` tinyint(1) NOT NULL,
  `replace_sensitive_sso_username` tinyint(1) NOT NULL,
  `enable_autocohorting` tinyint(1) NOT NULL,
  `enable_portal_code_management_screen` tinyint(1) NOT NULL,
  `enable_portal_reporting_config_screen` tinyint(1) NOT NULL,
  `enable_portal_subscription_management_screen` tinyint(1) NOT NULL,
  `enable_learner_portal` tinyint(1) NOT NULL,
  `contact_email` varchar(254) DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `customer_type_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `enable_slug_login` tinyint(1) NOT NULL,
  `enable_portal_saml_configuration_screen` tinyint(1) NOT NULL,
  `default_contract_discount` decimal(8,5) DEFAULT NULL,
  `enable_analytics_screen` tinyint(1) NOT NULL,
  `enable_integrated_customer_learner_portal_search` tinyint(1) NOT NULL,
  `default_language` varchar(25) DEFAULT NULL,
  `enable_portal_lms_configurations_screen` tinyint(1) NOT NULL,
  `sender_alias` varchar(255) DEFAULT NULL,
  `reply_to` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `enterprise_historica_history_user_id_bbd9b0d6_fk_auth_user` (`history_user_id`),
  KEY `enterprise_historicalenterprisecustomer_uuid_75c3528e` (`uuid`),
  KEY `enterprise_historicalenterprisecustomer_slug_04622dd4` (`slug`),
  KEY `enterprise_historicalenterp_customer_type_id_8fbc8526` (`customer_type_id`),
  KEY `enterprise_historicalenterprisecustomer_site_id_2463b5d7` (`site_id`),
  CONSTRAINT `enterprise_historica_history_user_id_bbd9b0d6_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_historicalenterprisecustomer`
--

LOCK TABLES `enterprise_historicalenterprisecustomer` WRITE;
/*!40000 ALTER TABLE `enterprise_historicalenterprisecustomer` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_historicalenterprisecustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_historicalenterprisecustomercatalog`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_historicalenterprisecustomercatalog` (
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `uuid` char(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content_filter` longtext,
  `enabled_course_modes` longtext NOT NULL,
  `publish_audit_enrollment_urls` tinyint(1) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_catalog_query_id` int(11) DEFAULT NULL,
  `enterprise_customer_id` char(32) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `enterprise_historica_history_user_id_31eab231_fk_auth_user` (`history_user_id`),
  KEY `enterprise_historicalenterprisecustomercatalog_uuid_42403101` (`uuid`),
  KEY `enterprise_historicalenterp_enterprise_catalog_query_id_bf435a3a` (`enterprise_catalog_query_id`),
  KEY `enterprise_historicalenterp_enterprise_customer_id_664f4480` (`enterprise_customer_id`),
  CONSTRAINT `enterprise_historica_history_user_id_31eab231_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_historicalenterprisecustomercatalog`
--

LOCK TABLES `enterprise_historicalenterprisecustomercatalog` WRITE;
/*!40000 ALTER TABLE `enterprise_historicalenterprisecustomercatalog` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_historicalenterprisecustomercatalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_historicalenterprisecustomeruser`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_historicalenterprisecustomeruser` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `active` tinyint(1) NOT NULL,
  `linked` tinyint(1) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_customer_id` char(32) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `enterprise_historica_history_user_id_22dafe08_fk_auth_user` (`history_user_id`),
  KEY `enterprise_historicalenterprisecustomeruser_id_fa66f378` (`id`),
  KEY `enterprise_historicalenterprisecustomeruser_user_id_6262547b` (`user_id`),
  KEY `enterprise_historicalenterp_enterprise_customer_id_4b5807fa` (`enterprise_customer_id`),
  CONSTRAINT `enterprise_historica_history_user_id_22dafe08_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_historicalenterprisecustomeruser`
--

LOCK TABLES `enterprise_historicalenterprisecustomeruser` WRITE;
/*!40000 ALTER TABLE `enterprise_historicalenterprisecustomeruser` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_historicalenterprisecustomeruser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_historicallicensedenterprisecourseenrollment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_historicallicensedenterprisecourseenrollment` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `license_uuid` char(32) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_course_enrollment_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `is_revoked` tinyint(1) NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `enterprise_historica_history_user_id_1db87766_fk_auth_user` (`history_user_id`),
  KEY `enterprise_historicallicens_id_ff4cfd4f` (`id`),
  KEY `enterprise_historicallicens_enterprise_course_enrollmen_1b0d3427` (`enterprise_course_enrollment_id`),
  CONSTRAINT `enterprise_historica_history_user_id_1db87766_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_historicallicensedenterprisecourseenrollment`
--

LOCK TABLES `enterprise_historicallicensedenterprisecourseenrollment` WRITE;
/*!40000 ALTER TABLE `enterprise_historicallicensedenterprisecourseenrollment` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_historicallicensedenterprisecourseenrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_historicalpendingenrollment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_historicalpendingenrollment` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `course_mode` varchar(25) NOT NULL,
  `cohort_name` varchar(255) DEFAULT NULL,
  `discount_percentage` decimal(8,5) NOT NULL,
  `sales_force_id` varchar(255) DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `license_uuid` char(32) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `enterprise_historica_history_user_id_894ad7d0_fk_auth_user` (`history_user_id`),
  KEY `enterprise_historicalpendingenrollment_id_27077b0b` (`id`),
  KEY `enterprise_historicalpendingenrollment_source_id_3a208cd2` (`source_id`),
  KEY `enterprise_historicalpendingenrollment_user_id_97ded265` (`user_id`),
  CONSTRAINT `enterprise_historica_history_user_id_894ad7d0_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_historicalpendingenrollment`
--

LOCK TABLES `enterprise_historicalpendingenrollment` WRITE;
/*!40000 ALTER TABLE `enterprise_historicalpendingenrollment` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_historicalpendingenrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_historicalpendingenterprisecustomeradminuser`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_historicalpendingenterprisecustomeradminuser` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `user_email` varchar(254) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_customer_id` char(32) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `enterprise_historica_history_user_id_3a051cc8_fk_auth_user` (`history_user_id`),
  KEY `enterprise_historicalpendin_id_46b9ceba` (`id`),
  KEY `enterprise_historicalpendin_enterprise_customer_id_885a7c1b` (`enterprise_customer_id`),
  CONSTRAINT `enterprise_historica_history_user_id_3a051cc8_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_historicalpendingenterprisecustomeradminuser`
--

LOCK TABLES `enterprise_historicalpendingenterprisecustomeradminuser` WRITE;
/*!40000 ALTER TABLE `enterprise_historicalpendingenterprisecustomeradminuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_historicalpendingenterprisecustomeradminuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_historicalpendingenterprisecustomeruser`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_historicalpendingenterprisecustomeruser` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `user_email` varchar(254) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_customer_id` char(32) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `enterprise_historica_history_user_id_c491461b_fk_auth_user` (`history_user_id`),
  KEY `enterprise_historicalpendingenterprisecustomeruser_id_3cf88198` (`id`),
  KEY `enterprise_historicalpendin_enterprise_customer_id_6c02ed95` (`enterprise_customer_id`),
  CONSTRAINT `enterprise_historica_history_user_id_c491461b_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_historicalpendingenterprisecustomeruser`
--

LOCK TABLES `enterprise_historicalpendingenterprisecustomeruser` WRITE;
/*!40000 ALTER TABLE `enterprise_historicalpendingenterprisecustomeruser` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_historicalpendingenterprisecustomeruser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_historicalsystemwideenterpriseuserroleassignment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_historicalsystemwideenterpriseuserroleassignment` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `applies_to_all_contexts` tinyint(1) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_customer_id` char(32) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `enterprise_historica_history_user_id_628729af_fk_auth_user` (`history_user_id`),
  KEY `enterprise_historicalsystem_id_56efe6ab` (`id`),
  KEY `enterprise_historicalsystem_enterprise_customer_id_69fcca18` (`enterprise_customer_id`),
  KEY `enterprise_historicalsystem_role_id_6931bef0` (`role_id`),
  KEY `enterprise_historicalsystem_user_id_b184c15e` (`user_id`),
  CONSTRAINT `enterprise_historica_history_user_id_628729af_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_historicalsystemwideenterpriseuserroleassignment`
--

LOCK TABLES `enterprise_historicalsystemwideenterpriseuserroleassignment` WRITE;
/*!40000 ALTER TABLE `enterprise_historicalsystemwideenterpriseuserroleassignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_historicalsystemwideenterpriseuserroleassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_licensedenterprisecourseenrollment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_licensedenterprisecourseenrollment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `license_uuid` char(32) NOT NULL,
  `enterprise_course_enrollment_id` int(11) NOT NULL,
  `is_revoked` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_course_enrollment_id` (`enterprise_course_enrollment_id`),
  CONSTRAINT `enterprise_licensede_enterprise_course_en_db2f5a9f_fk_enterpris` FOREIGN KEY (`enterprise_course_enrollment_id`) REFERENCES `enterprise_enterprisecourseenrollment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_licensedenterprisecourseenrollment`
--

LOCK TABLES `enterprise_licensedenterprisecourseenrollment` WRITE;
/*!40000 ALTER TABLE `enterprise_licensedenterprisecourseenrollment` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_licensedenterprisecourseenrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_pendingenrollment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_pendingenrollment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `course_mode` varchar(25) NOT NULL,
  `cohort_name` varchar(255) DEFAULT NULL,
  `discount_percentage` decimal(8,5) NOT NULL,
  `sales_force_id` varchar(255) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `license_uuid` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_pendingenrollment_user_id_course_id_6d4141c7_uniq` (`user_id`,`course_id`),
  KEY `enterprise_pendingen_source_id_7b6fed0c_fk_enterpris` (`source_id`),
  CONSTRAINT `enterprise_pendingen_source_id_7b6fed0c_fk_enterpris` FOREIGN KEY (`source_id`) REFERENCES `enterprise_enterpriseenrollmentsource` (`id`),
  CONSTRAINT `enterprise_pendingen_user_id_12d21b1a_fk_enterpris` FOREIGN KEY (`user_id`) REFERENCES `enterprise_pendingenterprisecustomeruser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_pendingenrollment`
--

LOCK TABLES `enterprise_pendingenrollment` WRITE;
/*!40000 ALTER TABLE `enterprise_pendingenrollment` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_pendingenrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_pendingenterprisecustomeradminuser`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_pendingenterprisecustomeradminuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `user_email` varchar(254) NOT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique pending admin user and EnterpriseCustomer` (`user_email`,`enterprise_customer_id`),
  KEY `enterprise_pendingenterpris_enterprise_customer_id_aae02661` (`enterprise_customer_id`),
  KEY `enterprise__user_em_fead22_idx` (`user_email`,`enterprise_customer_id`),
  KEY `enterprise__user_em_6e1f5b_idx` (`user_email`),
  CONSTRAINT `enterprise_pendingen_enterprise_customer__aae02661_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_pendingenterprisecustomeradminuser`
--

LOCK TABLES `enterprise_pendingenterprisecustomeradminuser` WRITE;
/*!40000 ALTER TABLE `enterprise_pendingenterprisecustomeradminuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_pendingenterprisecustomeradminuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_pendingenterprisecustomeruser`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_pendingenterprisecustomeruser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `user_email` varchar(254) NOT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique user and EnterpriseCustomer` (`user_email`,`enterprise_customer_id`),
  KEY `enterprise_pendingen_enterprise_customer__a858ce2d_fk_enterpris` (`enterprise_customer_id`),
  KEY `enterprise__user_em_f98d36_idx` (`user_email`,`enterprise_customer_id`),
  KEY `enterprise__user_em_488930_idx` (`user_email`),
  CONSTRAINT `enterprise_pendingen_enterprise_customer__a858ce2d_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_pendingenterprisecustomeruser`
--

LOCK TABLES `enterprise_pendingenterprisecustomeruser` WRITE;
/*!40000 ALTER TABLE `enterprise_pendingenterprisecustomeruser` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_pendingenterprisecustomeruser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_systemwideenterpriserole`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_systemwideenterpriserole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_systemwideenterpriserole`
--

LOCK TABLES `enterprise_systemwideenterpriserole` WRITE;
/*!40000 ALTER TABLE `enterprise_systemwideenterpriserole` DISABLE KEYS */;
INSERT INTO `enterprise_systemwideenterpriserole` VALUES (1,'2021-07-30 19:55:53.172356','2021-07-30 19:55:53.172356','enterprise_admin',NULL),(2,'2021-07-30 19:55:53.177414','2021-07-30 19:55:53.177414','enterprise_learner',NULL),(3,'2021-07-30 19:55:53.181807','2021-07-30 19:55:53.181807','enterprise_openedx_operator',NULL),(4,'2021-07-30 19:55:54.598010','2021-07-30 19:55:54.598010','enterprise_catalog_admin','Role for access to endpoints in the enterprise catalog service');
/*!40000 ALTER TABLE `enterprise_systemwideenterpriserole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_systemwideenterpriseuserroleassignment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_systemwideenterpriseuserroleassignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `applies_to_all_contexts` tinyint(1) NOT NULL,
  `enterprise_customer_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `enterprise_systemwid_user_id_e890aef2_fk_auth_user` (`user_id`),
  KEY `enterprise_systemwid_enterprise_customer__0136c565_fk_enterpris` (`enterprise_customer_id`),
  KEY `enterprise_systemwid_role_id_bc7092f0_fk_enterpris` (`role_id`),
  CONSTRAINT `enterprise_systemwid_enterprise_customer__0136c565_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`),
  CONSTRAINT `enterprise_systemwid_role_id_bc7092f0_fk_enterpris` FOREIGN KEY (`role_id`) REFERENCES `enterprise_systemwideenterpriserole` (`id`),
  CONSTRAINT `enterprise_systemwid_user_id_e890aef2_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_systemwideenterpriseuserroleassignment`
--

LOCK TABLES `enterprise_systemwideenterpriseuserroleassignment` WRITE;
/*!40000 ALTER TABLE `enterprise_systemwideenterpriseuserroleassignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_systemwideenterpriseuserroleassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_updateroleassignmentswithcustomersconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_updateroleassignmentswithcustomersconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `role` varchar(100) NOT NULL,
  `batch_size` int(11) NOT NULL,
  `enterprise_customer_uuid` varchar(36) NOT NULL,
  `dry_run` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `enterprise_updaterol_changed_by_id_1053fb4d_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `enterprise_updaterol_changed_by_id_1053fb4d_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_updateroleassignmentswithcustomersconfig`
--

LOCK TABLES `enterprise_updateroleassignmentswithcustomersconfig` WRITE;
/*!40000 ALTER TABLE `enterprise_updateroleassignmentswithcustomersconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_updateroleassignmentswithcustomersconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entitlements_courseentitlement`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entitlements_courseentitlement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `uuid` char(32) NOT NULL,
  `course_uuid` char(32) NOT NULL,
  `expired_at` datetime(6) DEFAULT NULL,
  `mode` varchar(100) NOT NULL,
  `order_number` varchar(128) DEFAULT NULL,
  `enrollment_course_run_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `_policy_id` int(11) DEFAULT NULL,
  `refund_locked` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entitlements_courseentitlement_uuid_2228ffad_uniq` (`uuid`),
  UNIQUE KEY `entitlements_courseentit_course_uuid_order_number_b37c9e13_uniq` (`course_uuid`,`order_number`),
  KEY `entitlements_courseentitlement_user_id_a518a225_fk_auth_user_id` (`user_id`),
  KEY `entitlements_coursee_enrollment_course_ru_3fc796af_fk_student_c` (`enrollment_course_run_id`),
  KEY `entitlements_coursee__policy_id_37bd7c13_fk_entitleme` (`_policy_id`),
  CONSTRAINT `entitlements_coursee__policy_id_37bd7c13_fk_entitleme` FOREIGN KEY (`_policy_id`) REFERENCES `entitlements_courseentitlementpolicy` (`id`),
  CONSTRAINT `entitlements_coursee_enrollment_course_ru_3fc796af_fk_student_c` FOREIGN KEY (`enrollment_course_run_id`) REFERENCES `student_courseenrollment` (`id`),
  CONSTRAINT `entitlements_courseentitlement_user_id_a518a225_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entitlements_courseentitlement`
--

LOCK TABLES `entitlements_courseentitlement` WRITE;
/*!40000 ALTER TABLE `entitlements_courseentitlement` DISABLE KEYS */;
/*!40000 ALTER TABLE `entitlements_courseentitlement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entitlements_courseentitlementpolicy`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entitlements_courseentitlementpolicy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expiration_period` bigint(20) NOT NULL,
  `refund_period` bigint(20) NOT NULL,
  `regain_period` bigint(20) NOT NULL,
  `site_id` int(11) DEFAULT NULL,
  `mode` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entitlements_coursee_site_id_c7a9e107_fk_django_si` (`site_id`),
  CONSTRAINT `entitlements_coursee_site_id_c7a9e107_fk_django_si` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entitlements_courseentitlementpolicy`
--

LOCK TABLES `entitlements_courseentitlementpolicy` WRITE;
/*!40000 ALTER TABLE `entitlements_courseentitlementpolicy` DISABLE KEYS */;
/*!40000 ALTER TABLE `entitlements_courseentitlementpolicy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entitlements_courseentitlementsupportdetail`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entitlements_courseentitlementsupportdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `reason` varchar(15) NOT NULL,
  `comments` longtext,
  `entitlement_id` int(11) NOT NULL,
  `support_user_id` int(11) NOT NULL,
  `unenrolled_run_id` varchar(255) DEFAULT NULL,
  `action` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entitlements_coursee_entitlement_id_93b9020b_fk_entitleme` (`entitlement_id`),
  KEY `entitlements_coursee_support_user_id_97d3095e_fk_auth_user` (`support_user_id`),
  KEY `entitlements_courseentitlem_unenrolled_run_id_d72860e3` (`unenrolled_run_id`),
  CONSTRAINT `entitlements_coursee_entitlement_id_93b9020b_fk_entitleme` FOREIGN KEY (`entitlement_id`) REFERENCES `entitlements_courseentitlement` (`id`),
  CONSTRAINT `entitlements_coursee_support_user_id_97d3095e_fk_auth_user` FOREIGN KEY (`support_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entitlements_courseentitlementsupportdetail`
--

LOCK TABLES `entitlements_courseentitlementsupportdetail` WRITE;
/*!40000 ALTER TABLE `entitlements_courseentitlementsupportdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `entitlements_courseentitlementsupportdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entitlements_historicalcourseentitlement`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entitlements_historicalcourseentitlement` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `uuid` char(32) NOT NULL,
  `course_uuid` char(32) NOT NULL,
  `expired_at` datetime(6) DEFAULT NULL,
  `mode` varchar(100) NOT NULL,
  `order_number` varchar(128) DEFAULT NULL,
  `refund_locked` tinyint(1) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `_policy_id` int(11) DEFAULT NULL,
  `enrollment_course_run_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `entitlements_histori_history_user_id_a3bc1823_fk_auth_user` (`history_user_id`),
  KEY `entitlements_historicalcourseentitlement_id_e3740062` (`id`),
  KEY `entitlements_historicalcourseentitlement_uuid_54fd331f` (`uuid`),
  KEY `entitlements_historicalcourseentitlement__policy_id_71c21d43` (`_policy_id`),
  KEY `entitlements_historicalcour_enrollment_course_run_id_1b92719b` (`enrollment_course_run_id`),
  KEY `entitlements_historicalcourseentitlement_user_id_c770997b` (`user_id`),
  CONSTRAINT `entitlements_histori_history_user_id_a3bc1823_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entitlements_historicalcourseentitlement`
--

LOCK TABLES `entitlements_historicalcourseentitlement` WRITE;
/*!40000 ALTER TABLE `entitlements_historicalcourseentitlement` DISABLE KEYS */;
/*!40000 ALTER TABLE `entitlements_historicalcourseentitlement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entitlements_historicalcourseentitlementsupportdetail`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entitlements_historicalcourseentitlementsupportdetail` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `reason` varchar(15) NOT NULL,
  `action` varchar(15) NOT NULL,
  `comments` longtext,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `entitlement_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `support_user_id` int(11) DEFAULT NULL,
  `unenrolled_run_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `entitlements_histori_history_user_id_b00a74ce_fk_auth_user` (`history_user_id`),
  KEY `entitlements_historicalcour_id_d019368b` (`id`),
  KEY `entitlements_historicalcour_entitlement_id_a5a6c6cc` (`entitlement_id`),
  KEY `entitlements_historicalcour_support_user_id_8788841f` (`support_user_id`),
  KEY `entitlements_historicalcour_unenrolled_run_id_67b11a08` (`unenrolled_run_id`),
  CONSTRAINT `entitlements_histori_history_user_id_b00a74ce_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entitlements_historicalcourseentitlementsupportdetail`
--

LOCK TABLES `entitlements_historicalcourseentitlementsupportdetail` WRITE;
/*!40000 ALTER TABLE `entitlements_historicalcourseentitlementsupportdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `entitlements_historicalcourseentitlementsupportdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_routing_backends_routerconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_routing_backends_routerconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `backend_name` varchar(50) NOT NULL,
  `configurations` longblob NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `route_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_routing_backen_changed_by_id_32085a77_fk_auth_user` (`changed_by_id`),
  KEY `event_routing_backends_routerconfiguration_backend_name_5d1feedc` (`backend_name`),
  CONSTRAINT `event_routing_backen_changed_by_id_32085a77_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_routing_backends_routerconfiguration`
--

LOCK TABLES `event_routing_backends_routerconfiguration` WRITE;
/*!40000 ALTER TABLE `event_routing_backends_routerconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_routing_backends_routerconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiments_experimentdata`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experiments_experimentdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `experiment_id` smallint(5) unsigned NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `experiments_experimentda_user_id_experiment_id_ke_0ff27a32_uniq` (`user_id`,`experiment_id`,`key`),
  KEY `experiments_experimentdata_user_id_experiment_id_15bd1b30_idx` (`user_id`,`experiment_id`),
  KEY `experiments_experimentdata_experiment_id_e816cee5` (`experiment_id`),
  CONSTRAINT `experiments_experimentdata_user_id_bd6f4720_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiments_experimentdata`
--

LOCK TABLES `experiments_experimentdata` WRITE;
/*!40000 ALTER TABLE `experiments_experimentdata` DISABLE KEYS */;
INSERT INTO `experiments_experimentdata` VALUES (1,'2021-07-30 20:04:36.398637','2021-07-30 20:04:36.398637',18,'course-v1:edX+DemoX+Demo_Course','-1',5),(2,'2021-07-30 20:04:47.664832','2021-07-30 20:04:47.664832',18,'course-v1:edX+DemoX+Demo_Course','-1',6),(3,'2021-07-30 20:04:59.290615','2021-07-30 20:04:59.290615',18,'course-v1:edX+DemoX+Demo_Course','-1',7),(4,'2021-07-30 20:05:10.499358','2021-07-30 20:05:10.499358',18,'course-v1:edX+DemoX+Demo_Course','-1',8);
/*!40000 ALTER TABLE `experiments_experimentdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiments_experimentkeyvalue`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experiments_experimentkeyvalue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `experiment_id` smallint(5) unsigned NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `experiments_experimentkeyvalue_experiment_id_key_15347f43_uniq` (`experiment_id`,`key`),
  KEY `experiments_experimentkeyvalue_experiment_id_741d1a4b` (`experiment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiments_experimentkeyvalue`
--

LOCK TABLES `experiments_experimentkeyvalue` WRITE;
/*!40000 ALTER TABLE `experiments_experimentkeyvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `experiments_experimentkeyvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiments_historicalexperimentkeyvalue`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experiments_historicalexperimentkeyvalue` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `experiment_id` smallint(5) unsigned NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `experiments_historic_history_user_id_3892eb1a_fk_auth_user` (`history_user_id`),
  KEY `experiments_historicalexperimentkeyvalue_id_13f6f6d3` (`id`),
  KEY `experiments_historicalexperimentkeyvalue_experiment_id_6a3c1624` (`experiment_id`),
  CONSTRAINT `experiments_historic_history_user_id_3892eb1a_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiments_historicalexperimentkeyvalue`
--

LOCK TABLES `experiments_historicalexperimentkeyvalue` WRITE;
/*!40000 ALTER TABLE `experiments_historicalexperimentkeyvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `experiments_historicalexperimentkeyvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_user_ids_externalid`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_user_ids_externalid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `external_user_id` char(32) NOT NULL,
  `external_id_type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `external_user_id` (`external_user_id`),
  UNIQUE KEY `external_user_ids_extern_user_id_external_id_type_cf1d16bc_uniq` (`user_id`,`external_id_type_id`),
  KEY `external_user_ids_ex_external_id_type_id_421db1af_fk_external_` (`external_id_type_id`),
  CONSTRAINT `external_user_ids_ex_external_id_type_id_421db1af_fk_external_` FOREIGN KEY (`external_id_type_id`) REFERENCES `external_user_ids_externalidtype` (`id`),
  CONSTRAINT `external_user_ids_externalid_user_id_7789441b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_user_ids_externalid`
--

LOCK TABLES `external_user_ids_externalid` WRITE;
/*!40000 ALTER TABLE `external_user_ids_externalid` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_user_ids_externalid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_user_ids_externalidtype`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_user_ids_externalidtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_user_ids_externalidtype`
--

LOCK TABLES `external_user_ids_externalidtype` WRITE;
/*!40000 ALTER TABLE `external_user_ids_externalidtype` DISABLE KEYS */;
INSERT INTO `external_user_ids_externalidtype` VALUES (1,'2021-07-30 19:57:25.712965','2021-07-30 19:57:25.712965','mb_coaching','MicroBachelors Coaching'),(2,'2021-07-30 19:57:26.154370','2021-07-30 19:57:26.154370','lti','LTI Xblock launches');
/*!40000 ALTER TABLE `external_user_ids_externalidtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_user_ids_historicalexternalid`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_user_ids_historicalexternalid` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `external_user_id` char(32) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `external_id_type_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `external_user_ids_hi_history_user_id_fd67f897_fk_auth_user` (`history_user_id`),
  KEY `external_user_ids_historicalexternalid_id_1444e43e` (`id`),
  KEY `external_user_ids_historicalexternalid_external_user_id_03a5f871` (`external_user_id`),
  KEY `external_user_ids_historica_external_id_type_id_74b65da9` (`external_id_type_id`),
  KEY `external_user_ids_historicalexternalid_user_id_64337ddb` (`user_id`),
  CONSTRAINT `external_user_ids_hi_history_user_id_fd67f897_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_user_ids_historicalexternalid`
--

LOCK TABLES `external_user_ids_historicalexternalid` WRITE;
/*!40000 ALTER TABLE `external_user_ids_historicalexternalid` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_user_ids_historicalexternalid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_user_ids_historicalexternalidtype`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_user_ids_historicalexternalidtype` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` longtext NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `external_user_ids_hi_history_user_id_6a2c78fc_fk_auth_user` (`history_user_id`),
  KEY `external_user_ids_historicalexternalidtype_id_4cc44c83` (`id`),
  KEY `external_user_ids_historicalexternalidtype_name_a2e9fa4e` (`name`),
  CONSTRAINT `external_user_ids_hi_history_user_id_6a2c78fc_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_user_ids_historicalexternalidtype`
--

LOCK TABLES `external_user_ids_historicalexternalidtype` WRITE;
/*!40000 ALTER TABLE `external_user_ids_historicalexternalidtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_user_ids_historicalexternalidtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades_computegradessetting`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grades_computegradessetting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `batch_size` int(11) NOT NULL,
  `course_ids` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `grades_computegrades_changed_by_id_f2bf3678_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `grades_computegrades_changed_by_id_f2bf3678_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades_computegradessetting`
--

LOCK TABLES `grades_computegradessetting` WRITE;
/*!40000 ALTER TABLE `grades_computegradessetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `grades_computegradessetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades_coursepersistentgradesflag`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grades_coursepersistentgradesflag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `grades_coursepersist_changed_by_id_c8c392d6_fk_auth_user` (`changed_by_id`),
  KEY `grades_coursepersistentgradesflag_course_id_b494f1e7` (`course_id`),
  CONSTRAINT `grades_coursepersist_changed_by_id_c8c392d6_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades_coursepersistentgradesflag`
--

LOCK TABLES `grades_coursepersistentgradesflag` WRITE;
/*!40000 ALTER TABLE `grades_coursepersistentgradesflag` DISABLE KEYS */;
/*!40000 ALTER TABLE `grades_coursepersistentgradesflag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades_historicalpersistentsubsectiongradeoverride`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grades_historicalpersistentsubsectiongradeoverride` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `earned_all_override` double DEFAULT NULL,
  `possible_all_override` double DEFAULT NULL,
  `earned_graded_override` double DEFAULT NULL,
  `possible_graded_override` double DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `grade_id` bigint(20) unsigned DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `override_reason` varchar(300) DEFAULT NULL,
  `system` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `grades_historicalper_history_user_id_05000562_fk_auth_user` (`history_user_id`),
  KEY `grades_historicalpersistentsubsectiongradeoverride_id_e30d8953` (`id`),
  KEY `grades_historicalpersistent_created_e5fb4d96` (`created`),
  KEY `grades_historicalpersistent_modified_7355e846` (`modified`),
  KEY `grades_historicalpersistent_grade_id_ecfb45cc` (`grade_id`),
  CONSTRAINT `grades_historicalper_history_user_id_05000562_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades_historicalpersistentsubsectiongradeoverride`
--

LOCK TABLES `grades_historicalpersistentsubsectiongradeoverride` WRITE;
/*!40000 ALTER TABLE `grades_historicalpersistentsubsectiongradeoverride` DISABLE KEYS */;
/*!40000 ALTER TABLE `grades_historicalpersistentsubsectiongradeoverride` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades_persistentcoursegrade`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grades_persistentcoursegrade` (
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `course_edited_timestamp` datetime(6) DEFAULT NULL,
  `course_version` varchar(255) NOT NULL,
  `grading_policy_hash` varchar(255) NOT NULL,
  `percent_grade` double NOT NULL,
  `letter_grade` varchar(255) NOT NULL,
  `passed_timestamp` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grades_persistentcoursegrade_course_id_user_id_d7b585c9_uniq` (`course_id`,`user_id`),
  KEY `grades_persistentcoursegrade_user_id_b2296589` (`user_id`),
  KEY `grades_persistentcoursegr_passed_timestamp_course_i_27d4396e_idx` (`passed_timestamp`,`course_id`),
  KEY `grades_persistentcoursegrade_modified_course_id_0e2ef09a_idx` (`modified`,`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades_persistentcoursegrade`
--

LOCK TABLES `grades_persistentcoursegrade` WRITE;
/*!40000 ALTER TABLE `grades_persistentcoursegrade` DISABLE KEYS */;
/*!40000 ALTER TABLE `grades_persistentcoursegrade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades_persistentgradesenabledflag`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grades_persistentgradesenabledflag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `enabled_for_all_courses` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `grades_persistentgra_changed_by_id_f80cdad1_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `grades_persistentgra_changed_by_id_f80cdad1_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades_persistentgradesenabledflag`
--

LOCK TABLES `grades_persistentgradesenabledflag` WRITE;
/*!40000 ALTER TABLE `grades_persistentgradesenabledflag` DISABLE KEYS */;
/*!40000 ALTER TABLE `grades_persistentgradesenabledflag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades_persistentsubsectiongrade`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grades_persistentsubsectiongrade` (
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `usage_key` varchar(255) NOT NULL,
  `subtree_edited_timestamp` datetime(6) DEFAULT NULL,
  `course_version` varchar(255) NOT NULL,
  `earned_all` double NOT NULL,
  `possible_all` double NOT NULL,
  `earned_graded` double NOT NULL,
  `possible_graded` double NOT NULL,
  `visible_blocks_hash` varchar(100) NOT NULL,
  `first_attempted` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grades_persistentsubsect_course_id_user_id_usage__42820224_uniq` (`course_id`,`user_id`,`usage_key`),
  KEY `grades_persistentsub_visible_blocks_hash_20836274_fk_grades_vi` (`visible_blocks_hash`),
  KEY `grades_persistentsubsecti_modified_course_id_usage__80ab6572_idx` (`modified`,`course_id`,`usage_key`),
  KEY `grades_persistentsubsecti_first_attempted_course_id_f59f063c_idx` (`first_attempted`,`course_id`,`user_id`),
  CONSTRAINT `grades_persistentsub_visible_blocks_hash_20836274_fk_grades_vi` FOREIGN KEY (`visible_blocks_hash`) REFERENCES `grades_visibleblocks` (`hashed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades_persistentsubsectiongrade`
--

LOCK TABLES `grades_persistentsubsectiongrade` WRITE;
/*!40000 ALTER TABLE `grades_persistentsubsectiongrade` DISABLE KEYS */;
/*!40000 ALTER TABLE `grades_persistentsubsectiongrade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades_persistentsubsectiongradeoverride`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grades_persistentsubsectiongradeoverride` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `earned_all_override` double DEFAULT NULL,
  `possible_all_override` double DEFAULT NULL,
  `earned_graded_override` double DEFAULT NULL,
  `possible_graded_override` double DEFAULT NULL,
  `grade_id` bigint(20) unsigned NOT NULL,
  `override_reason` varchar(300) DEFAULT NULL,
  `system` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grade_id` (`grade_id`),
  KEY `grades_persistentsubsectiongradeoverride_created_f80819d0` (`created`),
  KEY `grades_persistentsubsectiongradeoverride_modified_21efde2a` (`modified`),
  CONSTRAINT `grades_persistentsub_grade_id_74123016_fk_grades_pe` FOREIGN KEY (`grade_id`) REFERENCES `grades_persistentsubsectiongrade` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades_persistentsubsectiongradeoverride`
--

LOCK TABLES `grades_persistentsubsectiongradeoverride` WRITE;
/*!40000 ALTER TABLE `grades_persistentsubsectiongradeoverride` DISABLE KEYS */;
/*!40000 ALTER TABLE `grades_persistentsubsectiongradeoverride` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades_visibleblocks`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grades_visibleblocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blocks_json` longtext NOT NULL,
  `hashed` varchar(100) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashed` (`hashed`),
  KEY `grades_visibleblocks_course_id_d5f8e206` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades_visibleblocks`
--

LOCK TABLES `grades_visibleblocks` WRITE;
/*!40000 ALTER TABLE `grades_visibleblocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `grades_visibleblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor_task_gradereportsetting`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor_task_gradereportsetting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `batch_size` int(11) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `instructor_task_grad_changed_by_id_dae9a995_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `instructor_task_grad_changed_by_id_dae9a995_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor_task_gradereportsetting`
--

LOCK TABLES `instructor_task_gradereportsetting` WRITE;
/*!40000 ALTER TABLE `instructor_task_gradereportsetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `instructor_task_gradereportsetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor_task_instructortask`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor_task_instructortask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_type` varchar(50) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `task_key` varchar(255) NOT NULL,
  `task_input` longtext NOT NULL,
  `task_id` varchar(255) NOT NULL,
  `task_state` varchar(50) DEFAULT NULL,
  `task_output` varchar(1024) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `updated` datetime(6) NOT NULL,
  `subtasks` longtext NOT NULL,
  `requester_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `instructor_task_inst_requester_id_307f955d_fk_auth_user` (`requester_id`),
  KEY `instructor_task_instructortask_task_type_cefe183d` (`task_type`),
  KEY `instructor_task_instructortask_course_id_b160f709` (`course_id`),
  KEY `instructor_task_instructortask_task_key_c1af3961` (`task_key`),
  KEY `instructor_task_instructortask_task_id_4aa92d04` (`task_id`),
  KEY `instructor_task_instructortask_task_state_3ee4e9cb` (`task_state`),
  CONSTRAINT `instructor_task_inst_requester_id_307f955d_fk_auth_user` FOREIGN KEY (`requester_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor_task_instructortask`
--

LOCK TABLES `instructor_task_instructortask` WRITE;
/*!40000 ALTER TABLE `instructor_task_instructortask` DISABLE KEYS */;
/*!40000 ALTER TABLE `instructor_task_instructortask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integrated_channel_contentmetadataitemtransmission`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `integrated_channel_contentmetadataitemtransmission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `integrated_channel_code` varchar(30) NOT NULL,
  `content_id` varchar(255) NOT NULL,
  `channel_metadata` longtext NOT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `integrated_channel_conte_enterprise_customer_id_i_44ca3772_uniq` (`enterprise_customer_id`,`integrated_channel_code`,`content_id`),
  CONSTRAINT `integrated_channel_c_enterprise_customer__f6439bfb_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integrated_channel_contentmetadataitemtransmission`
--

LOCK TABLES `integrated_channel_contentmetadataitemtransmission` WRITE;
/*!40000 ALTER TABLE `integrated_channel_contentmetadataitemtransmission` DISABLE KEYS */;
/*!40000 ALTER TABLE `integrated_channel_contentmetadataitemtransmission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integrated_channel_learnerdatatransmissionaudit`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `integrated_channel_learnerdatatransmissionaudit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_course_enrollment_id` int(10) unsigned NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `course_completed` tinyint(1) NOT NULL,
  `completed_timestamp` bigint(20) NOT NULL,
  `instructor_name` varchar(255) NOT NULL,
  `grade` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `error_message` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `subsection_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `integrated_channel_learnerd_enterprise_course_enrollmen_c2e6c2e0` (`enterprise_course_enrollment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integrated_channel_learnerdatatransmissionaudit`
--

LOCK TABLES `integrated_channel_learnerdatatransmissionaudit` WRITE;
/*!40000 ALTER TABLE `integrated_channel_learnerdatatransmissionaudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `integrated_channel_learnerdatatransmissionaudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_sequences_contenterror`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_sequences_contenterror` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usage_key` varchar(255) DEFAULT NULL,
  `message` longtext NOT NULL,
  `publish_report_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `learning_sequences_c_publish_report_id_d0ec7d1b_fk_learning_` (`publish_report_id`),
  CONSTRAINT `learning_sequences_c_publish_report_id_d0ec7d1b_fk_learning_` FOREIGN KEY (`publish_report_id`) REFERENCES `learning_sequences_publishreport` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_sequences_contenterror`
--

LOCK TABLES `learning_sequences_contenterror` WRITE;
/*!40000 ALTER TABLE `learning_sequences_contenterror` DISABLE KEYS */;
/*!40000 ALTER TABLE `learning_sequences_contenterror` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_sequences_coursecontext`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_sequences_coursecontext` (
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `learning_context_id` bigint(20) NOT NULL,
  `course_visibility` varchar(32) NOT NULL,
  `self_paced` tinyint(1) NOT NULL,
  `days_early_for_beta` int(11) DEFAULT NULL,
  `entrance_exam_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`learning_context_id`),
  CONSTRAINT `learning_sequences_c_learning_context_id_fe16b41d_fk_learning_` FOREIGN KEY (`learning_context_id`) REFERENCES `learning_sequences_learningcontext` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_sequences_coursecontext`
--

LOCK TABLES `learning_sequences_coursecontext` WRITE;
/*!40000 ALTER TABLE `learning_sequences_coursecontext` DISABLE KEYS */;
INSERT INTO `learning_sequences_coursecontext` VALUES ('2021-07-30 20:03:24.085812','2021-07-30 20:03:35.393790',1,'private',0,NULL,NULL);
/*!40000 ALTER TABLE `learning_sequences_coursecontext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_sequences_coursesection`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_sequences_coursesection` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ordering` int(10) unsigned NOT NULL,
  `usage_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `title` varchar(1000) NOT NULL,
  `hide_from_toc` tinyint(1) NOT NULL,
  `visible_to_staff_only` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_context_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `learning_sequences_cours_course_context_id_usage__0df8eb59_uniq` (`course_context_id`,`usage_key`),
  KEY `learning_sequences_course_course_context_id_orderin_ee5cfc42_idx` (`course_context_id`,`ordering`),
  CONSTRAINT `learning_sequences_c_course_context_id_f9845b47_fk_learning_` FOREIGN KEY (`course_context_id`) REFERENCES `learning_sequences_coursecontext` (`learning_context_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_sequences_coursesection`
--

LOCK TABLES `learning_sequences_coursesection` WRITE;
/*!40000 ALTER TABLE `learning_sequences_coursesection` DISABLE KEYS */;
INSERT INTO `learning_sequences_coursesection` VALUES (1,0,'block-v1:edX+DemoX+Demo_Course+type@chapter+block@d8a6192ade314473a78242dfeedfbf5b','Introduction',0,0,'2021-07-30 20:03:35.399639','2021-07-30 20:03:35.399639',1),(2,1,'block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations','Example Week 1: Getting Started',0,0,'2021-07-30 20:03:35.407841','2021-07-30 20:03:35.407841',1),(3,2,'block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions','Example Week 2: Get Interactive',0,0,'2021-07-30 20:03:35.415300','2021-07-30 20:03:35.415300',1),(4,3,'block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration','Example Week 3: Be Social',0,0,'2021-07-30 20:03:35.424370','2021-07-30 20:03:35.424370',1),(5,4,'block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7','About Exams and Certificates',0,0,'2021-07-30 20:03:35.429753','2021-07-30 20:03:35.429753',1),(6,5,'block-v1:edX+DemoX+Demo_Course+type@chapter+block@9fca584977d04885bc911ea76a9ef29e','holding section',0,0,'2021-07-30 20:03:35.435435','2021-07-30 20:03:35.435435',1);
/*!40000 ALTER TABLE `learning_sequences_coursesection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_sequences_coursesectionsequence`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_sequences_coursesectionsequence` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ordering` int(10) unsigned NOT NULL,
  `hide_from_toc` tinyint(1) NOT NULL,
  `visible_to_staff_only` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `sequence_id` bigint(20) NOT NULL,
  `inaccessible_after_due` tinyint(1) NOT NULL,
  `course_context_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `learning_sequences_cours_course_context_id_orderi_f233743c_uniq` (`course_context_id`,`ordering`),
  KEY `learning_sequences_c_section_id_646c2074_fk_learning_` (`section_id`),
  KEY `learning_sequences_c_sequence_id_e6a12a64_fk_learning_` (`sequence_id`),
  CONSTRAINT `learning_sequences_c_course_context_id_bb2762af_fk_learning_` FOREIGN KEY (`course_context_id`) REFERENCES `learning_sequences_coursecontext` (`learning_context_id`),
  CONSTRAINT `learning_sequences_c_section_id_646c2074_fk_learning_` FOREIGN KEY (`section_id`) REFERENCES `learning_sequences_coursesection` (`id`),
  CONSTRAINT `learning_sequences_c_sequence_id_e6a12a64_fk_learning_` FOREIGN KEY (`sequence_id`) REFERENCES `learning_sequences_learningsequence` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_sequences_coursesectionsequence`
--

LOCK TABLES `learning_sequences_coursesectionsequence` WRITE;
/*!40000 ALTER TABLE `learning_sequences_coursesectionsequence` DISABLE KEYS */;
INSERT INTO `learning_sequences_coursesectionsequence` VALUES (1,0,0,0,'2021-07-30 20:03:35.499607','2021-07-30 20:03:35.499607',1,1,0,1),(2,1,0,0,'2021-07-30 20:03:35.507573','2021-07-30 20:03:35.507573',2,2,0,1),(3,2,0,0,'2021-07-30 20:03:35.514246','2021-07-30 20:03:35.514246',2,3,0,1),(4,3,0,0,'2021-07-30 20:03:35.520614','2021-07-30 20:03:35.520614',3,4,0,1),(5,4,0,0,'2021-07-30 20:03:35.527469','2021-07-30 20:03:35.527469',3,5,0,1),(6,5,0,0,'2021-07-30 20:03:35.534432','2021-07-30 20:03:35.534432',3,6,0,1),(7,6,0,0,'2021-07-30 20:03:35.540409','2021-07-30 20:03:35.540409',4,7,0,1),(8,7,0,0,'2021-07-30 20:03:35.546974','2021-07-30 20:03:35.546974',4,8,0,1),(9,8,0,0,'2021-07-30 20:03:35.553096','2021-07-30 20:03:35.553096',4,9,0,1),(10,9,0,0,'2021-07-30 20:03:35.558958','2021-07-30 20:03:35.558958',5,10,0,1),(11,10,0,0,'2021-07-30 20:03:35.564969','2021-07-30 20:03:35.564969',6,11,0,1);
/*!40000 ALTER TABLE `learning_sequences_coursesectionsequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_sequences_coursesequenceexam`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_sequences_coursesequenceexam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `is_practice_exam` tinyint(1) NOT NULL,
  `is_proctored_enabled` tinyint(1) NOT NULL,
  `is_time_limited` tinyint(1) NOT NULL,
  `course_section_sequence_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_section_sequence_id` (`course_section_sequence_id`),
  CONSTRAINT `learning_sequences_c_course_section_seque_89ce42a5_fk_learning_` FOREIGN KEY (`course_section_sequence_id`) REFERENCES `learning_sequences_coursesectionsequence` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_sequences_coursesequenceexam`
--

LOCK TABLES `learning_sequences_coursesequenceexam` WRITE;
/*!40000 ALTER TABLE `learning_sequences_coursesequenceexam` DISABLE KEYS */;
/*!40000 ALTER TABLE `learning_sequences_coursesequenceexam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_sequences_learningcontext`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_sequences_learningcontext` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `published_at` datetime(6) NOT NULL,
  `published_version` varchar(255) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `context_key` (`context_key`),
  KEY `learning_se_publish_62319b_idx` (`published_at`),
  KEY `learning_sequences_learningcontext_title_5a70c4cd` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_sequences_learningcontext`
--

LOCK TABLES `learning_sequences_learningcontext` WRITE;
/*!40000 ALTER TABLE `learning_sequences_learningcontext` DISABLE KEYS */;
INSERT INTO `learning_sequences_learningcontext` VALUES (1,'course-v1:edX+DemoX+Demo_Course','Demonstration Course','2021-07-30 20:03:35.279683','61045b17d6207e0a890bc540','2021-07-30 20:03:24.081187','2021-07-30 20:03:35.390690');
/*!40000 ALTER TABLE `learning_sequences_learningcontext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_sequences_learningsequence`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_sequences_learningsequence` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `learning_context_id` bigint(20) NOT NULL,
  `usage_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `title` varchar(1000) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `learning_sequences_learn_learning_context_id_usag_6a13230f_uniq` (`learning_context_id`,`usage_key`),
  CONSTRAINT `learning_sequences_l_learning_context_id_25f3e4ab_fk_learning_` FOREIGN KEY (`learning_context_id`) REFERENCES `learning_sequences_learningcontext` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_sequences_learningsequence`
--

LOCK TABLES `learning_sequences_learningsequence` WRITE;
/*!40000 ALTER TABLE `learning_sequences_learningsequence` DISABLE KEYS */;
INSERT INTO `learning_sequences_learningsequence` VALUES (1,1,'block-v1:edX+DemoX+Demo_Course+type@sequential+block@edx_introduction','Demo Course Overview','2021-07-30 20:03:35.444160','2021-07-30 20:03:35.444160'),(2,1,'block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5','Lesson 1 - Getting Started','2021-07-30 20:03:35.448799','2021-07-30 20:03:35.448799'),(3,1,'block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions','Homework - Question Styles','2021-07-30 20:03:35.455260','2021-07-30 20:03:35.455260'),(4,1,'block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations','Lesson 2 - Let\'s Get Interactive!','2021-07-30 20:03:35.459509','2021-07-30 20:03:35.459509'),(5,1,'block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations','Homework - Labs and Demos','2021-07-30 20:03:35.463542','2021-07-30 20:03:35.463542'),(6,1,'block-v1:edX+DemoX+Demo_Course+type@sequential+block@175e76c4951144a29d46211361266e0e','Homework - Essays','2021-07-30 20:03:35.468256','2021-07-30 20:03:35.468256'),(7,1,'block-v1:edX+DemoX+Demo_Course+type@sequential+block@48ecb924d7fe4b66a230137626bfa93e','Lesson 3 - Be Social','2021-07-30 20:03:35.471963','2021-07-30 20:03:35.471963'),(8,1,'block-v1:edX+DemoX+Demo_Course+type@sequential+block@dbe8fc027bcb4fe9afb744d2e8415855','Homework - Find Your Study Buddy','2021-07-30 20:03:35.477312','2021-07-30 20:03:35.477312'),(9,1,'block-v1:edX+DemoX+Demo_Course+type@sequential+block@6ab9c442501d472c8ed200e367b4edfa','More Ways to Connect','2021-07-30 20:03:35.481381','2021-07-30 20:03:35.481381'),(10,1,'block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow','edX Exams','2021-07-30 20:03:35.485113','2021-07-30 20:03:35.485113'),(11,1,'block-v1:edX+DemoX+Demo_Course+type@sequential+block@07bc32474380492cb34f76e5f9d9a135','New Subsection','2021-07-30 20:03:35.488730','2021-07-30 20:03:35.488730');
/*!40000 ALTER TABLE `learning_sequences_learningsequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_sequences_publishreport`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_sequences_publishreport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_errors` int(10) unsigned NOT NULL,
  `num_sections` int(10) unsigned NOT NULL,
  `num_sequences` int(10) unsigned NOT NULL,
  `learning_context_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `learning_context_id` (`learning_context_id`),
  KEY `learning_sequences_publishreport_num_errors_118a5f55` (`num_errors`),
  KEY `learning_sequences_publishreport_num_sections_ad9e0ae2` (`num_sections`),
  KEY `learning_sequences_publishreport_num_sequences_51743c92` (`num_sequences`),
  CONSTRAINT `learning_sequences_p_learning_context_id_dd7a29fd_fk_learning_` FOREIGN KEY (`learning_context_id`) REFERENCES `learning_sequences_learningcontext` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_sequences_publishreport`
--

LOCK TABLES `learning_sequences_publishreport` WRITE;
/*!40000 ALTER TABLE `learning_sequences_publishreport` DISABLE KEYS */;
INSERT INTO `learning_sequences_publishreport` VALUES (1,0,6,11,1);
/*!40000 ALTER TABLE `learning_sequences_publishreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_sequences_sectionpartitiongroup`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_sequences_sectionpartitiongroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_section_id` bigint(20) NOT NULL,
  `user_partition_group_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `learning_sequences_secti_user_partition_group_id__bf44a405_uniq` (`user_partition_group_id`,`course_section_id`),
  KEY `learning_sequences_s_course_section_id_1e04b4f2_fk_learning_` (`course_section_id`),
  CONSTRAINT `learning_sequences_s_course_section_id_1e04b4f2_fk_learning_` FOREIGN KEY (`course_section_id`) REFERENCES `learning_sequences_coursesection` (`id`),
  CONSTRAINT `learning_sequences_s_user_partition_group_39a895cd_fk_learning_` FOREIGN KEY (`user_partition_group_id`) REFERENCES `learning_sequences_userpartitiongroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_sequences_sectionpartitiongroup`
--

LOCK TABLES `learning_sequences_sectionpartitiongroup` WRITE;
/*!40000 ALTER TABLE `learning_sequences_sectionpartitiongroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `learning_sequences_sectionpartitiongroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_sequences_sectionsequencepartitiongroup`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_sequences_sectionsequencepartitiongroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_section_sequence_id` bigint(20) NOT NULL,
  `user_partition_group_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `learning_sequences_secti_user_partition_group_id__44a79d57_uniq` (`user_partition_group_id`,`course_section_sequence_id`),
  KEY `learning_sequences_s_course_section_seque_555798e5_fk_learning_` (`course_section_sequence_id`),
  CONSTRAINT `learning_sequences_s_course_section_seque_555798e5_fk_learning_` FOREIGN KEY (`course_section_sequence_id`) REFERENCES `learning_sequences_coursesectionsequence` (`id`),
  CONSTRAINT `learning_sequences_s_user_partition_group_28eb4c91_fk_learning_` FOREIGN KEY (`user_partition_group_id`) REFERENCES `learning_sequences_userpartitiongroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_sequences_sectionsequencepartitiongroup`
--

LOCK TABLES `learning_sequences_sectionsequencepartitiongroup` WRITE;
/*!40000 ALTER TABLE `learning_sequences_sectionsequencepartitiongroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `learning_sequences_sectionsequencepartitiongroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_sequences_userpartitiongroup`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_sequences_userpartitiongroup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `partition_id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `learning_sequences_userp_partition_id_group_id_a152e36f_uniq` (`partition_id`,`group_id`),
  KEY `learning_se_partiti_6e2d28_idx` (`partition_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_sequences_userpartitiongroup`
--

LOCK TABLES `learning_sequences_userpartitiongroup` WRITE;
/*!40000 ALTER TABLE `learning_sequences_userpartitiongroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `learning_sequences_userpartitiongroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lms_xblock_xblockasidesconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lms_xblock_xblockasidesconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `disabled_blocks` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lms_xblock_xblockasi_changed_by_id_71928be3_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `lms_xblock_xblockasi_changed_by_id_71928be3_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lms_xblock_xblockasidesconfig`
--

LOCK TABLES `lms_xblock_xblockasidesconfig` WRITE;
/*!40000 ALTER TABLE `lms_xblock_xblockasidesconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `lms_xblock_xblockasidesconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti_consumer_ltiagslineitem`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti_consumer_ltiagslineitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` varchar(100) NOT NULL,
  `resource_link_id` varchar(255) DEFAULT NULL,
  `label` varchar(100) NOT NULL,
  `score_maximum` int(11) NOT NULL,
  `tag` varchar(50) NOT NULL,
  `start_date_time` datetime(6) DEFAULT NULL,
  `end_date_time` datetime(6) DEFAULT NULL,
  `lti_configuration_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lti_consumer_ltiagsl_lti_configuration_id_03e605a4_fk_lti_consu` (`lti_configuration_id`),
  KEY `lti_consumer_ltiagslineitem_resource_link_id_39f87e2f` (`resource_link_id`),
  CONSTRAINT `lti_consumer_ltiagsl_lti_configuration_id_03e605a4_fk_lti_consu` FOREIGN KEY (`lti_configuration_id`) REFERENCES `lti_consumer_lticonfiguration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti_consumer_ltiagslineitem`
--

LOCK TABLES `lti_consumer_ltiagslineitem` WRITE;
/*!40000 ALTER TABLE `lti_consumer_ltiagslineitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `lti_consumer_ltiagslineitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti_consumer_ltiagsscore`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti_consumer_ltiagsscore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime(6) NOT NULL,
  `score_given` double DEFAULT NULL,
  `score_maximum` double DEFAULT NULL,
  `comment` longtext,
  `activity_progress` varchar(20) NOT NULL,
  `grading_progress` varchar(20) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `line_item_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lti_consumer_ltiagsscore_line_item_id_user_id_887a73e4_uniq` (`line_item_id`,`user_id`),
  CONSTRAINT `lti_consumer_ltiagss_line_item_id_168433dc_fk_lti_consu` FOREIGN KEY (`line_item_id`) REFERENCES `lti_consumer_ltiagslineitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti_consumer_ltiagsscore`
--

LOCK TABLES `lti_consumer_ltiagsscore` WRITE;
/*!40000 ALTER TABLE `lti_consumer_ltiagsscore` DISABLE KEYS */;
/*!40000 ALTER TABLE `lti_consumer_ltiagsscore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti_consumer_lticonfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti_consumer_lticonfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(10) NOT NULL,
  `config_store` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `lti_1p3_internal_private_key` longtext NOT NULL,
  `lti_1p3_internal_private_key_id` varchar(255) NOT NULL,
  `lti_1p3_internal_public_jwk` longtext NOT NULL,
  `lti_1p3_client_id` varchar(255) NOT NULL,
  `config_id` char(32) NOT NULL,
  `lti_1p1_client_key` varchar(255) NOT NULL,
  `lti_1p1_client_secret` varchar(255) NOT NULL,
  `lti_1p1_launch_url` varchar(255) NOT NULL,
  `lti_config` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lti_consumer_lticonfiguration_config_id_7e375962_uniq` (`config_id`),
  KEY `lti_consumer_lticonfiguration_location_e7e37735` (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti_consumer_lticonfiguration`
--

LOCK TABLES `lti_consumer_lticonfiguration` WRITE;
/*!40000 ALTER TABLE `lti_consumer_lticonfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `lti_consumer_lticonfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti_consumer_ltidlcontentitem`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti_consumer_ltidlcontentitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_type` varchar(255) NOT NULL,
  `attributes` longtext NOT NULL,
  `lti_configuration_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lti_consumer_ltidlco_lti_configuration_id_887d35fa_fk_lti_consu` (`lti_configuration_id`),
  CONSTRAINT `lti_consumer_ltidlco_lti_configuration_id_887d35fa_fk_lti_consu` FOREIGN KEY (`lti_configuration_id`) REFERENCES `lti_consumer_lticonfiguration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti_consumer_ltidlcontentitem`
--

LOCK TABLES `lti_consumer_ltidlcontentitem` WRITE;
/*!40000 ALTER TABLE `lti_consumer_ltidlcontentitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `lti_consumer_ltidlcontentitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestones_coursecontentmilestone`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `milestones_coursecontentmilestone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `content_id` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `milestone_id` int(11) NOT NULL,
  `milestone_relationship_type_id` int(11) NOT NULL,
  `requirements` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `milestones_coursecontent_course_id_content_id_mil_7caa5ba5_uniq` (`course_id`,`content_id`,`milestone_id`),
  KEY `milestones_coursecontentmilestone_course_id_6fd3fad0` (`course_id`),
  KEY `milestones_coursecontentmilestone_content_id_21f4c95f` (`content_id`),
  KEY `milestones_coursecon_milestone_id_bd7a608b_fk_milestone` (`milestone_id`),
  KEY `milestones_coursecon_milestone_relationsh_31556ebf_fk_milestone` (`milestone_relationship_type_id`),
  KEY `milestones_coursecontentmilestone_active_b7ab709d` (`active`),
  CONSTRAINT `milestones_coursecon_milestone_id_bd7a608b_fk_milestone` FOREIGN KEY (`milestone_id`) REFERENCES `milestones_milestone` (`id`),
  CONSTRAINT `milestones_coursecon_milestone_relationsh_31556ebf_fk_milestone` FOREIGN KEY (`milestone_relationship_type_id`) REFERENCES `milestones_milestonerelationshiptype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestones_coursecontentmilestone`
--

LOCK TABLES `milestones_coursecontentmilestone` WRITE;
/*!40000 ALTER TABLE `milestones_coursecontentmilestone` DISABLE KEYS */;
/*!40000 ALTER TABLE `milestones_coursecontentmilestone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestones_coursemilestone`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `milestones_coursemilestone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `milestone_id` int(11) NOT NULL,
  `milestone_relationship_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `milestones_coursemilestone_course_id_milestone_id_36b21ae8_uniq` (`course_id`,`milestone_id`),
  KEY `milestones_coursemilestone_course_id_ce46a0fc` (`course_id`),
  KEY `milestones_coursemil_milestone_id_03d9ef01_fk_milestone` (`milestone_id`),
  KEY `milestones_coursemil_milestone_relationsh_6c64b782_fk_milestone` (`milestone_relationship_type_id`),
  KEY `milestones_coursemilestone_active_c590442e` (`active`),
  CONSTRAINT `milestones_coursemil_milestone_id_03d9ef01_fk_milestone` FOREIGN KEY (`milestone_id`) REFERENCES `milestones_milestone` (`id`),
  CONSTRAINT `milestones_coursemil_milestone_relationsh_6c64b782_fk_milestone` FOREIGN KEY (`milestone_relationship_type_id`) REFERENCES `milestones_milestonerelationshiptype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestones_coursemilestone`
--

LOCK TABLES `milestones_coursemilestone` WRITE;
/*!40000 ALTER TABLE `milestones_coursemilestone` DISABLE KEYS */;
/*!40000 ALTER TABLE `milestones_coursemilestone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestones_milestone`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `milestones_milestone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `milestones_milestone_namespace_name_0b80f867_uniq` (`namespace`,`name`),
  KEY `milestones_milestone_namespace_a8e8807c` (`namespace`),
  KEY `milestones_milestone_name_23fb0698` (`name`),
  KEY `milestones_milestone_active_9a6c1703` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestones_milestone`
--

LOCK TABLES `milestones_milestone` WRITE;
/*!40000 ALTER TABLE `milestones_milestone` DISABLE KEYS */;
/*!40000 ALTER TABLE `milestones_milestone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestones_milestonerelationshiptype`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `milestones_milestonerelationshiptype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(25) NOT NULL,
  `description` longtext NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestones_milestonerelationshiptype`
--

LOCK TABLES `milestones_milestonerelationshiptype` WRITE;
/*!40000 ALTER TABLE `milestones_milestonerelationshiptype` DISABLE KEYS */;
INSERT INTO `milestones_milestonerelationshiptype` VALUES (1,'2021-07-30 19:57:37.465864','2021-07-30 19:57:37.465864','requires','Autogenerated milestone relationship type \"requires\"',1),(2,'2021-07-30 19:57:37.474848','2021-07-30 19:57:37.474848','fulfills','Autogenerated milestone relationship type \"fulfills\"',1);
/*!40000 ALTER TABLE `milestones_milestonerelationshiptype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestones_usermilestone`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `milestones_usermilestone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `source` longtext NOT NULL,
  `collected` datetime(6) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `milestone_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `milestones_usermilestone_user_id_milestone_id_02197f01_uniq` (`user_id`,`milestone_id`),
  KEY `milestones_usermiles_milestone_id_f90f9430_fk_milestone` (`milestone_id`),
  KEY `milestones_usermilestone_user_id_b3e9aef4` (`user_id`),
  KEY `milestones_usermilestone_active_93a18e7f` (`active`),
  CONSTRAINT `milestones_usermiles_milestone_id_f90f9430_fk_milestone` FOREIGN KEY (`milestone_id`) REFERENCES `milestones_milestone` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestones_usermilestone`
--

LOCK TABLES `milestones_usermilestone` WRITE;
/*!40000 ALTER TABLE `milestones_usermilestone` DISABLE KEYS */;
/*!40000 ALTER TABLE `milestones_usermilestone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobile_api_appversionconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobile_api_appversionconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platform` varchar(50) NOT NULL,
  `version` varchar(50) NOT NULL,
  `major_version` int(11) NOT NULL,
  `minor_version` int(11) NOT NULL,
  `patch_version` int(11) NOT NULL,
  `expire_at` datetime(6) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile_api_appversionconfig_platform_version_6b577430_uniq` (`platform`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobile_api_appversionconfig`
--

LOCK TABLES `mobile_api_appversionconfig` WRITE;
/*!40000 ALTER TABLE `mobile_api_appversionconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `mobile_api_appversionconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobile_api_ignoremobileavailableflagconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobile_api_ignoremobileavailableflagconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mobile_api_ignoremob_changed_by_id_4ca9c0d6_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `mobile_api_ignoremob_changed_by_id_4ca9c0d6_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobile_api_ignoremobileavailableflagconfig`
--

LOCK TABLES `mobile_api_ignoremobileavailableflagconfig` WRITE;
/*!40000 ALTER TABLE `mobile_api_ignoremobileavailableflagconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `mobile_api_ignoremobileavailableflagconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobile_api_mobileapiconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobile_api_mobileapiconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `video_profiles` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mobile_api_mobileapi_changed_by_id_8799981a_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `mobile_api_mobileapi_changed_by_id_8799981a_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobile_api_mobileapiconfig`
--

LOCK TABLES `mobile_api_mobileapiconfig` WRITE;
/*!40000 ALTER TABLE `mobile_api_mobileapiconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `mobile_api_mobileapiconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moodle_historicalmoodleenterprisecustomerconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moodle_historicalmoodleenterprisecustomerconfiguration` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `transmission_chunk_size` int(11) NOT NULL,
  `channel_worker_username` varchar(255) DEFAULT NULL,
  `catalogs_to_transmit` longtext,
  `moodle_base_url` varchar(255) NOT NULL,
  `service_short_name` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_customer_id` char(32) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `moodle_historicalmoo_history_user_id_22017ee9_fk_auth_user` (`history_user_id`),
  KEY `moodle_historicalmoodleente_id_71ddc422` (`id`),
  KEY `moodle_historicalmoodleente_enterprise_customer_id_a816d974` (`enterprise_customer_id`),
  CONSTRAINT `moodle_historicalmoo_history_user_id_22017ee9_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moodle_historicalmoodleenterprisecustomerconfiguration`
--

LOCK TABLES `moodle_historicalmoodleenterprisecustomerconfiguration` WRITE;
/*!40000 ALTER TABLE `moodle_historicalmoodleenterprisecustomerconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `moodle_historicalmoodleenterprisecustomerconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moodle_moodleenterprisecustomerconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moodle_moodleenterprisecustomerconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `transmission_chunk_size` int(11) NOT NULL,
  `channel_worker_username` varchar(255) DEFAULT NULL,
  `catalogs_to_transmit` longtext,
  `moodle_base_url` varchar(255) NOT NULL,
  `service_short_name` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_customer_id` (`enterprise_customer_id`),
  CONSTRAINT `moodle_moodleenterpr_enterprise_customer__6668537b_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moodle_moodleenterprisecustomerconfiguration`
--

LOCK TABLES `moodle_moodleenterprisecustomerconfiguration` WRITE;
/*!40000 ALTER TABLE `moodle_moodleenterprisecustomerconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `moodle_moodleenterprisecustomerconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moodle_moodlelearnerdatatransmissionaudit`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moodle_moodlelearnerdatatransmissionaudit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `moodle_user_email` varchar(255) NOT NULL,
  `enterprise_course_enrollment_id` int(10) unsigned NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `grade` decimal(3,2) DEFAULT NULL,
  `total_hours` double DEFAULT NULL,
  `course_completed` tinyint(1) NOT NULL,
  `completed_timestamp` varchar(10) NOT NULL,
  `status` varchar(100) NOT NULL,
  `error_message` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `moodle_moodlelearnerdatatra_enterprise_course_enrollmen_70fa10d7` (`enterprise_course_enrollment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moodle_moodlelearnerdatatransmissionaudit`
--

LOCK TABLES `moodle_moodlelearnerdatatransmissionaudit` WRITE;
/*!40000 ALTER TABLE `moodle_moodlelearnerdatatransmissionaudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `moodle_moodlelearnerdatatransmissionaudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notify_notification`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notify_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` longtext NOT NULL,
  `url` varchar(200) DEFAULT NULL,
  `is_viewed` tinyint(1) NOT NULL,
  `is_emailed` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `subscription_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notify_notification_subscription_id_0eae0084_fk_notify_su` (`subscription_id`),
  CONSTRAINT `notify_notification_subscription_id_0eae0084_fk_notify_su` FOREIGN KEY (`subscription_id`) REFERENCES `notify_subscription` (`subscription_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notify_notification`
--

LOCK TABLES `notify_notification` WRITE;
/*!40000 ALTER TABLE `notify_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notify_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notify_notificationtype`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notify_notificationtype` (
  `key` varchar(128) NOT NULL,
  `label` varchar(128) DEFAULT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`key`),
  KEY `notify_notificationt_content_type_id_f575bac5_fk_django_co` (`content_type_id`),
  CONSTRAINT `notify_notificationt_content_type_id_f575bac5_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notify_notificationtype`
--

LOCK TABLES `notify_notificationtype` WRITE;
/*!40000 ALTER TABLE `notify_notificationtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `notify_notificationtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notify_settings`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notify_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interval` smallint(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notify_settings_user_id_088ebffc_fk_auth_user_id` (`user_id`),
  CONSTRAINT `notify_settings_user_id_088ebffc_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notify_settings`
--

LOCK TABLES `notify_settings` WRITE;
/*!40000 ALTER TABLE `notify_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `notify_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notify_subscription`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notify_subscription` (
  `subscription_id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` varchar(64) DEFAULT NULL,
  `send_emails` tinyint(1) NOT NULL,
  `notification_type_id` varchar(128) NOT NULL,
  `settings_id` int(11) NOT NULL,
  PRIMARY KEY (`subscription_id`),
  KEY `notify_subscription_notification_type_id_f73a8b13_fk_notify_no` (`notification_type_id`),
  KEY `notify_subscription_settings_id_dbc3961d_fk_notify_settings_id` (`settings_id`),
  CONSTRAINT `notify_subscription_notification_type_id_f73a8b13_fk_notify_no` FOREIGN KEY (`notification_type_id`) REFERENCES `notify_notificationtype` (`key`),
  CONSTRAINT `notify_subscription_settings_id_dbc3961d_fk_notify_settings_id` FOREIGN KEY (`settings_id`) REFERENCES `notify_settings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notify_subscription`
--

LOCK TABLES `notify_subscription` WRITE;
/*!40000 ALTER TABLE `notify_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `notify_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_accesstoken`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_provider_accesstoken` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext NOT NULL,
  `application_id` bigint(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `source_refresh_token_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  UNIQUE KEY `source_refresh_token_id` (`source_refresh_token_id`),
  KEY `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr` FOREIGN KEY (`source_refresh_token_id`) REFERENCES `oauth2_provider_refreshtoken` (`id`),
  CONSTRAINT `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_accesstoken` VALUES (1,'VBoA9dtTKCiki7JXnB0lOQAuh8Yi2t','2021-07-31 06:19:59.431909','read write email profile',4,1,'2021-07-30 20:19:59.424167','2021-07-30 20:19:59.433966',NULL);
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_application`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_provider_application` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) NOT NULL,
  `redirect_uris` longtext NOT NULL,
  `client_type` varchar(32) NOT NULL,
  `authorization_grant_type` varchar(32) NOT NULL,
  `client_secret` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `oauth2_provider_application_user_id_79829054_fk_auth_user_id` (`user_id`),
  KEY `oauth2_provider_application_client_secret_53133678` (`client_secret`),
  CONSTRAINT `oauth2_provider_application_user_id_79829054_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_application`
--

LOCK TABLES `oauth2_provider_application` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_application` DISABLE KEYS */;
INSERT INTO `oauth2_provider_application` VALUES (1,'login-service-client-id','','public','password','X4L6BKKf0JgMn1TH0BFnmFLnKRplLYKmUYbqGc2qQLRIGzFjGiwQMPnIOyHMLiW6A8qsVX9mshchCUCcQGLELj5O4eZKCeeEacHON8JikewexicMCCw22gtxwkO4eGPu','Login Service for JWT Cookies',2,0,'2021-07-30 19:58:11.944124','2021-07-30 19:58:11.944166'),(2,'AjEA1P865dsBif42kQYMWJiLLGKQSVSYXy5X6o1V','','confidential','client-credentials','sZuhQuuV3QtpgpXqY6wXrPhB09R81Ijk8CBfzoSP9NER1xYEoLBaqKSggXzvCCjjIKOmytxV6Is3ClqqKMmRZtXTau7r9jrx5dfdgXRCGMSEIFy4xrWOC7Af3F8JP3jY','retirement',9,0,'2021-07-30 20:15:27.098232','2021-07-30 20:15:27.098284'),(3,'ecommerce-sso-key','http://localhost:18130/complete/edx-oauth2/','confidential','authorization-code','ecommerce-sso-secret','ecommerce-sso',1,1,'2021-07-30 20:18:16.419993','2021-07-30 20:18:16.420058'),(4,'ecommerce-backend-service-key','','confidential','client-credentials','ecommerce-backend-service-secret','ecommerce-backend-service',1,0,'2021-07-30 20:18:28.452549','2021-07-30 20:18:28.452606');
/*!40000 ALTER TABLE `oauth2_provider_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_grant`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_provider_grant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `expires` datetime(6) NOT NULL,
  `redirect_uri` varchar(255) NOT NULL,
  `scope` longtext NOT NULL,
  `application_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `code_challenge` varchar(128) NOT NULL,
  `code_challenge_method` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_grant`
--

LOCK TABLES `oauth2_provider_grant` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_grant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_refreshtoken`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_provider_refreshtoken` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `access_token_id` bigint(20) DEFAULT NULL,
  `application_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `revoked` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token_id` (`access_token_id`),
  UNIQUE KEY `oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq` (`token`,`revoked`),
  KEY `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`),
  CONSTRAINT `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_dispatch_applicationaccess`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_dispatch_applicationaccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scopes` varchar(825) NOT NULL,
  `application_id` bigint(20) NOT NULL,
  `filters` varchar(825) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `application_id` (`application_id`),
  CONSTRAINT `oauth_dispatch_appli_application_id_dcddee6e_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_dispatch_applicationaccess`
--

LOCK TABLES `oauth_dispatch_applicationaccess` WRITE;
/*!40000 ALTER TABLE `oauth_dispatch_applicationaccess` DISABLE KEYS */;
INSERT INTO `oauth_dispatch_applicationaccess` VALUES (1,'user_id',3,NULL);
/*!40000 ALTER TABLE `oauth_dispatch_applicationaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_dispatch_applicationorganization`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_dispatch_applicationorganization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relation_type` varchar(32) NOT NULL,
  `application_id` bigint(20) NOT NULL,
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth_dispatch_applicati_application_id_relation__1b4017f2_uniq` (`application_id`,`relation_type`,`organization_id`),
  KEY `oauth_dispatch_appli_organization_id_fe63a7f2_fk_organizat` (`organization_id`),
  CONSTRAINT `oauth_dispatch_appli_application_id_dea619c6_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth_dispatch_appli_organization_id_fe63a7f2_fk_organizat` FOREIGN KEY (`organization_id`) REFERENCES `organizations_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_dispatch_applicationorganization`
--

LOCK TABLES `oauth_dispatch_applicationorganization` WRITE;
/*!40000 ALTER TABLE `oauth_dispatch_applicationorganization` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_dispatch_applicationorganization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_dispatch_restrictedapplication`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_dispatch_restrictedapplication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_dispatch_restr_application_id_6b8d0930_fk_oauth2_pr` (`application_id`),
  CONSTRAINT `oauth_dispatch_restr_application_id_6b8d0930_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_dispatch_restrictedapplication`
--

LOCK TABLES `oauth_dispatch_restrictedapplication` WRITE;
/*!40000 ALTER TABLE `oauth_dispatch_restrictedapplication` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_dispatch_restrictedapplication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations_historicalorganization`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizations_historicalorganization` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_name` varchar(255) NOT NULL,
  `description` longtext,
  `logo` longtext,
  `active` tinyint(1) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `organizations_histor_history_user_id_bb516493_fk_auth_user` (`history_user_id`),
  KEY `organizations_historicalorganization_id_4327d8f9` (`id`),
  KEY `organizations_historicalorganization_name_5f4e354b` (`name`),
  KEY `organizations_historicalorganization_short_name_07087b46` (`short_name`),
  CONSTRAINT `organizations_histor_history_user_id_bb516493_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations_historicalorganization`
--

LOCK TABLES `organizations_historicalorganization` WRITE;
/*!40000 ALTER TABLE `organizations_historicalorganization` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizations_historicalorganization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations_historicalorganizationcourse`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizations_historicalorganizationcourse` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `organizations_histor_history_user_id_0f165c1b_fk_auth_user` (`history_user_id`),
  KEY `organizations_historicalorganizationcourse_id_9a1564c8` (`id`),
  KEY `organizations_historicalorganizationcourse_course_id_4c93708c` (`course_id`),
  KEY `organizations_historicalorg_organization_id_7cc0ed83` (`organization_id`),
  CONSTRAINT `organizations_histor_history_user_id_0f165c1b_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations_historicalorganizationcourse`
--

LOCK TABLES `organizations_historicalorganizationcourse` WRITE;
/*!40000 ALTER TABLE `organizations_historicalorganizationcourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizations_historicalorganizationcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations_organization`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizations_organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_name` varchar(255) NOT NULL,
  `description` longtext,
  `logo` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `organizations_organization_short_name_ef338963_uniq` (`short_name`),
  KEY `organizations_organization_name_71edc74b` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations_organization`
--

LOCK TABLES `organizations_organization` WRITE;
/*!40000 ALTER TABLE `organizations_organization` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizations_organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations_organizationcourse`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizations_organizationcourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `organizations_organizati_course_id_organization_i_06b1db31_uniq` (`course_id`,`organization_id`),
  KEY `organizations_organi_organization_id_99e77fe0_fk_organizat` (`organization_id`),
  KEY `organizations_organizationcourse_course_id_227b73bc` (`course_id`),
  CONSTRAINT `organizations_organi_organization_id_99e77fe0_fk_organizat` FOREIGN KEY (`organization_id`) REFERENCES `organizations_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations_organizationcourse`
--

LOCK TABLES `organizations_organizationcourse` WRITE;
/*!40000 ALTER TABLE `organizations_organizationcourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizations_organizationcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proctoring_proctoredexam`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proctoring_proctoredexam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `content_id` varchar(255) NOT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `exam_name` longtext NOT NULL,
  `time_limit_mins` int(11) NOT NULL,
  `due_date` datetime(6) DEFAULT NULL,
  `is_proctored` tinyint(1) NOT NULL,
  `is_practice_exam` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `hide_after_due` tinyint(1) NOT NULL,
  `backend` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `proctoring_proctoredexam_course_id_content_id_1d8358cc_uniq` (`course_id`,`content_id`),
  KEY `proctoring_proctoredexam_course_id_8787b34f` (`course_id`),
  KEY `proctoring_proctoredexam_content_id_13d3bec4` (`content_id`),
  KEY `proctoring_proctoredexam_external_id_0181c110` (`external_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proctoring_proctoredexam`
--

LOCK TABLES `proctoring_proctoredexam` WRITE;
/*!40000 ALTER TABLE `proctoring_proctoredexam` DISABLE KEYS */;
/*!40000 ALTER TABLE `proctoring_proctoredexam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proctoring_proctoredexamreviewpolicy`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proctoring_proctoredexamreviewpolicy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `review_policy` longtext NOT NULL,
  `proctored_exam_id` int(11) NOT NULL,
  `set_by_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `proctoring_proctored_proctored_exam_id_57f9ce30_fk_proctorin` (`proctored_exam_id`),
  KEY `proctoring_proctored_set_by_user_id_7c101300_fk_auth_user` (`set_by_user_id`),
  CONSTRAINT `proctoring_proctored_proctored_exam_id_57f9ce30_fk_proctorin` FOREIGN KEY (`proctored_exam_id`) REFERENCES `proctoring_proctoredexam` (`id`),
  CONSTRAINT `proctoring_proctored_set_by_user_id_7c101300_fk_auth_user` FOREIGN KEY (`set_by_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proctoring_proctoredexamreviewpolicy`
--

LOCK TABLES `proctoring_proctoredexamreviewpolicy` WRITE;
/*!40000 ALTER TABLE `proctoring_proctoredexamreviewpolicy` DISABLE KEYS */;
/*!40000 ALTER TABLE `proctoring_proctoredexamreviewpolicy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proctoring_proctoredexamreviewpolicyhistory`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proctoring_proctoredexamreviewpolicyhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `original_id` int(11) NOT NULL,
  `review_policy` longtext NOT NULL,
  `proctored_exam_id` int(11) NOT NULL,
  `set_by_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `proctoring_proctored_proctored_exam_id_8126b616_fk_proctorin` (`proctored_exam_id`),
  KEY `proctoring_proctored_set_by_user_id_42ce126e_fk_auth_user` (`set_by_user_id`),
  KEY `proctoring_proctoredexamreviewpolicyhistory_original_id_ca04913d` (`original_id`),
  CONSTRAINT `proctoring_proctored_proctored_exam_id_8126b616_fk_proctorin` FOREIGN KEY (`proctored_exam_id`) REFERENCES `proctoring_proctoredexam` (`id`),
  CONSTRAINT `proctoring_proctored_set_by_user_id_42ce126e_fk_auth_user` FOREIGN KEY (`set_by_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proctoring_proctoredexamreviewpolicyhistory`
--

LOCK TABLES `proctoring_proctoredexamreviewpolicyhistory` WRITE;
/*!40000 ALTER TABLE `proctoring_proctoredexamreviewpolicyhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `proctoring_proctoredexamreviewpolicyhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proctoring_proctoredexamsoftwaresecurereview`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proctoring_proctoredexamsoftwaresecurereview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `attempt_code` varchar(255) NOT NULL,
  `review_status` varchar(255) NOT NULL,
  `raw_data` longtext NOT NULL,
  `video_url` longtext NOT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `reviewed_by_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `is_attempt_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `proctoring_proctoredexam_attempt_code_706d3717_uniq` (`attempt_code`),
  KEY `proctoring_proctored_exam_id_ea6095a3_fk_proctorin` (`exam_id`),
  KEY `proctoring_proctored_reviewed_by_id_546b4204_fk_auth_user` (`reviewed_by_id`),
  KEY `proctoring_proctored_student_id_7e197288_fk_auth_user` (`student_id`),
  CONSTRAINT `proctoring_proctored_exam_id_ea6095a3_fk_proctorin` FOREIGN KEY (`exam_id`) REFERENCES `proctoring_proctoredexam` (`id`),
  CONSTRAINT `proctoring_proctored_reviewed_by_id_546b4204_fk_auth_user` FOREIGN KEY (`reviewed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `proctoring_proctored_student_id_7e197288_fk_auth_user` FOREIGN KEY (`student_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proctoring_proctoredexamsoftwaresecurereview`
--

LOCK TABLES `proctoring_proctoredexamsoftwaresecurereview` WRITE;
/*!40000 ALTER TABLE `proctoring_proctoredexamsoftwaresecurereview` DISABLE KEYS */;
/*!40000 ALTER TABLE `proctoring_proctoredexamsoftwaresecurereview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proctoring_proctoredexamsoftwaresecurereviewhistory`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proctoring_proctoredexamsoftwaresecurereviewhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `attempt_code` varchar(255) NOT NULL,
  `review_status` varchar(255) NOT NULL,
  `raw_data` longtext NOT NULL,
  `video_url` longtext NOT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `reviewed_by_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `is_attempt_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `proctoring_proctored_exam_id_380d8588_fk_proctorin` (`exam_id`),
  KEY `proctoring_proctored_reviewed_by_id_bb993b3a_fk_auth_user` (`reviewed_by_id`),
  KEY `proctoring_proctored_student_id_97a63653_fk_auth_user` (`student_id`),
  KEY `proctoring_proctoredexamsof_attempt_code_695faa63` (`attempt_code`),
  CONSTRAINT `proctoring_proctored_exam_id_380d8588_fk_proctorin` FOREIGN KEY (`exam_id`) REFERENCES `proctoring_proctoredexam` (`id`),
  CONSTRAINT `proctoring_proctored_reviewed_by_id_bb993b3a_fk_auth_user` FOREIGN KEY (`reviewed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `proctoring_proctored_student_id_97a63653_fk_auth_user` FOREIGN KEY (`student_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proctoring_proctoredexamsoftwaresecurereviewhistory`
--

LOCK TABLES `proctoring_proctoredexamsoftwaresecurereviewhistory` WRITE;
/*!40000 ALTER TABLE `proctoring_proctoredexamsoftwaresecurereviewhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `proctoring_proctoredexamsoftwaresecurereviewhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proctoring_proctoredexamstudentallowance`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proctoring_proctoredexamstudentallowance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `proctored_exam_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `proctoring_proctoredexam_user_id_proctored_exam_i_56de5b8f_uniq` (`user_id`,`proctored_exam_id`,`key`),
  KEY `proctoring_proctored_proctored_exam_id_9baf5a64_fk_proctorin` (`proctored_exam_id`),
  CONSTRAINT `proctoring_proctored_proctored_exam_id_9baf5a64_fk_proctorin` FOREIGN KEY (`proctored_exam_id`) REFERENCES `proctoring_proctoredexam` (`id`),
  CONSTRAINT `proctoring_proctored_user_id_f21ce9b6_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proctoring_proctoredexamstudentallowance`
--

LOCK TABLES `proctoring_proctoredexamstudentallowance` WRITE;
/*!40000 ALTER TABLE `proctoring_proctoredexamstudentallowance` DISABLE KEYS */;
/*!40000 ALTER TABLE `proctoring_proctoredexamstudentallowance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proctoring_proctoredexamstudentallowancehistory`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proctoring_proctoredexamstudentallowancehistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `allowance_id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `proctored_exam_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `proctoring_proctored_proctored_exam_id_a4c8237c_fk_proctorin` (`proctored_exam_id`),
  KEY `proctoring_proctored_user_id_29b863c1_fk_auth_user` (`user_id`),
  CONSTRAINT `proctoring_proctored_proctored_exam_id_a4c8237c_fk_proctorin` FOREIGN KEY (`proctored_exam_id`) REFERENCES `proctoring_proctoredexam` (`id`),
  CONSTRAINT `proctoring_proctored_user_id_29b863c1_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proctoring_proctoredexamstudentallowancehistory`
--

LOCK TABLES `proctoring_proctoredexamstudentallowancehistory` WRITE;
/*!40000 ALTER TABLE `proctoring_proctoredexamstudentallowancehistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `proctoring_proctoredexamstudentallowancehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proctoring_proctoredexamstudentattempt`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proctoring_proctoredexamstudentattempt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `started_at` datetime(6) DEFAULT NULL,
  `completed_at` datetime(6) DEFAULT NULL,
  `attempt_code` varchar(255) DEFAULT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `allowed_time_limit_mins` int(11) DEFAULT NULL,
  `status` varchar(64) NOT NULL,
  `taking_as_proctored` tinyint(1) NOT NULL,
  `is_sample_attempt` tinyint(1) NOT NULL,
  `review_policy_id` int(11) DEFAULT NULL,
  `proctored_exam_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_status_acknowledged` tinyint(1) NOT NULL,
  `time_remaining_seconds` int(11) DEFAULT NULL,
  `is_resumable` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `proctoring_proctored_proctored_exam_id_0732c688_fk_proctorin` (`proctored_exam_id`),
  KEY `proctoring_proctoredexamstudentattempt_attempt_code_b10ad854` (`attempt_code`),
  KEY `proctoring_proctoredexamstudentattempt_external_id_9c302af3` (`external_id`),
  KEY `proctoring_proctoredexamstudentattempt_user_id_2b58b7ed` (`user_id`),
  CONSTRAINT `proctoring_proctored_proctored_exam_id_0732c688_fk_proctorin` FOREIGN KEY (`proctored_exam_id`) REFERENCES `proctoring_proctoredexam` (`id`),
  CONSTRAINT `proctoring_proctored_user_id_2b58b7ed_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proctoring_proctoredexamstudentattempt`
--

LOCK TABLES `proctoring_proctoredexamstudentattempt` WRITE;
/*!40000 ALTER TABLE `proctoring_proctoredexamstudentattempt` DISABLE KEYS */;
/*!40000 ALTER TABLE `proctoring_proctoredexamstudentattempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proctoring_proctoredexamstudentattemptcomment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proctoring_proctoredexamstudentattemptcomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `start_time` int(11) NOT NULL,
  `stop_time` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `comment` longtext NOT NULL,
  `status` varchar(255) NOT NULL,
  `review_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `proctoring_proctored_review_id_7f4eec67_fk_proctorin` (`review_id`),
  CONSTRAINT `proctoring_proctored_review_id_7f4eec67_fk_proctorin` FOREIGN KEY (`review_id`) REFERENCES `proctoring_proctoredexamsoftwaresecurereview` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proctoring_proctoredexamstudentattemptcomment`
--

LOCK TABLES `proctoring_proctoredexamstudentattemptcomment` WRITE;
/*!40000 ALTER TABLE `proctoring_proctoredexamstudentattemptcomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `proctoring_proctoredexamstudentattemptcomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proctoring_proctoredexamstudentattempthistory`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proctoring_proctoredexamstudentattempthistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `attempt_id` int(11) DEFAULT NULL,
  `started_at` datetime(6) DEFAULT NULL,
  `completed_at` datetime(6) DEFAULT NULL,
  `attempt_code` varchar(255) DEFAULT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `allowed_time_limit_mins` int(11) DEFAULT NULL,
  `status` varchar(64) NOT NULL,
  `taking_as_proctored` tinyint(1) NOT NULL,
  `is_sample_attempt` tinyint(1) NOT NULL,
  `review_policy_id` int(11) DEFAULT NULL,
  `proctored_exam_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_resumable` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `proctoring_proctored_proctored_exam_id_72c6f4ab_fk_proctorin` (`proctored_exam_id`),
  KEY `proctoring_proctored_user_id_52fb8674_fk_auth_user` (`user_id`),
  KEY `proctoring_proctoredexamstu_attempt_code_8db28074` (`attempt_code`),
  KEY `proctoring_proctoredexamstu_external_id_65de5faf` (`external_id`),
  CONSTRAINT `proctoring_proctored_proctored_exam_id_72c6f4ab_fk_proctorin` FOREIGN KEY (`proctored_exam_id`) REFERENCES `proctoring_proctoredexam` (`id`),
  CONSTRAINT `proctoring_proctored_user_id_52fb8674_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proctoring_proctoredexamstudentattempthistory`
--

LOCK TABLES `proctoring_proctoredexamstudentattempthistory` WRITE;
/*!40000 ALTER TABLE `proctoring_proctoredexamstudentattempthistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `proctoring_proctoredexamstudentattempthistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_enrollments_courseaccessroleassignment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_enrollments_courseaccessroleassignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `role` varchar(64) NOT NULL,
  `enrollment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `program_enrollments_cour_role_enrollment_id_5a7bfa63_uniq` (`role`,`enrollment_id`),
  KEY `program_enrollments__enrollment_id_4e0853f0_fk_program_e` (`enrollment_id`),
  CONSTRAINT `program_enrollments__enrollment_id_4e0853f0_fk_program_e` FOREIGN KEY (`enrollment_id`) REFERENCES `program_enrollments_programcourseenrollment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_enrollments_courseaccessroleassignment`
--

LOCK TABLES `program_enrollments_courseaccessroleassignment` WRITE;
/*!40000 ALTER TABLE `program_enrollments_courseaccessroleassignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `program_enrollments_courseaccessroleassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_enrollments_historicalprogramcourseenrollment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_enrollments_historicalprogramcourseenrollment` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_key` varchar(255) NOT NULL,
  `status` varchar(9) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `course_enrollment_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `program_enrollment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `program_enrollments__history_user_id_428d002e_fk_auth_user` (`history_user_id`),
  KEY `program_enrollments_histori_id_fe3a72a7` (`id`),
  KEY `program_enrollments_histori_course_enrollment_id_4014ff73` (`course_enrollment_id`),
  KEY `program_enrollments_histori_program_enrollment_id_ebb94d42` (`program_enrollment_id`),
  CONSTRAINT `program_enrollments__history_user_id_428d002e_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_enrollments_historicalprogramcourseenrollment`
--

LOCK TABLES `program_enrollments_historicalprogramcourseenrollment` WRITE;
/*!40000 ALTER TABLE `program_enrollments_historicalprogramcourseenrollment` DISABLE KEYS */;
/*!40000 ALTER TABLE `program_enrollments_historicalprogramcourseenrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_enrollments_historicalprogramenrollment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_enrollments_historicalprogramenrollment` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `external_user_key` varchar(255) DEFAULT NULL,
  `program_uuid` char(32) NOT NULL,
  `curriculum_uuid` char(32) NOT NULL,
  `status` varchar(9) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `program_enrollments__history_user_id_abf2d584_fk_auth_user` (`history_user_id`),
  KEY `program_enrollments_historicalprogramenrollment_id_947c385f` (`id`),
  KEY `program_enrollments_histori_external_user_key_5cd8d804` (`external_user_key`),
  KEY `program_enrollments_histori_program_uuid_4c520e40` (`program_uuid`),
  KEY `program_enrollments_histori_curriculum_uuid_a8325208` (`curriculum_uuid`),
  KEY `program_enrollments_historicalprogramenrollment_user_id_e205ccdf` (`user_id`),
  CONSTRAINT `program_enrollments__history_user_id_abf2d584_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_enrollments_historicalprogramenrollment`
--

LOCK TABLES `program_enrollments_historicalprogramenrollment` WRITE;
/*!40000 ALTER TABLE `program_enrollments_historicalprogramenrollment` DISABLE KEYS */;
/*!40000 ALTER TABLE `program_enrollments_historicalprogramenrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_enrollments_programcourseenrollment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_enrollments_programcourseenrollment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_key` varchar(255) NOT NULL,
  `status` varchar(9) NOT NULL,
  `course_enrollment_id` int(11) DEFAULT NULL,
  `program_enrollment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `program_enrollments_prog_program_enrollment_id_co_7d2701fb_uniq` (`program_enrollment_id`,`course_key`),
  KEY `program_enrollments_program_course_enrollment_id_d7890690` (`course_enrollment_id`),
  CONSTRAINT `program_enrollments__course_enrollment_id_d7890690_fk_student_c` FOREIGN KEY (`course_enrollment_id`) REFERENCES `student_courseenrollment` (`id`),
  CONSTRAINT `program_enrollments__program_enrollment_i_02ce2c32_fk_program_e` FOREIGN KEY (`program_enrollment_id`) REFERENCES `program_enrollments_programenrollment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_enrollments_programcourseenrollment`
--

LOCK TABLES `program_enrollments_programcourseenrollment` WRITE;
/*!40000 ALTER TABLE `program_enrollments_programcourseenrollment` DISABLE KEYS */;
/*!40000 ALTER TABLE `program_enrollments_programcourseenrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_enrollments_programenrollment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_enrollments_programenrollment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `external_user_key` varchar(255) DEFAULT NULL,
  `program_uuid` char(32) NOT NULL,
  `curriculum_uuid` char(32) NOT NULL,
  `status` varchar(9) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `program_enrollments_prog_external_user_key_progra_ec52a567_uniq` (`external_user_key`,`program_uuid`,`curriculum_uuid`),
  UNIQUE KEY `program_enrollments_prog_user_id_program_uuid_cur_ecf769fd_uniq` (`user_id`,`program_uuid`,`curriculum_uuid`),
  KEY `program_enrollments_programenrollment_external_user_key_c27b83c5` (`external_user_key`),
  KEY `program_enrollments_programenrollment_program_uuid_131378e0` (`program_uuid`),
  KEY `program_enrollments_programenrollment_curriculum_uuid_da64e123` (`curriculum_uuid`),
  KEY `program_enrollments_programenrollment_user_id_dcfde442` (`user_id`),
  CONSTRAINT `program_enrollments__user_id_dcfde442_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_enrollments_programenrollment`
--

LOCK TABLES `program_enrollments_programenrollment` WRITE;
/*!40000 ALTER TABLE `program_enrollments_programenrollment` DISABLE KEYS */;
/*!40000 ALTER TABLE `program_enrollments_programenrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programs_programsapiconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programs_programsapiconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `marketing_path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `programs_programsapi_changed_by_id_93e09d74_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `programs_programsapi_changed_by_id_93e09d74_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programs_programsapiconfig`
--

LOCK TABLES `programs_programsapiconfig` WRITE;
/*!40000 ALTER TABLE `programs_programsapiconfig` DISABLE KEYS */;
INSERT INTO `programs_programsapiconfig` VALUES (1,'2021-07-30 20:15:36.962054',1,NULL,'');
/*!40000 ALTER TABLE `programs_programsapiconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rss_proxy_whitelistedrssurl`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rss_proxy_whitelistedrssurl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rss_proxy_whitelistedrssurl`
--

LOCK TABLES `rss_proxy_whitelistedrssurl` WRITE;
/*!40000 ALTER TABLE `rss_proxy_whitelistedrssurl` DISABLE KEYS */;
/*!40000 ALTER TABLE `rss_proxy_whitelistedrssurl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sap_success_factors_sapsuccessfactorsenterprisecustomerconfidb8a`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sap_success_factors_sapsuccessfactorsenterprisecustomerconfidb8a` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `transmission_chunk_size` int(11) NOT NULL,
  `channel_worker_username` varchar(255) DEFAULT NULL,
  `catalogs_to_transmit` longtext,
  `key` varchar(255) NOT NULL,
  `sapsf_base_url` varchar(255) NOT NULL,
  `sapsf_company_id` varchar(255) NOT NULL,
  `sapsf_user_id` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  `additional_locales` longtext NOT NULL,
  `show_course_price` tinyint(1) NOT NULL,
  `transmit_total_hours` tinyint(1) NOT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  `prevent_self_submit_grades` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_customer_id` (`enterprise_customer_id`),
  CONSTRAINT `sap_success_factors__enterprise_customer__4819a28c_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sap_success_factors_sapsuccessfactorsenterprisecustomerconfidb8a`
--

LOCK TABLES `sap_success_factors_sapsuccessfactorsenterprisecustomerconfidb8a` WRITE;
/*!40000 ALTER TABLE `sap_success_factors_sapsuccessfactorsenterprisecustomerconfidb8a` DISABLE KEYS */;
/*!40000 ALTER TABLE `sap_success_factors_sapsuccessfactorsenterprisecustomerconfidb8a` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sap_success_factors_sapsuccessfactorsglobalconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sap_success_factors_sapsuccessfactorsglobalconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `completion_status_api_path` varchar(255) NOT NULL,
  `course_api_path` varchar(255) NOT NULL,
  `oauth_api_path` varchar(255) NOT NULL,
  `search_student_api_path` varchar(255) NOT NULL,
  `provider_id` varchar(100) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sap_success_factors__changed_by_id_e3241cc9_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `sap_success_factors__changed_by_id_e3241cc9_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sap_success_factors_sapsuccessfactorsglobalconfiguration`
--

LOCK TABLES `sap_success_factors_sapsuccessfactorsglobalconfiguration` WRITE;
/*!40000 ALTER TABLE `sap_success_factors_sapsuccessfactorsglobalconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `sap_success_factors_sapsuccessfactorsglobalconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sap_success_factors_sapsuccessfactorslearnerdatatransmission3ce5`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sap_success_factors_sapsuccessfactorslearnerdatatransmission3ce5` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sapsf_user_id` varchar(255) NOT NULL,
  `enterprise_course_enrollment_id` int(10) unsigned NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `course_completed` tinyint(1) NOT NULL,
  `instructor_name` varchar(255) NOT NULL,
  `grade` varchar(100) NOT NULL,
  `total_hours` double DEFAULT NULL,
  `completed_timestamp` bigint(20) NOT NULL,
  `status` varchar(100) NOT NULL,
  `error_message` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `credit_hours` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sap_success_factors_sapsucc_enterprise_course_enrollmen_99be77d5` (`enterprise_course_enrollment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sap_success_factors_sapsuccessfactorslearnerdatatransmission3ce5`
--

LOCK TABLES `sap_success_factors_sapsuccessfactorslearnerdatatransmission3ce5` WRITE;
/*!40000 ALTER TABLE `sap_success_factors_sapsuccessfactorslearnerdatatransmission3ce5` DISABLE KEYS */;
/*!40000 ALTER TABLE `sap_success_factors_sapsuccessfactorslearnerdatatransmission3ce5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules_historicalschedule`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedules_historicalschedule` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  `upgrade_deadline` datetime(6) DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `enrollment_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `schedules_historicalschedule_id_f1648c81` (`id`),
  KEY `schedules_historicalschedule_start_date_8c02ff20` (`start_date`),
  KEY `schedules_historicalschedule_upgrade_deadline_ba67bbd9` (`upgrade_deadline`),
  KEY `schedules_historicalschedule_enrollment_id_cd620413` (`enrollment_id`),
  KEY `schedules_historical_history_user_id_6f5d6d7b_fk_auth_user` (`history_user_id`),
  CONSTRAINT `schedules_historical_history_user_id_6f5d6d7b_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules_historicalschedule`
--

LOCK TABLES `schedules_historicalschedule` WRITE;
/*!40000 ALTER TABLE `schedules_historicalschedule` DISABLE KEYS */;
INSERT INTO `schedules_historicalschedule` VALUES (1,'2021-07-30 20:04:36.366163','2021-07-30 20:04:36.366163',1,'2021-07-30 20:04:36.338973',NULL,1,'2021-07-30 20:04:36.368083',NULL,'+',1,NULL),(2,'2021-07-30 20:04:47.632150','2021-07-30 20:04:47.632150',1,'2021-07-30 20:04:47.602766',NULL,2,'2021-07-30 20:04:47.634148',NULL,'+',2,NULL),(3,'2021-07-30 20:04:59.260885','2021-07-30 20:04:59.260885',1,'2021-07-30 20:04:59.237993',NULL,3,'2021-07-30 20:04:59.262132',NULL,'+',3,NULL),(4,'2021-07-30 20:05:10.467427','2021-07-30 20:05:10.467427',1,'2021-07-30 20:05:10.440635',NULL,4,'2021-07-30 20:05:10.469120',NULL,'+',4,NULL);
/*!40000 ALTER TABLE `schedules_historicalschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules_schedule`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedules_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `upgrade_deadline` datetime(6) DEFAULT NULL,
  `enrollment_id` int(11) NOT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enrollment_id` (`enrollment_id`),
  KEY `schedules_schedule_upgrade_deadline_0079081d` (`upgrade_deadline`),
  KEY `schedules_schedule_start_date_3a1c341e` (`start_date`),
  CONSTRAINT `schedules_schedule_enrollment_id_91bf8152_fk_student_c` FOREIGN KEY (`enrollment_id`) REFERENCES `student_courseenrollment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules_schedule`
--

LOCK TABLES `schedules_schedule` WRITE;
/*!40000 ALTER TABLE `schedules_schedule` DISABLE KEYS */;
INSERT INTO `schedules_schedule` VALUES (1,'2021-07-30 20:04:36.366163','2021-07-30 20:04:36.366163',1,NULL,1,'2021-07-30 20:04:36.338973'),(2,'2021-07-30 20:04:47.632150','2021-07-30 20:04:47.632150',1,NULL,2,'2021-07-30 20:04:47.602766'),(3,'2021-07-30 20:04:59.260885','2021-07-30 20:04:59.260885',1,NULL,3,'2021-07-30 20:04:59.237993'),(4,'2021-07-30 20:05:10.467427','2021-07-30 20:05:10.467427',1,NULL,4,'2021-07-30 20:05:10.440635');
/*!40000 ALTER TABLE `schedules_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules_scheduleconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedules_scheduleconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `enqueue_recurring_nudge` tinyint(1) NOT NULL,
  `deliver_recurring_nudge` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `site_id` int(11) NOT NULL,
  `deliver_upgrade_reminder` tinyint(1) NOT NULL,
  `enqueue_upgrade_reminder` tinyint(1) NOT NULL,
  `deliver_course_update` tinyint(1) NOT NULL,
  `enqueue_course_update` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schedules_scheduleconfig_changed_by_id_38ef599b_fk_auth_user_id` (`changed_by_id`),
  KEY `schedules_scheduleconfig_site_id_44296ee1_fk_django_site_id` (`site_id`),
  CONSTRAINT `schedules_scheduleconfig_changed_by_id_38ef599b_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `schedules_scheduleconfig_site_id_44296ee1_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules_scheduleconfig`
--

LOCK TABLES `schedules_scheduleconfig` WRITE;
/*!40000 ALTER TABLE `schedules_scheduleconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedules_scheduleconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules_scheduleexperience`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedules_scheduleexperience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `experience_type` smallint(5) unsigned NOT NULL,
  `schedule_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `schedule_id` (`schedule_id`),
  CONSTRAINT `schedules_scheduleex_schedule_id_ed95c8e7_fk_schedules` FOREIGN KEY (`schedule_id`) REFERENCES `schedules_schedule` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules_scheduleexperience`
--

LOCK TABLES `schedules_scheduleexperience` WRITE;
/*!40000 ALTER TABLE `schedules_scheduleexperience` DISABLE KEYS */;
INSERT INTO `schedules_scheduleexperience` VALUES (1,0,1),(2,0,2),(3,0,3),(4,0,4);
/*!40000 ALTER TABLE `schedules_scheduleexperience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `self_paced_selfpacedconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `self_paced_selfpacedconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `enable_course_home_improvements` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `self_paced_selfpaced_changed_by_id_02789a26_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `self_paced_selfpaced_changed_by_id_02789a26_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `self_paced_selfpacedconfiguration`
--

LOCK TABLES `self_paced_selfpacedconfiguration` WRITE;
/*!40000 ALTER TABLE `self_paced_selfpacedconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `self_paced_selfpacedconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_configuration_siteconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_configuration_siteconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `site_values` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `site_id` (`site_id`),
  CONSTRAINT `site_configuration_s_site_id_84302d1f_fk_django_si` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_configuration_siteconfiguration`
--

LOCK TABLES `site_configuration_siteconfiguration` WRITE;
/*!40000 ALTER TABLE `site_configuration_siteconfiguration` DISABLE KEYS */;
INSERT INTO `site_configuration_siteconfiguration` VALUES (1,1,1,'{\"COURSE_CATALOG_API_URL\":\"http://edx.devstack.discovery:18381/api/v1/\"}');
/*!40000 ALTER TABLE `site_configuration_siteconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_configuration_siteconfigurationhistory`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_configuration_siteconfigurationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `site_id` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `site_values` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_configuration_s_site_id_272f5c1a_fk_django_si` (`site_id`),
  CONSTRAINT `site_configuration_s_site_id_272f5c1a_fk_django_si` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_configuration_siteconfigurationhistory`
--

LOCK TABLES `site_configuration_siteconfigurationhistory` WRITE;
/*!40000 ALTER TABLE `site_configuration_siteconfigurationhistory` DISABLE KEYS */;
INSERT INTO `site_configuration_siteconfigurationhistory` VALUES (1,'2021-07-30 20:15:37.005496','2021-07-30 20:15:37.005496',1,1,'{\"COURSE_CATALOG_API_URL\":\"http://edx.devstack.discovery:18381/api/v1/\"}');
/*!40000 ALTER TABLE `site_configuration_siteconfigurationhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_association`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `issued` int(11) NOT NULL,
  `lifetime` int(11) NOT NULL,
  `assoc_type` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_association_server_url_handle_078befa2_uniq` (`server_url`,`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_association`
--

LOCK TABLES `social_auth_association` WRITE;
/*!40000 ALTER TABLE `social_auth_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_code`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `code` varchar(32) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_code_email_code_801b2d02_uniq` (`email`,`code`),
  KEY `social_auth_code_code_a2393167` (`code`),
  KEY `social_auth_code_timestamp_176b341f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_code`
--

LOCK TABLES `social_auth_code` WRITE;
/*!40000 ALTER TABLE `social_auth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_nonce`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_nonce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `salt` varchar(65) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_nonce_server_url_timestamp_salt_f6284463_uniq` (`server_url`,`timestamp`,`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_nonce`
--

LOCK TABLES `social_auth_nonce` WRITE;
/*!40000 ALTER TABLE `social_auth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_partial`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_partial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `next_step` smallint(5) unsigned NOT NULL,
  `backend` varchar(32) NOT NULL,
  `data` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `social_auth_partial_token_3017fea3` (`token`),
  KEY `social_auth_partial_timestamp_50f2119f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_partial`
--

LOCK TABLES `social_auth_partial` WRITE;
/*!40000 ALTER TABLE `social_auth_partial` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_partial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_usersocialauth`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_usersocialauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(32) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_usersocialauth_provider_uid_e6b5e668_uniq` (`provider`,`uid`),
  KEY `social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id` (`user_id`),
  KEY `social_auth_usersocialauth_uid_796e51dc` (`uid`),
  CONSTRAINT `social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_usersocialauth`
--

LOCK TABLES `social_auth_usersocialauth` WRITE;
/*!40000 ALTER TABLE `social_auth_usersocialauth` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_usersocialauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `splash_splashconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `splash_splashconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `cookie_name` longtext NOT NULL,
  `cookie_allowed_values` longtext NOT NULL,
  `unaffected_usernames` longtext NOT NULL,
  `unaffected_url_paths` longtext NOT NULL,
  `redirect_url` varchar(200) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `splash_splashconfig_changed_by_id_883b17ba_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `splash_splashconfig_changed_by_id_883b17ba_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `splash_splashconfig`
--

LOCK TABLES `splash_splashconfig` WRITE;
/*!40000 ALTER TABLE `splash_splashconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `splash_splashconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_replace_assetbaseurlconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_replace_assetbaseurlconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `base_url` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `static_replace_asset_changed_by_id_f592e050_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `static_replace_asset_changed_by_id_f592e050_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_replace_assetbaseurlconfig`
--

LOCK TABLES `static_replace_assetbaseurlconfig` WRITE;
/*!40000 ALTER TABLE `static_replace_assetbaseurlconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `static_replace_assetbaseurlconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_replace_assetexcludedextensionsconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_replace_assetexcludedextensionsconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `excluded_extensions` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `static_replace_asset_changed_by_id_e58299b3_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `static_replace_asset_changed_by_id_e58299b3_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_replace_assetexcludedextensionsconfig`
--

LOCK TABLES `static_replace_assetexcludedextensionsconfig` WRITE;
/*!40000 ALTER TABLE `static_replace_assetexcludedextensionsconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `static_replace_assetexcludedextensionsconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_coursemessage`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_coursemessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_key` varchar(255) NOT NULL,
  `message` longtext,
  `global_message_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status_coursemessage_course_key_90c77a2e` (`course_key`),
  KEY `status_coursemessage_global_message_id_01bbfbe6_fk_status_gl` (`global_message_id`),
  CONSTRAINT `status_coursemessage_global_message_id_01bbfbe6_fk_status_gl` FOREIGN KEY (`global_message_id`) REFERENCES `status_globalstatusmessage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_coursemessage`
--

LOCK TABLES `status_coursemessage` WRITE;
/*!40000 ALTER TABLE `status_coursemessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_coursemessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_globalstatusmessage`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_globalstatusmessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `message` longtext,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status_globalstatusm_changed_by_id_3c627848_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `status_globalstatusm_changed_by_id_3c627848_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_globalstatusmessage`
--

LOCK TABLES `status_globalstatusmessage` WRITE;
/*!40000 ALTER TABLE `status_globalstatusmessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_globalstatusmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_accountrecoveryconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_accountrecoveryconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `csv_file` varchar(100) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_accountrecov_changed_by_id_d9d1ddf6_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `student_accountrecov_changed_by_id_d9d1ddf6_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_accountrecoveryconfiguration`
--

LOCK TABLES `student_accountrecoveryconfiguration` WRITE;
/*!40000 ALTER TABLE `student_accountrecoveryconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_accountrecoveryconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_allowedauthuser`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_allowedauthuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `student_allowedauthuser_site_id_9a6aae9b_fk_django_site_id` (`site_id`),
  CONSTRAINT `student_allowedauthuser_site_id_9a6aae9b_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_allowedauthuser`
--

LOCK TABLES `student_allowedauthuser` WRITE;
/*!40000 ALTER TABLE `student_allowedauthuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_allowedauthuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_anonymoususerid`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_anonymoususerid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `anonymous_user_id` varchar(32) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `anonymous_user_id` (`anonymous_user_id`),
  KEY `student_anonymoususerid_user_id_0fb2ad5c_fk_auth_user_id` (`user_id`),
  KEY `student_anonymoususerid_course_id_99cc6a18` (`course_id`),
  CONSTRAINT `student_anonymoususerid_user_id_0fb2ad5c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_anonymoususerid`
--

LOCK TABLES `student_anonymoususerid` WRITE;
/*!40000 ALTER TABLE `student_anonymoususerid` DISABLE KEYS */;
INSERT INTO `student_anonymoususerid` VALUES (1,'de619ab51c7f4e9c7216b4644c24f3b5','',1);
/*!40000 ALTER TABLE `student_anonymoususerid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_bulkchangeenrollmentconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_bulkchangeenrollmentconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `csv_file` varchar(100) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_bulkchangeen_changed_by_id_38bf23de_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `student_bulkchangeen_changed_by_id_38bf23de_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_bulkchangeenrollmentconfiguration`
--

LOCK TABLES `student_bulkchangeenrollmentconfiguration` WRITE;
/*!40000 ALTER TABLE `student_bulkchangeenrollmentconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_bulkchangeenrollmentconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_bulkunenrollconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_bulkunenrollconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `csv_file` varchar(100) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_bulkunenroll_changed_by_id_7b6131b9_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `student_bulkunenroll_changed_by_id_7b6131b9_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_bulkunenrollconfiguration`
--

LOCK TABLES `student_bulkunenrollconfiguration` WRITE;
/*!40000 ALTER TABLE `student_bulkunenrollconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_bulkunenrollconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_courseaccessrole`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_courseaccessrole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org` varchar(64) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `role` varchar(64) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_courseaccessrole_user_id_org_course_id_ro_bbf71126_uniq` (`user_id`,`org`,`course_id`,`role`),
  KEY `student_courseaccessrole_org_6d2dbb7a` (`org`),
  KEY `student_courseaccessrole_course_id_60fb355e` (`course_id`),
  KEY `student_courseaccessrole_role_1ac888ea` (`role`),
  CONSTRAINT `student_courseaccessrole_user_id_90cf21fe_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_courseaccessrole`
--

LOCK TABLES `student_courseaccessrole` WRITE;
/*!40000 ALTER TABLE `student_courseaccessrole` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_courseaccessrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_courseenrollment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_courseenrollment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `mode` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_courseenrollment_user_id_course_id_5d34a47f_uniq` (`user_id`,`course_id`),
  KEY `student_courseenrollment_user_id_4263a8e2` (`user_id`),
  KEY `student_cou_user_id_b19dcd_idx` (`user_id`,`created`),
  KEY `student_courseenrollment_course_id_a6f93be8` (`course_id`),
  KEY `student_courseenrollment_created_79829893` (`created`),
  CONSTRAINT `student_courseenrollment_user_id_4263a8e2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_courseenrollment`
--

LOCK TABLES `student_courseenrollment` WRITE;
/*!40000 ALTER TABLE `student_courseenrollment` DISABLE KEYS */;
INSERT INTO `student_courseenrollment` VALUES (1,'course-v1:edX+DemoX+Demo_Course','2021-07-30 20:04:36.338973',1,'audit',5),(2,'course-v1:edX+DemoX+Demo_Course','2021-07-30 20:04:47.602766',1,'audit',6),(3,'course-v1:edX+DemoX+Demo_Course','2021-07-30 20:04:59.237993',1,'audit',7),(4,'course-v1:edX+DemoX+Demo_Course','2021-07-30 20:05:10.440635',1,'audit',8);
/*!40000 ALTER TABLE `student_courseenrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_courseenrollment_history`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_courseenrollment_history` (
  `id` int(11) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `mode` varchar(100) NOT NULL,
  `history_id` char(32) NOT NULL,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `course_id` varchar(255) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `student_courseenroll_history_user_id_7065c772_fk_auth_user` (`history_user_id`),
  KEY `student_courseenrollment_history_id_2d80b9b3` (`id`),
  KEY `student_courseenrollment_history_created_6b3154af` (`created`),
  KEY `student_courseenrollment_history_course_id_98f13917` (`course_id`),
  KEY `student_courseenrollment_history_user_id_5f94c628` (`user_id`),
  CONSTRAINT `student_courseenroll_history_user_id_7065c772_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_courseenrollment_history`
--

LOCK TABLES `student_courseenrollment_history` WRITE;
/*!40000 ALTER TABLE `student_courseenrollment_history` DISABLE KEYS */;
INSERT INTO `student_courseenrollment_history` VALUES (2,'2021-07-30 20:04:47.602766',1,'audit','276e16628f3b49a292c0f02ca60b8231','2021-07-30 20:04:47.674358',NULL,'~','course-v1:edX+DemoX+Demo_Course',NULL,6),(3,'2021-07-30 20:04:59.237993',1,'audit','2f12db5e8ba644f388738a0a21a384c6','2021-07-30 20:04:59.302112',NULL,'~','course-v1:edX+DemoX+Demo_Course',NULL,7),(1,'2021-07-30 20:04:36.338973',1,'audit','3ff68501dcda4e3c879ac3f8b36d6ac7','2021-07-30 20:04:36.412152',NULL,'~','course-v1:edX+DemoX+Demo_Course',NULL,5),(4,'2021-07-30 20:05:10.440635',0,'audit','41de38d2cbe3494eaf1c0a0d0415f9db','2021-07-30 20:05:10.441392',NULL,'+','course-v1:edX+DemoX+Demo_Course',NULL,8),(2,'2021-07-30 20:04:47.602766',1,'audit','51cb7895f4094284ad1620bf664a3f32','2021-07-30 20:04:47.649797',NULL,'~','course-v1:edX+DemoX+Demo_Course',NULL,6),(4,'2021-07-30 20:05:10.440635',1,'audit','613bb3b1c5ad40a5bc2a0b8eb1eb7730','2021-07-30 20:05:10.509471',NULL,'~','course-v1:edX+DemoX+Demo_Course',NULL,8),(1,'2021-07-30 20:04:36.338973',1,'audit','6ac7e8586a0048d19acd0611c5e1dabd','2021-07-30 20:04:36.383427',NULL,'~','course-v1:edX+DemoX+Demo_Course',NULL,5),(3,'2021-07-30 20:04:59.237993',1,'audit','7ef5f073a5e141c5973e872d03533afd','2021-07-30 20:04:59.274321',NULL,'~','course-v1:edX+DemoX+Demo_Course',NULL,7),(2,'2021-07-30 20:04:47.602766',0,'audit','8bf358a1c2684743a1471804ddeaf32b','2021-07-30 20:04:47.604198',NULL,'+','course-v1:edX+DemoX+Demo_Course',NULL,6),(4,'2021-07-30 20:05:10.440635',1,'audit','8e292a7d2e944bda80985aa1549ee0f7','2021-07-30 20:05:10.485972',NULL,'~','course-v1:edX+DemoX+Demo_Course',NULL,8),(3,'2021-07-30 20:04:59.237993',0,'audit','aabfc2d4d252447bbba9ffc668d19c8c','2021-07-30 20:04:59.238977',NULL,'+','course-v1:edX+DemoX+Demo_Course',NULL,7),(1,'2021-07-30 20:04:36.338973',0,'audit','ead7491cbbef42b39cfff05d3607973e','2021-07-30 20:04:36.339763',NULL,'+','course-v1:edX+DemoX+Demo_Course',NULL,5);
/*!40000 ALTER TABLE `student_courseenrollment_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_courseenrollmentallowed`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_courseenrollmentallowed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `auto_enroll` tinyint(1) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_courseenrollmentallowed_email_course_id_1e23ed5e_uniq` (`email`,`course_id`),
  KEY `student_courseenrollmentallowed_email_969706a0` (`email`),
  KEY `student_courseenrollmentallowed_course_id_67eff667` (`course_id`),
  KEY `student_courseenrollmentallowed_created_b2066658` (`created`),
  KEY `student_courseenrollmentallowed_user_id_5875cce6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `student_courseenrollmentallowed_user_id_5875cce6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_courseenrollmentallowed`
--

LOCK TABLES `student_courseenrollmentallowed` WRITE;
/*!40000 ALTER TABLE `student_courseenrollmentallowed` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_courseenrollmentallowed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_courseenrollmentattribute`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_courseenrollmentattribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namespace` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `enrollment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_courseenroll_enrollment_id_b2173db0_fk_student_c` (`enrollment_id`),
  CONSTRAINT `student_courseenroll_enrollment_id_b2173db0_fk_student_c` FOREIGN KEY (`enrollment_id`) REFERENCES `student_courseenrollment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_courseenrollmentattribute`
--

LOCK TABLES `student_courseenrollmentattribute` WRITE;
/*!40000 ALTER TABLE `student_courseenrollmentattribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_courseenrollmentattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_courseenrollmentcelebration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_courseenrollmentcelebration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `celebrate_first_section` tinyint(1) NOT NULL,
  `enrollment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enrollment_id` (`enrollment_id`),
  CONSTRAINT `student_courseenroll_enrollment_id_c697e4ce_fk_student_c` FOREIGN KEY (`enrollment_id`) REFERENCES `student_courseenrollment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_courseenrollmentcelebration`
--

LOCK TABLES `student_courseenrollmentcelebration` WRITE;
/*!40000 ALTER TABLE `student_courseenrollmentcelebration` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_courseenrollmentcelebration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_dashboardconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_dashboardconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `recent_enrollment_time_delta` int(10) unsigned NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_dashboardcon_changed_by_id_1960484b_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `student_dashboardcon_changed_by_id_1960484b_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_dashboardconfiguration`
--

LOCK TABLES `student_dashboardconfiguration` WRITE;
/*!40000 ALTER TABLE `student_dashboardconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_dashboardconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_enrollmentrefundconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_enrollmentrefundconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `refund_window_microseconds` bigint(20) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_enrollmentre_changed_by_id_082b4f6f_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `student_enrollmentre_changed_by_id_082b4f6f_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_enrollmentrefundconfiguration`
--

LOCK TABLES `student_enrollmentrefundconfiguration` WRITE;
/*!40000 ALTER TABLE `student_enrollmentrefundconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_enrollmentrefundconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_entranceexamconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_entranceexamconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `updated` datetime(6) NOT NULL,
  `skip_entrance_exam` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_entranceexamconf_user_id_course_id_23bbcf9b_uniq` (`user_id`,`course_id`),
  KEY `student_entranceexamconfiguration_course_id_eca5c3d4` (`course_id`),
  KEY `student_entranceexamconfiguration_created_27e80637` (`created`),
  KEY `student_entranceexamconfiguration_updated_d560d552` (`updated`),
  CONSTRAINT `student_entranceexam_user_id_387a35d6_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_entranceexamconfiguration`
--

LOCK TABLES `student_entranceexamconfiguration` WRITE;
/*!40000 ALTER TABLE `student_entranceexamconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_entranceexamconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_fbeenrollmentexclusion`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_fbeenrollmentexclusion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enrollment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enrollment_id` (`enrollment_id`),
  CONSTRAINT `student_fbeenrollmen_enrollment_id_28537ff8_fk_student_c` FOREIGN KEY (`enrollment_id`) REFERENCES `student_courseenrollment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_fbeenrollmentexclusion`
--

LOCK TABLES `student_fbeenrollmentexclusion` WRITE;
/*!40000 ALTER TABLE `student_fbeenrollmentexclusion` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_fbeenrollmentexclusion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_historicalmanualenrollmentaudit`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_historicalmanualenrollmentaudit` (
  `id` int(11) NOT NULL,
  `enrolled_email` varchar(255) NOT NULL,
  `time_stamp` datetime(6) DEFAULT NULL,
  `state_transition` varchar(255) NOT NULL,
  `reason` longtext,
  `role` varchar(64) DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `enrolled_by_id` int(11) DEFAULT NULL,
  `enrollment_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `student_historicalma_history_user_id_b5f488c2_fk_auth_user` (`history_user_id`),
  KEY `student_historicalmanualenrollmentaudit_id_18eb7e98` (`id`),
  KEY `student_historicalmanualenrollmentaudit_enrolled_email_bfaa34b3` (`enrolled_email`),
  KEY `student_historicalmanualenrollmentaudit_enrolled_by_id_0838a44b` (`enrolled_by_id`),
  KEY `student_historicalmanualenrollmentaudit_enrollment_id_b74f8923` (`enrollment_id`),
  CONSTRAINT `student_historicalma_history_user_id_b5f488c2_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_historicalmanualenrollmentaudit`
--

LOCK TABLES `student_historicalmanualenrollmentaudit` WRITE;
/*!40000 ALTER TABLE `student_historicalmanualenrollmentaudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_historicalmanualenrollmentaudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_languageproficiency`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_languageproficiency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(16) NOT NULL,
  `user_profile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_languageproficiency_code_user_profile_id_9aa4e2f5_uniq` (`code`,`user_profile_id`),
  KEY `student_languageprof_user_profile_id_768cd3eb_fk_auth_user` (`user_profile_id`),
  CONSTRAINT `student_languageprof_user_profile_id_768cd3eb_fk_auth_user` FOREIGN KEY (`user_profile_id`) REFERENCES `auth_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_languageproficiency`
--

LOCK TABLES `student_languageproficiency` WRITE;
/*!40000 ALTER TABLE `student_languageproficiency` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_languageproficiency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_linkedinaddtoprofileconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_linkedinaddtoprofileconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `company_identifier` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_linkedinaddt_changed_by_id_dc1c453f_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `student_linkedinaddt_changed_by_id_dc1c453f_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_linkedinaddtoprofileconfiguration`
--

LOCK TABLES `student_linkedinaddtoprofileconfiguration` WRITE;
/*!40000 ALTER TABLE `student_linkedinaddtoprofileconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_linkedinaddtoprofileconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_loginfailures`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_loginfailures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `failure_count` int(11) NOT NULL,
  `lockout_until` datetime(6) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_loginfailures_user_id_50d85202_fk_auth_user_id` (`user_id`),
  CONSTRAINT `student_loginfailures_user_id_50d85202_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_loginfailures`
--

LOCK TABLES `student_loginfailures` WRITE;
/*!40000 ALTER TABLE `student_loginfailures` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_loginfailures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_manualenrollmentaudit`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_manualenrollmentaudit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enrolled_email` varchar(255) NOT NULL,
  `time_stamp` datetime(6) DEFAULT NULL,
  `state_transition` varchar(255) NOT NULL,
  `reason` longtext,
  `enrolled_by_id` int(11) DEFAULT NULL,
  `enrollment_id` int(11) DEFAULT NULL,
  `role` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_manualenroll_enrolled_by_id_1217a0dc_fk_auth_user` (`enrolled_by_id`),
  KEY `student_manualenroll_enrollment_id_decc94fe_fk_student_c` (`enrollment_id`),
  KEY `student_manualenrollmentaudit_enrolled_email_47ce6524` (`enrolled_email`),
  CONSTRAINT `student_manualenroll_enrolled_by_id_1217a0dc_fk_auth_user` FOREIGN KEY (`enrolled_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `student_manualenroll_enrollment_id_decc94fe_fk_student_c` FOREIGN KEY (`enrollment_id`) REFERENCES `student_courseenrollment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_manualenrollmentaudit`
--

LOCK TABLES `student_manualenrollmentaudit` WRITE;
/*!40000 ALTER TABLE `student_manualenrollmentaudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_manualenrollmentaudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_pendingemailchange`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_pendingemailchange` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `new_email` varchar(255) NOT NULL,
  `activation_key` varchar(32) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `activation_key` (`activation_key`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `student_pendingemailchange_new_email_6887bdea` (`new_email`),
  CONSTRAINT `student_pendingemailchange_user_id_8f2778c5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_pendingemailchange`
--

LOCK TABLES `student_pendingemailchange` WRITE;
/*!40000 ALTER TABLE `student_pendingemailchange` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_pendingemailchange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_pendingnamechange`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_pendingnamechange` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `new_name` varchar(255) NOT NULL,
  `rationale` varchar(1024) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `student_pendingnamechange_user_id_e2cd8b70_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_pendingnamechange`
--

LOCK TABLES `student_pendingnamechange` WRITE;
/*!40000 ALTER TABLE `student_pendingnamechange` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_pendingnamechange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_pendingsecondaryemailchange`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_pendingsecondaryemailchange` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `new_secondary_email` varchar(255) NOT NULL,
  `activation_key` varchar(32) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `activation_key` (`activation_key`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `student_pendingsecondaryemailchange_new_secondary_email_5e79db59` (`new_secondary_email`),
  CONSTRAINT `student_pendingsecon_user_id_deacc54f_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_pendingsecondaryemailchange`
--

LOCK TABLES `student_pendingsecondaryemailchange` WRITE;
/*!40000 ALTER TABLE `student_pendingsecondaryemailchange` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_pendingsecondaryemailchange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_registrationcookieconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_registrationcookieconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `utm_cookie_name` varchar(255) NOT NULL,
  `affiliate_cookie_name` varchar(255) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_registration_changed_by_id_52ac88b0_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `student_registration_changed_by_id_52ac88b0_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_registrationcookieconfiguration`
--

LOCK TABLES `student_registrationcookieconfiguration` WRITE;
/*!40000 ALTER TABLE `student_registrationcookieconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_registrationcookieconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_sociallink`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_sociallink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platform` varchar(30) NOT NULL,
  `social_link` varchar(100) NOT NULL,
  `user_profile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_sociallink_user_profile_id_19f54475_fk_auth_user` (`user_profile_id`),
  CONSTRAINT `student_sociallink_user_profile_id_19f54475_fk_auth_user` FOREIGN KEY (`user_profile_id`) REFERENCES `auth_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_sociallink`
--

LOCK TABLES `student_sociallink` WRITE;
/*!40000 ALTER TABLE `student_sociallink` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_sociallink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_userattribute`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_userattribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_userattribute_user_id_name_70e18f46_uniq` (`user_id`,`name`),
  KEY `student_userattribute_name_a55155e3` (`name`),
  CONSTRAINT `student_userattribute_user_id_19c01f5e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_userattribute`
--

LOCK TABLES `student_userattribute` WRITE;
/*!40000 ALTER TABLE `student_userattribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_userattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_usercelebration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_usercelebration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `last_day_of_streak` date DEFAULT NULL,
  `streak_length` int(11) NOT NULL,
  `longest_ever_streak` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `student_usercelebration_user_id_8682222f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_usercelebration`
--

LOCK TABLES `student_usercelebration` WRITE;
/*!40000 ALTER TABLE `student_usercelebration` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_usercelebration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_userpasswordtogglehistory`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_userpasswordtogglehistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `disabled` tinyint(1) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_userpassword_created_by_id_f7092add_fk_auth_user` (`created_by_id`),
  KEY `student_userpassword_user_id_1e2a09c9_fk_auth_user` (`user_id`),
  CONSTRAINT `student_userpassword_created_by_id_f7092add_fk_auth_user` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `student_userpassword_user_id_1e2a09c9_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_userpasswordtogglehistory`
--

LOCK TABLES `student_userpasswordtogglehistory` WRITE;
/*!40000 ALTER TABLE `student_userpasswordtogglehistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_userpasswordtogglehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_usersignupsource`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_usersignupsource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_usersignupsource_user_id_4979dd6e_fk_auth_user_id` (`user_id`),
  KEY `student_usersignupsource_site_beb4d383` (`site`),
  CONSTRAINT `student_usersignupsource_user_id_4979dd6e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_usersignupsource`
--

LOCK TABLES `student_usersignupsource` WRITE;
/*!40000 ALTER TABLE `student_usersignupsource` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_usersignupsource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_userstanding`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_userstanding` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_status` varchar(31) NOT NULL,
  `standing_last_changed_at` datetime(6) NOT NULL,
  `changed_by_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `student_userstanding_changed_by_id_469252b4_fk_auth_user_id` (`changed_by_id`),
  CONSTRAINT `student_userstanding_changed_by_id_469252b4_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `student_userstanding_user_id_00b147e5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_userstanding`
--

LOCK TABLES `student_userstanding` WRITE;
/*!40000 ALTER TABLE `student_userstanding` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_userstanding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_usertestgroup`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_usertestgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_usertestgroup_name_94f48ddb` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_usertestgroup`
--

LOCK TABLES `student_usertestgroup` WRITE;
/*!40000 ALTER TABLE `student_usertestgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_usertestgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_usertestgroup_users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_usertestgroup_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usertestgroup_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_usertestgroup_us_usertestgroup_id_user_id_2bbf095a_uniq` (`usertestgroup_id`,`user_id`),
  KEY `student_usertestgroup_users_user_id_81b93062_fk_auth_user_id` (`user_id`),
  CONSTRAINT `student_usertestgrou_usertestgroup_id_a9097958_fk_student_u` FOREIGN KEY (`usertestgroup_id`) REFERENCES `student_usertestgroup` (`id`),
  CONSTRAINT `student_usertestgroup_users_user_id_81b93062_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_usertestgroup_users`
--

LOCK TABLES `student_usertestgroup_users` WRITE;
/*!40000 ALTER TABLE `student_usertestgroup_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_usertestgroup_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions_score`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submissions_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `points_earned` int(10) unsigned NOT NULL,
  `points_possible` int(10) unsigned NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `reset` tinyint(1) NOT NULL,
  `student_item_id` int(11) NOT NULL,
  `submission_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `submissions_score_created_at_b65f0390` (`created_at`),
  KEY `submissions_score_student_item_id_de4f5954_fk_submissio` (`student_item_id`),
  KEY `submissions_score_submission_id_ba095829_fk_submissio` (`submission_id`),
  CONSTRAINT `submissions_score_student_item_id_de4f5954_fk_submissio` FOREIGN KEY (`student_item_id`) REFERENCES `submissions_studentitem` (`id`),
  CONSTRAINT `submissions_score_submission_id_ba095829_fk_submissio` FOREIGN KEY (`submission_id`) REFERENCES `submissions_submission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions_score`
--

LOCK TABLES `submissions_score` WRITE;
/*!40000 ALTER TABLE `submissions_score` DISABLE KEYS */;
/*!40000 ALTER TABLE `submissions_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions_scoreannotation`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submissions_scoreannotation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `annotation_type` varchar(255) NOT NULL,
  `creator` varchar(255) NOT NULL,
  `reason` longtext NOT NULL,
  `score_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `submissions_scoreann_score_id_2dda6e02_fk_submissio` (`score_id`),
  KEY `submissions_scoreannotation_annotation_type_117a2607` (`annotation_type`),
  KEY `submissions_scoreannotation_creator_5cc126cc` (`creator`),
  CONSTRAINT `submissions_scoreann_score_id_2dda6e02_fk_submissio` FOREIGN KEY (`score_id`) REFERENCES `submissions_score` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions_scoreannotation`
--

LOCK TABLES `submissions_scoreannotation` WRITE;
/*!40000 ALTER TABLE `submissions_scoreannotation` DISABLE KEYS */;
/*!40000 ALTER TABLE `submissions_scoreannotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions_scoresummary`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submissions_scoresummary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `highest_id` int(11) NOT NULL,
  `latest_id` int(11) NOT NULL,
  `student_item_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_item_id` (`student_item_id`),
  KEY `submissions_scoresum_highest_id_3efe897d_fk_submissio` (`highest_id`),
  KEY `submissions_scoresum_latest_id_dd8a17bb_fk_submissio` (`latest_id`),
  CONSTRAINT `submissions_scoresum_highest_id_3efe897d_fk_submissio` FOREIGN KEY (`highest_id`) REFERENCES `submissions_score` (`id`),
  CONSTRAINT `submissions_scoresum_latest_id_dd8a17bb_fk_submissio` FOREIGN KEY (`latest_id`) REFERENCES `submissions_score` (`id`),
  CONSTRAINT `submissions_scoresum_student_item_id_35f8ef06_fk_submissio` FOREIGN KEY (`student_item_id`) REFERENCES `submissions_studentitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions_scoresummary`
--

LOCK TABLES `submissions_scoresummary` WRITE;
/*!40000 ALTER TABLE `submissions_scoresummary` DISABLE KEYS */;
/*!40000 ALTER TABLE `submissions_scoresummary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions_studentitem`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submissions_studentitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(255) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `item_type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `submissions_studentitem_course_id_student_id_ite_5b02ecf8_uniq` (`course_id`,`student_id`,`item_id`),
  KEY `submissions_studentitem_student_id_8e72bcd9` (`student_id`),
  KEY `submissions_studentitem_course_id_05ee1efe` (`course_id`),
  KEY `submissions_studentitem_item_id_6c409784` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions_studentitem`
--

LOCK TABLES `submissions_studentitem` WRITE;
/*!40000 ALTER TABLE `submissions_studentitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `submissions_studentitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions_submission`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submissions_submission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(32) NOT NULL,
  `attempt_number` int(10) unsigned NOT NULL,
  `submitted_at` datetime(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `raw_answer` longtext NOT NULL,
  `student_item_id` int(11) NOT NULL,
  `status` varchar(1) NOT NULL,
  `team_submission_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `submissions_submissi_student_item_id_9d087470_fk_submissio` (`student_item_id`),
  KEY `submissions_submission_uuid_210428ab` (`uuid`),
  KEY `submissions_submission_submitted_at_9653124d` (`submitted_at`),
  KEY `submissions_submission_created_at_01c4bf22` (`created_at`),
  KEY `submissions_submissi_team_submission_id_40e6bc97_fk_submissio` (`team_submission_id`),
  CONSTRAINT `submissions_submissi_student_item_id_9d087470_fk_submissio` FOREIGN KEY (`student_item_id`) REFERENCES `submissions_studentitem` (`id`),
  CONSTRAINT `submissions_submissi_team_submission_id_40e6bc97_fk_submissio` FOREIGN KEY (`team_submission_id`) REFERENCES `submissions_teamsubmission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions_submission`
--

LOCK TABLES `submissions_submission` WRITE;
/*!40000 ALTER TABLE `submissions_submission` DISABLE KEYS */;
/*!40000 ALTER TABLE `submissions_submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions_teamsubmission`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submissions_teamsubmission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `uuid` char(32) NOT NULL,
  `attempt_number` int(10) unsigned NOT NULL,
  `submitted_at` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `team_id` varchar(255) NOT NULL,
  `status` varchar(1) NOT NULL,
  `submitted_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `submissions_teamsubm_submitted_by_id_5a27162a_fk_auth_user` (`submitted_by_id`),
  KEY `submissions_teamsubmission_uuid_4d1aef87` (`uuid`),
  KEY `submissions_teamsubmission_submitted_at_74e28ed6` (`submitted_at`),
  KEY `submissions_teamsubmission_course_id_68c6908d` (`course_id`),
  KEY `submissions_teamsubmission_item_id_2bdcb26c` (`item_id`),
  KEY `submissions_teamsubmission_team_id_5fda0e54` (`team_id`),
  CONSTRAINT `submissions_teamsubm_submitted_by_id_5a27162a_fk_auth_user` FOREIGN KEY (`submitted_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions_teamsubmission`
--

LOCK TABLES `submissions_teamsubmission` WRITE;
/*!40000 ALTER TABLE `submissions_teamsubmission` DISABLE KEYS */;
/*!40000 ALTER TABLE `submissions_teamsubmission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `super_csv_csvoperation`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `super_csv_csvoperation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `class_name` varchar(255) NOT NULL,
  `unique_id` varchar(255) NOT NULL,
  `operation` varchar(255) NOT NULL,
  `data` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `original_filename` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `super_csv_csvoperation_class_name_c8b5b4e2` (`class_name`),
  KEY `super_csv_csvoperation_unique_id_08aa974e` (`unique_id`),
  KEY `super_csv_csvoperation_user_id_f87de59a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `super_csv_csvoperation_user_id_f87de59a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `super_csv_csvoperation`
--

LOCK TABLES `super_csv_csvoperation` WRITE;
/*!40000 ALTER TABLE `super_csv_csvoperation` DISABLE KEYS */;
/*!40000 ALTER TABLE `super_csv_csvoperation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_surveyanswer`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_surveyanswer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `field_name` varchar(255) NOT NULL,
  `field_value` varchar(1024) NOT NULL,
  `course_key` varchar(255) DEFAULT NULL,
  `form_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `survey_surveyanswer_field_name_7123dc3d` (`field_name`),
  KEY `survey_surveyanswer_course_key_497ade68` (`course_key`),
  KEY `survey_surveyanswer_form_id_7f0df59f_fk_survey_surveyform_id` (`form_id`),
  KEY `survey_surveyanswer_user_id_4c028d25_fk_auth_user_id` (`user_id`),
  CONSTRAINT `survey_surveyanswer_form_id_7f0df59f_fk_survey_surveyform_id` FOREIGN KEY (`form_id`) REFERENCES `survey_surveyform` (`id`),
  CONSTRAINT `survey_surveyanswer_user_id_4c028d25_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_surveyanswer`
--

LOCK TABLES `survey_surveyanswer` WRITE;
/*!40000 ALTER TABLE `survey_surveyanswer` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_surveyanswer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_surveyform`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_surveyform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `form` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_surveyform`
--

LOCK TABLES `survey_surveyform` WRITE;
/*!40000 ALTER TABLE `survey_surveyform` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_surveyform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_wide_roles_systemwiderole`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_wide_roles_systemwiderole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_wide_roles_systemwiderole`
--

LOCK TABLES `system_wide_roles_systemwiderole` WRITE;
/*!40000 ALTER TABLE `system_wide_roles_systemwiderole` DISABLE KEYS */;
INSERT INTO `system_wide_roles_systemwiderole` VALUES (1,'2021-07-30 19:58:04.166906','2021-07-30 19:58:04.166906','student_support_admin',NULL);
/*!40000 ALTER TABLE `system_wide_roles_systemwiderole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_wide_roles_systemwideroleassignment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_wide_roles_systemwideroleassignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `applies_to_all_contexts` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `system_wide_roles_sy_role_id_b553068b_fk_system_wi` (`role_id`),
  KEY `system_wide_roles_sy_user_id_8ec7ad0d_fk_auth_user` (`user_id`),
  CONSTRAINT `system_wide_roles_sy_role_id_b553068b_fk_system_wi` FOREIGN KEY (`role_id`) REFERENCES `system_wide_roles_systemwiderole` (`id`),
  CONSTRAINT `system_wide_roles_sy_user_id_8ec7ad0d_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_wide_roles_systemwideroleassignment`
--

LOCK TABLES `system_wide_roles_systemwideroleassignment` WRITE;
/*!40000 ALTER TABLE `system_wide_roles_systemwideroleassignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_wide_roles_systemwideroleassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagging_tagavailablevalues`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagging_tagavailablevalues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tagging_tagavailable_category_id_9cc60a44_fk_tagging_t` (`category_id`),
  CONSTRAINT `tagging_tagavailable_category_id_9cc60a44_fk_tagging_t` FOREIGN KEY (`category_id`) REFERENCES `tagging_tagcategories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagging_tagavailablevalues`
--

LOCK TABLES `tagging_tagavailablevalues` WRITE;
/*!40000 ALTER TABLE `tagging_tagavailablevalues` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagging_tagavailablevalues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagging_tagcategories`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagging_tagcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagging_tagcategories`
--

LOCK TABLES `tagging_tagcategories` WRITE;
/*!40000 ALTER TABLE `tagging_tagcategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagging_tagcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams_courseteam`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams_courseteam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` varchar(255) NOT NULL,
  `discussion_topic_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `topic_id` varchar(255) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `description` varchar(300) NOT NULL,
  `country` varchar(2) NOT NULL,
  `language` varchar(16) NOT NULL,
  `last_activity_at` datetime(6) NOT NULL,
  `team_size` int(11) NOT NULL,
  `organization_protected` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `team_id` (`team_id`),
  UNIQUE KEY `discussion_topic_id` (`discussion_topic_id`),
  KEY `teams_courseteam_name_3bef5f8c` (`name`),
  KEY `teams_courseteam_course_id_1e7dbede` (`course_id`),
  KEY `teams_courseteam_topic_id_4d4f5d0d` (`topic_id`),
  KEY `teams_courseteam_last_activity_at_376db5d3` (`last_activity_at`),
  KEY `teams_courseteam_team_size_d264574e` (`team_size`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_courseteam`
--

LOCK TABLES `teams_courseteam` WRITE;
/*!40000 ALTER TABLE `teams_courseteam` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams_courseteam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams_courseteammembership`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams_courseteammembership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_joined` datetime(6) NOT NULL,
  `last_activity_at` datetime(6) NOT NULL,
  `team_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `teams_courseteammembership_user_id_team_id_aa45a20c_uniq` (`user_id`,`team_id`),
  KEY `teams_courseteammemb_team_id_b021eccd_fk_teams_cou` (`team_id`),
  CONSTRAINT `teams_courseteammemb_team_id_b021eccd_fk_teams_cou` FOREIGN KEY (`team_id`) REFERENCES `teams_courseteam` (`id`),
  CONSTRAINT `teams_courseteammembership_user_id_18f9ff5d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_courseteammembership`
--

LOCK TABLES `teams_courseteammembership` WRITE;
/*!40000 ALTER TABLE `teams_courseteammembership` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams_courseteammembership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theming_sitetheme`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theming_sitetheme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme_dir_name` varchar(255) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `theming_sitetheme_site_id_fe93d039_fk_django_site_id` (`site_id`),
  CONSTRAINT `theming_sitetheme_site_id_fe93d039_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theming_sitetheme`
--

LOCK TABLES `theming_sitetheme` WRITE;
/*!40000 ALTER TABLE `theming_sitetheme` DISABLE KEYS */;
/*!40000 ALTER TABLE `theming_sitetheme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `third_party_auth_ltiproviderconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `third_party_auth_ltiproviderconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `name` varchar(50) NOT NULL,
  `skip_registration_form` tinyint(1) NOT NULL,
  `skip_email_verification` tinyint(1) NOT NULL,
  `lti_consumer_key` varchar(255) NOT NULL,
  `lti_hostname` varchar(255) NOT NULL,
  `lti_consumer_secret` varchar(255) NOT NULL,
  `lti_max_timestamp_age` int(11) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `visible` tinyint(1) NOT NULL,
  `site_id` int(11) NOT NULL,
  `max_session_length` int(10) unsigned DEFAULT NULL,
  `skip_hinted_login_dialog` tinyint(1) NOT NULL,
  `send_to_registration_first` tinyint(1) NOT NULL,
  `sync_learner_profile_data` tinyint(1) NOT NULL,
  `send_welcome_email` tinyint(1) NOT NULL,
  `slug` varchar(30) NOT NULL,
  `enable_sso_id_verification` tinyint(1) NOT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `disable_for_enterprise_sso` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `third_party_auth_lti_changed_by_id_7b39c829_fk_auth_user` (`changed_by_id`),
  KEY `third_party_auth_lti_site_id_c8442a80_fk_django_si` (`site_id`),
  KEY `third_party_auth_lti_organization_id_7494c417_fk_organizat` (`organization_id`),
  KEY `third_party_auth_ltiproviderconfig_lti_hostname_540ce676` (`lti_hostname`),
  KEY `third_party_auth_ltiproviderconfig_slug_9cd23a79` (`slug`),
  CONSTRAINT `third_party_auth_lti_changed_by_id_7b39c829_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `third_party_auth_lti_organization_id_7494c417_fk_organizat` FOREIGN KEY (`organization_id`) REFERENCES `organizations_organization` (`id`),
  CONSTRAINT `third_party_auth_lti_site_id_c8442a80_fk_django_si` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `third_party_auth_ltiproviderconfig`
--

LOCK TABLES `third_party_auth_ltiproviderconfig` WRITE;
/*!40000 ALTER TABLE `third_party_auth_ltiproviderconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `third_party_auth_ltiproviderconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `third_party_auth_oauth2providerconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `third_party_auth_oauth2providerconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `icon_class` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `secondary` tinyint(1) NOT NULL,
  `skip_registration_form` tinyint(1) NOT NULL,
  `skip_email_verification` tinyint(1) NOT NULL,
  `backend_name` varchar(50) NOT NULL,
  `key` longtext NOT NULL,
  `secret` longtext NOT NULL,
  `other_settings` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `icon_image` varchar(100) NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `site_id` int(11) NOT NULL,
  `max_session_length` int(10) unsigned DEFAULT NULL,
  `skip_hinted_login_dialog` tinyint(1) NOT NULL,
  `send_to_registration_first` tinyint(1) NOT NULL,
  `sync_learner_profile_data` tinyint(1) NOT NULL,
  `send_welcome_email` tinyint(1) NOT NULL,
  `slug` varchar(30) NOT NULL,
  `enable_sso_id_verification` tinyint(1) NOT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `disable_for_enterprise_sso` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `third_party_auth_oau_changed_by_id_55219296_fk_auth_user` (`changed_by_id`),
  KEY `third_party_auth_oau_site_id_a4ae3e66_fk_django_si` (`site_id`),
  KEY `third_party_auth_oau_organization_id_cc8874ba_fk_organizat` (`organization_id`),
  KEY `third_party_auth_oauth2providerconfig_backend_name_0c14d294` (`backend_name`),
  KEY `third_party_auth_oauth2providerconfig_slug_226038d8` (`slug`),
  CONSTRAINT `third_party_auth_oau_changed_by_id_55219296_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `third_party_auth_oau_organization_id_cc8874ba_fk_organizat` FOREIGN KEY (`organization_id`) REFERENCES `organizations_organization` (`id`),
  CONSTRAINT `third_party_auth_oau_site_id_a4ae3e66_fk_django_si` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `third_party_auth_oauth2providerconfig`
--

LOCK TABLES `third_party_auth_oauth2providerconfig` WRITE;
/*!40000 ALTER TABLE `third_party_auth_oauth2providerconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `third_party_auth_oauth2providerconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `third_party_auth_samlconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `third_party_auth_samlconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `private_key` longtext NOT NULL,
  `public_key` longtext NOT NULL,
  `entity_id` varchar(255) NOT NULL,
  `org_info_str` longtext NOT NULL,
  `other_config_str` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `site_id` int(11) NOT NULL,
  `slug` varchar(30) NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `third_party_auth_sam_changed_by_id_c9343fb9_fk_auth_user` (`changed_by_id`),
  KEY `third_party_auth_sam_site_id_8fab01ee_fk_django_si` (`site_id`),
  KEY `third_party_auth_samlconfiguration_slug_f9008e26` (`slug`),
  CONSTRAINT `third_party_auth_sam_changed_by_id_c9343fb9_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `third_party_auth_sam_site_id_8fab01ee_fk_django_si` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `third_party_auth_samlconfiguration`
--

LOCK TABLES `third_party_auth_samlconfiguration` WRITE;
/*!40000 ALTER TABLE `third_party_auth_samlconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `third_party_auth_samlconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `third_party_auth_samlproviderconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `third_party_auth_samlproviderconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `icon_class` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `secondary` tinyint(1) NOT NULL,
  `skip_registration_form` tinyint(1) NOT NULL,
  `skip_email_verification` tinyint(1) NOT NULL,
  `backend_name` varchar(50) NOT NULL,
  `entity_id` varchar(255) NOT NULL,
  `metadata_source` varchar(255) NOT NULL,
  `attr_user_permanent_id` varchar(128) NOT NULL,
  `attr_full_name` varchar(128) NOT NULL,
  `attr_first_name` varchar(128) NOT NULL,
  `attr_last_name` varchar(128) NOT NULL,
  `attr_username` varchar(128) NOT NULL,
  `attr_email` varchar(128) NOT NULL,
  `other_settings` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `icon_image` varchar(100) NOT NULL,
  `debug_mode` tinyint(1) NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `site_id` int(11) NOT NULL,
  `automatic_refresh_enabled` tinyint(1) NOT NULL,
  `identity_provider_type` varchar(128) NOT NULL,
  `max_session_length` int(10) unsigned DEFAULT NULL,
  `skip_hinted_login_dialog` tinyint(1) NOT NULL,
  `send_to_registration_first` tinyint(1) NOT NULL,
  `sync_learner_profile_data` tinyint(1) NOT NULL,
  `archived` tinyint(1) NOT NULL,
  `saml_configuration_id` int(11) DEFAULT NULL,
  `send_welcome_email` tinyint(1) NOT NULL,
  `slug` varchar(30) NOT NULL,
  `enable_sso_id_verification` tinyint(1) NOT NULL,
  `default_email` varchar(255) NOT NULL,
  `default_first_name` varchar(255) NOT NULL,
  `default_full_name` varchar(255) NOT NULL,
  `default_last_name` varchar(255) NOT NULL,
  `default_username` varchar(255) NOT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `country` varchar(128) NOT NULL,
  `disable_for_enterprise_sso` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `third_party_auth_sam_changed_by_id_4c8fa8c0_fk_auth_user` (`changed_by_id`),
  KEY `third_party_auth_sam_site_id_b7e2af73_fk_django_si` (`site_id`),
  KEY `third_party_auth_sam_saml_configuration_i_eeb9fe72_fk_third_par` (`saml_configuration_id`),
  KEY `third_party_auth_sam_organization_id_8a7f5596_fk_organizat` (`organization_id`),
  KEY `third_party_auth_samlproviderconfig_slug_95883dea` (`slug`),
  CONSTRAINT `third_party_auth_sam_changed_by_id_4c8fa8c0_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `third_party_auth_sam_organization_id_8a7f5596_fk_organizat` FOREIGN KEY (`organization_id`) REFERENCES `organizations_organization` (`id`),
  CONSTRAINT `third_party_auth_sam_saml_configuration_i_eeb9fe72_fk_third_par` FOREIGN KEY (`saml_configuration_id`) REFERENCES `third_party_auth_samlconfiguration` (`id`),
  CONSTRAINT `third_party_auth_sam_site_id_b7e2af73_fk_django_si` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `third_party_auth_samlproviderconfig`
--

LOCK TABLES `third_party_auth_samlproviderconfig` WRITE;
/*!40000 ALTER TABLE `third_party_auth_samlproviderconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `third_party_auth_samlproviderconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `third_party_auth_samlproviderdata`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `third_party_auth_samlproviderdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fetched_at` datetime(6) NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `entity_id` varchar(255) NOT NULL,
  `sso_url` varchar(200) NOT NULL,
  `public_key` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `third_party_auth_samlproviderdata_fetched_at_2286ac32` (`fetched_at`),
  KEY `third_party_auth_samlproviderdata_expires_at_eaf594c7` (`expires_at`),
  KEY `third_party_auth_samlproviderdata_entity_id_b163c6fc` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `third_party_auth_samlproviderdata`
--

LOCK TABLES `third_party_auth_samlproviderdata` WRITE;
/*!40000 ALTER TABLE `third_party_auth_samlproviderdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `third_party_auth_samlproviderdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thumbnail_kvstore`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thumbnail_kvstore` (
  `key` varchar(200) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thumbnail_kvstore`
--

LOCK TABLES `thumbnail_kvstore` WRITE;
/*!40000 ALTER TABLE `thumbnail_kvstore` DISABLE KEYS */;
/*!40000 ALTER TABLE `thumbnail_kvstore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_api_retirementstate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_api_retirementstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state_name` varchar(30) NOT NULL,
  `state_execution_order` smallint(6) NOT NULL,
  `is_dead_end_state` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `state_name` (`state_name`),
  UNIQUE KEY `state_execution_order` (`state_execution_order`),
  KEY `user_api_retirementstate_is_dead_end_state_62eaf9b7` (`is_dead_end_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_api_retirementstate`
--

LOCK TABLES `user_api_retirementstate` WRITE;
/*!40000 ALTER TABLE `user_api_retirementstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_api_retirementstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_api_usercoursetag`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_api_usercoursetag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_api_usercoursetag_user_id_course_id_key_d73150ab_uniq` (`user_id`,`course_id`,`key`),
  KEY `user_api_usercoursetag_key_d6420575` (`key`),
  KEY `user_api_usercoursetag_course_id_a336d583` (`course_id`),
  CONSTRAINT `user_api_usercoursetag_user_id_106a4cbc_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_api_usercoursetag`
--

LOCK TABLES `user_api_usercoursetag` WRITE;
/*!40000 ALTER TABLE `user_api_usercoursetag` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_api_usercoursetag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_api_userorgtag`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_api_userorgtag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `key` varchar(255) NOT NULL,
  `org` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_api_userorgtag_user_id_org_key_d4df9ac1_uniq` (`user_id`,`org`,`key`),
  KEY `user_api_userorgtag_key_b1f2bafe` (`key`),
  KEY `user_api_userorgtag_org_41caa15c` (`org`),
  CONSTRAINT `user_api_userorgtag_user_id_cc0d415d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_api_userorgtag`
--

LOCK TABLES `user_api_userorgtag` WRITE;
/*!40000 ALTER TABLE `user_api_userorgtag` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_api_userorgtag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_api_userpreference`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_api_userpreference` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_api_userpreference_user_id_key_17924c0d_uniq` (`user_id`,`key`),
  KEY `user_api_userpreference_key_9c8a8f6b` (`key`),
  CONSTRAINT `user_api_userpreference_user_id_68f8a34b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_api_userpreference`
--

LOCK TABLES `user_api_userpreference` WRITE;
/*!40000 ALTER TABLE `user_api_userpreference` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_api_userpreference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_api_userretirementpartnerreportingstatus`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_api_userretirementpartnerreportingstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `original_username` varchar(150) NOT NULL,
  `original_email` varchar(254) NOT NULL,
  `original_name` varchar(255) NOT NULL,
  `is_being_processed` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `user_api_userretirementpart_original_username_6bf5d3d1` (`original_username`),
  KEY `user_api_userretirementpart_original_email_aaab0bc9` (`original_email`),
  KEY `user_api_userretirementpart_original_name_9aedd7f0` (`original_name`),
  CONSTRAINT `user_api_userretirem_user_id_272c8f78_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_api_userretirementpartnerreportingstatus`
--

LOCK TABLES `user_api_userretirementpartnerreportingstatus` WRITE;
/*!40000 ALTER TABLE `user_api_userretirementpartnerreportingstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_api_userretirementpartnerreportingstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_api_userretirementrequest`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_api_userretirementrequest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `user_api_userretirementrequest_user_id_7f7ca22f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_api_userretirementrequest`
--

LOCK TABLES `user_api_userretirementrequest` WRITE;
/*!40000 ALTER TABLE `user_api_userretirementrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_api_userretirementrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_api_userretirementstatus`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_api_userretirementstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `original_username` varchar(150) NOT NULL,
  `original_email` varchar(254) NOT NULL,
  `original_name` varchar(255) NOT NULL,
  `retired_username` varchar(150) NOT NULL,
  `retired_email` varchar(254) NOT NULL,
  `responses` longtext NOT NULL,
  `current_state_id` int(11) NOT NULL,
  `last_state_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `user_api_userretirem_current_state_id_e37bb094_fk_user_api_` (`current_state_id`),
  KEY `user_api_userretirem_last_state_id_359e74cd_fk_user_api_` (`last_state_id`),
  KEY `user_api_userretirementstatus_original_username_fa5d4a21` (`original_username`),
  KEY `user_api_userretirementstatus_original_email_a7203bff` (`original_email`),
  KEY `user_api_userretirementstatus_original_name_17c2846b` (`original_name`),
  KEY `user_api_userretirementstatus_retired_username_52067a53` (`retired_username`),
  KEY `user_api_userretirementstatus_retired_email_ee7c1579` (`retired_email`),
  CONSTRAINT `user_api_userretirem_current_state_id_e37bb094_fk_user_api_` FOREIGN KEY (`current_state_id`) REFERENCES `user_api_retirementstate` (`id`),
  CONSTRAINT `user_api_userretirem_last_state_id_359e74cd_fk_user_api_` FOREIGN KEY (`last_state_id`) REFERENCES `user_api_retirementstate` (`id`),
  CONSTRAINT `user_api_userretirementstatus_user_id_aca4dc7b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_api_userretirementstatus`
--

LOCK TABLES `user_api_userretirementstatus` WRITE;
/*!40000 ALTER TABLE `user_api_userretirementstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_api_userretirementstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tasks_usertaskartifact`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tasks_usertaskartifact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `uuid` char(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file` varchar(100) DEFAULT NULL,
  `url` longtext NOT NULL,
  `text` longtext NOT NULL,
  `status_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `user_tasks_usertaska_status_id_641f31be_fk_user_task` (`status_id`),
  CONSTRAINT `user_tasks_usertaska_status_id_641f31be_fk_user_task` FOREIGN KEY (`status_id`) REFERENCES `user_tasks_usertaskstatus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tasks_usertaskartifact`
--

LOCK TABLES `user_tasks_usertaskartifact` WRITE;
/*!40000 ALTER TABLE `user_tasks_usertaskartifact` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_tasks_usertaskartifact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tasks_usertaskstatus`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tasks_usertaskstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `uuid` char(32) NOT NULL,
  `task_id` varchar(128) NOT NULL,
  `is_container` tinyint(1) NOT NULL,
  `task_class` varchar(128) NOT NULL,
  `name` varchar(255) NOT NULL,
  `state` varchar(128) NOT NULL,
  `completed_steps` smallint(5) unsigned NOT NULL,
  `total_steps` smallint(5) unsigned NOT NULL,
  `attempts` smallint(5) unsigned NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `user_tasks_usertasks_parent_id_5009f727_fk_user_task` (`parent_id`),
  KEY `user_tasks_usertaskstatus_user_id_5bec3d4a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `user_tasks_usertasks_parent_id_5009f727_fk_user_task` FOREIGN KEY (`parent_id`) REFERENCES `user_tasks_usertaskstatus` (`id`),
  CONSTRAINT `user_tasks_usertaskstatus_user_id_5bec3d4a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tasks_usertaskstatus`
--

LOCK TABLES `user_tasks_usertaskstatus` WRITE;
/*!40000 ALTER TABLE `user_tasks_usertaskstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_tasks_usertaskstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `util_ratelimitconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `util_ratelimitconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `util_ratelimitconfig_changed_by_id_794ac118_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `util_ratelimitconfig_changed_by_id_794ac118_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `util_ratelimitconfiguration`
--

LOCK TABLES `util_ratelimitconfiguration` WRITE;
/*!40000 ALTER TABLE `util_ratelimitconfiguration` DISABLE KEYS */;
INSERT INTO `util_ratelimitconfiguration` VALUES (1,'2021-07-30 19:58:12.583225',1,NULL);
/*!40000 ALTER TABLE `util_ratelimitconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verified_track_content_migrateverifiedtrackcohortssetting`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verified_track_content_migrateverifiedtrackcohortssetting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `old_course_key` varchar(255) NOT NULL,
  `rerun_course_key` varchar(255) NOT NULL,
  `audit_cohort_names` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `verified_track_conte_changed_by_id_29944bff_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `verified_track_conte_changed_by_id_29944bff_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verified_track_content_migrateverifiedtrackcohortssetting`
--

LOCK TABLES `verified_track_content_migrateverifiedtrackcohortssetting` WRITE;
/*!40000 ALTER TABLE `verified_track_content_migrateverifiedtrackcohortssetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `verified_track_content_migrateverifiedtrackcohortssetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verified_track_content_verifiedtrackcohortedcourse`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verified_track_content_verifiedtrackcohortedcourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_key` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `verified_cohort_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_key` (`course_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verified_track_content_verifiedtrackcohortedcourse`
--

LOCK TABLES `verified_track_content_verifiedtrackcohortedcourse` WRITE;
/*!40000 ALTER TABLE `verified_track_content_verifiedtrackcohortedcourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `verified_track_content_verifiedtrackcohortedcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verify_student_manualverification`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verify_student_manualverification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL,
  `status_changed` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `expiration_date` datetime(6),
  PRIMARY KEY (`id`),
  KEY `verify_student_manua_user_id_f38b72b4_fk_auth_user` (`user_id`),
  KEY `verify_student_manualverification_created_at_e4e3731a` (`created_at`),
  KEY `verify_student_manualverification_updated_at_1a350690` (`updated_at`),
  KEY `verify_student_manualverification_expiration_date_d2feae82` (`expiration_date`),
  CONSTRAINT `verify_student_manua_user_id_f38b72b4_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verify_student_manualverification`
--

LOCK TABLES `verify_student_manualverification` WRITE;
/*!40000 ALTER TABLE `verify_student_manualverification` DISABLE KEYS */;
/*!40000 ALTER TABLE `verify_student_manualverification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verify_student_softwaresecurephotoverification`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verify_student_softwaresecurephotoverification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL,
  `status_changed` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `face_image_url` varchar(255) NOT NULL,
  `photo_id_image_url` varchar(255) NOT NULL,
  `receipt_id` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `display` tinyint(1) NOT NULL,
  `submitted_at` datetime(6) DEFAULT NULL,
  `reviewing_service` varchar(255) NOT NULL,
  `error_msg` longtext NOT NULL,
  `error_code` varchar(50) NOT NULL,
  `photo_id_key` longtext NOT NULL,
  `copy_id_photo_from_id` int(11) DEFAULT NULL,
  `reviewing_user_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `expiry_email_date` datetime(6) DEFAULT NULL,
  `expiration_date` datetime(6),
  PRIMARY KEY (`id`),
  KEY `verify_student_softw_copy_id_photo_from_i_059e40b6_fk_verify_st` (`copy_id_photo_from_id`),
  KEY `verify_student_softw_reviewing_user_id_55fd003a_fk_auth_user` (`reviewing_user_id`),
  KEY `verify_student_softw_user_id_66ca4f6d_fk_auth_user` (`user_id`),
  KEY `verify_student_softwaresecu_receipt_id_2160ce88` (`receipt_id`),
  KEY `verify_student_softwaresecu_created_at_566f779f` (`created_at`),
  KEY `verify_student_softwaresecu_updated_at_8f5cf2d7` (`updated_at`),
  KEY `verify_student_softwaresecurephotoverification_display_287287f8` (`display`),
  KEY `verify_student_softwaresecu_submitted_at_f3d5cd03` (`submitted_at`),
  KEY `verify_student_softwaresecu_expiry_email_date_6ae6d6c9` (`expiry_email_date`),
  KEY `verify_student_softwaresecu_expiration_date_f7f2d890` (`expiration_date`),
  CONSTRAINT `verify_student_softw_copy_id_photo_from_i_059e40b6_fk_verify_st` FOREIGN KEY (`copy_id_photo_from_id`) REFERENCES `verify_student_softwaresecurephotoverification` (`id`),
  CONSTRAINT `verify_student_softw_reviewing_user_id_55fd003a_fk_auth_user` FOREIGN KEY (`reviewing_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `verify_student_softw_user_id_66ca4f6d_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verify_student_softwaresecurephotoverification`
--

LOCK TABLES `verify_student_softwaresecurephotoverification` WRITE;
/*!40000 ALTER TABLE `verify_student_softwaresecurephotoverification` DISABLE KEYS */;
/*!40000 ALTER TABLE `verify_student_softwaresecurephotoverification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verify_student_ssoverification`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verify_student_ssoverification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL,
  `status_changed` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `identity_provider_type` varchar(100) NOT NULL,
  `identity_provider_slug` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL,
  `expiration_date` datetime(6),
  PRIMARY KEY (`id`),
  KEY `verify_student_ssoverification_user_id_5e6186eb_fk_auth_user_id` (`user_id`),
  KEY `verify_student_ssoverification_created_at_6381e5a4` (`created_at`),
  KEY `verify_student_ssoverification_updated_at_9d6cc952` (`updated_at`),
  KEY `verify_student_ssoverification_identity_provider_slug_56c53eb6` (`identity_provider_slug`),
  KEY `verify_student_ssoverification_expiration_date_26ec549d` (`expiration_date`),
  CONSTRAINT `verify_student_ssoverification_user_id_5e6186eb_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verify_student_ssoverification`
--

LOCK TABLES `verify_student_ssoverification` WRITE;
/*!40000 ALTER TABLE `verify_student_ssoverification` DISABLE KEYS */;
/*!40000 ALTER TABLE `verify_student_ssoverification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verify_student_sspverificationretryconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verify_student_sspverificationretryconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `arguments` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `verify_student_sspve_changed_by_id_c035fbe5_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `verify_student_sspve_changed_by_id_c035fbe5_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verify_student_sspverificationretryconfig`
--

LOCK TABLES `verify_student_sspverificationretryconfig` WRITE;
/*!40000 ALTER TABLE `verify_student_sspverificationretryconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `verify_student_sspverificationretryconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verify_student_verificationdeadline`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verify_student_verificationdeadline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_key` varchar(255) NOT NULL,
  `deadline` datetime(6) NOT NULL,
  `deadline_is_explicit` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_key` (`course_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verify_student_verificationdeadline`
--

LOCK TABLES `verify_student_verificationdeadline` WRITE;
/*!40000 ALTER TABLE `verify_student_verificationdeadline` DISABLE KEYS */;
INSERT INTO `verify_student_verificationdeadline` VALUES (1,'2021-07-30 20:20:00.362316','2021-07-30 20:20:00.362316','course-v1:edX+DemoX+Demo_Course','2023-07-30 20:19:59.064405',1);
/*!40000 ALTER TABLE `verify_student_verificationdeadline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_config_coursehlsplaybackenabledflag`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_config_coursehlsplaybackenabledflag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `video_config_courseh_changed_by_id_fa268d53_fk_auth_user` (`changed_by_id`),
  KEY `video_config_coursehlsplaybackenabledflag_course_id_c0fcaead` (`course_id`),
  CONSTRAINT `video_config_courseh_changed_by_id_fa268d53_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_config_coursehlsplaybackenabledflag`
--

LOCK TABLES `video_config_coursehlsplaybackenabledflag` WRITE;
/*!40000 ALTER TABLE `video_config_coursehlsplaybackenabledflag` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_config_coursehlsplaybackenabledflag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_config_coursevideotranscriptenabledflag`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_config_coursevideotranscriptenabledflag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `video_config_coursev_changed_by_id_3bdcf2a6_fk_auth_user` (`changed_by_id`),
  KEY `video_config_coursevideotranscriptenabledflag_course_id_fcfacf5b` (`course_id`),
  CONSTRAINT `video_config_coursev_changed_by_id_3bdcf2a6_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_config_coursevideotranscriptenabledflag`
--

LOCK TABLES `video_config_coursevideotranscriptenabledflag` WRITE;
/*!40000 ALTER TABLE `video_config_coursevideotranscriptenabledflag` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_config_coursevideotranscriptenabledflag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_config_courseyoutubeblockedflag`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_config_courseyoutubeblockedflag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `video_config_coursey_changed_by_id_3496713f_fk_auth_user` (`changed_by_id`),
  KEY `video_config_courseyoutubeblockedflag_course_id_4c9395c6` (`course_id`),
  CONSTRAINT `video_config_coursey_changed_by_id_3496713f_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_config_courseyoutubeblockedflag`
--

LOCK TABLES `video_config_courseyoutubeblockedflag` WRITE;
/*!40000 ALTER TABLE `video_config_courseyoutubeblockedflag` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_config_courseyoutubeblockedflag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_config_hlsplaybackenabledflag`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_config_hlsplaybackenabledflag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `enabled_for_all_courses` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `video_config_hlsplay_changed_by_id_d93f2234_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `video_config_hlsplay_changed_by_id_d93f2234_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_config_hlsplaybackenabledflag`
--

LOCK TABLES `video_config_hlsplaybackenabledflag` WRITE;
/*!40000 ALTER TABLE `video_config_hlsplaybackenabledflag` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_config_hlsplaybackenabledflag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_config_migrationenqueuedcourse`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_config_migrationenqueuedcourse` (
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `command_run` int(10) unsigned NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_config_migrationenqueuedcourse`
--

LOCK TABLES `video_config_migrationenqueuedcourse` WRITE;
/*!40000 ALTER TABLE `video_config_migrationenqueuedcourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_config_migrationenqueuedcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_config_transcriptmigrationsetting`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_config_transcriptmigrationsetting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `force_update` tinyint(1) NOT NULL,
  `commit` tinyint(1) NOT NULL,
  `all_courses` tinyint(1) NOT NULL,
  `course_ids` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `command_run` int(10) unsigned NOT NULL,
  `batch_size` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `video_config_transcr_changed_by_id_4c7817bd_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `video_config_transcr_changed_by_id_4c7817bd_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_config_transcriptmigrationsetting`
--

LOCK TABLES `video_config_transcriptmigrationsetting` WRITE;
/*!40000 ALTER TABLE `video_config_transcriptmigrationsetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_config_transcriptmigrationsetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_config_updatedcoursevideos`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_config_updatedcoursevideos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `edx_video_id` varchar(100) NOT NULL,
  `command_run` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `video_config_updatedcour_course_id_edx_video_id_455a73ff_uniq` (`course_id`,`edx_video_id`),
  KEY `video_config_updatedcoursevideos_course_id_e72703a3` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_config_updatedcoursevideos`
--

LOCK TABLES `video_config_updatedcoursevideos` WRITE;
/*!40000 ALTER TABLE `video_config_updatedcoursevideos` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_config_updatedcoursevideos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_config_videothumbnailsetting`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_config_videothumbnailsetting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `command_run` int(10) unsigned NOT NULL,
  `batch_size` int(10) unsigned NOT NULL,
  `videos_per_task` int(10) unsigned NOT NULL,
  `commit` tinyint(1) NOT NULL,
  `all_course_videos` tinyint(1) NOT NULL,
  `course_ids` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `offset` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `video_config_videoth_changed_by_id_9385a0b2_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `video_config_videoth_changed_by_id_9385a0b2_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_config_videothumbnailsetting`
--

LOCK TABLES `video_config_videothumbnailsetting` WRITE;
/*!40000 ALTER TABLE `video_config_videothumbnailsetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_config_videothumbnailsetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_config_videotranscriptenabledflag`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_config_videotranscriptenabledflag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `enabled_for_all_courses` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `video_config_videotr_changed_by_id_9f0afd7f_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `video_config_videotr_changed_by_id_9f0afd7f_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_config_videotranscriptenabledflag`
--

LOCK TABLES `video_config_videotranscriptenabledflag` WRITE;
/*!40000 ALTER TABLE `video_config_videotranscriptenabledflag` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_config_videotranscriptenabledflag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_pipeline_coursevideouploadsenabledbydefault`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_pipeline_coursevideouploadsenabledbydefault` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `video_pipeline_cours_changed_by_id_84ec1a58_fk_auth_user` (`changed_by_id`),
  KEY `video_pipeline_coursevideou_course_id_9fd1b18b` (`course_id`),
  CONSTRAINT `video_pipeline_cours_changed_by_id_84ec1a58_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_pipeline_coursevideouploadsenabledbydefault`
--

LOCK TABLES `video_pipeline_coursevideouploadsenabledbydefault` WRITE;
/*!40000 ALTER TABLE `video_pipeline_coursevideouploadsenabledbydefault` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_pipeline_coursevideouploadsenabledbydefault` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_pipeline_vempipelineintegration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_pipeline_vempipelineintegration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `client_name` varchar(100) NOT NULL,
  `api_url` varchar(200) NOT NULL,
  `service_username` varchar(100) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `video_pipeline_vempi_changed_by_id_cadc1895_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `video_pipeline_vempi_changed_by_id_cadc1895_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_pipeline_vempipelineintegration`
--

LOCK TABLES `video_pipeline_vempipelineintegration` WRITE;
/*!40000 ALTER TABLE `video_pipeline_vempipelineintegration` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_pipeline_vempipelineintegration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_pipeline_videouploadsenabledbydefault`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_pipeline_videouploadsenabledbydefault` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `enabled_for_all_courses` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `video_pipeline_video_changed_by_id_3d066822_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `video_pipeline_video_changed_by_id_3d066822_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_pipeline_videouploadsenabledbydefault`
--

LOCK TABLES `video_pipeline_videouploadsenabledbydefault` WRITE;
/*!40000 ALTER TABLE `video_pipeline_videouploadsenabledbydefault` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_pipeline_videouploadsenabledbydefault` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waffle_flag`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waffle_flag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `everyone` tinyint(1) DEFAULT NULL,
  `percent` decimal(3,1) DEFAULT NULL,
  `testing` tinyint(1) NOT NULL,
  `superusers` tinyint(1) NOT NULL,
  `staff` tinyint(1) NOT NULL,
  `authenticated` tinyint(1) NOT NULL,
  `languages` longtext NOT NULL,
  `rollout` tinyint(1) NOT NULL,
  `note` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `waffle_flag_created_4a6e8cef` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_flag`
--

LOCK TABLES `waffle_flag` WRITE;
/*!40000 ALTER TABLE `waffle_flag` DISABLE KEYS */;
INSERT INTO `waffle_flag` VALUES (2,'grades.rejected_exam_overrides_grade',1,NULL,0,1,0,0,'',0,'','2021-07-30 19:57:28.611436','2021-07-30 19:57:28.611457'),(3,'grades.enforce_freeze_grade_after_course_end',1,NULL,0,1,0,0,'',0,'','2021-07-30 19:57:28.614958','2021-07-30 19:57:28.614974'),(4,'grades.writable_gradebook',1,NULL,0,1,0,0,'',0,'','2021-07-30 19:57:28.619924','2021-07-30 19:57:28.619941'),(5,'studio.enable_checklists_quality',1,NULL,0,1,0,0,'',0,'','2021-07-30 20:01:12.215572','2021-07-30 20:01:12.215591');
/*!40000 ALTER TABLE `waffle_flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waffle_flag_groups`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waffle_flag_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flag_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `waffle_flag_groups_flag_id_group_id_8ba0c71b_uniq` (`flag_id`,`group_id`),
  KEY `waffle_flag_groups_group_id_a97c4f66_fk_auth_group_id` (`group_id`),
  CONSTRAINT `waffle_flag_groups_flag_id_c11c0c05_fk_waffle_flag_id` FOREIGN KEY (`flag_id`) REFERENCES `waffle_flag` (`id`),
  CONSTRAINT `waffle_flag_groups_group_id_a97c4f66_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_flag_groups`
--

LOCK TABLES `waffle_flag_groups` WRITE;
/*!40000 ALTER TABLE `waffle_flag_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `waffle_flag_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waffle_flag_users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waffle_flag_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flag_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `waffle_flag_users_flag_id_user_id_b46f76b0_uniq` (`flag_id`,`user_id`),
  KEY `waffle_flag_users_user_id_8026df9b_fk_auth_user_id` (`user_id`),
  CONSTRAINT `waffle_flag_users_flag_id_833c37b0_fk_waffle_flag_id` FOREIGN KEY (`flag_id`) REFERENCES `waffle_flag` (`id`),
  CONSTRAINT `waffle_flag_users_user_id_8026df9b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_flag_users`
--

LOCK TABLES `waffle_flag_users` WRITE;
/*!40000 ALTER TABLE `waffle_flag_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `waffle_flag_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waffle_sample`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waffle_sample` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `percent` decimal(4,1) NOT NULL,
  `note` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `waffle_sample_created_76198bd5` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_sample`
--

LOCK TABLES `waffle_sample` WRITE;
/*!40000 ALTER TABLE `waffle_sample` DISABLE KEYS */;
/*!40000 ALTER TABLE `waffle_sample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waffle_switch`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waffle_switch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `note` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `waffle_switch_created_c004e77e` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_switch`
--

LOCK TABLES `waffle_switch` WRITE;
/*!40000 ALTER TABLE `waffle_switch` DISABLE KEYS */;
/*!40000 ALTER TABLE `waffle_switch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waffle_utils_waffleflagcourseoverridemodel`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waffle_utils_waffleflagcourseoverridemodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `waffle_flag` varchar(255) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `override_choice` varchar(3) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `note` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `waffle_utils_wafflef_changed_by_id_28429bf5_fk_auth_user` (`changed_by_id`),
  KEY `waffle_utils_waffleflagcourseoverridemodel_waffle_flag_d261aad1` (`waffle_flag`),
  KEY `waffle_utils_waffleflagcourseoverridemodel_course_id_e94a9fc3` (`course_id`),
  CONSTRAINT `waffle_utils_wafflef_changed_by_id_28429bf5_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_utils_waffleflagcourseoverridemodel`
--

LOCK TABLES `waffle_utils_waffleflagcourseoverridemodel` WRITE;
/*!40000 ALTER TABLE `waffle_utils_waffleflagcourseoverridemodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `waffle_utils_waffleflagcourseoverridemodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_article`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `group_read` tinyint(1) NOT NULL,
  `group_write` tinyint(1) NOT NULL,
  `other_read` tinyint(1) NOT NULL,
  `other_write` tinyint(1) NOT NULL,
  `current_revision_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `current_revision_id` (`current_revision_id`),
  KEY `wiki_article_group_id_bf035c83_fk_auth_group_id` (`group_id`),
  KEY `wiki_article_owner_id_956bc94a_fk_auth_user_id` (`owner_id`),
  CONSTRAINT `wiki_article_current_revision_id_fc83ea0a_fk_wiki_arti` FOREIGN KEY (`current_revision_id`) REFERENCES `wiki_articlerevision` (`id`),
  CONSTRAINT `wiki_article_group_id_bf035c83_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `wiki_article_owner_id_956bc94a_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_article`
--

LOCK TABLES `wiki_article` WRITE;
/*!40000 ALTER TABLE `wiki_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_articleforobject`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_articleforobject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned NOT NULL,
  `is_mptt` tinyint(1) NOT NULL,
  `article_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wiki_articleforobject_content_type_id_object_id_046be756_uniq` (`content_type_id`,`object_id`),
  KEY `wiki_articleforobject_article_id_7d67d809_fk_wiki_article_id` (`article_id`),
  CONSTRAINT `wiki_articleforobjec_content_type_id_ba569059_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `wiki_articleforobject_article_id_7d67d809_fk_wiki_article_id` FOREIGN KEY (`article_id`) REFERENCES `wiki_article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_articleforobject`
--

LOCK TABLES `wiki_articleforobject` WRITE;
/*!40000 ALTER TABLE `wiki_articleforobject` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_articleforobject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_articleplugin`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_articleplugin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_articleplugin_article_id_9ab0e854_fk_wiki_article_id` (`article_id`),
  CONSTRAINT `wiki_articleplugin_article_id_9ab0e854_fk_wiki_article_id` FOREIGN KEY (`article_id`) REFERENCES `wiki_article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_articleplugin`
--

LOCK TABLES `wiki_articleplugin` WRITE;
/*!40000 ALTER TABLE `wiki_articleplugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_articleplugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_articlerevision`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_articlerevision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revision_number` int(11) NOT NULL,
  `user_message` longtext NOT NULL,
  `automatic_log` longtext NOT NULL,
  `ip_address` char(39) DEFAULT NULL,
  `modified` datetime(6) NOT NULL,
  `created` datetime(6) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `locked` tinyint(1) NOT NULL,
  `content` longtext NOT NULL,
  `title` varchar(512) NOT NULL,
  `article_id` int(11) NOT NULL,
  `previous_revision_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wiki_articlerevision_article_id_revision_number_5bcd5334_uniq` (`article_id`,`revision_number`),
  KEY `wiki_articlerevision_previous_revision_id_bcfaf4c9_fk_wiki_arti` (`previous_revision_id`),
  KEY `wiki_articlerevision_user_id_c687e4de_fk_auth_user_id` (`user_id`),
  CONSTRAINT `wiki_articlerevision_article_id_e0fb2474_fk_wiki_article_id` FOREIGN KEY (`article_id`) REFERENCES `wiki_article` (`id`),
  CONSTRAINT `wiki_articlerevision_previous_revision_id_bcfaf4c9_fk_wiki_arti` FOREIGN KEY (`previous_revision_id`) REFERENCES `wiki_articlerevision` (`id`),
  CONSTRAINT `wiki_articlerevision_user_id_c687e4de_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_articlerevision`
--

LOCK TABLES `wiki_articlerevision` WRITE;
/*!40000 ALTER TABLE `wiki_articlerevision` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_articlerevision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_reusableplugin`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_reusableplugin` (
  `articleplugin_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`articleplugin_ptr_id`),
  CONSTRAINT `wiki_reusableplugin_articleplugin_ptr_id_c1737239_fk_wiki_arti` FOREIGN KEY (`articleplugin_ptr_id`) REFERENCES `wiki_articleplugin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_reusableplugin`
--

LOCK TABLES `wiki_reusableplugin` WRITE;
/*!40000 ALTER TABLE `wiki_reusableplugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_reusableplugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_reusableplugin_articles`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_reusableplugin_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reusableplugin_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wiki_reusableplugin_arti_reusableplugin_id_articl_302a7a01_uniq` (`reusableplugin_id`,`article_id`),
  KEY `wiki_reusableplugin__article_id_8a09d39e_fk_wiki_arti` (`article_id`),
  CONSTRAINT `wiki_reusableplugin__article_id_8a09d39e_fk_wiki_arti` FOREIGN KEY (`article_id`) REFERENCES `wiki_article` (`id`),
  CONSTRAINT `wiki_reusableplugin__reusableplugin_id_52618a1c_fk_wiki_reus` FOREIGN KEY (`reusableplugin_id`) REFERENCES `wiki_reusableplugin` (`articleplugin_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_reusableplugin_articles`
--

LOCK TABLES `wiki_reusableplugin_articles` WRITE;
/*!40000 ALTER TABLE `wiki_reusableplugin_articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_reusableplugin_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_revisionplugin`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_revisionplugin` (
  `articleplugin_ptr_id` int(11) NOT NULL,
  `current_revision_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`articleplugin_ptr_id`),
  UNIQUE KEY `current_revision_id` (`current_revision_id`),
  CONSTRAINT `wiki_revisionplugin_articleplugin_ptr_id_95c295f2_fk_wiki_arti` FOREIGN KEY (`articleplugin_ptr_id`) REFERENCES `wiki_articleplugin` (`id`),
  CONSTRAINT `wiki_revisionplugin_current_revision_id_46514536_fk_wiki_revi` FOREIGN KEY (`current_revision_id`) REFERENCES `wiki_revisionpluginrevision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_revisionplugin`
--

LOCK TABLES `wiki_revisionplugin` WRITE;
/*!40000 ALTER TABLE `wiki_revisionplugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_revisionplugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_revisionpluginrevision`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_revisionpluginrevision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revision_number` int(11) NOT NULL,
  `user_message` longtext NOT NULL,
  `automatic_log` longtext NOT NULL,
  `ip_address` char(39) DEFAULT NULL,
  `modified` datetime(6) NOT NULL,
  `created` datetime(6) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `locked` tinyint(1) NOT NULL,
  `plugin_id` int(11) NOT NULL,
  `previous_revision_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_revisionpluginr_plugin_id_c8f4475b_fk_wiki_revi` (`plugin_id`),
  KEY `wiki_revisionpluginr_previous_revision_id_38c877c0_fk_wiki_revi` (`previous_revision_id`),
  KEY `wiki_revisionpluginrevision_user_id_ee40f729_fk_auth_user_id` (`user_id`),
  CONSTRAINT `wiki_revisionpluginr_plugin_id_c8f4475b_fk_wiki_revi` FOREIGN KEY (`plugin_id`) REFERENCES `wiki_revisionplugin` (`articleplugin_ptr_id`),
  CONSTRAINT `wiki_revisionpluginr_previous_revision_id_38c877c0_fk_wiki_revi` FOREIGN KEY (`previous_revision_id`) REFERENCES `wiki_revisionpluginrevision` (`id`),
  CONSTRAINT `wiki_revisionpluginrevision_user_id_ee40f729_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_revisionpluginrevision`
--

LOCK TABLES `wiki_revisionpluginrevision` WRITE;
/*!40000 ALTER TABLE `wiki_revisionpluginrevision` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_revisionpluginrevision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_simpleplugin`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_simpleplugin` (
  `articleplugin_ptr_id` int(11) NOT NULL,
  `article_revision_id` int(11) NOT NULL,
  PRIMARY KEY (`articleplugin_ptr_id`),
  KEY `wiki_simpleplugin_article_revision_id_cff7df92_fk_wiki_arti` (`article_revision_id`),
  CONSTRAINT `wiki_simpleplugin_article_revision_id_cff7df92_fk_wiki_arti` FOREIGN KEY (`article_revision_id`) REFERENCES `wiki_articlerevision` (`id`),
  CONSTRAINT `wiki_simpleplugin_articleplugin_ptr_id_2b99b828_fk_wiki_arti` FOREIGN KEY (`articleplugin_ptr_id`) REFERENCES `wiki_articleplugin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_simpleplugin`
--

LOCK TABLES `wiki_simpleplugin` WRITE;
/*!40000 ALTER TABLE `wiki_simpleplugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_simpleplugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_urlpath`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_urlpath` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) DEFAULT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `article_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wiki_urlpath_site_id_parent_id_slug_e4942e5d_uniq` (`site_id`,`parent_id`,`slug`),
  KEY `wiki_urlpath_article_id_9ef0c0fb_fk_wiki_article_id` (`article_id`),
  KEY `wiki_urlpath_slug_39d212eb` (`slug`),
  KEY `wiki_urlpath_tree_id_090b475d` (`tree_id`),
  KEY `wiki_urlpath_parent_id_a6e675ac` (`parent_id`),
  CONSTRAINT `wiki_urlpath_article_id_9ef0c0fb_fk_wiki_article_id` FOREIGN KEY (`article_id`) REFERENCES `wiki_article` (`id`),
  CONSTRAINT `wiki_urlpath_parent_id_a6e675ac_fk_wiki_urlpath_id` FOREIGN KEY (`parent_id`) REFERENCES `wiki_urlpath` (`id`),
  CONSTRAINT `wiki_urlpath_site_id_319be912_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_urlpath`
--

LOCK TABLES `wiki_urlpath` WRITE;
/*!40000 ALTER TABLE `wiki_urlpath` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_urlpath` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_assessmentworkflow`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_assessmentworkflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `status` varchar(100) NOT NULL,
  `status_changed` datetime(6) NOT NULL,
  `submission_uuid` varchar(36) NOT NULL,
  `uuid` char(32) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `submission_uuid` (`submission_uuid`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `workflow_assessmentworkflow_course_id_8c2d171b` (`course_id`),
  KEY `workflow_assessmentworkflow_item_id_3ad0d291` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_assessmentworkflow`
--

LOCK TABLES `workflow_assessmentworkflow` WRITE;
/*!40000 ALTER TABLE `workflow_assessmentworkflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_assessmentworkflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_assessmentworkflowcancellation`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_assessmentworkflowcancellation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` longtext NOT NULL,
  `cancelled_by_id` varchar(40) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `workflow_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workflow_assessmentw_workflow_id_5e534711_fk_workflow_` (`workflow_id`),
  KEY `workflow_assessmentworkflowcancellation_cancelled_by_id_8467736a` (`cancelled_by_id`),
  KEY `workflow_assessmentworkflowcancellation_created_at_9da54d83` (`created_at`),
  CONSTRAINT `workflow_assessmentw_workflow_id_5e534711_fk_workflow_` FOREIGN KEY (`workflow_id`) REFERENCES `workflow_assessmentworkflow` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_assessmentworkflowcancellation`
--

LOCK TABLES `workflow_assessmentworkflowcancellation` WRITE;
/*!40000 ALTER TABLE `workflow_assessmentworkflowcancellation` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_assessmentworkflowcancellation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_assessmentworkflowstep`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_assessmentworkflowstep` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `submitter_completed_at` datetime(6) DEFAULT NULL,
  `assessment_completed_at` datetime(6) DEFAULT NULL,
  `order_num` int(10) unsigned NOT NULL,
  `workflow_id` int(11) NOT NULL,
  `skipped` tinyint(1),
  PRIMARY KEY (`id`),
  KEY `workflow_assessmentw_workflow_id_fe52b4aa_fk_workflow_` (`workflow_id`),
  CONSTRAINT `workflow_assessmentw_workflow_id_fe52b4aa_fk_workflow_` FOREIGN KEY (`workflow_id`) REFERENCES `workflow_assessmentworkflow` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_assessmentworkflowstep`
--

LOCK TABLES `workflow_assessmentworkflowstep` WRITE;
/*!40000 ALTER TABLE `workflow_assessmentworkflowstep` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_assessmentworkflowstep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_teamassessmentworkflow`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_teamassessmentworkflow` (
  `assessmentworkflow_ptr_id` int(11) NOT NULL,
  `team_submission_uuid` varchar(128) NOT NULL,
  PRIMARY KEY (`assessmentworkflow_ptr_id`),
  UNIQUE KEY `team_submission_uuid` (`team_submission_uuid`),
  CONSTRAINT `workflow_teamassessm_assessmentworkflow_p_53110fc3_fk_workflow_` FOREIGN KEY (`assessmentworkflow_ptr_id`) REFERENCES `workflow_assessmentworkflow` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_teamassessmentworkflow`
--

LOCK TABLES `workflow_teamassessmentworkflow` WRITE;
/*!40000 ALTER TABLE `workflow_teamassessmentworkflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_teamassessmentworkflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xapi_xapilearnerdatatransmissionaudit`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xapi_xapilearnerdatatransmissionaudit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `enterprise_course_enrollment_id` int(10) unsigned DEFAULT NULL,
  `course_id` varchar(255) NOT NULL,
  `course_completed` tinyint(1) NOT NULL,
  `completed_timestamp` datetime(6) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `status` varchar(100) NOT NULL,
  `error_message` longtext,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `xapi_xapilearnerdatatran_user_id_course_id_557488b4_uniq` (`user_id`,`course_id`),
  KEY `xapi_xapilearnerdatatransmi_enterprise_course_enrollmen_0a180d75` (`enterprise_course_enrollment_id`),
  KEY `xapi_xapilearnerdatatransmissionaudit_course_id_c18248d2` (`course_id`),
  CONSTRAINT `xapi_xapilearnerdata_user_id_6a49eb25_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xapi_xapilearnerdatatransmissionaudit`
--

LOCK TABLES `xapi_xapilearnerdatatransmissionaudit` WRITE;
/*!40000 ALTER TABLE `xapi_xapilearnerdatatransmissionaudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `xapi_xapilearnerdatatransmissionaudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xapi_xapilrsconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xapi_xapilrsconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `version` varchar(16) NOT NULL,
  `endpoint` varchar(200) NOT NULL,
  `key` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_customer_id` (`enterprise_customer_id`),
  CONSTRAINT `xapi_xapilrsconfigur_enterprise_customer__90c03ad5_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xapi_xapilrsconfiguration`
--

LOCK TABLES `xapi_xapilrsconfiguration` WRITE;
/*!40000 ALTER TABLE `xapi_xapilrsconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `xapi_xapilrsconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xblock_config_courseeditltifieldsenabledflag`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xblock_config_courseeditltifieldsenabledflag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xblock_config_course_changed_by_id_09761e15_fk_auth_user` (`changed_by_id`),
  KEY `xblock_config_courseeditltifieldsenabledflag_course_id_4f2393b4` (`course_id`),
  CONSTRAINT `xblock_config_course_changed_by_id_09761e15_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xblock_config_courseeditltifieldsenabledflag`
--

LOCK TABLES `xblock_config_courseeditltifieldsenabledflag` WRITE;
/*!40000 ALTER TABLE `xblock_config_courseeditltifieldsenabledflag` DISABLE KEYS */;
/*!40000 ALTER TABLE `xblock_config_courseeditltifieldsenabledflag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xblock_config_studioconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xblock_config_studioconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `disabled_blocks` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xblock_config_studio_changed_by_id_8e87ad07_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `xblock_config_studio_changed_by_id_8e87ad07_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xblock_config_studioconfig`
--

LOCK TABLES `xblock_config_studioconfig` WRITE;
/*!40000 ALTER TABLE `xblock_config_studioconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `xblock_config_studioconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xblock_django_xblockconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xblock_django_xblockconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `deprecated` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xblock_django_xblock_changed_by_id_221b9d0e_fk_auth_user` (`changed_by_id`),
  KEY `xblock_django_xblockconfiguration_name_9596c362` (`name`),
  CONSTRAINT `xblock_django_xblock_changed_by_id_221b9d0e_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xblock_django_xblockconfiguration`
--

LOCK TABLES `xblock_django_xblockconfiguration` WRITE;
/*!40000 ALTER TABLE `xblock_django_xblockconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `xblock_django_xblockconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xblock_django_xblockstudioconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xblock_django_xblockstudioconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `template` varchar(255) NOT NULL,
  `support_level` varchar(2) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xblock_django_xblock_changed_by_id_641b0905_fk_auth_user` (`changed_by_id`),
  KEY `xblock_django_xblockstudioconfiguration_name_1450bfa3` (`name`),
  CONSTRAINT `xblock_django_xblock_changed_by_id_641b0905_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xblock_django_xblockstudioconfiguration`
--

LOCK TABLES `xblock_django_xblockstudioconfiguration` WRITE;
/*!40000 ALTER TABLE `xblock_django_xblockstudioconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `xblock_django_xblockstudioconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xblock_django_xblockstudioconfigurationflag`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xblock_django_xblockstudioconfigurationflag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xblock_django_xblock_changed_by_id_fdf047b8_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `xblock_django_xblock_changed_by_id_fdf047b8_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xblock_django_xblockstudioconfigurationflag`
--

LOCK TABLES `xblock_django_xblockstudioconfigurationflag` WRITE;
/*!40000 ALTER TABLE `xblock_django_xblockstudioconfigurationflag` DISABLE KEYS */;
/*!40000 ALTER TABLE `xblock_django_xblockstudioconfigurationflag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-30 20:20:06
