SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[SecData] (
		[SecDataID]              [uniqueidentifier] NOT NULL,
		[PolicyID]               [uniqueidentifier] NOT NULL,
		[AuthType]               [int] NOT NULL,
		[XmlDescription]         [ntext] COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[NtSecDescPrimary]       [image] NOT NULL,
		[NtSecDescSecondary]     [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
		CONSTRAINT [PK_SecData]
		PRIMARY KEY
		NONCLUSTERED
		([SecDataID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[SecData]
	WITH NOCHECK
	ADD CONSTRAINT [FK_SecDataPolicyID]
	FOREIGN KEY ([PolicyID]) REFERENCES [dbo].[Policies] ([PolicyID])
	ON DELETE CASCADE
ALTER TABLE [dbo].[SecData]
	CHECK CONSTRAINT [FK_SecDataPolicyID]

GO
CREATE UNIQUE CLUSTERED INDEX [IX_SecData]
	ON [dbo].[SecData] ([PolicyID], [AuthType])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[SecData] SET (LOCK_ESCALATION = TABLE)
GO
