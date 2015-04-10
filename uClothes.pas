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
			price : real;
		end;

	function clothesCons(
		nm : String;
		cat : String;
		gen : String;
		col : String;
		wght : real;
		mat : String;
		prc : real
	):Clothes;
		

implementation
	function clothesCons(
		nm : String;
		cat : String;
		gen : String;
		col : String;
		wght : real;
		mat : String;
		prc : real
	):Clothes;
	begin
		clothesCons.name := nm;
		clothesCons.category := cat;
		clothesCons.gender := gen;
		clothesCons.colour := col;
		clothesCons.weight := wght;
		clothesCons.material := mat;
		clothesCons.price := prc;
	end;
end.
