direction = image_angle;
speed = flysp;

var ringInst = instance_create_depth(x,y,depth,obj_gun_ringparticle);
ringInst.image_angle = image_angle;

if(place_meeting(x+hspeed, y+vspeed, obj_Player)||collision_line(x,y,x+hspeed, y+vspeed,obj_Player,false,false))
{
	
	if(global.player_INVINCIBLE = 0)
	{
		obj_Player.kbxdir = sign(hspeed);
		obj_Player.kbydir = sign(vspeed);
		obj_drawPlayer.damagedir = point_direction(obj_Player.x,obj_Player.y,x,y);
		
		while (!place_meeting(x, y, obj_Player))
		{
			x += hspeed/100;
			y += vspeed/100;
		}
		global.player_TAKE_DAMAGE = 1;
		DIE = 1;
	}
}

if(place_meeting(x+hspeed, y+vspeed, obj_Wall)||collision_line(x,y,x+hspeed, y+vspeed,obj_Wall,false,false))
{
	while (!place_meeting(x, y, obj_Wall))
	{
		x += hspeed/100;
		y += vspeed/100;
	}
	DIE = 1;
}

var TrailInst = instance_create_depth(x,y,vertex_usage_depth,obj_knife_trail)
TrailInst.lastX = prevX;
TrailInst.lastY = prevY;

prevX = x;
prevY = y;

if (DIE == 1){instance_destroy();}