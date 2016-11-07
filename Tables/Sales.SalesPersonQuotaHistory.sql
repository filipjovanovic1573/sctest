SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [Sales].[SalesPersonQuotaHistory] (
		[BusinessEntityID]     [int] NOT NULL,
		[QuotaDate]            [datetime] NOT NULL,
		[SalesQuota]           [money] NOT NULL,
		[rowguid]              [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]         [datetime] NOT NULL,
		CONSTRAINT [PK_SalesPersonQuotaHistory_BusinessEntityID_QuotaDate]
		PRIMARY KEY
		CLUSTERED
		([BusinessEntityID], [QuotaDate])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Sales].[SalesPersonQuotaHistory]
	ADD
	CONSTRAINT [CK_SalesPersonQuotaHistory_SalesQuota]
	CHECK
	([SalesQuota]>(0.00))
GO
ALTER TABLE [Sales].[SalesPersonQuotaHistory]
CHECK CONSTRAINT [CK_SalesPersonQuotaHistory_SalesQuota]
GO
ALTER TABLE [Sales].[SalesPersonQuotaHistory]
	ADD
	CONSTRAINT [DF_SalesPersonQuotaHistory_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Sales].[SalesPersonQuotaHistory]
	ADD
	CONSTRAINT [DF_SalesPersonQuotaHistory_rowguid]
	DEFAULT (newid()) FOR [rowguid]
GO
ALTER TABLE [Sales].[SalesPersonQuotaHistory]
	WITH CHECK
	ADD CONSTRAINT [FK_SalesPersonQuotaHistory_SalesPerson_BusinessEntityID]
	FOREIGN KEY ([BusinessEntityID]) REFERENCES [Sales].[SalesPerson] ([BusinessEntityID])
ALTER TABLE [Sales].[SalesPersonQuotaHistory]
	CHECK CONSTRAINT [FK_SalesPersonQuotaHistory_SalesPerson_BusinessEntityID]

GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesPersonQuotaHistory_rowguid]
	ON [Sales].[SalesPersonQuotaHistory] ([rowguid])
	ON [PRIMARY]
GO
ALTER TABLE [Sales].[SalesPersonQuotaHistory] SET (LOCK_ESCALATION = TABLE)
GO
