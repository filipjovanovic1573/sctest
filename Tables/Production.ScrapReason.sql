SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Production].[ScrapReason] (
		[ScrapReasonID]     [smallint] IDENTITY(1, 1) NOT NULL,
		[Name]              [dbo].[Name] NOT NULL,
		[ModifiedDate]      [datetime] NOT NULL,
		CONSTRAINT [PK_ScrapReason_ScrapReasonID]
		PRIMARY KEY
		CLUSTERED
		([ScrapReasonID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Production].[ScrapReason]
	ADD
	CONSTRAINT [DF_ScrapReason_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_ScrapReason_Name]
	ON [Production].[ScrapReason] ([Name])
	ON [PRIMARY]
GO
ALTER TABLE [Production].[ScrapReason] SET (LOCK_ESCALATION = TABLE)
GO
