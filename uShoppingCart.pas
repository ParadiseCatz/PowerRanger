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


implementation
	function shoppingCartCons(
		c : array of ShoppingCartItem;
		sz : longint
	):ShoppingCart;
	begin
		shoppingCartCons.contents := c;
		shoppingCartCons.size := sz;
	end;

end.
