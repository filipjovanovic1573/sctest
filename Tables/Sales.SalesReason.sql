SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Sales].[SalesReason] (
		[SalesReasonID]     [int] IDENTITY(1, 1) NOT NULL,
		[Name]              [dbo].[Name] NOT NULL,
		[ReasonType]        [dbo].[Name] NOT NULL,
		[ModifiedDate]      [datetime] NOT NULL,
		CONSTRAINT [PK_SalesReason_SalesReasonID]
		PRIMARY KEY
		CLUSTERED
		([SalesReasonID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Sales].[SalesReason]
	ADD
	CONSTRAINT [DF_SalesReason_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Sales].[SalesReason] SET (LOCK_ESCALATION = TABLE)
GO
