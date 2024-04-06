CREATE DATABASE  IF NOT EXISTS `sistemaelettoraleingsw` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sistemaelettoraleingsw`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: sistemaelettoraleingsw
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `candidatielezione`
--

DROP TABLE IF EXISTS `candidatielezione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidatielezione` (
  `elezione_fk` int NOT NULL,
  `candidato_fk` int NOT NULL,
  PRIMARY KEY (`elezione_fk`,`candidato_fk`),
  KEY `candElez_cand|candidato_fk_idx` (`candidato_fk`),
  CONSTRAINT `candElez_cand|candidato_fk` FOREIGN KEY (`candidato_fk`) REFERENCES `candidato` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `candElez_elez|elezione_fk` FOREIGN KEY (`elezione_fk`) REFERENCES `elezione` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidatielezione`
--

LOCK TABLES `candidatielezione` WRITE;
/*!40000 ALTER TABLE `candidatielezione` DISABLE KEYS */;
INSERT INTO `candidatielezione` VALUES (2,1),(3,1),(21,1),(23,1),(3,2),(21,2),(23,2),(2,3),(18,3),(19,3),(21,3),(23,3),(3,4),(18,4),(21,4),(23,4),(3,5),(18,5),(19,5),(21,5),(23,5),(18,6),(19,6),(21,6),(23,6),(19,8),(21,8),(23,8);
/*!40000 ALTER TABLE `candidatielezione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidativotati`
--

DROP TABLE IF EXISTS `candidativotati`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidativotati` (
  `votoElezione_fk` int NOT NULL,
  `candidato_fk` int NOT NULL,
  `posizioneVoto` int DEFAULT NULL,
  PRIMARY KEY (`votoElezione_fk`,`candidato_fk`),
  KEY `candVot_canidato|candidato_fk_idx` (`candidato_fk`),
  CONSTRAINT `candVot_canidato|candidato_fk` FOREIGN KEY (`candidato_fk`) REFERENCES `candidato` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `candVot_votoElez|elezione_fk` FOREIGN KEY (`votoElezione_fk`) REFERENCES `votoelezione` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidativotati`
--

LOCK TABLES `candidativotati` WRITE;
/*!40000 ALTER TABLE `candidativotati` DISABLE KEYS */;
INSERT INTO `candidativotati` VALUES (25,2,NULL),(25,6,NULL),(30,2,1),(30,5,2),(39,3,1),(39,4,2),(39,5,3),(39,6,4),(40,3,1),(40,6,2);
/*!40000 ALTER TABLE `candidativotati` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `candidativotatielezioni`
--

DROP TABLE IF EXISTS `candidativotatielezioni`;
/*!50001 DROP VIEW IF EXISTS `candidativotatielezioni`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `candidativotatielezioni` AS SELECT 
 1 AS `votoId`,
 1 AS `isWhiteVote`,
 1 AS `idElezione`,
 1 AS `idCandidatoVotato`,
 1 AS `posizioneVotoCandidato`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `candidato`
--

DROP TABLE IF EXISTS `candidato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidato` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cognome` varchar(45) NOT NULL,
  `dataNascita` datetime NOT NULL,
  `partitoAppartenenza_fk` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `can_Part|partito_fk_idx` (`partitoAppartenenza_fk`),
  CONSTRAINT `can_Part|partito_fk` FOREIGN KEY (`partitoAppartenenza_fk`) REFERENCES `partito` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato`
--

LOCK TABLES `candidato` WRITE;
/*!40000 ALTER TABLE `candidato` DISABLE KEYS */;
INSERT INTO `candidato` VALUES (1,'Massimo','Gigli','1953-11-21 00:00:00',2),(2,'Piero','Giozatta','1975-02-05 00:00:00',1),(3,'Giovanni','Pellegatta','1997-07-14 00:00:00',3),(4,'Fabrizio','Cordoba','1967-01-23 00:00:00',2),(5,'Francesca','Repetto','1966-09-22 00:00:00',1),(6,'Giovanna','Ligornetto','2001-03-07 00:00:00',1),(8,'Letizia','Fantinato','1932-08-01 00:00:00',5);
/*!40000 ALTER TABLE `candidato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elettore`
--

DROP TABLE IF EXISTS `elettore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elettore` (
  `CodiceFiscale` varchar(16) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Cognome` varchar(45) NOT NULL,
  PRIMARY KEY (`CodiceFiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elettore`
--

LOCK TABLES `elettore` WRITE;
/*!40000 ALTER TABLE `elettore` DISABLE KEYS */;
INSERT INTO `elettore` VALUES ('AAABBB00A01L000A','Shanty','Ayala'),('AAABBB00A01L000N','Massimiliano','Visconti'),('AAABBB00A01L000O','Jack','Tornado'),('AAABBB00A01L000P','Giorgio','Piano'),('VSCMSM','Massimiliano','Visconti');
/*!40000 ALTER TABLE `elettore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elettorehasvoted`
--

DROP TABLE IF EXISTS `elettorehasvoted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elettorehasvoted` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idelettore_fk` varchar(16) NOT NULL,
  `idElezione_fk` int DEFAULT NULL,
  `idReferendum_fk` int DEFAULT NULL,
  `dataOra` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `elettHasVot_Elett|elettore_fk_idx` (`idelettore_fk`),
  KEY `elettHasVot_Elez|idElez_fk_idx` (`idElezione_fk`),
  KEY `elettHasVot_Refe|idRefe_fk_idx` (`idReferendum_fk`),
  CONSTRAINT `elettHasVot_Elett|elettore_fk` FOREIGN KEY (`idelettore_fk`) REFERENCES `elettore` (`CodiceFiscale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `elettHasVot_Elez|idElez_fk` FOREIGN KEY (`idElezione_fk`) REFERENCES `elezione` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `elettHasVot_Refe|idRefe_fk` FOREIGN KEY (`idReferendum_fk`) REFERENCES `referendum` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elettorehasvoted`
--

LOCK TABLES `elettorehasvoted` WRITE;
/*!40000 ALTER TABLE `elettorehasvoted` DISABLE KEYS */;
INSERT INTO `elettorehasvoted` VALUES (3,'VSCMSM',2,NULL,'2022-02-28 23:47:18'),(4,'VSCMSM',3,NULL,'2022-02-28 23:49:58'),(17,'AAABBB00A01L000N',2,NULL,'2022-03-07 17:27:00'),(18,'AAABBB00A01L000A',2,NULL,'2022-03-07 18:15:08'),(21,'AAABBB00A01L000P',3,NULL,'2022-03-07 21:03:35'),(22,'AAABBB00A01L000N',3,NULL,'2022-03-07 21:32:20'),(26,'AAABBB00A01L000N',NULL,3,'2022-03-08 21:45:17'),(27,'AAABBB00A01L000P',NULL,3,'2022-03-08 21:45:32'),(28,'AAABBB00A01L000A',NULL,3,'2022-03-08 21:48:36'),(34,'AAABBB00A01L000N',18,NULL,'2022-03-08 22:11:55'),(35,'AAABBB00A01L000P',18,NULL,'2022-03-08 22:12:17'),(36,'AAABBB00A01L000P',19,NULL,'2022-03-08 22:24:08'),(37,'AAABBB00A01L000N',19,NULL,'2022-03-08 22:24:32'),(39,'AAABBB00A01L000N',NULL,5,'2022-03-09 18:57:46');
/*!40000 ALTER TABLE `elettorehasvoted` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `elettorehasvoted_BEFORE_INSERT` BEFORE INSERT ON `elettorehasvoted` FOR EACH ROW BEGIN
   IF (NEW.idElezione_fk IS NULL AND NEW.idReferendum_fk IS NULL) THEN
      signal sqlstate '45000' SET MESSAGE_TEXT = 'idElezione e idReferendum non possono essere nulli per un record "elettoreHasVoted" | Vedi: elettorehasvoted_BEFORE_INSERT';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `elezione`
--

DROP TABLE IF EXISTS `elezione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elezione` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nomeBreve` varchar(45) NOT NULL,
  `maggioranzaAssoluta` tinyint(1) NOT NULL DEFAULT '0',
  `isClosed` tinyint(1) NOT NULL DEFAULT '1',
  `isFinished` tinyint(1) NOT NULL DEFAULT '0',
  `tipoElezione_fk` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `elezione_tipoElez|tipoElezione_fk_idx` (`tipoElezione_fk`),
  CONSTRAINT `elezione_tipoElez|tipoElezione_fk` FOREIGN KEY (`tipoElezione_fk`) REFERENCES `tipologiaelezione` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elezione`
--

LOCK TABLES `elezione` WRITE;
/*!40000 ALTER TABLE `elezione` DISABLE KEYS */;
INSERT INTO `elezione` VALUES (2,'Elezione presidente della repubblica',1,1,1,2),(3,'Elezione presidente del Senato',0,1,1,3),(18,'Nesima VotazioneOrd',0,1,1,3),(19,'Nuova Votazione Categorica',0,1,1,3),(21,'Elezione presidenti di Commissione Senato',0,1,0,3),(23,'Votazione Giunta e sottoposti',0,1,1,2);
/*!40000 ALTER TABLE `elezione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impiegato`
--

DROP TABLE IF EXISTS `impiegato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `impiegato` (
  `idimpiegato` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Cognome` varchar(45) NOT NULL,
  PRIMARY KEY (`idimpiegato`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impiegato`
--

LOCK TABLES `impiegato` WRITE;
/*!40000 ALTER TABLE `impiegato` DISABLE KEYS */;
INSERT INTO `impiegato` VALUES (1,'Massimiliano',''),(10,'Shanti',''),(11,'Massimo','Aristotele');
/*!40000 ALTER TABLE `impiegato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partitielezione`
--

DROP TABLE IF EXISTS `partitielezione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partitielezione` (
  `elezione_fk` int NOT NULL,
  `partito_fk` int NOT NULL,
  PRIMARY KEY (`elezione_fk`,`partito_fk`),
  KEY `partElez_partito|partito_fk_idx` (`partito_fk`),
  CONSTRAINT `partElez_elez|elezione_fk` FOREIGN KEY (`elezione_fk`) REFERENCES `elezione` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `partElez_partito|partito_fk` FOREIGN KEY (`partito_fk`) REFERENCES `partito` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partitielezione`
--

LOCK TABLES `partitielezione` WRITE;
/*!40000 ALTER TABLE `partitielezione` DISABLE KEYS */;
INSERT INTO `partitielezione` VALUES (2,1),(3,1),(3,2),(18,2),(19,2),(23,2),(2,3),(3,3),(21,3),(23,3),(19,4),(23,4),(18,5),(19,5),(21,5),(18,6),(23,6);
/*!40000 ALTER TABLE `partitielezione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partitivotati`
--

DROP TABLE IF EXISTS `partitivotati`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partitivotati` (
  `votoElezione_fk` int NOT NULL,
  `partito_fk` int NOT NULL,
  `posizioneVoto` int DEFAULT NULL,
  PRIMARY KEY (`votoElezione_fk`,`partito_fk`),
  KEY `partVot_partito|partito_fk_idx` (`partito_fk`),
  CONSTRAINT `partVot_partito|partito_fk` FOREIGN KEY (`partito_fk`) REFERENCES `partito` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `partVot_votoElez|votoElez_fk` FOREIGN KEY (`votoElezione_fk`) REFERENCES `votoelezione` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partitivotati`
--

LOCK TABLES `partitivotati` WRITE;
/*!40000 ALTER TABLE `partitivotati` DISABLE KEYS */;
INSERT INTO `partitivotati` VALUES (10,3,NULL),(12,1,NULL),(25,1,NULL),(26,1,NULL),(30,1,2),(30,3,1),(38,5,1),(38,6,2),(39,6,1),(40,4,1),(41,2,1),(41,4,2),(41,5,3);
/*!40000 ALTER TABLE `partitivotati` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `partitivotatielezioni`
--

DROP TABLE IF EXISTS `partitivotatielezioni`;
/*!50001 DROP VIEW IF EXISTS `partitivotatielezioni`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `partitivotatielezioni` AS SELECT 
 1 AS `votoId`,
 1 AS `isWhiteVote`,
 1 AS `idElezione`,
 1 AS `idPartitoVotato`,
 1 AS `posizioneVotoPartito`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `partito`
--

DROP TABLE IF EXISTS `partito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partito` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partito`
--

LOCK TABLES `partito` WRITE;
/*!40000 ALTER TABLE `partito` DISABLE KEYS */;
INSERT INTO `partito` VALUES (1,'Partito A'),(2,'Partito B'),(3,'Partito C'),(4,'Partito D'),(5,'Partito E'),(6,'Partito F');
/*!40000 ALTER TABLE `partito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referendum`
--

DROP TABLE IF EXISTS `referendum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referendum` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nomeBreve` varchar(45) NOT NULL,
  `quesito` longtext NOT NULL,
  `withQuorum` tinyint(1) NOT NULL DEFAULT '0',
  `isClosed` tinyint(1) NOT NULL DEFAULT '0',
  `isFinished` tinyint(1) NOT NULL DEFAULT '0',
  `tipoElezione_fk` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `referendum_tipoElez|tipoElezione_fk_idx` (`tipoElezione_fk`),
  CONSTRAINT `referendum_tipoElez|tipoElezione_fk` FOREIGN KEY (`tipoElezione_fk`) REFERENCES `tipologiaelezione` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referendum`
--

LOCK TABLES `referendum` WRITE;
/*!40000 ALTER TABLE `referendum` DISABLE KEYS */;
INSERT INTO `referendum` VALUES (3,'Referendum Equa valutazione dei magistrati','Volete voi che sia abrogato il Decreto Legislativo 27 gennaio 2006, n. 25 (Istituzione del Consiglio direttivo della Corte di cassazione e nuova disciplina dei Consigli giudiziari, a norma dell’articolo 1, comma 1, lettera c) della legge 25 luglio 2005 n. 150), risultante dalle modificazioni e integrazioni successivamente apportate, limitatamente alle seguenti parti: art. 8, comma 1, limitatamente alle parole “esclusivamente” e “relative all’esercizio delle competenze di cui all’articolo 7, comma 1, lettere a)”; art. 16, comma 1, limitatamente alle parole: “esclusivamente” e “relative all’esercizio delle competenze di cui all’articolo 15, comma 1, lettere a), d) ed e)”?',0,1,1,0),(5,'Limiti agli abusi della custodia cautelare','Volete voi che sia abrogato il Decreto del Presidente della Repubblica 22 settembre 1988, n. 447 (Approvazione del codice di procedura penale), risultante dalle modificazioni e integrazioni successivamente apportate, limitatamente alla seguente parte: articolo 274, comma 1, lettera c), limitatamente alle parole: “o della stessa specie di quello per cui si procede. Se il pericolo riguarda la commissione di delitti della stessa specie di quello per cui si procede, le misure di custodia cautelare sono disposte soltanto se trattasi di delitti per i quali è prevista la pena della reclusione non inferiore nel massimo a quattro anni ovvero, in caso di custodia cautelare in carcere, di delitti per i quali è prevista la pena della reclusione non inferiore nel massimo a cinque anni nonché’ per il delitto di finanziamento illecito dei partiti di cui all’articolo 7 della legge 2 maggio 1974, n. 195 e successive modificazioni.”?',0,0,0,0);
/*!40000 ALTER TABLE `referendum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipologiaelezione`
--

DROP TABLE IF EXISTS `tipologiaelezione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipologiaelezione` (
  `id` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipologiaelezione`
--

LOCK TABLES `tipologiaelezione` WRITE;
/*!40000 ALTER TABLE `tipologiaelezione` DISABLE KEYS */;
INSERT INTO `tipologiaelezione` VALUES (0,'Referendum'),(1,'Votazione Categorica'),(2,'Votazione Categorica con Prederenza'),(3,'Votazione Ordinale');
/*!40000 ALTER TABLE `tipologiaelezione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usrelettore`
--

DROP TABLE IF EXISTS `usrelettore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usrelettore` (
  `username` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `elettore_fk` varchar(16) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `identity_fk_UNIQUE` (`elettore_fk`),
  CONSTRAINT `usrEl_Elett|elettore_fk` FOREIGN KEY (`elettore_fk`) REFERENCES `elettore` (`CodiceFiscale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usrelettore`
--

LOCK TABLES `usrelettore` WRITE;
/*!40000 ALTER TABLE `usrelettore` DISABLE KEYS */;
INSERT INTO `usrelettore` VALUES ('1ccfba0522f9fdd59be3c155be34b2b453f18ef4c97a198788e5dce0e452fa97','b9c9b7065f41689999130e8aaf6fbd5e7a746058a0c7864c12d602eab1a8cebc','AAABBB00A01L000N'),('23f0d5ce030e8416128f53283c411bf73865899636477ee9c08ca1a258a7f6bc','1a1d47229fb0edd5ae79ce024d9e23b2bb4cfbd9fbbf9a875781429638cb46b9','AAABBB00A01L000P'),('e6b42d39d3889dc5f321d624615f92bacae805f4f084e3b8d13d71af1a1d6dc0','d2c550dc287e679def14829022087478e06f1bf77f7bb070f2204d5a37ae24b1','AAABBB00A01L000A');
/*!40000 ALTER TABLE `usrelettore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usrimpiegato`
--

DROP TABLE IF EXISTS `usrimpiegato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usrimpiegato` (
  `username` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `impiegato_fk` int NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `impiegato_fk_UNIQUE` (`impiegato_fk`),
  CONSTRAINT `usrIm_Impie|impiegato_fk` FOREIGN KEY (`impiegato_fk`) REFERENCES `impiegato` (`idimpiegato`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usrimpiegato`
--

LOCK TABLES `usrimpiegato` WRITE;
/*!40000 ALTER TABLE `usrimpiegato` DISABLE KEYS */;
INSERT INTO `usrimpiegato` VALUES ('195c1240cecc4509b81888e79a7218631d08b91f1925c0258f908141ef5ae40e','c32be69db0a091fa1ac162c2c6b91656eb686b7cfa154c9ee7065db6ccd15acc',1),('29750e2fdcd870e7b552875b008e4ca99962250322be21180116235750b48cf8','4531a738ae6fd2b12294e71737b559b79533773d31fa5ffb8f3b58a97a398310',10),('4813494d137e1631bba301d5acab6e7bb7aa74ce1185d456565ef51d737677b2','b17a813cd79d47a25f5eda30e3e5fbb82f17144326885ca2025d5931db5d57a7',11);
/*!40000 ALTER TABLE `usrimpiegato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `votielezioni`
--

DROP TABLE IF EXISTS `votielezioni`;
/*!50001 DROP VIEW IF EXISTS `votielezioni`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `votielezioni` AS SELECT 
 1 AS `votoId`,
 1 AS `isWhiteVote`,
 1 AS `idElezione`,
 1 AS `idPartitoVotato`,
 1 AS `posizioneVotoPartito`,
 1 AS `idCandidatoVotato`,
 1 AS `posizioneVotoCandidato`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `votoelezione`
--

DROP TABLE IF EXISTS `votoelezione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `votoelezione` (
  `id` int NOT NULL AUTO_INCREMENT,
  `isWhiteVote` tinyint(1) NOT NULL DEFAULT '0',
  `elezione_fk` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `votoElez_Elez|elezione_fk_idx` (`elezione_fk`),
  CONSTRAINT `votoElez_Elez|elezione_fk` FOREIGN KEY (`elezione_fk`) REFERENCES `elezione` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Completare con : votoElez_Elez|elezione_fk';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votoelezione`
--

LOCK TABLES `votoelezione` WRITE;
/*!40000 ALTER TABLE `votoelezione` DISABLE KEYS */;
INSERT INTO `votoelezione` VALUES (10,0,2),(12,0,3),(25,0,2),(26,0,2),(29,1,3),(30,0,3),(38,0,18),(39,0,18),(40,0,19),(41,0,19);
/*!40000 ALTER TABLE `votoelezione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votoreferendum`
--

DROP TABLE IF EXISTS `votoreferendum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `votoreferendum` (
  `id` int NOT NULL AUTO_INCREMENT,
  `isPositive` tinyint(1) DEFAULT NULL,
  `isWhiteVote` tinyint(1) NOT NULL DEFAULT '0',
  `referendumId_fk` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `votoRef_Ref|idReferendum_fk_idx` (`referendumId_fk`),
  CONSTRAINT `votoRef_Ref|idReferendum_fk` FOREIGN KEY (`referendumId_fk`) REFERENCES `referendum` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votoreferendum`
--

LOCK TABLES `votoreferendum` WRITE;
/*!40000 ALTER TABLE `votoreferendum` DISABLE KEYS */;
INSERT INTO `votoreferendum` VALUES (6,1,0,3),(7,0,0,3),(8,NULL,1,3),(9,1,0,5);
/*!40000 ALTER TABLE `votoreferendum` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `votoreferendum_BEFORE_INSERT` BEFORE INSERT ON `votoreferendum` FOR EACH ROW BEGIN
	IF ((NEW.isPositive IS NOT NULL AND NEW.isWhiteVote = 1) OR (NEW.isPositive IS NULL AND NEW.isWhiteVote = 0) ) THEN
      signal sqlstate '45000' SET MESSAGE_TEXT = 'Incongruenza tra "isWhiteVote" e "votoReferendum" in inserimento voto ref | Vedi: votoreferendum_BEFORE_INSERT';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'sistemaelettoraleingsw'
--
/*!50003 DROP FUNCTION IF EXISTS `hasElettoreVotedElez` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `hasElettoreVotedElez`(
   codiceFiscale VARCHAR(16), idElezione INT
) RETURNS int
    READS SQL DATA
BEGIN
    RETURN EXISTS(SELECT *
	FROM `sistemaelettoraleingsw`.`elettorehasvoted`
	WHERE 
		`elettorehasvoted`.`idelettore_fk` = codiceFiscale AND
		`elettorehasvoted`.`idElezione_fk` = idElezione ); 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `hasElettoreVotedRef` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `hasElettoreVotedRef`(codiceFiscale VARCHAR(16), idReferendum INT) RETURNS int
    READS SQL DATA
BEGIN
   RETURN EXISTS(SELECT *
	FROM `sistemaelettoraleingsw`.`elettorehasvoted`
	WHERE 
		`elettorehasvoted`.`idelettore_fk` = codiceFiscale AND
		`elettorehasvoted`.`idReferendum_fk` = idReferendum ); 
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `loginElettore` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `loginElettore`(nomeUtente VARCHAR(256), password VARCHAR(256)) RETURNS varchar(16) CHARSET utf8mb4
    READS SQL DATA
BEGIN
	RETURN (SELECT `usrelettore`.`elettore_fk`
	FROM `sistemaelettoraleingsw`.`usrelettore`
	WHERE 
		`usrelettore`.`username` = SHA2(nomeUtente, 256) AND
		`usrelettore`.`password` = SHA2(CONCAT(LENGTH(nomeUtente), password, LENGTH(password), nomeUtente), 256));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `loginImpiegato` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `loginImpiegato`(
	nomeUtente VARCHAR(256), 
	password VARCHAR(256)
) RETURNS varchar(16) CHARSET utf8mb4
    READS SQL DATA
BEGIN

RETURN (SELECT `usrimpiegato`.`impiegato_fk`
FROM `sistemaelettoraleingsw`.`usrimpiegato`
WHERE 
	`usrimpiegato`.`username` = SHA2(nomeUtente, 256) AND
	`usrimpiegato`.`password` = SHA2(CONCAT(LENGTH(nomeUtente), password, LENGTH(password), nomeUtente), 256));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addElectionVote_categorico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addElectionVote_categorico`(
IN codiceFiscale VARCHAR(16), 
IN elezioneId INT,
IN idCandidato INT,
IN idPartito INT
)
BEGIN
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK; 
		RESIGNAL;
	END;
    
    START TRANSACTION;
       
       SELECT (`sistemaelettoraleingsw`.`hasElettoreVotedElez`(codiceFiscale, elezioneId)) INTO @hasVoted ; 
        
        IF(@hasVoted) THEN
          signal sqlstate '45000' SET MESSAGE_TEXT = 'Elettore ha gia votato per elezione | Vedi: addElectionVote_categorico';
		END IF;
        
        IF(idCandidato IS NOT NULL AND idPartito IS NOT NULL) THEN
          signal sqlstate '45000' SET MESSAGE_TEXT = 'Il voto categorico non contempla più o zero scelte per idCandidato e idPartito | Vedi: addElectionVote_categorico';
		END IF;
        
        SET @isWhiteVote = idCandidato IS NULL AND idPartito IS NULL;
    
		INSERT INTO `sistemaelettoraleingsw`.`votoelezione`
		(`isWhiteVote`,
		`elezione_fk`)
		VALUES
		(@isWhiteVote,
		elezioneId) ;
        
        SET @votoElezId = LAST_INSERT_ID();
        
        IF(NOT @isWhiteVote) THEN
			IF(idPartito IS NOT NULL) THEN
				INSERT INTO `sistemaelettoraleingsw`.`partitivotati`
				(`votoElezione_fk`,
				`partito_fk`)
				VALUES
				(@votoElezId,
				idPartito);
			 ELSE 
				INSERT INTO `sistemaelettoraleingsw`.`candidativotati`
				(`votoElezione_fk`,
				`candidato_fk`)
				VALUES
				(@votoElezId,
				idCandidato);
			 END IF;
		END IF;
        
		INSERT INTO `sistemaelettoraleingsw`.`elettorehasvoted`
		(`idelettore_fk`,
		`idElezione_fk`,
		`idReferendum_fk`)
		VALUES
		(codiceFiscale,
		elezioneId,
		null);

	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addElectionVote_categoricoConPref` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addElectionVote_categoricoConPref`(
IN codiceFiscale VARCHAR(16), 
IN elezioneId INT,
IN idPartito INT,
IN idCandidati JSON
)
BEGIN
	DECLARE i INT DEFAULT 0;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK; 
		RESIGNAL;
	END;
    
    START TRANSACTION;
       
       SELECT (`sistemaelettoraleingsw`.`hasElettoreVotedElez`(codiceFiscale, elezioneId)) INTO @hasVoted ; 
        
        IF(@hasVoted) THEN
          signal sqlstate '45000' SET MESSAGE_TEXT = 'Elettore ha gia votato per elezione | Vedi: addElectionVote_categoricoConPref';
		END IF;
        
        IF(idPartito IS NULL) THEN
          signal sqlstate '45000' SET MESSAGE_TEXT = 'Il voto categorico con preferenza deve indicare almeno un partito | Vedi: addElectionVote_categoricoConPref';
		END IF;
        
        SET @isWhiteVote = idPartito IS NULL;
    
		INSERT INTO `sistemaelettoraleingsw`.`votoelezione`
		(`isWhiteVote`,
		`elezione_fk`)
		VALUES
		(@isWhiteVote,
		elezioneId) ;
        
        SET @votoElezId = LAST_INSERT_ID();
        
        IF(NOT @isWhiteVote) THEN
			INSERT INTO `sistemaelettoraleingsw`.`partitivotati`
			(`votoElezione_fk`,
			`partito_fk`)
			VALUES
			(@votoElezId,
			idPartito);
			IF(idCandidati IS NOT NULL) THEN
				SET @totCand = JSON_LENGTH(idCandidati);
                WHILE i < @totCand DO
					SET @candidato = JSON_EXTRACT(idCandidati, CONCAT('$[',i,']'));
                    INSERT INTO `sistemaelettoraleingsw`.`candidativotati`
					(`votoElezione_fk`,
					`candidato_fk`)
					VALUES
					(@votoElezId,
					@candidato);
					SELECT i + 1 INTO i;
                END WHILE;
            END IF;
		END IF;

		INSERT INTO `sistemaelettoraleingsw`.`elettorehasvoted`
		(`idelettore_fk`,
		`idElezione_fk`,
		`idReferendum_fk`)
		VALUES
		(codiceFiscale,
		elezioneId,
		null);

	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addElectionVote_ordinale` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addElectionVote_ordinale`(
IN codiceFiscale VARCHAR(16), 
IN elezioneId INT,
IN partiti JSON,
IN candidati JSON
)
BEGIN
	DECLARE i INT DEFAULT 0;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK; 
		RESIGNAL;
	END;
    
    START TRANSACTION;
       
       SELECT (`sistemaelettoraleingsw`.`hasElettoreVotedElez`(codiceFiscale, elezioneId)) INTO @hasVoted ; 
        
        IF(@hasVoted) THEN
          signal sqlstate '45000' SET MESSAGE_TEXT = 'Elettore ha gia votato per elezione | Vedi: addElectionVote_ordinale';
		END IF;
        
        SET @isWhiteVote = (partiti IS NULL AND candidati IS NULL) OR(json_length(partiti) = 0  AND json_length(candidati)=0);
    
		INSERT INTO `sistemaelettoraleingsw`.`votoelezione`
		(`isWhiteVote`,
		`elezione_fk`)
		VALUES
		(@isWhiteVote,
		elezioneId) ;
        
        SET @votoElezId = LAST_INSERT_ID();
        
        IF(candidati IS NOT NULL) THEN
			SET @totCand = JSON_LENGTH(candidati);
			WHILE i < @totCand DO
				SET @idCandidato = JSON_UNQUOTE(JSON_EXTRACT(candidati, CONCAT('$[',i,']')));
				INSERT INTO `sistemaelettoraleingsw`.`candidativotati`
				(`votoElezione_fk`,
				`candidato_fk`,
				`posizioneVoto`)
				VALUES
				(@votoElezId,
				@idCandidato,
				i+1);
				SELECT i + 1 INTO i;
			END WHILE;
		END IF;
        SELECT 0 INTO i;
        IF(partiti IS NOT NULL) THEN
			SET @totPart = JSON_LENGTH(partiti);
			WHILE i < @totPart DO
				SET @idPartito = JSON_UNQUOTE(JSON_EXTRACT(partiti, CONCAT('$[',i,']')));
				INSERT INTO `sistemaelettoraleingsw`.`partitivotati`
				(`votoElezione_fk`,
				`partito_fk`,
				`posizioneVoto`)
				VALUES
				(@votoElezId,
				@idPartito,
				i+1);
				SELECT i + 1 INTO i;
			END WHILE;
		END IF;

		INSERT INTO `sistemaelettoraleingsw`.`elettorehasvoted`
		(`idelettore_fk`,
		`idElezione_fk`,
		`idReferendum_fk`)
		VALUES
		(codiceFiscale,
		elezioneId,
		null);

	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addElettore` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addElettore`(
IN codiceFiscale VARCHAR(256), 
IN nome VARCHAR(45),
IN cognome VARCHAR(45),
IN password VARCHAR(256)
)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK; 
		RESIGNAL;
	END;

	SELECT 
		SHA2(codiceFiscale, 256), 
        SHA2(CONCAT(LENGTH(codiceFiscale),password,LENGTH(password),codiceFiscale), 256)  
	INTO @HashedUsr, @HashedSaltedPsw;
    
    START TRANSACTION;
    
    INSERT INTO `sistemaelettoraleingsw`.`elettore`
		(`CodiceFiscale`,
		`Nome`,
		`Cognome`)
	VALUES
		(codiceFiscale,
		nome,
		cognome);

    
    INSERT INTO `sistemaelettoraleingsw`.`usrelettore`
		(`username`,
		`password`,
		`elettore_fk`)
	VALUES
		(@HashedUsr,
		@HashedSaltedPsw,
		codiceFiscale);

	COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addImpiegato` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addImpiegato`(
IN nome VARCHAR(45),
IN cognome VARCHAR(256), 
IN nomeUtente VARCHAR(256), 
IN password VARCHAR(256)
)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK; 
		RESIGNAL;
	END;

	SELECT 
		SHA2(nomeUtente, 256), 
        SHA2(CONCAT(LENGTH(nomeUtente),password,LENGTH(password),nomeUtente), 256)  
	INTO @HashedUsr, @HashedSaltedPsw;
    
    START TRANSACTION;
    
    INSERT INTO `sistemaelettoraleingsw`.`impiegato`
		(`Nome`,
        `Cognome`)
	VALUES
		(nome,
        cognome);

    
   INSERT INTO `sistemaelettoraleingsw`.`usrimpiegato`
		(`username`,
		`password`,
		`impiegato_fk`)
	VALUES
		(@HashedUsr,
		@HashedSaltedPsw,
		LAST_INSERT_ID());


	COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addNewElezione` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addNewElezione`(
	nomeBreve VARCHAR(256),
    maggioranzaAssoluta BOOLEAN,
    isClosed BOOLEAN,
    isFinished BOOLEAN,
    tipoElezione INT,
    IN partiti JSON,
	IN candidati JSON
)
BEGIN
	DECLARE i INT DEFAULT 0;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK; 
		RESIGNAL;
	END;
    
    START TRANSACTION;
		
		INSERT INTO `sistemaelettoraleingsw`.`elezione`(
			`nomeBreve`,
            `maggioranzaAssoluta`,
            `isClosed`,
            `isFinished`,
            `tipoElezione_fk`) VALUES (
            nomeBreve,
            maggioranzaAssoluta,
            isClosed,
            isFinished,
            tipoElezione);
        
		SET @idElezione = LAST_INSERT_ID();
    
        IF(candidati IS NOT NULL) THEN
			SET @totCand = JSON_LENGTH(candidati);
			WHILE i < @totCand DO
				SET @idCandidato = JSON_UNQUOTE(JSON_EXTRACT(candidati, CONCAT('$[',i,']')));
				INSERT INTO `sistemaelettoraleingsw`.`candidatielezione`
				(`elezione_fk`,
				`candidato_fk`)
				VALUES
				(@idElezione,
				@idCandidato);
				SELECT i + 1 INTO i;
			END WHILE;
		END IF;
        SELECT 0 INTO i;
        IF(partiti IS NOT NULL) THEN
			SET @totPart = JSON_LENGTH(partiti);
			WHILE i < @totPart DO
				SET @idPartito = JSON_UNQUOTE(JSON_EXTRACT(partiti, CONCAT('$[',i,']')));
                INSERT INTO `sistemaelettoraleingsw`.`partitielezione`
				(`elezione_fk`,
				`partito_fk`)
				VALUES
				(@idElezione,
				@idPartito);
				SELECT i + 1 INTO i;
			END WHILE;
		END IF;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addReferendumVote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addReferendumVote`(
IN codiceFiscale VARCHAR(16), 
IN referendumId INT,
IN isPositive INT
)
BEGIN
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK; 
		RESIGNAL;
	END;
    
    START TRANSACTION;
       
       SELECT (`sistemaelettoraleingsw`.`hasElettoreVotedRef`(codiceFiscale, referendumId)) INTO @hasVoted ; 
        
        IF(@hasVoted) THEN
          signal sqlstate '45000' SET MESSAGE_TEXT = 'Elettore ha gia votato per il referendum | Vedi: addReferendumVote';
		END IF;
    
		INSERT INTO `sistemaelettoraleingsw`.`votoreferendum`
		(`isPositive`,
		`isWhiteVote`,
		`referendumId_fk`)
		VALUES
		(
		isPositive,
		(isPositive is null),
		referendumId);
		
		INSERT INTO `sistemaelettoraleingsw`.`elettorehasvoted`
		(`idelettore_fk`,
		`idElezione_fk`,
		`idReferendum_fk`)
		VALUES
		(codiceFiscale,
		null,
		referendumId);

	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateElezione` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateElezione`(
	elezioneToUpdateId INT,
	nomeBreve VARCHAR(256),
    maggioranzaAssoluta BOOLEAN,
    isClosed BOOLEAN,
    isFinished BOOLEAN,
    tipoElezione INT,
    IN partiti JSON,
	IN candidati JSON
)
BEGIN
	DECLARE i INT DEFAULT 0;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK; 
		RESIGNAL;
	END;
    
    START TRANSACTION;
		
		UPDATE `sistemaelettoraleingsw`.`elezione`
		SET
		`nomeBreve` = nomeBreve,
		`maggioranzaAssoluta` = maggioranzaAssoluta,
		`tipoElezione_fk` = tipoElezione,
        `isFinished` = isFinished,
        `isClosed` = isClosed
		WHERE `id` = elezioneToUpdateId;

		DELETE FROM `sistemaelettoraleingsw`.`candidatielezione`
		WHERE elezione_fk = elezioneToUpdateId;

		DELETE FROM `sistemaelettoraleingsw`.`partitielezione`
		WHERE elezione_fk = elezioneToUpdateId;
    
        IF(candidati IS NOT NULL) THEN
			SET @totCand = JSON_LENGTH(candidati);
			WHILE i < @totCand DO
				SET @idCandidato = JSON_UNQUOTE(JSON_EXTRACT(candidati, CONCAT('$[',i,']')));
				INSERT INTO `sistemaelettoraleingsw`.`candidatielezione`
				(`elezione_fk`,
				`candidato_fk`)
				VALUES
				(elezioneToUpdateId,
				@idCandidato);
				SELECT i + 1 INTO i;
			END WHILE;
		END IF;
        SELECT 0 INTO i;
        IF(partiti IS NOT NULL) THEN
			SET @totPart = JSON_LENGTH(partiti);
			WHILE i < @totPart DO
				SET @idPartito = JSON_UNQUOTE(JSON_EXTRACT(partiti, CONCAT('$[',i,']')));
                INSERT INTO `sistemaelettoraleingsw`.`partitielezione`
				(`elezione_fk`,
				`partito_fk`)
				VALUES
				(elezioneToUpdateId,
				@idPartito);
				SELECT i + 1 INTO i;
			END WHILE;
		END IF;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `candidativotatielezioni`
--

/*!50001 DROP VIEW IF EXISTS `candidativotatielezioni`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `candidativotatielezioni` AS select `ve`.`id` AS `votoId`,`ve`.`isWhiteVote` AS `isWhiteVote`,`ve`.`elezione_fk` AS `idElezione`,`cv`.`candidato_fk` AS `idCandidatoVotato`,`cv`.`posizioneVoto` AS `posizioneVotoCandidato` from (`votoelezione` `ve` join `candidativotati` `cv` on((`ve`.`id` = `cv`.`votoElezione_fk`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `partitivotatielezioni`
--

/*!50001 DROP VIEW IF EXISTS `partitivotatielezioni`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `partitivotatielezioni` AS select `ve`.`id` AS `votoId`,`ve`.`isWhiteVote` AS `isWhiteVote`,`ve`.`elezione_fk` AS `idElezione`,`pv`.`partito_fk` AS `idPartitoVotato`,`pv`.`posizioneVoto` AS `posizioneVotoPartito` from (`votoelezione` `ve` join `partitivotati` `pv` on((`ve`.`id` = `pv`.`votoElezione_fk`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `votielezioni`
--

/*!50001 DROP VIEW IF EXISTS `votielezioni`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `votielezioni` AS select `ve`.`id` AS `votoId`,`ve`.`isWhiteVote` AS `isWhiteVote`,`ve`.`elezione_fk` AS `idElezione`,`pv`.`partito_fk` AS `idPartitoVotato`,`pv`.`posizioneVoto` AS `posizioneVotoPartito`,`cv`.`candidato_fk` AS `idCandidatoVotato`,`cv`.`posizioneVoto` AS `posizioneVotoCandidato` from ((`votoelezione` `ve` join `partitivotati` `pv` on((`ve`.`id` = `pv`.`votoElezione_fk`))) join `candidativotati` `cv` on((`ve`.`id` = `cv`.`votoElezione_fk`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-09 23:57:14
