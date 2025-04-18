-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2025 at 12:11 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tailor_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `blouse_categories`
--

CREATE TABLE `blouse_categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `fabric` varchar(255) DEFAULT NULL,
  `material` varchar(255) DEFAULT NULL,
  `completion_days` varchar(255) DEFAULT NULL,
  `price_range` varchar(255) NOT NULL,
  `Product_Details` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blouse_categories`
--

INSERT INTO `blouse_categories` (`category_id`, `category_name`, `image`, `fabric`, `material`, `completion_days`, `price_range`, `Product_Details`) VALUES
(1, 'Design Blouse', 'Design_Blousee.jpg\r\n', 'Cotton,Mix', 'Cotton, Wool', '2 - 3 Days', 'Rs.430.00', 'This stylish floral blouse is perfect for casual outings and warm summer days. It features a relaxed fit with a scoop neckline and flutter sleeves, offering a feminine touch that’s both comfortable and flattering. Made from 100% soft cotton, the blouse is lightweight, breathable, and gentle on the skin, making it ideal for all-day wear. Available in a beautiful pastel floral print or a minimalist classic white, it’s versatile enough to pair with jeans, skirts, or shorts.'),
(2, 'Embroidery Blouse', 'Embroideryy_Blouse.jpg', 'Polyester,Cotton ', 'Silk, Cotton, Polyester', '7 - 8 Days', 'Rs.550.00', 'An embroidery blouse is a blouse with embroidery, which is the stitching of designs onto fabric with a needle and thread. Embroidery, which can be done by hand or machine, can be used to create a variety of designs such as floral patterns, geometric shapes, and text. Get your embroidery blouse tailor-made to your size now.'),
(3, 'Neckline Blouse', 'Double_NecklineBlouse.jpg', 'Silk,Chiffon', 'Cotton, Silk, Chiffon', '6 - 8 Days', 'Rs.650.00', 'A Double Neckline Blouse features two distinct neckline styles in one design, such as a combination of a V-neck and a boat neck. This unique style adds visual interest and is perfect for both casual and formal occasions. Made from lightweight fabrics like cotton or chiffon, it can be paired with various bottoms for versatile and stylish looks.'),
(4, 'Princess Cut Blouse', 'princesscut.jpg', 'ArtSilk,Net \r\n', 'Cotton, ArtSilk, Net\r\n', '5 - 6 Days', 'Rs.500.00', 'A princess-cut blouse has a curved line of stitching that runs from the centre of the sleeve to the bottom. Since it has a curvature, the blouse fits much better than any other type of blouse. Get your princess-cut blouse tailor-made to your size now.'),
(5, 'Full Sleeve Blouse', 'FullSleeve_Blouse.jpg', 'Cotton,Velvet', 'Polyester, Silk, Cotton', '4 - 5 Days', 'Rs.450.00', 'A Full Sleeve Blouse features long sleeves that provide full coverage, making it ideal for cooler weather or more formal occasions. It can be made from a variety of fabrics such as cotton, silk, or satin, offering both comfort and style. This blouse style is versatile, easily paired with skirts, trousers, or jeans, and is perfect for both day and evening wear. The full sleeves add elegance and sophistication, making it a popular choice for professional and dressy settings.'),
(6, 'Sleeveless Blouse', 'Sleeveles_Blouse.jpg', 'Georgette,Polyester ', 'Polyester, Georgette, Silk', '2 - 3 Days', 'Rs.400.00', 'A sleeveless blouse is a type of blouse that does not have sleeves and typically covers the upper body and arms. It can be worn for various occasions, such as casual outings, or occasions. Get your blouse tailor-made to your size now.'),
(7, 'Collared Blouse', 'collared_blouse.png', 'Cotton,Polyester,Silk', 'Cotton,Silk,Lycra,Spandex', '7 - 8 Days', 'Rs.700.00', 'A classic and versatile addition to any wardrobe, the collared blouse features a clean, sophisticated design with a tailored fit. This blouse is perfect for both formal and casual occasions. It offers a sharp, professional look when paired with trousers or a skirt, and it’s equally stylish when worn casually with jeans or shorts. The collared neckline adds a touch of elegance, while the breathable fabric ensures comfort throughout the day.'),
(8, 'Jacket Style Blouse', 'Jacket Style Blouse.jpg', 'Cotton,Georgette,Chiffon,Silk', 'Velvet,Cotton,Silk', '7 - 10 Days', 'Rs.800.00', 'A trendy fusion of traditional and contemporary style, the Jacket Style Blouse adds a bold statement to any outfit. With a tailored design resembling a jacket, this blouse offers a sophisticated look perfect for formal events, weddings, and parties. The structured silhouette and unique style make it a standout piece, combining comfort and elegance. This blouse can be paired with sarees, lehengas, skirts, or trousers for a versatile and fashionable look.');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `bust` decimal(5,2) DEFAULT NULL,
  `waist` decimal(5,2) DEFAULT NULL,
  `shoulder` decimal(5,2) DEFAULT NULL,
  `sleeve_length` decimal(5,2) DEFAULT NULL,
  `blouse_length` decimal(5,2) DEFAULT NULL,
  `manual_measurements` tinyint(1) DEFAULT NULL,
  `payment_method` varchar(50) NOT NULL,
  `order_timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(255) DEFAULT NULL,
  `razorpay_payment_id` varchar(255) DEFAULT NULL,
  `price_range` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `category_id`, `full_name`, `contact_no`, `email`, `bust`, `waist`, `shoulder`, `sleeve_length`, `blouse_length`, `manual_measurements`, `payment_method`, `order_timestamp`, `payment_status`, `razorpay_payment_id`, `price_range`) VALUES
(1, 2, 'vedika', '9833364989', 'vedika12@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-01-27 11:03:44', NULL, NULL, 0.00),
(2, 1, 'Vedika Suryakant Pol', '9819982999', 'vedika12@gmail.com', 11.00, 12.00, 13.00, 14.00, 15.00, 0, '', '2025-01-27 11:07:09', NULL, NULL, 0.00),
(4, 3, 'vedika', '9833364989', 'vedika12@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-01-27 21:02:11', NULL, NULL, 0.00),
(5, 3, 'vedika', '9819982999', 'vedika12@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-01-28 13:56:04', NULL, NULL, 0.00),
(6, 3, 'vedika S Pol', '9819982099', 'vedika11@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-01-28 18:02:55', NULL, NULL, 0.00),
(8, 4, 'Vedika Suryakant Pol', '9819982999', 'vedika12@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-02-09 18:08:24', 'Completed', NULL, 0.00),
(9, 3, 'Surya', '9819982999', 'vedika12@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-02-10 14:26:05', 'Completed', NULL, 0.00),
(11, 3, 'vedika', '9819982999', 'vedika12@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-02-12 05:44:14', 'Completed', NULL, 0.00),
(12, 4, 'vedika', '9819982999', 'vedika12@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-02-12 06:13:12', 'Completed', NULL, 0.00),
(13, 7, 'vedika', '9819982999', 'vedika12@gmail.com', 11.00, 12.00, 13.00, 14.00, 15.00, 0, '', '2025-02-13 10:50:02', 'Completed', NULL, 0.00),
(14, 5, 'sakshi', '9819982999', 'polsahil00@gmail.com', 67.00, 33.00, 12.00, 45.00, 22.00, 0, '', '2025-02-13 16:53:54', 'Completed', NULL, 0.00),
(15, 7, 'vedika', '9819982999', 'vedika12@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-02-17 08:36:51', 'Completed', NULL, 0.00),
(16, 8, 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-02-17 17:42:01', 'Completed', NULL, 0.00),
(17, 1, 'vedika', '9819982999', 'vedika12@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-02-17 19:21:40', 'Completed', NULL, 0.00),
(18, 2, 'vedika', '9819982999', 'vedika11@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-02-17 19:22:34', 'Completed', NULL, 0.00),
(19, 5, 'vedika S Pol', '9876544329', 'vedika12@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-02-17 19:23:42', 'Completed', NULL, 0.00),
(20, 7, 'Vedika', '9833364989', 'vedika12@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-02-17 19:24:30', 'Completed', NULL, 0.00),
(21, 7, 'vedika', '9833364989', 'vedika11@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-02-17 19:25:36', 'Completed', NULL, 0.00),
(22, 8, 'Vedika Suryakant Pol', '9833364989', 'vedika11@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-02-17 19:26:20', 'Completed', NULL, 0.00),
(23, 3, 'Vedika Suryakant Pol', '9819982999', 'vedika11@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-02-18 21:39:53', 'Completed', NULL, 0.00),
(24, 3, 'Vedika Suryakant Pol', '9833364989', 'vedika11@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-02-21 18:33:23', 'Completed', NULL, 0.00),
(25, 1, 'vedika', '9833364989', 'vedika12@gmail.com', 11.00, 14.00, 12.00, 13.00, 15.00, 0, '', '2025-02-21 19:54:45', 'Completed', 'pay_PyU9gTBGVmtcjg', 0.00),
(26, 1, 'vedika', '9833364989', 'vedika12@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-02-22 04:56:27', NULL, NULL, 0.00),
(27, 1, 'John Doe', '9876543210', 'johndoe@example.com', 36.00, 28.00, 14.00, 22.00, 15.00, 1, '', '2025-02-22 04:56:33', NULL, NULL, 0.00),
(28, 1, 'vedika', '9833364989', 'vedika12@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-02-22 04:58:12', NULL, NULL, 0.00),
(29, 1, 'Vedika Suryakant Pol', '9833364989', 'vedika11@gmail.com', 1.00, 23.00, 4.00, 5.00, 6.00, 0, '', '2025-02-22 05:10:44', NULL, NULL, 0.00),
(30, 1, 'vedika S Pol', '9819982999', 'vedika12@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-02-22 05:13:03', NULL, NULL, 0.00),
(31, 8, 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', 1.00, 2.00, 3.00, 4.00, 5.00, 0, '', '2025-02-22 08:10:18', 'Paid', 'pay_PygYfjsthiKpLv', 0.00),
(32, 8, 'vedika', '9819982999', 'vedika12@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-02-22 08:33:25', NULL, NULL, 0.00),
(33, 1, 'vedika S Pol', '9819982999', 'vedika11@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-02-22 10:02:27', NULL, NULL, 0.00),
(34, 1, 'Vedika', '9833364989', 'vedika11@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-02-22 11:22:37', NULL, NULL, 0.00),
(35, 5, 'Vedika', '9819982999', 'vedika12@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-02-22 12:26:14', NULL, NULL, 0.00),
(36, 5, 'vedika', '9833364989', 'vedika12@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-02-22 14:32:48', NULL, NULL, 0.00),
(37, 5, 'Vedika', '9833364989', 'vedika12@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-02-22 18:40:13', NULL, NULL, 0.00),
(38, 5, 'vedika', '9819982999', 'vedika12@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-02-22 18:41:00', NULL, NULL, 0.00),
(39, 5, 'Vedika Suryakant Pol', '9833364989', 'vedika11@gmail.com', 11.00, 11.00, 13.00, 14.00, 15.00, 0, '', '2025-02-22 18:44:52', NULL, NULL, 0.00),
(40, 5, 'vedika', '9819982999', 'vedika11@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-02-22 20:28:19', 'Paid', 'pay_Pz32qscHtbJcR5', 450.00),
(41, 8, 'Vedika Suryakant Pol', '9876544329', 'vedika11@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-02-23 06:45:44', NULL, NULL, 0.00),
(42, 8, 'Vedika', '9819982999', 'vedika12@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '', '2025-02-23 06:59:52', NULL, NULL, 0.00),
(43, 1, 'Vedika', '9833364989', 'vedika12@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-02-23 07:25:28', NULL, NULL, 0.00),
(44, 1, 'vedika', '9833364989', 'vedika12@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-02-23 07:27:21', NULL, NULL, 0.00),
(45, 1, 'vedika', '9819982999', 'vedika12@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-02-23 07:30:23', NULL, NULL, 0.00),
(46, 1, 'vedika', '9819982999', 'vedika12@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-02-23 07:31:17', NULL, NULL, 0.00),
(47, 3, 'Saii', '9833364989', 'polsahil00@gmail.com', 11.00, 12.00, 13.00, 14.00, 15.00, 0, '', '2025-02-23 08:18:41', 'Paid', 'pay_Pz5FMk5ltOzolC', 0.00),
(48, 8, 'sai', '9819982999', 'polsahil00@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-02-23 12:41:47', NULL, NULL, 0.00),
(49, 8, 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-02-24 19:23:05', NULL, NULL, 0.00),
(51, 3, 'vedika', '9833364989', '', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-02-25 09:38:07', 'Successful', NULL, 0.00),
(52, 3, 'Vedika', '9819982999', 'vedika11@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-02-25 10:35:54', 'Successful', NULL, 0.00),
(54, 6, 'vedika', '9819982999', 'vedika12@gmail.com', 1.00, 2.00, 3.00, 15.00, 12.00, 0, '', '2025-02-25 13:02:49', 'Success', 'pay_Pzx9fE5k8aFWy5', 0.00),
(55, 5, 'Vedika Suryakant Pol', '9819982999', 'vedika12@gmail.com', 10.00, 1.00, 12.00, 11.00, 12.00, 1, '', '2025-02-25 18:47:48', 'Success', 'pay_Q032NSI91Pmfxy', 0.00),
(56, 6, 'vedika', '9819982999', 'vedika11@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-02-26 00:19:49', 'Success', 'pay_Q08fyrfPKLJkXE', 0.00),
(58, 3, 'vedika', '9819982999', 'vedika12@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-03-02 20:23:14', 'Success', 'pay_Q23JesbkgL423y', 0.00),
(60, 1, 'vedika', '9876543209', 'vedika12@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-03-08 21:57:22', 'Success', 'pay_Q4S7gHMqNaNsVX', 0.00),
(61, 3, 'vedika', '9819982999', 'vedika12@gmail.com', 11.00, 12.00, 13.00, 14.00, 15.00, 0, '', '2025-03-12 12:16:45', NULL, NULL, 0.00),
(62, 3, 'vedika', '9833364089', 'vedika12@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-03-12 12:17:54', NULL, NULL, 0.00),
(63, 2, 'Vedika Suryakant Pol', '9833364089', 'vedika11@gmail.com', 1.00, 3.00, 2.00, 2.00, 5.00, 0, '', '2025-03-12 12:19:11', 'Pending', NULL, 0.00),
(64, 4, 'Vedika', '9819982999', 'vedika12@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-03-12 12:28:56', NULL, NULL, 0.00),
(65, 2, 'vedika', '9819982999', 'vedika12@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-03-12 16:13:14', 'Success', 'pay_Q5xMAgE2Qkp95j', 0.00),
(66, 3, 'Anil', '9876544329', 'anil123@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-03-13 08:07:08', 'Success', 'pay_Q6D1TUXrjJWlAr', 0.00),
(67, 3, 'Anil', '9833364989', 'anil123@gmail.com', 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '2025-03-13 09:32:08', 'Success', 'pay_Q6EQg1fEQwq5d6', 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `price_range` varchar(255) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `category_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `payment_method`, `payment_status`, `price_range`, `customer_name`, `contact_number`, `email`, `payment_date`, `category_name`) VALUES
(1, 1, 'Debit Card', 'Completed', 'Rs.550.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-17 20:49:18', NULL),
(2, 1, 'Debit Card', 'Completed', 'Rs.550.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-17 20:53:15', NULL),
(3, 1, 'Debit Card', 'Completed', 'Rs.550.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-17 20:53:20', NULL),
(4, 1, 'Debit Card', 'Completed', 'Rs.550.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-17 21:00:01', NULL),
(5, 1, 'Debit Card', 'Completed', 'Rs.550.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-17 21:09:18', NULL),
(6, 1, 'Debit Card', 'Completed', 'Rs.550.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-17 21:26:09', NULL),
(7, 1, 'Debit Card', 'Completed', 'Rs.550.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-17 21:27:34', NULL),
(8, 1, 'Debit Card', 'Completed', 'Rs.550.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-17 21:31:03', NULL),
(9, 1, 'Debit Card', 'Completed', 'Rs.550.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-17 21:32:13', NULL),
(10, 1, 'Debit Card', 'Completed', 'Rs.550.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-17 21:35:37', NULL),
(11, 1, 'Debit Card', 'Completed', 'Rs.550.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-18 04:01:27', NULL),
(12, 1, 'Debit Card', 'Completed', 'Rs.550.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-18 04:01:32', NULL),
(13, 1, 'Debit Card', 'Completed', 'Rs.550.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-18 04:08:48', NULL),
(14, 1, 'Debit Card', 'Completed', 'Rs.550.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-18 04:08:56', NULL),
(15, 1, 'Debit Card', 'Completed', 'Rs.550.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-18 04:12:24', NULL),
(16, 1, 'Debit Card', 'Completed', 'Rs.550.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-18 04:14:11', NULL),
(17, 1, 'Debit Card', 'Completed', 'Rs.550.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-18 04:14:44', NULL),
(18, 1, 'Debit Card', 'Completed', 'Rs.550.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-18 04:16:18', NULL),
(19, 2, 'UPI', 'Completed', 'Rs.430.00', 'vedika', '9819982089', 'vedika12@gmail.com', '2025-01-18 06:21:46', NULL),
(20, 2, 'UPI', 'Completed', 'Rs.430.00', 'vedika', '9819982089', 'vedika12@gmail.com', '2025-01-18 06:26:00', NULL),
(21, 2, 'UPI', 'Completed', 'Rs.430.00', 'vedika', '9819982089', 'vedika12@gmail.com', '2025-01-18 06:31:55', NULL),
(22, 2, 'UPI', 'Completed', 'Rs.430.00', 'vedika', '9819982089', 'vedika12@gmail.com', '2025-01-18 07:05:55', NULL),
(23, 2, 'UPI', 'Completed', 'Rs.430.00', 'vedika', '9819982089', 'vedika12@gmail.com', '2025-01-18 07:06:32', NULL),
(24, 2, 'UPI', 'Completed', 'Rs.430.00', 'vedika', '9819982089', 'vedika12@gmail.com', '2025-01-18 07:06:35', NULL),
(25, 2, 'UPI', 'Completed', 'Rs.430.00', 'vedika', '9819982089', 'vedika12@gmail.com', '2025-01-18 07:07:52', NULL),
(26, 2, 'UPI', 'Completed', 'Rs.430.00', 'vedika', '9819982089', 'vedika12@gmail.com', '2025-01-18 07:07:55', NULL),
(27, 2, 'UPI', 'Completed', 'Rs.430.00', 'vedika', '9819982089', 'vedika12@gmail.com', '2025-01-18 07:14:52', NULL),
(28, 2, 'UPI', 'Completed', 'Rs.430.00', 'vedika', '9819982089', 'vedika12@gmail.com', '2025-01-18 07:15:05', NULL),
(29, 2, 'UPI', 'Completed', 'Rs.430.00', 'vedika', '9819982089', 'vedika12@gmail.com', '2025-01-18 07:24:08', NULL),
(30, 2, 'UPI', 'Completed', 'Rs.430.00', 'vedika', '9819982089', 'vedika12@gmail.com', '2025-01-18 07:24:13', NULL),
(31, 2, 'UPI', 'Completed', 'Rs.430.00', 'vedika', '9819982089', 'vedika12@gmail.com', '2025-01-18 07:24:28', NULL),
(32, 2, 'UPI', 'Completed', 'Rs.430.00', 'vedika', '9819982089', 'vedika12@gmail.com', '2025-01-18 07:26:00', NULL),
(33, 2, 'UPI', 'Completed', 'Rs.430.00', 'vedika', '9819982089', 'vedika12@gmail.com', '2025-01-18 07:26:04', NULL),
(34, 2, 'UPI', 'Completed', 'Rs.430.00', 'vedika', '9819982089', 'vedika12@gmail.com', '2025-01-18 07:49:32', NULL),
(35, 2, 'UPI', 'Completed', 'Rs.430.00', 'vedika', '9819982089', 'vedika12@gmail.com', '2025-01-18 07:49:35', NULL),
(36, 2, 'UPI', 'Completed', 'Rs.430.00', 'vedika', '9819982089', 'vedika12@gmail.com', '2025-01-18 07:49:38', NULL),
(37, 2, 'UPI', 'Completed', 'Rs.430.00', 'vedika', '9819982089', 'vedika12@gmail.com', '2025-01-18 07:57:28', NULL),
(38, 2, 'UPI', 'Completed', 'Rs.430.00', 'vedika', '9819982089', 'vedika12@gmail.com', '2025-01-18 07:57:32', NULL),
(39, 2, 'UPI', 'Completed', 'Rs.430.00', 'vedika', '9819982089', 'vedika12@gmail.com', '2025-01-18 08:07:05', NULL),
(40, 2, 'UPI', 'Completed', 'Rs.430.00', 'vedika', '9819982089', 'vedika12@gmail.com', '2025-01-18 08:07:09', NULL),
(41, 2, 'UPI', 'Completed', 'Rs.430.00', 'vedika', '9819982089', 'vedika12@gmail.com', '2025-01-18 08:10:00', NULL),
(42, 2, 'UPI', 'Completed', 'Rs.430.00', 'vedika', '9819982089', 'vedika12@gmail.com', '2025-01-18 08:10:04', NULL),
(43, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 08:12:14', NULL),
(44, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 08:13:13', NULL),
(45, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 08:14:57', NULL),
(46, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 08:15:06', NULL),
(47, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 08:16:39', NULL),
(48, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 08:16:46', NULL),
(49, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 08:22:08', NULL),
(50, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 08:22:11', NULL),
(51, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 08:26:58', NULL),
(52, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 08:27:02', NULL),
(53, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 08:27:05', NULL),
(54, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 08:29:45', NULL),
(55, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 08:29:49', NULL),
(56, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 08:35:18', NULL),
(57, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 08:35:37', NULL),
(58, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 08:36:01', NULL),
(59, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 08:40:41', NULL),
(60, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 08:46:06', NULL),
(61, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 08:46:08', NULL),
(62, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 08:48:33', NULL),
(63, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 08:48:35', NULL),
(64, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 08:50:15', NULL),
(65, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 08:50:16', NULL),
(66, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 08:54:31', NULL),
(67, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 08:54:32', NULL),
(68, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 08:57:27', NULL),
(69, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 08:58:49', NULL),
(70, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 09:01:16', NULL),
(71, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 09:01:18', NULL),
(72, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 09:04:16', NULL),
(73, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 09:04:21', NULL),
(74, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 09:06:27', NULL),
(75, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 09:06:29', NULL),
(76, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 09:07:38', NULL),
(77, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 09:08:22', NULL),
(78, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 09:08:49', NULL),
(79, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 09:12:36', NULL),
(80, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 09:13:20', NULL),
(81, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 09:14:09', NULL),
(82, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 09:15:23', NULL),
(83, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 09:16:06', NULL),
(84, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 09:16:08', NULL),
(85, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 09:49:37', NULL),
(86, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-18 09:49:38', NULL),
(87, 4, 'Credit Card', 'Completed', 'Rs.650.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-19 14:58:19', NULL),
(88, 5, 'UPI', 'Completed', 'Rs.650.00', 'Vedika', '9819982999', 'vedika12@gmail.com', '2025-01-20 20:12:38', NULL),
(89, 5, 'UPI', 'Completed', 'Rs.650.00', 'Vedika', '9819982999', 'vedika12@gmail.com', '2025-01-20 20:13:54', NULL),
(90, 5, 'UPI', 'Completed', 'Rs.650.00', 'Vedika', '9819982999', 'vedika12@gmail.com', '2025-01-20 20:14:01', NULL),
(91, 5, 'UPI', 'Completed', 'Rs.650.00', 'Vedika', '9819982999', 'vedika12@gmail.com', '2025-01-20 20:14:42', NULL),
(92, 5, 'UPI', 'Completed', 'Rs.650.00', 'Vedika', '9819982999', 'vedika12@gmail.com', '2025-01-20 20:14:47', NULL),
(93, 6, 'Credit Card', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', '2025-01-20 20:20:27', NULL),
(94, 8, 'Debit Card', 'Completed', 'Rs.450.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-24 20:54:03', NULL),
(95, 8, 'Debit Card', 'Completed', 'Rs.450.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-24 20:57:57', NULL),
(96, 8, 'Debit Card', 'Completed', 'Rs.450.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-24 20:58:57', NULL),
(97, 8, 'Debit Card', 'Completed', 'Rs.450.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-24 20:59:17', NULL),
(98, 8, 'Debit Card', 'Completed', 'Rs.450.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-24 21:02:26', NULL),
(99, 8, 'Debit Card', 'Completed', 'Rs.450.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-24 21:03:46', NULL),
(100, 8, 'Debit Card', 'Completed', 'Rs.450.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-24 21:05:57', NULL),
(101, 8, 'Debit Card', 'Completed', 'Rs.450.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-24 21:06:07', NULL),
(102, 8, 'Debit Card', 'Completed', 'Rs.450.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-24 21:32:48', NULL),
(103, 9, 'UPI', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', '2025-01-25 07:06:21', NULL),
(104, 9, 'UPI', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', '2025-01-25 07:09:44', NULL),
(105, 9, 'UPI', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', '2025-01-25 07:11:39', NULL),
(106, 9, 'UPI', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', '2025-01-25 07:15:57', NULL),
(107, 9, 'UPI', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', '2025-01-25 07:16:34', NULL),
(108, 9, 'UPI', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', '2025-01-25 07:18:39', NULL),
(109, 9, 'UPI', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', '2025-01-25 07:21:06', NULL),
(110, 9, 'UPI', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', '2025-01-25 07:22:22', NULL),
(111, 9, 'UPI', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', '2025-01-25 07:23:47', NULL),
(112, 9, 'UPI', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', '2025-01-25 07:39:34', NULL),
(113, 9, 'UPI', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', '2025-01-25 07:40:20', NULL),
(114, 9, 'UPI', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', '2025-01-25 07:44:26', NULL),
(115, 9, 'UPI', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', '2025-01-25 07:56:08', NULL),
(116, 9, 'UPI', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', '2025-01-25 08:01:20', NULL),
(117, 9, 'UPI', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', '2025-01-25 08:01:38', NULL),
(118, 9, 'UPI', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', '2025-01-25 08:02:14', NULL),
(119, 9, 'UPI', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', '2025-01-25 08:09:39', NULL),
(120, 9, 'UPI', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', '2025-01-25 08:11:48', NULL),
(121, 9, 'UPI', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', '2025-01-25 08:47:21', NULL),
(122, 9, 'UPI', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', '2025-01-25 08:47:28', NULL),
(123, 9, 'UPI', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', '2025-01-25 08:47:57', NULL),
(124, 9, 'UPI', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', '2025-01-25 08:48:29', NULL),
(125, 9, 'UPI', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', '2025-01-25 08:49:00', NULL),
(126, 9, 'UPI', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', '2025-01-25 08:49:13', NULL),
(127, 9, 'UPI', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', '2025-01-25 08:49:47', NULL),
(128, 9, 'UPI', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', '2025-01-25 08:49:49', NULL),
(129, 9, 'UPI', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', '2025-01-25 08:50:13', NULL),
(130, 9, 'UPI', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', '2025-01-25 08:50:48', NULL),
(131, 9, 'UPI', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', '2025-01-25 08:51:18', NULL),
(132, 9, 'UPI', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', '2025-01-25 08:51:46', NULL),
(133, 9, 'UPI', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', '2025-01-25 08:57:17', NULL),
(134, 9, 'UPI', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', '2025-01-25 08:57:40', NULL),
(135, 9, 'UPI', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', '2025-01-25 08:58:46', NULL),
(136, 9, 'UPI', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', '2025-01-25 08:58:54', NULL),
(137, 9, 'UPI', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9818892809', 'vedika12@gmail.com', '2025-01-25 08:59:23', NULL),
(138, 10, 'Credit Card', 'Pending', 'Rs.500.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-25 19:39:44', NULL),
(139, 10, 'Credit Card', 'Pending', 'Rs.500.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-25 19:50:46', NULL),
(140, 10, 'Credit Card', 'Pending', 'Rs.500.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-25 19:50:57', NULL),
(141, 10, 'Credit Card', 'Pending', 'Rs.500.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-25 19:51:21', NULL),
(142, 10, 'Credit Card', 'Pending', 'Rs.500.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-25 19:51:34', NULL),
(143, 10, 'Credit Card', 'Pending', 'Rs.500.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-25 19:52:11', NULL),
(144, 10, 'Credit Card', 'Pending', 'Rs.500.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-25 19:52:55', NULL),
(145, 10, 'Credit Card', 'Pending', 'Rs.500.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-25 19:55:02', NULL),
(146, 10, 'Credit Card', 'Pending', 'Rs.500.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-25 19:55:16', NULL),
(147, 10, 'Credit Card', 'Pending', 'Rs.500.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-25 19:55:30', NULL),
(148, 10, 'Credit Card', 'Pending', 'Rs.500.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-25 19:55:44', NULL),
(149, 10, 'Credit Card', 'Pending', 'Rs.500.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-25 19:56:07', NULL),
(150, 10, 'Credit Card', 'Pending', 'Rs.500.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-25 19:59:05', NULL),
(151, 10, 'Credit Card', 'Pending', 'Rs.500.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-25 20:05:58', NULL),
(152, 10, 'Credit Card', 'Pending', 'Rs.500.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-25 20:06:28', NULL),
(153, 10, 'Credit Card', 'Pending', 'Rs.500.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-25 20:54:47', NULL),
(154, 10, 'Credit Card', 'Pending', 'Rs.500.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-25 20:56:10', NULL),
(155, 10, 'Credit Card', 'Pending', 'Rs.500.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-25 20:57:43', NULL),
(156, 10, 'Credit Card', 'Pending', 'Rs.500.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-25 20:59:42', NULL),
(157, 10, 'Credit Card', 'Pending', 'Rs.500.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-25 21:00:42', NULL),
(158, 10, 'Credit Card', 'Pending', 'Rs.500.00', 'Vedika Suryakant Pol', '9833364989', 'vedika12@gmail.com', '2025-01-25 21:01:21', NULL),
(159, 12, 'Debit Card', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9876544329', 'vedika12@gmail.com', '2025-01-26 22:06:08', NULL),
(160, 12, 'Debit Card', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9876544329', 'vedika12@gmail.com', '2025-01-26 22:07:15', NULL),
(161, 12, 'Debit Card', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9876544329', 'vedika12@gmail.com', '2025-01-26 22:09:22', NULL),
(162, 12, 'Debit Card', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9876544329', 'vedika12@gmail.com', '2025-01-26 22:10:06', NULL),
(163, 12, 'Debit Card', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9876544329', 'vedika12@gmail.com', '2025-01-26 22:10:15', NULL),
(164, 12, 'Debit Card', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9876544329', 'vedika12@gmail.com', '2025-01-26 22:10:33', NULL),
(165, 12, 'Debit Card', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9876544329', 'vedika12@gmail.com', '2025-01-26 22:11:41', NULL),
(166, 12, 'Debit Card', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9876544329', 'vedika12@gmail.com', '2025-01-26 22:12:51', NULL),
(167, 12, 'Debit Card', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9876544329', 'vedika12@gmail.com', '2025-01-26 22:13:20', NULL),
(168, 12, 'Debit Card', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9876544329', 'vedika12@gmail.com', '2025-01-26 22:15:51', NULL),
(169, 12, 'Debit Card', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9876544329', 'vedika12@gmail.com', '2025-01-26 22:17:03', NULL),
(170, 12, 'Debit Card', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9876544329', 'vedika12@gmail.com', '2025-01-26 22:17:56', NULL),
(171, 12, 'Debit Card', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9876544329', 'vedika12@gmail.com', '2025-01-26 22:18:22', NULL),
(172, 12, 'Debit Card', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9876544329', 'vedika12@gmail.com', '2025-01-26 22:19:43', NULL),
(173, 12, 'Debit Card', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9876544329', 'vedika12@gmail.com', '2025-01-26 22:20:03', NULL),
(174, 12, 'Debit Card', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9876544329', 'vedika12@gmail.com', '2025-01-26 22:21:01', NULL),
(175, 12, 'Debit Card', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9876544329', 'vedika12@gmail.com', '2025-01-26 22:21:24', NULL),
(176, 12, 'Debit Card', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9876544329', 'vedika12@gmail.com', '2025-01-26 22:22:01', NULL),
(177, 12, 'Debit Card', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9876544329', 'vedika12@gmail.com', '2025-01-26 22:22:35', NULL),
(178, 12, 'Debit Card', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9876544329', 'vedika12@gmail.com', '2025-01-26 22:23:26', NULL),
(179, 12, 'Debit Card', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9876544329', 'vedika12@gmail.com', '2025-01-26 22:23:30', NULL),
(180, 12, 'Debit Card', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9876544329', 'vedika12@gmail.com', '2025-01-26 22:24:49', NULL),
(181, 12, 'Debit Card', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9876544329', 'vedika12@gmail.com', '2025-01-26 22:27:14', NULL),
(182, 13, 'Debit Card', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9819982089', 'vedika12@gmail.com', '2025-01-27 09:03:41', NULL),
(183, 13, 'Debit Card', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9819982089', 'vedika12@gmail.com', '2025-01-27 09:11:22', NULL),
(184, 13, 'Debit Card', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9819982089', 'vedika12@gmail.com', '2025-01-27 09:11:26', NULL),
(185, 13, 'Credit Card', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9819982089', 'vedika12@gmail.com', '2025-01-27 09:11:40', NULL),
(186, 14, 'UPI', 'Completed', 'Rs.400.00', 'vedika', '9833364989', 'vedika12@gmail.com', '2025-01-27 09:13:09', NULL),
(187, 14, 'UPI', 'Completed', 'Rs.400.00', 'vedika', '9833364989', 'vedika12@gmail.com', '2025-01-27 09:13:19', NULL),
(188, 14, 'UPI', 'Completed', 'Rs.400.00', 'vedika', '9833364989', 'vedika12@gmail.com', '2025-01-27 09:17:56', NULL),
(189, 15, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-27 09:18:39', NULL),
(190, 15, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-27 09:21:00', NULL),
(191, 16, 'Credit Card', 'Completed', 'Rs.800.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-27 10:16:40', NULL),
(192, 16, 'Credit Card', 'Completed', 'Rs.800.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-27 10:16:44', NULL),
(193, 1, 'Debit Card', 'Completed', 'Rs.550.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-27 11:03:54', NULL),
(194, 2, 'UPI', 'Completed', 'Rs.430.00', 'Vedika Suryakant Pol', '9819982999', 'vedika12@gmail.com', '2025-01-27 11:07:15', NULL),
(195, 2, 'UPI', 'Completed', 'Rs.430.00', 'Vedika Suryakant Pol', '9819982999', 'vedika12@gmail.com', '2025-01-27 11:07:18', NULL),
(196, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9833364089', 'vedika12@gmail.com', '2025-01-27 11:27:59', NULL),
(197, 3, 'Debit Card', 'Completed', 'Rs.400.00', 'vedika', '9833364089', 'vedika12@gmail.com', '2025-01-27 11:28:02', NULL),
(198, 4, 'Credit Card', 'Completed', 'Rs.650.00', 'vedika', '9833364989', 'vedika12@gmail.com', '2025-01-27 21:06:43', NULL),
(199, 4, 'Credit Card', 'Completed', 'Rs.650.00', 'vedika', '9833364989', 'vedika12@gmail.com', '2025-01-27 21:07:57', NULL),
(200, 4, 'Credit Card', 'Completed', 'Rs.650.00', 'vedika', '9833364989', 'vedika12@gmail.com', '2025-01-27 21:08:15', NULL),
(201, 4, 'Credit Card', 'Completed', 'Rs.650.00', 'vedika', '9833364989', 'vedika12@gmail.com', '2025-01-27 21:09:40', NULL),
(202, 4, 'Credit Card', 'Completed', 'Rs.650.00', 'vedika', '9833364989', 'vedika12@gmail.com', '2025-01-27 21:09:44', NULL),
(203, 5, 'UPI', 'Completed', 'Rs.650.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-28 13:56:54', NULL),
(204, 6, 'Credit Card', 'Completed', 'Rs.650.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-28 18:03:05', NULL),
(205, 6, 'Credit Card', 'Completed', 'Rs.650.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-28 18:03:56', NULL),
(206, 6, 'Credit Card', 'Completed', 'Rs.650.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-28 18:08:59', NULL),
(207, 6, 'Credit Card', 'Completed', 'Rs.650.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-28 18:13:50', NULL),
(208, 6, 'Credit Card', 'Completed', 'Rs.650.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-28 18:25:13', NULL),
(209, 6, 'Credit Card', 'Completed', 'Rs.650.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-01-28 18:25:59', NULL),
(210, 7, 'Debit Card', 'Completed', 'Rs.550.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-02-09 08:45:28', NULL),
(211, 7, 'Debit Card', 'Completed', 'Rs.550.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-02-09 08:50:53', NULL),
(212, 8, 'UPI', 'Completed', 'Rs.500.00', 'Vedika Suryakant Pol', '9819982999', 'vedika12@gmail.com', '2025-02-09 18:08:37', NULL),
(213, 9, 'UPI', 'Completed', 'Rs.650.00', 'Surya', '9819982999', 'surya12@gmail.com', '2025-02-10 14:27:13', NULL),
(214, 10, 'Credit Card', 'Pending', 'Rs.500.00', 'riya', '1234567890', 'riya123@email.com', '2025-02-12 05:30:30', NULL),
(215, 11, 'Debit Card', 'Completed', 'Rs.650.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-02-12 05:44:21', NULL),
(216, 12, 'Debit Card', 'Completed', 'Rs.500.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-02-12 06:13:31', NULL),
(217, 13, 'Debit Card', 'Completed', 'Rs.700.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-02-13 10:50:09', NULL),
(218, 14, 'UPI', 'Completed', 'Rs.450.00', 'sakshi', '9819982999', 'polsahil00@gmail.com', '2025-02-13 16:54:18', NULL),
(219, 15, 'UPI', 'Completed', 'Rs.700.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-02-17 08:36:57', NULL),
(220, 16, 'Credit Card', 'Completed', 'Rs.800.00', 'Vedika Suryakant Pol', '9818892809', 'vedika11@gmail.com', '2025-02-17 17:42:08', NULL),
(221, 16, 'Credit Card', 'Completed', 'Rs.800.00', 'Vedika Suryakant Pol', '9818892809', 'vedika11@gmail.com', '2025-02-17 17:48:48', NULL),
(222, 16, 'Credit Card', 'Completed', 'Rs.800.00', 'Vedika Suryakant Pol', '9818892809', 'vedika11@gmail.com', '2025-02-17 17:49:04', NULL),
(223, 16, 'Credit Card', 'Completed', 'Rs.800.00', 'Vedika Suryakant Pol', '9818892809', 'vedika11@gmail.com', '2025-02-17 17:49:45', NULL),
(224, 16, 'Credit Card', 'Completed', 'Rs.800.00', 'Vedika Suryakant Pol', '9818892809', 'vedika11@gmail.com', '2025-02-17 17:54:20', NULL),
(225, 16, 'Credit Card', 'Completed', 'Rs.800.00', 'Vedika Suryakant Pol', '9818892809', 'vedika11@gmail.com', '2025-02-17 17:54:25', NULL),
(226, 16, 'Credit Card', 'Completed', 'Rs.800.00', 'Vedika Suryakant Pol', '9818892809', 'vedika11@gmail.com', '2025-02-17 17:54:27', NULL),
(227, 16, 'Credit Card', 'Completed', 'Rs.800.00', 'Vedika Suryakant Pol', '9818892809', 'vedika11@gmail.com', '2025-02-17 17:54:35', NULL),
(228, 16, 'Credit Card', 'Completed', 'Rs.800.00', 'Vedika Suryakant Pol', '9818892809', 'vedika11@gmail.com', '2025-02-17 17:54:38', NULL),
(229, 16, 'Credit Card', 'Completed', 'Rs.800.00', 'Vedika Suryakant Pol', '9818892809', 'vedika11@gmail.com', '2025-02-17 18:16:59', NULL),
(230, 16, 'Credit Card', 'Completed', 'Rs.800.00', 'Vedika Suryakant Pol', '9818892809', 'vedika11@gmail.com', '2025-02-17 18:17:39', NULL),
(231, 16, 'Credit Card', 'Completed', 'Rs.800.00', 'Vedika Suryakant Pol', '9818892809', 'vedika11@gmail.com', '2025-02-17 18:18:14', NULL),
(232, 16, 'Credit Card', 'Completed', 'Rs.800.00', 'Vedika Suryakant Pol', '9818892809', 'vedika11@gmail.com', '2025-02-17 18:18:20', NULL),
(233, 16, 'Credit Card', 'Completed', 'Rs.800.00', 'Vedika Suryakant Pol', '9818892809', 'vedika11@gmail.com', '2025-02-17 18:18:28', NULL),
(234, 16, 'Credit Card', 'Completed', 'Rs.800.00', 'Vedika Suryakant Pol', '9818892809', 'vedika11@gmail.com', '2025-02-17 18:21:28', NULL),
(235, 16, 'Credit Card', 'Completed', 'Rs.800.00', 'Vedika Suryakant Pol', '9818892809', 'vedika11@gmail.com', '2025-02-17 18:30:47', NULL),
(236, 16, 'Credit Card', 'Completed', 'Rs.800.00', 'Vedika Suryakant Pol', '9818892809', 'vedika11@gmail.com', '2025-02-17 18:44:26', NULL),
(237, 16, 'Credit Card', 'Completed', 'Rs.800.00', 'Vedika Suryakant Pol', '9818892809', 'vedika11@gmail.com', '2025-02-17 18:46:52', NULL),
(238, 16, 'Credit Card', 'Completed', 'Rs.800.00', 'Vedika Suryakant Pol', '9818892809', 'vedika11@gmail.com', '2025-02-17 18:49:59', NULL),
(239, 16, 'Credit Card', 'Completed', 'Rs.800.00', 'Vedika Suryakant Pol', '9818892809', 'vedika11@gmail.com', '2025-02-17 18:50:00', NULL),
(240, 16, 'Credit Card', 'Completed', 'Rs.800.00', 'Vedika Suryakant Pol', '9818892809', 'vedika11@gmail.com', '2025-02-17 18:52:35', NULL),
(241, 16, 'Credit Card', 'Completed', 'Rs.800.00', 'Vedika Suryakant Pol', '9818892809', 'vedika11@gmail.com', '2025-02-17 19:03:03', NULL),
(242, 16, 'Credit Card', 'Completed', 'Rs.800.00', 'Vedika Suryakant Pol', '9818892809', 'vedika11@gmail.com', '2025-02-17 19:03:05', NULL),
(243, 16, 'Credit Card', 'Completed', 'Rs.800.00', 'Vedika Suryakant Pol', '9818892809', 'vedika11@gmail.com', '2025-02-17 19:14:13', 'Jacket Style Blouse'),
(244, 16, 'Credit Card', 'Completed', 'Rs.800.00', 'Vedika Suryakant Pol', '9818892809', 'vedika11@gmail.com', '2025-02-17 19:14:16', 'Jacket Style Blouse'),
(245, 17, 'Debit Card', 'Completed', 'Rs.430.00', 'vedika', '9819982999', 'vedika12@gmail.com', '2025-02-17 19:21:47', 'Design Blouse'),
(246, 18, 'UPI', 'Completed', 'Rs.550.00', 'vedika', '9819982999', 'vedika11@gmail.com', '2025-02-17 19:22:39', 'Embroidery Blouse'),
(247, 19, 'Credit Card', 'Completed', 'Rs.450.00', 'vedika S Pol', '9876544329', 'vedika12@gmail.com', '2025-02-17 19:23:49', 'Full Sleeve Blouse'),
(248, 20, 'UPI', 'Completed', 'Rs.700.00', 'Vedika', '9833364989', 'vedika12@gmail.com', '2025-02-17 19:24:35', 'Collared Blouse'),
(249, 20, 'Debit Card', 'Completed', 'Rs.700.00', 'Vedika', '9833364989', 'vedika12@gmail.com', '2025-02-17 19:24:57', 'Collared Blouse'),
(250, 21, 'Debit Card', 'Completed', 'Rs.700.00', 'vedika', '9833364989', 'vedika11@gmail.com', '2025-02-17 19:25:43', 'Collared Blouse'),
(251, 22, 'UPI', 'Completed', 'Rs.800.00', 'Vedika Suryakant Pol', '9833364989', 'vedika11@gmail.com', '2025-02-17 19:26:26', 'Jacket Style Blouse'),
(252, 23, 'Credit Card', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9819982999', 'vedika11@gmail.com', '2025-02-18 22:13:01', 'Neckline Blouse'),
(253, 23, 'Credit Card', 'Completed', 'Rs.650.00', 'Vedika Suryakant Pol', '9819982999', 'vedika11@gmail.com', '2025-02-18 22:13:16', 'Neckline Blouse');

-- --------------------------------------------------------

--
-- Table structure for table `prices`
--

CREATE TABLE `prices` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `price_range` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prices`
--

INSERT INTO `prices` (`category_id`, `category_name`, `price_range`) VALUES
(1, 'Design Blouse', 430.00),
(2, 'Embroidery Blouse', 550.00),
(3, 'Neckline Blouse', 650.00),
(4, 'Princess Cut Blouse', 500.00),
(5, 'Full Sleeve Blouse', 450.00),
(6, 'Sleeveless Blouse', 400.00),
(7, 'Collared Blouse', 700.00),
(8, 'Jacket Style Blouse', 800.00);

-- --------------------------------------------------------

--
-- Table structure for table `related_images`
--

CREATE TABLE `related_images` (
  `id` int(100) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `image_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `related_images`
--

INSERT INTO `related_images` (`id`, `category_id`, `image_path`) VALUES
(1, 1, 'Design_Blousee.jpg'),
(2, 1, 'Design_Blouseess.jpg'),
(3, 1, 'Design_Blouses.jpg'),
(4, 1, 'Design_Blousees.jpg'),
(5, 2, 'Embroideryy_Blouse.jpg'),
(6, 2, 'Embroidery_Blouse2.jpg'),
(7, 2, 'Embroidery_Blouse1.jpg'),
(8, 2, 'Embroidery_Blouse3.jpg'),
(9, 3, 'Double_NecklineBlouse.jpg'),
(10, 3, 'Double_NecklineBlouse2.jpg'),
(11, 3, 'Double_NecklineBlouse4.jpg'),
(12, 3, 'Double_NecklineBlouse1.jpg'),
(13, 4, 'princesscut.jpg'),
(14, 4, 'princesscut1.jpg'),
(15, 4, 'princesscut3.jpg'),
(16, 4, 'princesscut2.jpg'),
(17, 5, 'FullSleeve_Blouse.jpg'),
(18, 5, 'FullSleeve_Blouse1.jpg'),
(19, 5, 'FullSleeve_Blouse2.jpg'),
(20, 5, 'FullSleeve_Blouse3.jpg'),
(21, 6, 'Sleeveles_Blouse.jpg'),
(22, 6, 'Sleeveles_Blouse1.jpg'),
(23, 6, 'Sleeveles_Blouse2.jpg'),
(24, 6, 'Sleeveles_Blouse3.jpg'),
(25, 7, 'collared_blouse.png'),
(26, 7, 'collared_blouse1.jpg'),
(27, 7, 'collared_blouse2.jpg'),
(28, 7, 'collared_blouse3.jpg'),
(29, 8, 'Jacket Style Blouse.jpg'),
(30, 8, 'Jacket Style Blouse1.jpg'),
(31, 8, 'Jacket Style Blouse2.jpg'),
(32, 8, 'Jacket Style Blouse3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `Username`, `Email`, `Password`, `created_at`, `updated_at`) VALUES
(5, 'vedika', 'vedika12@gmail.com', '$2y$10$LORhZ7nIslUK7qoYdTHHyOjVwmQnQ6Qx1XToHcO/FeYvBbNtEgMMu', '2025-01-13 08:22:20', '2025-01-13 08:22:20'),
(6, 'surya', 'surya12@gmail.com', '$2y$10$s8Yqq7CFXYf59vMu5ZrV4OsbK6pT6hMPziBXoqcsxc9FlZJ.yIc7a', '2025-02-10 14:22:09', '2025-02-10 14:22:09'),
(7, 'riya', 'riya123@email.com', '$2y$10$bGyzof2gvVTecxxc2qdZXOHImlr6uAMjMxgwhWK5V9nDi5yPUFjQC', '2025-02-12 05:28:27', '2025-02-12 05:28:27'),
(8, 'sakshi', 'patils@gmail.com', '$2y$10$rHhFHBDkqAo45YsSg5RCkO/eKlqkp3BLiBq5Yx/eDo3Fc9Fo29wwW', '2025-02-13 16:51:35', '2025-02-13 16:51:35'),
(9, 'Saii', 'polsahil00@gmail.com', '$2y$10$vC.T5frIR1Wz8j9t8cOHPuRosZf9YcmlHu1kOvnOLhd9.e2BM8Co6', '2025-02-23 08:18:00', '2025-02-23 08:18:00'),
(10, 'anil', 'anil1@gmail.com', '$2y$10$0swcXAvqDdFabtQNXdTmu.uTdYkqYqLjo5MsMwJeL5Lh1TtyjE70i', '2025-03-06 11:04:47', '2025-03-06 11:04:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blouse_categories`
--
ALTER TABLE `blouse_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prices`
--
ALTER TABLE `prices`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `related_images`
--
ALTER TABLE `related_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blouse_categories`
--
ALTER TABLE `blouse_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;

--
-- AUTO_INCREMENT for table `related_images`
--
ALTER TABLE `related_images`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `related_images`
--
ALTER TABLE `related_images`
  ADD CONSTRAINT `related_images_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `blouse_categories` (`category_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
