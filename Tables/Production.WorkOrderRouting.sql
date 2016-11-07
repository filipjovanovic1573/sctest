SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [Production].[WorkOrderRouting] (
		[WorkOrderID]            [int] NOT NULL,
		[ProductID]              [int] NOT NULL,
		[OperationSequence]      [smallint] NOT NULL,
		[LocationID]             [smallint] NOT NULL,
		[ScheduledStartDate]     [datetime] NOT NULL,
		[ScheduledEndDate]       [datetime] NOT NULL,
		[ActualStartDate]        [datetime] NULL,
		[ActualEndDate]          [datetime] NULL,
		[ActualResourceHrs]      [decimal](9, 4) NULL,
		[PlannedCost]            [money] NOT NULL,
		[ActualCost]             [money] NULL,
		[ModifiedDate]           [datetime] NOT NULL,
		CONSTRAINT [PK_WorkOrderRouting_WorkOrderID_ProductID_OperationSequence]
		PRIMARY KEY
		CLUSTERED
		([WorkOrderID], [ProductID], [OperationSequence])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Production].[WorkOrderRouting]
	ADD
	CONSTRAINT [CK_WorkOrderRouting_ActualCost]
	CHECK
	([ActualCost]>(0.00))
GO
ALTER TABLE [Production].[WorkOrderRouting]
CHECK CONSTRAINT [CK_WorkOrderRouting_ActualCost]
GO
ALTER TABLE [Production].[WorkOrderRouting]
	ADD
	CONSTRAINT [CK_WorkOrderRouting_ActualEndDate]
	CHECK
	([ActualEndDate]>=[ActualStartDate] OR [ActualEndDate] IS NULL OR [ActualStartDate] IS NULL)
GO
ALTER TABLE [Production].[WorkOrderRouting]
CHECK CONSTRAINT [CK_WorkOrderRouting_ActualEndDate]
GO
ALTER TABLE [Production].[WorkOrderRouting]
	ADD
	CONSTRAINT [CK_WorkOrderRouting_ActualResourceHrs]
	CHECK
	([ActualResourceHrs]>=(0.0000))
GO
ALTER TABLE [Production].[WorkOrderRouting]
CHECK CONSTRAINT [CK_WorkOrderRouting_ActualResourceHrs]
GO
ALTER TABLE [Production].[WorkOrderRouting]
	ADD
	CONSTRAINT [CK_WorkOrderRouting_PlannedCost]
	CHECK
	([PlannedCost]>(0.00))
GO
ALTER TABLE [Production].[WorkOrderRouting]
CHECK CONSTRAINT [CK_WorkOrderRouting_PlannedCost]
GO
ALTER TABLE [Production].[WorkOrderRouting]
	ADD
	CONSTRAINT [CK_WorkOrderRouting_ScheduledEndDate]
	CHECK
	([ScheduledEndDate]>=[ScheduledStartDate])
GO
ALTER TABLE [Production].[WorkOrderRouting]
CHECK CONSTRAINT [CK_WorkOrderRouting_ScheduledEndDate]
GO
ALTER TABLE [Production].[WorkOrderRouting]
	ADD
	CONSTRAINT [DF_WorkOrderRouting_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Production].[WorkOrderRouting]
	WITH CHECK
	ADD CONSTRAINT [FK_WorkOrderRouting_Location_LocationID]
	FOREIGN KEY ([LocationID]) REFERENCES [Production].[Location] ([LocationID])
ALTER TABLE [Production].[WorkOrderRouting]
	CHECK CONSTRAINT [FK_WorkOrderRouting_Location_LocationID]

GO
ALTER TABLE [Production].[WorkOrderRouting]
	WITH CHECK
	ADD CONSTRAINT [FK_WorkOrderRouting_WorkOrder_WorkOrderID]
	FOREIGN KEY ([WorkOrderID]) REFERENCES [Production].[WorkOrder] ([WorkOrderID])
ALTER TABLE [Production].[WorkOrderRouting]
	CHECK CONSTRAINT [FK_WorkOrderRouting_WorkOrder_WorkOrderID]

GO
CREATE NONCLUSTERED INDEX [IX_WorkOrderRouting_ProductID]
	ON [Production].[WorkOrderRouting] ([ProductID])
	ON [PRIMARY]
GO
ALTER TABLE [Production].[WorkOrderRouting] SET (LOCK_ESCALATION = TABLE)
GO
