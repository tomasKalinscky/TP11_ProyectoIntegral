USE [master]
GO
/****** Object:  Database [BDTP11]    Script Date: 9/11/2023 02:22:43 ******/
CREATE DATABASE [BDTP11]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDTP11', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\BDTP11.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BDTP11_log', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\BDTP11_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BDTP11] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDTP11].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDTP11] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDTP11] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDTP11] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDTP11] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDTP11] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDTP11] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BDTP11] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDTP11] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDTP11] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDTP11] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDTP11] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDTP11] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDTP11] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDTP11] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDTP11] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BDTP11] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDTP11] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDTP11] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDTP11] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDTP11] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDTP11] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDTP11] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDTP11] SET RECOVERY FULL 
GO
ALTER DATABASE [BDTP11] SET  MULTI_USER 
GO
ALTER DATABASE [BDTP11] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDTP11] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDTP11] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDTP11] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BDTP11] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BDTP11] SET QUERY_STORE = OFF
GO
USE [BDTP11]
GO
/****** Object:  Table [dbo].[Autor]    Script Date: 9/11/2023 02:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autor](
	[IDAutor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Biografia] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Autor] PRIMARY KEY CLUSTERED 
(
	[IDAutor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleCompra]    Script Date: 9/11/2023 02:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleCompra](
	[IDCompra] [int] IDENTITY(1,1) NOT NULL,
	[FKUsuario] [int] NOT NULL,
	[FKLibro] [int] NOT NULL,
	[Precio] [float] NOT NULL,
	[MetodoDePago] [int] NOT NULL,
	[FechaYHora] [datetime] NOT NULL,
 CONSTRAINT [PK_DetalleCompra] PRIMARY KEY CLUSTERED 
(
	[IDCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genero]    Script Date: 9/11/2023 02:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genero](
	[IDGenero] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Genero] PRIMARY KEY CLUSTERED 
(
	[IDGenero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Historial]    Script Date: 9/11/2023 02:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historial](
	[IDHistorial] [int] IDENTITY(1,1) NOT NULL,
	[FKCompra] [int] NOT NULL,
	[FKUsuario] [varchar](50) NOT NULL,
	[Fecha] [date] NOT NULL,
	[FKLibro] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Historial] PRIMARY KEY CLUSTERED 
(
	[IDHistorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libro]    Script Date: 9/11/2023 02:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libro](
	[IDLibro] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](50) NOT NULL,
	[FKGenero] [int] NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
	[FechaDePublicacion] [date] NOT NULL,
	[FKAutor] [int] NOT NULL,
	[Stock] [int] NOT NULL,
	[Imagen] [varchar](max) NOT NULL,
	[Precio] [int] NOT NULL,
 CONSTRAINT [PK_Libros] PRIMARY KEY CLUSTERED 
(
	[IDLibro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MetodoPago]    Script Date: 9/11/2023 02:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MetodoPago](
	[IDCompra] [int] IDENTITY(1,1) NOT NULL,
	[MetodoDePago] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Compra] PRIMARY KEY CLUSTERED 
(
	[IDCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 9/11/2023 02:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IDUsuario] [int] IDENTITY(1,1) NOT NULL,
	[NombreUsuario] [varchar](50) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
	[Gmail] [varchar](100) NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuario_1] PRIMARY KEY CLUSTERED 
(
	[IDUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Autor] ON 

INSERT [dbo].[Autor] ([IDAutor], [Nombre], [Biografia]) VALUES (1, N'Gallardo', N'River es eterno')
INSERT [dbo].[Autor] ([IDAutor], [Nombre], [Biografia]) VALUES (2, N'nose1', N'nose')
INSERT [dbo].[Autor] ([IDAutor], [Nombre], [Biografia]) VALUES (3, N'nose2', N'nose')
SET IDENTITY_INSERT [dbo].[Autor] OFF
GO
SET IDENTITY_INSERT [dbo].[DetalleCompra] ON 

INSERT [dbo].[DetalleCompra] ([IDCompra], [FKUsuario], [FKLibro], [Precio], [MetodoDePago], [FechaYHora]) VALUES (22, 2, 1, 1400, 2, CAST(N'2023-10-10T10:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[DetalleCompra] OFF
GO
SET IDENTITY_INSERT [dbo].[Genero] ON 

INSERT [dbo].[Genero] ([IDGenero], [Nombre]) VALUES (1, N'Accion')
INSERT [dbo].[Genero] ([IDGenero], [Nombre]) VALUES (2, N'Metaverso')
SET IDENTITY_INSERT [dbo].[Genero] OFF
GO
SET IDENTITY_INSERT [dbo].[Historial] ON 

INSERT [dbo].[Historial] ([IDHistorial], [FKCompra], [FKUsuario], [Fecha], [FKLibro]) VALUES (1, 22, N'2', CAST(N'2023-10-10' AS Date), N'1')
SET IDENTITY_INSERT [dbo].[Historial] OFF
GO
SET IDENTITY_INSERT [dbo].[Libro] ON 

INSERT [dbo].[Libro] ([IDLibro], [Titulo], [FKGenero], [Descripcion], [FechaDePublicacion], [FKAutor], [Stock], [Imagen], [Precio]) VALUES (1, N'Nose', 1, N'yqs', CAST(N'2023-10-10' AS Date), 1, 10, N'lkwneolfnwfen', 1400)
SET IDENTITY_INSERT [dbo].[Libro] OFF
GO
SET IDENTITY_INSERT [dbo].[MetodoPago] ON 

INSERT [dbo].[MetodoPago] ([IDCompra], [MetodoDePago]) VALUES (1, N'Tarjeta de Credito')
INSERT [dbo].[MetodoPago] ([IDCompra], [MetodoDePago]) VALUES (2, N'Tarjeta de Debito')
SET IDENTITY_INSERT [dbo].[MetodoPago] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IDUsuario], [NombreUsuario], [Contraseña], [Gmail], [Telefono]) VALUES (2, N'Matias', N'queseyo', N'qsy@gmail.com', N'1162946414')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[DetalleCompra]  WITH CHECK ADD  CONSTRAINT [FK_DetalleCompra_Libro] FOREIGN KEY([FKLibro])
REFERENCES [dbo].[Libro] ([IDLibro])
GO
ALTER TABLE [dbo].[DetalleCompra] CHECK CONSTRAINT [FK_DetalleCompra_Libro]
GO
ALTER TABLE [dbo].[DetalleCompra]  WITH CHECK ADD  CONSTRAINT [FK_DetalleCompra_MetodoPago] FOREIGN KEY([MetodoDePago])
REFERENCES [dbo].[MetodoPago] ([IDCompra])
GO
ALTER TABLE [dbo].[DetalleCompra] CHECK CONSTRAINT [FK_DetalleCompra_MetodoPago]
GO
ALTER TABLE [dbo].[DetalleCompra]  WITH CHECK ADD  CONSTRAINT [FK_DetalleCompra_Usuario] FOREIGN KEY([FKUsuario])
REFERENCES [dbo].[Usuario] ([IDUsuario])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DetalleCompra] CHECK CONSTRAINT [FK_DetalleCompra_Usuario]
GO
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK_Libro_Genero] FOREIGN KEY([FKGenero])
REFERENCES [dbo].[Genero] ([IDGenero])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK_Libro_Genero]
GO
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK_Libros_Autor] FOREIGN KEY([FKAutor])
REFERENCES [dbo].[Autor] ([IDAutor])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK_Libros_Autor]
GO
/****** Object:  StoredProcedure [dbo].[SP_Compra]    Script Date: 9/11/2023 02:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	Create procedure [dbo].[SP_Compra]
	@cantidadCompra int,
	@idlibro int
	As
	Begin
	Update Libro
	Set Libro.Stock = Libro.Stock - @cantidadCompra
	Where IDLibro = @idlibro;
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_DetalleCompra]    Script Date: 9/11/2023 02:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE Procedure [dbo].[SP_DetalleCompra]
	@pfklibro int,
	@pprecio int,
	@fecha datetime,
	@metodopago int,
	@pusuario int
	AS
	Begin
	Insert into DetalleCompra (FKLibro,Precio,FechaYHora,MetodoDePago,FKUsuario) values (@pfklibro,@pprecio,@fecha,@metodopago,@pusuario);
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_FiltrosLibros]    Script Date: 9/11/2023 02:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE procedure [dbo].[SP_FiltrosLibros]
		@pAutor int, @genero int
	AS
	Begin
	Select * from Libro Where (@pAutor IS NULL Or @pAutor = FKAutor)
		And (@genero IS NULL Or @genero = FKGenero);

	End
GO
/****** Object:  Trigger [dbo].[TR_HistorialCompra]    Script Date: 9/11/2023 02:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	Create Trigger [dbo].[TR_HistorialCompra]
	On [dbo].[DetalleCompra] After Insert
	AS
	Begin
	Declare @pcompra int, @pusuario int, @pfecha datetime, @plibro int;
	select @pcompra = IDCompra from inserted
	select @pusuario = FKUsuario from inserted
	select @pfecha = FechaYHora from inserted
	select @plibro = FKLibro from inserted
	Insert Into Historial (FKCompra,FKUsuario,Fecha,FKLibro) values (@pcompra,@pusuario,@pfecha,@plibro)
	End
GO
ALTER TABLE [dbo].[DetalleCompra] ENABLE TRIGGER [TR_HistorialCompra]
GO
USE [master]
GO
ALTER DATABASE [BDTP11] SET  READ_WRITE 
GO
