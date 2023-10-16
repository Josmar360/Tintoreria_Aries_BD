-- Josmar Gustavo Palomino Castelan
-- Josmar360
use tintoreria_aries;

/*CREACION DE LA TABLA DE CARGA BRUTA */
CREATE TABLE carga_bruta (
  Folio_Nota varchar (3) null,
  Telefono_Cliente varchar(10) NOT NULL,
  Tipo_Servicio varchar(15) NOT NULL,
  Fecha_Entrega_Estimada date NOT NULL,
  Hora_Entrega_Estimada time NOT NULL,
  Estatus varchar(15) NOT NULL,
  Cargado varchar (15) null
);

select * from carga_bruta;
drop table carga_bruta;

/* ----------- CARGA DE TADOS EN LA TABLA BRUTA ---------------- */
			/*Clave Repetida*/
insert into carga_bruta (folio_Nota, Telefono_Cliente, Tipo_Servicio, Fecha_Entrega_Estimada,Hora_Entrega_Estimada, Estatus)
values (751, 5504711160, 'Teñido', '2022/03/16','19:30:00',''); 

             /*No hay clave */
insert into carga_bruta (Telefono_Cliente, Tipo_Servicio, Fecha_Entrega_Estimada,Hora_Entrega_Estimada, Estatus)
values (5592299421, 'Reparacion', '2021/04/13','19:30:00',''); 
             
             /*Clave Con una letra */
insert into carga_bruta (folio_Nota, Telefono_Cliente, Tipo_Servicio, Fecha_Entrega_Estimada,Hora_Entrega_Estimada, Estatus)
values ('8F3', 5574873193, 'Lavado en seco', '2021/04/13','19:30:00','');

             /*Activa un check de la tabla notas (Labado) */
insert into carga_bruta (folio_Nota, Telefono_Cliente, Tipo_Servicio, Fecha_Entrega_Estimada,Hora_Entrega_Estimada, Estatus)
values (824, 5545303785, 'Labado', '2022/01/22','19:30:00','');

insert into carga_bruta (folio_Nota, Telefono_Cliente, Tipo_Servicio, Fecha_Entrega_Estimada,Hora_Entrega_Estimada, Estatus)
values (825, 5551901738, 'Planchado', '2022/02/23','19:30:00','');

insert into carga_bruta (folio_Nota, Telefono_Cliente, Tipo_Servicio, Fecha_Entrega_Estimada,Hora_Entrega_Estimada, Estatus)
values (826, 5563802500, 'Planchado', '2022/02/23','19:30:00','');

insert into carga_bruta (folio_Nota, Telefono_Cliente, Tipo_Servicio, Fecha_Entrega_Estimada,Hora_Entrega_Estimada, Estatus)
values (827, 5591098389, 'Lavado', '2022/03/16','19:30:00','');

insert into carga_bruta (folio_Nota, Telefono_Cliente, Tipo_Servicio, Fecha_Entrega_Estimada,Hora_Entrega_Estimada, Estatus)
values (828, 5545303785, 'Reparacion', '2021/02/16','19:30:00','');

insert into carga_bruta (folio_Nota, Telefono_Cliente, Tipo_Servicio, Fecha_Entrega_Estimada,Hora_Entrega_Estimada, Estatus)
values (829, 5596842072, 'Teñido', '2021/02/17','19:30:00','');

insert into carga_bruta (folio_Nota, Telefono_Cliente, Tipo_Servicio, Fecha_Entrega_Estimada,Hora_Entrega_Estimada, Estatus)
values (830, 5504711160, 'Teñido', '2022/04/06','19:30:00','');

select * from carga_bruta;

/* ---------------- PROCEDIMIENTO DE CRAGA DE DATOS ------------*/
delimiter //
CREATE PROCEDURE Carga()
BEGIN
DECLARE folio varchar(3);
DECLARE tel varchar(10);
DECLARE ser varchar(15);
DECLARE fecha date;
DECLARE hora time;
DECLARE est varchar(15);
DECLARE auxiliar int; 
DECLARE cursor_insert CURSOR FOR SELECT `Folio_Nota`, `Telefono_Cliente`, `Tipo_Servicio`, `Fecha_Entrega_Estimada`, `Hora_Entrega_Estimada`, `Estatus`
FROM carga_bruta;

/* -------- NO HAY DATOS -------- */
DECLARE CONTINUE HANDLER FOR NOT FOUND SET auxiliar = 0;

/* LA CLAVE YA EXISTE*/
DECLARE CONTINUE HANDLER FOR 1062
	BEGIN 
		UPDATE carga_bruta SET Cargado ='NO,Ya existe' WHERE Folio_Nota = folio;
	END;
/* LA CLAVE ES NULA */
DECLARE CONTINUE HANDLER FOR 1048
	 BEGIN 
		 UPDATE carga_bruta SET Cargado ='NO, Clave Nula' WHERE Folio_Nota is null;
	 END;
/*LA CLAVE CONTIENE UN CARACTER NO VALIDO*/
DECLARE CONTINUE HANDLER FOR 1265
	 BEGIN 
		 UPDATE carga_bruta SET Cargado ='NO, Clv No Val' WHERE Folio_Nota = folio;
	 END;
/*VIOLACION DE UN CHECK */
DECLARE CONTINUE HANDLER FOR 3819
	 BEGIN 
		 UPDATE carga_bruta SET Cargado ='NO, Act Check' WHERE Folio_Nota = folio;
	 END;
    
/* ------ VALOR DEL AUXILIAR PARA LA REPETICIÓN  -------*/
SELECT count(*) INTO auxiliar FROM carga_bruta; 
/*--------- CURSOR --------- */
OPEN cursor_insert;
REPEAT
FETCH cursor_insert INTO folio, tel, ser, fecha, hora, est;

	UPDATE carga_bruta SET Cargado ='SI' WHERE Folio_Nota = folio;
	INSERT INTO notas(`Folio_Nota`, `Telefono_Cliente`, `Tipo_Servicio`, `Fecha_Entrega_Estimada`, `Fecha_Hora_Estimada`, `Estatus`)
    VALUES (folio, tel, ser, fecha, hora, est);
	
SET auxiliar = auxiliar-1;
UNTIL auxiliar = 0 END REPEAT;
CLOSE cursor_insert;
END //
delimiter ; 

/*--------- LLEVAR A CABO EL PROCEDIMIENTO ------*/
Select * from notas;
select * from carga_bruta;
CALL Carga();

/*   ELIMINACIÓN DE REGISTROS QUE SI SE INSERTARON  */
DELETE FROM `tintoreria_aries`.`notas` 
WHERE (`Folio_Nota` = '825');

DELETE FROM `tintoreria_aries`.`notas` 
WHERE (`Folio_Nota` = '826');

DELETE FROM `tintoreria_aries`.`notas` 
WHERE (`Folio_Nota` = '827');

DELETE FROM `tintoreria_aries`.`notas` 
WHERE (`Folio_Nota` = '828');

DELETE FROM `tintoreria_aries`.`notas` 
WHERE (`Folio_Nota` = '829');

DELETE FROM `tintoreria_aries`.`notas` 
WHERE (`Folio_Nota` = '830');

select * from notas;

/*---------- ELIMINAR PROCEDIMIENTO ------ */
DROP procedure Carga;

/*--------- QUITAR MODO SEGURO ----------*/
SET SQL_SAFE_UPDATES = 0; 


 