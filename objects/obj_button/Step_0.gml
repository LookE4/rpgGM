if place_meeting(x, y, obj_push_block) || place_meeting(x, y, obj_player) {
	state = 1;
} else {
	state = 0;
}

//show the button is pressed
image_index = state