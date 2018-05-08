if (place_meeting(x,y, obj_Spike))
{
	if (global.spikedirection == 1) {moveright = 1;}
	if (global.spikedirection == 3) {moveleft = 1;}
	if (global.spikedirection == 2) {moveup = 1;}
	if (global.spikedirection == 4) {movedown = 1;}
	with (obj_Spike) {instance_destroy();}
}

vsp = 0;
hsp = 0;

//move box right if hit by spike thats moving right
if(moveright == 1)
{
	moveright = 0;
	movingright = MOVE_DIST/4;
	if (!(place_meeting(x+MOVE_DIST,y,obj_Floor)||place_meeting(x+MOVE_DIST,y,obj_boxFloor))) {movingright = 0;}
}
if(movingright > 0)
{
	hsp = 4;
	movingright--;
}

//left move
if(moveleft == 1)
{
	moveleft = 0;
	movingleft = MOVE_DIST/4;	
	if (!(place_meeting(x-MOVE_DIST,y,obj_Floor)||place_meeting(x-MOVE_DIST,y,obj_boxFloor))) {movingleft = 0;}
}
if(movingleft > 0)
{
	hsp = -4;
	movingleft--;
}

//up move
if(moveup == 1)
{
	moveup = 0;
	movingup = MOVE_DIST/4;	
	if (!(place_meeting(x,y-MOVE_DIST,obj_Floor)||place_meeting(x,y-MOVE_DIST,obj_boxFloor))) {movingup = 0;}
}
if(movingup > 0)
{
	vsp = -4;
	movingup--;
}

//down move
if(movedown == 1)
{
	movedown = 0;
	movingdown = MOVE_DIST/4;	
	if (!(place_meeting(x,y+MOVE_DIST,obj_Floor)||place_meeting(x,y+MOVE_DIST,obj_boxFloor))) {movingdown = 0;}
}
if(movingdown > 0)
{
	vsp = 4;
	movingdown--;
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

//vertical collision for obj_Wall
if (place_meeting(x,y+vsp,obj_Wall))
{
	while (!place_meeting(x,y+sign(vsp),obj_Wall))
	{
		y += sign(vsp);
	}
	vsp = 0;
}


y += vsp;
x += hsp;
