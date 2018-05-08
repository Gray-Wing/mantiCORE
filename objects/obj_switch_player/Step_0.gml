if (place_meeting(x,y,obj_Player))
{
	button_PRESSED = 1;
	image_index = 1;
	with (emitterInst) {wiring_SIGNAL = 1;}
}
else
{
	button_PRESSED = 0;
	image_index = 0;
	with (emitterInst) {wiring_SIGNAL = 0;}
}