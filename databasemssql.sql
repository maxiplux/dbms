USE [homework3]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 7/18/2019 9:06:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[deptNo] [bigint] IDENTITY(1,1) NOT NULL,
	[deptName] [nvarchar](50) NOT NULL,
	[mgrEmpID] [bigint] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[deptNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 7/18/2019 9:06:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[empID] [bigint] IDENTITY(1,1) NOT NULL,
	[fName] [nvarchar](50) NOT NULL,
	[lName] [nvarchar](50) NOT NULL,
	[address] [ntext] NOT NULL,
	[DOB] [date] NOT NULL,
	[sex] [char](10) NOT NULL,
	[position] [nvarchar](50) NOT NULL,
	[deptNo] [bigint] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[empID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 7/18/2019 9:06:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[projNo] [bigint] IDENTITY(1,1) NOT NULL,
	[projName] [nvarchar](50) NOT NULL,
	[deptNo] [bigint] NOT NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[projNo] ASC,
	[projName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorksOn]    Script Date: 7/18/2019 9:06:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorksOn](
	[empID] [bigint] IDENTITY(1,1) NOT NULL,
	[projNo] [bigint] NOT NULL,
	[hoursWorked] [smallint] NOT NULL,
 CONSTRAINT [PK_WorksOn] PRIMARY KEY CLUSTERED 
(
	[empID] ASC,
	[projNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Employee] FOREIGN KEY([mgrEmpID])
REFERENCES [dbo].[Employee] ([empID])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Employee]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_Department] FOREIGN KEY([deptNo])
REFERENCES [dbo].[Department] ([deptNo])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_Department]
GO
ALTER TABLE [dbo].[WorksOn]  WITH CHECK ADD  CONSTRAINT [FK_WorksOn_Employee] FOREIGN KEY([empID])
REFERENCES [dbo].[Employee] ([empID])
GO
ALTER TABLE [dbo].[WorksOn] CHECK CONSTRAINT [FK_WorksOn_Employee]
GO
