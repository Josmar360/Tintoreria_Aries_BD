-- Josmar Gustavo Palomino Castelan
-- Josmar360
-- Creacion de base de datos
CREATE SCHEMA `tintoreria_Aries` ;

-- Creacion de tablas para base de datos
create table Clientes
(
    Telefono_Cliente varchar(10) not null,
    Primer_Nombre varchar(15) not null,
    Segundo_Nombre varchar(15),
    Primer_Apellido varchar(15) not null,
    Segundo_Apellido varchar(15) not null,
    Calle varchar(20) not null,
    Numero_Exterior int not null,
    constraint clientes primary key 
    (
        Telefono_Cliente
    )
);

create table Notas 
(
    Folio_Nota int not null,
    Telefono_Cliente varchar(10) not null,
    Tipo_Servicio varchar(15) not null,
    Fecha_Entrega_Estimada date not null,
    Fecha_Hora_Estimada time not null,
    constraint Notas primary key
    (
        Folio_Nota
    )
);

alter table Notas add constraint Telefono_Clientes_FK foreign key(Telefono_Cliente) references Clientes(Telefono_Cliente);

create table Precios_Prendas
(
    Tipo_Prenda varchar(18) not null,
    Precio_Unitario float not null,
    constraint Precios_Prendas primary key
    (
        Tipo_Prenda
    )
);

create table Prendas
(
    Folio_Nota int not null,
    Tipo_Prenda varchar(18) not null,
    Color varchar(15) not null,
    Cantidad int not null,
    Precio_Total float not null,
    Observaciones varchar(30) not null,
    Fecha_Entrada date not null,
    Hora_Entrada time not null,
    Fecha_Salida date not null,
    Hora_Salida time not null
);


alter table Prendas add constraint Precios_Prendas_FK foreign key (Tipo_Prenda) references Precios_Prendas(Tipo_Prenda);
alter table Prendas add constraint Notas_FK foreign key (Folio_Nota) references Notas(Folio_Nota);

create table Areas 
(
    Identificador_Area char(3) not null,
    Numero_Area int not null, 
    Nombre_Area varchar(15) not null,
    Cantidad_Empleados int not null,
    constraint Areas primary key 
    (
        Identificador_Area
    )
);

create table Mostrador
(
    Folio_Nota int not null,
    Fecha_Entrada date not null,
    Identificador_Area char(3) not null,
    Hora_Entrada time not null,
    Fecha_Salida date not null,
    Hora_Salida time not null,
    Area_Siguiente char(3) not null,
    Estatus varchar(15) not null,
    constraint Mostrador primary key
    (
        Fecha_Entrada
    )
);

alter table Mostrador add constraint Identificador_Area_Mostrador_FK foreign key (Identificador_Area) references Areas(Identificador_Area);
alter table Mostrador add constraint Notas_Mostrador_FK foreign key (Folio_Nota) references Notas(Folio_Nota);

create table Planta
(
    Folio_Nota int not null,
    Fecha_Entrada date not null,
    Identificador_Area char(3) not null,
    Hora_Entrada time not null,
    Fecha_Salida date not null,
    Hora_Salida time not null,
    Estatus varchar(15) not null,
    Area_Siguiente int not null,
    constraint Planta primary key
    (
        Fecha_Entrada
    )
);

alter table Planta add constraint NotasPlanta_FK foreign key (Folio_Nota) references Notas(Folio_Nota);
alter table Planta add constraint Identificador_Area_Planta_FK foreign key (Identificador_Area) references Areas(Identificador_Area);

create table Lavado
(
    Folio_Nota int not null,
    Fecha_Entrada date not null,
    Identificador_Area char(3) not null,
    Hora_Entrada time not null,
    Fecha_Salida date not null,
    Hora_Salida time not null,
    Estatus varchar(15) not null,
    Area_Siguiente int not null,
    constraint Lavado primary key
    (
        Fecha_Entrada
    )
);

alter table Lavado add constraint Notas_Lavado_FK foreign key (Folio_Nota)references Notas(Folio_Nota);
alter table Lavado add constraint Identificador_Area_Lavado_FK foreign key (Identificador_Area) references Areas(Identificador_Area);

create table Planchado
(
    Folio_Nota int not null,
    Identificador_Area char(3) not null,
    Fecha_Entrada date not null,
    Hora_Entrada time not null,
    Fecha_Salida date not null,
    Hora_Salida time not null,
    Estatus varchar(15) not null,
    Area_Siguiente int not null,
    constraint Planchado primary key
    (
        Fecha_Entrada
    )
);

alter table Planchado add constraint Notas_Planchado_FK foreign key (Folio_Nota) references Notas(Folio_Nota);
alter table Planchado add constraint Identificador_Area_Planchado_FK foreign key (Identificador_Area) references Areas(Identificador_Area);

create table Colaboradores
(
    Telefono_Colaborador char(10) not null,
    Nombre_Colaborador varchar(15) not null,
    Primer_Apellido_Colaborador varchar(15) not null,
    Segundo_Apellido_Colaborador varchar(15) not null,
    constraint Colaboradores primary key
    (
        Telefono_Colaborador
    )
);

create table Tenido_Reparacion 
(
    Folio_Nota int not null,
    Cantidad_Prendas int not null,
    Tipo_Servicio varchar(20) not null,
    Telefono_Colaborador char(10) not null,
    Estatus Varchar(15),
    constraint Tenido_Reparacion primary key
    (
        Cantidad_Prendas
    )
);

alter table Tenido_reparacion add constraint Nota_Tenido_FK foreign key (Folio_Nota) references Notas(Folio_Nota);
alter table Tenido_Reparacion add constraint Colaborador_FK foreign key (Telefono_Colaborador) references Colaboradores(Telefono_Colaborador);

create table Productos
(
    Clave_Producto char(10) not null,
    Nombre_Producto varchar(25) not null,
    Piezas int not null,
    UM char(5) not null,
    Descripcion_Producto varchar(35),
    Precio_Unitario float not null,
    Existencia int not null,
    constraint Productos primary key
    (
        Clave_Producto
    )
);

create table Proveedores
(
    Nombre_Distribuidora varchar(25) not null, 
    Codigo_Postal char(5) not null,
    Calle varchar(15) not null,
    Numero_Exterior int not null,
    Colonia varchar(15) not null,
    Telefono_Principal char(10) not null,
    Telefono_Alterno char(10),
    Correo_Electronico char(35) not null,
    Metodo_Pago varchar(15) not null,
    Catalogo_Productos varchar(25) not null,
    Municipio varchar(15) not null,
    Estado varchar(15) not null,
    constraint Proveedores primary key
    (
        Nombre_Distribuidora
    )
);

create table Pedidos
(
    Numero_Pedido char(10) not null,
    Fecha_Pedido date not null,
    Total_Pagar float not null,
    Nombre_Distribuidora varchar(25) not null,
    constraint Pedidos primary key
    (
        Numero_pedido
    )
);

alter table Pedidos add constraint Nombre_Distribuidora_FK foreign key (Nombre_Distribuidora) references Proveedores(Nombre_Distribuidora);

create table Detalles_Pedidos
(
    Numero_Pedido char(10) not null, 
    ID_Producto char(10) not null,
    Cantidad_Producto int not null
);

alter table Detalles_Pedidos add constraint Numero_Pedido_FK foreign key (Numero_Pedido) references Pedidos(Numero_Pedido);
alter table Detalles_Pedidos add constraint ID_Producto_FK foreign key (ID_Producto) references Productos(Clave_Producto);