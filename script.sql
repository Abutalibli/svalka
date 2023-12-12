USE [MFCDB]
GO
/****** Object:  Table [dbo].[FullAdress]    Script Date: 12.12.2023 17:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FullAdress](
	[idFullAdress] [int] IDENTITY(1,1) NOT NULL,
	[NameCity] [varchar](50) NULL,
	[NameStreet] [varchar](50) NULL,
	[HomeNumber] [varchar](50) NULL,
	[Apartment] [varchar](50) NULL,
 CONSTRAINT [PK_FullAdress] PRIMARY KEY CLUSTERED 
(
	[idFullAdress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Passport]    Script Date: 12.12.2023 17:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Passport](
	[IdPassport] [int] IDENTITY(1,1) NOT NULL,
	[Type_of_passport] [varchar](50) NULL,
	[Issued_by] [varchar](100) NULL,
	[PassNumber] [varchar](50) NULL,
 CONSTRAINT [PK_Passport] PRIMARY KEY CLUSTERED 
(
	[IdPassport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registration]    Script Date: 12.12.2023 17:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[IdRegistration] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [varchar](100) NULL,
	[Date_of_Birth] [date] NULL,
	[Place_of_Birth] [int] NULL,
	[Family_status] [varchar](50) NULL,
	[Where_did_come_from] [int] NULL,
	[Passport] [int] NULL,
	[Place_of_discharge] [int] NULL,
	[Registration_date] [date] NULL,
	[Date_of_discharge] [date] NULL,
	[IdWorker] [int] NULL,
 CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED 
(
	[IdRegistration] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Worker]    Script Date: 12.12.2023 17:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Worker](
	[IdWorker] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [varchar](100) NULL,
	[DateOfBirth] [date] NULL,
	[PhoneNumber] [varchar](11) NULL,
 CONSTRAINT [PK_Worker] PRIMARY KEY CLUSTERED 
(
	[IdWorker] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_FullAdress] FOREIGN KEY([Place_of_Birth])
REFERENCES [dbo].[FullAdress] ([idFullAdress])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_FullAdress]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_FullAdress1] FOREIGN KEY([Place_of_discharge])
REFERENCES [dbo].[FullAdress] ([idFullAdress])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_FullAdress1]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Passport] FOREIGN KEY([Passport])
REFERENCES [dbo].[Passport] ([IdPassport])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_Passport]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Worker] FOREIGN KEY([IdWorker])
REFERENCES [dbo].[Worker] ([IdWorker])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_Worker]
GO
