SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Production].[Product] (
		[ProductID]                 [int] IDENTITY(1, 1) NOT NULL,
		[Name]                      [dbo].[Name] NOT NULL,
		[ProductNumber]             [nvarchar](25) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[MakeFlag]                  [dbo].[Flag] NOT NULL,
		[FinishedGoodsFlag]         [dbo].[Flag] NOT NULL,
		[Color]                     [nvarchar](15) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[SafetyStockLevel]          [smallint] NOT NULL,
		[ReorderPoint]              [smallint] NOT NULL,
		[StandardCost]              [money] NOT NULL,
		[ListPrice]                 [money] NOT NULL,
		[Size]                      [nvarchar](5) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[SizeUnitMeasureCode]       [nchar](3) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[WeightUnitMeasureCode]     [nchar](3) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[Weight]                    [decimal](8, 2) NULL,
		[DaysToManufacture]         [int] NOT NULL,
		[ProductLine]               [nchar](2) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[Class]                     [nchar](2) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[Style]                     [nchar](2) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[ProductSubcategoryID]      [int] NULL,
		[ProductModelID]            [int] NULL,
		[SellStartDate]             [datetime] NOT NULL,
		[SellEndDate]               [datetime] NULL,
		[DiscontinuedDate]          [datetime] NULL,
		[rowguid]                   [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]              [datetime] NOT NULL,
		CONSTRAINT [PK_Product_ProductID]
		PRIMARY KEY
		CLUSTERED
		([ProductID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Production].[Product]
	ADD
	CONSTRAINT [CK_Product_Class]
	CHECK
	(upper([Class])='H' OR upper([Class])='M' OR upper([Class])='L' OR [Class] IS NULL)
GO
ALTER TABLE [Production].[Product]
CHECK CONSTRAINT [CK_Product_Class]
GO
ALTER TABLE [Production].[Product]
	ADD
	CONSTRAINT [CK_Product_DaysToManufacture]
	CHECK
	([DaysToManufacture]>=(0))
GO
ALTER TABLE [Production].[Product]
CHECK CONSTRAINT [CK_Product_DaysToManufacture]
GO
ALTER TABLE [Production].[Product]
	ADD
	CONSTRAINT [CK_Product_ListPrice]
	CHECK
	([ListPrice]>=(0.00))
GO
ALTER TABLE [Production].[Product]
CHECK CONSTRAINT [CK_Product_ListPrice]
GO
ALTER TABLE [Production].[Product]
	ADD
	CONSTRAINT [CK_Product_ProductLine]
	CHECK
	(upper([ProductLine])='R' OR upper([ProductLine])='M' OR upper([ProductLine])='T' OR upper([ProductLine])='S' OR [ProductLine] IS NULL)
GO
ALTER TABLE [Production].[Product]
CHECK CONSTRAINT [CK_Product_ProductLine]
GO
ALTER TABLE [Production].[Product]
	ADD
	CONSTRAINT [CK_Product_ReorderPoint]
	CHECK
	([ReorderPoint]>(0))
GO
ALTER TABLE [Production].[Product]
CHECK CONSTRAINT [CK_Product_ReorderPoint]
GO
ALTER TABLE [Production].[Product]
	ADD
	CONSTRAINT [CK_Product_SafetyStockLevel]
	CHECK
	([SafetyStockLevel]>(0))
GO
ALTER TABLE [Production].[Product]
CHECK CONSTRAINT [CK_Product_SafetyStockLevel]
GO
ALTER TABLE [Production].[Product]
	ADD
	CONSTRAINT [CK_Product_SellEndDate]
	CHECK
	([SellEndDate]>=[SellStartDate] OR [SellEndDate] IS NULL)
GO
ALTER TABLE [Production].[Product]
CHECK CONSTRAINT [CK_Product_SellEndDate]
GO
ALTER TABLE [Production].[Product]
	ADD
	CONSTRAINT [CK_Product_StandardCost]
	CHECK
	([StandardCost]>=(0.00))
GO
ALTER TABLE [Production].[Product]
CHECK CONSTRAINT [CK_Product_StandardCost]
GO
ALTER TABLE [Production].[Product]
	ADD
	CONSTRAINT [CK_Product_Style]
	CHECK
	(upper([Style])='U' OR upper([Style])='M' OR upper([Style])='W' OR [Style] IS NULL)
GO
ALTER TABLE [Production].[Product]
CHECK CONSTRAINT [CK_Product_Style]
GO
ALTER TABLE [Production].[Product]
	ADD
	CONSTRAINT [CK_Product_Weight]
	CHECK
	([Weight]>(0.00))
GO
ALTER TABLE [Production].[Product]
CHECK CONSTRAINT [CK_Product_Weight]
GO
ALTER TABLE [Production].[Product]
	ADD
	CONSTRAINT [DF_Product_FinishedGoodsFlag]
	DEFAULT ((1)) FOR [FinishedGoodsFlag]
GO
ALTER TABLE [Production].[Product]
	ADD
	CONSTRAINT [DF_Product_MakeFlag]
	DEFAULT ((1)) FOR [MakeFlag]
GO
ALTER TABLE [Production].[Product]
	ADD
	CONSTRAINT [DF_Product_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Production].[Product]
	ADD
	CONSTRAINT [DF_Product_rowguid]
	DEFAULT (newid()) FOR [rowguid]
GO
ALTER TABLE [Production].[Product]
	WITH CHECK
	ADD CONSTRAINT [FK_Product_ProductModel_ProductModelID]
	FOREIGN KEY ([ProductModelID]) REFERENCES [Production].[ProductModel] ([ProductModelID])
ALTER TABLE [Production].[Product]
	CHECK CONSTRAINT [FK_Product_ProductModel_ProductModelID]

GO
ALTER TABLE [Production].[Product]
	WITH CHECK
	ADD CONSTRAINT [FK_Product_ProductSubcategory_ProductSubcategoryID]
	FOREIGN KEY ([ProductSubcategoryID]) REFERENCES [Production].[ProductSubcategory] ([ProductSubcategoryID])
ALTER TABLE [Production].[Product]
	CHECK CONSTRAINT [FK_Product_ProductSubcategory_ProductSubcategoryID]

GO
ALTER TABLE [Production].[Product]
	WITH CHECK
	ADD CONSTRAINT [FK_Product_UnitMeasure_SizeUnitMeasureCode]
	FOREIGN KEY ([SizeUnitMeasureCode]) REFERENCES [Production].[UnitMeasure] ([UnitMeasureCode])
ALTER TABLE [Production].[Product]
	CHECK CONSTRAINT [FK_Product_UnitMeasure_SizeUnitMeasureCode]

GO
ALTER TABLE [Production].[Product]
	WITH CHECK
	ADD CONSTRAINT [FK_Product_UnitMeasure_WeightUnitMeasureCode]
	FOREIGN KEY ([WeightUnitMeasureCode]) REFERENCES [Production].[UnitMeasure] ([UnitMeasureCode])
ALTER TABLE [Production].[Product]
	CHECK CONSTRAINT [FK_Product_UnitMeasure_WeightUnitMeasureCode]

GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_Product_Name]
	ON [Production].[Product] ([Name])
	ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_Product_ProductNumber]
	ON [Production].[Product] ([ProductNumber])
	ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_Product_rowguid]
	ON [Production].[Product] ([rowguid])
	ON [PRIMARY]
GO
ALTER TABLE [Production].[Product] SET (LOCK_ESCALATION = TABLE)
GO
