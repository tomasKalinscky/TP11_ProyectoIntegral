USE [master]
GO
/****** Object:  Database [BDTP11]    Script Date: 21/11/2023 09:04:48 ******/
CREATE DATABASE [BDTP11]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDTP11', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BDTP11.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BDTP11_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BDTP11_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
EXEC sys.sp_db_vardecimal_storage_format N'BDTP11', N'ON'
GO
ALTER DATABASE [BDTP11] SET QUERY_STORE = OFF
GO
USE [BDTP11]
GO
/****** Object:  User [alumno]    Script Date: 21/11/2023 09:04:48 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Autor]    Script Date: 21/11/2023 09:04:48 ******/
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
/****** Object:  Table [dbo].[DetalleCompra]    Script Date: 21/11/2023 09:04:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleCompra](
	[IDCompra] [int] IDENTITY(1,1) NOT NULL,
	[FKUsuario] [int] NOT NULL,
	[FKLibro] [int] NOT NULL,
	[Precio] [float] NOT NULL,
	[FKMetodoDePago] [int] NOT NULL,
	[FechaYHora] [datetime] NOT NULL,
 CONSTRAINT [PK_DetalleCompra] PRIMARY KEY CLUSTERED 
(
	[IDCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genero]    Script Date: 21/11/2023 09:04:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genero](
	[IDGenero] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Genero] PRIMARY KEY CLUSTERED 
(
	[IDGenero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Historial]    Script Date: 21/11/2023 09:04:48 ******/
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
/****** Object:  Table [dbo].[Libro]    Script Date: 21/11/2023 09:04:48 ******/
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
	[Precio] [float] NOT NULL,
 CONSTRAINT [PK_Libros] PRIMARY KEY CLUSTERED 
(
	[IDLibro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MetodoPago]    Script Date: 21/11/2023 09:04:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MetodoPago](
	[IDMetodoPago] [int] IDENTITY(1,1) NOT NULL,
	[MetodoPago] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Compra] PRIMARY KEY CLUSTERED 
