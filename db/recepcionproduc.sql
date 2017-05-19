-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 19-05-2017 a las 16:13:44
-- Versión del servidor: 5.7.18-0ubuntu0.16.04.1
-- Versión de PHP: 7.0.15-0ubuntu0.16.04.4

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
-- Estructura de tabla para la tabla `log`
--

CREATE TABLE `log` (
  `idlog` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `operacion` text NOT NULL,
  `id_mapping` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_producto` int(11) DEFAULT NULL,
  `acumulado` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `log`
--

INSERT INTO `log` (`idlog`, `id_user`, `operacion`, `id_mapping`, `fecha`, `id_producto`, `acumulado`, `cantidad`) VALUES
(1, 1, 'Conteo', 1, '2017-05-17 23:54:10', 6, 85, 198),
(2, 1, 'Conteo', 1, '2017-05-17 23:54:11', 6, 86, 198),
(3, 1, 'Conteo', 1, '2017-05-17 23:54:12', 6, 87, 198),
(4, 2, 'Conteo', 1, '2017-05-18 00:01:04', 253, 103, 140),
(5, 2, 'Conteo', 1, '2017-05-18 00:01:04', 253, 104, 140),
(6, 2, 'Conteo', 1, '2017-05-18 00:01:06', 253, 105, 140),
(7, 2, 'Conteo', 1, '2017-05-18 00:24:30', 258, 113, 142),
(8, 1, 'Conteo', 1, '2017-05-18 17:56:38', 260, 76, 233),
(9, 1, 'Conteo', 1, '2017-05-18 17:56:39', 260, 77, 233),
(10, 1, 'Conteo', 1, '2017-05-18 17:56:39', 260, 78, 233),
(11, 1, 'Conteo', 1, '2017-05-18 17:58:47', 533, 2, 100),
(12, 1, 'Conteo', 1, '2017-05-18 18:28:50', 253, 106, 140);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mapping`
--

CREATE TABLE `mapping` (
  `id` int(11) NOT NULL,
  `marca` text NOT NULL,
  `fecha` date NOT NULL,
  `tipo` text NOT NULL,
  `archivo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mapping`
--

INSERT INTO `mapping` (`id`, `marca`, `fecha`, `tipo`, `archivo`) VALUES
(1, 'Aishop', '2017-05-26', 'TEXTIL', 'MAPPING AISHOP TEXTIL ABRIL BOOKING 75.csv'),
(3, 'Aishop', '2017-05-19', 'TEXTIL', 'MAPPING AISHOP TEXTIL ABRIL BOOKING 75.csv');

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
  `acumulado` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`id`, `cod_barra`, `marca`, `departamento`, `seccion`, `familia`, `subfamilia`, `temporada`, `ano`, `capsula`, `color`, `talla`, `proveedor`, `cantidad`, `pvptienda`, `peso`, `serie`, `referencia`, `descripcion`, `costodist`, `pvpmgta`, `carac`, `gpeso`, `codmarca`, `coddepto`, `codseccion`, `codfamilia`, `codsubfamilia`, `codtemporada`, `codano`, `codcapsula`, `codcolor`, `codtalla`, `codprov`, `descapsula`, `id_mapping`, `acumulado`) VALUES
(1, '17111030011702', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'TURQUOISE', 'S', 'PHOENIX WORLD TRADE CHINA', '199', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '17', '2', '251', '', 1, 199),
(2, '17111030011703', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'TURQUOISE', 'M', 'PHOENIX WORLD TRADE CHINA', '199', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '17', '3', '251', '', 1, NULL),
(3, '17111030011704', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'TURQUOISE', 'L', 'PHOENIX WORLD TRADE CHINA', '198', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '17', '4', '251', '', 1, 193),
(4, '17111030012002', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '205', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '20', '2', '251', '', 1, 180),
(5, '17111030012003', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '194', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '20', '3', '251', '', 1, 84),
(6, '17111030012004', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '198', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '20', '4', '251', '', 1, 87),
(7, '17111030015302', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '200', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '53', '2', '251', '', 1, NULL),
(8, '17111030015303', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '201', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '53', '3', '251', '', 1, NULL),
(9, '17111030015304', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '178', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '53', '4', '251', '', 1, NULL),
(10, '17111030013002', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'S', 'PHOENIX WORLD TRADE CHINA', '200', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '30', '2', '251', '', 1, NULL),
(11, '17111030013003', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'M', 'PHOENIX WORLD TRADE CHINA', '242', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '30', '3', '251', '', 1, NULL),
(12, '17111030013004', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'L', 'PHOENIX WORLD TRADE CHINA', '200', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '30', '4', '251', '', 1, NULL),
(13, '17111030010102', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '214', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '1', '2', '251', '', 1, NULL),
(14, '17111030010103', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '224', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '1', '3', '251', '', 1, NULL),
(15, '17111030010104', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '222', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '1', '4', '251', '', 1, NULL),
(16, '17111030018002', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '220', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '80', '2', '251', '', 1, NULL),
(17, '17111030018003', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '220', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '80', '3', '251', '', 1, NULL),
(18, '17111030018004', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '221', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '80', '4', '251', '', 1, NULL),
(19, '17111023211702', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'TURQUOISE', 'S', 'PHOENIX WORLD TRADE CHINA', '242', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '17', '2', '251', '', 1, NULL),
(20, '17111023211703', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'TURQUOISE', 'M', 'PHOENIX WORLD TRADE CHINA', '238', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '17', '3', '251', '', 1, NULL),
(21, '17111023211704', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'TURQUOISE', 'L', 'PHOENIX WORLD TRADE CHINA', '236', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '17', '4', '251', '', 1, NULL),
(22, '17111023212002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '240', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '20', '2', '251', '', 1, NULL),
(23, '17111023212003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '227', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '20', '3', '251', '', 1, NULL),
(24, '17111023212004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '234', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '20', '4', '251', '', 1, NULL),
(25, '17111023215302', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '239', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '53', '2', '251', '', 1, NULL),
(26, '17111023215303', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '238', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '53', '3', '251', '', 1, NULL),
(27, '17111023215304', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '247', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '53', '4', '251', '', 1, NULL),
(28, '17111023213002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'S', 'PHOENIX WORLD TRADE CHINA', '248', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '30', '2', '251', '', 1, NULL),
(29, '17111023213003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'M', 'PHOENIX WORLD TRADE CHINA', '238', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '30', '3', '251', '', 1, NULL),
(30, '17111023213004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'L', 'PHOENIX WORLD TRADE CHINA', '238', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '30', '4', '251', '', 1, NULL),
(31, '17111023210102', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '258', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '1', '2', '251', '', 1, NULL),
(32, '17111023210103', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '269', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '1', '3', '251', '', 1, NULL),
(33, '17111023210104', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '248', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '1', '4', '251', '', 1, NULL),
(34, '17111023218002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '262', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '80', '2', '251', '', 1, NULL),
(35, '17111023218003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '260', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '80', '3', '251', '', 1, NULL),
(36, '17111023218004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '264', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '80', '4', '251', '', 1, NULL),
(37, '17111030021702', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'TURQUOISE', 'S', 'PHOENIX WORLD TRADE CHINA', '232', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '17', '2', '251', '', 1, NULL),
(38, '17111030021703', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'TURQUOISE', 'M', 'PHOENIX WORLD TRADE CHINA', '236', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '17', '3', '251', '', 1, NULL),
(39, '17111030021704', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'TURQUOISE', 'L', 'PHOENIX WORLD TRADE CHINA', '224', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '17', '4', '251', '', 1, NULL),
(40, '17111030022002', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '244', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '20', '2', '251', '', 1, NULL),
(41, '17111030022003', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '240', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '20', '3', '251', '', 1, NULL),
(42, '17111030022004', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '247', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '20', '4', '251', '', 1, NULL),
(43, '17111030025302', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '232', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '53', '2', '251', '', 1, NULL),
(44, '17111030025303', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '231', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '53', '3', '251', '', 1, NULL),
(45, '17111030025304', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '232', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '53', '4', '251', '', 1, NULL),
(46, '17111030023002', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'S', 'PHOENIX WORLD TRADE CHINA', '232', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '30', '2', '251', '', 1, NULL),
(47, '17111030023003', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'M', 'PHOENIX WORLD TRADE CHINA', '229', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '30', '3', '251', '', 1, NULL),
(48, '17111030023004', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'L', 'PHOENIX WORLD TRADE CHINA', '232', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '30', '4', '251', '', 1, NULL),
(49, '17111030020102', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '254', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '1', '2', '251', '', 1, NULL),
(50, '17111030020103', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '247', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '1', '3', '251', '', 1, NULL),
(51, '17111030020104', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '256', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '1', '4', '251', '', 1, NULL),
(52, '17111030028002', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '253', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '80', '2', '251', '', 1, NULL),
(53, '17111030028003', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '257', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '80', '3', '251', '', 1, NULL),
(54, '17111030028004', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '255', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '80', '4', '251', '', 1, NULL),
(55, '17111023222002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '322', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '146', '32998.9', '1.99', '', 'AU171-1102-322', 'TOP', '19799.34', '32998.9', ' AU171 ', '', 'A', '1', '1', '2', '322', 'U', '17', '1', '20', '2', '251', '', 1, NULL),
(56, '17111023222003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '322', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '145', '32998.9', '1.99', '', 'AU171-1102-322', 'TOP', '19799.34', '32998.9', ' AU171 ', '', 'A', '1', '1', '2', '322', 'U', '17', '1', '20', '3', '251', '', 1, NULL),
(57, '17111023222004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '322', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '150', '32998.9', '1.99', '', 'AU171-1102-322', 'TOP', '19799.34', '32998.9', ' AU171 ', '', 'A', '1', '1', '2', '322', 'U', '17', '1', '20', '4', '251', '', 1, NULL),
(58, '17111021002002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '100', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '147', '37549.9', '2.47', '', 'AU171-1102-100', 'TOP', '22529.94', '37549.9', ' AU171 ', '', 'A', '1', '1', '2', '100', 'U', '17', '1', '20', '2', '251', '', 1, NULL),
(59, '17111021002003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '100', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '148', '37549.9', '2.47', '', 'AU171-1102-100', 'TOP', '22529.94', '37549.9', ' AU171 ', '', 'A', '1', '1', '2', '100', 'U', '17', '1', '20', '3', '251', '', 1, NULL),
(60, '17111021002004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '100', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '148', '37549.9', '2.47', '', 'AU171-1102-100', 'TOP', '22529.94', '37549.9', ' AU171 ', '', 'A', '1', '1', '2', '100', 'U', '17', '1', '20', '4', '251', '', 1, NULL),
(61, '17111021108002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '110', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '81', '76998.9', '5.25', '', 'AU171-1102-110', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '110', 'U', '17', '1', '80', '2', '251', '', 1, NULL),
(62, '17111021108003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '110', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '81', '76998.9', '5.25', '', 'AU171-1102-110', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '110', 'U', '17', '1', '80', '3', '251', '', 1, NULL),
(63, '17111021108004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '110', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '81', '76998.9', '5.25', '', 'AU171-1102-110', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '110', 'U', '17', '1', '80', '4', '251', '', 1, NULL),
(64, '17111021100102', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '110', 'SUMMER', '2017', 'APRIL', 'WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '81', '76998.9', '5.25', '', 'AU171-1102-110', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '110', 'U', '17', '1', '1', '2', '251', '', 1, NULL),
(65, '17111021100103', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '110', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '80', '76998.9', '5.25', '', 'AU171-1102-110', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '110', 'U', '17', '1', '1', '3', '251', '', 1, NULL),
(66, '17111021100104', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '110', 'SUMMER', '2017', 'APRIL', 'WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '82', '76998.9', '5.25', '', 'AU171-1102-110', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '110', 'U', '17', '1', '1', '4', '251', '', 1, NULL),
(67, '17111021105302', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '110', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '81', '76998.9', '5.25', '', 'AU171-1102-110', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '110', 'U', '17', '1', '53', '2', '251', '', 1, NULL),
(68, '17111021105303', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '110', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '82', '76998.9', '5.25', '', 'AU171-1102-110', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '110', 'U', '17', '1', '53', '3', '251', '', 1, NULL),
(69, '17111021105304', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '110', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '79', '76998.9', '5.25', '', 'AU171-1102-110', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '110', 'U', '17', '1', '53', '4', '251', '', 1, NULL),
(70, '17111130138002', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '13', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '59', '79998.9', '5.78', '', 'AU171-1113-013', 'SHORT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '13', '13', 'U', '17', '1', '80', '2', '251', '', 1, NULL),
(71, '17111130138003', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '13', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '61', '79998.9', '5.78', '', 'AU171-1113-013', 'SHORT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '13', '13', 'U', '17', '1', '80', '3', '251', '', 1, NULL),
(72, '17111130138004', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '13', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '54', '79998.9', '5.78', '', 'AU171-1113-013', 'SHORT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '13', '13', 'U', '17', '1', '80', '4', '251', '', 1, NULL),
(73, '17111130136502', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '13', 'SUMMER', '2017', 'APRIL', 'LIME', 'S', 'PHOENIX WORLD TRADE CHINA', '52', '79998.9', '5.78', '', 'AU171-1113-013', 'SHORT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '13', '13', 'U', '17', '1', '65', '2', '251', '', 1, NULL),
(74, '17111130136503', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '13', 'SUMMER', '2017', 'APRIL', 'LIME', 'M', 'PHOENIX WORLD TRADE CHINA', '53', '79998.9', '5.78', '', 'AU171-1113-013', 'SHORT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '13', '13', 'U', '17', '1', '65', '3', '251', '', 1, NULL),
(75, '17111130136504', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '13', 'SUMMER', '2017', 'APRIL', 'LIME', 'L', 'PHOENIX WORLD TRADE CHINA', '51', '79998.9', '5.78', '', 'AU171-1113-013', 'SHORT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '13', '13', 'U', '17', '1', '65', '4', '251', '', 1, NULL),
(76, '17111130135302', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '13', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '51', '79998.9', '5.78', '', 'AU171-1113-013', 'SHORT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '13', '13', 'U', '17', '1', '53', '2', '251', '', 1, NULL),
(77, '17111130135303', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '13', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '49', '79998.9', '5.78', '', 'AU171-1113-013', 'SHORT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '13', '13', 'U', '17', '1', '53', '3', '251', '', 1, NULL),
(78, '17111130135304', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '13', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '50', '79998.9', '5.78', '', 'AU171-1113-013', 'SHORT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '13', '13', 'U', '17', '1', '53', '4', '251', '', 1, NULL),
(79, '17111050038202', 'AISHOP', 'WOMAN', 'TEXTIL', 'SWEATER', '3', 'SUMMER', '2017', 'APRIL', 'GREY', 'S', 'PHOENIX WORLD TRADE CHINA', '92', '84749.9', '5.57', '', 'AU171-1105-003', 'SWEATER', '50849.94', '84749.9', ' AU171 ', '', 'A', '1', '1', '5', '3', 'U', '17', '1', '82', '2', '251', '', 1, NULL),
(80, '17111050038203', 'AISHOP', 'WOMAN', 'TEXTIL', 'SWEATER', '3', 'SUMMER', '2017', 'APRIL', 'GREY', 'M', 'PHOENIX WORLD TRADE CHINA', '92', '84749.9', '5.57', '', 'AU171-1105-003', 'SWEATER', '50849.94', '84749.9', ' AU171 ', '', 'A', '1', '1', '5', '3', 'U', '17', '1', '82', '3', '251', '', 1, NULL),
(81, '17111050038204', 'AISHOP', 'WOMAN', 'TEXTIL', 'SWEATER', '3', 'SUMMER', '2017', 'APRIL', 'GREY', 'L', 'PHOENIX WORLD TRADE CHINA', '92', '84749.9', '5.57', '', 'AU171-1105-003', 'SWEATER', '50849.94', '84749.9', ' AU171 ', '', 'A', '1', '1', '5', '3', 'U', '17', '1', '82', '4', '251', '', 1, NULL),
(82, '17111050034002', 'AISHOP', 'WOMAN', 'TEXTIL', 'SWEATER', '3', 'SUMMER', '2017', 'APRIL', 'RED', 'S', 'PHOENIX WORLD TRADE CHINA', '91', '84749.9', '5.57', '', 'AU171-1105-003', 'SWEATER', '50849.94', '84749.9', ' AU171 ', '', 'A', '1', '1', '5', '3', 'U', '17', '1', '40', '2', '251', '', 1, NULL),
(83, '17111050034003', 'AISHOP', 'WOMAN', 'TEXTIL', 'SWEATER', '3', 'SUMMER', '2017', 'APRIL', 'RED', 'M', 'PHOENIX WORLD TRADE CHINA', '92', '84749.9', '5.57', '', 'AU171-1105-003', 'SWEATER', '50849.94', '84749.9', ' AU171 ', '', 'A', '1', '1', '5', '3', 'U', '17', '1', '40', '3', '251', '', 1, NULL),
(84, '17111050034004', 'AISHOP', 'WOMAN', 'TEXTIL', 'SWEATER', '3', 'SUMMER', '2017', 'APRIL', 'RED', 'L', 'PHOENIX WORLD TRADE CHINA', '92', '84749.9', '5.57', '', 'AU171-1105-003', 'SWEATER', '50849.94', '84749.9', ' AU171 ', '', 'A', '1', '1', '5', '3', 'U', '17', '1', '40', '4', '251', '', 1, NULL),
(85, '17111021170102', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '117', 'SUMMER', '2017', 'APRIL', 'WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '80', '63998.9', '4.31', '', 'AU171-1102-117', 'TOP', '38399.34', '63998.9', ' AU171 ', '', 'A', '1', '1', '2', '117', 'U', '17', '1', '1', '2', '251', '', 1, NULL),
(86, '17111021170103', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '117', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '80', '63998.9', '4.31', '', 'AU171-1102-117', 'TOP', '38399.34', '63998.9', ' AU171 ', '', 'A', '1', '1', '2', '117', 'U', '17', '1', '1', '3', '251', '', 1, NULL),
(87, '17111021170104', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '117', 'SUMMER', '2017', 'APRIL', 'WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '79', '63998.9', '4.31', '', 'AU171-1102-117', 'TOP', '38399.34', '63998.9', ' AU171 ', '', 'A', '1', '1', '2', '117', 'U', '17', '1', '1', '4', '251', '', 1, NULL),
(88, '17111021178002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '117', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '79', '63998.9', '4.31', '', 'AU171-1102-117', 'TOP', '38399.34', '63998.9', ' AU171 ', '', 'A', '1', '1', '2', '117', 'U', '17', '1', '80', '2', '251', '', 1, NULL),
(89, '17111021178003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '117', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '79', '63998.9', '4.31', '', 'AU171-1102-117', 'TOP', '38399.34', '63998.9', ' AU171 ', '', 'A', '1', '1', '2', '117', 'U', '17', '1', '80', '3', '251', '', 1, NULL),
(90, '17111021178004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '117', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '80', '63998.9', '4.31', '', 'AU171-1102-117', 'TOP', '38399.34', '63998.9', ' AU171 ', '', 'A', '1', '1', '2', '117', 'U', '17', '1', '80', '4', '251', '', 1, NULL),
(91, '17111021190102', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '119', 'SUMMER', '2017', 'APRIL', 'WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '89', '69998.9', '4.73', '', 'AU171-1102-119', 'TOP', '41999.34', '69998.9', ' AU171 ', '', 'A', '1', '1', '2', '119', 'U', '17', '1', '1', '2', '251', '', 1, NULL),
(92, '17111021190103', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '119', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '89', '69998.9', '4.73', '', 'AU171-1102-119', 'TOP', '41999.34', '69998.9', ' AU171 ', '', 'A', '1', '1', '2', '119', 'U', '17', '1', '1', '3', '251', '', 1, NULL),
(93, '17111021190104', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '119', 'SUMMER', '2017', 'APRIL', 'WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '90', '69998.9', '4.73', '', 'AU171-1102-119', 'TOP', '41999.34', '69998.9', ' AU171 ', '', 'A', '1', '1', '2', '119', 'U', '17', '1', '1', '4', '251', '', 1, NULL),
(94, '17111021198002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '119', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '72', '69998.9', '4.73', '', 'AU171-1102-119', 'TOP', '41999.34', '69998.9', ' AU171 ', '', 'A', '1', '1', '2', '119', 'U', '17', '1', '80', '2', '251', '', 1, NULL),
(95, '17111021198003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '119', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '72', '69998.9', '4.73', '', 'AU171-1102-119', 'TOP', '41999.34', '69998.9', ' AU171 ', '', 'A', '1', '1', '2', '119', 'U', '17', '1', '80', '3', '251', '', 1, NULL),
(96, '17111021198004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '119', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '72', '69998.9', '4.73', '', 'AU171-1102-119', 'TOP', '41999.34', '69998.9', ' AU171 ', '', 'A', '1', '1', '2', '119', 'U', '17', '1', '80', '4', '251', '', 1, NULL),
(97, '17111021252002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '125', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '85', '54598.9', '3.47', '', 'AU171-1102-125', 'TOP', '32759.34', '54598.9', ' AU171 ', '', 'A', '1', '1', '2', '125', 'U', '17', '1', '20', '2', '251', '', 1, NULL),
(98, '17111021252003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '125', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '84', '54598.9', '3.47', '', 'AU171-1102-125', 'TOP', '32759.34', '54598.9', ' AU171 ', '', 'A', '1', '1', '2', '125', 'U', '17', '1', '20', '3', '251', '', 1, NULL),
(99, '17111021252004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '125', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '85', '54598.9', '3.47', '', 'AU171-1102-125', 'TOP', '32759.34', '54598.9', ' AU171 ', '', 'A', '1', '1', '2', '125', 'U', '17', '1', '20', '4', '251', '', 1, NULL),
(100, '17111021256002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '125', 'SUMMER', '2017', 'APRIL', 'GREEN', 'S', 'PHOENIX WORLD TRADE CHINA', '82', '54598.9', '3.47', '', 'AU171-1102-125', 'TOP', '32759.34', '54598.9', ' AU171 ', '', 'A', '1', '1', '2', '125', 'U', '17', '1', '60', '2', '251', '', 1, NULL),
(101, '17111021256003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '125', 'SUMMER', '2017', 'APRIL', 'GREEN', 'M', 'PHOENIX WORLD TRADE CHINA', '82', '54598.9', '3.47', '', 'AU171-1102-125', 'TOP', '32759.34', '54598.9', ' AU171 ', '', 'A', '1', '1', '2', '125', 'U', '17', '1', '60', '3', '251', '', 1, NULL),
(102, '17111021256004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '125', 'SUMMER', '2017', 'APRIL', 'GREEN', 'L', 'PHOENIX WORLD TRADE CHINA', '83', '54598.9', '3.47', '', 'AU171-1102-125', 'TOP', '32759.34', '54598.9', ' AU171 ', '', 'A', '1', '1', '2', '125', 'U', '17', '1', '60', '4', '251', '', 1, NULL),
(103, '17111021512002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '151', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '74', '54598.9', '3.47', '', 'AU171-1102-151', 'TOP', '32759.34', '54598.9', ' AU171 ', '', 'A', '1', '1', '2', '151', 'U', '17', '1', '20', '2', '251', '', 1, NULL),
(104, '17111021512003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '151', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '83', '54598.9', '3.47', '', 'AU171-1102-151', 'TOP', '32759.34', '54598.9', ' AU171 ', '', 'A', '1', '1', '2', '151', 'U', '17', '1', '20', '3', '251', '', 1, NULL),
(105, '17111021512004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '151', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '79', '54598.9', '3.47', '', 'AU171-1102-151', 'TOP', '32759.34', '54598.9', ' AU171 ', '', 'A', '1', '1', '2', '151', 'U', '17', '1', '20', '4', '251', '', 1, NULL),
(106, '17111021666002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '166', 'SUMMER', '2017', 'APRIL', 'GREEN', 'S', 'PHOENIX WORLD TRADE CHINA', '83', '33998.9', '1.99', '', 'AU171-1102-166', 'TOP', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '2', '166', 'U', '17', '1', '60', '2', '251', '', 1, NULL),
(107, '17111021666003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '166', 'SUMMER', '2017', 'APRIL', 'GREEN', 'M', 'PHOENIX WORLD TRADE CHINA', '90', '33998.9', '1.99', '', 'AU171-1102-166', 'TOP', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '2', '166', 'U', '17', '1', '60', '3', '251', '', 1, NULL),
(108, '17111021666004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '166', 'SUMMER', '2017', 'APRIL', 'GREEN', 'L', 'PHOENIX WORLD TRADE CHINA', '85', '33998.9', '1.99', '', 'AU171-1102-166', 'TOP', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '2', '166', 'U', '17', '1', '60', '4', '251', '', 1, NULL),
(109, '17111021664002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '166', 'SUMMER', '2017', 'APRIL', 'RED', 'S', 'PHOENIX WORLD TRADE CHINA', '89', '33998.9', '1.99', '', 'AU171-1102-166', 'TOP', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '2', '166', 'U', '17', '1', '40', '2', '251', '', 1, NULL),
(110, '17111021664003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '166', 'SUMMER', '2017', 'APRIL', 'RED', 'M', 'PHOENIX WORLD TRADE CHINA', '93', '33998.9', '1.99', '', 'AU171-1102-166', 'TOP', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '2', '166', 'U', '17', '1', '40', '3', '251', '', 1, NULL),
(111, '17111021664004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '166', 'SUMMER', '2017', 'APRIL', 'RED', 'L', 'PHOENIX WORLD TRADE CHINA', '93', '33998.9', '1.99', '', 'AU171-1102-166', 'TOP', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '2', '166', 'U', '17', '1', '40', '4', '251', '', 1, NULL),
(112, '17111021668002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '166', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '86', '33998.9', '1.99', '', 'AU171-1102-166', 'TOP', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '2', '166', 'U', '17', '1', '80', '2', '251', '', 1, NULL),
(113, '17111021668003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '166', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '86', '33998.9', '1.99', '', 'AU171-1102-166', 'TOP', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '2', '166', 'U', '17', '1', '80', '3', '251', '', 1, NULL),
(114, '17111021668004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '166', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '86', '33998.9', '1.99', '', 'AU171-1102-166', 'TOP', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '2', '166', 'U', '17', '1', '80', '4', '251', '', 1, NULL),
(115, '17111060025902', 'AISHOP', 'WOMAN', 'TEXTIL', 'JACKET', '2', 'SUMMER', '2017', 'APRIL', 'GREEN PRINT', 'S', 'PHOENIX WORLD TRADE CHINA', '48', '99998.9', '7.67', '', 'AU171-1106-002', 'JACKET', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '6', '2', 'U', '17', '1', '59', '2', '251', '', 1, NULL),
(116, '17111060025903', 'AISHOP', 'WOMAN', 'TEXTIL', 'JACKET', '2', 'SUMMER', '2017', 'APRIL', 'GREEN PRINT', 'M', 'PHOENIX WORLD TRADE CHINA', '51', '99998.9', '7.67', '', 'AU171-1106-002', 'JACKET', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '6', '2', 'U', '17', '1', '59', '3', '251', '', 1, NULL),
(117, '17111060025904', 'AISHOP', 'WOMAN', 'TEXTIL', 'JACKET', '2', 'SUMMER', '2017', 'APRIL', 'GREEN PRINT', 'L', 'PHOENIX WORLD TRADE CHINA', '52', '99998.9', '7.67', '', 'AU171-1106-002', 'JACKET', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '6', '2', 'U', '17', '1', '59', '4', '251', '', 1, NULL),
(118, '17111060020802', 'AISHOP', 'WOMAN', 'TEXTIL', 'JACKET', '2', 'SUMMER', '2017', 'APRIL', 'BLUE PRINT', 'S', 'PHOENIX WORLD TRADE CHINA', '44', '99998.9', '7.67', '', 'AU171-1106-002', 'JACKET', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '6', '2', 'U', '17', '1', '8', '2', '251', '', 1, NULL),
(119, '17111060020803', 'AISHOP', 'WOMAN', 'TEXTIL', 'JACKET', '2', 'SUMMER', '2017', 'APRIL', 'BLUE PRINT', 'M', 'PHOENIX WORLD TRADE CHINA', '46', '99998.9', '7.67', '', 'AU171-1106-002', 'JACKET', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '6', '2', 'U', '17', '1', '8', '3', '251', '', 1, NULL),
(120, '17111060020804', 'AISHOP', 'WOMAN', 'TEXTIL', 'JACKET', '2', 'SUMMER', '2017', 'APRIL', 'BLUE PRINT', 'L', 'PHOENIX WORLD TRADE CHINA', '46', '99998.9', '7.67', '', 'AU171-1106-002', 'JACKET', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '6', '2', 'U', '17', '1', '8', '4', '251', '', 1, NULL),
(121, '17111020018002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '1', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '165', '44998.9', '2.63', '', 'AU171-1102-001', 'TOP', '26999.34', '44998.9', ' AU171 ', '', 'A', '1', '1', '2', '1', 'U', '17', '1', '80', '2', '251', '', 1, NULL),
(122, '17111020018003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '1', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '168', '44998.9', '2.63', '', 'AU171-1102-001', 'TOP', '26999.34', '44998.9', ' AU171 ', '', 'A', '1', '1', '2', '1', 'U', '17', '1', '80', '3', '251', '', 1, NULL),
(123, '17111020018004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '1', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '170', '44998.9', '2.63', '', 'AU171-1102-001', 'TOP', '26999.34', '44998.9', ' AU171 ', '', 'A', '1', '1', '2', '1', 'U', '17', '1', '80', '4', '251', '', 1, NULL),
(124, '17111020010102', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '1', 'SUMMER', '2017', 'APRIL', 'WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '158', '44998.9', '2.63', '', 'AU171-1102-001', 'TOP', '26999.34', '44998.9', ' AU171 ', '', 'A', '1', '1', '2', '1', 'U', '17', '1', '1', '2', '251', '', 1, NULL),
(125, '17111020010103', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '1', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '160', '44998.9', '2.63', '', 'AU171-1102-001', 'TOP', '26999.34', '44998.9', ' AU171 ', '', 'A', '1', '1', '2', '1', 'U', '17', '1', '1', '3', '251', '', 1, NULL),
(126, '17111020010104', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '1', 'SUMMER', '2017', 'APRIL', 'WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '160', '44998.9', '2.63', '', 'AU171-1102-001', 'TOP', '26999.34', '44998.9', ' AU171 ', '', 'A', '1', '1', '2', '1', 'U', '17', '1', '1', '4', '251', '', 1, NULL),
(127, '17111020010902', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '1', 'SUMMER', '2017', 'APRIL', 'AQUA', 'S', 'PHOENIX WORLD TRADE CHINA', '182', '44998.9', '2.63', '', 'AU171-1102-001', 'TOP', '26999.34', '44998.9', ' AU171 ', '', 'A', '1', '1', '2', '1', 'U', '17', '1', '9', '2', '251', '', 1, NULL),
(128, '17111020010903', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '1', 'SUMMER', '2017', 'APRIL', 'AQUA', 'M', 'PHOENIX WORLD TRADE CHINA', '180', '44998.9', '2.63', '', 'AU171-1102-001', 'TOP', '26999.34', '44998.9', ' AU171 ', '', 'A', '1', '1', '2', '1', 'U', '17', '1', '9', '3', '251', '', 1, NULL),
(129, '17111020010904', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '1', 'SUMMER', '2017', 'APRIL', 'AQUA', 'L', 'PHOENIX WORLD TRADE CHINA', '170', '44998.9', '2.63', '', 'AU171-1102-001', 'TOP', '26999.34', '44998.9', ' AU171 ', '', 'A', '1', '1', '2', '1', 'U', '17', '1', '9', '4', '251', '', 1, NULL),
(130, '17111100018002', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '1', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '116', '44998.9', '2.63', '', 'AU171-1110-001', 'PANT', '26999.34', '44998.9', ' AU171 ', '', 'A', '1', '1', '10', '1', 'U', '17', '1', '80', '2', '251', '', 1, NULL),
(131, '17111100018003', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '1', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '116', '44998.9', '2.63', '', 'AU171-1110-001', 'PANT', '26999.34', '44998.9', ' AU171 ', '', 'A', '1', '1', '10', '1', 'U', '17', '1', '80', '3', '251', '', 1, NULL),
(132, '17111100018004', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '1', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '116', '44998.9', '2.63', '', 'AU171-1110-001', 'PANT', '26999.34', '44998.9', ' AU171 ', '', 'A', '1', '1', '10', '1', 'U', '17', '1', '80', '4', '251', '', 1, NULL),
(133, '17111100132002', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '13', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '135', '76998.9', '4.94', '', 'AU171-1110-013', 'PANT', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '10', '13', 'U', '17', '1', '20', '2', '251', '', 1, NULL),
(134, '17111100132003', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '13', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '137', '76998.9', '4.94', '', 'AU171-1110-013', 'PANT', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '10', '13', 'U', '17', '1', '20', '3', '251', '', 1, NULL),
(135, '17111100132004', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '13', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '136', '76998.9', '4.94', '', 'AU171-1110-013', 'PANT', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '10', '13', 'U', '17', '1', '20', '4', '251', '', 1, NULL),
(136, '17111150098002', 'AISHOP', 'WOMAN', 'TEXTIL', 'SKIRT', '9', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '55', '79998.9', '5.46', '', 'AU171-1115-009', 'SKIRT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '15', '9', 'U', '17', '1', '80', '2', '251', '', 1, NULL),
(137, '17111150098003', 'AISHOP', 'WOMAN', 'TEXTIL', 'SKIRT', '9', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '55', '79998.9', '5.46', '', 'AU171-1115-009', 'SKIRT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '15', '9', 'U', '17', '1', '80', '3', '251', '', 1, NULL),
(138, '17111150098004', 'AISHOP', 'WOMAN', 'TEXTIL', 'SKIRT', '9', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '55', '79998.9', '5.46', '', 'AU171-1115-009', 'SKIRT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '15', '9', 'U', '17', '1', '80', '4', '251', '', 1, NULL),
(139, '17111150092002', 'AISHOP', 'WOMAN', 'TEXTIL', 'SKIRT', '9', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '55', '79998.9', '5.46', '', 'AU171-1115-009', 'SKIRT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '15', '9', 'U', '17', '1', '20', '2', '251', '', 1, NULL),
(140, '17111150092003', 'AISHOP', 'WOMAN', 'TEXTIL', 'SKIRT', '9', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '53', '79998.9', '5.46', '', 'AU171-1115-009', 'SKIRT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '15', '9', 'U', '17', '1', '20', '3', '251', '', 1, NULL),
(141, '17111150092004', 'AISHOP', 'WOMAN', 'TEXTIL', 'SKIRT', '9', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '55', '79998.9', '5.46', '', 'AU171-1115-009', 'SKIRT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '15', '9', 'U', '17', '1', '20', '4', '251', '', 1, NULL),
(142, '17111150101602', 'AISHOP', 'WOMAN', 'TEXTIL', 'SKIRT', '10', 'SUMMER', '2017', 'APRIL', 'NAVY', 'S', 'PHOENIX WORLD TRADE CHINA', '55', '84998.9', '5.78', '', 'AU171-1115-010', 'SKIRT', '50999.34', '84998.9', ' AU171 ', '', 'A', '1', '1', '15', '10', 'U', '17', '1', '16', '2', '251', '', 1, NULL),
(143, '17111150101603', 'AISHOP', 'WOMAN', 'TEXTIL', 'SKIRT', '10', 'SUMMER', '2017', 'APRIL', 'NAVY', 'M', 'PHOENIX WORLD TRADE CHINA', '55', '84998.9', '5.78', '', 'AU171-1115-010', 'SKIRT', '50999.34', '84998.9', ' AU171 ', '', 'A', '1', '1', '15', '10', 'U', '17', '1', '16', '3', '251', '', 1, NULL),
(144, '17111150101604', 'AISHOP', 'WOMAN', 'TEXTIL', 'SKIRT', '10', 'SUMMER', '2017', 'APRIL', 'NAVY', 'L', 'PHOENIX WORLD TRADE CHINA', '55', '84998.9', '5.78', '', 'AU171-1115-010', 'SKIRT', '50999.34', '84998.9', ' AU171 ', '', 'A', '1', '1', '15', '10', 'U', '17', '1', '16', '4', '251', '', 1, NULL),
(145, '17111020395302', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '85', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '53', '2', '251', '', 1, NULL),
(146, '17111020395303', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '99', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '53', '3', '251', '', 1, NULL),
(147, '17111020395304', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '87', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '53', '4', '251', '', 1, NULL),
(148, '17111020392002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '91', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '20', '2', '251', '', 1, NULL),
(149, '17111020392003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '89', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '20', '3', '251', '', 1, NULL),
(150, '17111020392004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '91', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '20', '4', '251', '', 1, NULL),
(151, '17111020393002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'S', 'PHOENIX WORLD TRADE CHINA', '85', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '30', '2', '251', '', 1, NULL),
(152, '17111020393003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'M', 'PHOENIX WORLD TRADE CHINA', '85', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '30', '3', '251', '', 1, NULL),
(153, '17111020393004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'L', 'PHOENIX WORLD TRADE CHINA', '87', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '30', '4', '251', '', 1, NULL),
(154, '17111020398002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '105', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '80', '2', '251', '', 1, NULL),
(155, '17111020398003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '104', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '80', '3', '251', '', 1, NULL),
(156, '17111020398004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '105', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '80', '4', '251', '', 1, NULL),
(157, '17111020391002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'BLUE', 'S', 'PHOENIX WORLD TRADE CHINA', '89', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '10', '2', '251', '', 1, NULL),
(158, '17111020391003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'BLUE', 'M', 'PHOENIX WORLD TRADE CHINA', '90', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '10', '3', '251', '', 1, NULL),
(159, '17111020391004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'BLUE', 'L', 'PHOENIX WORLD TRADE CHINA', '92', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '10', '4', '251', '', 1, NULL),
(160, '17111020815302', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '81', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '85', '69998.9', '4.73', '', 'AU171-1102-081', 'TOP', '41999.34', '69998.9', ' AU171 ', '', 'A', '1', '1', '2', '81', 'U', '17', '1', '53', '2', '251', '', 1, NULL),
(161, '17111020815303', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '81', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '86', '69998.9', '4.73', '', 'AU171-1102-081', 'TOP', '41999.34', '69998.9', ' AU171 ', '', 'A', '1', '1', '2', '81', 'U', '17', '1', '53', '3', '251', '', 1, NULL),
(162, '17111020815304', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '81', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '85', '69998.9', '4.73', '', 'AU171-1102-081', 'TOP', '41999.34', '69998.9', ' AU171 ', '', 'A', '1', '1', '2', '81', 'U', '17', '1', '53', '4', '251', '', 1, NULL),
(163, '17111020811002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '81', 'SUMMER', '2017', 'APRIL', 'BLUE', 'S', 'PHOENIX WORLD TRADE CHINA', '88', '69998.9', '4.73', '', 'AU171-1102-081', 'TOP', '41999.34', '69998.9', ' AU171 ', '', 'A', '1', '1', '2', '81', 'U', '17', '1', '10', '2', '251', '', 1, NULL);
INSERT INTO `product` (`id`, `cod_barra`, `marca`, `departamento`, `seccion`, `familia`, `subfamilia`, `temporada`, `ano`, `capsula`, `color`, `talla`, `proveedor`, `cantidad`, `pvptienda`, `peso`, `serie`, `referencia`, `descripcion`, `costodist`, `pvpmgta`, `carac`, `gpeso`, `codmarca`, `coddepto`, `codseccion`, `codfamilia`, `codsubfamilia`, `codtemporada`, `codano`, `codcapsula`, `codcolor`, `codtalla`, `codprov`, `descapsula`, `id_mapping`, `acumulado`) VALUES
(164, '17111020811003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '81', 'SUMMER', '2017', 'APRIL', 'BLUE', 'M', 'PHOENIX WORLD TRADE CHINA', '87', '69998.9', '4.73', '', 'AU171-1102-081', 'TOP', '41999.34', '69998.9', ' AU171 ', '', 'A', '1', '1', '2', '81', 'U', '17', '1', '10', '3', '251', '', 1, NULL),
(165, '17111020811004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '81', 'SUMMER', '2017', 'APRIL', 'BLUE', 'L', 'PHOENIX WORLD TRADE CHINA', '89', '69998.9', '4.73', '', 'AU171-1102-081', 'TOP', '41999.34', '69998.9', ' AU171 ', '', 'A', '1', '1', '2', '81', 'U', '17', '1', '10', '4', '251', '', 1, NULL),
(166, '17111020970202', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '97', 'SUMMER', '2017', 'APRIL', 'OFF WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '95', '54549.9', '3.47', '', 'AU171-1102-097', 'TOP', '32729.94', '54549.9', ' AU171 ', '', 'A', '1', '1', '2', '97', 'U', '17', '1', '2', '2', '251', '', 1, NULL),
(167, '17111020970203', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '97', 'SUMMER', '2017', 'APRIL', 'OFF WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '98', '54549.9', '3.47', '', 'AU171-1102-097', 'TOP', '32729.94', '54549.9', ' AU171 ', '', 'A', '1', '1', '2', '97', 'U', '17', '1', '2', '3', '251', '', 1, NULL),
(168, '17111020970204', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '97', 'SUMMER', '2017', 'APRIL', 'OFF WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '96', '54549.9', '3.47', '', 'AU171-1102-097', 'TOP', '32729.94', '54549.9', ' AU171 ', '', 'A', '1', '1', '2', '97', 'U', '17', '1', '2', '4', '251', '', 1, NULL),
(169, '17111020978002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '97', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '88', '54549.9', '3.47', '', 'AU171-1102-097', 'TOP', '32729.94', '54549.9', ' AU171 ', '', 'A', '1', '1', '2', '97', 'U', '17', '1', '80', '2', '251', '', 1, NULL),
(170, '17111020978003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '97', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '79', '54549.9', '3.47', '', 'AU171-1102-097', 'TOP', '32729.94', '54549.9', ' AU171 ', '', 'A', '1', '1', '2', '97', 'U', '17', '1', '80', '3', '251', '', 1, NULL),
(171, '17111020978004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '97', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '88', '54549.9', '3.47', '', 'AU171-1102-097', 'TOP', '32729.94', '54549.9', ' AU171 ', '', 'A', '1', '1', '2', '97', 'U', '17', '1', '80', '4', '251', '', 1, NULL),
(172, '17111130061002', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '6', 'SUMMER', '2017', 'APRIL', 'BLUE', 'S', 'PHOENIX WORLD TRADE CHINA', '54', '86998.9', '6.3', '', 'AU171-1113-006', 'SHORT', '52199.34', '86998.9', ' AU171 ', '', 'A', '1', '1', '13', '6', 'U', '17', '1', '10', '2', '251', '', 1, NULL),
(173, '17111130061003', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '6', 'SUMMER', '2017', 'APRIL', 'BLUE', 'M', 'PHOENIX WORLD TRADE CHINA', '54', '86998.9', '6.3', '', 'AU171-1113-006', 'SHORT', '52199.34', '86998.9', ' AU171 ', '', 'A', '1', '1', '13', '6', 'U', '17', '1', '10', '3', '251', '', 1, NULL),
(174, '17111130061004', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '6', 'SUMMER', '2017', 'APRIL', 'BLUE', 'L', 'PHOENIX WORLD TRADE CHINA', '53', '86998.9', '6.3', '', 'AU171-1113-006', 'SHORT', '52199.34', '86998.9', ' AU171 ', '', 'A', '1', '1', '13', '6', 'U', '17', '1', '10', '4', '251', '', 1, NULL),
(175, '17111130061202', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '6', 'SUMMER', '2017', 'APRIL', 'LIGHT BLUE', 'S', 'PHOENIX WORLD TRADE CHINA', '53', '86998.9', '6.3', '', 'AU171-1113-006', 'SHORT', '52199.34', '86998.9', ' AU171 ', '', 'A', '1', '1', '13', '6', 'U', '17', '1', '12', '2', '251', '', 1, NULL),
(176, '17111130061203', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '6', 'SUMMER', '2017', 'APRIL', 'LIGHT BLUE', 'M', 'PHOENIX WORLD TRADE CHINA', '54', '86998.9', '6.3', '', 'AU171-1113-006', 'SHORT', '52199.34', '86998.9', ' AU171 ', '', 'A', '1', '1', '13', '6', 'U', '17', '1', '12', '3', '251', '', 1, NULL),
(177, '17111130061204', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '6', 'SUMMER', '2017', 'APRIL', 'LIGHT BLUE', 'L', 'PHOENIX WORLD TRADE CHINA', '54', '86998.9', '6.3', '', 'AU171-1113-006', 'SHORT', '52199.34', '86998.9', ' AU171 ', '', 'A', '1', '1', '13', '6', 'U', '17', '1', '12', '4', '251', '', 1, NULL),
(178, '17111020845302', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '84', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '77', '68998.9', '4.73', '', 'AU171-1102-084', 'TOP', '41399.34', '68998.9', ' AU171 ', '', 'A', '1', '1', '2', '84', 'U', '17', '1', '53', '2', '251', '', 1, NULL),
(179, '17111020845303', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '84', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '72', '68998.9', '4.73', '', 'AU171-1102-084', 'TOP', '41399.34', '68998.9', ' AU171 ', '', 'A', '1', '1', '2', '84', 'U', '17', '1', '53', '3', '251', '', 1, NULL),
(180, '17111020845304', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '84', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '78', '68998.9', '4.73', '', 'AU171-1102-084', 'TOP', '41399.34', '68998.9', ' AU171 ', '', 'A', '1', '1', '2', '84', 'U', '17', '1', '53', '4', '251', '', 1, NULL),
(181, '17111020840102', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '84', 'SUMMER', '2017', 'APRIL', 'WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '93', '68998.9', '4.73', '', 'AU171-1102-084', 'TOP', '41399.34', '68998.9', ' AU171 ', '', 'A', '1', '1', '2', '84', 'U', '17', '1', '1', '2', '251', '', 1, NULL),
(182, '17111020840103', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '84', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '87', '68998.9', '4.73', '', 'AU171-1102-084', 'TOP', '41399.34', '68998.9', ' AU171 ', '', 'A', '1', '1', '2', '84', 'U', '17', '1', '1', '3', '251', '', 1, NULL),
(183, '17111020840104', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '84', 'SUMMER', '2017', 'APRIL', 'WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '99', '68998.9', '4.73', '', 'AU171-1102-084', 'TOP', '41399.34', '68998.9', ' AU171 ', '', 'A', '1', '1', '2', '84', 'U', '17', '1', '1', '4', '251', '', 1, NULL),
(184, '17111020848002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '84', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '94', '68998.9', '4.73', '', 'AU171-1102-084', 'TOP', '41399.34', '68998.9', ' AU171 ', '', 'A', '1', '1', '2', '84', 'U', '17', '1', '80', '2', '251', '', 1, NULL),
(185, '17111020848003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '84', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '98', '68998.9', '4.73', '', 'AU171-1102-084', 'TOP', '41399.34', '68998.9', ' AU171 ', '', 'A', '1', '1', '2', '84', 'U', '17', '1', '80', '3', '251', '', 1, NULL),
(186, '17111020848004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '84', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '98', '68998.9', '4.73', '', 'AU171-1102-084', 'TOP', '41399.34', '68998.9', ' AU171 ', '', 'A', '1', '1', '2', '84', 'U', '17', '1', '80', '4', '251', '', 1, NULL),
(187, '17111020842002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '84', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '83', '68998.9', '4.73', '', 'AU171-1102-084', 'TOP', '41399.34', '68998.9', ' AU171 ', '', 'A', '1', '1', '2', '84', 'U', '17', '1', '20', '2', '251', '', 1, NULL),
(188, '17111020842003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '84', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '83', '68998.9', '4.73', '', 'AU171-1102-084', 'TOP', '41399.34', '68998.9', ' AU171 ', '', 'A', '1', '1', '2', '84', 'U', '17', '1', '20', '3', '251', '', 1, NULL),
(189, '17111020842004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '84', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '85', '68998.9', '4.73', '', 'AU171-1102-084', 'TOP', '41399.34', '68998.9', ' AU171 ', '', 'A', '1', '1', '2', '84', 'U', '17', '1', '20', '4', '251', '', 1, NULL),
(190, '17111020535302', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '53', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '91', '59998.9', '4.2', '', 'AU171-1102-053', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '53', 'U', '17', '1', '53', '2', '251', '', 1, NULL),
(191, '17111020535303', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '53', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '95', '59998.9', '4.2', '', 'AU171-1102-053', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '53', 'U', '17', '1', '53', '3', '251', '', 1, NULL),
(192, '17111020535304', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '53', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '92', '59998.9', '4.2', '', 'AU171-1102-053', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '53', 'U', '17', '1', '53', '4', '251', '', 1, NULL),
(193, '17111020532002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '53', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '92', '59998.9', '4.2', '', 'AU171-1102-053', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '53', 'U', '17', '1', '20', '2', '251', '', 1, NULL),
(194, '17111020532003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '53', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '92', '59998.9', '4.2', '', 'AU171-1102-053', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '53', 'U', '17', '1', '20', '3', '251', '', 1, NULL),
(195, '17111020532004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '53', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '92', '59998.9', '4.2', '', 'AU171-1102-053', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '53', 'U', '17', '1', '20', '4', '251', '', 1, NULL),
(196, '17111020545302', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '54', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '92', '76998.9', '5.25', '', 'AU171-1102-054', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '54', 'U', '17', '1', '53', '2', '251', '', 1, NULL),
(197, '17111020545303', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '54', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '93', '76998.9', '5.25', '', 'AU171-1102-054', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '54', 'U', '17', '1', '53', '3', '251', '', 1, NULL),
(198, '17111020545304', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '54', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '93', '76998.9', '5.25', '', 'AU171-1102-054', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '54', 'U', '17', '1', '53', '4', '251', '', 1, NULL),
(199, '17111020540102', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '54', 'SUMMER', '2017', 'APRIL', 'WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '91', '76998.9', '5.25', '', 'AU171-1102-054', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '54', 'U', '17', '1', '1', '2', '251', '', 1, NULL),
(200, '17111020540103', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '54', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '90', '76998.9', '5.25', '', 'AU171-1102-054', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '54', 'U', '17', '1', '1', '3', '251', '', 1, NULL),
(201, '17111020540104', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '54', 'SUMMER', '2017', 'APRIL', 'WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '92', '76998.9', '5.25', '', 'AU171-1102-054', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '54', 'U', '17', '1', '1', '4', '251', '', 1, NULL),
(202, '17111020372002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '37', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '81', '65879.9', '4.2', '', 'AU171-1102-037', 'TOP', '39527.94', '65879.9', ' AU171 ', '', 'A', '1', '1', '2', '37', 'U', '17', '1', '20', '2', '251', '', 1, NULL),
(203, '17111020372003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '37', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '74', '65879.9', '4.2', '', 'AU171-1102-037', 'TOP', '39527.94', '65879.9', ' AU171 ', '', 'A', '1', '1', '2', '37', 'U', '17', '1', '20', '3', '251', '', 1, NULL),
(204, '17111020372004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '37', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '77', '65879.9', '4.2', '', 'AU171-1102-037', 'TOP', '39527.94', '65879.9', ' AU171 ', '', 'A', '1', '1', '2', '37', 'U', '17', '1', '20', '4', '251', '', 1, NULL),
(205, '17111020375302', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '37', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '90', '65879.9', '4.2', '', 'AU171-1102-037', 'TOP', '39527.94', '65879.9', ' AU171 ', '', 'A', '1', '1', '2', '37', 'U', '17', '1', '53', '2', '251', '', 1, NULL),
(206, '17111020375303', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '37', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '91', '65879.9', '4.2', '', 'AU171-1102-037', 'TOP', '39527.94', '65879.9', ' AU171 ', '', 'A', '1', '1', '2', '37', 'U', '17', '1', '53', '3', '251', '', 1, NULL),
(207, '17111020375304', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '37', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '91', '65879.9', '4.2', '', 'AU171-1102-037', 'TOP', '39527.94', '65879.9', ' AU171 ', '', 'A', '1', '1', '2', '37', 'U', '17', '1', '53', '4', '251', '', 1, NULL),
(208, '17111020380202', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '38', 'SUMMER', '2017', 'APRIL', 'OFF WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '73', '69549.9', '4.73', '', 'AU171-1102-038', 'TOP', '41729.94', '69549.9', ' AU171 ', '', 'A', '1', '1', '2', '38', 'U', '17', '1', '2', '2', '251', '', 1, NULL),
(209, '17111020380203', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '38', 'SUMMER', '2017', 'APRIL', 'OFF WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '76', '69549.9', '4.73', '', 'AU171-1102-038', 'TOP', '41729.94', '69549.9', ' AU171 ', '', 'A', '1', '1', '2', '38', 'U', '17', '1', '2', '3', '251', '', 1, NULL),
(210, '17111020380204', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '38', 'SUMMER', '2017', 'APRIL', 'OFF WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '73', '69549.9', '4.73', '', 'AU171-1102-038', 'TOP', '41729.94', '69549.9', ' AU171 ', '', 'A', '1', '1', '2', '38', 'U', '17', '1', '2', '4', '251', '', 1, NULL),
(211, '17111100118002', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '11', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '97', '99998.9', '7.35', '', 'AU171-1110-011', 'PANT', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '10', '11', 'U', '17', '1', '80', '2', '251', '', 1, NULL),
(212, '17111100118003', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '11', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '100', '99998.9', '7.35', '', 'AU171-1110-011', 'PANT', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '10', '11', 'U', '17', '1', '80', '3', '251', '', 1, NULL),
(213, '17111100118004', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '11', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '100', '99998.9', '7.35', '', 'AU171-1110-011', 'PANT', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '10', '11', 'U', '17', '1', '80', '4', '251', '', 1, NULL),
(214, '17111100115302', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '11', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '98', '99998.9', '7.35', '', 'AU171-1110-011', 'PANT', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '10', '11', 'U', '17', '1', '53', '2', '251', '', 1, NULL),
(215, '17111100115303', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '11', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '100', '99998.9', '7.35', '', 'AU171-1110-011', 'PANT', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '10', '11', 'U', '17', '1', '53', '3', '251', '', 1, NULL),
(216, '17111100115304', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '11', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '100', '99998.9', '7.35', '', 'AU171-1110-011', 'PANT', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '10', '11', 'U', '17', '1', '53', '4', '251', '', 1, NULL),
(217, '17111100110202', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '11', 'SUMMER', '2017', 'APRIL', 'OFF WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '101', '99998.9', '7.35', '', 'AU171-1110-011', 'PANT', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '10', '11', 'U', '17', '1', '2', '2', '251', '', 1, NULL),
(218, '17111100110203', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '11', 'SUMMER', '2017', 'APRIL', 'OFF WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '101', '99998.9', '7.35', '', 'AU171-1110-011', 'PANT', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '10', '11', 'U', '17', '1', '2', '3', '251', '', 1, NULL),
(219, '17111100110204', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '11', 'SUMMER', '2017', 'APRIL', 'OFF WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '104', '99998.9', '7.35', '', 'AU171-1110-011', 'PANT', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '10', '11', 'U', '17', '1', '2', '4', '251', '', 1, NULL),
(220, '17111100120102', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '12', 'SUMMER', '2017', 'APRIL', 'WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '98', '89998.9', '6.3', '', 'AU171-1110-012', 'PANT', '53999.34', '89998.9', ' AU171 ', '', 'A', '1', '1', '10', '12', 'U', '17', '1', '1', '2', '251', '', 1, NULL),
(221, '17111100120103', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '12', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '100', '89998.9', '6.3', '', 'AU171-1110-012', 'PANT', '53999.34', '89998.9', ' AU171 ', '', 'A', '1', '1', '10', '12', 'U', '17', '1', '1', '3', '251', '', 1, NULL),
(222, '17111100120104', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '12', 'SUMMER', '2017', 'APRIL', 'WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '100', '89998.9', '6.3', '', 'AU171-1110-012', 'PANT', '53999.34', '89998.9', ' AU171 ', '', 'A', '1', '1', '10', '12', 'U', '17', '1', '1', '4', '251', '', 1, NULL),
(223, '17111100128002', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '12', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '95', '89998.9', '6.3', '', 'AU171-1110-012', 'PANT', '53999.34', '89998.9', ' AU171 ', '', 'A', '1', '1', '10', '12', 'U', '17', '1', '80', '2', '251', '', 1, NULL),
(224, '17111100128003', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '12', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '98', '89998.9', '6.3', '', 'AU171-1110-012', 'PANT', '53999.34', '89998.9', ' AU171 ', '', 'A', '1', '1', '10', '12', 'U', '17', '1', '80', '3', '251', '', 1, NULL),
(225, '17111100128004', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '12', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '98', '89998.9', '6.3', '', 'AU171-1110-012', 'PANT', '53999.34', '89998.9', ' AU171 ', '', 'A', '1', '1', '10', '12', 'U', '17', '1', '80', '4', '251', '', 1, NULL),
(226, '17111170075302', 'AISHOP', 'WOMAN', 'TEXTIL', 'DRESS', '7', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '48', '99998.9', '7.35', '', 'AU171-1117-007', 'DRESS', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '17', '7', 'U', '17', '1', '53', '2', '251', '', 1, NULL),
(227, '17111170075303', 'AISHOP', 'WOMAN', 'TEXTIL', 'DRESS', '7', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '48', '99998.9', '7.35', '', 'AU171-1117-007', 'DRESS', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '17', '7', 'U', '17', '1', '53', '3', '251', '', 1, NULL),
(228, '17111170075304', 'AISHOP', 'WOMAN', 'TEXTIL', 'DRESS', '7', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '48', '99998.9', '7.35', '', 'AU171-1117-007', 'DRESS', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '17', '7', 'U', '17', '1', '53', '4', '251', '', 1, NULL),
(229, '17111170078002', 'AISHOP', 'WOMAN', 'TEXTIL', 'DRESS', '7', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '47', '99998.9', '7.35', '', 'AU171-1117-007', 'DRESS', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '17', '7', 'U', '17', '1', '80', '2', '251', '', 1, NULL),
(230, '17111170078003', 'AISHOP', 'WOMAN', 'TEXTIL', 'DRESS', '7', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '48', '99998.9', '7.35', '', 'AU171-1117-007', 'DRESS', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '17', '7', 'U', '17', '1', '80', '3', '251', '', 1, NULL),
(231, '17111170078004', 'AISHOP', 'WOMAN', 'TEXTIL', 'DRESS', '7', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '49', '99998.9', '7.35', '', 'AU171-1117-007', 'DRESS', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '17', '7', 'U', '17', '1', '80', '4', '251', '', 1, NULL),
(232, '17111020325302', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '32', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '89', '59998.9', '3.89', '', 'AU171-1102-032', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '32', 'U', '17', '1', '53', '2', '251', '', 1, NULL),
(233, '17111020325303', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '32', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '91', '59998.9', '3.89', '', 'AU171-1102-032', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '32', 'U', '17', '1', '53', '3', '251', '', 1, NULL),
(234, '17111020325304', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '32', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '91', '59998.9', '3.89', '', 'AU171-1102-032', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '32', 'U', '17', '1', '53', '4', '251', '', 1, NULL),
(235, '17111020328202', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '32', 'SUMMER', '2017', 'APRIL', 'GREY', 'S', 'PHOENIX WORLD TRADE CHINA', '88', '59998.9', '3.89', '', 'AU171-1102-032', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '32', 'U', '17', '1', '82', '2', '251', '', 1, NULL),
(236, '17111020328203', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '32', 'SUMMER', '2017', 'APRIL', 'GREY', 'M', 'PHOENIX WORLD TRADE CHINA', '89', '59998.9', '3.89', '', 'AU171-1102-032', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '32', 'U', '17', '1', '82', '3', '251', '', 1, NULL),
(237, '17111020328204', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '32', 'SUMMER', '2017', 'APRIL', 'GREY', 'L', 'PHOENIX WORLD TRADE CHINA', '90', '59998.9', '3.89', '', 'AU171-1102-032', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '32', 'U', '17', '1', '82', '4', '251', '', 1, NULL),
(238, '17111020085302', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '8', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '81', '35998.9', '2.1', '', 'AU171-1102-008', 'TOP', '21599.34', '35998.9', ' AU171 ', '', 'A', '1', '1', '2', '8', 'U', '17', '1', '53', '2', '251', '', 1, NULL),
(239, '17111020085303', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '8', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '81', '35998.9', '2.1', '', 'AU171-1102-008', 'TOP', '21599.34', '35998.9', ' AU171 ', '', 'A', '1', '1', '2', '8', 'U', '17', '1', '53', '3', '251', '', 1, NULL),
(240, '17111020085304', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '8', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '81', '35998.9', '2.1', '', 'AU171-1102-008', 'TOP', '21599.34', '35998.9', ' AU171 ', '', 'A', '1', '1', '2', '8', 'U', '17', '1', '53', '4', '251', '', 1, NULL),
(241, '17111020082002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '8', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '88', '35998.9', '2.1', '', 'AU171-1102-008', 'TOP', '21599.34', '35998.9', ' AU171 ', '', 'A', '1', '1', '2', '8', 'U', '17', '1', '20', '2', '251', '', 1, NULL),
(242, '17111020082003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '8', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '88', '35998.9', '2.1', '', 'AU171-1102-008', 'TOP', '21599.34', '35998.9', ' AU171 ', '', 'A', '1', '1', '2', '8', 'U', '17', '1', '20', '3', '251', '', 1, NULL),
(243, '17111020082004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '8', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '90', '35998.9', '2.1', '', 'AU171-1102-008', 'TOP', '21599.34', '35998.9', ' AU171 ', '', 'A', '1', '1', '2', '8', 'U', '17', '1', '20', '4', '251', '', 1, NULL),
(244, '17111020080202', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '8', 'SUMMER', '2017', 'APRIL', 'OFF WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '80', '35998.9', '2.1', '', 'AU171-1102-008', 'TOP', '21599.34', '35998.9', ' AU171 ', '', 'A', '1', '1', '2', '8', 'U', '17', '1', '2', '2', '251', '', 1, NULL),
(245, '17111020080203', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '8', 'SUMMER', '2017', 'APRIL', 'OFF WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '74', '35998.9', '2.1', '', 'AU171-1102-008', 'TOP', '21599.34', '35998.9', ' AU171 ', '', 'A', '1', '1', '2', '8', 'U', '17', '1', '2', '3', '251', '', 1, NULL),
(246, '17111020080204', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '8', 'SUMMER', '2017', 'APRIL', 'OFF WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '90', '35998.9', '2.1', '', 'AU171-1102-008', 'TOP', '21599.34', '35998.9', ' AU171 ', '', 'A', '1', '1', '2', '8', 'U', '17', '1', '2', '4', '251', '', 1, NULL),
(247, '17111020093002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'S', 'PHOENIX WORLD TRADE CHINA', '116', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '30', '2', '251', '', 1, NULL),
(248, '17111020093003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'M', 'PHOENIX WORLD TRADE CHINA', '124', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '30', '3', '251', '', 1, NULL),
(249, '17111020093004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'L', 'PHOENIX WORLD TRADE CHINA', '118', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '30', '4', '251', '', 1, NULL),
(250, '17111020095302', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '111', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '53', '2', '251', '', 1, NULL),
(251, '17111020095303', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '110', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '53', '3', '251', '', 1, NULL),
(252, '17111020095304', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '113', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '53', '4', '251', '', 1, NULL),
(253, '17111020098002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '140', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '80', '2', '251', '', 1, 106),
(254, '17111020098003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '139', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '80', '3', '251', '', 1, NULL),
(255, '17111020098004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '147', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '80', '4', '251', '', 1, NULL),
(256, '17111020090102', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '144', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '1', '2', '251', '', 1, NULL),
(257, '17111020090103', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '155', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '1', '3', '251', '', 1, NULL),
(258, '17111020090104', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '142', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '1', '4', '251', '', 1, 113),
(259, 'PIPPA1647454', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '142', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '1', '4', '251', '', 1, 26),
(260, '17111030011788', 'Aishop', 'WOMAN', 'JEWELRY', 'RING', '003', 'SPRING', '2015', 'JANUARY', 'WHITE', 'XS', 'GRUPO DUMIT ALMACEN PRINCIPAL', '233', NULL, NULL, NULL, 'AU171-1102-009', 'asdas', NULL, NULL, 'asda', NULL, NULL, '1', '3', '01', '003', 'S', '15', '1', '01', '01', '1', NULL, 1, 78),
(269, '17111030011799', 'Aishop', 'WOMAN', 'TEXTIL', 'BLOUSE', '000', 'SPRING', '2015', 'JANUARY', 'WHITE', 'XS', 'GRUPO DUMIT ALMACEN PRINCIPAL', '200', NULL, NULL, NULL, NULL, 'Alguna', NULL, NULL, 'algo', NULL, NULL, '1', '1', '01', '000', 'S', '15', '1', '01', '01', '1', NULL, NULL, 1),
(270, '17111030011999', 'Aishop', 'WOMAN', 'TEXTIL', 'BLOUSE', '000', 'SPRING', '2015', 'JANUARY', 'WHITE', 'XS', 'GRUPO DUMIT ALMACEN PRINCIPAL', '200', NULL, NULL, NULL, NULL, 'das', NULL, NULL, 'as', NULL, NULL, '1', '1', '01', '000', 'S', '15', '1', '01', '01', '1', NULL, NULL, 1),
(271, '17111020098099', 'Aishop', 'WOMAN', 'TEXTIL', 'BLOUSE', '000', 'SPRING', '2015', 'JANUARY', 'WHITE', 'XS', 'GRUPO DUMIT ALMACEN PRINCIPAL', '200', NULL, NULL, NULL, NULL, 'asdas', NULL, NULL, 'asd', NULL, NULL, '1', '1', '01', '000', 'S', '15', '1', '01', '01', '1', NULL, 1, 3),
(272, '17111030011702', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'TURQUOISE', 'S', 'PHOENIX WORLD TRADE CHINA', '199', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '17', '2', '251', '', 3, NULL),
(273, '17111030011703', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'TURQUOISE', 'M', 'PHOENIX WORLD TRADE CHINA', '199', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '17', '3', '251', '', 3, NULL),
(274, '17111030011704', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'TURQUOISE', 'L', 'PHOENIX WORLD TRADE CHINA', '198', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '17', '4', '251', '', 3, 193),
(275, '17111030012002', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '205', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '20', '2', '251', '', 3, 180),
(276, '17111030012003', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '194', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '20', '3', '251', '', 3, 84),
(277, '17111030012004', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '198', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '20', '4', '251', '', 3, 87),
(278, '17111030015302', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '200', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '53', '2', '251', '', 3, NULL),
(279, '17111030015303', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '201', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '53', '3', '251', '', 3, NULL),
(280, '17111030015304', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '178', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '53', '4', '251', '', 3, NULL),
(281, '17111030013002', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'S', 'PHOENIX WORLD TRADE CHINA', '200', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '30', '2', '251', '', 3, NULL),
(282, '17111030013003', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'M', 'PHOENIX WORLD TRADE CHINA', '242', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '30', '3', '251', '', 3, NULL),
(283, '17111030013004', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'L', 'PHOENIX WORLD TRADE CHINA', '200', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '30', '4', '251', '', 3, NULL),
(284, '17111030010102', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '214', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '1', '2', '251', '', 3, NULL),
(285, '17111030010103', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '224', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '1', '3', '251', '', 3, NULL),
(286, '17111030010104', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '222', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '1', '4', '251', '', 3, NULL),
(287, '17111030018002', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '220', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '80', '2', '251', '', 3, NULL),
(288, '17111030018003', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '220', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '80', '3', '251', '', 3, NULL),
(289, '17111030018004', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '1', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '221', '33998.9', '2.26', '', 'AU171-1103-001', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '1', 'U', '17', '1', '80', '4', '251', '', 3, NULL),
(290, '17111023211702', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'TURQUOISE', 'S', 'PHOENIX WORLD TRADE CHINA', '242', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '17', '2', '251', '', 3, NULL),
(291, '17111023211703', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'TURQUOISE', 'M', 'PHOENIX WORLD TRADE CHINA', '238', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '17', '3', '251', '', 3, NULL),
(292, '17111023211704', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'TURQUOISE', 'L', 'PHOENIX WORLD TRADE CHINA', '236', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '17', '4', '251', '', 3, NULL),
(293, '17111023212002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '240', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '20', '2', '251', '', 3, NULL),
(294, '17111023212003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '227', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '20', '3', '251', '', 3, NULL),
(295, '17111023212004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '234', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '20', '4', '251', '', 3, NULL),
(296, '17111023215302', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '239', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '53', '2', '251', '', 3, NULL),
(297, '17111023215303', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '238', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '53', '3', '251', '', 3, NULL),
(298, '17111023215304', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '247', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '53', '4', '251', '', 3, NULL),
(299, '17111023213002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'S', 'PHOENIX WORLD TRADE CHINA', '248', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '30', '2', '251', '', 3, NULL),
(300, '17111023213003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'M', 'PHOENIX WORLD TRADE CHINA', '238', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '30', '3', '251', '', 3, NULL),
(301, '17111023213004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'L', 'PHOENIX WORLD TRADE CHINA', '238', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '30', '4', '251', '', 3, NULL),
(302, '17111023210102', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '258', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '1', '2', '251', '', 3, NULL),
(303, '17111023210103', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '269', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '1', '3', '251', '', 3, NULL),
(304, '17111023210104', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '248', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '1', '4', '251', '', 3, NULL),
(305, '17111023218002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '262', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '80', '2', '251', '', 3, NULL),
(306, '17111023218003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '260', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '80', '3', '251', '', 3, NULL),
(307, '17111023218004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '321', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '264', '27998.9', '1.68', '', 'AU171-1102-321', 'TOP', '16799.34', '27998.9', ' AU171 ', '', 'A', '1', '1', '2', '321', 'U', '17', '1', '80', '4', '251', '', 3, NULL),
(308, '17111030021702', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'TURQUOISE', 'S', 'PHOENIX WORLD TRADE CHINA', '232', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '17', '2', '251', '', 3, NULL),
(309, '17111030021703', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'TURQUOISE', 'M', 'PHOENIX WORLD TRADE CHINA', '236', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '17', '3', '251', '', 3, NULL),
(310, '17111030021704', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'TURQUOISE', 'L', 'PHOENIX WORLD TRADE CHINA', '224', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '17', '4', '251', '', 3, NULL),
(311, '17111030022002', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '244', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '20', '2', '251', '', 3, NULL),
(312, '17111030022003', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '240', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '20', '3', '251', '', 3, NULL),
(313, '17111030022004', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '247', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '20', '4', '251', '', 3, NULL),
(314, '17111030025302', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '232', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '53', '2', '251', '', 3, NULL),
(315, '17111030025303', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '231', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '53', '3', '251', '', 3, NULL),
(316, '17111030025304', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '232', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '53', '4', '251', '', 3, NULL),
(317, '17111030023002', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'S', 'PHOENIX WORLD TRADE CHINA', '232', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '30', '2', '251', '', 3, NULL),
(318, '17111030023003', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'M', 'PHOENIX WORLD TRADE CHINA', '229', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '30', '3', '251', '', 3, NULL),
(319, '17111030023004', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'L', 'PHOENIX WORLD TRADE CHINA', '232', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '30', '4', '251', '', 3, NULL),
(320, '17111030020102', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '254', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '1', '2', '251', '', 3, NULL),
(321, '17111030020103', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '247', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '1', '3', '251', '', 3, NULL),
(322, '17111030020104', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '256', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '1', '4', '251', '', 3, NULL),
(323, '17111030028002', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '253', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '80', '2', '251', '', 3, NULL),
(324, '17111030028003', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '257', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '80', '3', '251', '', 3, NULL),
(325, '17111030028004', 'AISHOP', 'WOMAN', 'TEXTIL', 'T-SHIRT', '2', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '255', '33998.9', '2.26', '', 'AU171-1103-002', 'T-SHIRT', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '3', '2', 'U', '17', '1', '80', '4', '251', '', 3, NULL),
(326, '17111023222002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '322', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '146', '32998.9', '1.99', '', 'AU171-1102-322', 'TOP', '19799.34', '32998.9', ' AU171 ', '', 'A', '1', '1', '2', '322', 'U', '17', '1', '20', '2', '251', '', 3, NULL),
(327, '17111023222003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '322', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '145', '32998.9', '1.99', '', 'AU171-1102-322', 'TOP', '19799.34', '32998.9', ' AU171 ', '', 'A', '1', '1', '2', '322', 'U', '17', '1', '20', '3', '251', '', 3, NULL),
(328, '17111023222004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '322', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '150', '32998.9', '1.99', '', 'AU171-1102-322', 'TOP', '19799.34', '32998.9', ' AU171 ', '', 'A', '1', '1', '2', '322', 'U', '17', '1', '20', '4', '251', '', 3, NULL),
(329, '17111021002002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '100', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '147', '37549.9', '2.47', '', 'AU171-1102-100', 'TOP', '22529.94', '37549.9', ' AU171 ', '', 'A', '1', '1', '2', '100', 'U', '17', '1', '20', '2', '251', '', 3, NULL),
(330, '17111021002003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '100', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '148', '37549.9', '2.47', '', 'AU171-1102-100', 'TOP', '22529.94', '37549.9', ' AU171 ', '', 'A', '1', '1', '2', '100', 'U', '17', '1', '20', '3', '251', '', 3, NULL),
(331, '17111021002004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '100', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '148', '37549.9', '2.47', '', 'AU171-1102-100', 'TOP', '22529.94', '37549.9', ' AU171 ', '', 'A', '1', '1', '2', '100', 'U', '17', '1', '20', '4', '251', '', 3, NULL),
(332, '17111021108002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '110', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '81', '76998.9', '5.25', '', 'AU171-1102-110', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '110', 'U', '17', '1', '80', '2', '251', '', 3, NULL),
(333, '17111021108003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '110', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '81', '76998.9', '5.25', '', 'AU171-1102-110', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '110', 'U', '17', '1', '80', '3', '251', '', 3, NULL),
(334, '17111021108004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '110', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '81', '76998.9', '5.25', '', 'AU171-1102-110', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '110', 'U', '17', '1', '80', '4', '251', '', 3, NULL);
INSERT INTO `product` (`id`, `cod_barra`, `marca`, `departamento`, `seccion`, `familia`, `subfamilia`, `temporada`, `ano`, `capsula`, `color`, `talla`, `proveedor`, `cantidad`, `pvptienda`, `peso`, `serie`, `referencia`, `descripcion`, `costodist`, `pvpmgta`, `carac`, `gpeso`, `codmarca`, `coddepto`, `codseccion`, `codfamilia`, `codsubfamilia`, `codtemporada`, `codano`, `codcapsula`, `codcolor`, `codtalla`, `codprov`, `descapsula`, `id_mapping`, `acumulado`) VALUES
(335, '17111021100102', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '110', 'SUMMER', '2017', 'APRIL', 'WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '81', '76998.9', '5.25', '', 'AU171-1102-110', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '110', 'U', '17', '1', '1', '2', '251', '', 3, NULL),
(336, '17111021100103', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '110', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '80', '76998.9', '5.25', '', 'AU171-1102-110', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '110', 'U', '17', '1', '1', '3', '251', '', 3, NULL),
(337, '17111021100104', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '110', 'SUMMER', '2017', 'APRIL', 'WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '82', '76998.9', '5.25', '', 'AU171-1102-110', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '110', 'U', '17', '1', '1', '4', '251', '', 3, NULL),
(338, '17111021105302', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '110', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '81', '76998.9', '5.25', '', 'AU171-1102-110', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '110', 'U', '17', '1', '53', '2', '251', '', 3, NULL),
(339, '17111021105303', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '110', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '82', '76998.9', '5.25', '', 'AU171-1102-110', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '110', 'U', '17', '1', '53', '3', '251', '', 3, NULL),
(340, '17111021105304', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '110', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '79', '76998.9', '5.25', '', 'AU171-1102-110', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '110', 'U', '17', '1', '53', '4', '251', '', 3, NULL),
(341, '17111130138002', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '13', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '59', '79998.9', '5.78', '', 'AU171-1113-013', 'SHORT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '13', '13', 'U', '17', '1', '80', '2', '251', '', 3, NULL),
(342, '17111130138003', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '13', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '61', '79998.9', '5.78', '', 'AU171-1113-013', 'SHORT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '13', '13', 'U', '17', '1', '80', '3', '251', '', 3, NULL),
(343, '17111130138004', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '13', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '54', '79998.9', '5.78', '', 'AU171-1113-013', 'SHORT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '13', '13', 'U', '17', '1', '80', '4', '251', '', 3, NULL),
(344, '17111130136502', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '13', 'SUMMER', '2017', 'APRIL', 'LIME', 'S', 'PHOENIX WORLD TRADE CHINA', '52', '79998.9', '5.78', '', 'AU171-1113-013', 'SHORT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '13', '13', 'U', '17', '1', '65', '2', '251', '', 3, NULL),
(345, '17111130136503', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '13', 'SUMMER', '2017', 'APRIL', 'LIME', 'M', 'PHOENIX WORLD TRADE CHINA', '53', '79998.9', '5.78', '', 'AU171-1113-013', 'SHORT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '13', '13', 'U', '17', '1', '65', '3', '251', '', 3, NULL),
(346, '17111130136504', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '13', 'SUMMER', '2017', 'APRIL', 'LIME', 'L', 'PHOENIX WORLD TRADE CHINA', '51', '79998.9', '5.78', '', 'AU171-1113-013', 'SHORT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '13', '13', 'U', '17', '1', '65', '4', '251', '', 3, NULL),
(347, '17111130135302', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '13', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '51', '79998.9', '5.78', '', 'AU171-1113-013', 'SHORT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '13', '13', 'U', '17', '1', '53', '2', '251', '', 3, NULL),
(348, '17111130135303', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '13', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '49', '79998.9', '5.78', '', 'AU171-1113-013', 'SHORT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '13', '13', 'U', '17', '1', '53', '3', '251', '', 3, NULL),
(349, '17111130135304', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '13', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '50', '79998.9', '5.78', '', 'AU171-1113-013', 'SHORT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '13', '13', 'U', '17', '1', '53', '4', '251', '', 3, NULL),
(350, '17111050038202', 'AISHOP', 'WOMAN', 'TEXTIL', 'SWEATER', '3', 'SUMMER', '2017', 'APRIL', 'GREY', 'S', 'PHOENIX WORLD TRADE CHINA', '92', '84749.9', '5.57', '', 'AU171-1105-003', 'SWEATER', '50849.94', '84749.9', ' AU171 ', '', 'A', '1', '1', '5', '3', 'U', '17', '1', '82', '2', '251', '', 3, NULL),
(351, '17111050038203', 'AISHOP', 'WOMAN', 'TEXTIL', 'SWEATER', '3', 'SUMMER', '2017', 'APRIL', 'GREY', 'M', 'PHOENIX WORLD TRADE CHINA', '92', '84749.9', '5.57', '', 'AU171-1105-003', 'SWEATER', '50849.94', '84749.9', ' AU171 ', '', 'A', '1', '1', '5', '3', 'U', '17', '1', '82', '3', '251', '', 3, NULL),
(352, '17111050038204', 'AISHOP', 'WOMAN', 'TEXTIL', 'SWEATER', '3', 'SUMMER', '2017', 'APRIL', 'GREY', 'L', 'PHOENIX WORLD TRADE CHINA', '92', '84749.9', '5.57', '', 'AU171-1105-003', 'SWEATER', '50849.94', '84749.9', ' AU171 ', '', 'A', '1', '1', '5', '3', 'U', '17', '1', '82', '4', '251', '', 3, NULL),
(353, '17111050034002', 'AISHOP', 'WOMAN', 'TEXTIL', 'SWEATER', '3', 'SUMMER', '2017', 'APRIL', 'RED', 'S', 'PHOENIX WORLD TRADE CHINA', '91', '84749.9', '5.57', '', 'AU171-1105-003', 'SWEATER', '50849.94', '84749.9', ' AU171 ', '', 'A', '1', '1', '5', '3', 'U', '17', '1', '40', '2', '251', '', 3, NULL),
(354, '17111050034003', 'AISHOP', 'WOMAN', 'TEXTIL', 'SWEATER', '3', 'SUMMER', '2017', 'APRIL', 'RED', 'M', 'PHOENIX WORLD TRADE CHINA', '92', '84749.9', '5.57', '', 'AU171-1105-003', 'SWEATER', '50849.94', '84749.9', ' AU171 ', '', 'A', '1', '1', '5', '3', 'U', '17', '1', '40', '3', '251', '', 3, NULL),
(355, '17111050034004', 'AISHOP', 'WOMAN', 'TEXTIL', 'SWEATER', '3', 'SUMMER', '2017', 'APRIL', 'RED', 'L', 'PHOENIX WORLD TRADE CHINA', '92', '84749.9', '5.57', '', 'AU171-1105-003', 'SWEATER', '50849.94', '84749.9', ' AU171 ', '', 'A', '1', '1', '5', '3', 'U', '17', '1', '40', '4', '251', '', 3, NULL),
(356, '17111021170102', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '117', 'SUMMER', '2017', 'APRIL', 'WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '80', '63998.9', '4.31', '', 'AU171-1102-117', 'TOP', '38399.34', '63998.9', ' AU171 ', '', 'A', '1', '1', '2', '117', 'U', '17', '1', '1', '2', '251', '', 3, NULL),
(357, '17111021170103', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '117', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '80', '63998.9', '4.31', '', 'AU171-1102-117', 'TOP', '38399.34', '63998.9', ' AU171 ', '', 'A', '1', '1', '2', '117', 'U', '17', '1', '1', '3', '251', '', 3, NULL),
(358, '17111021170104', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '117', 'SUMMER', '2017', 'APRIL', 'WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '79', '63998.9', '4.31', '', 'AU171-1102-117', 'TOP', '38399.34', '63998.9', ' AU171 ', '', 'A', '1', '1', '2', '117', 'U', '17', '1', '1', '4', '251', '', 3, NULL),
(359, '17111021178002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '117', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '79', '63998.9', '4.31', '', 'AU171-1102-117', 'TOP', '38399.34', '63998.9', ' AU171 ', '', 'A', '1', '1', '2', '117', 'U', '17', '1', '80', '2', '251', '', 3, NULL),
(360, '17111021178003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '117', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '79', '63998.9', '4.31', '', 'AU171-1102-117', 'TOP', '38399.34', '63998.9', ' AU171 ', '', 'A', '1', '1', '2', '117', 'U', '17', '1', '80', '3', '251', '', 3, NULL),
(361, '17111021178004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '117', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '80', '63998.9', '4.31', '', 'AU171-1102-117', 'TOP', '38399.34', '63998.9', ' AU171 ', '', 'A', '1', '1', '2', '117', 'U', '17', '1', '80', '4', '251', '', 3, NULL),
(362, '17111021190102', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '119', 'SUMMER', '2017', 'APRIL', 'WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '89', '69998.9', '4.73', '', 'AU171-1102-119', 'TOP', '41999.34', '69998.9', ' AU171 ', '', 'A', '1', '1', '2', '119', 'U', '17', '1', '1', '2', '251', '', 3, NULL),
(363, '17111021190103', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '119', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '89', '69998.9', '4.73', '', 'AU171-1102-119', 'TOP', '41999.34', '69998.9', ' AU171 ', '', 'A', '1', '1', '2', '119', 'U', '17', '1', '1', '3', '251', '', 3, NULL),
(364, '17111021190104', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '119', 'SUMMER', '2017', 'APRIL', 'WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '90', '69998.9', '4.73', '', 'AU171-1102-119', 'TOP', '41999.34', '69998.9', ' AU171 ', '', 'A', '1', '1', '2', '119', 'U', '17', '1', '1', '4', '251', '', 3, NULL),
(365, '17111021198002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '119', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '72', '69998.9', '4.73', '', 'AU171-1102-119', 'TOP', '41999.34', '69998.9', ' AU171 ', '', 'A', '1', '1', '2', '119', 'U', '17', '1', '80', '2', '251', '', 3, NULL),
(366, '17111021198003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '119', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '72', '69998.9', '4.73', '', 'AU171-1102-119', 'TOP', '41999.34', '69998.9', ' AU171 ', '', 'A', '1', '1', '2', '119', 'U', '17', '1', '80', '3', '251', '', 3, NULL),
(367, '17111021198004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '119', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '72', '69998.9', '4.73', '', 'AU171-1102-119', 'TOP', '41999.34', '69998.9', ' AU171 ', '', 'A', '1', '1', '2', '119', 'U', '17', '1', '80', '4', '251', '', 3, NULL),
(368, '17111021252002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '125', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '85', '54598.9', '3.47', '', 'AU171-1102-125', 'TOP', '32759.34', '54598.9', ' AU171 ', '', 'A', '1', '1', '2', '125', 'U', '17', '1', '20', '2', '251', '', 3, NULL),
(369, '17111021252003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '125', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '84', '54598.9', '3.47', '', 'AU171-1102-125', 'TOP', '32759.34', '54598.9', ' AU171 ', '', 'A', '1', '1', '2', '125', 'U', '17', '1', '20', '3', '251', '', 3, NULL),
(370, '17111021252004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '125', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '85', '54598.9', '3.47', '', 'AU171-1102-125', 'TOP', '32759.34', '54598.9', ' AU171 ', '', 'A', '1', '1', '2', '125', 'U', '17', '1', '20', '4', '251', '', 3, NULL),
(371, '17111021256002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '125', 'SUMMER', '2017', 'APRIL', 'GREEN', 'S', 'PHOENIX WORLD TRADE CHINA', '82', '54598.9', '3.47', '', 'AU171-1102-125', 'TOP', '32759.34', '54598.9', ' AU171 ', '', 'A', '1', '1', '2', '125', 'U', '17', '1', '60', '2', '251', '', 3, NULL),
(372, '17111021256003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '125', 'SUMMER', '2017', 'APRIL', 'GREEN', 'M', 'PHOENIX WORLD TRADE CHINA', '82', '54598.9', '3.47', '', 'AU171-1102-125', 'TOP', '32759.34', '54598.9', ' AU171 ', '', 'A', '1', '1', '2', '125', 'U', '17', '1', '60', '3', '251', '', 3, NULL),
(373, '17111021256004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '125', 'SUMMER', '2017', 'APRIL', 'GREEN', 'L', 'PHOENIX WORLD TRADE CHINA', '83', '54598.9', '3.47', '', 'AU171-1102-125', 'TOP', '32759.34', '54598.9', ' AU171 ', '', 'A', '1', '1', '2', '125', 'U', '17', '1', '60', '4', '251', '', 3, NULL),
(374, '17111021512002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '151', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '74', '54598.9', '3.47', '', 'AU171-1102-151', 'TOP', '32759.34', '54598.9', ' AU171 ', '', 'A', '1', '1', '2', '151', 'U', '17', '1', '20', '2', '251', '', 3, NULL),
(375, '17111021512003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '151', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '83', '54598.9', '3.47', '', 'AU171-1102-151', 'TOP', '32759.34', '54598.9', ' AU171 ', '', 'A', '1', '1', '2', '151', 'U', '17', '1', '20', '3', '251', '', 3, NULL),
(376, '17111021512004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '151', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '79', '54598.9', '3.47', '', 'AU171-1102-151', 'TOP', '32759.34', '54598.9', ' AU171 ', '', 'A', '1', '1', '2', '151', 'U', '17', '1', '20', '4', '251', '', 3, NULL),
(377, '17111021666002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '166', 'SUMMER', '2017', 'APRIL', 'GREEN', 'S', 'PHOENIX WORLD TRADE CHINA', '83', '33998.9', '1.99', '', 'AU171-1102-166', 'TOP', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '2', '166', 'U', '17', '1', '60', '2', '251', '', 3, NULL),
(378, '17111021666003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '166', 'SUMMER', '2017', 'APRIL', 'GREEN', 'M', 'PHOENIX WORLD TRADE CHINA', '90', '33998.9', '1.99', '', 'AU171-1102-166', 'TOP', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '2', '166', 'U', '17', '1', '60', '3', '251', '', 3, NULL),
(379, '17111021666004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '166', 'SUMMER', '2017', 'APRIL', 'GREEN', 'L', 'PHOENIX WORLD TRADE CHINA', '85', '33998.9', '1.99', '', 'AU171-1102-166', 'TOP', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '2', '166', 'U', '17', '1', '60', '4', '251', '', 3, NULL),
(380, '17111021664002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '166', 'SUMMER', '2017', 'APRIL', 'RED', 'S', 'PHOENIX WORLD TRADE CHINA', '89', '33998.9', '1.99', '', 'AU171-1102-166', 'TOP', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '2', '166', 'U', '17', '1', '40', '2', '251', '', 3, NULL),
(381, '17111021664003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '166', 'SUMMER', '2017', 'APRIL', 'RED', 'M', 'PHOENIX WORLD TRADE CHINA', '93', '33998.9', '1.99', '', 'AU171-1102-166', 'TOP', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '2', '166', 'U', '17', '1', '40', '3', '251', '', 3, NULL),
(382, '17111021664004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '166', 'SUMMER', '2017', 'APRIL', 'RED', 'L', 'PHOENIX WORLD TRADE CHINA', '93', '33998.9', '1.99', '', 'AU171-1102-166', 'TOP', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '2', '166', 'U', '17', '1', '40', '4', '251', '', 3, NULL),
(383, '17111021668002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '166', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '86', '33998.9', '1.99', '', 'AU171-1102-166', 'TOP', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '2', '166', 'U', '17', '1', '80', '2', '251', '', 3, NULL),
(384, '17111021668003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '166', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '86', '33998.9', '1.99', '', 'AU171-1102-166', 'TOP', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '2', '166', 'U', '17', '1', '80', '3', '251', '', 3, NULL),
(385, '17111021668004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '166', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '86', '33998.9', '1.99', '', 'AU171-1102-166', 'TOP', '20399.34', '33998.9', ' AU171 ', '', 'A', '1', '1', '2', '166', 'U', '17', '1', '80', '4', '251', '', 3, NULL),
(386, '17111060025902', 'AISHOP', 'WOMAN', 'TEXTIL', 'JACKET', '2', 'SUMMER', '2017', 'APRIL', 'GREEN PRINT', 'S', 'PHOENIX WORLD TRADE CHINA', '48', '99998.9', '7.67', '', 'AU171-1106-002', 'JACKET', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '6', '2', 'U', '17', '1', '59', '2', '251', '', 3, NULL),
(387, '17111060025903', 'AISHOP', 'WOMAN', 'TEXTIL', 'JACKET', '2', 'SUMMER', '2017', 'APRIL', 'GREEN PRINT', 'M', 'PHOENIX WORLD TRADE CHINA', '51', '99998.9', '7.67', '', 'AU171-1106-002', 'JACKET', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '6', '2', 'U', '17', '1', '59', '3', '251', '', 3, NULL),
(388, '17111060025904', 'AISHOP', 'WOMAN', 'TEXTIL', 'JACKET', '2', 'SUMMER', '2017', 'APRIL', 'GREEN PRINT', 'L', 'PHOENIX WORLD TRADE CHINA', '52', '99998.9', '7.67', '', 'AU171-1106-002', 'JACKET', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '6', '2', 'U', '17', '1', '59', '4', '251', '', 3, NULL),
(389, '17111060020802', 'AISHOP', 'WOMAN', 'TEXTIL', 'JACKET', '2', 'SUMMER', '2017', 'APRIL', 'BLUE PRINT', 'S', 'PHOENIX WORLD TRADE CHINA', '44', '99998.9', '7.67', '', 'AU171-1106-002', 'JACKET', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '6', '2', 'U', '17', '1', '8', '2', '251', '', 3, NULL),
(390, '17111060020803', 'AISHOP', 'WOMAN', 'TEXTIL', 'JACKET', '2', 'SUMMER', '2017', 'APRIL', 'BLUE PRINT', 'M', 'PHOENIX WORLD TRADE CHINA', '46', '99998.9', '7.67', '', 'AU171-1106-002', 'JACKET', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '6', '2', 'U', '17', '1', '8', '3', '251', '', 3, NULL),
(391, '17111060020804', 'AISHOP', 'WOMAN', 'TEXTIL', 'JACKET', '2', 'SUMMER', '2017', 'APRIL', 'BLUE PRINT', 'L', 'PHOENIX WORLD TRADE CHINA', '46', '99998.9', '7.67', '', 'AU171-1106-002', 'JACKET', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '6', '2', 'U', '17', '1', '8', '4', '251', '', 3, NULL),
(392, '17111020018002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '1', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '165', '44998.9', '2.63', '', 'AU171-1102-001', 'TOP', '26999.34', '44998.9', ' AU171 ', '', 'A', '1', '1', '2', '1', 'U', '17', '1', '80', '2', '251', '', 3, NULL),
(393, '17111020018003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '1', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '168', '44998.9', '2.63', '', 'AU171-1102-001', 'TOP', '26999.34', '44998.9', ' AU171 ', '', 'A', '1', '1', '2', '1', 'U', '17', '1', '80', '3', '251', '', 3, NULL),
(394, '17111020018004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '1', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '170', '44998.9', '2.63', '', 'AU171-1102-001', 'TOP', '26999.34', '44998.9', ' AU171 ', '', 'A', '1', '1', '2', '1', 'U', '17', '1', '80', '4', '251', '', 3, NULL),
(395, '17111020010102', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '1', 'SUMMER', '2017', 'APRIL', 'WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '158', '44998.9', '2.63', '', 'AU171-1102-001', 'TOP', '26999.34', '44998.9', ' AU171 ', '', 'A', '1', '1', '2', '1', 'U', '17', '1', '1', '2', '251', '', 3, NULL),
(396, '17111020010103', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '1', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '160', '44998.9', '2.63', '', 'AU171-1102-001', 'TOP', '26999.34', '44998.9', ' AU171 ', '', 'A', '1', '1', '2', '1', 'U', '17', '1', '1', '3', '251', '', 3, NULL),
(397, '17111020010104', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '1', 'SUMMER', '2017', 'APRIL', 'WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '160', '44998.9', '2.63', '', 'AU171-1102-001', 'TOP', '26999.34', '44998.9', ' AU171 ', '', 'A', '1', '1', '2', '1', 'U', '17', '1', '1', '4', '251', '', 3, NULL),
(398, '17111020010902', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '1', 'SUMMER', '2017', 'APRIL', 'AQUA', 'S', 'PHOENIX WORLD TRADE CHINA', '182', '44998.9', '2.63', '', 'AU171-1102-001', 'TOP', '26999.34', '44998.9', ' AU171 ', '', 'A', '1', '1', '2', '1', 'U', '17', '1', '9', '2', '251', '', 3, NULL),
(399, '17111020010903', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '1', 'SUMMER', '2017', 'APRIL', 'AQUA', 'M', 'PHOENIX WORLD TRADE CHINA', '180', '44998.9', '2.63', '', 'AU171-1102-001', 'TOP', '26999.34', '44998.9', ' AU171 ', '', 'A', '1', '1', '2', '1', 'U', '17', '1', '9', '3', '251', '', 3, NULL),
(400, '17111020010904', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '1', 'SUMMER', '2017', 'APRIL', 'AQUA', 'L', 'PHOENIX WORLD TRADE CHINA', '170', '44998.9', '2.63', '', 'AU171-1102-001', 'TOP', '26999.34', '44998.9', ' AU171 ', '', 'A', '1', '1', '2', '1', 'U', '17', '1', '9', '4', '251', '', 3, NULL),
(401, '17111100018002', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '1', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '116', '44998.9', '2.63', '', 'AU171-1110-001', 'PANT', '26999.34', '44998.9', ' AU171 ', '', 'A', '1', '1', '10', '1', 'U', '17', '1', '80', '2', '251', '', 3, NULL),
(402, '17111100018003', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '1', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '116', '44998.9', '2.63', '', 'AU171-1110-001', 'PANT', '26999.34', '44998.9', ' AU171 ', '', 'A', '1', '1', '10', '1', 'U', '17', '1', '80', '3', '251', '', 3, NULL),
(403, '17111100018004', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '1', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '116', '44998.9', '2.63', '', 'AU171-1110-001', 'PANT', '26999.34', '44998.9', ' AU171 ', '', 'A', '1', '1', '10', '1', 'U', '17', '1', '80', '4', '251', '', 3, NULL),
(404, '17111100132002', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '13', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '135', '76998.9', '4.94', '', 'AU171-1110-013', 'PANT', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '10', '13', 'U', '17', '1', '20', '2', '251', '', 3, NULL),
(405, '17111100132003', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '13', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '137', '76998.9', '4.94', '', 'AU171-1110-013', 'PANT', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '10', '13', 'U', '17', '1', '20', '3', '251', '', 3, NULL),
(406, '17111100132004', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '13', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '136', '76998.9', '4.94', '', 'AU171-1110-013', 'PANT', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '10', '13', 'U', '17', '1', '20', '4', '251', '', 3, NULL),
(407, '17111150098002', 'AISHOP', 'WOMAN', 'TEXTIL', 'SKIRT', '9', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '55', '79998.9', '5.46', '', 'AU171-1115-009', 'SKIRT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '15', '9', 'U', '17', '1', '80', '2', '251', '', 3, NULL),
(408, '17111150098003', 'AISHOP', 'WOMAN', 'TEXTIL', 'SKIRT', '9', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '55', '79998.9', '5.46', '', 'AU171-1115-009', 'SKIRT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '15', '9', 'U', '17', '1', '80', '3', '251', '', 3, NULL),
(409, '17111150098004', 'AISHOP', 'WOMAN', 'TEXTIL', 'SKIRT', '9', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '55', '79998.9', '5.46', '', 'AU171-1115-009', 'SKIRT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '15', '9', 'U', '17', '1', '80', '4', '251', '', 3, NULL),
(410, '17111150092002', 'AISHOP', 'WOMAN', 'TEXTIL', 'SKIRT', '9', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '55', '79998.9', '5.46', '', 'AU171-1115-009', 'SKIRT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '15', '9', 'U', '17', '1', '20', '2', '251', '', 3, NULL),
(411, '17111150092003', 'AISHOP', 'WOMAN', 'TEXTIL', 'SKIRT', '9', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '53', '79998.9', '5.46', '', 'AU171-1115-009', 'SKIRT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '15', '9', 'U', '17', '1', '20', '3', '251', '', 3, NULL),
(412, '17111150092004', 'AISHOP', 'WOMAN', 'TEXTIL', 'SKIRT', '9', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '55', '79998.9', '5.46', '', 'AU171-1115-009', 'SKIRT', '47999.34', '79998.9', ' AU171 ', '', 'A', '1', '1', '15', '9', 'U', '17', '1', '20', '4', '251', '', 3, NULL),
(413, '17111150101602', 'AISHOP', 'WOMAN', 'TEXTIL', 'SKIRT', '10', 'SUMMER', '2017', 'APRIL', 'NAVY', 'S', 'PHOENIX WORLD TRADE CHINA', '55', '84998.9', '5.78', '', 'AU171-1115-010', 'SKIRT', '50999.34', '84998.9', ' AU171 ', '', 'A', '1', '1', '15', '10', 'U', '17', '1', '16', '2', '251', '', 3, NULL),
(414, '17111150101603', 'AISHOP', 'WOMAN', 'TEXTIL', 'SKIRT', '10', 'SUMMER', '2017', 'APRIL', 'NAVY', 'M', 'PHOENIX WORLD TRADE CHINA', '55', '84998.9', '5.78', '', 'AU171-1115-010', 'SKIRT', '50999.34', '84998.9', ' AU171 ', '', 'A', '1', '1', '15', '10', 'U', '17', '1', '16', '3', '251', '', 3, NULL),
(415, '17111150101604', 'AISHOP', 'WOMAN', 'TEXTIL', 'SKIRT', '10', 'SUMMER', '2017', 'APRIL', 'NAVY', 'L', 'PHOENIX WORLD TRADE CHINA', '55', '84998.9', '5.78', '', 'AU171-1115-010', 'SKIRT', '50999.34', '84998.9', ' AU171 ', '', 'A', '1', '1', '15', '10', 'U', '17', '1', '16', '4', '251', '', 3, NULL),
(416, '17111020395302', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '85', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '53', '2', '251', '', 3, NULL),
(417, '17111020395303', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '99', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '53', '3', '251', '', 3, NULL),
(418, '17111020395304', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '87', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '53', '4', '251', '', 3, NULL),
(419, '17111020392002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '91', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '20', '2', '251', '', 3, NULL),
(420, '17111020392003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '89', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '20', '3', '251', '', 3, NULL),
(421, '17111020392004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '91', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '20', '4', '251', '', 3, NULL),
(422, '17111020393002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'S', 'PHOENIX WORLD TRADE CHINA', '85', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '30', '2', '251', '', 3, NULL),
(423, '17111020393003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'M', 'PHOENIX WORLD TRADE CHINA', '85', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '30', '3', '251', '', 3, NULL),
(424, '17111020393004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'L', 'PHOENIX WORLD TRADE CHINA', '87', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '30', '4', '251', '', 3, NULL),
(425, '17111020398002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '105', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '80', '2', '251', '', 3, NULL),
(426, '17111020398003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '104', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '80', '3', '251', '', 3, NULL),
(427, '17111020398004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '105', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '80', '4', '251', '', 3, NULL),
(428, '17111020391002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'BLUE', 'S', 'PHOENIX WORLD TRADE CHINA', '89', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '10', '2', '251', '', 3, NULL),
(429, '17111020391003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'BLUE', 'M', 'PHOENIX WORLD TRADE CHINA', '90', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '10', '3', '251', '', 3, NULL),
(430, '17111020391004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '39', 'SUMMER', '2017', 'APRIL', 'BLUE', 'L', 'PHOENIX WORLD TRADE CHINA', '92', '59998.9', '4.2', '', 'AU171-1102-039', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '39', 'U', '17', '1', '10', '4', '251', '', 3, NULL),
(431, '17111020815302', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '81', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '85', '69998.9', '4.73', '', 'AU171-1102-081', 'TOP', '41999.34', '69998.9', ' AU171 ', '', 'A', '1', '1', '2', '81', 'U', '17', '1', '53', '2', '251', '', 3, NULL),
(432, '17111020815303', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '81', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '86', '69998.9', '4.73', '', 'AU171-1102-081', 'TOP', '41999.34', '69998.9', ' AU171 ', '', 'A', '1', '1', '2', '81', 'U', '17', '1', '53', '3', '251', '', 3, NULL),
(433, '17111020815304', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '81', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '85', '69998.9', '4.73', '', 'AU171-1102-081', 'TOP', '41999.34', '69998.9', ' AU171 ', '', 'A', '1', '1', '2', '81', 'U', '17', '1', '53', '4', '251', '', 3, NULL),
(434, '17111020811002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '81', 'SUMMER', '2017', 'APRIL', 'BLUE', 'S', 'PHOENIX WORLD TRADE CHINA', '88', '69998.9', '4.73', '', 'AU171-1102-081', 'TOP', '41999.34', '69998.9', ' AU171 ', '', 'A', '1', '1', '2', '81', 'U', '17', '1', '10', '2', '251', '', 3, NULL),
(435, '17111020811003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '81', 'SUMMER', '2017', 'APRIL', 'BLUE', 'M', 'PHOENIX WORLD TRADE CHINA', '87', '69998.9', '4.73', '', 'AU171-1102-081', 'TOP', '41999.34', '69998.9', ' AU171 ', '', 'A', '1', '1', '2', '81', 'U', '17', '1', '10', '3', '251', '', 3, NULL),
(436, '17111020811004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '81', 'SUMMER', '2017', 'APRIL', 'BLUE', 'L', 'PHOENIX WORLD TRADE CHINA', '89', '69998.9', '4.73', '', 'AU171-1102-081', 'TOP', '41999.34', '69998.9', ' AU171 ', '', 'A', '1', '1', '2', '81', 'U', '17', '1', '10', '4', '251', '', 3, NULL),
(437, '17111020970202', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '97', 'SUMMER', '2017', 'APRIL', 'OFF WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '95', '54549.9', '3.47', '', 'AU171-1102-097', 'TOP', '32729.94', '54549.9', ' AU171 ', '', 'A', '1', '1', '2', '97', 'U', '17', '1', '2', '2', '251', '', 3, NULL),
(438, '17111020970203', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '97', 'SUMMER', '2017', 'APRIL', 'OFF WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '98', '54549.9', '3.47', '', 'AU171-1102-097', 'TOP', '32729.94', '54549.9', ' AU171 ', '', 'A', '1', '1', '2', '97', 'U', '17', '1', '2', '3', '251', '', 3, NULL),
(439, '17111020970204', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '97', 'SUMMER', '2017', 'APRIL', 'OFF WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '96', '54549.9', '3.47', '', 'AU171-1102-097', 'TOP', '32729.94', '54549.9', ' AU171 ', '', 'A', '1', '1', '2', '97', 'U', '17', '1', '2', '4', '251', '', 3, NULL),
(440, '17111020978002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '97', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '88', '54549.9', '3.47', '', 'AU171-1102-097', 'TOP', '32729.94', '54549.9', ' AU171 ', '', 'A', '1', '1', '2', '97', 'U', '17', '1', '80', '2', '251', '', 3, NULL),
(441, '17111020978003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '97', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '79', '54549.9', '3.47', '', 'AU171-1102-097', 'TOP', '32729.94', '54549.9', ' AU171 ', '', 'A', '1', '1', '2', '97', 'U', '17', '1', '80', '3', '251', '', 3, NULL),
(442, '17111020978004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '97', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '88', '54549.9', '3.47', '', 'AU171-1102-097', 'TOP', '32729.94', '54549.9', ' AU171 ', '', 'A', '1', '1', '2', '97', 'U', '17', '1', '80', '4', '251', '', 3, NULL),
(443, '17111130061002', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '6', 'SUMMER', '2017', 'APRIL', 'BLUE', 'S', 'PHOENIX WORLD TRADE CHINA', '54', '86998.9', '6.3', '', 'AU171-1113-006', 'SHORT', '52199.34', '86998.9', ' AU171 ', '', 'A', '1', '1', '13', '6', 'U', '17', '1', '10', '2', '251', '', 3, NULL),
(444, '17111130061003', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '6', 'SUMMER', '2017', 'APRIL', 'BLUE', 'M', 'PHOENIX WORLD TRADE CHINA', '54', '86998.9', '6.3', '', 'AU171-1113-006', 'SHORT', '52199.34', '86998.9', ' AU171 ', '', 'A', '1', '1', '13', '6', 'U', '17', '1', '10', '3', '251', '', 3, NULL),
(445, '17111130061004', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '6', 'SUMMER', '2017', 'APRIL', 'BLUE', 'L', 'PHOENIX WORLD TRADE CHINA', '53', '86998.9', '6.3', '', 'AU171-1113-006', 'SHORT', '52199.34', '86998.9', ' AU171 ', '', 'A', '1', '1', '13', '6', 'U', '17', '1', '10', '4', '251', '', 3, NULL),
(446, '17111130061202', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '6', 'SUMMER', '2017', 'APRIL', 'LIGHT BLUE', 'S', 'PHOENIX WORLD TRADE CHINA', '53', '86998.9', '6.3', '', 'AU171-1113-006', 'SHORT', '52199.34', '86998.9', ' AU171 ', '', 'A', '1', '1', '13', '6', 'U', '17', '1', '12', '2', '251', '', 3, NULL),
(447, '17111130061203', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '6', 'SUMMER', '2017', 'APRIL', 'LIGHT BLUE', 'M', 'PHOENIX WORLD TRADE CHINA', '54', '86998.9', '6.3', '', 'AU171-1113-006', 'SHORT', '52199.34', '86998.9', ' AU171 ', '', 'A', '1', '1', '13', '6', 'U', '17', '1', '12', '3', '251', '', 3, NULL),
(448, '17111130061204', 'AISHOP', 'WOMAN', 'TEXTIL', 'SHORT', '6', 'SUMMER', '2017', 'APRIL', 'LIGHT BLUE', 'L', 'PHOENIX WORLD TRADE CHINA', '54', '86998.9', '6.3', '', 'AU171-1113-006', 'SHORT', '52199.34', '86998.9', ' AU171 ', '', 'A', '1', '1', '13', '6', 'U', '17', '1', '12', '4', '251', '', 3, NULL),
(449, '17111020845302', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '84', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '77', '68998.9', '4.73', '', 'AU171-1102-084', 'TOP', '41399.34', '68998.9', ' AU171 ', '', 'A', '1', '1', '2', '84', 'U', '17', '1', '53', '2', '251', '', 3, NULL),
(450, '17111020845303', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '84', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '72', '68998.9', '4.73', '', 'AU171-1102-084', 'TOP', '41399.34', '68998.9', ' AU171 ', '', 'A', '1', '1', '2', '84', 'U', '17', '1', '53', '3', '251', '', 3, NULL),
(451, '17111020845304', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '84', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '78', '68998.9', '4.73', '', 'AU171-1102-084', 'TOP', '41399.34', '68998.9', ' AU171 ', '', 'A', '1', '1', '2', '84', 'U', '17', '1', '53', '4', '251', '', 3, NULL),
(452, '17111020840102', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '84', 'SUMMER', '2017', 'APRIL', 'WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '93', '68998.9', '4.73', '', 'AU171-1102-084', 'TOP', '41399.34', '68998.9', ' AU171 ', '', 'A', '1', '1', '2', '84', 'U', '17', '1', '1', '2', '251', '', 3, NULL),
(453, '17111020840103', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '84', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '87', '68998.9', '4.73', '', 'AU171-1102-084', 'TOP', '41399.34', '68998.9', ' AU171 ', '', 'A', '1', '1', '2', '84', 'U', '17', '1', '1', '3', '251', '', 3, NULL),
(454, '17111020840104', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '84', 'SUMMER', '2017', 'APRIL', 'WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '99', '68998.9', '4.73', '', 'AU171-1102-084', 'TOP', '41399.34', '68998.9', ' AU171 ', '', 'A', '1', '1', '2', '84', 'U', '17', '1', '1', '4', '251', '', 3, NULL),
(455, '17111020848002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '84', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '94', '68998.9', '4.73', '', 'AU171-1102-084', 'TOP', '41399.34', '68998.9', ' AU171 ', '', 'A', '1', '1', '2', '84', 'U', '17', '1', '80', '2', '251', '', 3, NULL),
(456, '17111020848003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '84', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '98', '68998.9', '4.73', '', 'AU171-1102-084', 'TOP', '41399.34', '68998.9', ' AU171 ', '', 'A', '1', '1', '2', '84', 'U', '17', '1', '80', '3', '251', '', 3, NULL),
(457, '17111020848004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '84', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '98', '68998.9', '4.73', '', 'AU171-1102-084', 'TOP', '41399.34', '68998.9', ' AU171 ', '', 'A', '1', '1', '2', '84', 'U', '17', '1', '80', '4', '251', '', 3, NULL),
(458, '17111020842002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '84', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '83', '68998.9', '4.73', '', 'AU171-1102-084', 'TOP', '41399.34', '68998.9', ' AU171 ', '', 'A', '1', '1', '2', '84', 'U', '17', '1', '20', '2', '251', '', 3, NULL),
(459, '17111020842003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '84', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '83', '68998.9', '4.73', '', 'AU171-1102-084', 'TOP', '41399.34', '68998.9', ' AU171 ', '', 'A', '1', '1', '2', '84', 'U', '17', '1', '20', '3', '251', '', 3, NULL),
(460, '17111020842004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '84', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '85', '68998.9', '4.73', '', 'AU171-1102-084', 'TOP', '41399.34', '68998.9', ' AU171 ', '', 'A', '1', '1', '2', '84', 'U', '17', '1', '20', '4', '251', '', 3, NULL),
(461, '17111020535302', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '53', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '91', '59998.9', '4.2', '', 'AU171-1102-053', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '53', 'U', '17', '1', '53', '2', '251', '', 3, NULL),
(462, '17111020535303', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '53', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '95', '59998.9', '4.2', '', 'AU171-1102-053', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '53', 'U', '17', '1', '53', '3', '251', '', 3, NULL),
(463, '17111020535304', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '53', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '92', '59998.9', '4.2', '', 'AU171-1102-053', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '53', 'U', '17', '1', '53', '4', '251', '', 3, NULL),
(464, '17111020532002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '53', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '92', '59998.9', '4.2', '', 'AU171-1102-053', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '53', 'U', '17', '1', '20', '2', '251', '', 3, NULL),
(465, '17111020532003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '53', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '92', '59998.9', '4.2', '', 'AU171-1102-053', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '53', 'U', '17', '1', '20', '3', '251', '', 3, NULL),
(466, '17111020532004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '53', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '92', '59998.9', '4.2', '', 'AU171-1102-053', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '53', 'U', '17', '1', '20', '4', '251', '', 3, NULL),
(467, '17111020545302', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '54', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '92', '76998.9', '5.25', '', 'AU171-1102-054', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '54', 'U', '17', '1', '53', '2', '251', '', 3, NULL),
(468, '17111020545303', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '54', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '93', '76998.9', '5.25', '', 'AU171-1102-054', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '54', 'U', '17', '1', '53', '3', '251', '', 3, NULL),
(469, '17111020545304', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '54', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '93', '76998.9', '5.25', '', 'AU171-1102-054', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '54', 'U', '17', '1', '53', '4', '251', '', 3, NULL),
(470, '17111020540102', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '54', 'SUMMER', '2017', 'APRIL', 'WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '91', '76998.9', '5.25', '', 'AU171-1102-054', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '54', 'U', '17', '1', '1', '2', '251', '', 3, NULL),
(471, '17111020540103', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '54', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '90', '76998.9', '5.25', '', 'AU171-1102-054', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '54', 'U', '17', '1', '1', '3', '251', '', 3, NULL),
(472, '17111020540104', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '54', 'SUMMER', '2017', 'APRIL', 'WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '92', '76998.9', '5.25', '', 'AU171-1102-054', 'TOP', '46199.34', '76998.9', ' AU171 ', '', 'A', '1', '1', '2', '54', 'U', '17', '1', '1', '4', '251', '', 3, NULL),
(473, '17111020372002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '37', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '81', '65879.9', '4.2', '', 'AU171-1102-037', 'TOP', '39527.94', '65879.9', ' AU171 ', '', 'A', '1', '1', '2', '37', 'U', '17', '1', '20', '2', '251', '', 3, NULL),
(474, '17111020372003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '37', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '74', '65879.9', '4.2', '', 'AU171-1102-037', 'TOP', '39527.94', '65879.9', ' AU171 ', '', 'A', '1', '1', '2', '37', 'U', '17', '1', '20', '3', '251', '', 3, NULL),
(475, '17111020372004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '37', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '77', '65879.9', '4.2', '', 'AU171-1102-037', 'TOP', '39527.94', '65879.9', ' AU171 ', '', 'A', '1', '1', '2', '37', 'U', '17', '1', '20', '4', '251', '', 3, NULL),
(476, '17111020375302', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '37', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '90', '65879.9', '4.2', '', 'AU171-1102-037', 'TOP', '39527.94', '65879.9', ' AU171 ', '', 'A', '1', '1', '2', '37', 'U', '17', '1', '53', '2', '251', '', 3, NULL),
(477, '17111020375303', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '37', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '91', '65879.9', '4.2', '', 'AU171-1102-037', 'TOP', '39527.94', '65879.9', ' AU171 ', '', 'A', '1', '1', '2', '37', 'U', '17', '1', '53', '3', '251', '', 3, NULL),
(478, '17111020375304', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '37', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '91', '65879.9', '4.2', '', 'AU171-1102-037', 'TOP', '39527.94', '65879.9', ' AU171 ', '', 'A', '1', '1', '2', '37', 'U', '17', '1', '53', '4', '251', '', 3, NULL),
(479, '17111020380202', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '38', 'SUMMER', '2017', 'APRIL', 'OFF WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '73', '69549.9', '4.73', '', 'AU171-1102-038', 'TOP', '41729.94', '69549.9', ' AU171 ', '', 'A', '1', '1', '2', '38', 'U', '17', '1', '2', '2', '251', '', 3, NULL),
(480, '17111020380203', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '38', 'SUMMER', '2017', 'APRIL', 'OFF WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '76', '69549.9', '4.73', '', 'AU171-1102-038', 'TOP', '41729.94', '69549.9', ' AU171 ', '', 'A', '1', '1', '2', '38', 'U', '17', '1', '2', '3', '251', '', 3, NULL),
(481, '17111020380204', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '38', 'SUMMER', '2017', 'APRIL', 'OFF WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '73', '69549.9', '4.73', '', 'AU171-1102-038', 'TOP', '41729.94', '69549.9', ' AU171 ', '', 'A', '1', '1', '2', '38', 'U', '17', '1', '2', '4', '251', '', 3, NULL),
(482, '17111100118002', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '11', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '97', '99998.9', '7.35', '', 'AU171-1110-011', 'PANT', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '10', '11', 'U', '17', '1', '80', '2', '251', '', 3, NULL),
(483, '17111100118003', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '11', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '100', '99998.9', '7.35', '', 'AU171-1110-011', 'PANT', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '10', '11', 'U', '17', '1', '80', '3', '251', '', 3, NULL),
(484, '17111100118004', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '11', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '100', '99998.9', '7.35', '', 'AU171-1110-011', 'PANT', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '10', '11', 'U', '17', '1', '80', '4', '251', '', 3, NULL),
(485, '17111100115302', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '11', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '98', '99998.9', '7.35', '', 'AU171-1110-011', 'PANT', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '10', '11', 'U', '17', '1', '53', '2', '251', '', 3, NULL),
(486, '17111100115303', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '11', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '100', '99998.9', '7.35', '', 'AU171-1110-011', 'PANT', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '10', '11', 'U', '17', '1', '53', '3', '251', '', 3, NULL),
(487, '17111100115304', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '11', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '100', '99998.9', '7.35', '', 'AU171-1110-011', 'PANT', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '10', '11', 'U', '17', '1', '53', '4', '251', '', 3, NULL),
(488, '17111100110202', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '11', 'SUMMER', '2017', 'APRIL', 'OFF WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '101', '99998.9', '7.35', '', 'AU171-1110-011', 'PANT', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '10', '11', 'U', '17', '1', '2', '2', '251', '', 3, NULL),
(489, '17111100110203', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '11', 'SUMMER', '2017', 'APRIL', 'OFF WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '101', '99998.9', '7.35', '', 'AU171-1110-011', 'PANT', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '10', '11', 'U', '17', '1', '2', '3', '251', '', 3, NULL),
(490, '17111100110204', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '11', 'SUMMER', '2017', 'APRIL', 'OFF WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '104', '99998.9', '7.35', '', 'AU171-1110-011', 'PANT', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '10', '11', 'U', '17', '1', '2', '4', '251', '', 3, NULL),
(491, '17111100120102', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '12', 'SUMMER', '2017', 'APRIL', 'WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '98', '89998.9', '6.3', '', 'AU171-1110-012', 'PANT', '53999.34', '89998.9', ' AU171 ', '', 'A', '1', '1', '10', '12', 'U', '17', '1', '1', '2', '251', '', 3, NULL),
(492, '17111100120103', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '12', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '100', '89998.9', '6.3', '', 'AU171-1110-012', 'PANT', '53999.34', '89998.9', ' AU171 ', '', 'A', '1', '1', '10', '12', 'U', '17', '1', '1', '3', '251', '', 3, NULL),
(493, '17111100120104', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '12', 'SUMMER', '2017', 'APRIL', 'WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '100', '89998.9', '6.3', '', 'AU171-1110-012', 'PANT', '53999.34', '89998.9', ' AU171 ', '', 'A', '1', '1', '10', '12', 'U', '17', '1', '1', '4', '251', '', 3, NULL),
(494, '17111100128002', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '12', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '95', '89998.9', '6.3', '', 'AU171-1110-012', 'PANT', '53999.34', '89998.9', ' AU171 ', '', 'A', '1', '1', '10', '12', 'U', '17', '1', '80', '2', '251', '', 3, NULL),
(495, '17111100128003', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '12', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '98', '89998.9', '6.3', '', 'AU171-1110-012', 'PANT', '53999.34', '89998.9', ' AU171 ', '', 'A', '1', '1', '10', '12', 'U', '17', '1', '80', '3', '251', '', 3, NULL),
(496, '17111100128004', 'AISHOP', 'WOMAN', 'TEXTIL', 'PANT', '12', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '98', '89998.9', '6.3', '', 'AU171-1110-012', 'PANT', '53999.34', '89998.9', ' AU171 ', '', 'A', '1', '1', '10', '12', 'U', '17', '1', '80', '4', '251', '', 3, NULL),
(497, '17111170075302', 'AISHOP', 'WOMAN', 'TEXTIL', 'DRESS', '7', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '48', '99998.9', '7.35', '', 'AU171-1117-007', 'DRESS', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '17', '7', 'U', '17', '1', '53', '2', '251', '', 3, NULL);
INSERT INTO `product` (`id`, `cod_barra`, `marca`, `departamento`, `seccion`, `familia`, `subfamilia`, `temporada`, `ano`, `capsula`, `color`, `talla`, `proveedor`, `cantidad`, `pvptienda`, `peso`, `serie`, `referencia`, `descripcion`, `costodist`, `pvpmgta`, `carac`, `gpeso`, `codmarca`, `coddepto`, `codseccion`, `codfamilia`, `codsubfamilia`, `codtemporada`, `codano`, `codcapsula`, `codcolor`, `codtalla`, `codprov`, `descapsula`, `id_mapping`, `acumulado`) VALUES
(498, '17111170075303', 'AISHOP', 'WOMAN', 'TEXTIL', 'DRESS', '7', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '48', '99998.9', '7.35', '', 'AU171-1117-007', 'DRESS', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '17', '7', 'U', '17', '1', '53', '3', '251', '', 3, NULL),
(499, '17111170075304', 'AISHOP', 'WOMAN', 'TEXTIL', 'DRESS', '7', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '48', '99998.9', '7.35', '', 'AU171-1117-007', 'DRESS', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '17', '7', 'U', '17', '1', '53', '4', '251', '', 3, NULL),
(500, '17111170078002', 'AISHOP', 'WOMAN', 'TEXTIL', 'DRESS', '7', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '47', '99998.9', '7.35', '', 'AU171-1117-007', 'DRESS', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '17', '7', 'U', '17', '1', '80', '2', '251', '', 3, NULL),
(501, '17111170078003', 'AISHOP', 'WOMAN', 'TEXTIL', 'DRESS', '7', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '48', '99998.9', '7.35', '', 'AU171-1117-007', 'DRESS', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '17', '7', 'U', '17', '1', '80', '3', '251', '', 3, NULL),
(502, '17111170078004', 'AISHOP', 'WOMAN', 'TEXTIL', 'DRESS', '7', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '49', '99998.9', '7.35', '', 'AU171-1117-007', 'DRESS', '59999.34', '99998.9', ' AU171 ', '', 'A', '1', '1', '17', '7', 'U', '17', '1', '80', '4', '251', '', 3, NULL),
(503, '17111020325302', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '32', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '89', '59998.9', '3.89', '', 'AU171-1102-032', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '32', 'U', '17', '1', '53', '2', '251', '', 3, NULL),
(504, '17111020325303', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '32', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '91', '59998.9', '3.89', '', 'AU171-1102-032', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '32', 'U', '17', '1', '53', '3', '251', '', 3, NULL),
(505, '17111020325304', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '32', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '91', '59998.9', '3.89', '', 'AU171-1102-032', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '32', 'U', '17', '1', '53', '4', '251', '', 3, NULL),
(506, '17111020328202', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '32', 'SUMMER', '2017', 'APRIL', 'GREY', 'S', 'PHOENIX WORLD TRADE CHINA', '88', '59998.9', '3.89', '', 'AU171-1102-032', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '32', 'U', '17', '1', '82', '2', '251', '', 3, NULL),
(507, '17111020328203', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '32', 'SUMMER', '2017', 'APRIL', 'GREY', 'M', 'PHOENIX WORLD TRADE CHINA', '89', '59998.9', '3.89', '', 'AU171-1102-032', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '32', 'U', '17', '1', '82', '3', '251', '', 3, NULL),
(508, '17111020328204', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '32', 'SUMMER', '2017', 'APRIL', 'GREY', 'L', 'PHOENIX WORLD TRADE CHINA', '90', '59998.9', '3.89', '', 'AU171-1102-032', 'TOP', '35999.34', '59998.9', ' AU171 ', '', 'A', '1', '1', '2', '32', 'U', '17', '1', '82', '4', '251', '', 3, NULL),
(509, '17111020085302', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '8', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '81', '35998.9', '2.1', '', 'AU171-1102-008', 'TOP', '21599.34', '35998.9', ' AU171 ', '', 'A', '1', '1', '2', '8', 'U', '17', '1', '53', '2', '251', '', 3, NULL),
(510, '17111020085303', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '8', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '81', '35998.9', '2.1', '', 'AU171-1102-008', 'TOP', '21599.34', '35998.9', ' AU171 ', '', 'A', '1', '1', '2', '8', 'U', '17', '1', '53', '3', '251', '', 3, NULL),
(511, '17111020085304', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '8', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '81', '35998.9', '2.1', '', 'AU171-1102-008', 'TOP', '21599.34', '35998.9', ' AU171 ', '', 'A', '1', '1', '2', '8', 'U', '17', '1', '53', '4', '251', '', 3, NULL),
(512, '17111020082002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '8', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'S', 'PHOENIX WORLD TRADE CHINA', '88', '35998.9', '2.1', '', 'AU171-1102-008', 'TOP', '21599.34', '35998.9', ' AU171 ', '', 'A', '1', '1', '2', '8', 'U', '17', '1', '20', '2', '251', '', 3, NULL),
(513, '17111020082003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '8', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'M', 'PHOENIX WORLD TRADE CHINA', '88', '35998.9', '2.1', '', 'AU171-1102-008', 'TOP', '21599.34', '35998.9', ' AU171 ', '', 'A', '1', '1', '2', '8', 'U', '17', '1', '20', '3', '251', '', 3, NULL),
(514, '17111020082004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '8', 'SUMMER', '2017', 'APRIL', 'YELLOW', 'L', 'PHOENIX WORLD TRADE CHINA', '90', '35998.9', '2.1', '', 'AU171-1102-008', 'TOP', '21599.34', '35998.9', ' AU171 ', '', 'A', '1', '1', '2', '8', 'U', '17', '1', '20', '4', '251', '', 3, NULL),
(515, '17111020080202', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '8', 'SUMMER', '2017', 'APRIL', 'OFF WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '80', '35998.9', '2.1', '', 'AU171-1102-008', 'TOP', '21599.34', '35998.9', ' AU171 ', '', 'A', '1', '1', '2', '8', 'U', '17', '1', '2', '2', '251', '', 3, NULL),
(516, '17111020080203', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '8', 'SUMMER', '2017', 'APRIL', 'OFF WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '74', '35998.9', '2.1', '', 'AU171-1102-008', 'TOP', '21599.34', '35998.9', ' AU171 ', '', 'A', '1', '1', '2', '8', 'U', '17', '1', '2', '3', '251', '', 3, NULL),
(517, '17111020080204', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '8', 'SUMMER', '2017', 'APRIL', 'OFF WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '90', '35998.9', '2.1', '', 'AU171-1102-008', 'TOP', '21599.34', '35998.9', ' AU171 ', '', 'A', '1', '1', '2', '8', 'U', '17', '1', '2', '4', '251', '', 3, NULL),
(518, '17111020093002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'S', 'PHOENIX WORLD TRADE CHINA', '116', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '30', '2', '251', '', 3, NULL),
(519, '17111020093003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'M', 'PHOENIX WORLD TRADE CHINA', '124', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '30', '3', '251', '', 3, NULL),
(520, '17111020093004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'ORANGE', 'L', 'PHOENIX WORLD TRADE CHINA', '118', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '30', '4', '251', '', 3, NULL),
(521, '17111020095302', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'S', 'PHOENIX WORLD TRADE CHINA', '111', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '53', '2', '251', '', 3, NULL),
(522, '17111020095303', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'M', 'PHOENIX WORLD TRADE CHINA', '110', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '53', '3', '251', '', 3, NULL),
(523, '17111020095304', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'FUSCHIA', 'L', 'PHOENIX WORLD TRADE CHINA', '113', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '53', '4', '251', '', 3, NULL),
(524, '17111020098002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'BLACK', 'S', 'PHOENIX WORLD TRADE CHINA', '140', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '80', '2', '251', '', 3, 106),
(525, '17111020098003', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'BLACK', 'M', 'PHOENIX WORLD TRADE CHINA', '139', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '80', '3', '251', '', 3, NULL),
(526, '17111020098004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'BLACK', 'L', 'PHOENIX WORLD TRADE CHINA', '147', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '80', '4', '251', '', 3, NULL),
(527, '17111020090102', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '144', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '1', '2', '251', '', 3, NULL),
(528, '17111020090103', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '155', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '1', '3', '251', '', 3, NULL),
(529, '17111020090104', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '9', 'SUMMER', '2017', 'APRIL', 'WHITE', 'L', 'PHOENIX WORLD TRADE CHINA', '142', '39998.9', '2.52', '', 'AU171-1102-009', 'TOP', '23999.34', '39998.9', ' AU171 ', '', 'A', '1', '1', '2', '9', 'U', '17', '1', '1', '4', '251', '', 3, 113),
(530, '17111030016666', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '98', NULL, NULL, NULL, NULL, 'TOP', NULL, NULL, 'test', NULL, NULL, '1', '1', '2', '', 'U', '17', '1', '01', '03', '251', NULL, 1, 1),
(531, '17111030019999', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '', 'SUMMER', '2017', 'APRIL', 'WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '100', NULL, NULL, NULL, 'AU171-1102-322', 'TOP', NULL, NULL, 'test', NULL, NULL, '1', '1', '2', '', 'U', '17', '1', '01', '02', '251', NULL, 1, 9),
(532, '17111030017777', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '', 'SUMMER', '2017', 'APRIL', 'AQUA', 'L', 'PHOENIX WORLD TRADE CHINA', '100', NULL, NULL, NULL, 'AU171-1102-322', 'TOP', NULL, NULL, 'test', NULL, NULL, '1', '1', '2', '', 'U', '17', '1', '09', '04', '251', NULL, 1, 13),
(533, '17111030011777', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '', 'SUMMER', '2017', 'APRIL', 'DEEP BLUE', 'M', 'PHOENIX WORLD TRADE CHINA', '100', NULL, NULL, NULL, 'AU171-1102-322', 'TOP', NULL, NULL, 'test', NULL, NULL, '1', '1', '2', '', 'U', '17', '1', '11', '03', '251', NULL, 1, 2),
(534, '17111020098002', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '100', NULL, NULL, NULL, 'AU171-1102-322', 'TOP', NULL, NULL, 'test', NULL, NULL, '1', '1', '2', '', 'U', '17', '1', '01', '03', '251', NULL, 1, 106),
(535, '17111020098002', 'AISHOP', 'WOMAN', 'TEXTIL', 'T', '', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '100', NULL, NULL, NULL, 'AU171-1103-002', 'T-SHIRT', NULL, NULL, 'test', NULL, NULL, '1', '1', 'SHIRT', '', 'U', '17', '1', '01', '03', '251', NULL, 1, 1),
(536, '17111020098002', 'AISHOP', 'WOMAN', 'TEXTIL', 'SWEATER', '', 'SUMMER', '2017', 'APRIL', 'WHITE', 'S', 'PHOENIX WORLD TRADE CHINA', '100', NULL, NULL, NULL, 'AU171-1105-003', 'SWEATER', NULL, NULL, 'test', NULL, NULL, '1', '1', '5', '', 'U', '17', '1', '01', '02', '251', NULL, 1, 1),
(537, '17111030019999', 'AISHOP', 'WOMAN', 'TEXTIL', 'T', '', 'SUMMER', '2017', 'APRIL', 'WHITE', 'XS', 'PHOENIX WORLD TRADE CHINA', '32', NULL, NULL, NULL, 'AU171-1103-002', 'T-SHIRT', NULL, NULL, 'test', NULL, NULL, '1', '1', 'SHIRT', '', 'U', '17', '1', '01', '01', '251', NULL, 1, 1),
(538, '17111030012004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '', NULL, NULL, NULL, 'AU171-1102-321', 'TOP', NULL, NULL, 'test', NULL, NULL, '1', '1', '2', '', 'U', '17', '1', '01', '03', '251', NULL, 1, 1),
(539, '17111030012004', 'AISHOP', 'WOMAN', 'TEXTIL', 'TOP', '', 'SUMMER', '2017', 'APRIL', 'WHITE', 'M', 'PHOENIX WORLD TRADE CHINA', '', NULL, NULL, NULL, 'AU171-1102-321', 'TOP', NULL, NULL, 'test', NULL, NULL, '1', '1', '2', '', 'U', '17', '1', '01', '03', '251', NULL, 1, 1);

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
(1, 'admin', 'EMftcgzKpIXob8kA5zxywZx5DIpH383U', '$2y$13$zXmAJIK7WGTo4RmFjqWTa.evbh2YXYzf9oA32pPwwpw5RkRS7x.qe', NULL, 'admin@admin.colm', 10, 1493733829, 1493733829),
(2, 'julio', 'JbWQG5s-fWnNsmDOBFtpeHCaTtQYWFLx', '$2y$13$th1HxT3poi5RhtnVhC48zeUoUmheTc.9UJMYJb9XQg31.gPdz.kBa', NULL, 'julioamurillo10@gmail.com', 10, 1495051255, 1495051255);

--
-- Índices para tablas volcadas
--

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
-- Indices de la tabla `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`idlog`),
  ADD KEY `fk_log_user_idx` (`id_user`),
  ADD KEY `fk_log_product_idx` (`id_producto`),
  ADD KEY `fk_log_mapping_idx` (`id_mapping`);

--
-- Indices de la tabla `mapping`
--
ALTER TABLE `mapping`
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
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `log`
--
ALTER TABLE `log`
  MODIFY `idlog` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `mapping`
--
ALTER TABLE `mapping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=540;
--
-- AUTO_INCREMENT de la tabla `product_prev`
--
ALTER TABLE `product_prev`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
-- Filtros para la tabla `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `fk_log_mapping` FOREIGN KEY (`id_mapping`) REFERENCES `mapping` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_log_product` FOREIGN KEY (`id_producto`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_log_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
