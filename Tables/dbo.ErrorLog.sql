SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ErrorLog] (
		[ErrorLogID]         [int] IDENTITY(1, 1) NOT NULL,
		[ErrorTime]          [datetime] NOT NULL,
		[UserName]           [sysname] COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[ErrorNumber]        [int] NOT NULL,
		[ErrorSeverity]      [int] NULL,
		[ErrorState]         [int] NULL,
		[ErrorProcedure]     [nvarchar](126) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[ErrorLine]          [int] NULL,
		[ErrorMessage]       [nvarchar](4000) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		CONSTRAINT [PK_ErrorLog_ErrorLogID]
		PRIMARY KEY
		CLUSTERED
		([ErrorLogID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ErrorLog]
	ADD
	CONSTRAINT [DF_ErrorLog_ErrorTime]
	DEFAULT (getdate()) FOR [ErrorTime]
GO
ALTER TABLE [dbo].[ErrorLog] SET (LOCK_ESCALATION = TABLE)
GO
