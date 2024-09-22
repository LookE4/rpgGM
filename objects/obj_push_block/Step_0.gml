//what state are we in
//sliding or not
if sliding == false {
	//set out starting coordinates
	start_point_x = x;
	start_point_y = y;
	
	//reset movement speed
	xspd = 0;
	yspd = 0;
}

//get ground type
//were om recessed space
if place_meeting(x, y, obj_push_block_area) {
	pushblock_area = true;
} else {
	pushblock_area = false;
}

//were on ice 
if place_meeting(x, y, obj_ice_ground) {
	on_ice = true;
} else {
	on_ice = false;
}

//sliding 
if sliding == true {
	//get the actual 360 direction we should move in
	var _real_dir = face_dir * 90;
	
	//get our target coordinates
	var _target_x_dist = lengthdir_x(grid_space, _real_dir);
	var _target_y_dist = lengthdir_y(grid_space, _real_dir);
	target_x = start_point_x + _target_x_dist;
	target_y = start_point_y + _target_y_dist;
	
	//if on ice keep adding to coords until edge of ice wall
	if on_ice == true {
		//reset our target x and y
		target_x = start_point_x;
		target_y = start_point_y;
		
		//search each space ahead to make sure the is ice, and there is not a wall
		while place_meeting(target_x + _target_x_dist, target_y + _target_y_dist, obj_ice_ground)
		&& !place_meeting(target_x + _target_x_dist, target_y + _target_y_dist, obj_wall) {
			target_x += _target_x_dist;
			target_y += _target_y_dist;
		}
	}
	
	//set the speeds
	var _target_dist = point_distance(x, y, target_x, target_y);
	var _final_speed = min(move_spd, _target_dist);
	xspd = lengthdir_x(_final_speed, _real_dir);
	yspd = lengthdir_y(_final_speed, _real_dir);
	
	//cancel movement if were currently in a pushblock area but our target corrdinates arent
	if pushblock_area == true && !place_meeting(target_x, target_y, obj_push_block_area) {
		xspd = 0;
		yspd = 0;
	}
	
	//dont let the block move to a grid space that has a wall in it
	if place_meeting(target_x, target_y, obj_wall) {
		xspd = 0;
		yspd = 0;
	}
}

//move the block
x += xspd;
y += yspd;

//done with sliding
if xspd == 0 && yspd == 0 {
	sliding = false
}

//depth
depth = -bbox_bottom;