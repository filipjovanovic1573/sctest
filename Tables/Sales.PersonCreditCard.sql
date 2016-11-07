SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [Sales].[PersonCreditCard] (
		[BusinessEntityID]     [int] NOT NULL,
		[CreditCardID]         [int] NOT NULL,
		[ModifiedDate]         [datetime] NOT NULL,
		CONSTRAINT [PK_PersonCreditCard_BusinessEntityID_CreditCardID]
		PRIMARY KEY
		CLUSTERED
		([BusinessEntityID], [CreditCardID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Sales].[PersonCreditCard]
	ADD
	CONSTRAINT [DF_PersonCreditCard_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Sales].[PersonCreditCard]
	WITH CHECK
	ADD CONSTRAINT [FK_PersonCreditCard_CreditCard_CreditCardID]
	FOREIGN KEY ([CreditCardID]) REFERENCES [Sales].[CreditCard] ([CreditCardID])
ALTER TABLE [Sales].[PersonCreditCard]
	CHECK CONSTRAINT [FK_PersonCreditCard_CreditCard_CreditCardID]

GO
ALTER TABLE [Sales].[PersonCreditCard]
	WITH CHECK
	ADD CONSTRAINT [FK_PersonCreditCard_Person_BusinessEntityID]
	FOREIGN KEY ([BusinessEntityID]) REFERENCES [Person].[Person] ([BusinessEntityID])
ALTER TABLE [Sales].[PersonCreditCard]
	CHECK CONSTRAINT [FK_PersonCreditCard_Person_BusinessEntityID]

GO
ALTER TABLE [Sales].[PersonCreditCard] SET (LOCK_ESCALATION = TABLE)
GO
