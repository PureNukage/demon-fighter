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
var vaxis = gamepad_axis_value(0,gp_axislv)

//GUI Highlight 
var _x = 19
if gamepad_is_connected(0) == 0 {
	for(var i=0;i<3;i++) {
		if point_in_rectangle(mouse_x,mouse_y,_x,583,_x+118,654) {
			gui_socket[i,gui.selected] = 1
			gui_socket_top[i,gui.selected] = 0
			gui_socket_bottom[i,gui.selected] = 0
		} else if point_in_rectangle(mouse_x,mouse_y,_x-8,495,_x+134,582) {
			if point_in_rectangle(mouse_x,mouse_y,_x,503,_x+128,574) {
				gui_socket_top[i,gui.selected] = 1
				gui_socket_bottom[i,gui.selected] = 0
			}
		} else if point_in_rectangle(mouse_x,mouse_y,_x-8,655,_x+134,742) {
			if point_in_rectangle(mouse_x,mouse_y,_x,663,_x+128,734) {
				gui_socket_bottom[i,gui.selected] = 1
			}
		} else {
			gui_socket[i,gui.selected] = 0
			gui_socket_top[i,gui.selected] = 0
			gui_socket_bottom[i,gui.selected] = 0
		}
		_x += 128
	}
} else {
	//Checking for plugged in controller
	if gui_socket_selected == -1 {
		gui_socket_selected = 0	
	}
	if haxis == 1 or haxis == -1 {
		var where_we_going = gui_socket_selected + haxis
		if (where_we_going != -1 or where_we_going != 3) {
			gui_socket[gui_socket_selected,gui.selected] = 0
			gui_socket_selected = gui_socket_selected + haxis
			gui_socket[gui_socket_selected,gui.selected] = 1
		}
	} 
	
	if vaxis == 1 {
		if gui_socket_bottom[gui_socket_selected,gui.selected] == 1 {
			gui_socket_bottom[gui_socket_selected,gui.selected] = 0
		} else {
			gui_socket_top[gui_socket_selected,gui.selected] = 1
		}
	} else if vaxis == -1 {
		if gui_socket_bottom[gui_socket_selected,gui.selected] == 1 {
			gui_socket_bottom[gui_socket_selected,gui.selected] = 1
		} else {
			gui_socket_top[gui_socket_selected,gui.selected] = 0
		}
	} 
	
}