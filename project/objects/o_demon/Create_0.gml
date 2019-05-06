if x = 416+32 sprite_index = s_demon1
if x = 512+32 sprite_index = s_demon2
if x = 608+32 sprite_index = s_demon3

highlight = false

ds_queue_enqueue(controller.turn_queue,id)

ds_list_add(controller.my_demons,id)

hp = irandom_range(12,16)

unit = unit.friendly

