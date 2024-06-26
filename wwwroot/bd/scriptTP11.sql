
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
/****** Object:  Table [dbo].[Autor]    Script Date: 15/4/2024 21:33:06 ******/
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
/****** Object:  Table [dbo].[DetalleCompra]    Script Date: 15/4/2024 21:33:06 ******/
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
/****** Object:  Table [dbo].[Genero]    Script Date: 15/4/2024 21:33:06 ******/
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
/****** Object:  Table [dbo].[Historial]    Script Date: 15/4/2024 21:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historial](
	[IDHistorial] [int] IDENTITY(1,1) NOT NULL,
	[FKCompra] [int] NOT NULL,
	[IDUsuario] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[FKLibro] [int] NOT NULL,
 CONSTRAINT [PK_Historial] PRIMARY KEY CLUSTERED 
(
	[IDHistorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libro]    Script Date: 15/4/2024 21:33:06 ******/
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
/****** Object:  Table [dbo].[MetodoPago]    Script Date: 15/4/2024 21:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MetodoPago](
	[IDMetodoPago] [int] IDENTITY(1,1) NOT NULL,
	[MetodoDePago] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Compra] PRIMARY KEY CLUSTERED 
(
	[IDMetodoPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 15/4/2024 21:33:06 ******/
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
	[Genero] [varchar](50) NULL,
	[Edad] [int] NULL,
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

INSERT [dbo].[DetalleCompra] ([IDCompra], [FKUsuario], [FKLibro], [Precio], [FKMetodoDePago], [FechaYHora]) VALUES (30, 2, 12, 20.99, 1, CAST(N'2024-04-15T00:00:00.000' AS DateTime))
INSERT [dbo].[DetalleCompra] ([IDCompra], [FKUsuario], [FKLibro], [Precio], [FKMetodoDePago], [FechaYHora]) VALUES (31, 2, 14, 18.989999771118164, 5, CAST(N'2024-04-15T20:45:02.000' AS DateTime))
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
SET IDENTITY_INSERT [dbo].[Genero] OFF
GO
SET IDENTITY_INSERT [dbo].[Historial] ON 

INSERT [dbo].[Historial] ([IDHistorial], [FKCompra], [IDUsuario], [Fecha], [FKLibro]) VALUES (1, 29, 2, CAST(N'2024-04-15' AS Date), 12)
INSERT [dbo].[Historial] ([IDHistorial], [FKCompra], [IDUsuario], [Fecha], [FKLibro]) VALUES (2, 30, 2, CAST(N'2024-04-15' AS Date), 12)
INSERT [dbo].[Historial] ([IDHistorial], [FKCompra], [IDUsuario], [Fecha], [FKLibro]) VALUES (3, 31, 2, CAST(N'2024-04-15' AS Date), 14)
SET IDENTITY_INSERT [dbo].[Historial] OFF
GO
SET IDENTITY_INSERT [dbo].[Libro] ON 

