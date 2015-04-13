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

procedure sortPrice();
begin
	warehouseSortPrice(mainWarehouse);

end;

procedure showDetailProduct();
var
	namaBaju:string;
begin
	//minta user nama
	write('Masukan nama Baju: '); readln(namaBaju);
	writeClothesName( cariBaju(mainWarehouse, namaBaju) );
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
	if (uc = 'showDetailProduct') then showDetailProduct();
	else 
	if (uc = 'searchClothesByKeyword') then 
	else 
	if (uc = 'sortPrice') then sortPrice();
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
	// saveAll();
	repeat
		repeat
			prompt();
			readln(userCommand);
		until (validCommand(userCommand));
		branchBasedOn(userCommand);
	until (userCommand = 'exit');
	//saveAll();
end.

