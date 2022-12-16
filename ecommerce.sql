-- MySQL dump 10.13  Distrib 5.7.39, for Linux (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	5.7.39

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
  KEY `address_country_display_order_dc88cde8` (`display_order`),
  KEY `address_country_is_shipping_country_f7b6c461` (`is_shipping_country`),
  KEY `address_country_printable_name_450b016c` (`printable_name`)
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
  `num_orders_as_shipping_address` int(10) unsigned NOT NULL,
  `hash` varchar(255) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `country_id` varchar(2) NOT NULL,
  `user_id` int(11) NOT NULL,
  `num_orders_as_billing_address` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `address_useraddress_user_id_hash_9d1738c7_uniq` (`user_id`,`hash`),
  KEY `address_useraddress_country_id_fa26a249_fk_address_c` (`country_id`),
  KEY `address_useraddress_hash_e0a6b290` (`hash`),
  CONSTRAINT `address_useraddress_country_id_fa26a249_fk_address_c` FOREIGN KEY (`country_id`) REFERENCES `address_country` (`iso_3166_1_a2`),
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
  KEY `analytics_productrecord_num_purchases_405301a0` (`num_purchases`),
  CONSTRAINT `analytics_productrec_product_id_dad3a871_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
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
  KEY `analytics_userproduc_product_id_a55b87ad_fk_catalogue` (`product_id`),
  KEY `analytics_userproductview_user_id_5e49a8b1_fk_ecommerce_user_id` (`user_id`),
  CONSTRAINT `analytics_userproduc_product_id_a55b87ad_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
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
  KEY `analytics_userrecord_num_orders_b352ffd1` (`num_orders`),
  KEY `analytics_userrecord_num_order_lines_97cc087f` (`num_order_lines`),
  KEY `analytics_userrecord_num_order_items_fb2a8304` (`num_order_items`),
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
  KEY `analytics_usersearch_query_ad36478b` (`query`),
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
  `name` varchar(150) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=617 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add Country',1,'add_country'),(2,'Can change Country',1,'change_country'),(3,'Can delete Country',1,'delete_country'),(4,'Can view Country',1,'view_country'),(5,'Can add User address',2,'add_useraddress'),(6,'Can change User address',2,'change_useraddress'),(7,'Can delete User address',2,'delete_useraddress'),(8,'Can view User address',2,'view_useraddress'),(9,'Can add log entry',3,'add_logentry'),(10,'Can change log entry',3,'change_logentry'),(11,'Can delete log entry',3,'delete_logentry'),(12,'Can view log entry',3,'view_logentry'),(13,'Can add Product record',4,'add_productrecord'),(14,'Can change Product record',4,'change_productrecord'),(15,'Can delete Product record',4,'delete_productrecord'),(16,'Can view Product record',4,'view_productrecord'),(17,'Can add User product view',5,'add_userproductview'),(18,'Can change User product view',5,'change_userproductview'),(19,'Can delete User product view',5,'delete_userproductview'),(20,'Can view User product view',5,'view_userproductview'),(21,'Can add User record',6,'add_userrecord'),(22,'Can change User record',6,'change_userrecord'),(23,'Can delete User record',6,'delete_userrecord'),(24,'Can view User record',6,'view_userrecord'),(25,'Can add User search query',7,'add_usersearch'),(26,'Can change User search query',7,'change_usersearch'),(27,'Can delete User search query',7,'delete_usersearch'),(28,'Can view User search query',7,'view_usersearch'),(29,'Can add permission',8,'add_permission'),(30,'Can change permission',8,'change_permission'),(31,'Can delete permission',8,'delete_permission'),(32,'Can view permission',8,'view_permission'),(33,'Can add group',9,'add_group'),(34,'Can change group',9,'change_group'),(35,'Can delete group',9,'delete_group'),(36,'Can view group',9,'view_group'),(37,'Can add Basket',10,'add_basket'),(38,'Can change Basket',10,'change_basket'),(39,'Can delete Basket',10,'delete_basket'),(40,'Can view Basket',10,'view_basket'),(41,'Can add Basket line',11,'add_line'),(42,'Can change Basket line',11,'change_line'),(43,'Can delete Basket line',11,'delete_line'),(44,'Can view Basket line',11,'view_line'),(45,'Can add Line attribute',12,'add_lineattribute'),(46,'Can change Line attribute',12,'change_lineattribute'),(47,'Can delete Line attribute',12,'delete_lineattribute'),(48,'Can view Line attribute',12,'view_lineattribute'),(49,'Can add basket attribute',13,'add_basketattribute'),(50,'Can change basket attribute',13,'change_basketattribute'),(51,'Can delete basket attribute',13,'delete_basketattribute'),(52,'Can view basket attribute',13,'view_basketattribute'),(53,'Can add basket attribute type',14,'add_basketattributetype'),(54,'Can change basket attribute type',14,'change_basketattributetype'),(55,'Can delete basket attribute type',14,'delete_basketattributetype'),(56,'Can view basket attribute type',14,'view_basketattributetype'),(57,'Can add Attribute option',15,'add_attributeoption'),(58,'Can change Attribute option',15,'change_attributeoption'),(59,'Can delete Attribute option',15,'delete_attributeoption'),(60,'Can view Attribute option',15,'view_attributeoption'),(61,'Can add Attribute option group',16,'add_attributeoptiongroup'),(62,'Can change Attribute option group',16,'change_attributeoptiongroup'),(63,'Can delete Attribute option group',16,'delete_attributeoptiongroup'),(64,'Can view Attribute option group',16,'view_attributeoptiongroup'),(65,'Can add Category',17,'add_category'),(66,'Can change Category',17,'change_category'),(67,'Can delete Category',17,'delete_category'),(68,'Can view Category',17,'view_category'),(69,'Can add Option',18,'add_option'),(70,'Can change Option',18,'change_option'),(71,'Can delete Option',18,'delete_option'),(72,'Can view Option',18,'view_option'),(73,'Can add Product',19,'add_product'),(74,'Can change Product',19,'change_product'),(75,'Can delete Product',19,'delete_product'),(76,'Can view Product',19,'view_product'),(77,'Can add Product attribute',20,'add_productattribute'),(78,'Can change Product attribute',20,'change_productattribute'),(79,'Can delete Product attribute',20,'delete_productattribute'),(80,'Can view Product attribute',20,'view_productattribute'),(81,'Can add Product attribute value',21,'add_productattributevalue'),(82,'Can change Product attribute value',21,'change_productattributevalue'),(83,'Can delete Product attribute value',21,'delete_productattributevalue'),(84,'Can view Product attribute value',21,'view_productattributevalue'),(85,'Can add Product category',22,'add_productcategory'),(86,'Can change Product category',22,'change_productcategory'),(87,'Can delete Product category',22,'delete_productcategory'),(88,'Can view Product category',22,'view_productcategory'),(89,'Can add Product class',23,'add_productclass'),(90,'Can change Product class',23,'change_productclass'),(91,'Can delete Product class',23,'delete_productclass'),(92,'Can view Product class',23,'view_productclass'),(93,'Can add Product image',24,'add_productimage'),(94,'Can change Product image',24,'change_productimage'),(95,'Can delete Product image',24,'delete_productimage'),(96,'Can view Product image',24,'view_productimage'),(97,'Can add Product recommendation',25,'add_productrecommendation'),(98,'Can change Product recommendation',25,'change_productrecommendation'),(99,'Can delete Product recommendation',25,'delete_productrecommendation'),(100,'Can view Product recommendation',25,'view_productrecommendation'),(101,'Can add catalog',26,'add_catalog'),(102,'Can change catalog',26,'change_catalog'),(103,'Can delete catalog',26,'delete_catalog'),(104,'Can view catalog',26,'view_catalog'),(105,'Can add historical Product',27,'add_historicalproduct'),(106,'Can change historical Product',27,'change_historicalproduct'),(107,'Can delete historical Product',27,'delete_historicalproduct'),(108,'Can view historical Product',27,'view_historicalproduct'),(109,'Can add historical Product attribute value',28,'add_historicalproductattributevalue'),(110,'Can change historical Product attribute value',28,'change_historicalproductattributevalue'),(111,'Can delete historical Product attribute value',28,'delete_historicalproductattributevalue'),(112,'Can view historical Product attribute value',28,'view_historicalproductattributevalue'),(113,'Can add historical Category',29,'add_historicalcategory'),(114,'Can change historical Category',29,'change_historicalcategory'),(115,'Can delete historical Category',29,'delete_historicalcategory'),(116,'Can view historical Category',29,'view_historicalcategory'),(117,'Can add historical Option',30,'add_historicaloption'),(118,'Can change historical Option',30,'change_historicaloption'),(119,'Can delete historical Option',30,'delete_historicaloption'),(120,'Can view historical Option',30,'view_historicaloption'),(121,'Can add historical Product attribute',31,'add_historicalproductattribute'),(122,'Can change historical Product attribute',31,'change_historicalproductattribute'),(123,'Can delete historical Product attribute',31,'delete_historicalproductattribute'),(124,'Can view historical Product attribute',31,'view_historicalproductattribute'),(125,'Can add historical Product category',32,'add_historicalproductcategory'),(126,'Can change historical Product category',32,'change_historicalproductcategory'),(127,'Can delete historical Product category',32,'delete_historicalproductcategory'),(128,'Can view historical Product category',32,'view_historicalproductcategory'),(129,'Can add historical Product class',33,'add_historicalproductclass'),(130,'Can change historical Product class',33,'change_historicalproductclass'),(131,'Can delete historical Product class',33,'delete_historicalproductclass'),(132,'Can view historical Product class',33,'view_historicalproductclass'),(133,'Can add Communication event type',34,'add_communicationeventtype'),(134,'Can change Communication event type',34,'change_communicationeventtype'),(135,'Can delete Communication event type',34,'delete_communicationeventtype'),(136,'Can view Communication event type',34,'view_communicationeventtype'),(137,'Can add Notification',35,'add_notification'),(138,'Can change Notification',35,'change_notification'),(139,'Can delete Notification',35,'delete_notification'),(140,'Can view Notification',35,'view_notification'),(141,'Can add Email',36,'add_email'),(142,'Can change Email',36,'change_email'),(143,'Can delete Email',36,'delete_email'),(144,'Can view Email',36,'view_email'),(145,'Can add content type',37,'add_contenttype'),(146,'Can change content type',37,'change_contenttype'),(147,'Can delete content type',37,'delete_contenttype'),(148,'Can view content type',37,'view_contenttype'),(149,'Can add user',38,'add_user'),(150,'Can change user',38,'change_user'),(151,'Can delete user',38,'delete_user'),(152,'Can view user',38,'view_user'),(153,'Can add site configuration',39,'add_siteconfiguration'),(154,'Can change site configuration',39,'change_siteconfiguration'),(155,'Can delete site configuration',39,'delete_siteconfiguration'),(156,'Can view site configuration',39,'view_siteconfiguration'),(157,'Can add user',40,'add_client'),(158,'Can change user',40,'change_client'),(159,'Can delete user',40,'delete_client'),(160,'Can view user',40,'view_client'),(161,'Can add course',41,'add_course'),(162,'Can change course',41,'change_course'),(163,'Can delete course',41,'delete_course'),(164,'Can view course',41,'view_course'),(165,'Can add Communication event type',42,'add_communicationeventtype'),(166,'Can change Communication event type',42,'change_communicationeventtype'),(167,'Can delete Communication event type',42,'delete_communicationeventtype'),(168,'Can view Communication event type',42,'view_communicationeventtype'),(169,'Can add Email',43,'add_email'),(170,'Can change Email',43,'change_email'),(171,'Can delete Email',43,'delete_email'),(172,'Can view Email',43,'view_email'),(173,'Can add Notification',44,'add_notification'),(174,'Can change Notification',44,'change_notification'),(175,'Can delete Notification',44,'delete_notification'),(176,'Can view Notification',44,'view_notification'),(177,'Can add Product alert',45,'add_productalert'),(178,'Can change Product alert',45,'change_productalert'),(179,'Can delete Product alert',45,'delete_productalert'),(180,'Can view Product alert',45,'view_productalert'),(181,'Can add Benefit',46,'add_benefit'),(182,'Can change Benefit',46,'change_benefit'),(183,'Can delete Benefit',46,'delete_benefit'),(184,'Can view Benefit',46,'view_benefit'),(185,'Can add Condition',47,'add_condition'),(186,'Can change Condition',47,'change_condition'),(187,'Can delete Condition',47,'delete_condition'),(188,'Can view Condition',47,'view_condition'),(189,'Can add Conditional offer',48,'add_conditionaloffer'),(190,'Can change Conditional offer',48,'change_conditionaloffer'),(191,'Can delete Conditional offer',48,'delete_conditionaloffer'),(192,'Can view Conditional offer',48,'view_conditionaloffer'),(193,'Can add Range',49,'add_range'),(194,'Can change Range',49,'change_range'),(195,'Can delete Range',49,'delete_range'),(196,'Can view Range',49,'view_range'),(197,'Can add range product',50,'add_rangeproduct'),(198,'Can change range product',50,'change_rangeproduct'),(199,'Can delete range product',50,'delete_rangeproduct'),(200,'Can view range product',50,'view_rangeproduct'),(201,'Can add Range Product Uploaded File',51,'add_rangeproductfileupload'),(202,'Can change Range Product Uploaded File',51,'change_rangeproductfileupload'),(203,'Can delete Range Product Uploaded File',51,'delete_rangeproductfileupload'),(204,'Can view Range Product Uploaded File',51,'view_rangeproductfileupload'),(205,'Can add Absolute discount benefit',52,'add_absolutediscountbenefit'),(206,'Can change Absolute discount benefit',52,'change_absolutediscountbenefit'),(207,'Can delete Absolute discount benefit',52,'delete_absolutediscountbenefit'),(208,'Can view Absolute discount benefit',52,'view_absolutediscountbenefit'),(209,'Can add Count condition',53,'add_countcondition'),(210,'Can change Count condition',53,'change_countcondition'),(211,'Can delete Count condition',53,'delete_countcondition'),(212,'Can view Count condition',53,'view_countcondition'),(213,'Can add Coverage Condition',54,'add_coveragecondition'),(214,'Can change Coverage Condition',54,'change_coveragecondition'),(215,'Can delete Coverage Condition',54,'delete_coveragecondition'),(216,'Can view Coverage Condition',54,'view_coveragecondition'),(217,'Can add Fixed price benefit',55,'add_fixedpricebenefit'),(218,'Can change Fixed price benefit',55,'change_fixedpricebenefit'),(219,'Can delete Fixed price benefit',55,'delete_fixedpricebenefit'),(220,'Can view Fixed price benefit',55,'view_fixedpricebenefit'),(221,'Can add Multibuy discount benefit',56,'add_multibuydiscountbenefit'),(222,'Can change Multibuy discount benefit',56,'change_multibuydiscountbenefit'),(223,'Can delete Multibuy discount benefit',56,'delete_multibuydiscountbenefit'),(224,'Can view Multibuy discount benefit',56,'view_multibuydiscountbenefit'),(225,'Can add Percentage discount benefit',57,'add_percentagediscountbenefit'),(226,'Can change Percentage discount benefit',57,'change_percentagediscountbenefit'),(227,'Can delete Percentage discount benefit',57,'delete_percentagediscountbenefit'),(228,'Can view Percentage discount benefit',57,'view_percentagediscountbenefit'),(229,'Can add shipping benefit',58,'add_shippingbenefit'),(230,'Can change shipping benefit',58,'change_shippingbenefit'),(231,'Can delete shipping benefit',58,'delete_shippingbenefit'),(232,'Can view shipping benefit',58,'view_shippingbenefit'),(233,'Can add Shipping absolute discount benefit',59,'add_shippingabsolutediscountbenefit'),(234,'Can change Shipping absolute discount benefit',59,'change_shippingabsolutediscountbenefit'),(235,'Can delete Shipping absolute discount benefit',59,'delete_shippingabsolutediscountbenefit'),(236,'Can view Shipping absolute discount benefit',59,'view_shippingabsolutediscountbenefit'),(237,'Can add Fixed price shipping benefit',60,'add_shippingfixedpricebenefit'),(238,'Can change Fixed price shipping benefit',60,'change_shippingfixedpricebenefit'),(239,'Can delete Fixed price shipping benefit',60,'delete_shippingfixedpricebenefit'),(240,'Can view Fixed price shipping benefit',60,'view_shippingfixedpricebenefit'),(241,'Can add Shipping percentage discount benefit',61,'add_shippingpercentagediscountbenefit'),(242,'Can change Shipping percentage discount benefit',61,'change_shippingpercentagediscountbenefit'),(243,'Can delete Shipping percentage discount benefit',61,'delete_shippingpercentagediscountbenefit'),(244,'Can view Shipping percentage discount benefit',61,'view_shippingpercentagediscountbenefit'),(245,'Can add Value condition',62,'add_valuecondition'),(246,'Can change Value condition',62,'change_valuecondition'),(247,'Can delete Value condition',62,'delete_valuecondition'),(248,'Can view Value condition',62,'view_valuecondition'),(249,'Can add Billing address',63,'add_billingaddress'),(250,'Can change Billing address',63,'change_billingaddress'),(251,'Can delete Billing address',63,'delete_billingaddress'),(252,'Can view Billing address',63,'view_billingaddress'),(253,'Can add Communication Event',64,'add_communicationevent'),(254,'Can change Communication Event',64,'change_communicationevent'),(255,'Can delete Communication Event',64,'delete_communicationevent'),(256,'Can view Communication Event',64,'view_communicationevent'),(257,'Can add Order Line',65,'add_line'),(258,'Can change Order Line',65,'change_line'),(259,'Can delete Order Line',65,'delete_line'),(260,'Can view Order Line',65,'view_line'),(261,'Can add Line Attribute',66,'add_lineattribute'),(262,'Can change Line Attribute',66,'change_lineattribute'),(263,'Can delete Line Attribute',66,'delete_lineattribute'),(264,'Can view Line Attribute',66,'view_lineattribute'),(265,'Can add Line Price',67,'add_lineprice'),(266,'Can change Line Price',67,'change_lineprice'),(267,'Can delete Line Price',67,'delete_lineprice'),(268,'Can view Line Price',67,'view_lineprice'),(269,'Can add Order',68,'add_order'),(270,'Can change Order',68,'change_order'),(271,'Can delete Order',68,'delete_order'),(272,'Can view Order',68,'view_order'),(273,'Can add Order Discount',69,'add_orderdiscount'),(274,'Can change Order Discount',69,'change_orderdiscount'),(275,'Can delete Order Discount',69,'delete_orderdiscount'),(276,'Can view Order Discount',69,'view_orderdiscount'),(277,'Can add Order Note',70,'add_ordernote'),(278,'Can change Order Note',70,'change_ordernote'),(279,'Can delete Order Note',70,'delete_ordernote'),(280,'Can view Order Note',70,'view_ordernote'),(281,'Can add Payment Event',71,'add_paymentevent'),(282,'Can change Payment Event',71,'change_paymentevent'),(283,'Can delete Payment Event',71,'delete_paymentevent'),(284,'Can view Payment Event',71,'view_paymentevent'),(285,'Can add Payment Event Quantity',72,'add_paymenteventquantity'),(286,'Can change Payment Event Quantity',72,'change_paymenteventquantity'),(287,'Can delete Payment Event Quantity',72,'delete_paymenteventquantity'),(288,'Can view Payment Event Quantity',72,'view_paymenteventquantity'),(289,'Can add Payment Event Type',73,'add_paymenteventtype'),(290,'Can change Payment Event Type',73,'change_paymenteventtype'),(291,'Can delete Payment Event Type',73,'delete_paymenteventtype'),(292,'Can view Payment Event Type',73,'view_paymenteventtype'),(293,'Can add Shipping address',74,'add_shippingaddress'),(294,'Can change Shipping address',74,'change_shippingaddress'),(295,'Can delete Shipping address',74,'delete_shippingaddress'),(296,'Can view Shipping address',74,'view_shippingaddress'),(297,'Can add Shipping Event',75,'add_shippingevent'),(298,'Can change Shipping Event',75,'change_shippingevent'),(299,'Can delete Shipping Event',75,'delete_shippingevent'),(300,'Can view Shipping Event',75,'view_shippingevent'),(301,'Can add Shipping Event Quantity',76,'add_shippingeventquantity'),(302,'Can change Shipping Event Quantity',76,'change_shippingeventquantity'),(303,'Can delete Shipping Event Quantity',76,'delete_shippingeventquantity'),(304,'Can view Shipping Event Quantity',76,'view_shippingeventquantity'),(305,'Can add Shipping Event Type',77,'add_shippingeventtype'),(306,'Can change Shipping Event Type',77,'change_shippingeventtype'),(307,'Can delete Shipping Event Type',77,'delete_shippingeventtype'),(308,'Can view Shipping Event Type',77,'view_shippingeventtype'),(309,'Can add Partner',78,'add_partner'),(310,'Can change Partner',78,'change_partner'),(311,'Can delete Partner',78,'delete_partner'),(312,'Can view Partner',78,'view_partner'),(313,'Can add Partner address',79,'add_partneraddress'),(314,'Can change Partner address',79,'change_partneraddress'),(315,'Can delete Partner address',79,'delete_partneraddress'),(316,'Can view Partner address',79,'view_partneraddress'),(317,'Can add Stock alert',80,'add_stockalert'),(318,'Can change Stock alert',80,'change_stockalert'),(319,'Can delete Stock alert',80,'delete_stockalert'),(320,'Can view Stock alert',80,'view_stockalert'),(321,'Can add Stock record',81,'add_stockrecord'),(322,'Can change Stock record',81,'change_stockrecord'),(323,'Can delete Stock record',81,'delete_stockrecord'),(324,'Can view Stock record',81,'view_stockrecord'),(325,'Can add site',82,'add_site'),(326,'Can change site',82,'change_site'),(327,'Can delete site',82,'delete_site'),(328,'Can view site',82,'view_site'),(329,'Can add Voucher',83,'add_voucher'),(330,'Can change Voucher',83,'change_voucher'),(331,'Can delete Voucher',83,'delete_voucher'),(332,'Can view Voucher',83,'view_voucher'),(333,'Can add Voucher Application',84,'add_voucherapplication'),(334,'Can change Voucher Application',84,'change_voucherapplication'),(335,'Can delete Voucher Application',84,'delete_voucherapplication'),(336,'Can view Voucher Application',84,'view_voucherapplication'),(337,'Can add flag',85,'add_flag'),(338,'Can change flag',85,'change_flag'),(339,'Can delete flag',85,'delete_flag'),(340,'Can view flag',85,'view_flag'),(341,'Can add sample',86,'add_sample'),(342,'Can change sample',86,'change_sample'),(343,'Can delete sample',86,'delete_sample'),(344,'Can view sample',86,'view_sample'),(345,'Can add switch',87,'add_switch'),(346,'Can change switch',87,'change_switch'),(347,'Can delete switch',87,'delete_switch'),(348,'Can view switch',87,'view_switch'),(349,'Can add flat page',88,'add_flatpage'),(350,'Can change flat page',88,'change_flatpage'),(351,'Can delete flat page',88,'delete_flatpage'),(352,'Can view flat page',88,'view_flatpage'),(353,'Can add session',89,'add_session'),(354,'Can change session',89,'change_session'),(355,'Can delete session',89,'delete_session'),(356,'Can view session',89,'view_session'),(357,'Can add association',90,'add_association'),(358,'Can change association',90,'change_association'),(359,'Can delete association',90,'delete_association'),(360,'Can view association',90,'view_association'),(361,'Can add code',91,'add_code'),(362,'Can change code',91,'change_code'),(363,'Can delete code',91,'delete_code'),(364,'Can view code',91,'view_code'),(365,'Can add nonce',92,'add_nonce'),(366,'Can change nonce',92,'change_nonce'),(367,'Can delete nonce',92,'delete_nonce'),(368,'Can view nonce',92,'view_nonce'),(369,'Can add user social auth',93,'add_usersocialauth'),(370,'Can change user social auth',93,'change_usersocialauth'),(371,'Can delete user social auth',93,'delete_usersocialauth'),(372,'Can view user social auth',93,'view_usersocialauth'),(373,'Can add partial',94,'add_partial'),(374,'Can change partial',94,'change_partial'),(375,'Can delete partial',94,'delete_partial'),(376,'Can view partial',94,'view_partial'),(377,'Can add business client',95,'add_businessclient'),(378,'Can change business client',95,'change_businessclient'),(379,'Can delete business client',95,'delete_businessclient'),(380,'Can view business client',95,'view_businessclient'),(381,'Can add ecommerce feature role',96,'add_ecommercefeaturerole'),(382,'Can change ecommerce feature role',96,'change_ecommercefeaturerole'),(383,'Can delete ecommerce feature role',96,'delete_ecommercefeaturerole'),(384,'Can view ecommerce feature role',96,'view_ecommercefeaturerole'),(385,'Can add ecommerce feature role assignment',97,'add_ecommercefeatureroleassignment'),(386,'Can change ecommerce feature role assignment',97,'change_ecommercefeatureroleassignment'),(387,'Can delete ecommerce feature role assignment',97,'delete_ecommercefeatureroleassignment'),(388,'Can view ecommerce feature role assignment',97,'view_ecommercefeatureroleassignment'),(389,'Can add historical business client',98,'add_historicalbusinessclient'),(390,'Can change historical business client',98,'change_historicalbusinessclient'),(391,'Can delete historical business client',98,'delete_historicalbusinessclient'),(392,'Can view historical business client',98,'view_historicalbusinessclient'),(393,'Can add historical course',99,'add_historicalcourse'),(394,'Can change historical course',99,'change_historicalcourse'),(395,'Can delete historical course',99,'delete_historicalcourse'),(396,'Can view historical course',99,'view_historicalcourse'),(397,'Can add invoice',100,'add_invoice'),(398,'Can change invoice',100,'change_invoice'),(399,'Can delete invoice',100,'delete_invoice'),(400,'Can view invoice',100,'view_invoice'),(401,'Can add historical invoice',101,'add_historicalinvoice'),(402,'Can change historical invoice',101,'change_historicalinvoice'),(403,'Can delete historical invoice',101,'delete_historicalinvoice'),(404,'Can view historical invoice',101,'view_historicalinvoice'),(405,'Can add referral',102,'add_referral'),(406,'Can change referral',102,'change_referral'),(407,'Can delete referral',102,'delete_referral'),(408,'Can view referral',102,'view_referral'),(409,'Can add site theme',103,'add_sitetheme'),(410,'Can change site theme',103,'change_sitetheme'),(411,'Can delete site theme',103,'delete_sitetheme'),(412,'Can view site theme',103,'view_sitetheme'),(413,'Can add Order and Item Charge',104,'add_orderanditemcharges'),(414,'Can change Order and Item Charge',104,'change_orderanditemcharges'),(415,'Can delete Order and Item Charge',104,'delete_orderanditemcharges'),(416,'Can view Order and Item Charge',104,'view_orderanditemcharges'),(417,'Can add Weight Band',105,'add_weightband'),(418,'Can change Weight Band',105,'change_weightband'),(419,'Can delete Weight Band',105,'delete_weightband'),(420,'Can view Weight Band',105,'view_weightband'),(421,'Can add Weight-based Shipping Method',106,'add_weightbased'),(422,'Can change Weight-based Shipping Method',106,'change_weightbased'),(423,'Can delete Weight-based Shipping Method',106,'delete_weightbased'),(424,'Can view Weight-based Shipping Method',106,'view_weightbased'),(425,'Can add Product review',107,'add_productreview'),(426,'Can change Product review',107,'change_productreview'),(427,'Can delete Product review',107,'delete_productreview'),(428,'Can view Product review',107,'view_productreview'),(429,'Can add Vote',108,'add_vote'),(430,'Can change Vote',108,'change_vote'),(431,'Can delete Vote',108,'delete_vote'),(432,'Can view Vote',108,'view_vote'),(433,'Can add Wish list line',109,'add_line'),(434,'Can change Wish list line',109,'change_line'),(435,'Can delete Wish list line',109,'delete_line'),(436,'Can view Wish list line',109,'view_line'),(437,'Can add Wish List',110,'add_wishlist'),(438,'Can change Wish List',110,'change_wishlist'),(439,'Can delete Wish List',110,'delete_wishlist'),(440,'Can view Wish List',110,'view_wishlist'),(441,'Can add refund',111,'add_refund'),(442,'Can change refund',111,'change_refund'),(443,'Can delete refund',111,'delete_refund'),(444,'Can view refund',111,'view_refund'),(445,'Can add refund line',112,'add_refundline'),(446,'Can change refund line',112,'change_refundline'),(447,'Can delete refund line',112,'delete_refundline'),(448,'Can view refund line',112,'view_refundline'),(449,'Can add historical refund',113,'add_historicalrefund'),(450,'Can change historical refund',113,'change_historicalrefund'),(451,'Can delete historical refund',113,'delete_historicalrefund'),(452,'Can view historical refund',113,'view_historicalrefund'),(453,'Can add historical refund line',114,'add_historicalrefundline'),(454,'Can change historical refund line',114,'change_historicalrefundline'),(455,'Can delete historical refund line',114,'delete_historicalrefundline'),(456,'Can view historical refund line',114,'view_historicalrefundline'),(457,'Can add offer assignment',115,'add_offerassignment'),(458,'Can change offer assignment',115,'change_offerassignment'),(459,'Can delete offer assignment',115,'delete_offerassignment'),(460,'Can view offer assignment',115,'view_offerassignment'),(461,'Can add offer assignment email attempt',116,'add_offerassignmentemailattempt'),(462,'Can change offer assignment email attempt',116,'change_offerassignmentemailattempt'),(463,'Can delete offer assignment email attempt',116,'delete_offerassignmentemailattempt'),(464,'Can view offer assignment email attempt',116,'view_offerassignmentemailattempt'),(465,'Can add historical Benefit',117,'add_historicalbenefit'),(466,'Can change historical Benefit',117,'change_historicalbenefit'),(467,'Can delete historical Benefit',117,'delete_historicalbenefit'),(468,'Can view historical Benefit',117,'view_historicalbenefit'),(469,'Can add historical condition',118,'add_historicalcondition'),(470,'Can change historical condition',118,'change_historicalcondition'),(471,'Can delete historical condition',118,'delete_historicalcondition'),(472,'Can view historical condition',118,'view_historicalcondition'),(473,'Can add historical Conditional offer',119,'add_historicalconditionaloffer'),(474,'Can change historical Conditional offer',119,'change_historicalconditionaloffer'),(475,'Can delete historical Conditional offer',119,'delete_historicalconditionaloffer'),(476,'Can view historical Conditional offer',119,'view_historicalconditionaloffer'),(477,'Can add historical offer assignment',120,'add_historicalofferassignment'),(478,'Can change historical offer assignment',120,'change_historicalofferassignment'),(479,'Can delete historical offer assignment',120,'delete_historicalofferassignment'),(480,'Can view historical offer assignment',120,'view_historicalofferassignment'),(481,'Can add historical Range',121,'add_historicalrange'),(482,'Can change historical Range',121,'change_historicalrange'),(483,'Can delete historical Range',121,'delete_historicalrange'),(484,'Can view historical Range',121,'view_historicalrange'),(485,'Can add historical range product',122,'add_historicalrangeproduct'),(486,'Can change historical range product',122,'change_historicalrangeproduct'),(487,'Can delete historical range product',122,'delete_historicalrangeproduct'),(488,'Can view historical range product',122,'view_historicalrangeproduct'),(489,'Can add offer assignment email templates',123,'add_offerassignmentemailtemplates'),(490,'Can change offer assignment email templates',123,'change_offerassignmentemailtemplates'),(491,'Can delete offer assignment email templates',123,'delete_offerassignmentemailtemplates'),(492,'Can view offer assignment email templates',123,'view_offerassignmentemailtemplates'),(493,'Can add offer usage email',124,'add_offerusageemail'),(494,'Can change offer usage email',124,'change_offerusageemail'),(495,'Can delete offer usage email',124,'delete_offerusageemail'),(496,'Can view offer usage email',124,'view_offerusageemail'),(497,'Can add code assignment nudge email templates',125,'add_codeassignmentnudgeemailtemplates'),(498,'Can change code assignment nudge email templates',125,'change_codeassignmentnudgeemailtemplates'),(499,'Can delete code assignment nudge email templates',125,'delete_codeassignmentnudgeemailtemplates'),(500,'Can view code assignment nudge email templates',125,'view_codeassignmentnudgeemailtemplates'),(501,'Can add code assignment nudge emails',126,'add_codeassignmentnudgeemails'),(502,'Can change code assignment nudge emails',126,'change_codeassignmentnudgeemails'),(503,'Can delete code assignment nudge emails',126,'delete_codeassignmentnudgeemails'),(504,'Can view code assignment nudge emails',126,'view_codeassignmentnudgeemails'),(505,'Can add offer assignment email sent record',127,'add_offerassignmentemailsentrecord'),(506,'Can change offer assignment email sent record',127,'change_offerassignmentemailsentrecord'),(507,'Can delete offer assignment email sent record',127,'delete_offerassignmentemailsentrecord'),(508,'Can view offer assignment email sent record',127,'view_offerassignmentemailsentrecord'),(509,'Can add template file attachment',128,'add_templatefileattachment'),(510,'Can change template file attachment',128,'change_templatefileattachment'),(511,'Can delete template file attachment',128,'delete_templatefileattachment'),(512,'Can view template file attachment',128,'view_templatefileattachment'),(513,'Can add historical Order Line',129,'add_historicalline'),(514,'Can change historical Order Line',129,'change_historicalline'),(515,'Can delete historical Order Line',129,'delete_historicalline'),(516,'Can view historical Order Line',129,'view_historicalline'),(517,'Can add historical Order',130,'add_historicalorder'),(518,'Can change historical Order',130,'change_historicalorder'),(519,'Can delete historical Order',130,'delete_historicalorder'),(520,'Can view historical Order',130,'view_historicalorder'),(521,'Can add manual enrollment order discount benefit',131,'add_manualenrollmentorderdiscountbenefit'),(522,'Can change manual enrollment order discount benefit',131,'change_manualenrollmentorderdiscountbenefit'),(523,'Can delete manual enrollment order discount benefit',131,'delete_manualenrollmentorderdiscountbenefit'),(524,'Can view manual enrollment order discount benefit',131,'view_manualenrollmentorderdiscountbenefit'),(525,'Can add manual enrollment order discount condition',132,'add_manualenrollmentorderdiscountcondition'),(526,'Can change manual enrollment order discount condition',132,'change_manualenrollmentorderdiscountcondition'),(527,'Can delete manual enrollment order discount condition',132,'delete_manualenrollmentorderdiscountcondition'),(528,'Can view manual enrollment order discount condition',132,'view_manualenrollmentorderdiscountcondition'),(529,'Can add historical Order Discount',133,'add_historicalorderdiscount'),(530,'Can change historical Order Discount',133,'change_historicalorderdiscount'),(531,'Can delete historical Order Discount',133,'delete_historicalorderdiscount'),(532,'Can view historical Order Discount',133,'view_historicalorderdiscount'),(533,'Can add Order Status Change',134,'add_orderstatuschange'),(534,'Can change Order Status Change',134,'change_orderstatuschange'),(535,'Can delete Order Status Change',134,'delete_orderstatuschange'),(536,'Can view Order Status Change',134,'view_orderstatuschange'),(537,'Can add mark orders status complete config',135,'add_markordersstatuscompleteconfig'),(538,'Can change mark orders status complete config',135,'change_markordersstatuscompleteconfig'),(539,'Can delete mark orders status complete config',135,'delete_markordersstatuscompleteconfig'),(540,'Can view mark orders status complete config',135,'view_markordersstatuscompleteconfig'),(541,'Can add surcharge',136,'add_surcharge'),(542,'Can change surcharge',136,'change_surcharge'),(543,'Can delete surcharge',136,'delete_surcharge'),(544,'Can view surcharge',136,'view_surcharge'),(545,'Can add historical Stock record',137,'add_historicalstockrecord'),(546,'Can change historical Stock record',137,'change_historicalstockrecord'),(547,'Can delete historical Stock record',137,'delete_historicalstockrecord'),(548,'Can view historical Stock record',137,'view_historicalstockrecord'),(549,'Can add historical Partner',138,'add_historicalpartner'),(550,'Can change historical Partner',138,'change_historicalpartner'),(551,'Can delete historical Partner',138,'delete_historicalpartner'),(552,'Can view historical Partner',138,'view_historicalpartner'),(553,'Can add Bankcard',139,'add_bankcard'),(554,'Can change Bankcard',139,'change_bankcard'),(555,'Can delete Bankcard',139,'delete_bankcard'),(556,'Can view Bankcard',139,'view_bankcard'),(557,'Can add Source',140,'add_source'),(558,'Can change Source',140,'change_source'),(559,'Can delete Source',140,'delete_source'),(560,'Can view Source',140,'view_source'),(561,'Can add Source Type',141,'add_sourcetype'),(562,'Can change Source Type',141,'change_sourcetype'),(563,'Can delete Source Type',141,'delete_sourcetype'),(564,'Can view Source Type',141,'view_sourcetype'),(565,'Can add Transaction',142,'add_transaction'),(566,'Can change Transaction',142,'change_transaction'),(567,'Can delete Transaction',142,'delete_transaction'),(568,'Can view Transaction',142,'view_transaction'),(569,'Can add Payment Processor Response',143,'add_paymentprocessorresponse'),(570,'Can change Payment Processor Response',143,'change_paymentprocessorresponse'),(571,'Can delete Payment Processor Response',143,'delete_paymentprocessorresponse'),(572,'Can view Payment Processor Response',143,'view_paymentprocessorresponse'),(573,'Can add paypal web profile',144,'add_paypalwebprofile'),(574,'Can change paypal web profile',144,'change_paypalwebprofile'),(575,'Can delete paypal web profile',144,'delete_paypalwebprofile'),(576,'Can view paypal web profile',144,'view_paypalwebprofile'),(577,'Can add Paypal Processor Configuration',145,'add_paypalprocessorconfiguration'),(578,'Can change Paypal Processor Configuration',145,'change_paypalprocessorconfiguration'),(579,'Can delete Paypal Processor Configuration',145,'delete_paypalprocessorconfiguration'),(580,'Can view Paypal Processor Configuration',145,'view_paypalprocessorconfiguration'),(581,'Can add SDN Check Failure',146,'add_sdncheckfailure'),(582,'Can change SDN Check Failure',146,'change_sdncheckfailure'),(583,'Can delete SDN Check Failure',146,'delete_sdncheckfailure'),(584,'Can view SDN Check Failure',146,'view_sdncheckfailure'),(585,'Can add enterprise contract metadata',147,'add_enterprisecontractmetadata'),(586,'Can change enterprise contract metadata',147,'change_enterprisecontractmetadata'),(587,'Can delete enterprise contract metadata',147,'delete_enterprisecontractmetadata'),(588,'Can view enterprise contract metadata',147,'view_enterprisecontractmetadata'),(589,'Can add sdn fallback metadata',148,'add_sdnfallbackmetadata'),(590,'Can change sdn fallback metadata',148,'change_sdnfallbackmetadata'),(591,'Can delete sdn fallback metadata',148,'delete_sdnfallbackmetadata'),(592,'Can view sdn fallback metadata',148,'view_sdnfallbackmetadata'),(593,'Can add sdn fallback data',149,'add_sdnfallbackdata'),(594,'Can change sdn fallback data',149,'change_sdnfallbackdata'),(595,'Can delete sdn fallback data',149,'delete_sdnfallbackdata'),(596,'Can view sdn fallback data',149,'view_sdnfallbackdata'),(597,'Can add coupon vouchers',150,'add_couponvouchers'),(598,'Can change coupon vouchers',150,'change_couponvouchers'),(599,'Can delete coupon vouchers',150,'delete_couponvouchers'),(600,'Can view coupon vouchers',150,'view_couponvouchers'),(601,'Can add order line vouchers',151,'add_orderlinevouchers'),(602,'Can change order line vouchers',151,'change_orderlinevouchers'),(603,'Can delete order line vouchers',151,'delete_orderlinevouchers'),(604,'Can view order line vouchers',151,'view_orderlinevouchers'),(605,'Can add VoucherSet',152,'add_voucherset'),(606,'Can change VoucherSet',152,'change_voucherset'),(607,'Can delete VoucherSet',152,'delete_voucherset'),(608,'Can view VoucherSet',152,'view_voucherset'),(609,'Can add historical Voucher Application',153,'add_historicalvoucherapplication'),(610,'Can change historical Voucher Application',153,'change_historicalvoucherapplication'),(611,'Can delete historical Voucher Application',153,'delete_historicalvoucherapplication'),(612,'Can view historical Voucher Application',153,'view_historicalvoucherapplication'),(613,'Can add kv store',154,'add_kvstore'),(614,'Can change kv store',154,'change_kvstore'),(615,'Can delete kv store',154,'delete_kvstore'),(616,'Can view kv store',154,'view_kvstore');
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
  UNIQUE KEY `basket_basket_vouchers_basket_id_voucher_id_0731eee2_uniq` (`basket_id`,`voucher_id`),
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
  UNIQUE KEY `basket_basketattribute_basket_id_attribute_type_id_a6c168f8_uniq` (`basket_id`,`attribute_type_id`),
  KEY `basket_basketattribu_attribute_type_id_822adc5d_fk_basket_ba` (`attribute_type_id`),
  CONSTRAINT `basket_basketattribu_attribute_type_id_822adc5d_fk_basket_ba` FOREIGN KEY (`attribute_type_id`) REFERENCES `basket_basketattributetype` (`id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket_basketattributetype`
--

LOCK TABLES `basket_basketattributetype` WRITE;
/*!40000 ALTER TABLE `basket_basketattributetype` DISABLE KEYS */;
INSERT INTO `basket_basketattributetype` VALUES (4,'bundle_identifier'),(1,'email_opt_in'),(3,'payment_intent_id'),(2,'purchased_for_organization'),(5,'sailthru_bid');
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
  `date_updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `basket_line_basket_id_line_reference_8977e974_uniq` (`basket_id`,`line_reference`),
  KEY `basket_line_line_reference_08e91113` (`line_reference`),
  KEY `basket_line_product_id_303d743e_fk_catalogue_product_id` (`product_id`),
  KEY `basket_line_stockrecord_id_7039d8a4_fk_partner_stockrecord_id` (`stockrecord_id`),
  KEY `basket_line_date_created_eb0dfb1b` (`date_created`),
  KEY `basket_line_date_updated_a74d069d` (`date_updated`),
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
  UNIQUE KEY `catalogue_attributeoption_group_id_option_7a8f6c11_uniq` (`group_id`,`option`),
  CONSTRAINT `catalogue_attributeo_group_id_3d4a5e24_fk_catalogue` FOREIGN KEY (`group_id`) REFERENCES `catalogue_attributeoptiongroup` (`id`)
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
  UNIQUE KEY `catalogue_catalog_stock__catalog_id_stockrecord_i_f363d53b_uniq` (`catalog_id`,`stockrecord_id`),
  KEY `catalogue_catalog_st_stockrecord_id_e480f401_fk_partner_s` (`stockrecord_id`),
  CONSTRAINT `catalogue_catalog_st_catalog_id_8fa6c918_fk_catalogue` FOREIGN KEY (`catalog_id`) REFERENCES `catalogue_catalog` (`id`),
  CONSTRAINT `catalogue_catalog_st_stockrecord_id_e480f401_fk_partner_s` FOREIGN KEY (`stockrecord_id`) REFERENCES `partner_stockrecord` (`id`)
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
  `ancestors_are_public` tinyint(1) NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`),
  KEY `catalogue_category_name_1f342ac2` (`name`),
  KEY `catalogue_category_slug_9635febd` (`slug`),
  KEY `catalogue_category_ancestors_are_public_d088d0db` (`ancestors_are_public`),
  KEY `catalogue_category_is_public_ab0536be` (`is_public`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_category`
--

LOCK TABLES `catalogue_category` WRITE;
/*!40000 ALTER TABLE `catalogue_category` DISABLE KEYS */;
INSERT INTO `catalogue_category` VALUES (1,'0001',1,1,'Seats','All course seats','','seats',1,1),(2,'0002',1,27,'Coupons','All Coupons','','coupons',1,1),(3,'0002000A',2,0,'Affiliate Promotion','','','',1,1),(4,'0002000B',2,0,'Bulk Enrollment','','','',1,1),(5,'0002000C',2,0,'ConnectEd','','','',1,1),(6,'0002000D',2,0,'Course Promotion','','','',1,1),(7,'0002000E',2,0,'Customer Service','','','',1,1),(8,'0002000F',2,0,'Financial Assistance','','','',1,1),(9,'0002000G',2,0,'Geography Promotion','','','',1,1),(10,'0002000H',2,0,'Marketing Partner Promotion','','','',1,1),(11,'0002000I',2,0,'Marketing-Other','','','',1,1),(12,'0002000J',2,0,'Paid Cohort','','','',1,1),(13,'0002000K',2,0,'Other','','','',1,1),(14,'0002000L',2,0,'Retention Promotion','','','',1,1),(15,'0002000M',2,0,'Services-Other','','','',1,1),(16,'0002000N',2,0,'Support-Other','','','',1,1),(17,'0002000O',2,0,'Upsell Promotion','','','',1,1),(18,'0003',1,0,'Course Entitlements','All course entitlements','','course_entitlements',1,1),(19,'0004',1,0,'Donations','All donations','','donations',1,1),(20,'0005',1,0,'Journals','All journals','','journals',1,1),(21,'0002000P',2,0,'Bulk Enrollment - Prepay','','','',1,1),(22,'0002000Q',2,0,'Bulk Enrollment - Upon Redemption','','','',1,1),(23,'0002000R',2,0,'Bulk Enrollment - Integration','','','',1,1),(24,'0002000S',2,0,'On-Campus Learners','','','',1,1),(25,'0002000T',2,0,'Partner No Rev - Prepay','','','',1,1),(26,'0002000U',2,0,'Partner No Rev - Upon Redemption','','','',1,1),(27,'0002000V',2,0,'Security Disclosure Reward','','','',1,1),(28,'0002000W',2,0,'edX Employee Request','','','',1,1),(29,'0002000X',2,0,'Partner No Rev - RAP','','','',1,1),(30,'0002000Y',2,0,'Partner No Rev - ORAP','','','',1,1),(31,'0002000Z',2,0,'B2B Affiliate Promotion','','','',1,1),(32,'000200AA',2,0,'Scholarship','','','',1,1);
/*!40000 ALTER TABLE `catalogue_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_historicalcategory`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_historicalcategory` (
  `id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `depth` int(10) unsigned NOT NULL,
  `numchild` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `image` longtext,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `ancestors_are_public` tinyint(1) NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `catalogue_historical_history_user_id_584e44e9_fk_ecommerce` (`history_user_id`),
  KEY `catalogue_historicalcategory_id_c46b902a` (`id`),
  KEY `catalogue_historicalcategory_path_aacdec55` (`path`),
  KEY `catalogue_historicalcategory_name_dfd7cbbe` (`name`),
  KEY `catalogue_historicalcategory_ancestors_are_public_4bb224ba` (`ancestors_are_public`),
  KEY `catalogue_historicalcategory_is_public_55b70eef` (`is_public`),
  CONSTRAINT `catalogue_historical_history_user_id_584e44e9_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_historicalcategory`
--

LOCK TABLES `catalogue_historicalcategory` WRITE;
/*!40000 ALTER TABLE `catalogue_historicalcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_historicalcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_historicaloption`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_historicaloption` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `type` varchar(128) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `catalogue_historical_history_user_id_38090a96_fk_ecommerce` (`history_user_id`),
  KEY `catalogue_historicaloption_id_d1fe6cd6` (`id`),
  CONSTRAINT `catalogue_historical_history_user_id_38090a96_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_historicaloption`
--

LOCK TABLES `catalogue_historicaloption` WRITE;
/*!40000 ALTER TABLE `catalogue_historicaloption` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_historicaloption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_historicalproduct`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_historicalproduct` (
  `id` int(11) NOT NULL,
  `structure` varchar(10) NOT NULL,
  `upc` varchar(64) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `rating` double DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `is_discountable` tinyint(1) NOT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `course_id` varchar(255) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `product_class_id` int(11) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `catalogue_historical_history_user_id_4ea2c15a_fk_ecommerce` (`history_user_id`),
  KEY `catalogue_historicalproduct_id_06ee7e8f` (`id`),
  KEY `catalogue_historicalproduct_upc_db26d500` (`upc`),
  KEY `catalogue_historicalproduct_slug_11827938` (`slug`),
  KEY `catalogue_historicalproduct_date_updated_3b1e9108` (`date_updated`),
  KEY `catalogue_historicalproduct_course_id_f51a879f` (`course_id`),
  KEY `catalogue_historicalproduct_parent_id_9895554d` (`parent_id`),
  KEY `catalogue_historicalproduct_product_class_id_1210a16e` (`product_class_id`),
  KEY `catalogue_historicalproduct_date_created_236cc17e` (`date_created`),
  KEY `catalogue_historicalproduct_is_public_e19f5cd3` (`is_public`),
  CONSTRAINT `catalogue_historical_history_user_id_4ea2c15a_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_historicalproduct`
--

LOCK TABLES `catalogue_historicalproduct` WRITE;
/*!40000 ALTER TABLE `catalogue_historicalproduct` DISABLE KEYS */;
INSERT INTO `catalogue_historicalproduct` VALUES (1,'parent',NULL,'','','',NULL,'2022-12-16 20:50:05.926029','2022-12-16 20:50:05.926059',1,NULL,1,'2022-12-16 20:50:05.926854',NULL,'+','course-v1:edX+DemoX+Demo_Course',NULL,NULL,1,1),(1,'parent',NULL,'Seat in edX Demonstration Course','seat-in-edx-demonstration-course','',NULL,'2022-12-16 20:50:05.926029','2022-12-16 20:50:05.934593',1,NULL,2,'2022-12-16 20:50:05.935464',NULL,'~','course-v1:edX+DemoX+Demo_Course',NULL,NULL,1,1),(2,'child',NULL,'Seat in edX Demonstration Course','seat-in-edx-demonstration-course','',NULL,'2022-12-16 20:50:05.956823','2022-12-16 20:50:05.956856',1,NULL,3,'2022-12-16 20:50:05.957442',NULL,'+','course-v1:edX+DemoX+Demo_Course',NULL,1,NULL,1),(3,'child',NULL,'Seat in edX Demonstration Course with verified certificate','seat-in-edx-demonstration-course-with-verified-certificate','',NULL,'2022-12-16 20:50:06.003730','2022-12-16 20:50:06.003765',1,'2023-12-16 20:50:05.911487',4,'2022-12-16 20:50:06.005244',NULL,'+','course-v1:edX+DemoX+Demo_Course',NULL,1,NULL,1),(4,'standalone',NULL,'Enrollment code for verified seat in edX Demonstration Course','enrollment-code-for-verified-seat-in-edx-demonstration-course','',NULL,'2022-12-16 20:50:06.029364','2022-12-16 20:50:06.029399',1,'2023-12-16 20:50:05.911487',5,'2022-12-16 20:50:06.030323',NULL,'+','course-v1:edX+DemoX+Demo_Course',NULL,NULL,3,1);
/*!40000 ALTER TABLE `catalogue_historicalproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_historicalproductattribute`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_historicalproductattribute` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(128) NOT NULL,
  `type` varchar(20) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `option_group_id` int(11) DEFAULT NULL,
  `product_class_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `catalogue_historical_history_user_id_6aab3050_fk_ecommerce` (`history_user_id`),
  KEY `catalogue_historicalproductattribute_id_4708da5b` (`id`),
  KEY `catalogue_historicalproductattribute_code_972c7779` (`code`),
  KEY `catalogue_historicalproductattribute_option_group_id_be14add3` (`option_group_id`),
  KEY `catalogue_historicalproductattribute_product_class_id_af241c79` (`product_class_id`),
  CONSTRAINT `catalogue_historical_history_user_id_6aab3050_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_historicalproductattribute`
--

LOCK TABLES `catalogue_historicalproductattribute` WRITE;
/*!40000 ALTER TABLE `catalogue_historicalproductattribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_historicalproductattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_historicalproductattributevalue`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_historicalproductattributevalue` (
  `id` int(11) NOT NULL,
  `value_text` longtext,
  `value_integer` int(11) DEFAULT NULL,
  `value_boolean` tinyint(1) DEFAULT NULL,
  `value_float` double DEFAULT NULL,
  `value_richtext` longtext,
  `value_date` date DEFAULT NULL,
  `value_datetime` datetime(6) DEFAULT NULL,
  `value_file` longtext,
  `value_image` longtext,
  `entity_object_id` int(10) unsigned DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  `entity_content_type_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `value_option_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `catalogue_historical_history_user_id_34610f3f_fk_ecommerce` (`history_user_id`),
  KEY `catalogue_historicalproductattributevalue_id_a19c2a60` (`id`),
  KEY `catalogue_historicalproductattributevalue_attribute_id_c5781bb7` (`attribute_id`),
  KEY `catalogue_historicalproduct_entity_content_type_id_ad5d20d5` (`entity_content_type_id`),
  KEY `catalogue_historicalproductattributevalue_product_id_2903d7cb` (`product_id`),
  KEY `catalogue_historicalproduct_value_option_id_99818585` (`value_option_id`),
  KEY `catalogue_historicalproductattributevalue_value_boolean_79128283` (`value_boolean`),
  KEY `catalogue_historicalproductattributevalue_value_date_aad9b6b2` (`value_date`),
  KEY `catalogue_historicalproduct_value_datetime_e61e4058` (`value_datetime`),
  KEY `catalogue_historicalproductattributevalue_value_float_79557818` (`value_float`),
  KEY `catalogue_historicalproductattributevalue_value_integer_5e216649` (`value_integer`),
  CONSTRAINT `catalogue_historical_history_user_id_34610f3f_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_historicalproductattributevalue`
--

LOCK TABLES `catalogue_historicalproductattributevalue` WRITE;
/*!40000 ALTER TABLE `catalogue_historicalproductattributevalue` DISABLE KEYS */;
INSERT INTO `catalogue_historicalproductattributevalue` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,1,'2022-12-16 20:50:05.941821',NULL,'+',1,NULL,NULL,1,NULL),(1,'course-v1:edX+DemoX+Demo_Course',NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,2,'2022-12-16 20:50:05.944163',NULL,'~',1,NULL,NULL,1,NULL),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,3,'2022-12-16 20:50:05.966902',NULL,'+',1,NULL,NULL,2,NULL),(2,'course-v1:edX+DemoX+Demo_Course',NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,4,'2022-12-16 20:50:05.972239',NULL,'~',1,NULL,NULL,2,NULL),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,5,'2022-12-16 20:50:05.975769',NULL,'+',2,NULL,NULL,2,NULL),(3,NULL,NULL,0,NULL,NULL,NULL,NULL,'','',NULL,6,'2022-12-16 20:50:05.977865',NULL,'~',2,NULL,NULL,2,NULL),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,7,'2022-12-16 20:50:06.045160',NULL,'+',8,NULL,NULL,4,NULL),(4,'course-v1:edX+DemoX+Demo_Course',NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,8,'2022-12-16 20:50:06.049902',NULL,'~',8,NULL,NULL,4,NULL),(5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,9,'2022-12-16 20:50:06.056779',NULL,'+',10,NULL,NULL,4,NULL),(5,NULL,NULL,1,NULL,NULL,NULL,NULL,'','',NULL,10,'2022-12-16 20:50:06.059370',NULL,'~',10,NULL,NULL,4,NULL),(6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,11,'2022-12-16 20:50:06.064969',NULL,'+',9,NULL,NULL,4,NULL),(6,'verified',NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,12,'2022-12-16 20:50:06.069909',NULL,'~',9,NULL,NULL,4,NULL),(7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,13,'2022-12-16 20:50:06.094339',NULL,'+',3,NULL,NULL,3,NULL),(7,'verified',NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,14,'2022-12-16 20:50:06.098763',NULL,'~',3,NULL,NULL,3,NULL),(8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,15,'2022-12-16 20:50:06.105364',NULL,'+',1,NULL,NULL,3,NULL),(8,'course-v1:edX+DemoX+Demo_Course',NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,16,'2022-12-16 20:50:06.109828',NULL,'~',1,NULL,NULL,3,NULL),(9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,17,'2022-12-16 20:50:06.116502',NULL,'+',2,NULL,NULL,3,NULL),(9,NULL,NULL,1,NULL,NULL,NULL,NULL,'','',NULL,18,'2022-12-16 20:50:06.120969',NULL,'~',2,NULL,NULL,3,NULL);
/*!40000 ALTER TABLE `catalogue_historicalproductattributevalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_historicalproductcategory`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_historicalproductcategory` (
  `id` int(11) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `catalogue_historical_history_user_id_b2a38081_fk_ecommerce` (`history_user_id`),
  KEY `catalogue_historicalproductcategory_id_61c44723` (`id`),
  KEY `catalogue_historicalproductcategory_category_id_806ddb2d` (`category_id`),
  KEY `catalogue_historicalproductcategory_product_id_98bbd24d` (`product_id`),
  CONSTRAINT `catalogue_historical_history_user_id_b2a38081_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_historicalproductcategory`
--

LOCK TABLES `catalogue_historicalproductcategory` WRITE;
/*!40000 ALTER TABLE `catalogue_historicalproductcategory` DISABLE KEYS */;
INSERT INTO `catalogue_historicalproductcategory` VALUES (1,1,'2022-12-16 20:50:05.933008',NULL,'+',1,NULL,1);
/*!40000 ALTER TABLE `catalogue_historicalproductcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_historicalproductclass`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_historicalproductclass` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `requires_shipping` tinyint(1) NOT NULL,
  `track_stock` tinyint(1) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `catalogue_historical_history_user_id_6e1db4c7_fk_ecommerce` (`history_user_id`),
  KEY `catalogue_historicalproductclass_id_6f7b6d39` (`id`),
  CONSTRAINT `catalogue_historical_history_user_id_6e1db4c7_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_historicalproductclass`
--

LOCK TABLES `catalogue_historicalproductclass` WRITE;
/*!40000 ALTER TABLE `catalogue_historicalproductclass` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_historicalproductclass` ENABLE KEYS */;
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
  `is_public` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `upc` (`upc`),
  KEY `catalogue_product_parent_id_9bfd2382_fk_catalogue_product_id` (`parent_id`),
  KEY `catalogue_product_product_class_id_0c6c5b54_fk_catalogue` (`product_class_id`),
  KEY `catalogue_product_slug_c8e2e2b9` (`slug`),
  KEY `catalogue_product_date_updated_d3a1785d` (`date_updated`),
  KEY `catalogue_product_course_id_1918bc6b_fk_courses_course_id` (`course_id`),
  KEY `catalogue_product_date_created_d66f485a` (`date_created`),
  KEY `catalogue_product_is_public_1cf798c5` (`is_public`),
  CONSTRAINT `catalogue_product_course_id_1918bc6b_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `catalogue_product_parent_id_9bfd2382_fk_catalogue_product_id` FOREIGN KEY (`parent_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `catalogue_product_product_class_id_0c6c5b54_fk_catalogue` FOREIGN KEY (`product_class_id`) REFERENCES `catalogue_productclass` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_product`
--

LOCK TABLES `catalogue_product` WRITE;
/*!40000 ALTER TABLE `catalogue_product` DISABLE KEYS */;
INSERT INTO `catalogue_product` VALUES (1,'parent',NULL,'Seat in edX Demonstration Course','seat-in-edx-demonstration-course','',NULL,'2022-12-16 20:50:05.926029','2022-12-16 20:50:05.934593',1,NULL,1,'course-v1:edX+DemoX+Demo_Course',NULL,1),(2,'child',NULL,'Seat in edX Demonstration Course','seat-in-edx-demonstration-course','',NULL,'2022-12-16 20:50:05.956823','2022-12-16 20:50:05.956856',1,1,NULL,'course-v1:edX+DemoX+Demo_Course',NULL,1),(3,'child',NULL,'Seat in edX Demonstration Course with verified certificate','seat-in-edx-demonstration-course-with-verified-certificate','',NULL,'2022-12-16 20:50:06.003730','2022-12-16 20:50:06.003765',1,1,NULL,'course-v1:edX+DemoX+Demo_Course','2023-12-16 20:50:05.911487',1),(4,'standalone',NULL,'Enrollment code for verified seat in edX Demonstration Course','enrollment-code-for-verified-seat-in-edx-demonstration-course','',NULL,'2022-12-16 20:50:06.029364','2022-12-16 20:50:06.029399',1,NULL,3,'course-v1:edX+DemoX+Demo_Course','2023-12-16 20:50:05.911487',1);
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
  UNIQUE KEY `catalogue_product_produc_product_id_option_id_9b3abb31_uniq` (`product_id`,`option_id`),
  KEY `catalogue_product_pr_option_id_ff470e13_fk_catalogue` (`option_id`),
  CONSTRAINT `catalogue_product_pr_option_id_ff470e13_fk_catalogue` FOREIGN KEY (`option_id`) REFERENCES `catalogue_option` (`id`),
  CONSTRAINT `catalogue_product_pr_product_id_ad2b46bd_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
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
  KEY `catalogue_productatt_product_class_id_7af808ec_fk_catalogue` (`product_class_id`),
  KEY `catalogue_productatt_option_group_id_6b422dc2_fk_catalogue` (`option_group_id`),
  KEY `catalogue_productattribute_code_9ffea293` (`code`),
  CONSTRAINT `catalogue_productatt_option_group_id_6b422dc2_fk_catalogue` FOREIGN KEY (`option_group_id`) REFERENCES `catalogue_attributeoptiongroup` (`id`),
  CONSTRAINT `catalogue_productatt_product_class_id_7af808ec_fk_catalogue` FOREIGN KEY (`product_class_id`) REFERENCES `catalogue_productclass` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productattribute`
--

LOCK TABLES `catalogue_productattribute` WRITE;
/*!40000 ALTER TABLE `catalogue_productattribute` DISABLE KEYS */;
INSERT INTO `catalogue_productattribute` VALUES (1,'course_key','course_key','text',1,NULL,1),(2,'id_verification_required','id_verification_required','boolean',0,NULL,1),(3,'certificate_type','certificate_type','text',0,NULL,1),(4,'credit_provider','credit_provider','text',0,NULL,1),(5,'credit_hours','credit_hours','integer',0,NULL,1),(6,'Coupon vouchers','coupon_vouchers','entity',1,NULL,2),(7,'Note','note','text',0,NULL,2),(8,'Course Key','course_key','text',1,NULL,3),(9,'Seat Type','seat_type','text',1,NULL,3),(10,'id_verification_required','id_verification_required','boolean',0,NULL,3),(11,'UUID','UUID','text',1,NULL,4),(12,'certificate_type','certificate_type','text',0,NULL,4),(13,'id_verification_required','id_verification_required','boolean',0,NULL,4),(15,'Notification Email','notify_email','text',0,NULL,2),(16,'Enterprise Customer UUID','enterprise_customer_uuid','text',0,NULL,2),(17,'Enterprise Contract Metadata','enterprise_contract_metadata','entity',0,NULL,2),(18,'Inactive','inactive','boolean',0,NULL,2),(19,'Sales Force ID','sales_force_id','text',0,NULL,2),(20,'Is Public Code?','is_public_code','boolean',0,NULL,2),(21,'variant_id','variant_id','text',0,NULL,4);
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
  `value_datetime` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogue_productattribu_attribute_id_product_id_1e8e7112_uniq` (`attribute_id`,`product_id`),
  KEY `catalogue_productatt_entity_content_type__f7186ab5_fk_django_co` (`entity_content_type_id`),
  KEY `catalogue_productatt_product_id_a03cd90e_fk_catalogue` (`product_id`),
  KEY `catalogue_productatt_value_option_id_21026066_fk_catalogue` (`value_option_id`),
  KEY `catalogue_productattributevalue_value_boolean_c5b0d66a` (`value_boolean`),
  KEY `catalogue_productattributevalue_value_date_d18775c1` (`value_date`),
  KEY `catalogue_productattributevalue_value_datetime_b474ac38` (`value_datetime`),
  KEY `catalogue_productattributevalue_value_float_5ef8d3db` (`value_float`),
  KEY `catalogue_productattributevalue_value_integer_55fbb7d6` (`value_integer`),
  CONSTRAINT `catalogue_productatt_attribute_id_0287c1e7_fk_catalogue` FOREIGN KEY (`attribute_id`) REFERENCES `catalogue_productattribute` (`id`),
  CONSTRAINT `catalogue_productatt_entity_content_type__f7186ab5_fk_django_co` FOREIGN KEY (`entity_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `catalogue_productatt_product_id_a03cd90e_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `catalogue_productatt_value_option_id_21026066_fk_catalogue` FOREIGN KEY (`value_option_id`) REFERENCES `catalogue_attributeoption` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productattributevalue`
--

LOCK TABLES `catalogue_productattributevalue` WRITE;
/*!40000 ALTER TABLE `catalogue_productattributevalue` DISABLE KEYS */;
INSERT INTO `catalogue_productattributevalue` VALUES (1,'course-v1:edX+DemoX+Demo_Course',NULL,NULL,NULL,NULL,NULL,'','',NULL,1,NULL,1,NULL,NULL),(2,'course-v1:edX+DemoX+Demo_Course',NULL,NULL,NULL,NULL,NULL,'','',NULL,1,NULL,2,NULL,NULL),(3,NULL,NULL,0,NULL,NULL,NULL,'','',NULL,2,NULL,2,NULL,NULL),(4,'course-v1:edX+DemoX+Demo_Course',NULL,NULL,NULL,NULL,NULL,'','',NULL,8,NULL,4,NULL,NULL),(5,NULL,NULL,1,NULL,NULL,NULL,'','',NULL,10,NULL,4,NULL,NULL),(6,'verified',NULL,NULL,NULL,NULL,NULL,'','',NULL,9,NULL,4,NULL,NULL),(7,'verified',NULL,NULL,NULL,NULL,NULL,'','',NULL,3,NULL,3,NULL,NULL),(8,'course-v1:edX+DemoX+Demo_Course',NULL,NULL,NULL,NULL,NULL,'','',NULL,1,NULL,3,NULL,NULL),(9,NULL,NULL,1,NULL,NULL,NULL,'','',NULL,2,NULL,3,NULL,NULL);
/*!40000 ALTER TABLE `catalogue_productattributevalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_productattributevalue_value_multi_option`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_productattributevalue_value_multi_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productattributevalue_id` int(11) NOT NULL,
  `attributeoption_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogue_productattribu_productattributevalue_id_a1760824_uniq` (`productattributevalue_id`,`attributeoption_id`),
  KEY `catalogue_productatt_attributeoption_id_962b600b_fk_catalogue` (`attributeoption_id`),
  CONSTRAINT `catalogue_productatt_attributeoption_id_962b600b_fk_catalogue` FOREIGN KEY (`attributeoption_id`) REFERENCES `catalogue_attributeoption` (`id`),
  CONSTRAINT `catalogue_productatt_productattributevalu_9c7c031e_fk_catalogue` FOREIGN KEY (`productattributevalue_id`) REFERENCES `catalogue_productattributevalue` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productattributevalue_value_multi_option`
--

LOCK TABLES `catalogue_productattributevalue_value_multi_option` WRITE;
/*!40000 ALTER TABLE `catalogue_productattributevalue_value_multi_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_productattributevalue_value_multi_option` ENABLE KEYS */;
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
  UNIQUE KEY `catalogue_productcategory_product_id_category_id_8f0dbfe2_uniq` (`product_id`,`category_id`),
  KEY `catalogue_productcat_category_id_176db535_fk_catalogue` (`category_id`),
  CONSTRAINT `catalogue_productcat_category_id_176db535_fk_catalogue` FOREIGN KEY (`category_id`) REFERENCES `catalogue_category` (`id`),
  CONSTRAINT `catalogue_productcat_product_id_846a4061_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `catalogue_productclass_o_productclass_id_option_i_2266c635_uniq` (`productclass_id`,`option_id`),
  KEY `catalogue_productcla_option_id_b099542c_fk_catalogue` (`option_id`),
  CONSTRAINT `catalogue_productcla_option_id_b099542c_fk_catalogue` FOREIGN KEY (`option_id`) REFERENCES `catalogue_option` (`id`),
  CONSTRAINT `catalogue_productcla_productclass_id_732df4c8_fk_catalogue` FOREIGN KEY (`productclass_id`) REFERENCES `catalogue_productclass` (`id`)
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
  KEY `catalogue_productimage_product_id_49474fe8` (`product_id`),
  KEY `catalogue_productimage_display_order_9fa741ac` (`display_order`),
  CONSTRAINT `catalogue_productima_product_id_49474fe8_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
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
  UNIQUE KEY `catalogue_productrecomme_primary_id_recommendatio_da1fdf43_uniq` (`primary_id`,`recommendation_id`),
  KEY `catalogue_productrec_recommendation_id_daf8ae95_fk_catalogue` (`recommendation_id`),
  KEY `catalogue_productrecommendation_ranking_e7a0f7fd` (`ranking`),
  CONSTRAINT `catalogue_productrec_primary_id_6e51a55c_fk_catalogue` FOREIGN KEY (`primary_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `catalogue_productrec_recommendation_id_daf8ae95_fk_catalogue` FOREIGN KEY (`recommendation_id`) REFERENCES `catalogue_product` (`id`)
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
-- Table structure for table `communication_communicationeventtype`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communication_communicationeventtype` (
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
-- Dumping data for table `communication_communicationeventtype`
--

LOCK TABLES `communication_communicationeventtype` WRITE;
/*!40000 ALTER TABLE `communication_communicationeventtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `communication_communicationeventtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communication_email`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communication_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) DEFAULT NULL,
  `subject` longtext NOT NULL,
  `body_text` longtext NOT NULL,
  `body_html` longtext NOT NULL,
  `date_sent` datetime(6) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `communication_email_user_id_a6eae16a_fk_ecommerce_user_id` (`user_id`),
  CONSTRAINT `communication_email_user_id_a6eae16a_fk_ecommerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communication_email`
