SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Sales].[CreditCard] (
		[CreditCardID]     [int] IDENTITY(1, 1) NOT NULL,
		[CardType]         [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[CardNumber]       [nvarchar](25) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
		[ExpMonth]         [tinyint] NOT NULL,
		[ExpYear]          [smallint] NOT NULL,
		[ModifiedDate]     [datetime] NOT NULL,
		CONSTRAINT [PK_CreditCard_CreditCardID]
		PRIMARY KEY
		CLUSTERED
		([CreditCardID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Sales].[CreditCard]
	ADD
	CONSTRAINT [DF_CreditCard_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_CreditCard_CardNumber]
	ON [Sales].[CreditCard] ([CardNumber])
	ON [PRIMARY]
GO
ALTER TABLE [Sales].[CreditCard] SET (LOCK_ESCALATION = TABLE)
GO
