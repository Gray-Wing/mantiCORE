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

instance_create_depth(x+random_range(-25,25),y+random_range(-25,25),depth,obj_red_electricparticle)
instance_create_depth(x+random_range(-25,25),y+random_range(-25,25),depth,obj_red_electricparticle)
instance_create_depth(x+random_range(-25,25),y+random_range(-25,25),depth,obj_red_electricparticle)