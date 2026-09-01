--Usa DESC nombre_tabla; para ver la estructura

--Usa SELECT * FROM nombre_tabla; para ver los datos

--Usa WHERE ROWNUM <= 10; para limitar resultados

--Usa FETCH FIRST 10 ROWS ONLY; en Oracle 12c+


--1. Mostrar todos los datos de la tabla CLIENTES.

select * from clientes

--2. Mostrar solo los nombres y apellidos de los clientes.

Select 
nombre, 
apellido 
FROM clientes;

--3. Mostrar los clientes que viven en el estado 'CA'.
Select nombre
FROM clientes
WHERE clientes.estado ='ca';


--4. Mostrar los clientes que se registraron después del 1 de febrero de 2024.
Select *
FROM CLIENTES
WHERE clientes.fecha_registro > '01-FEB-24';

--5. Mostrar los clientes cuyo nombre comienza con la letra 'M'.
Select 
Upper(NOMBRE)
FROM CLIENTES
Where nombre LIKE 'M%';


--6. Mostrar los productos con precio mayor a $500.
Select *
from productos
Where Precio > 500;

--7. Mostrar los productos de la categoría 'Computadoras'.
Select *
from productos
Where Categoria = 'Computadoras';



--8. Mostrar los pedidos que están en estado 'PENDIENTE'.
Select *
from pedidos
Where Estado = 'PENDIENTE';

--9. Mostrar los pedidos realizados entre el 1 de febrero y el 28 de febrero de 2024.
Select *
from pedidos
Where fecha_pedido between '01-FEB-24' and '28-FEB-24';


--10. Mostrar los clientes ordenados por apellido de forma ascendente.
    Select * 
    from clientes
    order by apellido asc;


--Ejercicios de funciones básicas
--11. Mostrar el nombre completo de los clientes (nombre + apellido) con el alias "Nombre Completo".
    Select 
    NOMBRE || ' ' ||  APELLIDO AS "Nombre Completo"
    from clientes
    order by apellido asc;


--12. Mostrar el email de los clientes en mayúsculas.
    SELECT
    UPPER (EMAIL)
    FROM CLIENTES;


--13. Mostrar los productos con el precio redondeado sin decimales.
    SELECT 
    ROUND(PRECIO)
    FROM PRODUCTOS;
    

--14. Mostrar la cantidad de clientes registrados.
    SELECT
    COUNT (*) APELLIDO AS "TOTAL DE CLIENTES"
    FROM CLIENTES;

--15. Mostrar el precio promedio de todos los productos.
    SELECT 
    ROUND(AVG(PRECIO), 2) AS "Average"
    FROM PRODUCTOS;


--16. Mostrar el total de ventas sumando todos los pedidos.
    SELECT 
    SUM(TOTAL) AS "Total de pedidos"
    FROM PEDIDOS
    

--17. Mostrar el producto más caro de la tabla.
    SELECT *
--    TOP 1 (PRECIO)
    FROM PRODUCTOS
    Order by Precio desc
    FETCH FIRST 1 ROWS ONLY;

--18. Mostrar los clientes que tienen NULL en el campo teléfono.
    SELECT *
    FROM CLIENTES
    WHERE TELEFONO = NULL
    
--Ejercicios de GROUP BY y agregación
--19. Mostrar cuántos clientes hay por estado.
    SELECT 
    ESTADO,
    COUNT (*) NOMBRE
    FROM CLIENTES
    GROUP BY ESTADO;

--20. Mostrar cuántos productos hay por categoría.
    SELECT 
    Categoria,
    COUNT (*) Categoria
    FROM Productos
    GROUP BY Categoria;


--21. Mostrar el precio promedio de productos por categoría.
    SELECT 
    Categoria,
    COUNT (*) Categoria,
    AVG(PRECIO) AS "Precio Promedio"
    FROM Productos
    GROUP BY Categoria;



--22. Mostrar el total de ventas por estado del pedido (PENDIENTE, ENVIADO, ENTREGADO, CANCELADO).
    SELECT
    SUM(Total),
    Estado
    FROM Pedidos
    GROUP BY ESTADO;

