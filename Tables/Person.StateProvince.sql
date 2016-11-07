SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Person].[StateProvince] (
		[StateProvinceID]             [int] IDENTITY(1, 1) NOT NULL,
		[StateProvinceCode]           [nchar](3) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[CountryRegionCode]           [nvarchar](3) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[IsOnlyStateProvinceFlag]     [dbo].[Flag] NOT NULL,
		[Name]                        [dbo].[Name] NOT NULL,
		[TerritoryID]                 [int] NOT NULL,
		[rowguid]                     [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]                [datetime] NOT NULL,
		CONSTRAINT [PK_StateProvince_StateProvinceID]
		PRIMARY KEY
		CLUSTERED
		([StateProvinceID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Person].[StateProvince]
	ADD
	CONSTRAINT [DF_StateProvince_IsOnlyStateProvinceFlag]
	DEFAULT ((1)) FOR [IsOnlyStateProvinceFlag]
GO
ALTER TABLE [Person].[StateProvince]
	ADD
	CONSTRAINT [DF_StateProvince_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Person].[StateProvince]
	ADD
	CONSTRAINT [DF_StateProvince_rowguid]
	DEFAULT (newid()) FOR [rowguid]
GO
ALTER TABLE [Person].[StateProvince]
	WITH CHECK
	ADD CONSTRAINT [FK_StateProvince_CountryRegion_CountryRegionCode]
	FOREIGN KEY ([CountryRegionCode]) REFERENCES [Person].[CountryRegion] ([CountryRegionCode])
ALTER TABLE [Person].[StateProvince]
	CHECK CONSTRAINT [FK_StateProvince_CountryRegion_CountryRegionCode]

GO
ALTER TABLE [Person].[StateProvince]
	WITH CHECK
	ADD CONSTRAINT [FK_StateProvince_SalesTerritory_TerritoryID]
	FOREIGN KEY ([TerritoryID]) REFERENCES [Sales].[SalesTerritory] ([TerritoryID])
ALTER TABLE [Person].[StateProvince]
	CHECK CONSTRAINT [FK_StateProvince_SalesTerritory_TerritoryID]

GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_StateProvince_Name]
	ON [Person].[StateProvince] ([Name])
	ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_StateProvince_rowguid]
	ON [Person].[StateProvince] ([rowguid])
	ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_StateProvince_StateProvinceCode_CountryRegionCode]
	ON [Person].[StateProvince] ([StateProvinceCode], [CountryRegionCode])
	ON [PRIMARY]
GO
ALTER TABLE [Person].[StateProvince] SET (LOCK_ESCALATION = TABLE)
GO
