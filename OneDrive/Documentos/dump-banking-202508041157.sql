-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: banking
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nomeCategoria` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'básica'),(2,'prata'),(3,'ouro'),(4,'premium');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nomeCompleto` varchar(200) NOT NULL,
  `primeiroNome` varchar(200) NOT NULL,
  `sobrenome` varchar(200) NOT NULL,
  `dataNascimento` date NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Santiago Rodrigues Gilberto','Santiago','Rodrigues Gilberto','1984-09-15'),(2,'Andressa Santos Scheifer','Andressa','Santos Scheifer','1998-02-10'),(3,'Helena Silva','Helena','Silva','1973-05-30'),(4,'João Borges','João','Borges','1992-07-22'),(5,'Vanessa Luz','Vanessa','Luz','1995-04-01'),(6,'Rosa Amorim','Rosa','Amorim','1989-07-11'),(7,'Cristiano Machado','Cristiano','Machado','2000-01-29'),(8,'Estefani Silveira','Estefani','Silveira','1994-12-17'),(9,'Samanta Fagundes','Samanta','Fagundes','1987-10-05'),(10,'Camila Marques','Camila','Marques','1997-09-30'),(11,'Orlando Souza','Orlando','Souza','2001-02-20'),(12,'Renata Correia','Renata','Correia','1996-04-10'),(13,'Gabriel Borba','Gabriel','Borba','1978-08-30');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conta`
--

DROP TABLE IF EXISTS `conta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conta` (
  `idConta` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) NOT NULL,
  `tipo_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `valor` int(11) NOT NULL,
  PRIMARY KEY (`idConta`),
  KEY `cliente_id` (`cliente_id`),
  KEY `tipo_id` (`tipo_id`),
  KEY `categoria_id` (`categoria_id`),
  CONSTRAINT `conta_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`idCliente`),
  CONSTRAINT `conta_ibfk_2` FOREIGN KEY (`tipo_id`) REFERENCES `contatipo` (`idContaTipo`),
  CONSTRAINT `conta_ibfk_3` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta`
--

LOCK TABLES `conta` WRITE;
/*!40000 ALTER TABLE `conta` DISABLE KEYS */;
INSERT INTO `conta` VALUES (1,9,1,1,24700),(2,11,3,4,5000),(3,3,3,3,50450),(4,6,3,2,5600),(5,8,2,1,4500),(6,6,3,4,128500),(7,2,1,1,2999),(8,5,2,1,103649),(9,7,3,3,20000),(10,10,3,4,1000),(11,13,3,2,19498),(12,12,3,3,1500),(13,12,3,2,54999),(14,1,1,1,5499);
/*!40000 ALTER TABLE `conta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contaservicos`
--

DROP TABLE IF EXISTS `contaservicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contaservicos` (
  `idContaServico` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_id` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `taxa` int(11) NOT NULL,
  PRIMARY KEY (`idContaServico`),
  KEY `categoria_id` (`categoria_id`),
  CONSTRAINT `contaservicos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contaservicos`
--