--

LOCK TABLES `communication_email` WRITE;
/*!40000 ALTER TABLE `communication_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `communication_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communication_notification`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communication_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `location` varchar(32) NOT NULL,
  `date_sent` datetime(6) NOT NULL,
  `date_read` datetime(6) DEFAULT NULL,
  `recipient_id` int(11) NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `communication_notifi_recipient_id_2f83b142_fk_ecommerce` (`recipient_id`),
  KEY `communication_notifi_sender_id_f1fdd4c8_fk_ecommerce` (`sender_id`),
  CONSTRAINT `communication_notifi_recipient_id_2f83b142_fk_ecommerce` FOREIGN KEY (`recipient_id`) REFERENCES `ecommerce_user` (`id`),
  CONSTRAINT `communication_notifi_sender_id_f1fdd4c8_fk_ecommerce` FOREIGN KEY (`sender_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communication_notification`
--

LOCK TABLES `communication_notification` WRITE;
/*!40000 ALTER TABLE `communication_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `communication_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_businessclient`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_businessclient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `enterprise_customer_uuid` char(32) DEFAULT NULL,
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
-- Table structure for table `core_ecommercefeaturerole`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_ecommercefeaturerole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_ecommercefeaturerole`
--

LOCK TABLES `core_ecommercefeaturerole` WRITE;
/*!40000 ALTER TABLE `core_ecommercefeaturerole` DISABLE KEYS */;
INSERT INTO `core_ecommercefeaturerole` VALUES (1,'2022-12-16 20:47:01.399418','2022-12-16 20:47:01.399418','enterprise_coupon_admin',NULL),(2,'2022-12-16 20:47:01.889897','2022-12-16 20:47:01.889897','order_manager',NULL);
/*!40000 ALTER TABLE `core_ecommercefeaturerole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_ecommercefeatureroleassignment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_ecommercefeatureroleassignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `enterprise_id` char(32) DEFAULT NULL,
  `applies_to_all_contexts` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_ecommercefeatur_role_id_e8057cdb_fk_core_ecom` (`role_id`),
  KEY `core_ecommercefeatur_user_id_f692628b_fk_ecommerce` (`user_id`),
  CONSTRAINT `core_ecommercefeatur_role_id_e8057cdb_fk_core_ecom` FOREIGN KEY (`role_id`) REFERENCES `core_ecommercefeaturerole` (`id`),
  CONSTRAINT `core_ecommercefeatur_user_id_f692628b_fk_ecommerce` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_ecommercefeatureroleassignment`
--

LOCK TABLES `core_ecommercefeatureroleassignment` WRITE;
/*!40000 ALTER TABLE `core_ecommercefeatureroleassignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_ecommercefeatureroleassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_historicalbusinessclient`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_historicalbusinessclient` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `enterprise_customer_uuid` char(32) DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `core_historicalbusin_history_user_id_c003ab66_fk_ecommerce` (`history_user_id`),
  KEY `core_historicalbusinessclient_id_1f2c8e41` (`id`),
  KEY `core_historicalbusinessclient_name_3c807144` (`name`),
  CONSTRAINT `core_historicalbusin_history_user_id_c003ab66_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_historicalbusinessclient`
--

LOCK TABLES `core_historicalbusinessclient` WRITE;
/*!40000 ALTER TABLE `core_historicalbusinessclient` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_historicalbusinessclient` ENABLE KEYS */;
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
  `base_cookie_domain` varchar(255) NOT NULL,
  `enable_embargo_check` tinyint(1) NOT NULL,
  `discovery_api_url` varchar(200) NOT NULL,
  `enable_apple_pay` tinyint(1) NOT NULL,
  `enable_partial_program` tinyint(1) NOT NULL,
  `hubspot_secret_key` varchar(255) NOT NULL,
  `enable_microfrontend_for_basket_page` tinyint(1) NOT NULL,
  `payment_microfrontend_url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_siteconfiguration_site_id_3124a87d_uniq` (`site_id`),
  KEY `core_siteconfiguration_partner_id_75739217` (`partner_id`),
  CONSTRAINT `core_siteconfiguration_partner_id_75739217_fk_partner_partner_id` FOREIGN KEY (`partner_id`) REFERENCES `partner_partner` (`id`),
  CONSTRAINT `core_siteconfiguration_site_id_3124a87d_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_siteconfiguration`
