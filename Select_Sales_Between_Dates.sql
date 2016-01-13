DECLARE @StartDate Date
DECLARE @EndDate Date
SET @StartDate = '2014-04-01'
SET @EndDate   = '2015-03-31'


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
	WHERE (CAST(a."Order Date" AS date) >= CAST(@StartDate AS date)) AND (CAST(a."Order Date" AS date) <= CAST(@EndDate AS date))
	GROUP BY "Salesperson Code"
) AS a
JOIN NAVLIVE.dbo."Alchemy Agencies Ltd$Salesperson_Purchaser" AS b
ON a."Salesperson Code" = b.Code
ORDER BY b.Code

