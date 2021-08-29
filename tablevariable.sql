declare @Stock table
    (
        StockId     int     NOT NULL
    ,   FieldId     int     NOT NULL
    ,   StockDate   date    NOT NULL
    ,   StockValue  float   NULL
    ,   INDEX IX_Priyanka NONCLUSTERED(StockId, FieldId, StockDate desc) 
    )      
	insert into @Stock values(1,100,'12-12-2021',350.00)
	select * from @stock