--

LOCK TABLES `core_siteconfiguration` WRITE;
/*!40000 ALTER TABLE `core_siteconfiguration` DISABLE KEYS */;
INSERT INTO `core_siteconfiguration` VALUES (1,'http://edx.devstack.lms:18000',NULL,'cybersource,paypal',1,1,'{\"SOCIAL_AUTH_EDX_OAUTH2_URL_ROOT\": \"http://edx.devstack.lms:18000\", \"SOCIAL_AUTH_EDX_OAUTH2_LOGOUT_URL\": \"http://edx.devstack.lms:18000/logout\", \"SOCIAL_AUTH_EDX_OAUTH2_ISSUERS\": [\"http://edx.devstack.lms:18000\"], \"SOCIAL_AUTH_EDX_OAUTH2_PUBLIC_URL_ROOT\": \"http://localhost:18000\", \"SOCIAL_AUTH_EDX_OAUTH2_KEY\": \"ecommerce-sso-key\", \"SOCIAL_AUTH_EDX_OAUTH2_SECRET\": \"ecommerce-sso-secret\", \"BACKEND_SERVICE_EDX_OAUTH2_KEY\": \"ecommerce-backend-service-key\", \"BACKEND_SERVICE_EDX_OAUTH2_SECRET\": \"ecommerce-backend-service-secret\"}',NULL,'staff@example.com',0,'support@example.com','','','','cybersource',0,0,'','','',1,'','',0,'http://edx.devstack.discovery:18381/api/v1/',0,0,'',1,'http://localhost:1998');
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
  `site_id` int(11) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `partner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_site_id_af38aac5_fk_django_site_id` (`site_id`),
  KEY `courses_course_partner_id_a64c9b38_fk_partner_partner_id` (`partner_id`),
  CONSTRAINT `courses_course_partner_id_a64c9b38_fk_partner_partner_id` FOREIGN KEY (`partner_id`) REFERENCES `partner_partner` (`id`),
  CONSTRAINT `courses_course_site_id_af38aac5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_course`
