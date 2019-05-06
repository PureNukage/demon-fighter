if controller.turn_current = id {
	if timer > 0 timer--	
	highlight = true	
	if timer == 0 {
		var how_many_enemies = instance_number(o_demon)
		var whos_lucky = irandom_range(0,how_many_enemies-1)
		with (controller.my_demons[| whos_lucky]) {
			var damage = irandom_range(4,7)
			hp -= damage
			var popup = instance_create_layer(x,y,"Instances",o_popupText)
			popup.text = string(damage)
		}		
		
	with controller { 
		turn_current.highlight = false
					
		ds_queue_enqueue(turn_queue,turn_current)
		turn_current = ds_queue_dequeue(turn_queue)
	}
	timer = irandom_range(20,35)	
	}
}

if hp <= 0 {
	//Ded
	show_message("You won!")
	game_end()
	
}