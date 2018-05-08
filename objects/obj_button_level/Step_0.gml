KEY_LMB = mouse_check_button_pressed(mb_left)
alpha = clamp(alpha + (fade * 0.1), 0,1);
image_alpha = alpha;

with (levelNumInst) {levelNum = other.levelNum;}

completeStatus = statusVar;

switch (completeStatus)
{
	case 0:
		completeInst.image_index = 0;
		break
	case 1:	
		completeInst.image_index = 1;
		break
	case 2:	
		completeInst.image_index = 2;
		break
}

if (obj_button_Start.isOpen == 1)
{
	fade = 1;
	
	if (isOpen == 0)
	{
		if (position_meeting(mouse_x, mouse_y, id))
		{
			image_index = 1;
			if (KEY_LMB)
			{
				isOpen = 1;
				startLevel = 1;
				instance_create_layer(view_xport[0] + 480,view_yport[0] + 270,"lay_fade",obj_codeReset);
			} //Start level here
		}
		else {image_index = 0;}
	}
	else {isOpen = 0;}
	
	if (startLevel == 1)
	{
		startLevel = 0;
		fadeInst = instance_create_layer(x,y,"lay_fade",obj_next_fade);
		with (fadeInst)
		{
			targetLevel = other.level;	
		}
	}
}
else
{
	fade = -1;
}