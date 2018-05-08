/// @description Insert description here
// You can write your code in this editor

laserframe = 0;
deathlaserframe = 0;

isshooting = 0;

xlaser = 0;
ylaser = 0;

switch (image_angle)
{
	case 0:	xlaser = 1; ylaser = 0;
		break;
	case 90: xlaser = 0; ylaser = -1;
		break;
	case 180: xlaser = -1; ylaser = 0;
		break;
	case 270: xlaser = 0; ylaser = 1;
		break;
}

xstop = 0;
ystop = 0;

maxlength = 33;

for (i = 1; i < maxlength; i++)
{
	xstop = i*32*xlaser;
	ystop = i*32*ylaser;
	if (place_meeting(x+(i*32*xlaser),y+(i*32*ylaser), obj_Wall)) {break;}
	instance_create_layer(x+(i*32*xlaser), y+(i*32*ylaser), "lay_Spikes", obj_proj_laser)
}

shootcooldown = 90;
canlaser = 1;
preptime = 15;

hasseen = 0;

targetacq = 0;

alarm[3] = 6;
alarm[4] = 2;