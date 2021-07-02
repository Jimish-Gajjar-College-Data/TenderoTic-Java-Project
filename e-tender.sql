-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2017 at 03:55 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-tender`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_login`
--

CREATE TABLE `admin_login` (
  `Admin_id` varchar(30) NOT NULL,
  `Admin_Password` varchar(50) NOT NULL,
  `name` varchar(30) NOT NULL,
  `profilepic_path` varchar(30) NOT NULL DEFAULT 'default_pro.png'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_login`
--

INSERT INTO `admin_login` (`Admin_id`, `Admin_Password`, `name`, `profilepic_path`) VALUES
('jimish.gajjar@gmail.com', '4d5a35c2a9319e57f5e2913ea97df173', 'Jimish Gajjar', 'PicsArt_05-30-04.00.57.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `title`, `description`) VALUES
(1, 'Agro Products', ''),
(2, 'Air Conditioners', ''),
(3, 'Road construuction', ''),
(4, 'Air Transport', ''),
(5, 'Alternators', ''),
(6, 'Aluminium', ''),
(7, 'Animal and Animal Feeds', ''),
(8, ' Interior Designer', ''),
(9, 'Automobiles Ancillaries', ''),
(10, 'Aviation Equipment', ''),
(11, 'Ball Bearings', ''),
(12, 'Ballast', ''),
(13, 'Soft Drinks ', ''),
(14, 'Boiler and Heater', ''),
(15, 'Bridges ', ''),
(16, 'Building Material', ''),
(17, 'Business Consultancy ', ''),
(18, 'Canal/Irrigation Work', ''),
(19, 'Casting/Structurals/Fabricatio', ''),
(20, 'Ceiling/Flooring/Plaster ', ''),
(21, 'Cement', ''),
(22, 'Cement and Asbestos Products', ''),
(23, 'Ceramic tiles and Articles', ''),
(24, 'Chemical Machinery ', ''),
(25, 'Chemicals', ''),
(26, ' Civil Works', ''),
(27, 'Woods and Furniture', ''),
(28, 'Coal and Lignite', ''),
(29, 'Commercial Vehicles', ''),
(30, 'Computer Hardwares and Consuma', ''),
(31, 'Computer Softwares', ''),
(32, 'Conductors and Inductors', ''),
(33, 'Crude Oil / Natural Gas / Mine', ''),
(34, 'Dairy Products', ''),
(35, 'Dam Work ', ''),
(36, 'Desilting', ''),
(37, 'Diversified ', ''),
(38, 'Drainage', ''),
(39, 'Drilling', ''),
(40, ' Pharmaceuticals', ''),
(41, 'Electronics Tenders ', ''),
(42, 'Electronics', ''),
(43, 'Enviromental Work', ''),
(44, 'Excavation', ''),
(45, 'Fan', ''),
(46, 'Fasteners', ''),
(47, 'Fencing/Wall Work', ''),
(48, 'Fertilizers and pesticides', ''),
(49, 'Food Grains', ''),
(50, 'Food Processing ', ''),
(51, 'Footwear and Leather Products', ''),
(52, 'Gems and Jewellery', ''),
(53, 'Generators', ''),
(54, 'Glass and Glassware', ''),
(55, 'Health Services/Equipments', ''),
(56, 'Hotels and Restaurants', ''),
(57, 'House / Building', ''),
(58, 'Industrial Gases', ''),
(59, 'Insulator', ''),
(60, 'Insurance Services', ''),
(61, 'Iron ', ''),
(62, 'Lab Equipments', ''),
(63, 'Labour And Manpower', ''),
(64, 'Lift', ''),
(65, 'Light and Bulbs', ''),
(66, 'Machine Tools', ''),
(67, 'Material Handling', ''),
(68, 'Metal Tubes and Pipes', ''),
(69, 'Meters', ''),
(70, 'Minerals', ''),
(71, 'Misc. Manufactured Articles', ''),
(72, 'Non Classified', ''),
(73, 'Non Conventional Energy', ''),
(74, 'Office Automation', ''),
(75, 'Other Electrical Products', ''),
(76, 'Other Machinery', ''),
(77, 'Other Metal Products', ''),
(78, 'Other Non Metallic Mineral', ''),
(79, 'Other Non-Ferrous Metals', ''),
(80, 'Other Services', ''),
(81, 'Other Transport Equipments', ''),
(82, 'Painting', ''),
(83, 'Paints and Varnishes', ''),
(84, 'Panel/distribution Board', ''),
(85, 'Paper and Paper Products', ''),
(86, 'Passenger Cars and Jeeps ', ''),
(87, 'Petroleum Products', ''),
(88, 'Pharma machinery', ''),
(89, 'Pipeline Project', ''),
(90, 'Plastic Product and Granules ', ''),
(91, 'Plastic Tubes and Pipes', ''),
(92, 'Platform/Jetty/RCC Work', ''),
(93, 'Plumbing/Sanitary Work', ''),
(94, 'Power Plant', ''),
(95, 'Prime Movers', ''),
(96, ' Motor and Compressors', ''),
(97, 'Railway Ancillaries', ''),
(98, 'Railways Transport Services', ''),
(99, 'Real Estate Services', ''),
(100, 'Refractories', ''),
(101, 'Refrigerator', ''),
(102, 'Road Transport Services', ''),
(103, 'Roads ', ''),
(104, 'Rubber Products', ''),
(105, 'Safety Equipment', ''),
(106, 'Scientific Instruments', ''),
(107, 'Security Services', ''),
(108, 'Shed Construction', ''),
(109, 'Shipping', ''),
(110, 'Soil Survey', ''),
(111, 'Stainless Steel', ''),
(112, 'Stones-Granite-Earth', ''),
(113, 'Storage and Warehousing', ''),
(114, 'Storages Batteries', ''),
(115, 'Sub-station works', ''),
(116, 'Sugar', ''),
(117, 'switching Apparatus', ''),
(118, 'Telecommunication Services', ''),
(119, 'Textile Machinery', ''),
(120, 'Textiles Product', ''),
(121, 'Tourism Tenders', ''),
(122, 'Transformers and Capacitors', ''),
(123, 'Trenching and Dredging', ''),
(124, 'Two and Three Wheelers', ''),
(125, 'Valve And Gauge', ''),
(126, 'Vegetable Oils and Starches', ''),
(127, 'Water Purification', ''),
(128, 'Water Storage and Supply', ''),
(129, 'Welding Electrodes', ''),
(130, 'Wires and Cables', '');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `city_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `state_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_id`, `name`, `state_id`) VALUES
(1, 'Ahemadabad', 1),
(2, 'Surat', 1),
(3, 'Vadodara', 1);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `country_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `name`) VALUES
(1, 'india');

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `faq_id` tinyint(4) NOT NULL,
  `ques` text NOT NULL,
  `ans` varchar(200) DEFAULT ' ',
  `ask_date` date NOT NULL,
  `tm_id` varchar(50) NOT NULL DEFAULT '0',
  `tender_id` int(11) NOT NULL DEFAULT '0',
  `whom` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`faq_id`, `ques`, `ans`, `ask_date`, `tm_id`, `tender_id`, `whom`) VALUES
(19, 'Your FAQ.....', 'hiii\r\nhooo\r\n', '2016-11-14', '0', 0, 0),
(20, 'cj cioj io', 'dgfjdiogjdiofgj', '2016-11-21', '0', 0, 0),
(21, 'hjhjhjjhjjhhjhjhj', ' ', '2016-11-21', '0', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `feedback` text NOT NULL,
  `feedback_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fill_tender`
--

CREATE TABLE `fill_tender` (
  `fill_tender_id` int(11) NOT NULL,
  `tenderer_id` varchar(30) NOT NULL,
  `tender_id` int(11) NOT NULL,
  `date_of_fill` date NOT NULL,
  `price` varchar(30) NOT NULL,
  `que_option` text NOT NULL,
  `answer_1` text NOT NULL,
  `answer_2` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fill_tender`
