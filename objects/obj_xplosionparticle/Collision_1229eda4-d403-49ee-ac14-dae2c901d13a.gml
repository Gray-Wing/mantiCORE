if (image_index < 2)
{
	if(global.player_INVINCIBLE = 0)
	{
		obj_Player.kbxdir = sign(obj_Player.x - x);
		obj_Player.kbydir = sign(y - obj_Player.y);
		
		global.player_TAKE_DAMAGE = 1;
	}
}