--23. Mostrar cuántos pedidos ha realizado cada cliente.
    SELECT
    cliente_id AS "CLIENTE ID",
    count (*) cliente_id AS "Cantidad"
    FROM Pedidos
    GROUP BY cliente_id;
        -- --------------------------------------- --
        -- -----------FROM IA -------------------- --
        -- --------------------------------------- --
    SELECT
    cliente_id AS "CLIENTE ID",
    COUNT(*) AS "Cantidad"
    FROM Pedidos
    GROUP BY cliente_id;
        
       -- Se eliminó el cliente_id duplicado que estaba entre el COUNT(*) y el AS "Cantidad".
       
       -- Ahora Oracle entiende perfectamente que la primera columna es el identificador, 
       -- la segunda es el conteo total agrupado, y luego viene la palabra clave FROM.

--24. Mostrar el total gastado por cada cliente.
    SELECT
    Cliente_Id,
    SUM (*)   Total
    FROM PEDIDOS
    GROUP BY Cliente_Id;

    -- --------------------------------------- --
    -- -----------FROM IA -------------------- --
    -- --------------------------------------- --

    SELECT
    Cliente_Id AS "CLIENTE ID",
    SUM(Total) AS "Total Gastado"
    FROM PEDIDOS
    GROUP BY Cliente_Id;
    
    -- Estas confundiendo el SUM(columna) con el COUNT(*), dale atencion

--25. Mostrar los clientes que han gastado más de $1000 en total.
    SELECT
    Cliente_Id AS "CLIENTE ID",
    SUM(Total) AS "Total Gastado"
    FROM PEDIDOS
    GROUP BY Cliente_Id
    HAVING SUM(Total) > 1000;    



--26. Mostrar el mes con más ventas (agrupar por mes).
    SELECT 
    COUNT (*) AS "TOTAL", 
    TO_CHAR(Fecha_Pedido, 'FMMONTH')AS "AÑO-MES"
    FROM PEDIDOS
    GROUP BY TO_CHAR(Fecha_Pedido, 'FMMONTH')
    FETCH FIRST 1 ROWS ONLY;
    
    SELECT TO_CHAR(Fecha_Pedido, 'MONTH') FROM PEDIDOS
    
    -- --------------------------------------- --
    -- -----------FROM IA -------------------- --
    -- --------------------------------------- --

    -- Debes igualar ambas instrucciones usando 'MONTH' (o 'FMMONTH' 
    -- para limpiar espacios en blanco) en el SELECT y en el GROUP BY
    
    -- La diferencia fundamental entre 'MONTH' y 'FMMONTH' radica en los espacios
    -- en blanco invisibles (relleno) que Oracle añade al final del texto devuelto.

--EJERCICIOS DE JOIN
--27. Mostrar los pedidos con el nombre del cliente y el nombre del producto.
    SELECT
    P.Pedido_ID ,
    C.NOMBRE || ' ' || C.APELLIDO AS "Cliente",
    PR.NOMBRE_PRODUCTO AS "PRODUCTO"
    FROM PEDIDOS P
    JOIN CLIENTES C
    ON P.CLIENTE_ID = C.CLIENTE_ID
    JOIN PRODUCTOS PR
    ON P.PRODUCTO_ID = PR.PRODUCTO_ID
    
    
--28. Mostrar todos los clientes que NO han realizado ningún pedido.
    SELECT
    P.Pedido_ID ,
    P.Cliente_ID,
    C.NOMBRE || ' ' || C.APELLIDO AS "Cliente"
    
    FROM PEDIDOS P
    FULL OUTER JOIN CLIENTES C
    ON P.CLIENTE_ID = C.CLIENTE_ID
    WHERE P.CLIENTE_ID IS NULL
 

--29. Mostrar los productos que NO se han vendido nunca.
    SELECT 
    PR.PRODUCTO_ID,
    PR.NOMBRE_PRODUCTO
    FROM PEDIDOS P
    FULL OUTER JOIN PRODUCTOS PR
    ON P.PRODUCTO_ID = PR.PRODUCTO_ID
    WHERE P.PRODUCTO_ID IS NULL;

    SELECT * FROM PEDIDOS;
    SELECT * FROM PRODUCTOS

