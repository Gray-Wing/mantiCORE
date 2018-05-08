
switch(MainState)
{
	//idle/seeking state
	case 0:
		hsp = 0;
		vsp = 0;
		
		//checks if wall is still there, if not, deflected proj replaces knife
		switch(image_angle)
		{
			case 0:
				if(!collision_point(x,y+17,obj_Wall,false,false)){deflected = 1; instance_destroy();}
				break
			case 90:
				if(!collision_point(x+17,y,obj_Wall,false,false)){deflected = 1; instance_destroy();}
				break
			case 180:
				if(!collision_point(x,y-17,obj_Wall,false,false)){deflected = 1; instance_destroy();}
				break
			case 270:
				if(!collision_point(x-17,y,obj_Wall,false,false)){deflected = 1; instance_destroy();}
				break
		}
		
		if (cantSeek == 0)
		{
			//if the player comes within seeking range unobstructed by a wall AND player object exists
			if (instance_exists(obj_Player) && collision_circle(x,y,detectRadius,obj_Player,false,false) && !collision_line(x,y, obj_Player.x, obj_Player.y, obj_Wall, false, false))
			{
				cantSeek = 1;
				PlayerLastX = obj_Player.x;
				PlayerLasty = obj_Player.y;
				MainState = 1; //Set Mainstate to jump
				decel = 0;
				switch(image_angle)
				{
					case 0:
						jumpDir = 0;
						hmove = 0;
						vmove = -1;
						break
					case 90:
						hmove = -1;
						vmove = 0;
						jumpDir = 1;
						break
					case 180:
						hmove = 0;
						vmove = 1;
						jumpDir = 2;
						break
					case 270:
						hmove = 1;
						vmove = 0;
						jumpDir = 3;
						break
				}
			}
		}
		sprite_index = spr_Knife_idle;
		break
	//jumping state
	case 1:
		hsp = hmove*(jumpsp - decel);
		vsp = vmove*(jumpsp - decel);
		decel++;
		if (hsp == 0 && vsp == 0) {MainState = 2; spinning = spinTime;}
		sprite_index = spr_Knife_jump;
		break
	//spinning state
	case 2:
		spinning--;
		if (spinning == 0)
		{
			MainState = 3;
			if(instance_exists(obj_Player))
			{
				PlayerLastX = obj_Player.x;
				PlayerLasty = obj_Player.y;
				AngleToPlayer = point_direction(x,y,PlayerLastX,PlayerLasty);
				maxX = x + lengthdir_x(maxTravelDist,AngleToPlayer);
				maxY = y + lengthdir_y(maxTravelDist,AngleToPlayer);
			}
			image_angle = point_direction(x,y,PlayerLastX,PlayerLasty)
			var throwParticleInst = instance_create_depth(x,y,depth+1,obj_Knife_throwparticle);
			throwParticleInst.image_angle = image_angle;
		}
		sprite_index = spr_Knife_spin;
		break
	//flight state
	case 3:
		if (point_distance(x, y, maxX, maxY) > flysp)
		{
			move_towards_point(maxX,maxY,flysp);
			
			var TrailInst = instance_create_depth(x,y,vertex_usage_depth,obj_knife_trail)
			TrailInst.lastX = prevX;
			TrailInst.lastY = prevY;
		}
		else {instance_destroy();}
		
		sprite_index = spr_Knife_throw;
		
		//lodge back into wall
		if(collision_point(x,y,obj_Wall,false,false))
		{
			move_towards_point(maxX,maxY,-.1);
			backhspeed = hspeed;
			backvspeed = vspeed;
			speed = 0;
			
			while (collision_point(x,y,obj_Wall,false,false))
			{
				x += backhspeed;
				y += backvspeed;
			}
			
			if (!collision_point(x,y,obj_Wall,false,false))
			{
				if (collision_line(x,y,x+1,y, obj_Wall, false, false)){wallSide = 1;} // wall on right
				if (collision_line(x,y,x-1,y, obj_Wall, false, false)){wallSide = 3;} // wall on left
				if (collision_line(x,y,x,y+1, obj_Wall, false, false)){wallSide = 2;} // wall on up
				if (collision_line(x,y,x,y-1, obj_Wall, false, false)){wallSide = 4;} // wall on down
			}
			
			alarm[0] = seekCooldown;
			MainState = 0;
			
			switch(wallSide)
			{
				case 1:
					x -= 16;
					image_angle = 90;
					var particleInst = instance_create_depth(x,y,depth,obj_Knife_lodgeparticle);
					particleInst.image_angle = 90;
					break
				case 2:
					y -= 16;
					image_angle = 0;
					var particleInst = instance_create_depth(x,y,depth,obj_Knife_lodgeparticle);
					particleInst.image_angle = 0;
					break
				case 3:
					x += 16;
					image_angle = 270;
					var particleInst = instance_create_depth(x,y,depth,obj_Knife_lodgeparticle);
					particleInst.image_angle = 270;
					break
				case 4:
					y += 16;
					image_angle = 180;
					var particleInst = instance_create_depth(x,y,depth,obj_Knife_lodgeparticle);
					particleInst.image_angle = 180;
					break
				//default: deflected = 1; instance_destroy();
			}
			wallSide = 0;
			
		}
		break
}
//keep in mind setting the state higher may take effect before OR after next frame, not sure yet

prevX = x;
prevY = y;

x += hsp;
y += vsp;

if (collision_point(x,y,obj_Wall,false,false))
{
	instance_destroy();
}
