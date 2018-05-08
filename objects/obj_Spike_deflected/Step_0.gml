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
	
	instance_create_depth(x+random_range(-10,10),y+random_range(-10,10),depth,obj_aqua_electricparticle);
	instance_create_depth(x+random_range(-10,10),y+random_range(-10,10),depth,obj_aqua_electricparticle);
	instance_create_depth(x+random_range(-10,10),y+random_range(-10,10),depth,obj_aqua_electricparticle);
	
	sprite_index = spr_Spike_static;
	
}

if (hit_wall = 1)
{
	grv = 0;
	hspconst = 0;
	
	sprite_index = spr_Spike_break;
	if (image_index > 4) {instance_destroy();}
}

x += hsp;
y += vsp;