if (image_index > 8){image_speed = 0;}
count++;

if (count > 30) {instance_create_layer(x,y,"lay_fade", obj_death_fade);}