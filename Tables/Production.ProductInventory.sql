SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Production].[ProductInventory] (
		[ProductID]        [int] NOT NULL,
		[LocationID]       [smallint] NOT NULL,
		[Shelf]            [nvarchar](10) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[Bin]              [tinyint] NOT NULL,
		[Quantity]         [smallint] NOT NULL,
		[rowguid]          [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]     [datetime] NOT NULL,
		CONSTRAINT [PK_ProductInventory_ProductID_LocationID]
		PRIMARY KEY
		CLUSTERED
		([ProductID], [LocationID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Production].[ProductInventory]
	ADD
	CONSTRAINT [CK_ProductInventory_Bin]
	CHECK
	([Bin]>=(0) AND [Bin]<=(100))
GO
ALTER TABLE [Production].[ProductInventory]
CHECK CONSTRAINT [CK_ProductInventory_Bin]
GO
ALTER TABLE [Production].[ProductInventory]
	ADD
	CONSTRAINT [CK_ProductInventory_Shelf]
	CHECK
	([Shelf] like '[A-Za-z]' OR [Shelf]='N/A')
GO
ALTER TABLE [Production].[ProductInventory]
CHECK CONSTRAINT [CK_ProductInventory_Shelf]
GO
ALTER TABLE [Production].[ProductInventory]
	ADD
	CONSTRAINT [DF_ProductInventory_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Production].[ProductInventory]
	ADD
	CONSTRAINT [DF_ProductInventory_Quantity]
	DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [Production].[ProductInventory]
	ADD
	CONSTRAINT [DF_ProductInventory_rowguid]
	DEFAULT (newid()) FOR [rowguid]
GO
ALTER TABLE [Production].[ProductInventory]
	WITH CHECK
	ADD CONSTRAINT [FK_ProductInventory_Location_LocationID]
	FOREIGN KEY ([LocationID]) REFERENCES [Production].[Location] ([LocationID])
ALTER TABLE [Production].[ProductInventory]
	CHECK CONSTRAINT [FK_ProductInventory_Location_LocationID]

GO
ALTER TABLE [Production].[ProductInventory]
	WITH CHECK
	ADD CONSTRAINT [FK_ProductInventory_Product_ProductID]
	FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID])
ALTER TABLE [Production].[ProductInventory]
	CHECK CONSTRAINT [FK_ProductInventory_Product_ProductID]

GO
ALTER TABLE [Production].[ProductInventory] SET (LOCK_ESCALATION = TABLE)
GO
