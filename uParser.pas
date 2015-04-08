unit uParser;

interface
	type
		arString = array[1..1000] of string;
		Parser = Object
			function parseStringToArray(s:ansistring):arString;
		end;
implementation
	function Parser.parseStringToArray(s:ansistring):arString;
	var
		i, posAkhir, indexArray:longint;
		returnArray : arString;
	begin
		indexArray := 1;
		posAkhir := 1;
		for i:=1 to length(s) do
		begin
			if (s[i] = '|') then
			begin
				returnArray[indexArray] := copy(s, posAkhir, i-posAkhir-1);
				posAkhir := i+1;
				indexArray := indexArray +1;
			end;
		end;
		copy(returnArray[indexArray], posAkhir, length(s)-posAkhir);
		parseStringToArray := returnArray;
	end;
end.