unit uShoppingCart;

interface
	uses uShoppingCartItem,uConfig;
	
	type
		ShoppingCart = record
			contents : array[1..ARRAY_LIMIT] of ShoppingCartItem;
			size : longint;
		end;

	function shoppingCartCons(
		c : array of ShoppingCartItem;
		sz : longint
	):ShoppingCart;

	function totalShoppingCartWeight(sc : ShoppingCart):real;
	function totalShoppingCartPrice(sc : ShoppingCart):real;

	procedure clearShoppingCart(var sc : ShoppingCart);

implementation
	function shoppingCartCons(
		c : array of ShoppingCartItem;
		sz : longint
	):ShoppingCart;
	begin
		shoppingCartCons.contents := c;
		shoppingCartCons.size := sz;
	end;

	function totalShoppingCartWeight(sc : ShoppingCart):real;
	var
		returnWeight:real;
		i:integer;
	begin
		returnWeight:=0;
		for i:=1 to sc.size do
		begin
			returnWeight:=returnWeight+totalItemWeight(sc.contents[i]);
		end;

		totalShoppingCartWeight:=returnWeight;
	end;

	function totalShoppingCartPrice(sc : ShoppingCart):real;
	var
		returnPrice:real;
		i:integer;
	begin
		returnPrice:=0;
		for i:=1 to sc.size do
		begin
			returnPrice:=returnPrice+totalItemPrice(sc.contents[i]);
		end;

		totalShoppingCartPrice:=returnPrice;
	end;

	procedure clearShoppingCart(var sc : ShoppingCart);
	begin
		sc.size:=0;
	end;
end.
