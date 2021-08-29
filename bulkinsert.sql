


BULK INSERT dbo.bulkinsert
FROM 'C:\Users\prahl\Desktop\bulkinsert.txt'
WITH (FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=10,
    MAXERRORS=2);