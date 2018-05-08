alpha = clamp(alpha + (fade * 0.05),0,1);
draw_set_color(c_black);
draw_set_alpha(alpha);
draw_rectangle(
	camera_get_view_x(view_camera),
	camera_get_view_y(view_camera),
	camera_get_view_x(view_camera) + camera_get_view_width(view_camera),
	camera_get_view_y(view_camera) + camera_get_view_height(view_camera),
	0
) 
draw_set_alpha(1);
if (alpha == 1)
{
	cursor_sprite = spr_Empty;
	fade = 0;
}

if (fade == 0)
{
	count--;
	if (count == 0) {fade = -1;room_goto(targetLevel);}
}

if (alpha == 0 && fade == -1)
{
	instance_destroy();	
}

