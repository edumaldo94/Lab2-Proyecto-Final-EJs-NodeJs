-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 27-05-2024 a las 14:54:45
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_sistlab3`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `analisis`
--

CREATE TABLE `analisis` (
  `id_analisis` int NOT NULL,
  `descripcion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `disponible` tinyint(1) DEFAULT NULL,
  `tipo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `analisis`
--

INSERT INTO `analisis` (`id_analisis`, `descripcion`, `disponible`, `tipo`) VALUES
(1, 'Hemograma', 1, NULL),
(2, 'Perfil Lipídico', 1, NULL),
(3, 'Prueba de Coagulación', 1, NULL),
(4, 'Función Renal', 1, NULL),
(5, 'Nivel de Vitamina D', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cambio_estado`
--

CREATE TABLE `cambio_estado` (
  `id` int NOT NULL,
  `id_estado` int DEFAULT NULL,
  `id_orden` int DEFAULT NULL,
  `id_examen` int DEFAULT NULL,
  `fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `cambio_estado`
--

INSERT INTO `cambio_estado` (`id`, `id_estado`, `id_orden`, `id_examen`, `fecha`) VALUES
(42, 4, 63, 10, '2023-11-07 12:39:27'),
(43, 4, 64, 11, '2023-11-07 12:40:01'),
(44, 4, 65, 13, '2023-11-07 12:48:41'),
(47, 3, 64, 11, '2024-01-31 14:59:34'),
(48, 3, 64, 11, '2024-02-01 16:05:23'),
(49, 3, 63, 10, '2024-02-01 16:06:38'),
(50, 4, 63, 10, '2024-02-01 16:08:08'),
(51, 3, 65, 13, '2024-02-01 16:37:43'),
(52, 2, 66, 14, '2024-02-01 16:40:00'),
(53, 4, 66, 14, '2024-02-03 21:05:26'),
(54, 4, 65, 13, '2024-02-03 21:06:07'),
(55, 4, 66, 14, '2024-02-03 21:17:02'),
(56, 3, 65, 13, '2024-02-03 21:17:17'),
(57, 3, 65, 13, '2024-02-03 21:18:04'),
(58, 4, 66, 14, '2024-02-03 21:18:56'),
(59, 3, 66, 14, '2024-02-03 21:25:56'),
(60, 4, 66, 14, '2024-02-04 03:49:05'),
(61, 2, 67, 15, '2024-02-04 15:06:55'),
(62, 4, 67, 15, '2024-02-04 15:08:19'),
(65, 2, 64, 11, '2024-02-10 15:32:19'),
(66, 4, 65, 13, '2024-02-10 15:32:24'),
(68, 4, 64, 11, '2024-02-13 14:45:04'),
(69, 2, 69, 18, '2024-02-13 15:04:54'),
(70, 4, 69, 19, '2024-02-13 15:48:02'),
(73, 3, 69, 18, '2024-02-13 20:20:26'),
(75, 4, 66, 14, '2024-02-13 21:36:16'),
(76, 4, 69, 18, '2024-02-13 21:36:51'),
(77, 3, 69, 19, '2024-02-13 21:37:41'),
(78, 3, 69, 18, '2024-02-13 23:54:35'),
(80, 4, 69, 19, '2024-02-14 00:31:15'),
(81, 4, 69, 18, '2024-02-14 00:31:17'),
(82, 4, 67, 15, '2024-02-14 00:51:39'),
(83, 4, 69, 19, '2024-02-14 00:52:11'),
(84, 4, 69, 19, '2024-02-14 22:34:42'),
(85, 3, 69, 18, '2024-02-14 22:36:35'),
(86, 3, 69, 18, '2024-02-14 22:41:06'),
(87, 3, 69, 18, '2024-02-14 22:44:41'),
(88, 4, 69, 19, '2024-02-14 22:46:23'),
(89, 3, 63, 10, '2024-02-15 00:09:03'),
(90, 4, 63, 10, '2024-02-16 23:31:54'),
(91, 4, 63, 10, '2024-02-16 23:32:00'),
(112, 2, 78, 47, '2024-02-21 13:35:33'),
(120, 1, 78, 47, '2024-02-21 22:17:39'),
(122, 2, 78, 47, '2024-02-21 22:26:34'),
(125, 2, 78, 48, '2024-02-22 00:15:30'),
(126, 1, 78, 47, '2024-02-22 02:19:06'),
(127, 2, 78, 49, '2024-02-22 02:19:06'),
(128, 2, 78, 47, '2024-02-22 13:45:46'),
(129, 1, 78, 49, '2024-02-22 17:52:35'),
(131, 2, 78, 48, '2024-02-22 18:02:34'),
(132, 2, 78, 48, '2024-02-22 18:02:34'),
(133, 1, 78, 47, '2024-02-22 18:02:34'),
(134, 2, 78, 47, '2024-02-22 18:05:28'),
(135, 1, 78, 49, '2024-02-22 18:09:00'),
(136, 2, 78, 49, '2024-02-22 18:09:22'),
(137, 1, 78, 48, '2024-02-22 21:26:29'),
(138, 2, 78, 48, '2024-02-22 21:28:50'),
(139, 2, 79, 50, '2024-02-22 21:45:34'),
(140, 4, 69, 18, '2024-02-27 21:15:02'),
(141, 4, 78, 47, '2024-02-27 22:54:21'),
(142, 5, 63, 10, '2024-02-27 23:46:58'),
(143, 4, 78, 48, '2024-02-28 11:54:12'),
(144, 5, 78, 47, '2024-02-28 11:59:09'),
(145, 4, 78, 49, '2024-02-28 22:13:08'),
(146, 5, 78, 48, '2024-02-28 22:14:14'),
(147, 5, 78, 49, '2024-02-28 22:40:41'),
(148, 5, 64, 11, '2024-02-28 22:53:23'),
(151, 5, 65, 13, '2024-03-05 11:04:38'),
(152, 5, 66, 14, '2024-04-30 01:42:46'),
(153, 2, 80, 51, '2024-05-02 02:53:02'),
(154, 2, 80, 52, '2024-05-02 02:53:02'),
(155, 4, 80, 51, '2024-05-02 02:58:23'),
(156, 4, 80, 52, '2024-05-02 02:59:04'),
(157, 5, 67, 15, '2024-05-02 03:00:06'),
(158, 5, 80, 51, '2024-05-02 03:00:15'),
(159, 5, 80, 52, '2024-05-02 03:01:06'),
(160, 2, 81, 53, '2024-05-02 11:42:08'),
(161, 2, 82, 54, '2024-05-02 11:51:14'),
(162, 2, 82, 55, '2024-05-02 11:51:14'),
(163, 2, 83, 56, '2024-05-02 11:56:33'),
(164, 2, 84, 57, '2024-05-02 12:02:35'),
(165, 4, 84, 57, '2024-05-02 12:03:53'),
(166, 4, 83, 56, '2024-05-02 12:17:10'),
(167, 4, 82, 54, '2024-05-02 12:19:52'),
(168, 4, 82, 55, '2024-05-02 12:22:31'),
(169, 4, 81, 53, '2024-05-02 12:28:35'),
(170, 4, 79, 50, '2024-05-02 12:30:49'),
(171, 2, 85, 58, '2024-05-02 12:34:23'),
(172, 2, 85, 59, '2024-05-02 12:34:23'),
(173, 4, 85, 58, '2024-05-02 12:35:10'),
(174, 4, 85, 59, '2024-05-02 12:44:19'),
(175, 2, 86, 60, '2024-05-02 12:52:22'),
(176, 4, 86, 60, '2024-05-02 12:56:02'),
(177, 2, 87, 61, '2024-05-02 13:02:24'),
(178, 2, 88, 62, '2024-05-02 13:02:50'),
(179, 2, 88, 63, '2024-05-02 13:02:50'),
(180, 2, 88, 64, '2024-05-02 13:02:50'),
(181, 4, 88, 63, '2024-05-02 13:06:44'),
(182, 4, 88, 62, '2024-05-02 13:06:56'),
(183, 4, 88, 64, '2024-05-02 13:09:11'),
(184, 4, 87, 61, '2024-05-02 13:18:13'),
(185, 2, 89, 66, '2024-05-02 13:19:11'),
(186, 2, 89, 67, '2024-05-02 13:19:11'),
(187, 2, 89, 65, '2024-05-02 13:19:11'),
(188, 4, 89, 65, '2024-05-02 13:19:52'),
(189, 4, 89, 66, '2024-05-02 13:20:06'),
(190, 4, 89, 67, '2024-05-02 13:20:21'),
(191, 5, 89, 67, '2024-05-02 13:22:06'),
(192, 3, 84, 57, '2024-05-02 13:22:26'),
(193, 5, 89, 66, '2024-05-02 13:23:10'),
(194, 5, 89, 65, '2024-05-02 13:23:18'),
(195, 4, 84, 57, '2024-05-02 13:39:20'),
(196, 3, 84, 57, '2024-05-02 13:41:42'),
(198, 4, 84, 57, '2024-05-02 13:43:18'),
(199, 3, 84, 57, '2024-05-02 13:43:20'),
(203, 4, 84, 57, '2024-05-02 13:49:44'),
(206, 3, 83, 56, '2024-05-02 13:58:13'),
(207, 4, 83, 56, '2024-05-02 13:59:29'),
(208, 5, 82, 54, '2024-05-02 14:02:42'),
(209, 3, 81, 53, '2024-05-14 12:47:10'),
(210, 2, 90, 68, '2024-05-15 11:27:27'),
(211, 2, 90, 69, '2024-05-15 11:27:27'),
(212, 4, 90, 68, '2024-05-15 12:25:35'),
(213, 4, 90, 69, '2024-05-15 12:25:47'),
(214, 4, 81, 53, '2024-05-15 12:29:45'),
(215, 5, 90, 68, '2024-05-15 12:30:15'),
(216, 5, 90, 69, '2024-05-15 12:31:10'),
(217, 1, 91, 70, '2024-05-15 12:33:33'),
(219, 2, 91, 70, '2024-05-15 12:53:02'),
(220, 1, 91, 70, '2024-05-15 12:56:42'),
(221, 2, 91, 70, '2024-05-15 12:57:05'),
(224, 1, 91, 70, '2024-05-20 23:19:11'),
(226, 2, 91, 70, '2024-05-20 23:19:27'),
(228, 1, 91, 70, '2024-05-20 23:55:48'),
(229, 2, 91, 70, '2024-05-21 00:18:56'),
(230, 1, 91, 70, '2024-05-21 00:25:07'),
(231, 2, 91, 70, '2024-05-21 00:25:54'),
(232, 1, 91, 70, '2024-05-21 00:30:44'),
(233, 2, 91, 70, '2024-05-21 00:31:41'),
(234, 1, 91, 70, '2024-05-21 00:32:13'),
(235, 2, 91, 70, '2024-05-21 00:32:32'),
(236, 1, 91, 70, '2024-05-21 00:37:07'),
(237, 2, 91, 70, '2024-05-21 00:37:51'),
(238, 1, 91, 70, '2024-05-21 00:51:37'),
(239, 2, 91, 70, '2024-05-21 00:59:22'),
(240, 1, 91, 70, '2024-05-21 01:00:51'),
(241, 2, 91, 70, '2024-05-21 01:01:43'),
(243, 2, 91, 73, '2024-05-21 01:32:37'),
(244, 1, 91, 70, '2024-05-21 01:34:22'),
(245, 2, 91, 70, '2024-05-21 01:41:11'),
(247, 1, 91, 73, '2024-05-21 01:50:13'),
(248, 2, 91, 73, '2024-05-21 01:50:30'),
(249, 1, 91, 73, '2024-05-21 01:52:14'),
(250, 2, 91, 73, '2024-05-21 01:52:53'),
(251, 1, 91, 73, '2024-05-21 01:54:47'),
(252, 2, 91, 73, '2024-05-21 02:05:51'),
(253, 2, 91, 75, '2024-05-21 02:18:53'),
(254, 3, 85, 59, '2024-05-21 16:23:52'),
(255, 3, 69, 19, '2024-05-21 17:36:04'),
(256, 3, 81, 53, '2024-05-21 17:41:33'),
(257, 5, 69, 18, '2024-05-21 17:41:49'),
(258, 4, 91, 75, '2024-05-21 17:49:30'),
(259, 4, 91, 73, '2024-05-21 17:50:29'),
(260, 4, 91, 70, '2024-05-21 19:20:43'),
(261, 2, 92, 76, '2024-05-21 19:25:58'),
(262, 2, 92, 77, '2024-05-21 19:25:58'),
(263, 2, 92, 78, '2024-05-21 19:25:58'),
(278, 2, 98, 93, '2024-05-21 21:35:32'),
(279, 2, 98, 94, '2024-05-21 21:35:32'),
(280, 2, 98, 95, '2024-05-21 21:35:32'),
(281, 2, 98, 96, '2024-05-21 21:35:32'),
(282, 4, 98, 95, '2024-05-21 21:50:47'),
(283, 4, 98, 96, '2024-05-21 21:51:53'),
(284, 4, 98, 94, '2024-05-21 22:01:16'),
(285, 4, 98, 93, '2024-05-21 22:01:53'),
(286, 4, 92, 78, '2024-05-21 22:21:02'),
(287, 4, 92, 77, '2024-05-21 22:22:06'),
(288, 4, 92, 76, '2024-05-21 22:33:55'),
(289, 2, 99, 97, '2024-05-21 22:36:32'),
(290, 2, 99, 98, '2024-05-21 22:36:32'),
(291, 2, 99, 99, '2024-05-21 22:36:32'),
(292, 2, 99, 101, '2024-05-21 22:36:32'),
(293, 2, 99, 100, '2024-05-21 22:36:32'),
(294, 4, 99, 97, '2024-05-21 22:37:21'),
(295, 4, 99, 98, '2024-05-21 22:37:43'),
(296, 4, 99, 100, '2024-05-21 22:38:01'),
(297, 4, 99, 99, '2024-05-21 22:38:14'),
(298, 4, 99, 101, '2024-05-21 22:38:32'),
(299, 4, 69, 19, '2024-05-21 22:47:51'),
(300, 4, 81, 53, '2024-05-21 22:48:10'),
(301, 4, 85, 59, '2024-05-21 22:48:34'),
(302, 5, 85, 59, '2024-05-21 22:59:33'),
(303, 5, 69, 19, '2024-05-21 22:59:53'),
(304, 5, 79, 50, '2024-05-21 22:59:57'),
(305, 5, 82, 55, '2024-05-21 23:00:02'),
(306, 5, 83, 56, '2024-05-21 23:00:07'),
(307, 5, 86, 60, '2024-05-21 23:00:13'),
(308, 5, 81, 53, '2024-05-21 23:00:17'),
(341, 2, 116, 127, '2024-05-22 14:43:21'),
(342, 2, 116, 128, '2024-05-22 14:43:21'),
(343, 1, 116, 129, '2024-05-22 14:43:21'),
(344, 4, 116, 127, '2024-05-22 14:44:48'),
(345, 2, 116, 129, '2024-05-22 14:45:15'),
(348, 1, 116, 131, '2024-05-22 14:46:33'),
(349, 2, 116, 131, '2024-05-22 14:46:47'),
(350, 4, 116, 128, '2024-05-22 14:47:18'),
(351, 4, 116, 129, '2024-05-22 14:47:24'),
(352, 4, 116, 131, '2024-05-22 14:47:34'),
(353, 5, 116, 127, '2024-05-22 14:48:37'),
(354, 5, 116, 128, '2024-05-22 14:48:42'),
(355, 3, 116, 131, '2024-05-22 14:56:40'),
(356, 3, 116, 129, '2024-05-22 14:56:46'),
(357, 3, 88, 62, '2024-05-22 14:58:54'),
(358, 3, 88, 63, '2024-05-22 14:58:59'),
(359, 4, 116, 129, '2024-05-22 15:06:23'),
(360, 4, 116, 131, '2024-05-22 15:06:29'),
(361, 5, 116, 129, '2024-05-22 15:06:48'),
(362, 5, 116, 131, '2024-05-22 15:06:54'),
(363, 4, 88, 62, '2024-05-22 15:37:27'),
(364, 4, 88, 63, '2024-05-22 15:38:24'),
(365, 3, 84, 57, '2024-05-22 15:40:56'),
(366, 3, 87, 61, '2024-05-22 15:41:00'),
(367, 3, 88, 62, '2024-05-22 15:41:04'),
(368, 3, 88, 64, '2024-05-22 15:41:07'),
(369, 4, 88, 62, '2024-05-22 15:41:37'),
(370, 4, 87, 61, '2024-05-22 15:41:54'),
(371, 4, 88, 64, '2024-05-22 15:42:14'),
(372, 4, 84, 57, '2024-05-22 15:42:22'),
(373, 5, 84, 57, '2024-05-22 15:42:44'),
(374, 5, 85, 58, '2024-05-22 15:42:50'),
(375, 5, 91, 70, '2024-05-22 18:47:29'),
(376, 5, 91, 73, '2024-05-22 18:47:36'),
(377, 5, 91, 75, '2024-05-22 18:47:43'),
(378, 3, 98, 96, '2024-05-22 19:13:23'),
(379, 3, 98, 93, '2024-05-22 19:13:35'),
(380, 5, 98, 94, '2024-05-22 19:13:55'),
(381, 5, 98, 95, '2024-05-22 19:14:03'),
(382, 4, 98, 93, '2024-05-22 19:14:35'),
(383, 4, 98, 96, '2024-05-22 19:14:44'),
(384, 5, 98, 93, '2024-05-22 19:15:07'),
(385, 5, 98, 96, '2024-05-22 19:15:18'),
(386, 2, 117, 132, '2024-05-22 21:10:25'),
(387, 2, 117, 133, '2024-05-22 21:10:25'),
(388, 4, 117, 133, '2024-05-22 21:11:08'),
(389, 4, 117, 132, '2024-05-22 21:11:23'),
(390, 5, 117, 132, '2024-05-22 21:11:57'),
(391, 5, 117, 133, '2024-05-22 21:12:12'),
(392, 3, 87, 61, '2024-05-23 14:32:35'),
(393, 5, 92, 78, '2024-05-23 15:06:51'),
(394, 2, 118, 134, '2024-05-23 15:22:53'),
(395, 1, 118, 135, '2024-05-23 15:22:53'),
(396, 2, 119, 136, '2024-05-23 15:42:32'),
(397, 2, 120, 137, '2024-05-23 15:48:23'),
(398, 2, 120, 138, '2024-05-23 15:48:23'),
(399, 4, 87, 61, '2024-05-23 15:57:13'),
(400, 4, 120, 137, '2024-05-23 15:57:31'),
(401, 4, 120, 138, '2024-05-23 15:57:38'),
(402, 4, 118, 134, '2024-05-23 15:58:59'),
(403, 4, 119, 136, '2024-05-23 15:59:14'),
(404, 2, 121, 139, '2024-05-23 16:00:13'),
(405, 4, 121, 139, '2024-05-23 16:01:37'),
(406, 3, 87, 61, '2024-05-23 16:04:20'),
(407, 3, 88, 63, '2024-05-23 16:04:22'),
(408, 5, 88, 62, '2024-05-23 16:04:28'),
(409, 5, 120, 137, '2024-05-23 16:04:37'),
(410, 5, 120, 138, '2024-05-23 16:04:46'),
(411, 5, 121, 139, '2024-05-23 16:04:54'),
(412, 4, 87, 61, '2024-05-23 16:06:23'),
(413, 1, 122, 140, '2024-05-23 16:11:08'),
(414, 2, 122, 141, '2024-05-23 16:11:08'),
(415, 2, 122, 142, '2024-05-23 16:11:08'),
(416, 2, 123, 143, '2024-05-23 16:23:15'),
(417, 1, 123, 144, '2024-05-23 16:23:15'),
(418, 2, 123, 145, '2024-05-23 16:23:15'),
(419, 2, 122, 140, '2024-05-23 16:24:41'),
(420, 4, 122, 140, '2024-05-23 16:25:37'),
(421, 4, 122, 142, '2024-05-23 16:25:54'),
(422, 4, 122, 141, '2024-05-23 16:26:13'),
(423, 4, 88, 63, '2024-05-23 16:26:25'),
(424, 5, 122, 140, '2024-05-23 16:27:52'),
(425, 5, 122, 142, '2024-05-23 16:27:59'),
(426, 5, 122, 141, '2024-05-23 16:28:04'),
(427, 1, 124, 146, '2024-05-23 16:33:45'),
(428, 2, 124, 147, '2024-05-23 16:33:45'),
(429, 2, 124, 148, '2024-05-23 16:33:45'),
(430, 1, 125, 149, '2024-05-23 16:35:08'),
(431, 2, 125, 150, '2024-05-23 16:35:08'),
(432, 2, 126, 151, '2024-05-23 16:39:58'),
(433, 2, 126, 153, '2024-05-23 16:39:58'),
(434, 1, 126, 154, '2024-05-23 16:39:58'),
(435, 2, 126, 152, '2024-05-23 16:39:58'),
(436, 1, 127, 155, '2024-05-23 16:56:26'),
(437, 2, 127, 156, '2024-05-23 16:56:26'),
(438, 1, 128, 157, '2024-05-23 16:58:01'),
(439, 2, 128, 158, '2024-05-23 16:58:01'),
(440, 2, 129, 159, '2024-05-23 17:00:32'),
(441, 2, 129, 160, '2024-05-23 17:00:32'),
(442, 2, 126, 153, '2024-05-23 17:01:35'),
(443, 2, 129, 159, '2024-05-23 17:01:51'),
(444, 2, 128, 157, '2024-05-23 17:29:06'),
(445, 4, 126, 151, '2024-05-23 17:30:18'),
(446, 4, 126, 153, '2024-05-23 17:30:37'),
(447, 4, 126, 152, '2024-05-23 17:30:53'),
(448, 5, 126, 151, '2024-05-23 17:31:08'),
(449, 5, 126, 152, '2024-05-23 17:31:13'),
(450, 5, 126, 153, '2024-05-23 17:31:16'),
(451, 2, 130, 161, '2024-05-23 18:11:17'),
(452, 2, 130, 162, '2024-05-23 18:11:17'),
(453, 2, 130, 163, '2024-05-23 18:11:56'),
(454, 4, 130, 161, '2024-05-23 18:15:50'),
(455, 4, 130, 162, '2024-05-23 18:16:04'),
(456, 4, 130, 163, '2024-05-23 18:22:07'),
(457, 3, 130, 161, '2024-05-23 18:26:26'),
(458, 4, 130, 161, '2024-05-23 18:27:06'),
(459, 5, 130, 161, '2024-05-23 18:27:42'),
(460, 5, 130, 162, '2024-05-23 18:27:53'),
(461, 5, 130, 163, '2024-05-23 18:28:03'),
(462, 2, 125, 149, '2024-05-23 18:31:57'),
(463, 4, 125, 149, '2024-05-23 18:32:56'),
(464, 4, 125, 150, '2024-05-23 18:33:09'),
(465, 5, 125, 149, '2024-05-23 18:33:55'),
(466, 5, 125, 150, '2024-05-23 18:34:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `determinacion`
--

CREATE TABLE `determinacion` (
  `id_determinacion` int NOT NULL,
  `valor` float DEFAULT NULL,
  `unidad_medida` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `nombre` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `id_analisis` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `determinacion`
--

INSERT INTO `determinacion` (`id_determinacion`, `valor`, `unidad_medida`, `nombre`, `id_analisis`) VALUES
(104, 0, 'x10^6/mm³', 'Recuento de Glóbulos Rojos', 1),
(106, 0, 'g/dL', 'Hemoglobina', 1),
(108, 0, '%', 'Hematocrito', 1),
(110, 0, 'fL', 'VCM (Volumen Corpuscular Medio)', 1),
(112, 0, 'pg', 'HCM (Hemoglobina Corpuscular Media)', 1),
(114, 0, 'células/mm³', 'Recuento de Glóbulos Blancos', 1),
(116, 0, 'mg/dL', 'Colesterol Total', 2),
(117, 0, 'mg/dL', 'Colesterol LDL', 2),
(119, 0, 'mg/dL', 'Colesterol HDL', 2),
(121, 0, 'mg/dL', 'Triglicéridos ', 2),
(123, 0, 'mg/dL', 'Colesterol VLDL', 2),
(125, 0, NULL, 'Índice de Aterogenicidad', 2),
(126, 0, 's', 'Tiempo de Protrombina (PT)', 3),
(127, 0, 's', 'Tiempo Parcial de Tromboplastina Activado (aPTT)', 3),
(128, 0, '%', 'Razón Internacional Normalizada (INR)', 3),
(129, 0, 'mg/dL', 'Dímero D', 3),
(130, 0, 'g/dL', 'Fibrinógeno', 3),
(131, 0, 'mg/dL', 'Antitrombina III', 3),
(132, 0, '%', 'Actividad de la Proteína C', 3),
(133, 0, '%', 'Actividad de la Proteína S', 3),
(134, 0, 'mg/dL', 'Creatinina Sérica', 4),
(136, 0, 'mg/dL', 'Nitrógeno Ureico en Sangre (BUN)', 4),
(138, 0, 'mL/min/1.73m²', 'eGFR', 4),
(140, 0, 'ng/mL', 'Deficiencia de vitamina D', 5),
(141, 0, 'ng/mL', 'Insuficiencia de vitamina D', 5),
(142, 0, 'ng/mL', 'Suficiencia óptima de vitamina D', 5),
(143, 0, 'ng/mL', 'Rango óptimo para la salud ósea', 5),
(144, 0, 'ng/mL', 'Rango óptimo para la salud general', 5),
(150, 0, 'nmol/L', 'Deficiencia de vitamina D', 5),
(151, 0, 'nmol/L', 'Insuficiencia de vitamina D', 5),
(152, 0, 'nmol/L', 'Suficiencia óptima de vitamina D', 5),
(153, 0, 'nmol/L', 'Rango óptimo para la salud ósea', 5),
(154, 0, 'nmol/L', 'Rango óptimo para la salud general', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` int NOT NULL,
  `nombre` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `nombre`) VALUES
