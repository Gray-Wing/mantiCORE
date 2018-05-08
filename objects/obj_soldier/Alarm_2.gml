/// @description shoot timer
outOfLOS = 0;
confused = 0;
switch(image_xscale)
{
	case 1:
		MainState=5;
		break
	case -1:
		MainState=7;
		break
}

sprite_index = spr_Soldier_shoot;
image_index = 0;
guninst.sprite_index = spr_soldier_shoot_gun;
guninst.image_index = 0;