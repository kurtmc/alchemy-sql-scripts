DECLARE @StartDate Date
DECLARE @EndDate Date
SET @StartDate = '2014-04-01 00:00:00'
SET @EndDate   = '2015-03-31 00:00:00'


SELECT b.Code, b."Name", a."Amount"
FROM (

	SELECT a."Salesperson Code", SUM(a."Amount") AS "Amount"
	FROM
	(
		SELECT a."Salesperson Code", b."Amount", a."Order Date"
		FROM NAVLIVE.dbo."Alchemy Agencies Ltd$Sales Invoice Header" AS a
		JOIN NAVLIVE.dbo."Alchemy Agencies Ltd$Sales Invoice Line" AS b
		ON a."No_" = b."Document No_"
	) AS a
	WHERE a."Order Date" >= @StartDate and a."Order Date" <= @EndDate
	GROUP BY "Salesperson Code"
) AS a
JOIN NAVLIVE.dbo."Alchemy Agencies Ltd$Salesperson_Purchaser" AS b
ON a."Salesperson Code" = b.Code
