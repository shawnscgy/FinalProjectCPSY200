USE [master]
GO
/****** Object:  Database [VillageRentals]    Script Date: 8/15/2024 11:35:20 PM ******/
CREATE DATABASE [VillageRentals]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VillageRentals', FILENAME = N'C:\Users\shiya\VillageRentals.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VillageRentals_log', FILENAME = N'C:\Users\shiya\VillageRentals_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [VillageRentals] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VillageRentals].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VillageRentals] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VillageRentals] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VillageRentals] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VillageRentals] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VillageRentals] SET ARITHABORT OFF 
GO
ALTER DATABASE [VillageRentals] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VillageRentals] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VillageRentals] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VillageRentals] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VillageRentals] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VillageRentals] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VillageRentals] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VillageRentals] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VillageRentals] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VillageRentals] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VillageRentals] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VillageRentals] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VillageRentals] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VillageRentals] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VillageRentals] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VillageRentals] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VillageRentals] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VillageRentals] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VillageRentals] SET  MULTI_USER 
GO
ALTER DATABASE [VillageRentals] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VillageRentals] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VillageRentals] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VillageRentals] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VillageRentals] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VillageRentals] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [VillageRentals] SET QUERY_STORE = OFF
GO
USE [VillageRentals]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 8/15/2024 11:35:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[categoryid] [int] NOT NULL,
	[category_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[categoryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 8/15/2024 11:35:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[customerid] [int] NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[contact_phone] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[note] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[customerid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipments]    Script Date: 8/15/2024 11:35:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipments](
	[equipmentid] [int] NOT NULL,
	[categoryid] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](50) NOT NULL,
	[daily_rate] [float] NOT NULL,
 CONSTRAINT [PK_Equipments] PRIMARY KEY CLUSTERED 
(
	[equipmentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RentalItems]    Script Date: 8/15/2024 11:35:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentalItems](
	[rentalid] [int] NOT NULL,
	[equipmentid] [int] NOT NULL,
	[rental_date] [int] NULL,
	[return_date] [int] NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[rentalid] ASC,
	[equipmentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rentals]    Script Date: 8/15/2024 11:35:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rentals](
	[rentalid] [int] NOT NULL,
	[customerid] [int] NOT NULL,
	[equipmentid] [int] NOT NULL,
	[date] [int] NULL,
 CONSTRAINT [PK_Rentals] PRIMARY KEY CLUSTERED 
(
	[rentalid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Categories] FOREIGN KEY([categoryid])
REFERENCES [dbo].[Categories] ([categoryid])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Categories]
GO
ALTER TABLE [dbo].[Equipments]  WITH CHECK ADD  CONSTRAINT [FK_Equipments_Equipments] FOREIGN KEY([equipmentid])
REFERENCES [dbo].[Equipments] ([equipmentid])
GO
ALTER TABLE [dbo].[Equipments] CHECK CONSTRAINT [FK_Equipments_Equipments]
GO
ALTER TABLE [dbo].[Rentals]  WITH CHECK ADD  CONSTRAINT [FK_Rentals_Rentals] FOREIGN KEY([rentalid])
REFERENCES [dbo].[Rentals] ([rentalid])
GO
ALTER TABLE [dbo].[Rentals] CHECK CONSTRAINT [FK_Rentals_Rentals]
GO
USE [master]
GO
ALTER DATABASE [VillageRentals] SET  READ_WRITE 
GO
