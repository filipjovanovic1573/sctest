SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Person].[Address] (
		[AddressID]           [int] IDENTITY(1, 1) NOT FOR REPLICATION NOT NULL,
		[AddressLine1]        [nvarchar](60) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[AddressLine2]        [nvarchar](60) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[City]                [nvarchar](30) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[StateProvinceID]     [int] NOT NULL,
		[PostalCode]          [nvarchar](15) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[SpatialLocation]     [geography] NULL,
		[rowguid]             [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]        [datetime] NOT NULL,
		CONSTRAINT [PK_Address_AddressID]
		PRIMARY KEY
		CLUSTERED
		([AddressID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [Person].[Address]
	ADD
	CONSTRAINT [DF_Address_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Person].[Address]
	ADD
	CONSTRAINT [DF_Address_rowguid]
	DEFAULT (newid()) FOR [rowguid]
GO
ALTER TABLE [Person].[Address]
	WITH CHECK
	ADD CONSTRAINT [FK_Address_StateProvince_StateProvinceID]
	FOREIGN KEY ([StateProvinceID]) REFERENCES [Person].[StateProvince] ([StateProvinceID])
ALTER TABLE [Person].[Address]
	CHECK CONSTRAINT [FK_Address_StateProvince_StateProvinceID]

GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_Address_rowguid]
	ON [Person].[Address] ([rowguid])
	ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCode]
	ON [Person].[Address] ([AddressLine1], [AddressLine2], [City], [StateProvinceID], [PostalCode])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Address_StateProvinceID]
	ON [Person].[Address] ([StateProvinceID])
	ON [PRIMARY]
GO
ALTER TABLE [Person].[Address] SET (LOCK_ESCALATION = TABLE)
GO
