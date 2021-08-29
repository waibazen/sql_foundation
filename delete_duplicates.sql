/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [ID]
      ,[FirstName]
      ,[LastName]
      ,[Country]
  FROM [training].[dbo].[Employee1]
  ;

  --removing duplicate records but keeping one
  with cte as(
  select *, ROW_NUMBER() over (partition by FirstName,LastName,Country order by FirstName,LastName,Country)as rn
  from dbo.Employee1
  )
Delete from cte where cte.rn>1;
 select *from dbo.Employee1;

 --rmv allduplicate records--no original
 --removing duplicate records but keeping one
  with result as(
  select *, r=Rank() over ( order by FirstName,LastName,Country)
  from dbo.Employee1
  )
  Delete result
  WHERE r in (select r from result group by r having count(*)>1);


 select top (2)* from dbo.Employee1 order by id desc ;