unit uReader;

interface
	uses uClothes, uWarehouse, uShoppingCartItem, uWarehouseItem, uShoppingCart, uCourier, uCourierPool, uDate, uParser;

	procedure readClothesByName(var c:Clothes; ws:Warehouse);
	procedure readWarehouseItemByName(var c:WarehouseItem; ws:Warehouse);
	procedure readShoppingCartItemByName(var sci:ShoppingCartItem; sc:ShoppingCart);
	procedure readQuantity(var sci:ShoppingCartItem);
	procedure readCourierByCity(var c:CourierPool; cp:CourierPool);
	procedure readCourier(var co:Courier; var d:Date);

implementation
	procedure readClothesByName(var c:Clothes; ws:Warehouse);
	var
		name:string;
	begin
		write('Please enter clothes name: '); readln(name);
		c := warehouseFindByName(name, ws).clothes;
	end;

	procedure readWarehouseItemByName(var c:WarehouseItem; ws:Warehouse);
	var
		name:string;
	begin
		write('Please enter clothes name: '); readln(name);
		c := warehouseFindByName(name, ws);
	end;

	procedure readShoppingCartItemByName(var sci:ShoppingCartItem; sc:ShoppingCart);
	var
		name:string;
	begin
		write('Please enter clothes name: '); readln(name);
		sci := shoppingCartFindByName(name, sc);
	end;

	procedure readQuantity(var sci:ShoppingCartItem);
	begin
		write('S size quantity: '); readln(sci.s_quantity);
		write('M size quantity: '); readln(sci.m_quantity);
		write('L size quantity: '); readln(sci.l_quantity);
		write('XL size quantity: '); readln(sci.xl_quantity);
	end;

	procedure readCourierByCity(var c:CourierPool; cp:CourierPool);
	var
		city:string;
	begin
		write('Please enter destination city: '); readln(city);
		c := courierFindByCity(city, cp);
	end;

	procedure readDate(var d:Date);
	var
		s:string;
	begin
		readln(s);
		d:=stringToDate(s);
	end;

	procedure readCourier(var co:Courier;var d:Date);
	begin
		write('Nama Ekspedisi : '); readln(co.name);
		write('Jenis Layanan : '); readln(co.type_of_service);
		write('Kota Tujuan : '); readln(co.destination_city);
		write('Tanggal Kirim : '); readDate(d);
	end;
end.