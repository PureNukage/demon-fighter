//Variables
debug = false

//Colors
c_gui_background = make_color_rgb(20,92,52)
c_gui_foreground = make_color_rgb(93,176,92)
c_gui_highlight = make_color_rgb(129,204,128)
//c_gui_pressed = make_color_rgb()

//Gui Sockets
gui_socket[0,gui.text] = "Attack"
gui_socket[1,gui.text] = "Magic"
gui_socket[2,gui.text] = "Item"
gui_socket[0,gui.selected] = 0
gui_socket[1,gui.selected] = 0
gui_socket[2,gui.selected] = 0
gui_socket_top[0,gui.text] = "Defend"
gui_socket_top[0,gui.selected] = 0
gui_socket_top[1,gui.selected] = 0
gui_socket_bottom[0,gui.text] = "Change"
gui_socket_bottom[0,gui.selected] = 0

if gamepad_is_connected(0) == 0 {
	gui_socket_selected = -1
} else {
	gui_socket_selected = 0	
}

//Turn Order Sprites
gui_sprites[0] = s_demon1
gui_sprites[1] = s_demon2
gui_sprites[2] = s_demon3
gui_sprites[3] = s_demon4
scr_controls()

//audio_play_sound(sn_SandStorm,0,true)