--

LOCK TABLES `courses_course` WRITE;
/*!40000 ALTER TABLE `courses_course` DISABLE KEYS */;
INSERT INTO `courses_course` VALUES ('course-v1:edX+DemoX+Demo_Course','edX Demonstration Course',NULL,'2024-12-15 20:50:05.911487',NULL,'2022-12-16 20:50:05.920690','2022-12-16 20:50:05.920701',1);
/*!40000 ALTER TABLE `courses_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_historicalcourse`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_historicalcourse` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `verification_deadline` datetime(6) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `thumbnail_url` varchar(200) DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `partner_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `courses_historicalco_history_user_id_5aca3c34_fk_ecommerce` (`history_user_id`),
  KEY `courses_historicalcourse_id_ef83d5ac` (`id`),
  KEY `courses_historicalcourse_partner_id_c09fe2b8` (`partner_id`),
  KEY `courses_historicalcourse_site_id_dfff3795` (`site_id`),
  CONSTRAINT `courses_historicalco_history_user_id_5aca3c34_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_historicalcourse`
--

LOCK TABLES `courses_historicalcourse` WRITE;
/*!40000 ALTER TABLE `courses_historicalcourse` DISABLE KEYS */;
INSERT INTO `courses_historicalcourse` VALUES ('course-v1:edX+DemoX+Demo_Course','edX Demonstration Course','2024-12-15 20:50:05.911487','2022-12-16 20:50:05.920690','2022-12-16 20:50:05.920701',NULL,1,'2022-12-16 20:50:05.921100',NULL,'+',NULL,1,NULL);
/*!40000 ALTER TABLE `courses_historicalcourse` ENABLE KEYS */;
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
  KEY `customer_productaler_product_id_7e529a41_fk_catalogue` (`product_id`),
  KEY `customer_productalert_user_id_677ad6d6_fk_ecommerce_user_id` (`user_id`),
  KEY `customer_productalert_email_e5f35f45` (`email`),
  KEY `customer_productalert_key_a26f3bdc` (`key`),
  CONSTRAINT `customer_productaler_product_id_7e529a41_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
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
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_ecommerce_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
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
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'address','country'),(2,'address','useraddress'),(3,'admin','logentry'),(4,'analytics','productrecord'),(5,'analytics','userproductview'),(6,'analytics','userrecord'),(7,'analytics','usersearch'),(9,'auth','group'),(8,'auth','permission'),(10,'basket','basket'),(13,'basket','basketattribute'),(14,'basket','basketattributetype'),(11,'basket','line'),(12,'basket','lineattribute'),(15,'catalogue','attributeoption'),(16,'catalogue','attributeoptiongroup'),(26,'catalogue','catalog'),(17,'catalogue','category'),(29,'catalogue','historicalcategory'),(30,'catalogue','historicaloption'),(27,'catalogue','historicalproduct'),(31,'catalogue','historicalproductattribute'),(28,'catalogue','historicalproductattributevalue'),(32,'catalogue','historicalproductcategory'),(33,'catalogue','historicalproductclass'),(18,'catalogue','option'),(19,'catalogue','product'),(20,'catalogue','productattribute'),(21,'catalogue','productattributevalue'),(22,'catalogue','productcategory'),(23,'catalogue','productclass'),(24,'catalogue','productimage'),(25,'catalogue','productrecommendation'),(34,'communication','communicationeventtype'),(36,'communication','email'),(35,'communication','notification'),(37,'contenttypes','contenttype'),(95,'core','businessclient'),(40,'core','client'),(96,'core','ecommercefeaturerole'),(97,'core','ecommercefeatureroleassignment'),(98,'core','historicalbusinessclient'),(39,'core','siteconfiguration'),(38,'core','user'),(41,'courses','course'),(99,'courses','historicalcourse'),(42,'customer','communicationeventtype'),(43,'customer','email'),(44,'customer','notification'),(45,'customer','productalert'),(88,'flatpages','flatpage'),(101,'invoice','historicalinvoice'),(100,'invoice','invoice'),(52,'offer','absolutediscountbenefit'),(46,'offer','benefit'),(126,'offer','codeassignmentnudgeemails'),(125,'offer','codeassignmentnudgeemailtemplates'),(47,'offer','condition'),(48,'offer','conditionaloffer'),(53,'offer','countcondition'),(54,'offer','coveragecondition'),(55,'offer','fixedpricebenefit'),(117,'offer','historicalbenefit'),(118,'offer','historicalcondition'),(119,'offer','historicalconditionaloffer'),(120,'offer','historicalofferassignment'),(121,'offer','historicalrange'),(122,'offer','historicalrangeproduct'),(56,'offer','multibuydiscountbenefit'),(115,'offer','offerassignment'),(116,'offer','offerassignmentemailattempt'),(127,'offer','offerassignmentemailsentrecord'),(123,'offer','offerassignmentemailtemplates'),(124,'offer','offerusageemail'),(57,'offer','percentagediscountbenefit'),(49,'offer','range'),(50,'offer','rangeproduct'),(51,'offer','rangeproductfileupload'),(59,'offer','shippingabsolutediscountbenefit'),(58,'offer','shippingbenefit'),(60,'offer','shippingfixedpricebenefit'),(61,'offer','shippingpercentagediscountbenefit'),(128,'offer','templatefileattachment'),(62,'offer','valuecondition'),(63,'order','billingaddress'),(64,'order','communicationevent'),(129,'order','historicalline'),(130,'order','historicalorder'),(133,'order','historicalorderdiscount'),(65,'order','line'),(66,'order','lineattribute'),(67,'order','lineprice'),(131,'order','manualenrollmentorderdiscountbenefit'),(132,'order','manualenrollmentorderdiscountcondition'),(135,'order','markordersstatuscompleteconfig'),(68,'order','order'),(69,'order','orderdiscount'),(70,'order','ordernote'),(134,'order','orderstatuschange'),(71,'order','paymentevent'),(72,'order','paymenteventquantity'),(73,'order','paymenteventtype'),(74,'order','shippingaddress'),(75,'order','shippingevent'),(76,'order','shippingeventquantity'),(77,'order','shippingeventtype'),(136,'order','surcharge'),(138,'partner','historicalpartner'),(137,'partner','historicalstockrecord'),(78,'partner','partner'),(79,'partner','partneraddress'),(80,'partner','stockalert'),(81,'partner','stockrecord'),(139,'payment','bankcard'),(147,'payment','enterprisecontractmetadata'),(143,'payment','paymentprocessorresponse'),(145,'payment','paypalprocessorconfiguration'),(144,'payment','paypalwebprofile'),(146,'payment','sdncheckfailure'),(149,'payment','sdnfallbackdata'),(148,'payment','sdnfallbackmetadata'),(140,'payment','source'),(141,'payment','sourcetype'),(142,'payment','transaction'),(102,'referrals','referral'),(113,'refund','historicalrefund'),(114,'refund','historicalrefundline'),(111,'refund','refund'),(112,'refund','refundline'),(107,'reviews','productreview'),(108,'reviews','vote'),(89,'sessions','session'),(104,'shipping','orderanditemcharges'),(105,'shipping','weightband'),(106,'shipping','weightbased'),(82,'sites','site'),(90,'social_django','association'),(91,'social_django','code'),(92,'social_django','nonce'),(94,'social_django','partial'),(93,'social_django','usersocialauth'),(103,'theming','sitetheme'),(154,'thumbnail','kvstore'),(150,'voucher','couponvouchers'),(153,'voucher','historicalvoucherapplication'),(151,'voucher','orderlinevouchers'),(83,'voucher','voucher'),(84,'voucher','voucherapplication'),(152,'voucher','voucherset'),(85,'waffle','flag'),(86,'waffle','sample'),(87,'waffle','switch'),(109,'wishlists','line'),(110,'wishlists','wishlist');
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
  KEY `django_flatpage_url_41612362` (`url`)
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
  UNIQUE KEY `django_flatpage_sites_flatpage_id_site_id_0d29d9d1_uniq` (`flatpage_id`,`site_id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=398 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-12-16 20:46:36.967472'),(2,'auth','0001_initial','2022-12-16 20:46:37.091429'),(3,'core','0001_initial','2022-12-16 20:46:37.229426'),(4,'address','0001_initial','2022-12-16 20:46:37.350475'),(5,'address','0002_auto_20150927_1547','2022-12-16 20:46:37.392111'),(6,'address','0003_auto_20150927_1551','2022-12-16 20:46:37.412496'),(7,'address','0004_auto_20170226_1122','2022-12-16 20:46:37.441514'),(8,'address','0005_regenerate_user_address_hashes','2022-12-16 20:46:37.457313'),(9,'address','0006_auto_20181115_1953','2022-12-16 20:46:37.490920'),(10,'admin','0001_initial','2022-12-16 20:46:37.578919'),(11,'admin','0002_logentry_remove_auto_add','2022-12-16 20:46:37.588941'),(12,'admin','0003_logentry_add_action_flag_choices','2022-12-16 20:46:37.597962'),(13,'catalogue','0001_initial','2022-12-16 20:46:38.456019'),(14,'analytics','0001_initial','2022-12-16 20:46:38.617033'),(15,'analytics','0002_auto_20140827_1705','2022-12-16 20:46:38.736829'),(16,'contenttypes','0002_remove_content_type_name','2022-12-16 20:46:38.806383'),(17,'auth','0002_alter_permission_name_max_length','2022-12-16 20:46:38.845787'),(18,'auth','0003_alter_user_email_max_length','2022-12-16 20:46:38.855088'),(19,'auth','0004_alter_user_username_opts','2022-12-16 20:46:38.863924'),(20,'auth','0005_alter_user_last_login_null','2022-12-16 20:46:38.976543'),(21,'auth','0006_require_contenttypes_0002','2022-12-16 20:46:38.982911'),(22,'auth','0007_alter_validators_add_error_messages','2022-12-16 20:46:38.992677'),(23,'auth','0008_alter_user_username_max_length','2022-12-16 20:46:39.002449'),(24,'auth','0009_alter_user_last_name_max_length','2022-12-16 20:46:39.012017'),(25,'auth','0010_alter_group_name_max_length','2022-12-16 20:46:39.054841'),(26,'auth','0011_update_proxy_permissions','2022-12-16 20:46:39.076053'),(27,'auth','0012_alter_user_first_name_max_length','2022-12-16 20:46:39.085220'),(28,'waffle','0001_initial','2022-12-16 20:46:39.415910'),(29,'sites','0001_initial','2022-12-16 20:46:39.430180'),(30,'partner','0001_initial','2022-12-16 20:46:39.772772'),(31,'customer','0001_initial','2022-12-16 20:46:40.021712'),(32,'basket','0001_initial','2022-12-16 20:46:40.095204'),(33,'basket','0002_auto_20140827_1705','2022-12-16 20:46:40.369371'),(34,'order','0001_initial','2022-12-16 20:46:42.573694'),(35,'offer','0001_initial','2022-12-16 20:46:43.331741'),(36,'voucher','0001_initial','2022-12-16 20:46:43.706047'),(37,'basket','0003_basket_vouchers','2022-12-16 20:46:43.818961'),(38,'basket','0004_auto_20141007_2032','2022-12-16 20:46:43.844360'),(39,'basket','0005_auto_20150709_1205','2022-12-16 20:46:43.903640'),(40,'basket','0006_basket_site','2022-12-16 20:46:43.986072'),(41,'basket','0007_auto_20160907_2040','2022-12-16 20:46:44.134232'),(42,'basket','0008_auto_20170215_2224','2022-12-16 20:46:44.160350'),(43,'basket','0009_auto_20170215_2229','2022-12-16 20:46:44.193473'),(44,'basket','0010_create_repeat_purchase_switch','2022-12-16 20:46:44.244449'),(45,'basket','0011_add_email_basket_attribute_type','2022-12-16 20:46:44.458893'),(46,'basket','0012_add_purchaser_basket_attribute','2022-12-16 20:46:44.790217'),(47,'basket','0013_auto_20200305_1448','2022-12-16 20:46:44.826262'),(48,'basket','0014_line_date_updated','2022-12-16 20:46:44.889442'),(49,'basket','0015_add_paymentintentid','2022-12-16 20:46:44.942091'),(50,'sites','0002_alter_domain_unique','2022-12-16 20:46:44.963144'),(51,'partner','0002_auto_20141007_2032','2022-12-16 20:46:44.989388'),(52,'partner','0003_auto_20150223_1130','2022-12-16 20:46:44.994941'),(53,'courses','0001_initial','2022-12-16 20:46:45.011755'),(54,'catalogue','0002_auto_20150223_1052','2022-12-16 20:46:45.074323'),(55,'catalogue','0003_product_course','2022-12-16 20:46:45.164106'),(56,'catalogue','0004_auto_20150609_0129','2022-12-16 20:46:45.738539'),(57,'partner','0004_auto_20150609_1215','2022-12-16 20:46:45.950382'),(58,'partner','0005_auto_20150610_1355','2022-12-16 20:46:46.111005'),(59,'partner','0006_auto_20150709_1205','2022-12-16 20:46:46.164484'),(60,'partner','0007_auto_20150914_0841','2022-12-16 20:46:46.409208'),(61,'partner','0008_auto_20150914_1057','2022-12-16 20:46:46.459557'),(62,'partner','0009_partner_enable_sailthru','2022-12-16 20:46:46.574117'),(63,'partner','0010_auto_20161025_1446','2022-12-16 20:46:46.609401'),(64,'partner','0011_auto_20170525_2138','2022-12-16 20:46:46.651925'),(65,'partner','0012_auto_20180119_0903','2022-12-16 20:46:46.924276'),(66,'partner','0013_partner_default_site','2022-12-16 20:46:47.173767'),(67,'courses','0002_historicalcourse','2022-12-16 20:46:47.270897'),(68,'courses','0003_auto_20150618_1108','2022-12-16 20:46:47.341807'),(69,'courses','0004_auto_20150803_1406','2022-12-16 20:46:47.417111'),(70,'courses','0005_auto_20170525_0131','2022-12-16 20:46:47.715563'),(71,'courses','0006_auto_20171204_1036','2022-12-16 20:46:47.994207'),(72,'courses','0007_auto_20180119_0903','2022-12-16 20:46:48.152431'),(73,'courses','0008_course_partner','2022-12-16 20:46:48.235259'),(74,'courses','0009_allow_site_to_be_nullable','2022-12-16 20:46:48.338695'),(75,'courses','0010_migrate_partner_data_to_courses','2022-12-16 20:46:48.487491'),(76,'catalogue','0005_auto_20150610_1355','2022-12-16 20:46:48.937284'),(77,'catalogue','0006_credit_provider_attr','2022-12-16 20:46:48.997677'),(78,'catalogue','0007_auto_20150709_1205','2022-12-16 20:46:49.218658'),(79,'catalogue','0008_auto_20150709_1254','2022-12-16 20:46:49.459587'),(80,'catalogue','0009_credit_hours_attr','2022-12-16 20:46:49.530907'),(81,'catalogue','0010_catalog','2022-12-16 20:46:49.679739'),(82,'catalogue','0011_auto_20151019_0639','2022-12-16 20:46:49.744577'),(83,'catalogue','0012_enrollment_code_product_class','2022-12-16 20:46:49.748518'),(84,'catalogue','0013_coupon_product_class','2022-12-16 20:46:49.866450'),(85,'catalogue','0014_alter_couponvouchers_attribute','2022-12-16 20:46:49.926735'),(86,'catalogue','0015_default_categories','2022-12-16 20:46:50.018089'),(87,'catalogue','0016_coupon_note_attribute','2022-12-16 20:46:50.199331'),(88,'catalogue','0017_enrollment_code_product_class','2022-12-16 20:46:50.259863'),(89,'catalogue','0018_auto_20160530_0134','2022-12-16 20:46:50.286573'),(90,'catalogue','0019_enrollment_code_idverifyreq_attribute','2022-12-16 20:46:50.348274'),(91,'catalogue','0020_auto_20161025_1446','2022-12-16 20:46:50.374101'),(92,'catalogue','0021_auto_20170215_2224','2022-12-16 20:46:50.450205'),(93,'catalogue','0022_auto_20170215_2229','2022-12-16 20:46:50.516680'),(94,'catalogue','0023_auto_20170215_2234','2022-12-16 20:46:50.574493'),(95,'catalogue','0024_fix_enrollment_code_slug','2022-12-16 20:46:50.753832'),(96,'catalogue','0025_course_entitlement','2022-12-16 20:46:50.817909'),(97,'catalogue','0026_course_entitlement_attr_change','2022-12-16 20:46:50.884517'),(98,'catalogue','0027_catalogue_entitlement_option','2022-12-16 20:46:50.942191'),(99,'catalogue','0028_donations_from_checkout_tests_product_type','2022-12-16 20:46:51.009262'),(100,'catalogue','0029_auto_20180119_0903','2022-12-16 20:46:51.886273'),(101,'catalogue','0030_auto_20180124_1131','2022-12-16 20:46:52.306774'),(102,'catalogue','0031_course_entitlement_idverifyreq_attr','2022-12-16 20:46:52.366372'),(103,'catalogue','0032_journal_product_class','2022-12-16 20:46:52.426359'),(104,'catalogue','0033_add_coupon_categories','2022-12-16 20:46:52.495452'),(105,'catalogue','0034_add_on_campus_coupon_category','2022-12-16 20:46:52.557580'),(106,'catalogue','0035_add_partner_no_rev_coupon_categories','2022-12-16 20:46:52.624298'),(107,'catalogue','0036_coupon_notify_email_attribute','2022-12-16 20:46:52.698809'),(108,'catalogue','0037_add_sec_disc_reward_coupon_category','2022-12-16 20:46:52.881647'),(109,'catalogue','0038_coupon_enterprise_id_attribute','2022-12-16 20:46:52.940518'),(110,'catalogue','0039_historicalproduct_historicalproductattributevalue','2022-12-16 20:46:53.241453'),(111,'catalogue','0040_historicalcategory_historicaloption_historicalproductattribute_historicalproductcategory_historicalp','2022-12-16 20:46:53.900860'),(112,'catalogue','0041_auto_20190903_1752','2022-12-16 20:46:53.976281'),(113,'catalogue','0042_auto_20190913_1756','2022-12-16 20:46:54.036377'),(114,'catalogue','0043_auto_20191115_2151','2022-12-16 20:46:54.392627'),(115,'catalogue','0044_add_enterprisecontractmetadata_product_attribute','2022-12-16 20:46:54.454835'),(116,'catalogue','0045_add_edx_employee_coupon_category','2022-12-16 20:46:54.523615'),(117,'catalogue','0046_coupon_inactive_attribute','2022-12-16 20:46:54.592568'),(118,'catalogue','0047_coupon_sales_force_id_attribute','2022-12-16 20:46:54.655503'),(119,'catalogue','0048_auto_20200311_1240','2022-12-16 20:46:55.905113'),(120,'catalogue','0049_add_rap_and_orap_coupon_categories','2022-12-16 20:46:55.973921'),(121,'catalogue','0050_add_b2b_affiliate_promotion_coupon_category','2022-12-16 20:46:56.042660'),(122,'catalogue','0051_coupon_public_batch_attribute','2022-12-16 20:46:56.113027'),(123,'catalogue','0052_add_scholarship_coupon_category','2022-12-16 20:46:56.198474'),(124,'catalogue','0053_auto_20210922_1857','2022-12-16 20:46:56.976291'),(125,'catalogue','0054_add_variant_id_product_attr','2022-12-16 20:46:57.039061'),(126,'communication','0001_initial','2022-12-16 20:46:57.399844'),(127,'core','0002_auto_20150826_1455','2022-12-16 20:46:57.695429'),(128,'core','0003_auto_20150914_1120','2022-12-16 20:46:57.843580'),(129,'core','0004_auto_20150915_1023','2022-12-16 20:46:58.077391'),(130,'core','0005_auto_20150924_0123','2022-12-16 20:46:58.151319'),(131,'core','0006_add_service_user','2022-12-16 20:46:58.221312'),(132,'core','0007_auto_20151005_1333','2022-12-16 20:46:58.289788'),(133,'core','0008_client','2022-12-16 20:46:58.381962'),(134,'core','0009_service_user_privileges','2022-12-16 20:46:58.665824'),(135,'core','0010_add_async_sample','2022-12-16 20:46:58.738507'),(136,'core','0011_siteconfiguration_oauth_settings','2022-12-16 20:46:58.778349'),(137,'core','0012_businessclient','2022-12-16 20:46:58.796359'),(138,'core','0013_siteconfiguration_segment_key','2022-12-16 20:46:58.831671'),(139,'core','0014_enrollment_code_switch','2022-12-16 20:46:59.032412'),(140,'core','0015_siteconfiguration_from_email','2022-12-16 20:46:59.077182'),(141,'core','0016_siteconfiguration_enable_enrollment_codes','2022-12-16 20:46:59.115468'),(142,'core','0017_siteconfiguration_payment_support_email','2022-12-16 20:46:59.153445'),(143,'core','0018_siteconfiguration_payment_support_url','2022-12-16 20:46:59.194232'),(144,'core','0019_auto_20161012_1404','2022-12-16 20:46:59.267376'),(145,'core','0020_siteconfiguration_enable_otto_receipt_page','2022-12-16 20:46:59.308281'),(146,'core','0021_siteconfiguration_client_side_payment_processor','2022-12-16 20:46:59.348104'),(147,'core','0022_auto_20161108_2101','2022-12-16 20:46:59.366634'),(148,'core','0023_siteconfiguration_send_refund_notifications','2022-12-16 20:46:59.410651'),(149,'core','0024_auto_20170208_1520','2022-12-16 20:46:59.557212'),(150,'core','0025_auto_20170214_0003','2022-12-16 20:46:59.577084'),(151,'core','0026_auto_20170215_2234','2022-12-16 20:46:59.638739'),(152,'core','0027_siteconfiguration_require_account_activation','2022-12-16 20:46:59.683917'),(153,'core','0028_siteconfiguration_optimizely_snippet_src','2022-12-16 20:46:59.722451'),(154,'core','0029_auto_20170525_2131','2022-12-16 20:46:59.767637'),(155,'core','0030_auto_20170525_2134','2022-12-16 20:46:59.902327'),(156,'core','0031_siteconfiguration_enable_sailthru','2022-12-16 20:47:00.001832'),(157,'core','0032_auto_20170602_0516','2022-12-16 20:47:00.227595'),(158,'core','0033_auto_20170606_0539','2022-12-16 20:47:00.294598'),(159,'core','0034_auto_20170613_2039','2022-12-16 20:47:00.311657'),(160,'core','0035_siteconfiguration_base_cookie_domain','2022-12-16 20:47:00.352740'),(161,'core','0036_remove_siteconfiguration_enable_otto_receipt_page','2022-12-16 20:47:00.392830'),(162,'core','0037_siteconfiguration_enable_embargo_check','2022-12-16 20:47:00.431207'),(163,'core','0038_siteconfiguration_discovery_api_url','2022-12-16 20:47:00.495280'),(164,'core','0039_auto_20170716_2212','2022-12-16 20:47:00.605201'),(165,'core','0040_siteconfiguration__allowed_segment_events','2022-12-16 20:47:00.672046'),(166,'core','0041_remove_siteconfiguration__allowed_segment_events','2022-12-16 20:47:00.712624'),(167,'core','0042_siteconfiguration_enable_partial_program','2022-12-16 20:47:00.760171'),(168,'core','0043_auto_20170808_1009','2022-12-16 20:47:00.779238'),(169,'core','0044_auto_20180313_0702','2022-12-16 20:47:00.847221'),(170,'core','0045_auto_20180510_0823','2022-12-16 20:47:00.954270'),(171,'core','0046_siteconfiguration_journals_api_url','2022-12-16 20:47:00.990772'),(172,'core','0047_businessclient_enterprise_customer_uuid','2022-12-16 20:47:01.016558'),(173,'core','0048_siteconfiguration_hubspot_secret_key','2022-12-16 20:47:01.053438'),(174,'core','0049_ecommercefeaturerole_ecommercefeatureroleassignment','2022-12-16 20:47:01.328576'),(175,'core','0050_add_specific_ecommerce_roles','2022-12-16 20:47:01.405865'),(176,'core','0051_ecommercefeatureroleassignment_enterprise_id','2022-12-16 20:47:01.457308'),(177,'core','0052_historicalbusinessclient','2022-12-16 20:47:01.640014'),(178,'core','0053_user_lms_user_id','2022-12-16 20:47:01.741770'),(179,'core','0054_auto_20190626_0153','2022-12-16 20:47:01.825712'),(180,'core','0055_add_ordermanager_role','2022-12-16 20:47:01.899209'),(181,'core','0056_remove_siteconfiguration_journals_api_url','2022-12-16 20:47:01.936998'),(182,'core','0057_auto_20190920_1752','2022-12-16 20:47:02.016285'),(183,'core','0058_auto_20191115_2151','2022-12-16 20:47:02.365514'),(184,'core','0059_auto_20200115_1941','2022-12-16 20:47:02.489139'),(185,'core','0060_auto_20200117_1312','2022-12-16 20:47:02.565574'),(186,'core','0061_auto_20200407_1725','2022-12-16 20:47:02.625407'),(187,'core','0062_siteconfiguration_account_microfrontend_url','2022-12-16 20:47:02.666735'),(188,'core','0063_braze_switch','2022-12-16 20:47:02.741696'),(189,'core','0064_remove_siteconfiguration_enable_sailthru','2022-12-16 20:47:02.782183'),(190,'core','0065_ecommercefeatureroleassignment_applies_to_all_contexts','2022-12-16 20:47:02.963603'),(191,'core','0066_remove_account_microfrontend_url_field_from_SiteConfiguration','2022-12-16 20:47:03.000606'),(192,'partner','0014_historicalstockrecord','2022-12-16 20:47:03.139519'),(193,'courses','0011_historicalcourse','2022-12-16 20:47:03.273381'),(194,'courses','0012_auto_20191115_2151','2022-12-16 20:47:03.344340'),(195,'order','0002_auto_20141007_2032','2022-12-16 20:47:03.388317'),(196,'order','0003_auto_20150224_1520','2022-12-16 20:47:03.458651'),(197,'order','0004_order_payment_processor','2022-12-16 20:47:03.534390'),(198,'order','0005_deprecate_order_payment_processor','2022-12-16 20:47:03.610708'),(199,'order','0006_paymentevent_processor_name','2022-12-16 20:47:03.787252'),(200,'order','0007_create_history_tables','2022-12-16 20:47:04.112445'),(201,'order','0008_delete_order_payment_processor','2022-12-16 20:47:04.244832'),(202,'order','0009_auto_20150709_1205','2022-12-16 20:47:04.321921'),(203,'order','0010_auto_20160529_2245','2022-12-16 20:47:04.368479'),(204,'order','0011_auto_20161025_1446','2022-12-16 20:47:04.413562'),(205,'order','0012_auto_20170215_2224','2022-12-16 20:47:04.587267'),(206,'order','0013_auto_20170215_2229','2022-12-16 20:47:04.735985'),(207,'order','0014_auto_20170606_0535','2022-12-16 20:47:04.850253'),(208,'order','0015_create_disable_repeat_order_check_switch','2022-12-16 20:47:04.931108'),(209,'order','0016_auto_20180119_0903','2022-12-16 20:47:06.236972'),(210,'order','0017_order_partner','2022-12-16 20:47:06.339357'),(211,'order','0018_historicalline_historicalorder','2022-12-16 20:47:06.788123'),(212,'voucher','0002_couponvouchers','2022-12-16 20:47:07.114611'),(213,'voucher','0003_orderlinevouchers','2022-12-16 20:47:07.280691'),(214,'voucher','0004_auto_20160517_0930','2022-12-16 20:47:07.357709'),(215,'voucher','0005_auto_20180124_1131','2022-12-16 20:47:07.518764'),(216,'voucher','0006_auto_20181205_1017','2022-12-16 20:47:07.588350'),(217,'offer','0002_range_catalog','2022-12-16 20:47:07.816924'),(218,'offer','0003_auto_20160517_1247','2022-12-16 20:47:07.923753'),(219,'offer','0004_auto_20160530_0944','2022-12-16 20:47:07.985463'),(220,'offer','0005_conditionaloffer_email_domains','2022-12-16 20:47:08.018975'),(221,'offer','0006_auto_20161025_1446','2022-12-16 20:47:08.054321'),(222,'offer','0007_auto_20161026_0856','2022-12-16 20:47:08.118147'),(223,'offer','0008_range_course_catalog','2022-12-16 20:47:08.174647'),(224,'offer','0009_range_enterprise_customer','2022-12-16 20:47:08.233743'),(225,'offer','0010_auto_20170215_2224','2022-12-16 20:47:08.260500'),(226,'offer','0011_auto_20170215_2324','2022-12-16 20:47:08.292889'),(227,'offer','0012_condition_program_uuid','2022-12-16 20:47:08.331105'),(228,'offer','0013_auto_20170801_0742','2022-12-16 20:47:08.366707'),(229,'offer','0014_conditionaloffer_site','2022-12-16 20:47:08.473529'),(230,'offer','0015_auto_20170926_1357','2022-12-16 20:47:08.698834'),(231,'offer','0016_auto_20180124_1131','2022-12-16 20:47:08.963641'),(232,'offer','0017_condition_journal_bundle_uuid','2022-12-16 20:47:09.001592'),(233,'offer','0018_conditionaloffer_partner','2022-12-16 20:47:09.105638'),(234,'offer','0019_migrate_partner_to_conditional_offers','2022-12-16 20:47:09.314529'),(235,'offer','0020_migrate_partner_to_coupon_offers','2022-12-16 20:47:09.398007'),(236,'offer','0021_range_enterprise_customer_catalog','2022-12-16 20:47:09.456889'),(237,'offer','0022_offerassignment','2022-12-16 20:47:09.587997'),(238,'offer','0023_offerassignmentemailattempt','2022-12-16 20:47:09.695315'),(239,'offer','0024_add_history_models_de_1424','2022-12-16 20:47:10.672533'),(240,'offer','0025_auto_20190624_1747','2022-12-16 20:47:10.756790'),(241,'order','0019_manualenrollmentorderdiscountbenefit_manualenrollmentorderdiscountcondition','2022-12-16 20:47:10.768315'),(242,'order','0020_auto_20191115_2151','2022-12-16 20:47:10.820960'),(243,'order','0021_auto_20191212_1630','2022-12-16 20:47:11.276434'),(244,'order','0022_historicalorderdiscount','2022-12-16 20:47:11.423284'),(245,'order','0023_auto_20200305_1448','2022-12-16 20:47:11.720456'),(246,'order','0024_markordersstatuscompleteconfig','2022-12-16 20:47:11.984940'),(247,'order','0025_auto_20210922_1857','2022-12-16 20:47:12.199039'),(248,'customer','0002_auto_20160517_0930','2022-12-16 20:47:12.209465'),(249,'customer','0003_auto_20170215_2229','2022-12-16 20:47:12.300055'),(250,'customer','0004_auto_20180124_1131','2022-12-16 20:47:12.492204'),(251,'customer','0005_auto_20191115_2151','2022-12-16 20:47:12.501350'),(252,'customer','0006_auto_20200305_1448','2022-12-16 20:47:12.556357'),(253,'customer','0007_auto_20211213_1702','2022-12-16 20:47:12.961919'),(254,'enterprise','0001_initial','2022-12-16 20:47:12.976766'),(255,'enterprise','0002_add_enterprise_offers_switch','2022-12-16 20:47:13.066555'),(256,'enterprise','0003_add_enable_enterprise_switch','2022-12-16 20:47:13.157241'),(257,'enterprise','0004_add_enterprise_offers_for_coupons','2022-12-16 20:47:13.248718'),(258,'enterprise','0005_assignableenterprisecustomercondition','2022-12-16 20:47:13.257062'),(259,'enterprise','0006_add_role_based_authz_switch','2022-12-16 20:47:13.349781'),(260,'enterprise','0007_remove_role_based_authz_switch','2022-12-16 20:47:13.595766'),(261,'enterprise','0008_remove_enterprise_offers_switch','2022-12-16 20:47:13.685653'),(262,'enterprise','0009_remove_enterprise_offers_for_coupons','2022-12-16 20:47:13.774767'),(263,'enterprise','0010_add_use_enterprise_catalog_flag','2022-12-16 20:47:13.861055'),(264,'enterprise','0011_remove_use_enterprise_catalog_flag','2022-12-16 20:47:13.957823'),(265,'flatpages','0001_initial','2022-12-16 20:47:14.271315'),(266,'fulfillment','0001_initial','2022-12-16 20:47:14.358050'),(267,'invoice','0001_initial','2022-12-16 20:47:14.608563'),(268,'invoice','0002_auto_20160324_1919','2022-12-16 20:47:15.303151'),(269,'invoice','0003_auto_20160616_0657','2022-12-16 20:47:16.176586'),(270,'invoice','0004_auto_20170215_2234','2022-12-16 20:47:16.567178'),(271,'invoice','0005_auto_20180119_0903','2022-12-16 20:47:17.006758'),(272,'invoice','0006_auto_20180228_1057','2022-12-16 20:47:17.225591'),(273,'invoice','0007_historicalinvoice','2022-12-16 20:47:17.385400'),(274,'invoice','0008_auto_20191115_2151','2022-12-16 20:47:17.611669'),(275,'invoice','0009_auto_20210526_2005','2022-12-16 20:47:17.638035'),(276,'payment','0001_initial','2022-12-16 20:47:18.228958'),(277,'payment','0002_auto_20141007_2032','2022-12-16 20:47:18.254483'),(278,'payment','0003_create_payment_processor_response','2022-12-16 20:47:18.417176'),(279,'payment','0004_source_card_type','2022-12-16 20:47:18.465313'),(280,'payment','0005_paypalwebprofile','2022-12-16 20:47:18.484232'),(281,'payment','0006_enable_payment_processors','2022-12-16 20:47:18.732627'),(282,'payment','0007_add_cybersource_level23_sample','2022-12-16 20:47:18.823598'),(283,'payment','0008_remove_cybersource_level23_sample','2022-12-16 20:47:18.915968'),(284,'payment','0009_auto_20161025_1446','2022-12-16 20:47:18.936561'),(285,'payment','0010_create_client_side_checkout_flag','2022-12-16 20:47:19.033252'),(286,'payment','0011_paypalprocessorconfiguration','2022-12-16 20:47:19.052495'),(287,'payment','0012_auto_20161109_1456','2022-12-16 20:47:19.062050'),(288,'payment','0013_sdncheckfailure','2022-12-16 20:47:19.083233'),(289,'payment','0014_sdncheckfailure_site','2022-12-16 20:47:19.193728'),(290,'payment','0015_auto_20170215_2229','2022-12-16 20:47:19.226304'),(291,'payment','0016_auto_20170227_1402','2022-12-16 20:47:19.571763'),(292,'payment','0017_auto_20170328_1445','2022-12-16 20:47:19.684794'),(293,'payment','0018_create_stripe_switch','2022-12-16 20:47:19.775469'),(294,'payment','0019_auto_20180628_2011','2022-12-16 20:47:19.862209'),(295,'payment','0020_auto_20191004_1520','2022-12-16 20:47:19.954849'),(296,'payment','0021_auto_20191115_2151','2022-12-16 20:47:19.985541'),(297,'payment','0022_auto_20191120_2106','2022-12-16 20:47:20.031637'),(298,'payment','0023_auto_20191126_2153','2022-12-16 20:47:20.059689'),(299,'offer','0026_auto_20190903_1806','2022-12-16 20:47:20.372143'),(300,'offer','0027_auto_20190913_1756','2022-12-16 20:47:20.569455'),(301,'offer','0028_auto_20191115_2151','2022-12-16 20:47:20.799604'),(302,'offer','0029_auto_20191126_2153','2022-12-16 20:47:21.175365'),(303,'offer','0030_offerassignmentemailtemplates','2022-12-16 20:47:21.208034'),(304,'offer','0031_auto_20200224_0756','2022-12-16 20:47:21.261319'),(305,'offer','0032_auto_20200305_1109','2022-12-16 20:47:21.449051'),(306,'offer','0033_auto_20200311_1240','2022-12-16 20:47:21.742406'),(307,'offer','0034_auto_20200403_1003','2022-12-16 20:47:21.800125'),(308,'offer','0035_offerassignmentemailtemplates_name','2022-12-16 20:47:21.826507'),(309,'offer','0036_auto_20200514_1636','2022-12-16 20:47:22.050461'),(310,'offer','0037_auto_20200528_1140','2022-12-16 20:47:22.061437'),(311,'offer','0038_auto_20200605_1006','2022-12-16 20:47:22.563597'),(312,'offer','0039_auto_20200617_1032','2022-12-16 20:47:22.852229'),(313,'offer','0040_auto_20200619_0803','2022-12-16 20:47:23.193224'),(314,'offer','0041_auto_20200707_1317','2022-12-16 20:47:23.751750'),(315,'offer','0042_offerassignmentemailtemplates_email_subject','2022-12-16 20:47:23.780263'),(316,'offer','0043_offerusageemail','2022-12-16 20:47:23.901182'),(317,'offer','0044_codeassignmentnudgeemailtemplates','2022-12-16 20:47:23.922693'),(318,'offer','0045_codeassignmentnudgeemails','2022-12-16 20:47:23.991809'),(319,'offer','0046_offerassignmentemailsentrecord','2022-12-16 20:47:24.113332'),(320,'offer','0047_codeassignmentnudgeemailtemplates','2022-12-16 20:47:24.209589'),(321,'offer','0048_auto_20201112_1015','2022-12-16 20:47:24.442713'),(322,'offer','0049_codeassignmentnudgeemails_options','2022-12-16 20:47:24.478385'),(323,'offer','0050_templatefileattachment','2022-12-16 20:47:24.519045'),(324,'offer','0051_offerusageemail_email_type','2022-12-16 20:47:24.551959'),(325,'offer','0052_jsonfield_codeassignmentnudgeemails_offerusageemail','2022-12-16 20:47:24.576641'),(326,'partner','0015_historicalpartner','2022-12-16 20:47:24.722689'),(327,'partner','0016_auto_20191115_2151','2022-12-16 20:47:25.077150'),(328,'partner','0017_auto_20200305_1448','2022-12-16 20:47:25.225444'),(329,'partner','0018_remove_partner_enable_sailthru','2022-12-16 20:47:25.368181'),(330,'payment','0024_auto_20191212_1630','2022-12-16 20:47:25.396354'),(331,'payment','0025_card_type_ordering','2022-12-16 20:47:25.426703'),(332,'payment','0026_auto_20200305_1448','2022-12-16 20:47:25.451742'),(333,'payment','0027_auto_20200811_1356','2022-12-16 20:47:25.474996'),(334,'payment','0028_sdnfallbackmetadata','2022-12-16 20:47:25.498727'),(335,'payment','0029_sdnfallbackdata','2022-12-16 20:47:25.566071'),(336,'payment','0030_delete_sdnfallbackdata','2022-12-16 20:47:25.581248'),(337,'payment','0031_sdnfallbackdata','2022-12-16 20:47:25.646475'),(338,'payment','0032_alter_source_card_type','2022-12-16 20:47:25.675614'),(339,'programs','0001_initial','2022-12-16 20:47:25.692439'),(340,'programs','0002_add_basket_attribute_type','2022-12-16 20:47:25.793144'),(341,'referrals','0001_initial','2022-12-16 20:47:26.116965'),(342,'referrals','0002_auto_20161011_1728','2022-12-16 20:47:26.759661'),(343,'referrals','0003_auto_20161027_1738','2022-12-16 20:47:26.889557'),(344,'referrals','0004_auto_20170215_2234','2022-12-16 20:47:27.303456'),(345,'referrals','0005_auto_20180628_2011','2022-12-16 20:47:27.391582'),(346,'referrals','0006_auto_20210526_2005','2022-12-16 20:47:27.430923'),(347,'refund','0001_squashed_0002_auto_20150515_2220','2022-12-16 20:47:28.296935'),(348,'refund','0002_auto_20151214_1017','2022-12-16 20:47:28.474384'),(349,'refund','0003_auto_20180119_0903','2022-12-16 20:47:29.407707'),(350,'refund','0004_auto_20180403_1120','2022-12-16 20:47:29.520913'),(351,'refund','0005_auto_20180628_2011','2022-12-16 20:47:29.669679'),(352,'refund','0006_historicalrefund_historicalrefundline','2022-12-16 20:47:30.217820'),(353,'refund','0007_auto_20191115_2151','2022-12-16 20:47:30.446299'),(354,'refund','0008_auto_20210526_2005','2022-12-16 20:47:30.551808'),(355,'reviews','0001_initial','2022-12-16 20:47:31.237340'),(356,'reviews','0002_update_email_length','2022-12-16 20:47:31.327931'),(357,'reviews','0003_auto_20160802_1358','2022-12-16 20:47:31.395966'),(358,'reviews','0004_auto_20170429_0941','2022-12-16 20:47:31.509392'),(359,'sailthru','0001_initial','2022-12-16 20:47:31.676710'),(360,'sailthru','0002_add_basket_attribute_type','2022-12-16 20:47:31.974455'),(361,'sessions','0001_initial','2022-12-16 20:47:32.003299'),(362,'shipping','0001_initial','2022-12-16 20:47:32.469330'),(363,'shipping','0002_auto_20150604_1450','2022-12-16 20:47:32.666401'),(364,'shipping','0003_auto_20181115_1953','2022-12-16 20:47:32.710437'),(365,'default','0001_initial','2022-12-16 20:47:33.176443'),(366,'social_auth','0001_initial','2022-12-16 20:47:33.180226'),(367,'default','0002_add_related_name','2022-12-16 20:47:33.276259'),(368,'social_auth','0002_add_related_name','2022-12-16 20:47:33.282299'),(369,'default','0003_alter_email_max_length','2022-12-16 20:47:33.315541'),(370,'social_auth','0003_alter_email_max_length','2022-12-16 20:47:33.319367'),(371,'default','0004_auto_20160423_0400','2022-12-16 20:47:33.370266'),(372,'social_auth','0004_auto_20160423_0400','2022-12-16 20:47:33.375813'),(373,'social_auth','0005_auto_20160727_2333','2022-12-16 20:47:33.396872'),(374,'social_django','0006_partial','2022-12-16 20:47:33.425454'),(375,'social_django','0007_code_timestamp','2022-12-16 20:47:33.464766'),(376,'social_django','0008_partial_timestamp','2022-12-16 20:47:33.506292'),(377,'social_django','0009_auto_20191118_0520','2022-12-16 20:47:33.644454'),(378,'social_django','0010_uid_db_index','2022-12-16 20:47:33.709293'),(379,'theming','0001_initial','2022-12-16 20:47:33.852310'),(380,'thumbnail','0001_initial','2022-12-16 20:47:33.871474'),(381,'voucher','0007_auto_20190913_1756','2022-12-16 20:47:34.315919'),(382,'voucher','0008_auto_20191115_2151','2022-12-16 20:47:34.414256'),(383,'voucher','0009_historicalvoucherapplication','2022-12-16 20:47:34.576019'),(384,'voucher','0010_auto_20200305_1448','2022-12-16 20:47:34.977533'),(385,'voucher','0011_auto_20200403_2046','2022-12-16 20:47:35.178073'),(386,'voucher','0012_voucher_is_public','2022-12-16 20:47:35.227159'),(387,'waffle','0002_auto_20161201_0958','2022-12-16 20:47:35.238865'),(388,'waffle','0003_update_strings_for_i18n','2022-12-16 20:47:36.273134'),(389,'waffle','0004_update_everyone_nullbooleanfield','2022-12-16 20:47:36.533769'),(390,'wishlists','0001_initial','2022-12-16 20:47:37.152021'),(391,'wishlists','0002_auto_20160111_1108','2022-12-16 20:47:37.190213'),(392,'wishlists','0003_auto_20181115_1953','2022-12-16 20:47:37.260015'),(393,'social_django','0002_add_related_name','2022-12-16 20:47:37.271680'),(394,'social_django','0005_auto_20160727_2333','2022-12-16 20:47:37.275715'),(395,'social_django','0003_alter_email_max_length','2022-12-16 20:47:37.279778'),(396,'social_django','0001_initial','2022-12-16 20:47:37.284451'),(397,'social_django','0004_auto_20160423_0400','2022-12-16 20:47:37.289433');
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
  `lms_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `ecommerce_user_email_f3125e14` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_user`
