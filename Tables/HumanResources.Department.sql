SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [HumanResources].[Department] (
		[DepartmentID]     [smallint] IDENTITY(1, 1) NOT NULL,
		[Name]             [dbo].[Name] NOT NULL,
		[GroupName]        [dbo].[Name] NOT NULL,
		[ModifiedDate]     [datetime] NOT NULL,
		CONSTRAINT [PK_Department_DepartmentID]
		PRIMARY KEY
		CLUSTERED
		([DepartmentID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [HumanResources].[Department]
	ADD
	CONSTRAINT [DF_Department_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_Department_Name]
	ON [HumanResources].[Department] ([Name])
	ON [PRIMARY]
GO
ALTER TABLE [HumanResources].[Department] SET (LOCK_ESCALATION = TABLE)
GO
