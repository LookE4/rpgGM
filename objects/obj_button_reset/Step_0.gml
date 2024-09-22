//check collision to a player or a push block and set the state
if place_meeting(x, y, obj_player) || place_meeting(x, y, obj_push_block) {
	state = 1;
} else {
	state = 0;
}

//see if the state is one and reset the position(s) of the block(s)
if state == 1 {
	with (obj_push_block) {
		x = xstart;
		y = ystart;
	}
}

//show the button correct sprite
image_index = state;