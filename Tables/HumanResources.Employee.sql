SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [HumanResources].[Employee] (
		[BusinessEntityID]      [int] NOT NULL,
		[NationalIDNumber]      [nvarchar](15) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[LoginID]               [nvarchar](256) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[OrganizationNode]      [hierarchyid] NULL,
		[OrganizationLevel]     AS ([OrganizationNode].[GetLevel]()),
		[JobTitle]              [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[BirthDate]             [date] NOT NULL,
		[MaritalStatus]         [nchar](1) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[Gender]                [nchar](1) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[HireDate]              [date] NOT NULL,
		[SalariedFlag]          [dbo].[Flag] NOT NULL,
		[VacationHours]         [smallint] NOT NULL,
		[SickLeaveHours]        [smallint] NOT NULL,
		[CurrentFlag]           [dbo].[Flag] NOT NULL,
		[rowguid]               [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]          [datetime] NOT NULL,
		CONSTRAINT [PK_Employee_BusinessEntityID]
		PRIMARY KEY
		CLUSTERED
		([BusinessEntityID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [HumanResources].[Employee]
	ADD
	CONSTRAINT [CK_Employee_BirthDate]
	CHECK
	([BirthDate]>='1930-01-01' AND [BirthDate]<=dateadd(year,(-18),getdate()))
GO
ALTER TABLE [HumanResources].[Employee]
CHECK CONSTRAINT [CK_Employee_BirthDate]
GO
ALTER TABLE [HumanResources].[Employee]
	ADD
	CONSTRAINT [CK_Employee_Gender]
	CHECK
	(upper([Gender])='F' OR upper([Gender])='M')
GO
ALTER TABLE [HumanResources].[Employee]
CHECK CONSTRAINT [CK_Employee_Gender]
GO
ALTER TABLE [HumanResources].[Employee]
	ADD
	CONSTRAINT [CK_Employee_HireDate]
	CHECK
	([HireDate]>='1996-07-01' AND [HireDate]<=dateadd(day,(1),getdate()))
GO
ALTER TABLE [HumanResources].[Employee]
CHECK CONSTRAINT [CK_Employee_HireDate]
GO
ALTER TABLE [HumanResources].[Employee]
	ADD
	CONSTRAINT [CK_Employee_MaritalStatus]
	CHECK
	(upper([MaritalStatus])='S' OR upper([MaritalStatus])='M')
GO
ALTER TABLE [HumanResources].[Employee]
CHECK CONSTRAINT [CK_Employee_MaritalStatus]
GO
ALTER TABLE [HumanResources].[Employee]
	ADD
	CONSTRAINT [CK_Employee_SickLeaveHours]
	CHECK
	([SickLeaveHours]>=(0) AND [SickLeaveHours]<=(120))
GO
ALTER TABLE [HumanResources].[Employee]
CHECK CONSTRAINT [CK_Employee_SickLeaveHours]
GO
ALTER TABLE [HumanResources].[Employee]
	ADD
	CONSTRAINT [CK_Employee_VacationHours]
	CHECK
	([VacationHours]>=(-40) AND [VacationHours]<=(240))
GO
ALTER TABLE [HumanResources].[Employee]
CHECK CONSTRAINT [CK_Employee_VacationHours]
GO
ALTER TABLE [HumanResources].[Employee]
	ADD
	CONSTRAINT [DF_Employee_CurrentFlag]
	DEFAULT ((1)) FOR [CurrentFlag]
GO
ALTER TABLE [HumanResources].[Employee]
	ADD
	CONSTRAINT [DF_Employee_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [HumanResources].[Employee]
	ADD
	CONSTRAINT [DF_Employee_rowguid]
	DEFAULT (newid()) FOR [rowguid]
GO
ALTER TABLE [HumanResources].[Employee]
	ADD
	CONSTRAINT [DF_Employee_SalariedFlag]
	DEFAULT ((1)) FOR [SalariedFlag]
GO
ALTER TABLE [HumanResources].[Employee]
	ADD
	CONSTRAINT [DF_Employee_SickLeaveHours]
	DEFAULT ((0)) FOR [SickLeaveHours]
GO
ALTER TABLE [HumanResources].[Employee]
	ADD
	CONSTRAINT [DF_Employee_VacationHours]
	DEFAULT ((0)) FOR [VacationHours]
GO
ALTER TABLE [HumanResources].[Employee]
	WITH CHECK
	ADD CONSTRAINT [FK_Employee_Person_BusinessEntityID]
	FOREIGN KEY ([BusinessEntityID]) REFERENCES [Person].[Person] ([BusinessEntityID])
ALTER TABLE [HumanResources].[Employee]
	CHECK CONSTRAINT [FK_Employee_Person_BusinessEntityID]

GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_Employee_LoginID]
	ON [HumanResources].[Employee] ([LoginID])
	ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_Employee_NationalIDNumber]
	ON [HumanResources].[Employee] ([NationalIDNumber])
	ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_Employee_rowguid]
	ON [HumanResources].[Employee] ([rowguid])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Employee_OrganizationLevel_OrganizationNode]
	ON [HumanResources].[Employee] ([OrganizationLevel], [OrganizationNode])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Employee_OrganizationNode]
	ON [HumanResources].[Employee] ([OrganizationNode])
	ON [PRIMARY]
GO
ALTER TABLE [HumanResources].[Employee] SET (LOCK_ESCALATION = TABLE)
GO
