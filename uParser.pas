unit uParser; //Service

interface
	uses uDate;

	type
		arString = array[1..30] of string;
		Parser = Object
			function stringToArray(s:ansistring):arString;
			function stringToDate(s:ansistring):Date;
		end;
implementation
	function Parser.stringToArray(s:ansistring):arString;
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
				posAkhir := i+2;
				indexArray := indexArray +1;
			end;
		end;
		returnArray[indexArray] := copy(s, posAkhir, length(s)-posAkhir+1);
		stringToArray := returnArray;
	end;
	function Parser.stringToDate(s:ansistring):Date;
	var
		i, posAkhir, indexArray:longint;
		returnArray : array[0..50] of integer;
		returnDate : Date;
	begin
		indexArray := 1;
		posAkhir := 1;
		for i:=1 to length(s) do
		begin
			if (s[i] = '/') then
			begin
				val(copy(s, posAkhir, i-posAkhir), returnArray[indexArray]);
				posAkhir := i+1;
				indexArray := indexArray +1;
			end;
		end;
		val(copy(s, posAkhir, length(s)-posAkhir+1), returnArray[indexArray]);
		returnDate.day := returnArray[1];
		returnDate.month := returnArray[2];
		returnDate.year := returnArray[3];
		stringToDate := returnDate;
	end;
end.