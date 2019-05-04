#region Debug

if debug == true { 
	draw_set_color(c_gray)
	draw_rectangle(614,14,1009,220,false)
	
	draw_set_color(c_black)
	draw_text(630,25,"Gamepad Count: ")
	draw_text(913,25,string(gamepad_is_connected(0)))
	draw_text(630,40,"Gamepad Left-Axis Horizontal: ")
	draw_text(913,40,string(gamepad_axis_value(0,gp_axislh)))
}



#endregion

#region Combat Bar and Change/Defend

draw_set_color(c_gui_background)
draw_rectangle(9,575,395,662,false)

var _x, 
_x = 17

//Combat Bar
for(var i=0;i<3;i++) {
	if gui_socket[i,gui.selected] == 1 and gui_socket_top[i,gui.selected] == 0 {
		draw_set_color(c_gui_highlight)
	} else {
		draw_set_color(c_gui_foreground)
	}
	draw_rectangle(_x,583,_x+118,654,false)
	draw_set_color(c_black)
	draw_set_halign(fa_center)
	draw_text(_x+59,609,gui_socket[i,gui.text])
	_x += 128
}
 
//Change / Defend
var _x = 17
var _darkg, _lightg
_darkg[0] = 9
_darkg[1] = 136
_darkg[2] = 262

_lightg[0] = 17
_lightg[1] = 143
_lightg[2] = 269

for(var i=0;i<3;i++) {
	if (gui_socket[i,gui.selected] == 1) {
		draw_set_color(c_gui_background)
		draw_rectangle(_darkg[i],495,_darkg[i]+134,582,false)
		if gui_socket_top[i,gui.selected] == 1 {
			draw_set_color(c_gui_highlight)	
		} else {
			draw_set_color(c_gui_foreground)
		}
		draw_rectangle(_lightg[i],503,_lightg[i]+121,574,false)
		draw_set_color(c_black)
		draw_text(_lightg[i]+63,531,gui_socket_top[0,gui.text])
		
		draw_set_color(c_gui_background)
		draw_rectangle(_darkg[i],655,_darkg[i]+134,742,false)
		
		
		if gui_socket_bottom[i,gui.selected] == 1 {
			draw_set_color(c_gui_highlight)
		} else {
			draw_set_color(c_gui_foreground)	
		}
		draw_rectangle(_lightg[i],663,_lightg[i]+121,734,false)
		draw_set_color(c_black)
		draw_text(_lightg[i]+63,691,gui_socket_bottom[0,gui.text])
		
	}
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