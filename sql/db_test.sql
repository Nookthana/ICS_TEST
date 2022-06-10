-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2022 at 02:36 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `user` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `create` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `user`, `password`, `create`) VALUES
(1, 'admin', '123', '10-06-2022 12:20:31');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `id_product` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_order` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` int(10) NOT NULL,
  `total_price` int(255) NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `create` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `id_product`, `id_order`, `amount`, `total_price`, `status`, `create`) VALUES
(29, 'S999', 'IDRMKFD20220610130455', 1005, 321600, 'placed_order', '10-06-2022'),
(30, 'S111', 'IDP4DJS20220610130651', 999, 399600, 'placed_order', '10-06-2022'),
(31, 'S111', 'IDTJ7UY20220610130657', 10, 4000, 'placed_order', '11-06-2022'),
(32, 'S666', 'IDGLXYR20220610130755', 100, 29000, 'paid', '11-06-2022'),
(33, 'S666', 'IDEXI9V20220610130800', 5, 1450, 'paid', '12-06-2022'),
(34, 'S1212', 'IDPXI2S20220610130840', 500, 160000, 'out of shipping', '12-06-2022'),
(35, 'S1212', 'ID8J7BW20220610130844', 5, 1600, 'out of shipping', '13-06-2022'),
(36, 'S777', 'ID1RY9I20220610130927', 5000, 1450000, 'completed', '13-06-2022'),
(37, 'S777', 'ID92DM520220610130930', 500, 145000, 'completed', '14-06-2022'),
(38, 'S777', 'IDUD48P20220610132222', 500, 145000, 'completed', '14-06-2022'),
(39, 'S777', 'IDLFOVR20220610132655', 500, 145000, 'completed', '15-06-2022');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `id_product` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `style` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `id_product`, `gender`, `style`, `size`, `price`) VALUES
(1, 'S111', 'Men', 'Red', 'XS', 400),
(2, 'S222', 'Men', 'Red', 'S', 400),
(3, 'S333', 'Men', 'Red', 'M', 420),
(4, 'S444', 'Men', 'Red', 'L', 430),
(5, 'S555', 'Men', 'Red', 'XL', 450),
(6, 'S666', 'Women', 'Black', 'XS', 290),
(7, 'S777', 'Women', 'Red', 'S', 290),
(8, 'S888', 'Women', 'Green', 'M', 290),
(9, 'S999', 'Women', 'Red', 'L', 320),
(10, 'S1010', 'Women', 'Green', 'XL', 320),
(11, 'S1111', 'Women', 'Red', 'S', 120),
(12, 'S1212', 'Men', 'Green', 'XL', 320);

-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

CREATE TABLE `shipping` (
  `id` int(11) NOT NULL,
  `id_order` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `create` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shipping`
--

INSERT INTO `shipping` (`id`, `id_order`, `firstname`, `lastname`, `address`, `create`) VALUES
(22, 'IDRMKFD20220610130455', 'Thanarak', 'Keawseanmauing', '1298 Krung thep - Nonthaburi Road', '10-06-2022'),
(23, 'IDP4DJS20220610130651', 'Thanarak', 'Keawseanmauing', '1298 Krung thep - Nonthaburi Road', '10-06-2022'),
(24, 'IDTJ7UY20220610130657', 'Thanarak', 'Keawseanmauing', '1298 Krung thep - Nonthaburi Road', '11-06-2022'),
(25, 'IDGLXYR20220610130755', 'Thanarak', 'Keawseanmauing', '1298 Krung thep - Nonthaburi Road', '11-06-2022'),
(26, 'IDEXI9V20220610130800', 'Thanarak', 'Keawseanmauing', '1298 Krung thep - Nonthaburi Road', '12-06-2022'),
(27, 'IDPXI2S20220610130840', 'Thanarak', 'Keawseanmauing', '1298 Krung thep - Nonthaburi Road', '12-06-2022'),
(28, 'ID8J7BW20220610130844', 'Thanarak', 'Keawseanmauing', '1298 Krung thep - Nonthaburi Road', '13-06-202'),
(29, 'ID1RY9I20220610130927', 'Thanarak', 'Keawseanmauing', '1298 Krung thep - Nonthaburi Road', '13-06-2022'),
(30, 'ID92DM520220610130930', 'Thanarak', 'Keawseanmauing', '1298 Krung thep - Nonthaburi Road', '14-06-2022'),
(31, 'IDUD48P20220610132222', 'Thanarak', 'Keawseanmauing', '1298 Krung thep - Nonthaburi Road', '14-06-2022'),
(32, 'IDLFOVR20220610132655', 'Thanarak', 'Keawseanmauing', '1298 Krung thep - Nonthaburi Road', '15-06-2022');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_order` (`id_order`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_product` (`id_product`);

--
-- Indexes for table `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_order` (`id_order`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `shipping`
--
ALTER TABLE `shipping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shipping`
--
ALTER TABLE `shipping`
  ADD CONSTRAINT `shipping_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `order` (`id_order`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
