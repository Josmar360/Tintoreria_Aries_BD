-- Josmar Gustavo Palomino Castelan
-- Josmar360
use tintoreria_aries; 

use Proyecto;

-- BLOQUEO DE LECTURA DE UNA TABLA
SET AUTOCOMMIT=0;
COMMIT;
LOCK TABLE AREAS READ;

SELECT * FROM AREAS;
insert into Areas(Identificador_Area, Numero_Area, Nombre_Area, Cantidad_Empleados)
values ('Z', 10, 'Ejemplo', 3);

ROLLBACK;
UNLOCK TABLES;

delete from areas where Identificador_Area = 'Z';

-- BLOQUEO DE ESCRITURA DE UNA TABLA
select * from precios_prendas;

SET AUTOCOMMIT=0;
COMMIT;
LOCK TABLE precios_prendas WRITE;

update precios_prendas set Precio_Unitario=100.00 where Tipo_Prenda='Abrigo';

ROLLBACK;
UNLOCK TABLES;