-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th9 19, 2022 lúc 02:23 PM
-- Phiên bản máy phục vụ: 5.7.33
-- Phiên bản PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `dream_cake`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_detail`
--

CREATE TABLE `cart_detail` (
  `id` bigint(20) NOT NULL,
  `amount` int(11) NOT NULL,
  `id_checkout` bigint(20) DEFAULT NULL,
  `name_product` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `price` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `cart_detail`
--

INSERT INTO `cart_detail` (`id`, `amount`, `id_checkout`, `name_product`, `price`) VALUES
(50, 1, 61, 'FRESH FRUIT CREAM CAKE', '160000.0'),
(42, 1, 54, 'FRESH FRUIT CREAM CAKE', '160000.0'),
(51, 1, 61, 'FRESH FRUIT CREAM CAKE', '160000.0'),
(48, 1, 60, 'FRESH FRUIT CREAM CAKE', '160000.0'),
(49, 1, 60, 'BLUBERRY FRESH CREAM CAKE', '150000.0'),
(38, 1, 52, 'DARK CHOCOLATE CAKE', '200000.0'),
(37, 1, 52, 'BLUBERRY FRESH CREAM CAKE', '150000.0'),
(33, 1, 51, 'DARK CHOCOLATE CAKE', '200000.0'),
(32, 1, 51, 'BLUBERRY FRESH CREAM CAKE', '150000.0'),
(31, 1, 51, 'FRESH FRUIT CREAM CAKE', '160000.0'),
(30, 1, 50, 'DARK CHOCOLATE CAKE', '200000.0'),
(29, 1, 50, 'BLUBERRY FRESH CREAM CAKE', '150000.0'),
(28, 1, 50, 'FRESH FRUIT CREAM CAKE', '160000.0'),
(36, 1, 52, 'FRESH FRUIT CREAM CAKE', '160000.0'),
(35, 1, 52, 'BLUBERRY FRESH CREAM CAKE', '150000.0'),
(34, 1, 52, 'FRESH FRUIT CREAM CAKE', '160000.0');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`category_id`, `name`) VALUES
(1, 'Bánh đậu xanh'),
(2, 'Gateaux Kem Tươi'),
(3, 'Gateaux Kem Bơ'),
(4, 'Bánh Mousse'),
(5, 'Gateaux Mousse'),
(6, 'Bánh Valentine - Trái Tim');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `checkout`
--

CREATE TABLE `checkout` (
  `id` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `district` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `checkout`
--

INSERT INTO `checkout` (`id`, `address`, `city`, `district`, `email`, `full_name`, `note`, `phone`, `datetime`) VALUES
(61, '1211 Old Dear Lane', 'Unionville', '21', 'trangtrangxinhgai0403@gmail.com', 'trangtrangxinhgai0403@gmail.com', '7', '8457264467', '2022-09-10 01:54:01'),
(60, 'Lĩnh Nam', 'Hà Nội', 'Hoàng Mai', 'trangtrangxinhgai0403@gmail.com', 'Hà Anh Đức', 'BÁNH CHO NHIỀU KEM', '0333814222', '2022-09-10 00:34:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `image_name` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `price` double NOT NULL,
  `weight` double NOT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `description`, `image_name`, `name`, `price`, `weight`, `category_id`) VALUES
(1, 'Thành phần chính:\r\n\r\n- Gato\r\n\r\n- Kem tươi vị rượu rum\r\n\r\n- Hoa quả\r\n\r\n- Dừa khô.\r\n\r\nBánh làm từ 3 lớp gato trắng xen giữa 3 lớp kem tươi vị rượu rum (nho). Trên mặt bánh được trang trí bằng hoa quả với dừa khô xung quanh.', 'demo_product.png', 'FRESH FRUIT CREAM CAKE', 160000, 5, 1),
(2, 'Thành phần chính:\r\n\r\n- Gato.\r\n\r\n- Sốt việt quất.\r\n\r\n- Kem phomai.\r\n\r\nBánh làm từ 3 lớp gato trắng xen giữa 3 lớp kem phomai. Phủ bên ngoài bằng 1 lớp mứt việt quất thơm ngọt, dễ ăn, không gây cảm giác ngấy.', 'demo_product.png', 'BLUBERRY FRESH CREAM CAKE', 150000, 1, 1),
(3, 'Thành phần chính:\r\n\r\n- Gato,\r\n\r\n- Kem bơ vị rượu rum,\r\n\r\n- Socola.\r\n\r\nBánh được làm từ 3 lớp gato xen giữa 3 lớp kem. Kế tiếp là lớp kem bơ socola vị rượu rum và 1 lớp socola chảy phủ bên ngoài.', 'demo_product.png', 'DARK CHOCOLATE CAKE', 200000, 1, 3),
(4, '(*) KÍCH THƯỚC BÁNH: 20 x 20 CM\r\n\r\nTHÀNH PHẦN CHÍNH :\r\n- GATO \r\n- MATCHA, CHOCOLATE.\r\nBÁNH ĐƯỢC LÀM TỪ 3 LỚP GATO KẾT HỢP VỚI LỚP CREAM TRÀ XANH VÀ CREAM CHOCOLATE. PHỦ MẶT BÁNH 1 LỚP BỘT CACAO VÀ TRANG TRÍ HOA QUẢ THEO MÙA', 'demo_product.png', 'CHOCOLATE MATCHA CAKE MOUSSE VUÔNG', 270000, 2, 5),
(5, 'THÀNH PHẦN CHÍNH :\r\n- GATO \r\n- CARAMEL DỪA \r\nBÁNH ĐƯỢC LÀM TỪ 3 LỚP GATO KẾT HỚP VỚI LỚP CREAM CHEESE , CARAMEL VÀ DỪA. PHỦ MẶT BÁNH 1 LỚP BỘT CƠM DỪA VÀ TRANG TRÍ HOA QUẢ.', ' (2).png', 'CARAMEL COCONUT CAKE MOUSSE VUÔNG', 122310, 120, 6),
(6, 'THÀNH PHẦN CHÍNH :\r\n- GATO \r\n- MATCHA, CHOCOLATE.\r\nBÁNH ĐƯỢC LÀM TỪ 3 LỚP GATO KẾT HỢP VỚI LỚP CREAM TRÀ XANH VÀ CREAM CHOCOLATE. PHỦ MẶT BÁNH 1 LỚP CHOCOLATE ĐEN VÀ TRANG TRÍ SÔ CÔ LA', ' (6).png', 'CHOCOLATE MATCHA CAKE MOUSSE 2', 145000, 3, 3),
(7, 'THÀNH PHẦN CHÍNH :\r\n- GATO \r\n- CREAM CHEESE PHOMAI\r\nBÁNH ĐƯỢC LÀM TỪ 3 LỚP GATO KẾT HỢP VỚI LỚP CREAM CHEESE , PHOMAI. PHỦ MẶT BÁNH 1 LỚP BỘT CACAO VÀ TRANG TRÍ HOA QUẢ.', ' (7).png', 'TIRAMISU CAKE MOUSSE', 1250000, 1, 4),
(8, '', ' (2).png', 'PASSION CAKE MOUSSE VUÔNG', 16000, 200, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slider`
--

