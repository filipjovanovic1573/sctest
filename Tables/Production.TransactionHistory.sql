SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Production].[TransactionHistory] (
		[TransactionID]            [int] IDENTITY(100000, 1) NOT NULL,
		[ProductID]                [int] NOT NULL,
		[ReferenceOrderID]         [int] NOT NULL,
		[ReferenceOrderLineID]     [int] NOT NULL,
		[TransactionDate]          [datetime] NOT NULL,
		[TransactionType]          [nchar](1) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[Quantity]                 [int] NOT NULL,
		[ActualCost]               [money] NOT NULL,
		[ModifiedDate]             [datetime] NOT NULL,
		CONSTRAINT [PK_TransactionHistory_TransactionID]
		PRIMARY KEY
		CLUSTERED
		([TransactionID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Production].[TransactionHistory]
	ADD
	CONSTRAINT [CK_TransactionHistory_TransactionType]
	CHECK
	(upper([TransactionType])='P' OR upper([TransactionType])='S' OR upper([TransactionType])='W')
GO
ALTER TABLE [Production].[TransactionHistory]
CHECK CONSTRAINT [CK_TransactionHistory_TransactionType]
GO
ALTER TABLE [Production].[TransactionHistory]
	ADD
	CONSTRAINT [DF_TransactionHistory_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Production].[TransactionHistory]
	ADD
	CONSTRAINT [DF_TransactionHistory_ReferenceOrderLineID]
	DEFAULT ((0)) FOR [ReferenceOrderLineID]
GO
ALTER TABLE [Production].[TransactionHistory]
	ADD
	CONSTRAINT [DF_TransactionHistory_TransactionDate]
	DEFAULT (getdate()) FOR [TransactionDate]
GO
ALTER TABLE [Production].[TransactionHistory]
	WITH CHECK
	ADD CONSTRAINT [FK_TransactionHistory_Product_ProductID]
	FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID])
ALTER TABLE [Production].[TransactionHistory]
	CHECK CONSTRAINT [FK_TransactionHistory_Product_ProductID]

GO
CREATE NONCLUSTERED INDEX [IX_TransactionHistory_ProductID]
	ON [Production].[TransactionHistory] ([ProductID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TransactionHistory_ReferenceOrderID_ReferenceOrderLineID]
	ON [Production].[TransactionHistory] ([ReferenceOrderID], [ReferenceOrderLineID])
	ON [PRIMARY]
GO
ALTER TABLE [Production].[TransactionHistory] SET (LOCK_ESCALATION = TABLE)
GO
