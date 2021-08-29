CREATE TABLE Rooms(
		RoomID INT IDENTITY(1,1) NOT NULL,
		RoomNumber CHAR(3) NOT NULL,
		BedType VARCHAR(10) NOT NULL,
		Rate smallmoney NOT NULL
		);
