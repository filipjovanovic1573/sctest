SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RunningJobs] (
		[JobID]            [nvarchar](32) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[StartDate]        [datetime] NOT NULL,
		[ComputerName]     [nvarchar](32) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[RequestName]      [nvarchar](425) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[RequestPath]      [nvarchar](425) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[UserId]           [uniqueidentifier] NOT NULL,
		[Description]      [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[Timeout]          [int] NOT NULL,
		[JobAction]        [smallint] NOT NULL,
		[JobType]          [smallint] NOT NULL,
		[JobStatus]        [smallint] NOT NULL,
		CONSTRAINT [PK_RunningJobs]
		PRIMARY KEY
		CLUSTERED
		([JobID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_RunningJobsStatus]
	ON [dbo].[RunningJobs] ([ComputerName], [JobType])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[RunningJobs] SET (LOCK_ESCALATION = TABLE)
GO
