USE [master]
GO
/****** Object:  Database [TEST]    Script Date: 9/27/2024 7:45:03 PM ******/
CREATE DATABASE [TEST]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TEST', FILENAME = N'E:\SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\TEST.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TEST_log', FILENAME = N'E:\SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\TEST_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TEST].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TEST] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TEST] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TEST] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TEST] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TEST] SET ARITHABORT OFF 
GO
ALTER DATABASE [TEST] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TEST] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TEST] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TEST] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TEST] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TEST] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TEST] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TEST] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TEST] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TEST] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TEST] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TEST] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TEST] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TEST] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TEST] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TEST] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TEST] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TEST] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TEST] SET  MULTI_USER 
GO
ALTER DATABASE [TEST] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TEST] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TEST] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TEST] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TEST] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TEST] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TEST] SET QUERY_STORE = ON
GO
ALTER DATABASE [TEST] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TEST]
GO
/****** Object:  Table [dbo].[Admin_Profile]    Script Date: 9/27/2024 7:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin_Profile](
	[admin_id] [int] NOT NULL,
	[full_name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 9/27/2024 7:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applications](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [int] NULL,
	[application_type] [nvarchar](50) NULL,
	[content] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[status] [nvarchar](20) NULL,
	[last_updated] [datetime] NULL,
	[response] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[assignment_submissions]    Script Date: 9/27/2024 7:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[assignment_submissions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[assignment_id] [int] NOT NULL,
	[student_id] [int] NOT NULL,
	[submission_date] [datetime] NULL,
	[submission_content] [text] NULL,
	[grade] [decimal](5, 2) NULL,
	[class_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[assignments]    Script Date: 9/27/2024 7:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[assignments](
	[assignment_id] [int] IDENTITY(1,1) NOT NULL,
	[lecturer_id] [int] NOT NULL,
	[subject_id] [int] NOT NULL,
	[assignment_description] [text] NULL,
	[assigned_date] [date] NOT NULL,
	[due_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[assignment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 9/27/2024 7:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [int] NULL,
	[subject_id] [int] NULL,
	[attendance_date] [date] NULL,
	[status] [nvarchar](10) NULL,
	[reason] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 9/27/2024 7:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[class_id] [int] IDENTITY(1,1) NOT NULL,
	[class_name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[class_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classrooms]    Script Date: 9/27/2024 7:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classrooms](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[capacity] [int] NULL,
	[location] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curriculum]    Script Date: 9/27/2024 7:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curriculum](
	[major_id] [int] NOT NULL,
	[subject_id] [int] NOT NULL,
 CONSTRAINT [PK_Curriculum] PRIMARY KEY CLUSTERED 
(
	[major_id] ASC,
	[subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dorm_Residents]    Script Date: 9/27/2024 7:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dorm_Residents](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [int] NOT NULL,
	[dorm_room_id] [int] NOT NULL,
	[check_in_date] [date] NULL,
	[check_out_date] [date] NULL,
	[status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DormRooms]    Script Date: 9/27/2024 7:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DormRooms](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[room_number] [nvarchar](10) NOT NULL,
	[capacity] [int] NULL,
	[available_capacity] [int] NULL,
	[building] [nvarchar](50) NULL,
	[room_type] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exams]    Script Date: 9/27/2024 7:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exams](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[subject_id] [int] NULL,
	[exam_date] [date] NULL,
	[start_time] [time](7) NULL,
	[end_time] [time](7) NULL,
	[exam_room] [nvarchar](50) NULL,
	[exam_type] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grades]    Script Date: 9/27/2024 7:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grades](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [int] NULL,
	[subject_id] [int] NULL,
	[grade] [decimal](5, 2) NULL,
	[upload_date] [datetime] NULL,
	[comments] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GuideDetails]    Script Date: 9/27/2024 7:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuideDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[guideline_id] [int] NULL,
	[step_number] [int] NOT NULL,
	[step_title] [varchar](255) NOT NULL,
	[description] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Guidelines]    Script Date: 9/27/2024 7:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guidelines](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](255) NOT NULL,
	[create_date] [date] NOT NULL,
	[user_id] [int] NULL,
	[category] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecturer_Profile]    Script Date: 9/27/2024 7:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecturer_Profile](
	[lecturer_id] [int] NOT NULL,
	[expertise] [nvarchar](255) NULL,
	[office] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[lecturer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecturer_Timetable]    Script Date: 9/27/2024 7:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecturer_Timetable](
	[id] [int] NOT NULL,
	[lecturer_id] [int] NOT NULL,
	[subject_id] [int] NOT NULL,
	[start_time] [time](7) NOT NULL,
	[end_time] [time](7) NOT NULL,
	[day_of_week] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Lecturer_Timetable] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Major]    Script Date: 9/27/2024 7:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Major](
	[id] [int] NOT NULL,
	[major_name] [nchar](10) NULL,
 CONSTRAINT [PK_Major] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materials]    Script Date: 9/27/2024 7:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materials](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[subject_id] [int] NULL,
	[material_name] [nvarchar](255) NULL,
	[material_file] [nvarchar](255) NULL,
	[uploaded_at] [datetime] NULL,
	[uploaded_by] [int] NULL,
	[description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 9/27/2024 7:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[id] [int] NOT NULL,
	[img] [image] NULL,
	[content] [nvarchar](max) NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 9/27/2024 7:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](200) NULL,
	[content] [nvarchar](max) NULL,
	[role] [nchar](10) NULL,
	[upload_time] [datetime] NULL,
 CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 9/27/2024 7:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[amount] [decimal](18, 2) NULL,
	[payment_date] [datetime] NULL,
	[status] [nvarchar](20) NULL,
	[payment_type] [nvarchar](50) NULL,
	[method] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profile]    Script Date: 9/27/2024 7:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profile](
	[user_id] [int] NOT NULL,
	[full_name] [nvarchar](100) NOT NULL,
	[date_of_birth] [date] NULL,
	[phone_number] [nvarchar](20) NULL,
	[address] [nvarchar](255) NULL,
	[gender] [nvarchar](10) NULL,
	[profile_picture] [nvarchar](255) NULL,
	[bio] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Profile]    Script Date: 9/27/2024 7:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Profile](
	[student_id] [int] NOT NULL,
	[major_id] [int] NOT NULL,
	[year_of_study] [nvarchar](20) NULL,
 CONSTRAINT [PK_Student_Profile] PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Subjects]    Script Date: 9/27/2024 7:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Subjects](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [int] NULL,
	[subject_id] [int] NULL,
	[status] [nvarchar](10) NULL,
	[enrollment_date] [datetime] NULL,
	[grade] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentClass]    Script Date: 9/27/2024 7:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentClass](
	[student_id] [int] NOT NULL,
	[class_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[student_id] ASC,
	[class_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 9/27/2024 7:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](10) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[credits] [int] NOT NULL,
	[description] [nvarchar](max) NULL,
	[semester] [nvarchar](10) NULL,
	[lecturer_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Timetable]    Script Date: 9/27/2024 7:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timetable](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [int] NULL,
	[subject_id] [int] NULL,
	[day_of_week] [nvarchar](10) NULL,
	[start_time] [time](7) NULL,
	[end_time] [time](7) NULL,
	[classroom_id] [int] NULL,
	[attendance_percentage] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 9/27/2024 7:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[transaction_type] [nvarchar](50) NULL,
	[amount] [decimal](18, 2) NULL,
	[transaction_date] [datetime] NULL,
	[description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/27/2024 7:45:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[role] [nvarchar](20) NOT NULL,
	[status] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Lecturer_Profile] ([lecturer_id], [expertise], [office]) VALUES (5, N'IT', N'IT')
GO
INSERT [dbo].[Major] ([id], [major_name]) VALUES (1, N'SE        ')
INSERT [dbo].[Major] ([id], [major_name]) VALUES (2, N'IS        ')
INSERT [dbo].[Major] ([id], [major_name]) VALUES (3, N'MKT       ')
GO
SET IDENTITY_INSERT [dbo].[Notifications] ON 

INSERT [dbo].[Notifications] ([id], [title], [content], [role], [upload_time]) VALUES (1, N'Thông báo lịch học kì fa24', N'Lịch học cho sinh viên đã được cập nhập sinh viên kiểm tra lịch học trên fap', N'student   ', CAST(N'2024-08-12T10:34:09.000' AS DateTime))
INSERT [dbo].[Notifications] ([id], [title], [content], [role], [upload_time]) VALUES (2, N'Thông báo lịch thi', N'Lịch thi đã được upload', N'student   ', CAST(N'2024-09-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Notifications] ([id], [title], [content], [role], [upload_time]) VALUES (3, N'Thông báo kế hoạch giảng dạy cho sinh viên', N'Giảng viên chú ý theo dõi kế hoạch giảng dạy', N'lecturer  ', CAST(N'2024-09-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Notifications] ([id], [title], [content], [role], [upload_time]) VALUES (4, N'Thông báo kế hoạch đồ án kì fa24', N'Lịch trình đồ án đã được triển khai', N'student   ', CAST(N'2024-09-04T09:23:00.000' AS DateTime))
INSERT [dbo].[Notifications] ([id], [title], [content], [role], [upload_time]) VALUES (5, N'Lưu ý về việc sử dụng phòng học', N'Giảng viên lưu ý các điều sau đây', N'lecturer  ', CAST(N'2024-09-23T10:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Notifications] OFF
GO
INSERT [dbo].[Profile] ([user_id], [full_name], [date_of_birth], [phone_number], [address], [gender], [profile_picture], [bio]) VALUES (2, N'John Doe', CAST(N'1990-01-01' AS Date), N'123456789', N'123 Main St', N'Male', N'profile1.jpg', N'Developer')
INSERT [dbo].[Profile] ([user_id], [full_name], [date_of_birth], [phone_number], [address], [gender], [profile_picture], [bio]) VALUES (3, N'Jane Doe', CAST(N'1992-05-15' AS Date), N'987654321', N'456 Maple Ave', N'Female', N'img/meo-1_88.jpg', N'Designer')
INSERT [dbo].[Profile] ([user_id], [full_name], [date_of_birth], [phone_number], [address], [gender], [profile_picture], [bio]) VALUES (4, N'Khúc Xuân Hòa', CAST(N'2002-01-10' AS Date), N'1231231', N'hn', N'male', N'img/36a9cc5c70f6ce7718618128f53a6498.png', NULL)
INSERT [dbo].[Profile] ([user_id], [full_name], [date_of_birth], [phone_number], [address], [gender], [profile_picture], [bio]) VALUES (5, N'Khúc Xuân Hòa', CAST(N'1990-01-01' AS Date), N'123', N'123', N'MALE', N'img/images.jpg', NULL)
INSERT [dbo].[Profile] ([user_id], [full_name], [date_of_birth], [phone_number], [address], [gender], [profile_picture], [bio]) VALUES (7, N'John Doe', CAST(N'1990-01-01' AS Date), N'123456789', N'123 Main St', N'Male', N'profile1.jpg', N'Developer')
INSERT [dbo].[Profile] ([user_id], [full_name], [date_of_birth], [phone_number], [address], [gender], [profile_picture], [bio]) VALUES (8, N'Jane Doe', CAST(N'1992-05-15' AS Date), N'987654321', N'456 Maple Ave', N'Female', N'profile2.jpg', N'Designer')
GO
INSERT [dbo].[Student_Profile] ([student_id], [major_id], [year_of_study]) VALUES (2, 1, N'2020')
INSERT [dbo].[Student_Profile] ([student_id], [major_id], [year_of_study]) VALUES (3, 2, N'2021')
INSERT [dbo].[Student_Profile] ([student_id], [major_id], [year_of_study]) VALUES (4, 1, N'2019')
INSERT [dbo].[Student_Profile] ([student_id], [major_id], [year_of_study]) VALUES (7, 1, N'su23')
INSERT [dbo].[Student_Profile] ([student_id], [major_id], [year_of_study]) VALUES (8, 2, N'su24')
GO
INSERT [dbo].[Users] ([id], [username], [email], [password], [role], [status]) VALUES (1, N'admin', N'khucxuanhoa111@gmail.com', N'1', N'admin', N'active')
INSERT [dbo].[Users] ([id], [username], [email], [password], [role], [status]) VALUES (2, N'john_doe', N'john@example.com', N'pass1234', N'student', N'active')
INSERT [dbo].[Users] ([id], [username], [email], [password], [role], [status]) VALUES (3, N'jane_doe', N'jane@example.com', N'pass5678', N'student', N'active')
INSERT [dbo].[Users] ([id], [username], [email], [password], [role], [status]) VALUES (4, N'hoa', N'khucxuanhoa6a@gmail.com', N'1', N'student', N'active')
INSERT [dbo].[Users] ([id], [username], [email], [password], [role], [status]) VALUES (5, N'xuan', N'xuan', N'1', N'lecturer', N'active')
INSERT [dbo].[Users] ([id], [username], [email], [password], [role], [status]) VALUES (7, N'john', N'john1@example.com', N'pass1234', N'student', N'active')
INSERT [dbo].[Users] ([id], [username], [email], [password], [role], [status]) VALUES (8, N'jane', N'jane1@example.com', N'pass5678', N'student', N'active')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__DormRoom__FE22F61B920624B8]    Script Date: 9/27/2024 7:45:03 PM ******/
ALTER TABLE [dbo].[DormRooms] ADD UNIQUE NONCLUSTERED 
(
	[room_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Subjects__357D4CF98743D433]    Script Date: 9/27/2024 7:45:03 PM ******/
ALTER TABLE [dbo].[Subjects] ADD UNIQUE NONCLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__AB6E616428BC4E26]    Script Date: 9/27/2024 7:45:03 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__F3DBC5720C7E2862]    Script Date: 9/27/2024 7:45:03 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Applications] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Applications] ADD  DEFAULT (getdate()) FOR [last_updated]
GO
ALTER TABLE [dbo].[Dorm_Residents] ADD  DEFAULT (getdate()) FOR [check_in_date]
GO
ALTER TABLE [dbo].[Grades] ADD  DEFAULT (getdate()) FOR [upload_date]
GO
ALTER TABLE [dbo].[Materials] ADD  DEFAULT (getdate()) FOR [uploaded_at]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT (getdate()) FOR [payment_date]
GO
ALTER TABLE [dbo].[Student_Subjects] ADD  DEFAULT (getdate()) FOR [enrollment_date]
GO
ALTER TABLE [dbo].[Transactions] ADD  DEFAULT (getdate()) FOR [transaction_date]
GO
ALTER TABLE [dbo].[Admin_Profile]  WITH CHECK ADD FOREIGN KEY([admin_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD FOREIGN KEY([student_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[assignment_submissions]  WITH CHECK ADD FOREIGN KEY([assignment_id])
REFERENCES [dbo].[assignments] ([assignment_id])
GO
ALTER TABLE [dbo].[assignment_submissions]  WITH CHECK ADD FOREIGN KEY([class_id])
REFERENCES [dbo].[Class] ([class_id])
GO
ALTER TABLE [dbo].[assignment_submissions]  WITH CHECK ADD FOREIGN KEY([student_id])
REFERENCES [dbo].[Student_Profile] ([student_id])
GO
ALTER TABLE [dbo].[assignments]  WITH CHECK ADD FOREIGN KEY([lecturer_id])
REFERENCES [dbo].[Lecturer_Profile] ([lecturer_id])
GO
ALTER TABLE [dbo].[assignments]  WITH CHECK ADD FOREIGN KEY([subject_id])
REFERENCES [dbo].[Subjects] ([id])
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD FOREIGN KEY([student_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD FOREIGN KEY([subject_id])
REFERENCES [dbo].[Subjects] ([id])
GO
ALTER TABLE [dbo].[Curriculum]  WITH CHECK ADD  CONSTRAINT [FK_Curriculum_Major] FOREIGN KEY([major_id])
REFERENCES [dbo].[Major] ([id])
GO
ALTER TABLE [dbo].[Curriculum] CHECK CONSTRAINT [FK_Curriculum_Major]
GO
ALTER TABLE [dbo].[Curriculum]  WITH CHECK ADD  CONSTRAINT [FK_Curriculum_Subjects] FOREIGN KEY([subject_id])
REFERENCES [dbo].[Subjects] ([id])
GO
ALTER TABLE [dbo].[Curriculum] CHECK CONSTRAINT [FK_Curriculum_Subjects]
GO
ALTER TABLE [dbo].[Dorm_Residents]  WITH CHECK ADD FOREIGN KEY([dorm_room_id])
REFERENCES [dbo].[DormRooms] ([id])
GO
ALTER TABLE [dbo].[Dorm_Residents]  WITH CHECK ADD FOREIGN KEY([student_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Exams]  WITH CHECK ADD FOREIGN KEY([subject_id])
REFERENCES [dbo].[Subjects] ([id])
GO
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD FOREIGN KEY([student_id])
REFERENCES [dbo].[Profile] ([user_id])
GO
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD FOREIGN KEY([subject_id])
REFERENCES [dbo].[Subjects] ([id])
GO
ALTER TABLE [dbo].[GuideDetails]  WITH CHECK ADD FOREIGN KEY([guideline_id])
REFERENCES [dbo].[Guidelines] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Guidelines]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Lecturer_Profile]  WITH CHECK ADD FOREIGN KEY([lecturer_id])
REFERENCES [dbo].[Profile] ([user_id])
GO
ALTER TABLE [dbo].[Lecturer_Timetable]  WITH CHECK ADD FOREIGN KEY([lecturer_id])
REFERENCES [dbo].[Lecturer_Profile] ([lecturer_id])
GO
ALTER TABLE [dbo].[Lecturer_Timetable]  WITH CHECK ADD FOREIGN KEY([subject_id])
REFERENCES [dbo].[Subjects] ([id])
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD FOREIGN KEY([subject_id])
REFERENCES [dbo].[Subjects] ([id])
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD FOREIGN KEY([uploaded_by])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Profile] CHECK CONSTRAINT [FK_Profile_Users]
GO
ALTER TABLE [dbo].[Student_Profile]  WITH CHECK ADD  CONSTRAINT [FK_Student_Profile_Major] FOREIGN KEY([major_id])
REFERENCES [dbo].[Major] ([id])
GO
ALTER TABLE [dbo].[Student_Profile] CHECK CONSTRAINT [FK_Student_Profile_Major]
GO
ALTER TABLE [dbo].[Student_Profile]  WITH CHECK ADD  CONSTRAINT [FK_Student_Profile_Profile] FOREIGN KEY([student_id])
REFERENCES [dbo].[Profile] ([user_id])
GO
ALTER TABLE [dbo].[Student_Profile] CHECK CONSTRAINT [FK_Student_Profile_Profile]
GO
ALTER TABLE [dbo].[Student_Subjects]  WITH CHECK ADD FOREIGN KEY([student_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Student_Subjects]  WITH CHECK ADD FOREIGN KEY([subject_id])
REFERENCES [dbo].[Subjects] ([id])
GO
ALTER TABLE [dbo].[StudentClass]  WITH CHECK ADD FOREIGN KEY([class_id])
REFERENCES [dbo].[Class] ([class_id])
GO
ALTER TABLE [dbo].[StudentClass]  WITH CHECK ADD  CONSTRAINT [FK_StudentClass_Student_Profile] FOREIGN KEY([student_id])
REFERENCES [dbo].[Student_Profile] ([student_id])
GO
ALTER TABLE [dbo].[StudentClass] CHECK CONSTRAINT [FK_StudentClass_Student_Profile]
GO
ALTER TABLE [dbo].[Subjects]  WITH CHECK ADD FOREIGN KEY([lecturer_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Timetable]  WITH CHECK ADD FOREIGN KEY([classroom_id])
REFERENCES [dbo].[Classrooms] ([id])
GO
ALTER TABLE [dbo].[Timetable]  WITH CHECK ADD FOREIGN KEY([student_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Timetable]  WITH CHECK ADD FOREIGN KEY([subject_id])
REFERENCES [dbo].[Subjects] ([id])
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD CHECK  (([status]='Rejected' OR [status]='Approved' OR [status]='Pending'))
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD CHECK  (([status]='Late' OR [status]='Absent' OR [status]='Present'))
GO
ALTER TABLE [dbo].[Dorm_Residents]  WITH CHECK ADD CHECK  (([status]='Checked-out' OR [status]='Active'))
GO
ALTER TABLE [dbo].[DormRooms]  WITH CHECK ADD CHECK  (([available_capacity]>=(0) AND [available_capacity]<=[capacity]))
GO
ALTER TABLE [dbo].[DormRooms]  WITH CHECK ADD CHECK  (([capacity]>(0)))
GO
ALTER TABLE [dbo].[Exams]  WITH CHECK ADD CHECK  (([exam_type]='Quiz' OR [exam_type]='Final' OR [exam_type]='Midterm'))
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD CHECK  (([payment_type]='Other' OR [payment_type]='Fee' OR [payment_type]='Tuition'))
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD CHECK  (([status]='Failed' OR [status]='Pending' OR [status]='Completed'))
GO
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD CHECK  (([gender]='Other' OR [gender]='Female' OR [gender]='Male'))
GO
ALTER TABLE [dbo].[Student_Subjects]  WITH CHECK ADD CHECK  (([status]='Dropped' OR [status]='Completed' OR [status]='Enrolled'))
GO
ALTER TABLE [dbo].[Timetable]  WITH CHECK ADD CHECK  (([day_of_week]='Saturday' OR [day_of_week]='Friday' OR [day_of_week]='Thursday' OR [day_of_week]='Wednesday' OR [day_of_week]='Tuesday' OR [day_of_week]='Monday'))
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [CK__Users__role__37703C52] CHECK  (([role]='lecturer' OR [role]='student' OR [role]='admin'))
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [CK__Users__role__37703C52]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [CK__Users__status__3864608B] CHECK  (([status]='inactive' OR [status]='active'))
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [CK__Users__status__3864608B]
GO
USE [master]
GO
ALTER DATABASE [TEST] SET  READ_WRITE 
GO
