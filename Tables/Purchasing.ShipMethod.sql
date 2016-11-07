SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Purchasing].[ShipMethod] (
		[ShipMethodID]     [int] IDENTITY(1, 1) NOT NULL,
		[Name]             [dbo].[Name] NOT NULL,
		[ShipBase]         [money] NOT NULL,
		[ShipRate]         [money] NOT NULL,
		[rowguid]          [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]     [datetime] NOT NULL,
		CONSTRAINT [PK_ShipMethod_ShipMethodID]
		PRIMARY KEY
		CLUSTERED
		([ShipMethodID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Purchasing].[ShipMethod]
	ADD
	CONSTRAINT [CK_ShipMethod_ShipBase]
	CHECK
	([ShipBase]>(0.00))
GO
ALTER TABLE [Purchasing].[ShipMethod]
CHECK CONSTRAINT [CK_ShipMethod_ShipBase]
GO
ALTER TABLE [Purchasing].[ShipMethod]
	ADD
	CONSTRAINT [CK_ShipMethod_ShipRate]
	CHECK
	([ShipRate]>(0.00))
GO
ALTER TABLE [Purchasing].[ShipMethod]
CHECK CONSTRAINT [CK_ShipMethod_ShipRate]
GO
ALTER TABLE [Purchasing].[ShipMethod]
	ADD
	CONSTRAINT [DF_ShipMethod_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Purchasing].[ShipMethod]
	ADD
	CONSTRAINT [DF_ShipMethod_rowguid]
	DEFAULT (newid()) FOR [rowguid]
GO
ALTER TABLE [Purchasing].[ShipMethod]
	ADD
	CONSTRAINT [DF_ShipMethod_ShipBase]
	DEFAULT ((0.00)) FOR [ShipBase]
GO
ALTER TABLE [Purchasing].[ShipMethod]
	ADD
	CONSTRAINT [DF_ShipMethod_ShipRate]
	DEFAULT ((0.00)) FOR [ShipRate]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_ShipMethod_Name]
	ON [Purchasing].[ShipMethod] ([Name])
	ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_ShipMethod_rowguid]
	ON [Purchasing].[ShipMethod] ([rowguid])
	ON [PRIMARY]
GO
ALTER TABLE [Purchasing].[ShipMethod] SET (LOCK_ESCALATION = TABLE)
GO
