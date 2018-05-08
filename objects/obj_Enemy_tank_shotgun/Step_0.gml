switch(MainState)
{
	//seeking
	case 0:
		if(collision_rectangle(x,y+16,x+(seekDist*image_xscale),y-16,obj_drawPlayer,false,false)&&!collision_line(x,y, obj_Player.x, obj_Player.y, obj_Wall, false, false))
		{
			MainState = 1;	
			sprite_index = spr_Enemy_tank_shotgun_fire
			image_index = 0;
			
			var proj1 = instance_create_depth(x+(14*image_xscale),y,depth+1,obj_tank_shotgun_proj)
			proj1.hmove = image_xscale
			proj1.vmove = -1
			proj1.flysp = 4
			proj1.inertia = sign(hsp);
			var proj2 = instance_create_depth(x+(14*image_xscale),y,depth+1,obj_tank_shotgun_proj)
			proj2.hmove = image_xscale
			proj2.inertia = sign(hsp);
			var proj3 = instance_create_depth(x+(14*image_xscale),y,depth+1,obj_tank_shotgun_proj)
			proj3.hmove = image_xscale
			proj3.vmove = 1
			proj3.flysp = 4
			proj3.inertia = sign(hsp);
		}
		break
	//firing
	case 1:
		if (image_index > 6)
		{
			MainState = 2;
			alarm[0]=cooldownTime;
			sprite_index = spr_Enemy_tank_shotgun
		}
		break
	//cooldown
	case 2:
		break
		
}