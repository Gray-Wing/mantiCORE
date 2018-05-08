
if(instance_place(x,y, obj_Emitter))
{
	inputInst = instance_place(x,y, obj_Emitter);
	switch (inputInst.wiring_SIGNAL)
	{
		case 0:
			image_index = 0;
			wiring_SIGNAL = 0;
			break
		case 1:
			image_index = 1;
			wiring_SIGNAL = 1;
			break
	}
}