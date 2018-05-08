/// @description Blink Cooldown System

if (global.gauge_PLAYER_BLINKS < gauge_BLINKS_MAX)
{
	global.gauge_PLAYER_BLINKS = gauge_BLINKS_MAX;
}
obj_Player_HUD_BLINKS.sprite_index = spr_Player_HUD_BLINKS_REGEN;