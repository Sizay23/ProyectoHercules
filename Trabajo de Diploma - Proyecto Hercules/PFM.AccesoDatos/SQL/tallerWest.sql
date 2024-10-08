USE [master]
GO
/****** Object:  Database [tallerWest]    Script Date: 5/3/2024 3:24:42 PM ******/
CREATE DATABASE [tallerWest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tallerWest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\tallerWest.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'tallerWest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\tallerWest_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [tallerWest] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tallerWest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tallerWest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tallerWest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tallerWest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tallerWest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tallerWest] SET ARITHABORT OFF 
GO
ALTER DATABASE [tallerWest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tallerWest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tallerWest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tallerWest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tallerWest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tallerWest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tallerWest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tallerWest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tallerWest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tallerWest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [tallerWest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tallerWest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tallerWest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tallerWest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tallerWest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tallerWest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tallerWest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tallerWest] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [tallerWest] SET  MULTI_USER 
GO
ALTER DATABASE [tallerWest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tallerWest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tallerWest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tallerWest] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [tallerWest] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [tallerWest] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [tallerWest] SET QUERY_STORE = ON
GO
ALTER DATABASE [tallerWest] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [tallerWest]
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 5/3/2024 3:24:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bitacora](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Tipo] [int] NOT NULL,
	[Usuario] [varchar](50) NOT NULL,
	[Mensaje] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Bitacora] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BitacoraTipo]    Script Date: 5/3/2024 3:24:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BitacoraTipo](
	[Code] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_BitacoraTipo] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 5/3/2024 3:24:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[userName] [nchar](10) NOT NULL,
	[password] [nvarchar](15) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SP_BITACORA_AGREGAR]    Script Date: 5/3/2024 3:24:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_BITACORA_AGREGAR]
	@tipo VARCHAR(50),
	@usuario VARCHAR(50),
	@mensaje VARCHAR(255)
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO dbo.Bitacora (fecha, Tipo, Usuario, Mensaje)
	VALUES (GETDATE(), @tipo, @usuario, @mensaje)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_BITACORA_OBTENERFILTRADO]    Script Date: 5/3/2024 3:24:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_BITACORA_OBTENERFILTRADO]
    @total bit = 0,
    @pagina int = 0,
    @porPagina int = 10,
    @usuario nvarchar(50) = NULL,
    @desde datetime = NULL,
    @hasta datetime = NULL,
    @tipo int = NULL,
    @buscar nvarchar(255) = NULL
AS
BEGIN

    SET NOCOUNT ON;

    IF @desde IS NULL 
        SELECT @desde = GETDATE()
    IF @hasta IS NULL 
        SELECT @hasta = GETDATE()

    SELECT @buscar = '%' + ISNULL(@buscar, '') + '%'

    SELECT @pagina = @pagina - 1

    IF @total = 1
    BEGIN
        SELECT 'Pagina' = @pagina + 1,
               'PorPagina' = @porPagina,
               'Total' = COUNT(*),
               'TotalPorPagina' = CEILING(CONVERT(float, COUNT(*)) / CONVERT(float, @porPagina))
        FROM Bitacora a 
        WHERE (a.Usuario = @usuario OR @usuario IS NULL)
              AND CONVERT(date, a.Fecha) BETWEEN CONVERT(date, @desde) AND CONVERT(date, @hasta)
              AND (a.Tipo = @tipo OR @tipo = 3 OR @tipo IS NULL)
              AND 
              (
                  a.Usuario LIKE @buscar
                  OR a.Mensaje LIKE @buscar
              )
    END
    ELSE
    BEGIN
        SELECT *
        FROM
        (
            SELECT ROW_NUMBER() OVER (ORDER BY a.Fecha) AS [Index], 
                   a.Id,
                   a.Usuario,
                   a.Fecha,
                   a.Tipo,
                   a.Mensaje
            FROM Bitacora a 
            WHERE (a.Usuario = @usuario OR @usuario IS NULL)
                  AND CONVERT(date, a.Fecha) BETWEEN CONVERT(date, @desde) AND CONVERT(date, @hasta)
                  AND (a.Tipo = @tipo OR @tipo = 3 OR @tipo IS NULL)
                  AND 
                  (
                      a.Usuario LIKE @buscar
                      OR a.Mensaje LIKE @buscar
                  )
        ) z
        WHERE z.[Index] BETWEEN (@porPagina * @pagina) + 1 AND (@porPagina * @pagina) + @porPagina
    END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_USER_ALTA]    Script Date: 5/3/2024 3:24:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_USER_ALTA]
	@Usuario nvarchar(50),
    @Password nvarchar(32) 
AS
BEGIN
	SET NOCOUNT ON;

    INSERT INTO dbo.Usuario(userName, password)
	values(@usuario, @Password);
END
GO
/****** Object:  StoredProcedure [dbo].[SP_USER_MODIFICAR]    Script Date: 5/3/2024 3:24:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_USER_MODIFICAR]

	@Usuario nvarchar(50),
    @Password nvarchar(32) 
AS
BEGIN

	SET NOCOUNT ON;

	UPDATE dbo.Usuario
    SET Password = @Password
    WHERE Username = @Usuario;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_USER_VALIDAR_PASS]    Script Date: 5/3/2024 3:24:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_USER_VALIDAR_PASS]
    @Usuario nvarchar(20),
    @Password nvarchar(15) 
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Count int;

    SELECT @Count = COUNT(*)
    FROM Usuario
    WHERE userName = @Usuario AND password = @Password;

    SELECT @Count AS 'Count';
END
GO
/****** Object:  StoredProcedure [dbo].[SP_USER_VALIDAR_USUARIO]    Script Date: 5/3/2024 3:24:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_USER_VALIDAR_USUARIO]
    @Usuario NVARCHAR(15)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Count int;
    SELECT @Count = COUNT(*)
    FROM Usuario
    WHERE userName = @Usuario;

    SELECT @Count AS 'Count';
END
GO
USE [master]
GO
ALTER DATABASE [tallerWest] SET  READ_WRITE 
GO
