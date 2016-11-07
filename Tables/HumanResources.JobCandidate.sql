SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [HumanResources].[JobCandidate] (
		[JobCandidateID]       [int] IDENTITY(1, 1) NOT NULL,
		[BusinessEntityID]     [int] NULL,
		[Resume]               [xml](CONTENT [HumanResources].[HRResumeSchemaCollection]) NULL,
		[ModifiedDate]         [datetime] NOT NULL,
		CONSTRAINT [PK_JobCandidate_JobCandidateID]
		PRIMARY KEY
		CLUSTERED
		([JobCandidateID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [HumanResources].[JobCandidate]
	ADD
	CONSTRAINT [DF_JobCandidate_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [HumanResources].[JobCandidate]
	WITH CHECK
	ADD CONSTRAINT [FK_JobCandidate_Employee_BusinessEntityID]
	FOREIGN KEY ([BusinessEntityID]) REFERENCES [HumanResources].[Employee] ([BusinessEntityID])
ALTER TABLE [HumanResources].[JobCandidate]
	CHECK CONSTRAINT [FK_JobCandidate_Employee_BusinessEntityID]

GO
CREATE NONCLUSTERED INDEX [IX_JobCandidate_BusinessEntityID]
	ON [HumanResources].[JobCandidate] ([BusinessEntityID])
	ON [PRIMARY]
GO
CREATE FULLTEXT INDEX ON [HumanResources].[JobCandidate]
	([Resume] LANGUAGE 1033)
	KEY INDEX [PK_JobCandidate_JobCandidateID]
	ON (FILEGROUP [PRIMARY], [AW2014FullTextCatalog])
	WITH CHANGE_TRACKING AUTO, STOPLIST SYSTEM
GO
ALTER TABLE [HumanResources].[JobCandidate] SET (LOCK_ESCALATION = TABLE)
GO