--

INSERT INTO `fill_tender` (`fill_tender_id`, `tenderer_id`, `tender_id`, `date_of_fill`, `price`, `que_option`, `answer_1`, `answer_2`) VALUES
(1, 'jimish.gajjar@gmail.com', 1005, '2017-01-11', '1000000', '1-3,3-1,4-2,', '2-''abc'',', ''),
(2, 'dhruve.panchal@gmail.com', 1005, '2017-01-12', '10000', '1-1,3-1,4-1,', '2-''wer'',', ''),
(3, 'parthnayi786@gmail.com', 1005, '2017-01-12', '15000', '1-3,3-1,4-3,', '2-''cfd'',', '');

-- --------------------------------------------------------

--
-- Table structure for table `front_contact_us`
--

CREATE TABLE `front_contact_us` (
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `mobile_no` varchar(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `front_contact_us`
--

INSERT INTO `front_contact_us` (`first_name`, `last_name`, `mobile_no`, `email`, `message`) VALUES
('Jimish ', 'Gajjar', '9737956805', 'jimish.gajjar@gmail.com', 'This  web site for ......... best to mange tenders...... and upload tender....it''s provide best services to users.....................................');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `manufacture` varchar(50) NOT NULL,
  `quality` varchar(30) NOT NULL,
  `quantity` varchar(30) NOT NULL,
  `manufacture_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `name`, `manufacture`, `quality`, `quantity`, `manufacture_date`) VALUES
(101, 'cement', 'ambuja cement', 'best', '10', '2016-10-02'),
(102, 'food', 'gajanand foods', 'best', '100', '2016-10-18'),
(103, 'troli', 'aiirindia', 'best', '100', '2016-10-18');

-- --------------------------------------------------------

--
-- Table structure for table `que`
--

CREATE TABLE `que` (
  `ctr` int(11) NOT NULL,
  `tender_id` int(11) NOT NULL,
  `tm_id` varchar(30) NOT NULL,
  `q_id` int(11) DEFAULT NULL,
  `question` varchar(200) DEFAULT NULL,
  `answer_type_id` int(11) DEFAULT NULL,
  `an_op_1` varchar(100) DEFAULT NULL,
  `an_op_2` varchar(100) DEFAULT NULL,
  `an_op_3` varchar(100) DEFAULT NULL,
  `an_op_4` varchar(100) DEFAULT NULL,
  `an_op_5` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `que`
--

INSERT INTO `que` (`ctr`, `tender_id`, `tm_id`, `q_id`, `question`, `answer_type_id`, `an_op_1`, `an_op_2`, `an_op_3`, `an_op_4`, `an_op_5`) VALUES
(1, 1001, 'parthnayi786@gmail.com', 1, 'how was your day?', 1, 'good', 'Average', 'Bad', NULL, NULL),
(6, 1001, 'parthnayi786@gmail.com', 2, 'Hobbies?', 2, 'Singing', 'dancing', 'painting', NULL, NULL),
(17, 1005, 'hkpatel@gmail.com', 1, 'how many worker do you give', 2, '10', '20', '30', NULL, NULL),
(18, 1005, 'hkpatel@gmail.com', 2, 'which type of food you provide', 3, NULL, NULL, NULL, NULL, NULL),
(19, 1005, 'hkpatel@gmail.com', 3, 'which company food you provide?', 1, 'xyz', 'abc', 'def', NULL, NULL),
(20, 1005, 'hkpatel@gmail.com', 4, 'which area you provide', 1, 'chandlodia', 'ranip', 'vadaj', NULL, NULL),
(21, 1003, 'jimish.gajjar@gmail.com', 1, 'which airport do you have your transpor service?', 1, 'ahmedabad', 'mumbai', 'rajasthan', NULL, NULL),
(22, 1003, 'jimish.gajjar@gmail.com', 2, 'how many charges of transport?', 2, '1000', '2000', '2500', '5000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `result_tender`
--

CREATE TABLE `result_tender` (
  `result_id` int(11) NOT NULL,
  `tenderer_id` varchar(30) NOT NULL,
  `tender_id` int(11) NOT NULL,
  `price` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `state_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `country_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`state_id`, `name`, `country_id`) VALUES
(1, 'gujarat', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tenderer_login`
--

CREATE TABLE `tenderer_login` (
  `tenderer_id` varchar(30) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `approve` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tenderer_login`
--

INSERT INTO `tenderer_login` (`tenderer_id`, `password`, `block`, `approve`) VALUES
('dhruve.panchal@gmail.com', '25d55ad283aa400af464c76d713c07ad', 0, 2),
('gajjar.jimish@gmail.com', '25d55ad283aa400af464c76d713c07ad', 0, 2),
('hkpatel@gmail.com', '25d55ad283aa400af464c76d713c07ad', 0, 2),
('jimish.gajjar@gmail.com', '25d55ad283aa400af464c76d713c07ad', 0, 2),
('parthnayi786@gmail.com', '25d55ad283aa400af464c76d713c07ad', 0, 2),
('sandip2010@gmail.com', '25d55ad283aa400af464c76d713c07ad', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tenderer_regis_tab`
--

CREATE TABLE `tenderer_regis_tab` (
  `tenderer_id` varchar(30) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `person_name` varchar(30) NOT NULL,
  `contact_no1` varchar(10) NOT NULL,
  `contact_no2` varchar(10) NOT NULL,
  `area` varchar(20) NOT NULL,
  `city_id` int(11) NOT NULL,
  `zip_code` int(11) NOT NULL,
  `reg_date` date NOT NULL,
  `profilepic_path` varchar(30) NOT NULL DEFAULT 'default_pro.png'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tenderer_regis_tab`
--

INSERT INTO `tenderer_regis_tab` (`tenderer_id`, `company_name`, `person_name`, `contact_no1`, `contact_no2`, `area`, `city_id`, `zip_code`, `reg_date`, `profilepic_path`) VALUES
('dhruve.panchal@gmail.com', 'amexon', 'dhruva panchal', '5467893122', '2587413669', 'new ranip', 1, 845697, '2016-11-29', 'default_pro.png'),
('gajjar.jimish@gmail.com', 'expertinfotec', 'jimish gajjar', '9737956805', '9824588212', 'chandlodia', 2, 382481, '0000-00-00', 'default_pro.png'),
('hkpatel@gmail.com', 'snapdeal', 'hkpatel', '7894561322', '2222228888', 'maninager', 1, 784596, '2016-11-29', 'default_pro.png'),
('jimish.gajjar@gmail.com', 'Microsoft', 'Bill Gates', '9409354807', '9276808069', 'chandlodia', 1, 380061, '2016-10-22', 'tenderer.jpg'),
('parthnayi786@gmail.com', 'Flipkart', 'sachin bansal', '9737956805', '9824588212', 'Ghatlodiya', 1, 382481, '2016-10-22', 'default_pro.png'),
('sandip2010@gmail.com', 'flipkart', 'sandip bansal', '9874562222', '2255688125', 'thoal', 1, 122355, '2016-11-29', 'default_pro.png');

-- --------------------------------------------------------

--
-- Table structure for table `tender_info`
--

CREATE TABLE `tender_info` (
  `tender_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `category_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `tm_id` varchar(30) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` varchar(30) NOT NULL,
  `type_of_work` varchar(50) NOT NULL,
  `reg_date` datetime NOT NULL,
  `verification_date` date NOT NULL,
  `result_dec_date` date NOT NULL,
  `approve` tinyint(4) NOT NULL DEFAULT '0',
  `block` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tender_info`
--

INSERT INTO `tender_info` (`tender_id`, `title`, `category_id`, `description`, `tm_id`, `product_id`, `price`, `type_of_work`, `reg_date`, `verification_date`, `result_dec_date`, `approve`, `block`) VALUES
(1001, 'road maintenance in ahmedabadroad maintenance in ahmedabadroad maintenance in ahmedabadroad maintena', 3, 'road maintenance in ahmedabad....', 'parthnayi786@gmail.com', 101, '1000', 'road construction', '2017-01-01 08:02:27', '2017-01-15', '2017-01-21', 1, 0),
(1002, 'air transport', 4, 'transport courier and other products', 'parthnayi786@gmail.com', 103, '5000', 'transport courier', '2017-01-05 10:06:00', '2017-01-20', '2017-02-01', 0, 0),
(1003, 'air transpor', 4, 'this is contract to compleat air trancceport sysytem', 'jimish.gajjar@gmail.com', 101, '50000', 'air transport', '2017-01-03 04:28:08', '2017-01-14', '2017-01-25', 0, 0),
(1004, 'alimuniam', 6, 'making still and matirals', 'parthnayi786@gmail.com', 102, '85000', 'alimuniam', '2016-12-29 17:23:00', '2017-01-25', '2017-02-07', 0, 0),
(1005, 'Animal and Animal Feeds', 7, 'Animal and Animal Feeds provide to all store animals feeds', 'hkpatel@gmail.com', 103, '65000', 'Animal and Animal Feeds', '2016-12-30 11:11:17', '2017-01-06', '2017-01-17', 1, 0),
(1006, 'Automobiles Ancillaries', 9, 'Automobiles Ancillaries making cars etc', 'raj.21@gmail.com', 102, '90000', 'Automobiles Ancillaries', '2016-12-01 15:25:54', '2017-01-30', '2017-02-15', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tender_manager_login`
--

CREATE TABLE `tender_manager_login` (
  `tm_id` varchar(30) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `approve` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tender_manager_login`
--

INSERT INTO `tender_manager_login` (`tm_id`, `password`, `block`, `approve`) VALUES
('dhruve.panchal@gmail.com', '25d55ad283aa400af464c76d713c07ad', 0, 2),
('hkpatel@gmail.com', '25d55ad283aa400af464c76d713c07ad', 0, 2),
('jimish.gajjar@gmail.com', '25d55ad283aa400af464c76d713c07ad', 0, 2),
('parthnayi786@gmail.com', '25d55ad283aa400af464c76d713c07ad', 0, 2),
('raj.21@gmail.com', '25d55ad283aa400af464c76d713c07ad', 0, 2),
('sandip2010@gmail.com', '25d55ad283aa400af464c76d713c07ad', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tender_manager_regis_tab`
--

CREATE TABLE `tender_manager_regis_tab` (
  `tm_id` varchar(30) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `person_name` varchar(30) NOT NULL,
  `contact_no1` varchar(10) NOT NULL,
  `contact_no2` varchar(10) NOT NULL,
  `area` varchar(20) NOT NULL,
  `city_id` int(11) NOT NULL,
  `zip_code` int(11) NOT NULL,
  `reg_date` date NOT NULL,
  `profilepic_path` varchar(30) NOT NULL DEFAULT 'default_pro.png'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tender_manager_regis_tab`
--

INSERT INTO `tender_manager_regis_tab` (`tm_id`, `company_name`, `person_name`, `contact_no1`, `contact_no2`, `area`, `city_id`, `zip_code`, `reg_date`, `profilepic_path`) VALUES
('dhruve.panchal@gmail.com', 'amexon', 'dhruva panchal', '5467893122', '2587413669', 'bodakdev', 1, 845697, '2016-11-28', 'default_pro.png'),
('hkpatel@gmail.com', 'snapdeal', 'hkpatel', '7894561322', '2222228888', 'thoal', 1, 784596, '2016-11-28', 'default_pro.png'),
('jimish.gajjar@gmail.com', 'Microsoft', 'Bill Gates', '9409354807', '9276808069', 'Ghatlodiya', 1, 380061, '2016-10-24', 'default_pro.png'),
('parthnayi786@gmail.com', 'tcs', 'parth', '1123456789', '9987456321', 'ranip', 1, 11414, '0000-00-00', 'default_pro.png'),
('raj.21@gmail.com', 'sipla', 'raj bhavsar', '5466998871', '1122546987', 'new ranip', 1, 458796, '2016-11-28', 'default_pro.png'),
('sandip2010@gmail.com', 'flipkart', 'sandip bansal', '9874562222', '2255688125', 'maninager', 2, 122355, '2016-11-28', 'default_pro.png');

-- --------------------------------------------------------

--
-- Table structure for table `tender_transaction`
--

CREATE TABLE `tender_transaction` (
  `Tt_id` int(11) NOT NULL,
  `fill_tender_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_login`
--
ALTER TABLE `admin_login`
  ADD PRIMARY KEY (`Admin_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`),
  ADD KEY `state_id` (`state_id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`faq_id`),
  ADD KEY `tm_id` (`tm_id`),
  ADD KEY `tender_id` (`tender_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `fill_tender`
--
ALTER TABLE `fill_tender`
  ADD PRIMARY KEY (`fill_tender_id`),
  ADD KEY `tender_id` (`tender_id`),
  ADD KEY `tenderer_id` (`tenderer_id`);

--
-- Indexes for table `front_contact_us`
--
ALTER TABLE `front_contact_us`
  ADD KEY `email` (`email`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `que`
--
ALTER TABLE `que`
  ADD PRIMARY KEY (`ctr`),
  ADD KEY `tm_id` (`tm_id`),
  ADD KEY `tender_id` (`tender_id`);

--
-- Indexes for table `result_tender`
--
ALTER TABLE `result_tender`
  ADD PRIMARY KEY (`result_id`),
  ADD KEY `tender_id` (`tender_id`),
  ADD KEY `tenderer_id` (`tenderer_id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`state_id`),
  ADD KEY `country_id` (`country_id`);

--
-- Indexes for table `tenderer_login`
--
ALTER TABLE `tenderer_login`
  ADD UNIQUE KEY `tenderer_id_4` (`tenderer_id`),
  ADD KEY `tenderer_id` (`tenderer_id`),
  ADD KEY `tenderer_id_2` (`tenderer_id`),
  ADD KEY `tenderer_id_3` (`tenderer_id`);

--
-- Indexes for table `tenderer_regis_tab`
--
ALTER TABLE `tenderer_regis_tab`
  ADD PRIMARY KEY (`tenderer_id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `tender_info`
--
ALTER TABLE `tender_info`
  ADD PRIMARY KEY (`tender_id`),
  ADD KEY `tm_id` (`tm_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `tender_manager_login`
--
ALTER TABLE `tender_manager_login`
  ADD UNIQUE KEY `tm_id_2` (`tm_id`),
  ADD KEY `tm_id` (`tm_id`);

--
-- Indexes for table `tender_manager_regis_tab`
--
ALTER TABLE `tender_manager_regis_tab`
  ADD PRIMARY KEY (`tm_id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `tender_transaction`
--
ALTER TABLE `tender_transaction`
  ADD PRIMARY KEY (`Tt_id`),
  ADD KEY `fill_tender_id` (`fill_tender_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `faq_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `fill_tender`
--
ALTER TABLE `fill_tender`
  MODIFY `fill_tender_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;
--
-- AUTO_INCREMENT for table `que`
--
ALTER TABLE `que`
  MODIFY `ctr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `result_tender`
--
ALTER TABLE `result_tender`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tender_info`
--
ALTER TABLE `tender_info`
  MODIFY `tender_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1007;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `fill_tender`
--
ALTER TABLE `fill_tender`
  ADD CONSTRAINT `fill_tender_ibfk_1` FOREIGN KEY (`tenderer_id`) REFERENCES `tenderer_regis_tab` (`tenderer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fill_tender_ibfk_2` FOREIGN KEY (`tender_id`) REFERENCES `tender_info` (`tender_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `que`
--
ALTER TABLE `que`
  ADD CONSTRAINT `que_ibfk_2` FOREIGN KEY (`tm_id`) REFERENCES `tender_manager_regis_tab` (`tm_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `que_ibfk_3` FOREIGN KEY (`tender_id`) REFERENCES `tender_info` (`tender_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `result_tender`
--
ALTER TABLE `result_tender`
  ADD CONSTRAINT `result_tender_ibfk_1` FOREIGN KEY (`tender_id`) REFERENCES `tender_info` (`tender_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `result_tender_ibfk_2` FOREIGN KEY (`tenderer_id`) REFERENCES `tenderer_regis_tab` (`tenderer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `state`
--
ALTER TABLE `state`
  ADD CONSTRAINT `state_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tenderer_login`
--
ALTER TABLE `tenderer_login`
  ADD CONSTRAINT `tenderer_login_ibfk_1` FOREIGN KEY (`tenderer_id`) REFERENCES `tenderer_regis_tab` (`tenderer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tenderer_regis_tab`
--
ALTER TABLE `tenderer_regis_tab`
  ADD CONSTRAINT `tenderer_regis_tab_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`);

--
-- Constraints for table `tender_info`
--
ALTER TABLE `tender_info`
  ADD CONSTRAINT `tender_info_ibfk_1` FOREIGN KEY (`tm_id`) REFERENCES `tender_manager_regis_tab` (`tm_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tender_info_ibfk_4` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tender_info_ibfk_5` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tender_manager_login`
--
ALTER TABLE `tender_manager_login`
  ADD CONSTRAINT `tender_manager_login_ibfk_1` FOREIGN KEY (`tm_id`) REFERENCES `tender_manager_regis_tab` (`tm_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tender_manager_regis_tab`
--
ALTER TABLE `tender_manager_regis_tab`
  ADD CONSTRAINT `tender_manager_regis_tab_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tender_transaction`
--
ALTER TABLE `tender_transaction`
  ADD CONSTRAINT `tender_transaction_ibfk_1` FOREIGN KEY (`fill_tender_id`) REFERENCES `fill_tender` (`fill_tender_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
