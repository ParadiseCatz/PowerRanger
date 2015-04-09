unit uCourier;

interface
	
	type
		Courier = record
			name : String;
			type_of_service : String;
			destination_city : String;
			price_per_kg : real;
			delivery_time : real;
		end;
			
	function courierCons(
		nm : String;
		tos : String;
		dc : String;
		ppk : real;
		dt : real
	):Courier;


implementation
	function courierCons(
		nm : String;
		tos : String;
		dc : String;
		ppk : real;
		dt : real
	):Courier;
	begin
		courierCons.name := nm;
		courierCons.type_of_service := tos;
		courierCons.destination_city := dc;
		courierCons.price_per_kg := ppk;
		courierCons.delivery_time := dt;
	end;
end.
