grv = .5;
hspconst = random_range(-3,3);

instance_create_depth(x+random_range(-16,16),y+random_range(-16,16),depth-1,obj_red_electricparticle);
instance_create_depth(x+random_range(-10,10),y+random_range(-10,10),depth-1,obj_red_electricparticle);
instance_create_depth(x+random_range(-16,16),y+random_range(-10,16),depth-1,obj_red_electricparticle);


vsp = random_range(-3,-10);

hit_wall = 0;