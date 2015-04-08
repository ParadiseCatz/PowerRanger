unit uTransaction;

interface
	uses uShoppingCart, uCourier, uDate;
	
	type
		Transaction = Object
			shopping_cart : ShoppingCart;
			courier : Courier;
			delivery_date : Date;

			constructor cons(
				sc : ShoppingCart;
				c : Courier;
				dt : Date
			);
			procedure tes;
		end;

implementation
	constructor Transaction.cons(
		sc : ShoppingCart;
		c : Courier;
		dt : Date
	);
	begin
		shopping_cart := sc;
		courier := c;
		delivery_date := dt;
	end;

	procedure Transaction.tes;
	begin
	
	end;
end.
