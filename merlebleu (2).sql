-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- 생성 시간: 24-07-05 05:10
-- 서버 버전: 8.0.36
-- PHP 버전: 8.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `merlebleu`
--

-- --------------------------------------------------------

--
-- 테이블 구조 `cart`
--

CREATE TABLE `cart` (
  `cart_id` bigint NOT NULL,
  `reg_time` datetime(6) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `member_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 테이블의 덤프 데이터 `cart`
--

INSERT INTO `cart` (`cart_id`, `reg_time`, `update_time`, `created_by`, `modified_by`, `member_id`) VALUES
(1, '2024-07-04 11:25:14.895681', '2024-07-04 11:25:14.895681', 'robot0220@naver.com', 'robot0220@naver.com', 1);

-- --------------------------------------------------------

--
-- 테이블 구조 `cart_item`
--

CREATE TABLE `cart_item` (
  `cart_item_id` bigint NOT NULL,
  `reg_time` datetime(6) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `count` int NOT NULL,
  `cart_id` bigint DEFAULT NULL,
  `item_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `cart_item_seq`
--

CREATE TABLE `cart_item_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 테이블의 덤프 데이터 `cart_item_seq`
--

INSERT INTO `cart_item_seq` (`next_val`) VALUES
(151);

-- --------------------------------------------------------

--
-- 테이블 구조 `cart_seq`
--

CREATE TABLE `cart_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 테이블의 덤프 데이터 `cart_seq`
--

INSERT INTO `cart_seq` (`next_val`) VALUES
(51);

-- --------------------------------------------------------

--
-- 테이블 구조 `item`
--

CREATE TABLE `item` (
  `item_code` bigint NOT NULL,
  `reg_time` datetime(6) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `category1` varchar(255) NOT NULL,
  `category2` varchar(255) NOT NULL,
  `discount` int NOT NULL,
  `item_nm` varchar(50) NOT NULL,
  `item_sell_status` enum('SELL','SOLD_OUT') DEFAULT NULL,
  `listprice` int NOT NULL,
  `sellprice` int NOT NULL,
  `stock_number` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 테이블의 덤프 데이터 `item`
--

INSERT INTO `item` (`item_code`, `reg_time`, `update_time`, `created_by`, `modified_by`, `category1`, `category2`, `discount`, `item_nm`, `item_sell_status`, `listprice`, `sellprice`, `stock_number`) VALUES
(1, NULL, NULL, 'robot0220@naver.com', 'robot0220@naver.com', '아우터', '쟈켓', 50, '쟈켓1', 'SELL', 10000, 5000, 100),
(2, NULL, NULL, 'robot0220@naver.com', 'robot0220@naver.com', '아우터', '점퍼', 50, '점퍼1', 'SELL', 10000, 5000, 500),
(3, NULL, NULL, 'robot0220@naver.com', 'robot0220@naver.com', '아우터', '트렌치코트', 30, '트렌치코트1', 'SELL', 15000, 10000, 100),
(4, NULL, NULL, 'robot0220@naver.com', 'robot0220@naver.com', '아우터', '코트', 10, '코트1', 'SELL', 80000, 72000, 100),
(5, NULL, NULL, 'robot0220@naver.com', 'robot0220@naver.com', '아우터', '다운/패딩', 10, '다운/패딩1', 'SELL', 60000, 54000, 100),
(6, NULL, NULL, 'robot0220@naver.com', 'robot0220@naver.com', '아우터', '무스탕', 100, '무스탕1', 'SELL', 10000, 0, 150),
(7, NULL, NULL, 'robot0220@naver.com', 'robot0220@naver.com', '아우터', '가디건', 10, '가디건1', 'SELL', 65000, 58500, 100),
(8, NULL, '2024-07-05 12:34:42.098683', 'robot0220@naver.com', 'robot0220@naver.com', '탑', '블라우스/셔츠', 50, '블라우스/셔츠', 'SELL', 20000, 10000, 100),
(9, NULL, NULL, 'robot0220@naver.com', 'robot0220@naver.com', '탑', '티셔츠', 0, '티셔츠', 'SELL', 10000, 10000, 50),
(10, NULL, NULL, 'robot0220@naver.com', 'robot0220@naver.com', '탑', '니트', 20, '니트1', 'SELL', 10000, 8000, 100),
(11, NULL, '2024-07-05 12:48:45.581165', 'robot0220@naver.com', 'robot0220@naver.com', '탑', '슬리브리스', 10, '슬리브리스', 'SELL', 30000, 27000, 500),
(12, NULL, '2024-07-04 17:23:31.424444', 'robot0220@naver.com', 'robot0220@naver.com', '아우터', '쟈켓', 10, '쟈켓2', 'SELL', 90000, 81000, 183),
(13, NULL, NULL, 'robot0220@naver.com', 'robot0220@naver.com', '아우터', '코트', 10, '코트2', 'SELL', 54000, 48600, 12),
(14, NULL, NULL, 'robot0220@naver.com', 'robot0220@naver.com', '원피스', '미니', 50, '원피스미니1', 'SELL', 30000, 15000, 10),
(15, '2024-07-04 17:28:37.310254', '2024-07-04 17:28:37.310254', 'robot0220@naver.com', 'robot0220@naver.com', '스커트', '미니', 50, '미니스커트1', 'SELL', 3000, 1500, 50),
(16, '2024-07-04 17:31:23.754415', '2024-07-04 17:31:23.754415', 'robot0220@naver.com', 'robot0220@naver.com', '스커트', '펜슬', 90, '펜슬 스커트', 'SELL', 2000, 200, 150),
(17, '2024-07-04 17:35:42.431932', '2024-07-04 17:35:42.431932', 'robot0220@naver.com', 'robot0220@naver.com', '스커트', '플레어', 20, '플레어 스커트', 'SELL', 60000, 48000, 300),
(18, '2024-07-04 17:37:13.163427', '2024-07-04 17:37:13.163427', 'robot0220@naver.com', 'robot0220@naver.com', '스커트', '데님', 30, '데님 스커트1', 'SELL', 15000, 10000, 100),
(19, '2024-07-04 17:41:01.796173', '2024-07-04 17:41:01.796173', 'robot0220@naver.com', 'robot0220@naver.com', '팬츠', '포멀', 20, '포멀 팬츠1', 'SELL', 80000, 64000, 500),
(20, '2024-07-05 13:01:02.268192', '2024-07-05 13:01:02.268192', 'robot0220@naver.com', 'robot0220@naver.com', '팬츠', '캐쥬얼', 20, '캐쥬얼 팬츠', 'SELL', 85000, 68000, 100),
(21, '2024-07-05 14:04:35.694931', '2024-07-05 14:04:35.694931', 'robot0220@naver.com', 'robot0220@naver.com', '팬츠', '쇼츠', 40, '쇼츠 팬츠1', 'SELL', 100000, 60000, 100),
(22, '2024-07-05 14:05:56.803105', '2024-07-05 14:05:56.803105', 'robot0220@naver.com', 'robot0220@naver.com', '팬츠', '데님', 50, '데님 팬츠1', 'SELL', 70000, 35000, 1000),
(23, '2024-07-05 14:08:01.267846', '2024-07-05 14:08:01.267846', 'robot0220@naver.com', 'robot0220@naver.com', '원피스', '미디', 10, '원피스 미디', 'SELL', 70000, 63000, 500),
(24, '2024-07-05 14:09:06.794959', '2024-07-05 14:09:06.794959', 'robot0220@naver.com', 'robot0220@naver.com', '원피스', '롱', 10, '원피스 롱1', 'SELL', 600000, 540000, 50);

-- --------------------------------------------------------

--
-- 테이블 구조 `item_img`
--

CREATE TABLE `item_img` (
  `item_img_id` bigint NOT NULL,
  `reg_time` datetime(6) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `img_name` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `ori_img_name` varchar(255) DEFAULT NULL,
  `repimg_yn` varchar(255) DEFAULT NULL,
  `item_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 테이블의 덤프 데이터 `item_img`
--

INSERT INTO `item_img` (`item_img_id`, `reg_time`, `update_time`, `created_by`, `modified_by`, `img_name`, `img_url`, `ori_img_name`, `repimg_yn`, `item_id`) VALUES
(1, '2024-07-03 17:22:28.733832', '2024-07-03 17:22:28.733832', 'robot0220@naver.com', 'robot0220@naver.com', '3f83e699-feb9-4e73-8022-9ba3f24a1a64.jpg', 'http://192.168.106.24/item/3f83e699-feb9-4e73-8022-9ba3f24a1a64.jpg', '1.jpg', 'Y', 1),
(2, '2024-07-03 17:22:28.750821', '2024-07-03 17:22:28.750821', 'robot0220@naver.com', 'robot0220@naver.com', '1caa8aaa-ef1d-4597-965c-95ce46a7b1bf.jpg', 'http://192.168.106.24/item/1caa8aaa-ef1d-4597-965c-95ce46a7b1bf.jpg', '2.jpg', 'N', 1),
(3, '2024-07-03 17:22:28.754819', '2024-07-03 17:22:28.754819', 'robot0220@naver.com', 'robot0220@naver.com', '77657176-cc83-40c3-9d58-069a2e03026a.jpg', 'http://192.168.106.24/item/77657176-cc83-40c3-9d58-069a2e03026a.jpg', '3.jpg', 'N', 1),
(4, '2024-07-03 17:22:28.757818', '2024-07-03 17:22:28.757818', 'robot0220@naver.com', 'robot0220@naver.com', 'd7d06802-47e4-4d4b-aeb9-6e69835b4a01.jpg', 'http://192.168.106.24/item/d7d06802-47e4-4d4b-aeb9-6e69835b4a01.jpg', '4.jpg', 'N', 1),
(5, '2024-07-03 17:22:28.760816', '2024-07-03 17:22:28.760816', 'robot0220@naver.com', 'robot0220@naver.com', '006f103b-eff5-48ab-87d6-9639e27233fd.jpg', 'http://192.168.106.24/item/006f103b-eff5-48ab-87d6-9639e27233fd.jpg', '5.jpg', 'N', 1),
(6, '2024-07-03 17:22:55.452250', '2024-07-03 17:22:55.452250', 'robot0220@naver.com', 'robot0220@naver.com', 'edc9cc2a-1908-4938-83ce-b08a21bfaec2.jpg', 'http://192.168.106.24/item/edc9cc2a-1908-4938-83ce-b08a21bfaec2.jpg', '1.jpg', 'Y', 2),
(7, '2024-07-03 17:22:55.456247', '2024-07-03 17:22:55.456247', 'robot0220@naver.com', 'robot0220@naver.com', '8985d1e2-75f1-428c-9d17-fd13472bbc12.jpg', 'http://192.168.106.24/item/8985d1e2-75f1-428c-9d17-fd13472bbc12.jpg', '2.jpg', 'N', 2),
(8, '2024-07-03 17:22:55.458246', '2024-07-03 17:22:55.458246', 'robot0220@naver.com', 'robot0220@naver.com', '285a54f1-2bf1-4f89-ae80-fcc3a5f2a1fd.jpg', 'http://192.168.106.24/item/285a54f1-2bf1-4f89-ae80-fcc3a5f2a1fd.jpg', '3.jpg', 'N', 2),
(9, '2024-07-03 17:22:55.459246', '2024-07-03 17:22:55.459246', 'robot0220@naver.com', 'robot0220@naver.com', '', '', '', 'N', 2),
(10, '2024-07-03 17:22:55.459246', '2024-07-03 17:22:55.459246', 'robot0220@naver.com', 'robot0220@naver.com', '', '', '', 'N', 2),
(11, '2024-07-03 17:23:24.060128', '2024-07-03 17:23:24.060128', 'robot0220@naver.com', 'robot0220@naver.com', '0ca428cd-76a9-44ef-80e3-99e8f9f60e11.png', 'http://192.168.106.24/item/0ca428cd-76a9-44ef-80e3-99e8f9f60e11.png', '1.png', 'Y', 3),
(12, '2024-07-03 17:23:24.062126', '2024-07-03 17:23:24.062126', 'robot0220@naver.com', 'robot0220@naver.com', '8c47297b-954c-4964-bce1-3af91d31ecf3.png', 'http://192.168.106.24/item/8c47297b-954c-4964-bce1-3af91d31ecf3.png', '11.png', 'N', 3),
(13, '2024-07-03 17:23:24.062126', '2024-07-03 17:23:24.062126', 'robot0220@naver.com', 'robot0220@naver.com', '', '', '', 'N', 3),
(14, '2024-07-03 17:23:24.063125', '2024-07-03 17:23:24.063125', 'robot0220@naver.com', 'robot0220@naver.com', '', '', '', 'N', 3),
(15, '2024-07-03 17:23:24.063125', '2024-07-03 17:23:24.063125', 'robot0220@naver.com', 'robot0220@naver.com', '', '', '', 'N', 3),
(16, '2024-07-03 17:24:06.662432', '2024-07-03 17:24:06.662432', 'robot0220@naver.com', 'robot0220@naver.com', 'ae1d2d6d-3493-4bcf-a4ed-67a04c407edd.jpg', 'http://192.168.106.24/item/ae1d2d6d-3493-4bcf-a4ed-67a04c407edd.jpg', '1.jpg', 'Y', 4),
(17, '2024-07-03 17:24:06.664430', '2024-07-03 17:24:06.664430', 'robot0220@naver.com', 'robot0220@naver.com', '865e0b78-70f5-4d92-95ac-a89ca89f90d7.jpg', 'http://192.168.106.24/item/865e0b78-70f5-4d92-95ac-a89ca89f90d7.jpg', '2.jpg', 'N', 4),
(18, '2024-07-03 17:24:06.666430', '2024-07-03 17:24:06.666430', 'robot0220@naver.com', 'robot0220@naver.com', '2dea224b-3727-4fd1-9a49-613a7a75d225.jpg', 'http://192.168.106.24/item/2dea224b-3727-4fd1-9a49-613a7a75d225.jpg', '3.jpg', 'N', 4),
(19, '2024-07-03 17:24:06.669429', '2024-07-03 17:24:06.669429', 'robot0220@naver.com', 'robot0220@naver.com', '32da67f5-c2dd-4759-9e37-cd667b584f29.jpg', 'http://192.168.106.24/item/32da67f5-c2dd-4759-9e37-cd667b584f29.jpg', '4.jpg', 'N', 4),
(20, '2024-07-03 17:24:06.672426', '2024-07-03 17:24:06.672426', 'robot0220@naver.com', 'robot0220@naver.com', '243d8865-b265-488e-b9b6-8d2e44bc5480.jpg', 'http://192.168.106.24/item/243d8865-b265-488e-b9b6-8d2e44bc5480.jpg', '5.jpg', 'N', 4),
(21, '2024-07-03 17:24:36.058364', '2024-07-03 17:24:36.058364', 'robot0220@naver.com', 'robot0220@naver.com', '47692031-0c8b-478f-9e6e-79fc49c9455b.jpg', 'http://192.168.106.24/item/47692031-0c8b-478f-9e6e-79fc49c9455b.jpg', '1.jpg', 'Y', 5),
(22, '2024-07-03 17:24:36.060362', '2024-07-03 17:24:36.060362', 'robot0220@naver.com', 'robot0220@naver.com', '00d12537-4fd3-41cc-9851-59d64150e06a.jpg', 'http://192.168.106.24/item/00d12537-4fd3-41cc-9851-59d64150e06a.jpg', '11.jpg', 'N', 5),
(23, '2024-07-03 17:24:36.060362', '2024-07-03 17:24:36.060362', 'robot0220@naver.com', 'robot0220@naver.com', '', '', '', 'N', 5),
(24, '2024-07-03 17:24:36.061361', '2024-07-03 17:24:36.061361', 'robot0220@naver.com', 'robot0220@naver.com', '', '', '', 'N', 5),
(25, '2024-07-03 17:24:36.061361', '2024-07-03 17:24:36.061361', 'robot0220@naver.com', 'robot0220@naver.com', '', '', '', 'N', 5),
(26, '2024-07-03 17:25:05.917760', '2024-07-03 17:25:05.917760', 'robot0220@naver.com', 'robot0220@naver.com', 'ea0a1b97-776d-402c-a506-844f8b797781.jpg', 'http://192.168.106.24/item/ea0a1b97-776d-402c-a506-844f8b797781.jpg', '1.jpg', 'Y', 6),
(27, '2024-07-03 17:25:05.920757', '2024-07-03 17:25:05.920757', 'robot0220@naver.com', 'robot0220@naver.com', '4b3c7dc4-4554-40b9-ad2f-78cdfe20bca3.jpg', 'http://192.168.106.24/item/4b3c7dc4-4554-40b9-ad2f-78cdfe20bca3.jpg', '11.jpg', 'N', 6),
(28, '2024-07-03 17:25:05.920757', '2024-07-03 17:25:05.920757', 'robot0220@naver.com', 'robot0220@naver.com', '', '', '', 'N', 6),
(29, '2024-07-03 17:25:05.921757', '2024-07-03 17:25:05.921757', 'robot0220@naver.com', 'robot0220@naver.com', '', '', '', 'N', 6),
(30, '2024-07-03 17:25:05.921757', '2024-07-03 17:25:05.921757', 'robot0220@naver.com', 'robot0220@naver.com', '', '', '', 'N', 6),
(31, '2024-07-03 17:25:35.810481', '2024-07-03 17:25:35.810481', 'robot0220@naver.com', 'robot0220@naver.com', '4a2f6545-4342-41d0-a888-17ef54618808.jpg', 'http://192.168.106.24/item/4a2f6545-4342-41d0-a888-17ef54618808.jpg', '1.jpg', 'Y', 7),
(32, '2024-07-03 17:25:35.812480', '2024-07-03 17:25:35.812480', 'robot0220@naver.com', 'robot0220@naver.com', '37d16321-63b4-4458-9c0d-bafbb2c0277d.jpg', 'http://192.168.106.24/item/37d16321-63b4-4458-9c0d-bafbb2c0277d.jpg', '2.jpg', 'N', 7),
(33, '2024-07-03 17:25:35.814479', '2024-07-03 17:25:35.814479', 'robot0220@naver.com', 'robot0220@naver.com', '4ca970b7-af9e-467f-847e-02f62abfd12c.jpg', 'http://192.168.106.24/item/4ca970b7-af9e-467f-847e-02f62abfd12c.jpg', '3.jpg', 'N', 7),
(34, '2024-07-03 17:25:35.814479', '2024-07-03 17:25:35.814479', 'robot0220@naver.com', 'robot0220@naver.com', '', '', '', 'N', 7),
(35, '2024-07-03 17:25:35.815477', '2024-07-03 17:25:35.815477', 'robot0220@naver.com', 'robot0220@naver.com', '', '', '', 'N', 7),
(36, '2024-07-03 17:35:25.850146', '2024-07-03 17:35:25.850146', 'robot0220@naver.com', 'robot0220@naver.com', '533576ea-3d5e-4eb6-8884-154368398c90.jpg', 'http://192.168.106.24/item/533576ea-3d5e-4eb6-8884-154368398c90.jpg', '1.jpg', 'Y', 8),
(37, '2024-07-03 17:35:25.852146', '2024-07-03 17:35:25.852146', 'robot0220@naver.com', 'robot0220@naver.com', '8d58c8a2-e4b1-4ab3-8576-b20abe0b5dda.jpg', 'http://192.168.106.24/item/8d58c8a2-e4b1-4ab3-8576-b20abe0b5dda.jpg', '2.jpg', 'N', 8),
(38, '2024-07-03 17:35:25.854144', '2024-07-03 17:35:25.854144', 'robot0220@naver.com', 'robot0220@naver.com', 'adb29828-38b7-43c0-bca0-33c70ca3935e.jpg', 'http://192.168.106.24/item/adb29828-38b7-43c0-bca0-33c70ca3935e.jpg', '3.jpg', 'N', 8),
(39, '2024-07-03 17:35:25.862139', '2024-07-03 17:35:25.862139', 'robot0220@naver.com', 'robot0220@naver.com', '00af9bad-3595-41ea-b242-933b10a292d8.jpg', 'http://192.168.106.24/item/00af9bad-3595-41ea-b242-933b10a292d8.jpg', '4.jpg', 'N', 8),
(40, '2024-07-03 17:35:25.865137', '2024-07-03 17:35:25.865137', 'robot0220@naver.com', 'robot0220@naver.com', '874e2518-72d6-448e-ab3d-169c663f444a.jpg', 'http://192.168.106.24/item/874e2518-72d6-448e-ab3d-169c663f444a.jpg', '5.jpg', 'N', 8),
(41, '2024-07-03 17:36:09.400460', '2024-07-03 17:36:09.400460', 'robot0220@naver.com', 'robot0220@naver.com', '49000d56-205d-4738-91fc-f0643779aaea.jpg', 'http://192.168.106.24/item/49000d56-205d-4738-91fc-f0643779aaea.jpg', 'scarf.jpg', 'Y', 9),
(42, '2024-07-03 17:36:09.403459', '2024-07-03 17:36:09.403459', 'robot0220@naver.com', 'robot0220@naver.com', '3ef138e6-4ca1-40cd-b3c3-3a22adf50d4f.jpg', 'http://192.168.106.24/item/3ef138e6-4ca1-40cd-b3c3-3a22adf50d4f.jpg', 'scarf2.jpg', 'N', 9),
(43, '2024-07-03 17:36:09.403459', '2024-07-03 17:36:09.403459', 'robot0220@naver.com', 'robot0220@naver.com', '', '', '', 'N', 9),
(44, '2024-07-03 17:36:09.403459', '2024-07-03 17:36:09.403459', 'robot0220@naver.com', 'robot0220@naver.com', '', '', '', 'N', 9),
(45, '2024-07-03 17:36:09.404458', '2024-07-03 17:36:09.404458', 'robot0220@naver.com', 'robot0220@naver.com', '', '', '', 'N', 9),
(46, '2024-07-03 17:36:56.090522', '2024-07-03 17:36:56.090522', 'robot0220@naver.com', 'robot0220@naver.com', 'dc9eb152-2cdd-4b1c-aa78-294e843337fc.jpg', 'http://192.168.106.24/item/dc9eb152-2cdd-4b1c-aa78-294e843337fc.jpg', 'ni.jpg', 'Y', 10),
(47, '2024-07-03 17:36:56.092520', '2024-07-03 17:36:56.092520', 'robot0220@naver.com', 'robot0220@naver.com', '2b5fe2c8-73fe-43bc-9525-0c8876523275.jpg', 'http://192.168.106.24/item/2b5fe2c8-73fe-43bc-9525-0c8876523275.jpg', 'ni2.jpg', 'N', 10),
(48, '2024-07-03 17:36:56.093520', '2024-07-03 17:36:56.093520', 'robot0220@naver.com', 'robot0220@naver.com', '', '', '', 'N', 10),
(49, '2024-07-03 17:36:56.093520', '2024-07-03 17:36:56.093520', 'robot0220@naver.com', 'robot0220@naver.com', '', '', '', 'N', 10),
(50, '2024-07-03 17:36:56.093520', '2024-07-03 17:36:56.093520', 'robot0220@naver.com', 'robot0220@naver.com', '', '', '', 'N', 10),
(51, '2024-07-03 17:37:24.171416', '2024-07-03 17:37:24.171416', 'robot0220@naver.com', 'robot0220@naver.com', '2c9bfbcd-5d04-44d7-97f2-b368c48f19a2.jpg', 'http://192.168.106.24/item/2c9bfbcd-5d04-44d7-97f2-b368c48f19a2.jpg', '1.jpg', 'Y', 11),
(52, '2024-07-03 17:37:24.181409', '2024-07-03 17:37:24.181409', 'robot0220@naver.com', 'robot0220@naver.com', 'd44cee1b-da8d-4e9d-ad83-266508fbd4b8.jpg', 'http://192.168.106.24/item/d44cee1b-da8d-4e9d-ad83-266508fbd4b8.jpg', '2.jpg', 'N', 11),
(53, '2024-07-03 17:37:24.184408', '2024-07-03 17:37:24.184408', 'robot0220@naver.com', 'robot0220@naver.com', '829137ee-e44a-42df-9848-3f3212c73373.jpg', 'http://192.168.106.24/item/829137ee-e44a-42df-9848-3f3212c73373.jpg', '3.jpg', 'N', 11),
(54, '2024-07-03 17:37:24.186407', '2024-07-03 17:37:24.186407', 'robot0220@naver.com', 'robot0220@naver.com', 'fa00fbf7-fd70-4756-99ba-5e399cc5d599.jpg', 'http://192.168.106.24/item/fa00fbf7-fd70-4756-99ba-5e399cc5d599.jpg', '4.jpg', 'N', 11),
(55, '2024-07-03 17:37:24.189405', '2024-07-03 17:37:24.189405', 'robot0220@naver.com', 'robot0220@naver.com', 'c75bb14a-4521-4398-b0dd-64e4aeb2f1c9.jpg', 'http://192.168.106.24/item/c75bb14a-4521-4398-b0dd-64e4aeb2f1c9.jpg', '11.jpg', 'N', 11),
(56, '2024-07-03 17:39:35.177233', '2024-07-03 17:39:35.177233', 'robot0220@naver.com', 'robot0220@naver.com', '6c740f75-89b8-4861-80a0-5b9a51a9bcba.jpg', 'http://192.168.106.24/item/6c740f75-89b8-4861-80a0-5b9a51a9bcba.jpg', '1010.jpg', 'Y', 12),
(57, '2024-07-03 17:39:35.178232', '2024-07-03 17:39:35.178232', 'robot0220@naver.com', 'robot0220@naver.com', '42d25eb0-0854-48a4-88b9-5fd8da39f030.jpg', 'http://192.168.106.24/item/42d25eb0-0854-48a4-88b9-5fd8da39f030.jpg', '99.jpg', 'N', 12),
(58, '2024-07-03 17:39:35.180231', '2024-07-03 17:39:35.180231', 'robot0220@naver.com', 'robot0220@naver.com', 'e17934cb-e387-4386-9532-6399e8ab34de.jpg', 'http://192.168.106.24/item/e17934cb-e387-4386-9532-6399e8ab34de.jpg', '88.jpg', 'N', 12),
(59, '2024-07-03 17:39:35.182230', '2024-07-03 17:39:35.182230', 'robot0220@naver.com', 'robot0220@naver.com', 'b47d3758-8962-4e73-aa97-bc1ce24852c9.jpg', 'http://192.168.106.24/item/b47d3758-8962-4e73-aa97-bc1ce24852c9.jpg', '77.jpg', 'N', 12),
(60, '2024-07-03 17:39:35.184228', '2024-07-03 17:39:35.184228', 'robot0220@naver.com', 'robot0220@naver.com', '877ca3a0-35bc-4741-b290-af17c9e6638d.jpg', 'http://192.168.106.24/item/877ca3a0-35bc-4741-b290-af17c9e6638d.jpg', '66.jpg', 'N', 12),
(61, '2024-07-03 17:40:24.455248', '2024-07-03 17:40:24.455248', 'robot0220@naver.com', 'robot0220@naver.com', 'deb4708b-ee98-4201-a37d-2fcd1c7aea57.jpg', 'http://192.168.106.24/item/deb4708b-ee98-4201-a37d-2fcd1c7aea57.jpg', '33.jpg', 'Y', 13),
(62, '2024-07-03 17:40:24.457246', '2024-07-03 17:40:24.457246', 'robot0220@naver.com', 'robot0220@naver.com', '5c9bc47e-8c6f-4a73-94e8-2a8b59f4e0b2.jpg', 'http://192.168.106.24/item/5c9bc47e-8c6f-4a73-94e8-2a8b59f4e0b2.jpg', '44.jpg', 'N', 13),
(63, '2024-07-03 17:40:24.459246', '2024-07-03 17:40:24.459246', 'robot0220@naver.com', 'robot0220@naver.com', '7114381b-6d8b-437a-9982-504dd9844316.jpg', 'http://192.168.106.24/item/7114381b-6d8b-437a-9982-504dd9844316.jpg', '11.jpg', 'N', 13),
(64, '2024-07-03 17:40:24.461243', '2024-07-03 17:40:24.461243', 'robot0220@naver.com', 'robot0220@naver.com', 'd669416a-6edc-4916-804e-3eee539deb2d.jpg', 'http://192.168.106.24/item/d669416a-6edc-4916-804e-3eee539deb2d.jpg', '22.jpg', 'N', 13),
(65, '2024-07-03 17:40:24.464243', '2024-07-03 17:40:24.464243', 'robot0220@naver.com', 'robot0220@naver.com', '2ea353e2-1e0b-4f47-96c7-24c3728287f2.jpg', 'http://192.168.106.24/item/2ea353e2-1e0b-4f47-96c7-24c3728287f2.jpg', '55.jpg', 'N', 13),
(102, '2024-07-04 13:03:59.811852', '2024-07-04 13:03:59.811852', 'robot0220@naver.com', 'robot0220@naver.com', 'e27fe300-8b84-478c-a32d-2f944bc96adf.jpg', 'http://192.168.106.24/item/e27fe300-8b84-478c-a32d-2f944bc96adf.jpg', '1.jpg', 'Y', 14),
(103, '2024-07-04 13:03:59.815849', '2024-07-04 13:03:59.815849', 'robot0220@naver.com', 'robot0220@naver.com', 'a5564fd8-51c7-4239-b57c-2046680348c3.jpg', 'http://192.168.106.24/item/a5564fd8-51c7-4239-b57c-2046680348c3.jpg', '2.jpg', 'N', 14),
(104, '2024-07-04 13:03:59.817848', '2024-07-04 13:03:59.817848', 'robot0220@naver.com', 'robot0220@naver.com', '004b7862-4e35-4c96-a51a-395c0f784158.jpg', 'http://192.168.106.24/item/004b7862-4e35-4c96-a51a-395c0f784158.jpg', '3.jpg', 'N', 14),
(105, '2024-07-04 13:03:59.819847', '2024-07-04 13:03:59.819847', 'robot0220@naver.com', 'robot0220@naver.com', '1c79f406-53bc-4d50-82f7-a5f1e7da0144.jpg', 'http://192.168.106.24/item/1c79f406-53bc-4d50-82f7-a5f1e7da0144.jpg', '4.jpg', 'N', 14),
(106, '2024-07-04 13:03:59.819847', '2024-07-04 13:03:59.819847', 'robot0220@naver.com', 'robot0220@naver.com', '', '', '', 'N', 14),
(152, '2024-07-04 17:28:37.337237', '2024-07-04 17:28:37.337237', 'robot0220@naver.com', 'robot0220@naver.com', '00b64ffb-0d9c-421c-b7da-3063afd65014.jpg', 'http://192.168.106.24/item/00b64ffb-0d9c-421c-b7da-3063afd65014.jpg', '1.jpg', 'Y', 15),
(153, '2024-07-04 17:28:37.350229', '2024-07-04 17:28:37.350229', 'robot0220@naver.com', 'robot0220@naver.com', '32204162-3ea1-43ab-9c94-bee08306a79a.jpg', 'http://192.168.106.24/item/32204162-3ea1-43ab-9c94-bee08306a79a.jpg', '2.jpg', 'N', 15),
(154, '2024-07-04 17:28:37.353228', '2024-07-04 17:28:37.353228', 'robot0220@naver.com', 'robot0220@naver.com', 'c46748ea-9912-4c22-8170-e9429dbffea7.jpg', 'http://192.168.106.24/item/c46748ea-9912-4c22-8170-e9429dbffea7.jpg', '3.jpg', 'N', 15),
(155, '2024-07-04 17:28:37.357225', '2024-07-04 17:28:37.357225', 'robot0220@naver.com', 'robot0220@naver.com', '9e02892d-37a0-4809-aac1-cfd04a895ba8.jpg', 'http://192.168.106.24/item/9e02892d-37a0-4809-aac1-cfd04a895ba8.jpg', '4.jpg', 'N', 15),
(156, '2024-07-04 17:28:37.365220', '2024-07-04 17:28:37.365220', 'robot0220@naver.com', 'robot0220@naver.com', 'e46f5375-e2d1-4af8-bcd8-d970dca5f8fd.jpg', 'http://192.168.106.24/item/e46f5375-e2d1-4af8-bcd8-d970dca5f8fd.jpg', '5.jpg', 'N', 15),
(157, '2024-07-04 17:31:23.759411', '2024-07-04 17:31:23.759411', 'robot0220@naver.com', 'robot0220@naver.com', '81c30dce-3301-47d6-a4ba-6d0a83a3cd45.jpg', 'http://192.168.106.24/item/81c30dce-3301-47d6-a4ba-6d0a83a3cd45.jpg', '1.jpg', 'Y', 16),
(158, '2024-07-04 17:31:23.760410', '2024-07-04 17:31:23.760410', 'robot0220@naver.com', 'robot0220@naver.com', '7804ee7b-637d-4b65-91ee-51ddde7357a2.jpg', 'http://192.168.106.24/item/7804ee7b-637d-4b65-91ee-51ddde7357a2.jpg', '2.jpg', 'N', 16),
(159, '2024-07-04 17:31:23.762408', '2024-07-04 17:31:23.762408', 'robot0220@naver.com', 'robot0220@naver.com', '043902f5-44e7-4879-87e3-90d37c12a266.jpg', 'http://192.168.106.24/item/043902f5-44e7-4879-87e3-90d37c12a266.jpg', '3.jpg', 'N', 16),
(160, '2024-07-04 17:31:23.764407', '2024-07-04 17:31:23.764407', 'robot0220@naver.com', 'robot0220@naver.com', '6a40ed81-f053-451f-9f66-fc77e4df1edc.jpg', 'http://192.168.106.24/item/6a40ed81-f053-451f-9f66-fc77e4df1edc.jpg', '4.jpg', 'N', 16),
(161, '2024-07-04 17:31:23.766407', '2024-07-04 17:31:23.766407', 'robot0220@naver.com', 'robot0220@naver.com', '3e9dfa9a-b549-46ed-b2fb-214b34e5aea3.jpg', 'http://192.168.106.24/item/3e9dfa9a-b549-46ed-b2fb-214b34e5aea3.jpg', '5.jpg', 'N', 16),
(162, '2024-07-04 17:35:42.436930', '2024-07-04 17:35:42.436930', 'robot0220@naver.com', 'robot0220@naver.com', '110c16e9-68da-40f5-8d07-d798b519c477.jpg', 'http://192.168.106.24/item/110c16e9-68da-40f5-8d07-d798b519c477.jpg', '1.jpg', 'Y', 17),
(163, '2024-07-04 17:35:42.438928', '2024-07-04 17:35:42.438928', 'robot0220@naver.com', 'robot0220@naver.com', '9375d743-7099-4c50-aa0a-9adea05417a0.jpg', 'http://192.168.106.24/item/9375d743-7099-4c50-aa0a-9adea05417a0.jpg', '2.jpg', 'N', 17),
(164, '2024-07-04 17:35:42.440926', '2024-07-04 17:35:42.440926', 'robot0220@naver.com', 'robot0220@naver.com', '66765c32-57c8-4da5-80bb-3bc0e64a75aa.jpg', 'http://192.168.106.24/item/66765c32-57c8-4da5-80bb-3bc0e64a75aa.jpg', '3.jpg', 'N', 17),
(165, '2024-07-04 17:35:42.441926', '2024-07-04 17:35:42.441926', 'robot0220@naver.com', 'robot0220@naver.com', 'b4cb491c-a962-4472-889e-fb4d2bc229a2.jpg', 'http://192.168.106.24/item/b4cb491c-a962-4472-889e-fb4d2bc229a2.jpg', '4.jpg', 'N', 17),
(166, '2024-07-04 17:35:42.443924', '2024-07-04 17:35:42.443924', 'robot0220@naver.com', 'robot0220@naver.com', 'b9740e28-26a6-4de6-9dd6-0841fad6788b.jpg', 'http://192.168.106.24/item/b9740e28-26a6-4de6-9dd6-0841fad6788b.jpg', '5.jpg', 'N', 17),
(167, '2024-07-04 17:37:13.170423', '2024-07-04 17:37:13.170423', 'robot0220@naver.com', 'robot0220@naver.com', 'a1a0dbc4-2f6e-416b-b38c-80e1254d9f1e.jpg', 'http://192.168.106.24/item/a1a0dbc4-2f6e-416b-b38c-80e1254d9f1e.jpg', '1.jpg', 'Y', 18),
(168, '2024-07-04 17:37:13.172422', '2024-07-04 17:37:13.172422', 'robot0220@naver.com', 'robot0220@naver.com', '147427fd-4069-4676-9a65-2a5abd94a281.jpg', 'http://192.168.106.24/item/147427fd-4069-4676-9a65-2a5abd94a281.jpg', '2.jpg', 'N', 18),
(169, '2024-07-04 17:37:13.175421', '2024-07-04 17:37:13.175421', 'robot0220@naver.com', 'robot0220@naver.com', '458e00a9-2121-4bcd-b3c7-41a59efb9e8a.jpg', 'http://192.168.106.24/item/458e00a9-2121-4bcd-b3c7-41a59efb9e8a.jpg', '3.jpg', 'N', 18),
(170, '2024-07-04 17:37:13.178418', '2024-07-04 17:37:13.178418', 'robot0220@naver.com', 'robot0220@naver.com', '7691cdfc-bc85-4040-b26b-79b4f341e9dc.jpg', 'http://192.168.106.24/item/7691cdfc-bc85-4040-b26b-79b4f341e9dc.jpg', '4.jpg', 'N', 18),
(171, '2024-07-04 17:37:13.184414', '2024-07-04 17:37:13.184414', 'robot0220@naver.com', 'robot0220@naver.com', '847c5c29-543b-4c27-ba29-0638c9b78c0e.jpg', 'http://192.168.106.24/item/847c5c29-543b-4c27-ba29-0638c9b78c0e.jpg', '5.jpg', 'N', 18),
(172, '2024-07-04 17:41:01.801170', '2024-07-04 17:41:01.801170', 'robot0220@naver.com', 'robot0220@naver.com', 'ec048e59-40ef-436f-9861-a835621c813e.jpg', 'http://192.168.106.24/item/ec048e59-40ef-436f-9861-a835621c813e.jpg', '1.jpg', 'Y', 19),
(173, '2024-07-04 17:41:01.802169', '2024-07-04 17:41:01.802169', 'robot0220@naver.com', 'robot0220@naver.com', '1454cf12-d9ec-4918-8398-6d4766ed71ad.jpg', 'http://192.168.106.24/item/1454cf12-d9ec-4918-8398-6d4766ed71ad.jpg', '2.jpg', 'N', 19),
(174, '2024-07-04 17:41:01.804168', '2024-07-04 17:41:01.804168', 'robot0220@naver.com', 'robot0220@naver.com', '6ae55770-cf67-4c91-9034-c4d296d7fb75.jpg', 'http://192.168.106.24/item/6ae55770-cf67-4c91-9034-c4d296d7fb75.jpg', '3.jpg', 'N', 19),
(175, '2024-07-04 17:41:01.806167', '2024-07-04 17:41:01.806167', 'robot0220@naver.com', 'robot0220@naver.com', 'dc4370fa-cc88-4409-94d9-96353f582edb.jpg', 'http://192.168.106.24/item/dc4370fa-cc88-4409-94d9-96353f582edb.jpg', '4.jpg', 'N', 19),
(176, '2024-07-04 17:41:01.807166', '2024-07-04 17:41:01.807166', 'robot0220@naver.com', 'robot0220@naver.com', '5fa48994-8054-42fd-99c0-41d0db37051e.jpg', 'http://192.168.106.24/item/5fa48994-8054-42fd-99c0-41d0db37051e.jpg', '5.jpg', 'N', 19),
(202, '2024-07-05 13:01:02.320159', '2024-07-05 13:01:02.320159', 'robot0220@naver.com', 'robot0220@naver.com', '78d07c55-1315-430e-a668-7077c68de740.jpg', 'http://192.168.106.24/item/78d07c55-1315-430e-a668-7077c68de740.jpg', '1.jpg', 'Y', 20),
(203, '2024-07-05 13:01:02.325156', '2024-07-05 13:01:02.325156', 'robot0220@naver.com', 'robot0220@naver.com', '4a40c729-7638-43e7-8a71-72f6972c1b94.jpg', 'http://192.168.106.24/item/4a40c729-7638-43e7-8a71-72f6972c1b94.jpg', '2.jpg', 'N', 20),
(204, '2024-07-05 13:01:02.327154', '2024-07-05 13:01:02.327154', 'robot0220@naver.com', 'robot0220@naver.com', '7285664f-fa29-4ea1-a2cf-0cdc2483e695.jpg', 'http://192.168.106.24/item/7285664f-fa29-4ea1-a2cf-0cdc2483e695.jpg', '3.jpg', 'N', 20),
(205, '2024-07-05 13:01:02.330153', '2024-07-05 13:01:02.330153', 'robot0220@naver.com', 'robot0220@naver.com', '9d4ba5d7-0311-4c57-824a-4391f8c15453.jpg', 'http://192.168.106.24/item/9d4ba5d7-0311-4c57-824a-4391f8c15453.jpg', '4.jpg', 'N', 20),
(206, '2024-07-05 13:01:02.333150', '2024-07-05 13:01:02.333150', 'robot0220@naver.com', 'robot0220@naver.com', '38db5aba-0abc-4650-8337-d4b4d4b6f925.jpg', 'http://192.168.106.24/item/38db5aba-0abc-4650-8337-d4b4d4b6f925.jpg', '5.jpg', 'N', 20),
(207, '2024-07-05 14:04:35.702926', '2024-07-05 14:04:35.702926', 'robot0220@naver.com', 'robot0220@naver.com', 'e4784303-a67c-4ead-976d-556a4e877b93.jpg', 'http://192.168.106.24/item/e4784303-a67c-4ead-976d-556a4e877b93.jpg', '1.jpg', 'Y', 21),
(208, '2024-07-05 14:04:35.706925', '2024-07-05 14:04:35.706925', 'robot0220@naver.com', 'robot0220@naver.com', 'eae9973a-f89e-4877-9bb4-2583d52d406c.jpg', 'http://192.168.106.24/item/eae9973a-f89e-4877-9bb4-2583d52d406c.jpg', '2.jpg', 'N', 21),
(209, '2024-07-05 14:04:35.709923', '2024-07-05 14:04:35.709923', 'robot0220@naver.com', 'robot0220@naver.com', 'e12fbe8e-4ca4-4c35-878b-930adbd42770.jpg', 'http://192.168.106.24/item/e12fbe8e-4ca4-4c35-878b-930adbd42770.jpg', '3.jpg', 'N', 21),
(210, '2024-07-05 14:04:35.712920', '2024-07-05 14:04:35.712920', 'robot0220@naver.com', 'robot0220@naver.com', 'd2cbf108-6d82-415f-b25d-b3153d278992.jpg', 'http://192.168.106.24/item/d2cbf108-6d82-415f-b25d-b3153d278992.jpg', '4.jpg', 'N', 21),
(211, '2024-07-05 14:04:35.714918', '2024-07-05 14:04:35.714918', 'robot0220@naver.com', 'robot0220@naver.com', 'fd05563c-0368-494c-9073-77f748200b63.jpg', 'http://192.168.106.24/item/fd05563c-0368-494c-9073-77f748200b63.jpg', '5.jpg', 'N', 21),
(212, '2024-07-05 14:05:56.808102', '2024-07-05 14:05:56.808102', 'robot0220@naver.com', 'robot0220@naver.com', 'adc7f962-64c4-4e22-8cdd-14d38463b080.jpg', 'http://192.168.106.24/item/adc7f962-64c4-4e22-8cdd-14d38463b080.jpg', '1.jpg', 'Y', 22),
(213, '2024-07-05 14:05:56.810100', '2024-07-05 14:05:56.810100', 'robot0220@naver.com', 'robot0220@naver.com', 'e70b6dbd-f3ef-48cb-a802-3774884c20b8.jpg', 'http://192.168.106.24/item/e70b6dbd-f3ef-48cb-a802-3774884c20b8.jpg', '2.jpg', 'N', 22),
(214, '2024-07-05 14:05:56.813099', '2024-07-05 14:05:56.813099', 'robot0220@naver.com', 'robot0220@naver.com', 'd1209936-5795-4551-b642-c4aefbf40e34.jpg', 'http://192.168.106.24/item/d1209936-5795-4551-b642-c4aefbf40e34.jpg', '3.jpg', 'N', 22),
(215, '2024-07-05 14:05:56.815097', '2024-07-05 14:05:56.815097', 'robot0220@naver.com', 'robot0220@naver.com', 'ebb12453-3a6c-4aaa-a699-000e6e16a2c6.jpg', 'http://192.168.106.24/item/ebb12453-3a6c-4aaa-a699-000e6e16a2c6.jpg', '4.jpg', 'N', 22),
(216, '2024-07-05 14:05:56.816096', '2024-07-05 14:05:56.816096', 'robot0220@naver.com', 'robot0220@naver.com', '75225107-f8ae-4293-a19e-c5de3fd18ed9.jpg', 'http://192.168.106.24/item/75225107-f8ae-4293-a19e-c5de3fd18ed9.jpg', '5.jpg', 'N', 22),
(217, '2024-07-05 14:08:01.273843', '2024-07-05 14:08:01.273843', 'robot0220@naver.com', 'robot0220@naver.com', '616b7e3d-76ab-4c0c-b387-10d0e92d8dbf.jpg', 'http://192.168.106.24/item/616b7e3d-76ab-4c0c-b387-10d0e92d8dbf.jpg', '1.jpg', 'Y', 23),
(218, '2024-07-05 14:08:01.275842', '2024-07-05 14:08:01.275842', 'robot0220@naver.com', 'robot0220@naver.com', 'f3c0b8f7-f4c1-4cc5-9ff5-48f79aeb7cc4.jpg', 'http://192.168.106.24/item/f3c0b8f7-f4c1-4cc5-9ff5-48f79aeb7cc4.jpg', '2.jpg', 'N', 23),
(219, '2024-07-05 14:08:01.277841', '2024-07-05 14:08:01.277841', 'robot0220@naver.com', 'robot0220@naver.com', 'd323277c-a053-4322-96b3-d11ba15716cb.jpg', 'http://192.168.106.24/item/d323277c-a053-4322-96b3-d11ba15716cb.jpg', '3.jpg', 'N', 23),
(220, '2024-07-05 14:08:01.279839', '2024-07-05 14:08:01.279839', 'robot0220@naver.com', 'robot0220@naver.com', 'f23d19a4-c2cd-454f-a00d-23165eb02a65.jpg', 'http://192.168.106.24/item/f23d19a4-c2cd-454f-a00d-23165eb02a65.jpg', '4.jpg', 'N', 23),
(221, '2024-07-05 14:08:01.281838', '2024-07-05 14:08:01.281838', 'robot0220@naver.com', 'robot0220@naver.com', '6f028e7a-9d6a-4c30-b6c2-48d83a993719.jpg', 'http://192.168.106.24/item/6f028e7a-9d6a-4c30-b6c2-48d83a993719.jpg', '5.jpg', 'N', 23),
(222, '2024-07-05 14:09:06.798958', '2024-07-05 14:09:06.798958', 'robot0220@naver.com', 'robot0220@naver.com', '41ff167a-f2cd-4677-88f2-b5f6bd28f8e3.jpg', 'http://192.168.106.24/item/41ff167a-f2cd-4677-88f2-b5f6bd28f8e3.jpg', '1.jpg', 'Y', 24),
(223, '2024-07-05 14:09:06.799956', '2024-07-05 14:09:06.799956', 'robot0220@naver.com', 'robot0220@naver.com', 'e116d38d-474e-4aa5-9456-8b4d0f4b2a3a.jpg', 'http://192.168.106.24/item/e116d38d-474e-4aa5-9456-8b4d0f4b2a3a.jpg', '2.jpg', 'N', 24),
(224, '2024-07-05 14:09:06.804955', '2024-07-05 14:09:06.804955', 'robot0220@naver.com', 'robot0220@naver.com', 'b9193067-483d-4269-a999-4fcf88b4f182.jpg', 'http://192.168.106.24/item/b9193067-483d-4269-a999-4fcf88b4f182.jpg', '3.jpg', 'N', 24),
(225, '2024-07-05 14:09:06.808950', '2024-07-05 14:09:06.808950', 'robot0220@naver.com', 'robot0220@naver.com', 'b522b9af-5731-4858-b670-aba4305c3a98.jpg', 'http://192.168.106.24/item/b522b9af-5731-4858-b670-aba4305c3a98.jpg', '4.jpg', 'N', 24),
(226, '2024-07-05 14:09:06.810949', '2024-07-05 14:09:06.810949', 'robot0220@naver.com', 'robot0220@naver.com', 'e1dbea5a-5fd9-4f9b-8470-db565e436478.jpg', 'http://192.168.106.24/item/e1dbea5a-5fd9-4f9b-8470-db565e436478.jpg', '5.jpg', 'N', 24);

-- --------------------------------------------------------

--
-- 테이블 구조 `item_img_seq`
--

CREATE TABLE `item_img_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 테이블의 덤프 데이터 `item_img_seq`
--

INSERT INTO `item_img_seq` (`next_val`) VALUES
(301);

-- --------------------------------------------------------

--
-- 테이블 구조 `member`
--

CREATE TABLE `member` (
  `member_id` bigint NOT NULL,
  `reg_time` datetime(6) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `milage` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phonenum` varchar(255) DEFAULT NULL,
  `role` enum('ADMIN','USER') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 테이블의 덤프 데이터 `member`
--

INSERT INTO `member` (`member_id`, `reg_time`, `update_time`, `created_by`, `modified_by`, `address1`, `email`, `milage`, `name`, `password`, `phonenum`, `role`) VALUES
(1, '2024-07-03 17:11:55.703852', '2024-07-03 17:11:55.703852', 'anonymousUser', 'anonymousUser', '부산', 'robot0220@naver.com', NULL, '서민규', '$2a$10$fVNZQQLHFFvjeFYTI4WrJuWQUFgeB7cmbu13aX2bBucH6Ygf1OtHW', NULL, 'ADMIN');

-- --------------------------------------------------------

--
-- 테이블 구조 `member_seq`
--

CREATE TABLE `member_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 테이블의 덤프 데이터 `member_seq`
--

INSERT INTO `member_seq` (`next_val`) VALUES
(51);

-- --------------------------------------------------------

--
-- 테이블 구조 `orders`
--

CREATE TABLE `orders` (
  `order_id` bigint NOT NULL,
  `reg_time` datetime(6) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `order_date` datetime(6) DEFAULT NULL,
  `order_status` enum('CANCEL','ORDER') DEFAULT NULL,
  `member_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 테이블의 덤프 데이터 `orders`
--

INSERT INTO `orders` (`order_id`, `reg_time`, `update_time`, `created_by`, `modified_by`, `order_date`, `order_status`, `member_id`) VALUES
(1, NULL, NULL, 'robot0220@naver.com', 'robot0220@naver.com', '2024-07-04 11:52:23.422077', 'CANCEL', 1),
(2, NULL, NULL, 'robot0220@naver.com', 'robot0220@naver.com', '2024-07-04 11:54:07.092205', 'CANCEL', 1),
(52, NULL, NULL, 'robot0220@naver.com', 'robot0220@naver.com', '2024-07-04 12:37:50.752490', 'CANCEL', 1),
(102, NULL, NULL, 'robot0220@naver.com', 'robot0220@naver.com', '2024-07-04 17:23:02.993214', 'CANCEL', 1);

-- --------------------------------------------------------

--
-- 테이블 구조 `orders_seq`
--

CREATE TABLE `orders_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 테이블의 덤프 데이터 `orders_seq`
--

INSERT INTO `orders_seq` (`next_val`) VALUES
(201);

-- --------------------------------------------------------

--
-- 테이블 구조 `order_item`
--

CREATE TABLE `order_item` (
  `order_item_id` bigint NOT NULL,
  `reg_time` datetime(6) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `count` int NOT NULL,
  `order_price` int NOT NULL,
  `item_id` bigint DEFAULT NULL,
  `order_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 테이블의 덤프 데이터 `order_item`
--

INSERT INTO `order_item` (`order_item_id`, `reg_time`, `update_time`, `created_by`, `modified_by`, `count`, `order_price`, `item_id`, `order_id`) VALUES
(1, '2024-07-04 11:52:23.456098', '2024-07-04 11:52:23.456098', 'robot0220@naver.com', 'robot0220@naver.com', 1, 81000, 12, 1),
(2, '2024-07-04 11:54:07.130182', '2024-07-04 11:54:07.130182', 'robot0220@naver.com', 'robot0220@naver.com', 1, 81000, 12, 2),
(3, '2024-07-04 11:54:07.131182', '2024-07-04 11:54:07.131182', 'robot0220@naver.com', 'robot0220@naver.com', 6, 48600, 13, 2),
(52, '2024-07-04 12:37:50.855425', '2024-07-04 12:37:50.855425', 'robot0220@naver.com', 'robot0220@naver.com', 1, 81000, 12, 52),
(102, '2024-07-04 17:23:03.040186', '2024-07-04 17:23:03.040186', 'robot0220@naver.com', 'robot0220@naver.com', 91, 81000, 12, 102);

-- --------------------------------------------------------

--
-- 테이블 구조 `order_item_seq`
--

CREATE TABLE `order_item_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 테이블의 덤프 데이터 `order_item_seq`
--

INSERT INTO `order_item_seq` (`next_val`) VALUES
(201);

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD UNIQUE KEY `UK_7dds3r67nkhxm9sbs9r5obd46` (`member_id`);

--
-- 테이블의 인덱스 `cart_item`
--
ALTER TABLE `cart_item`
  ADD PRIMARY KEY (`cart_item_id`),
  ADD KEY `FK1uobyhgl1wvgt1jpccia8xxs3` (`cart_id`),
  ADD KEY `FKdljf497fwm1f8eb1h8t6n50u9` (`item_id`);

--
-- 테이블의 인덱스 `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_code`);

--
-- 테이블의 인덱스 `item_img`
--
ALTER TABLE `item_img`
  ADD PRIMARY KEY (`item_img_id`),
  ADD KEY `FKdd5u08y3ap4c46ayrqjf8g88m` (`item_id`);

--
-- 테이블의 인덱스 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`member_id`),
  ADD UNIQUE KEY `UK_mbmcqelty0fbrvxp1q58dn57t` (`email`);

--
-- 테이블의 인덱스 `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `FKpktxwhj3x9m4gth5ff6bkqgeb` (`member_id`);

--
-- 테이블의 인덱스 `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `FKija6hjjiit8dprnmvtvgdp6ru` (`item_id`),
  ADD KEY `FKt4dc2r9nbvbujrljv3e23iibt` (`order_id`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `item`
--
ALTER TABLE `item`
  MODIFY `item_code` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- 덤프된 테이블의 제약사항
--

--
-- 테이블의 제약사항 `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FKix170nytunweovf2v9137mx2o` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`);

--
-- 테이블의 제약사항 `cart_item`
--
ALTER TABLE `cart_item`
  ADD CONSTRAINT `FK1uobyhgl1wvgt1jpccia8xxs3` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`),
  ADD CONSTRAINT `FKdljf497fwm1f8eb1h8t6n50u9` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_code`);

--
-- 테이블의 제약사항 `item_img`
--
ALTER TABLE `item_img`
  ADD CONSTRAINT `FKdd5u08y3ap4c46ayrqjf8g88m` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_code`);

--
-- 테이블의 제약사항 `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FKpktxwhj3x9m4gth5ff6bkqgeb` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`);

--
-- 테이블의 제약사항 `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `FKija6hjjiit8dprnmvtvgdp6ru` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_code`),
  ADD CONSTRAINT `FKt4dc2r9nbvbujrljv3e23iibt` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
