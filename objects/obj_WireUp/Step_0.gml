if(instance_place(x,y, obj_Emitter))
{
	inputInst = instance_place(x,y, obj_Emitter);
	switch (inputInst.wiring_SIGNAL)
	{
		case 0:
			image_index = 0;
			with (outputInst) {wiring_SIGNAL = 0;}
			break
		case 1:
			image_index = 1;
			with (outputInst) {wiring_SIGNAL = 1;}
			break
	}
}
else
{
	image_index = 0;
	with (outputInst) {wiring_SIGNAL = 0;}
}

if (inputInst.wiring_SIGNAL != lastframesignal)
{
	switch (inputInst.wiring_SIGNAL)
	{
		case 0:
			break
		case 1:
			instance_create_depth(x+random_range(5,-5),y+random_range(5,-5),depth,obj_aqua_electricparticle);
			break
	}
	
	image_alpha = alpha_max;
	outputInst.image_alpha = alpha_max;
	fade = fade_max;
}

if (fade > 0)
{
	image_alpha -= .01
	outputInst.image_alpha -= .01;
	
	fade--;	
}

if (fade == 0)
{
	image_alpha = alpha_min;
	outputInst.image_alpha = alpha_min;
}

lastframesignal = inputInst.wiring_SIGNAL;