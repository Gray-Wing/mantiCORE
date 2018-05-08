KEY_LMB = mouse_check_button_pressed(mb_left)

if (isOpen == 0)
{
	if (position_meeting(mouse_x, mouse_y, id))
	{
		image_index = 1;
		if (KEY_LMB)
		{isOpen = 1;}
	}
	else {image_index = 0;}
}
if (isOpen == 1)
{
	isOpen = 0;
	image_index = 1;
	game_end();
}