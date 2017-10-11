-- <Migration ID="6071e963-0981-4cb6-9bab-0af2071a6647" />
GO

PRINT N'Creating [dbo].[Availability]'
GO
CREATE TABLE [dbo].[Availability]
(
[AvailabilityId] [uniqueidentifier] NOT NULL,
[Description] [nvarchar] (20) NOT NULL
)
GO
PRINT N'Creating primary key [PK_Availability] on [dbo].[Availability]'
GO
ALTER TABLE [dbo].[Availability] ADD CONSTRAINT [PK_Availability] PRIMARY KEY CLUSTERED  ([AvailabilityId])
GO
PRINT N'Adding constraints to [dbo].[Availability]'
GO
ALTER TABLE [dbo].[Availability] ADD CONSTRAINT [UQ_Availability_AvailabilityId] UNIQUE NONCLUSTERED  ([AvailabilityId])
GO
PRINT N'Adding constraints to [dbo].[Availability]'
GO
ALTER TABLE [dbo].[Availability] ADD CONSTRAINT [UQ_Availability_Description] UNIQUE NONCLUSTERED  ([Description])
GO
PRINT N'Creating [dbo].[Car]'
GO
CREATE TABLE [dbo].[Car]
(
[CarId] [uniqueidentifier] NOT NULL,
[AvailabilityId] [uniqueidentifier] NOT NULL,
[ModelId] [uniqueidentifier] NOT NULL,
[ColorId] [uniqueidentifier] NOT NULL,
[ClassId] [uniqueidentifier] NOT NULL,
[Mileage] [float] NULL,
[RegPlateNo] [nvarchar] (12) NOT NULL,
[YearManufactured] [date] NOT NULL,
[ImgPath] [nvarchar] (max) NULL
)
GO
PRINT N'Creating primary key [PK_Car] on [dbo].[Car]'
GO
ALTER TABLE [dbo].[Car] ADD CONSTRAINT [PK_Car] PRIMARY KEY CLUSTERED  ([CarId])
GO
PRINT N'Adding constraints to [dbo].[Car]'
GO
ALTER TABLE [dbo].[Car] ADD CONSTRAINT [UQ_Car_CarId] UNIQUE NONCLUSTERED  ([CarId])
GO
PRINT N'Adding constraints to [dbo].[Car]'
GO
ALTER TABLE [dbo].[Car] ADD CONSTRAINT [UQ_Car_RegPlateNo] UNIQUE NONCLUSTERED  ([RegPlateNo])
GO
PRINT N'Creating [dbo].[Class]'
GO
CREATE TABLE [dbo].[Class]
(
[ClassId] [uniqueidentifier] NOT NULL,
[Name] [uniqueidentifier] NOT NULL,
[Description] [nvarchar] (50) NULL
)
GO
PRINT N'Creating primary key [PK_Class] on [dbo].[Class]'
GO
ALTER TABLE [dbo].[Class] ADD CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED  ([ClassId])
GO
PRINT N'Adding constraints to [dbo].[Class]'
GO
ALTER TABLE [dbo].[Class] ADD CONSTRAINT [UQ_Class_ClassId] UNIQUE NONCLUSTERED  ([ClassId])
GO
PRINT N'Adding constraints to [dbo].[Class]'
GO
ALTER TABLE [dbo].[Class] ADD CONSTRAINT [UQ_Class_Name] UNIQUE NONCLUSTERED  ([Name])
GO
PRINT N'Creating [dbo].[Color]'
GO
CREATE TABLE [dbo].[Color]
(
[ColorId] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (20) NOT NULL,
[Code] [char] (6) NOT NULL
)
GO
PRINT N'Creating primary key [PK_Color] on [dbo].[Color]'
GO
ALTER TABLE [dbo].[Color] ADD CONSTRAINT [PK_Color] PRIMARY KEY CLUSTERED  ([ColorId])
GO
PRINT N'Adding constraints to [dbo].[Color]'
GO
ALTER TABLE [dbo].[Color] ADD CONSTRAINT [UQ_Color_Code] UNIQUE NONCLUSTERED  ([Code])
GO
PRINT N'Adding constraints to [dbo].[Color]'
GO
ALTER TABLE [dbo].[Color] ADD CONSTRAINT [UQ_Color_ColorId] UNIQUE NONCLUSTERED  ([ColorId])
GO
PRINT N'Adding constraints to [dbo].[Color]'
GO
ALTER TABLE [dbo].[Color] ADD CONSTRAINT [UQ_Color_Name] UNIQUE NONCLUSTERED  ([Name])
GO
PRINT N'Creating [dbo].[Model]'
GO
CREATE TABLE [dbo].[Model]
(
[ModelId] [uniqueidentifier] NOT NULL,
[MakeId] [uniqueidentifier] NOT NULL,
[ModelTypeId] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (20) NOT NULL,
[TransmissionId] [uniqueidentifier] NOT NULL
)
GO
PRINT N'Creating primary key [PK_Model] on [dbo].[Model]'
GO
ALTER TABLE [dbo].[Model] ADD CONSTRAINT [PK_Model] PRIMARY KEY CLUSTERED  ([ModelId])
GO
PRINT N'Adding constraints to [dbo].[Model]'
GO
ALTER TABLE [dbo].[Model] ADD CONSTRAINT [UQ_Model_ModelId] UNIQUE NONCLUSTERED  ([ModelId])
GO
PRINT N'Adding constraints to [dbo].[Model]'
GO
ALTER TABLE [dbo].[Model] ADD CONSTRAINT [UQ_Model_Name] UNIQUE NONCLUSTERED  ([Name])
GO
PRINT N'Creating [dbo].[Make]'
GO
CREATE TABLE [dbo].[Make]
(
[MakeId] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (50) NOT NULL
)
GO
PRINT N'Creating primary key [PK_Make] on [dbo].[Make]'
GO
ALTER TABLE [dbo].[Make] ADD CONSTRAINT [PK_Make] PRIMARY KEY CLUSTERED  ([MakeId])
GO
PRINT N'Adding constraints to [dbo].[Make]'
GO
ALTER TABLE [dbo].[Make] ADD CONSTRAINT [UQ_Make_MakeId] UNIQUE NONCLUSTERED  ([MakeId])
GO
PRINT N'Adding constraints to [dbo].[Make]'
GO
ALTER TABLE [dbo].[Make] ADD CONSTRAINT [UQ_Make_Name] UNIQUE NONCLUSTERED  ([Name])
GO
PRINT N'Creating [dbo].[Transmission]'
GO
CREATE TABLE [dbo].[Transmission]
(
[TransmissionId] [uniqueidentifier] NOT NULL,
[Type] [nvarchar] (50) NOT NULL,
[Description] [nvarchar] (255) NULL
)
GO
PRINT N'Creating primary key [PK_Transmission] on [dbo].[Transmission]'
GO
ALTER TABLE [dbo].[Transmission] ADD CONSTRAINT [PK_Transmission] PRIMARY KEY CLUSTERED  ([TransmissionId])
GO
PRINT N'Adding constraints to [dbo].[Transmission]'
GO
ALTER TABLE [dbo].[Transmission] ADD CONSTRAINT [UQ_Transmission_TransmissionId] UNIQUE NONCLUSTERED  ([TransmissionId])
GO
PRINT N'Adding constraints to [dbo].[Transmission]'
GO
ALTER TABLE [dbo].[Transmission] ADD CONSTRAINT [UQ_Transmission_Type] UNIQUE NONCLUSTERED  ([Type])
GO
PRINT N'Creating [dbo].[Rental]'
GO
CREATE TABLE [dbo].[Rental]
(
[RentalId] [uniqueidentifier] NOT NULL,
[UserId] [uniqueidentifier] NOT NULL,
[CarId] [uniqueidentifier] NOT NULL,
[EmployeeId] [uniqueidentifier] NOT NULL,
[RentDate] [datetime] NOT NULL,
[ExpectedReturnDate] [datetime] NOT NULL,
[ReturnDate] [datetime] NULL
)
GO
PRINT N'Creating primary key [PK_Rental] on [dbo].[Rental]'
GO
ALTER TABLE [dbo].[Rental] ADD CONSTRAINT [PK_Rental] PRIMARY KEY CLUSTERED  ([RentalId])
GO
PRINT N'Adding constraints to [dbo].[Rental]'
GO
ALTER TABLE [dbo].[Rental] ADD CONSTRAINT [UQ_Rental_RentalId] UNIQUE NONCLUSTERED  ([RentalId])
GO
PRINT N'Creating [dbo].[User]'
GO
CREATE TABLE [dbo].[User]
(
[UserId] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (70) NOT NULL,
[DOB] [date] NOT NULL,
[Email] [nvarchar] (75) NOT NULL,
[Password] [nvarchar] (24) NOT NULL,
[Phone] [nvarchar] (30) NOT NULL,
[RoleId] [uniqueidentifier] NOT NULL,
[NationalityId] [uniqueidentifier] NOT NULL
)
GO
PRINT N'Creating primary key [PK_User] on [dbo].[User]'
GO
ALTER TABLE [dbo].[User] ADD CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED  ([UserId])
GO
PRINT N'Adding constraints to [dbo].[User]'
GO
ALTER TABLE [dbo].[User] ADD CONSTRAINT [UQ_User_Email] UNIQUE NONCLUSTERED  ([DOB])
GO
PRINT N'Adding constraints to [dbo].[User]'
GO
ALTER TABLE [dbo].[User] ADD CONSTRAINT [UQ_User_Phone] UNIQUE NONCLUSTERED  ([Phone])
GO
PRINT N'Adding constraints to [dbo].[User]'
GO
ALTER TABLE [dbo].[User] ADD CONSTRAINT [UQ_User_UserId] UNIQUE NONCLUSTERED  ([UserId])
GO
PRINT N'Creating [dbo].[UserRole]'
GO
CREATE TABLE [dbo].[UserRole]
(
[RoleId] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (15) NOT NULL,
[Description] [nvarchar] (255) NULL
)
GO
PRINT N'Creating primary key [PK_UserRole] on [dbo].[UserRole]'
GO
ALTER TABLE [dbo].[UserRole] ADD CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED  ([RoleId])
GO
PRINT N'Adding constraints to [dbo].[UserRole]'
GO
ALTER TABLE [dbo].[UserRole] ADD CONSTRAINT [UQ_UserRole_Name] UNIQUE NONCLUSTERED  ([Name])
GO
PRINT N'Adding constraints to [dbo].[UserRole]'
GO
ALTER TABLE [dbo].[UserRole] ADD CONSTRAINT [UQ_UserRole_RoleId] UNIQUE NONCLUSTERED  ([RoleId])
GO
PRINT N'Adding foreign keys to [dbo].[Car]'
GO
ALTER TABLE [dbo].[Car] ADD CONSTRAINT [FK_Car_Availability] FOREIGN KEY ([AvailabilityId]) REFERENCES [dbo].[Availability] ([AvailabilityId])
GO
ALTER TABLE [dbo].[Car] ADD CONSTRAINT [FK_Car_Model] FOREIGN KEY ([ModelId]) REFERENCES [dbo].[Model] ([ModelId])
GO
ALTER TABLE [dbo].[Car] ADD CONSTRAINT [FK_Car_Color] FOREIGN KEY ([ColorId]) REFERENCES [dbo].[Color] ([ColorId])
GO
ALTER TABLE [dbo].[Car] ADD CONSTRAINT [FK_Car_Class] FOREIGN KEY ([ClassId]) REFERENCES [dbo].[Class] ([ClassId])
GO
PRINT N'Adding foreign keys to [dbo].[Rental]'
GO
ALTER TABLE [dbo].[Rental] ADD CONSTRAINT [FK_Rental_Car] FOREIGN KEY ([CarId]) REFERENCES [dbo].[Car] ([CarId])
GO
ALTER TABLE [dbo].[Rental] ADD CONSTRAINT [FK_Rental_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Rental] ADD CONSTRAINT [FK_Rental_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[User] ([UserId])
GO
PRINT N'Adding foreign keys to [dbo].[Model]'
GO
ALTER TABLE [dbo].[Model] ADD CONSTRAINT [FK_Model_Make] FOREIGN KEY ([MakeId]) REFERENCES [dbo].[Make] ([MakeId])
GO
ALTER TABLE [dbo].[Model] ADD CONSTRAINT [FK_Model_Transmission] FOREIGN KEY ([TransmissionId]) REFERENCES [dbo].[Transmission] ([TransmissionId])
GO
PRINT N'Adding foreign keys to [dbo].[User]'
GO
ALTER TABLE [dbo].[User] ADD CONSTRAINT [FK_User_UserRole] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[UserRole] ([RoleId])
GO