INSERT [dbo].[Libro] ([IDLibro], [Titulo], [FKGenero], [Descripcion], [FechaDePublicacion], [FKAutor], [Stock], [Imagen], [Precio]) VALUES (12, N'Cien años de soledad', 1, N'Obra maestra del realismo mágico que narra la historia de la familia Buendía.', CAST(N'1967-06-30' AS Date), 4, 10, N'https://images.cdn3.buscalibre.com/fit-in/360x360/61/8d/618d227e8967274cd9589a549adff52d.jpg', 20.99)
INSERT [dbo].[Libro] ([IDLibro], [Titulo], [FKGenero], [Descripcion], [FechaDePublicacion], [FKAutor], [Stock], [Imagen], [Precio]) VALUES (13, N'Harry Potter y la piedra filosofal', 2, N'Primera entrega de la famosa serie de libros de Harry Potter.', CAST(N'1997-06-26' AS Date), 5, 15, N'https://images.cdn3.buscalibre.com/fit-in/360x360/ce/e6/cee6ef96dad70d3f599b953f0e50afc7.jpg', 25.99)
INSERT [dbo].[Libro] ([IDLibro], [Titulo], [FKGenero], [Descripcion], [FechaDePublicacion], [FKAutor], [Stock], [Imagen], [Precio]) VALUES (14, N'El viejo y el mar', 3, N'Novela que relata la lucha de un pescador solitario contra un enorme pez espada.', CAST(N'1952-09-01' AS Date), 6, 8, N'https://images.cdn1.buscalibre.com/fit-in/360x360/5a/f9/5af9470ec7931e5b502356ff9ae0c286.jpg', 18.99)
INSERT [dbo].[Libro] ([IDLibro], [Titulo], [FKGenero], [Descripcion], [FechaDePublicacion], [FKAutor], [Stock], [Imagen], [Precio]) VALUES (15, N'Orgullo y prejuicio', 4, N'Historia de amor y superación personal en la sociedad inglesa del siglo XIX.', CAST(N'1813-01-28' AS Date), 7, 12, N'https://images.cdn1.buscalibre.com/fit-in/360x360/8d/db/8ddb85fa0d426826f9768649a412fc96.jpg', 22.99)
INSERT [dbo].[Libro] ([IDLibro], [Titulo], [FKGenero], [Descripcion], [FechaDePublicacion], [FKAutor], [Stock], [Imagen], [Precio]) VALUES (16, N'Veinte poemas de amor y una canción desesperada', 5, N'Colección de poemas que expresan el amor y la pasión.', CAST(N'1924-08-09' AS Date), 8, 5, N'https://images.cdn3.buscalibre.com/fit-in/360x360/1a/ec/1aec0df8624831575cd5dcb07c188cf2.jpg', 15.99)
INSERT [dbo].[Libro] ([IDLibro], [Titulo], [FKGenero], [Descripcion], [FechaDePublicacion], [FKAutor], [Stock], [Imagen], [Precio]) VALUES (17, N'Mrs. Dalloway', 6, N'Novela que sigue un día en la vida de Clarissa Dalloway en la sociedad londinense.', CAST(N'1925-05-14' AS Date), 9, 10, N'https://images.cdn2.buscalibre.com/fit-in/360x360/17/59/17597e47714b52f4e604278901004f4c.jpg', 21.99)
INSERT [dbo].[Libro] ([IDLibro], [Titulo], [FKGenero], [Descripcion], [FechaDePublicacion], [FKAutor], [Stock], [Imagen], [Precio]) VALUES (18, N'Crimen y castigo', 7, N'Relato que explora los dilemas morales y la culpa de un estudiante que comete un asesinato.', CAST(N'1866-01-01' AS Date), 10, 7, N'https://i1.whakoom.com/large/10/3b/be8ab05a9a0946d5a0012b468a8ba551.jpg', 19.99)
INSERT [dbo].[Libro] ([IDLibro], [Titulo], [FKGenero], [Descripcion], [FechaDePublicacion], [FKAutor], [Stock], [Imagen], [Precio]) VALUES (19, N'Matar a un ruiseñor', 8, N'Historia conmovedora sobre la injusticia racial en el sur de Estados Unidos.', CAST(N'1960-07-11' AS Date), 11, 9, N'https://images.cdn3.buscalibre.com/fit-in/360x360/1b/d7/1bd7b432c94ccdcf816c917d8abe8e83.jpg', 23.99)
INSERT [dbo].[Libro] ([IDLibro], [Titulo], [FKGenero], [Descripcion], [FechaDePublicacion], [FKAutor], [Stock], [Imagen], [Precio]) VALUES (20, N'Don Quijote de la Mancha', 9, N'Obra cumbre de la literatura española que sigue las aventuras de un caballero loco.', CAST(N'1605-01-16' AS Date), 12, 6, N'https://images.cdn3.buscalibre.com/fit-in/360x360/30/08/300822003676ba26360a2148939bb877.jpg', 17.99)
INSERT [dbo].[Libro] ([IDLibro], [Titulo], [FKGenero], [Descripcion], [FechaDePublicacion], [FKAutor], [Stock], [Imagen], [Precio]) VALUES (21, N'Diez negritos', 10, N'Un grupo de personas es invitado a una isla donde son asesinadas una por una.', CAST(N'1939-11-06' AS Date), 13, 4, N'https://images.cdn2.buscalibre.com/fit-in/360x360/c9/e5/c9e5317ebd68eea812b6d6b452674a41.jpg', 20.99)
SET IDENTITY_INSERT [dbo].[Libro] OFF
GO
SET IDENTITY_INSERT [dbo].[MetodoPago] ON 

