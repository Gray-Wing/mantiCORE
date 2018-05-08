if (tookdamage == 1) {image_blend = c_yellow;}
else {image_blend = -1;}
//Movement system when gravity is down
if (obj_Player.grvswitch == 0)
{
	//!Sprite Control!
	image_angle = 0;
	
	with(obj_Player)
	{
		if (hmove == 0) && (place_meeting(x,y+1,obj_Wall)) {other.sprite_index = spr_Player_idle;} //player is idle when not moving and on ground
	}
	
	if (obj_Player.hmove != 0) && (place_meeting(x,y+1,obj_Wall)) {sprite_index = spr_Player_run_down;} //player runs when on ground and moving left or right
	
	//Faces sprite in movement direction
	if (obj_Player.hmove == 1) {image_xscale = 1;} 
	if (obj_Player.hmove == -1) {image_xscale = -1;} 
	 
	//sprite changes for jumping
	if (place_meeting(x,y+1,obj_Wall)) && obj_Player.KEY_JUMP {sprite_index = spr_Player_inair;}
	with (obj_Player)
	{
		if (!place_meeting(x,y+1,obj_Wall)) {other.sprite_index = spr_Player_inair;}
	}
	
	//Shooting system 
	if (obj_Player.KEY_SHOOTRIGHT) && (obj_Player.canshoot == 1)
	{
		image_index = 0; 
	}
	if (obj_Player.shotright)
	{
		if (place_meeting(x,y+1,obj_Wall)) {sprite_index = spr_Player_shootground; image_xscale = 1;}
	}
	
	if (obj_Player.KEY_SHOOTLEFT) && (obj_Player.canshoot == 1)
	{
		image_index = 0; 
	}
	if (obj_Player.shotleft)
	{
		if (place_meeting(x,y+1,obj_Wall)) {sprite_index = spr_Player_shootground; image_xscale = -1;}
	}

	if (obj_Player.hasdived > 0)
	{
		if (obj_Player.hangtime == 0)
		{	
			sprite_index = spr_Player_dive;
		}
	}
	if (obj_Player.hasslammed > 0) //ground slam attack here
	{
		sprite_index = spr_Player_slam;
	}
	
	if (obj_Player.knockback > 0)
	{
		with (obj_Player)
		{
			if (!place_meeting(x,y+1,obj_Wall)) {other.sprite_index = spr_player_kbair;}
			else{other.sprite_index = spr_player_kbground;}
		}
	}

	x = obj_Player.x;
	y = obj_Player.y;
}

//Movement system when gravity is out
if (obj_Player.grvswitch == 1)
{
	//!Sprite Control OUT!
	image_xscale = 1;
	
	if (obj_Player.hmove == 0 && obj_Player.vmove == 0) {sprite_index = spr_Player_out_idle;}
	if (obj_Player.hmove != 0 || obj_Player.vmove != 0) {sprite_index = spr_Player_out_run;}
	
	image_angle = obj_Player.lookdirection;
	
	//controls what happens when player takes damage

	//movement during blink
	if (obj_Player.hasblinked > 0) 
	{	
		sprite_index = spr_Player_blink;
	}
	//hold after blink
	if (obj_Player.hasblinked < 1) && (obj_Player.blinkhold > 0)
	{	
		if (!collision_point(x,y,obj_Floor,false,false)) // only holds you in place if you blink off floor
		{
			sprite_index = spr_Player_switch;
		}
	}
	
	//SHOOTING system
	if (obj_Player.KEY_SHOOTRIGHT) && (obj_Player.canshoot == 1)
	{
		image_index = 0;
	}
	if (obj_Player.shotright)
	{
		if (collision_point(x,y,obj_Floor,false,false)) {sprite_index = spr_Player_out_shoot;image_angle = 0;}
	}
	
	if (obj_Player.KEY_SHOOTLEFT) && (obj_Player.canshoot == 1)
	{
		image_index = 0;
	}
	if (obj_Player.shotleft)
	{
		if (collision_point(x,y,obj_Floor,false,false)) {sprite_index = spr_Player_out_shoot;image_angle = 180;}
	}
	
	if (obj_Player.KEY_SHOOTUP) && (obj_Player.canshoot == 1)
	{
		image_index = 0;
	}
	if (obj_Player.shotup)
	{
		if (collision_point(x,y,obj_Floor,false,false)) {sprite_index = spr_Player_out_shoot;image_angle = 90;}
	}
	
	if (obj_Player.KEY_SHOOTDOWN) && (obj_Player.canshoot == 1)
	{
		image_index = 0;
	}
	if (obj_Player.shotdown)
	{
		if (collision_point(x,y,obj_Floor,false,false)) {sprite_index = spr_Player_out_shoot;image_angle = 270;}
	}

	if (obj_Player.knockback > 0)
	{
		sprite_index = spr_player_kbout;
		image_angle = damagedir;
	}

	x = obj_Player.x;
	y = obj_Player.y;

}
