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


implementation
	function courierPoolCons(
		c : array of Courier;
		sz : longint
	):CourierPool;
	begin
		courierPoolCons.contents := c;
		courierPoolCons.size := sz;
	end;

end.
