-- <Migration ID="7322812b-6b25-4764-bc53-1c857511ef6f" />
GO

PRINT N'Dropping foreign keys from [dbo].[Car]'
GO
ALTER TABLE [dbo].[Car] DROP CONSTRAINT [FK_Car_Availability]
GO
ALTER TABLE [dbo].[Car] DROP CONSTRAINT [FK_Car_Class]
GO
ALTER TABLE [dbo].[Car] DROP CONSTRAINT [FK_Car_Color]
GO
ALTER TABLE [dbo].[Car] DROP CONSTRAINT [FK_Car_Model]
GO
PRINT N'Dropping foreign keys from [dbo].[Rental]'
GO
ALTER TABLE [dbo].[Rental] DROP CONSTRAINT [FK_Rental_Car]
GO
ALTER TABLE [dbo].[Rental] DROP CONSTRAINT [FK_Rental_Employee]
GO
ALTER TABLE [dbo].[Rental] DROP CONSTRAINT [FK_Rental_User]
GO
PRINT N'Dropping foreign keys from [dbo].[Model]'
GO
ALTER TABLE [dbo].[Model] DROP CONSTRAINT [FK_Model_Make]
GO
ALTER TABLE [dbo].[Model] DROP CONSTRAINT [FK_Model_Transmission]
GO
PRINT N'Dropping foreign keys from [dbo].[User]'
GO
ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_UserRole]
GO
PRINT N'Dropping constraints from [dbo].[Availability]'
GO
ALTER TABLE [dbo].[Availability] DROP CONSTRAINT [PK_Availability]
GO
PRINT N'Dropping constraints from [dbo].[Availability]'
GO
ALTER TABLE [dbo].[Availability] DROP CONSTRAINT [UQ_Availability_AvailabilityId]
GO
PRINT N'Dropping constraints from [dbo].[Availability]'
GO
ALTER TABLE [dbo].[Availability] DROP CONSTRAINT [UQ_Availability_Description]
GO
PRINT N'Dropping constraints from [dbo].[Car]'
GO
ALTER TABLE [dbo].[Car] DROP CONSTRAINT [PK_Car]
GO
PRINT N'Dropping constraints from [dbo].[Car]'
GO
ALTER TABLE [dbo].[Car] DROP CONSTRAINT [UQ_Car_CarId]
GO
PRINT N'Dropping constraints from [dbo].[Car]'
GO
ALTER TABLE [dbo].[Car] DROP CONSTRAINT [UQ_Car_RegPlateNo]
GO
PRINT N'Dropping constraints from [dbo].[Class]'
GO
ALTER TABLE [dbo].[Class] DROP CONSTRAINT [PK_Class]
GO
PRINT N'Dropping constraints from [dbo].[Class]'
GO
ALTER TABLE [dbo].[Class] DROP CONSTRAINT [UQ_Class_ClassId]
GO
PRINT N'Dropping constraints from [dbo].[Class]'
GO
ALTER TABLE [dbo].[Class] DROP CONSTRAINT [UQ_Class_Name]
GO
PRINT N'Dropping constraints from [dbo].[Color]'
GO
ALTER TABLE [dbo].[Color] DROP CONSTRAINT [PK_Color]
GO
PRINT N'Dropping constraints from [dbo].[Color]'
GO
ALTER TABLE [dbo].[Color] DROP CONSTRAINT [UQ_Color_ColorId]
GO
PRINT N'Dropping constraints from [dbo].[Color]'
GO
ALTER TABLE [dbo].[Color] DROP CONSTRAINT [UQ_Color_Name]
GO
PRINT N'Dropping constraints from [dbo].[Color]'
GO
ALTER TABLE [dbo].[Color] DROP CONSTRAINT [UQ_Color_Code]
GO
PRINT N'Dropping constraints from [dbo].[Make]'
GO
ALTER TABLE [dbo].[Make] DROP CONSTRAINT [PK_Make]
GO
PRINT N'Dropping constraints from [dbo].[Make]'
GO
ALTER TABLE [dbo].[Make] DROP CONSTRAINT [UQ_Make_MakeId]
GO
PRINT N'Dropping constraints from [dbo].[Make]'
GO
ALTER TABLE [dbo].[Make] DROP CONSTRAINT [UQ_Make_Name]
GO
PRINT N'Dropping constraints from [dbo].[Model]'
GO
ALTER TABLE [dbo].[Model] DROP CONSTRAINT [PK_Model]
GO
PRINT N'Dropping constraints from [dbo].[Model]'
GO
ALTER TABLE [dbo].[Model] DROP CONSTRAINT [UQ_Model_ModelId]
GO
PRINT N'Dropping constraints from [dbo].[Model]'
GO
ALTER TABLE [dbo].[Model] DROP CONSTRAINT [UQ_Model_Name]
GO
PRINT N'Dropping constraints from [dbo].[Rental]'
GO
ALTER TABLE [dbo].[Rental] DROP CONSTRAINT [PK_Rental]
GO
PRINT N'Dropping constraints from [dbo].[Rental]'
GO
ALTER TABLE [dbo].[Rental] DROP CONSTRAINT [UQ_Rental_RentalId]
GO
PRINT N'Dropping constraints from [dbo].[Transmission]'
GO
ALTER TABLE [dbo].[Transmission] DROP CONSTRAINT [PK_Transmission]
GO
PRINT N'Dropping constraints from [dbo].[Transmission]'
GO
ALTER TABLE [dbo].[Transmission] DROP CONSTRAINT [UQ_Transmission_TransmissionId]
GO
PRINT N'Dropping constraints from [dbo].[Transmission]'
GO
ALTER TABLE [dbo].[Transmission] DROP CONSTRAINT [UQ_Transmission_Type]
GO
PRINT N'Dropping constraints from [dbo].[UserRole]'
GO
ALTER TABLE [dbo].[UserRole] DROP CONSTRAINT [PK_UserRole]
GO
PRINT N'Dropping constraints from [dbo].[UserRole]'
GO
ALTER TABLE [dbo].[UserRole] DROP CONSTRAINT [UQ_UserRole_RoleId]
GO
PRINT N'Dropping constraints from [dbo].[UserRole]'
GO
ALTER TABLE [dbo].[UserRole] DROP CONSTRAINT [UQ_UserRole_Name]
GO
PRINT N'Dropping constraints from [dbo].[User]'
GO
ALTER TABLE [dbo].[User] DROP CONSTRAINT [PK_User]
GO
PRINT N'Dropping constraints from [dbo].[User]'
GO
ALTER TABLE [dbo].[User] DROP CONSTRAINT [UQ_User_UserId]
GO
PRINT N'Dropping constraints from [dbo].[User]'
GO
ALTER TABLE [dbo].[User] DROP CONSTRAINT [UQ_User_Email]
GO
PRINT N'Dropping constraints from [dbo].[User]'
GO
ALTER TABLE [dbo].[User] DROP CONSTRAINT [UQ_User_Phone]
GO
PRINT N'Rebuilding [dbo].[Availability]'
GO
CREATE TABLE [dbo].[RG_Recovery_1_Availability]
(
[AvailabilityId] [tinyint] NOT NULL IDENTITY(1, 1),
[Description] [nvarchar] (20) NOT NULL
)
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_1_Availability] ON
GO
INSERT INTO [dbo].[RG_Recovery_1_Availability]([AvailabilityId], [Description]) SELECT [AvailabilityId], [Description] FROM [dbo].[Availability]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_1_Availability] OFF
GO
DROP TABLE [dbo].[Availability]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_1_Availability]', N'Availability', N'OBJECT'
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
PRINT N'Rebuilding [dbo].[Car]'
GO
CREATE TABLE [dbo].[RG_Recovery_2_Car]
(
[CarId] [int] NOT NULL IDENTITY(1, 1),
[AvailabilityId] [tinyint] NOT NULL,
[ModelId] [smallint] NOT NULL,
[ColorId] [smallint] NOT NULL,
[ClassId] [tinyint] NOT NULL,
[Mileage] [float] NULL,
[RegPlateNo] [nvarchar] (12) NOT NULL,
[YearManufactured] [date] NOT NULL,
[ImgPath] [nvarchar] (max) NULL
)
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_2_Car] ON
GO
INSERT INTO [dbo].[RG_Recovery_2_Car]([CarId], [AvailabilityId], [ModelId], [ColorId], [ClassId], [Mileage], [RegPlateNo], [YearManufactured], [ImgPath]) SELECT [CarId], [AvailabilityId], [ModelId], [ColorId], [ClassId], [Mileage], [RegPlateNo], [YearManufactured], [ImgPath] FROM [dbo].[Car]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_2_Car] OFF
GO
DROP TABLE [dbo].[Car]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_2_Car]', N'Car', N'OBJECT'
GO
PRINT N'Rebuilding [dbo].[Class]'
GO
CREATE TABLE [dbo].[RG_Recovery_3_Class]
(
[ClassId] [tinyint] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (255) NOT NULL,
[Description] [nvarchar] (50) NULL
)
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_3_Class] ON
GO
INSERT INTO [dbo].[RG_Recovery_3_Class]([ClassId], [Name], [Description]) SELECT [ClassId], [Name], [Description] FROM [dbo].[Class]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_3_Class] OFF
GO
DROP TABLE [dbo].[Class]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_3_Class]', N'Class', N'OBJECT'
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
PRINT N'Rebuilding [dbo].[Make]'
GO
CREATE TABLE [dbo].[RG_Recovery_4_Make]
(
[MakeId] [smallint] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (50) NOT NULL
)
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_4_Make] ON
GO
INSERT INTO [dbo].[RG_Recovery_4_Make]([MakeId], [Name]) SELECT [MakeId], [Name] FROM [dbo].[Make]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_4_Make] OFF
GO
DROP TABLE [dbo].[Make]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_4_Make]', N'Make', N'OBJECT'
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
PRINT N'Rebuilding [dbo].[Model]'
GO
CREATE TABLE [dbo].[RG_Recovery_5_Model]
(
[ModelId] [smallint] NOT NULL IDENTITY(1, 1),
[MakeId] [smallint] NOT NULL,
[ModelTypeId] [tinyint] NOT NULL,
[Name] [nvarchar] (20) NOT NULL,
[TransmissionId] [tinyint] NOT NULL
)
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_5_Model] ON
GO
INSERT INTO [dbo].[RG_Recovery_5_Model]([ModelId], [MakeId], [ModelTypeId], [Name], [TransmissionId]) SELECT [ModelId], [MakeId], [ModelTypeId], [Name], [TransmissionId] FROM [dbo].[Model]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_5_Model] OFF
GO
DROP TABLE [dbo].[Model]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_5_Model]', N'Model', N'OBJECT'
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
PRINT N'Rebuilding [dbo].[User]'
GO
CREATE TABLE [dbo].[RG_Recovery_6_User]
(
[UserId] [int] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (70) NOT NULL,
[DOB] [date] NOT NULL,
[Email] [nvarchar] (75) NOT NULL,
[Password] [nvarchar] (24) NOT NULL,
[Phone] [nvarchar] (30) NOT NULL,
[RoleId] [tinyint] NOT NULL,
[NationalityId] [smallint] NOT NULL
)
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_6_User] ON
GO
INSERT INTO [dbo].[RG_Recovery_6_User]([UserId], [Name], [DOB], [Email], [Password], [Phone], [RoleId], [NationalityId]) SELECT [UserId], [Name], [DOB], [Email], [Password], [Phone], [RoleId], [NationalityId] FROM [dbo].[User]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_6_User] OFF
GO
DROP TABLE [dbo].[User]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_6_User]', N'User', N'OBJECT'
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
PRINT N'Rebuilding [dbo].[Rental]'
GO
CREATE TABLE [dbo].[RG_Recovery_7_Rental]
(
[RentalId] [int] NOT NULL IDENTITY(1, 1),
[UserId] [int] NOT NULL,
[CarId] [int] NOT NULL,
[EmployeeId] [int] NOT NULL,
[RentDate] [datetime] NOT NULL,
[ExpectedReturnDate] [datetime] NOT NULL,
[ReturnDate] [datetime] NULL
)
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_7_Rental] ON
GO
INSERT INTO [dbo].[RG_Recovery_7_Rental]([RentalId], [UserId], [CarId], [EmployeeId], [RentDate], [ExpectedReturnDate], [ReturnDate]) SELECT [RentalId], [UserId], [CarId], [EmployeeId], [RentDate], [ExpectedReturnDate], [ReturnDate] FROM [dbo].[Rental]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_7_Rental] OFF
GO
DROP TABLE [dbo].[Rental]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_7_Rental]', N'Rental', N'OBJECT'
GO
PRINT N'Creating primary key [PK_Rental] on [dbo].[Rental]'
GO
ALTER TABLE [dbo].[Rental] ADD CONSTRAINT [PK_Rental] PRIMARY KEY CLUSTERED  ([RentalId])
GO
PRINT N'Adding constraints to [dbo].[Rental]'
GO
ALTER TABLE [dbo].[Rental] ADD CONSTRAINT [UQ_Rental_RentalId] UNIQUE NONCLUSTERED  ([RentalId])
GO
PRINT N'Rebuilding [dbo].[UserRole]'
GO
CREATE TABLE [dbo].[RG_Recovery_8_UserRole]
(
[RoleId] [tinyint] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (15) NOT NULL,
[Description] [nvarchar] (255) NULL
)
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_8_UserRole] ON
GO
INSERT INTO [dbo].[RG_Recovery_8_UserRole]([RoleId], [Name], [Description]) SELECT [RoleId], [Name], [Description] FROM [dbo].[UserRole]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_8_UserRole] OFF
GO
DROP TABLE [dbo].[UserRole]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_8_UserRole]', N'UserRole', N'OBJECT'
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
PRINT N'Rebuilding [dbo].[Color]'
GO
CREATE TABLE [dbo].[RG_Recovery_9_Color]
(
[ColorId] [smallint] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (20) NOT NULL,
[Code] [char] (6) NOT NULL
)
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_9_Color] ON
GO
INSERT INTO [dbo].[RG_Recovery_9_Color]([ColorId], [Name], [Code]) SELECT [ColorId], [Name], [Code] FROM [dbo].[Color]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_9_Color] OFF
GO
DROP TABLE [dbo].[Color]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_9_Color]', N'Color', N'OBJECT'
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
PRINT N'Rebuilding [dbo].[Transmission]'
GO
CREATE TABLE [dbo].[RG_Recovery_10_Transmission]
(
[TransmissionId] [tinyint] NOT NULL IDENTITY(1, 1),
[Type] [nvarchar] (50) NOT NULL,
[Description] [nvarchar] (255) NULL
)
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_10_Transmission] ON
GO
INSERT INTO [dbo].[RG_Recovery_10_Transmission]([TransmissionId], [Type], [Description]) SELECT [TransmissionId], [Type], [Description] FROM [dbo].[Transmission]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_10_Transmission] OFF
GO
DROP TABLE [dbo].[Transmission]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_10_Transmission]', N'Transmission', N'OBJECT'
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
PRINT N'Adding foreign keys to [dbo].[Car]'
GO
ALTER TABLE [dbo].[Car] ADD CONSTRAINT [FK_Car_Availability] FOREIGN KEY ([AvailabilityId]) REFERENCES [dbo].[Availability] ([AvailabilityId])
GO
ALTER TABLE [dbo].[Car] ADD CONSTRAINT [FK_Car_Class] FOREIGN KEY ([ClassId]) REFERENCES [dbo].[Class] ([ClassId])
GO
PRINT N'Adding foreign keys to [dbo].[Model]'
GO
ALTER TABLE [dbo].[Model] ADD CONSTRAINT [FK_Model_Make] FOREIGN KEY ([MakeId]) REFERENCES [dbo].[Make] ([MakeId])
GO
PRINT N'Adding foreign keys to [dbo].[Rental]'
GO
ALTER TABLE [dbo].[Rental] ADD CONSTRAINT [FK_Rental_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[User] ([UserId])
GO
PRINT N'Adding foreign keys to [dbo].[User]'
GO
ALTER TABLE [dbo].[User] ADD CONSTRAINT [FK_User_UserRole] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[UserRole] ([RoleId])
GO
