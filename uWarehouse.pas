unit uWarehouse;

interface
	uses uWarehouseItem;
	
	type
		Warehouse = Object
			contents : array[1..1000] of WarehouseItem;

			constructor cons(
				c : array of WarehouseItem
			);
			procedure tes;
		end;

implementation
	constructor Warehouse.cons(
		c : array of WarehouseItem
	);
	begin
		contents := c;
	end;

	procedure Warehouse.tes;
	begin
	
	end;
end.
