	Alter procedure SP_FiltrosLibros
		@pAutor int, @pGenero int
	AS
	Begin
	Select L.IDLibro,L.Titulo,L.Imagen,Autor.Nombre AS 'NombreAutor',L.Descripcion,Genero.Nombre AS 'Genero' from Libro L
	Inner Join Autor On L.FKAutor = Autor.IDAutor
	Inner Join Genero On Genero.IDGenero = L.FKGenero
	 Where (@pAutor IS NULL Or @pAutor = FKAutor)
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

	Create Procedure SP_DetalleCompra
	@pfklibro int,
	@pprecio int,
	@fecha datetime,
	@metodopago int,
	@pusuario int
	AS
	Begin
	Insert into DetalleCompra (FKLibro,Precio,FechaYHora,FKMetodoDePago,FKUsuario) values (@pfklibro,@pprecio,@fecha,@metodopago,@pusuario);
	End

	Exec Sp_DetalleCompra 12,1400,'10-10-2023 10:00:00',2,2

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

	Alter Procedure SP_DetalleLibro
	@pidlibro int
	As
	Begin
	Select Titulo,G.Nombre as 'Genero',A.Nombre as 'NombreAutor',Descripcion,FechaDePublicacion,Imagen,Precio,Stock From Libro
	Inner Join Genero G On G.IDGenero = Libro.FKGenero
	Inner Join Autor A On A.IDAutor = Libro.FKAutor
	Where Libro.IDLibro = @pidlibro;
	End

	Exec SP_DetalleLibro 15

