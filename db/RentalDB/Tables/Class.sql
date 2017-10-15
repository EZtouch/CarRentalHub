CREATE TABLE [dbo].[Class] (
    [ClassId]     TINYINT        IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (50) NOT NULL,
    [Description] NVARCHAR (255)  NULL,
    CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED ([ClassId] ASC),
    CONSTRAINT [UQ_Class_ClassId] UNIQUE NONCLUSTERED ([ClassId] ASC),
    CONSTRAINT [UQ_Class_Name] UNIQUE NONCLUSTERED ([Name] ASC)
);

