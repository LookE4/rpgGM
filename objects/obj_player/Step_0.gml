right_key = keyboard_check(ord("D"));
left_key = keyboard_check(ord("A"));
up_key = keyboard_check(ord("W"));
down_key = keyboard_check(ord("S"));
interact_key_pressed = keyboard_check_pressed(vk_space);

//interact with push blocks
if interact_key_pressed == true {
	//find the 360 dgree direction to check for push blocks
	var _check_dir = face * 90;
	
	//see if we find a push block
	var _check_x = x + lengthdir_x(interact_dist, _check_dir);
	var _check_y = y + lengthdir_y(interact_dist, _check_dir);
	var _push_block_inst = instance_place(_check_x, _check_y, obj_push_block);
	
	//if there is a push block, tell it to slid and wich direction to slid
	if instance_exists(_push_block_inst) && _push_block_inst.sliding == false {
		_push_block_inst.sliding = true;
		_push_block_inst.face_dir = face;
	}
}

#region MOVMENT + DEPTH + SPRITE CONTROL
//get xpsd and yspd
xspd = (right_key - left_key) * move_spd;
yspd = (down_key - up_key) * move_spd;

//pause
if instance_exists(obj_pauser){
	xspd = 0;
	yspd = 0;
}

//set sprite
mask_index = sprite[DOWN];
if yspd == 0 {
	if xspd > 0 {face = RIGHT};
	if xspd < 0 {face = LEFT};
}

if xspd > 0 && face == LEFT {face = RIGHT}
if xspd < 0 && face == RIGHT {face = LEFT}

if xspd == 0 {
	if yspd > 0 {face = DOWN};
	if yspd < 0 {face = UP};
}

if yspd > 0 && face == UP {face = DOWN}
if yspd < 0 && face == DOWN {face = UP}

sprite_index = sprite[face];

//collisions
//x collision
if place_meeting(x + xspd, y, obj_wall) {
	xspd = 0;
}

//y collision
if place_meeting(x, y + yspd, obj_wall) {
	yspd = 0;
}

//move the player
x += xspd;
y += yspd;

//animate
if xspd == 0 && yspd == 0 {
	image_index = 0;
}

//depth
depth = -bbox_bottom;
#endregion