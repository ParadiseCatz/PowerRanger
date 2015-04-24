program OnlineShopping;

uses uDate, uLoader, uTransactionPool, uShoppingCart, uCourierPool, uWarehouse, uConfig, uSaver, uValidator,uWriter, uClothes, uShoppingCartItem, uReader, uWarehouseItem, uCourier, uAlgorithm, uTransaction;

var
	userCommand : string;
	mainTransactionPool : TransactionPool;
	mainShoppingCart : ShoppingCart;
	mainWarehouse : Warehouse;
	mainCourierPool : CourierPool;

procedure loadAll() forward; //F1
procedure showPopulars() forward; //F2
procedure showDetailProduct() forward; //F3
procedure searchClothesByKeyword() forward; //F4
procedure sortPrice() forward; //F5
procedure filterClothes () forward; //F6
procedure filterByPrice() forward; //F7
procedure showExpedition() forward; //F8
procedure addToCart() forward; //F9
procedure removeFromCart() forward; //F10
procedure calculatePrice() forward; //F11
procedure checkout() forward; //F12
procedure updateClothes() forward; //F13
procedure discountGrosir(var dc:real) forward; //F14
procedure showTransaction() forward; //F15
procedure retur() forward; //F16

procedure loadAll(); //F1
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

procedure searchClothesByKeyword(); //F4
var
	keywrd: string ;
	i , x : integer ;
begin
	write('Kata Kunci : ');	readln(keywrd);
	x := 0 ;
	for i := 1 to mainWarehouse.size do
	begin
		if stringMatching(mainWarehouse.contents[i].Clothes.name,keywrd) or
		stringMatching(mainWarehouse.contents[i].Clothes.category,keywrd) or
		stringMatching(mainWarehouse.contents[i].Clothes.colour,keywrd) then
		begin
				writeWarehouseItem(mainWarehouse.contents[i]);
				x := 1 ;
		end; 
	end;
	if x = 0 then writeln('Barang tidak ditemukan');
end;


procedure sortPrice(); //F5
begin
	sortByPrice(mainWarehouse);
	writeWarehouse(mainWarehouse);
end;

procedure filterClothes (); //F6
var
	gender , ukuran , jenis , warna : string ;
	x,i : integer ;
begin
	write('Gender   : '); readln(gender);
	write('Kategori : '); readln(jenis);
	write('Warna	 : '); readln(warna);
	write('Ukuran	 : '); readln(ukuran);
	x := 0 ;
	for i := 1 to mainWarehouse.size do
	begin
		if periksa(mainWarehouse.contents[i].clothes.gender,gender) and 
		periksa(mainWarehouse.contents[i].clothes.colour,warna) and 
		periksa(mainWarehouse.contents[i].clothes.category,jenis) and 
		sedia (i,ukuran,mainWarehouse) then
		begin
			x := x  + 1 ;
			write(x,'. ');
			writeWarehouseItem(mainWarehouse.contents[i]);	
		end;
		
	end;
	if x = 0 then writeln('Barang tidak ditemukan');
	
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
	sciInCart:ShoppingCartItem;
begin
	readWarehouseItemByName(result,mainWarehouse);
	if (result.clothes.name = '#') then
		writeln('Clothes not found.')
	else
	begin
		sci.clothes:=result.clothes;
		readQuantity(sci);
		sciInCart := shoppingCartFindByName(result.clothes.name,mainShoppingCart);
		if (sciInCart.clothes.name <> '#') then
		begin
			shoppingCartAddQuantity(sci,sciInCart);
		end
		else
			sciInCart := sci;
		if (validAmountFromWarehouse(sciInCart, result)) then
		begin
			shoppingCartAdd(sci, mainShoppingCart);
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

procedure calculatePrice(); //F11
begin
	writeShoppingCartItems(mainShoppingCart);
end;

procedure checkout(); //F12
var
	co,courChoice:Courier;
	d,arrivalDate:Date;
	courierFee : real;
	discount : real;
