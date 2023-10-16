-- Josmar Gustavo Palomino Castelan
-- Josmar360
/*----------------FUNCION PARA SACAR EL 5% DE DESCUENTO SEGUN LA NOTA---------------------*/
DELIMITER |
CREATE FUNCTION descuentos_5(folio int)
RETURNS float
deterministic
BEGIN
DECLARE descuento float;
select Precio_Total into descuento
from prendas where Folio_Nota like concat('%',folio,'%');
set descuento = descuento* 0.05;
RETURN descuento;
END; |
DELIMITER ;


/*Valor devuelto por funcion */
select descuentos_5(753) as Desc_5Porc;

/*Ejemplo de como se puede aplicar*/
/*Segun nota 753*/
select Folio_Nota, Precio_Total, descuentos_5(753) as Descuento, round((Precio_Total-descuentos_5(753))) as Total_Pagar
from Prendas
where (Folio_Nota = 753);




