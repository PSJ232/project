-- MySQL dump 10.13  Distrib 5.7.34, for Win64 (x86_64)
--
-- Host: localhost    Database: team3_flower
-- ------------------------------------------------------
-- Server version	5.7.34-log

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
-- Table structure for table `anniversary`
--

DROP TABLE IF EXISTS `anniversary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anniversary` (
  `a_id` int(11) NOT NULL COMMENT '기념일번호',
  `m_id` varchar(45) NOT NULL COMMENT '회원아이디',
  `a_date` date NOT NULL COMMENT '기념일',
  `a_name` varchar(45) NOT NULL COMMENT '기념일이름',
  `a_repeat` int(11) NOT NULL COMMENT '0:매년, 1:100일마다',
  PRIMARY KEY (`a_id`),
  KEY `FK_member_TO_anniversary` (`m_id`),
  CONSTRAINT `FK_member_TO_anniversary` FOREIGN KEY (`m_id`) REFERENCES `member` (`m_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='기념일';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anniversary`
--

LOCK TABLES `anniversary` WRITE;
/*!40000 ALTER TABLE `anniversary` DISABLE KEYS */;
/*!40000 ALTER TABLE `anniversary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `c_id` int(11) NOT NULL COMMENT '장바구니번호',
  `i_id` int(11) NOT NULL COMMENT '상품번호',
  `m_id` varchar(45) NOT NULL COMMENT '회원아이디',
  `c_qty` int(11) NOT NULL COMMENT 'default 1',
  `c_rdate` datetime NOT NULL COMMENT 'date동기화',
  `c_letter` int(11) NOT NULL,
  `c_delivery_date` date NOT NULL,
  `sub_option` int(11) DEFAULT NULL,
  PRIMARY KEY (`c_id`),
  KEY `FK_item_TO_cart` (`i_id`),
  KEY `FK_member_TO_cart` (`m_id`),
  CONSTRAINT `FK_item_TO_cart` FOREIGN KEY (`i_id`) REFERENCES `item` (`i_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_member_TO_cart` FOREIGN KEY (`m_id`) REFERENCES `member` (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='장바구니';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fclass`
--

DROP TABLE IF EXISTS `fclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fclass` (
  `f_id` int(11) NOT NULL,
  `f_subject` varchar(80) NOT NULL,
  `f_place` varchar(20) NOT NULL,
  `f_desc` varchar(1000) NOT NULL,
  `f_price` int(11) NOT NULL,
  `f_maxmem` int(11) NOT NULL,
  `f_curmem` int(11) NOT NULL,
  `f_main_img` varchar(80) NOT NULL,
  `f_sub_img1` varchar(80) NOT NULL,
  `f_sub_img2` varchar(80) NOT NULL,
  `f_sub_img3` varchar(80) NOT NULL,
  `f_rdate` date NOT NULL,
  `f_cdate` date NOT NULL,
  `f_readcount` int(11) NOT NULL,
  `f_sub_desc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`f_id`),
  UNIQUE KEY `f_subject` (`f_subject`,`f_place`,`f_rdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fclass`
--

LOCK TABLES `fclass` WRITE;
/*!40000 ALTER TABLE `fclass` DISABLE KEYS */;
/*!40000 ALTER TABLE `fclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fclass_detail`
--

DROP TABLE IF EXISTS `fclass_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fclass_detail` (
  `fd_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_id` int(11) NOT NULL,
  `fd_date` varchar(20) NOT NULL,
  `fd_place` varchar(20) NOT NULL,
  `fd_time` time NOT NULL,
  `fd_isselected` int(11) NOT NULL,
  PRIMARY KEY (`fd_id`),
  UNIQUE KEY `fd_date` (`fd_date`,`fd_place`,`fd_time`),
  KEY `f_id` (`f_id`),
  CONSTRAINT `fclass_detail_ibfk_1` FOREIGN KEY (`f_id`) REFERENCES `fclass` (`f_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fclass_detail`
--

LOCK TABLES `fclass_detail` WRITE;
/*!40000 ALTER TABLE `fclass_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `fclass_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fclass_detail_timelist`
--

DROP TABLE IF EXISTS `fclass_detail_timelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fclass_detail_timelist` (
  `fcdt_id` int(11) NOT NULL,
  `fcdt_time` time DEFAULT NULL,
  PRIMARY KEY (`fcdt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fclass_detail_timelist`
--

LOCK TABLES `fclass_detail_timelist` WRITE;
/*!40000 ALTER TABLE `fclass_detail_timelist` DISABLE KEYS */;
INSERT INTO `fclass_detail_timelist` VALUES (1,'10:00:00'),(2,'11:00:00'),(3,'12:00:00'),(4,'14:00:00'),(5,'15:00:00'),(6,'16:00:00'),(7,'17:00:00'),(8,'18:00:00');
/*!40000 ALTER TABLE `fclass_detail_timelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade` (
  `g_id` int(11) NOT NULL COMMENT '0~3등급',
  `g_discount` float NOT NULL DEFAULT '1',
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='등급';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` VALUES (0,1),(1,0.98),(2,0.97),(3,0.95);
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `i_id` int(11) NOT NULL AUTO_INCREMENT,
  `i_name` varchar(45) NOT NULL COMMENT '상품명',
  `i_desc` varchar(1000) NOT NULL COMMENT '상품설명',
  `i_price` int(11) NOT NULL COMMENT '가격',
  `i_inven` int(11) NOT NULL COMMENT '재고',
  `i_img` varchar(300) DEFAULT NULL,
  `i_subimg2` varchar(300) DEFAULT NULL,
  `i_subimg3` varchar(300) DEFAULT NULL,
  `i_subimg4` varchar(300) DEFAULT NULL,
  `i_rdate` datetime NOT NULL COMMENT 'date동기화',
  `i_discount` float NOT NULL DEFAULT '1',
  `i_size` varchar(10) NOT NULL,
  `i_dpstatus` varchar(15) NOT NULL,
  `i_itemstatus` varchar(15) NOT NULL,
  `i_detailpage` varchar(1000) NOT NULL,
  `i_category` int(11) NOT NULL,
  PRIMARY KEY (`i_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='상품';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'썬플라워 에디션','찬란한 여름 햇살 가득',33900,47,'1_1_1.jpg','1_1_2.jpg','1_1_3.jpg','1_1_4.jpg','2021-07-23 10:46:11',0.9,'M','판매','on sale','1_1_5.png',1),(2,'보라빛 향기 에디션','청초하고 은은한 매력',42900,37,'2_1_1.jpg','2_1_2.jpg','2_1_3.jpg','2_1_4.jpg','2021-07-23 10:47:34',0.9,'L','판매','on sale','2_1_5.png',1),(3,'오렌지 로즈 부케','마음과 함께 수줍게 전하는',40100,48,'3_1_1.jpg','3_1_2.jpg','3_1_3.jpg','3_1_4.jpg','2021-07-23 10:48:46',0.9,'L','판매','on sale','3_1_5.png',1),(4,'레드 로즈 부케','클래식한 사랑의 꽃',54900,48,'4_2_1.jpg','4_2_2.jpg','4_2_3.jpg','4_2_4.jpg','2021-07-23 10:50:14',0.9,'XL','판매','on sale','4_2_5.png',2),(5,'연핑크 수국 에디션','몽글몽글 피어나는 구름을 담은',59900,47,'5_2_1.jpg','5_2_2.jpg','5_2_3.jpg','5_2_4.jpg','2021-07-30 19:27:39',0.9,'XL','판매','on sale','5_2_5.png',2),(6,'가벼운 S 꽃구독','꽃이 일상이 되는 가벼운 시작',17900,895,'3_s_15.jpg','3_s_25.jpg','3_s_35.jpg','3_s_45.jpg','2021-07-30 13:03:24',1,'S','판매','on sale','3_s_52.png',3),(7,'가득찬 XL 꽃구독','꽃으로 가득차는 일상의 행복',49900,961,'3_xl_1.jpg','3_xl_2.jpg','3_xl_3.jpg','3_xl_4.jpg','2021-07-30 13:31:00',1,'XL','판매','on sale','3_xl_5.png',3),(8,'풍성한 L 꽃구독','매일이 풍성해지는 일상의 행복',34900,995,'3_l_1.jpg','3_l_2.jpg','3_l_3.jpg','3_l_4.jpg','2021-07-30 13:30:14',1,'L','판매','on sale','3_l_5.png',3),(9,'딱좋은 M 꽃구독','내 공간이 꽃이 되는 좋은 시작',26900,987,'3_m_1.jpg','3_m_2.jpg','3_m_3.jpg','3_m_4.jpg','2021-07-30 13:29:19',1,'M','판매','on sale','3_m_5.png',3),(10,'파랑새 에디션','행운을 전하는',56900,48,'10_2_1.jpg','10_2_2.jpg','10_2_3.jpg','10_2_4.jpg','2021-08-03 20:28:06',1,'XL','판매','on sale','10_2_5.png',2),(11,'[8월의 탄생화] 카라 에디션','특별한 날 더욱 빛나는',57900,100,'11_2_1.jpg','11_2_2.jpg','11_2_3.jpg','11_2_4.jpg','2021-08-07 19:47:52',1,'XL','판매','on sale','11_2_5.png',2),(12,'라벤더블루 수국','신비로운 제주 바다가 담긴',32500,100,'12_1_1.jpg','12_1_2.jpg','12_1_3.jpg','12_1_4.jpg','2021-08-07 19:52:55',0.9,'M','판매','on sale','12_1_5.png',1),(13,'라스트썸머 에디션','시원 달콤한 아이스크림 컬러',44900,100,'13_1_1.jpg','13_1_2.jpg','13_1_3.jpg','13_1_4.jpg','2021-08-07 19:55:12',0.8,'L','판매','on sale','13_1_5.png',1),(14,'보타닉 가든 에디션','여름 들꽃 부케의 감성',37900,100,'14_1_1.jpg','14_1_2.jpg','14_1_3.jpg','14_1_4.jpg','2021-08-07 19:56:57',0.8,'XL','판매','on sale','14_1_5.png',1),(15,'비비드 썸머 에디션','생생한 여름날의 기억',22900,100,'15_1_1.jpg','15_1_2.jpg','15_1_3.jpg','15_1_4.jpg','2021-08-07 19:59:36',0.9,'S','판매','on sale','15_1_5.png',1),(16,'선셋 비치 에디션','살랑거리는 해질녘 여름 바다',42900,100,'16_1_1.jpg','16_1_2.jpg','16_1_3.jpg','16_1_4.jpg','2021-08-07 20:00:58',0.9,'L','판매','on sale','16_1_5.png',1),(17,'스타티스','변치 않는 아름다움',25500,100,'17_1_1.jpg','17_1_2.jpg','17_1_3.jpg','17_1_4.jpg','2021-08-07 20:02:13',0.9,'XL','판매','on sale','17_1_5.png',1),(18,'카라','특유의 고급스러움이 묻어나는',42500,100,'18_1_1.jpg','18_1_2.jpg','18_1_3.jpg','18_1_4.jpg','2021-08-07 20:03:39',0.8,'L','판매','on sale','18_1_5.png',1),(19,'테디베어 해바라기','여름의 싱그러움을 머금은 황금빛',65900,100,'19_1_1.png','19_1_2.jpg','19_1_3.jpg','19_1_4.jpg','2021-08-07 20:04:57',0.5,'XL','판매','on sale','19_1_5.png',1),(20,'프리미엄 코랄빛 로즈','한송이만으로도 풍성한 꽃의 여왕',42900,100,'20_1_1.jpg','20_1_2.jpg','20_1_3.jpg','20_1_4.jpg','2021-08-07 20:06:24',0.7,'L','판매','on sale','20_1_5.png',1),(21,'프리미엄 핑크빛 로즈','한 줄기에서 퍼지는 아름다움',42900,100,'21_1_1.jpg','21_1_2.jpg','21_1_3.jpg','21_1_4.jpg','2021-08-07 20:07:29',0.7,'L','판매','on sale','21_1_5.png',1),(22,'핑크화이트 리시안셔스','청순하고 부드러운 매력',34900,100,'22_1_1.jpg','22_1_2.jpg','22_1_3.jpg','22_1_4.jpg','2021-08-07 20:08:50',1,'L','판매','on sale','22_1_5.png',1),(23,'한여름 밤 에디션','뜨거운 여름밤의 고백',33900,100,'23_1_1.jpg','23_1_2.jpg','23_1_3.jpg','23_1_4.jpg','2021-08-07 20:10:13',0.9,'M','판매','on sale','23_1_5.png',1),(24,'투명한 여름 햇살을 담은','화이트 수국',28900,100,'24_1_1.jpg','24_1_2.jpg','24_1_3.jpg','24_1_4.jpg','2021-08-07 20:11:23',0.9,'L','판매','on sale','24_1_5.png',1),(25,'로맨틱 로즈 부케','장미로 전하는 진심',55900,100,'25_2_1.jpg','25_2_2.jpg','25_2_3.jpg','25_2_4.jpg','2021-08-07 20:30:35',0.7,'XL','판매','on sale','25_2_5.png',2),(26,'해바라기 바스켓','여름의 생기를 오래 간직하는',59900,100,'26_2_1.jpg','26_2_2.jpg','26_2_3.jpg','26_2_4.jpg','2021-08-07 20:32:03',1,'XL','판매','on sale','26_2_5.png',2),(27,'장미 100송이','여자의 로망',149900,100,'27_2_1.jpg','27_2_2.jpg','27_2_3.jpg','27_2_4.jpg','2021-08-07 20:33:19',1,'XL','판매','on sale','27_2_5.png',2),(28,'우아함의 정석','퍼플 로즈 에디션',54900,100,'28_2_1.png','28_2_2.png','28_2_3.png','28_2_4.png','2021-08-07 20:34:25',0.9,'XL','판매','on sale','28_2_5.png',2),(29,'망고빛 거베라 에디션','사계의 베스트 컬러',55900,100,'29_2_1.png','29_2_2.png','29_2_3.png','29_2_4.png','2021-08-07 20:36:46',0.8,'XL','판매','on sale','29_2_5.png',2),(30,'캄파넬라 에디션','‘축복’의 꽃말',54900,100,'30_2_1.png','30_2_2.png','30_2_3.png','30_2_4.png','2021-08-07 20:38:27',0.9,'XL','판매','on sale','30_2_5.png',2),(31,'수국 바스켓','푸른 바다를 한 아름 담은',69900,100,'31_2_1.jpg','31_2_2.jpg','31_2_3.jpg','31_2_4.jpg','2021-08-07 20:54:55',1,'XL','판매','on sale','31_2_5.png',2),(32,'[8월의 탄생화] 카라 베이스','특별한 날 더욱 빛나는',65900,100,'32_2_1.jpg','32_2_2.jpg','32_2_3.jpg','32_2_4.jpg','2021-08-07 20:55:40',1,'XL','판매','on sale','32_2_5.png',2);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `letter`
--

DROP TABLE IF EXISTS `letter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `letter` (
  `l_id` int(11) NOT NULL COMMENT '편지지번호',
  `l_message` varchar(200) NOT NULL COMMENT '편지내용',
  PRIMARY KEY (`l_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='편지지';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `letter`
--

LOCK TABLES `letter` WRITE;
/*!40000 ALTER TABLE `letter` DISABLE KEYS */;
INSERT INTO `letter` VALUES (0,'선택안함'),(1,'고마운 마음,\n잊지않고 오래오래 기억할게요.'),(2,'당신이 매일 행복했으면 좋겠어요.\n진심을 담은\n이 순간을 기억해주세요.'),(3,'당신의 꽃길을 응원해요.\n앞으로도 우리 꽃길만 걸어요.'),(4,'od_message데이터사용요망');
/*!40000 ALTER TABLE `letter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `m_id` varchar(45) NOT NULL COMMENT 'id=email',
  `m_pass` varchar(45) NOT NULL COMMENT '회원비밀번호',
  `m_name` varchar(45) NOT NULL COMMENT '회원이름',
  `m_phone` varchar(11) NOT NULL,
  `m_birth` date NOT NULL COMMENT '회원생년월일',
  `m_gender` int(11) NOT NULL,
  `g_id` int(11) NOT NULL COMMENT 'default 0',
  `m_agree` varchar(2) DEFAULT NULL,
  `m_rdate` date NOT NULL,
  `m_drop` date DEFAULT NULL COMMENT '회원탈퇴',
  `m_point` int(11) NOT NULL,
  PRIMARY KEY (`m_id`),
  KEY `FK_grade_TO_member` (`g_id`),
  CONSTRAINT `FK_grade_TO_member` FOREIGN KEY (`g_id`) REFERENCES `grade` (`g_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='회원정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('admin@admin.com','1234','관리자','0','2000-10-10',1,3,'on','2021-07-27',NULL,972300),('anhye@naver.com','1414','안혜경','01010101414','1999-09-16',1,0,NULL,'2021-08-07',NULL,800),('bien@naver.com','1818','이비안','01010101818','1981-06-07',1,0,NULL,'2021-08-07',NULL,1600),('chan@daum.net','1616','정의찬','01010101616','1994-11-05',0,0,'on','2021-08-07',NULL,1400),('chil@daum.net','7777','한칠석','01077777777','1988-04-16',0,0,'on','2021-08-07',NULL,1000),('gangin@naver.com','1111','강인열','01010101111','1992-11-11',0,0,'on','2021-08-07',NULL,1000),('gilnam@daum.net','1919','박길남','01010101919','1960-11-28',0,0,'on','2021-08-07',NULL,1000),('hana@naver.com','1111','김하나','01011111111','1990-08-05',1,0,NULL,'2021-08-07',NULL,1000),('jina@daum.net','1313','이진아','01010101313','1996-11-08',1,0,NULL,'2021-08-07',NULL,600),('jisung@naver.com','9999','구지성','01099999999','1990-10-22',0,0,NULL,'2021-08-07',NULL,1000),('junho@daum.net','2222','이준호','01022222222','1980-07-25',0,0,'on','2021-08-07',NULL,1000),('ohyoun@naver.com','5555','오윤서','01055555555','1993-01-19',1,0,NULL,'2021-08-07',NULL,1000),('sahong@daum.net','2020','진사홍','01020202020','2004-01-09',1,0,'on','2021-08-07',NULL,1000),('samdong@gmail.com','3333','김삼동','01033333333','1968-02-15',0,0,'on','2021-08-07',NULL,1000),('sarang@daum.net','4444','김사랑','01044444444','1987-06-06',1,0,'on','2021-08-07',NULL,1000),('sejung@daum.net','1515','박세정','01010101515','1995-01-17',1,0,'on','2021-08-07',NULL,1400),('shin@naver.com','1212','신종현','01010101212','1988-02-17',0,0,'on','2021-08-07',NULL,1400),('sung@naver.com','1010','최성열','01010101010','1977-03-20',0,0,'on','2021-08-07',NULL,1000),('visitor','1234','비회원구매','0','2020-01-01',1,0,NULL,'2021-07-27',NULL,0),('yejin@gmail.com','1717','오예진','01010101717','2000-05-23',1,0,'on','2021-08-07',NULL,400),('youjung@daum.net','6666','김유정','01066666666','1983-05-05',1,0,NULL,'2021-08-07',NULL,1000),('yujung@gmail.com','8888','최여정','01088888888','1989-12-17',1,0,'on','2021-08-07',NULL,1000);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `o_id` int(11) NOT NULL COMMENT '주문번호',
  `m_id` varchar(45) NOT NULL COMMENT '회원아이디',
  `o_sender` varchar(45) NOT NULL COMMENT '보내는사람',
  `o_address` varchar(45) NOT NULL COMMENT '배송지',
  `o_receiver` varchar(45) NOT NULL COMMENT '받는사람',
  `o_phone` varchar(11) NOT NULL COMMENT '받는사람연락처',
  `o_amount` int(11) NOT NULL COMMENT '혜택반영 전 가격',
  `o_point` int(11) NOT NULL COMMENT '사용포인트',
  `o_payment` int(11) NOT NULL COMMENT '0:카드, 1:계좌이체 등등',
  `o_rdate` datetime NOT NULL COMMENT 'date동기화',
  `o_gdiscount` int(11) NOT NULL,
  `o_visitor` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`o_id`),
  KEY `FK_member_TO_orders` (`m_id`),
  CONSTRAINT `FK_member_TO_orders` FOREIGN KEY (`m_id`) REFERENCES `member` (`m_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='주문';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (2021080701,'anhye@naver.com','안혜경','57061&전남 영광군 군남면 광암로 1-42&503-2','이준호','01022222222',38300,0,0,'2021-06-30 00:00:00',0,NULL),(2021080702,'anhye@naver.com','안혜경','13473&경기 성남시 분당구 경부고속도로 409&99-8','오윤서','01055555555',41100,-1000,1,'2021-07-07 13:05:00',0,NULL),(2021080703,'anhye@naver.com','안혜경','50103&경남 거창군 위천면 면동길 19-6&176-25','박길남','01010101919',56400,0,1,'2021-01-22 05:50:00',0,NULL),(2021080704,'bien@naver.com','이비안','47319&부산 부산진구 개금동 643&1025-6','진사홍','01020202020',71600,0,0,'2021-05-28 22:15:00',0,NULL),(2021080705,'bien@naver.com','이비안','61605&광주 남구 월산동 1032-1&105동 22호','김삼동','01033333333',41100,0,1,'2021-03-08 16:10:00',0,NULL),(2021080706,'chan@daum.net','정의찬','23033&인천 강화군 강화읍 강화대로 439-2&65-25','강인열','01010101111',35800,0,1,'2021-08-05 03:26:00',0,NULL),(2021080707,'chan@daum.net','정의찬','39160&경북 구미시 산동읍 강동로 678&507-106','김삼동','01033333333',38600,0,1,'2021-08-05 03:26:00',0,NULL),(2021080708,'jina@daum.net','이진아','38303&경북 청도군 각북면 삼평1길 15-3&932-85','오윤서','01055555555',35800,-1000,1,'2021-08-04 09:17:00',0,NULL),(2021080709,'jina@daum.net','이진아','05363&서울 강동구 양재대로 1410&10-71','김삼동','01022222222',156900,0,1,'2021-08-04 09:17:00',0,NULL),(2021080710,'sejung@daum.net','박세정','50018&경남 함양군 지곡면 개평길 2&174-396','이준호','01022222222',35800,0,1,'2021-08-06 13:47:00',0,NULL),(2021080711,'sejung@daum.net','박세정','37358&경북 의성군 가음면 금성현서로 347&362-8','오윤서','01055555555',79600,0,0,'2021-08-06 13:47:00',0,NULL),(2021080712,'shin@naver.com','신종현','53209&경남 거제시 연초면 거제대로 4328&392-85','김사랑','01044444444',110100,0,0,'2021-08-05 03:26:00',0,NULL),(2021080713,'shin@naver.com','신종현','50511&경남 양산시 소주공단로 24&11026-52','함춘자','10178949845',41100,0,1,'2021-08-05 03:26:00',0,NULL),(2021080714,'yejin@gmail.com','오예진','38219&경북 경주시 양남면 나아2길 9-2&2193-02','구지성','01099999999',71600,0,1,'2021-08-07 16:19:58',0,NULL),(2021080715,'yejin@gmail.com','오예진','52516&경남 사천시 사천읍 사천읍성로 3-1&0719-025','최여정','01088888888',147400,-1000,0,'2021-08-03 02:07:00',0,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_detail`
--

DROP TABLE IF EXISTS `orders_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_detail` (
  `od_id` int(11) NOT NULL COMMENT '주문상세번호',
  `o_id` int(11) NOT NULL COMMENT '주문번호',
  `i_id` int(11) NOT NULL COMMENT '상품번호',
  `l_id` int(11) NOT NULL COMMENT '편지지번호',
  `od_qty` int(11) NOT NULL COMMENT 'default 1',
  `od_message` varchar(200) DEFAULT NULL COMMENT '편지내용 직접입력',
  `od_review` int(11) NOT NULL COMMENT '0:미작성, 1:완료',
  `m_id` varchar(45) NOT NULL,
  `c_id` int(11) DEFAULT NULL,
  `od_delivery_date` date NOT NULL,
  `od_invoice` varchar(45) DEFAULT NULL,
  `od_confirm` int(11) NOT NULL,
  PRIMARY KEY (`od_id`),
  KEY `FK_orders_TO_orders_detail` (`o_id`),
  KEY `FK_item_TO_orders_detail` (`i_id`),
  KEY `FK_letter_TO_orders_detail` (`l_id`),
  CONSTRAINT `FK_letter_TO_orders_detail` FOREIGN KEY (`l_id`) REFERENCES `letter` (`l_id`),
  CONSTRAINT `FK_orders_TO_orders_detail` FOREIGN KEY (`o_id`) REFERENCES `orders` (`o_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_orders_detail_TO_orders` FOREIGN KEY (`o_id`) REFERENCES `orders` (`o_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='주문상세';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_detail`
--

LOCK TABLES `orders_detail` WRITE;
/*!40000 ALTER TABLE `orders_detail` DISABLE KEYS */;
INSERT INTO `orders_detail` VALUES (1,2021080701,6,2,1,'',1,'anhye@naver.com',0,'2021-07-09','주문접수',0),(2,2021080701,6,2,1,'',0,'anhye@naver.com',0,'2021-07-23','주문접수',0),(3,2021080702,2,3,1,'',1,'anhye@naver.com',0,'2021-04-15','주문접수',0),(4,2021080703,5,3,1,'',0,'anhye@naver.com',0,'2021-02-18','주문접수',0),(5,2021080704,6,0,1,'',1,'bien@naver.com',0,'2021-06-02','주문접수',0),(6,2021080704,6,0,1,'',1,'bien@naver.com',0,'2021-06-16','주문접수',0),(7,2021080704,6,0,1,'',0,'bien@naver.com',0,'2021-06-30','주문접수',0),(8,2021080704,6,0,1,'',0,'bien@naver.com',0,'2021-07-14','주문접수',0),(9,2021080705,2,3,1,'',1,'bien@naver.com',0,'2021-03-11','주문접수',0),(10,2021080706,6,0,1,'',1,'chan@daum.net',0,'2021-08-04','주문접수',0),(11,2021080706,6,0,1,'',0,'chan@daum.net',0,'2021-08-18','주문접수',0),(12,2021080707,2,0,1,'',1,'chan@daum.net',0,'2021-08-12','주문접수',0),(13,2021080708,6,0,1,'',1,'jina@daum.net',0,'2021-07-28','주문접수',0),(14,2021080708,6,0,1,'',0,'jina@daum.net',0,'2021-08-11','주문접수',0),(15,2021080709,2,3,1,'',1,'jina@daum.net',1,'2021-08-12','주문접수',0),(16,2021080709,5,2,1,'',1,'jina@daum.net',2,'2021-08-13','주문접수',0),(17,2021080709,10,2,1,'',0,'jina@daum.net',3,'2021-08-11','주문접수',0),(18,2021080710,6,0,1,'',1,'sejung@daum.net',0,'2021-08-17','주문접수',0),(19,2021080710,6,0,1,'',0,'sejung@daum.net',0,'2021-08-31','주문접수',0),(20,2021080711,2,2,1,'',1,'sejung@daum.net',1,'2021-08-12','주문접수',0),(21,2021080711,3,4,1,'',0,'sejung@daum.net',2,'2021-08-13','주문접수',0),(22,2021080712,9,4,1,'',1,'shin@naver.com',0,'2021-08-07','주문접수',0),(23,2021080712,9,4,1,'',0,'shin@naver.com',0,'2021-08-21','주문접수',0),(24,2021080712,9,4,1,'',0,'shin@naver.com',0,'2021-09-04','주문접수',0),(25,2021080712,9,4,1,'',0,'shin@naver.com',0,'2021-09-18','주문접수',0),(26,2021080713,2,3,1,'',1,'shin@naver.com',0,'2021-08-11','주문접수',0),(27,2021080714,6,0,1,'',1,'yejin@gmail.com',0,'2021-08-06','주문접수',0),(28,2021080714,6,0,1,'',0,'yejin@gmail.com',0,'2021-08-20','주문접수',0),(29,2021080714,6,0,1,'',0,'yejin@gmail.com',0,'2021-09-03','주문접수',0),(30,2021080714,6,0,1,'',0,'yejin@gmail.com',0,'2021-09-17','주문접수',0),(31,2021080715,2,3,1,'',1,'yejin@gmail.com',1,'2021-08-18','주문접수',0),(32,2021080715,10,0,1,'',0,'yejin@gmail.com',2,'2021-08-10','주문접수',0),(33,2021080715,4,0,1,'',0,'yejin@gmail.com',3,'2021-08-13','주문접수',0);
/*!40000 ALTER TABLE `orders_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna`
--

DROP TABLE IF EXISTS `qna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qna` (
  `q_id` int(11) NOT NULL COMMENT '문의번호',
  `o_id` int(11) DEFAULT NULL,
  `q_subject` varchar(45) NOT NULL COMMENT '문의제목',
  `q_content` varchar(2000) NOT NULL COMMENT '문의내용',
  `q_img` varchar(45) DEFAULT NULL COMMENT '사진첨부',
  `q_rdate` datetime NOT NULL COMMENT 'date동기화',
  `q_img2` varchar(45) DEFAULT NULL,
  `q_img3` varchar(45) DEFAULT NULL,
  `m_id` varchar(45) DEFAULT NULL,
  `q_re_ref` int(11) DEFAULT NULL,
  `q_re_lev` int(11) DEFAULT NULL,
  `q_answered` int(11) NOT NULL,
  PRIMARY KEY (`q_id`),
  KEY `FK_orders_TO_qna` (`o_id`),
  KEY `FK_member_TO_qna` (`m_id`),
  CONSTRAINT `FK_member_TO_qna` FOREIGN KEY (`m_id`) REFERENCES `member` (`m_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='고객문의';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna`
--

LOCK TABLES `qna` WRITE;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
INSERT INTO `qna` VALUES (1,2021080705,'꽃이 사이즈가 너무 작은데 이게 맞는건가요??','사진보다 사이즈가 너무 작은데.. 가격에 비해서ㅜㅜ','꽃.jpg','2021-08-07 17:12:57',NULL,NULL,'bien@naver.com',1,0,1),(2,0,'꽃 좀 추천해주실 수 있나요?','제일 잘나가는 꽃 좀 추천해주세요!',NULL,'2021-08-07 17:36:31',NULL,NULL,'bien@naver.com',2,0,1),(3,0,'제품의 실제 사이즈를 알 수 있을까요?','정기구독 s사이즈의 사이즈가 궁금합니다. 대략 적으로라도 설명해주시면 감사하겠습니다.',NULL,'2021-08-07 17:38:25',NULL,NULL,'bien@naver.com',3,0,1),(4,2021080701,'정기구독 좀 더 장기간으로 가능한가요?','지금 목록에 있는 기간보다 더 길게 유지하고 싶은데요',NULL,'2021-08-07 17:39:23',NULL,NULL,'anhye@naver.com',4,0,1),(5,2021080702,'꽃 퀄리티가 너무 별로네요..','교환 가능한가요ㅠㅠ','꽃1.jpg','2021-08-07 17:39:56',NULL,NULL,'anhye@naver.com',5,0,1),(6,2021080707,'실제 제품을 받았는데요','다음번에는 조금 더 큰 사이즈로 받고싶은데 가능할까요?',NULL,'2021-08-07 17:41:15',NULL,NULL,'chan@daum.net',6,0,1),(7,0,'정기구독 날짜 변경 가능할까요?','지금 지정된 날짜랑 다르게 하고싶은데요',NULL,'2021-08-07 17:41:41',NULL,NULL,'chan@daum.net',7,0,1),(8,2021080708,'정기구독 제품을 다른걸로 교환 가능할까요?','지금은 s사이즈로 정기구독 중인데 m사이즈로 바꿀 수 있나요?',NULL,'2021-08-07 17:42:46',NULL,NULL,'jina@daum.net',8,0,1),(9,0,'온라인으로 주문했는데요','현장에 직접 방문해서 꽃 받는거 가능한가요?',NULL,'2021-08-07 17:43:06',NULL,NULL,'jina@daum.net',9,0,1),(10,2021080711,'수령일을 미룰 수 있나요?','제가 8월 12일에 수령하는걸로 했는데, 13일로 변경하는거 가능한가요?',NULL,'2021-08-07 17:45:00',NULL,NULL,'sejung@daum.net',10,0,1),(11,0,'꽃다발 포장지를 다른 종류로 할 수 있나요?','가능한지 궁금합니다.',NULL,'2021-08-07 17:45:16',NULL,NULL,'sejung@daum.net',11,0,1),(12,0,'꽃 추천 해주세요!','아는 지인이 환갑이신 남성분이신데 그분이 좋아하실만한 꽃 추천해주세요!',NULL,'2021-08-07 17:46:25',NULL,NULL,'shin@naver.com',12,0,1),(13,2021080713,'꽃에 물은 얼마나 주면 되나요?','그 외에도 제가 알아두면 좋을 부분이 있을까요?',NULL,'2021-08-07 17:46:54',NULL,NULL,'shin@naver.com',13,0,1),(14,0,'매장에서 받을 수 있나요?','수령일에 매장으로 직접 방문해서 받아도 되나요?',NULL,'2021-08-07 17:47:29',NULL,NULL,'yejin@gmail.com',14,0,1),(15,2021080714,'배달오는 시간은 정할 수 없나요?','매번 배달오는 시간이 달라서 불편한데 시간 지정하는 기능은 없을까요?',NULL,'2021-08-07 17:48:07',NULL,NULL,'yejin@gmail.com',15,0,1),(16,2021080705,'ANSWER: 꽃이 사이즈가 너무 작은데 이게 맞는건가요??','안녕하세요 고객님,\r\n\r\n사이즈와 관련해서 불만족을 드려 매우 죄송합니다.\r\n꽃다발을 직접 제공하는 과정에서 미세한 차이가 있을 수 있으나, 기존의 사진과 동일한 구성을 가진 제품입니다.\r\n\r\n다만 계절 별로 꽃의 상태가 달라 꽃다발의 크기가 다를 수 있어 양해 부탁드립니다.',NULL,'2021-08-07 17:52:02',NULL,NULL,'admin@admin.com',1,1,1),(17,0,'ANSWER: 꽃 좀 추천해주실 수 있나요?','안녕하세요, 고객님\r\n\r\n현재 Four Season에서 가장 인기 상품은 정기구독 s사이즈며,\r\n단품의 경우 보랏빛 향기 에디션이 가장 인기가 많습니다.\r\n특히 정기구독 s사이즈의 만족도가 높아 추천드립니다.',NULL,'2021-08-07 17:59:40',NULL,NULL,'admin@admin.com',2,1,1),(18,0,'ANSWER: 제품의 실제 사이즈를 알 수 있을까요?','안녕하세요 고객님,\r\n\r\n정기구독 s사이즈의 실제 크기는 홈페이지 제품 설명에서 확인하실 수 있습니다. 15 * 28(cm)의 사이즈로 사진과 구성은 동일합니다.',NULL,'2021-08-07 18:00:51',NULL,NULL,'admin@admin.com',3,1,1),(19,2021080701,'ANSWER: 정기구독 좀 더 장기간으로 가능한가요?','안녕하세요 고객님,\r\n\r\n죄송하지만 현재 진행중인 정기구독의 기간 이상으로는 신청이 힘드십니다.\r\n정기 구독이 끝나신 이후에 다시 정기구독을 신청하시는 방식으로 정기구독을 연장하실 수 있습니다.\r\n\r\n',NULL,'2021-08-07 18:01:38',NULL,NULL,'admin@admin.com',4,1,1),(20,2021080702,'ANSWER: 꽃 퀄리티가 너무 별로네요..','안녕하세요 고객님,\r\n\r\n꽃 품질과 관련하여 실망감을 드려 정말 죄송합니다.\r\n생화의 특성으로 교환은 불가능하지만, 제품에 품질 저하 정도에 따라 환불이 가능합니다.\r\n자세한 사항은 전화로 문의해주시기 바랍니다. ',NULL,'2021-08-07 18:03:01',NULL,NULL,'admin@admin.com',5,1,1),(21,2021080707,'ANSWER: 실제 제품을 받았는데요','안녕하세요 고객님,\r\n\r\n현재 Four Season 온라인에서는 동일한 크기의 꽃다발을 원칙으로 하고 있습니다. 사이트에서 제시된 사이즈 이상의 크기는 제공하고 있지 않습니다.\r\n다만 오프라인 매장에서는 사이즈 변동이 가능하니 사이즈 변동을 위해서는 직접 매장에 방문해주셔야 합니다.',NULL,'2021-08-07 18:07:02',NULL,NULL,'admin@admin.com',6,1,1),(22,0,'ANSWER: 정기구독 날짜 변경 가능할까요?','안녕하세요 고객님,\r\n\r\n정기구독 날짜 변경은 1:1 문의를 통해 가능합니다.\r\n주문번호를 입력해 주세요.',NULL,'2021-08-07 18:07:38',NULL,NULL,'admin@admin.com',7,1,1),(23,2021080708,'ANSWER: 정기구독 제품을 다른걸로 교환 가능할까요?','안녕하세요 고객님,\r\n\r\n정기구독 제품 변경은 전화연결을 통해 가능합니다.\r\n',NULL,'2021-08-07 18:08:06',NULL,NULL,'admin@admin.com',8,1,1),(24,0,'ANSWER: 온라인으로 주문했는데요','안녕하세요 고객님,\r\n\r\n온라인에서 주문하신 제품을 오프라인 매장에서 받는 것이 가능합니다.\r\n오프라인 매장에 방문하셔서 주문번호 및 구매 내역을 제시해 주시면 됩니다.',NULL,'2021-08-07 18:08:37',NULL,NULL,'admin@admin.com',9,1,1),(25,2021080711,'ANSWER: 수령일을 미룰 수 있나요?','안녕하세요 고객님,\r\n\r\n생화의 특성상 꽃의 품질이 저하될 수 있어 수령일을 미루는 것은 지원하고 있지 않습니다.',NULL,'2021-08-07 18:09:20',NULL,NULL,'admin@admin.com',10,1,1),(26,0,'ANSWER: 꽃다발 포장지를 다른 종류로 할 수 있나요?','안녕하세요 고객님,\r\n\r\n현재 Four Season에서 제공중인 꽃다발 포장지 외 다른 포장지는 제공하고 있지 않습니다.',NULL,'2021-08-07 18:09:56',NULL,NULL,'admin@admin.com',11,1,1),(27,0,'ANSWER: 꽃 추천 해주세요!','안녕하세요, 고객님\r\n\r\n현재 Four Season에서 가장 인기 상품은 정기구독 s사이즈며,\r\n단품의 경우 보랏빛 향기 에디션이 가장 인기가 많습니다.\r\n특히 정기구독 s사이즈의 만족도가 높아 추천드립니다.',NULL,'2021-08-07 18:10:24',NULL,NULL,'admin@admin.com',12,1,1),(28,2021080713,'ANSWER: 꽃에 물은 얼마나 주면 되나요?','안녕하세요 고객님,\r\n\r\n구매하신 제품은 3일에 1번씩 물을 주면 되는 제품입니다.\r\n자세한 사항은 Four Seasons 사이트의 제품 설명에서 확인하실 수 있습니다.',NULL,'2021-08-07 18:10:58',NULL,NULL,'admin@admin.com',13,1,1),(29,0,'ANSWER: 매장에서 받을 수 있나요?','안녕하세요 고객님,\r\n\r\n온라인에서 주문하신 제품을 오프라인 매장에서 받는 것이 가능합니다.\r\n오프라인 매장에 방문하셔서 주문번호 및 구매 내역을 제시해 주시면 됩니다.',NULL,'2021-08-07 18:11:42',NULL,NULL,'admin@admin.com',14,1,1),(30,2021080714,'ANSWER: 배달오는 시간은 정할 수 없나요?','안녕하세요 고객님,\r\n\r\n배달 시간과 관련해서는 택배사의 업무와 관련되어 저희 쪽에서 지정할 수가 없습니다. 죄송합니다.',NULL,'2021-08-07 18:13:09',NULL,NULL,'admin@admin.com',15,1,1);
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation` (
  `r_id` int(11) NOT NULL,
  `m_id` varchar(45) NOT NULL,
  `f_id` int(11) NOT NULL,
  `fd_id` int(11) NOT NULL,
  `r_num` int(11) NOT NULL,
  `r_payment` varchar(40) NOT NULL,
  `r_date` date NOT NULL,
  `r_comfirm` int(11) NOT NULL,
  `r_amount` int(11) NOT NULL,
  PRIMARY KEY (`r_id`),
  KEY `reservation_f_id_fk` (`f_id`),
  KEY `reservation_fd_id_fk` (`fd_id`),
  CONSTRAINT `reservation_f_id_fk` FOREIGN KEY (`f_id`) REFERENCES `fclass` (`f_id`),
  CONSTRAINT `reservation_fd_id_fk` FOREIGN KEY (`fd_id`) REFERENCES `fclass_detail` (`fd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `r_id` int(11) NOT NULL COMMENT '리뷰번호',
  `od_id` int(11) NOT NULL COMMENT '주문상세번호',
  `r_writer` varchar(45) NOT NULL COMMENT '작성자',
  `r_title` varchar(45) NOT NULL COMMENT '제목',
  `r_content` varchar(2000) NOT NULL COMMENT '내용',
  `r_rate` int(11) NOT NULL COMMENT '별점',
  `r_rdate` datetime NOT NULL COMMENT 'date동기화',
  `r_img` varchar(45) DEFAULT NULL COMMENT '사진첨부',
  `r_point` int(11) NOT NULL COMMENT '적립포인트',
  PRIMARY KEY (`r_id`),
  KEY `FK_orders_detail_TO_review` (`od_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='리뷰';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,1,'anhye@naver.com','2주차 부터는 보냉백이 안오네요..','1주차 꽃이 더 예쁜것 같아요ㅠㅠ 여러므로 아쉽습니다ㅜ',3,'2021-08-07 16:42:31','null',200),(2,3,'anhye@naver.com','남자친구가 정말 좋아해요~','별로 꽃 안좋아하는 남자친구도 정말 좋아하네요. 꽃이 너무너무 예쁩니다~~',5,'2021-08-07 16:47:36','null',200),(3,5,'bien@naver.com','꽃이 사진이랑 똑같아요!','four seasons에서 본 사진이랑 똑같이 배달와서 정말 만족스럽습니다 아주 예쁘네요ㅎㅎ',5,'2021-08-07 16:52:02',NULL,200),(4,6,'bien@naver.com','꽃 사이즈도 좋고 정말 예뻐요','꽃 받는 그날 하루종일 기분이 좋습니다ㅎㅎ',5,'2021-08-07 16:52:55',NULL,200),(5,9,'bien@naver.com','맘에 쏙 들어요','!!',5,'2021-08-07 16:54:36',NULL,200),(6,12,'chan@daum.net','여자친구가 정말 좋아하네요!!','재구매 의사 있습니다ㅎㅎ',5,'2021-08-07 16:55:46',NULL,200),(7,10,'chan@daum.net','어머님께서 정말 좋아하세요~~','효도선물로 강추합니다.',5,'2021-08-07 16:56:10',NULL,200),(8,16,'jina@daum.net','딸 졸업식 꽃다발로 주문했는데요','사진이랑 전혀 다르네요.. 퀄리티가 훨씬 별로입니다. 매우 실망스럽습니다',1,'2021-08-07 16:57:41',NULL,200),(9,13,'jina@daum.net','인테리어에 너무 좋아요','매주 꽃 고민할 필요가 없어서 정말 편리합니다.',5,'2021-08-07 16:58:05',NULL,200),(10,15,'jina@daum.net','꽃이 사진이랑 좀 다르네요','꽃이 좀 시들어서 옵니다. 색도 좀 많이 다르구요.',2,'2021-08-07 16:58:47',NULL,200),(11,18,'sejung@daum.net','가벼운 선물로 최고인듯요','친구들이 진짜 만족합니다!!',5,'2021-08-07 16:59:48',NULL,200),(12,20,'sejung@daum.net','사진이랑 꽃 구성이 좀 달라요','안이쁜건 아닌데 사진이랑 동일하면 훨씬 좋을거 같아요...',4,'2021-08-07 17:00:12',NULL,200),(13,22,'shin@naver.com','아버지꼐서 정말 좋아하십니다','이렇게 좋아하실 줄 몰랐는데 매우 만족스럽니다ㅎㅎ',5,'2021-08-07 17:07:40',NULL,200),(14,26,'shin@naver.com','생일선물로 딱이네요','사이즈가 딱 좋은거 같습니다. 사진으로 생각되는 것보다 조금 큽니다.',5,'2021-08-07 17:07:59',NULL,200),(15,27,'yejin@gmail.com','생각보다 너무 작네요','가격에 비해 사이즈가 좀 작은 감이 있어 아쉽습니다..',2,'2021-08-07 17:10:13',NULL,200),(16,31,'yejin@gmail.com','색깔이 정말 예쁘네요~','다음에는 생일 선물로 주문할까 합니다ㅎㅎ',5,'2021-08-07 17:10:33',NULL,200);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-07 21:00:14
