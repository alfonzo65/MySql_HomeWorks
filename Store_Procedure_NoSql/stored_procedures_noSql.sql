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

-- Volcando estructura para procedimiento curso.procedure_noSql_1
DELIMITER //
CREATE PROCEDURE `procedure_noSql_1`()
    NO SQL
    COMMENT 'procedimiento sin sentencia sql para mostrar un mensaje'
BEGIN
	select '¡Hola mundo!' as mensaje;
END//
DELIMITER ;

-- Volcando estructura para procedimiento curso.procedure_noSql_2
DELIMITER //
CREATE PROCEDURE `procedure_noSql_2`( in _Number DECIMAL(10,2))
begin
	if _Number > 0 then 
		select concat(_Number,' ','Es un numero positivo');
	end if;
	if _Number = 0 then 
			select concat(_Number,' ','Es un cero');
	end if;
	if _Number < 0 then 
			select concat(_Number,' ','Es un numero negativo');
	end if;
end//
DELIMITER ;

-- Volcando estructura para procedimiento curso.procedure_noSql_3
DELIMITER //
CREATE PROCEDURE `procedure_noSql_3`(
	IN `_NumberReal` DECIMAL(10,3),
	OUT `_Result` VARCHAR(50)
)
    NO SQL
    COMMENT 'Modificacion realizado al 2 ejercicio procedure_noSql_2'
BEGIN
	if _NumberReal > 0 then 
		SET _Result = concat(_NumberReal,' ','Es un numero positivo');
	end if;
	if _NumberReal = 0 then 
		SET _Result = concat(_NumberReal,' ','Es un cero');
	end if;
	if _NumberReal < 0 then 
		SET _Result = concat(_NumberReal,' ','Es un numero negativo');
	end if;
END//
DELIMITER ;

-- Volcando estructura para procedimiento curso.procedure_noSql_4
DELIMITER //
CREATE PROCEDURE `procedure_noSql_4`(
	IN `_NotaAlumno` DECIMAL(10,2)
)
    NO SQL
    COMMENT 'procedimiento almacenado no sql que devuelve una categoria de acuerdo a la nota de un alumno'
BEGIN

	IF (_NotaAlumno BETWEEN 0.5 AND 5.5) THEN 
		SELECT 'Insuficiente'; 
	ELSEIF (_NotaAlumno BETWEEN 5.6 AND 6.6) THEN 
		SELECT 'Aprobado';
	ELSEIF (_NotaAlumno BETWEEN 6.7 AND 7.8) THEN 
		SELECT 'Bien'; 
	ELSEIF (_NotaAlumno BETWEEN 7.9 AND 9.9) THEN 
		SELECT 'Notable';
	ELSEIF (_NotaAlumno >= 9.10 ) THEN 
		SELECT 'Sobresaliente'; 
	ELSE
		SELECT  'Nota no valida';
	END IF;	
END//
DELIMITER ;

-- Volcando estructura para procedimiento curso.procedure_noSql_5
DELIMITER //
CREATE PROCEDURE `procedure_noSql_5`(
	IN `_NotaAlumno` DECIMAL(10,3),
	OUT `_Resultado` VARCHAR(50)
)
    NO SQL
    COMMENT 'modificacion al ejercicio anterior'
BEGIN
	IF (_NotaAlumno BETWEEN 0.5 AND 5.5) THEN 
		SET _Resultado = 'Insuficiente'; 
	ELSEIF (_NotaAlumno BETWEEN 5.6 AND 6.6) THEN 
		SET _Resultado = 'Aprobado'; 
	ELSEIF (_NotaAlumno BETWEEN 6.7 AND 7.8) THEN 
		SET _Resultado = 'Bien';
	ELSEIF (_NotaAlumno BETWEEN 7.9 AND 9.9) THEN 
		SET _Resultado = 'Notable';
	ELSEIF (_NotaAlumno >= 9.10 ) THEN 
		SET _Resultado = 'Sobresaliente';
	ELSE
		SET _Resultado = 'Nota no valida';
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento curso.procedure_noSql_6
DELIMITER //
CREATE PROCEDURE `procedure_noSql_6`(
	IN `_NotaAlumno` DECIMAL(10,2),
	OUT `_Resultado` VARCHAR(50)
)
    NO SQL
    COMMENT 'modificacion usando case al ejercicio procedure_noSql_5'
BEGIN
	
	CASE 
		WHEN (_NotaAlumno BETWEEN 0.5 AND 5.5) THEN 
			SET _Resultado = 'Insuficiente';
		WHEN (_NotaAlumno BETWEEN 5.6 AND 6.6) THEN 
			SET _Resultado = 'Aprobado'; 
		WHEN (_NotaAlumno BETWEEN 6.7 AND 7.8) THEN 
			SET _Resultado = 'Bien';
		WHEN (_NotaAlumno BETWEEN 7.9 AND 9.9) THEN 
			SET _Resultado = 'Notable';
		WHEN (_NotaAlumno >= 9.10 ) THEN 
			SET _Resultado = 'Sobresaliente';
		ELSE
			SET _Resultado = 'Nota no valida';
	END CASE;

END//
DELIMITER ;

-- Volcando estructura para procedimiento curso.procedure_noSql_7
DELIMITER //
CREATE PROCEDURE `procedure_noSql_7`(
	IN `_DIa` INT,
	OUT `_NombreDia` VARCHAR(50)
)
    NO SQL
BEGIN
	IF _Dia = 1 THEN
		SET _NombreDia = 'Lunes';
	END IF;
	
	IF _Dia = 2 THEN
		SET _NombreDia = 'Martes';
	END IF;
	
	IF _Dia = 3 THEN
		SET _NombreDia = 'Miercoles';
	END IF;
	
	IF _Dia = 4 THEN
		SET _NombreDia = 'Jueves';
	END IF;
	
	IF _Dia = 5 THEN
		SET _NombreDia = 'Viernes';
	END IF;
	
	IF _Dia < 1 OR _Dia > 5 THEN 
		SET _NombreDia = 'dato incorrecto';
	END IF;
	
END//
DELIMITER ;

-- Volcando estructura para procedimiento curso.procedure_noSql_8
DELIMITER //
CREATE PROCEDURE `procedure_noSql_8`(
	IN `_Dia` INT,
	OUT `_NombreDia` VARCHAR(50)
)
    COMMENT 'modificacion del procedure_noSql_7 usando la estructura de control CASE'
BEGIN
	
	CASE 
		WHEN _Dia = 1 THEN 
			SET _NombreDia = 'Lunes';
		WHEN _Dia = 2 THEN
			SET _NombreDia = 'Martes';
		WHEN _Dia = 3 THEN 
			SET _NombreDia = 'Miercoles';
		WHEN _Dia = 4 THEN
			SET _NombreDia = 'Jueves';
		WHEN _Dia = 5 THEN
			SET _NombreDia = 'Viernes';
		ELSE
			SET _NombreDia = 'No existe este numero de Dia';
	END CASE;
	
END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
