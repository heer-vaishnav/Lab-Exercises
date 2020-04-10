SET STATISTICS TIME OFF
GO

CREATE NONCLUSTERED COLUMNSTORE INDEX NCI_FactProductInventory_UnitCost_UnitsOut ON FactProductInventory
(
	ProductKey,
	DateKey,
	UnitCost,
	UnitsOut
)
GO
