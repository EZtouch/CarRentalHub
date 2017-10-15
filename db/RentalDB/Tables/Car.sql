CREATE TABLE [dbo].[Car] (
    [CarId]            INT            IDENTITY (1, 1) NOT NULL,
    [AvailabilityId]   TINYINT        NOT NULL,
    [ModelId]          SMALLINT       NOT NULL,
    [ColorId]          SMALLINT       NOT NULL,
    [Mileage]          FLOAT (53)     NULL,
    [RegPlateNo]       NVARCHAR (12)  NOT NULL,
    [YearManufactured] DATE           NOT NULL,
    [ImgPath]          NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_Car] PRIMARY KEY CLUSTERED ([CarId] ASC),
    CONSTRAINT [FK_Car_Availability] FOREIGN KEY ([AvailabilityId]) REFERENCES [dbo].[Availability] ([AvailabilityId]),
    CONSTRAINT [FK_Car_Color] FOREIGN KEY ([ColorId]) REFERENCES [dbo].[Color] ([ColorId]),
    CONSTRAINT [FK_Car_Model] FOREIGN KEY ([ModelId]) REFERENCES [dbo].[Model] ([ModelId]),
    CONSTRAINT [UQ_Car_CarId] UNIQUE NONCLUSTERED ([CarId] ASC),
    CONSTRAINT [UQ_Car_RegPlateNo] UNIQUE NONCLUSTERED ([RegPlateNo] ASC)
);

