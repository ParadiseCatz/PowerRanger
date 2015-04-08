unit uWarehouseItem;

interface
	uses uClothes;
	
	type
		WarehouseItem = Object
			clothes : Clothes;
			s_stock : longint;
			m_stock : longint;
			l_stock : longint;
			xl_stock : longint;
			sold_quantity : longint;
			grosir_discount : real;

			constructor cons(
				c : Clothes;
				s : integer;
				m : integer;
				l : integer;
				xl : integer;
				sq : longint;
				gd : real
			);
			procedure tes;
		end;

implementation
	constructor WarehouseItem.cons(
		c : Clothes;
		s : integer;
		m : integer;
		l : integer;
		xl : integer;
		sq : longint;
		gd : real
	);
	begin
		clothes := c;
		s_stock := s;
		m_stock := m;
		l_stock := l;
		xl_stock := xl;
		sold_quantity := sq;
		grosir_discount := gd;
	end;

	procedure WarehouseItem.tes;
	begin
	
	end;
end.
