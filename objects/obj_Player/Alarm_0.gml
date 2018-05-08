/// @description Spike Cooldown System

if (global.gauge_PLAYER_SPIKES < gauge_SPIKES_MAX)
{
	global.gauge_PLAYER_SPIKES++;
}

obj_Player_HUD_SPIKES.sprite_index = spr_Player_HUD_SPIKES_REGEN;