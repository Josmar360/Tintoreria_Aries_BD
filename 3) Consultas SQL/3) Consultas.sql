-- Josmar Gustavo Palomino Castelan
-- Josmar360
use Tintoreria_Aries;
set SQL_SAFE_UPDATES = 0;
-- Consultas 

-- Ejercicio 1
alter table Proveedores add Vigente bit not null;

select Colonia, count(Colonia) Repetidos 
from Proveedores 
group by Colonia 
having Repetidos > 1;

update Proveedores set Vigente = 1
where Colonia = 'Loma Bonita';

select*from Proveedores;


-- Ejercicio 2
select Prendas.Folio_Nota, Tipo_Prenda, Precio_Unitario, Cantidad, Precio_Total
from Notas, precios_prendas
natural join Prendas
group by Folio_Nota;


-- Ejercicio 3
select Clientes.Telefono_Cliente, Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Calle, Numero_Exterior, Notas.Folio_Nota, Precio_Total
from Notas, Prendas
natural join Clientes
group by Telefono_Cliente;


-- Ejercicio 4
select*from Notas
inner join Clientes on Notas.Telefono_Cliente = Clientes.Telefono_Cliente
inner join Prendas on Notas.Folio_Nota = Prendas.Folio_Nota;


-- Ejercicio 5
select*from Notas
inner join Clientes on Notas.Telefono_Cliente = Clientes.Telefono_Cliente
inner join Prendas on Notas.Folio_Nota = Prendas.Folio_Nota;

select Notas.Telefono_Cliente, count(Notas.Telefono_CLiente) Constantes
from Notas
inner join Clientes on Notas.Telefono_Cliente = Clientes.Telefono_Cliente
inner join Prendas on Notas.Folio_Nota = Prendas.Folio_Nota
group by Notas.Telefono_Cliente
having Constantes>1;


-- Ejercicio 6
select Folio_Nota as Folio, Hora_Entrada, Hora_Salida, (Hora_Salida-Hora_Entrada) as Tiempo_Diferencia, avg(Hora_Salida-Hora_Entrada) as Tiempo_Promedio
from planchado
group by Folio_Nota;


-- Ejercicio 7
select Numero_Pedido, Proveedores.Nombre_Distribuidora, Calle, Numero_Exterior, Colonia, Codigo_Postal, Telefono_Principal, Telefono_Alterno, Correo_Electronico, Metodo_Pago, Catalogo_Productos, Municipio, Estado 
from Pedidos
inner join Proveedores on Pedidos.Nombre_Distribuidora = Proveedores.Nombre_Distribuidora  limit 0,5;


-- Ejercicio 8
alter table Pedidos add Pago_Extra float not null;

update Pedidos set Pago_Extra = 80.00;

select Numero_Pedido, Proveedores.Nombre_Distribuidora, Pago_Extra, Calle, Numero_Exterior, Colonia, Codigo_Postal, Telefono_Principal, Telefono_Alterno, Correo_Electronico, Metodo_Pago, Catalogo_Productos, Municipio, Estado 
from Pedidos
inner join Proveedores on Pedidos.Nombre_Distribuidora = Proveedores.Nombre_Distribuidora  limit 0,5;


-- Ejercio 9
select Numero_Pedido, Proveedores.Nombre_Distribuidora, sum(Total_Pagar) as Total_Pagado, Calle, Numero_Exterior, Colonia, Codigo_Postal, Telefono_Principal, Telefono_Alterno, Correo_Electronico, Metodo_Pago, Catalogo_Productos, Municipio, Estado 
from Pedidos
inner join Proveedores on Pedidos.Nombre_Distribuidora = Proveedores.Nombre_Distribuidora  limit 0,5;


-- Ejercicio 10
select Numero_Pedido, Pedidos.Nombre_Distribuidora, count(Pedidos.Nombre_Distribuidora) Mayor3, Numero_Exterior, Colonia, Codigo_Postal, Telefono_Principal, Telefono_Alterno, Correo_Electronico, Metodo_Pago, Catalogo_Productos, Municipio, Estado 
from Pedidos
inner join Proveedores on Pedidos.Nombre_Distribuidora = Proveedores.Nombre_Distribuidora
group by Pedidos.Nombre_Distribuidora
having Mayor3 > 1 limit 0,5;