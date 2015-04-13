unit uConfig;

interface
	const
		ARRAY_LIMIT = 30;
		DATABASE_CLOTHES_FILENAME = 'database_clothes.txt';
		DATABASE_COURIER_FILENAME = 'database_courier.txt';
		DATABASE_SHOPPING_CART_FILENAME = 'database_shopping_cart.txt';
		DATABASE_TRANSACTION_FILENAME = 'database_transaction.txt';
		COMMAND_NUMBER = 18;
		COMMAND_LIST : array[1..COMMAND_NUMBER] of string = ('load', 
												'showPopulars', 
												'showDetailProduct', 
												'searchClothesByKeyword', 
												'sortPrice', 
												'filterClothes',
												'filterByPrice',
												'showExpedition',
												'addToCart',
												'removeFromCart',
												'calculatePrice',
												'checkout',
												'updateClothes',
												'discountGrosir',
												'showTransaction',
												'retur',
												'exit',
												'help'
												);
implementation

end.