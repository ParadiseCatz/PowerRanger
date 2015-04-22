unit uTransactionPool;

interface
	uses uTransaction,uConfig,uAlgorithm,uDate,uCourier,uShoppingCart,uShoppingCartItem;
	
	type
		TransactionPool = record
			contents : array[1..ARRAY_LIMIT] of Transaction;
			size : longint;
		end;
		
	function transactionPoolCons(
		c : array of Transaction;
		sz : longint
	):TransactionPool;
	
	procedure sortByDate(var tp : TransactionPool);

implementation
	function transactionPoolCons(
		c : array of Transaction;
		sz : longint
	):TransactionPool;
	begin
		transactionPoolCons.contents := c;
		transactionPoolCons.size := sz;
	end;

	procedure sortByDate(var tp : TransactionPool);
	var
		i,j:integer;
	begin
		for i:=1 to tp.size do
		begin
			for j:=i+1 to tp.size do
			begin
				if (compareDate(tp.contents[j-1].delivery_date,tp.contents[j].delivery_date)) then
				begin
					swap(tp.contents[j-1],tp.contents[j]);
				end;
			end;
		end;
	end;

	procedure addTransaction(sc:ShoppingCart; co:Courier; d:Date; var tp:TransactionPool);
	var
		i,j:integer;
		found:boolean;
	begin
		for i:=1 to sc.size do
		begin
			found:=false;
			for j:=1 to tp.size do
			begin
				if 	(tp.contents[j].shopping_cart_item.clothes.name=sc.contents[i].clothes.name) and
					(courierIsEqual(tp.contents[j].courier,co)) and
					(dateIsEqual(tp.contents[j].delivery_date,d)) then
				begin
					tp.contents[j].shopping_cart_item.s_quantity:=tp.contents[j].shopping_cart_item.s_quantity+sc.contents[i].s_quantity;
					tp.contents[j].shopping_cart_item.m_quantity:=tp.contents[j].shopping_cart_item.m_quantity+sc.contents[i].m_quantity;
					tp.contents[j].shopping_cart_item.l_quantity:=tp.contents[j].shopping_cart_item.l_quantity+sc.contents[i].l_quantity;
					tp.contents[j].shopping_cart_item.xl_quantity:=tp.contents[j].shopping_cart_item.xl_quantity+sc.contents[i].xl_quantity;
					found:=true;
				end;
			end;

			if (not(found)) then
			begin
				tp.size:=tp.size+1;
				tp.contents[tp.size]:=transactionCons(sc.contents[i],co,d);
			end;
		end;
	end;
end.
