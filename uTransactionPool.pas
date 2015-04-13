unit uTransactionPool;

interface
	uses uTransaction,uConfig,uAlgorithm,uDate;
	
	type
		TransactionPool = record
			contents : array[1..ARRAY_LIMIT] of Transaction;
			size : longint;
		end;
		
	function transactionPoolCons(
		c : array of Transaction;
		sz : longint
	):TransactionPool;
	
	procedure sortByDate(tp : TransactionPool);

implementation
	function transactionPoolCons(
		c : array of Transaction;
		sz : longint
	):TransactionPool;
	begin
		transactionPoolCons.contents := c;
		transactionPoolCons.size := sz;
	end;

	procedure sortByDate(tp : TransactionPool);
	var
		i,j:integer;
	begin
		for i:=1 to tp.size do
		begin
			for j:=i+1 to tp.size do
			begin
				if (compareDate(tp.contents[j-1].delivery_date,tp.contents[j].delivery_date)) then
				begin
					swap(tp.contents[j-1],tp.contents[j]);
				end;
			end;
		end;
	end;

end.
