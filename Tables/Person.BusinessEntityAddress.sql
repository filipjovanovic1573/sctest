SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [Person].[BusinessEntityAddress] (
		[BusinessEntityID]     [int] NOT NULL,
		[AddressID]            [int] NOT NULL,
		[AddressTypeID]        [int] NOT NULL,
		[rowguid]              [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]         [datetime] NOT NULL,
		CONSTRAINT [PK_BusinessEntityAddress_BusinessEntityID_AddressID_AddressTypeID]
		PRIMARY KEY
		CLUSTERED
		([BusinessEntityID], [AddressID], [AddressTypeID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Person].[BusinessEntityAddress]
	ADD
	CONSTRAINT [DF_BusinessEntityAddress_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Person].[BusinessEntityAddress]
	ADD
	CONSTRAINT [DF_BusinessEntityAddress_rowguid]
	DEFAULT (newid()) FOR [rowguid]
GO
ALTER TABLE [Person].[BusinessEntityAddress]
	WITH CHECK
	ADD CONSTRAINT [FK_BusinessEntityAddress_Address_AddressID]
	FOREIGN KEY ([AddressID]) REFERENCES [Person].[Address] ([AddressID])
ALTER TABLE [Person].[BusinessEntityAddress]
	CHECK CONSTRAINT [FK_BusinessEntityAddress_Address_AddressID]

GO
ALTER TABLE [Person].[BusinessEntityAddress]
	WITH CHECK
	ADD CONSTRAINT [FK_BusinessEntityAddress_AddressType_AddressTypeID]
	FOREIGN KEY ([AddressTypeID]) REFERENCES [Person].[AddressType] ([AddressTypeID])
ALTER TABLE [Person].[BusinessEntityAddress]
	CHECK CONSTRAINT [FK_BusinessEntityAddress_AddressType_AddressTypeID]

GO
ALTER TABLE [Person].[BusinessEntityAddress]
	WITH CHECK
	ADD CONSTRAINT [FK_BusinessEntityAddress_BusinessEntity_BusinessEntityID]
	FOREIGN KEY ([BusinessEntityID]) REFERENCES [Person].[BusinessEntity] ([BusinessEntityID])
ALTER TABLE [Person].[BusinessEntityAddress]
	CHECK CONSTRAINT [FK_BusinessEntityAddress_BusinessEntity_BusinessEntityID]

GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_BusinessEntityAddress_rowguid]
	ON [Person].[BusinessEntityAddress] ([rowguid])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_BusinessEntityAddress_AddressID]
	ON [Person].[BusinessEntityAddress] ([AddressID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_BusinessEntityAddress_AddressTypeID]
	ON [Person].[BusinessEntityAddress] ([AddressTypeID])
	ON [PRIMARY]
GO
ALTER TABLE [Person].[BusinessEntityAddress] SET (LOCK_ESCALATION = TABLE)
GO
