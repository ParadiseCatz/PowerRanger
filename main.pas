program OnlineShopping;

uses uLoader, uTransactionPool, uShoppingCart, uCourierPool, uWarehouse, uConfig;

var
	userCommand : string;
	mainTransactionPool : TransactionPool;
	mainShoppingCart : ShoppingCart;
	mainWarehouse : Warehouse;
	mainCourierPool : CourierPool;

procedure loadAll();
begin
	mainWarehouse := loadWarehouse(DATABASE_CLOTHES_FILENAME);
	mainCourierPool := loadCourier(DATABASE_COURIER_FILENAME);
	mainShoppingCart := loadShoppingCart(DATABASE_SHOPPING_CART_FILENAME);
	mainTransactionPool := loadTransaction(DATABASE_TRANSACTION_FILENAME);
end;

procedure userGreeter();
begin
	writeln('=======================');
	writeln('       LADAZA.com      ');
	writeln('=======================');
	writeln('The Biggest Online Shop');
	writeln();
end;

begin
	userGreeter();
	loadAll();
end.

