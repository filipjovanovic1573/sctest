SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [Sales].[SpecialOfferProduct] (
		[SpecialOfferID]     [int] NOT NULL,
		[ProductID]          [int] NOT NULL,
		[rowguid]            [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]       [datetime] NOT NULL,
		CONSTRAINT [PK_SpecialOfferProduct_SpecialOfferID_ProductID]
		PRIMARY KEY
		CLUSTERED
		([SpecialOfferID], [ProductID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Sales].[SpecialOfferProduct]
	ADD
	CONSTRAINT [DF_SpecialOfferProduct_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Sales].[SpecialOfferProduct]
	ADD
	CONSTRAINT [DF_SpecialOfferProduct_rowguid]
	DEFAULT (newid()) FOR [rowguid]
GO
ALTER TABLE [Sales].[SpecialOfferProduct]
	WITH CHECK
	ADD CONSTRAINT [FK_SpecialOfferProduct_Product_ProductID]
	FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID])
ALTER TABLE [Sales].[SpecialOfferProduct]
	CHECK CONSTRAINT [FK_SpecialOfferProduct_Product_ProductID]

GO
ALTER TABLE [Sales].[SpecialOfferProduct]
	WITH CHECK
	ADD CONSTRAINT [FK_SpecialOfferProduct_SpecialOffer_SpecialOfferID]
	FOREIGN KEY ([SpecialOfferID]) REFERENCES [Sales].[SpecialOffer] ([SpecialOfferID])
ALTER TABLE [Sales].[SpecialOfferProduct]
	CHECK CONSTRAINT [FK_SpecialOfferProduct_SpecialOffer_SpecialOfferID]

GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_SpecialOfferProduct_rowguid]
	ON [Sales].[SpecialOfferProduct] ([rowguid])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_SpecialOfferProduct_ProductID]
	ON [Sales].[SpecialOfferProduct] ([ProductID])
	ON [PRIMARY]
GO
ALTER TABLE [Sales].[SpecialOfferProduct] SET (LOCK_ESCALATION = TABLE)
GO
