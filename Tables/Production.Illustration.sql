SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [Production].[Illustration] (
		[IllustrationID]     [int] IDENTITY(1, 1) NOT NULL,
		[Diagram]            [xml] NULL,
		[ModifiedDate]       [datetime] NOT NULL,
		CONSTRAINT [PK_Illustration_IllustrationID]
		PRIMARY KEY
		CLUSTERED
		([IllustrationID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [Production].[Illustration]
	ADD
	CONSTRAINT [DF_Illustration_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Production].[Illustration] SET (LOCK_ESCALATION = TABLE)
GO
