if (place_meeting(x,y,obj_drawPlayer))
{
	interactInst.fade = 1;
	if (instance_exists(obj_Player))
	{
		//if player interacts with node
		if(obj_Player.KEY_ENTER)
		{
			instance_create_depth(x,y,depth+1,obj_leverparticle);
			leverSwitch = 1;
		}
	}
}
else
{
	interactInst.fade = -1;
}

if (leverSwitch == 1)
{
	switch (isOn)
	{
		case 0:
			isOn = 1;
			break
		case 1:
			isOn = 0;
			break
	}
	
	leverSwitch = 0;	
}

switch (isOn)
{
	case 0:
		button_PRESSED = 0;
		image_index = 0;
		with (emitterInst) {wiring_SIGNAL = 0;}
		break
	case 1:
		button_PRESSED = 1;
		image_index = 1;
		with (emitterInst) {wiring_SIGNAL = 1;}
		break
}