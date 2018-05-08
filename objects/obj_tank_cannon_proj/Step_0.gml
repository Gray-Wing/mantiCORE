hsp = flysp*hmove + inertia*2;
vsp = flysp*vmove;

var TrailInst = instance_create_depth(x,y,vertex_usage_depth,obj_purple_trail)
TrailInst.lastX = prevX;
TrailInst.lastY = prevY;

//horizontal collision for obj_Wall
if (place_meeting(x+hsp,y,obj_Wall))
{
	while (!place_meeting(x+sign(hsp),y,obj_Wall))
	{
		x += sign(hsp);
	}
	instance_destroy();
}

//vertical collision for obj_Wall
if (place_meeting(x,y+vsp,obj_Wall))
{
	while (!place_meeting(x,y+sign(vsp),obj_Wall))
	{
		y += sign(vsp);
	}
	instance_destroy();
}

prevX = x;
prevY = y;

x += hsp;
y += vsp;

image_angle = point_direction(x,y,x + hsp, y + vsp)