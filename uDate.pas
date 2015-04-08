unit uDate;

interface
	
	type
		Date = Object
			day : integer;
			month : integer;
			year : integer;
			
			constructor cons(
				d : integer;
				m : integer;
				y : integer
			);
			procedure tes;
		end;

implementation
	constructor Date.cons(
		d : integer;
		m : integer;
		y : integer
	);
	begin
		day := d;
		month := m;
		year := y;
	end;

	procedure Date.tes;
	begin
	
	end;
end.
