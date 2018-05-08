

switch(MainState)
{
	//idle
	case 0:
		sprite_index = spr_Enemy_tank_idle;
		hmove = 0;
		break
	//move left
	case 1:
		hmove = -1;
		sprite_index = spr_Enemy_tank_moving;
		if (!place_meeting(x+(hmove*30),y+1,obj_Wall)||(place_meeting(x+hsp,y,obj_Wall)))
		{
			if (place_meeting(x+hsp,y,obj_Wall))
			{
				while (!place_meeting(x+sign(hsp),y,obj_Wall))
				{
					x += sign(hsp);
				}
			}
			hsp = 0;
			MainState = 0;
			alarm[0] = idleTime;
		}
		break
	//move right
	case 2:
		sprite_index = spr_Enemy_tank_moving;
		hmove = 1;
		if (!place_meeting(x+(hmove*30),y+1,obj_Wall)||(place_meeting(x+hsp,y,obj_Wall)))
		{
			if (place_meeting(x+hsp,y,obj_Wall))
			{
				while (!place_meeting(x+sign(hsp),y,obj_Wall))
				{
					x += sign(hsp);
				}
			}
			hsp = 0;
			MainState = 0;
			alarm[0] = idleTime;
		}
		break
	//stun
	case 3:
		alarm[0] = -1;
		hmove = 0;
		alarm[1] = STUN_TIME;
		sprite_index = spr_Enemy_tank_stun;
		shieldInst.sprite_index = spr_Empty;
		MainState = 4;
		weakspotInst.sprite_index = spr_Enemy_tank_weakspot;
		break
	//is stunned
	case 4:
		if(alarm[3] == -1){alarm[3] = stunparticlefreq;}
		if (sprite_index == spr_Enemy_tank_stun&&image_index > 2 ){image_index = 3;}
		leftModInst.MainState = 3;
		leftMod.alarm[0] = 30;
		rightModInst.MainState = 3;
		rightMod.alarm[0] = 30;
		hmove = 0;
		break
	//stun recover
	case 5:
		hmove = 0;
		if (sprite_index == spr_Enemy_tank_recover&&image_index > 2 )
		{
			weakspotInst.sprite_index = spr_Empty;
			shieldInst.sprite_index = spr_Enemy_tank_shield;
			MainState = 0;
			alarm[0] = 6;
			alarm[2] = STUN_RESIST_TIME;
		}
		break
	//create mods (only run once after creation)
	case 6:
		leftModInst = instance_create_depth(leftModx, leftMody, depth+1, leftMod);
		leftModInst.image_xscale = -1;
		rightModInst = instance_create_depth(rightModx, rightMody, depth+1, rightMod);
		MainState = 0;
		alarm[0] = idleTime;
}

with (leftModInst)
{
	if instance_place(x,y,obj_Spike)
	{
		spikeInst = instance_place(x,y,obj_Spike);
		if(spikeInst.image_angle = 0){other.pushRight = other.maxpush;}
		instance_destroy(spikeInst);
		
		if(other.canbestunned == 1)
		{
			alarm[0] = -1;
			other.MainState = 3;
			other.canbestunned = 0;
		}
	}
}
with (rightModInst)
{
	if instance_place(x,y,obj_Spike)
	{
		spikeInst = instance_place(x,y,obj_Spike);
		if(spikeInst.image_angle = 180){other.pushLeft = -1*other.maxpush;}
		instance_destroy(spikeInst);
		if(other.canbestunned == 1)
		{
			alarm[0] = -1;
			other.MainState = 3;
			other.canbestunned = 0;
		}
	}
}
with(weakspotInst)
{
	if instance_place(x,y,obj_Spike)
	{
		spikeInst=instance_place(x,y,obj_Spike);
		if(spikeInst.image_angle = 270)
		{
			
			other.DIE_ALREADY = 1;
		}
		instance_destroy(spikeInst);
	}
}

vsp += grv;
hsp = hmove*walksp+pushLeft+pushRight;

if (pushLeft < 0){pushLeft+=1;}
if (pushRight > 0){pushRight-=1;}

//horizontal collision for obj_Wall
if (place_meeting(x+hsp,y,obj_Wall))
{
	while (!place_meeting(x+sign(hsp),y,obj_Wall))
	{
		x += sign(hsp);
	}
	hsp = 0;
}

//vertical collision for obj_Wall
if (place_meeting(x,y+vsp,obj_Wall))
{
	while (!place_meeting(x,y+sign(vsp),obj_Wall))
	{
		y += sign(vsp);
	}
	vsp = 0;
}

//unstuck code
//left
if (instance_place(x-1,y,obj_Wall))
{
	WallInst = instance_place(x-1,y,obj_Wall);
	if (sign(hsp) = 1)
	{
		if (WallInst.hsp > hsp)
		{
			hsp = WallInst.hsp;
		}
	}
	if (sign(hsp) = -1)
	{
		if (WallInst.hsp > hsp)
		{
			hsp = WallInst.hsp;
		}
	}
	if (hsp = 0)
	{
		if (WallInst.hsp > 0)
		{
			hsp = WallInst.hsp;
		}
	}
}
//right
if (instance_place(x+1,y,obj_Wall))
{
	WallInst = instance_place(x+1,y,obj_Wall);
	if (sign(hsp) = 1)
	{
		if (WallInst.hsp < hsp)
		{
			hsp = WallInst.hsp;
		}
	}
	if (sign(hsp) = -1)
	{
		if (WallInst.hsp < hsp)
		{
			hsp = WallInst.hsp;
		}
	}
	if (hsp = 0)
	{
		if (WallInst.hsp < 0)
		{
			hsp = WallInst.hsp;
		}
	}
}
//down
if (instance_place(x,y+1,obj_Wall))
{
	WallInst = instance_place(x,y+1,obj_Wall);
	if (sign(vsp) = 1)
	{
		if (WallInst.vsp < vsp)
		{
			vsp = WallInst.vsp;
		}
	}
	if (sign(vsp) = -1)
	{
		if (WallInst.vsp < vsp)
		{
			vsp = WallInst.vsp;
		}
	}
	if (vsp = 0)
	{
		if (WallInst.vsp < 0)
		{
			vsp = WallInst.vsp;
		}
	}
}
//up
if (instance_place(x,y-1,obj_Wall))
{
	WallInst = instance_place(x,y-1,obj_Wall);
	if (sign(vsp) = 1)
	{
		if (WallInst.vsp > vsp)
		{
			vsp = WallInst.vsp;
		}
	}
	if (sign(vsp) = -1)
	{
		if (WallInst.vsp > vsp)
		{
			vsp = WallInst.vsp;
		}
	}
	if (vsp = 0)
	{
		if (WallInst.vsp > 0)
		{
			vsp = WallInst.vsp;
		}
	}
}

x += hsp;
y += vsp;

leftModInst.hsp = hsp;
rightModInst.hsp = hsp;

leftModx = x-17;
leftMody = y-2;

rightModx = x+17;
rightMody = y-2;

leftModInst.x = leftModx;
leftModInst.y = leftMody;

rightModInst.x = rightModx;
rightModInst.y = rightMody;

weakspotInst.x = x;
weakspotInst.y = y;

shieldInst.x = x;
shieldInst.y = y;

if (place_meeting(x,y,obj_Wall))
{
	instance_destroy();
}

if (DIE_ALREADY == 1)
{
	instance_destroy();	
}