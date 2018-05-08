image_xscale = 1.3;
image_yscale = 1.3;

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