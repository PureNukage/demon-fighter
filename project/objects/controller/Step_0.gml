scr_controls()

if control {
	debug = !debug
}	

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
		gui_socket[0,gui.selected] = 1
	}
	if (leftstick_h > 0.8 or leftstick_h < -0.8) and gui_scrollTimer == 0 {
		var input
		if (leftstick_h > 0.8) { input = 1 }
		if (leftstick_h < -0.8) { input = -1 }
		var where_we_going = gui_socket_selected + input
		if (where_we_going != -1 and where_we_going != 3) {
			//Change / Defend back to 0
			if gui_socket_top[gui_socket_selected,gui.selected] == 1 {
				gui_socket_top[gui_socket_selected,gui.selected] = 0	
			}
			if gui_socket_bottom[gui_socket_selected,gui.selected] == 1 {
				gui_socket_bottom[gui_socket_selected,gui.selected] = 0 	
			}
			gui_socket[gui_socket_selected,gui.selected] = 0
			gui_socket_selected = gui_socket_selected + input
			gui_socket[gui_socket_selected,gui.selected] = 1
			gui_scrollTimer = 10
		}
	} 
	
	if leftstick_v < -0.8 and gui_scrollTimer == 0 {
		if gui_socket_bottom[gui_socket_selected,gui.selected] == 1 {
			gui_socket_bottom[gui_socket_selected,gui.selected] = 0
		} else {
			gui_socket_top[gui_socket_selected,gui.selected] = 1
		}
		gui_scrollTimer = 10
	} else if leftstick_v > 0.8 and gui_scrollTimer == 0 {
		if gui_socket_top[gui_socket_selected,gui.selected] == 1 {
			gui_socket_top[gui_socket_selected,gui.selected] = 0
		} else {
			gui_socket_bottom[gui_socket_selected,gui.selected] = 1
		}
		gui_scrollTimer = 10
	} 
	
	if gui_scrollTimer > 0 gui_scrollTimer--
	
}