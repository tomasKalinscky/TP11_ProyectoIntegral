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

	Create Trigger TR_HistorialCompra
	On Libro After Update
	AS
	Begin
	set nocount on 
	declare @idalumno int
	Insert Into Historial (FKUsuario,FKAutor,Fecha,FKLibro) values ()
	End


