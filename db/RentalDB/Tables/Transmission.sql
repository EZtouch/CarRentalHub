CREATE TABLE [dbo].[Transmission] (
    [TransmissionId] TINYINT        IDENTITY (1, 1) NOT NULL,
    [Type]           NVARCHAR (50)  NOT NULL,
    [Description]    NVARCHAR (255) NULL,
    CONSTRAINT [PK_Transmission] PRIMARY KEY CLUSTERED ([TransmissionId] ASC),
    CONSTRAINT [UQ_Transmission_TransmissionId] UNIQUE NONCLUSTERED ([TransmissionId] ASC),
    CONSTRAINT [UQ_Transmission_Type] UNIQUE NONCLUSTERED ([Type] ASC)
);

