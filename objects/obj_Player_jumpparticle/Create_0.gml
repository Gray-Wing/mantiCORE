image_xscale = 1;
image_yscale = 1;

xscale = irandom_range(0,1);
switch(xscale)
{
	case 0:
		image_xscale = -1;
		break
	case 1:
		image_xscale = 1;
		break
}