--30. Mostrar los pedidos con la siguiente información: ID del pedido, nombre del cliente, nombre del producto, cantidad, total y estado.
    SELECT
    P.Pedido_ID ,
    C.NOMBRE || ' ' || C.APELLIDO AS "Cliente",
    PR.NOMBRE_PRODUCTO AS "PRODUCTO",
    P.CANTIDAD,
    P.TOTAL,
    P.ESTADO
    
    FROM PEDIDOS P
    JOIN CLIENTES C
    ON P.CLIENTE_ID = C.CLIENTE_ID
    JOIN PRODUCTOS PR
    ON P.PRODUCTO_ID = PR.PRODUCTO_ID
    
    
--EJERCICIOS DE SUBCONSULTAS
--31. Mostrar los productos cuyo precio es mayor al precio promedio de todos los productos.
    SELECT * 
    FROM PRODUCTOS
    WHERE PRECIO > (SELECT AVG(PRECIO) FROM PRODUCTOS);


--32. Mostrar los clientes que han gastado más que el promedio de todos los clientes.
    SELECT 
    P.CLIENTE_ID,
    C.NOMBRE || ' ' || C.APELLIDO AS "CLIENTE",
    SUM(P.TOTAL) AS "CONSUMIDO"
    FROM PEDIDOS P
    JOIN CLIENTES C 
    ON P.CLIENTE_ID = C.CLIENTE_ID
    GROUP BY P.CLIENTE_ID, C.NOMBRE, C.APELLIDO
    HAVING SUM(P.TOTAL) > (
    SELECT
    AVG(TOTAL)
    FROM PEDIDOS)
    


--33. Mostrar el producto más vendido (en cantidad de unidades).
    SELECT 
    P.PRODUCTO_ID,
    PR.NOMBRE_PRODUCTO,
    SUM(P.CANTIDAD) AS "CANTIDAD VENDIDA"
    FROM PEDIDOS P
    JOIN PRODUCTOS PR
    ON P.PRODUCTO_ID = PR.PRODUCTO_ID
    GROUP BY P.PRODUCTO_ID, PR.NOMBRE_PRODUCTO
    HAVING SUM(P.CANTIDAD) = (
    SELECT
    MAX(SUM(CANTIDAD))
    FROM PEDIDOS
    GROUP BY PRODUCTO_ID 
    )
    
--34. Mostrar el cliente que ha realizado el pedido más caro.
    SELECT
    P.CLIENTE_ID AS "CLIENTE ID",
    C.NOMBRE || ' ' || C.APELLIDO AS "CLIENTE", 
    P.TOTAL
    FROM PEDIDOS P
    JOIN CLIENTES C
    ON P.CLIENTE_ID = C.CLIENTE_ID
    WHERE TOTAL = (
    SELECT 
    MAX(TOTAL)
    FROM PEDIDOS
    )

--35. Mostrar los productos con stock menor a 10 unidades.
    SELECT 
    *
    FROM PRODUCTOS
    WHERE STOCK <= 10
    

--Ejercicios de funciones de fecha
--36. Mostrar los clientes que se registraron en el año 2024.
    SELECT
    *
    FROM CLIENTES
    WHERE TO_CHAR (FECHA_REGISTRO, 'YY') = 24

--37. Mostrar los pedidos realizados en los últimos 30 días.
    SELECT
    *
    FROM CLIENTES
    WHERE FECHA_REGISTRO >= SYSDATE - 30

--38. Mostrar la cantidad de pedidos realizados por mes en el año 2024.
    SELECT
    TO_CHAR (FECHA_PEDIDO, 'FMMONTH') AS "MES",
    SUM(CANTIDAD) AS "SUMA"
    FROM PEDIDOS
    GROUP BY     TO_CHAR (FECHA_PEDIDO, 'FMMONTH') 
    
