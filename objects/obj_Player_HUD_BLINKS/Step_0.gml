
x = obj_Player.x
y = obj_Player.y

if (sprite_index != spr_Player_HUD_BLINKS_REGEN)
{
	switch (global.gauge_PLAYER_BLINKS)
	{
		case 0:
			image_index = 2;
			break
		case 1:
			image_index = 1;
			break
		case 2:
			image_index = 0;
			break
	}
}
if (sprite_index == spr_Player_HUD_BLINKS_REGEN) && (image_index >= 8)
{sprite_index = spr_Player_HUD_BLINKS;}