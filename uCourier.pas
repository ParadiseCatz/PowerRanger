unit uCourier;

interface
	
	type
		Courier = record
			name : String;
			type_of_service : String;
			destination_city : String;
			price_per_kg : real;
			delivery_time : integer;
		end;
			
	function courierCons(
		nm : String;
		tos : String;
		dc : String;
		ppk : real;
		dt : integer
	):Courier;

	function courierIsEqual(c1,c2:Courier):boolean;
	
implementation
	function courierCons(
		nm : String;
		tos : String;
		dc : String;
		ppk : real;
		dt : integer
	):Courier;
	begin
		courierCons.name := nm;
		courierCons.type_of_service := tos;
		courierCons.destination_city := dc;
		courierCons.price_per_kg := ppk;
		courierCons.delivery_time := dt;
	end;

	function courierIsEqual(c1,c2:Courier):boolean;
	begin
		courierIsEqual:=(c2.name=c2.name) and
						(c2.type_of_service=c2.type_of_service) and
						(c2.destination_city=c2.destination_city) and
						(c2.price_per_kg=c2.price_per_kg) and
						(c2.delivery_time=c2.delivery_time);
	end;
end.
