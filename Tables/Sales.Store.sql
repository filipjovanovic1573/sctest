SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Sales].[Store] (
		[BusinessEntityID]     [int] NOT NULL,
		[Name]                 [dbo].[Name] NOT NULL,
		[SalesPersonID]        [int] NULL,
		[Demographics]         [xml](CONTENT [Sales].[StoreSurveySchemaCollection]) NULL,
		[rowguid]              [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]         [datetime] NOT NULL,
		CONSTRAINT [PK_Store_BusinessEntityID]
		PRIMARY KEY
		CLUSTERED
		([BusinessEntityID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [Sales].[Store]
	ADD
	CONSTRAINT [DF_Store_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Sales].[Store]
	ADD
	CONSTRAINT [DF_Store_rowguid]
	DEFAULT (newid()) FOR [rowguid]
GO
ALTER TABLE [Sales].[Store]
	WITH CHECK
	ADD CONSTRAINT [FK_Store_BusinessEntity_BusinessEntityID]
	FOREIGN KEY ([BusinessEntityID]) REFERENCES [Person].[BusinessEntity] ([BusinessEntityID])
ALTER TABLE [Sales].[Store]
	CHECK CONSTRAINT [FK_Store_BusinessEntity_BusinessEntityID]

GO
ALTER TABLE [Sales].[Store]
	WITH CHECK
	ADD CONSTRAINT [FK_Store_SalesPerson_SalesPersonID]
	FOREIGN KEY ([SalesPersonID]) REFERENCES [Sales].[SalesPerson] ([BusinessEntityID])
ALTER TABLE [Sales].[Store]
	CHECK CONSTRAINT [FK_Store_SalesPerson_SalesPersonID]

GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_Store_rowguid]
	ON [Sales].[Store] ([rowguid])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Store_SalesPersonID]
	ON [Sales].[Store] ([SalesPersonID])
	ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE PRIMARY XML INDEX [PXML_Store_Demographics]
	ON [Sales].[Store] ([Demographics])
GO
ALTER TABLE [Sales].[Store] SET (LOCK_ESCALATION = TABLE)
GO
