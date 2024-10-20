create database DDCrudAngular

use DDCrudAngular

create table Empleado(
	IdEmpleado int primary key identity,
	NombreCompleto varchar(50),
	Correo varchar(50),
	Sueldo decimal(10,2),
	FechaContrato date
)

insert into Empleado(NombreCompleto,Correo,Sueldo,FechaContrato)
values
('Percy Bobbio','percybobbio@gmail.com',4500,'2024-10-18')


create procedure sp_listaEmpleados 
as
begin
select 
	IdEmpleado,
	NombreCompleto,
	Correo,
	Sueldo,
	CONVERT(char(10),FechaContrato,103)[FechaContrato]
from Empleado
end

create procedure sp_obtenerEmpleado(
	@IdEmpleado int
) 
as
begin
select 
	IdEmpleado,
	NombreCompleto,
	Correo,
	Sueldo,
	CONVERT(char(10),FechaContrato,103)[FechaContrato]
from Empleado where IdEmpleado=@IdEmpleado
end

create procedure sp_crearEmpleado(
	@NombreCompleto varchar(50),
	@Correo varchar(50),
	@Sueldo decimal(10,2),
	@FechaContrato varchar(10)
)
as 
begin
	set dateformat dmy
	insert into Empleado
	(NombreCompleto,
	Correo,
	Sueldo,
	FechaContrato)
values
(	@NombreCompleto,
	@Correo,
	@Sueldo,
	convert(date,@FechaContrato)
)
end

create procedure sp_editarEmpleado(
	@IdEmpleado int,
	@NombreCompleto varchar(50),
	@Correo varchar(50),
	@Sueldo decimal(10,2),
	@FechaContrato varchar(10)
)
as 
begin
	set dateformat dmy
	update Empleado
	set
	NombreCompleto = @NombreCompleto,
	Correo = @Correo,
	Sueldo = @Sueldo,
	FechaContrato = CONVERT(date,@FechaContrato)
	where IdEmpleado = @IdEmpleado
end

create procedure sp_eliminarEmpleado(
	@IdEmpleado int
)
as 
begin
	delete from Empleado
	where IdEmpleado = @IdEmpleado
end
