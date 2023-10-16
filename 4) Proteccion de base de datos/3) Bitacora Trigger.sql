-- Josmar Gustavo Palomino Castelan
-- Josmar360
use tintoreria_aries;
select * from productos;
select * from BitacoraProductos;
/*------------------------------- BITACORA CON USO DE TRIGGRES ---------------------------- */
/*Tabla que sirve como bitacora*/
CREATE TABLE BitacoraProductos(
Clave int auto_increment primary key,
Operacion varchar(15),
Usuario varchar(30),
FechaHora datetime,
ClaveProducto_Nueva char(10),
ClaveProducto_Anterior char(10),
NombreProducto_Nuevo varchar(40),
NombreProducto_Anterior varchar(40),
Piezas_Nuevo int,
Piezas_Anterior int,
UM_Nueva char(10),
UM_Anterior char(10),
DescripcionProducto_Nueva varchar(35),
DescripcionProducto_Anterior varchar(35),
PrecioUnitario_Nuevo float,
PrecioUnitario_Anterior float,
Existencia_Nueva int,
Existencia_Anterior int
);


/*Trigger DESPUES DE INSERTAR en la tabla PRODUCTOS*/
CREATE TRIGGER InsertarProducto after Insert
on productos
for each row
insert into BitacoraProductos(Operacion, usuario, FechaHora, ClaveProducto_Nueva, NombreProducto_Nuevo, Piezas_Nuevo, UM_Nueva, DescripcionProducto_Nueva, PrecioUnitario_Nuevo, Existencia_Nueva)
values ('INSERTO', USER(), NOW(), new.Clave_Producto, new.Nombre_Producto, new.piezas, new.UM, new.Descripcion_Producto, new.Precio_Unitario, new.Existencia);


/*Trigger DESPUES DE MODIFICAR en la tabla PRODUCTOS*/
CREATE TRIGGER ModificarProducto after update
on productos
for each row
insert into BitacoraProductos(Operacion, usuario, FechaHora, ClaveProducto_Nueva, ClaveProducto_Anterior, NombreProducto_Nuevo, NombreProducto_Anterior, Piezas_Nuevo, Piezas_Anterior, UM_Nueva, UM_Anterior, DescripcionProducto_Nueva, DescripcionProducto_Anterior, PrecioUnitario_Nuevo, PrecioUnitario_Anterior, Existencia_Nueva, Existencia_Anterior)
values ('MODIFICO', USER(), NOW(), new.Clave_Producto, old.Clave_Producto, new.Nombre_Producto, old.Nombre_Producto, new.piezas, old.Piezas, new.UM, old.UM, new.Descripcion_Producto, old.Descripcion_Producto, new.Precio_Unitario, old.Precio_Unitario, new.Existencia, old.Existencia);


/*Trigger DESPUES DE ELIMINAR en la tabla PRODUCTOS*/
CREATE TRIGGER EliminarProducto after delete
on productos
for each row
insert into BitacoraProductos(Operacion, usuario, FechaHora, ClaveProducto_Anterior, NombreProducto_Anterior, Piezas_Anterior, UM_Anterior, DescripcionProducto_Anterior, PrecioUnitario_Anterior, Existencia_Anterior)
values ('ELIMINO', USER(), NOW(), old.Clave_Producto, old.Nombre_Producto, old.piezas, old.UM, old.Descripcion_Producto, old.Precio_Unitario, old.Existencia);

/*---------------  PRUEVA ----------------*/
/*Inserción*/
INSERT INTO `tintoreria_aries`.`productos` (`Clave_Producto`, `Nombre_Producto`, `Piezas`, `UM`, `Descripcion_Producto`, `Precio_Unitario`, `Existencia`) 
VALUES ('V37', 'Bolsa negra grande', '50', 'Piezas', 'Caja', '99.99', '56');

/*Modificación*/
UPDATE `tintoreria_aries`.`productos` 
SET `Nombre_Producto` = 'Bolsa Larga', `Precio_Unitario` = '80.67', `Existencia` = '45' 
WHERE (`Clave_Producto` = 'V37');

/*Eliminación*/
DELETE FROM `tintoreria_aries`.`productos` 
WHERE (`Clave_Producto` = 'V37');

/*----------------- Eliminacion de TRIGGRES------------- */
drop trigger InsertarProducto;
drop trigger ModificarProducto;
drop trigger EliminarProducto;
