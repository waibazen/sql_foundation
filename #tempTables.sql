CREATE TABLE ##GlobalTemp
(
 UserID int,
 Name varchar(50), 
 Address varchar(150)
)
GO

insert into ##GlobalTemp values ( 1, 'Shailendra','Noida');
GO
Select * from ##GlobalTemp