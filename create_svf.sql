
--TEMPERATURE FUNCTION SV

CREATE OR ALTER FUNCTION Warehouse.Temperaturelike(@Temperature decimal(5,2))
RETURNS char(10)
AS
BEGIN
    DECLARE @Output_temp char(10);
    SET @Output_temp =
        CASE WHEN @Temperature <3.5 THEN 'Too Cold'
            WHEN @Temperature >4 THEN 'Too Hot'
			WHEN (@Temperature>=3.5 AND @Temperature<=4) THEN 'OK'
           
        END;
    RETURN @Output_temp;
END;
GO;

SELECT Warehouse.Temperaturelike(Temperature) as TemperatureSeverity,Temperature from Warehouse.ColdRoomTemperatures
WHERE  Warehouse.Temperaturelike(Temperature)='OK';
GO;
