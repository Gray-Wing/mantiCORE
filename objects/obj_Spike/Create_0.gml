spikespeed = 20;
spikelifetime = 360;

spikehmove = 0;
spikevmove = 0;

deflected = 0;

spikehsp = 0;
spikevsp = 0;

whichParticle = 0;

instance_create_layer(x,y,"lay_Particles",obj_Spike_shoot_particle);

switch (global.spikedirection)
	{
		case 1: {spikehmove = 1; spikevmove = 0; image_angle = 0; break;}
		case 2: {spikehmove = 0; spikevmove = -1; image_angle = 90; break;}
		case 3: {spikehmove = -1; spikevmove = 0; image_angle = 180; break;}
		case 4: {spikehmove = 0; spikevmove = 1; image_angle = 270; break;}
	}