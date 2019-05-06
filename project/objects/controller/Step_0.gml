scr_controls()

#region fframe 

switch fframe 
{
	case fframe.first: fframe = fframe.second break;
	case fframe.second: 
		turn_current = ds_queue_dequeue(turn_queue)
		fframe = fframe.third
	break;
	case fframe.third: break;
}

#endregion

if control {
	debug = !debug
}	

switch c_state 
{
	case c_state.free:
		#region State: Free
		//GUI Highlight 
		var _x = 19
		if gamepad_is_connected(0) == 0 {
			for(var i=0;i<3;i++) {
				if point_in_rectangle(mouse_x,mouse_y,_x,583,_x+118,654) {
					gui_socket[i,gui.selected] = 1
					gui_socket_top[i,gui.selected] = 0
					gui_socket_bottom[i,gui.selected] = 0
					if leftclick {
						switch(i)
						{
							case 0:	c_state = c_state.targeting break;	
						}
					}
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
			if (leftstick_h > 0.8 or leftstick_h < -0.8) and gui_scrollTimerCurrent == 0 {
				var input
				if (leftstick_h > 0.8) { input = 1 }
				if (leftstick_h < -0.8) { input = -1 }
				var where_we_going = gui_socket_selected + input
				if (where_we_going != -1 and where_we_going != 3) {
					#region Change / Defend back to 0
					if gui_socket_top[gui_socket_selected,gui.selected] == 1 {
						gui_socket_top[gui_socket_selected,gui.selected] = 0	
					}
					if gui_socket_bottom[gui_socket_selected,gui.selected] == 1 {
						gui_socket_bottom[gui_socket_selected,gui.selected] = 0 	
					}
					#endregion
					gui_socket[gui_socket_selected,gui.selected] = 0
					gui_socket_selected = gui_socket_selected + input
					gui_socket[gui_socket_selected,gui.selected] = 1
					gui_scrollTimerCurrent = gui_scrollTimer
				} else if (where_we_going == -1 or where_we_going == 3) {
					#region Change / Defend back to 0
					if gui_socket_top[gui_socket_selected,gui.selected] == 1 {
						gui_socket_top[gui_socket_selected,gui.selected] = 0	
					}
					if gui_socket_bottom[gui_socket_selected,gui.selected] == 1 {
						gui_socket_bottom[gui_socket_selected,gui.selected] = 0 	
					}
					#endregion
					if where_we_going == -1 {
						gui_socket[2,gui.selected] = 1
						gui_socket[gui_socket_selected,gui.selected] = 0
						gui_socket_selected = 2
					} else if where_we_going == 3 { 
						gui_socket[0,gui.selected] = 1
						gui_socket[gui_socket_selected,gui.selected] = 0
						gui_socket_selected = 0
					}
					gui_scrollTimerCurrent = gui_scrollTimer
				}
			} 
	
			if leftstick_v < -0.8 and gui_scrollTimerCurrent == 0 {
				if gui_socket_bottom[gui_socket_selected,gui.selected] == 1 {
					gui_socket_bottom[gui_socket_selected,gui.selected] = 0
				} else {
					gui_socket_top[gui_socket_selected,gui.selected] = 1
				}
				gui_scrollTimerCurrent = gui_scrollTimer
			} else if leftstick_v > 0.8 and gui_scrollTimerCurrent == 0 {
				if gui_socket_top[gui_socket_selected,gui.selected] == 1 {
					gui_socket_top[gui_socket_selected,gui.selected] = 0
				} else {
					gui_socket_bottom[gui_socket_selected,gui.selected] = 1
				}
				gui_scrollTimerCurrent = gui_scrollTimer
			} 
	
			if gui_scrollTimerCurrent > 0 gui_scrollTimerCurrent--
	
		}
		#endregion
	break;
	case c_state.targeting:		
		#region State: Targeting
		
		if rightclick {
			c_state = c_state.free	
		}
		
		if instance_position(mouse_x,mouse_y,all) {
			object_mouseover = instance_position(mouse_x,mouse_y,all)
			if (object_mouseover_previous != object_mouseover) { 
				object_mouseover_previous.highlight = false
				object_mouseover_previous = object_mouseover
			}
			if object_mouseover.unit == target_unitType {
				object_mouseover.highlight = true
				
				//Left-Click
				if leftclick {
					object_mouseover.hp -= 5
					
					turn_current.highlight = false
					
					ds_queue_enqueue(turn_queue,turn_current)
					turn_current = ds_queue_dequeue(turn_queue)
					
					object_mouseover.highlight = false
					
					c_state = c_state.free
				}
			}
			
		} else { 
			if object_mouseover != 0 {
				object_mouseover.highlight = false
				object_mouseover_previous = object_mouseover
				object_mouseover = 0
			} else { 
				object_mouseover_previous = 0	
			}
		}
		
		#endregion
		
	break;
}