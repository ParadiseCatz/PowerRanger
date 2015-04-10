unit uTransactionPool;

interface
	uses uTransaction,uConfig;
	
	type
		TransactionPool = record
			contents : array[1..ARRAY_LIMIT] of Transaction;
			size : longint;
		end;
		
	function transactionPoolCons(
		c : array of Transaction;
		sz : longint
	):TransactionPool;
		

implementation
	function transactionPoolCons(
		c : array of Transaction;
		sz : longint
	):TransactionPool;
	begin
		transactionPoolCons.contents := c;
		transactionPoolCons.size := sz;
	end;

end.
