-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 18-11-2025 a las 15:02:18
-- Versión del servidor: 8.0.44
-- Versión de PHP: 8.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `perupcs_01277742sky2223`
--
CREATE DATABASE IF NOT EXISTS `perupcs_01277742sky2223` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `perupcs_01277742sky2223`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alerta`
--

DROP TABLE IF EXISTS `alerta`;
CREATE TABLE `alerta` (
  `id_alerta` int NOT NULL,
  `EP` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fechaeliminacion` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `falla` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mensaje` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_recibido` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `resuelto` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `longitud` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `latitud` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `sistema` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `estado` int NOT NULL,
  `responsable_actual_id` int DEFAULT NULL,
  `responsable_original_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bnwas`
--

DROP TABLE IF EXISTS `bnwas`;
CREATE TABLE `bnwas` (
  `id` int NOT NULL,
  `fecha` varchar(20) NOT NULL,
  `year` varchar(10) NOT NULL,
  `month` varchar(10) NOT NULL,
  `day` varchar(10) NOT NULL,
  `hour` varchar(10) NOT NULL,
  `minute` varchar(10) NOT NULL,
  `latitude` varchar(20) NOT NULL,
  `longitude` varchar(20) NOT NULL,
  `speed` varchar(10) NOT NULL,
  `odometer` varchar(20) NOT NULL,
  `nombre_bomba` varchar(20) NOT NULL,
  `estado` int NOT NULL,
  `shell` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bomba1`
--

DROP TABLE IF EXISTS `bomba1`;
CREATE TABLE `bomba1` (
  `id` int NOT NULL,
  `fecha` varchar(20) NOT NULL,
  `year` varchar(10) NOT NULL,
  `month` varchar(10) NOT NULL,
  `day` varchar(10) NOT NULL,
  `hour` varchar(10) NOT NULL,
  `minute` varchar(10) NOT NULL,
  `latitude` varchar(20) NOT NULL,
  `longitude` varchar(20) NOT NULL,
  `speed` varchar(10) NOT NULL,
  `odometer` varchar(10) NOT NULL,
  `estado` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bomba2`
--

DROP TABLE IF EXISTS `bomba2`;
CREATE TABLE `bomba2` (
  `id` int NOT NULL,
  `fecha` varchar(20) NOT NULL,
  `year` varchar(10) NOT NULL,
  `month` varchar(10) NOT NULL,
  `day` varchar(10) NOT NULL,
  `hour` varchar(10) NOT NULL,
  `minute` varchar(10) NOT NULL,
  `latitude` varchar(20) NOT NULL,
  `longitude` varchar(20) NOT NULL,
  `speed` varchar(10) NOT NULL,
  `odometer` varchar(10) NOT NULL,
  `estado` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bomba3`
--

DROP TABLE IF EXISTS `bomba3`;
CREATE TABLE `bomba3` (
  `id` int NOT NULL,
  `fecha` varchar(20) NOT NULL,
  `year` varchar(10) NOT NULL,
  `month` varchar(10) NOT NULL,
  `day` varchar(10) NOT NULL,
  `hour` varchar(10) NOT NULL,
  `minute` varchar(10) NOT NULL,
  `latitude` varchar(20) NOT NULL,
  `longitude` varchar(20) NOT NULL,
  `speed` varchar(10) NOT NULL,
  `odometer` varchar(10) NOT NULL,
  `estado` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bomba4`
--

DROP TABLE IF EXISTS `bomba4`;
CREATE TABLE `bomba4` (
  `id` int NOT NULL,
  `fecha` varchar(20) NOT NULL,
  `year` varchar(10) NOT NULL,
  `month` varchar(10) NOT NULL,
  `day` varchar(10) NOT NULL,
  `hour` varchar(10) NOT NULL,
  `minute` varchar(10) NOT NULL,
  `latitude` varchar(20) NOT NULL,
  `longitude` varchar(20) NOT NULL,
  `speed` varchar(10) NOT NULL,
  `odometer` varchar(10) NOT NULL,
  `estado` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bomba5`
--

DROP TABLE IF EXISTS `bomba5`;
CREATE TABLE `bomba5` (
  `id` int NOT NULL,
  `fecha` varchar(20) NOT NULL,
  `year` varchar(10) NOT NULL,
  `month` varchar(10) NOT NULL,
  `day` varchar(10) NOT NULL,
  `hour` varchar(10) NOT NULL,
  `minute` varchar(10) NOT NULL,
  `latitude` varchar(20) NOT NULL,
  `longitude` varchar(20) NOT NULL,
  `speed` varchar(10) NOT NULL,
  `odometer` varchar(10) NOT NULL,
  `estado` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bomba6`
--

DROP TABLE IF EXISTS `bomba6`;
CREATE TABLE `bomba6` (
  `id` int NOT NULL,
  `YEAR` varchar(10) NOT NULL,
  `MONTH` varchar(10) NOT NULL,
  `DAY` varchar(10) NOT NULL,
  `HOUR` varchar(10) NOT NULL,
  `MINUTE` varchar(10) NOT NULL,
  `latitude` varchar(20) NOT NULL,
  `longitude` varchar(20) NOT NULL,
  `speed` varchar(10) NOT NULL,
  `odometer` varchar(10) NOT NULL,
  `estado` int NOT NULL,
  `fecha` varchar(20) NOT NULL,
  `shell` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bomba10`
--

DROP TABLE IF EXISTS `bomba10`;
CREATE TABLE `bomba10` (
  `id` int NOT NULL,
  `fecha` varchar(20) NOT NULL,
  `year` varchar(10) NOT NULL,
  `month` varchar(10) NOT NULL,
  `day` varchar(10) NOT NULL,
  `hour` varchar(10) NOT NULL,
  `minute` varchar(10) NOT NULL,
  `latitude` varchar(20) NOT NULL,
  `longitude` varchar(20) NOT NULL,
  `speed` varchar(10) NOT NULL,
  `odometer` varchar(10) NOT NULL,
  `estado` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadomelectro`
--

DROP TABLE IF EXISTS `estadomelectro`;
CREATE TABLE `estadomelectro` (
  `id` int NOT NULL,
  `fecha` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `EventTime` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Latitude` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Longitude` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Speed` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PgnCount` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `estado` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `millasachique`
--

DROP TABLE IF EXISTS `millasachique`;
CREATE TABLE `millasachique` (
  `id` int NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `latitud` varchar(255) DEFAULT NULL,
  `longitud` varchar(255) DEFAULT NULL,
  `bomba` varchar(255) DEFAULT NULL,
  `distancia_millas` varchar(255) DEFAULT NULL,
  `estado` char(7) DEFAULT NULL,
  `ubicacion` varchar(255) NOT NULL,
  `speed` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `minitoreito`
--

DROP TABLE IF EXISTS `minitoreito`;
CREATE TABLE `minitoreito` (
  `id` int NOT NULL,
  `economica` int NOT NULL,
  `marea` mediumtext COLLATE utf8mb4_general_ci,
  `control` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `zarpe` mediumtext COLLATE utf8mb4_general_ci,
  `arribo` mediumtext COLLATE utf8mb4_general_ci,
  `horas` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `millas` decimal(15,2) GENERATED ALWAYS AS ((((`totalArribo` / 10) - (`totalZarpe` / 10)) / (`odometroArribo` - `odometroZarpe`))) VIRTUAL,
  `descargas` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `navegacion` mediumtext COLLATE utf8mb4_general_ci,
  `millasReco` int GENERATED ALWAYS AS ((`odometroArribo` - `odometroZarpe`)) VIRTUAL,
  `odometroZarpe` int NOT NULL,
  `odometroArribo` int NOT NULL,
  `totalZarpe` int NOT NULL,
  `totalArribo` int NOT NULL,
  `GalonesConsumidos` decimal(10,1) GENERATED ALWAYS AS (((`totalArribo` / 3.78541) - (`totalZarpe` / 3.78541))) VIRTUAL,
  `estado` mediumtext COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportesmelecto`
--

DROP TABLE IF EXISTS `reportesmelecto`;
CREATE TABLE `reportesmelecto` (
  `id` int NOT NULL,
  `fecha` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `month` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `day` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `hour` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `minute` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `speed` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `header` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `parameter01` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `parameter02` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `parameter03` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `parameter04` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `parameter05` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `parameter06` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `parameter07` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `parameter08` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `parameter09` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `parameter10` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `parameter11` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `parameter12` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `parameter13` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `parameter14` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `parameter15` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `odometer` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `slave1`
--

DROP TABLE IF EXISTS `slave1`;
CREATE TABLE `slave1` (
  `id` int NOT NULL,
  `fecha` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0000-00-00 00:00:00',
  `year` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `month` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `day` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hour` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `minute` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `latitude` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `longitude` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `speed` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `heading` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `odometer` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PR_BR` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PR_ER` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PR_CT` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PP_CT` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PP_BR` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PP_ER` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TEMP_1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TEMP_2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TEMP_3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TEMP_4` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TEMP_5` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TEMP_6` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CHIBR_IN` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CHIBR_OUT` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CHIER_IN` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CHIER_OUT` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CHICT_IN` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CHICT_OUT` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HORO_1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HORO_2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ON_OFF1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ON_OFF2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `slave5`
--

DROP TABLE IF EXISTS `slave5`;
CREATE TABLE `slave5` (
  `id` int NOT NULL,
  `fecha` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `year` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `month` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `day` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hour` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `minute` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `latitude` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `longitude` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `speed` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `heading` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `odometer` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TK_1` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TK_2` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TK_3` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TK_4` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TK_5` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TK_6` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TK_7` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TK_8` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TOTAL` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `slave6`
--

DROP TABLE IF EXISTS `slave6`;
CREATE TABLE `slave6` (
  `id` int NOT NULL,
  `fecha` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `year` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `month` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `day` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hour` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `minute` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `latitude` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `longitude` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `speed` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `heading` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `odometer` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HORO_MP` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HORO_G1` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HORO_G2` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HORO_G3` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HORO_G4` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HORO_G5` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ACEITE_1` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ACEITE_2` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ACEITE_3` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ACEITE_4` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacionReal`
--

DROP TABLE IF EXISTS `ubicacionReal`;
CREATE TABLE `ubicacionReal` (
  `id` int NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `speed` varchar(255) NOT NULL DEFAULT '0',
  `heading` varchar(255) NOT NULL DEFAULT '0',
  `reporte` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alerta`
--
ALTER TABLE `alerta`
  ADD PRIMARY KEY (`id_alerta`);

--
-- Indices de la tabla `bnwas`
--
ALTER TABLE `bnwas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `bomba1`
--
ALTER TABLE `bomba1`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `bomba2`
--
ALTER TABLE `bomba2`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `bomba3`
--
ALTER TABLE `bomba3`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `bomba4`
--
ALTER TABLE `bomba4`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `bomba5`
--
ALTER TABLE `bomba5`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `bomba6`
--
ALTER TABLE `bomba6`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `bomba10`
--
ALTER TABLE `bomba10`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estadomelectro`
--
ALTER TABLE `estadomelectro`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `millasachique`
--
ALTER TABLE `millasachique`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `minitoreito`
--
ALTER TABLE `minitoreito`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reportesmelecto`
--
ALTER TABLE `reportesmelecto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `slave1`
--
ALTER TABLE `slave1`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `slave5`
--
ALTER TABLE `slave5`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `slave6`
--
ALTER TABLE `slave6`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ubicacionReal`
--
ALTER TABLE `ubicacionReal`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alerta`
--
ALTER TABLE `alerta`
  MODIFY `id_alerta` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bnwas`
--
ALTER TABLE `bnwas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bomba1`
--
ALTER TABLE `bomba1`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bomba2`
--
ALTER TABLE `bomba2`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bomba3`
--
ALTER TABLE `bomba3`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bomba4`
--
ALTER TABLE `bomba4`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bomba5`
--
ALTER TABLE `bomba5`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bomba6`
--
ALTER TABLE `bomba6`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bomba10`
--
ALTER TABLE `bomba10`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estadomelectro`
--
ALTER TABLE `estadomelectro`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `millasachique`
--
ALTER TABLE `millasachique`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `minitoreito`
--
ALTER TABLE `minitoreito`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reportesmelecto`
--
ALTER TABLE `reportesmelecto`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `slave1`
--
ALTER TABLE `slave1`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `slave5`
--
ALTER TABLE `slave5`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `slave6`
--
ALTER TABLE `slave6`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ubicacionReal`
--
ALTER TABLE `ubicacionReal`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
