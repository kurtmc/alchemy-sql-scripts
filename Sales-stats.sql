SELECT a."Salesperson Code", b."Name", a."Amount"

FROM 

(
	SELECT a."Salesperson Code", SUM(b."Outstanding Amount") AS "Amount"
	FROM NAVTEST2009R2.dbo."TEST Alchemy Agencies Ltd$Sales Header" AS a
	JOIN NAVTEST2009R2.dbo."TEST Alchemy Agencies Ltd$Sales Line" AS b
		ON a."No_" = b."Document No_"
	WHERE a."Order Date" >= '2014-01-01 00:00:00' and a."Shipment Date" <= '2015-01-01 00:00:00'
	GROUP BY a."Salesperson Code"
) AS a

JOIN NAVTEST2009R2.dbo."TEST Alchemy Agencies Ltd$Salesperson_Purchaser" AS b ON a."Salesperson Code" = b.Code

