unit uParser; //Service

interface
	uses uDate,uConfig;

	type
		arString = array[1..ARRAY_LIMIT] of string;

	function stringToArray(s:ansistring):arString;
	function stringToDate(s:ansistring):Date;
	function arrayToString(ar:arString;sz:integer):ansistring;
	function dateToString(d:date):ansistring;

implementation
	function stringToArray(s:ansistring):arString;
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

	function stringToDate(s:ansistring):Date;
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

	function arrayToString(ar:arString;sz:integer):ansistring;
	var
		i:integer;
		returnString:ansistring;
	begin
		for i:=1 to sz-1 do
		begin
			returnString:=returnString+ar[i]+' | ';
		end;
		returnString:=returnString+ar[sz];
		arrayToString:=returnString;
	end;

	function dateToString(d:date):ansistring;
	var day, month, year : string;
	begin
		str(d.day, day);
		str(d.month, month);
		str(d.year, year);
		dateToString:= day +'/'+ month +'/'+ year;
	end;

end.