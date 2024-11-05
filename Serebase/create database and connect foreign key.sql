--Create 'User' table with unique ID starting from 1000, and columns for first name, last name and date of borth

CREATE TABLE Users (
	userid INT PRIMARY KEY IDENTITY(1000,1),	-- Auto incrementing priamry key starting from 1000
	firstname VARCHAR (50),						-- First name of the user
	lastname VARCHAR (50),						-- Last name of the user
	date_of_birth DATE							-- Date of the birth of the users
);

--
CREATE TABLE Genders (
	gid INT PRIMARY KEY IDENTITY (300, 1),		-- Auto incrementing priamry key starting from 1000
	gender VARCHAR (6)							-- Gender value
);

CREATE TABLE Departments (
	deptid INT PRIMARY KEY IDENTITY(10,1),		-- Auto incrementing priamry key starting from 10
	dept VARCHAR (50)							-- Name of department
);

CREATE TABLE Username (
	userid INT PRIMARY KEY, 			-- Primary key linked to 'Users' table
	username VARCHAR (50) NOT NULL UNIQUE		-- Username, unique for each user
);

CREATE TABLE KadPengenalan (
	userid INT PRIMARY KEY,						-- Primary key linked to 'Users' table
	nom_kp VARCHAR (50) NOT NULL UNIQUE			-- Username, unique for each user
);


--Add foreign key columns to 'Users' to reference gender and department
ALTER TABLE Users
ADD gender_id INT,								--Foreign key referencing 'Genders' table
	deptid INT;									--Foreign key referencing 'Department' table

--Set up foreign key relationship between 'Users' and 'Gender'
ALTER TABLE Users
ADD CONSTRAINT FK_Users_Genders
FOREIGN KEY (gender_id) REFERENCES Genders (gid); --Links 'gender_id' in 'Users' to 'gid' in 'Genders'

-- Set up foreign key relationship between 'Users' and 'Department'
ALTER TABLE Users
ADD CONSTRAINT FK_Users_Departments
FOREIGN KEY (deptid) REFERENCES Departments (deptid);

-- Set up foreign key relationship between 'Username' and 'Users'
ALTER TABLE Username
ADD CONSTRAINT FK_Username_Users
FOREIGN KEY (userid) REFERENCES Users(userid)  -- Links 'userid' in 'Username' to 'userid' in 'Users'
ON DELETE CASCADE;                             -- Cascade delete, removes 'Username' when corresponding 'User' is deleted

-- Set up foreign key relationship between 'KadPengenalan' and 'Users'
ALTER TABLE KadPengenalan
ADD CONSTRAINT FK_KadPengenalan
FOREIGN KEY (userid) REFERENCES Users(userid)  -- Links 'userid' in 'KadPengenalan' to 'userid' in 'Users'
ON DELETE CASCADE;