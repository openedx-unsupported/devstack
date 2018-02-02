-- MySQL dump 10.13  Distrib 5.6.39, for Linux (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	5.6.39

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
-- Current Database: `ecommerce`
--

/*!40000 DROP DATABASE IF EXISTS `ecommerce`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ecommerce` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ecommerce`;

--
-- Table structure for table `address_country`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_country` (
  `iso_3166_1_a2` varchar(2) NOT NULL,
  `iso_3166_1_a3` varchar(3) NOT NULL,
  `iso_3166_1_numeric` varchar(3) NOT NULL,
  `printable_name` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `display_order` smallint(5) unsigned NOT NULL,
  `is_shipping_country` tinyint(1) NOT NULL,
  PRIMARY KEY (`iso_3166_1_a2`),
  KEY `address_country_010c8bce` (`display_order`),
  KEY `address_country_0b3676f8` (`is_shipping_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_country`
--

LOCK TABLES `address_country` WRITE;
/*!40000 ALTER TABLE `address_country` DISABLE KEYS */;
INSERT INTO `address_country` VALUES ('AD','AND','020','Andorra','Principality of Andorra',0,1),('AE','ARE','784','United Arab Emirates','',0,1),('AF','AFG','004','Afghanistan','Islamic Republic of Afghanistan',0,1),('AG','ATG','028','Antigua and Barbuda','',0,1),('AI','AIA','660','Anguilla','',0,1),('AL','ALB','008','Albania','Republic of Albania',0,1),('AM','ARM','051','Armenia','Republic of Armenia',0,1),('AO','AGO','024','Angola','Republic of Angola',0,1),('AQ','ATA','010','Antarctica','',0,1),('AR','ARG','032','Argentina','Argentine Republic',0,1),('AS','ASM','016','American Samoa','',0,1),('AT','AUT','040','Austria','Republic of Austria',0,1),('AU','AUS','036','Australia','',0,1),('AW','ABW','533','Aruba','',0,1),('AX','ALA','248','Åland Islands','',0,1),('AZ','AZE','031','Azerbaijan','Republic of Azerbaijan',0,1),('BA','BIH','070','Bosnia and Herzegovina','Republic of Bosnia and Herzegovina',0,1),('BB','BRB','052','Barbados','',0,1),('BD','BGD','050','Bangladesh','People\'s Republic of Bangladesh',0,1),('BE','BEL','056','Belgium','Kingdom of Belgium',0,1),('BF','BFA','854','Burkina Faso','',0,1),('BG','BGR','100','Bulgaria','Republic of Bulgaria',0,1),('BH','BHR','048','Bahrain','Kingdom of Bahrain',0,1),('BI','BDI','108','Burundi','Republic of Burundi',0,1),('BJ','BEN','204','Benin','Republic of Benin',0,1),('BL','BLM','652','Saint Barthélemy','',0,1),('BM','BMU','060','Bermuda','',0,1),('BN','BRN','096','Brunei Darussalam','',0,1),('BO','BOL','068','Bolivia, Plurinational State of','Plurinational State of Bolivia',0,1),('BQ','BES','535','Bonaire, Sint Eustatius and Saba','Bonaire, Sint Eustatius and Saba',0,1),('BR','BRA','076','Brazil','Federative Republic of Brazil',0,1),('BS','BHS','044','Bahamas','Commonwealth of the Bahamas',0,1),('BT','BTN','064','Bhutan','Kingdom of Bhutan',0,1),('BV','BVT','074','Bouvet Island','',0,1),('BW','BWA','072','Botswana','Republic of Botswana',0,1),('BY','BLR','112','Belarus','Republic of Belarus',0,1),('BZ','BLZ','084','Belize','',0,1),('CA','CAN','124','Canada','',0,1),('CC','CCK','166','Cocos (Keeling) Islands','',0,1),('CD','COD','180','Congo, The Democratic Republic of the','',0,1),('CF','CAF','140','Central African Republic','',0,1),('CG','COG','178','Congo','Republic of the Congo',0,1),('CH','CHE','756','Switzerland','Swiss Confederation',0,1),('CI','CIV','384','Côte d\'Ivoire','Republic of Côte d\'Ivoire',0,1),('CK','COK','184','Cook Islands','',0,1),('CL','CHL','152','Chile','Republic of Chile',0,1),('CM','CMR','120','Cameroon','Republic of Cameroon',0,1),('CN','CHN','156','China','People\'s Republic of China',0,1),('CO','COL','170','Colombia','Republic of Colombia',0,1),('CR','CRI','188','Costa Rica','Republic of Costa Rica',0,1),('CU','CUB','192','Cuba','Republic of Cuba',0,1),('CV','CPV','132','Cabo Verde','Republic of Cabo Verde',0,1),('CW','CUW','531','Curaçao','Curaçao',0,1),('CX','CXR','162','Christmas Island','',0,1),('CY','CYP','196','Cyprus','Republic of Cyprus',0,1),('CZ','CZE','203','Czechia','Czech Republic',0,1),('DE','DEU','276','Germany','Federal Republic of Germany',0,1),('DJ','DJI','262','Djibouti','Republic of Djibouti',0,1),('DK','DNK','208','Denmark','Kingdom of Denmark',0,1),('DM','DMA','212','Dominica','Commonwealth of Dominica',0,1),('DO','DOM','214','Dominican Republic','',0,1),('DZ','DZA','012','Algeria','People\'s Democratic Republic of Algeria',0,1),('EC','ECU','218','Ecuador','Republic of Ecuador',0,1),('EE','EST','233','Estonia','Republic of Estonia',0,1),('EG','EGY','818','Egypt','Arab Republic of Egypt',0,1),('EH','ESH','732','Western Sahara','',0,1),('ER','ERI','232','Eritrea','the State of Eritrea',0,1),('ES','ESP','724','Spain','Kingdom of Spain',0,1),('ET','ETH','231','Ethiopia','Federal Democratic Republic of Ethiopia',0,1),('FI','FIN','246','Finland','Republic of Finland',0,1),('FJ','FJI','242','Fiji','Republic of Fiji',0,1),('FK','FLK','238','Falkland Islands (Malvinas)','',0,1),('FM','FSM','583','Micronesia, Federated States of','Federated States of Micronesia',0,1),('FO','FRO','234','Faroe Islands','',0,1),('FR','FRA','250','France','French Republic',0,1),('GA','GAB','266','Gabon','Gabonese Republic',0,1),('GB','GBR','826','United Kingdom','United Kingdom of Great Britain and Northern Ireland',0,1),('GD','GRD','308','Grenada','',0,1),('GE','GEO','268','Georgia','',0,1),('GF','GUF','254','French Guiana','',0,1),('GG','GGY','831','Guernsey','',0,1),('GH','GHA','288','Ghana','Republic of Ghana',0,1),('GI','GIB','292','Gibraltar','',0,1),('GL','GRL','304','Greenland','',0,1),('GM','GMB','270','Gambia','Islamic Republic of the Gambia',0,1),('GN','GIN','324','Guinea','Republic of Guinea',0,1),('GP','GLP','312','Guadeloupe','',0,1),('GQ','GNQ','226','Equatorial Guinea','Republic of Equatorial Guinea',0,1),('GR','GRC','300','Greece','Hellenic Republic',0,1),('GS','SGS','239','South Georgia and the South Sandwich Islands','',0,1),('GT','GTM','320','Guatemala','Republic of Guatemala',0,1),('GU','GUM','316','Guam','',0,1),('GW','GNB','624','Guinea-Bissau','Republic of Guinea-Bissau',0,1),('GY','GUY','328','Guyana','Republic of Guyana',0,1),('HK','HKG','344','Hong Kong','Hong Kong Special Administrative Region of China',0,1),('HM','HMD','334','Heard Island and McDonald Islands','',0,1),('HN','HND','340','Honduras','Republic of Honduras',0,1),('HR','HRV','191','Croatia','Republic of Croatia',0,1),('HT','HTI','332','Haiti','Republic of Haiti',0,1),('HU','HUN','348','Hungary','Hungary',0,1),('ID','IDN','360','Indonesia','Republic of Indonesia',0,1),('IE','IRL','372','Ireland','',0,1),('IL','ISR','376','Israel','State of Israel',0,1),('IM','IMN','833','Isle of Man','',0,1),('IN','IND','356','India','Republic of India',0,1),('IO','IOT','086','British Indian Ocean Territory','',0,1),('IQ','IRQ','368','Iraq','Republic of Iraq',0,1),('IR','IRN','364','Iran, Islamic Republic of','Islamic Republic of Iran',0,1),('IS','ISL','352','Iceland','Republic of Iceland',0,1),('IT','ITA','380','Italy','Italian Republic',0,1),('JE','JEY','832','Jersey','',0,1),('JM','JAM','388','Jamaica','',0,1),('JO','JOR','400','Jordan','Hashemite Kingdom of Jordan',0,1),('JP','JPN','392','Japan','',0,1),('KE','KEN','404','Kenya','Republic of Kenya',0,1),('KG','KGZ','417','Kyrgyzstan','Kyrgyz Republic',0,1),('KH','KHM','116','Cambodia','Kingdom of Cambodia',0,1),('KI','KIR','296','Kiribati','Republic of Kiribati',0,1),('KM','COM','174','Comoros','Union of the Comoros',0,1),('KN','KNA','659','Saint Kitts and Nevis','',0,1),('KP','PRK','408','Korea, Democratic People\'s Republic of','Democratic People\'s Republic of Korea',0,1),('KR','KOR','410','Korea, Republic of','',0,1),('KW','KWT','414','Kuwait','State of Kuwait',0,1),('KY','CYM','136','Cayman Islands','',0,1),('KZ','KAZ','398','Kazakhstan','Republic of Kazakhstan',0,1),('LA','LAO','418','Lao People\'s Democratic Republic','',0,1),('LB','LBN','422','Lebanon','Lebanese Republic',0,1),('LC','LCA','662','Saint Lucia','',0,1),('LI','LIE','438','Liechtenstein','Principality of Liechtenstein',0,1),('LK','LKA','144','Sri Lanka','Democratic Socialist Republic of Sri Lanka',0,1),('LR','LBR','430','Liberia','Republic of Liberia',0,1),('LS','LSO','426','Lesotho','Kingdom of Lesotho',0,1),('LT','LTU','440','Lithuania','Republic of Lithuania',0,1),('LU','LUX','442','Luxembourg','Grand Duchy of Luxembourg',0,1),('LV','LVA','428','Latvia','Republic of Latvia',0,1),('LY','LBY','434','Libya','Libya',0,1),('MA','MAR','504','Morocco','Kingdom of Morocco',0,1),('MC','MCO','492','Monaco','Principality of Monaco',0,1),('MD','MDA','498','Moldova, Republic of','Republic of Moldova',0,1),('ME','MNE','499','Montenegro','Montenegro',0,1),('MF','MAF','663','Saint Martin (French part)','',0,1),('MG','MDG','450','Madagascar','Republic of Madagascar',0,1),('MH','MHL','584','Marshall Islands','Republic of the Marshall Islands',0,1),('MK','MKD','807','Macedonia, Republic of','The Former Yugoslav Republic of Macedonia',0,1),('ML','MLI','466','Mali','Republic of Mali',0,1),('MM','MMR','104','Myanmar','Republic of Myanmar',0,1),('MN','MNG','496','Mongolia','',0,1),('MO','MAC','446','Macao','Macao Special Administrative Region of China',0,1),('MP','MNP','580','Northern Mariana Islands','Commonwealth of the Northern Mariana Islands',0,1),('MQ','MTQ','474','Martinique','',0,1),('MR','MRT','478','Mauritania','Islamic Republic of Mauritania',0,1),('MS','MSR','500','Montserrat','',0,1),('MT','MLT','470','Malta','Republic of Malta',0,1),('MU','MUS','480','Mauritius','Republic of Mauritius',0,1),('MV','MDV','462','Maldives','Republic of Maldives',0,1),('MW','MWI','454','Malawi','Republic of Malawi',0,1),('MX','MEX','484','Mexico','United Mexican States',0,1),('MY','MYS','458','Malaysia','',0,1),('MZ','MOZ','508','Mozambique','Republic of Mozambique',0,1),('NA','NAM','516','Namibia','Republic of Namibia',0,1),('NC','NCL','540','New Caledonia','',0,1),('NE','NER','562','Niger','Republic of the Niger',0,1),('NF','NFK','574','Norfolk Island','',0,1),('NG','NGA','566','Nigeria','Federal Republic of Nigeria',0,1),('NI','NIC','558','Nicaragua','Republic of Nicaragua',0,1),('NL','NLD','528','Netherlands','Kingdom of the Netherlands',0,1),('NO','NOR','578','Norway','Kingdom of Norway',0,1),('NP','NPL','524','Nepal','Federal Democratic Republic of Nepal',0,1),('NR','NRU','520','Nauru','Republic of Nauru',0,1),('NU','NIU','570','Niue','Niue',0,1),('NZ','NZL','554','New Zealand','',0,1),('OM','OMN','512','Oman','Sultanate of Oman',0,1),('PA','PAN','591','Panama','Republic of Panama',0,1),('PE','PER','604','Peru','Republic of Peru',0,1),('PF','PYF','258','French Polynesia','',0,1),('PG','PNG','598','Papua New Guinea','Independent State of Papua New Guinea',0,1),('PH','PHL','608','Philippines','Republic of the Philippines',0,1),('PK','PAK','586','Pakistan','Islamic Republic of Pakistan',0,1),('PL','POL','616','Poland','Republic of Poland',0,1),('PM','SPM','666','Saint Pierre and Miquelon','',0,1),('PN','PCN','612','Pitcairn','',0,1),('PR','PRI','630','Puerto Rico','',0,1),('PS','PSE','275','Palestine, State of','the State of Palestine',0,1),('PT','PRT','620','Portugal','Portuguese Republic',0,1),('PW','PLW','585','Palau','Republic of Palau',0,1),('PY','PRY','600','Paraguay','Republic of Paraguay',0,1),('QA','QAT','634','Qatar','State of Qatar',0,1),('RE','REU','638','Réunion','',0,1),('RO','ROU','642','Romania','',0,1),('RS','SRB','688','Serbia','Republic of Serbia',0,1),('RU','RUS','643','Russian Federation','',0,1),('RW','RWA','646','Rwanda','Rwandese Republic',0,1),('SA','SAU','682','Saudi Arabia','Kingdom of Saudi Arabia',0,1),('SB','SLB','090','Solomon Islands','',0,1),('SC','SYC','690','Seychelles','Republic of Seychelles',0,1),('SD','SDN','729','Sudan','Republic of the Sudan',0,1),('SE','SWE','752','Sweden','Kingdom of Sweden',0,1),('SG','SGP','702','Singapore','Republic of Singapore',0,1),('SH','SHN','654','Saint Helena, Ascension and Tristan da Cunha','',0,1),('SI','SVN','705','Slovenia','Republic of Slovenia',0,1),('SJ','SJM','744','Svalbard and Jan Mayen','',0,1),('SK','SVK','703','Slovakia','Slovak Republic',0,1),('SL','SLE','694','Sierra Leone','Republic of Sierra Leone',0,1),('SM','SMR','674','San Marino','Republic of San Marino',0,1),('SN','SEN','686','Senegal','Republic of Senegal',0,1),('SO','SOM','706','Somalia','Federal Republic of Somalia',0,1),('SR','SUR','740','Suriname','Republic of Suriname',0,1),('SS','SSD','728','South Sudan','Republic of South Sudan',0,1),('ST','STP','678','Sao Tome and Principe','Democratic Republic of Sao Tome and Principe',0,1),('SV','SLV','222','El Salvador','Republic of El Salvador',0,1),('SX','SXM','534','Sint Maarten (Dutch part)','Sint Maarten (Dutch part)',0,1),('SY','SYR','760','Syrian Arab Republic','',0,1),('SZ','SWZ','748','Swaziland','Kingdom of Swaziland',0,1),('TC','TCA','796','Turks and Caicos Islands','',0,1),('TD','TCD','148','Chad','Republic of Chad',0,1),('TF','ATF','260','French Southern Territories','',0,1),('TG','TGO','768','Togo','Togolese Republic',0,1),('TH','THA','764','Thailand','Kingdom of Thailand',0,1),('TJ','TJK','762','Tajikistan','Republic of Tajikistan',0,1),('TK','TKL','772','Tokelau','',0,1),('TL','TLS','626','Timor-Leste','Democratic Republic of Timor-Leste',0,1),('TM','TKM','795','Turkmenistan','',0,1),('TN','TUN','788','Tunisia','Republic of Tunisia',0,1),('TO','TON','776','Tonga','Kingdom of Tonga',0,1),('TR','TUR','792','Turkey','Republic of Turkey',0,1),('TT','TTO','780','Trinidad and Tobago','Republic of Trinidad and Tobago',0,1),('TV','TUV','798','Tuvalu','',0,1),('TW','TWN','158','Taiwan, Province of China','Taiwan, Province of China',0,1),('TZ','TZA','834','Tanzania, United Republic of','United Republic of Tanzania',0,1),('UA','UKR','804','Ukraine','',0,1),('UG','UGA','800','Uganda','Republic of Uganda',0,1),('UM','UMI','581','United States Minor Outlying Islands','',0,1),('US','USA','840','United States','United States of America',0,1),('UY','URY','858','Uruguay','Eastern Republic of Uruguay',0,1),('UZ','UZB','860','Uzbekistan','Republic of Uzbekistan',0,1),('VA','VAT','336','Holy See (Vatican City State)','',0,1),('VC','VCT','670','Saint Vincent and the Grenadines','',0,1),('VE','VEN','862','Venezuela, Bolivarian Republic of','Bolivarian Republic of Venezuela',0,1),('VG','VGB','092','Virgin Islands, British','British Virgin Islands',0,1),('VI','VIR','850','Virgin Islands, U.S.','Virgin Islands of the United States',0,1),('VN','VNM','704','Viet Nam','Socialist Republic of Viet Nam',0,1),('VU','VUT','548','Vanuatu','Republic of Vanuatu',0,1),('WF','WLF','876','Wallis and Futuna','',0,1),('WS','WSM','882','Samoa','Independent State of Samoa',0,1),('YE','YEM','887','Yemen','Republic of Yemen',0,1),('YT','MYT','175','Mayotte','',0,1),('ZA','ZAF','710','South Africa','Republic of South Africa',0,1),('ZM','ZMB','894','Zambia','Republic of Zambia',0,1),('ZW','ZWE','716','Zimbabwe','Republic of Zimbabwe',0,1);
/*!40000 ALTER TABLE `address_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_useraddress`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_useraddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `line1` varchar(255) NOT NULL,
  `line2` varchar(255) NOT NULL,
  `line3` varchar(255) NOT NULL,
  `line4` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `postcode` varchar(64) NOT NULL,
  `search_text` longtext NOT NULL,
  `phone_number` varchar(128) NOT NULL,
  `notes` longtext NOT NULL,
  `is_default_for_shipping` tinyint(1) NOT NULL,
  `is_default_for_billing` tinyint(1) NOT NULL,
  `num_orders` int(10) unsigned NOT NULL,
  `hash` varchar(255) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `country_id` varchar(2) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `address_useraddress_user_id_9d1738c7_uniq` (`user_id`,`hash`),
  KEY `address_use_country_id_fa26a249_fk_address_country_iso_3166_1_a2` (`country_id`),
  KEY `address_useraddress_0800fc57` (`hash`),
  CONSTRAINT `address_use_country_id_fa26a249_fk_address_country_iso_3166_1_a2` FOREIGN KEY (`country_id`) REFERENCES `address_country` (`iso_3166_1_a2`),
  CONSTRAINT `address_useraddress_user_id_6edf0244_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_useraddress`
--

LOCK TABLES `address_useraddress` WRITE;
/*!40000 ALTER TABLE `address_useraddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_useraddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analytics_productrecord`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analytics_productrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_views` int(10) unsigned NOT NULL,
  `num_basket_additions` int(10) unsigned NOT NULL,
  `num_purchases` int(10) unsigned NOT NULL,
  `score` double NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_id` (`product_id`),
  KEY `analytics_productrecord_81a5c7b1` (`num_purchases`),
  CONSTRAINT `analytics_productrec_product_id_dad3a871_fk_catalogue_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analytics_productrecord`
--

LOCK TABLES `analytics_productrecord` WRITE;
/*!40000 ALTER TABLE `analytics_productrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `analytics_productrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analytics_userproductview`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analytics_userproductview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `analytics_userproduc_product_id_a55b87ad_fk_catalogue_product_id` (`product_id`),
  KEY `analytics_userproductview_user_id_5e49a8b1_fk_ecommerce_user_id` (`user_id`),
  CONSTRAINT `analytics_userproduc_product_id_a55b87ad_fk_catalogue_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `analytics_userproductview_user_id_5e49a8b1_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analytics_userproductview`
--

LOCK TABLES `analytics_userproductview` WRITE;
/*!40000 ALTER TABLE `analytics_userproductview` DISABLE KEYS */;
/*!40000 ALTER TABLE `analytics_userproductview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analytics_userrecord`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analytics_userrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_product_views` int(10) unsigned NOT NULL,
  `num_basket_additions` int(10) unsigned NOT NULL,
  `num_orders` int(10) unsigned NOT NULL,
  `num_order_lines` int(10) unsigned NOT NULL,
  `num_order_items` int(10) unsigned NOT NULL,
  `total_spent` decimal(12,2) NOT NULL,
  `date_last_order` datetime(6) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `analytics_userrecord_29bdb5ea` (`num_orders`),
  KEY `analytics_userrecord_89bb6879` (`num_order_lines`),
  KEY `analytics_userrecord_25cd4b4a` (`num_order_items`),
  CONSTRAINT `analytics_userrecord_user_id_702cff4c_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analytics_userrecord`
--

LOCK TABLES `analytics_userrecord` WRITE;
/*!40000 ALTER TABLE `analytics_userrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `analytics_userrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analytics_usersearch`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analytics_usersearch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `analytics_usersearch_user_id_1775992d_fk_ecommerce_user_id` (`user_id`),
  KEY `analytics_usersearch_1b1cc7f0` (`query`),
  CONSTRAINT `analytics_usersearch_user_id_1775992d_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analytics_usersearch`
--

LOCK TABLES `analytics_usersearch` WRITE;
/*!40000 ALTER TABLE `analytics_usersearch` DISABLE KEYS */;
/*!40000 ALTER TABLE `analytics_usersearch` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
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
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=385 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add content type',1,'add_contenttype'),(2,'Can change content type',1,'change_contenttype'),(3,'Can delete content type',1,'delete_contenttype'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add site configuration',4,'add_siteconfiguration'),(11,'Can change site configuration',4,'change_siteconfiguration'),(12,'Can delete site configuration',4,'delete_siteconfiguration'),(13,'Can add user',5,'add_user'),(14,'Can change user',5,'change_user'),(15,'Can delete user',5,'delete_user'),(16,'Can add user',6,'add_client'),(17,'Can change user',6,'change_client'),(18,'Can delete user',6,'delete_client'),(19,'Can add Country',7,'add_country'),(20,'Can change Country',7,'change_country'),(21,'Can delete Country',7,'delete_country'),(22,'Can add User address',8,'add_useraddress'),(23,'Can change User address',8,'change_useraddress'),(24,'Can delete User address',8,'delete_useraddress'),(25,'Can add log entry',9,'add_logentry'),(26,'Can change log entry',9,'change_logentry'),(27,'Can delete log entry',9,'delete_logentry'),(28,'Can add Attribute option',10,'add_attributeoption'),(29,'Can change Attribute option',10,'change_attributeoption'),(30,'Can delete Attribute option',10,'delete_attributeoption'),(31,'Can add Product',11,'add_product'),(32,'Can change Product',11,'change_product'),(33,'Can delete Product',11,'delete_product'),(34,'Can add Option',12,'add_option'),(35,'Can change Option',12,'change_option'),(36,'Can delete Option',12,'delete_option'),(37,'Can add Product class',13,'add_productclass'),(38,'Can change Product class',13,'change_productclass'),(39,'Can delete Product class',13,'delete_productclass'),(40,'Can add Category',14,'add_category'),(41,'Can change Category',14,'change_category'),(42,'Can delete Category',14,'delete_category'),(43,'Can add catalog',15,'add_catalog'),(44,'Can change catalog',15,'change_catalog'),(45,'Can delete catalog',15,'delete_catalog'),(46,'Can add Product recommendation',16,'add_productrecommendation'),(47,'Can change Product recommendation',16,'change_productrecommendation'),(48,'Can delete Product recommendation',16,'delete_productrecommendation'),(49,'Can add Product attribute',17,'add_productattribute'),(50,'Can change Product attribute',17,'change_productattribute'),(51,'Can delete Product attribute',17,'delete_productattribute'),(52,'Can add Attribute option group',18,'add_attributeoptiongroup'),(53,'Can change Attribute option group',18,'change_attributeoptiongroup'),(54,'Can delete Attribute option group',18,'delete_attributeoptiongroup'),(55,'Can add Product image',19,'add_productimage'),(56,'Can change Product image',19,'change_productimage'),(57,'Can delete Product image',19,'delete_productimage'),(58,'Can add Product attribute value',20,'add_productattributevalue'),(59,'Can change Product attribute value',20,'change_productattributevalue'),(60,'Can delete Product attribute value',20,'delete_productattributevalue'),(61,'Can add Product category',21,'add_productcategory'),(62,'Can change Product category',21,'change_productcategory'),(63,'Can delete Product category',21,'delete_productcategory'),(64,'Can add historical Product attribute value',22,'add_historicalproductattributevalue'),(65,'Can change historical Product attribute value',22,'change_historicalproductattributevalue'),(66,'Can delete historical Product attribute value',22,'delete_historicalproductattributevalue'),(67,'Can add historical Product',23,'add_historicalproduct'),(68,'Can change historical Product',23,'change_historicalproduct'),(69,'Can delete historical Product',23,'delete_historicalproduct'),(70,'Can add User product view',24,'add_userproductview'),(71,'Can change User product view',24,'change_userproductview'),(72,'Can delete User product view',24,'delete_userproductview'),(73,'Can add User record',25,'add_userrecord'),(74,'Can change User record',25,'change_userrecord'),(75,'Can delete User record',25,'delete_userrecord'),(76,'Can add User search query',26,'add_usersearch'),(77,'Can change User search query',26,'change_usersearch'),(78,'Can delete User search query',26,'delete_usersearch'),(79,'Can add Product record',27,'add_productrecord'),(80,'Can change Product record',27,'change_productrecord'),(81,'Can delete Product record',27,'delete_productrecord'),(82,'Can add sample',28,'add_sample'),(83,'Can change sample',28,'change_sample'),(84,'Can delete sample',28,'delete_sample'),(85,'Can add switch',29,'add_switch'),(86,'Can change switch',29,'change_switch'),(87,'Can delete switch',29,'delete_switch'),(88,'Can add flag',30,'add_flag'),(89,'Can change flag',30,'change_flag'),(90,'Can delete flag',30,'delete_flag'),(91,'Can add site',31,'add_site'),(92,'Can change site',31,'change_site'),(93,'Can delete site',31,'delete_site'),(94,'Can add historical Stock record',32,'add_historicalstockrecord'),(95,'Can change historical Stock record',32,'change_historicalstockrecord'),(96,'Can delete historical Stock record',32,'delete_historicalstockrecord'),(97,'Can add Partner',33,'add_partner'),(98,'Can change Partner',33,'change_partner'),(99,'Can delete Partner',33,'delete_partner'),(100,'Can add Partner address',34,'add_partneraddress'),(101,'Can change Partner address',34,'change_partneraddress'),(102,'Can delete Partner address',34,'delete_partneraddress'),(103,'Can add Stock record',35,'add_stockrecord'),(104,'Can change Stock record',35,'change_stockrecord'),(105,'Can delete Stock record',35,'delete_stockrecord'),(106,'Can add Stock alert',36,'add_stockalert'),(107,'Can change Stock alert',36,'change_stockalert'),(108,'Can delete Stock alert',36,'delete_stockalert'),(109,'Can add Product alert',37,'add_productalert'),(110,'Can change Product alert',37,'change_productalert'),(111,'Can delete Product alert',37,'delete_productalert'),(112,'Can add Email',38,'add_email'),(113,'Can change Email',38,'change_email'),(114,'Can delete Email',38,'delete_email'),(115,'Can add Communication event type',39,'add_communicationeventtype'),(116,'Can change Communication event type',39,'change_communicationeventtype'),(117,'Can delete Communication event type',39,'delete_communicationeventtype'),(118,'Can add Notification',40,'add_notification'),(119,'Can change Notification',40,'change_notification'),(120,'Can delete Notification',40,'delete_notification'),(121,'Can add basket attribute',41,'add_basketattribute'),(122,'Can change basket attribute',41,'change_basketattribute'),(123,'Can delete basket attribute',41,'delete_basketattribute'),(124,'Can add basket attribute type',42,'add_basketattributetype'),(125,'Can change basket attribute type',42,'change_basketattributetype'),(126,'Can delete basket attribute type',42,'delete_basketattributetype'),(127,'Can add Basket',43,'add_basket'),(128,'Can change Basket',43,'change_basket'),(129,'Can delete Basket',43,'delete_basket'),(130,'Can add Basket line',44,'add_line'),(131,'Can change Basket line',44,'change_line'),(132,'Can delete Basket line',44,'delete_line'),(133,'Can add Line attribute',45,'add_lineattribute'),(134,'Can change Line attribute',45,'change_lineattribute'),(135,'Can delete Line attribute',45,'delete_lineattribute'),(136,'Can add Line Price',46,'add_lineprice'),(137,'Can change Line Price',46,'change_lineprice'),(138,'Can delete Line Price',46,'delete_lineprice'),(139,'Can add Shipping address',47,'add_shippingaddress'),(140,'Can change Shipping address',47,'change_shippingaddress'),(141,'Can delete Shipping address',47,'delete_shippingaddress'),(142,'Can add Billing address',48,'add_billingaddress'),(143,'Can change Billing address',48,'change_billingaddress'),(144,'Can delete Billing address',48,'delete_billingaddress'),(145,'Can add Shipping Event',49,'add_shippingevent'),(146,'Can change Shipping Event',49,'change_shippingevent'),(147,'Can delete Shipping Event',49,'delete_shippingevent'),(148,'Can add Order Line',50,'add_line'),(149,'Can change Order Line',50,'change_line'),(150,'Can delete Order Line',50,'delete_line'),(151,'Can add Payment Event',51,'add_paymentevent'),(152,'Can change Payment Event',51,'change_paymentevent'),(153,'Can delete Payment Event',51,'delete_paymentevent'),(154,'Can add Communication Event',52,'add_communicationevent'),(155,'Can change Communication Event',52,'change_communicationevent'),(156,'Can delete Communication Event',52,'delete_communicationevent'),(157,'Can add Order Note',53,'add_ordernote'),(158,'Can change Order Note',53,'change_ordernote'),(159,'Can delete Order Note',53,'delete_ordernote'),(160,'Can add Order',54,'add_order'),(161,'Can change Order',54,'change_order'),(162,'Can delete Order',54,'delete_order'),(163,'Can add Payment Event Quantity',55,'add_paymenteventquantity'),(164,'Can change Payment Event Quantity',55,'change_paymenteventquantity'),(165,'Can delete Payment Event Quantity',55,'delete_paymenteventquantity'),(166,'Can add Shipping Event Type',56,'add_shippingeventtype'),(167,'Can change Shipping Event Type',56,'change_shippingeventtype'),(168,'Can delete Shipping Event Type',56,'delete_shippingeventtype'),(169,'Can add Shipping Event Quantity',57,'add_shippingeventquantity'),(170,'Can change Shipping Event Quantity',57,'change_shippingeventquantity'),(171,'Can delete Shipping Event Quantity',57,'delete_shippingeventquantity'),(172,'Can add Payment Event Type',58,'add_paymenteventtype'),(173,'Can change Payment Event Type',58,'change_paymenteventtype'),(174,'Can delete Payment Event Type',58,'delete_paymenteventtype'),(175,'Can add Line Attribute',59,'add_lineattribute'),(176,'Can change Line Attribute',59,'change_lineattribute'),(177,'Can delete Line Attribute',59,'delete_lineattribute'),(178,'Can add Order Discount',60,'add_orderdiscount'),(179,'Can change Order Discount',60,'change_orderdiscount'),(180,'Can delete Order Discount',60,'delete_orderdiscount'),(181,'Can add range product',61,'add_rangeproduct'),(182,'Can change range product',61,'change_rangeproduct'),(183,'Can delete range product',61,'delete_rangeproduct'),(184,'Can add Benefit',62,'add_benefit'),(185,'Can change Benefit',62,'change_benefit'),(186,'Can delete Benefit',62,'delete_benefit'),(187,'Can add Multibuy discount benefit',62,'add_multibuydiscountbenefit'),(188,'Can change Multibuy discount benefit',62,'change_multibuydiscountbenefit'),(189,'Can delete Multibuy discount benefit',62,'delete_multibuydiscountbenefit'),(190,'Can add Range',63,'add_range'),(191,'Can change Range',63,'change_range'),(192,'Can delete Range',63,'delete_range'),(193,'Can add Condition',64,'add_condition'),(194,'Can change Condition',64,'change_condition'),(195,'Can delete Condition',64,'delete_condition'),(196,'Can add shipping benefit',62,'add_shippingbenefit'),(197,'Can change shipping benefit',62,'change_shippingbenefit'),(198,'Can delete shipping benefit',62,'delete_shippingbenefit'),(199,'Can add Shipping percentage discount benefit',62,'add_shippingpercentagediscountbenefit'),(200,'Can change Shipping percentage discount benefit',62,'change_shippingpercentagediscountbenefit'),(201,'Can delete Shipping percentage discount benefit',62,'delete_shippingpercentagediscountbenefit'),(202,'Can add Conditional offer',65,'add_conditionaloffer'),(203,'Can change Conditional offer',65,'change_conditionaloffer'),(204,'Can delete Conditional offer',65,'delete_conditionaloffer'),(205,'Can add Shipping absolute discount benefit',62,'add_shippingabsolutediscountbenefit'),(206,'Can change Shipping absolute discount benefit',62,'change_shippingabsolutediscountbenefit'),(207,'Can delete Shipping absolute discount benefit',62,'delete_shippingabsolutediscountbenefit'),(208,'Can add Percentage discount benefit',62,'add_percentagediscountbenefit'),(209,'Can change Percentage discount benefit',62,'change_percentagediscountbenefit'),(210,'Can delete Percentage discount benefit',62,'delete_percentagediscountbenefit'),(211,'Can add Absolute discount benefit',62,'add_absolutediscountbenefit'),(212,'Can change Absolute discount benefit',62,'change_absolutediscountbenefit'),(213,'Can delete Absolute discount benefit',62,'delete_absolutediscountbenefit'),(214,'Can add Coverage Condition',64,'add_coveragecondition'),(215,'Can change Coverage Condition',64,'change_coveragecondition'),(216,'Can delete Coverage Condition',64,'delete_coveragecondition'),(217,'Can add Range Product Uploaded File',66,'add_rangeproductfileupload'),(218,'Can change Range Product Uploaded File',66,'change_rangeproductfileupload'),(219,'Can delete Range Product Uploaded File',66,'delete_rangeproductfileupload'),(220,'Can add Fixed price benefit',62,'add_fixedpricebenefit'),(221,'Can change Fixed price benefit',62,'change_fixedpricebenefit'),(222,'Can delete Fixed price benefit',62,'delete_fixedpricebenefit'),(223,'Can add Fixed price shipping benefit',62,'add_shippingfixedpricebenefit'),(224,'Can change Fixed price shipping benefit',62,'change_shippingfixedpricebenefit'),(225,'Can delete Fixed price shipping benefit',62,'delete_shippingfixedpricebenefit'),(226,'Can add Value condition',64,'add_valuecondition'),(227,'Can change Value condition',64,'change_valuecondition'),(228,'Can delete Value condition',64,'delete_valuecondition'),(229,'Can add Count condition',64,'add_countcondition'),(230,'Can change Count condition',64,'change_countcondition'),(231,'Can delete Count condition',64,'delete_countcondition'),(232,'Can add Voucher Application',67,'add_voucherapplication'),(233,'Can change Voucher Application',67,'change_voucherapplication'),(234,'Can delete Voucher Application',67,'delete_voucherapplication'),(235,'Can add Voucher',68,'add_voucher'),(236,'Can change Voucher',68,'change_voucher'),(237,'Can delete Voucher',68,'delete_voucher'),(238,'Can add course',69,'add_course'),(239,'Can change course',69,'change_course'),(240,'Can delete course',69,'delete_course'),(241,'Can add flat page',70,'add_flatpage'),(242,'Can change flat page',70,'change_flatpage'),(243,'Can delete flat page',70,'delete_flatpage'),(244,'Can add session',71,'add_session'),(245,'Can change session',71,'change_session'),(246,'Can delete session',71,'delete_session'),(247,'Can add nonce',72,'add_nonce'),(248,'Can change nonce',72,'change_nonce'),(249,'Can delete nonce',72,'delete_nonce'),(250,'Can add code',73,'add_code'),(251,'Can change code',73,'change_code'),(252,'Can delete code',73,'delete_code'),(253,'Can add association',74,'add_association'),(254,'Can change association',74,'change_association'),(255,'Can delete association',74,'delete_association'),(256,'Can add partial',75,'add_partial'),(257,'Can change partial',75,'change_partial'),(258,'Can delete partial',75,'delete_partial'),(259,'Can add user social auth',76,'add_usersocialauth'),(260,'Can change user social auth',76,'change_usersocialauth'),(261,'Can delete user social auth',76,'delete_usersocialauth'),(262,'Can add business client',77,'add_businessclient'),(263,'Can change business client',77,'change_businessclient'),(264,'Can delete business client',77,'delete_businessclient'),(265,'Can add historical course',78,'add_historicalcourse'),(266,'Can change historical course',78,'change_historicalcourse'),(267,'Can delete historical course',78,'delete_historicalcourse'),(268,'Can add historical invoice',79,'add_historicalinvoice'),(269,'Can change historical invoice',79,'change_historicalinvoice'),(270,'Can delete historical invoice',79,'delete_historicalinvoice'),(271,'Can add invoice',80,'add_invoice'),(272,'Can change invoice',80,'change_invoice'),(273,'Can delete invoice',80,'delete_invoice'),(274,'Can add referral',81,'add_referral'),(275,'Can change referral',81,'change_referral'),(276,'Can delete referral',81,'delete_referral'),(277,'Can add site theme',82,'add_sitetheme'),(278,'Can change site theme',82,'change_sitetheme'),(279,'Can delete site theme',82,'delete_sitetheme'),(280,'Can add historical refund line',83,'add_historicalrefundline'),(281,'Can change historical refund line',83,'change_historicalrefundline'),(282,'Can delete historical refund line',83,'delete_historicalrefundline'),(283,'Can add refund line',84,'add_refundline'),(284,'Can change refund line',84,'change_refundline'),(285,'Can delete refund line',84,'delete_refundline'),(286,'Can add refund',85,'add_refund'),(287,'Can change refund',85,'change_refund'),(288,'Can delete refund',85,'delete_refund'),(289,'Can add historical refund',86,'add_historicalrefund'),(290,'Can change historical refund',86,'change_historicalrefund'),(291,'Can delete historical refund',86,'delete_historicalrefund'),(292,'Can add Weight-based Shipping Method',87,'add_weightbased'),(293,'Can change Weight-based Shipping Method',87,'change_weightbased'),(294,'Can delete Weight-based Shipping Method',87,'delete_weightbased'),(295,'Can add Order and Item Charge',88,'add_orderanditemcharges'),(296,'Can change Order and Item Charge',88,'change_orderanditemcharges'),(297,'Can delete Order and Item Charge',88,'delete_orderanditemcharges'),(298,'Can add Weight Band',89,'add_weightband'),(299,'Can change Weight Band',89,'change_weightband'),(300,'Can delete Weight Band',89,'delete_weightband'),(301,'Can add Vote',90,'add_vote'),(302,'Can change Vote',90,'change_vote'),(303,'Can delete Vote',90,'delete_vote'),(304,'Can add Product review',91,'add_productreview'),(305,'Can change Product review',91,'change_productreview'),(306,'Can delete Product review',91,'delete_productreview'),(307,'Can add paypal web profile',92,'add_paypalwebprofile'),(308,'Can change paypal web profile',92,'change_paypalwebprofile'),(309,'Can delete paypal web profile',92,'delete_paypalwebprofile'),(310,'Can add Paypal Processor Configuration',93,'add_paypalprocessorconfiguration'),(311,'Can change Paypal Processor Configuration',93,'change_paypalprocessorconfiguration'),(312,'Can delete Paypal Processor Configuration',93,'delete_paypalprocessorconfiguration'),(313,'Can add Bankcard',94,'add_bankcard'),(314,'Can change Bankcard',94,'change_bankcard'),(315,'Can delete Bankcard',94,'delete_bankcard'),(316,'Can add Payment Processor Response',95,'add_paymentprocessorresponse'),(317,'Can change Payment Processor Response',95,'change_paymentprocessorresponse'),(318,'Can delete Payment Processor Response',95,'delete_paymentprocessorresponse'),(319,'Can add Transaction',96,'add_transaction'),(320,'Can change Transaction',96,'change_transaction'),(321,'Can delete Transaction',96,'delete_transaction'),(322,'Can add Source Type',97,'add_sourcetype'),(323,'Can change Source Type',97,'change_sourcetype'),(324,'Can delete Source Type',97,'delete_sourcetype'),(325,'Can add SDN Check Failure',98,'add_sdncheckfailure'),(326,'Can change SDN Check Failure',98,'change_sdncheckfailure'),(327,'Can delete SDN Check Failure',98,'delete_sdncheckfailure'),(328,'Can add Source',99,'add_source'),(329,'Can change Source',99,'change_source'),(330,'Can delete Source',99,'delete_source'),(331,'Can add historical Order',111,'add_historicalorder'),(332,'Can change historical Order',111,'change_historicalorder'),(333,'Can delete historical Order',111,'delete_historicalorder'),(334,'Can add historical Order Line',112,'add_historicalline'),(335,'Can change historical Order Line',112,'change_historicalline'),(336,'Can delete historical Order Line',112,'delete_historicalline'),(337,'Can add Automatic product list',113,'add_automaticproductlist'),(338,'Can change Automatic product list',113,'change_automaticproductlist'),(339,'Can delete Automatic product list',113,'delete_automaticproductlist'),(340,'Can add Raw HTML',114,'add_rawhtml'),(341,'Can change Raw HTML',114,'change_rawhtml'),(342,'Can delete Raw HTML',114,'delete_rawhtml'),(343,'Can add Image',115,'add_image'),(344,'Can change Image',115,'change_image'),(345,'Can delete Image',115,'delete_image'),(346,'Can add Multi Image',116,'add_multiimage'),(347,'Can change Multi Image',116,'change_multiimage'),(348,'Can delete Multi Image',116,'delete_multiimage'),(349,'Can add Ordered product',117,'add_orderedproduct'),(350,'Can change Ordered product',117,'change_orderedproduct'),(351,'Can delete Ordered product',117,'delete_orderedproduct'),(352,'Can add Tabbed Block',118,'add_tabbedblock'),(353,'Can change Tabbed Block',118,'change_tabbedblock'),(354,'Can delete Tabbed Block',118,'delete_tabbedblock'),(355,'Can add Page Promotion',119,'add_pagepromotion'),(356,'Can change Page Promotion',119,'change_pagepromotion'),(357,'Can delete Page Promotion',119,'delete_pagepromotion'),(358,'Can add Hand Picked Product List',120,'add_handpickedproductlist'),(359,'Can change Hand Picked Product List',120,'change_handpickedproductlist'),(360,'Can delete Hand Picked Product List',120,'delete_handpickedproductlist'),(361,'Can add Ordered Product List',121,'add_orderedproductlist'),(362,'Can change Ordered Product List',121,'change_orderedproductlist'),(363,'Can delete Ordered Product List',121,'delete_orderedproductlist'),(364,'Can add Single product',122,'add_singleproduct'),(365,'Can change Single product',122,'change_singleproduct'),(366,'Can delete Single product',122,'delete_singleproduct'),(367,'Can add Keyword Promotion',123,'add_keywordpromotion'),(368,'Can change Keyword Promotion',123,'change_keywordpromotion'),(369,'Can delete Keyword Promotion',123,'delete_keywordpromotion'),(370,'Can add order line vouchers',124,'add_orderlinevouchers'),(371,'Can change order line vouchers',124,'change_orderlinevouchers'),(372,'Can delete order line vouchers',124,'delete_orderlinevouchers'),(373,'Can add coupon vouchers',125,'add_couponvouchers'),(374,'Can change coupon vouchers',125,'change_couponvouchers'),(375,'Can delete coupon vouchers',125,'delete_couponvouchers'),(376,'Can add Wish List',126,'add_wishlist'),(377,'Can change Wish List',126,'change_wishlist'),(378,'Can delete Wish List',126,'delete_wishlist'),(379,'Can add Wish list line',127,'add_line'),(380,'Can change Wish list line',127,'change_line'),(381,'Can delete Wish list line',127,'delete_line'),(382,'Can add kv store',128,'add_kvstore'),(383,'Can change kv store',128,'change_kvstore'),(384,'Can delete kv store',128,'delete_kvstore');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basket_basket`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basket_basket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(128) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_merged` datetime(6) DEFAULT NULL,
  `date_submitted` datetime(6) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `basket_basket_owner_id_3a018de5_fk_ecommerce_user_id` (`owner_id`),
  KEY `basket_basket_site_id_c45bd035_fk_django_site_id` (`site_id`),
  CONSTRAINT `basket_basket_owner_id_3a018de5_fk_ecommerce_user_id` FOREIGN KEY (`owner_id`) REFERENCES `ecommerce_user` (`id`),
  CONSTRAINT `basket_basket_site_id_c45bd035_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket_basket`
--

LOCK TABLES `basket_basket` WRITE;
/*!40000 ALTER TABLE `basket_basket` DISABLE KEYS */;
/*!40000 ALTER TABLE `basket_basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basket_basket_vouchers`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basket_basket_vouchers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basket_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `basket_basket_vouchers_basket_id_0731eee2_uniq` (`basket_id`,`voucher_id`),
  KEY `basket_basket_vouchers_voucher_id_c2b66981_fk_voucher_voucher_id` (`voucher_id`),
  CONSTRAINT `basket_basket_vouchers_basket_id_f857c2f8_fk_basket_basket_id` FOREIGN KEY (`basket_id`) REFERENCES `basket_basket` (`id`),
  CONSTRAINT `basket_basket_vouchers_voucher_id_c2b66981_fk_voucher_voucher_id` FOREIGN KEY (`voucher_id`) REFERENCES `voucher_voucher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket_basket_vouchers`
--

LOCK TABLES `basket_basket_vouchers` WRITE;
/*!40000 ALTER TABLE `basket_basket_vouchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `basket_basket_vouchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basket_basketattribute`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basket_basketattribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value_text` longtext NOT NULL,
  `attribute_type_id` int(11) NOT NULL,
  `basket_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `basket_basketattribute_basket_id_a6c168f8_uniq` (`basket_id`,`attribute_type_id`),
  KEY `bask_attribute_type_id_822adc5d_fk_basket_basketattributetype_id` (`attribute_type_id`),
  CONSTRAINT `bask_attribute_type_id_822adc5d_fk_basket_basketattributetype_id` FOREIGN KEY (`attribute_type_id`) REFERENCES `basket_basketattributetype` (`id`),
  CONSTRAINT `basket_basketattribute_basket_id_55c452f8_fk_basket_basket_id` FOREIGN KEY (`basket_id`) REFERENCES `basket_basket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket_basketattribute`
--

LOCK TABLES `basket_basketattribute` WRITE;
/*!40000 ALTER TABLE `basket_basketattribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `basket_basketattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basket_basketattributetype`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basket_basketattributetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket_basketattributetype`
--

LOCK TABLES `basket_basketattributetype` WRITE;
/*!40000 ALTER TABLE `basket_basketattributetype` DISABLE KEYS */;
INSERT INTO `basket_basketattributetype` VALUES (2,'bundle_identifier'),(1,'sailthru_bid');
/*!40000 ALTER TABLE `basket_basketattributetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basket_line`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basket_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `line_reference` varchar(128) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `price_currency` varchar(12) NOT NULL,
  `price_excl_tax` decimal(12,2) DEFAULT NULL,
  `price_incl_tax` decimal(12,2) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `basket_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `stockrecord_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `basket_line_basket_id_8977e974_uniq` (`basket_id`,`line_reference`),
  KEY `basket_line_767217f5` (`line_reference`),
  KEY `basket_line_product_id_303d743e_fk_catalogue_product_id` (`product_id`),
  KEY `basket_line_stockrecord_id_7039d8a4_fk_partner_stockrecord_id` (`stockrecord_id`),
  CONSTRAINT `basket_line_basket_id_b615c905_fk_basket_basket_id` FOREIGN KEY (`basket_id`) REFERENCES `basket_basket` (`id`),
  CONSTRAINT `basket_line_product_id_303d743e_fk_catalogue_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `basket_line_stockrecord_id_7039d8a4_fk_partner_stockrecord_id` FOREIGN KEY (`stockrecord_id`) REFERENCES `partner_stockrecord` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket_line`
--

LOCK TABLES `basket_line` WRITE;
/*!40000 ALTER TABLE `basket_line` DISABLE KEYS */;
/*!40000 ALTER TABLE `basket_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basket_lineattribute`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basket_lineattribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  `line_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `basket_lineattribute_line_id_c41e0cdf_fk_basket_line_id` (`line_id`),
  KEY `basket_lineattribute_option_id_9387a3f7_fk_catalogue_option_id` (`option_id`),
  CONSTRAINT `basket_lineattribute_line_id_c41e0cdf_fk_basket_line_id` FOREIGN KEY (`line_id`) REFERENCES `basket_line` (`id`),
  CONSTRAINT `basket_lineattribute_option_id_9387a3f7_fk_catalogue_option_id` FOREIGN KEY (`option_id`) REFERENCES `catalogue_option` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket_lineattribute`
--

LOCK TABLES `basket_lineattribute` WRITE;
/*!40000 ALTER TABLE `basket_lineattribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `basket_lineattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_attributeoption`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_attributeoption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogue_attributeoption_group_id_7a8f6c11_uniq` (`group_id`,`option`),
  CONSTRAINT `catalogue_group_id_3d4a5e24_fk_catalogue_attributeoptiongroup_id` FOREIGN KEY (`group_id`) REFERENCES `catalogue_attributeoptiongroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_attributeoption`
--

LOCK TABLES `catalogue_attributeoption` WRITE;
/*!40000 ALTER TABLE `catalogue_attributeoption` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_attributeoption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_attributeoptiongroup`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_attributeoptiongroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_attributeoptiongroup`
--

LOCK TABLES `catalogue_attributeoptiongroup` WRITE;
/*!40000 ALTER TABLE `catalogue_attributeoptiongroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_attributeoptiongroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_catalog`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `partner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogue_catalog_partner_id_eeba0b62_fk_partner_partner_id` (`partner_id`),
  CONSTRAINT `catalogue_catalog_partner_id_eeba0b62_fk_partner_partner_id` FOREIGN KEY (`partner_id`) REFERENCES `partner_partner` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_catalog`
--

LOCK TABLES `catalogue_catalog` WRITE;
/*!40000 ALTER TABLE `catalogue_catalog` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_catalog_stock_records`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_catalog_stock_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalog_id` int(11) NOT NULL,
  `stockrecord_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogue_catalog_stock_records_catalog_id_f363d53b_uniq` (`catalog_id`,`stockrecord_id`),
  KEY `catalogue_cata_stockrecord_id_e480f401_fk_partner_stockrecord_id` (`stockrecord_id`),
  CONSTRAINT `catalogue_cata_stockrecord_id_e480f401_fk_partner_stockrecord_id` FOREIGN KEY (`stockrecord_id`) REFERENCES `partner_stockrecord` (`id`),
  CONSTRAINT `catalogue_catalog_st_catalog_id_8fa6c918_fk_catalogue_catalog_id` FOREIGN KEY (`catalog_id`) REFERENCES `catalogue_catalog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_catalog_stock_records`
--

LOCK TABLES `catalogue_catalog_stock_records` WRITE;
/*!40000 ALTER TABLE `catalogue_catalog_stock_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_catalog_stock_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_category`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `depth` int(10) unsigned NOT NULL,
  `numchild` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`),
  KEY `catalogue_category_b068931c` (`name`),
  KEY `catalogue_category_2dbcba41` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_category`
--

LOCK TABLES `catalogue_category` WRITE;
/*!40000 ALTER TABLE `catalogue_category` DISABLE KEYS */;
INSERT INTO `catalogue_category` VALUES (1,'0001',1,1,'Seats','All course seats','','seats'),(2,'0002',1,15,'Coupons','All Coupons','','coupons'),(3,'00020001',2,0,'Affiliate Promotion','','','affiliate-promotion'),(4,'00020002',2,0,'Bulk Enrollment','','','bulk-enrollment'),(5,'00020003',2,0,'ConnectEd','','','connected'),(6,'00020004',2,0,'Course Promotion','','','course-promotion'),(7,'00020005',2,0,'Customer Service','','','customer-service'),(8,'00020006',2,0,'Financial Assistance','','','financial-assistance'),(9,'00020007',2,0,'Geography Promotion','','','geography-promotion'),(10,'00020008',2,0,'Marketing Partner Promotion','','','marketing-partner-promotion'),(11,'00020009',2,0,'Marketing-Other','','','marketing-other'),(12,'0002000A',2,0,'Paid Cohort','','','paid-cohort'),(13,'0002000B',2,0,'Other','','','other'),(14,'0002000C',2,0,'Retention Promotion','','','retention-promotion'),(15,'0002000D',2,0,'Services-Other','','','services-other'),(16,'0002000E',2,0,'Support-Other','','','support-other'),(17,'0002000F',2,0,'Upsell Promotion','','','upsell-promotion'),(18,'0003',1,0,'Course Entitlements','All course entitlements','','course_entitlements'),(19,'0004',1,0,'Donations','All donations','','donations');
/*!40000 ALTER TABLE `catalogue_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_option`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(128) NOT NULL,
  `type` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_option`
--

LOCK TABLES `catalogue_option` WRITE;
/*!40000 ALTER TABLE `catalogue_option` DISABLE KEYS */;
INSERT INTO `catalogue_option` VALUES (1,'Course Entitlement','course_entitlement','Optional');
/*!40000 ALTER TABLE `catalogue_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_product`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structure` varchar(10) NOT NULL,
  `upc` varchar(64) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `rating` double DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `is_discountable` tinyint(1) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `product_class_id` int(11) DEFAULT NULL,
  `course_id` varchar(255) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `upc` (`upc`),
  KEY `catalogue_product_2dbcba41` (`slug`),
  KEY `catalogue_product_9474e4b5` (`date_updated`),
  KEY `catalogue_product_parent_id_9bfd2382_fk_catalogue_product_id` (`parent_id`),
  KEY `catalogue_product_course_id_1918bc6b_fk_courses_course_id` (`course_id`),
  KEY `catalogue_product_class_id_0c6c5b54_fk_catalogue_productclass_id` (`product_class_id`),
  CONSTRAINT `catalogue_product_class_id_0c6c5b54_fk_catalogue_productclass_id` FOREIGN KEY (`product_class_id`) REFERENCES `catalogue_productclass` (`id`),
  CONSTRAINT `catalogue_product_course_id_1918bc6b_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `catalogue_product_parent_id_9bfd2382_fk_catalogue_product_id` FOREIGN KEY (`parent_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_product`
--

LOCK TABLES `catalogue_product` WRITE;
/*!40000 ALTER TABLE `catalogue_product` DISABLE KEYS */;
INSERT INTO `catalogue_product` VALUES (1,'parent',NULL,'Seat in edX Demonstration Course','seat-in-edx-demonstration-course','',NULL,'2018-02-02 15:05:41.711720','2018-02-02 15:05:41.717384',1,NULL,1,'course-v1:edX+DemoX+Demo_Course',NULL),(2,'child',NULL,'Seat in edX Demonstration Course','seat-in-edx-demonstration-course','',NULL,'2018-02-02 15:05:41.733143','2018-02-02 15:05:41.733175',1,1,NULL,'course-v1:edX+DemoX+Demo_Course',NULL),(3,'child',NULL,'Seat in edX Demonstration Course with verified certificate (and ID verification)','seat-in-edx-demonstration-course-with-verified-certificate-and-id-verification','',NULL,'2018-02-02 15:05:41.764904','2018-02-02 15:05:41.764939',1,1,NULL,'course-v1:edX+DemoX+Demo_Course','2019-02-02 15:05:41.690970');
/*!40000 ALTER TABLE `catalogue_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_product_product_options`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_product_product_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogue_product_product_options_product_id_9b3abb31_uniq` (`product_id`,`option_id`),
  KEY `catalogue_product_prod_option_id_ff470e13_fk_catalogue_option_id` (`option_id`),
  CONSTRAINT `catalogue_product_pr_product_id_ad2b46bd_fk_catalogue_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `catalogue_product_prod_option_id_ff470e13_fk_catalogue_option_id` FOREIGN KEY (`option_id`) REFERENCES `catalogue_option` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_product_product_options`
--

LOCK TABLES `catalogue_product_product_options` WRITE;
/*!40000 ALTER TABLE `catalogue_product_product_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_product_product_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_productattribute`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_productattribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(128) NOT NULL,
  `type` varchar(20) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `option_group_id` int(11) DEFAULT NULL,
  `product_class_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ca_option_group_id_6b422dc2_fk_catalogue_attributeoptiongroup_id` (`option_group_id`),
  KEY `catalogue_productattribute_c1336794` (`code`),
  KEY `catalogue_product_class_id_7af808ec_fk_catalogue_productclass_id` (`product_class_id`),
  CONSTRAINT `ca_option_group_id_6b422dc2_fk_catalogue_attributeoptiongroup_id` FOREIGN KEY (`option_group_id`) REFERENCES `catalogue_attributeoptiongroup` (`id`),
  CONSTRAINT `catalogue_product_class_id_7af808ec_fk_catalogue_productclass_id` FOREIGN KEY (`product_class_id`) REFERENCES `catalogue_productclass` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productattribute`
--

LOCK TABLES `catalogue_productattribute` WRITE;
/*!40000 ALTER TABLE `catalogue_productattribute` DISABLE KEYS */;
INSERT INTO `catalogue_productattribute` VALUES (1,'course_key','course_key','text',1,NULL,1),(2,'id_verification_required','id_verification_required','boolean',0,NULL,1),(3,'certificate_type','certificate_type','text',0,NULL,1),(4,'credit_provider','credit_provider','text',0,NULL,1),(5,'credit_hours','credit_hours','integer',0,NULL,1),(6,'Coupon vouchers','coupon_vouchers','entity',1,NULL,2),(7,'Note','note','text',0,NULL,2),(8,'Course Key','course_key','text',1,NULL,3),(9,'Seat Type','seat_type','text',1,NULL,3),(10,'id_verification_required','id_verification_required','boolean',0,NULL,3),(11,'UUID','UUID','text',1,NULL,4),(12,'certificate_type','certificate_type','text',0,NULL,4);
/*!40000 ALTER TABLE `catalogue_productattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_productattributevalue`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_productattributevalue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value_text` longtext,
  `value_integer` int(11) DEFAULT NULL,
  `value_boolean` tinyint(1) DEFAULT NULL,
  `value_float` double DEFAULT NULL,
  `value_richtext` longtext,
  `value_date` date DEFAULT NULL,
  `value_file` varchar(255) DEFAULT NULL,
  `value_image` varchar(255) DEFAULT NULL,
  `entity_object_id` int(10) unsigned DEFAULT NULL,
  `attribute_id` int(11) NOT NULL,
  `entity_content_type_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `value_option_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogue_productattributevalue_attribute_id_1e8e7112_uniq` (`attribute_id`,`product_id`),
  KEY `catalo_entity_content_type_id_f7186ab5_fk_django_content_type_id` (`entity_content_type_id`),
  KEY `catalogue_productatt_product_id_a03cd90e_fk_catalogue_product_id` (`product_id`),
  KEY `catalog_value_option_id_21026066_fk_catalogue_attributeoption_id` (`value_option_id`),
  CONSTRAINT `catalo_entity_content_type_id_f7186ab5_fk_django_content_type_id` FOREIGN KEY (`entity_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `catalog_value_option_id_21026066_fk_catalogue_attributeoption_id` FOREIGN KEY (`value_option_id`) REFERENCES `catalogue_attributeoption` (`id`),
  CONSTRAINT `catalogue_attribute_id_0287c1e7_fk_catalogue_productattribute_id` FOREIGN KEY (`attribute_id`) REFERENCES `catalogue_productattribute` (`id`),
  CONSTRAINT `catalogue_productatt_product_id_a03cd90e_fk_catalogue_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productattributevalue`
--

LOCK TABLES `catalogue_productattributevalue` WRITE;
/*!40000 ALTER TABLE `catalogue_productattributevalue` DISABLE KEYS */;
INSERT INTO `catalogue_productattributevalue` VALUES (1,'course-v1:edX+DemoX+Demo_Course',NULL,NULL,NULL,NULL,NULL,'','',NULL,1,NULL,1,NULL),(2,'course-v1:edX+DemoX+Demo_Course',NULL,NULL,NULL,NULL,NULL,'','',NULL,1,NULL,2,NULL),(3,NULL,NULL,0,NULL,NULL,NULL,'','',NULL,2,NULL,2,NULL),(4,'verified',NULL,NULL,NULL,NULL,NULL,'','',NULL,3,NULL,3,NULL),(5,'course-v1:edX+DemoX+Demo_Course',NULL,NULL,NULL,NULL,NULL,'','',NULL,1,NULL,3,NULL),(6,NULL,NULL,1,NULL,NULL,NULL,'','',NULL,2,NULL,3,NULL);
/*!40000 ALTER TABLE `catalogue_productattributevalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_productcategory`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_productcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogue_productcategory_product_id_8f0dbfe2_uniq` (`product_id`,`category_id`),
  KEY `catalogue_productc_category_id_176db535_fk_catalogue_category_id` (`category_id`),
  CONSTRAINT `catalogue_productc_category_id_176db535_fk_catalogue_category_id` FOREIGN KEY (`category_id`) REFERENCES `catalogue_category` (`id`),
  CONSTRAINT `catalogue_productcat_product_id_846a4061_fk_catalogue_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productcategory`
--

LOCK TABLES `catalogue_productcategory` WRITE;
/*!40000 ALTER TABLE `catalogue_productcategory` DISABLE KEYS */;
INSERT INTO `catalogue_productcategory` VALUES (1,1,1);
/*!40000 ALTER TABLE `catalogue_productcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_productclass`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_productclass` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `requires_shipping` tinyint(1) NOT NULL,
  `track_stock` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productclass`
--

LOCK TABLES `catalogue_productclass` WRITE;
/*!40000 ALTER TABLE `catalogue_productclass` DISABLE KEYS */;
INSERT INTO `catalogue_productclass` VALUES (1,'Seat','seat',0,0),(2,'Coupon','coupon',0,0),(3,'Enrollment Code','enrollment_code',0,0),(4,'Course Entitlement','course-entitlement',0,0),(5,'Donation','donation',0,0);
/*!40000 ALTER TABLE `catalogue_productclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_productclass_options`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_productclass_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productclass_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogue_productclass_options_productclass_id_2266c635_uniq` (`productclass_id`,`option_id`),
  KEY `catalogue_productclass_option_id_b099542c_fk_catalogue_option_id` (`option_id`),
  CONSTRAINT `catalogue__productclass_id_732df4c8_fk_catalogue_productclass_id` FOREIGN KEY (`productclass_id`) REFERENCES `catalogue_productclass` (`id`),
  CONSTRAINT `catalogue_productclass_option_id_b099542c_fk_catalogue_option_id` FOREIGN KEY (`option_id`) REFERENCES `catalogue_option` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productclass_options`
--

LOCK TABLES `catalogue_productclass_options` WRITE;
/*!40000 ALTER TABLE `catalogue_productclass_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_productclass_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_productimage`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_productimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original` varchar(255) NOT NULL,
  `caption` varchar(200) NOT NULL,
  `display_order` int(10) unsigned NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogue_productimage_product_id_2df78171_uniq` (`product_id`,`display_order`),
  CONSTRAINT `catalogue_productima_product_id_49474fe8_fk_catalogue_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productimage`
--

LOCK TABLES `catalogue_productimage` WRITE;
/*!40000 ALTER TABLE `catalogue_productimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_productimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_productrecommendation`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_productrecommendation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ranking` smallint(5) unsigned NOT NULL,
  `primary_id` int(11) NOT NULL,
  `recommendation_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogue_productrecommendation_primary_id_da1fdf43_uniq` (`primary_id`,`recommendation_id`),
  KEY `catalogue_pro_recommendation_id_daf8ae95_fk_catalogue_product_id` (`recommendation_id`),
  CONSTRAINT `catalogue_pro_recommendation_id_daf8ae95_fk_catalogue_product_id` FOREIGN KEY (`recommendation_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `catalogue_productrec_primary_id_6e51a55c_fk_catalogue_product_id` FOREIGN KEY (`primary_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productrecommendation`
--

LOCK TABLES `catalogue_productrecommendation` WRITE;
/*!40000 ALTER TABLE `catalogue_productrecommendation` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_productrecommendation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_businessclient`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_businessclient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_businessclient`
--

LOCK TABLES `core_businessclient` WRITE;
/*!40000 ALTER TABLE `core_businessclient` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_businessclient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_client`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_client` (
  `user_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`user_ptr_id`),
  CONSTRAINT `core_client_user_ptr_id_e5908bcf_fk_ecommerce_user_id` FOREIGN KEY (`user_ptr_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_client`
--

LOCK TABLES `core_client` WRITE;
/*!40000 ALTER TABLE `core_client` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_siteconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_siteconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lms_url_root` varchar(200) NOT NULL,
  `theme_scss_path` varchar(255) DEFAULT NULL,
  `payment_processors` varchar(255) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `oauth_settings` longtext NOT NULL,
  `segment_key` varchar(255) DEFAULT NULL,
  `from_email` varchar(255) DEFAULT NULL,
  `enable_enrollment_codes` tinyint(1) NOT NULL,
  `payment_support_email` varchar(255) NOT NULL,
  `payment_support_url` varchar(255) NOT NULL,
  `affiliate_cookie_name` varchar(255) NOT NULL,
  `utm_cookie_name` varchar(255) NOT NULL,
  `client_side_payment_processor` varchar(255) DEFAULT NULL,
  `send_refund_notifications` tinyint(1) NOT NULL,
  `enable_sdn_check` tinyint(1) NOT NULL,
  `sdn_api_key` varchar(255) NOT NULL,
  `sdn_api_list` varchar(255) NOT NULL,
  `sdn_api_url` varchar(255) NOT NULL,
  `require_account_activation` tinyint(1) NOT NULL,
  `optimizely_snippet_src` varchar(255) NOT NULL,
  `enable_sailthru` tinyint(1) NOT NULL,
  `base_cookie_domain` varchar(255) NOT NULL,
  `enable_embargo_check` tinyint(1) NOT NULL,
  `discovery_api_url` varchar(200) NOT NULL,
  `enable_apple_pay` tinyint(1) NOT NULL,
  `enable_partial_program` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_siteconfiguration_site_id_3124a87d_uniq` (`site_id`),
  UNIQUE KEY `core_siteconfiguration_partner_id_75739217_uniq` (`partner_id`),
  CONSTRAINT `core_siteconfiguration_partner_id_75739217_fk_partner_partner_id` FOREIGN KEY (`partner_id`) REFERENCES `partner_partner` (`id`),
  CONSTRAINT `core_siteconfiguration_site_id_3124a87d_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_siteconfiguration`
--

LOCK TABLES `core_siteconfiguration` WRITE;
/*!40000 ALTER TABLE `core_siteconfiguration` DISABLE KEYS */;
INSERT INTO `core_siteconfiguration` VALUES (1,'http://edx.devstack.lms:18000',NULL,'cybersource,paypal',1,1,'{\"SOCIAL_AUTH_EDX_OIDC_ID_TOKEN_DECRYPTION_KEY\":\"ecommerce-secret\",\"SOCIAL_AUTH_EDX_OIDC_URL_ROOT\":\"http://edx.devstack.lms:18000/oauth2\",\"SOCIAL_AUTH_EDX_OIDC_ISSUERS\":[\"http://edx.devstack.lms:18000\"],\"SOCIAL_AUTH_EDX_OIDC_KEY\":\"ecommerce-key\",\"SOCIAL_AUTH_EDX_OIDC_SECRET\":\"ecommerce-secret\"}',NULL,'staff@example.com',0,'support@example.com','','','','cybersource',0,0,'','','',1,'',0,'',0,'http://edx.devstack.discovery:18381/api/v1/',0,0);
/*!40000 ALTER TABLE `core_siteconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_course`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_course` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `thumbnail_url` varchar(200) DEFAULT NULL,
  `verification_deadline` datetime(6) DEFAULT NULL,
  `site_id` int(11) NOT NULL,
  `created` datetime(6),
  `modified` datetime(6),
  PRIMARY KEY (`id`),
  KEY `courses_course_site_id_af38aac5_fk_django_site_id` (`site_id`),
  CONSTRAINT `courses_course_site_id_af38aac5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_course`
--

LOCK TABLES `courses_course` WRITE;
/*!40000 ALTER TABLE `courses_course` DISABLE KEYS */;
INSERT INTO `courses_course` VALUES ('course-v1:edX+DemoX+Demo_Course','edX Demonstration Course',NULL,'2020-02-02 15:05:41.690970',1,'2018-02-02 15:05:41.703298','2018-02-02 15:05:41.703319');
/*!40000 ALTER TABLE `courses_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_communicationeventtype`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_communicationeventtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(128) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `email_subject_template` varchar(255) DEFAULT NULL,
  `email_body_template` longtext,
  `email_body_html_template` longtext,
  `sms_template` varchar(170) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_communicationeventtype`
--

LOCK TABLES `customer_communicationeventtype` WRITE;
/*!40000 ALTER TABLE `customer_communicationeventtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_communicationeventtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_email`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` longtext NOT NULL,
  `body_text` longtext NOT NULL,
  `body_html` longtext NOT NULL,
  `date_sent` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_email_user_id_a69ad588_fk_ecommerce_user_id` (`user_id`),
  CONSTRAINT `customer_email_user_id_a69ad588_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_email`
--

LOCK TABLES `customer_email` WRITE;
/*!40000 ALTER TABLE `customer_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_notification`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `category` varchar(255) NOT NULL,
  `location` varchar(32) NOT NULL,
  `date_sent` datetime(6) NOT NULL,
  `date_read` datetime(6) DEFAULT NULL,
  `recipient_id` int(11) NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_notification_recipient_id_d99de5c8_fk_ecommerce_user_id` (`recipient_id`),
  KEY `customer_notification_sender_id_affa1632_fk_ecommerce_user_id` (`sender_id`),
  CONSTRAINT `customer_notification_recipient_id_d99de5c8_fk_ecommerce_user_id` FOREIGN KEY (`recipient_id`) REFERENCES `ecommerce_user` (`id`),
  CONSTRAINT `customer_notification_sender_id_affa1632_fk_ecommerce_user_id` FOREIGN KEY (`sender_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_notification`
--

LOCK TABLES `customer_notification` WRITE;
/*!40000 ALTER TABLE `customer_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_productalert`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_productalert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `key` varchar(128) NOT NULL,
  `status` varchar(20) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_confirmed` datetime(6) DEFAULT NULL,
  `date_cancelled` datetime(6) DEFAULT NULL,
  `date_closed` datetime(6) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_productaler_product_id_7e529a41_fk_catalogue_product_id` (`product_id`),
  KEY `customer_productalert_user_id_677ad6d6_fk_ecommerce_user_id` (`user_id`),
  KEY `customer_productalert_0c83f57c` (`email`),
  KEY `customer_productalert_3c6e0b8a` (`key`),
  CONSTRAINT `customer_productaler_product_id_7e529a41_fk_catalogue_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `customer_productalert_user_id_677ad6d6_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_productalert`
--

LOCK TABLES `customer_productalert` WRITE;
/*!40000 ALTER TABLE `customer_productalert` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_productalert` ENABLE KEYS */;
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
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_ecommerce_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
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
-- Table structure for table `django_content_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (7,'address','country'),(8,'address','useraddress'),(9,'admin','logentry'),(27,'analytics','productrecord'),(24,'analytics','userproductview'),(25,'analytics','userrecord'),(26,'analytics','usersearch'),(3,'auth','group'),(2,'auth','permission'),(43,'basket','basket'),(41,'basket','basketattribute'),(42,'basket','basketattributetype'),(44,'basket','line'),(45,'basket','lineattribute'),(10,'catalogue','attributeoption'),(18,'catalogue','attributeoptiongroup'),(15,'catalogue','catalog'),(14,'catalogue','category'),(23,'catalogue','historicalproduct'),(22,'catalogue','historicalproductattributevalue'),(12,'catalogue','option'),(11,'catalogue','product'),(17,'catalogue','productattribute'),(20,'catalogue','productattributevalue'),(21,'catalogue','productcategory'),(13,'catalogue','productclass'),(19,'catalogue','productimage'),(16,'catalogue','productrecommendation'),(1,'contenttypes','contenttype'),(77,'core','businessclient'),(6,'core','client'),(4,'core','siteconfiguration'),(5,'core','user'),(69,'courses','course'),(78,'courses','historicalcourse'),(39,'customer','communicationeventtype'),(38,'customer','email'),(40,'customer','notification'),(37,'customer','productalert'),(70,'flatpages','flatpage'),(79,'invoice','historicalinvoice'),(80,'invoice','invoice'),(106,'offer','absolutediscountbenefit'),(62,'offer','benefit'),(64,'offer','condition'),(65,'offer','conditionaloffer'),(102,'offer','countcondition'),(101,'offer','coveragecondition'),(110,'offer','fixedpricebenefit'),(104,'offer','multibuydiscountbenefit'),(109,'offer','percentagediscountbenefit'),(63,'offer','range'),(61,'offer','rangeproduct'),(66,'offer','rangeproductfileupload'),(108,'offer','shippingabsolutediscountbenefit'),(107,'offer','shippingbenefit'),(100,'offer','shippingfixedpricebenefit'),(105,'offer','shippingpercentagediscountbenefit'),(103,'offer','valuecondition'),(48,'order','billingaddress'),(52,'order','communicationevent'),(112,'order','historicalline'),(111,'order','historicalorder'),(50,'order','line'),(59,'order','lineattribute'),(46,'order','lineprice'),(54,'order','order'),(60,'order','orderdiscount'),(53,'order','ordernote'),(51,'order','paymentevent'),(55,'order','paymenteventquantity'),(58,'order','paymenteventtype'),(47,'order','shippingaddress'),(49,'order','shippingevent'),(57,'order','shippingeventquantity'),(56,'order','shippingeventtype'),(32,'partner','historicalstockrecord'),(33,'partner','partner'),(34,'partner','partneraddress'),(36,'partner','stockalert'),(35,'partner','stockrecord'),(94,'payment','bankcard'),(95,'payment','paymentprocessorresponse'),(93,'payment','paypalprocessorconfiguration'),(92,'payment','paypalwebprofile'),(98,'payment','sdncheckfailure'),(99,'payment','source'),(97,'payment','sourcetype'),(96,'payment','transaction'),(113,'promotions','automaticproductlist'),(120,'promotions','handpickedproductlist'),(115,'promotions','image'),(123,'promotions','keywordpromotion'),(116,'promotions','multiimage'),(117,'promotions','orderedproduct'),(121,'promotions','orderedproductlist'),(119,'promotions','pagepromotion'),(114,'promotions','rawhtml'),(122,'promotions','singleproduct'),(118,'promotions','tabbedblock'),(81,'referrals','referral'),(86,'refund','historicalrefund'),(83,'refund','historicalrefundline'),(85,'refund','refund'),(84,'refund','refundline'),(91,'reviews','productreview'),(90,'reviews','vote'),(71,'sessions','session'),(88,'shipping','orderanditemcharges'),(89,'shipping','weightband'),(87,'shipping','weightbased'),(31,'sites','site'),(74,'social_django','association'),(73,'social_django','code'),(72,'social_django','nonce'),(75,'social_django','partial'),(76,'social_django','usersocialauth'),(82,'theming','sitetheme'),(128,'thumbnail','kvstore'),(125,'voucher','couponvouchers'),(124,'voucher','orderlinevouchers'),(68,'voucher','voucher'),(67,'voucher','voucherapplication'),(30,'waffle','flag'),(28,'waffle','sample'),(29,'waffle','switch'),(127,'wishlists','line'),(126,'wishlists','wishlist');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_flatpage`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_flatpage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `enable_comments` tinyint(1) NOT NULL,
  `template_name` varchar(70) NOT NULL,
  `registration_required` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_flatpage_572d4e42` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_flatpage`
--

LOCK TABLES `django_flatpage` WRITE;
/*!40000 ALTER TABLE `django_flatpage` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_flatpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_flatpage_sites`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_flatpage_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flatpage_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_flatpage_sites_flatpage_id_0d29d9d1_uniq` (`flatpage_id`,`site_id`),
  KEY `django_flatpage_sites_site_id_bfd8ea84_fk_django_site_id` (`site_id`),
  CONSTRAINT `django_flatpage_sites_flatpage_id_078bbc8b_fk_django_flatpage_id` FOREIGN KEY (`flatpage_id`) REFERENCES `django_flatpage` (`id`),
  CONSTRAINT `django_flatpage_sites_site_id_bfd8ea84_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_flatpage_sites`
--

LOCK TABLES `django_flatpage_sites` WRITE;
/*!40000 ALTER TABLE `django_flatpage_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_flatpage_sites` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-06-21 16:05:49.551317'),(2,'auth','0001_initial','2017-06-21 16:05:49.673816'),(3,'core','0001_initial','2017-06-21 16:05:49.807312'),(4,'address','0001_initial','2017-06-21 16:05:49.926981'),(5,'admin','0001_initial','2017-06-21 16:05:49.993513'),(6,'admin','0002_logentry_remove_auto_add','2017-06-21 16:05:50.016405'),(7,'catalogue','0001_initial','2017-06-21 16:05:51.003261'),(8,'analytics','0001_initial','2017-06-21 16:05:51.281021'),(9,'analytics','0002_auto_20140827_1705','2017-06-21 16:05:51.471947'),(10,'contenttypes','0002_remove_content_type_name','2017-06-21 16:05:51.605464'),(11,'auth','0002_alter_permission_name_max_length','2017-06-21 16:05:51.667690'),(12,'auth','0003_alter_user_email_max_length','2017-06-21 16:05:51.704038'),(13,'auth','0004_alter_user_username_opts','2017-06-21 16:05:51.767547'),(14,'auth','0005_alter_user_last_login_null','2017-06-21 16:05:51.806075'),(15,'auth','0006_require_contenttypes_0002','2017-06-21 16:05:51.810382'),(16,'auth','0007_alter_validators_add_error_messages','2017-06-21 16:05:51.872874'),(17,'auth','0008_alter_user_username_max_length','2017-06-21 16:05:51.913960'),(18,'waffle','0001_initial','2017-06-21 16:05:52.135884'),(19,'sites','0001_initial','2017-06-21 16:05:52.152571'),(20,'partner','0001_initial','2017-06-21 16:05:52.734436'),(21,'customer','0001_initial','2017-06-21 16:05:52.981986'),(22,'basket','0001_initial','2017-06-21 16:05:53.054902'),(23,'basket','0002_auto_20140827_1705','2017-06-21 16:05:53.481365'),(24,'order','0001_initial','2017-06-21 16:05:56.279225'),(25,'offer','0001_initial','2017-06-21 16:05:57.369962'),(26,'voucher','0001_initial','2017-06-21 16:05:57.774380'),(27,'basket','0003_basket_vouchers','2017-06-21 16:05:57.898606'),(28,'basket','0004_auto_20141007_2032','2017-06-21 16:05:57.998004'),(29,'basket','0005_auto_20150709_1205','2017-06-21 16:05:58.126583'),(30,'basket','0006_basket_site','2017-06-21 16:05:58.260271'),(31,'basket','0007_auto_20160907_2040','2017-06-21 16:05:58.666312'),(32,'basket','0008_auto_20170215_2224','2017-06-21 16:05:58.762045'),(33,'basket','0009_auto_20170215_2229','2017-06-21 16:05:58.853370'),(34,'basket','0010_create_repeat_purchase_switch','2017-06-21 16:05:58.868269'),(35,'partner','0002_auto_20141007_2032','2017-06-21 16:05:58.959479'),(36,'partner','0003_auto_20150223_1130','2017-06-21 16:05:58.964988'),(37,'courses','0001_initial','2017-06-21 16:05:58.985294'),(38,'catalogue','0002_auto_20150223_1052','2017-06-21 16:05:58.999844'),(39,'catalogue','0003_product_course','2017-06-21 16:05:59.132713'),(40,'catalogue','0004_auto_20150609_0129','2017-06-21 16:05:59.832827'),(41,'partner','0004_auto_20150609_1215','2017-06-21 16:06:00.097699'),(42,'partner','0005_auto_20150610_1355','2017-06-21 16:06:00.505369'),(43,'partner','0006_auto_20150709_1205','2017-06-21 16:06:00.652897'),(44,'partner','0007_auto_20150914_0841','2017-06-21 16:06:00.915471'),(45,'partner','0008_auto_20150914_1057','2017-06-21 16:06:01.102651'),(46,'catalogue','0005_auto_20150610_1355','2017-06-21 16:06:01.848561'),(47,'catalogue','0006_credit_provider_attr','2017-06-21 16:06:01.863528'),(48,'catalogue','0007_auto_20150709_1205','2017-06-21 16:06:02.686841'),(49,'catalogue','0008_auto_20150709_1254','2017-06-21 16:06:02.949476'),(50,'catalogue','0009_credit_hours_attr','2017-06-21 16:06:02.967837'),(51,'catalogue','0010_catalog','2017-06-21 16:06:03.143270'),(52,'catalogue','0011_auto_20151019_0639','2017-06-21 16:06:03.413804'),(53,'catalogue','0012_enrollment_code_product_class','2017-06-21 16:06:03.419622'),(54,'catalogue','0013_coupon_product_class','2017-06-21 16:06:03.443933'),(55,'catalogue','0014_alter_couponvouchers_attribute','2017-06-21 16:06:03.460062'),(56,'catalogue','0015_default_categories','2017-06-21 16:06:03.550800'),(57,'catalogue','0016_coupon_note_attribute','2017-06-21 16:06:03.567405'),(58,'catalogue','0017_enrollment_code_product_class','2017-06-21 16:06:03.580494'),(59,'catalogue','0018_auto_20160530_0134','2017-06-21 16:06:03.680446'),(60,'catalogue','0019_enrollment_code_idverifyreq_attribute','2017-06-21 16:06:03.696244'),(61,'catalogue','0020_auto_20161025_1446','2017-06-21 16:06:03.794998'),(62,'catalogue','0021_auto_20170215_2224','2017-06-21 16:06:04.003025'),(63,'catalogue','0022_auto_20170215_2229','2017-06-21 16:06:04.103362'),(64,'catalogue','0023_auto_20170215_2234','2017-06-21 16:06:04.333640'),(65,'catalogue','0024_fix_enrollment_code_slug','2017-06-21 16:06:04.354223'),(66,'core','0002_auto_20150826_1455','2017-06-21 16:06:04.891149'),(67,'core','0003_auto_20150914_1120','2017-06-21 16:06:05.276691'),(68,'core','0004_auto_20150915_1023','2017-06-21 16:06:05.401159'),(69,'core','0005_auto_20150924_0123','2017-06-21 16:06:05.420381'),(70,'core','0006_add_service_user','2017-06-21 16:06:05.436037'),(71,'core','0007_auto_20151005_1333','2017-06-21 16:06:05.451894'),(72,'core','0008_client','2017-06-21 16:06:05.576998'),(73,'core','0009_service_user_privileges','2017-06-21 16:06:05.818551'),(74,'core','0010_add_async_sample','2017-06-21 16:06:05.833429'),(75,'core','0011_siteconfiguration_oauth_settings','2017-06-21 16:06:05.949988'),(76,'core','0012_businessclient','2017-06-21 16:06:05.976250'),(77,'core','0013_siteconfiguration_segment_key','2017-06-21 16:06:06.205485'),(78,'core','0014_enrollment_code_switch','2017-06-21 16:06:06.220427'),(79,'core','0015_siteconfiguration_from_email','2017-06-21 16:06:06.338747'),(80,'core','0016_siteconfiguration_enable_enrollment_codes','2017-06-21 16:06:06.460846'),(81,'core','0017_siteconfiguration_payment_support_email','2017-06-21 16:06:06.581720'),(82,'core','0018_siteconfiguration_payment_support_url','2017-06-21 16:06:06.704463'),(83,'core','0019_auto_20161012_1404','2017-06-21 16:06:07.064038'),(84,'core','0020_siteconfiguration_enable_otto_receipt_page','2017-06-21 16:06:07.182648'),(85,'core','0021_siteconfiguration_client_side_payment_processor','2017-06-21 16:06:07.301689'),(86,'core','0022_auto_20161108_2101','2017-06-21 16:06:07.404661'),(87,'core','0023_siteconfiguration_send_refund_notifications','2017-06-21 16:06:07.523941'),(88,'core','0024_auto_20170208_1520','2017-06-21 16:06:08.105558'),(89,'core','0025_auto_20170214_0003','2017-06-21 16:06:08.203122'),(90,'core','0026_auto_20170215_2234','2017-06-21 16:06:08.306396'),(91,'core','0027_siteconfiguration_require_account_activation','2017-06-21 16:06:08.552051'),(92,'core','0028_siteconfiguration_optimizely_snippet_src','2017-06-21 16:06:08.666797'),(93,'core','0029_auto_20170525_2131','2017-06-21 16:06:08.778008'),(94,'core','0030_auto_20170525_2134','2017-06-21 16:06:09.001822'),(95,'core','0031_siteconfiguration_enable_sailthru','2017-06-21 16:06:09.127717'),(96,'core','0032_auto_20170602_0516','2017-06-21 16:06:09.349844'),(97,'core','0033_auto_20170606_0539','2017-06-21 16:06:09.365479'),(98,'core','0034_auto_20170613_2039','2017-06-21 16:06:09.472448'),(99,'core','0035_siteconfiguration_base_cookie_domain','2017-06-21 16:06:09.585163'),(100,'sites','0002_alter_domain_unique','2017-06-21 16:06:09.691529'),(101,'courses','0002_historicalcourse','2017-06-21 16:06:09.819716'),(102,'courses','0003_auto_20150618_1108','2017-06-21 16:06:10.171366'),(103,'courses','0004_auto_20150803_1406','2017-06-21 16:06:10.391371'),(104,'courses','0005_auto_20170525_0131','2017-06-21 16:06:10.887317'),(105,'customer','0002_auto_20160517_0930','2017-06-21 16:06:10.986331'),(106,'customer','0003_auto_20170215_2229','2017-06-21 16:06:11.110497'),(107,'flatpages','0001_initial','2017-06-21 16:06:11.266107'),(108,'order','0002_auto_20141007_2032','2017-06-21 16:06:11.376644'),(109,'order','0003_auto_20150224_1520','2017-06-21 16:06:11.390396'),(110,'order','0004_order_payment_processor','2017-06-21 16:06:11.632563'),(111,'order','0005_deprecate_order_payment_processor','2017-06-21 16:06:11.750681'),(112,'order','0006_paymentevent_processor_name','2017-06-21 16:06:11.865118'),(113,'order','0007_create_history_tables','2017-06-21 16:06:12.187771'),(114,'order','0008_delete_order_payment_processor','2017-06-21 16:06:12.574357'),(115,'order','0009_auto_20150709_1205','2017-06-21 16:06:12.777236'),(116,'invoice','0001_initial','2017-06-21 16:06:13.040948'),(117,'invoice','0002_auto_20160324_1919','2017-06-21 16:06:13.816402'),(118,'invoice','0003_auto_20160616_0657','2017-06-21 16:06:15.760107'),(119,'invoice','0004_auto_20170215_2234','2017-06-21 16:06:16.147364'),(120,'offer','0002_range_catalog','2017-06-21 16:06:16.416336'),(121,'offer','0003_auto_20160517_1247','2017-06-21 16:06:16.710751'),(122,'offer','0004_auto_20160530_0944','2017-06-21 16:06:16.837796'),(123,'offer','0005_conditionaloffer_email_domains','2017-06-21 16:06:16.973152'),(124,'offer','0006_auto_20161025_1446','2017-06-21 16:06:17.219424'),(125,'offer','0007_auto_20161026_0856','2017-06-21 16:06:17.346607'),(126,'offer','0008_range_course_catalog','2017-06-21 16:06:17.477979'),(127,'offer','0009_range_enterprise_customer','2017-06-21 16:06:17.613167'),(128,'offer','0010_auto_20170215_2224','2017-06-21 16:06:17.739899'),(129,'offer','0011_auto_20170215_2324','2017-06-21 16:06:17.863985'),(130,'offer','0012_condition_program_uuid','2017-06-21 16:06:18.129709'),(131,'order','0010_auto_20160529_2245','2017-06-21 16:06:18.254820'),(132,'order','0011_auto_20161025_1446','2017-06-21 16:06:18.371561'),(133,'order','0012_auto_20170215_2224','2017-06-21 16:06:18.489137'),(134,'order','0013_auto_20170215_2229','2017-06-21 16:06:18.885862'),(135,'order','0014_auto_20170606_0535','2017-06-21 16:06:18.903407'),(136,'partner','0009_partner_enable_sailthru','2017-06-21 16:06:19.035418'),(137,'partner','0010_auto_20161025_1446','2017-06-21 16:06:19.151682'),(138,'partner','0011_auto_20170525_2138','2017-06-21 16:06:19.267604'),(139,'payment','0001_initial','2017-06-21 16:06:19.976606'),(140,'payment','0002_auto_20141007_2032','2017-06-21 16:06:20.103018'),(141,'payment','0003_create_payment_processor_response','2017-06-21 16:06:20.493407'),(142,'payment','0004_source_card_type','2017-06-21 16:06:20.625358'),(143,'payment','0005_paypalwebprofile','2017-06-21 16:06:20.647990'),(144,'payment','0006_enable_payment_processors','2017-06-21 16:06:20.663730'),(145,'payment','0007_add_cybersource_level23_sample','2017-06-21 16:06:20.681480'),(146,'payment','0008_remove_cybersource_level23_sample','2017-06-21 16:06:20.698834'),(147,'payment','0009_auto_20161025_1446','2017-06-21 16:06:20.822359'),(148,'payment','0010_create_client_side_checkout_flag','2017-06-21 16:06:20.839799'),(149,'payment','0011_paypalprocessorconfiguration','2017-06-21 16:06:20.862305'),(150,'payment','0012_auto_20161109_1456','2017-06-21 16:06:20.878022'),(151,'payment','0013_sdncheckfailure','2017-06-21 16:06:20.903319'),(152,'payment','0014_sdncheckfailure_site','2017-06-21 16:06:21.063991'),(153,'payment','0015_auto_20170215_2229','2017-06-21 16:06:21.339661'),(154,'payment','0016_auto_20170227_1402','2017-06-21 16:06:21.635754'),(155,'payment','0017_auto_20170328_1445','2017-06-21 16:06:21.899514'),(156,'programs','0001_initial','2017-06-21 16:06:22.063843'),(157,'promotions','0001_initial','2017-06-21 16:06:23.284416'),(158,'promotions','0002_auto_20150604_1450','2017-06-21 16:06:23.465607'),(159,'referrals','0001_initial','2017-06-21 16:06:23.757288'),(160,'referrals','0002_auto_20161011_1728','2017-06-21 16:06:25.029171'),(161,'referrals','0003_auto_20161027_1738','2017-06-21 16:06:25.312302'),(162,'referrals','0004_auto_20170215_2234','2017-06-21 16:06:25.609480'),(163,'refund','0001_squashed_0002_auto_20150515_2220','2017-06-21 16:06:26.575513'),(164,'refund','0002_auto_20151214_1017','2017-06-21 16:06:27.232747'),(165,'reviews','0001_initial','2017-06-21 16:06:27.985315'),(166,'reviews','0002_update_email_length','2017-06-21 16:06:28.139106'),(167,'reviews','0003_auto_20160802_1358','2017-06-21 16:06:28.403386'),(168,'sailthru','0001_initial','2017-06-21 16:06:28.421924'),(169,'sailthru','0002_add_basket_attribute_type','2017-06-21 16:06:28.437071'),(170,'sessions','0001_initial','2017-06-21 16:06:28.468366'),(171,'shipping','0001_initial','2017-06-21 16:06:29.014968'),(172,'shipping','0002_auto_20150604_1450','2017-06-21 16:06:29.505730'),(173,'default','0001_initial','2017-06-21 16:06:30.043098'),(174,'social_auth','0001_initial','2017-06-21 16:06:30.049813'),(175,'default','0002_add_related_name','2017-06-21 16:06:30.223472'),(176,'social_auth','0002_add_related_name','2017-06-21 16:06:30.229770'),(177,'default','0003_alter_email_max_length','2017-06-21 16:06:30.263494'),(178,'social_auth','0003_alter_email_max_length','2017-06-21 16:06:30.270071'),(179,'default','0004_auto_20160423_0400','2017-06-21 16:06:30.419632'),(180,'social_auth','0004_auto_20160423_0400','2017-06-21 16:06:30.426254'),(181,'social_auth','0005_auto_20160727_2333','2017-06-21 16:06:30.450190'),(182,'social_django','0006_partial','2017-06-21 16:06:30.481230'),(183,'theming','0001_initial','2017-06-21 16:06:30.652332'),(184,'thumbnail','0001_initial','2017-06-21 16:06:30.677127'),(185,'voucher','0002_couponvouchers','2017-06-21 16:06:31.021983'),(186,'voucher','0003_orderlinevouchers','2017-06-21 16:06:31.223652'),(187,'voucher','0004_auto_20160517_0930','2017-06-21 16:06:31.400781'),(188,'wishlists','0001_initial','2017-06-21 16:06:32.217424'),(189,'wishlists','0002_auto_20160111_1108','2017-06-21 16:06:32.518710'),(190,'social_django','0002_add_related_name','2017-06-21 16:06:32.532458'),(191,'social_django','0003_alter_email_max_length','2017-06-21 16:06:32.538204'),(192,'social_django','0001_initial','2017-06-21 16:06:32.543488'),(193,'social_django','0004_auto_20160423_0400','2017-06-21 16:06:32.550442'),(194,'social_django','0005_auto_20160727_2333','2017-06-21 16:06:32.557222'),(195,'catalogue','0025_course_entitlement','2018-02-02 15:04:36.043989'),(196,'catalogue','0026_course_entitlement_attr_change','2018-02-02 15:04:36.066765'),(197,'catalogue','0027_catalogue_entitlement_option','2018-02-02 15:04:36.084135'),(198,'catalogue','0028_donations_from_checkout_tests_product_type','2018-02-02 15:04:36.106716'),(199,'catalogue','0029_auto_20180119_0903','2018-02-02 15:04:37.915699'),(200,'core','0036_remove_siteconfiguration_enable_otto_receipt_page','2018-02-02 15:04:38.220718'),(201,'core','0037_siteconfiguration_enable_embargo_check','2018-02-02 15:04:38.456875'),(202,'core','0038_siteconfiguration_discovery_api_url','2018-02-02 15:04:38.629571'),(203,'core','0039_auto_20170716_2212','2018-02-02 15:04:39.070212'),(204,'core','0040_siteconfiguration__allowed_segment_events','2018-02-02 15:04:39.251384'),(205,'core','0041_remove_siteconfiguration__allowed_segment_events','2018-02-02 15:04:39.427232'),(206,'core','0042_siteconfiguration_enable_partial_program','2018-02-02 15:04:39.601100'),(207,'core','0043_auto_20170808_1009','2018-02-02 15:04:39.878005'),(208,'courses','0006_auto_20171204_1036','2018-02-02 15:04:40.633011'),(209,'courses','0007_auto_20180119_0903','2018-02-02 15:04:40.978205'),(210,'enterprise','0001_initial','2018-02-02 15:04:41.023420'),(211,'enterprise','0002_add_enterprise_offers_switch','2018-02-02 15:04:41.047719'),(212,'enterprise','0003_add_enable_enterprise_switch','2018-02-02 15:04:41.070982'),(213,'invoice','0005_auto_20180119_0903','2018-02-02 15:04:41.995282'),(214,'offer','0013_auto_20170801_0742','2018-02-02 15:04:42.147161'),(215,'offer','0014_conditionaloffer_site','2018-02-02 15:04:42.337828'),(216,'offer','0015_auto_20170926_1357','2018-02-02 15:04:42.960556'),(217,'order','0015_create_disable_repeat_order_check_switch','2018-02-02 15:04:42.984712'),(218,'order','0016_auto_20180119_0903','2018-02-02 15:04:45.150878'),(219,'partner','0012_auto_20180119_0903','2018-02-02 15:04:45.632992'),(220,'payment','0018_create_stripe_switch','2018-02-02 15:04:45.653982'),(221,'programs','0002_add_basket_attribute_type','2018-02-02 15:04:45.675431'),(222,'refund','0003_auto_20180119_0903','2018-02-02 15:04:46.889521'),(223,'waffle','0002_auto_20161201_0958','2018-02-02 15:04:46.910687');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
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
  KEY `django_session_de54fa62` (`expire_date`)
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
INSERT INTO `django_site` VALUES (1,'localhost:18130','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_user`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ecommerce_user` (
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
  `full_name` varchar(255) DEFAULT NULL,
  `tracking_context` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_user`
--

LOCK TABLES `ecommerce_user` WRITE;
/*!40000 ALTER TABLE `ecommerce_user` DISABLE KEYS */;
INSERT INTO `ecommerce_user` VALUES (1,'!LOoBxP3FzidYPy42iWpSG8F94w9ub92p6KRY7KY5',NULL,0,'ecommerce_worker','','','',1,1,'2017-06-21 16:06:05.430048',NULL,NULL),(2,'pbkdf2_sha256$30000$jhECgW9zCQNz$xjvlasvmEiR6LSJEZkdswzRtiwiN35E8AGdgqAIoqsk=',NULL,1,'edx','','','edx@example.com',1,1,'2017-06-21 16:06:34.938363',NULL,NULL),(3,'',NULL,0,'discovery_worker','','','discovery_worker@example.com',1,1,'2017-06-21 16:09:04.071620',NULL,NULL);
/*!40000 ALTER TABLE `ecommerce_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_user_groups`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ecommerce_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ecommerce_user_groups_user_id_2a9a583d_uniq` (`user_id`,`group_id`),
  KEY `ecommerce_user_groups_group_id_a8fd9cb8_fk_auth_group_id` (`group_id`),
  CONSTRAINT `ecommerce_user_groups_group_id_a8fd9cb8_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `ecommerce_user_groups_user_id_60d58887_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_user_groups`
--

LOCK TABLES `ecommerce_user_groups` WRITE;
/*!40000 ALTER TABLE `ecommerce_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_user_user_permissions`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ecommerce_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ecommerce_user_user_permissions_user_id_6d807de6_uniq` (`user_id`,`permission_id`),
  KEY `ecommerce_user_user_permission_id_4dc38e40_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `ecommerce_user_user_permis_user_id_0ceec4a8_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`),
  CONSTRAINT `ecommerce_user_user_permission_id_4dc38e40_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_user_user_permissions`
--

LOCK TABLES `ecommerce_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `ecommerce_user_user_permissions` DISABLE KEYS */;
INSERT INTO `ecommerce_user_user_permissions` VALUES (1,1,161);
/*!40000 ALTER TABLE `ecommerce_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_invoice`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `state` varchar(255) NOT NULL,
  `basket_id` int(11) DEFAULT NULL,
  `business_client_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `discount_type` varchar(255) DEFAULT NULL,
  `discount_value` int(10) unsigned DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `tax_deducted_source` int(10) unsigned DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_invoice_basket_id_8795b83e_fk_basket_basket_id` (`basket_id`),
  KEY `invoice_in_business_client_id_44a4b698_fk_core_businessclient_id` (`business_client_id`),
  KEY `invoice_invoice_order_id_c5fc9ae9_fk_order_order_id` (`order_id`),
  CONSTRAINT `invoice_in_business_client_id_44a4b698_fk_core_businessclient_id` FOREIGN KEY (`business_client_id`) REFERENCES `core_businessclient` (`id`),
  CONSTRAINT `invoice_invoice_basket_id_8795b83e_fk_basket_basket_id` FOREIGN KEY (`basket_id`) REFERENCES `basket_basket` (`id`),
  CONSTRAINT `invoice_invoice_order_id_c5fc9ae9_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_invoice`
--

LOCK TABLES `invoice_invoice` WRITE;
/*!40000 ALTER TABLE `invoice_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_benefit`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_benefit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(128) NOT NULL,
  `value` decimal(12,2) DEFAULT NULL,
  `max_affected_items` int(10) unsigned DEFAULT NULL,
  `proxy_class` varchar(255) DEFAULT NULL,
  `range_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `offer_benefit_range_id_ab19c5ab_fk_offer_range_id` (`range_id`),
  CONSTRAINT `offer_benefit_range_id_ab19c5ab_fk_offer_range_id` FOREIGN KEY (`range_id`) REFERENCES `offer_range` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_benefit`
--

LOCK TABLES `offer_benefit` WRITE;
/*!40000 ALTER TABLE `offer_benefit` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_benefit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_condition`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_condition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(128) NOT NULL,
  `value` decimal(12,2) DEFAULT NULL,
  `proxy_class` varchar(255) DEFAULT NULL,
  `range_id` int(11) DEFAULT NULL,
  `program_uuid` char(32) DEFAULT NULL,
  `enterprise_customer_catalog_uuid` char(32),
  `enterprise_customer_name` varchar(255),
  `enterprise_customer_uuid` char(32),
  PRIMARY KEY (`id`),
  KEY `offer_condition_range_id_b023a2aa_fk_offer_range_id` (`range_id`),
  CONSTRAINT `offer_condition_range_id_b023a2aa_fk_offer_range_id` FOREIGN KEY (`range_id`) REFERENCES `offer_range` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_condition`
--

LOCK TABLES `offer_condition` WRITE;
/*!40000 ALTER TABLE `offer_condition` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_conditionaloffer`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_conditionaloffer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `description` longtext NOT NULL,
  `offer_type` varchar(128) NOT NULL,
  `status` varchar(64) NOT NULL,
  `priority` int(11) NOT NULL,
  `start_datetime` datetime(6) DEFAULT NULL,
  `end_datetime` datetime(6) DEFAULT NULL,
  `max_global_applications` int(10) unsigned DEFAULT NULL,
  `max_user_applications` int(10) unsigned DEFAULT NULL,
  `max_basket_applications` int(10) unsigned DEFAULT NULL,
  `max_discount` decimal(12,2) DEFAULT NULL,
  `total_discount` decimal(12,2) NOT NULL,
  `num_applications` int(10) unsigned NOT NULL,
  `num_orders` int(10) unsigned NOT NULL,
  `redirect_url` varchar(200) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `benefit_id` int(11) NOT NULL,
  `condition_id` int(11) NOT NULL,
  `email_domains` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`),
  KEY `offer_conditionaloffer_benefit_id_f43f68b5_fk_offer_benefit_id` (`benefit_id`),
  KEY `offer_conditionaloff_condition_id_e6baa945_fk_offer_condition_id` (`condition_id`),
  KEY `offer_conditionaloffer_site_id_4409fcc5_fk_django_site_id` (`site_id`),
  CONSTRAINT `offer_conditionaloff_condition_id_e6baa945_fk_offer_condition_id` FOREIGN KEY (`condition_id`) REFERENCES `offer_condition` (`id`),
  CONSTRAINT `offer_conditionaloffer_benefit_id_f43f68b5_fk_offer_benefit_id` FOREIGN KEY (`benefit_id`) REFERENCES `offer_benefit` (`id`),
  CONSTRAINT `offer_conditionaloffer_site_id_4409fcc5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_conditionaloffer`
--

LOCK TABLES `offer_conditionaloffer` WRITE;
/*!40000 ALTER TABLE `offer_conditionaloffer` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_conditionaloffer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_range`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_range` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `description` longtext NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `includes_all_products` tinyint(1) NOT NULL,
  `proxy_class` varchar(255) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `catalog_id` int(11) DEFAULT NULL,
  `catalog_query` longtext,
  `course_seat_types` varchar(255) DEFAULT NULL,
  `course_catalog` int(10) unsigned DEFAULT NULL,
  `enterprise_customer` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`),
  UNIQUE KEY `proxy_class` (`proxy_class`),
  KEY `offer_range_catalog_id_10237996_fk_catalogue_catalog_id` (`catalog_id`),
  CONSTRAINT `offer_range_catalog_id_10237996_fk_catalogue_catalog_id` FOREIGN KEY (`catalog_id`) REFERENCES `catalogue_catalog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_range`
--

LOCK TABLES `offer_range` WRITE;
/*!40000 ALTER TABLE `offer_range` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_range_classes`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_range_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `range_id` int(11) NOT NULL,
  `productclass_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offer_range_classes_range_id_28eeefae_uniq` (`range_id`,`productclass_id`),
  KEY `offer_rang_productclass_id_6f6de46d_fk_catalogue_productclass_id` (`productclass_id`),
  CONSTRAINT `offer_rang_productclass_id_6f6de46d_fk_catalogue_productclass_id` FOREIGN KEY (`productclass_id`) REFERENCES `catalogue_productclass` (`id`),
  CONSTRAINT `offer_range_classes_range_id_7d3e573e_fk_offer_range_id` FOREIGN KEY (`range_id`) REFERENCES `offer_range` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_range_classes`
--

LOCK TABLES `offer_range_classes` WRITE;
/*!40000 ALTER TABLE `offer_range_classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_range_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_range_excluded_products`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_range_excluded_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `range_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offer_range_excluded_products_range_id_eb1cfe87_uniq` (`range_id`,`product_id`),
  KEY `offer_range_excluded_product_id_78c49bfc_fk_catalogue_product_id` (`product_id`),
  CONSTRAINT `offer_range_excluded_product_id_78c49bfc_fk_catalogue_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `offer_range_excluded_product_range_id_cce4a032_fk_offer_range_id` FOREIGN KEY (`range_id`) REFERENCES `offer_range` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_range_excluded_products`
--

LOCK TABLES `offer_range_excluded_products` WRITE;
/*!40000 ALTER TABLE `offer_range_excluded_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_range_excluded_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_range_included_categories`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_range_included_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `range_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offer_range_included_categories_range_id_a661d336_uniq` (`range_id`,`category_id`),
  KEY `offer_range_includ_category_id_c61569a5_fk_catalogue_category_id` (`category_id`),
  CONSTRAINT `offer_range_includ_category_id_c61569a5_fk_catalogue_category_id` FOREIGN KEY (`category_id`) REFERENCES `catalogue_category` (`id`),
  CONSTRAINT `offer_range_included_categor_range_id_1b616138_fk_offer_range_id` FOREIGN KEY (`range_id`) REFERENCES `offer_range` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_range_included_categories`
--

LOCK TABLES `offer_range_included_categories` WRITE;
/*!40000 ALTER TABLE `offer_range_included_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_range_included_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_rangeproduct`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_rangeproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_order` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `range_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offer_rangeproduct_range_id_c46b1be8_uniq` (`range_id`,`product_id`),
  KEY `offer_rangeproduct_product_id_723b3ea3_fk_catalogue_product_id` (`product_id`),
  CONSTRAINT `offer_rangeproduct_product_id_723b3ea3_fk_catalogue_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `offer_rangeproduct_range_id_ee358495_fk_offer_range_id` FOREIGN KEY (`range_id`) REFERENCES `offer_range` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_rangeproduct`
--

LOCK TABLES `offer_rangeproduct` WRITE;
/*!40000 ALTER TABLE `offer_rangeproduct` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_rangeproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_rangeproductfileupload`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_rangeproductfileupload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filepath` varchar(255) NOT NULL,
  `size` int(10) unsigned NOT NULL,
  `date_uploaded` datetime(6) NOT NULL,
  `status` varchar(32) NOT NULL,
  `error_message` varchar(255) NOT NULL,
  `date_processed` datetime(6) DEFAULT NULL,
  `num_new_skus` int(10) unsigned DEFAULT NULL,
  `num_unknown_skus` int(10) unsigned DEFAULT NULL,
  `num_duplicate_skus` int(10) unsigned DEFAULT NULL,
  `range_id` int(11) NOT NULL,
  `uploaded_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `offer_rangeproductfileupload_range_id_c055ebf8_fk_offer_range_id` (`range_id`),
  KEY `offer_rangeproductf_uploaded_by_id_c01a3250_fk_ecommerce_user_id` (`uploaded_by_id`),
  CONSTRAINT `offer_rangeproductf_uploaded_by_id_c01a3250_fk_ecommerce_user_id` FOREIGN KEY (`uploaded_by_id`) REFERENCES `ecommerce_user` (`id`),
  CONSTRAINT `offer_rangeproductfileupload_range_id_c055ebf8_fk_offer_range_id` FOREIGN KEY (`range_id`) REFERENCES `offer_range` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_rangeproductfileupload`
--

LOCK TABLES `offer_rangeproductfileupload` WRITE;
/*!40000 ALTER TABLE `offer_rangeproductfileupload` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_rangeproductfileupload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_billingaddress`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_billingaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `line1` varchar(255) NOT NULL,
  `line2` varchar(255) NOT NULL,
  `line3` varchar(255) NOT NULL,
  `line4` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `postcode` varchar(64) NOT NULL,
  `search_text` longtext NOT NULL,
  `country_id` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_billi_country_id_17f57dca_fk_address_country_iso_3166_1_a2` (`country_id`),
  CONSTRAINT `order_billi_country_id_17f57dca_fk_address_country_iso_3166_1_a2` FOREIGN KEY (`country_id`) REFERENCES `address_country` (`iso_3166_1_a2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_billingaddress`
--

LOCK TABLES `order_billingaddress` WRITE;
/*!40000 ALTER TABLE `order_billingaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_billingaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_communicationevent`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_communicationevent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) NOT NULL,
  `event_type_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ord_event_type_id_4bc9ee29_fk_customer_communicationeventtype_id` (`event_type_id`),
  KEY `order_communicationevent_order_id_94e784ac_fk_order_order_id` (`order_id`),
  CONSTRAINT `ord_event_type_id_4bc9ee29_fk_customer_communicationeventtype_id` FOREIGN KEY (`event_type_id`) REFERENCES `customer_communicationeventtype` (`id`),
  CONSTRAINT `order_communicationevent_order_id_94e784ac_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_communicationevent`
--

LOCK TABLES `order_communicationevent` WRITE;
/*!40000 ALTER TABLE `order_communicationevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_communicationevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_line`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partner_name` varchar(128) NOT NULL,
  `partner_sku` varchar(128) NOT NULL,
  `partner_line_reference` varchar(128) NOT NULL,
  `partner_line_notes` longtext NOT NULL,
  `title` varchar(255) NOT NULL,
  `upc` varchar(128) DEFAULT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `line_price_incl_tax` decimal(12,2) NOT NULL,
  `line_price_excl_tax` decimal(12,2) NOT NULL,
  `line_price_before_discounts_incl_tax` decimal(12,2) NOT NULL,
  `line_price_before_discounts_excl_tax` decimal(12,2) NOT NULL,
  `unit_cost_price` decimal(12,2) DEFAULT NULL,
  `unit_price_incl_tax` decimal(12,2) DEFAULT NULL,
  `unit_price_excl_tax` decimal(12,2) DEFAULT NULL,
  `unit_retail_price` decimal(12,2) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `est_dispatch_date` date DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `partner_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `stockrecord_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_line_order_id_b9148391_fk_order_order_id` (`order_id`),
  KEY `order_line_partner_id_258a2fb9_fk_partner_partner_id` (`partner_id`),
  KEY `order_line_product_id_e620902d_fk_catalogue_product_id` (`product_id`),
  KEY `order_line_stockrecord_id_1d65aff5_fk_partner_stockrecord_id` (`stockrecord_id`),
  CONSTRAINT `order_line_order_id_b9148391_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  CONSTRAINT `order_line_partner_id_258a2fb9_fk_partner_partner_id` FOREIGN KEY (`partner_id`) REFERENCES `partner_partner` (`id`),
  CONSTRAINT `order_line_product_id_e620902d_fk_catalogue_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `order_line_stockrecord_id_1d65aff5_fk_partner_stockrecord_id` FOREIGN KEY (`stockrecord_id`) REFERENCES `partner_stockrecord` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_line`
--

LOCK TABLES `order_line` WRITE;
/*!40000 ALTER TABLE `order_line` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_lineattribute`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_lineattribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(128) NOT NULL,
  `value` varchar(255) NOT NULL,
  `line_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_lineattribute_line_id_adf6dd87_fk_order_line_id` (`line_id`),
  KEY `order_lineattribute_option_id_b54d597c_fk_catalogue_option_id` (`option_id`),
  CONSTRAINT `order_lineattribute_line_id_adf6dd87_fk_order_line_id` FOREIGN KEY (`line_id`) REFERENCES `order_line` (`id`),
  CONSTRAINT `order_lineattribute_option_id_b54d597c_fk_catalogue_option_id` FOREIGN KEY (`option_id`) REFERENCES `catalogue_option` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_lineattribute`
--

LOCK TABLES `order_lineattribute` WRITE;
/*!40000 ALTER TABLE `order_lineattribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_lineattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_lineprice`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_lineprice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(10) unsigned NOT NULL,
  `price_incl_tax` decimal(12,2) NOT NULL,
  `price_excl_tax` decimal(12,2) NOT NULL,
  `shipping_incl_tax` decimal(12,2) NOT NULL,
  `shipping_excl_tax` decimal(12,2) NOT NULL,
  `line_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_lineprice_line_id_2de52446_fk_order_line_id` (`line_id`),
  KEY `order_lineprice_order_id_66792e56_fk_order_order_id` (`order_id`),
  CONSTRAINT `order_lineprice_line_id_2de52446_fk_order_line_id` FOREIGN KEY (`line_id`) REFERENCES `order_line` (`id`),
  CONSTRAINT `order_lineprice_order_id_66792e56_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_lineprice`
--

LOCK TABLES `order_lineprice` WRITE;
/*!40000 ALTER TABLE `order_lineprice` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_lineprice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_order`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(128) NOT NULL,
  `currency` varchar(12) NOT NULL,
  `total_incl_tax` decimal(12,2) NOT NULL,
  `total_excl_tax` decimal(12,2) NOT NULL,
  `shipping_incl_tax` decimal(12,2) NOT NULL,
  `shipping_excl_tax` decimal(12,2) NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `status` varchar(100) NOT NULL,
  `guest_email` varchar(254) NOT NULL,
  `date_placed` datetime(6) NOT NULL,
  `basket_id` int(11) DEFAULT NULL,
  `billing_address_id` int(11) DEFAULT NULL,
  `shipping_address_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`),
  KEY `order_order_basket_id_8b0acbb2_fk_basket_basket_id` (`basket_id`),
  KEY `order_ord_billing_address_id_8fe537cf_fk_order_billingaddress_id` (`billing_address_id`),
  KEY `order_order_90e84921` (`date_placed`),
  KEY `order_o_shipping_address_id_57e64931_fk_order_shippingaddress_id` (`shipping_address_id`),
  KEY `order_order_site_id_e27f3526_fk_django_site_id` (`site_id`),
  KEY `order_order_user_id_7cf9bc2b_fk_ecommerce_user_id` (`user_id`),
  CONSTRAINT `order_o_shipping_address_id_57e64931_fk_order_shippingaddress_id` FOREIGN KEY (`shipping_address_id`) REFERENCES `order_shippingaddress` (`id`),
  CONSTRAINT `order_ord_billing_address_id_8fe537cf_fk_order_billingaddress_id` FOREIGN KEY (`billing_address_id`) REFERENCES `order_billingaddress` (`id`),
  CONSTRAINT `order_order_basket_id_8b0acbb2_fk_basket_basket_id` FOREIGN KEY (`basket_id`) REFERENCES `basket_basket` (`id`),
  CONSTRAINT `order_order_site_id_e27f3526_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`),
  CONSTRAINT `order_order_user_id_7cf9bc2b_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_order`
--

LOCK TABLES `order_order` WRITE;
/*!40000 ALTER TABLE `order_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_orderdiscount`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_orderdiscount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(64) NOT NULL,
  `offer_id` int(10) unsigned DEFAULT NULL,
  `offer_name` varchar(128) NOT NULL,
  `voucher_id` int(10) unsigned DEFAULT NULL,
  `voucher_code` varchar(128) NOT NULL,
  `frequency` int(10) unsigned DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL,
  `message` longtext NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_orderdiscount_order_id_bc91e123_fk_order_order_id` (`order_id`),
  KEY `order_orderdiscount_9eeed246` (`offer_name`),
  KEY `order_orderdiscount_08e4f7cd` (`voucher_code`),
  CONSTRAINT `order_orderdiscount_order_id_bc91e123_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_orderdiscount`
--

LOCK TABLES `order_orderdiscount` WRITE;
/*!40000 ALTER TABLE `order_orderdiscount` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_orderdiscount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_ordernote`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_ordernote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note_type` varchar(128) NOT NULL,
  `message` longtext NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_ordernote_order_id_7d97583d_fk_order_order_id` (`order_id`),
  KEY `order_ordernote_user_id_48d7a672_fk_ecommerce_user_id` (`user_id`),
  CONSTRAINT `order_ordernote_order_id_7d97583d_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  CONSTRAINT `order_ordernote_user_id_48d7a672_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_ordernote`
--

LOCK TABLES `order_ordernote` WRITE;
/*!40000 ALTER TABLE `order_ordernote` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_ordernote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_paymentevent`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_paymentevent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(12,2) NOT NULL,
  `reference` varchar(128) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `event_type_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `shipping_event_id` int(11) DEFAULT NULL,
  `processor_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_paymen_event_type_id_568c7161_fk_order_paymenteventtype_id` (`event_type_id`),
  KEY `order_paymentevent_order_id_395b3e82_fk_order_order_id` (`order_id`),
  KEY `order_payme_shipping_event_id_213dcfb8_fk_order_shippingevent_id` (`shipping_event_id`),
  CONSTRAINT `order_payme_shipping_event_id_213dcfb8_fk_order_shippingevent_id` FOREIGN KEY (`shipping_event_id`) REFERENCES `order_shippingevent` (`id`),
  CONSTRAINT `order_paymen_event_type_id_568c7161_fk_order_paymenteventtype_id` FOREIGN KEY (`event_type_id`) REFERENCES `order_paymenteventtype` (`id`),
  CONSTRAINT `order_paymentevent_order_id_395b3e82_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_paymentevent`
--

LOCK TABLES `order_paymentevent` WRITE;
/*!40000 ALTER TABLE `order_paymentevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_paymentevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_paymenteventquantity`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_paymenteventquantity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(10) unsigned NOT NULL,
  `event_id` int(11) NOT NULL,
  `line_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_paymenteventquantity_event_id_765c5209_uniq` (`event_id`,`line_id`),
  KEY `order_paymenteventquantity_line_id_df44b021_fk_order_line_id` (`line_id`),
  CONSTRAINT `order_paymenteventqua_event_id_a540165a_fk_order_paymentevent_id` FOREIGN KEY (`event_id`) REFERENCES `order_paymentevent` (`id`),
  CONSTRAINT `order_paymenteventquantity_line_id_df44b021_fk_order_line_id` FOREIGN KEY (`line_id`) REFERENCES `order_line` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_paymenteventquantity`
--

LOCK TABLES `order_paymenteventquantity` WRITE;
/*!40000 ALTER TABLE `order_paymenteventquantity` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_paymenteventquantity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_paymenteventtype`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_paymenteventtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_paymenteventtype`
--

LOCK TABLES `order_paymenteventtype` WRITE;
/*!40000 ALTER TABLE `order_paymenteventtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_paymenteventtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_shippingaddress`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_shippingaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `line1` varchar(255) NOT NULL,
  `line2` varchar(255) NOT NULL,
  `line3` varchar(255) NOT NULL,
  `line4` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `postcode` varchar(64) NOT NULL,
  `search_text` longtext NOT NULL,
  `phone_number` varchar(128) NOT NULL,
  `notes` longtext NOT NULL,
  `country_id` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_shipp_country_id_29abf9a0_fk_address_country_iso_3166_1_a2` (`country_id`),
  CONSTRAINT `order_shipp_country_id_29abf9a0_fk_address_country_iso_3166_1_a2` FOREIGN KEY (`country_id`) REFERENCES `address_country` (`iso_3166_1_a2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_shippingaddress`
--

LOCK TABLES `order_shippingaddress` WRITE;
/*!40000 ALTER TABLE `order_shippingaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_shippingaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_shippingevent`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_shippingevent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notes` longtext NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `event_type_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_shipp_event_type_id_9f1efb20_fk_order_shippingeventtype_id` (`event_type_id`),
  KEY `order_shippingevent_order_id_8c031fb6_fk_order_order_id` (`order_id`),
  CONSTRAINT `order_shipp_event_type_id_9f1efb20_fk_order_shippingeventtype_id` FOREIGN KEY (`event_type_id`) REFERENCES `order_shippingeventtype` (`id`),
  CONSTRAINT `order_shippingevent_order_id_8c031fb6_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_shippingevent`
--

LOCK TABLES `order_shippingevent` WRITE;
/*!40000 ALTER TABLE `order_shippingevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_shippingevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_shippingeventquantity`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_shippingeventquantity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(10) unsigned NOT NULL,
  `event_id` int(11) NOT NULL,
  `line_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_shippingeventquantity_event_id_91687107_uniq` (`event_id`,`line_id`),
  KEY `order_shippingeventquantity_line_id_3b089ee0_fk_order_line_id` (`line_id`),
  CONSTRAINT `order_shippingeventq_event_id_1c7fb9c7_fk_order_shippingevent_id` FOREIGN KEY (`event_id`) REFERENCES `order_shippingevent` (`id`),
  CONSTRAINT `order_shippingeventquantity_line_id_3b089ee0_fk_order_line_id` FOREIGN KEY (`line_id`) REFERENCES `order_line` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_shippingeventquantity`
--

LOCK TABLES `order_shippingeventquantity` WRITE;
/*!40000 ALTER TABLE `order_shippingeventquantity` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_shippingeventquantity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_shippingeventtype`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_shippingeventtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_shippingeventtype`
--

LOCK TABLES `order_shippingeventtype` WRITE;
/*!40000 ALTER TABLE `order_shippingeventtype` DISABLE KEYS */;
INSERT INTO `order_shippingeventtype` VALUES (1,'Shipped','shipped');
/*!40000 ALTER TABLE `order_shippingeventtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_partner`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_partner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `short_code` varchar(8) NOT NULL,
  `enable_sailthru` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `short_code` (`short_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_partner`
--

LOCK TABLES `partner_partner` WRITE;
/*!40000 ALTER TABLE `partner_partner` DISABLE KEYS */;
INSERT INTO `partner_partner` VALUES (1,'edX','Open edX','edX',1);
/*!40000 ALTER TABLE `partner_partner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_partner_users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_partner_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partner_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `partner_partner_users_partner_id_9e5c0517_uniq` (`partner_id`,`user_id`),
  KEY `partner_partner_users_user_id_d75d6e40_fk_ecommerce_user_id` (`user_id`),
  CONSTRAINT `partner_partner_users_partner_id_1883dfd9_fk_partner_partner_id` FOREIGN KEY (`partner_id`) REFERENCES `partner_partner` (`id`),
  CONSTRAINT `partner_partner_users_user_id_d75d6e40_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_partner_users`
--

LOCK TABLES `partner_partner_users` WRITE;
/*!40000 ALTER TABLE `partner_partner_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `partner_partner_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_partneraddress`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_partneraddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `line1` varchar(255) NOT NULL,
  `line2` varchar(255) NOT NULL,
  `line3` varchar(255) NOT NULL,
  `line4` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `postcode` varchar(64) NOT NULL,
  `search_text` longtext NOT NULL,
  `country_id` varchar(2) NOT NULL,
  `partner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `partner_par_country_id_02c4f979_fk_address_country_iso_3166_1_a2` (`country_id`),
  KEY `partner_partneraddress_partner_id_59551b0a_fk_partner_partner_id` (`partner_id`),
  CONSTRAINT `partner_par_country_id_02c4f979_fk_address_country_iso_3166_1_a2` FOREIGN KEY (`country_id`) REFERENCES `address_country` (`iso_3166_1_a2`),
  CONSTRAINT `partner_partneraddress_partner_id_59551b0a_fk_partner_partner_id` FOREIGN KEY (`partner_id`) REFERENCES `partner_partner` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_partneraddress`
--

LOCK TABLES `partner_partneraddress` WRITE;
/*!40000 ALTER TABLE `partner_partneraddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `partner_partneraddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_stockalert`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_stockalert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `threshold` int(10) unsigned NOT NULL,
  `status` varchar(128) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_closed` datetime(6) DEFAULT NULL,
  `stockrecord_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `partner_stocka_stockrecord_id_68ad503a_fk_partner_stockrecord_id` (`stockrecord_id`),
  CONSTRAINT `partner_stocka_stockrecord_id_68ad503a_fk_partner_stockrecord_id` FOREIGN KEY (`stockrecord_id`) REFERENCES `partner_stockrecord` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_stockalert`
--

LOCK TABLES `partner_stockalert` WRITE;
/*!40000 ALTER TABLE `partner_stockalert` DISABLE KEYS */;
/*!40000 ALTER TABLE `partner_stockalert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_stockrecord`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_stockrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partner_sku` varchar(128) NOT NULL,
  `price_currency` varchar(12) NOT NULL,
  `price_excl_tax` decimal(12,2) DEFAULT NULL,
  `price_retail` decimal(12,2) DEFAULT NULL,
  `cost_price` decimal(12,2) DEFAULT NULL,
  `num_in_stock` int(10) unsigned DEFAULT NULL,
  `num_allocated` int(11) DEFAULT NULL,
  `low_stock_threshold` int(10) unsigned DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `partner_stockrecord_partner_id_8441e010_uniq` (`partner_id`,`partner_sku`),
  KEY `partner_stockrecord_product_id_62fd9e45_fk_catalogue_product_id` (`product_id`),
  KEY `partner_stockrecord_9474e4b5` (`date_updated`),
  CONSTRAINT `partner_stockrecord_partner_id_4155a586_fk_partner_partner_id` FOREIGN KEY (`partner_id`) REFERENCES `partner_partner` (`id`),
  CONSTRAINT `partner_stockrecord_product_id_62fd9e45_fk_catalogue_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_stockrecord`
--

LOCK TABLES `partner_stockrecord` WRITE;
/*!40000 ALTER TABLE `partner_stockrecord` DISABLE KEYS */;
INSERT INTO `partner_stockrecord` VALUES (1,'68EFFFF','USD',0.00,NULL,NULL,NULL,NULL,NULL,'2018-02-02 15:05:41.754060','2018-02-02 15:05:41.754121',1,2),(2,'8CF08E5','USD',149.00,NULL,NULL,NULL,NULL,NULL,'2018-02-02 15:05:41.787375','2018-02-02 15:05:41.787413',1,3);
/*!40000 ALTER TABLE `partner_stockrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_bankcard`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_bankcard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_type` varchar(128) NOT NULL,
  `name` varchar(255) NOT NULL,
  `number` varchar(32) NOT NULL,
  `expiry_date` date NOT NULL,
  `partner_reference` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_bankcard_user_id_08e1d04c_fk_ecommerce_user_id` (`user_id`),
  CONSTRAINT `payment_bankcard_user_id_08e1d04c_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_bankcard`
--

LOCK TABLES `payment_bankcard` WRITE;
/*!40000 ALTER TABLE `payment_bankcard` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_bankcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_paymentprocessorresponse`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_paymentprocessorresponse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `processor_name` varchar(255) NOT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `response` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `basket_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_paymentprocessorresponse_processor_name_c62034f3_idx` (`processor_name`,`transaction_id`),
  KEY `payment_paymentprocessorr_basket_id_ff3d36a2_fk_basket_basket_id` (`basket_id`),
  KEY `payment_paymentprocessorresponse_e2fa5388` (`created`),
  CONSTRAINT `payment_paymentprocessorr_basket_id_ff3d36a2_fk_basket_basket_id` FOREIGN KEY (`basket_id`) REFERENCES `basket_basket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_paymentprocessorresponse`
--

LOCK TABLES `payment_paymentprocessorresponse` WRITE;
/*!40000 ALTER TABLE `payment_paymentprocessorresponse` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_paymentprocessorresponse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_paypalprocessorconfiguration`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_paypalprocessorconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `retry_attempts` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_paypalprocessorconfiguration`
--

LOCK TABLES `payment_paypalprocessorconfiguration` WRITE;
/*!40000 ALTER TABLE `payment_paypalprocessorconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_paypalprocessorconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_paypalwebprofile`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_paypalwebprofile` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_paypalwebprofile`
--

LOCK TABLES `payment_paypalwebprofile` WRITE;
/*!40000 ALTER TABLE `payment_paypalwebprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_paypalwebprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_sdncheckfailure`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_sdncheckfailure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `country` varchar(2) NOT NULL,
  `sdn_check_response` longtext NOT NULL,
  `site_id` int(11) DEFAULT NULL,
  `city` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_sdncheckfailure_site_id_202cf400_fk_django_site_id` (`site_id`),
  CONSTRAINT `payment_sdncheckfailure_site_id_202cf400_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_sdncheckfailure`
--

LOCK TABLES `payment_sdncheckfailure` WRITE;
/*!40000 ALTER TABLE `payment_sdncheckfailure` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_sdncheckfailure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_sdncheckfailure_products`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_sdncheckfailure_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sdncheckfailure_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payment_sdncheckfailure_product_sdncheckfailure_id_5e39885c_uniq` (`sdncheckfailure_id`,`product_id`),
  KEY `payment_sdncheckfail_product_id_6d431270_fk_catalogue_product_id` (`product_id`),
  CONSTRAINT `paymen_sdncheckfailure_id_a8c1f0d4_fk_payment_sdncheckfailure_id` FOREIGN KEY (`sdncheckfailure_id`) REFERENCES `payment_sdncheckfailure` (`id`),
  CONSTRAINT `payment_sdncheckfail_product_id_6d431270_fk_catalogue_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_sdncheckfailure_products`
--

LOCK TABLES `payment_sdncheckfailure_products` WRITE;
/*!40000 ALTER TABLE `payment_sdncheckfailure_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_sdncheckfailure_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_source`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency` varchar(12) NOT NULL,
  `amount_allocated` decimal(12,2) NOT NULL,
  `amount_debited` decimal(12,2) NOT NULL,
  `amount_refunded` decimal(12,2) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `label` varchar(128) NOT NULL,
  `order_id` int(11) NOT NULL,
  `source_type_id` int(11) NOT NULL,
  `card_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_source_order_id_6b7f2215_fk_order_order_id` (`order_id`),
  KEY `payment_source_source_type_id_700828fe_fk_payment_sourcetype_id` (`source_type_id`),
  CONSTRAINT `payment_source_order_id_6b7f2215_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  CONSTRAINT `payment_source_source_type_id_700828fe_fk_payment_sourcetype_id` FOREIGN KEY (`source_type_id`) REFERENCES `payment_sourcetype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_source`
--

LOCK TABLES `payment_source` WRITE;
/*!40000 ALTER TABLE `payment_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_sourcetype`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_sourcetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_sourcetype`
--

LOCK TABLES `payment_sourcetype` WRITE;
/*!40000 ALTER TABLE `payment_sourcetype` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_sourcetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_transaction`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `txn_type` varchar(128) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `reference` varchar(128) NOT NULL,
  `status` varchar(128) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `source_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_transaction_source_id_c5ac31e8_fk_payment_source_id` (`source_id`),
  CONSTRAINT `payment_transaction_source_id_c5ac31e8_fk_payment_source_id` FOREIGN KEY (`source_id`) REFERENCES `payment_source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_transaction`
--

LOCK TABLES `payment_transaction` WRITE;
/*!40000 ALTER TABLE `payment_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions_automaticproductlist`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions_automaticproductlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `link_url` varchar(200) NOT NULL,
  `link_text` varchar(255) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `method` varchar(128) NOT NULL,
  `num_products` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions_automaticproductlist`
--

LOCK TABLES `promotions_automaticproductlist` WRITE;
/*!40000 ALTER TABLE `promotions_automaticproductlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions_automaticproductlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions_handpickedproductlist`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions_handpickedproductlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `link_url` varchar(200) NOT NULL,
  `link_text` varchar(255) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions_handpickedproductlist`
--

LOCK TABLES `promotions_handpickedproductlist` WRITE;
/*!40000 ALTER TABLE `promotions_handpickedproductlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions_handpickedproductlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions_image`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `link_url` varchar(200) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions_image`
--

LOCK TABLES `promotions_image` WRITE;
/*!40000 ALTER TABLE `promotions_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions_keywordpromotion`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions_keywordpromotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned NOT NULL,
  `position` varchar(100) NOT NULL,
  `display_order` int(10) unsigned NOT NULL,
  `clicks` int(10) unsigned NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `keyword` varchar(200) NOT NULL,
  `filter` varchar(200) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `promotions_ke_content_type_id_91959aa4_fk_django_content_type_id` (`content_type_id`),
  CONSTRAINT `promotions_ke_content_type_id_91959aa4_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions_keywordpromotion`
--

LOCK TABLES `promotions_keywordpromotion` WRITE;
/*!40000 ALTER TABLE `promotions_keywordpromotion` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions_keywordpromotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions_multiimage`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions_multiimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions_multiimage`
--

LOCK TABLES `promotions_multiimage` WRITE;
/*!40000 ALTER TABLE `promotions_multiimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions_multiimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions_multiimage_images`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions_multiimage_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `multiimage_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `promotions_multiimage_images_multiimage_id_29363bca_uniq` (`multiimage_id`,`image_id`),
  KEY `promotions_multiimage_i_image_id_bb6eca34_fk_promotions_image_id` (`image_id`),
  CONSTRAINT `promotions_mu_multiimage_id_62ed9a9f_fk_promotions_multiimage_id` FOREIGN KEY (`multiimage_id`) REFERENCES `promotions_multiimage` (`id`),
  CONSTRAINT `promotions_multiimage_i_image_id_bb6eca34_fk_promotions_image_id` FOREIGN KEY (`image_id`) REFERENCES `promotions_image` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions_multiimage_images`
--

LOCK TABLES `promotions_multiimage_images` WRITE;
/*!40000 ALTER TABLE `promotions_multiimage_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions_multiimage_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions_orderedproduct`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions_orderedproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_order` int(10) unsigned NOT NULL,
  `list_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `promotions_orderedproduct_list_id_1e22874a_uniq` (`list_id`,`product_id`),
  KEY `promotions_orderedpr_product_id_94dede36_fk_catalogue_product_id` (`product_id`),
  CONSTRAINT `promotio_list_id_94f390b0_fk_promotions_handpickedproductlist_id` FOREIGN KEY (`list_id`) REFERENCES `promotions_handpickedproductlist` (`id`),
  CONSTRAINT `promotions_orderedpr_product_id_94dede36_fk_catalogue_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions_orderedproduct`
--

LOCK TABLES `promotions_orderedproduct` WRITE;
/*!40000 ALTER TABLE `promotions_orderedproduct` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions_orderedproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions_orderedproductlist`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions_orderedproductlist` (
  `handpickedproductlist_ptr_id` int(11) NOT NULL,
  `display_order` int(10) unsigned NOT NULL,
  `tabbed_block_id` int(11) NOT NULL,
  PRIMARY KEY (`handpickedproductlist_ptr_id`),
  KEY `promotions_tabbed_block_id_a018e8d5_fk_promotions_tabbedblock_id` (`tabbed_block_id`),
  CONSTRAINT `D0960c2dac786e2180c5e16db0f3bf02` FOREIGN KEY (`handpickedproductlist_ptr_id`) REFERENCES `promotions_handpickedproductlist` (`id`),
  CONSTRAINT `promotions_tabbed_block_id_a018e8d5_fk_promotions_tabbedblock_id` FOREIGN KEY (`tabbed_block_id`) REFERENCES `promotions_tabbedblock` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions_orderedproductlist`
--

LOCK TABLES `promotions_orderedproductlist` WRITE;
/*!40000 ALTER TABLE `promotions_orderedproductlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions_orderedproductlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions_pagepromotion`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions_pagepromotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned NOT NULL,
  `position` varchar(100) NOT NULL,
  `display_order` int(10) unsigned NOT NULL,
  `clicks` int(10) unsigned NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `page_url` varchar(128) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `promotions_pa_content_type_id_00707bff_fk_django_content_type_id` (`content_type_id`),
  KEY `promotions_pagepromotion_072c6e88` (`page_url`),
  CONSTRAINT `promotions_pa_content_type_id_00707bff_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions_pagepromotion`
--

LOCK TABLES `promotions_pagepromotion` WRITE;
/*!40000 ALTER TABLE `promotions_pagepromotion` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions_pagepromotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions_rawhtml`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions_rawhtml` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `display_type` varchar(128) NOT NULL,
  `body` longtext NOT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions_rawhtml`
--

LOCK TABLES `promotions_rawhtml` WRITE;
/*!40000 ALTER TABLE `promotions_rawhtml` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions_rawhtml` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions_singleproduct`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions_singleproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `description` longtext NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `promotions_singlepro_product_id_d7ad5e03_fk_catalogue_product_id` (`product_id`),
  CONSTRAINT `promotions_singlepro_product_id_d7ad5e03_fk_catalogue_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions_singleproduct`
--

LOCK TABLES `promotions_singleproduct` WRITE;
/*!40000 ALTER TABLE `promotions_singleproduct` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions_singleproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions_tabbedblock`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions_tabbedblock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions_tabbedblock`
--

LOCK TABLES `promotions_tabbedblock` WRITE;
/*!40000 ALTER TABLE `promotions_tabbedblock` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions_tabbedblock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referrals_referral`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referrals_referral` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `affiliate_id` varchar(255) NOT NULL,
  `basket_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `utm_campaign` varchar(255) NOT NULL,
  `utm_content` varchar(255) NOT NULL,
  `utm_created_at` datetime(6) DEFAULT NULL,
  `utm_medium` varchar(255) NOT NULL,
  `utm_source` varchar(255) NOT NULL,
  `utm_term` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `basket_id` (`basket_id`),
  UNIQUE KEY `order_id` (`order_id`),
  KEY `referrals_referral_site_id_2ba3a624_fk_django_site_id` (`site_id`),
  CONSTRAINT `referrals_referral_basket_id_25e1749e_fk_basket_basket_id` FOREIGN KEY (`basket_id`) REFERENCES `basket_basket` (`id`),
  CONSTRAINT `referrals_referral_order_id_170fad6d_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  CONSTRAINT `referrals_referral_site_id_2ba3a624_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referrals_referral`
--

LOCK TABLES `referrals_referral` WRITE;
/*!40000 ALTER TABLE `referrals_referral` DISABLE KEYS */;
/*!40000 ALTER TABLE `referrals_referral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund_refund`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refund_refund` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `total_credit_excl_tax` decimal(12,2) NOT NULL,
  `currency` varchar(12) NOT NULL,
  `status` varchar(255) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `refund_refund_order_id_44bf4b92_fk_order_order_id` (`order_id`),
  KEY `refund_refund_user_id_f10f8f2a_fk_ecommerce_user_id` (`user_id`),
  CONSTRAINT `refund_refund_order_id_44bf4b92_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  CONSTRAINT `refund_refund_user_id_f10f8f2a_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund_refund`
--

LOCK TABLES `refund_refund` WRITE;
/*!40000 ALTER TABLE `refund_refund` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund_refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund_refundline`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refund_refundline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `line_credit_excl_tax` decimal(12,2) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `status` varchar(255) NOT NULL,
  `order_line_id` int(11) NOT NULL,
  `refund_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `refund_refundline_order_line_id_f775827b_fk_order_line_id` (`order_line_id`),
  KEY `refund_refundline_refund_id_a1fc3ad0_fk_refund_refund_id` (`refund_id`),
  CONSTRAINT `refund_refundline_order_line_id_f775827b_fk_order_line_id` FOREIGN KEY (`order_line_id`) REFERENCES `order_line` (`id`),
  CONSTRAINT `refund_refundline_refund_id_a1fc3ad0_fk_refund_refund_id` FOREIGN KEY (`refund_id`) REFERENCES `refund_refund` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund_refundline`
--

LOCK TABLES `refund_refundline` WRITE;
/*!40000 ALTER TABLE `refund_refundline` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund_refundline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_productreview`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews_productreview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` smallint(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `homepage` varchar(200) NOT NULL,
  `status` smallint(6) NOT NULL,
  `total_votes` int(11) NOT NULL,
  `delta_votes` int(11) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviews_productreview_product_id_c4fdc4cd_uniq` (`product_id`,`user_id`),
  KEY `reviews_productreview_user_id_8acb5ddd_fk_ecommerce_user_id` (`user_id`),
  KEY `reviews_productreview_979acfd1` (`delta_votes`),
  CONSTRAINT `reviews_productrevie_product_id_52e52a32_fk_catalogue_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `reviews_productreview_user_id_8acb5ddd_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_productreview`
--

LOCK TABLES `reviews_productreview` WRITE;
/*!40000 ALTER TABLE `reviews_productreview` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_productreview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_vote`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `delta` smallint(6) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviews_vote_user_id_bb858939_uniq` (`user_id`,`review_id`),
  KEY `reviews_vote_review_id_371b2d8d_fk_reviews_productreview_id` (`review_id`),
  CONSTRAINT `reviews_vote_review_id_371b2d8d_fk_reviews_productreview_id` FOREIGN KEY (`review_id`) REFERENCES `reviews_productreview` (`id`),
  CONSTRAINT `reviews_vote_user_id_5fb87b53_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_vote`
--

LOCK TABLES `reviews_vote` WRITE;
/*!40000 ALTER TABLE `reviews_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_orderanditemcharges`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_orderanditemcharges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` longtext NOT NULL,
  `price_per_order` decimal(12,2) NOT NULL,
  `price_per_item` decimal(12,2) NOT NULL,
  `free_shipping_threshold` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_orderanditemcharges`
--

LOCK TABLES `shipping_orderanditemcharges` WRITE;
/*!40000 ALTER TABLE `shipping_orderanditemcharges` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_orderanditemcharges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_orderanditemcharges_countries`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_orderanditemcharges_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderanditemcharges_id` int(11) NOT NULL,
  `country_id` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shipping_orderanditemcharge_orderanditemcharges_id_9f0c9c8f_uniq` (`orderanditemcharges_id`,`country_id`),
  KEY `shipping_or_country_id_30387f2e_fk_address_country_iso_3166_1_a2` (`country_id`),
  CONSTRAINT `D7d640886e5bf6acefe7155c1048828a` FOREIGN KEY (`orderanditemcharges_id`) REFERENCES `shipping_orderanditemcharges` (`id`),
  CONSTRAINT `shipping_or_country_id_30387f2e_fk_address_country_iso_3166_1_a2` FOREIGN KEY (`country_id`) REFERENCES `address_country` (`iso_3166_1_a2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_orderanditemcharges_countries`
--

LOCK TABLES `shipping_orderanditemcharges_countries` WRITE;
/*!40000 ALTER TABLE `shipping_orderanditemcharges_countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_orderanditemcharges_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_weightband`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_weightband` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `upper_limit` decimal(12,3) NOT NULL,
  `charge` decimal(12,2) NOT NULL,
  `method_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shipping_weightban_method_id_b699a1ba_fk_shipping_weightbased_id` (`method_id`),
  CONSTRAINT `shipping_weightban_method_id_b699a1ba_fk_shipping_weightbased_id` FOREIGN KEY (`method_id`) REFERENCES `shipping_weightbased` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_weightband`
--

LOCK TABLES `shipping_weightband` WRITE;
/*!40000 ALTER TABLE `shipping_weightband` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_weightband` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_weightbased`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_weightbased` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` longtext NOT NULL,
  `default_weight` decimal(12,3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_weightbased`
--

LOCK TABLES `shipping_weightbased` WRITE;
/*!40000 ALTER TABLE `shipping_weightbased` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_weightbased` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_weightbased_countries`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_weightbased_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weightbased_id` int(11) NOT NULL,
  `country_id` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shipping_weightbased_countries_weightbased_id_de8c5e42_uniq` (`weightbased_id`,`country_id`),
  KEY `shipping_we_country_id_06117384_fk_address_country_iso_3166_1_a2` (`country_id`),
  CONSTRAINT `shipping_we_country_id_06117384_fk_address_country_iso_3166_1_a2` FOREIGN KEY (`country_id`) REFERENCES `address_country` (`iso_3166_1_a2`),
  CONSTRAINT `shipping_weig_weightbased_id_93e3132f_fk_shipping_weightbased_id` FOREIGN KEY (`weightbased_id`) REFERENCES `shipping_weightbased` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_weightbased_countries`
--

LOCK TABLES `shipping_weightbased_countries` WRITE;
/*!40000 ALTER TABLE `shipping_weightbased_countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_weightbased_countries` ENABLE KEYS */;
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
  UNIQUE KEY `social_auth_association_server_url_078befa2_uniq` (`server_url`,`handle`)
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_code_email_801b2d02_uniq` (`email`,`code`),
  KEY `social_auth_code_c1336794` (`code`)
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
  UNIQUE KEY `social_auth_nonce_server_url_f6284463_uniq` (`server_url`,`timestamp`,`salt`)
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
  PRIMARY KEY (`id`),
  KEY `social_auth_partial_94a08da1` (`token`)
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
  UNIQUE KEY `social_auth_usersocialauth_provider_e6b5e668_uniq` (`provider`,`uid`),
  KEY `social_auth_usersocialauth_user_id_17d28448_fk_ecommerce_user_id` (`user_id`),
  CONSTRAINT `social_auth_usersocialauth_user_id_17d28448_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
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
-- Table structure for table `voucher_couponvouchers`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_couponvouchers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `voucher_couponvoucher_coupon_id_44356128_fk_catalogue_product_id` (`coupon_id`),
  CONSTRAINT `voucher_couponvoucher_coupon_id_44356128_fk_catalogue_product_id` FOREIGN KEY (`coupon_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher_couponvouchers`
--

LOCK TABLES `voucher_couponvouchers` WRITE;
/*!40000 ALTER TABLE `voucher_couponvouchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `voucher_couponvouchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher_couponvouchers_vouchers`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_couponvouchers_vouchers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `couponvouchers_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `voucher_couponvouchers_vouchers_couponvouchers_id_390b5a38_uniq` (`couponvouchers_id`,`voucher_id`),
  KEY `voucher_couponvouchers_voucher_id_d5507ed9_fk_voucher_voucher_id` (`voucher_id`),
  CONSTRAINT `voucher__couponvouchers_id_ebe4c993_fk_voucher_couponvouchers_id` FOREIGN KEY (`couponvouchers_id`) REFERENCES `voucher_couponvouchers` (`id`),
  CONSTRAINT `voucher_couponvouchers_voucher_id_d5507ed9_fk_voucher_voucher_id` FOREIGN KEY (`voucher_id`) REFERENCES `voucher_voucher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher_couponvouchers_vouchers`
--

LOCK TABLES `voucher_couponvouchers_vouchers` WRITE;
/*!40000 ALTER TABLE `voucher_couponvouchers_vouchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `voucher_couponvouchers_vouchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher_orderlinevouchers`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_orderlinevouchers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `line_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `voucher_orderlinevouchers_line_id_fa3dbd8e_fk_order_line_id` (`line_id`),
  CONSTRAINT `voucher_orderlinevouchers_line_id_fa3dbd8e_fk_order_line_id` FOREIGN KEY (`line_id`) REFERENCES `order_line` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher_orderlinevouchers`
--

LOCK TABLES `voucher_orderlinevouchers` WRITE;
/*!40000 ALTER TABLE `voucher_orderlinevouchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `voucher_orderlinevouchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher_orderlinevouchers_vouchers`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_orderlinevouchers_vouchers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderlinevouchers_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `voucher_orderlinevouchers_vou_orderlinevouchers_id_2a30647d_uniq` (`orderlinevouchers_id`,`voucher_id`),
  KEY `voucher_orderlinevouch_voucher_id_b8820f35_fk_voucher_voucher_id` (`voucher_id`),
  CONSTRAINT `vo_orderlinevouchers_id_c916ee3a_fk_voucher_orderlinevouchers_id` FOREIGN KEY (`orderlinevouchers_id`) REFERENCES `voucher_orderlinevouchers` (`id`),
  CONSTRAINT `voucher_orderlinevouch_voucher_id_b8820f35_fk_voucher_voucher_id` FOREIGN KEY (`voucher_id`) REFERENCES `voucher_voucher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher_orderlinevouchers_vouchers`
--

LOCK TABLES `voucher_orderlinevouchers_vouchers` WRITE;
/*!40000 ALTER TABLE `voucher_orderlinevouchers_vouchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `voucher_orderlinevouchers_vouchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher_voucher`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(128) NOT NULL,
  `usage` varchar(128) NOT NULL,
  `start_datetime` datetime(6) NOT NULL,
  `end_datetime` datetime(6) NOT NULL,
  `num_basket_additions` int(10) unsigned NOT NULL,
  `num_orders` int(10) unsigned NOT NULL,
  `total_discount` decimal(12,2) NOT NULL,
  `date_created` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher_voucher`
--

LOCK TABLES `voucher_voucher` WRITE;
/*!40000 ALTER TABLE `voucher_voucher` DISABLE KEYS */;
/*!40000 ALTER TABLE `voucher_voucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher_voucher_offers`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_voucher_offers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `conditionaloffer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `voucher_voucher_offers_voucher_id_01628a7f_uniq` (`voucher_id`,`conditionaloffer_id`),
  KEY `vouche_conditionaloffer_id_f9682bfb_fk_offer_conditionaloffer_id` (`conditionaloffer_id`),
  CONSTRAINT `vouche_conditionaloffer_id_f9682bfb_fk_offer_conditionaloffer_id` FOREIGN KEY (`conditionaloffer_id`) REFERENCES `offer_conditionaloffer` (`id`),
  CONSTRAINT `voucher_voucher_offers_voucher_id_7f9c575d_fk_voucher_voucher_id` FOREIGN KEY (`voucher_id`) REFERENCES `voucher_voucher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher_voucher_offers`
--

LOCK TABLES `voucher_voucher_offers` WRITE;
/*!40000 ALTER TABLE `voucher_voucher_offers` DISABLE KEYS */;
/*!40000 ALTER TABLE `voucher_voucher_offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher_voucherapplication`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_voucherapplication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` date NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `voucher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `voucher_voucherapplication_order_id_30248a05_fk_order_order_id` (`order_id`),
  KEY `voucher_voucherapplication_user_id_df53a393_fk_ecommerce_user_id` (`user_id`),
  KEY `voucher_voucherapplica_voucher_id_5204edb7_fk_voucher_voucher_id` (`voucher_id`),
  CONSTRAINT `voucher_voucherapplica_voucher_id_5204edb7_fk_voucher_voucher_id` FOREIGN KEY (`voucher_id`) REFERENCES `voucher_voucher` (`id`),
  CONSTRAINT `voucher_voucherapplication_order_id_30248a05_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  CONSTRAINT `voucher_voucherapplication_user_id_df53a393_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher_voucherapplication`
--

LOCK TABLES `voucher_voucherapplication` WRITE;
/*!40000 ALTER TABLE `voucher_voucherapplication` DISABLE KEYS */;
/*!40000 ALTER TABLE `voucher_voucherapplication` ENABLE KEYS */;
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
  KEY `waffle_flag_e2fa5388` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_flag`
--

LOCK TABLES `waffle_flag` WRITE;
/*!40000 ALTER TABLE `waffle_flag` DISABLE KEYS */;
INSERT INTO `waffle_flag` VALUES (1,'enable_client_side_checkout',1,NULL,0,1,0,0,'',0,'This flag determines if the integrated/client-side checkout flow should be enabled.','2017-06-21 16:06:20.833592','2018-02-02 15:05:41.692051');
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
  UNIQUE KEY `waffle_flag_groups_flag_id_8ba0c71b_uniq` (`flag_id`,`group_id`),
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
  UNIQUE KEY `waffle_flag_users_flag_id_b46f76b0_uniq` (`flag_id`,`user_id`),
  KEY `waffle_flag_users_user_id_8026df9b_fk_ecommerce_user_id` (`user_id`),
  CONSTRAINT `waffle_flag_users_flag_id_833c37b0_fk_waffle_flag_id` FOREIGN KEY (`flag_id`) REFERENCES `waffle_flag` (`id`),
  CONSTRAINT `waffle_flag_users_user_id_8026df9b_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
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
  KEY `waffle_sample_e2fa5388` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_sample`
--

LOCK TABLES `waffle_sample` WRITE;
/*!40000 ALTER TABLE `waffle_sample` DISABLE KEYS */;
INSERT INTO `waffle_sample` VALUES (1,'async_order_fulfillment',0.0,'Determines what percentage of orders are fulfilled asynchronously.','2017-06-21 16:06:05.827665','2017-06-21 16:06:05.827675');
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
  KEY `waffle_switch_e2fa5388` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_switch`
--

LOCK TABLES `waffle_switch` WRITE;
/*!40000 ALTER TABLE `waffle_switch` DISABLE KEYS */;
INSERT INTO `waffle_switch` VALUES (1,'allow_repeat_purchase',1,'','2017-06-21 16:05:58.863603','2017-06-21 16:05:58.863613'),(2,'publish_course_modes_to_lms',1,'','2017-06-21 16:06:05.413981','2017-06-21 16:06:05.413997'),(4,'create_enrollment_codes',0,'','2017-06-21 16:06:06.215623','2017-06-21 16:06:06.215633'),(5,'enable_user_list_view',1,'','2017-06-21 16:06:09.360454','2017-06-21 16:06:09.360463'),(6,'enable_order_list_view',1,'','2017-06-21 16:06:18.897479','2017-06-21 16:06:18.897489'),(7,'payment_processor_active_cybersource',1,'','2017-06-21 16:06:20.656777','2017-06-21 16:06:20.656795'),(8,'payment_processor_active_paypal',1,'','2017-06-21 16:06:20.657882','2017-06-21 16:06:20.657890'),(9,'sailthru_enable',0,'','2017-06-21 16:06:28.416700','2017-06-21 16:06:28.416709'),(10,'enable_enterprise_offers',0,'','2018-02-02 15:04:41.040305','2018-02-02 15:04:41.040320'),(11,'enable_enterprise_on_runtime',0,'','2018-02-02 15:04:41.062108','2018-02-02 15:04:41.062123'),(12,'disable_repeat_order_check',0,'','2018-02-02 15:04:42.976798','2018-02-02 15:04:42.976810'),(13,'payment_processor_active_stripe',1,'','2018-02-02 15:04:45.646511','2018-02-02 15:04:45.646527');
/*!40000 ALTER TABLE `waffle_switch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlists_line`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlists_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `wishlist_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wishlists_line_wishlist_id_78f04673_uniq` (`wishlist_id`,`product_id`),
  KEY `wishlists_line_product_id_9d6d9b37_fk_catalogue_product_id` (`product_id`),
  CONSTRAINT `wishlists_line_product_id_9d6d9b37_fk_catalogue_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `wishlists_line_wishlist_id_4cffe302_fk_wishlists_wishlist_id` FOREIGN KEY (`wishlist_id`) REFERENCES `wishlists_wishlist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlists_line`
--

LOCK TABLES `wishlists_line` WRITE;
/*!40000 ALTER TABLE `wishlists_line` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlists_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlists_wishlist`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlists_wishlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `key` varchar(6) NOT NULL,
  `visibility` varchar(20) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `wishlists_wishlist_owner_id_d5464c62_fk_ecommerce_user_id` (`owner_id`),
  CONSTRAINT `wishlists_wishlist_owner_id_d5464c62_fk_ecommerce_user_id` FOREIGN KEY (`owner_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlists_wishlist`
--

LOCK TABLES `wishlists_wishlist` WRITE;
/*!40000 ALTER TABLE `wishlists_wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlists_wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-02 15:44:26
