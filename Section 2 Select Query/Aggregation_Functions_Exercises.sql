	Create Database EcommerceDB
	use EcommerceDB
	
	-- =============================================
	-- TABLA 1: clientes
	-- =============================================
	CREATE TABLE clientes (
		id_cliente INT PRIMARY KEY,
		nombre VARCHAR(50),
		ciudad VARCHAR(30),
		fecha_registro DATE,
		vip bIT);

		INSERT INTO clientes VALUES
	(1, 'Ana García', 'Madrid', '2024-01-15', 1),
	(2, 'Carlos López', 'Barcelona', '2024-02-20', 0),
	(3, 'María Rodríguez', 'Valencia', '2024-03-10', 1),
	(4, 'Jorge Martínez', 'Madrid', '2024-04-05', 0),
	(5, 'Lucía Fernández', 'Sevilla', '2024-05-12', 0),
	(6, 'Pablo Sánchez', 'Barcelona', '2024-06-01', 1),
	(7, 'Elena Gómez', 'Madrid', '2024-07-15', 0),
	(8, 'David Ruiz', 'Valencia', '2024-08-20', 1),
	(9, 'Sara Jiménez', 'Sevilla', '2024-09-10', 0),
	(10, 'Miguel Torres', 'Barcelona', '2024-10-01', 0);

	-- =============================================
	-- TABLA 2: productos
	-- =============================================
	CREATE TABLE productos (
		id_producto INT PRIMARY KEY,
		nombre VARCHAR(60),
		categoria VARCHAR(30),
		precio DECIMAL(10,2),
		stock INT,
		fecha_lanzamiento DATE
	);

	INSERT INTO productos VALUES
	(101, 'The Last Quest', 'Aventura', 59.99, 45, '2024-01-10'),
	(102, 'Racing Turbo', 'Carreras', 49.99, 30, '2024-02-15'),
	(103, 'Space Warriors', 'Acción', 69.99, 20, '2024-03-01'),
	(104, 'Chess Master', 'Estrategia', 29.99, 60, '2024-04-01'),
	(105, 'Farm Simulator', 'Simulación', 39.99, 25, '2024-05-15'),
	(106, 'Horror Nights', 'Terror', 44.99, 15, '2024-06-20'),
	(107, 'Sports Extreme', 'Deportes', 54.99, 35, '2024-07-01'),
	(108, 'Puzzle World', 'Puzzle', 19.99, 50, '2024-08-01');

	-- =============================================
	-- TABLA 3: ventas (la tabla de hechos)
	-- =============================================
	CREATE TABLE ventas (
		id_venta INT PRIMARY KEY,
		id_cliente INT,
		id_producto INT,
		fecha_venta DATE,
		cantidad INT,
		precio_unitario DECIMAL(10,2),  -- Precio en el momento de la venta
		FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
		FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
	);

	INSERT INTO ventas VALUES
	-- Ventas de enero (cliente 1,2,3)
	(1001, 1, 101, '2024-01-20', 1, 59.99),
	(1002, 2, 102, '2024-01-25', 2, 49.99),
	(1003, 3, 103, '2024-01-28', 1, 69.99),

	-- Ventas de febrero (cliente 4,5,1)
	(1004, 4, 104, '2024-02-05', 3, 29.99),
	(1005, 5, 105, '2024-02-10', 1, 39.99),
	(1006, 1, 106, '2024-02-15', 2, 44.99),

	-- Ventas de marzo (cliente 6,7,8)
	(1007, 6, 107, '2024-03-05', 1, 54.99),
	(1008, 7, 108, '2024-03-10', 4, 19.99),
	(1009, 8, 101, '2024-03-15', 1, 59.99),
	(1010, 9, 102, '2024-03-20', 2, 49.99),

	-- Ventas de abril (cliente 10,1,2)
	(1011, 10, 103, '2024-04-02', 1, 69.99),
	(1012, 1, 104, '2024-04-07', 1, 29.99),
	(1013, 2, 105, '2024-04-12', 3, 39.99),

	-- Ventas de mayo (cliente 3,4,5)
	(1014, 3, 106, '2024-05-01', 1, 44.99),
	(1015, 4, 107, '2024-05-10', 2, 54.99),
	(1016, 5, 108, '2024-05-20', 1, 19.99),

	-- Ventas de junio (cliente 6,7,8)
	(1017, 6, 101, '2024-06-05', 2, 59.99),
	(1018, 7, 102, '2024-06-10', 1, 49.99),
	(1019, 8, 103, '2024-06-15', 1, 69.99),

	-- Ventas de julio (cliente 9,10,1)
	(1020, 9, 104, '2024-07-01', 5, 29.99),
	(1021, 10, 105, '2024-07-10', 1, 39.99),
	(1022, 1, 106, '2024-07-20', 2, 44.99),

	-- Ventas de agosto (cliente 2,3,4)
	(1023, 2, 107, '2024-08-05', 1, 54.99),
	(1024, 3, 108, '2024-08-10', 3, 19.99),
	(1025, 4, 101, '2024-08-20', 1, 59.99),

	-- Ventas de septiembre (cliente 5,6,7)
	(1026, 5, 102, '2024-09-01', 2, 49.99),
	(1027, 6, 103, '2024-09-10', 1, 69.99),
	(1028, 7, 104, '2024-09-15', 1, 29.99),

	-- Ventas de octubre (cliente 8,9,10)
	(1029, 8, 105, '2024-10-01', 1, 39.99),
	(1030, 9, 106, '2024-10-05', 2, 44.99);


-- ================================================ --
--1. SUM - Facturación total
--Muestra el importe total facturado por PixelStore en toda su historia (precio_unitario * cantidad de cada venta).
-- ================================================ --
SELECT 
SUM(precio_unitario * cantidad) AS 'IMPORTE TOTAL FACTURADO'
FROM ventas


-- ================================================ --
--2. COUNT - Número de clientes
--¿Cuántos clientes tiene la tienda? ¿Y cuántos clientes VIP?
-- ================================================ --
SELECT
COUNT (*) AS 'TOTAL CLIENTES'
FROM clientes;

SELECT 
COUNT (*) AS 'CLIENTES VIP'
FROM CLIENTES 
WHERE VIP = 1


-- ================================================ --
--3. AVG - Ticket promedio
--Calcula el valor medio de cada transacción (precio_unitario * cantidad).
-- ================================================ --
SELECT
AVG(precio_unitario * cantidad)
FROM ventas

-- ================================================ --
--4. MIN y MAX - Productos extremos
--Muestra el precio mínimo, máximo y el rango (diferencia entre máximo y mínimo) de todos los productos de la tienda.
-- ================================================ --
SELECT
MIN(PRECIO) AS 'MIN',
MAX(PRECIO) AS 'MAX',
(MAX(PRECIO) - MIN(PRECIO)) AS 'RANGO'
FROM productos
