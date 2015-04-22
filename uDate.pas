unit uDate;

interface
	
	type
		Date = record
			day : integer;
			month : integer;
			year : integer;
		end;

	function dateCons(
		d : integer;
		m : integer;
		y : integer
	):Date;

	function isKabisat(y:integer):boolean;
	function dayInMonth(m:integer;y:integer):integer;
	function addDate(startDay:Date;add:integer):Date;
	function compareDate(d1,d2:Date):boolean;
	function dateDifference(d1,d2:Date):boolean;
	function dateIsEqual(d1,d2:Date):boolean;

implementation
	function dateCons(
		d : integer;
		m : integer;
		y : integer
	):Date;
	begin
		dateCons.day := d;
		dateCons.month := m;
		dateCons.year := y;
	end;

	function isKabisat(y:integer):boolean;
	begin
		isKabisat:=(y mod 400=0) or ((y mod 100<>0) and (y mod 4=0));
	end;

	function dayInMonth(m:integer;y:integer):integer;
	var
		returnDay:integer;
	begin
		case m of
			1,3,5,7,8,10,12: returnDay:=31;
			4,6,9,11: returnDay:=30;
			2:if isKabisat(y) then returnDay:=29 else returnDay:=28;
		end;

		dayInMonth:=returnDay;
	end;

	function addDate(startDay:Date;add:integer):Date;
	var
		d:Date;
	begin
		d:=startDay;
		d.day:=d.day+add;

		while (d.day>dayInMonth(d.month,d.year)) do
		begin
			d.day:=d.day-dayInMonth(d.month,d.year);
			if (d.month=12) then
			begin
				d.month:=1;
				d.year:=d.year+1;
			end
			else
			begin
				d.month:=d.month+1;
			end;
		end;
		addDate:=d;
	end;

	function compareDate(d1,d2:Date):boolean;
	var
		returnVal:boolean;
	begin
		if (d1.year<>d2.year) then
		begin
			returnVal:=(d1.year>=d2.year);
		end
		else if (d1.month<>d2.month) then
		begin
			returnVal:=(d1.month>=d2.month);
		end
		else
		begin
			returnVal:=(d1.day>=d2.day);
		end;

		compareDate:=returnVal;
	end;

	function dateDifference(d1,d2:Date):boolean;
	begin
		dateDifference:=compareDate(addDate(d1,14),d2);
	end;

	function dateIsEqual(d1,d2:Date):boolean;
	begin
		dateIsEqual:=(d1.year=d2.year) and (d1.month=d2.month) and (d1.day=d2.day);
	end;
end.
