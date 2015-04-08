unit uLoader;

interface
	uses uParser, uWarehouse, uShoppingCart, uCourierPool, uTransactionPool, uClothes;

	type
		Loader = Object
			function loadWarehouse(filename:string):Warehouse;
		end;
implementation
var
	mainParser : Parser;
	selectedDatabase : textfile;
	size : longint;
	line : ansistring;
	t : arString;

	function Loader.loadWarehouse(filename:string):Warehouse;
	var 
		returnObject : Warehouse; 
		clothesInput : Clothes;
		r : array[0..50] of real;
		a : array[0..50] of longint;
	begin
		assign(selectedDatabase,filename);
		reset(selectedDatabase);
		size := 0;
		while not eof(selectedDatabase) do
		begin
			readln(selectedDatabase, line);
			t := mainParser.stringToArray(line);
			size := size + 1;
			val(t[5], r[1]);
			val(t[7], r[2]);
			val(t[13], r[3]);
			val(t[8], a[1]);
			val(t[9], a[2]);
			val(t[10], a[3]);
			val(t[11], a[4]);
			val(t[12], a[5]);
			clothesInput.cons(t[1], t[2], t[3], t[4], r[1], t[6], r[2]);
			returnObject.contents[size].cons(clothesInput, a[1], a[2], a[3], a[4], a[5], r[3]);
		end;
		returnObject.size := size;
		loadWarehouse := returnObject;
	end;
end.