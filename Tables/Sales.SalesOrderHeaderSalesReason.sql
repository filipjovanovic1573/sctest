SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [Sales].[SalesOrderHeaderSalesReason] (
		[SalesOrderID]      [int] NOT NULL,
		[SalesReasonID]     [int] NOT NULL,
		[ModifiedDate]      [datetime] NOT NULL,
		CONSTRAINT [PK_SalesOrderHeaderSalesReason_SalesOrderID_SalesReasonID]
		PRIMARY KEY
		CLUSTERED
		([SalesOrderID], [SalesReasonID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Sales].[SalesOrderHeaderSalesReason]
	ADD
	CONSTRAINT [DF_SalesOrderHeaderSalesReason_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Sales].[SalesOrderHeaderSalesReason]
	WITH CHECK
	ADD CONSTRAINT [FK_SalesOrderHeaderSalesReason_SalesOrderHeader_SalesOrderID]
	FOREIGN KEY ([SalesOrderID]) REFERENCES [Sales].[SalesOrderHeader] ([SalesOrderID])
	ON DELETE CASCADE
ALTER TABLE [Sales].[SalesOrderHeaderSalesReason]
	CHECK CONSTRAINT [FK_SalesOrderHeaderSalesReason_SalesOrderHeader_SalesOrderID]

GO
ALTER TABLE [Sales].[SalesOrderHeaderSalesReason]
	WITH CHECK
	ADD CONSTRAINT [FK_SalesOrderHeaderSalesReason_SalesReason_SalesReasonID]
	FOREIGN KEY ([SalesReasonID]) REFERENCES [Sales].[SalesReason] ([SalesReasonID])
ALTER TABLE [Sales].[SalesOrderHeaderSalesReason]
	CHECK CONSTRAINT [FK_SalesOrderHeaderSalesReason_SalesReason_SalesReasonID]

GO
ALTER TABLE [Sales].[SalesOrderHeaderSalesReason] SET (LOCK_ESCALATION = TABLE)
GO
