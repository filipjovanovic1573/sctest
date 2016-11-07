SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Sales].[SalesTaxRate] (
		[SalesTaxRateID]      [int] IDENTITY(1, 1) NOT NULL,
		[StateProvinceID]     [int] NOT NULL,
		[TaxType]             [tinyint] NOT NULL,
		[TaxRate]             [smallmoney] NOT NULL,
		[Name]                [dbo].[Name] NOT NULL,
		[rowguid]             [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]        [datetime] NOT NULL,
		CONSTRAINT [PK_SalesTaxRate_SalesTaxRateID]
		PRIMARY KEY
		CLUSTERED
		([SalesTaxRateID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Sales].[SalesTaxRate]
	ADD
	CONSTRAINT [CK_SalesTaxRate_TaxType]
	CHECK
	([TaxType]>=(1) AND [TaxType]<=(3))
GO
ALTER TABLE [Sales].[SalesTaxRate]
CHECK CONSTRAINT [CK_SalesTaxRate_TaxType]
GO
ALTER TABLE [Sales].[SalesTaxRate]
	ADD
	CONSTRAINT [DF_SalesTaxRate_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Sales].[SalesTaxRate]
	ADD
	CONSTRAINT [DF_SalesTaxRate_rowguid]
	DEFAULT (newid()) FOR [rowguid]
GO
ALTER TABLE [Sales].[SalesTaxRate]
	ADD
	CONSTRAINT [DF_SalesTaxRate_TaxRate]
	DEFAULT ((0.00)) FOR [TaxRate]
GO
ALTER TABLE [Sales].[SalesTaxRate]
	WITH CHECK
	ADD CONSTRAINT [FK_SalesTaxRate_StateProvince_StateProvinceID]
	FOREIGN KEY ([StateProvinceID]) REFERENCES [Person].[StateProvince] ([StateProvinceID])
ALTER TABLE [Sales].[SalesTaxRate]
	CHECK CONSTRAINT [FK_SalesTaxRate_StateProvince_StateProvinceID]

GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesTaxRate_rowguid]
	ON [Sales].[SalesTaxRate] ([rowguid])
	ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesTaxRate_StateProvinceID_TaxType]
	ON [Sales].[SalesTaxRate] ([StateProvinceID], [TaxType])
	ON [PRIMARY]
GO
ALTER TABLE [Sales].[SalesTaxRate] SET (LOCK_ESCALATION = TABLE)
GO
