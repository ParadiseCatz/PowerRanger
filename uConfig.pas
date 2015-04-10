unit uConfig;

interface
	const
		ARRAY_LIMIT = 30;
		DATABASE_CLOTHES_FILENAME = 'database_clothes.txt';
		DATABASE_COURIER_FILENAME = 'database_courier.txt';
		DATABASE_SHOPPING_CART_FILENAME = 'database_shopping_cart.txt';
		DATABASE_TRANSACTION_FILENAME = 'database_transaction.txt';
		COMMAND_NUMBER = 17;
		COMMAND_LIST : array[1..COMMAND_NUMBER] of string = ('load', 
												'showpopulars', 
												'showdetailproduct', 
												'searchclothesbykeyword', 
												'sortprice', 
												'filterclothes',
												'filterbyprice',
												'showexpedition',
												'addtocart',
												'removefromcart',
												'calculateprice',
												'checkout',
												'updateclothes',
												'discountgrosir',
												'showtransaction',
												'retur',
												'exit'
												);
implementation

end.