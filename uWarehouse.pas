unit uWarehouse;

interface
	uses uWarehouseItem;
	
	type
		Warehouse = Object
			contents : array[1..1000] of WarehouseItem;
			size : longint;

			constructor cons(
				c : array of WarehouseItem;
				sz : longint
			);
			procedure tes;
		end;

implementation
	constructor Warehouse.cons(
		c : array of WarehouseItem;
		sz : longint
	);
	begin
		contents := c;
		size := sz;
	end;

	procedure Warehouse.tes;
	begin
	
	end;
end.
