SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Person].[AddressType] (
		[AddressTypeID]     [int] IDENTITY(1, 1) NOT NULL,
		[Name]              [dbo].[Name] NOT NULL,
		[rowguid]           [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]      [datetime] NOT NULL,
		CONSTRAINT [PK_AddressType_AddressTypeID]
		PRIMARY KEY
		CLUSTERED
		([AddressTypeID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Person].[AddressType]
	ADD
	CONSTRAINT [DF_AddressType_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Person].[AddressType]
	ADD
	CONSTRAINT [DF_AddressType_rowguid]
	DEFAULT (newid()) FOR [rowguid]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_AddressType_Name]
	ON [Person].[AddressType] ([Name])
	ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_AddressType_rowguid]
	ON [Person].[AddressType] ([rowguid])
	ON [PRIMARY]
GO
ALTER TABLE [Person].[AddressType] SET (LOCK_ESCALATION = TABLE)
GO
