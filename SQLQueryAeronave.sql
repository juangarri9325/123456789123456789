-----------------------------------------------------------------------------------
---------------------------------------------------------------------------------
---------------- ELIMINAR Y DROPEAR TABLAS Y PROCEDIMIENTOS ----------------------
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--ELIMINAR TABLA rol_funcionalidad--
drop table rol_funcionalidad
go

--------------------------------------------------------------------------------

--ELIMINAR TABLA ROL--
drop table Rol;
go


-------------------------------------------------------------------------------------

--ELIMINAR TABLA FUNCIONALIDAD--
drop table Funcionalidad;
go

-----------------------------------------------------------------------------------

--ELIMINAR TABLA AERONAVE--
drop table Aeronave
go

------------------------------------------------------------------------------------

--ELIMINAR TABLA CIUDAD--
drop table Ciudad
go

----------------------------------------------------------------------------------------
drop proc speliminar_ciudad
go

drop proc spinsertar_ciudad
go

drop proc spbuscarModelo_aeronave
go

drop proc speditar_ciudad
go

drop proc spmostrar_ciudad
go

drop proc spbaja_ciudad
go 

drop proc spMostrar_Funcionalidades
go

--ELIMINAR insertar rol-funcionalidad en tabla rol_funcionalidad--
drop proc spinsertar_rol_funcionalidad
go


--ELIMINAR PROCEDIMIENTO spinsertar_rol--
DROP PROC spinsertar_rol;
go

--ELIMINAR PROCEDIMIENTO INSERTAR--
drop proc spinsertar_aeronave;
go

--ELIMINAR PROCEDIMIENTO MOSTRAR--
drop proc spmostrar_aeronave;
go

--ELIMINAR PROCEDIMIENTO BUSCAR NUMERO--
drop proc spbuscarNombre_aeronave;
go

--ELIMINAR PROCEDIMIENTO BUSCAR FABRICANTE--
drop proc spbuscarFabricante_aeronave;
go

--ELIMINAR PROCEDIMIENTO speditar_aeronave --
DROP PROC speditar_aeronave
go

--ELIMINAR PROCEDIMIENTO speliminar_aeronave--
DROP PROC speliminar_aeronave
go

--ELIMINAR PROCEDIMIENTO spdardebaja_aerolinea--
DROP PROC spdardebaja_aerolinea
go

----------------------------------------------
----------------------------------------------
---------------- TABLAS ----------------------
----------------------------------------------
----------------------------------------------

--CREAR TABLA AERONAVE--
CREATE TABLE dbo.Aeronave
   (CodigoAeronave int PRIMARY KEY NOT NULL identity ,
    FechaAlta datetime NOT NULL,
    NumeroAeronave int NOT NULL,
    Modelo varchar(50) NOT NULL,
	Matricula varchar(50) NOT NULL,
	Fabricante varchar(50) NOT NULL,
	TipoDeServicio varchar(50) NOT NULL,
	BajaPorFueraDeServicio varchar(50) NOT NULL,
	BajaPorVidaUtil varchar(50) NOT NULL,
	FechaDeFueraDeServicio datetime  NOT NULL,
	FechaDeReinicioDeServicio datetime  NOT NULL,
	FechaDeBajaDefinitiva datetime  NOT NULL,
	CantidadButacas int NOT NULL,
	KgDisponible int NOT NULL,
	)
go

-------------------------------------------------

--CREAR TABLA Ciudad--
CREATE TABLE dbo.Ciudad
   (CodigoCiudad int PRIMARY KEY NOT NULL identity ,
    Nombre varchar(50) NOT NULL,
	Pais varchar(50) NOT NULL, 
	BajaPorVidaUtil varchar(50) NOT NULL,
	)
go


--------------------------------------------------

--PROCEDIMIENTO CREAR TABLA Funcionalidad--
create table Funcionalidad
(id_funcionalidad int PRIMARY KEY not null identity,
nombre varchar(100)
)
go

---------------------------------------------------

--PROCEDIMIENTO CREAR TABLA ROL --
CREATE TABLE Rol
(id_rol int PRIMARY KEY not null identity,
nombre varchar(100),
habilitado binary
)
go

------------------------------------------------------

--CREAR TABLA rol_funcionalidad--
CREATE TABLE dbo.rol_funcionalidad
(id_rol int foreign key references Rol(id_rol),	
id_funcionalidad int foreign key references Funcionalidad(id_funcionalidad)
)
go

-------------------------------------------------------

-------------------------------------------------------
-------------------------------------------------------
---------------- PROCEDIMIENTOS  ----------------------
-------------------------------------------------------
-------------------------------------------------------

--PROCEDIMIENTO INSERTAR AERONAVE EN TABLA AERONAVE--
create proc spinsertar_aeronave
(@codigo int output, 
@fechaAlta  datetime ,
@numeroAeronave int, 
@modelo varchar(50),
@matricula varchar(50), 
@fabricante varchar(50),
@tipoDeServicio varchar(50), 
@bajaPorFueraDeServicio varchar(50),
@FechaDeFueraDeServicio datetime ,
@FechaDeReinicioDeServicio datetime ,
@CantidadButacas int, 
@kgDisponible int)
as
insert into Aeronave(FechaAlta,NumeroAeronave,Modelo,Matricula,Fabricante,TipoDeServicio,BajaPorFueraDeServicio,BajaPorVidaUtil,FechaDeFueraDeServicio,FechaDeReinicioDeServicio,FechaDeBajaDefinitiva,CantidadButacas,KgDisponible)
values(@fechaAlta,@numeroAeronave,@modelo,@matricula, @fabricante,@tipoDeServicio, @bajaPorFueraDeServicio,'Habilitado',@FechaDeFueraDeServicio,@FechaDeReinicioDeServicio,'2050-01-01' ,@CantidadButacas, @kgDisponible)
go

------------------------------------------------------------

--PROCEDIMIENTO BUSCAR NUMERO--
create proc spbuscarNombre_aeronave
@textoBuscar varchar(50)
as
select * from Aeronave
where NumeroAeronave like @textoBuscar + '%'
go

--------------------------------------------------------------

--PROCEDIMIENTO BUSCAR FABRICANTE--
create proc spbuscarFabricante_aeronave
@textoBuscar varchar(50)
as
select * from Aeronave
where Fabricante like @textoBuscar + '%'
go

---------------------------------------------------------------

--PROCEDIMIENTO BUSCAR MODELO--
create proc spbuscarModelo_aeronave
@textoBuscar varchar(50)
as
select * from Aeronave
where Modelo like @textoBuscar + '%'
go

-----------------------------------------------------------------

--PROCEDIMIENTO EDITAR AERONAVE--
create proc speditar_aeronave
(@codigo int, 
@fechaAlta  datetime ,
@numeroAeronave int, 
@modelo varchar(50),
@matricula varchar(50), 
@fabricante varchar(50),
@tipoDeServicio varchar(50), 
@bajaPorFueraDeServicio varchar(50),
@BajaPorVidaUtil varchar(50),
@FechaDeFueraDeServicio datetime ,
@FechaDeReinicioDeServicio datetime ,
@FechaBajaDefinitiva datetime ,
@CantidadButacas int, 
@kgDisponible int)
as
update Aeronave set FechaAlta = @fechaAlta,
NumeroAeronave = @numeroAeronave,
Modelo = @modelo,
Matricula = @matricula,
Fabricante = @fabricante,
TipoDeServicio = @tipoDeServicio,
BajaPorFueraDeServicio = @bajaPorFueraDeServicio,
BajaPorVidaUtil = @BajaPorVidaUtil,
FechaDeFueraDeServicio = @FechaDeFueraDeServicio,
FechaDeReinicioDeServicio = @FechaDeReinicioDeServicio,
FechaDeBajaDefinitiva = @FechaBajaDefinitiva,
CantidadButacas = @CantidadButacas,
KgDisponible = @kgDisponible
where CodigoAeronave = @codigo
go

