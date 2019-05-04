scr_controls()

if control {
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
if gamepad_is_connected(0) == 0 {
	for(var i=0;i<3;i++) {
		if point_in_rectangle(mouse_x,mouse_y,_x,645,_x+118,716) {
			gui_socket[i,gui.selected] = 1
		} else {
			gui_socket[i,gui.selected] = 0	
		}
		_x += 128
	}
} else {
	if gui_socket_selected == -1 {
		gui_socket_selected = 0	
	}
	if haxis == 1 or haxis == -1 {
		if gui_socket_selected != 0 or gui_socket_selected != 3 {
			
			gui_socket[gui_socket_selected,gui.selected] = 0
			gui_socket_selected = gui_socket_selected + haxis
			gui_socket[gui_socket_selected,gui.selected] = 1
		}
	} 
}