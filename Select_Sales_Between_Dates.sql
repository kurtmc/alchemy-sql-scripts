DECLARE @StartDate Date
DECLARE @EndDate Date
SET @StartDate = '2014-04-01 00:00:00'
SET @EndDate   = '2015-03-31 00:00:00'

SELECT a."Salesperson Code", b."Name", a."Amount"

FROM 

(
	SELECT a."Salesperson Code", SUM(a."Outstanding Amount") AS "Amount"
	FROM
	(
		SELECT a."Salesperson Code", b."Outstanding Amount", a."Order Date"
		FROM NAVLIVE.dbo."Alchemy Agencies Ltd$Sales Header" AS a
		JOIN NAVLIVE.dbo."Alchemy Agencies Ltd$Sales Line" AS b
		ON a."No_" = b."Document No_"
		UNION ALL
		SELECT a."Salesperson Code", b."Outstanding Amount", a."Order Date"
		FROM NAVLIVE.dbo."Alchemy Agencies Ltd$Sales Header Archive" AS a
		JOIN NAVLIVE.dbo."Alchemy Agencies Ltd$Sales Line Archive" AS b
		ON a."No_" = b."Document No_"
	) AS a
	WHERE a."Order Date" >= @StartDate and a."Order Date" <= @EndDate
	GROUP BY "Salesperson Code"
) AS a

JOIN NAVLIVE.dbo."Alchemy Agencies Ltd$Salesperson_Purchaser" AS b ON a."Salesperson Code" = b.Code