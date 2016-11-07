SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [Person].[BusinessEntityContact] (
		[BusinessEntityID]     [int] NOT NULL,
		[PersonID]             [int] NOT NULL,
		[ContactTypeID]        [int] NOT NULL,
		[rowguid]              [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]         [datetime] NOT NULL,
		CONSTRAINT [PK_BusinessEntityContact_BusinessEntityID_PersonID_ContactTypeID]
		PRIMARY KEY
		CLUSTERED
		([BusinessEntityID], [PersonID], [ContactTypeID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Person].[BusinessEntityContact]
	ADD
	CONSTRAINT [DF_BusinessEntityContact_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Person].[BusinessEntityContact]
	ADD
	CONSTRAINT [DF_BusinessEntityContact_rowguid]
	DEFAULT (newid()) FOR [rowguid]
GO
ALTER TABLE [Person].[BusinessEntityContact]
	WITH CHECK
	ADD CONSTRAINT [FK_BusinessEntityContact_BusinessEntity_BusinessEntityID]
	FOREIGN KEY ([BusinessEntityID]) REFERENCES [Person].[BusinessEntity] ([BusinessEntityID])
ALTER TABLE [Person].[BusinessEntityContact]
	CHECK CONSTRAINT [FK_BusinessEntityContact_BusinessEntity_BusinessEntityID]

GO
ALTER TABLE [Person].[BusinessEntityContact]
	WITH CHECK
	ADD CONSTRAINT [FK_BusinessEntityContact_ContactType_ContactTypeID]
	FOREIGN KEY ([ContactTypeID]) REFERENCES [Person].[ContactType] ([ContactTypeID])
ALTER TABLE [Person].[BusinessEntityContact]
	CHECK CONSTRAINT [FK_BusinessEntityContact_ContactType_ContactTypeID]

GO
ALTER TABLE [Person].[BusinessEntityContact]
	WITH CHECK
	ADD CONSTRAINT [FK_BusinessEntityContact_Person_PersonID]
	FOREIGN KEY ([PersonID]) REFERENCES [Person].[Person] ([BusinessEntityID])
ALTER TABLE [Person].[BusinessEntityContact]
	CHECK CONSTRAINT [FK_BusinessEntityContact_Person_PersonID]

GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_BusinessEntityContact_rowguid]
	ON [Person].[BusinessEntityContact] ([rowguid])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_BusinessEntityContact_ContactTypeID]
	ON [Person].[BusinessEntityContact] ([ContactTypeID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_BusinessEntityContact_PersonID]
	ON [Person].[BusinessEntityContact] ([PersonID])
	ON [PRIMARY]
GO
ALTER TABLE [Person].[BusinessEntityContact] SET (LOCK_ESCALATION = TABLE)
GO
