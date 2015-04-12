unit uShoppingCartItem;

interface
	uses uClothes;
	
	type
		ShoppingCartItem = record
			clothes : Clothes;
			s_quantity : longint;
			m_quantity : longint;
			l_quantity : longint;
			xl_quantity : longint;
		end;

	function shoppingCartItemCons(
		c : Clothes;
		s : integer;
		m : integer;
		l : integer;
		xl : integer
	):ShoppingCartItem;

	function totalItemQuantity(sci : ShoppingCartItem):longint;
	function totalItemWeight(sci : ShoppingCartItem):real;
	function totalItemPrice(sci:ShoppingCartItem):real;

implementation
	function shoppingCartItemCons(
		c : Clothes;
		s : integer;
		m : integer;
		l : integer;
		xl : integer
	):ShoppingCartItem;
	begin
		shoppingCartItemCons.clothes := c;
		shoppingCartItemCons.s_quantity := s;
		shoppingCartItemCons.m_quantity := m;
		shoppingCartItemCons.l_quantity := l;
		shoppingCartItemCons.xl_quantity := xl;
	end;

	function totalItemQuantity(sci:ShoppingCartItem):longint;
	begin
		totalQuantity:=sci.s_quantity+sci.m_quantity+sci.l_quantity+sci.xl_quantity;
	end;

	function totalItemWeight(sci:ShoppingCartItem):real;
	begin
		totalItemWeight:=totalQuantity(sci)*sci.clothes.weight;
	end;

	function totalItemPrice(sci:ShoppingCartItem):real;
	begin
		totalItemPrice:=totalQuantity(sci)*sci.clothes.price;
	end;
end.
