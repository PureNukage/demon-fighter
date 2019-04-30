if mouse_check_button_pressed(mb_left) and instance_position(mouse_x,mouse_y,id) {
	switch(sprite_index)
	{
		case s_demon1:
			sprite_index = s_demon2
		break;
		case s_demon2:
			sprite_index = s_demon1
		break;
	}
}