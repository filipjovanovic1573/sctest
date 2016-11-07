SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Person].[EmailAddress] (
		[BusinessEntityID]     [int] NOT NULL,
		[EmailAddressID]       [int] IDENTITY(1, 1) NOT NULL,
		[EmailAddress]         [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[rowguid]              [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]         [datetime] NOT NULL,
		CONSTRAINT [PK_EmailAddress_BusinessEntityID_EmailAddressID]
		PRIMARY KEY
		CLUSTERED
		([BusinessEntityID], [EmailAddressID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Person].[EmailAddress]
	ADD
	CONSTRAINT [DF_EmailAddress_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Person].[EmailAddress]
	ADD
	CONSTRAINT [DF_EmailAddress_rowguid]
	DEFAULT (newid()) FOR [rowguid]
GO
ALTER TABLE [Person].[EmailAddress]
	WITH CHECK
	ADD CONSTRAINT [FK_EmailAddress_Person_BusinessEntityID]
	FOREIGN KEY ([BusinessEntityID]) REFERENCES [Person].[Person] ([BusinessEntityID])
ALTER TABLE [Person].[EmailAddress]
	CHECK CONSTRAINT [FK_EmailAddress_Person_BusinessEntityID]

GO
CREATE NONCLUSTERED INDEX [IX_EmailAddress_EmailAddress]
	ON [Person].[EmailAddress] ([EmailAddress])
	ON [PRIMARY]
GO
ALTER TABLE [Person].[EmailAddress] SET (LOCK_ESCALATION = TABLE)
GO
