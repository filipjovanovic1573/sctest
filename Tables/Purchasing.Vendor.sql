SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Purchasing].[Vendor] (
		[BusinessEntityID]            [int] NOT NULL,
		[AccountNumber]               [dbo].[AccountNumber] NOT NULL,
		[Name]                        [dbo].[Name] NOT NULL,
		[CreditRating]                [tinyint] NOT NULL,
		[PreferredVendorStatus]       [dbo].[Flag] NOT NULL,
		[ActiveFlag]                  [dbo].[Flag] NOT NULL,
		[PurchasingWebServiceURL]     [nvarchar](1024) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[ModifiedDate]                [datetime] NOT NULL,
		CONSTRAINT [PK_Vendor_BusinessEntityID]
		PRIMARY KEY
		CLUSTERED
		([BusinessEntityID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Purchasing].[Vendor]
	ADD
	CONSTRAINT [CK_Vendor_CreditRating]
	CHECK
	([CreditRating]>=(1) AND [CreditRating]<=(5))
GO
ALTER TABLE [Purchasing].[Vendor]
CHECK CONSTRAINT [CK_Vendor_CreditRating]
GO
ALTER TABLE [Purchasing].[Vendor]
	ADD
	CONSTRAINT [DF_Vendor_ActiveFlag]
	DEFAULT ((1)) FOR [ActiveFlag]
GO
ALTER TABLE [Purchasing].[Vendor]
	ADD
	CONSTRAINT [DF_Vendor_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Purchasing].[Vendor]
	ADD
	CONSTRAINT [DF_Vendor_PreferredVendorStatus]
	DEFAULT ((1)) FOR [PreferredVendorStatus]
GO
ALTER TABLE [Purchasing].[Vendor]
	WITH CHECK
	ADD CONSTRAINT [FK_Vendor_BusinessEntity_BusinessEntityID]
	FOREIGN KEY ([BusinessEntityID]) REFERENCES [Person].[BusinessEntity] ([BusinessEntityID])
ALTER TABLE [Purchasing].[Vendor]
	CHECK CONSTRAINT [FK_Vendor_BusinessEntity_BusinessEntityID]

GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_Vendor_AccountNumber]
	ON [Purchasing].[Vendor] ([AccountNumber])
	ON [PRIMARY]
GO
ALTER TABLE [Purchasing].[Vendor] SET (LOCK_ESCALATION = TABLE)
GO