(
	[IDMetodoPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 21/11/2023 09:04:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IDUsuario] [int] IDENTITY(1,1) NOT NULL,
	[NombreUsuario] [varchar](50) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
	[Gmail] [varchar](100) NULL,
	[Telefono] [varchar](50) NULL,
 CONSTRAINT [PK_Usuario_1] PRIMARY KEY CLUSTERED 
(
	[IDUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Autor] ON 

INSERT [dbo].[Autor] ([IDAutor], [Nombre], [Biografia]) VALUES (4, N'Gabriel García Márquez', N'Gabriel García Márquez fue un reconocido escritor y novelista colombiano. Es conocido por su obra maestra "Cien años de soledad" y su estilo único de realismo mágico.')
INSERT [dbo].[Autor] ([IDAutor], [Nombre], [Biografia]) VALUES (5, N'J.K. Rowling', N'J.K. Rowling es una famosa autora británica conocida por la serie de libros de Harry Potter. Su imaginación y creatividad la convirtieron en una de las autoras más exitosas de la historia.')
INSERT [dbo].[Autor] ([IDAutor], [Nombre], [Biografia]) VALUES (6, N'Ernest Hemingway', N'Ernest Hemingway fue un influyente escritor y periodista estadounidense. Sus novelas, como "El viejo y el mar" y "Adiós a las armas", reflejan su estilo directo y conciso.')
INSERT [dbo].[Autor] ([IDAutor], [Nombre], [Biografia]) VALUES (7, N'Jane Austen', N'Jane Austen fue una destacada escritora británica conocida por sus novelas románticas y satíricas del siglo XIX. Obras como "Orgullo y prejuicio" y "Sentido y sensibilidad" son clásicos literarios.')
INSERT [dbo].[Autor] ([IDAutor], [Nombre], [Biografia]) VALUES (8, N'Pablo Neruda', N'Pablo Neruda fue un renombrado poeta chileno y ganador del Premio Nobel de Literatura. Sus poemas, como los recopilados en "Veinte poemas de amor y una canción desesperada", son reconocidos por su pasión y sensibilidad.')
INSERT [dbo].[Autor] ([IDAutor], [Nombre], [Biografia]) VALUES (9, N'Virginia Woolf', N'Virginia Woolf fue una destacada escritora británica y una figura importante en el modernismo literario. Sus obras, como "La señora Dalloway" y "Al faro", exploran la psicología y la condición femenina.')
INSERT [dbo].[Autor] ([IDAutor], [Nombre], [Biografia]) VALUES (10, N'Fyodor Dostoyevsky', N'Fyodor Dostoyevsky fue un influyente escritor ruso y autor de novelas clásicas como "Crimen y castigo" y "Los hermanos Karamazov". Sus obras exploran temas como la moralidad y la psicología humana.')
INSERT [dbo].[Autor] ([IDAutor], [Nombre], [Biografia]) VALUES (11, N'Harper Lee', N'Harper Lee fue una reconocida escritora estadounidense conocida por su novela "Matar a un ruiseñor". Su obra captura temas de injusticia racial y la lucha por la igualdad en el sur de Estados Unidos.')
INSERT [dbo].[Autor] ([IDAutor], [Nombre], [Biografia]) VALUES (12, N'Miguel de Cervantes', N'Miguel de Cervantes fue un destacado escritor español del siglo XVI y autor de la famosa novela "Don Quijote de la Mancha". Es considerado uno de los mayores exponentes de la literatura en español.')
INSERT [dbo].[Autor] ([IDAutor], [Nombre], [Biografia]) VALUES (13, N'Agatha Christie', N'Agatha Christie fue una prolífica escritora británica conocida por sus novelas de misterio. Sus personajes icónicos, como Hercule Poirot y Miss Marple, han cautivado a los lectores en todo el mundo.')
SET IDENTITY_INSERT [dbo].[Autor] OFF
GO
SET IDENTITY_INSERT [dbo].[DetalleCompra] ON 

INSERT [dbo].[DetalleCompra] ([IDCompra], [FKUsuario], [FKLibro], [Precio], [FKMetodoDePago], [FechaYHora]) VALUES (23, 3, 14, 18.99, 3, CAST(N'2022-10-10T00:00:00.000' AS DateTime))
INSERT [dbo].[DetalleCompra] ([IDCompra], [FKUsuario], [FKLibro], [Precio], [FKMetodoDePago], [FechaYHora]) VALUES (24, 5, 20, 17.99, 1, CAST(N'2022-10-11T09:15:39.000' AS DateTime))
INSERT [dbo].[DetalleCompra] ([IDCompra], [FKUsuario], [FKLibro], [Precio], [FKMetodoDePago], [FechaYHora]) VALUES (26, 4, 17, 21.99, 2, CAST(N'2022-11-01T23:14:14.000' AS DateTime))
INSERT [dbo].[DetalleCompra] ([IDCompra], [FKUsuario], [FKLibro], [Precio], [FKMetodoDePago], [FechaYHora]) VALUES (27, 6, 19, 23.99, 4, CAST(N'2021-10-01T20:15:39.000' AS DateTime))
INSERT [dbo].[DetalleCompra] ([IDCompra], [FKUsuario], [FKLibro], [Precio], [FKMetodoDePago], [FechaYHora]) VALUES (28, 3, 15, 27.56, 1, CAST(N'2022-09-09T15:11:15.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[DetalleCompra] OFF
GO
SET IDENTITY_INSERT [dbo].[Genero] ON 

INSERT [dbo].[Genero] ([IDGenero], [Nombre]) VALUES (1, N'Drama')
INSERT [dbo].[Genero] ([IDGenero], [Nombre]) VALUES (2, N'Romance')
INSERT [dbo].[Genero] ([IDGenero], [Nombre]) VALUES (3, N'Ciencia ficción')
INSERT [dbo].[Genero] ([IDGenero], [Nombre]) VALUES (4, N'Fantasía')
INSERT [dbo].[Genero] ([IDGenero], [Nombre]) VALUES (5, N'Suspenso')
INSERT [dbo].[Genero] ([IDGenero], [Nombre]) VALUES (6, N'Aventura')
INSERT [dbo].[Genero] ([IDGenero], [Nombre]) VALUES (7, N'Misterio')
INSERT [dbo].[Genero] ([IDGenero], [Nombre]) VALUES (8, N'Comedia')
INSERT [dbo].[Genero] ([IDGenero], [Nombre]) VALUES (9, N'Histórico')
INSERT [dbo].[Genero] ([IDGenero], [Nombre]) VALUES (10, N'Thriller')
INSERT [dbo].[Genero] ([IDGenero], [Nombre]) VALUES (11, N'Colorear')
SET IDENTITY_INSERT [dbo].[Genero] OFF
GO
SET IDENTITY_INSERT [dbo].[Historial] ON 

INSERT [dbo].[Historial] ([IDHistorial], [FKCompra], [FKUsuario], [Fecha], [FKLibro]) VALUES (1, 22, N'2', CAST(N'2023-10-10' AS Date), N'1')
INSERT [dbo].[Historial] ([IDHistorial], [FKCompra], [FKUsuario], [Fecha], [FKLibro]) VALUES (2, 23, N'3', CAST(N'2022-10-10' AS Date), N'14')
INSERT [dbo].[Historial] ([IDHistorial], [FKCompra], [FKUsuario], [Fecha], [FKLibro]) VALUES (3, 24, N'5', CAST(N'2022-10-11' AS Date), N'20')
INSERT [dbo].[Historial] ([IDHistorial], [FKCompra], [FKUsuario], [Fecha], [FKLibro]) VALUES (4, 26, N'4', CAST(N'2022-11-01' AS Date), N'17')
INSERT [dbo].[Historial] ([IDHistorial], [FKCompra], [FKUsuario], [Fecha], [FKLibro]) VALUES (5, 27, N'6', CAST(N'2021-10-01' AS Date), N'19')
INSERT [dbo].[Historial] ([IDHistorial], [FKCompra], [FKUsuario], [Fecha], [FKLibro]) VALUES (6, 28, N'3', CAST(N'2022-09-09' AS Date), N'15')
SET IDENTITY_INSERT [dbo].[Historial] OFF
GO
SET IDENTITY_INSERT [dbo].[Libro] ON 

INSERT [dbo].[Libro] ([IDLibro], [Titulo], [FKGenero], [Descripcion], [FechaDePublicacion], [FKAutor], [Stock], [Imagen], [Precio]) VALUES (12, N'Cien años de soledad', 1, N'Obra maestra del realismo mágico que narra la historia de la familia Buendía.', CAST(N'1967-06-30' AS Date), 4, 10, N'https://images.cdn3.buscalibre.com/fit-in/360x360/61/8d/618d227e8967274cd9589a549adff52d.jpg', 20.99)
INSERT [dbo].[Libro] ([IDLibro], [Titulo], [FKGenero], [Descripcion], [FechaDePublicacion], [FKAutor], [Stock], [Imagen], [Precio]) VALUES (13, N'Harry Potter y la piedra filosofal', 4, N'Primera entrega de la famosa serie de libros de Harry Potter.', CAST(N'1997-06-26' AS Date), 5, 15, N'https://images.cdn3.buscalibre.com/fit-in/360x360/ce/e6/cee6ef96dad70d3f599b953f0e50afc7.jpg', 25.99)
INSERT [dbo].[Libro] ([IDLibro], [Titulo], [FKGenero], [Descripcion], [FechaDePublicacion], [FKAutor], [Stock], [Imagen], [Precio]) VALUES (14, N'El viejo y el mar', 3, N'Novela que relata la lucha de un pescador solitario contra un enorme pez espada.', CAST(N'1952-09-01' AS Date), 6, 8, N'https://images.cdn1.buscalibre.com/fit-in/360x360/5a/f9/5af9470ec7931e5b502356ff9ae0c286.jpg', 18.99)
INSERT [dbo].[Libro] ([IDLibro], [Titulo], [FKGenero], [Descripcion], [FechaDePublicacion], [FKAutor], [Stock], [Imagen], [Precio]) VALUES (15, N'Orgullo y prejuicio', 4, N'Historia de amor y superación personal en la sociedad inglesa del siglo XIX.', CAST(N'1813-01-28' AS Date), 7, 12, N'https://images.cdn1.buscalibre.com/fit-in/360x360/8d/db/8ddb85fa0d426826f9768649a412fc96.jpg', 22.99)
INSERT [dbo].[Libro] ([IDLibro], [Titulo], [FKGenero], [Descripcion], [FechaDePublicacion], [FKAutor], [Stock], [Imagen], [Precio]) VALUES (16, N'Veinte poemas de amor y una canción desesperada', 5, N'Colección de poemas que expresan el amor y la pasión.', CAST(N'1924-08-09' AS Date), 8, 5, N'https://images.cdn3.buscalibre.com/fit-in/360x360/1a/ec/1aec0df8624831575cd5dcb07c188cf2.jpg', 15.99)
INSERT [dbo].[Libro] ([IDLibro], [Titulo], [FKGenero], [Descripcion], [FechaDePublicacion], [FKAutor], [Stock], [Imagen], [Precio]) VALUES (17, N'Mrs. Dalloway', 6, N'Novela que sigue un día en la vida de Clarissa Dalloway en la sociedad londinense.', CAST(N'1925-05-14' AS Date), 9, 10, N'https://images.cdn2.buscalibre.com/fit-in/360x360/17/59/17597e47714b52f4e604278901004f4c.jpg', 21.99)
INSERT [dbo].[Libro] ([IDLibro], [Titulo], [FKGenero], [Descripcion], [FechaDePublicacion], [FKAutor], [Stock], [Imagen], [Precio]) VALUES (18, N'Crimen y castigo', 7, N'Relato que explora los dilemas morales y la culpa de un estudiante que comete un asesinato.', CAST(N'1866-01-01' AS Date), 10, 7, N'https://i1.whakoom.com/large/10/3b/be8ab05a9a0946d5a0012b468a8ba551.jpg', 19.99)
INSERT [dbo].[Libro] ([IDLibro], [Titulo], [FKGenero], [Descripcion], [FechaDePublicacion], [FKAutor], [Stock], [Imagen], [Precio]) VALUES (19, N'Matar a un ruiseñor', 8, N'Historia conmovedora sobre la injusticia racial en el sur de Estados Unidos.', CAST(N'1960-07-11' AS Date), 11, 9, N'https://images.cdn3.buscalibre.com/fit-in/360x360/1b/d7/1bd7b432c94ccdcf816c917d8abe8e83.jpg', 23.99)
INSERT [dbo].[Libro] ([IDLibro], [Titulo], [FKGenero], [Descripcion], [FechaDePublicacion], [FKAutor], [Stock], [Imagen], [Precio]) VALUES (20, N'Don Quijote de la Mancha', 9, N'Obra cumbre de la literatura española que sigue las aventuras de un caballero loco.', CAST(N'1605-01-16' AS Date), 12, 6, N'https://images.cdn3.buscalibre.com/fit-in/360x360/30/08/300822003676ba26360a2148939bb877.jpg', 17.99)
INSERT [dbo].[Libro] ([IDLibro], [Titulo], [FKGenero], [Descripcion], [FechaDePublicacion], [FKAutor], [Stock], [Imagen], [Precio]) VALUES (21, N'Diez negritos', 10, N'Un grupo de personas es invitado a una isla donde son asesinadas una por una.', CAST(N'1939-11-06' AS Date), 13, 4, N'https://images.cdn2.buscalibre.com/fit-in/360x360/c9/e5/c9e5317ebd68eea812b6d6b452674a41.jpg', 20.99)
INSERT [dbo].[Libro] ([IDLibro], [Titulo], [FKGenero], [Descripcion], [FechaDePublicacion], [FKAutor], [Stock], [Imagen], [Precio]) VALUES (23, N'Llamas, libro para colorear', 11, N'Un libro para niños para colorear', CAST(N'2007-06-30' AS Date), 6, 2, N'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMTEhMTExEWFhUXGSAZGBgYGRsWHhoaHxoXGxkXHxsYHCggGBolHh4YIjIjJSosMi4uGiAzODMtNygtLisBCgoKDg0OGxAQGy0mICUtLS0tNTUtLS8tLy0tLS0vLy8tLy0uLS0vLS0tLS0tLy0tLS0tLS0tLS8tLS0tLS0tLf/AABEIAQsAvQMBIgACEQEDEQH/xAAbAAABBQEBAAAAAAAAAAAAAAAAAgQFBgcDAf/EAEgQAAIBAgQDBQQHBAkDAgcAAAECEQADBBIhMQVBUQYTImFxMoGRsRQjM0JScqEHYsHwFRZDgpKistHhJFTxNFNjc5Ojs8LS/8QAGwEAAgMBAQEAAAAAAAAAAAAAAAQCAwUGAQf/xABBEQABAwIDBAYHBQcDBQAAAAABAAIRAyEEEjEFQVFhE3GBkaGxIjJCcsHR4QYUI1LwFTNiorLi8TSCwhYkQ1OS/9oADAMBAAIRAxEAPwDcaKKKEIooooQiiiihCKKKKEIooooQiiiihCKKKKEIooooQiiiihCKKKKEIooooQiiiihCKKKS+xoQgsOtGcdaz7jFwm8+v8xTVR4S7XFRQYlidSQTACgkmATtWKdrPNd1CnRLiCRZ2sb/AFVpN2eDTDy+JAOnHtWl5x1ozjrWaOPCHW4rqSRKltxlJBDKDsRypAJOmtV1ttPovyVKJBG7N/apt2YHCWvt1fVadnHWjOOtZtCZ+7+kWu8zZMsuTmmMshMszpvXIsepqyvtWth46WgWzpLv7V4zZzX+rUns+q07OOtGcdazHN5mlO6oneXLhVZyiFLszASQANNo1JA1FQobafXeKdKiST/F/avX7MDBLn+H1WmZx1ozjrWZswKq6OWRpgwVMqQCCp2Oo67ivHdVXPcurbXMEBctqxBIUBVJJgE7VP8Aatbpug6A5+Ga/wDSo/s9mXP0lvd+srTc460Zx1rNHHhDLcV1JIlSdwASCGAIMEHai2shmLhVWJZiQBJgDQEknoBXh2vVFXoTQOfhmvx/LwXv7Oblz9Jbq+q0vOOtGcdazNiIzLdRxOWULaMADBDAEGCDtXtsCGZnyooBZjJiSAAANSSeXr0r07WrCqKJoHPwzX/pR+zm5c/SW936rS8460Zx1rMRetsCbd0uFIDAqUILBiuhkEHK2oPKvM3nUMRtmph35KtGD739q9ZswPEtf/L8ytPzjrRnHWs4e1l0uXrds/hd4b3qoJHvAoFgsCUuLcjfu3Dkf3R4v0q47RxIZnOGdHX/AGyoDA05jpR3fVaPnHWvRWYZvOrl2Q+wP5z8lrzA7WGKq9Hki0zmnhyHFRxOA6FmfNN+EfEqeooorYWeikvsaVSX2NCFnXFz9c3rUXxpj9Gtgc77T6C0m3vYVJcY+2b1/hUTx0fU4fWJuXW9fDaWP0n3Vz+y2ztaoff810Dv9Kzqb5T8F34WAMJYymQWuEc9IsgfKnnDxN22OrqP8wprhD/0uG0iVdo6Tccf/rTvhA+vtfnU/Ag0jtT0tqOH8TR/SrqNqE+95lQfCQGx1s9cTm9fHmnX/n/aTRtBUT2ZM4m23m7c+Vt2nTfbr/tUmK0/tURnpD3vMKrBCC7qb8UuaYdpQWupZA+yTxSwUZ2Ku0ztBhf7lSuByhsz+xbBuP8AlUTHvML76heGO7G9eLWxdJ9pmAALEl3h99ZUeVwiDrR9mcNGfEH3R5n4eKjjalw3hfvsPCewpz2duTZvWyIKOLgBM6N4H9Ne7NK7RXQuFs5ho15uU7Igny9o0jhzKuNygqFuymk6Z/Cu+8OF18qO0lwrZw3hJl7hIHL7MT+lajsPG1WVR7TD3iB5EKlr5olvMHvBPwSezlw5L1pmJOl1dNspyuP8Lz/do7SYqMmFUkOB3jmJhyPCp/KhHvdqYcJxRw1625U3AcxIMEFWDAg+WtNLxdpzl2z5ibumre02vXWfeKe+5M+9/ed+XKO8/CAoZjGTdM9sfo9asHDRGHtDcm5dJO0wlgTR2guN3KWbZHeOe9I8hK2wR5/WH3inHDLBa1hLY3bvIJ87irJ/w/pTXvBdxVy4gWFH1YJUAhVyW5zaEQATt+uuZh6GfalaufYAA6yB8PNWvfFFrRzPc4+Z8lx4G3jvWJBZ7ZIAI1a2c6kdQcrgH96pfC3cq3Lg3S2XXn4pUKfdmze6om/f7q9ZvgqzrGcrqGKnrzzKQT+Y1M4ewyXntoufKWXLuGtnr5FCNfMVRtmm1uJoYgtkTBGulx1qVE5qb26Wn4H4d6rXCOHfSWbNc8UFti7MZAKqofVuZAPImJp9b7P3Q6d0+ZZANxSR3fVnDQ1qBJk6ab0rF9n5Y/R2Oafsm8NxTroJ8NyJO2v7tK4dxVrjixiDOY5FczmQzAVidWSdCGkjcREVtHEPqN6XDuDhw59eoPIjuS5BBh1vh2HUdvVKc3cR3ly649lnJX0JMfpV17GfYn85+S1R1ESIggkEdCDBHxq79jPsD+c/Ja43ZDi7Guc7Uh094+Kb2kAKEDSR5fJWCiiiurXPopL7GlUl9jQhZvxk/XP6/wAKh+0JHd4QHf6wr6l2HyU1L8a+2f1/hTRLzQFKW3AnLntq5WdSBPInWK5nC4ynhNo1alSYl4t1/RdGKTqmGphusNP8sc+KjMNx66ltLXd2GZF0LIW0LMTz6lqnuzfEjfe4Wt2lFpS+ZEyEMpAy6bggt8BTUYhuSWB6WLX8UpaYu7yZVghtEtW16DNCgMNSIP4vOtJ+2cFVMMpEuP8ACJnzVLsHUDT6QHaY8oVZ4fimsslxQpYSPEMwOZSpnY7E8/jUn/WS7r9Vh9D/AO0D85/npUiDsO5w66wB3CHXQRqpjUgdNR1oF0mQPo8gHMBbwxgDcnwmAOZOgpx+1cO+Hmi9w3HJI13TzUegM3c0H3vojtJeCWYACtiMhKxoFCJccAch3jL/AISKiMDwzNbFxr4QOWCgWyxMBQx0IAGpGp1lhyqZOJYjxC1dWSZuZXUGRmIcEZNSJAIGo01Fc710tlPgCgQotxkAkkgQTOpM67mknbWbhsIehpuaQ4+s30QSZM7tDYKbMO5zwHOB6jcwItPVfXvlQPE7DWbp+sDMMrrcKwTmQOGgzqCeu4ipftlfBOGa3DZ7fexOy3bjP+m3up39IubB7ZyCNRZuG2BMyWBKAa7xFeXb7mGc2XMQHurZcke0AGfVl8UgAkeIRuKabtdpczPRfmA/KdSJPlKrOHMyHtgc+vko7juDCWcE6CQ1rK5nYj6wepIufpXvaLBLZsYawAAqrc7xp/tCyZhPMKZWf3akxibo/ANfCpS3Cm2oAyW2HhKLHsjTnXIX2yFT3bKskm6lt4zGWJa4NAWPM7moN29TLmNLHXndruEcd4UvubgPWbbnyOtrR4i9l6L/AHOEt3FBMWciR+K9evDMD+6gdvcKiOF8NBFy53ndKGUFoZiWMlQAvMBSamRiWCnN3RtwAFYWxagZsoUaKDq2qmd6ReckKMtpFBzhbekkwucgsSRpAO1RO1RSpVXspvDi5xu0xaNeoCCNepetoEuALmxbQ+A7TbrUPxbh4tZLqubmdCASuQ+BiMkEn933EVNnPewQe2pzulsMvtMRaLq2g1MDuCQKLd5xFsFCTqEYWrh1A1COC2oAOg1GtIZ3Zg7XQxTYh0Cpz+6ctvry2qJ2w80mOdReXiD6pi8i2tjJA4r37uJIzti++9r3FuAnkFF4ftFcVctzJcjQd6uYrGujAgxHIkgV7gc2IxHeudFbvLzxAUTryiTBAA1mBUu+JZ9W7m7+862rkQCdX32BPiPI1xvs7BQzoEmVVTbtoTAMgLAcwRrruNdavdtdjQTToPzndli8Te0njHBRbh59ZzQPe8tB5daSLxdnciM7lo6SSY/Wrz2L+wP5z8lqi5Y0iI5VeexP2B/Ofktc9sZ2bFkn8p8wrdqR0FuI+KsNFFFdYueRSX2NKpL7GhCznigU33DGB131jTehzcWyt1QBbLkbkkHQwQPZUkaCT0J116Y6DiHUkgNAgc9V8OgJG3Q8qQvELttMltUCq4ZmC585BDCTqNNNtdN65h5DKlVxMSX3AkzNuzU+z5T0LAXU6YAmzbHSIueO/nHfHHFc+8Uo4UQCu4iFUSQRvOs6DlEUwxCFrVwKpYlRAUEk+NDoBvoDUtxG6Ga5eKvaLDaQ3iiHBnxKCCIkD5Co1LRZA4RihAacpIykSGmNFI1k6VWTUpYplZjS/KZtNwDaYFifd7902uaaRa45Ztc6HeBOvefn0vWyxRwrwMQpMpcSF8bknMo8OiydpA8qjrOFuB7s2n9i+vitlZzWXC5W3dy3hC9DpuY84jiFtWzcyyF1MCdJ1IHOBrFTK8MDE9yy3J9gGFNxYkFWnKxKwwBy6GQTrGrgNoVTRd93oy0WjPe5JPs8Tp2CUrXpsY+Kj7kfltw3FRa4a4ttpt5mFy05XL4biqpi2AAAx1bON/BqJieisCXYWu6VrjOtuMuRCEVdOROUn9diKVkEkRBGhBEEeRB1FegVnY/bT8RRfQdTgmJvcRFogcN+iaoYMMeKmad/X4lIv4V/rTlYku4VSCoVHvsXLEDNkZLbeLYBhEyK43sJda1bAQyveqTlJVlIslMpYQZUhVOhJTkdnOUdK8yDoKZH2mdMmkOIvpqPy8Ce+VWNnACA7w+qTjEcXFYW2K2wkAq4dl3uBVjxsbRRWnUFTGsijGW2ygBc5S6CygZiQodZC/fgmY852BhQQdBXsUpU21mqU39H6k+0bhwgyY1mTIG+Nytbg4a5ubWN3Azx8EgOA1lzhTct2y4awyCcrBQpCAQg8JMcsqifECeeHtOpSUf7EqSlt3Abv2uZPADEDlyrvlHSvCg6CrnbeD6RoupeiZB9M6Gd5Bvc33lRGCIcHB1xG7h2r1Ui7kNkScUt0X8vs280lMxGhBgR1lYmKa4bAXVt3AbbFjZgAIRA7yWVoWe8nKROuU9Bo5yDpR3Y6Crv+pnf+vh7XD/bv+fG1Y2fHteH1+nUvWsnuiFtn7qt9Q+HBkks7QgAXu1ZSwJiQd2ptdwd1raAIZUXVPhJVlItFMjMIOZSFU6ElI3pwLY6CjIOgqDPtDkJIpbybu3xH5RaLQpfcD+bw+valssGNdhEyDEDLIOoaImec1d+xP2B/OfktUUCKvXYn7A/nPyWldk1Okxrn8Q48dSCvNoNy4YN4EeSsNFFFdUufRSbmxpVJfY0IWa8a+2f1/hTdb7Lp5Ea9CZOvr8zXXjrkX30/mKbWrunUVw+LqPp4mo5hj0nf1FdTQYDQZI9keQRflvb1n3bwCfUwNfIVEYDENgHXOGbCz4WBIaz5Svi7vzGq+Y8NSV26Z/n4UtHBBBEjmDRhcdWw9TpAZnUcUYjCsq04IjhyU/iMFYxFvvFYFWE96MukjTvQvhdSNrg5RrHiqu8DxLYG/8AQcQs2XMWTMQZJFsNplbNJtnTWUMSuWNw2NucPc3LQLYYklre5tzqzJJAKndrZgHcFW8VXDiXD7WOwxQpKsma0SCBBEZJYAgbCGAI0keAE9ZQqU8QOmo+tv58nfA7uMSFgVqdSj+HV03cuY5cRp3Ap1xjh/ermBBugSr7C6kx4hyYE5W6Eg8ytVtDImD5+R2IPQgyKsnYzA4s2QuJMFHGVz4muJES4B8N3KShMmdyM2tRnHsA9i8zKpKOeQnxQZ0GuqgNPXNPKUtr4I16YrU2+kIm1yOY1lvh2BM7OxHRvNJxsdOE/I909ajgK9Arx7wIkbb6c65HEi2j3HByoNlMFmJhUkjSesHQHfauYoUH13imwXNgt1zg1pcdF3RCxhQSeg1PwpF9kt/a3bds9GaW/wACy/6VAY3GYy+uxS20eFItqQdF1JzXJ0jMTPKm1rgZj7W0NWUamMyIXYEgQNBv79q6ejsDDME4itJ3hu6BNzc/yhZ7sa4+qAPH6eamrvHsMuxu3PyqEHxds3+Wmj9qV+7hh/fuFv0RU+dIHAERgLtyNTIlU8OoRzmJIWRrodxE60nB2sPltyAzSoMB7mYhvEJEjxrmyjKIyCSd60KWE2Y0TSol/OC7jxPI7uGpNqDiah9o+XlC8/rPdJhbVkE7AIzH/M5qR4RxY3nNq7bVLkEqVBWSolkZSTBgEgiNogyIZNx5UMC1lylCAITxIWLBsojLmMAQdF67RNziLd8t9VCspUgDaUCgeghRpTIwFPENNJ2HaxsWIyzJAg2AI1PdzUW1XgyCe8lXIigiu11wGYDVZlfynVf0Ipteumf5+FfO3Mc1xY7UWW005rhLirx2K+wP5z8lqjWbv/Iq99jXmyfzn5LWtsT/AFR90+YSG1P3HaPip+iiiuuXOopL7GlUl9jQhZfx0L39yWg9IMbCZI2piAke3p6eL0A9nXrTvtGpN9gMu49dqjMHaa5c7kCNpMZjrJCqBqSQrHyCt6FD7vg6tQiZdNxmM68Ae/sXS0vw8Myo6q4DK23ocBp6BPVc85TgqmniHwP+bp7qVas95JtqXEwSokA8wNZ8vFVv4R2asLl720XL6qb0NBiSpSAs6SDExOxGsrxnhSvbGRACukAASh0ZPIEfAgGoV9m0+jPRNvzLzPL1hHI/5SD9pnN6Dnxz6PyDP+Wu4Cyzzg2Mw9m+9zErKpBsjvLOjeLOWU3QCRpEzGp3irMf2gYGdMknrcw4n/7tUJ+zKIxt3Bcygwty3ae9I5B0ty9pwNwygdCareC7DYm7ey3T3NvMQHKnO4B3t2fbYkcmA391AqMofhNqsaZ0i8nl0hJPfaEk55quzvBJ4z8gAB2DxW42+1VsoHNm8LZOXvEyOoJIA1tuTMkDQHevL/aHBKrZ7jqBJGe3dEaaxKydppl2Q7PYdLHcLZy2bbGbbwXuXYBN66RoWIjKo0AjoAliw+HtWnCLZRM05SoGsRIOmh1pymK1pcP/AIIPi+3aCVS4sOjfH6LN8cLXekpcJV5cFlZRJZywGgmNCPWNYqP4zl+iXMrT9ZbnSDtcHw1FWntVg83eXRZKd2+YeGAWUMhaCNVYNLMNMttNZkLWcZZzWcQNPs8wg/gZHP8AlD142lhaWJY82cTIvqd8CY1N44rXwz3VcM6Xn0Yt6MQIOuWbQd+4brBvwlndLWW4FbK1oEKxMZ1WCc+QMTcSPDtzkClC5bjx38wYq5GYWwbbM+YlbZQ95kCyNTLbcxC4EW2Urce5voqajUEZssamYHLcD0fW8MhYC3h2Jlva00yRGVzJgkNPIwNJFOOwEudLokyIaAReYDtezQG/UubFLTiNhSCltWKnNpbE6JbYSWlhFxX0zEBX3MV3OPuxCWGIG73GKOSDKE5WEMCMvMkAjSTXJO91I7pFnaZUGC4MCFGlxfFsCq6jSm2NeA577xHWBl38GvM6wdiCsdDrMYGiSMwnrJPaSIk9vXoI81ScRw53Z7jlE2JVRtJIAA0G4PPqajcTbVWKq4YcmHMRv5VJdmSbmNwgYlvrk3M7MCd/StvxFixmVXtIS2glVPuOnOmH1RRhsblB9XozBusutQbVliwE2rc7z4VCaDnJU17CaeP/AH945RWl3uHYUQpsWtoA7tdBPkNBJP600XguFNx7bYZV0lSCRmGxOh0g1iPwVBzi4t1JPrO39v6N0zS2i0NAc54i1snxafGbc7qgQuvjHnqYH5f+avXYWPo7QSR3h3gck6VDdseD2cPaRrNshmfKdWaFyOTuTGoFS/7PwRhWkR9Yf9KV7SwtCk6Wa6esT4E99lPFP6XCdIHuIkC4aP6W91+9WiiiimliopL7GlUl9jQhZV2h/wDUP7vkKf8A7L7qn6ZoDdW/zAJFs27eWOYUkP7waRxjFRffyI/s2bp94Aiq9xG0TdXE2iovqI8dl3V15owK7TG2oga1mYegKWJfVfUZcm2a4kzeYv4c09XxdSrQZRFCrAi+QlpgRIiZB1B4LUeJY/VU0zAhj+6Ay5SeknTzGboalvpC9azC123sdyLdzDXcM+ZSyrZdk0YMWVraSQYA1UHWnJ7e4dRo9xvSxeP6m3H61ph9Iic47wlDSqAwWnuKu3EeH2rsE20YjQEqCR6EiRSOHYBLKsVVEJ5gASfOBqfWonhGIu4lLd4XClp1zLAGcqfZJDKVUEa7ExG0mJG7gdjfv57f4MpTNqMubK3iETIgBp2jSpFsGQjOcuVdOAMvcq8y105miIDRlKgjcLliZO29PcVhyWV19peswR08tY1oxSl0BQ6ggqQfjHLaRTuvNLqCge0Od7DFCASsgNtJBifSs2wV0KUaJWNQeakQV94JHvrU+N2Ve26MuYMIIGmh315dPfWc4XiByrqJKiYsuATGuywRWftDDGt0ZDw2J1McNOYjjonsJjDhw8NpOqZos0TAvr1za3FVjE4W5hmMKXtnVLkHKwExqNM2pDKdjy2NcbuIvlASrhB4QQhAA/DnieQGp1gb1cbfEI1VivmqXU/0qPOueJu98ly2XJNxCqs6XdGlWQljoFzqJJ2HpWpTx/q9Kac2kh/kC0d1lEVnONqFbtp27TO4awFVcLwy/fAc+zt3lxoGm4BbVo6KDT212fQe3iAfK2hb9bhT5VZL94WnKJoEPdr4HaFSVUAhYI0nQ6kk86Taxsnwgk+Vm4Tz5hJ6frStfHYh5ApVKTesy75TyjW02Ks+8FpIOHrOA3hno+RMcDvF4XPsfwuwuLslRcZgxIZnWBCN91UHzNX/AIhhQpzd4QhbNGp8Ug6ZfFy0HWetRHZrBXe+Fx7cKAdShU6jTRwG68qmOJ95JDa22IHKBqI8wd9dviKKPTweneHGbEcO4frela9dlYgtY5kCCHaz3lcrt5mILKQdInUxJKyo5wRoOc13TEAwV8V1jI0MAaTziMp5n4xTaYIMZiAoyjfYRHl5UvC/V3EZ4BYHwxqogeLmdY25D00tVKiP2h3Dlw4OhJZjHkoB/wBVP+wP/pj/APMPyWo3tnjVL4cjUFHI8DP95IPsmNqluxl0tYaZ9sjUFeS8mANICh/3hq5m+rET6XaIsO06ps4l33boOjdEzmj0ew7/AKKxUUUU+lEUl9jSqS+xoQs94tfi6w89abPO+pB2g/zpXbi4XvXmZmuC3VAA199cBj2j7zUge07zXT4cfgsgbh5Ly5dyjXUnX0pN5cynfKwggbivLmQmTOtLtuqjnFKwBeLq6F2/Z7iriG9hLjsy2cvdEroLZBhC4EEqYAB1iNwNL7YwqCGjXlJJj0k1ROwWJYviLLoYW7nFwEQ2cCEI3zCPSMtXy5eZR4bZbSdCBX0XDOc6gwkySBJ42XL1RFRzQIubLu11QYJg70ogEdRTchLqTCsDtImDHzowKMq5W5aA9RyNWwqrKOxZ7u3czCVBJES3h3Aga6bQPdVN4ZZe4sIjR92JMLPhUkaSFgb8quPaQN3F3KSGynLlEmYMQOtMOxd9O6dV1VYYDyYRpO+1Ze06DMS+lRfYHMZjeALSeIJm14CewlQ02PqASRl8Tr5d6Y4Xs/ffchJ38U/ALNSlrs4B7Vwn8oj3STU2Lsgzt16an9RXO5MDSRppEbHefPoeteUdjYSkQcsniT8oCjVx1WpbTq/RTfC8EsLBCT+Yk/pt+lPxlQQF9yikLfA3IGpGukH371zOItMeTEDppHv0rQp0adP1GgdQA8kq5znesSUjA3btwlmhF1ATdgdNWPI+XnUffnUXDyAndmKwdttNSABGo11qYwpmSG8PJcuWNv599MOJWHzFwMw2gamMp951P61Yopqoy6g5iCcp2HhnkdR091dUYPpcEiJLzoQSwyxEE+Hl6+rdnnxDUuTGmpnMRrziT11j3yuDwIUS2ran0JJPM6nWJ8htQhVbtVdLXlIDAd0NNiJd9dPSpvsjPca/iPyWoTtRdH0p55Kg/wBR/jU52SabBI/GfkK57DmdrVTyPk1alUEYFtv1JU7RRRXQrLRSX2NKpL7GhCzHjjnv3gf77D4e+m9q7p1Hyr3tDH0h5bXprGw3io7wx7XzzfOIrDxezadZxIkGTfI46mb6TyNu1uUDrsKwHD0/db5BPbl0zpHv+Ve28QBv1gg9eQ8z86Y+HTxfof11+Vcb15rdy3ibbDNZYvlI0YZSpA9xP/G9Qdsqi5gZJEb8ju2bR1DUGI3hWVWltMlokxYK0/s6shxexClibl0hrZgBDaJTURIYiCZ5FdNNdEArNcBiLojH4VWa/eXPdwzKU79dzpr3VxBCq5kMMqkmVNW3gnaCzjEPc3CjqB3lpxlu25EjMp2kbNqDuCRW+2mKbRTboAAuPc7O4uO8yp6kswG9crGHVJiddySWPxNKvJmUjqI+PrQvN6juO5u7bLEjXXY9NeQmKpfY7FNnUb94nLSTGaDrA566irrjrUWHVxnGVhETI1jTnpFZpwjFKly24YqBckSNQpYgAzyCnY1XXaCGngeBN+zlIk2utHZ1PpG1WRq3h1/r/Cvt3HlWCscskalp32IywDprP+xI9ximBdLO+Qkfh02GmkmdfdXW1gEFwh+Q30Gg1HoNZowbAI6gTJiAC3KC23lVizU2t4UMGa3oYltDoSuwJ5Bs3U+dL4PhXRAWIIYkyzlonMcu22pEk6+W1OMMj5BoAIjMzRoQJ012g79TTnDoUSDBKtmEdCeXuzUIXF0fMBm3EzBOsQY1XlGgPI1xsG6SBNsKdBAZZIOgOunOpPF3BlnWRqNCNem3Pb31F2cGGXMbsE6gQJjz5mfKhC8wxedAu0gh201HhAyan5+dR+O7Sdxd7t7L5wA2YMrSCSIg5Z1Uj+RU7ad8qkpqpJ1hRz1k7b9KqHb6x9ZYunwhsySJMnRl3jQRcPvqFSctjHZPgEzg6bKlYMfoUwxeP727cuQwDEaNE6Io+6SNwYirj2NabB/OfktZyY18Q+Bgflq/9gY+jNBP2h3/ACpWbh8GGYp1fMZM2ykawdTHCwjTU2k7G0aTaeFhugIVnooorVXPIpL7GlUl9jQhZj2gwrteaAIn37f+ahzZcDLlOvlP6irFxUnvm6TTdjppvWDU250VZ1N7JAJEg3seER4hdXhahFBgt6o8goy3grmUjKNeu/6VGcawrixeUgjMpEjX4fKrIkxrvTEuHxdq0zZQo74DTxlWELr0nMeenvqWB2w/FVxR6MCZ9rTvF/BGIxPR03OIB+qt/ZjCm7bRndkvd2slBkIzBS4yuCQCQNDqIGxrv2m4FYdbBINo2yEXEWyVuWUCmIcbAkKvilddQad8Fwjgrc0ykddYOo5elTtdBUPpLkxoqXhMZxKxa7xxbxlkAmTGGvBQTDGfq3kAHXu4nWnVjt5hNr4vYVhuMTae0BoDBuQbfMfeqx4iwHRkbYiDGnv8jTXC4YKGZn70tuxC7DQCFERv8TUF6m2I4vZu2maxiLTyphkdXA038JrMEwzsXMT4zt5+Pn5MJ85qw8e7M4YgvdwVovlIa6VVjccsuV9pUABhrESFEgCozg1tVtZUAChmgDkMxMeXp50rtDGHB4dtTLMuA1jcTwPBaOyXltckflPmFfeF4m09m25A7xlgypY5wozabwD867WS7L4XW2oP8duUHcVE8Ewve2WAMZW126Az/wAeQp4MbhbQh7touIkA96dAAPCu2gHLrU6NdtSk2roCJv8AqEpWpltVzAN/68E5W1bJMs1wxHhkyOe3Om/FlcwQhCiAAxAGzanxDXYa8iY8uF7tXbGlu07eZi2v/wDX6VGXu02IY+FLdsdYNxviYH6UrU2phKerweq/krGYKu72e+3mrPhbVwoAX01gZcxjkCW/jXl69ZsKoa4loiN2CkgfOapWKxt9x4r9xvINkHwSAa4WrSjZQDzgCs+r9oKY/dsJ6zHlJTTNluPrOHmrTjO1thdAr3PJLRj/ABXCqmq/xzilzFWwgwy2wGDZi0tpI9lVgSCR7R3pupMmduVeXJ5VW/7Q2GWnff6Vuy1/CE7RwNKm4O1IvM/AQoh7DrPh39/yrQOwCkYYyI+sP+lKrJNW/sdPcmfxn5LT2B2sMU/o8kGCTeRaO3f2L3adQuw8HiPip+iiitZc6ikvsaVSX2NCFnfF7pF1wA3u9PSmfet/8T+fOOlSHE3i6wnn/wCPdXBlnr8q5PG7Nc6q94c2S42kWJMgEkgAltxNrRMwDvUcWxlJstMACTB4RIESQDYxOU6wmwut0ufPp1X1+NMcES+PEnwrahy0krmZYKiNZyt/O8vdePl/x571VX45Yt425dvHKqBba3CGKltWdDl3+5vpuKd2Ts7ocW15c208iJFjfc68b4iQJIbTjcSH0CMsEx/idCRYEA2J3wtjt3MqW1twcwhZOmUCZ67fOnNhWCjMZPPoD0Gm3rVX/r9w5LSXXxIAcQGFu4QxG6qQnigztTa7+03Cf2NnF4g7Raw7/O5lArfDs2iyFeKZImU3DIhoIjrEH+GtUrEds8YwRrfD8iMucveugFVDKCTaQanUEDN8Naa8PfG4q331/FnuWVl7rCIbbI8iJfMbm06ggCVJkHSo125C5npRuEEmDBAve6NHZCYJvfhxVm7Qcbw2GQ/SLqrmBAQ6s86QqDxNPpWdcN4ldN3Em5bNlLaW2KscrhSHbO24By65TsI1q3cK7PYLAWTirlsC4qZ7164TceQozeNyTvoAN9KqGLuM2DxGIuplfGMHyndbbstu0h9E+dXVqLa1N1Kpdpuey4v1whlQ0ndI3UKRfH2nEd4GG8d4COesDQ8qV9OQCA8DyYDr0HpT7sdZuLfbvbaq62VVAyBTFy6FRnAgkyOesAU6485uWr9kYcKwYAXGIJIVizSWACyqFsoMRtynn2/Z6lUAl5txA+YWmza8/wDj15n5KIGPU/f+Djy6D1r045Y9v35x5c49al+y2HthHYYG4j9231xJKnwn8URP7oPrVj7QqBbtqoADuB8Edh+qio19g4eixznPMAE6Dd2lWN2mS4NDB3/RUP6esfaf5h589+lLTGg7MT756+Xp8KtnCr6W2OZIRwGH38oMlSTuykHfcRqOYk7t3CEam03kIc/ASTVTNiUXtP4kEaiNOuS0wRcSBIIO9eu2kQf3Yjdf6KiC8elz5/rlo79ulz59Oq+tS2L4dbdnK2kQaaLAKjQCSGEGJbQHXTlJc4/g0IhsK3eNbL5TdIk+DwguGAOrQNJiJG9K0tkdM4im8QIuRukibF3AwDE20BlWHaLWxmZr9OrioDvW6XPn81q5djmJsmZ9s777LVK4SMTfuPayLmRSSDmtMIIEayM2o6VeOy9tltlWEEMZEzyX3/EA+6K0sBsuthMSXPiMu7iYt4dxG+QFsZjadWnlaIM+A39vz3XU7RRRW8stFJfY0qkvsaELO+K3FF5gYmen/NMb2Pt2wC07wIUnXl1pXHW+vf3em3P/AI/3rhh0Z5geyJJJAAHKWMAeRJE/GsDGtrnO1txNxlbJAMiPRJMGJ1MX0cumwtGmKTHkXyjfxA64uBPUJTg3l/8AI/5qp4C7cGId8OhZ1xBYqAZkraVQR+Fgrnz2Gpqzth1mTeUeguN+q2yp9x191I7N4K5buXYe02a5nt5Cwf2VGqOoaBGkA86c2fnqVctaoC6JPqAz/tANuczy35+1MKzoQWAi82Ft5nSNb6aq64bA5VF9c0C2zpaKjMrMCxUxqxB8IHLbXQ1UP2b3sTh79yxds3BaueJGytlDZcy6kaApA9VA3mtMYtl8ME+eg9dK8RiQMwg8xvr/ALVoCk0EEWidOesrPbWIY5modHZGkcNe62hKhOKcAS4lwIcjPpJLMFGdXYKs+HMRrESajuAcG/o9bz3MQpskZiWGQJBPiJJ6aH3eQpxxvthh7NwYdCcRimMLh7JDNP7xJy2h1LEehqtLwfE49y/EYCpLJgUbwhkZZFw/21wrmifDoCNCasDWgyly0E5t6VdS7xa+odHtcPtFbio6lGxTbpcZW17joDuRJ6Bv+0tfAyjQBrQ90qau+Hw+WLnetcUW8qTl0TQ7gCZhdT0Hmapn7RvFauOpkTbcHyDpPyNWgeg4cio1Acp6j5L39nqXmxV1MSHJfDgjOTmKB1CGfaHODvpPQ17+0LjdplXDi8bhFwE5gsaBxuIJ33iPM1G9lsdebFEs7tcuWLlm2zEySFLqMx3IIOsnf0qtvctqovJdcYoXCcmUZQo1UyRvMCPdEa0gMR0RYYkZr9415ceCc2Vh24mk5wkxoN8ukieDbXO6Qr92Kw11YuXsYbViNLLXB4wRzVye7T0gnyG9rbCd/hzZJi5aIUNvDrGR/Rlg+jEVn/Au0zFg18vdt6ZbdtLKBmOozN4YURtznXSQbdwPi9zGXbjJZ7g21HjLFs8loRlygQACZBkE9CQX8RRJzB4tobW4dvj1qqSDmCjxcW0Xt3rIW4whZYoM2supAhgdDI12B8uxvWwrZnJfTIwdQgGmbMJ11zTodCI1qft8Q7xSHsC4gJUtbK3kzKYIjeQZBkbg03QYRWGTBw52/wCnyEnfQsoFYLtk3aGlmVoIAcwOjNreRJG468ZJJLAxLbkgyYNnQLdYMd/gAEywNk3jlSe5iDcIABViGdVgAuSdM2yidSa5cYxQvyq2LOIS4wQTeCG3Ei20ZGy5izENpoUEa084zxN8l6VX6pBcfD5/G1udSxUEBYDGBOaACRJBqXH+1Ss4awEKXFzPau2g7JcUBT5QVyRlJ1U1r4XDFuhk8Ty0FosBMfO6oJzmwhT/AGZ4Fcwz3CdW8IYWyCQpznLmZVzMPqydBpt0q24PNHi9qNdp8py6ZoiY0nbSojhOEuCPpBbvLwztkd0AYBQbcBo0XLBG+UztJmcPYVJCiBv1JPUk6k+ZqTnFxkquZTiiiivEIpL7GlUl9jQhYx2gwJvcQugsy21Cs5XcLCgATpmZiqieZk6A09w9q5fY2bItqLa5jmYrbtKdm/EXOsnc7k7CnXFbcXsQ2svdQaaaW0Wf/wAoP90VWezvB7mNuXDnyW5m63kTIUDZjpz0EA9KzXMpOfVNZ4axgBM6S5xiRvAAs32nESDELoqmIcMPSDT7LQOUNE9t4ncNFJXOzmMOJt2e/t/Wq1y3dQ+AhQJPhXeCB6HevMVY+jKpfF4a8pYLFpgzLuc0ARAjXSddDNTtxMWl60uHspbSxZdLIvme89jOTkaQxhYnkGnfSL7YJ/0dp79izaxHeQBbAHgyvvlJkbczy2mhlbC4k06LsmV0CG5MwmbjL6sAXLTDdDeySZXrNcDm/XNWDAdocV3S27Nlb14SCblxkGiOyH2SXLFGSdPut96mV/AYvFqi4ziDIz3FHcYQd1be0wBzByO8dddTmjTLAJpv2Na4cvdtD90h1P4bmHkHpK6f3iavfBbV1UK3gJBkEEGZ9rbbWTGwzQNAKawbnupemZIJaTxykie2O+UrjqbWVvRsCAY4SmXCOymEwtvu7FkINDK6NIghs25II3JoxPZ9HBl3kySZBJYh1LHTfK7r6HSIETF5oExPQdTXK0hA8RJMa+vOPKnOtKLjhbGRcpYtqTJidSTy05mq72w4aHtlBoLiunoWkg/Ek+6rFexaKcpPi/CNTXDiOG7y2VjXcev86e+rG2N1HmsrwHaG4UwjFFBwx8OmVpMZ0YgxJgyY+8a0bHdkMBjIv5INwBsyErM6yRsG6mJ61n923bwmOW7dts9m42cqoX7QAgqcxAgtD76+IcqnOyPapMMxsuWGHZibZbVrcknxRMg8yJgydiYRIDHFj73/AEUrQxD8NVINSCTYzBiLGRFiLcoGs2R2n7HtYYfQwxtZZuWyxYoZgOJkkHWekHl7MbgXvGw1m3ibS22Oa4bbFmaQFAdlBKIAAIG5nUzFamzRdLKVPeWgLZnQspuNEjqHB03AY8qrGA4Dm727jEW05YZbgW2rMSDmBRcyPyAMFjrrtT1OqA2HRbT/ABvjwsni8ze6jFN1sFZw2EbIiKGuXAHhnJL92pVfZDHXrttNOuOtdxeJt3rN0IuHE2zDGXMG40KpkAQkc4cc6ON43EYG0LiZShJyqyZGgZYJ3AJBJiNAusGQIThvbHH3EYYfDLkTTTKQCdYA8MnnAqipi6NL0nuAjeZ38bJilha1RnSNbbSS5ov2keSmOK8JvYjE3MSr9yUCoSZAkL4iCQAyGSPMaEbivezPZrInfEJdW3DWmyEl2GzwD4kU6iNWIEQIzUe92mxWIuoty4YzL4YIHtCJB1PvPKrfje0z5icPNqSSSDmLeZVpSfOJ21qdOqarS1mgsl9pn9n5BXIlwkAXMTHV49pU32i449oJlYFw5KsVyygtkEwd/E8A7GD0NOuwPFbmJsXLtxsx70qDAHhCpGgHqffWWcd4s1xyHuZ3bRmP3o/sxGnWQNBqOZrRv2Ut/wBG2mouNOsycqGf1+EVW5wDsnDX5fNZmGrPrVc9w0iw+J6z4dau1FFFC0UUl9jSqS+xoQsxxTK+Lu2SwUi7baTzRxbR4/elbQ95PKuFrhtpPCmHvKTMlbt+2DDFVByjUka+QJO1V3tvcK4+4QYIy/6R13HlTnC9qFYfWNiEPMpcZl9QjXFK+5iOgFYeJbW6VzqbtYBGdzAYzXkWOuhi4mdQun+4vqUKTm6ZRuncO0yb71ONwy0zKHsX5BIDNdvsFOYAHMRoDD69QPc3ucNtOwz4a4xj23vXek5fHtrpAJ19KZf09b/7zEH/AOtPPlmA8t+VRfFO0txlKWHvpP8AaNcct/dAcrbHvYnqNqpp1Mdo4kWt+PUPO2Vx367tNSLwGzah9We1pHnHhJ5K+cCtpavKqbQiwZ8CkBmQk65icmnIDXervdugROgPPkPXpWQdieMm8Gs3EC3LSqWYGe8mRnjeSRJnma1DAXwUUbiAOvKugw1AUqDADPE8STJN768VhYlzzWdnBBEC/IR9U+DgiQQR1BmkmudrDIslR/H57Us1cl1xS3AA3/36+tBry9ciNCfQTXHD4lXmJkGCDoQfMVIBBULjbOHfEAXgpRdSCAwa4YUafu5lJPVk/FVB4NjVwRuW8Zhu9NxFW2xIVSPabxEFlYELsJEehOpPgbZMm2pPUieo5+v8xUZ2iwVhrRW4i5Y2I0AAnNA18IE6a6ADUiovZmuT1KqozNBGomO3kqt2Z4riQxs2bQv2zL/R3IICgg6M+xEjrO8TVhPa2zbbKuG7q7s3eKEKerH7vTMRNQ2M7N4ixeNzh15UCqLeVtSfCodsxBGcsNdNwdRVW4jgsauY3sLezHXOs3JMzJdC28czSwFRg0n9d6VDazA2nJuQCYBAE6wL2G6IG5Xfj/E0v2yr3VedQFOYKYIGg6gnUkSCY5RSsJbxFnOtm+UR/a10MbHUHUdQoqFvrlPjR83MMCYkAj2tYgg++nOLK3CvcYK6oyjMArXJfnBMwu0e+aqqFtWGvpEzMxEdsib8gexMUMVi8OHtpPa5s6OYTJ/MASDu3wI3J9h8LbtDM7qznpDmD7pEj7x617isQ7W2uKAlsMFJLDMSeWns6az8DXHCdmsbcy5bOQGYNxo2K5pAlhuOXOpzBdg1HjxNw3SPuL4F9NPE3xE9KYa2u5oZThgnr6+/jBS9fDmvXNas41CQLm0GNA0DRpOkATJm8mq4XA3rzZbKnWMzsIVREgj13AEzM7a1tf7PsELODS0CSVLZidCSXZp+BX3RUJZv2stm2oAKW1smIhgohSsfyQeiGLT2bRRbfKAPGSY6kCT61NlJjacjVOgGwcZgQJ3CSY7yT1lTNFFFeKaK8Ir2ihCgcZ2Ww11zce0hY7kqJ8q4/wBS8H/26f4RVkoqJa3gO5WCtUAgOPeVW/6lYP8A9hP8Io/qXg/+3T/CKslFGRvAL3p6v5z3lVq32LwYYOLKBhoGUZTHSRrUlb4Oi6KSPeak6KkLaKskkyTJTFOHxs7fGvfoP77fGntFErxMfoH77fGvBw4a+I67+dP6KJKEw/o0fib41zvcHRhDa+uvUfxNSdFEleQotODIBAmPWvRwhYiTHSak6K9kr1Ro4SvU8v0AA/QAe6j+il6n41JUUSUKM/ohIA1gEkDoTMn9TR/Q6edSdFElCizwZPOneCwi21yoABvp1605ooLid6EUUUV4hFFFFCEUUUUIRRRRQhFFFFCEUUUUIRRRRQhFFFFCEUUUUIRRRRQhFFFFCEUUUUIRRRRQhf/Z', 5.99)
SET IDENTITY_INSERT [dbo].[Libro] OFF
GO
SET IDENTITY_INSERT [dbo].[MetodoPago] ON 

INSERT [dbo].[MetodoPago] ([IDMetodoPago], [MetodoPago]) VALUES (1, N'Tarjeta de Credito')
INSERT [dbo].[MetodoPago] ([IDMetodoPago], [MetodoPago]) VALUES (2, N'Tarjeta de Debito')
INSERT [dbo].[MetodoPago] ([IDMetodoPago], [MetodoPago]) VALUES (3, N'Efectivo')
INSERT [dbo].[MetodoPago] ([IDMetodoPago], [MetodoPago]) VALUES (4, N'MercadoPago QR')
INSERT [dbo].[MetodoPago] ([IDMetodoPago], [MetodoPago]) VALUES (5, N'MercadoPago Transferencia')
SET IDENTITY_INSERT [dbo].[MetodoPago] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IDUsuario], [NombreUsuario], [Contraseña], [Gmail], [Telefono]) VALUES (2, N'Matias', N'queseyo', N'qsy@gmail.com', N'1162946414')
INSERT [dbo].[Usuario] ([IDUsuario], [NombreUsuario], [Contraseña], [Gmail], [Telefono]) VALUES (3, N'johndoe', N'password123', N'johndoe@gmail.com', N'555-123-4567')
INSERT [dbo].[Usuario] ([IDUsuario], [NombreUsuario], [Contraseña], [Gmail], [Telefono]) VALUES (4, N'janedoe', N'securepass', N'janedoe@gmail.com', N'555-987-6543')
INSERT [dbo].[Usuario] ([IDUsuario], [NombreUsuario], [Contraseña], [Gmail], [Telefono]) VALUES (5, N'mike_smith', N'mikespass', N'mike.smith@gmail.com', N'555-555-5555')
INSERT [dbo].[Usuario] ([IDUsuario], [NombreUsuario], [Contraseña], [Gmail], [Telefono]) VALUES (6, N'sarah95', N'p@ssw0rd!', N'sarah95@gmail.com', N'555-111-2222')
INSERT [dbo].[Usuario] ([IDUsuario], [NombreUsuario], [Contraseña], [Gmail], [Telefono]) VALUES (7, N'alex_jones', N'secretword', N'alex.jones@gmail.com', N'555-444-7777')
INSERT [dbo].[Usuario] ([IDUsuario], [NombreUsuario], [Contraseña], [Gmail], [Telefono]) VALUES (8, N'emily_smith', N'emilypass', N'emilysmith@gmail.com', N'555-666-9999')
INSERT [dbo].[Usuario] ([IDUsuario], [NombreUsuario], [Contraseña], [Gmail], [Telefono]) VALUES (9, N'davidbrown', N'davidpass123', N'david.brown@gmail.com', N'555-222-3333')
INSERT [dbo].[Usuario] ([IDUsuario], [NombreUsuario], [Contraseña], [Gmail], [Telefono]) VALUES (10, N'lisa89', N'lisa@pass', N'lisa89@gmail.com', N'555-777-8888')
INSERT [dbo].[Usuario] ([IDUsuario], [NombreUsuario], [Contraseña], [Gmail], [Telefono]) VALUES (11, N'steven_miller', N'millerpass', N'steven.miller@gmail.com', N'555-444-5555')
INSERT [dbo].[Usuario] ([IDUsuario], [NombreUsuario], [Contraseña], [Gmail], [Telefono]) VALUES (12, N'amanda_johnson', N'amandapass', N'amanda.johnson@gmail.com', N'555-888-9999')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[DetalleCompra]  WITH CHECK ADD  CONSTRAINT [FK_DetalleCompra_Libro] FOREIGN KEY([FKLibro])
REFERENCES [dbo].[Libro] ([IDLibro])
GO
ALTER TABLE [dbo].[DetalleCompra] CHECK CONSTRAINT [FK_DetalleCompra_Libro]
GO
ALTER TABLE [dbo].[DetalleCompra]  WITH CHECK ADD  CONSTRAINT [FK_DetalleCompra_MetodoPago] FOREIGN KEY([FKMetodoDePago])
REFERENCES [dbo].[MetodoPago] ([IDMetodoPago])
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
/****** Object:  StoredProcedure [dbo].[SP_Compra]    Script Date: 21/11/2023 09:04:48 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_DetalleLibro]    Script Date: 21/11/2023 09:04:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE Procedure [dbo].[SP_DetalleLibro]
	@pidlibro int
	As
	Begin
	Select Titulo,G.Nombre as 'Genero',A.Nombre as 'NombreAutor',Descripcion,FechaDePublicacion,Imagen,Precio,Stock From Libro
	Inner Join Genero G On G.IDGenero = Libro.FKGenero
	Inner Join Autor A On A.IDAutor = Libro.FKAutor
	Where Libro.IDLibro = @pidlibro;
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_FiltrosLibros]    Script Date: 21/11/2023 09:04:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE procedure [dbo].[SP_FiltrosLibros]
		@pAutor int, @pGenero int
	AS
	Begin
	Select L.IDLibro,L.Titulo,L.Imagen,Autor.Nombre AS 'NombreAutor',L.Descripcion,Genero.Nombre AS 'Genero' from Libro L
	Inner Join Autor On L.FKAutor = Autor.IDAutor
	Inner Join Genero On Genero.IDGenero = L.FKGenero
	 Where (@pAutor IS NULL Or @pAutor = FKAutor)
		And (@pGenero IS NULL Or @pGenero = FKGenero);
	End
GO
/****** Object:  Trigger [dbo].[TR_HistorialCompra]    Script Date: 21/11/2023 09:04:48 ******/
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
