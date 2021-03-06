unit uSaver;

interface
	uses uParser, uWarehouse, uWarehouseItem, uShoppingCart, uCourierPool, uTransaction, uTransactionPool, uClothes, uShoppingCartItem, uCourier, uDate;

	procedure saveWarehouse(newWarehouse:Warehouse;filename:string);
	procedure saveCourier(newCourierPool:CourierPool;filename:string);
	procedure saveShoppingCart(newShoppingCart:ShoppingCart;filename:string);
	procedure saveTransaction(newTransactionPool:TransactionPool;filename:string);

implementation
var
	selectedDatabase : textfile;
	t : arString;

	procedure saveWarehouse(newWarehouse:Warehouse;filename:string);
	var
		i:longint;
	begin
		write('Saving Warehouse...');
		assign(selectedDatabase,filename);
		rewrite(selectedDatabase);
		for i:=1 to newWarehouse.size do
		begin
			t[1]:=newWarehouse.contents[i].clothes.name;
			t[2]:=newWarehouse.contents[i].clothes.category;
			t[3]:=newWarehouse.contents[i].clothes.gender;
			t[4]:=newWarehouse.contents[i].clothes.colour;
			str(newWarehouse.contents[i].clothes.weight:0:2,t[5]);
			t[6]:=newWarehouse.contents[i].clothes.material;
			str(newWarehouse.contents[i].clothes.price:0:2,t[7]);
			str(newWarehouse.contents[i].s_stock,t[8]);
			str(newWarehouse.contents[i].m_stock,t[9]);
			str(newWarehouse.contents[i].l_stock,t[10]);
			str(newWarehouse.contents[i].xl_stock,t[11]);
			str(newWarehouse.contents[i].sold_quantity,t[12]);

			str(newWarehouse.contents[i].grosir_discount:0:2,t[13]);
			writeln(selectedDatabase,arrayToString(t,13));
		end;
		close(selectedDatabase);
		writeln('OK');
	end;

	procedure saveCourier(newCourierPool:CourierPool;filename:string);
	var
		i:longint;
	begin
		write('Saving Courier...');
		assign(selectedDatabase,filename);
		rewrite(selectedDatabase);
		for i:=1 to newCourierPool.size do
		begin
			t[1]:=newCourierPool.contents[i].name;
			t[2]:=newCourierPool.contents[i].type_of_service;
			t[3]:=newCourierPool.contents[i].destination_city;
			str(newCourierPool.contents[i].price_per_kg:0:2,t[4]);
			str(newCourierPool.contents[i].delivery_time,t[5]);
			writeln(selectedDatabase,arrayToString(t,5));
		end;
		close(selectedDatabase);
		writeln('OK');
	end;

	procedure saveShoppingCart(newShoppingCart:ShoppingCart;filename:string);
	var
		i:longint;
	begin
		write('Saving Shopping Cart...');
		assign(selectedDatabase,filename);
		rewrite(selectedDatabase);
		for i:=1 to newShoppingCart.size do
		begin
			t[1]:=newShoppingCart.contents[i].clothes.name;
			t[2]:=newShoppingCart.contents[i].clothes.colour;
			str(newShoppingCart.contents[i].clothes.weight:0:2,t[3]);
			t[4]:=newShoppingCart.contents[i].clothes.material;
			str(newShoppingCart.contents[i].clothes.price:0:2,t[5]);
			str(newShoppingCart.contents[i].s_quantity,t[6]);
			str(newShoppingCart.contents[i].m_quantity,t[7]);
			str(newShoppingCart.contents[i].l_quantity,t[8]);
			str(newShoppingCart.contents[i].xl_quantity,t[9]);
			writeln(selectedDatabase,arrayToString(t,9));
		end;
		close(selectedDatabase);
		writeln('OK');
	end;

	procedure saveTransaction(newTransactionPool:TransactionPool;filename:string);
	var
		i:longint;
	begin
		write('Saving Transaction...');
		assign(selectedDatabase,filename);
		rewrite(selectedDatabase);
		for i:=1 to newTransactionPool.size do
		begin
			t[1]:=newTransactionPool.contents[i].shopping_cart_item.clothes.name;
			t[2]:=newTransactionPool.contents[i].shopping_cart_item.clothes.colour;
			str(newTransactionPool.contents[i].shopping_cart_item.clothes.weight:0:2,t[3]);
			t[4]:=newTransactionPool.contents[i].shopping_cart_item.clothes.material;
			str(newTransactionPool.contents[i].shopping_cart_item.clothes.price:0:2,t[5]);
			str(newTransactionPool.contents[i].shopping_cart_item.s_quantity,t[6]);
			str(newTransactionPool.contents[i].shopping_cart_item.m_quantity,t[7]);
			str(newTransactionPool.contents[i].shopping_cart_item.l_quantity,t[8]);
			str(newTransactionPool.contents[i].shopping_cart_item.xl_quantity,t[9]);
			t[10]:=newTransactionPool.contents[i].courier.name;
			t[11]:=newTransactionPool.contents[i].courier.type_of_service;
			t[12]:=newTransactionPool.contents[i].courier.destination_city;
			str(newTransactionPool.contents[i].courier.price_per_kg:0:2,t[13]);
			str(newTransactionPool.contents[i].courier.delivery_time,t[14]);
			t[15]:=dateToString(newTransactionPool.contents[i].delivery_date);
			writeln(selectedDatabase,arrayToString(t,15));
		end;
		close(selectedDatabase);
		writeln('OK');
	end;
end.