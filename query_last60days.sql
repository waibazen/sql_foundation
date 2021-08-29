/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [id]
      ,[title]
      ,[lastdate]
      ,[prevdate]
  FROM [training].[dbo].[projects1]



 --finding top 2 "recent "visitors in our nephrology unit in the last 60 days 
 Select top (2) *
From (select title, lastdate
from dbo.projects1
where lastdate between 
dateadd(day ,-60,getdate()) 
and 
getdate())t
order by t.lastdate desc---using desc date order 

