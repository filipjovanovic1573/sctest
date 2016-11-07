SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AWBuildVersion] (
		[SystemInformationID]     [tinyint] IDENTITY(1, 1) NOT NULL,
		[Database Version]        [nvarchar](25) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[VersionDate]             [datetime] NOT NULL,
		[ModifiedDate]            [datetime] NOT NULL,
		CONSTRAINT [PK_AWBuildVersion_SystemInformationID]
		PRIMARY KEY
		CLUSTERED
		([SystemInformationID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AWBuildVersion]
	ADD
	CONSTRAINT [DF_AWBuildVersion_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[AWBuildVersion] SET (LOCK_ESCALATION = TABLE)
GO
