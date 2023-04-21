-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.11.2-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- test 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `test`;

-- 테이블 test.admin_table 구조 내보내기
CREATE TABLE IF NOT EXISTS `admin_table` (
  `ADMIN_PW` varchar(20) NOT NULL COMMENT '관리자비밀번호'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='관리자';

-- 테이블 데이터 test.admin_table:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `admin_table` DISABLE KEYS */;
INSERT IGNORE INTO `admin_table` (`ADMIN_PW`) VALUES
	('01020304');
/*!40000 ALTER TABLE `admin_table` ENABLE KEYS */;

-- 테이블 test.fee_calcltn_dta_table 구조 내보내기
CREATE TABLE IF NOT EXISTS `fee_calcltn_dta_table` (
  `BASIC_MINT` decimal(8,0) NOT NULL COMMENT '기본분',
  `BASIC_FEE` float(10,0) NOT NULL COMMENT '기본요금',
  `ADDTN_MINT` decimal(8,0) NOT NULL COMMENT '추가분',
  `ADDTN_FEE` float(10,0) NOT NULL COMMENT '추가요금',
  `MONTH_FXPRD_FEE` float(10,0) NOT NULL COMMENT '월정기요금',
  `YY_FXPRD_FEE` float(10,0) NOT NULL COMMENT '년정기요금'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='요금산출자료테이블';

-- 테이블 데이터 test.fee_calcltn_dta_table:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `fee_calcltn_dta_table` DISABLE KEYS */;
INSERT IGNORE INTO `fee_calcltn_dta_table` (`BASIC_MINT`, `BASIC_FEE`, `ADDTN_MINT`, `ADDTN_FEE`, `MONTH_FXPRD_FEE`, `YY_FXPRD_FEE`) VALUES
	(120, 2000, 10, 500, 200000, 2000000);
/*!40000 ALTER TABLE `fee_calcltn_dta_table` ENABLE KEYS */;

-- 테이블 test.vhcl_cust_table 구조 내보내기
CREATE TABLE IF NOT EXISTS `vhcl_cust_table` (
  `SEQ` decimal(10,0) NOT NULL DEFAULT 0 COMMENT '순번',
  `VHCLNO` varchar(20) NOT NULL COMMENT '차량번호',
  `ENTVHCL_DTTM` datetime NOT NULL DEFAULT current_timestamp() COMMENT '입차일시',
  `LVVHCL_DTTM` datetime DEFAULT NULL COMMENT '출차일시',
  `STATE_NM` varchar(50) NOT NULL DEFAULT 'I' COMMENT '상태명',
  `STLMT_AMTMN` float(23,6) DEFAULT NULL COMMENT '결제금액',
  `FXPRD_TCKT_START_DTTM` datetime DEFAULT NULL COMMENT '정기권시작일시',
  `FXPRD_TCKT_FNSH_DTTM` datetime DEFAULT NULL COMMENT '정기권종료일시',
  `FXPRD_TCKT_STLMT_AMTMN` float(23,6) DEFAULT NULL COMMENT '정기권결제금액',
  PRIMARY KEY (`SEQ`),
  CONSTRAINT `CK_STATE_NM` CHECK (`STATE_NM` in ('I','O','P'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='차량고객';

-- 테이블 데이터 test.vhcl_cust_table:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `vhcl_cust_table` DISABLE KEYS */;
INSERT IGNORE INTO `vhcl_cust_table` (`SEQ`, `VHCLNO`, `ENTVHCL_DTTM`, `LVVHCL_DTTM`, `STATE_NM`, `STLMT_AMTMN`, `FXPRD_TCKT_START_DTTM`, `FXPRD_TCKT_FNSH_DTTM`, `FXPRD_TCKT_STLMT_AMTMN`) VALUES
	(1, '02가0206', '2023-04-18 14:49:50', NULL, 'I', NULL, NULL, NULL, NULL),
	(2, '18오2345', '2023-04-18 14:51:28', NULL, 'O', NULL, NULL, NULL, NULL),
	(3, '8888', '2023-04-21 17:01:28', NULL, 'I', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `vhcl_cust_table` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
