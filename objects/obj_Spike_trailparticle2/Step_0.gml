if (image_index == 3) {instance_destroy();}

image_alpha -= .2;

switch (global.spikedirection)
{
	case 1: {image_angle = 0; break;}
	case 2: {image_angle = 90; break;}
	case 3: {image_angle = 180; break;}
	case 4: {image_angle = 270; break;}
}