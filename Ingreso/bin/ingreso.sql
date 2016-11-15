-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.5.34-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para ingreso
CREATE DATABASE IF NOT EXISTS `ingreso` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ingreso`;


-- Volcando estructura para tabla ingreso.menu
CREATE TABLE IF NOT EXISTS `menu` (
  `indice` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(450) DEFAULT NULL,
  `Url` varchar(550) DEFAULT NULL,
  KEY `‌indice` (`indice`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ingreso.menu: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`indice`, `nombre`, `Url`) VALUES
	(1, 'Cancer', NULL),
	(4, 'Home', NULL);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;


-- Volcando estructura para tabla ingreso.roldetalle
CREATE TABLE IF NOT EXISTS `roldetalle` (
  `indice` int(11) NOT NULL AUTO_INCREMENT,
  `idrol` int(11) DEFAULT '0',
  `idsubmenu` int(11) DEFAULT '0',
  KEY `indice` (`indice`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ingreso.roldetalle: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `roldetalle` DISABLE KEYS */;
INSERT INTO `roldetalle` (`indice`, `idrol`, `idsubmenu`) VALUES
	(1, 2, 2);
/*!40000 ALTER TABLE `roldetalle` ENABLE KEYS */;


-- Volcando estructura para tabla ingreso.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `indice` int(11) NOT NULL AUTO_INCREMENT,
  `rolnombre` varchar(450) DEFAULT '0',
  KEY `indice` (`indice`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ingreso.roles: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`indice`, `rolnombre`) VALUES
	(1, 'Cliente'),
	(2, 'Administrador'),
	(3, 'Vendedores'),
	(4, 'Hola'),
	(5, 'Hola2'),
	(6, 'Hola3');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;


-- Volcando estructura para tabla ingreso.submenu
CREATE TABLE IF NOT EXISTS `submenu` (
  `indice` int(11) NOT NULL AUTO_INCREMENT,
  `idmenu` int(11) DEFAULT '0',
  `nombre` varchar(450) DEFAULT '0',
  `url` varchar(550) DEFAULT '0',
  KEY `indice` (`indice`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ingreso.submenu: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `submenu` DISABLE KEYS */;
INSERT INTO `submenu` (`indice`, `idmenu`, `nombre`, `url`) VALUES
	(1, 0, 'Cotizar', '0'),
	(2, 1, 'Cotización', '0');
/*!40000 ALTER TABLE `submenu` ENABLE KEYS */;


-- Volcando estructura para tabla ingreso.vendedores
CREATE TABLE IF NOT EXISTS `vendedores` (
  `indice` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(250) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `codigo` int(11) DEFAULT NULL,
  `pre_password` varchar(100) DEFAULT NULL,
  `correo` varchar(400) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `rol` int(11) DEFAULT NULL,
  KEY `indice` (`indice`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ingreso.vendedores: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
INSERT INTO `vendedores` (`indice`, `usuario`, `password`, `codigo`, `pre_password`, `correo`, `status`, `rol`) VALUES
	(1, 'Kellen', '123', NULL, NULL, NULL, 1, 3),
	(2, 'Erik', '123', NULL, NULL, NULL, 1, NULL),
	(3, 'misha', '123', NULL, NULL, 'erik@unity.com', 1, NULL);
/*!40000 ALTER TABLE `vendedores` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
