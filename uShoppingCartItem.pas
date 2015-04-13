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

	function shoppingCartItemTotalQuantity(sci : ShoppingCartItem):longint;
	function shoppingCartItemTotalWeight(sci : ShoppingCartItem):real;
	function shoppingCartItemTotalPrice(sci:ShoppingCartItem):real;

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

	function shoppingCartItemTotalQuantity(sci:ShoppingCartItem):longint;
	begin
		shoppingCartItemTotalQuantity:=sci.s_quantity+sci.m_quantity+sci.l_quantity+sci.xl_quantity;
	end;

	function shoppingCartItemTotalWeight(sci:ShoppingCartItem):real;
	begin
		shoppingCartItemTotalWeight:=shoppingCartItemTotalQuantity(sci)*sci.clothes.weight;
	end;

	function shoppingCartItemTotalPrice(sci:ShoppingCartItem):real;
	begin
		shoppingCartItemTotalPrice:=shoppingCartItemTotalQuantity(sci)*sci.clothes.price;
	end;
end.
