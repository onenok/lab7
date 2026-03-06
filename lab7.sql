-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2026-03-06 13:53:12
-- 伺服器版本： 10.4.32-MariaDB
-- PHP 版本： 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+08:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `lab7`
--

-- --------------------------------------------------------

--
-- 資料表結構 `cart`
--

CREATE TABLE `cart` (
  `cart_id` bigint(20) NOT NULL COMMENT '購物車項目唯一編號',
  `member_id` varchar(50) NOT NULL COMMENT '會員帳號',
  `product_id` int(11) NOT NULL COMMENT '商品編號（參考 products 表）',
  `snapshot_name` varchar(100) NOT NULL COMMENT '加入時的商品名稱',
  `snapshot_price` decimal(10,2) NOT NULL COMMENT '加入時的價格',
  `snapshot_description` text DEFAULT NULL COMMENT '加入時的描述（可選）',
  `snapshot_type` enum('drinks','food','toy','e-things') NOT NULL COMMENT '加入時的類型',
  `qty` int(11) NOT NULL DEFAULT 1 COMMENT '數量',
  `created_at` datetime DEFAULT current_timestamp() COMMENT '加入時間',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '最後修改時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='購物車（快照版）';

-- --------------------------------------------------------

--
-- 資料表結構 `member`
--

CREATE TABLE `member` (
  `member_id` varchar(50) NOT NULL COMMENT '登入帳號，註冊後不可更改',
  `pwd` varchar(255) NOT NULL COMMENT '密碼（建議使用雜湊）',
  `member_name` varchar(100) NOT NULL COMMENT '顯示名稱，可重複',
  `member_telno` varchar(20) DEFAULT NULL COMMENT '電話號碼，可為空',
  `member_addr` text DEFAULT NULL COMMENT '地址，可為空',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='會員資料表';

--
-- 傾印資料表的資料 `member`
--

INSERT INTO `member` (`member_id`, `pwd`, `member_name`, `member_telno`, `member_addr`, `created_at`, `updated_at`) VALUES
('jackyhk', 'jackyhk99', 'Jacky HK', NULL, NULL, '2026-03-06 15:47:54', '2026-03-06 15:47:54'),
('kenny123', 'kenny1234', 'Kenny Wong', '91234567', 'Room 101, Block A', '2026-03-06 15:47:54', '2026-03-06 15:47:54'),
('lily_ho', 'lilyho2023', 'Lily Ho', '98765432', NULL, '2026-03-06 15:47:54', '2026-03-06 15:47:54'),
('mary_cheung', 'maryc123', 'Mary Cheung', '91288899', '88 Example St', '2026-03-06 15:47:54', '2026-03-06 15:47:54'),
('sophia_lam', 'sophia2026', 'Sophia Lam', '60123456', '168 Sample Rd', '2026-03-06 15:47:54', '2026-03-06 15:47:54'),
('tommychan', 'tommy888', 'Tommy Chan', NULL, 'Flat 8, Tower B', '2026-03-06 15:47:54', '2026-03-06 15:47:54');

-- --------------------------------------------------------

--
-- 資料表結構 `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `type` enum('drinks','food','toy','e-things') NOT NULL,
  `supplier` varchar(80) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `type`, `supplier`, `description`, `price`, `updated_at`, `created_at`) VALUES
(1, '可樂 Classic', 'drinks', '可口可樂公司', '經典碳酸飲料，冰涼爽口', 18.50, '2026-03-06 15:57:28', '2026-03-06 15:57:28'),
(2, '鮮奶茶 500ml', 'drinks', '統一企業', '濃郁奶香紅茶', 25.00, '2026-03-06 15:57:28', '2026-03-06 15:57:28'),
(3, '礦泉水 600ml', 'drinks', '康師傅', '天然弱鹼性水', 8.00, '2026-03-06 15:57:28', '2026-03-06 15:57:28'),
(5, '巧克力夾心餅乾', 'food', 'OREO', '酥脆可口夾心', 32.50, '2026-03-06 15:57:28', '2026-03-06 15:57:28'),
(6, '牛肉乾原味', 'food', '老四川', '香辣軟嫩牛肉乾', 68.00, '2026-03-06 15:57:28', '2026-03-06 15:57:28'),
(7, '泰國芒果乾', 'food', '泰國皇家', '天然果乾無添加', 55.00, '2026-03-06 15:57:28', '2026-03-06 15:57:28'),
(8, '樂高經典積木 1000片', 'toy', 'LEGO', '基礎創意積木組', 399.00, '2026-03-06 15:57:28', '2026-03-06 15:57:28'),
(9, '毛絨泰迪熊 50cm', 'toy', '迪士尼授權', '超軟Q彈抱抱熊', 280.00, '2026-03-06 15:57:28', '2026-03-06 15:57:28'),
(10, '遙控賽車 1:16', 'toy', 'Double Eagle', '高速四驅越野車', 450.00, '2026-03-06 15:57:28', '2026-03-06 15:57:28'),
(11, '泡泡槍 電動', 'toy', '玩具反斗城', '夏天戶外必備', 120.00, '2026-03-06 15:57:28', '2026-03-06 15:57:28'),
(12, '無線藍牙耳機 TWS', 'e-things', '小米', '降噪入耳式', 499.00, '2026-03-06 15:57:28', '2026-03-06 15:57:28'),
(13, '行動電源 20000mAh', 'e-things', 'Anker', '快充支援PD', 799.00, '2026-03-06 15:57:28', '2026-03-06 15:57:28'),
(14, 'USB-C 充電線 1.2m', 'e-things', 'Belkin', '耐彎折編織線', 149.00, '2026-03-06 15:57:28', '2026-03-06 15:57:28'),
(15, '智慧檯燈 護眼', 'e-things', 'Yeelight', '色溫可調 USB供電', 299.00, '2026-03-06 15:57:28', '2026-03-06 15:57:28'),
(16, '綠茶無糖 580ml', 'drinks', '統一', '清爽日式綠茶', 19.00, '2026-03-06 15:57:28', '2026-03-06 15:57:28'),
(17, '洋蔥圈零食', 'food', '好麗友', '香脆洋蔥風味', 28.00, '2026-03-06 15:57:28', '2026-03-06 15:57:28'),
(18, '變形金剛 柯博文', 'toy', '孩之寶', '經典領袖級變形', 1200.00, '2026-03-06 15:57:28', '2026-03-06 15:57:28'),
(19, '無線充電板 15W', 'e-things', 'Baseus', '支援多協議快充', 299.00, '2026-03-06 15:57:28', '2026-03-06 15:57:28'),
(20, '鳳梨酥禮盒 12入', 'food', '微熱山丘', '經典伴手禮', 380.00, '2026-03-06 15:57:28', '2026-03-06 15:57:28');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD UNIQUE KEY `uk_member_product` (`member_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- 資料表索引 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`member_id`);

--
-- 資料表索引 `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '購物車項目唯一編號';

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
