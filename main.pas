program OnlineShopping;

uses uLoader, uTransactionPool, uShoppingCart, uCourierPool, uWarehouse, uConfig, uSaver, uValidator,uWriter;

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

procedure saveAll();
begin
	saveWarehouse(mainWarehouse,DATABASE_CLOTHES_FILENAME);
	saveCourier(mainCourierPool,DATABASE_COURIER_FILENAME);
	saveShoppingCart(mainShoppingCart,DATABASE_SHOPPING_CART_FILENAME);
	saveTransaction(mainTransactionPool,DATABASE_TRANSACTION_FILENAME);
end;

procedure prompt();
begin
	write('> ');
end;

procedure showExpedition(cp:CourierPool); //F8
begin
	writeCourierPool(cp);
end;

procedure branchBasedOn(uc:string);
begin
	if (uc = 'load') then loadAll()
	else 
	if (uc = 'showPopulars') then 
	else 
	if (uc = 'showDetailProduct') then 
	else 
	if (uc = 'searchClothesByKeyword') then 
	else 
	if (uc = 'sortPrice') then 
	else 
	if (uc = 'filterClothes') then 
	else 
	if (uc = 'filterByPrice') then 
	else 
	if (uc = 'showExpedition') then showExpedition(mainCourierPool)
	else 
	if (uc = 'addToCart') then 
	else 
	if (uc = 'removeFromCart') then 
	else 
	if (uc = 'calculatePrice') then 
	else 
	if (uc = 'checkout') then 
	else 
	if (uc = 'updateClothes') then 
	else 
	if (uc = 'discountGrosir') then 
	else 
	if (uc = 'showTransaction') then 
	else 
	if (uc = 'retur') then 
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
	saveAll();
	repeat
		repeat
			prompt();
			readln(userCommand);
		until (validCommand(userCommand));
		branchBasedOn(userCommand);
	until (userCommand = 'exit');
	//saveAll();
end.