--

LOCK TABLES `ecommerce_user` WRITE;
/*!40000 ALTER TABLE `ecommerce_user` DISABLE KEYS */;
INSERT INTO `ecommerce_user` VALUES (1,'!qkY8HWsu2IoFT3d1wvQVZZKXGrBOcX8qCBE8Fyl9',NULL,0,'ecommerce_worker','','','',1,1,'2022-12-16 20:46:58.212927',NULL,NULL,NULL),(2,'pbkdf2_sha256$260000$hlR8GOcKiadPldPbxlhJj2$PsQ91A5SV3i2xBPIz+klo5+I2pRQfo3JQQnmW1qnjso=',NULL,1,'edx','','','edx@example.com',1,1,'2022-12-16 20:47:41.727822',NULL,NULL,NULL);
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
  UNIQUE KEY `ecommerce_user_groups_user_id_group_id_2a9a583d_uniq` (`user_id`,`group_id`),
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
  UNIQUE KEY `ecommerce_user_user_perm_user_id_permission_id_6d807de6_uniq` (`user_id`,`permission_id`),
  KEY `ecommerce_user_user__permission_id_4dc38e40_fk_auth_perm` (`permission_id`),
  CONSTRAINT `ecommerce_user_user__permission_id_4dc38e40_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `ecommerce_user_user__user_id_0ceec4a8_fk_ecommerce` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_user_user_permissions`
