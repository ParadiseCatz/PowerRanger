unit uAlgorithm;

interface

	function max(a, b:longint):longint;
	function max(a, b:real):real;
	function stringMatching(text, pattern:string):boolean;

implementation
	function max(a, b:longint):longint;
	begin
		if (a<b) then
			max:=b
		else
			max:=a;
	end;

	function max(a, b:real):real;
	begin
		if (a<b) then
			max:=b
		else
			max:=a;
	end;

	function stringMatching(text, pattern:string):boolean;
	var
		i, j, n, m, t : longint;
		P : array of integer;
		found : boolean;
	begin
		n:= length(text);
		m:= length(pattern);
		SetLength(P, m+5);
		P[0]:=0; P[1]:=0; t:=0;
		for j:=2 to m do
		begin
			while (t>0) and (pattern[t+1]<>pattern[j]) do t:=P[t];
			if pattern[t+1]=pattern[j] then t:=t+1;
			P[j]:=t;
		end;
		i:=1; j:=0; found:=False;
		while (i<=n-m+1) and (not found) do
		begin
			j:=P[j];
			while ((j<m)and(pattern[j+1]=text[i+j])) do j:=j+1;
			if j=m then found:=True;
			i:=i+max(1,j-P[j]);
		end;
		stringMatching := found;
	end;
end.