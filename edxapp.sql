-- MySQL dump 10.13  Distrib 5.6.47, for Linux (x86_64)
--
-- Host: localhost    Database: edxapp
-- ------------------------------------------------------
-- Server version	5.6.47

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
  `name` varchar(80) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=1202 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add group',2,'add_group'),(2,'Can change group',2,'change_group'),(3,'Can delete group',2,'delete_group'),(4,'Can add user',3,'add_user'),(5,'Can change user',3,'change_user'),(6,'Can delete user',3,'delete_user'),(7,'Can add permission',4,'add_permission'),(8,'Can change permission',4,'change_permission'),(9,'Can delete permission',4,'delete_permission'),(10,'Can add content type',5,'add_contenttype'),(11,'Can change content type',5,'change_contenttype'),(12,'Can delete content type',5,'delete_contenttype'),(13,'Can add redirect',6,'add_redirect'),(14,'Can change redirect',6,'change_redirect'),(15,'Can delete redirect',6,'delete_redirect'),(16,'Can add session',7,'add_session'),(17,'Can change session',7,'change_session'),(18,'Can delete session',7,'delete_session'),(19,'Can add site',8,'add_site'),(20,'Can change site',8,'change_site'),(21,'Can delete site',8,'delete_site'),(22,'Can add saved group result',9,'add_tasksetmeta'),(23,'Can change saved group result',9,'change_tasksetmeta'),(24,'Can delete saved group result',9,'delete_tasksetmeta'),(25,'Can add crontab',10,'add_crontabschedule'),(26,'Can change crontab',10,'change_crontabschedule'),(27,'Can delete crontab',10,'delete_crontabschedule'),(28,'Can add periodic task',11,'add_periodictask'),(29,'Can change periodic task',11,'change_periodictask'),(30,'Can delete periodic task',11,'delete_periodictask'),(31,'Can add task',12,'add_taskstate'),(32,'Can change task',12,'change_taskstate'),(33,'Can delete task',12,'delete_taskstate'),(34,'Can add periodic tasks',13,'add_periodictasks'),(35,'Can change periodic tasks',13,'change_periodictasks'),(36,'Can delete periodic tasks',13,'delete_periodictasks'),(37,'Can add worker',14,'add_workerstate'),(38,'Can change worker',14,'change_workerstate'),(39,'Can delete worker',14,'delete_workerstate'),(40,'Can add interval',15,'add_intervalschedule'),(41,'Can change interval',15,'change_intervalschedule'),(42,'Can delete interval',15,'delete_intervalschedule'),(43,'Can add task state',16,'add_taskmeta'),(44,'Can change task state',16,'change_taskmeta'),(45,'Can delete task state',16,'delete_taskmeta'),(46,'Can add Switch',17,'add_switch'),(47,'Can change Switch',17,'change_switch'),(48,'Can delete Switch',17,'delete_switch'),(49,'Can add Flag',18,'add_flag'),(50,'Can change Flag',18,'change_flag'),(51,'Can delete Flag',18,'delete_flag'),(52,'Can add Sample',19,'add_sample'),(53,'Can change Sample',19,'change_sample'),(54,'Can delete Sample',19,'delete_sample'),(55,'Can add course message',20,'add_coursemessage'),(56,'Can change course message',20,'change_coursemessage'),(57,'Can delete course message',20,'delete_coursemessage'),(58,'Can add global status message',21,'add_globalstatusmessage'),(59,'Can change global status message',21,'change_globalstatusmessage'),(60,'Can delete global status message',21,'delete_globalstatusmessage'),(61,'Can add asset base url config',22,'add_assetbaseurlconfig'),(62,'Can change asset base url config',22,'change_assetbaseurlconfig'),(63,'Can delete asset base url config',22,'delete_assetbaseurlconfig'),(64,'Can add asset excluded extensions config',23,'add_assetexcludedextensionsconfig'),(65,'Can change asset excluded extensions config',23,'change_assetexcludedextensionsconfig'),(66,'Can delete asset excluded extensions config',23,'delete_assetexcludedextensionsconfig'),(67,'Can add course asset cache ttl config',24,'add_courseassetcachettlconfig'),(68,'Can change course asset cache ttl config',24,'change_courseassetcachettlconfig'),(69,'Can delete course asset cache ttl config',24,'delete_courseassetcachettlconfig'),(70,'Can add cdn user agents config',25,'add_cdnuseragentsconfig'),(71,'Can change cdn user agents config',25,'change_cdnuseragentsconfig'),(72,'Can delete cdn user agents config',25,'delete_cdnuseragentsconfig'),(73,'Can add site configuration',26,'add_siteconfiguration'),(74,'Can change site configuration',26,'change_siteconfiguration'),(75,'Can delete site configuration',26,'delete_siteconfiguration'),(76,'Can add site configuration history',27,'add_siteconfigurationhistory'),(77,'Can change site configuration history',27,'change_siteconfigurationhistory'),(78,'Can delete site configuration history',27,'delete_siteconfigurationhistory'),(79,'Can add video transcript enabled flag',28,'add_videotranscriptenabledflag'),(80,'Can change video transcript enabled flag',28,'change_videotranscriptenabledflag'),(81,'Can delete video transcript enabled flag',28,'delete_videotranscriptenabledflag'),(82,'Can add course hls playback enabled flag',29,'add_coursehlsplaybackenabledflag'),(83,'Can change course hls playback enabled flag',29,'change_coursehlsplaybackenabledflag'),(84,'Can delete course hls playback enabled flag',29,'delete_coursehlsplaybackenabledflag'),(85,'Can add video thumbnail setting',30,'add_videothumbnailsetting'),(86,'Can change video thumbnail setting',30,'change_videothumbnailsetting'),(87,'Can delete video thumbnail setting',30,'delete_videothumbnailsetting'),(88,'Can add hls playback enabled flag',31,'add_hlsplaybackenabledflag'),(89,'Can change hls playback enabled flag',31,'change_hlsplaybackenabledflag'),(90,'Can delete hls playback enabled flag',31,'delete_hlsplaybackenabledflag'),(91,'Can add course video transcript enabled flag',32,'add_coursevideotranscriptenabledflag'),(92,'Can change course video transcript enabled flag',32,'change_coursevideotranscriptenabledflag'),(93,'Can delete course video transcript enabled flag',32,'delete_coursevideotranscriptenabledflag'),(94,'Can add migration enqueued course',33,'add_migrationenqueuedcourse'),(95,'Can change migration enqueued course',33,'change_migrationenqueuedcourse'),(96,'Can delete migration enqueued course',33,'delete_migrationenqueuedcourse'),(97,'Can add updated course videos',34,'add_updatedcoursevideos'),(98,'Can change updated course videos',34,'change_updatedcoursevideos'),(99,'Can delete updated course videos',34,'delete_updatedcoursevideos'),(100,'Can add course youtube blocked flag',35,'add_courseyoutubeblockedflag'),(101,'Can change course youtube blocked flag',35,'change_courseyoutubeblockedflag'),(102,'Can delete course youtube blocked flag',35,'delete_courseyoutubeblockedflag'),(103,'Can add transcript migration setting',36,'add_transcriptmigrationsetting'),(104,'Can change transcript migration setting',36,'change_transcriptmigrationsetting'),(105,'Can delete transcript migration setting',36,'delete_transcriptmigrationsetting'),(106,'Can add video pipeline integration',37,'add_videopipelineintegration'),(107,'Can change video pipeline integration',37,'change_videopipelineintegration'),(108,'Can delete video pipeline integration',37,'delete_videopipelineintegration'),(109,'Can add course video uploads enabled by default',38,'add_coursevideouploadsenabledbydefault'),(110,'Can change course video uploads enabled by default',38,'change_coursevideouploadsenabledbydefault'),(111,'Can delete course video uploads enabled by default',38,'delete_coursevideouploadsenabledbydefault'),(112,'Can add video uploads enabled by default',39,'add_videouploadsenabledbydefault'),(113,'Can change video uploads enabled by default',39,'change_videouploadsenabledbydefault'),(114,'Can delete video uploads enabled by default',39,'delete_videouploadsenabledbydefault'),(115,'Can add course dynamic upgrade deadline configuration',40,'add_coursedynamicupgradedeadlineconfiguration'),(116,'Can change course dynamic upgrade deadline configuration',40,'change_coursedynamicupgradedeadlineconfiguration'),(117,'Can delete course dynamic upgrade deadline configuration',40,'delete_coursedynamicupgradedeadlineconfiguration'),(118,'Can add offline computed grade',41,'add_offlinecomputedgrade'),(119,'Can change offline computed grade',41,'change_offlinecomputedgrade'),(120,'Can delete offline computed grade',41,'delete_offlinecomputedgrade'),(121,'Can add x module user state summary field',42,'add_xmoduleuserstatesummaryfield'),(122,'Can change x module user state summary field',42,'change_xmoduleuserstatesummaryfield'),(123,'Can delete x module user state summary field',42,'delete_xmoduleuserstatesummaryfield'),(124,'Can add student field override',43,'add_studentfieldoverride'),(125,'Can change student field override',43,'change_studentfieldoverride'),(126,'Can delete student field override',43,'delete_studentfieldoverride'),(127,'Can add org dynamic upgrade deadline configuration',44,'add_orgdynamicupgradedeadlineconfiguration'),(128,'Can change org dynamic upgrade deadline configuration',44,'change_orgdynamicupgradedeadlineconfiguration'),(129,'Can delete org dynamic upgrade deadline configuration',44,'delete_orgdynamicupgradedeadlineconfiguration'),(130,'Can add student module history',45,'add_studentmodulehistory'),(131,'Can change student module history',45,'change_studentmodulehistory'),(132,'Can delete student module history',45,'delete_studentmodulehistory'),(133,'Can add x module student prefs field',46,'add_xmodulestudentprefsfield'),(134,'Can change x module student prefs field',46,'change_xmodulestudentprefsfield'),(135,'Can delete x module student prefs field',46,'delete_xmodulestudentprefsfield'),(136,'Can add student module',47,'add_studentmodule'),(137,'Can change student module',47,'change_studentmodule'),(138,'Can delete student module',47,'delete_studentmodule'),(139,'Can add dynamic upgrade deadline configuration',48,'add_dynamicupgradedeadlineconfiguration'),(140,'Can change dynamic upgrade deadline configuration',48,'change_dynamicupgradedeadlineconfiguration'),(141,'Can delete dynamic upgrade deadline configuration',48,'delete_dynamicupgradedeadlineconfiguration'),(142,'Can add offline computed grade log',49,'add_offlinecomputedgradelog'),(143,'Can change offline computed grade log',49,'change_offlinecomputedgradelog'),(144,'Can delete offline computed grade log',49,'delete_offlinecomputedgradelog'),(145,'Can add x module student info field',50,'add_xmodulestudentinfofield'),(146,'Can change x module student info field',50,'change_xmodulestudentinfofield'),(147,'Can delete x module student info field',50,'delete_xmodulestudentinfofield'),(148,'Can add student module history extended',51,'add_studentmodulehistoryextended'),(149,'Can change student module history extended',51,'change_studentmodulehistoryextended'),(150,'Can delete student module history extended',51,'delete_studentmodulehistoryextended'),(151,'Can add account recovery configuration',52,'add_accountrecoveryconfiguration'),(152,'Can change account recovery configuration',52,'change_accountrecoveryconfiguration'),(153,'Can delete account recovery configuration',52,'delete_accountrecoveryconfiguration'),(154,'Can add user signup source',53,'add_usersignupsource'),(155,'Can change user signup source',53,'change_usersignupsource'),(156,'Can delete user signup source',53,'delete_usersignupsource'),(157,'Can add pending name change',54,'add_pendingnamechange'),(158,'Can change pending name change',54,'change_pendingnamechange'),(159,'Can delete pending name change',54,'delete_pendingnamechange'),(160,'Can add anonymous user id',55,'add_anonymoususerid'),(161,'Can change anonymous user id',55,'change_anonymoususerid'),(162,'Can delete anonymous user id',55,'delete_anonymoususerid'),(163,'Can add pending secondary email change',56,'add_pendingsecondaryemailchange'),(164,'Can change pending secondary email change',56,'change_pendingsecondaryemailchange'),(165,'Can delete pending secondary email change',56,'delete_pendingsecondaryemailchange'),(166,'Can add logout view configuration',57,'add_logoutviewconfiguration'),(167,'Can change logout view configuration',57,'change_logoutviewconfiguration'),(168,'Can delete logout view configuration',57,'delete_logoutviewconfiguration'),(169,'Can add allowed auth user',58,'add_allowedauthuser'),(170,'Can change allowed auth user',58,'change_allowedauthuser'),(171,'Can delete allowed auth user',58,'delete_allowedauthuser'),(172,'Can add pending email change',59,'add_pendingemailchange'),(173,'Can change pending email change',59,'change_pendingemailchange'),(174,'Can delete pending email change',59,'delete_pendingemailchange'),(175,'Can add user attribute',60,'add_userattribute'),(176,'Can change user attribute',60,'change_userattribute'),(177,'Can delete user attribute',60,'delete_userattribute'),(178,'Can add bulk unenroll configuration',61,'add_bulkunenrollconfiguration'),(179,'Can change bulk unenroll configuration',61,'change_bulkunenrollconfiguration'),(180,'Can delete bulk unenroll configuration',61,'delete_bulkunenrollconfiguration'),(181,'Can add enrollment refund configuration',62,'add_enrollmentrefundconfiguration'),(182,'Can change enrollment refund configuration',62,'change_enrollmentrefundconfiguration'),(183,'Can delete enrollment refund configuration',62,'delete_enrollmentrefundconfiguration'),(184,'Can add entrance exam configuration',63,'add_entranceexamconfiguration'),(185,'Can change entrance exam configuration',63,'change_entranceexamconfiguration'),(186,'Can delete entrance exam configuration',63,'delete_entranceexamconfiguration'),(187,'Can add fbe enrollment exclusion',64,'add_fbeenrollmentexclusion'),(188,'Can change fbe enrollment exclusion',64,'change_fbeenrollmentexclusion'),(189,'Can delete fbe enrollment exclusion',64,'delete_fbeenrollmentexclusion'),(190,'Can add registration cookie configuration',65,'add_registrationcookieconfiguration'),(191,'Can change registration cookie configuration',65,'change_registrationcookieconfiguration'),(192,'Can delete registration cookie configuration',65,'delete_registrationcookieconfiguration'),(193,'Can add social link',66,'add_sociallink'),(194,'Can change social link',66,'change_sociallink'),(195,'Can delete social link',66,'delete_sociallink'),(196,'Can add user profile',67,'add_userprofile'),(197,'Can change user profile',67,'change_userprofile'),(198,'Can delete user profile',67,'delete_userprofile'),(199,'Can deactivate, but NOT delete users',67,'can_deactivate_users'),(200,'Can add registration',68,'add_registration'),(201,'Can change registration',68,'change_registration'),(202,'Can delete registration',68,'delete_registration'),(203,'Can add course enrollment allowed',69,'add_courseenrollmentallowed'),(204,'Can change course enrollment allowed',69,'change_courseenrollmentallowed'),(205,'Can delete course enrollment allowed',69,'delete_courseenrollmentallowed'),(206,'Can add dashboard configuration',70,'add_dashboardconfiguration'),(207,'Can change dashboard configuration',70,'change_dashboardconfiguration'),(208,'Can delete dashboard configuration',70,'delete_dashboardconfiguration'),(209,'Can add account recovery',71,'add_accountrecovery'),(210,'Can change account recovery',71,'change_accountrecovery'),(211,'Can delete account recovery',71,'delete_accountrecovery'),(212,'Can add historical manual enrollment audit',72,'add_historicalmanualenrollmentaudit'),(213,'Can change historical manual enrollment audit',72,'change_historicalmanualenrollmentaudit'),(214,'Can delete historical manual enrollment audit',72,'delete_historicalmanualenrollmentaudit'),(215,'Can add course enrollment',73,'add_courseenrollment'),(216,'Can change course enrollment',73,'change_courseenrollment'),(217,'Can delete course enrollment',73,'delete_courseenrollment'),(218,'Can add Login Failure',74,'add_loginfailures'),(219,'Can change Login Failure',74,'change_loginfailures'),(220,'Can delete Login Failure',74,'delete_loginfailures'),(221,'Can add user standing',75,'add_userstanding'),(222,'Can change user standing',75,'change_userstanding'),(223,'Can delete user standing',75,'delete_userstanding'),(224,'Can add course access role',76,'add_courseaccessrole'),(225,'Can change course access role',76,'change_courseaccessrole'),(226,'Can delete course access role',76,'delete_courseaccessrole'),(227,'Can add course enrollment attribute',77,'add_courseenrollmentattribute'),(228,'Can change course enrollment attribute',77,'change_courseenrollmentattribute'),(229,'Can delete course enrollment attribute',77,'delete_courseenrollmentattribute'),(230,'Can add language proficiency',78,'add_languageproficiency'),(231,'Can change language proficiency',78,'change_languageproficiency'),(232,'Can delete language proficiency',78,'delete_languageproficiency'),(233,'Can add historical course enrollment',79,'add_historicalcourseenrollment'),(234,'Can change historical course enrollment',79,'change_historicalcourseenrollment'),(235,'Can delete historical course enrollment',79,'delete_historicalcourseenrollment'),(236,'Can add manual enrollment audit',80,'add_manualenrollmentaudit'),(237,'Can change manual enrollment audit',80,'change_manualenrollmentaudit'),(238,'Can delete manual enrollment audit',80,'delete_manualenrollmentaudit'),(239,'Can add linked in add to profile configuration',81,'add_linkedinaddtoprofileconfiguration'),(240,'Can change linked in add to profile configuration',81,'change_linkedinaddtoprofileconfiguration'),(241,'Can delete linked in add to profile configuration',81,'delete_linkedinaddtoprofileconfiguration'),(242,'Can add user test group',82,'add_usertestgroup'),(243,'Can change user test group',82,'change_usertestgroup'),(244,'Can delete user test group',82,'delete_usertestgroup'),(245,'Can add rate limit configuration',83,'add_ratelimitconfiguration'),(246,'Can change rate limit configuration',83,'change_ratelimitconfiguration'),(247,'Can delete rate limit configuration',83,'delete_ratelimitconfiguration'),(248,'Can add certificate generation course setting',84,'add_certificategenerationcoursesetting'),(249,'Can change certificate generation course setting',84,'change_certificategenerationcoursesetting'),(250,'Can delete certificate generation course setting',84,'delete_certificategenerationcoursesetting'),(251,'Can add example certificate',85,'add_examplecertificate'),(252,'Can change example certificate',85,'change_examplecertificate'),(253,'Can delete example certificate',85,'delete_examplecertificate'),(254,'Can add historical generated certificate',86,'add_historicalgeneratedcertificate'),(255,'Can change historical generated certificate',86,'change_historicalgeneratedcertificate'),(256,'Can delete historical generated certificate',86,'delete_historicalgeneratedcertificate'),(257,'Can add certificate template asset',87,'add_certificatetemplateasset'),(258,'Can change certificate template asset',87,'change_certificatetemplateasset'),(259,'Can delete certificate template asset',87,'delete_certificatetemplateasset'),(260,'Can add certificate html view configuration',88,'add_certificatehtmlviewconfiguration'),(261,'Can change certificate html view configuration',88,'change_certificatehtmlviewconfiguration'),(262,'Can delete certificate html view configuration',88,'delete_certificatehtmlviewconfiguration'),(263,'Can add certificate whitelist',89,'add_certificatewhitelist'),(264,'Can change certificate whitelist',89,'change_certificatewhitelist'),(265,'Can delete certificate whitelist',89,'delete_certificatewhitelist'),(266,'Can add certificate generation configuration',90,'add_certificategenerationconfiguration'),(267,'Can change certificate generation configuration',90,'change_certificategenerationconfiguration'),(268,'Can delete certificate generation configuration',90,'delete_certificategenerationconfiguration'),(269,'Can add example certificate set',91,'add_examplecertificateset'),(270,'Can change example certificate set',91,'change_examplecertificateset'),(271,'Can delete example certificate set',91,'delete_examplecertificateset'),(272,'Can add certificate template',92,'add_certificatetemplate'),(273,'Can change certificate template',92,'change_certificatetemplate'),(274,'Can delete certificate template',92,'delete_certificatetemplate'),(275,'Can add generated certificate',93,'add_generatedcertificate'),(276,'Can change generated certificate',93,'change_generatedcertificate'),(277,'Can delete generated certificate',93,'delete_generatedcertificate'),(278,'Can add certificate invalidation',94,'add_certificateinvalidation'),(279,'Can change certificate invalidation',94,'change_certificateinvalidation'),(280,'Can delete certificate invalidation',94,'delete_certificateinvalidation'),(281,'Can add certificate generation history',95,'add_certificategenerationhistory'),(282,'Can change certificate generation history',95,'change_certificategenerationhistory'),(283,'Can delete certificate generation history',95,'delete_certificategenerationhistory'),(284,'Can add instructor task',96,'add_instructortask'),(285,'Can change instructor task',96,'change_instructortask'),(286,'Can delete instructor task',96,'delete_instructortask'),(287,'Can add grade report setting',97,'add_gradereportsetting'),(288,'Can change grade report setting',97,'change_gradereportsetting'),(289,'Can delete grade report setting',97,'delete_gradereportsetting'),(290,'Can add cohort membership',98,'add_cohortmembership'),(291,'Can change cohort membership',98,'change_cohortmembership'),(292,'Can delete cohort membership',98,'delete_cohortmembership'),(293,'Can add course cohort',99,'add_coursecohort'),(294,'Can change course cohort',99,'change_coursecohort'),(295,'Can delete course cohort',99,'delete_coursecohort'),(296,'Can add course user group',100,'add_courseusergroup'),(297,'Can change course user group',100,'change_courseusergroup'),(298,'Can delete course user group',100,'delete_courseusergroup'),(299,'Can add unregistered learner cohort assignments',101,'add_unregisteredlearnercohortassignments'),(300,'Can change unregistered learner cohort assignments',101,'change_unregisteredlearnercohortassignments'),(301,'Can delete unregistered learner cohort assignments',101,'delete_unregisteredlearnercohortassignments'),(302,'Can add course cohorts settings',102,'add_coursecohortssettings'),(303,'Can change course cohorts settings',102,'change_coursecohortssettings'),(304,'Can delete course cohorts settings',102,'delete_coursecohortssettings'),(305,'Can add course user group partition group',103,'add_courseusergrouppartitiongroup'),(306,'Can change course user group partition group',103,'change_courseusergrouppartitiongroup'),(307,'Can delete course user group partition group',103,'delete_courseusergrouppartitiongroup'),(308,'Can add optout',104,'add_optout'),(309,'Can change optout',104,'change_optout'),(310,'Can delete optout',104,'delete_optout'),(311,'Can add course email',105,'add_courseemail'),(312,'Can change course email',105,'change_courseemail'),(313,'Can delete course email',105,'delete_courseemail'),(314,'Can add course authorization',106,'add_courseauthorization'),(315,'Can change course authorization',106,'change_courseauthorization'),(316,'Can delete course authorization',106,'delete_courseauthorization'),(317,'Can add course email template',107,'add_courseemailtemplate'),(318,'Can change course email template',107,'change_courseemailtemplate'),(319,'Can delete course email template',107,'delete_courseemailtemplate'),(320,'Can add bulk email flag',108,'add_bulkemailflag'),(321,'Can change bulk email flag',108,'change_bulkemailflag'),(322,'Can delete bulk email flag',108,'delete_bulkemailflag'),(323,'Can add target',109,'add_target'),(324,'Can change target',109,'change_target'),(325,'Can delete target',109,'delete_target'),(326,'Can add course mode target',110,'add_coursemodetarget'),(327,'Can change course mode target',110,'change_coursemodetarget'),(328,'Can delete course mode target',110,'delete_coursemodetarget'),(329,'Can add cohort target',111,'add_cohorttarget'),(330,'Can change cohort target',111,'change_cohorttarget'),(331,'Can delete cohort target',111,'delete_cohorttarget'),(332,'Can add branding api config',112,'add_brandingapiconfig'),(333,'Can change branding api config',112,'change_brandingapiconfig'),(334,'Can delete branding api config',112,'delete_brandingapiconfig'),(335,'Can add branding info config',113,'add_brandinginfoconfig'),(336,'Can change branding info config',113,'change_brandinginfoconfig'),(337,'Can delete branding info config',113,'delete_brandinginfoconfig'),(338,'Can add grant',114,'add_grant'),(339,'Can change grant',114,'change_grant'),(340,'Can delete grant',114,'delete_grant'),(341,'Can add access token',115,'add_accesstoken'),(342,'Can change access token',115,'change_accesstoken'),(343,'Can delete access token',115,'delete_accesstoken'),(344,'Can add application',116,'add_application'),(345,'Can change application',116,'change_application'),(346,'Can delete application',116,'delete_application'),(347,'Can add refresh token',117,'add_refreshtoken'),(348,'Can change refresh token',117,'change_refreshtoken'),(349,'Can delete refresh token',117,'delete_refreshtoken'),(350,'Can add application access',118,'add_applicationaccess'),(351,'Can change application access',118,'change_applicationaccess'),(352,'Can delete application access',118,'delete_applicationaccess'),(353,'Can add restricted application',119,'add_restrictedapplication'),(354,'Can change restricted application',119,'change_restrictedapplication'),(355,'Can delete restricted application',119,'delete_restrictedapplication'),(356,'Can add application organization',120,'add_applicationorganization'),(357,'Can change application organization',120,'change_applicationorganization'),(358,'Can delete application organization',120,'delete_applicationorganization'),(359,'Can add Provider Configuration (LTI)',121,'add_ltiproviderconfig'),(360,'Can change Provider Configuration (LTI)',121,'change_ltiproviderconfig'),(361,'Can delete Provider Configuration (LTI)',121,'delete_ltiproviderconfig'),(362,'Can add Provider Configuration (SAML IdP)',122,'add_samlproviderconfig'),(363,'Can change Provider Configuration (SAML IdP)',122,'change_samlproviderconfig'),(364,'Can delete Provider Configuration (SAML IdP)',122,'delete_samlproviderconfig'),(365,'Can add SAML Provider Data',123,'add_samlproviderdata'),(366,'Can change SAML Provider Data',123,'change_samlproviderdata'),(367,'Can delete SAML Provider Data',123,'delete_samlproviderdata'),(368,'Can add SAML Configuration',124,'add_samlconfiguration'),(369,'Can change SAML Configuration',124,'change_samlconfiguration'),(370,'Can delete SAML Configuration',124,'delete_samlconfiguration'),(371,'Can add Provider Configuration (OAuth)',125,'add_oauth2providerconfig'),(372,'Can change Provider Configuration (OAuth)',125,'change_oauth2providerconfig'),(373,'Can delete Provider Configuration (OAuth)',125,'delete_oauth2providerconfig'),(374,'Can add system wide role assignment',126,'add_systemwideroleassignment'),(375,'Can change system wide role assignment',126,'change_systemwideroleassignment'),(376,'Can delete system wide role assignment',126,'delete_systemwideroleassignment'),(377,'Can add system wide role',127,'add_systemwiderole'),(378,'Can change system wide role',127,'change_systemwiderole'),(379,'Can delete system wide role',127,'delete_systemwiderole'),(380,'Can add article plugin',128,'add_articleplugin'),(381,'Can change article plugin',128,'change_articleplugin'),(382,'Can delete article plugin',128,'delete_articleplugin'),(383,'Can add Article for object',129,'add_articleforobject'),(384,'Can change Article for object',129,'change_articleforobject'),(385,'Can delete Article for object',129,'delete_articleforobject'),(386,'Can add simple plugin',130,'add_simpleplugin'),(387,'Can change simple plugin',130,'change_simpleplugin'),(388,'Can delete simple plugin',130,'delete_simpleplugin'),(389,'Can add article revision',131,'add_articlerevision'),(390,'Can change article revision',131,'change_articlerevision'),(391,'Can delete article revision',131,'delete_articlerevision'),(392,'Can add reusable plugin',132,'add_reusableplugin'),(393,'Can change reusable plugin',132,'change_reusableplugin'),(394,'Can delete reusable plugin',132,'delete_reusableplugin'),(395,'Can add revision plugin revision',133,'add_revisionpluginrevision'),(396,'Can change revision plugin revision',133,'change_revisionpluginrevision'),(397,'Can delete revision plugin revision',133,'delete_revisionpluginrevision'),(398,'Can add URL path',134,'add_urlpath'),(399,'Can change URL path',134,'change_urlpath'),(400,'Can delete URL path',134,'delete_urlpath'),(401,'Can add article',135,'add_article'),(402,'Can change article',135,'change_article'),(403,'Can delete article',135,'delete_article'),(404,'Can edit all articles and lock/unlock/restore',135,'moderate'),(405,'Can change ownership of any article',135,'assign'),(406,'Can assign permissions to other users',135,'grant'),(407,'Can add revision plugin',136,'add_revisionplugin'),(408,'Can change revision plugin',136,'change_revisionplugin'),(409,'Can delete revision plugin',136,'delete_revisionplugin'),(410,'Can add notification',137,'add_notification'),(411,'Can change notification',137,'change_notification'),(412,'Can delete notification',137,'delete_notification'),(413,'Can add settings',138,'add_settings'),(414,'Can change settings',138,'change_settings'),(415,'Can delete settings',138,'delete_settings'),(416,'Can add subscription',139,'add_subscription'),(417,'Can change subscription',139,'change_subscription'),(418,'Can delete subscription',139,'delete_subscription'),(419,'Can add type',140,'add_notificationtype'),(420,'Can change type',140,'change_notificationtype'),(421,'Can delete type',140,'delete_notificationtype'),(422,'Can add log entry',141,'add_logentry'),(423,'Can change log entry',141,'change_logentry'),(424,'Can delete log entry',141,'delete_logentry'),(425,'Can add permission',142,'add_permission'),(426,'Can change permission',142,'change_permission'),(427,'Can delete permission',142,'delete_permission'),(428,'Can add forums config',143,'add_forumsconfig'),(429,'Can change forums config',143,'change_forumsconfig'),(430,'Can delete forums config',143,'delete_forumsconfig'),(431,'Can add role',144,'add_role'),(432,'Can change role',144,'change_role'),(433,'Can delete role',144,'delete_role'),(434,'Can add course discussion settings',145,'add_coursediscussionsettings'),(435,'Can change course discussion settings',145,'change_coursediscussionsettings'),(436,'Can delete course discussion settings',145,'delete_coursediscussionsettings'),(437,'Can add discussions id mapping',146,'add_discussionsidmapping'),(438,'Can change discussions id mapping',146,'change_discussionsidmapping'),(439,'Can delete discussions id mapping',146,'delete_discussionsidmapping'),(440,'Can add splash config',147,'add_splashconfig'),(441,'Can change splash config',147,'change_splashconfig'),(442,'Can delete splash config',147,'delete_splashconfig'),(443,'Can add user course tag',148,'add_usercoursetag'),(444,'Can change user course tag',148,'change_usercoursetag'),(445,'Can delete user course tag',148,'delete_usercoursetag'),(446,'Can add User Retirement Reporting Status',149,'add_userretirementpartnerreportingstatus'),(447,'Can change User Retirement Reporting Status',149,'change_userretirementpartnerreportingstatus'),(448,'Can delete User Retirement Reporting Status',149,'delete_userretirementpartnerreportingstatus'),(449,'Can add user preference',150,'add_userpreference'),(450,'Can change user preference',150,'change_userpreference'),(451,'Can delete user preference',150,'delete_userpreference'),(452,'Can add User Retirement Status',151,'add_userretirementstatus'),(453,'Can change User Retirement Status',151,'change_userretirementstatus'),(454,'Can delete User Retirement Status',151,'delete_userretirementstatus'),(455,'Can add retirement state',152,'add_retirementstate'),(456,'Can change retirement state',152,'change_retirementstate'),(457,'Can delete retirement state',152,'delete_retirementstate'),(458,'Can add User Retirement Request',153,'add_userretirementrequest'),(459,'Can change User Retirement Request',153,'change_userretirementrequest'),(460,'Can delete User Retirement Request',153,'delete_userretirementrequest'),(461,'Can add user org tag',154,'add_userorgtag'),(462,'Can change user org tag',154,'change_userorgtag'),(463,'Can delete user org tag',154,'delete_userorgtag'),(464,'Can add donation configuration',155,'add_donationconfiguration'),(465,'Can change donation configuration',155,'change_donationconfiguration'),(466,'Can delete donation configuration',155,'delete_donationconfiguration'),(467,'Can add order',156,'add_order'),(468,'Can change order',156,'change_order'),(469,'Can delete order',156,'delete_order'),(470,'Can add invoice',157,'add_invoice'),(471,'Can change invoice',157,'change_invoice'),(472,'Can delete invoice',157,'delete_invoice'),(473,'Can add coupon',158,'add_coupon'),(474,'Can change coupon',158,'change_coupon'),(475,'Can delete coupon',158,'delete_coupon'),(476,'Can add course reg code item annotation',159,'add_courseregcodeitemannotation'),(477,'Can change course reg code item annotation',159,'change_courseregcodeitemannotation'),(478,'Can delete course reg code item annotation',159,'delete_courseregcodeitemannotation'),(479,'Can add invoice transaction',160,'add_invoicetransaction'),(480,'Can change invoice transaction',160,'change_invoicetransaction'),(481,'Can delete invoice transaction',160,'delete_invoicetransaction'),(482,'Can add coupon redemption',161,'add_couponredemption'),(483,'Can change coupon redemption',161,'change_couponredemption'),(484,'Can delete coupon redemption',161,'delete_couponredemption'),(485,'Can add paid course registration annotation',162,'add_paidcourseregistrationannotation'),(486,'Can change paid course registration annotation',162,'change_paidcourseregistrationannotation'),(487,'Can delete paid course registration annotation',162,'delete_paidcourseregistrationannotation'),(488,'Can add course registration code',163,'add_courseregistrationcode'),(489,'Can change course registration code',163,'change_courseregistrationcode'),(490,'Can delete course registration code',163,'delete_courseregistrationcode'),(491,'Can add registration code redemption',164,'add_registrationcoderedemption'),(492,'Can change registration code redemption',164,'change_registrationcoderedemption'),(493,'Can delete registration code redemption',164,'delete_registrationcoderedemption'),(494,'Can add order item',165,'add_orderitem'),(495,'Can change order item',165,'change_orderitem'),(496,'Can delete order item',165,'delete_orderitem'),(497,'Can add invoice item',166,'add_invoiceitem'),(498,'Can change invoice item',166,'change_invoiceitem'),(499,'Can delete invoice item',166,'delete_invoiceitem'),(500,'Can add invoice history',167,'add_invoicehistory'),(501,'Can change invoice history',167,'change_invoicehistory'),(502,'Can delete invoice history',167,'delete_invoicehistory'),(503,'Can add course registration code invoice item',168,'add_courseregistrationcodeinvoiceitem'),(504,'Can change course registration code invoice item',168,'change_courseregistrationcodeinvoiceitem'),(505,'Can delete course registration code invoice item',168,'delete_courseregistrationcodeinvoiceitem'),(506,'Can add course reg code item',169,'add_courseregcodeitem'),(507,'Can change course reg code item',169,'change_courseregcodeitem'),(508,'Can delete course reg code item',169,'delete_courseregcodeitem'),(509,'Can add certificate item',170,'add_certificateitem'),(510,'Can change certificate item',170,'change_certificateitem'),(511,'Can delete certificate item',170,'delete_certificateitem'),(512,'Can add paid course registration',171,'add_paidcourseregistration'),(513,'Can change paid course registration',171,'change_paidcourseregistration'),(514,'Can delete paid course registration',171,'delete_paidcourseregistration'),(515,'Can add donation',172,'add_donation'),(516,'Can change donation',172,'change_donation'),(517,'Can delete donation',172,'delete_donation'),(518,'Can add course modes archive',173,'add_coursemodesarchive'),(519,'Can change course modes archive',173,'change_coursemodesarchive'),(520,'Can delete course modes archive',173,'delete_coursemodesarchive'),(521,'Can add course mode',174,'add_coursemode'),(522,'Can change course mode',174,'change_coursemode'),(523,'Can delete course mode',174,'delete_coursemode'),(524,'Can add historical course mode',175,'add_historicalcoursemode'),(525,'Can change historical course mode',175,'change_historicalcoursemode'),(526,'Can delete historical course mode',175,'delete_historicalcoursemode'),(527,'Can add course mode expiration config',176,'add_coursemodeexpirationconfig'),(528,'Can change course mode expiration config',176,'change_coursemodeexpirationconfig'),(529,'Can delete course mode expiration config',176,'delete_coursemodeexpirationconfig'),(530,'Can add course entitlement',177,'add_courseentitlement'),(531,'Can change course entitlement',177,'change_courseentitlement'),(532,'Can delete course entitlement',177,'delete_courseentitlement'),(533,'Can add course entitlement policy',178,'add_courseentitlementpolicy'),(534,'Can change course entitlement policy',178,'change_courseentitlementpolicy'),(535,'Can delete course entitlement policy',178,'delete_courseentitlementpolicy'),(536,'Can add historical course entitlement support detail',179,'add_historicalcourseentitlementsupportdetail'),(537,'Can change historical course entitlement support detail',179,'change_historicalcourseentitlementsupportdetail'),(538,'Can delete historical course entitlement support detail',179,'delete_historicalcourseentitlementsupportdetail'),(539,'Can add course entitlement support detail',180,'add_courseentitlementsupportdetail'),(540,'Can change course entitlement support detail',180,'change_courseentitlementsupportdetail'),(541,'Can delete course entitlement support detail',180,'delete_courseentitlementsupportdetail'),(542,'Can add historical course entitlement',181,'add_historicalcourseentitlement'),(543,'Can change historical course entitlement',181,'change_historicalcourseentitlement'),(544,'Can delete historical course entitlement',181,'delete_historicalcourseentitlement'),(545,'Can add manual verification',182,'add_manualverification'),(546,'Can change manual verification',182,'change_manualverification'),(547,'Can delete manual verification',182,'delete_manualverification'),(548,'Can add sspv retry student argument',183,'add_sspverificationretryconfig'),(549,'Can change sspv retry student argument',183,'change_sspverificationretryconfig'),(550,'Can delete sspv retry student argument',183,'delete_sspverificationretryconfig'),(551,'Can add software secure photo verification',184,'add_softwaresecurephotoverification'),(552,'Can change software secure photo verification',184,'change_softwaresecurephotoverification'),(553,'Can delete software secure photo verification',184,'delete_softwaresecurephotoverification'),(554,'Can add verification deadline',185,'add_verificationdeadline'),(555,'Can change verification deadline',185,'change_verificationdeadline'),(556,'Can delete verification deadline',185,'delete_verificationdeadline'),(557,'Can add sso verification',186,'add_ssoverification'),(558,'Can change sso verification',186,'change_ssoverification'),(559,'Can delete sso verification',186,'delete_ssoverification'),(560,'Can add dark lang config',187,'add_darklangconfig'),(561,'Can change dark lang config',187,'change_darklangconfig'),(562,'Can delete dark lang config',187,'delete_darklangconfig'),(563,'Can add whitelisted rss url',188,'add_whitelistedrssurl'),(564,'Can change whitelisted rss url',188,'change_whitelistedrssurl'),(565,'Can delete whitelisted rss url',188,'delete_whitelistedrssurl'),(566,'Can add embargoed course',189,'add_embargoedcourse'),(567,'Can change embargoed course',189,'change_embargoedcourse'),(568,'Can delete embargoed course',189,'delete_embargoedcourse'),(569,'Can add country',190,'add_country'),(570,'Can change country',190,'change_country'),(571,'Can delete country',190,'delete_country'),(572,'Can add country access rule',191,'add_countryaccessrule'),(573,'Can change country access rule',191,'change_countryaccessrule'),(574,'Can delete country access rule',191,'delete_countryaccessrule'),(575,'Can add course access rule history',192,'add_courseaccessrulehistory'),(576,'Can change course access rule history',192,'change_courseaccessrulehistory'),(577,'Can delete course access rule history',192,'delete_courseaccessrulehistory'),(578,'Can add ip filter',193,'add_ipfilter'),(579,'Can change ip filter',193,'change_ipfilter'),(580,'Can delete ip filter',193,'delete_ipfilter'),(581,'Can add restricted course',194,'add_restrictedcourse'),(582,'Can change restricted course',194,'change_restrictedcourse'),(583,'Can delete restricted course',194,'delete_restrictedcourse'),(584,'Can add embargoed state',195,'add_embargoedstate'),(585,'Can change embargoed state',195,'change_embargoedstate'),(586,'Can delete embargoed state',195,'delete_embargoedstate'),(587,'Can add course rerun state',196,'add_coursererunstate'),(588,'Can change course rerun state',196,'change_coursererunstate'),(589,'Can delete course rerun state',196,'delete_coursererunstate'),(590,'Can add ignore mobile available flag config',197,'add_ignoremobileavailableflagconfig'),(591,'Can change ignore mobile available flag config',197,'change_ignoremobileavailableflagconfig'),(592,'Can delete ignore mobile available flag config',197,'delete_ignoremobileavailableflagconfig'),(593,'Can add app version config',198,'add_appversionconfig'),(594,'Can change app version config',198,'change_appversionconfig'),(595,'Can delete app version config',198,'delete_appversionconfig'),(596,'Can add mobile api config',199,'add_mobileapiconfig'),(597,'Can change mobile api config',199,'change_mobileapiconfig'),(598,'Can delete mobile api config',199,'delete_mobileapiconfig'),(599,'Can add association',200,'add_association'),(600,'Can change association',200,'change_association'),(601,'Can delete association',200,'delete_association'),(602,'Can add user social auth',201,'add_usersocialauth'),(603,'Can change user social auth',201,'change_usersocialauth'),(604,'Can delete user social auth',201,'delete_usersocialauth'),(605,'Can add code',202,'add_code'),(606,'Can change code',202,'change_code'),(607,'Can delete code',202,'delete_code'),(608,'Can add partial',203,'add_partial'),(609,'Can change partial',203,'change_partial'),(610,'Can delete partial',203,'delete_partial'),(611,'Can add nonce',204,'add_nonce'),(612,'Can change nonce',204,'change_nonce'),(613,'Can delete nonce',204,'delete_nonce'),(614,'Can add survey form',205,'add_surveyform'),(615,'Can change survey form',205,'change_surveyform'),(616,'Can delete survey form',205,'delete_surveyform'),(617,'Can add survey answer',206,'add_surveyanswer'),(618,'Can change survey answer',206,'change_surveyanswer'),(619,'Can delete survey answer',206,'delete_surveyanswer'),(620,'Can add x block asides config',207,'add_xblockasidesconfig'),(621,'Can change x block asides config',207,'change_xblockasidesconfig'),(622,'Can delete x block asides config',207,'delete_xblockasidesconfig'),(623,'Can add share',208,'add_share'),(624,'Can change share',208,'change_share'),(625,'Can delete share',208,'delete_share'),(626,'Can add answer',209,'add_answer'),(627,'Can change answer',209,'change_answer'),(628,'Can delete answer',209,'delete_answer'),(629,'Can add submission',210,'add_submission'),(630,'Can change submission',210,'change_submission'),(631,'Can delete submission',210,'delete_submission'),(632,'Can add team submission',211,'add_teamsubmission'),(633,'Can change team submission',211,'change_teamsubmission'),(634,'Can delete team submission',211,'delete_teamsubmission'),(635,'Can add student item',212,'add_studentitem'),(636,'Can change student item',212,'change_studentitem'),(637,'Can delete student item',212,'delete_studentitem'),(638,'Can add score',213,'add_score'),(639,'Can change score',213,'change_score'),(640,'Can delete score',213,'delete_score'),(641,'Can add score summary',214,'add_scoresummary'),(642,'Can change score summary',214,'change_scoresummary'),(643,'Can delete score summary',214,'delete_scoresummary'),(644,'Can add score annotation',215,'add_scoreannotation'),(645,'Can change score annotation',215,'change_scoreannotation'),(646,'Can delete score annotation',215,'delete_scoreannotation'),(647,'Can add criterion option',216,'add_criterionoption'),(648,'Can change criterion option',216,'change_criterionoption'),(649,'Can delete criterion option',216,'delete_criterionoption'),(650,'Can add peer workflow',217,'add_peerworkflow'),(651,'Can change peer workflow',217,'change_peerworkflow'),(652,'Can delete peer workflow',217,'delete_peerworkflow'),(653,'Can add staff workflow',218,'add_staffworkflow'),(654,'Can change staff workflow',218,'change_staffworkflow'),(655,'Can delete staff workflow',218,'delete_staffworkflow'),(656,'Can add student training workflow item',219,'add_studenttrainingworkflowitem'),(657,'Can change student training workflow item',219,'change_studenttrainingworkflowitem'),(658,'Can delete student training workflow item',219,'delete_studenttrainingworkflowitem'),(659,'Can add assessment feedback',220,'add_assessmentfeedback'),(660,'Can change assessment feedback',220,'change_assessmentfeedback'),(661,'Can delete assessment feedback',220,'delete_assessmentfeedback'),(662,'Can add rubric',221,'add_rubric'),(663,'Can change rubric',221,'change_rubric'),(664,'Can delete rubric',221,'delete_rubric'),(665,'Can add historical shared file upload',222,'add_historicalsharedfileupload'),(666,'Can change historical shared file upload',222,'change_historicalsharedfileupload'),(667,'Can delete historical shared file upload',222,'delete_historicalsharedfileupload'),(668,'Can add team staff workflow',223,'add_teamstaffworkflow'),(669,'Can change team staff workflow',223,'change_teamstaffworkflow'),(670,'Can delete team staff workflow',223,'delete_teamstaffworkflow'),(671,'Can add assessment',224,'add_assessment'),(672,'Can change assessment',224,'change_assessment'),(673,'Can delete assessment',224,'delete_assessment'),(674,'Can add assessment part',225,'add_assessmentpart'),(675,'Can change assessment part',225,'change_assessmentpart'),(676,'Can delete assessment part',225,'delete_assessmentpart'),(677,'Can add shared file upload',226,'add_sharedfileupload'),(678,'Can change shared file upload',226,'change_sharedfileupload'),(679,'Can delete shared file upload',226,'delete_sharedfileupload'),(680,'Can add criterion',227,'add_criterion'),(681,'Can change criterion',227,'change_criterion'),(682,'Can delete criterion',227,'delete_criterion'),(683,'Can add peer workflow item',228,'add_peerworkflowitem'),(684,'Can change peer workflow item',228,'change_peerworkflowitem'),(685,'Can delete peer workflow item',228,'delete_peerworkflowitem'),(686,'Can add training example',229,'add_trainingexample'),(687,'Can change training example',229,'change_trainingexample'),(688,'Can delete training example',229,'delete_trainingexample'),(689,'Can add student training workflow',230,'add_studenttrainingworkflow'),(690,'Can change student training workflow',230,'change_studenttrainingworkflow'),(691,'Can delete student training workflow',230,'delete_studenttrainingworkflow'),(692,'Can add assessment feedback option',231,'add_assessmentfeedbackoption'),(693,'Can change assessment feedback option',231,'change_assessmentfeedbackoption'),(694,'Can delete assessment feedback option',231,'delete_assessmentfeedbackoption'),(695,'Can add assessment workflow',232,'add_assessmentworkflow'),(696,'Can change assessment workflow',232,'change_assessmentworkflow'),(697,'Can delete assessment workflow',232,'delete_assessmentworkflow'),(698,'Can add team assessment workflow',233,'add_teamassessmentworkflow'),(699,'Can change team assessment workflow',233,'change_teamassessmentworkflow'),(700,'Can delete team assessment workflow',233,'delete_teamassessmentworkflow'),(701,'Can add assessment workflow step',234,'add_assessmentworkflowstep'),(702,'Can change assessment workflow step',234,'change_assessmentworkflowstep'),(703,'Can delete assessment workflow step',234,'delete_assessmentworkflowstep'),(704,'Can add assessment workflow cancellation',235,'add_assessmentworkflowcancellation'),(705,'Can change assessment workflow cancellation',235,'change_assessmentworkflowcancellation'),(706,'Can delete assessment workflow cancellation',235,'delete_assessmentworkflowcancellation'),(707,'Can add encoded video',236,'add_encodedvideo'),(708,'Can change encoded video',236,'change_encodedvideo'),(709,'Can delete encoded video',236,'delete_encodedvideo'),(710,'Can add course video',237,'add_coursevideo'),(711,'Can change course video',237,'change_coursevideo'),(712,'Can delete course video',237,'delete_coursevideo'),(713,'Can add profile',238,'add_profile'),(714,'Can change profile',238,'change_profile'),(715,'Can delete profile',238,'delete_profile'),(716,'Can add video transcript',239,'add_videotranscript'),(717,'Can change video transcript',239,'change_videotranscript'),(718,'Can delete video transcript',239,'delete_videotranscript'),(719,'Can add video',240,'add_video'),(720,'Can change video',240,'change_video'),(721,'Can delete video',240,'delete_video'),(722,'Can add transcript preference',241,'add_transcriptpreference'),(723,'Can change transcript preference',241,'change_transcriptpreference'),(724,'Can delete transcript preference',241,'delete_transcriptpreference'),(725,'Can add video image',242,'add_videoimage'),(726,'Can change video image',242,'change_videoimage'),(727,'Can delete video image',242,'delete_videoimage'),(728,'Can add third party transcript credentials state',243,'add_thirdpartytranscriptcredentialsstate'),(729,'Can change third party transcript credentials state',243,'change_thirdpartytranscriptcredentialsstate'),(730,'Can delete third party transcript credentials state',243,'delete_thirdpartytranscriptcredentialsstate'),(731,'Can add transcript credentials',244,'add_transcriptcredentials'),(732,'Can change transcript credentials',244,'change_transcriptcredentials'),(733,'Can delete transcript credentials',244,'delete_transcriptcredentials'),(734,'Can add historical course overview',245,'add_historicalcourseoverview'),(735,'Can change historical course overview',245,'change_historicalcourseoverview'),(736,'Can delete historical course overview',245,'delete_historicalcourseoverview'),(737,'Can add course overview image set',246,'add_courseoverviewimageset'),(738,'Can change course overview image set',246,'change_courseoverviewimageset'),(739,'Can delete course overview image set',246,'delete_courseoverviewimageset'),(740,'Can add course overview image config',247,'add_courseoverviewimageconfig'),(741,'Can change course overview image config',247,'change_courseoverviewimageconfig'),(742,'Can delete course overview image config',247,'delete_courseoverviewimageconfig'),(743,'Can add course overview tab',248,'add_courseoverviewtab'),(744,'Can change course overview tab',248,'change_courseoverviewtab'),(745,'Can delete course overview tab',248,'delete_courseoverviewtab'),(746,'Can add course overview',249,'add_courseoverview'),(747,'Can change course overview',249,'change_courseoverview'),(748,'Can delete course overview',249,'delete_courseoverview'),(749,'Can add simulate_publish argument',250,'add_simulatecoursepublishconfig'),(750,'Can change simulate_publish argument',250,'change_simulatecoursepublishconfig'),(751,'Can delete simulate_publish argument',250,'delete_simulatecoursepublishconfig'),(752,'Can add block structure model',251,'add_blockstructuremodel'),(753,'Can change block structure model',251,'change_blockstructuremodel'),(754,'Can delete block structure model',251,'delete_blockstructuremodel'),(755,'Can add block structure configuration',252,'add_blockstructureconfiguration'),(756,'Can change block structure configuration',252,'change_blockstructureconfiguration'),(757,'Can delete block structure configuration',252,'delete_blockstructureconfiguration'),(758,'Can add x domain proxy configuration',253,'add_xdomainproxyconfiguration'),(759,'Can change x domain proxy configuration',253,'change_xdomainproxyconfiguration'),(760,'Can delete x domain proxy configuration',253,'delete_xdomainproxyconfiguration'),(761,'Can add commerce configuration',254,'add_commerceconfiguration'),(762,'Can change commerce configuration',254,'change_commerceconfiguration'),(763,'Can delete commerce configuration',254,'delete_commerceconfiguration'),(764,'Can add credit provider',255,'add_creditprovider'),(765,'Can change credit provider',255,'change_creditprovider'),(766,'Can delete credit provider',255,'delete_creditprovider'),(767,'Can add credit config',256,'add_creditconfig'),(768,'Can change credit config',256,'change_creditconfig'),(769,'Can delete credit config',256,'delete_creditconfig'),(770,'Can add credit requirement status',257,'add_creditrequirementstatus'),(771,'Can change credit requirement status',257,'change_creditrequirementstatus'),(772,'Can delete credit requirement status',257,'delete_creditrequirementstatus'),(773,'Can add credit course',258,'add_creditcourse'),(774,'Can change credit course',258,'change_creditcourse'),(775,'Can delete credit course',258,'delete_creditcourse'),(776,'Can add credit eligibility',259,'add_crediteligibility'),(777,'Can change credit eligibility',259,'change_crediteligibility'),(778,'Can delete credit eligibility',259,'delete_crediteligibility'),(779,'Can add credit request',260,'add_creditrequest'),(780,'Can change credit request',260,'change_creditrequest'),(781,'Can delete credit request',260,'delete_creditrequest'),(782,'Can add credit requirement',261,'add_creditrequirement'),(783,'Can change credit requirement',261,'change_creditrequirement'),(784,'Can delete credit requirement',261,'delete_creditrequirement'),(785,'Can add course team membership',262,'add_courseteammembership'),(786,'Can change course team membership',262,'change_courseteammembership'),(787,'Can delete course team membership',262,'delete_courseteammembership'),(788,'Can add course team',263,'add_courseteam'),(789,'Can change course team',263,'change_courseteam'),(790,'Can delete course team',263,'delete_courseteam'),(791,'Can add x block configuration',264,'add_xblockconfiguration'),(792,'Can change x block configuration',264,'change_xblockconfiguration'),(793,'Can delete x block configuration',264,'delete_xblockconfiguration'),(794,'Can add x block studio configuration flag',265,'add_xblockstudioconfigurationflag'),(795,'Can change x block studio configuration flag',265,'change_xblockstudioconfigurationflag'),(796,'Can delete x block studio configuration flag',265,'delete_xblockstudioconfigurationflag'),(797,'Can add x block studio configuration',266,'add_xblockstudioconfiguration'),(798,'Can change x block studio configuration',266,'change_xblockstudioconfiguration'),(799,'Can delete x block studio configuration',266,'delete_xblockstudioconfiguration'),(800,'Can add programs api config',267,'add_programsapiconfig'),(801,'Can change programs api config',267,'change_programsapiconfig'),(802,'Can delete programs api config',267,'delete_programsapiconfig'),(803,'Can add backpopulate_program_credentials argument',268,'add_customprogramsconfig'),(804,'Can change backpopulate_program_credentials argument',268,'change_customprogramsconfig'),(805,'Can delete backpopulate_program_credentials argument',268,'delete_customprogramsconfig'),(806,'Can add catalog integration',269,'add_catalogintegration'),(807,'Can change catalog integration',269,'change_catalogintegration'),(808,'Can delete catalog integration',269,'delete_catalogintegration'),(809,'Can add self paced configuration',270,'add_selfpacedconfiguration'),(810,'Can change self paced configuration',270,'change_selfpacedconfiguration'),(811,'Can delete self paced configuration',270,'delete_selfpacedconfiguration'),(812,'Can add kv store',271,'add_kvstore'),(813,'Can change kv store',271,'change_kvstore'),(814,'Can delete kv store',271,'delete_kvstore'),(815,'Can add user milestone',272,'add_usermilestone'),(816,'Can change user milestone',272,'change_usermilestone'),(817,'Can delete user milestone',272,'delete_usermilestone'),(818,'Can add milestone',273,'add_milestone'),(819,'Can change milestone',273,'change_milestone'),(820,'Can delete milestone',273,'delete_milestone'),(821,'Can add course milestone',274,'add_coursemilestone'),(822,'Can change course milestone',274,'change_coursemilestone'),(823,'Can delete course milestone',274,'delete_coursemilestone'),(824,'Can add milestone relationship type',275,'add_milestonerelationshiptype'),(825,'Can change milestone relationship type',275,'change_milestonerelationshiptype'),(826,'Can delete milestone relationship type',275,'delete_milestonerelationshiptype'),(827,'Can add course content milestone',276,'add_coursecontentmilestone'),(828,'Can change course content milestone',276,'change_coursecontentmilestone'),(829,'Can delete course content milestone',276,'delete_coursecontentmilestone'),(830,'Can add api access request',1,'add_apiaccessrequest'),(831,'Can change api access request',1,'change_apiaccessrequest'),(832,'Can delete api access request',1,'delete_apiaccessrequest'),(833,'Can add api access config',277,'add_apiaccessconfig'),(834,'Can change api access config',277,'change_apiaccessconfig'),(835,'Can delete api access config',277,'delete_apiaccessconfig'),(836,'Can add catalog',278,'add_catalog'),(837,'Can change catalog',278,'change_catalog'),(838,'Can delete catalog',278,'delete_catalog'),(839,'Can add migrate verified track cohorts setting',279,'add_migrateverifiedtrackcohortssetting'),(840,'Can change migrate verified track cohorts setting',279,'change_migrateverifiedtrackcohortssetting'),(841,'Can delete migrate verified track cohorts setting',279,'delete_migrateverifiedtrackcohortssetting'),(842,'Can add verified track cohorted course',280,'add_verifiedtrackcohortedcourse'),(843,'Can change verified track cohorted course',280,'change_verifiedtrackcohortedcourse'),(844,'Can delete verified track cohorted course',280,'delete_verifiedtrackcohortedcourse'),(845,'Can add badge assertion',281,'add_badgeassertion'),(846,'Can change badge assertion',281,'change_badgeassertion'),(847,'Can delete badge assertion',281,'delete_badgeassertion'),(848,'Can add course complete image configuration',282,'add_coursecompleteimageconfiguration'),(849,'Can change course complete image configuration',282,'change_coursecompleteimageconfiguration'),(850,'Can delete course complete image configuration',282,'delete_coursecompleteimageconfiguration'),(851,'Can add badge class',283,'add_badgeclass'),(852,'Can change badge class',283,'change_badgeclass'),(853,'Can delete badge class',283,'delete_badgeclass'),(854,'Can add course event badges configuration',284,'add_courseeventbadgesconfiguration'),(855,'Can change course event badges configuration',284,'change_courseeventbadgesconfiguration'),(856,'Can delete course event badges configuration',284,'delete_courseeventbadgesconfiguration'),(857,'Can add email marketing configuration',285,'add_emailmarketingconfiguration'),(858,'Can change email marketing configuration',285,'change_emailmarketingconfiguration'),(859,'Can delete email marketing configuration',285,'delete_emailmarketingconfiguration'),(860,'Can add failed task',286,'add_failedtask'),(861,'Can change failed task',286,'change_failedtask'),(862,'Can delete failed task',286,'delete_failedtask'),(863,'Can add crawlers config',287,'add_crawlersconfig'),(864,'Can change crawlers config',287,'change_crawlersconfig'),(865,'Can delete crawlers config',287,'delete_crawlersconfig'),(866,'Can add Waffle flag course override',288,'add_waffleflagcourseoverridemodel'),(867,'Can change Waffle flag course override',288,'change_waffleflagcourseoverridemodel'),(868,'Can delete Waffle flag course override',288,'delete_waffleflagcourseoverridemodel'),(869,'Can add course goal',289,'add_coursegoal'),(870,'Can change course goal',289,'change_coursegoal'),(871,'Can delete course goal',289,'delete_coursegoal'),(872,'Can add historical user calendar sync config',290,'add_historicalusercalendarsyncconfig'),(873,'Can change historical user calendar sync config',290,'change_historicalusercalendarsyncconfig'),(874,'Can delete historical user calendar sync config',290,'delete_historicalusercalendarsyncconfig'),(875,'Can add user calendar sync config',291,'add_usercalendarsyncconfig'),(876,'Can change user calendar sync config',291,'change_usercalendarsyncconfig'),(877,'Can delete user calendar sync config',291,'delete_usercalendarsyncconfig'),(878,'Can add course duration limit config',292,'add_coursedurationlimitconfig'),(879,'Can change course duration limit config',292,'change_coursedurationlimitconfig'),(880,'Can delete course duration limit config',292,'delete_coursedurationlimitconfig'),(881,'Can add content type gating config',293,'add_contenttypegatingconfig'),(882,'Can change content type gating config',293,'change_contenttypegatingconfig'),(883,'Can delete content type gating config',293,'delete_contenttypegatingconfig'),(884,'Can add discount percentage config',294,'add_discountpercentageconfig'),(885,'Can change discount percentage config',294,'change_discountpercentageconfig'),(886,'Can delete discount percentage config',294,'delete_discountpercentageconfig'),(887,'Can add discount restriction config',295,'add_discountrestrictionconfig'),(888,'Can change discount restriction config',295,'change_discountrestrictionconfig'),(889,'Can delete discount restriction config',295,'delete_discountrestrictionconfig'),(890,'Can add historical Experiment Key-Value Pair',296,'add_historicalexperimentkeyvalue'),(891,'Can change historical Experiment Key-Value Pair',296,'change_historicalexperimentkeyvalue'),(892,'Can delete historical Experiment Key-Value Pair',296,'delete_historicalexperimentkeyvalue'),(893,'Can add Experiment Data',297,'add_experimentdata'),(894,'Can change Experiment Data',297,'change_experimentdata'),(895,'Can delete Experiment Data',297,'delete_experimentdata'),(896,'Can add Experiment Key-Value Pair',298,'add_experimentkeyvalue'),(897,'Can change Experiment Key-Value Pair',298,'change_experimentkeyvalue'),(898,'Can delete Experiment Key-Value Pair',298,'delete_experimentkeyvalue'),(899,'Can add self paced relative dates config',299,'add_selfpacedrelativedatesconfig'),(900,'Can change self paced relative dates config',299,'change_selfpacedrelativedatesconfig'),(901,'Can delete self paced relative dates config',299,'delete_selfpacedrelativedatesconfig'),(902,'Can add historical external id',300,'add_historicalexternalid'),(903,'Can change historical external id',300,'change_historicalexternalid'),(904,'Can delete historical external id',300,'delete_historicalexternalid'),(905,'Can add external id',301,'add_externalid'),(906,'Can change external id',301,'change_externalid'),(907,'Can delete external id',301,'delete_externalid'),(908,'Can add historical external id type',302,'add_historicalexternalidtype'),(909,'Can change historical external id type',302,'change_historicalexternalidtype'),(910,'Can delete historical external id type',302,'delete_historicalexternalidtype'),(911,'Can add external id type',303,'add_externalidtype'),(912,'Can change external id type',303,'change_externalidtype'),(913,'Can delete external id type',303,'delete_externalidtype'),(914,'Can add Schedule',304,'add_schedule'),(915,'Can change Schedule',304,'change_schedule'),(916,'Can delete Schedule',304,'delete_schedule'),(917,'Can add historical Schedule',305,'add_historicalschedule'),(918,'Can change historical Schedule',305,'change_historicalschedule'),(919,'Can delete historical Schedule',305,'delete_historicalschedule'),(920,'Can add schedule config',306,'add_scheduleconfig'),(921,'Can change schedule config',306,'change_scheduleconfig'),(922,'Can delete schedule config',306,'delete_scheduleconfig'),(923,'Can add schedule experience',307,'add_scheduleexperience'),(924,'Can change schedule experience',307,'change_scheduleexperience'),(925,'Can delete schedule experience',307,'delete_scheduleexperience'),(926,'Can add organization',308,'add_organization'),(927,'Can change organization',308,'change_organization'),(928,'Can delete organization',308,'delete_organization'),(929,'Can add historical organization',309,'add_historicalorganization'),(930,'Can change historical organization',309,'change_historicalorganization'),(931,'Can delete historical organization',309,'delete_historicalorganization'),(932,'Can add Link Course',310,'add_organizationcourse'),(933,'Can change Link Course',310,'change_organizationcourse'),(934,'Can delete Link Course',310,'delete_organizationcourse'),(935,'Can add historical enterprise course enrollment',311,'add_historicalenterprisecourseenrollment'),(936,'Can change historical enterprise course enrollment',311,'change_historicalenterprisecourseenrollment'),(937,'Can delete historical enterprise course enrollment',311,'delete_historicalenterprisecourseenrollment'),(938,'Can add system wide enterprise role',312,'add_systemwideenterpriserole'),(939,'Can change system wide enterprise role',312,'change_systemwideenterpriserole'),(940,'Can delete system wide enterprise role',312,'delete_systemwideenterpriserole'),(941,'Can add enterprise course enrollment',313,'add_enterprisecourseenrollment'),(942,'Can change enterprise course enrollment',313,'change_enterprisecourseenrollment'),(943,'Can delete enterprise course enrollment',313,'delete_enterprisecourseenrollment'),(944,'Can add enterprise feature role',314,'add_enterprisefeaturerole'),(945,'Can change enterprise feature role',314,'change_enterprisefeaturerole'),(946,'Can delete enterprise feature role',314,'delete_enterprisefeaturerole'),(947,'Can add historical pending enterprise customer user',315,'add_historicalpendingenterprisecustomeruser'),(948,'Can change historical pending enterprise customer user',315,'change_historicalpendingenterprisecustomeruser'),(949,'Can delete historical pending enterprise customer user',315,'delete_historicalpendingenterprisecustomeruser'),(950,'Can add Enterprise Customer',316,'add_enterprisecustomer'),(951,'Can change Enterprise Customer',316,'change_enterprisecustomer'),(952,'Can delete Enterprise Customer',316,'delete_enterprisecustomer'),(953,'Can add enterprise customer identity provider',317,'add_enterprisecustomeridentityprovider'),(954,'Can change enterprise customer identity provider',317,'change_enterprisecustomeridentityprovider'),(955,'Can delete enterprise customer identity provider',317,'delete_enterprisecustomeridentityprovider'),(956,'Can add Enterprise Customer Type',318,'add_enterprisecustomertype'),(957,'Can change Enterprise Customer Type',318,'change_enterprisecustomertype'),(958,'Can delete Enterprise Customer Type',318,'delete_enterprisecustomertype'),(959,'Can add historical pending enrollment',319,'add_historicalpendingenrollment'),(960,'Can change historical pending enrollment',319,'change_historicalpendingenrollment'),(961,'Can delete historical pending enrollment',319,'delete_historicalpendingenrollment'),(962,'Can add enterprise customer reporting configuration',320,'add_enterprisecustomerreportingconfiguration'),(963,'Can change enterprise customer reporting configuration',320,'change_enterprisecustomerreportingconfiguration'),(964,'Can delete enterprise customer reporting configuration',320,'delete_enterprisecustomerreportingconfiguration'),(965,'Can add system wide enterprise user role assignment',321,'add_systemwideenterpriseuserroleassignment'),(966,'Can change system wide enterprise user role assignment',321,'change_systemwideenterpriseuserroleassignment'),(967,'Can delete system wide enterprise user role assignment',321,'delete_systemwideenterpriseuserroleassignment'),(968,'Can add Enterprise Catalog Query',322,'add_enterprisecatalogquery'),(969,'Can change Enterprise Catalog Query',322,'change_enterprisecatalogquery'),(970,'Can delete Enterprise Catalog Query',322,'delete_enterprisecatalogquery'),(971,'Can add historical Enterprise Customer Catalog',323,'add_historicalenterprisecustomercatalog'),(972,'Can change historical Enterprise Customer Catalog',323,'change_historicalenterprisecustomercatalog'),(973,'Can delete historical Enterprise Customer Catalog',323,'delete_historicalenterprisecustomercatalog'),(974,'Can add pending enterprise customer user',324,'add_pendingenterprisecustomeruser'),(975,'Can change pending enterprise customer user',324,'change_pendingenterprisecustomeruser'),(976,'Can delete pending enterprise customer user',324,'delete_pendingenterprisecustomeruser'),(977,'Can add enterprise feature user role assignment',325,'add_enterprisefeatureuserroleassignment'),(978,'Can change enterprise feature user role assignment',325,'change_enterprisefeatureuserroleassignment'),(979,'Can delete enterprise feature user role assignment',325,'delete_enterprisefeatureuserroleassignment'),(980,'Can add historical Enterprise Customer',326,'add_historicalenterprisecustomer'),(981,'Can change historical Enterprise Customer',326,'change_historicalenterprisecustomer'),(982,'Can delete historical Enterprise Customer',326,'delete_historicalenterprisecustomer'),(983,'Can add Enterprise Customer Catalog',327,'add_enterprisecustomercatalog'),(984,'Can change Enterprise Customer Catalog',327,'change_enterprisecustomercatalog'),(985,'Can delete Enterprise Customer Catalog',327,'delete_enterprisecustomercatalog'),(986,'Can add enrollment notification email template',328,'add_enrollmentnotificationemailtemplate'),(987,'Can change enrollment notification email template',328,'change_enrollmentnotificationemailtemplate'),(988,'Can delete enrollment notification email template',328,'delete_enrollmentnotificationemailtemplate'),(989,'Can add Enterprise Customer Learner',329,'add_enterprisecustomeruser'),(990,'Can change Enterprise Customer Learner',329,'change_enterprisecustomeruser'),(991,'Can delete Enterprise Customer Learner',329,'delete_enterprisecustomeruser'),(992,'Can add Branding Configuration',330,'add_enterprisecustomerbrandingconfiguration'),(993,'Can change Branding Configuration',330,'change_enterprisecustomerbrandingconfiguration'),(994,'Can delete Branding Configuration',330,'delete_enterprisecustomerbrandingconfiguration'),(995,'Can add enterprise enrollment source',331,'add_enterpriseenrollmentsource'),(996,'Can change enterprise enrollment source',331,'change_enterpriseenrollmentsource'),(997,'Can delete enterprise enrollment source',331,'delete_enterpriseenrollmentsource'),(998,'Can add historical enrollment notification email template',332,'add_historicalenrollmentnotificationemailtemplate'),(999,'Can change historical enrollment notification email template',332,'change_historicalenrollmentnotificationemailtemplate'),(1000,'Can delete historical enrollment notification email template',332,'delete_historicalenrollmentnotificationemailtemplate'),(1001,'Can add pending enrollment',333,'add_pendingenrollment'),(1002,'Can change pending enrollment',333,'change_pendingenrollment'),(1003,'Can delete pending enrollment',333,'delete_pendingenrollment'),(1004,'Can add historical Data Sharing Consent Record',334,'add_historicaldatasharingconsent'),(1005,'Can change historical Data Sharing Consent Record',334,'change_historicaldatasharingconsent'),(1006,'Can delete historical Data Sharing Consent Record',334,'delete_historicaldatasharingconsent'),(1007,'Can add Data Sharing Consent Record',335,'add_datasharingconsent'),(1008,'Can change Data Sharing Consent Record',335,'change_datasharingconsent'),(1009,'Can delete Data Sharing Consent Record',335,'delete_datasharingconsent'),(1010,'Can add data sharing consent text overrides',336,'add_datasharingconsenttextoverrides'),(1011,'Can change data sharing consent text overrides',336,'change_datasharingconsenttextoverrides'),(1012,'Can delete data sharing consent text overrides',336,'delete_datasharingconsenttextoverrides'),(1013,'Can add content metadata item transmission',337,'add_contentmetadataitemtransmission'),(1014,'Can change content metadata item transmission',337,'change_contentmetadataitemtransmission'),(1015,'Can delete content metadata item transmission',337,'delete_contentmetadataitemtransmission'),(1016,'Can add learner data transmission audit',338,'add_learnerdatatransmissionaudit'),(1017,'Can change learner data transmission audit',338,'change_learnerdatatransmissionaudit'),(1018,'Can delete learner data transmission audit',338,'delete_learnerdatatransmissionaudit'),(1019,'Can add degreed global configuration',339,'add_degreedglobalconfiguration'),(1020,'Can change degreed global configuration',339,'change_degreedglobalconfiguration'),(1021,'Can delete degreed global configuration',339,'delete_degreedglobalconfiguration'),(1022,'Can add degreed enterprise customer configuration',340,'add_degreedenterprisecustomerconfiguration'),(1023,'Can change degreed enterprise customer configuration',340,'change_degreedenterprisecustomerconfiguration'),(1024,'Can delete degreed enterprise customer configuration',340,'delete_degreedenterprisecustomerconfiguration'),(1025,'Can add historical degreed enterprise customer configuration',341,'add_historicaldegreedenterprisecustomerconfiguration'),(1026,'Can change historical degreed enterprise customer configuration',341,'change_historicaldegreedenterprisecustomerconfiguration'),(1027,'Can delete historical degreed enterprise customer configuration',341,'delete_historicaldegreedenterprisecustomerconfiguration'),(1028,'Can add degreed learner data transmission audit',342,'add_degreedlearnerdatatransmissionaudit'),(1029,'Can change degreed learner data transmission audit',342,'change_degreedlearnerdatatransmissionaudit'),(1030,'Can delete degreed learner data transmission audit',342,'delete_degreedlearnerdatatransmissionaudit'),(1031,'Can add sap success factors learner data transmission audit',343,'add_sapsuccessfactorslearnerdatatransmissionaudit'),(1032,'Can change sap success factors learner data transmission audit',343,'change_sapsuccessfactorslearnerdatatransmissionaudit'),(1033,'Can delete sap success factors learner data transmission audit',343,'delete_sapsuccessfactorslearnerdatatransmissionaudit'),(1034,'Can add sap success factors enterprise customer configuration',344,'add_sapsuccessfactorsenterprisecustomerconfiguration'),(1035,'Can change sap success factors enterprise customer configuration',344,'change_sapsuccessfactorsenterprisecustomerconfiguration'),(1036,'Can delete sap success factors enterprise customer configuration',344,'delete_sapsuccessfactorsenterprisecustomerconfiguration'),(1037,'Can add sap success factors global configuration',345,'add_sapsuccessfactorsglobalconfiguration'),(1038,'Can change sap success factors global configuration',345,'change_sapsuccessfactorsglobalconfiguration'),(1039,'Can delete sap success factors global configuration',345,'delete_sapsuccessfactorsglobalconfiguration'),(1040,'Can add cornerstone enterprise customer configuration',346,'add_cornerstoneenterprisecustomerconfiguration'),(1041,'Can change cornerstone enterprise customer configuration',346,'change_cornerstoneenterprisecustomerconfiguration'),(1042,'Can delete cornerstone enterprise customer configuration',346,'delete_cornerstoneenterprisecustomerconfiguration'),(1043,'Can add cornerstone global configuration',347,'add_cornerstoneglobalconfiguration'),(1044,'Can change cornerstone global configuration',347,'change_cornerstoneglobalconfiguration'),(1045,'Can delete cornerstone global configuration',347,'delete_cornerstoneglobalconfiguration'),(1046,'Can add cornerstone learner data transmission audit',348,'add_cornerstonelearnerdatatransmissionaudit'),(1047,'Can change cornerstone learner data transmission audit',348,'change_cornerstonelearnerdatatransmissionaudit'),(1048,'Can delete cornerstone learner data transmission audit',348,'delete_cornerstonelearnerdatatransmissionaudit'),(1049,'Can add historical cornerstone enterprise customer configuration',349,'add_historicalcornerstoneenterprisecustomerconfiguration'),(1050,'Can change historical cornerstone enterprise customer configuration',349,'change_historicalcornerstoneenterprisecustomerconfiguration'),(1051,'Can delete historical cornerstone enterprise customer configuration',349,'delete_historicalcornerstoneenterprisecustomerconfiguration'),(1052,'Can add xapi learner data transmission audit',350,'add_xapilearnerdatatransmissionaudit'),(1053,'Can change xapi learner data transmission audit',350,'change_xapilearnerdatatransmissionaudit'),(1054,'Can delete xapi learner data transmission audit',350,'delete_xapilearnerdatatransmissionaudit'),(1055,'Can add xapilrs configuration',351,'add_xapilrsconfiguration'),(1056,'Can change xapilrs configuration',351,'change_xapilrsconfiguration'),(1057,'Can delete xapilrs configuration',351,'delete_xapilrsconfiguration'),(1058,'Can add credentials api config',352,'add_credentialsapiconfig'),(1059,'Can change credentials api config',352,'change_credentialsapiconfig'),(1060,'Can delete credentials api config',352,'delete_credentialsapiconfig'),(1061,'Can add notify_credentials argument',353,'add_notifycredentialsconfig'),(1062,'Can change notify_credentials argument',353,'change_notifycredentialsconfig'),(1063,'Can delete notify_credentials argument',353,'delete_notifycredentialsconfig'),(1064,'Can add historical persistent subsection grade override',354,'add_historicalpersistentsubsectiongradeoverride'),(1065,'Can change historical persistent subsection grade override',354,'change_historicalpersistentsubsectiongradeoverride'),(1066,'Can delete historical persistent subsection grade override',354,'delete_historicalpersistentsubsectiongradeoverride'),(1067,'Can add persistent subsection grade override',355,'add_persistentsubsectiongradeoverride'),(1068,'Can change persistent subsection grade override',355,'change_persistentsubsectiongradeoverride'),(1069,'Can delete persistent subsection grade override',355,'delete_persistentsubsectiongradeoverride'),(1070,'Can add persistent grades enabled flag',356,'add_persistentgradesenabledflag'),(1071,'Can change persistent grades enabled flag',356,'change_persistentgradesenabledflag'),(1072,'Can delete persistent grades enabled flag',356,'delete_persistentgradesenabledflag'),(1073,'Can add compute grades setting',357,'add_computegradessetting'),(1074,'Can change compute grades setting',357,'change_computegradessetting'),(1075,'Can delete compute grades setting',357,'delete_computegradessetting'),(1076,'Can add visible blocks',358,'add_visibleblocks'),(1077,'Can change visible blocks',358,'change_visibleblocks'),(1078,'Can delete visible blocks',358,'delete_visibleblocks'),(1079,'Can add course persistent grades flag',359,'add_coursepersistentgradesflag'),(1080,'Can change course persistent grades flag',359,'change_coursepersistentgradesflag'),(1081,'Can delete course persistent grades flag',359,'delete_coursepersistentgradesflag'),(1082,'Can add persistent subsection grade',360,'add_persistentsubsectiongrade'),(1083,'Can change persistent subsection grade',360,'change_persistentsubsectiongrade'),(1084,'Can delete persistent subsection grade',360,'delete_persistentsubsectiongrade'),(1085,'Can add persistent course grade',361,'add_persistentcoursegrade'),(1086,'Can change persistent course grade',361,'change_persistentcoursegrade'),(1087,'Can delete persistent course grade',361,'delete_persistentcoursegrade'),(1088,'Can add program enrollment',362,'add_programenrollment'),(1089,'Can change program enrollment',362,'change_programenrollment'),(1090,'Can delete program enrollment',362,'delete_programenrollment'),(1091,'Can add course access role assignment',363,'add_courseaccessroleassignment'),(1092,'Can change course access role assignment',363,'change_courseaccessroleassignment'),(1093,'Can delete course access role assignment',363,'delete_courseaccessroleassignment'),(1094,'Can add historical program course enrollment',364,'add_historicalprogramcourseenrollment'),(1095,'Can change historical program course enrollment',364,'change_historicalprogramcourseenrollment'),(1096,'Can delete historical program course enrollment',364,'delete_historicalprogramcourseenrollment'),(1097,'Can add program course enrollment',365,'add_programcourseenrollment'),(1098,'Can change program course enrollment',365,'change_programcourseenrollment'),(1099,'Can delete program course enrollment',365,'delete_programcourseenrollment'),(1100,'Can add historical program enrollment',366,'add_historicalprogramenrollment'),(1101,'Can change historical program enrollment',366,'change_historicalprogramenrollment'),(1102,'Can delete historical program enrollment',366,'delete_historicalprogramenrollment'),(1103,'Can add site theme',367,'add_sitetheme'),(1104,'Can change site theme',367,'change_sitetheme'),(1105,'Can delete site theme',367,'delete_sitetheme'),(1106,'Can add x block cache',368,'add_xblockcache'),(1107,'Can change x block cache',368,'change_xblockcache'),(1108,'Can delete x block cache',368,'delete_xblockcache'),(1109,'Can add bookmark',369,'add_bookmark'),(1110,'Can change bookmark',369,'change_bookmark'),(1111,'Can delete bookmark',369,'delete_bookmark'),(1112,'Can add announcement',370,'add_announcement'),(1113,'Can change announcement',370,'change_announcement'),(1114,'Can delete announcement',370,'delete_announcement'),(1115,'Can add content library',371,'add_contentlibrary'),(1116,'Can change content library',371,'change_contentlibrary'),(1117,'Can delete content library',371,'delete_contentlibrary'),(1118,'Can add content library permission',372,'add_contentlibrarypermission'),(1119,'Can change content library permission',372,'change_contentlibrarypermission'),(1120,'Can delete content library permission',372,'delete_contentlibrarypermission'),(1121,'Can add csv operation',373,'add_csvoperation'),(1122,'Can change csv operation',373,'change_csvoperation'),(1123,'Can delete csv operation',373,'delete_csvoperation'),(1124,'Can add content date',374,'add_contentdate'),(1125,'Can change content date',374,'change_contentdate'),(1126,'Can delete content date',374,'delete_contentdate'),(1127,'Can add user date',375,'add_userdate'),(1128,'Can change user date',375,'change_userdate'),(1129,'Can delete user date',375,'delete_userdate'),(1130,'Can add date policy',376,'add_datepolicy'),(1131,'Can change date policy',376,'change_datepolicy'),(1132,'Can delete date policy',376,'delete_datepolicy'),(1133,'Can add proctored exam attempt history',377,'add_proctoredexamstudentattempthistory'),(1134,'Can change proctored exam attempt history',377,'change_proctoredexamstudentattempthistory'),(1135,'Can delete proctored exam attempt history',377,'delete_proctoredexamstudentattempthistory'),(1136,'Can add proctored exam',378,'add_proctoredexam'),(1137,'Can change proctored exam',378,'change_proctoredexam'),(1138,'Can delete proctored exam',378,'delete_proctoredexam'),(1139,'Can add proctored exam attempt',379,'add_proctoredexamstudentattempt'),(1140,'Can change proctored exam attempt',379,'change_proctoredexamstudentattempt'),(1141,'Can delete proctored exam attempt',379,'delete_proctoredexamstudentattempt'),(1142,'Can add proctored allowance',380,'add_proctoredexamstudentallowance'),(1143,'Can change proctored allowance',380,'change_proctoredexamstudentallowance'),(1144,'Can delete proctored allowance',380,'delete_proctoredexamstudentallowance'),(1145,'Can add proctored allowance history',381,'add_proctoredexamstudentallowancehistory'),(1146,'Can change proctored allowance history',381,'change_proctoredexamstudentallowancehistory'),(1147,'Can delete proctored allowance history',381,'delete_proctoredexamstudentallowancehistory'),(1148,'Can add Proctored exam software secure review',382,'add_proctoredexamsoftwaresecurereview'),(1149,'Can change Proctored exam software secure review',382,'change_proctoredexamsoftwaresecurereview'),(1150,'Can delete Proctored exam software secure review',382,'delete_proctoredexamsoftwaresecurereview'),(1151,'Can add Proctored exam review policy',383,'add_proctoredexamreviewpolicy'),(1152,'Can change Proctored exam review policy',383,'change_proctoredexamreviewpolicy'),(1153,'Can delete Proctored exam review policy',383,'delete_proctoredexamreviewpolicy'),(1154,'Can add proctored exam review policy history',384,'add_proctoredexamreviewpolicyhistory'),(1155,'Can change proctored exam review policy history',384,'change_proctoredexamreviewpolicyhistory'),(1156,'Can delete proctored exam review policy history',384,'delete_proctoredexamreviewpolicyhistory'),(1157,'Can add Proctored exam review archive',385,'add_proctoredexamsoftwaresecurereviewhistory'),(1158,'Can change Proctored exam review archive',385,'change_proctoredexamsoftwaresecurereviewhistory'),(1159,'Can delete Proctored exam review archive',385,'delete_proctoredexamsoftwaresecurereviewhistory'),(1160,'Can add proctored exam software secure comment',386,'add_proctoredexamsoftwaresecurecomment'),(1161,'Can change proctored exam software secure comment',386,'change_proctoredexamsoftwaresecurecomment'),(1162,'Can delete proctored exam software secure comment',386,'delete_proctoredexamsoftwaresecurecomment'),(1163,'Can add block completion',387,'add_blockcompletion'),(1164,'Can change block completion',387,'change_blockcompletion'),(1165,'Can delete block completion',387,'delete_blockcompletion'),(1166,'Can add score overrider',388,'add_scoreoverrider'),(1167,'Can change score overrider',388,'change_scoreoverrider'),(1168,'Can delete score overrider',388,'delete_scoreoverrider'),(1169,'Can add launch log',389,'add_launchlog'),(1170,'Can change launch log',389,'change_launchlog'),(1171,'Can delete launch log',389,'delete_launchlog'),(1172,'Can add lti credential',390,'add_lticredential'),(1173,'Can change lti credential',390,'change_lticredential'),(1174,'Can delete lti credential',390,'delete_lticredential'),(1175,'Can add pathway',391,'add_pathway'),(1176,'Can change pathway',391,'change_pathway'),(1177,'Can delete pathway',391,'delete_pathway'),(1178,'Can add video upload config',392,'add_videouploadconfig'),(1179,'Can change video upload config',392,'change_videouploadconfig'),(1180,'Can delete video upload config',392,'delete_videouploadconfig'),(1181,'Can add course creator',393,'add_coursecreator'),(1182,'Can change course creator',393,'change_coursecreator'),(1183,'Can delete course creator',393,'delete_coursecreator'),(1184,'Can add course edit lti fields enabled flag',394,'add_courseeditltifieldsenabledflag'),(1185,'Can change course edit lti fields enabled flag',394,'change_courseeditltifieldsenabledflag'),(1186,'Can delete course edit lti fields enabled flag',394,'delete_courseeditltifieldsenabledflag'),(1187,'Can add studio config',395,'add_studioconfig'),(1188,'Can change studio config',395,'change_studioconfig'),(1189,'Can delete studio config',395,'delete_studioconfig'),(1190,'Can add tag category',396,'add_tagcategories'),(1191,'Can change tag category',396,'change_tagcategories'),(1192,'Can delete tag category',396,'delete_tagcategories'),(1193,'Can add available tag value',397,'add_tagavailablevalues'),(1194,'Can change available tag value',397,'change_tagavailablevalues'),(1195,'Can delete available tag value',397,'delete_tagavailablevalues'),(1196,'Can add user task artifact',398,'add_usertaskartifact'),(1197,'Can change user task artifact',398,'change_usertaskartifact'),(1198,'Can delete user task artifact',398,'delete_usertaskartifact'),(1199,'Can add user task status',399,'add_usertaskstatus'),(1200,'Can change user task status',399,'change_usertaskstatus'),(1201,'Can delete user task status',399,'delete_usertaskstatus');
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
  `last_name` varchar(30) NOT NULL,
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
INSERT INTO `auth_user` VALUES (1,'!sqHJ06uo4FRmt1p79GtfhiwLQwYqvkwfcodJsLUW',NULL,0,'ecommerce_worker','','','ecommerce_worker@example.com',0,1,'2020-04-06 20:22:08.517644'),(2,'!qMygERD93HhSMdwO2keMofWzTyBYayrUDlP09WAP',NULL,0,'login_service_user','','','login_service_user@fake.email',0,1,'2020-04-06 20:38:25.057381'),(3,'pbkdf2_sha256$36000$F6gaRZBsIOSQ$DEYG3JI1XxR8DxVqCM3V8zGazH0mLN6Ten5ZFLljGZA=',NULL,1,'edx','','','edx@example.com',1,1,'2020-04-06 20:46:12.358488'),(4,'pbkdf2_sha256$36000$Hyc0SWrbguzA$nQJ8ZuiqrExJ4JL8Z6C3n+nJbXpZBd1/KiqK49TRlMQ=',NULL,0,'enterprise_worker','','','enterprise_worker@example.com',0,1,'2020-04-06 20:46:28.897730'),(5,'pbkdf2_sha256$20000$TjE34FJjc3vv$0B7GUmH8RwrOc/BvMoxjb5j8EgnWTt3sxorDANeF7Qw=',NULL,0,'honor','','','honor@example.com',0,1,'2020-04-06 20:48:59.593809'),(6,'pbkdf2_sha256$20000$TjE34FJjc3vv$0B7GUmH8RwrOc/BvMoxjb5j8EgnWTt3sxorDANeF7Qw=',NULL,0,'audit','','','audit@example.com',0,1,'2020-04-06 20:49:08.515509'),(7,'pbkdf2_sha256$20000$TjE34FJjc3vv$0B7GUmH8RwrOc/BvMoxjb5j8EgnWTt3sxorDANeF7Qw=',NULL,0,'verified','','','verified@example.com',0,1,'2020-04-06 20:49:17.493748'),(8,'pbkdf2_sha256$20000$TjE34FJjc3vv$0B7GUmH8RwrOc/BvMoxjb5j8EgnWTt3sxorDANeF7Qw=',NULL,0,'staff','','','staff@example.com',1,1,'2020-04-06 20:49:26.288782'),(9,'pbkdf2_sha256$36000$r3gdOd0YGoFx$h67Hx+NBujXtQmR30scgiAkGtB6S6k+xU8f3QlL/0vU=',NULL,1,'retirement_service_worker','','','retirement_service_worker@example.com',1,1,'2020-04-06 20:59:51.644187');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
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
  `allow_certificate` tinyint(1) NOT NULL,
  `bio` varchar(3000) DEFAULT NULL,
  `profile_image_uploaded_at` datetime(6) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `auth_userprofile_name_50909f10` (`name`),
  KEY `auth_userprofile_language_8948d814` (`language`),
  KEY `auth_userprofile_location_ca92e4f6` (`location`),
  KEY `auth_userprofile_year_of_birth_6559b9a5` (`year_of_birth`),
  KEY `auth_userprofile_gender_44a122fb` (`gender`),
  KEY `auth_userprofile_level_of_education_93927e04` (`level_of_education`),
  CONSTRAINT `auth_userprofile_user_id_62634b27_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_userprofile`