(1, 'Esperando Toma de muestras'),
(2, 'Analitica'),
(3, 'Pre Informe'),
(4, 'Para validar'),
(5, 'Informada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etiqueta_muestra`
--

CREATE TABLE `etiqueta_muestra` (
  `id_etiqueta` int NOT NULL,
  `id_orden` int DEFAULT NULL,
  `id_muestra` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examen`
--

CREATE TABLE `examen` (
  `id_examen` int NOT NULL,
  `id_orden` int DEFAULT NULL,
  `descripcion` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `resultado` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `fecha_resultado` date DEFAULT NULL,
  `id_analisis` int DEFAULT NULL,
  `ex_estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `examen`
--

INSERT INTO `examen` (`id_examen`, `id_orden`, `descripcion`, `resultado`, `fecha_resultado`, `id_analisis`, `ex_estado`) VALUES
(10, 63, 'werwer', 'reactivo', NULL, 5, 1),
(11, 64, 'dsfsd', 'reactivo', NULL, 4, 1),
(13, 65, 'Recuento de Glóbulos Rojos', 'reactivo', NULL, 1, 1),
(14, 66, 'dsfsd', 'reactivo', NULL, 3, 1),
(15, 67, 'dfsdsf dsfssdf', 'no reactivo', NULL, 4, 1),
(18, 69, '', 'reactivo', NULL, 1, 1),
(19, 69, 'ghjhgjhg', 'reactivo', NULL, 2, 1),
(47, 78, 'No presenta cambios', 'No reactivo', NULL, 4, 1),
(48, 78, 'R. Globlos rojos, Hemoglobina y R. Globulos Blancos alterados', 'reactivo', NULL, 1, 1),
(49, 78, 'Deficiencia y Rango optimo para salud osea alterados.', 'reactivo', NULL, 5, 1),
(50, 79, 'hgjhgj', 'reactivo', NULL, 3, 1),
(51, 80, 'sdfsdfsd', 'reactivo', NULL, 4, 1),
(52, 80, 'fdfdf fdfdfd dfsdsf', 'reactivo', NULL, 2, 1),
(53, 81, 'hgjhj', 'reactivo', NULL, 4, 1),
(54, 82, '', 'reactivo', NULL, 5, 0),
(55, 82, 'hgjghjhjgj', 'reactivo', NULL, 1, 1),
(56, 83, 'ghjhgj', 'reactivo', NULL, 1, 1),
(57, 84, 'fdfdf fdfdfd dfsdsf', 'reactivo', NULL, 4, 1),
(58, 85, 'jhkjhk', 'reactivo', NULL, 4, 1),
(59, 85, 'fdgfdgfdgdfg', 'reactivo', NULL, 2, 1),
(60, 86, 'hgjhgj', 'reactivo', NULL, 4, 1),
(61, 87, '', NULL, NULL, 3, 1),
(62, 88, 'fdfdf fdfdfd dfsdsf', 'reactivo', NULL, 1, 1),
(63, 88, '', NULL, NULL, 4, 1),
(64, 88, '', NULL, NULL, 5, 1),
(65, 89, 'sdfsdfsd', 'reactivo', NULL, 1, 1),
(66, 89, 'dfsdsf dsfssdf', 'reactivo', NULL, 3, 1),
(67, 89, 'dfsdsf dsfssdf', 'reactivo', NULL, 5, 1),
(68, 90, 'jhkjhk', 'reactivo', NULL, 4, 1),
(69, 90, 'dfsdsf dsfssdf', 'reactivo', NULL, 2, 1),
(70, 91, '', 'reactivo', NULL, 5, 1),
(73, 91, 'fdfdf fdfdfd dfsdsf', 'reactivo', NULL, 4, 1),
(75, 91, 'jhkjhk', 'reactivo', NULL, 1, 1),
(76, 92, '', NULL, NULL, 1, 1),
(77, 92, '', NULL, NULL, 2, 1),
(78, 92, 'fdfdf fdfdfd dfsdsf', 'reactivo', NULL, 4, 1),
(93, 98, 'jhkjhk', 'no reactivo', NULL, 1, 1),
(94, 98, 'jhkjhk', 'reactivo', NULL, 2, 1),
(95, 98, 'sdfsdfsd', 'reactivo', NULL, 4, 1),
(96, 98, 'fdfdf fdfdfd dfsdsf', 'no reactivo', NULL, 5, 1),
(97, 99, '', NULL, NULL, 1, 1),
(98, 99, '', NULL, NULL, 2, 1),
(99, 99, '', NULL, NULL, 3, 1),
(100, 99, '', NULL, NULL, 4, 1),
(101, 99, '', NULL, NULL, 5, 1),
(127, 116, 'fdgdfg', 'reactivo', NULL, 3, 1),
(128, 116, 'gdfdf', 'reactivo', NULL, 5, 1),
(129, 116, 'dsfsdfsdf', 'no reactivo', NULL, 4, 1),
(131, 116, 'dsfdsfdsf', 'no reactivo', NULL, 1, 1),
(132, 117, 'ok', 'reactivo', NULL, 3, 1),
(133, 117, 'ok', 'no reactivo', NULL, 5, 1),
(134, 118, '', NULL, NULL, 1, 1),
(135, 118, '', NULL, NULL, 3, 0),
(136, 119, '', NULL, NULL, 2, 1),
(137, 120, 'fdfdf fdfdfd dfsdsf', 'reactivo', NULL, 2, 1),
(138, 120, 'Recuento de Glóbulos Rojos', 'reactivo', NULL, 4, 1),
(139, 121, 'Recuento de Glóbulos Rojos', 'reactivo', NULL, 4, 1),
(140, 122, 'ok', 'reactivo', NULL, 1, 1),
(141, 122, 'dfsdsf dsfssdf', 'reactivo', NULL, 5, 1),
(142, 122, 'Recuento de Glóbulos Rojos', 'no reactivo', NULL, 3, 1),
(143, 123, '', NULL, NULL, 3, 0),
(144, 123, '', NULL, NULL, 4, 0),
(145, 123, '', NULL, NULL, 1, 0),
(146, 124, '', NULL, NULL, 4, 0),
(147, 124, '', NULL, NULL, 1, 0),
(148, 124, '', NULL, NULL, 3, 0),
(149, 125, 'ok', 'reactivo', NULL, 3, 1),
(150, 125, 'ok', 'reactivo', NULL, 4, 1),
(151, 126, '45645', 'reactivo', NULL, 3, 1),
(152, 126, '45645', 'reactivo', NULL, 5, 1),
(153, 126, '456456', 'reactivo', NULL, 2, 1),
(154, 126, '', NULL, NULL, 4, 0),
(155, 127, '', NULL, NULL, 1, 0),
(156, 127, '', NULL, NULL, 3, 0),
(157, 128, '', NULL, NULL, 3, 0),
(158, 128, '', NULL, NULL, 4, 0),
(159, 129, '', NULL, NULL, 2, 0),
(160, 129, '', NULL, NULL, 4, 0),
(161, 130, 'dfsdsf dsfssdf', 'reactivo', NULL, 1, 1),
(162, 130, 'hgjhgj', 'no reactivo', NULL, 4, 1),
(163, 130, 'dfsdsf dsfssdf', 'reactivo', NULL, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guia_muestra`
--

CREATE TABLE `guia_muestra` (
  `id_guiaM` int NOT NULL,
  `id_analisis` int DEFAULT NULL,
  `g_descripcion` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `estadoG` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `guia_muestra`
--

INSERT INTO `guia_muestra` (`id_guiaM`, `id_analisis`, `g_descripcion`, `estadoG`) VALUES
(1, 1, 'Sangre', 0),
(2, 4, 'Orina', 0),
(3, 2, 'Sangre', 0),
(4, 3, 'Sangre', 0),
(5, 5, 'Sangre', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `muestra`
--

CREATE TABLE `muestra` (
  `id_muestra` int NOT NULL,
  `id_orden` int DEFAULT NULL,
  `fecha_recoleccion` date DEFAULT NULL,
  `entregado` tinyint(1) DEFAULT NULL,
  `id_guiaM` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `muestra`
--

INSERT INTO `muestra` (`id_muestra`, `id_orden`, `fecha_recoleccion`, `entregado`, `id_guiaM`) VALUES
(48, 63, '2023-11-07', 1, 5),
(49, 64, NULL, 1, 2),
(50, 65, '2023-11-07', 1, 2),
(51, 65, '2023-11-07', 1, 1),
(52, 67, '2024-02-04', 1, 2),
(55, 69, '2024-02-13', 1, 1),
(56, 69, '2024-02-13', 1, 3),
(81, 78, '2024-02-21', 1, 2),
(82, 78, '2024-02-22', 1, 1),
(83, 78, '2024-02-22', 1, 5),
(84, 79, '2024-02-22', 1, 4),
(85, 80, '2024-05-02', 1, 2),
(86, 80, '2024-05-02', 1, 3),
(87, 81, '2024-05-02', 1, 2),
(88, 82, '2024-05-02', 1, 5),
(89, 82, '2024-05-02', 1, 1),
(90, 83, '2024-05-02', 1, 1),
(91, 84, '2024-05-02', 1, 2),
(92, 85, '2024-05-02', 1, 2),
(93, 85, '2024-05-02', 1, 3),
(94, 86, '2024-05-02', 1, 2),
(95, 87, '2024-05-02', 1, 4),
(96, 88, '2024-05-02', 1, 1),
(97, 88, '2024-05-02', 1, 2),
(98, 88, '2024-05-02', 1, 5),
(99, 89, '2024-05-02', 1, 4),
(100, 89, '2024-05-02', 1, 5),
(101, 89, '2024-05-02', 1, 1),
(102, 90, '2024-05-15', 1, 2),
(103, 90, '2024-05-15', 1, 3),
(104, 91, NULL, 1, 5),
(107, 91, '2024-05-21', 1, 2),
(109, 91, '2024-05-21', 1, 1),
(110, 92, '2024-05-21', 1, 1),
(111, 92, '2024-05-21', 1, 3),
(112, 92, '2024-05-21', 1, 2),
(127, 98, '2024-05-21', 1, 1),
(128, 98, '2024-05-21', 1, 3),
(129, 98, '2024-05-21', 1, 2),
(130, 98, '2024-05-21', 1, 5),
(131, 99, '2024-05-21', 1, 1),
(132, 99, '2024-05-21', 1, 3),
(133, 99, '2024-05-21', 1, 4),
(134, 99, '2024-05-21', 1, 5),
(135, 99, '2024-05-21', 1, 2),
(154, 116, '2024-05-22', 1, 4),
(155, 116, '2024-05-22', 1, 5),
(156, 116, NULL, 1, 2),
(158, 116, NULL, 1, 1),
(159, 117, '2024-05-22', 1, 4),
(160, 117, '2024-05-22', 1, 5),
(161, 118, NULL, 0, 4),
(162, 118, '2024-05-23', 1, 1),
(163, 119, '2024-05-23', 1, 3),
(164, 120, '2024-05-23', 1, 3),
(165, 120, '2024-05-23', 1, 2),
(166, 121, '2024-05-23', 1, 2),
(167, 122, NULL, 1, 1),
(168, 122, '2024-05-23', 1, 5),
(169, 122, '2024-05-23', 1, 4),
(170, 123, '2024-05-23', 1, 4),
(171, 123, NULL, 0, 2),
(172, 123, '2024-05-23', 1, 1),
(173, 124, NULL, 0, 2),
(174, 124, '2024-05-23', 1, 1),
(175, 124, '2024-05-23', 1, 4),
(176, 125, NULL, 1, 4),
(177, 125, '2024-05-23', 1, 2),
(178, 126, '2024-05-23', 1, 4),
(179, 126, '2024-05-23', 1, 3),
(180, 126, NULL, 1, 2),
(181, 126, '2024-05-23', 1, 5),
(182, 127, NULL, 0, 1),
(183, 127, '2024-05-23', 1, 4),
(184, 128, NULL, 1, 4),
(185, 128, '2024-05-23', 1, 2),
(186, 129, NULL, 1, 3),
(187, 129, '2024-05-23', 1, 2),
(188, 130, '2024-05-23', 1, 1),
(189, 130, '2024-05-23', 1, 2),
(190, 130, '2024-05-23', 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `id_orden` int NOT NULL,
  `id_pedido` int DEFAULT NULL,
  `id_analisis` int DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_entrega` datetime DEFAULT NULL,
  `prioridad` tinyint(1) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `estado_final` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`id_orden`, `id_pedido`, `id_analisis`, `fecha_creacion`, `fecha_entrega`, `prioridad`, `estado`, `estado_final`) VALUES
(63, 70, 1, '2023-07-11 00:00:00', '2024-02-23 23:00:52', 1, 1, 1),
(64, 71, 4, '2023-07-11 00:00:00', '2024-02-24 23:01:01', 0, 1, 1),
(65, 72, 1, '2023-07-11 00:00:00', '2024-02-21 23:01:07', 0, 1, 1),
(66, 73, NULL, '2024-02-01 00:00:00', '2024-02-26 23:01:15', 0, 1, NULL),
(67, 74, NULL, '2024-02-04 00:00:00', '2024-02-26 23:01:21', 0, 1, NULL),
(69, 76, NULL, '2024-02-15 00:00:00', '2024-02-28 19:46:20', 0, 1, NULL),
(78, 86, NULL, '2024-02-21 00:00:00', '2024-03-14 00:00:00', 1, 1, 1),
(79, 87, NULL, '2024-02-22 00:00:00', '2024-02-25 00:00:00', 0, 1, 0),
(80, 88, NULL, '2024-05-02 00:00:00', '2024-05-18 00:00:00', 0, 1, 1),
(81, 89, NULL, '2024-05-02 00:00:00', '2024-05-18 00:00:00', 0, 1, 1),
(82, 90, NULL, '2024-05-02 00:00:00', '2024-05-28 00:00:00', 0, 1, 1),
(83, 91, NULL, '2024-05-02 00:00:00', '2024-05-18 00:00:00', 0, 1, 1),
(84, 92, NULL, '2024-05-02 00:00:00', '2024-05-18 00:00:00', 0, 1, 0),
(85, 93, NULL, '2024-05-02 00:00:00', '2024-05-26 00:00:00', 0, 1, 0),
(86, 94, NULL, '2024-05-02 00:00:00', '2024-05-26 00:00:00', 0, 1, 0),
(87, 95, NULL, '2024-05-02 00:00:00', '2024-05-18 00:00:00', 0, 1, 0),
(88, 96, NULL, '2024-05-02 00:00:00', '2024-05-22 00:00:00', 0, 1, 0),
(89, 97, NULL, '2024-05-02 00:00:00', '2024-05-25 00:00:00', 0, 1, 1),
(90, 98, NULL, '2024-05-26 00:00:00', '2024-05-30 00:00:00', 1, 1, 1),
(91, 99, NULL, '2024-05-15 00:00:00', '2024-05-25 00:00:00', 0, 1, 1),
(92, 100, NULL, '2024-05-21 00:00:00', '2024-05-25 00:00:00', 0, 1, 0),
(98, 106, NULL, '2024-05-21 00:00:00', '2024-05-23 00:00:00', 0, 1, 1),
(99, 107, NULL, '2024-05-21 00:00:00', '2024-05-31 00:00:00', 0, 1, 0),
(116, 124, NULL, '2024-05-22 00:00:00', '2024-06-08 00:00:00', 1, 1, 1),
(117, 125, NULL, '2024-05-22 00:00:00', '2024-06-08 00:00:00', 0, 1, 1),
(118, 126, NULL, '2024-05-23 00:00:00', '2024-06-08 00:00:00', 0, 1, 0),
(119, 127, NULL, '2024-05-23 00:00:00', '2024-06-08 00:00:00', 0, 1, 0),
(120, 128, NULL, '2024-05-23 00:00:00', '2024-06-09 00:00:00', 0, 1, 0),
(121, 129, NULL, '2024-05-23 00:00:00', '2024-06-07 00:00:00', 0, 1, 0),
(122, 130, NULL, '2024-05-23 00:00:00', '2024-06-09 00:00:00', 1, 1, 1),
(123, 131, NULL, '2024-05-23 00:00:00', '2024-06-08 00:00:00', 1, 1, 0),
(124, 132, NULL, '2024-05-23 00:00:00', '2024-05-26 00:00:00', 0, 1, 0),
(125, 133, NULL, '2024-05-23 00:00:00', '2024-06-08 00:00:00', 0, 1, 1),
(126, 134, NULL, '2024-05-23 00:00:00', '2024-06-09 00:00:00', 1, 1, 0),
(127, 135, NULL, '2024-05-23 00:00:00', '2024-06-02 00:00:00', 0, 1, 0),
(128, 136, NULL, '2024-05-23 00:00:00', '2024-06-09 00:00:00', 0, 1, 0),
(129, 137, NULL, '2024-05-23 00:00:00', '2024-06-07 00:00:00', 0, 1, 0),
(130, 138, NULL, '2024-05-23 00:00:00', '2024-06-08 00:00:00', 1, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL,
  `id_persona` int DEFAULT NULL,
  `diagnostico` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `nombre_medico` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `nro_matricula` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `id_persona`, `diagnostico`, `nombre_medico`, `nro_matricula`) VALUES
(70, 1, 'D1', 'Juan', 456456),
(71, 1, 'D2', 'Juan', 456456),
(72, 1, 'Dolor de cabeza', 'Juan', 456456),
(73, 19, 'Cancer', 'Ramallo David', 235678),
(74, 22, 'Dolor de cabeza', 'Moyano Hugo', 123789),
(76, 9, 'Dolor de cabeza', 'Ramallo David', 235678),
(86, 20, 'Diabetes y Gastroenteritis', 'Ramallo David', 235678),
(87, 20, 'Cancer', 'Moyano Hugo', 123789),
(88, 55, 'Cancer', 'Ramallo David', 235678),
(89, 55, 'Dolor de riñones', 'Moyano Hugo', 123789),
(90, 55, 'Gastroenteritis', 'Moyano Hugo', 123789),
(91, 55, 'Gastroenteritis', 'Ramallo David', 235678),
(92, 55, 'Dolor de riñones', 'Ramallo David', 235678),
(93, 32, 'Cancer', 'Ramallo David', 235678),
(94, 9, 'Dolor de riñones', 'Moyano Hugo', 123789),
(95, 29, 'Gastroenteritis', 'Moyano Hugo', 123789),
(96, 29, 'Dolor de riñones', 'Moyano Hugo', 123789),
(97, 32, 'Dolor de riñones', 'Moyano Hugo', 123789),
(98, 63, 'Dolor de riñones', 'Ramallo David', 235678),
(99, 63, 'Gastroenteritis', 'Moyano Hugo', 123789),
(100, 43, 'Dolor de riñones', 'Ramallo David', 235678),
(101, 10, 'Dolor de riñones', 'Moyano Hugo', 123789),
(102, 10, 'Dolor de riñones', 'Moyano Hugo', 235678),
(103, 10, 'Dolor de riñones', 'Ramallo David', 123789),
(104, 10, 'Cancer', 'Ramallo David', 235678),
(105, 10, 'Cancer', 'Moyano Hugo', 235678),
(106, 10, 'Cancer', 'Ramallo David', 235678),
(107, 4, 'Gastroenteritis', 'Moyano Hugo', 123789),
(108, 64, 'Gastroenteritis', 'Moyano Hugo', 235678),
(109, 64, 'Gastroenteritis', 'Ramallo David', 235678),
(110, 64, 'Gastroenteritis', 'Ramallo David', 235678),
(111, 64, 'Gastroenteritis', 'Moyano Hugo', 123789),
(112, 64, 'Gastroenteritis', 'Ramallo David', 235678),
(113, 64, 'Gastroenteritis', 'Ramallo David', 235678),
(114, 64, 'Cancer', 'Ramallo David', 123789),
(115, 64, 'Cancer', 'Ramallo David', 235678),
(116, 64, 'Gastroenteritis', 'Moyano Hugo', 235678),
(117, 64, 'Gastroenteritis', 'Ramallo David', 235678),
(118, 64, 'Gastroenteritis', 'Moyano Hugo', 123789),
(119, 64, 'Gastroenteritis', 'Moyano Hugo', 123789),
(120, 64, 'Gastroenteritis', 'Ramallo David', 235678),
(121, 64, 'Gastroenteritis', 'Ramallo David', 235678),
(122, 64, 'Gastroenteritis', 'Ramallo David', 235678),
(123, 64, 'Gastroenteritis', 'Ramallo David', 235678),
(124, 64, 'Gastroenteritis', 'Ramallo David', 235678),
(125, 51, 'Dolor de huesos', 'Moyano Hugo', 123789),
(126, 65, 'Gastroenteritis', 'Ramallo David', 235678),
(127, 66, 'Gastroenteritis', 'Moyano Hugo', 235678),
(128, 67, 'Dolor de huesos', 'Moyano Hugo', 123789),
(129, 64, 'Cancer', 'Ramallo David', 235678),
(130, 67, 'Dolor de huesos', 'Moyano Hugo', 235678),
(131, 43, 'Gastroenteritis', 'Moyano Hugo', 235678),
(132, 68, 'Gastroenteritis', 'Moyano Hugo', 235678),
(133, 68, 'Gastroenteritis', 'Ramallo David', 235678),
(134, 69, 'Gastroenteritis', 'Ramallo David', 123789),
(135, 69, 'Dolor de huesos', 'Ramallo David', 235678),
(136, 69, 'Gastroenteritis', 'Ramallo David', 235678),
(137, 69, 'Gastroenteritis', 'Moyano Hugo', 123789),
(138, 9, 'Gastroenteritis', 'Ramallo David', 235678);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id_persona` int NOT NULL,
  `nombre` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `apellido` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `dni` bigint DEFAULT NULL,
  `fecha_nacimient` date DEFAULT NULL,
  `genero` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `embarazada` tinyint(1) DEFAULT NULL,
  `provincia` varchar(100) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `ciudad` varchar(100) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `direccion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `tel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `email` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id_persona`, `nombre`, `apellido`, `dni`, `fecha_nacimient`, `genero`, `embarazada`, `provincia`, `ciudad`, `direccion`, `tel`, `email`) VALUES
(1, 'Juan', 'Becerra', 35765481, '1987-02-13', 'M', NULL, NULL, NULL, 'Concaran', '2664789692', 'juanbee18@gmail.com'),
(2, 'Matias', 'Oviedo', 39405879, '1999-09-12', 'M', NULL, NULL, NULL, 'Calle 103', '2674896529', 'mati@gmail.com'),
(3, 'Erika', 'Lopez', 46789456, '1979-07-23', 'F', NULL, NULL, NULL, 'Av. Mitre, Ciudad Y', '2665725882', 'erika.lopez@hotmail.com'),
(4, 'Leonel', 'Messi', 40789435, '1985-01-01', 'M', NULL, NULL, NULL, 'Calle T, Ciudad Z', '(0387)272869', 'leo_messi@hotmail.com'),
(5, 'Lautaro', 'Maldonado', 37505648, '2005-10-31', 'M', NULL, NULL, NULL, 'Calle Washington, Ciudad W', '(011)548274', 'lati_ojosverdes@yahoo.com'),
(6, 'Jose', 'Rodriguez', 27856413, '1996-09-04', 'M', NULL, NULL, NULL, 'Av. Peron, Ciudad V', '2664495749', 'josesito@gmail.com'),
(7, 'Juan', 'Perez', 34505981, '1994-09-12', 'M', NULL, NULL, NULL, 'Calle 123, Ciudad X', '2664894523', 'juan.perez@gmail.com'),
(8, 'Maria', 'Lopez', 44505873, '1973-05-23', 'F', NULL, NULL, NULL, 'Av. Principal, Ciudad Y', '2657425587', 'maria.lopez@hotmail.com'),
(9, 'Carlos', 'Gomez', 44544743, '1962-11-01', 'M', NULL, NULL, NULL, 'Calle A, Ciudad Z', '(0387)232566', 'carlos-gomez@hotmail.com'),
(10, 'Laura', 'Martinez', 14505156, '1943-10-31', 'F', NULL, 'Jujuy', 'kjhjkhjhk', 'Calle B, Ciudad W', '(011)568974', 'laura_martinez@yahoo.com'),
(11, 'Jose', 'Rodriguez', 12618987, '1956-02-04', 'M', NULL, NULL, NULL, 'Av. Secundaria, Ciudad V', '2664895641', 'jose.rodriguez@gmail.com'),
(12, 'Luis', 'Gonzalez', 39405678, '1985-08-25', 'M', NULL, NULL, NULL, 'Av. Libertador 123, Ciudad A', '2664894523', 'luis.gonzalez@gmail.com'),
(13, 'Ana', 'Martinez', 44506987, '1990-12-15', 'F', NULL, NULL, NULL, 'Calle 456, Ciudad B', '2657425587', 'ana.martinez@hotmail.com'),
(14, 'Carlos Emanuel', 'Lopez', 40405698, '1988-04-30', 'M', NULL, NULL, NULL, 'Av. Central 789, Ciudad C', '(0387)239566', 'carlos.lez@hotmail.com'),
(15, 'Laura', 'Garcia', 37501234, '1976-06-10', 'F', NULL, NULL, NULL, 'Calle 789, Ciudad D', '(011)568974', 'laura.garcia@yahoo.com'),
(16, 'Miguel', 'Rodriguez', 27852346, '1995-02-18', 'M', NULL, NULL, NULL, 'Av. Principal 101, Ciudad E', '2664895641', 'miguel.rodriguez@gmail.com'),
(17, 'Elena', 'Fernandez', 49012345, '1982-11-28', 'F', NULL, NULL, NULL, 'Calle 555, Ciudad F', '2664895642', 'elena.fernandez@gmail.com'),
(18, 'David', 'Sanchez', 38576912, '1989-07-03', 'M', NULL, NULL, NULL, 'Av. Secundaria 202, Ciudad G', '2664895643', 'david.sanchez@gmail.com'),
(19, 'Sofia', 'Perez', 42098765, '1979-09-01', 'F', NULL, NULL, NULL, 'Calle 666, Ciudad H', '2664895644', 'sofia.perez@gmail.com'),
(20, 'Javier A', 'Gomez', 39561234, '1983-03-16', 'M', NULL, 'Corrientes', 'rarar', 'Av. Final 303, Ciudad I', '2664895645', 'javier.gomez@gmail.com'),
(21, 'Paula', 'Diaz', 41098765, '1987-05-22', 'F', NULL, NULL, NULL, 'Calle 777, Ciudad J', '2664895646', 'paula.diaz@gmail.com'),
(22, 'Eduardo A', 'Maldonado', 37505981, '2023-10-11', 'M', NULL, 'La Pampa', 'fdsfsdf', 'Chile 268', '26557245596', 'maldonado19994@gmail.com'),
(23, 'Adrian', 'Velazque', 36874152, '1994-10-13', 'M', NULL, NULL, NULL, 'Chile 999', '2657894512', 'adri89@gmail.com'),
(29, 'Adrian', 'Velazque', 37774152, '1987-02-13', 'M', NULL, 'Entre Ríos', 'fghfgh', 'Chile 999', '2664522243', 'velazque@gmail.com'),
(32, 'Franco', 'De Paul', 35467865, '1987-02-13', 'M', NULL, NULL, NULL, 'europa 234', '2664789632', 'educarp18@gmail.com'),
(35, 'Luis', 'Gomez', 40578963, '1999-02-19', 'M', NULL, NULL, NULL, 'Pringles 896', '2657896354', 'luis23@gmail.com'),
(36, 'Julieta', 'Magallanes', 34896751, '1979-12-14', 'F', NULL, NULL, NULL, 'Francia 2', '3789456231', 'juli_ojosazules@gmail.com'),
(37, 'Angela Luz', 'Leiva', 26584712, '1988-10-12', 'F', NULL, NULL, NULL, '25 de mayo', '2657412589', 'angelaleiva@gmail.com'),
(38, 'Nicolas', 'Z', 23456789, '1995-04-05', 'M', NULL, NULL, NULL, 'Bolivia 256', '2657889944', 'nico@gmail.com'),
(40, 'Anahi', 'Maldonado', 44589714, '1986-12-31', 'F', NULL, NULL, NULL, 'Chile 268', '26647115678', 'anamaldo19994@gmail.com'),
(42, 'Fabricio', 'Machuca', 46852147, '1994-08-14', 'M', NULL, NULL, NULL, 'Chile 987', '2568478521', 'fabri994@gmail.com'),
(43, 'Nicolas', 'Neuman', 18103753, '1987-02-13', 'F', NULL, 'Chubut', 'uyyu', 'darct 987', '2657887442', 'neuman@gmail.com'),
(44, 'anibal', 'maldocena', 11803987, '1904-08-19', 'F', NULL, NULL, NULL, 'sargento 234', '23435456', 'ani@gmail.com'),
(47, 'Roberta', 'Pachano', 11999987, '1913-08-09', 'F', 0, NULL, NULL, 'sargento 1234', '23435456', 'ani@gmail.com'),
(48, 'joana', 'Villalba', 11505874, '1923-05-03', 'f', 1, NULL, NULL, 'Chile 99', '2657484745', 'jo@gmail.com'),
(50, 'joaka', 'peloduro', 11505882, '1922-11-05', 'f', 1, NULL, NULL, 'viva francia', '02657895623', 'jolala@gmail.com'),
(51, 'malvina', 'kakaroto', 25987410, '1954-06-23', 'f', 1, 'Misiones', 'fsdfsd', 'Pringles 278', '23656894', 'mal@gmail.com'),
(52, 'Camila', 'Oviedo', 47444555, '1996-06-05', 'f', 1, NULL, NULL, 'Villa Mercedes', '2664223344', 'camilaov@gmail.com'),
(53, 'Carolina', 'Pereyra', 38338967, '2001-07-12', 'f', 0, NULL, NULL, 'villa Dolores', '2222334455', 'caro@gmail.com'),
(55, 'Marcelo', 'Gallardo', 21456789, '1981-02-01', 'm', NULL, 'Córdoba', 'La cañada', 'Paraguay 456', '0113587425612', 'marce_gallardo@gmail.com'),
(63, 'Griselda Beatriz', 'Maldonado', 41789563, '2024-05-10', 'F', 1, 'San Luis', 'Villa Mercedes', 'Chile 268', '2664495749', 'gris@gmail.com'),
(64, 'Santino', 'Saber', 55768412, '2015-07-21', 'M', NULL, 'San Luis', 'Villa Mercedes', 'Guayaquil 23', '265572455', 'santi@gmail.com'),
(65, 'Leonel', 'Scalonni', 34567123, '2009-06-23', 'M', NULL, 'Misiones', 'la yerba', 'yerba 123', '2657345623', 'javier@gmail.com'),
(66, 'Jazmin', 'Xipolitakis', 11223334, '2024-06-07', 'F', 1, 'La Rioja', 'la quebrada', 'q 123', '2657894512', 'jaz@gmail.com'),
(67, 'Jeremias', 'Gomez', 36987452, '2002-03-02', 'M', NULL, 'Mendoza', 'fsdfsd', 'ddfs 345', '2664894523', 'jerejo@gmail.com'),
(68, 'Naldo', 'Lombardi', 37514896, '1946-01-01', 'M', NULL, 'Mendoza', 'Villa Mercedes', 'Paraguay', '23434546456', 'naldo@gmail.com'),
(69, 'Pepito', 'Pepa', 11236965, '2024-06-05', 'M', NULL, 'San Luis', 'sdadsa', 'asdsa 21', '3232232323', 'pep@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_valores`
--

CREATE TABLE `registro_valores` (
  `id_reg` int NOT NULL,
  `id_determinacion` int NOT NULL,
  `id_examen` int NOT NULL,
  `valor` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `registro_valores`
--

INSERT INTO `registro_valores` (`id_reg`, `id_determinacion`, `id_examen`, `valor`) VALUES
(82, 140, 10, 5),
(83, 141, 10, 4.5),
(84, 142, 10, 12),
(85, 143, 10, 10),
(86, 144, 10, 11.8),
(87, 150, 10, 45),
(88, 151, 10, 0.78),
(89, 152, 10, 66),
(90, 153, 10, 101),
(91, 154, 10, 2),
(98, 106, 13, 14.5),
(99, 104, 13, 9),
(100, 108, 13, 46.7),
(101, 110, 13, 89),
(102, 112, 13, 32.9),
(103, 114, 13, 2199),
(200, 128, 14, 1.1),
(201, 126, 14, 12.5),
(202, 127, 14, 34.7),
(203, 129, 14, 0.4),
(204, 130, 14, 405),
(205, 131, 14, 100),
(206, 132, 14, 75),
(207, 133, 14, 111),
(208, 134, 15, 1.14),
(209, 136, 15, 19),
(210, 138, 15, 95),
(226, 134, 11, 21),
(227, 136, 11, 54),
(228, 138, 11, 7),
(241, 104, 18, 9),
(242, 106, 18, 45),
(243, 112, 18, 1),
(244, 108, 18, 8),
(245, 110, 18, 89),
(246, 114, 18, 2199),
(247, 116, 19, 120),
(248, 117, 19, 45),
(249, 125, 19, 9),
(250, 119, 19, 50),
(251, 121, 19, 100),
(252, 123, 19, 50),
(253, 134, 47, 1.21),
(254, 136, 47, 19),
(255, 138, 47, 95),
(256, 104, 48, 7),
(257, 106, 48, 18),
(258, 112, 48, 29),
(259, 108, 48, 46),
(260, 110, 48, 85),
(261, 114, 48, 11010),
(262, 140, 49, 21),
(263, 141, 49, 23),
(264, 142, 49, 41),
(265, 151, 49, 53),
(266, 143, 49, 45),
(267, 144, 49, 59),
(268, 150, 49, 20),
(269, 152, 49, 76),
(270, 153, 49, 76),
(271, 154, 49, 120),
(272, 134, 51, 54),
(273, 136, 51, 8),
(274, 138, 51, 96),
(275, 116, 52, 25),
(276, 125, 52, 4.5),
(277, 117, 52, 110),
(278, 119, 52, 55),
(279, 121, 52, 23),
(280, 123, 52, 4),
(281, 136, 57, 8),
(282, 134, 57, 0.96),
(283, 138, 57, 96),
(284, 104, 56, 45),
(285, 106, 56, 5),
(286, 108, 56, 5),
(287, 110, 56, 2),
(288, 112, 56, 54),
(289, 114, 56, 12),
(290, 140, 54, 78),
(291, 141, 54, 6),
(292, 142, 54, 56),
(293, 150, 54, 8),
(294, 143, 54, 5),
(295, 144, 54, 45),
(296, 151, 54, 9),
(297, 153, 54, 54),
(298, 152, 54, 76),
(299, 154, 54, 5),
(300, 104, 55, 4),
(301, 106, 55, 2),
(302, 108, 55, 6),
(303, 110, 55, 32),
(304, 112, 55, 56),
(305, 114, 55, 3),
(306, 134, 53, 54),
(307, 136, 53, 8),
(308, 138, 53, 96),
(309, 126, 50, 3),
(310, 127, 50, 4),
(311, 128, 50, 54),
(312, 131, 50, 7),
(313, 129, 50, 56),
(314, 130, 50, 6),
(315, 132, 50, 88),
(316, 133, 50, 9),
(317, 134, 58, 54),
(318, 136, 58, 8),
(319, 138, 58, 96),
(320, 116, 59, 54),
(321, 117, 59, 21),
(322, 119, 59, 45),
(323, 121, 59, 21),
(324, 123, 59, 45),
(325, 125, 59, 65),
(326, 134, 60, 0.96),
(327, 136, 60, 8),
(328, 138, 60, 96),
(329, 134, 63, 0.96),
(330, 136, 63, 8),
(331, 138, 63, 96),
(332, 104, 62, 45),
(333, 106, 62, 2),
(334, 108, 62, 5),
(335, 110, 62, 2),
(336, 112, 62, 56),
(337, 114, 62, 3),
(338, 140, 64, 78),
(339, 141, 64, 6),
(340, 142, 64, 56),
(341, 144, 64, 45),
(342, 143, 64, 5),
(343, 152, 64, 76),
(344, 150, 64, 8),
(345, 151, 64, 9),
(346, 153, 64, 54),
(347, 154, 64, 5),
(348, 126, 61, 3),
(349, 127, 61, 4),
(350, 131, 61, 7),
(351, 128, 61, 54),
(352, 129, 61, 56),
(353, 130, 61, 6),
(354, 132, 61, 88),
(355, 133, 61, 9),
(356, 104, 65, 4),
(357, 106, 65, 5),
(358, 114, 65, 12),
(359, 108, 65, 5),
(360, 110, 65, 2),
(361, 112, 65, 54),
(362, 126, 66, 3),
(363, 127, 66, 4),
(364, 128, 66, 54),
(365, 130, 66, 6),
(366, 129, 66, 56),
(367, 131, 66, 7),
(368, 132, 66, 88),
(369, 133, 66, 9),
(370, 140, 67, 78),
(371, 141, 67, 6),
(372, 142, 67, 56),
(373, 144, 67, 45),
(374, 143, 67, 5),
(375, 150, 67, 8),
(376, 151, 67, 9),
(377, 152, 67, 76),
(378, 153, 67, 54),
(379, 154, 67, 5),
(380, 136, 68, 8),
(381, 134, 68, 54),
(382, 138, 68, 96),
(383, 116, 69, 25),
(384, 117, 69, 21),
(385, 119, 69, 55),
(386, 121, 69, 23),
(387, 123, 69, 45),
(388, 125, 69, 4.5),
(389, 104, 75, 45),
(390, 106, 75, 45),
(391, 108, 75, 45),
(392, 110, 75, 5),
(393, 112, 75, 7),
(394, 114, 75, 54),
(395, 134, 73, 45),
(396, 136, 73, 546),
(397, 138, 73, 56),
(398, 140, 70, 45),
(399, 141, 70, 5),
(400, 142, 70, 5),
(401, 144, 70, 5),
(402, 143, 70, 5),
(403, 150, 70, 5),
(404, 151, 70, 5),
(405, 152, 70, 5),
(406, 153, 70, 5),
(407, 154, 70, 5),
(408, 136, 95, 546),
(409, 134, 95, 54),
(410, 138, 95, 96),
(411, 140, 96, 78),
(412, 141, 96, 6),
(413, 142, 96, 56),
(414, 144, 96, 5),
(415, 143, 96, 5),
(416, 151, 96, 9),
(417, 150, 96, 8),
(418, 152, 96, 5),
(419, 153, 96, 54),
(420, 154, 96, 5),
(421, 116, 94, 25),
(422, 117, 94, 110),
(423, 125, 94, 4.5),
(424, 119, 94, 55),
(425, 121, 94, 23),
(426, 123, 94, 4),
(427, 104, 93, 45),
(428, 106, 93, 5),
(429, 108, 93, 5),
(430, 110, 93, 56),
(431, 112, 93, 6),
(432, 114, 93, 6),
(433, 134, 78, 54),
(434, 136, 78, 8),
(435, 138, 78, 96),
(436, 116, 77, 25),
(437, 117, 77, 110),
(438, 119, 77, 55),
(439, 123, 77, 45),
(440, 121, 77, 23),
(441, 125, 77, 4.5),
(442, 104, 76, 45),
(443, 106, 76, 5),
(444, 108, 76, 5),
(445, 114, 76, 54),
(446, 110, 76, 5),
(447, 112, 76, 6),
(448, 104, 97, 45),
(449, 106, 97, 5),
(450, 108, 97, 5),
(451, 110, 97, 5),
(452, 112, 97, 6),
(453, 114, 97, 3),
(454, 116, 98, 25),
(455, 117, 98, 110),
(456, 119, 98, 55),
(457, 121, 98, 23),
(458, 123, 98, 45),
(459, 125, 98, 4.5),
(460, 134, 100, 54),
(461, 136, 100, 8),
(462, 138, 100, 96),
(463, 126, 99, 3),
(464, 127, 99, 4),
(465, 128, 99, 54),
(466, 131, 99, 7),
(467, 129, 99, 56),
(468, 130, 99, 6),
(469, 133, 99, 9),
(470, 132, 99, 88),
(471, 140, 101, 45),
(472, 141, 101, 6),
(473, 142, 101, 56),
(474, 144, 101, 45),
(475, 143, 101, 5),
(476, 150, 101, 8),
(477, 151, 101, 9),
(478, 152, 101, 76),
(479, 153, 101, 54),
(480, 154, 101, 5),
(481, 126, 127, 5),
(482, 127, 127, 35),
(483, 128, 127, 45),
(484, 132, 127, 5),
(485, 129, 127, 54),
(486, 130, 127, 45),
(487, 131, 127, 45),
(488, 133, 127, 5),
(489, 140, 128, 3),
(490, 141, 128, 324),
(491, 150, 128, 5),
(492, 142, 128, 42),
(493, 143, 128, 3),
(494, 144, 128, 3),
(495, 151, 128, 4),
(496, 152, 128, 45),
(497, 153, 128, 3),
(498, 154, 128, 43),
(499, 134, 129, 43),
(500, 136, 129, 4),
(501, 138, 129, 4),
(502, 104, 131, 34),
(503, 106, 131, 34),
(504, 108, 131, 4),
(505, 110, 131, 4),
(506, 112, 131, 3),
(507, 114, 131, 3),
(508, 140, 133, 78),
(509, 141, 133, 6),
(510, 142, 133, 56),
(511, 143, 133, 5),
(512, 144, 133, 45),
(513, 150, 133, 5),
(514, 151, 133, 9),
(515, 152, 133, 76),
(516, 153, 133, 54),
(517, 154, 133, 5),
(518, 126, 132, 3),
(519, 127, 132, 35),
(520, 129, 132, 56),
(521, 132, 132, 88),
(522, 131, 132, 7),
(523, 130, 132, 6),
(524, 128, 132, 54),
(525, 133, 132, 9),
(526, 116, 137, 25),
(527, 117, 137, 21),
(528, 125, 137, 4.5),
(529, 123, 137, 45),
(530, 119, 137, 55),
(531, 121, 137, 23),
(532, 134, 138, 54),
(533, 136, 138, 8),
(534, 138, 138, 96),
(535, 104, 134, 45),
(536, 106, 134, 2),
(537, 114, 134, 2089),
(538, 108, 134, 6),
(539, 110, 134, 56),
(540, 112, 134, 7),
(541, 116, 136, 25),
(542, 117, 136, 110),
(543, 119, 136, 55),
(544, 121, 136, 23),
(545, 123, 136, 4),
(546, 125, 136, 4.5),
(547, 134, 139, 0.96),
(548, 136, 139, 546),
(549, 138, 139, 96),
(550, 104, 140, 45),
(551, 106, 140, 2),
(552, 108, 140, 44.7),
(553, 112, 140, 7),
(554, 110, 140, 56),
(555, 114, 140, 54),
(556, 126, 142, 5),
(557, 127, 142, 35),
(558, 128, 142, 45),
(559, 131, 142, 45),
(560, 129, 142, 54),
(561, 130, 142, 6),
(562, 132, 142, 88),
(563, 133, 142, 9),
(564, 140, 141, 45),
(565, 141, 141, 6),
(566, 142, 141, 56),
(567, 150, 141, 5),
(568, 143, 141, 3),
(569, 144, 141, 45),
(570, 151, 141, 5),
(571, 152, 141, 76),
(572, 153, 141, 5),
(573, 154, 141, 5),
(574, 126, 151, 3),
(575, 127, 151, 4),
(576, 128, 151, 45),
(577, 129, 151, 56),
(578, 130, 151, 45),
(579, 132, 151, 88),
(580, 131, 151, 5),
(581, 133, 151, 9),
(582, 116, 153, 54),
(583, 117, 153, 21),
(584, 119, 153, 55),
(585, 121, 153, 23),
(586, 123, 153, 45),
(587, 125, 153, 4.5),
(588, 140, 152, 45),
(589, 141, 152, 5),
(590, 142, 152, 5),
(591, 144, 152, 45),
(592, 143, 152, 5),
(593, 150, 152, 5),
(594, 151, 152, 9),
(595, 152, 152, 76),
(596, 153, 152, 5),
(597, 154, 152, 43),
(598, 104, 161, 45),
(599, 106, 161, 2),
(600, 112, 161, 3),
(601, 108, 161, 5),
(602, 110, 161, 56),
(603, 114, 161, 54),
(604, 134, 162, 54),
(605, 136, 162, 8),
(606, 138, 162, 96),
(607, 116, 163, 2500),
(608, 117, 163, 21),
(609, 119, 163, 55),
(610, 121, 163, 21),
(611, 123, 163, 4),
(612, 125, 163, 5),
(613, 126, 149, 3),
(614, 127, 149, 4),
(615, 128, 149, 54),
(616, 131, 149, 5),
(617, 129, 149, 56),
(618, 130, 149, 6),
(619, 133, 149, 5),
(620, 132, 149, 88),
(621, 134, 150, 54),
(622, 136, 150, 546),
(623, 138, 150, 96);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL,
  `dni` bigint DEFAULT NULL,
  `clave` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `rol` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `resetToken` varchar(255) COLLATE utf8mb4_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `dni`, `clave`, `rol`, `estado`, `resetToken`) VALUES
(27, 37505981, '$2a$08$bO/dS2um30l/6ANcMkzQMeKElY5oGA4AXgvo7pxP4MP78efD3J8oS', 'Gerente', 1, NULL),
(28, 39561234, '$2b$08$CKgbBGNr57X0XPublmDlXer1YmxoR.HZIl.JhTDUXfmqbVuFVU6X2', 'Paciente', 1, '781c444f37'),
(37, 44544743, '$2b$08$sm4bhtNLqMhXB5cC91dgRO9ob9ZIQgo2jWBh1XhW47mNk/hDXgibW', 'Paciente', 1, NULL),
(38, 35467865, '$2a$08$6Gmhnz9HTUA6X7LcH/gXbuCYks0y8xJjP6ujB8GiGA12A8/BI9d..', 'Bioquimico', 1, NULL),
(39, 37774152, '$2b$08$fFtbmBN55CQWfIheErYbuu4tKmZ5UICPa0EtIDHPBY7JU33lAK99q', 'Tecnico', 1, NULL),
(47, 40789435, '$2b$08$Y0csY1rhStL8eXjYzN8sEOJq9Nw0jLivdTBkKecNtoSqGEQ7NfXxi', 'Paciente', 1, NULL),
(48, 35765481, '$2a$08$YlzOF1nPrnIvrier2jqDCO03Ws7LfUp33XCejmBx/zdbRe3qVakPq', 'Administrador', 1, '1226e74a95'),
(49, 18103753, '$2a$08$CV075KcpdPs5lSHX.9Q2Tu5qf3S17c4am3blOJozzcVj6e8fsKLpu', 'Tecnico', 1, NULL),
(58, 14505156, '$2a$08$7MCH7HGy/PUpY.vTwUh1r.yMrYbU5p9CojuVgNX08/EM6ppIZ40Ma', 'Bioquimico', 1, NULL),
(59, 21456789, '$2a$08$Uib2uK/gj3lANFQdJoQkJe5IH.PztC9ZZnEJOQnMS3RgMp7wkM6QG', 'Paciente', 1, NULL),
(60, 41789563, '$2a$08$7uGjE.HyYnejrr0RkFbFVu4uIQTppZkr3xINut.v0yDy4nXTlAg/O', 'Paciente', 1, NULL),
(61, 55768412, '$2a$08$pj2bzrMzPAvclIGqO.4bzuEyuWIYyYca9Rwwh/81MkSAx6kt6LD22', 'Paciente', 1, NULL),
(62, 25987410, '$2a$08$Rn2i1rMpuvlflZSl34.Co.EIxqWvjDZgQCdpH5QixKKgIamAqSm2i', 'Paciente', 1, NULL),
(63, 11223334, '$2a$08$McOukBwdNj8jF7P303PYX.kE77crAUkeBifOVjPNdBuFv2AuTsDjy', 'Paciente', 1, NULL),
(64, 36987452, '$2a$08$zre5DUNWob936e6sZCRdP.C6O/ulSUDW64g6T4CHupiDn6LgTPy.G', 'Paciente', 1, NULL),
(65, 11236965, '$2a$08$W2Um2./xR/fhikOPB30cv.Vup9v4n//BYK7qJmJ/RX.HBw9aViIYC', 'Paciente', 1, NULL),
(66, 37514896, '$2a$08$Lnd9ay2kFF5/bXjubg4DRu5dzyMxrdGFYzTDSscmekr1H8eOPy3GG', 'Paciente', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valor_ref`
--

CREATE TABLE `valor_ref` (
  `id_val_ref` int NOT NULL,
  `sexo` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `val_max` float DEFAULT NULL,
  `val_min` float DEFAULT NULL,
  `rango_edad` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `id_determinacion` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `valor_ref`
--

INSERT INTO `valor_ref` (`id_val_ref`, `sexo`, `val_max`, `val_min`, `rango_edad`, `id_determinacion`) VALUES
(149, 'M', 6, 4, '18-60', 104),
(150, 'F', 5.5, 3.8, '18-60', 104),
(151, 'M', 17, 13.5, '18-60', 106),
(152, 'F', 15, 12, '18-60', 106),
(153, 'M', 52, 42, '18-60', 108),
(154, 'F', 47, 37, '18-60', 108),
(155, 'M', 95, 80, '18-60', 110),
(156, 'F', 92, 78, '18-60', 110),
(157, 'M', 33, 27, '18-60', 112),
(158, 'F', 32, 26, '18-60', 112),
(159, 'M', 11000, 4000, '18-60', 114),
(160, 'F', 11000, 4000, '18-60', 114),
(161, 'M', 200, 0, '18-60', 116),
(162, 'M', 130, 0, '18-60', 117),
(163, 'F', 130, 0, '18-60', 117),
(164, 'M', 60, 40, '18-60', 119),
(165, 'F', 60, 40, '18-60', 119),
(166, 'M', 150, 0, '18-60', 121),
(167, 'F', 150, 0, '18-60', 121),
(168, 'M', 30, 0, '18-60', 123),
(169, 'F', 30, 0, '18-60', 123),
(170, NULL, 5, 0, '18-60', 125),
(171, NULL, 14, 11, '18-60', 126),
(172, NULL, 35, 25, '18-60', 127),
(173, NULL, 1.2, 0.8, '18-60', 128),
(174, NULL, 0.5, 0, '18-60', 129),
(175, NULL, 400, 200, '18-60', 130),
(176, NULL, 120, 80, '18-60', 131),
(177, NULL, 130, 70, '18-60', 132),
(178, NULL, 130, 70, '18-60', 133),
(179, 'M', 1.21, 0.84, '18-60', 134),
(180, 'F', 1.11, 0.64, '18-60', 134),
(181, 'M', 20, 7, '18-60', 136),
(182, 'F', 20, 7, '18-60', 136),
(183, 'M', 100, 90, '18-60', 138),
(184, 'F', 100, 90, '18-60', 138),
(185, 'M', 20, 0, '18-60', 140),
(186, 'M', 29, 20, '18-60', 141),
(187, 'M', 50, 30, '18-60', 142),
(188, 'M', 40, 30, '18-60', 143),
(189, 'M', 60, 40, '18-60', 144),
(190, 'F', 20, 0, '18-60', 140),
(191, 'F', 29, 20, '18-60', 141),
(192, 'F', 50, 30, '18-60', 142),
(193, 'F', 40, 30, '18-60', 143),
(194, 'F', 60, 40, '18-60', 144),
(195, 'M', 50, 0, '18-60', 150),
(196, 'M', 74, 50, '18-60', 151),
(197, 'M', 125, 75, '18-60', 152),
(198, 'M', 100, 75, '18-60', 153),
(199, 'M', 150, 100, '18-60', 154),
(200, 'F', 50, 0, '18-60', 150),
(201, 'F', 74, 50, '18-60', 151),
(202, 'F', 125, 75, '18-60', 152),
(203, 'F', 100, 75, '18-60', 153),
(204, 'F', 150, 100, '18-60', 154);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `analisis`
--
ALTER TABLE `analisis`
  ADD PRIMARY KEY (`id_analisis`);

--
-- Indices de la tabla `cambio_estado`
--
ALTER TABLE `cambio_estado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_estado` (`id_estado`),
  ADD KEY `id_orden` (`id_orden`),
  ADD KEY `fk_cambio_estado_examen` (`id_examen`);

--
-- Indices de la tabla `determinacion`
--
ALTER TABLE `determinacion`
  ADD PRIMARY KEY (`id_determinacion`),
  ADD KEY `fk_deter_analisis` (`id_analisis`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `etiqueta_muestra`
--
ALTER TABLE `etiqueta_muestra`
  ADD PRIMARY KEY (`id_etiqueta`),
  ADD KEY `fk_etiqueta_orden` (`id_orden`);

--
-- Indices de la tabla `examen`
--
ALTER TABLE `examen`
  ADD PRIMARY KEY (`id_examen`),
  ADD KEY `examen_ibfk_1` (`id_orden`),
  ADD KEY `fk_examen_analisis` (`id_analisis`);

--
-- Indices de la tabla `guia_muestra`
--
ALTER TABLE `guia_muestra`
  ADD PRIMARY KEY (`id_guiaM`),
  ADD KEY `id_analisis` (`id_analisis`);

--
-- Indices de la tabla `muestra`
--
ALTER TABLE `muestra`
  ADD PRIMARY KEY (`id_muestra`),
  ADD KEY `muestra_ibfk_1` (`id_orden`),
  ADD KEY `fk_muestra_guiaMuestra` (`id_guiaM`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`id_orden`),
  ADD KEY `fk_analisis_id` (`id_analisis`),
  ADD KEY `orden_ibfk_1` (`id_pedido`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `pedido_ibfk_1` (`id_persona`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id_persona`),
  ADD UNIQUE KEY `unique_dni` (`dni`);

--
-- Indices de la tabla `registro_valores`
--
ALTER TABLE `registro_valores`
  ADD PRIMARY KEY (`id_reg`),
  ADD KEY `fk_reg_determinacion` (`id_determinacion`),
  ADD KEY `fk_reg_examen` (`id_examen`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `fk_dni_usuario` (`dni`);

--
-- Indices de la tabla `valor_ref`
--
ALTER TABLE `valor_ref`
  ADD PRIMARY KEY (`id_val_ref`),
  ADD KEY `fk_determinacion` (`id_determinacion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `analisis`
--
ALTER TABLE `analisis`
  MODIFY `id_analisis` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cambio_estado`
--
ALTER TABLE `cambio_estado`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=467;

--
-- AUTO_INCREMENT de la tabla `determinacion`
--
ALTER TABLE `determinacion`
  MODIFY `id_determinacion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `etiqueta_muestra`
--
ALTER TABLE `etiqueta_muestra`
  MODIFY `id_etiqueta` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `examen`
--
ALTER TABLE `examen`
  MODIFY `id_examen` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT de la tabla `guia_muestra`
--
ALTER TABLE `guia_muestra`
  MODIFY `id_guiaM` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `muestra`
--
ALTER TABLE `muestra`
  MODIFY `id_muestra` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `id_orden` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id_persona` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT de la tabla `registro_valores`
--
ALTER TABLE `registro_valores`
  MODIFY `id_reg` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=624;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT de la tabla `valor_ref`
--
ALTER TABLE `valor_ref`
  MODIFY `id_val_ref` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cambio_estado`
--
ALTER TABLE `cambio_estado`
  ADD CONSTRAINT `cambio_estado_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`),
  ADD CONSTRAINT `cambio_estado_ibfk_2` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id_orden`),
  ADD CONSTRAINT `fk_cambio_estado_examen` FOREIGN KEY (`id_examen`) REFERENCES `examen` (`id_examen`) ON DELETE CASCADE;

--
-- Filtros para la tabla `determinacion`
--
ALTER TABLE `determinacion`
  ADD CONSTRAINT `fk_deter_analisis` FOREIGN KEY (`id_analisis`) REFERENCES `analisis` (`id_analisis`);

--
-- Filtros para la tabla `etiqueta_muestra`
--
ALTER TABLE `etiqueta_muestra`
  ADD CONSTRAINT `fk_etiqueta_orden` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id_orden`);

--
-- Filtros para la tabla `examen`
--
ALTER TABLE `examen`
  ADD CONSTRAINT `examen_ibfk_1` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id_orden`),
  ADD CONSTRAINT `fk_examen_analisis` FOREIGN KEY (`id_analisis`) REFERENCES `analisis` (`id_analisis`);

--
-- Filtros para la tabla `guia_muestra`
--
ALTER TABLE `guia_muestra`
  ADD CONSTRAINT `guia_muestra_ibfk_1` FOREIGN KEY (`id_analisis`) REFERENCES `analisis` (`id_analisis`);

--
-- Filtros para la tabla `muestra`
--
ALTER TABLE `muestra`
  ADD CONSTRAINT `fk_muestra_guiaMuestra` FOREIGN KEY (`id_guiaM`) REFERENCES `guia_muestra` (`id_guiaM`),
  ADD CONSTRAINT `muestra_ibfk_1` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id_orden`);

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `fk_analisis_id` FOREIGN KEY (`id_analisis`) REFERENCES `analisis` (`id_analisis`),
  ADD CONSTRAINT `orden_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`);

--
-- Filtros para la tabla `registro_valores`
--
ALTER TABLE `registro_valores`
  ADD CONSTRAINT `fk_reg_determinacion` FOREIGN KEY (`id_determinacion`) REFERENCES `determinacion` (`id_determinacion`),
  ADD CONSTRAINT `fk_reg_examen` FOREIGN KEY (`id_examen`) REFERENCES `examen` (`id_examen`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_dni_usuario` FOREIGN KEY (`dni`) REFERENCES `persona` (`dni`);

--
-- Filtros para la tabla `valor_ref`
--
ALTER TABLE `valor_ref`
  ADD CONSTRAINT `fk_determinacion` FOREIGN KEY (`id_determinacion`) REFERENCES `determinacion` (`id_determinacion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
