unit uTransaction;

interface
	uses uShoppingCart, uCourier, uDate;
	
	type
		Transaction = record
			shopping_cart : ShoppingCart;
			courier : Courier;
			delivery_date : Date;
		end;

	function transactionCons(
		sc : ShoppingCart;
		c : Courier;
		dt : Date
	):Transaction;
		

implementation
	function transactionCons(
		sc : ShoppingCart;
		c : Courier;
		dt : Date
	):Transaction;
	begin
		transactionCons.shopping_cart := sc;
		transactionCons.courier := c;
		transactionCons.delivery_date := dt;
	end;
end.
