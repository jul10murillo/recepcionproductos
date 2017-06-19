-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 19-06-2017 a las 14:29:28
-- Versión del servidor: 5.7.18-0ubuntu0.16.04.1
-- Versión de PHP: 7.0.18-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `recepcionproduc`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ano`
--

CREATE TABLE `ano` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `codano` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ano`
--

INSERT INTO `ano` (`id`, `nombre`, `codano`) VALUES
(1, '2015', '15'),
(2, '2016', '16'),
(3, '2017', '17'),
(4, '2018', '18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '1', 1493732747),
('author', '2', 1493732747);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, NULL, NULL, NULL, 1493732747, 1493732747),
('author', 1, NULL, NULL, NULL, 1493732747, 1493732747),
('createPost', 2, 'Create a post', NULL, NULL, 1493732747, 1493732747),
('updatePost', 2, 'Update post', NULL, NULL, 1493732747, 1493732747);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('admin', 'author'),
('author', 'createPost'),
('admin', 'updatePost');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capsula`
--

CREATE TABLE `capsula` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `capsulacol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `capsula`
--

INSERT INTO `capsula` (`id`, `nombre`, `capsulacol`) VALUES
(1, 'JANUARY', '1'),
(2, 'FEBRUARY', '2'),
(3, 'MARCH', '3'),
(4, 'APRIL', '1'),
(5, 'MAY', '2'),
(6, 'JUNE', '3'),
(7, 'JULY', '1'),
(8, 'AUGUST', '2'),
(9, 'SEPTEMBER', '3'),
(10, 'OCTOBER', '1'),
(11, 'NOVEMBER', '2'),
(12, 'DECEMBER', '3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `color`
--

CREATE TABLE `color` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `codcolor` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `color`
--

INSERT INTO `color` (`id`, `nombre`, `codcolor`) VALUES
(1, 'WHITE', '01'),
(2, 'OFF WHITE', '02'),
(3, 'IVORY', '03'),
(4, 'CLEAR', '04'),
(5, 'WHITE PRINT', '05'),
(6, 'BLUE PRINT', '08'),
(7, 'AQUA', '09'),
(8, 'BLUE', '10'),
(9, 'DEEP BLUE', '11'),
(10, 'LIGHT BLUE', '12'),
(11, 'SKY BLUE', '13'),
(12, 'BLUE GREY', '14'),
(13, 'INDIGO', '15'),
(14, 'NAVY', '16'),
(15, 'TURQUOISE', '17'),
(16, 'YELLOW', '20'),
(17, 'MUSTARD', '21'),
(18, 'APRICOT', '22'),
(19, 'LEMON', '23'),
(20, 'YELLOW PRINT', '24'),
(21, 'ORANGE', '30'),
(22, 'ORANGE PRINT', '31'),
(23, 'RED PRINT', '38'),
(24, 'BRICK', '39'),
(25, 'RED', '40'),
(26, 'CORAL', '41'),
(27, 'RUST', '42'),
(28, 'ROSE', '43'),
(29, 'WINE', '44'),
(30, 'PEACH', '45'),
(31, 'ROSEGOLD', '46'),
(32, 'PINK PRINT', '49'),
(33, 'PINK', '50'),
(34, 'DUST PINK', '51'),
(35, 'LIGHT PINK', '52'),
(36, 'FUSCHIA', '53'),
(37, 'LILY', '54'),
(38, 'PURPLE', '55'),
(39, 'LIGHT PURPLE', '56'),
(40, 'CHAMPAGNE', '57'),
(41, 'GREEN PRINT', '59'),
(42, 'GREEN', '60'),
(43, 'OLIVE', '61'),
(44, 'EMERALD', '62'),
(45, 'LIGHT GREEN', '63'),
(46, 'ARMY GREEN', '64'),
(47, 'LIME', '65'),
(48, 'BEIGE PRINT', '68'),
(49, 'DUST', '69'),
(50, 'BROWN', '70'),
(51, 'CAMEL', '71'),
(52, 'KHAKI', '72'),
(53, 'BEIGE', '73'),
(54, 'NUDE', '74'),
(55, 'TAUPE', '75'),
(56, 'TAN', '76'),
(57, 'COFFEE', '77'),
(58, 'BROWN PRINT', '78'),
(59, 'BLACK', '80'),
(60, 'CHARCOAL', '81'),
(61, 'GREY', '82'),
(62, 'SILVER PRINT', '83'),
(63, 'GOLD PRINT', '84'),
(64, 'PEWTER', '85'),
(65, 'BLACK PRINT', '86'),
(66, 'LIGHT GREY', '87'),
(67, 'GREY PRINT', '88'),
(68, 'MULTI', '90'),
(69, 'SNAKE', '91'),
(70, 'METALLICS', '92'),
(71, 'MULTI NEON', '93'),
(72, 'MULTI PASTEL', '94'),
(73, 'GOLD+SILVER', '95'),
(74, 'BLACK & WHITE', '96'),
(75, 'ANIMAL PRINT', '97'),
(76, 'GOLD', '98'),
(77, 'SILVER', '99');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `coddepartamento` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id`, `nombre`, `coddepartamento`) VALUES
(1, 'WOMAN', '1'),
(2, 'MAN', '2'),
(3, 'KIDS', '3'),
(4, 'BABY', '4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `familia`
--

CREATE TABLE `familia` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `codfamilia` varchar(45) NOT NULL,
  `idseccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `familia`
--

INSERT INTO `familia` (`id`, `nombre`, `codfamilia`, `idseccion`) VALUES
(1, 'BLOUSE', '01', 1),
(2, 'TOP', '02', 1),
(3, 'T-SHIRT', '03', 1),
(4, 'SHIRT', '04', 1),
(5, 'SWEATER', '05', 1),
(6, 'JACKET', '06', 1),
(7, 'BLAZER', '07', 1),
(8, 'VEST', '08', 1),
(9, 'COAT', '09', 1),
(10, 'PANT', '10', 1),
(11, 'JEAN', '11', 1),
(12, 'JOGGER', '12', 1),
(13, 'SHORT', '13', 1),
(14, 'SET', '14', 1),
(15, 'SKIRT', '15', 1),
(16, 'ROMPER', '16', 1),
(17, 'DRESS', '17', 1),
(18, 'JUMPSUIT', '18', 1),
(19, 'CARDIGAN', '19', 1),
(20, 'LEGGING', '20', 1),
(21, 'POLO', '21', 1),
(22, 'SWIMWEAR', '22', 1),
(23, 'BERMUDAS', '23', 1),
(24, 'DENIM SHORT', '24', 1),
(25, 'DENIM SKIRT', '25', 1),
(26, 'DENIM SHIRT', '26', 1),
(27, 'DENIM JACKET', '27', 1),
(28, 'DENIM TOP', '28', 1),
(29, 'DENIM VEST', '29', 1),
(30, 'DENIM BLAZER', '30', 1),
(31, 'DENIM DRESS', '31', 1),
(32, 'DENIM JUMPSUIT', '32', 1),
(33, 'DENIM BERMUDA', '33', 1),
(34, 'KIMONO', '34', 1),
(35, 'PONCHO', '35', 1),
(36, 'BALLERINA', '01', 2),
(37, 'FLAT SANDALS', '02', 2),
(38, 'HIGH HEEL SANDALS', '03', 2),
(39, 'MID HEEL SANDALS', '04', 2),
(40, 'LOW HEEL SANDALS', '05', 2),
(41, 'HIGH WEDGES', '06', 2),
(42, 'MID WEDGES', '07', 2),
(43, 'HIGH HEEL PUMP', '08', 2),
(44, 'MID HEEL PUMP', '09', 2),
(45, 'FLAT', '10', 2),
(46, 'SNEAKERS', '11', 2),
(47, 'BOOT', '12', 2),
(48, 'LOAFER', '13', 2),
(49, 'DRESS SHOES', '14', 2),
(50, 'RING', '01', 3),
(51, 'NECKLACE', '02', 3),
(52, 'BRACELET', '03', 3),
(53, 'SET NECKLACE/EARING', '04', 3),
(54, 'SET BRACELET', '05', 3),
(55, 'SET EARINGS', '06', 3),
(56, 'EARINGS', '07', 3),
(57, 'BODY CHAIN', '08', 3),
(58, 'SET BRACELET/NECKLACE', '09', 3),
(59, 'SET RING', '10', 3),
(60, 'HANDBAG', '01', 4),
(61, 'PASHMINA', '02', 4),
(62, 'BACKPACK', '03', 4),
(63, 'BELT', '04', 4),
(64, 'HAT', '05', 4),
(65, 'SUNGLASSES', '06', 4),
(66, 'WALLET', '07', 4),
(67, 'SOCKS', '08', 4),
(68, 'CLUTCH', '09', 4),
(69, 'SPORT BAG', '10', 4),
(70, 'KEYCHAIN', '11', 4),
(71, 'PATCH', '12', 4),
(72, 'SCARF', '13', 4),
(73, 'POUCH', '14', 4),
(74, 'HAIR ELASTIC', '15', 4),
(75, 'HAIR PIECE', '16', 4),
(76, 'TIE', '17', 4),
(77, 'BOWL TIE', '18', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log`
--

CREATE TABLE `log` (
  `idlog` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `operacion` text NOT NULL,
  `id_mapping` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_producto` int(11) DEFAULT NULL,
  `acumulado` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `cod_barra` bigint(20) DEFAULT NULL,
  `referencia` text,
  `archivo` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `log`
--

INSERT INTO `log` (`idlog`, `id_user`, `operacion`, `id_mapping`, `fecha`, `id_producto`, `acumulado`, `cantidad`, `cod_barra`, `referencia`, `archivo`) VALUES
(1, 3, 'Mapping Subido', 1, '2017-06-16 22:37:20', NULL, NULL, NULL, NULL, '', '1. MAPPING EXOTIK TEXTIL JULIO 2017 - copia.csv'),
(2, 3, 'Mapping Subido', 2, '2017-06-16 22:39:01', NULL, NULL, NULL, NULL, '', 'MAPPING AISHOP TEXTIL ABRIL BOOKING 75.csv'),
(3, 3, 'Conteo', 2, '2017-06-19 17:14:46', 254, 1, 199, 17111030011703, 'AU171-1103-001', 'MAPPING AISHOP TEXTIL ABRIL BOOKING 75.csv');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mapping`
--

CREATE TABLE `mapping` (
  `id` int(11) NOT NULL,
  `id_marca` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `tipo` text NOT NULL,
  `archivo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mapping`
--

INSERT INTO `mapping` (`id`, `id_marca`, `fecha`, `tipo`, `archivo`) VALUES
(2, 1, '2017-06-22', 'TEXTIL', 'MAPPING AISHOP TEXTIL ABRIL BOOKING 75.csv');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mapping_header`
--

CREATE TABLE `mapping_header` (
  `id` int(11) NOT NULL,
  `id_mapping` int(11) DEFAULT NULL,
  `factor_costo_num` text NOT NULL,
  `factor_costo` text NOT NULL,
  `tc` text NOT NULL,
  `tc_num` text NOT NULL,
  `factor` text NOT NULL,
  `factor_num` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mapping_header`
--

INSERT INTO `mapping_header` (`id`, `id_mapping`, `factor_costo_num`, `factor_costo`, `tc`, `tc_num`, `factor`, `factor_num`) VALUES
(2, 2, '60', 'FACTOR COSTO', 'TC', '820', 'FACTOR', '4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mapping_header_prev`
--

CREATE TABLE `mapping_header_prev` (
  `id` int(11) NOT NULL,
  `factor_costo_num` text NOT NULL,
  `factor_costo` text NOT NULL,
  `tc` text NOT NULL,
  `tc_num` text NOT NULL,
  `factor` text NOT NULL,
  `factor_num` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `codmarca` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id`, `nombre`, `codmarca`) VALUES
(1, 'AISHOP', 'A'),
(2, 'EXOTIK', 'E'),
(3, 'VESTIMENTA', 'V'),
(4, 'XINFONI', 'X');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1493732462),
('m140506_102106_rbac_init', 1493732575),
('m140602_111327_create_menu_table', 1493733821),
('m160312_050000_create_user', 1493733821),
('m170502_143609_product', 1493758320);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `cod_barra` text,
  `marca` text,
  `departamento` text,
  `seccion` text,
  `familia` text,
  `subfamilia` varchar(255) DEFAULT NULL,
  `temporada` text,
  `ano` text,
  `capsula` text,
  `color` text,
  `talla` varchar(255) DEFAULT NULL,
  `proveedor` varchar(255) DEFAULT NULL,
  `cantidad` text,
  `pvptienda` text,
  `peso` text,
  `serie` text,
  `referencia` text,
  `descripcion` text,
  `costodist` text,
  `pvpmgta` text,
  `carac` varchar(255) DEFAULT NULL,
  `gpeso` text,
  `codmarca` varchar(255) DEFAULT NULL,
  `coddepto` text,
  `codseccion` text,
  `codfamilia` text,
  `codsubfamilia` text,
  `codtemporada` varchar(255) DEFAULT NULL,
  `codano` text,
  `codcapsula` text,
  `codcolor` text,
  `codtalla` text,
  `codprov` text,
  `descapsula` varchar(255) DEFAULT NULL,
  `id_mapping` int(11) DEFAULT NULL,
  `acumulado` int(255) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`id`, `cod_barra`, `marca`, `departamento`, `seccion`, `familia`, `subfamilia`, `temporada`, `ano`, `capsula`, `color`, `talla`, `proveedor`, `cantidad`, `pvptienda`, `peso`, `serie`, `referencia`, `descripcion`, `costodist`, `pvpmgta`, `carac`, `gpeso`, `codmarca`, `coddepto`, `codseccion`, `codfamilia`, `codsubfamilia`, `codtemporada`, `codano`, `codcapsula`, `codcolor`, `codtalla`, `codprov`, `descapsula`, `id_mapping`, `acumulado`) VALUES
(253, '17111030011702', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'TURQUOISE', 'S', 'PHOENIX WORLD TRADE CHINA', '199', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '17', '2', '251', '', 2, 0),
(254, '17111030011703', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'TURQUOISE', 'M', 'PHOENIX WORLD TRADE CHINA', '199', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '17', '3', '251', '', 2, 1),
(255, '17111030011704', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'TURQUOISE', 'L', 'PHOENIX WORLD TRADE CHINA', '198', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '17', '4', '251', '', 2, 0),
(256, '17111030012002', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '205', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '20', '2', '251', '', 2, 0),
(257, '17111030012003', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '194', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '20', '3', '251', '', 2, 0),
(258, '17111030012004', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '198', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '20', '4', '251', '', 2, 0),
(259, '17111030015302', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '200', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '53', '2', '251', '', 2, 0),
(260, '17111030015303', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '201', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '53', '3', '251', '', 2, 0),
(261, '17111030015304', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '178', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '53', '4', '251', '', 2, 0),
(262, '17111030013002', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'S', 'PHOENIX WORLD TRADE CHINA', '200', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '30', '2', '251', '', 2, 0),
(263, '17111030013003', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'M', 'PHOENIX WORLD TRADE CHINA', '242', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '30', '3', '251', '', 2, 0),
(264, '17111030013004', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'L', 'PHOENIX WORLD TRADE CHINA', '200', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '30', '4', '251', '', 2, 0),
(265, '17111030010102', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '214', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '1', '2', '251', '', 2, 0),
(266, '17111030010103', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '224', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '1', '3', '251', '', 2, 0),
(267, '17111030010104', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '222', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '1', '4', '251', '', 2, 0),
(268, '17111030018002', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '220', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '80', '2', '251', '', 2, 0),
(269, '17111030018003', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '220', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '80', '3', '251', '', 2, 0),
(270, '17111030018004', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '221', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '80', '4', '251', '', 2, 0),
(271, '17111023211702', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'TURQUOISE', 'S', 'PHOENIX WORLD TRADE CHINA', '242', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '17', '2', '251', '', 2, 0),
(272, '17111023211703', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'TURQUOISE', 'M', 'PHOENIX WORLD TRADE CHINA', '238', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '17', '3', '251', '', 2, 0),
(273, '17111023211704', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'TURQUOISE', 'L', 'PHOENIX WORLD TRADE CHINA', '236', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '17', '4', '251', '', 2, 0),
(274, '17111023212002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '240', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '20', '2', '251', '', 2, 0),
(275, '17111023212003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '227', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '20', '3', '251', '', 2, 0),
(276, '17111023212004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '234', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '20', '4', '251', '', 2, 0),
(277, '17111023215302', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '239', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '53', '2', '251', '', 2, 0),
(278, '17111023215303', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '238', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '53', '3', '251', '', 2, 0),
(279, '17111023215304', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '247', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '53', '4', '251', '', 2, 0),
(280, '17111023213002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'S', 'PHOENIX WORLD TRADE CHINA', '248', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '30', '2', '251', '', 2, 0),
(281, '17111023213003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'M', 'PHOENIX WORLD TRADE CHINA', '238', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '30', '3', '251', '', 2, 0),
(282, '17111023213004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'L', 'PHOENIX WORLD TRADE CHINA', '238', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '30', '4', '251', '', 2, 0),
(283, '17111023210102', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '258', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '1', '2', '251', '', 2, 0),
(284, '17111023210103', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '269', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '1', '3', '251', '', 2, 0),
(285, '17111023210104', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '248', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '1', '4', '251', '', 2, 0),
(286, '17111023218002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '262', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '80', '2', '251', '', 2, 0),
(287, '17111023218003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '260', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '80', '3', '251', '', 2, 0),
(288, '17111023218004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '264', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '80', '4', '251', '', 2, 0),
(289, '17111030021702', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'TURQUOISE', 'S', 'PHOENIX WORLD TRADE CHINA', '232', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '17', '2', '251', '', 2, 0),
(290, '17111030021703', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'TURQUOISE', 'M', 'PHOENIX WORLD TRADE CHINA', '236', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '17', '3', '251', '', 2, 0),
(291, '17111030021704', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'TURQUOISE', 'L', 'PHOENIX WORLD TRADE CHINA', '224', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '17', '4', '251', '', 2, 0),
(292, '17111030022002', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '244', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '20', '2', '251', '', 2, 0),
(293, '17111030022003', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '240', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '20', '3', '251', '', 2, 0),
(294, '17111030022004', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '247', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '20', '4', '251', '', 2, 0),
(295, '17111030025302', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '232', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '53', '2', '251', '', 2, 0),
(296, '17111030025303', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '231', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '53', '3', '251', '', 2, 0),
(297, '17111030025304', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '232', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '53', '4', '251', '', 2, 0),
(298, '17111030023002', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'S', 'PHOENIX WORLD TRADE CHINA', '232', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '30', '2', '251', '', 2, 0),
(299, '17111030023003', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'M', 'PHOENIX WORLD TRADE CHINA', '229', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '30', '3', '251', '', 2, 0),
(300, '17111030023004', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'L', 'PHOENIX WORLD TRADE CHINA', '232', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '30', '4', '251', '', 2, 0),
(301, '17111030020102', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '254', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '1', '2', '251', '', 2, 0),
(302, '17111030020103', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '247', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '1', '3', '251', '', 2, 0),
(303, '17111030020104', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '256', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '1', '4', '251', '', 2, 0),
(304, '17111030028002', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '253', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '80', '2', '251', '', 2, 0),
(305, '17111030028003', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '257', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '80', '3', '251', '', 2, 0),
(306, '17111030028004', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '255', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '80', '4', '251', '', 2, 0),
(307, '17111023222002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '322', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '146', '32998.9', '1.99', '', 'AU171-1102-322', 'TOP', '19799.34', '32998.9', ' AU171 ', '', 'A', '1', '1', '2', '322', 'U', '17', '1', '20', '2', '251', '', 2, 0),
(308, '17111023222003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '322', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '145', '32998.9', '1.99', '', 'AU171-1102-322', 'TOP', '19799.34', '32998.9', ' AU171 ', '', 'A', '1', '1', '2', '322', 'U', '17', '1', '20', '3', '251', '', 2, 0),
(309, '17111023222004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '322', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '150', '32998.9', '1.99', '', 'AU171-1102-322', 'TOP', '19799.34', '32998.9', ' AU171 ', '', 'A', '1', '1', '2', '322', 'U', '17', '1', '20', '4', '251', '', 2, 0),
(310, '17111021002002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '100', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '147', '37549.9', '2.47', '', 'AU171-1102-100', 'TOP', '22529.94', '37549.9', ' AU171 ', '', 'A', '1', '1', '2', '100', 'U', '17', '1', '20', '2', '251', '', 2, 0),
(311, '17111021002003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '100', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '148', '37549.9', '2.47', '', 'AU171-1102-100', 'TOP', '22529.94', '37549.9', ' AU171 ', '', 'A', '1', '1', '2', '100', 'U', '17', '1', '20', '3', '251', '', 2, 0),
(312, '17111021002004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '100', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '148', '37549.9', '2.47', '', 'AU171-1102-100', 'TOP', '22529.94', '37549.9', ' AU171 ', '', 'A', '1', '1', '2', '100', 'U', '17', '1', '20', '4', '251', '', 2, 0),
(313, '17111021108002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '110', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '81', '76998.9', '5.25', '', 'AU171-1102-110', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '110', 'U', '17', '1', '80', '2', '251', '', 2, 0),
(314, '17111021108003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '110', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '81', '76998.9', '5.25', '', 'AU171-1102-110', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '110', 'U', '17', '1', '80', '3', '251', '', 2, 0),
(315, '17111021108004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '110', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '81', '76998.9', '5.25', '', 'AU171-1102-110', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '110', 'U', '17', '1', '80', '4', '251', '', 2, 0),
(316, '17111021100102', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '110', 'SUMMER', '2017', 'APRIL', 'WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '81', '76998.9', '5.25', '', 'AU171-1102-110', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '110', 'U', '17', '1', '1', '2', '251', '', 2, 0),
(317, '17111021100103', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '110', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '80', '76998.9', '5.25', '', 'AU171-1102-110', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '110', 'U', '17', '1', '1', '3', '251', '', 2, 0),
(318, '17111021100104', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '110', 'SUMMER', '2017', 'APRIL', 'WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '82', '76998.9', '5.25', '', 'AU171-1102-110', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '110', 'U', '17', '1', '1', '4', '251', '', 2, 0),
(319, '17111021105302', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '110', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '81', '76998.9', '5.25', '', 'AU171-1102-110', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '110', 'U', '17', '1', '53', '2', '251', '', 2, 0),
(320, '17111021105303', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '110', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '82', '76998.9', '5.25', '', 'AU171-1102-110', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '110', 'U', '17', '1', '53', '3', '251', '', 2, 0),
(321, '17111021105304', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '110', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '79', '76998.9', '5.25', '', 'AU171-1102-110', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '110', 'U', '17', '1', '53', '4', '251', '', 2, 0),
(322, '17111130138002', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '13', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '59', '79998.9', '5.78', '', 'AU171-1113-013', 'SHORT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '13', '13', 'U', '17', '1', '80', '2', '251', '', 2, 0),
(323, '17111130138003', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '13', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '61', '79998.9', '5.78', '', 'AU171-1113-013', 'SHORT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '13', '13', 'U', '17', '1', '80', '3', '251', '', 2, 0),
(324, '17111130138004', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '13', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '54', '79998.9', '5.78', '', 'AU171-1113-013', 'SHORT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '13', '13', 'U', '17', '1', '80', '4', '251', '', 2, 0),
(325, '17111130136502', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '13', 'SUMMER', '2017', 'APRIL', 'LIME', 'S', 'PHOENIX WORLD TRADE CHINA', '52', '79998.9', '5.78', '', 'AU171-1113-013', 'SHORT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '13', '13', 'U', '17', '1', '65', '2', '251', '', 2, 0),
(326, '17111130136503', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '13', 'SUMMER', '2017', 'APRIL', 'LIME', 'M', 'PHOENIX WORLD TRADE CHINA', '53', '79998.9', '5.78', '', 'AU171-1113-013', 'SHORT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '13', '13', 'U', '17', '1', '65', '3', '251', '', 2, 0),
(327, '17111130136504', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '13', 'SUMMER', '2017', 'APRIL', 'LIME', 'L', 'PHOENIX WORLD TRADE CHINA', '51', '79998.9', '5.78', '', 'AU171-1113-013', 'SHORT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '13', '13', 'U', '17', '1', '65', '4', '251', '', 2, 0),
(328, '17111130135302', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '13', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '51', '79998.9', '5.78', '', 'AU171-1113-013', 'SHORT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '13', '13', 'U', '17', '1', '53', '2', '251', '', 2, 0),
(329, '17111130135303', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '13', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '49', '79998.9', '5.78', '', 'AU171-1113-013', 'SHORT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '13', '13', 'U', '17', '1', '53', '3', '251', '', 2, 0),
(330, '17111130135304', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '13', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '50', '79998.9', '5.78', '', 'AU171-1113-013', 'SHORT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '13', '13', 'U', '17', '1', '53', '4', '251', '', 2, 0),
(331, '17111050038202', 'AISHOP', 'WOMAN', 'TEXTIL', 'SWEATER', '3', 'SUMMER', '2017', 'APRIL', 'GREY', 'S', 'PHOENIX WORLD TRADE CHINA', '92', '84749.9', '5.57', '', 'AU171-1105-003', 'SWEATER', '50849.94', '84749.9', ' AU171 ', '', 'A', '1', '1', '5', '3', 'U', '17', '1', '82', '2', '251', '', 2, 0),
(332, '17111050038203', 'AISHOP', 'WOMAN', 'TEXTIL', 'SWEATER', '3', 'SUMMER', '2017', 'APRIL', 'GREY', 'M', 'PHOENIX WORLD TRADE CHINA', '92', '84749.9', '5.57', '', 'AU171-1105-003', 'SWEATER', '50849.94', '84749.9', ' AU171 ', '', 'A', '1', '1', '5', '3', 'U', '17', '1', '82', '3', '251', '', 2, 0),
(333, '17111050038204', 'AISHOP', 'WOMAN', 'TEXTIL', 'SWEATER', '3', 'SUMMER', '2017', 'APRIL', 'GREY', 'L', 'PHOENIX WORLD TRADE CHINA', '92', '84749.9', '5.57', '', 'AU171-1105-003', 'SWEATER', '50849.94', '84749.9', ' AU171 ', '', 'A', '1', '1', '5', '3', 'U', '17', '1', '82', '4', '251', '', 2, 0),
(334, '17111050034002', 'AISHOP', 'WOMAN', 'TEXTIL', 'SWEATER', '3', 'SUMMER', '2017', 'APRIL', 'RED', 'S', 'PHOENIX WORLD TRADE CHINA', '91', '84749.9', '5.57', '', 'AU171-1105-003', 'SWEATER', '50849.94', '84749.9', ' AU171 ', '', 'A', '1', '1', '5', '3', 'U', '17', '1', '40', '2', '251', '', 2, 0),
(335, '17111050034003', 'AISHOP', 'WOMAN', 'TEXTIL', 'SWEATER', '3', 'SUMMER', '2017', 'APRIL', 'RED', 'M', 'PHOENIX WORLD TRADE CHINA', '92', '84749.9', '5.57', '', 'AU171-1105-003', 'SWEATER', '50849.94', '84749.9', ' AU171 ', '', 'A', '1', '1', '5', '3', 'U', '17', '1', '40', '3', '251', '', 2, 0),
(336, '17111050034004', 'AISHOP', 'WOMAN', 'TEXTIL', 'SWEATER', '3', 'SUMMER', '2017', 'APRIL', 'RED', 'L', 'PHOENIX WORLD TRADE CHINA', '92', '84749.9', '5.57', '', 'AU171-1105-003', 'SWEATER', '50849.94', '84749.9', ' AU171 ', '', 'A', '1', '1', '5', '3', 'U', '17', '1', '40', '4', '251', '', 2, 0),
(337, '17111021170102', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '117', 'SUMMER', '2017', 'APRIL', 'WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '80', '63998.9', '4.31', '', 'AU171-1102-117', 'TOP', '38399.34', '63998.9', ' AU171 ', '', 'A', '1', '1', '2', '117', 'U', '17', '1', '1', '2', '251', '', 2, 0),
(338, '17111021170103', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '117', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '80', '63998.9', '4.31', '', 'AU171-1102-117', 'TOP', '38399.34', '63998.9', ' AU171 ', '', 'A', '1', '1', '2', '117', 'U', '17', '1', '1', '3', '251', '', 2, 0),
(339, '17111021170104', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '117', 'SUMMER', '2017', 'APRIL', 'WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '79', '63998.9', '4.31', '', 'AU171-1102-117', 'TOP', '38399.34', '63998.9', ' AU171 ', '', 'A', '1', '1', '2', '117', 'U', '17', '1', '1', '4', '251', '', 2, 0),
(340, '17111021178002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '117', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '79', '63998.9', '4.31', '', 'AU171-1102-117', 'TOP', '38399.34', '63998.9', ' AU171 ', '', 'A', '1', '1', '2', '117', 'U', '17', '1', '80', '2', '251', '', 2, 0),
(341, '17111021178003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '117', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '79', '63998.9', '4.31', '', 'AU171-1102-117', 'TOP', '38399.34', '63998.9', ' AU171 ', '', 'A', '1', '1', '2', '117', 'U', '17', '1', '80', '3', '251', '', 2, 0),
(342, '17111021178004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '117', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '80', '63998.9', '4.31', '', 'AU171-1102-117', 'TOP', '38399.34', '63998.9', ' AU171 ', '', 'A', '1', '1', '2', '117', 'U', '17', '1', '80', '4', '251', '', 2, 0),
(343, '17111021190102', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '119', 'SUMMER', '2017', 'APRIL', 'WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '89', '69998.9', '4.73', '', 'AU171-1102-119', 'TOP', '41999.34', '69998.9', ' AU171 ', '', 'A', '1', '1', '2', '119', 'U', '17', '1', '1', '2', '251', '', 2, 0),
(344, '17111021190103', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '119', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '89', '69998.9', '4.73', '', 'AU171-1102-119', 'TOP', '41999.34', '69998.9', ' AU171 ', '', 'A', '1', '1', '2', '119', 'U', '17', '1', '1', '3', '251', '', 2, 0),
(345, '17111021190104', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '119', 'SUMMER', '2017', 'APRIL', 'WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '90', '69998.9', '4.73', '', 'AU171-1102-119', 'TOP', '41999.34', '69998.9', ' AU171 ', '', 'A', '1', '1', '2', '119', 'U', '17', '1', '1', '4', '251', '', 2, 0),
(346, '17111021198002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '119', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '72', '69998.9', '4.73', '', 'AU171-1102-119', 'TOP', '41999.34', '69998.9', ' AU171 ', '', 'A', '1', '1', '2', '119', 'U', '17', '1', '80', '2', '251', '', 2, 0),
(347, '17111021198003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '119', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '72', '69998.9', '4.73', '', 'AU171-1102-119', 'TOP', '41999.34', '69998.9', ' AU171 ', '', 'A', '1', '1', '2', '119', 'U', '17', '1', '80', '3', '251', '', 2, 0),
(348, '17111021198004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '119', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '72', '69998.9', '4.73', '', 'AU171-1102-119', 'TOP', '41999.34', '69998.9', ' AU171 ', '', 'A', '1', '1', '2', '119', 'U', '17', '1', '80', '4', '251', '', 2, 0),
(349, '17111021252002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '125', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '85', '54598.9', '3.47', '', 'AU171-1102-125', 'TOP', '32759.34', '54598.9', ' AU171 ', '', 'A', '1', '1', '2', '125', 'U', '17', '1', '20', '2', '251', '', 2, 0),
(350, '17111021252003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '125', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '84', '54598.9', '3.47', '', 'AU171-1102-125', 'TOP', '32759.34', '54598.9', ' AU171 ', '', 'A', '1', '1', '2', '125', 'U', '17', '1', '20', '3', '251', '', 2, 0),
(351, '17111021252004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '125', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '85', '54598.9', '3.47', '', 'AU171-1102-125', 'TOP', '32759.34', '54598.9', ' AU171 ', '', 'A', '1', '1', '2', '125', 'U', '17', '1', '20', '4', '251', '', 2, 0),
(352, '17111021256002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '125', 'SUMMER', '2017', 'APRIL', 'GREEN', 'S', 'PHOENIX WORLD TRADE CHINA', '82', '54598.9', '3.47', '', 'AU171-1102-125', 'TOP', '32759.34', '54598.9', ' AU171 ', '', 'A', '1', '1', '2', '125', 'U', '17', '1', '60', '2', '251', '', 2, 0),
(353, '17111021256003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '125', 'SUMMER', '2017', 'APRIL', 'GREEN', 'M', 'PHOENIX WORLD TRADE CHINA', '82', '54598.9', '3.47', '', 'AU171-1102-125', 'TOP', '32759.34', '54598.9', ' AU171 ', '', 'A', '1', '1', '2', '125', 'U', '17', '1', '60', '3', '251', '', 2, 0),
(354, '17111021256004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '125', 'SUMMER', '2017', 'APRIL', 'GREEN', 'L', 'PHOENIX WORLD TRADE CHINA', '83', '54598.9', '3.47', '', 'AU171-1102-125', 'TOP', '32759.34', '54598.9', ' AU171 ', '', 'A', '1', '1', '2', '125', 'U', '17', '1', '60', '4', '251', '', 2, 0),
(355, '17111021512002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '151', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '74', '54598.9', '3.47', '', 'AU171-1102-151', 'TOP', '32759.34', '54598.9', ' AU171 ', '', 'A', '1', '1', '2', '151', 'U', '17', '1', '20', '2', '251', '', 2, 0),
(356, '17111021512003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '151', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '83', '54598.9', '3.47', '', 'AU171-1102-151', 'TOP', '32759.34', '54598.9', ' AU171 ', '', 'A', '1', '1', '2', '151', 'U', '17', '1', '20', '3', '251', '', 2, 0),
(357, '17111021512004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '151', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '79', '54598.9', '3.47', '', 'AU171-1102-151', 'TOP', '32759.34', '54598.9', ' AU171 ', '', 'A', '1', '1', '2', '151', 'U', '17', '1', '20', '4', '251', '', 2, 0),
(358, '17111021666002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '166', 'SUMMER', '2017', 'APRIL', 'GREEN', 'S', 'PHOENIX WORLD TRADE CHINA', '83', '33998.9', '1.99', '', 'AU171-1102-166', 'TOP', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '2', '166', 'U', '17', '1', '60', '2', '251', '', 2, 0),
(359, '17111021666003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '166', 'SUMMER', '2017', 'APRIL', 'GREEN', 'M', 'PHOENIX WORLD TRADE CHINA', '90', '33998.9', '1.99', '', 'AU171-1102-166', 'TOP', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '2', '166', 'U', '17', '1', '60', '3', '251', '', 2, 0),
(360, '17111021666004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '166', 'SUMMER', '2017', 'APRIL', 'GREEN', 'L', 'PHOENIX WORLD TRADE CHINA', '85', '33998.9', '1.99', '', 'AU171-1102-166', 'TOP', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '2', '166', 'U', '17', '1', '60', '4', '251', '', 2, 0),
(361, '17111021664002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '166', 'SUMMER', '2017', 'APRIL', 'RED', 'S', 'PHOENIX WORLD TRADE CHINA', '89', '33998.9', '1.99', '', 'AU171-1102-166', 'TOP', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '2', '166', 'U', '17', '1', '40', '2', '251', '', 2, 0),
(362, '17111021664003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '166', 'SUMMER', '2017', 'APRIL', 'RED', 'M', 'PHOENIX WORLD TRADE CHINA', '93', '33998.9', '1.99', '', 'AU171-1102-166', 'TOP', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '2', '166', 'U', '17', '1', '40', '3', '251', '', 2, 0),
(363, '17111021664004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '166', 'SUMMER', '2017', 'APRIL', 'RED', 'L', 'PHOENIX WORLD TRADE CHINA', '93', '33998.9', '1.99', '', 'AU171-1102-166', 'TOP', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '2', '166', 'U', '17', '1', '40', '4', '251', '', 2, 0),
(364, '17111021668002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '166', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '86', '33998.9', '1.99', '', 'AU171-1102-166', 'TOP', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '2', '166', 'U', '17', '1', '80', '2', '251', '', 2, 0),
(365, '17111021668003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '166', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '86', '33998.9', '1.99', '', 'AU171-1102-166', 'TOP', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '2', '166', 'U', '17', '1', '80', '3', '251', '', 2, 0),
(366, '17111021668004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '166', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '86', '33998.9', '1.99', '', 'AU171-1102-166', 'TOP', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '2', '166', 'U', '17', '1', '80', '4', '251', '', 2, 0),
(367, '17111060025902', 'AISHOP', 'WOMAN', 'TEXTIL', 'JACKET', '2', 'SUMMER', '2017', 'APRIL', 'GREEN PRINT', 'S', 'PHOENIX WORLD TRADE CHINA', '48', '99998.9', '7.67', '', 'AU171-1106-002', 'JACKET', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '6', '2', 'U', '17', '1', '59', '2', '251', '', 2, 0),
(368, '17111060025903', 'AISHOP', 'WOMAN', 'TEXTIL', 'JACKET', '2', 'SUMMER', '2017', 'APRIL', 'GREEN PRINT', 'M', 'PHOENIX WORLD TRADE CHINA', '51', '99998.9', '7.67', '', 'AU171-1106-002', 'JACKET', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '6', '2', 'U', '17', '1', '59', '3', '251', '', 2, 0),
(369, '17111060025904', 'AISHOP', 'WOMAN', 'TEXTIL', 'JACKET', '2', 'SUMMER', '2017', 'APRIL', 'GREEN PRINT', 'L', 'PHOENIX WORLD TRADE CHINA', '52', '99998.9', '7.67', '', 'AU171-1106-002', 'JACKET', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '6', '2', 'U', '17', '1', '59', '4', '251', '', 2, 0),
(370, '17111060020802', 'AISHOP', 'WOMAN', 'TEXTIL', 'JACKET', '2', 'SUMMER', '2017', 'APRIL', 'BLUE PRINT', 'S', 'PHOENIX WORLD TRADE CHINA', '44', '99998.9', '7.67', '', 'AU171-1106-002', 'JACKET', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '6', '2', 'U', '17', '1', '8', '2', '251', '', 2, 0),
(371, '17111060020803', 'AISHOP', 'WOMAN', 'TEXTIL', 'JACKET', '2', 'SUMMER', '2017', 'APRIL', 'BLUE PRINT', 'M', 'PHOENIX WORLD TRADE CHINA', '46', '99998.9', '7.67', '', 'AU171-1106-002', 'JACKET', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '6', '2', 'U', '17', '1', '8', '3', '251', '', 2, 0),
(372, '17111060020804', 'AISHOP', 'WOMAN', 'TEXTIL', 'JACKET', '2', 'SUMMER', '2017', 'APRIL', 'BLUE PRINT', 'L', 'PHOENIX WORLD TRADE CHINA', '46', '99998.9', '7.67', '', 'AU171-1106-002', 'JACKET', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '6', '2', 'U', '17', '1', '8', '4', '251', '', 2, 0),
(373, '17111020018002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '1', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '165', '44998.9', '2.63', '', 'AU171-1102-001', 'TOP', '26999.34', '44998.9', ' AU171 ', '', 'A', '1', '1', '2', '1', 'U', '17', '1', '80', '2', '251', '', 2, 0),
(374, '17111020018003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '1', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '168', '44998.9', '2.63', '', 'AU171-1102-001', 'TOP', '26999.34', '44998.9', ' AU171 ', '', 'A', '1', '1', '2', '1', 'U', '17', '1', '80', '3', '251', '', 2, 0),
(375, '17111020018004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '1', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '170', '44998.9', '2.63', '', 'AU171-1102-001', 'TOP', '26999.34', '44998.9', ' AU171 ', '', 'A', '1', '1', '2', '1', 'U', '17', '1', '80', '4', '251', '', 2, 0),
(376, '17111020010102', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '1', 'SUMMER', '2017', 'APRIL', 'WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '158', '44998.9', '2.63', '', 'AU171-1102-001', 'TOP', '26999.34', '44998.9', ' AU171 ', '', 'A', '1', '1', '2', '1', 'U', '17', '1', '1', '2', '251', '', 2, 0),
(377, '17111020010103', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '1', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '160', '44998.9', '2.63', '', 'AU171-1102-001', 'TOP', '26999.34', '44998.9', ' AU171 ', '', 'A', '1', '1', '2', '1', 'U', '17', '1', '1', '3', '251', '', 2, 0),
(378, '17111020010104', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '1', 'SUMMER', '2017', 'APRIL', 'WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '160', '44998.9', '2.63', '', 'AU171-1102-001', 'TOP', '26999.34', '44998.9', ' AU171 ', '', 'A', '1', '1', '2', '1', 'U', '17', '1', '1', '4', '251', '', 2, 0),
(379, '17111020010902', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '1', 'SUMMER', '2017', 'APRIL', 'AQUA', 'S', 'PHOENIX WORLD TRADE CHINA', '182', '44998.9', '2.63', '', 'AU171-1102-001', 'TOP', '26999.34', '44998.9', ' AU171 ', '', 'A', '1', '1', '2', '1', 'U', '17', '1', '9', '2', '251', '', 2, 0),
(380, '17111020010903', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '1', 'SUMMER', '2017', 'APRIL', 'AQUA', 'M', 'PHOENIX WORLD TRADE CHINA', '180', '44998.9', '2.63', '', 'AU171-1102-001', 'TOP', '26999.34', '44998.9', ' AU171 ', '', 'A', '1', '1', '2', '1', 'U', '17', '1', '9', '3', '251', '', 2, 0),
(381, '17111020010904', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '1', 'SUMMER', '2017', 'APRIL', 'AQUA', 'L', 'PHOENIX WORLD TRADE CHINA', '170', '44998.9', '2.63', '', 'AU171-1102-001', 'TOP', '26999.34', '44998.9', ' AU171 ', '', 'A', '1', '1', '2', '1', 'U', '17', '1', '9', '4', '251', '', 2, 0),
(382, '17111100018002', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '1', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '116', '44998.9', '2.63', '', 'AU171-1110-001', 'PANT', '26999.34', '44998.9', ' AU171 ', '', 'A', '1', '1', '10', '1', 'U', '17', '1', '80', '2', '251', '', 2, 0),
(383, '17111100018003', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '1', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '116', '44998.9', '2.63', '', 'AU171-1110-001', 'PANT', '26999.34', '44998.9', ' AU171 ', '', 'A', '1', '1', '10', '1', 'U', '17', '1', '80', '3', '251', '', 2, 0),
(384, '17111100018004', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '1', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '116', '44998.9', '2.63', '', 'AU171-1110-001', 'PANT', '26999.34', '44998.9', ' AU171 ', '', 'A', '1', '1', '10', '1', 'U', '17', '1', '80', '4', '251', '', 2, 0),
(385, '17111100132002', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '13', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '135', '76998.9', '4.94', '', 'AU171-1110-013', 'PANT', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '10', '13', 'U', '17', '1', '20', '2', '251', '', 2, 0),
(386, '17111100132003', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '13', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '137', '76998.9', '4.94', '', 'AU171-1110-013', 'PANT', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '10', '13', 'U', '17', '1', '20', '3', '251', '', 2, 0),
(387, '17111100132004', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '13', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '136', '76998.9', '4.94', '', 'AU171-1110-013', 'PANT', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '10', '13', 'U', '17', '1', '20', '4', '251', '', 2, 0),
(388, '17111150098002', 'AISHOP', 'WOMAN', 'TEXTIL', 'SKIRT', '9', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '55', '79998.9', '5.46', '', 'AU171-1115-009', 'SKIRT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '15', '9', 'U', '17', '1', '80', '2', '251', '', 2, 0),
(389, '17111150098003', 'AISHOP', 'WOMAN', 'TEXTIL', 'SKIRT', '9', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '55', '79998.9', '5.46', '', 'AU171-1115-009', 'SKIRT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '15', '9', 'U', '17', '1', '80', '3', '251', '', 2, 0),
(390, '17111150098004', 'AISHOP', 'WOMAN', 'TEXTIL', 'SKIRT', '9', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '55', '79998.9', '5.46', '', 'AU171-1115-009', 'SKIRT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '15', '9', 'U', '17', '1', '80', '4', '251', '', 2, 0),
(391, '17111150092002', 'AISHOP', 'WOMAN', 'TEXTIL', 'SKIRT', '9', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '55', '79998.9', '5.46', '', 'AU171-1115-009', 'SKIRT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '15', '9', 'U', '17', '1', '20', '2', '251', '', 2, 0),
(392, '17111150092003', 'AISHOP', 'WOMAN', 'TEXTIL', 'SKIRT', '9', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '53', '79998.9', '5.46', '', 'AU171-1115-009', 'SKIRT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '15', '9', 'U', '17', '1', '20', '3', '251', '', 2, 0),
(393, '17111150092004', 'AISHOP', 'WOMAN', 'TEXTIL', 'SKIRT', '9', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '55', '79998.9', '5.46', '', 'AU171-1115-009', 'SKIRT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '15', '9', 'U', '17', '1', '20', '4', '251', '', 2, 0),
(394, '17111150101602', 'AISHOP', 'WOMAN', 'TEXTIL', 'SKIRT', '10', 'SUMMER', '2017', 'APRIL', 'NAVY', 'S', 'PHOENIX WORLD TRADE CHINA', '55', '84998.9', '5.78', '', 'AU171-1115-010', 'SKIRT', '50999.34', '84998.9', ' AU171 ', '', 'A', '1', '1', '15', '10', 'U', '17', '1', '16', '2', '251', '', 2, 0),
(395, '17111150101603', 'AISHOP', 'WOMAN', 'TEXTIL', 'SKIRT', '10', 'SUMMER', '2017', 'APRIL', 'NAVY', 'M', 'PHOENIX WORLD TRADE CHINA', '55', '84998.9', '5.78', '', 'AU171-1115-010', 'SKIRT', '50999.34', '84998.9', ' AU171 ', '', 'A', '1', '1', '15', '10', 'U', '17', '1', '16', '3', '251', '', 2, 0),
(396, '17111150101604', 'AISHOP', 'WOMAN', 'TEXTIL', 'SKIRT', '10', 'SUMMER', '2017', 'APRIL', 'NAVY', 'L', 'PHOENIX WORLD TRADE CHINA', '55', '84998.9', '5.78', '', 'AU171-1115-010', 'SKIRT', '50999.34', '84998.9', ' AU171 ', '', 'A', '1', '1', '15', '10', 'U', '17', '1', '16', '4', '251', '', 2, 0),
(397, '17111020395302', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '85', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '53', '2', '251', '', 2, 0),
(398, '17111020395303', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '99', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '53', '3', '251', '', 2, 0),
(399, '17111020395304', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '87', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '53', '4', '251', '', 2, 0),
(400, '17111020392002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '91', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '20', '2', '251', '', 2, 0),
(401, '17111020392003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '89', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '20', '3', '251', '', 2, 0),
(402, '17111020392004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '91', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '20', '4', '251', '', 2, 0),
(403, '17111020393002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'S', 'PHOENIX WORLD TRADE CHINA', '85', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '30', '2', '251', '', 2, 0),
(404, '17111020393003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'M', 'PHOENIX WORLD TRADE CHINA', '85', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '30', '3', '251', '', 2, 0),
(405, '17111020393004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'L', 'PHOENIX WORLD TRADE CHINA', '87', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '30', '4', '251', '', 2, 0),
(406, '17111020398002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '105', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '80', '2', '251', '', 2, 0),
(407, '17111020398003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '104', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '80', '3', '251', '', 2, 0),
(408, '17111020398004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '105', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '80', '4', '251', '', 2, 0),
(409, '17111020391002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'BLUE', 'S', 'PHOENIX WORLD TRADE CHINA', '89', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '10', '2', '251', '', 2, 0),
(410, '17111020391003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'BLUE', 'M', 'PHOENIX WORLD TRADE CHINA', '90', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '10', '3', '251', '', 2, 0),
(411, '17111020391004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'BLUE', 'L', 'PHOENIX WORLD TRADE CHINA', '92', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '10', '4', '251', '', 2, 0),
(412, '17111020815302', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '81', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '85', '69998.9', '4.73', '', 'AU171-1102-081', 'TOP', '41999.34', '69998.9', ' AU171 ', '', 'A', '1', '1', '2', '81', 'U', '17', '1', '53', '2', '251', '', 2, 0),
(413, '17111020815303', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '81', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '86', '69998.9', '4.73', '', 'AU171-1102-081', 'TOP', '41999.34', '69998.9', ' AU171 ', '', 'A', '1', '1', '2', '81', 'U', '17', '1', '53', '3', '251', '', 2, 0),
(414, '17111020815304', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '81', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '85', '69998.9', '4.73', '', 'AU171-1102-081', 'TOP', '41999.34', '69998.9', ' AU171 ', '', 'A', '1', '1', '2', '81', 'U', '17', '1', '53', '4', '251', '', 2, 0),
(415, '17111020811002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '81', 'SUMMER', '2017', 'APRIL', 'BLUE', 'S', 'PHOENIX WORLD TRADE CHINA', '88', '69998.9', '4.73', '', 'AU171-1102-081', 'TOP', '41999.34', '69998.9', ' AU171 ', '', 'A', '1', '1', '2', '81', 'U', '17', '1', '10', '2', '251', '', 2, 0),
(416, '17111020811003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '81', 'SUMMER', '2017', 'APRIL', 'BLUE', 'M', 'PHOENIX WORLD TRADE CHINA', '87', '69998.9', '4.73', '', 'AU171-1102-081', 'TOP', '41999.34', '69998.9', ' AU171 ', '', 'A', '1', '1', '2', '81', 'U', '17', '1', '10', '3', '251', '', 2, 0);
INSERT INTO `product` (`id`, `cod_barra`, `marca`, `departamento`, `seccion`, `familia`, `subfamilia`, `temporada`, `ano`, `capsula`, `color`, `talla`, `proveedor`, `cantidad`, `pvptienda`, `peso`, `serie`, `referencia`, `descripcion`, `costodist`, `pvpmgta`, `carac`, `gpeso`, `codmarca`, `coddepto`, `codseccion`, `codfamilia`, `codsubfamilia`, `codtemporada`, `codano`, `codcapsula`, `codcolor`, `codtalla`, `codprov`, `descapsula`, `id_mapping`, `acumulado`) VALUES
(417, '17111020811004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '81', 'SUMMER', '2017', 'APRIL', 'BLUE', 'L', 'PHOENIX WORLD TRADE CHINA', '89', '69998.9', '4.73', '', 'AU171-1102-081', 'TOP', '41999.34', '69998.9', ' AU171 ', '', 'A', '1', '1', '2', '81', 'U', '17', '1', '10', '4', '251', '', 2, 0),
(418, '17111020970202', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '97', 'SUMMER', '2017', 'APRIL', 'OFF WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '95', '54549.9', '3.47', '', 'AU171-1102-097', 'TOP', '32729.94', '54549.9', ' AU171 ', '', 'A', '1', '1', '2', '97', 'U', '17', '1', '2', '2', '251', '', 2, 0),
(419, '17111020970203', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '97', 'SUMMER', '2017', 'APRIL', 'OFF WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '98', '54549.9', '3.47', '', 'AU171-1102-097', 'TOP', '32729.94', '54549.9', ' AU171 ', '', 'A', '1', '1', '2', '97', 'U', '17', '1', '2', '3', '251', '', 2, 0),
(420, '17111020970204', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '97', 'SUMMER', '2017', 'APRIL', 'OFF WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '96', '54549.9', '3.47', '', 'AU171-1102-097', 'TOP', '32729.94', '54549.9', ' AU171 ', '', 'A', '1', '1', '2', '97', 'U', '17', '1', '2', '4', '251', '', 2, 0),
(421, '17111020978002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '97', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '88', '54549.9', '3.47', '', 'AU171-1102-097', 'TOP', '32729.94', '54549.9', ' AU171 ', '', 'A', '1', '1', '2', '97', 'U', '17', '1', '80', '2', '251', '', 2, 0),
(422, '17111020978003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '97', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '79', '54549.9', '3.47', '', 'AU171-1102-097', 'TOP', '32729.94', '54549.9', ' AU171 ', '', 'A', '1', '1', '2', '97', 'U', '17', '1', '80', '3', '251', '', 2, 0),
(423, '17111020978004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '97', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '88', '54549.9', '3.47', '', 'AU171-1102-097', 'TOP', '32729.94', '54549.9', ' AU171 ', '', 'A', '1', '1', '2', '97', 'U', '17', '1', '80', '4', '251', '', 2, 0),
(424, '17111130061002', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '6', 'SUMMER', '2017', 'APRIL', 'BLUE', 'S', 'PHOENIX WORLD TRADE CHINA', '54', '86998.9', '6.3', '', 'AU171-1113-006', 'SHORT', '52199.34', '86998.9', ' AU171 ', '', 'A', '1', '1', '13', '6', 'U', '17', '1', '10', '2', '251', '', 2, 0),
(425, '17111130061003', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '6', 'SUMMER', '2017', 'APRIL', 'BLUE', 'M', 'PHOENIX WORLD TRADE CHINA', '54', '86998.9', '6.3', '', 'AU171-1113-006', 'SHORT', '52199.34', '86998.9', ' AU171 ', '', 'A', '1', '1', '13', '6', 'U', '17', '1', '10', '3', '251', '', 2, 0),
(426, '17111130061004', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '6', 'SUMMER', '2017', 'APRIL', 'BLUE', 'L', 'PHOENIX WORLD TRADE CHINA', '53', '86998.9', '6.3', '', 'AU171-1113-006', 'SHORT', '52199.34', '86998.9', ' AU171 ', '', 'A', '1', '1', '13', '6', 'U', '17', '1', '10', '4', '251', '', 2, 0),
(427, '17111130061202', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '6', 'SUMMER', '2017', 'APRIL', 'LIGHT BLUE', 'S', 'PHOENIX WORLD TRADE CHINA', '53', '86998.9', '6.3', '', 'AU171-1113-006', 'SHORT', '52199.34', '86998.9', ' AU171 ', '', 'A', '1', '1', '13', '6', 'U', '17', '1', '12', '2', '251', '', 2, 0),
(428, '17111130061203', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '6', 'SUMMER', '2017', 'APRIL', 'LIGHT BLUE', 'M', 'PHOENIX WORLD TRADE CHINA', '54', '86998.9', '6.3', '', 'AU171-1113-006', 'SHORT', '52199.34', '86998.9', ' AU171 ', '', 'A', '1', '1', '13', '6', 'U', '17', '1', '12', '3', '251', '', 2, 0),
(429, '17111130061204', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '6', 'SUMMER', '2017', 'APRIL', 'LIGHT BLUE', 'L', 'PHOENIX WORLD TRADE CHINA', '54', '86998.9', '6.3', '', 'AU171-1113-006', 'SHORT', '52199.34', '86998.9', ' AU171 ', '', 'A', '1', '1', '13', '6', 'U', '17', '1', '12', '4', '251', '', 2, 0),
(430, '17111020845302', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '84', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '77', '68998.9', '4.73', '', 'AU171-1102-084', 'TOP', '41399.34', '68998.9', ' AU171 ', '', 'A', '1', '1', '2', '84', 'U', '17', '1', '53', '2', '251', '', 2, 0),
(431, '17111020845303', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '84', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '72', '68998.9', '4.73', '', 'AU171-1102-084', 'TOP', '41399.34', '68998.9', ' AU171 ', '', 'A', '1', '1', '2', '84', 'U', '17', '1', '53', '3', '251', '', 2, 0),
(432, '17111020845304', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '84', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '78', '68998.9', '4.73', '', 'AU171-1102-084', 'TOP', '41399.34', '68998.9', ' AU171 ', '', 'A', '1', '1', '2', '84', 'U', '17', '1', '53', '4', '251', '', 2, 0),
(433, '17111020840102', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '84', 'SUMMER', '2017', 'APRIL', 'WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '93', '68998.9', '4.73', '', 'AU171-1102-084', 'TOP', '41399.34', '68998.9', ' AU171 ', '', 'A', '1', '1', '2', '84', 'U', '17', '1', '1', '2', '251', '', 2, 0),
(434, '17111020840103', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '84', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '87', '68998.9', '4.73', '', 'AU171-1102-084', 'TOP', '41399.34', '68998.9', ' AU171 ', '', 'A', '1', '1', '2', '84', 'U', '17', '1', '1', '3', '251', '', 2, 0),
(435, '17111020840104', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '84', 'SUMMER', '2017', 'APRIL', 'WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '99', '68998.9', '4.73', '', 'AU171-1102-084', 'TOP', '41399.34', '68998.9', ' AU171 ', '', 'A', '1', '1', '2', '84', 'U', '17', '1', '1', '4', '251', '', 2, 0),
(436, '17111020848002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '84', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '94', '68998.9', '4.73', '', 'AU171-1102-084', 'TOP', '41399.34', '68998.9', ' AU171 ', '', 'A', '1', '1', '2', '84', 'U', '17', '1', '80', '2', '251', '', 2, 0),
(437, '17111020848003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '84', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '98', '68998.9', '4.73', '', 'AU171-1102-084', 'TOP', '41399.34', '68998.9', ' AU171 ', '', 'A', '1', '1', '2', '84', 'U', '17', '1', '80', '3', '251', '', 2, 0),
(438, '17111020848004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '84', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '98', '68998.9', '4.73', '', 'AU171-1102-084', 'TOP', '41399.34', '68998.9', ' AU171 ', '', 'A', '1', '1', '2', '84', 'U', '17', '1', '80', '4', '251', '', 2, 0),
(439, '17111020842002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '84', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '83', '68998.9', '4.73', '', 'AU171-1102-084', 'TOP', '41399.34', '68998.9', ' AU171 ', '', 'A', '1', '1', '2', '84', 'U', '17', '1', '20', '2', '251', '', 2, 0),
(440, '17111020842003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '84', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '83', '68998.9', '4.73', '', 'AU171-1102-084', 'TOP', '41399.34', '68998.9', ' AU171 ', '', 'A', '1', '1', '2', '84', 'U', '17', '1', '20', '3', '251', '', 2, 0),
(441, '17111020842004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '84', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '85', '68998.9', '4.73', '', 'AU171-1102-084', 'TOP', '41399.34', '68998.9', ' AU171 ', '', 'A', '1', '1', '2', '84', 'U', '17', '1', '20', '4', '251', '', 2, 0),
(442, '17111020535302', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '53', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '91', '59998.9', '4.2', '', 'AU171-1102-053', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '53', 'U', '17', '1', '53', '2', '251', '', 2, 0),
(443, '17111020535303', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '53', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '95', '59998.9', '4.2', '', 'AU171-1102-053', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '53', 'U', '17', '1', '53', '3', '251', '', 2, 0),
(444, '17111020535304', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '53', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '92', '59998.9', '4.2', '', 'AU171-1102-053', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '53', 'U', '17', '1', '53', '4', '251', '', 2, 0),
(445, '17111020532002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '53', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '92', '59998.9', '4.2', '', 'AU171-1102-053', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '53', 'U', '17', '1', '20', '2', '251', '', 2, 0),
(446, '17111020532003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '53', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '92', '59998.9', '4.2', '', 'AU171-1102-053', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '53', 'U', '17', '1', '20', '3', '251', '', 2, 0),
(447, '17111020532004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '53', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '92', '59998.9', '4.2', '', 'AU171-1102-053', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '53', 'U', '17', '1', '20', '4', '251', '', 2, 0),
(448, '17111020545302', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '54', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '92', '76998.9', '5.25', '', 'AU171-1102-054', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '54', 'U', '17', '1', '53', '2', '251', '', 2, 0),
(449, '17111020545303', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '54', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '93', '76998.9', '5.25', '', 'AU171-1102-054', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '54', 'U', '17', '1', '53', '3', '251', '', 2, 0),
(450, '17111020545304', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '54', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '93', '76998.9', '5.25', '', 'AU171-1102-054', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '54', 'U', '17', '1', '53', '4', '251', '', 2, 0),
(451, '17111020540102', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '54', 'SUMMER', '2017', 'APRIL', 'WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '91', '76998.9', '5.25', '', 'AU171-1102-054', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '54', 'U', '17', '1', '1', '2', '251', '', 2, 0),
(452, '17111020540103', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '54', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '90', '76998.9', '5.25', '', 'AU171-1102-054', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '54', 'U', '17', '1', '1', '3', '251', '', 2, 0),
(453, '17111020540104', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '54', 'SUMMER', '2017', 'APRIL', 'WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '92', '76998.9', '5.25', '', 'AU171-1102-054', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '54', 'U', '17', '1', '1', '4', '251', '', 2, 0),
(454, '17111020372002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '37', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '81', '65879.9', '4.2', '', 'AU171-1102-037', 'TOP', '39527.94', '65879.9', ' AU171 ', '', 'A', '1', '1', '2', '37', 'U', '17', '1', '20', '2', '251', '', 2, 0),
(455, '17111020372003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '37', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '74', '65879.9', '4.2', '', 'AU171-1102-037', 'TOP', '39527.94', '65879.9', ' AU171 ', '', 'A', '1', '1', '2', '37', 'U', '17', '1', '20', '3', '251', '', 2, 0),
(456, '17111020372004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '37', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '77', '65879.9', '4.2', '', 'AU171-1102-037', 'TOP', '39527.94', '65879.9', ' AU171 ', '', 'A', '1', '1', '2', '37', 'U', '17', '1', '20', '4', '251', '', 2, 0),
(457, '17111020375302', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '37', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '90', '65879.9', '4.2', '', 'AU171-1102-037', 'TOP', '39527.94', '65879.9', ' AU171 ', '', 'A', '1', '1', '2', '37', 'U', '17', '1', '53', '2', '251', '', 2, 0),
(458, '17111020375303', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '37', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '91', '65879.9', '4.2', '', 'AU171-1102-037', 'TOP', '39527.94', '65879.9', ' AU171 ', '', 'A', '1', '1', '2', '37', 'U', '17', '1', '53', '3', '251', '', 2, 0),
(459, '17111020375304', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '37', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '91', '65879.9', '4.2', '', 'AU171-1102-037', 'TOP', '39527.94', '65879.9', ' AU171 ', '', 'A', '1', '1', '2', '37', 'U', '17', '1', '53', '4', '251', '', 2, 0),
(460, '17111020380202', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '38', 'SUMMER', '2017', 'APRIL', 'OFF WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '73', '69549.9', '4.73', '', 'AU171-1102-038', 'TOP', '41729.94', '69549.9', ' AU171 ', '', 'A', '1', '1', '2', '38', 'U', '17', '1', '2', '2', '251', '', 2, 0),
(461, '17111020380203', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '38', 'SUMMER', '2017', 'APRIL', 'OFF WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '76', '69549.9', '4.73', '', 'AU171-1102-038', 'TOP', '41729.94', '69549.9', ' AU171 ', '', 'A', '1', '1', '2', '38', 'U', '17', '1', '2', '3', '251', '', 2, 0),
(462, '17111020380204', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '38', 'SUMMER', '2017', 'APRIL', 'OFF WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '73', '69549.9', '4.73', '', 'AU171-1102-038', 'TOP', '41729.94', '69549.9', ' AU171 ', '', 'A', '1', '1', '2', '38', 'U', '17', '1', '2', '4', '251', '', 2, 0),
(463, '17111100118002', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '11', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '97', '99998.9', '7.35', '', 'AU171-1110-011', 'PANT', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '10', '11', 'U', '17', '1', '80', '2', '251', '', 2, 0),
(464, '17111100118003', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '11', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '100', '99998.9', '7.35', '', 'AU171-1110-011', 'PANT', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '10', '11', 'U', '17', '1', '80', '3', '251', '', 2, 0),
(465, '17111100118004', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '11', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '100', '99998.9', '7.35', '', 'AU171-1110-011', 'PANT', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '10', '11', 'U', '17', '1', '80', '4', '251', '', 2, 0),
(466, '17111100115302', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '11', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '98', '99998.9', '7.35', '', 'AU171-1110-011', 'PANT', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '10', '11', 'U', '17', '1', '53', '2', '251', '', 2, 0),
(467, '17111100115303', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '11', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '100', '99998.9', '7.35', '', 'AU171-1110-011', 'PANT', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '10', '11', 'U', '17', '1', '53', '3', '251', '', 2, 0),
(468, '17111100115304', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '11', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '100', '99998.9', '7.35', '', 'AU171-1110-011', 'PANT', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '10', '11', 'U', '17', '1', '53', '4', '251', '', 2, 0),
(469, '17111100110202', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '11', 'SUMMER', '2017', 'APRIL', 'OFF WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '101', '99998.9', '7.35', '', 'AU171-1110-011', 'PANT', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '10', '11', 'U', '17', '1', '2', '2', '251', '', 2, 0),
(470, '17111100110203', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '11', 'SUMMER', '2017', 'APRIL', 'OFF WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '101', '99998.9', '7.35', '', 'AU171-1110-011', 'PANT', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '10', '11', 'U', '17', '1', '2', '3', '251', '', 2, 0),
(471, '17111100110204', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '11', 'SUMMER', '2017', 'APRIL', 'OFF WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '104', '99998.9', '7.35', '', 'AU171-1110-011', 'PANT', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '10', '11', 'U', '17', '1', '2', '4', '251', '', 2, 0),
(472, '17111100120102', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '12', 'SUMMER', '2017', 'APRIL', 'WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '98', '89998.9', '6.3', '', 'AU171-1110-012', 'PANT', '53999.34', '89998.9', ' AU171 ', '', 'A', '1', '1', '10', '12', 'U', '17', '1', '1', '2', '251', '', 2, 0),
(473, '17111100120103', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '12', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '100', '89998.9', '6.3', '', 'AU171-1110-012', 'PANT', '53999.34', '89998.9', ' AU171 ', '', 'A', '1', '1', '10', '12', 'U', '17', '1', '1', '3', '251', '', 2, 0),
(474, '17111100120104', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '12', 'SUMMER', '2017', 'APRIL', 'WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '100', '89998.9', '6.3', '', 'AU171-1110-012', 'PANT', '53999.34', '89998.9', ' AU171 ', '', 'A', '1', '1', '10', '12', 'U', '17', '1', '1', '4', '251', '', 2, 0),
(475, '17111100128002', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '12', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '95', '89998.9', '6.3', '', 'AU171-1110-012', 'PANT', '53999.34', '89998.9', ' AU171 ', '', 'A', '1', '1', '10', '12', 'U', '17', '1', '80', '2', '251', '', 2, 0),
(476, '17111100128003', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '12', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '98', '89998.9', '6.3', '', 'AU171-1110-012', 'PANT', '53999.34', '89998.9', ' AU171 ', '', 'A', '1', '1', '10', '12', 'U', '17', '1', '80', '3', '251', '', 2, 0),
(477, '17111100128004', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '12', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '98', '89998.9', '6.3', '', 'AU171-1110-012', 'PANT', '53999.34', '89998.9', ' AU171 ', '', 'A', '1', '1', '10', '12', 'U', '17', '1', '80', '4', '251', '', 2, 0),
(478, '17111170075302', 'AISHOP', 'WOMAN', 'TEXTIL', 'DRESS', '7', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '48', '99998.9', '7.35', '', 'AU171-1117-007', 'DRESS', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '17', '7', 'U', '17', '1', '53', '2', '251', '', 2, 0),
(479, '17111170075303', 'AISHOP', 'WOMAN', 'TEXTIL', 'DRESS', '7', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '48', '99998.9', '7.35', '', 'AU171-1117-007', 'DRESS', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '17', '7', 'U', '17', '1', '53', '3', '251', '', 2, 0),
(480, '17111170075304', 'AISHOP', 'WOMAN', 'TEXTIL', 'DRESS', '7', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '48', '99998.9', '7.35', '', 'AU171-1117-007', 'DRESS', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '17', '7', 'U', '17', '1', '53', '4', '251', '', 2, 0),
(481, '17111170078002', 'AISHOP', 'WOMAN', 'TEXTIL', 'DRESS', '7', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '47', '99998.9', '7.35', '', 'AU171-1117-007', 'DRESS', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '17', '7', 'U', '17', '1', '80', '2', '251', '', 2, 0),
(482, '17111170078003', 'AISHOP', 'WOMAN', 'TEXTIL', 'DRESS', '7', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '48', '99998.9', '7.35', '', 'AU171-1117-007', 'DRESS', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '17', '7', 'U', '17', '1', '80', '3', '251', '', 2, 0),
(483, '17111170078004', 'AISHOP', 'WOMAN', 'TEXTIL', 'DRESS', '7', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '49', '99998.9', '7.35', '', 'AU171-1117-007', 'DRESS', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '17', '7', 'U', '17', '1', '80', '4', '251', '', 2, 0),
(484, '17111020325302', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '32', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '89', '59998.9', '3.89', '', 'AU171-1102-032', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '32', 'U', '17', '1', '53', '2', '251', '', 2, 0),
(485, '17111020325303', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '32', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '91', '59998.9', '3.89', '', 'AU171-1102-032', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '32', 'U', '17', '1', '53', '3', '251', '', 2, 0),
(486, '17111020325304', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '32', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '91', '59998.9', '3.89', '', 'AU171-1102-032', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '32', 'U', '17', '1', '53', '4', '251', '', 2, 0),
(487, '17111020328202', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '32', 'SUMMER', '2017', 'APRIL', 'GREY', 'S', 'PHOENIX WORLD TRADE CHINA', '88', '59998.9', '3.89', '', 'AU171-1102-032', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '32', 'U', '17', '1', '82', '2', '251', '', 2, 0),
(488, '17111020328203', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '32', 'SUMMER', '2017', 'APRIL', 'GREY', 'M', 'PHOENIX WORLD TRADE CHINA', '89', '59998.9', '3.89', '', 'AU171-1102-032', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '32', 'U', '17', '1', '82', '3', '251', '', 2, 0),
(489, '17111020328204', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '32', 'SUMMER', '2017', 'APRIL', 'GREY', 'L', 'PHOENIX WORLD TRADE CHINA', '90', '59998.9', '3.89', '', 'AU171-1102-032', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '32', 'U', '17', '1', '82', '4', '251', '', 2, 0),
(490, '17111020085302', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '8', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '81', '35998.9', '2.1', '', 'AU171-1102-008', 'TOP', '21599.34', '35998.9', ' AU171 ', '', 'A', '1', '1', '2', '8', 'U', '17', '1', '53', '2', '251', '', 2, 0),
(491, '17111020085303', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '8', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '81', '35998.9', '2.1', '', 'AU171-1102-008', 'TOP', '21599.34', '35998.9', ' AU171 ', '', 'A', '1', '1', '2', '8', 'U', '17', '1', '53', '3', '251', '', 2, 0),
(492, '17111020085304', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '8', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '81', '35998.9', '2.1', '', 'AU171-1102-008', 'TOP', '21599.34', '35998.9', ' AU171 ', '', 'A', '1', '1', '2', '8', 'U', '17', '1', '53', '4', '251', '', 2, 0),
(493, '17111020082002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '8', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '88', '35998.9', '2.1', '', 'AU171-1102-008', 'TOP', '21599.34', '35998.9', ' AU171 ', '', 'A', '1', '1', '2', '8', 'U', '17', '1', '20', '2', '251', '', 2, 0),
(494, '17111020082003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '8', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '88', '35998.9', '2.1', '', 'AU171-1102-008', 'TOP', '21599.34', '35998.9', ' AU171 ', '', 'A', '1', '1', '2', '8', 'U', '17', '1', '20', '3', '251', '', 2, 0),
(495, '17111020082004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '8', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '90', '35998.9', '2.1', '', 'AU171-1102-008', 'TOP', '21599.34', '35998.9', ' AU171 ', '', 'A', '1', '1', '2', '8', 'U', '17', '1', '20', '4', '251', '', 2, 0),
(496, '17111020080202', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '8', 'SUMMER', '2017', 'APRIL', 'OFF WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '80', '35998.9', '2.1', '', 'AU171-1102-008', 'TOP', '21599.34', '35998.9', ' AU171 ', '', 'A', '1', '1', '2', '8', 'U', '17', '1', '2', '2', '251', '', 2, 0),
(497, '17111020080203', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '8', 'SUMMER', '2017', 'APRIL', 'OFF WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '74', '35998.9', '2.1', '', 'AU171-1102-008', 'TOP', '21599.34', '35998.9', ' AU171 ', '', 'A', '1', '1', '2', '8', 'U', '17', '1', '2', '3', '251', '', 2, 0),
(498, '17111020080204', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '8', 'SUMMER', '2017', 'APRIL', 'OFF WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '90', '35998.9', '2.1', '', 'AU171-1102-008', 'TOP', '21599.34', '35998.9', ' AU171 ', '', 'A', '1', '1', '2', '8', 'U', '17', '1', '2', '4', '251', '', 2, 0),
(499, '17111020093002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'S', 'PHOENIX WORLD TRADE CHINA', '116', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '30', '2', '251', '', 2, 0),
(500, '17111020093003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'M', 'PHOENIX WORLD TRADE CHINA', '124', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '30', '3', '251', '', 2, 0),
(501, '17111020093004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'L', 'PHOENIX WORLD TRADE CHINA', '118', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '30', '4', '251', '', 2, 0),
(502, '17111020095302', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '111', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '53', '2', '251', '', 2, 0),
(503, '17111020095303', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '110', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '53', '3', '251', '', 2, 0),
(504, '17111020095304', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '113', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '53', '4', '251', '', 2, 0),
(505, '17111020098002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '140', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '80', '2', '251', '', 2, 0),
(506, '17111020098003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '139', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '80', '3', '251', '', 2, 0),
(507, '17111020098004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '147', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '80', '4', '251', '', 2, 0),
(508, '17111020090102', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '144', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '1', '2', '251', '', 2, 0),
(509, '17111020090103', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '155', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '1', '3', '251', '', 2, 0),
(510, '17111020090104', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '142', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '1', '4', '251', '', 2, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_prev`
--

CREATE TABLE `product_prev` (
  `id` int(11) NOT NULL,
  `cod_barra` text,
  `marca` text,
  `departamento` text,
  `seccion` text,
  `familia` text,
  `subfamilia` varchar(255) DEFAULT NULL,
  `temporada` text,
  `ano` text,
  `capsula` text,
  `color` text,
  `talla` varchar(255) DEFAULT NULL,
  `proveedor` varchar(255) DEFAULT NULL,
  `cantidad` text,
  `pvptienda` text,
  `peso` text,
  `serie` text,
  `referencia` text,
  `descripcion` text,
  `costodist` text,
  `pvpmgta` text,
  `carac` varchar(255) DEFAULT NULL,
  `gpeso` text,
  `codmarca` varchar(255) DEFAULT NULL,
  `coddepto` text,
  `codseccion` text,
  `codfamilia` text,
  `codsubfamilia` text,
  `codtemporada` varchar(255) DEFAULT NULL,
  `codano` text,
  `codcapsula` text,
  `codcolor` text,
  `codtalla` text,
  `codprov` text,
  `descapsula` varchar(255) DEFAULT NULL,
  `id_mapping` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id` int(11) NOT NULL,
  `idmarca` int(11) DEFAULT NULL,
  `nombre` text NOT NULL,
  `codproveedor` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id`, `idmarca`, `nombre`, `codproveedor`) VALUES
(1, 1, 'GRUPO DUMIT ALMACEN PRINCIPAL', '1'),
(2, 1, 'SHEET1', '4'),
(3, 1, 'MONACO', '5'),
(4, 1, 'PLUFT DISE—OS S.Y.R.C.A', '6'),
(5, 1, 'TELAS ORENSE, C.A.', '7'),
(6, 1, 'Inversiones Noa Caracas, C.A.', '8'),
(7, 1, 'Manufacturas Escolches, C.A.', '9'),
(8, 1, 'INVERSIONES 20771,CA.', '10'),
(9, 1, 'CONSTRUCTORA SAMBIL , C.A.', '12'),
(10, 1, 'ASESORIA Y ADMINISTRACION INTEGRAL A.R.P.C., C.A.', '13'),
(11, 1, 'PLASTICOS FLEXI C.A.', '14'),
(12, 1, 'CORPORACION IMPACTO VISUAL', '15'),
(13, 1, 'FLETEROS LA LUZ C.A', '16'),
(14, 1, 'Servicios', '17'),
(15, 1, 'PERFECT IMAGE LLC', '18'),
(16, 1, 'DESARROLLOS EXTRADOS, C.A.', '19'),
(17, 1, 'CONSULTORES EN COMUNICACIONES CARONI, C.A.', '20'),
(18, 1, 'INMUEBLES CCB1, C.A.', '21'),
(19, 1, 'INVERSIONES NOA TOLON C.A', '22'),
(20, 1, 'OPERADORA CENTRO COMERCIAL TOLON, C.A.', '23'),
(21, 1, 'MAQUINFOIL SUPPLY, C.A.', '24'),
(22, 1, 'ADVANCED POS TECHNOLOGY', '25'),
(23, 1, 'SPAZIO MOBILI, C.A.', '26'),
(24, 1, 'MUAA', '27'),
(25, 1, 'SASHA', '28'),
(26, 1, 'LYDIA APPAREL', '29'),
(27, 1, 'MOA', '30'),
(28, 1, 'SIN FACTURA', '31'),
(29, 1, 'COLOR STORY', '32'),
(30, 1, 'SANTOORI INC.', '33'),
(31, 1, 'Inversiones Yudo 2000, C.A.', '34'),
(32, 1, 'Manofacturas 2005 XL, C.A', '35'),
(33, 1, 'JANICE', '36'),
(34, 1, 'TAMA', '37'),
(35, 1, 'CL BY CELLO', '38'),
(36, 1, 'JUST ME', '39'),
(37, 1, 'KRAFTY', '40'),
(38, 1, 'Importadora Orimar, C.A', '41'),
(39, 1, 'Inversiones Clarisa,C.A', '42'),
(40, 1, 'Manufacturas Urimare, C.A.', '43'),
(41, 1, '(Dev) Inversiones Monofacturas Perdomo, c. a.', '50'),
(42, 1, '(Dev) Inversiones Yudo 2000, C.A. ', '51'),
(43, 1, '(Dev) Manofacturas 2005 XL, C.A', '52'),
(44, 1, '(Dev) Importadora Orimar ', '53'),
(45, 1, '(Dev) Inversiones Clarisa,C.A', '54'),
(46, 1, '(Dev) Manufacturas Urimare, C.A', '55'),
(47, 1, 'SISVEN SEGURIDAD', '127'),
(48, 1, 'PAT PRIMO VENEZUELA,C.A.', '301'),
(49, 1, 'INVERSIONES VENEBLUE C.A.', '307'),
(50, 1, 'INVERSIONES TANURIN C.A', '308'),
(51, 1, 'BANCO MERCANTIL', '309'),
(52, 1, 'ASESORIA Y ADMINISTRACION INTEGRAL A.R.I.E., .C.A', '310'),
(53, 1, 'ADMINISTRADORA SERDECO, C.A.', '311'),
(54, 1, 'C.A.N.T.V.', '312'),
(55, 1, 'PC CHIPS COMPUTERS SYSTEMS, C.A.', '313'),
(56, 1, 'FERRETERIA EPA, C.A.', '314'),
(57, 1, 'ALFOMBRAS DASHER, C.A.', '315'),
(58, 1, 'SECURITY SISTEMS EXCELON  C.A.', '316'),
(59, 1, 'IMPRESOS CANAIMA, S.R.L.', '317'),
(60, 1, 'CEDRO & NOGAL MUEBLES', '318'),
(61, 1, 'IMPRESORA QUALITY PRINT S.A.', '319'),
(62, 1, 'PARAGON, C.A.', '320'),
(63, 1, 'INVERSIONES COMPU MALL, C.A.', '321'),
(64, 1, 'ABELEC S.A.', '322'),
(65, 1, 'H & O EDICIONES, C.A.', '323'),
(66, 1, 'AGENCIA DE VIAJES Y TURISMO PASSARINI-SUAREZ, C.A.', '324'),
(67, 1, 'EXTINTORES SERVI CENTER 2020, C.A.', '325'),
(68, 1, 'FERRETERIA SAN ANDRES', '326'),
(69, 1, 'FORMALUX  C.A..', '327'),
(70, 1, 'DECO TEJIDOS', '328'),
(71, 1, 'CORPORACION H. LIGHTS S.A.', '329'),
(72, 1, 'INVERSIONES ROMACHACAO 2004, C.A.', '330'),
(73, 1, 'ALMACENES TOLEDO SAMBIL C.A.', '331'),
(74, 1, 'OTAI DESIGN', '332'),
(75, 1, 'REFRIGERACION NEVE-AIRE, C.A.', '333'),
(76, 1, 'HOGAR DE MADERA Y ALGO MAS, C.A.', '335'),
(77, 1, 'SERVICIOS MULTINORTE, C.A.', '336'),
(78, 1, 'FERRETOTAL CARACAS, C.A.', '337'),
(79, 1, 'INVERSIONES ALCRIS 2.057, C.A.', '338'),
(80, 1, 'BANCO BANESCO', '339'),
(81, 1, 'TODO INDUSTRIA Y COMERCIO DEL MUEBLES, C.A.', '340'),
(82, 1, 'FORMALUX, C.A.', '341'),
(83, 1, 'TECHTROL SISTEMAS ELECTRONICOS C.A.', '342'),
(84, 1, 'INVERSIONES MADEACERO, C.A.', '343'),
(85, 1, 'U 21 CASA DE BOLSA C.A.', '351'),
(86, 1, 'LASER SONIC 52 T.V. VIDEO, C.A.', '352'),
(87, 1, 'LA BOUTIQUE DEL MANIQUI, C.A.', '353'),
(88, 1, 'CONSTRACTA, C.A.', '354'),
(89, 1, 'IMIL 2000 AIRE ACONDICIONADO, C.A.', '355'),
(90, 1, 'SERVICIOS MULTINORTE, C.A.', '356'),
(91, 1, 'DESARROLLOS ORINOKIA 2004 C.A.', '357'),
(92, 1, 'INVERSIONES ORIANA, C.A.', '358'),
(93, 1, 'Inversiones Monofacturas Perdomo, c. a.', '359'),
(94, 1, 'ASESORES VALVER, C.A.', '360'),
(95, 1, 'ZOOM INTERNATIONAL SERVICES C.A.', '361'),
(96, 1, 'MATERIALES CARABOBO C.A.', '363'),
(97, 1, 'CONSTRUCCIONES EDMOSO, C.A.', '364'),
(98, 1, 'PUBLICIDAD GLOBORAMA C.A.', '481'),
(99, 1, 'FUMIGACIONES M  Y A, C.A.', '482'),
(100, 1, 'INVERSIONES NGG, C.A.', '483'),
(101, 1, 'ANITA\'S DISE—OS 2004 C.A.', '484'),
(102, 1, 'PABLOELECTRONICA C.A.', '485'),
(103, 1, 'INVERSIONES SCARLET, C. A.', '486'),
(104, 1, 'INVERSIONES GRAVANTE & ASOCIADOS  C.A.', '487'),
(105, 1, 'HOTEL DOS RIOS', '488'),
(106, 1, 'CERVECERIA Y RESTAURANT EL BIGOTE DEL ABUELO, C.A.', '489'),
(107, 1, 'PINTAORIENTE C.A.', '490'),
(108, 1, 'IMAYA C.A.', '491'),
(109, 1, 'ARTURO\'S SANTO TOMES', '492'),
(110, 1, 'ELECTRICOS ALTA VISTA, C.A.', '493'),
(111, 1, 'DRY WALL C.A.', '494'),
(112, 1, 'MATERIALES REYFECA, C.A.', '495'),
(113, 1, 'LA FERIA DE LA PINTURA UNARE, C .A', '496'),
(114, 1, 'RESTAURANT INVERSIONES VALFA 14 C.A.', '497'),
(115, 1, 'INVERSIONES KILO ORINOKIA, C.A.', '498'),
(116, 1, 'PAPELERIA LATINA ORIENTE C.A.', '499'),
(117, 1, 'BINGO CACHAMAY, C.A.', '500'),
(118, 1, 'DISTRIBUIDORA CAMI C.A.', '501'),
(119, 1, 'CENTRAL SANTO TOME IV, C.A.', '502'),
(120, 1, 'PRODUCTOS Y SERVICIOS REYES', '503'),
(121, 1, 'H Y F CIUDAD GUAYANA S.A.', '504'),
(122, 1, 'LAMPARAS DORAL PUERTO ORDAZ C.A.', '505'),
(123, 1, 'STEFIS, C.A.', '506'),
(124, 1, 'INVERSIONES BAYTOR -2000 C.A.', '507'),
(125, 1, 'ELECTRODOMESTICOS JVG HOGAR C.A.', '508'),
(126, 1, 'LIBRERIA LATINA ORINOKIA C.A.', '509'),
(127, 1, 'AIR MUNDO', '510'),
(128, 1, 'MARINICOL & ASOCIADOS, C.A.', '511'),
(129, 1, 'DISGRECA C.A.', '512'),
(130, 1, 'MUST HAVE', '513'),
(131, 1, 'FREDA FIVE', '514'),
(132, 1, 'CELLO', '515'),
(133, 1, 'STAY COOL', '516'),
(134, 1, 'SCOTT', '517'),
(135, 1, 'TOSKA', '518'),
(136, 1, 'SAN JOY', '519'),
(137, 1, 'CHOISE', '520'),
(138, 1, 'KINTRO', '521'),
(139, 1, 'SILVERGATE', '522'),
(140, 1, 'NIKIBIKI', '523'),
(141, 1, 'BE COOL', '524'),
(142, 1, 'FLAMINGO', '525'),
(143, 1, 'JOIA TRAD', '526'),
(144, 1, 'ELEGANCE ENTRERPRISE  CORP.', '527'),
(145, 1, 'FOTUNE D', '528'),
(146, 1, 'LEGEND', '529'),
(147, 1, 'SUNVISTA', '530'),
(148, 1, 'POLA', '531'),
(149, 1, 'NICOLE', '532'),
(150, 1, 'GIGI LOOK', '533'),
(151, 1, 'UNIT FASH', '534'),
(152, 1, 'CIEN', '535'),
(153, 1, 'TWGO', '536'),
(154, 1, 'SCOTT', '537'),
(155, 1, 'MISS ME', '538'),
(156, 1, 'ORIGINAL', '539'),
(157, 1, 'PIA', '540'),
(158, 1, 'KAN CAN', '541'),
(159, 1, 'FINESSE', '542'),
(160, 1, 'JOLIE BEAU', '543'),
(161, 1, 'ESTAM', '544'),
(162, 1, 'OPERA', '545'),
(163, 1, 'WATCH L.A.', '546'),
(164, 1, 'E.R.GENERATION', '547'),
(165, 1, 'LULUMARI', '548'),
(166, 1, 'BIZZ', '549'),
(167, 1, 'YAG', '550'),
(168, 1, 'EVENT', '551'),
(169, 1, 'DO&BE', '552'),
(170, 1, 'AMERICAN ONE', '553'),
(171, 1, 'CLOTHING', '554'),
(172, 1, 'BANANA USA', '555'),
(173, 1, 'Y APPAREL', '556'),
(174, 1, 'PIACE', '557'),
(175, 1, 'NOA', '558'),
(176, 1, 'PUNEHA', '559'),
(177, 1, 'CERES', '560'),
(178, 1, 'CHERISH', '561'),
(179, 1, 'SUGAR LIPS', '562'),
(180, 1, 'MOON COLLECTION', '563'),
(181, 1, 'POETRY CLOTHING', '564'),
(182, 1, 'FORTUN DINAMIC', '565'),
(183, 1, 'SUMMER RIO', '566'),
(184, 1, 'COSTAR', '567'),
(185, 1, 'ROSE DIMPLE', '568'),
(186, 1, 'PEPPER', '569'),
(187, 1, 'SHOE MAGNATE', '570'),
(188, 1, 'RODEM INC', '571'),
(189, 1, 'IRE FASHION', '572'),
(190, 1, 'LETTE', '573'),
(191, 1, 'MACHINE', '574'),
(192, 1, 'NEW TOWER', '575'),
(193, 1, 'SUSIE', '576'),
(194, 1, 'VENECCIA', '577'),
(195, 1, 'POEMA', '578'),
(196, 1, 'PRETTY GOOD', '579'),
(197, 1, 'ICE VANILLA', '580'),
(198, 1, 'PROFIL', '581'),
(199, 1, 'AMBIANCE', '582'),
(200, 1, 'STAR OF INDIA', '583'),
(201, 1, 'NATALI', '584'),
(202, 1, 'PLAY GIRLZ', '585'),
(203, 1, 'SYBER GIRL', '586'),
(204, 1, 'TOO MI', '587'),
(205, 1, 'SYBER GIRL', '588'),
(206, 1, 'MARINE BLU', '589'),
(207, 1, 'NEW MOOD', '590'),
(208, 1, 'MODEL', '591'),
(209, 1, 'INTERI', '592'),
(210, 1, 'TOP MONDIAL', '593'),
(211, 1, 'O CASUAL', '594'),
(212, 1, 'IRIS', '595'),
(213, 1, 'MINUET', '596'),
(214, 1, 'G.O.MAX', '597'),
(215, 1, 'Comercializadora R. M. S., c. a.', '598'),
(216, 1, 'TEENPLO', '599'),
(217, 1, 'MIYAO', '600'),
(218, 1, 'VIA VAI', '601'),
(219, 1, 'CANTATA', '602'),
(220, 1, 'ENTRO', '603'),
(221, 1, 'TIMING', '604'),
(222, 1, 'SO ROUGE', '605'),
(223, 1, 'MEGHAN', '606'),
(224, 1, 'SUN WAY', '607'),
(225, 1, 'FIRST LOOK', '608'),
(226, 1, 'SALDO', '609'),
(227, 1, 'ELEGANT FOOTWEAR', '610'),
(228, 1, 'BLISS', '611'),
(229, 1, 'CLOSET', '612'),
(230, 1, 'FORNIA', '613'),
(231, 1, 'P.O.P', '614'),
(232, 1, 'HIMEX  CO', '615'),
(233, 1, 'BEIZA', '616'),
(234, 1, 'chloe jeans', '617'),
(235, 1, 'JES', '618'),
(236, 1, 'SCARLETT', '619'),
(237, 1, 'SANS SOUCI', '620'),
(238, 1, 'SHADOW', '621'),
(239, 1, 'BOOM UP', '622'),
(240, 1, 'MICHEL', '623'),
(241, 1, 'SOMME', '624'),
(242, 1, 'MAGENTA', '625'),
(243, 1, 'SOPRANO', '626'),
(244, 1, 'WILDCAT', '627'),
(245, 1, 'OBOE', '628'),
(246, 1, 'imagine', '629'),
(247, 1, 'CAPRI', '630'),
(248, 1, 'ADRIANA', '631'),
(249, 1, 'WAX JEANS', '632'),
(250, 1, 'LOVELY DAY', '633'),
(251, 1, 'SUSIE', '634'),
(252, 1, 'OBJET', '635'),
(253, 1, 'Blue Impus', '636'),
(254, 1, 'Sandrea', '637'),
(255, 1, 'double zero', '638'),
(256, 1, 'TRAC', '639'),
(257, 1, 'GENERAL', '640'),
(258, 1, 'BACK STAGE', '641'),
(259, 1, 'MISOPE', '642'),
(260, 1, 'SO COOL', '643'),
(261, 1, 'STWELVE', '644'),
(262, 1, 'TOUCH 9', '645'),
(263, 1, 'KEMPO GIRL', '646'),
(264, 1, 'LUCA INC', '647'),
(265, 1, 'MYSTIC', '648'),
(266, 1, 'I HOPE', '649'),
(267, 1, 'EAST LION', '650'),
(268, 1, 'EASY POWER', '651'),
(269, 1, 'ICOM DESIGN', '652'),
(270, 1, 'YS FASHION', '653'),
(271, 1, 'NEW MOINE', '654'),
(272, 1, 'JEANETTE', '655'),
(273, 1, 'P&S USA', '656'),
(274, 1, 'NOBLE U', '657'),
(275, 1, 'P & S  USA', '658'),
(276, 1, 'CATWALK', '659'),
(277, 1, 'PRECIOSA', '660'),
(278, 1, 'B TRU', '661'),
(279, 1, 'GRIFFLIN', '662'),
(280, 1, 'VOLL', '663'),
(281, 1, 'Hanger', '664'),
(282, 1, 'Karma Collection Inc', '665'),
(283, 1, 'E-Zen', '666'),
(284, 1, 'MICHAEL ANTONIO', '667'),
(285, 1, 'REACTION', '668'),
(286, 1, 'GRENN VILLE', '669'),
(287, 1, 'MONTEAU', '670'),
(288, 1, 'PLASTIC', '671'),
(289, 1, 'IN JOY', '672'),
(290, 1, 'SUN VISTA', '673'),
(291, 1, 'CATWALK', '674'),
(292, 1, 'CHERRY KOKO', '675'),
(293, 1, 'BIZZ', '676'),
(294, 1, 'KHAKI KREW', '677'),
(295, 1, 'PREMIER', '678'),
(296, 1, 'LUCE', '679'),
(297, 1, 'JOSHNA CLOTHING', '680'),
(298, 1, 'CRYSTAL', '681'),
(299, 1, 'JULIA', '682'),
(300, 1, 'SOLITAIRE', '683'),
(301, 1, 'NISI JEANS', '684'),
(302, 1, 'L.A. IDOL FASHION', '685'),
(303, 1, 'KAIDAL', '686'),
(304, 1, 'ginger', '687'),
(305, 1, 'MINE', '688'),
(306, 1, 'TEEN BELL', '689'),
(307, 1, 'COTTON CANDY', '690'),
(308, 1, 'AGGIE', '691'),
(309, 1, 'k-scion', '692'),
(310, 1, 'the hanger', '693'),
(311, 1, 'WEST 36 CORP', '694'),
(312, 1, 'STYLE BIZ', '695'),
(313, 1, 'OLALA', '696'),
(314, 1, 'MIND CODE', '697'),
(315, 1, 'COME COMO', '698'),
(316, 1, 'pastel design', '699'),
(317, 1, 'deco', '794'),
(318, 1, 'feline', '795'),
(319, 1, 'unisono', '796'),
(320, 1, 'envied', '797'),
(321, 1, 'MAXINE PARIS', '798'),
(322, 1, 'katia', '799'),
(323, 1, 'DEUX LUX', '800'),
(324, 1, 'MAGAZINE', '801'),
(325, 1, 'EBISU', '802'),
(326, 1, 'BLUE COLLECTION', '803'),
(327, 1, 'ODIN FASHION', '804'),
(328, 1, 'LUCCA', '805'),
(329, 1, 'Monkey Banana', '806'),
(330, 1, 'CHI OLE', '807'),
(331, 1, 'ANGELA', '808'),
(332, 1, 'MUSTARD SEED', '809'),
(333, 1, 'CELLO', '810'),
(334, 1, 'SUPER LINE', '811'),
(335, 1, 'KMQINTL INC', '812'),
(336, 1, 'DON LUCE', '813'),
(337, 1, 'SHOES REPUBLIC', '814'),
(338, 1, 'DNA COUTURE', '815'),
(339, 1, 'DE NOVO IMPORT', '816'),
(340, 1, 'CHAIN & FANTASIA', '817'),
(341, 1, 'SI STYLE', '818'),
(342, 1, 'TEA SHOP', '819'),
(343, 1, 'MIELE', '820'),
(344, 1, 'MARQUIS', '821'),
(345, 1, 'CECI JEWELRY INC', '822'),
(346, 1, 'TENPLO', '823'),
(347, 1, 'PRINCE INTERNATIONAL.CORP', '924'),
(348, 1, 'Uno Mode Inc', '925'),
(349, 1, 'ANDES', '926'),
(350, 1, 'U&IIMPORT INC.', '927'),
(351, 1, 'JOIA HANDBAGS', '929'),
(352, 1, 'DA BIG, INC', '930'),
(353, 1, 'BETTER BE', '931'),
(354, 1, 'ARYEH', '932'),
(355, 1, 'THEME', '933'),
(356, 1, 'MaJose', '944'),
(357, 1, 'Nine West Margarita,C.A.', '955'),
(358, 1, 'OORI', '956'),
(359, 1, 'MJ', '957'),
(360, 1, 'FRESHINE', '958'),
(361, 1, 'TEAM', '959'),
(362, 1, 'HUSH', '960'),
(363, 1, 'DE NOVO IMPORTS, INC', '961'),
(364, 1, 'POEMA', '962'),
(365, 1, 'TEA', '963'),
(366, 1, 'LOVE STITCH', '964'),
(367, 1, 'BANANA MONKEY', '965'),
(368, 1, 'MIA DE NOVO', '966'),
(369, 1, 'ESMOR', '967'),
(370, 1, 'ACCESORIOS', '968'),
(371, 1, 'MANARA', '969'),
(372, 1, 'Tranf Moda', '970'),
(373, 1, 'KESSLEY', '971'),
(374, 1, 'GRACE IN L.A', '972'),
(375, 1, 'PARADISE MISS', '973'),
(376, 1, 'Andrea Makhoul', '974'),
(377, 1, 'LA BANGA', '982'),
(378, 1, 'PINK BY ELE', '984'),
(379, 1, 'DIVA', '987'),
(380, 1, 'RIPLAY', '988'),
(381, 1, 'FREE SPIRIT', '989'),
(382, 1, 'MUSTHAVE', '990'),
(383, 1, 'CECICOTOWN', '991'),
(384, 1, 'HAKKRAFTY', '992'),
(385, 1, 'PORTUA', '993'),
(386, 1, 'CO&CO', '994'),
(387, 1, 'TCEC', '995'),
(388, 1, 'MISSKELLY', '996'),
(389, 1, 'HAVE', '998'),
(390, 1, 'VALENTINE', '999'),
(391, 1, 'THE ONE', '1000'),
(392, 1, 'FASHION JEWELRY', '1001'),
(393, 1, 'MMS TRADING', '1002'),
(394, 1, 'ADIXION', '1003'),
(395, 1, 'IXIA', '1004'),
(396, 1, 'CYRUS', '1005'),
(397, 1, 'DEYCE', '1006'),
(398, 1, 'MICHELLE', '1007'),
(399, 1, 'GRACEINLA', '1008'),
(400, 1, 'WENZHOU XIALI TRINTIN C.O', '1009'),
(401, 1, 'SUNGLASSES', '1010'),
(402, 1, 'S. FASHION', '1011'),
(403, 1, 'GENERATION', '1012'),
(404, 1, 'DAVINCI', '1013'),
(405, 1, 'CERICE', '1014'),
(406, 1, 'ELEGANCE', '1015'),
(407, 1, 'JTS TRADING', '1016'),
(408, 1, 'FINAL TOUCH', '1017'),
(409, 1, 'FAMOSA', '1018'),
(410, 1, 'SOHO LADY', '1019'),
(411, 1, 'EVER AFTER', '1020'),
(412, 1, 'TEC', '1021'),
(413, 1, 'THE HATTER', '1022'),
(414, 1, 'AISHOP', '1023'),
(415, 1, 'PAMELA', '1024'),
(416, 1, 'DONGGUAN LIABU', '1025'),
(417, 1, 'SERENA', '1026'),
(418, 1, 'NOVO', '1027'),
(419, 1, 'CASUAL LAND', '1028'),
(420, 1, 'CRACE', '1029'),
(421, 1, 'POTTER SPORT', '1030'),
(422, 1, 'SEGURU', '1031'),
(423, 1, 'MISS 21', '1032'),
(424, 1, 'ELEGANT', '1033'),
(425, 1, 'BISU', '1034'),
(426, 1, 'ELLA', '1035'),
(427, 1, 'CHIC GALLERY', '1036'),
(428, 1, 'ICON', '1037'),
(429, 1, 'INVERSIONES PORLAMAR 2012, C. A.', '1038'),
(430, 1, 'QIAN HUANG', '1039'),
(431, 1, 'MANUFACTURAS MAPA MUNDI, C.A.', '1040'),
(432, 1, 'INVERSIONES MC ADAMS, C. A.', '1041'),
(433, 1, 'AGGIE', '1042'),
(434, 1, 'NINA', '1043'),
(435, 1, 'SOHO GIRLS', '1044'),
(436, 1, 'TRUE LOVE 2012', '1045'),
(437, 1, 'COVER STITCHED', '1047'),
(438, 1, 'ShoeShop Group', '1048'),
(439, 1, 'VIRGIN ONLY', '1049'),
(440, 1, 'HEM & THREAD', '1050'),
(441, 1, 'ARK & CO', '1051'),
(442, 1, 'Inversiones Risan SRL', '1052'),
(443, 1, 'MATILDA', '1053'),
(444, 1, 'INVERSIONES CORAL XXI, C. A.', '1054'),
(445, 1, '(Dev) INVERSIONES CORAL XXI, C. A.', '1055'),
(446, 1, '(Dev) INVERSIONES MC ADAMS, C. A.', '1056'),
(447, 1, '(Dev) MANUFACTURAS MAPA MUNDI, C.A.', '1057'),
(448, 1, 'ZINGA', '1058'),
(449, 1, 'C. LUCE', '1059'),
(450, 1, 'DOUBLE ZERO INC', '1060'),
(451, 1, 'INVERSIONES MUR GLOBAL, C. A.', '1061'),
(452, 1, 'INVERSIONES OCEANICA 32, C. A.', '1062'),
(453, 1, 'INVERSIONES OXANAM, C. A.', '1063'),
(454, 1, 'cc', '1064'),
(455, 1, 'MODA INVESTMENTS', '1065'),
(456, 1, 'LA REYNA', '1066'),
(457, 1, '(Dev) Inversiones MUR GLOBAL, c. a.', '1067'),
(458, 1, 'NESLAY DESINGNER INC', '1068'),
(459, 1, '(Dev) Inversiones Oxanam, c. a.', '1069'),
(460, 1, 'LIMENCHILI', '1070'),
(461, 1, 'GRUPO 6383615, C. A.', '1071'),
(462, 1, '(Dev) GRUPO 6383615, C. A.', '1072'),
(463, 1, 'BCOOL', '1073'),
(464, 1, 'Y&Z', '1074'),
(465, 1, 'CHINA MARKET', '1075'),
(466, 1, 'ICCO POLA', '1076'),
(467, 1, 'P&M', '1077'),
(468, 1, 'STYLE RACK', '1078'),
(469, 1, 'REMANENTE', '1079'),
(470, 1, 'PHOENIX WORLD TRADE CHINA', '251'),
(471, 2, 'INVERSIONES BANDUSH, C.A', '1'),
(472, 2, 'Original Fashion', '2'),
(473, 2, 'ADRIANA BIJOUX', '3'),
(474, 2, 'ORIGINAL FASHION (MCBO)', '4'),
(475, 2, 'ORCA CORPORACI”N INDUSTRIAL A.R., C.A.', '5'),
(476, 2, 'IMPORTACIONES TIGER SUNGLASS, C.A.', '6'),
(477, 2, 'DAD PUBLICIDAD', '7'),
(478, 2, 'PRODUCCIONES ICONOGRAFICAS', '8'),
(479, 2, 'BANESCO SEGUROS, C.A.', '9'),
(480, 2, 'GEMAS ORFEBRERIA, C.A.', '10'),
(481, 2, 'TELCEL, C.A.', '11'),
(482, 2, 'Di-Bari Mac-PC Services,C.A', '12'),
(483, 2, 'DULCE ALMEIDA', '13'),
(484, 2, 'TAJ MAHAL BISUTERIA 54, C.A.', '14'),
(485, 2, 'INVERSIONES DORAL FASHION, C. A.', '15'),
(486, 2, 'INVERSIONES EAST FASHION, S. A.', '16'),
(487, 2, 'INVERSIONES ISLAND FASHION, S. A.', '17'),
(488, 2, 'INVERSIONES PORLAMAR 2012, C. A.', '18'),
(489, 2, 'INVERSIONES MCADAMS, C. A.', '19'),
(490, 2, 'MANUFACTURAS MAPA MUNDI, C. A.', '20'),
(491, 2, 'PROVEEDOR PRUEBA', '21'),
(492, 2, 'COLOR STORY', '22'),
(493, 2, 'POTTER SPORT', '23'),
(494, 2, 'SILVERGATE', '24'),
(495, 2, 'TIMING', '25'),
(496, 2, 'VIRGIN', '26'),
(497, 2, 'HAVE', '27'),
(498, 2, 'KAN CAN', '28'),
(499, 2, 'ESTAM', '29'),
(500, 2, 'CELLO', '30'),
(501, 2, 'LOVE STITCH', '31'),
(502, 2, 'SILVERGATE', '32'),
(503, 2, 'TCEC', '33'),
(504, 2, 'DO&BE', '34'),
(505, 2, 'MUSTARD SEED', '35'),
(506, 2, 'SUPERLINE', '36'),
(507, 2, 'MYSTIC INC.', '37'),
(508, 2, 'AMBIANCE', '38'),
(509, 2, 'MATILDA', '39'),
(510, 2, 'LA VI 89', '40'),
(511, 2, 'CANTATA', '41'),
(512, 2, 'CECICO', '42'),
(513, 2, 'ENTRO', '43'),
(514, 2, 'JOLIE INC', '44'),
(515, 2, 'JUST MI', '45'),
(516, 2, 'MUST HAVE', '46'),
(517, 2, 'FINAL TOUCH', '49'),
(518, 2, 'CASUAL LAN', '50'),
(519, 2, 'FRESHINI', '51'),
(520, 2, 'POEMA', '52'),
(521, 2, 'INVERSIONES CORAL XXI, C. A.', '53'),
(522, 2, 'TRUE LOVE 2012', '54'),
(523, 2, 'INVERSIONES RISAN SRL', '55'),
(524, 2, 'TONYS CLOSEOUTS', '56'),
(525, 2, '(DEV) INVERSIONES  BANDUSH, C. A. ', '57'),
(526, 2, 'LA REINA INC', '58'),
(527, 2, 'CHOCOLATE U.S.A', '59'),
(528, 2, 'LULUMARI', '60'),
(529, 2, 'ZINGA', '61'),
(530, 2, 'PINK BY ELE', '62'),
(531, 2, 'SUNGLASES', '63'),
(532, 2, 'INVERSIONES MUR GLOBAL, C. A.', '64'),
(533, 2, 'INVERSIONES OCEANICA 32, C. A.', '65'),
(534, 2, '(DEV) INVERSIONES CORAL XXI, C. A.', '66'),
(535, 2, 'INVERSIONES OXANAM, C. A.', '67'),
(536, 2, 'MIS AVENUE', '69'),
(537, 2, 'C. LUCE', '70'),
(538, 2, 'SHOESHOP GRUP', '71'),
(539, 2, 'CECI JEWELRY, INC', '72'),
(540, 2, 'DOUBLE ZERO INC', '73'),
(541, 2, 'CERISE', '74'),
(542, 2, 'NESLAY', '75'),
(543, 2, 'AKR&CO', '76'),
(544, 2, 'CYRUS', '77'),
(545, 2, 'DE NOVO IMPORTS, INC.', '78'),
(546, 2, 'GRUPO 6383615, C. A.', '79'),
(547, 2, '(Dev) GRUPO 6383615, C. A.', '80'),
(548, 2, 'CHINA MARKET', '81'),
(549, 2, 'Y&Z', '82'),
(550, 2, 'BCOOL', '83'),
(551, 2, '(dev) INVERSIONES OXANAM,CA', '84'),
(552, 2, '(dev) INVERSIONES OCEANICA 32, C. A.', '85'),
(553, 2, '(dev) INVERSIONES MUR GLOBAL, C.A.', '86'),
(554, 2, 'JENIFER IN', '87'),
(555, 2, 'REMANENTE EXOTIK', '88'),
(556, 2, 'SCANDAL', '89'),
(557, 2, 'PHOENIX WORLD TRADE CHINA', '90');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion`
--

CREATE TABLE `seccion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `codseccion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `seccion`
--

INSERT INTO `seccion` (`id`, `nombre`, `codseccion`) VALUES
(1, 'TEXTIL', '1'),
(2, 'SHOES', '2'),
(3, 'JEWELRY', '3'),
(4, 'ACCESSORIES', '4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subfamilia`
--

CREATE TABLE `subfamilia` (
  `id` int(11) NOT NULL,
  `codsubfamilia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `subfamilia`
--

INSERT INTO `subfamilia` (`id`, `codsubfamilia`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25),
(26, 26),
(27, 27),
(28, 28),
(29, 29),
(30, 30),
(31, 31),
(32, 32),
(33, 33),
(34, 34),
(35, 35),
(36, 36),
(37, 37),
(38, 38),
(39, 39),
(40, 40),
(41, 41),
(42, 42),
(43, 43),
(44, 44),
(45, 45),
(46, 46),
(47, 47),
(48, 48),
(49, 49),
(50, 50),
(51, 51),
(52, 52),
(53, 53),
(54, 54),
(55, 55),
(56, 56),
(57, 57),
(58, 58),
(59, 59),
(60, 60),
(61, 61),
(62, 62),
(63, 63),
(64, 64),
(65, 65),
(66, 66),
(67, 67),
(68, 68),
(69, 69),
(70, 70),
(71, 71),
(72, 72),
(73, 73),
(74, 74),
(75, 75),
(76, 76),
(77, 77),
(78, 78),
(79, 79),
(80, 80),
(81, 81),
(82, 82),
(83, 83),
(84, 84),
(85, 85),
(86, 86),
(87, 87),
(88, 88),
(89, 89),
(90, 90),
(91, 91),
(92, 92),
(93, 93),
(94, 94),
(95, 95),
(96, 96),
(97, 97),
(98, 98),
(99, 99),
(100, 100),
(101, 101),
(102, 102),
(103, 103),
(104, 104),
(105, 105),
(106, 106),
(107, 107),
(108, 108),
(109, 109),
(110, 110),
(111, 111),
(112, 112),
(113, 113),
(114, 114),
(115, 115),
(116, 116),
(117, 117),
(118, 118),
(119, 119),
(120, 120),
(121, 121),
(122, 122),
(123, 123),
(124, 124),
(125, 125),
(126, 126),
(127, 127),
(128, 128),
(129, 129),
(130, 130),
(131, 131),
(132, 132),
(133, 133),
(134, 134),
(135, 135),
(136, 136),
(137, 137),
(138, 138),
(139, 139),
(140, 140),
(141, 141),
(142, 142),
(143, 143),
(144, 144),
(145, 145),
(146, 146),
(147, 147),
(148, 148),
(149, 149),
(150, 150),
(151, 151),
(152, 152),
(153, 153),
(154, 154),
(155, 155),
(156, 156),
(157, 157),
(158, 158),
(159, 159),
(160, 160),
(161, 161),
(162, 162),
(163, 163),
(164, 164),
(165, 165),
(166, 166),
(167, 167),
(168, 168),
(169, 169),
(170, 170),
(171, 171),
(172, 172),
(173, 173),
(174, 174),
(175, 175),
(176, 176),
(177, 177),
(178, 178),
(179, 179),
(180, 180),
(181, 181),
(182, 182),
(183, 183),
(184, 184),
(185, 185),
(186, 186),
(187, 187),
(188, 188),
(189, 189),
(190, 190),
(191, 191),
(192, 192),
(193, 193),
(194, 194),
(195, 195),
(196, 196),
(197, 197),
(198, 198),
(199, 199),
(200, 200),
(201, 201),
(202, 202),
(203, 203),
(204, 204),
(205, 205),
(206, 206),
(207, 207),
(208, 208),
(209, 209),
(210, 210),
(211, 211),
(212, 212),
(213, 213),
(214, 214),
(215, 215),
(216, 216),
(217, 217),
(218, 218),
(219, 219),
(220, 220),
(221, 221),
(222, 222),
(223, 223),
(224, 224),
(225, 225),
(226, 226),
(227, 227),
(228, 228),
(229, 229),
(230, 230),
(231, 231),
(232, 232),
(233, 233),
(234, 234),
(235, 235),
(236, 236),
(237, 237),
(238, 238),
(239, 239),
(240, 240),
(241, 241),
(242, 242),
(243, 243),
(244, 244),
(245, 245),
(246, 246),
(247, 247),
(248, 248),
(249, 249),
(250, 250),
(251, 251),
(252, 252),
(253, 253),
(254, 254),
(255, 255),
(256, 256),
(257, 257),
(258, 258),
(259, 259),
(260, 260),
(261, 261),
(262, 262),
(263, 263),
(264, 264),
(265, 265),
(266, 266),
(267, 267),
(268, 268),
(269, 269),
(270, 270),
(271, 271),
(272, 272),
(273, 273),
(274, 274),
(275, 275),
(276, 276),
(277, 277),
(278, 278),
(279, 279),
(280, 280),
(281, 281),
(282, 282),
(283, 283),
(284, 284),
(285, 285),
(286, 286),
(287, 287),
(288, 288),
(289, 289),
(290, 290),
(291, 291),
(292, 292),
(293, 293),
(294, 294),
(295, 295),
(296, 296),
(297, 297),
(298, 298),
(299, 299),
(300, 300),
(301, 301),
(302, 302),
(303, 303),
(304, 304),
(305, 305),
(306, 306),
(307, 307),
(308, 308),
(309, 309),
(310, 310),
(311, 311),
(312, 312),
(313, 313),
(314, 314),
(315, 315),
(316, 316),
(317, 317),
(318, 318),
(319, 319),
(320, 320),
(321, 321),
(322, 322),
(323, 323),
(324, 324),
(325, 325),
(326, 326),
(327, 327),
(328, 328),
(329, 329),
(330, 330),
(331, 331),
(332, 332),
(333, 333),
(334, 334),
(335, 335),
(336, 336),
(337, 337),
(338, 338),
(339, 339),
(340, 340),
(341, 341),
(342, 342),
(343, 343),
(344, 344),
(345, 345),
(346, 346),
(347, 347),
(348, 348),
(349, 349),
(350, 350),
(351, 351),
(352, 352),
(353, 353),
(354, 354),
(355, 355),
(356, 356),
(357, 357),
(358, 358),
(359, 359),
(360, 360),
(361, 361),
(362, 362),
(363, 363),
(364, 364),
(365, 365),
(366, 366),
(367, 367),
(368, 368),
(369, 369),
(370, 370),
(371, 371),
(372, 372),
(373, 373),
(374, 374),
(375, 375),
(376, 376),
(377, 377),
(378, 378),
(379, 379),
(380, 380),
(381, 381),
(382, 382),
(383, 383),
(384, 384),
(385, 385),
(386, 386),
(387, 387),
(388, 388),
(389, 389),
(390, 390),
(391, 391),
(392, 392),
(393, 393),
(394, 394),
(395, 395),
(396, 396),
(397, 397),
(398, 398),
(399, 399),
(400, 400),
(401, 401),
(402, 402),
(403, 403),
(404, 404),
(405, 405),
(406, 406),
(407, 407),
(408, 408),
(409, 409),
(410, 410),
(411, 411),
(412, 412),
(413, 413),
(414, 414),
(415, 415),
(416, 416),
(417, 417),
(418, 418),
(419, 419),
(420, 420),
(421, 421),
(422, 422),
(423, 423),
(424, 424),
(425, 425),
(426, 426),
(427, 427),
(428, 428),
(429, 429),
(430, 430),
(431, 431),
(432, 432),
(433, 433),
(434, 434),
(435, 435),
(436, 436),
(437, 437),
(438, 438),
(439, 439),
(440, 440),
(441, 441),
(442, 442),
(443, 443),
(444, 444),
(445, 445),
(446, 446),
(447, 447),
(448, 448),
(449, 449),
(450, 450),
(451, 451),
(452, 452),
(453, 453),
(454, 454),
(455, 455),
(456, 456),
(457, 457),
(458, 458),
(459, 459),
(460, 460),
(461, 461),
(462, 462),
(463, 463),
(464, 464),
(465, 465),
(466, 466),
(467, 467),
(468, 468),
(469, 469),
(470, 470),
(471, 471),
(472, 472),
(473, 473),
(474, 474),
(475, 475),
(476, 476),
(477, 477),
(478, 478),
(479, 479),
(480, 480),
(481, 481),
(482, 482),
(483, 483),
(484, 484),
(485, 485),
(486, 486),
(487, 487),
(488, 488),
(489, 489),
(490, 490),
(491, 491),
(492, 492),
(493, 493),
(494, 494),
(495, 495),
(496, 496),
(497, 497),
(498, 498),
(499, 499),
(500, 500),
(501, 501),
(502, 502),
(503, 503),
(504, 504),
(505, 505),
(506, 506),
(507, 507),
(508, 508),
(509, 509),
(510, 510),
(511, 511),
(512, 512),
(513, 513),
(514, 514),
(515, 515),
(516, 516),
(517, 517),
(518, 518),
(519, 519),
(520, 520),
(521, 521),
(522, 522),
(523, 523),
(524, 524),
(525, 525),
(526, 526),
(527, 527),
(528, 528),
(529, 529),
(530, 530),
(531, 531),
(532, 532),
(533, 533),
(534, 534),
(535, 535),
(536, 536),
(537, 537),
(538, 538),
(539, 539),
(540, 540),
(541, 541),
(542, 542),
(543, 543),
(544, 544),
(545, 545),
(546, 546),
(547, 547),
(548, 548),
(549, 549),
(550, 550),
(551, 551),
(552, 552),
(553, 553),
(554, 554),
(555, 555),
(556, 556),
(557, 557),
(558, 558),
(559, 559),
(560, 560),
(561, 561),
(562, 562),
(563, 563),
(564, 564),
(565, 565),
(566, 566),
(567, 567),
(568, 568),
(569, 569),
(570, 570),
(571, 571),
(572, 572),
(573, 573),
(574, 574),
(575, 575),
(576, 576),
(577, 577),
(578, 578),
(579, 579),
(580, 580),
(581, 581),
(582, 582),
(583, 583),
(584, 584),
(585, 585),
(586, 586),
(587, 587),
(588, 588),
(589, 589),
(590, 590),
(591, 591),
(592, 592),
(593, 593),
(594, 594),
(595, 595),
(596, 596),
(597, 597),
(598, 598),
(599, 599),
(600, 600),
(601, 601),
(602, 602),
(603, 603),
(604, 604),
(605, 605),
(606, 606),
(607, 607),
(608, 608),
(609, 609),
(610, 610),
(611, 611),
(612, 612),
(613, 613),
(614, 614),
(615, 615),
(616, 616),
(617, 617),
(618, 618),
(619, 619),
(620, 620),
(621, 621),
(622, 622),
(623, 623);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talla`
--

CREATE TABLE `talla` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `codtalla` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `talla`
--

INSERT INTO `talla` (`id`, `nombre`, `codtalla`) VALUES
(1, 'XXS', '00'),
(2, 'XS', '01'),
(3, 'S', '02'),
(4, 'M', '03'),
(5, 'L', '04'),
(6, 'XL', '05'),
(7, 'ONE SIZE', '06'),
(8, '5', '50'),
(9, '5/ ', '51'),
(10, '6', '52'),
(11, '6/', '53'),
(12, '7', '54'),
(13, '7/', '55'),
(14, '8', '56'),
(15, '8/', '57'),
(16, '9', '58'),
(17, '9/', '59'),
(18, '10', '60');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temporada`
--

CREATE TABLE `temporada` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `codtemporada` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `temporada`
--

INSERT INTO `temporada` (`id`, `nombre`, `codtemporada`) VALUES
(1, 'SPRING', 'S'),
(2, 'SUMMER', 'U'),
(3, 'FALL', 'F'),
(4, 'WINTER ', 'W'),
(5, 'HOLIDAY', 'H'),
(6, 'RESORT', 'R'),
(7, 'TRAVEL', 'T');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'okirlin', 'iwTNae9t34OmnK6l4vT4IeaTk-YWI2Rv', '$2y$13$CXT0Rkle1EMJ/c1l5bylL.EylfmQ39O5JlHJVFpNn618OUS1HwaIi', 't5GU9NwpuGYSfb7FEZMAxqtuz2PkEvv_1497453129', 'brady.renner@rutherford.com', 10, 1391885313, 1391885313),
(2, 'troy.becker', 'EdKfXrx88weFMV0vIxuTMWKgfK2tS3Lp', '$2y$13$g5nv41Px7VBqhS3hVsVN2.MKfgT3jFdkXEsMC4rQJLfaMa7VaJqL2', '4BSNyiZNAuxjs5Mty990c47sVrgllIi_1497453129', 'nicolas.dianna@hotmail.com', 0, 1391885313, 1391885313),
(3, 'admin', 'Tu5b-2qsIzaeac2Sq8qzkyW5CRhz8CX7', '$2y$13$wyoBtJr9Xo/vk8ePug5y5.ozVT9NRmWSch.6424vOh3nP6cwdjfvm', NULL, 'admin@admin.com', 10, 1497550895, 1497550895);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ano`
--
ALTER TABLE `ano`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Indices de la tabla `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Indices de la tabla `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indices de la tabla `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indices de la tabla `capsula`
--
ALTER TABLE `capsula`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `familia`
--
ALTER TABLE `familia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_familia_seccion_idx` (`idseccion`);

--
-- Indices de la tabla `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`idlog`),
  ADD KEY `fk_log_user_idx` (`id_user`);

--
-- Indices de la tabla `mapping`
--
ALTER TABLE `mapping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_mapping_marca_idx` (`id_marca`);

--
-- Indices de la tabla `mapping_header`
--
ALTER TABLE `mapping_header`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_mapping_header_mapping_idx` (`id_mapping`);

--
-- Indices de la tabla `mapping_header_prev`
--
ALTER TABLE `mapping_header_prev`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`);

--
-- Indices de la tabla `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indices de la tabla `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_mapping_idx` (`id_mapping`);
ALTER TABLE `product` ADD FULLTEXT KEY `cod_barra_index` (`cod_barra`);

--
-- Indices de la tabla `product_prev`
--
ALTER TABLE `product_prev`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_mapping_idx` (`id_mapping`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_proveedores_marca_idx` (`idmarca`);

--
-- Indices de la tabla `seccion`
--
ALTER TABLE `seccion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `subfamilia`
--
ALTER TABLE `subfamilia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `talla`
--
ALTER TABLE `talla`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `temporada`
--
ALTER TABLE `temporada`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ano`
--
ALTER TABLE `ano`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `capsula`
--
ALTER TABLE `capsula`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `color`
--
ALTER TABLE `color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `familia`
--
ALTER TABLE `familia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
--
-- AUTO_INCREMENT de la tabla `log`
--
ALTER TABLE `log`
  MODIFY `idlog` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `mapping`
--
ALTER TABLE `mapping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `mapping_header`
--
ALTER TABLE `mapping_header`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `mapping_header_prev`
--
ALTER TABLE `mapping_header_prev`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=511;
--
-- AUTO_INCREMENT de la tabla `product_prev`
--
ALTER TABLE `product_prev`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=558;
--
-- AUTO_INCREMENT de la tabla `seccion`
--
ALTER TABLE `seccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `subfamilia`
--
ALTER TABLE `subfamilia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=624;
--
-- AUTO_INCREMENT de la tabla `talla`
--
ALTER TABLE `talla`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `temporada`
--
ALTER TABLE `temporada`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `familia`
--
ALTER TABLE `familia`
  ADD CONSTRAINT `fk_familia_seccion` FOREIGN KEY (`idseccion`) REFERENCES `seccion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `fk_log_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mapping`
--
ALTER TABLE `mapping`
  ADD CONSTRAINT `fk_mapping_marca` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mapping_header`
--
ALTER TABLE `mapping_header`
  ADD CONSTRAINT `fk_mapping_header_mapping` FOREIGN KEY (`id_mapping`) REFERENCES `mapping` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_mapping` FOREIGN KEY (`id_mapping`) REFERENCES `mapping` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `fk_proveedores_marca` FOREIGN KEY (`idmarca`) REFERENCES `marca` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
