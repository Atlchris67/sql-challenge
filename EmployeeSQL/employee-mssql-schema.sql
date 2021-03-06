USE [bootcamp]
GO
/****** Object:  Table [dbo].[departments]    Script Date: 1/28/2020 7:07:36 PM ******/

/*****
SET ANSI_NULLS ON - done for each table 
	IT Returns all values including null values in the table
*****/
SET ANSI_NULLS ON
GO
/*****
 identifiers can be delimited by double quotation marks, and literals must be delimited by single quotation marks.
*****/
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departments](
	[dept_no] [nvarchar](50) NOT NULL,
	[dept_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_departments] PRIMARY KEY CLUSTERED 
(
	[dept_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dept_emp]    Script Date: 1/28/2020 7:07:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--relational table foriegn keys below
CREATE TABLE [dbo].[dept_emp](
	[emp_no] [int] NOT NULL,
	[dept_no] [nvarchar](50) NOT NULL,
	[from_date] [date] NOT NULL,
	[to_date] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dept_manager]    Script Date: 1/28/2020 7:07:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--relational table foriegn keys below
CREATE TABLE [dbo].[dept_manager](
	[dept_no] [nvarchar](50) NOT NULL,
	[emp_no] [int] NOT NULL,
	[from_date] [date] NOT NULL,
	[to_date] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 1/28/2020 7:07:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Data table 
CREATE TABLE [dbo].[employees](
	[emp_no] [int] NOT NULL,
	[birth_date] [date] NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[gender] [nvarchar](50) NOT NULL,
	[hire_date] [date] NOT NULL,
--This creates the primary key on emp_no
 CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED 
(
	[emp_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[salaries]    Script Date: 1/28/2020 7:07:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Should have been a relational table related to salaries for company but I just emp_no as  table
CREATE TABLE [dbo].[salaries](
	[emp_no] [int] NOT NULL,
	[salary] [int] NOT NULL,
	[from_date] [date] NOT NULL,
	[to_date] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[titles]    Script Date: 1/28/2020 7:07:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Should have been a relational table related to titles for company but I just emp_no as  table
CREATE TABLE [dbo].[titles](
	[emp_no] [int] NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[from_date] [date] NOT NULL,
	[to_date] [date] NOT NULL
) ON [PRIMARY]
GO

--foreign keys are applied after all tables are created
ALTER TABLE [dbo].[dept_emp]  WITH CHECK ADD  CONSTRAINT [FK_dept_emp_departments] FOREIGN KEY([dept_no])
REFERENCES [dbo].[departments] ([dept_no])
GO
ALTER TABLE [dbo].[dept_emp] CHECK CONSTRAINT [FK_dept_emp_departments]
GO
ALTER TABLE [dbo].[dept_emp]  WITH CHECK ADD  CONSTRAINT [FK_dept_emp_employees] FOREIGN KEY([emp_no])
REFERENCES [dbo].[employees] ([emp_no])
GO
ALTER TABLE [dbo].[dept_emp] CHECK CONSTRAINT [FK_dept_emp_employees]
GO
ALTER TABLE [dbo].[dept_manager]  WITH CHECK ADD  CONSTRAINT [FK_dept_manager_departments] FOREIGN KEY([dept_no])
REFERENCES [dbo].[departments] ([dept_no])
GO
ALTER TABLE [dbo].[dept_manager] CHECK CONSTRAINT [FK_dept_manager_departments]
GO
ALTER TABLE [dbo].[dept_manager]  WITH CHECK ADD  CONSTRAINT [FK_dept_manager_employees] FOREIGN KEY([emp_no])
REFERENCES [dbo].[employees] ([emp_no])
GO
ALTER TABLE [dbo].[dept_manager] CHECK CONSTRAINT [FK_dept_manager_employees]
GO
ALTER TABLE [dbo].[salaries]  WITH CHECK ADD  CONSTRAINT [FK_salaries_employees] FOREIGN KEY([emp_no])
REFERENCES [dbo].[employees] ([emp_no])
GO
ALTER TABLE [dbo].[salaries] CHECK CONSTRAINT [FK_salaries_employees]
GO
ALTER TABLE [dbo].[titles]  WITH CHECK ADD  CONSTRAINT [FK_titles_employees] FOREIGN KEY([emp_no])
REFERENCES [dbo].[employees] ([emp_no])
GO
ALTER TABLE [dbo].[titles] CHECK CONSTRAINT [FK_titles_employees]
GO
