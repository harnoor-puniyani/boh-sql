CREATE TABLE [user].[Addresses] (
    [AddressID]    BIGINT           IDENTITY (1, 1) NOT NULL,
    [UserID]       UNIQUEIDENTIFIER NOT NULL,
    [AddressLine1] NVARCHAR (255)   NOT NULL,
    [City]         NVARCHAR (100)   NOT NULL,
    [State]        NVARCHAR (100)   NOT NULL,
    [PostalCode]   NVARCHAR (10)    NOT NULL,
    [Country]      NVARCHAR (100)   NOT NULL,
    [AddressType]  NVARCHAR (20)    NOT NULL,
    [IsPrimary]    BIT              DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([AddressID] ASC),
    CHECK ([AddressType]='Mailing' OR [AddressType]='Work' OR [AddressType]='Home'),
    CONSTRAINT [FK_Addresses_Users] FOREIGN KEY ([UserID]) REFERENCES [user].[Users] ([UserID]) ON DELETE CASCADE
);


GO

