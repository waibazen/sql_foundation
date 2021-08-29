/****** Script for SelectTopNRows command from SSMS  ****/
SELECT TOP (1000) [VehicleTemperatureID]
      
      ,[Temperature] AS Celcius
	  ,Warehouse.ToFarenhite(Temperature)as Farenhite
      
  FROM [WideWorldImporters].[Warehouse].[VehicleTemperatures]
---creating scalar valued function
CREATE FUNCTION Warehouse.ToFarenhite(@celcius decimal(10,2))
RETURNS decimal (10,2)
AS
BEGIN
	DECLARE @Farenhite decimal(10,2);
	set @Farenhite =(@celcius* 1.8+32);
	RETURN @Farenhite
END;

SELECT 
