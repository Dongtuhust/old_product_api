-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 06, 2018 lúc 07:48 PM
-- Phiên bản máy phục vụ: 10.1.34-MariaDB
-- Phiên bản PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `old_product_service`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `price` int(10) NOT NULL,
  `description` varchar(500) NOT NULL,
  `product_image` varchar(40) NOT NULL,
  `detail_image` varchar(20) NOT NULL,
  `percent` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `buy_time` date DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_mail` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `description`, `product_image`, `detail_image`, `percent`, `status`, `buy_time`, `update_time`, `created_time`, `user_mail`) VALUES
(1, 'Couter Stricke', 800000, 'Tựa game bắn súng cực hót cho ae , mình mới mua đầu tết vẫn còn mới nguyên hộp còn bảo hành đến tháng 2/2019 ', '../image/img1.jpg', '', '97%', 'Đã bán', NULL, '2018-08-13 15:19:05', '2018-08-13 15:19:05', 'dongtu.hust@gmail.com'),
(2, 'Layers of fear', 700000, 'Đĩa game Layers of fear thể loại kịnh dị rất đáng để sở hữu mua mới 1tr bán lại 700k hoặc thuê vs giá 300k 1 tuần , tình trạng hơi xước nhẹ hộp còn nguyên', '../image/img2.jpg', '', '86%', '', NULL, '2018-08-13 15:19:05', '2018-08-13 15:19:05', 'hai@gmail.com'),
(3, 'Amazing Spiderman', 900000, 'Dành cho ae nào mê các siêu anh hùng , đĩa Amazing spiderman cực hot giá thị trường 1tr3 bán lại 900k còn nguyên hộp đĩa vẫn mới còn bảo hành đến tháng 4/2019', '../image/img3.jpg', '', '95%', '', NULL, '2018-08-13 15:19:05', '2018-08-13 15:19:05', 'chudiep@gmail.com'),
(6, 'The Division', 800000, 'Đĩa game ps4 cực hot nửa đầu năm 2017, giá thị trường 1tr3 bán lại 800k còn nguyên hộp đĩa vẫn mới còn bảo hành đến tháng 5/2019', '../image/img6.jpg', '', '91%', '', NULL, '2018-08-13 15:19:05', '2018-08-13 15:19:05', 'dongtugg@gmail.com'),
(7, 'Need for speed', 899000, 'Dành cho ae yêu tốc độ , đĩa Need for speed cực hot giá thị trường 1tr2 bán lại 899k còn nguyên hộp đĩa vẫn mới còn bảo hành đến tháng 4/2019', '../image/img7.jpg', '', '87%', '', NULL, '2018-08-13 15:19:05', '2018-08-13 15:19:05', 'ducmung@gmail.com'),
(8, 'Mortal Kombat X', 799000, 'Mortal combat X cực hot cho ae giá siêu rẻ, mình mua mới 1tr5 bán lại 799k còn nguyên hộp đĩa hơi xước nhưng chơi vẫn ngon mình k cho thuê nhé', '../image/img8.jpg', '', '76%', '', NULL, '2018-08-13 15:19:05', '2018-08-13 15:19:05', 'duongson@gmail.com'),
(9, 'Fifa 17', 800000, 'Fifa 17 đồ họa cự đẹp, giá thị trường 1tr1 bán lại 800k còn nguyên hộp đĩa vẫn mới còn bảo hành đến tháng 4/2019', '../image/img9.jpg', '', '99%', '', NULL, '2018-08-13 15:19:05', '2018-08-13 15:19:05', 'luuvu@gmail.com'),
(11, 'Watch Dogs 2', 700000, 'Nhân vật chính của chúng ta không hề ngạc nhiên vẫn tiếp tục là một hacker sừng sỏ có thể kiểm soát gần như mọi hoạt động trong thành phố chỉ bằng thao tác trên chiếc điện thoại thông minh. Dù vậy Aiden Pearce đã rời khỏi cuộc chơi để nhường chỗ cho Marcus Holloway - một người Mỹ da màu sinh sống ở vùng vịnh Oakland, San Francisco.', '../image/img11.jpg', '', '95%', '', NULL, '2018-08-13 15:19:05', '2018-08-13 15:19:05', '20156827@student.hust.edu.vn'),
(12, 'Far Cry 5', 900000, 'Far Cry 5 cực hot cho ae giá mua 1tr2 bán lại 900k đầy đủ hộp giấy bảo hành đến tháng 9/2019', '../image/product_user/farcry.jpg', '', '96%', '', NULL, '2018-08-13 15:19:05', '2018-08-13 15:19:05', 'dongtu.hust@gmail.com'),
(13, 'Bio Shock ', 1000000, 'Tựa game bắn súng cực hot cho ae , ra đời được 5 năm nhưng sức hút k hề giảm mua mới 1tr5 bán lại 1tr hình thức hơi xước nhẹ nhưng vẫn chơi ngon lành ', '../image/product_user/bioshock.jpg', '', '86%', '', NULL, '2018-08-13 15:19:05', '2018-08-13 15:19:05', 'dongtu.hust@gmail.com'),
(14, 'Đột kích ', 900000, 'adjsad', '../image/product_user/dotkich.jpg', '', '96%', 'Đã bán', NULL, '2018-08-13 15:19:05', '2018-08-13 15:19:05', 'dongtu.hust@gmail.com');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
