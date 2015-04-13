unit uAlgorithm;

interface

	function max(a, b:longint):longint;
	function max(a, b:real):real;
	function min(a, b:longint):longint;
	function min(a, b:real):real;
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

	function min(a, b:longint):longint;
	begin
		if (a>b) then
			min:=b
		else
			min:=a;
	end;

	function min(a, b:real):real;
	begin
		if (a>b) then
			min:=b
		else
			min:=a;
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

	function editDistance(s, t: string): longint;
	var
		d: array of array of integer;
		i, j, n, m: integer;
	begin
	n := length(t);
	m := length(s);
	SetLength(d, m+1, n+1);

	for i:=0 to m do
		d[i,0] := i;
	for j:=0 to n do
		d[0,j] := j;

	for j:=1 to n do
		for i:=1 to m do
			if (s[i] = t[j]) then  
				d[i,j] := d[i-1,j-1]
			else
				d[i,j] := min(d[i-1,j] + 1, min(d[i,j-1] + 1, d[i-1,j-1] + 1));
	editDistance := d[m,n];
	end;
end.