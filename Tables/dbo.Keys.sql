SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Keys] (
		[MachineName]        [nvarchar](256) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[InstallationID]     [uniqueidentifier] NOT NULL,
		[InstanceName]       [nvarchar](32) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[Client]             [int] NOT NULL,
		[PublicKey]          [image] NULL,
		[SymmetricKey]       [image] NULL,
		CONSTRAINT [PK_Keys]
		PRIMARY KEY
		CLUSTERED
		([InstallationID], [Client])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Keys] SET (LOCK_ESCALATION = TABLE)
GO
