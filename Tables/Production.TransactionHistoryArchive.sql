SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Production].[TransactionHistoryArchive] (
		[TransactionID]            [int] NOT NULL,
		[ProductID]                [int] NOT NULL,
		[ReferenceOrderID]         [int] NOT NULL,
		[ReferenceOrderLineID]     [int] NOT NULL,
		[TransactionDate]          [datetime] NOT NULL,
		[TransactionType]          [nchar](1) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[Quantity]                 [int] NOT NULL,
		[ActualCost]               [money] NOT NULL,
		[ModifiedDate]             [datetime] NOT NULL,
		CONSTRAINT [PK_TransactionHistoryArchive_TransactionID]
		PRIMARY KEY
		CLUSTERED
		([TransactionID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Production].[TransactionHistoryArchive]
	ADD
	CONSTRAINT [CK_TransactionHistoryArchive_TransactionType]
	CHECK
	(upper([TransactionType])='P' OR upper([TransactionType])='S' OR upper([TransactionType])='W')
GO
ALTER TABLE [Production].[TransactionHistoryArchive]
CHECK CONSTRAINT [CK_TransactionHistoryArchive_TransactionType]
GO
ALTER TABLE [Production].[TransactionHistoryArchive]
	ADD
	CONSTRAINT [DF_TransactionHistoryArchive_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Production].[TransactionHistoryArchive]
	ADD
	CONSTRAINT [DF_TransactionHistoryArchive_ReferenceOrderLineID]
	DEFAULT ((0)) FOR [ReferenceOrderLineID]
GO
ALTER TABLE [Production].[TransactionHistoryArchive]
	ADD
	CONSTRAINT [DF_TransactionHistoryArchive_TransactionDate]
	DEFAULT (getdate()) FOR [TransactionDate]
GO
CREATE NONCLUSTERED INDEX [IX_TransactionHistoryArchive_ProductID]
	ON [Production].[TransactionHistoryArchive] ([ProductID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TransactionHistoryArchive_ReferenceOrderID_ReferenceOrderLineID]
	ON [Production].[TransactionHistoryArchive] ([ReferenceOrderID], [ReferenceOrderLineID])
	ON [PRIMARY]
GO
ALTER TABLE [Production].[TransactionHistoryArchive] SET (LOCK_ESCALATION = TABLE)
GO
