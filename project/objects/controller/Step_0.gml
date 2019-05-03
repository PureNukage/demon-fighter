if f1 {
	debug = !debug
}	
/*
if gamepad_axis_value(0,gp_axislh) {
	show_message("this is left.")
	}
if gamepad_axis_value(0,1) {
	show_message("this is right.")
	}
*/
	
	var haxis = gamepad_axis_value(0,gp_axislh)
if haxis == -1 { 
    show_message("left here")
} else if haxis == 1 {
    show_message("right here")    
}