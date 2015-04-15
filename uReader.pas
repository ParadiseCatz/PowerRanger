unit uReader;

interface
	uses uClothes, uWarehouse, uShoppingCartItem, uWarehouseItem;

	procedure readClothesByName(var c:Clothes; ws:Warehouse);
	procedure readWarehouseByName(var c:WarehouseItem; ws:Warehouse);
	procedure readQuantity(var sci:ShoppingCartItem);
implementation
	procedure readClothesByName(var c:Clothes; ws:Warehouse);
	var
		name:string;
	begin
		write('Please enter clothes name: '); readln(name);
		c := warehouseFindByName(name, ws).clothes;
	end;

	procedure readWarehouseByName(var c:WarehouseItem; ws:Warehouse);
	var
		name:string;
	begin
		write('Please enter clothes name: '); readln(name);
		c := warehouseFindByName(name, ws);
	end;

	procedure readQuantity(var sci:ShoppingCartItem);
	begin
		write('S size quantity: '); readln(sci.s_quantity);
		write('M size quantity: '); readln(sci.m_quantity);
		write('L size quantity: '); readln(sci.l_quantity);
		write('XL size quantity: '); readln(sci.xl_quantity);
	end;
end.