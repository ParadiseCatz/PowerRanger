program OnlineShopping;

uses uLoader, uTransactionPool, uShoppingCart, uCourierPool, uWarehouse, uConfig, uSaver, uValidator,uWriter, uClothes, uShoppingCartItem, uReader, uWarehouseItem, uCourier;

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

procedure showPopulars(); //F2
var
	popularWarehouse:Warehouse;
	i:longint;
begin
	popularWarehouse := warehouseGetPopulars(mainWarehouse);
	for i:=1 to popularWarehouse.size do
	begin
		write(i,'. ');
		writeWarehouseItem(popularWarehouse.contents[i]);
	end;
end;

procedure showDetailProduct(); //F3
var
	result:Clothes;
begin
	readClothesByName(result,mainWarehouse);
	if (result.name = '#') then
		writeln('Clothes not found.')
	else
		writeClothes(result);
end;

procedure sortPrice(); //F5
begin
	sortByPrice(mainWarehouse);
	writeWarehouse(mainWarehouse);
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

procedure filterByPrice(); //F7
var
	filteredWarehouse : Warehouse;
begin
	filteredWarehouse := warehouseFilterByPrice(mainWarehouse);
	writeln('Highest Price on Store: ');
	writeWarehouseItem(filteredWarehouse.contents[1]);
	writeln('Lowest Price on Store: ');
	writeWarehouseItem(filteredWarehouse.contents[2]);
end;

procedure showExpedition(); //F8
var
	cp:CourierPool;
begin
	readCourierByCity(cp, mainCourierPool);
	if (cp.size <> 0) then
		writeCourierPool(cp)
	else
		writeln('No Courier Available.');
end;

procedure addToCart(); //F9
var
	result:WarehouseItem;
	sci:ShoppingCartItem;
begin
	readWarehouseItemByName(result,mainWarehouse);
	if (result.clothes.name = '#') then
		writeln('Clothes not found.')
	else
	begin
		sci.clothes:=result.clothes;
		readQuantity(sci);
		if (validAmountFromWarehouse(sci, result)) then
		begin
			shoppingCartAdd(sci, mainShoppingCart);
			warehouseRemoveStock(sci, mainWarehouse);
		end
		else
			writeln('One or more stock amount not enough.');
	end;
end;

procedure removeFromCart(); //F10
var
	result:ShoppingCartItem;
begin
	readShoppingCartItemByName(result,mainShoppingCart);
	if (result.clothes.name = '#') then
		writeln('Clothes not found.')
	else
	begin
		shoppingCartRemove(result, mainShoppingCart);
	end;
end;

procedure showTransaction(); //F15
begin
	sortByDate(mainTransactionPool);
	writeTransactionPool(mainTransactionPool);
end;

procedure help();
var
	i:longint;
begin
	writeln('Command Available:');
	for i:=1 to COMMAND_NUMBER do
		writeln('- ', COMMAND_LIST[i]);
end;

procedure branchBasedOn(uc:string);
begin
	if (uc = 'load') then loadAll()
	else 
	if (uc = 'showPopulars') then showPopulars()
	else 
	if (uc = 'showDetailProduct') then showDetailProduct()
	else 
	if (uc = 'searchClothesByKeyword') then 
	else 
	if (uc = 'sortPrice') then sortPrice()
	else 
	if (uc = 'filterClothes') then 
	else 
	if (uc = 'filterByPrice') then filterByPrice()
	else 
	if (uc = 'showExpedition') then showExpedition()
	else 
	if (uc = 'addToCart') then addToCart()
	else 
	if (uc = 'removeFromCart') then removeFromCart()
	else 
	if (uc = 'calculatePrice') then 
	else 
	if (uc = 'checkout') then 
	else 
	if (uc = 'updateClothes') then 
	else 
	if (uc = 'discountGrosir') then 
	else 
	if (uc = 'showTransaction') then showTransaction()
	else 
	if (uc = 'retur') then 
	else 
	if (uc = 'help') then help();
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