INSERT [dbo].[MetodoPago] ([IDMetodoPago], [MetodoDePago]) VALUES (1, N'Tarjeta de Credito')
INSERT [dbo].[MetodoPago] ([IDMetodoPago], [MetodoDePago]) VALUES (2, N'Tarjeta de Debito')
INSERT [dbo].[MetodoPago] ([IDMetodoPago], [MetodoDePago]) VALUES (3, N'Efectivo')
INSERT [dbo].[MetodoPago] ([IDMetodoPago], [MetodoDePago]) VALUES (4, N'MercadoPago QR')
INSERT [dbo].[MetodoPago] ([IDMetodoPago], [MetodoDePago]) VALUES (5, N'MercadoPago Transferencia')
SET IDENTITY_INSERT [dbo].[MetodoPago] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IDUsuario], [NombreUsuario], [Contraseña], [Gmail], [Telefono], [Genero], [Edad]) VALUES (2, N'Matias', N'queseyo', N'qsy@gmail.com', N'1162946414', NULL, NULL)
INSERT [dbo].[Usuario] ([IDUsuario], [NombreUsuario], [Contraseña], [Gmail], [Telefono], [Genero], [Edad]) VALUES (3, N'johndoe', N'password123', N'johndoe@gmail.com', N'555-123-4567', NULL, NULL)
INSERT [dbo].[Usuario] ([IDUsuario], [NombreUsuario], [Contraseña], [Gmail], [Telefono], [Genero], [Edad]) VALUES (4, N'janedoe', N'securepass', N'janedoe@gmail.com', N'555-987-6543', NULL, NULL)
INSERT [dbo].[Usuario] ([IDUsuario], [NombreUsuario], [Contraseña], [Gmail], [Telefono], [Genero], [Edad]) VALUES (5, N'mike_smith', N'mikespass', N'mike.smith@gmail.com', N'555-555-5555', NULL, NULL)
INSERT [dbo].[Usuario] ([IDUsuario], [NombreUsuario], [Contraseña], [Gmail], [Telefono], [Genero], [Edad]) VALUES (6, N'sarah95', N'p@ssw0rd!', N'sarah95@gmail.com', N'555-111-2222', NULL, NULL)
INSERT [dbo].[Usuario] ([IDUsuario], [NombreUsuario], [Contraseña], [Gmail], [Telefono], [Genero], [Edad]) VALUES (7, N'alex_jones', N'secretword', N'alex.jones@gmail.com', N'555-444-7777', NULL, NULL)
INSERT [dbo].[Usuario] ([IDUsuario], [NombreUsuario], [Contraseña], [Gmail], [Telefono], [Genero], [Edad]) VALUES (8, N'emily_smith', N'emilypass', N'emilysmith@gmail.com', N'555-666-9999', NULL, NULL)
INSERT [dbo].[Usuario] ([IDUsuario], [NombreUsuario], [Contraseña], [Gmail], [Telefono], [Genero], [Edad]) VALUES (9, N'davidbrown', N'davidpass123', N'david.brown@gmail.com', N'555-222-3333', NULL, NULL)
INSERT [dbo].[Usuario] ([IDUsuario], [NombreUsuario], [Contraseña], [Gmail], [Telefono], [Genero], [Edad]) VALUES (10, N'lisa89', N'lisa@pass', N'lisa89@gmail.com', N'555-777-8888', NULL, NULL)
INSERT [dbo].[Usuario] ([IDUsuario], [NombreUsuario], [Contraseña], [Gmail], [Telefono], [Genero], [Edad]) VALUES (11, N'steven_miller', N'millerpass', N'steven.miller@gmail.com', N'555-444-5555', NULL, NULL)
INSERT [dbo].[Usuario] ([IDUsuario], [NombreUsuario], [Contraseña], [Gmail], [Telefono], [Genero], [Edad]) VALUES (12, N'amanda_johnson', N'amandapass', N'amanda.johnson@gmail.com', N'555-888-9999', NULL, NULL)
INSERT [dbo].[Usuario] ([IDUsuario], [NombreUsuario], [Contraseña], [Gmail], [Telefono], [Genero], [Edad]) VALUES (16, N'raiank', N'si', N'raian@gmail.com', N'782178217827', NULL, NULL)
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
/****** Object:  StoredProcedure [dbo].[SP_Compra]    Script Date: 15/4/2024 21:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE procedure [dbo].[SP_Compra]
	@cantidadCompra int,
	@idlibro int
	As
	Begin
	Update Libro
	Set Libro.Stock = Libro.Stock - @cantidadCompra
	Where IDLibro = @idlibro;
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_DetalleCompra]    Script Date: 15/4/2024 21:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	Create Procedure [dbo].[SP_DetalleCompra]
	@pfklibro int,
	@pprecio int,
	@fecha datetime,
	@metodopago int,
	@pusuario int
	AS
	Begin
	Insert into DetalleCompra (FKLibro,Precio,FechaYHora,FKMetodoDePago,FKUsuario) values (@pfklibro,@pprecio,@fecha,@metodopago,@pusuario);
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_DetalleLibro]    Script Date: 15/4/2024 21:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE Procedure [dbo].[SP_DetalleLibro]
	@pidlibro int
	As
	Begin
	Select Libro.IDLibro,Titulo,G.Nombre as 'Genero',A.Nombre as 'NombreAutor',Descripcion,FechaDePublicacion,Imagen,Precio,Stock From Libro
	Inner Join Genero G On G.IDGenero = Libro.FKGenero
	Inner Join Autor A On A.IDAutor = Libro.FKAutor
	Where Libro.IDLibro = @pidlibro;
	End
GO
/****** Object:  StoredProcedure [dbo].[SP_FiltrosLibros]    Script Date: 15/4/2024 21:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE procedure [dbo].[SP_FiltrosLibros]
		@pAutor int, @pGenero int
	AS
	Begin
	Select L.IDLibro,L.Titulo,L.Imagen,Autor.Nombre AS 'NombreAutor',L.Descripcion,Genero.Nombre AS 'Genero',L.Stock from Libro L
	Inner Join Autor On L.FKAutor = Autor.IDAutor
	Inner Join Genero On Genero.IDGenero = L.FKGenero
	 Where (@pAutor IS NULL Or @pAutor = FKAutor)
		And (@pGenero IS NULL Or @pGenero = FKGenero);
	End
GO
/****** Object:  Trigger [dbo].[TR_HistorialCompra]    Script Date: 15/4/2024 21:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE Trigger [dbo].[TR_HistorialCompra]
	On [dbo].[DetalleCompra] After Insert
	AS
	Begin
	set nocount on 
	Declare @pcompra int, @pusuario int, @pfecha datetime, @plibro varchar(50);
	select @pcompra = IDCompra from inserted
	select @pusuario = FKUsuario from inserted
	select @pfecha = FechaYHora from inserted
	select @plibro = FKLibro from inserted
	Insert Into Historial (FKCompra,IDUsuario,Fecha,FKLibro) values (@pcompra,@pusuario,@pfecha,@plibro)
	End
GO
ALTER TABLE [dbo].[DetalleCompra] ENABLE TRIGGER [TR_HistorialCompra]
GO
USE [master]
GO
ALTER DATABASE [BDTP11] SET  READ_WRITE 
GO
