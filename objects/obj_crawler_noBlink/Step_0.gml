//indInst.x = x;
//indInst.y = y;
BlinkUp = !confused;
//indInst.image_index = BlinkUp;


hsp = 0;
vsp = 0;


switch (MainState)
{
	//idle/confused
	case 0:
		sprite_index = spr_crawler;
		speed = 0;
		image_angle = lookdirection_last;
		
		if (confused == 0 && collision_circle(x,y,detectRadius,obj_drawPlayer,false,false) && (!collision_line(x,y,obj_Player.x,obj_Player.y, obj_Wall,false,false)))
		{
			MainState = 1;
			instance_create_layer(x,y-32,"lay_Particles",obj_red_exclamparticle);
		}
		
		
		
		break
	//moving towards player
	case 1:
		if (!instance_exists(obj_drawPlayer))
		{MainState = 0; break;}
		speed = 0;
		move_towards_point(obj_Player.x,obj_Player.y,walksp)
		lasthspeed = hspeed;
		lastvspeed = vspeed;
		
		//if (collision_circle(x,y,dodge_radius,obj_Spike,false,false)&&BlinkUp = 1)
		//{
			
		//	tryCount = 0;
		//	BlinkUp = 0;
		//	alarm[1] = blink_cd;
		//	with(obj_Player)
		//	{
		//		do
		//		{
		//			other.tryCount++;
		//			other.teleX = x+lengthdir_x(distance_to_object(other),random_range(0,359))
		//			other.teleY = y+lengthdir_y(distance_to_object(other),random_range(0,359))
		//		} until (collision_point(other.teleX,other.teleY,obj_Floor,false,false)&&!collision_point(other.teleX,other.teleY,obj_Wall,false,false))
		//	}
			
		//	lastX = x;
		//	lastY = y;
			
			
			
		//	x = teleX;
		//	y = teleY;
			
		//	var TrailInst = instance_create_depth(x,y,depth+1,obj_crawler_trail);
		//	TrailInst.x1 = x;
		//	TrailInst.y1 = y;
		//	TrailInst.x2 = lastX;
		//	TrailInst.y2 = lastY;
		//	TrailInst.x3 = x;
		//	TrailInst.y3 = y;
		//	TrailInst.x4 = lastX;
		//	TrailInst.y4 = lastY;
		//	TrailInst.precision = 20;
		//}

		
		if (collision_point(x+lasthspeed,y,obj_Wall,false,false)||!collision_point(x+lasthspeed,y,obj_Floor,false,false))
		{
			hspeed = 0;	
		}
		if (collision_point(x,y+lastvspeed,obj_Wall,false,false)||!collision_point(x,y+lastvspeed,obj_Floor,false,false))
		{
			vspeed = 0;
		}
		
		sprite_index = spr_crawler_walk;
		image_angle = point_direction(x,y,obj_Player.x,obj_Player.y)
		
		lookdirection_last = image_angle;
		
		
		
		
		if (!collision_circle(x,y,undetect_radius,obj_drawPlayer,false,false)||collision_line(x,y,obj_Player.x,obj_Player.y, obj_Wall,false,false))
		{
			instance_create_layer(x,y-32,"lay_Particles",obj_red_questparticle);
			MainState = 0;
		}
		
		if (obj_Player.blinkedthisstep == 1)
		{
			confused = 1;
			instance_create_layer(x,y-32,"lay_Particles",obj_red_questparticle);
			alarm[0] = confuseTime;
			MainState = 0;

		}
		
		break
	//blinking
	case 2:
		break
	case 3:
		break
	case 4:
		break
	case 5:
		break
	case 6:
		break
}



//indInst.image_angle = image_angle;

//unstuck code
//left
if (collision_point(x-1,y,obj_Wall,false,false))
{
	WallInst = collision_point(x-1,y,obj_Wall,false,false);
	if (sign(hspeed) = 1)
	{
		if (WallInst.hsp > hspeed)
		{
			hspeed = WallInst.hsp;
		}
	}
	if (sign(hspeed) = -1)
	{
		if (WallInst.hsp > hspeed)
		{
			hspeed = WallInst.hsp;
		}
	}
	if (hspeed = 0)
	{
		if (WallInst.hsp > 0)
		{
			hspeed = WallInst.hsp;
		}
	}
}
//right
if (collision_point(x+1,y,obj_Wall,false,false))
{
	WallInst = collision_point(x+1,y,obj_Wall,false,false);
	if (sign(hspeed) = 1)
	{
		if (WallInst.hsp < hspeed)
		{
			hspeed = WallInst.hsp;
		}
	}
	if (sign(hspeed) = -1)
	{
		if (WallInst.hsp < hspeed)
		{
			hspeed = WallInst.hsp;
		}
	}
	if (hspeed = 0)
	{
		if (WallInst.hsp < 0)
		{
			hspeed = WallInst.hsp;
		}
	}
}
//down
if (collision_point(x,y+1,obj_Wall,false,false))
{
	WallInst = collision_point(x,y+1,obj_Wall,false,false);
	if (sign(vspeed) = 1)
	{
		if (WallInst.vsp < vspeed)
		{
			vspeed = WallInst.vsp;
		}
	}
	if (sign(vspeed) = -1)
	{
		if (WallInst.vsp < vspeed)
		{
			vspeed = WallInst.vsp;
		}
	}
	if (vspeed = 0)
	{
		if (WallInst.vsp < 0)
		{
			vspeed = WallInst.vsp;
		}
	}
}
//up
if (collision_point(x,y-1,obj_Wall,false,false))
{
	WallInst = collision_point(x,y-1,obj_Wall,false,false);
	if (sign(vspeed) = 1)
	{
		if (WallInst.vsp > vspeed)
		{
			vspeed = WallInst.vsp;
		}
	}
	if (sign(vspeed) = -1)
	{
		if (WallInst.vsp > vspeed)
		{
			vspeed = WallInst.vsp;
		}
	}
	if (vspeed = 0)
	{
		if (WallInst.vsp > 0)
		{
			vspeed = WallInst.vsp;
		}
	}
}



x += hsp;
y += vsp;

if (DIE == 10){instance_destroy();}

if (collision_point(x,y,obj_Wall,false,false)||!collision_point(x,y,obj_Floor,false,false))
{
	DIE++;
}
else{DIE = 0;}