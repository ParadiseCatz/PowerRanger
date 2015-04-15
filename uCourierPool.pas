unit uCourierPool;

interface
	uses uCourier,uConfig;
	
	type
		CourierPool = record
			contents : array[1..ARRAY_LIMIT] of Courier;
			size : longint;
		end;

	function courierPoolCons(
		c : array of Courier;
		sz : longint
	):CourierPool;

	function courierFindByCity(city:string; cp:CourierPool):CourierPool;

implementation
	function courierPoolCons(
		c : array of Courier;
		sz : longint
	):CourierPool;
	begin
		courierPoolCons.contents := c;
		courierPoolCons.size := sz;
	end;

	function courierFindByCity(city:string; cp:CourierPool):CourierPool;
	var i:longint;
	begin
		courierFindByCity.size := 0;
		for i:=1 to cp.size do
		begin
			if (cp.contents[i].destination_city = city) then
			begin
				courierFindByCity.size := courierFindByCity.size + 1;
				courierFindByCity.contents[courierFindByCity.size] := cp.contents[i];
			end;
		end;
	end;

end.
