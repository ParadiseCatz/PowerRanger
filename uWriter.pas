unit uWriter;

interface
	uses uClothes,uShoppingCart,uShoppingCartItem,uWarehouse,uWarehouseItem,uCourier,uCourierPool,uDate,uTransaction,uTransactionPool;

	procedure writeClothesName(c:Clothes);
	procedure writeClothesCategory(c:Clothes);
	procedure writeClothesGender(c:Clothes);
	procedure writeClothesColour(c:Clothes);
	procedure writeClothesWeight(c:Clothes);
	procedure writeClothesMaterial(c:Clothes);
	procedure writeClothesPrice(c:Clothes);
	procedure writeClothes(c:Clothes);

	procedure writeDate(d:Date);
	
	procedure writeWarehouseItem(wi:WarehouseItem);
	procedure writeWarehouse(w:Warehouse);
	procedure writeItemStock(wi:WarehouseItem);
	procedure writeSoldQuantity(wi:WarehouseItem);

	procedure writeCourier(co:Courier);
	procedure writeCourierPool(cp:CourierPool);

	procedure writeShoppingCartItemQuantity(sci:ShoppingCartItem);
	procedure writeShoppingCartItemTotalWeight(sci:ShoppingCartItem);
	procedure writeShoppingCartItemTotalPrice(sci:ShoppingCartItem);
	procedure writeShoppingCartTotalWeight(sc:ShoppingCart);
	procedure writeShoppingCartTotalPrice(sc:ShoppingCart);
	procedure writeShoppingCartItems(sc:ShoppingCart);
	procedure writeShoppingCartItem(sc:ShoppingCartItem);

	procedure writeTransaction(t:Transaction);
	procedure writeTransactionPool(tp:TransactionPool);

implementation
	procedure writeClothesName(c:Clothes);
	begin
		writeln(c.name);
	end;

	procedure writeClothesCategory(c:Clothes);
	begin
		writeln('Category: ',c.category);
	end;

	procedure writeClothesGender(c:Clothes);
	begin
		writeln('Gender: ',c.gender);
	end;

	procedure writeClothesColour(c:Clothes);
	begin
		writeln('Warna: ',c.colour);
	end;

	procedure writeClothesWeight(c:Clothes);
	begin
		writeln('Weight: ',c.weight:0:2, ' kg');
	end;

	procedure writeClothesMaterial(c:Clothes);
	begin
		writeln('Material: ',c.material);
	end;

	procedure writeClothesPrice(c:Clothes);
	begin
		writeln('Rp ',c.price:0:0);
	end;

	procedure writeClothes(c:Clothes);
	begin
		writeClothesName(c);
		writeClothesCategory(c);
		writeClothesGender(c);
		writeClothesColour(c);
		writeClothesWeight(c);
		writeClothesMaterial(c);
		writeClothesPrice(c);
	end;

	procedure writeDate(d:Date);
	begin
		writeln(d.day,'/',d.month,'/',d.year);
	end;

	procedure writeWarehouseItem(wi:WarehouseItem);
	begin
		writeClothesName(wi.clothes);
		writeClothesColour(wi.clothes);
		writeItemStock(wi);
		writeClothesPrice(wi.clothes);
		writeSoldQuantity(wi);
	end;

	procedure writeWarehouse(w:Warehouse);
	var
		i:longint;
	begin
		for i:=1 to w.size do
		begin
			writeWarehouseItem(w.contents[i]);
			writeln;
		end;
	end;

	procedure writeItemStock(wi:WarehouseItem);
	begin
		write('S: ',wi.s_stock,' ');
		write('M: ',wi.m_stock,' ');
		write('L: ',wi.l_stock,' ');
		writeln('XL: ',wi.xl_stock);
	end;

	procedure writeSoldQuantity(wi:WarehouseItem);
	begin
		writeln('Banyak dibeli: ',wi.sold_quantity,' kali');
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

	procedure writeShoppingCartItemQuantity(sci:ShoppingCartItem);
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

	procedure writeShoppingCartItemTotalWeight(sci:ShoppingCartItem);
	begin
		writeln('Berat: ',shoppingCartItemTotalWeight(sci):0:2);
	end;

	procedure writeShoppingCartItemTotalPrice(sci:ShoppingCartItem);
	begin
		writeln('Rp ',sci.clothes.price:0:2,' x ',shoppingCartItemTotalQuantity(sci),' = Rp ',shoppingCartItemTotalPrice(sci):0:2);
	end;

	procedure writeShoppingCartTotalWeight(sc:ShoppingCart);
	begin
		writeln('Berat: ',shoppingCartTotalWeight(sc):0:2);
	end;

	procedure writeShoppingCartTotalPrice(sc:ShoppingCart);
	begin
		writeln('Total: Rp ',shoppingCartTotalPrice(sc):0:2);
	end;

	procedure writeShoppingCartItems(sc:ShoppingCart);
	var
		i:integer;
	begin
		for i:=1 to sc.size do
		begin
			write(i,'. '); writeClothesName(sc.contents[i].clothes);
			writeClothesColour(sc.contents[i].clothes);
			writeShoppingCartItemQuantity(sc.contents[i]);
			writeShoppingCartItemTotalWeight(sc.contents[i]);
			writeShoppingCartItemTotalPrice(sc.contents[i]);
		end;
		writeShoppingCartTotalPrice(sc);
		writeShoppingCartTotalWeight(sc);
		writeln;
	end;

	procedure writeShoppingCartItem(sc:ShoppingCartItem);
	begin
		writeClothesName(sc.clothes);
		writeClothesColour(sc.clothes);
		writeShoppingCartItemQuantity(sc);
		writeShoppingCartItemTotalWeight(sc);
		writeShoppingCartItemTotalPrice(sc);
	end;

	procedure writeTransaction(t:Transaction);
	begin
		writeShoppingCartItem(t.shopping_cart_item);
		writeCourier(t.courier);
		write('Delivery Date: '); writeDate(t.delivery_date);
		writeln;
	end;

	procedure writeTransactionPool(tp:TransactionPool);
	var
		i:longint;
	begin
		for i:=1 to tp.size do
		begin
			writeTransaction(tp.contents[i]);
		end;
	end;

end.