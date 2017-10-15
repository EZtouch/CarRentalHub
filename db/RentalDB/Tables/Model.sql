CREATE TABLE [dbo].[Model] (
    [ModelId]        SMALLINT      IDENTITY (1, 1) NOT NULL,
    [MakeId]         SMALLINT      NOT NULL,
    [ClassId]        TINYINT       NOT NULL,
    [Name]           NVARCHAR (50) NOT NULL,
    [TransmissionId] TINYINT       NOT NULL,
    CONSTRAINT [PK_Model] PRIMARY KEY CLUSTERED ([ModelId] ASC),
    CONSTRAINT [FK_Model_Class] FOREIGN KEY ([ClassId]) REFERENCES [dbo].[Class] ([ClassId]),
    CONSTRAINT [FK_Model_Make] FOREIGN KEY ([MakeId]) REFERENCES [dbo].[Make] ([MakeId]),
    CONSTRAINT [FK_Model_Transmission] FOREIGN KEY ([TransmissionId]) REFERENCES [dbo].[Transmission] ([TransmissionId]),
    CONSTRAINT [UQ_Model_ModelId] UNIQUE NONCLUSTERED ([ModelId] ASC),
    CONSTRAINT [UQ_Model_Name] UNIQUE NONCLUSTERED ([Name] ASC)
);

