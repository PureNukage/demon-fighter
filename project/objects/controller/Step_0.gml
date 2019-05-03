if f1 {
	debug = !debug
}	

//Controller
var haxis = gamepad_axis_value(0,gp_axislh)
if haxis == -1 { 
	show_message("left here")
} else if haxis == 1 {
	show_message("right here")	
}

//GUI Highlight 
var _x = 19
for(var i=0;i<3;i++) {
	if point_in_rectangle(mouse_x,mouse_y,_x,645,_x+118,716) {
		gui_socket[i,gui.selected] = 1
	} else {
		gui_socket[i,gui.selected] = 0	
	}
	_x += 128
}