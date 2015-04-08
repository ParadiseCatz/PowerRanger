unit uCourierPool;

interface
	uses uCourier;
	
	type
		CourierPool = Object
			contents : array[1..30] of Courier;
			size : longint;

			constructor cons(
				c : array of Courier;
				sz : longint
			);
			procedure tes;
		end;

implementation
	constructor CourierPool.cons(
		c : array of Courier;
		sz : longint
	);
	begin
		contents := c;
		size := sz;
	end;

	procedure CourierPool.tes;
	begin
	
	end;
end.
