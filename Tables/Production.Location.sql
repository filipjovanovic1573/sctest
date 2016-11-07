SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Production].[Location] (
		[LocationID]       [smallint] IDENTITY(1, 1) NOT NULL,
		[Name]             [dbo].[Name] NOT NULL,
		[CostRate]         [smallmoney] NOT NULL,
		[Availability]     [decimal](8, 2) NOT NULL,
		[ModifiedDate]     [datetime] NOT NULL,
		CONSTRAINT [PK_Location_LocationID]
		PRIMARY KEY
		CLUSTERED
		([LocationID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Production].[Location]
	ADD
	CONSTRAINT [CK_Location_Availability]
	CHECK
	([Availability]>=(0.00))
GO
ALTER TABLE [Production].[Location]
CHECK CONSTRAINT [CK_Location_Availability]
GO
ALTER TABLE [Production].[Location]
	ADD
	CONSTRAINT [CK_Location_CostRate]
	CHECK
	([CostRate]>=(0.00))
GO
ALTER TABLE [Production].[Location]
CHECK CONSTRAINT [CK_Location_CostRate]
GO
ALTER TABLE [Production].[Location]
	ADD
	CONSTRAINT [DF_Location_Availability]
	DEFAULT ((0.00)) FOR [Availability]
GO
ALTER TABLE [Production].[Location]
	ADD
	CONSTRAINT [DF_Location_CostRate]
	DEFAULT ((0.00)) FOR [CostRate]
GO
ALTER TABLE [Production].[Location]
	ADD
	CONSTRAINT [DF_Location_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_Location_Name]
	ON [Production].[Location] ([Name])
	ON [PRIMARY]
GO
ALTER TABLE [Production].[Location] SET (LOCK_ESCALATION = TABLE)
GO
