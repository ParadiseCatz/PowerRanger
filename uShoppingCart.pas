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

	function shoppingCartTotalWeight(sc : ShoppingCart):real;
	function shoppingCartTotalPrice(sc : ShoppingCart):real;

	procedure shoppingCartClear(var sc : ShoppingCart);
	procedure shoppingCartAdd(sci:ShoppingCartItem; var sc:ShoppingCart);
	procedure shoppingCartRemove(sci:ShoppingCartItem; var sc:ShoppingCart);

implementation
	function shoppingCartCons(
		c : array of ShoppingCartItem;
		sz : longint
	):ShoppingCart;
	begin
		shoppingCartCons.contents := c;
		shoppingCartCons.size := sz;
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
	begin
		sc.size := sc.size + 1;
		sc.contents[sc.size] := sci;
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
	end;
end.
