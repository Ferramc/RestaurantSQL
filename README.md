# Sabores del Mundo 

## Contexto
El restaurante Sabores del Mundo es conocido por su auténtica cocina y su ambiente acogedor, por lo cual lanzó un nuevo menú a principios de año y ha estado recopilando información detallada sobre las transacciones de los clientes para identificar áreas de oportunidad y aprovechar al máximo sus datos para optimizar las ventas.

## Objetivo
Identificar cuáles son los productos del menú que han tenido más éxito y cuáles son los que menos han gustado a los clientes.

## Para comenzar
Se crearon dos bases de datos en PostgreSQL con los datos proporcionados por el restaurante Sabores del Mundo; la tabla llamada **menu_items** contiene los productos del menú divididos por: número de identificación, tipo de cocina a la cual pertenece el producto, nombre del platillo y precio en dólares. En la segunda tabla llamada **order details** se encuentran datos recolectados de las órdenes, como lo son: el número de identificación de un producto del menú en una orden en específico, identificación de una orden, así como  la fecha y la hora al momento de hacer algún pedido. 

## Después de crear la base de datos, exploraremos las dos tablas para responder algunas preguntas

### Primero vamos con la tabla del menú: 

● Encontrar el número de artículos en el menú:

El menú contiene **32 artículos** en total.

● ¿Cuál es el artículo menos caro y el más caro en el menú?

**Artículo más caro** Shrimp Scampi $19.95, **Artículo más barato** Edamame $5.00

● ¿Cuántos platilloss americanos hay en el menú?

En el menú se encuentran **6** platillos dentro de esa categoría. 

● ¿Cuál es el precio promedio de los platos?

El precio promedio es de **$13.29 dólares.**

### Ahora vamos con la tabla de las órdenes: 

● ¿Cuántos pedidos únicos se realizaron en total?

Se realizaron **5,370 órdenes diferentes** en total. 

● ¿Cuáles son los 5 pedidos que tuvieron el mayor número de artículos?

Existe un total de **7 pedidos con 14 artículos cada uno**. Los pedidos antes mencionados que cuentan con el mayor número de artículos son los siguientes: 330, 440, 443, 1957, 2675.

● ¿Cuándo se realizó el primer pedido y el último pedido?

El primer pedido se realizó el día **01/01/2023** y el último el día **31/03/2023.**

● ¿Cuántos pedidos se hicieron entre el '2023-01-01' y el '2023-01-05'?

Se realizaron **308 pedidos** en ese periodo de tiempo. 

## Para finalizar
Se realizó un **leftjoin** con las tablas antes mencionadas para realizar un análisis adicional. Las preguntas que surgieron de ese análisis las podemos leer aquí:

● ¿Cuáles son los platillos que más ganancias generan?

1. Korean Beef Bowl $10,554.60 
2. Spaguetti & Meatballs $8,436.50 
3. Tofu Pad Thai $8,149.00
4. Cheeseburger $8,132.85 
5. Hamburger $8,054.90
   
![image](https://github.com/user-attachments/assets/56985221-eb0c-4115-9081-e0f20038050c)

● ¿Cuáles son los platillos que menos ganancias generan?

1. Chicken Tacos $1,469.85 
2. Potstickers $1,845.00
3. Chips & Guacamole $2,133.00
4. Hot dog $2,313.00
5. Cheese Quesadillas $2,446.50

![image](https://github.com/user-attachments/assets/69eb4b95-9b23-4aa1-9b84-84956f7fee53)

● ¿Cuáles son los platillos que más se consumen? 

Hamburger, Edamame, Korean beef bowl, Cheeseburger y French fries.

![image](https://github.com/user-attachments/assets/061e1a73-e2e5-4f16-835f-cbc5dad62636)

● ¿Cuáles son los platillos que menos se consumen? 

Chicken tacos, Potstickers, Cheese lasagna, Steak tacos y Cheese quesadillas. 

![image](https://github.com/user-attachments/assets/3780ac66-a7cf-4757-803c-0232e9f58673)

● ¿Cuáles son los días de la semana cuando más pedidos se hacen en el restaurante? 

Lunes, viernes y martes. 

![image](https://github.com/user-attachments/assets/1d6752d9-b790-4793-81ac-eecd0828151c)


## Conclusiones 
para cerrar este análisis proseguimos a hacer las siguientes observaciones: 

Los platillos más vendidos son de la categoría de comida italiana y asiática, siendo estos el espagueti y el tazón de carne coreano; por su parte, la categoría que menos ventas tuvo dentro del menú fue la comida americana, sin embargo, los platillos que más se venden en general son las hamburguesas, hamburguesas de queso y papas fritas. 

Los productos que menos se venden y por consecuente, menos ganancias generan, son los tacos de pollo y las empanadas, por lo cual se pueden eliminar del menú y directamente aprovechar ese espacio para introducir nuevos productos dentro de las categorías italiana o asiática. 

Los días viernes, que coinciden con el inicio del fin de semana, se podrían crear promociones en alimentos sea para llevar o para consumir dentro del restaurante.















