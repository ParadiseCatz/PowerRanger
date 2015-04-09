unit uClothes;

interface
	
	type
		Clothes = record
			name : String;
			category : String;
			gender : String;
			colour : String;
			weight : real;
			material : String;
			price_per_kg : real;
		end;

	function clothesCons(
		nm : String;
		cat : String;
		gen : String;
		col : String;
		wght : real;
		mat : String;
		ppk : real
	):Clothes;
		

implementation
	function clothesCons(
		nm : String;
		cat : String;
		gen : String;
		col : String;
		wght : real;
		mat : String;
		ppk : real
	):Clothes;
	begin
		clothesCons.name := nm;
		clothesCons.category := cat;
		clothesCons.gender := gen;
		clothesCons.colour := col;
		clothesCons.weight := wght;
		clothesCons.material := mat;
		clothesCons.price_per_kg := ppk;
	end;
end.
