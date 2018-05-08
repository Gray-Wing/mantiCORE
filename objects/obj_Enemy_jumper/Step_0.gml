sprite_index = spr_Enemy_jumper_idle;

if (hasdetectedplayer == 1) {sprite_index = spr_Enemy_jumper_detected;}

if (hasjumped == 1) {sprite_index = spr_Enemy_jumper_up}

//Check for player
if (collision_line(x-seekingrange,y,x+seekingrange,y,obj_Player,false,false) && hasdetectedplayer == 0) 
{
	hasdetectedplayer = 1;
}

if (sprite_index == spr_Enemy_jumper_detected && image_index == 8)
{
	hasjumped = 1;
	hasdetectedplayer = 0;
}

if (sprite_index == spr_Enemy_jumper_up && image_index == 10)
{
	hasjumped = 0;	
}

