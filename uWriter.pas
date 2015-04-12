unit uWriter;

interface
	uses uClothes,uShoppingCart,uShoppingCartItem,uWarehouse,uWarehouseItem,uCourier,uCourierPool,uDate;

	procedure writeClothesName(c:Clothes);
	procedure writeClothesCategory(c:Clothes);
	procedure writeClothesGender(c:Clothes);
	procedure writeClothesColour(c:Clothes);
	procedure writeClothesWeight(c:Clothes);
	procedure writeClothesMaterial(c:Clothes);
	procedure writeClothesPrice(c:Clothes);

	procedure writeDate(d:Date);
	
	procedure writeItemStock(wi:WarehouseItem);

	procedure writeCourier(co:Courier);
	procedure writeCourierPool(cp:CourierPool);

	procedure writeShoppingCartQuantity(sci:ShoppingCartItem);
	procedure writeTotalItemWeight(sci:ShoppingCartItem);
	procedure writeTotalItemPrice(sci:ShoppingCartItem);
	procedure writeTotalShoppingCartWeight(sc:ShoppingCart);
	procedure writeTotalShoppingCartPrice(sc:ShoppingCart);
	procedure writeShoppingCartItems(sc:ShoppingCart);

implementation
	procedure writeClothesName(c:Clothes);
	begin
		writeln(c.name);
	end;

	procedure writeClothesCategory(c:Clothes);
	begin
		writeln(c.category);
	end;

	procedure writeClothesGender(c:Clothes);
	begin
		writeln(c.gender);
	end;

	procedure writeClothesColour(c:Clothes);
	begin
		writeln('Warna: ',c.colour);
	end;

	procedure writeClothesWeight(c:Clothes);
	begin
		writeln(c.weight);
	end;

	procedure writeClothesMaterial(c:Clothes);
	begin
		writeln(c.material);
	end;

	procedure writeClothesPrice(c:Clothes);
	begin
		writeln('Rp ',c.price:0:0);
	end;

	procedure writeDate(d:Date);
	begin
		writeln(d.day,'/',d.month,'/',d.year);
	end;

	procedure writeItemStock(wi:WarehouseItem);
	begin
		write('S: ',wi.s_stock,' ');
		write('M: ',wi.m_stock,' ');
		write('L: ',wi.l_stock,' ');
		writeln('XL: ',wi.xl_stock);
	end;

	procedure writeCourier(co:Courier);
	begin
		writeln('Nama Ekspedisi : ',co.name);
		writeln('Jenis Layanan Pengiriman : ',co.type_of_service);
		writeln('Kota Tujuan : ',co.destination_city);
		writeln('Harga per kg : ',co.price_per_kg:0:2);
		writeln('Lama Pengiriman : ',co.delivery_time);
	end;

	procedure writeCourierPool(cp:CourierPool);
	var
		i:integer;
	begin
		for i:=1 to cp.size do
		begin
			writeCourier(cp.contents[i]);
			writeln;
		end;
	end;

	procedure writeShoppingCartQuantity(sci:ShoppingCartItem);
	begin
		if (sci.s_quantity>0) then
		begin
			write('S: ',sci.s_quantity,' ');
		end;

		if (sci.m_quantity>0) then
		begin
			write('M: ',sci.m_quantity,' ');
		end;
		
		if (sci.l_quantity>0) then
		begin
			write('L: ',sci.l_quantity,' ');
		end;

		if (sci.xl_quantity>0) then
		begin
			write('XL: ',sci.xl_quantity);
		end;
		writeln;
	end;

	procedure writeTotalItemWeight(sci:ShoppingCartItem);
	begin
		writeln('Berat: ',totalItemWeight(sci):0:2);
	end;

	procedure writeTotalItemPrice(sci:ShoppingCartItem);
	begin
		writeln('Rp ',sci.clothes.price:0:2,' x ',totalItemQuantity(sci),' = Rp ',totalItemPrice(sci):0:2);
	end;

	procedure writeTotalShoppingCartWeight(sc:ShoppingCart);
	begin
		writeln('Berat: ',totalShoppingCartWeight(sc):0:2);
	end;

	procedure writeTotalShoppingCartPrice(sc:ShoppingCart);
	begin
		writeln('Total: Rp ',totalShoppingCartPrice(sc):0:2);
	end;

	procedure writeShoppingCartItems(sc:ShoppingCart);
	var
		i:integer;
	begin
		for i:=1 to sc.size do
		begin
			write(i,'. '); writeClothesName(sc.contents[i].clothes);
			writeClothesColour(sc.contents[i].clothes);
			writeShoppingCartQuantity(sc.contents[i]);
			writeTotalItemWeight(sc.contents[i]);
			writeTotalItemPrice(sc.contents[i]);
		end;
		writeTotalShoppingCartPrice(sc);
		writeTotalShoppingCartWeight(sc);
		writeln;
	end;

end.