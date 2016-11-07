SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Production].[ProductModel] (
		[ProductModelID]         [int] IDENTITY(1, 1) NOT NULL,
		[Name]                   [dbo].[Name] NOT NULL,
		[CatalogDescription]     [xml](CONTENT [Production].[ProductDescriptionSchemaCollection]) NULL,
		[Instructions]           [xml](CONTENT [Production].[ManuInstructionsSchemaCollection]) NULL,
		[rowguid]                [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]           [datetime] NOT NULL,
		CONSTRAINT [PK_ProductModel_ProductModelID]
		PRIMARY KEY
		CLUSTERED
		([ProductModelID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [Production].[ProductModel]
	ADD
	CONSTRAINT [DF_ProductModel_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Production].[ProductModel]
	ADD
	CONSTRAINT [DF_ProductModel_rowguid]
	DEFAULT (newid()) FOR [rowguid]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_ProductModel_Name]
	ON [Production].[ProductModel] ([Name])
	ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_ProductModel_rowguid]
	ON [Production].[ProductModel] ([rowguid])
	ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE PRIMARY XML INDEX [PXML_ProductModel_CatalogDescription]
	ON [Production].[ProductModel] ([CatalogDescription])
GO
SET ANSI_PADDING ON
GO
CREATE PRIMARY XML INDEX [PXML_ProductModel_Instructions]
	ON [Production].[ProductModel] ([Instructions])
GO
ALTER TABLE [Production].[ProductModel] SET (LOCK_ESCALATION = TABLE)
GO
