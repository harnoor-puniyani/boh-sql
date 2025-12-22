CREATE TABLE [banking].[FixedDeposits] (
    [FixedDepositID]     BIGINT           IDENTITY (1, 1) NOT NULL,
    [AccountID]          UNIQUEIDENTIFIER NOT NULL,
    [PrincipalAmount]    DECIMAL (19, 4)  NOT NULL,
    [InterestRate]       DECIMAL (5, 2)   NOT NULL,
    [TermInMonths]       INT              NOT NULL,
    [MaturityDate]       DATE             NOT NULL,
    [InterestPayoutType] NVARCHAR (20)    NOT NULL,
    [CreatedAt]          DATETIME2 (7)    DEFAULT (getutcdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([FixedDepositID] ASC),
    CHECK ([InterestPayoutType]='monthly' OR [InterestPayoutType]='on_maturity'),
    CONSTRAINT [FK_FixedDeposits_Account] FOREIGN KEY ([AccountID]) REFERENCES [banking].[Accounts] ([AccountID]) ON DELETE CASCADE,
    UNIQUE NONCLUSTERED ([AccountID] ASC)
);


GO

