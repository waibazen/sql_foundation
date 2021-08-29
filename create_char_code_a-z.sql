/****** Script for SelectTopNRows command from SSMS  ******/
select ASCII('A')
select char(65)
--creating char by utilizing ASCII CODE 
DECLARE @start INT
set @start=65
while @start<=90
begin
print CHAR(@start)
set @start+=1
END