--

LOCK TABLES `ecommerce_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `ecommerce_user_user_permissions` DISABLE KEYS */;
INSERT INTO `ecommerce_user_user_permissions` VALUES (1,1,270);
/*!40000 ALTER TABLE `ecommerce_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_historicalinvoice`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_historicalinvoice` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `state` varchar(255) NOT NULL,
  `number` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `discount_type` varchar(255) DEFAULT NULL,
  `discount_value` int(10) unsigned DEFAULT NULL,
  `tax_deducted_source` int(10) unsigned DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `basket_id` int(11) DEFAULT NULL,
  `business_client_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `invoice_historicalin_history_user_id_65f31e67_fk_ecommerce` (`history_user_id`),
  KEY `invoice_historicalinvoice_id_2ccb1da5` (`id`),
  KEY `invoice_historicalinvoice_basket_id_d6705c0f` (`basket_id`),
  KEY `invoice_historicalinvoice_business_client_id_17658c64` (`business_client_id`),
  KEY `invoice_historicalinvoice_order_id_e8a59d8c` (`order_id`),
  CONSTRAINT `invoice_historicalin_history_user_id_65f31e67_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_historicalinvoice`
--

LOCK TABLES `invoice_historicalinvoice` WRITE;
/*!40000 ALTER TABLE `invoice_historicalinvoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_historicalinvoice` ENABLE KEYS */;
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
  KEY `invoice_invoice_business_client_id_44a4b698_fk_core_busi` (`business_client_id`),
  KEY `invoice_invoice_order_id_c5fc9ae9_fk_order_order_id` (`order_id`),
  KEY `invoice_invoice_basket_id_8795b83e_fk_basket_basket_id` (`basket_id`),
  CONSTRAINT `invoice_invoice_basket_id_8795b83e_fk_basket_basket_id` FOREIGN KEY (`basket_id`) REFERENCES `basket_basket` (`id`),
  CONSTRAINT `invoice_invoice_business_client_id_44a4b698_fk_core_busi` FOREIGN KEY (`business_client_id`) REFERENCES `core_businessclient` (`id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_benefit`
--

LOCK TABLES `offer_benefit` WRITE;
/*!40000 ALTER TABLE `offer_benefit` DISABLE KEYS */;
INSERT INTO `offer_benefit` VALUES (1,'',1.00,NULL,'ecommerce.extensions.offer.dynamic_conditional_offer.DynamicPercentageDiscountBenefit',NULL);
/*!40000 ALTER TABLE `offer_benefit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_codeassignmentnudgeemails`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_codeassignmentnudgeemails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `code` varchar(128) NOT NULL,
  `user_email` varchar(254) NOT NULL,
  `email_date` datetime(6) NOT NULL,
  `already_sent` tinyint(1) NOT NULL,
  `is_subscribed` tinyint(1) NOT NULL,
  `email_template_id` int(11) NOT NULL,
  `options` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offer_codeassignmentnudg_email_template_id_code_u_cdd86ccf_uniq` (`email_template_id`,`code`,`user_email`),
  KEY `offer_codeassignmentnudgeemails_code_52171461` (`code`),
  KEY `offer_codeassignmentnudgeemails_user_email_83439c0f` (`user_email`),
  CONSTRAINT `offer_codeassignment_email_template_id_efc35dca_fk_offer_cod` FOREIGN KEY (`email_template_id`) REFERENCES `offer_codeassignmentnudgeemailtemplates` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_codeassignmentnudgeemails`
--

LOCK TABLES `offer_codeassignmentnudgeemails` WRITE;
/*!40000 ALTER TABLE `offer_codeassignmentnudgeemails` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_codeassignmentnudgeemails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_codeassignmentnudgeemailtemplates`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_codeassignmentnudgeemailtemplates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `email_greeting` longtext,
  `email_closing` longtext,
  `email_subject` longtext,
  `active` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email_type` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_codeassignmentnudgeemailtemplates`
--

LOCK TABLES `offer_codeassignmentnudgeemailtemplates` WRITE;
/*!40000 ALTER TABLE `offer_codeassignmentnudgeemailtemplates` DISABLE KEYS */;
INSERT INTO `offer_codeassignmentnudgeemailtemplates` VALUES (1,'2022-12-16 20:47:24.200002','2022-12-16 20:47:24.200036','Remember when your organization gave you a code to learn on edX? We do, and we\'re glad to have you! Come see what you can learn.','Redeem your edX code and start learning today.','Start learning on edX!',1,'Day 3 Nudge Email','Day3'),(2,'2022-12-16 20:47:24.201271','2022-12-16 20:47:24.201295','Many learners from your organization are completing more problems every week, and are learning new skills. What do you want to start learning?','Join your peers, and start learning today.','Join the learning on edX!',1,'Day 10 Nudge Email','Day10'),(3,'2022-12-16 20:47:24.202194','2022-12-16 20:47:24.202220','Learners like you are earning certificates from some of the top universities and companies in the world. Will you join them?','Learn from the best, and redeem your code today.','It\'s not too late to redeem your edX code!',1,'Day 19 Nudge Email','Day19');
/*!40000 ALTER TABLE `offer_codeassignmentnudgeemailtemplates` ENABLE KEYS */;
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
  `enterprise_customer_catalog_uuid` char(32) DEFAULT NULL,
  `enterprise_customer_name` varchar(255) DEFAULT NULL,
  `enterprise_customer_uuid` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `offer_condition_range_id_b023a2aa_fk_offer_range_id` (`range_id`),
  KEY `offer_condition_enterprise_customer_uuid_59cd657e` (`enterprise_customer_uuid`),
  KEY `offer_condition_program_uuid_c7867a22` (`program_uuid`),
  KEY `offer_condi_enterpr_611782_idx` (`enterprise_customer_uuid`,`program_uuid`),
  CONSTRAINT `offer_condition_range_id_b023a2aa_fk_offer_range_id` FOREIGN KEY (`range_id`) REFERENCES `offer_range` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_condition`
--

LOCK TABLES `offer_condition` WRITE;
/*!40000 ALTER TABLE `offer_condition` DISABLE KEYS */;
INSERT INTO `offer_condition` VALUES (1,'',NULL,'ecommerce.extensions.offer.dynamic_conditional_offer.DynamicDiscountCondition',NULL,NULL,NULL,NULL,NULL);
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
  `partner_id` int(11) DEFAULT NULL,
  `exclusive` tinyint(1) NOT NULL,
  `enterprise_contract_metadata_id` int(11) DEFAULT NULL,
  `sales_force_id` varchar(30) DEFAULT NULL,
  `max_user_discount` decimal(12,2) DEFAULT NULL,
  `emails_for_usage_alert` longtext NOT NULL,
  `usage_email_frequency` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`),
  UNIQUE KEY `enterprise_contract_metadata_id` (`enterprise_contract_metadata_id`),
  KEY `offer_conditionaloffer_benefit_id_f43f68b5_fk_offer_benefit_id` (`benefit_id`),
  KEY `offer_conditionaloff_condition_id_e6baa945_fk_offer_con` (`condition_id`),
  KEY `offer_conditionaloffer_site_id_4409fcc5_fk_django_site_id` (`site_id`),
  KEY `offer_conditionaloffer_partner_id_49d043f6_fk_partner_partner_id` (`partner_id`),
  KEY `offer_conditionaloffer_priority_4c2fc582` (`priority`),
  CONSTRAINT `offer_conditionaloff_condition_id_e6baa945_fk_offer_con` FOREIGN KEY (`condition_id`) REFERENCES `offer_condition` (`id`),
  CONSTRAINT `offer_conditionaloff_enterprise_contract__d5cbdcd5_fk_payment_e` FOREIGN KEY (`enterprise_contract_metadata_id`) REFERENCES `payment_enterprisecontractmetadata` (`id`),
  CONSTRAINT `offer_conditionaloffer_benefit_id_f43f68b5_fk_offer_benefit_id` FOREIGN KEY (`benefit_id`) REFERENCES `offer_benefit` (`id`),
  CONSTRAINT `offer_conditionaloffer_partner_id_49d043f6_fk_partner_partner_id` FOREIGN KEY (`partner_id`) REFERENCES `partner_partner` (`id`),
  CONSTRAINT `offer_conditionaloffer_site_id_4409fcc5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_conditionaloffer`
--