--39. Mostrar los clientes que cumplen años en el mes actual (asumiendo que fecha_registro es su cumpleaños).
    SELECT
    *
    FROM CLIENTES
    WHERE TO_CHAR(FECHA_REGISTRO, 'FMMONTH') =  TO_CHAR(SYSDATE, 'FMMONTH') 

--40. Mostrar la antigüedad en días de cada cliente (días desde su registro hasta hoy).
    SELECT
    NOMBRE || ' ' || APELLIDO,
    FECHA_REGISTRO AS "FECHA DE REGISTRO",
    TRUNC(SYSDATE - FECHA_REGISTRO) AS "ANTIGUEDAD_DIAS"
    FROM CLIENTES    


--Ejercicios de CASE y condiciones
--41. Clasificar los productos por precio: 'Económico' (menos de $100), 'Medio' ($100-$500), 'Caro' (más de $500).
    SELECT
    NOMBRE_PRODUCTO,
    PRECIO,
    CASE
        WHEN PRECIO < 100 THEN 'ECONOMICO'
        WHEN PRECIO >= 100 and PRECIO <= 500 THEN 'MEDIO'
        ELSE 'CARO'
    END AS "CLASIFICACION"
    FROM PRODUCTOS
    ORDER BY PRECIO DESC

--42. Mostrar los pedidos con una columna adicional que indique si el total es mayor o menor a $500.
    SELECT
    PEDIDO_ID,
    TOTAL,
    CASE
        WHEN TOTAL <= 500 THEN 'MAYOR'
        WHEN TOTAL > 500 THEN 'MENOR'
    END AS "INDICACION",
    FECHA_PEDIDO,
    ESTADO
    FROM PEDIDOS

--43. Clasificar a los clientes por ciudad: 'Local' si es 'Miami', 'Nacional' si es cualquier otra.
    SELECT
    NOMBRE || ' ' || APELLIDO,
    ESTADO,
    CIUDAD,
    CASE
        WHEN CIUDAD = 'Miami' THEN 'LOCAL'
        ELSE 'NACIONAL'
    END AS "CLASIFICACION"
    FROM CLIENTES

--44. Mostrar el estado del pedido traducido: 'PENDIENTE' → 'Pendiente', 'ENTREGADO' → 'Entregado', etc.
    SELECT
    PEDIDO_ID,
    TOTAL,
    ESTADO,
    CASE
        WHEN ESTADO = 'PENDIENTE' THEN 'Pendiente'
        WHEN ESTADO = 'ENTREGADO' THEN 'Entregado'
        ELSE 'Enviado'
    END AS "Traduccion"
    FROM PEDIDOS

--45. Crear una columna que indique el rango de edad de los clientes (asumiendo que tienen una columna de fecha de nacimiento, pero si no la tienen, puedes usar fecha_registro como referencia).
    SELECT
    NOMBRE || ' ' || APELLIDO AS "NOMBRE COMPLETO",
    FECHA_REGISTRO AS "FECHA DE NACIMIENTO",
    CASE
        WHEN (SYSDATE - FECHA_REGISTRO) > 500 THEN 'NUEVO'
        ELSE 'ANTIGUO'
    END AS "ANTIGUEDAD"
    FROM CLIENTES

--Ejercicios de manejo de NULL
--46. Mostrar los clientes reemplazando los teléfonos NULL con 'Sin teléfono'.
    SELECT
    CLIENTE_ID,
    NOMBRE || ' ' || APELLIDO AS "NOMBRE",
    (COALESCE(TELEFONO, 'SIN TELEFONO')) AS "TELEFONO"
    FROM CLIENTES
    WHERE TELEFONO IS NULL

--47. Mostrar los productos reemplazando las descripciones NULL con 'Sin descripción'.
    SELECT
    PRODUCTO_ID,
    NOMBRE_PRODUCTO,
    (COALESCE(DESCRIPCION, 'SIN DESCRIPCION')) AS "DESCRIPCION"
    FROM PRODUCTOS
    WHERE DESCRIPCION IS NULL

