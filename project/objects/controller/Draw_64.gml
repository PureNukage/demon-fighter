#region Debug

if debug == true { 
	draw_set_color(c_gray)
	draw_rectangle(614,14,1009,220,false)
	
	draw_set_color(c_black)
	draw_text(630,25,"Gamepad Count: ")
	draw_text(913,25,string(gamepad_get_device_count()))
	draw_text(630,40,"Gamepad Left-Axis Horizontal: ")
	draw_text(913,40,string(gamepad_axis_value(0,gp_axislh)))
}



#endregion

#region Combat Bar

draw_set_color(c_gui_background)
draw_rectangle(9,635,403,727,false)

var _x, 
_x = 19

for(var i=0;i<3;i++) {
	if gui_socket[i,gui.selected] == 1 {
		draw_set_color(c_gui_highlight)
	} else {
		draw_set_color(c_gui_foreground)
	}
	draw_rectangle(_x,645,_x+118,716,false)
	draw_set_color(c_black)
	draw_set_halign(fa_center)
	draw_text(_x+59,672,gui_socket[i,gui.text])
	_x += 128
}

#endregion

#region Turn Bar

draw_set_color(c_gui_background)
draw_rectangle(9,89,97,410,false)
  
var _x, _y
_y = 93
  
for (var i=0;i<4;i++) {
	draw_set_color(c_gui_foreground)
	draw_rectangle(13,_y,93,_y+73,false)
	draw_sprite(gui_sprites[i],0,21,_y+3)
	_y += 79
}

#endregion

draw_set_halign(fa_left)