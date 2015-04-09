unit uWarehouseItem;

interface
	uses uClothes;
	
	type
		WarehouseItem = record
			clothes : Clothes;
			s_stock : longint;
			m_stock : longint;
			l_stock : longint;
			xl_stock : longint;
			sold_quantity : longint;
			grosir_discount : real;
		end;

	function warehouseItemCons(
		c : Clothes;
		s : integer;
		m : integer;
		l : integer;
		xl : integer;
		sq : longint;
		gd : real
	):WarehouseItem;


implementation
	function warehouseItemCons(
		c : Clothes;
		s : integer;
		m : integer;
		l : integer;
		xl : integer;
		sq : longint;
		gd : real
	):WarehouseItem;
	begin
		warehouseItemCons.clothes := c;
		warehouseItemCons.s_stock := s;
		warehouseItemCons.m_stock := m;
		warehouseItemCons.l_stock := l;
		warehouseItemCons.xl_stock := xl;
		warehouseItemCons.sold_quantity := sq;
		warehouseItemCons.grosir_discount := gd;
	end;

end.
