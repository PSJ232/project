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
INSERT INTO `anniversary` VALUES (1,'admin@admin.com','2021-07-27','테스트1',0),(2,'admin@admin.com','2021-07-27','테스트1',1),(3,'admin@admin.com','2021-07-27','테스트1',100),(4,'admin@admin.com','2020-07-27','테스트2',0),(5,'admin@admin.com','2020-07-27','테스트2',1),(6,'admin@admin.com','2020-07-27','테스트2',100);
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
  PRIMARY KEY (`c_id`),
  KEY `FK_item_TO_cart` (`i_id`),
  KEY `FK_member_TO_cart` (`m_id`),
  CONSTRAINT `FK_item_TO_cart` FOREIGN KEY (`i_id`) REFERENCES `item` (`i_id`),
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
  `i_id` int(11) NOT NULL COMMENT '상품번호',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='상품';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'산호초 에디션','바다의 꽃 산호초의 빛깔을 담은',59900,40,NULL,NULL,NULL,NULL,'2021-07-23 10:46:11',0.9,'M','판매','판매중','없음',1),(2,'보라빛 향기 에디션','청초하고 은은한 매력',42900,40,NULL,NULL,NULL,NULL,'2021-07-23 10:47:34',0.8,'L','판매','판매중','없음',2),(3,'오렌지 로즈 부케','마음과 함께 수줍게 전하는',69800,40,NULL,NULL,NULL,NULL,'2021-07-23 10:48:46',0.95,'XL','판매','판매중','없음',1),(4,'레드 로즈 부케','클래식한 사랑의 꽃',54900,40,NULL,NULL,NULL,NULL,'2021-07-23 10:50:14',1,'S','판매','판매중','없음',2),(5,'연핑크 수국 에디션','몽글몽글 피어나는 구름을 담은',59900,40,NULL,NULL,NULL,NULL,'2021-07-30 19:27:39',0.85,'XL','판매','판매중','없음',2),(6,'가벼운 S 꽃구독','꽃이 일상이 되는 가벼운 시작',17900,929,NULL,NULL,NULL,NULL,'2021-07-30 13:03:24',1,'S','판매','판매중','없음',3),(7,'딱좋은 M 꽃구독','내 공간이 꽃이 되는 좋은 시작',26900,999,NULL,NULL,NULL,NULL,'2021-07-30 13:29:19',1,'M','판매','판매중','없음',3),(8,'풍성한 L 꽃구독','매일이 풍성해지는 일상의 행복',34900,995,NULL,NULL,NULL,NULL,'2021-07-30 13:30:14',1,'L','판매','판매중','없음',3),(9,'가득찬 XL 꽃구독','꽃으로 가득차는 일상의 행복',49900,965,NULL,NULL,NULL,NULL,'2021-07-30 13:31:00',1,'XL','판매','판매중','없음',3);
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
INSERT INTO `member` VALUES ('admin@admin.com','1234','관리자','1','2000-10-10',1,0,'on','2021-07-27',NULL,985000),('visitor','1234','비회원구매','0','2020-01-01',1,0,NULL,'2021-07-27',NULL,0);
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
INSERT INTO `orders` VALUES (2021080101,'admin@admin.com','관리자','06035&서울 강남구 가로수길 5&집','신종현','01012341234',202100,-700,1,'2021-08-01 03:12:06',0,NULL),(2021080102,'admin@admin.com','관리자','30067&세종특별자치시 연동면 매바위길 3&집','신종현','01099998888',53400,-300,1,'2021-08-01 03:13:19',0,NULL),(2021080103,'admin@admin.com','관리자','46769&부산 강서구 가덕해안로 3&회사','신종현','01033337777',208300,-1000,1,'2021-08-01 03:15:18',0,NULL),(2021080104,'visitor','홍길동','06307&서울 강남구 개포로 202&집','이순신','01033332222',74100,0,1,'2021-08-01 03:16:47',0,'01000000000'),(2021080105,'visitor','강감찬','06035&서울 강남구 가로수길 5&회사','김태희','01011113333',72300,0,1,'2021-08-01 03:17:53',0,'01022221111'),(2021080106,'visitor','김길동','06035&서울 강남구 가로수길 5&회사','신종현','01099998888',45400,0,1,'2021-08-01 03:19:32',0,'01066665555');
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
INSERT INTO `orders_detail` VALUES (1,2021080101,9,4,1,'메세지 - 회원정기구독테스트',0,'admin@admin.com',0,'2021-08-08','주문접수',0),(2,2021080101,9,4,1,'메세지 - 회원정기구독테스트',0,'admin@admin.com',0,'2021-08-22','주문접수',0),(3,2021080101,9,4,1,'메세지 - 회원정기구독테스트',0,'admin@admin.com',0,'2021-09-05','주문접수',0),(4,2021080101,9,4,1,'메세지 - 회원정기구독테스트',0,'admin@admin.com',0,'2021-09-19','주문접수',0),(5,2021080102,5,4,1,'메세지 - 회원바로구매테스트',0,'admin@admin.com',0,'2021-08-02','주문접수',0),(6,2021080103,5,4,1,'메세지 - 회원장바구니구매테스트',0,'admin@admin.com',1,'2021-08-04','주문접수',0),(7,2021080103,2,4,1,'메세지 - 회원장바구니구매테스트',0,'admin@admin.com',2,'2021-08-05','주문접수',0),(8,2021080103,4,4,1,'메세지 - 회원장바구니구매테스트',0,'admin@admin.com',4,'2021-08-03','주문접수',0),(9,2021080103,1,4,1,'메세지 - 회원장바구니구매테스트',0,'admin@admin.com',5,'2021-08-18','주문접수',0),(10,2021080104,6,4,1,'메세지 - 비회원정기구독테스트',0,'visitor',0,'2021-08-06','주문접수',0),(11,2021080104,6,4,1,'메세지 - 비회원정기구독테스트',0,'visitor',0,'2021-08-20','주문접수',0),(12,2021080104,6,4,1,'메세지 - 비회원정기구독테스트',0,'visitor',0,'2021-09-03','주문접수',0),(13,2021080104,6,4,1,'메세지 - 비회원정기구독테스트',0,'visitor',0,'2021-09-17','주문접수',0),(14,2021080105,3,4,1,'메세지 - 비회원장바구니구매테스트',0,'visitor',0,'2021-08-08','주문접수',0),(15,2021080106,2,4,1,'메세지 - 비회원바로구매테스트',0,'visitor',0,'2021-08-18','주문접수',0);
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
INSERT INTO `qna` VALUES (1,0,'질문있습니다','답변해주세요',NULL,'2021-07-29 23:34:00',NULL,NULL,'admin@admin.com'),(2,0,'상태가 안좋아요','상태가 메롱','숫자3콤마.txt','2021-07-30 12:37:22',NULL,NULL,'admin@admin.com');
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
INSERT INTO `review` VALUES (1,7,'admin@admin.com','좋다구요','좋다구요',4,'2021-07-28 23:13:53',NULL,200),(2,10,'admin@admin.com','와이프가 너무좋아하네요','정말 강추드려요',5,'2021-07-29 01:58:59',NULL,200),(3,2,'admin@admin.com','산호초 같은 꽃','너무좋아',4,'2021-07-29 01:59:18',NULL,200),(4,5,'admin@admin.com','좋아요','좋아요',4,'2021-07-29 01:59:30',NULL,200),(5,8,'admin@admin.com','산호초가 왔어요','꽃은 어디에?',1,'2021-07-29 01:59:47',NULL,200),(6,4,'admin@admin.com','좋아요!!!','좋습니다',5,'2021-07-29 02:00:11',NULL,200),(7,9,'admin@admin.com','추천드려요','너무 싱싱해요',5,'2021-07-29 02:00:32',NULL,200),(8,12,'admin@admin.com','저번보다 덜 싱싱해요','실망이예요',3,'2021-07-29 02:03:32',NULL,200),(9,11,'admin@admin.com','향기롭다','너무좋다',3,'2021-07-29 02:03:48',NULL,200);
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

-- Dump completed on 2021-08-01  3:40:48
