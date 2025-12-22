CREATE TABLE [user].[LoginHistory] (
    [LogID]         BIGINT           IDENTITY (1, 1) NOT NULL,
    [UserID]        UNIQUEIDENTIFIER NOT NULL,
    [AttemptTime]   DATETIME2 (7)    DEFAULT (getutcdate()) NOT NULL,
    [WasSuccessful] BIT              NOT NULL,
    [IPAddress]     NVARCHAR (45)    NOT NULL,
    [UserAgent]     NVARCHAR (255)   NULL,
    PRIMARY KEY CLUSTERED ([LogID] ASC),
    CONSTRAINT [FK_LoginHistory_Users] FOREIGN KEY ([UserID]) REFERENCES [user].[Users] ([UserID]) ON DELETE CASCADE
);


GO

