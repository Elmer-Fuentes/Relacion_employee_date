--como diferencia y referencia el cross relaciona el primer registro tabla A con todos los registro de la B y sucesivamente
--consideraciòn màs optimo el inner join ya que filtra en la uniòn a diferencia de este que une y despues filtra.
-- no recomiendo el select * pero unicamente fue utilizado para comparar con el inner

select p.codigo,
           p.nombre_empleado,
           p.f_ingreso,
           p.f_desvinculacion,
           f.fecha_calendario,
		   DATENAME(WEEKDAY,f.fecha_calendario) AS DIA_SEMANA
from rel_date_employee p
    cross join fechas f
    where f.fecha_calendario >= p.f_ingreso and
          f.fecha_calendario <= p.f_desvinculacion
    -- El ORDER BY lo aplicamos despues de la uniòn al unir reconoce el nombre de las compos antes de union y los filtros los aplica a la ultimo select
UNION ALL
select p.codigo,
	   p.nombre_empleado,
	   p.f_ingreso,
	   p.f_desvinculacion,
	   f.fecha_calendario,
	   DATENAME(WEEKDAY,f.fecha_calendario) AS DIA_SEMANA
    from rel_date_employee p
    cross join fechas f
    where f.fecha_calendario >= p.f_ingreso and
          p.f_desvinculacion is null
ORDER BY fecha_calendario DESC; -- El ORDER BY aplicado al resultado combinado 