LOCK TABLES `offer_conditionaloffer` WRITE;
/*!40000 ALTER TABLE `offer_conditionaloffer` DISABLE KEYS */;
INSERT INTO `offer_conditionaloffer` VALUES (1,'dynamic_conditional_offer','dynamic_conditional_offer','','Site','Open',-10,NULL,NULL,NULL,NULL,1,NULL,0.00,0,0,'','2022-12-16 20:47:10.749629',1,1,NULL,NULL,NULL,1,NULL,NULL,NULL,'','DAILY');
/*!40000 ALTER TABLE `offer_conditionaloffer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_historicalbenefit`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_historicalbenefit` (
  `id` int(11) NOT NULL,
  `type` varchar(128) NOT NULL,
  `value` decimal(12,2) DEFAULT NULL,
  `max_affected_items` int(10) unsigned DEFAULT NULL,
  `proxy_class` varchar(255) DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `range_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `offer_historicalbene_history_user_id_dfe92ba2_fk_ecommerce` (`history_user_id`),
  KEY `offer_historicalbenefit_id_5ae867db` (`id`),
  KEY `offer_historicalbenefit_range_id_4e48c034` (`range_id`),
  CONSTRAINT `offer_historicalbene_history_user_id_dfe92ba2_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_historicalbenefit`
--

LOCK TABLES `offer_historicalbenefit` WRITE;
/*!40000 ALTER TABLE `offer_historicalbenefit` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_historicalbenefit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_historicalcondition`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_historicalcondition` (
  `id` int(11) NOT NULL,
  `type` varchar(128) NOT NULL,
  `value` decimal(12,2) DEFAULT NULL,
  `proxy_class` varchar(255) DEFAULT NULL,
  `enterprise_customer_uuid` char(32) DEFAULT NULL,
  `enterprise_customer_name` varchar(255) DEFAULT NULL,
  `enterprise_customer_catalog_uuid` char(32) DEFAULT NULL,
  `program_uuid` char(32) DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `range_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `offer_historicalcond_history_user_id_a6c808f1_fk_ecommerce` (`history_user_id`),
  KEY `offer_historicalcondition_id_5795fc09` (`id`),
  KEY `offer_historicalcondition_range_id_5ed1ca70` (`range_id`),
  KEY `offer_historicalcondition_enterprise_customer_uuid_8cbe4b71` (`enterprise_customer_uuid`),
  KEY `offer_historicalcondition_program_uuid_db121fa3` (`program_uuid`),
  CONSTRAINT `offer_historicalcond_history_user_id_a6c808f1_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_historicalcondition`
--

LOCK TABLES `offer_historicalcondition` WRITE;
/*!40000 ALTER TABLE `offer_historicalcondition` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_historicalcondition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_historicalconditionaloffer`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_historicalconditionaloffer` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
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
  `email_domains` varchar(255) DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `benefit_id` int(11) DEFAULT NULL,
  `condition_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `partner_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `exclusive` tinyint(1) NOT NULL,
  `enterprise_contract_metadata_id` int(11) DEFAULT NULL,
  `sales_force_id` varchar(30) DEFAULT NULL,
  `max_user_discount` decimal(12,2) DEFAULT NULL,
  `emails_for_usage_alert` longtext NOT NULL,
  `usage_email_frequency` varchar(8) NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `offer_historicalcond_history_user_id_1dfce220_fk_ecommerce` (`history_user_id`),
  KEY `offer_historicalconditionaloffer_id_5f516738` (`id`),
  KEY `offer_historicalconditionaloffer_name_29a1cac8` (`name`),
  KEY `offer_historicalconditionaloffer_benefit_id_7604697c` (`benefit_id`),
  KEY `offer_historicalconditionaloffer_condition_id_685ce7ea` (`condition_id`),
  KEY `offer_historicalconditionaloffer_partner_id_8f82e893` (`partner_id`),
  KEY `offer_historicalconditionaloffer_site_id_a6eaef0e` (`site_id`),
  KEY `offer_historicalconditional_enterprise_contract_metadat_045a388a` (`enterprise_contract_metadata_id`),
  KEY `offer_historicalconditionaloffer_priority_bf718df5` (`priority`),
  CONSTRAINT `offer_historicalcond_history_user_id_1dfce220_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_historicalconditionaloffer`
--

LOCK TABLES `offer_historicalconditionaloffer` WRITE;
/*!40000 ALTER TABLE `offer_historicalconditionaloffer` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_historicalconditionaloffer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_historicalofferassignment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_historicalofferassignment` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `code` varchar(128) NOT NULL,
  `user_email` varchar(254) NOT NULL,
  `status` varchar(255) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `offer_id` int(11) DEFAULT NULL,
  `voucher_application_id` int(11) DEFAULT NULL,
  `assignment_date` datetime(6) DEFAULT NULL,
  `last_reminder_date` datetime(6) DEFAULT NULL,
  `revocation_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `offer_historicaloffe_history_user_id_9cf22206_fk_ecommerce` (`history_user_id`),
  KEY `offer_historicalofferassignment_id_5400ff80` (`id`),
  KEY `offer_historicalofferassignment_offer_id_a039fe0e` (`offer_id`),
  KEY `offer_historicalofferassignment_voucher_application_id_f9f6a04a` (`voucher_application_id`),
  KEY `offer_historicalofferassignment_code_6a8d896e` (`code`),
  KEY `offer_historicalofferassignment_status_b6ad38e7` (`status`),
  KEY `offer_historicalofferassignment_user_email_c90e77a8` (`user_email`),
  CONSTRAINT `offer_historicaloffe_history_user_id_9cf22206_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_historicalofferassignment`
--

LOCK TABLES `offer_historicalofferassignment` WRITE;
/*!40000 ALTER TABLE `offer_historicalofferassignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_historicalofferassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_historicalrange`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_historicalrange` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` longtext NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `includes_all_products` tinyint(1) NOT NULL,
  `proxy_class` varchar(255) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `catalog_query` longtext,
  `course_catalog` int(10) unsigned DEFAULT NULL,
  `enterprise_customer` char(32) DEFAULT NULL,
  `enterprise_customer_catalog` char(32) DEFAULT NULL,
  `course_seat_types` varchar(255) DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `catalog_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `offer_historicalrang_history_user_id_c7c79383_fk_ecommerce` (`history_user_id`),
  KEY `offer_historicalrange_id_5ff50be3` (`id`),
  KEY `offer_historicalrange_name_7c6b1468` (`name`),
  KEY `offer_historicalrange_proxy_class_be5f4b6b` (`proxy_class`),
  KEY `offer_historicalrange_catalog_id_dc747bbd` (`catalog_id`),
  CONSTRAINT `offer_historicalrang_history_user_id_c7c79383_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_historicalrange`
--

LOCK TABLES `offer_historicalrange` WRITE;
/*!40000 ALTER TABLE `offer_historicalrange` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_historicalrange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_historicalrangeproduct`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_historicalrangeproduct` (
  `id` int(11) NOT NULL,
  `display_order` int(11) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `range_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `offer_historicalrang_history_user_id_c876d862_fk_ecommerce` (`history_user_id`),
  KEY `offer_historicalrangeproduct_id_11a3ed6a` (`id`),
  KEY `offer_historicalrangeproduct_product_id_2f38aabe` (`product_id`),
  KEY `offer_historicalrangeproduct_range_id_a34f98bb` (`range_id`),
  CONSTRAINT `offer_historicalrang_history_user_id_c876d862_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_historicalrangeproduct`
--

LOCK TABLES `offer_historicalrangeproduct` WRITE;
/*!40000 ALTER TABLE `offer_historicalrangeproduct` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_historicalrangeproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_offerassignment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_offerassignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `code` varchar(128) NOT NULL,
  `user_email` varchar(254) NOT NULL,
  `status` varchar(255) NOT NULL,
  `offer_id` int(11) NOT NULL,
  `voucher_application_id` int(11) DEFAULT NULL,
  `assignment_date` datetime(6) DEFAULT NULL,
  `last_reminder_date` datetime(6) DEFAULT NULL,
  `revocation_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `offer_offerassignmen_offer_id_db7eea58_fk_offer_con` (`offer_id`),
  KEY `offer_offerassignmen_voucher_application__85ebbc90_fk_voucher_v` (`voucher_application_id`),
  KEY `offer_offerassignment_code_d02da8b5` (`code`),
  KEY `offer_offerassignment_status_578284ab` (`status`),
  KEY `offer_offerassignment_user_email_475febf2` (`user_email`),
  KEY `offer_offer_code_70b216_idx` (`code`,`user_email`),
  KEY `offer_offer_code_4aa171_idx` (`code`,`status`),
  CONSTRAINT `offer_offerassignmen_offer_id_db7eea58_fk_offer_con` FOREIGN KEY (`offer_id`) REFERENCES `offer_conditionaloffer` (`id`),
  CONSTRAINT `offer_offerassignmen_voucher_application__85ebbc90_fk_voucher_v` FOREIGN KEY (`voucher_application_id`) REFERENCES `voucher_voucherapplication` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_offerassignment`
--

LOCK TABLES `offer_offerassignment` WRITE;
/*!40000 ALTER TABLE `offer_offerassignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_offerassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_offerassignmentemailattempt`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_offerassignmentemailattempt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_id` varchar(255) NOT NULL,
  `offer_assignment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `send_id` (`send_id`),
  KEY `offer_offerassignmen_offer_assignment_id_64f0cff1_fk_offer_off` (`offer_assignment_id`),
  CONSTRAINT `offer_offerassignmen_offer_assignment_id_64f0cff1_fk_offer_off` FOREIGN KEY (`offer_assignment_id`) REFERENCES `offer_offerassignment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_offerassignmentemailattempt`
--

LOCK TABLES `offer_offerassignmentemailattempt` WRITE;
/*!40000 ALTER TABLE `offer_offerassignmentemailattempt` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_offerassignmentemailattempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_offerassignmentemailsentrecord`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_offerassignmentemailsentrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `enterprise_customer` char(32) NOT NULL,
  `email_type` varchar(32) NOT NULL,
  `template_id` int(10) unsigned DEFAULT NULL,
  `template_content_type_id` int(11) DEFAULT NULL,
  `code` varchar(128) DEFAULT NULL,
  `receiver_id` int(10) unsigned DEFAULT NULL,
  `sender_category` varchar(32) DEFAULT NULL,
  `sender_id` int(10) unsigned DEFAULT NULL,
  `user_email` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `offer_offerassignmen_template_content_typ_44b5ef4a_fk_django_co` (`template_content_type_id`),
  CONSTRAINT `offer_offerassignmen_template_content_typ_44b5ef4a_fk_django_co` FOREIGN KEY (`template_content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_offerassignmentemailsentrecord`
--

LOCK TABLES `offer_offerassignmentemailsentrecord` WRITE;
/*!40000 ALTER TABLE `offer_offerassignmentemailsentrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_offerassignmentemailsentrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_offerassignmentemailtemplates`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_offerassignmentemailtemplates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `enterprise_customer` char(32) NOT NULL,
  `email_type` varchar(32) NOT NULL,
  `email_greeting` longtext,
  `email_closing` longtext,
  `active` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email_subject` longtext,
  PRIMARY KEY (`id`),
  KEY `offer_offer_enterpr_a9dd7f_idx` (`enterprise_customer`,`email_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_offerassignmentemailtemplates`
--

LOCK TABLES `offer_offerassignmentemailtemplates` WRITE;
/*!40000 ALTER TABLE `offer_offerassignmentemailtemplates` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_offerassignmentemailtemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_offerusageemail`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_offerusageemail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `offer_email_metadata` longtext NOT NULL,
  `offer_id` int(11) NOT NULL,
  `email_type` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `offer_offerusageemai_offer_id_f3c4d8e7_fk_offer_con` (`offer_id`),
  CONSTRAINT `offer_offerusageemai_offer_id_f3c4d8e7_fk_offer_con` FOREIGN KEY (`offer_id`) REFERENCES `offer_conditionaloffer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_offerusageemail`
--

LOCK TABLES `offer_offerusageemail` WRITE;
/*!40000 ALTER TABLE `offer_offerusageemail` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_offerusageemail` ENABLE KEYS */;
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
  `enterprise_customer_catalog` char(32) DEFAULT NULL,
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
  UNIQUE KEY `offer_range_classes_range_id_productclass_id_28eeefae_uniq` (`range_id`,`productclass_id`),
  KEY `offer_range_classes_productclass_id_6f6de46d_fk_catalogue` (`productclass_id`),
  CONSTRAINT `offer_range_classes_productclass_id_6f6de46d_fk_catalogue` FOREIGN KEY (`productclass_id`) REFERENCES `catalogue_productclass` (`id`),
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
  UNIQUE KEY `offer_range_excluded_products_range_id_product_id_eb1cfe87_uniq` (`range_id`,`product_id`),
  KEY `offer_range_excluded_product_id_78c49bfc_fk_catalogue` (`product_id`),
  CONSTRAINT `offer_range_excluded_product_id_78c49bfc_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `offer_range_excluded_range_id_cce4a032_fk_offer_ran` FOREIGN KEY (`range_id`) REFERENCES `offer_range` (`id`)
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
  UNIQUE KEY `offer_range_included_cat_range_id_category_id_a661d336_uniq` (`range_id`,`category_id`),
  KEY `offer_range_included_category_id_c61569a5_fk_catalogue` (`category_id`),
  CONSTRAINT `offer_range_included_category_id_c61569a5_fk_catalogue` FOREIGN KEY (`category_id`) REFERENCES `catalogue_category` (`id`),
  CONSTRAINT `offer_range_included_range_id_1b616138_fk_offer_ran` FOREIGN KEY (`range_id`) REFERENCES `offer_range` (`id`)
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
  UNIQUE KEY `offer_rangeproduct_range_id_product_id_c46b1be8_uniq` (`range_id`,`product_id`),
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
  KEY `offer_rangeproductfi_uploaded_by_id_c01a3250_fk_ecommerce` (`uploaded_by_id`),
  KEY `offer_rangeproductfileupload_date_uploaded_f0a4f9ae` (`date_uploaded`),
  CONSTRAINT `offer_rangeproductfi_uploaded_by_id_c01a3250_fk_ecommerce` FOREIGN KEY (`uploaded_by_id`) REFERENCES `ecommerce_user` (`id`),
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
-- Table structure for table `offer_templatefileattachment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_templatefileattachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `size` int(10) unsigned NOT NULL,
  `url` varchar(300) NOT NULL,
  `template_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `offer_templatefileat_template_id_85f1bc1a_fk_offer_off` (`template_id`),
  CONSTRAINT `offer_templatefileat_template_id_85f1bc1a_fk_offer_off` FOREIGN KEY (`template_id`) REFERENCES `offer_offerassignmentemailtemplates` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_templatefileattachment`
--

LOCK TABLES `offer_templatefileattachment` WRITE;
/*!40000 ALTER TABLE `offer_templatefileattachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_templatefileattachment` ENABLE KEYS */;
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
  KEY `order_billingaddress_country_id_17f57dca_fk_address_c` (`country_id`),
  CONSTRAINT `order_billingaddress_country_id_17f57dca_fk_address_c` FOREIGN KEY (`country_id`) REFERENCES `address_country` (`iso_3166_1_a2`)
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
  KEY `order_communicationevent_order_id_94e784ac_fk_order_order_id` (`order_id`),
  KEY `order_communicationevent_date_created_ce404d62` (`date_created`),
  KEY `order_communicatione_event_type_id_4bc9ee29_fk_communica` (`event_type_id`),
  CONSTRAINT `order_communicatione_event_type_id_4bc9ee29_fk_communica` FOREIGN KEY (`event_type_id`) REFERENCES `communication_communicationeventtype` (`id`),
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
-- Table structure for table `order_historicalline`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_historicalline` (
  `id` int(11) NOT NULL,
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
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `partner_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `stockrecord_id` int(11) DEFAULT NULL,
  `effective_contract_discount_percentage` decimal(8,5) DEFAULT NULL,
  `effective_contract_discounted_price` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `order_historicalline_history_user_id_0dc6d8a8_fk_ecommerce` (`history_user_id`),
  KEY `order_historicalline_id_394a6e5b` (`id`),
  KEY `order_historicalline_order_id_1721c6a7` (`order_id`),
  KEY `order_historicalline_partner_id_9fbeb68e` (`partner_id`),
  KEY `order_historicalline_product_id_647be269` (`product_id`),
  KEY `order_historicalline_stockrecord_id_d80d3743` (`stockrecord_id`),
  CONSTRAINT `order_historicalline_history_user_id_0dc6d8a8_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_historicalline`
--

LOCK TABLES `order_historicalline` WRITE;
/*!40000 ALTER TABLE `order_historicalline` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_historicalline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_historicalorder`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_historicalorder` (
  `id` int(11) NOT NULL,
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
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `basket_id` int(11) DEFAULT NULL,
  `billing_address_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `partner_id` int(11) DEFAULT NULL,
  `shipping_address_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `order_historicalorde_history_user_id_107abb44_fk_ecommerce` (`history_user_id`),
  KEY `order_historicalorder_id_0c852165` (`id`),
  KEY `order_historicalorder_number_7d043fad` (`number`),
  KEY `order_historicalorder_date_placed_90b7b1d1` (`date_placed`),
  KEY `order_historicalorder_basket_id_dc4a6cab` (`basket_id`),
  KEY `order_historicalorder_billing_address_id_d7a6aea1` (`billing_address_id`),
  KEY `order_historicalorder_partner_id_cbdd0edb` (`partner_id`),
  KEY `order_historicalorder_shipping_address_id_9820772f` (`shipping_address_id`),
  KEY `order_historicalorder_site_id_b4bf684e` (`site_id`),
  KEY `order_historicalorder_user_id_731dcf92` (`user_id`),
  CONSTRAINT `order_historicalorde_history_user_id_107abb44_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_historicalorder`
--

LOCK TABLES `order_historicalorder` WRITE;
/*!40000 ALTER TABLE `order_historicalorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_historicalorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_historicalorderdiscount`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_historicalorderdiscount` (
  `id` int(11) NOT NULL,
  `category` varchar(64) NOT NULL,
  `offer_id` int(10) unsigned DEFAULT NULL,
  `offer_name` varchar(128) NOT NULL,
  `voucher_id` int(10) unsigned DEFAULT NULL,
  `voucher_code` varchar(128) NOT NULL,
  `frequency` int(10) unsigned DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL,
  `message` longtext NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `order_historicalorde_history_user_id_a6bb38a1_fk_ecommerce` (`history_user_id`),
  KEY `order_historicalorderdiscount_id_e9cee7a5` (`id`),
  KEY `order_historicalorderdiscount_offer_name_8a2ab309` (`offer_name`),
  KEY `order_historicalorderdiscount_voucher_code_88be3366` (`voucher_code`),
  KEY `order_historicalorderdiscount_order_id_c77bc9d4` (`order_id`),
  CONSTRAINT `order_historicalorde_history_user_id_a6bb38a1_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_historicalorderdiscount`
--

LOCK TABLES `order_historicalorderdiscount` WRITE;
/*!40000 ALTER TABLE `order_historicalorderdiscount` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_historicalorderdiscount` ENABLE KEYS */;
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
  `effective_contract_discount_percentage` decimal(8,5) DEFAULT NULL,
  `effective_contract_discounted_price` decimal(12,2) DEFAULT NULL,
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
  KEY `order_lineprice_order_id_66792e56_fk_order_order_id` (`order_id`),
  KEY `order_lineprice_line_id_2de52446_fk_order_line_id` (`line_id`),
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
-- Table structure for table `order_markordersstatuscompleteconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_markordersstatuscompleteconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `change_date` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `txt_file` varchar(100) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_markordersstat_changed_by_id_84d0d0ba_fk_ecommerce` (`changed_by_id`),
  CONSTRAINT `order_markordersstat_changed_by_id_84d0d0ba_fk_ecommerce` FOREIGN KEY (`changed_by_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_markordersstatuscompleteconfig`
--

LOCK TABLES `order_markordersstatuscompleteconfig` WRITE;
/*!40000 ALTER TABLE `order_markordersstatuscompleteconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_markordersstatuscompleteconfig` ENABLE KEYS */;
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
  `partner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`),
  KEY `order_order_shipping_address_id_57e64931_fk_order_shi` (`shipping_address_id`),
  KEY `order_order_site_id_e27f3526_fk_django_site_id` (`site_id`),
  KEY `order_order_user_id_7cf9bc2b_fk_ecommerce_user_id` (`user_id`),
  KEY `order_order_basket_id_8b0acbb2_fk_basket_basket_id` (`basket_id`),
  KEY `order_order_billing_address_id_8fe537cf_fk_order_bil` (`billing_address_id`),
  KEY `order_order_date_placed_506a9365` (`date_placed`),
  KEY `order_order_partner_id_0195eb6a_fk_partner_partner_id` (`partner_id`),
  CONSTRAINT `order_order_basket_id_8b0acbb2_fk_basket_basket_id` FOREIGN KEY (`basket_id`) REFERENCES `basket_basket` (`id`),
  CONSTRAINT `order_order_billing_address_id_8fe537cf_fk_order_bil` FOREIGN KEY (`billing_address_id`) REFERENCES `order_billingaddress` (`id`),
  CONSTRAINT `order_order_partner_id_0195eb6a_fk_partner_partner_id` FOREIGN KEY (`partner_id`) REFERENCES `partner_partner` (`id`),
  CONSTRAINT `order_order_shipping_address_id_57e64931_fk_order_shi` FOREIGN KEY (`shipping_address_id`) REFERENCES `order_shippingaddress` (`id`),
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
  KEY `order_orderdiscount_offer_name_706d6119` (`offer_name`),
  KEY `order_orderdiscount_voucher_code_6ee4f360` (`voucher_code`),
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
-- Table structure for table `order_orderstatuschange`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_orderstatuschange` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_status` varchar(100) NOT NULL,
  `new_status` varchar(100) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_orderstatuschange_order_id_43efdbe5_fk_order_order_id` (`order_id`),
  KEY `order_orderstatuschange_date_created_a5107b93` (`date_created`),
  CONSTRAINT `order_orderstatuschange_order_id_43efdbe5_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_orderstatuschange`
--

LOCK TABLES `order_orderstatuschange` WRITE;
/*!40000 ALTER TABLE `order_orderstatuschange` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_orderstatuschange` ENABLE KEYS */;
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
  KEY `order_paymentevent_event_type_id_568c7161_fk_order_pay` (`event_type_id`),
  KEY `order_paymentevent_order_id_395b3e82_fk_order_order_id` (`order_id`),
  KEY `order_paymentevent_shipping_event_id_213dcfb8_fk_order_shi` (`shipping_event_id`),
  KEY `order_paymentevent_date_created_05d8c079` (`date_created`),
  CONSTRAINT `order_paymentevent_event_type_id_568c7161_fk_order_pay` FOREIGN KEY (`event_type_id`) REFERENCES `order_paymenteventtype` (`id`),
  CONSTRAINT `order_paymentevent_order_id_395b3e82_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  CONSTRAINT `order_paymentevent_shipping_event_id_213dcfb8_fk_order_shi` FOREIGN KEY (`shipping_event_id`) REFERENCES `order_shippingevent` (`id`)
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
  UNIQUE KEY `order_paymenteventquantity_event_id_line_id_765c5209_uniq` (`event_id`,`line_id`),
  KEY `order_paymenteventquantity_line_id_df44b021_fk_order_line_id` (`line_id`),
  CONSTRAINT `order_paymenteventqu_event_id_a540165a_fk_order_pay` FOREIGN KEY (`event_id`) REFERENCES `order_paymentevent` (`id`),
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
  KEY `order_shippingaddres_country_id_29abf9a0_fk_address_c` (`country_id`),
  CONSTRAINT `order_shippingaddres_country_id_29abf9a0_fk_address_c` FOREIGN KEY (`country_id`) REFERENCES `address_country` (`iso_3166_1_a2`)
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
  KEY `order_shippingevent_event_type_id_9f1efb20_fk_order_shi` (`event_type_id`),
  KEY `order_shippingevent_order_id_8c031fb6_fk_order_order_id` (`order_id`),
  KEY `order_shippingevent_date_created_74c4a6fa` (`date_created`),
  CONSTRAINT `order_shippingevent_event_type_id_9f1efb20_fk_order_shi` FOREIGN KEY (`event_type_id`) REFERENCES `order_shippingeventtype` (`id`),
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
  UNIQUE KEY `order_shippingeventquantity_event_id_line_id_91687107_uniq` (`event_id`,`line_id`),
  KEY `order_shippingeventquantity_line_id_3b089ee0_fk_order_line_id` (`line_id`),
  CONSTRAINT `order_shippingeventq_event_id_1c7fb9c7_fk_order_shi` FOREIGN KEY (`event_id`) REFERENCES `order_shippingevent` (`id`),
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
-- Table structure for table `order_surcharge`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_surcharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(128) NOT NULL,
  `incl_tax` decimal(12,2) NOT NULL,
  `excl_tax` decimal(12,2) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_surcharge_order_id_5c0a94f5_fk_order_order_id` (`order_id`),
  CONSTRAINT `order_surcharge_order_id_5c0a94f5_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_surcharge`
