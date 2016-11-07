SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Sales].[SalesOrderHeader] (
		[SalesOrderID]               [int] IDENTITY(1, 1) NOT FOR REPLICATION NOT NULL,
		[RevisionNumber]             [tinyint] NOT NULL,
		[OrderDate]                  [datetime] NOT NULL,
		[DueDate]                    [datetime] NOT NULL,
		[ShipDate]                   [datetime] NULL,
		[Status]                     [tinyint] NOT NULL,
		[OnlineOrderFlag]            [dbo].[Flag] NOT NULL,
		[SalesOrderNumber]           AS (isnull(N'SO'+CONVERT([nvarchar](23),[SalesOrderID]),N'*** ERROR ***')),
		[PurchaseOrderNumber]        [dbo].[OrderNumber] NULL,
		[AccountNumber]              [dbo].[AccountNumber] NULL,
		[CustomerID]                 [int] NOT NULL,
		[SalesPersonID]              [int] NULL,
		[TerritoryID]                [int] NULL,
		[BillToAddressID]            [int] NOT NULL,
		[ShipToAddressID]            [int] NOT NULL,
		[ShipMethodID]               [int] NOT NULL,
		[CreditCardID]               [int] NULL,
		[CreditCardApprovalCode]     [varchar](15) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[CurrencyRateID]             [int] NULL,
		[SubTotal]                   [money] NOT NULL,
		[TaxAmt]                     [money] NOT NULL,
		[Freight]                    [money] NOT NULL,
		[TotalDue]                   AS (isnull(([SubTotal]+[TaxAmt])+[Freight],(0))),
		[Comment]                    [nvarchar](128) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[rowguid]                    [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]               [datetime] NOT NULL,
		CONSTRAINT [PK_SalesOrderHeader_SalesOrderID]
		PRIMARY KEY
		CLUSTERED
		([SalesOrderID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Sales].[SalesOrderHeader]
	ADD
	CONSTRAINT [CK_SalesOrderHeader_DueDate]
	CHECK
	([DueDate]>=[OrderDate])
GO
ALTER TABLE [Sales].[SalesOrderHeader]
CHECK CONSTRAINT [CK_SalesOrderHeader_DueDate]
GO
ALTER TABLE [Sales].[SalesOrderHeader]
	ADD
	CONSTRAINT [CK_SalesOrderHeader_Freight]
	CHECK
	([Freight]>=(0.00))
GO
ALTER TABLE [Sales].[SalesOrderHeader]
CHECK CONSTRAINT [CK_SalesOrderHeader_Freight]
GO
ALTER TABLE [Sales].[SalesOrderHeader]
	ADD
	CONSTRAINT [CK_SalesOrderHeader_ShipDate]
	CHECK
	([ShipDate]>=[OrderDate] OR [ShipDate] IS NULL)
GO
ALTER TABLE [Sales].[SalesOrderHeader]
CHECK CONSTRAINT [CK_SalesOrderHeader_ShipDate]
GO
ALTER TABLE [Sales].[SalesOrderHeader]
	ADD
	CONSTRAINT [CK_SalesOrderHeader_Status]
	CHECK
	([Status]>=(0) AND [Status]<=(8))
GO
ALTER TABLE [Sales].[SalesOrderHeader]
CHECK CONSTRAINT [CK_SalesOrderHeader_Status]
GO
ALTER TABLE [Sales].[SalesOrderHeader]
	ADD
	CONSTRAINT [CK_SalesOrderHeader_SubTotal]
	CHECK
	([SubTotal]>=(0.00))
GO
ALTER TABLE [Sales].[SalesOrderHeader]
CHECK CONSTRAINT [CK_SalesOrderHeader_SubTotal]
GO
ALTER TABLE [Sales].[SalesOrderHeader]
	ADD
	CONSTRAINT [CK_SalesOrderHeader_TaxAmt]
	CHECK
	([TaxAmt]>=(0.00))
GO
ALTER TABLE [Sales].[SalesOrderHeader]
CHECK CONSTRAINT [CK_SalesOrderHeader_TaxAmt]
GO
ALTER TABLE [Sales].[SalesOrderHeader]
	ADD
	CONSTRAINT [DF_SalesOrderHeader_Freight]
	DEFAULT ((0.00)) FOR [Freight]
GO
ALTER TABLE [Sales].[SalesOrderHeader]
	ADD
	CONSTRAINT [DF_SalesOrderHeader_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Sales].[SalesOrderHeader]
	ADD
	CONSTRAINT [DF_SalesOrderHeader_OnlineOrderFlag]
	DEFAULT ((1)) FOR [OnlineOrderFlag]
GO
ALTER TABLE [Sales].[SalesOrderHeader]
	ADD
	CONSTRAINT [DF_SalesOrderHeader_OrderDate]
	DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [Sales].[SalesOrderHeader]
	ADD
	CONSTRAINT [DF_SalesOrderHeader_RevisionNumber]
	DEFAULT ((0)) FOR [RevisionNumber]
GO
ALTER TABLE [Sales].[SalesOrderHeader]
	ADD
	CONSTRAINT [DF_SalesOrderHeader_rowguid]
	DEFAULT (newid()) FOR [rowguid]
GO
ALTER TABLE [Sales].[SalesOrderHeader]
	ADD
	CONSTRAINT [DF_SalesOrderHeader_Status]
	DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [Sales].[SalesOrderHeader]
	ADD
	CONSTRAINT [DF_SalesOrderHeader_SubTotal]
	DEFAULT ((0.00)) FOR [SubTotal]
GO
ALTER TABLE [Sales].[SalesOrderHeader]
	ADD
	CONSTRAINT [DF_SalesOrderHeader_TaxAmt]
	DEFAULT ((0.00)) FOR [TaxAmt]
GO
ALTER TABLE [Sales].[SalesOrderHeader]
	WITH CHECK
	ADD CONSTRAINT [FK_SalesOrderHeader_Address_BillToAddressID]
	FOREIGN KEY ([BillToAddressID]) REFERENCES [Person].[Address] ([AddressID])
ALTER TABLE [Sales].[SalesOrderHeader]
	CHECK CONSTRAINT [FK_SalesOrderHeader_Address_BillToAddressID]

GO
ALTER TABLE [Sales].[SalesOrderHeader]
	WITH CHECK
	ADD CONSTRAINT [FK_SalesOrderHeader_Address_ShipToAddressID]
	FOREIGN KEY ([ShipToAddressID]) REFERENCES [Person].[Address] ([AddressID])
ALTER TABLE [Sales].[SalesOrderHeader]
	CHECK CONSTRAINT [FK_SalesOrderHeader_Address_ShipToAddressID]

GO
ALTER TABLE [Sales].[SalesOrderHeader]
	WITH CHECK
	ADD CONSTRAINT [FK_SalesOrderHeader_CreditCard_CreditCardID]
	FOREIGN KEY ([CreditCardID]) REFERENCES [Sales].[CreditCard] ([CreditCardID])
ALTER TABLE [Sales].[SalesOrderHeader]
	CHECK CONSTRAINT [FK_SalesOrderHeader_CreditCard_CreditCardID]

GO
ALTER TABLE [Sales].[SalesOrderHeader]
	WITH CHECK
	ADD CONSTRAINT [FK_SalesOrderHeader_CurrencyRate_CurrencyRateID]
	FOREIGN KEY ([CurrencyRateID]) REFERENCES [Sales].[CurrencyRate] ([CurrencyRateID])
ALTER TABLE [Sales].[SalesOrderHeader]
	CHECK CONSTRAINT [FK_SalesOrderHeader_CurrencyRate_CurrencyRateID]

GO
ALTER TABLE [Sales].[SalesOrderHeader]
	WITH CHECK
	ADD CONSTRAINT [FK_SalesOrderHeader_Customer_CustomerID]
	FOREIGN KEY ([CustomerID]) REFERENCES [Sales].[Customer] ([CustomerID])
ALTER TABLE [Sales].[SalesOrderHeader]
	CHECK CONSTRAINT [FK_SalesOrderHeader_Customer_CustomerID]

GO
ALTER TABLE [Sales].[SalesOrderHeader]
	WITH CHECK
	ADD CONSTRAINT [FK_SalesOrderHeader_SalesPerson_SalesPersonID]
	FOREIGN KEY ([SalesPersonID]) REFERENCES [Sales].[SalesPerson] ([BusinessEntityID])
ALTER TABLE [Sales].[SalesOrderHeader]
	CHECK CONSTRAINT [FK_SalesOrderHeader_SalesPerson_SalesPersonID]

GO
ALTER TABLE [Sales].[SalesOrderHeader]
	WITH CHECK
	ADD CONSTRAINT [FK_SalesOrderHeader_SalesTerritory_TerritoryID]
	FOREIGN KEY ([TerritoryID]) REFERENCES [Sales].[SalesTerritory] ([TerritoryID])
ALTER TABLE [Sales].[SalesOrderHeader]
	CHECK CONSTRAINT [FK_SalesOrderHeader_SalesTerritory_TerritoryID]

GO
ALTER TABLE [Sales].[SalesOrderHeader]
	WITH CHECK
	ADD CONSTRAINT [FK_SalesOrderHeader_ShipMethod_ShipMethodID]
	FOREIGN KEY ([ShipMethodID]) REFERENCES [Purchasing].[ShipMethod] ([ShipMethodID])
ALTER TABLE [Sales].[SalesOrderHeader]
	CHECK CONSTRAINT [FK_SalesOrderHeader_ShipMethod_ShipMethodID]

GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesOrderHeader_rowguid]
	ON [Sales].[SalesOrderHeader] ([rowguid])
	ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesOrderHeader_SalesOrderNumber]
	ON [Sales].[SalesOrderHeader] ([SalesOrderNumber])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_SalesOrderHeader_CustomerID]
	ON [Sales].[SalesOrderHeader] ([CustomerID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_SalesOrderHeader_SalesPersonID]
	ON [Sales].[SalesOrderHeader] ([SalesPersonID])
	ON [PRIMARY]
GO
ALTER TABLE [Sales].[SalesOrderHeader] SET (LOCK_ESCALATION = TABLE)
GO
