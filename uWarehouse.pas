unit uWarehouse;

interface
	uses uWarehouseItem, uClothes, uConfig;
	
	type
		Warehouse = record
			contents : array[1..ARRAY_LIMIT] of WarehouseItem;
			size : longint;
		end;

	function warehouseCons(
		c : array of WarehouseItem;
		sz : longint
	):Warehouse;

	function find(
		name : String;
		colour : String;
		weight : real;
		material : String;
		price_per_kg : real;
		warehouseSource : Warehouse
	):Clothes;


implementation
	function warehouseCons(
		c : array of WarehouseItem;
		sz : longint
	):Warehouse;
	begin
		warehouseCons.contents := c;
		warehouseCons.size := sz;
	end;

	function find(
		name : String;
		colour : String;
		weight : real;
		material : String;
		price_per_kg : real;
		warehouseSource : Warehouse
	):Clothes;
	var i:longint;
	begin
		for i:=1 to (warehouseSource.size) do
		begin
			if ((warehouseSource.contents[i].clothes.name = name)
			and	(warehouseSource.contents[i].clothes.colour = colour)
			and	(warehouseSource.contents[i].clothes.weight = weight)
			and	(warehouseSource.contents[i].clothes.material = material)
			and	(warehouseSource.contents[i].clothes.price_per_kg = price_per_kg)) then
			begin
				find := warehouseSource.contents[i].clothes;
				break;
			end;
		end;
	end;

end.
