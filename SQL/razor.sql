-- --------------------------------------------------------
-- Host:                         54.197.247.82
-- Server version:               5.6.22-log - MySQL Community Server (GPL)
-- Server OS:                    Linux
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for razor
CREATE DATABASE IF NOT EXISTS `razor` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `razor`;


-- Dumping structure for table razor.account
CREATE TABLE IF NOT EXISTS `account` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) DEFAULT NULL,
  `State` varchar(30) DEFAULT NULL,
  `Subledger` varchar(30) DEFAULT NULL,
  `Type` varchar(30) DEFAULT NULL,
  `Notes` varchar(1000) DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `Name` (`Name`),
  KEY `ParentID` (`Subledger`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.adjustment
CREATE TABLE IF NOT EXISTS `adjustment` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ProductID` int(11) unsigned DEFAULT NULL,
  `PartyID` int(11) unsigned DEFAULT NULL,
  `State` tinyint(4) DEFAULT '1',
  `FromDate` date DEFAULT NULL,
  `ToDate` date DEFAULT NULL,
  `Extra` double DEFAULT '0',
  `FixPrice` double DEFAULT '0',
  `Currency` varchar(3) DEFAULT NULL,
  `MinStay` smallint(6) unsigned DEFAULT '0',
  `MaxStay` smallint(6) unsigned DEFAULT '0',
  `Servicedays` bit(7) DEFAULT b'1111111',
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `PRODUCT` (`ProductID`,`PartyID`),
  KEY `FromDate` (`FromDate`),
  KEY `ToDate` (`ToDate`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.alert
CREATE TABLE IF NOT EXISTS `alert` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `EntityType` varchar(15) DEFAULT NULL,
  `EntityID` int(10) unsigned DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Language` char(2) DEFAULT 'EN',
  `FromDate` date DEFAULT NULL,
  `ToDate` date DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.asset
CREATE TABLE IF NOT EXISTS `asset` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `OwnerID` int(10) DEFAULT NULL,
  `SupplierID` int(10) DEFAULT NULL,
  `LocationID` int(10) DEFAULT NULL,
  `DepreciationID` int(10) unsigned DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `State` varchar(15) DEFAULT NULL,
  `Type` varchar(30) DEFAULT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `Place` varchar(50) DEFAULT NULL,
  `DateAcquired` datetime DEFAULT NULL,
  `DateDisposed` datetime DEFAULT NULL,
  `Currency` varchar(3) DEFAULT NULL,
  `Unit` varchar(3) DEFAULT NULL,
  `Latitude` double DEFAULT NULL,
  `Longitude` double DEFAULT NULL,
  `Altitude` double DEFAULT '0',
  `Notes` varchar(5000) DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Quantity` int(10) unsigned DEFAULT '1',
  `Cost` double DEFAULT '0',
  `Price` double DEFAULT '0',
  `ParentID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `Name` (`Name`,`OwnerID`) USING BTREE,
  KEY `DepreciationID` (`DepreciationID`,`ID`) USING BTREE,
  KEY `SerialNumber` (`Code`,`ID`) USING BTREE,
  KEY `ParentID` (`ParentID`,`State`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.attribute
CREATE TABLE IF NOT EXISTS `attribute` (
  `List` varchar(3) NOT NULL,
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Name` varchar(255) NOT NULL DEFAULT '',
  `Type` varchar(10) DEFAULT NULL,
  `Definition` varchar(255) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`List`,`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.audit
CREATE TABLE IF NOT EXISTS `audit` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ProductID` int(10) unsigned DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `State` varchar(15) DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Rating` int(10) unsigned DEFAULT '5',
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `ProductID` (`ProductID`,`State`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.availability
CREATE TABLE IF NOT EXISTS `availability` (
  `property_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) DEFAULT NULL,
  `20140609` tinyint(2) DEFAULT '0',
  `20140610` tinyint(2) DEFAULT '0',
  `20140611` tinyint(2) DEFAULT '0',
  `20140612` tinyint(2) DEFAULT '0',
  `20140613` tinyint(2) DEFAULT '0',
  `20140614` tinyint(2) DEFAULT '0',
  `20140615` tinyint(2) DEFAULT '0',
  `20140616` tinyint(2) DEFAULT '0',
  `20140617` tinyint(2) DEFAULT '0',
  `20140618` tinyint(2) DEFAULT '0',
  `20140619` tinyint(2) DEFAULT '0',
  `20140620` tinyint(2) DEFAULT '0',
  `20140621` tinyint(2) DEFAULT '0',
  `20140622` tinyint(2) DEFAULT '0',
  `20140623` tinyint(2) DEFAULT '0',
  `20140624` tinyint(2) DEFAULT '0',
  `20140625` tinyint(2) DEFAULT '0',
  `20140626` tinyint(2) DEFAULT '0',
  `20140627` tinyint(2) DEFAULT '0',
  `20140628` tinyint(2) DEFAULT '0',
  `20140629` tinyint(2) DEFAULT '0',
  `20140630` tinyint(2) DEFAULT '0',
  `20140701` tinyint(2) DEFAULT '0',
  `20140702` tinyint(2) DEFAULT '0',
  `20140703` tinyint(2) DEFAULT '0',
  `20140704` tinyint(2) DEFAULT '0',
  `20140705` tinyint(2) DEFAULT '0',
  `20140706` tinyint(2) DEFAULT '0',
  `20140707` tinyint(2) DEFAULT '0',
  `20140708` tinyint(2) DEFAULT '0',
  `20140709` tinyint(2) DEFAULT '0',
  `20140710` tinyint(2) DEFAULT '0',
  `20140711` tinyint(2) DEFAULT '0',
  `20140712` tinyint(2) DEFAULT '0',
  `20140713` tinyint(2) DEFAULT '0',
  `20140714` tinyint(2) DEFAULT '0',
  `20140715` tinyint(2) DEFAULT '0',
  `20140716` tinyint(2) DEFAULT '0',
  `20140717` tinyint(2) DEFAULT '0',
  `20140718` tinyint(2) DEFAULT '0',
  `20140719` tinyint(2) DEFAULT '0',
  `20140720` tinyint(2) DEFAULT '0',
  `20140721` tinyint(2) DEFAULT '0',
  `20140722` tinyint(2) DEFAULT '0',
  `20140723` tinyint(2) DEFAULT '0',
  `20140724` tinyint(2) DEFAULT '0',
  `20140725` tinyint(2) DEFAULT '0',
  `20140726` tinyint(2) DEFAULT '0',
  `20140727` tinyint(2) DEFAULT '0',
  `20140728` tinyint(2) DEFAULT '0',
  `20140729` tinyint(2) DEFAULT '0',
  `20140730` tinyint(2) DEFAULT '0',
  `20140731` tinyint(2) DEFAULT '0',
  `20140801` tinyint(2) DEFAULT '0',
  `20140802` tinyint(2) DEFAULT '0',
  `20140803` tinyint(2) DEFAULT '0',
  `20140804` tinyint(2) DEFAULT '0',
  `20140805` tinyint(2) DEFAULT '0',
  `20140806` tinyint(2) DEFAULT '0',
  `20140807` tinyint(2) DEFAULT '0',
  `20140808` tinyint(2) DEFAULT '0',
  `20140809` tinyint(2) DEFAULT '0',
  `20140810` tinyint(2) DEFAULT '0',
  `20140811` tinyint(2) DEFAULT '0',
  `20140812` tinyint(2) DEFAULT '0',
  `20140813` tinyint(2) DEFAULT '0',
  `20140814` tinyint(2) DEFAULT '0',
  `20140815` tinyint(2) DEFAULT '0',
  `20140816` tinyint(2) DEFAULT '0',
  `20140817` tinyint(2) DEFAULT '0',
  `20140818` tinyint(2) DEFAULT '0',
  `20140819` tinyint(2) DEFAULT '0',
  `20140820` tinyint(2) DEFAULT '0',
  `20140821` tinyint(2) DEFAULT '0',
  `20140822` tinyint(2) DEFAULT '0',
  `20140823` tinyint(2) DEFAULT '0',
  `20140824` tinyint(2) DEFAULT '0',
  `20140825` tinyint(2) DEFAULT '0',
  `20140826` tinyint(2) DEFAULT '0',
  `20140827` tinyint(2) DEFAULT '0',
  `20140828` tinyint(2) DEFAULT '0',
  `20140829` tinyint(2) DEFAULT '0',
  `20140830` tinyint(2) DEFAULT '0',
  `20140831` tinyint(2) DEFAULT '0',
  `20140901` tinyint(2) DEFAULT '0',
  `20140902` tinyint(2) DEFAULT '0',
  `20140903` tinyint(2) DEFAULT '0',
  `20140904` tinyint(2) DEFAULT '0',
  `20140905` tinyint(2) DEFAULT '0',
  `20140906` tinyint(2) DEFAULT '0',
  `20140907` tinyint(2) DEFAULT '0',
  `20140908` tinyint(2) DEFAULT '0',
  `20140909` tinyint(2) DEFAULT '0',
  `20140910` tinyint(2) DEFAULT '0',
  `20140911` tinyint(2) DEFAULT '0',
  `20140912` tinyint(2) DEFAULT '0',
  `20140913` tinyint(2) DEFAULT '0',
  `20140914` tinyint(2) DEFAULT '0',
  `20140915` tinyint(2) DEFAULT '0',
  `20140916` tinyint(2) DEFAULT '0',
  `20140917` tinyint(2) DEFAULT '0',
  `20140918` tinyint(2) DEFAULT '0',
  `20140919` tinyint(2) DEFAULT '0',
  `20140920` tinyint(2) DEFAULT '0',
  `20140921` tinyint(2) DEFAULT '0',
  `20140922` tinyint(2) DEFAULT '0',
  `20140923` tinyint(2) DEFAULT '0',
  `20140924` tinyint(2) DEFAULT '0',
  `20140925` tinyint(2) DEFAULT '0',
  `20140926` tinyint(2) DEFAULT '0',
  `20140927` tinyint(2) DEFAULT '0',
  `20140928` tinyint(2) DEFAULT '0',
  `20140929` tinyint(2) DEFAULT '0',
  `20140930` tinyint(2) DEFAULT '0',
  `20141001` tinyint(2) DEFAULT '0',
  `20141002` tinyint(2) DEFAULT '0',
  `20141003` tinyint(2) DEFAULT '0',
  `20141004` tinyint(2) DEFAULT '0',
  `20141005` tinyint(2) DEFAULT '0',
  `20141006` tinyint(2) DEFAULT '0',
  `20141007` tinyint(2) DEFAULT '0',
  `20141008` tinyint(2) DEFAULT '0',
  `20141009` tinyint(2) DEFAULT '0',
  `20141010` tinyint(2) DEFAULT '0',
  `20141011` tinyint(2) DEFAULT '0',
  `20141012` tinyint(2) DEFAULT '0',
  `20141013` tinyint(2) DEFAULT '0',
  `20141014` tinyint(2) DEFAULT '0',
  `20141015` tinyint(2) DEFAULT '0',
  `20141016` tinyint(2) DEFAULT '0',
  `20141017` tinyint(2) DEFAULT '0',
  `20141018` tinyint(2) DEFAULT '0',
  `20141019` tinyint(2) DEFAULT '0',
  `20141020` tinyint(2) DEFAULT '0',
  `20141021` tinyint(2) DEFAULT '0',
  `20141022` tinyint(2) DEFAULT '0',
  `20141023` tinyint(2) DEFAULT '0',
  `20141024` tinyint(2) DEFAULT '0',
  `20141025` tinyint(2) DEFAULT '0',
  `20141026` tinyint(2) DEFAULT '0',
  `20141027` tinyint(2) DEFAULT '0',
  `20141028` tinyint(2) DEFAULT '0',
  `20141029` tinyint(2) DEFAULT '0',
  `20141030` tinyint(2) DEFAULT '0',
  `20141031` tinyint(2) DEFAULT '0',
  `20141101` tinyint(2) DEFAULT '0',
  `20141102` tinyint(2) DEFAULT '0',
  `20141103` tinyint(2) DEFAULT '0',
  `20141104` tinyint(2) DEFAULT '0',
  `20141105` tinyint(2) DEFAULT '0',
  `20141106` tinyint(2) DEFAULT '0',
  `20141107` tinyint(2) DEFAULT '0',
  `20141108` tinyint(2) DEFAULT '0',
  `20141109` tinyint(2) DEFAULT '0',
  `20141110` tinyint(2) DEFAULT '0',
  `20141111` tinyint(2) DEFAULT '0',
  `20141112` tinyint(2) DEFAULT '0',
  `20141113` tinyint(2) DEFAULT '0',
  `20141114` tinyint(2) DEFAULT '0',
  `20141115` tinyint(2) DEFAULT '0',
  `20141116` tinyint(2) DEFAULT '0',
  `20141117` tinyint(2) DEFAULT '0',
  `20141118` tinyint(2) DEFAULT '0',
  `20141119` tinyint(2) DEFAULT '0',
  `20141120` tinyint(2) DEFAULT '0',
  `20141121` tinyint(2) DEFAULT '0',
  `20141122` tinyint(2) DEFAULT '0',
  `20141123` tinyint(2) DEFAULT '0',
  `20141124` tinyint(2) DEFAULT '0',
  `20141125` tinyint(2) DEFAULT '0',
  `20141126` tinyint(2) DEFAULT '0',
  `20141127` tinyint(2) DEFAULT '0',
  `20141128` tinyint(2) DEFAULT '0',
  `20141129` tinyint(2) DEFAULT '0',
  `20141130` tinyint(2) DEFAULT '0',
  `20141201` tinyint(2) DEFAULT '0',
  `20141202` tinyint(2) DEFAULT '0',
  `20141203` tinyint(2) DEFAULT '0',
  `20141204` tinyint(2) DEFAULT '0',
  `20141205` tinyint(2) DEFAULT '0',
  `20141206` tinyint(2) DEFAULT '0',
  `20141207` tinyint(2) DEFAULT '0',
  `20141208` tinyint(2) DEFAULT '0',
  `20141209` tinyint(2) DEFAULT '0',
  `20141210` tinyint(2) DEFAULT '0',
  `20141211` tinyint(2) DEFAULT '0',
  `20141212` tinyint(2) DEFAULT '0',
  `20141213` tinyint(2) DEFAULT '0',
  `20141214` tinyint(2) DEFAULT '0',
  `20141215` tinyint(2) DEFAULT '0',
  `20141216` tinyint(2) DEFAULT '0',
  `20141217` tinyint(2) DEFAULT '0',
  `20141218` tinyint(2) DEFAULT '0',
  `20141219` tinyint(2) DEFAULT '0',
  `20141220` tinyint(2) DEFAULT '0',
  `20141221` tinyint(2) DEFAULT '0',
  `20141222` tinyint(2) DEFAULT '0',
  `20141223` tinyint(2) DEFAULT '0',
  `20141224` tinyint(2) DEFAULT '0',
  `20141225` tinyint(2) DEFAULT '0',
  `20141226` tinyint(2) DEFAULT '0',
  `20141227` tinyint(2) DEFAULT '0',
  `20141228` tinyint(2) DEFAULT '0',
  `20141229` tinyint(2) DEFAULT '0',
  `20141230` tinyint(2) DEFAULT '0',
  `20141231` tinyint(2) DEFAULT '0',
  `20150101` tinyint(2) DEFAULT '0',
  `20150102` tinyint(2) DEFAULT '0',
  `20150103` tinyint(2) DEFAULT '0',
  `20150104` tinyint(2) DEFAULT '0',
  `20150105` tinyint(2) DEFAULT '0',
  `20150106` tinyint(2) DEFAULT '0',
  `20150107` tinyint(2) DEFAULT '0',
  `20150108` tinyint(2) DEFAULT '0',
  `20150109` tinyint(2) DEFAULT '0',
  `20150110` tinyint(2) DEFAULT '0',
  `20150111` tinyint(2) DEFAULT '0',
  `20150112` tinyint(2) DEFAULT '0',
  `20150113` tinyint(2) DEFAULT '0',
  `20150114` tinyint(2) DEFAULT '0',
  `20150115` tinyint(2) DEFAULT '0',
  `20150116` tinyint(2) DEFAULT '0',
  `20150117` tinyint(2) DEFAULT '0',
  `20150118` tinyint(2) DEFAULT '0',
  `20150119` tinyint(2) DEFAULT '0',
  `20150120` tinyint(2) DEFAULT '0',
  `20150121` tinyint(2) DEFAULT '0',
  `20150122` tinyint(2) DEFAULT '0',
  `20150123` tinyint(2) DEFAULT '0',
  `20150124` tinyint(2) DEFAULT '0',
  `20150125` tinyint(2) DEFAULT '0',
  `20150126` tinyint(2) DEFAULT '0',
  `20150127` tinyint(2) DEFAULT '0',
  `20150128` tinyint(2) DEFAULT '0',
  `20150129` tinyint(2) DEFAULT '0',
  `20150130` tinyint(2) DEFAULT '0',
  `20150131` tinyint(2) DEFAULT '0',
  `20150201` tinyint(2) DEFAULT '0',
  `20150202` tinyint(2) DEFAULT '0',
  `20150203` tinyint(2) DEFAULT '0',
  `20150204` tinyint(2) DEFAULT '0',
  `20150205` tinyint(2) DEFAULT '0',
  `20150206` tinyint(2) DEFAULT '0',
  `20150207` tinyint(2) DEFAULT '0',
  `20150208` tinyint(2) DEFAULT '0',
  `20150209` tinyint(2) DEFAULT '0',
  `20150210` tinyint(2) DEFAULT '0',
  `20150211` tinyint(2) DEFAULT '0',
  `20150212` tinyint(2) DEFAULT '0',
  `20150213` tinyint(2) DEFAULT '0',
  `20150214` tinyint(2) DEFAULT '0',
  `20150215` tinyint(2) DEFAULT '0',
  `20150216` tinyint(2) DEFAULT '0',
  `20150217` tinyint(2) DEFAULT '0',
  `20150218` tinyint(2) DEFAULT '0',
  `20150219` tinyint(2) DEFAULT '0',
  `20150220` tinyint(2) DEFAULT '0',
  `20150221` tinyint(2) DEFAULT '0',
  `20150222` tinyint(2) DEFAULT '0',
  `20150223` tinyint(2) DEFAULT '0',
  `20150224` tinyint(2) DEFAULT '0',
  `20150225` tinyint(2) DEFAULT '0',
  `20150226` tinyint(2) DEFAULT '0',
  `20150227` tinyint(2) DEFAULT '0',
  `20150228` tinyint(2) DEFAULT '0',
  `20150301` tinyint(2) DEFAULT '0',
  `20150302` tinyint(2) DEFAULT '0',
  `20150303` tinyint(2) DEFAULT '0',
  `20150304` tinyint(2) DEFAULT '0',
  `20150305` tinyint(2) DEFAULT '0',
  `20150306` tinyint(2) DEFAULT '0',
  `20150307` tinyint(2) DEFAULT '0',
  `20150308` tinyint(2) DEFAULT '0',
  `20150309` tinyint(2) DEFAULT '0',
  `20150310` tinyint(2) DEFAULT '0',
  `20150311` tinyint(2) DEFAULT '0',
  `20150312` tinyint(2) DEFAULT '0',
  `20150313` tinyint(2) DEFAULT '0',
  `20150314` tinyint(2) DEFAULT '0',
  `20150315` tinyint(2) DEFAULT '0',
  `20150316` tinyint(2) DEFAULT '0',
  `20150317` tinyint(2) DEFAULT '0',
  `20150318` tinyint(2) DEFAULT '0',
  `20150319` tinyint(2) DEFAULT '0',
  `20150320` tinyint(2) DEFAULT '0',
  `20150321` tinyint(2) DEFAULT '0',
  `20150322` tinyint(2) DEFAULT '0',
  `20150323` tinyint(2) DEFAULT '0',
  `20150324` tinyint(2) DEFAULT '0',
  `20150325` tinyint(2) DEFAULT '0',
  `20150326` tinyint(2) DEFAULT '0',
  `20150327` tinyint(2) DEFAULT '0',
  `20150328` tinyint(2) DEFAULT '0',
  `20150329` tinyint(2) DEFAULT '0',
  `20150330` tinyint(2) DEFAULT '0',
  `20150331` tinyint(2) DEFAULT '0',
  `20150401` tinyint(2) DEFAULT '0',
  `20150402` tinyint(2) DEFAULT '0',
  `20150403` tinyint(2) DEFAULT '0',
  `20150404` tinyint(2) DEFAULT '0',
  `20150405` tinyint(2) DEFAULT '0',
  `20150406` tinyint(2) DEFAULT '0',
  `20150407` tinyint(2) DEFAULT '0',
  `20150408` tinyint(2) DEFAULT '0',
  `20150409` tinyint(2) DEFAULT '0',
  `20150410` tinyint(2) DEFAULT '0',
  `20150411` tinyint(2) DEFAULT '0',
  `20150412` tinyint(2) DEFAULT '0',
  `20150413` tinyint(2) DEFAULT '0',
  `20150414` tinyint(2) DEFAULT '0',
  `20150415` tinyint(2) DEFAULT '0',
  `20150416` tinyint(2) DEFAULT '0',
  `20150417` tinyint(2) DEFAULT '0',
  `20150418` tinyint(2) DEFAULT '0',
  `20150419` tinyint(2) DEFAULT '0',
  `20150420` tinyint(2) DEFAULT '0',
  `20150421` tinyint(2) DEFAULT '0',
  `20150422` tinyint(2) DEFAULT '0',
  `20150423` tinyint(2) DEFAULT '0',
  `20150424` tinyint(2) DEFAULT '0',
  `20150425` tinyint(2) DEFAULT '0',
  `20150426` tinyint(2) DEFAULT '0',
  `20150427` tinyint(2) DEFAULT '0',
  `20150428` tinyint(2) DEFAULT '0',
  `20150429` tinyint(2) DEFAULT '0',
  `20150430` tinyint(2) DEFAULT '0',
  `20150501` tinyint(2) DEFAULT '0',
  `20150502` tinyint(2) DEFAULT '0',
  `20150503` tinyint(2) DEFAULT '0',
  `20150504` tinyint(2) DEFAULT '0',
  `20150505` tinyint(2) DEFAULT '0',
  `20150506` tinyint(2) DEFAULT '0',
  `20150507` tinyint(2) DEFAULT '0',
  `20150508` tinyint(2) DEFAULT '0',
  `20150509` tinyint(2) DEFAULT '0',
  `20150510` tinyint(2) DEFAULT '0',
  `20150511` tinyint(2) DEFAULT '0',
  `20150512` tinyint(2) DEFAULT '0',
  `20150513` tinyint(2) DEFAULT '0',
  `20150514` tinyint(2) DEFAULT '0',
  `20150515` tinyint(2) DEFAULT '0',
  `20150516` tinyint(2) DEFAULT '0',
  `20150517` tinyint(2) DEFAULT '0',
  `20150518` tinyint(2) DEFAULT '0',
  `20150519` tinyint(2) DEFAULT '0',
  `20150520` tinyint(2) DEFAULT '0',
  `20150521` tinyint(2) DEFAULT '0',
  `20150522` tinyint(2) DEFAULT '0',
  `20150523` tinyint(2) DEFAULT '0',
  `20150524` tinyint(2) DEFAULT '0',
  `20150525` tinyint(2) DEFAULT '0',
  `20150526` tinyint(2) DEFAULT '0',
  `20150527` tinyint(2) DEFAULT '0',
  `20150528` tinyint(2) DEFAULT '0',
  `20150529` tinyint(2) DEFAULT '0',
  `20150530` tinyint(2) DEFAULT '0',
  `20150531` tinyint(2) DEFAULT '0',
  `20150601` tinyint(2) DEFAULT '0',
  `20150602` tinyint(2) DEFAULT '0',
  `20150603` tinyint(2) DEFAULT '0',
  `20150604` tinyint(2) DEFAULT '0',
  `20150605` tinyint(2) DEFAULT '0',
  `20150606` tinyint(2) DEFAULT '0',
  `20150607` tinyint(2) DEFAULT '0',
  `20150608` tinyint(2) DEFAULT '0',
  `20150609` tinyint(2) DEFAULT '0',
  `20150610` tinyint(2) DEFAULT '0',
  `20150611` tinyint(2) DEFAULT '0',
  `20150612` tinyint(2) DEFAULT '0',
  `20150613` tinyint(2) DEFAULT '0',
  `20150614` tinyint(2) DEFAULT '0',
  `20150615` tinyint(2) DEFAULT '0',
  `20150616` tinyint(2) DEFAULT '0',
  `20150617` tinyint(2) DEFAULT '0',
  `20150618` tinyint(2) DEFAULT '0',
  `20150619` tinyint(2) DEFAULT '0',
  `20150620` tinyint(2) DEFAULT '0',
  `20150621` tinyint(2) DEFAULT '0',
  `20150622` tinyint(2) DEFAULT '0',
  `20150623` tinyint(2) DEFAULT '0',
  `20150624` tinyint(2) DEFAULT '0',
  `20150625` tinyint(2) DEFAULT '0',
  `20150626` tinyint(2) DEFAULT '0',
  `20150627` tinyint(2) DEFAULT '0',
  `20150628` tinyint(2) DEFAULT '0',
  `20150629` tinyint(2) DEFAULT '0',
  `20150630` tinyint(2) DEFAULT '0',
  `20150701` tinyint(2) DEFAULT '0',
  `20150702` tinyint(2) DEFAULT '0',
  `20150703` tinyint(2) DEFAULT '0',
  `20150704` tinyint(2) DEFAULT '0',
  `20150705` tinyint(2) DEFAULT '0',
  `20150706` tinyint(2) DEFAULT '0',
  `20150707` tinyint(2) DEFAULT '0',
  `20150708` tinyint(2) DEFAULT '0',
  `20150709` tinyint(2) DEFAULT '0',
  `20150710` tinyint(2) DEFAULT '0',
  `20150711` tinyint(2) DEFAULT '0',
  `20150712` tinyint(2) DEFAULT '0',
  `20150713` tinyint(2) DEFAULT '0',
  `20150714` tinyint(2) DEFAULT '0',
  `20150715` tinyint(2) DEFAULT '0',
  `20150716` tinyint(2) DEFAULT '0',
  `20150717` tinyint(2) DEFAULT '0',
  `20150718` tinyint(2) DEFAULT '0',
  `20150719` tinyint(2) DEFAULT '0',
  `20150720` tinyint(2) DEFAULT '0',
  `20150721` tinyint(2) DEFAULT '0',
  `20150722` tinyint(2) DEFAULT '0',
  `20150723` tinyint(2) DEFAULT '0',
  `20150724` tinyint(2) DEFAULT '0',
  `20150725` tinyint(2) DEFAULT '0',
  `20150726` tinyint(2) DEFAULT '0',
  `20150727` tinyint(2) DEFAULT '0',
  `20150728` tinyint(2) DEFAULT '0',
  `20150729` tinyint(2) DEFAULT '0',
  `20150730` tinyint(2) DEFAULT '0',
  `20150731` tinyint(2) DEFAULT '0',
  `20150801` tinyint(2) DEFAULT '0',
  `20150802` tinyint(2) DEFAULT '0',
  `20150803` tinyint(2) DEFAULT '0',
  `20150804` tinyint(2) DEFAULT '0',
  `20150805` tinyint(2) DEFAULT '0',
  `20150806` tinyint(2) DEFAULT '0',
  `20150807` tinyint(2) DEFAULT '0',
  `20150808` tinyint(2) DEFAULT '0',
  `20150809` tinyint(2) DEFAULT '0',
  `20150810` tinyint(2) DEFAULT '0',
  `20150811` tinyint(2) DEFAULT '0',
  `20150812` tinyint(2) DEFAULT '0',
  `20150813` tinyint(2) DEFAULT '0',
  `20150814` tinyint(2) DEFAULT '0',
  `20150815` tinyint(2) DEFAULT '0',
  `20150816` tinyint(2) DEFAULT '0',
  `20150817` tinyint(2) DEFAULT '0',
  `20150818` tinyint(2) DEFAULT '0',
  `20150819` tinyint(2) DEFAULT '0',
  `20150820` tinyint(2) DEFAULT '0',
  `20150821` tinyint(2) DEFAULT '0',
  `20150822` tinyint(2) DEFAULT '0',
  `20150823` tinyint(2) DEFAULT '0',
  `20150824` tinyint(2) DEFAULT '0',
  `20150825` tinyint(2) DEFAULT '0',
  `20150826` tinyint(2) DEFAULT '0',
  `20150827` tinyint(2) DEFAULT '0',
  `20150828` tinyint(2) DEFAULT '0',
  `20150829` tinyint(2) DEFAULT '0',
  `20150830` tinyint(2) DEFAULT '0',
  `20150831` tinyint(2) DEFAULT '0',
  `20150901` tinyint(2) DEFAULT '0',
  `20150902` tinyint(2) DEFAULT '0',
  `20150903` tinyint(2) DEFAULT '0',
  `20150904` tinyint(2) DEFAULT '0',
  `20150905` tinyint(2) DEFAULT '0',
  `20150906` tinyint(2) DEFAULT '0',
  `20150907` tinyint(2) DEFAULT '0',
  `20150908` tinyint(2) DEFAULT '0',
  `20150909` tinyint(2) DEFAULT '0',
  `20150910` tinyint(2) DEFAULT '0',
  `20150911` tinyint(2) DEFAULT '0',
  `20150912` tinyint(2) DEFAULT '0',
  `20150913` tinyint(2) DEFAULT '0',
  `20150914` tinyint(2) DEFAULT '0',
  `20150915` tinyint(2) DEFAULT '0',
  `20150916` tinyint(2) DEFAULT '0',
  `20150917` tinyint(2) DEFAULT '0',
  `20150918` tinyint(2) DEFAULT '0',
  `20150919` tinyint(2) DEFAULT '0',
  `20150920` tinyint(2) DEFAULT '0',
  `20150921` tinyint(2) DEFAULT '0',
  `20150922` tinyint(2) DEFAULT '0',
  `20150923` tinyint(2) DEFAULT '0',
  `20150924` tinyint(2) DEFAULT '0',
  `20150925` tinyint(2) DEFAULT '0',
  `20150926` tinyint(2) DEFAULT '0',
  `20150927` tinyint(2) DEFAULT '0',
  `20150928` tinyint(2) DEFAULT '0',
  `20150929` tinyint(2) DEFAULT '0',
  `20150930` tinyint(2) DEFAULT '0',
  `20151001` tinyint(2) DEFAULT '0',
  `20151002` tinyint(2) DEFAULT '0',
  `20151003` tinyint(2) DEFAULT '0',
  `20151004` tinyint(2) DEFAULT '0',
  `20151005` tinyint(2) DEFAULT '0',
  `20151006` tinyint(2) DEFAULT '0',
  `20151007` tinyint(2) DEFAULT '0',
  `20151008` tinyint(2) DEFAULT '0',
  `20151009` tinyint(2) DEFAULT '0',
  `20151010` tinyint(2) DEFAULT '0',
  `20151011` tinyint(2) DEFAULT '0',
  `20151012` tinyint(2) DEFAULT '0',
  `20151013` tinyint(2) DEFAULT '0',
  `20151014` tinyint(2) DEFAULT '0',
  `20151015` tinyint(2) DEFAULT '0',
  `06062019` tinyint(2) DEFAULT '0',
  `20151016` tinyint(2) DEFAULT '0',
  `20151017` tinyint(2) DEFAULT '0',
  `20140606` tinyint(2) DEFAULT '0',
  `20140607` tinyint(2) DEFAULT '0',
  `20151018` tinyint(2) DEFAULT '0',
  `20140608` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`property_id`),
  KEY `location_id_idx` (`location_id`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.bill
CREATE TABLE IF NOT EXISTS `bill` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ProductID` int(10) NOT NULL,
  `Operation` varchar(10) DEFAULT NULL,
  `EntityType` varchar(15) NOT NULL,
  `EntityID` int(10) DEFAULT NULL,
  `Fixed` double DEFAULT NULL,
  `Quantity` double DEFAULT NULL,
  `Unit` varchar(3) DEFAULT NULL,
  `FromDate` datetime DEFAULT NULL,
  `ToDate` datetime DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Output` bit(1) DEFAULT b'0',
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `FK_bill_product` (`ProductID`),
  CONSTRAINT `FK_bill_product` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.bookingpal_report
CREATE TABLE IF NOT EXISTS `bookingpal_report` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `lat` varchar(255) NOT NULL,
  `lng` varchar(255) NOT NULL,
  `bathroom_count` varchar(255) NOT NULL,
  `number_of_rooms` varchar(255) NOT NULL,
  `total_occupancy` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.cancellation_rule_type
CREATE TABLE IF NOT EXISTS `cancellation_rule_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.channel_lastfetch
CREATE TABLE IF NOT EXISTS `channel_lastfetch` (
  `channel_id` int(10) NOT NULL,
  `api_name` varchar(50) NOT NULL DEFAULT '',
  `last_fetch` varchar(50) DEFAULT NULL,
  `product_id` varchar(45) NOT NULL,
  PRIMARY KEY (`channel_id`,`api_name`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.channel_partner
CREATE TABLE IF NOT EXISTS `channel_partner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_name` varchar(255) DEFAULT NULL,
  `state` varchar(255) NOT NULL DEFAULT 'Created',
  `logo_url` varchar(255) DEFAULT NULL,
  `website_url` varchar(255) DEFAULT NULL,
  `channel_type` varchar(50) DEFAULT NULL,
  `coverage` varchar(255) DEFAULT NULL,
  `contact_type` varchar(255) DEFAULT NULL,
  `payment_process` varchar(255) DEFAULT NULL,
  `payouts` varchar(255) DEFAULT NULL,
  `damage_coverage` varchar(255) DEFAULT NULL,
  `traffic` varchar(255) DEFAULT NULL,
  `commission` double(9,2) DEFAULT NULL,
  `listing_fees` varchar(255) DEFAULT NULL,
  `privacy_policy` varchar(255) DEFAULT NULL,
  `terms_conditions` varchar(255) DEFAULT NULL,
  `selected` tinyint(1) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `office_address` varchar(255) DEFAULT NULL,
  `description` text,
  `party_id` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT '0',
  `generate_xml` tinyint(1) DEFAULT '0',
  `ftp_password` varchar(255) DEFAULT NULL,
  `send_confirmation_email` tinyint(1) NOT NULL DEFAULT '1',
  `send_failure_email` tinyint(1) DEFAULT '0',
  `funds_holder` tinyint(4) DEFAULT '0',
  `bp_commission` double(9,2) NOT NULL DEFAULT '3.00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.channel_product_map
CREATE TABLE IF NOT EXISTS `channel_product_map` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ProductID` varchar(50) DEFAULT NULL,
  `Channel_ProductID` varchar(50) DEFAULT NULL,
  `Channel_ID` int(10) NOT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` tinyint(1) DEFAULT '1',
  `Channel_RoomID` varchar(50) DEFAULT NULL,
  `Channel_RateID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.channel_product_yield_map
CREATE TABLE IF NOT EXISTS `channel_product_yield_map` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Product_ID` varchar(50) DEFAULT NULL,
  `Channel_ID` int(10) NOT NULL,
  `Yield_Rule_Name` varchar(50) DEFAULT NULL,
  `Channel_RateID` varchar(50) DEFAULT NULL,
  `Version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.channel_rate_map
CREATE TABLE IF NOT EXISTS `channel_rate_map` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `RateName` varchar(50) DEFAULT NULL,
  `Channel_RateID` varchar(50) DEFAULT NULL,
  `Price_ID` int(10) NOT NULL,
  `Yield_ID` int(10) DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.city
CREATE TABLE IF NOT EXISTS `city` (
  `Code` varchar(50) NOT NULL DEFAULT '',
  `Name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Latitude` double DEFAULT NULL,
  `Longitude` double DEFAULT NULL,
  `Country` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.contract
CREATE TABLE IF NOT EXISTS `contract` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OrganizationID` int(10) unsigned DEFAULT '0',
  `ActorID` int(10) unsigned DEFAULT '2',
  `PartyID` int(10) unsigned DEFAULT '0',
  `Name` varchar(15) DEFAULT NULL,
  `State` varchar(15) DEFAULT NULL,
  `Process` varchar(15) DEFAULT NULL,
  `Discount` int(10) unsigned DEFAULT NULL,
  `CreditTerm` varchar(15) DEFAULT NULL,
  `CreditLimit` double DEFAULT NULL,
  `Target` double DEFAULT NULL,
  `Currency` varchar(3) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `DueDate` datetime DEFAULT NULL,
  `DoneDate` datetime DEFAULT NULL,
  `Notes` varchar(1000) DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `Type` (`Name`,`Date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.convertion_info
CREATE TABLE IF NOT EXISTS `convertion_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_currency` varchar(255) DEFAULT NULL,
  `from_amount` double DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `convertion_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.country
CREATE TABLE IF NOT EXISTS `country` (
  `ID` varchar(2) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Currency` varchar(3) DEFAULT 'USD',
  `Language` varchar(2) DEFAULT 'en',
  `PhoneCode` smallint(5) DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE KEY `Name` (`Name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.country_code
CREATE TABLE IF NOT EXISTS `country_code` (
  `country` varchar(50) NOT NULL,
  `iso_code2` varchar(2) NOT NULL,
  `iso_code3` varchar(3) NOT NULL,
  `phone_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`country`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.currency
CREATE TABLE IF NOT EXISTS `currency` (
  `ID` varchar(3) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Number` varchar(3) DEFAULT NULL,
  `Decimals` tinyint(3) unsigned DEFAULT '2',
  `Convertible` tinyint(1) unsigned DEFAULT '0',
  `Paypal` tinyint(1) unsigned DEFAULT '0',
  `Jetpay` tinyint(1) unsigned DEFAULT '0',
  `State` varchar(20) DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.currency1
CREATE TABLE IF NOT EXISTS `currency1` (
  `ID` varchar(3) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Number` varchar(3) DEFAULT NULL,
  `Decimals` tinyint(3) unsigned DEFAULT '2',
  `Convertible` tinyint(1) unsigned DEFAULT '0',
  `Paypal` tinyint(1) unsigned DEFAULT '0',
  `Jetpay` tinyint(1) unsigned DEFAULT '0',
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `State` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.currencyrate
CREATE TABLE IF NOT EXISTS `currencyrate` (
  `ID` varchar(3) NOT NULL,
  `ToID` varchar(3) NOT NULL,
  `Date` date NOT NULL,
  `Rate` double DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`,`ToID`,`Date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.customer_payment_profile
CREATE TABLE IF NOT EXISTS `customer_payment_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reservation_id` int(11) DEFAULT NULL,
  `customer_profile_id` varchar(255) DEFAULT NULL,
  `customer_payment_profile_id` int(11) DEFAULT NULL,
  `gateway_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.data
CREATE TABLE IF NOT EXISTS `data` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OrganizationID` int(10) unsigned DEFAULT NULL,
  `ActorID` int(10) unsigned DEFAULT NULL,
  `Origin` varchar(15) DEFAULT NULL,
  `DataType` varchar(15) DEFAULT NULL,
  `DataID` varchar(15) DEFAULT NULL,
  `State` varchar(15) DEFAULT NULL,
  `ToString` varchar(5000) DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `OrganizationID` (`OrganizationID`,`ID`),
  KEY `ActorID` (`ActorID`,`ID`),
  KEY `Data` (`DataType`,`DataID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.depreciation
CREATE TABLE IF NOT EXISTS `depreciation` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `CostaccountID` int(11) DEFAULT NULL,
  `DepreciationaccountID` int(11) DEFAULT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `Type` varchar(20) DEFAULT NULL,
  `Months` double(7,2) DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.design
CREATE TABLE IF NOT EXISTS `design` (
  `ID` varchar(50) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '0',
  `Name` varchar(50) DEFAULT NULL,
  `NameService` varchar(50) DEFAULT NULL,
  `NameType` varchar(50) DEFAULT NULL,
  `LastDate` datetime DEFAULT NULL,
  `Notes` varchar(1000) DEFAULT NULL,
  `NamerangeEnabled` tinyint(1) DEFAULT '0',
  `DaterangeEnabled` tinyint(1) DEFAULT '0',
  `CurrencyEnabled` tinyint(1) DEFAULT '0',
  `State` varchar(15) DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `StatesEnabled` tinyint(1) DEFAULT '0',
  `TypesEnabled` tinyint(1) DEFAULT '0',
  `NameLabel` varchar(50) DEFAULT NULL,
  `EntityType` varchar(15) DEFAULT NULL,
  `AccountEnabled` tinyint(1) unsigned DEFAULT '0',
  `ProcessEnabled` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE KEY `Name` (`Name`),
  KEY `Type` (`NameService`,`Name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.download
CREATE TABLE IF NOT EXISTS `download` (
  `Link` varchar(50) NOT NULL,
  `HeadID` varchar(50) NOT NULL,
  `LineID` varchar(50) NOT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `HeadID` (`HeadID`,`Link`,`LineID`) USING BTREE,
  KEY `LineID` (`LineID`,`Link`,`HeadID`) USING BTREE,
  KEY `Link` (`Link`,`HeadID`,`LineID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table razor.event
CREATE TABLE IF NOT EXISTS `event` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OrganizationID` int(10) unsigned DEFAULT NULL,
  `ActorID` int(10) unsigned DEFAULT NULL,
  `ParentID` int(10) unsigned DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `State` varchar(15) DEFAULT NULL,
  `Activity` varchar(15) DEFAULT NULL,
  `Process` varchar(30) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `Type` varchar(15) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `DueDate` datetime DEFAULT NULL,
  `DoneDate` datetime DEFAULT NULL,
  `Downloaded` tinyint(1) unsigned DEFAULT '0',
  `Notes` varchar(3000) DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `ParentID` (`ParentID`),
  KEY `Process` (`Process`,`Name`),
  KEY `Name` (`Name`,`Date`,`OrganizationID`) USING BTREE,
  KEY `Done` (`ID`,`State`,`DoneDate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 51200 kB';

-- Data exporting was unselected.


-- Dumping structure for table razor.fee
CREATE TABLE IF NOT EXISTS `fee` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AltID` varchar(100) DEFAULT NULL,
  `EntityType` tinyint(1) DEFAULT '1',
  `ProductID` int(11) DEFAULT NULL,
  `PartyID` int(11) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `State` tinyint(1) DEFAULT '1',
  `OptionValue` varchar(100) DEFAULT NULL,
  `TaxType` tinyint(1) DEFAULT '1',
  `FromDate` date DEFAULT NULL,
  `ToDate` date DEFAULT NULL,
  `Unit` tinyint(1) DEFAULT '1',
  `Value` double DEFAULT '0',
  `ValueType` tinyint(1) DEFAULT '1',
  `Weight` tinyint(2) DEFAULT '0',
  `Currency` varchar(3) DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.finance
CREATE TABLE IF NOT EXISTS `finance` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OwnerID` int(10) unsigned DEFAULT NULL,
  `AccountID` int(10) unsigned DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `State` varchar(15) DEFAULT NULL,
  `Type` varchar(10) DEFAULT NULL,
  `BankName` varchar(100) DEFAULT NULL,
  `BranchName` varchar(100) DEFAULT NULL,
  `BranchNumber` varchar(100) DEFAULT NULL,
  `AccountNumber` varchar(50) DEFAULT NULL,
  `IbanSwift` varchar(100) DEFAULT NULL,
  `ContactPerson` varchar(30) DEFAULT NULL,
  `PhoneNumber` varchar(30) DEFAULT NULL,
  `Currency` varchar(3) DEFAULT NULL,
  `Month` varchar(100) DEFAULT NULL,
  `Year` varchar(100) DEFAULT NULL,
  `Code` varchar(100) DEFAULT NULL,
  `Notes` varchar(1000) DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.image
CREATE TABLE IF NOT EXISTS `image` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `language` varchar(2) NOT NULL DEFAULT 'EN',
  `name` varchar(255) DEFAULT NULL,
  `old_name` varchar(255) DEFAULT NULL,
  `type` enum('hosted','linked','blob') NOT NULL,
  `url` varchar(550) DEFAULT NULL,
  `state` varchar(45) DEFAULT 'Created',
  `data` blob,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `notes` varchar(20000) CHARACTER SET utf8 DEFAULT NULL,
  `standard` tinyint(1) NOT NULL DEFAULT '0',
  `thumbnail` tinyint(1) NOT NULL DEFAULT '0',
  `sort` int(3) DEFAULT '2',
  PRIMARY KEY (`ID`),
  KEY `PRODUCT` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.journal
CREATE TABLE IF NOT EXISTS `journal` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `EventID` int(10) DEFAULT NULL,
  `MatchID` int(10) unsigned DEFAULT NULL,
  `AccountID` int(10) unsigned DEFAULT NULL,
  `OrganizationID` int(10) unsigned DEFAULT NULL,
  `LocationID` int(10) unsigned DEFAULT NULL,
  `EntityType` varchar(20) DEFAULT NULL,
  `EntityID` int(10) unsigned DEFAULT NULL,
  `Quantity` double DEFAULT NULL,
  `Unit` varchar(3) DEFAULT NULL,
  `Unitprice` double DEFAULT '0',
  `CreditAmount` decimal(18,2) DEFAULT NULL,
  `DebitAmount` decimal(18,2) DEFAULT NULL,
  `Currency` varchar(3) DEFAULT NULL,
  `Description` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `MatchID` (`MatchID`),
  KEY `Entity` (`EntityType`,`EntityID`),
  KEY `EventID` (`EventID`,`ID`) USING BTREE,
  KEY `LocationID` (`LocationID`,`ID`) USING BTREE,
  KEY `Account` (`AccountID`,`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 26624 kB; InnoDB free: 48128 kB';

-- Data exporting was unselected.


-- Dumping structure for table razor.language
CREATE TABLE IF NOT EXISTS `language` (
  `ID` varchar(2) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.license
CREATE TABLE IF NOT EXISTS `license` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UpstreamID` int(10) unsigned DEFAULT NULL,
  `DownstreamID` int(10) unsigned DEFAULT NULL,
  `ProductID` int(10) unsigned DEFAULT NULL,
  `State` varchar(15) DEFAULT NULL,
  `Type` varchar(15) DEFAULT NULL,
  `FromDate` date DEFAULT NULL,
  `ToDate` date DEFAULT NULL,
  `Wait` int(10) unsigned DEFAULT '0',
  `Subscription` double DEFAULT '0',
  `Transaction` double DEFAULT '0',
  `Upstream` double DEFAULT '0',
  `Downstream` double DEFAULT '0',
  `Notes` varchar(2000) DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `Upstream` (`UpstreamID`,`FromDate`),
  KEY `Downstream` (`DownstreamID`,`FromDate`),
  KEY `Product` (`ProductID`,`FromDate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.locale
CREATE TABLE IF NOT EXISTS `locale` (
  `ID` varchar(2) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Currency` varchar(3) DEFAULT NULL,
  `Capital` varchar(50) DEFAULT NULL,
  `Num` int(10) unsigned DEFAULT NULL,
  `Alpha3` varchar(3) DEFAULT NULL,
  `FipsCode` varchar(2) DEFAULT NULL,
  `Language` varchar(2) DEFAULT NULL,
  `Languages` varchar(100) DEFAULT NULL,
  `GeoNameId` int(10) unsigned DEFAULT NULL,
  `Continent` varchar(2) DEFAULT NULL,
  `Area` double DEFAULT NULL,
  `Population` int(10) unsigned DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.location
CREATE TABLE IF NOT EXISTS `location` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Code` varchar(8) DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `GName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `State` varchar(10) DEFAULT 'Created',
  `Country` varchar(2) DEFAULT NULL,
  `Region` varchar(3) DEFAULT NULL,
  `AdminArea_lvl_1` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `AdminArea_lvl_2` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Status` varchar(2) DEFAULT NULL,
  `IATA` varchar(4) DEFAULT NULL,
  `Latitude` double DEFAULT NULL,
  `Longitude` double DEFAULT NULL,
  `Altitude` double DEFAULT '0',
  `Notes` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `CodeInterhome` varchar(10) DEFAULT NULL,
  `CodeRentalsUnited` varchar(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ActiveProducts` int(11) DEFAULT '0',
  `LocationType` varchar(255) DEFAULT 'locality',
  `ParentID` int(10) DEFAULT NULL,
  `Type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `Country` (`Country`,`Name`),
  KEY `Code` (`Code`),
  KEY `LocationID` (`ID`) USING BTREE,
  KEY `ParentID` (`ParentID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.location2
CREATE TABLE IF NOT EXISTS `location2` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Code` varchar(8) DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `State` varchar(10) DEFAULT 'Created',
  `Country` varchar(2) DEFAULT NULL,
  `Region` varchar(3) DEFAULT NULL,
  `Status` varchar(2) DEFAULT NULL,
  `Type` varchar(10) DEFAULT NULL,
  `IATA` varchar(4) DEFAULT NULL,
  `Latitude` double DEFAULT NULL,
  `Longitude` double DEFAULT NULL,
  `Altitude` double DEFAULT '0',
  `Notes` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `Country` (`Country`,`Name`),
  KEY `Code` (`Code`),
  KEY `LocationID` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.manager_to_channel
CREATE TABLE IF NOT EXISTS `manager_to_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_manager_id` int(11) NOT NULL,
  `channel_partner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `ix_channel_partner_id` (`channel_partner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.manager_to_gateway
CREATE TABLE IF NOT EXISTS `manager_to_gateway` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` datetime DEFAULT NULL,
  `payment_gateway_id` int(11) DEFAULT NULL,
  `funds_holder` tinyint(4) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `gateway_code` varchar(255) DEFAULT NULL,
  `gateway_account_id` varchar(255) DEFAULT NULL,
  `additional_info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.monitor
CREATE TABLE IF NOT EXISTS `monitor` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(750) DEFAULT NULL,
  `Count` int(10) unsigned DEFAULT NULL,
  `Duration` double DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 DELAY_KEY_WRITE=1;

-- Data exporting was unselected.


-- Dumping structure for table razor.partner
CREATE TABLE IF NOT EXISTS `partner` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OrganizationID` int(10) unsigned DEFAULT NULL,
  `PartyID` int(10) unsigned DEFAULT NULL,
  `PartyName` varchar(100) DEFAULT NULL,
  `State` varchar(15) DEFAULT NULL,
  `BookEmailAddress` varchar(255) DEFAULT NULL,
  `BookWebAddress` varchar(255) DEFAULT NULL,
  `ApiKey` varchar(255) DEFAULT NULL,
  `Currency` varchar(3) DEFAULT 'USD',
  `DateFormat` varchar(15) DEFAULT NULL,
  `WebAddress` varchar(255) DEFAULT NULL,
  `AlertCron` varchar(15) DEFAULT NULL,
  `PriceCron` varchar(15) DEFAULT NULL,
  `ProductCron` varchar(15) DEFAULT NULL,
  `ScheduleCron` varchar(15) DEFAULT NULL,
  `AlertWait` int(10) unsigned DEFAULT '0',
  `PriceWait` int(10) unsigned DEFAULT '0',
  `ProductWait` int(10) unsigned DEFAULT '0',
  `ScheduleWait` int(10) unsigned DEFAULT '0',
  `SpecialWait` int(10) unsigned DEFAULT '0',
  `SpecialCron` varchar(15) DEFAULT NULL,
  `Commission` double DEFAULT NULL,
  `Discount` double DEFAULT NULL,
  `Subscription` double DEFAULT '0',
  `Transaction` double DEFAULT '0',
  `BookOffline` bit(1) DEFAULT b'0',
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SupportsCreditCard` tinyint(1) DEFAULT '0',
  `SendConfirmationEmails` tinyint(1) DEFAULT '0',
  `RegisterEmptyProperties` tinyint(1) unsigned DEFAULT '0',
  `SeparatePMAccounts` tinyint(1) unsigned DEFAULT '0',
  `Abbrevation` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Abbrevation_UNIQUE` (`Abbrevation`),
  KEY `OrganizationID` (`OrganizationID`,`PartyName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.party
CREATE TABLE IF NOT EXISTS `party` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `EmployerID` int(10) unsigned DEFAULT NULL,
  `CreatorID` int(10) unsigned DEFAULT NULL,
  `LocationID` int(10) unsigned DEFAULT NULL,
  `FinanceID` int(10) unsigned DEFAULT NULL,
  `JurisdictionID` int(10) unsigned DEFAULT NULL,
  `AltPartyID` int(10) unsigned DEFAULT NULL,
  `AltID` varchar(32) DEFAULT NULL,
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `State` varchar(15) DEFAULT NULL,
  `Options` varchar(15) DEFAULT NULL,
  `ExtraName` varchar(50) DEFAULT NULL,
  `IdentityNumber` varchar(20) DEFAULT NULL,
  `TaxNumber` varchar(20) DEFAULT NULL,
  `PostalAddress` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `Country` varchar(3) DEFAULT 'ZA',
  `EmailAddress` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `WebAddress` varchar(100) DEFAULT NULL,
  `DayPhone` varchar(30) DEFAULT NULL,
  `NightPhone` varchar(30) DEFAULT NULL,
  `FaxPhone` varchar(30) DEFAULT NULL,
  `MobilePhone` varchar(30) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `Birthdate` datetime DEFAULT NULL,
  `Language` varchar(2) DEFAULT 'EN',
  `Currency` varchar(3) DEFAULT NULL,
  `Unit` varchar(3) DEFAULT NULL,
  `FormatDate` varchar(15) DEFAULT 'MM/dd/yyyy',
  `FormatPhone` varchar(25) DEFAULT '(###)###-####',
  `Latitude` double DEFAULT NULL,
  `Longitude` double DEFAULT NULL,
  `Altitude` double DEFAULT '0',
  `Rank` int(10) unsigned DEFAULT '0',
  `Notes` varchar(5000) CHARACTER SET utf8 DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UserType` varchar(20) DEFAULT NULL COMMENT 'ChannelPartner, PropertyManager,..',
  `skip_license` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `EmailAddress` (`EmailAddress`) USING BTREE,
  KEY `Name` (`Name`,`ID`) USING BTREE,
  KEY `EmployerID` (`EmployerID`,`State`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 15360 kB';

-- Data exporting was unselected.


-- Dumping structure for table razor.payment_gateway_provider
CREATE TABLE IF NOT EXISTS `payment_gateway_provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `fee` tinyint(4) DEFAULT NULL,
  `autopay` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.payment_method
CREATE TABLE IF NOT EXISTS `payment_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pmid` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `payment_info` varchar(300) DEFAULT NULL,
  `entry_date_time` datetime DEFAULT NULL,
  `amount` float(5,2) DEFAULT NULL,
  `verified_date` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.payment_register
CREATE TABLE IF NOT EXISTS `payment_register` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_date_time` datetime DEFAULT NULL,
  `reservation_id` int(10) DEFAULT NULL,
  `property_id` int(10) DEFAULT NULL,
  `pm_id` int(10) DEFAULT NULL,
  `partner_id` int(10) DEFAULT NULL,
  `payment_transaction_id` int(10) DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL,
  `cleared` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.payment_transaction
CREATE TABLE IF NOT EXISTS `payment_transaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime DEFAULT NULL,
  `server_id` int(11) DEFAULT NULL,
  `reservation_id` int(11) DEFAULT NULL,
  `pms_confirmation_id` int(11) DEFAULT NULL,
  `payment_method` int(11) DEFAULT NULL,
  `gateway_transaction_id` varchar(100) DEFAULT NULL,
  `gateway_id` int(11) DEFAULT NULL,
  `funds_holder` tinyint(4) DEFAULT NULL,
  `partial_iin` int(11) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `message` varchar(1000) DEFAULT NULL,
  `partner_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `charge_date` datetime DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `currency` varchar(100) DEFAULT NULL,
  `total_commission` double DEFAULT NULL,
  `partner_payment` double DEFAULT NULL,
  `total_bookingpal_payment` double DEFAULT NULL,
  `final_amount` double DEFAULT NULL,
  `credit_card_fee` double DEFAULT NULL,
  `charge_type` varchar(100) DEFAULT NULL,
  `net_rate` tinyint(1) NOT NULL DEFAULT '0',
  `pm_commission_value` double DEFAULT NULL,
  `partner_commission_value` double DEFAULT NULL,
  `additional_commission_value` double DEFAULT NULL,
  `pms_payment` double DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.pending_transaction
CREATE TABLE IF NOT EXISTS `pending_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entry_date_time` datetime DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `pms_confirmation_id` int(15) DEFAULT NULL,
  `payment_gateway_id` int(11) DEFAULT NULL,
  `funds_holder` int(11) DEFAULT NULL,
  `partial_iin` int(11) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `phone_number` varchar(100) DEFAULT NULL,
  `partner_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `charge_date` date DEFAULT NULL,
  `charge_amount` double DEFAULT NULL,
  `currency` varchar(100) DEFAULT NULL,
  `commission` double DEFAULT NULL,
  `partner_payment` double DEFAULT NULL,
  `bookingpal_payment` double DEFAULT NULL,
  `gateway_transaction_id` varchar(100) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `autopay` tinyint(1) DEFAULT NULL,
  `credit_card_fee` double DEFAULT NULL,
  `net_rate` tinyint(1) DEFAULT NULL,
  `pm_commission_value` double DEFAULT NULL,
  `pms_payment` double DEFAULT NULL,
  `additional_commission_value` double DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.place
CREATE TABLE IF NOT EXISTS `place` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Code` varchar(45) DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `LocationID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Code` (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.price
CREATE TABLE IF NOT EXISTS `price` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `EntityType` varchar(15) DEFAULT NULL,
  `EntityID` int(10) unsigned DEFAULT NULL,
  `PartyID` int(10) unsigned DEFAULT NULL,
  `Name` varchar(50) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `State` varchar(15) DEFAULT NULL,
  `Type` varchar(50) DEFAULT 'Reservation',
  `Date` date DEFAULT NULL,
  `ToDate` date DEFAULT NULL,
  `Quantity` double DEFAULT '0',
  `Unit` varchar(3) DEFAULT NULL,
  `Value` double DEFAULT NULL,
  `Minimum` double NOT NULL DEFAULT '0',
  `Factor` double DEFAULT '1',
  `Currency` varchar(3) DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Cost` double DEFAULT '0',
  `Available` int(10) unsigned DEFAULT '1',
  `SupplierID` int(10) unsigned DEFAULT NULL,
  `Payer` varchar(15) DEFAULT 'Unknown',
  `Rule` varchar(25) DEFAULT 'Manual',
  `AltID` varchar(20) DEFAULT NULL,
  `Minstay` int(11) DEFAULT '1',
  `Maxstay` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `Entity` (`EntityType`,`EntityID`,`PartyID`,`Date`,`ToDate`,`State`) USING BTREE,
  KEY `alt_price_lookup` (`EntityType`,`EntityID`,`PartyID`,`AltID`),
  KEY `ix_Date` (`Date`),
  KEY `ix_price_Entity_Dates` (`EntityID`,`Date`,`ToDate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 12288 kB';

-- Data exporting was unselected.


-- Dumping structure for table razor.product
CREATE TABLE IF NOT EXISTS `product` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `PartofID` int(10) unsigned DEFAULT NULL,
  `OwnerID` int(10) DEFAULT NULL,
  `LocationID` int(10) DEFAULT NULL,
  `SupplierID` int(10) DEFAULT NULL,
  `AltPartyID` int(10) unsigned DEFAULT NULL,
  `AltID` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `Name` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `State` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `Options` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `Type` varchar(25) CHARACTER SET latin1 DEFAULT NULL,
  `WebAddress` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `Tax` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `Code` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `Unspsc` varchar(8) CHARACTER SET latin1 DEFAULT NULL,
  `Servicedays` varchar(7) CHARACTER SET latin1 DEFAULT '0111111',
  `Currency` varchar(3) CHARACTER SET latin1 DEFAULT NULL,
  `Unit` varchar(3) CHARACTER SET latin1 DEFAULT NULL,
  `Room` int(10) unsigned DEFAULT '1',
  `Bathroom` int(10) unsigned DEFAULT '1',
  `Toilet` int(10) unsigned DEFAULT '1',
  `Floor` int(10) unsigned DEFAULT '1',
  `Space` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `Quantity` int(10) unsigned DEFAULT '1',
  `Person` int(10) unsigned DEFAULT '2',
  `Child` int(10) unsigned DEFAULT '0',
  `Infant` int(10) unsigned DEFAULT '0',
  `Baby` int(10) unsigned DEFAULT '0',
  `Linenchange` int(10) unsigned DEFAULT '3',
  `Rating` int(10) unsigned DEFAULT '6',
  `Refresh` int(10) unsigned DEFAULT '1',
  `Commission` double DEFAULT '20',
  `CheckInTime` time NOT NULL DEFAULT '10:30:00',
  `CheckOutTime` time NOT NULL DEFAULT '10:30:00',
  `Discount` double DEFAULT '20',
  `OwnerDiscount` double DEFAULT '0',
  `Rank` double DEFAULT '0',
  `DynamicPricingEnabled` tinyint(1) unsigned DEFAULT '0',
  `Latitude` double DEFAULT '0',
  `Longitude` double DEFAULT '0',
  `Altitude` double DEFAULT '0',
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Physicaladdress` varchar(100) DEFAULT NULL,
  `AltSupplierID` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  `AssignedtoManager` tinyint(1) unsigned DEFAULT '0',
  `CleaningFee` double DEFAULT '0',
  `SecurityDeposit` double DEFAULT '0',
  `UseOnePriceRow` tinyint(1) DEFAULT '0',
  `inquire_state` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `DisplayAddress` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `Name` (`Name`,`SupplierID`) USING BTREE,
  KEY `Code` (`Code`),
  KEY `LocationID` (`LocationID`),
  KEY `OwnerID` (`OwnerID`),
  KEY `PartofID` (`PartofID`,`Name`),
  KEY `alt_product_lookup` (`AltID`,`AltPartyID`),
  KEY `ix_product_SupplierID` (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table razor.product_backup
CREATE TABLE IF NOT EXISTS `product_backup` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `PartofID` int(10) unsigned DEFAULT NULL,
  `OwnerID` int(10) DEFAULT NULL,
  `LocationID` int(10) DEFAULT NULL,
  `SupplierID` int(10) DEFAULT NULL,
  `AltPartyID` int(10) unsigned DEFAULT NULL,
  `AltID` varchar(15) DEFAULT NULL,
  `Name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `State` varchar(15) DEFAULT NULL,
  `Options` varchar(15) DEFAULT NULL,
  `Type` varchar(25) DEFAULT NULL,
  `WebAddress` varchar(255) DEFAULT NULL,
  `Tax` varchar(15) DEFAULT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `Unspsc` varchar(8) DEFAULT NULL,
  `Servicedays` varchar(7) DEFAULT '0111111',
  `Currency` varchar(3) DEFAULT NULL,
  `Unit` varchar(3) DEFAULT NULL,
  `Room` int(10) unsigned DEFAULT '1',
  `Bathroom` int(10) unsigned DEFAULT '1',
  `Toilet` int(10) unsigned DEFAULT '1',
  `Quantity` int(10) unsigned DEFAULT '1',
  `Person` int(10) unsigned DEFAULT '2',
  `Child` int(10) unsigned DEFAULT '0',
  `Infant` int(10) unsigned DEFAULT '0',
  `Baby` int(10) unsigned DEFAULT '0',
  `Linenchange` int(10) unsigned DEFAULT '3',
  `Rating` int(10) unsigned DEFAULT '6',
  `Refresh` int(10) unsigned DEFAULT '1',
  `Commission` double DEFAULT '20',
  `Discount` double DEFAULT '20',
  `OwnerDiscount` double DEFAULT '0',
  `Rank` double DEFAULT '0',
  `DynamicPricingEnabled` tinyint(1) unsigned DEFAULT '0',
  `Latitude` double DEFAULT '0',
  `Longitude` double DEFAULT '0',
  `Altitude` double DEFAULT '0',
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Physicaladdress` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `AltSupplierID` varchar(15) DEFAULT NULL,
  `AssignedtoManager` tinyint(1) unsigned DEFAULT '0',
  `CleaningFee` double DEFAULT '0',
  `SecurityDeposit` double DEFAULT '0',
  `UseOnePriceRow` tinyint(1) DEFAULT '0',
  `inquire_state` varchar(20) DEFAULT NULL,
  `DisplayAddress` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `Name` (`Name`,`SupplierID`) USING BTREE,
  KEY `Code` (`Code`),
  KEY `LocationID` (`LocationID`),
  KEY `OwnerID` (`OwnerID`),
  KEY `PartofID` (`PartofID`,`Name`),
  KEY `alt_product_lookup` (`AltID`,`AltPartyID`),
  KEY `ix_product_SupplierID` (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.product_export_settings
CREATE TABLE IF NOT EXISTS `product_export_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `altpartyid` int(10) NOT NULL,
  `variable` varchar(50) NOT NULL,
  `settings_value` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_per_partner` (`altpartyid`,`variable`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.product_filter_settings
CREATE TABLE IF NOT EXISTS `product_filter_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `altpartyid` int(10) NOT NULL,
  `filter_by` varchar(50) NOT NULL,
  `filter_values` varchar(500) NOT NULL,
  `opr_type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_per_partner` (`filter_by`,`altpartyid`,`opr_type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.product_rooms
CREATE TABLE IF NOT EXISTS `product_rooms` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` varchar(45) NOT NULL,
  `room_id` varchar(45) NOT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.product_update_settings
CREATE TABLE IF NOT EXISTS `product_update_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `altpartyid` int(10) NOT NULL,
  `field` varchar(50) NOT NULL,
  `update_interval_as_cron` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_per_partner` (`field`,`altpartyid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.property_manager_cancellation_rule
CREATE TABLE IF NOT EXISTS `property_manager_cancellation_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pm_id` int(11) NOT NULL,
  `cancellation_date` varchar(50) NOT NULL,
  `cancellation_refund` int(11) NOT NULL DEFAULT '0',
  `cancellation_transaction_fee` double NOT NULL DEFAULT '0',
  `cancellation_rule_type` int(11) NOT NULL DEFAULT '1',
  `cancellation_nights` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.property_manager_configuration
CREATE TABLE IF NOT EXISTS `property_manager_configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `validation` int(11) DEFAULT '0',
  `initialization` int(11) DEFAULT '0',
  `price` int(11) DEFAULT '0',
  `availability` int(11) DEFAULT '0',
  `payment` int(11) DEFAULT '0',
  `partner_reservation` int(11) DEFAULT '0',
  `verify_and_cancel` int(11) DEFAULT '0',
  `payment_transaction` int(11) DEFAULT '0',
  `format` int(11) DEFAULT '0',
  `send_admin_email` int(11) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.property_manager_info
CREATE TABLE IF NOT EXISTS `property_manager_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pm_id` int(11) NOT NULL,
  `pms_id` int(11) DEFAULT NULL,
  `funds_holder` tinyint(4) DEFAULT NULL,
  `payment_processing_type` tinyint(4) DEFAULT NULL,
  `registration_step_id` int(10) unsigned DEFAULT NULL,
  `damage_coverage_type` tinyint(4) DEFAULT NULL,
  `damage_insurance` varchar(255) DEFAULT NULL,
  `cancellation_type` tinyint(4) DEFAULT NULL,
  `cancelation_date` varchar(50) DEFAULT NULL,
  `cancelation_refund` int(10) unsigned DEFAULT NULL,
  `cancelation_transaction_fee` double DEFAULT NULL,
  `number_of_payments` int(11) DEFAULT NULL,
  `payment_amount` double DEFAULT NULL,
  `payment_type` int(10) unsigned DEFAULT NULL,
  `remainder_payment_date` int(10) unsigned DEFAULT NULL,
  `new_registration` tinyint(1) unsigned DEFAULT NULL,
  `created_date` date NOT NULL DEFAULT '2000-01-01',
  `check_in_time` time DEFAULT '10:30:00',
  `check_out_time` time DEFAULT '10:30:00',
  `terms_link` varchar(255) DEFAULT NULL,
  `inquire_only` tinyint(1) DEFAULT '0',
  `commission` double DEFAULT NULL,
  `net_rate` tinyint(1) NOT NULL DEFAULT '0',
  `bp_commission` double DEFAULT NULL,
  `pms_markup` double DEFAULT NULL,
  `additional_commission` double(7,2) DEFAULT NULL,
  `configuration_id` int(11) DEFAULT '1',
  `pm_time` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.property_manager_support_cc
CREATE TABLE IF NOT EXISTS `property_manager_support_cc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `party_id` int(11) NOT NULL,
  `MC` tinyint(4) DEFAULT NULL,
  `VISA` tinyint(4) DEFAULT NULL,
  `AE` tinyint(4) DEFAULT NULL,
  `DISCOVER` tinyint(4) DEFAULT NULL,
  `DINERSCLUB` tinyint(4) DEFAULT NULL,
  `JCB` tinyint(4) DEFAULT NULL,
  `none` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table razor.property_min_stay
CREATE TABLE IF NOT EXISTS `property_min_stay` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SupplierID` int(10) DEFAULT NULL,
  `ProductID` int(15) DEFAULT NULL,
  `FromDate` date NOT NULL DEFAULT '1970-01-01',
  `ToDate` date NOT NULL DEFAULT '1970-01-01',
  `Value` int(10) DEFAULT '1',
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `fromDate` (`FromDate`),
  KEY `toDate` (`ToDate`),
  KEY `product` (`ProductID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.rate
CREATE TABLE IF NOT EXISTS `rate` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `EventID` int(10) unsigned DEFAULT NULL,
  `CustomerID` int(10) unsigned DEFAULT NULL,
  `ProductID` int(10) unsigned DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `State` varchar(15) DEFAULT NULL,
  `Type` varchar(10) DEFAULT NULL,
  `Quantity` int(10) unsigned DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.region
CREATE TABLE IF NOT EXISTS `region` (
  `ID` varchar(3) NOT NULL,
  `Country` varchar(2) NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`,`Country`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.relation
CREATE TABLE IF NOT EXISTS `relation` (
  `Index` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Link` varchar(50) NOT NULL,
  `HeadID` varchar(50) NOT NULL,
  `LineID` varchar(50) NOT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Index`),
  KEY `HeadID` (`HeadID`,`Link`,`Index`),
  KEY `LineID` (`LineID`,`Link`,`Index`),
  KEY `Link` (`Link`,`HeadID`,`Index`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table razor.report
CREATE TABLE IF NOT EXISTS `report` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OrganizationID` varchar(10) DEFAULT NULL,
  `ActorID` varchar(10) DEFAULT NULL,
  `AccountID` varchar(10) DEFAULT NULL,
  `EntityID` varchar(10) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `State` varchar(15) DEFAULT NULL,
  `Process` varchar(15) DEFAULT NULL,
  `Design` varchar(45) DEFAULT NULL,
  `FromName` varchar(255) DEFAULT NULL,
  `ToName` varchar(255) DEFAULT NULL,
  `FromDate` datetime DEFAULT NULL,
  `ToDate` datetime DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `Groupby` varchar(10) DEFAULT NULL,
  `Currency` varchar(3) DEFAULT NULL,
  `Language` varchar(2) DEFAULT 'EN',
  `Notes` varchar(10000) DEFAULT NULL,
  `Format` varchar(5) DEFAULT 'PDF',
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `States` varchar(255) DEFAULT '-1',
  `Types` varchar(1000) DEFAULT '-1',
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `DesignID` (`Design`,`Date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.reservation
CREATE TABLE IF NOT EXISTS `reservation` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ParentID` int(10) unsigned DEFAULT NULL,
  `OrganizationID` int(10) unsigned DEFAULT NULL,
  `ActorID` int(10) unsigned DEFAULT NULL,
  `AgentID` int(10) unsigned DEFAULT NULL,
  `CustomerID` int(10) unsigned DEFAULT NULL,
  `ServiceID` int(10) unsigned DEFAULT NULL,
  `FinanceID` int(10) unsigned DEFAULT NULL,
  `ProductID` int(10) unsigned DEFAULT NULL,
  `AltPartyID` int(10) unsigned DEFAULT NULL,
  `AltID` varchar(15) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `State` varchar(15) DEFAULT NULL,
  `Flat` varchar(15) DEFAULT ' ',
  `Market` varchar(30) DEFAULT NULL,
  `Outcome` varchar(30) DEFAULT NULL,
  `Unit` varchar(3) DEFAULT NULL,
  `ArrivalTime` time DEFAULT '14:00:00',
  `DepartureTime` time DEFAULT '10:00:00',
  `ServiceFrom` time DEFAULT '10:00:00',
  `ServiceTo` time DEFAULT '18:00:00',
  `Date` date DEFAULT NULL,
  `FromDate` date DEFAULT NULL,
  `ToDate` date DEFAULT NULL,
  `DueDate` date DEFAULT NULL,
  `DoneDate` date DEFAULT NULL,
  `Deposit` double DEFAULT '0',
  `Price` double DEFAULT '0',
  `Extra` double DEFAULT '0',
  `Quote` double DEFAULT '0',
  `Cost` double DEFAULT '0',
  `Currency` varchar(3) DEFAULT 'USD',
  `Servicepayer` varchar(10) DEFAULT NULL,
  `TermsAccepted` tinyint(3) unsigned DEFAULT '0',
  `Adult` int(10) unsigned DEFAULT '2',
  `Child` int(10) unsigned DEFAULT '0',
  `Infant` int(10) unsigned DEFAULT '0',
  `Quantity` int(10) unsigned DEFAULT '1',
  `CardHolder` varchar(100) DEFAULT NULL,
  `CardNumber` varchar(100) DEFAULT NULL,
  `CardMonth` varchar(100) DEFAULT NULL,
  `CardYear` varchar(100) DEFAULT NULL,
  `CardCode` varchar(100) DEFAULT NULL,
  `Notes` varchar(3000) DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ServiceTime` time DEFAULT '10:00:00',
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `OrganizationID` (`OrganizationID`,`Name`),
  KEY `Name` (`Name`,`OrganizationID`) USING BTREE,
  KEY `ParentID` (`ParentID`,`ID`) USING BTREE,
  KEY `State` (`State`,`ID`) USING BTREE,
  KEY `ArrivalDate` (`FromDate`,`ToDate`) USING BTREE,
  KEY `DepartureDate` (`ToDate`,`FromDate`) USING BTREE,
  KEY `ProductID` (`ProductID`,`State`),
  KEY `ProductFromDate` (`ProductID`,`FromDate`,`State`),
  KEY `ProductToDate` (`ProductID`,`ToDate`,`State`),
  KEY `AgentID` (`AgentID`,`ID`),
  KEY `alt_reservation_lookup` (`AltPartyID`,`AltID`,`version`),
  KEY `ReservationReportDate` (`Date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 13312 kB; InnoDB free: 57344 kB';

-- Data exporting was unselected.


-- Dumping structure for table razor.reservation_ext
CREATE TABLE IF NOT EXISTS `reservation_ext` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `AltID` varchar(20) DEFAULT NULL,
  `ReservationID` varchar(50) DEFAULT NULL,
  `PartyID` int(10) unsigned DEFAULT NULL,
  `Name` varchar(50) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `State` varchar(15) DEFAULT NULL,
  `Addon_Type` varchar(50) NOT NULL,
  `Type` varchar(5) NOT NULL,
  `Quantity` double DEFAULT '0',
  `Unit` varchar(3) DEFAULT NULL,
  `Value` double DEFAULT NULL,
  `Minimum` double DEFAULT '0',
  `Factor` double DEFAULT '1',
  `Currency` varchar(3) DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Cost` double DEFAULT '0',
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `Addon` (`ReservationID`,`Addon_Type`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.role
CREATE TABLE IF NOT EXISTS `role` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ParentID` int(10) DEFAULT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `State` varchar(30) DEFAULT NULL,
  `Notes` varchar(2000) DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `ParentID` (`ParentID`,`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.route
CREATE TABLE IF NOT EXISTS `route` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FromID` int(10) unsigned DEFAULT NULL,
  `ToID` int(10) unsigned DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `State` varchar(15) DEFAULT NULL,
  `Distance` double DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `From` (`FromID`,`ToID`),
  KEY `To` (`ToID`,`FromID`),
  KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.scratch
CREATE TABLE IF NOT EXISTS `scratch` (
  `ID` varchar(15) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `State` varchar(15) DEFAULT NULL,
  `A` varchar(45) DEFAULT NULL,
  `B` varchar(45) DEFAULT NULL,
  `C` varchar(45) DEFAULT NULL,
  `D` varchar(45) DEFAULT NULL,
  `E` varchar(45) DEFAULT NULL,
  `F` varchar(45) DEFAULT NULL,
  `G` varchar(45) DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `Name` (`Name`),
  KEY `A` (`A`) USING BTREE,
  KEY `B` (`B`) USING BTREE,
  KEY `C` (`C`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.serial
CREATE TABLE IF NOT EXISTS `serial` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PartyID` int(10) unsigned DEFAULT NULL,
  `Series` varchar(24) DEFAULT NULL,
  `Format` varchar(24) NOT NULL,
  `Last` int(10) unsigned NOT NULL DEFAULT '0',
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.session
CREATE TABLE IF NOT EXISTS `session` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ActorID` int(10) unsigned NOT NULL,
  `Login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Logout` datetime DEFAULT '0000-00-00 00:00:00',
  `Counter` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.special
CREATE TABLE IF NOT EXISTS `special` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ProductID` int(10) unsigned DEFAULT '0',
  `SupplierID` int(10) unsigned DEFAULT NULL,
  `Startdate` date DEFAULT NULL,
  `Enddate` date DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `Quote` double DEFAULT NULL,
  `Currency` varchar(3) DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `Date` (`Startdate`,`Enddate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.state_code
CREATE TABLE IF NOT EXISTS `state_code` (
  `name` varchar(50) NOT NULL,
  `abbrevation` varchar(50) NOT NULL,
  `code` varchar(2) NOT NULL,
  `country_code` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.subdivision
CREATE TABLE IF NOT EXISTS `subdivision` (
  `ID` varchar(3) NOT NULL,
  `Country` varchar(2) NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`,`Country`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.task
CREATE TABLE IF NOT EXISTS `task` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ParentID` int(10) unsigned DEFAULT NULL,
  `OrganizationID` int(10) unsigned DEFAULT NULL,
  `ActorID` int(10) unsigned DEFAULT NULL,
  `CustomerID` int(10) unsigned DEFAULT NULL,
  `ProductID` int(10) unsigned DEFAULT NULL,
  `LocationID` int(10) unsigned DEFAULT NULL,
  `ResourceType` varchar(15) DEFAULT 'Supplier',
  `Name` varchar(15) DEFAULT NULL,
  `State` varchar(15) DEFAULT NULL,
  `Process` varchar(15) DEFAULT NULL,
  `Starter` varchar(50) DEFAULT NULL,
  `Outcome` varchar(50) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `FromDate` datetime DEFAULT NULL,
  `DueDate` datetime DEFAULT NULL,
  `DoneDate` datetime DEFAULT NULL,
  `Quantity` double DEFAULT NULL,
  `Unit` varchar(3) DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `Cost` double DEFAULT NULL,
  `Currency` varchar(3) DEFAULT NULL,
  `Notes` varchar(1000) DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.tax
CREATE TABLE IF NOT EXISTS `tax` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `AccountID` int(10) unsigned DEFAULT '0',
  `PartyID` int(10) unsigned DEFAULT NULL,
  `ProductID` int(10) unsigned DEFAULT NULL,
  `Name` varchar(50) DEFAULT ' ',
  `State` varchar(15) DEFAULT NULL,
  `Type` varchar(20) DEFAULT NULL,
  `Currency` varchar(3) DEFAULT 'USD',
  `Notes` varchar(1000) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `Threshold` int(10) DEFAULT NULL,
  `Amount` double(15,5) DEFAULT NULL,
  `MandatoryType` varchar(20) DEFAULT 'MandatoryTax',
  `AltID` varchar(100) DEFAULT NULL,
  `OptionValue` varchar(100) DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `AccountID` (`AccountID`),
  KEY `PartyID` (`PartyID`),
  KEY `TypeID` (`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.text
CREATE TABLE IF NOT EXISTS `text` (
  `ID` varchar(50) NOT NULL,
  `Language` varchar(2) NOT NULL DEFAULT 'EN',
  `Value` varchar(45) DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `State` varchar(15) DEFAULT 'Created',
  `Type` varchar(10) DEFAULT NULL,
  `Data` blob,
  `Date` datetime DEFAULT NULL,
  `Notes` varchar(20000) CHARACTER SET utf8 DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`,`Language`) USING BTREE,
  KEY `Name` (`Name`,`ID`,`Language`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 10240 kB';

-- Data exporting was unselected.


-- Dumping structure for table razor.timeline
CREATE TABLE IF NOT EXISTS `timeline` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `Date` (`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.type
CREATE TABLE IF NOT EXISTS `type` (
  `ID` varchar(45) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Language` varchar(3) NOT NULL DEFAULT 'en',
  `Type` varchar(15) DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`,`Language`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.unit
CREATE TABLE IF NOT EXISTS `unit` (
  `ID` varchar(3) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Type` varchar(15) DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.unspsc
CREATE TABLE IF NOT EXISTS `unspsc` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Level` varchar(1) DEFAULT NULL,
  `Code` varchar(8) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `Level` (`Level`,`Code`),
  KEY `Code` (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.used
CREATE TABLE IF NOT EXISTS `used` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TaskID` int(11) DEFAULT NULL,
  `EntityType` varchar(15) DEFAULT NULL,
  `EntityID` int(11) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Quantity` double DEFAULT NULL,
  `Unit` varchar(3) DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.workflow
CREATE TABLE IF NOT EXISTS `workflow` (
  `Sequence` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ID` int(11) NOT NULL DEFAULT '0',
  `Process` varchar(15) NOT NULL,
  `State` varchar(15) NOT NULL,
  `Datename` varchar(25) NOT NULL,
  `Enabled` bit(1) DEFAULT NULL,
  `Prior` bit(1) DEFAULT NULL,
  `Duration` int(10) unsigned DEFAULT NULL,
  `Unit` varchar(3) DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Sequence`) USING BTREE,
  UNIQUE KEY `ID` (`ID`,`Process`,`State`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table razor.yield
CREATE TABLE IF NOT EXISTS `yield` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `EntityType` varchar(15) DEFAULT NULL,
  `EntityID` int(10) unsigned DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `State` varchar(25) DEFAULT NULL,
  `FromDate` datetime DEFAULT NULL,
  `ToDate` datetime DEFAULT NULL,
  `Param` int(10) unsigned DEFAULT '0',
  `Amount` double DEFAULT NULL,
  `Modifier` varchar(25) DEFAULT NULL,
  `version` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `Entity` (`EntityType`,`EntityID`,`State`),
  KEY `Name` (`Name`,`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
