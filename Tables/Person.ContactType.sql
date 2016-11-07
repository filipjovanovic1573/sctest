SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Person].[ContactType] (
		[ContactTypeID]     [int] IDENTITY(1, 1) NOT NULL,
		[Name]              [dbo].[Name] NOT NULL,
		[ModifiedDate]      [datetime] NOT NULL,
		CONSTRAINT [PK_ContactType_ContactTypeID]
		PRIMARY KEY
		CLUSTERED
		([ContactTypeID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Person].[ContactType]
	ADD
	CONSTRAINT [DF_ContactType_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_ContactType_Name]
	ON [Person].[ContactType] ([Name])
	ON [PRIMARY]
GO
ALTER TABLE [Person].[ContactType] SET (LOCK_ESCALATION = TABLE)
GO
