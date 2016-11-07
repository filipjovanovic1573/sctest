SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Production].[BillOfMaterials] (
		[BillOfMaterialsID]     [int] IDENTITY(1, 1) NOT NULL,
		[ProductAssemblyID]     [int] NULL,
		[ComponentID]           [int] NOT NULL,
		[StartDate]             [datetime] NOT NULL,
		[EndDate]               [datetime] NULL,
		[UnitMeasureCode]       [nchar](3) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[BOMLevel]              [smallint] NOT NULL,
		[PerAssemblyQty]        [decimal](8, 2) NOT NULL,
		[ModifiedDate]          [datetime] NOT NULL,
		CONSTRAINT [PK_BillOfMaterials_BillOfMaterialsID]
		PRIMARY KEY
		NONCLUSTERED
		([BillOfMaterialsID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Production].[BillOfMaterials]
	ADD
	CONSTRAINT [CK_BillOfMaterials_BOMLevel]
	CHECK
	([ProductAssemblyID] IS NULL AND [BOMLevel]=(0) AND [PerAssemblyQty]=(1.00) OR [ProductAssemblyID] IS NOT NULL AND [BOMLevel]>=(1))
GO
ALTER TABLE [Production].[BillOfMaterials]
CHECK CONSTRAINT [CK_BillOfMaterials_BOMLevel]
GO
ALTER TABLE [Production].[BillOfMaterials]
	ADD
	CONSTRAINT [CK_BillOfMaterials_EndDate]
	CHECK
	([EndDate]>[StartDate] OR [EndDate] IS NULL)
GO
ALTER TABLE [Production].[BillOfMaterials]
CHECK CONSTRAINT [CK_BillOfMaterials_EndDate]
GO
ALTER TABLE [Production].[BillOfMaterials]
	ADD
	CONSTRAINT [CK_BillOfMaterials_PerAssemblyQty]
	CHECK
	([PerAssemblyQty]>=(1.00))
GO
ALTER TABLE [Production].[BillOfMaterials]
CHECK CONSTRAINT [CK_BillOfMaterials_PerAssemblyQty]
GO
ALTER TABLE [Production].[BillOfMaterials]
	ADD
	CONSTRAINT [CK_BillOfMaterials_ProductAssemblyID]
	CHECK
	([ProductAssemblyID]<>[ComponentID])
GO
ALTER TABLE [Production].[BillOfMaterials]
CHECK CONSTRAINT [CK_BillOfMaterials_ProductAssemblyID]
GO
ALTER TABLE [Production].[BillOfMaterials]
	ADD
	CONSTRAINT [DF_BillOfMaterials_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Production].[BillOfMaterials]
	ADD
	CONSTRAINT [DF_BillOfMaterials_PerAssemblyQty]
	DEFAULT ((1.00)) FOR [PerAssemblyQty]
GO
ALTER TABLE [Production].[BillOfMaterials]
	ADD
	CONSTRAINT [DF_BillOfMaterials_StartDate]
	DEFAULT (getdate()) FOR [StartDate]
GO
ALTER TABLE [Production].[BillOfMaterials]
	WITH CHECK
	ADD CONSTRAINT [FK_BillOfMaterials_Product_ComponentID]
	FOREIGN KEY ([ComponentID]) REFERENCES [Production].[Product] ([ProductID])
ALTER TABLE [Production].[BillOfMaterials]
	CHECK CONSTRAINT [FK_BillOfMaterials_Product_ComponentID]

GO
ALTER TABLE [Production].[BillOfMaterials]
	WITH CHECK
	ADD CONSTRAINT [FK_BillOfMaterials_Product_ProductAssemblyID]
	FOREIGN KEY ([ProductAssemblyID]) REFERENCES [Production].[Product] ([ProductID])
ALTER TABLE [Production].[BillOfMaterials]
	CHECK CONSTRAINT [FK_BillOfMaterials_Product_ProductAssemblyID]

GO
ALTER TABLE [Production].[BillOfMaterials]
	WITH CHECK
	ADD CONSTRAINT [FK_BillOfMaterials_UnitMeasure_UnitMeasureCode]
	FOREIGN KEY ([UnitMeasureCode]) REFERENCES [Production].[UnitMeasure] ([UnitMeasureCode])
ALTER TABLE [Production].[BillOfMaterials]
	CHECK CONSTRAINT [FK_BillOfMaterials_UnitMeasure_UnitMeasureCode]

GO
CREATE UNIQUE CLUSTERED INDEX [AK_BillOfMaterials_ProductAssemblyID_ComponentID_StartDate]
	ON [Production].[BillOfMaterials] ([ProductAssemblyID], [ComponentID], [StartDate])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_BillOfMaterials_UnitMeasureCode]
	ON [Production].[BillOfMaterials] ([UnitMeasureCode])
	ON [PRIMARY]
GO
ALTER TABLE [Production].[BillOfMaterials] SET (LOCK_ESCALATION = TABLE)
GO
