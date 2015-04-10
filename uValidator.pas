unit uValidator;

interface
	uses uConfig;

	function validCommand(command:string):boolean;

implementation
	function validCommand(command:string):boolean;
	var 
		i : integer;
		found : boolean;
	begin
		for i:=1 to COMMAND_NUMBER do
		begin
			if (COMMAND_LIST[i] = command) then
				found := true;
		end;
		if (not found) then
		begin
			writeln('Sorry, command not found');
		end;
		validCommand := found;
	end;
end.