--  Drop Foreign Key Constraints 
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Car_Availability]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE [Car] DROP CONSTRAINT [FK_Car_Availability];

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Car_Color]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE [Car] DROP CONSTRAINT [FK_Car_Color];

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Car_Model]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE [Car] DROP CONSTRAINT [FK_Car_Model];

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Model_Class]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE [Model] DROP CONSTRAINT [FK_Model_Class];

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Model_Make]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE [Model] DROP CONSTRAINT [FK_Model_Make];

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Model_Transmission]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE [Model] DROP CONSTRAINT [FK_Model_Transmission];

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Rental_Car]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE [Rental] DROP CONSTRAINT [FK_Rental_Car];

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Rental_User]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE [Rental] DROP CONSTRAINT [FK_Rental_User];

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_Rental_Employee]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE [Rental] DROP CONSTRAINT [FK_Rental_Employee];

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_User_UserRole]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1)
ALTER TABLE [User] DROP CONSTRAINT [FK_User_UserRole];


--  Drop Tables, Stored Procedures and Views 

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Availability]') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE [Availability];

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Car]') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE [Car];

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Class]') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE [Class];

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Color]') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE [Color];

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Make]') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE [Make];

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Model]') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE [Model];

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Rental]') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE [Rental];

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[Transmission]') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE [Transmission];

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[User]') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE [User];

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[UserRole]') AND  OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE [UserRole];


--  Create Tables 
CREATE TABLE [Availability] ( 
	[AvailabilityId] tinyint identity(1,1)  NOT NULL,
	[Description] nvarchar(20) NOT NULL
);

CREATE TABLE [Car] ( 
	[CarId] int identity(1,1)  NOT NULL,
	[AvailabilityId] tinyint NOT NULL,
	[ModelId] smallint NOT NULL,
	[ColorId] smallint NOT NULL,
	[Mileage] float,
	[RegPlateNo] nvarchar(12) NOT NULL,
	[YearManufactured] date NOT NULL,
	[ImgPath] nvarchar(max)
);

CREATE TABLE [Class] ( 
	[ClassId] tinyint identity(1,1)  NOT NULL,
	[Name] nvarchar(50) NOT NULL,
	[Description] nvarchar(255)
);

CREATE TABLE [Color] ( 
	[ColorId] smallint identity(1,1)  NOT NULL,
	[Name] nvarchar(50) NOT NULL,
	[Code] char(7) NOT NULL
);

CREATE TABLE [Make] ( 
	[MakeId] smallint identity(1,1)  NOT NULL,
	[Name] nvarchar(50) NOT NULL
);

CREATE TABLE [Model] ( 
	[ModelId] smallint identity(1,1)  NOT NULL,
	[MakeId] smallint NOT NULL,
	[ClassId] tinyint NOT NULL,
	[Name] nvarchar(50) NOT NULL,
	[TransmissionId] tinyint NOT NULL
);

CREATE TABLE [Rental] ( 
	[RentalId] int identity(1,1)  NOT NULL,
	[UserId] int NOT NULL,
	[CarId] int NOT NULL,
	[EmployeeId] int NOT NULL,
	[RentDate] datetime NOT NULL,
	[ExpectedReturnDate] datetime NOT NULL,
	[ReturnDate] datetime
);

CREATE TABLE [Transmission] ( 
	[TransmissionId] tinyint identity(1,1)  NOT NULL,
	[Type] nvarchar(50) NOT NULL,
	[Description] nvarchar(255)
);

CREATE TABLE [User] ( 
	[UserId] int identity(1,1)  NOT NULL,
	[Name] nvarchar(70) NOT NULL,
	[DOB] date NOT NULL,
	[Email] nvarchar(75) NOT NULL,
	[Password] nvarchar(24) NOT NULL,
	[Phone] nvarchar(30) NOT NULL,
	[RoleId] tinyint NOT NULL
);

CREATE TABLE [UserRole] ( 
	[RoleId] tinyint identity(1,1)  NOT NULL,
	[Name] nvarchar(15) NOT NULL,
	[Description] nvarchar(255)
);


--  Create Indexes 
ALTER TABLE [Availability]
	ADD CONSTRAINT [UQ_Availability_AvailabilityId] UNIQUE ([AvailabilityId]);

ALTER TABLE [Availability]
	ADD CONSTRAINT [UQ_Availability_Description] UNIQUE ([Description]);

ALTER TABLE [Car]
	ADD CONSTRAINT [UQ_Car_CarId] UNIQUE ([CarId]);

ALTER TABLE [Car]
	ADD CONSTRAINT [UQ_Car_RegPlateNo] UNIQUE ([RegPlateNo]);

ALTER TABLE [Class]
	ADD CONSTRAINT [UQ_Class_ClassId] UNIQUE ([ClassId]);

ALTER TABLE [Class]
	ADD CONSTRAINT [UQ_Class_Name] UNIQUE ([Name]);

ALTER TABLE [Color]
	ADD CONSTRAINT [UQ_Color_Code] UNIQUE ([Code]);

ALTER TABLE [Color]
	ADD CONSTRAINT [UQ_Color_ColorId] UNIQUE ([ColorId]);

