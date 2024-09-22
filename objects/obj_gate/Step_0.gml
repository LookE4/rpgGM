//match the state of the paired button obj
if instance_exists(button_obj) {
	state = button_obj.state;
}

//closed 
if state == 0 {
	mask_index = sprite_index;
} 

//opne 
if state == 1 {
	mask_index = spr_no_collision;
}

//reflect the state change
image_index = state;