CREATE TABLE [banking].[AccountOwnership] (
    [AccountOwnershipID] BIGINT           IDENTITY (1, 1) NOT NULL,
    [AccountID]          UNIQUEIDENTIFIER NOT NULL,
    [UserID]             UNIQUEIDENTIFIER NOT NULL,
    [Role]               NVARCHAR (20)    DEFAULT ('owner') NOT NULL,
    [IsPrimary]          BIT              DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([AccountOwnershipID] ASC),
    CHECK ([Role]='guest' OR [Role]='viewer' OR [Role]='owner'),
    CONSTRAINT [FK_AccountOwnership_Account] FOREIGN KEY ([AccountID]) REFERENCES [banking].[Accounts] ([AccountID]) ON DELETE CASCADE,
    CONSTRAINT [FK_AccountOwnership_User] FOREIGN KEY ([UserID]) REFERENCES [user].[Users] ([UserID]) ON DELETE CASCADE,
    CONSTRAINT [UQ_UserPerAccount] UNIQUE NONCLUSTERED ([AccountID] ASC, [UserID] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_OnePrimaryAccountPerUser]
    ON [banking].[AccountOwnership]([UserID] ASC) WHERE ([IsPrimary]=(1));


GO

