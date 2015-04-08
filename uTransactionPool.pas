unit uTransactionPool;

interface
	uses uTransaction;
	
	type
		TransactionPool = Object
			contents : array[1..1000] of Transaction;
			size : longint;

			constructor cons(
				c : array of Transaction;
				sz : longint
			);
			procedure tes;
		end;

implementation
	constructor TransactionPool.cons(
		c : array of Transaction;
		sz : longint
	);
	begin
		contents := c;
		size := sz;
	end;

	procedure TransactionPool.tes;
	begin
	
	end;
end.