--

LOCK TABLES `auth_userprofile` WRITE;
/*!40000 ALTER TABLE `auth_userprofile` DISABLE KEYS */;
INSERT INTO `auth_userprofile` VALUES (1,'','','course.xml','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,3,NULL),(2,'','','course.xml','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,4,NULL),(3,'','','course.xml','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,5,NULL),(4,'','','course.xml','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,6,NULL),(5,'','','course.xml','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,7,NULL),(6,'','','course.xml','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,8,NULL),(7,'','','course.xml','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,9,NULL);
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `badges_badgeclass_slug_issuing_component_course_id_92cd3912_uniq` (`slug`,`issuing_component`,`course_id`),
  KEY `badges_badgeclass_slug_5f420f6f` (`slug`),
  KEY `badges_badgeclass_issuing_component_85b6d93d` (`issuing_component`)
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
INSERT INTO `bookmarks_xblockcache` VALUES (1,'2020-04-06 20:48:22.895562','2020-04-06 20:48:32.919866','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@course+block@course','Demonstration Course','[]'),(2,'2020-04-06 20:48:32.951608','2020-04-06 20:48:44.087008','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@Sample_Algebraic_Problem','Mathematical Expressions','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_0c92347a5c00\",\"Mathematical Expressions\"]]]'),(3,'2020-04-06 20:48:33.019078','2020-04-06 20:48:44.089399','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@82d599b014b246c7a9b5dfc750dc08a9','Getting Started','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@867dddb6f55d410caaa9c1eb9c6743ec\",\"Getting Started\"]]]'),(4,'2020-04-06 20:48:33.085434','2020-04-06 20:48:44.091661','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@6b6bee43c7c641509da71c9299cc9f5a','Blank HTML Page','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@d6eaa391d2be41dea20b8b1bfbcb1c45\",\"Getting Your edX Certificate\"]]]'),(5,'2020-04-06 20:48:33.119185','2020-04-06 20:48:44.093543','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5','Lesson 1 - Getting Started','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"]]]'),(6,'2020-04-06 20:48:33.153126','2020-04-06 20:48:33.153126','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations','Example Week 1: Getting Started','[]'),(7,'2020-04-06 20:48:33.186608','2020-04-06 20:48:44.095762','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@c7e98fd39a6944edb6b286c32e1150ff','Passing a Course','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"]]]'),(8,'2020-04-06 20:48:33.220182','2020-04-06 20:48:44.098268','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@ddede76df71045ffa16de9d1481d2119','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_36e0beb03f0a\",\"Randomized Questions\"]]]'),(9,'2020-04-06 20:48:33.254028','2020-04-06 20:48:44.100526','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@45d46192272c4f6db6b63586520bbdf4','Getting Answers','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@b6662b497c094bcc9b870d8270c90c93\",\"Getting Answers\"]]]'),(10,'2020-04-06 20:48:33.298697','2020-04-06 20:48:44.102910','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_c037f3757df1','Electric Circuit Simulator','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"]]]'),(11,'2020-04-06 20:48:33.343315','2020-04-06 20:48:33.343315','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@chapter+block@d8a6192ade314473a78242dfeedfbf5b','Introduction','[]'),(12,'2020-04-06 20:48:33.387445','2020-04-06 20:48:44.105109','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@html_07d547513285','An Interactive Reference Table','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_2dbb0072785e\",\"An Interactive Reference Table\"]]]'),(13,'2020-04-06 20:48:33.431869','2020-04-06 20:48:44.107293','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@f91d8d31f7cf48ce990f8d8745ae4cfa','Answering More Than Once','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"]]]'),(14,'2020-04-06 20:48:33.476797','2020-04-06 20:48:44.109362','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@3c4b575924bf4b75a2f3542df5c354fc','Be Social','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@48ecb924d7fe4b66a230137626bfa93e\",\"Lesson 3 - Be Social\"]]]'),(15,'2020-04-06 20:48:33.521845','2020-04-06 20:48:44.111651','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@78e3719e864e45f3bee938461f3c3de6','Protein Builder','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_bc69a47c6fae\",\"Protein Creator\"]]]'),(16,'2020-04-06 20:48:33.566164','2020-04-06 20:48:44.113936','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@0d759dee4f9d459c8956136dbde55f02','Text Input','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@e8a5cc2aed424838853defab7be45e42\",\"Text input\"]]]'),(17,'2020-04-06 20:48:33.622145','2020-04-06 20:48:44.116158','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@Sample_ChemFormula_Problem','Chemical Equations','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_1fef54c2b23b\",\"Chemical Equations\"]]]'),(18,'2020-04-06 20:48:33.688930','2020-04-06 20:48:44.118307','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@b6662b497c094bcc9b870d8270c90c93','Getting Answers','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"]]]'),(19,'2020-04-06 20:48:33.733885','2020-04-06 20:48:44.120388','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@47dbd5f836544e61877a483c0b75606c','Drag and Drop','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"]]]'),(20,'2020-04-06 20:48:33.778640','2020-04-06 20:48:44.122663','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@python_grader','problem','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_aae927868e55\",\"Code Grader\"]]]'),(21,'2020-04-06 20:48:33.822035','2020-04-06 20:48:44.124951','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@a0effb954cca4759994f1ac9e9434bf4','Multiple Choice Questions','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@54bb9b142c6c4c22afc62bcb628f0e68\",\"Multiple Choice Questions\"]]]'),(22,'2020-04-06 20:48:33.855197','2020-04-06 20:48:44.127229','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@12ad4f3ff4c14114a6e629b00e000976','Peer Grading','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@175e76c4951144a29d46211361266e0e\",\"Homework - Essays\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@fb79dcbad35b466a8c6364f8ffee9050\",\"Peer Assessed Essays\"]]]'),(23,'2020-04-06 20:48:33.888652','2020-04-06 20:48:44.129373','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@26d89b08f75d48829a63520ed8b0037d','Homework - Find Your Study Buddy','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@dbe8fc027bcb4fe9afb744d2e8415855\",\"Homework - Find Your Study Buddy\"]]]'),(24,'2020-04-06 20:48:33.922502','2020-04-06 20:48:44.131605','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@8293139743f34377817d537b69911530','EdX Exams','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@934cc32c177d41b580c8413e561346b3\",\"EdX Exams\"]]]'),(25,'2020-04-06 20:48:33.955897','2020-04-06 20:48:44.133863','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@700x_proteinmake','Designing Proteins in Two Dimensions','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_bc69a47c6fae\",\"Protein Creator\"]]]'),(26,'2020-04-06 20:48:33.989719','2020-04-06 20:48:44.136108','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@ed01bcd164e64038a78964a16eac3edc','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_bc69a47c6fae\",\"Protein Creator\"]]]'),(27,'2020-04-06 20:48:34.036565','2020-04-06 20:48:44.138263','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@867dddb6f55d410caaa9c1eb9c6743ec','Getting Started','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"]]]'),(28,'2020-04-06 20:48:34.090849','2020-04-06 20:48:44.140371','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_2dbb0072785e','An Interactive Reference Table','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"]]]'),(29,'2020-04-06 20:48:34.190158','2020-04-06 20:48:44.142494','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_0fab6aa52165','Molecule Editor','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"]]]'),(30,'2020-04-06 20:48:34.246374','2020-04-06 20:48:44.144801','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@3169f89efde2452993f2f2d9bc74f5b2','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@e3601c0abee6427d8c17e6d6f8fdddd1\",\"Interactive Questions\"]]]'),(31,'2020-04-06 20:48:34.290431','2020-04-06 20:48:44.147098','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@6018785795994726950614ce7d0f38c5','Find Your Study Buddy','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@dbe8fc027bcb4fe9afb744d2e8415855\",\"Homework - Find Your Study Buddy\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@26d89b08f75d48829a63520ed8b0037d\",\"Homework - Find Your Study Buddy\"]]]'),(32,'2020-04-06 20:48:34.324016','2020-04-06 20:48:44.149783','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@d1b84dcd39b0423d9e288f27f0f7f242','Few Checks','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_ac391cde8a91\",\"Limited Checks\"]]]'),(33,'2020-04-06 20:48:34.357047','2020-04-06 20:48:44.152090','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@67c26b1e826e47aaa29757f62bcd1ad0','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@54bb9b142c6c4c22afc62bcb628f0e68\",\"Multiple Choice Questions\"]]]'),(34,'2020-04-06 20:48:34.390706','2020-04-06 20:48:44.154348','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@ex_practice_3','Randomized Questions','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_36e0beb03f0a\",\"Randomized Questions\"]]]'),(35,'2020-04-06 20:48:34.424260','2020-04-06 20:48:44.156402','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@d6cee45205a449369d7ef8f159b22bdf','Labs and Demos','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"]]]'),(36,'2020-04-06 20:48:34.458417','2020-04-06 20:48:44.158483','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_3888db0bc286','Discussion Forums','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@48ecb924d7fe4b66a230137626bfa93e\",\"Lesson 3 - Be Social\"]]]'),(37,'2020-04-06 20:48:34.502946','2020-04-06 20:48:44.160760','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@0a3b4139f51a4917a3aff9d519b1eeb6','Videos on edX','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@3dc16db8d14842e38324e95d4030b8a0\",\"Videos on edX\"]]]'),(38,'2020-04-06 20:48:34.546971','2020-04-06 20:48:44.162952','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@c2f7008c9ccf4bd09d5d800c98fb0722','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@256f17a44983429fb1a60802203ee4e0\",\"Video Presentation Styles\"]]]'),(39,'2020-04-06 20:48:34.591447','2020-04-06 20:48:44.164821','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@6ab9c442501d472c8ed200e367b4edfa','More Ways to Connect','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"]]]'),(40,'2020-04-06 20:48:34.636346','2020-04-06 20:48:44.167027','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@video+block@0b9e39477cf34507a7a48f74be381fdd','Welcome!','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@d8a6192ade314473a78242dfeedfbf5b\",\"Introduction\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@edx_introduction\",\"Demo Course Overview\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_0270f6de40fc\",\"Introduction: Video and Sequences\"]]]'),(41,'2020-04-06 20:48:34.714114','2020-04-06 20:48:44.169252','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@cd177caa62444fbca48aa8f843f09eac','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_ac391cde8a91\",\"Limited Checks\"]]]'),(42,'2020-04-06 20:48:34.757979','2020-04-06 20:48:44.171513','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@video+block@7e9b434e6de3435ab99bd3fb25bde807','Science and Cooking Chef Profile: JOSÉ ANDRÉS','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@4f6c1b4e316a419ab5b6bf30e6c708e9\",\"Working with Videos\"]]]'),(43,'2020-04-06 20:48:34.803053','2020-04-06 20:48:34.803053','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7','About Exams and Certificates','[]'),(44,'2020-04-06 20:48:34.847805','2020-04-06 20:48:44.173845','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@4f06b358a96f4d1dae57d6d81acd06f2','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_c037f3757df1\",\"Electric Circuit Simulator\"]]]'),(45,'2020-04-06 20:48:34.891953','2020-04-06 20:48:44.176160','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@651e0945b77f42e0a4c89b8c3e6f5b3b','Answering More Than Once','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@f91d8d31f7cf48ce990f8d8745ae4cfa\",\"Answering More Than Once\"]]]'),(46,'2020-04-06 20:48:34.936310','2020-04-06 20:48:44.178508','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@f480df4ce91347c5ae4301ddf6146238','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@b6662b497c094bcc9b870d8270c90c93\",\"Getting Answers\"]]]'),(47,'2020-04-06 20:48:34.980736','2020-04-06 20:48:44.180561','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@256f17a44983429fb1a60802203ee4e0','Video Presentation Styles','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"]]]'),(48,'2020-04-06 20:48:35.024930','2020-04-06 20:48:44.182687','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@134df56c516a4a0dbb24dd5facef746e','Reading Assignments','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"]]]'),(49,'2020-04-06 20:48:35.069610','2020-04-06 20:48:44.184939','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@700x_editmolB','Molecule Editor','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_0fab6aa52165\",\"Molecule Editor\"]]]'),(50,'2020-04-06 20:48:35.113592','2020-04-06 20:48:35.113592','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@chapter+block@9fca584977d04885bc911ea76a9ef29e','holding section','[]'),(51,'2020-04-06 20:48:35.147394','2020-04-06 20:48:44.186967','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_f04afeac0131','Immediate Feedback','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"]]]'),(52,'2020-04-06 20:48:35.191689','2020-04-06 20:48:35.191689','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions','Example Week 2: Get Interactive','[]'),(53,'2020-04-06 20:48:35.236338','2020-04-06 20:48:44.189278','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@openassessment+block@b24c33ea35954c7889e1d2944d3fe397','Open Response Assessment','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@175e76c4951144a29d46211361266e0e\",\"Homework - Essays\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@fb79dcbad35b466a8c6364f8ffee9050\",\"Peer Assessed Essays\"]]]'),(54,'2020-04-06 20:48:35.280837','2020-04-06 20:48:44.191580','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@c6cd4bea43454aaea60ad01beb0cf213','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_aae927868e55\",\"Code Grader\"]]]'),(55,'2020-04-06 20:48:35.325195','2020-04-06 20:48:44.193887','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@b8cec2a19ebf463f90cd3544c7927b0e','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@f91d8d31f7cf48ce990f8d8745ae4cfa\",\"Answering More Than Once\"]]]'),(56,'2020-04-06 20:48:35.370805','2020-04-06 20:48:44.196150','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@c554538a57664fac80783b99d9d6da7c','Pointing on a Picture','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@2152d4a4aadc4cb0af5256394a3d1fc7\",\"Pointing on a Picture\"]]]'),(57,'2020-04-06 20:48:35.415368','2020-04-06 20:48:44.198388','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@700x_pathways','Zooming Diagrams','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_98cf62510471\",\"Zooming Diagrams\"]]]'),(58,'2020-04-06 20:48:35.460462','2020-04-06 20:48:44.200415','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_bc69a47c6fae','Protein Creator','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"]]]'),(59,'2020-04-06 20:48:35.517255','2020-04-06 20:48:44.202524','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@e8a5cc2aed424838853defab7be45e42','Text input','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"]]]'),(60,'2020-04-06 20:48:35.571906','2020-04-06 20:48:44.204575','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_ac391cde8a91','Limited Checks','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"]]]'),(61,'2020-04-06 20:48:35.627441','2020-04-06 20:48:44.206804','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@d2e35c1d294b4ba0b3b1048615605d2a','Drag and Drop','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@47dbd5f836544e61877a483c0b75606c\",\"Drag and Drop\"]]]'),(62,'2020-04-06 20:48:35.682485','2020-04-06 20:48:44.208954','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@logic_gate_problem','problem','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_c037f3757df1\",\"Electric Circuit Simulator\"]]]'),(63,'2020-04-06 20:48:35.738581','2020-04-06 20:48:44.211014','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_aae927868e55','Code Grader','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"]]]'),(64,'2020-04-06 20:48:35.794406','2020-04-06 20:48:44.212966','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_1fef54c2b23b','Chemical Equations','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"]]]'),(65,'2020-04-06 20:48:35.849025','2020-04-06 20:48:44.214800','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@175e76c4951144a29d46211361266e0e','Homework - Essays','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"]]]'),(66,'2020-04-06 20:48:35.905359','2020-04-06 20:48:35.905359','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration','Example Week 3: Be Social','[]'),(67,'2020-04-06 20:48:35.962227','2020-04-06 20:48:44.216849','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@3f2c11aba9434e459676a7d7acc4d960','Google Hangout','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@6ab9c442501d472c8ed200e367b4edfa\",\"More Ways to Connect\"]]]'),(68,'2020-04-06 20:48:36.015864','2020-04-06 20:48:44.219034','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@ade92343df3d4953a40ab3adc8805390','Google Hangout','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@6ab9c442501d472c8ed200e367b4edfa\",\"More Ways to Connect\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@3f2c11aba9434e459676a7d7acc4d960\",\"Google Hangout\"]]]'),(69,'2020-04-06 20:48:36.071282','2020-04-06 20:48:44.221260','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@f9f3a25e7bab46e583fd1fbbd7a2f6a0','Be Social','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@48ecb924d7fe4b66a230137626bfa93e\",\"Lesson 3 - Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@3c4b575924bf4b75a2f3542df5c354fc\",\"Be Social\"]]]'),(70,'2020-04-06 20:48:36.192587','2020-04-06 20:48:44.223524','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@f4a39219742149f781a1dda6f43a623c','Overall Grade','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@1b0e2c2c84884b95b1c99fb678cc964c\",\"Overall Grade Performance\"]]]'),(71,'2020-04-06 20:48:36.260780','2020-04-06 20:48:44.225584','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@4a1bba2a403f40bca5ec245e945b0d76','Video Demonstrations','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"]]]'),(72,'2020-04-06 20:48:36.305784','2020-04-06 20:48:44.227767','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@2b94658d2eee4d85ae13f83bc24cfca9','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_0fab6aa52165\",\"Molecule Editor\"]]]'),(73,'2020-04-06 20:48:36.350106','2020-04-06 20:48:44.229850','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_0c92347a5c00','Mathematical Expressions','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"]]]'),(74,'2020-04-06 20:48:36.393206','2020-04-06 20:48:44.232082','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@030e35c4756a4ddc8d40b95fbbfff4d4','Blank HTML Page','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@d8a6192ade314473a78242dfeedfbf5b\",\"Introduction\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@edx_introduction\",\"Demo Course Overview\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_0270f6de40fc\",\"Introduction: Video and Sequences\"]]]'),(75,'2020-04-06 20:48:36.438138','2020-04-06 20:48:44.233922','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations','Lesson 2 - Let\'s Get Interactive!','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"]]]'),(76,'2020-04-06 20:48:36.482505','2020-04-06 20:48:44.236104','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@03f051f9a8814881a3783d2511613aa6','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_d32bf9b2242c\",\"Electronic Sound Experiment\"]]]'),(77,'2020-04-06 20:48:36.527239','2020-04-06 20:48:44.238162','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@d0d804e8863c4a95a659c04d8a2b2bc0','Lesson 2 - Let\'s Get Interactive! ','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"]]]'),(78,'2020-04-06 20:48:36.571638','2020-04-06 20:48:44.240381','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@4aba537a78774bd5a862485a8563c345','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_f04afeac0131\",\"Immediate Feedback\"]]]'),(79,'2020-04-06 20:48:36.615537','2020-04-06 20:48:44.242672','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@148ae8fa73ea460eb6f05505da0ba6e6','Getting Your edX Certificate','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@d6eaa391d2be41dea20b8b1bfbcb1c45\",\"Getting Your edX Certificate\"]]]'),(80,'2020-04-06 20:48:36.659841','2020-04-06 20:48:44.244714','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@312cb4faed17420e82ab3178fc3e251a','Getting Help','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@48ecb924d7fe4b66a230137626bfa93e\",\"Lesson 3 - Be Social\"]]]'),(81,'2020-04-06 20:48:36.704379','2020-04-06 20:48:44.246558','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow','edX Exams','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"]]]'),(82,'2020-04-06 20:48:36.749328','2020-04-06 20:48:44.249285','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@303034da25524878a2e66fb57c91cf85','Attributing Blame','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@134df56c516a4a0dbb24dd5facef746e\",\"Reading Assignments\"]]]'),(83,'2020-04-06 20:48:36.793898','2020-04-06 20:48:44.251232','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@edx_introduction','Demo Course Overview','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@d8a6192ade314473a78242dfeedfbf5b\",\"Introduction\"]]]'),(84,'2020-04-06 20:48:36.838336','2020-04-06 20:48:44.253522','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@5e009378f0b64585baa0a14b155974b9','Passing a Course','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@c7e98fd39a6944edb6b286c32e1150ff\",\"Passing a Course\"]]]'),(85,'2020-04-06 20:48:36.883473','2020-04-06 20:48:44.255432','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@07bc32474380492cb34f76e5f9d9a135','New Subsection','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@9fca584977d04885bc911ea76a9ef29e\",\"holding section\"]]]'),(86,'2020-04-06 20:48:36.927086','2020-04-06 20:48:44.257724','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@e2cb0e0994f84b0abfa5f4ae42ed9d44','Video Presentation Styles','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@256f17a44983429fb1a60802203ee4e0\",\"Video Presentation Styles\"]]]'),(87,'2020-04-06 20:48:36.971980','2020-04-06 20:48:44.259959','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@75f9562c77bc4858b61f907bb810d974','Numerical Input','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@2889db1677a549abb15eb4d886f95d1c\",\"Numerical Input\"]]]'),(88,'2020-04-06 20:48:37.016381','2020-04-06 20:48:44.262293','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@e0254b911fa246218bd98bbdadffef06','Reading Assignments','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@134df56c516a4a0dbb24dd5facef746e\",\"Reading Assignments\"]]]'),(89,'2020-04-06 20:48:37.061212','2020-04-06 20:48:44.264577','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@Lab_5B_Mosfet_Amplifier_Experiment','Electronic Sound Experiment','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_d32bf9b2242c\",\"Electronic Sound Experiment\"]]]'),(90,'2020-04-06 20:48:37.105295','2020-04-06 20:48:44.266869','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@9cee77a606ea4c1aa5440e0ea5d0f618','Interactive Questions','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@e3601c0abee6427d8c17e6d6f8fdddd1\",\"Interactive Questions\"]]]'),(91,'2020-04-06 20:48:37.150009','2020-04-06 20:48:44.269147','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@6bcccc2d7343416e9e03fd7325b2f232','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@4f6c1b4e316a419ab5b6bf30e6c708e9\",\"Working with Videos\"]]]'),(92,'2020-04-06 20:48:37.194099','2020-04-06 20:48:44.271013','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions','Homework - Question Styles','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"]]]'),(93,'2020-04-06 20:48:37.238687','2020-04-06 20:48:44.273162','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@932e6f2ce8274072a355a94560216d1a','Perchance to Dream','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@134df56c516a4a0dbb24dd5facef746e\",\"Reading Assignments\"]]]'),(94,'2020-04-06 20:48:37.282605','2020-04-06 20:48:44.275455','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@video+block@5c90cffecd9b48b188cbfea176bf7fe9','Video','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@3dc16db8d14842e38324e95d4030b8a0\",\"Videos on edX\"]]]'),(95,'2020-04-06 20:48:37.327725','2020-04-06 20:48:44.277755','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@2574c523e97b477a9d72fbb37bfb995f','Text','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@134df56c516a4a0dbb24dd5facef746e\",\"Reading Assignments\"]]]'),(96,'2020-04-06 20:48:37.405935','2020-04-06 20:48:44.279981','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@ex_practice_limited_checks','Limited Checks','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_ac391cde8a91\",\"Limited Checks\"]]]'),(97,'2020-04-06 20:48:37.454142','2020-04-06 20:48:44.282024','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_98cf62510471','Zooming Diagrams','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"]]]'),(98,'2020-04-06 20:48:37.495269','2020-04-06 20:48:44.284213','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@free_form_simulation','problem','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_c037f3757df1\",\"Electric Circuit Simulator\"]]]'),(99,'2020-04-06 20:48:37.539084','2020-04-06 20:48:44.286319','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@1b0e2c2c84884b95b1c99fb678cc964c','Overall Grade Performance','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"]]]'),(100,'2020-04-06 20:48:37.583031','2020-04-06 20:48:44.288466','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@722085be27c84ac693cfebc8ac5da700','Videos on edX','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@3dc16db8d14842e38324e95d4030b8a0\",\"Videos on edX\"]]]'),(101,'2020-04-06 20:48:37.628485','2020-04-06 20:48:44.290562','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@4f6c1b4e316a419ab5b6bf30e6c708e9','Working with Videos','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"]]]'),(102,'2020-04-06 20:48:37.672771','2020-04-06 20:48:44.292394','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@dbe8fc027bcb4fe9afb744d2e8415855','Homework - Find Your Study Buddy','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"]]]'),(103,'2020-04-06 20:48:37.717093','2020-04-06 20:48:44.294198','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@48ecb924d7fe4b66a230137626bfa93e','Lesson 3 - Be Social','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"]]]'),(104,'2020-04-06 20:48:37.761033','2020-04-06 20:48:44.296473','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@6f7a6670f87147149caeff6afa07a526','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_2dbb0072785e\",\"An Interactive Reference Table\"]]]'),(105,'2020-04-06 20:48:37.806032','2020-04-06 20:48:44.298764','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@5ab88e67d46049b9aa694cb240c39cef','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@47dbd5f836544e61877a483c0b75606c\",\"Drag and Drop\"]]]'),(106,'2020-04-06 20:48:37.850119','2020-04-06 20:48:44.301028','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@e5eac7e1a5a24f5fa7ed77bb6d136591','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@2152d4a4aadc4cb0af5256394a3d1fc7\",\"Pointing on a Picture\"]]]'),(107,'2020-04-06 20:48:37.894829','2020-04-06 20:48:44.302988','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@d6eaa391d2be41dea20b8b1bfbcb1c45','Getting Your edX Certificate','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"]]]'),(108,'2020-04-06 20:48:37.939302','2020-04-06 20:48:44.305084','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@934cc32c177d41b580c8413e561346b3','EdX Exams','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"]]]'),(109,'2020-04-06 20:48:37.984217','2020-04-06 20:48:44.307366','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@891211e17f9a472290a5f12c7a6626d7','Code Grader','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_aae927868e55\",\"Code Grader\"]]]'),(110,'2020-04-06 20:48:38.028246','2020-04-06 20:48:44.309640','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@ed5dccf14ae94353961f46fa07217491','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@4a1bba2a403f40bca5ec245e945b0d76\",\"Video Demonstrations\"]]]'),(111,'2020-04-06 20:48:38.073562','2020-04-06 20:48:44.311701','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@3dc16db8d14842e38324e95d4030b8a0','Videos on edX','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"]]]'),(112,'2020-04-06 20:48:38.128959','2020-04-06 20:48:44.313963','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@2bee8c4248e842a19ba1e73ed8d426c2','Labs and Demos','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@d6cee45205a449369d7ef8f159b22bdf\",\"Labs and Demos\"]]]'),(113,'2020-04-06 20:48:38.184980','2020-04-06 20:48:44.316260','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@4d672c5893cb4f1dad0de67d2008522e','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_1fef54c2b23b\",\"Chemical Equations\"]]]'),(114,'2020-04-06 20:48:38.240569','2020-04-06 20:48:44.318570','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@video+block@636541acbae448d98ab484b028c9a7f6','Connecting a Circuit and a Circuit Diagram','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@256f17a44983429fb1a60802203ee4e0\",\"Video Presentation Styles\"]]]'),(115,'2020-04-06 20:48:38.480946','2020-04-06 20:48:44.320760','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@ffa5817d49e14fec83ad6187cbe16358','Reading Sample','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@134df56c516a4a0dbb24dd5facef746e\",\"Reading Assignments\"]]]'),(116,'2020-04-06 20:48:39.466003','2020-04-06 20:48:44.322960','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@e0d7423118ab432582d03e8e8dad8e36','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_98cf62510471\",\"Zooming Diagrams\"]]]'),(117,'2020-04-06 20:48:39.544247','2020-04-06 20:48:44.325213','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@8bb218cccf8d40519a971ff0e4901ccf','Getting Help','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@48ecb924d7fe4b66a230137626bfa93e\",\"Lesson 3 - Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@312cb4faed17420e82ab3178fc3e251a\",\"Getting Help\"]]]'),(118,'2020-04-06 20:48:39.904878','2020-04-06 20:48:44.327468','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@0aa7a3bdbe18427795b0c1a1d7c3cb9a','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_0fab6aa52165\",\"Molecule Editor\"]]]'),(119,'2020-04-06 20:48:39.985402','2020-04-06 20:48:44.329752','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@6244918637ed4ff4b5f94a840a7e4b43','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@e8a5cc2aed424838853defab7be45e42\",\"Text input\"]]]'),(120,'2020-04-06 20:48:40.064033','2020-04-06 20:48:44.331735','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_0270f6de40fc','Introduction: Video and Sequences','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@d8a6192ade314473a78242dfeedfbf5b\",\"Introduction\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@edx_introduction\",\"Demo Course Overview\"]]]'),(121,'2020-04-06 20:48:40.149252','2020-04-06 20:48:44.333789','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@fb79dcbad35b466a8c6364f8ffee9050','Peer Assessed Essays','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@175e76c4951144a29d46211361266e0e\",\"Homework - Essays\"]]]'),(122,'2020-04-06 20:48:40.301906','2020-04-06 20:48:44.336040','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@d5a5caaf35e84ebc9a747038465dcfb4','Electronic Circuit Simulator','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_c037f3757df1\",\"Electric Circuit Simulator\"]]]'),(123,'2020-04-06 20:48:40.368595','2020-04-06 20:48:44.338286','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@d45779ad3d024a40a09ad8cc317c0970','Text','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@6ab9c442501d472c8ed200e367b4edfa\",\"More Ways to Connect\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@3f2c11aba9434e459676a7d7acc4d960\",\"Google Hangout\"]]]'),(124,'2020-04-06 20:48:40.460577','2020-04-06 20:48:44.340221','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@2889db1677a549abb15eb4d886f95d1c','Numerical Input','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"]]]'),(125,'2020-04-06 20:48:40.536182','2020-04-06 20:48:44.342313','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@e3601c0abee6427d8c17e6d6f8fdddd1','Interactive Questions','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"]]]'),(126,'2020-04-06 20:48:40.658806','2020-04-06 20:48:44.344596','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@55cbc99f262443d886a25cf84594eafb','Text','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@6ab9c442501d472c8ed200e367b4edfa\",\"More Ways to Connect\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@3f2c11aba9434e459676a7d7acc4d960\",\"Google Hangout\"]]]'),(127,'2020-04-06 20:48:40.727432','2020-04-06 20:48:44.346848','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@discussion_5deb6081620d','Discussion Forums','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@48ecb924d7fe4b66a230137626bfa93e\",\"Lesson 3 - Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_3888db0bc286\",\"Discussion Forums\"]]]'),(128,'2020-04-06 20:48:40.792099','2020-04-06 20:48:44.349585','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@78d7d3642f3a4dbabbd1b017861aa5f2','Lesson 2: Let\'s Get Interactive!','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@d0d804e8863c4a95a659c04d8a2b2bc0\",\"Lesson 2 - Let\'s Get Interactive! \"]]]'),(129,'2020-04-06 20:48:40.848172','2020-04-06 20:48:44.351998','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@html_49b4494da2f7','Discussion Forums','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@48ecb924d7fe4b66a230137626bfa93e\",\"Lesson 3 - Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_3888db0bc286\",\"Discussion Forums\"]]]'),(130,'2020-04-06 20:48:40.892047','2020-04-06 20:48:44.354280','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@23e6eda482c04335af2bb265beacaf59','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@c7e98fd39a6944edb6b286c32e1150ff\",\"Passing a Course\"]]]'),(131,'2020-04-06 20:48:40.937122','2020-04-06 20:48:44.356510','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@1a810b1a3b2447b998f0917d0e5a802b','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@1b0e2c2c84884b95b1c99fb678cc964c\",\"Overall Grade Performance\"]]]'),(132,'2020-04-06 20:48:40.981270','2020-04-06 20:48:44.358340','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations','Homework - Labs and Demos','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"]]]'),(133,'2020-04-06 20:48:41.026214','2020-04-06 20:48:44.360250','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@2152d4a4aadc4cb0af5256394a3d1fc7','Pointing on a Picture','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"]]]'),(134,'2020-04-06 20:48:41.070942','2020-04-06 20:48:44.362397','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@412dc8dbb6674014862237b23c1f643f','Working with Videos','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@4f6c1b4e316a419ab5b6bf30e6c708e9\",\"Working with Videos\"]]]'),(135,'2020-04-06 20:48:41.114312','2020-04-06 20:48:44.364482','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_d32bf9b2242c','Electronic Sound Experiment','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"]]]'),(136,'2020-04-06 20:48:41.158851','2020-04-06 20:48:44.366449','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_36e0beb03f0a','Randomized Questions','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"]]]'),(137,'2020-04-06 20:48:41.203655','2020-04-06 20:48:44.368580','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@501aed9d902349eeb2191fa505548de2','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@2889db1677a549abb15eb4d886f95d1c\",\"Numerical Input\"]]]'),(138,'2020-04-06 20:48:41.248542','2020-04-06 20:48:44.370815','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@9f9e1373cc8243b985c8750cc8acec7d','Video Demonstrations','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@4a1bba2a403f40bca5ec245e945b0d76\",\"Video Demonstrations\"]]]'),(139,'2020-04-06 20:48:41.292161','2020-04-06 20:48:44.372852','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@54bb9b142c6c4c22afc62bcb628f0e68','Multiple Choice Questions','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"]]]'),(140,'2020-04-06 20:48:41.336986','2020-04-06 20:48:44.374959','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@870371212ba04dcf9536d7c7b8f3109e','','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_0c92347a5c00\",\"Mathematical Expressions\"]]]'),(141,'2020-04-06 20:48:41.382274','2020-04-06 20:48:44.377164','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@ex_practice_2','Immediate Feedback','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7\",\"About Exams and Certificates\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow\",\"edX Exams\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@vertical_f04afeac0131\",\"Immediate Feedback\"]]]'),(142,'2020-04-06 20:48:44.411082','2020-04-06 20:48:44.411082','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@discussion+block@1c8d47c425724346a7968fa1bc745dcd','Labs and Tools','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@a79d59cd72034188a71d388f4954a606\",\"Exciting Labs and Tools\"]]]'),(143,'2020-04-06 20:48:44.457649','2020-04-06 20:48:44.457649','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@9b9687073e904ae197799dc415df899f','Molecule Structures','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@8f89194410954e768bde1764985454a7\",\"Molecule Structures\"]]]'),(144,'2020-04-06 20:48:44.500894','2020-04-06 20:48:44.500894','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@video+block@ab98b0e385e64445ae97e730ffdf17e7','Biology Demonstration','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@f0e6d90842c44cc7a50fd1a18a7dd982\",\"Video Demonstrations\"]]]'),(145,'2020-04-06 20:48:44.545386','2020-04-06 20:48:44.545386','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@2d3efa8db04346548bd5e5374de77628','Text','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@f0e6d90842c44cc7a50fd1a18a7dd982\",\"Video Demonstrations\"]]]'),(146,'2020-04-06 20:48:44.589955','2020-04-06 20:48:44.589955','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@d7daeff25e4f4026bdd269ae69e03e02','Instructor-Programmed Responses','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@fb6b62dbec4348528629cf2232b86aea\",\"Instructor Programmed Responses\"]]]'),(147,'2020-04-06 20:48:44.635629','2020-04-06 20:48:44.635629','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@7efc7bf4a47b4a6cb6595c32cde7712a','Homework - Find Your Study Buddy','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@48ecb924d7fe4b66a230137626bfa93e\",\"Lesson 3 - Be Social\"]]]'),(148,'2020-04-06 20:48:44.678372','2020-04-06 20:48:44.678372','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@f0e6d90842c44cc7a50fd1a18a7dd982','Video Demonstrations','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"]]]'),(149,'2020-04-06 20:48:44.722796','2020-04-06 20:48:44.722796','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@eb469ec408fa4ab1a9b86c634ca9bfa9','Text','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@f0e6d90842c44cc7a50fd1a18a7dd982\",\"Video Demonstrations\"]]]'),(150,'2020-04-06 20:48:44.767638','2020-04-06 20:48:44.767638','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@ffcd6351126d4ca984409180e41d1b51','Exciting Labs and Tools','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@a79d59cd72034188a71d388f4954a606\",\"Exciting Labs and Tools\"]]]'),(151,'2020-04-06 20:48:44.812155','2020-04-06 20:48:44.812155','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@9d5104b502f24ee89c3d2f4ce9d347cf','When Are Your Exams? ','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@d91b9e5d8bc64d57a1332d06bf2f2193\",\"When Are Your Exams? \"]]]'),(152,'2020-04-06 20:48:44.855637','2020-04-06 20:48:44.855637','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@45c7cedb4bfe46f4a68c78787151cfb5','New Unit','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@9fca584977d04885bc911ea76a9ef29e\",\"holding section\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@07bc32474380492cb34f76e5f9d9a135\",\"New Subsection\"]]]'),(153,'2020-04-06 20:48:44.901072','2020-04-06 20:48:44.901072','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@a79d59cd72034188a71d388f4954a606','Exciting Labs and Tools','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"]]]'),(154,'2020-04-06 20:48:44.946802','2020-04-06 20:48:44.946802','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@video+block@af7fe1335eb841cd81ce31c7ee8eb069','Video','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@4e592689563243c484af947465eaef0d\",\"New Unit\"]]]'),(155,'2020-04-06 20:48:45.023262','2020-04-06 20:48:45.023262','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@87fa6792d79f4862be098e5169e93339','Blank HTML Page','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@social_integration\",\"Example Week 3: Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@48ecb924d7fe4b66a230137626bfa93e\",\"Lesson 3 - Be Social\"],[\"block-v1:edX+DemoX+Demo_Course+type@vertical+block@7efc7bf4a47b4a6cb6595c32cde7712a\",\"Homework - Find Your Study Buddy\"]]]'),(156,'2020-04-06 20:48:45.067869','2020-04-06 20:48:45.067869','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@d91b9e5d8bc64d57a1332d06bf2f2193','When Are Your Exams? ','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@19a30717eff543078a5d94ae9d6c18a5\",\"Lesson 1 - Getting Started\"]]]'),(157,'2020-04-06 20:48:45.112233','2020-04-06 20:48:45.112233','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@4e592689563243c484af947465eaef0d','New Unit','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations\",\"Lesson 2 - Let\'s Get Interactive!\"]]]'),(158,'2020-04-06 20:48:45.156594','2020-04-06 20:48:45.156594','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@fb6b62dbec4348528629cf2232b86aea','Instructor Programmed Responses','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@interactive_demonstrations\",\"Example Week 1: Getting Started\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions\",\"Homework - Question Styles\"]]]'),(159,'2020-04-06 20:48:45.201436','2020-04-06 20:48:45.201436','course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@vertical+block@8f89194410954e768bde1764985454a7','Molecule Structures','[[[\"block-v1:edX+DemoX+Demo_Course+type@chapter+block@graded_interactions\",\"Example Week 2: Get Interactive\"],[\"block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations\",\"Homework - Labs and Demos\"]]]');
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
INSERT INTO `bulk_email_courseemailtemplate` VALUES (1,'<!DOCTYPE html PUBLIC \'-//W3C//DTD XHTML 1.0 Transitional//EN\' \'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\'><html xmlns:fb=\'http://www.facebook.com/2008/fbml\' xmlns:og=\'http://opengraph.org/schema/\'> <head><meta property=\'og:title\' content=\'Update from {course_title}\'/><meta property=\'fb:page_id\' content=\'43929265776\' />        <meta http-equiv=\'Content-Type\' content=\'text/html; charset=UTF-8\'>        <title>Update from {course_title}</title>                    </head>        <body leftmargin=\'0\' marginwidth=\'0\' topmargin=\'0\' marginheight=\'0\' offset=\'0\' style=\'margin: 0;padding: 0;background-color: #ffffff;\'>        <center>            <table align=\'center\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' height=\'100%\' width=\'100%\' id=\'bodyTable\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;margin: 0;padding: 0;background-color: #ffffff;height: 100% !important;width: 100% !important;\'>                <tr>                   <td align=\'center\' valign=\'top\' id=\'bodyCell\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;margin: 0;padding: 0;border-top: 0;height: 100% !important;width: 100% !important;\'>                        <!-- BEGIN TEMPLATE // -->                        <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                            <tr>                                <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                    <!-- BEGIN PREHEADER // -->                                    <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' id=\'templatePreheader\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;background-color: #fcfcfc;border-top: 0;border-bottom: 0;\'>                                        <tr>                                        <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'templateContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                    <tr>                                                        <td valign=\'top\' class=\'preheaderContainer\' style=\'padding-top: 9px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'366\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-left: 18px;padding-bottom: 9px;padding-right: 0;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 11px;line-height: 125%;text-align: left;\'>                                                    <br>                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table></td>                                                    </tr>                                                </table>                                            </td>                                                                                    </tr>                                    </table>                                    <!-- // END PREHEADER -->                                </td>                            </tr>                            <tr>                                <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                    <!-- BEGIN HEADER // -->                                    <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' id=\'templateHeader\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;background-color: #fcfcfc;border-top: 0;border-bottom: 0;\'>                                        <tr>                                            <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'templateContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                    <tr>                                                        <td valign=\'top\' class=\'headerContainer\' style=\'padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnImageBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnImageBlockOuter\'>            <tr>                <td valign=\'top\' style=\'padding: 9px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\' class=\'mcnImageBlockInner\'>                    <table align=\'left\' width=\'100%\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' class=\'mcnImageContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                        <tbody><tr>                            <td class=\'mcnImageContent\' valign=\'top\' style=\'padding-right: 9px;padding-left: 9px;padding-top: 0;padding-bottom: 0;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                                    <a href=\'http://edx.org\' title=\'\' class=\'\' target=\'_self\' style=\'word-wrap: break-word !important;\'>                                        <img align=\'left\' alt=\'edX\' src=\'http://courses.edx.org/static/images/bulk_email/edXHeaderImage.jpg\' width=\'564.0000152587891\' style=\'max-width: 600px;padding-bottom: 0;display: inline !important;vertical-align: bottom;border: 0;line-height: 100%;outline: none;text-decoration: none;height: auto !important;\' class=\'mcnImage\'>                                    </a>                                                            </td>                        </tr>                    </tbody></table>                </td>            </tr>    </tbody></table><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'599\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 15px;line-height: 150%;text-align: left;\'>                                                    <div style=\'text-align: right;\'><span style=\'font-size:11px;\'><span style=\'color:#00a0e3;\'>Connect with edX:</span></span> &nbsp;<a href=\'http://facebook.com/edxonline\' target=\'_blank\' style=\'color: #6DC6DD;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/FacebookIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp;&nbsp;<a href=\'http://twitter.com/edxonline\' target=\'_blank\' style=\'color: #6DC6DD;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/TwitterIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp;&nbsp;<a href=\'https://plus.google.com/108235383044095082735\' target=\'_blank\' style=\'color: #6DC6DD;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/GooglePlusIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp;&nbsp;<a href=\'http://www.meetup.com/edX-Communities/\' target=\'_blank\' style=\'color: #6DC6DD;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/MeetupIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a></div>                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table></td>                                                    </tr>                                                </table>                                            </td>                                        </tr>                                    </table>                                    <!-- // END HEADER -->                                </td>                            </tr>                            <tr>                                <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                    <!-- BEGIN BODY // -->                                    <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' id=\'templateBody\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;background-color: #fcfcfc;border-top: 0;border-bottom: 0;\'>                                        <tr>                                            <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'templateContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                    <tr>                                                        <td valign=\'top\' class=\'bodyContainer\' style=\'padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnCaptionBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnCaptionBlockOuter\'>        <tr>            <td class=\'mcnCaptionBlockInner\' valign=\'top\' style=\'padding: 9px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' class=\'mcnCaptionLeftContentOuter\' width=\'100%\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody><tr>        <td valign=\'top\' class=\'mcnCaptionLeftContentInner\' style=\'padding: 0 9px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>            <table align=\'right\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' class=\'mcnCaptionLeftImageContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                <tbody><tr>                    <td class=\'mcnCaptionLeftImageContent\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                                    <img alt=\'\' src=\'{course_image_url}\' width=\'176\' style=\'max-width: 180px;border: 0;line-height: 100%;outline: none;text-decoration: none;vertical-align: bottom;height: auto !important;\' class=\'mcnImage\'>                                                                </td>                </tr>            </tbody></table>            <table class=\'mcnCaptionLeftTextContentContainer\' align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'352\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                <tbody><tr>                    <td valign=\'top\' class=\'mcnTextContent\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 14px;line-height: 150%;text-align: left;\'>                        <h3 class=\'null\' style=\'display: block;font-family: Helvetica;font-size: 18px;font-style: normal;font-weight: bold;line-height: 125%;letter-spacing: -.5px;margin: 0;text-align: left;color: #606060 !important;\'><strong style=\'font-size: 22px;\'>{course_title}</strong><br></h3><br>                    </td>                </tr>            </tbody></table>        </td>    </tr></tbody></table>            </td>        </tr>    </tbody></table><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 14px;line-height: 150%;text-align: left;\'>                        {{message_body}}                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnDividerBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnDividerBlockOuter\'>        <tr>            <td class=\'mcnDividerBlockInner\' style=\'padding: 18px 18px 3px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                <table class=\'mcnDividerContent\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' style=\'border-top-width: 1px;border-top-style: solid;border-top-color: #666666;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                        <td style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                            <span></span>                        </td>                    </tr>                </tbody></table>            </td>        </tr>    </tbody></table><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 14px;line-height: 150%;text-align: left;\'>                                                    <div style=\'text-align: right;\'><a href=\'http://facebook.com/edxonline\' target=\'_blank\' style=\'color: #2f73bc;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/FacebookIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp;&nbsp;<a href=\'http://twitter.com/edxonline\' target=\'_blank\' style=\'color: #2f73bc;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/TwitterIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp;&nbsp;<a href=\'https://plus.google.com/108235383044095082735\' target=\'_blank\' style=\'color: #2f73bc;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/GooglePlusIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp; &nbsp;<a href=\'http://www.meetup.com/edX-Communities/\' target=\'_blank\' style=\'color: #2f73bc;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/MeetupIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a></div>                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table></td>                                                    </tr>                                                </table>                                            </td>                                        </tr>                                    </table>                                    <!-- // END BODY -->                                </td>                            </tr>                            <tr>                                <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                    <!-- BEGIN FOOTER // -->                                    <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' id=\'templateFooter\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;background-color: #9FCFE8;border-top: 0;border-bottom: 0;\'>                                        <tr>                                            <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'templateContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                    <tr>                                                        <td valign=\'top\' class=\'footerContainer\' style=\'padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #f2f2f2;font-family: Helvetica;font-size: 11px;line-height: 125%;text-align: left;\'>                                                    <em>Copyright © 2013 edX, All rights reserved.</em><br><br><br>  <b>Our mailing address is:</b><br>  edX<br>  11 Cambridge Center, Suite 101<br>  Cambridge, MA, USA 02142<br><br><br>This email was automatically sent from {platform_name}. <br>You are receiving this email at address {email} because you are enrolled in <a href=\'{course_url}\'>{course_title}</a>.<br>To stop receiving email like this, update your course email settings <a href=\'{email_settings_url}\'>here</a>. <br><br><a href=\'{unsubscribe_link}\'>unsubscribe</a>                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table></td>                                                    </tr>                                                </table>                                            </td>                                        </tr>                                    </table>                                    <!-- // END FOOTER -->                                </td>                            </tr>                        </table>                        <!-- // END TEMPLATE -->                    </td>                </tr>            </table>        </center>    </body>    </body> </html>','{course_title}\n\n{{message_body}}\r\n----\r\nCopyright 2013 edX, All rights reserved.\r\n----\r\nConnect with edX:\r\nFacebook (http://facebook.com/edxonline)\r\nTwitter (http://twitter.com/edxonline)\r\nGoogle+ (https://plus.google.com/108235383044095082735)\r\nMeetup (http://www.meetup.com/edX-Communities/)\r\n----\r\nThis email was automatically sent from {platform_name}.\r\nYou are receiving this email at address {email} because you are enrolled in {course_title}\r\n(URL: {course_url} ).\r\nTo stop receiving email like this, update your course email settings at {email_settings_url}.\r\n{unsubscribe_link}\r\n',NULL),(2,'<!DOCTYPE html PUBLIC \'-//W3C//DTD XHTML 1.0 Transitional//EN\' \'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\'><html xmlns:fb=\'http://www.facebook.com/2008/fbml\' xmlns:og=\'http://opengraph.org/schema/\'> <head><meta property=\'og:title\' content=\'Update from {course_title}\'/><meta property=\'fb:page_id\' content=\'43929265776\' />        <meta http-equiv=\'Content-Type\' content=\'text/html; charset=UTF-8\'>        THIS IS A BRANDED HTML TEMPLATE <title>Update from {course_title}</title>                    </head>        <body leftmargin=\'0\' marginwidth=\'0\' topmargin=\'0\' marginheight=\'0\' offset=\'0\' style=\'margin: 0;padding: 0;background-color: #ffffff;\'>        <center>            <table align=\'center\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' height=\'100%\' width=\'100%\' id=\'bodyTable\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;margin: 0;padding: 0;background-color: #ffffff;height: 100% !important;width: 100% !important;\'>                <tr>                   <td align=\'center\' valign=\'top\' id=\'bodyCell\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;margin: 0;padding: 0;border-top: 0;height: 100% !important;width: 100% !important;\'>                        <!-- BEGIN TEMPLATE // -->                        <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                            <tr>                                <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                    <!-- BEGIN PREHEADER // -->                                    <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' id=\'templatePreheader\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;background-color: #fcfcfc;border-top: 0;border-bottom: 0;\'>                                        <tr>                                        <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'templateContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                    <tr>                                                        <td valign=\'top\' class=\'preheaderContainer\' style=\'padding-top: 9px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'366\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-left: 18px;padding-bottom: 9px;padding-right: 0;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 11px;line-height: 125%;text-align: left;\'>                                                    <br>                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table></td>                                                    </tr>                                                </table>                                            </td>                                                                                    </tr>                                    </table>                                    <!-- // END PREHEADER -->                                </td>                            </tr>                            <tr>                                <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                    <!-- BEGIN HEADER // -->                                    <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' id=\'templateHeader\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;background-color: #fcfcfc;border-top: 0;border-bottom: 0;\'>                                        <tr>                                            <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'templateContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                    <tr>                                                        <td valign=\'top\' class=\'headerContainer\' style=\'padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnImageBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnImageBlockOuter\'>            <tr>                <td valign=\'top\' style=\'padding: 9px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\' class=\'mcnImageBlockInner\'>                    <table align=\'left\' width=\'100%\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' class=\'mcnImageContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                        <tbody><tr>                            <td class=\'mcnImageContent\' valign=\'top\' style=\'padding-right: 9px;padding-left: 9px;padding-top: 0;padding-bottom: 0;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                                    <a href=\'http://edx.org\' title=\'\' class=\'\' target=\'_self\' style=\'word-wrap: break-word !important;\'>                                        <img align=\'left\' alt=\'edX\' src=\'http://courses.edx.org/static/images/bulk_email/edXHeaderImage.jpg\' width=\'564.0000152587891\' style=\'max-width: 600px;padding-bottom: 0;display: inline !important;vertical-align: bottom;border: 0;line-height: 100%;outline: none;text-decoration: none;height: auto !important;\' class=\'mcnImage\'>                                    </a>                                                            </td>                        </tr>                    </tbody></table>                </td>            </tr>    </tbody></table><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'599\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 15px;line-height: 150%;text-align: left;\'>                                                    <div style=\'text-align: right;\'><span style=\'font-size:11px;\'><span style=\'color:#00a0e3;\'>Connect with edX:</span></span> &nbsp;<a href=\'http://facebook.com/edxonline\' target=\'_blank\' style=\'color: #6DC6DD;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/FacebookIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp;&nbsp;<a href=\'http://twitter.com/edxonline\' target=\'_blank\' style=\'color: #6DC6DD;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/TwitterIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp;&nbsp;<a href=\'https://plus.google.com/108235383044095082735\' target=\'_blank\' style=\'color: #6DC6DD;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/GooglePlusIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp;&nbsp;<a href=\'http://www.meetup.com/edX-Communities/\' target=\'_blank\' style=\'color: #6DC6DD;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/MeetupIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a></div>                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table></td>                                                    </tr>                                                </table>                                            </td>                                        </tr>                                    </table>                                    <!-- // END HEADER -->                                </td>                            </tr>                            <tr>                                <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                    <!-- BEGIN BODY // -->                                    <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' id=\'templateBody\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;background-color: #fcfcfc;border-top: 0;border-bottom: 0;\'>                                        <tr>                                            <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'templateContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                    <tr>                                                        <td valign=\'top\' class=\'bodyContainer\' style=\'padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnCaptionBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnCaptionBlockOuter\'>        <tr>            <td class=\'mcnCaptionBlockInner\' valign=\'top\' style=\'padding: 9px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' class=\'mcnCaptionLeftContentOuter\' width=\'100%\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody><tr>        <td valign=\'top\' class=\'mcnCaptionLeftContentInner\' style=\'padding: 0 9px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>            <table align=\'right\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' class=\'mcnCaptionLeftImageContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                <tbody><tr>                    <td class=\'mcnCaptionLeftImageContent\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                                    <img alt=\'\' src=\'{course_image_url}\' width=\'176\' style=\'max-width: 180px;border: 0;line-height: 100%;outline: none;text-decoration: none;vertical-align: bottom;height: auto !important;\' class=\'mcnImage\'>                                                                </td>                </tr>            </tbody></table>            <table class=\'mcnCaptionLeftTextContentContainer\' align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'352\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                <tbody><tr>                    <td valign=\'top\' class=\'mcnTextContent\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 14px;line-height: 150%;text-align: left;\'>                        <h3 class=\'null\' style=\'display: block;font-family: Helvetica;font-size: 18px;font-style: normal;font-weight: bold;line-height: 125%;letter-spacing: -.5px;margin: 0;text-align: left;color: #606060 !important;\'><strong style=\'font-size: 22px;\'>{course_title}</strong><br></h3><br>                    </td>                </tr>            </tbody></table>        </td>    </tr></tbody></table>            </td>        </tr>    </tbody></table><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 14px;line-height: 150%;text-align: left;\'>                        {{message_body}}                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnDividerBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnDividerBlockOuter\'>        <tr>            <td class=\'mcnDividerBlockInner\' style=\'padding: 18px 18px 3px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                <table class=\'mcnDividerContent\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' style=\'border-top-width: 1px;border-top-style: solid;border-top-color: #666666;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                        <td style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                            <span></span>                        </td>                    </tr>                </tbody></table>            </td>        </tr>    </tbody></table><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #606060;font-family: Helvetica;font-size: 14px;line-height: 150%;text-align: left;\'>                                                    <div style=\'text-align: right;\'><a href=\'http://facebook.com/edxonline\' target=\'_blank\' style=\'color: #2f73bc;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/FacebookIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp;&nbsp;<a href=\'http://twitter.com/edxonline\' target=\'_blank\' style=\'color: #2f73bc;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/TwitterIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp;&nbsp;<a href=\'https://plus.google.com/108235383044095082735\' target=\'_blank\' style=\'color: #2f73bc;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/GooglePlusIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a>&nbsp; &nbsp;<a href=\'http://www.meetup.com/edX-Communities/\' target=\'_blank\' style=\'color: #2f73bc;font-weight: normal;text-decoration: underline;word-wrap: break-word !important;\'><img align=\'none\' height=\'16\' src=\'http://courses.edx.org/static/images/bulk_email/MeetupIcon.png\' style=\'width: 16px;height: 16px;border: 0;line-height: 100%;outline: none;text-decoration: none;\' width=\'16\'></a></div>                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table></td>                                                    </tr>                                                </table>                                            </td>                                        </tr>                                    </table>                                    <!-- // END BODY -->                                </td>                            </tr>                            <tr>                                <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                    <!-- BEGIN FOOTER // -->                                    <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' id=\'templateFooter\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;background-color: #9FCFE8;border-top: 0;border-bottom: 0;\'>                                        <tr>                                            <td align=\'center\' valign=\'top\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'templateContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                                    <tr>                                                        <td valign=\'top\' class=\'footerContainer\' style=\'padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' class=\'mcnTextBlock\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>    <tbody class=\'mcnTextBlockOuter\'>        <tr>            <td valign=\'top\' class=\'mcnTextBlockInner\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                                <table align=\'left\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'600\' class=\'mcnTextContentContainer\' style=\'border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;\'>                    <tbody><tr>                                                <td valign=\'top\' class=\'mcnTextContent\' style=\'padding-top: 9px;padding-right: 18px;padding-bottom: 9px;padding-left: 18px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;color: #f2f2f2;font-family: Helvetica;font-size: 11px;line-height: 125%;text-align: left;\'>                                                    <em>Copyright © 2013 edX, All rights reserved.</em><br><br><br>  <b>Our mailing address is:</b><br>  edX<br>  11 Cambridge Center, Suite 101<br>  Cambridge, MA, USA 02142<br><br><br>This email was automatically sent from {platform_name}. <br>You are receiving this email at address {email} because you are enrolled in <a href=\'{course_url}\'>{course_title}</a>.<br>To stop receiving email like this, update your course email settings <a href=\'{email_settings_url}\'>here</a>. <br><br><a href=\'{unsubscribe_link}\'>unsubscribe</a>                        </td>                    </tr>                </tbody></table>                            </td>        </tr>    </tbody></table></td>                                                    </tr>                                                </table>                                            </td>                                        </tr>                                    </table>                                    <!-- // END FOOTER -->                                </td>                            </tr>                        </table>                        <!-- // END TEMPLATE -->                    </td>                </tr>            </table>        </center>    </body>    </body> </html>','THIS IS A BRANDED TEXT TEMPLATE. {course_title}\n\n{{message_body}}\r\n----\r\nCopyright 2013 edX, All rights reserved.\r\n----\r\nConnect with edX:\r\nFacebook (http://facebook.com/edxonline)\r\nTwitter (http://twitter.com/edxonline)\r\nGoogle+ (https://plus.google.com/108235383044095082735)\r\nMeetup (http://www.meetup.com/edX-Communities/)\r\n----\r\nThis email was automatically sent from {platform_name}.\r\nYou are receiving this email at address {email} because you are enrolled in {course_title}\r\n(URL: {course_url} ).\r\nTo stop receiving email like this, update your course email settings at {email_settings_url}.\r\n{unsubscribe_link}\r\n','branded.template');
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
INSERT INTO `catalog_catalogintegration` VALUES (1,'2020-04-06 21:00:10.967860',1,'https://example.com/api',0,NULL,'discovery_worker',100,86400);
/*!40000 ALTER TABLE `catalog_catalogintegration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celery_taskmeta`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `celery_taskmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `result` longtext,
  `date_done` datetime(6) NOT NULL,
  `traceback` longtext,
  `hidden` tinyint(1) NOT NULL,
  `meta` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `celery_taskmeta_hidden_23fd02dc` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celery_taskmeta`
--

LOCK TABLES `celery_taskmeta` WRITE;
/*!40000 ALTER TABLE `celery_taskmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `celery_taskmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celery_tasksetmeta`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `celery_tasksetmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskset_id` varchar(255) NOT NULL,
  `result` longtext NOT NULL,
  `date_done` datetime(6) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskset_id` (`taskset_id`),
  KEY `celery_tasksetmeta_hidden_593cfc24` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celery_tasksetmeta`
--

LOCK TABLES `celery_tasksetmeta` WRITE;
/*!40000 ALTER TABLE `celery_tasksetmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `celery_tasksetmeta` ENABLE KEYS */;
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
INSERT INTO `certificates_certificatehtmlviewconfiguration` VALUES (1,'2020-04-06 20:20:14.328691',0,'{\"default\": {\"logo_url\": \"http://www.example.com\", \"accomplishment_class_append\": \"accomplishment-certificate\", \"logo_src\": \"/static/certificates/images/logo.png\", \"company_tos_url\": \"http://www.example.com/terms-service\", \"platform_name\": \"Your Platform Name Here\", \"company_privacy_url\": \"http://www.example.com/privacy-policy\", \"company_verified_certificate_url\": \"http://www.example.com/verified-certificate\", \"company_about_url\": \"http://www.example.com/about-us\"}, \"honor\": {\"certificate_type\": \"Honor Code\", \"certificate_title\": \"Certificate of Achievement\"}, \"verified\": {\"certificate_type\": \"Verified\", \"certificate_title\": \"Verified Certificate of Achievement\"}}',NULL);
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
-- Table structure for table `certificates_certificatewhitelist`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates_certificatewhitelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `whitelist` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `notes` longtext,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `certificates_certifi_user_id_c2ab1b7c_fk_auth_user` (`user_id`),
  CONSTRAINT `certificates_certifi_user_id_c2ab1b7c_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates_certificatewhitelist`
--

LOCK TABLES `certificates_certificatewhitelist` WRITE;
/*!40000 ALTER TABLE `certificates_certificatewhitelist` DISABLE KEYS */;
INSERT INTO `certificates_certificatewhitelist` VALUES (1,'course-v1:edX+DemoX+Demo_Course',1,'2020-04-06 20:50:11.912913',NULL,5),(2,'course-v1:edX+DemoX+Demo_Course',1,'2020-04-06 20:50:20.768200',NULL,6),(3,'course-v1:edX+DemoX+Demo_Course',1,'2020-04-06 20:50:29.708019',NULL,7);
/*!40000 ALTER TABLE `certificates_certificatewhitelist` ENABLE KEYS */;
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
INSERT INTO `commerce_commerceconfiguration` VALUES (1,'2020-04-06 20:46:37.899830',1,1,NULL,0,'/checkout/receipt/?order_number=',1,'/basket/add/');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_modes_coursemode`
--

LOCK TABLES `course_modes_coursemode` WRITE;
/*!40000 ALTER TABLE `course_modes_coursemode` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_modes_historicalcoursemode`
--

LOCK TABLES `course_modes_historicalcoursemode` WRITE;
/*!40000 ALTER TABLE `course_modes_historicalcoursemode` DISABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_overviews_courseoverview`
--

LOCK TABLES `course_overviews_courseoverview` WRITE;
/*!40000 ALTER TABLE `course_overviews_courseoverview` DISABLE KEYS */;
INSERT INTO `course_overviews_courseoverview` VALUES ('2020-04-06 20:48:22.651117','2020-04-06 20:48:43.065553',9,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@course+block@course','Demonstration Course','DemoX','edX','2013-02-05 05:00:00.000000',NULL,NULL,'/asset-v1:edX+DemoX+Demo_Course+type@asset+block@images_course_image.jpg',NULL,NULL,'end',0,1,0,'','',0.60,NULL,0,0,'[]',NULL,NULL,NULL,0,NULL,NULL,'both',NULL,NULL,NULL,'edX',0,NULL,1,NULL,NULL,NULL,NULL);
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
  PRIMARY KEY (`id`),
  KEY `course_overviews_cou_course_overview_id_71fa6321_fk_course_ov` (`course_overview_id`),
  CONSTRAINT `course_overviews_cou_course_overview_id_71fa6321_fk_course_ov` FOREIGN KEY (`course_overview_id`) REFERENCES `course_overviews_courseoverview` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_overviews_courseoverviewtab`
--

LOCK TABLES `course_overviews_courseoverviewtab` WRITE;
/*!40000 ALTER TABLE `course_overviews_courseoverviewtab` DISABLE KEYS */;
INSERT INTO `course_overviews_courseoverviewtab` VALUES (14,'info','course-v1:edX+DemoX+Demo_Course',0,'Home','course_info',NULL),(15,'courseware','course-v1:edX+DemoX+Demo_Course',0,'Course','courseware',NULL),(16,'discussion','course-v1:edX+DemoX+Demo_Course',0,'Discussion','discussion','tab/discussion'),(17,'wiki','course-v1:edX+DemoX+Demo_Course',0,'Wiki','wiki',NULL),(18,'textbooks','course-v1:edX+DemoX+Demo_Course',0,'Textbooks','textbooks',NULL),(19,'progress','course-v1:edX+DemoX+Demo_Course',0,'Progress','progress',NULL);
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
INSERT INTO `course_overviews_historicalcourseoverview` VALUES ('2020-04-06 20:48:22.651117','2020-04-06 20:48:22.651117',9,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@course+block@course','edX','Empty','DemoX','edX','2030-01-01 00:00:00.000000',NULL,NULL,NULL,'/asset-v1:edX+DemoX+Demo_Course+type@asset+block@images_course_image.jpg',NULL,NULL,'end',0,1,0,'','',NULL,0.50,NULL,0,0,'[]',NULL,NULL,NULL,0,NULL,'both',NULL,NULL,NULL,0,NULL,1,NULL,1,'2020-04-06 20:48:22.676151',NULL,'+',NULL,NULL,NULL),('2020-04-06 20:48:22.651117','2020-04-06 20:48:22.651117',9,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@course+block@course','edX','Demonstration Course','DemoX','edX','2013-02-05 05:00:00.000000',NULL,NULL,NULL,'/asset-v1:edX+DemoX+Demo_Course+type@asset+block@images_course_image.jpg',NULL,NULL,'end',0,1,0,'','',NULL,0.60,NULL,0,0,'[]',NULL,NULL,NULL,0,NULL,'both',NULL,NULL,NULL,0,NULL,1,NULL,2,'2020-04-06 20:48:31.635730',NULL,'~',NULL,NULL,NULL),('2020-04-06 20:48:22.651117','2020-04-06 20:48:22.651117',9,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@course+block@course','edX','Demonstration Course','DemoX','edX','2013-02-05 05:00:00.000000',NULL,NULL,NULL,'/asset-v1:edX+DemoX+Demo_Course+type@asset+block@images_course_image.jpg',NULL,NULL,'end',0,1,0,'','',NULL,0.60,NULL,0,0,'[]',NULL,NULL,NULL,0,NULL,'both',NULL,NULL,NULL,0,NULL,1,NULL,3,'2020-04-06 20:48:43.067200',NULL,'~',NULL,NULL,NULL);
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
  KEY `courseware_studentmodule_modified_f6a0b0cc` (`modified`)
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
INSERT INTO `dark_lang_darklangconfig` VALUES (1,'2020-04-06 20:26:23.035397',1,'',NULL,'',0);
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
INSERT INTO `django_comment_common_discussionsidmapping` VALUES ('course-v1:edX+DemoX+Demo_Course','{\"0717ec26e67e49b2a9f30d2e15c417dd\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@4aba537a78774bd5a862485a8563c345\",\"ed3164d1235645739374094a8172964b\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@870371212ba04dcf9536d7c7b8f3109e\",\"8ff02d4204bb42059db629e399a50a26\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@1c8d47c425724346a7968fa1bc745dcd\",\"e252d4de97c7426e8b67ff516a9962f6\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@b8cec2a19ebf463f90cd3544c7927b0e\",\"4250393f9f684bfeb3f1d514e15592d1\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@ffa5817d49e14fec83ad6187cbe16358\",\"97f19f6202e54d6a9ea59f7a573725a1\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@cd177caa62444fbca48aa8f843f09eac\",\"a56e406f164746d8bbff76545e6d981f\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@23e6eda482c04335af2bb265beacaf59\",\"bb15269287ec44b6a2f69447db43d845\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@0aa7a3bdbe18427795b0c1a1d7c3cb9a\",\"aecab8f355744782af5a9470185f0005\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@5ab88e67d46049b9aa694cb240c39cef\",\"edx_demo_embedded_discussion\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@discussion_5deb6081620d\",\"6e51dd8f181b44ffa6d91303a287ed3f\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@12ad4f3ff4c14114a6e629b00e000976\",\"265ca2d808814d76ad670957a2b6071f\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@e2cb0e0994f84b0abfa5f4ae42ed9d44\",\"23347cb1d1e74ec79453ce361e38eb18\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@3169f89efde2452993f2f2d9bc74f5b2\",\"b770140a122741fea651a50362dee7e6\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@4d672c5893cb4f1dad0de67d2008522e\",\"d9f970a42067413cbb633f81cfb12604\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@412dc8dbb6674014862237b23c1f643f\",\"9ad16580878f49d1bf20ce1bc533d16e\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@e0d7423118ab432582d03e8e8dad8e36\",\"53c486b035b4437c9197a543371e0f03\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@6244918637ed4ff4b5f94a840a7e4b43\",\"239ef52e6eee468fb698b4217a7bafc6\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@c6cd4bea43454aaea60ad01beb0cf213\",\"d459fcb5792b459ca0aefe141e633ccc\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@ddede76df71045ffa16de9d1481d2119\",\"e4365aad2c39498d824cf984b3f9b083\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@ed01bcd164e64038a78964a16eac3edc\",\"df0905ee484844769644f330844253e7\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@f480df4ce91347c5ae4301ddf6146238\",\"b11488e3580241f08146cbcfca693d06\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@03f051f9a8814881a3783d2511613aa6\",\"c49f0dfb8fc94c9c8d9999cc95190c56\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@501aed9d902349eeb2191fa505548de2\",\"31c83aefa6634e83a3c80b81f5447201\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@ade92343df3d4953a40ab3adc8805390\",\"1d153da210844719a1a6cc39ca09673c\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@9f9e1373cc8243b985c8750cc8acec7d\",\"ba12c2e0b81e4cef8e05e22049aafd63\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@1a810b1a3b2447b998f0917d0e5a802b\",\"cba3e4cd91d0466b9ac50926e495b76f\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@67c26b1e826e47aaa29757f62bcd1ad0\",\"d7b66e45154b4af18f33213337685e91\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@6f7a6670f87147149caeff6afa07a526\",\"cdad92273f7d4622aed770b7de8583bc\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@4f06b358a96f4d1dae57d6d81acd06f2\",\"eb264c9899b745fc81cd7405b53a7a65\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@e5eac7e1a5a24f5fa7ed77bb6d136591\",\"98d8feb5971041a085512ae22b398613\":\"block-v1:edX+DemoX+Demo_Course+type@discussion+block@722085be27c84ac693cfebc8ac5da700\"}');
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
INSERT INTO `django_comment_common_forumsconfig` VALUES (1,'2020-04-06 20:27:01.567246',1,5,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=400 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (141,'admin','logentry'),(370,'announcements','announcement'),(277,'api_admin','apiaccessconfig'),(1,'api_admin','apiaccessrequest'),(278,'api_admin','catalog'),(224,'assessment','assessment'),(220,'assessment','assessmentfeedback'),(231,'assessment','assessmentfeedbackoption'),(225,'assessment','assessmentpart'),(227,'assessment','criterion'),(216,'assessment','criterionoption'),(222,'assessment','historicalsharedfileupload'),(217,'assessment','peerworkflow'),(228,'assessment','peerworkflowitem'),(221,'assessment','rubric'),(226,'assessment','sharedfileupload'),(218,'assessment','staffworkflow'),(230,'assessment','studenttrainingworkflow'),(219,'assessment','studenttrainingworkflowitem'),(223,'assessment','teamstaffworkflow'),(229,'assessment','trainingexample'),(2,'auth','group'),(4,'auth','permission'),(3,'auth','user'),(281,'badges','badgeassertion'),(283,'badges','badgeclass'),(282,'badges','coursecompleteimageconfiguration'),(284,'badges','courseeventbadgesconfiguration'),(252,'block_structure','blockstructureconfiguration'),(251,'block_structure','blockstructuremodel'),(369,'bookmarks','bookmark'),(368,'bookmarks','xblockcache'),(112,'branding','brandingapiconfig'),(113,'branding','brandinginfoconfig'),(108,'bulk_email','bulkemailflag'),(111,'bulk_email','cohorttarget'),(106,'bulk_email','courseauthorization'),(105,'bulk_email','courseemail'),(107,'bulk_email','courseemailtemplate'),(110,'bulk_email','coursemodetarget'),(104,'bulk_email','optout'),(109,'bulk_email','target'),(388,'bulk_grades','scoreoverrider'),(290,'calendar_sync','historicalusercalendarsyncconfig'),(291,'calendar_sync','usercalendarsyncconfig'),(269,'catalog','catalogintegration'),(286,'celery_utils','failedtask'),(90,'certificates','certificategenerationconfiguration'),(84,'certificates','certificategenerationcoursesetting'),(95,'certificates','certificategenerationhistory'),(88,'certificates','certificatehtmlviewconfiguration'),(94,'certificates','certificateinvalidation'),(92,'certificates','certificatetemplate'),(87,'certificates','certificatetemplateasset'),(89,'certificates','certificatewhitelist'),(85,'certificates','examplecertificate'),(91,'certificates','examplecertificateset'),(93,'certificates','generatedcertificate'),(86,'certificates','historicalgeneratedcertificate'),(254,'commerce','commerceconfiguration'),(387,'completion','blockcompletion'),(335,'consent','datasharingconsent'),(336,'consent','datasharingconsenttextoverrides'),(334,'consent','historicaldatasharingconsent'),(25,'contentserver','cdnuseragentsconfig'),(24,'contentserver','courseassetcachettlconfig'),(392,'contentstore','videouploadconfig'),(5,'contenttypes','contenttype'),(371,'content_libraries','contentlibrary'),(372,'content_libraries','contentlibrarypermission'),(293,'content_type_gating','contenttypegatingconfig'),(346,'cornerstone','cornerstoneenterprisecustomerconfiguration'),(347,'cornerstone','cornerstoneglobalconfiguration'),(348,'cornerstone','cornerstonelearnerdatatransmissionaudit'),(349,'cornerstone','historicalcornerstoneenterprisecustomerconfiguration'),(253,'cors_csrf','xdomainproxyconfiguration'),(40,'courseware','coursedynamicupgradedeadlineconfiguration'),(48,'courseware','dynamicupgradedeadlineconfiguration'),(41,'courseware','offlinecomputedgrade'),(49,'courseware','offlinecomputedgradelog'),(44,'courseware','orgdynamicupgradedeadlineconfiguration'),(43,'courseware','studentfieldoverride'),(47,'courseware','studentmodule'),(45,'courseware','studentmodulehistory'),(50,'courseware','xmodulestudentinfofield'),(46,'courseware','xmodulestudentprefsfield'),(42,'courseware','xmoduleuserstatesummaryfield'),(51,'coursewarehistoryextended','studentmodulehistoryextended'),(196,'course_action_state','coursererunstate'),(393,'course_creators','coursecreator'),(299,'course_date_signals','selfpacedrelativedatesconfig'),(292,'course_duration_limits','coursedurationlimitconfig'),(289,'course_goals','coursegoal'),(98,'course_groups','cohortmembership'),(99,'course_groups','coursecohort'),(102,'course_groups','coursecohortssettings'),(100,'course_groups','courseusergroup'),(103,'course_groups','courseusergrouppartitiongroup'),(101,'course_groups','unregisteredlearnercohortassignments'),(174,'course_modes','coursemode'),(176,'course_modes','coursemodeexpirationconfig'),(173,'course_modes','coursemodesarchive'),(175,'course_modes','historicalcoursemode'),(249,'course_overviews','courseoverview'),(247,'course_overviews','courseoverviewimageconfig'),(246,'course_overviews','courseoverviewimageset'),(248,'course_overviews','courseoverviewtab'),(245,'course_overviews','historicalcourseoverview'),(250,'course_overviews','simulatecoursepublishconfig'),(287,'crawlers','crawlersconfig'),(352,'credentials','credentialsapiconfig'),(353,'credentials','notifycredentialsconfig'),(256,'credit','creditconfig'),(258,'credit','creditcourse'),(259,'credit','crediteligibility'),(255,'credit','creditprovider'),(260,'credit','creditrequest'),(261,'credit','creditrequirement'),(257,'credit','creditrequirementstatus'),(187,'dark_lang','darklangconfig'),(340,'degreed','degreedenterprisecustomerconfiguration'),(339,'degreed','degreedglobalconfiguration'),(342,'degreed','degreedlearnerdatatransmissionaudit'),(341,'degreed','historicaldegreedenterprisecustomerconfiguration'),(294,'discounts','discountpercentageconfig'),(295,'discounts','discountrestrictionconfig'),(145,'django_comment_common','coursediscussionsettings'),(146,'django_comment_common','discussionsidmapping'),(143,'django_comment_common','forumsconfig'),(142,'django_comment_common','permission'),(144,'django_comment_common','role'),(137,'django_notify','notification'),(140,'django_notify','notificationtype'),(138,'django_notify','settings'),(139,'django_notify','subscription'),(10,'djcelery','crontabschedule'),(15,'djcelery','intervalschedule'),(11,'djcelery','periodictask'),(13,'djcelery','periodictasks'),(16,'djcelery','taskmeta'),(9,'djcelery','tasksetmeta'),(12,'djcelery','taskstate'),(14,'djcelery','workerstate'),(237,'edxval','coursevideo'),(236,'edxval','encodedvideo'),(238,'edxval','profile'),(243,'edxval','thirdpartytranscriptcredentialsstate'),(244,'edxval','transcriptcredentials'),(241,'edxval','transcriptpreference'),(240,'edxval','video'),(242,'edxval','videoimage'),(239,'edxval','videotranscript'),(378,'edx_proctoring','proctoredexam'),(383,'edx_proctoring','proctoredexamreviewpolicy'),(384,'edx_proctoring','proctoredexamreviewpolicyhistory'),(386,'edx_proctoring','proctoredexamsoftwaresecurecomment'),(382,'edx_proctoring','proctoredexamsoftwaresecurereview'),(385,'edx_proctoring','proctoredexamsoftwaresecurereviewhistory'),(380,'edx_proctoring','proctoredexamstudentallowance'),(381,'edx_proctoring','proctoredexamstudentallowancehistory'),(379,'edx_proctoring','proctoredexamstudentattempt'),(377,'edx_proctoring','proctoredexamstudentattempthistory'),(374,'edx_when','contentdate'),(376,'edx_when','datepolicy'),(375,'edx_when','userdate'),(389,'edx_zoom','launchlog'),(390,'edx_zoom','lticredential'),(285,'email_marketing','emailmarketingconfiguration'),(190,'embargo','country'),(191,'embargo','countryaccessrule'),(192,'embargo','courseaccessrulehistory'),(189,'embargo','embargoedcourse'),(195,'embargo','embargoedstate'),(193,'embargo','ipfilter'),(194,'embargo','restrictedcourse'),(328,'enterprise','enrollmentnotificationemailtemplate'),(322,'enterprise','enterprisecatalogquery'),(313,'enterprise','enterprisecourseenrollment'),(316,'enterprise','enterprisecustomer'),(330,'enterprise','enterprisecustomerbrandingconfiguration'),(327,'enterprise','enterprisecustomercatalog'),(317,'enterprise','enterprisecustomeridentityprovider'),(320,'enterprise','enterprisecustomerreportingconfiguration'),(318,'enterprise','enterprisecustomertype'),(329,'enterprise','enterprisecustomeruser'),(331,'enterprise','enterpriseenrollmentsource'),(314,'enterprise','enterprisefeaturerole'),(325,'enterprise','enterprisefeatureuserroleassignment'),(332,'enterprise','historicalenrollmentnotificationemailtemplate'),(311,'enterprise','historicalenterprisecourseenrollment'),(326,'enterprise','historicalenterprisecustomer'),(323,'enterprise','historicalenterprisecustomercatalog'),(319,'enterprise','historicalpendingenrollment'),(315,'enterprise','historicalpendingenterprisecustomeruser'),(333,'enterprise','pendingenrollment'),(324,'enterprise','pendingenterprisecustomeruser'),(312,'enterprise','systemwideenterpriserole'),(321,'enterprise','systemwideenterpriseuserroleassignment'),(177,'entitlements','courseentitlement'),(178,'entitlements','courseentitlementpolicy'),(180,'entitlements','courseentitlementsupportdetail'),(181,'entitlements','historicalcourseentitlement'),(179,'entitlements','historicalcourseentitlementsupportdetail'),(297,'experiments','experimentdata'),(298,'experiments','experimentkeyvalue'),(296,'experiments','historicalexperimentkeyvalue'),(301,'external_user_ids','externalid'),(303,'external_user_ids','externalidtype'),(300,'external_user_ids','historicalexternalid'),(302,'external_user_ids','historicalexternalidtype'),(357,'grades','computegradessetting'),(359,'grades','coursepersistentgradesflag'),(354,'grades','historicalpersistentsubsectiongradeoverride'),(361,'grades','persistentcoursegrade'),(356,'grades','persistentgradesenabledflag'),(360,'grades','persistentsubsectiongrade'),(355,'grades','persistentsubsectiongradeoverride'),(358,'grades','visibleblocks'),(97,'instructor_task','gradereportsetting'),(96,'instructor_task','instructortask'),(337,'integrated_channel','contentmetadataitemtransmission'),(338,'integrated_channel','learnerdatatransmissionaudit'),(207,'lms_xblock','xblockasidesconfig'),(391,'lx_pathway_plugin','pathway'),(276,'milestones','coursecontentmilestone'),(274,'milestones','coursemilestone'),(273,'milestones','milestone'),(275,'milestones','milestonerelationshiptype'),(272,'milestones','usermilestone'),(198,'mobile_api','appversionconfig'),(197,'mobile_api','ignoremobileavailableflagconfig'),(199,'mobile_api','mobileapiconfig'),(115,'oauth2_provider','accesstoken'),(116,'oauth2_provider','application'),(114,'oauth2_provider','grant'),(117,'oauth2_provider','refreshtoken'),(118,'oauth_dispatch','applicationaccess'),(120,'oauth_dispatch','applicationorganization'),(119,'oauth_dispatch','restrictedapplication'),(309,'organizations','historicalorganization'),(308,'organizations','organization'),(310,'organizations','organizationcourse'),(209,'problem_builder','answer'),(208,'problem_builder','share'),(268,'programs','customprogramsconfig'),(267,'programs','programsapiconfig'),(363,'program_enrollments','courseaccessroleassignment'),(364,'program_enrollments','historicalprogramcourseenrollment'),(366,'program_enrollments','historicalprogramenrollment'),(365,'program_enrollments','programcourseenrollment'),(362,'program_enrollments','programenrollment'),(6,'redirects','redirect'),(188,'rss_proxy','whitelistedrssurl'),(344,'sap_success_factors','sapsuccessfactorsenterprisecustomerconfiguration'),(345,'sap_success_factors','sapsuccessfactorsglobalconfiguration'),(343,'sap_success_factors','sapsuccessfactorslearnerdatatransmissionaudit'),(305,'schedules','historicalschedule'),(304,'schedules','schedule'),(306,'schedules','scheduleconfig'),(307,'schedules','scheduleexperience'),(270,'self_paced','selfpacedconfiguration'),(7,'sessions','session'),(170,'shoppingcart','certificateitem'),(158,'shoppingcart','coupon'),(161,'shoppingcart','couponredemption'),(169,'shoppingcart','courseregcodeitem'),(159,'shoppingcart','courseregcodeitemannotation'),(163,'shoppingcart','courseregistrationcode'),(168,'shoppingcart','courseregistrationcodeinvoiceitem'),(172,'shoppingcart','donation'),(155,'shoppingcart','donationconfiguration'),(157,'shoppingcart','invoice'),(167,'shoppingcart','invoicehistory'),(166,'shoppingcart','invoiceitem'),(160,'shoppingcart','invoicetransaction'),(156,'shoppingcart','order'),(165,'shoppingcart','orderitem'),(171,'shoppingcart','paidcourseregistration'),(162,'shoppingcart','paidcourseregistrationannotation'),(164,'shoppingcart','registrationcoderedemption'),(8,'sites','site'),(26,'site_configuration','siteconfiguration'),(27,'site_configuration','siteconfigurationhistory'),(200,'social_django','association'),(202,'social_django','code'),(204,'social_django','nonce'),(203,'social_django','partial'),(201,'social_django','usersocialauth'),(147,'splash','splashconfig'),(22,'static_replace','assetbaseurlconfig'),(23,'static_replace','assetexcludedextensionsconfig'),(20,'status','coursemessage'),(21,'status','globalstatusmessage'),(71,'student','accountrecovery'),(52,'student','accountrecoveryconfiguration'),(58,'student','allowedauthuser'),(55,'student','anonymoususerid'),(61,'student','bulkunenrollconfiguration'),(76,'student','courseaccessrole'),(73,'student','courseenrollment'),(69,'student','courseenrollmentallowed'),(77,'student','courseenrollmentattribute'),(70,'student','dashboardconfiguration'),(62,'student','enrollmentrefundconfiguration'),(63,'student','entranceexamconfiguration'),(64,'student','fbeenrollmentexclusion'),(79,'student','historicalcourseenrollment'),(72,'student','historicalmanualenrollmentaudit'),(78,'student','languageproficiency'),(81,'student','linkedinaddtoprofileconfiguration'),(74,'student','loginfailures'),(57,'student','logoutviewconfiguration'),(80,'student','manualenrollmentaudit'),(59,'student','pendingemailchange'),(54,'student','pendingnamechange'),(56,'student','pendingsecondaryemailchange'),(68,'student','registration'),(65,'student','registrationcookieconfiguration'),(66,'student','sociallink'),(60,'student','userattribute'),(67,'student','userprofile'),(53,'student','usersignupsource'),(75,'student','userstanding'),(82,'student','usertestgroup'),(213,'submissions','score'),(215,'submissions','scoreannotation'),(214,'submissions','scoresummary'),(212,'submissions','studentitem'),(210,'submissions','submission'),(211,'submissions','teamsubmission'),(373,'super_csv','csvoperation'),(206,'survey','surveyanswer'),(205,'survey','surveyform'),(127,'system_wide_roles','systemwiderole'),(126,'system_wide_roles','systemwideroleassignment'),(397,'tagging','tagavailablevalues'),(396,'tagging','tagcategories'),(263,'teams','courseteam'),(262,'teams','courseteammembership'),(367,'theming','sitetheme'),(121,'third_party_auth','ltiproviderconfig'),(125,'third_party_auth','oauth2providerconfig'),(124,'third_party_auth','samlconfiguration'),(122,'third_party_auth','samlproviderconfig'),(123,'third_party_auth','samlproviderdata'),(271,'thumbnail','kvstore'),(152,'user_api','retirementstate'),(148,'user_api','usercoursetag'),(154,'user_api','userorgtag'),(150,'user_api','userpreference'),(149,'user_api','userretirementpartnerreportingstatus'),(153,'user_api','userretirementrequest'),(151,'user_api','userretirementstatus'),(398,'user_tasks','usertaskartifact'),(399,'user_tasks','usertaskstatus'),(83,'util','ratelimitconfiguration'),(279,'verified_track_content','migrateverifiedtrackcohortssetting'),(280,'verified_track_content','verifiedtrackcohortedcourse'),(182,'verify_student','manualverification'),(184,'verify_student','softwaresecurephotoverification'),(186,'verify_student','ssoverification'),(183,'verify_student','sspverificationretryconfig'),(185,'verify_student','verificationdeadline'),(29,'video_config','coursehlsplaybackenabledflag'),(32,'video_config','coursevideotranscriptenabledflag'),(35,'video_config','courseyoutubeblockedflag'),(31,'video_config','hlsplaybackenabledflag'),(33,'video_config','migrationenqueuedcourse'),(36,'video_config','transcriptmigrationsetting'),(34,'video_config','updatedcoursevideos'),(30,'video_config','videothumbnailsetting'),(28,'video_config','videotranscriptenabledflag'),(38,'video_pipeline','coursevideouploadsenabledbydefault'),(37,'video_pipeline','videopipelineintegration'),(39,'video_pipeline','videouploadsenabledbydefault'),(18,'waffle','flag'),(19,'waffle','sample'),(17,'waffle','switch'),(288,'waffle_utils','waffleflagcourseoverridemodel'),(135,'wiki','article'),(129,'wiki','articleforobject'),(128,'wiki','articleplugin'),(131,'wiki','articlerevision'),(132,'wiki','reusableplugin'),(136,'wiki','revisionplugin'),(133,'wiki','revisionpluginrevision'),(130,'wiki','simpleplugin'),(134,'wiki','urlpath'),(232,'workflow','assessmentworkflow'),(235,'workflow','assessmentworkflowcancellation'),(234,'workflow','assessmentworkflowstep'),(233,'workflow','teamassessmentworkflow'),(350,'xapi','xapilearnerdatatransmissionaudit'),(351,'xapi','xapilrsconfiguration'),(394,'xblock_config','courseeditltifieldsenabledflag'),(395,'xblock_config','studioconfig'),(264,'xblock_django','xblockconfiguration'),(266,'xblock_django','xblockstudioconfiguration'),(265,'xblock_django','xblockstudioconfigurationflag');
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
) ENGINE=InnoDB AUTO_INCREMENT=677 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-04-06 20:18:12.036444'),(2,'auth','0001_initial','2020-04-06 20:18:21.125988'),(3,'admin','0001_initial','2020-04-06 20:18:22.970403'),(4,'admin','0002_logentry_remove_auto_add','2020-04-06 20:18:23.128078'),(5,'announcements','0001_initial','2020-04-06 20:18:23.430224'),(6,'sites','0001_initial','2020-04-06 20:18:23.776669'),(7,'contenttypes','0002_remove_content_type_name','2020-04-06 20:18:24.813899'),(8,'api_admin','0001_initial','2020-04-06 20:18:30.431725'),(9,'api_admin','0002_auto_20160325_1604','2020-04-06 20:18:30.554338'),(10,'api_admin','0003_auto_20160404_1618','2020-04-06 20:18:35.256080'),(11,'api_admin','0004_auto_20160412_1506','2020-04-06 20:18:38.944406'),(12,'api_admin','0005_auto_20160414_1232','2020-04-06 20:18:39.783594'),(13,'api_admin','0006_catalog','2020-04-06 20:18:39.825479'),(14,'api_admin','0007_delete_historical_api_records','2020-04-06 20:18:41.893861'),(15,'assessment','0001_initial','2020-04-06 20:19:17.939178'),(16,'assessment','0002_staffworkflow','2020-04-06 20:19:22.641450'),(17,'assessment','0003_expand_course_id','2020-04-06 20:19:29.067170'),(18,'assessment','0004_historicalsharedfileupload_sharedfileupload','2020-04-06 20:19:37.570829'),(19,'assessment','0005_add_filename_to_sharedupload','2020-04-06 20:19:40.541987'),(20,'assessment','0006_TeamWorkflows','2020-04-06 20:19:42.610357'),(21,'auth','0002_alter_permission_name_max_length','2020-04-06 20:19:43.901381'),(22,'auth','0003_alter_user_email_max_length','2020-04-06 20:19:45.479386'),(23,'auth','0004_alter_user_username_opts','2020-04-06 20:19:45.568855'),(24,'auth','0005_alter_user_last_login_null','2020-04-06 20:19:46.525812'),(25,'auth','0006_require_contenttypes_0002','2020-04-06 20:19:46.625666'),(26,'auth','0007_alter_validators_add_error_messages','2020-04-06 20:19:46.752477'),(27,'auth','0008_alter_user_username_max_length','2020-04-06 20:19:48.602621'),(28,'instructor_task','0001_initial','2020-04-06 20:19:52.894637'),(29,'certificates','0001_initial','2020-04-06 20:20:14.191781'),(30,'certificates','0002_data__certificatehtmlviewconfiguration_data','2020-04-06 20:20:14.380660'),(31,'certificates','0003_data__default_modes','2020-04-06 20:20:14.669403'),(32,'certificates','0004_certificategenerationhistory','2020-04-06 20:20:18.139793'),(33,'certificates','0005_auto_20151208_0801','2020-04-06 20:20:18.650373'),(34,'certificates','0006_certificatetemplateasset_asset_slug','2020-04-06 20:20:19.952622'),(35,'certificates','0007_certificateinvalidation','2020-04-06 20:20:23.531753'),(36,'badges','0001_initial','2020-04-06 20:20:32.984582'),(37,'badges','0002_data__migrate_assertions','2020-04-06 20:20:33.272864'),(38,'badges','0003_schema__add_event_configuration','2020-04-06 20:20:35.399047'),(39,'block_structure','0001_config','2020-04-06 20:20:37.557390'),(40,'block_structure','0002_blockstructuremodel','2020-04-06 20:20:38.552958'),(41,'block_structure','0003_blockstructuremodel_storage','2020-04-06 20:20:38.628412'),(42,'block_structure','0004_blockstructuremodel_usagekeywithrun','2020-04-06 20:20:38.694305'),(43,'bookmarks','0001_initial','2020-04-06 20:20:47.497840'),(44,'branding','0001_initial','2020-04-06 20:20:52.400782'),(45,'course_modes','0001_initial','2020-04-06 20:20:55.302723'),(46,'course_modes','0002_coursemode_expiration_datetime_is_explicit','2020-04-06 20:20:56.675720'),(47,'course_modes','0003_auto_20151113_1443','2020-04-06 20:20:57.061595'),(48,'course_modes','0004_auto_20151113_1457','2020-04-06 20:20:59.064635'),(49,'course_modes','0005_auto_20151217_0958','2020-04-06 20:20:59.157735'),(50,'course_modes','0006_auto_20160208_1407','2020-04-06 20:20:59.259126'),(51,'course_modes','0007_coursemode_bulk_sku','2020-04-06 20:21:01.331084'),(52,'course_groups','0001_initial','2020-04-06 20:21:18.874527'),(53,'bulk_email','0001_initial','2020-04-06 20:21:26.735659'),(54,'bulk_email','0002_data__load_course_email_template','2020-04-06 20:21:27.147933'),(55,'bulk_email','0003_config_model_feature_flag','2020-04-06 20:21:28.220096'),(56,'bulk_email','0004_add_email_targets','2020-04-06 20:21:32.809356'),(57,'bulk_email','0005_move_target_data','2020-04-06 20:21:32.966700'),(58,'bulk_email','0006_course_mode_targets','2020-04-06 20:21:34.786855'),(59,'courseware','0001_initial','2020-04-06 20:21:51.090691'),(60,'bulk_grades','0001_initial','2020-04-06 20:21:53.124585'),(61,'bulk_grades','0002_auto_20190703_1526','2020-04-06 20:21:53.347731'),(62,'calendar_sync','0001_initial','2020-04-06 20:21:56.823225'),(63,'catalog','0001_initial','2020-04-06 20:21:57.907778'),(64,'catalog','0002_catalogintegration_username','2020-04-06 20:21:58.544621'),(65,'catalog','0003_catalogintegration_page_size','2020-04-06 20:21:59.215518'),(66,'catalog','0004_auto_20170616_0618','2020-04-06 20:21:59.319832'),(67,'catalog','0005_catalogintegration_long_term_cache_ttl','2020-04-06 20:21:59.963962'),(68,'celery_utils','0001_initial','2020-04-06 20:22:01.247114'),(69,'celery_utils','0002_chordable_django_backend','2020-04-06 20:22:01.281917'),(70,'certificates','0008_schema__remove_badges','2020-04-06 20:22:02.467860'),(71,'certificates','0009_certificategenerationcoursesetting_language_self_generation','2020-04-06 20:22:03.778675'),(72,'certificates','0010_certificatetemplate_language','2020-04-06 20:22:04.340237'),(73,'certificates','0011_certificatetemplate_alter_unique','2020-04-06 20:22:04.902225'),(74,'certificates','0012_certificategenerationcoursesetting_include_hours_of_effort','2020-04-06 20:22:05.425022'),(75,'certificates','0013_remove_certificategenerationcoursesetting_enabled','2020-04-06 20:22:05.905857'),(76,'certificates','0014_change_eligible_certs_manager','2020-04-06 20:22:06.008635'),(77,'certificates','0015_add_masters_choice','2020-04-06 20:22:06.121904'),(78,'certificates','0016_historicalgeneratedcertificate','2020-04-06 20:22:08.141230'),(79,'commerce','0001_data__add_ecommerce_service_user','2020-04-06 20:22:08.561750'),(80,'commerce','0002_commerceconfiguration','2020-04-06 20:22:09.758778'),(81,'commerce','0003_auto_20160329_0709','2020-04-06 20:22:09.892878'),(82,'commerce','0004_auto_20160531_0950','2020-04-06 20:22:11.245308'),(83,'commerce','0005_commerceconfiguration_enable_automatic_refund_approval','2020-04-06 20:22:11.917132'),(84,'commerce','0006_auto_20170424_1734','2020-04-06 20:22:12.141462'),(85,'commerce','0007_auto_20180313_0609','2020-04-06 20:22:13.350746'),(86,'commerce','0008_auto_20191024_2048','2020-04-06 20:22:13.549201'),(87,'completion','0001_initial','2020-04-06 20:22:15.553181'),(88,'completion','0002_auto_20180125_1510','2020-04-06 20:22:15.662850'),(89,'completion','0003_learning_context','2020-04-06 20:22:15.977425'),(90,'enterprise','0001_initial','2020-04-06 20:22:18.872530'),(91,'enterprise','0002_enterprisecustomerbrandingconfiguration','2020-04-06 20:22:20.038009'),(92,'enterprise','0003_auto_20161104_0937','2020-04-06 20:22:23.113894'),(93,'enterprise','0004_auto_20161114_0434','2020-04-06 20:22:25.003902'),(94,'enterprise','0005_pendingenterprisecustomeruser','2020-04-06 20:22:26.088773'),(95,'enterprise','0006_auto_20161121_0241','2020-04-06 20:22:26.368536'),(96,'enterprise','0007_auto_20161109_1511','2020-04-06 20:22:27.745753'),(97,'enterprise','0008_auto_20161124_2355','2020-04-06 20:22:30.598756'),(98,'enterprise','0009_auto_20161130_1651','2020-04-06 20:22:36.025354'),(99,'enterprise','0010_auto_20161222_1212','2020-04-06 20:22:37.390692'),(100,'enterprise','0011_enterprisecustomerentitlement_historicalenterprisecustomerentitlement','2020-04-06 20:22:40.566059'),(101,'enterprise','0012_auto_20170125_1033','2020-04-06 20:22:40.711835'),(102,'enterprise','0013_auto_20170125_1157','2020-04-06 20:22:43.719254'),(103,'enterprise','0014_enrollmentnotificationemailtemplate_historicalenrollmentnotificationemailtemplate','2020-04-06 20:22:46.517053'),(104,'enterprise','0015_auto_20170130_0003','2020-04-06 20:22:48.442026'),(105,'enterprise','0016_auto_20170405_0647','2020-04-06 20:22:49.491814'),(106,'enterprise','0017_auto_20170508_1341','2020-04-06 20:22:49.815942'),(107,'enterprise','0018_auto_20170511_1357','2020-04-06 20:22:51.183075'),(108,'enterprise','0019_auto_20170606_1853','2020-04-06 20:22:52.794873'),(109,'enterprise','0020_auto_20170624_2316','2020-04-06 20:22:56.171303'),(110,'enterprise','0021_auto_20170711_0712','2020-04-06 20:22:59.903726'),(111,'enterprise','0022_auto_20170720_1543','2020-04-06 20:23:00.295373'),(112,'enterprise','0023_audit_data_reporting_flag','2020-04-06 20:23:01.650633'),(113,'enterprise','0024_enterprisecustomercatalog_historicalenterprisecustomercatalog','2020-04-06 20:23:04.591226'),(114,'enterprise','0025_auto_20170828_1412','2020-04-06 20:23:08.538532'),(115,'enterprise','0026_make_require_account_level_consent_nullable','2020-04-06 20:23:09.768536'),(116,'enterprise','0027_remove_account_level_consent','2020-04-06 20:23:14.334789'),(117,'enterprise','0028_link_enterprise_to_enrollment_template','2020-04-06 20:23:18.172092'),(118,'enterprise','0029_auto_20170925_1909','2020-04-06 20:23:19.622342'),(119,'enterprise','0030_auto_20171005_1600','2020-04-06 20:23:20.987736'),(120,'enterprise','0031_auto_20171012_1249','2020-04-06 20:23:22.251238'),(121,'enterprise','0032_reporting_model','2020-04-06 20:23:23.524762'),(122,'enterprise','0033_add_history_change_reason_field','2020-04-06 20:23:26.965984'),(123,'enterprise','0034_auto_20171023_0727','2020-04-06 20:23:27.117209'),(124,'enterprise','0035_auto_20171212_1129','2020-04-06 20:23:28.442965'),(125,'enterprise','0036_sftp_reporting_support','2020-04-06 20:23:31.223050'),(126,'enterprise','0037_auto_20180110_0450','2020-04-06 20:23:31.383416'),(127,'enterprise','0038_auto_20180122_1427','2020-04-06 20:23:32.440354'),(128,'enterprise','0039_auto_20180129_1034','2020-04-06 20:23:33.735275'),(129,'enterprise','0040_auto_20180129_1428','2020-04-06 20:23:35.234642'),(130,'enterprise','0041_auto_20180212_1507','2020-04-06 20:23:36.027421'),(131,'consent','0001_initial','2020-04-06 20:23:39.011556'),(132,'consent','0002_migrate_to_new_data_sharing_consent','2020-04-06 20:23:39.228655'),(133,'consent','0003_historicaldatasharingconsent_history_change_reason','2020-04-06 20:23:39.926197'),(134,'consent','0004_datasharingconsenttextoverrides','2020-04-06 20:23:41.176474'),(135,'organizations','0001_initial','2020-04-06 20:23:43.834148'),(136,'organizations','0002_auto_20170117_1434','2020-04-06 20:23:43.889881'),(137,'organizations','0003_auto_20170221_1138','2020-04-06 20:23:44.492116'),(138,'organizations','0004_auto_20170413_2315','2020-04-06 20:23:44.573573'),(139,'organizations','0005_auto_20171116_0640','2020-04-06 20:23:44.625528'),(140,'organizations','0006_auto_20171207_0259','2020-04-06 20:23:44.681371'),(141,'organizations','0007_historicalorganization','2020-04-06 20:23:46.502762'),(142,'content_libraries','0001_initial','2020-04-06 20:23:51.126711'),(143,'content_libraries','0002_group_permissions','2020-04-06 20:23:56.715949'),(144,'sites','0002_alter_domain_unique','2020-04-06 20:23:56.995328'),(145,'course_overviews','0001_initial','2020-04-06 20:23:58.347328'),(146,'course_overviews','0002_add_course_catalog_fields','2020-04-06 20:24:00.874075'),(147,'course_overviews','0003_courseoverviewgeneratedhistory','2020-04-06 20:24:01.312053'),(148,'course_overviews','0004_courseoverview_org','2020-04-06 20:24:01.827076'),(149,'course_overviews','0005_delete_courseoverviewgeneratedhistory','2020-04-06 20:24:01.970121'),(150,'course_overviews','0006_courseoverviewimageset','2020-04-06 20:24:02.988968'),(151,'course_overviews','0007_courseoverviewimageconfig','2020-04-06 20:24:04.414229'),(152,'course_overviews','0008_remove_courseoverview_facebook_url','2020-04-06 20:24:04.448840'),(153,'course_overviews','0009_readd_facebook_url','2020-04-06 20:24:04.482025'),(154,'course_overviews','0010_auto_20160329_2317','2020-04-06 20:24:05.432873'),(155,'course_overviews','0011_courseoverview_marketing_url','2020-04-06 20:24:05.868530'),(156,'course_overviews','0012_courseoverview_eligible_for_financial_aid','2020-04-06 20:24:06.451551'),(157,'course_overviews','0013_courseoverview_language','2020-04-06 20:24:06.930871'),(158,'course_overviews','0014_courseoverview_certificate_available_date','2020-04-06 20:24:07.366538'),(159,'content_type_gating','0001_initial','2020-04-06 20:24:10.111635'),(160,'content_type_gating','0002_auto_20181119_0959','2020-04-06 20:24:10.439800'),(161,'content_type_gating','0003_auto_20181128_1407','2020-04-06 20:24:11.272733'),(162,'content_type_gating','0004_auto_20181128_1521','2020-04-06 20:24:11.413851'),(163,'content_type_gating','0005_auto_20190306_1547','2020-04-06 20:24:11.559827'),(164,'content_type_gating','0006_auto_20190308_1447','2020-04-06 20:24:12.293241'),(165,'content_type_gating','0007_auto_20190311_1919','2020-04-06 20:24:15.651688'),(166,'content_type_gating','0008_auto_20190313_1634','2020-04-06 20:24:15.805846'),(167,'contentserver','0001_initial','2020-04-06 20:24:16.802354'),(168,'contentserver','0002_cdnuseragentsconfig','2020-04-06 20:24:17.963540'),(169,'waffle','0001_initial','2020-04-06 20:24:24.493671'),(170,'enterprise','0042_replace_sensitive_sso_username','2020-04-06 20:24:25.812675'),(171,'enterprise','0043_auto_20180507_0138','2020-04-06 20:24:26.154816'),(172,'enterprise','0044_reporting_config_multiple_types','2020-04-06 20:24:28.699325'),(173,'enterprise','0045_report_type_json','2020-04-06 20:24:28.792518'),(174,'enterprise','0046_remove_unique_constraints','2020-04-06 20:24:29.000996'),(175,'enterprise','0047_auto_20180517_0457','2020-04-06 20:24:30.343061'),(176,'enterprise','0048_enterprisecustomeruser_active','2020-04-06 20:24:31.091254'),(177,'enterprise','0049_auto_20180531_0321','2020-04-06 20:24:32.795040'),(178,'enterprise','0050_progress_v2','2020-04-06 20:24:32.894923'),(179,'enterprise','0051_add_enterprise_slug','2020-04-06 20:24:35.189859'),(180,'enterprise','0052_create_unique_slugs','2020-04-06 20:24:35.754870'),(181,'enterprise','0053_pendingenrollment_cohort_name','2020-04-06 20:24:36.384683'),(182,'enterprise','0053_auto_20180911_0811','2020-04-06 20:24:38.333779'),(183,'enterprise','0054_merge_20180914_1511','2020-04-06 20:24:38.378655'),(184,'enterprise','0055_auto_20181015_1112','2020-04-06 20:24:39.862294'),(185,'enterprise','0056_enterprisecustomerreportingconfiguration_pgp_encryption_key','2020-04-06 20:24:40.465900'),(186,'enterprise','0057_enterprisecustomerreportingconfiguration_enterprise_customer_catalogs','2020-04-06 20:24:42.718516'),(187,'enterprise','0058_auto_20181212_0145','2020-04-06 20:24:45.584118'),(188,'enterprise','0059_add_code_management_portal_config','2020-04-06 20:24:47.259536'),(189,'enterprise','0060_upgrade_django_simple_history','2020-04-06 20:24:47.733145'),(190,'enterprise','0061_systemwideenterpriserole_systemwideenterpriseuserroleassignment','2020-04-06 20:24:50.122695'),(191,'enterprise','0062_add_system_wide_enterprise_roles','2020-04-06 20:24:50.500353'),(192,'enterprise','0063_systemwideenterpriserole_description','2020-04-06 20:24:51.270785'),(193,'enterprise','0064_enterprisefeaturerole_enterprisefeatureuserroleassignment','2020-04-06 20:24:53.556267'),(194,'enterprise','0065_add_enterprise_feature_roles','2020-04-06 20:24:53.921652'),(195,'enterprise','0066_add_system_wide_enterprise_operator_role','2020-04-06 20:24:54.635745'),(196,'enterprise','0067_add_role_based_access_control_switch','2020-04-06 20:24:58.108847'),(197,'cornerstone','0001_initial','2020-04-06 20:25:04.027213'),(198,'cornerstone','0002_cornerstoneglobalconfiguration_subject_mapping','2020-04-06 20:25:04.865497'),(199,'cornerstone','0003_auto_20190621_1000','2020-04-06 20:25:07.394674'),(200,'cornerstone','0004_cornerstoneglobalconfiguration_languages','2020-04-06 20:25:08.123989'),(201,'cornerstone','0005_auto_20190925_0730','2020-04-06 20:25:09.497655'),(202,'cornerstone','0006_auto_20191001_0742','2020-04-06 20:25:11.177223'),(203,'cors_csrf','0001_initial','2020-04-06 20:25:12.434970'),(204,'course_action_state','0001_initial','2020-04-06 20:25:15.577777'),(205,'course_overviews','0015_historicalcourseoverview','2020-04-06 20:25:17.327270'),(206,'course_overviews','0016_simulatecoursepublishconfig','2020-04-06 20:25:18.630026'),(207,'course_overviews','0017_auto_20191002_0823','2020-04-06 20:25:18.830951'),(208,'course_overviews','0018_add_start_end_in_CourseOverview','2020-04-06 20:25:21.310110'),(209,'course_overviews','0019_improve_courseoverviewtab','2020-04-06 20:25:24.018200'),(210,'course_date_signals','0001_initial','2020-04-06 20:25:28.233063'),(211,'course_duration_limits','0001_initial','2020-04-06 20:25:31.232220'),(212,'course_duration_limits','0002_auto_20181119_0959','2020-04-06 20:25:31.858241'),(213,'course_duration_limits','0003_auto_20181128_1407','2020-04-06 20:25:32.860111'),(214,'course_duration_limits','0004_auto_20181128_1521','2020-04-06 20:25:33.135172'),(215,'course_duration_limits','0005_auto_20190306_1546','2020-04-06 20:25:33.357574'),(216,'course_duration_limits','0006_auto_20190308_1447','2020-04-06 20:25:33.903891'),(217,'course_duration_limits','0007_auto_20190311_1919','2020-04-06 20:25:38.315837'),(218,'course_duration_limits','0008_auto_20190313_1634','2020-04-06 20:25:38.561129'),(219,'course_goals','0001_initial','2020-04-06 20:25:40.421432'),(220,'course_goals','0002_auto_20171010_1129','2020-04-06 20:25:40.633319'),(221,'course_groups','0002_change_inline_default_cohort_value','2020-04-06 20:25:40.778289'),(222,'course_groups','0003_auto_20170609_1455','2020-04-06 20:25:43.025930'),(223,'course_modes','0008_course_key_field_to_foreign_key','2020-04-06 20:25:43.350806'),(224,'course_modes','0009_suggested_prices_to_charfield','2020-04-06 20:25:43.493720'),(225,'course_modes','0010_archived_suggested_prices_to_charfield','2020-04-06 20:25:43.569962'),(226,'course_modes','0011_change_regex_for_comma_separated_ints','2020-04-06 20:25:43.733950'),(227,'course_modes','0012_historicalcoursemode','2020-04-06 20:25:45.465791'),(228,'course_modes','0013_auto_20200115_2022','2020-04-06 20:25:45.714163'),(229,'course_overviews','0020_courseoverviewtab_url_slug','2020-04-06 20:25:46.224485'),(230,'coursewarehistoryextended','0001_initial','2020-04-06 20:25:46.731478'),(231,'coursewarehistoryextended','0002_force_studentmodule_index','2020-04-06 20:25:46.834406'),(232,'courseware','0002_coursedynamicupgradedeadlineconfiguration_dynamicupgradedeadlineconfiguration','2020-04-06 20:25:49.421000'),(233,'courseware','0003_auto_20170825_0935','2020-04-06 20:25:49.518963'),(234,'courseware','0004_auto_20171010_1639','2020-04-06 20:25:49.600333'),(235,'courseware','0005_orgdynamicupgradedeadlineconfiguration','2020-04-06 20:25:51.013342'),(236,'courseware','0006_remove_module_id_index','2020-04-06 20:25:51.294654'),(237,'courseware','0007_remove_done_index','2020-04-06 20:25:51.540901'),(238,'courseware','0008_move_idde_to_edx_when','2020-04-06 20:25:51.859812'),(239,'courseware','0009_auto_20190703_1955','2020-04-06 20:25:52.127617'),(240,'courseware','0010_auto_20190709_1559','2020-04-06 20:25:52.455587'),(241,'courseware','0011_csm_id_bigint','2020-04-06 20:25:53.531830'),(242,'courseware','0012_adjust_fields','2020-04-06 20:25:53.844175'),(243,'courseware','0013_auto_20191001_1858','2020-04-06 20:25:54.519004'),(244,'courseware','0014_fix_nan_value_for_global_speed','2020-04-06 20:25:54.808130'),(245,'crawlers','0001_initial','2020-04-06 20:25:56.342776'),(246,'crawlers','0002_auto_20170419_0018','2020-04-06 20:25:56.525953'),(247,'credentials','0001_initial','2020-04-06 20:25:57.678866'),(248,'credentials','0002_auto_20160325_0631','2020-04-06 20:25:57.868232'),(249,'credentials','0003_auto_20170525_1109','2020-04-06 20:25:58.157490'),(250,'credentials','0004_notifycredentialsconfig','2020-04-06 20:25:59.361828'),(251,'credit','0001_initial','2020-04-06 20:26:13.039478'),(252,'credit','0002_creditconfig','2020-04-06 20:26:14.353815'),(253,'credit','0003_auto_20160511_2227','2020-04-06 20:26:14.442543'),(254,'credit','0004_delete_historical_credit_records','2020-04-06 20:26:19.882024'),(255,'credit','0005_creditrequirement_sort_value','2020-04-06 20:26:20.479262'),(256,'credit','0006_creditrequirement_alter_ordering','2020-04-06 20:26:20.592163'),(257,'credit','0007_creditrequirement_copy_values','2020-04-06 20:26:20.952400'),(258,'credit','0008_creditrequirement_remove_order','2020-04-06 20:26:21.502047'),(259,'dark_lang','0001_initial','2020-04-06 20:26:22.676784'),(260,'dark_lang','0002_data__enable_on_install','2020-04-06 20:26:23.076090'),(261,'dark_lang','0003_auto_20180425_0359','2020-04-06 20:26:24.572133'),(262,'database_fixups','0001_initial','2020-04-06 20:26:25.195677'),(263,'degreed','0001_initial','2020-04-06 20:26:29.702325'),(264,'degreed','0002_auto_20180104_0103','2020-04-06 20:26:31.280588'),(265,'degreed','0003_auto_20180109_0712','2020-04-06 20:26:31.600402'),(266,'degreed','0004_auto_20180306_1251','2020-04-06 20:26:33.195553'),(267,'degreed','0005_auto_20180807_1302','2020-04-06 20:26:41.880060'),(268,'degreed','0006_upgrade_django_simple_history','2020-04-06 20:26:42.121183'),(269,'degreed','0007_auto_20190925_0730','2020-04-06 20:26:43.896267'),(270,'degreed','0008_auto_20191001_0742','2020-04-06 20:26:45.282623'),(271,'discounts','0001_initial','2020-04-06 20:26:50.134563'),(272,'discounts','0002_auto_20191022_1720','2020-04-06 20:26:54.519245'),(273,'django_comment_common','0001_initial','2020-04-06 20:26:59.958310'),(274,'django_comment_common','0002_forumsconfig','2020-04-06 20:27:01.221447'),(275,'django_comment_common','0003_enable_forums','2020-04-06 20:27:01.609045'),(276,'django_comment_common','0004_auto_20161117_1209','2020-04-06 20:27:01.799671'),(277,'django_comment_common','0005_coursediscussionsettings','2020-04-06 20:27:02.293562'),(278,'django_comment_common','0006_coursediscussionsettings_discussions_id_map','2020-04-06 20:27:02.870692'),(279,'django_comment_common','0007_discussionsidmapping','2020-04-06 20:27:03.394314'),(280,'django_comment_common','0008_role_user_index','2020-04-06 20:27:03.871804'),(281,'django_notify','0001_initial','2020-04-06 20:27:10.143928'),(282,'djcelery','0001_initial','2020-04-06 20:27:17.858210'),(283,'edx_proctoring','0001_initial','2020-04-06 20:27:41.306365'),(284,'edx_proctoring','0002_proctoredexamstudentattempt_is_status_acknowledged','2020-04-06 20:27:42.236546'),(285,'edx_proctoring','0003_auto_20160101_0525','2020-04-06 20:27:42.605682'),(286,'edx_proctoring','0004_auto_20160201_0523','2020-04-06 20:27:43.193212'),(287,'edx_proctoring','0005_proctoredexam_hide_after_due','2020-04-06 20:27:43.974730'),(288,'edx_proctoring','0006_allowed_time_limit_mins','2020-04-06 20:27:46.160471'),(289,'edx_proctoring','0007_proctoredexam_backend','2020-04-06 20:27:46.982721'),(290,'edx_proctoring','0008_auto_20181116_1551','2020-04-06 20:27:48.676664'),(291,'edx_proctoring','0009_proctoredexamreviewpolicy_remove_rules','2020-04-06 20:27:50.231040'),(292,'edx_proctoring','0010_update_backend','2020-04-06 20:27:50.645572'),(293,'edx_when','0001_initial','2020-04-06 20:27:56.536593'),(294,'edx_when','0002_auto_20190318_1736','2020-04-06 20:28:01.400608'),(295,'edx_when','0003_auto_20190402_1501','2020-04-06 20:28:03.457560'),(296,'edx_when','0004_datepolicy_rel_date','2020-04-06 20:28:04.249546'),(297,'edx_when','0005_auto_20190911_1056','2020-04-06 20:28:05.946189'),(298,'edx_when','0006_drop_active_index','2020-04-06 20:28:06.237149'),(299,'edx_zoom','0001_initial','2020-04-06 20:28:06.774592'),(300,'edx_zoom','0002_lticredential_launch_url','2020-04-06 20:28:07.385319'),(301,'edx_zoom','0003_add_launchlog','2020-04-06 20:28:10.480221'),(302,'edxval','0001_initial','2020-04-06 20:28:18.502376'),(303,'edxval','0002_data__default_profiles','2020-04-06 20:28:19.033610'),(304,'edxval','0003_coursevideo_is_hidden','2020-04-06 20:28:19.740752'),(305,'edxval','0004_data__add_hls_profile','2020-04-06 20:28:20.170838'),(306,'edxval','0005_videoimage','2020-04-06 20:28:21.274174'),(307,'edxval','0006_auto_20171009_0725','2020-04-06 20:28:22.757629'),(308,'edxval','0007_transcript_credentials_state','2020-04-06 20:28:23.472383'),(309,'edxval','0008_remove_subtitles','2020-04-06 20:28:24.317996'),(310,'edxval','0009_auto_20171127_0406','2020-04-06 20:28:24.427004'),(311,'edxval','0010_add_video_as_foreign_key','2020-04-06 20:28:27.087595'),(312,'edxval','0011_data__add_audio_mp3_profile','2020-04-06 20:28:27.529447'),(313,'edxval','0012_thirdpartytranscriptcredentialsstate_has_creds','2020-04-06 20:28:28.147208'),(314,'edxval','0013_thirdpartytranscriptcredentialsstate_copy_values','2020-04-06 20:28:28.548525'),(315,'edxval','0014_transcript_credentials_state_retype_exists','2020-04-06 20:28:29.037186'),(316,'edxval','0015_remove_thirdpartytranscriptcredentialsstate_exists','2020-04-06 20:28:29.812298'),(317,'edxval','0016_add_transcript_credentials_model','2020-04-06 20:28:30.471922'),(318,'email_marketing','0001_initial','2020-04-06 20:28:32.261345'),(319,'email_marketing','0002_auto_20160623_1656','2020-04-06 20:28:38.204992'),(320,'email_marketing','0003_auto_20160715_1145','2020-04-06 20:28:39.671480'),(321,'email_marketing','0004_emailmarketingconfiguration_welcome_email_send_delay','2020-04-06 20:28:40.574888'),(322,'email_marketing','0005_emailmarketingconfiguration_user_registration_cookie_timeout_delay','2020-04-06 20:28:41.625446'),(323,'email_marketing','0006_auto_20170711_0615','2020-04-06 20:28:41.946146'),(324,'email_marketing','0007_auto_20170809_0653','2020-04-06 20:28:43.077758'),(325,'email_marketing','0008_auto_20170809_0539','2020-04-06 20:28:43.477428'),(326,'email_marketing','0009_remove_emailmarketingconfiguration_sailthru_activation_template','2020-04-06 20:28:44.147857'),(327,'email_marketing','0010_auto_20180425_0800','2020-04-06 20:28:45.643566'),(328,'embargo','0001_initial','2020-04-06 20:28:52.228054'),(329,'embargo','0002_data__add_countries','2020-04-06 20:28:53.115922'),(330,'enterprise','0068_remove_role_based_access_control_switch','2020-04-06 20:28:54.054386'),(331,'enterprise','0069_auto_20190613_0607','2020-04-06 20:28:55.532230'),(332,'enterprise','0070_enterprise_catalog_query','2020-04-06 20:28:58.426165'),(333,'enterprise','0071_historicalpendingenrollment_historicalpendingenterprisecustomeruser','2020-04-06 20:29:02.109597'),(334,'enterprise','0072_add_enterprise_report_config_feature_role','2020-04-06 20:29:02.641864'),(335,'enterprise','0073_enterprisecustomerreportingconfiguration_uuid','2020-04-06 20:29:04.825769'),(336,'enterprise','0074_auto_20190904_1143','2020-04-06 20:29:06.331259'),(337,'enterprise','0075_auto_20190916_1030','2020-04-06 20:29:10.167094'),(338,'enterprise','0076_auto_20190918_2037','2020-04-06 20:29:12.706255'),(339,'enterprise','0077_auto_20191002_1529','2020-04-06 20:29:15.464552'),(340,'enterprise','0078_auto_20191107_1536','2020-04-06 20:29:15.615039'),(341,'enterprise','0079_AddEnterpriseEnrollmentSource','2020-04-06 20:29:21.906502'),(342,'enterprise','0080_auto_20191113_1708','2020-04-06 20:29:22.062398'),(343,'enterprise','0081_UpdateEnterpriseEnrollmentSource','2020-04-06 20:29:22.552191'),(344,'enterprise','0082_AddManagementEnterpriseEnrollmentSource','2020-04-06 20:29:23.048155'),(345,'enterprise','0083_enterprisecustomerreportingconfiguration_include_date','2020-04-06 20:29:23.810212'),(346,'enterprise','0084_auto_20200120_1137','2020-04-06 20:29:24.154836'),(347,'enterprise','0085_enterprisecustomeruser_linked','2020-04-06 20:29:24.993086'),(348,'enterprise','0086_auto_20200128_1726','2020-04-06 20:29:28.066079'),(349,'enterprise','0087_auto_20200206_1151','2020-04-06 20:29:29.753231'),(350,'enterprise','0088_auto_20200224_1341','2020-04-06 20:29:31.800366'),(351,'enterprise','0089_auto_20200305_0652','2020-04-06 20:29:32.434695'),(352,'enterprise','0090_update_content_filter','2020-04-06 20:29:32.794072'),(353,'enterprise','0091_add_sales_force_id_in_pendingenrollment','2020-04-06 20:29:34.358329'),(354,'enterprise','0092_auto_20200312_1650','2020-04-06 20:29:36.165054'),(355,'student','0001_initial','2020-04-06 20:30:15.739777'),(356,'student','0002_auto_20151208_1034','2020-04-06 20:30:16.201472'),(357,'student','0003_auto_20160516_0938','2020-04-06 20:30:17.780836'),(358,'student','0004_auto_20160531_1422','2020-04-06 20:30:17.924272'),(359,'student','0005_auto_20160531_1653','2020-04-06 20:30:18.340280'),(360,'student','0006_logoutviewconfiguration','2020-04-06 20:30:19.489877'),(361,'student','0007_registrationcookieconfiguration','2020-04-06 20:30:20.591971'),(362,'student','0008_auto_20161117_1209','2020-04-06 20:30:20.718933'),(363,'student','0009_auto_20170111_0422','2020-04-06 20:30:20.839859'),(364,'student','0010_auto_20170207_0458','2020-04-06 20:30:20.875701'),(365,'student','0011_course_key_field_to_foreign_key','2020-04-06 20:30:22.279924'),(366,'student','0012_sociallink','2020-04-06 20:30:23.804482'),(367,'student','0013_delete_historical_enrollment_records','2020-04-06 20:30:27.332679'),(368,'student','0014_courseenrollmentallowed_user','2020-04-06 20:30:29.066348'),(369,'student','0015_manualenrollmentaudit_add_role','2020-04-06 20:30:29.866780'),(370,'student','0016_coursenrollment_course_on_delete_do_nothing','2020-04-06 20:30:30.247051'),(371,'student','0017_accountrecovery','2020-04-06 20:30:31.609827'),(372,'student','0018_remove_password_history','2020-04-06 20:30:32.671219'),(373,'student','0019_auto_20181221_0540','2020-04-06 20:30:35.179168'),(374,'student','0020_auto_20190227_2019','2020-04-06 20:30:35.493849'),(375,'student','0021_historicalcourseenrollment','2020-04-06 20:30:37.796063'),(376,'entitlements','0001_initial','2020-04-06 20:30:40.400495'),(377,'entitlements','0002_auto_20171102_0719','2020-04-06 20:30:42.371163'),(378,'entitlements','0003_auto_20171205_1431','2020-04-06 20:30:46.401173'),(379,'entitlements','0004_auto_20171206_1729','2020-04-06 20:30:47.007815'),(380,'entitlements','0005_courseentitlementsupportdetail','2020-04-06 20:30:49.302322'),(381,'entitlements','0006_courseentitlementsupportdetail_action','2020-04-06 20:30:50.207143'),(382,'entitlements','0007_change_expiration_period_default','2020-04-06 20:30:50.458411'),(383,'entitlements','0008_auto_20180328_1107','2020-04-06 20:30:53.400643'),(384,'entitlements','0009_courseentitlement_refund_locked','2020-04-06 20:30:54.316203'),(385,'entitlements','0010_backfill_refund_lock','2020-04-06 20:30:54.815552'),(386,'entitlements','0011_historicalcourseentitlement','2020-04-06 20:30:57.354413'),(387,'entitlements','0012_allow_blank_order_number_values','2020-04-06 20:30:57.905168'),(388,'entitlements','0013_historicalcourseentitlementsupportdetail','2020-04-06 20:31:00.049918'),(389,'entitlements','0014_auto_20200115_2022','2020-04-06 20:31:00.426984'),(390,'entitlements','0015_add_unique_together_constraint','2020-04-06 20:31:01.527992'),(391,'experiments','0001_initial','2020-04-06 20:31:04.795035'),(392,'experiments','0002_auto_20170627_1402','2020-04-06 20:31:05.777350'),(393,'experiments','0003_auto_20170713_1148','2020-04-06 20:31:05.882113'),(394,'experiments','0004_historicalexperimentkeyvalue','2020-04-06 20:31:07.692708'),(395,'external_user_ids','0001_initial','2020-04-06 20:31:15.901069'),(396,'external_user_ids','0002_mb_coaching_20200210_1754','2020-04-06 20:31:16.460137'),(397,'external_user_ids','0003_auto_20200224_1836','2020-04-06 20:31:17.115710'),(398,'grades','0001_initial','2020-04-06 20:31:19.611967'),(399,'grades','0002_rename_last_edited_field','2020-04-06 20:31:19.781184'),(400,'grades','0003_coursepersistentgradesflag_persistentgradesenabledflag','2020-04-06 20:31:23.197890'),(401,'grades','0004_visibleblocks_course_id','2020-04-06 20:31:24.025919'),(402,'grades','0005_multiple_course_flags','2020-04-06 20:31:24.759892'),(403,'grades','0006_persistent_course_grades','2020-04-06 20:31:25.650953'),(404,'grades','0007_add_passed_timestamp_column','2020-04-06 20:31:26.658577'),(405,'grades','0008_persistentsubsectiongrade_first_attempted','2020-04-06 20:31:27.230945'),(406,'grades','0009_auto_20170111_1507','2020-04-06 20:31:27.975803'),(407,'grades','0010_auto_20170112_1156','2020-04-06 20:31:28.299682'),(408,'grades','0011_null_edited_time','2020-04-06 20:31:29.785632'),(409,'grades','0012_computegradessetting','2020-04-06 20:31:32.141972'),(410,'grades','0013_persistentsubsectiongradeoverride','2020-04-06 20:31:33.820936'),(411,'grades','0014_persistentsubsectiongradeoverridehistory','2020-04-06 20:31:35.895021'),(412,'grades','0015_historicalpersistentsubsectiongradeoverride','2020-04-06 20:31:38.301997'),(413,'grades','0016_auto_20190703_1446','2020-04-06 20:31:41.821830'),(414,'grades','0017_delete_manual_psgoverride_table','2020-04-06 20:31:42.987449'),(415,'instructor_task','0002_gradereportsetting','2020-04-06 20:31:44.404189'),(416,'instructor_task','0003_alter_task_input_field','2020-04-06 20:31:45.622432'),(417,'sap_success_factors','0001_initial','2020-04-06 20:31:52.329255'),(418,'sap_success_factors','0002_auto_20170224_1545','2020-04-06 20:31:56.044700'),(419,'sap_success_factors','0003_auto_20170317_1402','2020-04-06 20:32:00.008634'),(420,'sap_success_factors','0004_catalogtransmissionaudit_audit_summary','2020-04-06 20:32:00.598555'),(421,'sap_success_factors','0005_historicalsapsuccessfactorsenterprisecustomerconfiguration_history_change_reason','2020-04-06 20:32:01.550460'),(422,'sap_success_factors','0006_sapsuccessfactors_use_enterprise_enrollment_page_waffle_flag','2020-04-06 20:32:02.118079'),(423,'sap_success_factors','0007_remove_historicalsapsuccessfactorsenterprisecustomerconfiguration_history_change_reason','2020-04-06 20:32:03.126406'),(424,'sap_success_factors','0008_historicalsapsuccessfactorsenterprisecustomerconfiguration_history_change_reason','2020-04-06 20:32:04.808699'),(425,'sap_success_factors','0009_sapsuccessfactors_remove_enterprise_enrollment_page_waffle_flag','2020-04-06 20:32:05.421943'),(426,'sap_success_factors','0010_move_audit_tables_to_base_integrated_channel','2020-04-06 20:32:06.439598'),(427,'integrated_channel','0001_initial','2020-04-06 20:32:07.148402'),(428,'integrated_channel','0002_delete_enterpriseintegratedchannel','2020-04-06 20:32:07.361517'),(429,'integrated_channel','0003_catalogtransmissionaudit_learnerdatatransmissionaudit','2020-04-06 20:32:07.874441'),(430,'integrated_channel','0004_catalogtransmissionaudit_channel','2020-04-06 20:32:08.475226'),(431,'integrated_channel','0005_auto_20180306_1251','2020-04-06 20:32:10.195306'),(432,'integrated_channel','0006_delete_catalogtransmissionaudit','2020-04-06 20:32:10.411268'),(433,'integrated_channel','0007_auto_20190925_0730','2020-04-06 20:32:10.787966'),(434,'lms_xblock','0001_initial','2020-04-06 20:32:12.236702'),(435,'lx_pathway_plugin','0001_initial','2020-04-06 20:32:14.566526'),(436,'milestones','0001_initial','2020-04-06 20:32:25.478648'),(437,'milestones','0002_data__seed_relationship_types','2020-04-06 20:32:26.082453'),(438,'milestones','0003_coursecontentmilestone_requirements','2020-04-06 20:32:26.937372'),(439,'milestones','0004_auto_20151221_1445','2020-04-06 20:32:28.140236'),(440,'mobile_api','0001_initial','2020-04-06 20:32:29.515212'),(441,'mobile_api','0002_auto_20160406_0904','2020-04-06 20:32:30.938718'),(442,'mobile_api','0003_ignore_mobile_available_flag','2020-04-06 20:32:32.620455'),(443,'oauth2_provider','0001_initial','2020-04-06 20:32:41.860298'),(444,'oauth_dispatch','0001_initial','2020-04-06 20:32:43.302469'),(445,'oauth_dispatch','0002_scopedapplication_scopedapplicationorganization','2020-04-06 20:32:46.384928'),(446,'oauth_dispatch','0003_application_data','2020-04-06 20:32:47.542463'),(447,'oauth_dispatch','0004_auto_20180626_1349','2020-04-06 20:32:53.451878'),(448,'oauth_dispatch','0005_applicationaccess_type','2020-04-06 20:32:54.254469'),(449,'oauth_dispatch','0006_drop_application_id_constraints','2020-04-06 20:32:54.833895'),(450,'oauth2_provider','0002_08_updates','2020-04-06 20:32:57.995633'),(451,'oauth2_provider','0003_auto_20160316_1503','2020-04-06 20:32:59.496545'),(452,'oauth2_provider','0004_auto_20160525_1623','2020-04-06 20:33:00.867794'),(453,'oauth2_provider','0005_auto_20170514_1141','2020-04-06 20:33:22.772544'),(454,'oauth2_provider','0006_auto_20171214_2232','2020-04-06 20:33:27.642597'),(455,'oauth_dispatch','0007_restore_application_id_constraints','2020-04-06 20:33:30.299343'),(456,'oauth_dispatch','0008_applicationaccess_filters','2020-04-06 20:33:30.910483'),(457,'oauth_dispatch','0009_delete_enable_scopes_waffle_switch','2020-04-06 20:33:31.445534'),(458,'problem_builder','0001_initial','2020-04-06 20:33:33.082301'),(459,'problem_builder','0002_auto_20160121_1525','2020-04-06 20:33:35.601587'),(460,'problem_builder','0003_auto_20161124_0755','2020-04-06 20:33:36.939047'),(461,'problem_builder','0004_copy_course_ids','2020-04-06 20:33:37.510167'),(462,'problem_builder','0005_auto_20170112_1021','2020-04-06 20:33:39.409839'),(463,'problem_builder','0006_remove_deprecated_course_id','2020-04-06 20:33:40.316689'),(464,'problem_builder','0007_lengthen_student_id_field','2020-04-06 20:33:41.156753'),(465,'program_enrollments','0001_initial','2020-04-06 20:33:45.389917'),(466,'program_enrollments','0002_historicalprogramcourseenrollment_programcourseenrollment','2020-04-06 20:33:50.050306'),(467,'program_enrollments','0003_auto_20190424_1622','2020-04-06 20:33:50.895685'),(468,'program_enrollments','0004_add_programcourseenrollment_relatedname','2020-04-06 20:33:52.336863'),(469,'program_enrollments','0005_canceled_not_withdrawn','2020-04-06 20:33:53.712264'),(470,'program_enrollments','0006_add_the_correct_constraints','2020-04-06 20:33:55.732069'),(471,'program_enrollments','0007_waiting_programcourseenrollment_constraint','2020-04-06 20:33:56.246211'),(472,'program_enrollments','0008_add_ended_programenrollment_status','2020-04-06 20:33:56.547320'),(473,'program_enrollments','0009_update_course_enrollment_field_to_foreign_key','2020-04-06 20:33:57.972093'),(474,'program_enrollments','0010_add_courseaccessroleassignment','2020-04-06 20:34:00.104410'),(475,'programs','0001_initial','2020-04-06 20:34:01.495440'),(476,'programs','0002_programsapiconfig_cache_ttl','2020-04-06 20:34:02.315091'),(477,'programs','0003_auto_20151120_1613','2020-04-06 20:34:05.502026'),(478,'programs','0004_programsapiconfig_enable_certification','2020-04-06 20:34:06.318584'),(479,'programs','0005_programsapiconfig_max_retries','2020-04-06 20:34:06.989127'),(480,'programs','0006_programsapiconfig_xseries_ad_enabled','2020-04-06 20:34:07.745143'),(481,'programs','0007_programsapiconfig_program_listing_enabled','2020-04-06 20:34:08.499408'),(482,'programs','0008_programsapiconfig_program_details_enabled','2020-04-06 20:34:09.351118'),(483,'programs','0009_programsapiconfig_marketing_path','2020-04-06 20:34:10.064875'),(484,'programs','0010_auto_20170204_2332','2020-04-06 20:34:10.598211'),(485,'programs','0011_auto_20170301_1844','2020-04-06 20:34:20.157357'),(486,'programs','0012_auto_20170419_0018','2020-04-06 20:34:20.354591'),(487,'programs','0013_customprogramsconfig','2020-04-06 20:34:21.510205'),(488,'redirects','0001_initial','2020-04-06 20:34:23.365315'),(489,'rss_proxy','0001_initial','2020-04-06 20:34:23.906419'),(490,'sap_success_factors','0011_auto_20180104_0103','2020-04-06 20:34:26.481835'),(491,'sap_success_factors','0012_auto_20180109_0712','2020-04-06 20:34:26.749504'),(492,'sap_success_factors','0013_auto_20180306_1251','2020-04-06 20:34:28.214613'),(493,'sap_success_factors','0014_drop_historical_table','2020-04-06 20:34:28.788694'),(494,'sap_success_factors','0015_auto_20180510_1259','2020-04-06 20:34:31.128747'),(495,'sap_success_factors','0016_sapsuccessfactorsenterprisecustomerconfiguration_additional_locales','2020-04-06 20:34:31.769224'),(496,'sap_success_factors','0017_sapsuccessfactorsglobalconfiguration_search_student_api_path','2020-04-06 20:34:32.433884'),(497,'sap_success_factors','0018_sapsuccessfactorsenterprisecustomerconfiguration_show_course_price','2020-04-06 20:34:33.164244'),(498,'sap_success_factors','0019_auto_20190925_0730','2020-04-06 20:34:34.064026'),(499,'sap_success_factors','0020_sapsuccessfactorsenterprisecustomerconfiguration_catalogs_to_transmit','2020-04-06 20:34:34.703080'),(500,'sap_success_factors','0021_sapsuccessfactorsenterprisecustomerconfiguration_show_total_hours','2020-04-06 20:34:35.869506'),(501,'sap_success_factors','0022_auto_20200206_1046','2020-04-06 20:34:37.786826'),(502,'schedules','0001_initial','2020-04-06 20:34:39.101961'),(503,'schedules','0002_auto_20170816_1532','2020-04-06 20:34:39.816437'),(504,'schedules','0003_scheduleconfig','2020-04-06 20:34:41.802571'),(505,'schedules','0004_auto_20170922_1428','2020-04-06 20:34:43.475186'),(506,'schedules','0005_auto_20171010_1722','2020-04-06 20:34:45.002609'),(507,'schedules','0006_scheduleexperience','2020-04-06 20:34:46.326151'),(508,'schedules','0007_scheduleconfig_hold_back_ratio','2020-04-06 20:34:47.088214'),(509,'schedules','0008_add_new_start_date_field','2020-04-06 20:34:48.060198'),(510,'schedules','0009_schedule_copy_column_values','2020-04-06 20:34:48.616327'),(511,'schedules','0010_remove_null_blank_from_schedules_date','2020-04-06 20:34:49.761256'),(512,'schedules','0011_auto_20200228_2018','2020-04-06 20:34:50.082535'),(513,'schedules','0012_auto_20200302_1914','2020-04-06 20:34:50.396824'),(514,'schedules','0013_historicalschedule','2020-04-06 20:34:53.026202'),(515,'schedules','0014_historicalschedule_drop_fk','2020-04-06 20:34:53.403609'),(516,'schedules','0015_schedules_start_nullable','2020-04-06 20:34:55.045020'),(517,'schedules','0016_remove_start_from_schedules','2020-04-06 20:34:55.693237'),(518,'schedules','0017_remove_start_from_historicalschedule','2020-04-06 20:34:56.537782'),(519,'schedules','0018_readd_historicalschedule_fks','2020-04-06 20:34:58.366679'),(520,'schedules','0019_auto_20200316_1935','2020-04-06 20:35:00.888497'),(521,'self_paced','0001_initial','2020-04-06 20:35:02.103817'),(522,'sessions','0001_initial','2020-04-06 20:35:02.759859'),(523,'shoppingcart','0001_initial','2020-04-06 20:35:44.129944'),(524,'shoppingcart','0002_auto_20151208_1034','2020-04-06 20:35:44.440609'),(525,'shoppingcart','0003_auto_20151217_0958','2020-04-06 20:35:44.808530'),(526,'shoppingcart','0004_change_meta_options','2020-04-06 20:35:44.977810'),(527,'site_configuration','0001_initial','2020-04-06 20:35:47.360696'),(528,'site_configuration','0002_auto_20160720_0231','2020-04-06 20:35:48.846156'),(529,'site_configuration','0003_auto_20200217_1058','2020-04-06 20:35:49.093978'),(530,'site_configuration','0004_add_site_values_field','2020-04-06 20:35:50.592176'),(531,'site_configuration','0005_populate_siteconfig_history_site_values','2020-04-06 20:35:50.680874'),(532,'site_configuration','0006_copy_values_to_site_values','2020-04-06 20:35:51.979421'),(533,'site_configuration','0007_remove_values_field','2020-04-06 20:35:53.178839'),(534,'default','0001_initial','2020-04-06 20:35:56.462977'),(535,'social_auth','0001_initial','2020-04-06 20:35:56.540180'),(536,'default','0002_add_related_name','2020-04-06 20:35:57.604102'),(537,'social_auth','0002_add_related_name','2020-04-06 20:35:57.658365'),(538,'default','0003_alter_email_max_length','2020-04-06 20:35:58.488312'),(539,'social_auth','0003_alter_email_max_length','2020-04-06 20:35:58.573258'),(540,'default','0004_auto_20160423_0400','2020-04-06 20:35:58.779150'),(541,'social_auth','0004_auto_20160423_0400','2020-04-06 20:35:58.827504'),(542,'social_auth','0005_auto_20160727_2333','2020-04-06 20:35:59.196618'),(543,'social_django','0006_partial','2020-04-06 20:35:59.787397'),(544,'social_django','0007_code_timestamp','2020-04-06 20:36:00.701854'),(545,'social_django','0008_partial_timestamp','2020-04-06 20:36:01.573527'),(546,'splash','0001_initial','2020-04-06 20:36:02.778304'),(547,'static_replace','0001_initial','2020-04-06 20:36:04.002947'),(548,'static_replace','0002_assetexcludedextensionsconfig','2020-04-06 20:36:05.262527'),(549,'status','0001_initial','2020-04-06 20:36:08.158283'),(550,'status','0002_update_help_text','2020-04-06 20:36:08.359445'),(551,'student','0022_indexing_in_courseenrollment','2020-04-06 20:36:08.780470'),(552,'student','0023_bulkunenrollconfiguration','2020-04-06 20:36:09.931663'),(553,'student','0024_fbeenrollmentexclusion','2020-04-06 20:36:11.136473'),(554,'student','0025_auto_20191101_1846','2020-04-06 20:36:11.722187'),(555,'student','0026_allowedauthuser','2020-04-06 20:36:13.029456'),(556,'student','0027_courseenrollment_mode_callable_default','2020-04-06 20:36:13.369304'),(557,'student','0028_historicalmanualenrollmentaudit','2020-04-06 20:36:16.380904'),(558,'student','0029_add_data_researcher','2020-04-06 20:36:17.033842'),(559,'student','0030_userprofile_phone_number','2020-04-06 20:36:17.973836'),(560,'student','0031_auto_20200317_1122','2020-04-06 20:36:19.242074'),(561,'submissions','0001_initial','2020-04-06 20:36:28.438545'),(562,'submissions','0002_auto_20151119_0913','2020-04-06 20:36:30.090175'),(563,'submissions','0003_submission_status','2020-04-06 20:36:30.840322'),(564,'submissions','0004_remove_django_extensions','2020-04-06 20:36:31.017329'),(565,'submissions','0005_CreateTeamModel','2020-04-06 20:36:35.003561'),(566,'super_csv','0001_initial','2020-04-06 20:36:35.805043'),(567,'super_csv','0002_csvoperation_user','2020-04-06 20:36:37.493497'),(568,'super_csv','0003_csvoperation_original_filename','2020-04-06 20:36:38.329513'),(569,'survey','0001_initial','2020-04-06 20:36:42.224593'),(570,'system_wide_roles','0001_SystemWideRole_SystemWideRoleAssignment','2020-04-06 20:36:44.490470'),(571,'system_wide_roles','0002_add_system_wide_student_support_role','2020-04-06 20:36:45.192944'),(572,'teams','0001_initial','2020-04-06 20:36:49.603651'),(573,'teams','0002_slug_field_ids','2020-04-06 20:36:50.064037'),(574,'teams','0003_courseteam_organization_protected','2020-04-06 20:36:51.075508'),(575,'teams','0004_alter_defaults','2020-04-06 20:36:52.786377'),(576,'theming','0001_initial','2020-04-06 20:36:54.105853'),(577,'third_party_auth','0001_initial','2020-04-06 20:37:00.547166'),(578,'third_party_auth','0002_schema__provider_icon_image','2020-04-06 20:37:03.508822'),(579,'third_party_auth','0003_samlproviderconfig_debug_mode','2020-04-06 20:37:04.260807'),(580,'third_party_auth','0004_add_visible_field','2020-04-06 20:37:07.494633'),(581,'third_party_auth','0005_add_site_field','2020-04-06 20:37:16.338138'),(582,'third_party_auth','0006_samlproviderconfig_automatic_refresh_enabled','2020-04-06 20:37:17.317518'),(583,'third_party_auth','0007_auto_20170406_0912','2020-04-06 20:37:18.449405'),(584,'third_party_auth','0008_auto_20170413_1455','2020-04-06 20:37:21.154537'),(585,'third_party_auth','0009_auto_20170415_1144','2020-04-06 20:37:23.665311'),(586,'third_party_auth','0010_add_skip_hinted_login_dialog_field','2020-04-06 20:37:26.230507'),(587,'third_party_auth','0011_auto_20170616_0112','2020-04-06 20:37:26.520773'),(588,'third_party_auth','0012_auto_20170626_1135','2020-04-06 20:37:29.184212'),(589,'third_party_auth','0013_sync_learner_profile_data','2020-04-06 20:37:32.447946'),(590,'third_party_auth','0014_auto_20171222_1233','2020-04-06 20:37:34.888823'),(591,'third_party_auth','0015_samlproviderconfig_archived','2020-04-06 20:37:35.760146'),(592,'third_party_auth','0016_auto_20180130_0938','2020-04-06 20:37:38.512363'),(593,'third_party_auth','0017_remove_icon_class_image_secondary_fields','2020-04-06 20:37:41.045962'),(594,'third_party_auth','0018_auto_20180327_1631','2020-04-06 20:37:43.567532'),(595,'third_party_auth','0019_consolidate_slug','2020-04-06 20:37:47.457258'),(596,'third_party_auth','0020_cleanup_slug_fields','2020-04-06 20:37:49.238742'),(597,'third_party_auth','0021_sso_id_verification','2020-04-06 20:37:52.895266'),(598,'third_party_auth','0022_auto_20181012_0307','2020-04-06 20:37:57.235375'),(599,'third_party_auth','0023_auto_20190418_2033','2020-04-06 20:38:02.229535'),(600,'third_party_auth','0024_fix_edit_disallowed','2020-04-06 20:38:06.746003'),(601,'third_party_auth','0025_auto_20200303_1448','2020-04-06 20:38:07.132741'),(602,'third_party_auth','0026_auto_20200401_1932','2020-04-06 20:38:08.450831'),(603,'thumbnail','0001_initial','2020-04-06 20:38:08.864301'),(604,'track','0001_initial','2020-04-06 20:38:09.283211'),(605,'track','0002_delete_trackinglog','2020-04-06 20:38:09.495519'),(606,'user_api','0001_initial','2020-04-06 20:38:15.653893'),(607,'user_api','0002_retirementstate_userretirementstatus','2020-04-06 20:38:21.050810'),(608,'user_api','0003_userretirementrequest','2020-04-06 20:38:22.342390'),(609,'user_api','0004_userretirementpartnerreportingstatus','2020-04-06 20:38:24.402941'),(610,'user_authn','0001_data__add_login_service','2020-04-06 20:38:25.113923'),(611,'util','0001_initial','2020-04-06 20:38:26.360368'),(612,'util','0002_data__default_rate_limit_config','2020-04-06 20:38:27.114203'),(613,'verified_track_content','0001_initial','2020-04-06 20:38:27.642339'),(614,'verified_track_content','0002_verifiedtrackcohortedcourse_verified_cohort_name','2020-04-06 20:38:28.321283'),(615,'verified_track_content','0003_migrateverifiedtrackcohortssetting','2020-04-06 20:38:29.732061'),(616,'verify_student','0001_initial','2020-04-06 20:38:47.060091'),(617,'verify_student','0002_auto_20151124_1024','2020-04-06 20:38:48.482063'),(618,'verify_student','0003_auto_20151113_1443','2020-04-06 20:38:49.665149'),(619,'verify_student','0004_delete_historical_records','2020-04-06 20:38:50.656931'),(620,'verify_student','0005_remove_deprecated_models','2020-04-06 20:38:57.624892'),(621,'verify_student','0006_ssoverification','2020-04-06 20:38:59.673867'),(622,'verify_student','0007_idverificationaggregate','2020-04-06 20:39:02.128994'),(623,'verify_student','0008_populate_idverificationaggregate','2020-04-06 20:39:02.797139'),(624,'verify_student','0009_remove_id_verification_aggregate','2020-04-06 20:39:04.690186'),(625,'verify_student','0010_manualverification','2020-04-06 20:39:06.451633'),(626,'verify_student','0011_add_fields_to_sspv','2020-04-06 20:39:08.700851'),(627,'verify_student','0012_sspverificationretryconfig','2020-04-06 20:39:09.961785'),(628,'video_config','0001_initial','2020-04-06 20:39:14.022566'),(629,'video_config','0002_coursevideotranscriptenabledflag_videotranscriptenabledflag','2020-04-06 20:39:16.552826'),(630,'video_config','0003_transcriptmigrationsetting','2020-04-06 20:39:17.769871'),(631,'video_config','0004_transcriptmigrationsetting_command_run','2020-04-06 20:39:18.505519'),(632,'video_config','0005_auto_20180719_0752','2020-04-06 20:39:19.577514'),(633,'video_config','0006_videothumbnailetting_updatedcoursevideos','2020-04-06 20:39:21.571416'),(634,'video_config','0007_videothumbnailsetting_offset','2020-04-06 20:39:22.318212'),(635,'video_config','0008_courseyoutubeblockedflag','2020-04-06 20:39:23.764958'),(636,'video_pipeline','0001_initial','2020-04-06 20:39:24.980309'),(637,'video_pipeline','0002_auto_20171114_0704','2020-04-06 20:39:25.973412'),(638,'video_pipeline','0003_coursevideouploadsenabledbydefault_videouploadsenabledbydefault','2020-04-06 20:39:28.496279'),(639,'waffle','0002_auto_20161201_0958','2020-04-06 20:39:28.598101'),(640,'waffle','0003_update_strings_for_i18n','2020-04-06 20:39:36.656562'),(641,'waffle_utils','0001_initial','2020-04-06 20:39:38.330992'),(642,'wiki','0001_initial','2020-04-06 20:40:19.489501'),(643,'wiki','0002_remove_article_subscription','2020-04-06 20:40:19.696481'),(644,'wiki','0003_ip_address_conv','2020-04-06 20:40:22.582697'),(645,'wiki','0004_increase_slug_size','2020-04-06 20:40:23.695685'),(646,'wiki','0005_remove_attachments_and_images','2020-04-06 20:40:29.397593'),(647,'wiki','0006_auto_20200110_1003','2020-04-06 20:40:30.451101'),(648,'workflow','0001_initial','2020-04-06 20:40:34.322969'),(649,'workflow','0002_remove_django_extensions','2020-04-06 20:40:34.523997'),(650,'workflow','0003_TeamWorkflows','2020-04-06 20:40:35.684411'),(651,'xapi','0001_initial','2020-04-06 20:40:36.964770'),(652,'xapi','0002_auto_20180726_0142','2020-04-06 20:40:37.292448'),(653,'xapi','0003_auto_20190807_1006','2020-04-06 20:40:39.522351'),(654,'xapi','0004_auto_20190830_0710','2020-04-06 20:40:40.261761'),(655,'xblock_django','0001_initial','2020-04-06 20:40:41.535648'),(656,'xblock_django','0002_auto_20160204_0809','2020-04-06 20:40:42.272236'),(657,'xblock_django','0003_add_new_config_models','2020-04-06 20:40:46.583292'),(658,'xblock_django','0004_delete_xblock_disable_config','2020-04-06 20:40:47.495129'),(659,'social_django','0002_add_related_name','2020-04-06 20:40:47.590159'),(660,'social_django','0003_alter_email_max_length','2020-04-06 20:40:47.652555'),(661,'social_django','0004_auto_20160423_0400','2020-04-06 20:40:47.720893'),(662,'social_django','0001_initial','2020-04-06 20:40:47.779375'),(663,'social_django','0005_auto_20160727_2333','2020-04-06 20:40:47.847920'),(664,'contentstore','0001_initial','2020-04-06 20:45:24.945007'),(665,'contentstore','0002_add_assets_page_flag','2020-04-06 20:45:28.264432'),(666,'contentstore','0003_remove_assets_page_flag','2020-04-06 20:45:30.873549'),(667,'contentstore','0004_remove_push_notification_configmodel_table','2020-04-06 20:45:31.963726'),(668,'course_creators','0001_initial','2020-04-06 20:45:33.371774'),(669,'tagging','0001_initial','2020-04-06 20:45:35.269834'),(670,'tagging','0002_auto_20170116_1541','2020-04-06 20:45:35.425120'),(671,'user_tasks','0001_initial','2020-04-06 20:45:39.598519'),(672,'user_tasks','0002_artifact_file_storage','2020-04-06 20:45:39.998208'),(673,'user_tasks','0003_url_max_length','2020-04-06 20:45:40.969168'),(674,'user_tasks','0004_url_textfield','2020-04-06 20:45:41.831214'),(675,'xblock_config','0001_initial','2020-04-06 20:45:43.001919'),(676,'xblock_config','0002_courseeditltifieldsenabledflag','2020-04-06 20:45:44.540675');
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
-- Table structure for table `djcelery_crontabschedule`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_crontabschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `minute` varchar(64) NOT NULL,
  `hour` varchar(64) NOT NULL,
  `day_of_week` varchar(64) NOT NULL,
  `day_of_month` varchar(64) NOT NULL,
  `month_of_year` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_crontabschedule`
--

LOCK TABLES `djcelery_crontabschedule` WRITE;
/*!40000 ALTER TABLE `djcelery_crontabschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_crontabschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_intervalschedule`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_intervalschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `every` int(11) NOT NULL,
  `period` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_intervalschedule`
--

LOCK TABLES `djcelery_intervalschedule` WRITE;
/*!40000 ALTER TABLE `djcelery_intervalschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_intervalschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_periodictask`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_periodictask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `task` varchar(200) NOT NULL,
  `args` longtext NOT NULL,
  `kwargs` longtext NOT NULL,
  `queue` varchar(200) DEFAULT NULL,
  `exchange` varchar(200) DEFAULT NULL,
  `routing_key` varchar(200) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime(6) DEFAULT NULL,
  `total_run_count` int(10) unsigned NOT NULL,
  `date_changed` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `crontab_id` int(11) DEFAULT NULL,
  `interval_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `djcelery_periodictas_crontab_id_75609bab_fk_djcelery_` (`crontab_id`),
  KEY `djcelery_periodictas_interval_id_b426ab02_fk_djcelery_` (`interval_id`),
  CONSTRAINT `djcelery_periodictas_crontab_id_75609bab_fk_djcelery_` FOREIGN KEY (`crontab_id`) REFERENCES `djcelery_crontabschedule` (`id`),
  CONSTRAINT `djcelery_periodictas_interval_id_b426ab02_fk_djcelery_` FOREIGN KEY (`interval_id`) REFERENCES `djcelery_intervalschedule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_periodictask`
--

LOCK TABLES `djcelery_periodictask` WRITE;
/*!40000 ALTER TABLE `djcelery_periodictask` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_periodictask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_periodictasks`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_periodictasks` (
  `ident` smallint(6) NOT NULL,
  `last_update` datetime(6) NOT NULL,
  PRIMARY KEY (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_periodictasks`
--

LOCK TABLES `djcelery_periodictasks` WRITE;
/*!40000 ALTER TABLE `djcelery_periodictasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_periodictasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_taskstate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_taskstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(64) NOT NULL,
  `task_id` varchar(36) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `tstamp` datetime(6) NOT NULL,
  `args` longtext,
  `kwargs` longtext,
  `eta` datetime(6) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `result` longtext,
  `traceback` longtext,
  `runtime` double DEFAULT NULL,
  `retries` int(11) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `worker_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `djcelery_taskstate_state_53543be4` (`state`),
  KEY `djcelery_taskstate_name_8af9eded` (`name`),
  KEY `djcelery_taskstate_tstamp_4c3f93a1` (`tstamp`),
  KEY `djcelery_taskstate_hidden_c3905e57` (`hidden`),
  KEY `djcelery_taskstate_worker_id_f7f57a05_fk_djcelery_workerstate_id` (`worker_id`),
  CONSTRAINT `djcelery_taskstate_worker_id_f7f57a05_fk_djcelery_workerstate_id` FOREIGN KEY (`worker_id`) REFERENCES `djcelery_workerstate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_taskstate`
--

LOCK TABLES `djcelery_taskstate` WRITE;
/*!40000 ALTER TABLE `djcelery_taskstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_taskstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_workerstate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_workerstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(255) NOT NULL,
  `last_heartbeat` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hostname` (`hostname`),
  KEY `djcelery_workerstate_last_heartbeat_4539b544` (`last_heartbeat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_workerstate`
--

LOCK TABLES `djcelery_workerstate` WRITE;
/*!40000 ALTER TABLE `djcelery_workerstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_workerstate` ENABLE KEYS */;
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
INSERT INTO `edx_when_contentdate` VALUES (1,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@48ecb924d7fe4b66a230137626bfa93e',1,1,'start'),(2,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@edx_introduction',2,1,'start'),(3,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@basic_questions',3,1,'start'),(4,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@chapter+block@9fca584977d04885bc911ea76a9ef29e',4,1,'start'),(5,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@chapter+block@1414ffd5143b4b508f739b563ab468b7',2,1,'start'),(6,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@logic_gate_problem',3,1,'start'),(7,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@700x_editmolB',3,1,'start'),(8,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@free_form_simulation',3,1,'start'),(9,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@simulations',2,1,'start'),(10,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@700x_proteinmake',3,1,'start'),(11,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@graded_simulations',3,1,'start'),(12,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@sequential+block@workflow',3,1,'start'),(13,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@html_07d547513285',3,1,'start'),(14,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@html+block@700x_pathways',3,1,'start'),(15,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@python_grader',3,1,'start'),(16,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@course+block@course',5,1,'start'),(17,'course-v1:edX+DemoX+Demo_Course','block-v1:edX+DemoX+Demo_Course+type@problem+block@Sample_Algebraic_Problem',3,1,'start');
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
INSERT INTO `edx_when_datepolicy` VALUES (1,'2020-04-06 20:48:32.650742','2020-04-06 20:48:32.650742','1978-02-05 00:00:00.000000',NULL),(2,'2020-04-06 20:48:32.655725','2020-04-06 20:48:32.655725','1970-01-01 05:00:00.000000',NULL),(3,'2020-04-06 20:48:32.732244','2020-04-06 20:48:32.732244','2013-02-05 00:00:00.000000',NULL),(4,'2020-04-06 20:48:32.798726','2020-04-06 20:48:32.798726','2970-01-01 05:00:00.000000',NULL),(5,'2020-04-06 20:48:32.864138','2020-04-06 20:48:32.864138','2013-02-05 05:00:00.000000',NULL);
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
-- Table structure for table `edx_zoom_launchlog`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edx_zoom_launchlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `managed` tinyint(1) NOT NULL,
  `first_access` datetime(6) NOT NULL,
  `last_access` datetime(6) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `edx_zoom_launchlog_user_id_location_1a925a87_uniq` (`user_id`,`location`),
  KEY `edx_zoom_launchlog_course_id_df466312` (`course_id`),
  KEY `edx_zoom_launchlog_managed_426683ea` (`managed`),
  KEY `edx_zoom_launchlog_first_access_f45fc5ee` (`first_access`),
  KEY `edx_zoom_launchlog_last_access_5c5d612f` (`last_access`),
  CONSTRAINT `edx_zoom_launchlog_user_id_fad15956_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edx_zoom_launchlog`
--

LOCK TABLES `edx_zoom_launchlog` WRITE;
/*!40000 ALTER TABLE `edx_zoom_launchlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `edx_zoom_launchlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edx_zoom_lticredential`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edx_zoom_lticredential` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `launch_url` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edx_zoom_lticredential`
--

LOCK TABLES `edx_zoom_lticredential` WRITE;
/*!40000 ALTER TABLE `edx_zoom_lticredential` DISABLE KEYS */;
/*!40000 ALTER TABLE `edx_zoom_lticredential` ENABLE KEYS */;
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
INSERT INTO `edxval_profile` VALUES (7,'audio_mp3'),(1,'desktop_mp4'),(2,'desktop_webm'),(6,'hls'),(3,'mobile_high'),(4,'mobile_low'),(5,'youtube');
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
-- Table structure for table `edxval_transcriptcredentials`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edxval_transcriptcredentials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `org` varchar(50) NOT NULL,
  `provider` varchar(50) NOT NULL,
  `api_key` longblob NOT NULL,
  `api_secret` longblob NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `edxval_transcriptcredentials_org_provider_7c5dbd2d_uniq` (`org`,`provider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edxval_transcriptcredentials`
--

LOCK TABLES `edxval_transcriptcredentials` WRITE;
/*!40000 ALTER TABLE `edxval_transcriptcredentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `edxval_transcriptcredentials` ENABLE KEYS */;
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
INSERT INTO `edxval_video` VALUES (1,'2020-04-06 20:48:18.698625','911b4654-a298-4d46-92f2-b0bff5521fcd','External Video',0,'external'),(2,'2020-04-06 20:48:18.897459','853adf44-3472-42d1-91b6-f4b0233fa6c5','External Video',0,'external'),(3,'2020-04-06 20:48:19.209156','f414d0bb-9ed7-46d0-ae8f-af5b49c56944','External Video',0,'external'),(4,'2020-04-06 20:48:19.385143','70e36a9c-f330-4f90-a543-151fb29f5205','External Video',0,'external'),(5,'2020-04-06 20:48:19.570773','7f1a548a-3b72-429c-95e6-454262b38264','External Video',0,'external'),(6,'2020-04-06 20:48:41.509287','383b3ed9-d8cd-4136-a429-3d134d9284ee','External Video',0,'external'),(7,'2020-04-06 20:48:41.627676','e3c181e7-ee4c-492b-8dd8-93fdf3540166','External Video',0,'external'),(8,'2020-04-06 20:48:41.912184','f561d41c-254c-4eeb-8cf3-15d98c1ada22','External Video',0,'external'),(9,'2020-04-06 20:48:42.357926','96755daf-2f55-49fd-9382-a3162358d722','External Video',0,'external');
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
INSERT INTO `edxval_videotranscript` VALUES (1,'2020-04-06 20:48:18.752516','2020-04-06 20:48:18.788546','video-transcripts/253801793cd34511b7d251258590a5ed.sjson','en','Custom','sjson',1),(2,'2020-04-06 20:48:18.980681','2020-04-06 20:48:19.078941','video-transcripts/35c95c112389474ab5fd15d1d1d50ddc.sjson','en','Custom','sjson',2),(3,'2020-04-06 20:48:19.250898','2020-04-06 20:48:19.290523','video-transcripts/7c44cc59f84144ccb1b8a2b0d5678205.sjson','en','Custom','sjson',3),(4,'2020-04-06 20:48:19.439118','2020-04-06 20:48:19.479810','video-transcripts/a169f79d8e1d429cb6c07e4cf28380ab.sjson','en','Custom','sjson',4),(5,'2020-04-06 20:48:19.619299','2020-04-06 20:48:19.669414','video-transcripts/67ebd03e2c3543c1a2ae64644c7dba0d.sjson','en','Custom','sjson',5),(6,'2020-04-06 20:48:41.703120','2020-04-06 20:48:41.767157','video-transcripts/ace40e58e12749a9b2b86dff11b3b834.sjson','en','Custom','sjson',7),(7,'2020-04-06 20:48:42.003736','2020-04-06 20:48:42.101729','video-transcripts/618a8936ab8e43e593919c4b959aa4fb.sjson','en','Custom','sjson',8),(8,'2020-04-06 20:48:42.396533','2020-04-06 20:48:42.435179','video-transcripts/adeecca77e5e41dc95ff384a8aa614b9.sjson','en','Custom','sjson',9);
/*!40000 ALTER TABLE `edxval_videotranscript` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_marketing_emailmarketingconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_marketing_emailmarketingconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `sailthru_key` varchar(32) NOT NULL,
  `sailthru_secret` varchar(32) NOT NULL,
  `sailthru_new_user_list` varchar(48) NOT NULL,
  `sailthru_retry_interval` int(11) NOT NULL,
  `sailthru_max_retries` int(11) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `sailthru_abandoned_cart_delay` int(11) NOT NULL,
  `sailthru_abandoned_cart_template` varchar(20) NOT NULL,
  `sailthru_content_cache_age` int(11) NOT NULL,
  `sailthru_enroll_cost` int(11) NOT NULL,
  `sailthru_enroll_template` varchar(20) NOT NULL,
  `sailthru_get_tags_from_sailthru` tinyint(1) NOT NULL,
  `sailthru_purchase_template` varchar(20) NOT NULL,
  `sailthru_upgrade_template` varchar(20) NOT NULL,
  `sailthru_lms_url_override` varchar(80) NOT NULL,
  `welcome_email_send_delay` int(11) NOT NULL,
  `user_registration_cookie_timeout_delay` double NOT NULL,
  `sailthru_welcome_template` varchar(20) NOT NULL,
  `sailthru_verification_failed_template` varchar(20) NOT NULL,
  `sailthru_verification_passed_template` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email_marketing_emai_changed_by_id_15ce753b_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `email_marketing_emai_changed_by_id_15ce753b_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_marketing_emailmarketingconfiguration`
--

LOCK TABLES `email_marketing_emailmarketingconfiguration` WRITE;
/*!40000 ALTER TABLE `email_marketing_emailmarketingconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_marketing_emailmarketingconfiguration` ENABLE KEYS */;
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
  `enterprise_customer_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_customer_id` (`enterprise_customer_id`),
  CONSTRAINT `enterprise_enrollmen_enterprise_customer__df17d9ff_fk_enterpris` FOREIGN KEY (`enterprise_customer_id`) REFERENCES `enterprise_enterprisecustomer` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_enrollmentnotificationemailtemplate`
--

LOCK TABLES `enterprise_enrollmentnotificationemailtemplate` WRITE;
/*!40000 ALTER TABLE `enterprise_enrollmentnotificationemailtemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_enrollmentnotificationemailtemplate` ENABLE KEYS */;
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
  PRIMARY KEY (`id`)
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
  `marked_done` tinyint(1) NOT NULL,
  `source_id` int(11) DEFAULT NULL,
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
  `active` tinyint(1) NOT NULL,
  `site_id` int(11) NOT NULL,
  `enable_data_sharing_consent` tinyint(1) NOT NULL,
  `enforce_data_sharing_consent` varchar(25) NOT NULL,
  `enable_audit_enrollment` tinyint(1) NOT NULL,
  `enable_audit_data_reporting` tinyint(1) NOT NULL,
  `replace_sensitive_sso_username` tinyint(1) NOT NULL,
  `hide_course_original_price` tinyint(1) NOT NULL,
  `slug` varchar(30) NOT NULL,
  `country` varchar(2) DEFAULT NULL,
  `enable_autocohorting` tinyint(1) NOT NULL,
  `customer_type_id` int(11) NOT NULL,
  `enable_portal_code_management_screen` tinyint(1) NOT NULL,
  `enable_learner_portal` tinyint(1) NOT NULL,
  `enable_portal_reporting_config_screen` tinyint(1) NOT NULL,
  `contact_email` varchar(254) DEFAULT NULL,
  `enable_portal_subscription_management_screen` tinyint(1) NOT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `enterprise_enterprisecustomer_slug_80411f46_uniq` (`slug`),
  KEY `enterprise_enterprisecustomer_site_id_947ed084_fk_django_site_id` (`site_id`),
  KEY `enterprise_enterpris_customer_type_id_4b1ee315_fk_enterpris` (`customer_type_id`),
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
  `banner_background_color` varchar(7) DEFAULT NULL,
  `banner_border_color` varchar(7) DEFAULT NULL,
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
  `enterprise_customer_id` char(32) NOT NULL,
  `content_filter` longtext,
  `title` varchar(255) NOT NULL,
  `enabled_course_modes` longtext NOT NULL,
  `publish_audit_enrollment_urls` tinyint(1) NOT NULL,
  `enterprise_catalog_query_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `enterprise_enterpris_enterprise_customer__3b4660ad_fk_enterpris` (`enterprise_customer_id`),
  KEY `enterprise_enterpris_enterprise_catalog_q_aa53eb7d_fk_enterpris` (`enterprise_catalog_query_id`),
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `provider_id` (`provider_id`),
  UNIQUE KEY `enterprise_customer_id` (`enterprise_customer_id`),
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
  `active` tinyint(1) NOT NULL,
  `delivery_method` varchar(20) NOT NULL,
  `email` longtext NOT NULL,
  `frequency` varchar(20) NOT NULL,
  `day_of_month` smallint(6) DEFAULT NULL,
  `day_of_week` smallint(6) DEFAULT NULL,
  `hour_of_day` smallint(6) NOT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  `sftp_file_path` varchar(256) DEFAULT NULL,
  `sftp_hostname` varchar(256) DEFAULT NULL,
  `sftp_port` int(10) unsigned,
  `sftp_username` varchar(256) DEFAULT NULL,
  `decrypted_password` longblob,
  `decrypted_sftp_password` longblob,
  `data_type` varchar(20) NOT NULL,
  `report_type` varchar(20) NOT NULL,
  `pgp_encryption_key` longtext,
  `uuid` char(32) NOT NULL,
  `include_date` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enterprise_enterprisecus_uuid_9df3c307_uniq` (`uuid`),
  KEY `enterprise_enterprisecustom_enterprise_customer_id_d5b55543` (`enterprise_customer_id`),
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
INSERT INTO `enterprise_enterprisecustomertype` VALUES (1,'2020-04-06 20:24:43.216328','2020-04-06 20:24:43.216328','Enterprise');
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
  `enterprise_customer_id` char(32) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `linked` tinyint(1) NOT NULL,
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
INSERT INTO `enterprise_enterpriseenrollmentsource` VALUES (1,'2020-04-06 20:29:19.979048','2020-04-06 20:29:19.979048','Enterprise Enrollment URL','enrollment_url'),(2,'2020-04-06 20:29:19.987428','2020-04-06 20:29:19.987428','Manual Enterprise Enrollment','manual'),(3,'2020-04-06 20:29:19.990415','2020-04-06 20:29:22.480416','Enterprise User Enrollment Background Task','enrollment_task'),(4,'2020-04-06 20:29:19.993428','2020-04-06 20:29:19.993428','Enterprise Offer Redemption','offer_redemption'),(5,'2020-04-06 20:29:19.995878','2020-04-06 20:29:19.995878','Enterprise API Enrollment','enterprise_api'),(6,'2020-04-06 20:29:22.973247','2020-04-06 20:29:22.973247','Enterprise management command enrollment','management_command');
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
INSERT INTO `enterprise_enterprisefeaturerole` VALUES (1,'2020-04-06 20:24:53.836635','2020-04-06 20:24:53.836635','catalog_admin',NULL),(2,'2020-04-06 20:24:53.841927','2020-04-06 20:24:53.841927','dashboard_admin',NULL),(3,'2020-04-06 20:24:53.844216','2020-04-06 20:24:53.844216','enrollment_api_admin',NULL),(4,'2020-04-06 20:29:02.541659','2020-04-06 20:29:02.541659','reporting_config_admin',NULL);
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
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `enterprise_customer_id` char(32) DEFAULT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
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
  `history_type` varchar(1) NOT NULL,
  `enterprise_customer_user_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `marked_done` tinyint(1) NOT NULL,
  `source_id` int(11) DEFAULT NULL,
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
  `active` tinyint(1) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `enable_data_sharing_consent` tinyint(1) NOT NULL,
  `enforce_data_sharing_consent` varchar(25) NOT NULL,
  `enable_audit_enrollment` tinyint(1) NOT NULL,
  `enable_audit_data_reporting` tinyint(1) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `replace_sensitive_sso_username` tinyint(1) NOT NULL,
  `hide_course_original_price` tinyint(1) NOT NULL,
  `slug` varchar(30) NOT NULL,
  `country` varchar(2) DEFAULT NULL,
  `enable_autocohorting` tinyint(1) NOT NULL,
  `customer_type_id` int(11),
  `enable_portal_code_management_screen` tinyint(1) NOT NULL,
  `enable_learner_portal` tinyint(1) NOT NULL,
  `enable_portal_reporting_config_screen` tinyint(1) NOT NULL,
  `contact_email` varchar(254) DEFAULT NULL,
  `enable_portal_subscription_management_screen` tinyint(1) NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `enterprise_historica_history_user_id_bbd9b0d6_fk_auth_user` (`history_user_id`),
  KEY `enterprise_historicalenterprisecustomer_uuid_75c3528e` (`uuid`),
  KEY `enterprise_historicalenterprisecustomer_site_id_2463b5d7` (`site_id`),
  KEY `enterprise_historicalenterprisecustomer_slug_04622dd4` (`slug`),
  KEY `enterprise_historicalenterp_customer_type_id_8fbc8526` (`customer_type_id`),
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
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_type` varchar(1) NOT NULL,
  `enterprise_customer_id` char(32) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `content_filter` longtext,
  `title` varchar(255) NOT NULL,
  `enabled_course_modes` longtext NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `publish_audit_enrollment_urls` tinyint(1) NOT NULL,
  `enterprise_catalog_query_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `enterprise_historica_history_user_id_31eab231_fk_auth_user` (`history_user_id`),
  KEY `enterprise_historicalenterprisecustomercatalog_uuid_42403101` (`uuid`),
  KEY `enterprise_historicalenterp_enterprise_customer_id_664f4480` (`enterprise_customer_id`),
  KEY `enterprise_historicalenterp_enterprise_catalog_query_id_bf435a3a` (`enterprise_catalog_query_id`),
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
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `discount_percentage` decimal(8,5) NOT NULL,
  `sales_force_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `enterprise_historica_history_user_id_894ad7d0_fk_auth_user` (`history_user_id`),
  KEY `enterprise_historicalpendingenrollment_id_27077b0b` (`id`),
  KEY `enterprise_historicalpendingenrollment_user_id_97ded265` (`user_id`),
  KEY `enterprise_historicalpendingenrollment_source_id_3a208cd2` (`source_id`),
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
  KEY `enterprise_historicalpendin_user_email_88c478b4` (`user_email`),
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
  `user_id` int(11) NOT NULL,
  `cohort_name` varchar(255) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `discount_percentage` decimal(8,5) NOT NULL,
  `sales_force_id` varchar(255) DEFAULT NULL,
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
  UNIQUE KEY `enterprise_pendingenterp_user_email_5440d1d3_uniq` (`user_email`),
  KEY `enterprise_pendingen_enterprise_customer__a858ce2d_fk_enterpris` (`enterprise_customer_id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_systemwideenterpriserole`
--

LOCK TABLES `enterprise_systemwideenterpriserole` WRITE;
/*!40000 ALTER TABLE `enterprise_systemwideenterpriserole` DISABLE KEYS */;
INSERT INTO `enterprise_systemwideenterpriserole` VALUES (1,'2020-04-06 20:24:50.412075','2020-04-06 20:24:50.412075','enterprise_admin',NULL),(2,'2020-04-06 20:24:50.417847','2020-04-06 20:24:50.417847','enterprise_learner',NULL),(3,'2020-04-06 20:24:54.582279','2020-04-06 20:24:54.582279','enterprise_openedx_operator',NULL);
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
  PRIMARY KEY (`id`),
  KEY `enterprise_systemwid_role_id_bc7092f0_fk_enterpris` (`role_id`),
  KEY `enterprise_systemwid_user_id_e890aef2_fk_auth_user` (`user_id`),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiments_experimentdata`
--

LOCK TABLES `experiments_experimentdata` WRITE;
/*!40000 ALTER TABLE `experiments_experimentdata` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_user_ids_externalidtype`
--

LOCK TABLES `external_user_ids_externalidtype` WRITE;
/*!40000 ALTER TABLE `external_user_ids_externalidtype` DISABLE KEYS */;
INSERT INTO `external_user_ids_externalidtype` VALUES (1,'2020-04-06 20:31:16.403857','2020-04-06 20:31:16.403857','mb_coaching','MicroBachelors Coaching');
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
-- Table structure for table `lx_pathway_plugin_pathway`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lx_pathway_plugin_pathway` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(32) NOT NULL,
  `draft_data` longtext NOT NULL,
  `published_data` longtext NOT NULL,
  `owner_group_id` int(11) DEFAULT NULL,
  `owner_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `lx_pathway_plugin_pa_owner_group_id_b20ab5de_fk_auth_grou` (`owner_group_id`),
  KEY `lx_pathway_plugin_pathway_owner_user_id_bd987df6_fk_auth_user_id` (`owner_user_id`),
  CONSTRAINT `lx_pathway_plugin_pa_owner_group_id_b20ab5de_fk_auth_grou` FOREIGN KEY (`owner_group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `lx_pathway_plugin_pathway_owner_user_id_bd987df6_fk_auth_user_id` FOREIGN KEY (`owner_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lx_pathway_plugin_pathway`
--

LOCK TABLES `lx_pathway_plugin_pathway` WRITE;
/*!40000 ALTER TABLE `lx_pathway_plugin_pathway` DISABLE KEYS */;
/*!40000 ALTER TABLE `lx_pathway_plugin_pathway` ENABLE KEYS */;
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
INSERT INTO `milestones_milestonerelationshiptype` VALUES (1,'2020-04-06 20:32:25.997516','2020-04-06 20:32:25.997516','fulfills','Autogenerated milestone relationship type \"fulfills\"',1),(2,'2020-04-06 20:32:26.007000','2020-04-06 20:32:26.007000','requires','Autogenerated milestone relationship type \"requires\"',1);
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
  UNIQUE KEY `oauth2_provider_accesstoken_token_8af090f8_uniq` (`token`),
  UNIQUE KEY `source_refresh_token_id` (`source_refresh_token_id`),
  KEY `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id` (`user_id`),
  KEY `oauth2_provider_accesstoken_application_id_b22886e1_fk` (`application_id`),
  CONSTRAINT `oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr` FOREIGN KEY (`source_refresh_token_id`) REFERENCES `oauth2_provider_refreshtoken` (`id`),
  CONSTRAINT `oauth2_provider_accesstoken_application_id_b22886e1_fk` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
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
  KEY `oauth2_provider_application_client_secret_53133678` (`client_secret`),
  KEY `oauth2_provider_application_user_id_79829054_fk_auth_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_application_user_id_79829054_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_application`
--

LOCK TABLES `oauth2_provider_application` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_application` DISABLE KEYS */;
INSERT INTO `oauth2_provider_application` VALUES (1,'login-service-client-id','','public','password','1A3inqwBllp1wYBohpSnYv62169UbfoXPjNCFHgIG52ikLeLNGqfmWP1jNUSbdH9pKkOSbFciT655XgrZO7qvEug5YrnxMK05KjLX17jx7nVMl0xvqMF1dYiZfRwmGrj','Login Service for JWT Cookies',2,0,'2020-04-06 20:38:25.064155','2020-04-06 20:38:25.064195'),(2,'B9TfWz3glZl9r3oIlYO13qH1sprKf4cGmD5hlw4E','','confidential','client-credentials','d2wTpT3bjZCh3UlOuQDdZLuQiooCEXvAHKZ5Ztc1Ozs4SZ26GHt09BWWroqU010Ddwe9yvjP8XC38ww91S4sEqLiN6HhL0L6ZAxJlIFIOmXYDqh20p9TU077IeGpsPYL','retirement',9,0,'2020-04-06 21:00:01.396606','2020-04-06 21:00:01.396650');
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth2_provider_grant_code_49ab4ddf_uniq` (`code`),
  KEY `oauth2_provider_grant_application_id_81923564_fk` (`application_id`),
  KEY `oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_grant_application_id_81923564_fk` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
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
  KEY `oauth2_provider_refreshtoken_application_id_2d1c311b_fk` (`application_id`),
  KEY `oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`),
  CONSTRAINT `oauth2_provider_refreshtoken_application_id_2d1c311b_fk` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_dispatch_applicationaccess`
--

LOCK TABLES `oauth_dispatch_applicationaccess` WRITE;
/*!40000 ALTER TABLE `oauth_dispatch_applicationaccess` DISABLE KEYS */;
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
  KEY `organizations_organization_name_71edc74b` (`name`),
  KEY `organizations_organization_short_name_ef338963` (`short_name`)
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
-- Table structure for table `problem_builder_answer`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problem_builder_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  `student_input` longtext NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `modified_on` datetime(6) NOT NULL,
  `course_key` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `problem_builder_answer_student_id_course_key_name_eaac343f_uniq` (`student_id`,`course_key`,`name`),
  KEY `problem_builder_answer_name_af0a2a0d` (`name`),
  KEY `problem_builder_answer_student_id_8b0fa669` (`student_id`),
  KEY `problem_builder_answer_course_key_41ccad30` (`course_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem_builder_answer`
--

LOCK TABLES `problem_builder_answer` WRITE;
/*!40000 ALTER TABLE `problem_builder_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `problem_builder_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problem_builder_share`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problem_builder_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submission_uid` varchar(32) NOT NULL,
  `block_id` varchar(255) NOT NULL,
  `notified` tinyint(1) NOT NULL,
  `shared_by_id` int(11) NOT NULL,
  `shared_with_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `problem_builder_share_shared_by_id_shared_with_812f19a2_uniq` (`shared_by_id`,`shared_with_id`,`block_id`),
  KEY `problem_builder_share_shared_with_id_acab4570_fk_auth_user_id` (`shared_with_id`),
  KEY `problem_builder_share_block_id_6f0dc5f7` (`block_id`),
  KEY `problem_builder_share_notified_ad79eba9` (`notified`),
  CONSTRAINT `problem_builder_share_shared_by_id_0b75382c_fk_auth_user_id` FOREIGN KEY (`shared_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `problem_builder_share_shared_with_id_acab4570_fk_auth_user_id` FOREIGN KEY (`shared_with_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem_builder_share`
--

LOCK TABLES `problem_builder_share` WRITE;
/*!40000 ALTER TABLE `problem_builder_share` DISABLE KEYS */;
/*!40000 ALTER TABLE `problem_builder_share` ENABLE KEYS */;
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
  `last_poll_timestamp` datetime(6) DEFAULT NULL,
  `last_poll_ipaddr` varchar(32) DEFAULT NULL,
  `attempt_code` varchar(255) DEFAULT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `allowed_time_limit_mins` int(11) DEFAULT NULL,
  `status` varchar(64) NOT NULL,
  `taking_as_proctored` tinyint(1) NOT NULL,
  `is_sample_attempt` tinyint(1) NOT NULL,
  `student_name` varchar(255) NOT NULL,
  `review_policy_id` int(11) DEFAULT NULL,
  `proctored_exam_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_status_acknowledged` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `proctoring_proctoredexam_user_id_proctored_exam_i_1464b206_uniq` (`user_id`,`proctored_exam_id`),
  KEY `proctoring_proctored_proctored_exam_id_0732c688_fk_proctorin` (`proctored_exam_id`),
  KEY `proctoring_proctoredexamstudentattempt_attempt_code_b10ad854` (`attempt_code`),
  KEY `proctoring_proctoredexamstudentattempt_external_id_9c302af3` (`external_id`),
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
  `student_name` varchar(255) NOT NULL,
  `review_policy_id` int(11) DEFAULT NULL,
  `last_poll_timestamp` datetime(6) DEFAULT NULL,
  `last_poll_ipaddr` varchar(32) DEFAULT NULL,
  `proctored_exam_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
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
-- Table structure for table `programs_customprogramsconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programs_customprogramsconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `arguments` longtext NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `programs_customprogr_changed_by_id_ae95c36c_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `programs_customprogr_changed_by_id_ae95c36c_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programs_customprogramsconfig`
--

LOCK TABLES `programs_customprogramsconfig` WRITE;
/*!40000 ALTER TABLE `programs_customprogramsconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `programs_customprogramsconfig` ENABLE KEYS */;
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
INSERT INTO `programs_programsapiconfig` VALUES (1,'2020-04-06 21:00:09.578257',1,NULL,'');
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
  `sapsf_base_url` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `enterprise_customer_id` char(32) NOT NULL,
  `sapsf_company_id` varchar(255) NOT NULL,
  `sapsf_user_id` varchar(255) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  `transmission_chunk_size` int(11) NOT NULL,
  `additional_locales` longtext NOT NULL,
  `show_course_price` tinyint(1) NOT NULL,
  `channel_worker_username` varchar(255) DEFAULT NULL,
  `catalogs_to_transmit` longtext,
  `transmit_total_hours` tinyint(1) NOT NULL,
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
  `provider_id` varchar(100) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `search_student_api_path` varchar(255) NOT NULL,
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
  `enterprise_course_enrollment_id` int(10) unsigned NOT NULL,
  `sapsf_user_id` varchar(255) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `course_completed` tinyint(1) NOT NULL,
  `completed_timestamp` bigint(20) NOT NULL,
  `instructor_name` varchar(255) NOT NULL,
  `grade` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `error_message` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `total_hours` double DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules_historicalschedule`
--

LOCK TABLES `schedules_historicalschedule` WRITE;
/*!40000 ALTER TABLE `schedules_historicalschedule` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules_schedule`
--

LOCK TABLES `schedules_schedule` WRITE;
/*!40000 ALTER TABLE `schedules_schedule` DISABLE KEYS */;
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
  `create_schedules` tinyint(1) NOT NULL,
  `enqueue_recurring_nudge` tinyint(1) NOT NULL,
  `deliver_recurring_nudge` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `site_id` int(11) NOT NULL,
  `deliver_upgrade_reminder` tinyint(1) NOT NULL,
  `enqueue_upgrade_reminder` tinyint(1) NOT NULL,
  `deliver_course_update` tinyint(1) NOT NULL,
  `enqueue_course_update` tinyint(1) NOT NULL,
  `hold_back_ratio` double NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules_scheduleexperience`
--

LOCK TABLES `schedules_scheduleexperience` WRITE;
/*!40000 ALTER TABLE `schedules_scheduleexperience` DISABLE KEYS */;
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
-- Table structure for table `shoppingcart_certificateitem`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_certificateitem` (
  `orderitem_ptr_id` int(11) NOT NULL,
  `course_id` varchar(128) NOT NULL,
  `mode` varchar(50) NOT NULL,
  `course_enrollment_id` int(11) NOT NULL,
  PRIMARY KEY (`orderitem_ptr_id`),
  KEY `shoppingcart_certifi_course_enrollment_id_f2966a98_fk_student_c` (`course_enrollment_id`),
  KEY `shoppingcart_certificateitem_course_id_a2a7b56c` (`course_id`),
  KEY `shoppingcart_certificateitem_mode_0b5e8a8c` (`mode`),
  CONSTRAINT `shoppingcart_certifi_course_enrollment_id_f2966a98_fk_student_c` FOREIGN KEY (`course_enrollment_id`) REFERENCES `student_courseenrollment` (`id`),
  CONSTRAINT `shoppingcart_certifi_orderitem_ptr_id_7fee9beb_fk_shoppingc` FOREIGN KEY (`orderitem_ptr_id`) REFERENCES `shoppingcart_orderitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_certificateitem`
--

LOCK TABLES `shoppingcart_certificateitem` WRITE;
/*!40000 ALTER TABLE `shoppingcart_certificateitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_certificateitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_coupon`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `course_id` varchar(255) NOT NULL,
  `percentage_discount` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `expiration_date` datetime(6) DEFAULT NULL,
  `created_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shoppingcart_coupon_created_by_id_1d622c7e_fk_auth_user_id` (`created_by_id`),
  KEY `shoppingcart_coupon_code_67dfa4a3` (`code`),
  CONSTRAINT `shoppingcart_coupon_created_by_id_1d622c7e_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_coupon`
--

LOCK TABLES `shoppingcart_coupon` WRITE;
/*!40000 ALTER TABLE `shoppingcart_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_couponredemption`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_couponredemption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shoppingcart_couponr_coupon_id_d2906e5b_fk_shoppingc` (`coupon_id`),
  KEY `shoppingcart_couponr_order_id_ef555f0f_fk_shoppingc` (`order_id`),
  KEY `shoppingcart_couponredemption_user_id_bbac8149_fk_auth_user_id` (`user_id`),
  CONSTRAINT `shoppingcart_couponr_coupon_id_d2906e5b_fk_shoppingc` FOREIGN KEY (`coupon_id`) REFERENCES `shoppingcart_coupon` (`id`),
  CONSTRAINT `shoppingcart_couponr_order_id_ef555f0f_fk_shoppingc` FOREIGN KEY (`order_id`) REFERENCES `shoppingcart_order` (`id`),
  CONSTRAINT `shoppingcart_couponredemption_user_id_bbac8149_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_couponredemption`
--

LOCK TABLES `shoppingcart_couponredemption` WRITE;
/*!40000 ALTER TABLE `shoppingcart_couponredemption` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_couponredemption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_courseregcodeitem`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_courseregcodeitem` (
  `orderitem_ptr_id` int(11) NOT NULL,
  `course_id` varchar(128) NOT NULL,
  `mode` varchar(50) NOT NULL,
  PRIMARY KEY (`orderitem_ptr_id`),
  KEY `shoppingcart_courseregcodeitem_course_id_7c18f431` (`course_id`),
  KEY `shoppingcart_courseregcodeitem_mode_279aa3a8` (`mode`),
  CONSTRAINT `shoppingcart_courser_orderitem_ptr_id_e35a50e9_fk_shoppingc` FOREIGN KEY (`orderitem_ptr_id`) REFERENCES `shoppingcart_orderitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_courseregcodeitem`
--

LOCK TABLES `shoppingcart_courseregcodeitem` WRITE;
/*!40000 ALTER TABLE `shoppingcart_courseregcodeitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_courseregcodeitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_courseregcodeitemannotation`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_courseregcodeitemannotation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(128) NOT NULL,
  `annotation` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_courseregcodeitemannotation`
--

LOCK TABLES `shoppingcart_courseregcodeitemannotation` WRITE;
/*!40000 ALTER TABLE `shoppingcart_courseregcodeitemannotation` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_courseregcodeitemannotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_courseregistrationcode`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_courseregistrationcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `mode_slug` varchar(100) DEFAULT NULL,
  `is_valid` tinyint(1) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `invoice_item_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `shoppingcart_courser_created_by_id_4a0a3481_fk_auth_user` (`created_by_id`),
  KEY `shoppingcart_courseregistrationcode_course_id_ebec7eb9` (`course_id`),
  KEY `shoppingcart_courser_invoice_id_3f58e05e_fk_shoppingc` (`invoice_id`),
  KEY `shoppingcart_courser_order_id_18d73357_fk_shoppingc` (`order_id`),
  KEY `shoppingcart_courser_invoice_item_id_2bd62f44_fk_shoppingc` (`invoice_item_id`),
  CONSTRAINT `shoppingcart_courser_created_by_id_4a0a3481_fk_auth_user` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `shoppingcart_courser_invoice_id_3f58e05e_fk_shoppingc` FOREIGN KEY (`invoice_id`) REFERENCES `shoppingcart_invoice` (`id`),
  CONSTRAINT `shoppingcart_courser_invoice_item_id_2bd62f44_fk_shoppingc` FOREIGN KEY (`invoice_item_id`) REFERENCES `shoppingcart_courseregistrationcodeinvoiceitem` (`invoiceitem_ptr_id`),
  CONSTRAINT `shoppingcart_courser_order_id_18d73357_fk_shoppingc` FOREIGN KEY (`order_id`) REFERENCES `shoppingcart_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_courseregistrationcode`
--

LOCK TABLES `shoppingcart_courseregistrationcode` WRITE;
/*!40000 ALTER TABLE `shoppingcart_courseregistrationcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_courseregistrationcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_courseregistrationcodeinvoiceitem`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_courseregistrationcodeinvoiceitem` (
  `invoiceitem_ptr_id` int(11) NOT NULL,
  `course_id` varchar(128) NOT NULL,
  PRIMARY KEY (`invoiceitem_ptr_id`),
  KEY `shoppingcart_courseregistra_course_id_e8c94aec` (`course_id`),
  CONSTRAINT `shoppingcart_courser_invoiceitem_ptr_id_59b1f26d_fk_shoppingc` FOREIGN KEY (`invoiceitem_ptr_id`) REFERENCES `shoppingcart_invoiceitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_courseregistrationcodeinvoiceitem`
--

LOCK TABLES `shoppingcart_courseregistrationcodeinvoiceitem` WRITE;
/*!40000 ALTER TABLE `shoppingcart_courseregistrationcodeinvoiceitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_courseregistrationcodeinvoiceitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_donation`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_donation` (
  `orderitem_ptr_id` int(11) NOT NULL,
  `donation_type` varchar(32) NOT NULL,
  `course_id` varchar(255) NOT NULL,
  PRIMARY KEY (`orderitem_ptr_id`),
  KEY `shoppingcart_donation_course_id_e0c7203c` (`course_id`),
  CONSTRAINT `shoppingcart_donatio_orderitem_ptr_id_edf717c8_fk_shoppingc` FOREIGN KEY (`orderitem_ptr_id`) REFERENCES `shoppingcart_orderitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_donation`
--

LOCK TABLES `shoppingcart_donation` WRITE;
/*!40000 ALTER TABLE `shoppingcart_donation` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_donation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_donationconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_donationconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shoppingcart_donatio_changed_by_id_154b1cbe_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `shoppingcart_donatio_changed_by_id_154b1cbe_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_donationconfiguration`
--

LOCK TABLES `shoppingcart_donationconfiguration` WRITE;
/*!40000 ALTER TABLE `shoppingcart_donationconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_donationconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_invoice`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_contact_name` varchar(255) NOT NULL,
  `company_contact_email` varchar(255) NOT NULL,
  `recipient_name` varchar(255) NOT NULL,
  `recipient_email` varchar(255) NOT NULL,
  `address_line_1` varchar(255) NOT NULL,
  `address_line_2` varchar(255) DEFAULT NULL,
  `address_line_3` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(15) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `total_amount` double NOT NULL,
  `course_id` varchar(255) NOT NULL,
  `internal_reference` varchar(255) DEFAULT NULL,
  `customer_reference_number` varchar(63) DEFAULT NULL,
  `is_valid` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shoppingcart_invoice_company_name_4d19b1d3` (`company_name`),
  KEY `shoppingcart_invoice_course_id_eaefd2e0` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_invoice`
--

LOCK TABLES `shoppingcart_invoice` WRITE;
/*!40000 ALTER TABLE `shoppingcart_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_invoicehistory`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_invoicehistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime(6) NOT NULL,
  `snapshot` longtext NOT NULL,
  `invoice_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shoppingcart_invoice_invoice_id_d53805cc_fk_shoppingc` (`invoice_id`),
  KEY `shoppingcart_invoicehistory_timestamp_61c10fc3` (`timestamp`),
  CONSTRAINT `shoppingcart_invoice_invoice_id_d53805cc_fk_shoppingc` FOREIGN KEY (`invoice_id`) REFERENCES `shoppingcart_invoice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_invoicehistory`
--

LOCK TABLES `shoppingcart_invoicehistory` WRITE;
/*!40000 ALTER TABLE `shoppingcart_invoicehistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_invoicehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_invoiceitem`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_invoiceitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `qty` int(11) NOT NULL,
  `unit_price` decimal(30,2) NOT NULL,
  `currency` varchar(8) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shoppingcart_invoice_invoice_id_0c1d1f5f_fk_shoppingc` (`invoice_id`),
  CONSTRAINT `shoppingcart_invoice_invoice_id_0c1d1f5f_fk_shoppingc` FOREIGN KEY (`invoice_id`) REFERENCES `shoppingcart_invoice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_invoiceitem`
--

LOCK TABLES `shoppingcart_invoiceitem` WRITE;
/*!40000 ALTER TABLE `shoppingcart_invoiceitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_invoiceitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_invoicetransaction`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_invoicetransaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `amount` decimal(30,2) NOT NULL,
  `currency` varchar(8) NOT NULL,
  `comments` longtext,
  `status` varchar(32) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `last_modified_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shoppingcart_invoice_created_by_id_89f3faae_fk_auth_user` (`created_by_id`),
  KEY `shoppingcart_invoice_invoice_id_37da939f_fk_shoppingc` (`invoice_id`),
  KEY `shoppingcart_invoice_last_modified_by_id_6957893b_fk_auth_user` (`last_modified_by_id`),
  CONSTRAINT `shoppingcart_invoice_created_by_id_89f3faae_fk_auth_user` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `shoppingcart_invoice_invoice_id_37da939f_fk_shoppingc` FOREIGN KEY (`invoice_id`) REFERENCES `shoppingcart_invoice` (`id`),
  CONSTRAINT `shoppingcart_invoice_last_modified_by_id_6957893b_fk_auth_user` FOREIGN KEY (`last_modified_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_invoicetransaction`
--

LOCK TABLES `shoppingcart_invoicetransaction` WRITE;
/*!40000 ALTER TABLE `shoppingcart_invoicetransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_invoicetransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_order`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency` varchar(8) NOT NULL,
  `status` varchar(32) NOT NULL,
  `purchase_time` datetime(6) DEFAULT NULL,
  `refunded_time` datetime(6) DEFAULT NULL,
  `bill_to_first` varchar(64) NOT NULL,
  `bill_to_last` varchar(64) NOT NULL,
  `bill_to_street1` varchar(128) NOT NULL,
  `bill_to_street2` varchar(128) NOT NULL,
  `bill_to_city` varchar(64) NOT NULL,
  `bill_to_state` varchar(8) NOT NULL,
  `bill_to_postalcode` varchar(16) NOT NULL,
  `bill_to_country` varchar(64) NOT NULL,
  `bill_to_ccnum` varchar(8) NOT NULL,
  `bill_to_cardtype` varchar(32) NOT NULL,
  `processor_reply_dump` longtext NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_contact_name` varchar(255) DEFAULT NULL,
  `company_contact_email` varchar(255) DEFAULT NULL,
  `recipient_name` varchar(255) DEFAULT NULL,
  `recipient_email` varchar(255) DEFAULT NULL,
  `customer_reference_number` varchar(63) DEFAULT NULL,
  `order_type` varchar(32) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shoppingcart_order_user_id_ca2398bc_fk_auth_user_id` (`user_id`),
  CONSTRAINT `shoppingcart_order_user_id_ca2398bc_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_order`
--

LOCK TABLES `shoppingcart_order` WRITE;
/*!40000 ALTER TABLE `shoppingcart_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_orderitem`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `status` varchar(32) NOT NULL,
  `qty` int(11) NOT NULL,
  `unit_cost` decimal(30,2) NOT NULL,
  `list_price` decimal(30,2) DEFAULT NULL,
  `line_desc` varchar(1024) NOT NULL,
  `currency` varchar(8) NOT NULL,
  `fulfilled_time` datetime(6) DEFAULT NULL,
  `refund_requested_time` datetime(6) DEFAULT NULL,
  `service_fee` decimal(30,2) NOT NULL,
  `report_comments` longtext NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shoppingcart_orderitem_status_f6dfbdae` (`status`),
  KEY `shoppingcart_orderitem_fulfilled_time_336eded2` (`fulfilled_time`),
  KEY `shoppingcart_orderitem_refund_requested_time_36e52146` (`refund_requested_time`),
  KEY `shoppingcart_orderit_order_id_063915e1_fk_shoppingc` (`order_id`),
  KEY `shoppingcart_orderitem_user_id_93073a67_fk_auth_user_id` (`user_id`),
  CONSTRAINT `shoppingcart_orderit_order_id_063915e1_fk_shoppingc` FOREIGN KEY (`order_id`) REFERENCES `shoppingcart_order` (`id`),
  CONSTRAINT `shoppingcart_orderitem_user_id_93073a67_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_orderitem`
--

LOCK TABLES `shoppingcart_orderitem` WRITE;
/*!40000 ALTER TABLE `shoppingcart_orderitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_paidcourseregistration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_paidcourseregistration` (
  `orderitem_ptr_id` int(11) NOT NULL,
  `course_id` varchar(128) NOT NULL,
  `mode` varchar(50) NOT NULL,
  `course_enrollment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderitem_ptr_id`),
  KEY `shoppingcart_paidcou_course_enrollment_id_853e3ed0_fk_student_c` (`course_enrollment_id`),
  KEY `shoppingcart_paidcourseregistration_course_id_33b51281` (`course_id`),
  KEY `shoppingcart_paidcourseregistration_mode_8be64323` (`mode`),
  CONSTRAINT `shoppingcart_paidcou_course_enrollment_id_853e3ed0_fk_student_c` FOREIGN KEY (`course_enrollment_id`) REFERENCES `student_courseenrollment` (`id`),
  CONSTRAINT `shoppingcart_paidcou_orderitem_ptr_id_00c1dc3c_fk_shoppingc` FOREIGN KEY (`orderitem_ptr_id`) REFERENCES `shoppingcart_orderitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_paidcourseregistration`
--

LOCK TABLES `shoppingcart_paidcourseregistration` WRITE;
/*!40000 ALTER TABLE `shoppingcart_paidcourseregistration` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_paidcourseregistration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_paidcourseregistrationannotation`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_paidcourseregistrationannotation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(128) NOT NULL,
  `annotation` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_paidcourseregistrationannotation`
--

LOCK TABLES `shoppingcart_paidcourseregistrationannotation` WRITE;
/*!40000 ALTER TABLE `shoppingcart_paidcourseregistrationannotation` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_paidcourseregistrationannotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart_registrationcoderedemption`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart_registrationcoderedemption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `redeemed_at` datetime(6) DEFAULT NULL,
  `course_enrollment_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `redeemed_by_id` int(11) NOT NULL,
  `registration_code_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shoppingcart_registr_course_enrollment_id_d6f78911_fk_student_c` (`course_enrollment_id`),
  KEY `shoppingcart_registr_order_id_240ef603_fk_shoppingc` (`order_id`),
  KEY `shoppingcart_registr_redeemed_by_id_95c54187_fk_auth_user` (`redeemed_by_id`),
  KEY `shoppingcart_registr_registration_code_id_e5681508_fk_shoppingc` (`registration_code_id`),
  CONSTRAINT `shoppingcart_registr_course_enrollment_id_d6f78911_fk_student_c` FOREIGN KEY (`course_enrollment_id`) REFERENCES `student_courseenrollment` (`id`),
  CONSTRAINT `shoppingcart_registr_order_id_240ef603_fk_shoppingc` FOREIGN KEY (`order_id`) REFERENCES `shoppingcart_order` (`id`),
  CONSTRAINT `shoppingcart_registr_redeemed_by_id_95c54187_fk_auth_user` FOREIGN KEY (`redeemed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `shoppingcart_registr_registration_code_id_e5681508_fk_shoppingc` FOREIGN KEY (`registration_code_id`) REFERENCES `shoppingcart_courseregistrationcode` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart_registrationcoderedemption`
--

LOCK TABLES `shoppingcart_registrationcoderedemption` WRITE;
/*!40000 ALTER TABLE `shoppingcart_registrationcoderedemption` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart_registrationcoderedemption` ENABLE KEYS */;
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
INSERT INTO `site_configuration_siteconfigurationhistory` VALUES (1,'2020-04-06 21:00:11.028167','2020-04-06 21:00:11.028167',1,1,'{\"COURSE_CATALOG_API_URL\":\"http://edx.devstack.discovery:18381/api/v1/\"}');
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_usersocialauth_provider_uid_e6b5e668_uniq` (`provider`,`uid`),
  KEY `social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id` (`user_id`),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_anonymoususerid`
--

LOCK TABLES `student_anonymoususerid` WRITE;
/*!40000 ALTER TABLE `student_anonymoususerid` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_anonymoususerid` ENABLE KEYS */;
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
  KEY `student_courseenrollment_course_id_a6f93be8` (`course_id`),
  KEY `student_courseenrollment_created_79829893` (`created`),
  KEY `student_cou_user_id_b19dcd_idx` (`user_id`,`created`),
  CONSTRAINT `student_courseenrollment_user_id_4263a8e2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_courseenrollment`
--

LOCK TABLES `student_courseenrollment` WRITE;
/*!40000 ALTER TABLE `student_courseenrollment` DISABLE KEYS */;
INSERT INTO `student_courseenrollment` VALUES (1,'course-v1:edX+DemoX+Demo_Course','2020-04-06 20:49:35.218383',1,'audit',5),(2,'course-v1:edX+DemoX+Demo_Course','2020-04-06 20:49:44.227208',1,'audit',6),(3,'course-v1:edX+DemoX+Demo_Course','2020-04-06 20:49:53.428771',1,'audit',7),(4,'course-v1:edX+DemoX+Demo_Course','2020-04-06 20:50:02.554052',1,'audit',8);
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
INSERT INTO `student_courseenrollment_history` VALUES (1,'2020-04-06 20:49:35.218383',1,'audit','0bb7e2e7ac5b4725b9b58ece0460e33d','2020-04-06 20:49:35.444929',NULL,'~','course-v1:edX+DemoX+Demo_Course',NULL,5),(4,'2020-04-06 20:50:02.554052',1,'audit','163ec52d5d1649a6bde63e00321d5055','2020-04-06 20:50:02.808327',NULL,'~','course-v1:edX+DemoX+Demo_Course',NULL,8),(3,'2020-04-06 20:49:53.428771',1,'audit','294d4ec52cfc47cea264a9f4650faa9d','2020-04-06 20:49:53.536871',NULL,'~','course-v1:edX+DemoX+Demo_Course',NULL,7),(1,'2020-04-06 20:49:35.218383',0,'audit','2c866bea12e14d06b1b8f1de46899098','2020-04-06 20:49:35.218849',NULL,'+','course-v1:edX+DemoX+Demo_Course',NULL,5),(3,'2020-04-06 20:49:53.428771',0,'audit','407321748eb546cf834388c9057252c5','2020-04-06 20:49:53.429392',NULL,'+','course-v1:edX+DemoX+Demo_Course',NULL,7),(1,'2020-04-06 20:49:35.218383',1,'audit','43487d915e6b4f5eac02c00ddaa91f1b','2020-04-06 20:49:35.300194',NULL,'~','course-v1:edX+DemoX+Demo_Course',NULL,5),(2,'2020-04-06 20:49:44.227208',1,'audit','6993361856424a3ea3d6c1d4d2cbeb40','2020-04-06 20:49:44.567022',NULL,'~','course-v1:edX+DemoX+Demo_Course',NULL,6),(3,'2020-04-06 20:49:53.428771',1,'audit','6c0f62ad2c3a49ccada8f3bc98a88791','2020-04-06 20:49:53.625677',NULL,'~','course-v1:edX+DemoX+Demo_Course',NULL,7),(2,'2020-04-06 20:49:44.227208',1,'audit','90b521fda98c4896bbc290f2de5d3ba0','2020-04-06 20:49:44.433086',NULL,'~','course-v1:edX+DemoX+Demo_Course',NULL,6),(2,'2020-04-06 20:49:44.227208',0,'audit','d05402c728864cd2a03732f5b77495f1','2020-04-06 20:49:44.227821',NULL,'+','course-v1:edX+DemoX+Demo_Course',NULL,6),(4,'2020-04-06 20:50:02.554052',1,'audit','e5a0961250114e9f955ded510555f9c9','2020-04-06 20:50:02.897336',NULL,'~','course-v1:edX+DemoX+Demo_Course',NULL,8),(4,'2020-04-06 20:50:02.554052',0,'audit','ffdfe45f9dc8450fb504400d1bd0eb3d','2020-04-06 20:50:02.554680',NULL,'+','course-v1:edX+DemoX+Demo_Course',NULL,8);
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
  `dashboard_tracking_code` longtext NOT NULL,
  `trk_partner_name` varchar(10) NOT NULL,
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
-- Table structure for table `student_logoutviewconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_logoutviewconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_logoutviewco_changed_by_id_a787d3e7_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `student_logoutviewco_changed_by_id_a787d3e7_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_logoutviewconfiguration`
--

LOCK TABLES `student_logoutviewconfiguration` WRITE;
/*!40000 ALTER TABLE `student_logoutviewconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_logoutviewconfiguration` ENABLE KEYS */;
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
INSERT INTO `system_wide_roles_systemwiderole` VALUES (1,'2020-04-06 20:36:45.115041','2020-04-06 20:36:45.115041','student_support_admin',NULL);
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
  PRIMARY KEY (`id`),
  KEY `third_party_auth_lti_changed_by_id_7b39c829_fk_auth_user` (`changed_by_id`),
  KEY `third_party_auth_ltiproviderconfig_lti_hostname_540ce676` (`lti_hostname`),
  KEY `third_party_auth_lti_site_id_c8442a80_fk_django_si` (`site_id`),
  KEY `third_party_auth_ltiproviderconfig_slug_9cd23a79` (`slug`),
  KEY `third_party_auth_ltiproviderconfig_organization_id_7494c417` (`organization_id`),
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
  PRIMARY KEY (`id`),
  KEY `third_party_auth_oau_changed_by_id_55219296_fk_auth_user` (`changed_by_id`),
  KEY `third_party_auth_oauth2providerconfig_backend_name_0c14d294` (`backend_name`),
  KEY `third_party_auth_oau_site_id_a4ae3e66_fk_django_si` (`site_id`),
  KEY `third_party_auth_oauth2providerconfig_slug_226038d8` (`slug`),
  KEY `third_party_auth_oauth2providerconfig_organization_id_cc8874ba` (`organization_id`),
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
  PRIMARY KEY (`id`),
  KEY `third_party_auth_sam_changed_by_id_4c8fa8c0_fk_auth_user` (`changed_by_id`),
  KEY `third_party_auth_sam_site_id_b7e2af73_fk_django_si` (`site_id`),
  KEY `third_party_auth_samlproviderconfig_slug_95883dea` (`slug`),
  KEY `third_party_auth_samlproviderconfig_organization_id_8a7f5596` (`organization_id`),
  KEY `third_party_auth_sam_saml_configuration_i_eeb9fe72_fk_third_par` (`saml_configuration_id`),
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
INSERT INTO `util_ratelimitconfiguration` VALUES (1,'2020-04-06 20:38:27.009443',1,NULL);
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
  PRIMARY KEY (`id`),
  KEY `verify_student_manua_user_id_f38b72b4_fk_auth_user` (`user_id`),
  KEY `verify_student_manualverification_created_at_e4e3731a` (`created_at`),
  KEY `verify_student_manualverification_updated_at_1a350690` (`updated_at`),
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
  `expiry_date` datetime(6) DEFAULT NULL,
  `expiry_email_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `verify_student_softw_copy_id_photo_from_i_059e40b6_fk_verify_st` (`copy_id_photo_from_id`),
  KEY `verify_student_softw_reviewing_user_id_55fd003a_fk_auth_user` (`reviewing_user_id`),
  KEY `verify_student_softw_user_id_66ca4f6d_fk_auth_user` (`user_id`),
  KEY `verify_student_softwaresecu_receipt_id_2160ce88` (`receipt_id`),
  KEY `verify_student_softwaresecu_created_at_566f779f` (`created_at`),
  KEY `verify_student_softwaresecu_updated_at_8f5cf2d7` (`updated_at`),
  KEY `verify_student_softwaresecurephotoverification_display_287287f8` (`display`),
  KEY `verify_student_softwaresecu_submitted_at_f3d5cd03` (`submitted_at`),
  KEY `verify_student_softwaresecu_expiry_date_5c297927` (`expiry_date`),
  KEY `verify_student_softwaresecu_expiry_email_date_6ae6d6c9` (`expiry_email_date`),
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
  PRIMARY KEY (`id`),
  KEY `verify_student_ssoverification_user_id_5e6186eb_fk_auth_user_id` (`user_id`),
  KEY `verify_student_ssoverification_created_at_6381e5a4` (`created_at`),
  KEY `verify_student_ssoverification_updated_at_9d6cc952` (`updated_at`),
  KEY `verify_student_ssoverification_identity_provider_slug_56c53eb6` (`identity_provider_slug`),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verify_student_verificationdeadline`
--

LOCK TABLES `verify_student_verificationdeadline` WRITE;
/*!40000 ALTER TABLE `verify_student_verificationdeadline` DISABLE KEYS */;
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
-- Table structure for table `video_pipeline_videopipelineintegration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_pipeline_videopipelineintegration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `api_url` varchar(200) NOT NULL,
  `service_username` varchar(100) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `client_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `video_pipeline_video_changed_by_id_b169f329_fk_auth_user` (`changed_by_id`),
  CONSTRAINT `video_pipeline_video_changed_by_id_b169f329_fk_auth_user` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_pipeline_videopipelineintegration`
--

LOCK TABLES `video_pipeline_videopipelineintegration` WRITE;
/*!40000 ALTER TABLE `video_pipeline_videopipelineintegration` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_pipeline_videopipelineintegration` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_flag`
--

LOCK TABLES `waffle_flag` WRITE;
/*!40000 ALTER TABLE `waffle_flag` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
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

-- Dump completed on 2020-04-07 11:52:09
