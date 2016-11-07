SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [Production].[ProductDocument] (
		[ProductID]        [int] NOT NULL,
		[DocumentNode]     [hierarchyid] NOT NULL,
		[ModifiedDate]     [datetime] NOT NULL,
		CONSTRAINT [PK_ProductDocument_ProductID_DocumentNode]
		PRIMARY KEY
		CLUSTERED
		([ProductID], [DocumentNode])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Production].[ProductDocument]
	ADD
	CONSTRAINT [DF_ProductDocument_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Production].[ProductDocument]
	WITH CHECK
	ADD CONSTRAINT [FK_ProductDocument_Document_DocumentNode]
	FOREIGN KEY ([DocumentNode]) REFERENCES [Production].[Document] ([DocumentNode])
ALTER TABLE [Production].[ProductDocument]
	CHECK CONSTRAINT [FK_ProductDocument_Document_DocumentNode]

GO
ALTER TABLE [Production].[ProductDocument]
	WITH CHECK
	ADD CONSTRAINT [FK_ProductDocument_Product_ProductID]
	FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID])
ALTER TABLE [Production].[ProductDocument]
	CHECK CONSTRAINT [FK_ProductDocument_Product_ProductID]

GO
ALTER TABLE [Production].[ProductDocument] SET (LOCK_ESCALATION = TABLE)
GO
