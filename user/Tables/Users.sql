CREATE TABLE [user].[Users] (
    [UserID]       UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [Email]        NVARCHAR (255)   NOT NULL,
    [PhoneNumber]  NVARCHAR (20)    NULL,
    [PasswordHash] NVARCHAR (MAX)   NOT NULL,
    [IsActive]     BIT              DEFAULT ((1)) NOT NULL,
    [CreatedAt]    DATETIME2 (7)    DEFAULT (getutcdate()) NOT NULL,
    [UpdatedAt]    DATETIME2 (7)    NULL,
    [Role]         NVARCHAR (10)    DEFAULT ('user') NOT NULL,
    [MFAMethod]    NVARCHAR (10)    NULL,
    [MFASecret]    NVARCHAR (100)   NULL,
    PRIMARY KEY CLUSTERED ([UserID] ASC),
    CONSTRAINT [CHK_ROLE] CHECK ([Role]='admin' OR [Role]='user'),
    UNIQUE NONCLUSTERED ([Email] ASC),
    UNIQUE NONCLUSTERED ([PhoneNumber] ASC)
);


GO

