CREATE TABLE [banking].[Accounts] (
    [AccountID]     UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [AccountNumber] NVARCHAR (20)    NOT NULL,
    [AccountType]   NVARCHAR (20)    NOT NULL,
    [Balance]       DECIMAL (19, 4)  DEFAULT ((0.00)) NOT NULL,
    [Currency]      CHAR (3)         DEFAULT ('INR') NOT NULL,
    [Status]        NVARCHAR (20)    DEFAULT ('active') NOT NULL,
    [CreatedAt]     DATETIME2 (7)    DEFAULT (getutcdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([AccountID] ASC),
    CHECK ([AccountType]='fixed_deposit' OR [AccountType]='savings' OR [AccountType]='checking'),
    CHECK ([Status]='closed' OR [Status]='frozen' OR [Status]='active'),
    UNIQUE NONCLUSTERED ([AccountNumber] ASC)
);


GO

