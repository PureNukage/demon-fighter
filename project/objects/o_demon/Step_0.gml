if (highlight == false and controller.turn_current = id) {
	highlight = true	
} 

if hp <= 0 {
	//Ded 
	
	ds_list_delete(controller.my_demons,ds_list_find_index(controller.my_demons,id))
	
	instance_destroy()
	
}