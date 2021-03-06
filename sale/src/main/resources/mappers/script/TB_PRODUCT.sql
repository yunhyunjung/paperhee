CREATE TABLE `tb_product` (
  `PROD_CODE` varchar(12) NOT NULL COMMENT '제품코드',
  `SEQ` int(11) NOT NULL,
  `PROD_NAME` varchar(450) NOT NULL COMMENT '제품명',
  `SERIAL_NO` varchar(45) DEFAULT NULL COMMENT '시리얼번호',
  `MODEL` varchar(450) DEFAULT NULL COMMENT '모델',
  `MANUFACTURER` varchar(450) DEFAULT NULL COMMENT '제조사',
  `PRICE` int(11) DEFAULT '0' COMMENT '가격',
  `UNIT_PRICE` int(11) DEFAULT '0' COMMENT '단가',
  `PROD_DATE` date DEFAULT NULL,
  `AF_SERVICE` varchar(4500) DEFAULT NULL COMMENT '애프터서비스 ',
  `WEIGHT` int(11) DEFAULT '0' COMMENT '무게',
  `HEIGHT` int(11) DEFAULT '0' COMMENT '크기',
  `INTERFACE` varchar(450) DEFAULT NULL COMMENT '인터페이스',
  `INPUT` varchar(450) DEFAULT NULL COMMENT '인풋',
  `OUTPUT` varchar(450) DEFAULT NULL,
  `ETC` varchar(4500) DEFAULT NULL COMMENT '기타',
  `ADD_ONS` varchar(4500) DEFAULT NULL COMMENT '부가기능',
  `CREATE_ID` varchar(50) DEFAULT NULL COMMENT '생성자',
  `CREATE_DATE` date DEFAULT NULL COMMENT '생서일자',
  `MODIFY_ID` varchar(50) DEFAULT NULL COMMENT '수정자',
  `MODIFY_DATE` date DEFAULT NULL,
  PRIMARY KEY (`PROD_CODE`),
  UNIQUE KEY `SEQ_UNIQUE` (`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='제품';
