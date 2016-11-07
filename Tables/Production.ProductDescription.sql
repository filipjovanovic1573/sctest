SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Production].[ProductDescription] (
		[ProductDescriptionID]     [int] IDENTITY(1, 1) NOT NULL,
		[Description]              [nvarchar](400) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[rowguid]                  [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]             [datetime] NOT NULL,
		CONSTRAINT [PK_ProductDescription_ProductDescriptionID]
		PRIMARY KEY
		CLUSTERED
		([ProductDescriptionID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Production].[ProductDescription]
	ADD
	CONSTRAINT [DF_ProductDescription_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Production].[ProductDescription]
	ADD
	CONSTRAINT [DF_ProductDescription_rowguid]
	DEFAULT (newid()) FOR [rowguid]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_ProductDescription_rowguid]
	ON [Production].[ProductDescription] ([rowguid])
	ON [PRIMARY]
GO
ALTER TABLE [Production].[ProductDescription] SET (LOCK_ESCALATION = TABLE)
GO
