select * from Clientes
select * from Libros
select * from Compras
select * from Editoriales
select * from Empleados

--Listar de cada cliente: la identificación, el nombre y el apellido, con la sumatoria del valor total de las compras, --agrupadas por año. (Identificacion, NombreCompleto, TotalCompras, Año)
SELECT 
	c.Identificacion, 
	CONCAT (c.Nombres,' ',c.Apellidos)As NombreCompleto,  
	SUM(cp.Valor) AS TotalCompra,
	YEAR(cp.Fecha) AS Año
FROM Clientes c 
JOIN Compras cp  
ON cp.ClienteId = c.ClienteId  
GROUP BY 
	c.Identificacion, 
	CONCAT (c.Nombres,' ' ,c.Apellidos), 
	YEAR(cp.Fecha)
--Mostrar el nombre y apellido de todos los empleados, junto con el número total de libros vendidos para el año 2019, --incluyendo a los empleados que no hayan realizado ninguna venta. (Nombre, Apellidos, TotalLibros)	
	SELECT * 
		FROM (
			SELECT 
				CONCAT (e.Nombres,' ',e.Apellidos)As NombreCompleto,  
				COUNT(cp.EmpleadoId) AS TotalVendidos,
				CASE WHEN YEAR(cp.Fecha) IS NULL THEN 2019 else YEAR(cp.Fecha) end AS Año
			FROM Empleados e
			LEFT JOIN Compras cp  
			ON cp.EmpleadoId = e.EmpleadoId  
			GROUP BY 
				CONCAT (e.Nombres,' ' ,e.Apellidos),
				YEAR(cp.Fecha)) as Consulta
	WHERE Consulta.Año = 2019


--Crear un procedimiento almacenado que, dado un año, muestre el valor total de ventas
--realizadas por cada empleado, incluyendo los que no hayan realizado ninguna venta. (NombreCompleto, ValorTotalVentas)


USE [BooksdbAPIMegaDev]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Punto3]
@AñoConsulta INT
AS
BEGIN
	SET NOCOUNT ON;

USE [BooksdbAPIMegaDev]
GO
/****** Object:  StoredProcedure [dbo].[Punto3]    Script Date: 24/11/2021 16:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Punto3]
@AñoConsulta INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM (
					SELECT 
						CONCAT (e.Nombres,' ',e.Apellidos)AS NombreCompleto,  
						CASE WHEN SUM(cp.Valor) IS NULL THEN 0  else SUM(cp.Valor) END AS ValorTotalVentas,
						CASE WHEN YEAR(cp.Fecha) IS NULL THEN @AñoConsulta else YEAR(cp.Fecha) END AS Año
					FROM Empleados e
					LEFT JOIN Compras cp  
					ON cp.EmpleadoId = e.EmpleadoId  
					GROUP BY 
						CONCAT (e.Nombres,' ' ,e.Apellidos),
						YEAR(cp.Fecha))AS Consulta
	WHERE Consulta.Año = @AñoConsulta

END

-------EJECUCIÓN
USE [BooksdbAPIMegaDev]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[Punto3]
		@AñoConsulta = 2019

SELECT	'Return Value' = @return_value

GO

---Crear una consulta que indique la identificación, nombre y apellido de un cliente, junto
--con su editorial favorita, teniendo en cuenta que ésta se basa en la editorial a la que
--pertenece la mayoría de los libros que ha comprado. (NombreCompleto,
--EditorialFavorita)WITH MEDI AS (SELECT 
	CONCAT (c.Nombres,' ',c.Apellidos)As NombreCompleto,
	COUNT(e.Nombre) AS EDITORIAL,
	DENSE_RANK() OVER (ORDER BY count(e.Nombre) desc) AS RN,
	e.Nombre	
FROM Clientes c 
JOIN Compras cp  
ON cp.ClienteId = c.ClienteId  
JOIN Libros l 
ON cp.LibroId = l.LibroId
JOIN Editoriales e
on l.EditorialId = e.EditorialId
GROUP BY 
	CONCAT (c.Nombres,' ' ,c.Apellidos),
	(e.Nombre) 
	)SELECT * 
	FROM MEDI
    WHERE RN = 1

--Propuesta 2
SELECT 
	CONCAT (c.Nombres,' ',c.Apellidos)As NombreCompleto,
	COUNT(e.Nombre) AS EDITORIAL,
	e.Nombre
FROM Clientes c 
JOIN Compras cp  
ON cp.ClienteId = c.ClienteId  
JOIN Libros l 
ON cp.LibroId = l.LibroId
JOIN Editoriales e
ON l.EditorialId = e.EditorialId
GROUP BY 
	CONCAT (c.Nombres,' ' ,c.Apellidos),
	(e.Nombre) 
ORDER BY 
	CONCAT (c.Nombres,' ',c.Apellidos),
	COUNT(e.Nombre) desc

--Consultar todos los clientes cuyo correo electrónico pertenece a Gmail y no ha realizado compras en el 2019.	SELECT * 
	FROM (
			SELECT 
				CONCAT (c.Nombres,' ',c.Apellidos)As NombreCompleto,  
				COUNT(cp.EmpleadoId) AS TotalVendidos,
				CASE WHEN YEAR(cp.Fecha) IS NULL THEN 2019 ELSE YEAR(cp.Fecha) END AS Año,
				c.Email
			FROM Clientes c
			LEFT JOIN Compras cp  
			ON cp.ClienteId = c.ClienteId  
			GROUP BY 
			c.Email,
				CONCAT (c.Nombres,' ' ,c.Apellidos),
				YEAR(cp.Fecha)) as Consulta
			
	WHERE  Consulta.Año = 2019 and Consulta.TotalVendidos = 0 and Consulta.Email Like '%@gmail.com'


	