--

LOCK TABLES `order_surcharge` WRITE;
/*!40000 ALTER TABLE `order_surcharge` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_surcharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_historicalpartner`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_historicalpartner` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `short_code` varchar(8) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `default_site_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `partner_historicalpa_history_user_id_971ab75b_fk_ecommerce` (`history_user_id`),
  KEY `partner_historicalpartner_id_4955c403` (`id`),
  KEY `partner_historicalpartner_short_code_d8d60225` (`short_code`),
  KEY `partner_historicalpartner_default_site_id_8f53b529` (`default_site_id`),
  KEY `partner_historicalpartner_name_63933fe9` (`name`),
  CONSTRAINT `partner_historicalpa_history_user_id_971ab75b_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_historicalpartner`
--

LOCK TABLES `partner_historicalpartner` WRITE;
/*!40000 ALTER TABLE `partner_historicalpartner` DISABLE KEYS */;
INSERT INTO `partner_historicalpartner` VALUES (1,'','',1,'2022-12-16 20:49:55.862526',NULL,'+',NULL,NULL),(1,'Open edX','edX',2,'2022-12-16 20:49:55.867884',NULL,'~',1,NULL);
/*!40000 ALTER TABLE `partner_historicalpartner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_historicalstockrecord`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_historicalstockrecord` (
  `id` int(11) NOT NULL,
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
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `partner_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `partner_historicalst_history_user_id_eda90769_fk_ecommerce` (`history_user_id`),
  KEY `partner_historicalstockrecord_id_e529b9d7` (`id`),
  KEY `partner_historicalstockrecord_date_updated_d81f5712` (`date_updated`),
  KEY `partner_historicalstockrecord_partner_id_5369caa8` (`partner_id`),
  KEY `partner_historicalstockrecord_product_id_e2905583` (`product_id`),
  CONSTRAINT `partner_historicalst_history_user_id_eda90769_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_historicalstockrecord`
--

LOCK TABLES `partner_historicalstockrecord` WRITE;
/*!40000 ALTER TABLE `partner_historicalstockrecord` DISABLE KEYS */;
INSERT INTO `partner_historicalstockrecord` VALUES (1,'68EFFFF','USD',0.00,NULL,NULL,NULL,NULL,NULL,'2022-12-16 20:50:05.983035','2022-12-16 20:50:05.983090',1,'2022-12-16 20:50:05.984119',NULL,'+',NULL,1,2),(2,'A5B6DBE','USD',149.00,NULL,NULL,NULL,NULL,NULL,'2022-12-16 20:50:06.075203','2022-12-16 20:50:06.075244',2,'2022-12-16 20:50:06.076797',NULL,'+',NULL,1,4),(3,'8CF08E5','USD',149.00,NULL,NULL,NULL,NULL,NULL,'2022-12-16 20:50:06.128736','2022-12-16 20:50:06.128782',3,'2022-12-16 20:50:06.129790',NULL,'+',NULL,1,3);
/*!40000 ALTER TABLE `partner_historicalstockrecord` ENABLE KEYS */;
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
  `default_site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `short_code` (`short_code`),
  UNIQUE KEY `default_site_id` (`default_site_id`),
  KEY `partner_partner_name_caa0c2ee` (`name`),
  CONSTRAINT `partner_partner_default_site_id_c5e08da3_fk_django_site_id` FOREIGN KEY (`default_site_id`) REFERENCES `django_site` (`id`)
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
  UNIQUE KEY `partner_partner_users_partner_id_user_id_9e5c0517_uniq` (`partner_id`,`user_id`),
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
  KEY `partner_partneraddre_country_id_02c4f979_fk_address_c` (`country_id`),
  KEY `partner_partneraddress_partner_id_59551b0a_fk_partner_partner_id` (`partner_id`),
  CONSTRAINT `partner_partneraddre_country_id_02c4f979_fk_address_c` FOREIGN KEY (`country_id`) REFERENCES `address_country` (`iso_3166_1_a2`),
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
  KEY `partner_stockalert_stockrecord_id_68ad503a_fk_partner_s` (`stockrecord_id`),
  KEY `partner_stockalert_date_created_832cf043` (`date_created`),
  CONSTRAINT `partner_stockalert_stockrecord_id_68ad503a_fk_partner_s` FOREIGN KEY (`stockrecord_id`) REFERENCES `partner_stockrecord` (`id`)
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
  UNIQUE KEY `partner_stockrecord_partner_id_partner_sku_8441e010_uniq` (`partner_id`,`partner_sku`),
  KEY `partner_stockrecord_product_id_62fd9e45_fk_catalogue_product_id` (`product_id`),
  KEY `partner_stockrecord_date_updated_e6ae5f14` (`date_updated`),
  CONSTRAINT `partner_stockrecord_partner_id_4155a586_fk_partner_partner_id` FOREIGN KEY (`partner_id`) REFERENCES `partner_partner` (`id`),
  CONSTRAINT `partner_stockrecord_product_id_62fd9e45_fk_catalogue_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_stockrecord`
--

LOCK TABLES `partner_stockrecord` WRITE;
/*!40000 ALTER TABLE `partner_stockrecord` DISABLE KEYS */;
INSERT INTO `partner_stockrecord` VALUES (1,'68EFFFF','USD',0.00,NULL,NULL,NULL,NULL,NULL,'2022-12-16 20:50:05.983035','2022-12-16 20:50:05.983090',1,2),(2,'A5B6DBE','USD',149.00,NULL,NULL,NULL,NULL,NULL,'2022-12-16 20:50:06.075203','2022-12-16 20:50:06.075244',1,4),(3,'8CF08E5','USD',149.00,NULL,NULL,NULL,NULL,NULL,'2022-12-16 20:50:06.128736','2022-12-16 20:50:06.128782',1,3);
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
-- Table structure for table `payment_enterprisecontractmetadata`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_enterprisecontractmetadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `amount_paid` decimal(12,2) DEFAULT NULL,
  `discount_value` decimal(15,5) DEFAULT NULL,
  `discount_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_enterprisecontractmetadata`
--

LOCK TABLES `payment_enterprisecontractmetadata` WRITE;
/*!40000 ALTER TABLE `payment_enterprisecontractmetadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_enterprisecontractmetadata` ENABLE KEYS */;
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
  KEY `payment_paymentprocessorr_processor_name_transactio_c62034f3_idx` (`processor_name`,`transaction_id`),
  KEY `payment_paymentproce_basket_id_ff3d36a2_fk_basket_ba` (`basket_id`),
  KEY `payment_paymentprocessorresponse_created_412fdf33` (`created`),
  CONSTRAINT `payment_paymentproce_basket_id_ff3d36a2_fk_basket_ba` FOREIGN KEY (`basket_id`) REFERENCES `basket_basket` (`id`)
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
  UNIQUE KEY `payment_sdncheckfailure__sdncheckfailure_id_produ_5e39885c_uniq` (`sdncheckfailure_id`,`product_id`),
  KEY `payment_sdncheckfail_product_id_6d431270_fk_catalogue` (`product_id`),
  CONSTRAINT `payment_sdncheckfail_product_id_6d431270_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `payment_sdncheckfail_sdncheckfailure_id_a8c1f0d4_fk_payment_s` FOREIGN KEY (`sdncheckfailure_id`) REFERENCES `payment_sdncheckfailure` (`id`)
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
-- Table structure for table `payment_sdnfallbackdata`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_sdnfallbackdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` varchar(255) NOT NULL,
  `sdn_type` varchar(255) NOT NULL,
  `names` longtext NOT NULL,
  `addresses` longtext NOT NULL,
  `countries` varchar(255) NOT NULL,
  `sdn_fallback_metadata_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_sdnfallbackd_sdn_fallback_metadat_ce5c42ba_fk_payment_s` (`sdn_fallback_metadata_id`),
  KEY `payment_sdnfallbackdata_source_fabd7697` (`source`),
  KEY `payment_sdnfallbackdata_sdn_type_09e8362b` (`sdn_type`),
  CONSTRAINT `payment_sdnfallbackd_sdn_fallback_metadat_ce5c42ba_fk_payment_s` FOREIGN KEY (`sdn_fallback_metadata_id`) REFERENCES `payment_sdnfallbackmetadata` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_sdnfallbackdata`
--

LOCK TABLES `payment_sdnfallbackdata` WRITE;
/*!40000 ALTER TABLE `payment_sdnfallbackdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_sdnfallbackdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_sdnfallbackmetadata`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_sdnfallbackmetadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `file_checksum` varchar(255) NOT NULL,
  `download_timestamp` datetime(6) NOT NULL,
  `import_timestamp` datetime(6) DEFAULT NULL,
  `import_state` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `import_state` (`import_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_sdnfallbackmetadata`
--

LOCK TABLES `payment_sdnfallbackmetadata` WRITE;
/*!40000 ALTER TABLE `payment_sdnfallbackmetadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_sdnfallbackmetadata` ENABLE KEYS */;
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
  KEY `payment_source_source_type_id_700828fe_fk_payment_sourcetype_id` (`source_type_id`),
  KEY `payment_source_order_id_6b7f2215_fk_order_order_id` (`order_id`),
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
  KEY `payment_transaction_date_created_f887f6bc` (`date_created`),
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
-- Table structure for table `refund_historicalrefund`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refund_historicalrefund` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `total_credit_excl_tax` decimal(12,2) NOT NULL,
  `currency` varchar(12) NOT NULL,
  `status` varchar(255) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `refund_historicalref_history_user_id_c1853b09_fk_ecommerce` (`history_user_id`),
  KEY `refund_historicalrefund_id_6b2753a1` (`id`),
  KEY `refund_historicalrefund_order_id_1d9b0b20` (`order_id`),
  KEY `refund_historicalrefund_user_id_142a3c52` (`user_id`),
  CONSTRAINT `refund_historicalref_history_user_id_c1853b09_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund_historicalrefund`
--

LOCK TABLES `refund_historicalrefund` WRITE;
/*!40000 ALTER TABLE `refund_historicalrefund` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund_historicalrefund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund_historicalrefundline`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refund_historicalrefundline` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `line_credit_excl_tax` decimal(12,2) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `status` varchar(255) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `order_line_id` int(11) DEFAULT NULL,
  `refund_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `refund_historicalref_history_user_id_1b172964_fk_ecommerce` (`history_user_id`),
  KEY `refund_historicalrefundline_id_b5dd937d` (`id`),
  KEY `refund_historicalrefundline_order_line_id_59524c13` (`order_line_id`),
  KEY `refund_historicalrefundline_refund_id_487db801` (`refund_id`),
  CONSTRAINT `refund_historicalref_history_user_id_1b172964_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund_historicalrefundline`
--

LOCK TABLES `refund_historicalrefundline` WRITE;
/*!40000 ALTER TABLE `refund_historicalrefundline` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund_historicalrefundline` ENABLE KEYS */;
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
  UNIQUE KEY `reviews_productreview_product_id_user_id_c4fdc4cd_uniq` (`product_id`,`user_id`),
  KEY `reviews_productreview_user_id_8acb5ddd_fk_ecommerce_user_id` (`user_id`),
  KEY `reviews_productreview_delta_votes_bd8ffc87` (`delta_votes`),
  CONSTRAINT `reviews_productrevie_product_id_52e52a32_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
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
  UNIQUE KEY `reviews_vote_user_id_review_id_bb858939_uniq` (`user_id`,`review_id`),
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
  UNIQUE KEY `shipping_orderanditemcha_orderanditemcharges_id_c_9f0c9c8f_uniq` (`orderanditemcharges_id`,`country_id`),
  KEY `shipping_orderandite_country_id_30387f2e_fk_address_c` (`country_id`),
  CONSTRAINT `shipping_orderandite_country_id_30387f2e_fk_address_c` FOREIGN KEY (`country_id`) REFERENCES `address_country` (`iso_3166_1_a2`),
  CONSTRAINT `shipping_orderandite_orderanditemcharges__bf5bfee9_fk_shipping_` FOREIGN KEY (`orderanditemcharges_id`) REFERENCES `shipping_orderanditemcharges` (`id`)
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
  KEY `shipping_weightband_method_id_b699a1ba_fk_shipping_` (`method_id`),
  KEY `shipping_weightband_upper_limit_9edc5097` (`upper_limit`),
  CONSTRAINT `shipping_weightband_method_id_b699a1ba_fk_shipping_` FOREIGN KEY (`method_id`) REFERENCES `shipping_weightbased` (`id`)
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
  UNIQUE KEY `shipping_weightbased_cou_weightbased_id_country_i_de8c5e42_uniq` (`weightbased_id`,`country_id`),
  KEY `shipping_weightbased_country_id_06117384_fk_address_c` (`country_id`),
  CONSTRAINT `shipping_weightbased_country_id_06117384_fk_address_c` FOREIGN KEY (`country_id`) REFERENCES `address_country` (`iso_3166_1_a2`),
  CONSTRAINT `shipping_weightbased_weightbased_id_93e3132f_fk_shipping_` FOREIGN KEY (`weightbased_id`) REFERENCES `shipping_weightbased` (`id`)
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
  KEY `social_auth_usersocialauth_user_id_17d28448_fk_ecommerce_user_id` (`user_id`),
  KEY `social_auth_usersocialauth_uid_796e51dc` (`uid`),
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
  KEY `voucher_couponvouche_coupon_id_44356128_fk_catalogue` (`coupon_id`),
  CONSTRAINT `voucher_couponvouche_coupon_id_44356128_fk_catalogue` FOREIGN KEY (`coupon_id`) REFERENCES `catalogue_product` (`id`)
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
  UNIQUE KEY `voucher_couponvouchers_v_couponvouchers_id_vouche_390b5a38_uniq` (`couponvouchers_id`,`voucher_id`),
  KEY `voucher_couponvouche_voucher_id_d5507ed9_fk_voucher_v` (`voucher_id`),
  CONSTRAINT `voucher_couponvouche_couponvouchers_id_ebe4c993_fk_voucher_c` FOREIGN KEY (`couponvouchers_id`) REFERENCES `voucher_couponvouchers` (`id`),
  CONSTRAINT `voucher_couponvouche_voucher_id_d5507ed9_fk_voucher_v` FOREIGN KEY (`voucher_id`) REFERENCES `voucher_voucher` (`id`)
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
-- Table structure for table `voucher_historicalvoucherapplication`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_historicalvoucherapplication` (
  `id` int(11) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `voucher_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `voucher_historicalvo_history_user_id_add45a08_fk_ecommerce` (`history_user_id`),
  KEY `voucher_historicalvoucherapplication_id_f6cc2df0` (`id`),
  KEY `voucher_historicalvoucherapplication_order_id_c8a880a6` (`order_id`),
  KEY `voucher_historicalvoucherapplication_user_id_0dc6e29e` (`user_id`),
  KEY `voucher_historicalvoucherapplication_voucher_id_529f437b` (`voucher_id`),
  CONSTRAINT `voucher_historicalvo_history_user_id_add45a08_fk_ecommerce` FOREIGN KEY (`history_user_id`) REFERENCES `ecommerce_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher_historicalvoucherapplication`
--

LOCK TABLES `voucher_historicalvoucherapplication` WRITE;
/*!40000 ALTER TABLE `voucher_historicalvoucherapplication` DISABLE KEYS */;
/*!40000 ALTER TABLE `voucher_historicalvoucherapplication` ENABLE KEYS */;
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
  UNIQUE KEY `voucher_orderlinevoucher_orderlinevouchers_id_vou_2a30647d_uniq` (`orderlinevouchers_id`,`voucher_id`),
  KEY `voucher_orderlinevou_voucher_id_b8820f35_fk_voucher_v` (`voucher_id`),
  CONSTRAINT `voucher_orderlinevou_orderlinevouchers_id_c916ee3a_fk_voucher_o` FOREIGN KEY (`orderlinevouchers_id`) REFERENCES `voucher_orderlinevouchers` (`id`),
  CONSTRAINT `voucher_orderlinevou_voucher_id_b8820f35_fk_voucher_v` FOREIGN KEY (`voucher_id`) REFERENCES `voucher_voucher` (`id`)
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
  `date_created` datetime(6) NOT NULL,
  `voucher_set_id` int(11) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `voucher_voucher_voucher_set_id_17b96a54_fk_voucher_voucherset_id` (`voucher_set_id`),
  KEY `voucher_voucher_end_datetime_db182297` (`end_datetime`),
  KEY `voucher_voucher_start_datetime_bfb7df84` (`start_datetime`),
  CONSTRAINT `voucher_voucher_voucher_set_id_17b96a54_fk_voucher_voucherset_id` FOREIGN KEY (`voucher_set_id`) REFERENCES `voucher_voucherset` (`id`)
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
  UNIQUE KEY `voucher_voucher_offers_voucher_id_conditionalof_01628a7f_uniq` (`voucher_id`,`conditionaloffer_id`),
  KEY `voucher_voucher_offe_conditionaloffer_id_f9682bfb_fk_offer_con` (`conditionaloffer_id`),
  CONSTRAINT `voucher_voucher_offe_conditionaloffer_id_f9682bfb_fk_offer_con` FOREIGN KEY (`conditionaloffer_id`) REFERENCES `offer_conditionaloffer` (`id`),
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
  `date_created` datetime(6) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `voucher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `voucher_voucherapplication_order_id_30248a05_fk_order_order_id` (`order_id`),
  KEY `voucher_voucherapplication_user_id_df53a393_fk_ecommerce_user_id` (`user_id`),
  KEY `voucher_voucherappli_voucher_id_5204edb7_fk_voucher_v` (`voucher_id`),
  CONSTRAINT `voucher_voucherappli_voucher_id_5204edb7_fk_voucher_v` FOREIGN KEY (`voucher_id`) REFERENCES `voucher_voucher` (`id`),
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
-- Table structure for table `voucher_voucherset`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_voucherset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `count` int(10) unsigned NOT NULL,
  `code_length` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `start_datetime` datetime(6) NOT NULL,
  `end_datetime` datetime(6) NOT NULL,
  `offer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offer_id` (`offer_id`),
  CONSTRAINT `voucher_voucherset_offer_id_1d10d5d6_fk_offer_con` FOREIGN KEY (`offer_id`) REFERENCES `offer_conditionaloffer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher_voucherset`
--

LOCK TABLES `voucher_voucherset` WRITE;
/*!40000 ALTER TABLE `voucher_voucherset` DISABLE KEYS */;
/*!40000 ALTER TABLE `voucher_voucherset` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_flag`
--

LOCK TABLES `waffle_flag` WRITE;
/*!40000 ALTER TABLE `waffle_flag` DISABLE KEYS */;
INSERT INTO `waffle_flag` VALUES (2,'enable_client_side_checkout',1,NULL,0,1,0,0,'',0,'This flag determines if the integrated/client-side checkout flow should be enabled.','2022-12-16 20:47:19.026574','2022-12-16 20:50:05.912878'),(3,'disable_microfrontend_for_basket_page',NULL,NULL,0,0,0,0,'',0,'','2022-12-16 20:47:19.947617','2022-12-16 20:47:19.947626');
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
  KEY `waffle_sample_created_76198bd5` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_sample`
--

LOCK TABLES `waffle_sample` WRITE;
/*!40000 ALTER TABLE `waffle_sample` DISABLE KEYS */;
INSERT INTO `waffle_sample` VALUES (1,'async_order_fulfillment',0.0,'Determines what percentage of orders are fulfilled asynchronously.','2022-12-16 20:46:58.728799','2022-12-16 20:46:58.728809');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_switch`
--

LOCK TABLES `waffle_switch` WRITE;
/*!40000 ALTER TABLE `waffle_switch` DISABLE KEYS */;
INSERT INTO `waffle_switch` VALUES (1,'publish_course_modes_to_lms',1,'','2022-12-16 20:46:58.144828','2022-12-16 20:46:58.144838'),(4,'enable_user_list_view',1,'','2022-12-16 20:47:00.288185','2022-12-16 20:47:00.288195'),(5,'enable_braze',0,'','2022-12-16 20:47:02.732084','2022-12-16 20:47:02.732094'),(6,'enable_order_list_view',1,'','2022-12-16 20:47:04.842087','2022-12-16 20:47:04.842100'),(7,'disable_repeat_order_check',0,'','2022-12-16 20:47:04.925084','2022-12-16 20:47:04.925095'),(9,'enable_enterprise_on_runtime',0,'','2022-12-16 20:47:13.150848','2022-12-16 20:47:13.150858'),(12,'hubspot_forms_integration_enable',0,'','2022-12-16 20:47:14.351700','2022-12-16 20:47:14.351709'),(13,'payment_processor_active_cybersource',1,'','2022-12-16 20:47:18.726193','2022-12-16 20:47:18.726206'),(14,'payment_processor_active_paypal',1,'','2022-12-16 20:47:18.727397','2022-12-16 20:47:18.727403'),(15,'payment_processor_active_stripe',1,'','2022-12-16 20:47:19.769566','2022-12-16 20:47:19.769578'),(16,'enable_refund_list_view',1,'','2022-12-16 20:47:29.512200','2022-12-16 20:47:29.512210'),(17,'sailthru_enable',0,'','2022-12-16 20:47:31.668719','2022-12-16 20:47:31.668730');
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
  UNIQUE KEY `wishlists_line_wishlist_id_product_id_78f04673_uniq` (`wishlist_id`,`product_id`),
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
  KEY `wishlists_wishlist_date_created_c05d5e7f` (`date_created`),
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

-- Dump completed on 2022-12-16 20:50:09
