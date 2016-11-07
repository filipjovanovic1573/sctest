SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Person].[Password] (
		[BusinessEntityID]     [int] NOT NULL,
		[PasswordHash]         [varchar](128) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[PasswordSalt]         [varchar](10) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[rowguid]              [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]         [datetime] NOT NULL,
		CONSTRAINT [PK_Password_BusinessEntityID]
		PRIMARY KEY
		CLUSTERED
		([BusinessEntityID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Person].[Password]
	ADD
	CONSTRAINT [DF_Password_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Person].[Password]
	ADD
	CONSTRAINT [DF_Password_rowguid]
	DEFAULT (newid()) FOR [rowguid]
GO
ALTER TABLE [Person].[Password]
	WITH CHECK
	ADD CONSTRAINT [FK_Password_Person_BusinessEntityID]
	FOREIGN KEY ([BusinessEntityID]) REFERENCES [Person].[Person] ([BusinessEntityID])
ALTER TABLE [Person].[Password]
	CHECK CONSTRAINT [FK_Password_Person_BusinessEntityID]

GO
ALTER TABLE [Person].[Password] SET (LOCK_ESCALATION = TABLE)
GO
