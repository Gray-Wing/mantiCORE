/// @description 



if (global.gauge_PLAYER_HP < gauge_HP_MAX)
{
	global.gauge_PLAYER_HP = gauge_HP_MAX;
	obj_Player_HUD_HP.sprite_index = spr_Player_HUD_HP_REGEN;
	with instance_place(x,y, obj_HP_pickup) {instance_destroy();}
}



