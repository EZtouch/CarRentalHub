CREATE TABLE [dbo].[Rental] (
    [RentalId]           INT      IDENTITY (1, 1) NOT NULL,
    [UserId]             INT      NOT NULL,
    [CarId]              INT      NOT NULL,
    [EmployeeId]         INT      NOT NULL,
    [RentDate]           DATETIME NOT NULL,
    [ExpectedReturnDate] DATETIME NOT NULL,
    [ReturnDate]         DATETIME NULL,
    CONSTRAINT [PK_Rental] PRIMARY KEY CLUSTERED ([RentalId] ASC),
    CONSTRAINT [FK_Rental_Car] FOREIGN KEY ([CarId]) REFERENCES [dbo].[Car] ([CarId]),
    CONSTRAINT [FK_Rental_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[User] ([UserId]),
    CONSTRAINT [FK_Rental_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([UserId]),
    CONSTRAINT [UQ_Rental_RentalId] UNIQUE NONCLUSTERED ([RentalId] ASC)
);

