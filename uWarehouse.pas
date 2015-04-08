unit uWarehouse;

interface
	uses uWarehouseItem, uClothes;
	
	type
		Warehouse = Object
			contents : array[1..30] of WarehouseItem;
			size : longint;

			constructor cons(
				c : array of WarehouseItem;
				sz : longint
			);

			function find(
				name : String;
				colour : String;
				weight : real;
				material : String;
				price_per_kg : real
			):Clothes;
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

	function Warehouse.find(
		name : String;
		colour : String;
		weight : real;
		material : String;
		price_per_kg : real
	):Clothes;
	var i:longint;
	begin
		for i:=1 to size do
		begin
			if ((contents[i].clothes.name = name)
			and	(contents[i].clothes.colour = colour)
			and	(contents[i].clothes.weight = weight)
			and	(contents[i].clothes.material = material)
			and	(contents[i].clothes.price_per_kg = price_per_kg)) then
			begin
				find := contents[i].clothes;
				break;
			end;
		end;
	end;

	procedure Warehouse.tes;
	begin
	
	end;
end.
