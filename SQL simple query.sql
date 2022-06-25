use AdventureWorks2019

select * from HumanResources.Department

--- Show all department names
Select Name from HumanResources.Department

-- show all the groups
select  GroupName from HumanResources.Department

--Show all the GroupName all one time
select Distinct GroupName from HumanResources.Department

-- Show all the groupname how are the part of manufacturing

select Name,GroupName from HumanResources.Department
where GroupName like 'Manufacturing'

-- give me all the employees from employe table

select * from HumanResources.Employee

-- Give me all the employee in the table who organization level equal 2

select * from HumanResources.Employee
where OrganizationLevel =2

-- Give me all the employee in the table who 
--organization level equal 2 or =3

select * from HumanResources.Employee
where OrganizationLevel =2 or OrganizationLevel=3

select * from HumanResources.Employee
where OrganizationLevel in (2,3) 

--Give me list of emloyees have a title Facilities Manager

select * from HumanResources.Employee
where JobTitle like'Facilities Manager'

--Give all employees who have a word "manager" in the title

select * from HumanResources.Employee
where JobTitle like '%Manager'

--give me all employee who born after Jan 1,1981
select * from HumanResources.Employee
where BirthDate > '01/01/1980'

--give me all employees who born Jan 01 1970 and Jan 01 1980
select BirthDate from HumanResources.Employee
where BirthDate between '01/01/1970'and'01/01/1980'


--CALCULATED COLUMN
Select name,ListPrice from Production.Product

Select name,ListPrice, ListPrice+10 as AdjustedListPrice from Production.Product


--INTO

Select name,ListPrice, ListPrice+10 as AdjustedListPrice 
into #tmpname
from Production.Product

select * from #tmpname
--Delete data from table
Delete from #tmpname
where name like 'Bearing Ball'

select * from #tmpname
where name like 'Bearing Ball'

--Update

select * from Production.Product2

Update Production.Product2
 set name='Nigar'
 where name='Blade'

 --Join

 Create table MyEmpoyees(EmployeeID int,FirstName nvarchar(30),LastName nvarchar (30))
 insert into MyEmpoyees Values (1,'Micheal','Scott')
 insert into MyEmpoyees Values (2,'Pam','Beesly')
 insert into MyEmpoyees Values (3,'Nigar','Majidzada')

 select * from MyEmpoyees

 ---Inner join

 Create table MySalary( EmployeeID int,Salary float)

insert into MySalary Values (1,1000)
insert into MySalary Values (2,2000)
insert into MySalary Values (3,3000)

select * from MySalary
select * from MyEmpoyees

select * from MyEmpoyees A
inner join MySalary B on 
A.EmployeeID=B.EmployeeID

--Left outer join

select * from MyEmpoyees A
left join MySalary B
on A.EmployeeID=B.EmployeeID

select * from MyEmpoyees A
right join MySalary   B on 
A.EmployeeID=B.EmployeeID


--Left join

create table MyPhone (EmployeeID int, Phone int)

insert into MyPhone Values (1,551234567)
insert into MyPhone Values (2,551244567)
insert into MyPhone Values (3,551235567)

select * from MyEmpoyees A
left join MyPhone B
on A.EmployeeID=B.EmployeeID

--Right Join 

Create  table MyParking (EmployeeId int,ParkingSpot nvarchar (20))
Insert Into MyParking Values (1,'A1')
Insert Into MyParking Values (2,'A2')
Insert Into MyParking Values (3,'A3')

select * from MyParking A
right Join MyEmpoyees B
on A.EmployeeId=B.EmployeeID

--Full join
Create table MyCustomer (CustomerID int,CustomerName Nvarchar(20))
Truncate table MyCustomer
insert into MyCustomer Values (1,'Nigar')
insert into MyCustomer Values (3,'Majidzada')

select * from MyCustomer

create table MyOrder(OrderNumber int,OrderName nvarchar (20),CustomerID int)
insert into MyOrder Values (1,'SomeOrder1',1)
insert into MyOrder Values (2,'SomeOrder2',2)
insert into MyOrder Values (3,'SomeOrder3',3)
insert into MyOrder Values (4,'SomeOrder4',4)
 
 select * from MyOrder

 select * from MyOrder A
 full join  MyCustomer B
 on A.CustomerID=B.CustomerID

 ---Cross join
 select * from MyCustomer
 cross join MySalary


 select * from MyCustomer,MySalary,MyOrder
 
 ---Date
 Select GETDATE()-2

 ---DatePart
 select DATEPART(YYYY,GETDATE()) as YearNumber
 select Datepart(MM,Getdate()) As MonthNumber
 select Datepart(DD,Getdate()) As DayNumber

 ---Dateadd

 select DATEADD(day,4,GETDATE())
 select DATEADD(day,4,'25/06/2022')

 select DATEADD(MONTH,4,GETDATE())
 select DATEADD(YEAR,4,GETDATE())

   ---
select top 10 * from Production.WorkOrder

select WorkOrderID,ProductID,StartDate,EndDate,
DATEDIFF(day,StartDate,EndDate) As Days
from Production.WorkOrder

select DATEADD(dd,- DATEPART(day,Getdate()-1 ),GETDATE())

--MSALARY
--AGGREGATE FUNCTION 
SELECT AVG(salary) FROM MySalary
select MAX(salary) from MySalary
select MIN(salary) from MySalary
select SUM(salary) from MySalary
select COUNT(salary) from MySalary

--MYORDER
SELECT * FROM MyOrder

--CONCAT
print concat('String1','String2')

select OrderNumber,OrderName,Concat(OrderName,' ',Rand())as A
from MyOrder

--left 
select OrderNumber,OrderName,LEFT(OrderName,4) As Left4 from MyOrder
select OrderNumber,OrderName,Right(OrderName,1) As Right1 from MyOrder

--substring
select OrderName,OrderNumber,SUBSTRING(OrderName,2,5) as B 
from MyOrder
---Lowercase
select OrderName,LOWER(OrderName) as Lowercase from MyOrder
select OrderName,Upper(OrderName) as Uppercase from MyOrder

--lenght
select *,len(OrderName) as Lenght from MyOrder
select OrderName,OrderNumber,
Concat(Upper(left(OrderName,1)), 
lower(SUBSTRING(OrderName,2,Len(OrderName))))
from MyOrder

--Trim
Select ' Text ' as A
Select len('  Text  ') as A
Select ltrim('  Text  ') as A
Select rtrim('  Text  ') as A
Select ltrim(rtrim('  Text  ')) as A