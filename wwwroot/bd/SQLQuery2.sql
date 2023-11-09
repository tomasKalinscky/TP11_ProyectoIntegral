	Alter procedure SP_FiltrosLibros
		@pAutor int, @pGenero int
	AS
	Begin
	Select * from Libro Where (@pAutor IS NULL Or @pAutor = FKAutor)
		And (@pGenero IS NULL Or @pGenero = FKGenero);
	End

	Alter procedure SP_Compra
	@cantidadCompra int,
	@idlibro int
	As
	Begin
	Update Libro
	Set Libro.Stock = Libro.Stock - @cantidadCompra
	Where IDLibro = @idlibro;
	End

	Alter Procedure SP_DetalleCompra
	@pfklibro int,
	@pprecio int,
	@fecha datetime,
	@metodopago int,
	@pusuario int
	AS
	Begin
	Insert into DetalleCompra (FKLibro,Precio,FechaYHora,MetodoDePago,FKUsuario) values (@pfklibro,@pprecio,@fecha,@metodopago,@pusuario);
	End

	/*Exec Sp_DetalleCompra 1,1400,'10-10-2023 10:00:00',2,2*/

	Create Trigger TR_HistorialCompra
	On DetalleCompra After Insert
	AS
	Begin
	set nocount on 
	Declare @pcompra int, @pusuario int, @pfecha datetime, @plibro int;
	select @pcompra = IDCompra from inserted
	select @pusuario = FKUsuario from inserted
	select @pfecha = FechaYHora from inserted
	select @plibro = FKLibro from inserted
	Insert Into Historial (FKCompra,FKUsuario,Fecha,FKLibro) values (@pcompra,@pusuario,@pfecha,@plibro)
	End


