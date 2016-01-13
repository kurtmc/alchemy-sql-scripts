DECLARE @StartDate datetime
DECLARE @EndDate datetime
SET @StartDate = '2014-04-01'
SET @EndDate   = '2015-03-31'

SELECT person."Name", SUM(sugar.LYVolume)
FROM NAVLIVE.dbo."Alchemy Agencies Ltd$Sugar CRM Staging" as sugar
JOIN NAVLIVE.dbo."Alchemy Agencies Ltd$Customer" as customer
ON sugar."Navision Company Code" = customer.No_
JOIN NAVLIVE.dbo."Alchemy Agencies Ltd$Salesperson_Purchaser" as person
ON customer."Salesperson Code" = person.Code
WHERE CAST(sugar.Date_Loaded_Into_Sugar as datetime) >= CAST(@StartDate as datetime)
AND CAST(sugar.Date_Loaded_Into_Sugar as datetime) <= CAST(@EndDate as datetime)
AND sugar."Row Status" = 'WRITTEN'
GROUP BY person."Name"
