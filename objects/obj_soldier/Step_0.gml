//keeps weakspot attached
weakspotInst.x = x;
weakspotInst.y = y;
weakspotInst.image_xscale = image_xscale;

if(instance_exists(obj_drawPlayer)){angleToPlayer = point_direction(guninst.x,guninst.y,obj_drawPlayer.x,obj_drawPlayer.y)}
seekCone = 0;

//keeps arm and gun attached
switch(image_xscale)
{
	case 1:
		guninst.x = x+4;
		guninst.y = y-17;
		guninst.image_yscale = 1;
		
		if((angleToPlayer >= 0 && angleToPlayer <= 60)||(angleToPlayer >= 300 && angleToPlayer <=360)){seekCone = 1;}
		
		break
	case -1:
		guninst.x = x-4;
		guninst.y = y-17;
		guninst.image_yscale = -1;
		
		if((angleToPlayer >= 180 && angleToPlayer <= 240)||(angleToPlayer >= 120 && angleToPlayer <=180)){seekCone = 1;}
}

switch(MainState)
{
	//idle
	case 0:
		if (place_meeting(x,y+1,obj_Wall))
		{
			sprite_index = spr_Soldier_idle;
		}
		
		guninst.image_alpha = 0;
		hmove = 0;
		
		runhmove = 0;
		
		if(collision_circle(x,y,seekRad,obj_drawPlayer,false,false) && seekCone && (!collision_line(x,y,obj_drawPlayer.x,obj_drawPlayer.y,obj_Wall,false,false)))
		{
			
			if(distance_to_object(obj_drawPlayer) <= startChargeDist) 
			{
				MainState = 8;
				sprite_index = spr_Soldier_bayonet_ready;
				
				image_index = 0;
				alarm[0] = -1;
				alarm[1] = -1;
			}
			else
			{
				MainState = 3;	
				sprite_index = spr_Soldier_spin_shoot;
				image_index = 0;
				alarm[0] = -1;
				alarm[1] = -1;
			}
			
			instance_create_layer(x,y-50,"lay_Particles",obj_red_exclamparticle);
			
		}
		
		break
	//walk right
	case 1:
		sprite_index = spr_Soldier_walk;
		image_xscale = 1;
		hmove = 1;
		//horizontal collision for obj_wall while walking right
		if (place_meeting(x+hsp,y,obj_Wall)||(!place_meeting(x+(20*hmove),y+1,obj_Wall) && place_meeting(x,y+1,obj_Wall)))
		{
			if (place_meeting(x+hsp,y,obj_Wall))
			{
				while (!place_meeting(x+sign(hsp),y,obj_Wall))
				{
					x += sign(hsp);
				}
			}
			hsp = 0;
			
			MainState = 2;
		}
		
		if(collision_circle(x,y,seekRad,obj_drawPlayer,false,false) && seekCone && (!collision_line(x,y,obj_drawPlayer.x,obj_drawPlayer.y,obj_Wall,false,false)))
		{
			
			if(distance_to_object(obj_drawPlayer) <= startChargeDist) 
			{
				MainState = 8;
				sprite_index = spr_Soldier_bayonet_ready;
				image_index = 0;
				alarm[0] = -1;
				alarm[1] = -1;
			}
			else
			{
				MainState = 3;	
				sprite_index = spr_Soldier_spin_shoot;
				image_index = 0;
				alarm[0] = -1;
				alarm[1] = -1;
			}
			
			instance_create_layer(x,y-50,"lay_Particles",obj_red_exclamparticle);
			
		}
		
		break
	//walk left
	case 2:
		sprite_index = spr_Soldier_walk;
		image_xscale = -1;
		hmove = -1;
		
		//horizontal collision for obj_wall while walking right
		if (place_meeting(x+hsp,y,obj_Wall)||(!place_meeting(x+(20*hmove),y+1,obj_Wall)&&place_meeting(x,y+1,obj_Wall)))
		{
			if (place_meeting(x+hsp,y,obj_Wall))
			{
				while (!place_meeting(x+sign(hsp),y,obj_Wall))
				{
					x += sign(hsp);
				}
			}
			hsp = 0;
			
			MainState = 1;
		}
		
		if(collision_circle(x,y,seekRad,obj_drawPlayer,false,false) && seekCone && (!collision_line(x,y,obj_drawPlayer.x,obj_drawPlayer.y,obj_Wall,false,false)))
		{
			
			if(distance_to_object(obj_drawPlayer) <= startChargeDist) 
			{
				MainState = 8;
				sprite_index = spr_Soldier_bayonet_ready;
				image_index = 0;
				alarm[0] = -1;
				alarm[1] = -1;
			}
			else
			{
				MainState = 3;	
				sprite_index = spr_Soldier_spin_shoot;
				image_index = 0;
				alarm[0] = -1;
				alarm[1] = -1;
			}
			
			instance_create_layer(x,y-50,"lay_Particles",obj_red_exclamparticle);
			
		}
		
		break
	
	//spotted->aim
	case 3:
		hmove = 0;
		if (sprite_index = spr_Soldier_spin_shoot) && (image_index >= 15)
		{
			guninst.image_alpha = 1;
			switch(image_xscale)
			{
				case 1:
					guninst.image_angle = 0;
					break
				case -1:
					guninst.image_angle = 180;
					break
			}
		}
		if (sprite_index = spr_Soldier_spin_shoot) && (image_index >= 18)
		{
			switch(image_xscale)
			{
				case 1:
					MainState=4;
					guninst.image_angle = 0;
					confused = 0;
					outOfLOS = 0;
					lastAngleToPlayer = 0;
					break
				case -1:
					MainState=6;
					guninst.image_angle = 180;
					confused = 0;
					outOfLOS = 0;
					lastAngleToPlayer = 180;
					break
			}
			
			guninst.image_alpha = 1;
			sprite_index = spr_Soldier_aimfwd;
			guninst.sprite_index = spr_soldier_aim_gun;
			
		}
		
		break
	//aim->shoot right
	case 4:
		
		if(instance_exists(obj_drawPlayer)){angleToPlayer = point_direction(guninst.x,guninst.y,obj_drawPlayer.x,obj_drawPlayer.y)}
		
		if(instance_exists(obj_drawPlayer))
		{
			if(collision_line(x,y,obj_drawPlayer.x,obj_drawPlayer.y,obj_Wall,false,false)){outOfLOS++;}
			else{outOfLOS = 0;}
			if (outOfLOS >= outOfLOSTime){MainState = 0;alarm[0] = irandom_range(idleTime_MIN,idleTime_MAX);}
		}
		else{MainState = 0;alarm[0] = irandom_range(idleTime_MIN,idleTime_MAX);}
		
		sprite_index = spr_Soldier_aimfwd;
		guninst.sprite_index = spr_soldier_aim_gun;
		guninst.image_angle = lastAngleToPlayer;
		
		if(instance_exists(obj_drawPlayer))
		{
			if(((angleToPlayer >= 0 && angleToPlayer <= 60)||(angleToPlayer >= 300 && angleToPlayer <=360))&&(!collision_line(x,y,obj_drawPlayer.x,obj_drawPlayer.y,obj_Wall,false,false)))
			{
				lastAngleToPlayer = angleToPlayer;
				confused = 0;
				if (alarm[2] == -1) {alarm[2] = firstshotTime;}
			}
			else
			{
				confused++; 
				alarm[2] = -1;
				if (confused == confuseTime/4){instance_create_layer(x,y-50,"lay_Particles",obj_red_questparticle);}
				
			}
			if (confused >= confuseTime)
			{
				if(((angleToPlayer >= 180 && angleToPlayer <= 240)||(angleToPlayer >= 120 && angleToPlayer <=180))&&(!collision_line(x,y,obj_drawPlayer.x,obj_drawPlayer.y,obj_Wall,false,false)))
				{
					image_xscale = -1;
					instance_create_layer(x,y-50,"lay_Particles",obj_red_exclamparticle);
					confused = 0;
					
					if(distance_to_object(obj_Player) <= startChargeDist)
					{
						MainState = 8;
						sprite_index = spr_Soldier_bayonet_ready;
						image_index = 0;
					}else
					{
						guninst.image_angle = 180;
						MainState = 6;
						alarm[2] = firstshotTime;
					}
				}
				else {MainState = 0;alarm[0] = irandom_range(idleTime_MIN,idleTime_MAX);}
			}
		}
		else {MainState = 0;alarm[0] = irandom_range(idleTime_MIN,idleTime_MAX);}
		
		
		
		
		hmove = 0;
		break
	//shoot->reload->aim right
	case 5:
		guninst.image_angle = 0;
		if(instance_exists(obj_drawPlayer)){angleToPlayer = point_direction(guninst.x,guninst.y,obj_drawPlayer.x,obj_drawPlayer.y)}
	
		if(instance_exists(obj_drawPlayer))
		{
			if(collision_line(x,y,obj_drawPlayer.x,obj_drawPlayer.y,obj_Wall,false,false)){outOfLOS++;}
			else{outOfLOS = 0;}
			if (outOfLOS >= outOfLOSTime){MainState = 4;outOfLOS = 0;}
		}
		else{MainState = 0;alarm[0] = irandom_range(idleTime_MIN,idleTime_MAX);}
	
		if(instance_exists(obj_drawPlayer))
		{
			if(((angleToPlayer >= 0 && angleToPlayer <= 60)||(angleToPlayer >= 300 && angleToPlayer <=360))&&(!collision_line(x,y,obj_drawPlayer.x,obj_drawPlayer.y,obj_Wall,false,false)))
			{lastAngleToPlayer = angleToPlayer;}
			else {MainState = 4; confused = 0;}
			guninst.image_angle = lastAngleToPlayer;
			barrelX = guninst.x + lengthdir_x(38,guninst.image_angle);
			barrelY = guninst.y + lengthdir_y(38,guninst.image_angle);
		}
		else{MainState=0;}
		
		if (sprite_index = spr_Soldier_shoot) && (image_index == 0)
		{
			var bulletInst = instance_create_depth(barrelX,barrelY,depth,obj_gun_projectile);
			bulletInst.image_angle = lastAngleToPlayer;
			
			var stringInst1 = instance_create_depth(barrelX,barrelY,depth,obj_stringparticle);
			stringInst1.image_angle = lastAngleToPlayer;
			stringInst1.drawColor = c_red;
			stringInst1.fade = .2;
		
			var stringInst2 = instance_create_depth(barrelX,barrelY,depth,obj_stringparticle);
			stringInst2.image_angle = lastAngleToPlayer;
			stringInst2.drawColor = c_red;
			stringInst2.fade = .2;
			
			var stringInst3 = instance_create_depth(barrelX,barrelY,depth,obj_stringparticle);
			stringInst3.image_angle = lastAngleToPlayer;
			stringInst3.drawColor = c_red;
			stringInst3.fade = .2;
		}
		
		break
		//aim->shoot left
	case 6:
		if(instance_exists(obj_drawPlayer)){angleToPlayer = point_direction(guninst.x,guninst.y,obj_drawPlayer.x,obj_drawPlayer.y)}
	
		if(instance_exists(obj_drawPlayer))
		{
			if(collision_line(x,y,obj_drawPlayer.x,obj_drawPlayer.y,obj_Wall,false,false)){outOfLOS++;}
			else{outOfLOS = 0;}
			if (outOfLOS >= outOfLOSTime){MainState = 0;alarm[0] = irandom_range(idleTime_MIN,idleTime_MAX);}
		}
		else{MainState = 0;alarm[0] = irandom_range(idleTime_MIN,idleTime_MAX);}
		
		sprite_index = spr_Soldier_aimfwd;
		guninst.sprite_index = spr_soldier_aim_gun;
		guninst.image_angle = lastAngleToPlayer;
		
		if(instance_exists(obj_drawPlayer))
		{
			if(((angleToPlayer >= 180 && angleToPlayer <= 240)||(angleToPlayer >= 120 && angleToPlayer <=180))&&(!collision_line(x,y,obj_drawPlayer.x,obj_drawPlayer.y,obj_Wall,false,false)))
			{
				lastAngleToPlayer = angleToPlayer;
				confused = 0;
				if (alarm[2] == -1) {alarm[2] = firstshotTime;}
			}
			else
			{
				alarm[2] = -1;
				confused++;
				if (confused == confuseTime/4){instance_create_layer(x,y-50,"lay_Particles",obj_red_questparticle);}
			}
			if (confused >= confuseTime)
			{
				if (((angleToPlayer >= 0 && angleToPlayer <= 60)||(angleToPlayer >= 300 && angleToPlayer <=360))&&(!collision_line(x,y,obj_drawPlayer.x,obj_drawPlayer.y,obj_Wall,false,false)))
				{
					image_xscale = 1;
					instance_create_layer(x,y-50,"lay_Particles",obj_red_exclamparticle);
					confused = 0;
					
					if(distance_to_object(obj_Player) <= startChargeDist) 
					{
						MainState = 8;
						sprite_index = spr_Soldier_bayonet_ready;
						image_index = 0;
					}
					else
					{
						guninst.image_angle = 0;
						MainState = 4;
						alarm[2] = firstshotTime;
					}
				}
				else{MainState = 0;alarm[0] = irandom_range(idleTime_MIN,idleTime_MAX);}
			}
		}
		else{MainState = 0;alarm[0] = irandom_range(idleTime_MIN,idleTime_MAX);}
		
		
		
		
		
		hmove = 0;
		break
	//shoot->reload->aim left
	case 7:
		guninst.image_angle = 180;
		if(instance_exists(obj_drawPlayer)){angleToPlayer = point_direction(guninst.x,guninst.y,obj_drawPlayer.x,obj_drawPlayer.y)}
		
		if(instance_exists(obj_drawPlayer))
		{
			if(collision_line(x,y,obj_drawPlayer.x,obj_drawPlayer.y,obj_Wall,false,false)){outOfLOS++;}
			else{outOfLOS = 0;}
			if (outOfLOS >= outOfLOSTime){MainState = 6;outOfLOS = 0;}
		}
		else{MainState = 0;alarm[0] = irandom_range(idleTime_MIN,idleTime_MAX);}
		
		if(instance_exists(obj_drawPlayer))
		{
			if(((angleToPlayer >= 180 && angleToPlayer <= 240)||(angleToPlayer >= 120 && angleToPlayer <=180))&&(!collision_line(x,y,obj_drawPlayer.x,obj_drawPlayer.y,obj_Wall,false,false)))
			{lastAngleToPlayer = angleToPlayer;}
			else {MainState = 6;confused = 0;}
			guninst.image_angle = lastAngleToPlayer;
			barrelX = guninst.x + lengthdir_x(38,guninst.image_angle);
			barrelY = guninst.y + lengthdir_y(38,guninst.image_angle);
		}
		else {MainState = 0;alarm[0] = irandom_range(idleTime_MIN,idleTime_MAX);}
		
		if (sprite_index = spr_Soldier_shoot) && (image_index == 0)
		{
			var bulletInst = instance_create_depth(barrelX,barrelY,depth,obj_gun_projectile);
			bulletInst.image_angle = lastAngleToPlayer;
			
			var stringInst1 = instance_create_depth(barrelX,barrelY,depth,obj_stringparticle);
			stringInst1.image_angle = lastAngleToPlayer;
			stringInst1.drawColor = c_red;
			stringInst1.fade = .2;
		
			var stringInst2 = instance_create_depth(barrelX,barrelY,depth,obj_stringparticle);
			stringInst2.image_angle = lastAngleToPlayer;
			stringInst2.drawColor = c_red;
			stringInst2.fade = .2;
			
			var stringInst3 = instance_create_depth(barrelX,barrelY,depth,obj_stringparticle);
			stringInst3.image_angle = lastAngleToPlayer;
			stringInst3.drawColor = c_red;
			stringInst3.fade = .2;
		}
		
		break
	
	//brace for charge
	case 8:
		guninst.image_alpha = 0;
		hmove = 0;
	
		if (sprite_index == spr_Soldier_bayonet_ready && image_index >= 6)
		{MainState = 9;}
		
		
		break
		
	//charging
	case 9:
		if (place_meeting(x,y+1,obj_Wall))
		{
			sprite_index = spr_Soldier_charge;
		}
		else{sprite_index = spr_Soldier_jump;}
		runhmove = image_xscale;
		
		if(instance_exists(obj_drawPlayer))
		{
			if (collision_rectangle(x,y-jumpseekheightbot,x+(image_xscale*jumpseekdist),y-jumpseekheighttop,obj_drawPlayer,false,false)&&place_meeting(x,y+1,obj_Wall)&&canJump == 1)
			{vsp += jumpHeight; sprite_index = spr_Soldier_jump; image_index = 0; canJump = 0; alarm[3] = jumpCD;}
		}
		//horizontal collision for obj_wall while walking right
		if (place_meeting(x+hsp,y,obj_Wall)||(!place_meeting(x+(108*runhmove),y+1,obj_Wall)&&place_meeting(x,y+1,obj_Wall)))
		{
			if (place_meeting(x+hsp,y,obj_Wall))
			{
				while (!place_meeting(x+sign(hsp),y,obj_Wall))
				{
					x += sign(hsp);
				}
				hsp = 0;
			}
			
			
			MainState = 10;
		}
		
		if(instance_exists(obj_drawPlayer))
		{
			switch (image_xscale)
			{
				case 1:
					if (point_direction(x,y,obj_drawPlayer.x,obj_drawPlayer.y) >= 90 && point_direction(x,y,obj_drawPlayer.x,obj_drawPlayer.y) <= 270)
					{MainState = 10;}
	
					break
				case -1:
					if (point_direction(x,y,obj_drawPlayer.x,obj_drawPlayer.y) >= 0 && point_direction(x,y,obj_drawPlayer.x,obj_drawPlayer.y) <= 90)||((point_direction(x,y,obj_drawPlayer.x,obj_drawPlayer.y) >= 270 && point_direction(x,y,obj_drawPlayer.x,obj_drawPlayer.y) <= 360))
					{MainState = 10;}
			
					break
			}
		} else {MainState = 10;}
		

		
		if (sprite_index == spr_Soldier_jump && image_index >= 4) {image_index = 4}
		
		break
		
	//sliding
	case 10:
		if (place_meeting(x,y+1,obj_Wall))
		{
			sprite_index = spr_Soldier_slide; image_index = 0;
		}
	
		if (place_meeting(x,y+1,obj_Wall))
		{
			switch (image_xscale)
			{
				case 1:
					runhmove -= .05;
					if (createParticle == 0)
					{
						instance_create_depth(x-10,y+15,depth+1,obj_purple_electricparticle);
						instance_create_depth(x+18,y+15,depth+1,obj_purple_electricparticle);
						
					}
					createParticle++;
					break
				case -1:
					runhmove += .05;
					if (createParticle == 0)
					{
						instance_create_depth(x+10,y+15,depth+1,obj_purple_electricparticle);
						instance_create_depth(x-18,y+15,depth+1,obj_purple_electricparticle);
						
					}
					createParticle++;
					break
			}
			if (createParticle = 3) {createParticle = 0;}
		}
		
		if (place_meeting(x+hsp,y,obj_Wall))
		{
			while (!place_meeting(x+sign(hsp),y,obj_Wall))
			{
				x += sign(hsp);
			}
			hsp = 0;
		}
		
		if (runhmove == 0) 
		{
			MainState = 0;
			switch (image_xscale)
			{
				case 1:
					leftOrRight = 0;
					break
				case -1:
					leftOrRight = 1;
			}
			alarm[0] = irandom_range(idleTime_MIN,idleTime_MAX);
		}
	
		break
}

