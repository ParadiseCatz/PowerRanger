unit uWarehouse;

interface
	uses uWarehouseItem, uClothes, uConfig, uAlgorithm, uShoppingCartItem;
	
	type
		Warehouse = record
			contents : array[1..ARRAY_LIMIT] of WarehouseItem;
			size : longint;
		end;

	function warehouseCons(
		c : array of WarehouseItem;
		sz : longint
	):Warehouse;

	function warehouseFind(
		name : String;
		colour : String;
		weight : real;
		material : String;
		price : real;
		warehouseSource : Warehouse
	):Clothes;

	function warehouseFindByName(name:string; warehouseSource:Warehouse):WarehouseItem;
	function warehouseGetPopulars(warehouseSource:Warehouse):Warehouse;

	procedure sortByPrice(var whs:Warehouse);
	procedure warehouseRemoveStock(sci:ShoppingCartItem; warehouseSource:Warehouse);
	procedure warehouseAddStock(sci:ShoppingCartItem; warehouseSource:Warehouse);

implementation
	function warehouseCons(
		c : array of WarehouseItem;
		sz : longint
	):Warehouse;
	begin
		warehouseCons.contents := c;
		warehouseCons.size := sz;
	end;

	function warehouseFind(
		name : String;
		colour : String;
		weight : real;
		material : String;
		price : real;
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
			and	(warehouseSource.contents[i].clothes.price = price)) then
			begin
				warehouseFind := warehouseSource.contents[i].clothes;
				break;
			end;
		end;
	end;

	function warehouseFindByName(name:string; warehouseSource:Warehouse):WarehouseItem;
	var 
		i:longint;
		dummy:WarehouseItem;
	begin
		dummy.clothes.name := '#';
		warehouseFindByName := dummy;
		for i:=1 to warehouseSource.size do
		begin
			if (warehouseSource.contents[i].clothes.name = name) then
			begin
				warehouseFindByName := warehouseSource.contents[i];
				break;
			end;
		end;
	end;

	function warehouseGetPopulars(warehouseSource:Warehouse):Warehouse;
	var
		i, first, second, third:longint;
	begin
		first:=-1; second:=-1; third:=-1;
		for i:=1 to warehouseSource.size do
		begin
			if (warehouseSource.contents[i].sold_quantity > first) then
			begin
				third := second;
				warehouseGetPopulars.contents[3] := warehouseGetPopulars.contents[2];
				second := first;
				warehouseGetPopulars.contents[2] := warehouseGetPopulars.contents[1];
				first := warehouseSource.contents[i].sold_quantity;
				warehouseGetPopulars.contents[1] := warehouseSource.contents[i];
			end
			else
			begin
				if (warehouseSource.contents[i].sold_quantity > second) then
				begin
					third := second;
					warehouseGetPopulars.contents[3] := warehouseGetPopulars.contents[2];
					second := warehouseSource.contents[i].sold_quantity;
					warehouseGetPopulars.contents[2] := warehouseSource.contents[i];
				end
				else
				begin
					if (warehouseSource.contents[i].sold_quantity > third) then
					begin
						third := warehouseSource.contents[i].sold_quantity;
						warehouseGetPopulars.contents[3] := warehouseSource.contents[i];
					end;
				end;
			end;
		end;
		if (first <> -1) then
			warehouseGetPopulars.size := 1;
		if (second <> -1) then
			warehouseGetPopulars.size := 2;
		if (third <> -1) then
			warehouseGetPopulars.size := 3;
	end;

	procedure sortByPrice(var whs:Warehouse);
	var
		i,j:integer;
	begin
		for i:=1 to whs.size do
		begin
			for j:=i+1 to whs.size do
			begin
				if (whs.contents[i].clothes.price > whs.contents[j].clothes.price) then
				begin
					swap(whs.contents[j-1],whs.contents[j]);
				end;
			end;
		end;
	end;

	procedure warehouseRemoveStock(sci:ShoppingCartItem; warehouseSource:Warehouse);
	var i:longint;
	begin
		for i:=1 to warehouseSource.size do
		begin
			if (sci.clothes.name = warehouseSource.contents[i].clothes.name) then
			begin
				warehouseSource.contents[i].s_stock := warehouseSource.contents[i].s_stock - sci.s_quantity;
				warehouseSource.contents[i].m_stock := warehouseSource.contents[i].m_stock - sci.m_quantity;
				warehouseSource.contents[i].l_stock := warehouseSource.contents[i].l_stock - sci.l_quantity;
				warehouseSource.contents[i].xl_stock := warehouseSource.contents[i].xl_stock - sci.xl_quantity;
				break;
			end;
		end;
	end;

	procedure warehouseAddStock(sci:ShoppingCartItem; warehouseSource:Warehouse);
	var i:longint;
	begin
		for i:=1 to warehouseSource.size do
		begin
			if (sci.clothes.name = warehouseSource.contents[i].clothes.name) then
			begin
				warehouseSource.contents[i].s_stock := warehouseSource.contents[i].s_stock + sci.s_quantity;
				warehouseSource.contents[i].m_stock := warehouseSource.contents[i].m_stock + sci.m_quantity;
				warehouseSource.contents[i].l_stock := warehouseSource.contents[i].l_stock + sci.l_quantity;
				warehouseSource.contents[i].xl_stock := warehouseSource.contents[i].xl_stock + sci.xl_quantity;
				break;
			end;
		end;
	end;
end.
