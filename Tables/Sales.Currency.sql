SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Sales].[Currency] (
		[CurrencyCode]     [nchar](3) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[Name]             [dbo].[Name] NOT NULL,
		[ModifiedDate]     [datetime] NOT NULL,
		CONSTRAINT [PK_Currency_CurrencyCode]
		PRIMARY KEY
		CLUSTERED
		([CurrencyCode])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Sales].[Currency]
	ADD
	CONSTRAINT [DF_Currency_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_Currency_Name]
	ON [Sales].[Currency] ([Name])
	ON [PRIMARY]
GO
ALTER TABLE [Sales].[Currency] SET (LOCK_ESCALATION = TABLE)
GO
