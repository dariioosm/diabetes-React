-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-03-2025 a las 16:30:41
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `diabetesdb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comida`
--

CREATE TABLE `comida` (
  `id_usuario` int(11) NOT NULL,
  `fecha_control` date NOT NULL,
  `tipo_comida` enum('Desayuno','Aperitivo','Comida','Merienda','Cena') NOT NULL,
  `raciones` int(11) NOT NULL,
  `glucosa_preingesta` int(11) NOT NULL,
  `insulina` int(11) NOT NULL,
  `glucosa_postingesta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comida`
--

INSERT INTO `comida` (`id_usuario`, `fecha_control`, `tipo_comida`, `raciones`, `glucosa_preingesta`, `insulina`, `glucosa_postingesta`) VALUES
(2, '2025-02-05', 'Desayuno', 3, 100, 5, 120),
(6, '2024-02-25', 'Desayuno', 3, 110, 6, 140),
(6, '2024-02-25', 'Comida', 5, 130, 8, 160),
(6, '2024-02-25', 'Cena', 4, 120, 7, 150),
(6, '2024-02-26', 'Desayuno', 3, 115, 5, 135),
(6, '2024-02-26', 'Comida', 4, 125, 7, 155),
(6, '2024-02-27', 'Merienda', 2, 105, 4, 130),
(7, '2025-03-19', 'Desayuno', 2147483647, 2147483647, 2147483647, 2147483647),
(7, '2025-03-19', 'Aperitivo', 3453, 234, 234, 3223),
(7, '2025-03-19', 'Comida', 34, 234, 234, 234),
(9, '2025-01-01', 'Desayuno', 2, 90, 4, 110),
(9, '2025-01-01', 'Comida', 3, 100, 5, 120),
(9, '2025-01-01', 'Cena', 2, 85, 3, 105),
(9, '2025-01-02', 'Desayuno', 2, 95, 4, 115),
(9, '2025-01-02', 'Comida', 3, 105, 5, 125),
(9, '2025-01-02', 'Cena', 2, 80, 3, 100),
(9, '2025-01-03', 'Desayuno', 2, 88, 4, 108),
(9, '2025-01-03', 'Comida', 3, 102, 5, 122),
(9, '2025-01-03', 'Cena', 2, 82, 3, 102),
(9, '2025-01-04', 'Desayuno', 2, 91, 4, 111),
(9, '2025-01-04', 'Comida', 3, 107, 5, 127),
(9, '2025-01-04', 'Cena', 2, 83, 3, 103),
(9, '2025-01-05', 'Desayuno', 2, 89, 4, 109),
(9, '2025-01-05', 'Comida', 3, 104, 5, 124),
(9, '2025-01-05', 'Cena', 2, 81, 3, 101),
(9, '2025-01-06', 'Desayuno', 2, 92, 4, 112),
(9, '2025-01-06', 'Comida', 3, 106, 5, 126),
(9, '2025-01-06', 'Cena', 2, 84, 3, 104),
(9, '2025-01-07', 'Desayuno', 2, 90, 4, 110),
(9, '2025-01-07', 'Comida', 3, 100, 5, 120),
(9, '2025-01-07', 'Cena', 2, 85, 3, 105),
(9, '2025-01-08', 'Desayuno', 2, 95, 4, 115),
(9, '2025-01-08', 'Comida', 3, 105, 5, 125),
(9, '2025-01-08', 'Cena', 2, 80, 3, 100),
(9, '2025-01-09', 'Desayuno', 2, 88, 4, 108),
(9, '2025-01-09', 'Comida', 3, 102, 5, 122),
(9, '2025-01-09', 'Cena', 2, 82, 3, 102),
(9, '2025-01-10', 'Desayuno', 2, 91, 4, 111),
(9, '2025-01-10', 'Comida', 3, 107, 5, 127),
(9, '2025-01-10', 'Cena', 2, 83, 3, 103),
(9, '2025-01-11', 'Desayuno', 2, 89, 4, 109),
(9, '2025-01-11', 'Comida', 3, 104, 5, 124),
(9, '2025-01-11', 'Cena', 2, 81, 3, 101),
(9, '2025-01-12', 'Desayuno', 2, 92, 4, 112),
(9, '2025-01-12', 'Comida', 3, 106, 5, 126),
(9, '2025-01-12', 'Cena', 2, 84, 3, 104),
(9, '2025-01-13', 'Desayuno', 2, 90, 4, 110),
(9, '2025-01-13', 'Comida', 3, 100, 5, 120),
(9, '2025-01-13', 'Cena', 2, 85, 3, 105),
(9, '2025-01-14', 'Desayuno', 2, 95, 4, 115),
(9, '2025-01-14', 'Comida', 3, 105, 5, 125),
(9, '2025-01-14', 'Cena', 2, 80, 3, 100),
(9, '2025-01-15', 'Desayuno', 2, 88, 4, 108),
(9, '2025-01-15', 'Comida', 3, 102, 5, 122),
(9, '2025-01-15', 'Cena', 2, 82, 3, 102),
(9, '2025-01-16', 'Desayuno', 2, 91, 4, 111),
(9, '2025-01-16', 'Comida', 3, 107, 5, 127),
(9, '2025-01-16', 'Cena', 2, 83, 3, 103),
(9, '2025-01-17', 'Desayuno', 2, 89, 4, 109),
(9, '2025-01-17', 'Comida', 3, 104, 5, 124),
(9, '2025-01-17', 'Cena', 2, 81, 3, 101),
(9, '2025-01-18', 'Desayuno', 2, 92, 4, 112),
(9, '2025-01-18', 'Comida', 3, 106, 5, 126),
(9, '2025-01-18', 'Cena', 2, 84, 3, 104),
(9, '2025-01-19', 'Desayuno', 2, 90, 4, 110),
(9, '2025-01-19', 'Comida', 3, 100, 5, 120),
(9, '2025-01-19', 'Cena', 2, 85, 3, 105),
(9, '2025-01-20', 'Desayuno', 2, 95, 4, 115),
(9, '2025-01-20', 'Comida', 3, 105, 5, 125),
(9, '2025-01-20', 'Cena', 2, 80, 3, 100),
(9, '2025-01-21', 'Desayuno', 2, 88, 4, 108),
(9, '2025-01-21', 'Comida', 3, 102, 5, 122),
(9, '2025-01-21', 'Cena', 2, 82, 3, 102),
(9, '2025-01-22', 'Desayuno', 2, 91, 4, 111),
(9, '2025-01-22', 'Comida', 3, 107, 5, 127),
(9, '2025-01-22', 'Cena', 2, 83, 3, 103),
(9, '2025-01-23', 'Desayuno', 2, 89, 4, 109),
(9, '2025-01-23', 'Comida', 3, 104, 5, 124),
(9, '2025-01-23', 'Cena', 2, 81, 3, 101),
(9, '2025-01-24', 'Desayuno', 2, 92, 4, 112),
(9, '2025-01-24', 'Comida', 3, 106, 5, 126),
(9, '2025-01-24', 'Cena', 2, 84, 3, 104),
(9, '2025-01-25', 'Desayuno', 2, 90, 4, 110),
(9, '2025-01-25', 'Comida', 3, 100, 5, 120),
(9, '2025-01-25', 'Cena', 2, 85, 3, 105),
(9, '2025-01-26', 'Desayuno', 2, 95, 4, 115),
(9, '2025-01-26', 'Comida', 3, 105, 5, 125),
(9, '2025-01-26', 'Cena', 2, 80, 3, 100),
(9, '2025-01-27', 'Desayuno', 2, 88, 4, 108),
(9, '2025-01-27', 'Comida', 3, 102, 5, 122),
(9, '2025-01-27', 'Cena', 2, 82, 3, 102),
(9, '2025-01-28', 'Desayuno', 2, 91, 4, 111),
(9, '2025-01-28', 'Comida', 3, 107, 5, 127),
(9, '2025-01-28', 'Cena', 2, 83, 3, 103),
(9, '2025-01-29', 'Desayuno', 2, 89, 4, 109),
(9, '2025-01-29', 'Comida', 3, 104, 5, 124),
(9, '2025-01-29', 'Cena', 2, 81, 3, 101),
(9, '2025-01-30', 'Desayuno', 2, 92, 4, 112),
(9, '2025-01-30', 'Comida', 3, 106, 5, 126),
(9, '2025-01-30', 'Cena', 2, 84, 3, 104),
(9, '2025-01-31', 'Desayuno', 2, 90, 4, 110),
(9, '2025-01-31', 'Comida', 3, 100, 5, 120),
(9, '2025-01-31', 'Cena', 2, 85, 3, 105),
(9, '2025-02-01', '', 2, 115, 12, 120),
(9, '2025-02-01', 'Desayuno', 2, 100, 10, 110),
(9, '2025-02-01', 'Comida', 2, 120, 15, 130),
(9, '2025-02-01', 'Merienda', 1, 85, 4, 80),
(9, '2025-02-01', 'Cena', 1, 90, 5, 95),
(9, '2025-03-18', 'Aperitivo', 234234, 213, 123, 43),
(9, '2025-03-18', 'Comida', 234234, 213, 123, 43),
(9, '2025-03-18', 'Merienda', 23, 234123, 123, 213),
(9, '2025-03-19', 'Cena', 1234, 1234, 1234, 2134);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `control_glucosa`
--

CREATE TABLE `control_glucosa` (
  `id_usuario` int(11) NOT NULL,
  `fecha_control` date NOT NULL,
  `glucosa_lenta` int(11) NOT NULL,
  `indice_actividad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `control_glucosa`
--

INSERT INTO `control_glucosa` (`id_usuario`, `fecha_control`, `glucosa_lenta`, `indice_actividad`) VALUES
(2, '2025-02-05', 110, 2),
(2, '2025-02-07', 9, 2),
(6, '2024-02-25', 12, 3),
(6, '2024-02-26', 0, 0),
(6, '2024-02-27', 10, 4),
(7, '2023-06-21', 0, 0),
(7, '2025-03-13', 4, 2),
(7, '2025-03-14', 4, 2),
(7, '2025-03-15', 4, 2),
(7, '2025-03-16', 4, 2),
(7, '2025-03-17', 3456, 1),
(7, '2025-03-18', 23452345, 4),
(7, '2025-03-19', 9999999, 2),
(9, '2025-01-01', 95, 2),
(9, '2025-01-02', 100, 3),
(9, '2025-01-03', 90, 2),
(9, '2025-01-04', 92, 2),
(9, '2025-01-05', 85, 1),
(9, '2025-01-06', 88, 2),
(9, '2025-01-07', 91, 3),
(9, '2025-01-08', 94, 2),
(9, '2025-01-09', 90, 2),
(9, '2025-01-10', 97, 3),
(9, '2025-01-11', 89, 2),
(9, '2025-01-12', 90, 2),
(9, '2025-01-13', 92, 2),
(9, '2025-01-14', 95, 3),
(9, '2025-01-15', 100, 3),
(9, '2025-01-16', 98, 2),
(9, '2025-01-17', 99, 2),
(9, '2025-01-18', 100, 3),
(9, '2025-01-19', 95, 2),
(9, '2025-01-20', 90, 2),
(9, '2025-01-21', 88, 2),
(9, '2025-01-22', 92, 2),
(9, '2025-01-23', 94, 3),
(9, '2025-01-24', 96, 2),
(9, '2025-01-25', 93, 2),
(9, '2025-01-26', 90, 2),
(9, '2025-01-27', 88, 2),
(9, '2025-01-28', 91, 3),
(9, '2025-01-29', 95, 2),
(9, '2025-01-30', 92, 2),
(9, '2025-01-31', 90, 2),
(9, '2025-02-01', 0, 0),
(9, '2025-02-02', 0, 0),
(9, '2025-02-03', 0, 0),
(9, '2025-02-04', 0, 0),
(9, '2025-02-05', 0, 0),
(9, '2025-02-06', 0, 0),
(9, '2025-02-07', 0, 0),
(9, '2025-02-08', 0, 0),
(9, '2025-02-09', 0, 0),
(9, '2025-02-10', 0, 0),
(9, '2025-02-11', 0, 0),
(9, '2025-02-12', 0, 0),
(9, '2025-02-13', 0, 0),
(9, '2025-02-14', 0, 0),
(9, '2025-02-15', 0, 0),
(9, '2025-02-16', 0, 0),
(9, '2025-02-17', 0, 0),
(9, '2025-02-18', 0, 0),
(9, '2025-02-19', 0, 0),
(9, '2025-02-20', 0, 0),
(9, '2025-02-21', 0, 0),
(9, '2025-02-22', 0, 0),
(9, '2025-02-23', 0, 0),
(9, '2025-02-24', 0, 0),
(9, '2025-02-25', 0, 0),
(9, '2025-02-26', 0, 0),
(9, '2025-02-27', 0, 0),
(9, '2025-02-28', 0, 0),
(9, '2025-03-12', 2345, 2),
(9, '2025-03-18', 0, 0),
(9, '2025-03-19', 123, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hiperglucemia`
--

CREATE TABLE `hiperglucemia` (
  `id_usuario` int(11) NOT NULL,
  `fecha_control` date NOT NULL,
  `tipo_comida` enum('Desayuno','Aperitivo','Comida','Merienda','Cena') NOT NULL,
  `glucosa_hiper` int(11) NOT NULL,
  `hora_hiper` time NOT NULL,
  `unidades_correccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `hiperglucemia`
--

INSERT INTO `hiperglucemia` (`id_usuario`, `fecha_control`, `tipo_comida`, `glucosa_hiper`, `hora_hiper`, `unidades_correccion`) VALUES
(2, '2025-02-05', 'Desayuno', 200, '08:30:00', 0),
(7, '2025-03-19', 'Desayuno', 3456543, '00:53:00', 34),
(9, '2025-01-01', 'Desayuno', 200, '08:30:00', 0),
(9, '2025-01-15', 'Comida', 220, '13:00:00', 1),
(9, '2025-01-20', 'Cena', 210, '19:00:00', 1),
(9, '2025-01-25', 'Desayuno', 230, '08:30:00', 1),
(9, '2025-03-18', 'Aperitivo', 12343, '04:31:00', 342),
(9, '2025-03-18', 'Comida', 12343, '04:31:00', 342);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hipoglucemia`
--

CREATE TABLE `hipoglucemia` (
  `id_usuario` int(11) NOT NULL,
  `fecha_control` date NOT NULL,
  `tipo_comida` enum('Desayuno','Aperitivo','Comida','Merienda','Cena') NOT NULL,
  `glucosa_hipo` int(11) NOT NULL,
  `hora_hipo` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `hipoglucemia`
--

INSERT INTO `hipoglucemia` (`id_usuario`, `fecha_control`, `tipo_comida`, `glucosa_hipo`, `hora_hipo`) VALUES
(6, '2024-02-26', 'Desayuno', 70, '08:45:00'),
(6, '2024-02-27', 'Merienda', 65, '17:15:00'),
(9, '2025-01-10', 'Desayuno', 70, '08:45:00'),
(9, '2025-01-15', 'Comida', 68, '13:30:00'),
(9, '2025-01-20', 'Cena', 60, '19:30:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `login` varchar(25) NOT NULL,
  `pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellidos`, `fecha_nacimiento`, `login`, `pass`) VALUES
(2, 'Juan', 'Pérez Gómez', '1990-05-15', 'juanperez', 'securepass'),
(3, 'Dario ', 'Sánchez Martín', '2025-01-15', 'dario', '$2a$12$Pc.0JXfeko3r2ax9nzdqau.lPWHY8KXaRCMUHNY4aLMTkPqmyiJkq'),
(4, 'Juan', 'juanitez perez', '2025-02-20', 'juanjp', '12345678'),
(5, 'Juan', 'juanitez perez', '2025-02-20', 'juanjp1', '12345678'),
(6, 'Dario ', 'Sánchez Martín', '2025-02-21', 'dariosm21', '$2y$10$I4MbuaVPf3Lip9n.Kd5cG.YcUAjBgR.yOouYSYeZJgzKpIR4DcLU6'),
(7, 'a', 'a', '2025-03-17', 'a', '$2y$10$6ZiTSNwh2Ta16bOwJ2Ihkucnu/mV6cgVXzMoLzFxJrgUd0iVt03Ky'),
(8, 'bb', 'bb', '2025-03-04', 'bb', '$2y$10$zUmGnaqr55gdegKxKfp.0ezjPECToS0LH9HQ.dwKBNaTHdeFvgfVS'),
(9, 'test', 'test', '2025-03-17', 'test', '$2y$10$uSrF/Q3PY.WWerHeGHntTeMXt6OfxMv.s.NMOryaL/6x6sV5rpa/O'),
(10, 'c', 'c', '2025-03-18', 'c', '$2y$10$O1iM6F./BMSrRb0Ml4AsoOQSJVb6Ux/b//29.6PcvMaBWjrqppCFu');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comida`
--
ALTER TABLE `comida`
  ADD PRIMARY KEY (`id_usuario`,`fecha_control`,`tipo_comida`);

--
-- Indices de la tabla `control_glucosa`
--
ALTER TABLE `control_glucosa`
  ADD PRIMARY KEY (`id_usuario`,`fecha_control`);

--
-- Indices de la tabla `hiperglucemia`
--
ALTER TABLE `hiperglucemia`
  ADD PRIMARY KEY (`id_usuario`,`fecha_control`,`tipo_comida`);

--
-- Indices de la tabla `hipoglucemia`
--
ALTER TABLE `hipoglucemia`
  ADD PRIMARY KEY (`id_usuario`,`fecha_control`,`tipo_comida`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comida`
--
ALTER TABLE `comida`
  ADD CONSTRAINT `comida_ibfk_1` FOREIGN KEY (`id_usuario`,`fecha_control`) REFERENCES `control_glucosa` (`id_usuario`, `fecha_control`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `control_glucosa`
--
ALTER TABLE `control_glucosa`
  ADD CONSTRAINT `control_glucosa_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `hiperglucemia`
--
ALTER TABLE `hiperglucemia`
  ADD CONSTRAINT `fk_hiperglucemia` FOREIGN KEY (`id_usuario`,`fecha_control`,`tipo_comida`) REFERENCES `comida` (`id_usuario`, `fecha_control`, `tipo_comida`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `hipoglucemia`
--
ALTER TABLE `hipoglucemia`
  ADD CONSTRAINT `fk_hipoglucemia` FOREIGN KEY (`id_usuario`,`fecha_control`,`tipo_comida`) REFERENCES `comida` (`id_usuario`, `fecha_control`, `tipo_comida`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
