USE [Tasks]
GO
/****** Object:  Table [dbo].[CommonRecycleBin]    Script Date: 04/23/2014 02:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CommonRecycleBin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RecycleTable] [varchar](50) NULL,
	[RecycleTableID] [varchar](50) NULL,
	[RecycleRows] [text] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[IsRestored] [bit] NOT NULL,
 CONSTRAINT [PK_CommonRecycleBin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CommonRecycleBin] ON
INSERT [dbo].[CommonRecycleBin] ([ID], [RecycleTable], [RecycleTableID], [RecycleRows], [CreatedBy], [CreatedOn], [IsRestored]) VALUES (1, N'Tasks', N'13', N'<Tasks>
    <ID>13</ID>
    <Title>skdjhfksjdf</Title>
    <Description>skjfhsdkf</Description>
    <AssignedTo>1</AssignedTo>
    <DueDate>Jun 30 2012 12:00AM</DueDate>
    <IsActive>true</IsActive>
    <IsArchived>false</IsArchived>
    <CreatedBy>1</CreatedBy>
    <CreatedOn>2012-06-12T16:31:11+05:30</CreatedOn>
    <ModifiedBy>0</ModifiedBy>
    <ModifiedOn>2012-06-12T16:31:11+05:30</ModifiedOn>
  </Tasks>', 1, CAST(0x0000A06F00B18F95 AS DateTime), 0)
INSERT [dbo].[CommonRecycleBin] ([ID], [RecycleTable], [RecycleTableID], [RecycleRows], [CreatedBy], [CreatedOn], [IsRestored]) VALUES (2, N'Tasks', N'9', N'<Tasks>
    <ID>9</ID>
    <Title>sdfsdf</Title>
    <Description>sdfsdf</Description>
    <AssignedTo>2</AssignedTo>
    <DueDate>Jun 29 2012 12:00AM</DueDate>
    <IsActive>true</IsActive>
    <IsArchived>false</IsArchived>
    <CreatedBy>1</CreatedBy>
    <CreatedOn>2012-06-12T16:20:37+05:30</CreatedOn>
    <ModifiedBy>0</ModifiedBy>
    <ModifiedOn>2012-06-12T16:20:37+05:30</ModifiedOn>
  </Tasks>', 1, CAST(0x0000A06F00B191EF AS DateTime), 0)
INSERT [dbo].[CommonRecycleBin] ([ID], [RecycleTable], [RecycleTableID], [RecycleRows], [CreatedBy], [CreatedOn], [IsRestored]) VALUES (3, N'Tasks', N'2', N'<Tasks>
    <ID>2</ID>
    <Title>sdfas</Title>
    <Description>sadfsdf</Description>
    <AssignedTo>2</AssignedTo>
    <DueDate>Jun 15 2012 12:00AM</DueDate>
    <IsActive>true</IsActive>
    <IsArchived>false</IsArchived>
    <CreatedBy>1</CreatedBy>
    <CreatedOn>2012-06-12T16:19:03+05:30</CreatedOn>
    <ModifiedBy>0</ModifiedBy>
    <ModifiedOn>2012-06-12T16:19:03+05:30</ModifiedOn>
  </Tasks>', 1, CAST(0x0000A06F00B19E0D AS DateTime), 0)
INSERT [dbo].[CommonRecycleBin] ([ID], [RecycleTable], [RecycleTableID], [RecycleRows], [CreatedBy], [CreatedOn], [IsRestored]) VALUES (4, N'Tasks', N'3', N'<Tasks>
    <ID>3</ID>
    <Title>sdfsdf</Title>
    <Description>sdfsdf</Description>
    <AssignedTo>2</AssignedTo>
    <DueDate>Jun 29 2012 12:00AM</DueDate>
    <IsActive>true</IsActive>
    <IsArchived>false</IsArchived>
    <CreatedBy>1</CreatedBy>
    <CreatedOn>2012-06-12T16:20:00+05:30</CreatedOn>
    <ModifiedBy>0</ModifiedBy>
    <ModifiedOn>2012-06-12T16:20:00+05:30</ModifiedOn>
  </Tasks>', 1, CAST(0x0000A06F00B1A027 AS DateTime), 0)
INSERT [dbo].[CommonRecycleBin] ([ID], [RecycleTable], [RecycleTableID], [RecycleRows], [CreatedBy], [CreatedOn], [IsRestored]) VALUES (5, N'Tasks', N'15', N'<Tasks>
    <ID>15</ID>
    <Title>Sample</Title>
    <Description>sdfsdf</Description>
    <AssignedTo>1</AssignedTo>
    <DueDate>Aug 17 2012 12:00AM</DueDate>
    <IsActive>true</IsActive>
    <IsArchived>false</IsArchived>
    <CreatedBy>1</CreatedBy>
    <CreatedOn>2012-06-12T16:46:01+05:30</CreatedOn>
    <ModifiedBy>0</ModifiedBy>
    <ModifiedOn>2012-06-12T16:46:01+05:30</ModifiedOn>
  </Tasks>', 1, CAST(0x0000A06F00B1A234 AS DateTime), 0)
INSERT [dbo].[CommonRecycleBin] ([ID], [RecycleTable], [RecycleTableID], [RecycleRows], [CreatedBy], [CreatedOn], [IsRestored]) VALUES (6, N'Tasks', N'5', N'<Tasks>
    <ID>5</ID>
    <Title>sdfsdf</Title>
    <Description>sdfsdf</Description>
    <AssignedTo>2</AssignedTo>
    <DueDate>Jun 29 2012 12:00AM</DueDate>
    <IsActive>true</IsActive>
    <IsArchived>false</IsArchived>
    <CreatedBy>1</CreatedBy>
    <CreatedOn>2012-06-12T16:20:29+05:30</CreatedOn>
    <ModifiedBy>0</ModifiedBy>
    <ModifiedOn>2012-06-12T16:20:29+05:30</ModifiedOn>
  </Tasks>', 1, CAST(0x0000A06F00B1A61D AS DateTime), 0)
INSERT [dbo].[CommonRecycleBin] ([ID], [RecycleTable], [RecycleTableID], [RecycleRows], [CreatedBy], [CreatedOn], [IsRestored]) VALUES (7, N'Tasks', N'4', N'<Tasks>
    <ID>4</ID>
    <Title>sdfsdf</Title>
    <Description>sdfsdf</Description>
    <AssignedTo>2</AssignedTo>
    <DueDate>Jun 29 2012 12:00AM</DueDate>
    <IsActive>true</IsActive>
    <IsArchived>false</IsArchived>
    <CreatedBy>1</CreatedBy>
    <CreatedOn>2012-06-12T16:20:27+05:30</CreatedOn>
    <ModifiedBy>0</ModifiedBy>
    <ModifiedOn>2012-06-12T16:20:27+05:30</ModifiedOn>
  </Tasks>', 1, CAST(0x0000A06F00B1A818 AS DateTime), 0)
INSERT [dbo].[CommonRecycleBin] ([ID], [RecycleTable], [RecycleTableID], [RecycleRows], [CreatedBy], [CreatedOn], [IsRestored]) VALUES (8, N'Tasks', N'6', N'<Tasks>
    <ID>6</ID>
    <Title>sdfsdf</Title>
    <Description>sdfsdf</Description>
    <AssignedTo>2</AssignedTo>
    <DueDate>Jun 29 2012 12:00AM</DueDate>
    <IsActive>true</IsActive>
    <IsArchived>false</IsArchived>
    <CreatedBy>1</CreatedBy>
    <CreatedOn>2012-06-12T16:20:30+05:30</CreatedOn>
    <ModifiedBy>0</ModifiedBy>
    <ModifiedOn>2012-06-12T16:20:30+05:30</ModifiedOn>
  </Tasks>', 1, CAST(0x0000A06F00B1AA92 AS DateTime), 0)
INSERT [dbo].[CommonRecycleBin] ([ID], [RecycleTable], [RecycleTableID], [RecycleRows], [CreatedBy], [CreatedOn], [IsRestored]) VALUES (9, N'Tasks', N'7', N'<Tasks>
    <ID>7</ID>
    <Title>sdfsdf</Title>
    <Description>sdfsdf</Description>
    <AssignedTo>2</AssignedTo>
    <DueDate>Jun 29 2012 12:00AM</DueDate>
    <IsActive>true</IsActive>
    <IsArchived>false</IsArchived>
    <CreatedBy>1</CreatedBy>
    <CreatedOn>2012-06-12T16:20:31+05:30</CreatedOn>
    <ModifiedBy>0</ModifiedBy>
    <ModifiedOn>2012-06-12T16:20:31+05:30</ModifiedOn>
  </Tasks>', 1, CAST(0x0000A06F00B1ACB8 AS DateTime), 0)
INSERT [dbo].[CommonRecycleBin] ([ID], [RecycleTable], [RecycleTableID], [RecycleRows], [CreatedBy], [CreatedOn], [IsRestored]) VALUES (10, N'Tasks', N'8', N'<Tasks>
    <ID>8</ID>
    <Title>sdfsdf</Title>
    <Description>sdfsdf</Description>
    <AssignedTo>2</AssignedTo>
    <DueDate>Jun 29 2012 12:00AM</DueDate>
    <IsActive>true</IsActive>
    <IsArchived>false</IsArchived>
    <CreatedBy>1</CreatedBy>
    <CreatedOn>2012-06-12T16:20:32+05:30</CreatedOn>
    <ModifiedBy>0</ModifiedBy>
    <ModifiedOn>2012-06-12T16:20:32+05:30</ModifiedOn>
  </Tasks>', 1, CAST(0x0000A06F00B1AE34 AS DateTime), 0)
INSERT [dbo].[CommonRecycleBin] ([ID], [RecycleTable], [RecycleTableID], [RecycleRows], [CreatedBy], [CreatedOn], [IsRestored]) VALUES (11, N'Tasks', N'1', N'<Tasks>
    <ID>1</ID>
    <Title>Sample</Title>
    <Description>Sample Task</Description>
    <AssignedTo>1</AssignedTo>
    <DueDate>Jun 29 2012 12:00AM</DueDate>
    <IsActive>true</IsActive>
    <IsArchived>false</IsArchived>
    <CreatedBy>1</CreatedBy>
    <CreatedOn>2012-06-12T15:53:04+05:30</CreatedOn>
    <ModifiedBy>0</ModifiedBy>
    <ModifiedOn>2012-06-12T16:16:42+05:30</ModifiedOn>
  </Tasks>', 1, CAST(0x0000A06F00B1BB02 AS DateTime), 0)
INSERT [dbo].[CommonRecycleBin] ([ID], [RecycleTable], [RecycleTableID], [RecycleRows], [CreatedBy], [CreatedOn], [IsRestored]) VALUES (12, N'Tasks', N'12', N'<Tasks>
    <ID>12</ID>
    <Title>Demo</Title>
    <Description>Samole</Description>
    <AssignedTo>1</AssignedTo>
    <DueDate>Jun 29 2012 12:00AM</DueDate>
    <IsActive>true</IsActive>
    <IsArchived>false</IsArchived>
    <CreatedBy>1</CreatedBy>
    <CreatedOn>2012-06-12T16:30:29+05:30</CreatedOn>
    <ModifiedBy>0</ModifiedBy>
    <ModifiedOn>2012-06-12T16:30:29+05:30</ModifiedOn>
  </Tasks>', 1, CAST(0x0000A06F00B1BD01 AS DateTime), 0)
INSERT [dbo].[CommonRecycleBin] ([ID], [RecycleTable], [RecycleTableID], [RecycleRows], [CreatedBy], [CreatedOn], [IsRestored]) VALUES (13, N'Tasks', N'17', N'<Tasks>
    <ID>17</ID>
    <Title>B MVC Task</Title>
    <Description>B MVC Task</Description>
    <AssignedTo>2</AssignedTo>
    <DueDate>Jun 23 2012 12:00AM</DueDate>
    <IsActive>true</IsActive>
    <IsArchived>false</IsArchived>
    <CreatedBy>1</CreatedBy>
    <CreatedOn>2012-06-12T17:16:47+05:30</CreatedOn>
    <ModifiedBy>0</ModifiedBy>
    <ModifiedOn>2012-06-12T17:16:47+05:30</ModifiedOn>
  </Tasks>', 1, CAST(0x0000A06F00B2E30C AS DateTime), 0)
INSERT [dbo].[CommonRecycleBin] ([ID], [RecycleTable], [RecycleTableID], [RecycleRows], [CreatedBy], [CreatedOn], [IsRestored]) VALUES (14, N'Tasks', N'21', N'<Tasks>
    <ID>21</ID>
    <Title>A Weather Task</Title>
    <Description>Prashant</Description>
    <AssignedTo>1</AssignedTo>
    <DueDate>Aug  4 2012 12:00AM</DueDate>
    <IsActive>true</IsActive>
    <IsArchived>false</IsArchived>
    <CreatedBy>1</CreatedBy>
    <CreatedOn>2012-06-13T14:58:13+05:30</CreatedOn>
    <ModifiedBy>0</ModifiedBy>
    <ModifiedOn>2012-06-13T14:58:39+05:30</ModifiedOn>
  </Tasks>', 1, CAST(0x0000A06F00F6EA07 AS DateTime), 0)
INSERT [dbo].[CommonRecycleBin] ([ID], [RecycleTable], [RecycleTableID], [RecycleRows], [CreatedBy], [CreatedOn], [IsRestored]) VALUES (15, N'Tasks', N'1', N'<Tasks>
    <ID>1</ID>
    <Title>MVC Demo Application</Title>
    <Description>MVC Demo Application</Description>
    <AssignedTo>1</AssignedTo>
    <DueDate>Aug 18 2012 12:00AM</DueDate>
    <IsActive>true</IsActive>
    <IsArchived>false</IsArchived>
    <CreatedBy>1</CreatedBy>
    <CreatedOn>2012-06-19T15:11:53+05:30</CreatedOn>
    <ModifiedBy>0</ModifiedBy>
    <ModifiedOn>2012-06-19T15:11:53+05:30</ModifiedOn>
  </Tasks>', 1, CAST(0x0000A075010AD45C AS DateTime), 0)
INSERT [dbo].[CommonRecycleBin] ([ID], [RecycleTable], [RecycleTableID], [RecycleRows], [CreatedBy], [CreatedOn], [IsRestored]) VALUES (16, N'UserManagementUser', N'2', N'<UserManagementUser>
    <ID>2</ID>
    <UserName>demo</UserName>
    <UserPassword>admin</UserPassword>
    <Email>admin@dsf.com</Email>
    <IsAdmin>false</IsAdmin>
  </UserManagementUser>', 1, CAST(0x0000A076016CEEBE AS DateTime), 0)
INSERT [dbo].[CommonRecycleBin] ([ID], [RecycleTable], [RecycleTableID], [RecycleRows], [CreatedBy], [CreatedOn], [IsRestored]) VALUES (17, N'Tasks', N'3', N'<Tasks>
    <ID>3</ID>
    <Title>BB</Title>
    <Description>BB</Description>
    <AssignedTo>1</AssignedTo>
    <DueDate>2012-08-11T00:00:00+05:30</DueDate>
    <IsActive>true</IsActive>
    <IsArchived>false</IsArchived>
    <CreatedBy>1</CreatedBy>
    <CreatedOn>2012-07-02T16:06:41+05:30</CreatedOn>
    <ModifiedBy>0</ModifiedBy>
    <ModifiedOn>2012-07-02T16:06:41+05:30</ModifiedOn>
  </Tasks>', 1, CAST(0x0000A08201099950 AS DateTime), 0)
INSERT [dbo].[CommonRecycleBin] ([ID], [RecycleTable], [RecycleTableID], [RecycleRows], [CreatedBy], [CreatedOn], [IsRestored]) VALUES (18, N'Tasks', N'1', N'<Tasks>
    <ID>1</ID>
    <Title>Generic new item form for list 6</Title>
    <Description>Generic new item form for SharePoint 2010 list</Description>
    <AssignedTo>1</AssignedTo>
    <DueDate>2012-10-06T00:00:00+05:30</DueDate>
    <IsActive>true</IsActive>
    <IsArchived>false</IsArchived>
    <CreatedBy>1</CreatedBy>
    <CreatedOn>2012-06-19T16:18:23+05:30</CreatedOn>
    <ModifiedBy>0</ModifiedBy>
    <ModifiedOn>2012-07-13T15:26:10+05:30</ModifiedOn>
  </Tasks>', 1, CAST(0x0000A08D00FE7AD3 AS DateTime), 0)
INSERT [dbo].[CommonRecycleBin] ([ID], [RecycleTable], [RecycleTableID], [RecycleRows], [CreatedBy], [CreatedOn], [IsRestored]) VALUES (19, N'Tasks', N'23', N'<Tasks>
    <ID>23</ID>
    <Title>zzuutuiioio</Title>
    <Description>sdfsdfsdf</Description>
    <AssignedTo>1</AssignedTo>
    <DueDate>2012-08-08T00:00:00+05:30</DueDate>
    <IsActive>true</IsActive>
    <IsArchived>false</IsArchived>
    <CreatedBy>1</CreatedBy>
    <CreatedOn>2012-08-03T18:11:58+05:30</CreatedOn>
    <ModifiedBy>0</ModifiedBy>
    <ModifiedOn>2012-08-03T18:11:58+05:30</ModifiedOn>
  </Tasks>', 0, CAST(0x0000A0A2012E0742 AS DateTime), 0)
INSERT [dbo].[CommonRecycleBin] ([ID], [RecycleTable], [RecycleTableID], [RecycleRows], [CreatedBy], [CreatedOn], [IsRestored]) VALUES (20, N'Tasks', N'2', N'<Tasks>
    <ID>2</ID>
    <Title>ZIndex fix</Title>
    <Description>Z-Index fix</Description>
    <AssignedTo>1</AssignedTo>
    <DueDate>2012-12-31T00:00:00+05:30</DueDate>
    <IsActive>true</IsActive>
    <IsArchived>false</IsArchived>
    <CreatedBy>1</CreatedBy>
    <CreatedOn>2012-06-19T16:46:35+05:30</CreatedOn>
    <ModifiedBy>0</ModifiedBy>
    <ModifiedOn>2012-06-19T16:46:35+05:30</ModifiedOn>
  </Tasks>', 0, CAST(0x0000A0A2012E63EE AS DateTime), 0)
INSERT [dbo].[CommonRecycleBin] ([ID], [RecycleTable], [RecycleTableID], [RecycleRows], [CreatedBy], [CreatedOn], [IsRestored]) VALUES (21, N'Tasks', N'8', N'<Tasks>
    <ID>8</ID>
    <Title>MVVP Project</Title>
    <Description>MVVP Project Prototype task</Description>
    <AssignedTo>1</AssignedTo>
    <DueDate>2012-08-31T00:00:00+05:30</DueDate>
    <IsActive>true</IsActive>
    <IsArchived>false</IsArchived>
    <CreatedBy>1</CreatedBy>
    <CreatedOn>2012-07-31T12:50:41+05:30</CreatedOn>
    <ModifiedBy>0</ModifiedBy>
    <ModifiedOn>2012-07-31T12:50:41+05:30</ModifiedOn>
  </Tasks>', 0, CAST(0x0000A0A2012EC888 AS DateTime), 0)
INSERT [dbo].[CommonRecycleBin] ([ID], [RecycleTable], [RecycleTableID], [RecycleRows], [CreatedBy], [CreatedOn], [IsRestored]) VALUES (22, N'Tasks', N'18', N'<Tasks>
    <ID>18</ID>
    <Title>A A A A A A</Title>
    <Description>A A A A A AA A A A A AA A A A A AA A A A A AA A A A A AA A A A A AA A A A A AA A A A A AA A A A A AA A A A A AA A A A A AA A A A A AA A A A A AA A A A A AA A A A A AA A A A A A</Description>
    <AssignedTo>1</AssignedTo>
    <DueDate>2012-08-08T00:00:00+05:30</DueDate>
    <IsActive>true</IsActive>
    <IsArchived>false</IsArchived>
    <CreatedBy>1</CreatedBy>
    <CreatedOn>2012-08-03T01:09:22+05:30</CreatedOn>
    <ModifiedBy>0</ModifiedBy>
    <ModifiedOn>2012-08-03T01:09:22+05:30</ModifiedOn>
  </Tasks>', 0, CAST(0x0000A0A2012ECFEF AS DateTime), 0)
INSERT [dbo].[CommonRecycleBin] ([ID], [RecycleTable], [RecycleTableID], [RecycleRows], [CreatedBy], [CreatedOn], [IsRestored]) VALUES (23, N'Tasks', N'15', N'<Tasks>
    <ID>15</ID>
    <Title>A Migration Task</Title>
    <Description>A Migration Task</Description>
    <AssignedTo>1</AssignedTo>
    <DueDate>2013-11-15T00:00:00+05:30</DueDate>
    <IsActive>true</IsActive>
    <IsArchived>false</IsArchived>
    <CreatedBy>1</CreatedBy>
    <CreatedOn>2012-08-03T00:55:24+05:30</CreatedOn>
    <ModifiedBy>0</ModifiedBy>
    <ModifiedOn>2012-08-03T00:55:24+05:30</ModifiedOn>
  </Tasks>', 0, CAST(0x0000A0A2012EE559 AS DateTime), 0)
INSERT [dbo].[CommonRecycleBin] ([ID], [RecycleTable], [RecycleTableID], [RecycleRows], [CreatedBy], [CreatedOn], [IsRestored]) VALUES (24, N'Tasks', N'14', N'<Tasks>
    <ID>14</ID>
    <Title>A New SharePoint 15</Title>
    <Description>A SharePoint 15</Description>
    <AssignedTo>1</AssignedTo>
    <DueDate>2012-08-15T00:00:00+05:30</DueDate>
    <IsActive>true</IsActive>
    <IsArchived>false</IsArchived>
    <CreatedBy>1</CreatedBy>
    <CreatedOn>2012-08-02T21:00:36+05:30</CreatedOn>
    <ModifiedBy>0</ModifiedBy>
    <ModifiedOn>2012-08-02T21:00:36+05:30</ModifiedOn>
  </Tasks>', 0, CAST(0x0000A0A2012EE7E3 AS DateTime), 0)
INSERT [dbo].[CommonRecycleBin] ([ID], [RecycleTable], [RecycleTableID], [RecycleRows], [CreatedBy], [CreatedOn], [IsRestored]) VALUES (25, N'Tasks', N'16', N'<Tasks>
    <ID>16</ID>
    <Title>A New SharePoint 15</Title>
    <Description>A SharePoint 15</Description>
    <AssignedTo>1</AssignedTo>
    <DueDate>2012-08-23T00:00:00+05:30</DueDate>
    <IsActive>true</IsActive>
    <IsArchived>false</IsArchived>
    <CreatedBy>1</CreatedBy>
    <CreatedOn>2012-08-03T00:56:25+05:30</CreatedOn>
    <ModifiedBy>0</ModifiedBy>
    <ModifiedOn>2012-08-03T00:56:25+05:30</ModifiedOn>
  </Tasks>', 0, CAST(0x0000A0A2012EEA7F AS DateTime), 0)
INSERT [dbo].[CommonRecycleBin] ([ID], [RecycleTable], [RecycleTableID], [RecycleRows], [CreatedBy], [CreatedOn], [IsRestored]) VALUES (26, N'Tasks', N'17', N'<Tasks>
    <ID>17</ID>
    <Title>aaaaaaaaa</Title>
    <Description>aaaaaaaaaaaaaaa</Description>
    <AssignedTo>1</AssignedTo>
    <DueDate>2012-08-31T00:00:00+05:30</DueDate>
    <IsActive>true</IsActive>
    <IsArchived>false</IsArchived>
    <CreatedBy>1</CreatedBy>
    <CreatedOn>2012-08-03T01:08:49+05:30</CreatedOn>
    <ModifiedBy>0</ModifiedBy>
    <ModifiedOn>2012-08-03T01:08:49+05:30</ModifiedOn>
  </Tasks>', 0, CAST(0x0000A0A2012EEDB6 AS DateTime), 0)
INSERT [dbo].[CommonRecycleBin] ([ID], [RecycleTable], [RecycleTableID], [RecycleRows], [CreatedBy], [CreatedOn], [IsRestored]) VALUES (27, N'Tasks', N'91', N'<Tasks>
    <ID>91</ID>
    <Title>Demo Task 2</Title>
    <Description>New task</Description>
    <AssignedTo>1</AssignedTo>
    <DueDate>2012-09-28T00:00:00+05:30</DueDate>
    <IsActive>true</IsActive>
    <IsArchived>false</IsArchived>
    <CreatedBy>1</CreatedBy>
    <CreatedOn>2012-09-07T20:25:27+05:30</CreatedOn>
    <ModifiedBy>0</ModifiedBy>
    <ModifiedOn>2012-09-07T20:25:27+05:30</ModifiedOn>
  </Tasks>', 1, CAST(0x0000A0C50150BED7 AS DateTime), 0)
INSERT [dbo].[CommonRecycleBin] ([ID], [RecycleTable], [RecycleTableID], [RecycleRows], [CreatedBy], [CreatedOn], [IsRestored]) VALUES (28, N'Tasks', N'92', N'<Tasks>
    <ID>92</ID>
    <Title>Demo 3 2</Title>
    <Description>Task</Description>
    <AssignedTo>1</AssignedTo>
    <DueDate>2012-09-21T00:00:00+05:30</DueDate>
    <IsActive>true</IsActive>
    <IsArchived>false</IsArchived>
    <CreatedBy>1</CreatedBy>
    <CreatedOn>2012-09-07T21:03:09+05:30</CreatedOn>
    <ModifiedBy>0</ModifiedBy>
    <ModifiedOn>2012-09-22T13:04:12+05:30</ModifiedOn>
  </Tasks>', 1, CAST(0x0000A0D400D77F02 AS DateTime), 0)
INSERT [dbo].[CommonRecycleBin] ([ID], [RecycleTable], [RecycleTableID], [RecycleRows], [CreatedBy], [CreatedOn], [IsRestored]) VALUES (29, N'Tasks', N'95', N'<Tasks>
    <ID>95</ID>
    <Title>Demo</Title>
    <Description>Demo</Description>
    <AssignedTo>1</AssignedTo>
    <DueDate>2012-10-27T00:00:00+05:30</DueDate>
    <IsActive>true</IsActive>
    <IsArchived>false</IsArchived>
    <CreatedBy>1</CreatedBy>
    <CreatedOn>2012-10-22T12:24:59+05:30</CreatedOn>
    <ModifiedBy>0</ModifiedBy>
    <ModifiedOn>2012-10-22T12:24:59+05:30</ModifiedOn>
  </Tasks>', 1, CAST(0x0000A0F200CCC22F AS DateTime), 0)
INSERT [dbo].[CommonRecycleBin] ([ID], [RecycleTable], [RecycleTableID], [RecycleRows], [CreatedBy], [CreatedOn], [IsRestored]) VALUES (30, N'Tasks', N'93', N'<Tasks>
    <ID>93</ID>
    <Title>Demo 3</Title>
    <Description>Task</Description>
    <AssignedTo>1</AssignedTo>
    <DueDate>2012-09-21T00:00:00+05:30</DueDate>
    <IsActive>true</IsActive>
    <IsArchived>false</IsArchived>
    <CreatedBy>1</CreatedBy>
    <CreatedOn>2012-09-07T21:03:26+05:30</CreatedOn>
    <ModifiedBy>0</ModifiedBy>
    <ModifiedOn>2012-09-07T21:03:26+05:30</ModifiedOn>
  </Tasks>', 1, CAST(0x0000A0F200CCC9CF AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[CommonRecycleBin] OFF
/****** Object:  Table [dbo].[Tasks]    Script Date: 04/23/2014 02:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tasks](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](200) NOT NULL,
	[Description] [varchar](200) NOT NULL,
	[AssignedTo] [int] NOT NULL,
	[DueDate] [datetime] NOT NULL,
	[IsActive] [bit] NULL,
	[IsArchived] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Tasks] ON
INSERT [dbo].[Tasks] ([ID], [Title], [Description], [AssignedTo], [DueDate], [IsActive], [IsArchived], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (94, N'A New Task Updated', N'A New Task', 3, CAST(0x0000A0DB00000000 AS DateTime), 1, 0, 1, CAST(0x0000A0D400D826C4 AS DateTime), 0, CAST(0x0000A0F200CCAF38 AS DateTime))
INSERT [dbo].[Tasks] ([ID], [Title], [Description], [AssignedTo], [DueDate], [IsActive], [IsArchived], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (96, N'Knockout Training', N'No details', 1, CAST(0x0000A29200000000 AS DateTime), 1, 0, 2, CAST(0x0000A29200000000 AS DateTime), 1, CAST(0x0000A29200000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Tasks] OFF
/****** Object:  Table [dbo].[UserProfile]    Script Date: 04/23/2014 02:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserProfile](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[MobileNo] [varchar](13) NOT NULL,
	[WebSite] [varchar](60) NOT NULL,
	[IsActive] [bit] NULL,
	[IsArchived] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[UserProfile] ON
INSERT [dbo].[UserProfile] ([ID], [UserID], [FirstName], [LastName], [Address], [MobileNo], [WebSite], [IsActive], [IsArchived], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, 0, N'Sushant', N'Kulkarni', N'fgsdfsd', N'9196891743', N'http://www.google.com', 1, 0, 1, CAST(0x0000A0B2017381DC AS DateTime), 0, CAST(0x0000A0B2017381DC AS DateTime))
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
/****** Object:  Table [dbo].[UserManagementUser]    Script Date: 04/23/2014 02:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserManagementUser](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NULL,
	[UserPassword] [varchar](20) NULL,
	[Email] [varchar](80) NULL,
	[IsAdmin] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[UserManagementUser] ON
INSERT [dbo].[UserManagementUser] ([ID], [UserName], [UserPassword], [Email], [IsAdmin]) VALUES (1, N'admin', N'admin', N'sushskulkarni@asda.com', 1)
INSERT [dbo].[UserManagementUser] ([ID], [UserName], [UserPassword], [Email], [IsAdmin]) VALUES (3, N'shrikant', N'admin', N'shrikants@sdff.com', 1)
SET IDENTITY_INSERT [dbo].[UserManagementUser] OFF
/****** Object:  StoredProcedure [dbo].[UserManagementLogin]    Script Date: 04/23/2014 02:49:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sushant Kulkarni
-- Create date: 01/02/2011
-- Description:	Login Details
-- =============================================
CREATE PROCEDURE [dbo].[UserManagementLogin]
	@username varchar(100)
	,@password varchar(100)
AS
BEGIN
		
	if(EXISTS(SELECT * FROM [UserManagementUser] WHERE UserName = @username AND UserPassword = @password))
	BEGIN
		SELECT * FROM [UserManagementUser] WHERE UserName = @username AND UserPassword = @password		
	END
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserPassword]    Script Date: 04/23/2014 02:49:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sushant Kulkarni
-- Create date: 19/06/2012
-- Description:	Read user with password
-- =============================================
CREATE PROCEDURE [dbo].[UpdateUserPassword] 
	(
		@ID	int,
		@newpassword varchar(200)
	)
AS
BEGIN
	UPDATE	UserManagementUser
	SET		UserPassword = @newpassword
	WHERE	ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[RecycleRecord]    Script Date: 04/23/2014 02:49:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sushant Kulkarni
-- Create date: 17/02/2012
-- Description:	Recycle Table Record
-- =============================================
CREATE PROCEDURE [dbo].[RecycleRecord]
	(
		@RecycleTable varchar(50)
		,@RecycleTableID varchar(50)
		,@RecycleRows text
		,@CreatedBy int
		,@IsRestored bit = 0
	)
AS
BEGIN
	SET NOCOUNT ON;
	
	Declare
		@archiveSql	varchar(MAX)
		
	SET @archiveSql	= 'DELETE FROM '+@RecycleTable+' WHERE ID = '+@RecycleTableID
	
	EXEC(@archiveSql)
	
	INSERT INTO [CommonRecycleBin]
	(
		[RecycleTable]
		,[RecycleTableID]
		,[RecycleRows]
		,[CreatedBy]
		,[CreatedOn]
		,[IsRestored]
	)
	VALUES
	(
		@RecycleTable
		,@RecycleTableID
		,@RecycleRows
		,@CreatedBy
		,getdate()
		,@IsRestored
	)
	
END
GO
/****** Object:  StoredProcedure [dbo].[ReadUsers]    Script Date: 04/23/2014 02:49:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sushant Kulkarni
-- Create date: 12/06/2012
-- Description:	Read Tasks
-- =============================================
CREATE PROCEDURE [dbo].[ReadUsers] 
	(
		@ID	int = 0
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    IF @ID = 0
		BEGIN
			SELECT	*
			FROM	[UserManagementUser]
		END
    ELSE
		BEGIN
			SELECT	*
			FROM	[UserManagementUser]
			WHERE	ID = @ID
		END
END
GO
/****** Object:  StoredProcedure [dbo].[ReadUserProfile]    Script Date: 04/23/2014 02:49:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--===================================================================================

                            CREATE PROCEDURE [dbo].[ReadUserProfile]
	                            (
                                    @ID   int
	                            )
                            AS
                            BEGIN
	                            SET NOCOUNT ON;
                                IF @ID = 0
BEGIN
SELECT ID
,UserID
,FirstName
,LastName
,Address
,MobileNo
,WebSite
,IsActive
,IsArchived
,CreatedBy
,CreatedOn
,ModifiedBy
,ModifiedOn
 FROM UserProfile
END

ELSE
BEGIN
SELECT ID
,UserID
,FirstName
,LastName
,Address
,MobileNo
,WebSite
,IsActive
,IsArchived
,CreatedBy
,CreatedOn
,ModifiedBy
,ModifiedOn
 FROM UserProfile WHERE ID = @ID
END

                            END
GO
/****** Object:  StoredProcedure [dbo].[ReadUserData]    Script Date: 04/23/2014 02:49:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sushant Kulkarni
-- Create date: 19/06/2012
-- Description:	Read user with password
-- =============================================
CREATE PROCEDURE [dbo].[ReadUserData] 
	(
		@ID	int,
		@password varchar(200)
	)
AS
BEGIN
	SELECT	*
	FROM	UserManagementUser
	WHERE	ID = @ID
	AND		UserPassword = @password
END
GO
/****** Object:  StoredProcedure [dbo].[ReadTrash]    Script Date: 04/23/2014 02:49:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sushant Kulkarni
-- Create date: 18/02/2012
-- Description:	Read Recycle Rows
-- =============================================
CREATE PROCEDURE [dbo].[ReadTrash] 
	(
		@ID int = 0
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF @Id = 0
		BEGIN
			SELECT	R.*,
					U.UserName CreatedByValue
			FROM	CommonRecycleBin R
			INNER JOIN [UserManagementUser] U
			ON		R.CreatedBy = U.ID
		END
	ELSE
		BEGIN
			SELECT	R.*,
					U.UserName CreatedByValue
			FROM	CommonRecycleBin R
			INNER JOIN [UserManagementUser] U
			ON		R.CreatedBy = U.ID
			WHERE	R.ID = @ID
		END

END
GO
/****** Object:  StoredProcedure [dbo].[ReadTasks]    Script Date: 04/23/2014 02:49:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sushant Kulkarni
-- Create date: 12/06/2012
-- Description:	Read Tasks
-- =============================================
CREATE PROCEDURE [dbo].[ReadTasks] 
	(
		@ID	int = 0
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    IF @ID = 0
		BEGIN
			SELECT	T.*, U.username
			FROM	[Tasks] T
			INNER JOIN
					UserManagementUser U
			ON		T.AssignedTo = U.ID
		END
    ELSE
		BEGIN
			SELECT	T.*, U.username
			FROM	[Tasks] T
			INNER JOIN
					UserManagementUser U
			ON		T.AssignedTo = U.ID
			WHERE	T.ID = @ID
		END
END
GO
/****** Object:  StoredProcedure [dbo].[ManageUserProfile]    Script Date: 04/23/2014 02:49:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ManageUserProfile]
	                            (
                                    				@ID    int
				,@UserID    int
				,@FirstName    varchar(50)
				,@LastName    varchar(50)
				,@Address    varchar(100)
				,@MobileNo    varchar(13)
				,@WebSite    varchar(60)
				,@IsActive    bit
				,@IsArchived    bit
				,@CreatedBy    int
				,@CreatedOn    datetime
				,@ModifiedBy    int
				,@ModifiedOn    datetime

	                            )
                            AS
                            BEGIN
	                            SET NOCOUNT ON;
                                IF @ID = 0
BEGIN
INSERT INTO UserProfile
                                (
                                    
				UserID
				,FirstName
				,LastName
				,Address
				,MobileNo
				,WebSite
				,IsActive
				,IsArchived
				,CreatedBy
				,CreatedOn
				,ModifiedBy
				,ModifiedOn
                                )
                             VALUES
                                (
                                    
				@UserID
				,@FirstName
				,@LastName
				,@Address
				,@MobileNo
				,@WebSite
				,@IsActive
				,@IsArchived
				,@CreatedBy
				,@CreatedOn
				,@ModifiedBy
				,@ModifiedOn
	                            )
END

ELSE
BEGIN
Update UserProfile SET UserID = @UserID,FirstName = @FirstName,LastName = @LastName,Address = @Address,MobileNo = @MobileNo,WebSite = @WebSite,IsActive = @IsActive,IsArchived = @IsArchived,CreatedBy = @CreatedBy,CreatedOn = @CreatedOn,ModifiedBy = @ModifiedBy,ModifiedOn = @ModifiedOn WHERE ID = @ID
END

                            END
GO
/****** Object:  StoredProcedure [dbo].[ManageUser]    Script Date: 04/23/2014 02:49:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sushant Kulkarni
-- Create date: 12/06/2012
-- Description:	Manage Task
-- =============================================
CREATE PROCEDURE [dbo].[ManageUser]
	(
		@ID	int
		,@UserName varchar(100)
        ,@UserPassword varchar(20)
        ,@Email varchar(80)
        ,@IsAdmin bit
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    IF @ID = 0
		BEGIN
			INSERT INTO [UserManagementUser]
				(
					[UserName]
					,[UserPassword]
					,[Email]
					,[IsAdmin]
				)
			VALUES
				(
					@UserName
					,@UserPassword
					,@Email
					,@IsAdmin
				)
		END
    ELSE
    BEGIN
		UPDATE [UserManagementUser]
		SET [UserName] = @UserName
		  ,[UserPassword] = @UserPassword
		  ,[Email] = @Email
		  ,[IsAdmin] = @IsAdmin
		WHERE ID = @ID
    END
END
GO
/****** Object:  StoredProcedure [dbo].[ManageTasks]    Script Date: 04/23/2014 02:49:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sushant Kulkarni
-- Create date: 12/06/2012
-- Description:	Manage Task
-- =============================================
CREATE PROCEDURE [dbo].[ManageTasks] 
	(
		@ID	int
		,@Title varchar(200)
		,@Description varchar(200)
		,@AssignedTo int
		,@DueDate datetime
		,@IsActive bit
		,@IsArchived bit
		,@CreatedBy int
		,@CreatedOn datetime
		,@ModifiedBy int
		,@ModifiedOn datetime
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    IF @ID = 0
    BEGIN
		INSERT INTO [Tasks]
			(
				[Title]
				,[Description]
				,[AssignedTo]
				,[DueDate]
				,[IsActive]
				,[IsArchived]
				,[CreatedBy]
				,[CreatedOn]
				,[ModifiedBy]
				,[ModifiedOn]
			)
		VALUES
			(
				@Title
				,@Description
				,@AssignedTo
				,@DueDate
				,@IsActive
				,@IsArchived
				,@CreatedBy
				,@CreatedOn
				,@ModifiedBy
				,@ModifiedOn
			)
    END
    ELSE
    BEGIN
		UPDATE	[Tasks]
		SET		[Title] = @Title
				,[Description] = @Description
				,[AssignedTo] = @AssignedTo
				,[DueDate] = @DueDate
				,[IsActive] = @IsActive
				,[IsArchived] = @IsArchived
				,[ModifiedBy] = @ModifiedBy
				,[ModifiedOn] = @ModifiedOn
		 WHERE	ID = @ID
    END
END
GO
/****** Object:  Default [DF_RecycleBin_IsRestored]    Script Date: 04/23/2014 02:49:09 ******/
ALTER TABLE [dbo].[CommonRecycleBin] ADD  CONSTRAINT [DF_RecycleBin_IsRestored]  DEFAULT ((0)) FOR [IsRestored]
GO
