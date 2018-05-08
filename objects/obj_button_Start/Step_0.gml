KEY_LMB = mouse_check_button_pressed(mb_left)
KEY_ESC = keyboard_check_pressed(vk_escape)

if (isOpen == 0)
{
	if (position_meeting(mouse_x, mouse_y, id))
	{
		image_index = 1;
		if (KEY_LMB)
		{
			isOpen = 1;
			obj_button_settings.isOpen = 0;
			obj_button_quit.isOpen = 0;
		}
	}
	else {image_index = 0;}
}
if (isOpen == 1)
{
	image_index = 1;
	if (KEY_ESC)
	{
		isOpen = 0;
	}
}