image_xscale = 1;
image_yscale = 1;

whichParticle = irandom_range(0,3)
switch(whichParticle)
{
	case 0:
		sprite_index = spr_red_electricParticle1;
		break
	case 1:
		sprite_index = spr_red_electricParticle2;
		break
	case 2:
		sprite_index = spr_red_electricParticle3;
		break
	case 3:
		sprite_index = spr_red_electricParticle4;
		break
}

angle = irandom_range(0,3);
switch(angle)
{
	case 0:
		image_angle = 0;
		break
	case 1:
		image_angle = 90;
		break
	case 2:
		image_angle = 180;
		break
	case 3:
		image_angle = 270;
		break
}