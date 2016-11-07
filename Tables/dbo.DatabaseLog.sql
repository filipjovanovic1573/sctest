SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DatabaseLog] (
		[DatabaseLogID]     [int] IDENTITY(1, 1) NOT NULL,
		[PostTime]          [datetime] NOT NULL,
		[DatabaseUser]      [sysname] COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[Event]             [sysname] COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[Schema]            [sysname] COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[Object]            [sysname] COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[TSQL]              [nvarchar](max) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[XmlEvent]          [xml] NOT NULL,
		CONSTRAINT [PK_DatabaseLog_DatabaseLogID]
		PRIMARY KEY
		NONCLUSTERED
		([DatabaseLogID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[DatabaseLog] SET (LOCK_ESCALATION = TABLE)
GO
