SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [HumanResources].[Shift] (
		[ShiftID]          [tinyint] IDENTITY(1, 1) NOT NULL,
		[Name]             [dbo].[Name] NOT NULL,
		[StartTime]        [time](7) NOT NULL,
		[EndTime]          [time](7) NOT NULL,
		[ModifiedDate]     [datetime] NOT NULL,
		CONSTRAINT [PK_Shift_ShiftID]
		PRIMARY KEY
		CLUSTERED
		([ShiftID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [HumanResources].[Shift]
	ADD
	CONSTRAINT [DF_Shift_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_Shift_Name]
	ON [HumanResources].[Shift] ([Name])
	ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_Shift_StartTime_EndTime]
	ON [HumanResources].[Shift] ([StartTime], [EndTime])
	ON [PRIMARY]
GO
ALTER TABLE [HumanResources].[Shift] SET (LOCK_ESCALATION = TABLE)
GO
