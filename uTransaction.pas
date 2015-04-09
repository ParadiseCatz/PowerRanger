unit uTransaction;

interface
	uses uShoppingCart, uCourier, uDate;
	
	type
		Transaction = record
			shopping_cart : ShoppingCart;
			courier : Courier;
			delivery_date : Date;

			function cons(
				sc : ShoppingCart;
				c : Courier;
				dt : Date
			):Transaction;

			procedure tes;
		end;

implementation
	function cons(
		sc : ShoppingCart;
		c : Courier;
		dt : Date
	):Transaction;
	begin
		cons.shopping_cart := sc;
		cons.courier := c;
		cons.delivery_date := dt;
	end;

	procedure Transaction.tes;
	begin
	
	end;
end.
