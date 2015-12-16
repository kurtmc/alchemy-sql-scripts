SELECT a."Salesperson Code", c."Name", SUM(b."Outstanding Amount")
FROM NAVTEST2009R2.dbo."TEST Alchemy Agencies Ltd$Sales Header" AS a
JOIN NAVTEST2009R2.dbo."TEST Alchemy Agencies Ltd$Sales Line" AS b ON a."No_" = b."Document No_"
JOIN NAVTEST2009R2.dbo."TEST Alchemy Agencies Ltd$Salesperson_Purchaser" AS c ON a."Salesperson Code" = c.Code
WHERE a."Order Date" >= '2014-01-01 00:00:00' and a."Shipment Date" <= '2015-01-01 00:00:00'
GROUP BY a."Salesperson Code", c."Name"