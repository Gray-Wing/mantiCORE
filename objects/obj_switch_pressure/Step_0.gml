image_index = 0;
if (lockedoff == 0)
{
	if (place_meeting(x,y,obj_Player))
	{
		button_PRESSED = 1;
	}
	else {button_PRESSED = 0;}

	image_index = timepressed;

	if (button_PRESSED == 1)
	{
		if (timepressed < 15) {timepressed++;}
	}
	if (button_PRESSED == 0 && lockedon == 0) {timepressed = 0;}

	if (timepressed == 15)
	{
		lockedon = 1;	
	}

	if (lockedon == 1)
	{
		timepressed = 15;
		emitterInst.wiring_SIGNAL = 1;
	}
}