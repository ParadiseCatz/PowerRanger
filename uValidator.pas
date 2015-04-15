unit uValidator;

interface
	uses uConfig, uParser, uAlgorithm, uWarehouseItem, uShoppingCartItem;

	function validCommand(command:string):boolean;
	function validAmountFromWarehouse(sci:ShoppingCartItem; wi:WarehouseItem):boolean;

implementation

	function getSimilarCommand(command:string):arString;
	var
		i,size:longint;
	begin
		size:=0;
		for i:=1 to COMMAND_NUMBER do
		begin
			if (editDistance(command,COMMAND_LIST[i]) <= 2) then
			begin
				size := size + 1;
				getSimilarCommand[size] := COMMAND_LIST[i];
			end;
		end;
		getSimilarCommand[size+1] := '#';
	end;

	function validCommand(command:string):boolean;
	var 
		i : integer;
		found : boolean;
		similarCommand : arString;
	begin
		for i:=1 to COMMAND_NUMBER do
		begin
			if (COMMAND_LIST[i] = command) then
				found := true;
		end;
		if (not found) then
		begin
			writeln('Sorry, command not found');
			similarCommand := getSimilarCommand(command);
			if (similarCommand[1] = '#') then
			begin
				writeln('Try "help" for more information');
			end
			else
			begin
				writeln('Did you mean:');
				i:=1;
				while (similarCommand[i] <> '#') do
				begin
					writeln('- ',similarCommand[i]);
					i:=i+1;
				end;
			end;
		end;
		validCommand := found;
	end;

	function validAmountFromWarehouse(sci:ShoppingCartItem; wi:WarehouseItem):boolean;
	begin
		validAmountFromWarehouse := (wi.s_stock <= sci.s_quantity) and (wi.m_stock <= sci.m_quantity) and (wi.l_stock <= sci.l_quantity) and (wi.xl_stock <= sci.xl_quantity);
	end;

end.