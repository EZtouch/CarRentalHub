-- <Migration ID="07e9e4fb-6380-4d78-9a18-0da0e84133fb" />
GO

PRINT N'Adding constraints to [dbo].[Car]'
GO
ALTER TABLE [dbo].[Car] ADD CONSTRAINT [UQ_Car_RegPlateNo] UNIQUE NONCLUSTERED  ([RegPlateNo])
GO
PRINT N'Adding foreign keys to [dbo].[Car]'
GO
ALTER TABLE [dbo].[Car] ADD CONSTRAINT [FK_Car_Color] FOREIGN KEY ([ColorId]) REFERENCES [dbo].[Color] ([ColorId])
GO
ALTER TABLE [dbo].[Car] ADD CONSTRAINT [FK_Car_Model] FOREIGN KEY ([ModelId]) REFERENCES [dbo].[Model] ([ModelId])
GO
PRINT N'Adding foreign keys to [dbo].[Model]'
GO
ALTER TABLE [dbo].[Model] ADD CONSTRAINT [FK_Model_Transmission] FOREIGN KEY ([TransmissionId]) REFERENCES [dbo].[Transmission] ([TransmissionId])
GO
PRINT N'Adding foreign keys to [dbo].[Rental]'
GO
ALTER TABLE [dbo].[Rental] ADD CONSTRAINT [FK_Rental_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([UserId])
GO
PRINT N'Adding foreign keys to [dbo].[User]'
GO
ALTER TABLE [dbo].[User] ADD CONSTRAINT [FK_User_UserRole] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[UserRole] ([RoleId])
GO
