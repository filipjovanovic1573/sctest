SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Sales].[CountryRegionCurrency] (
		[CountryRegionCode]     [nvarchar](3) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[CurrencyCode]          [nchar](3) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[ModifiedDate]          [datetime] NOT NULL,
		CONSTRAINT [PK_CountryRegionCurrency_CountryRegionCode_CurrencyCode]
		PRIMARY KEY
		CLUSTERED
		([CountryRegionCode], [CurrencyCode])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Sales].[CountryRegionCurrency]
	ADD
	CONSTRAINT [DF_CountryRegionCurrency_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Sales].[CountryRegionCurrency]
	WITH CHECK
	ADD CONSTRAINT [FK_CountryRegionCurrency_CountryRegion_CountryRegionCode]
	FOREIGN KEY ([CountryRegionCode]) REFERENCES [Person].[CountryRegion] ([CountryRegionCode])
ALTER TABLE [Sales].[CountryRegionCurrency]
	CHECK CONSTRAINT [FK_CountryRegionCurrency_CountryRegion_CountryRegionCode]

GO
ALTER TABLE [Sales].[CountryRegionCurrency]
	WITH CHECK
	ADD CONSTRAINT [FK_CountryRegionCurrency_Currency_CurrencyCode]
	FOREIGN KEY ([CurrencyCode]) REFERENCES [Sales].[Currency] ([CurrencyCode])
ALTER TABLE [Sales].[CountryRegionCurrency]
	CHECK CONSTRAINT [FK_CountryRegionCurrency_Currency_CurrencyCode]

GO
CREATE NONCLUSTERED INDEX [IX_CountryRegionCurrency_CurrencyCode]
	ON [Sales].[CountryRegionCurrency] ([CurrencyCode])
	ON [PRIMARY]
GO
ALTER TABLE [Sales].[CountryRegionCurrency] SET (LOCK_ESCALATION = TABLE)
GO
