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

end.
