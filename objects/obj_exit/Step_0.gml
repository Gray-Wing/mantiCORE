if (place_meeting(x,y, obj_Player))
{
	instance_create_depth(x,y,depth+1,obj_exit_beacon);
	instance_destroy(obj_Player_HUD_BLINKS);
	instance_destroy(obj_Player_HUD_HP);
	instance_destroy(obj_Player_HUD_SPIKES);
	instance_destroy(obj_drawPlayer);
	instance_destroy(obj_Player);
	instance_create_layer(x,y,"lay_Particles",obj_Player_exitparticle)
	
	instance_create_depth(x,y,depth,obj_white_fireParticle);
	instance_create_depth(x,y,depth,obj_white_fireParticle);
	instance_create_depth(x,y,depth,obj_white_fireParticle);
	instance_create_depth(x,y,depth,obj_white_fireParticle);
	instance_create_depth(x,y,depth,obj_white_fireParticle);
	
	sprite_index = spr_exit_activated;
	image_index = 0;
	levelComplete = 1;
	
}

if (sprite_index == spr_exit_activated && image_index > 5)
{
	image_speed = 0;	
	
	instance_create_layer(x,y,"lay_fade", obj_back_fade);

}