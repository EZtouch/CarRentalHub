CREATE TABLE [dbo].[User] (
    [UserId]   INT           IDENTITY (1, 1) NOT NULL,
    [Name]     NVARCHAR (70) NOT NULL,
    [DOB]      DATE          NOT NULL,
    [Email]    NVARCHAR (75) NOT NULL,
    [Password] NVARCHAR (24) NOT NULL,
    [Phone]    NVARCHAR (30) NOT NULL,
    [RoleId]   TINYINT       NOT NULL,
    CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED ([UserId] ASC),
    CONSTRAINT [FK_User_UserRole] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[UserRole] ([RoleId]),
    CONSTRAINT [UQ_User_Email] UNIQUE NONCLUSTERED ([DOB] ASC),
    CONSTRAINT [UQ_User_Phone] UNIQUE NONCLUSTERED ([Phone] ASC),
    CONSTRAINT [UQ_User_UserId] UNIQUE NONCLUSTERED ([UserId] ASC)
);

