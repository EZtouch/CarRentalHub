CREATE TABLE [dbo].[Availability] (
    [AvailabilityId] TINYINT       IDENTITY (1, 1) NOT NULL,
    [Description]    NVARCHAR (20) NOT NULL,
    CONSTRAINT [PK_Availability] PRIMARY KEY CLUSTERED ([AvailabilityId] ASC),
    CONSTRAINT [UQ_Availability_AvailabilityId] UNIQUE NONCLUSTERED ([AvailabilityId] ASC),
    CONSTRAINT [UQ_Availability_Description] UNIQUE NONCLUSTERED ([Description] ASC)
);