----------------------------------------------------------

--PROCEDIMIENTO MOSTRAR TABLA AERONAVE--
create proc spmostrar_aeronave
as
select * from Aeronave
order by CodigoAeronave
go

------------------------------------------------------------

--PROCEDIMIENTO ELIMINAR AERONAVE--
create proc speliminar_aeronave
@codigoAeronave int 
as
delete from Aeronave
where CodigoAeronave = @codigoAeronave
go

------------------------------------------------------------

--PROCEDIMIENTO spdardebaja_aerolinea --
create proc spdardebaja_aerolinea
@CodigoAeronave int
as
update Aeronave Set BajaPorVidaUtil = 'Deshabilitado',FechaDeBajaDefinitiva = getdate()
where @CodigoAeronave = CodigoAeronave
go

-------------------------------------------------------------

--PROCEDIMIENTO INSERTAR ciudad EN TABLA Ciudad--
create proc spinsertar_ciudad
 (  @codigo int output,
@nombre varchar(50),
@pais varchar(50),
@BajaPorVidaUtil varchar(50)
)
as
insert into Ciudad(Nombre,Pais,BajaPorVidaUtil)
values(@nombre, @pais,@BajaPorVidaUtil)
go

----------------------------------------------------------------

--PROCEDIMIENTO EDITAR Ciudad--
create proc speditar_ciudad
( @codigo int output,
@nombre varchar(50),
@pais varchar(50))
as
update Ciudad set Nombre = @nombre,
Pais = @pais 
where CodigoCiudad = @codigo
go

-----------------------------------------------------------------------


--PROCEDIMIENTO MOSTRAR TABLA Ciudad--
create proc spmostrar_ciudad
as
select * from Ciudad
order by CodigoCiudad
go

--------------------------------------------------------------------------

--PROCEDIMIENTO ELIMINAR CIUDAD--
create proc speliminar_ciudad
@codigoCiudad int 
as
delete from Ciudad
where CodigoCiudad = @codigoCiudad
go

--------------------------------------------------------------------------

--PROCEDIMIENTO BUSCAR CIUDAD--
create proc spbuscar_ciudad
@textoBuscar varchar(50)
as
select * from Ciudad
where nombre like @textoBuscar + '%'
go
--------------------------------------------------------------------------

--PROCEDIMIENTO spdardebaja_ciudad --
create proc spbaja_ciudad
@CodigoCiudad int
as
update Ciudad Set BajaPorVidaUtil = 'Deshabilitado'
where @CodigoCiudad = CodigoCiudad
go
----------------------------------------------------------------------------

--PROCEDIMIENTO MOSTRAR TABLA FUNCIONALIDAD --> spMostrar_Funcionalidades --
CREATE PROC spMostrar_Funcionalidades
as
select * from Funcionalidad
order by id_funcionalidad
go

----------------------------------------------------------------------------------

--PROCEDIMIENTO INSERTAR ROL --> spinsertar_rol --
CREATE PROC spinsertar_rol
 (@id_rol int output,
@nombre varchar(100),
@habilitado binary
)
as

begin

insert into Rol(nombre,habilitado)
values(@nombre,@habilitado)

declare @id_aux int
select @id_aux = id_rol from Rol where @nombre = nombre 

return(@id_aux)

end
go

----------------------------------------------------------------------------------------

--Crear insertar rol-funcionalidad en tabla rol_funcionalidad--
CREATE PROC spinsertar_rol_funcionalidad
(@id_rol int,
@id_funcionalidad int
)

as

insert into rol_funcionalidad(id_rol,id_funcionalidad)
values(@id_rol,@id_funcionalidad)

go

-------------------------------------------------------------------------------------------