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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='상품';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'썬플라워 에디션','찬란한 여름 햇살 가득',33900,47,'1_1_1.jpg','1_1_2.jpg','1_1_3.jpg','1_1_4.jpg','2021-07-23 10:46:11',0.9,'M','판매','on sale','1_1_5.png',1),(2,'보라빛 향기 에디션','청초하고 은은한 매력',42900,44,'2_1_1.jpg','2_1_2.jpg','2_1_3.jpg','2_1_4.jpg','2021-07-23 10:47:34',0.9,'L','판매','on sale','2_1_5.png',1),(3,'오렌지 로즈 부케','마음과 함께 수줍게 전하는',40100,50,'3_1_1.jpg','3_1_2.jpg','3_1_3.jpg','3_1_4.jpg','2021-07-23 10:48:46',0.9,'L','판매','on sale','3_1_5.png',1),(4,'레드 로즈 부케','클래식한 사랑의 꽃',54900,49,'4_2_1.jpg','4_2_2.jpg','4_2_3.jpg','4_2_4.jpg','2021-07-23 10:50:14',0.9,'XL','판매','on sale','4_2_5.png',2),(5,'연핑크 수국 에디션','몽글몽글 피어나는 구름을 담은',59900,49,'5_2_1.jpg','5_2_2.jpg','5_2_3.jpg','5_2_4.jpg','2021-07-30 19:27:39',0.9,'XL','판매','on sale','5_2_5.png',2),(6,'가벼운 S 꽃구독','꽃이 일상이 되는 가벼운 시작',17900,911,'3_s_15.jpg','3_s_25.jpg','3_s_35.jpg','3_s_45.jpg','2021-07-30 13:03:24',1,'S','판매','on sale','3_s_52.png',3),(7,'가득찬 XL 꽃구독','꽃으로 가득차는 일상의 행복',49900,961,'3_xl_1.jpg','3_xl_2.jpg','3_xl_3.jpg','3_xl_4.jpg','2021-07-30 13:31:00',1,'XL','판매','on sale','3_xl_5.png',3),(8,'풍성한 L 꽃구독','매일이 풍성해지는 일상의 행복',34900,995,'3_l_1.jpg','3_l_2.jpg','3_l_3.jpg','3_l_4.jpg','2021-07-30 13:30:14',1,'L','판매','on sale','3_l_5.png',3),(9,'딱좋은 M 꽃구독','내 공간이 꽃이 되는 좋은 시작',26900,991,'3_m_1.jpg','3_m_2.jpg','3_m_3.jpg','3_m_4.jpg','2021-07-30 13:29:19',1,'M','판매','on sale','3_m_5.png',3),(10,'파랑새 에디션','행운을 전하는',56900,50,'10_2_1.jpg','10_2_2.jpg','10_2_3.jpg','10_2_4.jpg','2021-08-03 20:28:06',1,'XL','판매','on sale','10_2_5.png',2);
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
INSERT INTO `member` VALUES ('admin@admin.com','1234','관리자','0','2000-10-10',1,3,'on','2021-07-27',NULL,974100),('visitor','1234','비회원구매','0','2020-01-01',1,0,NULL,'2021-07-27',NULL,0);
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

-- Dump completed on 2021-08-06 23:12:07
