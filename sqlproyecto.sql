USE [master]
GO
/****** Object:  Database [Hotel1]    Script Date: 12/12/2023 8:53:36 p. m. ******/
CREATE DATABASE [Hotel1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hotel1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Hotel1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hotel1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Hotel1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Hotel1] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hotel1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hotel1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hotel1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hotel1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hotel1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hotel1] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hotel1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hotel1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hotel1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hotel1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hotel1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hotel1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hotel1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hotel1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hotel1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hotel1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Hotel1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hotel1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hotel1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hotel1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hotel1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hotel1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hotel1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hotel1] SET RECOVERY FULL 
GO
ALTER DATABASE [Hotel1] SET  MULTI_USER 
GO
ALTER DATABASE [Hotel1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hotel1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hotel1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hotel1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hotel1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hotel1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Hotel1', N'ON'
GO
ALTER DATABASE [Hotel1] SET QUERY_STORE = ON
GO
ALTER DATABASE [Hotel1] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Hotel1]
GO
/****** Object:  Table [dbo].[Ciudad]    Script Date: 12/12/2023 8:53:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ciudad](
	[Codigo_Ciudad] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Codigo_Dep] [int] NOT NULL,
	[FechaR] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo_Ciudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 12/12/2023 8:53:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Tipo_Doc] [varchar](20) NOT NULL,
	[Nro_Doc_Clie] [int] NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Apellidos] [varchar](30) NOT NULL,
	[F_Nacimiento] [date] NOT NULL,
	[Edad] [int] NOT NULL,
	[Genero] [varchar](20) NULL,
	[Direccion] [varchar](40) NOT NULL,
	[Correo] [varchar](40) NOT NULL,
	[Indicativo_tel] [int] NOT NULL,
	[Telefono] [varchar](15) NOT NULL,
	[Pais_Residencia] [varchar](30) NOT NULL,
	[Cantidad_Huespedes] [int] NOT NULL,
	[FechaR] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Nro_Doc_Clie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 12/12/2023 8:53:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[Codigo_Dep] [int] NOT NULL,
	[Nombre_Dep] [varchar](50) NOT NULL,
	[Codigo_Pais] [int] NOT NULL,
	[FechaR] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo_Dep] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 12/12/2023 8:53:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[Tipo_Documento] [varchar](30) NOT NULL,
	[Nro_Doc_Emp] [int] NOT NULL,
	[Apellidos] [varchar](40) NOT NULL,
	[Emp_Nombre] [varchar](30) NOT NULL,
	[F_Nacimiento] [date] NOT NULL,
	[F_Expedicion] [date] NOT NULL,
	[Lugar_Nacimiento] [varchar](20) NOT NULL,
	[Genero] [varchar](20) NULL,
	[Direccion] [varchar](40) NOT NULL,
	[Correo] [varchar](40) NOT NULL,
	[Indicativo_tel] [int] NULL,
	[Telefono] [varchar](15) NOT NULL,
	[Indicativo_cell] [int] NULL,
	[Celular] [varchar](15) NOT NULL,
	[Cargo] [varchar](50) NOT NULL,
	[Codigo_Rol] [int] NULL,
	[Edad] [int] NULL,
	[FechaR] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Nro_Doc_Emp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 12/12/2023 8:53:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[Nro_Fact] [int] NOT NULL,
	[Clie] [int] NOT NULL,
	[Paq_Seleccionado] [int] NOT NULL,
	[F_Compra] [date] NOT NULL,
	[Reserva] [int] NOT NULL,
	[N_Habitacion] [int] NOT NULL,
	[Cuenta] [varchar](30) NOT NULL,
	[Opcion_Pago] [varchar](20) NOT NULL,
	[Emp] [int] NOT NULL,
	[Subtotal] [varchar](20) NOT NULL,
	[IVA] [varchar](20) NOT NULL,
	[Total] [varchar](20) NOT NULL,
	[FechaR] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Nro_Fact] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habitaciones]    Script Date: 12/12/2023 8:53:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habitaciones](
	[Codigo_Hab] [int] NOT NULL,
	[Tipo_Habitacion] [varchar](30) NOT NULL,
	[F_Ingreso] [date] NOT NULL,
	[F_Salida] [date] NOT NULL,
	[Capacidad] [int] NOT NULL,
	[Precio] [decimal](18, 0) NOT NULL,
	[Estado] [char](20) NOT NULL,
	[Descripcion] [varchar](500) NULL,
	[FechaR] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo_Hab] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 12/12/2023 8:53:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[Codigo_Articulo] [int] NOT NULL,
	[Nomb_Articulo] [varchar](50) NOT NULL,
	[Cant_Articulo] [int] NOT NULL,
	[Desc_Artic] [text] NULL,
	[Precio_Unitario] [decimal](10, 2) NOT NULL,
	[Precio_Total] [decimal](18, 0) NULL,
	[Fecha_Adquisicion] [date] NULL,
	[Fecha_Vencimiento] [date] NULL,
	[Estado] [varchar](20) NULL,
	[Categoria] [varchar](30) NULL,
	[Marca] [varchar](30) NULL,
	[Garantia] [varchar](50) NULL,
	[FechaR] [date] NOT NULL,
	[NIT] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo_Articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 12/12/2023 8:53:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[Codigo_Pais] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[FechaR] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo_Pais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paquete]    Script Date: 12/12/2023 8:53:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paquete](
	[Codigo] [int] NOT NULL,
	[Desc_Paquete] [varchar](500) NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Valor] [int] NOT NULL,
	[FechaR] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permiso]    Script Date: 12/12/2023 8:53:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permiso](
	[Codigo_Per] [int] NOT NULL,
	[Nombre_Per] [varchar](30) NOT NULL,
	[Codigo_Rol] [int] NOT NULL,
	[FechaR] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo_Per] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 12/12/2023 8:53:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[NIT] [int] NOT NULL,
	[Nombre_Prov] [varchar](20) NOT NULL,
	[Correo] [varchar](40) NOT NULL,
	[Direccion] [varchar](40) NOT NULL,
	[ind_tel] [int] NULL,
	[ind_cel] [int] NULL,
	[Celular] [int] NULL,
	[FechaR] [date] NOT NULL,
	[Tipo_Prov] [char](100) NULL,
	[Telefono] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[NIT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservas]    Script Date: 12/12/2023 8:53:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservas](
	[Cod_Reserva] [int] NOT NULL,
	[Nro_Doc_Clie] [int] NOT NULL,
	[F_Reserva] [date] NOT NULL,
	[F_Inicio] [date] NOT NULL,
	[F_Fin] [date] NOT NULL,
	[N_Personas] [int] NOT NULL,
	[V_Total] [int] NOT NULL,
	[Estado] [char](20) NOT NULL,
	[N_Habitacion] [int] NOT NULL,
	[FechaR] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cod_Reserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/12/2023 8:53:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Codigo_Rol] [int] NOT NULL,
	[Tipo] [varchar](40) NOT NULL,
	[Cargo] [varchar](30) NOT NULL,
	[FechaR] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo_Rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicios]    Script Date: 12/12/2023 8:53:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicios](
	[Codigo_Ser] [int] NOT NULL,
	[Nro_Doc_Clie] [int] NOT NULL,
	[Nombre_Ser] [char](50) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[Precio_Total] [decimal](18, 0) NOT NULL,
	[FechaR] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo_Ser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 12/12/2023 8:53:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Usuario] [varchar](30) NOT NULL,
	[Contrasena] [varchar](25) NOT NULL,
	[Codigo_Rol] [int] NULL,
	[FechaR] [date] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ciudad]  WITH CHECK ADD FOREIGN KEY([Codigo_Dep])
REFERENCES [dbo].[Departamento] ([Codigo_Dep])
GO
ALTER TABLE [dbo].[Departamento]  WITH CHECK ADD FOREIGN KEY([Codigo_Pais])
REFERENCES [dbo].[Pais] ([Codigo_Pais])
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD FOREIGN KEY([Codigo_Rol])
REFERENCES [dbo].[Roles] ([Codigo_Rol])
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD FOREIGN KEY([NIT])
REFERENCES [dbo].[Proveedor] ([NIT])
GO
ALTER TABLE [dbo].[Permiso]  WITH CHECK ADD FOREIGN KEY([Codigo_Rol])
REFERENCES [dbo].[Roles] ([Codigo_Rol])
GO
ALTER TABLE [dbo].[Servicios]  WITH CHECK ADD FOREIGN KEY([Nro_Doc_Clie])
REFERENCES [dbo].[Cliente] ([Nro_Doc_Clie])
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([Codigo_Rol])
REFERENCES [dbo].[Roles] ([Codigo_Rol])
GO
USE [master]
GO
ALTER DATABASE [Hotel1] SET  READ_WRITE 
GO
