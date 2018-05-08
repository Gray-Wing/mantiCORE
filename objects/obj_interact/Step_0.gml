
if (movedown == 1)
{
	vsp += .05;
	if (vsp == .5) {moveup = 1; movedown = 0; switched = 1;}
}
if (moveup == 1 && switched == 0)
{
	vsp -= .05;
	if (vsp == -.5) {moveup = 0; movedown = 1}
}

switched = 0;

y += vsp;
image_alpha = clamp(image_alpha + (fade * 0.2),0,1);

switch(MainState)
{
	case 0:
		sprite_index = spr_Empty
		break
	case 1:
		sprite_index = spr_interact_on;
		if (image_index >= 3) {MainState = 2;}
		break
	case 2:
		sprite_index = spr_interact;
		break
	case 3:
		sprite_index = spr_interact_out;
		if (image_index >= 3) {MainState = 0;}
		break
}

if(switchon == 1)
{
	MainState = 1;
	image_index = 0;
	switchon = 0;
}

if(switchoff == 1)
{
	MainState = 3;
	image_index = 0;
	switchoff = 0;
}