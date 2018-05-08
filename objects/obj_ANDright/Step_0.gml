inputInst = instance_place(x,y, obj_Emitter);

topInputInst.image_angle = image_angle;
botInputInst.image_angle = image_angle;
outputInst.image_angle = image_angle;

if (botInputInst.wiring_SIGNAL == 1 && topInputInst.wiring_SIGNAL == 1)
{
	image_index = 1;
	with (outputInst) {wiring_SIGNAL = 1;}
}
else
{
	image_index = 0;
	with (outputInst) {wiring_SIGNAL = 0;}
}

if (outputInst.wiring_SIGNAL != lastframesignal)
{
	switch (outputInst.wiring_SIGNAL)
	{
		case 0:
			break
		case 1:
			instance_create_depth(x+random_range(5,-5),y+random_range(5,-5),depth,obj_aqua_electricparticle);
			break
	}
	
	image_alpha = alpha_max;
	outputInst.image_alpha = alpha_max;
	botInputInst.image_alpha = alpha_max;
	topInputInst.image_alpha = alpha_max;
	
	fade = fade_max;
}

if (fade > 0)
{
	image_alpha -= .01
	outputInst.image_alpha -= .01;
	botInputInst.image_alpha -= .01;
	topInputInst.image_alpha -= .01;
	
	fade--;	
}

if (fade == 0)
{
	image_alpha = alpha_min;
	outputInst.image_alpha = alpha_min;
	botInputInst.image_alpha = alpha_min;
	topInputInst.image_alpha = alpha_min;
}

lastframesignal = outputInst.wiring_SIGNAL;
