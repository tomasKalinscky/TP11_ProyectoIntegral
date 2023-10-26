USE [master]
GO
/****** Object:  Database [BDTP11]    Script Date: 26/10/2023 14:00:00 ******/
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
/****** Object:  User [alumno]    Script Date: 26/10/2023 14:00:00 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Autor]    Script Date: 26/10/2023 14:00:00 ******/
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
/****** Object:  Table [dbo].[Historial]    Script Date: 26/10/2023 14:00:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historial](
	[IDHistorial] [int] IDENTITY(1,1) NOT NULL,
	[IDPrestamo] [int] NOT NULL,
	[Usuario] [varchar](50) NOT NULL,
	[Vendedor] [varchar](50) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Libro] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Historial] PRIMARY KEY CLUSTERED 
(
	[IDHistorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libros]    Script Date: 26/10/2023 14:00:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libros](
	[IDLibro] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](50) NOT NULL,
	[FK_Genero] [int] NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
	[FechaDePublicacion] [date] NOT NULL,
	[FK_Autor] [int] NOT NULL,
 CONSTRAINT [PK_Libros] PRIMARY KEY CLUSTERED 
(
	[IDLibro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prestamo]    Script Date: 26/10/2023 14:00:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prestamo](
	[IDPrestamo] [int] NOT NULL,
	[FechaPrestamo] [date] NOT NULL,
	[FechaVencimiento] [date] NOT NULL,
	[EstadoPrestamo] [varchar](20) NOT NULL,
	[FKLibro] [int] NOT NULL,
	[FKUsuario] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Prestamo] PRIMARY KEY CLUSTERED 
(
	[IDPrestamo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 26/10/2023 14:00:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[NombreUsuario] [varchar](50) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
	[Gmail] [varchar](100) NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[NombreUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Libros]  WITH CHECK ADD  CONSTRAINT [FK_Libros_Autor] FOREIGN KEY([FK_Autor])
REFERENCES [dbo].[Autor] ([IDAutor])
GO
ALTER TABLE [dbo].[Libros] CHECK CONSTRAINT [FK_Libros_Autor]
GO
ALTER TABLE [dbo].[Prestamo]  WITH CHECK ADD  CONSTRAINT [FK_Prestamo_Libros] FOREIGN KEY([FKLibro])
REFERENCES [dbo].[Libros] ([IDLibro])
GO
ALTER TABLE [dbo].[Prestamo] CHECK CONSTRAINT [FK_Prestamo_Libros]
GO
ALTER TABLE [dbo].[Prestamo]  WITH CHECK ADD  CONSTRAINT [FK_Prestamo_Usuario] FOREIGN KEY([FKUsuario])
REFERENCES [dbo].[Usuario] ([NombreUsuario])
GO
ALTER TABLE [dbo].[Prestamo] CHECK CONSTRAINT [FK_Prestamo_Usuario]
GO
/****** Object:  Trigger [dbo].[trigger_HistorialPrestamo]    Script Date: 26/10/2023 14:00:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[trigger_HistorialPrestamo]
on [dbo].[Prestamo]
for insert
as
begin
	declare @idPrestamo int;
	declare @idLibro int;
	declare @nombreUsuario varchar(50);
	select @idPrestamo = IDPrestamo from inserted;
	select @idLibro = FKLibro from inserted;
	select @nombreUsuario = FKUsuario from inserted;

	insert into Historial values(@idPrestamo,@nombreUsuario,SYSTEM_USER,getdate(),(select Titulo from Libros where @idLibro = IDLibro))

end
GO
ALTER TABLE [dbo].[Prestamo] ENABLE TRIGGER [trigger_HistorialPrestamo]
GO
USE [master]
GO
ALTER DATABASE [BDTP11] SET  READ_WRITE 
GO
