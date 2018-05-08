if (place_meeting(x,y, obj_Spike))
{
	if (global.spikedirection == 1) {moveright = 1;}
	if (global.spikedirection == 3) {moveleft = 1;}
	with (obj_Spike) {instance_destroy();}
}

hsp = 0;

//move box right if hit by spike thats moving right
if(moveright == 1)
{
	moveright = 0;
	movingright = MOVE_DIST/4;	
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
}
if(movingleft > 0)
{
	hsp = -4;
	movingleft--;
}


vsp += grv;

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

//horizontal collision for obj_boxWall
if (place_meeting(x+hsp,y,obj_boxWall))
{
	while (!place_meeting(x+sign(hsp),y,obj_boxWall))
	{
		x += sign(hsp);
	}
	hsp = 0;
}

//vertical collision for obj_boxWall
if (place_meeting(x,y+vsp,obj_boxWall))
{
	while (!place_meeting(x,y+sign(vsp),obj_boxWall))
	{
		y += sign(vsp);
	}
	vsp = 0;
}

y += vsp;
x += hsp;
