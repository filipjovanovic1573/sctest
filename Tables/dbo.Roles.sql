SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles] (
		[RoleID]          [uniqueidentifier] NOT NULL,
		[RoleName]        [nvarchar](260) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[Description]     [nvarchar](512) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[TaskMask]        [nvarchar](32) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[RoleFlags]       [tinyint] NOT NULL,
		CONSTRAINT [PK_Roles]
		PRIMARY KEY
		NONCLUSTERED
		([RoleID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [IX_Roles]
	ON [dbo].[Roles] ([RoleName])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[Roles] SET (LOCK_ESCALATION = TABLE)
GO
