--mas optimo que cross join pero llegamos al mismo resultado
--la consulta relaciona a los empleados con la tabla de fechas considerando que estos no tienen relaciòn en si.
select 
		c.codigo,
		c.nombre_empleado,
		c.f_ingreso,
		c.f_desvinculacion,
		f.fecha_calendario,
    DATENAME(WEEKDAY, f.fecha_calendario) AS dia_semana
from rel_date_employee c
	join fechas f on
	f.fecha_calendario >= c.f_ingreso and
	f.fecha_calendario <= c.f_desvinculacion
	--order by f.fecha_calendario desc aplicado despues del union en el select final
union all
select 
		c.codigo,
		c.nombre_empleado,
		c.f_ingreso,
		c.f_desvinculacion,
		f.fecha_calendario,
		    DATENAME(WEEKDAY, f.fecha_calendario) AS dia_semana
from rel_date_employee c
	 join fechas f on
	c.f_desvinculacion is null and
	f.fecha_calendario >= c.f_ingreso
	order by f.fecha_calendario desc
