unit uShoppingCart;

interface
	uses uShoppingCartItem;
	
	type
		ShoppingCart = Object
			contents : array[1..100] of ShoppingCartItem;
			size : longint;

			constructor cons(
				c : array of ShoppingCartItem;
				sz : longint
			);
			procedure tes;
		end;

implementation
	constructor ShoppingCart.cons(
		c : array of ShoppingCartItem;
		sz : longint
	);
	begin
		contents := c;
		size := sz;
	end;

	procedure ShoppingCart.tes;
	begin
	
	end;
end.
