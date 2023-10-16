-- Josmar Gustavo Palomino Castelan
-- Josmar360
use Tintoreria_Aries;
set SQL_SAFE_UPDATES=0; 

----- Prenda que deja más ganancia en el área de Lavado -----
select Tipo_Prenda as Prenda, sum(Cantidad), sum(Precio_Total) 
from Prendas INNER JOIN Lavado 
on Lavado.Folio_Nota = Prendas.Folio_Nota
group by Tipo_Prenda
order by sum(Precio_Total)desc;

-- Consulta multitabla que permite mostrar cada una de las areas que tienen la tintoreria, donde muestra cuantas veces solicitan
-- dicho servicio y cuantas prendas son mandadas a esa area con la ganancia total de cada una.
select N.Tipo_Servicio as 'Servicio Solicitado', count(Tipo_Servicio) as 'Cantidad servicio', sum(Cantidad) 'Prendas por area', sum(Precio_Total) as 'Dinero Recaudado' 
from Notas as N join Prendas as P on N.Folio_Nota = P.Folio_Nota
group by Tipo_Servicio;

/*----------CONSULTA MULTITABLA------------- Fatima Melchor Rodriguez--------*/
select clientes.Telefono_Cliente, clientes.Primer_Nombre, clientes.Primer_Apellido, count(notas.Folio_Nota) as Total_Notas,
sum(prendas.Precio_Total) as Total_Pagado
from Clientes join notas on clientes.Telefono_Cliente = notas.Telefono_Cliente
join prendas on notas.Folio_Nota = prendas.Folio_Nota 
group by notas.Folio_Nota;

-- Consuta multitabla que muestra las prendas que se manejan, su precio unitario, el numero de pedidos que hay de cada
-- prenda, la cantida total de los pedidos y el dinero total por todas 
select precios_prendas.Tipo_Prenda as 'Prendas:', Notas.Estatus as Estatus, precios_prendas.Precio_Unitario as 'Precio $:',
count(prendas.Tipo_Prenda) as '# de Pedidos de esa prenda:', sum(prendas.Cantidad) as 'Cantidad de prendas:',
precios_prendas.Precio_Unitario*sum(prendas.Cantidad) as 'Total'
from Notas join Prendas on Notas.Folio_Nota = Prendas.Folio_Nota
join precios_prendas on prendas.Tipo_Prenda = precios_prendas.Tipo_Prenda
where Estatus<>''
group by precios_prendas.Tipo_Prenda;

select*from Notas;

update Notas set Folio_Nota=751 where Estatus='Entregado';

-- Consulta multitabla que muestra los productos que se estan agotando, de igual forma mostrandonos el proveedor que maneja el producto que 
-- se es requerido y su contacto para realizar la compra de dicho producto 
select productos.Nombre_Producto as 'Producto por Agotarse', productos.Existencia as 'Existencia', productos.Precio_Unitario as 'Precio Unitario',
proveedores.Nombre_Distribuidora as 'Distribuidor', proveedores.Catalogo_Productos as 'Manejo de productos', proveedores.Telefono_Principal as Contacto
from   productos join proveedores 
where Existencia <= '5'
group by productos.Nombre_Producto;