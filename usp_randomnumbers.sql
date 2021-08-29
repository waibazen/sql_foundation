CREATE OR ALTER PROCEDURE dbo.uspPopulate_Employees @run INT
AS 
DECLARE @FirstName varchar(100)
DECLARE @LastName varchar(100)
DECLARE @Country varchar (100)

DECLARE @Dig varchar(20)
DECLARE @Rand Numeric(16,16)

WHILE @run>0

BEGIN 
SELECT @Rand=RAND()--GENERATES RANDOM NUMBER
SET @Dig=@Rand
SET @FirstName=(SELECT SUBSTRING(@Dig,3,4))
SET @LastName=(SELECT SUBSTRING(@Dig,6,5))
SET @Country=(SELECT SUBSTRING(@Dig,4,8))


INSERT INTO dbo.Employee1(FirstName,LastName,Country)
VALUES(@FirstName,@LastName,@Country)

SET @run=@run-1

END;

EXEC dbo.uspPopulate_Employees 10;





