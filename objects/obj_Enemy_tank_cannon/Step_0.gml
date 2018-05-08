switch(MainState)
{
	//seeking
	case 0:
		if(collision_line(x,y,x+(seekDist*image_xscale),y,obj_drawPlayer,false,false)&&!collision_line(x,y, obj_Player.x, obj_Player.y, obj_Wall, false, false))
		{
			MainState = 1;	
			sprite_index = spr_Enemy_tank_cannon_fire;
			image_index = 0;

			var proj1 = instance_create_depth(x,y,depth,obj_tank_cannon_proj)
			proj1.hmove = image_xscale;
			proj1.inertia = sign(hsp);
		}
		break
	//firing
	case 1:
		if (image_index > 5)
		{
			MainState = 2;
			alarm[0]=cooldownTime;
			sprite_index = spr_Enemy_tank_cannon
		}
		break
	//cooldown
	case 2:
		break
		
}