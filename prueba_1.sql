-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-10-2023 a las 05:51:28
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prueba_1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `id_cita` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `id_estilista` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` enum('pendiente','confirmada','completada','cancelada','reagendada') NOT NULL,
  `comentarios` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estilista`
--

CREATE TABLE `estilista` (
  `id_estilista` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `especialidad` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estilista`
--

INSERT INTO `estilista` (`id_estilista`, `nombre`, `especialidad`) VALUES
(1, 'Gabriela ', 'Corte de cabello');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id_servicio` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `duracion` time NOT NULL,
  `precio` decimal(9,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`id_servicio`, `nombre`, `descripcion`, `duracion`, `precio`) VALUES
(1, 'Corte de cabello', 'Se realizará un corte de cabello básico.', '01:00:00', 120.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido_paterno` varchar(100) NOT NULL,
  `apellido_materno` varchar(100) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `tipo_usuario` enum('Administrador','Cliente') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`id_cita`),
  ADD KEY `cita_FK` (`id_usuario`),
  ADD KEY `cita_FK_1` (`id_servicio`),
  ADD KEY `cita_FK_2` (`id_estilista`);

--
-- Indices de la tabla `estilista`
--
ALTER TABLE `estilista`
  ADD PRIMARY KEY (`id_estilista`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id_servicio`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `usuario_un` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `id_cita` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estilista`
--
ALTER TABLE `estilista`
  MODIFY `id_estilista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `cita_FK` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `cita_FK_1` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`),
  ADD CONSTRAINT `cita_FK_2` FOREIGN KEY (`id_estilista`) REFERENCES `estilista` (`id_estilista`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