//speed calculations
vsp += grv;
hsp = hmove*walksp + runhmove*runsp;

//vertical collision for obj_Wall
if (place_meeting(x,y+vsp,obj_Wall))
{
	while (!place_meeting(x,y+sign(vsp),obj_Wall))
	{
		y += sign(vsp);
	}
	vsp = 0;
}

//unstuck code
//left
if (instance_place(x-1,y,obj_Wall))
{
	WallInst = instance_place(x-1,y,obj_Wall);
	if (sign(hsp) = 1)
	{
		if (WallInst.hsp > hsp)
		{
			hsp = WallInst.hsp;
		}
	}
	if (sign(hsp) = -1)
	{
		if (WallInst.hsp > hsp)
		{
			hsp = WallInst.hsp;
		}
	}
	if (hsp = 0)
	{
		if (WallInst.hsp > 0)
		{
			hsp = WallInst.hsp;
		}
	}
}
//right
if (instance_place(x+1,y,obj_Wall))
{
	WallInst = instance_place(x+1,y,obj_Wall);
	if (sign(hsp) = 1)
	{
		if (WallInst.hsp < hsp)
		{
			hsp = WallInst.hsp;
		}
	}
	if (sign(hsp) = -1)
	{
		if (WallInst.hsp < hsp)
		{
			hsp = WallInst.hsp;
		}
	}
	if (hsp = 0)
	{
		if (WallInst.hsp < 0)
		{
			hsp = WallInst.hsp;
		}
	}
}
//down
if (instance_place(x,y+1,obj_Wall))
{
	WallInst = instance_place(x,y+1,obj_Wall);
	if (sign(vsp) = 1)
	{
		if (WallInst.vsp < vsp)
		{
			vsp = WallInst.vsp;
		}
	}
	if (sign(vsp) = -1)
	{
		if (WallInst.vsp < vsp)
		{
			vsp = WallInst.vsp;
		}
	}
	if (vsp = 0)
	{
		if (WallInst.vsp < 0)
		{
			vsp = WallInst.vsp;
		}
	}
}
//up
if (instance_place(x,y-1,obj_Wall))
{
	WallInst = instance_place(x,y-1,obj_Wall);
	if (sign(vsp) = 1)
	{
		if (WallInst.vsp > vsp)
		{
			vsp = WallInst.vsp;
		}
	}
	if (sign(vsp) = -1)
	{
		if (WallInst.vsp > vsp)
		{
			vsp = WallInst.vsp;
		}
	}
	if (vsp = 0)
	{
		if (WallInst.vsp > 0)
		{
			vsp = WallInst.vsp;
		}
	}
}

//ultimate movement
y += vsp;
x += hsp;

with (weakspotInst)
{
	if instance_place(x,y,obj_Spike)
	{
		spikeInst = instance_place(x,y,obj_Spike);
		
		if ((spikeInst.image_angle == 0 && image_xscale == 1)||(spikeInst.image_angle == 180 && image_xscale == -1))
		{
			instance_destroy(other);	
			instance_destroy(spikeInst);	
		}
	}
}

if (DIE == 5){instance_destroy();}

if(place_meeting(x,y,obj_Wall))
{
	DIE++;
}
else{DIE = 0;}