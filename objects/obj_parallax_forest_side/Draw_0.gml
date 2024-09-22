var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);

var _p0 = 1;
var _p1 = .8;
var _p2 = .6;
var _p3 = .4;

//sky
draw_sprite(spr_bg_forest_sidescroll, 0, _cam_x * _p0, _cam_y * _p0);

//mountais
//draw_sprite_tiled(spr_bg_forest_sidescroll, 1, _cam_x * _p1, _cam_y * _p1);

//treeline 1
//draw_sprite_tiled(spr_bg_forest_sidescroll, 2, _cam_x * _p2, _cam_y * _p2);

//treeline 2
//draw_sprite_tiled(spr_bg_forest_sidescroll, 3, _cam_x * _p3, _cam_y * _p3);