begin
	readCourier(co,d);
	courChoice:=courierFind(co,mainCourierPool);
	if (courChoice.name = '#') then
	begin
		writeln('Courier not found.');
	end
	else
	begin
		arrivalDate:=addDate(d,courChoice.delivery_time);
		writeShoppingCartItems(mainShoppingCart);

		discountGrosir(discount);
		courierFee := courChoice.price_per_kg * shoppingCartTotalWeight(mainShoppingCart);
		write('Biaya Ekspedisi : Rp '); writeln(courierFee:0:2);
		write('Grand Total : Rp '); writeln(courierFee+shoppingCartTotalPrice(mainShoppingCart)-discount:0:2);
		write('Tanggal Sampai : ');writeDate(arrivalDate);
		writeln;

		updateClothes();
		addTransaction(mainShoppingCart,courChoice,arrivalDate,mainTransactionPool);
		shoppingCartClear(mainShoppingCart);
	end;
end;

procedure updateClothes(); //F13
var
	i:longint;
begin
	write('Updating Warehouse...');
	for i:=1 to mainShoppingCart.size do
	begin
		warehouseRemoveStock(mainShoppingCart.contents[i], mainWarehouse);
		warehouseUpdateSold(mainShoppingCart.contents[i], mainWarehouse);
	end;
	writeln('OK');
end;

procedure discountGrosir(var dc:real); //F14
var
	i : longint;
	Lprice : array [1..100] of real;
	Ltotprice : real;
begin	
	LtotPrice := 0;
	for i := 1 to mainShoppingCart.size do
	begin
		Lprice[i] := min( (shoppingCartItemTotalQuantity(mainShoppingCart.contents[i]) div 10) * warehouseFindByName(mainShoppingCart.contents[i].clothes.name, mainWarehouse).grosir_discount ,0.5) * shoppingCartItemTotalPrice(mainShoppingCart.contents[i]);
		LtotPrice := LtotPrice + Lprice [i];
	end;
	writeln('Total Diskon Grosir = Rp ', LtotPrice:0:2);
	dc := LtotPrice;
end;

procedure showTransaction(); //F15
begin
	sortByDate(mainTransactionPool);
	writeTransactionPool(mainTransactionPool);
end;

procedure retur(); //F16
var
	cl:Clothes;
	co:Courier;
	d,dNow:Date;
	t:Transaction;
	dc,courierFee:real;
begin
	readClothesByName(cl,mainWarehouse);
	readCourier(co,d);
	write('Tanggal hari ini  : ');readDate(dNow);
	if (dateDifference(d,dNow)) then
	begin
		deleteTransaction(cl,co,d,mainTransactionPool,t);
		if (t.shopping_cart_item.clothes.name <> '#') then
		begin
			dc := min( (shoppingCartItemTotalQuantity(t.shopping_cart_item) div 10) * warehouseFindByName(t.shopping_cart_item.clothes.name, mainWarehouse).grosir_discount ,0.5) * shoppingCartItemTotalPrice(t.shopping_cart_item);
			courierFee := courierFind(co,mainCourierPool).price_per_kg * shoppingCartItemTotalWeight(t.shopping_cart_item);
			write('Jumlah Uang Dikembalikan : Rp '); writeln(courierFee + shoppingCartItemTotalPrice(t.shopping_cart_item) - dc:0:2);
		end;
	end
	else
	begin
		writeln('Sudah lebih dari 14 hari, barang tidak dapat dikembalikan.');
	end;
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
	if (uc = 'showPopulars') then showPopulars()
	else 
	if (uc = 'showDetailProduct') then showDetailProduct()
	else 
	if (uc = 'searchClothesByKeyword') then searchClothesByKeyword()
	else 
	if (uc = 'sortPrice') then sortPrice()
	else 
	if (uc = 'filterClothes') then filterClothes()
	else 
	if (uc = 'filterByPrice') then filterByPrice()
	else 
	if (uc = 'showExpedition') then showExpedition()
	else 
	if (uc = 'addToCart') then addToCart()
	else 
	if (uc = 'removeFromCart') then removeFromCart()
	else 
	if (uc = 'calculatePrice') then calculatePrice()
	else 
	if (uc = 'checkout') then checkout()
	else
	if (uc = 'showTransaction') then showTransaction()
	else 
	if (uc = 'retur') then retur()
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
	repeat
		repeat
			prompt();
			readln(userCommand);
		until (validCommand(userCommand));
		branchBasedOn(userCommand);
	until (userCommand = 'exit'); //F17
	saveAll();
end.

