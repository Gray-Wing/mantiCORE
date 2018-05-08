instance_create_depth(x+random_range(-10,10),y+random_range(-10,10),depth,obj_aqua_electricparticle);
instance_create_depth(x+random_range(-10,10),y+random_range(-10,10),depth,obj_aqua_electricparticle);
instance_create_depth(x+random_range(-10,10),y+random_range(-10,10),depth,obj_aqua_electricparticle);

angle = irandom_range(0,3)
switch(angle)
{
	case 0:
		image_angle = 0;
		break
	case 1:
		image_angle = 90;
		break
	case 2:
		image_angle = 180;
		break
	case 3:
		image_angle = 270;
		break
}