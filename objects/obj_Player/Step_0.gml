/// @description Movement Systems
//get player input
if (global.TEXT_OPEN == 0)
{
	KEY_LEFT = keyboard_check(ord("A"));
	KEY_RIGHT = keyboard_check(ord("D"));
	KEY_UP = keyboard_check(ord("W"));
	KEY_DOWN = keyboard_check(ord("S"));
	KEY_SHOOTLEFT = keyboard_check_pressed(vk_left);
	KEY_SHOOTRIGHT = keyboard_check_pressed(vk_right);
	KEY_SHOOTUP = keyboard_check_pressed(vk_up);
	KEY_SHOOTDOWN = keyboard_check_pressed(vk_down);
	KEY_JUMP = keyboard_check_pressed(vk_space);
	KEY_SHIFT = keyboard_check_pressed(vk_shift);
	KEY_ESC = keyboard_check_pressed(vk_escape);
	
} else
{
	KEY_LEFT = 0
	KEY_RIGHT = 0
	KEY_UP = 0
	KEY_DOWN = 0
	KEY_SHOOTLEFT = 0
	KEY_SHOOTRIGHT = 0
	KEY_SHOOTUP = 0
	KEY_SHOOTDOWN = 0
	KEY_JUMP = 0
	KEY_SHIFT = 0
	KEY_ESC = 0
}

KEY_ENTER = keyboard_check_pressed(vk_enter);

if (KEY_ESC) {instance_create_layer(x,y,"lay_fade", obj_back_fade)}

blinkedthisstep = 0;
tookdamage = 0;


// prevent player from shooting if spike gauge is empty
if (global.gauge_PLAYER_SPIKES == 0) {canshoot = 0;}
if (global.gauge_PLAYER_SPIKES > 0) {canshoot = 1;}
hasshot = 0;

hasswitched = 0;
if (!collision_point(x,y,obj_Floor,false,true)){overgap = 1;}
if (collision_point(x,y,obj_Floor,false,true)){overgap = 0;}

//flip gravity if KEY_SWITCH is pressed. 0 -> down gravity; 1 -> out gravity
if (KEY_SHIFT) && (grvswitch == 1) && (hasswitched == 0) && (canswitch == 1) {grvswitch = 0; hasswitched = 1; instance_create_layer(x,y,"lay_Particles",obj_Player_switch_downparticle);}
if (KEY_SHIFT) && (collision_point(x,y,obj_Floor,false,false)) && (grvswitch == 0) && (hasswitched == 0) {grvswitch = 1; hasswitched = 1;instance_create_layer(x,y,"lay_Particles",obj_Player_switch_outparticle);}

//flips gravity down if off of floor only when blink is over
if (!collision_point(x,y,obj_Floor,false,false)) && (blinkhold == 0) {grvswitch = 0;}

//Controls what happens when player dies
if (global.gauge_PLAYER_HP == 0){global.player_HAS_DIED = 1;}

//calculate movement
vmove = KEY_DOWN - KEY_UP; 
hmove = KEY_RIGHT - KEY_LEFT;
	
//acceleration
if(KEY_RIGHT)
{
	rightAccel = clamp(rightAccel + AccelIncrement, 0, Accel_MAX)
}
else
{
	if (rightAccel != 0)
	{
		rightAccel = rightAccel - AccelIncrement;
	}
}
	
	
if(KEY_LEFT)
{
	leftAccel = clamp(leftAccel - AccelIncrement, -1*Accel_MAX, 0)
}
else
{
	if (leftAccel != 0)
	{
		leftAccel = leftAccel + AccelIncrement;
	}
}

if(KEY_UP)
{
	upAccel = clamp(upAccel - AccelIncrement,-1*Accel_MAX, 0)
}
else
{
	if (upAccel != 0)
	{
		upAccel = upAccel + AccelIncrement;
	}
}
	
	
if(KEY_DOWN) || (grvswitch == 0 && (!place_meeting(x,y+1,obj_Wall))&&sign(vsp) = 1)
{
	downAccel = clamp(downAccel + AccelIncrement, 0, Accel_MAX)
}
else
{
	if (downAccel != 0)
	{
		downAccel = downAccel - AccelIncrement;
	}
}

