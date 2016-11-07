SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [Production].[ProductCostHistory] (
		[ProductID]        [int] NOT NULL,
		[StartDate]        [datetime] NOT NULL,
		[EndDate]          [datetime] NULL,
		[StandardCost]     [money] NOT NULL,
		[ModifiedDate]     [datetime] NOT NULL,
		CONSTRAINT [PK_ProductCostHistory_ProductID_StartDate]
		PRIMARY KEY
		CLUSTERED
		([ProductID], [StartDate])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Production].[ProductCostHistory]
	ADD
	CONSTRAINT [CK_ProductCostHistory_EndDate]
	CHECK
	([EndDate]>=[StartDate] OR [EndDate] IS NULL)
GO
ALTER TABLE [Production].[ProductCostHistory]
CHECK CONSTRAINT [CK_ProductCostHistory_EndDate]
GO
ALTER TABLE [Production].[ProductCostHistory]
	ADD
	CONSTRAINT [CK_ProductCostHistory_StandardCost]
	CHECK
	([StandardCost]>=(0.00))
GO
ALTER TABLE [Production].[ProductCostHistory]
CHECK CONSTRAINT [CK_ProductCostHistory_StandardCost]
GO
ALTER TABLE [Production].[ProductCostHistory]
	ADD
	CONSTRAINT [DF_ProductCostHistory_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Production].[ProductCostHistory]
	WITH CHECK
	ADD CONSTRAINT [FK_ProductCostHistory_Product_ProductID]
	FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID])
ALTER TABLE [Production].[ProductCostHistory]
	CHECK CONSTRAINT [FK_ProductCostHistory_Product_ProductID]

GO
ALTER TABLE [Production].[ProductCostHistory] SET (LOCK_ESCALATION = TABLE)
GO
