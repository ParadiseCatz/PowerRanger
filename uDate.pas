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

end.
