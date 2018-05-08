if(global.player_INVINCIBLE = 0)
{
	obj_Player.kbxdir = sign(hsp);
	obj_Player.kbydir = sign(vsp);
	obj_drawPlayer.damagedir = point_direction(obj_Player.x,obj_Player.y,x,y);
		
	
	global.player_TAKE_DAMAGE = 1;
}