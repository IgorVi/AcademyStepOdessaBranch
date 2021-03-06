USE [master]
GO
/****** Object:  Database [AcademyStepOdessaBranch]    Script Date: 21.05.2015 0:31:35 ******/
CREATE DATABASE [AcademyStepOdessaBranch]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AcademyStepOdessaBranch', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\AcademyStepOdessaBranch.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AcademyStepOdessaBranch_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\AcademyStepOdessaBranch_log.ldf' , SIZE = 2816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AcademyStepOdessaBranch] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AcademyStepOdessaBranch].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AcademyStepOdessaBranch] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AcademyStepOdessaBranch] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AcademyStepOdessaBranch] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AcademyStepOdessaBranch] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AcademyStepOdessaBranch] SET ARITHABORT OFF 
GO
ALTER DATABASE [AcademyStepOdessaBranch] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AcademyStepOdessaBranch] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [AcademyStepOdessaBranch] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AcademyStepOdessaBranch] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AcademyStepOdessaBranch] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AcademyStepOdessaBranch] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AcademyStepOdessaBranch] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AcademyStepOdessaBranch] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AcademyStepOdessaBranch] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AcademyStepOdessaBranch] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AcademyStepOdessaBranch] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AcademyStepOdessaBranch] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AcademyStepOdessaBranch] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AcademyStepOdessaBranch] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AcademyStepOdessaBranch] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AcademyStepOdessaBranch] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AcademyStepOdessaBranch] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AcademyStepOdessaBranch] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AcademyStepOdessaBranch] SET RECOVERY FULL 
GO
ALTER DATABASE [AcademyStepOdessaBranch] SET  MULTI_USER 
GO
ALTER DATABASE [AcademyStepOdessaBranch] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AcademyStepOdessaBranch] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AcademyStepOdessaBranch] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AcademyStepOdessaBranch] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AcademyStepOdessaBranch', N'ON'
GO
USE [AcademyStepOdessaBranch]
GO
/****** Object:  User [user2015]    Script Date: 21.05.2015 0:31:35 ******/
CREATE USER [user2015] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[user2015]
GO
/****** Object:  Schema [user2015]    Script Date: 21.05.2015 0:31:35 ******/
CREATE SCHEMA [user2015]
GO
/****** Object:  StoredProcedure [dbo].[percentageOfAttendance]    Script Date: 21.05.2015 0:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[percentageOfAttendance]
@numberOfLessons int, @numberOfVisits int
AS

IF @numberOfLessons = 0
	RETURN 0
ELSE
	RETURN @numberOfVisits / (convert (float, @numberOfLessons) / 100)
GO
/****** Object:  Table [dbo].[Aauditorium]    Script Date: 21.05.2015 0:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aauditorium](
	[number] [int] NOT NULL,
	[presenceOfImagesID] [int] NOT NULL,
	[countComputers] [int] NOT NULL,
	[suitableForSteam] [bit] NOT NULL,
	[notes] [text] NULL,
 CONSTRAINT [PK_Aauditorium] PRIMARY KEY CLUSTERED 
(
	[number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Address]    Script Date: 21.05.2015 0:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[addressID] [int] IDENTITY(1,1) NOT NULL,
	[street] [nvarchar](100) NOT NULL,
	[cityID] [int] NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[addressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AssessmentExaminationTasks]    Script Date: 21.05.2015 0:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssessmentExaminationTasks](
	[studentID] [int] NOT NULL,
	[objectID] [int] NOT NULL,
	[teacherID] [int] NOT NULL,
	[assessment] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 21.05.2015 0:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[studentID] [int] NOT NULL,
	[employmentAuditoriumID] [int] NOT NULL,
	[scoreForHomework] [int] NULL,
	[evaluationOfPractice] [int] NULL,
	[present] [bit] NOT NULL,
	[reasonForAbsence] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[City]    Script Date: 21.05.2015 0:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[cityID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[cityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmploymentAuditorium]    Script Date: 21.05.2015 0:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmploymentAuditorium](
	[employmentAuditoriumID] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[tape] [int] NOT NULL,
	[teacherID] [int] NOT NULL,
	[groupID] [int] NOT NULL,
	[auditoriumNumber] [int] NOT NULL,
	[objectID] [int] NOT NULL,
 CONSTRAINT [PK_EmploymentAudiences] PRIMARY KEY CLUSTERED 
(
	[employmentAuditoriumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Flow]    Script Date: 21.05.2015 0:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flow](
	[flowID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Flow] PRIMARY KEY CLUSTERED 
(
	[flowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FormsLearning]    Script Date: 21.05.2015 0:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormsLearning](
	[formLearningID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_formsLearning] PRIMARY KEY CLUSTERED 
(
	[formLearningID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Groups]    Script Date: 21.05.2015 0:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[groupID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[flowID] [int] NOT NULL,
	[formLearningID] [int] NOT NULL,
	[specializationID] [int] NOT NULL,
	[semester] [int] NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[groupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Objects]    Script Date: 21.05.2015 0:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Objects](
	[objectID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NOT NULL,
	[countPair] [int] NULL,
 CONSTRAINT [PK_Objects] PRIMARY KEY CLUSTERED 
(
	[objectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PpresenceOfImages]    Script Date: 21.05.2015 0:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PpresenceOfImages](
	[presenceOfImagesID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Aaudience] PRIMARY KEY CLUSTERED 
(
	[presenceOfImagesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Specialization]    Script Date: 21.05.2015 0:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialization](
	[specializationID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Specialization] PRIMARY KEY CLUSTERED 
(
	[specializationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 21.05.2015 0:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[studentID] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [nvarchar](50) NOT NULL,
	[lastName] [nvarchar](50) NOT NULL,
	[middleName] [nvarchar](50) NOT NULL,
	[age] [int] NOT NULL,
	[phone] [nvarchar](10) NULL,
	[addressID] [int] NULL,
	[photoPath] [nvarchar](255) NULL,
	[note] [text] NULL,
	[login] [nvarchar](50) NOT NULL,
	[grupID] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[studentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 21.05.2015 0:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[teacherID] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [nvarchar](50) NOT NULL,
	[lastName] [nvarchar](50) NOT NULL,
	[middleName] [nvarchar](50) NULL,
	[addressID] [int] NULL,
	[age] [int] NULL,
	[phone] [nvarchar](10) NULL,
	[photoPath] [nvarchar](255) NULL,
	[login] [nvarchar](50) NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[teacherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TeacherItems]    Script Date: 21.05.2015 0:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeacherItems](
	[teacherID] [int] NOT NULL,
	[objectID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[attendanceStudents]    Script Date: 21.05.2015 0:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[attendanceStudents]
AS
SELECT	F.name AS [flow], G.name AS [group], S.firstName + ' ' + S.lastName + ' ' + S.middleName AS [name],
		(SELECT	Count(*)
		FROM	EmploymentAuditorium E
				JOIN Attendance A
				ON E.employmentAuditoriumID = A.employmentAuditoriumID
		WHERE	A.present = 1 AND A.studentID = S.studentID
		) AS [count]
FROM	Student S JOIN Groups G
		ON S.grupID = G.groupID
		JOIN Flow F
		ON F.flowID = G.flowID
GO
/****** Object:  View [dbo].[numberOfLessonsForGroups]    Script Date: 21.05.2015 0:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[numberOfLessonsForGroups]
AS
SELECT	G.name AS name, (SELECT	Count(*)
				FROM	EmploymentAuditorium
				WHERE	groupID = G.groupID
				) AS [count]
FROM	Groups G

GO
/****** Object:  View [dbo].[numberOfLessonsForGroups2]    Script Date: 21.05.2015 0:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--DECLARE @nameFlow nvarchar(50)
--SET @nameFlow = 'весна 2014'
CREATE VIEW [dbo].[numberOfLessonsForGroups2]
AS

SELECT	flow AS [Поток], [group] AS [Група], name AS [Студент],
		[count] AS [Количество посищений],
		(
		SELECT	[count]
		FROM	numberOfLessonsForGroups
		WHERE	name = attendanceStudents.[group]
		) AS [Всего занятий]
FROM	attendanceStudents
--WHERE	flow = @nameFlow
GO
INSERT [dbo].[Aauditorium] ([number], [presenceOfImagesID], [countComputers], [suitableForSteam], [notes]) VALUES (102, 1, 8, 1, NULL)
INSERT [dbo].[Aauditorium] ([number], [presenceOfImagesID], [countComputers], [suitableForSteam], [notes]) VALUES (103, 2, 10, 1, NULL)
INSERT [dbo].[Aauditorium] ([number], [presenceOfImagesID], [countComputers], [suitableForSteam], [notes]) VALUES (108, 3, 11, 1, NULL)
INSERT [dbo].[Aauditorium] ([number], [presenceOfImagesID], [countComputers], [suitableForSteam], [notes]) VALUES (110, 3, 9, 1, NULL)
INSERT [dbo].[Aauditorium] ([number], [presenceOfImagesID], [countComputers], [suitableForSteam], [notes]) VALUES (201, 2, 6, 1, NULL)
INSERT [dbo].[Aauditorium] ([number], [presenceOfImagesID], [countComputers], [suitableForSteam], [notes]) VALUES (203, 3, 15, 1, NULL)
INSERT [dbo].[Aauditorium] ([number], [presenceOfImagesID], [countComputers], [suitableForSteam], [notes]) VALUES (204, 3, 12, 1, NULL)
INSERT [dbo].[Aauditorium] ([number], [presenceOfImagesID], [countComputers], [suitableForSteam], [notes]) VALUES (205, 3, 13, 1, NULL)
INSERT [dbo].[Aauditorium] ([number], [presenceOfImagesID], [countComputers], [suitableForSteam], [notes]) VALUES (206, 3, 10, 1, NULL)
INSERT [dbo].[Aauditorium] ([number], [presenceOfImagesID], [countComputers], [suitableForSteam], [notes]) VALUES (207, 3, 9, 1, NULL)
INSERT [dbo].[Aauditorium] ([number], [presenceOfImagesID], [countComputers], [suitableForSteam], [notes]) VALUES (208, 3, 8, 1, NULL)
INSERT [dbo].[Aauditorium] ([number], [presenceOfImagesID], [countComputers], [suitableForSteam], [notes]) VALUES (209, 1, 14, 1, NULL)
INSERT [dbo].[Aauditorium] ([number], [presenceOfImagesID], [countComputers], [suitableForSteam], [notes]) VALUES (210, 3, 13, 1, NULL)
INSERT [dbo].[Aauditorium] ([number], [presenceOfImagesID], [countComputers], [suitableForSteam], [notes]) VALUES (211, 2, 7, 1, NULL)
INSERT [dbo].[Aauditorium] ([number], [presenceOfImagesID], [countComputers], [suitableForSteam], [notes]) VALUES (212, 2, 9, 1, NULL)
INSERT [dbo].[Aauditorium] ([number], [presenceOfImagesID], [countComputers], [suitableForSteam], [notes]) VALUES (214, 4, 1, 1, NULL)
INSERT [dbo].[Aauditorium] ([number], [presenceOfImagesID], [countComputers], [suitableForSteam], [notes]) VALUES (216, 3, 12, 1, NULL)
INSERT [dbo].[Aauditorium] ([number], [presenceOfImagesID], [countComputers], [suitableForSteam], [notes]) VALUES (217, 2, 10, 0, NULL)
INSERT [dbo].[Aauditorium] ([number], [presenceOfImagesID], [countComputers], [suitableForSteam], [notes]) VALUES (218, 1, 8, 0, NULL)
INSERT [dbo].[Aauditorium] ([number], [presenceOfImagesID], [countComputers], [suitableForSteam], [notes]) VALUES (219, 3, 9, 1, NULL)
INSERT [dbo].[Aauditorium] ([number], [presenceOfImagesID], [countComputers], [suitableForSteam], [notes]) VALUES (220, 3, 15, 1, NULL)
INSERT [dbo].[Aauditorium] ([number], [presenceOfImagesID], [countComputers], [suitableForSteam], [notes]) VALUES (221, 2, 15, 1, NULL)
INSERT [dbo].[Aauditorium] ([number], [presenceOfImagesID], [countComputers], [suitableForSteam], [notes]) VALUES (301, 1, 16, 1, NULL)
INSERT [dbo].[Aauditorium] ([number], [presenceOfImagesID], [countComputers], [suitableForSteam], [notes]) VALUES (302, 1, 14, 1, NULL)
INSERT [dbo].[Aauditorium] ([number], [presenceOfImagesID], [countComputers], [suitableForSteam], [notes]) VALUES (304, 3, 9, 1, NULL)
INSERT [dbo].[Aauditorium] ([number], [presenceOfImagesID], [countComputers], [suitableForSteam], [notes]) VALUES (305, 3, 10, 1, NULL)
INSERT [dbo].[Aauditorium] ([number], [presenceOfImagesID], [countComputers], [suitableForSteam], [notes]) VALUES (307, 1, 8, 0, NULL)
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([addressID], [street], [cityID]) VALUES (1, N'Пироговская', 1)
INSERT [dbo].[Address] ([addressID], [street], [cityID]) VALUES (2, N'Дальницкая, 27', 1)
INSERT [dbo].[Address] ([addressID], [street], [cityID]) VALUES (3, N'Космонавтов, 24', 1)
INSERT [dbo].[Address] ([addressID], [street], [cityID]) VALUES (4, N'Китобойный 1-й переулок, 14', 1)
INSERT [dbo].[Address] ([addressID], [street], [cityID]) VALUES (5, N'Юннатов 2-й переулок, 3', 1)
INSERT [dbo].[Address] ([addressID], [street], [cityID]) VALUES (6, N'Валентины Терешковой, 14', 1)
INSERT [dbo].[Address] ([addressID], [street], [cityID]) VALUES (7, N'Генерала Петрова, 70', 1)
INSERT [dbo].[Address] ([addressID], [street], [cityID]) VALUES (8, N'Софьи Перовской, 24', 1)
INSERT [dbo].[Address] ([addressID], [street], [cityID]) VALUES (9, N'Гайдара, 41', 1)
INSERT [dbo].[Address] ([addressID], [street], [cityID]) VALUES (10, N'Бориса Деревянко площадь, 1', 1)
INSERT [dbo].[Address] ([addressID], [street], [cityID]) VALUES (11, N'Пшеничная, 2', 1)
INSERT [dbo].[Address] ([addressID], [street], [cityID]) VALUES (12, N'Академика Филатова, 92', 1)
INSERT [dbo].[Address] ([addressID], [street], [cityID]) VALUES (13, N'Бреуса, 11', 1)
INSERT [dbo].[Address] ([addressID], [street], [cityID]) VALUES (14, N'Сегедская, 12', 1)
INSERT [dbo].[Address] ([addressID], [street], [cityID]) VALUES (15, N'Радужная, 31', 1)
INSERT [dbo].[Address] ([addressID], [street], [cityID]) VALUES (16, N'Щорса, 90', 1)
INSERT [dbo].[Address] ([addressID], [street], [cityID]) VALUES (17, N'Комитетская, 10а', 1)
INSERT [dbo].[Address] ([addressID], [street], [cityID]) VALUES (18, N'Средняя, 36', 1)
INSERT [dbo].[Address] ([addressID], [street], [cityID]) VALUES (19, N'Бугаёвская, 39', 1)
INSERT [dbo].[Address] ([addressID], [street], [cityID]) VALUES (20, N'Пестеля, 55', 1)
INSERT [dbo].[Address] ([addressID], [street], [cityID]) VALUES (21, N'Профессора Коровицкого, 100', 1)
INSERT [dbo].[Address] ([addressID], [street], [cityID]) VALUES (22, N'Хуторская, 45', 1)
INSERT [dbo].[Address] ([addressID], [street], [cityID]) VALUES (23, N'Дворянская, 12', 1)
INSERT [dbo].[Address] ([addressID], [street], [cityID]) VALUES (24, N'Нежинская, 35', 1)
INSERT [dbo].[Address] ([addressID], [street], [cityID]) VALUES (25, N'Черноморского Казачества, 3', 1)
INSERT [dbo].[Address] ([addressID], [street], [cityID]) VALUES (26, N'Долинская, 12', 1)
INSERT [dbo].[Address] ([addressID], [street], [cityID]) VALUES (27, N'Николаевская дорога, 189а', 1)
INSERT [dbo].[Address] ([addressID], [street], [cityID]) VALUES (28, N'Атамана Головатого, 50', 1)
INSERT [dbo].[Address] ([addressID], [street], [cityID]) VALUES (29, N'Неждановой, 58а', 1)
INSERT [dbo].[Address] ([addressID], [street], [cityID]) VALUES (30, N'Котляревского, 4', 1)
INSERT [dbo].[Address] ([addressID], [street], [cityID]) VALUES (31, N'Химическая, 180', 1)
INSERT [dbo].[Address] ([addressID], [street], [cityID]) VALUES (32, N'Клиновая, 21', 1)
INSERT [dbo].[Address] ([addressID], [street], [cityID]) VALUES (33, N'Гагарина переулок, 4', 1)
INSERT [dbo].[Address] ([addressID], [street], [cityID]) VALUES (34, N'Одинцова, 19', 1)
INSERT [dbo].[Address] ([addressID], [street], [cityID]) VALUES (35, N'Цветочный переулок, 5', 1)
INSERT [dbo].[Address] ([addressID], [street], [cityID]) VALUES (36, N'Октябрьской Революции, 38', 1)
SET IDENTITY_INSERT [dbo].[Address] OFF
INSERT [dbo].[AssessmentExaminationTasks] ([studentID], [objectID], [teacherID], [assessment]) VALUES (17, 1, 6, 9)
INSERT [dbo].[AssessmentExaminationTasks] ([studentID], [objectID], [teacherID], [assessment]) VALUES (18, 1, 6, 10)
INSERT [dbo].[AssessmentExaminationTasks] ([studentID], [objectID], [teacherID], [assessment]) VALUES (19, 1, 6, 8)
INSERT [dbo].[AssessmentExaminationTasks] ([studentID], [objectID], [teacherID], [assessment]) VALUES (20, 1, 6, 11)
INSERT [dbo].[AssessmentExaminationTasks] ([studentID], [objectID], [teacherID], [assessment]) VALUES (21, 1, 6, 10)
INSERT [dbo].[AssessmentExaminationTasks] ([studentID], [objectID], [teacherID], [assessment]) VALUES (22, 1, 6, 10)
INSERT [dbo].[AssessmentExaminationTasks] ([studentID], [objectID], [teacherID], [assessment]) VALUES (23, 1, 6, 9)
INSERT [dbo].[AssessmentExaminationTasks] ([studentID], [objectID], [teacherID], [assessment]) VALUES (24, 1, 6, 11)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (17, 7, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (17, 8, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (17, 9, NULL, 9, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (17, 10, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (17, 11, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (17, 12, 10, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (17, 13, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (17, 14, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (17, 15, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (17, 16, NULL, NULL, 0, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (17, 17, 7, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (17, 18, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (17, 19, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (17, 20, NULL, 10, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (17, 22, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (17, 23, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (17, 24, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (17, 25, NULL, 6, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (17, 26, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (17, 27, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (17, 28, 9, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (17, 29, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (17, 30, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (17, 31, NULL, 11, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (17, 32, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (17, 33, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (17, 34, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (18, 7, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (18, 8, 8, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (18, 9, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (18, 10, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (18, 11, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (18, 12, NULL, 10, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (18, 13, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (18, 14, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (18, 15, 7, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (18, 16, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (18, 17, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (18, 18, NULL, NULL, 0, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (18, 19, NULL, 11, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (18, 20, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (18, 22, 10, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (18, 23, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (18, 24, NULL, 11, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (18, 25, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (18, 26, NULL, NULL, 0, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (18, 27, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (18, 28, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (18, 29, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (18, 30, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (18, 31, 9, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (18, 32, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (18, 33, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (18, 34, NULL, 9, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (19, 7, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (19, 8, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (19, 9, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (19, 10, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (19, 11, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (19, 12, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (19, 13, 9, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (19, 14, NULL, NULL, 0, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (19, 15, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (19, 16, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (19, 17, NULL, 11, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (19, 18, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (19, 19, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (19, 20, NULL, NULL, 0, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (19, 22, 8, 9, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (19, 23, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (19, 24, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (19, 25, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (19, 26, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (19, 27, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (19, 28, NULL, 8, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (19, 29, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (19, 30, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (19, 31, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (19, 32, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (19, 33, 9, NULL, 0, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (19, 34, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (20, 7, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (20, 8, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (20, 9, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (20, 10, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (20, 11, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (20, 12, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (20, 13, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (20, 14, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (20, 15, 12, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (20, 16, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (20, 17, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (20, 18, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (20, 19, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (20, 20, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (20, 22, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (20, 23, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (20, 24, NULL, 12, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (20, 25, 11, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (20, 26, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (20, 27, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (20, 28, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (20, 29, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (20, 30, NULL, 11, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (20, 31, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (20, 32, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (20, 33, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (20, 34, NULL, 10, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (23, 7, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (23, 8, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (23, 9, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (23, 10, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (23, 11, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (23, 12, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (23, 13, NULL, NULL, 0, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (23, 14, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (23, 15, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (23, 16, NULL, NULL, 0, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (23, 17, NULL, 7, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (23, 18, NULL, NULL, 0, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (23, 19, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (23, 20, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (23, 22, 7, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (23, 23, NULL, NULL, 0, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (23, 24, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (23, 25, NULL, 8, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (23, 26, NULL, NULL, 0, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (23, 27, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (23, 28, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (23, 29, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (23, 30, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (23, 31, 9, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (23, 32, NULL, NULL, 0, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (23, 33, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (23, 34, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (24, 7, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (24, 8, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (24, 9, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (24, 10, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (24, 11, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (24, 12, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (24, 13, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (24, 14, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (24, 15, 10, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (24, 16, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (24, 17, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (24, 18, NULL, 9, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (24, 19, NULL, NULL, 0, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (24, 20, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (24, 22, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (24, 23, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (24, 24, 7, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (24, 25, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (24, 26, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (24, 27, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (24, 28, NULL, NULL, 0, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (24, 29, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (24, 30, 8, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (24, 31, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (24, 32, NULL, NULL, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (24, 33, NULL, 10, 1, NULL)
INSERT [dbo].[Attendance] ([studentID], [employmentAuditoriumID], [scoreForHomework], [evaluationOfPractice], [present], [reasonForAbsence]) VALUES (24, 34, NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([cityID], [name]) VALUES (1, N'Одесса')
INSERT [dbo].[City] ([cityID], [name]) VALUES (2, N'Киев')
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[EmploymentAuditorium] ON 

INSERT [dbo].[EmploymentAuditorium] ([employmentAuditoriumID], [date], [tape], [teacherID], [groupID], [auditoriumNumber], [objectID]) VALUES (7, CAST(0x1A3A0B00 AS Date), 7, 6, 3, 102, 1)
INSERT [dbo].[EmploymentAuditorium] ([employmentAuditoriumID], [date], [tape], [teacherID], [groupID], [auditoriumNumber], [objectID]) VALUES (8, CAST(0x1C3A0B00 AS Date), 7, 6, 3, 102, 1)
INSERT [dbo].[EmploymentAuditorium] ([employmentAuditoriumID], [date], [tape], [teacherID], [groupID], [auditoriumNumber], [objectID]) VALUES (9, CAST(0x1E3A0B00 AS Date), 7, 6, 3, 102, 1)
INSERT [dbo].[EmploymentAuditorium] ([employmentAuditoriumID], [date], [tape], [teacherID], [groupID], [auditoriumNumber], [objectID]) VALUES (10, CAST(0x213A0B00 AS Date), 7, 6, 3, 102, 1)
INSERT [dbo].[EmploymentAuditorium] ([employmentAuditoriumID], [date], [tape], [teacherID], [groupID], [auditoriumNumber], [objectID]) VALUES (11, CAST(0x233A0B00 AS Date), 7, 6, 3, 102, 1)
INSERT [dbo].[EmploymentAuditorium] ([employmentAuditoriumID], [date], [tape], [teacherID], [groupID], [auditoriumNumber], [objectID]) VALUES (12, CAST(0x253A0B00 AS Date), 7, 6, 3, 102, 1)
INSERT [dbo].[EmploymentAuditorium] ([employmentAuditoriumID], [date], [tape], [teacherID], [groupID], [auditoriumNumber], [objectID]) VALUES (13, CAST(0x293A0B00 AS Date), 7, 6, 3, 102, 1)
INSERT [dbo].[EmploymentAuditorium] ([employmentAuditoriumID], [date], [tape], [teacherID], [groupID], [auditoriumNumber], [objectID]) VALUES (14, CAST(0x2B3A0B00 AS Date), 7, 6, 3, 102, 1)
INSERT [dbo].[EmploymentAuditorium] ([employmentAuditoriumID], [date], [tape], [teacherID], [groupID], [auditoriumNumber], [objectID]) VALUES (15, CAST(0x303A0B00 AS Date), 7, 6, 3, 102, 1)
INSERT [dbo].[EmploymentAuditorium] ([employmentAuditoriumID], [date], [tape], [teacherID], [groupID], [auditoriumNumber], [objectID]) VALUES (16, CAST(0x323A0B00 AS Date), 7, 6, 3, 102, 1)
INSERT [dbo].[EmploymentAuditorium] ([employmentAuditoriumID], [date], [tape], [teacherID], [groupID], [auditoriumNumber], [objectID]) VALUES (17, CAST(0x373A0B00 AS Date), 7, 6, 3, 102, 1)
INSERT [dbo].[EmploymentAuditorium] ([employmentAuditoriumID], [date], [tape], [teacherID], [groupID], [auditoriumNumber], [objectID]) VALUES (18, CAST(0x393A0B00 AS Date), 7, 6, 3, 102, 1)
INSERT [dbo].[EmploymentAuditorium] ([employmentAuditoriumID], [date], [tape], [teacherID], [groupID], [auditoriumNumber], [objectID]) VALUES (19, CAST(0x3E3A0B00 AS Date), 7, 6, 3, 102, 1)
INSERT [dbo].[EmploymentAuditorium] ([employmentAuditoriumID], [date], [tape], [teacherID], [groupID], [auditoriumNumber], [objectID]) VALUES (20, CAST(0x403A0B00 AS Date), 7, 6, 3, 102, 1)
INSERT [dbo].[EmploymentAuditorium] ([employmentAuditoriumID], [date], [tape], [teacherID], [groupID], [auditoriumNumber], [objectID]) VALUES (22, CAST(0x393A0B00 AS Date), 7, 3, 3, 204, 3)
INSERT [dbo].[EmploymentAuditorium] ([employmentAuditoriumID], [date], [tape], [teacherID], [groupID], [auditoriumNumber], [objectID]) VALUES (23, CAST(0x3B3A0B00 AS Date), 7, 3, 3, 204, 3)
INSERT [dbo].[EmploymentAuditorium] ([employmentAuditoriumID], [date], [tape], [teacherID], [groupID], [auditoriumNumber], [objectID]) VALUES (24, CAST(0x3D3A0B00 AS Date), 7, 3, 3, 204, 3)
INSERT [dbo].[EmploymentAuditorium] ([employmentAuditoriumID], [date], [tape], [teacherID], [groupID], [auditoriumNumber], [objectID]) VALUES (25, CAST(0x403A0B00 AS Date), 7, 3, 3, 204, 3)
INSERT [dbo].[EmploymentAuditorium] ([employmentAuditoriumID], [date], [tape], [teacherID], [groupID], [auditoriumNumber], [objectID]) VALUES (26, CAST(0x063A0B00 AS Date), 7, 3, 3, 204, 3)
INSERT [dbo].[EmploymentAuditorium] ([employmentAuditoriumID], [date], [tape], [teacherID], [groupID], [auditoriumNumber], [objectID]) VALUES (27, CAST(0x083A0B00 AS Date), 7, 3, 3, 204, 3)
INSERT [dbo].[EmploymentAuditorium] ([employmentAuditoriumID], [date], [tape], [teacherID], [groupID], [auditoriumNumber], [objectID]) VALUES (28, CAST(0x0C3A0B00 AS Date), 7, 3, 3, 204, 3)
INSERT [dbo].[EmploymentAuditorium] ([employmentAuditoriumID], [date], [tape], [teacherID], [groupID], [auditoriumNumber], [objectID]) VALUES (29, CAST(0x0E3A0B00 AS Date), 7, 3, 3, 204, 3)
INSERT [dbo].[EmploymentAuditorium] ([employmentAuditoriumID], [date], [tape], [teacherID], [groupID], [auditoriumNumber], [objectID]) VALUES (30, CAST(0x133A0B00 AS Date), 7, 3, 3, 204, 3)
INSERT [dbo].[EmploymentAuditorium] ([employmentAuditoriumID], [date], [tape], [teacherID], [groupID], [auditoriumNumber], [objectID]) VALUES (31, CAST(0x153A0B00 AS Date), 7, 3, 3, 204, 3)
INSERT [dbo].[EmploymentAuditorium] ([employmentAuditoriumID], [date], [tape], [teacherID], [groupID], [auditoriumNumber], [objectID]) VALUES (32, CAST(0x1A3A0B00 AS Date), 7, 3, 3, 204, 3)
INSERT [dbo].[EmploymentAuditorium] ([employmentAuditoriumID], [date], [tape], [teacherID], [groupID], [auditoriumNumber], [objectID]) VALUES (33, CAST(0x1C3A0B00 AS Date), 7, 3, 3, 204, 3)
INSERT [dbo].[EmploymentAuditorium] ([employmentAuditoriumID], [date], [tape], [teacherID], [groupID], [auditoriumNumber], [objectID]) VALUES (34, CAST(0x213A0B00 AS Date), 7, 3, 3, 204, 3)
SET IDENTITY_INSERT [dbo].[EmploymentAuditorium] OFF
SET IDENTITY_INSERT [dbo].[Flow] ON 

INSERT [dbo].[Flow] ([flowID], [name]) VALUES (1, N'осень 2013')
INSERT [dbo].[Flow] ([flowID], [name]) VALUES (2, N'весна 2014')
INSERT [dbo].[Flow] ([flowID], [name]) VALUES (3, N'осень 2014')
INSERT [dbo].[Flow] ([flowID], [name]) VALUES (4, N'весна 2015')
INSERT [dbo].[Flow] ([flowID], [name]) VALUES (5, N'осень 2015')
SET IDENTITY_INSERT [dbo].[Flow] OFF
SET IDENTITY_INSERT [dbo].[FormsLearning] ON 

INSERT [dbo].[FormsLearning] ([formLearningID], [name]) VALUES (1, N'стационар')
INSERT [dbo].[FormsLearning] ([formLearningID], [name]) VALUES (2, N'полустационар')
INSERT [dbo].[FormsLearning] ([formLearningID], [name]) VALUES (3, N'годичные курсы')
INSERT [dbo].[FormsLearning] ([formLearningID], [name]) VALUES (4, N'малая академия')
INSERT [dbo].[FormsLearning] ([formLearningID], [name]) VALUES (5, N'воскресная школа')
INSERT [dbo].[FormsLearning] ([formLearningID], [name]) VALUES (6, N'индивидуальные курсы')
INSERT [dbo].[FormsLearning] ([formLearningID], [name]) VALUES (7, N'корпоративные курсы')
SET IDENTITY_INSERT [dbo].[FormsLearning] OFF
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([groupID], [name], [flowID], [formLearningID], [specializationID], [semester]) VALUES (1, N'СПУ-1221', 1, 1, 2, NULL)
INSERT [dbo].[Groups] ([groupID], [name], [flowID], [formLearningID], [specializationID], [semester]) VALUES (2, N'ЕКО-13-П1', 2, 1, 2, NULL)
INSERT [dbo].[Groups] ([groupID], [name], [flowID], [formLearningID], [specializationID], [semester]) VALUES (3, N'БПВ-1411', 2, 1, 2, NULL)
INSERT [dbo].[Groups] ([groupID], [name], [flowID], [formLearningID], [specializationID], [semester]) VALUES (4, N'БПВ-1412', 2, 1, 2, NULL)
SET IDENTITY_INSERT [dbo].[Groups] OFF
SET IDENTITY_INSERT [dbo].[Objects] ON 

INSERT [dbo].[Objects] ([objectID], [name], [countPair]) VALUES (1, N'Cisco ITE1 + Hardware', 55)
INSERT [dbo].[Objects] ([objectID], [name], [countPair]) VALUES (2, N'Cisco ITE2 + Архитектура ОС', 60)
INSERT [dbo].[Objects] ([objectID], [name], [countPair]) VALUES (3, N'Программирование на языке С', 92)
INSERT [dbo].[Objects] ([objectID], [name], [countPair]) VALUES (4, N'Объектно-ориентированное программирование с использованием языка C++
', 72)
INSERT [dbo].[Objects] ([objectID], [name], [countPair]) VALUES (5, N'Разработка Windows приложений с использованием Visual C++ и WinAPI', 64)
INSERT [dbo].[Objects] ([objectID], [name], [countPair]) VALUES (6, N'Платформа Microsoft .NET и язык программирования C#
', 50)
INSERT [dbo].[Objects] ([objectID], [name], [countPair]) VALUES (7, N'Основы разработки приложений с использованием Windows Forms
5', 40)
INSERT [dbo].[Objects] ([objectID], [name], [countPair]) VALUES (8, N'Разработка приложений с использованием WPF', 30)
INSERT [dbo].[Objects] ([objectID], [name], [countPair]) VALUES (9, N'Теория баз данных', 20)
INSERT [dbo].[Objects] ([objectID], [name], [countPair]) VALUES (10, N'Программирование и администрирование СУБД MS SQL Server
', 40)
INSERT [dbo].[Objects] ([objectID], [name], [countPair]) VALUES (11, N'Технология доступа к базам данных ADO.NET', 20)
INSERT [dbo].[Objects] ([objectID], [name], [countPair]) VALUES (12, N'Системное программирование', 30)
INSERT [dbo].[Objects] ([objectID], [name], [countPair]) VALUES (13, N'Сетевое программирование', 20)
INSERT [dbo].[Objects] ([objectID], [name], [countPair]) VALUES (14, N'Разработка приложений с использованием WСF', 20)
INSERT [dbo].[Objects] ([objectID], [name], [countPair]) VALUES (15, N'Объектно-ориентированное проектирование.Язык UML', 20)
INSERT [dbo].[Objects] ([objectID], [name], [countPair]) VALUES (16, N'Паттерны проектирования', 20)
INSERT [dbo].[Objects] ([objectID], [name], [countPair]) VALUES (17, N'Курсовой проект по .NET Framework', 10)
INSERT [dbo].[Objects] ([objectID], [name], [countPair]) VALUES (18, N'Управление программными проектами', 30)
INSERT [dbo].[Objects] ([objectID], [name], [countPair]) VALUES (19, N'Тестирование ПО', 20)
INSERT [dbo].[Objects] ([objectID], [name], [countPair]) VALUES (20, N'Командный проект', 20)
INSERT [dbo].[Objects] ([objectID], [name], [countPair]) VALUES (21, N'Разработка веб-страниц на языке разметки HTML5 с использованием каскадных таблиц стилей CSS3', 24)
INSERT [dbo].[Objects] ([objectID], [name], [countPair]) VALUES (22, N'Язык сценариев Javascript', 30)
INSERT [dbo].[Objects] ([objectID], [name], [countPair]) VALUES (23, N'Разработка веб-приложений с использованием технологий ASP.NET и AJAX', 10)
INSERT [dbo].[Objects] ([objectID], [name], [countPair]) VALUES (24, N'Использование Windows Azure при разработке приложений', 10)
INSERT [dbo].[Objects] ([objectID], [name], [countPair]) VALUES (25, N'Создание web–приложений, исполняемых на стороне сервера при помощи языка программирования PHP,СУБД MySQL и технологии Ajax', 30)
INSERT [dbo].[Objects] ([objectID], [name], [countPair]) VALUES (26, N'Курсовой проект по веб-программированию', 10)
INSERT [dbo].[Objects] ([objectID], [name], [countPair]) VALUES (27, N'Программирование СУБД Oracle', 30)
INSERT [dbo].[Objects] ([objectID], [name], [countPair]) VALUES (28, N'Программирование с использованием технологии Java и СУБД', 70)
INSERT [dbo].[Objects] ([objectID], [name], [countPair]) VALUES (29, N'Курсовая по Java', 10)
INSERT [dbo].[Objects] ([objectID], [name], [countPair]) VALUES (30, N'Программирование мобильных приложений под платформу Android', 40)
SET IDENTITY_INSERT [dbo].[Objects] OFF
SET IDENTITY_INSERT [dbo].[PpresenceOfImages] ON 

INSERT [dbo].[PpresenceOfImages] ([presenceOfImagesID], [name]) VALUES (1, N'дизайнерская')
INSERT [dbo].[PpresenceOfImages] ([presenceOfImagesID], [name]) VALUES (2, N'админская')
INSERT [dbo].[PpresenceOfImages] ([presenceOfImagesID], [name]) VALUES (3, N'программерская')
INSERT [dbo].[PpresenceOfImages] ([presenceOfImagesID], [name]) VALUES (4, N'конференц-зал')
SET IDENTITY_INSERT [dbo].[PpresenceOfImages] OFF
SET IDENTITY_INSERT [dbo].[Specialization] ON 

INSERT [dbo].[Specialization] ([specializationID], [name]) VALUES (1, N'базовый семестр')
INSERT [dbo].[Specialization] ([specializationID], [name]) VALUES (2, N'программирование')
INSERT [dbo].[Specialization] ([specializationID], [name]) VALUES (3, N'администрирование')
INSERT [dbo].[Specialization] ([specializationID], [name]) VALUES (4, N'дизайн')
SET IDENTITY_INSERT [dbo].[Specialization] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([studentID], [firstName], [lastName], [middleName], [age], [phone], [addressID], [photoPath], [note], [login], [grupID]) VALUES (1, N'Вячеслав', N'Зезик', N'Г.', 23, N'093*******', 1, NULL, NULL, N'VyacheslavZezik', 4)
INSERT [dbo].[Student] ([studentID], [firstName], [lastName], [middleName], [age], [phone], [addressID], [photoPath], [note], [login], [grupID]) VALUES (2, N'Ольга', N'Мантуляк', N'П.', 21, N'093*******', 2, NULL, NULL, N'OlgaMantulyak', 4)
INSERT [dbo].[Student] ([studentID], [firstName], [lastName], [middleName], [age], [phone], [addressID], [photoPath], [note], [login], [grupID]) VALUES (3, N'Ольга', N'Хренова', N'Л.', 18, N'093*******', 3, NULL, NULL, N'OlgaKhrenova', 4)
INSERT [dbo].[Student] ([studentID], [firstName], [lastName], [middleName], [age], [phone], [addressID], [photoPath], [note], [login], [grupID]) VALUES (4, N'Ольга', N'Медведева', N'С.', 25, N'093*******', 4, NULL, NULL, N'OlgaMedvedev', 4)
INSERT [dbo].[Student] ([studentID], [firstName], [lastName], [middleName], [age], [phone], [addressID], [photoPath], [note], [login], [grupID]) VALUES (5, N'Галина', N'Инащенко', N'И.', 24, N'093*******', 5, NULL, NULL, N'GalinaInaschenko', 4)
INSERT [dbo].[Student] ([studentID], [firstName], [lastName], [middleName], [age], [phone], [addressID], [photoPath], [note], [login], [grupID]) VALUES (6, N'Юрий', N'Минае', N'В.', 27, N'093*******', 6, NULL, NULL, N'YuriMinae', 4)
INSERT [dbo].[Student] ([studentID], [firstName], [lastName], [middleName], [age], [phone], [addressID], [photoPath], [note], [login], [grupID]) VALUES (7, N'Юрий', N'Домовесов', N'Н.', 30, N'093*******', 7, NULL, NULL, N'YuriDomovesov', 4)
INSERT [dbo].[Student] ([studentID], [firstName], [lastName], [middleName], [age], [phone], [addressID], [photoPath], [note], [login], [grupID]) VALUES (8, N'Руслан', N'Ярмолович', N'И.', 29, N'093*******', 8, NULL, NULL, N'RuslanYarmolovich', 4)
INSERT [dbo].[Student] ([studentID], [firstName], [lastName], [middleName], [age], [phone], [addressID], [photoPath], [note], [login], [grupID]) VALUES (9, N'Игорь', N'Удовик', N'Н.', 24, N'093*******', 9, NULL, NULL, N'IgorUdovik', 2)
INSERT [dbo].[Student] ([studentID], [firstName], [lastName], [middleName], [age], [phone], [addressID], [photoPath], [note], [login], [grupID]) VALUES (10, N'Петр', N'Кацевич', N'Г.', 31, N'093*******', 10, NULL, NULL, N'PeterKatsevich', 2)
INSERT [dbo].[Student] ([studentID], [firstName], [lastName], [middleName], [age], [phone], [addressID], [photoPath], [note], [login], [grupID]) VALUES (11, N'Евгений', N'Бурцев', N'В.', 20, N'093*******', 11, NULL, NULL, N'EvgenyBurtsev', 2)
INSERT [dbo].[Student] ([studentID], [firstName], [lastName], [middleName], [age], [phone], [addressID], [photoPath], [note], [login], [grupID]) VALUES (12, N'Флора', N'Побирская', N'А.', 19, N'093*******', 12, NULL, NULL, N'FloraPobyrskaya', 2)
INSERT [dbo].[Student] ([studentID], [firstName], [lastName], [middleName], [age], [phone], [addressID], [photoPath], [note], [login], [grupID]) VALUES (13, N'Наталья', N'Гридина', N'С.', 27, N'093*******', 13, NULL, NULL, N'NataliaGridina', 2)
INSERT [dbo].[Student] ([studentID], [firstName], [lastName], [middleName], [age], [phone], [addressID], [photoPath], [note], [login], [grupID]) VALUES (14, N'Елена', N'Акусова', N'Е.', 28, N'093*******', 14, NULL, NULL, N'ElenaAkusova', 2)
INSERT [dbo].[Student] ([studentID], [firstName], [lastName], [middleName], [age], [phone], [addressID], [photoPath], [note], [login], [grupID]) VALUES (15, N'Светлана', N'Горшкова', N'М.', 26, N'093*******', 15, NULL, NULL, N'SvetlanaGorshkov', 2)
INSERT [dbo].[Student] ([studentID], [firstName], [lastName], [middleName], [age], [phone], [addressID], [photoPath], [note], [login], [grupID]) VALUES (16, N'Александр', N'Любенко', N'Л.', 24, N'093*******', 16, NULL, NULL, N'AlexanderLyubenko', 2)
INSERT [dbo].[Student] ([studentID], [firstName], [lastName], [middleName], [age], [phone], [addressID], [photoPath], [note], [login], [grupID]) VALUES (17, N'Евгения', N'Цимбалюк', N'О.', 26, N'093*******', 17, NULL, NULL, N'EvhenyyaTsimbalyuk', 3)
INSERT [dbo].[Student] ([studentID], [firstName], [lastName], [middleName], [age], [phone], [addressID], [photoPath], [note], [login], [grupID]) VALUES (18, N'Ольга', N'Болячевская', N'Д.', 29, N'093*******', 18, NULL, NULL, N'OlgaBolyachevskaya', 3)
INSERT [dbo].[Student] ([studentID], [firstName], [lastName], [middleName], [age], [phone], [addressID], [photoPath], [note], [login], [grupID]) VALUES (19, N'Станислав', N'Плешаков', N'П.', 21, N'093*******', 19, NULL, NULL, N'StanislavPleshakov', 3)
INSERT [dbo].[Student] ([studentID], [firstName], [lastName], [middleName], [age], [phone], [addressID], [photoPath], [note], [login], [grupID]) VALUES (20, N'Елена', N'Таран', N'Н.', 18, N'093*******', 20, NULL, NULL, N'ElenaTaran', 3)
INSERT [dbo].[Student] ([studentID], [firstName], [lastName], [middleName], [age], [phone], [addressID], [photoPath], [note], [login], [grupID]) VALUES (21, N'Денис', N'Рогачевский', N'В.', 29, N'093*******', 21, NULL, NULL, N'DenisRogachev', 3)
INSERT [dbo].[Student] ([studentID], [firstName], [lastName], [middleName], [age], [phone], [addressID], [photoPath], [note], [login], [grupID]) VALUES (22, N'Оксана', N'Тихонова', N'А.', 25, N'093*******', 22, NULL, NULL, N'OksanaTikhonova', 3)
INSERT [dbo].[Student] ([studentID], [firstName], [lastName], [middleName], [age], [phone], [addressID], [photoPath], [note], [login], [grupID]) VALUES (23, N'Петр', N'Максимов', N'М.', 26, N'093*******', 23, NULL, NULL, N'PeterMaximov', 3)
INSERT [dbo].[Student] ([studentID], [firstName], [lastName], [middleName], [age], [phone], [addressID], [photoPath], [note], [login], [grupID]) VALUES (24, N'Ирина', N'Стогнеева', N'В.', 21, N'093*******', 24, NULL, NULL, N'IrinaStogneeva', 3)
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([teacherID], [firstName], [lastName], [middleName], [addressID], [age], [phone], [photoPath], [login]) VALUES (1, N'Григорий', N'Ящук', N'Г.', 25, 32, N'096*******', NULL, N'GregoryYashchuk')
INSERT [dbo].[Teacher] ([teacherID], [firstName], [lastName], [middleName], [addressID], [age], [phone], [photoPath], [login]) VALUES (2, N'Алекс', N'Туманов', N'П.', 26, 33, N'096*******', NULL, N'AlexTumanov')
INSERT [dbo].[Teacher] ([teacherID], [firstName], [lastName], [middleName], [addressID], [age], [phone], [photoPath], [login]) VALUES (3, N'Сергей', N'Максименко', N'Л.', 27, 29, N'096*******', NULL, N'SergeyMaksimenko')
INSERT [dbo].[Teacher] ([teacherID], [firstName], [lastName], [middleName], [addressID], [age], [phone], [photoPath], [login]) VALUES (4, N'Дмитрий', N'Боровский', N'С.', 28, 37, N'096*******', NULL, N'DmitryBorovsky')
INSERT [dbo].[Teacher] ([teacherID], [firstName], [lastName], [middleName], [addressID], [age], [phone], [photoPath], [login]) VALUES (5, N'Виктор', N'Бровар', N'И.', 29, 36, N'096*******', NULL, N'VictorBrewery')
INSERT [dbo].[Teacher] ([teacherID], [firstName], [lastName], [middleName], [addressID], [age], [phone], [photoPath], [login]) VALUES (6, N'Вадим', N'Ткаченко', N'В.', 30, 38, N'096*******', NULL, N'VadimTkachenko')
INSERT [dbo].[Teacher] ([teacherID], [firstName], [lastName], [middleName], [addressID], [age], [phone], [photoPath], [login]) VALUES (7, N'Вячеслав', N'Калашников', N'Н.', 31, 35, N'096*******', NULL, N'VyacheslavKalashnikov')
INSERT [dbo].[Teacher] ([teacherID], [firstName], [lastName], [middleName], [addressID], [age], [phone], [photoPath], [login]) VALUES (8, N'Руслан', N'Кучеренко', N'И.', 32, 37, N'096*******', NULL, N'RuslanKucherenko')
INSERT [dbo].[Teacher] ([teacherID], [firstName], [lastName], [middleName], [addressID], [age], [phone], [photoPath], [login]) VALUES (9, N'Андрей', N'Тендюк', N'Н.', 33, 32, N'096*******', NULL, N'AndrewTendyuk')
INSERT [dbo].[Teacher] ([teacherID], [firstName], [lastName], [middleName], [addressID], [age], [phone], [photoPath], [login]) VALUES (10, N'Анатолий', N'Выклюк', N'Г.', 34, 36, N'096*******', NULL, N'AnatolyVyklyuk')
INSERT [dbo].[Teacher] ([teacherID], [firstName], [lastName], [middleName], [addressID], [age], [phone], [photoPath], [login]) VALUES (11, N'Олег', N'Резниченко', N'В.', 35, 31, N'096*******', NULL, N'OlegReznichenko')
INSERT [dbo].[Teacher] ([teacherID], [firstName], [lastName], [middleName], [addressID], [age], [phone], [photoPath], [login]) VALUES (12, N'Александр', N'Артемов', N'А.', 36, 34, N'096*******', NULL, N'AlexanderArtemov')
SET IDENTITY_INSERT [dbo].[Teacher] OFF
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (2, 3)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (2, 4)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (2, 5)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (6, 1)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (6, 2)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (6, 1)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (6, 2)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (3, 3)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (3, 4)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (3, 5)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (3, 6)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (3, 7)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (3, 8)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (3, 9)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (3, 10)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (3, 11)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (3, 12)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (3, 13)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (3, 14)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (3, 15)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (3, 16)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (3, 17)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (3, 18)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (3, 19)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (3, 20)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (3, 21)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (3, 22)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (3, 23)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (3, 24)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (3, 25)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (3, 26)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (3, 27)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (3, 28)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (3, 29)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (3, 30)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (6, 1)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (4, 6)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (5, 7)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (7, 8)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (9, 10)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (8, 9)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (10, 11)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (11, 12)
INSERT [dbo].[TeacherItems] ([teacherID], [objectID]) VALUES (12, 13)
ALTER TABLE [dbo].[Aauditorium]  WITH CHECK ADD  CONSTRAINT [FK_Aauditorium_PpresenceOfImages] FOREIGN KEY([presenceOfImagesID])
REFERENCES [dbo].[PpresenceOfImages] ([presenceOfImagesID])
GO
ALTER TABLE [dbo].[Aauditorium] CHECK CONSTRAINT [FK_Aauditorium_PpresenceOfImages]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_City] FOREIGN KEY([cityID])
REFERENCES [dbo].[City] ([cityID])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_City]
GO
ALTER TABLE [dbo].[AssessmentExaminationTasks]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentExaminationTasks_Objects] FOREIGN KEY([objectID])
REFERENCES [dbo].[Objects] ([objectID])
GO
ALTER TABLE [dbo].[AssessmentExaminationTasks] CHECK CONSTRAINT [FK_AssessmentExaminationTasks_Objects]
GO
ALTER TABLE [dbo].[AssessmentExaminationTasks]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentExaminationTasks_Student] FOREIGN KEY([studentID])
REFERENCES [dbo].[Student] ([studentID])
GO
ALTER TABLE [dbo].[AssessmentExaminationTasks] CHECK CONSTRAINT [FK_AssessmentExaminationTasks_Student]
GO
ALTER TABLE [dbo].[AssessmentExaminationTasks]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentExaminationTasks_Teacher] FOREIGN KEY([teacherID])
REFERENCES [dbo].[Teacher] ([teacherID])
GO
ALTER TABLE [dbo].[AssessmentExaminationTasks] CHECK CONSTRAINT [FK_AssessmentExaminationTasks_Teacher]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_EmploymentAuditorium] FOREIGN KEY([employmentAuditoriumID])
REFERENCES [dbo].[EmploymentAuditorium] ([employmentAuditoriumID])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_EmploymentAuditorium]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Student] FOREIGN KEY([studentID])
REFERENCES [dbo].[Student] ([studentID])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Student]
GO
ALTER TABLE [dbo].[EmploymentAuditorium]  WITH CHECK ADD  CONSTRAINT [FK_EmploymentAudiences_Objects] FOREIGN KEY([objectID])
REFERENCES [dbo].[Objects] ([objectID])
GO
ALTER TABLE [dbo].[EmploymentAuditorium] CHECK CONSTRAINT [FK_EmploymentAudiences_Objects]
GO
ALTER TABLE [dbo].[EmploymentAuditorium]  WITH CHECK ADD  CONSTRAINT [FK_EmploymentAudiences_Teacher] FOREIGN KEY([teacherID])
REFERENCES [dbo].[Teacher] ([teacherID])
GO
ALTER TABLE [dbo].[EmploymentAuditorium] CHECK CONSTRAINT [FK_EmploymentAudiences_Teacher]
GO
ALTER TABLE [dbo].[EmploymentAuditorium]  WITH CHECK ADD  CONSTRAINT [FK_EmploymentAuditorium_Aauditorium] FOREIGN KEY([auditoriumNumber])
REFERENCES [dbo].[Aauditorium] ([number])
GO
ALTER TABLE [dbo].[EmploymentAuditorium] CHECK CONSTRAINT [FK_EmploymentAuditorium_Aauditorium]
GO
ALTER TABLE [dbo].[EmploymentAuditorium]  WITH CHECK ADD  CONSTRAINT [FK_EmploymentAuditorium_Groups] FOREIGN KEY([groupID])
REFERENCES [dbo].[Groups] ([groupID])
GO
ALTER TABLE [dbo].[EmploymentAuditorium] CHECK CONSTRAINT [FK_EmploymentAuditorium_Groups]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Groups_Flow] FOREIGN KEY([flowID])
REFERENCES [dbo].[Flow] ([flowID])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_Groups_Flow]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Groups_FormsLearning] FOREIGN KEY([formLearningID])
REFERENCES [dbo].[FormsLearning] ([formLearningID])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_Groups_FormsLearning]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Groups_Specialization] FOREIGN KEY([specializationID])
REFERENCES [dbo].[Specialization] ([specializationID])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_Groups_Specialization]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Address] FOREIGN KEY([addressID])
REFERENCES [dbo].[Address] ([addressID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Address]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Groups] FOREIGN KEY([grupID])
REFERENCES [dbo].[Groups] ([groupID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Groups]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Address] FOREIGN KEY([addressID])
REFERENCES [dbo].[Address] ([addressID])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Address]
GO
ALTER TABLE [dbo].[TeacherItems]  WITH CHECK ADD  CONSTRAINT [FK_TeacherItems_Objects] FOREIGN KEY([objectID])
REFERENCES [dbo].[Objects] ([objectID])
GO
ALTER TABLE [dbo].[TeacherItems] CHECK CONSTRAINT [FK_TeacherItems_Objects]
GO
ALTER TABLE [dbo].[TeacherItems]  WITH CHECK ADD  CONSTRAINT [FK_TeacherItems_Teacher] FOREIGN KEY([teacherID])
REFERENCES [dbo].[Teacher] ([teacherID])
GO
ALTER TABLE [dbo].[TeacherItems] CHECK CONSTRAINT [FK_TeacherItems_Teacher]
GO
USE [master]
GO
ALTER DATABASE [AcademyStepOdessaBranch] SET  READ_WRITE 
GO
