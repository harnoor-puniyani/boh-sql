CREATE TABLE [user].[UserProfiles] (
    [UserProfileID] BIGINT           IDENTITY (1, 1) NOT NULL,
    [UserID]        UNIQUEIDENTIFIER NOT NULL,
    [FirstName]     NVARCHAR (50)    NOT NULL,
    [LastName]      NVARCHAR (50)    NOT NULL,
    [DateOfBirth]   DATE             NOT NULL,
    [KYCStatus]     NVARCHAR (20)    DEFAULT ('NotVerified') NOT NULL,
    PRIMARY KEY CLUSTERED ([UserProfileID] ASC),
    CHECK ([KYCStatus]='Rejected' OR [KYCStatus]='Verified' OR [KYCStatus]='Pending' OR [KYCStatus]='NotVerified'),
    CONSTRAINT [FK_UserProfiles_Users] FOREIGN KEY ([UserID]) REFERENCES [user].[Users] ([UserID]) ON DELETE CASCADE,
    UNIQUE NONCLUSTERED ([UserID] ASC)
);


GO

