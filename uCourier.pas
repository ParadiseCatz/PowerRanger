unit uCourier;

interface
	
	type
		Courier = Object
			name : String;
			type_of_service : String;
			destination_city : String;
			price_per_kg : String;
			delivery_time : real;
			
			constructor cons(
				nm : String;
				tos : String;
				dc : String;
				ppk : String;
				dt : real
			);
			procedure tes;
		end;

implementation
	constructor Courier.cons(
		nm : String;
		tos : String;
		dc : String;
		ppk : String;
		dt : real
	);
	begin
		name := nm;
		type_of_service := tos;
		destination_city := dc;
		price_per_kg := ppk;
		delivery_time := dt;
	end;

	procedure Courier.tes;
	begin
	
	end;
end.
