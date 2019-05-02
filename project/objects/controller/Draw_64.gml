draw_set_color(c_gui_background)
draw_rectangle(9,635,403,727,false)

var _x, _y
_x = 19
_y = 645    // _y2 = 716  128

for(var i=0;i<3;i++) {
	draw_set_color(c_gui_foreground)
	draw_rectangle(_x,645,_x+118,716,false)
	draw_set_color(c_black)
	draw_set_halign(fa_center)
	draw_text(_x+59,672,gui_socket[i])
	_x += 128
}

 draw_set_color(c_gui_background)
 draw_rectangle(9,89,97,627,false)
  
  var _x, _y
  _x = 13
  _y = 93
  
  for (var i=0;i<4;i++) {
    draw_set_color(c_gui_foreground)
	draw_rectangle(13,_y,93,_y+73,false)
	draw_sprite(gui_sprites[i],0,21,_y+3)
	_y += 79
		draw_set_halign(fa_left)
}
