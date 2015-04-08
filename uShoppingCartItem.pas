unit uShoppingCartItem;

interface
	uses uClothes;
	
	type
		ShoppingCartItem = Object
			clothes : Clothes;
			s_quantity : longint;
			m_quantity : longint;
			l_quantity : longint;
			xl_quantity : longint;

			constructor cons(
				c : Clothes;
				s : integer;
				m : integer;
				l : integer;
				xl : integer
			);
			procedure tes;
		end;

implementation
	constructor ShoppingCartItem.cons(
		c : Clothes;
		s : integer;
		m : integer;
		l : integer;
		xl : integer
	);
	begin
		clothes := c;
		s_quantity := s;
		m_quantity := m;
		l_quantity := l;
		xl_quantity := xl;
	end;

	procedure ShoppingCartItem.tes;
	begin
	
	end;
end.
