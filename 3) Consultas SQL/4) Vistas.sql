-- Josmar Gustavo Palomino Castelan
-- Josmar360
use tintoreria_aries;
SET SQL_SAFE_UPDATES = 0;

-- Ejercicio 1
alter table notas add Estatus varchar(15) not null;
select*from notas;

-- Ejercicio 2
select*from Planta_Pendiente;
select*from Planta;
select*from Notas;

-- Se agrego un nuevo dato para que en la vista pendiente tuviera por lo menos uno
insert into Notas(Folio_Nota, Telefono_Cliente, Tipo_Servicio, Fecha_Entrega_Estimada, Fecha_Hora_Estimada, Estatus)
values(820, '5586740704', 'Planta', '2021-11-06', '16:30', '');

insert into Planta(Folio_Nota, Fecha_Entrada, Identificador_Area, Hora_Entrada, Estatus, Area_Siguiente)
values (820, '2021-11-16', 'P', '11:00', 'Pendiente','PL');

-- Se nos olvido modificar estos atributos en la carga de datos :(
alter table Planta modify column Fecha_Salida date;
alter table Planta modify column Hora_Salida time;

create view Planta_Pendiente as
select*from planta
where estatus='Pendiente';

-- Ejercicio 3
select*from Planta_Terminada;

create view Planta_Terminada as
select*from planta
where estatus='Terminada';

-- Ejercicio 4
select*from Notas;
Select*from Planta_Terminada;
select*from Planta_Pendiente;

update Notas n
set n.Estatus = ''
where n.Folio_Nota
in (select Folio_Nota from Planta_Terminada);

update Notas n
set n.Estatus = 'En Planta'
where n.Folio_Nota 
in (select Folio_Nota from Planta_Pendiente);

-- Ejercicio 5
select*from Lavado_Pendiete;

create view Lavado_Pendiente as
select*from Lavado
where estatus='Pendiente';

-- Ejercicio 6
select*from Lavado_Terminada;

create view Lavado_Terminada as
select*from Lavado
where estatus='Terminada';

-- Ejercicio 7
select*from Notas;
Select*from Lavado_Terminada;
select*from Lavado_Pendiente;

update Notas n
set n.Estatus= ''
where n.Folio_Nota
in (select Folio_Nota from Lavado_Terminada);

update Notas n 
set n.Estatus='En Lavado'
where n.Folio_Nota
in (select Folio_Nota from Lavado_Pendiente);

-- Ejercicio 8
select*from Planchado;
select*from Planchado_Pendiente;

create view Planchado_Pendiente as
select*from Planchado
where Estatus='Pendiente';

-- Ejercicio 9
select*from Planchado;
select*from Planchado_Terminado;

create view Planchado_Terminado as
select*from Planchado
where Estatus='Terminada';

-- Ejercicio 10
select*from Notas;
select*from Planchado_Terminaodo;
select*from Planchado_Pendiente;

update Notas n 
set n.Estatus= ''
where n.Folio_Nota
in (select Folio_Nota from Planchado_Terminado);

update Notas n
set n.Estatus = 'En Planchado'
where n.Folio_Nota
in (select Folio_Nota from Planchado_Pendiente);