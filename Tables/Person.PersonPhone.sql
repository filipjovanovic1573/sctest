SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Person].[PersonPhone] (
		[BusinessEntityID]      [int] NOT NULL,
		[PhoneNumber]           [dbo].[Phone] NOT NULL,
		[PhoneNumberTypeID]     [int] NOT NULL,
		[ModifiedDate]          [datetime] NOT NULL,
		CONSTRAINT [PK_PersonPhone_BusinessEntityID_PhoneNumber_PhoneNumberTypeID]
		PRIMARY KEY
		CLUSTERED
		([BusinessEntityID], [PhoneNumber], [PhoneNumberTypeID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Person].[PersonPhone]
	ADD
	CONSTRAINT [DF_PersonPhone_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Person].[PersonPhone]
	WITH CHECK
	ADD CONSTRAINT [FK_PersonPhone_Person_BusinessEntityID]
	FOREIGN KEY ([BusinessEntityID]) REFERENCES [Person].[Person] ([BusinessEntityID])
ALTER TABLE [Person].[PersonPhone]
	CHECK CONSTRAINT [FK_PersonPhone_Person_BusinessEntityID]

GO
ALTER TABLE [Person].[PersonPhone]
	WITH CHECK
	ADD CONSTRAINT [FK_PersonPhone_PhoneNumberType_PhoneNumberTypeID]
	FOREIGN KEY ([PhoneNumberTypeID]) REFERENCES [Person].[PhoneNumberType] ([PhoneNumberTypeID])
ALTER TABLE [Person].[PersonPhone]
	CHECK CONSTRAINT [FK_PersonPhone_PhoneNumberType_PhoneNumberTypeID]

GO
CREATE NONCLUSTERED INDEX [IX_PersonPhone_PhoneNumber]
	ON [Person].[PersonPhone] ([PhoneNumber])
	ON [PRIMARY]
GO
ALTER TABLE [Person].[PersonPhone] SET (LOCK_ESCALATION = TABLE)
GO
