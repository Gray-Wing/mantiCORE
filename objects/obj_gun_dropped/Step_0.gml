vsp+=grv;
hsp = hspconst;

if (collision_point(x+hsp,y,obj_Wall,false,false))
{
	while (!collision_point(x+sign(hsp),y,obj_Wall,false,false))
	{ x+=sign(hsp);}
	hsp = 0;
	vsp = 0;
	hit_wall = 1;
	
}

if (collision_point(x,y+vsp,obj_Wall,false,false))
{
	while (!collision_point(x,y+sign(vsp),obj_Wall,false,false))
	{ y+=sign(vsp);}
	vsp = 0;
	hsp = 0;
	hit_wall = 1;
	
	sprite_index = spr_Spike_static;
	
}

if (hit_wall = 1)
{
	grv = 0;
	hspconst = 0;
	
	instance_destroy();
	instance_create_depth(x,y,depth,obj_Knife_destroyparticle);
}

x += hsp;
y += vsp;