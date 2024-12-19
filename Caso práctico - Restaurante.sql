
---

-- a) Crear la base de datos con el archivo create_restaurant_db.sql

-- b) Explorar la tabla “menu_items” para conocer los productos del menú.

--	Realizar consultas para contestar las siguientes preguntas:
--		Encontrar el número de artículos en el menú.
	SELECT COUNT (menu_item_id) FROM menu_items;
	-- 32 ARTÍCULOS EN EL MENÚ.

-- 		¿Cuál es el artículo menos caro y el más caro en el menú?
	SELECT item_name, price FROM menu_items ORDER BY price ASC LIMIT 1;
    SELECT item_name, price FROM menu_items ORDER BY price DESC LIMIT 1;
	-- ARTÍCULO MÁS CARO Shrimp Scampi $19.95, ARTÍCULO MÁS BARATO Edamame $5.00
	
--		¿Cuántos platos americanos hay en el menú?
	SELECT COUNT (category) FROM menu_items WHERE category = 'American';
	-- SEIS PLATILLOS AMERICANOS.
	
--		¿Cuál es el precio promedio de los platos?
	SELECT round (AVG (price),2) FROM menu_items;
	-- EL PRECIO PROMEDIO ES DE $13.29
	
--	c) Explorar la tabla “order_details” para conocer los datos que han sido recolectados.
--	Realizar consultas para contestar las siguientes preguntas:
	SELECT * FROM order_details;
	
--		¿Cuántos pedidos únicos se realizaron en total?
	SELECT COUNT (DISTINCT order_id) FROM order_details;
	-- 5,370 ÓRDENES DIFERENTES. 
	
--		¿Cuáles son los 5 pedidos que tuvieron el mayor número de artículos?
	SELECT order_id, COUNT(item_id) AS num_items FROM order_details
	GROUP BY order_id
	ORDER BY num_items DESC;
	-- EXISTE UN TOTAL DE 7 PEDIDOS CON 14 ARTÍCULOS CADA UNO. LOS PEDIDOS ANTES MENCIONADOS QUE CUENTAN 
	-- CON EL MAYOR NÚMERO DE ARTÍCULOS SON LOS SIGUIENTES: 330, 440, 443, 1957, 2675. 

--		¿Cuándo se realizó el primer pedido y el último pedido?

	SELECT order_date FROM order_details ORDER BY order_date ASC;
	SELECT order_date FROM order_details ORDER BY order_date DESC;
	-- EL PRIMER PEDIDO SE REALIZÓ EL 01/01/2023 Y EL ÚLTIMO PEDIDO EL 31/03/2023.

--		¿Cuántos pedidos se hicieron entre el '2023-01-01' y el '2023-01-05'?

	SELECT COUNT (DISTINCT order_id) FROM order_details
	WHERE order_date BETWEEN '2023-01-01' AND '2023-01-05';
	-- SE REALIZARON 308 PEDIDOS EN ESE PERIODO DE TIEMPO. 
	
-- d) Usar ambas tablas para conocer la reacción de los clientes respecto al menú.

	SELECT * FROM order_details AS od
	INNER JOIN menu_items AS mi
	ON od.item_id = mi.menu_item_id;

	SELECT * FROM order_details AS od
	LEFT JOIN menu_items AS mi
	ON od.item_id = mi.menu_item_id
	WHERE price IS NULL;

	SELECT * FROM order_details AS od
	RIGHT JOIN menu_items AS mi
	ON od.item_id = mi.menu_item_id
	WHERE order_id IS NULL;


--		1.- Realizar un left join entre entre order_details y menu_items con el identificador
--      item_id(tabla order_details) y menu_item_id(tabla menu_items).

	SELECT * FROM order_details AS od
	LEFT JOIN menu_items AS mi
	ON od.item_id = mi.menu_item_id;

	SELECT * FROM order_details AS od
	LEFT JOIN menu_items AS mi
	ON od.item_id = mi.menu_item_id
	WHERE price IS NULL;

	SELECT COUNT (DISTINCT order_id) FROM order_details AS od
	LEFT JOIN menu_items AS mi
	ON od.item_id = mi.menu_item_id
	WHERE price IS NULL;

-- e) Una vez que hayas explorado los datos en las tablas correspondientes y respondido las
-- preguntas planteadas, realiza un análisis adicional utilizando este join entre las tablas. El
-- objetivo es identificar 5 puntos clave que puedan ser de utilidad para los dueños del
-- restaurante en el lanzamiento de su nuevo menú. Para ello, crea tus propias consultas y
-- utiliza los resultados obtenidos para llegar a estas conclusiones.

--¿CUÁLES SON LOS PLATILLOS QUE MÁS GANANCIAS GENERAN?
--KOREAN BEEF BOWL $10,554.60, SPAGHETTI & MEATBALLS $8,436.50, TOFU PAD THAI $8,149.00, CHEESEBURGER $8,132.85, HAMBURGER $8,054.90.
	SELECT od.item_id, mi.item_name, mi.category, SUM (mi.price) AS total_ventas FROM order_details AS od
	INNER JOIN menu_items AS mi
	ON od.item_id = mi.menu_item_id
	GROUP BY 1, 2, 3
	ORDER BY 4 DESC
	limit 5;

--¿CUÁLES SON LOS PLATILLOS QUE MENOS GANANCIAS GENERAN? 
--CHICKEN TACOS $1,469.85, POTSTICKERS $1,845.00, CHIPS & GUACAMOLE $2,133.00, HOT DOG $2,313.00, CHEESE QUESADILLAS $2,446.50.
	SELECT od.item_id, mi.item_name, SUM (mi.price) AS total_ventas FROM order_details AS od
	INNER JOIN menu_items AS mi
	ON od.item_id = mi.menu_item_id
	GROUP BY 1, 2
	ORDER BY 3 ASC
	LIMIT 5;

--¿CUÁLES SON LOS PLATILLOS QUE MÁS SE CONSUMEN?
--HAMBURGER, EDAMAME, KOREAN BEEF BOWL, CHEESEBURGER, FRENCH FRIES. 
	SELECT od.item_id, mi.item_name, mi.category, COUNT (od.order_details_id) AS total_platillos FROM order_details AS od
	LEFT JOIN menu_items AS mi
	ON od.item_id = mi.menu_item_id
	GROUP BY 1, 2, 3
	ORDER BY 4 DESC
	LIMIT 5;

--¿CUÁLES SON LOS PLATILLOS QUE MENOS SE CONSUMEN?
--CHICKEN TACOS, POTSTICKERS, CHEESE LASAGNA, STEAK TACOS, CHEESE QUESADILLAS. 
	SELECT od.item_id, mi.item_name, mi.category, COUNT (od.order_details_id) AS total_platillos FROM order_details AS od
	INNER JOIN menu_items AS mi
	ON od.item_id = mi.menu_item_id
	GROUP BY 1, 2, 3
	ORDER BY 4 ASC
	limit 5;

--¿CUÁLES SON LOS TRES DÍAS DE LA SEMANA DÓNDE MÁS SE CONCURRE EL RESTAURANTE? 
--LUNES, VIERNES Y MARTES.

	SELECT TO_CHAR(order_date, 'Day') AS dia_de_la_semana, 
	COUNT(*) AS cantidad_de_pedidos
	FROM order_details
	GROUP BY dia_de_la_semana
	ORDER BY cantidad_de_pedidos DESC;