//Movement system when gravity is down
if (grvswitch == 0)
{
	
	hsp = hmove * walksp + (leftAccel+rightAccel);
	if (vsp < 15){vsp += grv;}
	
	if (hmove != 0){lasthmove = hmove;}
	
	//unstuck
	if (place_meeting(x,y,obj_Wall))
	{
		if (obj_Wall.y > y)
		{
			while (place_meeting(x,y,obj_Wall))
			y -= 1
		}
		if (obj_Wall.y < y)
		{
			while (place_meeting(x,y,obj_Wall))
			y += 1
		}
		if (obj_Wall.x < x)
		{
			while (place_meeting(x,y,obj_Wall))
			x += 1
		}
		if (obj_Wall.x > x)
		{
			while (place_meeting(x,y,obj_Wall))
			x -= 1
		}	
	}
	
	

	//controls what happens when player takes damage
	if (global.player_TAKE_DAMAGE == 1)
	{
		tookdamage = 1;

		global.player_TAKE_DAMAGE = 0;
		if (global.gauge_PLAYER_HP > 0)
		{
			with (drawInst) {tookdamage = 1;}
			instance_create_depth(x+random_range(-25,25),y+random_range(-25,25),depth,obj_red_electricparticle)
			instance_create_depth(x+random_range(-25,25),y+random_range(-25,25),depth,obj_red_electricparticle)
			instance_create_depth(x+random_range(-25,25),y+random_range(-25,25),depth,obj_red_electricparticle)
			global.gauge_PLAYER_HP--;
			global.player_INVINCIBLE = 1;
			alarm[2] = I_FRAMES;
			
			bleed = 15;
			
			knockback = knockback_MAX;
			kbpush = kbpush_MAX
		}
	}
	
	if (wasHit == 1)
	{
		if (place_meeting(x,y+1,obj_Wall)) 
		{
			hasdived = 0;
			hasslammed = 4;
			wasHit = 0;
			
			var slamInst = instance_create_layer(x,y+16,"lay_Particles",obj_Spike_trailparticle3);
			slamInst.image_angle = 90;
				
			var stringInst1 = instance_create_layer(x,y+16,"lay_Spikes",obj_stringparticle);
			stringInst1.image_angle = 0;
			stringInst1.drawColor = c_aqua;
		
			var stringInst2 = instance_create_layer(x,y+16,"lay_Spikes",obj_stringparticle);
			stringInst2.image_angle = 0;
			stringInst2.drawColor = c_aqua;
			
			var stringInst3 = instance_create_layer(x,y+16,"lay_Spikes",obj_stringparticle);
			stringInst3.image_angle = 180;
			stringInst3.drawColor = c_aqua;
		
			var stringInst4 = instance_create_layer(x,y+16,"lay_Spikes",obj_stringparticle);
			stringInst4.image_angle = 180;
			stringInst4.drawColor = c_aqua;
				
			
		}
		
	}
	
	if (knockback > 0)
	{
		if (knockback = knockback_MAX)
		{
			vsp = -4;
			hsp = kbpush*kbxdir;
			wasHit = 1;
		}
		else
		{
			hsp = hsp/knockback + kbpush*kbxdir;
		}
		
		kbpush /= 1.2;
		
		
		
		knockback--;	
	}
	
	//Shooting system 
	if (KEY_SHOOTRIGHT) && (canshoot == 1)
	{
		shotright = 1; 
		global.spikedirection = 1;
		instance_create_layer(x,y-10, "lay_Spikes", obj_Spike);
		if(vsp > 1){vsp = 0;}
		
		hasshot = 1;
	}
	if (shotright)
	{
		rightAccel = 0;
		hsp = shotpush*-1;
		shotpush /= 1.2;
		if (shotpush < 1) {shotright = 0;shotpush = 10;}
	}
	
	if (KEY_SHOOTLEFT) && (canshoot == 1)
	{
		shotleft = 1;
		global.spikedirection = 3;
		instance_create_layer(x,y-10, "lay_Spikes", obj_Spike);
		if(vsp > 1){vsp = 0;}
		hasshot = 1;
	}
	if (shotleft)
	{
		leftAccel = 0;
		hsp = shotpush;
		shotpush /= 1.2;
		if (shotpush < 1) {shotleft = 0;shotpush = 10;}
		
	}
	
	if (KEY_SHOOTUP) && (shotup == 0) && (hasdived == 0) && (canshoot == 1) && (!place_meeting(x,y+1,obj_Wall))
	{
		global.spikedirection = 2;
		shotup = 1;
		instance_create_layer(x,y-10, "lay_Spikes", obj_Spike);
		hasshot = 1;
	}
	if (shotup > 0)
	{
		if (!place_meeting(x,y+1,obj_Wall))
		{
			hasdived = 1;
			hangtime = 8;
		}
		shotup = 0;
	}
	if (hasdived > 0)
	{
		if (hangtime > 0) {hsp = 2*hmove; vsp = 0; hangtime--;}
		if (hangtime == 0)
		{	
			vsp = 16;
			hsp = 0;
			if (place_meeting(x,y+1,obj_Wall))
			{
				hasdived = 0;
				hasslammed = 4;
				var slamInst = instance_create_layer(x,y+16,"lay_Particles",obj_Spike_trailparticle3);
				slamInst.image_angle = 90;
				
				var stringInst1 = instance_create_layer(x,y+16,"lay_Spikes",obj_stringparticle);
				stringInst1.image_angle = 0;
				stringInst1.drawColor = c_aqua;
		
				var stringInst2 = instance_create_layer(x,y+16,"lay_Spikes",obj_stringparticle);
				stringInst2.image_angle = 0;
				stringInst2.drawColor = c_aqua;
			
				var stringInst3 = instance_create_layer(x,y+16,"lay_Spikes",obj_stringparticle);
				stringInst3.image_angle = 180;
				stringInst3.drawColor = c_aqua;
		
				var stringInst4 = instance_create_layer(x,y+16,"lay_Spikes",obj_stringparticle);
				stringInst4.image_angle = 180;
				stringInst4.drawColor = c_aqua;
				
			}
		}
	}
	if (hasslammed > 0) //ground slam attack here
	{
		temphsp = abs(hsp);
		hsp = hmove*(clamp(temphsp-hasslammed,0,90));
		hasslammed -= 0.2;
		cantjump = 1;
	}
	if (hasslammed < 3) {cantjump = 0;}
	
	if (KEY_SHOOTDOWN) && (canshoot == 1)
	{	
		global.spikedirection = 4;
		instance_create_layer(x,y-10, "lay_Spikes", obj_Spike);
		vsp = -8;
		hasshot = 1;
	}
	
	//Jumping system
	if (place_meeting(x,y+1,obj_Wall)) && other.KEY_JUMP && (other.cantjump = 0) //only can jump when on floor
	{
		instance_create_depth(x,y-5,depth,obj_Player_jumpparticle);
			
		var stringInst1 = instance_create_layer(x,y+5,"lay_Spikes",obj_stringparticle);
		stringInst1.image_angle = 90;
		stringInst1.drawColor = c_aqua;
		
		var stringInst2 = instance_create_layer(x+10,y+5,"lay_Spikes",obj_stringparticle);
		stringInst2.image_angle = 90;
		stringInst2.drawColor = c_aqua;
		
		var stringInst3 = instance_create_layer(x-10,y+5,"lay_Spikes",obj_stringparticle);
		stringInst3.image_angle = 90;
		stringInst3.drawColor = c_aqua;
		
		var stringInst4 = instance_create_layer(x-5,y+5,"lay_Spikes",obj_stringparticle);
		stringInst4.image_angle = 90;
		stringInst4.drawColor = c_aqua;
		
		var stringInst5 = instance_create_layer(x-5,y+5,"lay_Spikes",obj_stringparticle);
		stringInst5.image_angle = 90;
		stringInst5.drawColor = c_aqua;
		
		other.vsp = -13;
	}

	//horizontal collision for obj_Wall
	if (place_meeting(x+hsp,y,obj_Wall))
	{
		while (!place_meeting(x+sign(hsp),y,obj_Wall))
		{
			x += sign(hsp);
		}
		hsp = 0;
	}
	
	//horizontal collision for obj_ShieldEnemy
	if (place_meeting(x+hsp,y,obj_ShieldEnemy))
	{
		while (!place_meeting(x+sign(hsp),y,obj_ShieldEnemy))
		{
			x += sign(hsp);
		}
		hsp = 0;
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
	
	x += hsp;
	
	//vertical collision for obj_Wall

	if (place_meeting(x,y+vsp,obj_Wall))
	{
		while (!place_meeting(x,y+sign(vsp),obj_Wall))
		{
			y += sign(vsp);
		}
		vsp = 0;
	}

	//vertical collision for obj_ShieldEnemy

	if (place_meeting(x,y+vsp,obj_ShieldEnemy))
	{
		while (!place_meeting(x,y+sign(vsp),obj_ShieldEnemy))
		{
			y += sign(vsp);
		}
		vsp = 0;
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
			if (WallInst.vsp <vsp)
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
	
	y += vsp;
	
}

//Movement system when gravity is out
if (grvswitch == 1)
{
	wasHit = 0;
	
	hsp = hmove * walksp + (leftAccel+rightAccel);
	vsp = vmove * walksp + (upAccel+downAccel);;
	
	if (hmove != 0) || (vmove != 0) {lasthmove = hmove; lastvmove = vmove;}
	
	//keeps player from being stuck when diagonal near wall
	//if (place_meeting(x,y,obj_Wall))
	//{
	//	if (obj_Wall.y > y)
	//	{
	//		while (place_meeting(x,y,obj_Wall))
	//		y -= 1
	//	}
	//	if (obj_Wall.y < y)
	//	{
	//		while (place_meeting(x,y,obj_Wall))
	//		y += 1
	//	}
	//	if (obj_Wall.x < x)
	//	{
	//		while (place_meeting(x,y,obj_Wall))
	//		x += 1
	//	}
	//	if (obj_Wall.x > x)
	//	{
	//		while (place_meeting(x,y,obj_Wall))
	//		x -= 1
	//	}	
	//}
	
	//!Sprite Control OUT!
	if (hmove == 1 && vmove == 0) {lookdirection = 0;}
	if (hmove == 1 && vmove == -1) {lookdirection = 45;}
	if (hmove == 0 && vmove == -1) {lookdirection = 90;}
	if (hmove == -1 && vmove == -1) {lookdirection = 135;}
	if (hmove == -1 && vmove == 0) {lookdirection = 180;}
	if (hmove == -1 && vmove == 1) {lookdirection = 225;}
	if (hmove == 0 && vmove == 1) {lookdirection = 270;}
	if (hmove == 1 && vmove == 1) {lookdirection = 315;}
	
	//controls what happens when player takes damage
	if (global.player_TAKE_DAMAGE == 1)
	{
		tookdamage = 1;
		global.player_TAKE_DAMAGE = 0;
		if (global.gauge_PLAYER_HP > 0)
		{
			with (drawInst) {tookdamage = 1;}
			instance_create_depth(x+random_range(-25,25),y+random_range(-25,25),depth,obj_red_electricparticle)
			instance_create_depth(x+random_range(-25,25),y+random_range(-25,25),depth,obj_red_electricparticle)
			instance_create_depth(x+random_range(-25,25),y+random_range(-25,25),depth,obj_red_electricparticle)
			global.gauge_PLAYER_HP--;
			global.player_INVINCIBLE = 1;
			alarm[2] = I_FRAMES;
			knockback = knockback_MAX;
			kbpush = kbpush_MAX
			bleed = 15;
		}
	}
	
	if (knockback > 0)
	{
		if (knockback = knockback_MAX)
		{
			vsp = kbpush*kbydir;
			hsp = kbpush*kbxdir;
		}
		else
		{
			hsp = hsp/knockback + kbpush*kbxdir;
			vsp = vsp/knockback + kbpush*kbydir;
		}
		
		kbpush /= 1.2;
		
		knockback--;	
	}
	
	canswitch = 1;
	
	//Blinking system
	if (KEY_JUMP) && (global.gauge_PLAYER_BLINKS > 0)
		{	
			canswitch = 0;
			
			blinkedthisstep = 1;
			instance_create_depth(x,y,depth+1,obj_Player_blinkInParticle)
			wasonfloor = 0;
			blinkhmove = lasthmove;
			blinkvmove = lastvmove;
			
			hasblinked = 10;
			if (blinkhmove != 0) && (blinkvmove != 0) {hasblinked = 6;}
			
			blinkhold = 20;
			
			hsp = 0;
			vsp = 0;
			
			//start cooldown
			global.gauge_PLAYER_BLINKS--;
			alarm[1] = blinkcd_MAX;
		}
	//movement during blink
	if (hasblinked > 0) 
		{	
			canswitch = 0;
			global.player_INVINCIBLE = 1;
			
			drawInst.image_alpha = 0;
			
			//setup booleans
			if (overgap == 1) {wasonfloor = 1;}
			
			//Stops player if they hit a ledge after blinking over gap
			if (overgap == 0) && (wasonfloor == 1){global.player_INVINCIBLE = 0;hasblinked = 0;drawInst.image_alpha = 1;/*instance_create_depth(x,y,depth+1,obj_Player_blinkoutParticle)*/}
			
			//Horiz collision while blinking
			if (place_meeting(x+(blinkhmove*blinkdist),y,obj_Wall))
			{
				while (!place_meeting(x+sign(blinkhmove*blinkdist),y,obj_Wall))
				{
					x+=sign(blinkhmove*blinkdist);
				}
				blinkhmove = 0;
				hasblinked = 0;
				//instance_create_depth(x,y,depth+1,obj_Player_blinkoutParticle)
				drawInst.image_alpha = 1;
				global.player_INVINCIBLE = 0;
			}
			
			//Vertical collision while blinking
			if (place_meeting(x,y+(blinkvmove*blinkdist),obj_Wall))
			{
				while (!place_meeting(x,y+sign(blinkvmove*blinkdist),obj_Wall))
				{
					y+=sign(blinkvmove*blinkdist);
				}
				blinkvmove = 0;	
				hasblinked = 0;
				//instance_create_depth(x,y,depth+1,obj_Player_blinkoutParticle)
				drawInst.image_alpha = 1;
				global.player_INVINCIBLE = 0;
			}
			
			//Horiz collision while blinking for shield
			if (place_meeting(x+(blinkhmove*blinkdist),y,obj_ShieldEnemy))
			{
				while (!place_meeting(x+sign(blinkhmove*blinkdist),y,obj_ShieldEnemy))
				{
					x+=sign(blinkhmove*blinkdist);
				}
				blinkhmove = 0;
				hasblinked = 0;
				//instance_create_depth(x,y,depth+1,obj_Player_blinkoutParticle)
				drawInst.image_alpha = 1;
				global.player_INVINCIBLE = 0;
			}
			
			//Vertical collision while blinking for shield
			if (place_meeting(x,y+(blinkvmove*blinkdist),obj_ShieldEnemy))
			{
				while (!place_meeting(x,y+sign(blinkvmove*blinkdist),obj_ShieldEnemy))
				{
					y+=sign(blinkvmove*blinkdist);
				}
				blinkvmove = 0;	
				hasblinked = 0;
				//instance_create_depth(x,y,depth+1,obj_Player_blinkoutParticle)
				drawInst.image_alpha = 1;
				global.player_INVINCIBLE = 0;
			}
			
			
			
			
			hsp = 0;
			vsp = 0;
			
			
			
			x += blinkhmove * blinkdist;
			y += blinkvmove * blinkdist;
			
			
			
			instance_create_depth(x,y,depth+1,obj_aqua_electricparticle);
			
			hasblinked--;
			if (hasblinked == 0){global.player_INVINCIBLE = 0;drawInst.image_alpha = 1; /*instance_create_depth(x,y,depth+1,obj_Player_blinkoutParticle);*/}
		}
	//hold after blink
	if (hasblinked < 1) && (blinkhold > 0)
		{	
			
			
			blinkhold--;
			if (!collision_point(x,y,obj_Floor,false,false)) // only holds you in place if you blink off floor
			{
				canswitch = 0;
				hsp = 0;
				vsp = 0;
				
				//Horiz collision while blinking
				if (place_meeting(x+(blinkhmove),y,obj_Wall))
				{
					blinkhmove = 0;
					hasblinked = 0;
					global.player_INVINCIBLE = 0;
				}
			
				//Vertical collision while blinking
				if (place_meeting(x,y+(blinkvmove),obj_Wall))
				{
					blinkvmove = 0;	
					hasblinked = 0;
					global.player_INVINCIBLE = 0;
				}
				
				//Horiz collision while blinking
				if (place_meeting(x+(blinkhmove),y,obj_ShieldEnemy))
				{
					blinkhmove = 0;
					hasblinked = 0;
					global.player_INVINCIBLE = 0;
				}
			
				//Vertical collision while blinking
				if (place_meeting(x,y+(blinkvmove),obj_ShieldEnemy))
				{
					blinkvmove = 0;	
					hasblinked = 0;
					global.player_INVINCIBLE = 0;
				}
				
				x += blinkhmove;
				y += blinkvmove;
			}
			if (blinkhold == 0 && !collision_point(x,y,obj_Floor,false,false)) {instance_create_layer(x,y,"lay_Particles",obj_Player_switch_downparticle);}
		}
	
	//SHOOTING system
	if (KEY_SHOOTRIGHT) && (canshoot == 1)
	{
		shotright = 1; 
		global.spikedirection = 1;
		instance_create_layer(x,y, "lay_Spikes", obj_Spike);
		hasshot = 1;
	}
	if (shotright)
	{
		rightAccel = 0;
		hsp = shotpush*-1;
		shotpush /= 1.2;
		if (shotpush < 1) {shotright = 0;shotpush = 10;}
		if (collision_point(x,y,obj_Floor,false,false)) {lookdirection = 0;}
	}
	
	if (KEY_SHOOTLEFT) && (canshoot == 1)
	{
		shotleft = 1; 
		global.spikedirection = 3;
		instance_create_layer(x,y, "lay_Spikes", obj_Spike);
		hasshot = 1;
	}
	if (shotleft)
	{
		leftAccel = 0;
		hsp = shotpush;
		shotpush /= 1.2;
		if (shotpush < 1) {shotleft = 0;shotpush = 10;}
		if (collision_point(x,y,obj_Floor,false,false)) {lookdirection = 180;}
	}
	
	if (KEY_SHOOTUP) && (canshoot == 1)
	{
		shotup = 1; 
		global.spikedirection = 2;
		instance_create_layer(x,y, "lay_Spikes", obj_Spike);
		hasshot = 1;
	}
	if (shotup)
	{
		upAccel = 0;
		vsp = shotpush;
		shotpush /= 1.2;
		if (shotpush < 1) {shotup = 0;shotpush = 10;}
		if (collision_point(x,y,obj_Floor,false,false)) {lookdirection = 90;}
	}
	
	if (KEY_SHOOTDOWN) && (canshoot == 1)
	{
		shotdown = 1; 
		global.spikedirection = 4;
		instance_create_layer(x,y, "lay_Spikes", obj_Spike);
		hasshot = 1;
	}
	if (shotdown)
	{
		downAccel = 0;
		vsp = shotpush*-1;
		shotpush /= 1.2;
		if (shotpush < 1) {shotdown = 0;shotpush = 10;}
		if (collision_point(x,y,obj_Floor,false,false)) {lookdirection = 270;}
	}
	
		//horizontal collision for obj_Wall
	if (place_meeting(x+hsp,y,obj_Wall))
	{
		while (!place_meeting(x+sign(hsp),y,obj_Wall))
		{
			x += sign(hsp);
		}
		hsp = 0;
	}
	
	//horizontal collision for obj_ShieldEnemy
	if (place_meeting(x+hsp,y,obj_ShieldEnemy))
	{
		while (!place_meeting(x+sign(hsp),y,obj_ShieldEnemy))
		{
			x += sign(hsp);
		}
		hsp = 0;
	}
	
	//horiz edge detect; prevent unfair falling
	if (!collision_point(x+hsp,y,obj_Floor,false,false))
	{
		while (collision_point(x+sign(hsp),y,obj_Floor,false,false)){x+=sign(hsp);}
		hsp = 0;
	}
	
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
	
	x += hsp;


	//vertical collision for obj_Wall
	if (place_meeting(x,y+vsp,obj_Wall))
	{
		while (!place_meeting(x,y+sign(vsp),obj_Wall))
		{
			y += sign(vsp);
		}
		vsp = 0;
	}
	
	//vertical collision for obj_ShieldEnemy
	if (place_meeting(x,y+vsp,obj_ShieldEnemy))
	{
		while (!place_meeting(x,y+sign(vsp),obj_ShieldEnemy))
		{
			y += sign(vsp);
		}
		vsp = 0;
	}
	
	//vert edge detect; prevent unfair falling
	if (!collision_point(x,y+vsp,obj_Floor,false,false))
	{
		while (collision_point(x,y+sign(vsp),obj_Floor,false,false)){y+=sign(vsp);}
		vsp = 0;
	}
	
	//unstuck code
	
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
	y += vsp;

}

playerLastX = x;
playerLastY = y;

if (alarm[2] > 0) {global.player_INVINCIBLE = 1;}

if (hasshot == 1) 
{
	global.gauge_PLAYER_SPIKES--
	alarm[0] = spikecd_MAX;
}

if (bleed > 0)
{
	instance_create_depth(x+random_range(-10,10),y+random_range(-10,10),depth,obj_red_electricparticle)
	bleed--;	
}


if (global.player_HAS_DIED == 1)
{
	instance_destroy(obj_Player_HUD_BLINKS);
	instance_destroy(obj_Player_HUD_HP);
	instance_destroy(obj_Player_HUD_SPIKES);
	instance_destroy(obj_drawPlayer);
	instance_destroy();
	instance_create_layer(x,y,"lay_Particles", obj_Player_deathparticle);
	instance_create_layer(x,y,"lay_Player", obj_Player_dead);
}

if (hasblinked > 0) 
{	
	var TrailInst = instance_create_depth(x,y,depth+1,obj_cyan_trail)
	TrailInst.lastX = prevX;
	TrailInst.lastY = prevY;
}

var _cam_x = camera_get_view_x(view_camera[0]) ;
layer_x("BG_back", _cam_x * 0.5); 
var _cam_y = camera_get_view_y(view_camera[0]) ;
layer_y("BG_back", _cam_y * 0.5); 

prevX = x;
prevY = y;

