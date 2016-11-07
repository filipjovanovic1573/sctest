SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Production].[ProductPhoto] (
		[ProductPhotoID]             [int] IDENTITY(1, 1) NOT NULL,
		[ThumbNailPhoto]             [varbinary](max) NULL,
		[ThumbnailPhotoFileName]     [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[LargePhoto]                 [varbinary](max) NULL,
		[LargePhotoFileName]         [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NULL,
		[ModifiedDate]               [datetime] NOT NULL,
		CONSTRAINT [PK_ProductPhoto_ProductPhotoID]
		PRIMARY KEY
		CLUSTERED
		([ProductPhotoID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [Production].[ProductPhoto]
	ADD
	CONSTRAINT [DF_ProductPhoto_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Production].[ProductPhoto] SET (LOCK_ESCALATION = TABLE)
GO
