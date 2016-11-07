SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [HumanResources].[EmployeeDepartmentHistory] (
		[BusinessEntityID]     [int] NOT NULL,
		[DepartmentID]         [smallint] NOT NULL,
		[ShiftID]              [tinyint] NOT NULL,
		[StartDate]            [date] NOT NULL,
		[EndDate]              [date] NULL,
		[ModifiedDate]         [datetime] NOT NULL,
		CONSTRAINT [PK_EmployeeDepartmentHistory_BusinessEntityID_StartDate_DepartmentID]
		PRIMARY KEY
		CLUSTERED
		([BusinessEntityID], [StartDate], [DepartmentID], [ShiftID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [HumanResources].[EmployeeDepartmentHistory]
	ADD
	CONSTRAINT [CK_EmployeeDepartmentHistory_EndDate]
	CHECK
	([EndDate]>=[StartDate] OR [EndDate] IS NULL)
GO
ALTER TABLE [HumanResources].[EmployeeDepartmentHistory]
CHECK CONSTRAINT [CK_EmployeeDepartmentHistory_EndDate]
GO
ALTER TABLE [HumanResources].[EmployeeDepartmentHistory]
	ADD
	CONSTRAINT [DF_EmployeeDepartmentHistory_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [HumanResources].[EmployeeDepartmentHistory]
	WITH CHECK
	ADD CONSTRAINT [FK_EmployeeDepartmentHistory_Department_DepartmentID]
	FOREIGN KEY ([DepartmentID]) REFERENCES [HumanResources].[Department] ([DepartmentID])
ALTER TABLE [HumanResources].[EmployeeDepartmentHistory]
	CHECK CONSTRAINT [FK_EmployeeDepartmentHistory_Department_DepartmentID]

GO
ALTER TABLE [HumanResources].[EmployeeDepartmentHistory]
	WITH CHECK
	ADD CONSTRAINT [FK_EmployeeDepartmentHistory_Employee_BusinessEntityID]
	FOREIGN KEY ([BusinessEntityID]) REFERENCES [HumanResources].[Employee] ([BusinessEntityID])
ALTER TABLE [HumanResources].[EmployeeDepartmentHistory]
	CHECK CONSTRAINT [FK_EmployeeDepartmentHistory_Employee_BusinessEntityID]

GO
ALTER TABLE [HumanResources].[EmployeeDepartmentHistory]
	WITH CHECK
	ADD CONSTRAINT [FK_EmployeeDepartmentHistory_Shift_ShiftID]
	FOREIGN KEY ([ShiftID]) REFERENCES [HumanResources].[Shift] ([ShiftID])
ALTER TABLE [HumanResources].[EmployeeDepartmentHistory]
	CHECK CONSTRAINT [FK_EmployeeDepartmentHistory_Shift_ShiftID]

GO
CREATE NONCLUSTERED INDEX [IX_EmployeeDepartmentHistory_DepartmentID]
	ON [HumanResources].[EmployeeDepartmentHistory] ([DepartmentID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_EmployeeDepartmentHistory_ShiftID]
	ON [HumanResources].[EmployeeDepartmentHistory] ([ShiftID])
	ON [PRIMARY]
GO
ALTER TABLE [HumanResources].[EmployeeDepartmentHistory] SET (LOCK_ESCALATION = TABLE)
GO
