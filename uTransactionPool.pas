unit uTransactionPool;

interface
	uses uTransaction;
	
	type
		TransactionPool = record
			contents : array[1..1000] of Transaction;
			size : longint;
		end;
		
		function cons(
			c : array of Transaction;
			sz : longint
		):TransactionPool;

		procedure tes;
		

implementation
	function cons(
		c : array of Transaction;
		sz : longint
	):TransactionPool;
	begin
		cons.contents := c;
		cons.size := sz;
	end;

	procedure TransactionPool.tes;
	begin
	
	end;
end.
