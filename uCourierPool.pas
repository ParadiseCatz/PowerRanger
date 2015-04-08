unit uCourierPool;

interface
	uses uCourier;
	
	type
		CourierPool = Object
			contents : array[1..1000] of Courier;

			constructor cons(
				c : array of Courier
			);
			procedure tes;
		end;

implementation
	constructor CourierPool.cons(
		c : array of Courier
	);
	begin
		contents := c;
	end;

	procedure CourierPool.tes;
	begin
	
	end;
end.
