if (place_meeting(x,y, obj_box)) 
{
	button_PRESSED = 1;
}
else {button_PRESSED = 0;}

switch (button_PRESSED)
{
	case 0:
		image_index = 0;
		with (indicatorInst) {sprite_index = spr_box_button_down_indX;}
		with (emitterInst) {wiring_SIGNAL = 0;}
		break
	case 1:
		image_index = 1;
		with (indicatorInst) {sprite_index = spr_box_button_down_indO;}
		with (emitterInst) {wiring_SIGNAL = 1;}
		break
}