SELECT "Entry No_", "Item No_", "Posting Date", "Entry Type", "Source No_", "Document No_", Description, "Location Code", Quantity, "Remaining Quantity", "Invoiced Quantity", "Applies-to Entry", "Open", "Global Dimension 1 Code", "Global Dimension 2 Code", Positive, "Source Type", "Drop Shipment", "Transaction Type", "Transport Method", "Country Code", "Entry_Exit Point", "Document Date", "External Document No_", Area, "Transaction Specification", "No_ Series", "Prod_ Order No_", "Variant Code", "Qty_ per Unit of Measure", "Unit of Measure Code", "Derived from Blanket Order", "Cross-Reference No_", "Originally Ordered No_", "Originally Ordered Var_ Code", "Out-of-Stock Substitution", "Item Category Code", Nonstock, "Purchasing Code", "Product Group Code", "Transfer Order No_", "Completely Invoiced", "Last Invoice Date", "Applied Entry to Adjust", Correction, "Prod_ Order Line No_", "Prod_ Order Comp_ Line No_", "Service Order No_", "Serial No_", "Lot No_", "Warranty Date", "Expiration Date", "Return Reason Code", "Original Expiration Date", "Original Exp_ Date Changed By", "Original Exp_ Date Changed On", "Prev_ Expiration Date", "Prev_ Exp_ Date Changed By", "Prev_ Exp_ Date Changed On", "Expiration Date Changed"
FROM NAVLIVE.dbo."Alchemy Agencies Ltd$Item Ledger Entry"
WHERE "Item No_" IN (
	SELECT No_
	FROM NAVLIVE.dbo."Alchemy Agencies Ltd$Item"
	WHERE "Vendor No_" = 'COVESTRO HK'
)
AND "Entry Type" = 0 -- Entry type: Purchase
AND "Posting Date" >= '2015-04-01' AND "Posting Date" <= '2015-12-31'
