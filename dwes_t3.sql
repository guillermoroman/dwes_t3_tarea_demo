-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 31, 2024 at 09:06 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dwes_t3`
--

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `correo_electronico` varchar(255) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clientes`
--

INSERT INTO `clientes` (`id`, `correo_electronico`, `telefono`, `nombre`, `direccion`) VALUES
(1, 'mario_bros@example.com', '555-0101', 'Mario', 'Reino Champiñón 1'),
(2, 'luigi_green@example.com', '555-0102', 'Luigi', 'Reino Champiñón 2'),
(3, 'peach_castle@example.com', '555-0103', 'Peach', 'Castillo de Peach'),
(4, 'toad_mushroom@example.com', '555-0104', 'Toad', 'Casa de Toad'),
(5, 'yoshi_dino@example.com', '555-0105', 'Yoshi', 'Isla de Yoshi'),
(6, 'bowser_king@example.com', '555-0106', 'Bowser', 'Castillo de Bowser'),
(7, 'daisy_flower@example.com', '555-0107', 'Daisy', 'Reino de Sarasaland'),
(8, 'wario_gold@example.com', '555-0108', 'Wario', 'Mansión de Wario'),
(9, 'waluigi_tricky@example.com', '555-0109', 'Waluigi', 'Apartamento de Waluigi'),
(10, 'donkeykong_banana@example.com', '555-0110', 'Donkey Kong', 'Jungla DK');

-- --------------------------------------------------------

--
-- Table structure for table `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `fecha_pedido` datetime DEFAULT NULL,
  `detalle_pedido` text DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `id_cliente`, `fecha_pedido`, `detalle_pedido`, `total`) VALUES
(1, 1, '2023-11-01 18:00:00', '1, 4, 8', 19.99),
(2, 2, '2023-11-01 18:15:00', '3, 8, 2', 10.99),
(3, 3, '2023-11-01 18:30:00', '1, 2, 7', 11.99),
(4, 4, '2023-11-01 19:00:00', '6, 8, 9', 9.99),
(5, 5, '2023-11-02 17:45:00', '2, 3', 12.99),
(6, 6, '2023-11-02 18:05:00', '8', 13.99),
(7, 7, '2023-11-02 18:20:00', '5, 9', 14.99),
(8, 8, '2023-11-02 18:40:00', '2, 5, 8', 11.99),
(9, 9, '2023-11-02 19:00:00', '3, 8, 9', 12.99),
(10, 10, '2023-11-03 18:00:00', '1, 8, 10', 9.99),
(11, 9, '2023-11-01 18:00:00', '2, 4', 19.99),
(12, 8, '2023-11-01 18:15:00', '3', 10.99),
(13, 7, '2023-11-01 18:30:00', '3, 9', 11.99),
(14, 7, '2023-11-01 19:00:00', '1, 8', 9.99),
(15, 6, '2023-11-02 17:45:00', '5', 12.99),
(16, 4, '2023-11-02 18:05:00', '4, 7', 13.99),
(17, 7, '2023-11-02 18:20:00', '8', 14.99),
(18, 8, '2023-11-02 18:40:00', '1, 9', 11.99),
(19, 9, '2023-11-02 19:00:00', '7, 8, 9', 12.99),
(20, 8, '2023-11-03 18:00:00', '8, 6', 9.99),
(21, 2, '2023-12-15 13:02:39', 'Margherita 8€\nMargherita 8€\n', 16.00),
(26, 3, '2023-12-15 15:19:01', 'Margherita 9€\n', 9.00),
(28, 1, '2024-01-31 20:28:23', 'Hawaiana, Margherita, Mexicana, Carbonara', 39.50);

-- --------------------------------------------------------

--
-- Table structure for table `pizzas`
--

CREATE TABLE `pizzas` (
  `ID` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `coste` float NOT NULL,
  `precio` float NOT NULL,
  `ingredientes` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pizzas`
--

INSERT INTO `pizzas` (`ID`, `nombre`, `coste`, `precio`, `ingredientes`) VALUES
(1, 'Margherita', 3, 9, 'Tomate, Mozzarella, Albahaca'),
(2, 'Pepperoni', 3.5, 9, 'Tomate, Mozzarella, Pepperoni'),
(3, 'Hawaiana', 4, 10, 'Tomate, Mozzarella, Jamón, Piña'),
(4, 'Cuatro Quesos', 4.5, 11, 'Mozzarella, Queso Azul, Queso de Cabra, Parmesano'),
(5, 'Vegetariana', 3.8, 9.5, 'Tomate, Mozzarella, Pimiento, Cebolla, Champiñones, Aceitunas'),
(6, 'BBQ Chicken', 4.5, 11, 'Salsa BBQ, Pollo, Cebolla, Mozzarella'),
(7, 'Mexicana', 4, 10.5, 'Tomate, Mozzarella, Jalapeños, Carne Picada, Cebolla'),
(8, 'Marinara', 2.5, 7.5, 'Tomate, Ajo, Orégano'),
(10, 'Carbonara', 4, 10, 'Nata, Mozzarella, Panceta, Cebolla'),
(32, 'prueba', 2, 3, 'prueba');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` int(11) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `password`, `rol`, `email`) VALUES
(1, 'admin', 'admin', '1234', 1, 'adfa@gmail.com'),
(2, 'usuario', 'Usuario', '1234', 2, 'usuario@gmail.com'),
(3, 'pepito52', 'Pepe', 'qwerty', 2, 'qwertree@gmail.com'),
(7, 'JoseMi', 'Jose Miguel', '1234', 2, 'asdf@gmail.com'),
(8, 'ud', 'ud', 'ud', 2, 'ud@ejemplo.com'),
(9, 'ud2', 'ud2', 'ud2', 2, 'ud2@ejemplo.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo_electronico` (`correo_electronico`);

--
-- Indexes for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_cliente` (`id_cliente`) USING BTREE;

--
-- Indexes for table `pizzas`
--
ALTER TABLE `pizzas`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `pizzas`
--
ALTER TABLE `pizzas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