LOCK TABLES `contaservicos` WRITE;
/*!40000 ALTER TABLE `contaservicos` DISABLE KEYS */;
INSERT INTO `contaservicos` VALUES (1,1,'cadastro de conta',1,0),(2,1,'saque caixa eletronico',1,0),(3,1,'extrato caixa eletronico',99,0),(4,1,'extrato online',99,0),(5,1,'atendimento fone',99,0),(6,2,'cadastro de conta',1,1999),(7,2,'saque caixa eletronico',6,50),(8,2,'extrato caixa eletronico',99,0),(9,2,'extrato online',99,0),(10,2,'atendimento fone',99,0),(11,2,'atendimento 24/7',99,0),(12,2,'cartão de débito',99,499),(13,2,'pix',99,0),(14,3,'cadastro de conta',1,499),(15,3,'saque caixa eletronico',10,0),(16,3,'extrato caixa eletronico',99,0),(17,3,'extrato online',99,0),(18,3,'atendimento 24/7',99,0),(19,3,'cartão de débito',1,499),(20,3,'pix',99,0),(21,3,'internet banking',99,0),(22,3,'cartão de crédito',1,499),(23,3,'seguro de automóvel',1,79999),(24,3,'limite pré aprovado R$ 5.000,00',1,0),(25,4,'cadastro de conta',1,2999),(26,4,'saque caixa eletronico',99,0),(27,4,'extrato caixa eletronico',99,0),(28,4,'extrato online',99,0),(29,4,'atendimento 24/7',99,0),(30,4,'cartão de débito',99,0),(31,4,'pix',99,0),(32,4,'internet banking',99,0),(33,4,'cartão de crédito',3,0),(34,4,'previdência privada',12,49999),(35,4,'limite pré aprovado R$ 50.000,00',1,0),(36,4,'seguro de automóvel',3,199999),(37,4,'seguro de vida',12,4999),(38,4,'desconto em viagens',12,999),(39,4,'título de capitalização',12,9999),(40,4,'consórcio automotivo',3,399999),(41,1,'cadastro de conta',1,0),(42,1,'saque caixa eletronico',1,0),(43,1,'extrato caixa eletronico',99,0),(44,1,'extrato online',99,0),(45,1,'atendimento fone',99,0),(46,2,'cadastro de conta',1,1999),(47,2,'saque caixa eletronico',6,50),(48,2,'extrato caixa eletronico',99,0),(49,2,'extrato online',99,0),(50,2,'atendimento fone',99,0),(51,2,'atendimento 24/7',99,0),(52,2,'cartão de débito',99,499),(53,2,'pix',99,0),(54,3,'cadastro de conta',1,499),(55,3,'saque caixa eletronico',10,0),(56,3,'extrato caixa eletronico',99,0),(57,3,'extrato online',99,0),(58,3,'atendimento 24/7',99,0),(59,3,'cartão de débito',1,499),(60,3,'pix',99,0),(61,3,'internet banking',99,0),(62,3,'cartão de crédito',1,499),(63,3,'seguro de automóvel',1,79999),(64,3,'limite pré aprovado R$ 5.000,00',1,0),(65,4,'cadastro de conta',1,2999),(66,4,'saque caixa eletronico',99,0),(67,4,'extrato caixa eletronico',99,0),(68,4,'extrato online',99,0),(69,4,'atendimento 24/7',99,0),(70,4,'cartão de débito',99,0),(71,4,'pix',99,0),(72,4,'internet banking',99,0),(73,4,'cartão de crédito',3,0),(74,4,'previdência privada',12,49999),(75,4,'limite pré aprovado R$ 50.000,00',1,0),(76,4,'seguro de automóvel',3,199999),(77,4,'seguro de vida',12,4999),(78,4,'desconto em viagens',12,999),(79,4,'título de capitalização',12,9999),(80,4,'consórcio automotivo',3,399999);
/*!40000 ALTER TABLE `contaservicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contatipo`
--

DROP TABLE IF EXISTS `contatipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contatipo` (
  `idContaTipo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  PRIMARY KEY (`idContaTipo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contatipo`
--

LOCK TABLES `contatipo` WRITE;
/*!40000 ALTER TABLE `contatipo` DISABLE KEYS */;
INSERT INTO `contatipo` VALUES (1,'conta-salário'),(2,'conta-corrente'),(3,'conta-poupança');
/*!40000 ALTER TABLE `contatipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimento`
--

DROP TABLE IF EXISTS `movimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimento` (
  `idMovimento` int(11) NOT NULL AUTO_INCREMENT,
  `valor` int(11) NOT NULL,
  `cadastradoEm` datetime DEFAULT NULL,
  `atualizadoEm` datetime DEFAULT NULL,
  `tipo_id` int(11) NOT NULL,
  `conta_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  PRIMARY KEY (`idMovimento`),
  KEY `tipo_id` (`tipo_id`),
  KEY `conta_id` (`conta_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `movimento_ibfk_1` FOREIGN KEY (`tipo_id`) REFERENCES `movimentotipo` (`idMovimentoTipo`),
  CONSTRAINT `movimento_ibfk_2` FOREIGN KEY (`conta_id`) REFERENCES `conta` (`idConta`),
  CONSTRAINT `movimento_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `movimentostatus` (`idMovimentoStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimento`
--

LOCK TABLES `movimento` WRITE;
/*!40000 ALTER TABLE `movimento` DISABLE KEYS */;
INSERT INTO `movimento` VALUES (1,1999,'2021-03-26 12:22:31','2021-03-26 12:22:31',2,14,2),(2,1999,'2021-03-26 12:22:31','2021-03-26 12:22:31',10,14,2),(3,4500,'2021-03-26 12:22:31','2021-03-26 12:22:31',4,5,2),(4,5600,'2021-03-26 12:22:31','2021-03-26 12:22:31',5,4,2),(5,4999,'2021-03-26 12:22:31','2021-03-26 12:22:31',7,8,2),(6,1000,'2021-03-26 12:22:31','2021-03-26 12:22:31',5,10,2),(7,60000,'2021-03-26 12:22:31','2021-03-26 12:22:31',9,10,2),(8,5000,'2021-03-26 12:22:31','2021-03-26 12:22:31',2,1,2),(9,450,'2021-03-26 12:22:31','2021-03-26 12:22:31',5,3,2),(10,1500,'2021-03-26 12:22:31','2021-03-26 12:22:31',6,4,1),(11,3500,'2021-03-26 12:22:31','2021-03-26 12:22:31',3,6,2),(12,2500,'2021-03-26 12:22:31','2021-03-26 12:22:31',8,7,2),(13,50000,'2021-03-26 12:22:31','2021-03-26 12:22:31',3,3,2),(14,10000,'2021-03-26 12:22:31','2021-03-26 12:22:31',2,1,2),(15,5000,'2021-03-26 12:22:31','2021-03-26 12:22:31',1,2,2),(16,1999,'2021-03-26 12:22:31','2021-03-26 12:22:31',10,2,2),(17,140000,'2021-03-26 12:22:31','2021-03-26 12:22:31',6,12,1),(18,5000,'2021-03-26 12:22:31','2021-03-26 12:22:31',1,12,1),(19,6300,'2021-03-26 12:22:31','2021-03-26 12:22:31',9,12,1),(20,1999,'2021-03-26 12:22:31','2021-03-26 12:22:31',8,8,2),(21,1999,'2021-03-26 12:22:31','2021-03-26 12:22:31',3,8,2),(22,5000,'2021-03-26 12:22:31','2021-03-26 12:22:31',8,9,2),(23,2999,'2021-03-26 12:22:31','2021-03-26 12:22:31',1,7,2),(24,10000,'2021-03-26 12:22:31','2021-03-26 12:22:31',1,6,2),(25,199,'2021-03-26 12:22:31','2021-03-26 12:22:31',7,5,1),(26,1999,'2021-03-26 12:22:31','2021-03-26 12:22:31',2,7,1),(27,9999,'2021-03-26 12:22:31','2021-03-26 12:22:31',2,11,2),(28,5000,'2021-03-26 12:22:31','2021-03-26 12:22:31',7,13,2),(29,9999,'2021-03-26 12:22:31','2021-03-26 12:22:31',5,13,2),(30,2999,'2021-03-26 12:22:31','2021-03-26 12:22:31',2,11,2),(31,1500,'2021-03-26 12:22:31','2021-03-26 12:22:31',2,12,2),(32,1999,'2021-03-26 12:22:31','2021-03-26 12:22:31',10,14,2),(33,750000,'2021-03-26 12:22:31','2021-03-26 12:22:31',9,5,2),(34,75000000,'2021-03-26 12:22:31','2021-03-26 12:22:31',6,4,1),(35,250,'2021-03-26 12:22:31','2021-03-26 12:22:31',9,14,2),(36,45000,'2021-03-26 12:22:31','2021-03-26 12:22:31',3,13,2),(37,8000,'2021-03-26 12:22:31','2021-03-26 12:22:31',8,9,2),(38,150000,'2021-03-26 12:22:31','2021-03-26 12:22:31',2,8,1),(39,6000,'2021-03-26 12:22:31','2021-03-26 12:22:31',7,13,2),(40,5000,'2021-03-26 12:22:31','2021-03-26 12:22:31',2,9,2),(41,1400,'2021-03-26 12:22:31','2021-03-26 12:22:31',9,7,2),(42,50000,'2021-03-26 12:22:31','2021-03-26 12:22:31',1,4,1),(43,45000,'2021-03-26 12:22:31','2021-03-26 12:22:31',8,3,2),(44,10000,'2021-03-26 12:22:31','2021-03-26 12:22:31',6,6,2),(45,500,'2021-03-26 12:22:31','2021-03-26 12:22:31',3,8,1),(46,1999,'2021-03-26 12:22:31','2021-03-26 12:22:31',7,9,2),(47,15000,'2021-03-26 12:22:31','2021-03-26 12:22:31',6,2,2),(48,2999,'2021-03-26 12:22:31','2021-03-26 12:22:31',9,14,1),(49,15000,'2021-03-26 12:22:31','2021-03-26 12:22:31',3,9,2),(50,3000,'2021-03-26 12:22:31','2021-03-26 12:22:31',8,6,2),(51,3500,'2021-03-26 12:22:31','2021-03-26 12:22:31',1,14,2),(52,1200,'2021-03-26 12:22:31','2021-03-26 12:22:31',2,1,2),(53,15000,'2021-03-26 12:22:31','2021-03-26 12:22:31',3,6,2),(54,150,'2021-03-26 12:22:31','2021-03-26 12:22:31',4,8,2),(55,6500,'2021-03-26 12:22:31','2021-03-26 12:22:31',5,11,2),(56,4500,'2021-03-26 12:22:31','2021-03-26 12:22:31',6,12,2),(57,3500,'2021-03-26 12:22:31','2021-03-26 12:22:31',7,12,2),(58,1200,'2021-03-26 12:22:31','2021-03-26 12:22:31',8,12,2),(59,1100,'2021-03-26 12:22:31','2021-03-26 12:22:31',9,12,1),(60,1999,'2021-03-26 12:22:31','2021-03-26 12:22:31',10,6,2),(61,6500,'2021-03-26 12:22:31','2021-03-26 12:22:31',2,8,2),(62,10000000,'2021-03-26 12:22:31','2021-03-26 12:22:31',3,6,2),(63,95000,'2021-03-26 12:22:31','2021-03-26 12:22:31',4,8,2),(64,15000,'2021-03-26 12:22:31','2021-03-26 12:22:31',7,4,3),(65,4500,'2021-03-26 12:22:31','2021-03-26 12:22:31',8,3,3),(66,3500,'2021-03-26 12:22:31','2021-03-26 12:22:31',9,2,3),(67,15000,'2021-03-26 12:22:31','2021-03-26 12:22:31',4,2,3),(68,8500,'2021-03-26 12:22:31','2021-03-26 12:22:31',5,1,2),(69,1999,'2021-03-26 12:22:31','2021-03-26 12:22:31',6,8,3),(70,1500,'2021-03-26 12:22:31','2021-03-26 12:22:31',1,3,3),(71,1999,'2021-03-26 12:22:31','2021-03-26 12:22:31',1,6,3),(72,5000,'2021-03-26 12:22:31','2021-03-26 12:22:31',1,6,3),(73,150000,'2021-03-26 12:22:31','2021-03-26 12:22:31',2,12,3),(74,60000,'2021-03-26 12:22:31','2021-03-26 12:22:31',3,13,3),(75,15000,'2021-03-26 12:22:31','2021-03-26 12:22:31',6,13,3),(76,1999,'2021-03-26 12:22:31','2021-03-26 12:22:31',2,14,2),(77,1999,'2021-03-26 12:22:31','2021-03-26 12:22:31',10,14,2),(78,4500,'2021-03-26 12:22:31','2021-03-26 12:22:31',4,5,2),(79,5600,'2021-03-26 12:22:31','2021-03-26 12:22:31',5,4,2),(80,4999,'2021-03-26 12:22:31','2021-03-26 12:22:31',7,8,2),(81,1000,'2021-03-26 12:22:31','2021-03-26 12:22:31',5,10,2),(82,60000,'2021-03-26 12:22:31','2021-03-26 12:22:31',9,10,2),(83,5000,'2021-03-26 12:22:31','2021-03-26 12:22:31',2,1,2),(84,450,'2021-03-26 12:22:31','2021-03-26 12:22:31',5,3,2),(85,1500,'2021-03-26 12:22:31','2021-03-26 12:22:31',6,4,1),(86,3500,'2021-03-26 12:22:31','2021-03-26 12:22:31',3,6,2),(87,2500,'2021-03-26 12:22:31','2021-03-26 12:22:31',8,7,2),(88,50000,'2021-03-26 12:22:31','2021-03-26 12:22:31',3,3,2),(89,10000,'2021-03-26 12:22:31','2021-03-26 12:22:31',2,1,2),(90,5000,'2021-03-26 12:22:31','2021-03-26 12:22:31',1,2,2),(91,1999,'2021-03-26 12:22:31','2021-03-26 12:22:31',10,2,2),(92,140000,'2021-03-26 12:22:31','2021-03-26 12:22:31',6,12,1),(93,5000,'2021-03-26 12:22:31','2021-03-26 12:22:31',1,12,1),(94,6300,'2021-03-26 12:22:31','2021-03-26 12:22:31',9,12,1),(95,1999,'2021-03-26 12:22:31','2021-03-26 12:22:31',8,8,2),(96,1999,'2021-03-26 12:22:31','2021-03-26 12:22:31',3,8,2),(97,5000,'2021-03-26 12:22:31','2021-03-26 12:22:31',8,9,2),(98,2999,'2021-03-26 12:22:31','2021-03-26 12:22:31',1,7,2),(99,10000,'2021-03-26 12:22:31','2021-03-26 12:22:31',1,6,2),(100,199,'2021-03-26 12:22:31','2021-03-26 12:22:31',7,5,1),(101,1999,'2021-03-26 12:22:31','2021-03-26 12:22:31',2,7,1),(102,9999,'2021-03-26 12:22:31','2021-03-26 12:22:31',2,11,2),(103,5000,'2021-03-26 12:22:31','2021-03-26 12:22:31',7,13,2),(104,9999,'2021-03-26 12:22:31','2021-03-26 12:22:31',5,13,2),(105,2999,'2021-03-26 12:22:31','2021-03-26 12:22:31',2,11,2),(106,1500,'2021-03-26 12:22:31','2021-03-26 12:22:31',2,12,2),(107,1999,'2021-03-26 12:22:31','2021-03-26 12:22:31',10,14,2),(108,750000,'2021-03-26 12:22:31','2021-03-26 12:22:31',9,5,2),(109,75000000,'2021-03-26 12:22:31','2021-03-26 12:22:31',6,4,1),(110,250,'2021-03-26 12:22:31','2021-03-26 12:22:31',9,14,2),(111,45000,'2021-03-26 12:22:31','2021-03-26 12:22:31',3,13,2),(112,8000,'2021-03-26 12:22:31','2021-03-26 12:22:31',8,9,2),(113,150000,'2021-03-26 12:22:31','2021-03-26 12:22:31',2,8,1),(114,6000,'2021-03-26 12:22:31','2021-03-26 12:22:31',7,13,2),(115,5000,'2021-03-26 12:22:31','2021-03-26 12:22:31',2,9,2),(116,1400,'2021-03-26 12:22:31','2021-03-26 12:22:31',9,7,2),(117,50000,'2021-03-26 12:22:31','2021-03-26 12:22:31',1,4,1),(118,45000,'2021-03-26 12:22:31','2021-03-26 12:22:31',8,3,2),(119,10000,'2021-03-26 12:22:31','2021-03-26 12:22:31',6,6,2),(120,500,'2021-03-26 12:22:31','2021-03-26 12:22:31',3,8,1),(121,1999,'2021-03-26 12:22:31','2021-03-26 12:22:31',7,9,2),(122,15000,'2021-03-26 12:22:31','2021-03-26 12:22:31',6,2,2),(123,2999,'2021-03-26 12:22:31','2021-03-26 12:22:31',9,14,1),(124,15000,'2021-03-26 12:22:31','2021-03-26 12:22:31',3,9,2),(125,3000,'2021-03-26 12:22:31','2021-03-26 12:22:31',8,6,2),(126,3500,'2021-03-26 12:22:31','2021-03-26 12:22:31',1,14,2),(127,1200,'2021-03-26 12:22:31','2021-03-26 12:22:31',2,1,2),(128,15000,'2021-03-26 12:22:31','2021-03-26 12:22:31',3,6,2),(129,150,'2021-03-26 12:22:31','2021-03-26 12:22:31',4,8,2),(130,6500,'2021-03-26 12:22:31','2021-03-26 12:22:31',5,11,2),(131,4500,'2021-03-26 12:22:31','2021-03-26 12:22:31',6,12,2),(132,3500,'2021-03-26 12:22:31','2021-03-26 12:22:31',7,12,2),(133,1200,'2021-03-26 12:22:31','2021-03-26 12:22:31',8,12,2),(134,1100,'2021-03-26 12:22:31','2021-03-26 12:22:31',9,12,1),(135,1999,'2021-03-26 12:22:31','2021-03-26 12:22:31',10,6,2),(136,6500,'2021-03-26 12:22:31','2021-03-26 12:22:31',2,8,2),(137,10000000,'2021-03-26 12:22:31','2021-03-26 12:22:31',3,6,2),(138,95000,'2021-03-26 12:22:31','2021-03-26 12:22:31',4,8,2),(139,15000,'2021-03-26 12:22:31','2021-03-26 12:22:31',7,4,3),(140,4500,'2021-03-26 12:22:31','2021-03-26 12:22:31',8,3,3),(141,3500,'2021-03-26 12:22:31','2021-03-26 12:22:31',9,2,3),(142,15000,'2021-03-26 12:22:31','2021-03-26 12:22:31',4,2,3),(143,8500,'2021-03-26 12:22:31','2021-03-26 12:22:31',5,1,2),(144,1999,'2021-03-26 12:22:31','2021-03-26 12:22:31',6,8,3),(145,1500,'2021-03-26 12:22:31','2021-03-26 12:22:31',1,3,3),(146,1999,'2021-03-26 12:22:31','2021-03-26 12:22:31',1,6,3),(147,5000,'2021-03-26 12:22:31','2021-03-26 12:22:31',1,6,3),(148,150000,'2021-03-26 12:22:31','2021-03-26 12:22:31',2,12,3),(149,60000,'2021-03-26 12:22:31','2021-03-26 12:22:31',3,13,3),(150,15000,'2021-03-26 12:22:31','2021-03-26 12:22:31',6,13,3);
/*!40000 ALTER TABLE `movimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimentostatus`
--

DROP TABLE IF EXISTS `movimentostatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimentostatus` (
  `idMovimentoStatus` int(11) NOT NULL,
  `nomeStatus` varchar(60) NOT NULL,
  PRIMARY KEY (`idMovimentoStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimentostatus`
--

LOCK TABLES `movimentostatus` WRITE;
/*!40000 ALTER TABLE `movimentostatus` DISABLE KEYS */;
INSERT INTO `movimentostatus` VALUES (1,'pendente'),(2,'sucesso'),(3,'falha');
/*!40000 ALTER TABLE `movimentostatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimentotipo`
--

DROP TABLE IF EXISTS `movimentotipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimentotipo` (
  `idMovimentoTipo` int(11) NOT NULL,
  `nomeTipo` varchar(60) NOT NULL,
  PRIMARY KEY (`idMovimentoTipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimentotipo`
--

LOCK TABLES `movimentotipo` WRITE;
/*!40000 ALTER TABLE `movimentotipo` DISABLE KEYS */;
INSERT INTO `movimentotipo` VALUES (1,'entrada de fundos - transferência'),(2,'entrada de fundos - depósito'),(3,'entrada de fundos - pix'),(4,'entrada de fundos - cobrança'),(5,'entrada de fundos - estorno'),(6,'saída de fundos - transferência'),(7,'saída de fundos - saque'),(8,'saída de fundos - pix'),(9,'saída de fundos - pagamento de boleto'),(10,'saída de fundos - taxa de operação bancária');
/*!40000 ALTER TABLE `movimentotipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'banking'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-04 11:57:51
