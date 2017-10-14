CREATE TABLE [dbo].[UserRole] (
    [RoleId]      TINYINT        IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (15)  NOT NULL,
    [Description] NVARCHAR (255) NULL,
    CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED ([RoleId] ASC),
    CONSTRAINT [UQ_UserRole_Name] UNIQUE NONCLUSTERED ([Name] ASC),
    CONSTRAINT [UQ_UserRole_RoleId] UNIQUE NONCLUSTERED ([RoleId] ASC)
);