ALTER TABLE [Color]
	ADD CONSTRAINT [UQ_Color_Name] UNIQUE ([Name]);

ALTER TABLE [Make]
	ADD CONSTRAINT [UQ_Make_MakeId] UNIQUE ([MakeId]);

ALTER TABLE [Make]
	ADD CONSTRAINT [UQ_Make_Name] UNIQUE ([Name]);

ALTER TABLE [Model]
	ADD CONSTRAINT [UQ_Model_ModelId] UNIQUE ([ModelId]);

ALTER TABLE [Model]
	ADD CONSTRAINT [UQ_Model_Name] UNIQUE ([Name]);

ALTER TABLE [Rental]
	ADD CONSTRAINT [UQ_Rental_RentalId] UNIQUE ([RentalId]);

ALTER TABLE [Transmission]
	ADD CONSTRAINT [UQ_Transmission_TransmissionId] UNIQUE ([TransmissionId]);

ALTER TABLE [Transmission]
	ADD CONSTRAINT [UQ_Transmission_Type] UNIQUE ([Type]);

ALTER TABLE [User]
	ADD CONSTRAINT [UQ_User_Email] UNIQUE ([DOB]);

ALTER TABLE [User]
	ADD CONSTRAINT [UQ_User_Phone] UNIQUE ([Phone]);

ALTER TABLE [User]
	ADD CONSTRAINT [UQ_User_UserId] UNIQUE ([UserId]);

ALTER TABLE [UserRole]
	ADD CONSTRAINT [UQ_UserRole_Name] UNIQUE ([Name]);

ALTER TABLE [UserRole]
	ADD CONSTRAINT [UQ_UserRole_RoleId] UNIQUE ([RoleId]);

--  Create Primary Key Constraints 
ALTER TABLE [Availability] ADD CONSTRAINT [PK_Availability] 
	PRIMARY KEY CLUSTERED ([AvailabilityId]);

ALTER TABLE [Car] ADD CONSTRAINT [PK_Car] 
	PRIMARY KEY CLUSTERED ([CarId]);

ALTER TABLE [Class] ADD CONSTRAINT [PK_Class] 
	PRIMARY KEY CLUSTERED ([ClassId]);

ALTER TABLE [Color] ADD CONSTRAINT [PK_Color] 
	PRIMARY KEY CLUSTERED ([ColorId]);

ALTER TABLE [Make] ADD CONSTRAINT [PK_Make] 
	PRIMARY KEY CLUSTERED ([MakeId]);

ALTER TABLE [Model] ADD CONSTRAINT [PK_Model] 
	PRIMARY KEY CLUSTERED ([ModelId]);

ALTER TABLE [Rental] ADD CONSTRAINT [PK_Rental] 
	PRIMARY KEY CLUSTERED ([RentalId]);

ALTER TABLE [Transmission] ADD CONSTRAINT [PK_Transmission] 
	PRIMARY KEY CLUSTERED ([TransmissionId]);

ALTER TABLE [User] ADD CONSTRAINT [PK_User] 
	PRIMARY KEY CLUSTERED ([UserId]);

ALTER TABLE [UserRole] ADD CONSTRAINT [PK_UserRole] 
	PRIMARY KEY CLUSTERED ([RoleId]);



--  Create Foreign Key Constraints 
ALTER TABLE [Car] ADD CONSTRAINT [FK_Car_Availability] 
	FOREIGN KEY ([AvailabilityId]) REFERENCES [Availability] ([AvailabilityId]);

ALTER TABLE [Car] ADD CONSTRAINT [FK_Car_Color] 
	FOREIGN KEY ([ColorId]) REFERENCES [Color] ([ColorId]);

ALTER TABLE [Car] ADD CONSTRAINT [FK_Car_Model] 
	FOREIGN KEY ([ModelId]) REFERENCES [Model] ([ModelId]);

ALTER TABLE [Model] ADD CONSTRAINT [FK_Model_Class] 
	FOREIGN KEY ([ClassId]) REFERENCES [Class] ([ClassId]);

ALTER TABLE [Model] ADD CONSTRAINT [FK_Model_Make] 
	FOREIGN KEY ([MakeId]) REFERENCES [Make] ([MakeId]);

ALTER TABLE [Model] ADD CONSTRAINT [FK_Model_Transmission] 
	FOREIGN KEY ([TransmissionId]) REFERENCES [Transmission] ([TransmissionId]);

ALTER TABLE [Rental] ADD CONSTRAINT [FK_Rental_Car] 
	FOREIGN KEY ([CarId]) REFERENCES [Car] ([CarId]);

ALTER TABLE [Rental] ADD CONSTRAINT [FK_Rental_Employee] 
	FOREIGN KEY ([EmployeeId]) REFERENCES [User] ([UserId]);

ALTER TABLE [Rental] ADD CONSTRAINT [FK_Rental_User] 
	FOREIGN KEY ([UserId]) REFERENCES [User] ([UserId]);

ALTER TABLE [User] ADD CONSTRAINT [FK_User_UserRole] 
	FOREIGN KEY ([RoleId]) REFERENCES [UserRole] ([RoleId]);
