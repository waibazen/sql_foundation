

CREATE TABLE tblEmployee
(
 Id int Primary Key,
 Name nvarchar(30),
 Salary int,
 Gender nvarchar(10),
 DepartmentId int
)
--insert data 
--Insert data into tblEmployee table
Insert into tblEmployee values (1,'John', 5000, 'Male', 3)
Insert into tblEmployee values (2,'Mike', 3400, 'Male', 2)

--SQL Script to create tblEmployeeAudit table:
CREATE TABLE tblEmployeeAudit
(
  Id int identity(1,1) primary key,
  AuditData nvarchar(1000)
);
/*When ever, a new Employee is added, we want to capture the ID and the date and time, the new employee is added in tblEmployeeAudit table. The easiest way to achieve this, is by having an AFTER TRIGGER for INSERT event.

Example for AFTER TRIGGER for INSERT event on tblEmployee table:*/


CREATE TRIGGER tr_tblEMployee_ForInsert
ON tblEmployee
FOR INSERT
AS
BEGIN
 Declare @Id int
 Select @Id = Id from inserted
 
 insert into tblEmployeeAudit 
 values('New employee with Id  = ' + Cast(@Id as nvarchar(5)) + ' is added at ' + cast(Getdate() as nvarchar(20)))
END;


select * from tblEmployeeAudit

CREATE TRIGGER tr_tblEMployee_ForDelete
ON tblEmployee
AFTER DELETE
AS
BEGIN
 Declare @Id int
 Select @Id = Id from deleted
 
 insert into tblEmployeeAudit 
 values('An employee with Id  = ' + Cast(@Id as nvarchar(5)) + ' is deleted at ' + cast(Getdate() as nvarchar(20)))
END;

--Create AFTER UPDATE trigger script:
Create trigger tr_tblEmployee_ForUpdate
on tblEmployee
for Update
as
Begin
 Select * from deleted
 Select * from inserted 
End
Update tblEmployee set Name = 'Tods', Salary = 2000, 
Gender = 'Female' where Id  IN (1,2)


select * from tblEmployeeAudit


Alter trigger tr_tblEmployee_ForUpdate
on tblEmployee
for Update
as
Begin
      -- Declare variables to hold old and updated data
      Declare @Id int
      Declare @OldName nvarchar(20), @NewName nvarchar(20)
      Declare @OldSalary int, @NewSalary int
      Declare @OldGender nvarchar(20), @NewGender nvarchar(20)
      Declare @OldDeptId int, @NewDeptId int
     
      -- Variable to build the audit string
      Declare @AuditString nvarchar(1000)
      
      -- Load the updated records into temporary table
      Select *
      into #TempTable
      from inserted
     
      -- Loop thru the records in temp table
      While(Exists(Select Id from #TempTable))
      Begin
            --Initialize the audit string to empty string
            Set @AuditString = ''
           
            -- Select first row data from temp table
            Select Top 1 @Id = Id, @NewName = Name, 
            @NewGender = Gender, @NewSalary = Salary,
            @NewDeptId = DepartmentId
            from #TempTable
           
            -- Select the corresponding row from deleted table
            Select @OldName = Name, @OldGender = Gender, 
            @OldSalary = Salary, @OldDeptId = DepartmentId
            from deleted where Id = @Id
   
     -- Build the audit string dynamically           
            Set @AuditString = 'Employee with Id = ' + Cast(@Id as nvarchar(4)) + ' changed'
            if(@OldName <> @NewName)
                  Set @AuditString = @AuditString + ' NAME from ' + @OldName + ' to ' + @NewName
                 
            if(@OldGender <> @NewGender)
                  Set @AuditString = @AuditString + ' GENDER from ' + @OldGender + ' to ' + @NewGender
                 
            if(@OldSalary <> @NewSalary)
                  Set @AuditString = @AuditString + ' SALARY from ' + Cast(@OldSalary as nvarchar(10))+ ' to ' + Cast(@NewSalary as nvarchar(10))
                  
     if(@OldDeptId <> @NewDeptId)
                  Set @AuditString = @AuditString + ' DepartmentId from ' + Cast(@OldDeptId as nvarchar(10))+ ' to ' + Cast(@NewDeptId as nvarchar(10))
           
            insert into tblEmployeeAudit values(@AuditString)
            
            -- Delete the row from temp table, so we can move to the next row
            Delete from #TempTable where Id = @Id
      End
End


CREATE TABLE tblDepartment
(
 DeptId int Primary Key,
 DeptName nvarchar(20)
)

Insert into tblDepartment values (1,'IT')
Insert into tblDepartment values (2,'Payroll')
Insert into tblDepartment values (3,'HR')
Insert into tblDepartment values (4,'Admin')


Create view vWEmployeeDetails
as
Select Id, Name, Gender, DeptName
from tblEmployee 
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId