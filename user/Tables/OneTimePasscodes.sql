CREATE TABLE [user].[OneTimePasscodes] (
    [OTPID]     BIGINT           IDENTITY (1, 1) NOT NULL,
    [UserID]    UNIQUEIDENTIFIER NOT NULL,
    [OTPHash]   NVARCHAR (MAX)   NOT NULL,
    [ExpiresAt] DATETIME2 (7)    NOT NULL,
    [CreatedAt] DATETIME2 (7)    DEFAULT (getutcdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([OTPID] ASC),
    CONSTRAINT [FK_OneTimePasscodes_Users] FOREIGN KEY ([UserID]) REFERENCES [user].[Users] ([UserID]) ON DELETE CASCADE
);


GO