--48. Mostrar los pedidos con estado NULL como 'DESCONOCIDO'.
    SELECT
    PEDIDO_ID,
    FECHA_PEDIDO,
    (COALESCE(ESTADO, 'DESCONOCIDO')) AS "ESTADO"
    FROM PEDIDOS

--49. Contar cuántos clientes tienen teléfono registrado.
    SELECT
    COUNT(*) CLIENTE_ID
    FROM CLIENTES
    WHERE TELEFONO IS NOT NULL

--50. Mostrar los pedidos donde el precio_unitario sea NULL (si existe esa posibilidad).
    SELECT
    *
    FROM PEDIDOS
    WHERE PRECIO_UNITARIO IS NULL

--📙 EJERCICIOS AVANZADOS (Para seguir practicando)

--51. Numerar los pedidos de cada cliente según la fecha (el más reciente con número 1).

--52. Mostrar el ranking de clientes por total gastado.

--53. Mostrar el total acumulado de ventas por fecha.

--54. Mostrar el pedido anterior y siguiente de cada cliente.

--55. Calcular el promedio móvil de ventas de los últimos 3 días.

--Ejercicios con PIVOT
--56. Mostrar el total de ventas por estado del pedido y por mes (filas = meses, columnas = estados).

--57. Mostrar el total de pedidos por cliente y por estado del pedido.

--58. Mostrar la cantidad de productos vendidos por categoría y por mes.

--Ejercicios de modificación de datos (DML)
--59. Aumentar el precio de todos los productos de la categoría 'Computadoras' en un 10%.

--60. Actualizar el estado de todos los pedidos PENDIENTE a ENVIADO si tienen más de 7 días de antigüedad.

--61. Eliminar los clientes que no tienen pedidos y que se registraron hace más de 1 año.

--62. Insertar un nuevo cliente con tus propios datos.

--63. Insertar un nuevo producto con tus propios datos.

--64. Insertar un nuevo pedido para el cliente ID 1 con el producto ID 2.

--Ejercicios de vistas
--65. Crear una vista llamada VISTA_PEDIDOS_CLIENTES que muestre: pedido_id, cliente_nombre_completo, producto_nombre, cantidad, total, estado.

--66. Crear una vista llamada VISTA_TOP_CLIENTES que muestre los 5 clientes que más han gastado.

--67. Crear una vista llamada VISTA_PRODUCTOS_AGOTADOS que muestre los productos con stock menor o igual a 0.

--Ejercicios de funciones de texto
--68. Mostrar el email de los clientes con el dominio (parte después del @).

--69. Mostrar el nombre de los clientes con la primera letra en mayúscula y el resto en minúscula.

--70. Mostrar el nombre de los productos reemplazando los espacios por guiones bajos.

--Ejercicios de UNION y combinaciones
--71. Mostrar una lista única de todas las ciudades de clientes y las ciudades de productos (si existieran).

--72. Mostrar el nombre del cliente y el nombre del producto en una sola columna llamada "Nombre".

--73. Mostrar los clientes y los productos que tienen el mismo estado (CA, por ejemplo).

--Ejercicios de EXISTS y ANY
--74. Mostrar los clientes que han comprado al menos un producto de la categoría 'Teléfonos'.

--75. Mostrar los productos que han sido comprados por el cliente con ID 1.

--76. Mostrar los clientes que han comprado productos con precio mayor a $500.

--77. Mostrar los productos cuyo precio es mayor que el precio de cualquier producto de la categoría 'Accesorios'.

--78. Mostrar los clientes que han comprado el producto más caro.


--Ejercicios de WITH (CTE)
--79. Con un CTE, calcular el total de ventas por cliente y luego mostrar los clientes que superan el promedio.

--80. Con un CTE, calcular el stock total por categoría y mostrar las categorías con menos de 20 unidades.


--Ejercicios de análisis de datos
--81. Calcular el porcentaje de ventas de cada producto sobre el total.

--82. Calcular el crecimiento de ventas mes a mes.

--83. Encontrar clientes recurrentes (que han comprado más de 2 veces).

--84. Calcular el tiempo promedio entre pedidos de un mismo cliente.

--85. Encontrar la hora del día (o día de la semana) con más pedidos.



