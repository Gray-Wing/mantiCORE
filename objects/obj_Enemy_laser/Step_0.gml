if (targetacq == 0 && canlaser == 1 && hasseen == 0)
{
	for (i = 1; i < maxlength; i++)
	{
		xstop = x + i*32*xlaser;
		ystop = y + i*32*ylaser;
		if (place_meeting(x+(i*32*xlaser),y+(i*32*ylaser), obj_Wall)) {break;}
		instance_create_layer(x+(i*32*xlaser), y+(i*32*ylaser), "lay_Spikes", obj_proj_laser)
	}	
}

if (collision_line(x,y,xstop, ystop, obj_drawPlayer, false, false) && targetacq == 0 && canlaser == 1 && hasseen == 0) 
{
	sprite_index = spr_Enemy_laser_prep;
	alarm[2] = preptime;
	hasseen = 1;
}

if (targetacq == 1) || (isshooting == 1)
{
	sprite_index = spr_Enemy_laser_shoot;
	isshooting = 1;
	for (i = 1; i < maxlength; i++)
	{
		if (place_meeting(x+(i*32*xlaser),y+(i*32*ylaser), obj_Wall)) {break;}
		laserInst = instance_create_layer(x+(i*32*xlaser), y+(i*32*ylaser), "lay_Enemies", obj_proj_deathLaser)
		with (laserInst)
		{
			image_angle = other.image_angle;
		}
	}
	if (targetacq == 1)
	{
		alarm[0] = shootcooldown;
		alarm[1] = 45;
	}
	targetacq = 0;
}