CREATE TABLE `slider` (
  `id` bigint(20) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `email`, `first_name`, `last_name`, `password`) VALUES
(1, '1@gmail.com', 'Hà ', 'Anh Đức', '$2a$10$/nkT9uknlDpk9W3gIAhY5uoMZgI/fE0wYOIMmOC5SGv3XExO.CZpu'),
(2, '2@gmail.com', 'Hà ', 'Anh Đức', '$2a$10$l1ppId5.d97FX83BVp0FfeWTj9rsavO8XnF8zy3.crRqTXdDM4C86'),
(3, '3@gmail.com', 'Admin', 'admin', '$2a$10$.wpl9zYn73Z7rlGTGJrl5e9zp9761na6ZNh.yNHpDe7A8FfwIN2rG'),
(4, '4@gmail.com', 'ANH ĐỨC', 'ANH ĐỨC', '$2a$10$55L./acMPdZJarn7NhqAluAP3ugJi.qxtZRivgzg.telvHkNMKdZG'),
(7, '5@gmail.com', '5@gmail.com', '5@gmail.com', '$2a$10$CtiFb070wCYhkE.0gtbC9OZdEob9dj/DlRakokjDKdmxXDYDI0L8e'),
(8, 'ad2min@gmail.com', 'Admin', 'admin', '$2a$10$nLZWcOXCQqVzSNKV3t2Ue.v1J/2iG4i8JTsRY3UMqRH3DCsOS6mAC'),
(9, 'ad2min@gmail.com', 'Admin', 'admin', '$2a$10$SgovWIpO96rpOBfRuTHL7.NsZWBdJMWixE6tUCZ6Vt8kGBoRxUqY.'),
(10, '222@gmail.com', 'Duc', 'Ha', '$2a$10$VjnNKkgYxQ8RvY20mrq02On2L.Fvn/keW9BkkaTOgSm3aZyFqLJza');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_role`
--

CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `checkout`
--
ALTER TABLE `checkout`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user_role`
--
ALTER TABLE `user_role`
  ADD KEY `FKt7e7djp752sqn6w22i6ocqy6q` (`role_id`),
  ADD KEY `FKj345gk1bovqvfame88rcx7yyx` (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cart_detail`
--
ALTER TABLE `cart_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `checkout`
--
ALTER TABLE `checkout`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `slider`
--
ALTER TABLE `slider`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
