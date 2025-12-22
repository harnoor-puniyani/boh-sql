CREATE TABLE [banking].[Beneficiaries] (
    [BeneficiaryID]   UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [UserID]          UNIQUEIDENTIFIER NOT NULL,
    [Nickname]        NVARCHAR (100)   NOT NULL,
    [BeneficiaryName] NVARCHAR (255)   NOT NULL,
    [AccountNumber]   NVARCHAR (50)    NOT NULL,
    [BankName]        NVARCHAR (255)   NOT NULL,
    [IFSCCode]        NVARCHAR (20)    NOT NULL,
    PRIMARY KEY CLUSTERED ([BeneficiaryID] ASC),
    CONSTRAINT [FK_Beneficiaries_User] FOREIGN KEY ([UserID]) REFERENCES [user].[Users] ([UserID]) ON DELETE CASCADE
);


GO

