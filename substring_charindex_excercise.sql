/****** Script for SelectTopNRows command from SSMS  ******/


  select SUBSTRING(
  Name,

  CHARINDEX('(',Name)+1 ,
  

  
  CHARINDEX(')',Name)-CHARINDEX('(',Name)-1
  )as Office

  FROM dbo.Landon_Employees
  where EmployeeID=1
