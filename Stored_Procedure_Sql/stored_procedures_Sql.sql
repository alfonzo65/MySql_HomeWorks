-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.34 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para procedimiento jardineria.procedure_Sql_1
DELIMITER //
CREATE PROCEDURE `procedure_Sql_1`(
	IN `_Pais` VARCHAR(100)
)
    COMMENT 'Escribe un procedimiento que reciba el nombre de un país como parámetro de entrada y realice una consulta sobre la tabla cliente para obtener todos los clientes que existen en la tabla de ese país.'
BEGIN
	SELECT * FROM jardineria.cliente WHERE cliente.pais = _Pais;
END//
DELIMITER ;

-- Volcando estructura para procedimiento jardineria.procedure_Sql_2
DELIMITER //
CREATE PROCEDURE `procedure_Sql_2`(
	IN `_TipoPago` VARCHAR(50),
	OUT `_PagoMaximo` DECIMAL(10,2)
)
    COMMENT 'Escribe un procedimiento que reciba como parámetro de entrada una forma de pago, que será una cadena de caracteres (Ejemplo: PayPal, Transferencia, etc). Y devuelva como salida el pago de máximo valor realizado para esa forma de pago. Deberá hacer uso de la tabla pago de la base de datos jardineria.'
BEGIN
	
	DECLARE _TotalPorTipoDePago DECIMAL(10,3);
	
	SELECT MAX(pago.total) INTO _TotalPorTipoDePago FROM pago WHERE pago.forma_pago = _TipoPago;

	SET _PagoMaximo = _TotalPorTipoDePago;
	
END//
DELIMITER ;

-- Volcando estructura para procedimiento jardineria.procedure_Sql_3
DELIMITER //
CREATE PROCEDURE `procedure_Sql_3`(
	IN `_TipoPago` VARCHAR(50),
	OUT `_PagoMax` DECIMAL(10,2),
	OUT `_PagoMin` DECIMAL(10,2),
	OUT `_PagoMedio` DECIMAL(10,2),
	OUT `_TotalPagos` DECIMAL(10,2),
	OUT `_CantidadPagos` INT
)
    COMMENT 'Escribe un procedimiento que reciba como parámetro de entrada una forma de pago, que será una cadena de caracteres (Ejemplo: PayPal, Transferencia, etc). Y devuelva como salida los siguientes valores teniendo en cuenta la forma de pago seleccionada como parámetro de entrada:'
BEGIN
	
	SELECT 
		MAX(pago.total),
		MIN(pago.total),
		AVG(pago.total),
		SUM(pago.total),
		COUNT(pago.id_transaccion)
	INTO
		_PagoMax, _PagoMin, _PagoMedio, _TotalPagos, _CantidadPagos
	FROM pago
	WHERE pago.forma_pago = _TipoPago;
	
END//
DELIMITER ;

-- Volcando estructura para procedimiento procedimientos.calcular_cuadrados
DELIMITER //
CREATE PROCEDURE `calcular_cuadrados`(
	IN `_Tope` INT
)
BEGIN
	
	DECLARE _Inicio INT;
	DECLARE _Cuadrado BIGINT;
	
	SET _Inicio = 1;
	
	TRUNCATE TABLE cuadrados;
	
	WHILE _Inicio <= _Tope DO
	
		-- INSERTAR EL NUMERO Y SU CUADRADO
		INSERT INTO cuadrados(numero,cuadrado) VALUES (_Inicio, (_Inicio * 2));
		
		-- INCREMENTAR EL CONTADOR
		SET _Inicio = _Inicio + 1;
	
	END WHILE;
	
	-- FIN
	
END//
DELIMITER ;

-- Volcando estructura para procedimiento procedimientos.calcular_cuadrados_v2
DELIMITER //
CREATE PROCEDURE `calcular_cuadrados_v2`(
	IN `_Tope` INT
)
    COMMENT 'Utilice un bucle REPEAT para resolver el procedimiento del ejercicio anterior de procedimiento llamado calcular_cuadrados ejercicio #6'
BEGIN
	
	DECLARE _Inicio INT;
	DECLARE _Cuadrado BIGINT;
	
	SET _Inicio = 1;
	
	TRUNCATE TABLE cuadrados;
	
	bucle: LOOP
		
		-- INSERTAR EL NUMERO Y SU CUADRADO
		INSERT INTO cuadrados(numero,cuadrado) VALUES (_Inicio, (_Inicio * 2));
		SET _Inicio = _Inicio + 1;
		
		IF _Inicio <= _Tope THEN
			ITERATE bucle;
		END IF;
		
		LEAVE bucle;
	
	END LOOP bucle;
	
	-- FIN
	
END//
DELIMITER ;

-- Volcando estructura para procedimiento procedimientos.calcular_cuadrados_v3
DELIMITER //
CREATE PROCEDURE `calcular_cuadrados_v3`(
	IN `_Tope` INT
)
    COMMENT 'Utilice un bucle REPEAT para resolver el procedimiento del ejercicio anterior. ejer: procedure calcular_cuadrados'
BEGIN
	DECLARE _Inicio INT;
	DECLARE _Cuadrado BIGINT;
	
	SET _Inicio = 1;
	
	TRUNCATE TABLE cuadrados;
	
	REPEAT 
		-- INSERTAR EL NUMERO Y SU CUADRADO
		INSERT INTO cuadrados(numero,cuadrado) VALUES (_Inicio, (_Inicio * 2));
		SET _Inicio = _Inicio + 1;
		
		UNTIL _Inicio > _Tope
		
	END REPEAT;
	
	-- FIN
END//
DELIMITER ;

-- Volcando estructura para procedimiento procedimientos.calcular_números
DELIMITER //
CREATE PROCEDURE `calcular_números`(
	IN `valor_inicial` INT
)
BEGIN

	TRUNCATE TABLE ejercicio;
	
	/* CON WHILE
	WHILE valor_inicial >= 1 DO
	
		INSERT INTO ejercicio(numero) VALUES (valor_inicial);
		
		SET valor_inicial = valor_inicial - 1;
	
	END WHILE;
	*/
	
	/* -- LOOP
	bucle: LOOP
		
		INSERT INTO ejercicio(numero) VALUES (valor_inicial);
		
		SET valor_inicial = valor_inicial - 1;
		
		IF valor_inicial >= 1 THEN
			ITERATE bucle;
		END IF;
		
		LEAVE bucle;
	
	END LOOP bucle;
	*/
	
	-- REPEAT
	REPEAT
	
		INSERT INTO ejercicio(numero) VALUES (valor_inicial);
		
		SET valor_inicial = valor_inicial - 1;
		
		UNTIL valor_inicial < 1
		 
	END REPEAT;
	
	-- FIN
	
END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
