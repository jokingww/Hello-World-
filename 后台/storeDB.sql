-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2021-09-07 21:53:32
-- 服务器版本： 5.7.28
-- PHP 版本： 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `storeDB`
--

-- --------------------------------------------------------

--
-- 表的结构 `carousel`
--

CREATE TABLE `carousel` (
  `carousel_id` int(11) NOT NULL,
  `imgPath` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `describes` char(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` char(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, '联考'),
(2, '考研全程班一对一'),
(3, '公共课程'),
(4, '专业课程'),
(5, '考研全程班多对一'),
(6, '特色课程');

-- --------------------------------------------------------

--
-- 表的结构 `collect`
--

CREATE TABLE `collect` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `collect_time` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `collect`
--

INSERT INTO `collect` (`id`, `user_id`, `product_id`, `collect_time`) VALUES
(4, 1, 12, 1630921574173),
(5, 1, 19, 1630921583086),
(9, 3, 2, 1631019817421),
(10, 3, 28, 1631020120794),
(11, 4, 3, 1631021746944),
(12, 4, 4, 1631021770950),
(13, 4, 14, 1631021773834),
(14, 4, 30, 1631021777465),
(15, 4, 9, 1631021782296);

-- --------------------------------------------------------

--
-- 表的结构 `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_num` int(11) NOT NULL,
  `product_price` double NOT NULL,
  `order_time` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `orders`
--

INSERT INTO `orders` (`id`, `order_id`, `user_id`, `product_id`, `product_num`, `product_price`, `order_time`) VALUES
(1, 11630656189939, 1, 2, 3, 2599, 1630656189939),
(2, 11630656189939, 1, 17, 1, 1699, 1630656189939),
(3, 11630656189939, 1, 6, 1, 1199, 1630656189939),
(4, 11630656189939, 1, 1, 1, 1599, 1630656189939),
(5, 11630749180335, 1, 11, 1, 9799, 1630749180335),
(6, 11630749180335, 1, 19, 1, 4899, 1630749180335),
(7, 11630921766042, 1, 18, 1, 35999, 1630921766042),
(8, 21630923014708, 2, 19, 1, 4899, 1630923014708),
(9, 21630923014708, 2, 17, 1, 18999, 1630923014708),
(10, 21631011644992, 2, 3, 1, 7499, 1631011644992),
(11, 31631019460521, 3, 28, 1, 14357, 1631019460521),
(12, 31631019615815, 3, 4, 1, 5999, 1631019615815),
(13, 31631019615815, 3, 33, 1, 3069, 1631019615815),
(14, 31631019615815, 3, 7, 1, 299, 1631019615815),
(15, 31631019615815, 3, 28, 1, 14357, 1631019615815),
(16, 31631019615815, 3, 17, 1, 18999, 1631019615815),
(17, 41631021760363, 4, 17, 1, 18999, 1631021760363),
(18, 41631021760363, 4, 3, 1, 7499, 1631021760363);

-- --------------------------------------------------------

--
-- 表的结构 `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_title` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `product_intro` text COLLATE utf8_unicode_ci NOT NULL,
  `product_picture` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_price` double NOT NULL,
  `product_selling_price` double NOT NULL,
  `product_num` int(11) NOT NULL,
  `product_sales` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `category_id`, `product_title`, `product_intro`, `product_picture`, `product_price`, `product_selling_price`, `product_num`, `product_sales`) VALUES
(0, '23届三师全程班【普通院校】【特惠课程】', 2, '', '', 'public/imgs/2/142327fb4155582575.jpg', 15698, 11588, 9999, 1000),
(1, '补差价', 6, '', '', 'public/imgs/6/1116011e500c204879.png', 1, 1, 9999, 1000),
(2, '公共课·双师一对一【单科】【优惠】', 3, '', '', 'public/imgs/3/16362486baab107642.jpg', 3999, 3699, 9999, 1000),
(3, '公共课·双师一对一【三科】【优惠】', 3, '', '', 'public/imgs/3/163938a4a5d7280201.jpg', 8999, 7499, 9999, 1000),
(4, '公共课·双师一对一【两科】【优惠】', 3, '', '', 'public/imgs/3/16415862fd75222423.jpg', 6999, 5999, 9999, 1000),
(5, '考研英语作文一对一批改【精批+突击提分指导】小作文', 6, '', '', 'public/imgs/6/1651120ed8c4431026.png', 30, 30, 9999, 1000),
(6, '考研英语作文一对一【精批+突击提分指导】大作文', 6, '', '', 'public/imgs/6/16482595a7f6669411.png', 35, 35, 9999, 1000),
(7, '考研英语作文一对一批改', 6, '', '', 'public/imgs/6/1458400ac3a6218060.png', 299, 299, 9999, 1000),
(8, '公共课·双师一对一【两科】', 3, '', '', 'public/imgs/3/1237277c24d8596579.jpg', 6999, 6999, 9999, 1000),
(9, '公共课·双师一对一【三科】', 3, '', '', 'public/imgs/3/1240055b37d1253316.jpg', 8999, 8999, 9999, 1000),
(10, '考研专业课一对一【艺术类语言类科研院校专业】【60课时】', 4, '', '', 'public/imgs/4/123351f0aceb008507.jpg', 13499, 12999, 9999, 1000),
(11, '考研专业课一对一【普通院校】【60课时】', 4, '', '', 'public/imgs/4/1231026230ac016662.jpg', 10299, 9799, 9999, 1000),
(12, '管综手把手【高端多对一】长线班', 1, '', '', 'public/imgs/1/102749519c03075418.png', 6999, 6999, 9999, 1000),
(13, '考研专业课一对一【重点院校】【60课时】', 4, '', '', 'public/imgs/4/12154956a9cc317991.jpg', 11899, 11399, 9999, 1000),
(14, '考研专业课一对一【普通院校】【40课时】', 4, '', '', 'public/imgs/4/1038466ec761042318.jpg', 8599, 8199, 9999, 1000),
(15, '考研专业课一对一【艺术类语言类科研院校专业】【40课时】', 4, '', '', 'public/imgs/4/111922ae73bd062192.jpg', 10199, 9799, 9999, 1000),
(16, '考研专业课一对一【重点院校】【40课时】', 4, '', '', 'public/imgs/4/120412caef71376684.jpg', 9399, 8999, 9999, 1000),
(17, '高端多对一✔专享定制【标准版】', 1, '', '', 'public/imgs/5/1650433d3a2d050090.jpg', 18999, 18999, 9999, 1000),
(18, '高端多对一✔专享定制', 5, '', '', 'public/imgs/5/14070040aa0a112124.png', 35999, 35999, 9999, 1000),
(19, '管综手把手【高端多对一】【优惠】', 1, '', '', 'public/imgs/1/1914339e3726464097.jpg', 4899, 4899, 9999, 1000),
(20, '23届三师全程班【重点院校】【特惠课程】', 2, '', '', 'public/imgs/2/142621d9a9bd065468.jpg', 16498, 12588, 9999, 1000),
(21, '23届三师全程班【艺术类语言类科研院校专业】【特惠课程】', 2, '', '', 'public/imgs/2/142952039a97539101.jpg', 17298, 13388, 9999, 1000),
(22, '考研择校·私人订制【福利】', 6, '', '', 'public/imgs/6/1552502e5c6d855443.jpg', 299, 299, 9999, 1000),
(23, '考研专业课一对一【普通院校】【25课时】', 4, '', '', 'public/imgs/4/1159484ddc66843405.jpg', 5599, 5299, 9999, 1000),
(24, '考研专业课一对一【重点院校】【25课时】', 4, '', '', 'public/imgs/4/1204011a7924674979.jpg', 6599, 6299, 9999, 1000),
(25, '考研数学【答疑】【全程】【特惠】', 6, '', '', 'public/imgs/6/152309d97fa7051339.jpg', 2499, 750, 9999, 1000),
(26, '考研专业课一对一+通关计划两科【普通院校】【优惠】', 5, '', '', 'public/imgs/5/181318e270ff561972.png', 14887, 13357, 9999, 1000),
(27, '考研专业课一对一+通关计划三科', 5, '', '', 'public/imgs/5/181151795282680630.png', 16887, 14657, 9999, 1000),
(28, '考研专业课一对一+通关计划两科【重点院校】【优惠】', 5, '', '', 'public/imgs/5/18100082ff7b023050.png', 15887, 14357, 9999, 1000),
(29, '考研专业课一对一+通关计划三科【重点院校】【优惠】', 5, '', '', 'public/imgs/5/180811b5baf6698712.png', 17887, 15657, 9999, 1000),
(30, '22考研公共课通关计划【三科联报】【优惠】', 3, '', '', 'public/imgs/3/1805448d77e1947005.png', 7999, 6469, 9999, 1000),
(31, '22考研公共课通关计划【两科联报】', 3, '', '', 'public/imgs/3/180445d70b91562275.png', 5999, 5999, 9999, 1000),
(32, '22考研公共课通关计划【单科】【优惠】', 3, '', '', 'public/imgs/3/18030044fb48937424.png', 3999, 3069, 9999, 1000),
(33, '22考研公共课通关计划【单科】【优惠】', 3, '', '', 'public/imgs/3/1411462f0836482304.png', 3999, 3069, 9999, 1000),
(34, '22考研公共课通关计划【两科联报】【优惠】', 3, '', '', 'public/imgs/3/115646e6c2c7945964.png', 5999, 5069, 9999, 1000),
(35, '22考研公共课通关计划【三科联报】【优惠】', 3, '', '', 'public/imgs/3/111940c1010b111557.png', 7999, 6469, 9999, 1000),
(36, '22考研公共课【英语】', 6, '', '', 'public/imgs/6/1106499b0288898699.png', 3999, 3999, 9999, 1000),
(37, '22考研公共课【政治】', 6, '', '', 'public/imgs/6/1105139eeb41380014.png', 3999, 3999, 9999, 1000),
(38, '22考研公共课【数学】', 6, '', '', 'public/imgs/6/110235b806ed691275.png', 3999, 3999, 9999, 1000),
(46, '考研专业课一对一+通关计划单科【重点院校】【优惠】', 5, '', '', 'public/imgs/5/17425828de97374291.png', 13887, 12657, 9999, 1000),
(47, '考研专业课一对一+通关计划单科【普通院校】【优惠】', 5, '', '', 'public/imgs/5/174149d83eed595380.png', 12887, 11657, 9999, 1000),
(48, '公共课考研通关计划【两科】', 3, '', '', 'public/imgs/3/1014102e0214722136.png', 4799, 4799, 9999, 1000),
(49, '公共课考研通关计划【三科】', 3, '', '', 'public/imgs/3/101459325ac2441337.png', 7999, 7999, 9999, 1000),
(50, '考研专业课', 4, '', '', 'public/imgs/4/17462628a6ce714593.png', 8888, 8588, 9999, 1000),
(51, '考研专业课', 4, '', '', 'public/imgs/4/175124c02d90389215.png', 9888, 9588, 9999, 1000),
(52, '考研专业课一对一【艺术类语言类科研院校专业】【25课时】', 4, '', '', 'public/imgs/4/120620ccb585932335.jpg', 7399, 7099, 9999, 1000),
(53, '考研专业课', 4, '', '', 'public/imgs/4/1810455477b1217886.png', 10688, 10388, 9999, 1000),
(54, '公共课考研通关计划【两科】【优惠】', 3, '', '', 'public/imgs/3/1153040458ff326641.png', 5999, 5069, 9999, 1000),
(55, '高端多对一✔专享定制【标准版】', 5, '', '', 'public/imgs/5/1650433d3a2d050090.jpg', 18999, 18999, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `product_picture`
--

CREATE TABLE `product_picture` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_picture` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `product_picture`
--

INSERT INTO `product_picture` (`id`, `product_id`, `product_picture`, `intro`) VALUES
(2, 2, 'public/imgs/3/1521393873e6384264.jpg', NULL),
(1, 1, 'public/imgs/6/19385821ac94144599.JPG', NULL),
(0, 0, 'public/imgs/2/14230261c924239083.jpg', NULL),
(3, 3, 'public/imgs/3/152202a3fd2c594919.jpg', NULL),
(4, 4, 'public/imgs/3/152223f88261501922.jpg', NULL),
(5, 5, 'public/imgs/6/155619360f3f123642.png', NULL),
(6, 6, 'public/imgs/6/163756479fd9302944.png', NULL),
(7, 7, 'public/imgs/6/145628ccb627624579.png', NULL),
(8, 8, 'public/imgs/3/12384226e18d084124.jpg', NULL),
(9, 9, 'public/imgs/3/12404083d296033181.jpg', NULL),
(10, 10, 'public/imgs/4/102725d48d60052455.jpg', NULL),
(11, 11, 'public/imgs/4/10283647d1a4267895.jpg', NULL),
(12, 12, 'public/imgs/1/1026466208e0768226.jpg', NULL),
(13, 13, 'public/imgs/4/1029299d68b6587582.jpg', NULL),
(14, 14, 'public/imgs/4/1457448ec001471338.jpg', NULL),
(15, 15, 'public/imgs/4/145906a57e53177954.jpg', NULL),
(16, 16, 'public/imgs/4/15002590b169598429.jpg', NULL),
(17, 17, 'public/imgs/5/14404800efce042023.png', NULL),
(18, 18, 'public/imgs/5/144116c13bc5444644.png', NULL),
(19, 19, 'public/imgs/1/19154841a183913319.jpg', NULL),
(20, 20, 'public/imgs/2/14260085171b204614.jpg', NULL),
(21, 21, 'public/imgs/2/142935fd588e294744.jpg', NULL),
(22, 22, 'public/imgs/6/15543399b573288747.jpg', NULL),
(23, 23, 'public/imgs/4/115455f52580851737.jpg', NULL),
(24, 24, 'public/imgs/4/11555285534d767731.jpg', NULL),
(25, 25, 'public/imgs/6/1522179563f6806902.jpg', NULL),
(26, 26, 'public/imgs/5/1011302b9b85272003.png', NULL),
(27, 27, 'public/imgs/5/1011302b9b85272003.png', NULL),
(28, 28, 'public/imgs/5/1011302b9b85272003.png', NULL),
(29, 29, 'public/imgs/5/1011302b9b85272003.png', NULL),
(30, 30, 'public/imgs/3/16334590dc7c708631.png', NULL),
(31, 31, 'public/imgs/3/16334590dc7c708631.png', NULL),
(32, 32, 'public/imgs/3/16334590dc7c708631.png', NULL),
(33, 33, 'public/imgs/3/1447291e6ee5760989.png', NULL),
(34, 34, 'public/imgs/3/144834200e81691859.png', NULL),
(35, 35, 'public/imgs/3/1448546d7fbd666963.png', NULL),
(36, 36, 'public/imgs/6/16334590dc7c708631.png', NULL),
(37, 37, 'public/imgs/6/16334590dc7c708631.png', NULL),
(38, 38, 'public/imgs/6/16334590dc7c708631.png', NULL),
(46, 46, 'public/imgs/5/1011302b9b85272003.png', NULL),
(47, 47, 'public/imgs/5/1011302b9b85272003.png', NULL),
(48, 48, 'public/imgs/3/152619bcfff3808734.png', NULL),
(49, 49, 'public/imgs/3/152619bcfff3808734.png', NULL),
(50, 50, 'public/imgs/4/171541dbeb07734450.png', NULL),
(51, 51, 'public/imgs/4/171541dbeb07734450.png', NULL),
(52, 52, 'public/imgs/4/115644c627a7780329.jpg', NULL),
(53, 53, 'public/imgs/4/171541dbeb07734450.png', NULL),
(54, 54, 'public/imgs/3/15255978cf41367336.png', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `shoppingCart`
--

CREATE TABLE `shoppingCart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `num` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `shoppingCart`
--

INSERT INTO `shoppingCart` (`id`, `user_id`, `product_id`, `num`) VALUES
(30, 3, 18, 1),
(29, 3, 6, 1),
(28, 3, 28, 1);

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `userName` char(40) COLLATE utf8_unicode_ci NOT NULL,
  `password` char(40) COLLATE utf8_unicode_ci NOT NULL,
  `userPhoneNumber` char(11) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`user_id`, `userName`, `password`, `userPhoneNumber`) VALUES
(1, 'admin', 'a123456', NULL),
(2, 'admin1', 'a123456', NULL),
(3, 'admin3', 'a123456', NULL),
(4, 'aaaaa', 'a12345', NULL);

--
-- 转储表的索引
--

--
-- 表的索引 `carousel`
--
ALTER TABLE `carousel`
  ADD PRIMARY KEY (`carousel_id`);

--
-- 表的索引 `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- 表的索引 `collect`
--
ALTER TABLE `collect`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_collect_user_id` (`user_id`),
  ADD KEY `FK_collect_id` (`product_id`);

--
-- 表的索引 `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_order_user_id` (`user_id`),
  ADD KEY `FK_order_id` (`product_id`);

--
-- 表的索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `FK_product_category` (`category_id`);

--
-- 表的索引 `product_picture`
--
ALTER TABLE `product_picture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_product_id` (`product_id`);

--
-- 表的索引 `shoppingCart`
--
ALTER TABLE `shoppingCart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_user_id` (`user_id`),
  ADD KEY `FK_shoppingCart_id` (`product_id`);

--
-- 表的索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `userName` (`userName`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `carousel`
--
ALTER TABLE `carousel`
  MODIFY `carousel_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `collect`
--
ALTER TABLE `collect`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- 使用表AUTO_INCREMENT `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- 使用表AUTO_INCREMENT `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- 使用表AUTO_INCREMENT `product_picture`
--
ALTER TABLE `product_picture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- 使用表AUTO_INCREMENT `shoppingCart`
--
ALTER TABLE `shoppingCart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- 使用表AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
