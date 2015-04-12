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

	function totalShoppingCartPrice(
		sc : ShoppingCart
	):real;


implementation
	function shoppingCartCons(
		c : array of ShoppingCartItem;
		sz : longint
	):ShoppingCart;
	begin
		shoppingCartCons.contents := c;
		shoppingCartCons.size := sz;
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
end.
