if(global.player_INVINCIBLE = 0)
{
	
	obj_Player.kbxdir = sign(hspeed);
	obj_Player.kbydir = sign(vspeed);
	obj_drawPlayer.damagedir = point_direction(obj_Player.x,obj_Player.y,x,y);
		
	global.player_TAKE_DAMAGE = 1;
}