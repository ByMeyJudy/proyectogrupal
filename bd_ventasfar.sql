-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-12-2021 a las 19:53:45
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_ventasfar`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `ci` varchar(32) NOT NULL,
  `nombre` varchar(32) NOT NULL,
  `apellido` varchar(32) NOT NULL,
  `correo` varchar(128) NOT NULL,
  `celular` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `ci`, `nombre`, `apellido`, `correo`, `celular`) VALUES
(1, '11234', 'Marcelo', ' Quiroga', 'marcelo@mail.com', '77712345'),
(2, '17444', 'Caleb', 'Benitez', 'benitez@mail.org', '70012345'),
(3, '12344', 'Ursula', 'Gonzales', 'gonza@lacus.ca', '79112345'),
(5, '16674', 'Juan Carl', 'Arce', 'conejo@mail.com', '71512345'),
(6, '12341', 'Halee', 'Kirby', 'tiam@tempor.com', '72012345'),
(7, '11664', 'Marco', 'Perez', 'marco@mail.com', '71526789'),
(8, '12884', 'Pedro', 'Marquez', 'peter@mail.com', '72054578'),
(10, '19934', 'Luis', 'Callejas', 'lucho@mial.com', '77122456'),
(16, '13434', 'Marcelo Martins', 'Mamani', 'marcelo@mail.com', '70012345'),
(17, '12234', 'Juan', 'Capriles Luna', 'capri@mail.com', '78945612'),
(18, '78', 'Marcelo', 'Quirogaaaaaa', 'marcelo@mail.com', '78955675'),
(19, '12451381', 'Andres', 'Limachi Torrez', 'andres@gmail.com', '77512588');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(32) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` float NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `tipo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `cantidad`, `fecha`, `tipo_id`) VALUES
(1, 'Lujan', 'Para quemaduras', 20, 25, '2019-02-08', 1),
(2, 'Paracetamol ', ' Analgesico y antipiretico eficaz', 150, 300, '2019-02-08', 2),
(3, ' Capsaicina', 'Aliviar el dolor leve en los musculos y las articulaciones causado por la artritis', 300.8, 300, '2019-02-08', 1),
(4, 'Buprenorfina', 'Aliviar el dolor fuerte ', 250, 300, '2019-02-08', 4),
(5, 'Morfina ', 'Alivia el dolor fuerte', 250, 300, '2021-02-08', 2),
(6, 'Dextropropoxifeno ', 'Alivio del dolor leve a moderado', 132, 300, '2019-02-08', 2),
(7, 'Clonixinato de lisina', 'Analgesico y antiinflamatorio en pacientes que cursan con dolor agudo o cronico.', 20, 300, '2019-02-08', 1),
(8, 'Tramadol', 'Alivia Fracturas ,Luxaciones ,Infarto agudo del miocardio Cancer', 50, 300, '2019-02-08', 5),
(9, 'Lidocaina ', 'Anestesia local ,anestesia epidural caudal ,anestesia regional', 50000, 300, '2019-02-08', 5),
(10, 'Neostigmina', ' Tratamiento de la miastenia gravis (A)', 650, 300, '2019-02-08', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos`
--

CREATE TABLE `tipos` (
  `id` int(11) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `tipos`
--

INSERT INTO `tipos` (`id`, `descripcion`) VALUES
(1, 'Unguento'),
(2, 'Tableta'),
(3, 'Jarabe'),
(4, 'Parche'),
(5, 'Inyectable');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `email`, `password`) VALUES
(1, 'admin@mail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b'),
(2, 'amanda@mail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
(3, 'mery@mail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `producto_id`, `cliente_id`, `fecha`, `cantidad`, `precio`) VALUES
(1, 1, 3, '2019-02-08', 45, 300),
(2, 10, 5, '2018-01-08', 50, 700),
(4, 7, 2, '2014-07-08', 33, 900),
(5, 6, 1, '2019-05-07', 72, 200),
(16, 7, 19, '2021-12-03', 2, 34);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indices de la tabla `tipos`
--
ALTER TABLE `tipos`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `tipos`
--
ALTER TABLE `tipos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
