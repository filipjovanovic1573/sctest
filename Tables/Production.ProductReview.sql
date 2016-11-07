SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Production].[ProductReview] (
		[ProductReviewID]     [int] IDENTITY(1, 1) NOT NULL,
		[ProductID]           [int] NOT NULL,
		[ReviewerName]        [dbo].[Name] NOT NULL,
		[ReviewDate]          [datetime] NOT NULL,
		[EmailAddress]        [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[Rating]              [int] NOT NULL,
		[Comments]            [nvarchar](3850) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[ModifiedDate]        [datetime] NOT NULL,
		CONSTRAINT [PK_ProductReview_ProductReviewID]
		PRIMARY KEY
		CLUSTERED
		([ProductReviewID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Production].[ProductReview]
	ADD
	CONSTRAINT [CK_ProductReview_Rating]
	CHECK
	([Rating]>=(1) AND [Rating]<=(5))
GO
ALTER TABLE [Production].[ProductReview]
CHECK CONSTRAINT [CK_ProductReview_Rating]
GO
ALTER TABLE [Production].[ProductReview]
	ADD
	CONSTRAINT [DF_ProductReview_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Production].[ProductReview]
	ADD
	CONSTRAINT [DF_ProductReview_ReviewDate]
	DEFAULT (getdate()) FOR [ReviewDate]
GO
ALTER TABLE [Production].[ProductReview]
	WITH CHECK
	ADD CONSTRAINT [FK_ProductReview_Product_ProductID]
	FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID])
ALTER TABLE [Production].[ProductReview]
	CHECK CONSTRAINT [FK_ProductReview_Product_ProductID]

GO
CREATE NONCLUSTERED INDEX [IX_ProductReview_ProductID_Name]
	ON [Production].[ProductReview] ([ProductID], [ReviewerName])
	INCLUDE ([Comments])
	ON [PRIMARY]
GO
CREATE FULLTEXT INDEX ON [Production].[ProductReview]
	([Comments] LANGUAGE 1033)
	KEY INDEX [PK_ProductReview_ProductReviewID]
	ON (FILEGROUP [PRIMARY], [AW2014FullTextCatalog])
	WITH CHANGE_TRACKING AUTO, STOPLIST SYSTEM
GO
ALTER TABLE [Production].[ProductReview] SET (LOCK_ESCALATION = TABLE)
GO
