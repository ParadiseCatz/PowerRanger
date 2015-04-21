unit uShoppingCart;

interface
	uses uShoppingCartItem,uConfig,uAlgorithm;
	
	type
		ShoppingCart = record
			contents : array[1..ARRAY_LIMIT] of ShoppingCartItem;
			size : longint;
		end;

	function shoppingCartCons(
		c : array of ShoppingCartItem;
		sz : longint
	):ShoppingCart;

	function shoppingCartFindByName(name:string; sc:ShoppingCart):ShoppingCartItem;

	function shoppingCartTotalWeight(sc : ShoppingCart):real;
	function shoppingCartTotalPrice(sc : ShoppingCart):real;

	procedure shoppingCartClear(var sc : ShoppingCart);
	procedure shoppingCartAdd(sci:ShoppingCartItem; var sc:ShoppingCart);
	procedure shoppingCartRemove(sci:ShoppingCartItem; var sc:ShoppingCart);
	procedure shoppingCartAddQuantity(from:ShoppingCartItem;var target:ShoppingCartItem);

implementation
	function shoppingCartCons(
		c : array of ShoppingCartItem;
		sz : longint
	):ShoppingCart;
	begin
		shoppingCartCons.contents := c;
		shoppingCartCons.size := sz;
	end;

	function shoppingCartFindByName(name:string; sc:ShoppingCart):ShoppingCartItem;
	var 
		i:longint;
		dummy:ShoppingCartItem;
	begin
		dummy.clothes.name := '#';
		shoppingCartFindByName := dummy;
		for i:=1 to sc.size do
		begin
			if (sc.contents[i].clothes.name = name) then
			begin
				shoppingCartFindByName := sc.contents[i];
				break;
			end;
		end;
	end;

	function shoppingCartTotalWeight(sc : ShoppingCart):real;
	var
		returnWeight:real;
		i:integer;
	begin
		returnWeight:=0;
		for i:=1 to sc.size do
		begin
			returnWeight:=returnWeight+shoppingCartItemTotalWeight(sc.contents[i]);
		end;

		shoppingCartTotalWeight:=returnWeight;
	end;

	function shoppingCartTotalPrice(sc : ShoppingCart):real;
	var
		returnPrice:real;
		i:integer;
	begin
		returnPrice:=0;
		for i:=1 to sc.size do
		begin
			returnPrice:=returnPrice+shoppingCartItemTotalPrice(sc.contents[i]);
		end;

		shoppingCartTotalPrice:=returnPrice;
	end;

	procedure shoppingCartClear(var sc : ShoppingCart);
	begin
		sc.size:=0;
	end;

	procedure shoppingCartAdd(sci:ShoppingCartItem; var sc:ShoppingCart);
	var
		i:longint;
	begin
		if (shoppingCartFindByName(sci.clothes.name,sc).clothes.name = '#') then
		begin
			sc.size := sc.size + 1;
			sc.contents[sc.size] := sci;
		end
		else
		begin
			for i:=1 to sc.size do
			begin
				if (sc.contents[i].clothes.name = sci.clothes.name) then
				begin
					shoppingCartAddQuantity(sci,sc.contents[i]);
					break;
				end;
			end;
		end;
		writeln('Item Added to Shopping Cart.');
	end;

	procedure shoppingCartRemove(sci:ShoppingCartItem; var sc:ShoppingCart);
	var i:longint;
	begin
		for i:=1 to sc.size do
		begin
			if (sc.contents[i].clothes.name = sci.clothes.name) then
			begin
				swap(sc.contents[i], sc.contents[sc.size]);
				break;
			end;
		end;
		sc.size := sc.size - 1;
		writeln('Item Removed from Shopping Cart.');
	end;

	procedure shoppingCartAddQuantity(from:ShoppingCartItem;var target:ShoppingCartItem);
	begin
		target.s_quantity := target.s_quantity + from.s_quantity;
		target.m_quantity := target.m_quantity + from.m_quantity;
		target.l_quantity := target.l_quantity + from.l_quantity;
		target.xl_quantity := target.xl_quantity + from.xl_quantity;
	end;
end.
