draw_self()

if highlight == true {
	var _highlight
	switch sprite_index 
	{
		case s_demon1: _highlight = s_demon1_highlight break;
		case s_demon2: _highlight = s_demon2_highlight break;
		case s_demon3: _highlight = s_demon3_highlight break;
	}
	draw_sprite(_highlight,0,x-32,y-32)	
}