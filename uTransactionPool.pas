unit uTransactionPool;

interface
	uses uTransaction;
	
	type
		TransactionPool = Object
			contents : array[1..1000] of Transaction;

			constructor cons(
				c : array of Transaction
			);
			procedure tes;
		end;

implementation
	constructor TransactionPool.cons(
		c : array of Transaction
	);
	begin
		contents := c;
	end;

	procedure TransactionPool.tes;
	begin
	
	end;
end.
