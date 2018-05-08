whichParticle = irandom_range(0,2)
if (spikehsp != 0 || spikevsp != 0)
{
	var frameTrailInst = instance_create_depth(x,y,depth,obj_Spike_trail);
	frameTrailInst.lastX = x - spikehsp;
	frameTrailInst.lastY = y - spikevsp;
	instance_create_depth(x,y,depth,obj_Spike_trailparticle2)
}

spikehsp = spikespeed*spikehmove;
spikevsp = spikespeed*spikevmove;

if (collision_point(x+spikehsp,y,obj_Wall,false,false))
{
	while (!collision_point(x+sign(spikehsp),y,obj_Wall,false,false))
	{ x+=sign(spikehsp);}
	spikehsp = 0;
	sprite_index = spr_Spike_static;
	
}

if (collision_point(x,y+spikevsp,obj_Wall,false,false))
{
	while (!collision_point(x,y+sign(spikevsp),obj_Wall,false,false))
	{ y+=sign(spikevsp);}
	spikevsp = 0;
	sprite_index = spr_Spike_static;
	
}

if (place_meeting(x,y,obj_Shield))
{
	deflected = 1;
	instance_create_depth(x,y,depth,obj_Spike_deflected);
	instance_destroy();
}



x+=spikehsp;
y+=spikevsp;

spikelifetime--;

if (spikelifetime < 1) {instance_destroy();}
	