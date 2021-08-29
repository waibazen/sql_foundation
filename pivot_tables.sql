
CREATE TABLE Students
(
	Id INT PRIMARY KEY IDENTITY,
	StudentName VARCHAR (50),
	Course VARCHAR (50),
	Score INT
)
GO

INSERT INTO Students VALUES ('Sally', 'English', 95 )
INSERT INTO Students VALUES ('Sally', 'History', 82)
INSERT INTO Students VALUES ('Edward', 'English', 45)
INSERT INTO Students VALUES ('Edward', 'History', 78)

SELECT *FROM Students

SELECT * FROM
 
(SELECT 
	StudentName,
	Score,
	Course
FROM 
	Students
)
AS StudentTable
PIVOT(
	SUM(Score)
	FOR Course IN ([English],[History])
) AS SchoolPivot