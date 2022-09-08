/*
Project 1: Excelsior Mobile Report
Everly Ho
*/


-- 1 -- VISUALIZATION
-- A Show us the first and last names of our customers along with their
--minute usage, data usage, text usage and total bill. Order them by their full name.
USE EM_Proj1;
SELECT CONCAT(FirstName,' ',LastName) as [User Name], Minutes as [Minute Usage], 
	DatainMB as [Data Usage], Texts as [Text Usage], Total as [Total Bill]
FROM Subscriber
Join LastMonthUsage 
	on Subscriber.Min=LastMonthUsage.MIN
Join Bill 
	on LastMonthUsage.MIN=Bill.Min
Order By [User Name];

-- B Show us the average of the minutes, data, texts and total bills by city.
SELECT Sub.City, Avg(Minutes) as AvgMinute, Avg(DatainMB) as AvgData, Avg(Texts) as AvgText, Avg(Total) as AvgTotal
FROM Subscriber as Sub
Join LastMonthUsage as LMU
	on Sub.Min=LMU.MIN
Join Bill as B
	on LMU.MIN=B.Min
GROUP BY Sub.City
Order By Sub.City;

-- C Show us the sum of the minutes, data, texts and total bills by city.
SELECT Sub.City, Sum(Minutes) as [Total Minute], Sum(DatainMB) as [Total Data], Sum(Texts) as [Total Texts], Sum(Total) as [Total Bill]
FROM Subscriber as Sub
Join LastMonthUsage as LMU
	on Sub.Min=LMU.MIN
Join Bill as B
	on LMU.MIN=B.Min
GROUP BY Sub.City
Order By Sub.City;

-- D Show us the average of the minutes, data, texts and total bills by mobile plan.
SELECT Sub.PlanName, Avg(Minutes) as AvgMinute, Avg(DatainMB) as AvgData, Avg(Texts) as AvgText, Avg(Total) as AvgTotal
FROM Subscriber as Sub
Join LastMonthUsage as LMU
	on Sub.Min=LMU.MIN
Join Bill as B
	on LMU.MIN=B.Min
GROUP BY Sub.PlanName
Order By Sub.PlanName;

-- E Show us the sum of the minutes, data, texts and total bills by mobile plan.
SELECT Sub.PlanName, Sum(Minutes) as [Total Minute], Sum(DatainMB) as [Total Data], Sum(Texts) as [Total Texts], Sum(Total) as [Total Bill]
FROM Subscriber as Sub
Join LastMonthUsage as LMU
	on Sub.Min=LMU.MIN
Join Bill as B
	on LMU.MIN=B.Min
GROUP BY Sub.PlanName
Order By Sub.PlanName;


-- WITHOUT VISUALIZATION

-- 1 --
/*We have decided that we want to put our efforts increasing our customer
base in cities we currently have customers in instead of marketing in cities 
we have no customers in. Let's figure out which three cities we should point our markets to. */

-- A First though, I want to know which two cities we have the most customers in.
SELECT City, Count(City) as [Number of Customers]
FROM Subscriber
Group by city
Order by [Number of Customers] desc;

--B Cities we should increase our marketing in.
SELECT City, Count(City) as [Number of Customers]
FROM Subscriber
Group by city
Order by [Number of Customers];

-- C Finally, show us which plans we should market the most based on the number of people who have them
SELECT PlanName, Count(PlanName) as [Number of customers in each Plans]
FROM Subscriber
Group by PlanName
Order by [Number of customers in each Plans];

--2 --  
-- Some information on the actual devices our customers use.
-- A  Show us the count of cell phone types among our customers. What type do most of our customers use
SELECT Type, Count(Type) as [Cell phone types]
FROM Device
Group by Type;


--B Show us which customers (first and last name) use the phone type that is least used by our customers
-- so we can send them a promotion for their friends and family.
SELECT S.FirstName, LastName
FROM Subscriber as S
Join DirNums as DN
ON S.MDN = DN.MDN
Join Device as D
On D.IMEI = DN.IMEI
Where D.Type ='Apple'
Group by S.FirstName, LastName;

-- C Finally, show us our customers and the year of their phones who have phones released before 2018?
SELECT S.FirstName, LastName, D.YearReleased
FROM Subscriber as S
Join DirNums as DN
ON S.MDN = DN.MDN
Join Device as D
On D.IMEI = DN.IMEI
Where D.YearReleased < 2018
Group by S.FirstName, LastName, D.YearReleased
Order by D.yearReleased;

-- 3 --
/* We want to know ultimately if there is a city that uses a lot of data 
(within the top 3 data using cities) but none of our customers in that city are using the Unlimited Plans. 
If there is a city like that, which one is it?*/

SELECT Top 3 S.City as [Data Most Used City], SUM(LMU.DataInMB) as DataUsed
FROM Subscriber as S
JOIn LastMonthUsage as LMU
On S.Min = LMU.MIN
JOIN MPlan as MP
ON MP.PlanName =S.PlanName
GROUP BY S.City
Order BY DataUsed DESC;

SELECT Top 1 S.City as [City W/o Unlimited Plan], SUM(LMU.DataInMB) as DataUsed
FROM Subscriber as S
JOIn LastMonthUsage as LMU
On S.Min = LMU.MIN
JOIN MPlan as MP
ON MP.PlanName =S.PlanName
And MP.Data != 'Unlimited'
Group by S.City;


-- 4 --
-- A  They wish to know the first and last name of the customer who has the most expensive bill every month.
SELECT concat(S.FirstName,' ',LastName) as CustomerName, Total as [Monthly Plan]
FROM Subscriber as S
JOIN Bill as B
ON S.MIN = B.MIN
Where Total =
	(SELECT Max(Total)
	FROM Bill)
Group by concat(S.FirstName,' ',LastName),Total;

--B They also want to know which mobile plan brings us in the most revenue each month.
SELECT S.PlanName, sum(B.Total) as Revenues
FROM Subscriber as S
JOIN Bill as B
ON S.MIN = B.MIN
Group BY S.PlanName
order by Revenues desc;


-- 5 --
-- A   Please tell us which area code uses the most minutes.
SELECT ZipCode, LMU.Minutes
FROM Subscriber as S
JOIN LastMonthUsage as LMU
On S.MIN = LMU.MIN
WHERE Minutes =
	(Select Max(Minutes)
	FROM LastMonthUsage)
GROUP By Zipcode, Minutes;

--B which cities have the biggest difference between the customers who use smallest
--amount of minutes to customers that use the largest. Use the difference of customers
--who use less than 200 and customers who use more than 700 minutes.

SELECT Max(minutes) - min(minutes) as [Difference In Usage], S.City
FROM Subscriber as S
JOIN LastMonthUsage as LMU
on S.MIN = LMU.MIN
Where Minutes not between 200 and 700
GROUP BY S.City
ORDER BY [Difference In Usage] DESC;