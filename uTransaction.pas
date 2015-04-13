unit uTransaction;

interface
	uses uShoppingCart, uShoppingCartItem, uCourier, uDate;
	
	type
		Transaction = record
			shopping_cart_item : ShoppingCartItem;
			courier : Courier;
			delivery_date : Date;
		end;

	function transactionCons(
		sci : ShoppingCartItem;
		c : Courier;
		dt : Date
	):Transaction;
		

implementation
	function transactionCons(
		sci : ShoppingCartItem;
		c : Courier;
		dt : Date
	):Transaction;
	begin
		transactionCons.shopping_cart_item := sci;
		transactionCons.courier := c;
		transactionCons.delivery_date := dt;
	end;
end.
