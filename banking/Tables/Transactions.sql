CREATE TABLE [banking].[Transactions] (
    [TransactionID]         BIGINT           IDENTITY (1, 1) NOT NULL,
    [Amount]                DECIMAL (19, 4)  NOT NULL,
    [Currency]              CHAR (3)         DEFAULT ('INR') NOT NULL,
    [Timestamp]             DATETIME2 (7)    DEFAULT (getutcdate()) NOT NULL,
    [TransactionType]       NVARCHAR (30)    NOT NULL,
    [Status]                NVARCHAR (20)    DEFAULT ('completed') NOT NULL,
    [FromAccountID]         UNIQUEIDENTIFIER NULL,
    [ToAccountID]           UNIQUEIDENTIFIER NULL,
    [ToBeneficiaryID]       UNIQUEIDENTIFIER NULL,
    [ExternalSourceDetails] NVARCHAR (255)   NULL,
    [Description]           NVARCHAR (255)   NULL,
    [BankReferenceCode]     NVARCHAR (100)   DEFAULT (newid()) NOT NULL,
    PRIMARY KEY CLUSTERED ([TransactionID] ASC),
    CHECK ([Status]='reversed' OR [Status]='failed' OR [Status]='completed' OR [Status]='pending'),
    CHECK ([TransactionType]='fd_close' OR [TransactionType]='fd_open' OR [TransactionType]='external_transfer' OR [TransactionType]='internal_transfer' OR [TransactionType]='withdrawal' OR [TransactionType]='deposit'),
    CONSTRAINT [FK_Transactions_FromAccount] FOREIGN KEY ([FromAccountID]) REFERENCES [banking].[Accounts] ([AccountID]),
    CONSTRAINT [FK_Transactions_ToAccount] FOREIGN KEY ([ToAccountID]) REFERENCES [banking].[Accounts] ([AccountID]),
    CONSTRAINT [FK_Transactions_ToBeneficiary] FOREIGN KEY ([ToBeneficiaryID]) REFERENCES [banking].[Beneficiaries] ([BeneficiaryID]),
    UNIQUE NONCLUSTERED ([BankReferenceCode] ASC)
);


GO

