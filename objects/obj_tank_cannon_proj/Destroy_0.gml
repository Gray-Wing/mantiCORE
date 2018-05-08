var xpl1 = instance_create_layer(x+random_range(-5,5),y+random_range(-5,5),"lay_Particles",obj_xplosionparticle)
xpl1.image_xscale *= -1;
var xpl2 = instance_create_layer(x+random_range(-5,5),y+random_range(-5,5),"lay_Particles",obj_xplosionparticle)
xpl2.image_yscale *= -1;
xpl2.image_angle = 180;
var xpl3 = instance_create_layer(x+random_range(-5,5),y+random_range(-5,5),"lay_Particles",obj_xplosionparticle)