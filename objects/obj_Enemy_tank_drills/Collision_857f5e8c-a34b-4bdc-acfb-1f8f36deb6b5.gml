if(global.player_INVINCIBLE = 0)
{
	obj_Player.kbxdir = sign(hspeed);
	obj_Player.kbydir = sign(vspeed);
	
	global.player_TAKE_DAMAGE = 1;
}