SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Sales].[CurrencyRate] (
		[CurrencyRateID]       [int] IDENTITY(1, 1) NOT NULL,
		[CurrencyRateDate]     [datetime] NOT NULL,
		[FromCurrencyCode]     [nchar](3) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[ToCurrencyCode]       [nchar](3) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[AverageRate]          [money] NOT NULL,
		[EndOfDayRate]         [money] NOT NULL,
		[ModifiedDate]         [datetime] NOT NULL,
		CONSTRAINT [PK_CurrencyRate_CurrencyRateID]
		PRIMARY KEY
		CLUSTERED
		([CurrencyRateID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Sales].[CurrencyRate]
	ADD
	CONSTRAINT [DF_CurrencyRate_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Sales].[CurrencyRate]
	WITH CHECK
	ADD CONSTRAINT [FK_CurrencyRate_Currency_FromCurrencyCode]
	FOREIGN KEY ([FromCurrencyCode]) REFERENCES [Sales].[Currency] ([CurrencyCode])
ALTER TABLE [Sales].[CurrencyRate]
	CHECK CONSTRAINT [FK_CurrencyRate_Currency_FromCurrencyCode]

GO
ALTER TABLE [Sales].[CurrencyRate]
	WITH CHECK
	ADD CONSTRAINT [FK_CurrencyRate_Currency_ToCurrencyCode]
	FOREIGN KEY ([ToCurrencyCode]) REFERENCES [Sales].[Currency] ([CurrencyCode])
ALTER TABLE [Sales].[CurrencyRate]
	CHECK CONSTRAINT [FK_CurrencyRate_Currency_ToCurrencyCode]

GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_CurrencyRate_CurrencyRateDate_FromCurrencyCode_ToCurrencyCode]
	ON [Sales].[CurrencyRate] ([CurrencyRateDate], [FromCurrencyCode], [ToCurrencyCode])
	ON [PRIMARY]
GO
ALTER TABLE [Sales].[CurrencyRate] SET (LOCK_ESCALATION = TABLE)
GO
