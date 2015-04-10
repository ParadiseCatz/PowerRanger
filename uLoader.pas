unit uLoader;

interface
	uses uParser, uWarehouse, uWarehouseItem, uShoppingCart, uCourierPool, uTransaction, uTransactionPool, uClothes, uShoppingCartItem, uCourier, uDate;

	function loadWarehouse(filename:string):Warehouse;
	function loadCourier(filename:string):CourierPool;
	function loadShoppingCart(filename:string):ShoppingCart;
	function loadTransaction(filename:string):TransactionPool;

implementation
var
	selectedDatabase : textfile;
	size : longint;
	line : ansistring;
	t : arString;

	function loadWarehouse(filename:string):Warehouse;
	var 
		returnObject : Warehouse; 
		clothesInput : Clothes;
		r : array[0..50] of real;
		a : array[0..50] of longint;
	begin
		write('Loading Warehouse...');
		assign(selectedDatabase,filename);
		reset(selectedDatabase);
		size := 0;
		while not eof(selectedDatabase) do
		begin
			readln(selectedDatabase, line);
			t := stringToArray(line);
			size := size + 1;
			val(t[5], r[1]);
			val(t[7], r[2]);
			val(t[13], r[3]);
			val(t[8], a[1]);
			val(t[9], a[2]);
			val(t[10], a[3]);
			val(t[11], a[4]);
			val(t[12], a[5]);
			clothesInput := clothesCons(t[1], t[2], t[3], t[4], r[1], t[6], r[2]);
			returnObject.contents[size] := warehouseItemCons(clothesInput, a[1], a[2], a[3], a[4], a[5], r[3]);
		end;
		returnObject.size := size;
		loadWarehouse := returnObject;
		writeln('OK');
	end;

	function loadCourier(filename:string):CourierPool;
	var 
		returnObject : CourierPool;
		r : array[0..50] of real;
		a : array[0..50] of longint;
	begin
		write('Loading Courier...');	
		assign(selectedDatabase,filename);
		reset(selectedDatabase);
		size := 0;
		while not eof(selectedDatabase) do
		begin
			readln(selectedDatabase, line);
			t := stringToArray(line);
			size := size + 1;
			val(t[4], r[1]);
			val(t[5], r[2]);
			returnObject.contents[size] := courierCons(t[1], t[2], t[3], r[1], r[2]);
		end;
		returnObject.size := size;
		loadCourier := returnObject;
		writeln('OK');
	end;

	function loadShoppingCart(filename:string):ShoppingCart;
	var 
		returnObject : ShoppingCart;
		clothesInput : Clothes;
		r : array[0..50] of real;
		a : array[0..50] of longint;
	begin
		write('Loading Shopping Cart...');
		assign(selectedDatabase,filename);
		reset(selectedDatabase);
		size := 0;
		while not eof(selectedDatabase) do
		begin
			readln(selectedDatabase, line);
			t := stringToArray(line);
			size := size + 1;
			val(t[3], r[1]);
			val(t[5], r[2]);
			val(t[6], a[1]);
			val(t[7], a[2]);
			val(t[8], a[3]);
			val(t[9], a[4]);
			clothesInput:= clothesCons(t[1], '', '', t[2], r[1], t[4], r[2]);
			returnObject.contents[size]:= shoppingCartItemCons(clothesInput, a[1], a[2], a[3], a[4]);
		end;
		returnObject.size := size;
		loadShoppingCart := returnObject;
		writeln('OK');
	end;

	function loadTransaction(filename:string):TransactionPool;
	var 
		returnObject : TransactionPool;
		clothesInput : Clothes;
		shoppingCartItemInput : ShoppingCartItem;
		shoppingCartInput : ShoppingCart;
		courierInput : Courier;
		dateInput : Date;
		r : array[0..50] of real;
		a : array[0..50] of longint;
	begin
		write('Loading Transaction...');
		assign(selectedDatabase,filename);
		reset(selectedDatabase);
		size := 0;
		while not eof(selectedDatabase) do
		begin
			readln(selectedDatabase, line);
			t := stringToArray(line);
			size := size + 1;
			val(t[3], r[1]);
			val(t[5], r[2]);
			val(t[6], a[1]);
			val(t[7], a[2]);
			val(t[8], a[3]);
			val(t[9], a[4]);
			clothesInput := clothesCons(t[1], '', '', t[2], r[1], t[4], r[2]);
			shoppingCartItemInput := shoppingCartItemCons(clothesInput, a[1], a[2], a[3], a[4]);
			shoppingCartInput.contents[1] := shoppingCartItemInput;
			shoppingCartInput.size := 1;
			val(t[13], r[3]);
			val(t[14], r[4]);
			courierInput := courierCons(t[10], t[11], t[12], r[3], r[4]);
			dateInput := stringToDate(t[15]);
			returnObject.contents[size] := transactionCons(shoppingCartInput, courierInput, dateInput);

		end;
		returnObject.size := size;
		loadTransaction := returnObject;
		writeln('OK');
	end;
end.