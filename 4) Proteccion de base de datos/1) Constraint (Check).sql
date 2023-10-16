-- Josmar Gustavo Palomino Castelan
-- Josmar360
use Tintoreria_Aries;

-- Areas
alter table Areas add constraint Numeros_Positivos check (Cantidad_Empleados>0);
alter table Areas add constraint Numero_Area_Positivo check (Numero_Area>0);
alter table Areas add constraint Identificador_Areas_Valido check (Identificador_Area in ('L','M','P','PL'));

insert into Areas (Identificador_Area, Numero_Area, Nombre_Area, Cantidad_Empleados)
values  ('O', 6, 'Prueba', 4);

-- Clientes
alter table Clientes add constraint Numero_Ext_Clientes check (Numero_Exterior>=0);

-- Detalles Pedidos
alter table Detalles_Pedidos add constraint Cantidad_Producto_Positivo check (Cantidad_Producto>=1);

-- Lavado
alter table Lavado add constraint Area_Siguiente_Valida check (Area_Siguiente in ('PL'));
alter table Lavado add constraint Estatus_Lavado_Valido check (Estatus in ('Terminada','Pendiente'));

-- Mostrador
alter table Mostrador add constraint Area_Siguiente_Mostrador_Valida check (Area_Siguiente in ('L','T','REP','P','PL'));
alter table Mostrador add constraint Estatus_De_Mostrador_Valido check (Estatus in ('Enviada','Pendiente'));

-- Notas
update Notas set Tipo_Servicio = ('Lavado en seco') where Folio_Nota=753;
update Notas set Tipo_Servicio = ('Lavado en seco') where Folio_Nota=820;
alter table Notas add constraint Tipo_Servicio_Mostrador_Valido check (Tipo_Servicio in ('Lavado','Teñido','Reparación','Lavado en seco','Planchado'));
alter table Notas add constraint Estatus_Mostrador_Valido check (Estatus in ('En Lavado','En Teñido','En Reparacion','En Planta','En Planchado','En Mostrador',''));


-- Pedidos
alter table Pedidos add constraint Total_Pagar_Valido check (Total_Pagar>0);
alter table Pedidos add constraint Pago_Extra_Valido check (Pago_Extra>0);

-- Planchado
alter table Planchado add constraint Area_Siguiente_Planchado_Valido check (Area_Siguiente in ('M'));
alter table Planchado add constraint Estatus_Planchado_Valido check (Estatus in ('Terminada','Pendiente'));

-- Planta
alter table Planta add constraint Area_Siguiente_Planta_Valido check (Area_Siguiente in ('PL'));
alter table Planta add constraint Estatus_Planta_Valido check (Estatus in ('Terminada','Pendiente'));

-- Precios Prendas
alter table Precios_Prendas add constraint Precio_Unitatio_Prenda_Valido check (Precio_Unitario>0);

-- Prendas
alter table Prendas add constraint Cantidad_Prendas_Valido check (Cantidad>0);
alter table Prendas add constraint Precio_Total_Prendas_Valido check (Precio_Total>0);

-- Productos
alter table Productos add constraint Piezas_Productos_Valido check (Piezas>0);
alter table Productos add constraint Precio_Unitario_Productos_Valido check (Precio_Unitario>0);
alter table Productos add constraint Existencia_Productos_Valido check (Existencia>=0);

-- Proveedores
alter table Proveedores add constraint Numero_Exterior_Proveedor_Valido check (Numero_Exterior>=0);
alter table Proveedores add constraint Vigente_Proveedores_Valido check (Vigente in (0,1));

-- Tenido_Reparacion
alter table Tenido_Reparacion add constraint Cantidad_Prendas_Tenido_Valido check (Cantidad_Prendas>0);
alter table Tenido_Reparacion add constraint Estatus_Tenido_Valido check (Estatus in ('Terminada','Pendiente'));

select*from Tenido_Reparacion;

select*from Notas;