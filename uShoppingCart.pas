unit uShoppingCart;

interface
	uses uShoppingCartItem;
	
	type
		ShoppingCart = Object
			contents : array[1..1000] of ShoppingCartItem;

			constructor cons(
				c : array of ShoppingCartItem
			);
			procedure tes;
		end;

implementation
	constructor ShoppingCart.cons(
		c : array of ShoppingCartItem
	);
	begin
		contents := c;
	end;

	procedure ShoppingCart.tes;
	begin
	
	end;
end.
