
x = obj_Player.x
y = obj_Player.y

if (sprite_index != spr_Player_HUD_SPIKES_REGEN)
{
	switch (global.gauge_PLAYER_SPIKES)
	{
		case 0:
			image_index = 1;
			break
		case 1:
			image_index = 0;
			break
	}
}

if (sprite_index == spr_Player_HUD_SPIKES_REGEN) && (image_index >= 8)
{sprite_index = spr_Player_HUD_SPIKES;}