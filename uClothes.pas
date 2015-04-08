unit uClothes;

interface
	
	type
		Clothes = Object
			name : String;
			category : String;
			gender : String;
			colour : String;
			weight : real;
			material : String;
			price_per_kg : real;
			
			constructor cons(
				nm : String;
				cat : String;
				gen : String;
				col : String;
				wght : real;
				mat : String;
				ppk : real
			);
			procedure tes;
		end;

implementation
	constructor Clothes.cons(
		nm : String;
		cat : String;
		gen : String;
		col : String;
		wght : real;
		mat : String;
		ppk : real
	);
	begin
		name := nm;
		category := cat;
		gender := gen;
		colour := col;
		weight := wght;
		material := mat;
		price_per_kg := ppk;
	end;

	procedure Clothes.tes;
	begin
	
	end;
end.
