USE [master]
GO
/****** Base de datos para una biblioteca hecho por: ******/
/****** Ayllin Montaño Sierra 20-SIIT-1-017 ******/
/****** Seccion: 0541******/
CREATE DATABASE [Biblioteca]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Biblioteca', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Biblioteca.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Biblioteca_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Biblioteca_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Biblioteca] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Biblioteca].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Biblioteca] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Biblioteca] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Biblioteca] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Biblioteca] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Biblioteca] SET ARITHABORT OFF 
GO
ALTER DATABASE [Biblioteca] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Biblioteca] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Biblioteca] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Biblioteca] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Biblioteca] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Biblioteca] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Biblioteca] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Biblioteca] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Biblioteca] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Biblioteca] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Biblioteca] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Biblioteca] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Biblioteca] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Biblioteca] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Biblioteca] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Biblioteca] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Biblioteca] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Biblioteca] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Biblioteca] SET  MULTI_USER 
GO
ALTER DATABASE [Biblioteca] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Biblioteca] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Biblioteca] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Biblioteca] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Biblioteca] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Biblioteca] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Biblioteca] SET QUERY_STORE = OFF
GO
USE [Biblioteca]
GO
/****** Object:  Table [dbo].[Autores_Libros]    Script Date: 12/4/2022 10:53:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autores_Libros](
	[Id_Autor] [int] IDENTITY(10,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Nacionalidad] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Autores_Libros] PRIMARY KEY CLUSTERED 
(
	[Id_Autor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Devoluciones]    Script Date: 12/4/2022 10:53:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Devoluciones](
	[Id_Devolucion] [int] IDENTITY(10000,19) NOT NULL,
	[Id_Prestamo] [int] NULL,
	[Fecha] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Devolucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Editoriales]    Script Date: 12/4/2022 10:53:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Editoriales](
	[Id_Editorial] [int] IDENTITY(110,2) NOT NULL,
	[Nombre_Editorial] [varchar](50) NULL,
 CONSTRAINT [PK_Editoriales] PRIMARY KEY CLUSTERED 
(
	[Id_Editorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estudiantes]    Script Date: 12/4/2022 10:53:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estudiantes](
	[Id_Estudiante] [int] IDENTITY(300,341) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Edad] [varchar](3) NOT NULL,
 CONSTRAINT [PK_Estudiantes] PRIMARY KEY CLUSTERED 
(
	[Id_Estudiante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libros]    Script Date: 12/4/2022 10:53:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libros](
	[Id_Libro] [int] IDENTITY(3000,300) NOT NULL,
	[Nombre_Del_Libro] [varchar](50) NULL,
	[Id_Autor] [int] NULL,
	[Id_Editorial] [int] NULL,
	[FechPublicacion] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Libro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prestamos]    Script Date: 12/4/2022 10:53:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prestamos](
	[Id_Prestamo] [int] IDENTITY(3002,2) NOT NULL,
	[Id_Estudiante] [int] NULL,
	[Id_Libro] [int] NULL,
	[FechPrestamo] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Prestamo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Autores_Libros] ON 

INSERT [dbo].[Autores_Libros] ([Id_Autor], [Nombre], [Apellido], [Nacionalidad]) VALUES (10, N'Joana', N'Marcus', N'Española')
INSERT [dbo].[Autores_Libros] ([Id_Autor], [Nombre], [Apellido], [Nacionalidad]) VALUES (11, N'Arianna ', N' Godoy', N'Venezolana')
INSERT [dbo].[Autores_Libros] ([Id_Autor], [Nombre], [Apellido], [Nacionalidad]) VALUES (12, N'Julio ', N'Verne ', N'Frances')
INSERT [dbo].[Autores_Libros] ([Id_Autor], [Nombre], [Apellido], [Nacionalidad]) VALUES (13, N'Rainbow', N'Rowell', N'Estadounidense')
INSERT [dbo].[Autores_Libros] ([Id_Autor], [Nombre], [Apellido], [Nacionalidad]) VALUES (14, N'Edgar Allan', N'Poe', N'Estadounidense')
INSERT [dbo].[Autores_Libros] ([Id_Autor], [Nombre], [Apellido], [Nacionalidad]) VALUES (15, N'Elisabet ', N'Betnavent', N'Española')
INSERT [dbo].[Autores_Libros] ([Id_Autor], [Nombre], [Apellido], [Nacionalidad]) VALUES (16, N'Stephanie', N'Garber', N'Estadounidense')
INSERT [dbo].[Autores_Libros] ([Id_Autor], [Nombre], [Apellido], [Nacionalidad]) VALUES (17, N'John ', N'Green', N'Estadounidense')
INSERT [dbo].[Autores_Libros] ([Id_Autor], [Nombre], [Apellido], [Nacionalidad]) VALUES (18, N'Laetitia ', N'Colombani', N'Francesa')
INSERT [dbo].[Autores_Libros] ([Id_Autor], [Nombre], [Apellido], [Nacionalidad]) VALUES (19, N'Leigh', N'Bardugo', N'Israeli')
SET IDENTITY_INSERT [dbo].[Autores_Libros] OFF
GO
SET IDENTITY_INSERT [dbo].[Devoluciones] ON 

INSERT [dbo].[Devoluciones] ([Id_Devolucion], [Id_Prestamo], [Fecha]) VALUES (10000, 3002, CAST(N'2021-12-11' AS Date))
INSERT [dbo].[Devoluciones] ([Id_Devolucion], [Id_Prestamo], [Fecha]) VALUES (10019, 3004, CAST(N'2021-09-30' AS Date))
INSERT [dbo].[Devoluciones] ([Id_Devolucion], [Id_Prestamo], [Fecha]) VALUES (10038, 3006, CAST(N'2021-11-14' AS Date))
INSERT [dbo].[Devoluciones] ([Id_Devolucion], [Id_Prestamo], [Fecha]) VALUES (10057, 3008, CAST(N'2021-11-12' AS Date))
INSERT [dbo].[Devoluciones] ([Id_Devolucion], [Id_Prestamo], [Fecha]) VALUES (10076, 3010, CAST(N'2021-12-10' AS Date))
INSERT [dbo].[Devoluciones] ([Id_Devolucion], [Id_Prestamo], [Fecha]) VALUES (10095, 3012, CAST(N'2021-11-11' AS Date))
INSERT [dbo].[Devoluciones] ([Id_Devolucion], [Id_Prestamo], [Fecha]) VALUES (10114, 3014, CAST(N'2021-11-22' AS Date))
INSERT [dbo].[Devoluciones] ([Id_Devolucion], [Id_Prestamo], [Fecha]) VALUES (10133, 3016, CAST(N'2021-10-25' AS Date))
INSERT [dbo].[Devoluciones] ([Id_Devolucion], [Id_Prestamo], [Fecha]) VALUES (10152, 3018, CAST(N'2021-12-03' AS Date))
INSERT [dbo].[Devoluciones] ([Id_Devolucion], [Id_Prestamo], [Fecha]) VALUES (10171, 3020, CAST(N'2021-11-01' AS Date))
SET IDENTITY_INSERT [dbo].[Devoluciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Editoriales] ON 

INSERT [dbo].[Editoriales] ([Id_Editorial], [Nombre_Editorial]) VALUES (110, N'Montena')
INSERT [dbo].[Editoriales] ([Id_Editorial], [Nombre_Editorial]) VALUES (112, N'Croosbooks')
INSERT [dbo].[Editoriales] ([Id_Editorial], [Nombre_Editorial]) VALUES (114, N'Molino')
INSERT [dbo].[Editoriales] ([Id_Editorial], [Nombre_Editorial]) VALUES (116, N'Alfaguara')
INSERT [dbo].[Editoriales] ([Id_Editorial], [Nombre_Editorial]) VALUES (118, N'Debolsillo')
INSERT [dbo].[Editoriales] ([Id_Editorial], [Nombre_Editorial]) VALUES (120, N'Edelvives')
INSERT [dbo].[Editoriales] ([Id_Editorial], [Nombre_Editorial]) VALUES (122, N'Puck')
INSERT [dbo].[Editoriales] ([Id_Editorial], [Nombre_Editorial]) VALUES (124, N'Plaza&Janes')
INSERT [dbo].[Editoriales] ([Id_Editorial], [Nombre_Editorial]) VALUES (126, N'Salamandra')
INSERT [dbo].[Editoriales] ([Id_Editorial], [Nombre_Editorial]) VALUES (128, N'EditorialHidra')
SET IDENTITY_INSERT [dbo].[Editoriales] OFF
GO
SET IDENTITY_INSERT [dbo].[Estudiantes] ON 

INSERT [dbo].[Estudiantes] ([Id_Estudiante], [Nombre], [Apellido], [Edad]) VALUES (300, N'Luisa Maria', N'Castillo', N'22')
INSERT [dbo].[Estudiantes] ([Id_Estudiante], [Nombre], [Apellido], [Edad]) VALUES (641, N'Camila ', N'Alcantara', N'20')
INSERT [dbo].[Estudiantes] ([Id_Estudiante], [Nombre], [Apellido], [Edad]) VALUES (982, N'Jose', N'Vazquez', N'22')
INSERT [dbo].[Estudiantes] ([Id_Estudiante], [Nombre], [Apellido], [Edad]) VALUES (1323, N'Maribel ', N'Fernandez', N'23')
INSERT [dbo].[Estudiantes] ([Id_Estudiante], [Nombre], [Apellido], [Edad]) VALUES (1664, N'Rosa Del Carmen', N'Mancebo', N'19')
INSERT [dbo].[Estudiantes] ([Id_Estudiante], [Nombre], [Apellido], [Edad]) VALUES (2005, N'Luis Manuel ', N'Solano', N'25')
INSERT [dbo].[Estudiantes] ([Id_Estudiante], [Nombre], [Apellido], [Edad]) VALUES (2346, N'Camilo ', N'Gutierres', N'19')
INSERT [dbo].[Estudiantes] ([Id_Estudiante], [Nombre], [Apellido], [Edad]) VALUES (2687, N'Angelica', N'Mendez', N'27')
INSERT [dbo].[Estudiantes] ([Id_Estudiante], [Nombre], [Apellido], [Edad]) VALUES (3028, N'Alejandra', N'Morillo', N'23')
INSERT [dbo].[Estudiantes] ([Id_Estudiante], [Nombre], [Apellido], [Edad]) VALUES (3369, N'Javier ', N'Duran', N'28')
SET IDENTITY_INSERT [dbo].[Estudiantes] OFF
GO
SET IDENTITY_INSERT [dbo].[Libros] ON 

INSERT [dbo].[Libros] ([Id_Libro], [Nombre_Del_Libro], [Id_Autor], [Id_Editorial], [FechPublicacion]) VALUES (3000, N'Antes de diciembre', 10, 110, CAST(N'2021-11-11' AS Date))
INSERT [dbo].[Libros] ([Id_Libro], [Nombre_Del_Libro], [Id_Autor], [Id_Editorial], [FechPublicacion]) VALUES (3300, N'Mi amor de Wattpad', 11, 112, CAST(N'2022-02-16' AS Date))
INSERT [dbo].[Libros] ([Id_Libro], [Nombre_Del_Libro], [Id_Autor], [Id_Editorial], [FechPublicacion]) VALUES (3600, N'La vuelta al mundo en 80 dias', 12, 114, CAST(N'2019-09-07' AS Date))
INSERT [dbo].[Libros] ([Id_Libro], [Nombre_Del_Libro], [Id_Autor], [Id_Editorial], [FechPublicacion]) VALUES (3900, N'Eleonor y Park', 13, 116, CAST(N'2013-10-23' AS Date))
INSERT [dbo].[Libros] ([Id_Libro], [Nombre_Del_Libro], [Id_Autor], [Id_Editorial], [FechPublicacion]) VALUES (4200, N'Un cuento perfecto', 15, 118, CAST(N'2021-02-18' AS Date))
INSERT [dbo].[Libros] ([Id_Libro], [Nombre_Del_Libro], [Id_Autor], [Id_Editorial], [FechPublicacion]) VALUES (4500, N'Cuentos macabros', 14, 120, CAST(N'2011-10-31' AS Date))
INSERT [dbo].[Libros] ([Id_Libro], [Nombre_Del_Libro], [Id_Autor], [Id_Editorial], [FechPublicacion]) VALUES (4800, N'Caraval', 16, 122, CAST(N'2021-10-05' AS Date))
INSERT [dbo].[Libros] ([Id_Libro], [Nombre_Del_Libro], [Id_Autor], [Id_Editorial], [FechPublicacion]) VALUES (5100, N'Tu mundo y el mio', 17, 124, CAST(N'2021-07-08' AS Date))
INSERT [dbo].[Libros] ([Id_Libro], [Nombre_Del_Libro], [Id_Autor], [Id_Editorial], [FechPublicacion]) VALUES (5400, N'La trenza', 18, 126, CAST(N'2018-08-30' AS Date))
INSERT [dbo].[Libros] ([Id_Libro], [Nombre_Del_Libro], [Id_Autor], [Id_Editorial], [FechPublicacion]) VALUES (5700, N'Sombra y Hueso', 19, 128, CAST(N'2019-11-11' AS Date))
SET IDENTITY_INSERT [dbo].[Libros] OFF
GO
SET IDENTITY_INSERT [dbo].[Prestamos] ON 

INSERT [dbo].[Prestamos] ([Id_Prestamo], [Id_Estudiante], [Id_Libro], [FechPrestamo]) VALUES (3002, 300, 3000, CAST(N'2021-11-26' AS Date))
INSERT [dbo].[Prestamos] ([Id_Prestamo], [Id_Estudiante], [Id_Libro], [FechPrestamo]) VALUES (3004, 641, 3300, CAST(N'2021-09-15' AS Date))
INSERT [dbo].[Prestamos] ([Id_Prestamo], [Id_Estudiante], [Id_Libro], [FechPrestamo]) VALUES (3006, 982, 3600, CAST(N'2021-10-31' AS Date))
INSERT [dbo].[Prestamos] ([Id_Prestamo], [Id_Estudiante], [Id_Libro], [FechPrestamo]) VALUES (3008, 1323, 3900, CAST(N'2021-10-28' AS Date))
INSERT [dbo].[Prestamos] ([Id_Prestamo], [Id_Estudiante], [Id_Libro], [FechPrestamo]) VALUES (3010, 1664, 4200, CAST(N'2021-11-25' AS Date))
INSERT [dbo].[Prestamos] ([Id_Prestamo], [Id_Estudiante], [Id_Libro], [FechPrestamo]) VALUES (3012, 2005, 4500, CAST(N'2021-10-27' AS Date))
INSERT [dbo].[Prestamos] ([Id_Prestamo], [Id_Estudiante], [Id_Libro], [FechPrestamo]) VALUES (3014, 2346, 4800, CAST(N'2021-07-11' AS Date))
INSERT [dbo].[Prestamos] ([Id_Prestamo], [Id_Estudiante], [Id_Libro], [FechPrestamo]) VALUES (3016, 2687, 5100, CAST(N'2021-10-10' AS Date))
INSERT [dbo].[Prestamos] ([Id_Prestamo], [Id_Estudiante], [Id_Libro], [FechPrestamo]) VALUES (3018, 3028, 5400, CAST(N'2021-11-18' AS Date))
INSERT [dbo].[Prestamos] ([Id_Prestamo], [Id_Estudiante], [Id_Libro], [FechPrestamo]) VALUES (3020, 3369, 5700, CAST(N'2021-10-16' AS Date))
SET IDENTITY_INSERT [dbo].[Prestamos] OFF
GO
ALTER TABLE [dbo].[Devoluciones]  WITH CHECK ADD FOREIGN KEY([Id_Prestamo])
REFERENCES [dbo].[Prestamos] ([Id_Prestamo])
GO
ALTER TABLE [dbo].[Libros]  WITH CHECK ADD FOREIGN KEY([Id_Autor])
REFERENCES [dbo].[Autores_Libros] ([Id_Autor])
GO
ALTER TABLE [dbo].[Libros]  WITH CHECK ADD FOREIGN KEY([Id_Editorial])
REFERENCES [dbo].[Editoriales] ([Id_Editorial])
GO
ALTER TABLE [dbo].[Prestamos]  WITH CHECK ADD FOREIGN KEY([Id_Estudiante])
REFERENCES [dbo].[Estudiantes] ([Id_Estudiante])
GO
ALTER TABLE [dbo].[Prestamos]  WITH CHECK ADD FOREIGN KEY([Id_Libro])
REFERENCES [dbo].[Libros] ([Id_Libro])
GO
USE [master]
GO
ALTER DATABASE [Biblioteca] SET  READ_WRITE 
GO
